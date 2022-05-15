#ifndef _QUEUE_H
#define _QUEUE_H

#include "../lib/hw.h"
#include "KernelObject.h"

template<typename T>
class Queue : public KernelObject {
public:
    Queue() = default;

    Queue(const Queue<T> &) = delete;

    Queue<T> &operator=(const Queue<T> &) = delete;

    int addLast(T *t) {
        if (cnt == size) return -1;
        buffer[back] = t;
        back = (back + 1) % size;
        cnt++;
        return 0;
    }

    T *removeFirst() {
        if (cnt == 0) return nullptr;
        T *t = buffer[front];
        front = (front + 1) % size;
        cnt--;
        return t;
    }

    uint64 getSize() {
        return size;
    }

    uint64 getCount() {
        return cnt;
    }

//    ~Queue() {
//        kfree(buffer);
//    }

private:
    static constexpr uint64 DEFAULT_SIZE = 1024;

    uint64 front = 0, back = 0, size = DEFAULT_SIZE, cnt = 0;
    T *buffer[DEFAULT_SIZE];


};

#endif
