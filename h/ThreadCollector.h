#ifndef _THREAD_COLLECTOR_H
#define _THREAD_COLLECTOR_H

class TCB;

#include "Mutex.h"
#include "NodeList.h"

class ThreadCollector : public KernelObject {
public:
    ThreadCollector(const ThreadCollector &) = delete;

    void operator=(const ThreadCollector &) = delete;

    static ThreadCollector *getInstance();

    void put(TCB *tcb);

    ~ThreadCollector() override;

private:
    ThreadCollector();

    [[noreturn]] void run();

    TCB *threadCollector = nullptr;

    NodeList<TCB> finishedThreads;

    Mutex mutex;

    KernelSemaphore readyToDelete;
};

#endif
