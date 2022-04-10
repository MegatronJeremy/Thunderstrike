#include "../h/ksyscall_cpp.h"
#include "../h/MemoryAllocator.h"

void handleSupervisorTrap(uint code, void *args) {
    switch (code) {
        case (0x01): kmem_alloc((size_t) args); break;
        case (0x02): kmem_free(args); break;
        default: return;
    }
}

void *kmem_alloc(size_t size) {
    return MemoryAllocator::getInstance()->malloc(size);
}

int kmem_free(void *addr) {
    return MemoryAllocator::getInstance()->free(addr);
}
