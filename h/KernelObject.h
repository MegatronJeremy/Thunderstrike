//
// Created by xparh on 5/10/2022.
//

#ifndef OS_PROJEKAT_KERNELOBJECT_H
#define OS_PROJEKAT_KERNELOBJECT_H

#include "MemoryAllocator.h"

class KernelObject {
public:
    static void *operator new(size_t size) {
        return kmalloc(size);
    }

    static void *operator new[](size_t size) {
        return kmalloc(size);
    }

    static void operator delete(void *addr) {
        kfree(addr);
    }

    static void operator delete[](void *addr) {
        kfree(addr);
    }
};

#endif //OS_PROJEKAT_KERNELOBJECT_H
