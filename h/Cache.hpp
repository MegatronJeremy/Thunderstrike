#ifndef _CACHE_HPP
#define _CACHE_HPP

#include "../h/slab.h"
#include "../h/DummyMutex.hpp"

class Cache {
public:
    using Constructor = void (*)(void *);
    using Destructor = void (*)(void *);

    Cache(const char *name, size_t objSize, Constructor ctor = nullptr, Destructor dtor = nullptr);

    void *allocate();

    void free(void *obj);

    static void sFree(const void *obj);

    int shrinkCache();

    void *operator new(size_t);

    void operator delete(void *);

private:
    friend class SlabAllocator;

    struct Slab;

    enum SlabState {
        EMPTY = 0, PARTIAL = 1, FULL = 2
    };

    struct Slot {
        Slab *parentSlab;
        Cache *parentCache;

        Slot *next;

        void *slotSpace;
    };

    struct Slab {
        Slot *getSlot();

        void putSlot(Slot *slot);

        void destroySlots(Destructor dtor);

        Slab *next, *prev;

        SlabState state;

        Slot *slotHead, *slotTail;

        size_t slotNum;
    };

    class SlabList {
    public:
        Slab *get();

        void put(Slab *slab);

        void remove(Slab *slab);

    private:
        Slab *head = nullptr, *tail = nullptr;
    };

    void addEmptySlab();

    void initEmptySlab(Slab *slab);

    const char *name;

    const size_t objSize;

    Constructor ctor;

    Destructor dtor;

    const size_t slotSize = objSize + sizeof(Slot);

    const ushort optimalBucket;

    const size_t slotsPerSlab;

    size_t cacheSizeBlocks = 0;

    size_t numberOfSlabs = 0;

    Cache *next = nullptr, *prev = nullptr;

    SlabList slabList[3];

    Mutex mutex;

    bool newSlabsAllocated = false;
};

#endif
