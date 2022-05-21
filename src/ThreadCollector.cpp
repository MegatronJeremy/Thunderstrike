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
    getInstance()->mutex.wait();
    getInstance()->finishedThreads.addLast(tcb->getListNode());
    getInstance()->mutex.signal();
}

ThreadCollector::ThreadCollector() : readyToDelete(0) {
    threadCollector = TCB::createKernelThread([](void *){ThreadCollector::getInstance()->run();}, nullptr);
}

[[noreturn]] void ThreadCollector::run() {
    while (true) {
        readyToDelete.wait();
        mutex.wait();
        delete finishedThreads.removeFirst();
        mutex.signal();
    }
}

ThreadCollector::~ThreadCollector() {
    while (!finishedThreads.isEmpty()) {
        delete finishedThreads.removeFirst();
    }
    delete threadCollector;
}

