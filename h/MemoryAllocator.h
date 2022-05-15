#ifndef _MEMORYALLOCATOR_H
#define _MEMORYALLOCATOR_H

#include "../lib/hw.h"
#include "Mutex.h"

void *kmalloc(size_t size);
int kfree(void *addr);

class MemoryAllocator {
public:
    static MemoryAllocator *getInstance();

    void *malloc(size_t size);
    int free(void *addr);

    void *operator new(size_t);

private:
    MemoryAllocator();

    struct BlockHeader {
        size_t size;
        bool free;
        BlockHeader *next;
    };

    BlockHeader *freeMemHead;
    Mutex mutex;

    static MemoryAllocator *instance;

    static int tryToJoin(BlockHeader *curr);

};

#endif
