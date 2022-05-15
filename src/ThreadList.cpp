#include "../h/ThreadList.h"

void ThreadList::addFirst(ThreadNode *elem) {
    elem->next = head;
    elem->prev = nullptr;
    if (head) head->prev = elem;
    else tail = elem;
    head = elem;

    size++;
}

void ThreadList::addLast(ThreadNode *elem) {
    elem->next = nullptr;
    elem->prev = tail;
    if (tail) tail->next = elem;
    else head = elem;
    tail = elem;

    size++;
}

TCB *ThreadList::removeFirst() {
    if (!head) return nullptr;

    TCB *data = head->data;

    head = head->next;
    if (head) head->prev = nullptr;
    else head = tail = nullptr;

    size--;

    return data;
}

TCB *ThreadList::removeLast() {
    if (!tail) return nullptr;

    TCB *data = tail->data;

    tail = tail->prev;
    if (tail) tail->next = nullptr;
    else tail = head = nullptr;

    size--;

    return data;
}

void ThreadList::eraseCurr() {
    if (!curr) return;

    ThreadNode *before = curr->prev, *after = curr->next;

    if (before) before->next = after;
    else head = after;

    if (after) after->prev = before;
    else tail = before;

    size--;
}

void ThreadList::insertAfterCurr(ThreadNode *elem) {
    if (!curr) return;
    ThreadNode *after = curr->next;
    elem->next = after;
    elem->prev = curr;
    curr->next = elem;
    if (!after) tail = elem;
    else after->prev = elem;
    size++;
}

void ThreadList::insertBeforeCurr(ThreadNode *elem) {
    if (!curr) return;
    ThreadNode *before = curr->prev;
    elem->next = curr;
    elem->prev = before;
    curr->prev = elem;
    if (!before) head = elem;
    else before->next = elem;
    size++;
}

ThreadList::~ThreadList() {
    head = nullptr;
    tail = nullptr;
    curr = nullptr;
    size = 0;
}
