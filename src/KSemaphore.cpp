#include "../h/KSemaphore.hpp"
#include "../h/Riscv.hpp"
#include "../h/TCB.hpp"
#include "../h/Scheduler.hpp"

int KSemaphore::ID = 0;

KSemaphore *KSemaphore::createObj(int v) {
    KSemaphore *obj = KObject<KSemaphore>::createObj();

    if (!obj) return nullptr;

    obj->val = v;

    return obj;
}

void KSemaphore::deleteObj() {
    lock()
    while (!blockedThreadQueue->isEmpty()) {
        TCB *tcb = blockedThreadQueue->removeFirst();
        tcb->setInterrupted();
        Scheduler::put(tcb);
    }
    val = 1;
    unlock()

    KObject::deleteObj();
}

int KSemaphore::wait() {
    lock()
    if (--val < 0) block();
    if (TCB::running->isInterrupted()) {
        TCB::running->setReady();
        unlock()
        return -1;
    }
    unlock()
    return 0;
}

int KSemaphore::signal() {
    if (val == INT_MAX) {
        return -1;
    }
    lock()
    if (val++ < 0) deblock();
    unlock()

    return 0;
}

bool KSemaphore::tryWait() {
    lock()
    bool ret;
    if (val <= 0) {
        ret = false;
    } else {
        val--;
        ret = true;
    }
    unlock()
    return ret;
}

void KSemaphore::block() {
    blockedThreadQueue->addLast(TCB::running->getListNode());
    TCB::running->setBlocked();
    TCB::dispatch();
}

void KSemaphore::deblock() {
    if (blockedThreadQueue->isEmpty()) return;
    TCB *tcb = blockedThreadQueue->removeFirst();
    tcb->setReady();
    Scheduler::put(tcb);
}

KSemaphore::~KSemaphore() {
    if (blockedThreadQueue) blockedThreadQueue->deleteObj();
    if (entry) entry->deleteObj();
}

