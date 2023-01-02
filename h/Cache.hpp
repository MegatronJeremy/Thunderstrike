#ifndef _CACHE_HPP
#define _CACHE_HPP

#include "../h/slab.h"
#include "../h/DummyMutex.hpp"

class Cache {
private:
    using Constructor = void (*)(void *);
    using Destructor = void (*)(void *);

    struct Slab;

    struct Slot {
        Slab *parentSlab;
        Cache *parentCache;

        Slot *next;

        void *slotSpace;
    };

    enum SlabState {
        EMPTY = 0, PARTIAL = 1, FULL = 2
    };

    struct Slab {
        Slot *getSlot();

        void putSlot(Slot *slot);

        void destroySlots(Destructor dtor);

        void *operator new(size_t, void *addr) {
            return addr;
        }

        Slab *next = nullptr, *prev = nullptr;

        SlabState state = EMPTY;

        Slot *slotHead = nullptr, *slotTail = nullptr;

        size_t slotNum = 0;
    };

public:
    Cache(const char *name, size_t objSize, Constructor ctor = nullptr, Destructor dtor = nullptr);

    Cache(const char *name, size_t objSize, Slab *slab, Constructor ctor = nullptr, Destructor dtor = nullptr);

    void *allocate();

    void free(void *obj);

    static void sFree(const void *obj);

    int shrinkCache();

    void printCacheInfo() const;

    const char *getName() const {
        return name;
    }

    void *operator new(size_t);

    void *operator new(size_t, void *addr);

    void operator delete(void *);

    ~Cache();

private:
    // TODO better desegmentation
    friend class SlabAllocator;

    class SlabList {
    public:
        Slab *get();

        Slab *poll();

        void put(Slab *slab);

        void remove(Slab *slab);

    private:
        Slab *head = nullptr, *tail = nullptr;
    };

    void addEmptySlab();

    void addEmptySlab(Slab *slab);

    void initEmptySlab(Slab *slab);

    const char *name;

    const size_t objSize;

    Constructor ctor;

    Destructor dtor;

    const size_t slotSize = objSize + sizeof(Slot);

    const ushort optimalBucket;

    const size_t slotsPerSlab;

    size_t allocatedSlots = 0;

    size_t numberOfSlabs = 0;

    Cache *next = nullptr, *prev = nullptr;

    SlabList slabList[3];

    Mutex mutex;

    bool newSlabsAllocated = false;

    bool isCacheOfSlabs = false;
};

#endif
