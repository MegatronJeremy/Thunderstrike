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

    explicit TCB(Body body, void *args, uint64 timeSlice, bool privileged = false);

    static uint64 offsSP;

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

    int join();

    static TCB *createThread(Body body, void *args);

    static void yield();

    static void dispatch();

    static void exit();

    static TCB *running;

    ~TCB();

private:
    enum Status {
        READY, FINISHED, BLOCKED, IDLE
    };

    struct Context {
        uint64 ra;
        uint64 sp;
    };

    uint64 ssp;
    Body body;
    void *args;
    uint64 *threadStack;
    uint64 *kernelStack;
    Context context;
    uint64 timeSlice;
    Status status;
    ThreadList waitingToJoin;
    bool privileged;
    Mutex mutex;
    ThreadNode node;

    time_t blockedTime = 0;

    friend class Riscv;

    static void threadWrapper();

    static void readSavedStack();

    static void writeSavedStack();

    static void contextSwitch(Context *oldContext, Context *runningContext);

    static uint64 timeSliceCounter;


};


#endif //OS1_VEZBE07_RISCV_CONTEXT_SWITCH_1_SYNCHRONOUS_TCB_H
