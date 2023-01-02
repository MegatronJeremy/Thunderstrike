#ifndef _MY_USER_MAIN_H
#define _MY_USER_MAIN_H

#include "Workers.h"
#include "../h/syscall_c.h"
#include "ProducerConsumer.h"
#include "printing.hpp"

class MyPeriodicTen: public PeriodicThread {
public:
    MyPeriodicTen(): PeriodicThread(100) {};
private:
    void periodicActivation() override {
        printString("Periodic activation with period 10s!\n");
    }
};

class MyPeriodicFive: public PeriodicThread {
public:
    MyPeriodicFive(): PeriodicThread(50) {};
private:
    void periodicActivation() override {
        printString("Periodic activation with period 5s!\n");
    }
};

class MyPeriodicTwo: public PeriodicThread {
public:
    MyPeriodicTwo(): PeriodicThread(20) {};
private:
    void periodicActivation() override {
        printString("Periodic activation with period 2s!\n");
    }
};

void myUserMain() {
    printString("In user main\n");

    void *mem = mem_alloc(250000);
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
    thread_t t9;

    PeriodicThread *p1 = new MyPeriodicTen();
    PeriodicThread *p2 = new MyPeriodicFive();
    PeriodicThread *p3 = new MyPeriodicTwo();
    p1->start();
    p3->start();

    thread_create(&t1, &workerBodyE, nullptr);

    printString("Nit t1: ");
    printInt((uint64) t1);
    printString("\n");

    thread_create(&t2, &workerBodyF, nullptr);
    thread_create(&t3, &workerBodyG, nullptr);
    thread_create(&t4, &workerBodyH, nullptr);
    thread_create(&t5, &ProducerConsumer::produceWrapper, obj);
    thread_create(&t6, &ProducerConsumer::consumeWrapper, obj);
    thread_create(&t7, &ProducerConsumer::consumeWrapper, obj);
    thread_create(&t8, &ProducerConsumer::consumeWrapper, obj);
    thread_create(&t9, &ProducerConsumer::consumeWrapper, obj);


    time_sleep(50);

    printString("Periodic thread 2 started:\n");
    p2->start();

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

    delete p1;
    delete p2;
    delete obj;

//    __asm__ volatile("csrr a0, sepc");

    printString("User main finished\n");
}

#endif