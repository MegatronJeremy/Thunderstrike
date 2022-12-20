#include "../h/MemorySegments.hpp"

size_t MemorySegments::getKernelHeapSize() {
    static size_t KERNEL_HEAP_SIZE = getHeapSize() / 8;

    return KERNEL_HEAP_SIZE;
}

size_t MemorySegments::getUserHeapSize() {
    static size_t USER_HEAP_SIZE = getHeapSize() - getKernelHeapSize();

    return USER_HEAP_SIZE;
}

void *MemorySegments::getUserHeapStartAddr() {
    static void *USER_HEAP_START_ADDR = (uint8 *) HEAP_START_ADDR + getKernelHeapSize();

    return USER_HEAP_START_ADDR;
}

void *MemorySegments::getUserHeapEndAddr() {
    static void *USER_HEAP_END_ADDR = (void *) HEAP_END_ADDR;

    return USER_HEAP_END_ADDR;
}

void *MemorySegments::getKernelHeapStartAddr() {
    static void *KERNEL_HEAP_START_ADDR = (void *) HEAP_START_ADDR;

    return KERNEL_HEAP_START_ADDR;
}

void *MemorySegments::getKernelHeapEndAddr() {
    static void *KERNEL_HEAP_END_ADDR = getUserHeapStartAddr();

    return KERNEL_HEAP_END_ADDR;
}

size_t MemorySegments::getHeapSize() {
    static size_t HEAP_SIZE = (size_t) HEAP_END_ADDR - (size_t) HEAP_START_ADDR;

    return HEAP_SIZE;
}

