#include "../h/ThreadCollector.hpp"
#include "../h/TCB.hpp"
#include "../h/Riscv.hpp"

bool ThreadCollector::init = false;

LinkedList<TCB> *ThreadCollector::finishedThreads;

Mutex *ThreadCollector::mutex;

KSemaphore *ThreadCollector::readyToDelete;

void ThreadCollector::initThreadCollector() {
    if (init) return;
    init = true;

    finishedThreads = LinkedList<TCB>::createObj();

    mutex = Mutex::createObj();

    readyToDelete = KSemaphore::createKSemaphore(0);

    TCB::createThread([](void *) { ThreadCollector::run(); }, nullptr, TCB::KERNEL);
}

void ThreadCollector::put(TCB *tcb) {
    DummyMutex dummy(mutex);

    finishedThreads->addLast(tcb->getListNode());
    readyToDelete->signal();
}

void ThreadCollector::deleteThread() {
    DummyMutex dummy(mutex);

    TCB::deleteObj(finishedThreads->removeFirst());
}

[[noreturn]] void ThreadCollector::run() {
    while (true) {
        readyToDelete->wait();
        deleteThread();
    }
}

