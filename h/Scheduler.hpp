#ifndef _SCHEDULER_HPP
#define _SCHEDULER_HPP

#include "Mutex.hpp"
#include "LinkedList.hpp"

class TCB;

// MFQ thread scheduler with starvation avoidance
class Scheduler : public KObject {
public:
    Scheduler(const Scheduler &) = delete;

    void operator=(const Scheduler &) = delete;

    TCB *get();

    void put(TCB *tcb, bool wasBlocked = true);

    static Scheduler *getInstance();

    ~Scheduler() override;

private:
    Scheduler();

    static const uint64 maxPriority = 2;

    static const uint64 timeSlicePriority[maxPriority + 1];

    LinkedList<TCB> *readyThreadQueue[2];

    Mutex mutex;

    uint8 active = 0;
};


#endif
