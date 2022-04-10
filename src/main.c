#include "../h/syscall_c.h"

void main() {
    __asm__ volatile("csrw stvec, %[vector]" : : [vector] "r" (&supervisorTrap));

    void *a = mem_alloc(100);
    void *b = mem_alloc(1000);
    void *c = mem_alloc(10000);
    mem_free(b);
    mem_free(a);
    mem_free(c);
}

