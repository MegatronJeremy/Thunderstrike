#ifndef _MEMORYALLOCATOR_HPP
#define _MEMORYALLOCATOR_HPP

#include "../lib/hw.h"
#include "Mutex.hpp"

// Heap memory allocator kernel implementation - first fit algorithm and explicit free list
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
