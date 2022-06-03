#include "../h/SysPrint.hpp"
#include "../h/Kernel.hpp"

void kprintString(char const *string) {
    PrintMutex::wait();
    while (*string != '\0') {
        Kernel::putc(*string);
        string++;
    }
    PrintMutex::signal();
}

void kprintInteger(int integer, int base) {
    PrintMutex::wait();
    static char digits[] = "0123456789abcdef";
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
        buf[i++] = digits[x % base];
    } while ((x /= base) != 0);
    if (neg) buf[i++] = '-';

    while (--i >= 0)
        Kernel::putc(buf[i]);
    PrintMutex::signal();
}

void kprintUnsigned(uint64 x, int base) {
    PrintMutex::wait();
    static char digits[] = "0123456789abcdef";
    char buf[16];

    int i = 0;
    do {
        buf[i++] = digits[x % base];
    } while ((x /= base) != 0);

    while (--i >= 0)
        Kernel::putc(buf[i]);
    PrintMutex::signal();
}
