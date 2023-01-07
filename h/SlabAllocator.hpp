#ifndef _SLABALLOCATOR_HPP
#define _SLABALLOCATOR_HPP

#include "../lib/hw.h"
#include "MapCache.hpp"
#include "DummyMutex.hpp"

class BuddyAllocator;

class SlabAllocator {
public:
    using Slab = MapCache::Slab;
    using Slot = MapCache::Slot;

    static void initSlabAllocator(void *space, int blockNum);

    static ushort getOptimalBucket(size_t objSize);

    static size_t getNumberOfSlots(size_t slotSize, ushort bucket);

    static Cache *find(const char *name);

    static void *balloc(size_t size);

    static int bfree(void *obj);

    static void addUsedCacheHeader(Cache *header);

    static Cache *getCacheHeader();

    static Slab *getSlabHeader();

    static Slot *getSlotHeader();

    static void returnCache(Cache *);

    static void returnSlab(Slab *);

    static void returnSlot(Slot *);

    static void *allocateBuffer(size_t bufferSize);

    static void deallocateBuffer(const void *obj);

    static void printAllCacheInfo();

    static void printAllCacheError();

    static size_t shrinkAllCaches();

    static void printBlocksFreed();

private:
    static const ushort MAX_BUCKET = 5;

    static const ushort MAX_BUFFER_BUCKET = 17;

    static const ushort MIN_BUFFER_BUCKET = 5;

    static const ushort BUFFER_CACHE_SIZE = MAX_BUFFER_BUCKET - MIN_BUFFER_BUCKET + 1;

    static const char *bufferCacheNames[BUFFER_CACHE_SIZE];

    static BuddyAllocator *buddyAllocator;

    static Cache **bufferCache;

    static Cache *usedCacheHead, *usedCacheTail;

    static Cache *cacheCache;

    static Cache *slabCache;

    static Cache *slotCache;

    static Mutex *mutex;

};

#endif
