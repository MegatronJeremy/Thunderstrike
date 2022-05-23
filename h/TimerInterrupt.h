#ifndef _TIMERINTERRUPT_H
#define _TIMERINTERRUPT_H

#include "Mutex.h"
#include "NodeList.h"

class TCB;

class TimerInterrupt : public KernelObject {
public:
    TimerInterrupt(const TimerInterrupt &) = delete;

    void operator=(const TimerInterrupt &) = delete;

    void block(TCB *tcb, time_t time);

    void tick();

    static TimerInterrupt *getInstance();

    ~TimerInterrupt() override;

private:
    TimerInterrupt() = default;

    Mutex mutex;

    NodeList<TCB> blockedThreads;
};

#endif
