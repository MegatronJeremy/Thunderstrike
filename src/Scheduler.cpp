#include "../h/Scheduler.hpp"
#include "../h/TCB.hpp"

const uint64 Scheduler::timeSlicePriority[maxPriority + 1] = {
        DEFAULT_TIME_SLICE / 2,
        DEFAULT_TIME_SLICE,
        DEFAULT_TIME_SLICE * 2
};

Scheduler::Scheduler() {
    for (int i = 0; i < 2; i++) {
        readyThreadQueue[i] = new LinkedList<TCB>[maxPriority + 1];
    }
}

TCB *Scheduler::get() {
    mutex.wait();

    TCB *tcb = nullptr;
    int oldActive = active;

    do {
        for (uint64 j = 0; j <= maxPriority; j++) {
            tcb = readyThreadQueue[active][j].removeFirst();
            if (tcb) {
                mutex.signal();
                return tcb;
            }
        }
        active = 1 - active;
    } while (active != oldActive);

    mutex.signal();
    return tcb;
}

void Scheduler::put(TCB *tcb, bool wasBlocked) {
    mutex.wait();

    uint64 pri = tcb->getPriority();
    int set = active;

    if (!wasBlocked) {
        if (pri < maxPriority) pri++;
        set = 1 - active;
    } else if (pri > 0) pri--;

    tcb->setPriority(pri);
    tcb->setTimeSlice(timeSlicePriority[pri]);

    readyThreadQueue[set][pri].addLast(tcb->getListNode());

    mutex.signal();
}

Scheduler *Scheduler::getInstance() {
    static auto *instance = new Scheduler;
    return instance;
}

Scheduler::~Scheduler() {
    for (int i = 0; i < 2; i++) {
        for (uint64 j = 0; j <= maxPriority; j++) {
            while (!readyThreadQueue[i][j].isEmpty()) {
                delete readyThreadQueue[i][j].removeFirst();
            }
        }
    }
}

