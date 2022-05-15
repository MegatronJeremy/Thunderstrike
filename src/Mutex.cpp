#include "../h/Mutex.h"
#include "../h/TCB.h"
#include "../h/Riscv.h"

void Mutex::wait() {
    if (holder == TCB::running) return;
    lock()
    if (holder) block();
    holder = TCB::running;
    unlock()
}

void Mutex::signal() {
    if (holder != TCB::running) return;
    lock()
    holder = nullptr;
    deblock();
    unlock()
}

