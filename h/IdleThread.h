#ifndef _IDLE_THREAD_H
#define _IDLE_THREAD_H

#include "KernelObject.h"

class TCB;

class IdleThread : public KernelObject {
public:
    static TCB *getIdleThread();

    static IdleThread *getInstance();

    ~IdleThread();

private:
    IdleThread();

    [[noreturn]] void run();

    static IdleThread *instance;

    TCB *idleThread = nullptr;

};

#endif
