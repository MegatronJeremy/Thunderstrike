//
// Created by os on 5/22/22.
//

#ifndef OS_PROJEKATV1_0_SYNCTEST_H
#define OS_PROJEKATV1_0_SYNCTEST_H

#include "../h/syscall_c.h"
#include "printing.hpp"

void syncTest() {
    printString("Sync test start:\n");
    char c;
    while ((c = getc()) != '0') {
        putc(c);
    }
}

#endif //OS_PROJEKATV1_0_SYNCTEST_H
