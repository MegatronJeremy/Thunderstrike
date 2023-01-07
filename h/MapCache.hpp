#ifndef _MAPCACHE_HPP
#define _MAPCACHE_HPP

#include "Cache.hpp"

class MapCache : public Cache {
private:
    friend class SlabAllocator;

    struct Slot : public Cache::Slot {
        MapEntry<void *, Slot *> entry;

        void *operator new(size_t, void *addr) {
            return addr;
        }

        void operator delete(void *) {};
    };

public:
    MapCache(const char *name, size_t objSize, Constructor ctor = nullptr, Destructor dtor = nullptr);

    void *allocate() override;

    void free(void *obj) override;

    static void sFree(const void *obj);

    ~MapCache() override;

private:
    void destroySlots(Cache::Slab *slab) override;

    void initEmptySlab(Cache::Slab *slab) override;
};

#endif
