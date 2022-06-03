//
// Created by xparh on 4/28/2022.
//

#ifndef OS_PROJEKAT_PRODUCERCONSUMER_H
#define OS_PROJEKAT_PRODUCERCONSUMER_H

#include "../h/syscall_c.h"
#include "printing.hpp"

class ProducerConsumer {
public:
    ProducerConsumer() {
        sem_open(&semConsumer, 0);
        sem_open(&semProducer, 1);
    }

    void produce() {
        for (int i = 1; i <= 150; i++) {
            sem_wait(semProducer);
            value++;
            sem_signal(semConsumer);
        }

        int a = sem_close(semProducer);
        int b = sem_close(semConsumer);

        printString("Producer finished with exit values: ");
        printInt(a);
        printString(" and ");
        printInt(b);
        printString("\n");
    }

    void consume() {
        for (int i = 1; i <= 50; i++) {
            int ret = sem_wait(semConsumer);
            printInt(value);
            printString(" squared is: ");
            printInt(value * value);
            printString(" and wait ret is: ");
            printInt(ret, 10, 1);
            printString("\n");
            sem_signal(semProducer);
        }

        printString("Consumer finished\n");
    }

    static void produceWrapper(void *obj) {
        ProducerConsumer *pc = (ProducerConsumer *) obj;
        pc->produce();
    }

    static void consumeWrapper(void *obj) {
        ProducerConsumer *pc = (ProducerConsumer *) obj;
        pc->consume();
    }

private:
    sem_t semProducer, semConsumer;
    int value = 0;

};


#endif //OS_PROJEKAT_PRODUCERCONSUMER_H
