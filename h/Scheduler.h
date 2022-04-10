//
// Created by xparh on 4/25/2022.
//

#ifndef RECITE_GLASOVIMA_DA_PRESTANU_SCHEDULER_H
#define RECITE_GLASOVIMA_DA_PRESTANU_SCHEDULER_H

#include "Queue.h"
#include "List.h"
#include "MemoryAllocator.h"
#include "Mutex.h"

class TCB;

class Scheduler : public KernelObject {
public:
    static TCB *get();

    static void put(TCB *tcb);

    static Scheduler *getInstance();

private:
    Scheduler() = default;

    static Scheduler *instance;

    List<TCB> readyThreadQueue;

    Mutex mutex;

};


#endif //RECITE_GLASOVIMA_DA_PRESTANU_SCHEDULER_H
