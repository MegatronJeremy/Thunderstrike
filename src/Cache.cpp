#include "../h/Cache.hpp"
#include "../h/SlabAllocator.hpp"
#include "../h/BuddyAllocator.hpp"
#include "../h/MemorySegments.hpp"

using namespace String;

void Cache::initCache(const char *name, size_t objS) {
    initCache(name, objS, nullptr, nullptr, nullptr);
}

void Cache::initCache(const char *name, size_t objS, Constructor ct, Destructor dt) {
    initCache(name, objS, ct, dt, nullptr);
}

void Cache::initCache(const char *name, size_t objS, Constructor ct, Destructor dt, Slab *slab) {
    objSize = objS;
    ctor = ct;
    dtor = dt;
    optimalBucket = SlabAllocator::getOptimalBucket(getPartitionSize());
    slotsPerSlab = SlabAllocator::getNumberOfSlots(getPartitionSize(), optimalBucket);
    isCacheOfSlabs = (slab != nullptr);

    strncpy(cacheName, name, CACHE_NAME_SIZE, ' ');
    cacheName[CACHE_NAME_SIZE] = '\0';

    allocatedSlots = 0;
    numberOfSlabs = 0;
    errorCode = NO_ERROR;
    next = prev = nullptr;
    newSlabsAllocated = false;
    cacheShrunk = false;

    SlabAllocator::addUsedCacheHeader(this);
    addEmptySlab(slab);
}

void *Cache::allocate() {
    DummyMutex dummy(&mutex);

    Slab *slab = slabList[PARTIAL].get();
    if (!slab) {
        slab = slabList[EMPTY].get();
    }
    if (!slab) {
        addEmptySlab();
        newSlabsAllocated = true;
        slab = slabList[EMPTY].get();
    }
    if (!slab) {
        return nullptr;
    }

    // select a free slot
    Slot *slot = slab->getSlot();
    if (!slot) {
        errorCode = NO_SLOT_AVAIL;
        return nullptr;
    }

    slot->setSlotAllocated();

    allocatedSlots++;

    SlabState newState = EMPTY;
    if (slab->slotNum == 0) {
        // move to full list
        newState = FULL;
    } else if (slab->slotNum == slotsPerSlab - 1) {
        // move to partially full list
        newState = PARTIAL;
    }

    if (newState != EMPTY) {
        // move to new state list
        slabList[slab->state].remove(slab);
        slab->state = newState;
        slabList[newState].put(slab);
    }

    if (isCacheOfSlabs && allocatedSlots == numberOfSlabs * slotsPerSlab) {
        addEmptySlab((Slab *) slot->slotSpace);

        return allocate();
    }

    return slot->slotSpace;
}

void Cache::free(void *obj) {
    Slot *slot = getSlot(obj);

    if (!slot) {
        errorCode = INVALID_FREE_OBJ;
        return;
    }

    free(slot);
}

void Cache::sFree(const void *obj) {
    if (!obj ||
        (size_t) obj < (size_t) MemorySegments::getKernelHeapStartAddr() ||
        (size_t) obj >= (size_t) MemorySegments::getKernelHeapEndAddr()) {
        return;
    }

    Slot *slot = (Slot *) ((uint8 *) obj - sizeof(Slot));

    Cache *cache = slot->parentSlab->parentCache;
    cache->free(slot);

    cache->shrinkCache();
}

void Cache::free(Slot *slot) {
    DummyMutex dummy(&mutex);

    Slab *slab = slot->parentSlab;

    slab->putSlot(slot);

    slot->setSlotFree();

    allocatedSlots--;

    SlabState newState = FULL;
    if (slab->slotNum == slotsPerSlab) {
        newState = EMPTY;
    } else if (slab->slotNum == 1) {
        newState = PARTIAL;
    }

    if (newState != FULL) {
        // move to new state list
        slabList[slab->state].remove(slab);
        slab->state = newState;
        slabList[newState].put(slab);
    }
}

int Cache::shrinkCache() {
    DummyMutex dummy(&mutex);

    if (cacheShrunk && newSlabsAllocated) {
        newSlabsAllocated = false;
        return 0;
    }

    cacheShrunk = true;
    newSlabsAllocated = false;

    Slab *slab;

    int i = 0;
    while ((slab = slabList[EMPTY].poll()) != nullptr) {
        destroySlots(slab);

        SlabAllocator::returnSlab(slab);

        numberOfSlabs--;

        i++;
    }
    return (int) (i * (1ULL << optimalBucket));
}

void Cache::addEmptySlab(Slab *slab) {
    DummyMutex dummy(&mutex);

    if (!slab) slab = SlabAllocator::getSlabHeader();

    if (!slab) {
        errorCode = NO_SLAB_AVAIL;
        return;
    }

    if (initEmptySlab(slab) == 0)
        numberOfSlabs++;
}

Cache::Slot *Cache::Slab::getSlot() {
    if (!slotHead) return nullptr;

    Slot *ret = slotHead;

    slotHead = slotHead->next;
    if (!slotHead) slotTail = nullptr;

    slotNum--;

    return ret;
}

void Cache::Slab::putSlot(Cache::Slot *slot) {
    if (!slot) return;

    slotTail = (!slotTail ? slotHead : slotTail->next) = slot;
    slot->next = nullptr;

    slotNum++;
}

void Cache::destroySlots(Slab *slab) {
    Slot *curr = slab->slotHead;
    while (curr) {
        Slot *old = curr;
        curr = curr->next;
        old->destroy();
    }
    if (SlabAllocator::bfree(slab->startSpace) < 0)
        errorCode = SLAB_FREE_FAILURE;

    slab->slotHead = slab->slotTail = nullptr;
    slab->slotNum = 0;
}

Cache::Slab *Cache::SlabList::get() {
    return head;
}

Cache::Slab *Cache::SlabList::poll() {
    if (!head) return nullptr;

    Slab *ret = head;
    remove(head);

    return ret;
}

void Cache::SlabList::put(Cache::Slab *slab) {
    if (!slab) return;

    slab->prev = tail;
    tail = (!tail ? head : tail->next) = slab;
    slab->next = nullptr;
}

void Cache::SlabList::remove(Cache::Slab *slab) {
    (!slab->prev ? head : slab->prev->next) = slab->next;
    (!slab->next ? tail : slab->next->prev) = slab->prev;
    slab->prev = slab->next = nullptr;
}

void Cache::Slot::destroy() {
    Destructor dt = parentSlab->parentCache->dtor;
    if (dt) dt(slotSpace);
}

int Cache::initEmptySlab(Slab *slab) {
    uint8 *space = (uint8 *) SlabAllocator::balloc(BLOCK_SIZE * (1 << optimalBucket));
    if (!space) {
        errorCode = NO_SLAB_SPACE;
        SlabAllocator::returnSlab(slab);
        return -1;
    }

    slab->parentCache = this;
    slab->startSpace = space;

    populateSlab(slab, space);

    slabList[EMPTY].put(slab);

    return 0;
}

void Cache::populateSlab(Slab *slab, uint8 *space) {
    Slot *curr = (Slot *) new(space) Slot;
    for (size_t i = 0; i < slotsPerSlab; i++) {
        curr->parentSlab = slab;
        curr->state = FREE;

        space = space + sizeof(Slot);
        curr->slotSpace = space;

        if (ctor) ctor(space);

        slab->putSlot(curr);

        space = space + objSize;
        if (i < slotsPerSlab - 1)
            curr = (Slot *) new(space) Slot;
    }
}

Cache::Slot *Cache::getSlot(void *obj) {
    if (!obj ||
        (size_t) obj < (size_t) MemorySegments::getKernelHeapStartAddr() ||
        (size_t) obj >= (size_t) MemorySegments::getKernelHeapEndAddr()) {
        return nullptr;
    }

    return (Slot *) ((uint8 *) obj - sizeof(Slot));
}

void Cache::destroyCache() {
    for (int i = 0; i < 2; i++) {
        Slab *slab;

        while ((slab = slabList[i].poll()) != nullptr) {
            destroySlots(slab);

            SlabAllocator::returnSlab(slab);
        }
    }
    numberOfSlabs = 0;
}

void Cache::printCacheInfo() const {
    DummyMutex dummy(getPrintMutex());
    kprint(cacheName);
    kprint("\t");
    kprint(objSize);
    kprint("\t");
    kprint(numberOfSlabs * (1UL << optimalBucket));
    kprint("\t");
    kprint(numberOfSlabs);
    kprint("\t");
    kprint(slotsPerSlab);
    kprint("\t");
    kprint(numberOfSlabs == 0 ? 100 : 100 * allocatedSlots / (slotsPerSlab * numberOfSlabs));
    kprint("%\n");
}

void Cache::printCacheError() const {
    DummyMutex dummy(getPrintMutex());
    kprint(cacheName);
    kprint("\t");
    switch (errorCode) {
        case NO_ERROR:
            kprint("No error in this cache.\n");
            break;
        case NO_SLAB_AVAIL:
            kprint("No slab descriptor available.\n");
            break;
        case NO_SLAB_SPACE:
            kprint("No space for slab allocation.\n");
            break;
        case INVALID_FREE_OBJ:
            kprint("Invalid pointer was passed to cache free.\n");
            break;
        case NO_SLOT_SPACE:
            kprint("No space for slot allocaiton.\n");
            break;
        case NO_SLOT_AVAIL:
            kprint("No slot descriptor available.\n");
            break;
        case SLAB_FREE_FAILURE:
            kprint("Buddy allocator failed to free slab.\n");
            break;
    }
}
