#ifndef _syscall_cpp
#define _syscall_cpp

#include "syscall_c.h"

void* operator new(size_t);
void operator delete(void *);

#endif
