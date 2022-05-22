#ifndef _KERNEL_CONSOLE_H
#define _KERNEL_CONSOLE_H

#include "../h/KernelObject.h"
#include "../h/Mutex.h"
#include "../h/BoundedBuffer.h"
#include "../h/BinarySemaphore.h"

typedef volatile uint8* reg;

class KernelConsole : public KernelObject {
public:

    static void putc(char chr);

    static char getc();

    static void consoleHandler();

    static KernelConsole *getInstance();

    ~KernelConsole() override;

private:

    static reg inputData, outputData, status;

    KernelConsole();

    static KernelConsole *instance;

    [[noreturn]] void writeToConsole();

    [[noreturn]] void readFromConsole();

    BoundedBuffer<char> outputBuffer, inputBuffer;

    KernelSemaphore readyToRead, readyToWrite;

    TCB *kernelConsumer, *kernelProducer;

};

#endif
