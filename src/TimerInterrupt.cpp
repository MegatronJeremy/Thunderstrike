#include "../h/TimerInterrupt.h"
#include "../h/TCB.h"
#include "../h/Scheduler.h"

TimerInterrupt *TimerInterrupt::instance = nullptr;

TimerInterrupt *TimerInterrupt::getInstance() {
    if (!instance) instance = new TimerInterrupt;
    return instance;
}

void TimerInterrupt::block(TCB *tcb, time_t time) {
    ThreadList *blockedThreads = &getInstance()->blockedThreadList;

    getInstance()->mutex.wait();

    for (blockedThreads->toHead(); blockedThreads->hasCurr(); blockedThreads->toNext()) {
        time_t currTime = blockedThreads->getCurr()->getBlockedTime();
        if (time >= currTime) {
            time -= currTime;
        } else {
            blockedThreads->insertBeforeCurr(tcb->getNode());
            break;
        }
    }

    // insert at end
    if (!blockedThreads->hasCurr()) blockedThreads->addLast(tcb->getNode());

    // updating relative time for blocked threads after currently inserted
    while (blockedThreads->hasCurr()) {
        blockedThreads->getCurr()->decBlockedTime(time);
        blockedThreads->toNext();
    }

    getInstance()->mutex.signal();

    tcb->setBlockedTime(time);
    tcb->setBlocked();
    TCB::dispatch();
}

void TimerInterrupt::tick() {
    ThreadList *blockedThreads = &getInstance()->blockedThreadList;

    TCB *tcb;

    getInstance()->mutex.wait();

    while ((tcb = blockedThreads->getFirst()) && !tcb->getBlockedTime()) {
        tcb->setReady();
        Scheduler::put(blockedThreads->removeFirst());
    }

    getInstance()->mutex.signal();

    if (!tcb) return;
    tcb->decBlockedTime();
}

TimerInterrupt::~TimerInterrupt() {
    while (!blockedThreadList.isEmpty()) {
        delete blockedThreadList.removeFirst();
    }
}

