#ifndef _BITMAP_HPP
#define _BITMAP_HPP

#include "../lib/hw.h"

class Bitmap {
public:
    Bitmap(size_t N, void *space);

    bool operator[](size_t pos) const;

    bool test(size_t pos) const;

    bool all() const;

    bool none() const;

    size_t count() const;

    size_t size() const;

    Bitmap &set(size_t pos);

    Bitmap &set();

    Bitmap &reset(size_t pos);

    Bitmap &reset();

    void *operator new(size_t, void *);

    static const uint BYTE_SIZE_BITS = 8;

private:
    static size_t bitCount(size_t v);

    static const size_t bitsPerWord = sizeof(size_t) * BYTE_SIZE_BITS;

    const size_t N;

    const size_t sz = (N - 1) / bitsPerWord + 1;

    size_t *array;
};

#endif
