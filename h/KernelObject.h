#ifndef _KERNEL_OBJECT_H
#define _KERNEL_OBJECT_H

#include "MemoryAllocator.h"

class KernelObject {
public:
    static void *operator new(size_t size) {
        size = (size - 1) / MEM_BLOCK_SIZE + 1;
        return kmalloc(size);
    }

    static void *operator new[](size_t size) {
        size = (size - 1) / MEM_BLOCK_SIZE + 1;
        return kmalloc(size);
    }

    static void operator delete(void *addr) {
        kfree(addr);
    }

    static void operator delete[](void *addr) {
        kfree(addr);
    }
};

#endif
