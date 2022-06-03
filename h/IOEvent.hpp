#ifndef _IOEVENT_HPP
#define _IOEVENT_HPP

#include "PrioritySemaphore.hpp"

// Input/output event binary semaphore - gives higher priority to I/O threads
class IOEvent: public PrioritySemaphore {
public:
    explicit IOEvent(int val);

    int wait() override;
    int signal() override;
};

#endif
