#ifndef _MUTEX_H
#define _MUTEX_H

#include "KernelSemaphore.h"

class TCB;

class Mutex : public KernelSemaphore {
public:
    void wait() override;
    void signal() override;

private:
    TCB *holder = nullptr;

};

#endif
