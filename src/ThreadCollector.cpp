#include "../h/ThreadCollector.h"
#include "../h/TCB.h"
#include "../h/Riscv.h"

ThreadCollector *ThreadCollector::instance = nullptr;

ThreadCollector *ThreadCollector::getInstance() {
    if (!instance) instance = new ThreadCollector;
    return instance;
}

void ThreadCollector::signal() {
    getInstance()->readyToDelete.signal();
}

void ThreadCollector::put(TCB *tcb) {
    ThreadCollector *tc = getInstance();
    tc->mutex.wait();
    tc->finishedThreads.addLast(tcb->getListNode());
    tc->mutex.signal();
}

ThreadCollector::ThreadCollector() : readyToDelete(0) {
    threadCollector = TCB::createKernelThread([](void *){ThreadCollector::run();}, nullptr);
}

[[noreturn]] void ThreadCollector::run() {
    while (true) {
        getInstance()->readyToDelete.wait();
        getInstance()->mutex.wait();
        delete getInstance()->finishedThreads.removeFirst();
        getInstance()->mutex.signal();
    }
}

ThreadCollector::~ThreadCollector() {
    while (!finishedThreads.isEmpty()) {
        delete finishedThreads.removeFirst();
    }
    delete threadCollector;
}

