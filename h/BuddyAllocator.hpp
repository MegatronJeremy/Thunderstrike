#ifndef _BUDDYALLOCATOR_HPP
#define _BUDDYALLOCATOR_HPP

#include "Bitmap.hpp"
#include "Mutex.hpp"

class BuddyAllocator {
public:
    BuddyAllocator(void *space, int blockNum);

    void *balloc(size_t sz);

    int bfree(void *);

    void *operator new(size_t, void *addr) {
        return addr;
    }

    size_t getSize() const {
        return size;
    }

private:
    /**
    * 0 - block is free
    * 1 - block is split/allocated
    */
    enum BlockState {
        FREE = 0, ALLOCATED = 1
    };

    struct Block {
        explicit Block(size_t b) :
                block(b) {}

        size_t block;

        Block *next = nullptr, *prev = nullptr;

        void *operator new(size_t, void *addr) { return addr; }
    };

    class BlockList {
    public:
        Block *get() {
            return head;
        }

        Block *poll();

        void put(Block *blk);

        void push(Block *blk);

        void remove(Block *blk);

        void *operator new(size_t, void *addr) { return addr; }

    private:
        Block *head = nullptr, *tail = nullptr;
    };

    bool splitDownTo(int bucket);

    size_t getFreeBlock(uint bucket);

    void setNode(size_t node, BlockState state);

    bool testNode(size_t i, BlockState state);

    void *blockToPtr(uint bucket, size_t block);

    size_t ptrToBlock(uint bucket, void *ptr);

    static size_t parent(size_t node) {
        return (node - 1) / 2;
    }

    static size_t leftChild(size_t node) {
        return 2 * node + 1;
    }

    static size_t rightChild(size_t node) {
        return 2 * node + 2;
    }

    static size_t sibling(size_t node) {
        return (node % 2 == 0) ? node - 1 : node + 1;
    }

    static size_t blockToNode(size_t block, size_t level) {
        return (1ULL << level) - 1 + block;
    }

    static size_t nodeToBlock(size_t node, size_t level) {
        return node - (1ULL << level) + 1;
    }

    Block header = Block(0);

    Bitmap *blockMap;

    BlockList **blockList;

    size_t size = 0;

    uint numOfBuckets;

    uint8 *space;

    Mutex mutex;
};

#endif
