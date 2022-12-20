#include "../h/Cache.hpp"
#include "../h/SlabAllocator.hpp"

Cache::Cache(const char *name, const size_t objSize, Cache::Constructor ctor, Cache::Destructor dtor) :
        name(name),
        objSize(objSize),
        ctor(ctor), dtor(dtor),
        optimalBucket(SlabAllocator::getOptimalBucket(slotSize)),
        slotsPerSlab(SlabAllocator::getNumberOfSlots(slotSize, optimalBucket)) {
    SlabAllocator::addUsedCacheHeader(this);
    addEmptySlab();
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
    if (!slab) return nullptr;

    // select a free slot
    Slot *slot = slab->getSlot();
    slab->slotNum--;

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

    return slot->slotSpace;
}

void Cache::free(void *obj) {
    if (!obj) return;

    if (dtor) dtor(obj);

    DummyMutex dummy(&mutex);

    Slot *slot = (Slot *) ((uint8 *) obj - sizeof(Slot));

    Slab *slab = slot->parentSlab;

    slab->putSlot(slot);
    slab->slotNum++;

    SlabState newState = FULL;
    if (slab->slotNum == 1) {
        newState = PARTIAL;
    } else if (slab->slotNum == slotsPerSlab) {
        newState = EMPTY;
    }

    if (newState != FULL) {
        // move to new state list
        slabList[slab->state].remove(slab);
        slab->state = newState;
        slabList[newState].put(slab);
    }
}

void Cache::sFree(const void *obj) {
    if (!obj) return;

    Slot *slot = (Slot *) ((uint8 *) obj - sizeof(Slot));
    Cache *cache = slot->parentCache;
    cache->free(slot->slotSpace);
}

int Cache::shrinkCache() {
    if (!newSlabsAllocated) return 0;

    DummyMutex dummy(&mutex);

    newSlabsAllocated = false;
    Slab *slab;

    int i = 0;
    while ((slab = slabList[EMPTY].get()) != nullptr) {
        SlabAllocator::returnSlab(slab);
        i++;
    }
    return i;
}

void Cache::addEmptySlab() {
    Slab *slab = SlabAllocator::getSlabHeader();

    if (!slab) return;

    initEmptySlab(slab);

    DummyMutex dummy(&mutex);

    numberOfSlabs++;
    cacheSizeBlocks += (1 << optimalBucket);
}

Cache::Slot *Cache::Slab::getSlot() {
    if (!slotHead) return nullptr;

    Slot *ret = slotHead;

    slotHead = slotHead->next;
    if (!slotHead) slotTail = nullptr;

    return ret;
}

void Cache::Slab::putSlot(Cache::Slot *slot) {
    if (!slot) return;

    slotTail = (!slotTail ? slotHead : slotTail->next) = slot;
    slot->next = nullptr;
}

Cache::Slab *Cache::SlabList::get() {
    return head;
}

void Cache::SlabList::put(Cache::Slab *slab) {
    if (!slab) return;

    slab->prev = tail;
    (!tail ? head : tail->next) = slab;
    slab->next = nullptr;
}

void Cache::SlabList::remove(Cache::Slab *slab) {
    (!slab->prev ? head : slab->prev->next) = slab->next;
    (!slab->next ? tail : slab->next->prev) = slab->prev;
    slab->prev = slab->next = nullptr;
}


void Cache::initEmptySlab(Slab *slab) {
    //TODO
    Slot *curr = (Slot *) mmalloc(byteToBlocks(BLOCK_SIZE * (1 << optimalBucket)));
    if (!curr) return;

    slab->slotNum = slotsPerSlab;
    slab->state = EMPTY;
    slab->slotHead = slab->slotTail = nullptr;

    for (ushort i = 0; i < slotsPerSlab; i++) {
        curr->parentSlab = slab;
        curr->parentCache = this;
        curr->slotSpace = (uint8 *) curr + sizeof(Slot);

        if (ctor) ctor(curr->slotSpace);

        slab->putSlot(curr);

        curr = (Slot *) ((uint8 *) curr + slotSize);
    }

    slabList[EMPTY].put(slab);
}

void *Cache::operator new(size_t) {
    return SlabAllocator::getCacheHeader();
}

void Cache::operator delete(void *obj) {
    SlabAllocator::returnCache((Cache *) obj);
}

