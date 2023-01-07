#include "../h/SlabAllocator.hpp"

#include "../h/BuddyAllocator.hpp"
#include "../h/Math.h"
#include "../h/HashMap.hpp"

using namespace String;

Cache *SlabAllocator::usedCacheHead = nullptr;

Cache *SlabAllocator::usedCacheTail = nullptr;

Mutex *SlabAllocator::mutex = nullptr;

Cache **SlabAllocator::bufferCache = nullptr;

Cache *SlabAllocator::cacheCache = nullptr;

Cache *SlabAllocator::slabCache = nullptr;

Cache *SlabAllocator::slotCache = nullptr;

BuddyAllocator *SlabAllocator::buddyAllocator = nullptr;

const char *SlabAllocator::bufferCacheNames[BUFFER_CACHE_SIZE] = {"size-32", "size-64", "size-128", "size-256",
                                                                  "size-512", "size-1024", "size-2048",
                                                                  "size-4096", "size-8192", "size-16384",
                                                                  "size-32768", "size-65536", "size-131072"};

void SlabAllocator::initSlabAllocator(void *space, int blockNum) {
    buddyAllocator = new(space) BuddyAllocator(space, blockNum);
    uint8 *allocatorHeaderSpace = (uint8 *) space + buddyAllocator->getSize();

    // allocate header space at block 0 of the buddy allocator
    balloc(sizeof(MapEntry<void *, Slot *> *) * DEFAULT_HASH_SIZE +
           buddyAllocator->getSize() +
           2 * sizeof(Mutex) + sizeof(Slab) + 2 * sizeof(Cache) + sizeof(MapCache) +
           sizeof(*bufferCache) * BUFFER_CACHE_SIZE
    );

    mutex = new(allocatorHeaderSpace) Mutex;
    allocatorHeaderSpace += sizeof(Mutex);

    Mutex *hashMutex = new(allocatorHeaderSpace) Mutex;
    allocatorHeaderSpace += sizeof(Mutex);

    HashMap<void *, MapCache::Slot *>::initHashTable(allocatorHeaderSpace, hashMutex);
    allocatorHeaderSpace += sizeof(MapEntry<void *, Slot *> *) * DEFAULT_HASH_SIZE;

    Slab *slab = new(allocatorHeaderSpace) Slab;
    allocatorHeaderSpace += sizeof(Slab);
    slabCache = new(allocatorHeaderSpace) Cache("slab", sizeof(Slab),
                                                [](void *obj) {
                                                    new(obj) Slab;
                                                },
                                                [](void *obj) {
                                                    delete (Slab *) obj;
                                                }, slab);
    allocatorHeaderSpace += sizeof(Cache);

    slotCache = new(allocatorHeaderSpace) Cache("slot", sizeof(Slot),
                                                [](void *obj) {
                                                    new(obj) Slot;
                                                },
                                                [](void *obj) {
                                                    delete (Slot *) obj;
                                                });
    allocatorHeaderSpace += sizeof(Cache);

    cacheCache = new(allocatorHeaderSpace) MapCache("cache", sizeof(MapCache));
    allocatorHeaderSpace += sizeof(MapCache);

    bufferCache = (Cache **) allocatorHeaderSpace;
    for (int i = 0; i < BUFFER_CACHE_SIZE; i++)
        bufferCache[i] = nullptr;
}

void *SlabAllocator::balloc(size_t size) {
    if (!buddyAllocator) return nullptr;
    return buddyAllocator->balloc(size);
}

int SlabAllocator::bfree(void *obj) {
    if (!buddyAllocator) return -1;
    return buddyAllocator->bfree(obj);
}

void SlabAllocator::addUsedCacheHeader(Cache *cache) {
    DummyMutex dummy(mutex);

    // add to used list
    cache->prev = usedCacheTail;
    usedCacheTail = (!usedCacheTail ? usedCacheHead : usedCacheTail->next) = cache;
    usedCacheTail->next = nullptr;
}

Cache *SlabAllocator::getCacheHeader() {
    if (!cacheCache) return nullptr;
    Cache *cache = (Cache *) cacheCache->allocate();
    return cache;
}

Cache::Slab *SlabAllocator::getSlabHeader() {
    if (!slabCache) return nullptr;
    Slab *slab = (Slab *) slabCache->allocate();
    return slab;
}

MapCache::Slot *SlabAllocator::getSlotHeader() {
    if (!slotCache) return nullptr;
    Slot *slot = (Slot *) slotCache->allocate();
    return slot;
}

void SlabAllocator::returnCache(Cache *cache) {
    if (!cache || !cacheCache) return;

    DummyMutex dummy(mutex);

    // remove from used list
    (!cache->prev ? usedCacheHead : cache->prev->next) = cache->next;
    (!cache->next ? usedCacheTail : cache->next->prev) = cache->prev;

    cacheCache->free(cache);
}

void SlabAllocator::returnSlab(Slab *slab) {
    if (!slab || !slabCache) return;

    slabCache->free(slab);
}

void SlabAllocator::returnSlot(Slot *slot) {
    if (!slot || !slotCache) return;

    slotCache->free(slot);
}

void *SlabAllocator::allocateBuffer(size_t bufferSize) {
    ushort bucket = MIN_BUFFER_BUCKET;
    size_t size = (1 << MIN_BUFFER_BUCKET);

    while (size < bufferSize && bucket < MAX_BUFFER_BUCKET) {
        size <<= 1;
        bucket++;
    }

    if (bufferSize > size || !mutex) return nullptr;

    ushort ind = bucket - MIN_BUFFER_BUCKET;

    mutex->wait();
    if (bufferCache[ind] == nullptr) {
        const char *name = bufferCacheNames[ind];
        bufferCache[ind] = new MapCache(name, size);
    }
    mutex->signal();

    return bufferCache[ind]->allocate();
}

void SlabAllocator::deallocateBuffer(const void *obj) {
    MapCache::sFree(obj);
}

ushort SlabAllocator::getOptimalBucket(size_t objSize) {
    ushort minBucket = MAX_BUCKET;
    size_t bucketSize = (1 << MAX_BUCKET) * BLOCK_SIZE;

    if (objSize > bucketSize) return 0;

    size_t minFragment = bucketSize % objSize;

    bucketSize = BLOCK_SIZE;
    for (ushort bck = 0; bck < MAX_BUCKET; bck++, bucketSize <<= 1) {
        if (bucketSize < objSize) continue;
        size_t currFragment = bucketSize % objSize;
        if (currFragment < minFragment || (currFragment == minFragment && bck < minBucket)) {
            minFragment = currFragment;
            minBucket = bck;
        }
    }

    return minBucket;
}

size_t SlabAllocator::getNumberOfSlots(size_t slotSize, ushort bucket) {
    return (1 << bucket) * BLOCK_SIZE / slotSize;
}

void SlabAllocator::printAllCacheInfo() {
    Cache *curr = usedCacheHead;
    while (curr) {
        curr->printCacheInfo();
        curr = curr->next;
    }
}

void SlabAllocator::printAllCacheError() {
    Cache *curr = usedCacheHead;
    while (curr) {
        curr->printCacheError();
        curr = curr->next;
    }
}

void SlabAllocator::printBlocksFreed() {
    size_t blocksFreed = 0, t;
    do {
        t = SlabAllocator::shrinkAllCaches();
        blocksFreed += t;
    } while (t > 0);

    DummyMutex dummy(getPrintMutex());
    kprint("Blocks freed: ");
    kprint(blocksFreed);
    kprint("\n");
}

size_t SlabAllocator::shrinkAllCaches() {
    Cache *curr = usedCacheHead;
    size_t blocksFreed = 0;
    while (curr) {
        blocksFreed += curr->shrinkCache();
        curr = curr->next;
    }
    return blocksFreed;
}

Cache *SlabAllocator::find(const char *name) {
    DummyMutex dummy(mutex);

    Cache *curr = usedCacheHead;
    while (curr) {
        if (strcmp(curr->getName(), name) == 0) {
            return curr;
        }
        curr = curr->next;
    }
    return nullptr;
}
