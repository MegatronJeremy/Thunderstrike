#include "../h/MemoryAllocator.h"
#include "../h/SysPrint.h"
#include "../h/Mutex.h"

MemoryAllocator *MemoryAllocator::instance = nullptr;

void MemoryAllocator::initMemoryAllocator() {
    instance = (MemoryAllocator *) HEAP_START_ADDR;

    instance->mutex = (Mutex *) ((uint8 *) HEAP_START_ADDR + sizeof(MemoryAllocator));
    instance->mutex->val = 1;
    instance->freeMemHead = (BlockHeader *) ((uint8 *) HEAP_START_ADDR + sizeof(MemoryAllocator) + sizeof(Mutex));
    instance->freeMemHead->size = (size_t) ((uint8 *) HEAP_END_ADDR - (uint8 *) HEAP_START_ADDR -
                                  sizeof(MemoryAllocator) - sizeof(BlockHeader) - sizeof(Mutex));
    instance->freeMemHead->free = true;
    instance->freeMemHead->next = nullptr;

//    instance->allocMemHead = nullptr;

//    kprintString("Initializing memory allocator: ");
//    kprintUnsigned(instance->freeMemHead->size);
//    kprintString("\n");

}

MemoryAllocator *MemoryAllocator::getInstance() {
    if (!instance) initMemoryAllocator();

    return instance;
}

void *MemoryAllocator::malloc(size_t size) {
    // Initial check
    if (!size) return 0;

    // Rounding and aligning size to size of memory blocks
    size = ((size - 1) / MEM_BLOCK_SIZE + 1) * MEM_BLOCK_SIZE;

    mutex->wait();
    // Finding suitable free memory block using first fit algorithm
    BlockHeader *curr = freeMemHead, *prev = nullptr;
    int i = 0;
    while (curr && curr->size < size)
        prev = curr, curr = curr->next, i++;
    if (!curr)  {
//        kprintString("Failed allocation\n");
        mutex->signal();
        return nullptr;
    }

    size_t remainingSize = curr->size - size;
    curr->size = size;
    curr->free = false;
    // Allocating new free memory block if enough size is left over
    if (remainingSize >= MEM_BLOCK_SIZE + sizeof(BlockHeader)) {
        BlockHeader *elem = (BlockHeader *) ((uint8 *) curr + sizeof(BlockHeader) + size);
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

    //
//    prev = nullptr;
//    BlockHeader *next = allocMemHead;
//    while (next && next <= curr)
//        prev = next, next = next->next;
//
//    (!prev ? allocMemHead : prev->next) = curr;
//    curr->next = next;
    //

    mutex->signal();

    return addr;
}

int MemoryAllocator::free(void *addr) {
    if (!addr
        || (uint8 *) addr < (uint8 *) HEAP_START_ADDR + sizeof(MemoryAllocator) + sizeof(BlockHeader) + sizeof(Mutex)
        || addr >= HEAP_END_ADDR) {
//        kprintString("failed1\n");
        return -1;
    }

    BlockHeader *elem = (BlockHeader *) ((uint8 *) addr - sizeof(BlockHeader));

    if (!elem || elem->free || elem->next) {
//        kprintString("failed2\n");
        return -2;
    }

    mutex->wait();

    //
//    BlockHeader *curr = allocMemHead, *prev = nullptr;
//    while (curr && curr < elem)
//        prev = curr, curr = curr->next;
//
//    if (curr != elem) {
//        mutex->signal();
//        kprintString("failed3\n");
//        return -3;
//    }

//    (!prev ? allocMemHead : prev->next) = elem->next;
    //

    BlockHeader *curr = freeMemHead, *prev = nullptr;
    while (curr && curr < elem)
        prev = curr, curr = curr->next;

    if ((prev && (uint8 *) prev + prev->size + sizeof(BlockHeader) > addr)
        || (curr && (uint8 *) addr + elem->size  > (uint8 *) curr)) {
//        if (prev && (uint8 *) prev + prev->size + sizeof(BlockHeader) > addr)  kprintString("Failed4\n");
//        if (curr && (uint8 *) addr + elem->size > (uint8 *) curr)  kprintString("Failed5\n");
        return -2;
    }

    elem->next = curr;
    elem->free = true;
    (!prev ? freeMemHead : prev->next) = elem;

    tryToJoin(elem);
    tryToJoin(prev);

    mutex->signal();

    return 0;
}

int MemoryAllocator::tryToJoin(MemoryAllocator::BlockHeader *curr) {
    if (!curr || !curr->next) return -1;

    if ((uint8 *) curr + sizeof(BlockHeader) + curr->size != (uint8 *) curr->next) return -2;

    curr->size += curr->next->size + sizeof(BlockHeader);
    curr->next = curr->next->next;

    return 0;
}

void *kmalloc(size_t size) {
    return MemoryAllocator::getInstance()->malloc(size);
}

int kfree(void *addr) {
    return MemoryAllocator::getInstance()->free(addr);
}


