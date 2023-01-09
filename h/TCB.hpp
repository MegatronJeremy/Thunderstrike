#ifndef _TCB_HPP
#define _TCB_HPP

#include "../lib/hw.h"
#include "DummyMutex.hpp"
#include "ListNode.hpp"
#include "LinkedList.hpp"
#include "MapEntry.hpp"
#include "String.h"

#define OFFSETOF(TYPE, ELEMENT) ((size_t)&(((TYPE *)0)->ELEMENT))

// Thread Control Block - kernel implementation of threads
class TCB : public KObject<TCB> {
public:
    enum Type {
        KERNEL, CONSOLE, USER
    };

    using Body = void (*)(void *);

    TCB() {
        String::memset(context, 0, sizeof(*context) * REG_NUM);
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

    int getId() const {
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

    bool isAwaitingStart() const {
        return status == AWAITING_START;
    }

    uint64 getTimeSlice() const {
        return timeSlice;
    }

    time_t getBlockedTime() const {
        return blockedTime;
    }

    void setBlockedTime(time_t time) {
        blockedTime = time;
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

    MapEntry<int, TCB *> *getMapEntry() {
        return entry;
    }

    Type getType() const {
        return type;
    }

    void setTimeSlice(uint64 tS) {
        this->timeSlice = tS;
    }

    uint64 getPriority() const {
        return priority;
    }

    void setPriority(uint64 p) {
        this->priority = p;
    }

    static TCB *running;

    static TCB *userMain;

private:

    enum Status {
        READY, FINISHED, BLOCKED, IDLE, INTERRUPTED, AWAITING_START
    };

    static const int REG_NUM = 32;

    using Context = uint64 *;

    friend class Riscv;

    static void threadWrapper();

    static void contextSwitch(Context oldContext, Context runningContext);

    int initTCB(Body b, void *a, uint64 *tS, bool priv, Type t);

    static int ID;

    static size_t stackByteSize;

    static uint64 offsSSP;

    static uint64 timeSliceCounter;

    int id = ID++;

    Body body = nullptr;

    void *args = nullptr;

    uint64 *threadStack = nullptr;

    uint64 *kernelStack = nullptr;

    uint64 ssp = 0;

    bool privileged = true;

    Context context = (Context) kmalloc(REG_NUM * sizeof(*context));

    uint64 timeSlice = DEFAULT_TIME_SLICE;

    uint64 priority = 1;

    Status status = READY;

    LinkedList<TCB> *waitingToJoin = LinkedList<TCB>::createObj();

    Mutex *mutex = Mutex::createObj();

    Type type = KERNEL;

    time_t blockedTime = 0;

    ListNode<TCB> *listNode = ListNode<TCB>::createObj(this);

    MapEntry<int, TCB *> *entry = MapEntry<int, TCB *>::createObj(id, this);

};


#endif
