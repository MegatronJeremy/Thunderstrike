//
// Created by xparh on 5/13/2022.
//

#ifndef OS_PROJEKAT_THREADNODE_H
#define OS_PROJEKAT_THREADNODE_H

#include "KernelObject.h"

class TCB;

class ThreadNode : public KernelObject {
public:
    ThreadNode(TCB *data, ThreadNode *next = nullptr, ThreadNode *prev = nullptr) : data(data), next(next), prev(prev) {}
private:
    friend class ThreadList;

    TCB *data;
    ThreadNode *next, *prev;

};

#endif //OS_PROJEKAT_THREADNODE_H
