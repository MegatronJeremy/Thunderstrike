#ifndef _KOBJECT_HPP
#define _KOBJECT_HPP

#include "../lib/hw.h"

void *kmalloc(size_t);

int kfree(void *);

size_t byteToBlocks(size_t size);

static constexpr uint64 DEFAULT_BUFFER_SIZE = 2048;

constexpr uint64 DEFAULT_HASH_SIZE = 1499;

// Base apstract class for kernel objects - contains necessary memory allocation / deallocation templates
class KObject {
public:
    static void *operator new(size_t size) {
        return kmalloc(byteToBlocks(size));
    }

    static void *operator new[](size_t size) {
        return kmalloc(byteToBlocks(size));
    }

    static void operator delete(void *addr) {
        kfree(addr);
    }

    static void operator delete[](void *addr) {
        kfree(addr);
    }

    virtual ~KObject() = 0;
};

#endif
