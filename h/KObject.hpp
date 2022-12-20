#ifndef _KOBJECT_HPP
#define _KOBJECT_HPP

#include "../lib/hw.h"
#include "../h/slab.h"

void *mmalloc(size_t);

int mfree(void *);

size_t byteToBlocks(size_t size);

static constexpr uint64
DEFAULT_BUFFER_SIZE = 2048;

static constexpr uint64
DEFAULT_HASH_SIZE = 1499;

// Base apstract class for kernel objects - contains necessary memory allocation / deallocation templates

template<typename T>
class KObject {
public:
    static T *createObj();

    static void deleteObj(T *obj);

    virtual void defaultDtor() {};

    virtual ~KObject();

    static void *operator new(size_t, void *addr) {
        return addr;
    }

    static void operator delete(void *) {}

private:
    static void initCache();

    static kmem_cache_t *objCache;
};

template<typename T>
kmem_cache_t *KObject<T>::objCache = nullptr;

template<typename T>
void KObject<T>::initCache() {
    bool triedToShrink = false;

    while (!objCache) {
        objCache = kmem_cache_create("name", sizeof(T),
                                     [](void *obj) {
                                         new(obj) T;
                                     },
                                     [](void *args) {
                                         uint64 * params = (uint64 *) args;
                                         T *obj = (T *) params[0];
                                         bool destroyObj = (bool) params[1];
                                         if (destroyObj) {
                                             delete obj;
                                         } else {
                                             obj->defaultDtor();
                                         }
                                     });

        if (!objCache && !triedToShrink) {
            // try to shrink cache if no memory
            triedToShrink = true;
            kmem_cache_shrink(objCache);
        } else {
            break;
        }
    }
}


template<typename T>
T *KObject<T>::createObj() {
    if (!objCache) initCache();

    bool triedToShrink = false;
    T *obj = nullptr;

    while (!obj) {
        obj = (T *) kmem_cache_alloc(objCache);

        if (!objCache && !triedToShrink) {
            // try to shrink cache if no memory
            triedToShrink = true;
            kmem_cache_shrink(objCache);
        } else {
            break;
        }
    }
    return obj;
}

template<typename T>
void KObject<T>::deleteObj(T *obj) {
    kmem_cache_free(objCache, obj);
}

template<typename T>
KObject<T>::~KObject() = default;

#endif
