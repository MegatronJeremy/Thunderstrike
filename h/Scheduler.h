#ifndef _SCHEDULER_H
#define _SCHEDULER_H

#include "Mutex.h"
#include "NodeList.h"

class TCB;

class Scheduler : public KernelObject {
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

    NodeList<TCB> readyThreadQueue;

    Mutex mutex;

};


#endif
