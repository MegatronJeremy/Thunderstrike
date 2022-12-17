#include "../h/KConsole.hpp"
#include "../h/TCB.hpp"

bool KConsole::initialised = false;

REG KConsole::outputData = nullptr;
REG KConsole::inputData = nullptr;
REG KConsole::status = nullptr;

Buffer<char> *KConsole::outputBuffer;
Buffer<char> *KConsole::inputBuffer;

IOEvent *KConsole::readyToRead;
IOEvent *KConsole::readyToWrite;

KSemaphore *KConsole::inputItemsAvailable;
KSemaphore *KConsole::outputItemsAvailable;
KSemaphore *KConsole::inputSlotsAvailable;
KSemaphore *KConsole::outputSlotsAvailable;

Mutex *KConsole::mutexGet;
Mutex *KConsole::mutexPut;

void KConsole::initKConsole() {
    if (initialised) return;

    initialised = true;

    outputData = (REG) CONSOLE_TX_DATA;
    inputData = (REG) CONSOLE_RX_DATA;
    status = (REG) CONSOLE_STATUS;

    outputBuffer = new Buffer<char>;
    inputBuffer = new Buffer<char>;

    readyToRead = new IOEvent(0);
    readyToWrite = new IOEvent(0);

    inputItemsAvailable = new KSemaphore(0);
    outputItemsAvailable = new KSemaphore(0);
    inputSlotsAvailable = new KSemaphore(DEFAULT_BUFFER_SIZE);
    outputSlotsAvailable = new KSemaphore(DEFAULT_BUFFER_SIZE);

    mutexGet = new Mutex;
    mutexPut = new Mutex;

    TCB::createThread([](void *) {
        KConsole::readFromConsole();
    }, nullptr, TCB::CONSOLE);

    TCB::createThread([](void *) {
        KConsole::writeToConsole();
    }, nullptr, TCB::CONSOLE);
}

void KConsole::putc(char chr) {
    outputSlotsAvailable->wait();
    mutexPut->wait();
    outputBuffer->addLast(chr);
    mutexPut->signal();
    outputItemsAvailable->signal();
}

char KConsole::getc() {
    inputItemsAvailable->wait();
    mutexGet->wait();
    char c = inputBuffer->removeFirst();
    mutexGet->signal();
    inputSlotsAvailable->signal();
    return c;
}

void KConsole::consoleHandler() {
    readyToRead->signal();
    readyToWrite->signal();
}

void KConsole::readFromConsole() {
    while (true) {
        readyToRead->wait();
        while (*status & CONSOLE_RX_STATUS_BIT) {
            inputSlotsAvailable->wait();
            inputBuffer->addLast(*inputData);
            inputItemsAvailable->signal();
        }
    }
}

void KConsole::writeToConsole() {
    while (true) {
        readyToWrite->wait();
        while (*status & CONSOLE_TX_STATUS_BIT) {
            outputItemsAvailable->wait();
            *outputData = outputBuffer->removeFirst();
            outputSlotsAvailable->signal();
        }
    }
}