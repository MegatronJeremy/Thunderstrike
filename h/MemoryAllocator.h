#ifndef _MEMORYALLOCATOR_H
#define _MEMORYALLOCATOR_H

#include "../lib/hw.h"
#include "Mutex.h"

class MemoryAllocator {
public:
    MemoryAllocator(const MemoryAllocator &) = delete;
    void operator=(const MemoryAllocator&) = delete;

    static MemoryAllocator *getInstance();

    void *malloc(size_t size);
    int free(void *addr);

    void *operator new(size_t);
    void operator delete(void *);

private:
    MemoryAllocator();

    struct BlockHeader {
        size_t size;
        bool free;
        BlockHeader *next;
    };

    BlockHeader *freeMemHead;
    Mutex mutex;

    static size_t maxFreeMem;

    static int tryToJoin(BlockHeader *curr);

};

#endif
