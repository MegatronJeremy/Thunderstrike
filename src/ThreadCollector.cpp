//
// Created by xparh on 5/9/2022.
//

#include "../h/ThreadCollector.h"
#include "../h/TCB.h"
#include "../h/Riscv.h"
#include "../h/TimerInterrupt.h"
#include "../h/SysPrint.h"

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
    threadCollector = new TCB([](void *){ThreadCollector::run();}, nullptr, DEFAULT_TIME_SLICE, true);
}

[[noreturn]] void ThreadCollector::run() {
    while (true) {
        getInstance()->readyToDelete.wait();
//        if (getInstance()->finishedThreads.getCount() == 0) continue;
        getInstance()->mutex.wait();
//        kprintString("Deleting thread...\n");
        delete getInstance()->finishedThreads.removeFirst();
        getInstance()->mutex.signal();
    }
}

ThreadCollector::~ThreadCollector() {
    while (!finishedThreads.isEmpty()) {
//        kprintString("Collector deleting...\n");
        delete finishedThreads.removeFirst();
    }
    delete threadCollector;
}

ThreadCollector *ThreadCollector::getInstance() {
    if (!instance) instance = new ThreadCollector;
    return instance;
}

