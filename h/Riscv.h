//
// Created by xparh on 4/24/2022.
//

#ifndef OS1_VEZBE07_RISCV_CONTEXT_SWITCH_1_SYNCHRONOUS_RISCV_H
#define OS1_VEZBE07_RISCV_CONTEXT_SWITCH_1_SYNCHRONOUS_RISCV_H

#include "../lib/hw.h"

#define lock()                  \
    volatile uint64 sstatus = Riscv::r_sstatus(); \
    Riscv::disableInterrupts(); \

#define unlock()                \
    Riscv::w_sstatus(sstatus);  \


class Riscv {
public:

    // disables interrupts
    static void disableInterrupts();

    // enables interrupts
    static void enableInterrupts();

    // pop sstatus.spp and sstatus.spie bits (has to be a non inline function)
    static void popSppSpie();

    // push x3..x31 registers on stack
//    static void pushRegisters();

    // pop x3..x31 registers on stack
//    static void popRegisters();

    // push a0 on saved contex
    static void pushRegisterA0(uint64 context);

    // push a1 on saved contex
    static void pushRegisterA1(uint64 context);

    // read register sp
    static uint64 r_sp();

    // write register sp
    static void w_sp(uint64 sp);

    // read old frame pointer
    static uint64 r_ps0();

    // read frame pointer
    static uint64 r_s0();

    // read register a0
    static uint64 r_a0();

    // write register a0
    static void w_a0(uint64 a0);

    // read register a1
    static uint64 r_a1();

    // write register a1
    static void w_a1(uint64 a1);

    // read register a2
    static uint64 r_a2();

    // write register a2
    static void w_a2(uint64 a2);

    // read register scause
    static uint64 r_scause();

    // write register scause
    static void w_scause(uint64 scause);

    // read register sepc
    static uint64 r_sepc();

    // write register sepc
    static void w_sepc(uint64 sepc);

    // read register stvec
    static uint64 r_stvec();

    // write register stvec
    static void w_stvec(uint64 stvec);

    // read register stval
    static uint64 r_stval();

    // write register stval
    static void w_stval(uint64 stval);

    enum BitMaskSip {
        SIP_SSIP = (1 << 1),
        SIP_STIP = (1 << 5),
        SIP_SEIP = (1 << 9)
    };

    // mask set register sip
    static void ms_sip(uint64 mask);

    // mask clear register sip
    static void mc_sip(uint64 mask);

    // read register sip
    static uint64 r_sip();

    // write register sip
    static void w_sip(uint64 sip);

    enum BitMaskSstatus {
        SSTATUS_SIE = (1 << 1),
        SSTATUS_SPIE = (1 << 5),
        SSTATUS_SPP = (1 << 8)
    };

    // mask set register sstatus
    static void ms_sstatus(uint64 mask);

    // mask clear register sstatus
    static void mc_sstatus(uint64 mask);

    // read register sstatus
    static uint64 r_sstatus();

    // write register sstatus
    static void w_sstatus(uint64 sstatus);

    // supervisor trap
    static void supervisorTrap();

private:
    // supervisor trap handler
    static void handleSupervisorTrap();
};


inline uint64 Riscv::r_sp() {
    uint64 volatile sp;
    __asm__ volatile ("mv %[sp], sp" : [sp] "=r"(sp));
    return sp;
}

inline void Riscv::w_sp(uint64 sp) {
    __asm__ volatile ("mv sp, %[sp]" : : [sp] "r"(sp));
}

inline uint64 Riscv::r_ps0() {
    uint64 volatile ps0, s0 = r_s0() - 8;
    __asm__ volatile ("mv %[ps0], %[s0]" : [ps0] "=r"(ps0) : [s0] "r"(s0));
    return ps0;
}

inline uint64 Riscv::r_s0() {
    uint64 volatile s0;
    __asm__ volatile ("mv %[s0], s0" : [s0] "=r"(s0));
    return s0;
}

inline uint64 Riscv::r_a0() {
    uint64 volatile a0;
    __asm__ volatile ("mv %[a0], a0" : [a0] "=r"(a0));
    return a0;
}

inline void Riscv::w_a0(uint64 a0) {
    __asm__ volatile ("mv a0, %[a0]" : : [a0] "r"(a0));
}

inline uint64 Riscv::r_a1() {
    uint64 volatile a1;
    __asm__ volatile ("mv %[a1], a1" : [a1] "=r"(a1));
    return a1;
}

inline void Riscv::w_a1(uint64 a1) {
    __asm__ volatile ("mv a1, %[a1]" : : [a1] "r"(a1));
}

inline uint64 Riscv::r_a2() {
    uint64 volatile a2;
    __asm__ volatile ("mv %[a2], a2" : [a2] "=r"(a2));
    return a2;
}

inline void Riscv::w_a2(uint64 a2) {
    __asm__ volatile ("mv a2, %[a2]" : : [a2] "r"(a2));
}

inline uint64 Riscv::r_scause() {
    uint64 volatile scause;
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    return scause;
}

inline void Riscv::w_scause(uint64 scause) {
    __asm__ volatile ("csrw scause, %[scause]" : : [scause] "r"(scause));
}

inline uint64 Riscv::r_sepc() {
    uint64 volatile sepc;
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    return sepc;
}

inline void Riscv::w_sepc(uint64 sepc) {
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
}

inline uint64 Riscv::r_stvec() {
    uint64 volatile stvec;
    __asm__ volatile ("csrr %[stvec], stvec" : [stvec] "=r"(stvec));
    return stvec;
}

inline void Riscv::w_stvec(uint64 stvec) {
    __asm__ volatile ("csrw stvec, %[stvec]" : : [stvec] "r"(stvec));
}

inline uint64 Riscv::r_stval() {
    uint64 volatile stval;
    __asm__ volatile ("csrr %[stval], stval" : [stval] "=r"(stval));
    return stval;
}

inline void Riscv::w_stval(uint64 stval) {
    __asm__ volatile ("csrw stval, %[stval]" : : [stval] "r"(stval));
}

inline void Riscv::ms_sip(uint64 mask) {
    __asm__ volatile ("csrs sip, %[mask]" : : [mask] "r"(mask));
}

inline void Riscv::mc_sip(uint64 mask) {
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
}

inline uint64 Riscv::r_sip() {
    uint64 volatile sip;
    __asm__ volatile ("csrr %[sip], sip" : [sip] "=r"(sip));
    return sip;
}

inline void Riscv::w_sip(uint64 sip) {
    __asm__ volatile ("csrw sip, %[sip]" : : [sip] "r"(sip));
}

inline void Riscv::ms_sstatus(uint64 mask) {
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
}

inline void Riscv::mc_sstatus(uint64 mask) {
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
}

inline uint64 Riscv::r_sstatus() {
    uint64 volatile sstatus;
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    return sstatus;
}

inline void Riscv::w_sstatus(uint64 sstatus) {
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
}

inline void Riscv::disableInterrupts() {
    mc_sstatus(SSTATUS_SIE);
}

inline void Riscv::enableInterrupts() {
    ms_sstatus(SSTATUS_SIE);
}

inline void Riscv::pushRegisterA0(uint64 context) {
    __asm__ volatile ("sd a0, 10 * 8(%[context])" : : [context] "r"(context));
}

inline void Riscv::pushRegisterA1(uint64 context) {
    __asm__ volatile ("sd a1, 11 * 8(%[context])" : : [context] "r"(context));
}

#endif //OS1_VEZBE07_RISCV_CONTEXT_SWITCH_1_SYNCHRONOUS_RISCV_H
