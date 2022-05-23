#ifndef _SYS_PRINT_H
#define _SYS_PRINT_H

#include "../lib/hw.h"
#include "Mutex.h"

class PrintMutex : public KernelObject {
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

void kprintInteger(int integer);

void kprintUnsigned(uint64 uint);

#endif
