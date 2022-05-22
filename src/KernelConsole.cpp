#include "../h/KernelConsole.h"
#include "../h/TCB.h"

KernelConsole *KernelConsole::instance = nullptr;

reg KernelConsole::outputData = nullptr;
reg KernelConsole::inputData = nullptr;
reg KernelConsole::status = nullptr;

KernelConsole::KernelConsole() :
        readyToRead(0),
        readyToWrite(0) {

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
    if (!instance) instance = new KernelConsole;
    return instance;
}

void KernelConsole::putc(char chr) {
    getInstance()->outputBuffer.addLast(chr);
}

char KernelConsole::getc() {
    return getInstance()->inputBuffer.removeFirst();
}

void KernelConsole::consoleHandler() {
    if (*status & CONSOLE_RX_STATUS_BIT) {
        getInstance()->readyToRead.signal();
    }
    if (*status & CONSOLE_TX_STATUS_BIT) {
        getInstance()->readyToWrite.signal();
    }
}

[[noreturn]] void KernelConsole::writeToConsole() {
    while (true) {
        readyToWrite.wait();
        while (*status & CONSOLE_TX_STATUS_BIT) {
            char chr = outputBuffer.removeFirst();
            *outputData = chr;
        }
    }
}

[[noreturn]] void KernelConsole::readFromConsole() {
    while (true) {
        readyToRead.wait();
        while (*status & CONSOLE_RX_STATUS_BIT) {
            char chr = *inputData;
            inputBuffer.addLast(chr);
        }
    }
}

KernelConsole::~KernelConsole() {
    delete kernelProducer;
    delete kernelConsumer;
    delete instance;
}

