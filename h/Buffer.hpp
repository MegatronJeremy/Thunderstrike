#ifndef _BUFFER_HPP
#define _BUFFER_HPP

#include "../lib/hw.h"
#include "KObject.hpp"
#include "Mutex.hpp"
#include "Riscv.hpp"
#include "slab.h"

// Kernel template structure - buffer
template<typename T>
class Buffer : public KObject<Buffer<T>> {
public:
    Buffer() = delete;

    void defaultCtor() override;

    void defaultDtor() override;

    static Buffer *createBuffer(uint64 sz = DEFAULT_BUFFER_SIZE);

    Buffer(const Buffer<T> &) = delete;

    Buffer &operator=(const Buffer<T> &) = delete;

    int addLast(T t);

    T removeFirst();

    uint64 getSize() const {
        return size;
    }

private:
    uint64 front = 0, back = 0, size = DEFAULT_BUFFER_SIZE;
    T *buffer;
};


template<typename T>
void Buffer<T>::defaultCtor() {
    front = back = 0;
    size = 0;
    buffer = nullptr;
}

template<typename T>
void Buffer<T>::defaultDtor() {
    kfree(buffer);
}

template<typename T>
Buffer<T> *Buffer<T>::createBuffer(uint64 sz) {
    Buffer *obj = Buffer<T>::createObj();

    obj->size = sz;
    obj->buffer = (T *) kmalloc(sz * sizeof(T));

    return obj;
}

template<typename T>
int Buffer<T>::addLast(T t) {
    buffer[back] = t;
    back = (back + 1) % size;
    return 0;
}

template<typename T>
T Buffer<T>::removeFirst() {
    T t = buffer[front];
    front = (front + 1) % size;
    return t;
}


#endif
