#ifndef _MEMORYALLOCATOR_HPP
#define _MEMORYALLOCATOR_HPP

#include "../lib/hw.h"
#include "DummyMutex.hpp"

// Heap memory allocator kernel implementation - first fit algorithm and explicit free list
class MemoryAllocator {
public:
    MemoryAllocator(const MemoryAllocator &) = delete;

    void operator=(const MemoryAllocator &) = delete;

    static MemoryAllocator *getInstance();

    static void *malloc(size_t size);

    static int free(void *addr);

    void *operator new(size_t);

    void operator delete(void *);

private:
    struct BlockHeader {
        size_t size;
        bool free;
        BlockHeader *next;
    };

    MemoryAllocator();

    void *mmalloc(size_t size);

    int mfree(void *addr);

    static int tryToJoin(BlockHeader *curr);

    static const void *USER_HEAP_START_ADDR;

    static const void *USER_HEAP_END_ADDR;

    static size_t USER_HEAP_SIZE;

    BlockHeader *freeMemHead;

    Mutex mutex;

};

#endif
