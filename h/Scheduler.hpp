#ifndef _SCHEDULER_HPP
#define _SCHEDULER_HPP

#include "DummyMutex.hpp"
#include "LinkedList.hpp"

class TCB;

// MFQ thread scheduler with starvation avoidance
class Scheduler {
public:
    static void initScheduler();

    static TCB *get();

    static void put(TCB *tcb, bool wasBlocked = true);

private:

    static const uint64 maxPriority = 2;

    static const uint64 timeSlicePriority[maxPriority + 1];

    static bool init;

    static LinkedList<TCB> *readyThreadQueue[2];

    static Mutex *mutex;

    static uint8 active;
};


#endif
