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
    setBlock(0, FREE);

    buddySpace += sizeof(Bitmap) + blockMap->size() / Bitmap::BYTE_SIZE_BITS;

    size = (size_t) buddySpace - (size_t) space;
}

void BuddyAllocator::setBlock(size_t i, BlockState state) {
    if (bitState[state][0] == 1) blockMap->set(i);
    else blockMap->reset(i);

    if (bitState[state][1] == 1) blockMap->set(i + 1);
    else blockMap->reset(i + 1);
}

bool BuddyAllocator::testBlock(size_t i, BlockState state) {
    bool test;

    test = blockMap->test(i);
    if (bitState[state][0] == 0) test = !test;

    if (!test) return false;

    test = blockMap->test(i + 1);
    if (bitState[state][1] == 0) test = !test;

    return test;
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

int BuddyAllocator::bfree(void *obj) {
    size_t i = ptrToBlock(obj);

    DummyMutex dummy(&mutex);

    // block is out of range
    if (i == 0 || i >= blockMap->size())
        return -1;

    // find the bucket of the block
    int bucket = numOfBuckets - 1;

    int ret = 0;

    while (bucket > 0 && (ret = containsAllocatedBlock(bucket, i)) == -1) {
        bucket--;
    }

    if (ret < 0 || bucket < 0) return -2;

    // bucket found, node in bitmap found
    size_t nodes = 1ULL << bucket;
    i = 2 * i + 2 * (nodes - 1);

    // try to coalesce
    setBlock(i, FREE);
    numOfBlocks[bucket]++;

    while (i > 0) {
        // find direct brother
        size_t j = (i % 4 == 0) ? i - 2 : i + 2;

        if (testBlock(i, FREE) && testBlock(j, FREE)) {
            setBlock(i, INCLUDED);
            setBlock(j, INCLUDED);
            numOfBlocks[bucket--] -= 2;
        } else {
            break;
        }

        // find parent if succesfully coalesced
        i = ((i < j) ? i : j) / 2 - 1;
        setBlock(i, FREE);
        numOfBlocks[bucket]++;
    }

    return 0;
}

bool BuddyAllocator::splitDownTo(int bucket) {
    if (bucket == 0) return false;

    int upperBucket = bucket - 1;

    while (upperBucket >= 0 && numOfBlocks[upperBucket] == 0) upperBucket--;
    if (upperBucket < 0) return false;

    size_t nodes = (1ULL << upperBucket);
    size_t startBlock = 2 * (nodes - 1);
    size_t i = 0, j = 0;

    while (i < nodes) {
        j = 2 * i + startBlock;

        // block is free -> node is set to 10
        if (testBlock(j, FREE))
            break;

        i++;
    }

    // no free block in bucket
    if (i == nodes) return false;

    // split down
    while (upperBucket < bucket) {
        // block is split -> node is set to 01
        setBlock(j, SPLIT);

        size_t leftChild = 2 * (j + 1);
        size_t rightChild = 2 * (j + 2);

        // set the children free
        setBlock(leftChild, FREE);
        setBlock(rightChild, FREE);

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
        if (testBlock(j, FREE)) {
            // block is allocated -> node is set to 11
            setBlock(j, ALLOCATED);

            numOfBlocks[bucket]--;

            return i;
        }
    }

    return 0;
}

int BuddyAllocator::containsAllocatedBlock(uint bucket, size_t i) {
    size_t nodes = (1ULL << bucket);
    if (i > nodes) return -2;

    size_t startBlock = 2 * (nodes - 1);

    if (!testBlock(2 * i + startBlock, ALLOCATED)) return -1;

    return 0;
}

void *BuddyAllocator::blockToPtr(uint bucket, size_t block) {
    return (void *) (space + (1ULL << (numOfBuckets - bucket - 1)) * block * BLOCK_SIZE);
}

size_t BuddyAllocator::ptrToBlock(void *ptr) {
    if ((size_t) ptr < (size_t) space) return 0;
    return ((size_t) ptr - (size_t) space) / BLOCK_SIZE;
}

size_t BuddyAllocator::getSize() const {
    return size;
}


