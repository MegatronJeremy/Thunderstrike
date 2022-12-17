#include "../h/SlabAllocator.hpp"
#include "../h/Cache.hpp"
#include "../h/KObject.hpp"

Cache *SlabAllocator::usedCacheHead = nullptr;

Cache *SlabAllocator::usedCacheTail = nullptr;

Cache *SlabAllocator::freeCacheHead = nullptr;

Cache *SlabAllocator::freeCacheTail = nullptr;

Cache::Slab *SlabAllocator::freeSlabHead = nullptr;

Cache::Slab *SlabAllocator::freeSlabTail = nullptr;

void SlabAllocator::initSlabAllocator(void *space, int blockNum) {
    //TODO
    // init buddyAllocator (space, blockNum)

    expandCacheDescriptors();

    expandSlabDescriptors();
}

void SlabAllocator::expandCacheDescriptors() {
    //TODO
    static const ushort optimalCacheBucket = getOptimalBucket(sizeof(Cache));

    Cache *curr = (Cache *) kmalloc(byteToBlocks((1 << optimalCacheBucket) * BLOCK_SIZE));
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
    //TODO
    static const ushort optimalSlabBucket = getOptimalBucket(sizeof(Slab));

    Slab *curr = (Slab *) kmalloc(byteToBlocks((1 << optimalSlabBucket) * BLOCK_SIZE));
    if (!curr) return;

    static size_t slabDscPerBucket = getNumberOfSlots(sizeof(Slab), optimalSlabBucket);

    for (size_t i = 0; i < slabDscPerBucket; i++) {
        freeSlabTail = (!freeSlabTail ? freeSlabHead : freeSlabTail->next) = curr;
        curr = (Slab *) ((uint8 *) curr + sizeof(Slab));
    }
    freeSlabTail->next = nullptr;
}

Cache *SlabAllocator::getCacheHeader() {
    if (!freeCacheHead) expandCacheDescriptors();
    if (!freeCacheHead) return nullptr;

    Cache *ret = freeCacheHead;

    // move head of free list
    freeCacheHead = freeCacheHead->next;
    (!freeCacheHead ? freeCacheTail : freeCacheHead->prev) = nullptr;

    return ret;
}

void SlabAllocator::addUsedCacheHeader(Cache *cache) {
    // add to used list
    cache->prev = usedCacheTail;
    usedCacheTail = (!usedCacheTail ? usedCacheHead : usedCacheTail->next) = cache;
    usedCacheTail->next = nullptr;
}

Cache::Slab *SlabAllocator::getSlabHeader() {
    if (!freeSlabHead) expandSlabDescriptors();
    if (!freeSlabHead) return nullptr;

    Slab *ret = freeSlabHead;

    // move head of free list
    freeSlabHead = freeSlabHead->next;
    if (!freeSlabHead) freeSlabTail = nullptr;

    return ret;
}

void SlabAllocator::returnCache(Cache *cache) {
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
    if (!slab) return;

    // return to free list
    freeSlabTail = (!freeSlabTail ? freeSlabHead : freeSlabTail->next) = slab;
    freeSlabTail->next = nullptr;
}

const ushort SlabAllocator::getOptimalBucket(size_t slotSize) {
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

const size_t SlabAllocator::getNumberOfSlots(size_t slotSize, ushort bucket) {
    return (1 << bucket) * BLOCK_SIZE / slotSize;
}