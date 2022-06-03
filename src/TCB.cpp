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

TCB::TCB() {
    ssp = (uint64) (kernelStack + DEFAULT_STACK_SIZE);
}

TCB::TCB(TCB::Body body, void *args, uint64 *threadStack, bool privileged, bool start) :
        body(body), args(args),
        threadStack(threadStack),
        privileged(privileged),
        context({(uint64) threadWrapper, (uint64) (threadStack + DEFAULT_STACK_SIZE)}),
        status(start ? READY : WAITING),
        ssp((uint64) (kernelStack + DEFAULT_STACK_SIZE)) {
}

TCB *TCB::createKernelThread(TCB::Body body, void *args, bool start) {
    if (!body) return nullptr;
    auto *threadStack = (uint64 *) kmalloc(byteToBlocks(stackByteSize));
    return createKernelThread(body, args, threadStack, start);
}

TCB *TCB::createUserThread(TCB::Body body, void *args, bool start) {
    if (!body) return nullptr;
    auto *threadStack = (uint64 *) kmalloc(byteToBlocks(stackByteSize));
    return createUserThread(body, args, threadStack, start);
}

TCB *TCB::createKernelThread(TCB::Body body, void *args, uint64 *threadStack, bool start) {
    if (!body) return nullptr;

    TCB *tcb = new TCB(body, args, threadStack, true, start);
    if (start) Scheduler::getInstance()->put(tcb);

    return tcb;
}

TCB *TCB::createUserThread(TCB::Body body, void *args, uint64 *threadStack, bool start) {
    if (!body) return nullptr;

    TCB *tcb = new TCB(body, args, threadStack, false, start);
    if (start) Scheduler::getInstance()->put(tcb);

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

    ThreadCollector::getInstance()->put(running);

    dispatch();
}

void TCB::dispatch() {
    lock()
    TCB *old = running;

    if (old->isReady()) {
        Scheduler::getInstance()->put(old);
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
    if (isFinished()) return 0;

    mutex.wait();

    running->setBlocked();
    waitingToJoin.addLast(&running->listNode);

    mutex.signal();

    return 0;
}

TCB::~TCB() {
    kfree(kernelStack);
    kfree(threadStack);
}
