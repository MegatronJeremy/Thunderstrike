//
// Created by xparh on 4/24/2022.
//

#ifndef OS1_VEZBE07_RISCV_CONTEXT_SWITCH_1_SYNCHRONOUS_PRINT_H
#define OS1_VEZBE07_RISCV_CONTEXT_SWITCH_1_SYNCHRONOUS_PRINT_H

#include "../lib/hw.h"

extern void kprintString(char const *string);

extern void kprintInteger(int integer);

extern void kprintUnsigned(uint64 uint);

#endif //OS1_VEZBE07_RISCV_CONTEXT_SWITCH_1_SYNCHRONOUS_PRINT_H
