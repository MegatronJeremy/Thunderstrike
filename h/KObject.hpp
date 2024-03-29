#ifndef _KOBJECT_HPP
#define _KOBJECT_HPP

#include "../lib/hw.h"
#include "slab.h"
#include "String.h"

static constexpr size_t
        DEFAULT_BUFFER_SIZE = 2048;

static constexpr size_t
        DEFAULT_HASH_SIZE = 1499;

// Base apstract class for kernel objects - contains necessary memory allocation / deallocation templates
template<typename T>
class KObject {
public:
    static T *createObj();

    virtual void deleteObj();

    static void *operator new(size_t, void *addr) {
        return addr;
    }

    static void operator delete(void *) {}

    virtual ~KObject();

private:
    static void initCache();

    static kmem_cache_t *objCache;
};

template<typename T>
kmem_cache_t *KObject<T>::objCache = nullptr;

template<typename T>
void KObject<T>::initCache() {
    if (objCache) return;

    // extract class name from pretty function name
    const char *prettyName = __PRETTY_FUNCTION__;
    int i = 0;
    while (prettyName[i++] != '=');
    int j = ++i;
    while (prettyName[++j] != ']');
    int len = j - i;

    char *name = (char *) kmalloc(len + 1);

    String::strncpy(name, &prettyName[i], len);
    name[len] = '\0';

    objCache = kmem_cache_create(name, sizeof(T),
                                 [](void *obj) {
                                     new(obj) T;
                                 },
                                 [](void *obj) {
                                     delete (T *) obj;
                                 });

    kfree(name);
}


template<typename T>
T *KObject<T>::createObj() {
    if (!objCache) initCache();

    T *obj = (T *) kmem_cache_alloc(objCache);

    return obj;
}

template<typename T>
void KObject<T>::deleteObj() {
    kmem_cache_free(objCache, this);
    kmem_cache_shrink(objCache);
}

template<typename T>
KObject<T>::~KObject() = default;

#endif
