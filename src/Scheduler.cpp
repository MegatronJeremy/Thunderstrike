#include "../h/Scheduler.hpp"
#include "../h/TCB.hpp"

Scheduler::Scheduler() {
    for (int i = 0; i < 2; i++) {
        readyThreadQueue[i] = new LinkedList<TCB>[3];
    }
}

TCB *Scheduler::get() {
    mutex.wait();
    TCB *tcb = nullptr;
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < threadTypes; j++) {
            tcb = readyThreadQueue[active][j].removeFirst();
            if (tcb) {
                mutex.signal();
                return tcb;
            }
        }
        active = 1 - active;
    }
    mutex.signal();
    return tcb;
}

void Scheduler::put(TCB *tcb, bool wasBlocked) {
    mutex.wait();
    if (wasBlocked)
        readyThreadQueue[active][tcb->getType()].addLast(tcb->getListNode());
    else
        readyThreadQueue[1 - active][tcb->getType()].addLast(tcb->getListNode());
    mutex.signal();
}

Scheduler *Scheduler::getInstance() {
    static auto *instance = new Scheduler;
    return instance;
}

Scheduler::~Scheduler() {
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < threadTypes; j++) {
            while (!readyThreadQueue[i][j].isEmpty()) {
                delete readyThreadQueue[i][j].removeFirst();
            }
        }
    }
}

