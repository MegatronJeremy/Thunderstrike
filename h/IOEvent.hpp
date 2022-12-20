#ifndef _IOEVENT_HPP
#define _IOEVENT_HPP

#include "KSemaphore.hpp"

// Input/output event binary semaphore
class IOEvent : public KSemaphore, public KObject<IOEvent> {
public:
    void defaultCtor() override;

    void defaultDtor() override;

    using KObject<IOEvent>::createObj;

    static IOEvent *createIOEvent(int val);

    int wait() override;

    int signal() override;
};

#endif
