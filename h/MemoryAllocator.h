#ifndef _MemoryAllocator_h
#define _MemoryAllocator_h

#include "../lib/hw.h"

class Mutex;

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
//    BlockHeader *allocMemHead;
    Mutex *mutex;

    static MemoryAllocator *instance;

    static void initMemoryAllocator();

    static int tryToJoin(BlockHeader *curr);

};

void *kmalloc(size_t size);
int kfree(void *addr);

#endif
