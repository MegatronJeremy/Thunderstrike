#include "../h/IdleThread.h"
#include "../h/TCB.h"

IdleThread *IdleThread::getInstance() {
    static auto *instance = new IdleThread;
    return instance;
}

IdleThread::IdleThread() {
    idleThread = TCB::createUserThread([](void *){IdleThread::run();}, nullptr);
    idleThread->setIdle();
}

TCB *IdleThread::getIdleThread() {
    return getInstance()->idleThread;
}

[[noreturn]] void IdleThread::run() {
    while (true);
}

IdleThread::~IdleThread() {
    delete idleThread;
}


