#ifndef _MUTEX_HPP
#define _MUTEX_HPP

#include "KSemaphore.hpp"

class TCB;

// Mutex class - for synchronization of kernel critical sections
class Mutex : public KSemaphore, public KObject<Mutex> {
public:
    Mutex(LinkedList<TCB> *ll, LinkedHashNode<KSemaphore> *lhn);

    void deleteObj() override;

    using KObject<Mutex>::createObj;

    using KObject<Mutex>::operator new;

    using KObject<Mutex>::operator delete;

    int wait() override;

    int signal() override;

private:
    TCB *holder = nullptr;

};

#endif
