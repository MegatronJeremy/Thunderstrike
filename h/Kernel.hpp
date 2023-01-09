#ifndef _KERNEL_HPP
#define _KERNEL_HPP

#include "../lib/hw.h"

// Kernel system call handler
class Kernel {
public:
    static void handleSystemCall();

    static void *mem_alloc(size_t size);

    static int mem_free(void *);

    static int thread_create(uint64 *args);

    static int thread_exit();

    static void thread_dispatch();

    static int thread_create_suspended(uint64 *args);

    static int thread_start(uint64 id);

    static int thread_destroy(uint64 id);

    static int sem_open(uint64 *args);

    static int sem_close(uint64 id);

    static int sem_wait(uint64 id);

    static int sem_signal(uint64 id);

    static int time_sleep(time_t);

    static char getc();

    static void putc(char);

    static void print(char const *string);

    static void print(int integer, int base = 10);

    static void print(uint64 uint, int base = 10);

private:
    Kernel() = default;

};

#endif
