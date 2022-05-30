#include "../h/KConsole.hpp"
#include "../h/TCB.hpp"

reg KConsole::outputData = nullptr;
reg KConsole::inputData = nullptr;
reg KConsole::status = nullptr;

KConsole::KConsole() :
        readyToRead(0),
        readyToWrite(0),
        inputItemsAvailable(0), outputItemsAvailable(0),
        inputSlotsAvailable(DEFAULT_BUFFER_SIZE), outputSlotsAvailable(DEFAULT_BUFFER_SIZE) {

    outputData = (reg) CONSOLE_TX_DATA;
    inputData = (reg) CONSOLE_RX_DATA;
    status = (reg) CONSOLE_STATUS;

    kernelProducer = TCB::createKernelThread([](void *) {
        KConsole::getInstance()->readFromConsole();
    }, nullptr);
    kernelConsumer = TCB::createKernelThread([](void *) {
        KConsole::getInstance()->writeToConsole();
    }, nullptr);
}

KConsole *KConsole::getInstance() {
    static auto *instance = new KConsole;
    return instance;
}

void KConsole::putc(char chr) {
    outputSlotsAvailable.wait();
    mutexPut.wait();
    outputBuffer.addLast(chr);
    mutexPut.signal();
    outputItemsAvailable.signal();
}

char KConsole::getc() {
    inputItemsAvailable.wait();
    mutexGet.wait();
    char c = inputBuffer.removeFirst();
    mutexGet.signal();
    inputSlotsAvailable.signal();
    return c;
}

void KConsole::consoleHandler() {
    readyToRead.signal();
    readyToWrite.signal();
}

void KConsole::readFromConsole() {
    while (true) {
        readyToRead.wait();
        while (*status & CONSOLE_RX_STATUS_BIT) {
            inputSlotsAvailable.wait();
            inputBuffer.addLast(*inputData);
            inputItemsAvailable.signal();
        }
    }
}

void KConsole::writeToConsole() {
    while (true) {
        readyToWrite.wait();
        while (*status & CONSOLE_TX_STATUS_BIT) {
            outputItemsAvailable.wait();
            *outputData = outputBuffer.removeFirst();
            outputSlotsAvailable.signal();
        }
    }
}

KConsole::~KConsole() {
    delete kernelProducer;
    delete kernelConsumer;
}

