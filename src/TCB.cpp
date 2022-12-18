#include "../h/TCB.hpp"
#include "../h/Riscv.hpp"
#include "../h/ThreadCollector.hpp"
#include "../h/Scheduler.hpp"
#include "../h/IdleThread.hpp"
#include "../h/syscall_c.h"

TCB *TCB::running = nullptr;

TCB *TCB::userMain = nullptr;

uint64 TCB::ID = 0;

uint64 TCB::offsSSP = OFFSETOF(TCB, ssp);

uint64 TCB::timeSliceCounter = 0;

size_t TCB::stackByteSize = DEFAULT_STACK_SIZE * sizeof(uint64);

kmem_cache_t *TCB::tcbCache = nullptr;

TCB *TCB::createTCB() {
    TCB *tcb = (TCB *) kmem_cache_alloc(tcbCache);
    if (!tcb) {
        // try to shrink cache if no memory
        kmem_cache_shrink(tcbCache);
        tcb = (TCB *) kmem_cache_alloc(tcbCache);
    }
    return tcb;
}

void TCB::initTCB(TCB::Body body, void *args, uint64 *threadStack, bool privileged, Type type) {
    this->body = body;

    this->args = args;

    this->threadStack = threadStack;

    this->privileged = privileged;

    this->type = type;

    context = {(uint64) threadWrapper, (uint64) (threadStack + DEFAULT_STACK_SIZE)};

    status = WAITING;
}

void TCB::defaultCtor() {
    id = ID++;

    body = nullptr;
    args = nullptr;

    threadStack = nullptr;

    kernelStack = (uint64 *) kmalloc(stackByteSize);

    privileged = true;

    context = {0, 0};

    priority = 1;

    status = READY;

    waitingToJoin = new LinkedList<TCB>;

    mutex = new Mutex;

    ssp = (uint64) (kernelStack + DEFAULT_STACK_SIZE);

    type = KERNEL;

    listNode = new ListNode<TCB>(this);

    hashNode = new LinkedHashNode<TCB>(this, id);
}

void TCB::defaultDtor() {
    mfree(threadStack);
    kfree(kernelStack);

    delete listNode;
    delete hashNode;
}

TCB *TCB::createKernelThread() {
    return createTCB();
}

TCB *TCB::createThread(TCB::Body body, void *args, Type type, bool start) {
    if (!body) return nullptr;
    auto *threadStack = (uint64 *) mmalloc(byteToBlocks(stackByteSize));
    return createThread(body, args, threadStack, type, start);
}

TCB *TCB::createThread(TCB::Body body, void *args, uint64 *threadStack, Type type, bool start) {
    if (!body) return nullptr;

    bool prMode;
    switch (type) {
        case (KERNEL):
        case (CONSOLE):
            prMode = true;
            break;
        case (USER):
            prMode = false;
            break;
        default:
            // invalid thread type
            // mfree(threadStack)
            return nullptr;
    }

    if (!tcbCache)
        tcbCache = kmem_cache_create("tcb", sizeof(TCB),
                                     [](void *obj) {
                                         ((TCB *) obj)->defaultCtor();
                                     },
                                     [](void *obj) {
                                         ((TCB *) obj)->defaultDtor();
                                     });

    TCB *tcb = createTCB();
    if (!tcb) return nullptr;

    tcb->initTCB(body, args, threadStack, prMode, type);

    if (start) TCB::start(tcb);

    return tcb;
}

void TCB::deleteTCB(void *obj) {
    kmem_cache_free(tcbCache, obj);
}

int TCB::start(TCB *tcb) {
    if (!tcb->isWaiting()) return -1;

    tcb->setReady();
    Scheduler::put(tcb);

    return 0;
}

void TCB::exit() {
    DummyMutex dummy(running->mutex);

    running->setFinished();

    while (!running->waitingToJoin->isEmpty()) {
        TCB *thr = running->waitingToJoin->removeFirst();
        thr->setReady();
        Scheduler::put(thr);
    }

    ThreadCollector::put(running);

    dispatch();
}

void TCB::dispatch(bool wasBlocked) {
    lock()
    TCB *old = running;

    if (old->isReady()) {
        Scheduler::put(old, wasBlocked);
    }

    running = Scheduler::get();

    if (!running) {
        running = IdleThread::getIdleThread();
    }

    TCB::timeSliceCounter = 0;

    TCB::contextSwitch(&old->context, &running->context);

    unlock()
}

void TCB::threadWrapper() {
    Riscv::popSppSpie(running->privileged);
    running->body(running->args);

    thread_exit();
}

int TCB::join() {
    DummyMutex dummy(mutex);

    if (isFinished()) {
        return 0;
    }

    running->setBlocked();
    waitingToJoin->addLast(running->listNode);

    return 0;
}

