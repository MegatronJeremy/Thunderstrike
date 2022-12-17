#ifndef _TCB_HPP
#define _TCB_HPP

#include "../lib/hw.h"
#include "KObject.hpp"
#include "Mutex.hpp"
#include "ListNode.hpp"
#include "LinkedList.hpp"
#include "LinkedHashNode.hpp"

#include "../h/Cache.hpp"

#define OFFSETOF(TYPE, ELEMENT) ((size_t)&(((TYPE *)0)->ELEMENT))

// Thread Control Block - kernel implementation of threads
class TCB {
public:
    enum Type {
        KERNEL, CONSOLE, USER
    };

    TCB(const TCB &) = delete;

    void operator=(const TCB &) = delete;

    using Body = void (*)(void *);

    static TCB *createKernelThread() {
        return new TCB();
    }

    static TCB *createThread(Body body, void *args, Type type = USER, bool start = true);

    static TCB *createThread(Body body, void *args, uint64 *threadStack, Type type = USER, bool start = true);

    static int start(TCB *thr);

    int join();

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

    ListNode<TCB> *getListNode() {
        return &listNode;
    }

    LinkedHashNode<TCB> *getHashNode() {
        return &hashNode;
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

    ~TCB();

    static TCB *running;

    static TCB *userMain;

    void* operator new(size_t);
    void operator delete(void *);

private:
    enum Status {
        READY, FINISHED, BLOCKED, IDLE, INTERRUPTED, WAITING
    };

    struct Context {
        uint64 ra;
        uint64 sp;
    };

    friend class Riscv;

    TCB();

    explicit TCB(Body body, void *args, uint64 *threadStack, bool privileged, Type type);

    static void threadWrapper();

    static void contextSwitch(Context *oldContext, Context *runningContext);

    static Cache *tcbCache;

    static uint64 ID;
    uint64 id = ID++;

    Body body = nullptr;
    void *args = nullptr;

    static size_t stackByteSize;

    uint64 *threadStack = nullptr;
    uint64 *kernelStack = (uint64 *) kmalloc(byteToBlocks(stackByteSize));
    bool privileged = true;

    Context context = {0, 0};

    uint64 timeSlice = DEFAULT_TIME_SLICE;

    uint64 priority = 1;

    Status status = READY;

    LinkedList<TCB> waitingToJoin;
    Mutex mutex;

    static uint64 offsSSP;
    uint64 ssp = 0;

    Type type = KERNEL;

    time_t blockedTime = 0;

    ListNode<TCB> listNode = ListNode<TCB>(this);
    LinkedHashNode<TCB> hashNode = LinkedHashNode<TCB>(this, id);

    static uint64 timeSliceCounter;
};


#endif
