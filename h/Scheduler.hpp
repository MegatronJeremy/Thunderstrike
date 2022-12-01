#ifndef _SCHEDULER_HPP
#define _SCHEDULER_HPP

#include "Mutex.hpp"
#include "LinkedList.hpp"

class TCB;

// FIFO thread scheduler
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

    static const int threadTypes = 3;

    LinkedList<TCB> *readyThreadQueue[2];

    Mutex mutex;

    int active = 0;

};


#endif
