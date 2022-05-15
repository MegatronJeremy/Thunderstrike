#include "../h/IdleThread.h"
#include "../h/TCB.h"

IdleThread *IdleThread::instance = nullptr;

IdleThread *IdleThread::getInstance() {
    if (!instance) instance = new IdleThread;
    return instance;
}

IdleThread::IdleThread() {
    idleThread = TCB::createKernelThread([](void *){IdleThread::getInstance()->run();}, nullptr);
    idleThread->setIdle();
}

[[noreturn]] void IdleThread::run() {
    while (true);
}

IdleThread::~IdleThread() {
    delete idleThread;
}

TCB *IdleThread::getIdleThread() {
    return getInstance()->idleThread;
}
