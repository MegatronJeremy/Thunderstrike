#include "../h/MapCache.hpp"
#include "../h/SlabAllocator.hpp"
#include "../h/BuddyAllocator.hpp"
#include "../h/HashMap.hpp"

void MapCache::populateSlab(Cache::Slab *slab, uint8 *space) {
    Slot *curr = SlabAllocator::getSlotHeader();
    for (ushort i = 0; i < slotsPerSlab; i++) {
        if (!curr) {
            errorCode = NO_SLOT_AVAIL;
            break;
        }

        curr->slotSpace = space;

        curr->entry.setKey(space);
        curr->entry.setValue(curr);

        curr->parentSlab = slab;

        if (ctor) ctor(space);

        slab->putSlot(curr);

        space = space + objSize;

        if (i < slotsPerSlab - 1)
            curr = SlabAllocator::getSlotHeader();
    }
}

void MapCache::sFree(const void *obj) {
    Slot *slot = HashMap<void *, Slot *>::get((void *) obj);

    if (!slot) return;

    Cache *cache = slot->parentSlab->parentCache;
    cache->free(slot);

    cache->shrinkCache();
}

MapCache::Slot *MapCache::getSlot(void *obj) {
    return HashMap<void *, Slot *>::get(obj);
}

void MapCache::Slot::setSlotAllocated() {
    if (state == ALLOCATED) return;
    HashMap<void *, Slot *>::put(&entry);
    Cache::Slot::setSlotAllocated();
}

void MapCache::Slot::setSlotFree() {
    if (state == FREE) return;
    HashMap<void *, Slot *>::remove(slotSpace);
    Cache::Slot::setSlotFree();
}

void MapCache::Slot::destroy() {
    Cache::Slot::destroy();
    SlabAllocator::returnSlot(this);
}
