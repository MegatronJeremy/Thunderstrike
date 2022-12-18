#ifndef _DUMMYMUTEX_HPP
#define _DUMMYMUTEX_HPP

#include "../h/Mutex.hpp"

class DummyMutex {
public:
    DummyMutex(Mutex *m) : mutex(m) { if (mutex) mutex->wait(); }

    ~DummyMutex() { if (mutex) mutex->signal(); }

private:
    Mutex *mutex;
};

#endif
