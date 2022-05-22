#ifndef _QUEUE_H
#define _QUEUE_H

#include "../lib/hw.h"
#include "KernelObject.h"
#include "Mutex.h"
#include "Riscv.h"


template<typename T>
class BoundedBuffer : public KernelObject {
public:
    BoundedBuffer();

    BoundedBuffer(const BoundedBuffer<T> &) = delete;

    BoundedBuffer &operator=(const BoundedBuffer<T> &) = delete;

    int addLast(T t);

    T removeFirst();

    uint64 getSize() const {
        return size;
    }

    uint64 getCount() const {
        return cnt;
    }

    bool isEmpty() const {
        return cnt == 0;
    }

private:
    uint64 front = 0, back = 0, size = DEFAULT_BUFFER_SIZE, cnt = 0;
    KernelSemaphore slotsAvailable, itemsAvailable;
    Mutex mutexFront, mutexBack;
    T *buffer;
};

template<typename T>
BoundedBuffer<T>::BoundedBuffer() :
        slotsAvailable(DEFAULT_BUFFER_SIZE),
        itemsAvailable(0) {
    size_t sz = sizeof(T) * DEFAULT_BUFFER_SIZE;
    buffer = (T *) kmalloc(sz);
}

template<typename T>
int BoundedBuffer<T>::addLast(T t) {
    slotsAvailable.wait();
    mutexBack.wait();
    buffer[back] = t;
    back = (back + 1) % size;
    cnt++;
    mutexBack.signal();
    itemsAvailable.signal();
    return 0;
}

template<typename T>
T BoundedBuffer<T>::removeFirst() {
    itemsAvailable.wait();
    mutexFront.wait();
    T t = buffer[front];
    front = (front + 1) % size;
    cnt--;
    mutexFront.signal();
    slotsAvailable.signal();
    return t;
}

#endif
