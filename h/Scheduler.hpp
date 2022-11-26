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

    void put(TCB *tcb);

    static Scheduler *getInstance();

    ~Scheduler() override;

private:
    Scheduler() = default;

    static const int threadTypes = 3;

    LinkedList<TCB> readyThreadQueue[threadTypes];

    Mutex mutex;

};


#endif
