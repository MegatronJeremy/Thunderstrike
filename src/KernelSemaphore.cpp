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
    if (TCB::running->isInterrupted()) {
        TCB::running->setReady();
        unlock()
        return -1;
    }
    unlock()
    return 0;
}

int KernelSemaphore::signal() {
    lock()
    if (val == INT_MAX) {
        unlock()
        return -1;
    }
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
    val = INT_MAX;

    unlock()
}


