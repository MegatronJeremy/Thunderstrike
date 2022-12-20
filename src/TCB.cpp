#include "../h/TCB.hpp"
#include "../h/Riscv.hpp"
#include "../h/ThreadCollector.hpp"
#include "../h/Scheduler.hpp"
#include "../h/IdleThread.hpp"
#include "../h/syscall_c.h"

TCB *TCB::running = nullptr;

TCB *TCB::userMain = nullptr;

uint64 TCB::ID = 0;

uint64 TCB::offsSSP = OFFSETOF(TCB, ssp);

uint64 TCB::timeSliceCounter = 0;

size_t TCB::stackByteSize = DEFAULT_STACK_SIZE * sizeof(uint64);

void TCB::initTCB(TCB::Body b, void *a, uint64 *tS, bool priv, Type t) {
    body = b;

    args = a;

    threadStack = tS;

    privileged = priv;

    type = t;

    context = {(uint64) threadWrapper, (uint64) (tS + DEFAULT_STACK_SIZE)};

    status = WAITING;

    kernelStack = (uint64 *) kmalloc(stackByteSize);

    listNode = ListNode<TCB>::createListNode(this);
    hashNode = LinkedHashNode<TCB>::createLinkedHashNode(this, id);
    waitingToJoin = LinkedList<TCB>::createObj();
}

void TCB::defaultDtor() {
    body = nullptr;
    args = nullptr;

    mfree(threadStack);
    threadStack = nullptr;

    privileged = true;

    context = {0, 0};

    priority = 1;

    status = READY;

    ssp = (uint64) (kernelStack + DEFAULT_STACK_SIZE);

    type = KERNEL;

    kfree(kernelStack);
    kernelStack = nullptr;

    ListNode<TCB>::deleteObj(listNode);
    LinkedHashNode<TCB>::deleteObj(hashNode);
    LinkedList<TCB>::deleteObj(waitingToJoin);

    listNode = nullptr;
    hashNode = nullptr;
    waitingToJoin = nullptr;
}

TCB *TCB::createKernelThread() {
    return createObj();
}

TCB *TCB::createThread(TCB::Body body, void *args, Type type, bool start) {
    if (!body) return nullptr;
    auto *threadStack = (uint64 *) mmalloc(byteToBlocks(stackByteSize));
    return createThread(body, args, threadStack, type, start);
}

TCB *TCB::createThread(TCB::Body body, void *args, uint64 *threadStack, Type type, bool start) {
    if (!body) return nullptr;

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
    if (!tcb) return nullptr;

    tcb->initTCB(body, args, threadStack, prMode, type);

    if (start) TCB::start(tcb);

    return tcb;
}

int TCB::start(TCB *tcb) {
    if (!tcb->isWaiting()) return -1;

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

    TCB::contextSwitch(&old->context, &running->context);

    unlock()
}

void TCB::threadWrapper() {
    Riscv::popSppSpie(running->privileged);
    running->body(running->args);

    thread_exit();
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

