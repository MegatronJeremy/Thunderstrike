#include "../h/Kernel.h"
#include "../h/MemoryAllocator.h"
#include "../h/Riscv.h"
#include "../h/TCB.h"
#include "../h/TimerInterrupt.h"
#include "../h/SysPrint.h"
#include "../h/LinkedHashTable.h"

void Kernel::handleSystemCall() {
    uint64 context = TCB::running->getSavedContext();

    uint64 code = Riscv::r_a0();
    void *args = (void *) Riscv::r_a1();

    switch (code) {
        case (0x01):
            mem_alloc((size_t) args);
            Riscv::pushRegisterA0(context);
            break;
        case (0x02):
            mem_free(args);
            Riscv::pushRegisterA0(context);
            break;
        case (0x11):
            thread_create((uint64 *) args);
            Riscv::pushRegisterA0(context);
            break;
        case (0x12):
            thread_exit();
            Riscv::pushRegisterA0(context);
            break;
        case (0x13):
            thread_dispatch();
            break;
        case(0x21):
            sem_open((uint64 *) args);
            Riscv::pushRegisterA0(context);
            break;
        case(0x22):
            sem_close((uint64) args);
            Riscv::pushRegisterA0(context);
            break;
        case(0x23):
            sem_wait((uint64) args);
            Riscv::pushRegisterA0(context);
            break;
        case(0x24):
            sem_signal((uint64) args);
            Riscv::pushRegisterA0(context);
            break;
        case(0x31):
            time_sleep((time_t) args);
            Riscv::pushRegisterA0(context);
            break;
        case(0x41):
            getc();
            Riscv::pushRegisterA0(context);
            break;
        case(0x42):
            putc((uint64) args);
            break;
        default:
            kprintString("Unknown system call: ");
            kprintUnsigned(code);
            kprintString("\n");
            return;
    }
}

void *Kernel::mem_alloc(size_t size) {
    return kmalloc(size);
}

int Kernel::mem_free(void *addr) {
    return kfree(addr);
}

int Kernel::thread_create(uint64 *args) {
    TCB **handle = (TCB **) args[0];
    if (!handle) return -2;

    auto body = (TCB::Body) args[1];
    if (!body) return -3;

    void *arg = (void *) args[2];
    auto *stack = (uint64 *) args[3];

    TCB *thr = TCB::createUserThread(body, arg, stack);
    if (!thr) return -4;

    if (LinkedHashTable<TCB>::insert(thr->getHashNode()) < 0)
        return -5;

    return 0;
}

int Kernel::thread_exit() {
    LinkedHashTable<TCB>::remove(TCB::running->getId());

    TCB::exit();

    return -2;
}

void Kernel::thread_dispatch() {
    TCB::dispatch();
}

int Kernel::sem_open(uint64 *args) {
    auto **handle = (uint64 **) args[0];
    if (!handle) return -1;

    int init = (int) args[1];

    auto *sem = new KernelSemaphore(init);
    if (!sem) return -2;

    if (LinkedHashTable<KernelSemaphore>::insert(sem->getHashNode()) < 0)
        return -3;

    *handle = (uint64 *) sem->getId();

    return 0;
}

int Kernel::sem_close(uint64 id) {
    KernelSemaphore *sem = LinkedHashTable<KernelSemaphore>::get(id);
    if (!sem) return -1;

    if (LinkedHashTable<KernelSemaphore>::remove(id) < 0)
        return -2;

    delete sem;

    return 0;
}

int Kernel::sem_wait(uint64 id) {
    KernelSemaphore *sem = LinkedHashTable<KernelSemaphore>::get(id);
    if (!sem) return -1;

    if (sem->wait() < 0)
        return -2;

    return 0;
}

int Kernel::sem_signal(uint64 id) {
    KernelSemaphore *sem = LinkedHashTable<KernelSemaphore>::get(id);
    if (!sem) return -1;

    if (sem->signal() < 0)
        return -2;

    return 0;
}

int Kernel::time_sleep(time_t time) {
    if (time == 0) TCB::dispatch();
    else TimerInterrupt::getInstance()->block(TCB::running, time);
    return 0;
}

char Kernel::getc() {
    return KernelConsole::getc();
}

void Kernel::putc(char chr) {
    KernelConsole::putc(chr);
}

