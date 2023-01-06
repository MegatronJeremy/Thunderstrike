#include "../h/Math.h"

int Math::ceilLogBase2(size_t x) {
    static const size_t t[6] = {
            0xFFFFFFFF00000000ULL, // at least base 32
            0x00000000FFFF0000ULL, // at least base 16
            0x000000000000FF00ULL, // at least base 8
            0x00000000000000F0ULL, // at least base 4
            0x000000000000000CULL, // at least base 2
            0x0000000000000002ULL // at least base 1
    };

    // if already a power of two, no need to add ceiling value
    int y = (((x & (x - 1)) == 0) ? 0 : 1);

    int j = 32;
    int i;

    // shift down through all table values if an upper value is hit
    for (i = 0; i < 6; i++) {
        int k = (((x & t[i]) == 0) ? 0 : j);
        y += k;
        x >>= k;
        j >>= 1;
    }

    return y;
}