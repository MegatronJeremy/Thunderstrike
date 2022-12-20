#ifndef _KSEMAPHORE_HPP
#define _KSEMAPHORE_HPP

#include "KObject.hpp"
#include "LinkedList.hpp"
#include "LinkedHashNode.hpp"

class TCB;

// Kernel implementation of standard semaphore
class KSemaphore : public KObject<KSemaphore> {
public:
    static KSemaphore *createKSemaphore(int v = 1);

    void defaultCtor() override;

    void defaultDtor() override;

    virtual int wait();

    virtual int signal();

    uint64 getId() const {
        return id;
    }

    LinkedHashNode<KSemaphore> *getHashNode() {
        return hashNode;
    }

protected:
    void block();

    virtual void deblock();

    int val;

    LinkedList<TCB> *blockedThreadQueue;
private:
    static uint64 ID;
    uint64 id = ID++;

    LinkedHashNode<KSemaphore> *hashNode;

};

#endif
