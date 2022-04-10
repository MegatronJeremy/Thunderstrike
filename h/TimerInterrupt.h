//
// Created by xparh on 4/28/2022.
//

#ifndef OS_PROJEKAT_TIMERINTERRUPT_H
#define OS_PROJEKAT_TIMERINTERRUPT_H

#include "List.h"
#include "Mutex.h"

class TCB;

class TimerInterrupt : public KernelObject {
public:
    static void block(TCB *tcb, time_t time);

    static void tick();

    static TimerInterrupt *getInstance();

private:
    TimerInterrupt() = default;

    static TimerInterrupt *instance;

    Mutex mutex;

    List<TCB> blockedThreadList;
};

#endif //OS_PROJEKAT_TIMERINTERRUPT_H
