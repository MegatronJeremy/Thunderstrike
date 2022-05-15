#include "../h/TimerInterrupt.h"
#include "../h/TCB.h"
#include "../h/Scheduler.h"
#include "../h/SysPrint.h"

TimerInterrupt *TimerInterrupt::instance = nullptr;

TimerInterrupt *TimerInterrupt::getInstance() {
    if (!instance) instance = new TimerInterrupt;
    return instance;
}

void TimerInterrupt::block(TCB *tcb, time_t time) {
    mutex.wait();

    for (blockedThreads.toHead(); blockedThreads.hasCurr(); blockedThreads.toNext()) {
        time_t currTime = blockedThreads.getCurr()->getBlockedTime();
        if (time >= currTime) {
            time -= currTime;
        } else {
            // insert before current and update current relative wait tiem
            blockedThreads.insertBeforeCurr(tcb->getListNode());
            blockedThreads.getCurr()->decBlockedTime(time);
            break;
        }
    }

    // insert at end
    if (!blockedThreads.hasCurr()) blockedThreads.addLast(tcb->getListNode());

    tcb->setBlockedTime(time);
    tcb->setBlocked();

    mutex.signal();

    TCB::dispatch();
}

void TimerInterrupt::tick() {
    if (blockedThreads.isEmpty()) return;

    mutex.wait();
    TCB *tcb = blockedThreads.getFirst();
    tcb->decBlockedTime();

    while (tcb && tcb->getBlockedTime() == 0) {
        tcb->setReady();
        Scheduler::put(blockedThreads.removeFirst());
        tcb = blockedThreads.getFirst();
    }

    mutex.signal();
}

TimerInterrupt::~TimerInterrupt() {
    while (!blockedThreads.isEmpty()) {
        delete blockedThreads.removeFirst();
    }
}


