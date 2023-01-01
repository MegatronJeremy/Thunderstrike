#ifndef _MUTEX_HPP
#define _MUTEX_HPP

#include "KSemaphore.hpp"

class TCB;

// Mutex class - for synchronization of kernel critical sections
class Mutex : public KObject<Mutex> {
public:
    void deleteObj() override;

    int wait();

    int signal();

private:
    void block();

    void deblock();

    TCB *holder = nullptr;

    LinkedList<TCB> blockedThreadQueue;
};

#endif
