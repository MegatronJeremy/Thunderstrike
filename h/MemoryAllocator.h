#ifndef _MemoryAllocator_h
#define _MemoryAllocator_h

#include "../lib/hw.h"

class MemoryAllocator {

public:
    MemoryAllocator(const MemoryAllocator &) = delete;
    void operator=(const MemoryAllocator &) = delete;

    static MemoryAllocator *getInstance();

    void *malloc(size_t size);
    int free(void *addr);

private:
    struct FreeSegDesc {
        size_t size;

        FreeSegDesc *next;
    };

    size_t freeMemSize;
    FreeSegDesc *segDescHead;

    static MemoryAllocator *instance;

    static void initMemoryAllocator();

    static int tryToJoin(FreeSegDesc *curr);
};


#endif
