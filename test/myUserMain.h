#ifndef _MY_USER_MAIN_H
#define _MY_USER_MAIN_H

#include "Workers.h"
#include "../h/syscall_c.h"
#include "ProducerConsumer.h"
#include "printing.hpp"

void myUserMain() {
    printString("In user main\n");

    void *mem = mem_alloc(25000);
    printInt((uint64) mem);
    printString("\n");

    ProducerConsumer *obj = new ProducerConsumer();

    thread_t t1;
    thread_t t2;
    thread_t t3;
    thread_t t4;
    thread_t t5;
    thread_t t6;
    thread_t t7;
    thread_t t8;

    thread_create(&t1, &workerBodyE, nullptr);
    thread_create(&t2, &workerBodyF, nullptr);
    thread_create(&t3, &workerBodyG, nullptr);
    thread_create(&t4, &workerBodyH, nullptr);
    thread_create(&t5, &ProducerConsumer::produceWrapper, obj);
    thread_create(&t6, &ProducerConsumer::consumeWrapper, obj);
    thread_create(&t7, &ProducerConsumer::consumeWrapper, obj);
    thread_create(&t8, &ProducerConsumer::consumeWrapper, obj);

    time_sleep(50);

    printString("Nit t2: ");
    printInt((uint64) t2);
    printString("\n");

    time_sleep(150);

    printString("Mem free called with ret value ");
    printInt(mem_free(mem));
    printString("\n");

    printString("Mem free called again with ret value ");
    printInt(mem_free(mem), 10, 1);
    printString("\n");

    delete obj;

    printString("User main finished\n");
}

#endif