#include "../h/Kernel.h"
#include "../h/MemoryAllocator.h"
#include "../h/Riscv.h"
#include "../h/TCB.h"
#include "../h/TimerInterrupt.h"
#include "../h/SysPrint.h"
#include "../lib/console.h"

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
            sem_close((KernelSemaphore **) args);
            Riscv::pushRegisterA0(context);
            break;
        case(0x23):
            sem_wait((KernelSemaphore **) args);
            Riscv::pushRegisterA0(context);
            break;
        case(0x24):
            sem_signal((KernelSemaphore **) args);
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
    if (!handle) return -1;
    TCB::Body body = (TCB::Body) args[1];
    void *arg = (void *) args[2];
    *handle = TCB::createThread(body, arg);
    return *handle != nullptr;
}

int Kernel::thread_exit() {
    TCB::exit();
    return -1;
}

void Kernel::thread_dispatch() {
    TCB::running->dispatch();
}

int Kernel::sem_open(uint64 *args) {
    KernelSemaphore **handle = (KernelSemaphore **) args[0];
    if (!handle) return -1;
    unsigned int init = (unsigned int) args[1];
    *handle = new KernelSemaphore(init);
    return *handle != nullptr;
}

int Kernel::sem_close(KernelSemaphore **sem) {
    if (!sem || !*sem) return -1;
    delete *sem;
    *sem = nullptr;

    return 0;
}

int Kernel::sem_wait(KernelSemaphore **sem) {
    if (!sem || !*sem) return -1;
    (*sem)->wait();
    return 0;
}

int Kernel::sem_signal(KernelSemaphore **sem) {
    if (!sem || !*sem) return -1;
    (*sem)->signal();
    return 0;
}

int Kernel::time_sleep(time_t time) {
    if (time < 0) return -1;
    TimerInterrupt::block(TCB::running, time);
    return 0;
}

char Kernel::getc() {
    return __getc();
}

void Kernel::putc(char c) {
    __putc(c);
}

