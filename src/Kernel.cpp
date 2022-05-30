#include "../h/Kernel.hpp"
#include "../h/MemoryAllocator.hpp"
#include "../h/Riscv.hpp"
#include "../h/TCB.hpp"
#include "../h/TimerInterrupt.hpp"
#include "../h/SysPrint.hpp"
#include "../h/LinkedHashTable.hpp"
#include "../h/KConsole.hpp"
#include "../h/syscall_c.h"

void Kernel::handleSystemCall() {
    uint64 context = TCB::running->getSavedContext();

    uint64 code = Riscv::r_a0();
    void *args = (void *) Riscv::r_a1();

    switch (code) {
        case (MEM_ALLOC):
            mem_alloc((size_t) args);
            Riscv::pushRegisterA0(context);
            break;
        case (MEM_FREE):
            mem_free(args);
            Riscv::pushRegisterA0(context);
            break;
        case (THREAD_CREATE):
            thread_create((uint64 *) args);
            Riscv::pushRegisterA0(context);
            break;
        case (THREAD_EXIT):
            thread_exit();
            Riscv::pushRegisterA0(context);
            break;
        case (THREAD_DISPATCH):
            thread_dispatch();
            break;
        case (THREAD_CREATE_SUSPENDED):
            thread_create_suspended((uint64 *) args);
            Riscv::pushRegisterA0(context);
            break;
        case (THREAD_START):
            thread_start((uint64) args);
            Riscv::pushRegisterA0(context);
            break;
        case(SEM_OPEN):
            sem_open((uint64 *) args);
            Riscv::pushRegisterA0(context);
            break;
        case(SEM_CLOSE):
            sem_close((uint64) args);
            Riscv::pushRegisterA0(context);
            break;
        case(SEM_WAIT):
            sem_wait((uint64) args);
            Riscv::pushRegisterA0(context);
            break;
        case(SEM_SIGNAL):
            sem_signal((uint64) args);
            Riscv::pushRegisterA0(context);
            break;
        case(TIME_SLEEP):
            time_sleep((time_t) args);
            Riscv::pushRegisterA0(context);
            break;
        case(GETC):
            getc();
            Riscv::pushRegisterA0(context);
            break;
        case(PUTC):
            putc((uint64) args);
            break;
        default:
            kprintString("Unknown system call: ");
            kprintUnsigned(code, 16);
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
    auto *handle = (uint64 *) args[0];
    if (!handle) return -2;

    auto body = (TCB::Body) args[1];
    if (!body) return -3;

    void *arg = (void *) args[2];
    auto *stack = (uint64 *) args[3];

    TCB *thr = TCB::createUserThread(body, arg, stack);
    if (!thr) return -4;

    if (LinkedHashTable<TCB>::insert(thr->getHashNode()) < 0)
        return -5;
    *handle = thr->getId();

    return 0;
}

int Kernel::thread_exit() {
    int ret = -1;
    if (LinkedHashTable<TCB>::remove(TCB::running->getId()) < 0)
        ret = -2;

    TCB::exit();

    return ret;
}

void Kernel::thread_dispatch() {
    TCB::dispatch();
}

int Kernel::thread_create_suspended(uint64 *args) {
    auto *handle = (uint64 *) args[0];
    if (!handle) return -2;

    auto body = (TCB::Body) args[1];
    if (!body) return -3;

    void *arg = (void *) args[2];
    auto *stack = (uint64 *) args[3];

    TCB *thr = TCB::createUserThread(body, arg, stack, false);
    if (!thr) return -4;

    if (LinkedHashTable<TCB>::insert(thr->getHashNode()) < 0)
        return -5;
    *handle = thr->getId();

    return 0;
}

int Kernel::thread_start(uint64 id) {
    TCB *thr = LinkedHashTable<TCB>::get(id);
    if (!thr) return -1;

    if (TCB::start(thr) < 0)
        return -2;

    return 0;
}

int Kernel::sem_open(uint64 *args) {
    auto *handle = (uint64 *) args[0];
    if (!handle) return -1;

    int init = (int) args[1];

    auto *sem = new KSemaphore(init);
    if (!sem) return -2;

    if (LinkedHashTable<KSemaphore>::insert(sem->getHashNode()) < 0)
        return -3;
    *handle = sem->getId();

    return 0;
}

int Kernel::sem_close(uint64 id) {
    KSemaphore *sem = LinkedHashTable<KSemaphore>::get(id);
    if (!sem) return -1;

    if (LinkedHashTable<KSemaphore>::remove(id) < 0)
        return -2;

    delete sem;

    return 0;
}

int Kernel::sem_wait(uint64 id) {
    KSemaphore *sem = LinkedHashTable<KSemaphore>::get(id);
    if (!sem) return -1;

    if (sem->wait() < 0)
        return -2;

    return 0;
}

int Kernel::sem_signal(uint64 id) {
    KSemaphore *sem = LinkedHashTable<KSemaphore>::get(id);
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
    return KConsole::getInstance()->getc();
}

void Kernel::putc(char chr) {
    KConsole::getInstance()->putc(chr);
}

