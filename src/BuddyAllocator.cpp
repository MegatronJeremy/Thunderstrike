#include "../h/BuddyAllocator.hpp"
#include "../h/SlabAllocator.hpp"
#include "../h/MemorySegments.hpp"
#include "../h/Math.hpp"

using namespace Math;

BuddyAllocator::BuddyAllocator(void *space, int blockNum) :
        numOfBuckets(ceilLogBase2(blockNum)),
        space((uint8 *) space) {
    uint8 *buddySpace = this->space + sizeof(BuddyAllocator);

    numOfBlocks = (size_t *) buddySpace;

    for (uint i = 1; i < numOfBuckets; i++) {
        numOfBlocks[i] = 0;
    }
    numOfBlocks[0] = 1;

    buddySpace += sizeof(*numOfBlocks) * numOfBuckets;

    blockMap = new(buddySpace) Bitmap(2 * (2 * blockNum - 1), buddySpace);
    blockMap->reset();
    blockMap->set(0);

    buddySpace += sizeof(Bitmap) + blockMap->size() / Bitmap::BYTE_SIZE_BITS;

    size = (size_t) buddySpace - (size_t) space;
}

void *BuddyAllocator::balloc(size_t size) {
    DummyMutex dummy(&mutex);

    int n = MemorySegments::bytesToPages(size);

    int bucket = numOfBuckets - ceilLogBase2(n) - 1;

    if (bucket < 0) return nullptr;

    if (numOfBlocks[bucket] == 0 && !splitDownTo(bucket)) {
        return nullptr;
    }

    int block = getFreeBlock(bucket);

    return blockToPtr(bucket, block);
}

void BuddyAllocator::bfree(void *) {
    DummyMutex dummy(&mutex);

}

/**
 * 00 - block is part of a bigger block
 * 01 - block is split
 * 10 - block is free
 * 11 - block is allocated
 *
 * @param bucket
 * @return
 */

bool BuddyAllocator::splitDownTo(uint bucket) {
    if (bucket == 0) return false;

    uint upperBucket = bucket - 1;

    while (upperBucket >= 0 && numOfBlocks[upperBucket] == 0) upperBucket--;

    size_t nodes = (1ULL << upperBucket);
    size_t startBlock = 2 * (nodes - 1);
    size_t i = 0, j = 0;

    while (i < nodes) {
        j = 2 * i + startBlock;

        // block is free -> node is set to 10
        if (blockMap->test(j) && !blockMap->test(j + 1))
            break;

        i++;
    }

    // no free block in bucket
    if (i == nodes) return false;

    // split down
    while (upperBucket < bucket) {
        // block is split -> node is set to 01
        blockMap->reset(j);
        blockMap->set(j + 1);

        size_t leftChild = 2 * (j + 1);
        size_t rightChild = 2 * (j + 2);

        blockMap->set(leftChild);
        blockMap->reset(leftChild + 1);

        blockMap->set(rightChild);
        blockMap->reset(rightChild + 1);

        numOfBlocks[upperBucket]--;
        numOfBlocks[upperBucket + 1] += 2;

        upperBucket++;
        // split down the left child
        j = leftChild;
    }

    return true;
}

size_t BuddyAllocator::getFreeBlock(uint bucket) {
    size_t nodes = (1ULL << bucket);
    size_t startBlock = 2 * (nodes - 1);

    for (size_t i = 0; i < nodes; i++) {
        size_t j = 2 * i + startBlock;
        // block is free -> node is set to 10
        if (blockMap->test(j) && !blockMap->test(j + 1)) {
            // block is allocated -> node is set to 11
            blockMap->set(j);
            blockMap->set(j + 1);

            numOfBlocks[bucket]--;

            return i;
        }
    }

    return 0;
}

void *BuddyAllocator::blockToPtr(uint bucket, size_t block) {
    return (void *) (space + (1ULL << (numOfBuckets - bucket - 1)) * block * BLOCK_SIZE);
}

size_t BuddyAllocator::getSize() const {
    return size;
}

