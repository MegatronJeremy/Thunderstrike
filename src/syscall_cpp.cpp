#include "../h/syscall_cpp.hpp"

void *operator new(size_t sz) {
    return mem_alloc(sz);
}

void *operator new[](size_t sz) {
    return mem_alloc(sz);
}

void operator delete(void *addr) {
    mem_free(addr);
}

void operator delete[](void *addr) {
    mem_free(addr);
}
