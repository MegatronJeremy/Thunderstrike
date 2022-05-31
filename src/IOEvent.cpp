#include "../h/IOEvent.hpp"
#include "../h/Riscv.hpp"
#include "../h/TCB.hpp"
#include "../h/Scheduler.hpp"

IOEvent::IOEvent(int val) : KSemaphore() {
    if (val < 0) val = 0;
    if (val > 1) val = 1;
    this->val = val;
}

int IOEvent::wait() {
    lock()
    if (val == 0) block();
    val = 0;
    if (TCB::running->isInterrupted()) {
        TCB::running->setReady();
        unlock()
        return -1;
    }
    unlock()

    return 0;
}

int IOEvent::signal() {
    lock()
    if (val == 1) {
        unlock();
        return -1;
    }
    val = 1;
    deblock();
    unlock()
    return 0;
}

void IOEvent::deblock() {
    if (blockedThreadQueue.isEmpty()) return;
    TCB *tcb = blockedThreadQueue.removeFirst();
    tcb->setReady();
    Scheduler::getInstance()->priorityPut(tcb);
}
