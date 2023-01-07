#ifndef _STRING_H
#define _STRING_H

#include "../lib/hw.h"

class Mutex;

namespace String {
    int strcmp(const char *s1, const char *s2);

    void memset(const void *mem, int c, size_t n);

    char *strcpy(char *dst, const char *src);

    char *strncpy(char *dst, const char *src, size_t num, char fill = '\0');

    void kprint(char const *string);

    void kprint(int integer, int base = 10);

    void kprint(uint64 uint, int base = 10);

    Mutex *getPrintMutex();
}

#endif
