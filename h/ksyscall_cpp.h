#ifndef _ksyscall_c
#define _ksyscall_c

#include "../lib/hw.h"

extern "C" void handleSupervisorTrap(uint code, void *args);

void* kmem_alloc(size_t size);

int kmem_free(void *);

#endif
