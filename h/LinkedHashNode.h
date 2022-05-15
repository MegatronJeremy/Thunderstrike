#ifndef _LINKEDHASHNODE_H
#define _LINKEDHASHNODE_H

#include "KernelObject.h"

template<typename U>
class LinkedHashTable;

template<typename T>
class LinkedHashNode : public KernelObject {
public:
    explicit LinkedHashNode(T *data, uint64 id, LinkedHashNode<T> *next = nullptr) :
            data(data),
            id(id),
            next(next) {}

private:
    friend class LinkedHashTable<T>;

    T *data;
    uint64 id;
    LinkedHashNode *next;

};

#endif
