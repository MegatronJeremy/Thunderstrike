#ifndef _IOEVENT_H
#define _IOEVENT_H

#include "KernelSemaphore.h"

class IOEvent: public KernelSemaphore {
public:
    explicit IOEvent(int val);

    int wait() override;
    int signal() override;

private:
    void deblock() override;
};

#endif
