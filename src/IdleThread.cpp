#include "../h/IdleThread.h"
#include "../h/TCB.h"
#include "../h/SysPrint.h"

IdleThread *IdleThread::instance = nullptr;

IdleThread *IdleThread::getInstance() {
    if (!instance) instance = new IdleThread;
    return instance;
}

IdleThread::IdleThread() {
    idleThread = new TCB([](void *){IdleThread::getInstance()->run();}, nullptr, DEFAULT_TIME_SLICE);
    idleThread->setIdle();
}

[[noreturn]] void IdleThread::run() {
    while (true);
}

IdleThread::~IdleThread() {
//    kprintString("Idle deleting...\n");
    delete idleThread;
}

TCB *IdleThread::getIdleThread() {
    return getInstance()->idleThread;
}
