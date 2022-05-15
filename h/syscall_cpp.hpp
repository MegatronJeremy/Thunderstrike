#ifndef _SYSCALL_CPP
#define _SYSCALL_CPP

#include "syscall_c.h"

void* operator new(size_t);
void* operator new[](size_t);
void operator delete(void *);
void operator delete[](void *);

class Thread {
public:
    using Body = void (*)(void *);

    Thread(Body body, void *arg);

    virtual ~Thread();

    int start();

    static void dispatch();

    static int sleep(time_t time);

protected:
    Thread();

    virtual void run() {}

private:
    thread_t  myHandle = nullptr;
    Body body;
    void *arg;

};

class Semaphore {
public:
    Semaphore(unsigned init = 1);

    virtual ~Semaphore();

    int wait();

    int signal();

private:
    sem_t myHandle = nullptr;
};

class PeriodicThread : public Thread {
protected:
    PeriodicThread(time_t period);

    virtual void periodicActivation() {}

private:
    [[noreturn]] void run() override;

    time_t period;
};

class Console {
public:
    static char getc();

    static void putc(char);
};

#endif
