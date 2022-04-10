#include "../h/MemoryAllocator.h"

MemoryAllocator *MemoryAllocator::instance = nullptr;

void MemoryAllocator::initMemoryAllocator() {
    instance = (MemoryAllocator *) HEAP_START_ADDR;

    instance->freeMemSize = (uint8 *) HEAP_END_ADDR - (uint8 *) HEAP_START_ADDR - MEM_BLOCK_SIZE;

    instance->segDescHead = (FreeSegDesc *) ((uint8 *) HEAP_START_ADDR + MEM_BLOCK_SIZE);
    instance->segDescHead->size = instance->freeMemSize;
    instance->segDescHead->next = nullptr;
}

MemoryAllocator *MemoryAllocator::getInstance() {
    if (!instance) initMemoryAllocator();

    return instance;
}

void *MemoryAllocator::malloc(size_t size) {
    if (size <= 0 || size > freeMemSize) return nullptr;

    FreeSegDesc *curr = segDescHead, *prev = nullptr;
    while (curr) {
        if (size <= curr->size) break;
        prev = curr;
        curr = curr->next;
    }
    if (!curr) return nullptr;

    freeMemSize -= size;

    (!prev ? segDescHead : prev->next) = curr->next;

    void *addr = (uint8 *) curr + size + sizeof(FreeSegDesc);

    if (curr->size - size >= MEM_BLOCK_SIZE) {
        FreeSegDesc *elem = (FreeSegDesc *) addr;
        elem->size = curr->size - size;
        elem->next = curr->next;
        (!prev ? segDescHead : prev->next) = elem;
    }

    return curr;
}

int MemoryAllocator::free(void *addr) {
    if (!addr) return -1;

    FreeSegDesc *curr = segDescHead, *prev = nullptr;

    while (curr && curr < addr) {
        prev = curr;
        curr = curr->next;
    }

    if ((prev && (uint8 *) prev + prev->size > addr) || (!prev && addr < (uint8 *) HEAP_START_ADDR + MEM_BLOCK_SIZE))
        return -2;

    uint8 *start = (!prev ? (uint8 *) HEAP_START_ADDR + MEM_BLOCK_SIZE : (uint8 *) prev);
    uint8 *end = (!curr ? (uint8 *) HEAP_END_ADDR : (uint8 *) curr);

    FreeSegDesc *elem = (FreeSegDesc *) addr;
    elem->size = end - start;
    elem->next = curr;
    (!prev ? segDescHead : prev->next) = elem;

    freeMemSize += elem->size;

    tryToJoin(elem);
    tryToJoin(prev);

    return 0;
}

int MemoryAllocator::tryToJoin(MemoryAllocator::FreeSegDesc *curr) {
    if (!curr || !curr->next) return -1;

    if ((uint8 *) curr + curr->size != (uint8 *) curr->next) return -1;

    curr->size += curr->next->size;
    curr->next = curr->next->next;

    return 0;
}


