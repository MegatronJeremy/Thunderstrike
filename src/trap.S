.extern handleSupervisorTrap
.global supervisorTrap
.align 4
supervisorTrap:
    addi sp, sp, -8
    sd ra, 0x00(sp)

    call handleSupervisorTrap

    ld ra, 0x00(sp)
    addi sp, sp, 8

    csrr t0, sepc
    addi t0, t0, 4
    csrw sepc, t0

    sret