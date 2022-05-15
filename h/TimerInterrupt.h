#ifndef _TIMERINTERRUPT_H
#define _TIMERINTERRUPT_H

#include "Mutex.h"
#include "ThreadList.h"

class TCB;

class TimerInterrupt : public KernelObject {
public:
    static void block(TCB *tcb, time_t time);

    static void tick();

    static TimerInterrupt *getInstance();

    ~TimerInterrupt();

private:
    TimerInterrupt() = default;

    static TimerInterrupt *instance;

    Mutex mutex;

    ThreadList blockedThreadList;
};

#endif
