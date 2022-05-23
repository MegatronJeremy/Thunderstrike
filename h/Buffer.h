#ifndef _BUFFER_H
#define _BUFFER_H

#include "../lib/hw.h"
#include "KernelObject.h"
#include "Mutex.h"
#include "Riscv.h"

template<typename T>
class Buffer : public KernelObject {
public:
    Buffer();

    explicit Buffer(uint64 size);

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
Buffer<T>::Buffer() : Buffer(DEFAULT_BUFFER_SIZE) {}

template<typename T>
Buffer<T>::Buffer(uint64 size) {
    size_t sz = sizeof(T) * size;
    buffer = (T *) kmalloc(sz);
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
