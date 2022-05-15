#include "../h/TCB.h"
#include "../h/Riscv.h"
#include "../h/TimerInterrupt.h"
#include "../h/SysPrint.h"
#include "../h/Scheduler.h"
#include "../h/ThreadCollector.h"
#include "../h/IdleThread.h"

void userMain();

int main() {
    KernelConsole::getInstance();
    ThreadCollector::getInstance();
    TCB *main = TCB::createKernelThread();
    TCB::running = main;
    kprintString("Created main thread\n");

    TCB *uMain = TCB::createUserThread([](void *){userMain();}, nullptr);
    kprintString("Created user main thread\n");

    Riscv::w_stvec((uint64) &Riscv::supervisorTrap);

    uMain->join();
    TCB::yield();

    delete IdleThread::getInstance();
    delete ThreadCollector::getInstance();
    delete TimerInterrupt::getInstance();
    delete Scheduler::getInstance();

    kprintString("Main finished\n");

    return 0;
}
