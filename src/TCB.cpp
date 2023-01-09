#include "../h/TCB.hpp"
#include "../h/Riscv.hpp"
#include "../h/ThreadCollector.hpp"
#include "../h/Scheduler.hpp"
#include "../h/IdleThread.hpp"
#include "../h/syscall_c.h"
#include "../h/MemoryAllocator.hpp"

TCB *TCB::running = nullptr;

TCB *TCB::userMain = nullptr;

int TCB::ID = 0;

uint64 TCB::offsSSP = OFFSETOF(TCB, ssp);

uint64 TCB::timeSliceCounter = 0;

size_t TCB::stackByteSize = DEFAULT_STACK_SIZE * sizeof(uint64);

int TCB::initTCB(TCB::Body b, void *a, uint64 *tS, bool priv, Type t) {
    body = b;

    args = a;

    threadStack = tS;

    kernelStack = (uint64 *) kmalloc(stackByteSize);

    if (kernelStack == nullptr) return -1;

    ssp = (uint64) (kernelStack + DEFAULT_STACK_SIZE);

    privileged = priv;

    type = t;

    if (body != nullptr) {
        context[1] = (uint64) threadWrapper;
        context[2] = (uint64) (tS + DEFAULT_STACK_SIZE);
    }

    status = AWAITING_START;

    return 0;
}

TCB *TCB::createObj(TCB::Body body, void *args, Type type, bool start) {
    auto *threadStack = (uint64 *) kmalloc(stackByteSize);

    TCB *tcb = createObj(body, args, threadStack, type, start);

    return tcb;
}

TCB *TCB::createObj(TCB::Body body, void *args, uint64 *threadStack, Type type, bool start) {
    bool prMode;
    switch (type) {
        case (KERNEL):
        case (CONSOLE):
            prMode = true;
            break;
        case (USER):
        default:
            prMode = false;
            break;
    }

    TCB *tcb = createObj();
    if (!tcb) {
        MemoryAllocator::mfree(threadStack);
        return nullptr;
    }

    if (tcb->initTCB(body, args, threadStack, prMode, type) < 0) {
        tcb->deleteObj();
        return nullptr;
    }

    if (start) TCB::start(tcb);

    return tcb;
}

void TCB::deleteObj() {
    body = nullptr;
    args = nullptr;

    if (type == USER) {
        MemoryAllocator::mfree(threadStack);
    } else {
        kfree(threadStack);
    }
    threadStack = nullptr;

    privileged = true;

    String::memset(context, 0, sizeof(*context) * REG_NUM);

    kfree(kernelStack);
    kernelStack = nullptr;

    ssp = 0;

    priority = 1;

    status = READY;

    type = KERNEL;

    KObject<TCB>::deleteObj();
}

int TCB::start(TCB *tcb) {
    if (!tcb->isAwaitingStart()) return -1;

    tcb->setReady();
    Scheduler::put(tcb);

    return 0;
}

void TCB::exit() {
    DummyMutex dummy(running->mutex);

    running->setFinished();

    while (!running->waitingToJoin->isEmpty()) {
        TCB *thr = running->waitingToJoin->removeFirst();
        thr->setReady();
        Scheduler::put(thr);
    }

    ThreadCollector::put(running);

    dispatch();
}

void TCB::dispatch(bool wasBlocked) {
    lock()
    TCB *old = running;

    if (old->isReady()) {
        Scheduler::put(old, wasBlocked);
    }

    running = Scheduler::get();

    if (!running) {
        running = IdleThread::getIdleThread();
    }

    TCB::timeSliceCounter = 0;

    TCB::contextSwitch(old->context, running->context);

    unlock()
}

void TCB::threadWrapper() {
    Riscv::popSppSpie(running->privileged);
    running->body(running->args);

    if (!running->isPrivileged())
        thread_exit();
    else
        TCB::exit();
}

int TCB::join() const {
    DummyMutex dummy(mutex);

    if (isFinished()) {
        return 0;
    }

    running->setBlocked();
    waitingToJoin->addLast(running->listNode);

    return 0;
}

TCB::~TCB() {
    kfree(context);
    listNode->deleteObj();
    entry->deleteObj();
    waitingToJoin->deleteObj();
    mutex->deleteObj();
}
