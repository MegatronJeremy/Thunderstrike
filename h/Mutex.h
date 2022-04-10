//
// Created by xparh on 5/9/2022.
//

#ifndef OS_PROJEKAT_MUTEX_H
#define OS_PROJEKAT_MUTEX_H

class TCB;

#include "KernelSemaphore.h"
#include "MemoryAllocator.h"


class Mutex : public KernelSemaphore {
public:
    void wait();
    void signal();

private:
    friend class MemoryAllocator;

    TCB *holder = nullptr;

};

#endif //OS_PROJEKAT_MUTEX_H
