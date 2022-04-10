//
// Created by xparh on 4/24/2022.
//

#include "../h/Riscv.h"
#include "../lib/console.h"
#include "../h/SysPrint.h"
#include "../h/TCB.h"
#include "../h/Kernel.h"
#include "../h/TimerInterrupt.h"

void Riscv::popSppSpie() {
    mc_sstatus(SSTATUS_SPP);
    ms_sstatus(SSTATUS_SPIE);
    __asm__ volatile ("csrw sepc, ra");
    __asm__ volatile ("sret");
}

void Riscv::handleSupervisorTrap() {
    uint64 scause = r_scause();
    switch (scause) {
        case 0x0000000000000008UL: {
            // interrupt: no, cause code: environment call from U-mode (8)
            volatile uint64 sepc = r_sepc() + 4;
            volatile uint64 sstatus = r_sstatus();

            Riscv::enableInterrupts();

            Kernel::handleSystemCall();

            Riscv::disableInterrupts();

            w_sstatus(sstatus);
            w_sepc(sepc);
            break;
        }
        case 0x0000000000000009UL: {
            // interrupt: no, cause code: environment call from S-mode (9)
            volatile uint64 sepc = r_sepc() + 4;
            volatile uint64 sstatus = r_sstatus();
//            kprintString("Ecall from S-mode for thread: ");
//            kprintUnsigned((uint64) TCB::running->getID());
//            kprintString("\n");

            TCB::dispatch();

            w_sstatus(sstatus);
            w_sepc(sepc);
            break;
        }
        case 0x8000000000000001UL: {
            // interrupt: yes, cause code: supervisor software interrupt (timer)
            volatile uint64 sepc = r_sepc();
            volatile uint64 sstatus = r_sstatus();
            mc_sip(SIP_SSIP);
            TCB::timeSliceCounter++;

            Riscv::enableInterrupts();

            TimerInterrupt::tick();

            Riscv::disableInterrupts();
//            kprintString("Interrupt timer for thread: ");
//            kprintUnsigned(TCB::running->getID());
//            kprintString("\n");
            if (TCB::timeSliceCounter >= TCB::running->timeSlice) {
//                kprintString("Timeout for thread: ");
//                kprintUnsigned(TCB::running->getID());
//                kprintString("\n");
                TCB::dispatch();
            }

            w_sstatus(sstatus);
            w_sepc(sepc);
            break;
        }
        case 0x8000000000000009UL: {
            // interrupt: yes, cause code: supervisor external interrupt (console)
            console_handler();
            break;
        }
        default: {
            // unexpected trap cause
            kprintString("Unexpected trap cause:\n");
            kprintString("Scause: ");
            kprintUnsigned(scause);
            kprintString("\nSepc: ");
            kprintUnsigned(r_sepc());
            kprintString("\nStval: ");
            kprintUnsigned(r_stval());
            kprintString("\n");
        }
    }
}