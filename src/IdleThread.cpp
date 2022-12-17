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
    idleThread = TCB::createThread([](void *) { IdleThread::run(); }, nullptr);
    idleThread->setIdle();
}

[[noreturn]] void IdleThread::run() {
    while (true);
}

