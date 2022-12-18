#include "../h/TimerInterrupt.hpp"
#include "../h/TCB.hpp"
#include "../h/Scheduler.hpp"

bool TimerInterrupt::initialised = false;

Mutex *TimerInterrupt::mutex;

LinkedList<TCB> *TimerInterrupt::blockedThreads;

void TimerInterrupt::initTimerInterrupt() {
    if (initialised) return;
    initialised = true;

    mutex = new Mutex;

    blockedThreads = new LinkedList<TCB>;
}

void TimerInterrupt::block(TCB *tcb, time_t time) {
    DummyMutex dummy(mutex);

    for (blockedThreads->toHead(); blockedThreads->hasCurr(); blockedThreads->toNext()) {
        time_t currTime = blockedThreads->getCurr()->getBlockedTime();
        if (time >= currTime) {
            time -= currTime;
        } else {
            // insert before current and update current relative wait tiem
            blockedThreads->insertBeforeCurr(tcb->getListNode());
            blockedThreads->getCurr()->decBlockedTime(time);
            break;
        }
    }

    // insert at end
    if (!blockedThreads->hasCurr()) blockedThreads->addLast(tcb->getListNode());

    tcb->setBlockedTime(time);
    tcb->setBlocked();
}

void TimerInterrupt::tick() {
    DummyMutex dummy(mutex);

    if (blockedThreads->isEmpty()) {
        return;
    }

    TCB *tcb = blockedThreads->getFirst();
    tcb->decBlockedTime();

    while (tcb && tcb->getBlockedTime() == 0) {
        tcb->setReady();
        Scheduler::put(blockedThreads->removeFirst());
        tcb = blockedThreads->getFirst();
    }
}
