#include "../h/MemoryAllocator.h"

MemoryAllocator *MemoryAllocator::instance = nullptr;


void *MemoryAllocator::operator new(size_t) {
    return (void *) HEAP_START_ADDR;
}

void MemoryAllocator::operator delete(void *) {
    instance = nullptr;
}

MemoryAllocator::MemoryAllocator() {
    freeMemHead = (BlockHeader *) ((uint8 *) HEAP_START_ADDR + sizeof(MemoryAllocator));
    freeMemHead->size = (size_t) ((uint8 *) HEAP_END_ADDR - (uint8 *) HEAP_START_ADDR -
                                            sizeof(MemoryAllocator) - sizeof(BlockHeader));
    freeMemHead->free = true;
    freeMemHead->next = nullptr;
}

MemoryAllocator *MemoryAllocator::getInstance() {
    if (!instance) instance = new MemoryAllocator;

    return instance;
}

void *MemoryAllocator::malloc(size_t size) {
    // Initial check
    if (!size) return nullptr;

    // Rounding and aligning size to size of memory blocks
    size *= MEM_BLOCK_SIZE;

    mutex.wait();
    // Finding suitable free memory block using first fit algorithm
    BlockHeader *curr = freeMemHead, *prev = nullptr;
    int i = 0;
    while (curr && curr->size < size)
        prev = curr, curr = curr->next, i++;
    if (!curr)  {
        mutex.signal();
        return nullptr;
    }

    size_t remainingSize = curr->size - size;
    curr->size = size;
    curr->free = false;

    // Allocating new free memory block if enough size is left over
    if (remainingSize >= MEM_BLOCK_SIZE + sizeof(BlockHeader)) {
        auto *elem = (BlockHeader *) ((uint8 *) curr + sizeof(BlockHeader) + size);
        elem->size = remainingSize - sizeof(BlockHeader);
        elem->free = true;
        elem->next = curr->next;
        (!prev ? freeMemHead : prev->next) = elem;
    } else {
        // Removing whole free memory block from free memory list
        (!prev ? freeMemHead : prev->next) = curr->next;
        curr->size += remainingSize;
    }
    curr->next = nullptr;

    // Free memory start address after segment descriptor of allocated memory block
    void *addr = (uint8 *) curr + sizeof(BlockHeader);

    mutex.signal();

    return addr;
}

int MemoryAllocator::free(void *addr) {
    if (!addr
        || (uint8 *) addr < (uint8 *) HEAP_START_ADDR + sizeof(MemoryAllocator) + sizeof(BlockHeader) + sizeof(Mutex)
        || addr >= HEAP_END_ADDR) {
        return -1;
    }

    auto *elem = (BlockHeader *) ((uint8 *) addr - sizeof(BlockHeader));

    if (!elem || elem->free || elem->next) {
        return -2;
    }

    mutex.wait();

    BlockHeader *curr = freeMemHead, *prev = nullptr;
    while (curr && curr < elem)
        prev = curr, curr = curr->next;

    if ((prev && (uint8 *) prev + prev->size + sizeof(BlockHeader) > addr)
        || (curr && (uint8 *) addr + elem->size  > (uint8 *) curr)) {
        return -2;
    }

    elem->next = curr;
    elem->free = true;
    (!prev ? freeMemHead : prev->next) = elem;

    tryToJoin(elem);
    tryToJoin(prev);

    mutex.signal();

    return 0;
}

int MemoryAllocator::tryToJoin(MemoryAllocator::BlockHeader *curr) {
    if (!curr || !curr->next) return -1;

    if ((uint8 *) curr + sizeof(BlockHeader) + curr->size != (uint8 *) curr->next) return -2;

    curr->size += curr->next->size + sizeof(BlockHeader);
    curr->next = curr->next->next;

    return 0;
}



