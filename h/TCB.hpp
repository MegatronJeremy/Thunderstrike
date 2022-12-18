#ifndef _TCB_HPP
#define _TCB_HPP

#include "../lib/hw.h"
#include "DummyMutex.hpp"
#include "ListNode.hpp"
#include "LinkedList.hpp"
#include "LinkedHashNode.hpp"
#include "../h/slab.h"

#define OFFSETOF(TYPE, ELEMENT) ((size_t)&(((TYPE *)0)->ELEMENT))


// Thread Control Block - kernel implementation of threads
class TCB {
public:
    enum Type {
        KERNEL, CONSOLE, USER
    };

    TCB() = delete;

    TCB(const TCB &) = delete;

    void operator=(const TCB &) = delete;

    using Body = void (*)(void *);

    static TCB *createKernelThread();

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

    static void deleteTCB(void *);

private:

    enum Status {
        READY, FINISHED, BLOCKED, IDLE, INTERRUPTED, WAITING
    };

    struct Context {
        uint64 ra;
        uint64 sp;
    };

    friend class Riscv;

    static TCB *createTCB();

    static void threadWrapper();

    static void contextSwitch(Context *oldContext, Context *runningContext);

    void initTCB(Body body, void *args, uint64 *threadStack, bool privileged, Type type);

    void defaultCtor();

    void defaultDtor();

    static kmem_cache_t *tcbCache;

    static uint64 ID;

    static size_t stackByteSize;

    static uint64 offsSSP;

    static uint64 timeSliceCounter;

    uint64 id = ID++;

    Body body = nullptr;

    void *args = nullptr;

    uint64 *threadStack = nullptr;

    uint64 *kernelStack = (uint64 *) mmalloc(byteToBlocks(stackByteSize));

    bool privileged = true;

    Context context = {0, 0};

    uint64 timeSlice;

    uint64 priority = 1;

    Status status = READY;

    LinkedList<TCB> *waitingToJoin = new LinkedList<TCB>;

    Mutex *mutex = new Mutex;

    uint64 ssp = (uint64) (kernelStack + DEFAULT_STACK_SIZE);

    Type type = KERNEL;

    time_t blockedTime;

    ListNode<TCB> *listNode = new ListNode<TCB>(this);

    LinkedHashNode<TCB> *hashNode = new LinkedHashNode<TCB>(this, id);

};


#endif
