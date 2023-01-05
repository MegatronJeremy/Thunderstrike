#include "../h/syscall_cpp.hpp"

void *operator new(size_t sz) {
    return mem_alloc(sz);
}

void *operator new[](size_t sz) {
    return mem_alloc(sz);
}

void operator delete(void *addr) {
    mem_free(addr);
}

void operator delete[](void *addr) {
    mem_free(addr);
}

Thread::Thread(void (*body)(void *), void *arg) {
    myHandle = nullptr;
    thread_create_suspended(&myHandle, body, arg);
}

Thread::~Thread() = default;

int Thread::start() {
    return thread_start(myHandle);
}

void Thread::dispatch() {
    thread_dispatch();
}

int Thread::sleep(time_t time) {
    return time_sleep(time);
}

Thread::Thread() {
    myHandle = nullptr;
    thread_create_suspended(&myHandle, [](void *obj) {
        ((Thread *) obj)->run();
    }, this);
};

Semaphore::Semaphore(unsigned int init) {
    sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    sem_close(myHandle);
}

int Semaphore::wait() {
    return sem_wait(myHandle);
}

int Semaphore::signal() {
    return sem_signal(myHandle);
}

PeriodicThread::PeriodicThread(time_t period) :
        Thread([](void *arg) {
            auto *args = (uint64 *) arg;
            auto *obj = (PeriodicThread *) args[0];
            auto period = (time_t) args[1];
            delete args;

            while (true) {
                time_sleep(period);
                obj->periodicActivation();
            }
        }, new uint64[2]{(uint64) this, period}) {
}

char Console::getc() {
    return ::getc();
}

void Console::putc(char c) {
    ::putc(c);
}

void Console::print(const char *string) {
    ::printS(string);
}

void Console::print(int integer, int base) {
    ::printI(integer, base);
}

void Console::print(uint64 uint, int base) {
    ::printU(uint, base);
}
