//
// Created by xparh on 4/24/2022.
//

#include "../h/SysPrint.h"
#include "../lib/console.h"
#include "../h/Riscv.h"

void kprintString(char const *string) {
//    uint64 sstatus;
//    Riscv::lock(sstatus);

    while (*string != '\0') {
        __putc(*string);
        string++;
    }

//    Riscv::unlock(sstatus);
}

void kprintInteger(int integer) {
//    uint64 sstatus;
//    Riscv::lock(sstatus);

    static char digits[] = "0123456789";
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if (integer < 0) {
        neg = 1;
        x = -integer;
    } else {
        x = integer;
    }

    i = 0;
    do {
        buf[i++] = digits[x % 10];
    } while ((x /= 10) != 0);
    if (neg) buf[i++] = '-';

    while (--i >= 0)
        __putc(buf[i]);

//    Riscv::unlock(sstatus);
}

void kprintUnsigned(uint64 x) {
//    uint64 sstatus;
//    Riscv::lock(sstatus);

    static char digits[] = "0123456789";
    char buf[16];

    int i = 0;
    do {
        buf[i++] = digits[x % 10];
    } while ((x /= 10) != 0);

    while (--i >= 0)
        __putc(buf[i]);

//    Riscv::unlock(sstatus);
}
