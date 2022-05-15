#ifndef _SYSCALL_C
#define _SYSCALL_C

#include "../lib/hw.h"

typedef struct _sem {
} _sem;

typedef struct _thread {
} _thread;

typedef _sem* sem_t;
typedef _thread* thread_t;

typedef unsigned long time_t;

const int EOF = -1;

#ifdef __cplusplus
extern "C" {
#endif

void *callSupervisorTrap(uint64 code, void *args);

void *mem_alloc(size_t size);

int mem_free(void *);

int thread_create(
        thread_t *handle,
        void(*start_routine)(void *),
        void *arg
);

int thread_exit();

void thread_dispatch();

int sem_open(
        sem_t *handle,
        unsigned init
);

int sem_close(sem_t handle);

int sem_wait(sem_t id);

int sem_signal(sem_t id);

int time_sleep(time_t);

char getc();

void putc(char);

#ifdef __cplusplus
}
#endif

#endif