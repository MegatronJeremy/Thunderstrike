#ifndef _TIMERINTERRUPT_H
#define _TIMERINTERRUPT_H

#include "Mutex.h"
#include "ThreadList.h"

class TCB;

class TimerInterrupt : public KernelObject {
public:
    void block(TCB *tcb, time_t time);

    void tick();

    static TimerInterrupt *getInstance();

    ~TimerInterrupt() override;

private:
    TimerInterrupt() = default;

    static TimerInterrupt *instance;

    Mutex mutex;

    ThreadList blockedThreads;
};

#endif
