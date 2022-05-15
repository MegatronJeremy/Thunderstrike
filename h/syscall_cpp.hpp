#ifndef _SYSCALL_CPP
#define _SYSCALL_CPP

#include "syscall_c.h"

void* operator new(size_t);
void operator delete(void *);

#endif
