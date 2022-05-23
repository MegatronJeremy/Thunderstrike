#include "../h/SysPrint.h"
#include "../h/Kernel.h"

void kprintString(char const *string) {
    PrintMutex::wait();
    while (*string != '\0') {
        Kernel::putc(*string);
        string++;
    }
    PrintMutex::signal();
}

void kprintInteger(int integer) {
    PrintMutex::wait();
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
        Kernel::putc(buf[i]);
    PrintMutex::signal();
}

void kprintUnsigned(uint64 x) {
    PrintMutex::wait();
    static char digits[] = "0123456789";
    char buf[16];

    int i = 0;
    do {
        buf[i++] = digits[x % 10];
    } while ((x /= 10) != 0);

    while (--i >= 0)
        Kernel::putc(buf[i]);
    PrintMutex::signal();
}
