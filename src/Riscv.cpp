#include "../h/Riscv.h"
#include "../h/SysPrint.h"
#include "../h/TCB.h"
#include "../h/Kernel.h"
#include "../h/TimerInterrupt.h"
#include "../h/KernelConsole.h"

void Riscv::popSppSpie(bool prMode) {
    if(prMode) ms_sstatus(SSTATUS_SPP);
    else mc_sstatus(SSTATUS_SPP);
    ms_sstatus(SSTATUS_SPIE);
    __asm__ volatile ("csrw sepc, ra");
    __asm__ volatile ("sret");
}

enum {
    U_ECALL=0x0000000000000008UL, S_ECALL=0x0000000000000009UL,
    TIMER_INTERRUPT=0x8000000000000001UL, EXTERNAL_INTERRUPT=0x8000000000000009UL
};

void Riscv::handleSupervisorTrap() {
    uint64 scause = r_scause();
    switch (scause) {
        case U_ECALL: {
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
        case S_ECALL: {
            // interrupt: no, cause code: environment call from S-mode (9)
            volatile uint64 sepc = r_sepc() + 4;
            volatile uint64 sstatus = r_sstatus();

            TCB::dispatch();

            w_sstatus(sstatus);
            w_sepc(sepc);
            break;
        }
        case TIMER_INTERRUPT: {
            // interrupt: yes, cause code: supervisor software interrupt (timer)
            volatile uint64 sepc = r_sepc();
            volatile uint64 sstatus = r_sstatus();
            TCB::timeSliceCounter++;
            mc_sip(SIP_SSIP);

            Riscv::enableInterrupts();

            TimerInterrupt::getInstance()->tick();

            Riscv::disableInterrupts();

            if (TCB::timeSliceCounter >= TCB::running->timeSlice) {
                TCB::dispatch();
            }

            w_sstatus(sstatus);
            w_sepc(sepc);
            break;
        }
        case EXTERNAL_INTERRUPT: {
            // interrupt: yes, cause code: supervisor external interrupt (console or no-interrupt)
            volatile uint64 sepc = r_sepc();
            volatile uint64 sstatus = r_sstatus();

            int dev = plic_claim();

            if (dev == CONSOLE_IRQ) {
                KernelConsole::getInstance()->consoleHandler();
            }

            plic_complete(dev);

            w_sstatus(sstatus);
            w_sepc(sepc);
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

            TCB::running = TCB::userMain;
            TCB::exit();

            w_sepc(r_sepc() + 4);
        }
    }
}