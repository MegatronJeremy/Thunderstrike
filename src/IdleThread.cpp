#include "../h/IdleThread.hpp"
#include "../h/TCB.hpp"

TCB *IdleThread::idleThread = nullptr;

TCB *IdleThread::getIdleThread() {
    if (idleThread == nullptr) {
        initIdleThread();
    }

    return idleThread;
}

void IdleThread::initIdleThread() {
    idleThread = TCB::createObj([](void *) { IdleThread::run(); }, nullptr, TCB::KERNEL);
    idleThread->setIdle();
}

[[noreturn]] void IdleThread::run() {
    while (true);
}

