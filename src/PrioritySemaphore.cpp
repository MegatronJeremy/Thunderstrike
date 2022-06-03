#include "../h/PrioritySemaphore.hpp"
#include "../h/TCB.hpp"
#include "../h/Scheduler.hpp"

void PrioritySemaphore::deblock() {
    if (blockedThreadQueue.isEmpty()) return;
    TCB *tcb = blockedThreadQueue.removeFirst();
    tcb->setReady();
    Scheduler::getInstance()->priorityPut(tcb);
}
