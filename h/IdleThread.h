#ifndef _IDLE_THREAD_H
#define _IDLE_THREAD_H

#include "../h/KernelObject.h"

class TCB;

class IdleThread : public KernelObject {
public:
    IdleThread(const IdleThread&) = delete;
    void operator=(const IdleThread&) = delete;

    static TCB *getIdleThread();

    static IdleThread *getInstance();

    ~IdleThread() override;

private:
    IdleThread();

    [[noreturn]] static void run();

    TCB *idleThread;

};

#endif
