
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000a117          	auipc	sp,0xa
    80000004:	dc813103          	ld	sp,-568(sp) # 80009dc8 <_GLOBAL_OFFSET_TABLE_+0x20>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	771040ef          	jal	ra,80004f8c <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>:
.type _ZN3TCB13contextSwitchEPNS_7ContextES1_, @function
_ZN3TCB13contextSwitchEPNS_7ContextES1_:
    # a0    &old->context
    # a1    &running->context

    sd ra, 0 * 8(a0)
    80001000:	00153023          	sd	ra,0(a0) # 1000 <_entry-0x7ffff000>
    sd sp, 1 * 8(a0)
    80001004:	00253423          	sd	sp,8(a0)

    ld ra, 0 * 8(a1)
    80001008:	0005b083          	ld	ra,0(a1)
    ld sp, 1 * 8(a1)
    8000100c:	0085b103          	ld	sp,8(a1)

    ret
    80001010:	00008067          	ret
	...

0000000080001020 <_ZN5Riscv14supervisorTrapEv>:
.align 4
.global _ZN5Riscv14supervisorTrapEv
.type _ZN5Riscv14supervisorTrapEv, @function
_ZN5Riscv14supervisorTrapEv:

    sd t0, -1 * 8(sp)
    80001020:	fe513c23          	sd	t0,-8(sp)
    mv t0, sp
    80001024:	00010293          	mv	t0,sp

    csrw sscratch, a0
    80001028:	14051073          	csrw	sscratch,a0
    ld a0, _ZN3TCB7runningE
    8000102c:	00009517          	auipc	a0,0x9
    80001030:	e0c53503          	ld	a0,-500(a0) # 80009e38 <_ZN3TCB7runningE>
    ld sp, 0(a0)
    80001034:	00053103          	ld	sp,0(a0)
    sd t0, 0(a0)
    80001038:	00553023          	sd	t0,0(a0)
    csrr a0, sscratch
    8000103c:	14002573          	csrr	a0,sscratch

    ld t0, -1 * 8(t0)
    80001040:	ff82b283          	ld	t0,-8(t0)

    addi sp, sp, -256
    80001044:	f0010113          	addi	sp,sp,-256
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    80001048:	00013023          	sd	zero,0(sp)
    8000104c:	00113423          	sd	ra,8(sp)
    80001050:	00213823          	sd	sp,16(sp)
    80001054:	00313c23          	sd	gp,24(sp)
    80001058:	02413023          	sd	tp,32(sp)
    8000105c:	02513423          	sd	t0,40(sp)
    80001060:	02613823          	sd	t1,48(sp)
    80001064:	02713c23          	sd	t2,56(sp)
    80001068:	04813023          	sd	s0,64(sp)
    8000106c:	04913423          	sd	s1,72(sp)
    80001070:	04a13823          	sd	a0,80(sp)
    80001074:	04b13c23          	sd	a1,88(sp)
    80001078:	06c13023          	sd	a2,96(sp)
    8000107c:	06d13423          	sd	a3,104(sp)
    80001080:	06e13823          	sd	a4,112(sp)
    80001084:	06f13c23          	sd	a5,120(sp)
    80001088:	09013023          	sd	a6,128(sp)
    8000108c:	09113423          	sd	a7,136(sp)
    80001090:	09213823          	sd	s2,144(sp)
    80001094:	09313c23          	sd	s3,152(sp)
    80001098:	0b413023          	sd	s4,160(sp)
    8000109c:	0b513423          	sd	s5,168(sp)
    800010a0:	0b613823          	sd	s6,176(sp)
    800010a4:	0b713c23          	sd	s7,184(sp)
    800010a8:	0d813023          	sd	s8,192(sp)
    800010ac:	0d913423          	sd	s9,200(sp)
    800010b0:	0da13823          	sd	s10,208(sp)
    800010b4:	0db13c23          	sd	s11,216(sp)
    800010b8:	0fc13023          	sd	t3,224(sp)
    800010bc:	0fd13423          	sd	t4,232(sp)
    800010c0:	0fe13823          	sd	t5,240(sp)
    800010c4:	0ff13c23          	sd	t6,248(sp)

    call _ZN5Riscv20handleSupervisorTrapEv
    800010c8:	789000ef          	jal	ra,80002050 <_ZN5Riscv20handleSupervisorTrapEv>

    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    800010cc:	00013003          	ld	zero,0(sp)
    800010d0:	00813083          	ld	ra,8(sp)
    800010d4:	01013103          	ld	sp,16(sp)
    800010d8:	01813183          	ld	gp,24(sp)
    800010dc:	02013203          	ld	tp,32(sp)
    800010e0:	02813283          	ld	t0,40(sp)
    800010e4:	03013303          	ld	t1,48(sp)
    800010e8:	03813383          	ld	t2,56(sp)
    800010ec:	04013403          	ld	s0,64(sp)
    800010f0:	04813483          	ld	s1,72(sp)
    800010f4:	05013503          	ld	a0,80(sp)
    800010f8:	05813583          	ld	a1,88(sp)
    800010fc:	06013603          	ld	a2,96(sp)
    80001100:	06813683          	ld	a3,104(sp)
    80001104:	07013703          	ld	a4,112(sp)
    80001108:	07813783          	ld	a5,120(sp)
    8000110c:	08013803          	ld	a6,128(sp)
    80001110:	08813883          	ld	a7,136(sp)
    80001114:	09013903          	ld	s2,144(sp)
    80001118:	09813983          	ld	s3,152(sp)
    8000111c:	0a013a03          	ld	s4,160(sp)
    80001120:	0a813a83          	ld	s5,168(sp)
    80001124:	0b013b03          	ld	s6,176(sp)
    80001128:	0b813b83          	ld	s7,184(sp)
    8000112c:	0c013c03          	ld	s8,192(sp)
    80001130:	0c813c83          	ld	s9,200(sp)
    80001134:	0d013d03          	ld	s10,208(sp)
    80001138:	0d813d83          	ld	s11,216(sp)
    8000113c:	0e013e03          	ld	t3,224(sp)
    80001140:	0e813e83          	ld	t4,232(sp)
    80001144:	0f013f03          	ld	t5,240(sp)
    80001148:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    8000114c:	10010113          	addi	sp,sp,256

    sd t0, -1 * 8(sp)
    80001150:	fe513c23          	sd	t0,-8(sp)
    mv t0, sp
    80001154:	00010293          	mv	t0,sp

    csrw sscratch, a0
    80001158:	14051073          	csrw	sscratch,a0
    ld a0, _ZN3TCB7runningE
    8000115c:	00009517          	auipc	a0,0x9
    80001160:	cdc53503          	ld	a0,-804(a0) # 80009e38 <_ZN3TCB7runningE>
    ld sp, 0(a0)
    80001164:	00053103          	ld	sp,0(a0)
    sd t0, 0(a0)
    80001168:	00553023          	sd	t0,0(a0)
    csrr a0, sscratch
    8000116c:	14002573          	csrr	a0,sscratch

    ld t0, -1 * 8(t0)
    80001170:	ff82b283          	ld	t0,-8(t0)

    80001174:	10200073          	sret
	...

0000000080001180 <copy_and_swap>:
# a1 holds expected value
# a2 holds desired value
# a0 holds return value, 0 if successful, !0 otherwise
.global copy_and_swap
copy_and_swap:
    lr.w t0, (a0)          # Load original value.
    80001180:	100522af          	lr.w	t0,(a0)
    bne t0, a1, fail       # Doesn’t match, so fail.
    80001184:	00b29a63          	bne	t0,a1,80001198 <fail>
    sc.w t0, a2, (a0)      # Try to update.
    80001188:	18c522af          	sc.w	t0,a2,(a0)
    bnez t0, copy_and_swap # Retry if store-conditional failed.
    8000118c:	fe029ae3          	bnez	t0,80001180 <copy_and_swap>
    li a0, 0               # Set return to success.
    80001190:	00000513          	li	a0,0
    jr ra                  # Return.
    80001194:	00008067          	ret

0000000080001198 <fail>:
    fail:
    li a0, 1               # Set return to failure.
    80001198:	00100513          	li	a0,1
    8000119c:	00008067          	ret

00000000800011a0 <_ZN10IdleThreadC1Ev>:
IdleThread *IdleThread::getInstance() {
    if (!instance) instance = new IdleThread;
    return instance;
}

IdleThread::IdleThread() {
    800011a0:	fe010113          	addi	sp,sp,-32
    800011a4:	00113c23          	sd	ra,24(sp)
    800011a8:	00813823          	sd	s0,16(sp)
    800011ac:	00913423          	sd	s1,8(sp)
    800011b0:	01213023          	sd	s2,0(sp)
    800011b4:	02010413          	addi	s0,sp,32
    800011b8:	00050913          	mv	s2,a0
    800011bc:	00053023          	sd	zero,0(a0)
#include "MemoryAllocator.h"

class KernelObject {
public:
    static void *operator new(size_t size) {
        return kmalloc(size);
    800011c0:	0c000513          	li	a0,192
    800011c4:	00001097          	auipc	ra,0x1
    800011c8:	ce0080e7          	jalr	-800(ra) # 80001ea4 <_Z7kmallocm>
    800011cc:	00050493          	mv	s1,a0
    idleThread = new TCB([](void *){IdleThread::getInstance()->run();}, nullptr, DEFAULT_TIME_SLICE);
    800011d0:	00000713          	li	a4,0
    800011d4:	00200693          	li	a3,2
    800011d8:	00000613          	li	a2,0
    800011dc:	00000597          	auipc	a1,0x0
    800011e0:	0ec58593          	addi	a1,a1,236 # 800012c8 <_ZZN10IdleThreadC4EvENUlPvE_4_FUNES0_>
    800011e4:	00001097          	auipc	ra,0x1
    800011e8:	7f4080e7          	jalr	2036(ra) # 800029d8 <_ZN3TCBC1EPFvPvES0_mb>
    800011ec:	00993023          	sd	s1,0(s2)
    bool isIdle() const {
        return status == IDLE;
    }

    void setIdle() {
        status = IDLE;
    800011f0:	00300793          	li	a5,3
    800011f4:	04f4a023          	sw	a5,64(s1)
    idleThread->setIdle();
}
    800011f8:	01813083          	ld	ra,24(sp)
    800011fc:	01013403          	ld	s0,16(sp)
    80001200:	00813483          	ld	s1,8(sp)
    80001204:	00013903          	ld	s2,0(sp)
    80001208:	02010113          	addi	sp,sp,32
    8000120c:	00008067          	ret
    80001210:	00050913          	mv	s2,a0
    static void *operator new[](size_t size) {
        return kmalloc(size);
    }

    static void operator delete(void *addr) {
        kfree(addr);
    80001214:	00048513          	mv	a0,s1
    80001218:	00001097          	auipc	ra,0x1
    8000121c:	ccc080e7          	jalr	-820(ra) # 80001ee4 <_Z5kfreePv>
    80001220:	00090513          	mv	a0,s2
    80001224:	0000a097          	auipc	ra,0xa
    80001228:	d24080e7          	jalr	-732(ra) # 8000af48 <_Unwind_Resume>

000000008000122c <_ZN10IdleThread11getInstanceEv>:
    if (!instance) instance = new IdleThread;
    8000122c:	00009797          	auipc	a5,0x9
    80001230:	bf47b783          	ld	a5,-1036(a5) # 80009e20 <_ZN10IdleThread8instanceE>
    80001234:	00078863          	beqz	a5,80001244 <_ZN10IdleThread11getInstanceEv+0x18>
    return instance;
    80001238:	00009517          	auipc	a0,0x9
    8000123c:	be853503          	ld	a0,-1048(a0) # 80009e20 <_ZN10IdleThread8instanceE>
}
    80001240:	00008067          	ret
IdleThread *IdleThread::getInstance() {
    80001244:	fe010113          	addi	sp,sp,-32
    80001248:	00113c23          	sd	ra,24(sp)
    8000124c:	00813823          	sd	s0,16(sp)
    80001250:	00913423          	sd	s1,8(sp)
    80001254:	01213023          	sd	s2,0(sp)
    80001258:	02010413          	addi	s0,sp,32
        return kmalloc(size);
    8000125c:	00800513          	li	a0,8
    80001260:	00001097          	auipc	ra,0x1
    80001264:	c44080e7          	jalr	-956(ra) # 80001ea4 <_Z7kmallocm>
    80001268:	00050493          	mv	s1,a0
    if (!instance) instance = new IdleThread;
    8000126c:	00000097          	auipc	ra,0x0
    80001270:	f34080e7          	jalr	-204(ra) # 800011a0 <_ZN10IdleThreadC1Ev>
    80001274:	00009797          	auipc	a5,0x9
    80001278:	ba97b623          	sd	s1,-1108(a5) # 80009e20 <_ZN10IdleThread8instanceE>
    return instance;
    8000127c:	00009517          	auipc	a0,0x9
    80001280:	ba453503          	ld	a0,-1116(a0) # 80009e20 <_ZN10IdleThread8instanceE>
}
    80001284:	01813083          	ld	ra,24(sp)
    80001288:	01013403          	ld	s0,16(sp)
    8000128c:	00813483          	ld	s1,8(sp)
    80001290:	00013903          	ld	s2,0(sp)
    80001294:	02010113          	addi	sp,sp,32
    80001298:	00008067          	ret
    8000129c:	00050913          	mv	s2,a0
        kfree(addr);
    800012a0:	00048513          	mv	a0,s1
    800012a4:	00001097          	auipc	ra,0x1
    800012a8:	c40080e7          	jalr	-960(ra) # 80001ee4 <_Z5kfreePv>
    800012ac:	00090513          	mv	a0,s2
    800012b0:	0000a097          	auipc	ra,0xa
    800012b4:	c98080e7          	jalr	-872(ra) # 8000af48 <_Unwind_Resume>

00000000800012b8 <_ZN10IdleThread3runEv>:

[[noreturn]] void IdleThread::run() {
    800012b8:	ff010113          	addi	sp,sp,-16
    800012bc:	00813423          	sd	s0,8(sp)
    800012c0:	01010413          	addi	s0,sp,16
    while (true);
    800012c4:	0000006f          	j	800012c4 <_ZN10IdleThread3runEv+0xc>

00000000800012c8 <_ZZN10IdleThreadC4EvENUlPvE_4_FUNES0_>:
    idleThread = new TCB([](void *){IdleThread::getInstance()->run();}, nullptr, DEFAULT_TIME_SLICE);
    800012c8:	ff010113          	addi	sp,sp,-16
    800012cc:	00113423          	sd	ra,8(sp)
    800012d0:	00813023          	sd	s0,0(sp)
    800012d4:	01010413          	addi	s0,sp,16
    800012d8:	00000097          	auipc	ra,0x0
    800012dc:	f54080e7          	jalr	-172(ra) # 8000122c <_ZN10IdleThread11getInstanceEv>
    800012e0:	00000097          	auipc	ra,0x0
    800012e4:	fd8080e7          	jalr	-40(ra) # 800012b8 <_ZN10IdleThread3runEv>

00000000800012e8 <_ZN10IdleThreadD1Ev>:
}

IdleThread::~IdleThread() {
    800012e8:	fe010113          	addi	sp,sp,-32
    800012ec:	00113c23          	sd	ra,24(sp)
    800012f0:	00813823          	sd	s0,16(sp)
    800012f4:	00913423          	sd	s1,8(sp)
    800012f8:	02010413          	addi	s0,sp,32
//    kprintString("Idle deleting...\n");
    delete idleThread;
    800012fc:	00053483          	ld	s1,0(a0)
    80001300:	00048e63          	beqz	s1,8000131c <_ZN10IdleThreadD1Ev+0x34>
    80001304:	00048513          	mv	a0,s1
    80001308:	00002097          	auipc	ra,0x2
    8000130c:	ac4080e7          	jalr	-1340(ra) # 80002dcc <_ZN3TCBD1Ev>
    80001310:	00048513          	mv	a0,s1
    80001314:	00001097          	auipc	ra,0x1
    80001318:	bd0080e7          	jalr	-1072(ra) # 80001ee4 <_Z5kfreePv>
}
    8000131c:	01813083          	ld	ra,24(sp)
    80001320:	01013403          	ld	s0,16(sp)
    80001324:	00813483          	ld	s1,8(sp)
    80001328:	02010113          	addi	sp,sp,32
    8000132c:	00008067          	ret

0000000080001330 <_ZN10IdleThread13getIdleThreadEv>:

TCB *IdleThread::getIdleThread() {
    80001330:	ff010113          	addi	sp,sp,-16
    80001334:	00113423          	sd	ra,8(sp)
    80001338:	00813023          	sd	s0,0(sp)
    8000133c:	01010413          	addi	s0,sp,16
    return getInstance()->idleThread;
    80001340:	00000097          	auipc	ra,0x0
    80001344:	eec080e7          	jalr	-276(ra) # 8000122c <_ZN10IdleThread11getInstanceEv>
}
    80001348:	00053503          	ld	a0,0(a0)
    8000134c:	00813083          	ld	ra,8(sp)
    80001350:	00013403          	ld	s0,0(sp)
    80001354:	01010113          	addi	sp,sp,16
    80001358:	00008067          	ret

000000008000135c <_ZN6Kernel9mem_allocEm>:
            kprintString("\n");
            return;
    }
}

void *Kernel::mem_alloc(size_t size) {
    8000135c:	ff010113          	addi	sp,sp,-16
    80001360:	00113423          	sd	ra,8(sp)
    80001364:	00813023          	sd	s0,0(sp)
    80001368:	01010413          	addi	s0,sp,16
    return kmalloc(size);
    8000136c:	00001097          	auipc	ra,0x1
    80001370:	b38080e7          	jalr	-1224(ra) # 80001ea4 <_Z7kmallocm>
}
    80001374:	00813083          	ld	ra,8(sp)
    80001378:	00013403          	ld	s0,0(sp)
    8000137c:	01010113          	addi	sp,sp,16
    80001380:	00008067          	ret

0000000080001384 <_ZN6Kernel8mem_freeEPv>:

int Kernel::mem_free(void *addr) {
    80001384:	ff010113          	addi	sp,sp,-16
    80001388:	00113423          	sd	ra,8(sp)
    8000138c:	00813023          	sd	s0,0(sp)
    80001390:	01010413          	addi	s0,sp,16
    return kfree(addr);
    80001394:	00001097          	auipc	ra,0x1
    80001398:	b50080e7          	jalr	-1200(ra) # 80001ee4 <_Z5kfreePv>
}
    8000139c:	00813083          	ld	ra,8(sp)
    800013a0:	00013403          	ld	s0,0(sp)
    800013a4:	01010113          	addi	sp,sp,16
    800013a8:	00008067          	ret

00000000800013ac <_ZN6Kernel13thread_createEPm>:

int Kernel::thread_create(uint64 *args) {
    800013ac:	fe010113          	addi	sp,sp,-32
    800013b0:	00113c23          	sd	ra,24(sp)
    800013b4:	00813823          	sd	s0,16(sp)
    800013b8:	00913423          	sd	s1,8(sp)
    800013bc:	02010413          	addi	s0,sp,32
    TCB **handle = (TCB **) args[0];
    800013c0:	00053483          	ld	s1,0(a0)
    if (!handle) return -1;
    800013c4:	00049e63          	bnez	s1,800013e0 <_ZN6Kernel13thread_createEPm+0x34>
    800013c8:	fff00513          	li	a0,-1
    TCB::Body body = (TCB::Body) args[1];
    void *arg = (void *) args[2];
    *handle = TCB::createThread(body, arg);
    return *handle != nullptr;
}
    800013cc:	01813083          	ld	ra,24(sp)
    800013d0:	01013403          	ld	s0,16(sp)
    800013d4:	00813483          	ld	s1,8(sp)
    800013d8:	02010113          	addi	sp,sp,32
    800013dc:	00008067          	ret
    *handle = TCB::createThread(body, arg);
    800013e0:	01053583          	ld	a1,16(a0)
    800013e4:	00853503          	ld	a0,8(a0)
    800013e8:	00001097          	auipc	ra,0x1
    800013ec:	730080e7          	jalr	1840(ra) # 80002b18 <_ZN3TCB12createThreadEPFvPvES0_>
    800013f0:	00a4b023          	sd	a0,0(s1)
    return *handle != nullptr;
    800013f4:	00a03533          	snez	a0,a0
    800013f8:	fd5ff06f          	j	800013cc <_ZN6Kernel13thread_createEPm+0x20>

00000000800013fc <_ZN6Kernel11thread_exitEv>:

int Kernel::thread_exit() {
    800013fc:	ff010113          	addi	sp,sp,-16
    80001400:	00113423          	sd	ra,8(sp)
    80001404:	00813023          	sd	s0,0(sp)
    80001408:	01010413          	addi	s0,sp,16
    TCB::exit();
    8000140c:	00002097          	auipc	ra,0x2
    80001410:	85c080e7          	jalr	-1956(ra) # 80002c68 <_ZN3TCB4exitEv>
    return -1;
}
    80001414:	fff00513          	li	a0,-1
    80001418:	00813083          	ld	ra,8(sp)
    8000141c:	00013403          	ld	s0,0(sp)
    80001420:	01010113          	addi	sp,sp,16
    80001424:	00008067          	ret

0000000080001428 <_ZN6Kernel15thread_dispatchEv>:

void Kernel::thread_dispatch() {
    80001428:	ff010113          	addi	sp,sp,-16
    8000142c:	00113423          	sd	ra,8(sp)
    80001430:	00813023          	sd	s0,0(sp)
    80001434:	01010413          	addi	s0,sp,16
    TCB::running->dispatch();
    80001438:	00001097          	auipc	ra,0x1
    8000143c:	76c080e7          	jalr	1900(ra) # 80002ba4 <_ZN3TCB8dispatchEv>
}
    80001440:	00813083          	ld	ra,8(sp)
    80001444:	00013403          	ld	s0,0(sp)
    80001448:	01010113          	addi	sp,sp,16
    8000144c:	00008067          	ret

0000000080001450 <_ZN6Kernel8sem_openEPm>:

int Kernel::sem_open(uint64 *args) {
    80001450:	fe010113          	addi	sp,sp,-32
    80001454:	00113c23          	sd	ra,24(sp)
    80001458:	00813823          	sd	s0,16(sp)
    8000145c:	00913423          	sd	s1,8(sp)
    80001460:	01213023          	sd	s2,0(sp)
    80001464:	02010413          	addi	s0,sp,32
    KernelSemaphore **handle = (KernelSemaphore **) args[0];
    80001468:	00053483          	ld	s1,0(a0)
    if (!handle) return -1;
    8000146c:	02049063          	bnez	s1,8000148c <_ZN6Kernel8sem_openEPm+0x3c>
    80001470:	fff00513          	li	a0,-1
//    kprintString("\n");
//    kprintString("Handle address: ");
//    kprintUnsigned((uint64) handle);
//    kprintString("\n");
    return *handle != nullptr;
}
    80001474:	01813083          	ld	ra,24(sp)
    80001478:	01013403          	ld	s0,16(sp)
    8000147c:	00813483          	ld	s1,8(sp)
    80001480:	00013903          	ld	s2,0(sp)
    80001484:	02010113          	addi	sp,sp,32
    80001488:	00008067          	ret
    unsigned int init = (unsigned int) args[1];
    8000148c:	00853903          	ld	s2,8(a0)
        return kmalloc(size);
    80001490:	02800513          	li	a0,40
    80001494:	00001097          	auipc	ra,0x1
    80001498:	a10080e7          	jalr	-1520(ra) # 80001ea4 <_Z7kmallocm>

class TCB;

class KernelSemaphore : public KernelObject {
public:
    KernelSemaphore(int val = 1) : val(val) {}
    8000149c:	01252023          	sw	s2,0(a0)
#include "KernelObject.h"
#include "ThreadNode.h"

class ThreadList : public KernelObject {
public:
    explicit ThreadList() = default;
    800014a0:	00053423          	sd	zero,8(a0)
    800014a4:	00053823          	sd	zero,16(a0)
    800014a8:	00053c23          	sd	zero,24(a0)
    800014ac:	02052023          	sw	zero,32(a0)
    *handle = new KernelSemaphore(init);
    800014b0:	00a4b023          	sd	a0,0(s1)
    return *handle != nullptr;
    800014b4:	00a03533          	snez	a0,a0
    800014b8:	fbdff06f          	j	80001474 <_ZN6Kernel8sem_openEPm+0x24>

00000000800014bc <_ZN6Kernel9sem_closeEPP15KernelSemaphore>:

int Kernel::sem_close(KernelSemaphore **sem) {
    if (!sem || !*sem) return -1;
    800014bc:	06050063          	beqz	a0,8000151c <_ZN6Kernel9sem_closeEPP15KernelSemaphore+0x60>
int Kernel::sem_close(KernelSemaphore **sem) {
    800014c0:	fe010113          	addi	sp,sp,-32
    800014c4:	00113c23          	sd	ra,24(sp)
    800014c8:	00813823          	sd	s0,16(sp)
    800014cc:	00913423          	sd	s1,8(sp)
    800014d0:	01213023          	sd	s2,0(sp)
    800014d4:	02010413          	addi	s0,sp,32
    800014d8:	00050493          	mv	s1,a0
    if (!sem || !*sem) return -1;
    800014dc:	00053903          	ld	s2,0(a0)
    800014e0:	04090263          	beqz	s2,80001524 <_ZN6Kernel9sem_closeEPP15KernelSemaphore+0x68>
    delete *sem;
    800014e4:	00090513          	mv	a0,s2
    800014e8:	00000097          	auipc	ra,0x0
    800014ec:	42c080e7          	jalr	1068(ra) # 80001914 <_ZN15KernelSemaphoreD1Ev>
        kfree(addr);
    800014f0:	00090513          	mv	a0,s2
    800014f4:	00001097          	auipc	ra,0x1
    800014f8:	9f0080e7          	jalr	-1552(ra) # 80001ee4 <_Z5kfreePv>
    *sem = nullptr;
    800014fc:	0004b023          	sd	zero,0(s1)

    return 0;
    80001500:	00000513          	li	a0,0
}
    80001504:	01813083          	ld	ra,24(sp)
    80001508:	01013403          	ld	s0,16(sp)
    8000150c:	00813483          	ld	s1,8(sp)
    80001510:	00013903          	ld	s2,0(sp)
    80001514:	02010113          	addi	sp,sp,32
    80001518:	00008067          	ret
    if (!sem || !*sem) return -1;
    8000151c:	fff00513          	li	a0,-1
}
    80001520:	00008067          	ret
    if (!sem || !*sem) return -1;
    80001524:	fff00513          	li	a0,-1
    80001528:	fddff06f          	j	80001504 <_ZN6Kernel9sem_closeEPP15KernelSemaphore+0x48>

000000008000152c <_ZN6Kernel8sem_waitEPP15KernelSemaphore>:

int Kernel::sem_wait(KernelSemaphore **sem) {
    if (!sem || !*sem) return -1;
    8000152c:	02050c63          	beqz	a0,80001564 <_ZN6Kernel8sem_waitEPP15KernelSemaphore+0x38>
    80001530:	00053503          	ld	a0,0(a0)
    80001534:	02050c63          	beqz	a0,8000156c <_ZN6Kernel8sem_waitEPP15KernelSemaphore+0x40>
int Kernel::sem_wait(KernelSemaphore **sem) {
    80001538:	ff010113          	addi	sp,sp,-16
    8000153c:	00113423          	sd	ra,8(sp)
    80001540:	00813023          	sd	s0,0(sp)
    80001544:	01010413          	addi	s0,sp,16
    (*sem)->wait();
    80001548:	00000097          	auipc	ra,0x0
    8000154c:	310080e7          	jalr	784(ra) # 80001858 <_ZN15KernelSemaphore4waitEv>
    return 0;
    80001550:	00000513          	li	a0,0
}
    80001554:	00813083          	ld	ra,8(sp)
    80001558:	00013403          	ld	s0,0(sp)
    8000155c:	01010113          	addi	sp,sp,16
    80001560:	00008067          	ret
    if (!sem || !*sem) return -1;
    80001564:	fff00513          	li	a0,-1
    80001568:	00008067          	ret
    8000156c:	fff00513          	li	a0,-1
}
    80001570:	00008067          	ret

0000000080001574 <_ZN6Kernel10sem_signalEPP15KernelSemaphore>:

int Kernel::sem_signal(KernelSemaphore **sem) {
    if (!sem || !*sem) return -1;
    80001574:	02050c63          	beqz	a0,800015ac <_ZN6Kernel10sem_signalEPP15KernelSemaphore+0x38>
    80001578:	00053503          	ld	a0,0(a0)
    8000157c:	02050c63          	beqz	a0,800015b4 <_ZN6Kernel10sem_signalEPP15KernelSemaphore+0x40>
int Kernel::sem_signal(KernelSemaphore **sem) {
    80001580:	ff010113          	addi	sp,sp,-16
    80001584:	00113423          	sd	ra,8(sp)
    80001588:	00813023          	sd	s0,0(sp)
    8000158c:	01010413          	addi	s0,sp,16
    (*sem)->signal();
    80001590:	00000097          	auipc	ra,0x0
    80001594:	328080e7          	jalr	808(ra) # 800018b8 <_ZN15KernelSemaphore6signalEv>
    return 0;
    80001598:	00000513          	li	a0,0
}
    8000159c:	00813083          	ld	ra,8(sp)
    800015a0:	00013403          	ld	s0,0(sp)
    800015a4:	01010113          	addi	sp,sp,16
    800015a8:	00008067          	ret
    if (!sem || !*sem) return -1;
    800015ac:	fff00513          	li	a0,-1
    800015b0:	00008067          	ret
    800015b4:	fff00513          	li	a0,-1
}
    800015b8:	00008067          	ret

00000000800015bc <_ZN6Kernel10time_sleepEm>:

int Kernel::time_sleep(time_t time) {
    800015bc:	ff010113          	addi	sp,sp,-16
    800015c0:	00113423          	sd	ra,8(sp)
    800015c4:	00813023          	sd	s0,0(sp)
    800015c8:	01010413          	addi	s0,sp,16
    800015cc:	00050593          	mv	a1,a0
    if (time < 0) return -1;
    TimerInterrupt::block(TCB::running, time);
    800015d0:	00009797          	auipc	a5,0x9
    800015d4:	8007b783          	ld	a5,-2048(a5) # 80009dd0 <_GLOBAL_OFFSET_TABLE_+0x28>
    800015d8:	0007b503          	ld	a0,0(a5)
    800015dc:	00002097          	auipc	ra,0x2
    800015e0:	ea0080e7          	jalr	-352(ra) # 8000347c <_ZN14TimerInterrupt5blockEP3TCBm>
    return 0;
}
    800015e4:	00000513          	li	a0,0
    800015e8:	00813083          	ld	ra,8(sp)
    800015ec:	00013403          	ld	s0,0(sp)
    800015f0:	01010113          	addi	sp,sp,16
    800015f4:	00008067          	ret

00000000800015f8 <_ZN6Kernel4getcEv>:

char Kernel::getc() {
    800015f8:	ff010113          	addi	sp,sp,-16
    800015fc:	00113423          	sd	ra,8(sp)
    80001600:	00813023          	sd	s0,0(sp)
    80001604:	01010413          	addi	s0,sp,16
    return __getc();
    80001608:	00006097          	auipc	ra,0x6
    8000160c:	a80080e7          	jalr	-1408(ra) # 80007088 <__getc>
}
    80001610:	00813083          	ld	ra,8(sp)
    80001614:	00013403          	ld	s0,0(sp)
    80001618:	01010113          	addi	sp,sp,16
    8000161c:	00008067          	ret

0000000080001620 <_ZN6Kernel4putcEc>:

void Kernel::putc(char c) {
    80001620:	ff010113          	addi	sp,sp,-16
    80001624:	00113423          	sd	ra,8(sp)
    80001628:	00813023          	sd	s0,0(sp)
    8000162c:	01010413          	addi	s0,sp,16
    __putc(c);
    80001630:	00006097          	auipc	ra,0x6
    80001634:	a1c080e7          	jalr	-1508(ra) # 8000704c <__putc>
}
    80001638:	00813083          	ld	ra,8(sp)
    8000163c:	00013403          	ld	s0,0(sp)
    80001640:	01010113          	addi	sp,sp,16
    80001644:	00008067          	ret

0000000080001648 <_ZN6Kernel16handleSystemCallEv>:
void Kernel::handleSystemCall() {
    80001648:	fd010113          	addi	sp,sp,-48
    8000164c:	02113423          	sd	ra,40(sp)
    80001650:	02813023          	sd	s0,32(sp)
    80001654:	00913c23          	sd	s1,24(sp)
    80001658:	01213823          	sd	s2,16(sp)
    8000165c:	03010413          	addi	s0,sp,48
    uint64 context = TCB::running->getSavedContext();
    80001660:	00008797          	auipc	a5,0x8
    80001664:	7707b783          	ld	a5,1904(a5) # 80009dd0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001668:	0007b783          	ld	a5,0(a5)
    uint64 getSsp() const {
        return ssp;
    }

    uint64 getSavedContext() const {
        return (uint64) (kernelStack + DEFAULT_STACK_SIZE - 32);
    8000166c:	0207b703          	ld	a4,32(a5)
    80001670:	000087b7          	lui	a5,0x8
    80001674:	f0078793          	addi	a5,a5,-256 # 7f00 <_entry-0x7fff8100>
    80001678:	00f704b3          	add	s1,a4,a5
    return s0;
}

inline uint64 Riscv::r_a0() {
    uint64 volatile a0;
    __asm__ volatile ("mv %[a0], a0" : [a0] "=r"(a0));
    8000167c:	00050793          	mv	a5,a0
    80001680:	fcf43c23          	sd	a5,-40(s0)
    return a0;
    80001684:	fd843903          	ld	s2,-40(s0)
    __asm__ volatile ("mv a0, %[a0]" : : [a0] "r"(a0));
}

inline uint64 Riscv::r_a1() {
    uint64 volatile a1;
    __asm__ volatile ("mv %[a1], a1" : [a1] "=r"(a1));
    80001688:	00058793          	mv	a5,a1
    8000168c:	fcf43823          	sd	a5,-48(s0)
    return a1;
    80001690:	fd043503          	ld	a0,-48(s0)
    switch (code) {
    80001694:	04200793          	li	a5,66
    80001698:	0f27ea63          	bltu	a5,s2,8000178c <_ZN6Kernel16handleSystemCallEv+0x144>
    8000169c:	00291713          	slli	a4,s2,0x2
    800016a0:	00007697          	auipc	a3,0x7
    800016a4:	99868693          	addi	a3,a3,-1640 # 80008038 <CONSOLE_STATUS+0x28>
    800016a8:	00d70733          	add	a4,a4,a3
    800016ac:	00072783          	lw	a5,0(a4)
    800016b0:	00d787b3          	add	a5,a5,a3
    800016b4:	00078067          	jr	a5
            mem_alloc(*(size_t *) args);
    800016b8:	00053503          	ld	a0,0(a0)
    800016bc:	00000097          	auipc	ra,0x0
    800016c0:	ca0080e7          	jalr	-864(ra) # 8000135c <_ZN6Kernel9mem_allocEm>
inline void Riscv::enableInterrupts() {
    ms_sstatus(SSTATUS_SIE);
}

inline void Riscv::pushRegisterA0(uint64 context) {
    __asm__ volatile ("sd a0, 10 * 8(%[context])" : : [context] "r"(context));
    800016c4:	04a4b823          	sd	a0,80(s1)
}
    800016c8:	02813083          	ld	ra,40(sp)
    800016cc:	02013403          	ld	s0,32(sp)
    800016d0:	01813483          	ld	s1,24(sp)
    800016d4:	01013903          	ld	s2,16(sp)
    800016d8:	03010113          	addi	sp,sp,48
    800016dc:	00008067          	ret
            mem_free(args);
    800016e0:	00000097          	auipc	ra,0x0
    800016e4:	ca4080e7          	jalr	-860(ra) # 80001384 <_ZN6Kernel8mem_freeEPv>
    800016e8:	04a4b823          	sd	a0,80(s1)
}
    800016ec:	fddff06f          	j	800016c8 <_ZN6Kernel16handleSystemCallEv+0x80>
            thread_create((uint64 *) args);
    800016f0:	00000097          	auipc	ra,0x0
    800016f4:	cbc080e7          	jalr	-836(ra) # 800013ac <_ZN6Kernel13thread_createEPm>
    __asm__ volatile ("sd a0, 10 * 8(%[context])" : : [context] "r"(context));
    800016f8:	04a4b823          	sd	a0,80(s1)
}
    800016fc:	fcdff06f          	j	800016c8 <_ZN6Kernel16handleSystemCallEv+0x80>
            thread_exit();
    80001700:	00000097          	auipc	ra,0x0
    80001704:	cfc080e7          	jalr	-772(ra) # 800013fc <_ZN6Kernel11thread_exitEv>
    __asm__ volatile ("sd a0, 10 * 8(%[context])" : : [context] "r"(context));
    80001708:	04a4b823          	sd	a0,80(s1)
}
    8000170c:	fbdff06f          	j	800016c8 <_ZN6Kernel16handleSystemCallEv+0x80>
            thread_dispatch();
    80001710:	00000097          	auipc	ra,0x0
    80001714:	d18080e7          	jalr	-744(ra) # 80001428 <_ZN6Kernel15thread_dispatchEv>
            break;
    80001718:	fb1ff06f          	j	800016c8 <_ZN6Kernel16handleSystemCallEv+0x80>
            sem_open((uint64 *) args);
    8000171c:	00000097          	auipc	ra,0x0
    80001720:	d34080e7          	jalr	-716(ra) # 80001450 <_ZN6Kernel8sem_openEPm>
    __asm__ volatile ("sd a0, 10 * 8(%[context])" : : [context] "r"(context));
    80001724:	04a4b823          	sd	a0,80(s1)
}
    80001728:	fa1ff06f          	j	800016c8 <_ZN6Kernel16handleSystemCallEv+0x80>
            sem_close((KernelSemaphore **) args);
    8000172c:	00000097          	auipc	ra,0x0
    80001730:	d90080e7          	jalr	-624(ra) # 800014bc <_ZN6Kernel9sem_closeEPP15KernelSemaphore>
    __asm__ volatile ("sd a0, 10 * 8(%[context])" : : [context] "r"(context));
    80001734:	04a4b823          	sd	a0,80(s1)
}
    80001738:	f91ff06f          	j	800016c8 <_ZN6Kernel16handleSystemCallEv+0x80>
            sem_wait((KernelSemaphore **) args);
    8000173c:	00000097          	auipc	ra,0x0
    80001740:	df0080e7          	jalr	-528(ra) # 8000152c <_ZN6Kernel8sem_waitEPP15KernelSemaphore>
    __asm__ volatile ("sd a0, 10 * 8(%[context])" : : [context] "r"(context));
    80001744:	04a4b823          	sd	a0,80(s1)
}
    80001748:	f81ff06f          	j	800016c8 <_ZN6Kernel16handleSystemCallEv+0x80>
            sem_signal((KernelSemaphore **) args);
    8000174c:	00000097          	auipc	ra,0x0
    80001750:	e28080e7          	jalr	-472(ra) # 80001574 <_ZN6Kernel10sem_signalEPP15KernelSemaphore>
    __asm__ volatile ("sd a0, 10 * 8(%[context])" : : [context] "r"(context));
    80001754:	04a4b823          	sd	a0,80(s1)
}
    80001758:	f71ff06f          	j	800016c8 <_ZN6Kernel16handleSystemCallEv+0x80>
            time_sleep((time_t) args);
    8000175c:	00000097          	auipc	ra,0x0
    80001760:	e60080e7          	jalr	-416(ra) # 800015bc <_ZN6Kernel10time_sleepEm>
    __asm__ volatile ("sd a0, 10 * 8(%[context])" : : [context] "r"(context));
    80001764:	04a4b823          	sd	a0,80(s1)
}
    80001768:	f61ff06f          	j	800016c8 <_ZN6Kernel16handleSystemCallEv+0x80>
            getc();
    8000176c:	00000097          	auipc	ra,0x0
    80001770:	e8c080e7          	jalr	-372(ra) # 800015f8 <_ZN6Kernel4getcEv>
    __asm__ volatile ("sd a0, 10 * 8(%[context])" : : [context] "r"(context));
    80001774:	04a4b823          	sd	a0,80(s1)
}
    80001778:	f51ff06f          	j	800016c8 <_ZN6Kernel16handleSystemCallEv+0x80>
            putc((uint64) args);
    8000177c:	0ff57513          	andi	a0,a0,255
    80001780:	00000097          	auipc	ra,0x0
    80001784:	ea0080e7          	jalr	-352(ra) # 80001620 <_ZN6Kernel4putcEc>
            break;
    80001788:	f41ff06f          	j	800016c8 <_ZN6Kernel16handleSystemCallEv+0x80>
            kprintString("Unknown system call: ");
    8000178c:	00007517          	auipc	a0,0x7
    80001790:	89450513          	addi	a0,a0,-1900 # 80008020 <CONSOLE_STATUS+0x10>
    80001794:	00001097          	auipc	ra,0x1
    80001798:	064080e7          	jalr	100(ra) # 800027f8 <_Z12kprintStringPKc>
            kprintUnsigned(code);
    8000179c:	00090513          	mv	a0,s2
    800017a0:	00001097          	auipc	ra,0x1
    800017a4:	15c080e7          	jalr	348(ra) # 800028fc <_Z14kprintUnsignedm>
            kprintString("\n");
    800017a8:	00007517          	auipc	a0,0x7
    800017ac:	9e050513          	addi	a0,a0,-1568 # 80008188 <CONSOLE_STATUS+0x178>
    800017b0:	00001097          	auipc	ra,0x1
    800017b4:	048080e7          	jalr	72(ra) # 800027f8 <_Z12kprintStringPKc>
            return;
    800017b8:	f11ff06f          	j	800016c8 <_ZN6Kernel16handleSystemCallEv+0x80>

00000000800017bc <_ZN15KernelSemaphore5blockEv>:
#include "../h/Riscv.h"
#include "../h/TCB.h"
#include "../h/Scheduler.h"
#include "../h/SysPrint.h"

void KernelSemaphore::block() {
    800017bc:	fe010113          	addi	sp,sp,-32
    800017c0:	00113c23          	sd	ra,24(sp)
    800017c4:	00813823          	sd	s0,16(sp)
    800017c8:	00913423          	sd	s1,8(sp)
    800017cc:	02010413          	addi	s0,sp,32
    blockedThreadQueue.addLast(TCB::running->getNode());
    800017d0:	00008497          	auipc	s1,0x8
    800017d4:	6004b483          	ld	s1,1536(s1) # 80009dd0 <_GLOBAL_OFFSET_TABLE_+0x28>
    800017d8:	0004b583          	ld	a1,0(s1)
    800017dc:	0a058593          	addi	a1,a1,160
    800017e0:	00850513          	addi	a0,a0,8
    800017e4:	00002097          	auipc	ra,0x2
    800017e8:	a18080e7          	jalr	-1512(ra) # 800031fc <_ZN10ThreadList7addLastEP10ThreadNode>
    // setjmp
    TCB::running->setBlocked();
    800017ec:	0004b783          	ld	a5,0(s1)
        status = BLOCKED;
    800017f0:	00200713          	li	a4,2
    800017f4:	04e7a023          	sw	a4,64(a5)
    TCB::dispatch();
    800017f8:	00001097          	auipc	ra,0x1
    800017fc:	3ac080e7          	jalr	940(ra) # 80002ba4 <_ZN3TCB8dispatchEv>
}
    80001800:	01813083          	ld	ra,24(sp)
    80001804:	01013403          	ld	s0,16(sp)
    80001808:	00813483          	ld	s1,8(sp)
    8000180c:	02010113          	addi	sp,sp,32
    80001810:	00008067          	ret

0000000080001814 <_ZN15KernelSemaphore7deblockEv>:
    ThreadList(const ThreadList &) = delete;

    ThreadList &operator=(const ThreadList &) = delete;

    int getCount() const {
        return size;
    80001814:	02052783          	lw	a5,32(a0)

void KernelSemaphore::deblock() {
    if (!blockedThreadQueue.getCount()) return;
    80001818:	00079463          	bnez	a5,80001820 <_ZN15KernelSemaphore7deblockEv+0xc>
    8000181c:	00008067          	ret
void KernelSemaphore::deblock() {
    80001820:	ff010113          	addi	sp,sp,-16
    80001824:	00113423          	sd	ra,8(sp)
    80001828:	00813023          	sd	s0,0(sp)
    8000182c:	01010413          	addi	s0,sp,16
    TCB *tcb = blockedThreadQueue.removeFirst();
    80001830:	00850513          	addi	a0,a0,8
    80001834:	00002097          	auipc	ra,0x2
    80001838:	a0c080e7          	jalr	-1524(ra) # 80003240 <_ZN10ThreadList11removeFirstEv>
        status = READY;
    8000183c:	04052023          	sw	zero,64(a0)
//    if (!tcb) {
//        kprintString("Queue empty!\n");
//        return;
//    }
    tcb->setReady();
    Scheduler::put(tcb);
    80001840:	00001097          	auipc	ra,0x1
    80001844:	b18080e7          	jalr	-1256(ra) # 80002358 <_ZN9Scheduler3putEP3TCB>
}
    80001848:	00813083          	ld	ra,8(sp)
    8000184c:	00013403          	ld	s0,0(sp)
    80001850:	01010113          	addi	sp,sp,16
    80001854:	00008067          	ret

0000000080001858 <_ZN15KernelSemaphore4waitEv>:

void KernelSemaphore::wait() {
    80001858:	fe010113          	addi	sp,sp,-32
    8000185c:	00113c23          	sd	ra,24(sp)
    80001860:	00813823          	sd	s0,16(sp)
    80001864:	02010413          	addi	s0,sp,32
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80001868:	100027f3          	csrr	a5,sstatus
    8000186c:	fef43023          	sd	a5,-32(s0)
    return sstatus;
    80001870:	fe043783          	ld	a5,-32(s0)
    lock()
    80001874:	fef43423          	sd	a5,-24(s0)
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80001878:	00200793          	li	a5,2
    8000187c:	1007b073          	csrc	sstatus,a5
    if (--val < 0) block();
    80001880:	00052783          	lw	a5,0(a0)
    80001884:	fff7879b          	addiw	a5,a5,-1
    80001888:	00f52023          	sw	a5,0(a0)
    8000188c:	02079713          	slli	a4,a5,0x20
    80001890:	00074e63          	bltz	a4,800018ac <_ZN15KernelSemaphore4waitEv+0x54>
    unlock()
    80001894:	fe843783          	ld	a5,-24(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80001898:	10079073          	csrw	sstatus,a5
}
    8000189c:	01813083          	ld	ra,24(sp)
    800018a0:	01013403          	ld	s0,16(sp)
    800018a4:	02010113          	addi	sp,sp,32
    800018a8:	00008067          	ret
    if (--val < 0) block();
    800018ac:	00000097          	auipc	ra,0x0
    800018b0:	f10080e7          	jalr	-240(ra) # 800017bc <_ZN15KernelSemaphore5blockEv>
    800018b4:	fe1ff06f          	j	80001894 <_ZN15KernelSemaphore4waitEv+0x3c>

00000000800018b8 <_ZN15KernelSemaphore6signalEv>:

void KernelSemaphore::signal() {
    800018b8:	fe010113          	addi	sp,sp,-32
    800018bc:	00113c23          	sd	ra,24(sp)
    800018c0:	00813823          	sd	s0,16(sp)
    800018c4:	02010413          	addi	s0,sp,32
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    800018c8:	100027f3          	csrr	a5,sstatus
    800018cc:	fef43023          	sd	a5,-32(s0)
    return sstatus;
    800018d0:	fe043783          	ld	a5,-32(s0)
    lock()
    800018d4:	fef43423          	sd	a5,-24(s0)
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    800018d8:	00200793          	li	a5,2
    800018dc:	1007b073          	csrc	sstatus,a5
    if (val++ < 0) deblock();
    800018e0:	00052783          	lw	a5,0(a0)
    800018e4:	0017871b          	addiw	a4,a5,1
    800018e8:	00e52023          	sw	a4,0(a0)
    800018ec:	0007ce63          	bltz	a5,80001908 <_ZN15KernelSemaphore6signalEv+0x50>
    unlock()
    800018f0:	fe843783          	ld	a5,-24(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    800018f4:	10079073          	csrw	sstatus,a5
}
    800018f8:	01813083          	ld	ra,24(sp)
    800018fc:	01013403          	ld	s0,16(sp)
    80001900:	02010113          	addi	sp,sp,32
    80001904:	00008067          	ret
    if (val++ < 0) deblock();
    80001908:	00000097          	auipc	ra,0x0
    8000190c:	f0c080e7          	jalr	-244(ra) # 80001814 <_ZN15KernelSemaphore7deblockEv>
    80001910:	fe1ff06f          	j	800018f0 <_ZN15KernelSemaphore6signalEv+0x38>

0000000080001914 <_ZN15KernelSemaphoreD1Ev>:

KernelSemaphore::~KernelSemaphore() {
    80001914:	fd010113          	addi	sp,sp,-48
    80001918:	02113423          	sd	ra,40(sp)
    8000191c:	02813023          	sd	s0,32(sp)
    80001920:	00913c23          	sd	s1,24(sp)
    80001924:	03010413          	addi	s0,sp,48
    80001928:	00050493          	mv	s1,a0
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    8000192c:	100027f3          	csrr	a5,sstatus
    80001930:	fcf43c23          	sd	a5,-40(s0)
    return sstatus;
    80001934:	fd843783          	ld	a5,-40(s0)
    lock()
    80001938:	fcf43823          	sd	a5,-48(s0)
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    8000193c:	00200793          	li	a5,2
    80001940:	1007b073          	csrc	sstatus,a5
    80001944:	0204a783          	lw	a5,32(s1)
    while (blockedThreadQueue.getCount() != 0)
    80001948:	00078a63          	beqz	a5,8000195c <_ZN15KernelSemaphoreD1Ev+0x48>
        deblock();
    8000194c:	00048513          	mv	a0,s1
    80001950:	00000097          	auipc	ra,0x0
    80001954:	ec4080e7          	jalr	-316(ra) # 80001814 <_ZN15KernelSemaphore7deblockEv>
    while (blockedThreadQueue.getCount() != 0)
    80001958:	fedff06f          	j	80001944 <_ZN15KernelSemaphoreD1Ev+0x30>
    unlock()
    8000195c:	fd043783          	ld	a5,-48(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80001960:	10079073          	csrw	sstatus,a5
    val = 0;
    80001964:	0004a023          	sw	zero,0(s1)
KernelSemaphore::~KernelSemaphore() {
    80001968:	00848513          	addi	a0,s1,8
    8000196c:	00002097          	auipc	ra,0x2
    80001970:	a78080e7          	jalr	-1416(ra) # 800033e4 <_ZN10ThreadListD1Ev>
}
    80001974:	02813083          	ld	ra,40(sp)
    80001978:	02013403          	ld	s0,32(sp)
    8000197c:	01813483          	ld	s1,24(sp)
    80001980:	03010113          	addi	sp,sp,48
    80001984:	00008067          	ret

0000000080001988 <_ZZ4mainENUlPvE_4_FUNES_>:
    kprintString("Starting main\n");
    TCB *main = TCB::createThread(nullptr, nullptr);
    kprintString("Created main thread\n");
    TCB::running = main;

    TCB *uMain = TCB::createThread([](void *){userMain();}, nullptr);
    80001988:	ff010113          	addi	sp,sp,-16
    8000198c:	00113423          	sd	ra,8(sp)
    80001990:	00813023          	sd	s0,0(sp)
    80001994:	01010413          	addi	s0,sp,16
    80001998:	00003097          	auipc	ra,0x3
    8000199c:	41c080e7          	jalr	1052(ra) # 80004db4 <_Z8userMainv>
    800019a0:	00813083          	ld	ra,8(sp)
    800019a4:	00013403          	ld	s0,0(sp)
    800019a8:	01010113          	addi	sp,sp,16
    800019ac:	00008067          	ret

00000000800019b0 <main>:
int main() {
    800019b0:	fe010113          	addi	sp,sp,-32
    800019b4:	00113c23          	sd	ra,24(sp)
    800019b8:	00813823          	sd	s0,16(sp)
    800019bc:	00913423          	sd	s1,8(sp)
    800019c0:	02010413          	addi	s0,sp,32
    kprintString("Starting main\n");
    800019c4:	00006517          	auipc	a0,0x6
    800019c8:	78450513          	addi	a0,a0,1924 # 80008148 <CONSOLE_STATUS+0x138>
    800019cc:	00001097          	auipc	ra,0x1
    800019d0:	e2c080e7          	jalr	-468(ra) # 800027f8 <_Z12kprintStringPKc>
    TCB *main = TCB::createThread(nullptr, nullptr);
    800019d4:	00000593          	li	a1,0
    800019d8:	00000513          	li	a0,0
    800019dc:	00001097          	auipc	ra,0x1
    800019e0:	13c080e7          	jalr	316(ra) # 80002b18 <_ZN3TCB12createThreadEPFvPvES0_>
    800019e4:	00050493          	mv	s1,a0
    kprintString("Created main thread\n");
    800019e8:	00006517          	auipc	a0,0x6
    800019ec:	77050513          	addi	a0,a0,1904 # 80008158 <CONSOLE_STATUS+0x148>
    800019f0:	00001097          	auipc	ra,0x1
    800019f4:	e08080e7          	jalr	-504(ra) # 800027f8 <_Z12kprintStringPKc>
    TCB::running = main;
    800019f8:	00008797          	auipc	a5,0x8
    800019fc:	3d87b783          	ld	a5,984(a5) # 80009dd0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001a00:	0097b023          	sd	s1,0(a5)
    TCB *uMain = TCB::createThread([](void *){userMain();}, nullptr);
    80001a04:	00000593          	li	a1,0
    80001a08:	00000517          	auipc	a0,0x0
    80001a0c:	f8050513          	addi	a0,a0,-128 # 80001988 <_ZZ4mainENUlPvE_4_FUNES_>
    80001a10:	00001097          	auipc	ra,0x1
    80001a14:	108080e7          	jalr	264(ra) # 80002b18 <_ZN3TCB12createThreadEPFvPvES0_>
    80001a18:	00050493          	mv	s1,a0
    kprintString("Created user main thread\n");
    80001a1c:	00006517          	auipc	a0,0x6
    80001a20:	75450513          	addi	a0,a0,1876 # 80008170 <CONSOLE_STATUS+0x160>
    80001a24:	00001097          	auipc	ra,0x1
    80001a28:	dd4080e7          	jalr	-556(ra) # 800027f8 <_Z12kprintStringPKc>

    Riscv::w_stvec((uint64) &Riscv::supervisorTrap);
    80001a2c:	00008797          	auipc	a5,0x8
    80001a30:	38c7b783          	ld	a5,908(a5) # 80009db8 <_GLOBAL_OFFSET_TABLE_+0x10>
    __asm__ volatile ("csrw stvec, %[stvec]" : : [stvec] "r"(stvec));
    80001a34:	10579073          	csrw	stvec,a5

    uMain->join();
    80001a38:	00048513          	mv	a0,s1
    80001a3c:	00001097          	auipc	ra,0x1
    80001a40:	308080e7          	jalr	776(ra) # 80002d44 <_ZN3TCB4joinEv>
    int join();

    static TCB *createThread(Body body, void *args);

    static void yield() {
        __asm__ volatile ("ecall");
    80001a44:	00000073          	ecall
    TCB::yield();

    delete ThreadCollector::getInstance();
    80001a48:	00001097          	auipc	ra,0x1
    80001a4c:	5a0080e7          	jalr	1440(ra) # 80002fe8 <_ZN15ThreadCollector11getInstanceEv>
    80001a50:	00050e63          	beqz	a0,80001a6c <main+0xbc>
    80001a54:	00050493          	mv	s1,a0
    80001a58:	00001097          	auipc	ra,0x1
    80001a5c:	4e4080e7          	jalr	1252(ra) # 80002f3c <_ZN15ThreadCollectorD1Ev>
    80001a60:	00048513          	mv	a0,s1
    80001a64:	00000097          	auipc	ra,0x0
    80001a68:	480080e7          	jalr	1152(ra) # 80001ee4 <_Z5kfreePv>
    delete IdleThread::getInstance();
    80001a6c:	fffff097          	auipc	ra,0xfffff
    80001a70:	7c0080e7          	jalr	1984(ra) # 8000122c <_ZN10IdleThread11getInstanceEv>
    80001a74:	00050493          	mv	s1,a0
    80001a78:	00050c63          	beqz	a0,80001a90 <main+0xe0>
    80001a7c:	00000097          	auipc	ra,0x0
    80001a80:	86c080e7          	jalr	-1940(ra) # 800012e8 <_ZN10IdleThreadD1Ev>
    80001a84:	00048513          	mv	a0,s1
    80001a88:	00000097          	auipc	ra,0x0
    80001a8c:	45c080e7          	jalr	1116(ra) # 80001ee4 <_Z5kfreePv>
    delete TimerInterrupt::getInstance();
    80001a90:	00002097          	auipc	ra,0x2
    80001a94:	96c080e7          	jalr	-1684(ra) # 800033fc <_ZN14TimerInterrupt11getInstanceEv>
    80001a98:	00050493          	mv	s1,a0
    80001a9c:	00050c63          	beqz	a0,80001ab4 <main+0x104>
    80001aa0:	00002097          	auipc	ra,0x2
    80001aa4:	ba8080e7          	jalr	-1112(ra) # 80003648 <_ZN14TimerInterruptD1Ev>
    80001aa8:	00048513          	mv	a0,s1
    80001aac:	00000097          	auipc	ra,0x0
    80001ab0:	438080e7          	jalr	1080(ra) # 80001ee4 <_Z5kfreePv>
    delete Scheduler::getInstance();
    80001ab4:	00000097          	auipc	ra,0x0
    80001ab8:	7b8080e7          	jalr	1976(ra) # 8000226c <_ZN9Scheduler11getInstanceEv>
    80001abc:	00050493          	mv	s1,a0
    80001ac0:	00050c63          	beqz	a0,80001ad8 <main+0x128>
    80001ac4:	00001097          	auipc	ra,0x1
    80001ac8:	900080e7          	jalr	-1792(ra) # 800023c4 <_ZN9SchedulerD1Ev>
    80001acc:	00048513          	mv	a0,s1
    80001ad0:	00000097          	auipc	ra,0x0
    80001ad4:	414080e7          	jalr	1044(ra) # 80001ee4 <_Z5kfreePv>

    kprintString("Main finished\n");
    80001ad8:	00006517          	auipc	a0,0x6
    80001adc:	6b850513          	addi	a0,a0,1720 # 80008190 <CONSOLE_STATUS+0x180>
    80001ae0:	00001097          	auipc	ra,0x1
    80001ae4:	d18080e7          	jalr	-744(ra) # 800027f8 <_Z12kprintStringPKc>

    return 0;
}
    80001ae8:	00000513          	li	a0,0
    80001aec:	01813083          	ld	ra,24(sp)
    80001af0:	01013403          	ld	s0,16(sp)
    80001af4:	00813483          	ld	s1,8(sp)
    80001af8:	02010113          	addi	sp,sp,32
    80001afc:	00008067          	ret

0000000080001b00 <_ZN15MemoryAllocator19initMemoryAllocatorEv>:
#include "../h/SysPrint.h"
#include "../h/Mutex.h"

MemoryAllocator *MemoryAllocator::instance = nullptr;

void MemoryAllocator::initMemoryAllocator() {
    80001b00:	ff010113          	addi	sp,sp,-16
    80001b04:	00813423          	sd	s0,8(sp)
    80001b08:	01010413          	addi	s0,sp,16
    instance = (MemoryAllocator *) HEAP_START_ADDR;
    80001b0c:	00008617          	auipc	a2,0x8
    80001b10:	2a463603          	ld	a2,676(a2) # 80009db0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001b14:	00063783          	ld	a5,0(a2)
    80001b18:	00008717          	auipc	a4,0x8
    80001b1c:	31070713          	addi	a4,a4,784 # 80009e28 <_ZN15MemoryAllocator8instanceE>
    80001b20:	00f73023          	sd	a5,0(a4)

    instance->mutex = (Mutex *) ((uint8 *) HEAP_START_ADDR + sizeof(MemoryAllocator));
    80001b24:	01078693          	addi	a3,a5,16
    80001b28:	00d7b423          	sd	a3,8(a5)
    instance->mutex->val = 1;
    80001b2c:	00100693          	li	a3,1
    80001b30:	00d7a823          	sw	a3,16(a5)
    instance->freeMemHead = (BlockHeader *) ((uint8 *) HEAP_START_ADDR + sizeof(MemoryAllocator) + sizeof(Mutex));
    80001b34:	04078593          	addi	a1,a5,64
    80001b38:	00b7b023          	sd	a1,0(a5)
    instance->freeMemHead->size = (size_t) ((uint8 *) HEAP_END_ADDR - (uint8 *) HEAP_START_ADDR -
    80001b3c:	00008797          	auipc	a5,0x8
    80001b40:	29c7b783          	ld	a5,668(a5) # 80009dd8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001b44:	0007b783          	ld	a5,0(a5)
    80001b48:	00063603          	ld	a2,0(a2)
    80001b4c:	40c787b3          	sub	a5,a5,a2
    80001b50:	00073603          	ld	a2,0(a4)
    80001b54:	00063603          	ld	a2,0(a2)
                                  sizeof(MemoryAllocator) - sizeof(BlockHeader) - sizeof(Mutex));
    80001b58:	fa878793          	addi	a5,a5,-88
    instance->freeMemHead->size = (size_t) ((uint8 *) HEAP_END_ADDR - (uint8 *) HEAP_START_ADDR -
    80001b5c:	00f63023          	sd	a5,0(a2)
    instance->freeMemHead->free = true;
    80001b60:	00073783          	ld	a5,0(a4)
    80001b64:	0007b703          	ld	a4,0(a5)
    80001b68:	00d70423          	sb	a3,8(a4)
    instance->freeMemHead->next = nullptr;
    80001b6c:	0007b783          	ld	a5,0(a5)
    80001b70:	0007b823          	sd	zero,16(a5)

//    kprintString("Initializing memory allocator: ");
//    kprintUnsigned(instance->freeMemHead->size);
//    kprintString("\n");

}
    80001b74:	00813403          	ld	s0,8(sp)
    80001b78:	01010113          	addi	sp,sp,16
    80001b7c:	00008067          	ret

0000000080001b80 <_ZN15MemoryAllocator11getInstanceEv>:

MemoryAllocator *MemoryAllocator::getInstance() {
    if (!instance) initMemoryAllocator();
    80001b80:	00008797          	auipc	a5,0x8
    80001b84:	2a87b783          	ld	a5,680(a5) # 80009e28 <_ZN15MemoryAllocator8instanceE>
    80001b88:	00078863          	beqz	a5,80001b98 <_ZN15MemoryAllocator11getInstanceEv+0x18>

    return instance;
}
    80001b8c:	00008517          	auipc	a0,0x8
    80001b90:	29c53503          	ld	a0,668(a0) # 80009e28 <_ZN15MemoryAllocator8instanceE>
    80001b94:	00008067          	ret
MemoryAllocator *MemoryAllocator::getInstance() {
    80001b98:	ff010113          	addi	sp,sp,-16
    80001b9c:	00113423          	sd	ra,8(sp)
    80001ba0:	00813023          	sd	s0,0(sp)
    80001ba4:	01010413          	addi	s0,sp,16
    if (!instance) initMemoryAllocator();
    80001ba8:	00000097          	auipc	ra,0x0
    80001bac:	f58080e7          	jalr	-168(ra) # 80001b00 <_ZN15MemoryAllocator19initMemoryAllocatorEv>
}
    80001bb0:	00008517          	auipc	a0,0x8
    80001bb4:	27853503          	ld	a0,632(a0) # 80009e28 <_ZN15MemoryAllocator8instanceE>
    80001bb8:	00813083          	ld	ra,8(sp)
    80001bbc:	00013403          	ld	s0,0(sp)
    80001bc0:	01010113          	addi	sp,sp,16
    80001bc4:	00008067          	ret

0000000080001bc8 <_ZN15MemoryAllocator6mallocEm>:

void *MemoryAllocator::malloc(size_t size) {
    80001bc8:	fd010113          	addi	sp,sp,-48
    80001bcc:	02113423          	sd	ra,40(sp)
    80001bd0:	02813023          	sd	s0,32(sp)
    80001bd4:	00913c23          	sd	s1,24(sp)
    80001bd8:	01213823          	sd	s2,16(sp)
    80001bdc:	01313423          	sd	s3,8(sp)
    80001be0:	03010413          	addi	s0,sp,48
    // Initial check
    if (!size) return 0;
    80001be4:	0e058e63          	beqz	a1,80001ce0 <_ZN15MemoryAllocator6mallocEm+0x118>
    80001be8:	00050993          	mv	s3,a0

    // Rounding and aligning size to size of memory blocks
    size = ((size - 1) / MEM_BLOCK_SIZE + 1) * MEM_BLOCK_SIZE;
    80001bec:	fff58913          	addi	s2,a1,-1
    80001bf0:	00695913          	srli	s2,s2,0x6
    80001bf4:	00190913          	addi	s2,s2,1
    80001bf8:	00691913          	slli	s2,s2,0x6

    mutex->wait();
    80001bfc:	00853503          	ld	a0,8(a0)
    80001c00:	00000097          	auipc	ra,0x0
    80001c04:	324080e7          	jalr	804(ra) # 80001f24 <_ZN5Mutex4waitEv>
    // Finding suitable free memory block using first fit algorithm
    BlockHeader *curr = freeMemHead, *prev = nullptr;
    80001c08:	0009b483          	ld	s1,0(s3)
    80001c0c:	00000713          	li	a4,0
    int i = 0;
    while (curr && curr->size < size)
    80001c10:	00048c63          	beqz	s1,80001c28 <_ZN15MemoryAllocator6mallocEm+0x60>
    80001c14:	0004b783          	ld	a5,0(s1)
    80001c18:	0127f863          	bgeu	a5,s2,80001c28 <_ZN15MemoryAllocator6mallocEm+0x60>
        prev = curr, curr = curr->next, i++;
    80001c1c:	00048713          	mv	a4,s1
    80001c20:	0104b483          	ld	s1,16(s1)
    while (curr && curr->size < size)
    80001c24:	fedff06f          	j	80001c10 <_ZN15MemoryAllocator6mallocEm+0x48>
    if (!curr)  {
    80001c28:	04048463          	beqz	s1,80001c70 <_ZN15MemoryAllocator6mallocEm+0xa8>
//        kprintString("Failed allocation\n");
        mutex->signal();
        return nullptr;
    }

    size_t remainingSize = curr->size - size;
    80001c2c:	0004b783          	ld	a5,0(s1)
    80001c30:	412787b3          	sub	a5,a5,s2
    curr->size = size;
    80001c34:	0124b023          	sd	s2,0(s1)
    curr->free = false;
    80001c38:	00048423          	sb	zero,8(s1)
    // Allocating new free memory block if enough size is left over
    if (remainingSize >= MEM_BLOCK_SIZE + sizeof(BlockHeader)) {
    80001c3c:	05700693          	li	a3,87
    80001c40:	04f6f463          	bgeu	a3,a5,80001c88 <_ZN15MemoryAllocator6mallocEm+0xc0>
        BlockHeader *elem = (BlockHeader *) ((uint8 *) curr + sizeof(BlockHeader) + size);
    80001c44:	01890913          	addi	s2,s2,24
    80001c48:	01248933          	add	s2,s1,s2
        elem->size = remainingSize - sizeof(BlockHeader);
    80001c4c:	fe878793          	addi	a5,a5,-24
    80001c50:	00f93023          	sd	a5,0(s2)
        elem->free = true;
    80001c54:	00100793          	li	a5,1
    80001c58:	00f90423          	sb	a5,8(s2)
        elem->next = curr->next;
    80001c5c:	0104b783          	ld	a5,16(s1)
    80001c60:	00f93823          	sd	a5,16(s2)
        (!prev ? freeMemHead : prev->next) = elem;
    80001c64:	00070e63          	beqz	a4,80001c80 <_ZN15MemoryAllocator6mallocEm+0xb8>
    80001c68:	01273823          	sd	s2,16(a4)
    80001c6c:	0340006f          	j	80001ca0 <_ZN15MemoryAllocator6mallocEm+0xd8>
        mutex->signal();
    80001c70:	0089b503          	ld	a0,8(s3)
    80001c74:	00000097          	auipc	ra,0x0
    80001c78:	324080e7          	jalr	804(ra) # 80001f98 <_ZN5Mutex6signalEv>
        return nullptr;
    80001c7c:	0380006f          	j	80001cb4 <_ZN15MemoryAllocator6mallocEm+0xec>
        (!prev ? freeMemHead : prev->next) = elem;
    80001c80:	0129b023          	sd	s2,0(s3)
    80001c84:	01c0006f          	j	80001ca0 <_ZN15MemoryAllocator6mallocEm+0xd8>
    } else {
        // Removing whole free memory block from free memory list
        (!prev ? freeMemHead : prev->next) = curr->next;
    80001c88:	04070663          	beqz	a4,80001cd4 <_ZN15MemoryAllocator6mallocEm+0x10c>
    80001c8c:	0104b683          	ld	a3,16(s1)
    80001c90:	00d73823          	sd	a3,16(a4)
        curr->size += remainingSize;
    80001c94:	0004b703          	ld	a4,0(s1)
    80001c98:	00f707b3          	add	a5,a4,a5
    80001c9c:	00f4b023          	sd	a5,0(s1)
    }
    curr->next = nullptr;
    80001ca0:	0004b823          	sd	zero,16(s1)

    // Free memory start address after segment descriptor of allocated memory block
    void *addr = (uint8 *) curr + sizeof(BlockHeader);
    80001ca4:	01848493          	addi	s1,s1,24
//
//    (!prev ? allocMemHead : prev->next) = curr;
//    curr->next = next;
    //

    mutex->signal();
    80001ca8:	0089b503          	ld	a0,8(s3)
    80001cac:	00000097          	auipc	ra,0x0
    80001cb0:	2ec080e7          	jalr	748(ra) # 80001f98 <_ZN5Mutex6signalEv>

    return addr;
}
    80001cb4:	00048513          	mv	a0,s1
    80001cb8:	02813083          	ld	ra,40(sp)
    80001cbc:	02013403          	ld	s0,32(sp)
    80001cc0:	01813483          	ld	s1,24(sp)
    80001cc4:	01013903          	ld	s2,16(sp)
    80001cc8:	00813983          	ld	s3,8(sp)
    80001ccc:	03010113          	addi	sp,sp,48
    80001cd0:	00008067          	ret
        (!prev ? freeMemHead : prev->next) = curr->next;
    80001cd4:	0104b703          	ld	a4,16(s1)
    80001cd8:	00e9b023          	sd	a4,0(s3)
    80001cdc:	fb9ff06f          	j	80001c94 <_ZN15MemoryAllocator6mallocEm+0xcc>
    if (!size) return 0;
    80001ce0:	00000493          	li	s1,0
    80001ce4:	fd1ff06f          	j	80001cb4 <_ZN15MemoryAllocator6mallocEm+0xec>

0000000080001ce8 <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE>:
    mutex->signal();

    return 0;
}

int MemoryAllocator::tryToJoin(MemoryAllocator::BlockHeader *curr) {
    80001ce8:	ff010113          	addi	sp,sp,-16
    80001cec:	00813423          	sd	s0,8(sp)
    80001cf0:	01010413          	addi	s0,sp,16
    if (!curr || !curr->next) return -1;
    80001cf4:	04050263          	beqz	a0,80001d38 <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE+0x50>
    80001cf8:	01053703          	ld	a4,16(a0)
    80001cfc:	04070263          	beqz	a4,80001d40 <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE+0x58>

    if ((uint8 *) curr + sizeof(BlockHeader) + curr->size != (uint8 *) curr->next) return -2;
    80001d00:	00053783          	ld	a5,0(a0)
    80001d04:	01878693          	addi	a3,a5,24
    80001d08:	00d506b3          	add	a3,a0,a3
    80001d0c:	02d71e63          	bne	a4,a3,80001d48 <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE+0x60>

    curr->size += curr->next->size + sizeof(BlockHeader);
    80001d10:	00073683          	ld	a3,0(a4)
    80001d14:	00d787b3          	add	a5,a5,a3
    80001d18:	01878793          	addi	a5,a5,24
    80001d1c:	00f53023          	sd	a5,0(a0)
    curr->next = curr->next->next;
    80001d20:	01073783          	ld	a5,16(a4)
    80001d24:	00f53823          	sd	a5,16(a0)

    return 0;
    80001d28:	00000513          	li	a0,0
}
    80001d2c:	00813403          	ld	s0,8(sp)
    80001d30:	01010113          	addi	sp,sp,16
    80001d34:	00008067          	ret
    if (!curr || !curr->next) return -1;
    80001d38:	fff00513          	li	a0,-1
    80001d3c:	ff1ff06f          	j	80001d2c <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE+0x44>
    80001d40:	fff00513          	li	a0,-1
    80001d44:	fe9ff06f          	j	80001d2c <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE+0x44>
    if ((uint8 *) curr + sizeof(BlockHeader) + curr->size != (uint8 *) curr->next) return -2;
    80001d48:	ffe00513          	li	a0,-2
    80001d4c:	fe1ff06f          	j	80001d2c <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE+0x44>

0000000080001d50 <_ZN15MemoryAllocator4freeEPv>:
    if (!addr
    80001d50:	10058a63          	beqz	a1,80001e64 <_ZN15MemoryAllocator4freeEPv+0x114>
int MemoryAllocator::free(void *addr) {
    80001d54:	fd010113          	addi	sp,sp,-48
    80001d58:	02113423          	sd	ra,40(sp)
    80001d5c:	02813023          	sd	s0,32(sp)
    80001d60:	00913c23          	sd	s1,24(sp)
    80001d64:	01213823          	sd	s2,16(sp)
    80001d68:	01313423          	sd	s3,8(sp)
    80001d6c:	01413023          	sd	s4,0(sp)
    80001d70:	03010413          	addi	s0,sp,48
    80001d74:	00050a13          	mv	s4,a0
    80001d78:	00058913          	mv	s2,a1
        || (uint8 *) addr < (uint8 *) HEAP_START_ADDR + sizeof(MemoryAllocator) + sizeof(BlockHeader) + sizeof(Mutex)
    80001d7c:	00008797          	auipc	a5,0x8
    80001d80:	0347b783          	ld	a5,52(a5) # 80009db0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001d84:	0007b783          	ld	a5,0(a5)
    80001d88:	05878793          	addi	a5,a5,88
    80001d8c:	0ef5e063          	bltu	a1,a5,80001e6c <_ZN15MemoryAllocator4freeEPv+0x11c>
        || addr >= HEAP_END_ADDR) {
    80001d90:	00008797          	auipc	a5,0x8
    80001d94:	0487b783          	ld	a5,72(a5) # 80009dd8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001d98:	0007b783          	ld	a5,0(a5)
    80001d9c:	0cf5fc63          	bgeu	a1,a5,80001e74 <_ZN15MemoryAllocator4freeEPv+0x124>
    BlockHeader *elem = (BlockHeader *) ((uint8 *) addr - sizeof(BlockHeader));
    80001da0:	fe858993          	addi	s3,a1,-24
    if (!elem || elem->free || elem->next) {
    80001da4:	0c098c63          	beqz	s3,80001e7c <_ZN15MemoryAllocator4freeEPv+0x12c>
    80001da8:	ff05c783          	lbu	a5,-16(a1)
    80001dac:	0c079c63          	bnez	a5,80001e84 <_ZN15MemoryAllocator4freeEPv+0x134>
    80001db0:	ff85b483          	ld	s1,-8(a1)
    80001db4:	0c049c63          	bnez	s1,80001e8c <_ZN15MemoryAllocator4freeEPv+0x13c>
    mutex->wait();
    80001db8:	00853503          	ld	a0,8(a0)
    80001dbc:	00000097          	auipc	ra,0x0
    80001dc0:	168080e7          	jalr	360(ra) # 80001f24 <_ZN5Mutex4waitEv>
    BlockHeader *curr = freeMemHead, *prev = nullptr;
    80001dc4:	000a3783          	ld	a5,0(s4)
    while (curr && curr < elem)
    80001dc8:	00078a63          	beqz	a5,80001ddc <_ZN15MemoryAllocator4freeEPv+0x8c>
    80001dcc:	0137f863          	bgeu	a5,s3,80001ddc <_ZN15MemoryAllocator4freeEPv+0x8c>
        prev = curr, curr = curr->next;
    80001dd0:	00078493          	mv	s1,a5
    80001dd4:	0107b783          	ld	a5,16(a5)
    while (curr && curr < elem)
    80001dd8:	ff1ff06f          	j	80001dc8 <_ZN15MemoryAllocator4freeEPv+0x78>
    if ((prev && (uint8 *) prev + prev->size + sizeof(BlockHeader) > addr)
    80001ddc:	00048a63          	beqz	s1,80001df0 <_ZN15MemoryAllocator4freeEPv+0xa0>
    80001de0:	0004b703          	ld	a4,0(s1)
    80001de4:	01870713          	addi	a4,a4,24
    80001de8:	00e48733          	add	a4,s1,a4
    80001dec:	0ae96463          	bltu	s2,a4,80001e94 <_ZN15MemoryAllocator4freeEPv+0x144>
        || (curr && (uint8 *) addr + elem->size  > (uint8 *) curr)) {
    80001df0:	00078863          	beqz	a5,80001e00 <_ZN15MemoryAllocator4freeEPv+0xb0>
    80001df4:	fe893703          	ld	a4,-24(s2)
    80001df8:	00e90733          	add	a4,s2,a4
    80001dfc:	0ae7e063          	bltu	a5,a4,80001e9c <_ZN15MemoryAllocator4freeEPv+0x14c>
    elem->next = curr;
    80001e00:	fef93c23          	sd	a5,-8(s2)
    elem->free = true;
    80001e04:	00100793          	li	a5,1
    80001e08:	fef90823          	sb	a5,-16(s2)
    (!prev ? freeMemHead : prev->next) = elem;
    80001e0c:	04048863          	beqz	s1,80001e5c <_ZN15MemoryAllocator4freeEPv+0x10c>
    80001e10:	0134b823          	sd	s3,16(s1)
    tryToJoin(elem);
    80001e14:	00098513          	mv	a0,s3
    80001e18:	00000097          	auipc	ra,0x0
    80001e1c:	ed0080e7          	jalr	-304(ra) # 80001ce8 <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE>
    tryToJoin(prev);
    80001e20:	00048513          	mv	a0,s1
    80001e24:	00000097          	auipc	ra,0x0
    80001e28:	ec4080e7          	jalr	-316(ra) # 80001ce8 <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE>
    mutex->signal();
    80001e2c:	008a3503          	ld	a0,8(s4)
    80001e30:	00000097          	auipc	ra,0x0
    80001e34:	168080e7          	jalr	360(ra) # 80001f98 <_ZN5Mutex6signalEv>
    return 0;
    80001e38:	00000513          	li	a0,0
}
    80001e3c:	02813083          	ld	ra,40(sp)
    80001e40:	02013403          	ld	s0,32(sp)
    80001e44:	01813483          	ld	s1,24(sp)
    80001e48:	01013903          	ld	s2,16(sp)
    80001e4c:	00813983          	ld	s3,8(sp)
    80001e50:	00013a03          	ld	s4,0(sp)
    80001e54:	03010113          	addi	sp,sp,48
    80001e58:	00008067          	ret
    (!prev ? freeMemHead : prev->next) = elem;
    80001e5c:	013a3023          	sd	s3,0(s4)
    80001e60:	fb5ff06f          	j	80001e14 <_ZN15MemoryAllocator4freeEPv+0xc4>
        return -1;
    80001e64:	fff00513          	li	a0,-1
}
    80001e68:	00008067          	ret
        return -1;
    80001e6c:	fff00513          	li	a0,-1
    80001e70:	fcdff06f          	j	80001e3c <_ZN15MemoryAllocator4freeEPv+0xec>
    80001e74:	fff00513          	li	a0,-1
    80001e78:	fc5ff06f          	j	80001e3c <_ZN15MemoryAllocator4freeEPv+0xec>
        return -2;
    80001e7c:	ffe00513          	li	a0,-2
    80001e80:	fbdff06f          	j	80001e3c <_ZN15MemoryAllocator4freeEPv+0xec>
    80001e84:	ffe00513          	li	a0,-2
    80001e88:	fb5ff06f          	j	80001e3c <_ZN15MemoryAllocator4freeEPv+0xec>
    80001e8c:	ffe00513          	li	a0,-2
    80001e90:	fadff06f          	j	80001e3c <_ZN15MemoryAllocator4freeEPv+0xec>
        return -2;
    80001e94:	ffe00513          	li	a0,-2
    80001e98:	fa5ff06f          	j	80001e3c <_ZN15MemoryAllocator4freeEPv+0xec>
    80001e9c:	ffe00513          	li	a0,-2
    80001ea0:	f9dff06f          	j	80001e3c <_ZN15MemoryAllocator4freeEPv+0xec>

0000000080001ea4 <_Z7kmallocm>:

void *kmalloc(size_t size) {
    80001ea4:	fe010113          	addi	sp,sp,-32
    80001ea8:	00113c23          	sd	ra,24(sp)
    80001eac:	00813823          	sd	s0,16(sp)
    80001eb0:	00913423          	sd	s1,8(sp)
    80001eb4:	02010413          	addi	s0,sp,32
    80001eb8:	00050493          	mv	s1,a0
    return MemoryAllocator::getInstance()->malloc(size);
    80001ebc:	00000097          	auipc	ra,0x0
    80001ec0:	cc4080e7          	jalr	-828(ra) # 80001b80 <_ZN15MemoryAllocator11getInstanceEv>
    80001ec4:	00048593          	mv	a1,s1
    80001ec8:	00000097          	auipc	ra,0x0
    80001ecc:	d00080e7          	jalr	-768(ra) # 80001bc8 <_ZN15MemoryAllocator6mallocEm>
}
    80001ed0:	01813083          	ld	ra,24(sp)
    80001ed4:	01013403          	ld	s0,16(sp)
    80001ed8:	00813483          	ld	s1,8(sp)
    80001edc:	02010113          	addi	sp,sp,32
    80001ee0:	00008067          	ret

0000000080001ee4 <_Z5kfreePv>:

int kfree(void *addr) {
    80001ee4:	fe010113          	addi	sp,sp,-32
    80001ee8:	00113c23          	sd	ra,24(sp)
    80001eec:	00813823          	sd	s0,16(sp)
    80001ef0:	00913423          	sd	s1,8(sp)
    80001ef4:	02010413          	addi	s0,sp,32
    80001ef8:	00050493          	mv	s1,a0
    return MemoryAllocator::getInstance()->free(addr);
    80001efc:	00000097          	auipc	ra,0x0
    80001f00:	c84080e7          	jalr	-892(ra) # 80001b80 <_ZN15MemoryAllocator11getInstanceEv>
    80001f04:	00048593          	mv	a1,s1
    80001f08:	00000097          	auipc	ra,0x0
    80001f0c:	e48080e7          	jalr	-440(ra) # 80001d50 <_ZN15MemoryAllocator4freeEPv>
}
    80001f10:	01813083          	ld	ra,24(sp)
    80001f14:	01013403          	ld	s0,16(sp)
    80001f18:	00813483          	ld	s1,8(sp)
    80001f1c:	02010113          	addi	sp,sp,32
    80001f20:	00008067          	ret

0000000080001f24 <_ZN5Mutex4waitEv>:
#include "../h/Mutex.h"
#include "../h/TCB.h"
#include "../h/SysPrint.h"
#include "../h/Riscv.h"

void Mutex::wait() {
    80001f24:	fd010113          	addi	sp,sp,-48
    80001f28:	02113423          	sd	ra,40(sp)
    80001f2c:	02813023          	sd	s0,32(sp)
    80001f30:	00913c23          	sd	s1,24(sp)
    80001f34:	03010413          	addi	s0,sp,48
    80001f38:	00050493          	mv	s1,a0
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80001f3c:	100027f3          	csrr	a5,sstatus
    80001f40:	fcf43823          	sd	a5,-48(s0)
    return sstatus;
    80001f44:	fd043783          	ld	a5,-48(s0)
    lock()
    80001f48:	fcf43c23          	sd	a5,-40(s0)
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80001f4c:	00200793          	li	a5,2
    80001f50:	1007b073          	csrc	sstatus,a5
//    kprintString("Waiting on mutex");
//    kprintUnsigned(val);
//    kprintString("\n");
    if (!val) block();
    80001f54:	00052783          	lw	a5,0(a0)
    80001f58:	02078a63          	beqz	a5,80001f8c <_ZN5Mutex4waitEv+0x68>
    holder = TCB::running;
    80001f5c:	00008797          	auipc	a5,0x8
    80001f60:	e747b783          	ld	a5,-396(a5) # 80009dd0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001f64:	0007b783          	ld	a5,0(a5)
    80001f68:	02f4b423          	sd	a5,40(s1)
    val = 0;
    80001f6c:	0004a023          	sw	zero,0(s1)
    unlock()
    80001f70:	fd843783          	ld	a5,-40(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80001f74:	10079073          	csrw	sstatus,a5
}
    80001f78:	02813083          	ld	ra,40(sp)
    80001f7c:	02013403          	ld	s0,32(sp)
    80001f80:	01813483          	ld	s1,24(sp)
    80001f84:	03010113          	addi	sp,sp,48
    80001f88:	00008067          	ret
    if (!val) block();
    80001f8c:	00000097          	auipc	ra,0x0
    80001f90:	830080e7          	jalr	-2000(ra) # 800017bc <_ZN15KernelSemaphore5blockEv>
    80001f94:	fc9ff06f          	j	80001f5c <_ZN5Mutex4waitEv+0x38>

0000000080001f98 <_ZN5Mutex6signalEv>:

void Mutex::signal() {
    if (holder != TCB::running) return;
    80001f98:	02853703          	ld	a4,40(a0)
    80001f9c:	00008797          	auipc	a5,0x8
    80001fa0:	e347b783          	ld	a5,-460(a5) # 80009dd0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001fa4:	0007b783          	ld	a5,0(a5)
    80001fa8:	00f70463          	beq	a4,a5,80001fb0 <_ZN5Mutex6signalEv+0x18>
    80001fac:	00008067          	ret
void Mutex::signal() {
    80001fb0:	fe010113          	addi	sp,sp,-32
    80001fb4:	00113c23          	sd	ra,24(sp)
    80001fb8:	00813823          	sd	s0,16(sp)
    80001fbc:	02010413          	addi	s0,sp,32
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80001fc0:	100027f3          	csrr	a5,sstatus
    80001fc4:	fef43023          	sd	a5,-32(s0)
    return sstatus;
    80001fc8:	fe043783          	ld	a5,-32(s0)
    lock()
    80001fcc:	fef43423          	sd	a5,-24(s0)
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80001fd0:	00200793          	li	a5,2
    80001fd4:	1007b073          	csrc	sstatus,a5
    val = 1;
    80001fd8:	00100793          	li	a5,1
    80001fdc:	00f52023          	sw	a5,0(a0)
    holder = nullptr;
    80001fe0:	02053423          	sd	zero,40(a0)
    80001fe4:	02052783          	lw	a5,32(a0)
    if (blockedThreadQueue.getCount() != 0)
    80001fe8:	00079e63          	bnez	a5,80002004 <_ZN5Mutex6signalEv+0x6c>
        deblock();
    unlock()
    80001fec:	fe843783          	ld	a5,-24(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80001ff0:	10079073          	csrw	sstatus,a5
}
    80001ff4:	01813083          	ld	ra,24(sp)
    80001ff8:	01013403          	ld	s0,16(sp)
    80001ffc:	02010113          	addi	sp,sp,32
    80002000:	00008067          	ret
        deblock();
    80002004:	00000097          	auipc	ra,0x0
    80002008:	810080e7          	jalr	-2032(ra) # 80001814 <_ZN15KernelSemaphore7deblockEv>
    8000200c:	fe1ff06f          	j	80001fec <_ZN5Mutex6signalEv+0x54>

0000000080002010 <_ZN5Riscv10popSppSpieEb>:
#include "../h/SysPrint.h"
#include "../h/TCB.h"
#include "../h/Kernel.h"
#include "../h/TimerInterrupt.h"

void Riscv::popSppSpie(bool prMode) {
    80002010:	ff010113          	addi	sp,sp,-16
    80002014:	00813423          	sd	s0,8(sp)
    80002018:	01010413          	addi	s0,sp,16
    if(prMode) ms_sstatus(SSTATUS_SPP);
    8000201c:	02050463          	beqz	a0,80002044 <_ZN5Riscv10popSppSpieEb+0x34>
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80002020:	10000793          	li	a5,256
    80002024:	1007a073          	csrs	sstatus,a5
    80002028:	02000793          	li	a5,32
    8000202c:	1007a073          	csrs	sstatus,a5
    else mc_sstatus(SSTATUS_SPP);
    ms_sstatus(SSTATUS_SPIE);
    __asm__ volatile ("csrw sepc, ra");
    80002030:	14109073          	csrw	sepc,ra
    __asm__ volatile ("sret");
    80002034:	10200073          	sret
}
    80002038:	00813403          	ld	s0,8(sp)
    8000203c:	01010113          	addi	sp,sp,16
    80002040:	00008067          	ret
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80002044:	10000793          	li	a5,256
    80002048:	1007b073          	csrc	sstatus,a5
}
    8000204c:	fddff06f          	j	80002028 <_ZN5Riscv10popSppSpieEb+0x18>

0000000080002050 <_ZN5Riscv20handleSupervisorTrapEv>:

void Riscv::handleSupervisorTrap() {
    80002050:	f6010113          	addi	sp,sp,-160
    80002054:	08113c23          	sd	ra,152(sp)
    80002058:	08813823          	sd	s0,144(sp)
    8000205c:	08913423          	sd	s1,136(sp)
    80002060:	09213023          	sd	s2,128(sp)
    80002064:	0a010413          	addi	s0,sp,160
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    80002068:	142027f3          	csrr	a5,scause
    8000206c:	f8f43c23          	sd	a5,-104(s0)
    return scause;
    80002070:	f9843483          	ld	s1,-104(s0)
    uint64 scause = r_scause();
    switch (scause) {
    80002074:	fff00793          	li	a5,-1
    80002078:	03f79793          	slli	a5,a5,0x3f
    8000207c:	00178793          	addi	a5,a5,1
    80002080:	0cf48663          	beq	s1,a5,8000214c <_ZN5Riscv20handleSupervisorTrapEv+0xfc>
    80002084:	fff00793          	li	a5,-1
    80002088:	03f79793          	slli	a5,a5,0x3f
    8000208c:	00178793          	addi	a5,a5,1
    80002090:	0497ea63          	bltu	a5,s1,800020e4 <_ZN5Riscv20handleSupervisorTrapEv+0x94>
    80002094:	00800793          	li	a5,8
    80002098:	06f48463          	beq	s1,a5,80002100 <_ZN5Riscv20handleSupervisorTrapEv+0xb0>
    8000209c:	00900793          	li	a5,9
    800020a0:	14f49263          	bne	s1,a5,800021e4 <_ZN5Riscv20handleSupervisorTrapEv+0x194>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    800020a4:	141027f3          	csrr	a5,sepc
    800020a8:	faf43c23          	sd	a5,-72(s0)
    return sepc;
    800020ac:	fb843783          	ld	a5,-72(s0)
            w_sepc(sepc);
            break;
        }
        case 0x0000000000000009UL: {
            // interrupt: no, cause code: environment call from S-mode (9)
            volatile uint64 sepc = r_sepc() + 4;
    800020b0:	00478793          	addi	a5,a5,4
    800020b4:	f6f43c23          	sd	a5,-136(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    800020b8:	100027f3          	csrr	a5,sstatus
    800020bc:	faf43823          	sd	a5,-80(s0)
    return sstatus;
    800020c0:	fb043783          	ld	a5,-80(s0)
            volatile uint64 sstatus = r_sstatus();
    800020c4:	f8f43023          	sd	a5,-128(s0)
//            kprintString("Ecall from S-mode for thread: ");
//            kprintUnsigned((uint64) TCB::running->getID());
//            kprintString("\n");

            TCB::dispatch();
    800020c8:	00001097          	auipc	ra,0x1
    800020cc:	adc080e7          	jalr	-1316(ra) # 80002ba4 <_ZN3TCB8dispatchEv>

            w_sstatus(sstatus);
    800020d0:	f8043783          	ld	a5,-128(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    800020d4:	10079073          	csrw	sstatus,a5
            w_sepc(sepc);
    800020d8:	f7843783          	ld	a5,-136(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    800020dc:	14179073          	csrw	sepc,a5
}
    800020e0:	0e00006f          	j	800021c0 <_ZN5Riscv20handleSupervisorTrapEv+0x170>
    switch (scause) {
    800020e4:	fff00793          	li	a5,-1
    800020e8:	03f79793          	slli	a5,a5,0x3f
    800020ec:	00978793          	addi	a5,a5,9
    800020f0:	0ef49a63          	bne	s1,a5,800021e4 <_ZN5Riscv20handleSupervisorTrapEv+0x194>
            w_sepc(sepc);
            break;
        }
        case 0x8000000000000009UL: {
            // interrupt: yes, cause code: supervisor external interrupt (console)
            console_handler();
    800020f4:	00005097          	auipc	ra,0x5
    800020f8:	fcc080e7          	jalr	-52(ra) # 800070c0 <console_handler>
            break;
    800020fc:	0c40006f          	j	800021c0 <_ZN5Riscv20handleSupervisorTrapEv+0x170>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80002100:	141027f3          	csrr	a5,sepc
    80002104:	faf43423          	sd	a5,-88(s0)
    return sepc;
    80002108:	fa843783          	ld	a5,-88(s0)
            volatile uint64 sepc = r_sepc() + 4;
    8000210c:	00478793          	addi	a5,a5,4
    80002110:	f6f43423          	sd	a5,-152(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80002114:	100027f3          	csrr	a5,sstatus
    80002118:	faf43023          	sd	a5,-96(s0)
    return sstatus;
    8000211c:	fa043783          	ld	a5,-96(s0)
            volatile uint64 sstatus = r_sstatus();
    80002120:	f6f43823          	sd	a5,-144(s0)
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80002124:	00200493          	li	s1,2
    80002128:	1004a073          	csrs	sstatus,s1
            Kernel::handleSystemCall();
    8000212c:	fffff097          	auipc	ra,0xfffff
    80002130:	51c080e7          	jalr	1308(ra) # 80001648 <_ZN6Kernel16handleSystemCallEv>
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80002134:	1004b073          	csrc	sstatus,s1
            w_sstatus(sstatus);
    80002138:	f7043783          	ld	a5,-144(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    8000213c:	10079073          	csrw	sstatus,a5
            w_sepc(sepc);
    80002140:	f6843783          	ld	a5,-152(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80002144:	14179073          	csrw	sepc,a5
}
    80002148:	0780006f          	j	800021c0 <_ZN5Riscv20handleSupervisorTrapEv+0x170>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    8000214c:	141027f3          	csrr	a5,sepc
    80002150:	fcf43423          	sd	a5,-56(s0)
    return sepc;
    80002154:	fc843783          	ld	a5,-56(s0)
            volatile uint64 sepc = r_sepc();
    80002158:	f8f43423          	sd	a5,-120(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    8000215c:	100027f3          	csrr	a5,sstatus
    80002160:	fcf43023          	sd	a5,-64(s0)
    return sstatus;
    80002164:	fc043783          	ld	a5,-64(s0)
            volatile uint64 sstatus = r_sstatus();
    80002168:	f8f43823          	sd	a5,-112(s0)
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    8000216c:	00200913          	li	s2,2
    80002170:	14493073          	csrc	sip,s2
            TCB::timeSliceCounter++;
    80002174:	00008497          	auipc	s1,0x8
    80002178:	c4c4b483          	ld	s1,-948(s1) # 80009dc0 <_GLOBAL_OFFSET_TABLE_+0x18>
    8000217c:	0004b783          	ld	a5,0(s1)
    80002180:	00178793          	addi	a5,a5,1
    80002184:	00f4b023          	sd	a5,0(s1)
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80002188:	10092073          	csrs	sstatus,s2
            TimerInterrupt::tick();
    8000218c:	00001097          	auipc	ra,0x1
    80002190:	408080e7          	jalr	1032(ra) # 80003594 <_ZN14TimerInterrupt4tickEv>
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80002194:	10093073          	csrc	sstatus,s2
            if (TCB::timeSliceCounter >= TCB::running->timeSlice) {
    80002198:	00008797          	auipc	a5,0x8
    8000219c:	c387b783          	ld	a5,-968(a5) # 80009dd0 <_GLOBAL_OFFSET_TABLE_+0x28>
    800021a0:	0007b783          	ld	a5,0(a5)
    800021a4:	0387b703          	ld	a4,56(a5)
    800021a8:	0004b783          	ld	a5,0(s1)
    800021ac:	02e7f663          	bgeu	a5,a4,800021d8 <_ZN5Riscv20handleSupervisorTrapEv+0x188>
            w_sstatus(sstatus);
    800021b0:	f9043783          	ld	a5,-112(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    800021b4:	10079073          	csrw	sstatus,a5
            w_sepc(sepc);
    800021b8:	f8843783          	ld	a5,-120(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    800021bc:	14179073          	csrw	sepc,a5
            kprintString("\nStval: ");
            kprintUnsigned(r_stval());
            kprintString("\n");
        }
    }
    800021c0:	09813083          	ld	ra,152(sp)
    800021c4:	09013403          	ld	s0,144(sp)
    800021c8:	08813483          	ld	s1,136(sp)
    800021cc:	08013903          	ld	s2,128(sp)
    800021d0:	0a010113          	addi	sp,sp,160
    800021d4:	00008067          	ret
                TCB::dispatch();
    800021d8:	00001097          	auipc	ra,0x1
    800021dc:	9cc080e7          	jalr	-1588(ra) # 80002ba4 <_ZN3TCB8dispatchEv>
    800021e0:	fd1ff06f          	j	800021b0 <_ZN5Riscv20handleSupervisorTrapEv+0x160>
            kprintString("Unexpected trap cause:\n");
    800021e4:	00006517          	auipc	a0,0x6
    800021e8:	fbc50513          	addi	a0,a0,-68 # 800081a0 <CONSOLE_STATUS+0x190>
    800021ec:	00000097          	auipc	ra,0x0
    800021f0:	60c080e7          	jalr	1548(ra) # 800027f8 <_Z12kprintStringPKc>
            kprintString("Scause: ");
    800021f4:	00006517          	auipc	a0,0x6
    800021f8:	fc450513          	addi	a0,a0,-60 # 800081b8 <CONSOLE_STATUS+0x1a8>
    800021fc:	00000097          	auipc	ra,0x0
    80002200:	5fc080e7          	jalr	1532(ra) # 800027f8 <_Z12kprintStringPKc>
            kprintUnsigned(scause);
    80002204:	00048513          	mv	a0,s1
    80002208:	00000097          	auipc	ra,0x0
    8000220c:	6f4080e7          	jalr	1780(ra) # 800028fc <_Z14kprintUnsignedm>
            kprintString("\nSepc: ");
    80002210:	00006517          	auipc	a0,0x6
    80002214:	fb850513          	addi	a0,a0,-72 # 800081c8 <CONSOLE_STATUS+0x1b8>
    80002218:	00000097          	auipc	ra,0x0
    8000221c:	5e0080e7          	jalr	1504(ra) # 800027f8 <_Z12kprintStringPKc>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80002220:	141027f3          	csrr	a5,sepc
    80002224:	fcf43c23          	sd	a5,-40(s0)
    return sepc;
    80002228:	fd843503          	ld	a0,-40(s0)
            kprintUnsigned(r_sepc());
    8000222c:	00000097          	auipc	ra,0x0
    80002230:	6d0080e7          	jalr	1744(ra) # 800028fc <_Z14kprintUnsignedm>
            kprintString("\nStval: ");
    80002234:	00006517          	auipc	a0,0x6
    80002238:	f9c50513          	addi	a0,a0,-100 # 800081d0 <CONSOLE_STATUS+0x1c0>
    8000223c:	00000097          	auipc	ra,0x0
    80002240:	5bc080e7          	jalr	1468(ra) # 800027f8 <_Z12kprintStringPKc>
    __asm__ volatile ("csrr %[stval], stval" : [stval] "=r"(stval));
    80002244:	143027f3          	csrr	a5,stval
    80002248:	fcf43823          	sd	a5,-48(s0)
    return stval;
    8000224c:	fd043503          	ld	a0,-48(s0)
            kprintUnsigned(r_stval());
    80002250:	00000097          	auipc	ra,0x0
    80002254:	6ac080e7          	jalr	1708(ra) # 800028fc <_Z14kprintUnsignedm>
            kprintString("\n");
    80002258:	00006517          	auipc	a0,0x6
    8000225c:	f3050513          	addi	a0,a0,-208 # 80008188 <CONSOLE_STATUS+0x178>
    80002260:	00000097          	auipc	ra,0x0
    80002264:	598080e7          	jalr	1432(ra) # 800027f8 <_Z12kprintStringPKc>
    80002268:	f59ff06f          	j	800021c0 <_ZN5Riscv20handleSupervisorTrapEv+0x170>

000000008000226c <_ZN9Scheduler11getInstanceEv>:
    getInstance()->readyThreadQueue.addLast(tcb->getNode());
    getInstance()->mutex.signal();
}

Scheduler *Scheduler::getInstance() {
    if (!instance) instance = new Scheduler;
    8000226c:	00008797          	auipc	a5,0x8
    80002270:	bc47b783          	ld	a5,-1084(a5) # 80009e30 <_ZN9Scheduler8instanceE>
    80002274:	00078863          	beqz	a5,80002284 <_ZN9Scheduler11getInstanceEv+0x18>
    return instance;
}
    80002278:	00008517          	auipc	a0,0x8
    8000227c:	bb853503          	ld	a0,-1096(a0) # 80009e30 <_ZN9Scheduler8instanceE>
    80002280:	00008067          	ret
Scheduler *Scheduler::getInstance() {
    80002284:	ff010113          	addi	sp,sp,-16
    80002288:	00113423          	sd	ra,8(sp)
    8000228c:	00813023          	sd	s0,0(sp)
    80002290:	01010413          	addi	s0,sp,16
        return kmalloc(size);
    80002294:	05800513          	li	a0,88
    80002298:	00000097          	auipc	ra,0x0
    8000229c:	c0c080e7          	jalr	-1012(ra) # 80001ea4 <_Z7kmallocm>
    explicit ThreadList() = default;
    800022a0:	00053423          	sd	zero,8(a0)
    800022a4:	00053823          	sd	zero,16(a0)
    800022a8:	00053c23          	sd	zero,24(a0)
    800022ac:	02052023          	sw	zero,32(a0)
    800022b0:	00100793          	li	a5,1
    800022b4:	02f52423          	sw	a5,40(a0)
    800022b8:	02053823          	sd	zero,48(a0)
    800022bc:	02053c23          	sd	zero,56(a0)
    800022c0:	04053023          	sd	zero,64(a0)
    800022c4:	04052423          	sw	zero,72(a0)

#include "KernelSemaphore.h"
#include "MemoryAllocator.h"


class Mutex : public KernelSemaphore {
    800022c8:	04053823          	sd	zero,80(a0)
    if (!instance) instance = new Scheduler;
    800022cc:	00008797          	auipc	a5,0x8
    800022d0:	b6a7b223          	sd	a0,-1180(a5) # 80009e30 <_ZN9Scheduler8instanceE>
}
    800022d4:	00008517          	auipc	a0,0x8
    800022d8:	b5c53503          	ld	a0,-1188(a0) # 80009e30 <_ZN9Scheduler8instanceE>
    800022dc:	00813083          	ld	ra,8(sp)
    800022e0:	00013403          	ld	s0,0(sp)
    800022e4:	01010113          	addi	sp,sp,16
    800022e8:	00008067          	ret

00000000800022ec <_ZN9Scheduler3getEv>:
TCB *Scheduler::get() {
    800022ec:	fe010113          	addi	sp,sp,-32
    800022f0:	00113c23          	sd	ra,24(sp)
    800022f4:	00813823          	sd	s0,16(sp)
    800022f8:	00913423          	sd	s1,8(sp)
    800022fc:	02010413          	addi	s0,sp,32
    getInstance()->mutex.wait();
    80002300:	00000097          	auipc	ra,0x0
    80002304:	f6c080e7          	jalr	-148(ra) # 8000226c <_ZN9Scheduler11getInstanceEv>
    80002308:	02850513          	addi	a0,a0,40
    8000230c:	00000097          	auipc	ra,0x0
    80002310:	c18080e7          	jalr	-1000(ra) # 80001f24 <_ZN5Mutex4waitEv>
    TCB *tcb = getInstance()->readyThreadQueue.removeFirst();
    80002314:	00000097          	auipc	ra,0x0
    80002318:	f58080e7          	jalr	-168(ra) # 8000226c <_ZN9Scheduler11getInstanceEv>
    8000231c:	00850513          	addi	a0,a0,8
    80002320:	00001097          	auipc	ra,0x1
    80002324:	f20080e7          	jalr	-224(ra) # 80003240 <_ZN10ThreadList11removeFirstEv>
    80002328:	00050493          	mv	s1,a0
    getInstance()->mutex.signal();
    8000232c:	00000097          	auipc	ra,0x0
    80002330:	f40080e7          	jalr	-192(ra) # 8000226c <_ZN9Scheduler11getInstanceEv>
    80002334:	02850513          	addi	a0,a0,40
    80002338:	00000097          	auipc	ra,0x0
    8000233c:	c60080e7          	jalr	-928(ra) # 80001f98 <_ZN5Mutex6signalEv>
}
    80002340:	00048513          	mv	a0,s1
    80002344:	01813083          	ld	ra,24(sp)
    80002348:	01013403          	ld	s0,16(sp)
    8000234c:	00813483          	ld	s1,8(sp)
    80002350:	02010113          	addi	sp,sp,32
    80002354:	00008067          	ret

0000000080002358 <_ZN9Scheduler3putEP3TCB>:
void Scheduler::put(TCB *tcb) {
    80002358:	fe010113          	addi	sp,sp,-32
    8000235c:	00113c23          	sd	ra,24(sp)
    80002360:	00813823          	sd	s0,16(sp)
    80002364:	00913423          	sd	s1,8(sp)
    80002368:	02010413          	addi	s0,sp,32
    8000236c:	00050493          	mv	s1,a0
    getInstance()->mutex.wait();
    80002370:	00000097          	auipc	ra,0x0
    80002374:	efc080e7          	jalr	-260(ra) # 8000226c <_ZN9Scheduler11getInstanceEv>
    80002378:	02850513          	addi	a0,a0,40
    8000237c:	00000097          	auipc	ra,0x0
    80002380:	ba8080e7          	jalr	-1112(ra) # 80001f24 <_ZN5Mutex4waitEv>
    getInstance()->readyThreadQueue.addLast(tcb->getNode());
    80002384:	00000097          	auipc	ra,0x0
    80002388:	ee8080e7          	jalr	-280(ra) # 8000226c <_ZN9Scheduler11getInstanceEv>
    8000238c:	0a048593          	addi	a1,s1,160
    80002390:	00850513          	addi	a0,a0,8
    80002394:	00001097          	auipc	ra,0x1
    80002398:	e68080e7          	jalr	-408(ra) # 800031fc <_ZN10ThreadList7addLastEP10ThreadNode>
    getInstance()->mutex.signal();
    8000239c:	00000097          	auipc	ra,0x0
    800023a0:	ed0080e7          	jalr	-304(ra) # 8000226c <_ZN9Scheduler11getInstanceEv>
    800023a4:	02850513          	addi	a0,a0,40
    800023a8:	00000097          	auipc	ra,0x0
    800023ac:	bf0080e7          	jalr	-1040(ra) # 80001f98 <_ZN5Mutex6signalEv>
}
    800023b0:	01813083          	ld	ra,24(sp)
    800023b4:	01013403          	ld	s0,16(sp)
    800023b8:	00813483          	ld	s1,8(sp)
    800023bc:	02010113          	addi	sp,sp,32
    800023c0:	00008067          	ret

00000000800023c4 <_ZN9SchedulerD1Ev>:

Scheduler::~Scheduler() {
    800023c4:	fe010113          	addi	sp,sp,-32
    800023c8:	00113c23          	sd	ra,24(sp)
    800023cc:	00813823          	sd	s0,16(sp)
    800023d0:	00913423          	sd	s1,8(sp)
    800023d4:	01213023          	sd	s2,0(sp)
    800023d8:	02010413          	addi	s0,sp,32
    800023dc:	00050913          	mv	s2,a0
    bool hasCurr() {
        return curr != nullptr;
    }

    bool isEmpty() {
        return size == 0;
    800023e0:	02092783          	lw	a5,32(s2)
    while (!readyThreadQueue.isEmpty()) {
    800023e4:	02078863          	beqz	a5,80002414 <_ZN9SchedulerD1Ev+0x50>
//        kprintString("Scheduler deleting...\n");
        delete readyThreadQueue.removeFirst();
    800023e8:	00890513          	addi	a0,s2,8
    800023ec:	00001097          	auipc	ra,0x1
    800023f0:	e54080e7          	jalr	-428(ra) # 80003240 <_ZN10ThreadList11removeFirstEv>
    800023f4:	00050493          	mv	s1,a0
    800023f8:	fe0504e3          	beqz	a0,800023e0 <_ZN9SchedulerD1Ev+0x1c>
    800023fc:	00001097          	auipc	ra,0x1
    80002400:	9d0080e7          	jalr	-1584(ra) # 80002dcc <_ZN3TCBD1Ev>
        kfree(addr);
    80002404:	00048513          	mv	a0,s1
    80002408:	00000097          	auipc	ra,0x0
    8000240c:	adc080e7          	jalr	-1316(ra) # 80001ee4 <_Z5kfreePv>
    }
    80002410:	fd1ff06f          	j	800023e0 <_ZN9SchedulerD1Ev+0x1c>
    80002414:	02890513          	addi	a0,s2,40
    80002418:	fffff097          	auipc	ra,0xfffff
    8000241c:	4fc080e7          	jalr	1276(ra) # 80001914 <_ZN15KernelSemaphoreD1Ev>
Scheduler::~Scheduler() {
    80002420:	00890513          	addi	a0,s2,8
    80002424:	00001097          	auipc	ra,0x1
    80002428:	fc0080e7          	jalr	-64(ra) # 800033e4 <_ZN10ThreadListD1Ev>
    }
}
    8000242c:	01813083          	ld	ra,24(sp)
    80002430:	01013403          	ld	s0,16(sp)
    80002434:	00813483          	ld	s1,8(sp)
    80002438:	00013903          	ld	s2,0(sp)
    8000243c:	02010113          	addi	sp,sp,32
    80002440:	00008067          	ret

0000000080002444 <_Z18callSupervisorTrapmPv>:
#include "../h/syscall_c.h"
#include "../h/SysPrint.h"


void *callSupervisorTrap(uint64 param, void *args) {
    80002444:	ff010113          	addi	sp,sp,-16
    80002448:	00813423          	sd	s0,8(sp)
    8000244c:	01010413          	addi	s0,sp,16
    __asm__ volatile ("ecall");
    80002450:	00000073          	ecall

    return (void *) param;
}
    80002454:	00813403          	ld	s0,8(sp)
    80002458:	01010113          	addi	sp,sp,16
    8000245c:	00008067          	ret

0000000080002460 <_Z9mem_allocm>:

void *mem_alloc(size_t size) {
    80002460:	fe010113          	addi	sp,sp,-32
    80002464:	00113c23          	sd	ra,24(sp)
    80002468:	00813823          	sd	s0,16(sp)
    8000246c:	02010413          	addi	s0,sp,32
    80002470:	fea43423          	sd	a0,-24(s0)
    return callSupervisorTrap(0x01, &size);
    80002474:	fe840593          	addi	a1,s0,-24
    80002478:	00100513          	li	a0,1
    8000247c:	00000097          	auipc	ra,0x0
    80002480:	fc8080e7          	jalr	-56(ra) # 80002444 <_Z18callSupervisorTrapmPv>
}
    80002484:	01813083          	ld	ra,24(sp)
    80002488:	01013403          	ld	s0,16(sp)
    8000248c:	02010113          	addi	sp,sp,32
    80002490:	00008067          	ret

0000000080002494 <_Z8mem_freePv>:

int mem_free(void *addr) {
    80002494:	ff010113          	addi	sp,sp,-16
    80002498:	00113423          	sd	ra,8(sp)
    8000249c:	00813023          	sd	s0,0(sp)
    800024a0:	01010413          	addi	s0,sp,16
    800024a4:	00050593          	mv	a1,a0
    return (uint64) callSupervisorTrap(0x02, addr);
    800024a8:	00200513          	li	a0,2
    800024ac:	00000097          	auipc	ra,0x0
    800024b0:	f98080e7          	jalr	-104(ra) # 80002444 <_Z18callSupervisorTrapmPv>
}
    800024b4:	0005051b          	sext.w	a0,a0
    800024b8:	00813083          	ld	ra,8(sp)
    800024bc:	00013403          	ld	s0,0(sp)
    800024c0:	01010113          	addi	sp,sp,16
    800024c4:	00008067          	ret

00000000800024c8 <_Z13thread_createPP7_threadPFvPvES2_>:

int thread_create(thread_t *handle, void(*start_routine)(void *), void *arg) {
    if (!handle) return -1;
    800024c8:	06050c63          	beqz	a0,80002540 <_Z13thread_createPP7_threadPFvPvES2_+0x78>
int thread_create(thread_t *handle, void(*start_routine)(void *), void *arg) {
    800024cc:	fb010113          	addi	sp,sp,-80
    800024d0:	04113423          	sd	ra,72(sp)
    800024d4:	04813023          	sd	s0,64(sp)
    800024d8:	02913c23          	sd	s1,56(sp)
    800024dc:	03213823          	sd	s2,48(sp)
    800024e0:	03313423          	sd	s3,40(sp)
    800024e4:	05010413          	addi	s0,sp,80
    800024e8:	00050493          	mv	s1,a0
    800024ec:	00058993          	mv	s3,a1
    800024f0:	00060913          	mv	s2,a2
    *handle = new _thread;
    800024f4:	01800513          	li	a0,24
    800024f8:	00000097          	auipc	ra,0x0
    800024fc:	260080e7          	jalr	608(ra) # 80002758 <_Znwm>
    80002500:	00a4b023          	sd	a0,0(s1)
    uint64 args[] = {(uint64) *handle, (uint64) start_routine, (uint64) arg};
    80002504:	faa43c23          	sd	a0,-72(s0)
    80002508:	fd343023          	sd	s3,-64(s0)
    8000250c:	fd243423          	sd	s2,-56(s0)
    return (uint64) callSupervisorTrap(0x11, args);
    80002510:	fb840593          	addi	a1,s0,-72
    80002514:	01100513          	li	a0,17
    80002518:	00000097          	auipc	ra,0x0
    8000251c:	f2c080e7          	jalr	-212(ra) # 80002444 <_Z18callSupervisorTrapmPv>
    80002520:	0005051b          	sext.w	a0,a0
}
    80002524:	04813083          	ld	ra,72(sp)
    80002528:	04013403          	ld	s0,64(sp)
    8000252c:	03813483          	ld	s1,56(sp)
    80002530:	03013903          	ld	s2,48(sp)
    80002534:	02813983          	ld	s3,40(sp)
    80002538:	05010113          	addi	sp,sp,80
    8000253c:	00008067          	ret
    if (!handle) return -1;
    80002540:	fff00513          	li	a0,-1
}
    80002544:	00008067          	ret

0000000080002548 <_Z11thread_exitv>:

int thread_exit() {
    80002548:	ff010113          	addi	sp,sp,-16
    8000254c:	00113423          	sd	ra,8(sp)
    80002550:	00813023          	sd	s0,0(sp)
    80002554:	01010413          	addi	s0,sp,16
    return (uint64) callSupervisorTrap(0x12, 0);
    80002558:	00000593          	li	a1,0
    8000255c:	01200513          	li	a0,18
    80002560:	00000097          	auipc	ra,0x0
    80002564:	ee4080e7          	jalr	-284(ra) # 80002444 <_Z18callSupervisorTrapmPv>
}
    80002568:	0005051b          	sext.w	a0,a0
    8000256c:	00813083          	ld	ra,8(sp)
    80002570:	00013403          	ld	s0,0(sp)
    80002574:	01010113          	addi	sp,sp,16
    80002578:	00008067          	ret

000000008000257c <_Z15thread_dispatchv>:

void thread_dispatch() {
    8000257c:	ff010113          	addi	sp,sp,-16
    80002580:	00113423          	sd	ra,8(sp)
    80002584:	00813023          	sd	s0,0(sp)
    80002588:	01010413          	addi	s0,sp,16
    callSupervisorTrap(0x13, 0);
    8000258c:	00000593          	li	a1,0
    80002590:	01300513          	li	a0,19
    80002594:	00000097          	auipc	ra,0x0
    80002598:	eb0080e7          	jalr	-336(ra) # 80002444 <_Z18callSupervisorTrapmPv>
}
    8000259c:	00813083          	ld	ra,8(sp)
    800025a0:	00013403          	ld	s0,0(sp)
    800025a4:	01010113          	addi	sp,sp,16
    800025a8:	00008067          	ret

00000000800025ac <_Z8sem_openPP4_semj>:

int sem_open(sem_t *handle, unsigned init) {
    if (!handle) return -1;
    800025ac:	06050863          	beqz	a0,8000261c <_Z8sem_openPP4_semj+0x70>
int sem_open(sem_t *handle, unsigned init) {
    800025b0:	fd010113          	addi	sp,sp,-48
    800025b4:	02113423          	sd	ra,40(sp)
    800025b8:	02813023          	sd	s0,32(sp)
    800025bc:	00913c23          	sd	s1,24(sp)
    800025c0:	01213823          	sd	s2,16(sp)
    800025c4:	03010413          	addi	s0,sp,48
    800025c8:	00050913          	mv	s2,a0
    800025cc:	00058493          	mv	s1,a1
    *handle = new _sem;
    800025d0:	00800513          	li	a0,8
    800025d4:	00000097          	auipc	ra,0x0
    800025d8:	184080e7          	jalr	388(ra) # 80002758 <_Znwm>
    800025dc:	00a93023          	sd	a0,0(s2)
//    kprintString("\n");
//    kprintString("Handle address: ");
//    kprintUnsigned((uint64) *handle);
//    kprintString("\n");

    uint64 args[] = {(uint64) *handle, (uint64) init};
    800025e0:	fca43823          	sd	a0,-48(s0)
    800025e4:	02049593          	slli	a1,s1,0x20
    800025e8:	0205d593          	srli	a1,a1,0x20
    800025ec:	fcb43c23          	sd	a1,-40(s0)
    return (uint64) callSupervisorTrap(0x21, args);
    800025f0:	fd040593          	addi	a1,s0,-48
    800025f4:	02100513          	li	a0,33
    800025f8:	00000097          	auipc	ra,0x0
    800025fc:	e4c080e7          	jalr	-436(ra) # 80002444 <_Z18callSupervisorTrapmPv>
    80002600:	0005051b          	sext.w	a0,a0
}
    80002604:	02813083          	ld	ra,40(sp)
    80002608:	02013403          	ld	s0,32(sp)
    8000260c:	01813483          	ld	s1,24(sp)
    80002610:	01013903          	ld	s2,16(sp)
    80002614:	03010113          	addi	sp,sp,48
    80002618:	00008067          	ret
    if (!handle) return -1;
    8000261c:	fff00513          	li	a0,-1
}
    80002620:	00008067          	ret

0000000080002624 <_Z9sem_closeP4_sem>:

int sem_close(sem_t handle) {
    80002624:	ff010113          	addi	sp,sp,-16
    80002628:	00113423          	sd	ra,8(sp)
    8000262c:	00813023          	sd	s0,0(sp)
    80002630:	01010413          	addi	s0,sp,16
    80002634:	00050593          	mv	a1,a0
    return (uint64) callSupervisorTrap(0x22, handle);
    80002638:	02200513          	li	a0,34
    8000263c:	00000097          	auipc	ra,0x0
    80002640:	e08080e7          	jalr	-504(ra) # 80002444 <_Z18callSupervisorTrapmPv>
}
    80002644:	0005051b          	sext.w	a0,a0
    80002648:	00813083          	ld	ra,8(sp)
    8000264c:	00013403          	ld	s0,0(sp)
    80002650:	01010113          	addi	sp,sp,16
    80002654:	00008067          	ret

0000000080002658 <_Z8sem_waitP4_sem>:

int sem_wait(sem_t handle) {
    80002658:	ff010113          	addi	sp,sp,-16
    8000265c:	00113423          	sd	ra,8(sp)
    80002660:	00813023          	sd	s0,0(sp)
    80002664:	01010413          	addi	s0,sp,16
    80002668:	00050593          	mv	a1,a0
    return (uint64) callSupervisorTrap(0x23, handle);
    8000266c:	02300513          	li	a0,35
    80002670:	00000097          	auipc	ra,0x0
    80002674:	dd4080e7          	jalr	-556(ra) # 80002444 <_Z18callSupervisorTrapmPv>
}
    80002678:	0005051b          	sext.w	a0,a0
    8000267c:	00813083          	ld	ra,8(sp)
    80002680:	00013403          	ld	s0,0(sp)
    80002684:	01010113          	addi	sp,sp,16
    80002688:	00008067          	ret

000000008000268c <_Z10sem_signalP4_sem>:

int sem_signal(sem_t handle) {
    8000268c:	ff010113          	addi	sp,sp,-16
    80002690:	00113423          	sd	ra,8(sp)
    80002694:	00813023          	sd	s0,0(sp)
    80002698:	01010413          	addi	s0,sp,16
    8000269c:	00050593          	mv	a1,a0
    return (uint64) callSupervisorTrap(0x24, handle);
    800026a0:	02400513          	li	a0,36
    800026a4:	00000097          	auipc	ra,0x0
    800026a8:	da0080e7          	jalr	-608(ra) # 80002444 <_Z18callSupervisorTrapmPv>
}
    800026ac:	0005051b          	sext.w	a0,a0
    800026b0:	00813083          	ld	ra,8(sp)
    800026b4:	00013403          	ld	s0,0(sp)
    800026b8:	01010113          	addi	sp,sp,16
    800026bc:	00008067          	ret

00000000800026c0 <_Z10time_sleepm>:

int time_sleep(time_t time) {
    800026c0:	ff010113          	addi	sp,sp,-16
    800026c4:	00113423          	sd	ra,8(sp)
    800026c8:	00813023          	sd	s0,0(sp)
    800026cc:	01010413          	addi	s0,sp,16
    800026d0:	00050593          	mv	a1,a0
    return (uint64) callSupervisorTrap(0x31, (void *) time);
    800026d4:	03100513          	li	a0,49
    800026d8:	00000097          	auipc	ra,0x0
    800026dc:	d6c080e7          	jalr	-660(ra) # 80002444 <_Z18callSupervisorTrapmPv>
}
    800026e0:	0005051b          	sext.w	a0,a0
    800026e4:	00813083          	ld	ra,8(sp)
    800026e8:	00013403          	ld	s0,0(sp)
    800026ec:	01010113          	addi	sp,sp,16
    800026f0:	00008067          	ret

00000000800026f4 <_Z4getcv>:

char getc() {
    800026f4:	ff010113          	addi	sp,sp,-16
    800026f8:	00113423          	sd	ra,8(sp)
    800026fc:	00813023          	sd	s0,0(sp)
    80002700:	01010413          	addi	s0,sp,16
    return (uint64) callSupervisorTrap(0x41, nullptr);
    80002704:	00000593          	li	a1,0
    80002708:	04100513          	li	a0,65
    8000270c:	00000097          	auipc	ra,0x0
    80002710:	d38080e7          	jalr	-712(ra) # 80002444 <_Z18callSupervisorTrapmPv>
}
    80002714:	0ff57513          	andi	a0,a0,255
    80002718:	00813083          	ld	ra,8(sp)
    8000271c:	00013403          	ld	s0,0(sp)
    80002720:	01010113          	addi	sp,sp,16
    80002724:	00008067          	ret

0000000080002728 <_Z4putcc>:

void putc(char chr) {
    80002728:	ff010113          	addi	sp,sp,-16
    8000272c:	00113423          	sd	ra,8(sp)
    80002730:	00813023          	sd	s0,0(sp)
    80002734:	01010413          	addi	s0,sp,16
    80002738:	00050593          	mv	a1,a0
    callSupervisorTrap(0x42, (void *) (uint64) chr);
    8000273c:	04200513          	li	a0,66
    80002740:	00000097          	auipc	ra,0x0
    80002744:	d04080e7          	jalr	-764(ra) # 80002444 <_Z18callSupervisorTrapmPv>
}
    80002748:	00813083          	ld	ra,8(sp)
    8000274c:	00013403          	ld	s0,0(sp)
    80002750:	01010113          	addi	sp,sp,16
    80002754:	00008067          	ret

0000000080002758 <_Znwm>:
#include "../h/syscall_cpp.hpp"

void *operator new(size_t sz) {
    80002758:	ff010113          	addi	sp,sp,-16
    8000275c:	00113423          	sd	ra,8(sp)
    80002760:	00813023          	sd	s0,0(sp)
    80002764:	01010413          	addi	s0,sp,16
    return mem_alloc(sz);
    80002768:	00000097          	auipc	ra,0x0
    8000276c:	cf8080e7          	jalr	-776(ra) # 80002460 <_Z9mem_allocm>
}
    80002770:	00813083          	ld	ra,8(sp)
    80002774:	00013403          	ld	s0,0(sp)
    80002778:	01010113          	addi	sp,sp,16
    8000277c:	00008067          	ret

0000000080002780 <_Znam>:

void *operator new[](size_t sz) {
    80002780:	ff010113          	addi	sp,sp,-16
    80002784:	00113423          	sd	ra,8(sp)
    80002788:	00813023          	sd	s0,0(sp)
    8000278c:	01010413          	addi	s0,sp,16
    return mem_alloc(sz);
    80002790:	00000097          	auipc	ra,0x0
    80002794:	cd0080e7          	jalr	-816(ra) # 80002460 <_Z9mem_allocm>
}
    80002798:	00813083          	ld	ra,8(sp)
    8000279c:	00013403          	ld	s0,0(sp)
    800027a0:	01010113          	addi	sp,sp,16
    800027a4:	00008067          	ret

00000000800027a8 <_ZdlPv>:

void operator delete(void *addr) {
    800027a8:	ff010113          	addi	sp,sp,-16
    800027ac:	00113423          	sd	ra,8(sp)
    800027b0:	00813023          	sd	s0,0(sp)
    800027b4:	01010413          	addi	s0,sp,16
    mem_free(addr);
    800027b8:	00000097          	auipc	ra,0x0
    800027bc:	cdc080e7          	jalr	-804(ra) # 80002494 <_Z8mem_freePv>
}
    800027c0:	00813083          	ld	ra,8(sp)
    800027c4:	00013403          	ld	s0,0(sp)
    800027c8:	01010113          	addi	sp,sp,16
    800027cc:	00008067          	ret

00000000800027d0 <_ZdaPv>:

void operator delete[](void *addr) {
    800027d0:	ff010113          	addi	sp,sp,-16
    800027d4:	00113423          	sd	ra,8(sp)
    800027d8:	00813023          	sd	s0,0(sp)
    800027dc:	01010413          	addi	s0,sp,16
    mem_free(addr);
    800027e0:	00000097          	auipc	ra,0x0
    800027e4:	cb4080e7          	jalr	-844(ra) # 80002494 <_Z8mem_freePv>
}
    800027e8:	00813083          	ld	ra,8(sp)
    800027ec:	00013403          	ld	s0,0(sp)
    800027f0:	01010113          	addi	sp,sp,16
    800027f4:	00008067          	ret

00000000800027f8 <_Z12kprintStringPKc>:

#include "../h/SysPrint.h"
#include "../lib/console.h"
#include "../h/Riscv.h"

void kprintString(char const *string) {
    800027f8:	fe010113          	addi	sp,sp,-32
    800027fc:	00113c23          	sd	ra,24(sp)
    80002800:	00813823          	sd	s0,16(sp)
    80002804:	00913423          	sd	s1,8(sp)
    80002808:	02010413          	addi	s0,sp,32
    8000280c:	00050493          	mv	s1,a0
//    uint64 sstatus;
//    Riscv::lock(sstatus);

    while (*string != '\0') {
    80002810:	0004c503          	lbu	a0,0(s1)
    80002814:	00050a63          	beqz	a0,80002828 <_Z12kprintStringPKc+0x30>
        __putc(*string);
    80002818:	00005097          	auipc	ra,0x5
    8000281c:	834080e7          	jalr	-1996(ra) # 8000704c <__putc>
        string++;
    80002820:	00148493          	addi	s1,s1,1
    while (*string != '\0') {
    80002824:	fedff06f          	j	80002810 <_Z12kprintStringPKc+0x18>
    }

//    Riscv::unlock(sstatus);
}
    80002828:	01813083          	ld	ra,24(sp)
    8000282c:	01013403          	ld	s0,16(sp)
    80002830:	00813483          	ld	s1,8(sp)
    80002834:	02010113          	addi	sp,sp,32
    80002838:	00008067          	ret

000000008000283c <_Z13kprintIntegeri>:

void kprintInteger(int integer) {
    8000283c:	fd010113          	addi	sp,sp,-48
    80002840:	02113423          	sd	ra,40(sp)
    80002844:	02813023          	sd	s0,32(sp)
    80002848:	00913c23          	sd	s1,24(sp)
    8000284c:	03010413          	addi	s0,sp,48
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if (integer < 0) {
    80002850:	08054663          	bltz	a0,800028dc <_Z13kprintIntegeri+0xa0>
        neg = 1;
        x = -integer;
    } else {
        x = integer;
    80002854:	0005051b          	sext.w	a0,a0
    neg = 0;
    80002858:	00000593          	li	a1,0
    }

    i = 0;
    8000285c:	00000493          	li	s1,0
    do {
        buf[i++] = digits[x % 10];
    80002860:	00a00693          	li	a3,10
    80002864:	02d577bb          	remuw	a5,a0,a3
    80002868:	00048613          	mv	a2,s1
    8000286c:	0014849b          	addiw	s1,s1,1
    80002870:	02079713          	slli	a4,a5,0x20
    80002874:	02075713          	srli	a4,a4,0x20
    80002878:	00006797          	auipc	a5,0x6
    8000287c:	96878793          	addi	a5,a5,-1688 # 800081e0 <_ZZ13kprintIntegeriE6digits>
    80002880:	00e787b3          	add	a5,a5,a4
    80002884:	0007c703          	lbu	a4,0(a5)
    80002888:	fe040793          	addi	a5,s0,-32
    8000288c:	00c787b3          	add	a5,a5,a2
    80002890:	fee78823          	sb	a4,-16(a5)
    } while ((x /= 10) != 0);
    80002894:	0005071b          	sext.w	a4,a0
    80002898:	02d5553b          	divuw	a0,a0,a3
    8000289c:	00900793          	li	a5,9
    800028a0:	fce7e0e3          	bltu	a5,a4,80002860 <_Z13kprintIntegeri+0x24>
    if (neg) buf[i++] = '-';
    800028a4:	00058c63          	beqz	a1,800028bc <_Z13kprintIntegeri+0x80>
    800028a8:	fe040793          	addi	a5,s0,-32
    800028ac:	009784b3          	add	s1,a5,s1
    800028b0:	02d00793          	li	a5,45
    800028b4:	fef48823          	sb	a5,-16(s1)
    800028b8:	0026049b          	addiw	s1,a2,2

    while (--i >= 0)
    800028bc:	fff4849b          	addiw	s1,s1,-1
    800028c0:	0204c463          	bltz	s1,800028e8 <_Z13kprintIntegeri+0xac>
        __putc(buf[i]);
    800028c4:	fe040793          	addi	a5,s0,-32
    800028c8:	009787b3          	add	a5,a5,s1
    800028cc:	ff07c503          	lbu	a0,-16(a5)
    800028d0:	00004097          	auipc	ra,0x4
    800028d4:	77c080e7          	jalr	1916(ra) # 8000704c <__putc>
    800028d8:	fe5ff06f          	j	800028bc <_Z13kprintIntegeri+0x80>
        x = -integer;
    800028dc:	40a0053b          	negw	a0,a0
        neg = 1;
    800028e0:	00100593          	li	a1,1
    800028e4:	f79ff06f          	j	8000285c <_Z13kprintIntegeri+0x20>

//    Riscv::unlock(sstatus);
}
    800028e8:	02813083          	ld	ra,40(sp)
    800028ec:	02013403          	ld	s0,32(sp)
    800028f0:	01813483          	ld	s1,24(sp)
    800028f4:	03010113          	addi	sp,sp,48
    800028f8:	00008067          	ret

00000000800028fc <_Z14kprintUnsignedm>:

void kprintUnsigned(uint64 x) {
    800028fc:	fd010113          	addi	sp,sp,-48
    80002900:	02113423          	sd	ra,40(sp)
    80002904:	02813023          	sd	s0,32(sp)
    80002908:	00913c23          	sd	s1,24(sp)
    8000290c:	03010413          	addi	s0,sp,48
//    Riscv::lock(sstatus);

    static char digits[] = "0123456789";
    char buf[16];

    int i = 0;
    80002910:	00000493          	li	s1,0
    do {
        buf[i++] = digits[x % 10];
    80002914:	00a00693          	li	a3,10
    80002918:	02d57633          	remu	a2,a0,a3
    8000291c:	00006717          	auipc	a4,0x6
    80002920:	8c470713          	addi	a4,a4,-1852 # 800081e0 <_ZZ13kprintIntegeriE6digits>
    80002924:	00c70733          	add	a4,a4,a2
    80002928:	01074703          	lbu	a4,16(a4)
    8000292c:	fe040613          	addi	a2,s0,-32
    80002930:	009607b3          	add	a5,a2,s1
    80002934:	0014849b          	addiw	s1,s1,1
    80002938:	fee78823          	sb	a4,-16(a5)
    } while ((x /= 10) != 0);
    8000293c:	00050713          	mv	a4,a0
    80002940:	02d55533          	divu	a0,a0,a3
    80002944:	00900793          	li	a5,9
    80002948:	fce7e6e3          	bltu	a5,a4,80002914 <_Z14kprintUnsignedm+0x18>

    while (--i >= 0)
    8000294c:	fff4849b          	addiw	s1,s1,-1
    80002950:	0004ce63          	bltz	s1,8000296c <_Z14kprintUnsignedm+0x70>
        __putc(buf[i]);
    80002954:	fe040793          	addi	a5,s0,-32
    80002958:	009787b3          	add	a5,a5,s1
    8000295c:	ff07c503          	lbu	a0,-16(a5)
    80002960:	00004097          	auipc	ra,0x4
    80002964:	6ec080e7          	jalr	1772(ra) # 8000704c <__putc>
    80002968:	fe5ff06f          	j	8000294c <_Z14kprintUnsignedm+0x50>

//    Riscv::unlock(sstatus);
}
    8000296c:	02813083          	ld	ra,40(sp)
    80002970:	02013403          	ld	s0,32(sp)
    80002974:	01813483          	ld	s1,24(sp)
    80002978:	03010113          	addi	sp,sp,48
    8000297c:	00008067          	ret

0000000080002980 <_ZN3TCB13threadWrapperEv>:
    TCB::contextSwitch(&old->context, &running->context);

    unlock()
}

void TCB::threadWrapper() {
    80002980:	fe010113          	addi	sp,sp,-32
    80002984:	00113c23          	sd	ra,24(sp)
    80002988:	00813823          	sd	s0,16(sp)
    8000298c:	00913423          	sd	s1,8(sp)
    80002990:	02010413          	addi	s0,sp,32
    Riscv::popSppSpie(running->privileged);
    80002994:	00007497          	auipc	s1,0x7
    80002998:	4a448493          	addi	s1,s1,1188 # 80009e38 <_ZN3TCB7runningE>
    8000299c:	0004b783          	ld	a5,0(s1)
    800029a0:	0687c503          	lbu	a0,104(a5)
    800029a4:	fffff097          	auipc	ra,0xfffff
    800029a8:	66c080e7          	jalr	1644(ra) # 80002010 <_ZN5Riscv10popSppSpieEb>
    running->body(running->args);
    800029ac:	0004b783          	ld	a5,0(s1)
    800029b0:	0087b703          	ld	a4,8(a5)
    800029b4:	0107b503          	ld	a0,16(a5)
    800029b8:	000700e7          	jalr	a4

//    kprintString("Ending thread...\n");

    __asm__ volatile ("li a0, 0x12");
    800029bc:	01200513          	li	a0,18
    __asm__ volatile ("ecall");
    800029c0:	00000073          	ecall
}
    800029c4:	01813083          	ld	ra,24(sp)
    800029c8:	01013403          	ld	s0,16(sp)
    800029cc:	00813483          	ld	s1,8(sp)
    800029d0:	02010113          	addi	sp,sp,32
    800029d4:	00008067          	ret

00000000800029d8 <_ZN3TCBC1EPFvPvES0_mb>:
TCB::TCB(Body body, void *args, uint64 timeSlice, bool privileged) :
    800029d8:	fd010113          	addi	sp,sp,-48
    800029dc:	02113423          	sd	ra,40(sp)
    800029e0:	02813023          	sd	s0,32(sp)
    800029e4:	00913c23          	sd	s1,24(sp)
    800029e8:	01213823          	sd	s2,16(sp)
    800029ec:	01313423          	sd	s3,8(sp)
    800029f0:	01413023          	sd	s4,0(sp)
    800029f4:	03010413          	addi	s0,sp,48
    800029f8:	00050493          	mv	s1,a0
    800029fc:	00058913          	mv	s2,a1
    80002a00:	00068a13          	mv	s4,a3
    80002a04:	00070993          	mv	s3,a4
        node(this) {
    80002a08:	00b53423          	sd	a1,8(a0)
    80002a0c:	00c53823          	sd	a2,16(a0)
        threadStack(body != nullptr ? (uint64 *) kmalloc(DEFAULT_STACK_SIZE * sizeof(uint64)) : nullptr),
    80002a10:	0a058863          	beqz	a1,80002ac0 <_ZN3TCBC1EPFvPvES0_mb+0xe8>
    80002a14:	00008537          	lui	a0,0x8
    80002a18:	fffff097          	auipc	ra,0xfffff
    80002a1c:	48c080e7          	jalr	1164(ra) # 80001ea4 <_Z7kmallocm>
        node(this) {
    80002a20:	00a4bc23          	sd	a0,24(s1)
        kernelStack((uint64 *) kmalloc(DEFAULT_STACK_SIZE * sizeof(uint64))),
    80002a24:	00008537          	lui	a0,0x8
    80002a28:	fffff097          	auipc	ra,0xfffff
    80002a2c:	47c080e7          	jalr	1148(ra) # 80001ea4 <_Z7kmallocm>
        node(this) {
    80002a30:	02a4b023          	sd	a0,32(s1)
    80002a34:	00000797          	auipc	a5,0x0
    80002a38:	f4c78793          	addi	a5,a5,-180 # 80002980 <_ZN3TCB13threadWrapperEv>
    80002a3c:	02f4b423          	sd	a5,40(s1)
        context({(uint64) &threadWrapper, threadStack != nullptr ? (uint64) (threadStack + DEFAULT_STACK_SIZE) : 0}),
    80002a40:	0184b783          	ld	a5,24(s1)
    80002a44:	08078263          	beqz	a5,80002ac8 <_ZN3TCBC1EPFvPvES0_mb+0xf0>
    80002a48:	00008737          	lui	a4,0x8
    80002a4c:	00e787b3          	add	a5,a5,a4
        node(this) {
    80002a50:	02f4b823          	sd	a5,48(s1)
    80002a54:	0344bc23          	sd	s4,56(s1)
    80002a58:	0404a023          	sw	zero,64(s1)
    80002a5c:	04848a13          	addi	s4,s1,72
    explicit ThreadList() = default;
    80002a60:	0404b423          	sd	zero,72(s1)
    80002a64:	0404b823          	sd	zero,80(s1)
    80002a68:	0404bc23          	sd	zero,88(s1)
    80002a6c:	0604a023          	sw	zero,96(s1)
    80002a70:	07348423          	sb	s3,104(s1)
    80002a74:	00100793          	li	a5,1
    80002a78:	06f4a823          	sw	a5,112(s1)
    80002a7c:	0604bc23          	sd	zero,120(s1)
    80002a80:	0804b023          	sd	zero,128(s1)
    80002a84:	0804b423          	sd	zero,136(s1)
    80002a88:	0804a823          	sw	zero,144(s1)
    80002a8c:	0804bc23          	sd	zero,152(s1)

class TCB;

class ThreadNode : public KernelObject {
public:
    ThreadNode(TCB *data, ThreadNode *next = nullptr, ThreadNode *prev = nullptr) : data(data), next(next), prev(prev) {}
    80002a90:	0a94b023          	sd	s1,160(s1)
    80002a94:	0a04b423          	sd	zero,168(s1)
    80002a98:	0a04b823          	sd	zero,176(s1)
    80002a9c:	0a04bc23          	sd	zero,184(s1)
    ssp = (uint64) (kernelStack + DEFAULT_STACK_SIZE);
    80002aa0:	000087b7          	lui	a5,0x8
    80002aa4:	00f50533          	add	a0,a0,a5
    80002aa8:	00a4b023          	sd	a0,0(s1)
    if (body != nullptr)
    80002aac:	04090663          	beqz	s2,80002af8 <_ZN3TCBC1EPFvPvES0_mb+0x120>
        Scheduler::put(this);
    80002ab0:	00048513          	mv	a0,s1
    80002ab4:	00000097          	auipc	ra,0x0
    80002ab8:	8a4080e7          	jalr	-1884(ra) # 80002358 <_ZN9Scheduler3putEP3TCB>
    80002abc:	03c0006f          	j	80002af8 <_ZN3TCBC1EPFvPvES0_mb+0x120>
        threadStack(body != nullptr ? (uint64 *) kmalloc(DEFAULT_STACK_SIZE * sizeof(uint64)) : nullptr),
    80002ac0:	00000513          	li	a0,0
    80002ac4:	f5dff06f          	j	80002a20 <_ZN3TCBC1EPFvPvES0_mb+0x48>
        context({(uint64) &threadWrapper, threadStack != nullptr ? (uint64) (threadStack + DEFAULT_STACK_SIZE) : 0}),
    80002ac8:	00000793          	li	a5,0
    80002acc:	f85ff06f          	j	80002a50 <_ZN3TCBC1EPFvPvES0_mb+0x78>
    80002ad0:	00050913          	mv	s2,a0
    80002ad4:	07048513          	addi	a0,s1,112
    80002ad8:	fffff097          	auipc	ra,0xfffff
    80002adc:	e3c080e7          	jalr	-452(ra) # 80001914 <_ZN15KernelSemaphoreD1Ev>
        node(this) {
    80002ae0:	000a0513          	mv	a0,s4
    80002ae4:	00001097          	auipc	ra,0x1
    80002ae8:	900080e7          	jalr	-1792(ra) # 800033e4 <_ZN10ThreadListD1Ev>
    80002aec:	00090513          	mv	a0,s2
    80002af0:	00008097          	auipc	ra,0x8
    80002af4:	458080e7          	jalr	1112(ra) # 8000af48 <_Unwind_Resume>
}
    80002af8:	02813083          	ld	ra,40(sp)
    80002afc:	02013403          	ld	s0,32(sp)
    80002b00:	01813483          	ld	s1,24(sp)
    80002b04:	01013903          	ld	s2,16(sp)
    80002b08:	00813983          	ld	s3,8(sp)
    80002b0c:	00013a03          	ld	s4,0(sp)
    80002b10:	03010113          	addi	sp,sp,48
    80002b14:	00008067          	ret

0000000080002b18 <_ZN3TCB12createThreadEPFvPvES0_>:
TCB *TCB::createThread(TCB::Body body, void *args) {
    80002b18:	fd010113          	addi	sp,sp,-48
    80002b1c:	02113423          	sd	ra,40(sp)
    80002b20:	02813023          	sd	s0,32(sp)
    80002b24:	00913c23          	sd	s1,24(sp)
    80002b28:	01213823          	sd	s2,16(sp)
    80002b2c:	01313423          	sd	s3,8(sp)
    80002b30:	03010413          	addi	s0,sp,48
    80002b34:	00050913          	mv	s2,a0
    80002b38:	00058993          	mv	s3,a1
        return kmalloc(size);
    80002b3c:	0c000513          	li	a0,192
    80002b40:	fffff097          	auipc	ra,0xfffff
    80002b44:	364080e7          	jalr	868(ra) # 80001ea4 <_Z7kmallocm>
    80002b48:	00050493          	mv	s1,a0
    return new TCB(body, args, DEFAULT_TIME_SLICE);
    80002b4c:	00000713          	li	a4,0
    80002b50:	00200693          	li	a3,2
    80002b54:	00098613          	mv	a2,s3
    80002b58:	00090593          	mv	a1,s2
    80002b5c:	00000097          	auipc	ra,0x0
    80002b60:	e7c080e7          	jalr	-388(ra) # 800029d8 <_ZN3TCBC1EPFvPvES0_mb>
    80002b64:	0200006f          	j	80002b84 <_ZN3TCB12createThreadEPFvPvES0_+0x6c>
    80002b68:	00050913          	mv	s2,a0
        kfree(addr);
    80002b6c:	00048513          	mv	a0,s1
    80002b70:	fffff097          	auipc	ra,0xfffff
    80002b74:	374080e7          	jalr	884(ra) # 80001ee4 <_Z5kfreePv>
    80002b78:	00090513          	mv	a0,s2
    80002b7c:	00008097          	auipc	ra,0x8
    80002b80:	3cc080e7          	jalr	972(ra) # 8000af48 <_Unwind_Resume>
}
    80002b84:	00048513          	mv	a0,s1
    80002b88:	02813083          	ld	ra,40(sp)
    80002b8c:	02013403          	ld	s0,32(sp)
    80002b90:	01813483          	ld	s1,24(sp)
    80002b94:	01013903          	ld	s2,16(sp)
    80002b98:	00813983          	ld	s3,8(sp)
    80002b9c:	03010113          	addi	sp,sp,48
    80002ba0:	00008067          	ret

0000000080002ba4 <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    80002ba4:	fd010113          	addi	sp,sp,-48
    80002ba8:	02113423          	sd	ra,40(sp)
    80002bac:	02813023          	sd	s0,32(sp)
    80002bb0:	00913c23          	sd	s1,24(sp)
    80002bb4:	03010413          	addi	s0,sp,48
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80002bb8:	100027f3          	csrr	a5,sstatus
    80002bbc:	fcf43823          	sd	a5,-48(s0)
    return sstatus;
    80002bc0:	fd043783          	ld	a5,-48(s0)
    lock()
    80002bc4:	fcf43c23          	sd	a5,-40(s0)
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80002bc8:	00200793          	li	a5,2
    80002bcc:	1007b073          	csrc	sstatus,a5
    TCB *old = running;
    80002bd0:	00007497          	auipc	s1,0x7
    80002bd4:	2684b483          	ld	s1,616(s1) # 80009e38 <_ZN3TCB7runningE>
        return status == READY;
    80002bd8:	0404a783          	lw	a5,64(s1)
    if (old->isReady()) Scheduler::put(old);
    80002bdc:	04078e63          	beqz	a5,80002c38 <_ZN3TCB8dispatchEv+0x94>
    else if (old->isFinished()) {
    80002be0:	00100713          	li	a4,1
    80002be4:	06e78263          	beq	a5,a4,80002c48 <_ZN3TCB8dispatchEv+0xa4>
    running = Scheduler::get();
    80002be8:	fffff097          	auipc	ra,0xfffff
    80002bec:	704080e7          	jalr	1796(ra) # 800022ec <_ZN9Scheduler3getEv>
    80002bf0:	00007797          	auipc	a5,0x7
    80002bf4:	24a7b423          	sd	a0,584(a5) # 80009e38 <_ZN3TCB7runningE>
    if (!running) {
    80002bf8:	04050e63          	beqz	a0,80002c54 <_ZN3TCB8dispatchEv+0xb0>
    TCB::timeSliceCounter = 0;
    80002bfc:	00007797          	auipc	a5,0x7
    80002c00:	23c78793          	addi	a5,a5,572 # 80009e38 <_ZN3TCB7runningE>
    80002c04:	0007b423          	sd	zero,8(a5)
    TCB::contextSwitch(&old->context, &running->context);
    80002c08:	0007b583          	ld	a1,0(a5)
    80002c0c:	02858593          	addi	a1,a1,40
    80002c10:	02848513          	addi	a0,s1,40
    80002c14:	ffffe097          	auipc	ra,0xffffe
    80002c18:	3ec080e7          	jalr	1004(ra) # 80001000 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
    unlock()
    80002c1c:	fd843783          	ld	a5,-40(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80002c20:	10079073          	csrw	sstatus,a5
}
    80002c24:	02813083          	ld	ra,40(sp)
    80002c28:	02013403          	ld	s0,32(sp)
    80002c2c:	01813483          	ld	s1,24(sp)
    80002c30:	03010113          	addi	sp,sp,48
    80002c34:	00008067          	ret
    if (old->isReady()) Scheduler::put(old);
    80002c38:	00048513          	mv	a0,s1
    80002c3c:	fffff097          	auipc	ra,0xfffff
    80002c40:	71c080e7          	jalr	1820(ra) # 80002358 <_ZN9Scheduler3putEP3TCB>
    80002c44:	fa5ff06f          	j	80002be8 <_ZN3TCB8dispatchEv+0x44>
        ThreadCollector::signal();
    80002c48:	00000097          	auipc	ra,0x0
    80002c4c:	42c080e7          	jalr	1068(ra) # 80003074 <_ZN15ThreadCollector6signalEv>
    80002c50:	f99ff06f          	j	80002be8 <_ZN3TCB8dispatchEv+0x44>
        running = IdleThread::getIdleThread();
    80002c54:	ffffe097          	auipc	ra,0xffffe
    80002c58:	6dc080e7          	jalr	1756(ra) # 80001330 <_ZN10IdleThread13getIdleThreadEv>
    80002c5c:	00007797          	auipc	a5,0x7
    80002c60:	1ca7be23          	sd	a0,476(a5) # 80009e38 <_ZN3TCB7runningE>
    80002c64:	f99ff06f          	j	80002bfc <_ZN3TCB8dispatchEv+0x58>

0000000080002c68 <_ZN3TCB4exitEv>:
void TCB::exit() {
    80002c68:	ff010113          	addi	sp,sp,-16
    80002c6c:	00113423          	sd	ra,8(sp)
    80002c70:	00813023          	sd	s0,0(sp)
    80002c74:	01010413          	addi	s0,sp,16
    running->setFinished();
    80002c78:	00007517          	auipc	a0,0x7
    80002c7c:	1c053503          	ld	a0,448(a0) # 80009e38 <_ZN3TCB7runningE>
        status = FINISHED;
    80002c80:	00100793          	li	a5,1
    80002c84:	04f52023          	sw	a5,64(a0)
    running->mutex.wait();
    80002c88:	07050513          	addi	a0,a0,112
    80002c8c:	fffff097          	auipc	ra,0xfffff
    80002c90:	298080e7          	jalr	664(ra) # 80001f24 <_ZN5Mutex4waitEv>
    while (!running->waitingToJoin.isEmpty()) {
    80002c94:	00007517          	auipc	a0,0x7
    80002c98:	1a453503          	ld	a0,420(a0) # 80009e38 <_ZN3TCB7runningE>
        return size == 0;
    80002c9c:	06052783          	lw	a5,96(a0)
    80002ca0:	02078063          	beqz	a5,80002cc0 <_ZN3TCB4exitEv+0x58>
        TCB *thr = running->waitingToJoin.removeFirst();
    80002ca4:	04850513          	addi	a0,a0,72
    80002ca8:	00000097          	auipc	ra,0x0
    80002cac:	598080e7          	jalr	1432(ra) # 80003240 <_ZN10ThreadList11removeFirstEv>
        status = READY;
    80002cb0:	04052023          	sw	zero,64(a0)
        Scheduler::put(thr);
    80002cb4:	fffff097          	auipc	ra,0xfffff
    80002cb8:	6a4080e7          	jalr	1700(ra) # 80002358 <_ZN9Scheduler3putEP3TCB>
    while (!running->waitingToJoin.isEmpty()) {
    80002cbc:	fd9ff06f          	j	80002c94 <_ZN3TCB4exitEv+0x2c>
    running->mutex.signal();
    80002cc0:	07050513          	addi	a0,a0,112
    80002cc4:	fffff097          	auipc	ra,0xfffff
    80002cc8:	2d4080e7          	jalr	724(ra) # 80001f98 <_ZN5Mutex6signalEv>
    ThreadCollector::put(running);
    80002ccc:	00007517          	auipc	a0,0x7
    80002cd0:	16c53503          	ld	a0,364(a0) # 80009e38 <_ZN3TCB7runningE>
    80002cd4:	00000097          	auipc	ra,0x0
    80002cd8:	3d4080e7          	jalr	980(ra) # 800030a8 <_ZN15ThreadCollector3putEP3TCB>
    running->dispatch();
    80002cdc:	00000097          	auipc	ra,0x0
    80002ce0:	ec8080e7          	jalr	-312(ra) # 80002ba4 <_ZN3TCB8dispatchEv>
}
    80002ce4:	00813083          	ld	ra,8(sp)
    80002ce8:	00013403          	ld	s0,0(sp)
    80002cec:	01010113          	addi	sp,sp,16
    80002cf0:	00008067          	ret

0000000080002cf4 <_ZN3TCB14readSavedStackEv>:

void TCB::readSavedStack() {
    80002cf4:	ff010113          	addi	sp,sp,-16
    80002cf8:	00813423          	sd	s0,8(sp)
    80002cfc:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sscratch, %[ssp]" : : [ssp] "r"(TCB::running->ssp));
    80002d00:	00007797          	auipc	a5,0x7
    80002d04:	1387b783          	ld	a5,312(a5) # 80009e38 <_ZN3TCB7runningE>
    80002d08:	0007b783          	ld	a5,0(a5)
    80002d0c:	14079073          	csrw	sscratch,a5
}
    80002d10:	00813403          	ld	s0,8(sp)
    80002d14:	01010113          	addi	sp,sp,16
    80002d18:	00008067          	ret

0000000080002d1c <_ZN3TCB15writeSavedStackEv>:

void TCB::writeSavedStack() {
    80002d1c:	ff010113          	addi	sp,sp,-16
    80002d20:	00813423          	sd	s0,8(sp)
    80002d24:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrr %[ssp], sscratch" : [ssp] "=r"(TCB::running->ssp));
    80002d28:	14002773          	csrr	a4,sscratch
    80002d2c:	00007797          	auipc	a5,0x7
    80002d30:	10c7b783          	ld	a5,268(a5) # 80009e38 <_ZN3TCB7runningE>
    80002d34:	00e7b023          	sd	a4,0(a5)
}
    80002d38:	00813403          	ld	s0,8(sp)
    80002d3c:	01010113          	addi	sp,sp,16
    80002d40:	00008067          	ret

0000000080002d44 <_ZN3TCB4joinEv>:
        return status == FINISHED;
    80002d44:	04052703          	lw	a4,64(a0)

int TCB::join() {
    if (isFinished()) return 0;
    80002d48:	00100793          	li	a5,1
    80002d4c:	06f70c63          	beq	a4,a5,80002dc4 <_ZN3TCB4joinEv+0x80>
int TCB::join() {
    80002d50:	fe010113          	addi	sp,sp,-32
    80002d54:	00113c23          	sd	ra,24(sp)
    80002d58:	00813823          	sd	s0,16(sp)
    80002d5c:	00913423          	sd	s1,8(sp)
    80002d60:	01213023          	sd	s2,0(sp)
    80002d64:	02010413          	addi	s0,sp,32
    80002d68:	00050493          	mv	s1,a0

    mutex.wait();
    80002d6c:	07050913          	addi	s2,a0,112
    80002d70:	00090513          	mv	a0,s2
    80002d74:	fffff097          	auipc	ra,0xfffff
    80002d78:	1b0080e7          	jalr	432(ra) # 80001f24 <_ZN5Mutex4waitEv>

    running->setBlocked();
    80002d7c:	00007597          	auipc	a1,0x7
    80002d80:	0bc5b583          	ld	a1,188(a1) # 80009e38 <_ZN3TCB7runningE>
        status = BLOCKED;
    80002d84:	00200793          	li	a5,2
    80002d88:	04f5a023          	sw	a5,64(a1)
    waitingToJoin.addLast(&running->node);
    80002d8c:	0a058593          	addi	a1,a1,160
    80002d90:	04848513          	addi	a0,s1,72
    80002d94:	00000097          	auipc	ra,0x0
    80002d98:	468080e7          	jalr	1128(ra) # 800031fc <_ZN10ThreadList7addLastEP10ThreadNode>

    mutex.signal();
    80002d9c:	00090513          	mv	a0,s2
    80002da0:	fffff097          	auipc	ra,0xfffff
    80002da4:	1f8080e7          	jalr	504(ra) # 80001f98 <_ZN5Mutex6signalEv>

    return 0;
}
    80002da8:	00000513          	li	a0,0
    80002dac:	01813083          	ld	ra,24(sp)
    80002db0:	01013403          	ld	s0,16(sp)
    80002db4:	00813483          	ld	s1,8(sp)
    80002db8:	00013903          	ld	s2,0(sp)
    80002dbc:	02010113          	addi	sp,sp,32
    80002dc0:	00008067          	ret
    80002dc4:	00000513          	li	a0,0
    80002dc8:	00008067          	ret

0000000080002dcc <_ZN3TCBD1Ev>:

TCB::~TCB() {
    80002dcc:	fe010113          	addi	sp,sp,-32
    80002dd0:	00113c23          	sd	ra,24(sp)
    80002dd4:	00813823          	sd	s0,16(sp)
    80002dd8:	00913423          	sd	s1,8(sp)
    80002ddc:	02010413          	addi	s0,sp,32
    80002de0:	00050493          	mv	s1,a0
    kfree(kernelStack);
    80002de4:	02053503          	ld	a0,32(a0)
    80002de8:	fffff097          	auipc	ra,0xfffff
    80002dec:	0fc080e7          	jalr	252(ra) # 80001ee4 <_Z5kfreePv>
    kfree(threadStack);
    80002df0:	0184b503          	ld	a0,24(s1)
    80002df4:	fffff097          	auipc	ra,0xfffff
    80002df8:	0f0080e7          	jalr	240(ra) # 80001ee4 <_Z5kfreePv>
    80002dfc:	07048513          	addi	a0,s1,112
    80002e00:	fffff097          	auipc	ra,0xfffff
    80002e04:	b14080e7          	jalr	-1260(ra) # 80001914 <_ZN15KernelSemaphoreD1Ev>
TCB::~TCB() {
    80002e08:	04848513          	addi	a0,s1,72
    80002e0c:	00000097          	auipc	ra,0x0
    80002e10:	5d8080e7          	jalr	1496(ra) # 800033e4 <_ZN10ThreadListD1Ev>
}
    80002e14:	01813083          	ld	ra,24(sp)
    80002e18:	01013403          	ld	s0,16(sp)
    80002e1c:	00813483          	ld	s1,8(sp)
    80002e20:	02010113          	addi	sp,sp,32
    80002e24:	00008067          	ret

0000000080002e28 <_ZN15ThreadCollectorC1Ev>:
    getInstance()->mutex.wait();
    getInstance()->finishedThreads.addLast(tcb->getNode());
    getInstance()->mutex.signal();
}

ThreadCollector::ThreadCollector() : readyToDelete(0) {
    80002e28:	fc010113          	addi	sp,sp,-64
    80002e2c:	02113c23          	sd	ra,56(sp)
    80002e30:	02813823          	sd	s0,48(sp)
    80002e34:	02913423          	sd	s1,40(sp)
    80002e38:	03213023          	sd	s2,32(sp)
    80002e3c:	01313c23          	sd	s3,24(sp)
    80002e40:	01413823          	sd	s4,16(sp)
    80002e44:	01513423          	sd	s5,8(sp)
    80002e48:	04010413          	addi	s0,sp,64
    80002e4c:	00050493          	mv	s1,a0
    80002e50:	00053023          	sd	zero,0(a0)
    80002e54:	00850993          	addi	s3,a0,8
    explicit ThreadList() = default;
    80002e58:	00053423          	sd	zero,8(a0)
    80002e5c:	00053823          	sd	zero,16(a0)
    80002e60:	00053c23          	sd	zero,24(a0)
    80002e64:	02052023          	sw	zero,32(a0)
    80002e68:	00100793          	li	a5,1
    80002e6c:	02f52423          	sw	a5,40(a0)
    80002e70:	02053823          	sd	zero,48(a0)
    80002e74:	02053c23          	sd	zero,56(a0)
    80002e78:	04053023          	sd	zero,64(a0)
    80002e7c:	04052423          	sw	zero,72(a0)
    80002e80:	04053823          	sd	zero,80(a0)
    80002e84:	05850a13          	addi	s4,a0,88
    80002e88:	04052c23          	sw	zero,88(a0)
    80002e8c:	06053023          	sd	zero,96(a0)
    80002e90:	06053423          	sd	zero,104(a0)
    80002e94:	06053823          	sd	zero,112(a0)
    80002e98:	06052c23          	sw	zero,120(a0)
        return kmalloc(size);
    80002e9c:	0c000513          	li	a0,192
    80002ea0:	fffff097          	auipc	ra,0xfffff
    80002ea4:	004080e7          	jalr	4(ra) # 80001ea4 <_Z7kmallocm>
    80002ea8:	00050913          	mv	s2,a0
    threadCollector = new TCB([](void *){ThreadCollector::run();}, nullptr, DEFAULT_TIME_SLICE, true);
    80002eac:	00100713          	li	a4,1
    80002eb0:	00200693          	li	a3,2
    80002eb4:	00000613          	li	a2,0
    80002eb8:	00000597          	auipc	a1,0x0
    80002ebc:	2e458593          	addi	a1,a1,740 # 8000319c <_ZZN15ThreadCollectorC4EvENUlPvE_4_FUNES0_>
    80002ec0:	00000097          	auipc	ra,0x0
    80002ec4:	b18080e7          	jalr	-1256(ra) # 800029d8 <_ZN3TCBC1EPFvPvES0_mb>
    80002ec8:	0124b023          	sd	s2,0(s1)
}
    80002ecc:	03813083          	ld	ra,56(sp)
    80002ed0:	03013403          	ld	s0,48(sp)
    80002ed4:	02813483          	ld	s1,40(sp)
    80002ed8:	02013903          	ld	s2,32(sp)
    80002edc:	01813983          	ld	s3,24(sp)
    80002ee0:	01013a03          	ld	s4,16(sp)
    80002ee4:	00813a83          	ld	s5,8(sp)
    80002ee8:	04010113          	addi	sp,sp,64
    80002eec:	00008067          	ret
    80002ef0:	00050a93          	mv	s5,a0
        kfree(addr);
    80002ef4:	00090513          	mv	a0,s2
    80002ef8:	fffff097          	auipc	ra,0xfffff
    80002efc:	fec080e7          	jalr	-20(ra) # 80001ee4 <_Z5kfreePv>
    80002f00:	000a8913          	mv	s2,s5
ThreadCollector::ThreadCollector() : readyToDelete(0) {
    80002f04:	000a0513          	mv	a0,s4
    80002f08:	fffff097          	auipc	ra,0xfffff
    80002f0c:	a0c080e7          	jalr	-1524(ra) # 80001914 <_ZN15KernelSemaphoreD1Ev>
    80002f10:	02848513          	addi	a0,s1,40
    80002f14:	fffff097          	auipc	ra,0xfffff
    80002f18:	a00080e7          	jalr	-1536(ra) # 80001914 <_ZN15KernelSemaphoreD1Ev>
    80002f1c:	00098513          	mv	a0,s3
    80002f20:	00000097          	auipc	ra,0x0
    80002f24:	4c4080e7          	jalr	1220(ra) # 800033e4 <_ZN10ThreadListD1Ev>
    80002f28:	00090513          	mv	a0,s2
    80002f2c:	00008097          	auipc	ra,0x8
    80002f30:	01c080e7          	jalr	28(ra) # 8000af48 <_Unwind_Resume>
    80002f34:	00050913          	mv	s2,a0
    80002f38:	fcdff06f          	j	80002f04 <_ZN15ThreadCollectorC1Ev+0xdc>

0000000080002f3c <_ZN15ThreadCollectorD1Ev>:
        delete getInstance()->finishedThreads.removeFirst();
        getInstance()->mutex.signal();
    }
}

ThreadCollector::~ThreadCollector() {
    80002f3c:	fe010113          	addi	sp,sp,-32
    80002f40:	00113c23          	sd	ra,24(sp)
    80002f44:	00813823          	sd	s0,16(sp)
    80002f48:	00913423          	sd	s1,8(sp)
    80002f4c:	01213023          	sd	s2,0(sp)
    80002f50:	02010413          	addi	s0,sp,32
    80002f54:	00050913          	mv	s2,a0
        return size == 0;
    80002f58:	02092783          	lw	a5,32(s2)
    while (!finishedThreads.isEmpty()) {
    80002f5c:	02078863          	beqz	a5,80002f8c <_ZN15ThreadCollectorD1Ev+0x50>
//        kprintString("Collector deleting...\n");
        delete finishedThreads.removeFirst();
    80002f60:	00890513          	addi	a0,s2,8
    80002f64:	00000097          	auipc	ra,0x0
    80002f68:	2dc080e7          	jalr	732(ra) # 80003240 <_ZN10ThreadList11removeFirstEv>
    80002f6c:	00050493          	mv	s1,a0
    80002f70:	fe0504e3          	beqz	a0,80002f58 <_ZN15ThreadCollectorD1Ev+0x1c>
    80002f74:	00000097          	auipc	ra,0x0
    80002f78:	e58080e7          	jalr	-424(ra) # 80002dcc <_ZN3TCBD1Ev>
    80002f7c:	00048513          	mv	a0,s1
    80002f80:	fffff097          	auipc	ra,0xfffff
    80002f84:	f64080e7          	jalr	-156(ra) # 80001ee4 <_Z5kfreePv>
    }
    80002f88:	fd1ff06f          	j	80002f58 <_ZN15ThreadCollectorD1Ev+0x1c>
    }
    delete threadCollector;
    80002f8c:	00093483          	ld	s1,0(s2)
    80002f90:	00048e63          	beqz	s1,80002fac <_ZN15ThreadCollectorD1Ev+0x70>
    80002f94:	00048513          	mv	a0,s1
    80002f98:	00000097          	auipc	ra,0x0
    80002f9c:	e34080e7          	jalr	-460(ra) # 80002dcc <_ZN3TCBD1Ev>
        kfree(addr);
    80002fa0:	00048513          	mv	a0,s1
    80002fa4:	fffff097          	auipc	ra,0xfffff
    80002fa8:	f40080e7          	jalr	-192(ra) # 80001ee4 <_Z5kfreePv>
ThreadCollector::~ThreadCollector() {
    80002fac:	05890513          	addi	a0,s2,88
    80002fb0:	fffff097          	auipc	ra,0xfffff
    80002fb4:	964080e7          	jalr	-1692(ra) # 80001914 <_ZN15KernelSemaphoreD1Ev>
    80002fb8:	02890513          	addi	a0,s2,40
    80002fbc:	fffff097          	auipc	ra,0xfffff
    80002fc0:	958080e7          	jalr	-1704(ra) # 80001914 <_ZN15KernelSemaphoreD1Ev>
    80002fc4:	00890513          	addi	a0,s2,8
    80002fc8:	00000097          	auipc	ra,0x0
    80002fcc:	41c080e7          	jalr	1052(ra) # 800033e4 <_ZN10ThreadListD1Ev>
}
    80002fd0:	01813083          	ld	ra,24(sp)
    80002fd4:	01013403          	ld	s0,16(sp)
    80002fd8:	00813483          	ld	s1,8(sp)
    80002fdc:	00013903          	ld	s2,0(sp)
    80002fe0:	02010113          	addi	sp,sp,32
    80002fe4:	00008067          	ret

0000000080002fe8 <_ZN15ThreadCollector11getInstanceEv>:

ThreadCollector *ThreadCollector::getInstance() {
    if (!instance) instance = new ThreadCollector;
    80002fe8:	00007797          	auipc	a5,0x7
    80002fec:	e607b783          	ld	a5,-416(a5) # 80009e48 <_ZN15ThreadCollector8instanceE>
    80002ff0:	00078863          	beqz	a5,80003000 <_ZN15ThreadCollector11getInstanceEv+0x18>
    return instance;
    80002ff4:	00007517          	auipc	a0,0x7
    80002ff8:	e5453503          	ld	a0,-428(a0) # 80009e48 <_ZN15ThreadCollector8instanceE>
}
    80002ffc:	00008067          	ret
ThreadCollector *ThreadCollector::getInstance() {
    80003000:	fe010113          	addi	sp,sp,-32
    80003004:	00113c23          	sd	ra,24(sp)
    80003008:	00813823          	sd	s0,16(sp)
    8000300c:	00913423          	sd	s1,8(sp)
    80003010:	01213023          	sd	s2,0(sp)
    80003014:	02010413          	addi	s0,sp,32
        return kmalloc(size);
    80003018:	08000513          	li	a0,128
    8000301c:	fffff097          	auipc	ra,0xfffff
    80003020:	e88080e7          	jalr	-376(ra) # 80001ea4 <_Z7kmallocm>
    80003024:	00050493          	mv	s1,a0
    if (!instance) instance = new ThreadCollector;
    80003028:	00000097          	auipc	ra,0x0
    8000302c:	e00080e7          	jalr	-512(ra) # 80002e28 <_ZN15ThreadCollectorC1Ev>
    80003030:	00007797          	auipc	a5,0x7
    80003034:	e097bc23          	sd	s1,-488(a5) # 80009e48 <_ZN15ThreadCollector8instanceE>
    return instance;
    80003038:	00007517          	auipc	a0,0x7
    8000303c:	e1053503          	ld	a0,-496(a0) # 80009e48 <_ZN15ThreadCollector8instanceE>
}
    80003040:	01813083          	ld	ra,24(sp)
    80003044:	01013403          	ld	s0,16(sp)
    80003048:	00813483          	ld	s1,8(sp)
    8000304c:	00013903          	ld	s2,0(sp)
    80003050:	02010113          	addi	sp,sp,32
    80003054:	00008067          	ret
    80003058:	00050913          	mv	s2,a0
        kfree(addr);
    8000305c:	00048513          	mv	a0,s1
    80003060:	fffff097          	auipc	ra,0xfffff
    80003064:	e84080e7          	jalr	-380(ra) # 80001ee4 <_Z5kfreePv>
    80003068:	00090513          	mv	a0,s2
    8000306c:	00008097          	auipc	ra,0x8
    80003070:	edc080e7          	jalr	-292(ra) # 8000af48 <_Unwind_Resume>

0000000080003074 <_ZN15ThreadCollector6signalEv>:
void ThreadCollector::signal() {
    80003074:	ff010113          	addi	sp,sp,-16
    80003078:	00113423          	sd	ra,8(sp)
    8000307c:	00813023          	sd	s0,0(sp)
    80003080:	01010413          	addi	s0,sp,16
    getInstance()->readyToDelete.signal();
    80003084:	00000097          	auipc	ra,0x0
    80003088:	f64080e7          	jalr	-156(ra) # 80002fe8 <_ZN15ThreadCollector11getInstanceEv>
    8000308c:	05850513          	addi	a0,a0,88
    80003090:	fffff097          	auipc	ra,0xfffff
    80003094:	828080e7          	jalr	-2008(ra) # 800018b8 <_ZN15KernelSemaphore6signalEv>
}
    80003098:	00813083          	ld	ra,8(sp)
    8000309c:	00013403          	ld	s0,0(sp)
    800030a0:	01010113          	addi	sp,sp,16
    800030a4:	00008067          	ret

00000000800030a8 <_ZN15ThreadCollector3putEP3TCB>:
void ThreadCollector::put(TCB *tcb) {
    800030a8:	fe010113          	addi	sp,sp,-32
    800030ac:	00113c23          	sd	ra,24(sp)
    800030b0:	00813823          	sd	s0,16(sp)
    800030b4:	00913423          	sd	s1,8(sp)
    800030b8:	02010413          	addi	s0,sp,32
    800030bc:	00050493          	mv	s1,a0
    getInstance()->mutex.wait();
    800030c0:	00000097          	auipc	ra,0x0
    800030c4:	f28080e7          	jalr	-216(ra) # 80002fe8 <_ZN15ThreadCollector11getInstanceEv>
    800030c8:	02850513          	addi	a0,a0,40
    800030cc:	fffff097          	auipc	ra,0xfffff
    800030d0:	e58080e7          	jalr	-424(ra) # 80001f24 <_ZN5Mutex4waitEv>
    getInstance()->finishedThreads.addLast(tcb->getNode());
    800030d4:	00000097          	auipc	ra,0x0
    800030d8:	f14080e7          	jalr	-236(ra) # 80002fe8 <_ZN15ThreadCollector11getInstanceEv>
    800030dc:	0a048593          	addi	a1,s1,160
    800030e0:	00850513          	addi	a0,a0,8
    800030e4:	00000097          	auipc	ra,0x0
    800030e8:	118080e7          	jalr	280(ra) # 800031fc <_ZN10ThreadList7addLastEP10ThreadNode>
    getInstance()->mutex.signal();
    800030ec:	00000097          	auipc	ra,0x0
    800030f0:	efc080e7          	jalr	-260(ra) # 80002fe8 <_ZN15ThreadCollector11getInstanceEv>
    800030f4:	02850513          	addi	a0,a0,40
    800030f8:	fffff097          	auipc	ra,0xfffff
    800030fc:	ea0080e7          	jalr	-352(ra) # 80001f98 <_ZN5Mutex6signalEv>
}
    80003100:	01813083          	ld	ra,24(sp)
    80003104:	01013403          	ld	s0,16(sp)
    80003108:	00813483          	ld	s1,8(sp)
    8000310c:	02010113          	addi	sp,sp,32
    80003110:	00008067          	ret

0000000080003114 <_ZN15ThreadCollector3runEv>:
[[noreturn]] void ThreadCollector::run() {
    80003114:	fe010113          	addi	sp,sp,-32
    80003118:	00113c23          	sd	ra,24(sp)
    8000311c:	00813823          	sd	s0,16(sp)
    80003120:	00913423          	sd	s1,8(sp)
    80003124:	02010413          	addi	s0,sp,32
    80003128:	0300006f          	j	80003158 <_ZN15ThreadCollector3runEv+0x44>
    8000312c:	00050493          	mv	s1,a0
        delete getInstance()->finishedThreads.removeFirst();
    80003130:	00000097          	auipc	ra,0x0
    80003134:	c9c080e7          	jalr	-868(ra) # 80002dcc <_ZN3TCBD1Ev>
    80003138:	00048513          	mv	a0,s1
    8000313c:	fffff097          	auipc	ra,0xfffff
    80003140:	da8080e7          	jalr	-600(ra) # 80001ee4 <_Z5kfreePv>
        getInstance()->mutex.signal();
    80003144:	00000097          	auipc	ra,0x0
    80003148:	ea4080e7          	jalr	-348(ra) # 80002fe8 <_ZN15ThreadCollector11getInstanceEv>
    8000314c:	02850513          	addi	a0,a0,40
    80003150:	fffff097          	auipc	ra,0xfffff
    80003154:	e48080e7          	jalr	-440(ra) # 80001f98 <_ZN5Mutex6signalEv>
        getInstance()->readyToDelete.wait();
    80003158:	00000097          	auipc	ra,0x0
    8000315c:	e90080e7          	jalr	-368(ra) # 80002fe8 <_ZN15ThreadCollector11getInstanceEv>
    80003160:	05850513          	addi	a0,a0,88
    80003164:	ffffe097          	auipc	ra,0xffffe
    80003168:	6f4080e7          	jalr	1780(ra) # 80001858 <_ZN15KernelSemaphore4waitEv>
        getInstance()->mutex.wait();
    8000316c:	00000097          	auipc	ra,0x0
    80003170:	e7c080e7          	jalr	-388(ra) # 80002fe8 <_ZN15ThreadCollector11getInstanceEv>
    80003174:	02850513          	addi	a0,a0,40
    80003178:	fffff097          	auipc	ra,0xfffff
    8000317c:	dac080e7          	jalr	-596(ra) # 80001f24 <_ZN5Mutex4waitEv>
        delete getInstance()->finishedThreads.removeFirst();
    80003180:	00000097          	auipc	ra,0x0
    80003184:	e68080e7          	jalr	-408(ra) # 80002fe8 <_ZN15ThreadCollector11getInstanceEv>
    80003188:	00850513          	addi	a0,a0,8
    8000318c:	00000097          	auipc	ra,0x0
    80003190:	0b4080e7          	jalr	180(ra) # 80003240 <_ZN10ThreadList11removeFirstEv>
    80003194:	f8051ce3          	bnez	a0,8000312c <_ZN15ThreadCollector3runEv+0x18>
    80003198:	fadff06f          	j	80003144 <_ZN15ThreadCollector3runEv+0x30>

000000008000319c <_ZZN15ThreadCollectorC4EvENUlPvE_4_FUNES0_>:
    threadCollector = new TCB([](void *){ThreadCollector::run();}, nullptr, DEFAULT_TIME_SLICE, true);
    8000319c:	ff010113          	addi	sp,sp,-16
    800031a0:	00113423          	sd	ra,8(sp)
    800031a4:	00813023          	sd	s0,0(sp)
    800031a8:	01010413          	addi	s0,sp,16
    800031ac:	00000097          	auipc	ra,0x0
    800031b0:	f68080e7          	jalr	-152(ra) # 80003114 <_ZN15ThreadCollector3runEv>

00000000800031b4 <_ZN10ThreadList8addFirstEP10ThreadNode>:
// Created by xparh on 5/13/2022.
//

#include "../h/ThreadList.h"

void ThreadList::addFirst(ThreadNode *elem) {
    800031b4:	ff010113          	addi	sp,sp,-16
    800031b8:	00813423          	sd	s0,8(sp)
    800031bc:	01010413          	addi	s0,sp,16
    elem->next = head;
    800031c0:	00053783          	ld	a5,0(a0)
    800031c4:	00f5b423          	sd	a5,8(a1)
    elem->prev = nullptr;
    800031c8:	0005b823          	sd	zero,16(a1)
    if (head) head->prev = elem;
    800031cc:	00053783          	ld	a5,0(a0)
    800031d0:	02078263          	beqz	a5,800031f4 <_ZN10ThreadList8addFirstEP10ThreadNode+0x40>
    800031d4:	00b7b823          	sd	a1,16(a5)
    else tail = elem;
    head = elem;
    800031d8:	00b53023          	sd	a1,0(a0)

    size++;
    800031dc:	01852783          	lw	a5,24(a0)
    800031e0:	0017879b          	addiw	a5,a5,1
    800031e4:	00f52c23          	sw	a5,24(a0)
}
    800031e8:	00813403          	ld	s0,8(sp)
    800031ec:	01010113          	addi	sp,sp,16
    800031f0:	00008067          	ret
    else tail = elem;
    800031f4:	00b53423          	sd	a1,8(a0)
    800031f8:	fe1ff06f          	j	800031d8 <_ZN10ThreadList8addFirstEP10ThreadNode+0x24>

00000000800031fc <_ZN10ThreadList7addLastEP10ThreadNode>:

void ThreadList::addLast(ThreadNode *elem) {
    800031fc:	ff010113          	addi	sp,sp,-16
    80003200:	00813423          	sd	s0,8(sp)
    80003204:	01010413          	addi	s0,sp,16
    elem->next = nullptr;
    80003208:	0005b423          	sd	zero,8(a1)
    elem->prev = tail;
    8000320c:	00853783          	ld	a5,8(a0)
    80003210:	00f5b823          	sd	a5,16(a1)
    if (tail) tail->next = elem;
    80003214:	02078263          	beqz	a5,80003238 <_ZN10ThreadList7addLastEP10ThreadNode+0x3c>
    80003218:	00b7b423          	sd	a1,8(a5)
    else head = elem;
    tail = elem;
    8000321c:	00b53423          	sd	a1,8(a0)

    size++;
    80003220:	01852783          	lw	a5,24(a0)
    80003224:	0017879b          	addiw	a5,a5,1
    80003228:	00f52c23          	sw	a5,24(a0)
}
    8000322c:	00813403          	ld	s0,8(sp)
    80003230:	01010113          	addi	sp,sp,16
    80003234:	00008067          	ret
    else head = elem;
    80003238:	00b53023          	sd	a1,0(a0)
    8000323c:	fe1ff06f          	j	8000321c <_ZN10ThreadList7addLastEP10ThreadNode+0x20>

0000000080003240 <_ZN10ThreadList11removeFirstEv>:

TCB *ThreadList::removeFirst() {
    80003240:	ff010113          	addi	sp,sp,-16
    80003244:	00813423          	sd	s0,8(sp)
    80003248:	01010413          	addi	s0,sp,16
    if (!head) return nullptr;
    8000324c:	00053703          	ld	a4,0(a0)
    80003250:	04070063          	beqz	a4,80003290 <_ZN10ThreadList11removeFirstEv+0x50>
    80003254:	00050793          	mv	a5,a0

    TCB *data = head->data;
    80003258:	00073503          	ld	a0,0(a4) # 8000 <_entry-0x7fff8000>

    head = head->next;
    8000325c:	00873703          	ld	a4,8(a4)
    80003260:	00e7b023          	sd	a4,0(a5)
    if (head) head->prev = nullptr;
    80003264:	02070063          	beqz	a4,80003284 <_ZN10ThreadList11removeFirstEv+0x44>
    80003268:	00073823          	sd	zero,16(a4)
    else head = tail = nullptr;

    size--;
    8000326c:	0187a703          	lw	a4,24(a5)
    80003270:	fff7071b          	addiw	a4,a4,-1
    80003274:	00e7ac23          	sw	a4,24(a5)

    return data;
}
    80003278:	00813403          	ld	s0,8(sp)
    8000327c:	01010113          	addi	sp,sp,16
    80003280:	00008067          	ret
    else head = tail = nullptr;
    80003284:	0007b423          	sd	zero,8(a5)
    80003288:	0007b023          	sd	zero,0(a5)
    8000328c:	fe1ff06f          	j	8000326c <_ZN10ThreadList11removeFirstEv+0x2c>
    if (!head) return nullptr;
    80003290:	00070513          	mv	a0,a4
    80003294:	fe5ff06f          	j	80003278 <_ZN10ThreadList11removeFirstEv+0x38>

0000000080003298 <_ZN10ThreadList10removeLastEv>:

TCB *ThreadList::removeLast() {
    80003298:	ff010113          	addi	sp,sp,-16
    8000329c:	00813423          	sd	s0,8(sp)
    800032a0:	01010413          	addi	s0,sp,16
    if (!tail) return nullptr;
    800032a4:	00853703          	ld	a4,8(a0)
    800032a8:	04070063          	beqz	a4,800032e8 <_ZN10ThreadList10removeLastEv+0x50>
    800032ac:	00050793          	mv	a5,a0

    TCB *data = tail->data;
    800032b0:	00073503          	ld	a0,0(a4)

    tail = tail->prev;
    800032b4:	01073703          	ld	a4,16(a4)
    800032b8:	00e7b423          	sd	a4,8(a5)
    if (tail) tail->next = nullptr;
    800032bc:	02070063          	beqz	a4,800032dc <_ZN10ThreadList10removeLastEv+0x44>
    800032c0:	00073423          	sd	zero,8(a4)
    else tail = head = nullptr;

    size--;
    800032c4:	0187a703          	lw	a4,24(a5)
    800032c8:	fff7071b          	addiw	a4,a4,-1
    800032cc:	00e7ac23          	sw	a4,24(a5)

    return data;
}
    800032d0:	00813403          	ld	s0,8(sp)
    800032d4:	01010113          	addi	sp,sp,16
    800032d8:	00008067          	ret
    else tail = head = nullptr;
    800032dc:	0007b023          	sd	zero,0(a5)
    800032e0:	0007b423          	sd	zero,8(a5)
    800032e4:	fe1ff06f          	j	800032c4 <_ZN10ThreadList10removeLastEv+0x2c>
    if (!tail) return nullptr;
    800032e8:	00070513          	mv	a0,a4
    800032ec:	fe5ff06f          	j	800032d0 <_ZN10ThreadList10removeLastEv+0x38>

00000000800032f0 <_ZN10ThreadList9eraseCurrEv>:

void ThreadList::eraseCurr() {
    800032f0:	ff010113          	addi	sp,sp,-16
    800032f4:	00813423          	sd	s0,8(sp)
    800032f8:	01010413          	addi	s0,sp,16
    if (!curr) return;
    800032fc:	01053783          	ld	a5,16(a0)
    80003300:	02078463          	beqz	a5,80003328 <_ZN10ThreadList9eraseCurrEv+0x38>

    ThreadNode *before = curr->prev, *after = curr->next;
    80003304:	0107b703          	ld	a4,16(a5)
    80003308:	0087b783          	ld	a5,8(a5)

    if (before) before->next = after;
    8000330c:	02070463          	beqz	a4,80003334 <_ZN10ThreadList9eraseCurrEv+0x44>
    80003310:	00f73423          	sd	a5,8(a4)
    else head = after;

    if (after) after->prev = before;
    80003314:	02078463          	beqz	a5,8000333c <_ZN10ThreadList9eraseCurrEv+0x4c>
    80003318:	00e7b823          	sd	a4,16(a5)
    else tail = before;

    size--;
    8000331c:	01852783          	lw	a5,24(a0)
    80003320:	fff7879b          	addiw	a5,a5,-1
    80003324:	00f52c23          	sw	a5,24(a0)
}
    80003328:	00813403          	ld	s0,8(sp)
    8000332c:	01010113          	addi	sp,sp,16
    80003330:	00008067          	ret
    else head = after;
    80003334:	00f53023          	sd	a5,0(a0)
    80003338:	fddff06f          	j	80003314 <_ZN10ThreadList9eraseCurrEv+0x24>
    else tail = before;
    8000333c:	00e53423          	sd	a4,8(a0)
    80003340:	fddff06f          	j	8000331c <_ZN10ThreadList9eraseCurrEv+0x2c>

0000000080003344 <_ZN10ThreadList15insertAfterCurrEP10ThreadNode>:

void ThreadList::insertAfterCurr(ThreadNode *elem) {
    80003344:	ff010113          	addi	sp,sp,-16
    80003348:	00813423          	sd	s0,8(sp)
    8000334c:	01010413          	addi	s0,sp,16
    if (!curr) return;
    80003350:	01053783          	ld	a5,16(a0)
    80003354:	02078663          	beqz	a5,80003380 <_ZN10ThreadList15insertAfterCurrEP10ThreadNode+0x3c>
    ThreadNode *after = curr->next;
    80003358:	0087b783          	ld	a5,8(a5)
    elem->next = after;
    8000335c:	00f5b423          	sd	a5,8(a1)
    elem->prev = curr;
    80003360:	01053703          	ld	a4,16(a0)
    80003364:	00e5b823          	sd	a4,16(a1)
    curr->next = elem;
    80003368:	00b73423          	sd	a1,8(a4)
    if (!after) tail = elem;
    8000336c:	02078063          	beqz	a5,8000338c <_ZN10ThreadList15insertAfterCurrEP10ThreadNode+0x48>
    else after->prev = elem;
    80003370:	00b7b823          	sd	a1,16(a5)
    size++;
    80003374:	01852783          	lw	a5,24(a0)
    80003378:	0017879b          	addiw	a5,a5,1
    8000337c:	00f52c23          	sw	a5,24(a0)
}
    80003380:	00813403          	ld	s0,8(sp)
    80003384:	01010113          	addi	sp,sp,16
    80003388:	00008067          	ret
    if (!after) tail = elem;
    8000338c:	00b53423          	sd	a1,8(a0)
    80003390:	fe5ff06f          	j	80003374 <_ZN10ThreadList15insertAfterCurrEP10ThreadNode+0x30>

0000000080003394 <_ZN10ThreadList16insertBeforeCurrEP10ThreadNode>:

void ThreadList::insertBeforeCurr(ThreadNode *elem) {
    80003394:	ff010113          	addi	sp,sp,-16
    80003398:	00813423          	sd	s0,8(sp)
    8000339c:	01010413          	addi	s0,sp,16
    if (!curr) return;
    800033a0:	01053783          	ld	a5,16(a0)
    800033a4:	02078663          	beqz	a5,800033d0 <_ZN10ThreadList16insertBeforeCurrEP10ThreadNode+0x3c>
    ThreadNode *before = curr->prev;
    800033a8:	0107b703          	ld	a4,16(a5)
    elem->next = curr;
    800033ac:	00f5b423          	sd	a5,8(a1)
    elem->prev = before;
    800033b0:	00e5b823          	sd	a4,16(a1)
    curr->prev = elem;
    800033b4:	01053783          	ld	a5,16(a0)
    800033b8:	00b7b823          	sd	a1,16(a5)
    if (!before) head = elem;
    800033bc:	02070063          	beqz	a4,800033dc <_ZN10ThreadList16insertBeforeCurrEP10ThreadNode+0x48>
    else before->next = elem;
    800033c0:	00b73423          	sd	a1,8(a4)
    size++;
    800033c4:	01852783          	lw	a5,24(a0)
    800033c8:	0017879b          	addiw	a5,a5,1
    800033cc:	00f52c23          	sw	a5,24(a0)
}
    800033d0:	00813403          	ld	s0,8(sp)
    800033d4:	01010113          	addi	sp,sp,16
    800033d8:	00008067          	ret
    if (!before) head = elem;
    800033dc:	00b53023          	sd	a1,0(a0)
    800033e0:	fe5ff06f          	j	800033c4 <_ZN10ThreadList16insertBeforeCurrEP10ThreadNode+0x30>

00000000800033e4 <_ZN10ThreadListD1Ev>:

ThreadList::~ThreadList() {
    800033e4:	ff010113          	addi	sp,sp,-16
    800033e8:	00813423          	sd	s0,8(sp)
    800033ec:	01010413          	addi	s0,sp,16
    head = nullptr;
    tail = nullptr;
    curr = nullptr;
    size = 0;
}
    800033f0:	00813403          	ld	s0,8(sp)
    800033f4:	01010113          	addi	sp,sp,16
    800033f8:	00008067          	ret

00000000800033fc <_ZN14TimerInterrupt11getInstanceEv>:
#include "../h/SysPrint.h"

TimerInterrupt *TimerInterrupt::instance = nullptr;

TimerInterrupt *TimerInterrupt::getInstance() {
    if (!instance) instance = new TimerInterrupt;
    800033fc:	00007797          	auipc	a5,0x7
    80003400:	a547b783          	ld	a5,-1452(a5) # 80009e50 <_ZN14TimerInterrupt8instanceE>
    80003404:	00078863          	beqz	a5,80003414 <_ZN14TimerInterrupt11getInstanceEv+0x18>
    return instance;
}
    80003408:	00007517          	auipc	a0,0x7
    8000340c:	a4853503          	ld	a0,-1464(a0) # 80009e50 <_ZN14TimerInterrupt8instanceE>
    80003410:	00008067          	ret
TimerInterrupt *TimerInterrupt::getInstance() {
    80003414:	ff010113          	addi	sp,sp,-16
    80003418:	00113423          	sd	ra,8(sp)
    8000341c:	00813023          	sd	s0,0(sp)
    80003420:	01010413          	addi	s0,sp,16
        return kmalloc(size);
    80003424:	05800513          	li	a0,88
    80003428:	fffff097          	auipc	ra,0xfffff
    8000342c:	a7c080e7          	jalr	-1412(ra) # 80001ea4 <_Z7kmallocm>
    80003430:	00100793          	li	a5,1
    80003434:	00f52423          	sw	a5,8(a0)
    explicit ThreadList() = default;
    80003438:	00053823          	sd	zero,16(a0)
    8000343c:	00053c23          	sd	zero,24(a0)
    80003440:	02053023          	sd	zero,32(a0)
    80003444:	02052423          	sw	zero,40(a0)
    80003448:	02053823          	sd	zero,48(a0)
    8000344c:	02053c23          	sd	zero,56(a0)
    80003450:	04053023          	sd	zero,64(a0)
    80003454:	04053423          	sd	zero,72(a0)
    80003458:	04052823          	sw	zero,80(a0)
    if (!instance) instance = new TimerInterrupt;
    8000345c:	00007797          	auipc	a5,0x7
    80003460:	9ea7ba23          	sd	a0,-1548(a5) # 80009e50 <_ZN14TimerInterrupt8instanceE>
}
    80003464:	00007517          	auipc	a0,0x7
    80003468:	9ec53503          	ld	a0,-1556(a0) # 80009e50 <_ZN14TimerInterrupt8instanceE>
    8000346c:	00813083          	ld	ra,8(sp)
    80003470:	00013403          	ld	s0,0(sp)
    80003474:	01010113          	addi	sp,sp,16
    80003478:	00008067          	ret

000000008000347c <_ZN14TimerInterrupt5blockEP3TCBm>:

void TimerInterrupt::block(TCB *tcb, time_t time) {
    8000347c:	fd010113          	addi	sp,sp,-48
    80003480:	02113423          	sd	ra,40(sp)
    80003484:	02813023          	sd	s0,32(sp)
    80003488:	00913c23          	sd	s1,24(sp)
    8000348c:	01213823          	sd	s2,16(sp)
    80003490:	01313423          	sd	s3,8(sp)
    80003494:	01413023          	sd	s4,0(sp)
    80003498:	03010413          	addi	s0,sp,48
    8000349c:	00050993          	mv	s3,a0
    800034a0:	00058913          	mv	s2,a1
    ThreadList *blockedThreads = &getInstance()->blockedThreadList;
    800034a4:	00000097          	auipc	ra,0x0
    800034a8:	f58080e7          	jalr	-168(ra) # 800033fc <_ZN14TimerInterrupt11getInstanceEv>
    800034ac:	00050493          	mv	s1,a0
    800034b0:	03850a13          	addi	s4,a0,56

    instance->mutex.wait();
    800034b4:	00007517          	auipc	a0,0x7
    800034b8:	99c53503          	ld	a0,-1636(a0) # 80009e50 <_ZN14TimerInterrupt8instanceE>
    800034bc:	00850513          	addi	a0,a0,8
    800034c0:	fffff097          	auipc	ra,0xfffff
    800034c4:	a64080e7          	jalr	-1436(ra) # 80001f24 <_ZN5Mutex4waitEv>
        curr = head;
    800034c8:	0384b783          	ld	a5,56(s1)
    800034cc:	04f4b423          	sd	a5,72(s1)
        return curr != nullptr;
    800034d0:	0484b783          	ld	a5,72(s1)

    for (blockedThreads->toHead(); blockedThreads->hasCurr(); blockedThreads->toNext()) {
    800034d4:	02078863          	beqz	a5,80003504 <_ZN14TimerInterrupt5blockEP3TCBm+0x88>
    }

    TCB *getCurr() {
        if (!curr) return nullptr;
        return curr->data;
    800034d8:	0007b703          	ld	a4,0(a5)
        return blockedTime;
    800034dc:	0b873703          	ld	a4,184(a4)
        time_t currTime = blockedThreads->getCurr()->getBlockedTime();
        if (time >= currTime) {
    800034e0:	00e96a63          	bltu	s2,a4,800034f4 <_ZN14TimerInterrupt5blockEP3TCBm+0x78>
            time -= currTime;
    800034e4:	40e90933          	sub	s2,s2,a4
        if (curr) curr = curr->next;
    800034e8:	0087b783          	ld	a5,8(a5)
    800034ec:	04f4b423          	sd	a5,72(s1)
    }
    800034f0:	fe1ff06f          	j	800034d0 <_ZN14TimerInterrupt5blockEP3TCBm+0x54>
        } else {
            blockedThreads->insertBeforeCurr(tcb->getNode());
    800034f4:	0a098593          	addi	a1,s3,160
    800034f8:	000a0513          	mv	a0,s4
    800034fc:	00000097          	auipc	ra,0x0
    80003500:	e98080e7          	jalr	-360(ra) # 80003394 <_ZN10ThreadList16insertBeforeCurrEP10ThreadNode>
        return curr != nullptr;
    80003504:	0484b783          	ld	a5,72(s1)
            break;
        }
    }

    // insert at end
    if (!blockedThreads->hasCurr()) blockedThreads->addLast(tcb->getNode());
    80003508:	02078863          	beqz	a5,80003538 <_ZN14TimerInterrupt5blockEP3TCBm+0xbc>
    8000350c:	0484b783          	ld	a5,72(s1)

    // updating relative time for blocked threads after currently inserted
    while (blockedThreads->hasCurr()) {
    80003510:	02078e63          	beqz	a5,8000354c <_ZN14TimerInterrupt5blockEP3TCBm+0xd0>
        return curr->data;
    80003514:	0007b703          	ld	a4,0(a5)
        this->blockedTime -= time;
    80003518:	0b873783          	ld	a5,184(a4)
    8000351c:	412787b3          	sub	a5,a5,s2
    80003520:	0af73c23          	sd	a5,184(a4)
        if (curr) curr = curr->next;
    80003524:	0484b783          	ld	a5,72(s1)
    80003528:	fe0782e3          	beqz	a5,8000350c <_ZN14TimerInterrupt5blockEP3TCBm+0x90>
    8000352c:	0087b783          	ld	a5,8(a5)
    80003530:	04f4b423          	sd	a5,72(s1)
    80003534:	fd9ff06f          	j	8000350c <_ZN14TimerInterrupt5blockEP3TCBm+0x90>
    if (!blockedThreads->hasCurr()) blockedThreads->addLast(tcb->getNode());
    80003538:	0a098593          	addi	a1,s3,160
    8000353c:	000a0513          	mv	a0,s4
    80003540:	00000097          	auipc	ra,0x0
    80003544:	cbc080e7          	jalr	-836(ra) # 800031fc <_ZN10ThreadList7addLastEP10ThreadNode>
    80003548:	fc5ff06f          	j	8000350c <_ZN14TimerInterrupt5blockEP3TCBm+0x90>
        blockedThreads->getCurr()->decBlockedTime(time);
        blockedThreads->toNext();
    }

    instance->mutex.signal();
    8000354c:	00007517          	auipc	a0,0x7
    80003550:	90453503          	ld	a0,-1788(a0) # 80009e50 <_ZN14TimerInterrupt8instanceE>
    80003554:	00850513          	addi	a0,a0,8
    80003558:	fffff097          	auipc	ra,0xfffff
    8000355c:	a40080e7          	jalr	-1472(ra) # 80001f98 <_ZN5Mutex6signalEv>
        this->blockedTime = blockedTime;
    80003560:	0b29bc23          	sd	s2,184(s3)
        status = BLOCKED;
    80003564:	00200793          	li	a5,2
    80003568:	04f9a023          	sw	a5,64(s3)

    tcb->setBlockedTime(time);
    tcb->setBlocked();
    tcb->dispatch();
    8000356c:	fffff097          	auipc	ra,0xfffff
    80003570:	638080e7          	jalr	1592(ra) # 80002ba4 <_ZN3TCB8dispatchEv>
}
    80003574:	02813083          	ld	ra,40(sp)
    80003578:	02013403          	ld	s0,32(sp)
    8000357c:	01813483          	ld	s1,24(sp)
    80003580:	01013903          	ld	s2,16(sp)
    80003584:	00813983          	ld	s3,8(sp)
    80003588:	00013a03          	ld	s4,0(sp)
    8000358c:	03010113          	addi	sp,sp,48
    80003590:	00008067          	ret

0000000080003594 <_ZN14TimerInterrupt4tickEv>:

void TimerInterrupt::tick() {
    80003594:	fd010113          	addi	sp,sp,-48
    80003598:	02113423          	sd	ra,40(sp)
    8000359c:	02813023          	sd	s0,32(sp)
    800035a0:	00913c23          	sd	s1,24(sp)
    800035a4:	01213823          	sd	s2,16(sp)
    800035a8:	01313423          	sd	s3,8(sp)
    800035ac:	03010413          	addi	s0,sp,48
    ThreadList *blockedThreads = &getInstance()->blockedThreadList;
    800035b0:	00000097          	auipc	ra,0x0
    800035b4:	e4c080e7          	jalr	-436(ra) # 800033fc <_ZN14TimerInterrupt11getInstanceEv>
    800035b8:	00050913          	mv	s2,a0
    800035bc:	03850993          	addi	s3,a0,56

    TCB *tcb;

    instance->mutex.wait();
    800035c0:	00007517          	auipc	a0,0x7
    800035c4:	89053503          	ld	a0,-1904(a0) # 80009e50 <_ZN14TimerInterrupt8instanceE>
    800035c8:	00850513          	addi	a0,a0,8
    800035cc:	fffff097          	auipc	ra,0xfffff
    800035d0:	958080e7          	jalr	-1704(ra) # 80001f24 <_ZN5Mutex4waitEv>
    800035d4:	01c0006f          	j	800035f0 <_ZN14TimerInterrupt4tickEv+0x5c>
        status = READY;
    800035d8:	0404a023          	sw	zero,64(s1)

    while ((tcb = blockedThreads->getFirst()) && !tcb->getBlockedTime()) {
        tcb->setReady();
        Scheduler::put(blockedThreads->removeFirst());
    800035dc:	00098513          	mv	a0,s3
    800035e0:	00000097          	auipc	ra,0x0
    800035e4:	c60080e7          	jalr	-928(ra) # 80003240 <_ZN10ThreadList11removeFirstEv>
    800035e8:	fffff097          	auipc	ra,0xfffff
    800035ec:	d70080e7          	jalr	-656(ra) # 80002358 <_ZN9Scheduler3putEP3TCB>
        if (!head) return nullptr;
    800035f0:	03893483          	ld	s1,56(s2)
    800035f4:	00048a63          	beqz	s1,80003608 <_ZN14TimerInterrupt4tickEv+0x74>
        return head->data;
    800035f8:	0004b483          	ld	s1,0(s1)
    while ((tcb = blockedThreads->getFirst()) && !tcb->getBlockedTime()) {
    800035fc:	00048663          	beqz	s1,80003608 <_ZN14TimerInterrupt4tickEv+0x74>
        return blockedTime;
    80003600:	0b84b783          	ld	a5,184(s1)
    80003604:	fc078ae3          	beqz	a5,800035d8 <_ZN14TimerInterrupt4tickEv+0x44>
    }

    instance->mutex.signal();
    80003608:	00007517          	auipc	a0,0x7
    8000360c:	84853503          	ld	a0,-1976(a0) # 80009e50 <_ZN14TimerInterrupt8instanceE>
    80003610:	00850513          	addi	a0,a0,8
    80003614:	fffff097          	auipc	ra,0xfffff
    80003618:	984080e7          	jalr	-1660(ra) # 80001f98 <_ZN5Mutex6signalEv>

    if (!tcb) return;
    8000361c:	00048863          	beqz	s1,8000362c <_ZN14TimerInterrupt4tickEv+0x98>
        this->blockedTime -= time;
    80003620:	0b84b783          	ld	a5,184(s1)
    80003624:	fff78793          	addi	a5,a5,-1
    80003628:	0af4bc23          	sd	a5,184(s1)
    tcb->decBlockedTime();
}
    8000362c:	02813083          	ld	ra,40(sp)
    80003630:	02013403          	ld	s0,32(sp)
    80003634:	01813483          	ld	s1,24(sp)
    80003638:	01013903          	ld	s2,16(sp)
    8000363c:	00813983          	ld	s3,8(sp)
    80003640:	03010113          	addi	sp,sp,48
    80003644:	00008067          	ret

0000000080003648 <_ZN14TimerInterruptD1Ev>:

TimerInterrupt::~TimerInterrupt() {
    80003648:	fe010113          	addi	sp,sp,-32
    8000364c:	00113c23          	sd	ra,24(sp)
    80003650:	00813823          	sd	s0,16(sp)
    80003654:	00913423          	sd	s1,8(sp)
    80003658:	01213023          	sd	s2,0(sp)
    8000365c:	02010413          	addi	s0,sp,32
    80003660:	00050913          	mv	s2,a0
        return size == 0;
    80003664:	05092783          	lw	a5,80(s2)
    while (!blockedThreadList.isEmpty()) {
    80003668:	02078863          	beqz	a5,80003698 <_ZN14TimerInterruptD1Ev+0x50>
//        kprintString("Timer deleting...\n");
        delete blockedThreadList.removeFirst();
    8000366c:	03890513          	addi	a0,s2,56
    80003670:	00000097          	auipc	ra,0x0
    80003674:	bd0080e7          	jalr	-1072(ra) # 80003240 <_ZN10ThreadList11removeFirstEv>
    80003678:	00050493          	mv	s1,a0
    8000367c:	fe0504e3          	beqz	a0,80003664 <_ZN14TimerInterruptD1Ev+0x1c>
    80003680:	fffff097          	auipc	ra,0xfffff
    80003684:	74c080e7          	jalr	1868(ra) # 80002dcc <_ZN3TCBD1Ev>
        kfree(addr);
    80003688:	00048513          	mv	a0,s1
    8000368c:	fffff097          	auipc	ra,0xfffff
    80003690:	858080e7          	jalr	-1960(ra) # 80001ee4 <_Z5kfreePv>
    }
    80003694:	fd1ff06f          	j	80003664 <_ZN14TimerInterruptD1Ev+0x1c>
TimerInterrupt::~TimerInterrupt() {
    80003698:	03890513          	addi	a0,s2,56
    8000369c:	00000097          	auipc	ra,0x0
    800036a0:	d48080e7          	jalr	-696(ra) # 800033e4 <_ZN10ThreadListD1Ev>
    800036a4:	00890513          	addi	a0,s2,8
    800036a8:	ffffe097          	auipc	ra,0xffffe
    800036ac:	26c080e7          	jalr	620(ra) # 80001914 <_ZN15KernelSemaphoreD1Ev>
    }
}
    800036b0:	01813083          	ld	ra,24(sp)
    800036b4:	01013403          	ld	s0,16(sp)
    800036b8:	00813483          	ld	s1,8(sp)
    800036bc:	00013903          	ld	s2,0(sp)
    800036c0:	02010113          	addi	sp,sp,32
    800036c4:	00008067          	ret

00000000800036c8 <_ZN6BufferC1Ei>:
#include "buffer.hpp"
#include "../h/syscall_c.h"
//#include "../h/std.h"


Buffer::Buffer(int _cap) : cap(_cap), head(0), tail(0) {
    800036c8:	fe010113          	addi	sp,sp,-32
    800036cc:	00113c23          	sd	ra,24(sp)
    800036d0:	00813823          	sd	s0,16(sp)
    800036d4:	00913423          	sd	s1,8(sp)
    800036d8:	02010413          	addi	s0,sp,32
    800036dc:	00050493          	mv	s1,a0
    800036e0:	00b52023          	sw	a1,0(a0)
    800036e4:	00052823          	sw	zero,16(a0)
    800036e8:	00052a23          	sw	zero,20(a0)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    800036ec:	00259513          	slli	a0,a1,0x2
    800036f0:	fffff097          	auipc	ra,0xfffff
    800036f4:	d70080e7          	jalr	-656(ra) # 80002460 <_Z9mem_allocm>
    800036f8:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    800036fc:	00000593          	li	a1,0
    80003700:	02048513          	addi	a0,s1,32
    80003704:	fffff097          	auipc	ra,0xfffff
    80003708:	ea8080e7          	jalr	-344(ra) # 800025ac <_Z8sem_openPP4_semj>
    sem_open(&spaceAvailable, cap);
    8000370c:	0004a583          	lw	a1,0(s1)
    80003710:	01848513          	addi	a0,s1,24
    80003714:	fffff097          	auipc	ra,0xfffff
    80003718:	e98080e7          	jalr	-360(ra) # 800025ac <_Z8sem_openPP4_semj>
    sem_open(&mutexHead, 1);
    8000371c:	00100593          	li	a1,1
    80003720:	02848513          	addi	a0,s1,40
    80003724:	fffff097          	auipc	ra,0xfffff
    80003728:	e88080e7          	jalr	-376(ra) # 800025ac <_Z8sem_openPP4_semj>
    sem_open(&mutexTail, 1);
    8000372c:	00100593          	li	a1,1
    80003730:	03048513          	addi	a0,s1,48
    80003734:	fffff097          	auipc	ra,0xfffff
    80003738:	e78080e7          	jalr	-392(ra) # 800025ac <_Z8sem_openPP4_semj>
}
    8000373c:	01813083          	ld	ra,24(sp)
    80003740:	01013403          	ld	s0,16(sp)
    80003744:	00813483          	ld	s1,8(sp)
    80003748:	02010113          	addi	sp,sp,32
    8000374c:	00008067          	ret

0000000080003750 <_ZN6BufferD1Ev>:

Buffer::~Buffer() {
    80003750:	fe010113          	addi	sp,sp,-32
    80003754:	00113c23          	sd	ra,24(sp)
    80003758:	00813823          	sd	s0,16(sp)
    8000375c:	00913423          	sd	s1,8(sp)
    80003760:	02010413          	addi	s0,sp,32
    80003764:	00050493          	mv	s1,a0
    putc('\n');
    80003768:	00a00513          	li	a0,10
    8000376c:	fffff097          	auipc	ra,0xfffff
    80003770:	fbc080e7          	jalr	-68(ra) # 80002728 <_Z4putcc>
//    printf("Buffer deleted!\n");
    while (head != tail) {
    80003774:	0104a783          	lw	a5,16(s1)
    80003778:	0144a703          	lw	a4,20(s1)
    8000377c:	00e78c63          	beq	a5,a4,80003794 <_ZN6BufferD1Ev+0x44>
//        printf("%c ", buffer[head]);
        head = (head + 1) % cap;
    80003780:	0017879b          	addiw	a5,a5,1
    80003784:	0004a703          	lw	a4,0(s1)
    80003788:	02e7e7bb          	remw	a5,a5,a4
    8000378c:	00f4a823          	sw	a5,16(s1)
    while (head != tail) {
    80003790:	fe5ff06f          	j	80003774 <_ZN6BufferD1Ev+0x24>
    }
    putc('!');
    80003794:	02100513          	li	a0,33
    80003798:	fffff097          	auipc	ra,0xfffff
    8000379c:	f90080e7          	jalr	-112(ra) # 80002728 <_Z4putcc>
    putc('\n');
    800037a0:	00a00513          	li	a0,10
    800037a4:	fffff097          	auipc	ra,0xfffff
    800037a8:	f84080e7          	jalr	-124(ra) # 80002728 <_Z4putcc>

    mem_free(buffer);
    800037ac:	0084b503          	ld	a0,8(s1)
    800037b0:	fffff097          	auipc	ra,0xfffff
    800037b4:	ce4080e7          	jalr	-796(ra) # 80002494 <_Z8mem_freePv>
    sem_close(itemAvailable);
    800037b8:	0204b503          	ld	a0,32(s1)
    800037bc:	fffff097          	auipc	ra,0xfffff
    800037c0:	e68080e7          	jalr	-408(ra) # 80002624 <_Z9sem_closeP4_sem>
    sem_close(spaceAvailable);
    800037c4:	0184b503          	ld	a0,24(s1)
    800037c8:	fffff097          	auipc	ra,0xfffff
    800037cc:	e5c080e7          	jalr	-420(ra) # 80002624 <_Z9sem_closeP4_sem>
    sem_close(mutexTail);
    800037d0:	0304b503          	ld	a0,48(s1)
    800037d4:	fffff097          	auipc	ra,0xfffff
    800037d8:	e50080e7          	jalr	-432(ra) # 80002624 <_Z9sem_closeP4_sem>
    sem_close(mutexHead);
    800037dc:	0284b503          	ld	a0,40(s1)
    800037e0:	fffff097          	auipc	ra,0xfffff
    800037e4:	e44080e7          	jalr	-444(ra) # 80002624 <_Z9sem_closeP4_sem>
}
    800037e8:	01813083          	ld	ra,24(sp)
    800037ec:	01013403          	ld	s0,16(sp)
    800037f0:	00813483          	ld	s1,8(sp)
    800037f4:	02010113          	addi	sp,sp,32
    800037f8:	00008067          	ret

00000000800037fc <_ZN6Buffer3putEi>:

void Buffer::put(int val) {
    800037fc:	fe010113          	addi	sp,sp,-32
    80003800:	00113c23          	sd	ra,24(sp)
    80003804:	00813823          	sd	s0,16(sp)
    80003808:	00913423          	sd	s1,8(sp)
    8000380c:	01213023          	sd	s2,0(sp)
    80003810:	02010413          	addi	s0,sp,32
    80003814:	00050493          	mv	s1,a0
    80003818:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    8000381c:	01853503          	ld	a0,24(a0)
    80003820:	fffff097          	auipc	ra,0xfffff
    80003824:	e38080e7          	jalr	-456(ra) # 80002658 <_Z8sem_waitP4_sem>

    sem_wait(mutexTail);
    80003828:	0304b503          	ld	a0,48(s1)
    8000382c:	fffff097          	auipc	ra,0xfffff
    80003830:	e2c080e7          	jalr	-468(ra) # 80002658 <_Z8sem_waitP4_sem>
    buffer[tail] = val;
    80003834:	0084b783          	ld	a5,8(s1)
    80003838:	0144a703          	lw	a4,20(s1)
    8000383c:	00271713          	slli	a4,a4,0x2
    80003840:	00e787b3          	add	a5,a5,a4
    80003844:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80003848:	0144a783          	lw	a5,20(s1)
    8000384c:	0017879b          	addiw	a5,a5,1
    80003850:	0004a703          	lw	a4,0(s1)
    80003854:	02e7e7bb          	remw	a5,a5,a4
    80003858:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    8000385c:	0304b503          	ld	a0,48(s1)
    80003860:	fffff097          	auipc	ra,0xfffff
    80003864:	e2c080e7          	jalr	-468(ra) # 8000268c <_Z10sem_signalP4_sem>

    sem_signal(itemAvailable);
    80003868:	0204b503          	ld	a0,32(s1)
    8000386c:	fffff097          	auipc	ra,0xfffff
    80003870:	e20080e7          	jalr	-480(ra) # 8000268c <_Z10sem_signalP4_sem>

}
    80003874:	01813083          	ld	ra,24(sp)
    80003878:	01013403          	ld	s0,16(sp)
    8000387c:	00813483          	ld	s1,8(sp)
    80003880:	00013903          	ld	s2,0(sp)
    80003884:	02010113          	addi	sp,sp,32
    80003888:	00008067          	ret

000000008000388c <_ZN6Buffer3getEv>:

int Buffer::get() {
    8000388c:	fe010113          	addi	sp,sp,-32
    80003890:	00113c23          	sd	ra,24(sp)
    80003894:	00813823          	sd	s0,16(sp)
    80003898:	00913423          	sd	s1,8(sp)
    8000389c:	01213023          	sd	s2,0(sp)
    800038a0:	02010413          	addi	s0,sp,32
    800038a4:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    800038a8:	02053503          	ld	a0,32(a0)
    800038ac:	fffff097          	auipc	ra,0xfffff
    800038b0:	dac080e7          	jalr	-596(ra) # 80002658 <_Z8sem_waitP4_sem>

    sem_wait(mutexHead);
    800038b4:	0284b503          	ld	a0,40(s1)
    800038b8:	fffff097          	auipc	ra,0xfffff
    800038bc:	da0080e7          	jalr	-608(ra) # 80002658 <_Z8sem_waitP4_sem>

    int ret = buffer[head];
    800038c0:	0084b703          	ld	a4,8(s1)
    800038c4:	0104a783          	lw	a5,16(s1)
    800038c8:	00279693          	slli	a3,a5,0x2
    800038cc:	00d70733          	add	a4,a4,a3
    800038d0:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    800038d4:	0017879b          	addiw	a5,a5,1
    800038d8:	0004a703          	lw	a4,0(s1)
    800038dc:	02e7e7bb          	remw	a5,a5,a4
    800038e0:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    800038e4:	0284b503          	ld	a0,40(s1)
    800038e8:	fffff097          	auipc	ra,0xfffff
    800038ec:	da4080e7          	jalr	-604(ra) # 8000268c <_Z10sem_signalP4_sem>

    sem_signal(spaceAvailable);
    800038f0:	0184b503          	ld	a0,24(s1)
    800038f4:	fffff097          	auipc	ra,0xfffff
    800038f8:	d98080e7          	jalr	-616(ra) # 8000268c <_Z10sem_signalP4_sem>

    return ret;
}
    800038fc:	00090513          	mv	a0,s2
    80003900:	01813083          	ld	ra,24(sp)
    80003904:	01013403          	ld	s0,16(sp)
    80003908:	00813483          	ld	s1,8(sp)
    8000390c:	00013903          	ld	s2,0(sp)
    80003910:	02010113          	addi	sp,sp,32
    80003914:	00008067          	ret

0000000080003918 <_ZL8printIntiii>:
}

static char digits[] = "0123456789ABCDEF";

static void printInt(int xx, int base=10, int sgn=0)
{
    80003918:	fc010113          	addi	sp,sp,-64
    8000391c:	02113c23          	sd	ra,56(sp)
    80003920:	02813823          	sd	s0,48(sp)
    80003924:	02913423          	sd	s1,40(sp)
    80003928:	03213023          	sd	s2,32(sp)
    8000392c:	01313c23          	sd	s3,24(sp)
    80003930:	04010413          	addi	s0,sp,64
    80003934:	00050493          	mv	s1,a0
    80003938:	00058913          	mv	s2,a1
    8000393c:	00060993          	mv	s3,a2
    LOCK();
    80003940:	00100613          	li	a2,1
    80003944:	00000593          	li	a1,0
    80003948:	00006517          	auipc	a0,0x6
    8000394c:	51050513          	addi	a0,a0,1296 # 80009e58 <lockPrint>
    80003950:	ffffe097          	auipc	ra,0xffffe
    80003954:	830080e7          	jalr	-2000(ra) # 80001180 <copy_and_swap>
    80003958:	fe0514e3          	bnez	a0,80003940 <_ZL8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    8000395c:	00098463          	beqz	s3,80003964 <_ZL8printIntiii+0x4c>
    80003960:	0804c463          	bltz	s1,800039e8 <_ZL8printIntiii+0xd0>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80003964:	0004851b          	sext.w	a0,s1
    neg = 0;
    80003968:	00000593          	li	a1,0
    }

    i = 0;
    8000396c:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80003970:	0009079b          	sext.w	a5,s2
    80003974:	0325773b          	remuw	a4,a0,s2
    80003978:	00048613          	mv	a2,s1
    8000397c:	0014849b          	addiw	s1,s1,1
    80003980:	02071693          	slli	a3,a4,0x20
    80003984:	0206d693          	srli	a3,a3,0x20
    80003988:	00005717          	auipc	a4,0x5
    8000398c:	b4070713          	addi	a4,a4,-1216 # 800084c8 <_ZL6digits>
    80003990:	00d70733          	add	a4,a4,a3
    80003994:	00074683          	lbu	a3,0(a4)
    80003998:	fd040713          	addi	a4,s0,-48
    8000399c:	00c70733          	add	a4,a4,a2
    800039a0:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    800039a4:	0005071b          	sext.w	a4,a0
    800039a8:	0325553b          	divuw	a0,a0,s2
    800039ac:	fcf772e3          	bgeu	a4,a5,80003970 <_ZL8printIntiii+0x58>
    if(neg)
    800039b0:	00058c63          	beqz	a1,800039c8 <_ZL8printIntiii+0xb0>
        buf[i++] = '-';
    800039b4:	fd040793          	addi	a5,s0,-48
    800039b8:	009784b3          	add	s1,a5,s1
    800039bc:	02d00793          	li	a5,45
    800039c0:	fef48823          	sb	a5,-16(s1)
    800039c4:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    800039c8:	fff4849b          	addiw	s1,s1,-1
    800039cc:	0204c463          	bltz	s1,800039f4 <_ZL8printIntiii+0xdc>
        putc(buf[i]);
    800039d0:	fd040793          	addi	a5,s0,-48
    800039d4:	009787b3          	add	a5,a5,s1
    800039d8:	ff07c503          	lbu	a0,-16(a5)
    800039dc:	fffff097          	auipc	ra,0xfffff
    800039e0:	d4c080e7          	jalr	-692(ra) # 80002728 <_Z4putcc>
    800039e4:	fe5ff06f          	j	800039c8 <_ZL8printIntiii+0xb0>
        x = -xx;
    800039e8:	4090053b          	negw	a0,s1
        neg = 1;
    800039ec:	00100593          	li	a1,1
        x = -xx;
    800039f0:	f7dff06f          	j	8000396c <_ZL8printIntiii+0x54>

    UNLOCK();
    800039f4:	00000613          	li	a2,0
    800039f8:	00100593          	li	a1,1
    800039fc:	00006517          	auipc	a0,0x6
    80003a00:	45c50513          	addi	a0,a0,1116 # 80009e58 <lockPrint>
    80003a04:	ffffd097          	auipc	ra,0xffffd
    80003a08:	77c080e7          	jalr	1916(ra) # 80001180 <copy_and_swap>
    80003a0c:	fe0514e3          	bnez	a0,800039f4 <_ZL8printIntiii+0xdc>
}
    80003a10:	03813083          	ld	ra,56(sp)
    80003a14:	03013403          	ld	s0,48(sp)
    80003a18:	02813483          	ld	s1,40(sp)
    80003a1c:	02013903          	ld	s2,32(sp)
    80003a20:	01813983          	ld	s3,24(sp)
    80003a24:	04010113          	addi	sp,sp,64
    80003a28:	00008067          	ret

0000000080003a2c <_Z16producerKeyboardPv>:
    sem_t wait;
};

volatile int threadEnd = 0;

void producerKeyboard(void *arg) {
    80003a2c:	fe010113          	addi	sp,sp,-32
    80003a30:	00113c23          	sd	ra,24(sp)
    80003a34:	00813823          	sd	s0,16(sp)
    80003a38:	00913423          	sd	s1,8(sp)
    80003a3c:	01213023          	sd	s2,0(sp)
    80003a40:	02010413          	addi	s0,sp,32
    80003a44:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80003a48:	00000913          	li	s2,0
    80003a4c:	00c0006f          	j	80003a58 <_Z16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003a50:	fffff097          	auipc	ra,0xfffff
    80003a54:	b2c080e7          	jalr	-1236(ra) # 8000257c <_Z15thread_dispatchv>
    while ((key = getc()) != 0x1b) {
    80003a58:	fffff097          	auipc	ra,0xfffff
    80003a5c:	c9c080e7          	jalr	-868(ra) # 800026f4 <_Z4getcv>
    80003a60:	0005059b          	sext.w	a1,a0
    80003a64:	01b00793          	li	a5,27
    80003a68:	02f58a63          	beq	a1,a5,80003a9c <_Z16producerKeyboardPv+0x70>
        data->buffer->put(key);
    80003a6c:	0084b503          	ld	a0,8(s1)
    80003a70:	00000097          	auipc	ra,0x0
    80003a74:	d8c080e7          	jalr	-628(ra) # 800037fc <_ZN6Buffer3putEi>
        i++;
    80003a78:	0019071b          	addiw	a4,s2,1
    80003a7c:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003a80:	0004a683          	lw	a3,0(s1)
    80003a84:	0026979b          	slliw	a5,a3,0x2
    80003a88:	00d787bb          	addw	a5,a5,a3
    80003a8c:	0017979b          	slliw	a5,a5,0x1
    80003a90:	02f767bb          	remw	a5,a4,a5
    80003a94:	fc0792e3          	bnez	a5,80003a58 <_Z16producerKeyboardPv+0x2c>
    80003a98:	fb9ff06f          	j	80003a50 <_Z16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    80003a9c:	00100793          	li	a5,1
    80003aa0:	00006717          	auipc	a4,0x6
    80003aa4:	3cf72023          	sw	a5,960(a4) # 80009e60 <threadEnd>

    delete data->buffer;
    80003aa8:	0084b903          	ld	s2,8(s1)
    80003aac:	00090e63          	beqz	s2,80003ac8 <_Z16producerKeyboardPv+0x9c>
    80003ab0:	00090513          	mv	a0,s2
    80003ab4:	00000097          	auipc	ra,0x0
    80003ab8:	c9c080e7          	jalr	-868(ra) # 80003750 <_ZN6BufferD1Ev>
    80003abc:	00090513          	mv	a0,s2
    80003ac0:	fffff097          	auipc	ra,0xfffff
    80003ac4:	ce8080e7          	jalr	-792(ra) # 800027a8 <_ZdlPv>

    sem_signal(data->wait);
    80003ac8:	0104b503          	ld	a0,16(s1)
    80003acc:	fffff097          	auipc	ra,0xfffff
    80003ad0:	bc0080e7          	jalr	-1088(ra) # 8000268c <_Z10sem_signalP4_sem>
}
    80003ad4:	01813083          	ld	ra,24(sp)
    80003ad8:	01013403          	ld	s0,16(sp)
    80003adc:	00813483          	ld	s1,8(sp)
    80003ae0:	00013903          	ld	s2,0(sp)
    80003ae4:	02010113          	addi	sp,sp,32
    80003ae8:	00008067          	ret

0000000080003aec <_Z8producerPv>:

void producer(void *arg) {
    80003aec:	fe010113          	addi	sp,sp,-32
    80003af0:	00113c23          	sd	ra,24(sp)
    80003af4:	00813823          	sd	s0,16(sp)
    80003af8:	00913423          	sd	s1,8(sp)
    80003afc:	01213023          	sd	s2,0(sp)
    80003b00:	02010413          	addi	s0,sp,32
    80003b04:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003b08:	00000913          	li	s2,0
    80003b0c:	00c0006f          	j	80003b18 <_Z8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003b10:	fffff097          	auipc	ra,0xfffff
    80003b14:	a6c080e7          	jalr	-1428(ra) # 8000257c <_Z15thread_dispatchv>
    while (!threadEnd) {
    80003b18:	00006797          	auipc	a5,0x6
    80003b1c:	3487a783          	lw	a5,840(a5) # 80009e60 <threadEnd>
    80003b20:	02079e63          	bnez	a5,80003b5c <_Z8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80003b24:	0004a583          	lw	a1,0(s1)
    80003b28:	0305859b          	addiw	a1,a1,48
    80003b2c:	0084b503          	ld	a0,8(s1)
    80003b30:	00000097          	auipc	ra,0x0
    80003b34:	ccc080e7          	jalr	-820(ra) # 800037fc <_ZN6Buffer3putEi>
        i++;
    80003b38:	0019071b          	addiw	a4,s2,1
    80003b3c:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003b40:	0004a683          	lw	a3,0(s1)
    80003b44:	0026979b          	slliw	a5,a3,0x2
    80003b48:	00d787bb          	addw	a5,a5,a3
    80003b4c:	0017979b          	slliw	a5,a5,0x1
    80003b50:	02f767bb          	remw	a5,a4,a5
    80003b54:	fc0792e3          	bnez	a5,80003b18 <_Z8producerPv+0x2c>
    80003b58:	fb9ff06f          	j	80003b10 <_Z8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    80003b5c:	0104b503          	ld	a0,16(s1)
    80003b60:	fffff097          	auipc	ra,0xfffff
    80003b64:	b2c080e7          	jalr	-1236(ra) # 8000268c <_Z10sem_signalP4_sem>
}
    80003b68:	01813083          	ld	ra,24(sp)
    80003b6c:	01013403          	ld	s0,16(sp)
    80003b70:	00813483          	ld	s1,8(sp)
    80003b74:	00013903          	ld	s2,0(sp)
    80003b78:	02010113          	addi	sp,sp,32
    80003b7c:	00008067          	ret

0000000080003b80 <_Z8consumerPv>:

void consumer(void *arg) {
    80003b80:	fd010113          	addi	sp,sp,-48
    80003b84:	02113423          	sd	ra,40(sp)
    80003b88:	02813023          	sd	s0,32(sp)
    80003b8c:	00913c23          	sd	s1,24(sp)
    80003b90:	01213823          	sd	s2,16(sp)
    80003b94:	01313423          	sd	s3,8(sp)
    80003b98:	03010413          	addi	s0,sp,48
    80003b9c:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;


    int i = 0;
    80003ba0:	00000993          	li	s3,0
    80003ba4:	01c0006f          	j	80003bc0 <_Z8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    80003ba8:	fffff097          	auipc	ra,0xfffff
    80003bac:	9d4080e7          	jalr	-1580(ra) # 8000257c <_Z15thread_dispatchv>
    80003bb0:	0500006f          	j	80003c00 <_Z8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    80003bb4:	00a00513          	li	a0,10
    80003bb8:	fffff097          	auipc	ra,0xfffff
    80003bbc:	b70080e7          	jalr	-1168(ra) # 80002728 <_Z4putcc>
    while (!threadEnd) {
    80003bc0:	00006797          	auipc	a5,0x6
    80003bc4:	2a07a783          	lw	a5,672(a5) # 80009e60 <threadEnd>
    80003bc8:	04079463          	bnez	a5,80003c10 <_Z8consumerPv+0x90>
        int key = data->buffer->get();
    80003bcc:	00893503          	ld	a0,8(s2)
    80003bd0:	00000097          	auipc	ra,0x0
    80003bd4:	cbc080e7          	jalr	-836(ra) # 8000388c <_ZN6Buffer3getEv>
        i++;
    80003bd8:	0019849b          	addiw	s1,s3,1
    80003bdc:	0004899b          	sext.w	s3,s1
        putc(key);
    80003be0:	0ff57513          	andi	a0,a0,255
    80003be4:	fffff097          	auipc	ra,0xfffff
    80003be8:	b44080e7          	jalr	-1212(ra) # 80002728 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80003bec:	00092703          	lw	a4,0(s2)
    80003bf0:	0027179b          	slliw	a5,a4,0x2
    80003bf4:	00e787bb          	addw	a5,a5,a4
    80003bf8:	02f4e7bb          	remw	a5,s1,a5
    80003bfc:	fa0786e3          	beqz	a5,80003ba8 <_Z8consumerPv+0x28>
        if (i % 80 == 0) {
    80003c00:	05000793          	li	a5,80
    80003c04:	02f4e4bb          	remw	s1,s1,a5
    80003c08:	fa049ce3          	bnez	s1,80003bc0 <_Z8consumerPv+0x40>
    80003c0c:	fa9ff06f          	j	80003bb4 <_Z8consumerPv+0x34>
        }
    }

    sem_signal(data->wait);
    80003c10:	01093503          	ld	a0,16(s2)
    80003c14:	fffff097          	auipc	ra,0xfffff
    80003c18:	a78080e7          	jalr	-1416(ra) # 8000268c <_Z10sem_signalP4_sem>
}
    80003c1c:	02813083          	ld	ra,40(sp)
    80003c20:	02013403          	ld	s0,32(sp)
    80003c24:	01813483          	ld	s1,24(sp)
    80003c28:	01013903          	ld	s2,16(sp)
    80003c2c:	00813983          	ld	s3,8(sp)
    80003c30:	03010113          	addi	sp,sp,48
    80003c34:	00008067          	ret

0000000080003c38 <_Z11printStringPKc>:
{
    80003c38:	fe010113          	addi	sp,sp,-32
    80003c3c:	00113c23          	sd	ra,24(sp)
    80003c40:	00813823          	sd	s0,16(sp)
    80003c44:	00913423          	sd	s1,8(sp)
    80003c48:	02010413          	addi	s0,sp,32
    80003c4c:	00050493          	mv	s1,a0
    LOCK();
    80003c50:	00100613          	li	a2,1
    80003c54:	00000593          	li	a1,0
    80003c58:	00006517          	auipc	a0,0x6
    80003c5c:	20050513          	addi	a0,a0,512 # 80009e58 <lockPrint>
    80003c60:	ffffd097          	auipc	ra,0xffffd
    80003c64:	520080e7          	jalr	1312(ra) # 80001180 <copy_and_swap>
    80003c68:	fe0514e3          	bnez	a0,80003c50 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80003c6c:	0004c503          	lbu	a0,0(s1)
    80003c70:	00050a63          	beqz	a0,80003c84 <_Z11printStringPKc+0x4c>
        putc(*string);
    80003c74:	fffff097          	auipc	ra,0xfffff
    80003c78:	ab4080e7          	jalr	-1356(ra) # 80002728 <_Z4putcc>
        string++;
    80003c7c:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80003c80:	fedff06f          	j	80003c6c <_Z11printStringPKc+0x34>
    UNLOCK();
    80003c84:	00000613          	li	a2,0
    80003c88:	00100593          	li	a1,1
    80003c8c:	00006517          	auipc	a0,0x6
    80003c90:	1cc50513          	addi	a0,a0,460 # 80009e58 <lockPrint>
    80003c94:	ffffd097          	auipc	ra,0xffffd
    80003c98:	4ec080e7          	jalr	1260(ra) # 80001180 <copy_and_swap>
    80003c9c:	fe0514e3          	bnez	a0,80003c84 <_Z11printStringPKc+0x4c>
}
    80003ca0:	01813083          	ld	ra,24(sp)
    80003ca4:	01013403          	ld	s0,16(sp)
    80003ca8:	00813483          	ld	s1,8(sp)
    80003cac:	02010113          	addi	sp,sp,32
    80003cb0:	00008067          	ret

0000000080003cb4 <_Z11workerBodyAPv>:
    if (n == 0 || n == 1) { return n; }
    if (n % 10 == 0) { thread_dispatch(); }
    return fibonacci(n - 1) + fibonacci(n - 2);
}

void workerBodyA(void* arg) {
    80003cb4:	fe010113          	addi	sp,sp,-32
    80003cb8:	00113c23          	sd	ra,24(sp)
    80003cbc:	00813823          	sd	s0,16(sp)
    80003cc0:	00913423          	sd	s1,8(sp)
    80003cc4:	01213023          	sd	s2,0(sp)
    80003cc8:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80003ccc:	00000913          	li	s2,0
    80003cd0:	0380006f          	j	80003d08 <_Z11workerBodyAPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003cd4:	fffff097          	auipc	ra,0xfffff
    80003cd8:	8a8080e7          	jalr	-1880(ra) # 8000257c <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003cdc:	00148493          	addi	s1,s1,1
    80003ce0:	000027b7          	lui	a5,0x2
    80003ce4:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003ce8:	0097ee63          	bltu	a5,s1,80003d04 <_Z11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003cec:	00000713          	li	a4,0
    80003cf0:	000077b7          	lui	a5,0x7
    80003cf4:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003cf8:	fce7eee3          	bltu	a5,a4,80003cd4 <_Z11workerBodyAPv+0x20>
    80003cfc:	00170713          	addi	a4,a4,1
    80003d00:	ff1ff06f          	j	80003cf0 <_Z11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80003d04:	00190913          	addi	s2,s2,1
    80003d08:	00900793          	li	a5,9
    80003d0c:	0527e063          	bltu	a5,s2,80003d4c <_Z11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80003d10:	00004517          	auipc	a0,0x4
    80003d14:	4f050513          	addi	a0,a0,1264 # 80008200 <_ZZ14kprintUnsignedmE6digits+0x10>
    80003d18:	00000097          	auipc	ra,0x0
    80003d1c:	f20080e7          	jalr	-224(ra) # 80003c38 <_Z11printStringPKc>
    80003d20:	00000613          	li	a2,0
    80003d24:	00a00593          	li	a1,10
    80003d28:	0009051b          	sext.w	a0,s2
    80003d2c:	00000097          	auipc	ra,0x0
    80003d30:	bec080e7          	jalr	-1044(ra) # 80003918 <_ZL8printIntiii>
    80003d34:	00004517          	auipc	a0,0x4
    80003d38:	45450513          	addi	a0,a0,1108 # 80008188 <CONSOLE_STATUS+0x178>
    80003d3c:	00000097          	auipc	ra,0x0
    80003d40:	efc080e7          	jalr	-260(ra) # 80003c38 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003d44:	00000493          	li	s1,0
    80003d48:	f99ff06f          	j	80003ce0 <_Z11workerBodyAPv+0x2c>
        }
    }
    printString("A finished!\n");
    80003d4c:	00004517          	auipc	a0,0x4
    80003d50:	4bc50513          	addi	a0,a0,1212 # 80008208 <_ZZ14kprintUnsignedmE6digits+0x18>
    80003d54:	00000097          	auipc	ra,0x0
    80003d58:	ee4080e7          	jalr	-284(ra) # 80003c38 <_Z11printStringPKc>
    finishedA = true;
    80003d5c:	00100793          	li	a5,1
    80003d60:	00006717          	auipc	a4,0x6
    80003d64:	10f70223          	sb	a5,260(a4) # 80009e64 <finishedA>
}
    80003d68:	01813083          	ld	ra,24(sp)
    80003d6c:	01013403          	ld	s0,16(sp)
    80003d70:	00813483          	ld	s1,8(sp)
    80003d74:	00013903          	ld	s2,0(sp)
    80003d78:	02010113          	addi	sp,sp,32
    80003d7c:	00008067          	ret

0000000080003d80 <_Z11workerBodyBPv>:

void workerBodyB(void* arg) {
    80003d80:	fe010113          	addi	sp,sp,-32
    80003d84:	00113c23          	sd	ra,24(sp)
    80003d88:	00813823          	sd	s0,16(sp)
    80003d8c:	00913423          	sd	s1,8(sp)
    80003d90:	01213023          	sd	s2,0(sp)
    80003d94:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80003d98:	00000913          	li	s2,0
    80003d9c:	0380006f          	j	80003dd4 <_Z11workerBodyBPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003da0:	ffffe097          	auipc	ra,0xffffe
    80003da4:	7dc080e7          	jalr	2012(ra) # 8000257c <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003da8:	00148493          	addi	s1,s1,1
    80003dac:	000027b7          	lui	a5,0x2
    80003db0:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003db4:	0097ee63          	bltu	a5,s1,80003dd0 <_Z11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003db8:	00000713          	li	a4,0
    80003dbc:	000077b7          	lui	a5,0x7
    80003dc0:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003dc4:	fce7eee3          	bltu	a5,a4,80003da0 <_Z11workerBodyBPv+0x20>
    80003dc8:	00170713          	addi	a4,a4,1
    80003dcc:	ff1ff06f          	j	80003dbc <_Z11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80003dd0:	00190913          	addi	s2,s2,1
    80003dd4:	00f00793          	li	a5,15
    80003dd8:	0527e063          	bltu	a5,s2,80003e18 <_Z11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80003ddc:	00004517          	auipc	a0,0x4
    80003de0:	43c50513          	addi	a0,a0,1084 # 80008218 <_ZZ14kprintUnsignedmE6digits+0x28>
    80003de4:	00000097          	auipc	ra,0x0
    80003de8:	e54080e7          	jalr	-428(ra) # 80003c38 <_Z11printStringPKc>
    80003dec:	00000613          	li	a2,0
    80003df0:	00a00593          	li	a1,10
    80003df4:	0009051b          	sext.w	a0,s2
    80003df8:	00000097          	auipc	ra,0x0
    80003dfc:	b20080e7          	jalr	-1248(ra) # 80003918 <_ZL8printIntiii>
    80003e00:	00004517          	auipc	a0,0x4
    80003e04:	38850513          	addi	a0,a0,904 # 80008188 <CONSOLE_STATUS+0x178>
    80003e08:	00000097          	auipc	ra,0x0
    80003e0c:	e30080e7          	jalr	-464(ra) # 80003c38 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003e10:	00000493          	li	s1,0
    80003e14:	f99ff06f          	j	80003dac <_Z11workerBodyBPv+0x2c>
        }
    }
    printString("B finished!\n");
    80003e18:	00004517          	auipc	a0,0x4
    80003e1c:	40850513          	addi	a0,a0,1032 # 80008220 <_ZZ14kprintUnsignedmE6digits+0x30>
    80003e20:	00000097          	auipc	ra,0x0
    80003e24:	e18080e7          	jalr	-488(ra) # 80003c38 <_Z11printStringPKc>
    finishedB = true;
    80003e28:	00100793          	li	a5,1
    80003e2c:	00006717          	auipc	a4,0x6
    80003e30:	02f70ca3          	sb	a5,57(a4) # 80009e65 <finishedB>
    thread_dispatch();
    80003e34:	ffffe097          	auipc	ra,0xffffe
    80003e38:	748080e7          	jalr	1864(ra) # 8000257c <_Z15thread_dispatchv>
}
    80003e3c:	01813083          	ld	ra,24(sp)
    80003e40:	01013403          	ld	s0,16(sp)
    80003e44:	00813483          	ld	s1,8(sp)
    80003e48:	00013903          	ld	s2,0(sp)
    80003e4c:	02010113          	addi	sp,sp,32
    80003e50:	00008067          	ret

0000000080003e54 <_Z9sleepyRunPv>:

#include "printing.hpp"

bool finished[2];

void sleepyRun(void *arg) {
    80003e54:	fe010113          	addi	sp,sp,-32
    80003e58:	00113c23          	sd	ra,24(sp)
    80003e5c:	00813823          	sd	s0,16(sp)
    80003e60:	00913423          	sd	s1,8(sp)
    80003e64:	01213023          	sd	s2,0(sp)
    80003e68:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    80003e6c:	00053903          	ld	s2,0(a0)
    int i = 6;
    80003e70:	00600493          	li	s1,6
    while (--i > 0) {
    80003e74:	fff4849b          	addiw	s1,s1,-1
    80003e78:	04905463          	blez	s1,80003ec0 <_Z9sleepyRunPv+0x6c>
        printString("Hello ");
    80003e7c:	00004517          	auipc	a0,0x4
    80003e80:	3b450513          	addi	a0,a0,948 # 80008230 <_ZZ14kprintUnsignedmE6digits+0x40>
    80003e84:	00000097          	auipc	ra,0x0
    80003e88:	db4080e7          	jalr	-588(ra) # 80003c38 <_Z11printStringPKc>
        printInt(sleep_time);
    80003e8c:	00000613          	li	a2,0
    80003e90:	00a00593          	li	a1,10
    80003e94:	0009051b          	sext.w	a0,s2
    80003e98:	00000097          	auipc	ra,0x0
    80003e9c:	a80080e7          	jalr	-1408(ra) # 80003918 <_ZL8printIntiii>
        printString(" !\n");
    80003ea0:	00004517          	auipc	a0,0x4
    80003ea4:	39850513          	addi	a0,a0,920 # 80008238 <_ZZ14kprintUnsignedmE6digits+0x48>
    80003ea8:	00000097          	auipc	ra,0x0
    80003eac:	d90080e7          	jalr	-624(ra) # 80003c38 <_Z11printStringPKc>
        time_sleep(sleep_time);
    80003eb0:	00090513          	mv	a0,s2
    80003eb4:	fffff097          	auipc	ra,0xfffff
    80003eb8:	80c080e7          	jalr	-2036(ra) # 800026c0 <_Z10time_sleepm>
    while (--i > 0) {
    80003ebc:	fb9ff06f          	j	80003e74 <_Z9sleepyRunPv+0x20>
    }
    finished[sleep_time/10-1] = true;
    80003ec0:	00a00793          	li	a5,10
    80003ec4:	02f95933          	divu	s2,s2,a5
    80003ec8:	fff90913          	addi	s2,s2,-1
    80003ecc:	00006797          	auipc	a5,0x6
    80003ed0:	f8c78793          	addi	a5,a5,-116 # 80009e58 <lockPrint>
    80003ed4:	01278933          	add	s2,a5,s2
    80003ed8:	00100793          	li	a5,1
    80003edc:	00f90823          	sb	a5,16(s2)
}
    80003ee0:	01813083          	ld	ra,24(sp)
    80003ee4:	01013403          	ld	s0,16(sp)
    80003ee8:	00813483          	ld	s1,8(sp)
    80003eec:	00013903          	ld	s2,0(sp)
    80003ef0:	02010113          	addi	sp,sp,32
    80003ef4:	00008067          	ret

0000000080003ef8 <_Z11workerBodyEPv>:
//    printInteger(n);
//    printString(" fibonacci number\n");
    return fibonacci(n-1) + fibonacci(n-2);
}

void workerBodyE(void *) {
    80003ef8:	fe010113          	addi	sp,sp,-32
    80003efc:	00113c23          	sd	ra,24(sp)
    80003f00:	00813823          	sd	s0,16(sp)
    80003f04:	00913423          	sd	s1,8(sp)
    80003f08:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80003f0c:	00000493          	li	s1,0
    80003f10:	0180006f          	j	80003f28 <_Z11workerBodyEPv+0x30>
        printString("A: i=");
        printInt(i);
        printString("\n");
        if (i % 4 == 0) time_sleep(50);
    80003f14:	03200513          	li	a0,50
    80003f18:	ffffe097          	auipc	ra,0xffffe
    80003f1c:	7a8080e7          	jalr	1960(ra) # 800026c0 <_Z10time_sleepm>
    80003f20:	04c0006f          	j	80003f6c <_Z11workerBodyEPv+0x74>
    for (uint64 i = 0; i < 10; i++) {
    80003f24:	00148493          	addi	s1,s1,1
    80003f28:	00900793          	li	a5,9
    80003f2c:	0497ec63          	bltu	a5,s1,80003f84 <_Z11workerBodyEPv+0x8c>
        printString("A: i=");
    80003f30:	00004517          	auipc	a0,0x4
    80003f34:	2d050513          	addi	a0,a0,720 # 80008200 <_ZZ14kprintUnsignedmE6digits+0x10>
    80003f38:	00000097          	auipc	ra,0x0
    80003f3c:	d00080e7          	jalr	-768(ra) # 80003c38 <_Z11printStringPKc>
        printInt(i);
    80003f40:	00000613          	li	a2,0
    80003f44:	00a00593          	li	a1,10
    80003f48:	0004851b          	sext.w	a0,s1
    80003f4c:	00000097          	auipc	ra,0x0
    80003f50:	9cc080e7          	jalr	-1588(ra) # 80003918 <_ZL8printIntiii>
        printString("\n");
    80003f54:	00004517          	auipc	a0,0x4
    80003f58:	23450513          	addi	a0,a0,564 # 80008188 <CONSOLE_STATUS+0x178>
    80003f5c:	00000097          	auipc	ra,0x0
    80003f60:	cdc080e7          	jalr	-804(ra) # 80003c38 <_Z11printStringPKc>
        if (i % 4 == 0) time_sleep(50);
    80003f64:	0034f793          	andi	a5,s1,3
    80003f68:	fa0786e3          	beqz	a5,80003f14 <_Z11workerBodyEPv+0x1c>
        for (uint64 k = 0; k < 30000; k++) {
    80003f6c:	00000713          	li	a4,0
    80003f70:	000077b7          	lui	a5,0x7
    80003f74:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003f78:	fae7e6e3          	bltu	a5,a4,80003f24 <_Z11workerBodyEPv+0x2c>
    80003f7c:	00170713          	addi	a4,a4,1
    80003f80:	ff1ff06f          	j	80003f70 <_Z11workerBodyEPv+0x78>
            //busy wait
        }
        // TCB::yield();
    }
    printString("Worker A finished\n");
    80003f84:	00004517          	auipc	a0,0x4
    80003f88:	2bc50513          	addi	a0,a0,700 # 80008240 <_ZZ14kprintUnsignedmE6digits+0x50>
    80003f8c:	00000097          	auipc	ra,0x0
    80003f90:	cac080e7          	jalr	-852(ra) # 80003c38 <_Z11printStringPKc>
}
    80003f94:	01813083          	ld	ra,24(sp)
    80003f98:	01013403          	ld	s0,16(sp)
    80003f9c:	00813483          	ld	s1,8(sp)
    80003fa0:	02010113          	addi	sp,sp,32
    80003fa4:	00008067          	ret

0000000080003fa8 <_Z11workerBodyFPv>:

void workerBodyF(void *) {
    80003fa8:	fe010113          	addi	sp,sp,-32
    80003fac:	00113c23          	sd	ra,24(sp)
    80003fb0:	00813823          	sd	s0,16(sp)
    80003fb4:	00913423          	sd	s1,8(sp)
    80003fb8:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80003fbc:	00000493          	li	s1,0
    80003fc0:	0380006f          	j	80003ff8 <_Z11workerBodyFPv+0x50>
        printString("B: i=");
        printInt(i);
        printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
    80003fc4:	00168693          	addi	a3,a3,1
    80003fc8:	000027b7          	lui	a5,0x2
    80003fcc:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003fd0:	00d7ee63          	bltu	a5,a3,80003fec <_Z11workerBodyFPv+0x44>
            for (uint64 k = 0; k < 30000; k++) {
    80003fd4:	00000713          	li	a4,0
    80003fd8:	000077b7          	lui	a5,0x7
    80003fdc:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003fe0:	fee7e2e3          	bltu	a5,a4,80003fc4 <_Z11workerBodyFPv+0x1c>
    80003fe4:	00170713          	addi	a4,a4,1
    80003fe8:	ff1ff06f          	j	80003fd8 <_Z11workerBodyFPv+0x30>
                // busy wait
            }
            // TCB::yield()
        }
        thread_dispatch();
    80003fec:	ffffe097          	auipc	ra,0xffffe
    80003ff0:	590080e7          	jalr	1424(ra) # 8000257c <_Z15thread_dispatchv>
    for (uint64 i = 0; i < 16; i++) {
    80003ff4:	00148493          	addi	s1,s1,1
    80003ff8:	00f00793          	li	a5,15
    80003ffc:	0497e063          	bltu	a5,s1,8000403c <_Z11workerBodyFPv+0x94>
        printString("B: i=");
    80004000:	00004517          	auipc	a0,0x4
    80004004:	21850513          	addi	a0,a0,536 # 80008218 <_ZZ14kprintUnsignedmE6digits+0x28>
    80004008:	00000097          	auipc	ra,0x0
    8000400c:	c30080e7          	jalr	-976(ra) # 80003c38 <_Z11printStringPKc>
        printInt(i);
    80004010:	00000613          	li	a2,0
    80004014:	00a00593          	li	a1,10
    80004018:	0004851b          	sext.w	a0,s1
    8000401c:	00000097          	auipc	ra,0x0
    80004020:	8fc080e7          	jalr	-1796(ra) # 80003918 <_ZL8printIntiii>
        printString("\n");
    80004024:	00004517          	auipc	a0,0x4
    80004028:	16450513          	addi	a0,a0,356 # 80008188 <CONSOLE_STATUS+0x178>
    8000402c:	00000097          	auipc	ra,0x0
    80004030:	c0c080e7          	jalr	-1012(ra) # 80003c38 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80004034:	00000693          	li	a3,0
    80004038:	f91ff06f          	j	80003fc8 <_Z11workerBodyFPv+0x20>
    }
    printString("Worker B finished\n");
    8000403c:	00004517          	auipc	a0,0x4
    80004040:	21c50513          	addi	a0,a0,540 # 80008258 <_ZZ14kprintUnsignedmE6digits+0x68>
    80004044:	00000097          	auipc	ra,0x0
    80004048:	bf4080e7          	jalr	-1036(ra) # 80003c38 <_Z11printStringPKc>
}
    8000404c:	01813083          	ld	ra,24(sp)
    80004050:	01013403          	ld	s0,16(sp)
    80004054:	00813483          	ld	s1,8(sp)
    80004058:	02010113          	addi	sp,sp,32
    8000405c:	00008067          	ret

0000000080004060 <_Z9getStringPci>:
char* getString(char *buf, int max) {
    80004060:	fd010113          	addi	sp,sp,-48
    80004064:	02113423          	sd	ra,40(sp)
    80004068:	02813023          	sd	s0,32(sp)
    8000406c:	00913c23          	sd	s1,24(sp)
    80004070:	01213823          	sd	s2,16(sp)
    80004074:	01313423          	sd	s3,8(sp)
    80004078:	01413023          	sd	s4,0(sp)
    8000407c:	03010413          	addi	s0,sp,48
    80004080:	00050993          	mv	s3,a0
    80004084:	00058a13          	mv	s4,a1
    LOCK();
    80004088:	00100613          	li	a2,1
    8000408c:	00000593          	li	a1,0
    80004090:	00006517          	auipc	a0,0x6
    80004094:	dc850513          	addi	a0,a0,-568 # 80009e58 <lockPrint>
    80004098:	ffffd097          	auipc	ra,0xffffd
    8000409c:	0e8080e7          	jalr	232(ra) # 80001180 <copy_and_swap>
    800040a0:	fe0514e3          	bnez	a0,80004088 <_Z9getStringPci+0x28>
    for(i=0; i+1 < max; ){
    800040a4:	00000913          	li	s2,0
    800040a8:	00090493          	mv	s1,s2
    800040ac:	0019091b          	addiw	s2,s2,1
    800040b0:	03495a63          	bge	s2,s4,800040e4 <_Z9getStringPci+0x84>
        cc = getc();
    800040b4:	ffffe097          	auipc	ra,0xffffe
    800040b8:	640080e7          	jalr	1600(ra) # 800026f4 <_Z4getcv>
        if(cc < 1)
    800040bc:	02050463          	beqz	a0,800040e4 <_Z9getStringPci+0x84>
        buf[i++] = c;
    800040c0:	009984b3          	add	s1,s3,s1
    800040c4:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    800040c8:	00a00793          	li	a5,10
    800040cc:	00f50a63          	beq	a0,a5,800040e0 <_Z9getStringPci+0x80>
    800040d0:	00d00793          	li	a5,13
    800040d4:	fcf51ae3          	bne	a0,a5,800040a8 <_Z9getStringPci+0x48>
        buf[i++] = c;
    800040d8:	00090493          	mv	s1,s2
    800040dc:	0080006f          	j	800040e4 <_Z9getStringPci+0x84>
    800040e0:	00090493          	mv	s1,s2
    buf[i] = '\0';
    800040e4:	009984b3          	add	s1,s3,s1
    800040e8:	00048023          	sb	zero,0(s1)
    UNLOCK();
    800040ec:	00000613          	li	a2,0
    800040f0:	00100593          	li	a1,1
    800040f4:	00006517          	auipc	a0,0x6
    800040f8:	d6450513          	addi	a0,a0,-668 # 80009e58 <lockPrint>
    800040fc:	ffffd097          	auipc	ra,0xffffd
    80004100:	084080e7          	jalr	132(ra) # 80001180 <copy_and_swap>
    80004104:	fe0514e3          	bnez	a0,800040ec <_Z9getStringPci+0x8c>
}
    80004108:	00098513          	mv	a0,s3
    8000410c:	02813083          	ld	ra,40(sp)
    80004110:	02013403          	ld	s0,32(sp)
    80004114:	01813483          	ld	s1,24(sp)
    80004118:	01013903          	ld	s2,16(sp)
    8000411c:	00813983          	ld	s3,8(sp)
    80004120:	00013a03          	ld	s4,0(sp)
    80004124:	03010113          	addi	sp,sp,48
    80004128:	00008067          	ret

000000008000412c <_Z11stringToIntPKc>:
int stringToInt(const char *s) {
    8000412c:	ff010113          	addi	sp,sp,-16
    80004130:	00813423          	sd	s0,8(sp)
    80004134:	01010413          	addi	s0,sp,16
    80004138:	00050693          	mv	a3,a0
    n = 0;
    8000413c:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80004140:	0006c603          	lbu	a2,0(a3)
    80004144:	fd06071b          	addiw	a4,a2,-48
    80004148:	0ff77713          	andi	a4,a4,255
    8000414c:	00900793          	li	a5,9
    80004150:	02e7e063          	bltu	a5,a4,80004170 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80004154:	0025179b          	slliw	a5,a0,0x2
    80004158:	00a787bb          	addw	a5,a5,a0
    8000415c:	0017979b          	slliw	a5,a5,0x1
    80004160:	00168693          	addi	a3,a3,1
    80004164:	00c787bb          	addw	a5,a5,a2
    80004168:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    8000416c:	fd5ff06f          	j	80004140 <_Z11stringToIntPKc+0x14>
}
    80004170:	00813403          	ld	s0,8(sp)
    80004174:	01010113          	addi	sp,sp,16
    80004178:	00008067          	ret

000000008000417c <_Z9fibonaccim>:
uint64 fibonacci(uint64 n) {
    8000417c:	fe010113          	addi	sp,sp,-32
    80004180:	00113c23          	sd	ra,24(sp)
    80004184:	00813823          	sd	s0,16(sp)
    80004188:	00913423          	sd	s1,8(sp)
    8000418c:	01213023          	sd	s2,0(sp)
    80004190:	02010413          	addi	s0,sp,32
    80004194:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80004198:	00100793          	li	a5,1
    8000419c:	02a7f863          	bgeu	a5,a0,800041cc <_Z9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    800041a0:	00a00793          	li	a5,10
    800041a4:	02f577b3          	remu	a5,a0,a5
    800041a8:	02078e63          	beqz	a5,800041e4 <_Z9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    800041ac:	fff48513          	addi	a0,s1,-1
    800041b0:	00000097          	auipc	ra,0x0
    800041b4:	fcc080e7          	jalr	-52(ra) # 8000417c <_Z9fibonaccim>
    800041b8:	00050913          	mv	s2,a0
    800041bc:	ffe48513          	addi	a0,s1,-2
    800041c0:	00000097          	auipc	ra,0x0
    800041c4:	fbc080e7          	jalr	-68(ra) # 8000417c <_Z9fibonaccim>
    800041c8:	00a90533          	add	a0,s2,a0
}
    800041cc:	01813083          	ld	ra,24(sp)
    800041d0:	01013403          	ld	s0,16(sp)
    800041d4:	00813483          	ld	s1,8(sp)
    800041d8:	00013903          	ld	s2,0(sp)
    800041dc:	02010113          	addi	sp,sp,32
    800041e0:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    800041e4:	ffffe097          	auipc	ra,0xffffe
    800041e8:	398080e7          	jalr	920(ra) # 8000257c <_Z15thread_dispatchv>
    800041ec:	fc1ff06f          	j	800041ac <_Z9fibonaccim+0x30>

00000000800041f0 <_Z11workerBodyCPv>:

void workerBodyC(void* arg) {
    800041f0:	fe010113          	addi	sp,sp,-32
    800041f4:	00113c23          	sd	ra,24(sp)
    800041f8:	00813823          	sd	s0,16(sp)
    800041fc:	00913423          	sd	s1,8(sp)
    80004200:	01213023          	sd	s2,0(sp)
    80004204:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80004208:	00000493          	li	s1,0
    8000420c:	0400006f          	j	8000424c <_Z11workerBodyCPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80004210:	00004517          	auipc	a0,0x4
    80004214:	06050513          	addi	a0,a0,96 # 80008270 <_ZZ14kprintUnsignedmE6digits+0x80>
    80004218:	00000097          	auipc	ra,0x0
    8000421c:	a20080e7          	jalr	-1504(ra) # 80003c38 <_Z11printStringPKc>
    80004220:	00000613          	li	a2,0
    80004224:	00a00593          	li	a1,10
    80004228:	00048513          	mv	a0,s1
    8000422c:	fffff097          	auipc	ra,0xfffff
    80004230:	6ec080e7          	jalr	1772(ra) # 80003918 <_ZL8printIntiii>
    80004234:	00004517          	auipc	a0,0x4
    80004238:	f5450513          	addi	a0,a0,-172 # 80008188 <CONSOLE_STATUS+0x178>
    8000423c:	00000097          	auipc	ra,0x0
    80004240:	9fc080e7          	jalr	-1540(ra) # 80003c38 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80004244:	0014849b          	addiw	s1,s1,1
    80004248:	0ff4f493          	andi	s1,s1,255
    8000424c:	00200793          	li	a5,2
    80004250:	fc97f0e3          	bgeu	a5,s1,80004210 <_Z11workerBodyCPv+0x20>
    }

    printString("C: dispatch\n");
    80004254:	00004517          	auipc	a0,0x4
    80004258:	02450513          	addi	a0,a0,36 # 80008278 <_ZZ14kprintUnsignedmE6digits+0x88>
    8000425c:	00000097          	auipc	ra,0x0
    80004260:	9dc080e7          	jalr	-1572(ra) # 80003c38 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80004264:	00700313          	li	t1,7
    thread_dispatch();
    80004268:	ffffe097          	auipc	ra,0xffffe
    8000426c:	314080e7          	jalr	788(ra) # 8000257c <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80004270:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    80004274:	00004517          	auipc	a0,0x4
    80004278:	01450513          	addi	a0,a0,20 # 80008288 <_ZZ14kprintUnsignedmE6digits+0x98>
    8000427c:	00000097          	auipc	ra,0x0
    80004280:	9bc080e7          	jalr	-1604(ra) # 80003c38 <_Z11printStringPKc>
    80004284:	00000613          	li	a2,0
    80004288:	00a00593          	li	a1,10
    8000428c:	0009051b          	sext.w	a0,s2
    80004290:	fffff097          	auipc	ra,0xfffff
    80004294:	688080e7          	jalr	1672(ra) # 80003918 <_ZL8printIntiii>
    80004298:	00004517          	auipc	a0,0x4
    8000429c:	ef050513          	addi	a0,a0,-272 # 80008188 <CONSOLE_STATUS+0x178>
    800042a0:	00000097          	auipc	ra,0x0
    800042a4:	998080e7          	jalr	-1640(ra) # 80003c38 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    800042a8:	00c00513          	li	a0,12
    800042ac:	00000097          	auipc	ra,0x0
    800042b0:	ed0080e7          	jalr	-304(ra) # 8000417c <_Z9fibonaccim>
    800042b4:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    800042b8:	00004517          	auipc	a0,0x4
    800042bc:	fd850513          	addi	a0,a0,-40 # 80008290 <_ZZ14kprintUnsignedmE6digits+0xa0>
    800042c0:	00000097          	auipc	ra,0x0
    800042c4:	978080e7          	jalr	-1672(ra) # 80003c38 <_Z11printStringPKc>
    800042c8:	00000613          	li	a2,0
    800042cc:	00a00593          	li	a1,10
    800042d0:	0009051b          	sext.w	a0,s2
    800042d4:	fffff097          	auipc	ra,0xfffff
    800042d8:	644080e7          	jalr	1604(ra) # 80003918 <_ZL8printIntiii>
    800042dc:	00004517          	auipc	a0,0x4
    800042e0:	eac50513          	addi	a0,a0,-340 # 80008188 <CONSOLE_STATUS+0x178>
    800042e4:	00000097          	auipc	ra,0x0
    800042e8:	954080e7          	jalr	-1708(ra) # 80003c38 <_Z11printStringPKc>
    800042ec:	0400006f          	j	8000432c <_Z11workerBodyCPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    800042f0:	00004517          	auipc	a0,0x4
    800042f4:	f8050513          	addi	a0,a0,-128 # 80008270 <_ZZ14kprintUnsignedmE6digits+0x80>
    800042f8:	00000097          	auipc	ra,0x0
    800042fc:	940080e7          	jalr	-1728(ra) # 80003c38 <_Z11printStringPKc>
    80004300:	00000613          	li	a2,0
    80004304:	00a00593          	li	a1,10
    80004308:	00048513          	mv	a0,s1
    8000430c:	fffff097          	auipc	ra,0xfffff
    80004310:	60c080e7          	jalr	1548(ra) # 80003918 <_ZL8printIntiii>
    80004314:	00004517          	auipc	a0,0x4
    80004318:	e7450513          	addi	a0,a0,-396 # 80008188 <CONSOLE_STATUS+0x178>
    8000431c:	00000097          	auipc	ra,0x0
    80004320:	91c080e7          	jalr	-1764(ra) # 80003c38 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80004324:	0014849b          	addiw	s1,s1,1
    80004328:	0ff4f493          	andi	s1,s1,255
    8000432c:	00500793          	li	a5,5
    80004330:	fc97f0e3          	bgeu	a5,s1,800042f0 <_Z11workerBodyCPv+0x100>
    }

    printString("C finished!\n");
    80004334:	00004517          	auipc	a0,0x4
    80004338:	f6c50513          	addi	a0,a0,-148 # 800082a0 <_ZZ14kprintUnsignedmE6digits+0xb0>
    8000433c:	00000097          	auipc	ra,0x0
    80004340:	8fc080e7          	jalr	-1796(ra) # 80003c38 <_Z11printStringPKc>
    finishedC = true;
    80004344:	00100793          	li	a5,1
    80004348:	00006717          	auipc	a4,0x6
    8000434c:	b2f70123          	sb	a5,-1246(a4) # 80009e6a <finishedC>
    thread_dispatch();
    80004350:	ffffe097          	auipc	ra,0xffffe
    80004354:	22c080e7          	jalr	556(ra) # 8000257c <_Z15thread_dispatchv>
}
    80004358:	01813083          	ld	ra,24(sp)
    8000435c:	01013403          	ld	s0,16(sp)
    80004360:	00813483          	ld	s1,8(sp)
    80004364:	00013903          	ld	s2,0(sp)
    80004368:	02010113          	addi	sp,sp,32
    8000436c:	00008067          	ret

0000000080004370 <_Z11workerBodyDPv>:

void workerBodyD(void* arg) {
    80004370:	fe010113          	addi	sp,sp,-32
    80004374:	00113c23          	sd	ra,24(sp)
    80004378:	00813823          	sd	s0,16(sp)
    8000437c:	00913423          	sd	s1,8(sp)
    80004380:	01213023          	sd	s2,0(sp)
    80004384:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80004388:	00a00493          	li	s1,10
    8000438c:	0400006f          	j	800043cc <_Z11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004390:	00004517          	auipc	a0,0x4
    80004394:	f2050513          	addi	a0,a0,-224 # 800082b0 <_ZZ14kprintUnsignedmE6digits+0xc0>
    80004398:	00000097          	auipc	ra,0x0
    8000439c:	8a0080e7          	jalr	-1888(ra) # 80003c38 <_Z11printStringPKc>
    800043a0:	00000613          	li	a2,0
    800043a4:	00a00593          	li	a1,10
    800043a8:	00048513          	mv	a0,s1
    800043ac:	fffff097          	auipc	ra,0xfffff
    800043b0:	56c080e7          	jalr	1388(ra) # 80003918 <_ZL8printIntiii>
    800043b4:	00004517          	auipc	a0,0x4
    800043b8:	dd450513          	addi	a0,a0,-556 # 80008188 <CONSOLE_STATUS+0x178>
    800043bc:	00000097          	auipc	ra,0x0
    800043c0:	87c080e7          	jalr	-1924(ra) # 80003c38 <_Z11printStringPKc>
    for (; i < 13; i++) {
    800043c4:	0014849b          	addiw	s1,s1,1
    800043c8:	0ff4f493          	andi	s1,s1,255
    800043cc:	00c00793          	li	a5,12
    800043d0:	fc97f0e3          	bgeu	a5,s1,80004390 <_Z11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    800043d4:	00004517          	auipc	a0,0x4
    800043d8:	ee450513          	addi	a0,a0,-284 # 800082b8 <_ZZ14kprintUnsignedmE6digits+0xc8>
    800043dc:	00000097          	auipc	ra,0x0
    800043e0:	85c080e7          	jalr	-1956(ra) # 80003c38 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    800043e4:	00500313          	li	t1,5
    thread_dispatch();
    800043e8:	ffffe097          	auipc	ra,0xffffe
    800043ec:	194080e7          	jalr	404(ra) # 8000257c <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    800043f0:	01000513          	li	a0,16
    800043f4:	00000097          	auipc	ra,0x0
    800043f8:	d88080e7          	jalr	-632(ra) # 8000417c <_Z9fibonaccim>
    800043fc:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80004400:	00004517          	auipc	a0,0x4
    80004404:	ec850513          	addi	a0,a0,-312 # 800082c8 <_ZZ14kprintUnsignedmE6digits+0xd8>
    80004408:	00000097          	auipc	ra,0x0
    8000440c:	830080e7          	jalr	-2000(ra) # 80003c38 <_Z11printStringPKc>
    80004410:	00000613          	li	a2,0
    80004414:	00a00593          	li	a1,10
    80004418:	0009051b          	sext.w	a0,s2
    8000441c:	fffff097          	auipc	ra,0xfffff
    80004420:	4fc080e7          	jalr	1276(ra) # 80003918 <_ZL8printIntiii>
    80004424:	00004517          	auipc	a0,0x4
    80004428:	d6450513          	addi	a0,a0,-668 # 80008188 <CONSOLE_STATUS+0x178>
    8000442c:	00000097          	auipc	ra,0x0
    80004430:	80c080e7          	jalr	-2036(ra) # 80003c38 <_Z11printStringPKc>
    80004434:	0400006f          	j	80004474 <_Z11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004438:	00004517          	auipc	a0,0x4
    8000443c:	e7850513          	addi	a0,a0,-392 # 800082b0 <_ZZ14kprintUnsignedmE6digits+0xc0>
    80004440:	fffff097          	auipc	ra,0xfffff
    80004444:	7f8080e7          	jalr	2040(ra) # 80003c38 <_Z11printStringPKc>
    80004448:	00000613          	li	a2,0
    8000444c:	00a00593          	li	a1,10
    80004450:	00048513          	mv	a0,s1
    80004454:	fffff097          	auipc	ra,0xfffff
    80004458:	4c4080e7          	jalr	1220(ra) # 80003918 <_ZL8printIntiii>
    8000445c:	00004517          	auipc	a0,0x4
    80004460:	d2c50513          	addi	a0,a0,-724 # 80008188 <CONSOLE_STATUS+0x178>
    80004464:	fffff097          	auipc	ra,0xfffff
    80004468:	7d4080e7          	jalr	2004(ra) # 80003c38 <_Z11printStringPKc>
    for (; i < 16; i++) {
    8000446c:	0014849b          	addiw	s1,s1,1
    80004470:	0ff4f493          	andi	s1,s1,255
    80004474:	00f00793          	li	a5,15
    80004478:	fc97f0e3          	bgeu	a5,s1,80004438 <_Z11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    8000447c:	00004517          	auipc	a0,0x4
    80004480:	e5c50513          	addi	a0,a0,-420 # 800082d8 <_ZZ14kprintUnsignedmE6digits+0xe8>
    80004484:	fffff097          	auipc	ra,0xfffff
    80004488:	7b4080e7          	jalr	1972(ra) # 80003c38 <_Z11printStringPKc>
    finishedD = true;
    8000448c:	00100793          	li	a5,1
    80004490:	00006717          	auipc	a4,0x6
    80004494:	9cf70da3          	sb	a5,-1573(a4) # 80009e6b <finishedD>
    thread_dispatch();
    80004498:	ffffe097          	auipc	ra,0xffffe
    8000449c:	0e4080e7          	jalr	228(ra) # 8000257c <_Z15thread_dispatchv>
}
    800044a0:	01813083          	ld	ra,24(sp)
    800044a4:	01013403          	ld	s0,16(sp)
    800044a8:	00813483          	ld	s1,8(sp)
    800044ac:	00013903          	ld	s2,0(sp)
    800044b0:	02010113          	addi	sp,sp,32
    800044b4:	00008067          	ret

00000000800044b8 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    800044b8:	fc010113          	addi	sp,sp,-64
    800044bc:	02113c23          	sd	ra,56(sp)
    800044c0:	02813823          	sd	s0,48(sp)
    800044c4:	02913423          	sd	s1,40(sp)
    800044c8:	04010413          	addi	s0,sp,64
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    800044cc:	00000613          	li	a2,0
    800044d0:	fffff597          	auipc	a1,0xfffff
    800044d4:	7e458593          	addi	a1,a1,2020 # 80003cb4 <_Z11workerBodyAPv>
    800044d8:	fc040513          	addi	a0,s0,-64
    800044dc:	ffffe097          	auipc	ra,0xffffe
    800044e0:	fec080e7          	jalr	-20(ra) # 800024c8 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadA created\n");
    800044e4:	00004517          	auipc	a0,0x4
    800044e8:	e0450513          	addi	a0,a0,-508 # 800082e8 <_ZZ14kprintUnsignedmE6digits+0xf8>
    800044ec:	fffff097          	auipc	ra,0xfffff
    800044f0:	74c080e7          	jalr	1868(ra) # 80003c38 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    800044f4:	00000613          	li	a2,0
    800044f8:	00000597          	auipc	a1,0x0
    800044fc:	88858593          	addi	a1,a1,-1912 # 80003d80 <_Z11workerBodyBPv>
    80004500:	fc840513          	addi	a0,s0,-56
    80004504:	ffffe097          	auipc	ra,0xffffe
    80004508:	fc4080e7          	jalr	-60(ra) # 800024c8 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadB created\n");
    8000450c:	00004517          	auipc	a0,0x4
    80004510:	df450513          	addi	a0,a0,-524 # 80008300 <_ZZ14kprintUnsignedmE6digits+0x110>
    80004514:	fffff097          	auipc	ra,0xfffff
    80004518:	724080e7          	jalr	1828(ra) # 80003c38 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    8000451c:	00000613          	li	a2,0
    80004520:	00000597          	auipc	a1,0x0
    80004524:	cd058593          	addi	a1,a1,-816 # 800041f0 <_Z11workerBodyCPv>
    80004528:	fd040513          	addi	a0,s0,-48
    8000452c:	ffffe097          	auipc	ra,0xffffe
    80004530:	f9c080e7          	jalr	-100(ra) # 800024c8 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadC created\n");
    80004534:	00004517          	auipc	a0,0x4
    80004538:	de450513          	addi	a0,a0,-540 # 80008318 <_ZZ14kprintUnsignedmE6digits+0x128>
    8000453c:	fffff097          	auipc	ra,0xfffff
    80004540:	6fc080e7          	jalr	1788(ra) # 80003c38 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80004544:	00000613          	li	a2,0
    80004548:	00000597          	auipc	a1,0x0
    8000454c:	e2858593          	addi	a1,a1,-472 # 80004370 <_Z11workerBodyDPv>
    80004550:	fd840513          	addi	a0,s0,-40
    80004554:	ffffe097          	auipc	ra,0xffffe
    80004558:	f74080e7          	jalr	-140(ra) # 800024c8 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadD created\n");
    8000455c:	00004517          	auipc	a0,0x4
    80004560:	dd450513          	addi	a0,a0,-556 # 80008330 <_ZZ14kprintUnsignedmE6digits+0x140>
    80004564:	fffff097          	auipc	ra,0xfffff
    80004568:	6d4080e7          	jalr	1748(ra) # 80003c38 <_Z11printStringPKc>
    8000456c:	00c0006f          	j	80004578 <_Z18Threads_C_API_testv+0xc0>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80004570:	ffffe097          	auipc	ra,0xffffe
    80004574:	00c080e7          	jalr	12(ra) # 8000257c <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80004578:	00006797          	auipc	a5,0x6
    8000457c:	8ec7c783          	lbu	a5,-1812(a5) # 80009e64 <finishedA>
    80004580:	fe0788e3          	beqz	a5,80004570 <_Z18Threads_C_API_testv+0xb8>
    80004584:	00006797          	auipc	a5,0x6
    80004588:	8e17c783          	lbu	a5,-1823(a5) # 80009e65 <finishedB>
    8000458c:	fe0782e3          	beqz	a5,80004570 <_Z18Threads_C_API_testv+0xb8>
    80004590:	00006797          	auipc	a5,0x6
    80004594:	8da7c783          	lbu	a5,-1830(a5) # 80009e6a <finishedC>
    80004598:	fc078ce3          	beqz	a5,80004570 <_Z18Threads_C_API_testv+0xb8>
    8000459c:	00006797          	auipc	a5,0x6
    800045a0:	8cf7c783          	lbu	a5,-1841(a5) # 80009e6b <finishedD>
    800045a4:	fc0786e3          	beqz	a5,80004570 <_Z18Threads_C_API_testv+0xb8>
    }

    for (auto &thread: threads) { delete thread; }
    800045a8:	fc040493          	addi	s1,s0,-64
    800045ac:	0080006f          	j	800045b4 <_Z18Threads_C_API_testv+0xfc>
    800045b0:	00848493          	addi	s1,s1,8
    800045b4:	fe040793          	addi	a5,s0,-32
    800045b8:	00f48c63          	beq	s1,a5,800045d0 <_Z18Threads_C_API_testv+0x118>
    800045bc:	0004b503          	ld	a0,0(s1)
    800045c0:	fe0508e3          	beqz	a0,800045b0 <_Z18Threads_C_API_testv+0xf8>
    800045c4:	ffffe097          	auipc	ra,0xffffe
    800045c8:	1e4080e7          	jalr	484(ra) # 800027a8 <_ZdlPv>
    800045cc:	fe5ff06f          	j	800045b0 <_Z18Threads_C_API_testv+0xf8>
}
    800045d0:	03813083          	ld	ra,56(sp)
    800045d4:	03013403          	ld	s0,48(sp)
    800045d8:	02813483          	ld	s1,40(sp)
    800045dc:	04010113          	addi	sp,sp,64
    800045e0:	00008067          	ret

00000000800045e4 <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    800045e4:	f7010113          	addi	sp,sp,-144
    800045e8:	08113423          	sd	ra,136(sp)
    800045ec:	08813023          	sd	s0,128(sp)
    800045f0:	06913c23          	sd	s1,120(sp)
    800045f4:	07213823          	sd	s2,112(sp)
    800045f8:	07313423          	sd	s3,104(sp)
    800045fc:	09010413          	addi	s0,sp,144
//    getString(input, 30);
//    n = stringToInt(input);

    n = 20;

    printString("Broj proizvodjaca "); printInt(threadNum);
    80004600:	00004517          	auipc	a0,0x4
    80004604:	d4850513          	addi	a0,a0,-696 # 80008348 <_ZZ14kprintUnsignedmE6digits+0x158>
    80004608:	fffff097          	auipc	ra,0xfffff
    8000460c:	630080e7          	jalr	1584(ra) # 80003c38 <_Z11printStringPKc>
    80004610:	00000613          	li	a2,0
    80004614:	00a00593          	li	a1,10
    80004618:	00a00513          	li	a0,10
    8000461c:	fffff097          	auipc	ra,0xfffff
    80004620:	2fc080e7          	jalr	764(ra) # 80003918 <_ZL8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80004624:	00004517          	auipc	a0,0x4
    80004628:	d3c50513          	addi	a0,a0,-708 # 80008360 <_ZZ14kprintUnsignedmE6digits+0x170>
    8000462c:	fffff097          	auipc	ra,0xfffff
    80004630:	60c080e7          	jalr	1548(ra) # 80003c38 <_Z11printStringPKc>
    80004634:	00000613          	li	a2,0
    80004638:	00a00593          	li	a1,10
    8000463c:	01400513          	li	a0,20
    80004640:	fffff097          	auipc	ra,0xfffff
    80004644:	2d8080e7          	jalr	728(ra) # 80003918 <_ZL8printIntiii>
    printString(".\n");
    80004648:	00004517          	auipc	a0,0x4
    8000464c:	d3050513          	addi	a0,a0,-720 # 80008378 <_ZZ14kprintUnsignedmE6digits+0x188>
    80004650:	fffff097          	auipc	ra,0xfffff
    80004654:	5e8080e7          	jalr	1512(ra) # 80003c38 <_Z11printStringPKc>

    Buffer *buffer = new Buffer(n);
    80004658:	03800513          	li	a0,56
    8000465c:	ffffe097          	auipc	ra,0xffffe
    80004660:	0fc080e7          	jalr	252(ra) # 80002758 <_Znwm>
    80004664:	00050993          	mv	s3,a0
    80004668:	01400593          	li	a1,20
    8000466c:	fffff097          	auipc	ra,0xfffff
    80004670:	05c080e7          	jalr	92(ra) # 800036c8 <_ZN6BufferC1Ei>

    sem_open(&waitForAll, 0);
    80004674:	00000593          	li	a1,0
    80004678:	00005517          	auipc	a0,0x5
    8000467c:	7f850513          	addi	a0,a0,2040 # 80009e70 <waitForAll>
    80004680:	ffffe097          	auipc	ra,0xffffe
    80004684:	f2c080e7          	jalr	-212(ra) # 800025ac <_Z8sem_openPP4_semj>

    thread_t threads[threadNum];
    thread_t consumerThread;

    struct thread_data data[threadNum + 1];
    80004688:	ef010113          	addi	sp,sp,-272
    8000468c:	00010913          	mv	s2,sp

    data[threadNum].id = threadNum;
    80004690:	00a00793          	li	a5,10
    80004694:	0ef92823          	sw	a5,240(s2)
    data[threadNum].buffer = buffer;
    80004698:	0f393c23          	sd	s3,248(s2)
    data[threadNum].wait = waitForAll;
    8000469c:	00005797          	auipc	a5,0x5
    800046a0:	7d47b783          	ld	a5,2004(a5) # 80009e70 <waitForAll>
    800046a4:	10f93023          	sd	a5,256(s2)
    thread_create(&consumerThread, consumer, data + threadNum);
    800046a8:	0f090613          	addi	a2,s2,240
    800046ac:	fffff597          	auipc	a1,0xfffff
    800046b0:	4d458593          	addi	a1,a1,1236 # 80003b80 <_Z8consumerPv>
    800046b4:	fc840513          	addi	a0,s0,-56
    800046b8:	ffffe097          	auipc	ra,0xffffe
    800046bc:	e10080e7          	jalr	-496(ra) # 800024c8 <_Z13thread_createPP7_threadPFvPvES2_>

    for (int i = 0; i < threadNum; i++) {
    800046c0:	00000493          	li	s1,0
    800046c4:	00900793          	li	a5,9
    800046c8:	0697c863          	blt	a5,s1,80004738 <_Z22producerConsumer_C_APIv+0x154>
        data[i].id = i;
    800046cc:	00149793          	slli	a5,s1,0x1
    800046d0:	009787b3          	add	a5,a5,s1
    800046d4:	00379793          	slli	a5,a5,0x3
    800046d8:	00f907b3          	add	a5,s2,a5
    800046dc:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    800046e0:	0137b423          	sd	s3,8(a5)
        data[i].wait = waitForAll;
    800046e4:	00005717          	auipc	a4,0x5
    800046e8:	78c73703          	ld	a4,1932(a4) # 80009e70 <waitForAll>
    800046ec:	00e7b823          	sd	a4,16(a5)

        thread_create(threads + i,
    800046f0:	00048713          	mv	a4,s1
    800046f4:	00349513          	slli	a0,s1,0x3
    800046f8:	f7840793          	addi	a5,s0,-136
    800046fc:	00a78533          	add	a0,a5,a0
    80004700:	02905663          	blez	s1,8000472c <_Z22producerConsumer_C_APIv+0x148>
    80004704:	fffff597          	auipc	a1,0xfffff
    80004708:	3e858593          	addi	a1,a1,1000 # 80003aec <_Z8producerPv>
                      i > 0 ? producer : producerKeyboard,
                      data + i);
    8000470c:	00171613          	slli	a2,a4,0x1
    80004710:	00e60633          	add	a2,a2,a4
    80004714:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    80004718:	00c90633          	add	a2,s2,a2
    8000471c:	ffffe097          	auipc	ra,0xffffe
    80004720:	dac080e7          	jalr	-596(ra) # 800024c8 <_Z13thread_createPP7_threadPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80004724:	0014849b          	addiw	s1,s1,1
    80004728:	f9dff06f          	j	800046c4 <_Z22producerConsumer_C_APIv+0xe0>
        thread_create(threads + i,
    8000472c:	fffff597          	auipc	a1,0xfffff
    80004730:	30058593          	addi	a1,a1,768 # 80003a2c <_Z16producerKeyboardPv>
    80004734:	fd9ff06f          	j	8000470c <_Z22producerConsumer_C_APIv+0x128>
    }

    thread_dispatch();
    80004738:	ffffe097          	auipc	ra,0xffffe
    8000473c:	e44080e7          	jalr	-444(ra) # 8000257c <_Z15thread_dispatchv>

    for (int i = 0; i <= threadNum; i++) {
    80004740:	00000493          	li	s1,0
    80004744:	0180006f          	j	8000475c <_Z22producerConsumer_C_APIv+0x178>
        sem_wait(waitForAll);
    80004748:	00005517          	auipc	a0,0x5
    8000474c:	72853503          	ld	a0,1832(a0) # 80009e70 <waitForAll>
    80004750:	ffffe097          	auipc	ra,0xffffe
    80004754:	f08080e7          	jalr	-248(ra) # 80002658 <_Z8sem_waitP4_sem>
    for (int i = 0; i <= threadNum; i++) {
    80004758:	0014849b          	addiw	s1,s1,1
    8000475c:	00a00793          	li	a5,10
    80004760:	fe97d4e3          	bge	a5,s1,80004748 <_Z22producerConsumer_C_APIv+0x164>
    }

    sem_close(waitForAll);
    80004764:	00005517          	auipc	a0,0x5
    80004768:	70c53503          	ld	a0,1804(a0) # 80009e70 <waitForAll>
    8000476c:	ffffe097          	auipc	ra,0xffffe
    80004770:	eb8080e7          	jalr	-328(ra) # 80002624 <_Z9sem_closeP4_sem>
}
    80004774:	f7040113          	addi	sp,s0,-144
    80004778:	08813083          	ld	ra,136(sp)
    8000477c:	08013403          	ld	s0,128(sp)
    80004780:	07813483          	ld	s1,120(sp)
    80004784:	07013903          	ld	s2,112(sp)
    80004788:	06813983          	ld	s3,104(sp)
    8000478c:	09010113          	addi	sp,sp,144
    80004790:	00008067          	ret
    80004794:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    80004798:	00098513          	mv	a0,s3
    8000479c:	ffffe097          	auipc	ra,0xffffe
    800047a0:	00c080e7          	jalr	12(ra) # 800027a8 <_ZdlPv>
    800047a4:	00048513          	mv	a0,s1
    800047a8:	00006097          	auipc	ra,0x6
    800047ac:	7a0080e7          	jalr	1952(ra) # 8000af48 <_Unwind_Resume>

00000000800047b0 <_Z12testSleepingv>:

void testSleeping() {
    800047b0:	fc010113          	addi	sp,sp,-64
    800047b4:	02113c23          	sd	ra,56(sp)
    800047b8:	02813823          	sd	s0,48(sp)
    800047bc:	02913423          	sd	s1,40(sp)
    800047c0:	04010413          	addi	s0,sp,64
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    800047c4:	00a00793          	li	a5,10
    800047c8:	fcf43823          	sd	a5,-48(s0)
    800047cc:	01400793          	li	a5,20
    800047d0:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    for (int i = 0; i < sleepy_thread_count; i++) {
    800047d4:	00000493          	li	s1,0
    800047d8:	02c0006f          	j	80004804 <_Z12testSleepingv+0x54>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    800047dc:	00349793          	slli	a5,s1,0x3
    800047e0:	fd040613          	addi	a2,s0,-48
    800047e4:	00f60633          	add	a2,a2,a5
    800047e8:	fffff597          	auipc	a1,0xfffff
    800047ec:	66c58593          	addi	a1,a1,1644 # 80003e54 <_Z9sleepyRunPv>
    800047f0:	fc040513          	addi	a0,s0,-64
    800047f4:	00f50533          	add	a0,a0,a5
    800047f8:	ffffe097          	auipc	ra,0xffffe
    800047fc:	cd0080e7          	jalr	-816(ra) # 800024c8 <_Z13thread_createPP7_threadPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    80004800:	0014849b          	addiw	s1,s1,1
    80004804:	00100793          	li	a5,1
    80004808:	fc97dae3          	bge	a5,s1,800047dc <_Z12testSleepingv+0x2c>
    }

    while (!(finished[0] && finished[1])) {}
    8000480c:	00005797          	auipc	a5,0x5
    80004810:	65c7c783          	lbu	a5,1628(a5) # 80009e68 <finished>
    80004814:	fe078ce3          	beqz	a5,8000480c <_Z12testSleepingv+0x5c>
    80004818:	00005797          	auipc	a5,0x5
    8000481c:	6517c783          	lbu	a5,1617(a5) # 80009e69 <finished+0x1>
    80004820:	fe0786e3          	beqz	a5,8000480c <_Z12testSleepingv+0x5c>
}
    80004824:	03813083          	ld	ra,56(sp)
    80004828:	03013403          	ld	s0,48(sp)
    8000482c:	02813483          	ld	s1,40(sp)
    80004830:	04010113          	addi	sp,sp,64
    80004834:	00008067          	ret

0000000080004838 <_Z3fibm>:
uint64 fib(uint64 n) {
    80004838:	fe010113          	addi	sp,sp,-32
    8000483c:	00113c23          	sd	ra,24(sp)
    80004840:	00813823          	sd	s0,16(sp)
    80004844:	00913423          	sd	s1,8(sp)
    80004848:	01213023          	sd	s2,0(sp)
    8000484c:	02010413          	addi	s0,sp,32
    80004850:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) return n;
    80004854:	00100793          	li	a5,1
    80004858:	02a7f663          	bgeu	a5,a0,80004884 <_Z3fibm+0x4c>
    if (n % 4 == 0) {
    8000485c:	00357793          	andi	a5,a0,3
    80004860:	02078e63          	beqz	a5,8000489c <_Z3fibm+0x64>
    return fibonacci(n-1) + fibonacci(n-2);
    80004864:	fff48513          	addi	a0,s1,-1
    80004868:	00000097          	auipc	ra,0x0
    8000486c:	914080e7          	jalr	-1772(ra) # 8000417c <_Z9fibonaccim>
    80004870:	00050913          	mv	s2,a0
    80004874:	ffe48513          	addi	a0,s1,-2
    80004878:	00000097          	auipc	ra,0x0
    8000487c:	904080e7          	jalr	-1788(ra) # 8000417c <_Z9fibonaccim>
    80004880:	00a90533          	add	a0,s2,a0
}
    80004884:	01813083          	ld	ra,24(sp)
    80004888:	01013403          	ld	s0,16(sp)
    8000488c:	00813483          	ld	s1,8(sp)
    80004890:	00013903          	ld	s2,0(sp)
    80004894:	02010113          	addi	sp,sp,32
    80004898:	00008067          	ret
        thread_dispatch();
    8000489c:	ffffe097          	auipc	ra,0xffffe
    800048a0:	ce0080e7          	jalr	-800(ra) # 8000257c <_Z15thread_dispatchv>
    800048a4:	fc1ff06f          	j	80004864 <_Z3fibm+0x2c>

00000000800048a8 <_Z11workerBodyGPv>:

void workerBodyG(void *) {
    800048a8:	fe010113          	addi	sp,sp,-32
    800048ac:	00113c23          	sd	ra,24(sp)
    800048b0:	00813823          	sd	s0,16(sp)
    800048b4:	00913423          	sd	s1,8(sp)
    800048b8:	01213023          	sd	s2,0(sp)
    800048bc:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800048c0:	00000493          	li	s1,0
    800048c4:	0400006f          	j	80004904 <_Z11workerBodyGPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i=");
    800048c8:	00004517          	auipc	a0,0x4
    800048cc:	9a850513          	addi	a0,a0,-1624 # 80008270 <_ZZ14kprintUnsignedmE6digits+0x80>
    800048d0:	fffff097          	auipc	ra,0xfffff
    800048d4:	368080e7          	jalr	872(ra) # 80003c38 <_Z11printStringPKc>
        printInt(i);
    800048d8:	00000613          	li	a2,0
    800048dc:	00a00593          	li	a1,10
    800048e0:	00048513          	mv	a0,s1
    800048e4:	fffff097          	auipc	ra,0xfffff
    800048e8:	034080e7          	jalr	52(ra) # 80003918 <_ZL8printIntiii>
        printString("\n");
    800048ec:	00004517          	auipc	a0,0x4
    800048f0:	89c50513          	addi	a0,a0,-1892 # 80008188 <CONSOLE_STATUS+0x178>
    800048f4:	fffff097          	auipc	ra,0xfffff
    800048f8:	344080e7          	jalr	836(ra) # 80003c38 <_Z11printStringPKc>
    for (; i < 3; i++) {
    800048fc:	0014849b          	addiw	s1,s1,1
    80004900:	0ff4f493          	andi	s1,s1,255
    80004904:	00200793          	li	a5,2
    80004908:	fc97f0e3          	bgeu	a5,s1,800048c8 <_Z11workerBodyGPv+0x20>
    }

    printString("C: yield\n");
    8000490c:	00004517          	auipc	a0,0x4
    80004910:	a7450513          	addi	a0,a0,-1420 # 80008380 <_ZZ14kprintUnsignedmE6digits+0x190>
    80004914:	fffff097          	auipc	ra,0xfffff
    80004918:	324080e7          	jalr	804(ra) # 80003c38 <_Z11printStringPKc>
    __asm__("li t1, 7");
    8000491c:	00700313          	li	t1,7
    thread_dispatch();
    80004920:	ffffe097          	auipc	ra,0xffffe
    80004924:	c5c080e7          	jalr	-932(ra) # 8000257c <_Z15thread_dispatchv>

    uint64  t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80004928:	00030913          	mv	s2,t1

    printString("C: t1=");
    8000492c:	00004517          	auipc	a0,0x4
    80004930:	95c50513          	addi	a0,a0,-1700 # 80008288 <_ZZ14kprintUnsignedmE6digits+0x98>
    80004934:	fffff097          	auipc	ra,0xfffff
    80004938:	304080e7          	jalr	772(ra) # 80003c38 <_Z11printStringPKc>
    printInt(t1);
    8000493c:	00000613          	li	a2,0
    80004940:	00a00593          	li	a1,10
    80004944:	0009051b          	sext.w	a0,s2
    80004948:	fffff097          	auipc	ra,0xfffff
    8000494c:	fd0080e7          	jalr	-48(ra) # 80003918 <_ZL8printIntiii>
    printString("\n");
    80004950:	00004517          	auipc	a0,0x4
    80004954:	83850513          	addi	a0,a0,-1992 # 80008188 <CONSOLE_STATUS+0x178>
    80004958:	fffff097          	auipc	ra,0xfffff
    8000495c:	2e0080e7          	jalr	736(ra) # 80003c38 <_Z11printStringPKc>

    uint64 result = fib(30);
    80004960:	01e00513          	li	a0,30
    80004964:	00000097          	auipc	ra,0x0
    80004968:	ed4080e7          	jalr	-300(ra) # 80004838 <_Z3fibm>
    8000496c:	00050913          	mv	s2,a0
    printString("C: fibonacci=");
    80004970:	00004517          	auipc	a0,0x4
    80004974:	a2050513          	addi	a0,a0,-1504 # 80008390 <_ZZ14kprintUnsignedmE6digits+0x1a0>
    80004978:	fffff097          	auipc	ra,0xfffff
    8000497c:	2c0080e7          	jalr	704(ra) # 80003c38 <_Z11printStringPKc>
    printInt(result);
    80004980:	00000613          	li	a2,0
    80004984:	00a00593          	li	a1,10
    80004988:	0009051b          	sext.w	a0,s2
    8000498c:	fffff097          	auipc	ra,0xfffff
    80004990:	f8c080e7          	jalr	-116(ra) # 80003918 <_ZL8printIntiii>
    printString("\n");
    80004994:	00003517          	auipc	a0,0x3
    80004998:	7f450513          	addi	a0,a0,2036 # 80008188 <CONSOLE_STATUS+0x178>
    8000499c:	fffff097          	auipc	ra,0xfffff
    800049a0:	29c080e7          	jalr	668(ra) # 80003c38 <_Z11printStringPKc>
    800049a4:	0400006f          	j	800049e4 <_Z11workerBodyGPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i=");
    800049a8:	00004517          	auipc	a0,0x4
    800049ac:	8c850513          	addi	a0,a0,-1848 # 80008270 <_ZZ14kprintUnsignedmE6digits+0x80>
    800049b0:	fffff097          	auipc	ra,0xfffff
    800049b4:	288080e7          	jalr	648(ra) # 80003c38 <_Z11printStringPKc>
        printInt(i);
    800049b8:	00000613          	li	a2,0
    800049bc:	00a00593          	li	a1,10
    800049c0:	00048513          	mv	a0,s1
    800049c4:	fffff097          	auipc	ra,0xfffff
    800049c8:	f54080e7          	jalr	-172(ra) # 80003918 <_ZL8printIntiii>
        printString("\n");
    800049cc:	00003517          	auipc	a0,0x3
    800049d0:	7bc50513          	addi	a0,a0,1980 # 80008188 <CONSOLE_STATUS+0x178>
    800049d4:	fffff097          	auipc	ra,0xfffff
    800049d8:	264080e7          	jalr	612(ra) # 80003c38 <_Z11printStringPKc>
    for (; i < 6; i++) {
    800049dc:	0014849b          	addiw	s1,s1,1
    800049e0:	0ff4f493          	andi	s1,s1,255
    800049e4:	00500793          	li	a5,5
    800049e8:	fc97f0e3          	bgeu	a5,s1,800049a8 <_Z11workerBodyGPv+0x100>
    }
    // TCB::yield()
    printString("Worker C finished\n");
    800049ec:	00004517          	auipc	a0,0x4
    800049f0:	9b450513          	addi	a0,a0,-1612 # 800083a0 <_ZZ14kprintUnsignedmE6digits+0x1b0>
    800049f4:	fffff097          	auipc	ra,0xfffff
    800049f8:	244080e7          	jalr	580(ra) # 80003c38 <_Z11printStringPKc>
}
    800049fc:	01813083          	ld	ra,24(sp)
    80004a00:	01013403          	ld	s0,16(sp)
    80004a04:	00813483          	ld	s1,8(sp)
    80004a08:	00013903          	ld	s2,0(sp)
    80004a0c:	02010113          	addi	sp,sp,32
    80004a10:	00008067          	ret

0000000080004a14 <_Z11workerBodyHPv>:

void workerBodyH(void *) {
    80004a14:	fe010113          	addi	sp,sp,-32
    80004a18:	00113c23          	sd	ra,24(sp)
    80004a1c:	00813823          	sd	s0,16(sp)
    80004a20:	00913423          	sd	s1,8(sp)
    80004a24:	01213023          	sd	s2,0(sp)
    80004a28:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80004a2c:	00a00493          	li	s1,10
    80004a30:	0400006f          	j	80004a70 <_Z11workerBodyHPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i=");
    80004a34:	00004517          	auipc	a0,0x4
    80004a38:	87c50513          	addi	a0,a0,-1924 # 800082b0 <_ZZ14kprintUnsignedmE6digits+0xc0>
    80004a3c:	fffff097          	auipc	ra,0xfffff
    80004a40:	1fc080e7          	jalr	508(ra) # 80003c38 <_Z11printStringPKc>
        printInt(i);
    80004a44:	00000613          	li	a2,0
    80004a48:	00a00593          	li	a1,10
    80004a4c:	00048513          	mv	a0,s1
    80004a50:	fffff097          	auipc	ra,0xfffff
    80004a54:	ec8080e7          	jalr	-312(ra) # 80003918 <_ZL8printIntiii>
        printString("\n");
    80004a58:	00003517          	auipc	a0,0x3
    80004a5c:	73050513          	addi	a0,a0,1840 # 80008188 <CONSOLE_STATUS+0x178>
    80004a60:	fffff097          	auipc	ra,0xfffff
    80004a64:	1d8080e7          	jalr	472(ra) # 80003c38 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80004a68:	0014849b          	addiw	s1,s1,1
    80004a6c:	0ff4f493          	andi	s1,s1,255
    80004a70:	00c00793          	li	a5,12
    80004a74:	fc97f0e3          	bgeu	a5,s1,80004a34 <_Z11workerBodyHPv+0x20>
    }

    printString("D: yield\n");
    80004a78:	00004517          	auipc	a0,0x4
    80004a7c:	94050513          	addi	a0,a0,-1728 # 800083b8 <_ZZ14kprintUnsignedmE6digits+0x1c8>
    80004a80:	fffff097          	auipc	ra,0xfffff
    80004a84:	1b8080e7          	jalr	440(ra) # 80003c38 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80004a88:	00500313          	li	t1,5
    thread_dispatch();
    80004a8c:	ffffe097          	auipc	ra,0xffffe
    80004a90:	af0080e7          	jalr	-1296(ra) # 8000257c <_Z15thread_dispatchv>

    uint64 result = fib(23);
    80004a94:	01700513          	li	a0,23
    80004a98:	00000097          	auipc	ra,0x0
    80004a9c:	da0080e7          	jalr	-608(ra) # 80004838 <_Z3fibm>
    80004aa0:	00050913          	mv	s2,a0
    printString("D: fibonacci=");
    80004aa4:	00004517          	auipc	a0,0x4
    80004aa8:	92450513          	addi	a0,a0,-1756 # 800083c8 <_ZZ14kprintUnsignedmE6digits+0x1d8>
    80004aac:	fffff097          	auipc	ra,0xfffff
    80004ab0:	18c080e7          	jalr	396(ra) # 80003c38 <_Z11printStringPKc>
    printInt(result);
    80004ab4:	00000613          	li	a2,0
    80004ab8:	00a00593          	li	a1,10
    80004abc:	0009051b          	sext.w	a0,s2
    80004ac0:	fffff097          	auipc	ra,0xfffff
    80004ac4:	e58080e7          	jalr	-424(ra) # 80003918 <_ZL8printIntiii>
    printString("\n");
    80004ac8:	00003517          	auipc	a0,0x3
    80004acc:	6c050513          	addi	a0,a0,1728 # 80008188 <CONSOLE_STATUS+0x178>
    80004ad0:	fffff097          	auipc	ra,0xfffff
    80004ad4:	168080e7          	jalr	360(ra) # 80003c38 <_Z11printStringPKc>
    80004ad8:	0400006f          	j	80004b18 <_Z11workerBodyHPv+0x104>

    for (; i < 16; i++) {
        printString("D: i=");
    80004adc:	00003517          	auipc	a0,0x3
    80004ae0:	7d450513          	addi	a0,a0,2004 # 800082b0 <_ZZ14kprintUnsignedmE6digits+0xc0>
    80004ae4:	fffff097          	auipc	ra,0xfffff
    80004ae8:	154080e7          	jalr	340(ra) # 80003c38 <_Z11printStringPKc>
        printInt(i);
    80004aec:	00000613          	li	a2,0
    80004af0:	00a00593          	li	a1,10
    80004af4:	00048513          	mv	a0,s1
    80004af8:	fffff097          	auipc	ra,0xfffff
    80004afc:	e20080e7          	jalr	-480(ra) # 80003918 <_ZL8printIntiii>
        printString("\n");
    80004b00:	00003517          	auipc	a0,0x3
    80004b04:	68850513          	addi	a0,a0,1672 # 80008188 <CONSOLE_STATUS+0x178>
    80004b08:	fffff097          	auipc	ra,0xfffff
    80004b0c:	130080e7          	jalr	304(ra) # 80003c38 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80004b10:	0014849b          	addiw	s1,s1,1
    80004b14:	0ff4f493          	andi	s1,s1,255
    80004b18:	00f00793          	li	a5,15
    80004b1c:	fc97f0e3          	bgeu	a5,s1,80004adc <_Z11workerBodyHPv+0xc8>
    }
    // TCB::yield()
    printString("Worker D finished\n");
    80004b20:	00004517          	auipc	a0,0x4
    80004b24:	8b850513          	addi	a0,a0,-1864 # 800083d8 <_ZZ14kprintUnsignedmE6digits+0x1e8>
    80004b28:	fffff097          	auipc	ra,0xfffff
    80004b2c:	110080e7          	jalr	272(ra) # 80003c38 <_Z11printStringPKc>
}
    80004b30:	01813083          	ld	ra,24(sp)
    80004b34:	01013403          	ld	s0,16(sp)
    80004b38:	00813483          	ld	s1,8(sp)
    80004b3c:	00013903          	ld	s2,0(sp)
    80004b40:	02010113          	addi	sp,sp,32
    80004b44:	00008067          	ret

0000000080004b48 <_Z10myUserMainv>:
#include "Workers.h"
#include "../h/syscall_c.h"
#include "ProducerConsumer.h"
#include "printing.hpp"

void myUserMain() {
    80004b48:	fa010113          	addi	sp,sp,-96
    80004b4c:	04113c23          	sd	ra,88(sp)
    80004b50:	04813823          	sd	s0,80(sp)
    80004b54:	04913423          	sd	s1,72(sp)
    80004b58:	05213023          	sd	s2,64(sp)
    80004b5c:	06010413          	addi	s0,sp,96
    printString("In user main\n");
    80004b60:	00004517          	auipc	a0,0x4
    80004b64:	89050513          	addi	a0,a0,-1904 # 800083f0 <_ZZ14kprintUnsignedmE6digits+0x200>
    80004b68:	fffff097          	auipc	ra,0xfffff
    80004b6c:	0d0080e7          	jalr	208(ra) # 80003c38 <_Z11printStringPKc>

    void *mem = mem_alloc(25000);
    80004b70:	00006537          	lui	a0,0x6
    80004b74:	1a850513          	addi	a0,a0,424 # 61a8 <_entry-0x7fff9e58>
    80004b78:	ffffe097          	auipc	ra,0xffffe
    80004b7c:	8e8080e7          	jalr	-1816(ra) # 80002460 <_Z9mem_allocm>
    80004b80:	00050913          	mv	s2,a0
    printInt((uint64) mem);
    80004b84:	00000613          	li	a2,0
    80004b88:	00a00593          	li	a1,10
    80004b8c:	0005051b          	sext.w	a0,a0
    80004b90:	fffff097          	auipc	ra,0xfffff
    80004b94:	d88080e7          	jalr	-632(ra) # 80003918 <_ZL8printIntiii>
    printString("\n");
    80004b98:	00003517          	auipc	a0,0x3
    80004b9c:	5f050513          	addi	a0,a0,1520 # 80008188 <CONSOLE_STATUS+0x178>
    80004ba0:	fffff097          	auipc	ra,0xfffff
    80004ba4:	098080e7          	jalr	152(ra) # 80003c38 <_Z11printStringPKc>

    ProducerConsumer *obj = new ProducerConsumer();
    80004ba8:	01800513          	li	a0,24
    80004bac:	ffffe097          	auipc	ra,0xffffe
    80004bb0:	bac080e7          	jalr	-1108(ra) # 80002758 <_Znwm>
    80004bb4:	00050493          	mv	s1,a0
#include "../h/syscall_c.h"
#include "printing.hpp"

class ProducerConsumer {
public:
    ProducerConsumer() {
    80004bb8:	00052823          	sw	zero,16(a0)
        sem_open(&semConsumer, 0);
    80004bbc:	00000593          	li	a1,0
    80004bc0:	00850513          	addi	a0,a0,8
    80004bc4:	ffffe097          	auipc	ra,0xffffe
    80004bc8:	9e8080e7          	jalr	-1560(ra) # 800025ac <_Z8sem_openPP4_semj>
        sem_open(&semProducer, 1);
    80004bcc:	00100593          	li	a1,1
    80004bd0:	00048513          	mv	a0,s1
    80004bd4:	ffffe097          	auipc	ra,0xffffe
    80004bd8:	9d8080e7          	jalr	-1576(ra) # 800025ac <_Z8sem_openPP4_semj>
    thread_t t5;
    thread_t t6;
    thread_t t7;
    thread_t t8;

    thread_create(&t1, &workerBodyE, nullptr);
    80004bdc:	00000613          	li	a2,0
    80004be0:	fffff597          	auipc	a1,0xfffff
    80004be4:	31858593          	addi	a1,a1,792 # 80003ef8 <_Z11workerBodyEPv>
    80004be8:	fd840513          	addi	a0,s0,-40
    80004bec:	ffffe097          	auipc	ra,0xffffe
    80004bf0:	8dc080e7          	jalr	-1828(ra) # 800024c8 <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t2, &workerBodyF, nullptr);
    80004bf4:	00000613          	li	a2,0
    80004bf8:	fffff597          	auipc	a1,0xfffff
    80004bfc:	3b058593          	addi	a1,a1,944 # 80003fa8 <_Z11workerBodyFPv>
    80004c00:	fd040513          	addi	a0,s0,-48
    80004c04:	ffffe097          	auipc	ra,0xffffe
    80004c08:	8c4080e7          	jalr	-1852(ra) # 800024c8 <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t3, &workerBodyG, nullptr);
    80004c0c:	00000613          	li	a2,0
    80004c10:	00000597          	auipc	a1,0x0
    80004c14:	c9858593          	addi	a1,a1,-872 # 800048a8 <_Z11workerBodyGPv>
    80004c18:	fc840513          	addi	a0,s0,-56
    80004c1c:	ffffe097          	auipc	ra,0xffffe
    80004c20:	8ac080e7          	jalr	-1876(ra) # 800024c8 <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t4, &workerBodyH, nullptr);
    80004c24:	00000613          	li	a2,0
    80004c28:	00000597          	auipc	a1,0x0
    80004c2c:	dec58593          	addi	a1,a1,-532 # 80004a14 <_Z11workerBodyHPv>
    80004c30:	fc040513          	addi	a0,s0,-64
    80004c34:	ffffe097          	auipc	ra,0xffffe
    80004c38:	894080e7          	jalr	-1900(ra) # 800024c8 <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t5, &ProducerConsumer::produceWrapper, obj);
    80004c3c:	00048613          	mv	a2,s1
    80004c40:	00000597          	auipc	a1,0x0
    80004c44:	1ac58593          	addi	a1,a1,428 # 80004dec <_ZN16ProducerConsumer14produceWrapperEPv>
    80004c48:	fb840513          	addi	a0,s0,-72
    80004c4c:	ffffe097          	auipc	ra,0xffffe
    80004c50:	87c080e7          	jalr	-1924(ra) # 800024c8 <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t6, &ProducerConsumer::consumeWrapper, obj);
    80004c54:	00048613          	mv	a2,s1
    80004c58:	00000597          	auipc	a1,0x0
    80004c5c:	27858593          	addi	a1,a1,632 # 80004ed0 <_ZN16ProducerConsumer14consumeWrapperEPv>
    80004c60:	fb040513          	addi	a0,s0,-80
    80004c64:	ffffe097          	auipc	ra,0xffffe
    80004c68:	864080e7          	jalr	-1948(ra) # 800024c8 <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t7, &ProducerConsumer::consumeWrapper, obj);
    80004c6c:	00048613          	mv	a2,s1
    80004c70:	00000597          	auipc	a1,0x0
    80004c74:	26058593          	addi	a1,a1,608 # 80004ed0 <_ZN16ProducerConsumer14consumeWrapperEPv>
    80004c78:	fa840513          	addi	a0,s0,-88
    80004c7c:	ffffe097          	auipc	ra,0xffffe
    80004c80:	84c080e7          	jalr	-1972(ra) # 800024c8 <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t8, &ProducerConsumer::consumeWrapper, obj);
    80004c84:	00048613          	mv	a2,s1
    80004c88:	00000597          	auipc	a1,0x0
    80004c8c:	24858593          	addi	a1,a1,584 # 80004ed0 <_ZN16ProducerConsumer14consumeWrapperEPv>
    80004c90:	fa040513          	addi	a0,s0,-96
    80004c94:	ffffe097          	auipc	ra,0xffffe
    80004c98:	834080e7          	jalr	-1996(ra) # 800024c8 <_Z13thread_createPP7_threadPFvPvES2_>

    time_sleep(50);
    80004c9c:	03200513          	li	a0,50
    80004ca0:	ffffe097          	auipc	ra,0xffffe
    80004ca4:	a20080e7          	jalr	-1504(ra) # 800026c0 <_Z10time_sleepm>

    printString("Nit t2: ");
    80004ca8:	00003517          	auipc	a0,0x3
    80004cac:	75850513          	addi	a0,a0,1880 # 80008400 <_ZZ14kprintUnsignedmE6digits+0x210>
    80004cb0:	fffff097          	auipc	ra,0xfffff
    80004cb4:	f88080e7          	jalr	-120(ra) # 80003c38 <_Z11printStringPKc>
    printInt((uint64) t2);
    80004cb8:	00000613          	li	a2,0
    80004cbc:	00a00593          	li	a1,10
    80004cc0:	fd042503          	lw	a0,-48(s0)
    80004cc4:	fffff097          	auipc	ra,0xfffff
    80004cc8:	c54080e7          	jalr	-940(ra) # 80003918 <_ZL8printIntiii>
    printString("\n");
    80004ccc:	00003517          	auipc	a0,0x3
    80004cd0:	4bc50513          	addi	a0,a0,1212 # 80008188 <CONSOLE_STATUS+0x178>
    80004cd4:	fffff097          	auipc	ra,0xfffff
    80004cd8:	f64080e7          	jalr	-156(ra) # 80003c38 <_Z11printStringPKc>

    time_sleep(150);
    80004cdc:	09600513          	li	a0,150
    80004ce0:	ffffe097          	auipc	ra,0xffffe
    80004ce4:	9e0080e7          	jalr	-1568(ra) # 800026c0 <_Z10time_sleepm>

    printString("Mem free called with ret value ");
    80004ce8:	00003517          	auipc	a0,0x3
    80004cec:	72850513          	addi	a0,a0,1832 # 80008410 <_ZZ14kprintUnsignedmE6digits+0x220>
    80004cf0:	fffff097          	auipc	ra,0xfffff
    80004cf4:	f48080e7          	jalr	-184(ra) # 80003c38 <_Z11printStringPKc>
    printInt(mem_free(mem));
    80004cf8:	00090513          	mv	a0,s2
    80004cfc:	ffffd097          	auipc	ra,0xffffd
    80004d00:	798080e7          	jalr	1944(ra) # 80002494 <_Z8mem_freePv>
    80004d04:	00000613          	li	a2,0
    80004d08:	00a00593          	li	a1,10
    80004d0c:	fffff097          	auipc	ra,0xfffff
    80004d10:	c0c080e7          	jalr	-1012(ra) # 80003918 <_ZL8printIntiii>
    printString("\n");
    80004d14:	00003517          	auipc	a0,0x3
    80004d18:	47450513          	addi	a0,a0,1140 # 80008188 <CONSOLE_STATUS+0x178>
    80004d1c:	fffff097          	auipc	ra,0xfffff
    80004d20:	f1c080e7          	jalr	-228(ra) # 80003c38 <_Z11printStringPKc>

    printString("Mem free called again with ret value ");
    80004d24:	00003517          	auipc	a0,0x3
    80004d28:	70c50513          	addi	a0,a0,1804 # 80008430 <_ZZ14kprintUnsignedmE6digits+0x240>
    80004d2c:	fffff097          	auipc	ra,0xfffff
    80004d30:	f0c080e7          	jalr	-244(ra) # 80003c38 <_Z11printStringPKc>
    printInt(mem_free(mem));
    80004d34:	00090513          	mv	a0,s2
    80004d38:	ffffd097          	auipc	ra,0xffffd
    80004d3c:	75c080e7          	jalr	1884(ra) # 80002494 <_Z8mem_freePv>
    80004d40:	00000613          	li	a2,0
    80004d44:	00a00593          	li	a1,10
    80004d48:	fffff097          	auipc	ra,0xfffff
    80004d4c:	bd0080e7          	jalr	-1072(ra) # 80003918 <_ZL8printIntiii>
    printString("\n");
    80004d50:	00003517          	auipc	a0,0x3
    80004d54:	43850513          	addi	a0,a0,1080 # 80008188 <CONSOLE_STATUS+0x178>
    80004d58:	fffff097          	auipc	ra,0xfffff
    80004d5c:	ee0080e7          	jalr	-288(ra) # 80003c38 <_Z11printStringPKc>

    delete obj;
    80004d60:	00048863          	beqz	s1,80004d70 <_Z10myUserMainv+0x228>
    80004d64:	00048513          	mv	a0,s1
    80004d68:	ffffe097          	auipc	ra,0xffffe
    80004d6c:	a40080e7          	jalr	-1472(ra) # 800027a8 <_ZdlPv>

    printString("User main finished\n");
    80004d70:	00003517          	auipc	a0,0x3
    80004d74:	6e850513          	addi	a0,a0,1768 # 80008458 <_ZZ14kprintUnsignedmE6digits+0x268>
    80004d78:	fffff097          	auipc	ra,0xfffff
    80004d7c:	ec0080e7          	jalr	-320(ra) # 80003c38 <_Z11printStringPKc>
}
    80004d80:	05813083          	ld	ra,88(sp)
    80004d84:	05013403          	ld	s0,80(sp)
    80004d88:	04813483          	ld	s1,72(sp)
    80004d8c:	04013903          	ld	s2,64(sp)
    80004d90:	06010113          	addi	sp,sp,96
    80004d94:	00008067          	ret
    80004d98:	00050913          	mv	s2,a0
    ProducerConsumer *obj = new ProducerConsumer();
    80004d9c:	00048513          	mv	a0,s1
    80004da0:	ffffe097          	auipc	ra,0xffffe
    80004da4:	a08080e7          	jalr	-1528(ra) # 800027a8 <_ZdlPv>
    80004da8:	00090513          	mv	a0,s2
    80004dac:	00006097          	auipc	ra,0x6
    80004db0:	19c080e7          	jalr	412(ra) # 8000af48 <_Unwind_Resume>

0000000080004db4 <_Z8userMainv>:
#include "../test/ThreadSleep_C_API_test.hpp" // thread_sleep test C API
//#include "../test/ConsumerProducer_CPP_API_test.hpp" // zadatak 4. CPP API i asinhrona promena konteksta

#include "../test/myUserMain.h" // additional C API tests

void userMain() {
    80004db4:	ff010113          	addi	sp,sp,-16
    80004db8:	00113423          	sd	ra,8(sp)
    80004dbc:	00813023          	sd	s0,0(sp)
    80004dc0:	01010413          	addi	s0,sp,16
    Threads_C_API_test(); // zadatak 2., niti C API i sinhrona promena konteksta
    80004dc4:	fffff097          	auipc	ra,0xfffff
    80004dc8:	6f4080e7          	jalr	1780(ra) # 800044b8 <_Z18Threads_C_API_testv>
    //Threads_CPP_API_test(); // zadatak 2., niti CPP API i sinhrona promena konteksta

//    producerConsumer_C_API(); // zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta
    //producerConsumer_CPP_Sync_API(); // zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta

    testSleeping(); // thread_sleep test C API
    80004dcc:	00000097          	auipc	ra,0x0
    80004dd0:	9e4080e7          	jalr	-1564(ra) # 800047b0 <_Z12testSleepingv>
    //ConsumerProducerCPP::testConsumerProducer(); // zadatak 4. CPP API i asinhrona promena konteksta, kompletan test svega

    myUserMain(); // additional C API tests - Extreme - Testing every functionality
    80004dd4:	00000097          	auipc	ra,0x0
    80004dd8:	d74080e7          	jalr	-652(ra) # 80004b48 <_Z10myUserMainv>

    80004ddc:	00813083          	ld	ra,8(sp)
    80004de0:	00013403          	ld	s0,0(sp)
    80004de4:	01010113          	addi	sp,sp,16
    80004de8:	00008067          	ret

0000000080004dec <_ZN16ProducerConsumer14produceWrapperEPv>:
        }

        printString("Consumer finished\n");
    }

    static void produceWrapper(void *obj) {
    80004dec:	fe010113          	addi	sp,sp,-32
    80004df0:	00113c23          	sd	ra,24(sp)
    80004df4:	00813823          	sd	s0,16(sp)
    80004df8:	00913423          	sd	s1,8(sp)
    80004dfc:	01213023          	sd	s2,0(sp)
    80004e00:	02010413          	addi	s0,sp,32
    80004e04:	00050493          	mv	s1,a0
        for (int i = 1; i <= 150; i++) {
    80004e08:	00100913          	li	s2,1
    80004e0c:	09600793          	li	a5,150
    80004e10:	0327c863          	blt	a5,s2,80004e40 <_ZN16ProducerConsumer14produceWrapperEPv+0x54>
            sem_wait(semProducer);
    80004e14:	0004b503          	ld	a0,0(s1)
    80004e18:	ffffe097          	auipc	ra,0xffffe
    80004e1c:	840080e7          	jalr	-1984(ra) # 80002658 <_Z8sem_waitP4_sem>
            value++;
    80004e20:	0104a783          	lw	a5,16(s1)
    80004e24:	0017879b          	addiw	a5,a5,1
    80004e28:	00f4a823          	sw	a5,16(s1)
            sem_signal(semConsumer);
    80004e2c:	0084b503          	ld	a0,8(s1)
    80004e30:	ffffe097          	auipc	ra,0xffffe
    80004e34:	85c080e7          	jalr	-1956(ra) # 8000268c <_Z10sem_signalP4_sem>
        for (int i = 1; i <= 150; i++) {
    80004e38:	0019091b          	addiw	s2,s2,1
    80004e3c:	fd1ff06f          	j	80004e0c <_ZN16ProducerConsumer14produceWrapperEPv+0x20>
        int a = sem_close(semProducer);
    80004e40:	0004b503          	ld	a0,0(s1)
    80004e44:	ffffd097          	auipc	ra,0xffffd
    80004e48:	7e0080e7          	jalr	2016(ra) # 80002624 <_Z9sem_closeP4_sem>
    80004e4c:	00050913          	mv	s2,a0
        int b = sem_close(semConsumer);
    80004e50:	0084b503          	ld	a0,8(s1)
    80004e54:	ffffd097          	auipc	ra,0xffffd
    80004e58:	7d0080e7          	jalr	2000(ra) # 80002624 <_Z9sem_closeP4_sem>
    80004e5c:	00050493          	mv	s1,a0
        printString("Producer finished with exit values: ");
    80004e60:	00003517          	auipc	a0,0x3
    80004e64:	61050513          	addi	a0,a0,1552 # 80008470 <_ZZ14kprintUnsignedmE6digits+0x280>
    80004e68:	fffff097          	auipc	ra,0xfffff
    80004e6c:	dd0080e7          	jalr	-560(ra) # 80003c38 <_Z11printStringPKc>
        printInt(a);
    80004e70:	00000613          	li	a2,0
    80004e74:	00a00593          	li	a1,10
    80004e78:	00090513          	mv	a0,s2
    80004e7c:	fffff097          	auipc	ra,0xfffff
    80004e80:	a9c080e7          	jalr	-1380(ra) # 80003918 <_ZL8printIntiii>
        printString(" and ");
    80004e84:	00003517          	auipc	a0,0x3
    80004e88:	61450513          	addi	a0,a0,1556 # 80008498 <_ZZ14kprintUnsignedmE6digits+0x2a8>
    80004e8c:	fffff097          	auipc	ra,0xfffff
    80004e90:	dac080e7          	jalr	-596(ra) # 80003c38 <_Z11printStringPKc>
        printInt(b);
    80004e94:	00000613          	li	a2,0
    80004e98:	00a00593          	li	a1,10
    80004e9c:	00048513          	mv	a0,s1
    80004ea0:	fffff097          	auipc	ra,0xfffff
    80004ea4:	a78080e7          	jalr	-1416(ra) # 80003918 <_ZL8printIntiii>
        printString("\n");
    80004ea8:	00003517          	auipc	a0,0x3
    80004eac:	2e050513          	addi	a0,a0,736 # 80008188 <CONSOLE_STATUS+0x178>
    80004eb0:	fffff097          	auipc	ra,0xfffff
    80004eb4:	d88080e7          	jalr	-632(ra) # 80003c38 <_Z11printStringPKc>
        ProducerConsumer *pc = (ProducerConsumer *) obj;
        pc->produce();
    }
    80004eb8:	01813083          	ld	ra,24(sp)
    80004ebc:	01013403          	ld	s0,16(sp)
    80004ec0:	00813483          	ld	s1,8(sp)
    80004ec4:	00013903          	ld	s2,0(sp)
    80004ec8:	02010113          	addi	sp,sp,32
    80004ecc:	00008067          	ret

0000000080004ed0 <_ZN16ProducerConsumer14consumeWrapperEPv>:

    static void consumeWrapper(void *obj) {
    80004ed0:	fe010113          	addi	sp,sp,-32
    80004ed4:	00113c23          	sd	ra,24(sp)
    80004ed8:	00813823          	sd	s0,16(sp)
    80004edc:	00913423          	sd	s1,8(sp)
    80004ee0:	01213023          	sd	s2,0(sp)
    80004ee4:	02010413          	addi	s0,sp,32
    80004ee8:	00050493          	mv	s1,a0
        for (int i = 1; i <= 50; i++) {
    80004eec:	00100913          	li	s2,1
    80004ef0:	03200793          	li	a5,50
    80004ef4:	0727c863          	blt	a5,s2,80004f64 <_ZN16ProducerConsumer14consumeWrapperEPv+0x94>
            sem_wait(semConsumer);
    80004ef8:	0084b503          	ld	a0,8(s1)
    80004efc:	ffffd097          	auipc	ra,0xffffd
    80004f00:	75c080e7          	jalr	1884(ra) # 80002658 <_Z8sem_waitP4_sem>
            printInt(value);
    80004f04:	00000613          	li	a2,0
    80004f08:	00a00593          	li	a1,10
    80004f0c:	0104a503          	lw	a0,16(s1)
    80004f10:	fffff097          	auipc	ra,0xfffff
    80004f14:	a08080e7          	jalr	-1528(ra) # 80003918 <_ZL8printIntiii>
            printString(" squared is: ");
    80004f18:	00003517          	auipc	a0,0x3
    80004f1c:	58850513          	addi	a0,a0,1416 # 800084a0 <_ZZ14kprintUnsignedmE6digits+0x2b0>
    80004f20:	fffff097          	auipc	ra,0xfffff
    80004f24:	d18080e7          	jalr	-744(ra) # 80003c38 <_Z11printStringPKc>
            printInt(value * value);
    80004f28:	0104a503          	lw	a0,16(s1)
    80004f2c:	00000613          	li	a2,0
    80004f30:	00a00593          	li	a1,10
    80004f34:	02a5053b          	mulw	a0,a0,a0
    80004f38:	fffff097          	auipc	ra,0xfffff
    80004f3c:	9e0080e7          	jalr	-1568(ra) # 80003918 <_ZL8printIntiii>
            printString("\n");
    80004f40:	00003517          	auipc	a0,0x3
    80004f44:	24850513          	addi	a0,a0,584 # 80008188 <CONSOLE_STATUS+0x178>
    80004f48:	fffff097          	auipc	ra,0xfffff
    80004f4c:	cf0080e7          	jalr	-784(ra) # 80003c38 <_Z11printStringPKc>
            sem_signal(semProducer);
    80004f50:	0004b503          	ld	a0,0(s1)
    80004f54:	ffffd097          	auipc	ra,0xffffd
    80004f58:	738080e7          	jalr	1848(ra) # 8000268c <_Z10sem_signalP4_sem>
        for (int i = 1; i <= 50; i++) {
    80004f5c:	0019091b          	addiw	s2,s2,1
    80004f60:	f91ff06f          	j	80004ef0 <_ZN16ProducerConsumer14consumeWrapperEPv+0x20>
        printString("Consumer finished\n");
    80004f64:	00003517          	auipc	a0,0x3
    80004f68:	54c50513          	addi	a0,a0,1356 # 800084b0 <_ZZ14kprintUnsignedmE6digits+0x2c0>
    80004f6c:	fffff097          	auipc	ra,0xfffff
    80004f70:	ccc080e7          	jalr	-820(ra) # 80003c38 <_Z11printStringPKc>
        ProducerConsumer *pc = (ProducerConsumer *) obj;
        pc->consume();
    }
    80004f74:	01813083          	ld	ra,24(sp)
    80004f78:	01013403          	ld	s0,16(sp)
    80004f7c:	00813483          	ld	s1,8(sp)
    80004f80:	00013903          	ld	s2,0(sp)
    80004f84:	02010113          	addi	sp,sp,32
    80004f88:	00008067          	ret

0000000080004f8c <start>:
    80004f8c:	ff010113          	addi	sp,sp,-16
    80004f90:	00813423          	sd	s0,8(sp)
    80004f94:	01010413          	addi	s0,sp,16
    80004f98:	300027f3          	csrr	a5,mstatus
    80004f9c:	ffffe737          	lui	a4,0xffffe
    80004fa0:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff371f>
    80004fa4:	00e7f7b3          	and	a5,a5,a4
    80004fa8:	00001737          	lui	a4,0x1
    80004fac:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80004fb0:	00e7e7b3          	or	a5,a5,a4
    80004fb4:	30079073          	csrw	mstatus,a5
    80004fb8:	00000797          	auipc	a5,0x0
    80004fbc:	16078793          	addi	a5,a5,352 # 80005118 <system_main>
    80004fc0:	34179073          	csrw	mepc,a5
    80004fc4:	00000793          	li	a5,0
    80004fc8:	18079073          	csrw	satp,a5
    80004fcc:	000107b7          	lui	a5,0x10
    80004fd0:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80004fd4:	30279073          	csrw	medeleg,a5
    80004fd8:	30379073          	csrw	mideleg,a5
    80004fdc:	104027f3          	csrr	a5,sie
    80004fe0:	2227e793          	ori	a5,a5,546
    80004fe4:	10479073          	csrw	sie,a5
    80004fe8:	fff00793          	li	a5,-1
    80004fec:	00a7d793          	srli	a5,a5,0xa
    80004ff0:	3b079073          	csrw	pmpaddr0,a5
    80004ff4:	00f00793          	li	a5,15
    80004ff8:	3a079073          	csrw	pmpcfg0,a5
    80004ffc:	f14027f3          	csrr	a5,mhartid
    80005000:	0200c737          	lui	a4,0x200c
    80005004:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80005008:	0007869b          	sext.w	a3,a5
    8000500c:	00269713          	slli	a4,a3,0x2
    80005010:	000f4637          	lui	a2,0xf4
    80005014:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80005018:	00d70733          	add	a4,a4,a3
    8000501c:	0037979b          	slliw	a5,a5,0x3
    80005020:	020046b7          	lui	a3,0x2004
    80005024:	00d787b3          	add	a5,a5,a3
    80005028:	00c585b3          	add	a1,a1,a2
    8000502c:	00371693          	slli	a3,a4,0x3
    80005030:	00005717          	auipc	a4,0x5
    80005034:	e5070713          	addi	a4,a4,-432 # 80009e80 <timer_scratch>
    80005038:	00b7b023          	sd	a1,0(a5)
    8000503c:	00d70733          	add	a4,a4,a3
    80005040:	00f73c23          	sd	a5,24(a4)
    80005044:	02c73023          	sd	a2,32(a4)
    80005048:	34071073          	csrw	mscratch,a4
    8000504c:	00000797          	auipc	a5,0x0
    80005050:	6e478793          	addi	a5,a5,1764 # 80005730 <timervec>
    80005054:	30579073          	csrw	mtvec,a5
    80005058:	300027f3          	csrr	a5,mstatus
    8000505c:	0087e793          	ori	a5,a5,8
    80005060:	30079073          	csrw	mstatus,a5
    80005064:	304027f3          	csrr	a5,mie
    80005068:	0807e793          	ori	a5,a5,128
    8000506c:	30479073          	csrw	mie,a5
    80005070:	f14027f3          	csrr	a5,mhartid
    80005074:	0007879b          	sext.w	a5,a5
    80005078:	00078213          	mv	tp,a5
    8000507c:	30200073          	mret
    80005080:	00813403          	ld	s0,8(sp)
    80005084:	01010113          	addi	sp,sp,16
    80005088:	00008067          	ret

000000008000508c <timerinit>:
    8000508c:	ff010113          	addi	sp,sp,-16
    80005090:	00813423          	sd	s0,8(sp)
    80005094:	01010413          	addi	s0,sp,16
    80005098:	f14027f3          	csrr	a5,mhartid
    8000509c:	0200c737          	lui	a4,0x200c
    800050a0:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800050a4:	0007869b          	sext.w	a3,a5
    800050a8:	00269713          	slli	a4,a3,0x2
    800050ac:	000f4637          	lui	a2,0xf4
    800050b0:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800050b4:	00d70733          	add	a4,a4,a3
    800050b8:	0037979b          	slliw	a5,a5,0x3
    800050bc:	020046b7          	lui	a3,0x2004
    800050c0:	00d787b3          	add	a5,a5,a3
    800050c4:	00c585b3          	add	a1,a1,a2
    800050c8:	00371693          	slli	a3,a4,0x3
    800050cc:	00005717          	auipc	a4,0x5
    800050d0:	db470713          	addi	a4,a4,-588 # 80009e80 <timer_scratch>
    800050d4:	00b7b023          	sd	a1,0(a5)
    800050d8:	00d70733          	add	a4,a4,a3
    800050dc:	00f73c23          	sd	a5,24(a4)
    800050e0:	02c73023          	sd	a2,32(a4)
    800050e4:	34071073          	csrw	mscratch,a4
    800050e8:	00000797          	auipc	a5,0x0
    800050ec:	64878793          	addi	a5,a5,1608 # 80005730 <timervec>
    800050f0:	30579073          	csrw	mtvec,a5
    800050f4:	300027f3          	csrr	a5,mstatus
    800050f8:	0087e793          	ori	a5,a5,8
    800050fc:	30079073          	csrw	mstatus,a5
    80005100:	304027f3          	csrr	a5,mie
    80005104:	0807e793          	ori	a5,a5,128
    80005108:	30479073          	csrw	mie,a5
    8000510c:	00813403          	ld	s0,8(sp)
    80005110:	01010113          	addi	sp,sp,16
    80005114:	00008067          	ret

0000000080005118 <system_main>:
    80005118:	fe010113          	addi	sp,sp,-32
    8000511c:	00813823          	sd	s0,16(sp)
    80005120:	00913423          	sd	s1,8(sp)
    80005124:	00113c23          	sd	ra,24(sp)
    80005128:	02010413          	addi	s0,sp,32
    8000512c:	00000097          	auipc	ra,0x0
    80005130:	0c4080e7          	jalr	196(ra) # 800051f0 <cpuid>
    80005134:	00005497          	auipc	s1,0x5
    80005138:	cbc48493          	addi	s1,s1,-836 # 80009df0 <started>
    8000513c:	02050263          	beqz	a0,80005160 <system_main+0x48>
    80005140:	0004a783          	lw	a5,0(s1)
    80005144:	0007879b          	sext.w	a5,a5
    80005148:	fe078ce3          	beqz	a5,80005140 <system_main+0x28>
    8000514c:	0ff0000f          	fence
    80005150:	00003517          	auipc	a0,0x3
    80005154:	3c050513          	addi	a0,a0,960 # 80008510 <_ZL6digits+0x48>
    80005158:	00001097          	auipc	ra,0x1
    8000515c:	a74080e7          	jalr	-1420(ra) # 80005bcc <panic>
    80005160:	00001097          	auipc	ra,0x1
    80005164:	9c8080e7          	jalr	-1592(ra) # 80005b28 <consoleinit>
    80005168:	00001097          	auipc	ra,0x1
    8000516c:	154080e7          	jalr	340(ra) # 800062bc <printfinit>
    80005170:	00003517          	auipc	a0,0x3
    80005174:	01850513          	addi	a0,a0,24 # 80008188 <CONSOLE_STATUS+0x178>
    80005178:	00001097          	auipc	ra,0x1
    8000517c:	ab0080e7          	jalr	-1360(ra) # 80005c28 <__printf>
    80005180:	00003517          	auipc	a0,0x3
    80005184:	36050513          	addi	a0,a0,864 # 800084e0 <_ZL6digits+0x18>
    80005188:	00001097          	auipc	ra,0x1
    8000518c:	aa0080e7          	jalr	-1376(ra) # 80005c28 <__printf>
    80005190:	00003517          	auipc	a0,0x3
    80005194:	ff850513          	addi	a0,a0,-8 # 80008188 <CONSOLE_STATUS+0x178>
    80005198:	00001097          	auipc	ra,0x1
    8000519c:	a90080e7          	jalr	-1392(ra) # 80005c28 <__printf>
    800051a0:	00001097          	auipc	ra,0x1
    800051a4:	4a8080e7          	jalr	1192(ra) # 80006648 <kinit>
    800051a8:	00000097          	auipc	ra,0x0
    800051ac:	148080e7          	jalr	328(ra) # 800052f0 <trapinit>
    800051b0:	00000097          	auipc	ra,0x0
    800051b4:	16c080e7          	jalr	364(ra) # 8000531c <trapinithart>
    800051b8:	00000097          	auipc	ra,0x0
    800051bc:	5b8080e7          	jalr	1464(ra) # 80005770 <plicinit>
    800051c0:	00000097          	auipc	ra,0x0
    800051c4:	5d8080e7          	jalr	1496(ra) # 80005798 <plicinithart>
    800051c8:	00000097          	auipc	ra,0x0
    800051cc:	078080e7          	jalr	120(ra) # 80005240 <userinit>
    800051d0:	0ff0000f          	fence
    800051d4:	00100793          	li	a5,1
    800051d8:	00003517          	auipc	a0,0x3
    800051dc:	32050513          	addi	a0,a0,800 # 800084f8 <_ZL6digits+0x30>
    800051e0:	00f4a023          	sw	a5,0(s1)
    800051e4:	00001097          	auipc	ra,0x1
    800051e8:	a44080e7          	jalr	-1468(ra) # 80005c28 <__printf>
    800051ec:	0000006f          	j	800051ec <system_main+0xd4>

00000000800051f0 <cpuid>:
    800051f0:	ff010113          	addi	sp,sp,-16
    800051f4:	00813423          	sd	s0,8(sp)
    800051f8:	01010413          	addi	s0,sp,16
    800051fc:	00020513          	mv	a0,tp
    80005200:	00813403          	ld	s0,8(sp)
    80005204:	0005051b          	sext.w	a0,a0
    80005208:	01010113          	addi	sp,sp,16
    8000520c:	00008067          	ret

0000000080005210 <mycpu>:
    80005210:	ff010113          	addi	sp,sp,-16
    80005214:	00813423          	sd	s0,8(sp)
    80005218:	01010413          	addi	s0,sp,16
    8000521c:	00020793          	mv	a5,tp
    80005220:	00813403          	ld	s0,8(sp)
    80005224:	0007879b          	sext.w	a5,a5
    80005228:	00779793          	slli	a5,a5,0x7
    8000522c:	00006517          	auipc	a0,0x6
    80005230:	c8450513          	addi	a0,a0,-892 # 8000aeb0 <cpus>
    80005234:	00f50533          	add	a0,a0,a5
    80005238:	01010113          	addi	sp,sp,16
    8000523c:	00008067          	ret

0000000080005240 <userinit>:
    80005240:	ff010113          	addi	sp,sp,-16
    80005244:	00813423          	sd	s0,8(sp)
    80005248:	01010413          	addi	s0,sp,16
    8000524c:	00813403          	ld	s0,8(sp)
    80005250:	01010113          	addi	sp,sp,16
    80005254:	ffffc317          	auipc	t1,0xffffc
    80005258:	75c30067          	jr	1884(t1) # 800019b0 <main>

000000008000525c <either_copyout>:
    8000525c:	ff010113          	addi	sp,sp,-16
    80005260:	00813023          	sd	s0,0(sp)
    80005264:	00113423          	sd	ra,8(sp)
    80005268:	01010413          	addi	s0,sp,16
    8000526c:	02051663          	bnez	a0,80005298 <either_copyout+0x3c>
    80005270:	00058513          	mv	a0,a1
    80005274:	00060593          	mv	a1,a2
    80005278:	0006861b          	sext.w	a2,a3
    8000527c:	00002097          	auipc	ra,0x2
    80005280:	c58080e7          	jalr	-936(ra) # 80006ed4 <__memmove>
    80005284:	00813083          	ld	ra,8(sp)
    80005288:	00013403          	ld	s0,0(sp)
    8000528c:	00000513          	li	a0,0
    80005290:	01010113          	addi	sp,sp,16
    80005294:	00008067          	ret
    80005298:	00003517          	auipc	a0,0x3
    8000529c:	2a050513          	addi	a0,a0,672 # 80008538 <_ZL6digits+0x70>
    800052a0:	00001097          	auipc	ra,0x1
    800052a4:	92c080e7          	jalr	-1748(ra) # 80005bcc <panic>

00000000800052a8 <either_copyin>:
    800052a8:	ff010113          	addi	sp,sp,-16
    800052ac:	00813023          	sd	s0,0(sp)
    800052b0:	00113423          	sd	ra,8(sp)
    800052b4:	01010413          	addi	s0,sp,16
    800052b8:	02059463          	bnez	a1,800052e0 <either_copyin+0x38>
    800052bc:	00060593          	mv	a1,a2
    800052c0:	0006861b          	sext.w	a2,a3
    800052c4:	00002097          	auipc	ra,0x2
    800052c8:	c10080e7          	jalr	-1008(ra) # 80006ed4 <__memmove>
    800052cc:	00813083          	ld	ra,8(sp)
    800052d0:	00013403          	ld	s0,0(sp)
    800052d4:	00000513          	li	a0,0
    800052d8:	01010113          	addi	sp,sp,16
    800052dc:	00008067          	ret
    800052e0:	00003517          	auipc	a0,0x3
    800052e4:	28050513          	addi	a0,a0,640 # 80008560 <_ZL6digits+0x98>
    800052e8:	00001097          	auipc	ra,0x1
    800052ec:	8e4080e7          	jalr	-1820(ra) # 80005bcc <panic>

00000000800052f0 <trapinit>:
    800052f0:	ff010113          	addi	sp,sp,-16
    800052f4:	00813423          	sd	s0,8(sp)
    800052f8:	01010413          	addi	s0,sp,16
    800052fc:	00813403          	ld	s0,8(sp)
    80005300:	00003597          	auipc	a1,0x3
    80005304:	28858593          	addi	a1,a1,648 # 80008588 <_ZL6digits+0xc0>
    80005308:	00006517          	auipc	a0,0x6
    8000530c:	c2850513          	addi	a0,a0,-984 # 8000af30 <tickslock>
    80005310:	01010113          	addi	sp,sp,16
    80005314:	00001317          	auipc	t1,0x1
    80005318:	5c430067          	jr	1476(t1) # 800068d8 <initlock>

000000008000531c <trapinithart>:
    8000531c:	ff010113          	addi	sp,sp,-16
    80005320:	00813423          	sd	s0,8(sp)
    80005324:	01010413          	addi	s0,sp,16
    80005328:	00000797          	auipc	a5,0x0
    8000532c:	2f878793          	addi	a5,a5,760 # 80005620 <kernelvec>
    80005330:	10579073          	csrw	stvec,a5
    80005334:	00813403          	ld	s0,8(sp)
    80005338:	01010113          	addi	sp,sp,16
    8000533c:	00008067          	ret

0000000080005340 <usertrap>:
    80005340:	ff010113          	addi	sp,sp,-16
    80005344:	00813423          	sd	s0,8(sp)
    80005348:	01010413          	addi	s0,sp,16
    8000534c:	00813403          	ld	s0,8(sp)
    80005350:	01010113          	addi	sp,sp,16
    80005354:	00008067          	ret

0000000080005358 <usertrapret>:
    80005358:	ff010113          	addi	sp,sp,-16
    8000535c:	00813423          	sd	s0,8(sp)
    80005360:	01010413          	addi	s0,sp,16
    80005364:	00813403          	ld	s0,8(sp)
    80005368:	01010113          	addi	sp,sp,16
    8000536c:	00008067          	ret

0000000080005370 <kerneltrap>:
    80005370:	fe010113          	addi	sp,sp,-32
    80005374:	00813823          	sd	s0,16(sp)
    80005378:	00113c23          	sd	ra,24(sp)
    8000537c:	00913423          	sd	s1,8(sp)
    80005380:	02010413          	addi	s0,sp,32
    80005384:	142025f3          	csrr	a1,scause
    80005388:	100027f3          	csrr	a5,sstatus
    8000538c:	0027f793          	andi	a5,a5,2
    80005390:	10079c63          	bnez	a5,800054a8 <kerneltrap+0x138>
    80005394:	142027f3          	csrr	a5,scause
    80005398:	0207ce63          	bltz	a5,800053d4 <kerneltrap+0x64>
    8000539c:	00003517          	auipc	a0,0x3
    800053a0:	23450513          	addi	a0,a0,564 # 800085d0 <_ZL6digits+0x108>
    800053a4:	00001097          	auipc	ra,0x1
    800053a8:	884080e7          	jalr	-1916(ra) # 80005c28 <__printf>
    800053ac:	141025f3          	csrr	a1,sepc
    800053b0:	14302673          	csrr	a2,stval
    800053b4:	00003517          	auipc	a0,0x3
    800053b8:	22c50513          	addi	a0,a0,556 # 800085e0 <_ZL6digits+0x118>
    800053bc:	00001097          	auipc	ra,0x1
    800053c0:	86c080e7          	jalr	-1940(ra) # 80005c28 <__printf>
    800053c4:	00003517          	auipc	a0,0x3
    800053c8:	23450513          	addi	a0,a0,564 # 800085f8 <_ZL6digits+0x130>
    800053cc:	00001097          	auipc	ra,0x1
    800053d0:	800080e7          	jalr	-2048(ra) # 80005bcc <panic>
    800053d4:	0ff7f713          	andi	a4,a5,255
    800053d8:	00900693          	li	a3,9
    800053dc:	04d70063          	beq	a4,a3,8000541c <kerneltrap+0xac>
    800053e0:	fff00713          	li	a4,-1
    800053e4:	03f71713          	slli	a4,a4,0x3f
    800053e8:	00170713          	addi	a4,a4,1
    800053ec:	fae798e3          	bne	a5,a4,8000539c <kerneltrap+0x2c>
    800053f0:	00000097          	auipc	ra,0x0
    800053f4:	e00080e7          	jalr	-512(ra) # 800051f0 <cpuid>
    800053f8:	06050663          	beqz	a0,80005464 <kerneltrap+0xf4>
    800053fc:	144027f3          	csrr	a5,sip
    80005400:	ffd7f793          	andi	a5,a5,-3
    80005404:	14479073          	csrw	sip,a5
    80005408:	01813083          	ld	ra,24(sp)
    8000540c:	01013403          	ld	s0,16(sp)
    80005410:	00813483          	ld	s1,8(sp)
    80005414:	02010113          	addi	sp,sp,32
    80005418:	00008067          	ret
    8000541c:	00000097          	auipc	ra,0x0
    80005420:	3c8080e7          	jalr	968(ra) # 800057e4 <plic_claim>
    80005424:	00a00793          	li	a5,10
    80005428:	00050493          	mv	s1,a0
    8000542c:	06f50863          	beq	a0,a5,8000549c <kerneltrap+0x12c>
    80005430:	fc050ce3          	beqz	a0,80005408 <kerneltrap+0x98>
    80005434:	00050593          	mv	a1,a0
    80005438:	00003517          	auipc	a0,0x3
    8000543c:	17850513          	addi	a0,a0,376 # 800085b0 <_ZL6digits+0xe8>
    80005440:	00000097          	auipc	ra,0x0
    80005444:	7e8080e7          	jalr	2024(ra) # 80005c28 <__printf>
    80005448:	01013403          	ld	s0,16(sp)
    8000544c:	01813083          	ld	ra,24(sp)
    80005450:	00048513          	mv	a0,s1
    80005454:	00813483          	ld	s1,8(sp)
    80005458:	02010113          	addi	sp,sp,32
    8000545c:	00000317          	auipc	t1,0x0
    80005460:	3c030067          	jr	960(t1) # 8000581c <plic_complete>
    80005464:	00006517          	auipc	a0,0x6
    80005468:	acc50513          	addi	a0,a0,-1332 # 8000af30 <tickslock>
    8000546c:	00001097          	auipc	ra,0x1
    80005470:	490080e7          	jalr	1168(ra) # 800068fc <acquire>
    80005474:	00005717          	auipc	a4,0x5
    80005478:	98070713          	addi	a4,a4,-1664 # 80009df4 <ticks>
    8000547c:	00072783          	lw	a5,0(a4)
    80005480:	00006517          	auipc	a0,0x6
    80005484:	ab050513          	addi	a0,a0,-1360 # 8000af30 <tickslock>
    80005488:	0017879b          	addiw	a5,a5,1
    8000548c:	00f72023          	sw	a5,0(a4)
    80005490:	00001097          	auipc	ra,0x1
    80005494:	538080e7          	jalr	1336(ra) # 800069c8 <release>
    80005498:	f65ff06f          	j	800053fc <kerneltrap+0x8c>
    8000549c:	00001097          	auipc	ra,0x1
    800054a0:	094080e7          	jalr	148(ra) # 80006530 <uartintr>
    800054a4:	fa5ff06f          	j	80005448 <kerneltrap+0xd8>
    800054a8:	00003517          	auipc	a0,0x3
    800054ac:	0e850513          	addi	a0,a0,232 # 80008590 <_ZL6digits+0xc8>
    800054b0:	00000097          	auipc	ra,0x0
    800054b4:	71c080e7          	jalr	1820(ra) # 80005bcc <panic>

00000000800054b8 <clockintr>:
    800054b8:	fe010113          	addi	sp,sp,-32
    800054bc:	00813823          	sd	s0,16(sp)
    800054c0:	00913423          	sd	s1,8(sp)
    800054c4:	00113c23          	sd	ra,24(sp)
    800054c8:	02010413          	addi	s0,sp,32
    800054cc:	00006497          	auipc	s1,0x6
    800054d0:	a6448493          	addi	s1,s1,-1436 # 8000af30 <tickslock>
    800054d4:	00048513          	mv	a0,s1
    800054d8:	00001097          	auipc	ra,0x1
    800054dc:	424080e7          	jalr	1060(ra) # 800068fc <acquire>
    800054e0:	00005717          	auipc	a4,0x5
    800054e4:	91470713          	addi	a4,a4,-1772 # 80009df4 <ticks>
    800054e8:	00072783          	lw	a5,0(a4)
    800054ec:	01013403          	ld	s0,16(sp)
    800054f0:	01813083          	ld	ra,24(sp)
    800054f4:	00048513          	mv	a0,s1
    800054f8:	0017879b          	addiw	a5,a5,1
    800054fc:	00813483          	ld	s1,8(sp)
    80005500:	00f72023          	sw	a5,0(a4)
    80005504:	02010113          	addi	sp,sp,32
    80005508:	00001317          	auipc	t1,0x1
    8000550c:	4c030067          	jr	1216(t1) # 800069c8 <release>

0000000080005510 <devintr>:
    80005510:	142027f3          	csrr	a5,scause
    80005514:	00000513          	li	a0,0
    80005518:	0007c463          	bltz	a5,80005520 <devintr+0x10>
    8000551c:	00008067          	ret
    80005520:	fe010113          	addi	sp,sp,-32
    80005524:	00813823          	sd	s0,16(sp)
    80005528:	00113c23          	sd	ra,24(sp)
    8000552c:	00913423          	sd	s1,8(sp)
    80005530:	02010413          	addi	s0,sp,32
    80005534:	0ff7f713          	andi	a4,a5,255
    80005538:	00900693          	li	a3,9
    8000553c:	04d70c63          	beq	a4,a3,80005594 <devintr+0x84>
    80005540:	fff00713          	li	a4,-1
    80005544:	03f71713          	slli	a4,a4,0x3f
    80005548:	00170713          	addi	a4,a4,1
    8000554c:	00e78c63          	beq	a5,a4,80005564 <devintr+0x54>
    80005550:	01813083          	ld	ra,24(sp)
    80005554:	01013403          	ld	s0,16(sp)
    80005558:	00813483          	ld	s1,8(sp)
    8000555c:	02010113          	addi	sp,sp,32
    80005560:	00008067          	ret
    80005564:	00000097          	auipc	ra,0x0
    80005568:	c8c080e7          	jalr	-884(ra) # 800051f0 <cpuid>
    8000556c:	06050663          	beqz	a0,800055d8 <devintr+0xc8>
    80005570:	144027f3          	csrr	a5,sip
    80005574:	ffd7f793          	andi	a5,a5,-3
    80005578:	14479073          	csrw	sip,a5
    8000557c:	01813083          	ld	ra,24(sp)
    80005580:	01013403          	ld	s0,16(sp)
    80005584:	00813483          	ld	s1,8(sp)
    80005588:	00200513          	li	a0,2
    8000558c:	02010113          	addi	sp,sp,32
    80005590:	00008067          	ret
    80005594:	00000097          	auipc	ra,0x0
    80005598:	250080e7          	jalr	592(ra) # 800057e4 <plic_claim>
    8000559c:	00a00793          	li	a5,10
    800055a0:	00050493          	mv	s1,a0
    800055a4:	06f50663          	beq	a0,a5,80005610 <devintr+0x100>
    800055a8:	00100513          	li	a0,1
    800055ac:	fa0482e3          	beqz	s1,80005550 <devintr+0x40>
    800055b0:	00048593          	mv	a1,s1
    800055b4:	00003517          	auipc	a0,0x3
    800055b8:	ffc50513          	addi	a0,a0,-4 # 800085b0 <_ZL6digits+0xe8>
    800055bc:	00000097          	auipc	ra,0x0
    800055c0:	66c080e7          	jalr	1644(ra) # 80005c28 <__printf>
    800055c4:	00048513          	mv	a0,s1
    800055c8:	00000097          	auipc	ra,0x0
    800055cc:	254080e7          	jalr	596(ra) # 8000581c <plic_complete>
    800055d0:	00100513          	li	a0,1
    800055d4:	f7dff06f          	j	80005550 <devintr+0x40>
    800055d8:	00006517          	auipc	a0,0x6
    800055dc:	95850513          	addi	a0,a0,-1704 # 8000af30 <tickslock>
    800055e0:	00001097          	auipc	ra,0x1
    800055e4:	31c080e7          	jalr	796(ra) # 800068fc <acquire>
    800055e8:	00005717          	auipc	a4,0x5
    800055ec:	80c70713          	addi	a4,a4,-2036 # 80009df4 <ticks>
    800055f0:	00072783          	lw	a5,0(a4)
    800055f4:	00006517          	auipc	a0,0x6
    800055f8:	93c50513          	addi	a0,a0,-1732 # 8000af30 <tickslock>
    800055fc:	0017879b          	addiw	a5,a5,1
    80005600:	00f72023          	sw	a5,0(a4)
    80005604:	00001097          	auipc	ra,0x1
    80005608:	3c4080e7          	jalr	964(ra) # 800069c8 <release>
    8000560c:	f65ff06f          	j	80005570 <devintr+0x60>
    80005610:	00001097          	auipc	ra,0x1
    80005614:	f20080e7          	jalr	-224(ra) # 80006530 <uartintr>
    80005618:	fadff06f          	j	800055c4 <devintr+0xb4>
    8000561c:	0000                	unimp
	...

0000000080005620 <kernelvec>:
    80005620:	f0010113          	addi	sp,sp,-256
    80005624:	00113023          	sd	ra,0(sp)
    80005628:	00213423          	sd	sp,8(sp)
    8000562c:	00313823          	sd	gp,16(sp)
    80005630:	00413c23          	sd	tp,24(sp)
    80005634:	02513023          	sd	t0,32(sp)
    80005638:	02613423          	sd	t1,40(sp)
    8000563c:	02713823          	sd	t2,48(sp)
    80005640:	02813c23          	sd	s0,56(sp)
    80005644:	04913023          	sd	s1,64(sp)
    80005648:	04a13423          	sd	a0,72(sp)
    8000564c:	04b13823          	sd	a1,80(sp)
    80005650:	04c13c23          	sd	a2,88(sp)
    80005654:	06d13023          	sd	a3,96(sp)
    80005658:	06e13423          	sd	a4,104(sp)
    8000565c:	06f13823          	sd	a5,112(sp)
    80005660:	07013c23          	sd	a6,120(sp)
    80005664:	09113023          	sd	a7,128(sp)
    80005668:	09213423          	sd	s2,136(sp)
    8000566c:	09313823          	sd	s3,144(sp)
    80005670:	09413c23          	sd	s4,152(sp)
    80005674:	0b513023          	sd	s5,160(sp)
    80005678:	0b613423          	sd	s6,168(sp)
    8000567c:	0b713823          	sd	s7,176(sp)
    80005680:	0b813c23          	sd	s8,184(sp)
    80005684:	0d913023          	sd	s9,192(sp)
    80005688:	0da13423          	sd	s10,200(sp)
    8000568c:	0db13823          	sd	s11,208(sp)
    80005690:	0dc13c23          	sd	t3,216(sp)
    80005694:	0fd13023          	sd	t4,224(sp)
    80005698:	0fe13423          	sd	t5,232(sp)
    8000569c:	0ff13823          	sd	t6,240(sp)
    800056a0:	cd1ff0ef          	jal	ra,80005370 <kerneltrap>
    800056a4:	00013083          	ld	ra,0(sp)
    800056a8:	00813103          	ld	sp,8(sp)
    800056ac:	01013183          	ld	gp,16(sp)
    800056b0:	02013283          	ld	t0,32(sp)
    800056b4:	02813303          	ld	t1,40(sp)
    800056b8:	03013383          	ld	t2,48(sp)
    800056bc:	03813403          	ld	s0,56(sp)
    800056c0:	04013483          	ld	s1,64(sp)
    800056c4:	04813503          	ld	a0,72(sp)
    800056c8:	05013583          	ld	a1,80(sp)
    800056cc:	05813603          	ld	a2,88(sp)
    800056d0:	06013683          	ld	a3,96(sp)
    800056d4:	06813703          	ld	a4,104(sp)
    800056d8:	07013783          	ld	a5,112(sp)
    800056dc:	07813803          	ld	a6,120(sp)
    800056e0:	08013883          	ld	a7,128(sp)
    800056e4:	08813903          	ld	s2,136(sp)
    800056e8:	09013983          	ld	s3,144(sp)
    800056ec:	09813a03          	ld	s4,152(sp)
    800056f0:	0a013a83          	ld	s5,160(sp)
    800056f4:	0a813b03          	ld	s6,168(sp)
    800056f8:	0b013b83          	ld	s7,176(sp)
    800056fc:	0b813c03          	ld	s8,184(sp)
    80005700:	0c013c83          	ld	s9,192(sp)
    80005704:	0c813d03          	ld	s10,200(sp)
    80005708:	0d013d83          	ld	s11,208(sp)
    8000570c:	0d813e03          	ld	t3,216(sp)
    80005710:	0e013e83          	ld	t4,224(sp)
    80005714:	0e813f03          	ld	t5,232(sp)
    80005718:	0f013f83          	ld	t6,240(sp)
    8000571c:	10010113          	addi	sp,sp,256
    80005720:	10200073          	sret
    80005724:	00000013          	nop
    80005728:	00000013          	nop
    8000572c:	00000013          	nop

0000000080005730 <timervec>:
    80005730:	34051573          	csrrw	a0,mscratch,a0
    80005734:	00b53023          	sd	a1,0(a0)
    80005738:	00c53423          	sd	a2,8(a0)
    8000573c:	00d53823          	sd	a3,16(a0)
    80005740:	01853583          	ld	a1,24(a0)
    80005744:	02053603          	ld	a2,32(a0)
    80005748:	0005b683          	ld	a3,0(a1)
    8000574c:	00c686b3          	add	a3,a3,a2
    80005750:	00d5b023          	sd	a3,0(a1)
    80005754:	00200593          	li	a1,2
    80005758:	14459073          	csrw	sip,a1
    8000575c:	01053683          	ld	a3,16(a0)
    80005760:	00853603          	ld	a2,8(a0)
    80005764:	00053583          	ld	a1,0(a0)
    80005768:	34051573          	csrrw	a0,mscratch,a0
    8000576c:	30200073          	mret

0000000080005770 <plicinit>:
    80005770:	ff010113          	addi	sp,sp,-16
    80005774:	00813423          	sd	s0,8(sp)
    80005778:	01010413          	addi	s0,sp,16
    8000577c:	00813403          	ld	s0,8(sp)
    80005780:	0c0007b7          	lui	a5,0xc000
    80005784:	00100713          	li	a4,1
    80005788:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000578c:	00e7a223          	sw	a4,4(a5)
    80005790:	01010113          	addi	sp,sp,16
    80005794:	00008067          	ret

0000000080005798 <plicinithart>:
    80005798:	ff010113          	addi	sp,sp,-16
    8000579c:	00813023          	sd	s0,0(sp)
    800057a0:	00113423          	sd	ra,8(sp)
    800057a4:	01010413          	addi	s0,sp,16
    800057a8:	00000097          	auipc	ra,0x0
    800057ac:	a48080e7          	jalr	-1464(ra) # 800051f0 <cpuid>
    800057b0:	0085171b          	slliw	a4,a0,0x8
    800057b4:	0c0027b7          	lui	a5,0xc002
    800057b8:	00e787b3          	add	a5,a5,a4
    800057bc:	40200713          	li	a4,1026
    800057c0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    800057c4:	00813083          	ld	ra,8(sp)
    800057c8:	00013403          	ld	s0,0(sp)
    800057cc:	00d5151b          	slliw	a0,a0,0xd
    800057d0:	0c2017b7          	lui	a5,0xc201
    800057d4:	00a78533          	add	a0,a5,a0
    800057d8:	00052023          	sw	zero,0(a0)
    800057dc:	01010113          	addi	sp,sp,16
    800057e0:	00008067          	ret

00000000800057e4 <plic_claim>:
    800057e4:	ff010113          	addi	sp,sp,-16
    800057e8:	00813023          	sd	s0,0(sp)
    800057ec:	00113423          	sd	ra,8(sp)
    800057f0:	01010413          	addi	s0,sp,16
    800057f4:	00000097          	auipc	ra,0x0
    800057f8:	9fc080e7          	jalr	-1540(ra) # 800051f0 <cpuid>
    800057fc:	00813083          	ld	ra,8(sp)
    80005800:	00013403          	ld	s0,0(sp)
    80005804:	00d5151b          	slliw	a0,a0,0xd
    80005808:	0c2017b7          	lui	a5,0xc201
    8000580c:	00a78533          	add	a0,a5,a0
    80005810:	00452503          	lw	a0,4(a0)
    80005814:	01010113          	addi	sp,sp,16
    80005818:	00008067          	ret

000000008000581c <plic_complete>:
    8000581c:	fe010113          	addi	sp,sp,-32
    80005820:	00813823          	sd	s0,16(sp)
    80005824:	00913423          	sd	s1,8(sp)
    80005828:	00113c23          	sd	ra,24(sp)
    8000582c:	02010413          	addi	s0,sp,32
    80005830:	00050493          	mv	s1,a0
    80005834:	00000097          	auipc	ra,0x0
    80005838:	9bc080e7          	jalr	-1604(ra) # 800051f0 <cpuid>
    8000583c:	01813083          	ld	ra,24(sp)
    80005840:	01013403          	ld	s0,16(sp)
    80005844:	00d5179b          	slliw	a5,a0,0xd
    80005848:	0c201737          	lui	a4,0xc201
    8000584c:	00f707b3          	add	a5,a4,a5
    80005850:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80005854:	00813483          	ld	s1,8(sp)
    80005858:	02010113          	addi	sp,sp,32
    8000585c:	00008067          	ret

0000000080005860 <consolewrite>:
    80005860:	fb010113          	addi	sp,sp,-80
    80005864:	04813023          	sd	s0,64(sp)
    80005868:	04113423          	sd	ra,72(sp)
    8000586c:	02913c23          	sd	s1,56(sp)
    80005870:	03213823          	sd	s2,48(sp)
    80005874:	03313423          	sd	s3,40(sp)
    80005878:	03413023          	sd	s4,32(sp)
    8000587c:	01513c23          	sd	s5,24(sp)
    80005880:	05010413          	addi	s0,sp,80
    80005884:	06c05c63          	blez	a2,800058fc <consolewrite+0x9c>
    80005888:	00060993          	mv	s3,a2
    8000588c:	00050a13          	mv	s4,a0
    80005890:	00058493          	mv	s1,a1
    80005894:	00000913          	li	s2,0
    80005898:	fff00a93          	li	s5,-1
    8000589c:	01c0006f          	j	800058b8 <consolewrite+0x58>
    800058a0:	fbf44503          	lbu	a0,-65(s0)
    800058a4:	0019091b          	addiw	s2,s2,1
    800058a8:	00148493          	addi	s1,s1,1
    800058ac:	00001097          	auipc	ra,0x1
    800058b0:	a9c080e7          	jalr	-1380(ra) # 80006348 <uartputc>
    800058b4:	03298063          	beq	s3,s2,800058d4 <consolewrite+0x74>
    800058b8:	00048613          	mv	a2,s1
    800058bc:	00100693          	li	a3,1
    800058c0:	000a0593          	mv	a1,s4
    800058c4:	fbf40513          	addi	a0,s0,-65
    800058c8:	00000097          	auipc	ra,0x0
    800058cc:	9e0080e7          	jalr	-1568(ra) # 800052a8 <either_copyin>
    800058d0:	fd5518e3          	bne	a0,s5,800058a0 <consolewrite+0x40>
    800058d4:	04813083          	ld	ra,72(sp)
    800058d8:	04013403          	ld	s0,64(sp)
    800058dc:	03813483          	ld	s1,56(sp)
    800058e0:	02813983          	ld	s3,40(sp)
    800058e4:	02013a03          	ld	s4,32(sp)
    800058e8:	01813a83          	ld	s5,24(sp)
    800058ec:	00090513          	mv	a0,s2
    800058f0:	03013903          	ld	s2,48(sp)
    800058f4:	05010113          	addi	sp,sp,80
    800058f8:	00008067          	ret
    800058fc:	00000913          	li	s2,0
    80005900:	fd5ff06f          	j	800058d4 <consolewrite+0x74>

0000000080005904 <consoleread>:
    80005904:	f9010113          	addi	sp,sp,-112
    80005908:	06813023          	sd	s0,96(sp)
    8000590c:	04913c23          	sd	s1,88(sp)
    80005910:	05213823          	sd	s2,80(sp)
    80005914:	05313423          	sd	s3,72(sp)
    80005918:	05413023          	sd	s4,64(sp)
    8000591c:	03513c23          	sd	s5,56(sp)
    80005920:	03613823          	sd	s6,48(sp)
    80005924:	03713423          	sd	s7,40(sp)
    80005928:	03813023          	sd	s8,32(sp)
    8000592c:	06113423          	sd	ra,104(sp)
    80005930:	01913c23          	sd	s9,24(sp)
    80005934:	07010413          	addi	s0,sp,112
    80005938:	00060b93          	mv	s7,a2
    8000593c:	00050913          	mv	s2,a0
    80005940:	00058c13          	mv	s8,a1
    80005944:	00060b1b          	sext.w	s6,a2
    80005948:	00005497          	auipc	s1,0x5
    8000594c:	61048493          	addi	s1,s1,1552 # 8000af58 <cons>
    80005950:	00400993          	li	s3,4
    80005954:	fff00a13          	li	s4,-1
    80005958:	00a00a93          	li	s5,10
    8000595c:	05705e63          	blez	s7,800059b8 <consoleread+0xb4>
    80005960:	09c4a703          	lw	a4,156(s1)
    80005964:	0984a783          	lw	a5,152(s1)
    80005968:	0007071b          	sext.w	a4,a4
    8000596c:	08e78463          	beq	a5,a4,800059f4 <consoleread+0xf0>
    80005970:	07f7f713          	andi	a4,a5,127
    80005974:	00e48733          	add	a4,s1,a4
    80005978:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000597c:	0017869b          	addiw	a3,a5,1
    80005980:	08d4ac23          	sw	a3,152(s1)
    80005984:	00070c9b          	sext.w	s9,a4
    80005988:	0b370663          	beq	a4,s3,80005a34 <consoleread+0x130>
    8000598c:	00100693          	li	a3,1
    80005990:	f9f40613          	addi	a2,s0,-97
    80005994:	000c0593          	mv	a1,s8
    80005998:	00090513          	mv	a0,s2
    8000599c:	f8e40fa3          	sb	a4,-97(s0)
    800059a0:	00000097          	auipc	ra,0x0
    800059a4:	8bc080e7          	jalr	-1860(ra) # 8000525c <either_copyout>
    800059a8:	01450863          	beq	a0,s4,800059b8 <consoleread+0xb4>
    800059ac:	001c0c13          	addi	s8,s8,1
    800059b0:	fffb8b9b          	addiw	s7,s7,-1
    800059b4:	fb5c94e3          	bne	s9,s5,8000595c <consoleread+0x58>
    800059b8:	000b851b          	sext.w	a0,s7
    800059bc:	06813083          	ld	ra,104(sp)
    800059c0:	06013403          	ld	s0,96(sp)
    800059c4:	05813483          	ld	s1,88(sp)
    800059c8:	05013903          	ld	s2,80(sp)
    800059cc:	04813983          	ld	s3,72(sp)
    800059d0:	04013a03          	ld	s4,64(sp)
    800059d4:	03813a83          	ld	s5,56(sp)
    800059d8:	02813b83          	ld	s7,40(sp)
    800059dc:	02013c03          	ld	s8,32(sp)
    800059e0:	01813c83          	ld	s9,24(sp)
    800059e4:	40ab053b          	subw	a0,s6,a0
    800059e8:	03013b03          	ld	s6,48(sp)
    800059ec:	07010113          	addi	sp,sp,112
    800059f0:	00008067          	ret
    800059f4:	00001097          	auipc	ra,0x1
    800059f8:	1d8080e7          	jalr	472(ra) # 80006bcc <push_on>
    800059fc:	0984a703          	lw	a4,152(s1)
    80005a00:	09c4a783          	lw	a5,156(s1)
    80005a04:	0007879b          	sext.w	a5,a5
    80005a08:	fef70ce3          	beq	a4,a5,80005a00 <consoleread+0xfc>
    80005a0c:	00001097          	auipc	ra,0x1
    80005a10:	234080e7          	jalr	564(ra) # 80006c40 <pop_on>
    80005a14:	0984a783          	lw	a5,152(s1)
    80005a18:	07f7f713          	andi	a4,a5,127
    80005a1c:	00e48733          	add	a4,s1,a4
    80005a20:	01874703          	lbu	a4,24(a4)
    80005a24:	0017869b          	addiw	a3,a5,1
    80005a28:	08d4ac23          	sw	a3,152(s1)
    80005a2c:	00070c9b          	sext.w	s9,a4
    80005a30:	f5371ee3          	bne	a4,s3,8000598c <consoleread+0x88>
    80005a34:	000b851b          	sext.w	a0,s7
    80005a38:	f96bf2e3          	bgeu	s7,s6,800059bc <consoleread+0xb8>
    80005a3c:	08f4ac23          	sw	a5,152(s1)
    80005a40:	f7dff06f          	j	800059bc <consoleread+0xb8>

0000000080005a44 <consputc>:
    80005a44:	10000793          	li	a5,256
    80005a48:	00f50663          	beq	a0,a5,80005a54 <consputc+0x10>
    80005a4c:	00001317          	auipc	t1,0x1
    80005a50:	9f430067          	jr	-1548(t1) # 80006440 <uartputc_sync>
    80005a54:	ff010113          	addi	sp,sp,-16
    80005a58:	00113423          	sd	ra,8(sp)
    80005a5c:	00813023          	sd	s0,0(sp)
    80005a60:	01010413          	addi	s0,sp,16
    80005a64:	00800513          	li	a0,8
    80005a68:	00001097          	auipc	ra,0x1
    80005a6c:	9d8080e7          	jalr	-1576(ra) # 80006440 <uartputc_sync>
    80005a70:	02000513          	li	a0,32
    80005a74:	00001097          	auipc	ra,0x1
    80005a78:	9cc080e7          	jalr	-1588(ra) # 80006440 <uartputc_sync>
    80005a7c:	00013403          	ld	s0,0(sp)
    80005a80:	00813083          	ld	ra,8(sp)
    80005a84:	00800513          	li	a0,8
    80005a88:	01010113          	addi	sp,sp,16
    80005a8c:	00001317          	auipc	t1,0x1
    80005a90:	9b430067          	jr	-1612(t1) # 80006440 <uartputc_sync>

0000000080005a94 <consoleintr>:
    80005a94:	fe010113          	addi	sp,sp,-32
    80005a98:	00813823          	sd	s0,16(sp)
    80005a9c:	00913423          	sd	s1,8(sp)
    80005aa0:	01213023          	sd	s2,0(sp)
    80005aa4:	00113c23          	sd	ra,24(sp)
    80005aa8:	02010413          	addi	s0,sp,32
    80005aac:	00005917          	auipc	s2,0x5
    80005ab0:	4ac90913          	addi	s2,s2,1196 # 8000af58 <cons>
    80005ab4:	00050493          	mv	s1,a0
    80005ab8:	00090513          	mv	a0,s2
    80005abc:	00001097          	auipc	ra,0x1
    80005ac0:	e40080e7          	jalr	-448(ra) # 800068fc <acquire>
    80005ac4:	02048c63          	beqz	s1,80005afc <consoleintr+0x68>
    80005ac8:	0a092783          	lw	a5,160(s2)
    80005acc:	09892703          	lw	a4,152(s2)
    80005ad0:	07f00693          	li	a3,127
    80005ad4:	40e7873b          	subw	a4,a5,a4
    80005ad8:	02e6e263          	bltu	a3,a4,80005afc <consoleintr+0x68>
    80005adc:	00d00713          	li	a4,13
    80005ae0:	04e48063          	beq	s1,a4,80005b20 <consoleintr+0x8c>
    80005ae4:	07f7f713          	andi	a4,a5,127
    80005ae8:	00e90733          	add	a4,s2,a4
    80005aec:	0017879b          	addiw	a5,a5,1
    80005af0:	0af92023          	sw	a5,160(s2)
    80005af4:	00970c23          	sb	s1,24(a4)
    80005af8:	08f92e23          	sw	a5,156(s2)
    80005afc:	01013403          	ld	s0,16(sp)
    80005b00:	01813083          	ld	ra,24(sp)
    80005b04:	00813483          	ld	s1,8(sp)
    80005b08:	00013903          	ld	s2,0(sp)
    80005b0c:	00005517          	auipc	a0,0x5
    80005b10:	44c50513          	addi	a0,a0,1100 # 8000af58 <cons>
    80005b14:	02010113          	addi	sp,sp,32
    80005b18:	00001317          	auipc	t1,0x1
    80005b1c:	eb030067          	jr	-336(t1) # 800069c8 <release>
    80005b20:	00a00493          	li	s1,10
    80005b24:	fc1ff06f          	j	80005ae4 <consoleintr+0x50>

0000000080005b28 <consoleinit>:
    80005b28:	fe010113          	addi	sp,sp,-32
    80005b2c:	00113c23          	sd	ra,24(sp)
    80005b30:	00813823          	sd	s0,16(sp)
    80005b34:	00913423          	sd	s1,8(sp)
    80005b38:	02010413          	addi	s0,sp,32
    80005b3c:	00005497          	auipc	s1,0x5
    80005b40:	41c48493          	addi	s1,s1,1052 # 8000af58 <cons>
    80005b44:	00048513          	mv	a0,s1
    80005b48:	00003597          	auipc	a1,0x3
    80005b4c:	ac058593          	addi	a1,a1,-1344 # 80008608 <_ZL6digits+0x140>
    80005b50:	00001097          	auipc	ra,0x1
    80005b54:	d88080e7          	jalr	-632(ra) # 800068d8 <initlock>
    80005b58:	00000097          	auipc	ra,0x0
    80005b5c:	7ac080e7          	jalr	1964(ra) # 80006304 <uartinit>
    80005b60:	01813083          	ld	ra,24(sp)
    80005b64:	01013403          	ld	s0,16(sp)
    80005b68:	00000797          	auipc	a5,0x0
    80005b6c:	d9c78793          	addi	a5,a5,-612 # 80005904 <consoleread>
    80005b70:	0af4bc23          	sd	a5,184(s1)
    80005b74:	00000797          	auipc	a5,0x0
    80005b78:	cec78793          	addi	a5,a5,-788 # 80005860 <consolewrite>
    80005b7c:	0cf4b023          	sd	a5,192(s1)
    80005b80:	00813483          	ld	s1,8(sp)
    80005b84:	02010113          	addi	sp,sp,32
    80005b88:	00008067          	ret

0000000080005b8c <console_read>:
    80005b8c:	ff010113          	addi	sp,sp,-16
    80005b90:	00813423          	sd	s0,8(sp)
    80005b94:	01010413          	addi	s0,sp,16
    80005b98:	00813403          	ld	s0,8(sp)
    80005b9c:	00005317          	auipc	t1,0x5
    80005ba0:	47433303          	ld	t1,1140(t1) # 8000b010 <devsw+0x10>
    80005ba4:	01010113          	addi	sp,sp,16
    80005ba8:	00030067          	jr	t1

0000000080005bac <console_write>:
    80005bac:	ff010113          	addi	sp,sp,-16
    80005bb0:	00813423          	sd	s0,8(sp)
    80005bb4:	01010413          	addi	s0,sp,16
    80005bb8:	00813403          	ld	s0,8(sp)
    80005bbc:	00005317          	auipc	t1,0x5
    80005bc0:	45c33303          	ld	t1,1116(t1) # 8000b018 <devsw+0x18>
    80005bc4:	01010113          	addi	sp,sp,16
    80005bc8:	00030067          	jr	t1

0000000080005bcc <panic>:
    80005bcc:	fe010113          	addi	sp,sp,-32
    80005bd0:	00113c23          	sd	ra,24(sp)
    80005bd4:	00813823          	sd	s0,16(sp)
    80005bd8:	00913423          	sd	s1,8(sp)
    80005bdc:	02010413          	addi	s0,sp,32
    80005be0:	00050493          	mv	s1,a0
    80005be4:	00003517          	auipc	a0,0x3
    80005be8:	a2c50513          	addi	a0,a0,-1492 # 80008610 <_ZL6digits+0x148>
    80005bec:	00005797          	auipc	a5,0x5
    80005bf0:	4c07a623          	sw	zero,1228(a5) # 8000b0b8 <pr+0x18>
    80005bf4:	00000097          	auipc	ra,0x0
    80005bf8:	034080e7          	jalr	52(ra) # 80005c28 <__printf>
    80005bfc:	00048513          	mv	a0,s1
    80005c00:	00000097          	auipc	ra,0x0
    80005c04:	028080e7          	jalr	40(ra) # 80005c28 <__printf>
    80005c08:	00002517          	auipc	a0,0x2
    80005c0c:	58050513          	addi	a0,a0,1408 # 80008188 <CONSOLE_STATUS+0x178>
    80005c10:	00000097          	auipc	ra,0x0
    80005c14:	018080e7          	jalr	24(ra) # 80005c28 <__printf>
    80005c18:	00100793          	li	a5,1
    80005c1c:	00004717          	auipc	a4,0x4
    80005c20:	1cf72e23          	sw	a5,476(a4) # 80009df8 <panicked>
    80005c24:	0000006f          	j	80005c24 <panic+0x58>

0000000080005c28 <__printf>:
    80005c28:	f3010113          	addi	sp,sp,-208
    80005c2c:	08813023          	sd	s0,128(sp)
    80005c30:	07313423          	sd	s3,104(sp)
    80005c34:	09010413          	addi	s0,sp,144
    80005c38:	05813023          	sd	s8,64(sp)
    80005c3c:	08113423          	sd	ra,136(sp)
    80005c40:	06913c23          	sd	s1,120(sp)
    80005c44:	07213823          	sd	s2,112(sp)
    80005c48:	07413023          	sd	s4,96(sp)
    80005c4c:	05513c23          	sd	s5,88(sp)
    80005c50:	05613823          	sd	s6,80(sp)
    80005c54:	05713423          	sd	s7,72(sp)
    80005c58:	03913c23          	sd	s9,56(sp)
    80005c5c:	03a13823          	sd	s10,48(sp)
    80005c60:	03b13423          	sd	s11,40(sp)
    80005c64:	00005317          	auipc	t1,0x5
    80005c68:	43c30313          	addi	t1,t1,1084 # 8000b0a0 <pr>
    80005c6c:	01832c03          	lw	s8,24(t1)
    80005c70:	00b43423          	sd	a1,8(s0)
    80005c74:	00c43823          	sd	a2,16(s0)
    80005c78:	00d43c23          	sd	a3,24(s0)
    80005c7c:	02e43023          	sd	a4,32(s0)
    80005c80:	02f43423          	sd	a5,40(s0)
    80005c84:	03043823          	sd	a6,48(s0)
    80005c88:	03143c23          	sd	a7,56(s0)
    80005c8c:	00050993          	mv	s3,a0
    80005c90:	4a0c1663          	bnez	s8,8000613c <__printf+0x514>
    80005c94:	60098c63          	beqz	s3,800062ac <__printf+0x684>
    80005c98:	0009c503          	lbu	a0,0(s3)
    80005c9c:	00840793          	addi	a5,s0,8
    80005ca0:	f6f43c23          	sd	a5,-136(s0)
    80005ca4:	00000493          	li	s1,0
    80005ca8:	22050063          	beqz	a0,80005ec8 <__printf+0x2a0>
    80005cac:	00002a37          	lui	s4,0x2
    80005cb0:	00018ab7          	lui	s5,0x18
    80005cb4:	000f4b37          	lui	s6,0xf4
    80005cb8:	00989bb7          	lui	s7,0x989
    80005cbc:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80005cc0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80005cc4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80005cc8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80005ccc:	00148c9b          	addiw	s9,s1,1
    80005cd0:	02500793          	li	a5,37
    80005cd4:	01998933          	add	s2,s3,s9
    80005cd8:	38f51263          	bne	a0,a5,8000605c <__printf+0x434>
    80005cdc:	00094783          	lbu	a5,0(s2)
    80005ce0:	00078c9b          	sext.w	s9,a5
    80005ce4:	1e078263          	beqz	a5,80005ec8 <__printf+0x2a0>
    80005ce8:	0024849b          	addiw	s1,s1,2
    80005cec:	07000713          	li	a4,112
    80005cf0:	00998933          	add	s2,s3,s1
    80005cf4:	38e78a63          	beq	a5,a4,80006088 <__printf+0x460>
    80005cf8:	20f76863          	bltu	a4,a5,80005f08 <__printf+0x2e0>
    80005cfc:	42a78863          	beq	a5,a0,8000612c <__printf+0x504>
    80005d00:	06400713          	li	a4,100
    80005d04:	40e79663          	bne	a5,a4,80006110 <__printf+0x4e8>
    80005d08:	f7843783          	ld	a5,-136(s0)
    80005d0c:	0007a603          	lw	a2,0(a5)
    80005d10:	00878793          	addi	a5,a5,8
    80005d14:	f6f43c23          	sd	a5,-136(s0)
    80005d18:	42064a63          	bltz	a2,8000614c <__printf+0x524>
    80005d1c:	00a00713          	li	a4,10
    80005d20:	02e677bb          	remuw	a5,a2,a4
    80005d24:	00003d97          	auipc	s11,0x3
    80005d28:	914d8d93          	addi	s11,s11,-1772 # 80008638 <digits>
    80005d2c:	00900593          	li	a1,9
    80005d30:	0006051b          	sext.w	a0,a2
    80005d34:	00000c93          	li	s9,0
    80005d38:	02079793          	slli	a5,a5,0x20
    80005d3c:	0207d793          	srli	a5,a5,0x20
    80005d40:	00fd87b3          	add	a5,s11,a5
    80005d44:	0007c783          	lbu	a5,0(a5)
    80005d48:	02e656bb          	divuw	a3,a2,a4
    80005d4c:	f8f40023          	sb	a5,-128(s0)
    80005d50:	14c5d863          	bge	a1,a2,80005ea0 <__printf+0x278>
    80005d54:	06300593          	li	a1,99
    80005d58:	00100c93          	li	s9,1
    80005d5c:	02e6f7bb          	remuw	a5,a3,a4
    80005d60:	02079793          	slli	a5,a5,0x20
    80005d64:	0207d793          	srli	a5,a5,0x20
    80005d68:	00fd87b3          	add	a5,s11,a5
    80005d6c:	0007c783          	lbu	a5,0(a5)
    80005d70:	02e6d73b          	divuw	a4,a3,a4
    80005d74:	f8f400a3          	sb	a5,-127(s0)
    80005d78:	12a5f463          	bgeu	a1,a0,80005ea0 <__printf+0x278>
    80005d7c:	00a00693          	li	a3,10
    80005d80:	00900593          	li	a1,9
    80005d84:	02d777bb          	remuw	a5,a4,a3
    80005d88:	02079793          	slli	a5,a5,0x20
    80005d8c:	0207d793          	srli	a5,a5,0x20
    80005d90:	00fd87b3          	add	a5,s11,a5
    80005d94:	0007c503          	lbu	a0,0(a5)
    80005d98:	02d757bb          	divuw	a5,a4,a3
    80005d9c:	f8a40123          	sb	a0,-126(s0)
    80005da0:	48e5f263          	bgeu	a1,a4,80006224 <__printf+0x5fc>
    80005da4:	06300513          	li	a0,99
    80005da8:	02d7f5bb          	remuw	a1,a5,a3
    80005dac:	02059593          	slli	a1,a1,0x20
    80005db0:	0205d593          	srli	a1,a1,0x20
    80005db4:	00bd85b3          	add	a1,s11,a1
    80005db8:	0005c583          	lbu	a1,0(a1)
    80005dbc:	02d7d7bb          	divuw	a5,a5,a3
    80005dc0:	f8b401a3          	sb	a1,-125(s0)
    80005dc4:	48e57263          	bgeu	a0,a4,80006248 <__printf+0x620>
    80005dc8:	3e700513          	li	a0,999
    80005dcc:	02d7f5bb          	remuw	a1,a5,a3
    80005dd0:	02059593          	slli	a1,a1,0x20
    80005dd4:	0205d593          	srli	a1,a1,0x20
    80005dd8:	00bd85b3          	add	a1,s11,a1
    80005ddc:	0005c583          	lbu	a1,0(a1)
    80005de0:	02d7d7bb          	divuw	a5,a5,a3
    80005de4:	f8b40223          	sb	a1,-124(s0)
    80005de8:	46e57663          	bgeu	a0,a4,80006254 <__printf+0x62c>
    80005dec:	02d7f5bb          	remuw	a1,a5,a3
    80005df0:	02059593          	slli	a1,a1,0x20
    80005df4:	0205d593          	srli	a1,a1,0x20
    80005df8:	00bd85b3          	add	a1,s11,a1
    80005dfc:	0005c583          	lbu	a1,0(a1)
    80005e00:	02d7d7bb          	divuw	a5,a5,a3
    80005e04:	f8b402a3          	sb	a1,-123(s0)
    80005e08:	46ea7863          	bgeu	s4,a4,80006278 <__printf+0x650>
    80005e0c:	02d7f5bb          	remuw	a1,a5,a3
    80005e10:	02059593          	slli	a1,a1,0x20
    80005e14:	0205d593          	srli	a1,a1,0x20
    80005e18:	00bd85b3          	add	a1,s11,a1
    80005e1c:	0005c583          	lbu	a1,0(a1)
    80005e20:	02d7d7bb          	divuw	a5,a5,a3
    80005e24:	f8b40323          	sb	a1,-122(s0)
    80005e28:	3eeaf863          	bgeu	s5,a4,80006218 <__printf+0x5f0>
    80005e2c:	02d7f5bb          	remuw	a1,a5,a3
    80005e30:	02059593          	slli	a1,a1,0x20
    80005e34:	0205d593          	srli	a1,a1,0x20
    80005e38:	00bd85b3          	add	a1,s11,a1
    80005e3c:	0005c583          	lbu	a1,0(a1)
    80005e40:	02d7d7bb          	divuw	a5,a5,a3
    80005e44:	f8b403a3          	sb	a1,-121(s0)
    80005e48:	42eb7e63          	bgeu	s6,a4,80006284 <__printf+0x65c>
    80005e4c:	02d7f5bb          	remuw	a1,a5,a3
    80005e50:	02059593          	slli	a1,a1,0x20
    80005e54:	0205d593          	srli	a1,a1,0x20
    80005e58:	00bd85b3          	add	a1,s11,a1
    80005e5c:	0005c583          	lbu	a1,0(a1)
    80005e60:	02d7d7bb          	divuw	a5,a5,a3
    80005e64:	f8b40423          	sb	a1,-120(s0)
    80005e68:	42ebfc63          	bgeu	s7,a4,800062a0 <__printf+0x678>
    80005e6c:	02079793          	slli	a5,a5,0x20
    80005e70:	0207d793          	srli	a5,a5,0x20
    80005e74:	00fd8db3          	add	s11,s11,a5
    80005e78:	000dc703          	lbu	a4,0(s11)
    80005e7c:	00a00793          	li	a5,10
    80005e80:	00900c93          	li	s9,9
    80005e84:	f8e404a3          	sb	a4,-119(s0)
    80005e88:	00065c63          	bgez	a2,80005ea0 <__printf+0x278>
    80005e8c:	f9040713          	addi	a4,s0,-112
    80005e90:	00f70733          	add	a4,a4,a5
    80005e94:	02d00693          	li	a3,45
    80005e98:	fed70823          	sb	a3,-16(a4)
    80005e9c:	00078c93          	mv	s9,a5
    80005ea0:	f8040793          	addi	a5,s0,-128
    80005ea4:	01978cb3          	add	s9,a5,s9
    80005ea8:	f7f40d13          	addi	s10,s0,-129
    80005eac:	000cc503          	lbu	a0,0(s9)
    80005eb0:	fffc8c93          	addi	s9,s9,-1
    80005eb4:	00000097          	auipc	ra,0x0
    80005eb8:	b90080e7          	jalr	-1136(ra) # 80005a44 <consputc>
    80005ebc:	ffac98e3          	bne	s9,s10,80005eac <__printf+0x284>
    80005ec0:	00094503          	lbu	a0,0(s2)
    80005ec4:	e00514e3          	bnez	a0,80005ccc <__printf+0xa4>
    80005ec8:	1a0c1663          	bnez	s8,80006074 <__printf+0x44c>
    80005ecc:	08813083          	ld	ra,136(sp)
    80005ed0:	08013403          	ld	s0,128(sp)
    80005ed4:	07813483          	ld	s1,120(sp)
    80005ed8:	07013903          	ld	s2,112(sp)
    80005edc:	06813983          	ld	s3,104(sp)
    80005ee0:	06013a03          	ld	s4,96(sp)
    80005ee4:	05813a83          	ld	s5,88(sp)
    80005ee8:	05013b03          	ld	s6,80(sp)
    80005eec:	04813b83          	ld	s7,72(sp)
    80005ef0:	04013c03          	ld	s8,64(sp)
    80005ef4:	03813c83          	ld	s9,56(sp)
    80005ef8:	03013d03          	ld	s10,48(sp)
    80005efc:	02813d83          	ld	s11,40(sp)
    80005f00:	0d010113          	addi	sp,sp,208
    80005f04:	00008067          	ret
    80005f08:	07300713          	li	a4,115
    80005f0c:	1ce78a63          	beq	a5,a4,800060e0 <__printf+0x4b8>
    80005f10:	07800713          	li	a4,120
    80005f14:	1ee79e63          	bne	a5,a4,80006110 <__printf+0x4e8>
    80005f18:	f7843783          	ld	a5,-136(s0)
    80005f1c:	0007a703          	lw	a4,0(a5)
    80005f20:	00878793          	addi	a5,a5,8
    80005f24:	f6f43c23          	sd	a5,-136(s0)
    80005f28:	28074263          	bltz	a4,800061ac <__printf+0x584>
    80005f2c:	00002d97          	auipc	s11,0x2
    80005f30:	70cd8d93          	addi	s11,s11,1804 # 80008638 <digits>
    80005f34:	00f77793          	andi	a5,a4,15
    80005f38:	00fd87b3          	add	a5,s11,a5
    80005f3c:	0007c683          	lbu	a3,0(a5)
    80005f40:	00f00613          	li	a2,15
    80005f44:	0007079b          	sext.w	a5,a4
    80005f48:	f8d40023          	sb	a3,-128(s0)
    80005f4c:	0047559b          	srliw	a1,a4,0x4
    80005f50:	0047569b          	srliw	a3,a4,0x4
    80005f54:	00000c93          	li	s9,0
    80005f58:	0ee65063          	bge	a2,a4,80006038 <__printf+0x410>
    80005f5c:	00f6f693          	andi	a3,a3,15
    80005f60:	00dd86b3          	add	a3,s11,a3
    80005f64:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80005f68:	0087d79b          	srliw	a5,a5,0x8
    80005f6c:	00100c93          	li	s9,1
    80005f70:	f8d400a3          	sb	a3,-127(s0)
    80005f74:	0cb67263          	bgeu	a2,a1,80006038 <__printf+0x410>
    80005f78:	00f7f693          	andi	a3,a5,15
    80005f7c:	00dd86b3          	add	a3,s11,a3
    80005f80:	0006c583          	lbu	a1,0(a3)
    80005f84:	00f00613          	li	a2,15
    80005f88:	0047d69b          	srliw	a3,a5,0x4
    80005f8c:	f8b40123          	sb	a1,-126(s0)
    80005f90:	0047d593          	srli	a1,a5,0x4
    80005f94:	28f67e63          	bgeu	a2,a5,80006230 <__printf+0x608>
    80005f98:	00f6f693          	andi	a3,a3,15
    80005f9c:	00dd86b3          	add	a3,s11,a3
    80005fa0:	0006c503          	lbu	a0,0(a3)
    80005fa4:	0087d813          	srli	a6,a5,0x8
    80005fa8:	0087d69b          	srliw	a3,a5,0x8
    80005fac:	f8a401a3          	sb	a0,-125(s0)
    80005fb0:	28b67663          	bgeu	a2,a1,8000623c <__printf+0x614>
    80005fb4:	00f6f693          	andi	a3,a3,15
    80005fb8:	00dd86b3          	add	a3,s11,a3
    80005fbc:	0006c583          	lbu	a1,0(a3)
    80005fc0:	00c7d513          	srli	a0,a5,0xc
    80005fc4:	00c7d69b          	srliw	a3,a5,0xc
    80005fc8:	f8b40223          	sb	a1,-124(s0)
    80005fcc:	29067a63          	bgeu	a2,a6,80006260 <__printf+0x638>
    80005fd0:	00f6f693          	andi	a3,a3,15
    80005fd4:	00dd86b3          	add	a3,s11,a3
    80005fd8:	0006c583          	lbu	a1,0(a3)
    80005fdc:	0107d813          	srli	a6,a5,0x10
    80005fe0:	0107d69b          	srliw	a3,a5,0x10
    80005fe4:	f8b402a3          	sb	a1,-123(s0)
    80005fe8:	28a67263          	bgeu	a2,a0,8000626c <__printf+0x644>
    80005fec:	00f6f693          	andi	a3,a3,15
    80005ff0:	00dd86b3          	add	a3,s11,a3
    80005ff4:	0006c683          	lbu	a3,0(a3)
    80005ff8:	0147d79b          	srliw	a5,a5,0x14
    80005ffc:	f8d40323          	sb	a3,-122(s0)
    80006000:	21067663          	bgeu	a2,a6,8000620c <__printf+0x5e4>
    80006004:	02079793          	slli	a5,a5,0x20
    80006008:	0207d793          	srli	a5,a5,0x20
    8000600c:	00fd8db3          	add	s11,s11,a5
    80006010:	000dc683          	lbu	a3,0(s11)
    80006014:	00800793          	li	a5,8
    80006018:	00700c93          	li	s9,7
    8000601c:	f8d403a3          	sb	a3,-121(s0)
    80006020:	00075c63          	bgez	a4,80006038 <__printf+0x410>
    80006024:	f9040713          	addi	a4,s0,-112
    80006028:	00f70733          	add	a4,a4,a5
    8000602c:	02d00693          	li	a3,45
    80006030:	fed70823          	sb	a3,-16(a4)
    80006034:	00078c93          	mv	s9,a5
    80006038:	f8040793          	addi	a5,s0,-128
    8000603c:	01978cb3          	add	s9,a5,s9
    80006040:	f7f40d13          	addi	s10,s0,-129
    80006044:	000cc503          	lbu	a0,0(s9)
    80006048:	fffc8c93          	addi	s9,s9,-1
    8000604c:	00000097          	auipc	ra,0x0
    80006050:	9f8080e7          	jalr	-1544(ra) # 80005a44 <consputc>
    80006054:	ff9d18e3          	bne	s10,s9,80006044 <__printf+0x41c>
    80006058:	0100006f          	j	80006068 <__printf+0x440>
    8000605c:	00000097          	auipc	ra,0x0
    80006060:	9e8080e7          	jalr	-1560(ra) # 80005a44 <consputc>
    80006064:	000c8493          	mv	s1,s9
    80006068:	00094503          	lbu	a0,0(s2)
    8000606c:	c60510e3          	bnez	a0,80005ccc <__printf+0xa4>
    80006070:	e40c0ee3          	beqz	s8,80005ecc <__printf+0x2a4>
    80006074:	00005517          	auipc	a0,0x5
    80006078:	02c50513          	addi	a0,a0,44 # 8000b0a0 <pr>
    8000607c:	00001097          	auipc	ra,0x1
    80006080:	94c080e7          	jalr	-1716(ra) # 800069c8 <release>
    80006084:	e49ff06f          	j	80005ecc <__printf+0x2a4>
    80006088:	f7843783          	ld	a5,-136(s0)
    8000608c:	03000513          	li	a0,48
    80006090:	01000d13          	li	s10,16
    80006094:	00878713          	addi	a4,a5,8
    80006098:	0007bc83          	ld	s9,0(a5)
    8000609c:	f6e43c23          	sd	a4,-136(s0)
    800060a0:	00000097          	auipc	ra,0x0
    800060a4:	9a4080e7          	jalr	-1628(ra) # 80005a44 <consputc>
    800060a8:	07800513          	li	a0,120
    800060ac:	00000097          	auipc	ra,0x0
    800060b0:	998080e7          	jalr	-1640(ra) # 80005a44 <consputc>
    800060b4:	00002d97          	auipc	s11,0x2
    800060b8:	584d8d93          	addi	s11,s11,1412 # 80008638 <digits>
    800060bc:	03ccd793          	srli	a5,s9,0x3c
    800060c0:	00fd87b3          	add	a5,s11,a5
    800060c4:	0007c503          	lbu	a0,0(a5)
    800060c8:	fffd0d1b          	addiw	s10,s10,-1
    800060cc:	004c9c93          	slli	s9,s9,0x4
    800060d0:	00000097          	auipc	ra,0x0
    800060d4:	974080e7          	jalr	-1676(ra) # 80005a44 <consputc>
    800060d8:	fe0d12e3          	bnez	s10,800060bc <__printf+0x494>
    800060dc:	f8dff06f          	j	80006068 <__printf+0x440>
    800060e0:	f7843783          	ld	a5,-136(s0)
    800060e4:	0007bc83          	ld	s9,0(a5)
    800060e8:	00878793          	addi	a5,a5,8
    800060ec:	f6f43c23          	sd	a5,-136(s0)
    800060f0:	000c9a63          	bnez	s9,80006104 <__printf+0x4dc>
    800060f4:	1080006f          	j	800061fc <__printf+0x5d4>
    800060f8:	001c8c93          	addi	s9,s9,1
    800060fc:	00000097          	auipc	ra,0x0
    80006100:	948080e7          	jalr	-1720(ra) # 80005a44 <consputc>
    80006104:	000cc503          	lbu	a0,0(s9)
    80006108:	fe0518e3          	bnez	a0,800060f8 <__printf+0x4d0>
    8000610c:	f5dff06f          	j	80006068 <__printf+0x440>
    80006110:	02500513          	li	a0,37
    80006114:	00000097          	auipc	ra,0x0
    80006118:	930080e7          	jalr	-1744(ra) # 80005a44 <consputc>
    8000611c:	000c8513          	mv	a0,s9
    80006120:	00000097          	auipc	ra,0x0
    80006124:	924080e7          	jalr	-1756(ra) # 80005a44 <consputc>
    80006128:	f41ff06f          	j	80006068 <__printf+0x440>
    8000612c:	02500513          	li	a0,37
    80006130:	00000097          	auipc	ra,0x0
    80006134:	914080e7          	jalr	-1772(ra) # 80005a44 <consputc>
    80006138:	f31ff06f          	j	80006068 <__printf+0x440>
    8000613c:	00030513          	mv	a0,t1
    80006140:	00000097          	auipc	ra,0x0
    80006144:	7bc080e7          	jalr	1980(ra) # 800068fc <acquire>
    80006148:	b4dff06f          	j	80005c94 <__printf+0x6c>
    8000614c:	40c0053b          	negw	a0,a2
    80006150:	00a00713          	li	a4,10
    80006154:	02e576bb          	remuw	a3,a0,a4
    80006158:	00002d97          	auipc	s11,0x2
    8000615c:	4e0d8d93          	addi	s11,s11,1248 # 80008638 <digits>
    80006160:	ff700593          	li	a1,-9
    80006164:	02069693          	slli	a3,a3,0x20
    80006168:	0206d693          	srli	a3,a3,0x20
    8000616c:	00dd86b3          	add	a3,s11,a3
    80006170:	0006c683          	lbu	a3,0(a3)
    80006174:	02e557bb          	divuw	a5,a0,a4
    80006178:	f8d40023          	sb	a3,-128(s0)
    8000617c:	10b65e63          	bge	a2,a1,80006298 <__printf+0x670>
    80006180:	06300593          	li	a1,99
    80006184:	02e7f6bb          	remuw	a3,a5,a4
    80006188:	02069693          	slli	a3,a3,0x20
    8000618c:	0206d693          	srli	a3,a3,0x20
    80006190:	00dd86b3          	add	a3,s11,a3
    80006194:	0006c683          	lbu	a3,0(a3)
    80006198:	02e7d73b          	divuw	a4,a5,a4
    8000619c:	00200793          	li	a5,2
    800061a0:	f8d400a3          	sb	a3,-127(s0)
    800061a4:	bca5ece3          	bltu	a1,a0,80005d7c <__printf+0x154>
    800061a8:	ce5ff06f          	j	80005e8c <__printf+0x264>
    800061ac:	40e007bb          	negw	a5,a4
    800061b0:	00002d97          	auipc	s11,0x2
    800061b4:	488d8d93          	addi	s11,s11,1160 # 80008638 <digits>
    800061b8:	00f7f693          	andi	a3,a5,15
    800061bc:	00dd86b3          	add	a3,s11,a3
    800061c0:	0006c583          	lbu	a1,0(a3)
    800061c4:	ff100613          	li	a2,-15
    800061c8:	0047d69b          	srliw	a3,a5,0x4
    800061cc:	f8b40023          	sb	a1,-128(s0)
    800061d0:	0047d59b          	srliw	a1,a5,0x4
    800061d4:	0ac75e63          	bge	a4,a2,80006290 <__printf+0x668>
    800061d8:	00f6f693          	andi	a3,a3,15
    800061dc:	00dd86b3          	add	a3,s11,a3
    800061e0:	0006c603          	lbu	a2,0(a3)
    800061e4:	00f00693          	li	a3,15
    800061e8:	0087d79b          	srliw	a5,a5,0x8
    800061ec:	f8c400a3          	sb	a2,-127(s0)
    800061f0:	d8b6e4e3          	bltu	a3,a1,80005f78 <__printf+0x350>
    800061f4:	00200793          	li	a5,2
    800061f8:	e2dff06f          	j	80006024 <__printf+0x3fc>
    800061fc:	00002c97          	auipc	s9,0x2
    80006200:	41cc8c93          	addi	s9,s9,1052 # 80008618 <_ZL6digits+0x150>
    80006204:	02800513          	li	a0,40
    80006208:	ef1ff06f          	j	800060f8 <__printf+0x4d0>
    8000620c:	00700793          	li	a5,7
    80006210:	00600c93          	li	s9,6
    80006214:	e0dff06f          	j	80006020 <__printf+0x3f8>
    80006218:	00700793          	li	a5,7
    8000621c:	00600c93          	li	s9,6
    80006220:	c69ff06f          	j	80005e88 <__printf+0x260>
    80006224:	00300793          	li	a5,3
    80006228:	00200c93          	li	s9,2
    8000622c:	c5dff06f          	j	80005e88 <__printf+0x260>
    80006230:	00300793          	li	a5,3
    80006234:	00200c93          	li	s9,2
    80006238:	de9ff06f          	j	80006020 <__printf+0x3f8>
    8000623c:	00400793          	li	a5,4
    80006240:	00300c93          	li	s9,3
    80006244:	dddff06f          	j	80006020 <__printf+0x3f8>
    80006248:	00400793          	li	a5,4
    8000624c:	00300c93          	li	s9,3
    80006250:	c39ff06f          	j	80005e88 <__printf+0x260>
    80006254:	00500793          	li	a5,5
    80006258:	00400c93          	li	s9,4
    8000625c:	c2dff06f          	j	80005e88 <__printf+0x260>
    80006260:	00500793          	li	a5,5
    80006264:	00400c93          	li	s9,4
    80006268:	db9ff06f          	j	80006020 <__printf+0x3f8>
    8000626c:	00600793          	li	a5,6
    80006270:	00500c93          	li	s9,5
    80006274:	dadff06f          	j	80006020 <__printf+0x3f8>
    80006278:	00600793          	li	a5,6
    8000627c:	00500c93          	li	s9,5
    80006280:	c09ff06f          	j	80005e88 <__printf+0x260>
    80006284:	00800793          	li	a5,8
    80006288:	00700c93          	li	s9,7
    8000628c:	bfdff06f          	j	80005e88 <__printf+0x260>
    80006290:	00100793          	li	a5,1
    80006294:	d91ff06f          	j	80006024 <__printf+0x3fc>
    80006298:	00100793          	li	a5,1
    8000629c:	bf1ff06f          	j	80005e8c <__printf+0x264>
    800062a0:	00900793          	li	a5,9
    800062a4:	00800c93          	li	s9,8
    800062a8:	be1ff06f          	j	80005e88 <__printf+0x260>
    800062ac:	00002517          	auipc	a0,0x2
    800062b0:	37450513          	addi	a0,a0,884 # 80008620 <_ZL6digits+0x158>
    800062b4:	00000097          	auipc	ra,0x0
    800062b8:	918080e7          	jalr	-1768(ra) # 80005bcc <panic>

00000000800062bc <printfinit>:
    800062bc:	fe010113          	addi	sp,sp,-32
    800062c0:	00813823          	sd	s0,16(sp)
    800062c4:	00913423          	sd	s1,8(sp)
    800062c8:	00113c23          	sd	ra,24(sp)
    800062cc:	02010413          	addi	s0,sp,32
    800062d0:	00005497          	auipc	s1,0x5
    800062d4:	dd048493          	addi	s1,s1,-560 # 8000b0a0 <pr>
    800062d8:	00048513          	mv	a0,s1
    800062dc:	00002597          	auipc	a1,0x2
    800062e0:	35458593          	addi	a1,a1,852 # 80008630 <_ZL6digits+0x168>
    800062e4:	00000097          	auipc	ra,0x0
    800062e8:	5f4080e7          	jalr	1524(ra) # 800068d8 <initlock>
    800062ec:	01813083          	ld	ra,24(sp)
    800062f0:	01013403          	ld	s0,16(sp)
    800062f4:	0004ac23          	sw	zero,24(s1)
    800062f8:	00813483          	ld	s1,8(sp)
    800062fc:	02010113          	addi	sp,sp,32
    80006300:	00008067          	ret

0000000080006304 <uartinit>:
    80006304:	ff010113          	addi	sp,sp,-16
    80006308:	00813423          	sd	s0,8(sp)
    8000630c:	01010413          	addi	s0,sp,16
    80006310:	100007b7          	lui	a5,0x10000
    80006314:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80006318:	f8000713          	li	a4,-128
    8000631c:	00e781a3          	sb	a4,3(a5)
    80006320:	00300713          	li	a4,3
    80006324:	00e78023          	sb	a4,0(a5)
    80006328:	000780a3          	sb	zero,1(a5)
    8000632c:	00e781a3          	sb	a4,3(a5)
    80006330:	00700693          	li	a3,7
    80006334:	00d78123          	sb	a3,2(a5)
    80006338:	00e780a3          	sb	a4,1(a5)
    8000633c:	00813403          	ld	s0,8(sp)
    80006340:	01010113          	addi	sp,sp,16
    80006344:	00008067          	ret

0000000080006348 <uartputc>:
    80006348:	00004797          	auipc	a5,0x4
    8000634c:	ab07a783          	lw	a5,-1360(a5) # 80009df8 <panicked>
    80006350:	00078463          	beqz	a5,80006358 <uartputc+0x10>
    80006354:	0000006f          	j	80006354 <uartputc+0xc>
    80006358:	fd010113          	addi	sp,sp,-48
    8000635c:	02813023          	sd	s0,32(sp)
    80006360:	00913c23          	sd	s1,24(sp)
    80006364:	01213823          	sd	s2,16(sp)
    80006368:	01313423          	sd	s3,8(sp)
    8000636c:	02113423          	sd	ra,40(sp)
    80006370:	03010413          	addi	s0,sp,48
    80006374:	00004917          	auipc	s2,0x4
    80006378:	a8c90913          	addi	s2,s2,-1396 # 80009e00 <uart_tx_r>
    8000637c:	00093783          	ld	a5,0(s2)
    80006380:	00004497          	auipc	s1,0x4
    80006384:	a8848493          	addi	s1,s1,-1400 # 80009e08 <uart_tx_w>
    80006388:	0004b703          	ld	a4,0(s1)
    8000638c:	02078693          	addi	a3,a5,32
    80006390:	00050993          	mv	s3,a0
    80006394:	02e69c63          	bne	a3,a4,800063cc <uartputc+0x84>
    80006398:	00001097          	auipc	ra,0x1
    8000639c:	834080e7          	jalr	-1996(ra) # 80006bcc <push_on>
    800063a0:	00093783          	ld	a5,0(s2)
    800063a4:	0004b703          	ld	a4,0(s1)
    800063a8:	02078793          	addi	a5,a5,32
    800063ac:	00e79463          	bne	a5,a4,800063b4 <uartputc+0x6c>
    800063b0:	0000006f          	j	800063b0 <uartputc+0x68>
    800063b4:	00001097          	auipc	ra,0x1
    800063b8:	88c080e7          	jalr	-1908(ra) # 80006c40 <pop_on>
    800063bc:	00093783          	ld	a5,0(s2)
    800063c0:	0004b703          	ld	a4,0(s1)
    800063c4:	02078693          	addi	a3,a5,32
    800063c8:	fce688e3          	beq	a3,a4,80006398 <uartputc+0x50>
    800063cc:	01f77693          	andi	a3,a4,31
    800063d0:	00005597          	auipc	a1,0x5
    800063d4:	cf058593          	addi	a1,a1,-784 # 8000b0c0 <uart_tx_buf>
    800063d8:	00d586b3          	add	a3,a1,a3
    800063dc:	00170713          	addi	a4,a4,1
    800063e0:	01368023          	sb	s3,0(a3)
    800063e4:	00e4b023          	sd	a4,0(s1)
    800063e8:	10000637          	lui	a2,0x10000
    800063ec:	02f71063          	bne	a4,a5,8000640c <uartputc+0xc4>
    800063f0:	0340006f          	j	80006424 <uartputc+0xdc>
    800063f4:	00074703          	lbu	a4,0(a4)
    800063f8:	00f93023          	sd	a5,0(s2)
    800063fc:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80006400:	00093783          	ld	a5,0(s2)
    80006404:	0004b703          	ld	a4,0(s1)
    80006408:	00f70e63          	beq	a4,a5,80006424 <uartputc+0xdc>
    8000640c:	00564683          	lbu	a3,5(a2)
    80006410:	01f7f713          	andi	a4,a5,31
    80006414:	00e58733          	add	a4,a1,a4
    80006418:	0206f693          	andi	a3,a3,32
    8000641c:	00178793          	addi	a5,a5,1
    80006420:	fc069ae3          	bnez	a3,800063f4 <uartputc+0xac>
    80006424:	02813083          	ld	ra,40(sp)
    80006428:	02013403          	ld	s0,32(sp)
    8000642c:	01813483          	ld	s1,24(sp)
    80006430:	01013903          	ld	s2,16(sp)
    80006434:	00813983          	ld	s3,8(sp)
    80006438:	03010113          	addi	sp,sp,48
    8000643c:	00008067          	ret

0000000080006440 <uartputc_sync>:
    80006440:	ff010113          	addi	sp,sp,-16
    80006444:	00813423          	sd	s0,8(sp)
    80006448:	01010413          	addi	s0,sp,16
    8000644c:	00004717          	auipc	a4,0x4
    80006450:	9ac72703          	lw	a4,-1620(a4) # 80009df8 <panicked>
    80006454:	02071663          	bnez	a4,80006480 <uartputc_sync+0x40>
    80006458:	00050793          	mv	a5,a0
    8000645c:	100006b7          	lui	a3,0x10000
    80006460:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80006464:	02077713          	andi	a4,a4,32
    80006468:	fe070ce3          	beqz	a4,80006460 <uartputc_sync+0x20>
    8000646c:	0ff7f793          	andi	a5,a5,255
    80006470:	00f68023          	sb	a5,0(a3)
    80006474:	00813403          	ld	s0,8(sp)
    80006478:	01010113          	addi	sp,sp,16
    8000647c:	00008067          	ret
    80006480:	0000006f          	j	80006480 <uartputc_sync+0x40>

0000000080006484 <uartstart>:
    80006484:	ff010113          	addi	sp,sp,-16
    80006488:	00813423          	sd	s0,8(sp)
    8000648c:	01010413          	addi	s0,sp,16
    80006490:	00004617          	auipc	a2,0x4
    80006494:	97060613          	addi	a2,a2,-1680 # 80009e00 <uart_tx_r>
    80006498:	00004517          	auipc	a0,0x4
    8000649c:	97050513          	addi	a0,a0,-1680 # 80009e08 <uart_tx_w>
    800064a0:	00063783          	ld	a5,0(a2)
    800064a4:	00053703          	ld	a4,0(a0)
    800064a8:	04f70263          	beq	a4,a5,800064ec <uartstart+0x68>
    800064ac:	100005b7          	lui	a1,0x10000
    800064b0:	00005817          	auipc	a6,0x5
    800064b4:	c1080813          	addi	a6,a6,-1008 # 8000b0c0 <uart_tx_buf>
    800064b8:	01c0006f          	j	800064d4 <uartstart+0x50>
    800064bc:	0006c703          	lbu	a4,0(a3)
    800064c0:	00f63023          	sd	a5,0(a2)
    800064c4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800064c8:	00063783          	ld	a5,0(a2)
    800064cc:	00053703          	ld	a4,0(a0)
    800064d0:	00f70e63          	beq	a4,a5,800064ec <uartstart+0x68>
    800064d4:	01f7f713          	andi	a4,a5,31
    800064d8:	00e806b3          	add	a3,a6,a4
    800064dc:	0055c703          	lbu	a4,5(a1)
    800064e0:	00178793          	addi	a5,a5,1
    800064e4:	02077713          	andi	a4,a4,32
    800064e8:	fc071ae3          	bnez	a4,800064bc <uartstart+0x38>
    800064ec:	00813403          	ld	s0,8(sp)
    800064f0:	01010113          	addi	sp,sp,16
    800064f4:	00008067          	ret

00000000800064f8 <uartgetc>:
    800064f8:	ff010113          	addi	sp,sp,-16
    800064fc:	00813423          	sd	s0,8(sp)
    80006500:	01010413          	addi	s0,sp,16
    80006504:	10000737          	lui	a4,0x10000
    80006508:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000650c:	0017f793          	andi	a5,a5,1
    80006510:	00078c63          	beqz	a5,80006528 <uartgetc+0x30>
    80006514:	00074503          	lbu	a0,0(a4)
    80006518:	0ff57513          	andi	a0,a0,255
    8000651c:	00813403          	ld	s0,8(sp)
    80006520:	01010113          	addi	sp,sp,16
    80006524:	00008067          	ret
    80006528:	fff00513          	li	a0,-1
    8000652c:	ff1ff06f          	j	8000651c <uartgetc+0x24>

0000000080006530 <uartintr>:
    80006530:	100007b7          	lui	a5,0x10000
    80006534:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80006538:	0017f793          	andi	a5,a5,1
    8000653c:	0a078463          	beqz	a5,800065e4 <uartintr+0xb4>
    80006540:	fe010113          	addi	sp,sp,-32
    80006544:	00813823          	sd	s0,16(sp)
    80006548:	00913423          	sd	s1,8(sp)
    8000654c:	00113c23          	sd	ra,24(sp)
    80006550:	02010413          	addi	s0,sp,32
    80006554:	100004b7          	lui	s1,0x10000
    80006558:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000655c:	0ff57513          	andi	a0,a0,255
    80006560:	fffff097          	auipc	ra,0xfffff
    80006564:	534080e7          	jalr	1332(ra) # 80005a94 <consoleintr>
    80006568:	0054c783          	lbu	a5,5(s1)
    8000656c:	0017f793          	andi	a5,a5,1
    80006570:	fe0794e3          	bnez	a5,80006558 <uartintr+0x28>
    80006574:	00004617          	auipc	a2,0x4
    80006578:	88c60613          	addi	a2,a2,-1908 # 80009e00 <uart_tx_r>
    8000657c:	00004517          	auipc	a0,0x4
    80006580:	88c50513          	addi	a0,a0,-1908 # 80009e08 <uart_tx_w>
    80006584:	00063783          	ld	a5,0(a2)
    80006588:	00053703          	ld	a4,0(a0)
    8000658c:	04f70263          	beq	a4,a5,800065d0 <uartintr+0xa0>
    80006590:	100005b7          	lui	a1,0x10000
    80006594:	00005817          	auipc	a6,0x5
    80006598:	b2c80813          	addi	a6,a6,-1236 # 8000b0c0 <uart_tx_buf>
    8000659c:	01c0006f          	j	800065b8 <uartintr+0x88>
    800065a0:	0006c703          	lbu	a4,0(a3)
    800065a4:	00f63023          	sd	a5,0(a2)
    800065a8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800065ac:	00063783          	ld	a5,0(a2)
    800065b0:	00053703          	ld	a4,0(a0)
    800065b4:	00f70e63          	beq	a4,a5,800065d0 <uartintr+0xa0>
    800065b8:	01f7f713          	andi	a4,a5,31
    800065bc:	00e806b3          	add	a3,a6,a4
    800065c0:	0055c703          	lbu	a4,5(a1)
    800065c4:	00178793          	addi	a5,a5,1
    800065c8:	02077713          	andi	a4,a4,32
    800065cc:	fc071ae3          	bnez	a4,800065a0 <uartintr+0x70>
    800065d0:	01813083          	ld	ra,24(sp)
    800065d4:	01013403          	ld	s0,16(sp)
    800065d8:	00813483          	ld	s1,8(sp)
    800065dc:	02010113          	addi	sp,sp,32
    800065e0:	00008067          	ret
    800065e4:	00004617          	auipc	a2,0x4
    800065e8:	81c60613          	addi	a2,a2,-2020 # 80009e00 <uart_tx_r>
    800065ec:	00004517          	auipc	a0,0x4
    800065f0:	81c50513          	addi	a0,a0,-2020 # 80009e08 <uart_tx_w>
    800065f4:	00063783          	ld	a5,0(a2)
    800065f8:	00053703          	ld	a4,0(a0)
    800065fc:	04f70263          	beq	a4,a5,80006640 <uartintr+0x110>
    80006600:	100005b7          	lui	a1,0x10000
    80006604:	00005817          	auipc	a6,0x5
    80006608:	abc80813          	addi	a6,a6,-1348 # 8000b0c0 <uart_tx_buf>
    8000660c:	01c0006f          	j	80006628 <uartintr+0xf8>
    80006610:	0006c703          	lbu	a4,0(a3)
    80006614:	00f63023          	sd	a5,0(a2)
    80006618:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000661c:	00063783          	ld	a5,0(a2)
    80006620:	00053703          	ld	a4,0(a0)
    80006624:	02f70063          	beq	a4,a5,80006644 <uartintr+0x114>
    80006628:	01f7f713          	andi	a4,a5,31
    8000662c:	00e806b3          	add	a3,a6,a4
    80006630:	0055c703          	lbu	a4,5(a1)
    80006634:	00178793          	addi	a5,a5,1
    80006638:	02077713          	andi	a4,a4,32
    8000663c:	fc071ae3          	bnez	a4,80006610 <uartintr+0xe0>
    80006640:	00008067          	ret
    80006644:	00008067          	ret

0000000080006648 <kinit>:
    80006648:	fc010113          	addi	sp,sp,-64
    8000664c:	02913423          	sd	s1,40(sp)
    80006650:	fffff7b7          	lui	a5,0xfffff
    80006654:	00006497          	auipc	s1,0x6
    80006658:	a8b48493          	addi	s1,s1,-1397 # 8000c0df <end+0xfff>
    8000665c:	02813823          	sd	s0,48(sp)
    80006660:	01313c23          	sd	s3,24(sp)
    80006664:	00f4f4b3          	and	s1,s1,a5
    80006668:	02113c23          	sd	ra,56(sp)
    8000666c:	03213023          	sd	s2,32(sp)
    80006670:	01413823          	sd	s4,16(sp)
    80006674:	01513423          	sd	s5,8(sp)
    80006678:	04010413          	addi	s0,sp,64
    8000667c:	000017b7          	lui	a5,0x1
    80006680:	01100993          	li	s3,17
    80006684:	00f487b3          	add	a5,s1,a5
    80006688:	01b99993          	slli	s3,s3,0x1b
    8000668c:	06f9e063          	bltu	s3,a5,800066ec <kinit+0xa4>
    80006690:	00005a97          	auipc	s5,0x5
    80006694:	a50a8a93          	addi	s5,s5,-1456 # 8000b0e0 <end>
    80006698:	0754ec63          	bltu	s1,s5,80006710 <kinit+0xc8>
    8000669c:	0734fa63          	bgeu	s1,s3,80006710 <kinit+0xc8>
    800066a0:	00088a37          	lui	s4,0x88
    800066a4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    800066a8:	00003917          	auipc	s2,0x3
    800066ac:	76890913          	addi	s2,s2,1896 # 80009e10 <kmem>
    800066b0:	00ca1a13          	slli	s4,s4,0xc
    800066b4:	0140006f          	j	800066c8 <kinit+0x80>
    800066b8:	000017b7          	lui	a5,0x1
    800066bc:	00f484b3          	add	s1,s1,a5
    800066c0:	0554e863          	bltu	s1,s5,80006710 <kinit+0xc8>
    800066c4:	0534f663          	bgeu	s1,s3,80006710 <kinit+0xc8>
    800066c8:	00001637          	lui	a2,0x1
    800066cc:	00100593          	li	a1,1
    800066d0:	00048513          	mv	a0,s1
    800066d4:	00000097          	auipc	ra,0x0
    800066d8:	5e4080e7          	jalr	1508(ra) # 80006cb8 <__memset>
    800066dc:	00093783          	ld	a5,0(s2)
    800066e0:	00f4b023          	sd	a5,0(s1)
    800066e4:	00993023          	sd	s1,0(s2)
    800066e8:	fd4498e3          	bne	s1,s4,800066b8 <kinit+0x70>
    800066ec:	03813083          	ld	ra,56(sp)
    800066f0:	03013403          	ld	s0,48(sp)
    800066f4:	02813483          	ld	s1,40(sp)
    800066f8:	02013903          	ld	s2,32(sp)
    800066fc:	01813983          	ld	s3,24(sp)
    80006700:	01013a03          	ld	s4,16(sp)
    80006704:	00813a83          	ld	s5,8(sp)
    80006708:	04010113          	addi	sp,sp,64
    8000670c:	00008067          	ret
    80006710:	00002517          	auipc	a0,0x2
    80006714:	f4050513          	addi	a0,a0,-192 # 80008650 <digits+0x18>
    80006718:	fffff097          	auipc	ra,0xfffff
    8000671c:	4b4080e7          	jalr	1204(ra) # 80005bcc <panic>

0000000080006720 <freerange>:
    80006720:	fc010113          	addi	sp,sp,-64
    80006724:	000017b7          	lui	a5,0x1
    80006728:	02913423          	sd	s1,40(sp)
    8000672c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80006730:	009504b3          	add	s1,a0,s1
    80006734:	fffff537          	lui	a0,0xfffff
    80006738:	02813823          	sd	s0,48(sp)
    8000673c:	02113c23          	sd	ra,56(sp)
    80006740:	03213023          	sd	s2,32(sp)
    80006744:	01313c23          	sd	s3,24(sp)
    80006748:	01413823          	sd	s4,16(sp)
    8000674c:	01513423          	sd	s5,8(sp)
    80006750:	01613023          	sd	s6,0(sp)
    80006754:	04010413          	addi	s0,sp,64
    80006758:	00a4f4b3          	and	s1,s1,a0
    8000675c:	00f487b3          	add	a5,s1,a5
    80006760:	06f5e463          	bltu	a1,a5,800067c8 <freerange+0xa8>
    80006764:	00005a97          	auipc	s5,0x5
    80006768:	97ca8a93          	addi	s5,s5,-1668 # 8000b0e0 <end>
    8000676c:	0954e263          	bltu	s1,s5,800067f0 <freerange+0xd0>
    80006770:	01100993          	li	s3,17
    80006774:	01b99993          	slli	s3,s3,0x1b
    80006778:	0734fc63          	bgeu	s1,s3,800067f0 <freerange+0xd0>
    8000677c:	00058a13          	mv	s4,a1
    80006780:	00003917          	auipc	s2,0x3
    80006784:	69090913          	addi	s2,s2,1680 # 80009e10 <kmem>
    80006788:	00002b37          	lui	s6,0x2
    8000678c:	0140006f          	j	800067a0 <freerange+0x80>
    80006790:	000017b7          	lui	a5,0x1
    80006794:	00f484b3          	add	s1,s1,a5
    80006798:	0554ec63          	bltu	s1,s5,800067f0 <freerange+0xd0>
    8000679c:	0534fa63          	bgeu	s1,s3,800067f0 <freerange+0xd0>
    800067a0:	00001637          	lui	a2,0x1
    800067a4:	00100593          	li	a1,1
    800067a8:	00048513          	mv	a0,s1
    800067ac:	00000097          	auipc	ra,0x0
    800067b0:	50c080e7          	jalr	1292(ra) # 80006cb8 <__memset>
    800067b4:	00093703          	ld	a4,0(s2)
    800067b8:	016487b3          	add	a5,s1,s6
    800067bc:	00e4b023          	sd	a4,0(s1)
    800067c0:	00993023          	sd	s1,0(s2)
    800067c4:	fcfa76e3          	bgeu	s4,a5,80006790 <freerange+0x70>
    800067c8:	03813083          	ld	ra,56(sp)
    800067cc:	03013403          	ld	s0,48(sp)
    800067d0:	02813483          	ld	s1,40(sp)
    800067d4:	02013903          	ld	s2,32(sp)
    800067d8:	01813983          	ld	s3,24(sp)
    800067dc:	01013a03          	ld	s4,16(sp)
    800067e0:	00813a83          	ld	s5,8(sp)
    800067e4:	00013b03          	ld	s6,0(sp)
    800067e8:	04010113          	addi	sp,sp,64
    800067ec:	00008067          	ret
    800067f0:	00002517          	auipc	a0,0x2
    800067f4:	e6050513          	addi	a0,a0,-416 # 80008650 <digits+0x18>
    800067f8:	fffff097          	auipc	ra,0xfffff
    800067fc:	3d4080e7          	jalr	980(ra) # 80005bcc <panic>

0000000080006800 <kfree>:
    80006800:	fe010113          	addi	sp,sp,-32
    80006804:	00813823          	sd	s0,16(sp)
    80006808:	00113c23          	sd	ra,24(sp)
    8000680c:	00913423          	sd	s1,8(sp)
    80006810:	02010413          	addi	s0,sp,32
    80006814:	03451793          	slli	a5,a0,0x34
    80006818:	04079c63          	bnez	a5,80006870 <kfree+0x70>
    8000681c:	00005797          	auipc	a5,0x5
    80006820:	8c478793          	addi	a5,a5,-1852 # 8000b0e0 <end>
    80006824:	00050493          	mv	s1,a0
    80006828:	04f56463          	bltu	a0,a5,80006870 <kfree+0x70>
    8000682c:	01100793          	li	a5,17
    80006830:	01b79793          	slli	a5,a5,0x1b
    80006834:	02f57e63          	bgeu	a0,a5,80006870 <kfree+0x70>
    80006838:	00001637          	lui	a2,0x1
    8000683c:	00100593          	li	a1,1
    80006840:	00000097          	auipc	ra,0x0
    80006844:	478080e7          	jalr	1144(ra) # 80006cb8 <__memset>
    80006848:	00003797          	auipc	a5,0x3
    8000684c:	5c878793          	addi	a5,a5,1480 # 80009e10 <kmem>
    80006850:	0007b703          	ld	a4,0(a5)
    80006854:	01813083          	ld	ra,24(sp)
    80006858:	01013403          	ld	s0,16(sp)
    8000685c:	00e4b023          	sd	a4,0(s1)
    80006860:	0097b023          	sd	s1,0(a5)
    80006864:	00813483          	ld	s1,8(sp)
    80006868:	02010113          	addi	sp,sp,32
    8000686c:	00008067          	ret
    80006870:	00002517          	auipc	a0,0x2
    80006874:	de050513          	addi	a0,a0,-544 # 80008650 <digits+0x18>
    80006878:	fffff097          	auipc	ra,0xfffff
    8000687c:	354080e7          	jalr	852(ra) # 80005bcc <panic>

0000000080006880 <kalloc>:
    80006880:	fe010113          	addi	sp,sp,-32
    80006884:	00813823          	sd	s0,16(sp)
    80006888:	00913423          	sd	s1,8(sp)
    8000688c:	00113c23          	sd	ra,24(sp)
    80006890:	02010413          	addi	s0,sp,32
    80006894:	00003797          	auipc	a5,0x3
    80006898:	57c78793          	addi	a5,a5,1404 # 80009e10 <kmem>
    8000689c:	0007b483          	ld	s1,0(a5)
    800068a0:	02048063          	beqz	s1,800068c0 <kalloc+0x40>
    800068a4:	0004b703          	ld	a4,0(s1)
    800068a8:	00001637          	lui	a2,0x1
    800068ac:	00500593          	li	a1,5
    800068b0:	00048513          	mv	a0,s1
    800068b4:	00e7b023          	sd	a4,0(a5)
    800068b8:	00000097          	auipc	ra,0x0
    800068bc:	400080e7          	jalr	1024(ra) # 80006cb8 <__memset>
    800068c0:	01813083          	ld	ra,24(sp)
    800068c4:	01013403          	ld	s0,16(sp)
    800068c8:	00048513          	mv	a0,s1
    800068cc:	00813483          	ld	s1,8(sp)
    800068d0:	02010113          	addi	sp,sp,32
    800068d4:	00008067          	ret

00000000800068d8 <initlock>:
    800068d8:	ff010113          	addi	sp,sp,-16
    800068dc:	00813423          	sd	s0,8(sp)
    800068e0:	01010413          	addi	s0,sp,16
    800068e4:	00813403          	ld	s0,8(sp)
    800068e8:	00b53423          	sd	a1,8(a0)
    800068ec:	00052023          	sw	zero,0(a0)
    800068f0:	00053823          	sd	zero,16(a0)
    800068f4:	01010113          	addi	sp,sp,16
    800068f8:	00008067          	ret

00000000800068fc <acquire>:
    800068fc:	fe010113          	addi	sp,sp,-32
    80006900:	00813823          	sd	s0,16(sp)
    80006904:	00913423          	sd	s1,8(sp)
    80006908:	00113c23          	sd	ra,24(sp)
    8000690c:	01213023          	sd	s2,0(sp)
    80006910:	02010413          	addi	s0,sp,32
    80006914:	00050493          	mv	s1,a0
    80006918:	10002973          	csrr	s2,sstatus
    8000691c:	100027f3          	csrr	a5,sstatus
    80006920:	ffd7f793          	andi	a5,a5,-3
    80006924:	10079073          	csrw	sstatus,a5
    80006928:	fffff097          	auipc	ra,0xfffff
    8000692c:	8e8080e7          	jalr	-1816(ra) # 80005210 <mycpu>
    80006930:	07852783          	lw	a5,120(a0)
    80006934:	06078e63          	beqz	a5,800069b0 <acquire+0xb4>
    80006938:	fffff097          	auipc	ra,0xfffff
    8000693c:	8d8080e7          	jalr	-1832(ra) # 80005210 <mycpu>
    80006940:	07852783          	lw	a5,120(a0)
    80006944:	0004a703          	lw	a4,0(s1)
    80006948:	0017879b          	addiw	a5,a5,1
    8000694c:	06f52c23          	sw	a5,120(a0)
    80006950:	04071063          	bnez	a4,80006990 <acquire+0x94>
    80006954:	00100713          	li	a4,1
    80006958:	00070793          	mv	a5,a4
    8000695c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80006960:	0007879b          	sext.w	a5,a5
    80006964:	fe079ae3          	bnez	a5,80006958 <acquire+0x5c>
    80006968:	0ff0000f          	fence
    8000696c:	fffff097          	auipc	ra,0xfffff
    80006970:	8a4080e7          	jalr	-1884(ra) # 80005210 <mycpu>
    80006974:	01813083          	ld	ra,24(sp)
    80006978:	01013403          	ld	s0,16(sp)
    8000697c:	00a4b823          	sd	a0,16(s1)
    80006980:	00013903          	ld	s2,0(sp)
    80006984:	00813483          	ld	s1,8(sp)
    80006988:	02010113          	addi	sp,sp,32
    8000698c:	00008067          	ret
    80006990:	0104b903          	ld	s2,16(s1)
    80006994:	fffff097          	auipc	ra,0xfffff
    80006998:	87c080e7          	jalr	-1924(ra) # 80005210 <mycpu>
    8000699c:	faa91ce3          	bne	s2,a0,80006954 <acquire+0x58>
    800069a0:	00002517          	auipc	a0,0x2
    800069a4:	cb850513          	addi	a0,a0,-840 # 80008658 <digits+0x20>
    800069a8:	fffff097          	auipc	ra,0xfffff
    800069ac:	224080e7          	jalr	548(ra) # 80005bcc <panic>
    800069b0:	00195913          	srli	s2,s2,0x1
    800069b4:	fffff097          	auipc	ra,0xfffff
    800069b8:	85c080e7          	jalr	-1956(ra) # 80005210 <mycpu>
    800069bc:	00197913          	andi	s2,s2,1
    800069c0:	07252e23          	sw	s2,124(a0)
    800069c4:	f75ff06f          	j	80006938 <acquire+0x3c>

00000000800069c8 <release>:
    800069c8:	fe010113          	addi	sp,sp,-32
    800069cc:	00813823          	sd	s0,16(sp)
    800069d0:	00113c23          	sd	ra,24(sp)
    800069d4:	00913423          	sd	s1,8(sp)
    800069d8:	01213023          	sd	s2,0(sp)
    800069dc:	02010413          	addi	s0,sp,32
    800069e0:	00052783          	lw	a5,0(a0)
    800069e4:	00079a63          	bnez	a5,800069f8 <release+0x30>
    800069e8:	00002517          	auipc	a0,0x2
    800069ec:	c7850513          	addi	a0,a0,-904 # 80008660 <digits+0x28>
    800069f0:	fffff097          	auipc	ra,0xfffff
    800069f4:	1dc080e7          	jalr	476(ra) # 80005bcc <panic>
    800069f8:	01053903          	ld	s2,16(a0)
    800069fc:	00050493          	mv	s1,a0
    80006a00:	fffff097          	auipc	ra,0xfffff
    80006a04:	810080e7          	jalr	-2032(ra) # 80005210 <mycpu>
    80006a08:	fea910e3          	bne	s2,a0,800069e8 <release+0x20>
    80006a0c:	0004b823          	sd	zero,16(s1)
    80006a10:	0ff0000f          	fence
    80006a14:	0f50000f          	fence	iorw,ow
    80006a18:	0804a02f          	amoswap.w	zero,zero,(s1)
    80006a1c:	ffffe097          	auipc	ra,0xffffe
    80006a20:	7f4080e7          	jalr	2036(ra) # 80005210 <mycpu>
    80006a24:	100027f3          	csrr	a5,sstatus
    80006a28:	0027f793          	andi	a5,a5,2
    80006a2c:	04079a63          	bnez	a5,80006a80 <release+0xb8>
    80006a30:	07852783          	lw	a5,120(a0)
    80006a34:	02f05e63          	blez	a5,80006a70 <release+0xa8>
    80006a38:	fff7871b          	addiw	a4,a5,-1
    80006a3c:	06e52c23          	sw	a4,120(a0)
    80006a40:	00071c63          	bnez	a4,80006a58 <release+0x90>
    80006a44:	07c52783          	lw	a5,124(a0)
    80006a48:	00078863          	beqz	a5,80006a58 <release+0x90>
    80006a4c:	100027f3          	csrr	a5,sstatus
    80006a50:	0027e793          	ori	a5,a5,2
    80006a54:	10079073          	csrw	sstatus,a5
    80006a58:	01813083          	ld	ra,24(sp)
    80006a5c:	01013403          	ld	s0,16(sp)
    80006a60:	00813483          	ld	s1,8(sp)
    80006a64:	00013903          	ld	s2,0(sp)
    80006a68:	02010113          	addi	sp,sp,32
    80006a6c:	00008067          	ret
    80006a70:	00002517          	auipc	a0,0x2
    80006a74:	c1050513          	addi	a0,a0,-1008 # 80008680 <digits+0x48>
    80006a78:	fffff097          	auipc	ra,0xfffff
    80006a7c:	154080e7          	jalr	340(ra) # 80005bcc <panic>
    80006a80:	00002517          	auipc	a0,0x2
    80006a84:	be850513          	addi	a0,a0,-1048 # 80008668 <digits+0x30>
    80006a88:	fffff097          	auipc	ra,0xfffff
    80006a8c:	144080e7          	jalr	324(ra) # 80005bcc <panic>

0000000080006a90 <holding>:
    80006a90:	00052783          	lw	a5,0(a0)
    80006a94:	00079663          	bnez	a5,80006aa0 <holding+0x10>
    80006a98:	00000513          	li	a0,0
    80006a9c:	00008067          	ret
    80006aa0:	fe010113          	addi	sp,sp,-32
    80006aa4:	00813823          	sd	s0,16(sp)
    80006aa8:	00913423          	sd	s1,8(sp)
    80006aac:	00113c23          	sd	ra,24(sp)
    80006ab0:	02010413          	addi	s0,sp,32
    80006ab4:	01053483          	ld	s1,16(a0)
    80006ab8:	ffffe097          	auipc	ra,0xffffe
    80006abc:	758080e7          	jalr	1880(ra) # 80005210 <mycpu>
    80006ac0:	01813083          	ld	ra,24(sp)
    80006ac4:	01013403          	ld	s0,16(sp)
    80006ac8:	40a48533          	sub	a0,s1,a0
    80006acc:	00153513          	seqz	a0,a0
    80006ad0:	00813483          	ld	s1,8(sp)
    80006ad4:	02010113          	addi	sp,sp,32
    80006ad8:	00008067          	ret

0000000080006adc <push_off>:
    80006adc:	fe010113          	addi	sp,sp,-32
    80006ae0:	00813823          	sd	s0,16(sp)
    80006ae4:	00113c23          	sd	ra,24(sp)
    80006ae8:	00913423          	sd	s1,8(sp)
    80006aec:	02010413          	addi	s0,sp,32
    80006af0:	100024f3          	csrr	s1,sstatus
    80006af4:	100027f3          	csrr	a5,sstatus
    80006af8:	ffd7f793          	andi	a5,a5,-3
    80006afc:	10079073          	csrw	sstatus,a5
    80006b00:	ffffe097          	auipc	ra,0xffffe
    80006b04:	710080e7          	jalr	1808(ra) # 80005210 <mycpu>
    80006b08:	07852783          	lw	a5,120(a0)
    80006b0c:	02078663          	beqz	a5,80006b38 <push_off+0x5c>
    80006b10:	ffffe097          	auipc	ra,0xffffe
    80006b14:	700080e7          	jalr	1792(ra) # 80005210 <mycpu>
    80006b18:	07852783          	lw	a5,120(a0)
    80006b1c:	01813083          	ld	ra,24(sp)
    80006b20:	01013403          	ld	s0,16(sp)
    80006b24:	0017879b          	addiw	a5,a5,1
    80006b28:	06f52c23          	sw	a5,120(a0)
    80006b2c:	00813483          	ld	s1,8(sp)
    80006b30:	02010113          	addi	sp,sp,32
    80006b34:	00008067          	ret
    80006b38:	0014d493          	srli	s1,s1,0x1
    80006b3c:	ffffe097          	auipc	ra,0xffffe
    80006b40:	6d4080e7          	jalr	1748(ra) # 80005210 <mycpu>
    80006b44:	0014f493          	andi	s1,s1,1
    80006b48:	06952e23          	sw	s1,124(a0)
    80006b4c:	fc5ff06f          	j	80006b10 <push_off+0x34>

0000000080006b50 <pop_off>:
    80006b50:	ff010113          	addi	sp,sp,-16
    80006b54:	00813023          	sd	s0,0(sp)
    80006b58:	00113423          	sd	ra,8(sp)
    80006b5c:	01010413          	addi	s0,sp,16
    80006b60:	ffffe097          	auipc	ra,0xffffe
    80006b64:	6b0080e7          	jalr	1712(ra) # 80005210 <mycpu>
    80006b68:	100027f3          	csrr	a5,sstatus
    80006b6c:	0027f793          	andi	a5,a5,2
    80006b70:	04079663          	bnez	a5,80006bbc <pop_off+0x6c>
    80006b74:	07852783          	lw	a5,120(a0)
    80006b78:	02f05a63          	blez	a5,80006bac <pop_off+0x5c>
    80006b7c:	fff7871b          	addiw	a4,a5,-1
    80006b80:	06e52c23          	sw	a4,120(a0)
    80006b84:	00071c63          	bnez	a4,80006b9c <pop_off+0x4c>
    80006b88:	07c52783          	lw	a5,124(a0)
    80006b8c:	00078863          	beqz	a5,80006b9c <pop_off+0x4c>
    80006b90:	100027f3          	csrr	a5,sstatus
    80006b94:	0027e793          	ori	a5,a5,2
    80006b98:	10079073          	csrw	sstatus,a5
    80006b9c:	00813083          	ld	ra,8(sp)
    80006ba0:	00013403          	ld	s0,0(sp)
    80006ba4:	01010113          	addi	sp,sp,16
    80006ba8:	00008067          	ret
    80006bac:	00002517          	auipc	a0,0x2
    80006bb0:	ad450513          	addi	a0,a0,-1324 # 80008680 <digits+0x48>
    80006bb4:	fffff097          	auipc	ra,0xfffff
    80006bb8:	018080e7          	jalr	24(ra) # 80005bcc <panic>
    80006bbc:	00002517          	auipc	a0,0x2
    80006bc0:	aac50513          	addi	a0,a0,-1364 # 80008668 <digits+0x30>
    80006bc4:	fffff097          	auipc	ra,0xfffff
    80006bc8:	008080e7          	jalr	8(ra) # 80005bcc <panic>

0000000080006bcc <push_on>:
    80006bcc:	fe010113          	addi	sp,sp,-32
    80006bd0:	00813823          	sd	s0,16(sp)
    80006bd4:	00113c23          	sd	ra,24(sp)
    80006bd8:	00913423          	sd	s1,8(sp)
    80006bdc:	02010413          	addi	s0,sp,32
    80006be0:	100024f3          	csrr	s1,sstatus
    80006be4:	100027f3          	csrr	a5,sstatus
    80006be8:	0027e793          	ori	a5,a5,2
    80006bec:	10079073          	csrw	sstatus,a5
    80006bf0:	ffffe097          	auipc	ra,0xffffe
    80006bf4:	620080e7          	jalr	1568(ra) # 80005210 <mycpu>
    80006bf8:	07852783          	lw	a5,120(a0)
    80006bfc:	02078663          	beqz	a5,80006c28 <push_on+0x5c>
    80006c00:	ffffe097          	auipc	ra,0xffffe
    80006c04:	610080e7          	jalr	1552(ra) # 80005210 <mycpu>
    80006c08:	07852783          	lw	a5,120(a0)
    80006c0c:	01813083          	ld	ra,24(sp)
    80006c10:	01013403          	ld	s0,16(sp)
    80006c14:	0017879b          	addiw	a5,a5,1
    80006c18:	06f52c23          	sw	a5,120(a0)
    80006c1c:	00813483          	ld	s1,8(sp)
    80006c20:	02010113          	addi	sp,sp,32
    80006c24:	00008067          	ret
    80006c28:	0014d493          	srli	s1,s1,0x1
    80006c2c:	ffffe097          	auipc	ra,0xffffe
    80006c30:	5e4080e7          	jalr	1508(ra) # 80005210 <mycpu>
    80006c34:	0014f493          	andi	s1,s1,1
    80006c38:	06952e23          	sw	s1,124(a0)
    80006c3c:	fc5ff06f          	j	80006c00 <push_on+0x34>

0000000080006c40 <pop_on>:
    80006c40:	ff010113          	addi	sp,sp,-16
    80006c44:	00813023          	sd	s0,0(sp)
    80006c48:	00113423          	sd	ra,8(sp)
    80006c4c:	01010413          	addi	s0,sp,16
    80006c50:	ffffe097          	auipc	ra,0xffffe
    80006c54:	5c0080e7          	jalr	1472(ra) # 80005210 <mycpu>
    80006c58:	100027f3          	csrr	a5,sstatus
    80006c5c:	0027f793          	andi	a5,a5,2
    80006c60:	04078463          	beqz	a5,80006ca8 <pop_on+0x68>
    80006c64:	07852783          	lw	a5,120(a0)
    80006c68:	02f05863          	blez	a5,80006c98 <pop_on+0x58>
    80006c6c:	fff7879b          	addiw	a5,a5,-1
    80006c70:	06f52c23          	sw	a5,120(a0)
    80006c74:	07853783          	ld	a5,120(a0)
    80006c78:	00079863          	bnez	a5,80006c88 <pop_on+0x48>
    80006c7c:	100027f3          	csrr	a5,sstatus
    80006c80:	ffd7f793          	andi	a5,a5,-3
    80006c84:	10079073          	csrw	sstatus,a5
    80006c88:	00813083          	ld	ra,8(sp)
    80006c8c:	00013403          	ld	s0,0(sp)
    80006c90:	01010113          	addi	sp,sp,16
    80006c94:	00008067          	ret
    80006c98:	00002517          	auipc	a0,0x2
    80006c9c:	a1050513          	addi	a0,a0,-1520 # 800086a8 <digits+0x70>
    80006ca0:	fffff097          	auipc	ra,0xfffff
    80006ca4:	f2c080e7          	jalr	-212(ra) # 80005bcc <panic>
    80006ca8:	00002517          	auipc	a0,0x2
    80006cac:	9e050513          	addi	a0,a0,-1568 # 80008688 <digits+0x50>
    80006cb0:	fffff097          	auipc	ra,0xfffff
    80006cb4:	f1c080e7          	jalr	-228(ra) # 80005bcc <panic>

0000000080006cb8 <__memset>:
    80006cb8:	ff010113          	addi	sp,sp,-16
    80006cbc:	00813423          	sd	s0,8(sp)
    80006cc0:	01010413          	addi	s0,sp,16
    80006cc4:	1a060e63          	beqz	a2,80006e80 <__memset+0x1c8>
    80006cc8:	40a007b3          	neg	a5,a0
    80006ccc:	0077f793          	andi	a5,a5,7
    80006cd0:	00778693          	addi	a3,a5,7
    80006cd4:	00b00813          	li	a6,11
    80006cd8:	0ff5f593          	andi	a1,a1,255
    80006cdc:	fff6071b          	addiw	a4,a2,-1
    80006ce0:	1b06e663          	bltu	a3,a6,80006e8c <__memset+0x1d4>
    80006ce4:	1cd76463          	bltu	a4,a3,80006eac <__memset+0x1f4>
    80006ce8:	1a078e63          	beqz	a5,80006ea4 <__memset+0x1ec>
    80006cec:	00b50023          	sb	a1,0(a0)
    80006cf0:	00100713          	li	a4,1
    80006cf4:	1ae78463          	beq	a5,a4,80006e9c <__memset+0x1e4>
    80006cf8:	00b500a3          	sb	a1,1(a0)
    80006cfc:	00200713          	li	a4,2
    80006d00:	1ae78a63          	beq	a5,a4,80006eb4 <__memset+0x1fc>
    80006d04:	00b50123          	sb	a1,2(a0)
    80006d08:	00300713          	li	a4,3
    80006d0c:	18e78463          	beq	a5,a4,80006e94 <__memset+0x1dc>
    80006d10:	00b501a3          	sb	a1,3(a0)
    80006d14:	00400713          	li	a4,4
    80006d18:	1ae78263          	beq	a5,a4,80006ebc <__memset+0x204>
    80006d1c:	00b50223          	sb	a1,4(a0)
    80006d20:	00500713          	li	a4,5
    80006d24:	1ae78063          	beq	a5,a4,80006ec4 <__memset+0x20c>
    80006d28:	00b502a3          	sb	a1,5(a0)
    80006d2c:	00700713          	li	a4,7
    80006d30:	18e79e63          	bne	a5,a4,80006ecc <__memset+0x214>
    80006d34:	00b50323          	sb	a1,6(a0)
    80006d38:	00700e93          	li	t4,7
    80006d3c:	00859713          	slli	a4,a1,0x8
    80006d40:	00e5e733          	or	a4,a1,a4
    80006d44:	01059e13          	slli	t3,a1,0x10
    80006d48:	01c76e33          	or	t3,a4,t3
    80006d4c:	01859313          	slli	t1,a1,0x18
    80006d50:	006e6333          	or	t1,t3,t1
    80006d54:	02059893          	slli	a7,a1,0x20
    80006d58:	40f60e3b          	subw	t3,a2,a5
    80006d5c:	011368b3          	or	a7,t1,a7
    80006d60:	02859813          	slli	a6,a1,0x28
    80006d64:	0108e833          	or	a6,a7,a6
    80006d68:	03059693          	slli	a3,a1,0x30
    80006d6c:	003e589b          	srliw	a7,t3,0x3
    80006d70:	00d866b3          	or	a3,a6,a3
    80006d74:	03859713          	slli	a4,a1,0x38
    80006d78:	00389813          	slli	a6,a7,0x3
    80006d7c:	00f507b3          	add	a5,a0,a5
    80006d80:	00e6e733          	or	a4,a3,a4
    80006d84:	000e089b          	sext.w	a7,t3
    80006d88:	00f806b3          	add	a3,a6,a5
    80006d8c:	00e7b023          	sd	a4,0(a5)
    80006d90:	00878793          	addi	a5,a5,8
    80006d94:	fed79ce3          	bne	a5,a3,80006d8c <__memset+0xd4>
    80006d98:	ff8e7793          	andi	a5,t3,-8
    80006d9c:	0007871b          	sext.w	a4,a5
    80006da0:	01d787bb          	addw	a5,a5,t4
    80006da4:	0ce88e63          	beq	a7,a4,80006e80 <__memset+0x1c8>
    80006da8:	00f50733          	add	a4,a0,a5
    80006dac:	00b70023          	sb	a1,0(a4)
    80006db0:	0017871b          	addiw	a4,a5,1
    80006db4:	0cc77663          	bgeu	a4,a2,80006e80 <__memset+0x1c8>
    80006db8:	00e50733          	add	a4,a0,a4
    80006dbc:	00b70023          	sb	a1,0(a4)
    80006dc0:	0027871b          	addiw	a4,a5,2
    80006dc4:	0ac77e63          	bgeu	a4,a2,80006e80 <__memset+0x1c8>
    80006dc8:	00e50733          	add	a4,a0,a4
    80006dcc:	00b70023          	sb	a1,0(a4)
    80006dd0:	0037871b          	addiw	a4,a5,3
    80006dd4:	0ac77663          	bgeu	a4,a2,80006e80 <__memset+0x1c8>
    80006dd8:	00e50733          	add	a4,a0,a4
    80006ddc:	00b70023          	sb	a1,0(a4)
    80006de0:	0047871b          	addiw	a4,a5,4
    80006de4:	08c77e63          	bgeu	a4,a2,80006e80 <__memset+0x1c8>
    80006de8:	00e50733          	add	a4,a0,a4
    80006dec:	00b70023          	sb	a1,0(a4)
    80006df0:	0057871b          	addiw	a4,a5,5
    80006df4:	08c77663          	bgeu	a4,a2,80006e80 <__memset+0x1c8>
    80006df8:	00e50733          	add	a4,a0,a4
    80006dfc:	00b70023          	sb	a1,0(a4)
    80006e00:	0067871b          	addiw	a4,a5,6
    80006e04:	06c77e63          	bgeu	a4,a2,80006e80 <__memset+0x1c8>
    80006e08:	00e50733          	add	a4,a0,a4
    80006e0c:	00b70023          	sb	a1,0(a4)
    80006e10:	0077871b          	addiw	a4,a5,7
    80006e14:	06c77663          	bgeu	a4,a2,80006e80 <__memset+0x1c8>
    80006e18:	00e50733          	add	a4,a0,a4
    80006e1c:	00b70023          	sb	a1,0(a4)
    80006e20:	0087871b          	addiw	a4,a5,8
    80006e24:	04c77e63          	bgeu	a4,a2,80006e80 <__memset+0x1c8>
    80006e28:	00e50733          	add	a4,a0,a4
    80006e2c:	00b70023          	sb	a1,0(a4)
    80006e30:	0097871b          	addiw	a4,a5,9
    80006e34:	04c77663          	bgeu	a4,a2,80006e80 <__memset+0x1c8>
    80006e38:	00e50733          	add	a4,a0,a4
    80006e3c:	00b70023          	sb	a1,0(a4)
    80006e40:	00a7871b          	addiw	a4,a5,10
    80006e44:	02c77e63          	bgeu	a4,a2,80006e80 <__memset+0x1c8>
    80006e48:	00e50733          	add	a4,a0,a4
    80006e4c:	00b70023          	sb	a1,0(a4)
    80006e50:	00b7871b          	addiw	a4,a5,11
    80006e54:	02c77663          	bgeu	a4,a2,80006e80 <__memset+0x1c8>
    80006e58:	00e50733          	add	a4,a0,a4
    80006e5c:	00b70023          	sb	a1,0(a4)
    80006e60:	00c7871b          	addiw	a4,a5,12
    80006e64:	00c77e63          	bgeu	a4,a2,80006e80 <__memset+0x1c8>
    80006e68:	00e50733          	add	a4,a0,a4
    80006e6c:	00b70023          	sb	a1,0(a4)
    80006e70:	00d7879b          	addiw	a5,a5,13
    80006e74:	00c7f663          	bgeu	a5,a2,80006e80 <__memset+0x1c8>
    80006e78:	00f507b3          	add	a5,a0,a5
    80006e7c:	00b78023          	sb	a1,0(a5)
    80006e80:	00813403          	ld	s0,8(sp)
    80006e84:	01010113          	addi	sp,sp,16
    80006e88:	00008067          	ret
    80006e8c:	00b00693          	li	a3,11
    80006e90:	e55ff06f          	j	80006ce4 <__memset+0x2c>
    80006e94:	00300e93          	li	t4,3
    80006e98:	ea5ff06f          	j	80006d3c <__memset+0x84>
    80006e9c:	00100e93          	li	t4,1
    80006ea0:	e9dff06f          	j	80006d3c <__memset+0x84>
    80006ea4:	00000e93          	li	t4,0
    80006ea8:	e95ff06f          	j	80006d3c <__memset+0x84>
    80006eac:	00000793          	li	a5,0
    80006eb0:	ef9ff06f          	j	80006da8 <__memset+0xf0>
    80006eb4:	00200e93          	li	t4,2
    80006eb8:	e85ff06f          	j	80006d3c <__memset+0x84>
    80006ebc:	00400e93          	li	t4,4
    80006ec0:	e7dff06f          	j	80006d3c <__memset+0x84>
    80006ec4:	00500e93          	li	t4,5
    80006ec8:	e75ff06f          	j	80006d3c <__memset+0x84>
    80006ecc:	00600e93          	li	t4,6
    80006ed0:	e6dff06f          	j	80006d3c <__memset+0x84>

0000000080006ed4 <__memmove>:
    80006ed4:	ff010113          	addi	sp,sp,-16
    80006ed8:	00813423          	sd	s0,8(sp)
    80006edc:	01010413          	addi	s0,sp,16
    80006ee0:	0e060863          	beqz	a2,80006fd0 <__memmove+0xfc>
    80006ee4:	fff6069b          	addiw	a3,a2,-1
    80006ee8:	0006881b          	sext.w	a6,a3
    80006eec:	0ea5e863          	bltu	a1,a0,80006fdc <__memmove+0x108>
    80006ef0:	00758713          	addi	a4,a1,7
    80006ef4:	00a5e7b3          	or	a5,a1,a0
    80006ef8:	40a70733          	sub	a4,a4,a0
    80006efc:	0077f793          	andi	a5,a5,7
    80006f00:	00f73713          	sltiu	a4,a4,15
    80006f04:	00174713          	xori	a4,a4,1
    80006f08:	0017b793          	seqz	a5,a5
    80006f0c:	00e7f7b3          	and	a5,a5,a4
    80006f10:	10078863          	beqz	a5,80007020 <__memmove+0x14c>
    80006f14:	00900793          	li	a5,9
    80006f18:	1107f463          	bgeu	a5,a6,80007020 <__memmove+0x14c>
    80006f1c:	0036581b          	srliw	a6,a2,0x3
    80006f20:	fff8081b          	addiw	a6,a6,-1
    80006f24:	02081813          	slli	a6,a6,0x20
    80006f28:	01d85893          	srli	a7,a6,0x1d
    80006f2c:	00858813          	addi	a6,a1,8
    80006f30:	00058793          	mv	a5,a1
    80006f34:	00050713          	mv	a4,a0
    80006f38:	01088833          	add	a6,a7,a6
    80006f3c:	0007b883          	ld	a7,0(a5)
    80006f40:	00878793          	addi	a5,a5,8
    80006f44:	00870713          	addi	a4,a4,8
    80006f48:	ff173c23          	sd	a7,-8(a4)
    80006f4c:	ff0798e3          	bne	a5,a6,80006f3c <__memmove+0x68>
    80006f50:	ff867713          	andi	a4,a2,-8
    80006f54:	02071793          	slli	a5,a4,0x20
    80006f58:	0207d793          	srli	a5,a5,0x20
    80006f5c:	00f585b3          	add	a1,a1,a5
    80006f60:	40e686bb          	subw	a3,a3,a4
    80006f64:	00f507b3          	add	a5,a0,a5
    80006f68:	06e60463          	beq	a2,a4,80006fd0 <__memmove+0xfc>
    80006f6c:	0005c703          	lbu	a4,0(a1)
    80006f70:	00e78023          	sb	a4,0(a5)
    80006f74:	04068e63          	beqz	a3,80006fd0 <__memmove+0xfc>
    80006f78:	0015c603          	lbu	a2,1(a1)
    80006f7c:	00100713          	li	a4,1
    80006f80:	00c780a3          	sb	a2,1(a5)
    80006f84:	04e68663          	beq	a3,a4,80006fd0 <__memmove+0xfc>
    80006f88:	0025c603          	lbu	a2,2(a1)
    80006f8c:	00200713          	li	a4,2
    80006f90:	00c78123          	sb	a2,2(a5)
    80006f94:	02e68e63          	beq	a3,a4,80006fd0 <__memmove+0xfc>
    80006f98:	0035c603          	lbu	a2,3(a1)
    80006f9c:	00300713          	li	a4,3
    80006fa0:	00c781a3          	sb	a2,3(a5)
    80006fa4:	02e68663          	beq	a3,a4,80006fd0 <__memmove+0xfc>
    80006fa8:	0045c603          	lbu	a2,4(a1)
    80006fac:	00400713          	li	a4,4
    80006fb0:	00c78223          	sb	a2,4(a5)
    80006fb4:	00e68e63          	beq	a3,a4,80006fd0 <__memmove+0xfc>
    80006fb8:	0055c603          	lbu	a2,5(a1)
    80006fbc:	00500713          	li	a4,5
    80006fc0:	00c782a3          	sb	a2,5(a5)
    80006fc4:	00e68663          	beq	a3,a4,80006fd0 <__memmove+0xfc>
    80006fc8:	0065c703          	lbu	a4,6(a1)
    80006fcc:	00e78323          	sb	a4,6(a5)
    80006fd0:	00813403          	ld	s0,8(sp)
    80006fd4:	01010113          	addi	sp,sp,16
    80006fd8:	00008067          	ret
    80006fdc:	02061713          	slli	a4,a2,0x20
    80006fe0:	02075713          	srli	a4,a4,0x20
    80006fe4:	00e587b3          	add	a5,a1,a4
    80006fe8:	f0f574e3          	bgeu	a0,a5,80006ef0 <__memmove+0x1c>
    80006fec:	02069613          	slli	a2,a3,0x20
    80006ff0:	02065613          	srli	a2,a2,0x20
    80006ff4:	fff64613          	not	a2,a2
    80006ff8:	00e50733          	add	a4,a0,a4
    80006ffc:	00c78633          	add	a2,a5,a2
    80007000:	fff7c683          	lbu	a3,-1(a5)
    80007004:	fff78793          	addi	a5,a5,-1
    80007008:	fff70713          	addi	a4,a4,-1
    8000700c:	00d70023          	sb	a3,0(a4)
    80007010:	fec798e3          	bne	a5,a2,80007000 <__memmove+0x12c>
    80007014:	00813403          	ld	s0,8(sp)
    80007018:	01010113          	addi	sp,sp,16
    8000701c:	00008067          	ret
    80007020:	02069713          	slli	a4,a3,0x20
    80007024:	02075713          	srli	a4,a4,0x20
    80007028:	00170713          	addi	a4,a4,1
    8000702c:	00e50733          	add	a4,a0,a4
    80007030:	00050793          	mv	a5,a0
    80007034:	0005c683          	lbu	a3,0(a1)
    80007038:	00178793          	addi	a5,a5,1
    8000703c:	00158593          	addi	a1,a1,1
    80007040:	fed78fa3          	sb	a3,-1(a5)
    80007044:	fee798e3          	bne	a5,a4,80007034 <__memmove+0x160>
    80007048:	f89ff06f          	j	80006fd0 <__memmove+0xfc>

000000008000704c <__putc>:
    8000704c:	fe010113          	addi	sp,sp,-32
    80007050:	00813823          	sd	s0,16(sp)
    80007054:	00113c23          	sd	ra,24(sp)
    80007058:	02010413          	addi	s0,sp,32
    8000705c:	00050793          	mv	a5,a0
    80007060:	fef40593          	addi	a1,s0,-17
    80007064:	00100613          	li	a2,1
    80007068:	00000513          	li	a0,0
    8000706c:	fef407a3          	sb	a5,-17(s0)
    80007070:	fffff097          	auipc	ra,0xfffff
    80007074:	b3c080e7          	jalr	-1220(ra) # 80005bac <console_write>
    80007078:	01813083          	ld	ra,24(sp)
    8000707c:	01013403          	ld	s0,16(sp)
    80007080:	02010113          	addi	sp,sp,32
    80007084:	00008067          	ret

0000000080007088 <__getc>:
    80007088:	fe010113          	addi	sp,sp,-32
    8000708c:	00813823          	sd	s0,16(sp)
    80007090:	00113c23          	sd	ra,24(sp)
    80007094:	02010413          	addi	s0,sp,32
    80007098:	fe840593          	addi	a1,s0,-24
    8000709c:	00100613          	li	a2,1
    800070a0:	00000513          	li	a0,0
    800070a4:	fffff097          	auipc	ra,0xfffff
    800070a8:	ae8080e7          	jalr	-1304(ra) # 80005b8c <console_read>
    800070ac:	fe844503          	lbu	a0,-24(s0)
    800070b0:	01813083          	ld	ra,24(sp)
    800070b4:	01013403          	ld	s0,16(sp)
    800070b8:	02010113          	addi	sp,sp,32
    800070bc:	00008067          	ret

00000000800070c0 <console_handler>:
    800070c0:	fe010113          	addi	sp,sp,-32
    800070c4:	00813823          	sd	s0,16(sp)
    800070c8:	00113c23          	sd	ra,24(sp)
    800070cc:	00913423          	sd	s1,8(sp)
    800070d0:	02010413          	addi	s0,sp,32
    800070d4:	14202773          	csrr	a4,scause
    800070d8:	100027f3          	csrr	a5,sstatus
    800070dc:	0027f793          	andi	a5,a5,2
    800070e0:	06079e63          	bnez	a5,8000715c <console_handler+0x9c>
    800070e4:	00074c63          	bltz	a4,800070fc <console_handler+0x3c>
    800070e8:	01813083          	ld	ra,24(sp)
    800070ec:	01013403          	ld	s0,16(sp)
    800070f0:	00813483          	ld	s1,8(sp)
    800070f4:	02010113          	addi	sp,sp,32
    800070f8:	00008067          	ret
    800070fc:	0ff77713          	andi	a4,a4,255
    80007100:	00900793          	li	a5,9
    80007104:	fef712e3          	bne	a4,a5,800070e8 <console_handler+0x28>
    80007108:	ffffe097          	auipc	ra,0xffffe
    8000710c:	6dc080e7          	jalr	1756(ra) # 800057e4 <plic_claim>
    80007110:	00a00793          	li	a5,10
    80007114:	00050493          	mv	s1,a0
    80007118:	02f50c63          	beq	a0,a5,80007150 <console_handler+0x90>
    8000711c:	fc0506e3          	beqz	a0,800070e8 <console_handler+0x28>
    80007120:	00050593          	mv	a1,a0
    80007124:	00001517          	auipc	a0,0x1
    80007128:	48c50513          	addi	a0,a0,1164 # 800085b0 <_ZL6digits+0xe8>
    8000712c:	fffff097          	auipc	ra,0xfffff
    80007130:	afc080e7          	jalr	-1284(ra) # 80005c28 <__printf>
    80007134:	01013403          	ld	s0,16(sp)
    80007138:	01813083          	ld	ra,24(sp)
    8000713c:	00048513          	mv	a0,s1
    80007140:	00813483          	ld	s1,8(sp)
    80007144:	02010113          	addi	sp,sp,32
    80007148:	ffffe317          	auipc	t1,0xffffe
    8000714c:	6d430067          	jr	1748(t1) # 8000581c <plic_complete>
    80007150:	fffff097          	auipc	ra,0xfffff
    80007154:	3e0080e7          	jalr	992(ra) # 80006530 <uartintr>
    80007158:	fddff06f          	j	80007134 <console_handler+0x74>
    8000715c:	00001517          	auipc	a0,0x1
    80007160:	55450513          	addi	a0,a0,1364 # 800086b0 <digits+0x78>
    80007164:	fffff097          	auipc	ra,0xfffff
    80007168:	a68080e7          	jalr	-1432(ra) # 80005bcc <panic>
	...
