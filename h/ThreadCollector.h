#ifndef _THREAD_COLLECTOR_H
#define _THREAD_COLLECTOR_H

class TCB;

#include "Mutex.h"
#include "ThreadList.h"

class ThreadCollector : public KernelObject {
public:
    static ThreadCollector *getInstance();

    static void put(TCB *tcb);

    static void signal();

    ~ThreadCollector() override;

private:
    ThreadCollector();

    [[noreturn]] static void run();

    static ThreadCollector *instance;

    TCB *threadCollector = nullptr;

    ThreadList finishedThreads;

    Mutex mutex;

    KernelSemaphore readyToDelete;
};

#endif
