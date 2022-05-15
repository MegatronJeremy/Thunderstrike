#ifndef _MUTEX_H
#define _MUTEX_H

class TCB;

#include "KernelSemaphore.h"

class Mutex : public KernelSemaphore {
public:
    void wait() override;
    void signal() override;

private:
    TCB *holder = nullptr;

};

#endif
