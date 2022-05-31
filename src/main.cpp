#include "../h/TCB.hpp"
#include "../h/Riscv.hpp"
#include "../h/TimerInterrupt.hpp"
#include "../h/SysPrint.hpp"
#include "../h/Scheduler.hpp"
#include "../h/ThreadCollector.hpp"
#include "../h/IdleThread.hpp"
#include "../h/KConsole.hpp"

void userMain();

int main() {
    KConsole::getInstance();
    ThreadCollector::getInstance();
    TCB *main = TCB::createKernelThread();
    TCB::running = main;

    TCB *uMain = TCB::createUserThread([](void *){userMain();}, nullptr);
    TCB::userMain = uMain;

    Riscv::w_stvec((uint64) &Riscv::supervisorTrap);

    uMain->join();
    TCB::yield();

    return 0;
}
