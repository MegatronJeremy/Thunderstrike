#ifndef _KERNEL_SEMAPHORE_H
#define _KERNEL_SEMAPHORE_H

#include "KernelObject.h"
#include "ThreadList.h"

class TCB;

class KernelSemaphore : public KernelObject {
public:
    explicit KernelSemaphore(int val = 1) : val(val) {}

    virtual void wait();

    virtual void signal();

    ~KernelSemaphore() override;

protected:
    void block();
    void deblock();

private:
    int val;

    ThreadList blockedThreadQueue;

};

#endif
