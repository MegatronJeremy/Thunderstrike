#include "../h/ThreadCollector.hpp"
#include "../h/TCB.hpp"
#include "../h/Riscv.hpp"

bool ThreadCollector::initialised = false;

LinkedList<TCB> *ThreadCollector::finishedThreads;

Mutex *ThreadCollector::mutex;

KSemaphore *ThreadCollector::readyToDelete;

void ThreadCollector::initThreadCollector() {
    if (initialised) return;
    initialised = true;

    TCB::createThread([](void *) { ThreadCollector::run(); }, nullptr, TCB::KERNEL);

    finishedThreads = new LinkedList<TCB>;

    mutex = new Mutex;

    readyToDelete = new KSemaphore(0);
}

void ThreadCollector::put(TCB *tcb) {
    mutex->wait();
    finishedThreads->addLast(tcb->getListNode());
    mutex->signal();
    readyToDelete->signal();
}

[[noreturn]] void ThreadCollector::run() {
    while (true) {
        readyToDelete->wait();
        mutex->wait();
        TCB *thr = finishedThreads->removeFirst();
        mutex->signal();
        delete thr;
    }
}