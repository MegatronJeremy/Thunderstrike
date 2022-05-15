#include "../h/TCB.h"
#include "../h/Riscv.h"
#include "../h/ThreadCollector.h"
#include "../h/Scheduler.h"
#include "../h/IdleThread.h"

TCB *TCB::running = nullptr;

uint64 TCB::timeSliceCounter = 0;

uint64 TCB::offsSSP = OFFSETOF(TCB, ssp);

TCB::TCB() {
    ssp = (uint64) (kernelStack + DEFAULT_STACK_SIZE);
}

TCB::TCB(TCB::Body body, void *args, uint64 *threadStack, bool privileged) :
        body(body), args(args),
        threadStack(threadStack),
        privileged(privileged),
        context({(uint64) threadWrapper, (uint64) (threadStack + DEFAULT_STACK_SIZE)}) {
    ssp = (uint64) (kernelStack + DEFAULT_STACK_SIZE);
    Scheduler::put(this);
}

TCB *TCB::createKernelThread(TCB::Body body, void *args) {
    if (!body) return nullptr;
    auto *threadStack = (uint64 *) kmalloc(DEFAULT_STACK_SIZE);
    return createKernelThread(body, args, threadStack);
}

TCB *TCB::createUserThread(TCB::Body body, void *args) {
    if (!body) return nullptr;
    auto *threadStack = (uint64 *) kmalloc(DEFAULT_STACK_SIZE);
    return createUserThread(body, args, threadStack);
}

TCB *TCB::createKernelThread(TCB::Body body, void *args, uint64 *threadStack) {
    if (!body) return nullptr;
    return new TCB(body, args, threadStack, true);
}

TCB *TCB::createUserThread(TCB::Body body, void *args, uint64 *threadStack) {
    if (!body) return nullptr;
    return new TCB(body, args, threadStack, false);
}

void TCB::exit() {
    running->setFinished();

    running->mutex.wait();
    while (!running->waitingToJoin.isEmpty()) {
        TCB *thr = running->waitingToJoin.removeFirst();
        thr->setReady();
        Scheduler::put(thr);
    }
    running->mutex.signal();

    ThreadCollector::put(running);

    dispatch();
}

void TCB::dispatch() {
    lock()
    TCB *old = running;

    if (old->isReady()) Scheduler::put(old);
    else if (old->isFinished()) {
        ThreadCollector::signal();
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

    __asm__ volatile ("li a0, 0x12");
    __asm__ volatile ("ecall");
}

int TCB::join() {
    if (isFinished()) return 0;

    mutex.wait();

    running->setBlocked();
    waitingToJoin.addLast(&running->node);

    mutex.signal();

    return 0;
}

TCB::~TCB() {
    kfree(kernelStack);
    kfree(threadStack);
}


