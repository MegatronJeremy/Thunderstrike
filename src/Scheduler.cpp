#include "../h/Scheduler.hpp"
#include "../h/TCB.hpp"

TCB *Scheduler::get() {
    mutex.wait();
    TCB *tcb = nullptr;
    for (int i = 0; i < threadTypes && tcb == nullptr; i++) {
        tcb = readyThreadQueue[i].removeFirst();
    }
    mutex.signal();
    return tcb;
}

void Scheduler::put(TCB *tcb) {
    mutex.wait();
    readyThreadQueue[tcb->getType()].addLast(tcb->getListNode());
    mutex.signal();
}

Scheduler *Scheduler::getInstance() {
    static auto *instance = new Scheduler;
    return instance;
}

Scheduler::~Scheduler() {
    while (!readyThreadQueue[0].isEmpty()) {
        delete readyThreadQueue[0].removeFirst();
    }
}