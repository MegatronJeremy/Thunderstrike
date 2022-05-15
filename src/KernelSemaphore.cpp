#include "../h/KernelSemaphore.h"
#include "../h/Riscv.h"
#include "../h/TCB.h"
#include "../h/Scheduler.h"

void KernelSemaphore::block() {
    blockedThreadQueue.addLast(TCB::running->getNode());
    TCB::running->setBlocked();
    TCB::dispatch();
}

void KernelSemaphore::deblock() {
    if (blockedThreadQueue.isEmpty()) return;
    TCB *tcb = blockedThreadQueue.removeFirst();
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
    while (!blockedThreadQueue.isEmpty())
        deblock();
    unlock()
    val = 0;
}
