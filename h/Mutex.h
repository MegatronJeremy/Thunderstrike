#ifndef _MUTEX_H
#define _MUTEX_H

class TCB;

#include "KernelSemaphore.h"

class Mutex : public KernelSemaphore {
public:
    void wait();
    void signal();

private:
    friend class MemoryAllocator;

    TCB *holder = nullptr;

};

#endif
