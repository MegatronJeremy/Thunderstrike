#ifndef _MEMORYSEGMENTS_HPP
#define _MEMORYSEGMENTS_HPP

#include "../lib/hw.h"

class MemorySegments {
public:
    static size_t getKernelHeapSize();

    static size_t getUserHeapSize();

    static void *getUserHeapStartAddr();

    static void *getUserHeapEndAddr();

    static void *getKernelHeapStartAddr();

    static void *getKernelHeapEndAddr();

private:
    static size_t getHeapSize();
};


#endif
