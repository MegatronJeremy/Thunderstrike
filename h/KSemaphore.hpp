#ifndef _KSEMAPHORE_HPP
#define _KSEMAPHORE_HPP

#include "KObject.hpp"
#include "LinkedList.hpp"
#include "MapEntry.hpp"

class TCB;

// Kernel implementation of standard semaphore
class KSemaphore : public KObject<KSemaphore> {
public:
    KSemaphore() = default;

    static KSemaphore *createObj(int v = 1);

    void deleteObj() override;

    virtual int wait();

    virtual int signal();

    bool tryWait();

    int getId() const {
        return id;
    }

    MapEntry<int, KSemaphore *> *getMapEntry() {
        return entry;
    }

    ~KSemaphore() override;

protected:
    void block();

    virtual void deblock();

    int val = 1;

    LinkedList<TCB> *blockedThreadQueue = LinkedList<TCB>::createObj();
private:
    static int ID;
    int id = ID++;

    MapEntry<int, KSemaphore *> *entry = MapEntry<int, KSemaphore *>::createObj(id, this);

};

#endif
