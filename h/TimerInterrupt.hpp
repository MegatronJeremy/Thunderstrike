#ifndef _TIMERINTERRUPT_HPP
#define _TIMERINTERRUPT_HPP

#include "Mutex.hpp"
#include "LinkedList.hpp"

class TCB;

// Kernel object for handling timer interrupts and thread sleep requests
class TimerInterrupt : public KObject {
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

    LinkedList<TCB> blockedThreads;
};

#endif
