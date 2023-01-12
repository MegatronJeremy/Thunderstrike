#include "../h/BuddyAllocator.hpp"
#include "../h/SlabAllocator.hpp"
#include "../h/MemorySegments.hpp"
#include "../h/Math.h"

using namespace Math;

BuddyAllocator::BuddyAllocator(void *space, int blockNum) :
        numOfBuckets(ceilLogBase2(blockNum) + 1),
        space((uint8 *) space) {
    uint8 *buddySpace = this->space + sizeof(BuddyAllocator);

    blockList = (BlockList **) buddySpace;
    buddySpace += sizeof(BlockList *) * numOfBuckets;

    for (uint i = 0; i < numOfBuckets; i++) {
        blockList[i] = new(buddySpace) BlockList;
        buddySpace += sizeof(BlockList);
    }

    // bitnum = 2 to the power of (maxBucket + 1) - 1
    blockMap = new(buddySpace) Bitmap((1 << numOfBuckets) - 1, buddySpace);
    blockMap->reset();

    // put an empty block in the largest bucket
    blockList[0]->put(&header);

    buddySpace += sizeof(Bitmap) + blockMap->size() / Bitmap::BYTE_SIZE_BITS;

    size = (size_t) buddySpace - (size_t) space;
}


void *BuddyAllocator::balloc(size_t sz) {
    DummyMutex dummy(&mutex);

    size_t n = MemorySegments::bytesToPages(sz);

    int bucket = (int) numOfBuckets - ceilLogBase2(n) - 1;

    if (bucket < 0) return nullptr;

    if (blockList[bucket]->get() == nullptr && !splitDownTo(bucket)) {
        return nullptr;
    }

    size_t block = getFreeBlock(bucket);

    void *adr = blockToPtr(bucket, block);

    return adr;
}

int BuddyAllocator::bfree(void *obj) {
    DummyMutex dummy(&mutex);

    // find the bucket of the block
    int bucket = (int) numOfBuckets - 1;
    int ret = 0;

    // find the allocated leaf node (node that is not split)
    size_t curr = blockToNode(ptrToBlock(bucket, obj), bucket);
    while (bucket > 0 && !testNode(curr, ALLOCATED)) {
        bucket--;
        curr = blockToNode(ptrToBlock(bucket, obj), bucket);
    }

    if (ret < 0 || bucket < 0) {
        return -2;
    }

    // bucket found, node in bitmap found, add a free block
    blockList[bucket]->put(new(obj) Block(nodeToBlock(curr, bucket)));
    setNode(curr, FREE);

    // try to coalesce
    while (bucket > 0) {
        // find buddy
        size_t buddy = sibling(curr);

        // coalesce if both are free
        if (testNode(curr, FREE) && testNode(buddy, FREE)) {
            setNode(curr, ALLOCATED);
            setNode(buddy, ALLOCATED);

            // get free list entries from block
            Block *halfOne = (Block *) blockToPtr(bucket, nodeToBlock(curr, bucket));
            Block *halfTwo = (Block *) blockToPtr(bucket, nodeToBlock(buddy, bucket));

            // doubly linked list - O(1) removal
            blockList[bucket]->remove(halfOne);
            blockList[bucket]->remove(halfTwo);
        } else {
            break;
        }

        // find parent if succesfully coalesced
        curr = parent(curr);
        setNode(curr, FREE);

        size_t blk = nodeToBlock(curr, bucket - 1);

        // put parent in free list
        blockList[bucket - 1]->put(new(blockToPtr(bucket - 1, blk)) Block(blk));

        bucket--;
    }

    return 0;
}

size_t BuddyAllocator::getFreeBlock(uint bucket) {
    size_t blk = blockList[bucket]->poll()->block;

    // block is allocated -> node is set to 1
    setNode(blockToNode(blk, bucket), ALLOCATED);

    return blk;
}

bool BuddyAllocator::splitDownTo(int bucket) {
    if (bucket == 0) return false;

    int upperBucket = bucket - 1;

    while (upperBucket >= 0 && blockList[upperBucket]->get() == nullptr) upperBucket--;
    if (upperBucket < 0) return false;

    size_t curr = blockToNode(blockList[upperBucket]->get()->block, upperBucket);

    // split down
    while (upperBucket < bucket) {
        // block is split -> node is set to ALLOCATED
        setNode(curr, ALLOCATED);

        size_t left = leftChild(curr);
        size_t right = rightChild(curr);

        // set the children free
        setNode(left, FREE);
        setNode(right, FREE);

        // translate to block index
        size_t rightBlock = nodeToBlock(right, upperBucket + 1);
        size_t leftBlock = nodeToBlock(left, upperBucket + 1);

        // put left child at start of list
        blockList[upperBucket]->poll();
        blockList[upperBucket + 1]->push(new(blockToPtr(upperBucket + 1, rightBlock)) Block(rightBlock));
        blockList[upperBucket + 1]->push(new(blockToPtr(upperBucket + 1, leftBlock)) Block(leftBlock));

        // split down the left child
        curr = left;
        upperBucket++;
    }

    return true;
}

void BuddyAllocator::setNode(size_t node, BuddyAllocator::BlockState state) {
    if (state == FREE) blockMap->reset(node);
    else blockMap->set(node);
}

bool BuddyAllocator::testNode(size_t i, BuddyAllocator::BlockState state) {
    // test succesful if bits are the same
    return !(blockMap->test(i) ^ state);
}

void *BuddyAllocator::blockToPtr(uint bucket, size_t block) {
    return (void *) (space + (1ULL << (numOfBuckets - bucket - 1)) * block * BLOCK_SIZE);
}

size_t BuddyAllocator::ptrToBlock(uint bucket, void *ptr) {
    if ((size_t) ptr < (size_t) space) return 0;
    return ((size_t) ptr - (size_t) space) / ((1ULL << (numOfBuckets - bucket - 1)) * BLOCK_SIZE);
}


BuddyAllocator::Block *BuddyAllocator::BlockList::poll() {
    if (!head) return nullptr;

    Block *ret = head;
    remove(head);

    return ret;
}

void BuddyAllocator::BlockList::put(BuddyAllocator::Block *blk) {
    if (!blk) return;

    blk->prev = tail;
    tail = (!tail ? head : tail->next) = blk;
    blk->next = nullptr;
}

void BuddyAllocator::BlockList::push(BuddyAllocator::Block *blk) {
    if (!blk) return;

    blk->next = head;
    head = (!head ? tail : head->prev) = blk;
    blk->prev = nullptr;
}

void BuddyAllocator::BlockList::remove(BuddyAllocator::Block *blk) {
    (!blk->prev ? head : blk->prev->next) = blk->next;
    (!blk->next ? tail : blk->next->prev) = blk->prev;
    blk->prev = blk->next = nullptr;
}
