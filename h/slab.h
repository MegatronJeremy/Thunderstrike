#ifndef _SLAB_H
#define _SLAB_H

#include "../lib/hw.h"

struct kmem_cache_s;
typedef struct kmem_cache_s kmem_cache_t;

// Block size is 4KB
#define BLOCK_SIZE (4096)

#ifdef __cplusplus
extern "C" {
#endif

void kmem_init(void *space, int block_num);

kmem_cache_t *kmem_cache_create(const char *name, size_t size,
                                void (*ctor)(void *),
                                void (*dtor)(void *)); // Allocate cache

int kmem_cache_shrink(kmem_cache_t *cachep); // Shrink cache

void *kmem_cache_alloc(kmem_cache_t *cachep); // Allocate one object from cache

void kmem_cache_free(kmem_cache_t *cachep, void *objp); // Deallocate one object from cache

//void *kmalloc(size_t size); // Allocate one small memory buffer

//void kfree(const void *objp); // Deallocate one small memory buffer

void kmem_cache_destroy(kmem_cache_t *cachep); // Deallocate cache

void kmem_cache_info(kmem_cache_t *cachep); // Print cache info
int kmem_cache_error(kmem_cache_t *cachep); // Print error message

#ifdef __cplusplus
}
#endif

#endif
