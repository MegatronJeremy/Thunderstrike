#ifndef _syscall_c
#define _syscall_c

#include "../lib/hw.h"

extern void supervisorTrap();

extern void *callSupervisorTrap(uint64 code, void *args);

extern void* mem_alloc(size_t size);

extern int mem_free(void*);

struct _thread;
typedef _thread* thread_t;

extern int thread_create (
        thread_t* handle,
        void(*start_routine)(void*),
        void* arg
);

extern int thread_exit();

extern void thread_dispatch();

struct _thread {
public:
    _thread() = default;
private:
    _thread(void(*body)(void *), void *arg) : id(0), body(body), arg(arg) {};

    uint64 id;

    void (*body)(void *);
    void *arg;
};

struct _sem;
typedef _sem* sem_t;

extern int sem_open (
        sem_t *handle,
        unsigned init
);

extern int sem_close(sem_t handle);

extern int sem_wait(sem_t id);

extern int sem_signal(sem_t id);

struct _sem {
public:
    ~_sem() { sem_close(this); }
private:
    uint64 id;
};

typedef unsigned long time_t;

extern int time_sleep(time_t);

const int EOF = -1;

extern char getc();

extern void putc(char);

#endif