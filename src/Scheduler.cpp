#include "../h/Scheduler.hpp"
#include "../h/TCB.hpp"

TCB *Scheduler::get() {
    mutex.wait();
    TCB *tcb = readyThreadQueue.removeFirst();
    mutex.signal();
    return tcb;
}

void Scheduler::put(TCB *tcb) {
    mutex.wait();
    readyThreadQueue.addLast(tcb->getListNode());
    mutex.signal();
}

void Scheduler::priorityPut(TCB *tcb) {
    mutex.wait();
    readyThreadQueue.addFirst(tcb->getListNode());
    mutex.signal();
}

Scheduler *Scheduler::getInstance() {
    static auto *instance = new Scheduler;
    return instance;
}

Scheduler::~Scheduler() {
    while (!readyThreadQueue.isEmpty()) {
        delete readyThreadQueue.removeFirst();
    }
}