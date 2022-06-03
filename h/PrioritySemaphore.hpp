#ifndef _PRIORITYSEMAPHORE_HPP
#define _PRIORITYSEMAPHORE_HPP

#include "KSemaphore.hpp"

// Semaphore that puts blocked threads in scheduler with highest priority
class PrioritySemaphore : public KSemaphore {
public:
    explicit PrioritySemaphore(int val = 1) : KSemaphore(val) {}

protected:
    void deblock() override;
};


#endif
