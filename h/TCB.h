#ifndef _TCB_H
#define _TCB_H

#include "../lib/hw.h"
#include "KernelObject.h"
#include "Mutex.h"
#include "ThreadNode.h"
#include "ThreadList.h"
#include "LinkedHashNode.h"

#define OFFSETOF(TYPE, ELEMENT) ((size_t)&(((TYPE *)0)->ELEMENT))

// Thread Control Block
class TCB : public KernelObject {
public:
    using Body = void (*)(void *);

    static TCB *createKernelThread() {
        return new TCB();
    }

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

    int getId() const {
        return id;
    }

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

    bool isInterrupted() const {
        return status == INTERRUPTED;
    }

    void setInterrupted() {
        status = INTERRUPTED;
    }

    uint64 getTimeSlice() const {
        return timeSlice;
    }

    time_t getBlockedTime() const {
        return blockedTime;
    }

    void setBlockedTime(time_t time) {
        this->blockedTime = time;
    }

    void decBlockedTime(time_t time = 1) {
        if (blockedTime - time > blockedTime) return;
        blockedTime -= time;
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

    ThreadNode *getListNode() {
        return &listNode;
    }

    LinkedHashNode<TCB> *getHashNode() {
        return &hashNode;
    }

    ~TCB() override;

    static TCB *running;

private:
    TCB();

    explicit TCB(Body body, void *args, uint64 *threadStack, bool privileged);

    enum Status {
        READY, FINISHED, BLOCKED, IDLE, INTERRUPTED
    };

    struct Context {
        uint64 ra;
        uint64 sp;
    };

    static uint64 ID;
    uint64 id = ID++;

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

    ThreadNode listNode = ThreadNode(this);
    LinkedHashNode<TCB> hashNode = LinkedHashNode<TCB>(this, id);

    static uint64 offsSSP;
    uint64 ssp = 0;

    time_t blockedTime = 0;

    static uint64 timeSliceCounter;

    friend class Riscv;

    static void threadWrapper();

    static void contextSwitch(Context *oldContext, Context *runningContext);

};


#endif
