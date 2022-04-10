//
// Created by xparh on 5/9/2022.
//
#include "../h/Mutex.h"
#include "../h/TCB.h"
#include "../h/SysPrint.h"
#include "../h/Riscv.h"

void Mutex::wait() {
    lock()
//    kprintString("Waiting on mutex");
//    kprintUnsigned(val);
//    kprintString("\n");
    if (!val) block();
    holder = TCB::running;
    val = 0;
    unlock()
}

void Mutex::signal() {
    if (holder != TCB::running) return;
    lock()
    val = 1;
    holder = nullptr;
    if (blockedThreadQueue.getCount() != 0)
        deblock();
    unlock()
}

