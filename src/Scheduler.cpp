#include "../h/Scheduler.h"
#include "../h/TCB.h"

Scheduler *Scheduler::instance = nullptr;

TCB *Scheduler::get() {
    getInstance()->mutex.wait();
    TCB *tcb = getInstance()->readyThreadQueue.removeFirst();
    getInstance()->mutex.signal();
    return tcb;
}

void Scheduler::put(TCB *tcb) {
    getInstance()->mutex.wait();
    getInstance()->readyThreadQueue.addLast(tcb->getListNode());
    getInstance()->mutex.signal();
}

Scheduler *Scheduler::getInstance() {
    if (!instance) instance = new Scheduler;
    return instance;
}

Scheduler::~Scheduler() {
    while (!readyThreadQueue.isEmpty()) {
        delete readyThreadQueue.removeFirst();
    }
}
