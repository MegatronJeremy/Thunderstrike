#include "../h/MemorySegments.hpp"

size_t MemorySegments::getKernelHeapSize() {
    static size_t KERNEL_HEAP_SIZE = getHeapSize() / 8;

    return KERNEL_HEAP_SIZE;
}

size_t MemorySegments::getUserHeapSize() {
    static size_t USER_HEAP_SIZE = getHeapSize() - getKernelHeapSize();

    return USER_HEAP_SIZE;
}

const void *MemorySegments::getUserHeapStartAddr() {
    static const void *USER_HEAP_START_ADDR = (uint8 *) HEAP_START_ADDR + getKernelHeapSize();

    return USER_HEAP_START_ADDR;
}

const void *MemorySegments::getUserHeapEndAddr() {
    static const void *USER_HEAP_END_ADDR = HEAP_END_ADDR;

    return USER_HEAP_END_ADDR;
}

const void *MemorySegments::getKernelHeapStartAddr() {
    static const void *KERNEL_HEAP_START_ADDR = HEAP_START_ADDR;

    return KERNEL_HEAP_START_ADDR;
}

const void *MemorySegments::getKernelHeapEndAddr() {
    static const void *KERNEL_HEAP_END_ADDR = getUserHeapStartAddr();

    return KERNEL_HEAP_END_ADDR;
}

size_t MemorySegments::getHeapSize() {
    static size_t HEAP_SIZE = (size_t) HEAP_END_ADDR - (size_t) HEAP_START_ADDR;

    return HEAP_SIZE;
}

