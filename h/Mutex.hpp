#ifndef _MUTEX_HPP
#define _MUTEX_HPP

#include "KSemaphore.hpp"

class TCB;

// Mutex class - for synchronization of kernel critical sections
class Mutex : public KSemaphore, public KObject<Mutex> {
public:
    void defaultCtor() override;

    void defaultDtor() override;

    using KObject<Mutex>::createObj;

    int wait() override;

    int signal() override;

private:
    TCB *holder = nullptr;

};

#endif
