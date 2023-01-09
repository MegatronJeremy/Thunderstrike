#include "../h/syscall_c.h"

uint64 callSupervisorTrap(uint64 param, uint64 arg) {
    __asm__ volatile ("ecall");

    return param;
}

void *mem_alloc(size_t size) {
    if (!size) return 0;
    size = (size - 1) / MEM_BLOCK_SIZE + 1;
    return (void *) callSupervisorTrap(MEM_ALLOC, size);
}

int mem_free(void *addr) {
    return (int) callSupervisorTrap(MEM_FREE, (uint64) addr);
}

int thread_create(thread_t *handle, void(*start_routine)(void *), void *arg) {
    void *stack = mem_alloc(sizeof(uint64) * DEFAULT_STACK_SIZE);
    if (!stack) return -1;

    uint64 args[] = {(uint64) handle, (uint64) start_routine, (uint64) arg, (uint64) stack};
    return (int) callSupervisorTrap(THREAD_CREATE, (uint64) args);
}

int thread_exit() {
    return (int) callSupervisorTrap(THREAD_EXIT, 0);
}

void thread_dispatch() {
    callSupervisorTrap(THREAD_DISPATCH, 0);
}

int thread_create_suspended(thread_t *handle, void(*start_routine)(void *), void *arg) {
    void *stack = mem_alloc(sizeof(uint64) * DEFAULT_STACK_SIZE);
    if (!stack) return -1;

    uint64 args[] = {(uint64) handle, (uint64) start_routine, (uint64) arg, (uint64) stack};
    return (int) callSupervisorTrap(THREAD_CREATE_SUSPENDED, (uint64) args);
}

int thread_start(thread_t handle) {
    return (int) callSupervisorTrap(THREAD_START, (uint64) handle);
}

int thread_destroy(thread_t handle) {
    return (int) callSupervisorTrap(THREAD_DESTROY, (uint64) handle);
}

int sem_open(sem_t *handle, unsigned init) {
    uint64 args[] = {(uint64) handle, (uint64) init};

    return (int) callSupervisorTrap(SEM_OPEN, (uint64) args);
}

int sem_close(sem_t handle) {
    return (int) callSupervisorTrap(SEM_CLOSE, (uint64) handle);
}

int sem_wait(sem_t handle) {
    return (int) callSupervisorTrap(SEM_WAIT, (uint64) handle);
}

int sem_signal(sem_t handle) {
    return (int) callSupervisorTrap(SEM_SIGNAL, (uint64) handle);
}

int time_sleep(time_t time) {
    return (int) callSupervisorTrap(TIME_SLEEP, time);
}

char getc() {
    return callSupervisorTrap(GETC, 0);
}

void putc(char chr) {
    callSupervisorTrap(PUTC, chr);
}

void printS(char const *string) {
    callSupervisorTrap(PRINT_STRING, (uint64) string);
}

void printI(int integer, int base) {
    uint64 args[] = {(uint64) integer, (uint64) base};
    callSupervisorTrap(PRINT_INT, (uint64) args);
}

void printU(uint64 x, int base) {
    uint64 args[] = {(uint64) x, (uint64) base};
    callSupervisorTrap(PRINT_UNSIGNED, (uint64) args);
}
