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

    kernelProducer = TCB::createKernelThread([](void *) {
        KernelConsole::readFromConsole();
    }, nullptr);
    kernelConsumer = TCB::createKernelThread([](void *) {
        KernelConsole::writeToConsole();
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
    if (*status & CONSOLE_TX_STATUS_BIT) {
        getInstance()->readyToWrite.signal();
    }
    if (*status & CONSOLE_RX_STATUS_BIT) {
        getInstance()->readyToRead.signal();
    }
}

[[noreturn]] void KernelConsole::writeToConsole() {
    while (true) {
        getInstance()->readyToWrite.wait();
        while (*status & CONSOLE_TX_STATUS_BIT) {
            char chr = getInstance()->outputBuffer.removeFirst();
            while (!(*status & CONSOLE_TX_STATUS_BIT));
            *outputData = chr;
        }
    }
}

[[noreturn]] void KernelConsole::readFromConsole() {
    while (true) {
        getInstance()->readyToRead.wait();
        while (*status & CONSOLE_RX_STATUS_BIT) {
            while (!(*status & CONSOLE_RX_STATUS_BIT));
            char chr = *inputData;
            getInstance()->inputBuffer.addLast(chr);
        }
    }
}

KernelConsole::~KernelConsole() {
    delete kernelProducer;
    delete kernelConsumer;
    delete instance;
    instance = nullptr;
    kernelProducer = nullptr;
    kernelConsumer = nullptr;
}
