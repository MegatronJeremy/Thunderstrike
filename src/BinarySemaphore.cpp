#include "../h/BinarySemaphore.h"
#include "../h/Riscv.h"
#include "../h/TCB.h"

BinarySemaphore::BinarySemaphore(int val) : KernelSemaphore() {
    if (val < 0) val = 0;
    if (val > 1) val = 1;
    this->val = val;
}

int BinarySemaphore::wait() {
    lock()
    if (val == 0) block();
    val = 0;
    unlock()
    if (TCB::running->isInterrupted()) {
        TCB::running->setReady();
        return -1;
    }
    return 0;
}

int BinarySemaphore::signal() {
    if (val == 1) return -1;
    lock()
    val = 1;
    deblock();
    unlock()
    return 0;
}

