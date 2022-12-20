#ifndef _LINKEDHASHNODE_HPP
#define _LINKEDHASHNODE_HPP

#include "KObject.hpp"

template<typename U>
class LinkedHashTable;

// Template linked hash table node
template<typename T>
class LinkedHashNode : public KObject<LinkedHashNode<T>> {
public:
    LinkedHashNode<T>() = default;

    LinkedHashNode<T>(T *d, uint64 i, LinkedHashNode<T> *n = nullptr) :
            data(d), id(i), next(n) {}

    static LinkedHashNode<T> *createLinkedHashNode(T *d, uint64 i, LinkedHashNode<T> *n = nullptr);

private:
    friend class LinkedHashTable<T>;

    T *data = nullptr;
    uint64 id = -1;
    LinkedHashNode *next = nullptr;
};

template<typename T>
LinkedHashNode<T> *LinkedHashNode<T>::createLinkedHashNode(T *d, uint64 i, LinkedHashNode<T> *n) {
    LinkedHashNode<T> *obj = LinkedHashNode<T>::createObj();
    obj->data = d;
    obj->id = i;
    obj->next = n;

    return obj;
}

#endif
