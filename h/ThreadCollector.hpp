#ifndef _THREADCOLLECTOR_HPP
#define _THREADCOLLECTOR_HPP

class TCB;

#include "Mutex.hpp"
#include "LinkedList.hpp"

// Thread collector kernel thread - for deallocation of finished threads
class ThreadCollector {
public:
    static void initThreadCollector();

    static void put(TCB *tcb);

private:
    [[noreturn]] static void run();

    static void deleteThread();

    static bool init;

    static LinkedList<TCB> *finishedThreads;

    static Mutex *mutex;

    static KSemaphore *readyToDelete;

    static TCB *threadCollector;
};

#endif
