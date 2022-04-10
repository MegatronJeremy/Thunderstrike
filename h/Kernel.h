#ifndef _Kernel_h
#define _Kernel_h

#include "../lib/hw.h"

class KernelSemaphore;

class Kernel {
public:
    static void handleSystemCall();

    static void *mem_alloc(size_t size);

    static int mem_free(void *);

    static int thread_create(uint64 *args);

    static int thread_exit();

    static void thread_dispatch();

    static int sem_open(uint64 *args);

    static int sem_close(KernelSemaphore **handle);

    static int sem_wait(KernelSemaphore **sem);

    static int sem_signal(KernelSemaphore **sem);

    static int time_sleep(time_t);

    static char getc();

    static void putc(char);

private:
    Kernel() = default;

};

#endif
