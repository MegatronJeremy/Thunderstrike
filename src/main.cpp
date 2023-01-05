#include "../h/TCB.hpp"
#include "../h/Riscv.hpp"
#include "../h/TimerInterrupt.hpp"
#include "../h/Scheduler.hpp"
#include "../h/ThreadCollector.hpp"
#include "../h/KConsole.hpp"
#include "../h/MemorySegments.hpp"

#include "../h/SlabAllocator.hpp"

void userMain();

void userMain1();

void userMain2();

using namespace MemorySegments;

int main() {
    kmem_init(getKernelHeapStartAddr(),
              bytesToPages(getKernelHeapSize()));
    Scheduler::initScheduler();
    KConsole::initKConsole();
    ThreadCollector::initThreadCollector();
    TimerInterrupt::initTimerInterrupt();

    TCB *main = TCB::createObj(nullptr, nullptr, nullptr, TCB::KERNEL, false);
    TCB::running = main;

    TCB *uMain = TCB::createObj([](void *) { userMain1(); }, nullptr);
    TCB::userMain = uMain;

    Riscv::w_stvec((uint64) &Riscv::supervisorTrap);

    uMain->join();
    TCB::yield();

    SlabAllocator::printAllCacheInfo();
    SlabAllocator::printAllCacheError();

    KConsole::flush();

    return 0;
}
