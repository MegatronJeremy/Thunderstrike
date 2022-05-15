//
// Created by xparh on 4/24/2022.
//

#ifndef OS1_VEZBE07_RISCV_CONTEXT_SWITCH_1_SYNCHRONOUS_TCB_H
#define OS1_VEZBE07_RISCV_CONTEXT_SWITCH_1_SYNCHRONOUS_TCB_H

#include "../lib/hw.h"
#include "KernelObject.h"
#include "List.h"
#include "Mutex.h"
#include "ThreadNode.h"
#include "ThreadList.h"

// Thread Control Block
class TCB : public KernelObject {
public:
    using Body = void (*)(void *);

    static TCB *createKernelThread(Body body, void *args);

    static TCB *createKernelThread(Body body, void *args, uint64 *threadStack);

    static TCB *createUserThread(Body body, void *args);

    static TCB *createUserThread(Body body, void *args, uint64 *threadStack);

    int join();

    static void yield() {
        __asm__ volatile ("ecall");
    }

    static void dispatch();

    static void exit();

    bool isBlocked() const {
        return status == BLOCKED;
    }

    void setBlocked() {
        status = BLOCKED;
    }

    bool isReady() const {
        return status == READY;
    }

    void setReady() {
        status = READY;
    }

    bool isFinished() const {
        return status == FINISHED;
    }

    void setFinished() {
        status = FINISHED;
    }

    bool isIdle() const {
        return status == IDLE;
    }

    void setIdle() {
        status = IDLE;
    }

    uint64 getTimeSlice() const {
        return timeSlice;
    }

    time_t getBlockedTime() const {
        return blockedTime;
    }

    void setBlockedTime(time_t blockedTime) {
        this->blockedTime = blockedTime;
    }

    void decBlockedTime(time_t time = 1) {
        this->blockedTime -= time;
    }

    const Mutex *getMutex() const {
        return &mutex;
    }

    uint64 getSsp() const {
        return ssp;
    }

    uint64 getSavedContext() const {
        return (uint64) (kernelStack + DEFAULT_STACK_SIZE - 32);
    }

    uint64 *getThreadStack() const {
        return threadStack;
    };

    ThreadNode *getNode() {
        return &node;
    }

    static TCB *createKernelThread() {
        return new TCB();
    }

    static TCB *running;

    ~TCB();

private:
    TCB();

    explicit TCB(Body body, void *args, uint64 *threadStack, bool privileged);

    enum Status {
        READY, FINISHED, BLOCKED, IDLE
    };

    struct Context {
        uint64 ra;
        uint64 sp;
    };

    uint64 ssp = 0;
    Body body = nullptr;
    void *args = nullptr;
    uint64 *threadStack = nullptr;
    uint64 *kernelStack = (uint64 *) kmalloc(DEFAULT_STACK_SIZE);
    bool privileged = true;
    Context context = {0, 0};
    uint64 timeSlice = DEFAULT_TIME_SLICE;
    Status status = READY;
    ThreadList waitingToJoin;
    Mutex mutex;
    ThreadNode node = this;

    time_t blockedTime = 0;

    friend class Riscv;

    static void threadWrapper();

    static void contextSwitch(Context *oldContext, Context *runningContext);

    static uint64 timeSliceCounter;


};


#endif //OS1_VEZBE07_RISCV_CONTEXT_SWITCH_1_SYNCHRONOUS_TCB_H
