#ifndef _SCHEDULER_H
#define _SCHEDULER_H

#include "Mutex.h"
#include "NodeList.h"

class TCB;

class Scheduler : public KernelObject {
public:
    static TCB *get();

    static void put(TCB *tcb);

    static Scheduler *getInstance();

    ~Scheduler() override;

private:
    Scheduler() = default;

    static Scheduler *instance;

    NodeList<TCB> readyThreadQueue;

    Mutex mutex;

};


#endif
