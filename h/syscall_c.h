#ifndef _syscall_c
#define _syscall_c

#include "../lib/hw.h"

void supervisorTrap();

void callSupervisorTrap(uint code, void *args);

void* mem_alloc(size_t size);

int mem_free(void*);

#endif