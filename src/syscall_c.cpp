#include "../h/syscall_c.h"

void *callSupervisorTrap(uint64 param, void *args) {
    __asm__ volatile ("ecall");

    return (void *) param;
}

_thread::_thread(_thread::Body body, void *arg) : id(0), body(body), arg(arg) {
}

_sem::~_sem() {
    sem_close(this);
}

void *mem_alloc(size_t size) {
    if (!size) return nullptr;
    size = (size - 1) / MEM_BLOCK_SIZE + 1;
    return callSupervisorTrap(0x01, (void *) size);
}

int mem_free(void *addr) {
    return (uint64) callSupervisorTrap(0x02, addr);
}

int thread_create(thread_t *handle, void(*start_routine)(void *), void *arg) {
    if (!handle) return -1;

    *handle = new _thread;
    if (!*handle) return -1;

    void *stack = new uint64[DEFAULT_STACK_SIZE];
    if (!stack) return -1;

    uint64 args[] = {(uint64) *handle, (uint64) start_routine, (uint64) arg, (uint64) stack};
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
