#include "../h/syscall_c.h"
#include "../h/SysPrint.h"


void *callSupervisorTrap(uint64 param, void *args) {
    __asm__ volatile ("ecall");

    return (void *) param;
}

void *mem_alloc(size_t size) {
    return callSupervisorTrap(0x01, &size);
}

int mem_free(void *addr) {
    return (uint64) callSupervisorTrap(0x02, addr);
}

int thread_create(thread_t *handle, void(*start_routine)(void *), void *arg) {
    if (!handle) return -1;
    *handle = new _thread;
    uint64 args[] = {(uint64) handle, (uint64) start_routine, (uint64) arg};
    return (uint64) callSupervisorTrap(0x11, args);
}

int thread_exit() {
    return (uint64) callSupervisorTrap(0x12, 0);
}

void thread_dispatch() {
    callSupervisorTrap(0x13, 0);
}

int sem_open(sem_t *handle, unsigned init) {
    if (!handle) return -1;
    *handle = new _sem;
//    kprintString("Handle val: ");
//    kprintUnsigned((uint64) (*handle)->id);
//    kprintString("\n");
//    kprintString("Handle address: ");
//    kprintUnsigned((uint64) *handle);
//    kprintString("\n");

    uint64 args[] = {(uint64) *handle, (uint64) init};
    return (uint64) callSupervisorTrap(0x21, args);
}

int sem_close(sem_t handle) {
    return (uint64) callSupervisorTrap(0x22, handle);
}

int sem_wait(sem_t handle) {
    return (uint64) callSupervisorTrap(0x23, handle);
}

int sem_signal(sem_t handle) {
    return (uint64) callSupervisorTrap(0x24, handle);
}

int time_sleep(time_t time) {
    return (uint64) callSupervisorTrap(0x31, (void *) time);
}

char getc() {
    return (uint64) callSupervisorTrap(0x41, nullptr);
}

void putc(char chr) {
    callSupervisorTrap(0x42, (void *) (uint64) chr);
}
