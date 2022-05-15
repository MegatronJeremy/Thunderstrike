#ifndef _IDLE_THREAD_H
#define _IDLE_THREAD_H

#include "../h/KernelObject.h"

class TCB;

class IdleThread : public KernelObject {
public:
    static TCB *getIdleThread();

    static IdleThread *getInstance();

    ~IdleThread() override;

private:
    IdleThread();

    [[noreturn]] static void run();

    static IdleThread *instance;

    TCB *idleThread;

};

#endif
