.align 4
.global _ZN3TCB13contextSwitchEPA32_mS1_
.type _ZN3TCB13contextSwitchEPA32_mS1_, @function
_ZN3TCB13contextSwitchEPA32_mS1_:
    # a0    &old->context
    # a1    &running->context

    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(a0)
    .endr

    # x11 is a1 - load it last

    .irp index, 0,1,2,3,4,5,6,7,8,9,10,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(a1)
    .endr

    ld x11, 11 * 8(a1)

    ret
