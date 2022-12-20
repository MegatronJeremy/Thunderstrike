#ifndef _KSEMAPHORE_HPP
#define _KSEMAPHORE_HPP

#include "KObject.hpp"
#include "LinkedList.hpp"
#include "LinkedHashNode.hpp"

class TCB;

// Kernel implementation of standard semaphore
class KSemaphore : public KObject<KSemaphore> {
public:
    static KSemaphore *createObj(int v = 1);

    void deleteObj() override;

    virtual int wait();

    virtual int signal();

    uint64 getId() const {
        return id;
    }

    LinkedHashNode<KSemaphore> *getHashNode() {
        return &hashNode;
    }

protected:
    void block();

    virtual void deblock();

    int val = 1;

    //TODO
    LinkedList<TCB> blockedThreadQueue;
    //= LinkedList<TCB>::createObj();
private:
    static uint64 ID;
    uint64 id = ID++;

    //TODO
    LinkedHashNode<KSemaphore> hashNode = LinkedHashNode<KSemaphore>(this, id);
    //= LinkedHashNode<KSemaphore>::createLinkedHashNode(this, id);

};

#endif
