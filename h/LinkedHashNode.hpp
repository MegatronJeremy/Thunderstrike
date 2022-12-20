#ifndef _LINKEDHASHNODE_HPP
#define _LINKEDHASHNODE_HPP

#include "KObject.hpp"

template<typename U>
class LinkedHashTable;

// Template linked hash table node
template<typename T>
class LinkedHashNode : public KObject<LinkedHashNode<T>> {
public:
    LinkedHashNode() = delete;

    void defaultCtor() override;

    static LinkedHashNode<T> *createLinkedHashNode(T *d, uint64 i, LinkedHashNode<T> *n = nullptr);

private:
    friend class LinkedHashTable<T>;

    T *data;
    uint64 id;
    LinkedHashNode *next;

};

template<typename T>
void LinkedHashNode<T>::defaultCtor() {
    data = nullptr;
    id = -1;
    next = nullptr;
}

template<typename T>
LinkedHashNode<T> *LinkedHashNode<T>::createLinkedHashNode(T *d, uint64 i, LinkedHashNode<T> *n) {
    LinkedHashNode<T> *obj = LinkedHashNode<T>::createObj();
    obj->data = d;
    obj->id = i;
    obj->next = n;

    return obj;
}

#endif
