#ifndef _THREADLIST_H
#define _THREADLIST_H

#include "KernelObject.h"
#include "ThreadNode.h"

class ThreadList : public KernelObject {
public:
    explicit ThreadList() = default;

    ThreadList(const ThreadList &) = delete;

    ThreadList &operator=(const ThreadList &) = delete;

    int getCount() const {
        return size;
    }

    void addFirst(ThreadNode *elem);

    void addLast(ThreadNode *elem);

    TCB *removeFirst();

    TCB *getFirst() {
        if (!head) return nullptr;
        return head->data;
    }

    TCB *removeLast();

    TCB *getLast() {
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

    TCB *getCurr() {
        if (!curr) return nullptr;
        return curr->data;
    }

    void eraseCurr();

    void insertAfterCurr(ThreadNode *elem);

    void insertBeforeCurr(ThreadNode *elem);

    ~ThreadList() override;

private:
    ThreadNode *head = nullptr, *tail = nullptr, *curr = nullptr;

    int size = 0;

};

#endif
