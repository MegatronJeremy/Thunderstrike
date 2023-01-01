#include "../h/KObject.hpp"
#include "../h/MemoryAllocator.hpp"

void *mmalloc(size_t size) {
    return MemoryAllocator::malloc(size);
}

int mfree(void *addr) {
    return MemoryAllocator::free(addr);
}

size_t byteToMemBlocks(size_t size) {
    if (!size) return 0;
    return (size - 1) / MEM_BLOCK_SIZE + 1;
}

