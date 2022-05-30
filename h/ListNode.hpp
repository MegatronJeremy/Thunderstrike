#ifndef _LISTNODE_HPP
#define _LISTNODE_HPP

#include "KObject.hpp"

template<typename U>
class LinkedList;

// Template linked list node
template<typename T>
class ListNode : public KObject {
public:
    explicit ListNode(T *data, ListNode *next = nullptr, ListNode *prev = nullptr) :
            data(data),
            next(next),
            prev(prev) {}

private:
    friend class LinkedList<T>;

    T *data;
    ListNode *next, *prev;

};

#endif
