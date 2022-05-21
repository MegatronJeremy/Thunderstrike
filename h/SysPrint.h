#ifndef _SYS_PRINT_H
#define _SYS_PRINT_H

#include "../lib/hw.h"
#include "Mutex.h"

class PrintMutex : public KernelObject {
public:
    static Mutex* getMutex() {
        if (!mutex) mutex = new Mutex;
        return mutex;
    }

    static void wait() {
        getMutex()->wait();
    }

    static void signal() {
        getMutex()->signal();
    }

    ~PrintMutex() override {
        delete mutex;
    }

private:
    PrintMutex() = default;

    static Mutex *mutex;
};

void kprintString(char const *string);

void kprintInteger(int integer);

void kprintUnsigned(uint64 uint);

#endif
