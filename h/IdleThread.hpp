#ifndef _IDLETHREAD_HPP
#define _IDLETHREAD_HPP

#include "../h/KObject.hpp"

class TCB;

// Idle thread - for busy wait when no thread is scheduled
class IdleThread {
public:
    static TCB *getIdleThread();

private:
    static void initIdleThread();

    [[noreturn]] static void run();

    static TCB *idleThread;

};

#endif
