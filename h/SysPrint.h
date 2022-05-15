#ifndef _SYS_PRINT_H
#define _SYS_PRINT_H

#include "../lib/hw.h"
#include "Mutex.h"

class PrintMutex : public KernelObject {
public:
    static PrintMutex* getInstance() {
        if (!instance) instance = new PrintMutex;
        return instance;
    }

    static void wait() {
        getInstance()->mutex.wait();
    }

    static void signal() {
        getInstance()->mutex.signal();
    }

    ~PrintMutex() override {
        delete instance;
    }

private:
    PrintMutex() = default;

    static PrintMutex *instance;
    Mutex mutex;
};

void kprintString(char const *string);

void kprintInteger(int integer);

void kprintUnsigned(uint64 uint);

#endif
