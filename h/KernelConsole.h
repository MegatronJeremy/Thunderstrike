#ifndef _KERNEL_CONSOLE_H
#define _KERNEL_CONSOLE_H

#include "../h/KernelObject.h"
#include "../h/Mutex.h"
#include "../h/Buffer.h"
#include "../h/IOEvent.h"

typedef volatile uint8* reg;

class KernelConsole : public KernelObject {
public:
    KernelConsole(const KernelConsole &) = delete;
    void operator=(const KernelConsole &) = delete;

    void putc(char chr);

    char getc();

    void consoleHandler();

    static KernelConsole *getInstance();

    ~KernelConsole() override;

private:
    KernelConsole();

    static reg inputData, outputData, status;

    [[noreturn]] void writeToConsole();

    [[noreturn]] void readFromConsole();

    Buffer<char> outputBuffer, inputBuffer;

    IOEvent readyToRead, readyToWrite;
    KernelSemaphore inputItemsAvailable, outputItemsAvailable;
    KernelSemaphore inputSlotsAvailable, outputSlotsAvailable;
    Mutex mutexPut, mutexGet;

    TCB *kernelConsumer, *kernelProducer;

};

#endif
