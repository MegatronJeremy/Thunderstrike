//
// Created by os on 5/19/22.
//
#include "../h/syscall_c.h"

#ifndef OS_PROJEKATV1_0_PRINTTEST_H
#define OS_PROJEKATV1_0_PRINTTEST_H

void printTest() {
    putc('c');
    char c = getc();
    putc(c);
};

#endif //OS_PROJEKATV1_0_PRINTTEST_H
