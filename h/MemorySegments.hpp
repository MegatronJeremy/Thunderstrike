#ifndef _MEMORYSEGMENTS_HPP
#define _MEMORYSEGMENTS_HPP

#include "../lib/hw.h"

class MemorySegments {
public:
    static size_t getKernelHeapSize();

    static size_t getUserHeapSize();

    static const void *getUserHeapStartAddr();

    static const void *getUserHeapEndAddr();

    static const void *getKernelHeapStartAddr();

    static const void *getKernelHeapEndAddr();

private:
    static size_t getHeapSize();
};


#endif
