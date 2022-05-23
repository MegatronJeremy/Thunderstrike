#include "../h/KernelSemaphore.h"
#include "../h/Riscv.h"
#include "../h/TCB.h"
#include "../h/Scheduler.h"

uint64 KernelSemaphore::ID = 0;


KernelSemaphore::KernelSemaphore(int val) :
    val(val),
    hashNode(this, id) {}

void KernelSemaphore::block() {
    blockedThreadQueue.addLast(TCB::running->getListNode());
    TCB::running->setBlocked();
    TCB::dispatch();
}

void KernelSemaphore::deblock() {
    if (blockedThreadQueue.isEmpty()) return;
    TCB *tcb = blockedThreadQueue.removeFirst();
    tcb->setReady();
    Scheduler::getInstance()->put(tcb);
}

int KernelSemaphore::wait() {
    lock()
    if (--val < 0) block();
    unlock()
    if (TCB::running->isInterrupted()) {
        TCB::running->setReady();
        return -1;
    }
    return 0;
}

int KernelSemaphore::signal() {
    if (val == INT_MAX) return -1;
    lock()
    if (val++ < 0) deblock();
    unlock()
    return 0;
}

KernelSemaphore::~KernelSemaphore() {
    lock()
    while (!blockedThreadQueue.isEmpty()) {
        TCB *tcb = blockedThreadQueue.removeFirst();
        tcb->setInterrupted();
        Scheduler::getInstance()->put(tcb);
    }
    unlock()

    val = INT_MAX;
}


