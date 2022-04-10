//
// Created by xparh on 4/27/2022.
//

#include "../h/KernelSemaphore.h"
#include "../h/Riscv.h"
#include "../h/TCB.h"
#include "../h/Scheduler.h"
#include "../h/SysPrint.h"

void KernelSemaphore::block() {
    blockedThreadQueue.addLast(TCB::running);
    // setjmp
    TCB::running->setBlocked();
    TCB::dispatch();
}

void KernelSemaphore::deblock() {
    if (!blockedThreadQueue.getCount()) return;
    TCB *tcb = blockedThreadQueue.removeFirst();
//    kprintString("Got tcb: ");
//    kprintUnsigned((uint64) tcb);
//    kprintString("\n");
//    if (!tcb) {
//        kprintString("Queue empty!\n");
//        return;
//    }
    tcb->setReady();
    Scheduler::put(tcb);
}

void KernelSemaphore::wait() {
    lock()
    if (--val < 0) block();
    unlock()
}

void KernelSemaphore::signal() {
    lock()
    if (val++ < 0) deblock();
    unlock()
}

KernelSemaphore::~KernelSemaphore() {
    lock()
    while (blockedThreadQueue.getCount() != 0)
        deblock();
    unlock()
    val = 0;
}
