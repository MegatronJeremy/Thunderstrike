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
    if (TCB::running->isInterrupted()) {
        TCB::running->setReady();
        unlock()
        return -1;
    }
    unlock()

    return 0;
}

int BinarySemaphore::signal() {
    lock()
    if (val == 1) {
        unlock();
        return -1;
    }
    val = 1;
    deblock();
    unlock()
    return 0;
}

