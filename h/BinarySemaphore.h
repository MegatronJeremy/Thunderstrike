#ifndef _BINARYSEMAPHORE_H
#define _BINARYSEMAPHORE_H

#include "KernelSemaphore.h"

class BinarySemaphore: public KernelSemaphore {
public:
    BinarySemaphore(int val);

    int wait() override;
    int signal() override;

};

#endif
