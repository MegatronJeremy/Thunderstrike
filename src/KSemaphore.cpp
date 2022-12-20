#include "../h/KSemaphore.hpp"
#include "../h/Riscv.hpp"
#include "../h/TCB.hpp"
#include "../h/Scheduler.hpp"

uint64 KSemaphore::ID = 0;

KSemaphore *KSemaphore::createKSemaphore(int v) {
    KSemaphore *kSemaphore = createObj();

    kSemaphore->val = v;

    return kSemaphore;
}

void KSemaphore::defaultCtor() {
    val = 1;
    blockedThreadQueue = LinkedList<TCB>::createObj();
    hashNode = LinkedHashNode<KSemaphore>::createLinkedHashNode(this, id);
}

void KSemaphore::defaultDtor() {
    lock()
    while (!blockedThreadQueue->isEmpty()) {
        TCB *tcb = blockedThreadQueue->removeFirst();
        tcb->setInterrupted();
        Scheduler::put(tcb);
    }
    val = INT_MAX;
    unlock()

    LinkedList<TCB>::deleteObj(blockedThreadQueue);
    LinkedHashNode<KSemaphore>::deleteObj(hashNode);
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
