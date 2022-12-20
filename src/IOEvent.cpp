#include "../h/IOEvent.hpp"
#include "../h/Riscv.hpp"
#include "../h/TCB.hpp"

IOEvent *IOEvent::createIOEvent(int val) {
    IOEvent *obj = KObject<IOEvent>::createObj();

    if (val < 0) val = 0;
    if (val > 1) val = 1;
    obj->val = val;

    return obj;
}

int IOEvent::wait() {
    lock()
    if (val == 0) block();
    val = 0;
    if (TCB::running->isInterrupted()) {
        TCB::running->setReady();
        unlock()
        return -1;
    }
    unlock()

    return 0;
}

int IOEvent::signal() {
    lock()
    if (val == 1) {
        unlock();
        return -1;
    }
    if (blockedThreadQueue.isEmpty())
        val = 1;
    else
        deblock();
    unlock()
    return 0;
}

