#include "../h/String.h"
#include "../h/Kernel.hpp"
#include "../h/DummyMutex.hpp"

int String::strcmp(const char *s1, const char *s2) {
    while (*s1 != '\0' && *s2 != '\0') {
        if (*s1 < *s2) return -1;
        if (*s1 > *s2) return 1;
        s1++, s2++;
    }
    return 0;
}

void String::memset(const void *mem, int c, size_t n) {
    char *str = (char *) mem;
    for (size_t i = 0; i < n; i++) {
        *str++ = c;
    }
}

char *String::strcpy(char *dst, const char *src) {
    if (dst == nullptr) return nullptr;

    char *start = dst;

    while (*src != '\0') {
        *dst++ = *src++;
    }

    return start;
}


char *String::strncpy(char *dst, const char *src, size_t num, char fill) {
    if (dst == nullptr) return nullptr;

    char *start = dst;

    while (*src != '\0' && num > 0) {
        *dst++ = *src++;
        num--;
    }

    while (num > 0) {
        *dst++ = fill;
        num--;
    }

    return start;
}

void String::kprint(char const *string) {
    DummyMutex dummy(getPrintMutex());

    while (*string != '\0') {
        Kernel::putc(*string);
        string++;
    }
}

void String::kprint(int integer, int base) {
    DummyMutex dummy(getPrintMutex());

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
}

void String::kprint(uint64 x, int base) {
    DummyMutex dummy(getPrintMutex());

    static char digits[] = "0123456789abcdef";
    char buf[16];

    int i = 0;
    do {
        buf[i++] = digits[x % base];
    } while ((x /= base) != 0);

    while (--i >= 0)
        Kernel::putc(buf[i]);
}

Mutex *String::getPrintMutex() {
    static Mutex *mutex = Mutex::createObj();
    return mutex;
}


