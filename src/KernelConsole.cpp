#include "../h/KernelConsole.h"
#include "../h/TCB.h"

reg KernelConsole::outputData = nullptr;
reg KernelConsole::inputData = nullptr;
reg KernelConsole::status = nullptr;

KernelConsole::KernelConsole() :
        readyToRead(0),
        readyToWrite(0),
        inputItemsAvailable(0), outputItemsAvailable(0),
        inputSlotsAvailable(DEFAULT_BUFFER_SIZE), outputSlotsAvailable(DEFAULT_BUFFER_SIZE) {

    outputData = (reg) CONSOLE_TX_DATA;
    inputData = (reg) CONSOLE_RX_DATA;
    status = (reg) CONSOLE_STATUS;

    kernelConsumer = TCB::createKernelThread([](void *) {
        KernelConsole::getInstance()->writeToConsole();
    }, nullptr);
    kernelProducer = TCB::createKernelThread([](void *) {
        KernelConsole::getInstance()->readFromConsole();
    }, nullptr);
}

KernelConsole *KernelConsole::getInstance() {
    static auto *instance = new KernelConsole;
    return instance;
}

void KernelConsole::putc(char chr) {
    outputSlotsAvailable.wait();
    mutexPut.wait();
    outputBuffer.addLast(chr);
    mutexPut.signal();
    outputItemsAvailable.signal();
}

char KernelConsole::getc() {
    inputItemsAvailable.wait();
    mutexGet.wait();
    char c = inputBuffer.removeFirst();
    mutexGet.signal();
    inputSlotsAvailable.signal();
    return c;
}

void KernelConsole::consoleHandler() {
    if (*status & CONSOLE_RX_STATUS_BIT) {
        readyToRead.signal();
    }
    if (*status & CONSOLE_TX_STATUS_BIT) {
        readyToWrite.signal();
    }
}

[[noreturn]] void KernelConsole::readFromConsole() {
    while (true) {
        readyToRead.wait();
        while (*status & CONSOLE_RX_STATUS_BIT) {
            inputSlotsAvailable.wait();
            inputBuffer.addLast(*inputData);
            inputItemsAvailable.signal();
        }
    }
}

[[noreturn]] void KernelConsole::writeToConsole() {
    while (true) {
        readyToWrite.wait();
        while (*status & CONSOLE_TX_STATUS_BIT) {
            outputItemsAvailable.wait();
            *outputData = outputBuffer.removeFirst();
            outputSlotsAvailable.signal();
        }
    }
}

KernelConsole::~KernelConsole() {
    delete kernelProducer;
    delete kernelConsumer;
}

