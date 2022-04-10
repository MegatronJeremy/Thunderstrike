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
    if (size <= 0 || size + MEM_BLOCK_SIZE > freeMemSize) return nullptr;
    size += MEM_BLOCK_SIZE;

    FreeSegDesc *curr = segDescHead, *prev = nullptr;
    while (curr) {
        if (size <= curr->size) break;
        prev = curr;
        curr = curr->next;
    }
    if (!curr) return nullptr;

    freeMemSize -= size;

    (!prev ? segDescHead : prev->next) = curr->next;

    void *addr = (uint8 *) curr + size;

    if (curr->size - size >= MEM_BLOCK_SIZE) {
        FreeSegDesc *elem = (FreeSegDesc *) addr;
        elem->size = curr->size - size;
        elem->next = curr->next;
        (!prev ? segDescHead : prev->next) = elem;
    }

    *(size_t *) curr = size;

    return (uint8 *) curr + MEM_BLOCK_SIZE;
}

int MemoryAllocator::free(void *addr) {
    if (!addr || (uint8 *)addr < (uint8 *)HEAP_START_ADDR + 2 * MEM_BLOCK_SIZE || addr >= HEAP_END_ADDR) return -1;

    addr = (uint8 *) addr - MEM_BLOCK_SIZE;
    size_t size = *(size_t *) addr;

    FreeSegDesc *curr = segDescHead, *prev = nullptr;

    while (curr && curr < addr) {
        prev = curr;
        curr = curr->next;
    }

    if ((prev && (uint8 *) prev + prev->size > addr) || (curr && (uint8 *) addr + size > (uint8 *) curr))
        return -2;

    FreeSegDesc *elem = (FreeSegDesc *) addr;
    elem->size = size;
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


