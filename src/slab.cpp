#include "../h/SlabAllocator.hpp"
#include "../h/slab.h"

struct kmem_cache_s {
    void *obj;
};

void kmem_init(void *space, int block_num) {
    SlabAllocator::initSlabAllocator(space, block_num);
}

kmem_cache_t *kmem_cache_create(const char *name, size_t size,
                                void (*ctor)(void *),
                                void (*dtor)(void *)) {
    Cache *cache = new Cache(name, size, ctor, dtor);
    kmem_cache_t *ret = (kmem_cache_t *) cache;
    return ret;
}

int kmem_cache_shrink(kmem_cache_t *cachep) {
    Cache *cache = (Cache *) cachep;
    return cache->shrinkCache();
}

void *kmem_cache_alloc(kmem_cache_t *cachep) {
    Cache *cache = (Cache *) cachep;
    return cache->allocate();
}

void kmem_cache_free(kmem_cache_t *cachep, void *objp) {
    Cache *cache = (Cache *) cachep;
    cache->free(objp);
}

void *kmalloc(size_t size) {
    return SlabAllocator::allocateBuffer(size);
}

void kfree(const void *objp) {
    return SlabAllocator::deallocateBuffer(objp);
}

void kmem_cache_destroy(kmem_cache_t *cachep) {
    Cache *cache = (Cache *) cachep;
    delete cache;
}

void kmem_cache_info(kmem_cache_t *cachep) {
    return;
}

int kmem_cache_error(kmem_cache_t *cachep) {
    return 0;
}
