#ifndef _IDLETHREAD_HPP
#define _IDLETHREAD_HPP

#include "../h/KObject.hpp"

class TCB;

// Idle thread - for busy wait when no thread is scheduled
class IdleThread : public KObject {
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
