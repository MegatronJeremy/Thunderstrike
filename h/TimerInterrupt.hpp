#ifndef _TIMERINTERRUPT_HPP
#define _TIMERINTERRUPT_HPP

#include "Mutex.hpp"
#include "LinkedList.hpp"

class TCB;

// Kernel object for handling timer interrupts and thread sleep requests
class TimerInterrupt : public KObject {
public:
    static void initTimerInterrupt();

    static void block(TCB *tcb, time_t time);

    static void tick();

private:
    static bool initialised;

    static Mutex *mutex;

    static LinkedList<TCB> *blockedThreads;
};

#endif
