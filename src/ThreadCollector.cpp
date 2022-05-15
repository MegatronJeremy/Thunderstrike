#include "../h/ThreadCollector.h"
#include "../h/TCB.h"
#include "../h/Riscv.h"

ThreadCollector *ThreadCollector::instance = nullptr;

void ThreadCollector::signal() {
    getInstance()->readyToDelete.signal();
}

void ThreadCollector::put(TCB *tcb) {
    getInstance()->mutex.wait();
    getInstance()->finishedThreads.addLast(tcb->getNode());
    getInstance()->mutex.signal();
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

ThreadCollector *ThreadCollector::getInstance() {
    if (!instance) instance = new ThreadCollector;
    return instance;
}

