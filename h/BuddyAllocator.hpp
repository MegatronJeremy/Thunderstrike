#ifndef _BUDDYALLOCATOR_HPP
#define _BUDDYALLOCATOR_HPP

#include "Bitmap.hpp"
#include "Mutex.hpp"

class BuddyAllocator {
public:
    BuddyAllocator(void *space, int blockNum);

    void *balloc(size_t size);

    int bfree(void *);

    void *operator new(size_t, void *addr) {
        return addr;
    }

    size_t getSize() const;

private:
    /**
    * 00 - block is part of a bigger block
    * 01 - block is split
    * 10 - block is free
    * 11 - block is allocated
    */
    enum BlockState {
        INCLUDED = 0, SPLIT, FREE, ALLOCATED
    };

    int bitState[4][2] = {{0, 0},
                          {0, 1},
                          {1, 0},
                          {1, 1}};

    void setBlock(size_t i, BlockState state);

    bool testBlock(size_t i, BlockState state);

    bool splitDownTo(int bucket);

    size_t getFreeBlock(uint bucket);

    int containsAllocatedBlock(uint bucket, size_t i);

    void *blockToPtr(uint bucket, size_t block);

    size_t ptrToBlock(void *ptr);

    Bitmap *blockMap;

    size_t *numOfBlocks;

    size_t size = 0;

    uint numOfBuckets;

    uint8 *space;

    Mutex mutex;
};

#endif
