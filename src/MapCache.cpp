#include "../h/MapCache.hpp"
#include "../h/SlabAllocator.hpp"
#include "../h/BuddyAllocator.hpp"
#include "../h/HashMap.hpp"

using namespace String;

MapCache::MapCache(const char *name, size_t objSize, Constructor ctor, Destructor dtor) :
        Cache(name, objSize, ctor, dtor) {
    optimalBucket = SlabAllocator::getOptimalBucket(objSize);
    slotsPerSlab = SlabAllocator::getNumberOfSlots(objSize, optimalBucket);
}

void *MapCache::allocate() {
    DummyMutex dummy(&mutex);

    Slab *slab = slabList[PARTIAL].get();
    if (!slab) {
        slab = slabList[EMPTY].get();
    }
    if (!slab) {
        addEmptySlab();
        if (numberOfSlabs > 1) newSlabsAllocated = true;
        slab = slabList[EMPTY].get();
    }
    if (!slab) {
        return nullptr;
    }

    // select a free slot
    Slot *slot = (MapCache::Slot *) slab->getSlot();

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

    // insert in hash table for deallocation
    HashMap<void *, Slot *>::put(&slot->entry);

    return slot->entry.getKey();
}

void MapCache::free(void *obj) {
    DummyMutex dummy(&mutex);

    Slot *slot = HashMap<void *, Slot *>::get(obj);

    if (!slot) {
        errorCode = INVALID_FREE_OBJ;
        return;
    }

    HashMap<void *, Slot *>::remove(slot->entry.getKey());

    Cache::free(slot);
}

void MapCache::sFree(const void *obj) {
    if (!obj) {
        return;
    }

    Slot *slot = HashMap<void *, Slot *>::get((void *) obj);

    if (!slot) {
        return;
    }

    HashMap<void *, Slot *>::remove(slot->entry.getKey());

    Cache *cache = slot->parentSlab->parentCache;
    cache->free(slot);
}

void MapCache::destroySlots(Slab *slab) {
    if (dtor != nullptr) {
        Slot *curr = (MapCache::Slot *) slab->slotHead;
        while (curr) {
            Slot *old = curr;
            dtor(old->slotSpace);
            curr = (MapCache::Slot *) curr->next;
            SlabAllocator::returnSlot(old);
        }
    }
    SlabAllocator::bfree(slab->startSpace);

    slab->slotHead = slab->slotTail = nullptr;
    slab->slotNum = 0;
}

void MapCache::initEmptySlab(Slab *slab) {
    uint8 *space = (uint8 *) SlabAllocator::balloc(BLOCK_SIZE * (1 << optimalBucket));
    if (!space) {
        errorCode = NO_SLAB_SPACE;
        return;
    }

    slab->startSpace = space;
    slab->parentCache = this;

    Slot *curr;
    curr = SlabAllocator::getSlotHeader();

    for (ushort i = 0; i < slotsPerSlab; i++) {
        if (!curr) {
            errorCode = NO_SLOT_AVAIL;
            break;
        }

        curr->slotSpace = space;

        curr->entry.setKey(space);
        curr->entry.setValue(curr);

        curr->parentSlab = slab;

        if (ctor) ctor(curr->entry.getKey());

        slab->putSlot(curr);

        space = space + objSize;

        if (i < slotsPerSlab - 1) {
            curr = SlabAllocator::getSlotHeader();
        }
    }

    slabList[EMPTY].put(slab);
}

MapCache::~MapCache() {
    for (int i = 0; i < 2; i++) {
        Slab *slab;

        while ((slab = slabList[i].poll()) != nullptr) {

            // should not call virtual function from destructor
            if (dtor != nullptr) {
                Slot *curr = (MapCache::Slot *) slab->slotHead;
                while (curr) {
                    Slot *old = curr;
                    dtor(old->slotSpace);
                    curr = (MapCache::Slot *) curr->next;
                    SlabAllocator::returnSlot(old);
                }
            }
            SlabAllocator::bfree(slab->startSpace);

            slab->slotHead = slab->slotTail = nullptr;
            slab->slotNum = 0;

            SlabAllocator::returnSlab(slab);
        }
    }
    numberOfSlabs = 0;
}
