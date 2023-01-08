#ifndef _IOEVENT_HPP
#define _IOEVENT_HPP

#include "KSemaphore.hpp"

// Input/output event binary semaphore
class IOEvent : public KSemaphore, public KObject<IOEvent> {
public:
    using KObject<IOEvent>::createObj;

    using KObject<IOEvent>::operator new;

    using KObject<IOEvent>::operator delete;

    static IOEvent *createObj(int val);

    int wait() override;

    int signal() override;

};

#endif
