#ifndef _QUEUE_H
#define _QUEUE_H

#include "../lib/hw.h"
#include "KernelObject.h"
#include "Mutex.h"
#include "Riscv.h"


template<typename T>
class BoundedBuffer : public KernelObject {
public:
    BoundedBuffer() :
            slotsAvailable(DEFAULT_BUFFER_SIZE),
            itemsAvailable(0) {
        size_t sz = sizeof(T) * DEFAULT_BUFFER_SIZE;
        buffer = (T *) kmalloc(sz);
    };

    BoundedBuffer(const BoundedBuffer<T> &) = delete;

    BoundedBuffer &operator=(const BoundedBuffer<T> &) = delete;

    int addLast(T t) {
        slotsAvailable.wait();
        mutex.wait();
        buffer[back] = t;
        back = (back + 1) % size;
        cnt++;
        mutex.signal();
        itemsAvailable.signal();
        return 0;
    }

    T removeFirst() {
        itemsAvailable.wait();
        mutex.wait();
        T t = buffer[front];
        front = (front + 1) % size;
        cnt--;
        mutex.signal();
        slotsAvailable.signal();
        return t;
    }

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
    Mutex mutex;
    T *buffer;
};

#endif
