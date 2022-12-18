#include "../h/TCB.hpp"
#include "../h/Riscv.hpp"
#include "../h/TimerInterrupt.hpp"
#include "../h/Scheduler.hpp"
#include "../h/ThreadCollector.hpp"
#include "../h/KConsole.hpp"

void userMain();

int main() {
    kmem_init(nullptr, 0);
    Scheduler::initScheduler();
    KConsole::initKConsole();
    ThreadCollector::initThreadCollector();
    TimerInterrupt::initTimerInterrupt();

    TCB *main = TCB::createKernelThread();
    TCB::running = main;

    TCB *uMain = TCB::createThread([](void *) { userMain(); }, nullptr);
    TCB::userMain = uMain;

    Riscv::w_stvec((uint64) &Riscv::supervisorTrap);

    uMain->join();
    TCB::yield();

    return 0;
}
