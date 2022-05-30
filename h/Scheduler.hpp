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

    void priorityPut(TCB *tcb);

    static Scheduler *getInstance();

    ~Scheduler() override;

private:
    Scheduler() = default;

    LinkedList<TCB> readyThreadQueue;

    Mutex mutex;

};


#endif
