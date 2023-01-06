#include "../h/MemorySegments.hpp"
#include "../h/slab.h"
#include "../h/Math.h"

using namespace Math;

size_t MemorySegments::getKernelHeapSize() {
    static const size_t KERNEL_HEAP_SIZE = 1ULL << ceilLogBase2(getHeapSize() / 8);

    return KERNEL_HEAP_SIZE;
}

size_t MemorySegments::getUserHeapSize() {
    static const size_t USER_HEAP_SIZE = getHeapSize() - getKernelHeapSize();

    return USER_HEAP_SIZE;
}

void *MemorySegments::getUserHeapStartAddr() {
    static void *USER_HEAP_START = (uint8 *) HEAP_START_ADDR + getKernelHeapSize();

    return USER_HEAP_START;
}

void *MemorySegments::getUserHeapEndAddr() {
    return (void *) HEAP_END_ADDR;
}

void *MemorySegments::getKernelHeapStartAddr() {
    return (void *) HEAP_START_ADDR;
}

void *MemorySegments::getKernelHeapEndAddr() {
    return getUserHeapStartAddr();
}

size_t MemorySegments::getHeapSize() {
    static const size_t HEAP_SIZE = (size_t) HEAP_END_ADDR - (size_t) HEAP_START_ADDR;

    return HEAP_SIZE;
}

size_t MemorySegments::bytesToPages(size_t size) {
    return (size - 1) / BLOCK_SIZE + 1;
}

