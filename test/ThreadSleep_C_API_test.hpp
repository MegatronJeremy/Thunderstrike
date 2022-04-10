//
// Created by os on 4/17/22.
//

#ifndef XV6_THREADSLEEP_C_API_TEST_HPP
#define XV6_THREADSLEEP_C_API_TEST_HPP

#include "../h/syscall_c.h"

#include "printing.hpp"

bool finished[2];

void sleepyRun(void *arg) {
    time_t sleep_time = *((time_t *) arg);
    int i = 6;
    while (--i > 0) {

        printString("Hello ");
        printInt(sleep_time);
        printString(" !\n");
        time_sleep(sleep_time);
    }
    finished[sleep_time/10-1] = true;
}

void testSleeping() {
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    thread_t sleepyThread[sleepy_thread_count];

    for (int i = 0; i < sleepy_thread_count; i++) {
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    }

    while (!(finished[0] && finished[1])) {}
}

#endif //XV6_THREADSLEEP_C_API_TEST_HPP
