#include "../h/MemoryAllocator.hpp"
#include "../h/MemorySegments.hpp"

size_t MemoryAllocator::USER_HEAP_SIZE;

const void *MemoryAllocator::USER_HEAP_START_ADDR;

const void *MemoryAllocator::USER_HEAP_END_ADDR;

MemoryAllocator::MemoryAllocator() {
    freeMemHead = (BlockHeader *) ((uint8 *) USER_HEAP_START_ADDR + sizeof(MemoryAllocator));
    freeMemHead->size = (size_t) (USER_HEAP_SIZE -
                                  sizeof(MemoryAllocator) - sizeof(BlockHeader));
    freeMemHead->free = true;
    freeMemHead->next = nullptr;

    mutex = Mutex::createObj();
}

void *MemoryAllocator::operator new(size_t) {
    USER_HEAP_SIZE = MemorySegments::getUserHeapSize();

    USER_HEAP_START_ADDR = MemorySegments::getUserHeapStartAddr();

    USER_HEAP_END_ADDR = MemorySegments::getUserHeapEndAddr();

    // Singleton must be allocated at user heap start
    return (void *) USER_HEAP_START_ADDR;
}

void MemoryAllocator::operator delete(void *) {}

MemoryAllocator *MemoryAllocator::getInstance() {
    static auto *instance = new MemoryAllocator;

    return instance;
}

void *MemoryAllocator::malloc(size_t size) {
    return getInstance()->mmalloc(size);
}

int MemoryAllocator::mfree(void *addr) {
    return getInstance()->mmfree(addr);
}

void *MemoryAllocator::mmalloc(size_t size) {
    // Initial check
    if (!size) return nullptr;

    DummyMutex dummy(mutex);

    // Rounding size to size of memory blocks
    size *= MEM_BLOCK_SIZE;
    if (size > USER_HEAP_SIZE) return nullptr;

    // Finding suitable free memory block using first fit algorithm
    BlockHeader *curr = freeMemHead, *prev = nullptr;
    int i = 0;
    while (curr && curr->size < size)
        prev = curr, curr = curr->next, i++;
    if (!curr) {
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

    return addr;
}

int MemoryAllocator::mmfree(void *addr) {
    if (!addr
        || (uint8 *) addr < (uint8 *) USER_HEAP_START_ADDR + sizeof(MemoryAllocator) + sizeof(BlockHeader)
        || addr >= USER_HEAP_END_ADDR) {
        return -1;
    }

    DummyMutex dummy(mutex);

    // Return to header
    auto *elem = (BlockHeader *) ((uint8 *) addr - sizeof(BlockHeader));

    // Check if header is valid
    if (!elem || elem->free || elem->next) {
        return -2;
    }

    // Find place of allocated block in sorted free block list
    BlockHeader *curr = freeMemHead, *prev = nullptr;
    while (curr && curr < elem)
        prev = curr, curr = curr->next;

    // Check if address is overlapping
    if ((prev && (uint8 *) prev + prev->size + sizeof(BlockHeader) > addr)
        || (curr && (uint8 *) addr + elem->size > (uint8 *) curr)) {
        return -2;
    }

    // Add new free block to free block structure
    elem->next = curr;
    elem->free = true;
    (!prev ? freeMemHead : prev->next) = elem;

    // Attempt local defragmentation
    tryToJoin(elem);
    tryToJoin(prev);

    return 0;
}

int MemoryAllocator::tryToJoin(MemoryAllocator::BlockHeader *curr) {
    if (!curr || !curr->next) return -1;

    if ((uint8 *) curr + sizeof(BlockHeader) + curr->size != (uint8 *) curr->next) return -2;

    curr->size += curr->next->size + sizeof(BlockHeader);
    curr->next = curr->next->next;

    return 0;
}



