#include "../h/syscall_c.h"

uint64 pc;

void callSupervisorTrap(uint code, void *args) {
    __asm__ volatile ("ecall");
}

void *mem_alloc(size_t size) {
    size *= MEM_BLOCK_SIZE;
    callSupervisorTrap(0x01, (void *) size);

    void *ret;
    __asm__ volatile ("sd x10, 0(%[address])" : [address] "=r" (ret));
    return ret;
}

int mem_free(void *addr) {
    callSupervisorTrap(0x02, addr);

    int ret;
    __asm__ volatile ("sd x10, 0(%[address])" : [address] "=r" (ret));
    return ret;
}
