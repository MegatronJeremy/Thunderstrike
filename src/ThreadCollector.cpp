#include "../h/ThreadCollector.hpp"
#include "../h/TCB.hpp"
#include "../h/Riscv.hpp"

bool ThreadCollector::init = false;

LinkedList<TCB> *ThreadCollector::finishedThreads;

Mutex *ThreadCollector::mutex;

KSemaphore *ThreadCollector::readyToDelete;

TCB *ThreadCollector::threadCollector;

void ThreadCollector::initThreadCollector() {
    if (init) return;
    init = true;

    finishedThreads = new LinkedList<TCB>;

    mutex = new Mutex;

    readyToDelete = new KSemaphore(0);

    TCB::createThread([](void *) { ThreadCollector::run(); }, nullptr, TCB::KERNEL);
}

void ThreadCollector::put(TCB *tcb) {
    DummyMutex dummy(mutex);

    finishedThreads->addLast(tcb->getListNode());
    readyToDelete->signal();
}

void ThreadCollector::deleteThread() {
    DummyMutex dummy(mutex);

    TCB::deleteTCB(finishedThreads->removeFirst());
}

[[noreturn]] void ThreadCollector::run() {
    while (true) {
        readyToDelete->wait();
        deleteThread();
    }
}

