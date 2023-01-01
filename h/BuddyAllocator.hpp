#ifndef _BUDDYALLOCATOR_HPP
#define _BUDDYALLOCATOR_HPP

#include "Bitmap.hpp"
#include "Mutex.hpp"

class BuddyAllocator {
public:
    BuddyAllocator(void *space, int blockNum);

    void *balloc(size_t size);

    void bfree(void *);

    void *operator new(size_t, void *addr) {
        return addr;
    }

    size_t getSize() const;

private:
    bool splitDownTo(uint bucket);

    size_t getFreeBlock(uint bucket);

    void *blockToPtr(uint bucket, size_t block);

    Bitmap *blockMap;

    size_t *numOfBlocks;

    size_t size = 0;

    uint numOfBuckets;

    uint8 *space;

    Mutex mutex;
};

#endif
