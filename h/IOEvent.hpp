#ifndef _IOEVENT_HPP
#define _IOEVENT_HPP

#include "KSemaphore.hpp"

// Input/output event binary semaphore
class IOEvent: public KSemaphore {
public:
    explicit IOEvent(int val);

    int wait() override;
    int signal() override;
};

#endif
