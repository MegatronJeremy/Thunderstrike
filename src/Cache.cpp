#include "../h/Cache.hpp"
#include "../h/SlabAllocator.hpp"
#include "../h/BuddyAllocator.hpp"
#include "../h/SysPrint.hpp"
#include "../h/MemorySegments.hpp"

Cache::Cache(const char *name, size_t objSize, Cache::Constructor ctor, Cache::Destructor dtor) :
        name(name),
        objSize(objSize),
        ctor(ctor), dtor(dtor),
        optimalBucket(SlabAllocator::getOptimalBucket(slotSize)),
        slotsPerSlab(SlabAllocator::getNumberOfSlots(slotSize, optimalBucket)) {
    SlabAllocator::addUsedCacheHeader(this);
    addEmptySlab();
}

Cache::Cache(const char *name, size_t objSize, Slab *slab, Cache::Constructor ctor, Cache::Destructor dtor) :
        name(name),
        objSize(objSize),
        ctor(ctor), dtor(dtor),
        optimalBucket(SlabAllocator::getOptimalBucket(slotSize)),
        slotsPerSlab(SlabAllocator::getNumberOfSlots(slotSize, optimalBucket)),
        isCacheOfSlabs(true) {
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
    if (!slab) return nullptr;

    // select a free slot
    Slot *slot = slab->getSlot();

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
    if (!obj ||
        (size_t) obj < (size_t) MemorySegments::getKernelHeapStartAddr() ||
        (size_t) obj >= (size_t) MemorySegments::getKernelHeapEndAddr())
        return;

    DummyMutex dummy(&mutex);

    Slot *slot = (Slot *) ((uint8 *) obj - sizeof(Slot));

    Slab *slab = slot->parentSlab;

    slab->putSlot(slot);

    allocatedSlots--;

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
    if (!obj ||
        (size_t) obj < (size_t) MemorySegments::getKernelHeapStartAddr() ||
        (size_t) obj >= (size_t) MemorySegments::getKernelHeapEndAddr())
        return;

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
    while ((slab = slabList[EMPTY].poll()) != nullptr) {
        slab->destroySlots(dtor);

        SlabAllocator::returnSlab(slab);

        numberOfSlabs--;

        i++;
    }
    return i;
}

void Cache::addEmptySlab() {
    Slab *slab = SlabAllocator::getSlabHeader();

    addEmptySlab(slab);
}

void Cache::addEmptySlab(Slab *slab) {
    if (!slab) return;

    DummyMutex dummy(&mutex);

    initEmptySlab(slab);

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

void Cache::Slab::destroySlots(Destructor dtor) {
    if (dtor != nullptr) {
        Slot *curr = slotHead;
        while (curr) {
            Slot *old = curr;
            dtor(old->slotSpace);
            curr = curr->next;
        }
    }
    SlabAllocator::bfree(slotHead);

    slotHead = slotTail = nullptr;
    slotNum = 0;
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

void Cache::initEmptySlab(Slab *slab) {
    Slot *curr = (Slot *) SlabAllocator::balloc(BLOCK_SIZE * (1 << optimalBucket));
    if (!curr) return;

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

void *Cache::operator new(size_t, void *addr) {
    return addr;
}

void Cache::operator delete(void *obj) {
    SlabAllocator::returnCache((Cache *) obj);
}

Cache::~Cache() {
    for (int i = 0; i < 2; i++) {
        Slab *slab;

        while ((slab = slabList[i].poll()) != nullptr) {
            slab->destroySlots(dtor);

            SlabAllocator::returnSlab(slab);
        }
    }
    numberOfSlabs = 0;
}

void Cache::printCacheInfo() const {
    kprintString(name);
    kprintString("\t");
    kprintInteger(objSize);
    kprintString("\t");
    kprintInteger(numberOfSlabs * (1ULL << optimalBucket));
    kprintString("\t");
    kprintInteger(numberOfSlabs);
    kprintString("\t");
    kprintInteger(slotsPerSlab);
    kprintString("\t");
    kprintInteger(100 * allocatedSlots / (slotsPerSlab * numberOfSlabs));
    kprintString("%\n");
}