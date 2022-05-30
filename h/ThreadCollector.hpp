#ifndef _THREADCOLLECTOR_HPP
#define _THREADCOLLECTOR_HPP

class TCB;

#include "Mutex.hpp"
#include "LinkedList.hpp"

// Thread collector kernel thread - for deallocation of finished threads
class ThreadCollector : public KObject {
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

    LinkedList<TCB> finishedThreads;

    Mutex mutex;

    KSemaphore readyToDelete;
};

#endif
