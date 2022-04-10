//
// Created by xparh on 5/10/2022.
//

#ifndef OS_PROJEKAT_IDLETHREAD_H
#define OS_PROJEKAT_IDLETHREAD_H

#include "KernelObject.h"

class TCB;

class IdleThread : public KernelObject {
public:
    static TCB *getIdleThread();

    static IdleThread *getInstance();

    ~IdleThread();

private:
    IdleThread();

    void run();

    static IdleThread *instance;

    TCB *idleThread = nullptr;

};

#endif //OS_PROJEKAT_IDLETHREAD_H
