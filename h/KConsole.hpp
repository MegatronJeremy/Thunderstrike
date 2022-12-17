#ifndef _KCONSOLE_HPP
#define _KCONSOLE_HPP

#include "../h/KObject.hpp"
#include "../h/Mutex.hpp"
#include "../h/Buffer.hpp"
#include "../h/IOEvent.hpp"

typedef volatile uint8 *REG;

// Kernel console implementation - for direct communication with UART console
class KConsole {
public:
    static void initKConsole();

    static void putc(char chr);

    static char getc();

    static void consoleHandler();

private:
    static bool initialised;

    static REG inputData, outputData, status;

    [[noreturn]] static void writeToConsole();

    [[noreturn]] static void readFromConsole();

    static Buffer<char> *outputBuffer, *inputBuffer;

    static IOEvent *readyToRead, *readyToWrite;
    static KSemaphore *inputItemsAvailable, *outputItemsAvailable;
    static KSemaphore *inputSlotsAvailable, *outputSlotsAvailable;
    static Mutex *mutexPut, *mutexGet;
};

#endif
