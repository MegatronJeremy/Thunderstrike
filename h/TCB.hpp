#ifndef _TCB_HPP
#define _TCB_HPP

#include "../lib/hw.h"
#include "DummyMutex.hpp"
#include "ListNode.hpp"
#include "LinkedList.hpp"
#include "LinkedHashNode.hpp"
#include "slab.h"

#define OFFSETOF(TYPE, ELEMENT) ((size_t)&(((TYPE *)0)->ELEMENT))

// Thread Control Block - kernel implementation of threads
class TCB : public KObject<TCB> {
public:
    enum Type {
        KERNEL, CONSOLE, USER
    };

    using Body = void (*)(void *);

    TCB() {
        for (int i = 0; i < 32; i++) context[i] = 0;
    }

    TCB(const TCB &) = delete;

    void operator=(const TCB &) = delete;

    ~TCB() override;

    using KObject<TCB>::createObj;

    static TCB *createObj(Body body, void *args, Type type = USER, bool start = true);

    static TCB *createObj(Body body, void *args, uint64 *threadStack, Type type = USER, bool start = true);

    void deleteObj() override;

    static int start(TCB *thr);

    int join() const;

    static void yield() {
        __asm__ volatile ("ecall");
    }

    static void dispatch(bool wasBlocked = true);

    static void exit();

    uint64 getId() const {
        return id;
    }

    bool isPrivileged() const {
        return privileged;
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

    bool isWaiting() const {
        return status == WAITING;
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

    uint64 getSsp() const {
        return ssp;
    }

    uint64 getSavedContext() const {
        return (uint64) (kernelStack + DEFAULT_STACK_SIZE - 32);
    }

    uint64 *getThreadStack() const {
        return threadStack;
    };

    ListNode<TCB> *getListNode() {
        return listNode;
    }

    LinkedHashNode<TCB> *getHashNode() {
        return hashNode;
    }

    Type getType() const {
        return type;
    }

    void setTimeSlice(uint64 timeSlice) {
        this->timeSlice = timeSlice;
    }

    uint64 getPriority() const {
        return priority;
    }

    void setPriority(uint64 priority) {
        this->priority = priority;
    }

    static TCB *running;

    static TCB *userMain;

private:

    enum Status {
        READY, FINISHED, BLOCKED, IDLE, INTERRUPTED, WAITING
    };

    using Context = uint64[32];

    friend class Riscv;

    static void threadWrapper();

    static void contextSwitch(Context *oldContext, Context *runningContext);

    int initTCB(Body b, void *a, uint64 *tS, bool priv, Type t);

    static uint64 ID;

    static size_t stackByteSize;

    static uint64 offsSSP;

    static uint64 timeSliceCounter;

    uint64 id = ID++;

    Body body = nullptr;

    void *args = nullptr;

    uint64 *threadStack = nullptr;

    uint64 *kernelStack = nullptr;

    uint64 ssp = 0;

    bool privileged = true;

    Context context;

    uint64 timeSlice = DEFAULT_TIME_SLICE;

    uint64 priority = 1;

    Status status = READY;

    LinkedList<TCB> *waitingToJoin = LinkedList<TCB>::createObj();

    Mutex *mutex = Mutex::createObj();

    Type type = KERNEL;

    time_t blockedTime = 0;

    ListNode<TCB> *listNode = ListNode<TCB>::createObj(this);

    LinkedHashNode<TCB> *hashNode = LinkedHashNode<TCB>::createObj(this, id);

};


#endif
