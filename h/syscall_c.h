#ifndef _SYSCALL_C
#define _SYSCALL_C

#include "../lib/hw.h"

void supervisorTrap();

void *callSupervisorTrap(uint64 code, void *args);

void* mem_alloc(size_t size);

int mem_free(void*);

struct _thread {
public:
    _thread() = default;
private:
    using Body = void(*)(void *);
    _thread(Body body, void *arg);

    uint64 id;

    Body body;
    void *arg;
};
typedef _thread* thread_t;

int thread_create (
        thread_t* handle,
        void(*start_routine)(void*),
        void* arg
);

int thread_exit();

void thread_dispatch();

struct _sem {
public:
    ~_sem();
private:
    uint64 id;
};
typedef _sem* sem_t;

int sem_open (
        sem_t *handle,
        unsigned init
);

int sem_close(sem_t handle);

int sem_wait(sem_t id);

int sem_signal(sem_t id);

typedef unsigned long time_t;

int time_sleep(time_t);

const int EOF = -1;

char getc();

void putc(char);

#endif