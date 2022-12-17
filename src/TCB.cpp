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

Cache *TCB::tcbCache = nullptr;

TCB::TCB() {
    ssp = (uint64) (kernelStack + DEFAULT_STACK_SIZE);
}

TCB::TCB(TCB::Body body, void *args, uint64 *threadStack, bool privileged, Type type) :
        body(body), args(args),
        threadStack(threadStack),
        privileged(privileged),
        context({(uint64) threadWrapper, (uint64) (threadStack + DEFAULT_STACK_SIZE)}),
        status(WAITING),
        ssp((uint64) (kernelStack + DEFAULT_STACK_SIZE)),
        type(type) {
}

TCB *TCB::createThread(TCB::Body body, void *args, Type type, bool start) {
    if (!body) return nullptr;
    auto *threadStack = (uint64 *) kmalloc(byteToBlocks(stackByteSize));
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
            prMode = false;
            break;
        default:
            // invalid thread type
            // mfree(threadStack)
            return nullptr;
    }

    TCB *tcb = new TCB(body, args, threadStack, prMode, KERNEL);
    if (start) TCB::start(tcb);

    return tcb;
}

int TCB::start(TCB *tcb) {
    if (!tcb->isWaiting()) return -1;

    tcb->setReady();
    Scheduler::getInstance()->put(tcb);

    return 0;
}

void TCB::exit() {
    running->mutex.wait();

    running->setFinished();

    while (!running->waitingToJoin.isEmpty()) {
        TCB *thr = running->waitingToJoin.removeFirst();
        thr->setReady();
        Scheduler::getInstance()->put(thr);
    }

    running->mutex.signal();

    ThreadCollector::put(running);

    dispatch();
}

void TCB::dispatch(bool wasBlocked) {
    lock()
    TCB *old = running;

    if (old->isReady()) {
        Scheduler::getInstance()->put(old, wasBlocked);
    }

    running = Scheduler::getInstance()->get();

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

int TCB::join() {
    mutex.wait();

    if (isFinished()) {
        mutex.signal();
        return 0;
    }

    running->setBlocked();
    waitingToJoin.addLast(&running->listNode);

    mutex.signal();

    return 0;
}

TCB::~TCB() {
    kfree(kernelStack);
    kfree(threadStack);
}

void *TCB::operator new(size_t) {
    if (!tcbCache) tcbCache = new Cache("tcb", sizeof(TCB));

    return tcbCache->allocate();
}

void TCB::operator delete(void *obj) {
    tcbCache->free(obj);
}

