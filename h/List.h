//
// Created by xparh on 4/24/2022.
//

#ifndef OS1_VEZBE07_RISCV_CONTEXT_SWITCH_1_SYNCHRONOUS_LIST_H
#define OS1_VEZBE07_RISCV_CONTEXT_SWITCH_1_SYNCHRONOUS_LIST_H

#include "KernelObject.h"

template<typename T>
class List : public KernelObject {
public:
    explicit List() = default;

    List(const List<T> &) = delete;

    List<T> &operator=(const List<T> &) = delete;

    int getCount() const {
        return size;
    }

    void addFirst(T *data) {
        Node *elem = new Node(data, head);
        if (head) head->prev = elem;
        else tail = elem;
        head = elem;

        size++;
    }

    void addLast(T *data) {
        Node *elem = new Node(data, nullptr, tail);
        if (tail) tail->next = elem;
        else head = elem;
        tail = elem;

        size++;
    }

    T *removeFirst() {
        if (!head) return nullptr;

        T *data = head->data;
        Node *old = head;

        head = head->next;
        if (head) head->prev = nullptr;
        else head = tail = nullptr;

        delete old;
        size--;

        return data;
    }

    T *getFirst() {
        if (!head) return nullptr;
        return head->data;
    }

    T *removeLast() {
        if (!tail) return nullptr;

        T *data = tail->data;
        Node *old = tail;

        tail = tail->prev;
        if (tail) tail->next = nullptr;
        else tail = head = nullptr;

        delete old;
        size--;

        return data;
    }

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
        if (curr) curr = curr->next;
    }

    void toPrev() {
        if (curr) curr = curr->prev;
    }

    bool hasCurr() {
        return curr != nullptr;
    }

    bool isEmpty() {
        return size == 0;
    }

    T *getCurr() {
        if (!curr) return nullptr;
        return curr->data;
    }

    void eraseCurr() {
        if (!curr) return;

        Node *old = curr, *before = curr->prev, *after = curr->next;

        if (before) before->next = after;
        else head = after;

        if (after) after->prev = before;
        else tail = before;

        delete old;
        size--;
    }

    void insertBeforeCurr(T *data) {
        if (!curr) return;
        Node *before = curr->prev;
        Node *elem = new Node(data, curr, before);
        curr->prev = elem;
        if (!before) head = elem;
        else before->next = elem;
        size++;
    }

    void insertAfterCurr(T *data) {
        if (!curr) return;
        Node *after = curr->next;
        Node *elem = new Node(data, after, curr);
        curr->next = elem;
        if (!after) tail = elem;
        else after->prev = elem;
        size++;
    }

    ~List() {
        while (head) {
            Node *old = head;
            delete old;
            head = head->next;
        }
        size = 0;
    }

private:
    struct Node : public KernelObject {
        T *data;
        Node *next, *prev;
        Node(T *data, Node *next = nullptr, Node *prev = nullptr) : data(data), next(next), prev(prev) {}
    };

    Node *head = nullptr, *tail = nullptr, *curr = nullptr;

    int size = 0;

};

#endif //OS1_VEZBE07_RISCV_CONTEXT_SWITCH_1_SYNCHRONOUS_LIST_H
