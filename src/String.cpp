#include "../h/String.hpp"

int String::strcmp(const char *s1, const char *s2) {
    while (*s1 != '\0' && *s2 != '\0') {
        if (*s1 < *s2) return -1;
        if (*s1 > *s2) return 1;
        s1++, s2++;
    }
    return 0;
}
