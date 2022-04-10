#include "../h/TCB.h"
#include "../h/Riscv.h"
#include "../h/TimerInterrupt.h"
#include "../h/SysPrint.h"
#include "../h/Scheduler.h"
#include "../h/ThreadCollector.h"
#include "../h/IdleThread.h"

extern void userMain();

int main() {
    kprintString("Starting main\n");
    TCB *main = TCB::createThread(nullptr, nullptr);
    kprintString("Created main thread\n");
    TCB::running = main;

    TCB *uMain = TCB::createThread([](void *){userMain();}, nullptr);
    kprintString("Created user main thread\n");

    Riscv::w_stvec((uint64) &Riscv::supervisorTrap);

    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    uMain->join();

    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);

    delete ThreadCollector::getInstance();
    delete IdleThread::getInstance();
    delete TimerInterrupt::getInstance();
    delete Scheduler::getInstance();

    kprintString("Main finished\n");

    return 0;
}
