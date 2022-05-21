#include "../h/syscall_c.h"


void *callSupervisorTrap(uint64 param, void *args) {
    __asm__ volatile ("ecall");

    return (void *) param;
}

void *mem_alloc(size_t size) {
    if (!size) return 0;
    size = (size - 1) / MEM_BLOCK_SIZE + 1;
    return callSupervisorTrap(MEM_ALLOC, (void *) size);
}

int mem_free(void *addr) {
    return (uint64) callSupervisorTrap(MEM_FREE, addr);
}

int thread_create(thread_t *handle, void(*start_routine)(void *), void *arg) {
    void *stack = mem_alloc(sizeof(uint64) * DEFAULT_STACK_SIZE);
    if (!stack) return -1;

    uint64 args[] = {(uint64) handle, (uint64) start_routine, (uint64) arg, (uint64) stack};
    return (uint64) callSupervisorTrap(THREAD_CREATE, args);
}

int thread_exit() {
    return (uint64) callSupervisorTrap(THREAD_EXIT, 0);
}

void thread_dispatch() {
    callSupervisorTrap(0x13, 0);
}

int thread_create_suspended(thread_t *handle, void(*start_routine)(void *), void *arg) {
    void *stack = mem_alloc(sizeof(uint64) * DEFAULT_STACK_SIZE);
    if (!stack) return -1;

    uint64 args[] = {(uint64) handle, (uint64) start_routine, (uint64) arg, (uint64) stack};
    return (uint64) callSupervisorTrap(THREAD_CREATE_SUSPENDED, args);
}

int thread_start(thread_t handle) {
    return (uint64) callSupervisorTrap(THREAD_START, handle);
}

int sem_open(sem_t *handle, unsigned init) {
    uint64 args[] = {(uint64) handle, (uint64) init};

    return (uint64) callSupervisorTrap(SEM_OPEN, args);
}

int sem_close(sem_t handle) {
    return (uint64) callSupervisorTrap(SEM_CLOSE, handle);
}

int sem_wait(sem_t handle) {
    return (uint64) callSupervisorTrap(SEM_WAIT, handle);
}

int sem_signal(sem_t handle) {
    return (uint64) callSupervisorTrap(SEM_SIGNAL, handle);
}

int time_sleep(time_t time) {
    return (uint64) callSupervisorTrap(TIME_SLEEP, (void *) time);
}

char getc() {
    return (uint64) callSupervisorTrap(GETC, 0);
}

void putc(char chr) {
    callSupervisorTrap(PUTC, (void *) (uint64) chr);
}
