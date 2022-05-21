#ifndef _LISTNODE_H
#define _LISTNODE_H

#include "KernelObject.h"

template<typename U>
class NodeList;

template<typename T>
class ListNode : public KernelObject {
public:
    explicit ListNode(T *data, ListNode *next = nullptr, ListNode *prev = nullptr) :
            data(data),
            next(next),
            prev(prev) {}

private:
    friend class NodeList<T>;

    T *data;
    ListNode *next, *prev;

};

#endif
