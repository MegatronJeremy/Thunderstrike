#include "../h/KObject.hpp"
#include "../h/MemoryAllocator.hpp"

void *kmalloc(size_t size) {
    return MemoryAllocator::malloc(size);
}

int kfree(void *addr) {
    return MemoryAllocator::free(addr);
}

size_t byteToBlocks(size_t size) {
    if (!size) return 0;
    return (size - 1) / MEM_BLOCK_SIZE + 1;
}

KObject::~KObject() = default;