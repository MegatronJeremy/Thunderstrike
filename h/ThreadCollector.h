#ifndef _THREAD_COLLECTOR_H
#define _THREAD_COLLECTOR_H

class TCB;

#include "Mutex.h"
#include "NodeList.h"

class ThreadCollector : public KernelObject {
public:
    static ThreadCollector *getInstance();

    static void put(TCB *tcb);

    static void signal();

    ~ThreadCollector() override;

private:
    ThreadCollector();

    [[noreturn]] void run();

    static ThreadCollector *instance;

    TCB *threadCollector = nullptr;

    NodeList<TCB> finishedThreads;

    Mutex mutex;

    KernelSemaphore readyToDelete;
};

#endif
