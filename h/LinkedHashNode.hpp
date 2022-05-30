#ifndef _LINKEDHASHNODE_HPP
#define _LINKEDHASHNODE_HPP

#include "KObject.hpp"

template<typename U>
class LinkedHashTable;

// Template linked hash table node
template<typename T>
class LinkedHashNode : public KObject {
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
