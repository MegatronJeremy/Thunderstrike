.extern _ZN5Riscv20handleSupervisorTrapEv
.extern _ZN3TCB7runningE

.align 4
.global _ZN5Riscv14supervisorTrapEv
.type _ZN5Riscv14supervisorTrapEv, @function
_ZN5Riscv14supervisorTrapEv:

    sd t0, -1 * 8(sp)
    mv t0, sp

    csrw sscratch, a0
    ld a0, _ZN3TCB7runningE
    ld sp, 0(a0)
    sd t0, 0(a0)
    csrr a0, sscratch

    ld t0, -1 * 8(t0)

    addi sp, sp, -256
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr

    call _ZN5Riscv20handleSupervisorTrapEv

    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    addi sp, sp, 256

    sd t0, -1 * 8(sp)
    mv t0, sp

    csrw sscratch, a0
    ld a0, _ZN3TCB7runningE
    ld sp, 0(a0)
    sd t0, 0(a0)
    csrr a0, sscratch

    ld t0, -1 * 8(t0)

    sret