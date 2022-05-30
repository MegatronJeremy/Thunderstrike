#ifndef _SYSPRINT_HPP
#define _SYSPRINT_HPP

#include "../lib/hw.h"
#include "Mutex.hpp"

// For printing system messages
class PrintMutex : public KObject {
public:
    static Mutex* getMutex() {
        static auto *mutex = new Mutex;
        return mutex;
    }

    static void wait() {
        getMutex()->wait();
    }

    static void signal() {
        getMutex()->signal();
    }

private:
    PrintMutex() = default;
};

void kprintString(char const *string);

void kprintInteger(int integer, int base = 10);

void kprintUnsigned(uint64 uint, int base = 10);

#endif
