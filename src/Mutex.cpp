#include "../h/Mutex.hpp"
#include "../h/TCB.hpp"
#include "../h/Riscv.hpp"
#include "../h/Scheduler.hpp"

void Mutex::deleteObj() {
    lock()
    while (!blockedThreadQueue.isEmpty()) {
        TCB *tcb = blockedThreadQueue.removeFirst();
        tcb->setInterrupted();
        Scheduler::put(tcb);
    }
    holder = nullptr;
    unlock()

    KObject::deleteObj();
}

int Mutex::wait() {
    if (holder == TCB::running) return 0;
    lock()
    if (holder) block();
    if (TCB::running->isInterrupted()) {
        TCB::running->setReady();
        unlock()
        return -1;
    } else {
        holder = TCB::running;
    }
    unlock()
    return 0;
}

int Mutex::signal() {
    if (holder != TCB::running) return -1;
    lock()
    if (blockedThreadQueue.isEmpty())
        holder = nullptr;
    else
        deblock();
    unlock()
    return 0;
}

void Mutex::block() {
    blockedThreadQueue.addLast(TCB::running->getListNode());
    TCB::running->setBlocked();
    TCB::dispatch();
}

void Mutex::deblock() {
    if (blockedThreadQueue.isEmpty()) return;
    TCB *tcb = blockedThreadQueue.removeFirst();
    tcb->setReady();
    Scheduler::put(tcb);
}



