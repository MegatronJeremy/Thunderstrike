//
// Created by xparh on 4/28/2022.
//

#include "../h/TimerInterrupt.h"
#include "../h/TCB.h"
#include "../h/Scheduler.h"

TimerInterrupt *TimerInterrupt::instance = nullptr;

TimerInterrupt *TimerInterrupt::getInstance() {
    if (!instance) instance = new TimerInterrupt;
    return instance;
}

void TimerInterrupt::block(TCB *tcb, time_t time) {
    List<TCB> *blockedThreads = &getInstance()->blockedThreadList;

    instance->mutex.wait();

    for (blockedThreads->toHead(); blockedThreads->hasCurr(); blockedThreads->toNext()) {
        time_t currTime = blockedThreads->getCurr()->getBlockedTime();
        if (time >= currTime) {
            time -= currTime;
        } else {
            blockedThreads->insertBeforeCurr(tcb);
            break;
        }
    }

    // insert at end
    if (!blockedThreads->hasCurr()) blockedThreads->addLast(tcb);

    // updating relative time for blocked threads after currently inserted
    while (blockedThreads->hasCurr()) {
        blockedThreads->getCurr()->decBlockedTime(time);
        blockedThreads->toNext();
    }

    instance->mutex.signal();

    tcb->setBlockedTime(time);
    tcb->setBlocked();
    tcb->dispatch();
}

void TimerInterrupt::tick() {
    List<TCB> *blockedThreads = &getInstance()->blockedThreadList;

    TCB *tcb;

    instance->mutex.wait();

    while ((tcb = blockedThreads->getFirst()) && !tcb->getBlockedTime()) {
        tcb->setReady();
        Scheduler::put(blockedThreads->removeFirst());
    }

    instance->mutex.signal();

    if (!tcb) return;
    tcb->decBlockedTime();
}

