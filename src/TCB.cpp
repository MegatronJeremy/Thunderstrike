//
// Created by xparh on 4/24/2022.
//

#include "../h/TCB.h"
#include "../h/Riscv.h"
#include "../h/ThreadCollector.h"
#include "../h/Scheduler.h"
#include "../h/SysPrint.h"
#include "../h/MemoryAllocator.h"
#include "../h/IdleThread.h"

TCB *TCB::running = nullptr;

uint64 TCB::timeSliceCounter = 0;

TCB::TCB(Body body, void *args, uint64 timeSlice, bool privileged) :
        body(body), args(args),
        threadStack(body != nullptr ? (uint64 *) kmalloc(DEFAULT_STACK_SIZE * sizeof(uint64)) : nullptr),
        kernelStack((uint64 *) kmalloc(DEFAULT_STACK_SIZE * sizeof(uint64))),
        context({(uint64) &threadWrapper, threadStack != nullptr ? (uint64) (threadStack + DEFAULT_STACK_SIZE) : 0}),
        timeSlice(timeSlice),
        status(READY),
        privileged(privileged),
        node(this) {
    ssp = (uint64) (kernelStack + DEFAULT_STACK_SIZE);
    if (body != nullptr)
        Scheduler::put(this);
}

TCB *TCB::createThread(TCB::Body body, void *args) {
    return new TCB(body, args, DEFAULT_TIME_SLICE);
}

void TCB::exit() {
    running->setFinished();

    running->mutex.wait();
    while (!running->waitingToJoin.isEmpty()) {
        TCB *thr = running->waitingToJoin.removeFirst();
        thr->setReady();
//        kprintString("Returning joined thread...\n");
        Scheduler::put(thr);
    }
    running->mutex.signal();

    ThreadCollector::put(running);

    running->dispatch();
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
//        kprintString("Going idle...\n");
        running = IdleThread::getIdleThread();
    }

    TCB::timeSliceCounter = 0;

    TCB::contextSwitch(&old->context, &running->context);

    unlock()
}

void TCB::threadWrapper() {
    Riscv::popSppSpie(running->privileged);
    running->body(running->args);

//    kprintString("Ending thread...\n");

    __asm__ volatile ("li a0, 0x12");
    __asm__ volatile ("ecall");
}

void TCB::readSavedStack() {
    __asm__ volatile ("csrw sscratch, %[ssp]" : : [ssp] "r"(TCB::running->ssp));
}

void TCB::writeSavedStack() {
    __asm__ volatile ("csrr %[ssp], sscratch" : [ssp] "=r"(TCB::running->ssp));
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