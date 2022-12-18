#ifndef _SLABALLOCATOR_HPP
#define _SLABALLOCATOR_HPP

#include "../lib/hw.h"
#include "../h/Cache.hpp"
#include "../h/DummyMutex.hpp"

class SlabAllocator {
public:
    using Slab = Cache::Slab;

    static void initSlabAllocator(void *space, int blockNum);

    static const ushort getOptimalBucket(size_t slotSize);

    static const size_t getNumberOfSlots(size_t slotSize, ushort bucket);

    static Cache *getCacheHeader();

    static void addUsedCacheHeader(Cache *header);

    static Slab *getSlabHeader();

    static void returnCache(Cache *);

    static void returnSlab(Slab *);

    static void *allocateBuffer(size_t bufferSize);

    static void deallocateBuffer(const void *obj);

    static const ushort MAX_BUCKET = 5;

private:

    static void expandCacheDescriptors();

    static void expandSlabDescriptors();

    static const ushort MAX_BUFFER_BUCKET = 17;

    static const ushort MIN_BUFFER_BUCKET = 5;

    static const ushort BUFFER_CACHE_SIZE = MAX_BUFFER_BUCKET - MIN_BUFFER_BUCKET + 1;

    static Cache *bufferCache[BUFFER_CACHE_SIZE];

    static Cache *usedCacheHead, *usedCacheTail;

    static Cache *freeCacheHead, *freeCacheTail;

    static Slab *freeSlabHead, *freeSlabTail;

    static Mutex *mutex;

};

#endif
