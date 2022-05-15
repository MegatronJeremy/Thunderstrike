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

Thread::Thread(Body body, void *arg) : body(body), arg(arg) {
}

Thread::~Thread() {
    delete myHandle;
    myHandle = nullptr;
}

int Thread::start() {
    return thread_create(&myHandle, body, arg);
}

void Thread::dispatch() {
    thread_dispatch();
}

int Thread::sleep(time_t time) {
    return time_sleep(time);
}

Thread::Thread() {
    body = [](void *arg) { ((Thread *) arg)->run(); };
    arg = this;
};

Semaphore::Semaphore(unsigned int init) {
    sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    sem_close(myHandle);
    delete myHandle;
    myHandle = nullptr;
}

int Semaphore::wait() {
    return sem_wait(myHandle);
}

int Semaphore::signal() {
    return sem_signal(myHandle);
}

PeriodicThread::PeriodicThread(time_t period) : period(period) {
}

[[noreturn]] void PeriodicThread::run() {
    while (true) {
        sleep(period);
        periodicActivation();
    }
}

char Console::getc() {
    return ::getc();
}

void Console::putc(char c) {
    ::putc(c);
}
