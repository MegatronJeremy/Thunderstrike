#include "../h/Cache.hpp"
#include "../h/SlabAllocator.hpp"
#include "../h/BuddyAllocator.hpp"
#include "../h/MemorySegments.hpp"

using namespace String;

Cache::Cache(const char *name, size_t objSize, Cache::Constructor ctor, Cache::Destructor dtor, Slab *slab) :
        objSize(objSize),
        ctor(ctor), dtor(dtor),
        optimalBucket(SlabAllocator::getOptimalBucket(objSize + sizeof(Slot))),
        slotsPerSlab(SlabAllocator::getNumberOfSlots(objSize + sizeof(Slot), optimalBucket)),
        isCacheOfSlabs(slab != nullptr) {

    strncpy(cacheName, name, CACHE_NAME_SIZE, ' ');
    cacheName[CACHE_NAME_SIZE] = '\0';

    SlabAllocator::addUsedCacheHeader(this);
    if (slab != nullptr) addEmptySlab(slab);
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
        (size_t) obj >= (size_t) MemorySegments::getKernelHeapEndAddr()) {
        errorCode = INVALID_FREE_OBJ;
        return;
    }

    Slot *slot = (Slot *) ((uint8 *) obj - sizeof(Slot));

    Cache::free(slot);
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
}

void Cache::free(Slot *slot) {
    DummyMutex dummy(&mutex);

    Slab *slab = slot->parentSlab;

    slab->putSlot(slot);

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
    if (!newSlabsAllocated) return 0;

    DummyMutex dummy(&mutex);

    newSlabsAllocated = false;
    Slab *slab;

    int i = 0;
    while ((slab = slabList[EMPTY].poll()) != nullptr) {
        destroySlots(slab);

        SlabAllocator::returnSlab(slab);

        numberOfSlabs--;

        i++;
    }
    return i * (1ULL << optimalBucket);
}

void Cache::addEmptySlab(Slab *slab) {
    DummyMutex dummy(&mutex);

    if (!slab) slab = SlabAllocator::getSlabHeader();

    if (!slab) {
        errorCode = NO_SLAB_AVAIL;
        return;
    }

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

void Cache::destroySlots(Slab *slab) {
    if (dtor != nullptr) {
        Slot *curr = slab->slotHead;
        while (curr) {
            Slot *old = curr;
            dtor(old->slotSpace);
            curr = curr->next;
        }
    }
    SlabAllocator::bfree(slab->slotHead);

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

void Cache::initEmptySlab(Slab *slab) {
    Slot *curr = (Slot *) SlabAllocator::balloc(BLOCK_SIZE * (1 << optimalBucket));
    if (!curr) {
        errorCode = NO_SLAB_SPACE;
        return;
    }

    slab->parentCache = this;

    for (ushort i = 0; i < slotsPerSlab; i++) {
        curr->parentSlab = slab;
        curr->slotSpace = (uint8 *) curr + sizeof(Slot);

        if (ctor) ctor(curr->slotSpace);

        slab->putSlot(curr);

        curr = (Slot *) ((uint8 *) curr + objSize + sizeof(Slot));
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
    kprint(100 * allocatedSlots / (slotsPerSlab * numberOfSlabs));
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
    }
}

Cache::~Cache() {
    for (int i = 0; i < 2; i++) {
        Slab *slab;

        while ((slab = slabList[i].poll()) != nullptr) {

            // should not call virtual function from destructor
            if (dtor != nullptr) {
                Slot *curr = slab->slotHead;
                while (curr) {
                    Slot *old = curr;
                    dtor(old->slotSpace);
                    curr = curr->next;
                }
            }
            SlabAllocator::bfree(slab->slotHead);

            slab->slotHead = slab->slotTail = nullptr;
            slab->slotNum = 0;

            SlabAllocator::returnSlab(slab);
        }
    }
    numberOfSlabs = 0;
}
