#include "../h/KernelObject.h"
#include "../h/MemoryAllocator.h"

void *kmalloc(size_t size) {
    return MemoryAllocator::getInstance()->malloc(size);
}

int kfree(void *addr) {
    return MemoryAllocator::getInstance()->free(addr);
}

KernelObject::~KernelObject() = default;