#include "../h/SlabAllocator.hpp"

#include "../h/BuddyAllocator.hpp"
#include "../h/String.hpp"

using namespace String;

Cache *SlabAllocator::usedCacheHead = nullptr;

Cache *SlabAllocator::usedCacheTail = nullptr;

Mutex *SlabAllocator::mutex = nullptr;

Cache **SlabAllocator::bufferCache = nullptr;

Cache *SlabAllocator::cacheDesc = nullptr;

Cache *SlabAllocator::slabDesc = nullptr;

BuddyAllocator *SlabAllocator::buddyAllocator = nullptr;

const char *SlabAllocator::bufferCacheNames[BUFFER_CACHE_SIZE] = {"size-5", "size-6", "size-7", "size-8", "size-9",
                                                                  "size-10", "size-11", "size-12", "size-13",
                                                                  "size-14", "size-15", "size-16", "size-17"};

void SlabAllocator::initSlabAllocator(void *space, int blockNum) {
    buddyAllocator = new(space) BuddyAllocator(space, blockNum);

    uint8 *allocatorHeaderSpace = (uint8 *) space + buddyAllocator->getSize();

    // allocate header space at block 0 of the buddy allocator
    balloc((size_t) allocatorHeaderSpace - (size_t) space
           + sizeof(Mutex) + sizeof(Slab) + 2 * sizeof(Cache) +
           sizeof(*bufferCache) * BUFFER_CACHE_SIZE);

    mutex = new(allocatorHeaderSpace) Mutex;
    allocatorHeaderSpace += sizeof(Mutex);

    Slab *slab = new(allocatorHeaderSpace) Slab;
    allocatorHeaderSpace += sizeof(Slab);

    slabDesc = new(allocatorHeaderSpace) Cache("slab", sizeof(Slab), slab,
                                               [](void *obj) {
                                                   new(obj) Slab;
                                               },
                                               [](void *obj) {
                                                   delete (Slab *) obj;
                                               });

    allocatorHeaderSpace += sizeof(Cache);

    cacheDesc = new(allocatorHeaderSpace) Cache("cache", sizeof(Cache));

    allocatorHeaderSpace += sizeof(Cache);

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

Cache *SlabAllocator::getCacheHeader() {
    if (!cacheDesc) return nullptr;
    Cache *cache = (Cache *) cacheDesc->allocate();
    return cache;
}

void SlabAllocator::addUsedCacheHeader(Cache *cache) {
    DummyMutex dummy(mutex);

    // add to used list
    cache->prev = usedCacheTail;
    usedCacheTail = (!usedCacheTail ? usedCacheHead : usedCacheTail->next) = cache;
    usedCacheTail->next = nullptr;
}

Cache::Slab *SlabAllocator::getSlabHeader() {
    if (!slabDesc) return nullptr;
    Slab *slab = (Slab *) slabDesc->allocate();
    return slab;
}

void SlabAllocator::returnCache(Cache *cache) {
    if (!cache || !cacheDesc) return;

    DummyMutex dummy(mutex);

    // remove from used list
    (!cache->prev ? usedCacheHead : cache->prev->next) = cache->next;
    (!cache->next ? usedCacheTail : cache->next->prev) = cache->prev;

    cacheDesc->free(cache);
}

void SlabAllocator::returnSlab(Slab *slab) {
    if (!slab || !slabDesc) return;

    slabDesc->free(slab);
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
        bufferCache[ind] = new Cache(name, size);
    }
    mutex->signal();

    return bufferCache[ind]->allocate();
}

void SlabAllocator::deallocateBuffer(const void *obj) {
    Cache::sFree(obj);
}

ushort SlabAllocator::getOptimalBucket(size_t slotSize) {
    ushort minBucket = MAX_BUCKET;
    size_t bucketSize = (1 << MAX_BUCKET) * BLOCK_SIZE;

    if (slotSize > bucketSize) return 0;

    size_t minFragment = bucketSize % slotSize;

    bucketSize = BLOCK_SIZE;
    for (ushort bck = 0; bck < MAX_BUCKET; bck++) {
        if (bucketSize < slotSize) continue;
        size_t currFragment = bucketSize % slotSize;
        if (currFragment < minFragment) {
            minFragment = currFragment;
            minBucket = bck;
        }
        bucketSize <<= 1;
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

bool SlabAllocator::contains(const char *name) {
    DummyMutex dummy(mutex);

    Cache *curr = usedCacheHead;
    while (curr) {
        if (strcmp(curr->getName(), name) == 0) {
            return true;
        }
        curr = curr->next;
    }
    return false;
}
