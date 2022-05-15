#ifndef _MEMORYALLOCATOR_H
#define _MEMORYALLOCATOR_H

#include "../lib/hw.h"

class Mutex;

void *kmalloc(size_t size);
int kfree(void *addr);

class MemoryAllocator {
public:
    static MemoryAllocator *getInstance();

    void *malloc(size_t size);
    int free(void *addr);

private:
    MemoryAllocator() = default;

    struct BlockHeader {
        size_t size;
        bool free;
        BlockHeader *next;
    };

    BlockHeader *freeMemHead;
    Mutex *mutex;

    static MemoryAllocator *instance;

    static void initMemoryAllocator();

    static int tryToJoin(BlockHeader *curr);

};

#endif
