#ifndef _SCHEDULER_H
#define _SCHEDULER_H

#include "Mutex.h"
#include "ThreadList.h"

class TCB;

class Scheduler : public KernelObject {
public:
    static TCB *get();

    static void put(TCB *tcb);

    static Scheduler *getInstance();

    ~Scheduler();

private:
    Scheduler() = default;

    static Scheduler *instance;

    ThreadList readyThreadQueue;

    Mutex mutex;

};


#endif
