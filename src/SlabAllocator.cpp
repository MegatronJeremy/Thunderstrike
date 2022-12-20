#include "../h/SlabAllocator.hpp"

Cache *SlabAllocator::usedCacheHead = nullptr;

Cache *SlabAllocator::usedCacheTail = nullptr;

Cache *SlabAllocator::freeCacheHead = nullptr;

Cache *SlabAllocator::freeCacheTail = nullptr;

Cache::Slab *SlabAllocator::freeSlabHead = nullptr;

Cache::Slab *SlabAllocator::freeSlabTail = nullptr;

Mutex *SlabAllocator::mutex;

Cache *SlabAllocator::bufferCache[BUFFER_CACHE_SIZE] = {nullptr};

void SlabAllocator::initSlabAllocator(void *space, int blockNum) {
    //TODO
    // init buddyAllocator (space, blockNum)
//    mutex = new Mutex;

    expandCacheDescriptors();

    expandSlabDescriptors();
}

void SlabAllocator::expandCacheDescriptors() {
//    DummyMutex dummy(mutex);

    //TODO
    static const ushort optimalCacheBucket = getOptimalBucket(sizeof(Cache));

    auto *curr = (Cache *) mmalloc(byteToBlocks((1 << optimalCacheBucket) * BLOCK_SIZE));
    if (!curr) return;

    const size_t cacheDscPerBucket = getNumberOfSlots(sizeof(Cache), optimalCacheBucket);

    for (size_t i = 0; i < cacheDscPerBucket; i++) {
        curr->prev = freeCacheTail;
        freeCacheTail = (!freeCacheTail ? freeCacheHead : freeCacheTail->next) = curr;
        curr = (Cache *) ((uint8 *) curr + sizeof(Cache));
    }
    freeCacheTail->next = nullptr;
}

void SlabAllocator::expandSlabDescriptors() {
//    DummyMutex dummy(mutex);

    //TODO
    static const ushort optimalSlabBucket = getOptimalBucket(sizeof(Slab));

    Slab *curr = (Slab *) mmalloc(byteToBlocks((1 << optimalSlabBucket) * BLOCK_SIZE));
    if (!curr) return;

    static size_t slabDscPerBucket = getNumberOfSlots(sizeof(Slab), optimalSlabBucket);

    for (size_t i = 0; i < slabDscPerBucket; i++) {
        freeSlabTail = (!freeSlabTail ? freeSlabHead : freeSlabTail->next) = curr;
        curr = (Slab *) ((uint8 *) curr + sizeof(Slab));
    }
    freeSlabTail->next = nullptr;
}

Cache *SlabAllocator::getCacheHeader() {
//    DummyMutex dummy(mutex);

    if (!freeCacheHead) expandCacheDescriptors();
    if (!freeCacheHead) return nullptr;

    Cache *ret = freeCacheHead;

    // move head of free list
    freeCacheHead = freeCacheHead->next;
    (!freeCacheHead ? freeCacheTail : freeCacheHead->prev) = nullptr;

    return ret;
}

void SlabAllocator::addUsedCacheHeader(Cache *cache) {
//    DummyMutex dummy(mutex);

    // add to used list
    cache->prev = usedCacheTail;
    usedCacheTail = (!usedCacheTail ? usedCacheHead : usedCacheTail->next) = cache;
    usedCacheTail->next = nullptr;
}

Cache::Slab *SlabAllocator::getSlabHeader() {
//    DummyMutex dummy(mutex);

    if (!freeSlabHead) expandSlabDescriptors();
    if (!freeSlabHead) return nullptr;

    Slab *ret = freeSlabHead;

    // move head of free list
    freeSlabHead = freeSlabHead->next;
    if (!freeSlabHead) freeSlabTail = nullptr;

    return ret;
}

void SlabAllocator::returnCache(Cache *cache) {
//    DummyMutex dummy(mutex);

    if (!cache) return;

    // remove from used list
    (!cache->prev ? usedCacheHead : cache->prev->next) = cache->next;
    (!cache->next ? usedCacheTail : cache->next->prev) = cache->prev;

    // add to free list
    cache->prev = freeCacheTail;
    freeCacheTail = (!freeCacheTail ? freeCacheHead : freeCacheTail->next) = cache;
    freeCacheTail->next = nullptr;
}

void SlabAllocator::returnSlab(Slab *slab) {
//    DummyMutex dummy(mutex);

    if (!slab) return;

    // return to free list
    freeSlabTail = (!freeSlabTail ? freeSlabHead : freeSlabTail->next) = slab;
    freeSlabTail->next = nullptr;
}

void *SlabAllocator::allocateBuffer(size_t bufferSize) {
    ushort bucket = MIN_BUFFER_BUCKET;
    size_t size = (1 << MIN_BUFFER_BUCKET);

    while (size < bufferSize && bucket < MAX_BUFFER_BUCKET) {
        size <<= 1;
        bucket++;
    }

    if (bufferSize > size) return nullptr;

    ushort ind = bucket - MIN_BUFFER_BUCKET;
    if (bufferCache[ind] == nullptr) {
        const char *name = "size-";
        bufferCache[ind] = new Cache(name, size);
    }

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
