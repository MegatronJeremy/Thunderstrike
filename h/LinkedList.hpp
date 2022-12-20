#ifndef _LINKEDLIST_HPP
#define _LINKEDLIST_HPP

#include "KObject.hpp"
#include "ListNode.hpp"

// Kernel template structure - doubly linked list of already allocated nodes
template<typename T>
class LinkedList : public KObject<LinkedList<T>> {
public:
    LinkedList() = default;

    LinkedList(const LinkedList &) = delete;

    void operator=(const LinkedList &) = delete;

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
        if (!tail) return nullptr;
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

private:
    ListNode<T> *head = nullptr, *tail = nullptr, *curr = nullptr;

    uint64 size = 0;

};


template<typename T>
void LinkedList<T>::addFirst(ListNode<T> *elem) {
    if (!elem) return;
    elem->next = head;
    elem->prev = nullptr;
    if (head) head->prev = elem;
    else tail = elem;
    head = elem;

    size++;
}

template<typename T>
void LinkedList<T>::addLast(ListNode<T> *elem) {
    if (!elem) return;
    elem->next = nullptr;
    elem->prev = tail;
    if (tail) tail->next = elem;
    else head = elem;
    tail = elem;

    size++;
}

template<typename T>
T *LinkedList<T>::removeFirst() {
    if (!head) return nullptr;

    T *data = head->data;

    head = head->next;
    if (head) head->prev = nullptr;
    else head = tail = nullptr;

    size--;

    return data;
}

template<typename T>
T *LinkedList<T>::removeLast() {
    if (!tail) return nullptr;

    T *data = tail->data;

    tail = tail->prev;
    if (tail) tail->next = nullptr;
    else tail = head = nullptr;

    size--;

    return data;
}

template<typename T>
void LinkedList<T>::eraseCurr() {
    if (!curr) return;

    ListNode<T> *before = curr->prev, *after = curr->next;

    if (before) before->next = after;
    else head = after;

    if (after) after->prev = before;
    else tail = before;

    size--;
}

template<typename T>
void LinkedList<T>::insertAfterCurr(ListNode<T> *elem) {
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
void LinkedList<T>::insertBeforeCurr(ListNode<T> *elem) {
    if (!curr) return;
    ListNode<T> *before = curr->prev;
    elem->next = curr;
    elem->prev = before;
    curr->prev = elem;
    if (!before) head = elem;
    else before->next = elem;
    size++;
}

#endif
