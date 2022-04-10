//
// Created by xparh on 4/24/2022.
//

#ifndef OS1_VEZBE07_RISCV_CONTEXT_SWITCH_1_SYNCHRONOUS_WORKERS_H
#define OS1_VEZBE07_RISCV_CONTEXT_SWITCH_1_SYNCHRONOUS_WORKERS_H

#include "printing.hpp"
#include "../h/syscall_c.h"

uint64 fib(uint64 n) {
    if (n == 0 || n == 1) return n;
    if (n % 4 == 0) {
        thread_dispatch();
    }
//    printInteger(n);
//    printString(" fibonacci number\n");
    return fibonacci(n-1) + fibonacci(n-2);
}

void workerBodyE(void *) {
    for (uint64 i = 0; i < 10; i++) {
        printString("A: i=");
        printInt(i);
        printString("\n");
        if (i % 4 == 0) time_sleep(50);
        for (uint64 k = 0; k < 30000; k++) {
            //busy wait
        }
        // TCB::yield();
    }
    printString("Worker A finished\n");
}

void workerBodyF(void *) {
    for (uint64 i = 0; i < 16; i++) {
        printString("B: i=");
        printInt(i);
        printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) {
                // busy wait
            }
            // TCB::yield()
        }
        thread_dispatch();
    }
    printString("Worker B finished\n");
}

void workerBodyG(void *) {
    uint8 i = 0;
    for (; i < 3; i++) {
        printString("C: i=");
        printInt(i);
        printString("\n");
    }

    printString("C: yield\n");
    __asm__("li t1, 7");
    thread_dispatch();

    uint64  t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));

    printString("C: t1=");
    printInt(t1);
    printString("\n");

    uint64 result = fib(30);
    printString("C: fibonacci=");
    printInt(result);
    printString("\n");

    for (; i < 6; i++) {
        printString("C: i=");
        printInt(i);
        printString("\n");
    }
    // TCB::yield()
    printString("Worker C finished\n");
}

void workerBodyH(void *) {
    uint8 i = 10;
    for (; i < 13; i++) {
        printString("D: i=");
        printInt(i);
        printString("\n");
    }

    printString("D: yield\n");
    __asm__ ("li t1, 5");
    thread_dispatch();

    uint64 result = fib(23);
    printString("D: fibonacci=");
    printInt(result);
    printString("\n");

    for (; i < 16; i++) {
        printString("D: i=");
        printInt(i);
        printString("\n");
    }
    // TCB::yield()
    printString("Worker D finished\n");
}

#endif //OS1_VEZBE07_RISCV_CONTEXT_SWITCH_1_SYNCHRONOUS_WORKERS_H
