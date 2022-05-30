#ifndef _KSEMAPHORE_HPP
#define _KSEMAPHORE_HPP

#include "KObject.hpp"
#include "LinkedList.hpp"
#include "LinkedHashNode.hpp"

class TCB;

// Kernel implementation of standard semaphore
class KSemaphore : public KObject {
public:
    explicit KSemaphore(int val = 1);

    virtual int wait();

    virtual int signal();

    uint64 getId() const {
        return id;
    }

    LinkedHashNode<KSemaphore> *getHashNode() {
        return &hashNode;
    }

    ~KSemaphore() override;

protected:
    void block();

    virtual void deblock();

    int val;

    LinkedList<TCB> blockedThreadQueue;
private:
    static uint64 ID;
    uint64 id = ID++;

    LinkedHashNode<KSemaphore> hashNode;

};

#endif
