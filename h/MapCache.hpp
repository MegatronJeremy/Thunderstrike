#ifndef _MAPCACHE_HPP
#define _MAPCACHE_HPP

#include "Cache.hpp"

class MapCache : public Cache {
public:
    static void sFree(const void *obj);

private:
    friend class SlabAllocator;

    struct Slot : public Cache::Slot {
        void setSlotAllocated() override;

        void setSlotFree() override;

        void destroy() override;

        MapEntry<void *, Slot *> entry;
    };

    size_t getPartitionSize() override {
        return objSize;
    }

    void populateSlab(Slab *slab, uint8 *space) override;

    Slot *getSlot(void *obj) override;

};

#endif
