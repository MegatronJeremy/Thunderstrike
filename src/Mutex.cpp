#include "../h/Mutex.h"
#include "../h/TCB.h"
#include "../h/Riscv.h"

int Mutex::wait() {
    if (holder == TCB::running) return 0;
    lock()
    if (holder) block();
    if (TCB::running->isInterrupted()) {
        TCB::running->setReady();
        unlock()
        return -1;
    } else {
        holder = TCB::running;
    }
    unlock()
    return 0;
}

int Mutex::signal() {
    if (holder != TCB::running) return -1;
    lock()
    holder = nullptr;
    deblock();
    unlock()
    return 0;
}

