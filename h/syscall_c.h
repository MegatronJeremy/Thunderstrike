#ifndef _SYSCALL_C
#define _SYSCALL_C

#include "../lib/hw.h"

typedef struct _sem {
} _sem;

typedef struct _thread {
} _thread;

typedef _sem *sem_t;
typedef _thread *thread_t;

typedef unsigned long time_t;

const int EOF = -1;

enum {
    MEM_ALLOC = 0x01, MEM_FREE = 0x02,
    THREAD_CREATE = 0x11, THREAD_EXIT = 0x12, THREAD_DISPATCH = 0x13,
    THREAD_CREATE_SUSPENDED = 0x14, THREAD_START = 0x15,
    SEM_OPEN = 0x21, SEM_CLOSE = 0x22, SEM_WAIT = 0x23, SEM_SIGNAL = 0x24,
    TIME_SLEEP = 0x31,
    GETC = 0x41, PUTC = 0x42,
    PRINT_STRING = 0x43, PRINT_INT = 0x44, PRINT_UNSIGNED = 0x45
};

#ifdef __cplusplus
extern "C" {
#endif

uint64 callSupervisorTrap(uint64 code, uint64 arg);

void *mem_alloc(size_t size);

int mem_free(void *);

int thread_create(
        thread_t *handle,
        void(*start_routine)(void *),
        void *arg
);

int thread_exit();

void thread_dispatch();

int thread_create_suspended(
        thread_t *handle,
        void(*start_routine)(void *),
        void *arg
);

int thread_start(thread_t handle);

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

void printS(char const *string);

void printI(int integer, int base);

void printU(uint64 uint, int base);

#ifdef __cplusplus
}
#endif

#endif