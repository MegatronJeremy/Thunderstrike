#ifndef _KCONSOLE_HPP
#define _KCONSOLE_HPP

#include "../h/KObject.hpp"
#include "../h/Mutex.hpp"
#include "../h/Buffer.hpp"
#include "../h/IOEvent.hpp"

typedef volatile uint8* reg;

// Kernel console implementation - for direct communication with UART console
class KConsole : public KObject {
public:
    KConsole(const KConsole &) = delete;
    void operator=(const KConsole &) = delete;

    void putc(char chr);

    char getc();

    void consoleHandler();

    static KConsole *getInstance();

    ~KConsole() override;

private:
    KConsole();

    static reg inputData, outputData, status;

    [[noreturn]] void writeToConsole();

    [[noreturn]] void readFromConsole();

    Buffer<char> outputBuffer, inputBuffer;

    IOEvent readyToRead, readyToWrite;
    KSemaphore inputItemsAvailable, outputItemsAvailable;
    KSemaphore inputSlotsAvailable, outputSlotsAvailable;
    Mutex mutexPut, mutexGet;

    TCB *kernelConsumer, *kernelProducer;

};

#endif
