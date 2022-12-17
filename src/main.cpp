#include "../h/TCB.hpp"
#include "../h/Riscv.hpp"
#include "../h/TimerInterrupt.hpp"
#include "../h/SysPrint.hpp"
#include "../h/Scheduler.hpp"
#include "../h/ThreadCollector.hpp"
#include "../h/IdleThread.hpp"
#include "../h/KConsole.hpp"
#include "../h/SlabAllocator.hpp"

void userMain();

int main() {
    SlabAllocator::initSlabAllocator(nullptr, 0);
    KConsole::initKConsole();
    ThreadCollector::initThreadCollector();
    TimerInterrupt::initTimerInterrupt();
    TCB *main = TCB::createKernelThread();
    TCB::running = main;

    TCB *uMain = TCB::createThread([](void *){userMain();}, nullptr);
    TCB::userMain = uMain;

    Riscv::w_stvec((uint64) &Riscv::supervisorTrap);

    uMain->join();
    TCB::yield();

    return 0;
}
