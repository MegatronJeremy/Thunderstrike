//
// Created by xparh on 4/27/2022.
//

#ifndef RECITE_GLASOVIMA_DA_PRESTANU_SEMAPHORE_H
#define RECITE_GLASOVIMA_DA_PRESTANU_SEMAPHORE_H

#include "Queue.h"
#include "MemoryAllocator.h"
#include "List.h"
#include "KernelObject.h"

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

    int val;

    List<TCB> blockedThreadQueue;

};

#endif //RECITE_GLASOVIMA_DA_PRESTANU_SEMAPHORE_H
