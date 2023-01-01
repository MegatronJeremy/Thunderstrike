#ifndef _MEMORYSEGMENTS_HPP
#define _MEMORYSEGMENTS_HPP

#include "../lib/hw.h"

namespace MemorySegments {
    size_t getKernelHeapSize();

    size_t getUserHeapSize();

    void *getUserHeapStartAddr();

    void *getUserHeapEndAddr();

    void *getKernelHeapStartAddr();

    void *getKernelHeapEndAddr();

    size_t getHeapSize();

    size_t bytesToPages(size_t size);
};


#endif
