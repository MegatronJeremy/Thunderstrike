#ifndef _NODELIST_H
#define _NODELIST_H

#include "KernelObject.h"
#include "ListNode.h"

template<typename T>
class NodeList : public KernelObject {
public:
    explicit NodeList() = default;

    NodeList(const NodeList &) = delete;

    NodeList &operator=(const NodeList &) = delete;

    int getCount() const {
        return size;
    }

    void addFirst(ListNode<T> *elem);

    void addLast(ListNode<T> *elem);

    T *removeFirst();

    T *getFirst() {
        if (!head) return nullptr;
        return head->data;
    }

    T *removeLast();

    T *getLast() {
        if (!head) return nullptr;
        return tail->data;
    }

    void toHead() {
        curr = head;
    }

    void toTail() {
        curr = tail;
    }

    void toNext() {
        curr = curr->next;
    }

    void toPrev() {
        curr = curr->prev;
    }

    bool hasCurr() const {
        return curr != nullptr;
    }

    bool isEmpty() const {
        return size == 0;
    }

    T *getCurr() {
        if (!curr) return nullptr;
        return curr->data;
    }

    void eraseCurr();

    void insertAfterCurr(ListNode<T> *elem);

    void insertBeforeCurr(ListNode<T> *elem);

    ~NodeList() override;

private:
    ListNode<T> *head = nullptr, *tail = nullptr, *curr = nullptr;

    int size = 0;

};

template<typename T>
void NodeList<T>::addFirst(ListNode<T> *elem) {
    elem->next = head;
    elem->prev = nullptr;
    if (head) head->prev = elem;
    else tail = elem;
    head = elem;

    size++;
}

template<typename T>
void NodeList<T>::addLast(ListNode<T> *elem) {
    elem->next = nullptr;
    elem->prev = tail;
    if (tail) tail->next = elem;
    else head = elem;
    tail = elem;

    size++;
}

template<typename T>
T *NodeList<T>::removeFirst() {
    if (!head) return nullptr;

    T *data = head->data;

    head = head->next;
    if (head) head->prev = nullptr;
    else head = tail = nullptr;

    size--;

    return data;
}

template<typename T>
T *NodeList<T>::removeLast() {
    if (!tail) return nullptr;

    T *data = tail->data;

    tail = tail->prev;
    if (tail) tail->next = nullptr;
    else tail = head = nullptr;

    size--;

    return data;
}

template<typename T>
void NodeList<T>::eraseCurr() {
    if (!curr) return;

    ListNode<T> *before = curr->prev, *after = curr->next;

    if (before) before->next = after;
    else head = after;

    if (after) after->prev = before;
    else tail = before;

    size--;
}

template<typename T>
void NodeList<T>::insertAfterCurr(ListNode<T> *elem) {
    if (!curr) return;
    ListNode<T> *after = curr->next;
    elem->next = after;
    elem->prev = curr;
    curr->next = elem;
    if (!after) tail = elem;
    else after->prev = elem;
    size++;
}

template<typename T>
void NodeList<T>::insertBeforeCurr(ListNode<T> *elem) {
    if (!curr) return;
    ListNode<T> *before = curr->prev;
    elem->next = curr;
    elem->prev = before;
    curr->prev = elem;
    if (!before) head = elem;
    else before->next = elem;
    size++;
}

template<typename T>
NodeList<T>::~NodeList() {
    head = nullptr;
    tail = nullptr;
    curr = nullptr;
    size = 0;
}

#endif
