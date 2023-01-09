#include "../h/Kernel.hpp"
#include "../h/MemoryAllocator.hpp"
#include "../h/Riscv.hpp"
#include "../h/TCB.hpp"
#include "../h/TimerInterrupt.hpp"
#include "../h/HashMap.hpp"
#include "../h/KConsole.hpp"
#include "../h/syscall_c.h"

void Kernel::handleSystemCall() {
    uint64 context = TCB::running->getSavedContext();

    uint64 code = Riscv::r_a0();
    uint64 arg = Riscv::r_a1();

    switch (code) {
        case (MEM_ALLOC):
            mem_alloc(arg);
            Riscv::pushRegisterA0(context);
            break;
        case (MEM_FREE):
            mem_free((void *) arg);
            Riscv::pushRegisterA0(context);
            break;
        case (THREAD_CREATE):
            thread_create((uint64 *) arg);
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
            thread_create_suspended((uint64 *) arg);
            Riscv::pushRegisterA0(context);
            break;
        case (THREAD_START):
            thread_start(arg);
            Riscv::pushRegisterA0(context);
            break;
        case (THREAD_DESTROY):
            thread_destroy(arg);
            Riscv::pushRegisterA0(context);
            break;
        case (SEM_OPEN):
            sem_open((uint64 *) arg);
            Riscv::pushRegisterA0(context);
            break;
        case (SEM_CLOSE):
            sem_close(arg);
            Riscv::pushRegisterA0(context);
            break;
        case (SEM_WAIT):
            sem_wait(arg);
            Riscv::pushRegisterA0(context);
            break;
        case (SEM_SIGNAL):
            sem_signal(arg);
            Riscv::pushRegisterA0(context);
            break;
        case (TIME_SLEEP):
            time_sleep(arg);
            Riscv::pushRegisterA0(context);
            break;
        case (GETC):
            getc();
            Riscv::pushRegisterA0(context);
            break;
        case (PUTC):
            putc(arg);
            break;
        case (PRINT_STRING):
            print((const char *) arg);
            break;
        case (PRINT_INT):
            print((int) ((uint64 *) arg)[0], (int) ((uint64 *) arg)[1]);
            break;
        case (PRINT_UNSIGNED):
            print((uint64) ((uint64 *) arg)[0], (int) ((uint64 *) arg)[1]);
            break;
        default:
            DummyMutex dummy(String::getPrintMutex());
            String::kprint("Unknown system call: 0x");
            String::kprint(code, 16);
            String::kprint("\n");
            return;
    }
}

void *Kernel::mem_alloc(size_t size) {
    return mmalloc(size);
}

int Kernel::mem_free(void *addr) {
    return mfree(addr);
}

int Kernel::thread_create(uint64 *args) {
    auto *handle = (uint64 *) args[0];
    if (!handle) return -2;

    auto body = (TCB::Body) args[1];
    if (!body) return -3;

    void *arg = (void *) args[2];
    auto *stack = (uint64 *) args[3];

    TCB *thr = TCB::createObj(body, arg, stack);
    if (!thr) return -4;

    if (HashMap<int, TCB *>::put(thr->getMapEntry()) < 0)
        return -5;
    *handle = thr->getId();

    return 0;
}

int Kernel::thread_exit() {
    int ret = -1;
    if (HashMap<int, TCB *>::remove(TCB::running->getId()) < 0)
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

    TCB *thr = TCB::createObj(body, arg, stack, TCB::USER, false);
    if (!thr) return -4;

    if (HashMap<int, TCB *>::put(thr->getMapEntry()) < 0)
        return -5;
    *handle = thr->getId();

    return 0;
}

int Kernel::thread_start(uint64 id) {
    TCB *thr = HashMap<int, TCB *>::get(id);
    if (!thr) return -1;

    if (TCB::start(thr) < 0)
        return -2;

    return 0;
}

int Kernel::thread_destroy(uint64 id) {
    TCB *thr = HashMap<int, TCB *>::get(id);
    if (!thr) return -1;

    if (!thr->isAwaitingStart())
        return -2;

    thr->setFinished();

    if (HashMap<int, TCB *>::remove(id) < 0)
        return -3;

    thr->deleteObj();

    return 0;
}

int Kernel::sem_open(uint64 *args) {
    auto *handle = (uint64 *) args[0];
    if (!handle) return -1;

    int init = (int) args[1];

    auto *sem = KSemaphore::createObj(init);
    if (!sem) return -2;

    if (HashMap<int, KSemaphore *>::put(sem->getMapEntry()) < 0)
        return -3;
    *handle = sem->getId();

    return 0;
}

int Kernel::sem_close(uint64 id) {
    KSemaphore *sem = HashMap<int, KSemaphore *>::get(id);
    if (!sem) return -1;

    if (HashMap<int, KSemaphore *>::remove(id) < 0)
        return -2;

    sem->deleteObj();

    return 0;
}

int Kernel::sem_wait(uint64 id) {
    KSemaphore *sem = HashMap<int, KSemaphore *>::get(id);
    if (!sem) return -1;

    if (sem->wait() < 0)
        return -2;

    return 0;
}

int Kernel::sem_signal(uint64 id) {
    KSemaphore *sem = HashMap<int, KSemaphore *>::get(id);
    if (!sem) return -1;

    if (sem->signal() < 0)
        return -2;

    return 0;
}

int Kernel::time_sleep(time_t time) {
    if (time != 0) TimerInterrupt::block(TCB::running, time);
    TCB::dispatch();
    return 0;
}

char Kernel::getc() {
    return KConsole::getc();
}

void Kernel::putc(char chr) {
    KConsole::putc(chr);
}

void Kernel::print(const char *string) {
    String::kprint(string);
}

void Kernel::print(int integer, int base) {
    String::kprint(integer, base);
}

void Kernel::print(uint64 uint, int base) {
    String::kprint(uint, base);
}

