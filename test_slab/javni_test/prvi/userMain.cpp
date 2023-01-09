#include "../../../h/syscall_c.h"
#include "../../../h/syscall_cpp.hpp"

struct thread_data {
    int id;
};

class ForkThread : public Thread {
public:
    ForkThread(long _id)

    noexcept : Thread(), id(_id), finished(
    false) {}

    virtual void run() {
        printS("Started thread id:");
        printI(id, 10);
        printS("\n");

        ForkThread *thread = new ForkThread(id + 1);
//        printU((uint64) thread, 16);
//        printS("\n");
//

        ForkThread **threads = (ForkThread **) mem_alloc(sizeof(ForkThread *) * id);
//        printU((uint64) threads, 16);
//        printS("\n");

        if (threads != nullptr) {
            for (long i = 0; i < id; i++) {
                threads[i] = new ForkThread(id);
//                printU((uint64) threads[i], 16);
//                printS("\n");
            }

            if (thread != nullptr) {

//                printS("Starting thread id:");
//                printI(id + 1, 10);
//                printS("\n");
//
                if (thread->start() == 0) {

                    for (int i = 0; i < 50000; i++) {
                        for (int j = 0; j < 5000; j++) {

                        }
                        thread_dispatch();
                    }

                    while (!thread->isFinished()) {
                        thread_dispatch();
                    }
                } else {
//                    printS("Failed to start thread id:");
//                    printI(id + 1, 10);
//                    printS("\n");
                }
                delete thread;
            } else {
//                printS("thread id return nullptr:");
//                printI(id + 1, 10);
//                printS("\n");
            }

            for (long i = 0; i < id; i++) {
                delete threads[i];
            }

            mem_free(threads);
        } else {
//            printS("thread id return nullptr for threads creation:");
//            printI(id + 1, 10);
//            printS("\n");
        }

        printS("Finished thread id:");
        printI(id, 10);
        printS("\n");

        finished = true;
    }

    bool isFinished() const {
        return finished;
    }

private:
    long id;
    bool finished;
};


void userMain1() {
    ForkThread thread(1);

    thread.start();

    while (!thread.isFinished()) {
        thread_dispatch();
    }

    printS("User main finished\n");
}