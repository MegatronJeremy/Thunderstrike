#include "../h/Scheduler.hpp"
#include "../h/TCB.hpp"

const uint64 Scheduler::timeSlicePriority[maxPriority + 1] = {
        DEFAULT_TIME_SLICE / 2,
        DEFAULT_TIME_SLICE,
        DEFAULT_TIME_SLICE * 2
};

bool Scheduler::init = false;

LinkedList<TCB> **Scheduler::readyThreadQueue[2];

Mutex *Scheduler::mutex;

uint8 Scheduler::active = 0;

void Scheduler::initScheduler() {
    if (init) return;
    init = true;

    for (auto &i: readyThreadQueue) {
        i = (LinkedList<TCB> **) kmalloc((maxPriority + 1) * sizeof(LinkedList<TCB> *));
        for (uint64 j = 0; j <= maxPriority; j++) {
            i[j] = LinkedList<TCB>::createObj();
        }
    }

    mutex = Mutex::createObj();
}

TCB *Scheduler::get() {
    DummyMutex dummy(mutex);

    TCB *tcb = nullptr;
    int oldActive = active;

    do {
        for (uint64 j = 0; j <= maxPriority; j++) {
            tcb = readyThreadQueue[active][j]->removeFirst();
            if (tcb) {
                return tcb;
            }
        }
        active = 1 - active;
    } while (active != oldActive);

    return tcb;
}

void Scheduler::put(TCB *tcb, bool wasBlocked) {
    DummyMutex dummy(mutex);

    uint64 pri = tcb->getPriority();
    int set = active;

    if (!wasBlocked) {
        if (pri < maxPriority) pri++;
        set = 1 - active;
    } else if (pri > 0) pri--;

    tcb->setPriority(pri);
    tcb->setTimeSlice(timeSlicePriority[pri]);

    readyThreadQueue[set][pri]->addLast(tcb->getListNode());
}

