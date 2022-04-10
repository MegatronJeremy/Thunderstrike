//
// Created by xparh on 5/9/2022.
//

#ifndef OS_PROJEKAT_THREADCOLLECTOR_H
#define OS_PROJEKAT_THREADCOLLECTOR_H

class TCB;

#include "List.h"
#include "Mutex.h"

class ThreadCollector : public KernelObject {
public:
    static ThreadCollector *getInstance();

    static void put(TCB *tcb);

    static void signal();

    ~ThreadCollector();

private:
    ThreadCollector();

    static void run();

    static ThreadCollector *instance;

    TCB *threadCollector = nullptr;

    List<TCB> finishedThreads;

    Mutex mutex;

    KernelSemaphore readyToDelete;
};

#endif //OS_PROJEKAT_THREADCOLLECTOR_H
