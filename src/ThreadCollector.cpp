#include "../h/ThreadCollector.h"
#include "../h/TCB.h"
#include "../h/Riscv.h"

ThreadCollector *ThreadCollector::getInstance() {
    static auto *instance = new ThreadCollector;
    return instance;
}

void ThreadCollector::put(TCB *tcb) {
    mutex.wait();
    finishedThreads.addLast(tcb->getListNode());
    mutex.signal();
    readyToDelete.signal();
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

