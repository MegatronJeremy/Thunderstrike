#ifndef _KERNEL_SEMAPHORE_H
#define _KERNEL_SEMAPHORE_H

#include "MemoryAllocator.h"
#include "KernelObject.h"
#include "ThreadList.h"

class TCB;

class KernelSemaphore : public KernelObject {
public:
    KernelSemaphore(int val = 1) : val(val) {}

    void wait();
    void signal();

    ~KernelSemaphore();

protected:
    void block();
    void deblock();

private:
    int val;

    ThreadList blockedThreadQueue;

};

#endif
