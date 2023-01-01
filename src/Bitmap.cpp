#include "../h/Bitmap.hpp"

Bitmap::Bitmap(size_t N, void *space) : N(N) {
    array = (size_t *) ((uint8 *) space + sizeof(Bitmap));
}

bool Bitmap::operator[](size_t pos) const {
    size_t ind = pos / bitsPerWord;
    if (ind >= sz) return false;

    size_t bit = pos % bitsPerWord;
    return array[ind] & (1ULL << bit);
}

bool Bitmap::test(size_t pos) const {
    return (*this)[pos];
}

Bitmap &Bitmap::set(size_t pos) {
    size_t ind = pos / bitsPerWord;
    if (ind >= sz) return *this;

    size_t bit = pos % bitsPerWord;
    array[ind] |= (1ULL << bit);

    return *this;
}

Bitmap &Bitmap::reset(size_t pos) {
    size_t ind = pos / bitsPerWord;
    if (ind >= sz) return *this;

    size_t bit = pos % bitsPerWord;
    array[ind] &= ~(1ULL << bit);

    return *this;
}

bool Bitmap::all() const {
    size_t testVal = ~0ULL;

    for (size_t i = 0; i < sz; i++) {
        if ((array[i] & testVal) != testVal)
            return false;
    }

    return true;
}

bool Bitmap::none() const {
    uint testVal = 0ULL;

    for (size_t i = 0; i < sz; i++) {
        if ((array[i] | testVal) != testVal)
            return false;
    }

    return true;
}

size_t Bitmap::bitCount(size_t v) {
    size_t c;

    c = v - ((v >> 1) & 0x5555555555555555);
    c = ((c >> 2) & 0x3333333333333333) + (c & 0x3333333333333333);
    c = ((c >> 4) + c) & 0x0F0F0F0F0F0F0F0F;
    c = ((c >> 8) + c) & 0x00FF00FF00FF00FF;
    c = ((c >> 16) + c) & 0x0000FFFF0000FFFF;
    c = ((c >> 32) + c) & 0x00000000FFFFFFFF;

    return c;
}

size_t Bitmap::count() const {
    size_t c = 0;
    for (size_t i = 0; i < sz; i++) {
        c += bitCount(array[i]);
    }
    return c;
}

size_t Bitmap::size() const {
    return sz * bitsPerWord;
}

Bitmap &Bitmap::set() {
    for (size_t i = 0; i < sz; i++) {
        array[i] = ~0ULL;
    }

    return *this;
}

Bitmap &Bitmap::reset() {
    for (size_t i = 0; i < sz; i++) {
        array[i] = 0ULL;
    }

    return *this;
}

void *Bitmap::operator new(size_t, void *addr) {
    return addr;
}


