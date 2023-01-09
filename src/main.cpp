#include "../h/TCB.hpp"
#include "../h/Riscv.hpp"
#include "../h/TimerInterrupt.hpp"
#include "../h/Scheduler.hpp"
#include "../h/ThreadCollector.hpp"
#include "../h/KConsole.hpp"
#include "../h/MemorySegments.hpp"

void userMain();

void userMain1();

void userMain2();

using namespace MemorySegments;

int main() {
    kmem_init(getKernelHeapStartAddr(), (int) bytesToPages(getKernelHeapSize()));
    Scheduler::initScheduler();
    KConsole::initKConsole();
    ThreadCollector::initThreadCollector();
    TimerInterrupt::initTimerInterrupt();

    TCB *main = TCB::createObj(nullptr, nullptr, nullptr, TCB::KERNEL, false);
    TCB::running = main;

    TCB *uMain = TCB::createObj([](void *) { userMain(); }, nullptr);
    TCB::userMain = uMain;

    Riscv::w_stvec((uint64) &Riscv::supervisorTrap);

    uMain->join();
    TCB::yield();

    KConsole::flush();

    return 0;
}
