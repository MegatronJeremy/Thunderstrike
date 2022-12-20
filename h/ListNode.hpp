#ifndef _LISTNODE_HPP
#define _LISTNODE_HPP

#include "KObject.hpp"

template<typename U>
class LinkedList;

// Template linked list node
template<typename T>
class ListNode : public KObject<ListNode<T>> {
public:
    ListNode() = default;

    ListNode(const ListNode &) = delete;

    void operator=(const ListNode &) = delete;

    static ListNode *createListNode(T *d, ListNode *n = nullptr, ListNode *p = nullptr);

private:
    friend class LinkedList<T>;

    T *data;
    ListNode *next, *prev;

};

template<typename T>
ListNode<T> *ListNode<T>::createListNode(T *d, ListNode *n, ListNode *p) {
    ListNode *obj = ListNode<T>::createObj();
    obj->data = d;
    obj->next = n;
    obj->prev = p;

    return obj;
}

#endif
