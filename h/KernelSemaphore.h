#ifndef _KERNEL_SEMAPHORE_H
#define _KERNEL_SEMAPHORE_H

#include "KernelObject.h"
#include "NodeList.h"
#include "LinkedHashNode.h"

class TCB;

class KernelSemaphore : public KernelObject {
public:
    explicit KernelSemaphore(int val = 1);

    virtual int wait();

    virtual int signal();

    uint64 getId() const {
        return id;
    }

    LinkedHashNode<KernelSemaphore> *getHashNode() {
        return &hashNode;
    }

    ~KernelSemaphore() override;

protected:
    void block();

    virtual void deblock();

    int val;

    NodeList<TCB> blockedThreadQueue;
private:
    static uint64 ID;
    uint64 id = ID++;

    LinkedHashNode<KernelSemaphore> hashNode;

};

#endif
