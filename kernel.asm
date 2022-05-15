
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000a117          	auipc	sp,0xa
    80000004:	dd813103          	ld	sp,-552(sp) # 80009dd8 <_GLOBAL_OFFSET_TABLE_+0x20>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	16c050ef          	jal	ra,80005188 <start>

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
    80001030:	e2453503          	ld	a0,-476(a0) # 80009e50 <_ZN3TCB7runningE>
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
    800010c8:	781000ef          	jal	ra,80002048 <_ZN5Riscv20handleSupervisorTrapEv>

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
    80001160:	cf453503          	ld	a0,-780(a0) # 80009e50 <_ZN3TCB7runningE>
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
    800011c8:	b24080e7          	jalr	-1244(ra) # 80001ce8 <_Z7kmallocm>
    800011cc:	00050493          	mv	s1,a0
    idleThread = new TCB([](void *){IdleThread::getInstance()->run();}, nullptr, DEFAULT_TIME_SLICE);
    800011d0:	00000713          	li	a4,0
    800011d4:	00200693          	li	a3,2
    800011d8:	00000613          	li	a2,0
    800011dc:	00000597          	auipc	a1,0x0
    800011e0:	0ec58593          	addi	a1,a1,236 # 800012c8 <_ZZN10IdleThreadC4EvENUlPvE_4_FUNES0_>
    800011e4:	00002097          	auipc	ra,0x2
    800011e8:	a40080e7          	jalr	-1472(ra) # 80002c24 <_ZN3TCBC1EPFvPvES0_mb>
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
    80001228:	d34080e7          	jalr	-716(ra) # 8000af58 <_Unwind_Resume>

000000008000122c <_ZN10IdleThread11getInstanceEv>:
    if (!instance) instance = new IdleThread;
    8000122c:	00009797          	auipc	a5,0x9
    80001230:	c047b783          	ld	a5,-1020(a5) # 80009e30 <_ZN10IdleThread8instanceE>
    80001234:	00078863          	beqz	a5,80001244 <_ZN10IdleThread11getInstanceEv+0x18>
    return instance;
    80001238:	00009517          	auipc	a0,0x9
    8000123c:	bf853503          	ld	a0,-1032(a0) # 80009e30 <_ZN10IdleThread8instanceE>
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
    80001264:	a88080e7          	jalr	-1400(ra) # 80001ce8 <_Z7kmallocm>
    80001268:	00050493          	mv	s1,a0
    if (!instance) instance = new IdleThread;
    8000126c:	00000097          	auipc	ra,0x0
    80001270:	f34080e7          	jalr	-204(ra) # 800011a0 <_ZN10IdleThreadC1Ev>
    80001274:	00009797          	auipc	a5,0x9
    80001278:	ba97be23          	sd	s1,-1092(a5) # 80009e30 <_ZN10IdleThread8instanceE>
    return instance;
    8000127c:	00009517          	auipc	a0,0x9
    80001280:	bb453503          	ld	a0,-1100(a0) # 80009e30 <_ZN10IdleThread8instanceE>
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
    800012b4:	ca8080e7          	jalr	-856(ra) # 8000af58 <_Unwind_Resume>

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
    delete idleThread;
    800012fc:	00053483          	ld	s1,0(a0)
    80001300:	00048e63          	beqz	s1,8000131c <_ZN10IdleThreadD1Ev+0x34>
    80001304:	00048513          	mv	a0,s1
    80001308:	00002097          	auipc	ra,0x2
    8000130c:	cc0080e7          	jalr	-832(ra) # 80002fc8 <_ZN3TCBD1Ev>
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
    80001370:	97c080e7          	jalr	-1668(ra) # 80001ce8 <_Z7kmallocm>
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
    800013e8:	00002097          	auipc	ra,0x2
    800013ec:	97c080e7          	jalr	-1668(ra) # 80002d64 <_ZN3TCB12createThreadEPFvPvES0_>
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
    80001410:	aa8080e7          	jalr	-1368(ra) # 80002eb4 <_ZN3TCB4exitEv>
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
    80001438:	00002097          	auipc	ra,0x2
    8000143c:	9b8080e7          	jalr	-1608(ra) # 80002df0 <_ZN3TCB8dispatchEv>
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
    unsigned int init = (unsigned int) args[1];
    *handle = new KernelSemaphore(init);
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
    80001498:	854080e7          	jalr	-1964(ra) # 80001ce8 <_Z7kmallocm>

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
    800015d4:	8107b783          	ld	a5,-2032(a5) # 80009de0 <_GLOBAL_OFFSET_TABLE_+0x28>
    800015d8:	0007b503          	ld	a0,0(a5)
    800015dc:	00002097          	auipc	ra,0x2
    800015e0:	09c080e7          	jalr	156(ra) # 80003678 <_ZN14TimerInterrupt5blockEP3TCBm>
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
    8000160c:	c80080e7          	jalr	-896(ra) # 80007288 <__getc>
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
    80001634:	c1c080e7          	jalr	-996(ra) # 8000724c <__putc>
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
    80001664:	7807b783          	ld	a5,1920(a5) # 80009de0 <_GLOBAL_OFFSET_TABLE_+0x28>
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
    80001798:	0a8080e7          	jalr	168(ra) # 8000283c <_Z12kprintStringPKc>
            kprintUnsigned(code);
    8000179c:	00090513          	mv	a0,s2
    800017a0:	00001097          	auipc	ra,0x1
    800017a4:	2f4080e7          	jalr	756(ra) # 80002a94 <_Z14kprintUnsignedm>
            kprintString("\n");
    800017a8:	00007517          	auipc	a0,0x7
    800017ac:	9e050513          	addi	a0,a0,-1568 # 80008188 <CONSOLE_STATUS+0x178>
    800017b0:	00001097          	auipc	ra,0x1
    800017b4:	08c080e7          	jalr	140(ra) # 8000283c <_Z12kprintStringPKc>
            return;
    800017b8:	f11ff06f          	j	800016c8 <_ZN6Kernel16handleSystemCallEv+0x80>

00000000800017bc <_ZN15KernelSemaphore5blockEv>:
#include "../h/KernelSemaphore.h"
#include "../h/Riscv.h"
#include "../h/TCB.h"
#include "../h/Scheduler.h"

void KernelSemaphore::block() {
    800017bc:	fe010113          	addi	sp,sp,-32
    800017c0:	00113c23          	sd	ra,24(sp)
    800017c4:	00813823          	sd	s0,16(sp)
    800017c8:	00913423          	sd	s1,8(sp)
    800017cc:	02010413          	addi	s0,sp,32
    blockedThreadQueue.addLast(TCB::running->getNode());
    800017d0:	00008497          	auipc	s1,0x8
    800017d4:	6104b483          	ld	s1,1552(s1) # 80009de0 <_GLOBAL_OFFSET_TABLE_+0x28>
    800017d8:	0004b583          	ld	a1,0(s1)
    800017dc:	0a058593          	addi	a1,a1,160
    800017e0:	00850513          	addi	a0,a0,8
    800017e4:	00002097          	auipc	ra,0x2
    800017e8:	c14080e7          	jalr	-1004(ra) # 800033f8 <_ZN10ThreadList7addLastEP10ThreadNode>
    TCB::running->setBlocked();
    800017ec:	0004b783          	ld	a5,0(s1)
        status = BLOCKED;
    800017f0:	00200713          	li	a4,2
    800017f4:	04e7a023          	sw	a4,64(a5)
    TCB::dispatch();
    800017f8:	00001097          	auipc	ra,0x1
    800017fc:	5f8080e7          	jalr	1528(ra) # 80002df0 <_ZN3TCB8dispatchEv>
}
    80001800:	01813083          	ld	ra,24(sp)
    80001804:	01013403          	ld	s0,16(sp)
    80001808:	00813483          	ld	s1,8(sp)
    8000180c:	02010113          	addi	sp,sp,32
    80001810:	00008067          	ret

0000000080001814 <_ZN15KernelSemaphore7deblockEv>:
    bool hasCurr() {
        return curr != nullptr;
    }

    bool isEmpty() {
        return size == 0;
    80001814:	02052783          	lw	a5,32(a0)

void KernelSemaphore::deblock() {
    if (blockedThreadQueue.isEmpty()) return;
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
    80001838:	c08080e7          	jalr	-1016(ra) # 8000343c <_ZN10ThreadList11removeFirstEv>
        status = READY;
    8000183c:	04052023          	sw	zero,64(a0)
    tcb->setReady();
    Scheduler::put(tcb);
    80001840:	00001097          	auipc	ra,0x1
    80001844:	b10080e7          	jalr	-1264(ra) # 80002350 <_ZN9Scheduler3putEP3TCB>
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
    while (!blockedThreadQueue.isEmpty())
    80001948:	00078a63          	beqz	a5,8000195c <_ZN15KernelSemaphoreD1Ev+0x48>
        deblock();
    8000194c:	00048513          	mv	a0,s1
    80001950:	00000097          	auipc	ra,0x0
    80001954:	ec4080e7          	jalr	-316(ra) # 80001814 <_ZN15KernelSemaphore7deblockEv>
    while (!blockedThreadQueue.isEmpty())
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
    80001970:	c74080e7          	jalr	-908(ra) # 800035e0 <_ZN10ThreadListD1Ev>
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
    8000199c:	618080e7          	jalr	1560(ra) # 80004fb0 <_Z8userMainv>
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
    800019d0:	e70080e7          	jalr	-400(ra) # 8000283c <_Z12kprintStringPKc>
    TCB *main = TCB::createThread(nullptr, nullptr);
    800019d4:	00000593          	li	a1,0
    800019d8:	00000513          	li	a0,0
    800019dc:	00001097          	auipc	ra,0x1
    800019e0:	388080e7          	jalr	904(ra) # 80002d64 <_ZN3TCB12createThreadEPFvPvES0_>
    800019e4:	00050493          	mv	s1,a0
    kprintString("Created main thread\n");
    800019e8:	00006517          	auipc	a0,0x6
    800019ec:	77050513          	addi	a0,a0,1904 # 80008158 <CONSOLE_STATUS+0x148>
    800019f0:	00001097          	auipc	ra,0x1
    800019f4:	e4c080e7          	jalr	-436(ra) # 8000283c <_Z12kprintStringPKc>
    TCB::running = main;
    800019f8:	00008797          	auipc	a5,0x8
    800019fc:	3e87b783          	ld	a5,1000(a5) # 80009de0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001a00:	0097b023          	sd	s1,0(a5)
    TCB *uMain = TCB::createThread([](void *){userMain();}, nullptr);
    80001a04:	00000593          	li	a1,0
    80001a08:	00000517          	auipc	a0,0x0
    80001a0c:	f8050513          	addi	a0,a0,-128 # 80001988 <_ZZ4mainENUlPvE_4_FUNES_>
    80001a10:	00001097          	auipc	ra,0x1
    80001a14:	354080e7          	jalr	852(ra) # 80002d64 <_ZN3TCB12createThreadEPFvPvES0_>
    80001a18:	00050493          	mv	s1,a0
    kprintString("Created user main thread\n");
    80001a1c:	00006517          	auipc	a0,0x6
    80001a20:	75450513          	addi	a0,a0,1876 # 80008170 <CONSOLE_STATUS+0x160>
    80001a24:	00001097          	auipc	ra,0x1
    80001a28:	e18080e7          	jalr	-488(ra) # 8000283c <_Z12kprintStringPKc>

    Riscv::w_stvec((uint64) &Riscv::supervisorTrap);
    80001a2c:	00008797          	auipc	a5,0x8
    80001a30:	39c7b783          	ld	a5,924(a5) # 80009dc8 <_GLOBAL_OFFSET_TABLE_+0x10>
    __asm__ volatile ("csrw stvec, %[stvec]" : : [stvec] "r"(stvec));
    80001a34:	10579073          	csrw	stvec,a5

    uMain->join();
    80001a38:	00048513          	mv	a0,s1
    80001a3c:	00001097          	auipc	ra,0x1
    80001a40:	504080e7          	jalr	1284(ra) # 80002f40 <_ZN3TCB4joinEv>
    int join();

    static TCB *createThread(Body body, void *args);

    static void yield() {
        __asm__ volatile ("ecall");
    80001a44:	00000073          	ecall
    TCB::yield();

    delete ThreadCollector::getInstance();
    80001a48:	00001097          	auipc	ra,0x1
    80001a4c:	79c080e7          	jalr	1948(ra) # 800031e4 <_ZN15ThreadCollector11getInstanceEv>
    80001a50:	00050e63          	beqz	a0,80001a6c <main+0xbc>
    80001a54:	00050493          	mv	s1,a0
    80001a58:	00001097          	auipc	ra,0x1
    80001a5c:	6e0080e7          	jalr	1760(ra) # 80003138 <_ZN15ThreadCollectorD1Ev>
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
    80001a94:	b68080e7          	jalr	-1176(ra) # 800035f8 <_ZN14TimerInterrupt11getInstanceEv>
    80001a98:	00050493          	mv	s1,a0
    80001a9c:	00050c63          	beqz	a0,80001ab4 <main+0x104>
    80001aa0:	00002097          	auipc	ra,0x2
    80001aa4:	da4080e7          	jalr	-604(ra) # 80003844 <_ZN14TimerInterruptD1Ev>
    80001aa8:	00048513          	mv	a0,s1
    80001aac:	00000097          	auipc	ra,0x0
    80001ab0:	438080e7          	jalr	1080(ra) # 80001ee4 <_Z5kfreePv>
    delete Scheduler::getInstance();
    80001ab4:	00000097          	auipc	ra,0x0
    80001ab8:	7b0080e7          	jalr	1968(ra) # 80002264 <_ZN9Scheduler11getInstanceEv>
    80001abc:	00050493          	mv	s1,a0
    80001ac0:	00050c63          	beqz	a0,80001ad8 <main+0x128>
    80001ac4:	00001097          	auipc	ra,0x1
    80001ac8:	8f8080e7          	jalr	-1800(ra) # 800023bc <_ZN9SchedulerD1Ev>
    80001acc:	00048513          	mv	a0,s1
    80001ad0:	00000097          	auipc	ra,0x0
    80001ad4:	414080e7          	jalr	1044(ra) # 80001ee4 <_Z5kfreePv>

    kprintString("Main finished\n");
    80001ad8:	00006517          	auipc	a0,0x6
    80001adc:	6b850513          	addi	a0,a0,1720 # 80008190 <CONSOLE_STATUS+0x180>
    80001ae0:	00001097          	auipc	ra,0x1
    80001ae4:	d5c080e7          	jalr	-676(ra) # 8000283c <_Z12kprintStringPKc>

    return 0;
}
    80001ae8:	00000513          	li	a0,0
    80001aec:	01813083          	ld	ra,24(sp)
    80001af0:	01013403          	ld	s0,16(sp)
    80001af4:	00813483          	ld	s1,8(sp)
    80001af8:	02010113          	addi	sp,sp,32
    80001afc:	00008067          	ret

0000000080001b00 <_ZN15MemoryAllocator19initMemoryAllocatorEv>:

int kfree(void *addr) {
    return MemoryAllocator::getInstance()->free(addr);
}

void MemoryAllocator::initMemoryAllocator() {
    80001b00:	ff010113          	addi	sp,sp,-16
    80001b04:	00813423          	sd	s0,8(sp)
    80001b08:	01010413          	addi	s0,sp,16
    instance = (MemoryAllocator *) HEAP_START_ADDR;
    80001b0c:	00008697          	auipc	a3,0x8
    80001b10:	2b46b683          	ld	a3,692(a3) # 80009dc0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001b14:	0006b783          	ld	a5,0(a3)
    80001b18:	00008717          	auipc	a4,0x8
    80001b1c:	32070713          	addi	a4,a4,800 # 80009e38 <_ZN15MemoryAllocator8instanceE>
    80001b20:	00f73023          	sd	a5,0(a4)

    instance->mutex = (Mutex *) ((uint8 *) HEAP_START_ADDR + sizeof(MemoryAllocator));
    80001b24:	01078613          	addi	a2,a5,16
    80001b28:	00c7b423          	sd	a2,8(a5)
    instance->mutex->holder = nullptr;
    80001b2c:	0207bc23          	sd	zero,56(a5)
    instance->freeMemHead = (BlockHeader *) ((uint8 *) HEAP_START_ADDR + sizeof(MemoryAllocator) + sizeof(Mutex));
    80001b30:	04078613          	addi	a2,a5,64
    80001b34:	00c7b023          	sd	a2,0(a5)
    instance->freeMemHead->size = (size_t) ((uint8 *) HEAP_END_ADDR - (uint8 *) HEAP_START_ADDR -
    80001b38:	00008797          	auipc	a5,0x8
    80001b3c:	2b07b783          	ld	a5,688(a5) # 80009de8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001b40:	0007b783          	ld	a5,0(a5)
    80001b44:	0006b683          	ld	a3,0(a3)
    80001b48:	40d787b3          	sub	a5,a5,a3
    80001b4c:	00073683          	ld	a3,0(a4)
    80001b50:	0006b683          	ld	a3,0(a3)
                                  sizeof(MemoryAllocator) - sizeof(BlockHeader) - sizeof(Mutex));
    80001b54:	fa878793          	addi	a5,a5,-88
    instance->freeMemHead->size = (size_t) ((uint8 *) HEAP_END_ADDR - (uint8 *) HEAP_START_ADDR -
    80001b58:	00f6b023          	sd	a5,0(a3)
    instance->freeMemHead->free = true;
    80001b5c:	00073783          	ld	a5,0(a4)
    80001b60:	0007b703          	ld	a4,0(a5)
    80001b64:	00100693          	li	a3,1
    80001b68:	00d70423          	sb	a3,8(a4)
    instance->freeMemHead->next = nullptr;
    80001b6c:	0007b783          	ld	a5,0(a5)
    80001b70:	0007b823          	sd	zero,16(a5)
}
    80001b74:	00813403          	ld	s0,8(sp)
    80001b78:	01010113          	addi	sp,sp,16
    80001b7c:	00008067          	ret

0000000080001b80 <_ZN15MemoryAllocator11getInstanceEv>:

MemoryAllocator *MemoryAllocator::getInstance() {
    if (!instance) initMemoryAllocator();
    80001b80:	00008797          	auipc	a5,0x8
    80001b84:	2b87b783          	ld	a5,696(a5) # 80009e38 <_ZN15MemoryAllocator8instanceE>
    80001b88:	00078863          	beqz	a5,80001b98 <_ZN15MemoryAllocator11getInstanceEv+0x18>

    return instance;
}
    80001b8c:	00008517          	auipc	a0,0x8
    80001b90:	2ac53503          	ld	a0,684(a0) # 80009e38 <_ZN15MemoryAllocator8instanceE>
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
    80001bb4:	28853503          	ld	a0,648(a0) # 80009e38 <_ZN15MemoryAllocator8instanceE>
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
    80001c78:	330080e7          	jalr	816(ra) # 80001fa4 <_ZN5Mutex6signalEv>
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

    mutex->signal();
    80001ca8:	0089b503          	ld	a0,8(s3)
    80001cac:	00000097          	auipc	ra,0x0
    80001cb0:	2f8080e7          	jalr	760(ra) # 80001fa4 <_ZN5Mutex6signalEv>

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

0000000080001ce8 <_Z7kmallocm>:
void *kmalloc(size_t size) {
    80001ce8:	fe010113          	addi	sp,sp,-32
    80001cec:	00113c23          	sd	ra,24(sp)
    80001cf0:	00813823          	sd	s0,16(sp)
    80001cf4:	00913423          	sd	s1,8(sp)
    80001cf8:	02010413          	addi	s0,sp,32
    80001cfc:	00050493          	mv	s1,a0
    return MemoryAllocator::getInstance()->malloc(size);
    80001d00:	00000097          	auipc	ra,0x0
    80001d04:	e80080e7          	jalr	-384(ra) # 80001b80 <_ZN15MemoryAllocator11getInstanceEv>
    80001d08:	00048593          	mv	a1,s1
    80001d0c:	00000097          	auipc	ra,0x0
    80001d10:	ebc080e7          	jalr	-324(ra) # 80001bc8 <_ZN15MemoryAllocator6mallocEm>
}
    80001d14:	01813083          	ld	ra,24(sp)
    80001d18:	01013403          	ld	s0,16(sp)
    80001d1c:	00813483          	ld	s1,8(sp)
    80001d20:	02010113          	addi	sp,sp,32
    80001d24:	00008067          	ret

0000000080001d28 <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE>:
    mutex->signal();

    return 0;
}

int MemoryAllocator::tryToJoin(MemoryAllocator::BlockHeader *curr) {
    80001d28:	ff010113          	addi	sp,sp,-16
    80001d2c:	00813423          	sd	s0,8(sp)
    80001d30:	01010413          	addi	s0,sp,16
    if (!curr || !curr->next) return -1;
    80001d34:	04050263          	beqz	a0,80001d78 <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE+0x50>
    80001d38:	01053703          	ld	a4,16(a0)
    80001d3c:	04070263          	beqz	a4,80001d80 <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE+0x58>

    if ((uint8 *) curr + sizeof(BlockHeader) + curr->size != (uint8 *) curr->next) return -2;
    80001d40:	00053783          	ld	a5,0(a0)
    80001d44:	01878693          	addi	a3,a5,24
    80001d48:	00d506b3          	add	a3,a0,a3
    80001d4c:	02d71e63          	bne	a4,a3,80001d88 <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE+0x60>

    curr->size += curr->next->size + sizeof(BlockHeader);
    80001d50:	00073683          	ld	a3,0(a4)
    80001d54:	00d787b3          	add	a5,a5,a3
    80001d58:	01878793          	addi	a5,a5,24
    80001d5c:	00f53023          	sd	a5,0(a0)
    curr->next = curr->next->next;
    80001d60:	01073783          	ld	a5,16(a4)
    80001d64:	00f53823          	sd	a5,16(a0)

    return 0;
    80001d68:	00000513          	li	a0,0
}
    80001d6c:	00813403          	ld	s0,8(sp)
    80001d70:	01010113          	addi	sp,sp,16
    80001d74:	00008067          	ret
    if (!curr || !curr->next) return -1;
    80001d78:	fff00513          	li	a0,-1
    80001d7c:	ff1ff06f          	j	80001d6c <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE+0x44>
    80001d80:	fff00513          	li	a0,-1
    80001d84:	fe9ff06f          	j	80001d6c <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE+0x44>
    if ((uint8 *) curr + sizeof(BlockHeader) + curr->size != (uint8 *) curr->next) return -2;
    80001d88:	ffe00513          	li	a0,-2
    80001d8c:	fe1ff06f          	j	80001d6c <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE+0x44>

0000000080001d90 <_ZN15MemoryAllocator4freeEPv>:
    if (!addr
    80001d90:	10058a63          	beqz	a1,80001ea4 <_ZN15MemoryAllocator4freeEPv+0x114>
int MemoryAllocator::free(void *addr) {
    80001d94:	fd010113          	addi	sp,sp,-48
    80001d98:	02113423          	sd	ra,40(sp)
    80001d9c:	02813023          	sd	s0,32(sp)
    80001da0:	00913c23          	sd	s1,24(sp)
    80001da4:	01213823          	sd	s2,16(sp)
    80001da8:	01313423          	sd	s3,8(sp)
    80001dac:	01413023          	sd	s4,0(sp)
    80001db0:	03010413          	addi	s0,sp,48
    80001db4:	00050a13          	mv	s4,a0
    80001db8:	00058913          	mv	s2,a1
        || (uint8 *) addr < (uint8 *) HEAP_START_ADDR + sizeof(MemoryAllocator) + sizeof(BlockHeader) + sizeof(Mutex)
    80001dbc:	00008797          	auipc	a5,0x8
    80001dc0:	0047b783          	ld	a5,4(a5) # 80009dc0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001dc4:	0007b783          	ld	a5,0(a5)
    80001dc8:	05878793          	addi	a5,a5,88
    80001dcc:	0ef5e063          	bltu	a1,a5,80001eac <_ZN15MemoryAllocator4freeEPv+0x11c>
        || addr >= HEAP_END_ADDR) {
    80001dd0:	00008797          	auipc	a5,0x8
    80001dd4:	0187b783          	ld	a5,24(a5) # 80009de8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001dd8:	0007b783          	ld	a5,0(a5)
    80001ddc:	0cf5fc63          	bgeu	a1,a5,80001eb4 <_ZN15MemoryAllocator4freeEPv+0x124>
    BlockHeader *elem = (BlockHeader *) ((uint8 *) addr - sizeof(BlockHeader));
    80001de0:	fe858993          	addi	s3,a1,-24
    if (!elem || elem->free || elem->next) {
    80001de4:	0c098c63          	beqz	s3,80001ebc <_ZN15MemoryAllocator4freeEPv+0x12c>
    80001de8:	ff05c783          	lbu	a5,-16(a1)
    80001dec:	0c079c63          	bnez	a5,80001ec4 <_ZN15MemoryAllocator4freeEPv+0x134>
    80001df0:	ff85b483          	ld	s1,-8(a1)
    80001df4:	0c049c63          	bnez	s1,80001ecc <_ZN15MemoryAllocator4freeEPv+0x13c>
    mutex->wait();
    80001df8:	00853503          	ld	a0,8(a0)
    80001dfc:	00000097          	auipc	ra,0x0
    80001e00:	128080e7          	jalr	296(ra) # 80001f24 <_ZN5Mutex4waitEv>
    BlockHeader *curr = freeMemHead, *prev = nullptr;
    80001e04:	000a3783          	ld	a5,0(s4)
    while (curr && curr < elem)
    80001e08:	00078a63          	beqz	a5,80001e1c <_ZN15MemoryAllocator4freeEPv+0x8c>
    80001e0c:	0137f863          	bgeu	a5,s3,80001e1c <_ZN15MemoryAllocator4freeEPv+0x8c>
        prev = curr, curr = curr->next;
    80001e10:	00078493          	mv	s1,a5
    80001e14:	0107b783          	ld	a5,16(a5)
    while (curr && curr < elem)
    80001e18:	ff1ff06f          	j	80001e08 <_ZN15MemoryAllocator4freeEPv+0x78>
    if ((prev && (uint8 *) prev + prev->size + sizeof(BlockHeader) > addr)
    80001e1c:	00048a63          	beqz	s1,80001e30 <_ZN15MemoryAllocator4freeEPv+0xa0>
    80001e20:	0004b703          	ld	a4,0(s1)
    80001e24:	01870713          	addi	a4,a4,24
    80001e28:	00e48733          	add	a4,s1,a4
    80001e2c:	0ae96463          	bltu	s2,a4,80001ed4 <_ZN15MemoryAllocator4freeEPv+0x144>
        || (curr && (uint8 *) addr + elem->size  > (uint8 *) curr)) {
    80001e30:	00078863          	beqz	a5,80001e40 <_ZN15MemoryAllocator4freeEPv+0xb0>
    80001e34:	fe893703          	ld	a4,-24(s2)
    80001e38:	00e90733          	add	a4,s2,a4
    80001e3c:	0ae7e063          	bltu	a5,a4,80001edc <_ZN15MemoryAllocator4freeEPv+0x14c>
    elem->next = curr;
    80001e40:	fef93c23          	sd	a5,-8(s2)
    elem->free = true;
    80001e44:	00100793          	li	a5,1
    80001e48:	fef90823          	sb	a5,-16(s2)
    (!prev ? freeMemHead : prev->next) = elem;
    80001e4c:	04048863          	beqz	s1,80001e9c <_ZN15MemoryAllocator4freeEPv+0x10c>
    80001e50:	0134b823          	sd	s3,16(s1)
    tryToJoin(elem);
    80001e54:	00098513          	mv	a0,s3
    80001e58:	00000097          	auipc	ra,0x0
    80001e5c:	ed0080e7          	jalr	-304(ra) # 80001d28 <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE>
    tryToJoin(prev);
    80001e60:	00048513          	mv	a0,s1
    80001e64:	00000097          	auipc	ra,0x0
    80001e68:	ec4080e7          	jalr	-316(ra) # 80001d28 <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE>
    mutex->signal();
    80001e6c:	008a3503          	ld	a0,8(s4)
    80001e70:	00000097          	auipc	ra,0x0
    80001e74:	134080e7          	jalr	308(ra) # 80001fa4 <_ZN5Mutex6signalEv>
    return 0;
    80001e78:	00000513          	li	a0,0
}
    80001e7c:	02813083          	ld	ra,40(sp)
    80001e80:	02013403          	ld	s0,32(sp)
    80001e84:	01813483          	ld	s1,24(sp)
    80001e88:	01013903          	ld	s2,16(sp)
    80001e8c:	00813983          	ld	s3,8(sp)
    80001e90:	00013a03          	ld	s4,0(sp)
    80001e94:	03010113          	addi	sp,sp,48
    80001e98:	00008067          	ret
    (!prev ? freeMemHead : prev->next) = elem;
    80001e9c:	013a3023          	sd	s3,0(s4)
    80001ea0:	fb5ff06f          	j	80001e54 <_ZN15MemoryAllocator4freeEPv+0xc4>
        return -1;
    80001ea4:	fff00513          	li	a0,-1
}
    80001ea8:	00008067          	ret
        return -1;
    80001eac:	fff00513          	li	a0,-1
    80001eb0:	fcdff06f          	j	80001e7c <_ZN15MemoryAllocator4freeEPv+0xec>
    80001eb4:	fff00513          	li	a0,-1
    80001eb8:	fc5ff06f          	j	80001e7c <_ZN15MemoryAllocator4freeEPv+0xec>
        return -2;
    80001ebc:	ffe00513          	li	a0,-2
    80001ec0:	fbdff06f          	j	80001e7c <_ZN15MemoryAllocator4freeEPv+0xec>
    80001ec4:	ffe00513          	li	a0,-2
    80001ec8:	fb5ff06f          	j	80001e7c <_ZN15MemoryAllocator4freeEPv+0xec>
    80001ecc:	ffe00513          	li	a0,-2
    80001ed0:	fadff06f          	j	80001e7c <_ZN15MemoryAllocator4freeEPv+0xec>
        return -2;
    80001ed4:	ffe00513          	li	a0,-2
    80001ed8:	fa5ff06f          	j	80001e7c <_ZN15MemoryAllocator4freeEPv+0xec>
    80001edc:	ffe00513          	li	a0,-2
    80001ee0:	f9dff06f          	j	80001e7c <_ZN15MemoryAllocator4freeEPv+0xec>

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
    80001f0c:	e88080e7          	jalr	-376(ra) # 80001d90 <_ZN15MemoryAllocator4freeEPv>
}
    80001f10:	01813083          	ld	ra,24(sp)
    80001f14:	01013403          	ld	s0,16(sp)
    80001f18:	00813483          	ld	s1,8(sp)
    80001f1c:	02010113          	addi	sp,sp,32
    80001f20:	00008067          	ret

0000000080001f24 <_ZN5Mutex4waitEv>:
#include "../h/Mutex.h"
#include "../h/TCB.h"
#include "../h/Riscv.h"

void Mutex::wait() {
    if (holder == TCB::running) return;
    80001f24:	02853703          	ld	a4,40(a0)
    80001f28:	00008797          	auipc	a5,0x8
    80001f2c:	eb87b783          	ld	a5,-328(a5) # 80009de0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001f30:	0007b783          	ld	a5,0(a5)
    80001f34:	06f70663          	beq	a4,a5,80001fa0 <_ZN5Mutex4waitEv+0x7c>
void Mutex::wait() {
    80001f38:	fd010113          	addi	sp,sp,-48
    80001f3c:	02113423          	sd	ra,40(sp)
    80001f40:	02813023          	sd	s0,32(sp)
    80001f44:	00913c23          	sd	s1,24(sp)
    80001f48:	03010413          	addi	s0,sp,48
    80001f4c:	00050493          	mv	s1,a0
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80001f50:	100027f3          	csrr	a5,sstatus
    80001f54:	fcf43823          	sd	a5,-48(s0)
    return sstatus;
    80001f58:	fd043783          	ld	a5,-48(s0)
    lock()
    80001f5c:	fcf43c23          	sd	a5,-40(s0)
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80001f60:	00200793          	li	a5,2
    80001f64:	1007b073          	csrc	sstatus,a5
    if (holder) block();
    80001f68:	00070663          	beqz	a4,80001f74 <_ZN5Mutex4waitEv+0x50>
    80001f6c:	00000097          	auipc	ra,0x0
    80001f70:	850080e7          	jalr	-1968(ra) # 800017bc <_ZN15KernelSemaphore5blockEv>
    holder = TCB::running;
    80001f74:	00008797          	auipc	a5,0x8
    80001f78:	e6c7b783          	ld	a5,-404(a5) # 80009de0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001f7c:	0007b783          	ld	a5,0(a5)
    80001f80:	02f4b423          	sd	a5,40(s1)
    unlock()
    80001f84:	fd843783          	ld	a5,-40(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80001f88:	10079073          	csrw	sstatus,a5
}
    80001f8c:	02813083          	ld	ra,40(sp)
    80001f90:	02013403          	ld	s0,32(sp)
    80001f94:	01813483          	ld	s1,24(sp)
    80001f98:	03010113          	addi	sp,sp,48
    80001f9c:	00008067          	ret
    80001fa0:	00008067          	ret

0000000080001fa4 <_ZN5Mutex6signalEv>:

void Mutex::signal() {
    if (holder != TCB::running) return;
    80001fa4:	02853703          	ld	a4,40(a0)
    80001fa8:	00008797          	auipc	a5,0x8
    80001fac:	e387b783          	ld	a5,-456(a5) # 80009de0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001fb0:	0007b783          	ld	a5,0(a5)
    80001fb4:	00f70463          	beq	a4,a5,80001fbc <_ZN5Mutex6signalEv+0x18>
    80001fb8:	00008067          	ret
void Mutex::signal() {
    80001fbc:	fe010113          	addi	sp,sp,-32
    80001fc0:	00113c23          	sd	ra,24(sp)
    80001fc4:	00813823          	sd	s0,16(sp)
    80001fc8:	02010413          	addi	s0,sp,32
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80001fcc:	100027f3          	csrr	a5,sstatus
    80001fd0:	fef43023          	sd	a5,-32(s0)
    return sstatus;
    80001fd4:	fe043783          	ld	a5,-32(s0)
    lock()
    80001fd8:	fef43423          	sd	a5,-24(s0)
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80001fdc:	00200793          	li	a5,2
    80001fe0:	1007b073          	csrc	sstatus,a5
    holder = nullptr;
    80001fe4:	02053423          	sd	zero,40(a0)
    deblock();
    80001fe8:	00000097          	auipc	ra,0x0
    80001fec:	82c080e7          	jalr	-2004(ra) # 80001814 <_ZN15KernelSemaphore7deblockEv>
    unlock()
    80001ff0:	fe843783          	ld	a5,-24(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80001ff4:	10079073          	csrw	sstatus,a5
}
    80001ff8:	01813083          	ld	ra,24(sp)
    80001ffc:	01013403          	ld	s0,16(sp)
    80002000:	02010113          	addi	sp,sp,32
    80002004:	00008067          	ret

0000000080002008 <_ZN5Riscv10popSppSpieEb>:
#include "../h/SysPrint.h"
#include "../h/TCB.h"
#include "../h/Kernel.h"
#include "../h/TimerInterrupt.h"

void Riscv::popSppSpie(bool prMode) {
    80002008:	ff010113          	addi	sp,sp,-16
    8000200c:	00813423          	sd	s0,8(sp)
    80002010:	01010413          	addi	s0,sp,16
    if(prMode) ms_sstatus(SSTATUS_SPP);
    80002014:	02050463          	beqz	a0,8000203c <_ZN5Riscv10popSppSpieEb+0x34>
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80002018:	10000793          	li	a5,256
    8000201c:	1007a073          	csrs	sstatus,a5
    80002020:	02000793          	li	a5,32
    80002024:	1007a073          	csrs	sstatus,a5
    else mc_sstatus(SSTATUS_SPP);
    ms_sstatus(SSTATUS_SPIE);
    __asm__ volatile ("csrw sepc, ra");
    80002028:	14109073          	csrw	sepc,ra
    __asm__ volatile ("sret");
    8000202c:	10200073          	sret
}
    80002030:	00813403          	ld	s0,8(sp)
    80002034:	01010113          	addi	sp,sp,16
    80002038:	00008067          	ret
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    8000203c:	10000793          	li	a5,256
    80002040:	1007b073          	csrc	sstatus,a5
}
    80002044:	fddff06f          	j	80002020 <_ZN5Riscv10popSppSpieEb+0x18>

0000000080002048 <_ZN5Riscv20handleSupervisorTrapEv>:

void Riscv::handleSupervisorTrap() {
    80002048:	f6010113          	addi	sp,sp,-160
    8000204c:	08113c23          	sd	ra,152(sp)
    80002050:	08813823          	sd	s0,144(sp)
    80002054:	08913423          	sd	s1,136(sp)
    80002058:	09213023          	sd	s2,128(sp)
    8000205c:	0a010413          	addi	s0,sp,160
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    80002060:	142027f3          	csrr	a5,scause
    80002064:	f8f43c23          	sd	a5,-104(s0)
    return scause;
    80002068:	f9843483          	ld	s1,-104(s0)
    uint64 scause = r_scause();
    switch (scause) {
    8000206c:	fff00793          	li	a5,-1
    80002070:	03f79793          	slli	a5,a5,0x3f
    80002074:	00178793          	addi	a5,a5,1
    80002078:	0cf48663          	beq	s1,a5,80002144 <_ZN5Riscv20handleSupervisorTrapEv+0xfc>
    8000207c:	fff00793          	li	a5,-1
    80002080:	03f79793          	slli	a5,a5,0x3f
    80002084:	00178793          	addi	a5,a5,1
    80002088:	0497ea63          	bltu	a5,s1,800020dc <_ZN5Riscv20handleSupervisorTrapEv+0x94>
    8000208c:	00800793          	li	a5,8
    80002090:	06f48463          	beq	s1,a5,800020f8 <_ZN5Riscv20handleSupervisorTrapEv+0xb0>
    80002094:	00900793          	li	a5,9
    80002098:	14f49263          	bne	s1,a5,800021dc <_ZN5Riscv20handleSupervisorTrapEv+0x194>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    8000209c:	141027f3          	csrr	a5,sepc
    800020a0:	faf43c23          	sd	a5,-72(s0)
    return sepc;
    800020a4:	fb843783          	ld	a5,-72(s0)
            w_sepc(sepc);
            break;
        }
        case 0x0000000000000009UL: {
            // interrupt: no, cause code: environment call from S-mode (9)
            volatile uint64 sepc = r_sepc() + 4;
    800020a8:	00478793          	addi	a5,a5,4
    800020ac:	f6f43c23          	sd	a5,-136(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    800020b0:	100027f3          	csrr	a5,sstatus
    800020b4:	faf43823          	sd	a5,-80(s0)
    return sstatus;
    800020b8:	fb043783          	ld	a5,-80(s0)
            volatile uint64 sstatus = r_sstatus();
    800020bc:	f8f43023          	sd	a5,-128(s0)

            TCB::dispatch();
    800020c0:	00001097          	auipc	ra,0x1
    800020c4:	d30080e7          	jalr	-720(ra) # 80002df0 <_ZN3TCB8dispatchEv>

            w_sstatus(sstatus);
    800020c8:	f8043783          	ld	a5,-128(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    800020cc:	10079073          	csrw	sstatus,a5
            w_sepc(sepc);
    800020d0:	f7843783          	ld	a5,-136(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    800020d4:	14179073          	csrw	sepc,a5
}
    800020d8:	0e00006f          	j	800021b8 <_ZN5Riscv20handleSupervisorTrapEv+0x170>
    switch (scause) {
    800020dc:	fff00793          	li	a5,-1
    800020e0:	03f79793          	slli	a5,a5,0x3f
    800020e4:	00978793          	addi	a5,a5,9
    800020e8:	0ef49a63          	bne	s1,a5,800021dc <_ZN5Riscv20handleSupervisorTrapEv+0x194>
            w_sepc(sepc);
            break;
        }
        case 0x8000000000000009UL: {
            // interrupt: yes, cause code: supervisor external interrupt (console)
            console_handler();
    800020ec:	00005097          	auipc	ra,0x5
    800020f0:	1d4080e7          	jalr	468(ra) # 800072c0 <console_handler>
            break;
    800020f4:	0c40006f          	j	800021b8 <_ZN5Riscv20handleSupervisorTrapEv+0x170>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    800020f8:	141027f3          	csrr	a5,sepc
    800020fc:	faf43423          	sd	a5,-88(s0)
    return sepc;
    80002100:	fa843783          	ld	a5,-88(s0)
            volatile uint64 sepc = r_sepc() + 4;
    80002104:	00478793          	addi	a5,a5,4
    80002108:	f6f43423          	sd	a5,-152(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    8000210c:	100027f3          	csrr	a5,sstatus
    80002110:	faf43023          	sd	a5,-96(s0)
    return sstatus;
    80002114:	fa043783          	ld	a5,-96(s0)
            volatile uint64 sstatus = r_sstatus();
    80002118:	f6f43823          	sd	a5,-144(s0)
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    8000211c:	00200493          	li	s1,2
    80002120:	1004a073          	csrs	sstatus,s1
            Kernel::handleSystemCall();
    80002124:	fffff097          	auipc	ra,0xfffff
    80002128:	524080e7          	jalr	1316(ra) # 80001648 <_ZN6Kernel16handleSystemCallEv>
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    8000212c:	1004b073          	csrc	sstatus,s1
            w_sstatus(sstatus);
    80002130:	f7043783          	ld	a5,-144(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80002134:	10079073          	csrw	sstatus,a5
            w_sepc(sepc);
    80002138:	f6843783          	ld	a5,-152(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    8000213c:	14179073          	csrw	sepc,a5
}
    80002140:	0780006f          	j	800021b8 <_ZN5Riscv20handleSupervisorTrapEv+0x170>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80002144:	141027f3          	csrr	a5,sepc
    80002148:	fcf43423          	sd	a5,-56(s0)
    return sepc;
    8000214c:	fc843783          	ld	a5,-56(s0)
            volatile uint64 sepc = r_sepc();
    80002150:	f8f43423          	sd	a5,-120(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80002154:	100027f3          	csrr	a5,sstatus
    80002158:	fcf43023          	sd	a5,-64(s0)
    return sstatus;
    8000215c:	fc043783          	ld	a5,-64(s0)
            volatile uint64 sstatus = r_sstatus();
    80002160:	f8f43823          	sd	a5,-112(s0)
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    80002164:	00200913          	li	s2,2
    80002168:	14493073          	csrc	sip,s2
            TCB::timeSliceCounter++;
    8000216c:	00008497          	auipc	s1,0x8
    80002170:	c644b483          	ld	s1,-924(s1) # 80009dd0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002174:	0004b783          	ld	a5,0(s1)
    80002178:	00178793          	addi	a5,a5,1
    8000217c:	00f4b023          	sd	a5,0(s1)
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80002180:	10092073          	csrs	sstatus,s2
            TimerInterrupt::tick();
    80002184:	00001097          	auipc	ra,0x1
    80002188:	60c080e7          	jalr	1548(ra) # 80003790 <_ZN14TimerInterrupt4tickEv>
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    8000218c:	10093073          	csrc	sstatus,s2
            if (TCB::timeSliceCounter >= TCB::running->timeSlice) {
    80002190:	00008797          	auipc	a5,0x8
    80002194:	c507b783          	ld	a5,-944(a5) # 80009de0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002198:	0007b783          	ld	a5,0(a5)
    8000219c:	0387b703          	ld	a4,56(a5)
    800021a0:	0004b783          	ld	a5,0(s1)
    800021a4:	02e7f663          	bgeu	a5,a4,800021d0 <_ZN5Riscv20handleSupervisorTrapEv+0x188>
            w_sstatus(sstatus);
    800021a8:	f9043783          	ld	a5,-112(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    800021ac:	10079073          	csrw	sstatus,a5
            w_sepc(sepc);
    800021b0:	f8843783          	ld	a5,-120(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    800021b4:	14179073          	csrw	sepc,a5
            kprintString("\nStval: ");
            kprintUnsigned(r_stval());
            kprintString("\n");
        }
    }
    800021b8:	09813083          	ld	ra,152(sp)
    800021bc:	09013403          	ld	s0,144(sp)
    800021c0:	08813483          	ld	s1,136(sp)
    800021c4:	08013903          	ld	s2,128(sp)
    800021c8:	0a010113          	addi	sp,sp,160
    800021cc:	00008067          	ret
                TCB::dispatch();
    800021d0:	00001097          	auipc	ra,0x1
    800021d4:	c20080e7          	jalr	-992(ra) # 80002df0 <_ZN3TCB8dispatchEv>
    800021d8:	fd1ff06f          	j	800021a8 <_ZN5Riscv20handleSupervisorTrapEv+0x160>
            kprintString("Unexpected trap cause:\n");
    800021dc:	00006517          	auipc	a0,0x6
    800021e0:	fc450513          	addi	a0,a0,-60 # 800081a0 <CONSOLE_STATUS+0x190>
    800021e4:	00000097          	auipc	ra,0x0
    800021e8:	658080e7          	jalr	1624(ra) # 8000283c <_Z12kprintStringPKc>
            kprintString("Scause: ");
    800021ec:	00006517          	auipc	a0,0x6
    800021f0:	fcc50513          	addi	a0,a0,-52 # 800081b8 <CONSOLE_STATUS+0x1a8>
    800021f4:	00000097          	auipc	ra,0x0
    800021f8:	648080e7          	jalr	1608(ra) # 8000283c <_Z12kprintStringPKc>
            kprintUnsigned(scause);
    800021fc:	00048513          	mv	a0,s1
    80002200:	00001097          	auipc	ra,0x1
    80002204:	894080e7          	jalr	-1900(ra) # 80002a94 <_Z14kprintUnsignedm>
            kprintString("\nSepc: ");
    80002208:	00006517          	auipc	a0,0x6
    8000220c:	fc050513          	addi	a0,a0,-64 # 800081c8 <CONSOLE_STATUS+0x1b8>
    80002210:	00000097          	auipc	ra,0x0
    80002214:	62c080e7          	jalr	1580(ra) # 8000283c <_Z12kprintStringPKc>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80002218:	141027f3          	csrr	a5,sepc
    8000221c:	fcf43c23          	sd	a5,-40(s0)
    return sepc;
    80002220:	fd843503          	ld	a0,-40(s0)
            kprintUnsigned(r_sepc());
    80002224:	00001097          	auipc	ra,0x1
    80002228:	870080e7          	jalr	-1936(ra) # 80002a94 <_Z14kprintUnsignedm>
            kprintString("\nStval: ");
    8000222c:	00006517          	auipc	a0,0x6
    80002230:	fa450513          	addi	a0,a0,-92 # 800081d0 <CONSOLE_STATUS+0x1c0>
    80002234:	00000097          	auipc	ra,0x0
    80002238:	608080e7          	jalr	1544(ra) # 8000283c <_Z12kprintStringPKc>
    __asm__ volatile ("csrr %[stval], stval" : [stval] "=r"(stval));
    8000223c:	143027f3          	csrr	a5,stval
    80002240:	fcf43823          	sd	a5,-48(s0)
    return stval;
    80002244:	fd043503          	ld	a0,-48(s0)
            kprintUnsigned(r_stval());
    80002248:	00001097          	auipc	ra,0x1
    8000224c:	84c080e7          	jalr	-1972(ra) # 80002a94 <_Z14kprintUnsignedm>
            kprintString("\n");
    80002250:	00006517          	auipc	a0,0x6
    80002254:	f3850513          	addi	a0,a0,-200 # 80008188 <CONSOLE_STATUS+0x178>
    80002258:	00000097          	auipc	ra,0x0
    8000225c:	5e4080e7          	jalr	1508(ra) # 8000283c <_Z12kprintStringPKc>
    80002260:	f59ff06f          	j	800021b8 <_ZN5Riscv20handleSupervisorTrapEv+0x170>

0000000080002264 <_ZN9Scheduler11getInstanceEv>:
    getInstance()->readyThreadQueue.addLast(tcb->getNode());
    getInstance()->mutex.signal();
}

Scheduler *Scheduler::getInstance() {
    if (!instance) instance = new Scheduler;
    80002264:	00008797          	auipc	a5,0x8
    80002268:	bdc7b783          	ld	a5,-1060(a5) # 80009e40 <_ZN9Scheduler8instanceE>
    8000226c:	00078863          	beqz	a5,8000227c <_ZN9Scheduler11getInstanceEv+0x18>
    return instance;
}
    80002270:	00008517          	auipc	a0,0x8
    80002274:	bd053503          	ld	a0,-1072(a0) # 80009e40 <_ZN9Scheduler8instanceE>
    80002278:	00008067          	ret
Scheduler *Scheduler::getInstance() {
    8000227c:	ff010113          	addi	sp,sp,-16
    80002280:	00113423          	sd	ra,8(sp)
    80002284:	00813023          	sd	s0,0(sp)
    80002288:	01010413          	addi	s0,sp,16
        return kmalloc(size);
    8000228c:	05800513          	li	a0,88
    80002290:	00000097          	auipc	ra,0x0
    80002294:	a58080e7          	jalr	-1448(ra) # 80001ce8 <_Z7kmallocm>
    explicit ThreadList() = default;
    80002298:	00053423          	sd	zero,8(a0)
    8000229c:	00053823          	sd	zero,16(a0)
    800022a0:	00053c23          	sd	zero,24(a0)
    800022a4:	02052023          	sw	zero,32(a0)
    800022a8:	00100793          	li	a5,1
    800022ac:	02f52423          	sw	a5,40(a0)
    800022b0:	02053823          	sd	zero,48(a0)
    800022b4:	02053c23          	sd	zero,56(a0)
    800022b8:	04053023          	sd	zero,64(a0)
    800022bc:	04052423          	sw	zero,72(a0)

class TCB;

#include "KernelSemaphore.h"

class Mutex : public KernelSemaphore {
    800022c0:	04053823          	sd	zero,80(a0)
    if (!instance) instance = new Scheduler;
    800022c4:	00008797          	auipc	a5,0x8
    800022c8:	b6a7be23          	sd	a0,-1156(a5) # 80009e40 <_ZN9Scheduler8instanceE>
}
    800022cc:	00008517          	auipc	a0,0x8
    800022d0:	b7453503          	ld	a0,-1164(a0) # 80009e40 <_ZN9Scheduler8instanceE>
    800022d4:	00813083          	ld	ra,8(sp)
    800022d8:	00013403          	ld	s0,0(sp)
    800022dc:	01010113          	addi	sp,sp,16
    800022e0:	00008067          	ret

00000000800022e4 <_ZN9Scheduler3getEv>:
TCB *Scheduler::get() {
    800022e4:	fe010113          	addi	sp,sp,-32
    800022e8:	00113c23          	sd	ra,24(sp)
    800022ec:	00813823          	sd	s0,16(sp)
    800022f0:	00913423          	sd	s1,8(sp)
    800022f4:	02010413          	addi	s0,sp,32
    getInstance()->mutex.wait();
    800022f8:	00000097          	auipc	ra,0x0
    800022fc:	f6c080e7          	jalr	-148(ra) # 80002264 <_ZN9Scheduler11getInstanceEv>
    80002300:	02850513          	addi	a0,a0,40
    80002304:	00000097          	auipc	ra,0x0
    80002308:	c20080e7          	jalr	-992(ra) # 80001f24 <_ZN5Mutex4waitEv>
    TCB *tcb = getInstance()->readyThreadQueue.removeFirst();
    8000230c:	00000097          	auipc	ra,0x0
    80002310:	f58080e7          	jalr	-168(ra) # 80002264 <_ZN9Scheduler11getInstanceEv>
    80002314:	00850513          	addi	a0,a0,8
    80002318:	00001097          	auipc	ra,0x1
    8000231c:	124080e7          	jalr	292(ra) # 8000343c <_ZN10ThreadList11removeFirstEv>
    80002320:	00050493          	mv	s1,a0
    getInstance()->mutex.signal();
    80002324:	00000097          	auipc	ra,0x0
    80002328:	f40080e7          	jalr	-192(ra) # 80002264 <_ZN9Scheduler11getInstanceEv>
    8000232c:	02850513          	addi	a0,a0,40
    80002330:	00000097          	auipc	ra,0x0
    80002334:	c74080e7          	jalr	-908(ra) # 80001fa4 <_ZN5Mutex6signalEv>
}
    80002338:	00048513          	mv	a0,s1
    8000233c:	01813083          	ld	ra,24(sp)
    80002340:	01013403          	ld	s0,16(sp)
    80002344:	00813483          	ld	s1,8(sp)
    80002348:	02010113          	addi	sp,sp,32
    8000234c:	00008067          	ret

0000000080002350 <_ZN9Scheduler3putEP3TCB>:
void Scheduler::put(TCB *tcb) {
    80002350:	fe010113          	addi	sp,sp,-32
    80002354:	00113c23          	sd	ra,24(sp)
    80002358:	00813823          	sd	s0,16(sp)
    8000235c:	00913423          	sd	s1,8(sp)
    80002360:	02010413          	addi	s0,sp,32
    80002364:	00050493          	mv	s1,a0
    getInstance()->mutex.wait();
    80002368:	00000097          	auipc	ra,0x0
    8000236c:	efc080e7          	jalr	-260(ra) # 80002264 <_ZN9Scheduler11getInstanceEv>
    80002370:	02850513          	addi	a0,a0,40
    80002374:	00000097          	auipc	ra,0x0
    80002378:	bb0080e7          	jalr	-1104(ra) # 80001f24 <_ZN5Mutex4waitEv>
    getInstance()->readyThreadQueue.addLast(tcb->getNode());
    8000237c:	00000097          	auipc	ra,0x0
    80002380:	ee8080e7          	jalr	-280(ra) # 80002264 <_ZN9Scheduler11getInstanceEv>
    80002384:	0a048593          	addi	a1,s1,160
    80002388:	00850513          	addi	a0,a0,8
    8000238c:	00001097          	auipc	ra,0x1
    80002390:	06c080e7          	jalr	108(ra) # 800033f8 <_ZN10ThreadList7addLastEP10ThreadNode>
    getInstance()->mutex.signal();
    80002394:	00000097          	auipc	ra,0x0
    80002398:	ed0080e7          	jalr	-304(ra) # 80002264 <_ZN9Scheduler11getInstanceEv>
    8000239c:	02850513          	addi	a0,a0,40
    800023a0:	00000097          	auipc	ra,0x0
    800023a4:	c04080e7          	jalr	-1020(ra) # 80001fa4 <_ZN5Mutex6signalEv>
}
    800023a8:	01813083          	ld	ra,24(sp)
    800023ac:	01013403          	ld	s0,16(sp)
    800023b0:	00813483          	ld	s1,8(sp)
    800023b4:	02010113          	addi	sp,sp,32
    800023b8:	00008067          	ret

00000000800023bc <_ZN9SchedulerD1Ev>:

Scheduler::~Scheduler() {
    800023bc:	fe010113          	addi	sp,sp,-32
    800023c0:	00113c23          	sd	ra,24(sp)
    800023c4:	00813823          	sd	s0,16(sp)
    800023c8:	00913423          	sd	s1,8(sp)
    800023cc:	01213023          	sd	s2,0(sp)
    800023d0:	02010413          	addi	s0,sp,32
    800023d4:	00050913          	mv	s2,a0
        return size == 0;
    800023d8:	02092783          	lw	a5,32(s2)
    while (!readyThreadQueue.isEmpty()) {
    800023dc:	02078863          	beqz	a5,8000240c <_ZN9SchedulerD1Ev+0x50>
        delete readyThreadQueue.removeFirst();
    800023e0:	00890513          	addi	a0,s2,8
    800023e4:	00001097          	auipc	ra,0x1
    800023e8:	058080e7          	jalr	88(ra) # 8000343c <_ZN10ThreadList11removeFirstEv>
    800023ec:	00050493          	mv	s1,a0
    800023f0:	fe0504e3          	beqz	a0,800023d8 <_ZN9SchedulerD1Ev+0x1c>
    800023f4:	00001097          	auipc	ra,0x1
    800023f8:	bd4080e7          	jalr	-1068(ra) # 80002fc8 <_ZN3TCBD1Ev>
        kfree(addr);
    800023fc:	00048513          	mv	a0,s1
    80002400:	00000097          	auipc	ra,0x0
    80002404:	ae4080e7          	jalr	-1308(ra) # 80001ee4 <_Z5kfreePv>
    }
    80002408:	fd1ff06f          	j	800023d8 <_ZN9SchedulerD1Ev+0x1c>
    8000240c:	02890513          	addi	a0,s2,40
    80002410:	fffff097          	auipc	ra,0xfffff
    80002414:	504080e7          	jalr	1284(ra) # 80001914 <_ZN15KernelSemaphoreD1Ev>
Scheduler::~Scheduler() {
    80002418:	00890513          	addi	a0,s2,8
    8000241c:	00001097          	auipc	ra,0x1
    80002420:	1c4080e7          	jalr	452(ra) # 800035e0 <_ZN10ThreadListD1Ev>
    }
}
    80002424:	01813083          	ld	ra,24(sp)
    80002428:	01013403          	ld	s0,16(sp)
    8000242c:	00813483          	ld	s1,8(sp)
    80002430:	00013903          	ld	s2,0(sp)
    80002434:	02010113          	addi	sp,sp,32
    80002438:	00008067          	ret

000000008000243c <_Z18callSupervisorTrapmPv>:
#include "../h/syscall_c.h"

void *callSupervisorTrap(uint64 param, void *args) {
    8000243c:	ff010113          	addi	sp,sp,-16
    80002440:	00813423          	sd	s0,8(sp)
    80002444:	01010413          	addi	s0,sp,16
    __asm__ volatile ("ecall");
    80002448:	00000073          	ecall

    return (void *) param;
}
    8000244c:	00813403          	ld	s0,8(sp)
    80002450:	01010113          	addi	sp,sp,16
    80002454:	00008067          	ret

0000000080002458 <_ZN7_threadC1EPFvPvES0_>:

_thread::_thread(_thread::Body body, void *arg) : id(0), body(body), arg(arg) {
    80002458:	ff010113          	addi	sp,sp,-16
    8000245c:	00813423          	sd	s0,8(sp)
    80002460:	01010413          	addi	s0,sp,16
    80002464:	00053023          	sd	zero,0(a0)
    80002468:	00b53423          	sd	a1,8(a0)
    8000246c:	00c53823          	sd	a2,16(a0)
}
    80002470:	00813403          	ld	s0,8(sp)
    80002474:	01010113          	addi	sp,sp,16
    80002478:	00008067          	ret

000000008000247c <_Z9mem_allocm>:

_sem::~_sem() {
    sem_close(this);
}

void *mem_alloc(size_t size) {
    8000247c:	fe010113          	addi	sp,sp,-32
    80002480:	00113c23          	sd	ra,24(sp)
    80002484:	00813823          	sd	s0,16(sp)
    80002488:	02010413          	addi	s0,sp,32
    8000248c:	fea43423          	sd	a0,-24(s0)
    return callSupervisorTrap(0x01, &size);
    80002490:	fe840593          	addi	a1,s0,-24
    80002494:	00100513          	li	a0,1
    80002498:	00000097          	auipc	ra,0x0
    8000249c:	fa4080e7          	jalr	-92(ra) # 8000243c <_Z18callSupervisorTrapmPv>
}
    800024a0:	01813083          	ld	ra,24(sp)
    800024a4:	01013403          	ld	s0,16(sp)
    800024a8:	02010113          	addi	sp,sp,32
    800024ac:	00008067          	ret

00000000800024b0 <_Z8mem_freePv>:

int mem_free(void *addr) {
    800024b0:	ff010113          	addi	sp,sp,-16
    800024b4:	00113423          	sd	ra,8(sp)
    800024b8:	00813023          	sd	s0,0(sp)
    800024bc:	01010413          	addi	s0,sp,16
    800024c0:	00050593          	mv	a1,a0
    return (uint64) callSupervisorTrap(0x02, addr);
    800024c4:	00200513          	li	a0,2
    800024c8:	00000097          	auipc	ra,0x0
    800024cc:	f74080e7          	jalr	-140(ra) # 8000243c <_Z18callSupervisorTrapmPv>
}
    800024d0:	0005051b          	sext.w	a0,a0
    800024d4:	00813083          	ld	ra,8(sp)
    800024d8:	00013403          	ld	s0,0(sp)
    800024dc:	01010113          	addi	sp,sp,16
    800024e0:	00008067          	ret

00000000800024e4 <_Z13thread_createPP7_threadPFvPvES2_>:

int thread_create(thread_t *handle, void(*start_routine)(void *), void *arg) {
    if (!handle) return -1;
    800024e4:	06050c63          	beqz	a0,8000255c <_Z13thread_createPP7_threadPFvPvES2_+0x78>
int thread_create(thread_t *handle, void(*start_routine)(void *), void *arg) {
    800024e8:	fb010113          	addi	sp,sp,-80
    800024ec:	04113423          	sd	ra,72(sp)
    800024f0:	04813023          	sd	s0,64(sp)
    800024f4:	02913c23          	sd	s1,56(sp)
    800024f8:	03213823          	sd	s2,48(sp)
    800024fc:	03313423          	sd	s3,40(sp)
    80002500:	05010413          	addi	s0,sp,80
    80002504:	00050493          	mv	s1,a0
    80002508:	00058993          	mv	s3,a1
    8000250c:	00060913          	mv	s2,a2
    *handle = new _thread;
    80002510:	01800513          	li	a0,24
    80002514:	00000097          	auipc	ra,0x0
    80002518:	288080e7          	jalr	648(ra) # 8000279c <_Znwm>
    8000251c:	00a4b023          	sd	a0,0(s1)
    uint64 args[] = {(uint64) *handle, (uint64) start_routine, (uint64) arg};
    80002520:	faa43c23          	sd	a0,-72(s0)
    80002524:	fd343023          	sd	s3,-64(s0)
    80002528:	fd243423          	sd	s2,-56(s0)
    return (uint64) callSupervisorTrap(0x11, args);
    8000252c:	fb840593          	addi	a1,s0,-72
    80002530:	01100513          	li	a0,17
    80002534:	00000097          	auipc	ra,0x0
    80002538:	f08080e7          	jalr	-248(ra) # 8000243c <_Z18callSupervisorTrapmPv>
    8000253c:	0005051b          	sext.w	a0,a0
}
    80002540:	04813083          	ld	ra,72(sp)
    80002544:	04013403          	ld	s0,64(sp)
    80002548:	03813483          	ld	s1,56(sp)
    8000254c:	03013903          	ld	s2,48(sp)
    80002550:	02813983          	ld	s3,40(sp)
    80002554:	05010113          	addi	sp,sp,80
    80002558:	00008067          	ret
    if (!handle) return -1;
    8000255c:	fff00513          	li	a0,-1
}
    80002560:	00008067          	ret

0000000080002564 <_Z11thread_exitv>:

int thread_exit() {
    80002564:	ff010113          	addi	sp,sp,-16
    80002568:	00113423          	sd	ra,8(sp)
    8000256c:	00813023          	sd	s0,0(sp)
    80002570:	01010413          	addi	s0,sp,16
    return (uint64) callSupervisorTrap(0x12, 0);
    80002574:	00000593          	li	a1,0
    80002578:	01200513          	li	a0,18
    8000257c:	00000097          	auipc	ra,0x0
    80002580:	ec0080e7          	jalr	-320(ra) # 8000243c <_Z18callSupervisorTrapmPv>
}
    80002584:	0005051b          	sext.w	a0,a0
    80002588:	00813083          	ld	ra,8(sp)
    8000258c:	00013403          	ld	s0,0(sp)
    80002590:	01010113          	addi	sp,sp,16
    80002594:	00008067          	ret

0000000080002598 <_Z15thread_dispatchv>:

void thread_dispatch() {
    80002598:	ff010113          	addi	sp,sp,-16
    8000259c:	00113423          	sd	ra,8(sp)
    800025a0:	00813023          	sd	s0,0(sp)
    800025a4:	01010413          	addi	s0,sp,16
    callSupervisorTrap(0x13, 0);
    800025a8:	00000593          	li	a1,0
    800025ac:	01300513          	li	a0,19
    800025b0:	00000097          	auipc	ra,0x0
    800025b4:	e8c080e7          	jalr	-372(ra) # 8000243c <_Z18callSupervisorTrapmPv>
}
    800025b8:	00813083          	ld	ra,8(sp)
    800025bc:	00013403          	ld	s0,0(sp)
    800025c0:	01010113          	addi	sp,sp,16
    800025c4:	00008067          	ret

00000000800025c8 <_Z8sem_openPP4_semj>:

int sem_open(sem_t *handle, unsigned init) {
    if (!handle) return -1;
    800025c8:	06050863          	beqz	a0,80002638 <_Z8sem_openPP4_semj+0x70>
int sem_open(sem_t *handle, unsigned init) {
    800025cc:	fd010113          	addi	sp,sp,-48
    800025d0:	02113423          	sd	ra,40(sp)
    800025d4:	02813023          	sd	s0,32(sp)
    800025d8:	00913c23          	sd	s1,24(sp)
    800025dc:	01213823          	sd	s2,16(sp)
    800025e0:	03010413          	addi	s0,sp,48
    800025e4:	00050913          	mv	s2,a0
    800025e8:	00058493          	mv	s1,a1
    *handle = new _sem;
    800025ec:	00800513          	li	a0,8
    800025f0:	00000097          	auipc	ra,0x0
    800025f4:	1ac080e7          	jalr	428(ra) # 8000279c <_Znwm>
    800025f8:	00a93023          	sd	a0,0(s2)
    uint64 args[] = {(uint64) *handle, (uint64) init};
    800025fc:	fca43823          	sd	a0,-48(s0)
    80002600:	02049593          	slli	a1,s1,0x20
    80002604:	0205d593          	srli	a1,a1,0x20
    80002608:	fcb43c23          	sd	a1,-40(s0)
    return (uint64) callSupervisorTrap(0x21, args);
    8000260c:	fd040593          	addi	a1,s0,-48
    80002610:	02100513          	li	a0,33
    80002614:	00000097          	auipc	ra,0x0
    80002618:	e28080e7          	jalr	-472(ra) # 8000243c <_Z18callSupervisorTrapmPv>
    8000261c:	0005051b          	sext.w	a0,a0
}
    80002620:	02813083          	ld	ra,40(sp)
    80002624:	02013403          	ld	s0,32(sp)
    80002628:	01813483          	ld	s1,24(sp)
    8000262c:	01013903          	ld	s2,16(sp)
    80002630:	03010113          	addi	sp,sp,48
    80002634:	00008067          	ret
    if (!handle) return -1;
    80002638:	fff00513          	li	a0,-1
}
    8000263c:	00008067          	ret

0000000080002640 <_Z9sem_closeP4_sem>:

int sem_close(sem_t handle) {
    80002640:	ff010113          	addi	sp,sp,-16
    80002644:	00113423          	sd	ra,8(sp)
    80002648:	00813023          	sd	s0,0(sp)
    8000264c:	01010413          	addi	s0,sp,16
    80002650:	00050593          	mv	a1,a0
    return (uint64) callSupervisorTrap(0x22, handle);
    80002654:	02200513          	li	a0,34
    80002658:	00000097          	auipc	ra,0x0
    8000265c:	de4080e7          	jalr	-540(ra) # 8000243c <_Z18callSupervisorTrapmPv>
}
    80002660:	0005051b          	sext.w	a0,a0
    80002664:	00813083          	ld	ra,8(sp)
    80002668:	00013403          	ld	s0,0(sp)
    8000266c:	01010113          	addi	sp,sp,16
    80002670:	00008067          	ret

0000000080002674 <_ZN4_semD1Ev>:
_sem::~_sem() {
    80002674:	ff010113          	addi	sp,sp,-16
    80002678:	00113423          	sd	ra,8(sp)
    8000267c:	00813023          	sd	s0,0(sp)
    80002680:	01010413          	addi	s0,sp,16
    sem_close(this);
    80002684:	00000097          	auipc	ra,0x0
    80002688:	fbc080e7          	jalr	-68(ra) # 80002640 <_Z9sem_closeP4_sem>
}
    8000268c:	00813083          	ld	ra,8(sp)
    80002690:	00013403          	ld	s0,0(sp)
    80002694:	01010113          	addi	sp,sp,16
    80002698:	00008067          	ret

000000008000269c <_Z8sem_waitP4_sem>:

int sem_wait(sem_t handle) {
    8000269c:	ff010113          	addi	sp,sp,-16
    800026a0:	00113423          	sd	ra,8(sp)
    800026a4:	00813023          	sd	s0,0(sp)
    800026a8:	01010413          	addi	s0,sp,16
    800026ac:	00050593          	mv	a1,a0
    return (uint64) callSupervisorTrap(0x23, handle);
    800026b0:	02300513          	li	a0,35
    800026b4:	00000097          	auipc	ra,0x0
    800026b8:	d88080e7          	jalr	-632(ra) # 8000243c <_Z18callSupervisorTrapmPv>
}
    800026bc:	0005051b          	sext.w	a0,a0
    800026c0:	00813083          	ld	ra,8(sp)
    800026c4:	00013403          	ld	s0,0(sp)
    800026c8:	01010113          	addi	sp,sp,16
    800026cc:	00008067          	ret

00000000800026d0 <_Z10sem_signalP4_sem>:

int sem_signal(sem_t handle) {
    800026d0:	ff010113          	addi	sp,sp,-16
    800026d4:	00113423          	sd	ra,8(sp)
    800026d8:	00813023          	sd	s0,0(sp)
    800026dc:	01010413          	addi	s0,sp,16
    800026e0:	00050593          	mv	a1,a0
    return (uint64) callSupervisorTrap(0x24, handle);
    800026e4:	02400513          	li	a0,36
    800026e8:	00000097          	auipc	ra,0x0
    800026ec:	d54080e7          	jalr	-684(ra) # 8000243c <_Z18callSupervisorTrapmPv>
}
    800026f0:	0005051b          	sext.w	a0,a0
    800026f4:	00813083          	ld	ra,8(sp)
    800026f8:	00013403          	ld	s0,0(sp)
    800026fc:	01010113          	addi	sp,sp,16
    80002700:	00008067          	ret

0000000080002704 <_Z10time_sleepm>:

int time_sleep(time_t time) {
    80002704:	ff010113          	addi	sp,sp,-16
    80002708:	00113423          	sd	ra,8(sp)
    8000270c:	00813023          	sd	s0,0(sp)
    80002710:	01010413          	addi	s0,sp,16
    80002714:	00050593          	mv	a1,a0
    return (uint64) callSupervisorTrap(0x31, (void *) time);
    80002718:	03100513          	li	a0,49
    8000271c:	00000097          	auipc	ra,0x0
    80002720:	d20080e7          	jalr	-736(ra) # 8000243c <_Z18callSupervisorTrapmPv>
}
    80002724:	0005051b          	sext.w	a0,a0
    80002728:	00813083          	ld	ra,8(sp)
    8000272c:	00013403          	ld	s0,0(sp)
    80002730:	01010113          	addi	sp,sp,16
    80002734:	00008067          	ret

0000000080002738 <_Z4getcv>:

char getc() {
    80002738:	ff010113          	addi	sp,sp,-16
    8000273c:	00113423          	sd	ra,8(sp)
    80002740:	00813023          	sd	s0,0(sp)
    80002744:	01010413          	addi	s0,sp,16
    return (uint64) callSupervisorTrap(0x41, nullptr);
    80002748:	00000593          	li	a1,0
    8000274c:	04100513          	li	a0,65
    80002750:	00000097          	auipc	ra,0x0
    80002754:	cec080e7          	jalr	-788(ra) # 8000243c <_Z18callSupervisorTrapmPv>
}
    80002758:	0ff57513          	andi	a0,a0,255
    8000275c:	00813083          	ld	ra,8(sp)
    80002760:	00013403          	ld	s0,0(sp)
    80002764:	01010113          	addi	sp,sp,16
    80002768:	00008067          	ret

000000008000276c <_Z4putcc>:

void putc(char chr) {
    8000276c:	ff010113          	addi	sp,sp,-16
    80002770:	00113423          	sd	ra,8(sp)
    80002774:	00813023          	sd	s0,0(sp)
    80002778:	01010413          	addi	s0,sp,16
    8000277c:	00050593          	mv	a1,a0
    callSupervisorTrap(0x42, (void *) (uint64) chr);
    80002780:	04200513          	li	a0,66
    80002784:	00000097          	auipc	ra,0x0
    80002788:	cb8080e7          	jalr	-840(ra) # 8000243c <_Z18callSupervisorTrapmPv>
}
    8000278c:	00813083          	ld	ra,8(sp)
    80002790:	00013403          	ld	s0,0(sp)
    80002794:	01010113          	addi	sp,sp,16
    80002798:	00008067          	ret

000000008000279c <_Znwm>:
#include "../h/syscall_cpp.hpp"

void *operator new(size_t sz) {
    8000279c:	ff010113          	addi	sp,sp,-16
    800027a0:	00113423          	sd	ra,8(sp)
    800027a4:	00813023          	sd	s0,0(sp)
    800027a8:	01010413          	addi	s0,sp,16
    return mem_alloc(sz);
    800027ac:	00000097          	auipc	ra,0x0
    800027b0:	cd0080e7          	jalr	-816(ra) # 8000247c <_Z9mem_allocm>
}
    800027b4:	00813083          	ld	ra,8(sp)
    800027b8:	00013403          	ld	s0,0(sp)
    800027bc:	01010113          	addi	sp,sp,16
    800027c0:	00008067          	ret

00000000800027c4 <_Znam>:

void *operator new[](size_t sz) {
    800027c4:	ff010113          	addi	sp,sp,-16
    800027c8:	00113423          	sd	ra,8(sp)
    800027cc:	00813023          	sd	s0,0(sp)
    800027d0:	01010413          	addi	s0,sp,16
    return mem_alloc(sz);
    800027d4:	00000097          	auipc	ra,0x0
    800027d8:	ca8080e7          	jalr	-856(ra) # 8000247c <_Z9mem_allocm>
}
    800027dc:	00813083          	ld	ra,8(sp)
    800027e0:	00013403          	ld	s0,0(sp)
    800027e4:	01010113          	addi	sp,sp,16
    800027e8:	00008067          	ret

00000000800027ec <_ZdlPv>:

void operator delete(void *addr) {
    800027ec:	ff010113          	addi	sp,sp,-16
    800027f0:	00113423          	sd	ra,8(sp)
    800027f4:	00813023          	sd	s0,0(sp)
    800027f8:	01010413          	addi	s0,sp,16
    mem_free(addr);
    800027fc:	00000097          	auipc	ra,0x0
    80002800:	cb4080e7          	jalr	-844(ra) # 800024b0 <_Z8mem_freePv>
}
    80002804:	00813083          	ld	ra,8(sp)
    80002808:	00013403          	ld	s0,0(sp)
    8000280c:	01010113          	addi	sp,sp,16
    80002810:	00008067          	ret

0000000080002814 <_ZdaPv>:

void operator delete[](void *addr) {
    80002814:	ff010113          	addi	sp,sp,-16
    80002818:	00113423          	sd	ra,8(sp)
    8000281c:	00813023          	sd	s0,0(sp)
    80002820:	01010413          	addi	s0,sp,16
    mem_free(addr);
    80002824:	00000097          	auipc	ra,0x0
    80002828:	c8c080e7          	jalr	-884(ra) # 800024b0 <_Z8mem_freePv>
}
    8000282c:	00813083          	ld	ra,8(sp)
    80002830:	00013403          	ld	s0,0(sp)
    80002834:	01010113          	addi	sp,sp,16
    80002838:	00008067          	ret

000000008000283c <_Z12kprintStringPKc>:
#include "../h/SysPrint.h"
#include "../lib/console.h"

PrintMutex *PrintMutex::instance = nullptr;

void kprintString(char const *string) {
    8000283c:	fe010113          	addi	sp,sp,-32
    80002840:	00113c23          	sd	ra,24(sp)
    80002844:	00813823          	sd	s0,16(sp)
    80002848:	00913423          	sd	s1,8(sp)
    8000284c:	02010413          	addi	s0,sp,32
    80002850:	00050493          	mv	s1,a0
#include "Mutex.h"

class PrintMutex : public KernelObject {
public:
    static PrintMutex* getInstance() {
        if (!instance) instance = new PrintMutex;
    80002854:	00007797          	auipc	a5,0x7
    80002858:	5f47b783          	ld	a5,1524(a5) # 80009e48 <_ZN10PrintMutex8instanceE>
    8000285c:	02078863          	beqz	a5,8000288c <_Z12kprintStringPKc+0x50>
        return instance;
    }

    static void wait() {
        getInstance()->mutex.wait();
    80002860:	00007517          	auipc	a0,0x7
    80002864:	5e853503          	ld	a0,1512(a0) # 80009e48 <_ZN10PrintMutex8instanceE>
    80002868:	00850513          	addi	a0,a0,8
    8000286c:	fffff097          	auipc	ra,0xfffff
    80002870:	6b8080e7          	jalr	1720(ra) # 80001f24 <_ZN5Mutex4waitEv>
    PrintMutex::wait();
    while (*string != '\0') {
    80002874:	0004c503          	lbu	a0,0(s1)
    80002878:	04050463          	beqz	a0,800028c0 <_Z12kprintStringPKc+0x84>
        __putc(*string);
    8000287c:	00005097          	auipc	ra,0x5
    80002880:	9d0080e7          	jalr	-1584(ra) # 8000724c <__putc>
        string++;
    80002884:	00148493          	addi	s1,s1,1
    while (*string != '\0') {
    80002888:	fedff06f          	j	80002874 <_Z12kprintStringPKc+0x38>
        return kmalloc(size);
    8000288c:	03800513          	li	a0,56
    80002890:	fffff097          	auipc	ra,0xfffff
    80002894:	458080e7          	jalr	1112(ra) # 80001ce8 <_Z7kmallocm>
    80002898:	00100793          	li	a5,1
    8000289c:	00f52423          	sw	a5,8(a0)
    explicit ThreadList() = default;
    800028a0:	00053823          	sd	zero,16(a0)
    800028a4:	00053c23          	sd	zero,24(a0)
    800028a8:	02053023          	sd	zero,32(a0)
    800028ac:	02052423          	sw	zero,40(a0)
    800028b0:	02053823          	sd	zero,48(a0)
        if (!instance) instance = new PrintMutex;
    800028b4:	00007797          	auipc	a5,0x7
    800028b8:	58a7ba23          	sd	a0,1428(a5) # 80009e48 <_ZN10PrintMutex8instanceE>
    800028bc:	fa5ff06f          	j	80002860 <_Z12kprintStringPKc+0x24>
    800028c0:	00007797          	auipc	a5,0x7
    800028c4:	5887b783          	ld	a5,1416(a5) # 80009e48 <_ZN10PrintMutex8instanceE>
    800028c8:	02078663          	beqz	a5,800028f4 <_Z12kprintStringPKc+0xb8>
    }

    static void signal() {
        getInstance()->mutex.signal();
    800028cc:	00007517          	auipc	a0,0x7
    800028d0:	57c53503          	ld	a0,1404(a0) # 80009e48 <_ZN10PrintMutex8instanceE>
    800028d4:	00850513          	addi	a0,a0,8
    800028d8:	fffff097          	auipc	ra,0xfffff
    800028dc:	6cc080e7          	jalr	1740(ra) # 80001fa4 <_ZN5Mutex6signalEv>
    }
    PrintMutex::signal();
}
    800028e0:	01813083          	ld	ra,24(sp)
    800028e4:	01013403          	ld	s0,16(sp)
    800028e8:	00813483          	ld	s1,8(sp)
    800028ec:	02010113          	addi	sp,sp,32
    800028f0:	00008067          	ret
    800028f4:	03800513          	li	a0,56
    800028f8:	fffff097          	auipc	ra,0xfffff
    800028fc:	3f0080e7          	jalr	1008(ra) # 80001ce8 <_Z7kmallocm>
    80002900:	00100793          	li	a5,1
    80002904:	00f52423          	sw	a5,8(a0)
    80002908:	00053823          	sd	zero,16(a0)
    8000290c:	00053c23          	sd	zero,24(a0)
    80002910:	02053023          	sd	zero,32(a0)
    80002914:	02052423          	sw	zero,40(a0)
    80002918:	02053823          	sd	zero,48(a0)
        if (!instance) instance = new PrintMutex;
    8000291c:	00007797          	auipc	a5,0x7
    80002920:	52a7b623          	sd	a0,1324(a5) # 80009e48 <_ZN10PrintMutex8instanceE>
    80002924:	fa9ff06f          	j	800028cc <_Z12kprintStringPKc+0x90>

0000000080002928 <_Z13kprintIntegeri>:

void kprintInteger(int integer) {
    80002928:	fd010113          	addi	sp,sp,-48
    8000292c:	02113423          	sd	ra,40(sp)
    80002930:	02813023          	sd	s0,32(sp)
    80002934:	00913c23          	sd	s1,24(sp)
    80002938:	03010413          	addi	s0,sp,48
    8000293c:	00050493          	mv	s1,a0
    80002940:	00007797          	auipc	a5,0x7
    80002944:	5087b783          	ld	a5,1288(a5) # 80009e48 <_ZN10PrintMutex8instanceE>
    80002948:	0a078263          	beqz	a5,800029ec <_Z13kprintIntegeri+0xc4>
        getInstance()->mutex.wait();
    8000294c:	00007517          	auipc	a0,0x7
    80002950:	4fc53503          	ld	a0,1276(a0) # 80009e48 <_ZN10PrintMutex8instanceE>
    80002954:	00850513          	addi	a0,a0,8
    80002958:	fffff097          	auipc	ra,0xfffff
    8000295c:	5cc080e7          	jalr	1484(ra) # 80001f24 <_ZN5Mutex4waitEv>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if (integer < 0) {
    80002960:	0c04c063          	bltz	s1,80002a20 <_Z13kprintIntegeri+0xf8>
        neg = 1;
        x = -integer;
    } else {
        x = integer;
    80002964:	0004851b          	sext.w	a0,s1
    neg = 0;
    80002968:	00000593          	li	a1,0
    }

    i = 0;
    8000296c:	00000493          	li	s1,0
    do {
        buf[i++] = digits[x % 10];
    80002970:	00a00693          	li	a3,10
    80002974:	02d577bb          	remuw	a5,a0,a3
    80002978:	00048613          	mv	a2,s1
    8000297c:	0014849b          	addiw	s1,s1,1
    80002980:	02079713          	slli	a4,a5,0x20
    80002984:	02075713          	srli	a4,a4,0x20
    80002988:	00006797          	auipc	a5,0x6
    8000298c:	85878793          	addi	a5,a5,-1960 # 800081e0 <_ZZ13kprintIntegeriE6digits>
    80002990:	00e787b3          	add	a5,a5,a4
    80002994:	0007c703          	lbu	a4,0(a5)
    80002998:	fe040793          	addi	a5,s0,-32
    8000299c:	00c787b3          	add	a5,a5,a2
    800029a0:	fee78823          	sb	a4,-16(a5)
    } while ((x /= 10) != 0);
    800029a4:	0005071b          	sext.w	a4,a0
    800029a8:	02d5553b          	divuw	a0,a0,a3
    800029ac:	00900793          	li	a5,9
    800029b0:	fce7e0e3          	bltu	a5,a4,80002970 <_Z13kprintIntegeri+0x48>
    if (neg) buf[i++] = '-';
    800029b4:	00058c63          	beqz	a1,800029cc <_Z13kprintIntegeri+0xa4>
    800029b8:	fe040793          	addi	a5,s0,-32
    800029bc:	009784b3          	add	s1,a5,s1
    800029c0:	02d00793          	li	a5,45
    800029c4:	fef48823          	sb	a5,-16(s1)
    800029c8:	0026049b          	addiw	s1,a2,2

    while (--i >= 0)
    800029cc:	fff4849b          	addiw	s1,s1,-1
    800029d0:	0404ce63          	bltz	s1,80002a2c <_Z13kprintIntegeri+0x104>
        __putc(buf[i]);
    800029d4:	fe040793          	addi	a5,s0,-32
    800029d8:	009787b3          	add	a5,a5,s1
    800029dc:	ff07c503          	lbu	a0,-16(a5)
    800029e0:	00005097          	auipc	ra,0x5
    800029e4:	86c080e7          	jalr	-1940(ra) # 8000724c <__putc>
    800029e8:	fe5ff06f          	j	800029cc <_Z13kprintIntegeri+0xa4>
    800029ec:	03800513          	li	a0,56
    800029f0:	fffff097          	auipc	ra,0xfffff
    800029f4:	2f8080e7          	jalr	760(ra) # 80001ce8 <_Z7kmallocm>
    800029f8:	00100793          	li	a5,1
    800029fc:	00f52423          	sw	a5,8(a0)
    80002a00:	00053823          	sd	zero,16(a0)
    80002a04:	00053c23          	sd	zero,24(a0)
    80002a08:	02053023          	sd	zero,32(a0)
    80002a0c:	02052423          	sw	zero,40(a0)
    80002a10:	02053823          	sd	zero,48(a0)
        if (!instance) instance = new PrintMutex;
    80002a14:	00007797          	auipc	a5,0x7
    80002a18:	42a7ba23          	sd	a0,1076(a5) # 80009e48 <_ZN10PrintMutex8instanceE>
    80002a1c:	f31ff06f          	j	8000294c <_Z13kprintIntegeri+0x24>
        x = -integer;
    80002a20:	4090053b          	negw	a0,s1
        neg = 1;
    80002a24:	00100593          	li	a1,1
    80002a28:	f45ff06f          	j	8000296c <_Z13kprintIntegeri+0x44>
    80002a2c:	00007797          	auipc	a5,0x7
    80002a30:	41c7b783          	ld	a5,1052(a5) # 80009e48 <_ZN10PrintMutex8instanceE>
    80002a34:	02078663          	beqz	a5,80002a60 <_Z13kprintIntegeri+0x138>
        getInstance()->mutex.signal();
    80002a38:	00007517          	auipc	a0,0x7
    80002a3c:	41053503          	ld	a0,1040(a0) # 80009e48 <_ZN10PrintMutex8instanceE>
    80002a40:	00850513          	addi	a0,a0,8
    80002a44:	fffff097          	auipc	ra,0xfffff
    80002a48:	560080e7          	jalr	1376(ra) # 80001fa4 <_ZN5Mutex6signalEv>
    PrintMutex::signal();
}
    80002a4c:	02813083          	ld	ra,40(sp)
    80002a50:	02013403          	ld	s0,32(sp)
    80002a54:	01813483          	ld	s1,24(sp)
    80002a58:	03010113          	addi	sp,sp,48
    80002a5c:	00008067          	ret
    80002a60:	03800513          	li	a0,56
    80002a64:	fffff097          	auipc	ra,0xfffff
    80002a68:	284080e7          	jalr	644(ra) # 80001ce8 <_Z7kmallocm>
    80002a6c:	00100793          	li	a5,1
    80002a70:	00f52423          	sw	a5,8(a0)
    80002a74:	00053823          	sd	zero,16(a0)
    80002a78:	00053c23          	sd	zero,24(a0)
    80002a7c:	02053023          	sd	zero,32(a0)
    80002a80:	02052423          	sw	zero,40(a0)
    80002a84:	02053823          	sd	zero,48(a0)
        if (!instance) instance = new PrintMutex;
    80002a88:	00007797          	auipc	a5,0x7
    80002a8c:	3ca7b023          	sd	a0,960(a5) # 80009e48 <_ZN10PrintMutex8instanceE>
    80002a90:	fa9ff06f          	j	80002a38 <_Z13kprintIntegeri+0x110>

0000000080002a94 <_Z14kprintUnsignedm>:

void kprintUnsigned(uint64 x) {
    80002a94:	fd010113          	addi	sp,sp,-48
    80002a98:	02113423          	sd	ra,40(sp)
    80002a9c:	02813023          	sd	s0,32(sp)
    80002aa0:	00913c23          	sd	s1,24(sp)
    80002aa4:	01213823          	sd	s2,16(sp)
    80002aa8:	03010413          	addi	s0,sp,48
    80002aac:	00050913          	mv	s2,a0
    80002ab0:	00007797          	auipc	a5,0x7
    80002ab4:	3987b783          	ld	a5,920(a5) # 80009e48 <_ZN10PrintMutex8instanceE>
    80002ab8:	06078a63          	beqz	a5,80002b2c <_Z14kprintUnsignedm+0x98>
        getInstance()->mutex.wait();
    80002abc:	00007517          	auipc	a0,0x7
    80002ac0:	38c53503          	ld	a0,908(a0) # 80009e48 <_ZN10PrintMutex8instanceE>
    80002ac4:	00850513          	addi	a0,a0,8
    80002ac8:	fffff097          	auipc	ra,0xfffff
    80002acc:	45c080e7          	jalr	1116(ra) # 80001f24 <_ZN5Mutex4waitEv>
    PrintMutex::wait();
    static char digits[] = "0123456789";
    char buf[16];

    int i = 0;
    80002ad0:	00000493          	li	s1,0
    do {
        buf[i++] = digits[x % 10];
    80002ad4:	00a00693          	li	a3,10
    80002ad8:	02d97633          	remu	a2,s2,a3
    80002adc:	00005717          	auipc	a4,0x5
    80002ae0:	70470713          	addi	a4,a4,1796 # 800081e0 <_ZZ13kprintIntegeriE6digits>
    80002ae4:	00c70733          	add	a4,a4,a2
    80002ae8:	01074703          	lbu	a4,16(a4)
    80002aec:	fe040613          	addi	a2,s0,-32
    80002af0:	009607b3          	add	a5,a2,s1
    80002af4:	0014849b          	addiw	s1,s1,1
    80002af8:	fee78823          	sb	a4,-16(a5)
    } while ((x /= 10) != 0);
    80002afc:	00090713          	mv	a4,s2
    80002b00:	02d95933          	divu	s2,s2,a3
    80002b04:	00900793          	li	a5,9
    80002b08:	fce7e6e3          	bltu	a5,a4,80002ad4 <_Z14kprintUnsignedm+0x40>

    while (--i >= 0)
    80002b0c:	fff4849b          	addiw	s1,s1,-1
    80002b10:	0404c863          	bltz	s1,80002b60 <_Z14kprintUnsignedm+0xcc>
        __putc(buf[i]);
    80002b14:	fe040793          	addi	a5,s0,-32
    80002b18:	009787b3          	add	a5,a5,s1
    80002b1c:	ff07c503          	lbu	a0,-16(a5)
    80002b20:	00004097          	auipc	ra,0x4
    80002b24:	72c080e7          	jalr	1836(ra) # 8000724c <__putc>
    80002b28:	fe5ff06f          	j	80002b0c <_Z14kprintUnsignedm+0x78>
    80002b2c:	03800513          	li	a0,56
    80002b30:	fffff097          	auipc	ra,0xfffff
    80002b34:	1b8080e7          	jalr	440(ra) # 80001ce8 <_Z7kmallocm>
    80002b38:	00100793          	li	a5,1
    80002b3c:	00f52423          	sw	a5,8(a0)
    80002b40:	00053823          	sd	zero,16(a0)
    80002b44:	00053c23          	sd	zero,24(a0)
    80002b48:	02053023          	sd	zero,32(a0)
    80002b4c:	02052423          	sw	zero,40(a0)
    80002b50:	02053823          	sd	zero,48(a0)
        if (!instance) instance = new PrintMutex;
    80002b54:	00007797          	auipc	a5,0x7
    80002b58:	2ea7ba23          	sd	a0,756(a5) # 80009e48 <_ZN10PrintMutex8instanceE>
    80002b5c:	f61ff06f          	j	80002abc <_Z14kprintUnsignedm+0x28>
    80002b60:	00007797          	auipc	a5,0x7
    80002b64:	2e87b783          	ld	a5,744(a5) # 80009e48 <_ZN10PrintMutex8instanceE>
    80002b68:	02078863          	beqz	a5,80002b98 <_Z14kprintUnsignedm+0x104>
        getInstance()->mutex.signal();
    80002b6c:	00007517          	auipc	a0,0x7
    80002b70:	2dc53503          	ld	a0,732(a0) # 80009e48 <_ZN10PrintMutex8instanceE>
    80002b74:	00850513          	addi	a0,a0,8
    80002b78:	fffff097          	auipc	ra,0xfffff
    80002b7c:	42c080e7          	jalr	1068(ra) # 80001fa4 <_ZN5Mutex6signalEv>
    PrintMutex::signal();
}
    80002b80:	02813083          	ld	ra,40(sp)
    80002b84:	02013403          	ld	s0,32(sp)
    80002b88:	01813483          	ld	s1,24(sp)
    80002b8c:	01013903          	ld	s2,16(sp)
    80002b90:	03010113          	addi	sp,sp,48
    80002b94:	00008067          	ret
    80002b98:	03800513          	li	a0,56
    80002b9c:	fffff097          	auipc	ra,0xfffff
    80002ba0:	14c080e7          	jalr	332(ra) # 80001ce8 <_Z7kmallocm>
    80002ba4:	00100793          	li	a5,1
    80002ba8:	00f52423          	sw	a5,8(a0)
    80002bac:	00053823          	sd	zero,16(a0)
    80002bb0:	00053c23          	sd	zero,24(a0)
    80002bb4:	02053023          	sd	zero,32(a0)
    80002bb8:	02052423          	sw	zero,40(a0)
    80002bbc:	02053823          	sd	zero,48(a0)
        if (!instance) instance = new PrintMutex;
    80002bc0:	00007797          	auipc	a5,0x7
    80002bc4:	28a7b423          	sd	a0,648(a5) # 80009e48 <_ZN10PrintMutex8instanceE>
    80002bc8:	fa5ff06f          	j	80002b6c <_Z14kprintUnsignedm+0xd8>

0000000080002bcc <_ZN3TCB13threadWrapperEv>:
    TCB::contextSwitch(&old->context, &running->context);

    unlock()
}

void TCB::threadWrapper() {
    80002bcc:	fe010113          	addi	sp,sp,-32
    80002bd0:	00113c23          	sd	ra,24(sp)
    80002bd4:	00813823          	sd	s0,16(sp)
    80002bd8:	00913423          	sd	s1,8(sp)
    80002bdc:	02010413          	addi	s0,sp,32
    Riscv::popSppSpie(running->privileged);
    80002be0:	00007497          	auipc	s1,0x7
    80002be4:	27048493          	addi	s1,s1,624 # 80009e50 <_ZN3TCB7runningE>
    80002be8:	0004b783          	ld	a5,0(s1)
    80002bec:	0687c503          	lbu	a0,104(a5)
    80002bf0:	fffff097          	auipc	ra,0xfffff
    80002bf4:	418080e7          	jalr	1048(ra) # 80002008 <_ZN5Riscv10popSppSpieEb>
    running->body(running->args);
    80002bf8:	0004b783          	ld	a5,0(s1)
    80002bfc:	0087b703          	ld	a4,8(a5)
    80002c00:	0107b503          	ld	a0,16(a5)
    80002c04:	000700e7          	jalr	a4

    __asm__ volatile ("li a0, 0x12");
    80002c08:	01200513          	li	a0,18
    __asm__ volatile ("ecall");
    80002c0c:	00000073          	ecall
}
    80002c10:	01813083          	ld	ra,24(sp)
    80002c14:	01013403          	ld	s0,16(sp)
    80002c18:	00813483          	ld	s1,8(sp)
    80002c1c:	02010113          	addi	sp,sp,32
    80002c20:	00008067          	ret

0000000080002c24 <_ZN3TCBC1EPFvPvES0_mb>:
TCB::TCB(Body body, void *args, uint64 timeSlice, bool privileged) :
    80002c24:	fd010113          	addi	sp,sp,-48
    80002c28:	02113423          	sd	ra,40(sp)
    80002c2c:	02813023          	sd	s0,32(sp)
    80002c30:	00913c23          	sd	s1,24(sp)
    80002c34:	01213823          	sd	s2,16(sp)
    80002c38:	01313423          	sd	s3,8(sp)
    80002c3c:	01413023          	sd	s4,0(sp)
    80002c40:	03010413          	addi	s0,sp,48
    80002c44:	00050493          	mv	s1,a0
    80002c48:	00058913          	mv	s2,a1
    80002c4c:	00068a13          	mv	s4,a3
    80002c50:	00070993          	mv	s3,a4
        node(this) {
    80002c54:	00b53423          	sd	a1,8(a0)
    80002c58:	00c53823          	sd	a2,16(a0)
        threadStack(body != nullptr ? (uint64 *) kmalloc(DEFAULT_STACK_SIZE * sizeof(uint64)) : nullptr),
    80002c5c:	0a058863          	beqz	a1,80002d0c <_ZN3TCBC1EPFvPvES0_mb+0xe8>
    80002c60:	00008537          	lui	a0,0x8
    80002c64:	fffff097          	auipc	ra,0xfffff
    80002c68:	084080e7          	jalr	132(ra) # 80001ce8 <_Z7kmallocm>
        node(this) {
    80002c6c:	00a4bc23          	sd	a0,24(s1)
        kernelStack((uint64 *) kmalloc(DEFAULT_STACK_SIZE * sizeof(uint64))),
    80002c70:	00008537          	lui	a0,0x8
    80002c74:	fffff097          	auipc	ra,0xfffff
    80002c78:	074080e7          	jalr	116(ra) # 80001ce8 <_Z7kmallocm>
        node(this) {
    80002c7c:	02a4b023          	sd	a0,32(s1)
    80002c80:	00000797          	auipc	a5,0x0
    80002c84:	f4c78793          	addi	a5,a5,-180 # 80002bcc <_ZN3TCB13threadWrapperEv>
    80002c88:	02f4b423          	sd	a5,40(s1)
        context({(uint64) &threadWrapper, threadStack != nullptr ? (uint64) (threadStack + DEFAULT_STACK_SIZE) : 0}),
    80002c8c:	0184b783          	ld	a5,24(s1)
    80002c90:	08078263          	beqz	a5,80002d14 <_ZN3TCBC1EPFvPvES0_mb+0xf0>
    80002c94:	00008737          	lui	a4,0x8
    80002c98:	00e787b3          	add	a5,a5,a4
        node(this) {
    80002c9c:	02f4b823          	sd	a5,48(s1)
    80002ca0:	0344bc23          	sd	s4,56(s1)
    80002ca4:	0404a023          	sw	zero,64(s1)
    80002ca8:	04848a13          	addi	s4,s1,72
    80002cac:	0404b423          	sd	zero,72(s1)
    80002cb0:	0404b823          	sd	zero,80(s1)
    80002cb4:	0404bc23          	sd	zero,88(s1)
    80002cb8:	0604a023          	sw	zero,96(s1)
    80002cbc:	07348423          	sb	s3,104(s1)
    80002cc0:	00100793          	li	a5,1
    80002cc4:	06f4a823          	sw	a5,112(s1)
    80002cc8:	0604bc23          	sd	zero,120(s1)
    80002ccc:	0804b023          	sd	zero,128(s1)
    80002cd0:	0804b423          	sd	zero,136(s1)
    80002cd4:	0804a823          	sw	zero,144(s1)
    80002cd8:	0804bc23          	sd	zero,152(s1)

class TCB;

class ThreadNode : public KernelObject {
public:
    ThreadNode(TCB *data, ThreadNode *next = nullptr, ThreadNode *prev = nullptr) : data(data), next(next), prev(prev) {}
    80002cdc:	0a94b023          	sd	s1,160(s1)
    80002ce0:	0a04b423          	sd	zero,168(s1)
    80002ce4:	0a04b823          	sd	zero,176(s1)
    80002ce8:	0a04bc23          	sd	zero,184(s1)
    ssp = (uint64) (kernelStack + DEFAULT_STACK_SIZE);
    80002cec:	000087b7          	lui	a5,0x8
    80002cf0:	00f50533          	add	a0,a0,a5
    80002cf4:	00a4b023          	sd	a0,0(s1)
    if (body != nullptr)
    80002cf8:	04090663          	beqz	s2,80002d44 <_ZN3TCBC1EPFvPvES0_mb+0x120>
        Scheduler::put(this);
    80002cfc:	00048513          	mv	a0,s1
    80002d00:	fffff097          	auipc	ra,0xfffff
    80002d04:	650080e7          	jalr	1616(ra) # 80002350 <_ZN9Scheduler3putEP3TCB>
    80002d08:	03c0006f          	j	80002d44 <_ZN3TCBC1EPFvPvES0_mb+0x120>
        threadStack(body != nullptr ? (uint64 *) kmalloc(DEFAULT_STACK_SIZE * sizeof(uint64)) : nullptr),
    80002d0c:	00000513          	li	a0,0
    80002d10:	f5dff06f          	j	80002c6c <_ZN3TCBC1EPFvPvES0_mb+0x48>
        context({(uint64) &threadWrapper, threadStack != nullptr ? (uint64) (threadStack + DEFAULT_STACK_SIZE) : 0}),
    80002d14:	00000793          	li	a5,0
    80002d18:	f85ff06f          	j	80002c9c <_ZN3TCBC1EPFvPvES0_mb+0x78>
    80002d1c:	00050913          	mv	s2,a0
    80002d20:	07048513          	addi	a0,s1,112
    80002d24:	fffff097          	auipc	ra,0xfffff
    80002d28:	bf0080e7          	jalr	-1040(ra) # 80001914 <_ZN15KernelSemaphoreD1Ev>
        node(this) {
    80002d2c:	000a0513          	mv	a0,s4
    80002d30:	00001097          	auipc	ra,0x1
    80002d34:	8b0080e7          	jalr	-1872(ra) # 800035e0 <_ZN10ThreadListD1Ev>
    80002d38:	00090513          	mv	a0,s2
    80002d3c:	00008097          	auipc	ra,0x8
    80002d40:	21c080e7          	jalr	540(ra) # 8000af58 <_Unwind_Resume>
}
    80002d44:	02813083          	ld	ra,40(sp)
    80002d48:	02013403          	ld	s0,32(sp)
    80002d4c:	01813483          	ld	s1,24(sp)
    80002d50:	01013903          	ld	s2,16(sp)
    80002d54:	00813983          	ld	s3,8(sp)
    80002d58:	00013a03          	ld	s4,0(sp)
    80002d5c:	03010113          	addi	sp,sp,48
    80002d60:	00008067          	ret

0000000080002d64 <_ZN3TCB12createThreadEPFvPvES0_>:
TCB *TCB::createThread(TCB::Body body, void *args) {
    80002d64:	fd010113          	addi	sp,sp,-48
    80002d68:	02113423          	sd	ra,40(sp)
    80002d6c:	02813023          	sd	s0,32(sp)
    80002d70:	00913c23          	sd	s1,24(sp)
    80002d74:	01213823          	sd	s2,16(sp)
    80002d78:	01313423          	sd	s3,8(sp)
    80002d7c:	03010413          	addi	s0,sp,48
    80002d80:	00050913          	mv	s2,a0
    80002d84:	00058993          	mv	s3,a1
    80002d88:	0c000513          	li	a0,192
    80002d8c:	fffff097          	auipc	ra,0xfffff
    80002d90:	f5c080e7          	jalr	-164(ra) # 80001ce8 <_Z7kmallocm>
    80002d94:	00050493          	mv	s1,a0
    return new TCB(body, args, DEFAULT_TIME_SLICE);
    80002d98:	00000713          	li	a4,0
    80002d9c:	00200693          	li	a3,2
    80002da0:	00098613          	mv	a2,s3
    80002da4:	00090593          	mv	a1,s2
    80002da8:	00000097          	auipc	ra,0x0
    80002dac:	e7c080e7          	jalr	-388(ra) # 80002c24 <_ZN3TCBC1EPFvPvES0_mb>
    80002db0:	0200006f          	j	80002dd0 <_ZN3TCB12createThreadEPFvPvES0_+0x6c>
    80002db4:	00050913          	mv	s2,a0
        kfree(addr);
    80002db8:	00048513          	mv	a0,s1
    80002dbc:	fffff097          	auipc	ra,0xfffff
    80002dc0:	128080e7          	jalr	296(ra) # 80001ee4 <_Z5kfreePv>
    80002dc4:	00090513          	mv	a0,s2
    80002dc8:	00008097          	auipc	ra,0x8
    80002dcc:	190080e7          	jalr	400(ra) # 8000af58 <_Unwind_Resume>
}
    80002dd0:	00048513          	mv	a0,s1
    80002dd4:	02813083          	ld	ra,40(sp)
    80002dd8:	02013403          	ld	s0,32(sp)
    80002ddc:	01813483          	ld	s1,24(sp)
    80002de0:	01013903          	ld	s2,16(sp)
    80002de4:	00813983          	ld	s3,8(sp)
    80002de8:	03010113          	addi	sp,sp,48
    80002dec:	00008067          	ret

0000000080002df0 <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    80002df0:	fd010113          	addi	sp,sp,-48
    80002df4:	02113423          	sd	ra,40(sp)
    80002df8:	02813023          	sd	s0,32(sp)
    80002dfc:	00913c23          	sd	s1,24(sp)
    80002e00:	03010413          	addi	s0,sp,48
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80002e04:	100027f3          	csrr	a5,sstatus
    80002e08:	fcf43823          	sd	a5,-48(s0)
    return sstatus;
    80002e0c:	fd043783          	ld	a5,-48(s0)
    lock()
    80002e10:	fcf43c23          	sd	a5,-40(s0)
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80002e14:	00200793          	li	a5,2
    80002e18:	1007b073          	csrc	sstatus,a5
    TCB *old = running;
    80002e1c:	00007497          	auipc	s1,0x7
    80002e20:	0344b483          	ld	s1,52(s1) # 80009e50 <_ZN3TCB7runningE>
        return status == READY;
    80002e24:	0404a783          	lw	a5,64(s1)
    if (old->isReady()) Scheduler::put(old);
    80002e28:	04078e63          	beqz	a5,80002e84 <_ZN3TCB8dispatchEv+0x94>
    else if (old->isFinished()) {
    80002e2c:	00100713          	li	a4,1
    80002e30:	06e78263          	beq	a5,a4,80002e94 <_ZN3TCB8dispatchEv+0xa4>
    running = Scheduler::get();
    80002e34:	fffff097          	auipc	ra,0xfffff
    80002e38:	4b0080e7          	jalr	1200(ra) # 800022e4 <_ZN9Scheduler3getEv>
    80002e3c:	00007797          	auipc	a5,0x7
    80002e40:	00a7ba23          	sd	a0,20(a5) # 80009e50 <_ZN3TCB7runningE>
    if (!running) {
    80002e44:	04050e63          	beqz	a0,80002ea0 <_ZN3TCB8dispatchEv+0xb0>
    TCB::timeSliceCounter = 0;
    80002e48:	00007797          	auipc	a5,0x7
    80002e4c:	00878793          	addi	a5,a5,8 # 80009e50 <_ZN3TCB7runningE>
    80002e50:	0007b423          	sd	zero,8(a5)
    TCB::contextSwitch(&old->context, &running->context);
    80002e54:	0007b583          	ld	a1,0(a5)
    80002e58:	02858593          	addi	a1,a1,40
    80002e5c:	02848513          	addi	a0,s1,40
    80002e60:	ffffe097          	auipc	ra,0xffffe
    80002e64:	1a0080e7          	jalr	416(ra) # 80001000 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
    unlock()
    80002e68:	fd843783          	ld	a5,-40(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80002e6c:	10079073          	csrw	sstatus,a5
}
    80002e70:	02813083          	ld	ra,40(sp)
    80002e74:	02013403          	ld	s0,32(sp)
    80002e78:	01813483          	ld	s1,24(sp)
    80002e7c:	03010113          	addi	sp,sp,48
    80002e80:	00008067          	ret
    if (old->isReady()) Scheduler::put(old);
    80002e84:	00048513          	mv	a0,s1
    80002e88:	fffff097          	auipc	ra,0xfffff
    80002e8c:	4c8080e7          	jalr	1224(ra) # 80002350 <_ZN9Scheduler3putEP3TCB>
    80002e90:	fa5ff06f          	j	80002e34 <_ZN3TCB8dispatchEv+0x44>
        ThreadCollector::signal();
    80002e94:	00000097          	auipc	ra,0x0
    80002e98:	3dc080e7          	jalr	988(ra) # 80003270 <_ZN15ThreadCollector6signalEv>
    80002e9c:	f99ff06f          	j	80002e34 <_ZN3TCB8dispatchEv+0x44>
        running = IdleThread::getIdleThread();
    80002ea0:	ffffe097          	auipc	ra,0xffffe
    80002ea4:	490080e7          	jalr	1168(ra) # 80001330 <_ZN10IdleThread13getIdleThreadEv>
    80002ea8:	00007797          	auipc	a5,0x7
    80002eac:	faa7b423          	sd	a0,-88(a5) # 80009e50 <_ZN3TCB7runningE>
    80002eb0:	f99ff06f          	j	80002e48 <_ZN3TCB8dispatchEv+0x58>

0000000080002eb4 <_ZN3TCB4exitEv>:
void TCB::exit() {
    80002eb4:	ff010113          	addi	sp,sp,-16
    80002eb8:	00113423          	sd	ra,8(sp)
    80002ebc:	00813023          	sd	s0,0(sp)
    80002ec0:	01010413          	addi	s0,sp,16
    running->setFinished();
    80002ec4:	00007517          	auipc	a0,0x7
    80002ec8:	f8c53503          	ld	a0,-116(a0) # 80009e50 <_ZN3TCB7runningE>
        status = FINISHED;
    80002ecc:	00100793          	li	a5,1
    80002ed0:	04f52023          	sw	a5,64(a0)
    running->mutex.wait();
    80002ed4:	07050513          	addi	a0,a0,112
    80002ed8:	fffff097          	auipc	ra,0xfffff
    80002edc:	04c080e7          	jalr	76(ra) # 80001f24 <_ZN5Mutex4waitEv>
    while (!running->waitingToJoin.isEmpty()) {
    80002ee0:	00007517          	auipc	a0,0x7
    80002ee4:	f7053503          	ld	a0,-144(a0) # 80009e50 <_ZN3TCB7runningE>
        return size == 0;
    80002ee8:	06052783          	lw	a5,96(a0)
    80002eec:	02078063          	beqz	a5,80002f0c <_ZN3TCB4exitEv+0x58>
        TCB *thr = running->waitingToJoin.removeFirst();
    80002ef0:	04850513          	addi	a0,a0,72
    80002ef4:	00000097          	auipc	ra,0x0
    80002ef8:	548080e7          	jalr	1352(ra) # 8000343c <_ZN10ThreadList11removeFirstEv>
        status = READY;
    80002efc:	04052023          	sw	zero,64(a0)
        Scheduler::put(thr);
    80002f00:	fffff097          	auipc	ra,0xfffff
    80002f04:	450080e7          	jalr	1104(ra) # 80002350 <_ZN9Scheduler3putEP3TCB>
    while (!running->waitingToJoin.isEmpty()) {
    80002f08:	fd9ff06f          	j	80002ee0 <_ZN3TCB4exitEv+0x2c>
    running->mutex.signal();
    80002f0c:	07050513          	addi	a0,a0,112
    80002f10:	fffff097          	auipc	ra,0xfffff
    80002f14:	094080e7          	jalr	148(ra) # 80001fa4 <_ZN5Mutex6signalEv>
    ThreadCollector::put(running);
    80002f18:	00007517          	auipc	a0,0x7
    80002f1c:	f3853503          	ld	a0,-200(a0) # 80009e50 <_ZN3TCB7runningE>
    80002f20:	00000097          	auipc	ra,0x0
    80002f24:	384080e7          	jalr	900(ra) # 800032a4 <_ZN15ThreadCollector3putEP3TCB>
    dispatch();
    80002f28:	00000097          	auipc	ra,0x0
    80002f2c:	ec8080e7          	jalr	-312(ra) # 80002df0 <_ZN3TCB8dispatchEv>
}
    80002f30:	00813083          	ld	ra,8(sp)
    80002f34:	00013403          	ld	s0,0(sp)
    80002f38:	01010113          	addi	sp,sp,16
    80002f3c:	00008067          	ret

0000000080002f40 <_ZN3TCB4joinEv>:
        return status == FINISHED;
    80002f40:	04052703          	lw	a4,64(a0)

int TCB::join() {
    if (isFinished()) return 0;
    80002f44:	00100793          	li	a5,1
    80002f48:	06f70c63          	beq	a4,a5,80002fc0 <_ZN3TCB4joinEv+0x80>
int TCB::join() {
    80002f4c:	fe010113          	addi	sp,sp,-32
    80002f50:	00113c23          	sd	ra,24(sp)
    80002f54:	00813823          	sd	s0,16(sp)
    80002f58:	00913423          	sd	s1,8(sp)
    80002f5c:	01213023          	sd	s2,0(sp)
    80002f60:	02010413          	addi	s0,sp,32
    80002f64:	00050493          	mv	s1,a0

    mutex.wait();
    80002f68:	07050913          	addi	s2,a0,112
    80002f6c:	00090513          	mv	a0,s2
    80002f70:	fffff097          	auipc	ra,0xfffff
    80002f74:	fb4080e7          	jalr	-76(ra) # 80001f24 <_ZN5Mutex4waitEv>

    running->setBlocked();
    80002f78:	00007597          	auipc	a1,0x7
    80002f7c:	ed85b583          	ld	a1,-296(a1) # 80009e50 <_ZN3TCB7runningE>
        status = BLOCKED;
    80002f80:	00200793          	li	a5,2
    80002f84:	04f5a023          	sw	a5,64(a1)
    waitingToJoin.addLast(&running->node);
    80002f88:	0a058593          	addi	a1,a1,160
    80002f8c:	04848513          	addi	a0,s1,72
    80002f90:	00000097          	auipc	ra,0x0
    80002f94:	468080e7          	jalr	1128(ra) # 800033f8 <_ZN10ThreadList7addLastEP10ThreadNode>

    mutex.signal();
    80002f98:	00090513          	mv	a0,s2
    80002f9c:	fffff097          	auipc	ra,0xfffff
    80002fa0:	008080e7          	jalr	8(ra) # 80001fa4 <_ZN5Mutex6signalEv>

    return 0;
}
    80002fa4:	00000513          	li	a0,0
    80002fa8:	01813083          	ld	ra,24(sp)
    80002fac:	01013403          	ld	s0,16(sp)
    80002fb0:	00813483          	ld	s1,8(sp)
    80002fb4:	00013903          	ld	s2,0(sp)
    80002fb8:	02010113          	addi	sp,sp,32
    80002fbc:	00008067          	ret
    80002fc0:	00000513          	li	a0,0
    80002fc4:	00008067          	ret

0000000080002fc8 <_ZN3TCBD1Ev>:

TCB::~TCB() {
    80002fc8:	fe010113          	addi	sp,sp,-32
    80002fcc:	00113c23          	sd	ra,24(sp)
    80002fd0:	00813823          	sd	s0,16(sp)
    80002fd4:	00913423          	sd	s1,8(sp)
    80002fd8:	02010413          	addi	s0,sp,32
    80002fdc:	00050493          	mv	s1,a0
    kfree(kernelStack);
    80002fe0:	02053503          	ld	a0,32(a0)
    80002fe4:	fffff097          	auipc	ra,0xfffff
    80002fe8:	f00080e7          	jalr	-256(ra) # 80001ee4 <_Z5kfreePv>
    kfree(threadStack);
    80002fec:	0184b503          	ld	a0,24(s1)
    80002ff0:	fffff097          	auipc	ra,0xfffff
    80002ff4:	ef4080e7          	jalr	-268(ra) # 80001ee4 <_Z5kfreePv>
    80002ff8:	07048513          	addi	a0,s1,112
    80002ffc:	fffff097          	auipc	ra,0xfffff
    80003000:	918080e7          	jalr	-1768(ra) # 80001914 <_ZN15KernelSemaphoreD1Ev>
TCB::~TCB() {
    80003004:	04848513          	addi	a0,s1,72
    80003008:	00000097          	auipc	ra,0x0
    8000300c:	5d8080e7          	jalr	1496(ra) # 800035e0 <_ZN10ThreadListD1Ev>
}
    80003010:	01813083          	ld	ra,24(sp)
    80003014:	01013403          	ld	s0,16(sp)
    80003018:	00813483          	ld	s1,8(sp)
    8000301c:	02010113          	addi	sp,sp,32
    80003020:	00008067          	ret

0000000080003024 <_ZN15ThreadCollectorC1Ev>:
    getInstance()->mutex.wait();
    getInstance()->finishedThreads.addLast(tcb->getNode());
    getInstance()->mutex.signal();
}

ThreadCollector::ThreadCollector() : readyToDelete(0) {
    80003024:	fc010113          	addi	sp,sp,-64
    80003028:	02113c23          	sd	ra,56(sp)
    8000302c:	02813823          	sd	s0,48(sp)
    80003030:	02913423          	sd	s1,40(sp)
    80003034:	03213023          	sd	s2,32(sp)
    80003038:	01313c23          	sd	s3,24(sp)
    8000303c:	01413823          	sd	s4,16(sp)
    80003040:	01513423          	sd	s5,8(sp)
    80003044:	04010413          	addi	s0,sp,64
    80003048:	00050493          	mv	s1,a0
    8000304c:	00053023          	sd	zero,0(a0)
    80003050:	00850993          	addi	s3,a0,8
    explicit ThreadList() = default;
    80003054:	00053423          	sd	zero,8(a0)
    80003058:	00053823          	sd	zero,16(a0)
    8000305c:	00053c23          	sd	zero,24(a0)
    80003060:	02052023          	sw	zero,32(a0)
    80003064:	00100793          	li	a5,1
    80003068:	02f52423          	sw	a5,40(a0)
    8000306c:	02053823          	sd	zero,48(a0)
    80003070:	02053c23          	sd	zero,56(a0)
    80003074:	04053023          	sd	zero,64(a0)
    80003078:	04052423          	sw	zero,72(a0)
    8000307c:	04053823          	sd	zero,80(a0)
    80003080:	05850a13          	addi	s4,a0,88
    80003084:	04052c23          	sw	zero,88(a0)
    80003088:	06053023          	sd	zero,96(a0)
    8000308c:	06053423          	sd	zero,104(a0)
    80003090:	06053823          	sd	zero,112(a0)
    80003094:	06052c23          	sw	zero,120(a0)
        return kmalloc(size);
    80003098:	0c000513          	li	a0,192
    8000309c:	fffff097          	auipc	ra,0xfffff
    800030a0:	c4c080e7          	jalr	-948(ra) # 80001ce8 <_Z7kmallocm>
    800030a4:	00050913          	mv	s2,a0
    threadCollector = new TCB([](void *){ThreadCollector::run();}, nullptr, DEFAULT_TIME_SLICE, true);
    800030a8:	00100713          	li	a4,1
    800030ac:	00200693          	li	a3,2
    800030b0:	00000613          	li	a2,0
    800030b4:	00000597          	auipc	a1,0x0
    800030b8:	2e458593          	addi	a1,a1,740 # 80003398 <_ZZN15ThreadCollectorC4EvENUlPvE_4_FUNES0_>
    800030bc:	00000097          	auipc	ra,0x0
    800030c0:	b68080e7          	jalr	-1176(ra) # 80002c24 <_ZN3TCBC1EPFvPvES0_mb>
    800030c4:	0124b023          	sd	s2,0(s1)
}
    800030c8:	03813083          	ld	ra,56(sp)
    800030cc:	03013403          	ld	s0,48(sp)
    800030d0:	02813483          	ld	s1,40(sp)
    800030d4:	02013903          	ld	s2,32(sp)
    800030d8:	01813983          	ld	s3,24(sp)
    800030dc:	01013a03          	ld	s4,16(sp)
    800030e0:	00813a83          	ld	s5,8(sp)
    800030e4:	04010113          	addi	sp,sp,64
    800030e8:	00008067          	ret
    800030ec:	00050a93          	mv	s5,a0
        kfree(addr);
    800030f0:	00090513          	mv	a0,s2
    800030f4:	fffff097          	auipc	ra,0xfffff
    800030f8:	df0080e7          	jalr	-528(ra) # 80001ee4 <_Z5kfreePv>
    800030fc:	000a8913          	mv	s2,s5
ThreadCollector::ThreadCollector() : readyToDelete(0) {
    80003100:	000a0513          	mv	a0,s4
    80003104:	fffff097          	auipc	ra,0xfffff
    80003108:	810080e7          	jalr	-2032(ra) # 80001914 <_ZN15KernelSemaphoreD1Ev>
    8000310c:	02848513          	addi	a0,s1,40
    80003110:	fffff097          	auipc	ra,0xfffff
    80003114:	804080e7          	jalr	-2044(ra) # 80001914 <_ZN15KernelSemaphoreD1Ev>
    80003118:	00098513          	mv	a0,s3
    8000311c:	00000097          	auipc	ra,0x0
    80003120:	4c4080e7          	jalr	1220(ra) # 800035e0 <_ZN10ThreadListD1Ev>
    80003124:	00090513          	mv	a0,s2
    80003128:	00008097          	auipc	ra,0x8
    8000312c:	e30080e7          	jalr	-464(ra) # 8000af58 <_Unwind_Resume>
    80003130:	00050913          	mv	s2,a0
    80003134:	fcdff06f          	j	80003100 <_ZN15ThreadCollectorC1Ev+0xdc>

0000000080003138 <_ZN15ThreadCollectorD1Ev>:
        delete getInstance()->finishedThreads.removeFirst();
        getInstance()->mutex.signal();
    }
}

ThreadCollector::~ThreadCollector() {
    80003138:	fe010113          	addi	sp,sp,-32
    8000313c:	00113c23          	sd	ra,24(sp)
    80003140:	00813823          	sd	s0,16(sp)
    80003144:	00913423          	sd	s1,8(sp)
    80003148:	01213023          	sd	s2,0(sp)
    8000314c:	02010413          	addi	s0,sp,32
    80003150:	00050913          	mv	s2,a0
        return size == 0;
    80003154:	02092783          	lw	a5,32(s2)
    while (!finishedThreads.isEmpty()) {
    80003158:	02078863          	beqz	a5,80003188 <_ZN15ThreadCollectorD1Ev+0x50>
        delete finishedThreads.removeFirst();
    8000315c:	00890513          	addi	a0,s2,8
    80003160:	00000097          	auipc	ra,0x0
    80003164:	2dc080e7          	jalr	732(ra) # 8000343c <_ZN10ThreadList11removeFirstEv>
    80003168:	00050493          	mv	s1,a0
    8000316c:	fe0504e3          	beqz	a0,80003154 <_ZN15ThreadCollectorD1Ev+0x1c>
    80003170:	00000097          	auipc	ra,0x0
    80003174:	e58080e7          	jalr	-424(ra) # 80002fc8 <_ZN3TCBD1Ev>
    80003178:	00048513          	mv	a0,s1
    8000317c:	fffff097          	auipc	ra,0xfffff
    80003180:	d68080e7          	jalr	-664(ra) # 80001ee4 <_Z5kfreePv>
    }
    80003184:	fd1ff06f          	j	80003154 <_ZN15ThreadCollectorD1Ev+0x1c>
    }
    delete threadCollector;
    80003188:	00093483          	ld	s1,0(s2)
    8000318c:	00048e63          	beqz	s1,800031a8 <_ZN15ThreadCollectorD1Ev+0x70>
    80003190:	00048513          	mv	a0,s1
    80003194:	00000097          	auipc	ra,0x0
    80003198:	e34080e7          	jalr	-460(ra) # 80002fc8 <_ZN3TCBD1Ev>
        kfree(addr);
    8000319c:	00048513          	mv	a0,s1
    800031a0:	fffff097          	auipc	ra,0xfffff
    800031a4:	d44080e7          	jalr	-700(ra) # 80001ee4 <_Z5kfreePv>
ThreadCollector::~ThreadCollector() {
    800031a8:	05890513          	addi	a0,s2,88
    800031ac:	ffffe097          	auipc	ra,0xffffe
    800031b0:	768080e7          	jalr	1896(ra) # 80001914 <_ZN15KernelSemaphoreD1Ev>
    800031b4:	02890513          	addi	a0,s2,40
    800031b8:	ffffe097          	auipc	ra,0xffffe
    800031bc:	75c080e7          	jalr	1884(ra) # 80001914 <_ZN15KernelSemaphoreD1Ev>
    800031c0:	00890513          	addi	a0,s2,8
    800031c4:	00000097          	auipc	ra,0x0
    800031c8:	41c080e7          	jalr	1052(ra) # 800035e0 <_ZN10ThreadListD1Ev>
}
    800031cc:	01813083          	ld	ra,24(sp)
    800031d0:	01013403          	ld	s0,16(sp)
    800031d4:	00813483          	ld	s1,8(sp)
    800031d8:	00013903          	ld	s2,0(sp)
    800031dc:	02010113          	addi	sp,sp,32
    800031e0:	00008067          	ret

00000000800031e4 <_ZN15ThreadCollector11getInstanceEv>:

ThreadCollector *ThreadCollector::getInstance() {
    if (!instance) instance = new ThreadCollector;
    800031e4:	00007797          	auipc	a5,0x7
    800031e8:	c7c7b783          	ld	a5,-900(a5) # 80009e60 <_ZN15ThreadCollector8instanceE>
    800031ec:	00078863          	beqz	a5,800031fc <_ZN15ThreadCollector11getInstanceEv+0x18>
    return instance;
    800031f0:	00007517          	auipc	a0,0x7
    800031f4:	c7053503          	ld	a0,-912(a0) # 80009e60 <_ZN15ThreadCollector8instanceE>
}
    800031f8:	00008067          	ret
ThreadCollector *ThreadCollector::getInstance() {
    800031fc:	fe010113          	addi	sp,sp,-32
    80003200:	00113c23          	sd	ra,24(sp)
    80003204:	00813823          	sd	s0,16(sp)
    80003208:	00913423          	sd	s1,8(sp)
    8000320c:	01213023          	sd	s2,0(sp)
    80003210:	02010413          	addi	s0,sp,32
        return kmalloc(size);
    80003214:	08000513          	li	a0,128
    80003218:	fffff097          	auipc	ra,0xfffff
    8000321c:	ad0080e7          	jalr	-1328(ra) # 80001ce8 <_Z7kmallocm>
    80003220:	00050493          	mv	s1,a0
    if (!instance) instance = new ThreadCollector;
    80003224:	00000097          	auipc	ra,0x0
    80003228:	e00080e7          	jalr	-512(ra) # 80003024 <_ZN15ThreadCollectorC1Ev>
    8000322c:	00007797          	auipc	a5,0x7
    80003230:	c297ba23          	sd	s1,-972(a5) # 80009e60 <_ZN15ThreadCollector8instanceE>
    return instance;
    80003234:	00007517          	auipc	a0,0x7
    80003238:	c2c53503          	ld	a0,-980(a0) # 80009e60 <_ZN15ThreadCollector8instanceE>
}
    8000323c:	01813083          	ld	ra,24(sp)
    80003240:	01013403          	ld	s0,16(sp)
    80003244:	00813483          	ld	s1,8(sp)
    80003248:	00013903          	ld	s2,0(sp)
    8000324c:	02010113          	addi	sp,sp,32
    80003250:	00008067          	ret
    80003254:	00050913          	mv	s2,a0
        kfree(addr);
    80003258:	00048513          	mv	a0,s1
    8000325c:	fffff097          	auipc	ra,0xfffff
    80003260:	c88080e7          	jalr	-888(ra) # 80001ee4 <_Z5kfreePv>
    80003264:	00090513          	mv	a0,s2
    80003268:	00008097          	auipc	ra,0x8
    8000326c:	cf0080e7          	jalr	-784(ra) # 8000af58 <_Unwind_Resume>

0000000080003270 <_ZN15ThreadCollector6signalEv>:
void ThreadCollector::signal() {
    80003270:	ff010113          	addi	sp,sp,-16
    80003274:	00113423          	sd	ra,8(sp)
    80003278:	00813023          	sd	s0,0(sp)
    8000327c:	01010413          	addi	s0,sp,16
    getInstance()->readyToDelete.signal();
    80003280:	00000097          	auipc	ra,0x0
    80003284:	f64080e7          	jalr	-156(ra) # 800031e4 <_ZN15ThreadCollector11getInstanceEv>
    80003288:	05850513          	addi	a0,a0,88
    8000328c:	ffffe097          	auipc	ra,0xffffe
    80003290:	62c080e7          	jalr	1580(ra) # 800018b8 <_ZN15KernelSemaphore6signalEv>
}
    80003294:	00813083          	ld	ra,8(sp)
    80003298:	00013403          	ld	s0,0(sp)
    8000329c:	01010113          	addi	sp,sp,16
    800032a0:	00008067          	ret

00000000800032a4 <_ZN15ThreadCollector3putEP3TCB>:
void ThreadCollector::put(TCB *tcb) {
    800032a4:	fe010113          	addi	sp,sp,-32
    800032a8:	00113c23          	sd	ra,24(sp)
    800032ac:	00813823          	sd	s0,16(sp)
    800032b0:	00913423          	sd	s1,8(sp)
    800032b4:	02010413          	addi	s0,sp,32
    800032b8:	00050493          	mv	s1,a0
    getInstance()->mutex.wait();
    800032bc:	00000097          	auipc	ra,0x0
    800032c0:	f28080e7          	jalr	-216(ra) # 800031e4 <_ZN15ThreadCollector11getInstanceEv>
    800032c4:	02850513          	addi	a0,a0,40
    800032c8:	fffff097          	auipc	ra,0xfffff
    800032cc:	c5c080e7          	jalr	-932(ra) # 80001f24 <_ZN5Mutex4waitEv>
    getInstance()->finishedThreads.addLast(tcb->getNode());
    800032d0:	00000097          	auipc	ra,0x0
    800032d4:	f14080e7          	jalr	-236(ra) # 800031e4 <_ZN15ThreadCollector11getInstanceEv>
    800032d8:	0a048593          	addi	a1,s1,160
    800032dc:	00850513          	addi	a0,a0,8
    800032e0:	00000097          	auipc	ra,0x0
    800032e4:	118080e7          	jalr	280(ra) # 800033f8 <_ZN10ThreadList7addLastEP10ThreadNode>
    getInstance()->mutex.signal();
    800032e8:	00000097          	auipc	ra,0x0
    800032ec:	efc080e7          	jalr	-260(ra) # 800031e4 <_ZN15ThreadCollector11getInstanceEv>
    800032f0:	02850513          	addi	a0,a0,40
    800032f4:	fffff097          	auipc	ra,0xfffff
    800032f8:	cb0080e7          	jalr	-848(ra) # 80001fa4 <_ZN5Mutex6signalEv>
}
    800032fc:	01813083          	ld	ra,24(sp)
    80003300:	01013403          	ld	s0,16(sp)
    80003304:	00813483          	ld	s1,8(sp)
    80003308:	02010113          	addi	sp,sp,32
    8000330c:	00008067          	ret

0000000080003310 <_ZN15ThreadCollector3runEv>:
[[noreturn]] void ThreadCollector::run() {
    80003310:	fe010113          	addi	sp,sp,-32
    80003314:	00113c23          	sd	ra,24(sp)
    80003318:	00813823          	sd	s0,16(sp)
    8000331c:	00913423          	sd	s1,8(sp)
    80003320:	02010413          	addi	s0,sp,32
    80003324:	0300006f          	j	80003354 <_ZN15ThreadCollector3runEv+0x44>
    80003328:	00050493          	mv	s1,a0
        delete getInstance()->finishedThreads.removeFirst();
    8000332c:	00000097          	auipc	ra,0x0
    80003330:	c9c080e7          	jalr	-868(ra) # 80002fc8 <_ZN3TCBD1Ev>
    80003334:	00048513          	mv	a0,s1
    80003338:	fffff097          	auipc	ra,0xfffff
    8000333c:	bac080e7          	jalr	-1108(ra) # 80001ee4 <_Z5kfreePv>
        getInstance()->mutex.signal();
    80003340:	00000097          	auipc	ra,0x0
    80003344:	ea4080e7          	jalr	-348(ra) # 800031e4 <_ZN15ThreadCollector11getInstanceEv>
    80003348:	02850513          	addi	a0,a0,40
    8000334c:	fffff097          	auipc	ra,0xfffff
    80003350:	c58080e7          	jalr	-936(ra) # 80001fa4 <_ZN5Mutex6signalEv>
        getInstance()->readyToDelete.wait();
    80003354:	00000097          	auipc	ra,0x0
    80003358:	e90080e7          	jalr	-368(ra) # 800031e4 <_ZN15ThreadCollector11getInstanceEv>
    8000335c:	05850513          	addi	a0,a0,88
    80003360:	ffffe097          	auipc	ra,0xffffe
    80003364:	4f8080e7          	jalr	1272(ra) # 80001858 <_ZN15KernelSemaphore4waitEv>
        getInstance()->mutex.wait();
    80003368:	00000097          	auipc	ra,0x0
    8000336c:	e7c080e7          	jalr	-388(ra) # 800031e4 <_ZN15ThreadCollector11getInstanceEv>
    80003370:	02850513          	addi	a0,a0,40
    80003374:	fffff097          	auipc	ra,0xfffff
    80003378:	bb0080e7          	jalr	-1104(ra) # 80001f24 <_ZN5Mutex4waitEv>
        delete getInstance()->finishedThreads.removeFirst();
    8000337c:	00000097          	auipc	ra,0x0
    80003380:	e68080e7          	jalr	-408(ra) # 800031e4 <_ZN15ThreadCollector11getInstanceEv>
    80003384:	00850513          	addi	a0,a0,8
    80003388:	00000097          	auipc	ra,0x0
    8000338c:	0b4080e7          	jalr	180(ra) # 8000343c <_ZN10ThreadList11removeFirstEv>
    80003390:	f8051ce3          	bnez	a0,80003328 <_ZN15ThreadCollector3runEv+0x18>
    80003394:	fadff06f          	j	80003340 <_ZN15ThreadCollector3runEv+0x30>

0000000080003398 <_ZZN15ThreadCollectorC4EvENUlPvE_4_FUNES0_>:
    threadCollector = new TCB([](void *){ThreadCollector::run();}, nullptr, DEFAULT_TIME_SLICE, true);
    80003398:	ff010113          	addi	sp,sp,-16
    8000339c:	00113423          	sd	ra,8(sp)
    800033a0:	00813023          	sd	s0,0(sp)
    800033a4:	01010413          	addi	s0,sp,16
    800033a8:	00000097          	auipc	ra,0x0
    800033ac:	f68080e7          	jalr	-152(ra) # 80003310 <_ZN15ThreadCollector3runEv>

00000000800033b0 <_ZN10ThreadList8addFirstEP10ThreadNode>:
#include "../h/ThreadList.h"

void ThreadList::addFirst(ThreadNode *elem) {
    800033b0:	ff010113          	addi	sp,sp,-16
    800033b4:	00813423          	sd	s0,8(sp)
    800033b8:	01010413          	addi	s0,sp,16
    elem->next = head;
    800033bc:	00053783          	ld	a5,0(a0)
    800033c0:	00f5b423          	sd	a5,8(a1)
    elem->prev = nullptr;
    800033c4:	0005b823          	sd	zero,16(a1)
    if (head) head->prev = elem;
    800033c8:	00053783          	ld	a5,0(a0)
    800033cc:	02078263          	beqz	a5,800033f0 <_ZN10ThreadList8addFirstEP10ThreadNode+0x40>
    800033d0:	00b7b823          	sd	a1,16(a5)
    else tail = elem;
    head = elem;
    800033d4:	00b53023          	sd	a1,0(a0)

    size++;
    800033d8:	01852783          	lw	a5,24(a0)
    800033dc:	0017879b          	addiw	a5,a5,1
    800033e0:	00f52c23          	sw	a5,24(a0)
}
    800033e4:	00813403          	ld	s0,8(sp)
    800033e8:	01010113          	addi	sp,sp,16
    800033ec:	00008067          	ret
    else tail = elem;
    800033f0:	00b53423          	sd	a1,8(a0)
    800033f4:	fe1ff06f          	j	800033d4 <_ZN10ThreadList8addFirstEP10ThreadNode+0x24>

00000000800033f8 <_ZN10ThreadList7addLastEP10ThreadNode>:

void ThreadList::addLast(ThreadNode *elem) {
    800033f8:	ff010113          	addi	sp,sp,-16
    800033fc:	00813423          	sd	s0,8(sp)
    80003400:	01010413          	addi	s0,sp,16
    elem->next = nullptr;
    80003404:	0005b423          	sd	zero,8(a1)
    elem->prev = tail;
    80003408:	00853783          	ld	a5,8(a0)
    8000340c:	00f5b823          	sd	a5,16(a1)
    if (tail) tail->next = elem;
    80003410:	02078263          	beqz	a5,80003434 <_ZN10ThreadList7addLastEP10ThreadNode+0x3c>
    80003414:	00b7b423          	sd	a1,8(a5)
    else head = elem;
    tail = elem;
    80003418:	00b53423          	sd	a1,8(a0)

    size++;
    8000341c:	01852783          	lw	a5,24(a0)
    80003420:	0017879b          	addiw	a5,a5,1
    80003424:	00f52c23          	sw	a5,24(a0)
}
    80003428:	00813403          	ld	s0,8(sp)
    8000342c:	01010113          	addi	sp,sp,16
    80003430:	00008067          	ret
    else head = elem;
    80003434:	00b53023          	sd	a1,0(a0)
    80003438:	fe1ff06f          	j	80003418 <_ZN10ThreadList7addLastEP10ThreadNode+0x20>

000000008000343c <_ZN10ThreadList11removeFirstEv>:

TCB *ThreadList::removeFirst() {
    8000343c:	ff010113          	addi	sp,sp,-16
    80003440:	00813423          	sd	s0,8(sp)
    80003444:	01010413          	addi	s0,sp,16
    if (!head) return nullptr;
    80003448:	00053703          	ld	a4,0(a0)
    8000344c:	04070063          	beqz	a4,8000348c <_ZN10ThreadList11removeFirstEv+0x50>
    80003450:	00050793          	mv	a5,a0

    TCB *data = head->data;
    80003454:	00073503          	ld	a0,0(a4) # 8000 <_entry-0x7fff8000>

    head = head->next;
    80003458:	00873703          	ld	a4,8(a4)
    8000345c:	00e7b023          	sd	a4,0(a5)
    if (head) head->prev = nullptr;
    80003460:	02070063          	beqz	a4,80003480 <_ZN10ThreadList11removeFirstEv+0x44>
    80003464:	00073823          	sd	zero,16(a4)
    else head = tail = nullptr;

    size--;
    80003468:	0187a703          	lw	a4,24(a5)
    8000346c:	fff7071b          	addiw	a4,a4,-1
    80003470:	00e7ac23          	sw	a4,24(a5)

    return data;
}
    80003474:	00813403          	ld	s0,8(sp)
    80003478:	01010113          	addi	sp,sp,16
    8000347c:	00008067          	ret
    else head = tail = nullptr;
    80003480:	0007b423          	sd	zero,8(a5)
    80003484:	0007b023          	sd	zero,0(a5)
    80003488:	fe1ff06f          	j	80003468 <_ZN10ThreadList11removeFirstEv+0x2c>
    if (!head) return nullptr;
    8000348c:	00070513          	mv	a0,a4
    80003490:	fe5ff06f          	j	80003474 <_ZN10ThreadList11removeFirstEv+0x38>

0000000080003494 <_ZN10ThreadList10removeLastEv>:

TCB *ThreadList::removeLast() {
    80003494:	ff010113          	addi	sp,sp,-16
    80003498:	00813423          	sd	s0,8(sp)
    8000349c:	01010413          	addi	s0,sp,16
    if (!tail) return nullptr;
    800034a0:	00853703          	ld	a4,8(a0)
    800034a4:	04070063          	beqz	a4,800034e4 <_ZN10ThreadList10removeLastEv+0x50>
    800034a8:	00050793          	mv	a5,a0

    TCB *data = tail->data;
    800034ac:	00073503          	ld	a0,0(a4)

    tail = tail->prev;
    800034b0:	01073703          	ld	a4,16(a4)
    800034b4:	00e7b423          	sd	a4,8(a5)
    if (tail) tail->next = nullptr;
    800034b8:	02070063          	beqz	a4,800034d8 <_ZN10ThreadList10removeLastEv+0x44>
    800034bc:	00073423          	sd	zero,8(a4)
    else tail = head = nullptr;

    size--;
    800034c0:	0187a703          	lw	a4,24(a5)
    800034c4:	fff7071b          	addiw	a4,a4,-1
    800034c8:	00e7ac23          	sw	a4,24(a5)

    return data;
}
    800034cc:	00813403          	ld	s0,8(sp)
    800034d0:	01010113          	addi	sp,sp,16
    800034d4:	00008067          	ret
    else tail = head = nullptr;
    800034d8:	0007b023          	sd	zero,0(a5)
    800034dc:	0007b423          	sd	zero,8(a5)
    800034e0:	fe1ff06f          	j	800034c0 <_ZN10ThreadList10removeLastEv+0x2c>
    if (!tail) return nullptr;
    800034e4:	00070513          	mv	a0,a4
    800034e8:	fe5ff06f          	j	800034cc <_ZN10ThreadList10removeLastEv+0x38>

00000000800034ec <_ZN10ThreadList9eraseCurrEv>:

void ThreadList::eraseCurr() {
    800034ec:	ff010113          	addi	sp,sp,-16
    800034f0:	00813423          	sd	s0,8(sp)
    800034f4:	01010413          	addi	s0,sp,16
    if (!curr) return;
    800034f8:	01053783          	ld	a5,16(a0)
    800034fc:	02078463          	beqz	a5,80003524 <_ZN10ThreadList9eraseCurrEv+0x38>

    ThreadNode *before = curr->prev, *after = curr->next;
    80003500:	0107b703          	ld	a4,16(a5)
    80003504:	0087b783          	ld	a5,8(a5)

    if (before) before->next = after;
    80003508:	02070463          	beqz	a4,80003530 <_ZN10ThreadList9eraseCurrEv+0x44>
    8000350c:	00f73423          	sd	a5,8(a4)
    else head = after;

    if (after) after->prev = before;
    80003510:	02078463          	beqz	a5,80003538 <_ZN10ThreadList9eraseCurrEv+0x4c>
    80003514:	00e7b823          	sd	a4,16(a5)
    else tail = before;

    size--;
    80003518:	01852783          	lw	a5,24(a0)
    8000351c:	fff7879b          	addiw	a5,a5,-1
    80003520:	00f52c23          	sw	a5,24(a0)
}
    80003524:	00813403          	ld	s0,8(sp)
    80003528:	01010113          	addi	sp,sp,16
    8000352c:	00008067          	ret
    else head = after;
    80003530:	00f53023          	sd	a5,0(a0)
    80003534:	fddff06f          	j	80003510 <_ZN10ThreadList9eraseCurrEv+0x24>
    else tail = before;
    80003538:	00e53423          	sd	a4,8(a0)
    8000353c:	fddff06f          	j	80003518 <_ZN10ThreadList9eraseCurrEv+0x2c>

0000000080003540 <_ZN10ThreadList15insertAfterCurrEP10ThreadNode>:

void ThreadList::insertAfterCurr(ThreadNode *elem) {
    80003540:	ff010113          	addi	sp,sp,-16
    80003544:	00813423          	sd	s0,8(sp)
    80003548:	01010413          	addi	s0,sp,16
    if (!curr) return;
    8000354c:	01053783          	ld	a5,16(a0)
    80003550:	02078663          	beqz	a5,8000357c <_ZN10ThreadList15insertAfterCurrEP10ThreadNode+0x3c>
    ThreadNode *after = curr->next;
    80003554:	0087b783          	ld	a5,8(a5)
    elem->next = after;
    80003558:	00f5b423          	sd	a5,8(a1)
    elem->prev = curr;
    8000355c:	01053703          	ld	a4,16(a0)
    80003560:	00e5b823          	sd	a4,16(a1)
    curr->next = elem;
    80003564:	00b73423          	sd	a1,8(a4)
    if (!after) tail = elem;
    80003568:	02078063          	beqz	a5,80003588 <_ZN10ThreadList15insertAfterCurrEP10ThreadNode+0x48>
    else after->prev = elem;
    8000356c:	00b7b823          	sd	a1,16(a5)
    size++;
    80003570:	01852783          	lw	a5,24(a0)
    80003574:	0017879b          	addiw	a5,a5,1
    80003578:	00f52c23          	sw	a5,24(a0)
}
    8000357c:	00813403          	ld	s0,8(sp)
    80003580:	01010113          	addi	sp,sp,16
    80003584:	00008067          	ret
    if (!after) tail = elem;
    80003588:	00b53423          	sd	a1,8(a0)
    8000358c:	fe5ff06f          	j	80003570 <_ZN10ThreadList15insertAfterCurrEP10ThreadNode+0x30>

0000000080003590 <_ZN10ThreadList16insertBeforeCurrEP10ThreadNode>:

void ThreadList::insertBeforeCurr(ThreadNode *elem) {
    80003590:	ff010113          	addi	sp,sp,-16
    80003594:	00813423          	sd	s0,8(sp)
    80003598:	01010413          	addi	s0,sp,16
    if (!curr) return;
    8000359c:	01053783          	ld	a5,16(a0)
    800035a0:	02078663          	beqz	a5,800035cc <_ZN10ThreadList16insertBeforeCurrEP10ThreadNode+0x3c>
    ThreadNode *before = curr->prev;
    800035a4:	0107b703          	ld	a4,16(a5)
    elem->next = curr;
    800035a8:	00f5b423          	sd	a5,8(a1)
    elem->prev = before;
    800035ac:	00e5b823          	sd	a4,16(a1)
    curr->prev = elem;
    800035b0:	01053783          	ld	a5,16(a0)
    800035b4:	00b7b823          	sd	a1,16(a5)
    if (!before) head = elem;
    800035b8:	02070063          	beqz	a4,800035d8 <_ZN10ThreadList16insertBeforeCurrEP10ThreadNode+0x48>
    else before->next = elem;
    800035bc:	00b73423          	sd	a1,8(a4)
    size++;
    800035c0:	01852783          	lw	a5,24(a0)
    800035c4:	0017879b          	addiw	a5,a5,1
    800035c8:	00f52c23          	sw	a5,24(a0)
}
    800035cc:	00813403          	ld	s0,8(sp)
    800035d0:	01010113          	addi	sp,sp,16
    800035d4:	00008067          	ret
    if (!before) head = elem;
    800035d8:	00b53023          	sd	a1,0(a0)
    800035dc:	fe5ff06f          	j	800035c0 <_ZN10ThreadList16insertBeforeCurrEP10ThreadNode+0x30>

00000000800035e0 <_ZN10ThreadListD1Ev>:

ThreadList::~ThreadList() {
    800035e0:	ff010113          	addi	sp,sp,-16
    800035e4:	00813423          	sd	s0,8(sp)
    800035e8:	01010413          	addi	s0,sp,16
    head = nullptr;
    tail = nullptr;
    curr = nullptr;
    size = 0;
}
    800035ec:	00813403          	ld	s0,8(sp)
    800035f0:	01010113          	addi	sp,sp,16
    800035f4:	00008067          	ret

00000000800035f8 <_ZN14TimerInterrupt11getInstanceEv>:
#include "../h/Scheduler.h"

TimerInterrupt *TimerInterrupt::instance = nullptr;

TimerInterrupt *TimerInterrupt::getInstance() {
    if (!instance) instance = new TimerInterrupt;
    800035f8:	00007797          	auipc	a5,0x7
    800035fc:	8707b783          	ld	a5,-1936(a5) # 80009e68 <_ZN14TimerInterrupt8instanceE>
    80003600:	00078863          	beqz	a5,80003610 <_ZN14TimerInterrupt11getInstanceEv+0x18>
    return instance;
}
    80003604:	00007517          	auipc	a0,0x7
    80003608:	86453503          	ld	a0,-1948(a0) # 80009e68 <_ZN14TimerInterrupt8instanceE>
    8000360c:	00008067          	ret
TimerInterrupt *TimerInterrupt::getInstance() {
    80003610:	ff010113          	addi	sp,sp,-16
    80003614:	00113423          	sd	ra,8(sp)
    80003618:	00813023          	sd	s0,0(sp)
    8000361c:	01010413          	addi	s0,sp,16
        return kmalloc(size);
    80003620:	05800513          	li	a0,88
    80003624:	ffffe097          	auipc	ra,0xffffe
    80003628:	6c4080e7          	jalr	1732(ra) # 80001ce8 <_Z7kmallocm>
    8000362c:	00100793          	li	a5,1
    80003630:	00f52423          	sw	a5,8(a0)
    explicit ThreadList() = default;
    80003634:	00053823          	sd	zero,16(a0)
    80003638:	00053c23          	sd	zero,24(a0)
    8000363c:	02053023          	sd	zero,32(a0)
    80003640:	02052423          	sw	zero,40(a0)
    80003644:	02053823          	sd	zero,48(a0)
    80003648:	02053c23          	sd	zero,56(a0)
    8000364c:	04053023          	sd	zero,64(a0)
    80003650:	04053423          	sd	zero,72(a0)
    80003654:	04052823          	sw	zero,80(a0)
    if (!instance) instance = new TimerInterrupt;
    80003658:	00007797          	auipc	a5,0x7
    8000365c:	80a7b823          	sd	a0,-2032(a5) # 80009e68 <_ZN14TimerInterrupt8instanceE>
}
    80003660:	00007517          	auipc	a0,0x7
    80003664:	80853503          	ld	a0,-2040(a0) # 80009e68 <_ZN14TimerInterrupt8instanceE>
    80003668:	00813083          	ld	ra,8(sp)
    8000366c:	00013403          	ld	s0,0(sp)
    80003670:	01010113          	addi	sp,sp,16
    80003674:	00008067          	ret

0000000080003678 <_ZN14TimerInterrupt5blockEP3TCBm>:

void TimerInterrupt::block(TCB *tcb, time_t time) {
    80003678:	fd010113          	addi	sp,sp,-48
    8000367c:	02113423          	sd	ra,40(sp)
    80003680:	02813023          	sd	s0,32(sp)
    80003684:	00913c23          	sd	s1,24(sp)
    80003688:	01213823          	sd	s2,16(sp)
    8000368c:	01313423          	sd	s3,8(sp)
    80003690:	01413023          	sd	s4,0(sp)
    80003694:	03010413          	addi	s0,sp,48
    80003698:	00050993          	mv	s3,a0
    8000369c:	00058913          	mv	s2,a1
    ThreadList *blockedThreads = &getInstance()->blockedThreadList;
    800036a0:	00000097          	auipc	ra,0x0
    800036a4:	f58080e7          	jalr	-168(ra) # 800035f8 <_ZN14TimerInterrupt11getInstanceEv>
    800036a8:	00050493          	mv	s1,a0
    800036ac:	03850a13          	addi	s4,a0,56

    getInstance()->mutex.wait();
    800036b0:	00000097          	auipc	ra,0x0
    800036b4:	f48080e7          	jalr	-184(ra) # 800035f8 <_ZN14TimerInterrupt11getInstanceEv>
    800036b8:	00850513          	addi	a0,a0,8
    800036bc:	fffff097          	auipc	ra,0xfffff
    800036c0:	868080e7          	jalr	-1944(ra) # 80001f24 <_ZN5Mutex4waitEv>
        curr = head;
    800036c4:	0384b783          	ld	a5,56(s1)
    800036c8:	04f4b423          	sd	a5,72(s1)
        return curr != nullptr;
    800036cc:	0484b783          	ld	a5,72(s1)

    for (blockedThreads->toHead(); blockedThreads->hasCurr(); blockedThreads->toNext()) {
    800036d0:	02078863          	beqz	a5,80003700 <_ZN14TimerInterrupt5blockEP3TCBm+0x88>
    }

    TCB *getCurr() {
        if (!curr) return nullptr;
        return curr->data;
    800036d4:	0007b703          	ld	a4,0(a5)
        return blockedTime;
    800036d8:	0b873703          	ld	a4,184(a4)
        time_t currTime = blockedThreads->getCurr()->getBlockedTime();
        if (time >= currTime) {
    800036dc:	00e96a63          	bltu	s2,a4,800036f0 <_ZN14TimerInterrupt5blockEP3TCBm+0x78>
            time -= currTime;
    800036e0:	40e90933          	sub	s2,s2,a4
        if (curr) curr = curr->next;
    800036e4:	0087b783          	ld	a5,8(a5)
    800036e8:	04f4b423          	sd	a5,72(s1)
    }
    800036ec:	fe1ff06f          	j	800036cc <_ZN14TimerInterrupt5blockEP3TCBm+0x54>
        } else {
            blockedThreads->insertBeforeCurr(tcb->getNode());
    800036f0:	0a098593          	addi	a1,s3,160
    800036f4:	000a0513          	mv	a0,s4
    800036f8:	00000097          	auipc	ra,0x0
    800036fc:	e98080e7          	jalr	-360(ra) # 80003590 <_ZN10ThreadList16insertBeforeCurrEP10ThreadNode>
        return curr != nullptr;
    80003700:	0484b783          	ld	a5,72(s1)
            break;
        }
    }

    // insert at end
    if (!blockedThreads->hasCurr()) blockedThreads->addLast(tcb->getNode());
    80003704:	02078863          	beqz	a5,80003734 <_ZN14TimerInterrupt5blockEP3TCBm+0xbc>
    80003708:	0484b783          	ld	a5,72(s1)

    // updating relative time for blocked threads after currently inserted
    while (blockedThreads->hasCurr()) {
    8000370c:	02078e63          	beqz	a5,80003748 <_ZN14TimerInterrupt5blockEP3TCBm+0xd0>
        return curr->data;
    80003710:	0007b703          	ld	a4,0(a5)
        this->blockedTime -= time;
    80003714:	0b873783          	ld	a5,184(a4)
    80003718:	412787b3          	sub	a5,a5,s2
    8000371c:	0af73c23          	sd	a5,184(a4)
        if (curr) curr = curr->next;
    80003720:	0484b783          	ld	a5,72(s1)
    80003724:	fe0782e3          	beqz	a5,80003708 <_ZN14TimerInterrupt5blockEP3TCBm+0x90>
    80003728:	0087b783          	ld	a5,8(a5)
    8000372c:	04f4b423          	sd	a5,72(s1)
    80003730:	fd9ff06f          	j	80003708 <_ZN14TimerInterrupt5blockEP3TCBm+0x90>
    if (!blockedThreads->hasCurr()) blockedThreads->addLast(tcb->getNode());
    80003734:	0a098593          	addi	a1,s3,160
    80003738:	000a0513          	mv	a0,s4
    8000373c:	00000097          	auipc	ra,0x0
    80003740:	cbc080e7          	jalr	-836(ra) # 800033f8 <_ZN10ThreadList7addLastEP10ThreadNode>
    80003744:	fc5ff06f          	j	80003708 <_ZN14TimerInterrupt5blockEP3TCBm+0x90>
        blockedThreads->getCurr()->decBlockedTime(time);
        blockedThreads->toNext();
    }

    getInstance()->mutex.signal();
    80003748:	00000097          	auipc	ra,0x0
    8000374c:	eb0080e7          	jalr	-336(ra) # 800035f8 <_ZN14TimerInterrupt11getInstanceEv>
    80003750:	00850513          	addi	a0,a0,8
    80003754:	fffff097          	auipc	ra,0xfffff
    80003758:	850080e7          	jalr	-1968(ra) # 80001fa4 <_ZN5Mutex6signalEv>
        this->blockedTime = blockedTime;
    8000375c:	0b29bc23          	sd	s2,184(s3)
        status = BLOCKED;
    80003760:	00200793          	li	a5,2
    80003764:	04f9a023          	sw	a5,64(s3)

    tcb->setBlockedTime(time);
    tcb->setBlocked();
    TCB::dispatch();
    80003768:	fffff097          	auipc	ra,0xfffff
    8000376c:	688080e7          	jalr	1672(ra) # 80002df0 <_ZN3TCB8dispatchEv>
}
    80003770:	02813083          	ld	ra,40(sp)
    80003774:	02013403          	ld	s0,32(sp)
    80003778:	01813483          	ld	s1,24(sp)
    8000377c:	01013903          	ld	s2,16(sp)
    80003780:	00813983          	ld	s3,8(sp)
    80003784:	00013a03          	ld	s4,0(sp)
    80003788:	03010113          	addi	sp,sp,48
    8000378c:	00008067          	ret

0000000080003790 <_ZN14TimerInterrupt4tickEv>:

void TimerInterrupt::tick() {
    80003790:	fd010113          	addi	sp,sp,-48
    80003794:	02113423          	sd	ra,40(sp)
    80003798:	02813023          	sd	s0,32(sp)
    8000379c:	00913c23          	sd	s1,24(sp)
    800037a0:	01213823          	sd	s2,16(sp)
    800037a4:	01313423          	sd	s3,8(sp)
    800037a8:	03010413          	addi	s0,sp,48
    ThreadList *blockedThreads = &getInstance()->blockedThreadList;
    800037ac:	00000097          	auipc	ra,0x0
    800037b0:	e4c080e7          	jalr	-436(ra) # 800035f8 <_ZN14TimerInterrupt11getInstanceEv>
    800037b4:	00050913          	mv	s2,a0
    800037b8:	03850993          	addi	s3,a0,56

    TCB *tcb;

    getInstance()->mutex.wait();
    800037bc:	00000097          	auipc	ra,0x0
    800037c0:	e3c080e7          	jalr	-452(ra) # 800035f8 <_ZN14TimerInterrupt11getInstanceEv>
    800037c4:	00850513          	addi	a0,a0,8
    800037c8:	ffffe097          	auipc	ra,0xffffe
    800037cc:	75c080e7          	jalr	1884(ra) # 80001f24 <_ZN5Mutex4waitEv>
    800037d0:	01c0006f          	j	800037ec <_ZN14TimerInterrupt4tickEv+0x5c>
        status = READY;
    800037d4:	0404a023          	sw	zero,64(s1)

    while ((tcb = blockedThreads->getFirst()) && !tcb->getBlockedTime()) {
        tcb->setReady();
        Scheduler::put(blockedThreads->removeFirst());
    800037d8:	00098513          	mv	a0,s3
    800037dc:	00000097          	auipc	ra,0x0
    800037e0:	c60080e7          	jalr	-928(ra) # 8000343c <_ZN10ThreadList11removeFirstEv>
    800037e4:	fffff097          	auipc	ra,0xfffff
    800037e8:	b6c080e7          	jalr	-1172(ra) # 80002350 <_ZN9Scheduler3putEP3TCB>
        if (!head) return nullptr;
    800037ec:	03893483          	ld	s1,56(s2)
    800037f0:	00048a63          	beqz	s1,80003804 <_ZN14TimerInterrupt4tickEv+0x74>
        return head->data;
    800037f4:	0004b483          	ld	s1,0(s1)
    while ((tcb = blockedThreads->getFirst()) && !tcb->getBlockedTime()) {
    800037f8:	00048663          	beqz	s1,80003804 <_ZN14TimerInterrupt4tickEv+0x74>
        return blockedTime;
    800037fc:	0b84b783          	ld	a5,184(s1)
    80003800:	fc078ae3          	beqz	a5,800037d4 <_ZN14TimerInterrupt4tickEv+0x44>
    }

    getInstance()->mutex.signal();
    80003804:	00000097          	auipc	ra,0x0
    80003808:	df4080e7          	jalr	-524(ra) # 800035f8 <_ZN14TimerInterrupt11getInstanceEv>
    8000380c:	00850513          	addi	a0,a0,8
    80003810:	ffffe097          	auipc	ra,0xffffe
    80003814:	794080e7          	jalr	1940(ra) # 80001fa4 <_ZN5Mutex6signalEv>

    if (!tcb) return;
    80003818:	00048863          	beqz	s1,80003828 <_ZN14TimerInterrupt4tickEv+0x98>
        this->blockedTime -= time;
    8000381c:	0b84b783          	ld	a5,184(s1)
    80003820:	fff78793          	addi	a5,a5,-1
    80003824:	0af4bc23          	sd	a5,184(s1)
    tcb->decBlockedTime();
}
    80003828:	02813083          	ld	ra,40(sp)
    8000382c:	02013403          	ld	s0,32(sp)
    80003830:	01813483          	ld	s1,24(sp)
    80003834:	01013903          	ld	s2,16(sp)
    80003838:	00813983          	ld	s3,8(sp)
    8000383c:	03010113          	addi	sp,sp,48
    80003840:	00008067          	ret

0000000080003844 <_ZN14TimerInterruptD1Ev>:

TimerInterrupt::~TimerInterrupt() {
    80003844:	fe010113          	addi	sp,sp,-32
    80003848:	00113c23          	sd	ra,24(sp)
    8000384c:	00813823          	sd	s0,16(sp)
    80003850:	00913423          	sd	s1,8(sp)
    80003854:	01213023          	sd	s2,0(sp)
    80003858:	02010413          	addi	s0,sp,32
    8000385c:	00050913          	mv	s2,a0
        return size == 0;
    80003860:	05092783          	lw	a5,80(s2)
    while (!blockedThreadList.isEmpty()) {
    80003864:	02078863          	beqz	a5,80003894 <_ZN14TimerInterruptD1Ev+0x50>
        delete blockedThreadList.removeFirst();
    80003868:	03890513          	addi	a0,s2,56
    8000386c:	00000097          	auipc	ra,0x0
    80003870:	bd0080e7          	jalr	-1072(ra) # 8000343c <_ZN10ThreadList11removeFirstEv>
    80003874:	00050493          	mv	s1,a0
    80003878:	fe0504e3          	beqz	a0,80003860 <_ZN14TimerInterruptD1Ev+0x1c>
    8000387c:	fffff097          	auipc	ra,0xfffff
    80003880:	74c080e7          	jalr	1868(ra) # 80002fc8 <_ZN3TCBD1Ev>
        kfree(addr);
    80003884:	00048513          	mv	a0,s1
    80003888:	ffffe097          	auipc	ra,0xffffe
    8000388c:	65c080e7          	jalr	1628(ra) # 80001ee4 <_Z5kfreePv>
    }
    80003890:	fd1ff06f          	j	80003860 <_ZN14TimerInterruptD1Ev+0x1c>
TimerInterrupt::~TimerInterrupt() {
    80003894:	03890513          	addi	a0,s2,56
    80003898:	00000097          	auipc	ra,0x0
    8000389c:	d48080e7          	jalr	-696(ra) # 800035e0 <_ZN10ThreadListD1Ev>
    800038a0:	00890513          	addi	a0,s2,8
    800038a4:	ffffe097          	auipc	ra,0xffffe
    800038a8:	070080e7          	jalr	112(ra) # 80001914 <_ZN15KernelSemaphoreD1Ev>
    }
}
    800038ac:	01813083          	ld	ra,24(sp)
    800038b0:	01013403          	ld	s0,16(sp)
    800038b4:	00813483          	ld	s1,8(sp)
    800038b8:	00013903          	ld	s2,0(sp)
    800038bc:	02010113          	addi	sp,sp,32
    800038c0:	00008067          	ret

00000000800038c4 <_ZN6BufferC1Ei>:
#include "buffer.hpp"
#include "../h/syscall_c.h"
//#include "../h/std.h"


Buffer::Buffer(int _cap) : cap(_cap), head(0), tail(0) {
    800038c4:	fe010113          	addi	sp,sp,-32
    800038c8:	00113c23          	sd	ra,24(sp)
    800038cc:	00813823          	sd	s0,16(sp)
    800038d0:	00913423          	sd	s1,8(sp)
    800038d4:	02010413          	addi	s0,sp,32
    800038d8:	00050493          	mv	s1,a0
    800038dc:	00b52023          	sw	a1,0(a0)
    800038e0:	00052823          	sw	zero,16(a0)
    800038e4:	00052a23          	sw	zero,20(a0)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    800038e8:	00259513          	slli	a0,a1,0x2
    800038ec:	fffff097          	auipc	ra,0xfffff
    800038f0:	b90080e7          	jalr	-1136(ra) # 8000247c <_Z9mem_allocm>
    800038f4:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    800038f8:	00000593          	li	a1,0
    800038fc:	02048513          	addi	a0,s1,32
    80003900:	fffff097          	auipc	ra,0xfffff
    80003904:	cc8080e7          	jalr	-824(ra) # 800025c8 <_Z8sem_openPP4_semj>
    sem_open(&spaceAvailable, cap);
    80003908:	0004a583          	lw	a1,0(s1)
    8000390c:	01848513          	addi	a0,s1,24
    80003910:	fffff097          	auipc	ra,0xfffff
    80003914:	cb8080e7          	jalr	-840(ra) # 800025c8 <_Z8sem_openPP4_semj>
    sem_open(&mutexHead, 1);
    80003918:	00100593          	li	a1,1
    8000391c:	02848513          	addi	a0,s1,40
    80003920:	fffff097          	auipc	ra,0xfffff
    80003924:	ca8080e7          	jalr	-856(ra) # 800025c8 <_Z8sem_openPP4_semj>
    sem_open(&mutexTail, 1);
    80003928:	00100593          	li	a1,1
    8000392c:	03048513          	addi	a0,s1,48
    80003930:	fffff097          	auipc	ra,0xfffff
    80003934:	c98080e7          	jalr	-872(ra) # 800025c8 <_Z8sem_openPP4_semj>
}
    80003938:	01813083          	ld	ra,24(sp)
    8000393c:	01013403          	ld	s0,16(sp)
    80003940:	00813483          	ld	s1,8(sp)
    80003944:	02010113          	addi	sp,sp,32
    80003948:	00008067          	ret

000000008000394c <_ZN6BufferD1Ev>:

Buffer::~Buffer() {
    8000394c:	fe010113          	addi	sp,sp,-32
    80003950:	00113c23          	sd	ra,24(sp)
    80003954:	00813823          	sd	s0,16(sp)
    80003958:	00913423          	sd	s1,8(sp)
    8000395c:	02010413          	addi	s0,sp,32
    80003960:	00050493          	mv	s1,a0
    putc('\n');
    80003964:	00a00513          	li	a0,10
    80003968:	fffff097          	auipc	ra,0xfffff
    8000396c:	e04080e7          	jalr	-508(ra) # 8000276c <_Z4putcc>
//    printf("Buffer deleted!\n");
    while (head != tail) {
    80003970:	0104a783          	lw	a5,16(s1)
    80003974:	0144a703          	lw	a4,20(s1)
    80003978:	00e78c63          	beq	a5,a4,80003990 <_ZN6BufferD1Ev+0x44>
//        printf("%c ", buffer[head]);
        head = (head + 1) % cap;
    8000397c:	0017879b          	addiw	a5,a5,1
    80003980:	0004a703          	lw	a4,0(s1)
    80003984:	02e7e7bb          	remw	a5,a5,a4
    80003988:	00f4a823          	sw	a5,16(s1)
    while (head != tail) {
    8000398c:	fe5ff06f          	j	80003970 <_ZN6BufferD1Ev+0x24>
    }
    putc('!');
    80003990:	02100513          	li	a0,33
    80003994:	fffff097          	auipc	ra,0xfffff
    80003998:	dd8080e7          	jalr	-552(ra) # 8000276c <_Z4putcc>
    putc('\n');
    8000399c:	00a00513          	li	a0,10
    800039a0:	fffff097          	auipc	ra,0xfffff
    800039a4:	dcc080e7          	jalr	-564(ra) # 8000276c <_Z4putcc>

    mem_free(buffer);
    800039a8:	0084b503          	ld	a0,8(s1)
    800039ac:	fffff097          	auipc	ra,0xfffff
    800039b0:	b04080e7          	jalr	-1276(ra) # 800024b0 <_Z8mem_freePv>
    sem_close(itemAvailable);
    800039b4:	0204b503          	ld	a0,32(s1)
    800039b8:	fffff097          	auipc	ra,0xfffff
    800039bc:	c88080e7          	jalr	-888(ra) # 80002640 <_Z9sem_closeP4_sem>
    sem_close(spaceAvailable);
    800039c0:	0184b503          	ld	a0,24(s1)
    800039c4:	fffff097          	auipc	ra,0xfffff
    800039c8:	c7c080e7          	jalr	-900(ra) # 80002640 <_Z9sem_closeP4_sem>
    sem_close(mutexTail);
    800039cc:	0304b503          	ld	a0,48(s1)
    800039d0:	fffff097          	auipc	ra,0xfffff
    800039d4:	c70080e7          	jalr	-912(ra) # 80002640 <_Z9sem_closeP4_sem>
    sem_close(mutexHead);
    800039d8:	0284b503          	ld	a0,40(s1)
    800039dc:	fffff097          	auipc	ra,0xfffff
    800039e0:	c64080e7          	jalr	-924(ra) # 80002640 <_Z9sem_closeP4_sem>
}
    800039e4:	01813083          	ld	ra,24(sp)
    800039e8:	01013403          	ld	s0,16(sp)
    800039ec:	00813483          	ld	s1,8(sp)
    800039f0:	02010113          	addi	sp,sp,32
    800039f4:	00008067          	ret

00000000800039f8 <_ZN6Buffer3putEi>:

void Buffer::put(int val) {
    800039f8:	fe010113          	addi	sp,sp,-32
    800039fc:	00113c23          	sd	ra,24(sp)
    80003a00:	00813823          	sd	s0,16(sp)
    80003a04:	00913423          	sd	s1,8(sp)
    80003a08:	01213023          	sd	s2,0(sp)
    80003a0c:	02010413          	addi	s0,sp,32
    80003a10:	00050493          	mv	s1,a0
    80003a14:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80003a18:	01853503          	ld	a0,24(a0)
    80003a1c:	fffff097          	auipc	ra,0xfffff
    80003a20:	c80080e7          	jalr	-896(ra) # 8000269c <_Z8sem_waitP4_sem>

    sem_wait(mutexTail);
    80003a24:	0304b503          	ld	a0,48(s1)
    80003a28:	fffff097          	auipc	ra,0xfffff
    80003a2c:	c74080e7          	jalr	-908(ra) # 8000269c <_Z8sem_waitP4_sem>
    buffer[tail] = val;
    80003a30:	0084b783          	ld	a5,8(s1)
    80003a34:	0144a703          	lw	a4,20(s1)
    80003a38:	00271713          	slli	a4,a4,0x2
    80003a3c:	00e787b3          	add	a5,a5,a4
    80003a40:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80003a44:	0144a783          	lw	a5,20(s1)
    80003a48:	0017879b          	addiw	a5,a5,1
    80003a4c:	0004a703          	lw	a4,0(s1)
    80003a50:	02e7e7bb          	remw	a5,a5,a4
    80003a54:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80003a58:	0304b503          	ld	a0,48(s1)
    80003a5c:	fffff097          	auipc	ra,0xfffff
    80003a60:	c74080e7          	jalr	-908(ra) # 800026d0 <_Z10sem_signalP4_sem>

    sem_signal(itemAvailable);
    80003a64:	0204b503          	ld	a0,32(s1)
    80003a68:	fffff097          	auipc	ra,0xfffff
    80003a6c:	c68080e7          	jalr	-920(ra) # 800026d0 <_Z10sem_signalP4_sem>

}
    80003a70:	01813083          	ld	ra,24(sp)
    80003a74:	01013403          	ld	s0,16(sp)
    80003a78:	00813483          	ld	s1,8(sp)
    80003a7c:	00013903          	ld	s2,0(sp)
    80003a80:	02010113          	addi	sp,sp,32
    80003a84:	00008067          	ret

0000000080003a88 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80003a88:	fe010113          	addi	sp,sp,-32
    80003a8c:	00113c23          	sd	ra,24(sp)
    80003a90:	00813823          	sd	s0,16(sp)
    80003a94:	00913423          	sd	s1,8(sp)
    80003a98:	01213023          	sd	s2,0(sp)
    80003a9c:	02010413          	addi	s0,sp,32
    80003aa0:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80003aa4:	02053503          	ld	a0,32(a0)
    80003aa8:	fffff097          	auipc	ra,0xfffff
    80003aac:	bf4080e7          	jalr	-1036(ra) # 8000269c <_Z8sem_waitP4_sem>

    sem_wait(mutexHead);
    80003ab0:	0284b503          	ld	a0,40(s1)
    80003ab4:	fffff097          	auipc	ra,0xfffff
    80003ab8:	be8080e7          	jalr	-1048(ra) # 8000269c <_Z8sem_waitP4_sem>

    int ret = buffer[head];
    80003abc:	0084b703          	ld	a4,8(s1)
    80003ac0:	0104a783          	lw	a5,16(s1)
    80003ac4:	00279693          	slli	a3,a5,0x2
    80003ac8:	00d70733          	add	a4,a4,a3
    80003acc:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80003ad0:	0017879b          	addiw	a5,a5,1
    80003ad4:	0004a703          	lw	a4,0(s1)
    80003ad8:	02e7e7bb          	remw	a5,a5,a4
    80003adc:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80003ae0:	0284b503          	ld	a0,40(s1)
    80003ae4:	fffff097          	auipc	ra,0xfffff
    80003ae8:	bec080e7          	jalr	-1044(ra) # 800026d0 <_Z10sem_signalP4_sem>

    sem_signal(spaceAvailable);
    80003aec:	0184b503          	ld	a0,24(s1)
    80003af0:	fffff097          	auipc	ra,0xfffff
    80003af4:	be0080e7          	jalr	-1056(ra) # 800026d0 <_Z10sem_signalP4_sem>

    return ret;
}
    80003af8:	00090513          	mv	a0,s2
    80003afc:	01813083          	ld	ra,24(sp)
    80003b00:	01013403          	ld	s0,16(sp)
    80003b04:	00813483          	ld	s1,8(sp)
    80003b08:	00013903          	ld	s2,0(sp)
    80003b0c:	02010113          	addi	sp,sp,32
    80003b10:	00008067          	ret

0000000080003b14 <_ZL8printIntiii>:
}

static char digits[] = "0123456789ABCDEF";

static void printInt(int xx, int base=10, int sgn=0)
{
    80003b14:	fc010113          	addi	sp,sp,-64
    80003b18:	02113c23          	sd	ra,56(sp)
    80003b1c:	02813823          	sd	s0,48(sp)
    80003b20:	02913423          	sd	s1,40(sp)
    80003b24:	03213023          	sd	s2,32(sp)
    80003b28:	01313c23          	sd	s3,24(sp)
    80003b2c:	04010413          	addi	s0,sp,64
    80003b30:	00050493          	mv	s1,a0
    80003b34:	00058913          	mv	s2,a1
    80003b38:	00060993          	mv	s3,a2
    LOCK();
    80003b3c:	00100613          	li	a2,1
    80003b40:	00000593          	li	a1,0
    80003b44:	00006517          	auipc	a0,0x6
    80003b48:	32c50513          	addi	a0,a0,812 # 80009e70 <lockPrint>
    80003b4c:	ffffd097          	auipc	ra,0xffffd
    80003b50:	634080e7          	jalr	1588(ra) # 80001180 <copy_and_swap>
    80003b54:	fe0514e3          	bnez	a0,80003b3c <_ZL8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80003b58:	00098463          	beqz	s3,80003b60 <_ZL8printIntiii+0x4c>
    80003b5c:	0804c463          	bltz	s1,80003be4 <_ZL8printIntiii+0xd0>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80003b60:	0004851b          	sext.w	a0,s1
    neg = 0;
    80003b64:	00000593          	li	a1,0
    }

    i = 0;
    80003b68:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80003b6c:	0009079b          	sext.w	a5,s2
    80003b70:	0325773b          	remuw	a4,a0,s2
    80003b74:	00048613          	mv	a2,s1
    80003b78:	0014849b          	addiw	s1,s1,1
    80003b7c:	02071693          	slli	a3,a4,0x20
    80003b80:	0206d693          	srli	a3,a3,0x20
    80003b84:	00005717          	auipc	a4,0x5
    80003b88:	94470713          	addi	a4,a4,-1724 # 800084c8 <_ZL6digits>
    80003b8c:	00d70733          	add	a4,a4,a3
    80003b90:	00074683          	lbu	a3,0(a4)
    80003b94:	fd040713          	addi	a4,s0,-48
    80003b98:	00c70733          	add	a4,a4,a2
    80003b9c:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80003ba0:	0005071b          	sext.w	a4,a0
    80003ba4:	0325553b          	divuw	a0,a0,s2
    80003ba8:	fcf772e3          	bgeu	a4,a5,80003b6c <_ZL8printIntiii+0x58>
    if(neg)
    80003bac:	00058c63          	beqz	a1,80003bc4 <_ZL8printIntiii+0xb0>
        buf[i++] = '-';
    80003bb0:	fd040793          	addi	a5,s0,-48
    80003bb4:	009784b3          	add	s1,a5,s1
    80003bb8:	02d00793          	li	a5,45
    80003bbc:	fef48823          	sb	a5,-16(s1)
    80003bc0:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80003bc4:	fff4849b          	addiw	s1,s1,-1
    80003bc8:	0204c463          	bltz	s1,80003bf0 <_ZL8printIntiii+0xdc>
        putc(buf[i]);
    80003bcc:	fd040793          	addi	a5,s0,-48
    80003bd0:	009787b3          	add	a5,a5,s1
    80003bd4:	ff07c503          	lbu	a0,-16(a5)
    80003bd8:	fffff097          	auipc	ra,0xfffff
    80003bdc:	b94080e7          	jalr	-1132(ra) # 8000276c <_Z4putcc>
    80003be0:	fe5ff06f          	j	80003bc4 <_ZL8printIntiii+0xb0>
        x = -xx;
    80003be4:	4090053b          	negw	a0,s1
        neg = 1;
    80003be8:	00100593          	li	a1,1
        x = -xx;
    80003bec:	f7dff06f          	j	80003b68 <_ZL8printIntiii+0x54>

    UNLOCK();
    80003bf0:	00000613          	li	a2,0
    80003bf4:	00100593          	li	a1,1
    80003bf8:	00006517          	auipc	a0,0x6
    80003bfc:	27850513          	addi	a0,a0,632 # 80009e70 <lockPrint>
    80003c00:	ffffd097          	auipc	ra,0xffffd
    80003c04:	580080e7          	jalr	1408(ra) # 80001180 <copy_and_swap>
    80003c08:	fe0514e3          	bnez	a0,80003bf0 <_ZL8printIntiii+0xdc>
}
    80003c0c:	03813083          	ld	ra,56(sp)
    80003c10:	03013403          	ld	s0,48(sp)
    80003c14:	02813483          	ld	s1,40(sp)
    80003c18:	02013903          	ld	s2,32(sp)
    80003c1c:	01813983          	ld	s3,24(sp)
    80003c20:	04010113          	addi	sp,sp,64
    80003c24:	00008067          	ret

0000000080003c28 <_Z16producerKeyboardPv>:
    sem_t wait;
};

volatile int threadEnd = 0;

void producerKeyboard(void *arg) {
    80003c28:	fe010113          	addi	sp,sp,-32
    80003c2c:	00113c23          	sd	ra,24(sp)
    80003c30:	00813823          	sd	s0,16(sp)
    80003c34:	00913423          	sd	s1,8(sp)
    80003c38:	01213023          	sd	s2,0(sp)
    80003c3c:	02010413          	addi	s0,sp,32
    80003c40:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80003c44:	00000913          	li	s2,0
    80003c48:	00c0006f          	j	80003c54 <_Z16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003c4c:	fffff097          	auipc	ra,0xfffff
    80003c50:	94c080e7          	jalr	-1716(ra) # 80002598 <_Z15thread_dispatchv>
    while ((key = getc()) != 0x1b) {
    80003c54:	fffff097          	auipc	ra,0xfffff
    80003c58:	ae4080e7          	jalr	-1308(ra) # 80002738 <_Z4getcv>
    80003c5c:	0005059b          	sext.w	a1,a0
    80003c60:	01b00793          	li	a5,27
    80003c64:	02f58a63          	beq	a1,a5,80003c98 <_Z16producerKeyboardPv+0x70>
        data->buffer->put(key);
    80003c68:	0084b503          	ld	a0,8(s1)
    80003c6c:	00000097          	auipc	ra,0x0
    80003c70:	d8c080e7          	jalr	-628(ra) # 800039f8 <_ZN6Buffer3putEi>
        i++;
    80003c74:	0019071b          	addiw	a4,s2,1
    80003c78:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003c7c:	0004a683          	lw	a3,0(s1)
    80003c80:	0026979b          	slliw	a5,a3,0x2
    80003c84:	00d787bb          	addw	a5,a5,a3
    80003c88:	0017979b          	slliw	a5,a5,0x1
    80003c8c:	02f767bb          	remw	a5,a4,a5
    80003c90:	fc0792e3          	bnez	a5,80003c54 <_Z16producerKeyboardPv+0x2c>
    80003c94:	fb9ff06f          	j	80003c4c <_Z16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    80003c98:	00100793          	li	a5,1
    80003c9c:	00006717          	auipc	a4,0x6
    80003ca0:	1cf72e23          	sw	a5,476(a4) # 80009e78 <threadEnd>

    delete data->buffer;
    80003ca4:	0084b903          	ld	s2,8(s1)
    80003ca8:	00090e63          	beqz	s2,80003cc4 <_Z16producerKeyboardPv+0x9c>
    80003cac:	00090513          	mv	a0,s2
    80003cb0:	00000097          	auipc	ra,0x0
    80003cb4:	c9c080e7          	jalr	-868(ra) # 8000394c <_ZN6BufferD1Ev>
    80003cb8:	00090513          	mv	a0,s2
    80003cbc:	fffff097          	auipc	ra,0xfffff
    80003cc0:	b30080e7          	jalr	-1232(ra) # 800027ec <_ZdlPv>

    sem_signal(data->wait);
    80003cc4:	0104b503          	ld	a0,16(s1)
    80003cc8:	fffff097          	auipc	ra,0xfffff
    80003ccc:	a08080e7          	jalr	-1528(ra) # 800026d0 <_Z10sem_signalP4_sem>
}
    80003cd0:	01813083          	ld	ra,24(sp)
    80003cd4:	01013403          	ld	s0,16(sp)
    80003cd8:	00813483          	ld	s1,8(sp)
    80003cdc:	00013903          	ld	s2,0(sp)
    80003ce0:	02010113          	addi	sp,sp,32
    80003ce4:	00008067          	ret

0000000080003ce8 <_Z8producerPv>:

void producer(void *arg) {
    80003ce8:	fe010113          	addi	sp,sp,-32
    80003cec:	00113c23          	sd	ra,24(sp)
    80003cf0:	00813823          	sd	s0,16(sp)
    80003cf4:	00913423          	sd	s1,8(sp)
    80003cf8:	01213023          	sd	s2,0(sp)
    80003cfc:	02010413          	addi	s0,sp,32
    80003d00:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003d04:	00000913          	li	s2,0
    80003d08:	00c0006f          	j	80003d14 <_Z8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003d0c:	fffff097          	auipc	ra,0xfffff
    80003d10:	88c080e7          	jalr	-1908(ra) # 80002598 <_Z15thread_dispatchv>
    while (!threadEnd) {
    80003d14:	00006797          	auipc	a5,0x6
    80003d18:	1647a783          	lw	a5,356(a5) # 80009e78 <threadEnd>
    80003d1c:	02079e63          	bnez	a5,80003d58 <_Z8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80003d20:	0004a583          	lw	a1,0(s1)
    80003d24:	0305859b          	addiw	a1,a1,48
    80003d28:	0084b503          	ld	a0,8(s1)
    80003d2c:	00000097          	auipc	ra,0x0
    80003d30:	ccc080e7          	jalr	-820(ra) # 800039f8 <_ZN6Buffer3putEi>
        i++;
    80003d34:	0019071b          	addiw	a4,s2,1
    80003d38:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003d3c:	0004a683          	lw	a3,0(s1)
    80003d40:	0026979b          	slliw	a5,a3,0x2
    80003d44:	00d787bb          	addw	a5,a5,a3
    80003d48:	0017979b          	slliw	a5,a5,0x1
    80003d4c:	02f767bb          	remw	a5,a4,a5
    80003d50:	fc0792e3          	bnez	a5,80003d14 <_Z8producerPv+0x2c>
    80003d54:	fb9ff06f          	j	80003d0c <_Z8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    80003d58:	0104b503          	ld	a0,16(s1)
    80003d5c:	fffff097          	auipc	ra,0xfffff
    80003d60:	974080e7          	jalr	-1676(ra) # 800026d0 <_Z10sem_signalP4_sem>
}
    80003d64:	01813083          	ld	ra,24(sp)
    80003d68:	01013403          	ld	s0,16(sp)
    80003d6c:	00813483          	ld	s1,8(sp)
    80003d70:	00013903          	ld	s2,0(sp)
    80003d74:	02010113          	addi	sp,sp,32
    80003d78:	00008067          	ret

0000000080003d7c <_Z8consumerPv>:

void consumer(void *arg) {
    80003d7c:	fd010113          	addi	sp,sp,-48
    80003d80:	02113423          	sd	ra,40(sp)
    80003d84:	02813023          	sd	s0,32(sp)
    80003d88:	00913c23          	sd	s1,24(sp)
    80003d8c:	01213823          	sd	s2,16(sp)
    80003d90:	01313423          	sd	s3,8(sp)
    80003d94:	03010413          	addi	s0,sp,48
    80003d98:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;


    int i = 0;
    80003d9c:	00000993          	li	s3,0
    80003da0:	01c0006f          	j	80003dbc <_Z8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    80003da4:	ffffe097          	auipc	ra,0xffffe
    80003da8:	7f4080e7          	jalr	2036(ra) # 80002598 <_Z15thread_dispatchv>
    80003dac:	0500006f          	j	80003dfc <_Z8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    80003db0:	00a00513          	li	a0,10
    80003db4:	fffff097          	auipc	ra,0xfffff
    80003db8:	9b8080e7          	jalr	-1608(ra) # 8000276c <_Z4putcc>
    while (!threadEnd) {
    80003dbc:	00006797          	auipc	a5,0x6
    80003dc0:	0bc7a783          	lw	a5,188(a5) # 80009e78 <threadEnd>
    80003dc4:	04079463          	bnez	a5,80003e0c <_Z8consumerPv+0x90>
        int key = data->buffer->get();
    80003dc8:	00893503          	ld	a0,8(s2)
    80003dcc:	00000097          	auipc	ra,0x0
    80003dd0:	cbc080e7          	jalr	-836(ra) # 80003a88 <_ZN6Buffer3getEv>
        i++;
    80003dd4:	0019849b          	addiw	s1,s3,1
    80003dd8:	0004899b          	sext.w	s3,s1
        putc(key);
    80003ddc:	0ff57513          	andi	a0,a0,255
    80003de0:	fffff097          	auipc	ra,0xfffff
    80003de4:	98c080e7          	jalr	-1652(ra) # 8000276c <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80003de8:	00092703          	lw	a4,0(s2)
    80003dec:	0027179b          	slliw	a5,a4,0x2
    80003df0:	00e787bb          	addw	a5,a5,a4
    80003df4:	02f4e7bb          	remw	a5,s1,a5
    80003df8:	fa0786e3          	beqz	a5,80003da4 <_Z8consumerPv+0x28>
        if (i % 80 == 0) {
    80003dfc:	05000793          	li	a5,80
    80003e00:	02f4e4bb          	remw	s1,s1,a5
    80003e04:	fa049ce3          	bnez	s1,80003dbc <_Z8consumerPv+0x40>
    80003e08:	fa9ff06f          	j	80003db0 <_Z8consumerPv+0x34>
        }
    }

    sem_signal(data->wait);
    80003e0c:	01093503          	ld	a0,16(s2)
    80003e10:	fffff097          	auipc	ra,0xfffff
    80003e14:	8c0080e7          	jalr	-1856(ra) # 800026d0 <_Z10sem_signalP4_sem>
}
    80003e18:	02813083          	ld	ra,40(sp)
    80003e1c:	02013403          	ld	s0,32(sp)
    80003e20:	01813483          	ld	s1,24(sp)
    80003e24:	01013903          	ld	s2,16(sp)
    80003e28:	00813983          	ld	s3,8(sp)
    80003e2c:	03010113          	addi	sp,sp,48
    80003e30:	00008067          	ret

0000000080003e34 <_Z11printStringPKc>:
{
    80003e34:	fe010113          	addi	sp,sp,-32
    80003e38:	00113c23          	sd	ra,24(sp)
    80003e3c:	00813823          	sd	s0,16(sp)
    80003e40:	00913423          	sd	s1,8(sp)
    80003e44:	02010413          	addi	s0,sp,32
    80003e48:	00050493          	mv	s1,a0
    LOCK();
    80003e4c:	00100613          	li	a2,1
    80003e50:	00000593          	li	a1,0
    80003e54:	00006517          	auipc	a0,0x6
    80003e58:	01c50513          	addi	a0,a0,28 # 80009e70 <lockPrint>
    80003e5c:	ffffd097          	auipc	ra,0xffffd
    80003e60:	324080e7          	jalr	804(ra) # 80001180 <copy_and_swap>
    80003e64:	fe0514e3          	bnez	a0,80003e4c <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80003e68:	0004c503          	lbu	a0,0(s1)
    80003e6c:	00050a63          	beqz	a0,80003e80 <_Z11printStringPKc+0x4c>
        putc(*string);
    80003e70:	fffff097          	auipc	ra,0xfffff
    80003e74:	8fc080e7          	jalr	-1796(ra) # 8000276c <_Z4putcc>
        string++;
    80003e78:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80003e7c:	fedff06f          	j	80003e68 <_Z11printStringPKc+0x34>
    UNLOCK();
    80003e80:	00000613          	li	a2,0
    80003e84:	00100593          	li	a1,1
    80003e88:	00006517          	auipc	a0,0x6
    80003e8c:	fe850513          	addi	a0,a0,-24 # 80009e70 <lockPrint>
    80003e90:	ffffd097          	auipc	ra,0xffffd
    80003e94:	2f0080e7          	jalr	752(ra) # 80001180 <copy_and_swap>
    80003e98:	fe0514e3          	bnez	a0,80003e80 <_Z11printStringPKc+0x4c>
}
    80003e9c:	01813083          	ld	ra,24(sp)
    80003ea0:	01013403          	ld	s0,16(sp)
    80003ea4:	00813483          	ld	s1,8(sp)
    80003ea8:	02010113          	addi	sp,sp,32
    80003eac:	00008067          	ret

0000000080003eb0 <_Z11workerBodyAPv>:
    if (n == 0 || n == 1) { return n; }
    if (n % 10 == 0) { thread_dispatch(); }
    return fibonacci(n - 1) + fibonacci(n - 2);
}

void workerBodyA(void* arg) {
    80003eb0:	fe010113          	addi	sp,sp,-32
    80003eb4:	00113c23          	sd	ra,24(sp)
    80003eb8:	00813823          	sd	s0,16(sp)
    80003ebc:	00913423          	sd	s1,8(sp)
    80003ec0:	01213023          	sd	s2,0(sp)
    80003ec4:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80003ec8:	00000913          	li	s2,0
    80003ecc:	0380006f          	j	80003f04 <_Z11workerBodyAPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003ed0:	ffffe097          	auipc	ra,0xffffe
    80003ed4:	6c8080e7          	jalr	1736(ra) # 80002598 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003ed8:	00148493          	addi	s1,s1,1
    80003edc:	000027b7          	lui	a5,0x2
    80003ee0:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003ee4:	0097ee63          	bltu	a5,s1,80003f00 <_Z11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003ee8:	00000713          	li	a4,0
    80003eec:	000077b7          	lui	a5,0x7
    80003ef0:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003ef4:	fce7eee3          	bltu	a5,a4,80003ed0 <_Z11workerBodyAPv+0x20>
    80003ef8:	00170713          	addi	a4,a4,1
    80003efc:	ff1ff06f          	j	80003eec <_Z11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80003f00:	00190913          	addi	s2,s2,1
    80003f04:	00900793          	li	a5,9
    80003f08:	0527e063          	bltu	a5,s2,80003f48 <_Z11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80003f0c:	00004517          	auipc	a0,0x4
    80003f10:	2f450513          	addi	a0,a0,756 # 80008200 <_ZZ14kprintUnsignedmE6digits+0x10>
    80003f14:	00000097          	auipc	ra,0x0
    80003f18:	f20080e7          	jalr	-224(ra) # 80003e34 <_Z11printStringPKc>
    80003f1c:	00000613          	li	a2,0
    80003f20:	00a00593          	li	a1,10
    80003f24:	0009051b          	sext.w	a0,s2
    80003f28:	00000097          	auipc	ra,0x0
    80003f2c:	bec080e7          	jalr	-1044(ra) # 80003b14 <_ZL8printIntiii>
    80003f30:	00004517          	auipc	a0,0x4
    80003f34:	25850513          	addi	a0,a0,600 # 80008188 <CONSOLE_STATUS+0x178>
    80003f38:	00000097          	auipc	ra,0x0
    80003f3c:	efc080e7          	jalr	-260(ra) # 80003e34 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003f40:	00000493          	li	s1,0
    80003f44:	f99ff06f          	j	80003edc <_Z11workerBodyAPv+0x2c>
        }
    }
    printString("A finished!\n");
    80003f48:	00004517          	auipc	a0,0x4
    80003f4c:	2c050513          	addi	a0,a0,704 # 80008208 <_ZZ14kprintUnsignedmE6digits+0x18>
    80003f50:	00000097          	auipc	ra,0x0
    80003f54:	ee4080e7          	jalr	-284(ra) # 80003e34 <_Z11printStringPKc>
    finishedA = true;
    80003f58:	00100793          	li	a5,1
    80003f5c:	00006717          	auipc	a4,0x6
    80003f60:	f2f70023          	sb	a5,-224(a4) # 80009e7c <finishedA>
}
    80003f64:	01813083          	ld	ra,24(sp)
    80003f68:	01013403          	ld	s0,16(sp)
    80003f6c:	00813483          	ld	s1,8(sp)
    80003f70:	00013903          	ld	s2,0(sp)
    80003f74:	02010113          	addi	sp,sp,32
    80003f78:	00008067          	ret

0000000080003f7c <_Z11workerBodyBPv>:

void workerBodyB(void* arg) {
    80003f7c:	fe010113          	addi	sp,sp,-32
    80003f80:	00113c23          	sd	ra,24(sp)
    80003f84:	00813823          	sd	s0,16(sp)
    80003f88:	00913423          	sd	s1,8(sp)
    80003f8c:	01213023          	sd	s2,0(sp)
    80003f90:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80003f94:	00000913          	li	s2,0
    80003f98:	0380006f          	j	80003fd0 <_Z11workerBodyBPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003f9c:	ffffe097          	auipc	ra,0xffffe
    80003fa0:	5fc080e7          	jalr	1532(ra) # 80002598 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003fa4:	00148493          	addi	s1,s1,1
    80003fa8:	000027b7          	lui	a5,0x2
    80003fac:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003fb0:	0097ee63          	bltu	a5,s1,80003fcc <_Z11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003fb4:	00000713          	li	a4,0
    80003fb8:	000077b7          	lui	a5,0x7
    80003fbc:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003fc0:	fce7eee3          	bltu	a5,a4,80003f9c <_Z11workerBodyBPv+0x20>
    80003fc4:	00170713          	addi	a4,a4,1
    80003fc8:	ff1ff06f          	j	80003fb8 <_Z11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80003fcc:	00190913          	addi	s2,s2,1
    80003fd0:	00f00793          	li	a5,15
    80003fd4:	0527e063          	bltu	a5,s2,80004014 <_Z11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80003fd8:	00004517          	auipc	a0,0x4
    80003fdc:	24050513          	addi	a0,a0,576 # 80008218 <_ZZ14kprintUnsignedmE6digits+0x28>
    80003fe0:	00000097          	auipc	ra,0x0
    80003fe4:	e54080e7          	jalr	-428(ra) # 80003e34 <_Z11printStringPKc>
    80003fe8:	00000613          	li	a2,0
    80003fec:	00a00593          	li	a1,10
    80003ff0:	0009051b          	sext.w	a0,s2
    80003ff4:	00000097          	auipc	ra,0x0
    80003ff8:	b20080e7          	jalr	-1248(ra) # 80003b14 <_ZL8printIntiii>
    80003ffc:	00004517          	auipc	a0,0x4
    80004000:	18c50513          	addi	a0,a0,396 # 80008188 <CONSOLE_STATUS+0x178>
    80004004:	00000097          	auipc	ra,0x0
    80004008:	e30080e7          	jalr	-464(ra) # 80003e34 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    8000400c:	00000493          	li	s1,0
    80004010:	f99ff06f          	j	80003fa8 <_Z11workerBodyBPv+0x2c>
        }
    }
    printString("B finished!\n");
    80004014:	00004517          	auipc	a0,0x4
    80004018:	20c50513          	addi	a0,a0,524 # 80008220 <_ZZ14kprintUnsignedmE6digits+0x30>
    8000401c:	00000097          	auipc	ra,0x0
    80004020:	e18080e7          	jalr	-488(ra) # 80003e34 <_Z11printStringPKc>
    finishedB = true;
    80004024:	00100793          	li	a5,1
    80004028:	00006717          	auipc	a4,0x6
    8000402c:	e4f70aa3          	sb	a5,-427(a4) # 80009e7d <finishedB>
    thread_dispatch();
    80004030:	ffffe097          	auipc	ra,0xffffe
    80004034:	568080e7          	jalr	1384(ra) # 80002598 <_Z15thread_dispatchv>
}
    80004038:	01813083          	ld	ra,24(sp)
    8000403c:	01013403          	ld	s0,16(sp)
    80004040:	00813483          	ld	s1,8(sp)
    80004044:	00013903          	ld	s2,0(sp)
    80004048:	02010113          	addi	sp,sp,32
    8000404c:	00008067          	ret

0000000080004050 <_Z9sleepyRunPv>:

#include "printing.hpp"

bool finished[2];

void sleepyRun(void *arg) {
    80004050:	fe010113          	addi	sp,sp,-32
    80004054:	00113c23          	sd	ra,24(sp)
    80004058:	00813823          	sd	s0,16(sp)
    8000405c:	00913423          	sd	s1,8(sp)
    80004060:	01213023          	sd	s2,0(sp)
    80004064:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    80004068:	00053903          	ld	s2,0(a0)
    int i = 6;
    8000406c:	00600493          	li	s1,6
    while (--i > 0) {
    80004070:	fff4849b          	addiw	s1,s1,-1
    80004074:	04905463          	blez	s1,800040bc <_Z9sleepyRunPv+0x6c>
        printString("Hello ");
    80004078:	00004517          	auipc	a0,0x4
    8000407c:	1b850513          	addi	a0,a0,440 # 80008230 <_ZZ14kprintUnsignedmE6digits+0x40>
    80004080:	00000097          	auipc	ra,0x0
    80004084:	db4080e7          	jalr	-588(ra) # 80003e34 <_Z11printStringPKc>
        printInt(sleep_time);
    80004088:	00000613          	li	a2,0
    8000408c:	00a00593          	li	a1,10
    80004090:	0009051b          	sext.w	a0,s2
    80004094:	00000097          	auipc	ra,0x0
    80004098:	a80080e7          	jalr	-1408(ra) # 80003b14 <_ZL8printIntiii>
        printString(" !\n");
    8000409c:	00004517          	auipc	a0,0x4
    800040a0:	19c50513          	addi	a0,a0,412 # 80008238 <_ZZ14kprintUnsignedmE6digits+0x48>
    800040a4:	00000097          	auipc	ra,0x0
    800040a8:	d90080e7          	jalr	-624(ra) # 80003e34 <_Z11printStringPKc>
        time_sleep(sleep_time);
    800040ac:	00090513          	mv	a0,s2
    800040b0:	ffffe097          	auipc	ra,0xffffe
    800040b4:	654080e7          	jalr	1620(ra) # 80002704 <_Z10time_sleepm>
    while (--i > 0) {
    800040b8:	fb9ff06f          	j	80004070 <_Z9sleepyRunPv+0x20>
    }
    finished[sleep_time/10-1] = true;
    800040bc:	00a00793          	li	a5,10
    800040c0:	02f95933          	divu	s2,s2,a5
    800040c4:	fff90913          	addi	s2,s2,-1
    800040c8:	00006797          	auipc	a5,0x6
    800040cc:	da878793          	addi	a5,a5,-600 # 80009e70 <lockPrint>
    800040d0:	01278933          	add	s2,a5,s2
    800040d4:	00100793          	li	a5,1
    800040d8:	00f90823          	sb	a5,16(s2)
}
    800040dc:	01813083          	ld	ra,24(sp)
    800040e0:	01013403          	ld	s0,16(sp)
    800040e4:	00813483          	ld	s1,8(sp)
    800040e8:	00013903          	ld	s2,0(sp)
    800040ec:	02010113          	addi	sp,sp,32
    800040f0:	00008067          	ret

00000000800040f4 <_Z11workerBodyEPv>:
//    printInteger(n);
//    printString(" fibonacci number\n");
    return fibonacci(n-1) + fibonacci(n-2);
}

void workerBodyE(void *) {
    800040f4:	fe010113          	addi	sp,sp,-32
    800040f8:	00113c23          	sd	ra,24(sp)
    800040fc:	00813823          	sd	s0,16(sp)
    80004100:	00913423          	sd	s1,8(sp)
    80004104:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80004108:	00000493          	li	s1,0
    8000410c:	0180006f          	j	80004124 <_Z11workerBodyEPv+0x30>
        printString("A: i=");
        printInt(i);
        printString("\n");
        if (i % 4 == 0) time_sleep(50);
    80004110:	03200513          	li	a0,50
    80004114:	ffffe097          	auipc	ra,0xffffe
    80004118:	5f0080e7          	jalr	1520(ra) # 80002704 <_Z10time_sleepm>
    8000411c:	04c0006f          	j	80004168 <_Z11workerBodyEPv+0x74>
    for (uint64 i = 0; i < 10; i++) {
    80004120:	00148493          	addi	s1,s1,1
    80004124:	00900793          	li	a5,9
    80004128:	0497ec63          	bltu	a5,s1,80004180 <_Z11workerBodyEPv+0x8c>
        printString("A: i=");
    8000412c:	00004517          	auipc	a0,0x4
    80004130:	0d450513          	addi	a0,a0,212 # 80008200 <_ZZ14kprintUnsignedmE6digits+0x10>
    80004134:	00000097          	auipc	ra,0x0
    80004138:	d00080e7          	jalr	-768(ra) # 80003e34 <_Z11printStringPKc>
        printInt(i);
    8000413c:	00000613          	li	a2,0
    80004140:	00a00593          	li	a1,10
    80004144:	0004851b          	sext.w	a0,s1
    80004148:	00000097          	auipc	ra,0x0
    8000414c:	9cc080e7          	jalr	-1588(ra) # 80003b14 <_ZL8printIntiii>
        printString("\n");
    80004150:	00004517          	auipc	a0,0x4
    80004154:	03850513          	addi	a0,a0,56 # 80008188 <CONSOLE_STATUS+0x178>
    80004158:	00000097          	auipc	ra,0x0
    8000415c:	cdc080e7          	jalr	-804(ra) # 80003e34 <_Z11printStringPKc>
        if (i % 4 == 0) time_sleep(50);
    80004160:	0034f793          	andi	a5,s1,3
    80004164:	fa0786e3          	beqz	a5,80004110 <_Z11workerBodyEPv+0x1c>
        for (uint64 k = 0; k < 30000; k++) {
    80004168:	00000713          	li	a4,0
    8000416c:	000077b7          	lui	a5,0x7
    80004170:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80004174:	fae7e6e3          	bltu	a5,a4,80004120 <_Z11workerBodyEPv+0x2c>
    80004178:	00170713          	addi	a4,a4,1
    8000417c:	ff1ff06f          	j	8000416c <_Z11workerBodyEPv+0x78>
            //busy wait
        }
        // TCB::yield();
    }
    printString("Worker A finished\n");
    80004180:	00004517          	auipc	a0,0x4
    80004184:	0c050513          	addi	a0,a0,192 # 80008240 <_ZZ14kprintUnsignedmE6digits+0x50>
    80004188:	00000097          	auipc	ra,0x0
    8000418c:	cac080e7          	jalr	-852(ra) # 80003e34 <_Z11printStringPKc>
}
    80004190:	01813083          	ld	ra,24(sp)
    80004194:	01013403          	ld	s0,16(sp)
    80004198:	00813483          	ld	s1,8(sp)
    8000419c:	02010113          	addi	sp,sp,32
    800041a0:	00008067          	ret

00000000800041a4 <_Z11workerBodyFPv>:

void workerBodyF(void *) {
    800041a4:	fe010113          	addi	sp,sp,-32
    800041a8:	00113c23          	sd	ra,24(sp)
    800041ac:	00813823          	sd	s0,16(sp)
    800041b0:	00913423          	sd	s1,8(sp)
    800041b4:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    800041b8:	00000493          	li	s1,0
    800041bc:	0380006f          	j	800041f4 <_Z11workerBodyFPv+0x50>
        printString("B: i=");
        printInt(i);
        printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
    800041c0:	00168693          	addi	a3,a3,1
    800041c4:	000027b7          	lui	a5,0x2
    800041c8:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800041cc:	00d7ee63          	bltu	a5,a3,800041e8 <_Z11workerBodyFPv+0x44>
            for (uint64 k = 0; k < 30000; k++) {
    800041d0:	00000713          	li	a4,0
    800041d4:	000077b7          	lui	a5,0x7
    800041d8:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800041dc:	fee7e2e3          	bltu	a5,a4,800041c0 <_Z11workerBodyFPv+0x1c>
    800041e0:	00170713          	addi	a4,a4,1
    800041e4:	ff1ff06f          	j	800041d4 <_Z11workerBodyFPv+0x30>
                // busy wait
            }
            // TCB::yield()
        }
        thread_dispatch();
    800041e8:	ffffe097          	auipc	ra,0xffffe
    800041ec:	3b0080e7          	jalr	944(ra) # 80002598 <_Z15thread_dispatchv>
    for (uint64 i = 0; i < 16; i++) {
    800041f0:	00148493          	addi	s1,s1,1
    800041f4:	00f00793          	li	a5,15
    800041f8:	0497e063          	bltu	a5,s1,80004238 <_Z11workerBodyFPv+0x94>
        printString("B: i=");
    800041fc:	00004517          	auipc	a0,0x4
    80004200:	01c50513          	addi	a0,a0,28 # 80008218 <_ZZ14kprintUnsignedmE6digits+0x28>
    80004204:	00000097          	auipc	ra,0x0
    80004208:	c30080e7          	jalr	-976(ra) # 80003e34 <_Z11printStringPKc>
        printInt(i);
    8000420c:	00000613          	li	a2,0
    80004210:	00a00593          	li	a1,10
    80004214:	0004851b          	sext.w	a0,s1
    80004218:	00000097          	auipc	ra,0x0
    8000421c:	8fc080e7          	jalr	-1796(ra) # 80003b14 <_ZL8printIntiii>
        printString("\n");
    80004220:	00004517          	auipc	a0,0x4
    80004224:	f6850513          	addi	a0,a0,-152 # 80008188 <CONSOLE_STATUS+0x178>
    80004228:	00000097          	auipc	ra,0x0
    8000422c:	c0c080e7          	jalr	-1012(ra) # 80003e34 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80004230:	00000693          	li	a3,0
    80004234:	f91ff06f          	j	800041c4 <_Z11workerBodyFPv+0x20>
    }
    printString("Worker B finished\n");
    80004238:	00004517          	auipc	a0,0x4
    8000423c:	02050513          	addi	a0,a0,32 # 80008258 <_ZZ14kprintUnsignedmE6digits+0x68>
    80004240:	00000097          	auipc	ra,0x0
    80004244:	bf4080e7          	jalr	-1036(ra) # 80003e34 <_Z11printStringPKc>
}
    80004248:	01813083          	ld	ra,24(sp)
    8000424c:	01013403          	ld	s0,16(sp)
    80004250:	00813483          	ld	s1,8(sp)
    80004254:	02010113          	addi	sp,sp,32
    80004258:	00008067          	ret

000000008000425c <_Z9getStringPci>:
char* getString(char *buf, int max) {
    8000425c:	fd010113          	addi	sp,sp,-48
    80004260:	02113423          	sd	ra,40(sp)
    80004264:	02813023          	sd	s0,32(sp)
    80004268:	00913c23          	sd	s1,24(sp)
    8000426c:	01213823          	sd	s2,16(sp)
    80004270:	01313423          	sd	s3,8(sp)
    80004274:	01413023          	sd	s4,0(sp)
    80004278:	03010413          	addi	s0,sp,48
    8000427c:	00050993          	mv	s3,a0
    80004280:	00058a13          	mv	s4,a1
    LOCK();
    80004284:	00100613          	li	a2,1
    80004288:	00000593          	li	a1,0
    8000428c:	00006517          	auipc	a0,0x6
    80004290:	be450513          	addi	a0,a0,-1052 # 80009e70 <lockPrint>
    80004294:	ffffd097          	auipc	ra,0xffffd
    80004298:	eec080e7          	jalr	-276(ra) # 80001180 <copy_and_swap>
    8000429c:	fe0514e3          	bnez	a0,80004284 <_Z9getStringPci+0x28>
    for(i=0; i+1 < max; ){
    800042a0:	00000913          	li	s2,0
    800042a4:	00090493          	mv	s1,s2
    800042a8:	0019091b          	addiw	s2,s2,1
    800042ac:	03495a63          	bge	s2,s4,800042e0 <_Z9getStringPci+0x84>
        cc = getc();
    800042b0:	ffffe097          	auipc	ra,0xffffe
    800042b4:	488080e7          	jalr	1160(ra) # 80002738 <_Z4getcv>
        if(cc < 1)
    800042b8:	02050463          	beqz	a0,800042e0 <_Z9getStringPci+0x84>
        buf[i++] = c;
    800042bc:	009984b3          	add	s1,s3,s1
    800042c0:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    800042c4:	00a00793          	li	a5,10
    800042c8:	00f50a63          	beq	a0,a5,800042dc <_Z9getStringPci+0x80>
    800042cc:	00d00793          	li	a5,13
    800042d0:	fcf51ae3          	bne	a0,a5,800042a4 <_Z9getStringPci+0x48>
        buf[i++] = c;
    800042d4:	00090493          	mv	s1,s2
    800042d8:	0080006f          	j	800042e0 <_Z9getStringPci+0x84>
    800042dc:	00090493          	mv	s1,s2
    buf[i] = '\0';
    800042e0:	009984b3          	add	s1,s3,s1
    800042e4:	00048023          	sb	zero,0(s1)
    UNLOCK();
    800042e8:	00000613          	li	a2,0
    800042ec:	00100593          	li	a1,1
    800042f0:	00006517          	auipc	a0,0x6
    800042f4:	b8050513          	addi	a0,a0,-1152 # 80009e70 <lockPrint>
    800042f8:	ffffd097          	auipc	ra,0xffffd
    800042fc:	e88080e7          	jalr	-376(ra) # 80001180 <copy_and_swap>
    80004300:	fe0514e3          	bnez	a0,800042e8 <_Z9getStringPci+0x8c>
}
    80004304:	00098513          	mv	a0,s3
    80004308:	02813083          	ld	ra,40(sp)
    8000430c:	02013403          	ld	s0,32(sp)
    80004310:	01813483          	ld	s1,24(sp)
    80004314:	01013903          	ld	s2,16(sp)
    80004318:	00813983          	ld	s3,8(sp)
    8000431c:	00013a03          	ld	s4,0(sp)
    80004320:	03010113          	addi	sp,sp,48
    80004324:	00008067          	ret

0000000080004328 <_Z11stringToIntPKc>:
int stringToInt(const char *s) {
    80004328:	ff010113          	addi	sp,sp,-16
    8000432c:	00813423          	sd	s0,8(sp)
    80004330:	01010413          	addi	s0,sp,16
    80004334:	00050693          	mv	a3,a0
    n = 0;
    80004338:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    8000433c:	0006c603          	lbu	a2,0(a3)
    80004340:	fd06071b          	addiw	a4,a2,-48
    80004344:	0ff77713          	andi	a4,a4,255
    80004348:	00900793          	li	a5,9
    8000434c:	02e7e063          	bltu	a5,a4,8000436c <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80004350:	0025179b          	slliw	a5,a0,0x2
    80004354:	00a787bb          	addw	a5,a5,a0
    80004358:	0017979b          	slliw	a5,a5,0x1
    8000435c:	00168693          	addi	a3,a3,1
    80004360:	00c787bb          	addw	a5,a5,a2
    80004364:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80004368:	fd5ff06f          	j	8000433c <_Z11stringToIntPKc+0x14>
}
    8000436c:	00813403          	ld	s0,8(sp)
    80004370:	01010113          	addi	sp,sp,16
    80004374:	00008067          	ret

0000000080004378 <_Z9fibonaccim>:
uint64 fibonacci(uint64 n) {
    80004378:	fe010113          	addi	sp,sp,-32
    8000437c:	00113c23          	sd	ra,24(sp)
    80004380:	00813823          	sd	s0,16(sp)
    80004384:	00913423          	sd	s1,8(sp)
    80004388:	01213023          	sd	s2,0(sp)
    8000438c:	02010413          	addi	s0,sp,32
    80004390:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80004394:	00100793          	li	a5,1
    80004398:	02a7f863          	bgeu	a5,a0,800043c8 <_Z9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    8000439c:	00a00793          	li	a5,10
    800043a0:	02f577b3          	remu	a5,a0,a5
    800043a4:	02078e63          	beqz	a5,800043e0 <_Z9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    800043a8:	fff48513          	addi	a0,s1,-1
    800043ac:	00000097          	auipc	ra,0x0
    800043b0:	fcc080e7          	jalr	-52(ra) # 80004378 <_Z9fibonaccim>
    800043b4:	00050913          	mv	s2,a0
    800043b8:	ffe48513          	addi	a0,s1,-2
    800043bc:	00000097          	auipc	ra,0x0
    800043c0:	fbc080e7          	jalr	-68(ra) # 80004378 <_Z9fibonaccim>
    800043c4:	00a90533          	add	a0,s2,a0
}
    800043c8:	01813083          	ld	ra,24(sp)
    800043cc:	01013403          	ld	s0,16(sp)
    800043d0:	00813483          	ld	s1,8(sp)
    800043d4:	00013903          	ld	s2,0(sp)
    800043d8:	02010113          	addi	sp,sp,32
    800043dc:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    800043e0:	ffffe097          	auipc	ra,0xffffe
    800043e4:	1b8080e7          	jalr	440(ra) # 80002598 <_Z15thread_dispatchv>
    800043e8:	fc1ff06f          	j	800043a8 <_Z9fibonaccim+0x30>

00000000800043ec <_Z11workerBodyCPv>:

void workerBodyC(void* arg) {
    800043ec:	fe010113          	addi	sp,sp,-32
    800043f0:	00113c23          	sd	ra,24(sp)
    800043f4:	00813823          	sd	s0,16(sp)
    800043f8:	00913423          	sd	s1,8(sp)
    800043fc:	01213023          	sd	s2,0(sp)
    80004400:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80004404:	00000493          	li	s1,0
    80004408:	0400006f          	j	80004448 <_Z11workerBodyCPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    8000440c:	00004517          	auipc	a0,0x4
    80004410:	e6450513          	addi	a0,a0,-412 # 80008270 <_ZZ14kprintUnsignedmE6digits+0x80>
    80004414:	00000097          	auipc	ra,0x0
    80004418:	a20080e7          	jalr	-1504(ra) # 80003e34 <_Z11printStringPKc>
    8000441c:	00000613          	li	a2,0
    80004420:	00a00593          	li	a1,10
    80004424:	00048513          	mv	a0,s1
    80004428:	fffff097          	auipc	ra,0xfffff
    8000442c:	6ec080e7          	jalr	1772(ra) # 80003b14 <_ZL8printIntiii>
    80004430:	00004517          	auipc	a0,0x4
    80004434:	d5850513          	addi	a0,a0,-680 # 80008188 <CONSOLE_STATUS+0x178>
    80004438:	00000097          	auipc	ra,0x0
    8000443c:	9fc080e7          	jalr	-1540(ra) # 80003e34 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80004440:	0014849b          	addiw	s1,s1,1
    80004444:	0ff4f493          	andi	s1,s1,255
    80004448:	00200793          	li	a5,2
    8000444c:	fc97f0e3          	bgeu	a5,s1,8000440c <_Z11workerBodyCPv+0x20>
    }

    printString("C: dispatch\n");
    80004450:	00004517          	auipc	a0,0x4
    80004454:	e2850513          	addi	a0,a0,-472 # 80008278 <_ZZ14kprintUnsignedmE6digits+0x88>
    80004458:	00000097          	auipc	ra,0x0
    8000445c:	9dc080e7          	jalr	-1572(ra) # 80003e34 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80004460:	00700313          	li	t1,7
    thread_dispatch();
    80004464:	ffffe097          	auipc	ra,0xffffe
    80004468:	134080e7          	jalr	308(ra) # 80002598 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    8000446c:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    80004470:	00004517          	auipc	a0,0x4
    80004474:	e1850513          	addi	a0,a0,-488 # 80008288 <_ZZ14kprintUnsignedmE6digits+0x98>
    80004478:	00000097          	auipc	ra,0x0
    8000447c:	9bc080e7          	jalr	-1604(ra) # 80003e34 <_Z11printStringPKc>
    80004480:	00000613          	li	a2,0
    80004484:	00a00593          	li	a1,10
    80004488:	0009051b          	sext.w	a0,s2
    8000448c:	fffff097          	auipc	ra,0xfffff
    80004490:	688080e7          	jalr	1672(ra) # 80003b14 <_ZL8printIntiii>
    80004494:	00004517          	auipc	a0,0x4
    80004498:	cf450513          	addi	a0,a0,-780 # 80008188 <CONSOLE_STATUS+0x178>
    8000449c:	00000097          	auipc	ra,0x0
    800044a0:	998080e7          	jalr	-1640(ra) # 80003e34 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    800044a4:	00c00513          	li	a0,12
    800044a8:	00000097          	auipc	ra,0x0
    800044ac:	ed0080e7          	jalr	-304(ra) # 80004378 <_Z9fibonaccim>
    800044b0:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    800044b4:	00004517          	auipc	a0,0x4
    800044b8:	ddc50513          	addi	a0,a0,-548 # 80008290 <_ZZ14kprintUnsignedmE6digits+0xa0>
    800044bc:	00000097          	auipc	ra,0x0
    800044c0:	978080e7          	jalr	-1672(ra) # 80003e34 <_Z11printStringPKc>
    800044c4:	00000613          	li	a2,0
    800044c8:	00a00593          	li	a1,10
    800044cc:	0009051b          	sext.w	a0,s2
    800044d0:	fffff097          	auipc	ra,0xfffff
    800044d4:	644080e7          	jalr	1604(ra) # 80003b14 <_ZL8printIntiii>
    800044d8:	00004517          	auipc	a0,0x4
    800044dc:	cb050513          	addi	a0,a0,-848 # 80008188 <CONSOLE_STATUS+0x178>
    800044e0:	00000097          	auipc	ra,0x0
    800044e4:	954080e7          	jalr	-1708(ra) # 80003e34 <_Z11printStringPKc>
    800044e8:	0400006f          	j	80004528 <_Z11workerBodyCPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    800044ec:	00004517          	auipc	a0,0x4
    800044f0:	d8450513          	addi	a0,a0,-636 # 80008270 <_ZZ14kprintUnsignedmE6digits+0x80>
    800044f4:	00000097          	auipc	ra,0x0
    800044f8:	940080e7          	jalr	-1728(ra) # 80003e34 <_Z11printStringPKc>
    800044fc:	00000613          	li	a2,0
    80004500:	00a00593          	li	a1,10
    80004504:	00048513          	mv	a0,s1
    80004508:	fffff097          	auipc	ra,0xfffff
    8000450c:	60c080e7          	jalr	1548(ra) # 80003b14 <_ZL8printIntiii>
    80004510:	00004517          	auipc	a0,0x4
    80004514:	c7850513          	addi	a0,a0,-904 # 80008188 <CONSOLE_STATUS+0x178>
    80004518:	00000097          	auipc	ra,0x0
    8000451c:	91c080e7          	jalr	-1764(ra) # 80003e34 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80004520:	0014849b          	addiw	s1,s1,1
    80004524:	0ff4f493          	andi	s1,s1,255
    80004528:	00500793          	li	a5,5
    8000452c:	fc97f0e3          	bgeu	a5,s1,800044ec <_Z11workerBodyCPv+0x100>
    }

    printString("C finished!\n");
    80004530:	00004517          	auipc	a0,0x4
    80004534:	d7050513          	addi	a0,a0,-656 # 800082a0 <_ZZ14kprintUnsignedmE6digits+0xb0>
    80004538:	00000097          	auipc	ra,0x0
    8000453c:	8fc080e7          	jalr	-1796(ra) # 80003e34 <_Z11printStringPKc>
    finishedC = true;
    80004540:	00100793          	li	a5,1
    80004544:	00006717          	auipc	a4,0x6
    80004548:	92f70f23          	sb	a5,-1730(a4) # 80009e82 <finishedC>
    thread_dispatch();
    8000454c:	ffffe097          	auipc	ra,0xffffe
    80004550:	04c080e7          	jalr	76(ra) # 80002598 <_Z15thread_dispatchv>
}
    80004554:	01813083          	ld	ra,24(sp)
    80004558:	01013403          	ld	s0,16(sp)
    8000455c:	00813483          	ld	s1,8(sp)
    80004560:	00013903          	ld	s2,0(sp)
    80004564:	02010113          	addi	sp,sp,32
    80004568:	00008067          	ret

000000008000456c <_Z11workerBodyDPv>:

void workerBodyD(void* arg) {
    8000456c:	fe010113          	addi	sp,sp,-32
    80004570:	00113c23          	sd	ra,24(sp)
    80004574:	00813823          	sd	s0,16(sp)
    80004578:	00913423          	sd	s1,8(sp)
    8000457c:	01213023          	sd	s2,0(sp)
    80004580:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80004584:	00a00493          	li	s1,10
    80004588:	0400006f          	j	800045c8 <_Z11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    8000458c:	00004517          	auipc	a0,0x4
    80004590:	d2450513          	addi	a0,a0,-732 # 800082b0 <_ZZ14kprintUnsignedmE6digits+0xc0>
    80004594:	00000097          	auipc	ra,0x0
    80004598:	8a0080e7          	jalr	-1888(ra) # 80003e34 <_Z11printStringPKc>
    8000459c:	00000613          	li	a2,0
    800045a0:	00a00593          	li	a1,10
    800045a4:	00048513          	mv	a0,s1
    800045a8:	fffff097          	auipc	ra,0xfffff
    800045ac:	56c080e7          	jalr	1388(ra) # 80003b14 <_ZL8printIntiii>
    800045b0:	00004517          	auipc	a0,0x4
    800045b4:	bd850513          	addi	a0,a0,-1064 # 80008188 <CONSOLE_STATUS+0x178>
    800045b8:	00000097          	auipc	ra,0x0
    800045bc:	87c080e7          	jalr	-1924(ra) # 80003e34 <_Z11printStringPKc>
    for (; i < 13; i++) {
    800045c0:	0014849b          	addiw	s1,s1,1
    800045c4:	0ff4f493          	andi	s1,s1,255
    800045c8:	00c00793          	li	a5,12
    800045cc:	fc97f0e3          	bgeu	a5,s1,8000458c <_Z11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    800045d0:	00004517          	auipc	a0,0x4
    800045d4:	ce850513          	addi	a0,a0,-792 # 800082b8 <_ZZ14kprintUnsignedmE6digits+0xc8>
    800045d8:	00000097          	auipc	ra,0x0
    800045dc:	85c080e7          	jalr	-1956(ra) # 80003e34 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    800045e0:	00500313          	li	t1,5
    thread_dispatch();
    800045e4:	ffffe097          	auipc	ra,0xffffe
    800045e8:	fb4080e7          	jalr	-76(ra) # 80002598 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    800045ec:	01000513          	li	a0,16
    800045f0:	00000097          	auipc	ra,0x0
    800045f4:	d88080e7          	jalr	-632(ra) # 80004378 <_Z9fibonaccim>
    800045f8:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    800045fc:	00004517          	auipc	a0,0x4
    80004600:	ccc50513          	addi	a0,a0,-820 # 800082c8 <_ZZ14kprintUnsignedmE6digits+0xd8>
    80004604:	00000097          	auipc	ra,0x0
    80004608:	830080e7          	jalr	-2000(ra) # 80003e34 <_Z11printStringPKc>
    8000460c:	00000613          	li	a2,0
    80004610:	00a00593          	li	a1,10
    80004614:	0009051b          	sext.w	a0,s2
    80004618:	fffff097          	auipc	ra,0xfffff
    8000461c:	4fc080e7          	jalr	1276(ra) # 80003b14 <_ZL8printIntiii>
    80004620:	00004517          	auipc	a0,0x4
    80004624:	b6850513          	addi	a0,a0,-1176 # 80008188 <CONSOLE_STATUS+0x178>
    80004628:	00000097          	auipc	ra,0x0
    8000462c:	80c080e7          	jalr	-2036(ra) # 80003e34 <_Z11printStringPKc>
    80004630:	0400006f          	j	80004670 <_Z11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004634:	00004517          	auipc	a0,0x4
    80004638:	c7c50513          	addi	a0,a0,-900 # 800082b0 <_ZZ14kprintUnsignedmE6digits+0xc0>
    8000463c:	fffff097          	auipc	ra,0xfffff
    80004640:	7f8080e7          	jalr	2040(ra) # 80003e34 <_Z11printStringPKc>
    80004644:	00000613          	li	a2,0
    80004648:	00a00593          	li	a1,10
    8000464c:	00048513          	mv	a0,s1
    80004650:	fffff097          	auipc	ra,0xfffff
    80004654:	4c4080e7          	jalr	1220(ra) # 80003b14 <_ZL8printIntiii>
    80004658:	00004517          	auipc	a0,0x4
    8000465c:	b3050513          	addi	a0,a0,-1232 # 80008188 <CONSOLE_STATUS+0x178>
    80004660:	fffff097          	auipc	ra,0xfffff
    80004664:	7d4080e7          	jalr	2004(ra) # 80003e34 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80004668:	0014849b          	addiw	s1,s1,1
    8000466c:	0ff4f493          	andi	s1,s1,255
    80004670:	00f00793          	li	a5,15
    80004674:	fc97f0e3          	bgeu	a5,s1,80004634 <_Z11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80004678:	00004517          	auipc	a0,0x4
    8000467c:	c6050513          	addi	a0,a0,-928 # 800082d8 <_ZZ14kprintUnsignedmE6digits+0xe8>
    80004680:	fffff097          	auipc	ra,0xfffff
    80004684:	7b4080e7          	jalr	1972(ra) # 80003e34 <_Z11printStringPKc>
    finishedD = true;
    80004688:	00100793          	li	a5,1
    8000468c:	00005717          	auipc	a4,0x5
    80004690:	7ef70ba3          	sb	a5,2039(a4) # 80009e83 <finishedD>
    thread_dispatch();
    80004694:	ffffe097          	auipc	ra,0xffffe
    80004698:	f04080e7          	jalr	-252(ra) # 80002598 <_Z15thread_dispatchv>
}
    8000469c:	01813083          	ld	ra,24(sp)
    800046a0:	01013403          	ld	s0,16(sp)
    800046a4:	00813483          	ld	s1,8(sp)
    800046a8:	00013903          	ld	s2,0(sp)
    800046ac:	02010113          	addi	sp,sp,32
    800046b0:	00008067          	ret

00000000800046b4 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    800046b4:	fc010113          	addi	sp,sp,-64
    800046b8:	02113c23          	sd	ra,56(sp)
    800046bc:	02813823          	sd	s0,48(sp)
    800046c0:	02913423          	sd	s1,40(sp)
    800046c4:	04010413          	addi	s0,sp,64
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    800046c8:	00000613          	li	a2,0
    800046cc:	fffff597          	auipc	a1,0xfffff
    800046d0:	7e458593          	addi	a1,a1,2020 # 80003eb0 <_Z11workerBodyAPv>
    800046d4:	fc040513          	addi	a0,s0,-64
    800046d8:	ffffe097          	auipc	ra,0xffffe
    800046dc:	e0c080e7          	jalr	-500(ra) # 800024e4 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadA created\n");
    800046e0:	00004517          	auipc	a0,0x4
    800046e4:	c0850513          	addi	a0,a0,-1016 # 800082e8 <_ZZ14kprintUnsignedmE6digits+0xf8>
    800046e8:	fffff097          	auipc	ra,0xfffff
    800046ec:	74c080e7          	jalr	1868(ra) # 80003e34 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    800046f0:	00000613          	li	a2,0
    800046f4:	00000597          	auipc	a1,0x0
    800046f8:	88858593          	addi	a1,a1,-1912 # 80003f7c <_Z11workerBodyBPv>
    800046fc:	fc840513          	addi	a0,s0,-56
    80004700:	ffffe097          	auipc	ra,0xffffe
    80004704:	de4080e7          	jalr	-540(ra) # 800024e4 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadB created\n");
    80004708:	00004517          	auipc	a0,0x4
    8000470c:	bf850513          	addi	a0,a0,-1032 # 80008300 <_ZZ14kprintUnsignedmE6digits+0x110>
    80004710:	fffff097          	auipc	ra,0xfffff
    80004714:	724080e7          	jalr	1828(ra) # 80003e34 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80004718:	00000613          	li	a2,0
    8000471c:	00000597          	auipc	a1,0x0
    80004720:	cd058593          	addi	a1,a1,-816 # 800043ec <_Z11workerBodyCPv>
    80004724:	fd040513          	addi	a0,s0,-48
    80004728:	ffffe097          	auipc	ra,0xffffe
    8000472c:	dbc080e7          	jalr	-580(ra) # 800024e4 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadC created\n");
    80004730:	00004517          	auipc	a0,0x4
    80004734:	be850513          	addi	a0,a0,-1048 # 80008318 <_ZZ14kprintUnsignedmE6digits+0x128>
    80004738:	fffff097          	auipc	ra,0xfffff
    8000473c:	6fc080e7          	jalr	1788(ra) # 80003e34 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80004740:	00000613          	li	a2,0
    80004744:	00000597          	auipc	a1,0x0
    80004748:	e2858593          	addi	a1,a1,-472 # 8000456c <_Z11workerBodyDPv>
    8000474c:	fd840513          	addi	a0,s0,-40
    80004750:	ffffe097          	auipc	ra,0xffffe
    80004754:	d94080e7          	jalr	-620(ra) # 800024e4 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadD created\n");
    80004758:	00004517          	auipc	a0,0x4
    8000475c:	bd850513          	addi	a0,a0,-1064 # 80008330 <_ZZ14kprintUnsignedmE6digits+0x140>
    80004760:	fffff097          	auipc	ra,0xfffff
    80004764:	6d4080e7          	jalr	1748(ra) # 80003e34 <_Z11printStringPKc>
    80004768:	00c0006f          	j	80004774 <_Z18Threads_C_API_testv+0xc0>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    8000476c:	ffffe097          	auipc	ra,0xffffe
    80004770:	e2c080e7          	jalr	-468(ra) # 80002598 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80004774:	00005797          	auipc	a5,0x5
    80004778:	7087c783          	lbu	a5,1800(a5) # 80009e7c <finishedA>
    8000477c:	fe0788e3          	beqz	a5,8000476c <_Z18Threads_C_API_testv+0xb8>
    80004780:	00005797          	auipc	a5,0x5
    80004784:	6fd7c783          	lbu	a5,1789(a5) # 80009e7d <finishedB>
    80004788:	fe0782e3          	beqz	a5,8000476c <_Z18Threads_C_API_testv+0xb8>
    8000478c:	00005797          	auipc	a5,0x5
    80004790:	6f67c783          	lbu	a5,1782(a5) # 80009e82 <finishedC>
    80004794:	fc078ce3          	beqz	a5,8000476c <_Z18Threads_C_API_testv+0xb8>
    80004798:	00005797          	auipc	a5,0x5
    8000479c:	6eb7c783          	lbu	a5,1771(a5) # 80009e83 <finishedD>
    800047a0:	fc0786e3          	beqz	a5,8000476c <_Z18Threads_C_API_testv+0xb8>
    }

    for (auto &thread: threads) { delete thread; }
    800047a4:	fc040493          	addi	s1,s0,-64
    800047a8:	0080006f          	j	800047b0 <_Z18Threads_C_API_testv+0xfc>
    800047ac:	00848493          	addi	s1,s1,8
    800047b0:	fe040793          	addi	a5,s0,-32
    800047b4:	00f48c63          	beq	s1,a5,800047cc <_Z18Threads_C_API_testv+0x118>
    800047b8:	0004b503          	ld	a0,0(s1)
    800047bc:	fe0508e3          	beqz	a0,800047ac <_Z18Threads_C_API_testv+0xf8>
    800047c0:	ffffe097          	auipc	ra,0xffffe
    800047c4:	02c080e7          	jalr	44(ra) # 800027ec <_ZdlPv>
    800047c8:	fe5ff06f          	j	800047ac <_Z18Threads_C_API_testv+0xf8>
}
    800047cc:	03813083          	ld	ra,56(sp)
    800047d0:	03013403          	ld	s0,48(sp)
    800047d4:	02813483          	ld	s1,40(sp)
    800047d8:	04010113          	addi	sp,sp,64
    800047dc:	00008067          	ret

00000000800047e0 <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    800047e0:	f7010113          	addi	sp,sp,-144
    800047e4:	08113423          	sd	ra,136(sp)
    800047e8:	08813023          	sd	s0,128(sp)
    800047ec:	06913c23          	sd	s1,120(sp)
    800047f0:	07213823          	sd	s2,112(sp)
    800047f4:	07313423          	sd	s3,104(sp)
    800047f8:	09010413          	addi	s0,sp,144
//    getString(input, 30);
//    n = stringToInt(input);

    n = 20;

    printString("Broj proizvodjaca "); printInt(threadNum);
    800047fc:	00004517          	auipc	a0,0x4
    80004800:	b4c50513          	addi	a0,a0,-1204 # 80008348 <_ZZ14kprintUnsignedmE6digits+0x158>
    80004804:	fffff097          	auipc	ra,0xfffff
    80004808:	630080e7          	jalr	1584(ra) # 80003e34 <_Z11printStringPKc>
    8000480c:	00000613          	li	a2,0
    80004810:	00a00593          	li	a1,10
    80004814:	00a00513          	li	a0,10
    80004818:	fffff097          	auipc	ra,0xfffff
    8000481c:	2fc080e7          	jalr	764(ra) # 80003b14 <_ZL8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80004820:	00004517          	auipc	a0,0x4
    80004824:	b4050513          	addi	a0,a0,-1216 # 80008360 <_ZZ14kprintUnsignedmE6digits+0x170>
    80004828:	fffff097          	auipc	ra,0xfffff
    8000482c:	60c080e7          	jalr	1548(ra) # 80003e34 <_Z11printStringPKc>
    80004830:	00000613          	li	a2,0
    80004834:	00a00593          	li	a1,10
    80004838:	01400513          	li	a0,20
    8000483c:	fffff097          	auipc	ra,0xfffff
    80004840:	2d8080e7          	jalr	728(ra) # 80003b14 <_ZL8printIntiii>
    printString(".\n");
    80004844:	00004517          	auipc	a0,0x4
    80004848:	b3450513          	addi	a0,a0,-1228 # 80008378 <_ZZ14kprintUnsignedmE6digits+0x188>
    8000484c:	fffff097          	auipc	ra,0xfffff
    80004850:	5e8080e7          	jalr	1512(ra) # 80003e34 <_Z11printStringPKc>

    Buffer *buffer = new Buffer(n);
    80004854:	03800513          	li	a0,56
    80004858:	ffffe097          	auipc	ra,0xffffe
    8000485c:	f44080e7          	jalr	-188(ra) # 8000279c <_Znwm>
    80004860:	00050993          	mv	s3,a0
    80004864:	01400593          	li	a1,20
    80004868:	fffff097          	auipc	ra,0xfffff
    8000486c:	05c080e7          	jalr	92(ra) # 800038c4 <_ZN6BufferC1Ei>

    sem_open(&waitForAll, 0);
    80004870:	00000593          	li	a1,0
    80004874:	00005517          	auipc	a0,0x5
    80004878:	61450513          	addi	a0,a0,1556 # 80009e88 <waitForAll>
    8000487c:	ffffe097          	auipc	ra,0xffffe
    80004880:	d4c080e7          	jalr	-692(ra) # 800025c8 <_Z8sem_openPP4_semj>

    thread_t threads[threadNum];
    thread_t consumerThread;

    struct thread_data data[threadNum + 1];
    80004884:	ef010113          	addi	sp,sp,-272
    80004888:	00010913          	mv	s2,sp

    data[threadNum].id = threadNum;
    8000488c:	00a00793          	li	a5,10
    80004890:	0ef92823          	sw	a5,240(s2)
    data[threadNum].buffer = buffer;
    80004894:	0f393c23          	sd	s3,248(s2)
    data[threadNum].wait = waitForAll;
    80004898:	00005797          	auipc	a5,0x5
    8000489c:	5f07b783          	ld	a5,1520(a5) # 80009e88 <waitForAll>
    800048a0:	10f93023          	sd	a5,256(s2)
    thread_create(&consumerThread, consumer, data + threadNum);
    800048a4:	0f090613          	addi	a2,s2,240
    800048a8:	fffff597          	auipc	a1,0xfffff
    800048ac:	4d458593          	addi	a1,a1,1236 # 80003d7c <_Z8consumerPv>
    800048b0:	fc840513          	addi	a0,s0,-56
    800048b4:	ffffe097          	auipc	ra,0xffffe
    800048b8:	c30080e7          	jalr	-976(ra) # 800024e4 <_Z13thread_createPP7_threadPFvPvES2_>

    for (int i = 0; i < threadNum; i++) {
    800048bc:	00000493          	li	s1,0
    800048c0:	00900793          	li	a5,9
    800048c4:	0697c863          	blt	a5,s1,80004934 <_Z22producerConsumer_C_APIv+0x154>
        data[i].id = i;
    800048c8:	00149793          	slli	a5,s1,0x1
    800048cc:	009787b3          	add	a5,a5,s1
    800048d0:	00379793          	slli	a5,a5,0x3
    800048d4:	00f907b3          	add	a5,s2,a5
    800048d8:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    800048dc:	0137b423          	sd	s3,8(a5)
        data[i].wait = waitForAll;
    800048e0:	00005717          	auipc	a4,0x5
    800048e4:	5a873703          	ld	a4,1448(a4) # 80009e88 <waitForAll>
    800048e8:	00e7b823          	sd	a4,16(a5)

        thread_create(threads + i,
    800048ec:	00048713          	mv	a4,s1
    800048f0:	00349513          	slli	a0,s1,0x3
    800048f4:	f7840793          	addi	a5,s0,-136
    800048f8:	00a78533          	add	a0,a5,a0
    800048fc:	02905663          	blez	s1,80004928 <_Z22producerConsumer_C_APIv+0x148>
    80004900:	fffff597          	auipc	a1,0xfffff
    80004904:	3e858593          	addi	a1,a1,1000 # 80003ce8 <_Z8producerPv>
                      i > 0 ? producer : producerKeyboard,
                      data + i);
    80004908:	00171613          	slli	a2,a4,0x1
    8000490c:	00e60633          	add	a2,a2,a4
    80004910:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    80004914:	00c90633          	add	a2,s2,a2
    80004918:	ffffe097          	auipc	ra,0xffffe
    8000491c:	bcc080e7          	jalr	-1076(ra) # 800024e4 <_Z13thread_createPP7_threadPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80004920:	0014849b          	addiw	s1,s1,1
    80004924:	f9dff06f          	j	800048c0 <_Z22producerConsumer_C_APIv+0xe0>
        thread_create(threads + i,
    80004928:	fffff597          	auipc	a1,0xfffff
    8000492c:	30058593          	addi	a1,a1,768 # 80003c28 <_Z16producerKeyboardPv>
    80004930:	fd9ff06f          	j	80004908 <_Z22producerConsumer_C_APIv+0x128>
    }

    thread_dispatch();
    80004934:	ffffe097          	auipc	ra,0xffffe
    80004938:	c64080e7          	jalr	-924(ra) # 80002598 <_Z15thread_dispatchv>

    for (int i = 0; i <= threadNum; i++) {
    8000493c:	00000493          	li	s1,0
    80004940:	0180006f          	j	80004958 <_Z22producerConsumer_C_APIv+0x178>
        sem_wait(waitForAll);
    80004944:	00005517          	auipc	a0,0x5
    80004948:	54453503          	ld	a0,1348(a0) # 80009e88 <waitForAll>
    8000494c:	ffffe097          	auipc	ra,0xffffe
    80004950:	d50080e7          	jalr	-688(ra) # 8000269c <_Z8sem_waitP4_sem>
    for (int i = 0; i <= threadNum; i++) {
    80004954:	0014849b          	addiw	s1,s1,1
    80004958:	00a00793          	li	a5,10
    8000495c:	fe97d4e3          	bge	a5,s1,80004944 <_Z22producerConsumer_C_APIv+0x164>
    }

    sem_close(waitForAll);
    80004960:	00005517          	auipc	a0,0x5
    80004964:	52853503          	ld	a0,1320(a0) # 80009e88 <waitForAll>
    80004968:	ffffe097          	auipc	ra,0xffffe
    8000496c:	cd8080e7          	jalr	-808(ra) # 80002640 <_Z9sem_closeP4_sem>
}
    80004970:	f7040113          	addi	sp,s0,-144
    80004974:	08813083          	ld	ra,136(sp)
    80004978:	08013403          	ld	s0,128(sp)
    8000497c:	07813483          	ld	s1,120(sp)
    80004980:	07013903          	ld	s2,112(sp)
    80004984:	06813983          	ld	s3,104(sp)
    80004988:	09010113          	addi	sp,sp,144
    8000498c:	00008067          	ret
    80004990:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    80004994:	00098513          	mv	a0,s3
    80004998:	ffffe097          	auipc	ra,0xffffe
    8000499c:	e54080e7          	jalr	-428(ra) # 800027ec <_ZdlPv>
    800049a0:	00048513          	mv	a0,s1
    800049a4:	00006097          	auipc	ra,0x6
    800049a8:	5b4080e7          	jalr	1460(ra) # 8000af58 <_Unwind_Resume>

00000000800049ac <_Z12testSleepingv>:

void testSleeping() {
    800049ac:	fc010113          	addi	sp,sp,-64
    800049b0:	02113c23          	sd	ra,56(sp)
    800049b4:	02813823          	sd	s0,48(sp)
    800049b8:	02913423          	sd	s1,40(sp)
    800049bc:	04010413          	addi	s0,sp,64
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    800049c0:	00a00793          	li	a5,10
    800049c4:	fcf43823          	sd	a5,-48(s0)
    800049c8:	01400793          	li	a5,20
    800049cc:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    for (int i = 0; i < sleepy_thread_count; i++) {
    800049d0:	00000493          	li	s1,0
    800049d4:	02c0006f          	j	80004a00 <_Z12testSleepingv+0x54>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    800049d8:	00349793          	slli	a5,s1,0x3
    800049dc:	fd040613          	addi	a2,s0,-48
    800049e0:	00f60633          	add	a2,a2,a5
    800049e4:	fffff597          	auipc	a1,0xfffff
    800049e8:	66c58593          	addi	a1,a1,1644 # 80004050 <_Z9sleepyRunPv>
    800049ec:	fc040513          	addi	a0,s0,-64
    800049f0:	00f50533          	add	a0,a0,a5
    800049f4:	ffffe097          	auipc	ra,0xffffe
    800049f8:	af0080e7          	jalr	-1296(ra) # 800024e4 <_Z13thread_createPP7_threadPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    800049fc:	0014849b          	addiw	s1,s1,1
    80004a00:	00100793          	li	a5,1
    80004a04:	fc97dae3          	bge	a5,s1,800049d8 <_Z12testSleepingv+0x2c>
    }

    while (!(finished[0] && finished[1])) {}
    80004a08:	00005797          	auipc	a5,0x5
    80004a0c:	4787c783          	lbu	a5,1144(a5) # 80009e80 <finished>
    80004a10:	fe078ce3          	beqz	a5,80004a08 <_Z12testSleepingv+0x5c>
    80004a14:	00005797          	auipc	a5,0x5
    80004a18:	46d7c783          	lbu	a5,1133(a5) # 80009e81 <finished+0x1>
    80004a1c:	fe0786e3          	beqz	a5,80004a08 <_Z12testSleepingv+0x5c>
}
    80004a20:	03813083          	ld	ra,56(sp)
    80004a24:	03013403          	ld	s0,48(sp)
    80004a28:	02813483          	ld	s1,40(sp)
    80004a2c:	04010113          	addi	sp,sp,64
    80004a30:	00008067          	ret

0000000080004a34 <_Z3fibm>:
uint64 fib(uint64 n) {
    80004a34:	fe010113          	addi	sp,sp,-32
    80004a38:	00113c23          	sd	ra,24(sp)
    80004a3c:	00813823          	sd	s0,16(sp)
    80004a40:	00913423          	sd	s1,8(sp)
    80004a44:	01213023          	sd	s2,0(sp)
    80004a48:	02010413          	addi	s0,sp,32
    80004a4c:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) return n;
    80004a50:	00100793          	li	a5,1
    80004a54:	02a7f663          	bgeu	a5,a0,80004a80 <_Z3fibm+0x4c>
    if (n % 4 == 0) {
    80004a58:	00357793          	andi	a5,a0,3
    80004a5c:	02078e63          	beqz	a5,80004a98 <_Z3fibm+0x64>
    return fibonacci(n-1) + fibonacci(n-2);
    80004a60:	fff48513          	addi	a0,s1,-1
    80004a64:	00000097          	auipc	ra,0x0
    80004a68:	914080e7          	jalr	-1772(ra) # 80004378 <_Z9fibonaccim>
    80004a6c:	00050913          	mv	s2,a0
    80004a70:	ffe48513          	addi	a0,s1,-2
    80004a74:	00000097          	auipc	ra,0x0
    80004a78:	904080e7          	jalr	-1788(ra) # 80004378 <_Z9fibonaccim>
    80004a7c:	00a90533          	add	a0,s2,a0
}
    80004a80:	01813083          	ld	ra,24(sp)
    80004a84:	01013403          	ld	s0,16(sp)
    80004a88:	00813483          	ld	s1,8(sp)
    80004a8c:	00013903          	ld	s2,0(sp)
    80004a90:	02010113          	addi	sp,sp,32
    80004a94:	00008067          	ret
        thread_dispatch();
    80004a98:	ffffe097          	auipc	ra,0xffffe
    80004a9c:	b00080e7          	jalr	-1280(ra) # 80002598 <_Z15thread_dispatchv>
    80004aa0:	fc1ff06f          	j	80004a60 <_Z3fibm+0x2c>

0000000080004aa4 <_Z11workerBodyGPv>:

void workerBodyG(void *) {
    80004aa4:	fe010113          	addi	sp,sp,-32
    80004aa8:	00113c23          	sd	ra,24(sp)
    80004aac:	00813823          	sd	s0,16(sp)
    80004ab0:	00913423          	sd	s1,8(sp)
    80004ab4:	01213023          	sd	s2,0(sp)
    80004ab8:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80004abc:	00000493          	li	s1,0
    80004ac0:	0400006f          	j	80004b00 <_Z11workerBodyGPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i=");
    80004ac4:	00003517          	auipc	a0,0x3
    80004ac8:	7ac50513          	addi	a0,a0,1964 # 80008270 <_ZZ14kprintUnsignedmE6digits+0x80>
    80004acc:	fffff097          	auipc	ra,0xfffff
    80004ad0:	368080e7          	jalr	872(ra) # 80003e34 <_Z11printStringPKc>
        printInt(i);
    80004ad4:	00000613          	li	a2,0
    80004ad8:	00a00593          	li	a1,10
    80004adc:	00048513          	mv	a0,s1
    80004ae0:	fffff097          	auipc	ra,0xfffff
    80004ae4:	034080e7          	jalr	52(ra) # 80003b14 <_ZL8printIntiii>
        printString("\n");
    80004ae8:	00003517          	auipc	a0,0x3
    80004aec:	6a050513          	addi	a0,a0,1696 # 80008188 <CONSOLE_STATUS+0x178>
    80004af0:	fffff097          	auipc	ra,0xfffff
    80004af4:	344080e7          	jalr	836(ra) # 80003e34 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80004af8:	0014849b          	addiw	s1,s1,1
    80004afc:	0ff4f493          	andi	s1,s1,255
    80004b00:	00200793          	li	a5,2
    80004b04:	fc97f0e3          	bgeu	a5,s1,80004ac4 <_Z11workerBodyGPv+0x20>
    }

    printString("C: yield\n");
    80004b08:	00004517          	auipc	a0,0x4
    80004b0c:	87850513          	addi	a0,a0,-1928 # 80008380 <_ZZ14kprintUnsignedmE6digits+0x190>
    80004b10:	fffff097          	auipc	ra,0xfffff
    80004b14:	324080e7          	jalr	804(ra) # 80003e34 <_Z11printStringPKc>
    __asm__("li t1, 7");
    80004b18:	00700313          	li	t1,7
    thread_dispatch();
    80004b1c:	ffffe097          	auipc	ra,0xffffe
    80004b20:	a7c080e7          	jalr	-1412(ra) # 80002598 <_Z15thread_dispatchv>

    uint64  t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80004b24:	00030913          	mv	s2,t1

    printString("C: t1=");
    80004b28:	00003517          	auipc	a0,0x3
    80004b2c:	76050513          	addi	a0,a0,1888 # 80008288 <_ZZ14kprintUnsignedmE6digits+0x98>
    80004b30:	fffff097          	auipc	ra,0xfffff
    80004b34:	304080e7          	jalr	772(ra) # 80003e34 <_Z11printStringPKc>
    printInt(t1);
    80004b38:	00000613          	li	a2,0
    80004b3c:	00a00593          	li	a1,10
    80004b40:	0009051b          	sext.w	a0,s2
    80004b44:	fffff097          	auipc	ra,0xfffff
    80004b48:	fd0080e7          	jalr	-48(ra) # 80003b14 <_ZL8printIntiii>
    printString("\n");
    80004b4c:	00003517          	auipc	a0,0x3
    80004b50:	63c50513          	addi	a0,a0,1596 # 80008188 <CONSOLE_STATUS+0x178>
    80004b54:	fffff097          	auipc	ra,0xfffff
    80004b58:	2e0080e7          	jalr	736(ra) # 80003e34 <_Z11printStringPKc>

    uint64 result = fib(30);
    80004b5c:	01e00513          	li	a0,30
    80004b60:	00000097          	auipc	ra,0x0
    80004b64:	ed4080e7          	jalr	-300(ra) # 80004a34 <_Z3fibm>
    80004b68:	00050913          	mv	s2,a0
    printString("C: fibonacci=");
    80004b6c:	00004517          	auipc	a0,0x4
    80004b70:	82450513          	addi	a0,a0,-2012 # 80008390 <_ZZ14kprintUnsignedmE6digits+0x1a0>
    80004b74:	fffff097          	auipc	ra,0xfffff
    80004b78:	2c0080e7          	jalr	704(ra) # 80003e34 <_Z11printStringPKc>
    printInt(result);
    80004b7c:	00000613          	li	a2,0
    80004b80:	00a00593          	li	a1,10
    80004b84:	0009051b          	sext.w	a0,s2
    80004b88:	fffff097          	auipc	ra,0xfffff
    80004b8c:	f8c080e7          	jalr	-116(ra) # 80003b14 <_ZL8printIntiii>
    printString("\n");
    80004b90:	00003517          	auipc	a0,0x3
    80004b94:	5f850513          	addi	a0,a0,1528 # 80008188 <CONSOLE_STATUS+0x178>
    80004b98:	fffff097          	auipc	ra,0xfffff
    80004b9c:	29c080e7          	jalr	668(ra) # 80003e34 <_Z11printStringPKc>
    80004ba0:	0400006f          	j	80004be0 <_Z11workerBodyGPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i=");
    80004ba4:	00003517          	auipc	a0,0x3
    80004ba8:	6cc50513          	addi	a0,a0,1740 # 80008270 <_ZZ14kprintUnsignedmE6digits+0x80>
    80004bac:	fffff097          	auipc	ra,0xfffff
    80004bb0:	288080e7          	jalr	648(ra) # 80003e34 <_Z11printStringPKc>
        printInt(i);
    80004bb4:	00000613          	li	a2,0
    80004bb8:	00a00593          	li	a1,10
    80004bbc:	00048513          	mv	a0,s1
    80004bc0:	fffff097          	auipc	ra,0xfffff
    80004bc4:	f54080e7          	jalr	-172(ra) # 80003b14 <_ZL8printIntiii>
        printString("\n");
    80004bc8:	00003517          	auipc	a0,0x3
    80004bcc:	5c050513          	addi	a0,a0,1472 # 80008188 <CONSOLE_STATUS+0x178>
    80004bd0:	fffff097          	auipc	ra,0xfffff
    80004bd4:	264080e7          	jalr	612(ra) # 80003e34 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80004bd8:	0014849b          	addiw	s1,s1,1
    80004bdc:	0ff4f493          	andi	s1,s1,255
    80004be0:	00500793          	li	a5,5
    80004be4:	fc97f0e3          	bgeu	a5,s1,80004ba4 <_Z11workerBodyGPv+0x100>
    }
    // TCB::yield()
    printString("Worker C finished\n");
    80004be8:	00003517          	auipc	a0,0x3
    80004bec:	7b850513          	addi	a0,a0,1976 # 800083a0 <_ZZ14kprintUnsignedmE6digits+0x1b0>
    80004bf0:	fffff097          	auipc	ra,0xfffff
    80004bf4:	244080e7          	jalr	580(ra) # 80003e34 <_Z11printStringPKc>
}
    80004bf8:	01813083          	ld	ra,24(sp)
    80004bfc:	01013403          	ld	s0,16(sp)
    80004c00:	00813483          	ld	s1,8(sp)
    80004c04:	00013903          	ld	s2,0(sp)
    80004c08:	02010113          	addi	sp,sp,32
    80004c0c:	00008067          	ret

0000000080004c10 <_Z11workerBodyHPv>:

void workerBodyH(void *) {
    80004c10:	fe010113          	addi	sp,sp,-32
    80004c14:	00113c23          	sd	ra,24(sp)
    80004c18:	00813823          	sd	s0,16(sp)
    80004c1c:	00913423          	sd	s1,8(sp)
    80004c20:	01213023          	sd	s2,0(sp)
    80004c24:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80004c28:	00a00493          	li	s1,10
    80004c2c:	0400006f          	j	80004c6c <_Z11workerBodyHPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i=");
    80004c30:	00003517          	auipc	a0,0x3
    80004c34:	68050513          	addi	a0,a0,1664 # 800082b0 <_ZZ14kprintUnsignedmE6digits+0xc0>
    80004c38:	fffff097          	auipc	ra,0xfffff
    80004c3c:	1fc080e7          	jalr	508(ra) # 80003e34 <_Z11printStringPKc>
        printInt(i);
    80004c40:	00000613          	li	a2,0
    80004c44:	00a00593          	li	a1,10
    80004c48:	00048513          	mv	a0,s1
    80004c4c:	fffff097          	auipc	ra,0xfffff
    80004c50:	ec8080e7          	jalr	-312(ra) # 80003b14 <_ZL8printIntiii>
        printString("\n");
    80004c54:	00003517          	auipc	a0,0x3
    80004c58:	53450513          	addi	a0,a0,1332 # 80008188 <CONSOLE_STATUS+0x178>
    80004c5c:	fffff097          	auipc	ra,0xfffff
    80004c60:	1d8080e7          	jalr	472(ra) # 80003e34 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80004c64:	0014849b          	addiw	s1,s1,1
    80004c68:	0ff4f493          	andi	s1,s1,255
    80004c6c:	00c00793          	li	a5,12
    80004c70:	fc97f0e3          	bgeu	a5,s1,80004c30 <_Z11workerBodyHPv+0x20>
    }

    printString("D: yield\n");
    80004c74:	00003517          	auipc	a0,0x3
    80004c78:	74450513          	addi	a0,a0,1860 # 800083b8 <_ZZ14kprintUnsignedmE6digits+0x1c8>
    80004c7c:	fffff097          	auipc	ra,0xfffff
    80004c80:	1b8080e7          	jalr	440(ra) # 80003e34 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80004c84:	00500313          	li	t1,5
    thread_dispatch();
    80004c88:	ffffe097          	auipc	ra,0xffffe
    80004c8c:	910080e7          	jalr	-1776(ra) # 80002598 <_Z15thread_dispatchv>

    uint64 result = fib(23);
    80004c90:	01700513          	li	a0,23
    80004c94:	00000097          	auipc	ra,0x0
    80004c98:	da0080e7          	jalr	-608(ra) # 80004a34 <_Z3fibm>
    80004c9c:	00050913          	mv	s2,a0
    printString("D: fibonacci=");
    80004ca0:	00003517          	auipc	a0,0x3
    80004ca4:	72850513          	addi	a0,a0,1832 # 800083c8 <_ZZ14kprintUnsignedmE6digits+0x1d8>
    80004ca8:	fffff097          	auipc	ra,0xfffff
    80004cac:	18c080e7          	jalr	396(ra) # 80003e34 <_Z11printStringPKc>
    printInt(result);
    80004cb0:	00000613          	li	a2,0
    80004cb4:	00a00593          	li	a1,10
    80004cb8:	0009051b          	sext.w	a0,s2
    80004cbc:	fffff097          	auipc	ra,0xfffff
    80004cc0:	e58080e7          	jalr	-424(ra) # 80003b14 <_ZL8printIntiii>
    printString("\n");
    80004cc4:	00003517          	auipc	a0,0x3
    80004cc8:	4c450513          	addi	a0,a0,1220 # 80008188 <CONSOLE_STATUS+0x178>
    80004ccc:	fffff097          	auipc	ra,0xfffff
    80004cd0:	168080e7          	jalr	360(ra) # 80003e34 <_Z11printStringPKc>
    80004cd4:	0400006f          	j	80004d14 <_Z11workerBodyHPv+0x104>

    for (; i < 16; i++) {
        printString("D: i=");
    80004cd8:	00003517          	auipc	a0,0x3
    80004cdc:	5d850513          	addi	a0,a0,1496 # 800082b0 <_ZZ14kprintUnsignedmE6digits+0xc0>
    80004ce0:	fffff097          	auipc	ra,0xfffff
    80004ce4:	154080e7          	jalr	340(ra) # 80003e34 <_Z11printStringPKc>
        printInt(i);
    80004ce8:	00000613          	li	a2,0
    80004cec:	00a00593          	li	a1,10
    80004cf0:	00048513          	mv	a0,s1
    80004cf4:	fffff097          	auipc	ra,0xfffff
    80004cf8:	e20080e7          	jalr	-480(ra) # 80003b14 <_ZL8printIntiii>
        printString("\n");
    80004cfc:	00003517          	auipc	a0,0x3
    80004d00:	48c50513          	addi	a0,a0,1164 # 80008188 <CONSOLE_STATUS+0x178>
    80004d04:	fffff097          	auipc	ra,0xfffff
    80004d08:	130080e7          	jalr	304(ra) # 80003e34 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80004d0c:	0014849b          	addiw	s1,s1,1
    80004d10:	0ff4f493          	andi	s1,s1,255
    80004d14:	00f00793          	li	a5,15
    80004d18:	fc97f0e3          	bgeu	a5,s1,80004cd8 <_Z11workerBodyHPv+0xc8>
    }
    // TCB::yield()
    printString("Worker D finished\n");
    80004d1c:	00003517          	auipc	a0,0x3
    80004d20:	6bc50513          	addi	a0,a0,1724 # 800083d8 <_ZZ14kprintUnsignedmE6digits+0x1e8>
    80004d24:	fffff097          	auipc	ra,0xfffff
    80004d28:	110080e7          	jalr	272(ra) # 80003e34 <_Z11printStringPKc>
}
    80004d2c:	01813083          	ld	ra,24(sp)
    80004d30:	01013403          	ld	s0,16(sp)
    80004d34:	00813483          	ld	s1,8(sp)
    80004d38:	00013903          	ld	s2,0(sp)
    80004d3c:	02010113          	addi	sp,sp,32
    80004d40:	00008067          	ret

0000000080004d44 <_Z10myUserMainv>:

void myUserMain() {
    printString("In user main\n");

    void *mem = mem_alloc(25000);
    printInt((uint64) mem);
    80004d44:	fa010113          	addi	sp,sp,-96
    80004d48:	04113c23          	sd	ra,88(sp)
    80004d4c:	04813823          	sd	s0,80(sp)
    80004d50:	04913423          	sd	s1,72(sp)
    80004d54:	05213023          	sd	s2,64(sp)
    80004d58:	06010413          	addi	s0,sp,96
    printString("\n");
    80004d5c:	00003517          	auipc	a0,0x3
    80004d60:	69450513          	addi	a0,a0,1684 # 800083f0 <_ZZ14kprintUnsignedmE6digits+0x200>
    80004d64:	fffff097          	auipc	ra,0xfffff
    80004d68:	0d0080e7          	jalr	208(ra) # 80003e34 <_Z11printStringPKc>

    ProducerConsumer *obj = new ProducerConsumer();
    80004d6c:	00006537          	lui	a0,0x6
    80004d70:	1a850513          	addi	a0,a0,424 # 61a8 <_entry-0x7fff9e58>
    80004d74:	ffffd097          	auipc	ra,0xffffd
    80004d78:	708080e7          	jalr	1800(ra) # 8000247c <_Z9mem_allocm>
    80004d7c:	00050913          	mv	s2,a0

    80004d80:	00000613          	li	a2,0
    80004d84:	00a00593          	li	a1,10
    80004d88:	0005051b          	sext.w	a0,a0
    80004d8c:	fffff097          	auipc	ra,0xfffff
    80004d90:	d88080e7          	jalr	-632(ra) # 80003b14 <_ZL8printIntiii>
    thread_t t1;
    80004d94:	00003517          	auipc	a0,0x3
    80004d98:	3f450513          	addi	a0,a0,1012 # 80008188 <CONSOLE_STATUS+0x178>
    80004d9c:	fffff097          	auipc	ra,0xfffff
    80004da0:	098080e7          	jalr	152(ra) # 80003e34 <_Z11printStringPKc>
    thread_t t2;
    thread_t t3;
    80004da4:	01800513          	li	a0,24
    80004da8:	ffffe097          	auipc	ra,0xffffe
    80004dac:	9f4080e7          	jalr	-1548(ra) # 8000279c <_Znwm>
    80004db0:	00050493          	mv	s1,a0
#include "../h/syscall_c.h"
#include "printing.hpp"

class ProducerConsumer {
public:
    ProducerConsumer() {
    80004db4:	00052823          	sw	zero,16(a0)
        sem_open(&semConsumer, 0);
    80004db8:	00000593          	li	a1,0
    80004dbc:	00850513          	addi	a0,a0,8
    80004dc0:	ffffe097          	auipc	ra,0xffffe
    80004dc4:	808080e7          	jalr	-2040(ra) # 800025c8 <_Z8sem_openPP4_semj>
        sem_open(&semProducer, 1);
    80004dc8:	00100593          	li	a1,1
    80004dcc:	00048513          	mv	a0,s1
    80004dd0:	ffffd097          	auipc	ra,0xffffd
    80004dd4:	7f8080e7          	jalr	2040(ra) # 800025c8 <_Z8sem_openPP4_semj>

    thread_create(&t1, &workerBodyE, nullptr);
    thread_create(&t2, &workerBodyF, nullptr);
    thread_create(&t3, &workerBodyG, nullptr);
    thread_create(&t4, &workerBodyH, nullptr);
    thread_create(&t5, &ProducerConsumer::produceWrapper, obj);
    80004dd8:	00000613          	li	a2,0
    80004ddc:	fffff597          	auipc	a1,0xfffff
    80004de0:	31858593          	addi	a1,a1,792 # 800040f4 <_Z11workerBodyEPv>
    80004de4:	fd840513          	addi	a0,s0,-40
    80004de8:	ffffd097          	auipc	ra,0xffffd
    80004dec:	6fc080e7          	jalr	1788(ra) # 800024e4 <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t6, &ProducerConsumer::consumeWrapper, obj);
    80004df0:	00000613          	li	a2,0
    80004df4:	fffff597          	auipc	a1,0xfffff
    80004df8:	3b058593          	addi	a1,a1,944 # 800041a4 <_Z11workerBodyFPv>
    80004dfc:	fd040513          	addi	a0,s0,-48
    80004e00:	ffffd097          	auipc	ra,0xffffd
    80004e04:	6e4080e7          	jalr	1764(ra) # 800024e4 <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t7, &ProducerConsumer::consumeWrapper, obj);
    80004e08:	00000613          	li	a2,0
    80004e0c:	00000597          	auipc	a1,0x0
    80004e10:	c9858593          	addi	a1,a1,-872 # 80004aa4 <_Z11workerBodyGPv>
    80004e14:	fc840513          	addi	a0,s0,-56
    80004e18:	ffffd097          	auipc	ra,0xffffd
    80004e1c:	6cc080e7          	jalr	1740(ra) # 800024e4 <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t8, &ProducerConsumer::consumeWrapper, obj);
    80004e20:	00000613          	li	a2,0
    80004e24:	00000597          	auipc	a1,0x0
    80004e28:	dec58593          	addi	a1,a1,-532 # 80004c10 <_Z11workerBodyHPv>
    80004e2c:	fc040513          	addi	a0,s0,-64
    80004e30:	ffffd097          	auipc	ra,0xffffd
    80004e34:	6b4080e7          	jalr	1716(ra) # 800024e4 <_Z13thread_createPP7_threadPFvPvES2_>

    80004e38:	00048613          	mv	a2,s1
    80004e3c:	00000597          	auipc	a1,0x0
    80004e40:	1ac58593          	addi	a1,a1,428 # 80004fe8 <_ZN16ProducerConsumer14produceWrapperEPv>
    80004e44:	fb840513          	addi	a0,s0,-72
    80004e48:	ffffd097          	auipc	ra,0xffffd
    80004e4c:	69c080e7          	jalr	1692(ra) # 800024e4 <_Z13thread_createPP7_threadPFvPvES2_>
    time_sleep(50);
    80004e50:	00048613          	mv	a2,s1
    80004e54:	00000597          	auipc	a1,0x0
    80004e58:	27858593          	addi	a1,a1,632 # 800050cc <_ZN16ProducerConsumer14consumeWrapperEPv>
    80004e5c:	fb040513          	addi	a0,s0,-80
    80004e60:	ffffd097          	auipc	ra,0xffffd
    80004e64:	684080e7          	jalr	1668(ra) # 800024e4 <_Z13thread_createPP7_threadPFvPvES2_>

    80004e68:	00048613          	mv	a2,s1
    80004e6c:	00000597          	auipc	a1,0x0
    80004e70:	26058593          	addi	a1,a1,608 # 800050cc <_ZN16ProducerConsumer14consumeWrapperEPv>
    80004e74:	fa840513          	addi	a0,s0,-88
    80004e78:	ffffd097          	auipc	ra,0xffffd
    80004e7c:	66c080e7          	jalr	1644(ra) # 800024e4 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("Nit t2: ");
    80004e80:	00048613          	mv	a2,s1
    80004e84:	00000597          	auipc	a1,0x0
    80004e88:	24858593          	addi	a1,a1,584 # 800050cc <_ZN16ProducerConsumer14consumeWrapperEPv>
    80004e8c:	fa040513          	addi	a0,s0,-96
    80004e90:	ffffd097          	auipc	ra,0xffffd
    80004e94:	654080e7          	jalr	1620(ra) # 800024e4 <_Z13thread_createPP7_threadPFvPvES2_>
    printInt((uint64) t2);
    printString("\n");
    80004e98:	03200513          	li	a0,50
    80004e9c:	ffffe097          	auipc	ra,0xffffe
    80004ea0:	868080e7          	jalr	-1944(ra) # 80002704 <_Z10time_sleepm>

    time_sleep(150);
    80004ea4:	00003517          	auipc	a0,0x3
    80004ea8:	55c50513          	addi	a0,a0,1372 # 80008400 <_ZZ14kprintUnsignedmE6digits+0x210>
    80004eac:	fffff097          	auipc	ra,0xfffff
    80004eb0:	f88080e7          	jalr	-120(ra) # 80003e34 <_Z11printStringPKc>

    80004eb4:	00000613          	li	a2,0
    80004eb8:	00a00593          	li	a1,10
    80004ebc:	fd042503          	lw	a0,-48(s0)
    80004ec0:	fffff097          	auipc	ra,0xfffff
    80004ec4:	c54080e7          	jalr	-940(ra) # 80003b14 <_ZL8printIntiii>
    printString("Mem free called with ret value ");
    80004ec8:	00003517          	auipc	a0,0x3
    80004ecc:	2c050513          	addi	a0,a0,704 # 80008188 <CONSOLE_STATUS+0x178>
    80004ed0:	fffff097          	auipc	ra,0xfffff
    80004ed4:	f64080e7          	jalr	-156(ra) # 80003e34 <_Z11printStringPKc>
    printInt(mem_free(mem));
    printString("\n");
    80004ed8:	09600513          	li	a0,150
    80004edc:	ffffe097          	auipc	ra,0xffffe
    80004ee0:	828080e7          	jalr	-2008(ra) # 80002704 <_Z10time_sleepm>

    printString("Mem free called again with ret value ");
    80004ee4:	00003517          	auipc	a0,0x3
    80004ee8:	52c50513          	addi	a0,a0,1324 # 80008410 <_ZZ14kprintUnsignedmE6digits+0x220>
    80004eec:	fffff097          	auipc	ra,0xfffff
    80004ef0:	f48080e7          	jalr	-184(ra) # 80003e34 <_Z11printStringPKc>
    printInt(mem_free(mem), 10, 1);
    80004ef4:	00090513          	mv	a0,s2
    80004ef8:	ffffd097          	auipc	ra,0xffffd
    80004efc:	5b8080e7          	jalr	1464(ra) # 800024b0 <_Z8mem_freePv>
    80004f00:	00000613          	li	a2,0
    80004f04:	00a00593          	li	a1,10
    80004f08:	fffff097          	auipc	ra,0xfffff
    80004f0c:	c0c080e7          	jalr	-1012(ra) # 80003b14 <_ZL8printIntiii>
    printString("\n");
    80004f10:	00003517          	auipc	a0,0x3
    80004f14:	27850513          	addi	a0,a0,632 # 80008188 <CONSOLE_STATUS+0x178>
    80004f18:	fffff097          	auipc	ra,0xfffff
    80004f1c:	f1c080e7          	jalr	-228(ra) # 80003e34 <_Z11printStringPKc>

    delete obj;
    80004f20:	00003517          	auipc	a0,0x3
    80004f24:	51050513          	addi	a0,a0,1296 # 80008430 <_ZZ14kprintUnsignedmE6digits+0x240>
    80004f28:	fffff097          	auipc	ra,0xfffff
    80004f2c:	f0c080e7          	jalr	-244(ra) # 80003e34 <_Z11printStringPKc>

    80004f30:	00090513          	mv	a0,s2
    80004f34:	ffffd097          	auipc	ra,0xffffd
    80004f38:	57c080e7          	jalr	1404(ra) # 800024b0 <_Z8mem_freePv>
    80004f3c:	00100613          	li	a2,1
    80004f40:	00a00593          	li	a1,10
    80004f44:	fffff097          	auipc	ra,0xfffff
    80004f48:	bd0080e7          	jalr	-1072(ra) # 80003b14 <_ZL8printIntiii>
    printString("User main finished\n");
    80004f4c:	00003517          	auipc	a0,0x3
    80004f50:	23c50513          	addi	a0,a0,572 # 80008188 <CONSOLE_STATUS+0x178>
    80004f54:	fffff097          	auipc	ra,0xfffff
    80004f58:	ee0080e7          	jalr	-288(ra) # 80003e34 <_Z11printStringPKc>
}

    80004f5c:	00048863          	beqz	s1,80004f6c <_Z10myUserMainv+0x228>
    80004f60:	00048513          	mv	a0,s1
    80004f64:	ffffe097          	auipc	ra,0xffffe
    80004f68:	888080e7          	jalr	-1912(ra) # 800027ec <_ZdlPv>
    80004f6c:	00003517          	auipc	a0,0x3
    80004f70:	4ec50513          	addi	a0,a0,1260 # 80008458 <_ZZ14kprintUnsignedmE6digits+0x268>
    80004f74:	fffff097          	auipc	ra,0xfffff
    80004f78:	ec0080e7          	jalr	-320(ra) # 80003e34 <_Z11printStringPKc>
    80004f7c:	05813083          	ld	ra,88(sp)
    80004f80:	05013403          	ld	s0,80(sp)
    80004f84:	04813483          	ld	s1,72(sp)
    80004f88:	04013903          	ld	s2,64(sp)
    80004f8c:	06010113          	addi	sp,sp,96
    80004f90:	00008067          	ret
    80004f94:	00050913          	mv	s2,a0
    thread_t t3;
    80004f98:	00048513          	mv	a0,s1
    80004f9c:	ffffe097          	auipc	ra,0xffffe
    80004fa0:	850080e7          	jalr	-1968(ra) # 800027ec <_ZdlPv>
    80004fa4:	00090513          	mv	a0,s2
    80004fa8:	00006097          	auipc	ra,0x6
    80004fac:	fb0080e7          	jalr	-80(ra) # 8000af58 <_Unwind_Resume>

0000000080004fb0 <_Z8userMainv>:
#include "../test/ThreadSleep_C_API_test.hpp" // thread_sleep test C API
//#include "../test/ConsumerProducer_CPP_API_test.hpp" // zadatak 4. CPP API i asinhrona promena konteksta

#include "../test/myUserMain.h" // additional C API tests

void userMain() {
    80004fb0:	ff010113          	addi	sp,sp,-16
    80004fb4:	00113423          	sd	ra,8(sp)
    80004fb8:	00813023          	sd	s0,0(sp)
    80004fbc:	01010413          	addi	s0,sp,16
    Threads_C_API_test(); // zadatak 2., niti C API i sinhrona promena konteksta
    80004fc0:	fffff097          	auipc	ra,0xfffff
    80004fc4:	6f4080e7          	jalr	1780(ra) # 800046b4 <_Z18Threads_C_API_testv>
    //Threads_CPP_API_test(); // zadatak 2., niti CPP API i sinhrona promena konteksta

//    producerConsumer_C_API(); // zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta
    //producerConsumer_CPP_Sync_API(); // zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta

    testSleeping(); // thread_sleep test C API
    80004fc8:	00000097          	auipc	ra,0x0
    80004fcc:	9e4080e7          	jalr	-1564(ra) # 800049ac <_Z12testSleepingv>
    //ConsumerProducerCPP::testConsumerProducer(); // zadatak 4. CPP API i asinhrona promena konteksta, kompletan test svega

    myUserMain(); // additional C API tests - Extreme - Testing every functionality
    80004fd0:	00000097          	auipc	ra,0x0
    80004fd4:	d74080e7          	jalr	-652(ra) # 80004d44 <_Z10myUserMainv>

    80004fd8:	00813083          	ld	ra,8(sp)
    80004fdc:	00013403          	ld	s0,0(sp)
    80004fe0:	01010113          	addi	sp,sp,16
    80004fe4:	00008067          	ret

0000000080004fe8 <_ZN16ProducerConsumer14produceWrapperEPv>:
        }

        printString("Consumer finished\n");
    }

    static void produceWrapper(void *obj) {
    80004fe8:	fe010113          	addi	sp,sp,-32
    80004fec:	00113c23          	sd	ra,24(sp)
    80004ff0:	00813823          	sd	s0,16(sp)
    80004ff4:	00913423          	sd	s1,8(sp)
    80004ff8:	01213023          	sd	s2,0(sp)
    80004ffc:	02010413          	addi	s0,sp,32
    80005000:	00050493          	mv	s1,a0
        for (int i = 1; i <= 150; i++) {
    80005004:	00100913          	li	s2,1
    80005008:	09600793          	li	a5,150
    8000500c:	0327c863          	blt	a5,s2,8000503c <_ZN16ProducerConsumer14produceWrapperEPv+0x54>
            sem_wait(semProducer);
    80005010:	0004b503          	ld	a0,0(s1)
    80005014:	ffffd097          	auipc	ra,0xffffd
    80005018:	688080e7          	jalr	1672(ra) # 8000269c <_Z8sem_waitP4_sem>
            value++;
    8000501c:	0104a783          	lw	a5,16(s1)
    80005020:	0017879b          	addiw	a5,a5,1
    80005024:	00f4a823          	sw	a5,16(s1)
            sem_signal(semConsumer);
    80005028:	0084b503          	ld	a0,8(s1)
    8000502c:	ffffd097          	auipc	ra,0xffffd
    80005030:	6a4080e7          	jalr	1700(ra) # 800026d0 <_Z10sem_signalP4_sem>
        for (int i = 1; i <= 150; i++) {
    80005034:	0019091b          	addiw	s2,s2,1
    80005038:	fd1ff06f          	j	80005008 <_ZN16ProducerConsumer14produceWrapperEPv+0x20>
        int a = sem_close(semProducer);
    8000503c:	0004b503          	ld	a0,0(s1)
    80005040:	ffffd097          	auipc	ra,0xffffd
    80005044:	600080e7          	jalr	1536(ra) # 80002640 <_Z9sem_closeP4_sem>
    80005048:	00050913          	mv	s2,a0
        int b = sem_close(semConsumer);
    8000504c:	0084b503          	ld	a0,8(s1)
    80005050:	ffffd097          	auipc	ra,0xffffd
    80005054:	5f0080e7          	jalr	1520(ra) # 80002640 <_Z9sem_closeP4_sem>
    80005058:	00050493          	mv	s1,a0
        printString("Producer finished with exit values: ");
    8000505c:	00003517          	auipc	a0,0x3
    80005060:	41450513          	addi	a0,a0,1044 # 80008470 <_ZZ14kprintUnsignedmE6digits+0x280>
    80005064:	fffff097          	auipc	ra,0xfffff
    80005068:	dd0080e7          	jalr	-560(ra) # 80003e34 <_Z11printStringPKc>
        printInt(a);
    8000506c:	00000613          	li	a2,0
    80005070:	00a00593          	li	a1,10
    80005074:	00090513          	mv	a0,s2
    80005078:	fffff097          	auipc	ra,0xfffff
    8000507c:	a9c080e7          	jalr	-1380(ra) # 80003b14 <_ZL8printIntiii>
        printString(" and ");
    80005080:	00003517          	auipc	a0,0x3
    80005084:	41850513          	addi	a0,a0,1048 # 80008498 <_ZZ14kprintUnsignedmE6digits+0x2a8>
    80005088:	fffff097          	auipc	ra,0xfffff
    8000508c:	dac080e7          	jalr	-596(ra) # 80003e34 <_Z11printStringPKc>
        printInt(b);
    80005090:	00000613          	li	a2,0
    80005094:	00a00593          	li	a1,10
    80005098:	00048513          	mv	a0,s1
    8000509c:	fffff097          	auipc	ra,0xfffff
    800050a0:	a78080e7          	jalr	-1416(ra) # 80003b14 <_ZL8printIntiii>
        printString("\n");
    800050a4:	00003517          	auipc	a0,0x3
    800050a8:	0e450513          	addi	a0,a0,228 # 80008188 <CONSOLE_STATUS+0x178>
    800050ac:	fffff097          	auipc	ra,0xfffff
    800050b0:	d88080e7          	jalr	-632(ra) # 80003e34 <_Z11printStringPKc>
        ProducerConsumer *pc = (ProducerConsumer *) obj;
        pc->produce();
    }
    800050b4:	01813083          	ld	ra,24(sp)
    800050b8:	01013403          	ld	s0,16(sp)
    800050bc:	00813483          	ld	s1,8(sp)
    800050c0:	00013903          	ld	s2,0(sp)
    800050c4:	02010113          	addi	sp,sp,32
    800050c8:	00008067          	ret

00000000800050cc <_ZN16ProducerConsumer14consumeWrapperEPv>:

    static void consumeWrapper(void *obj) {
    800050cc:	fe010113          	addi	sp,sp,-32
    800050d0:	00113c23          	sd	ra,24(sp)
    800050d4:	00813823          	sd	s0,16(sp)
    800050d8:	00913423          	sd	s1,8(sp)
    800050dc:	01213023          	sd	s2,0(sp)
    800050e0:	02010413          	addi	s0,sp,32
    800050e4:	00050493          	mv	s1,a0
        for (int i = 1; i <= 50; i++) {
    800050e8:	00100913          	li	s2,1
    800050ec:	03200793          	li	a5,50
    800050f0:	0727c863          	blt	a5,s2,80005160 <_ZN16ProducerConsumer14consumeWrapperEPv+0x94>
            sem_wait(semConsumer);
    800050f4:	0084b503          	ld	a0,8(s1)
    800050f8:	ffffd097          	auipc	ra,0xffffd
    800050fc:	5a4080e7          	jalr	1444(ra) # 8000269c <_Z8sem_waitP4_sem>
            printInt(value);
    80005100:	00000613          	li	a2,0
    80005104:	00a00593          	li	a1,10
    80005108:	0104a503          	lw	a0,16(s1)
    8000510c:	fffff097          	auipc	ra,0xfffff
    80005110:	a08080e7          	jalr	-1528(ra) # 80003b14 <_ZL8printIntiii>
            printString(" squared is: ");
    80005114:	00003517          	auipc	a0,0x3
    80005118:	38c50513          	addi	a0,a0,908 # 800084a0 <_ZZ14kprintUnsignedmE6digits+0x2b0>
    8000511c:	fffff097          	auipc	ra,0xfffff
    80005120:	d18080e7          	jalr	-744(ra) # 80003e34 <_Z11printStringPKc>
            printInt(value * value);
    80005124:	0104a503          	lw	a0,16(s1)
    80005128:	00000613          	li	a2,0
    8000512c:	00a00593          	li	a1,10
    80005130:	02a5053b          	mulw	a0,a0,a0
    80005134:	fffff097          	auipc	ra,0xfffff
    80005138:	9e0080e7          	jalr	-1568(ra) # 80003b14 <_ZL8printIntiii>
            printString("\n");
    8000513c:	00003517          	auipc	a0,0x3
    80005140:	04c50513          	addi	a0,a0,76 # 80008188 <CONSOLE_STATUS+0x178>
    80005144:	fffff097          	auipc	ra,0xfffff
    80005148:	cf0080e7          	jalr	-784(ra) # 80003e34 <_Z11printStringPKc>
            sem_signal(semProducer);
    8000514c:	0004b503          	ld	a0,0(s1)
    80005150:	ffffd097          	auipc	ra,0xffffd
    80005154:	580080e7          	jalr	1408(ra) # 800026d0 <_Z10sem_signalP4_sem>
        for (int i = 1; i <= 50; i++) {
    80005158:	0019091b          	addiw	s2,s2,1
    8000515c:	f91ff06f          	j	800050ec <_ZN16ProducerConsumer14consumeWrapperEPv+0x20>
        printString("Consumer finished\n");
    80005160:	00003517          	auipc	a0,0x3
    80005164:	35050513          	addi	a0,a0,848 # 800084b0 <_ZZ14kprintUnsignedmE6digits+0x2c0>
    80005168:	fffff097          	auipc	ra,0xfffff
    8000516c:	ccc080e7          	jalr	-820(ra) # 80003e34 <_Z11printStringPKc>
        ProducerConsumer *pc = (ProducerConsumer *) obj;
        pc->consume();
    }
    80005170:	01813083          	ld	ra,24(sp)
    80005174:	01013403          	ld	s0,16(sp)
    80005178:	00813483          	ld	s1,8(sp)
    8000517c:	00013903          	ld	s2,0(sp)
    80005180:	02010113          	addi	sp,sp,32
    80005184:	00008067          	ret

0000000080005188 <start>:
    80005188:	ff010113          	addi	sp,sp,-16
    8000518c:	00813423          	sd	s0,8(sp)
    80005190:	01010413          	addi	s0,sp,16
    80005194:	300027f3          	csrr	a5,mstatus
    80005198:	ffffe737          	lui	a4,0xffffe
    8000519c:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff370f>
    800051a0:	00e7f7b3          	and	a5,a5,a4
    800051a4:	00001737          	lui	a4,0x1
    800051a8:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    800051ac:	00e7e7b3          	or	a5,a5,a4
    800051b0:	30079073          	csrw	mstatus,a5
    800051b4:	00000797          	auipc	a5,0x0
    800051b8:	16078793          	addi	a5,a5,352 # 80005314 <system_main>
    800051bc:	34179073          	csrw	mepc,a5
    800051c0:	00000793          	li	a5,0
    800051c4:	18079073          	csrw	satp,a5
    800051c8:	000107b7          	lui	a5,0x10
    800051cc:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    800051d0:	30279073          	csrw	medeleg,a5
    800051d4:	30379073          	csrw	mideleg,a5
    800051d8:	104027f3          	csrr	a5,sie
    800051dc:	2227e793          	ori	a5,a5,546
    800051e0:	10479073          	csrw	sie,a5
    800051e4:	fff00793          	li	a5,-1
    800051e8:	00a7d793          	srli	a5,a5,0xa
    800051ec:	3b079073          	csrw	pmpaddr0,a5
    800051f0:	00f00793          	li	a5,15
    800051f4:	3a079073          	csrw	pmpcfg0,a5
    800051f8:	f14027f3          	csrr	a5,mhartid
    800051fc:	0200c737          	lui	a4,0x200c
    80005200:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80005204:	0007869b          	sext.w	a3,a5
    80005208:	00269713          	slli	a4,a3,0x2
    8000520c:	000f4637          	lui	a2,0xf4
    80005210:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80005214:	00d70733          	add	a4,a4,a3
    80005218:	0037979b          	slliw	a5,a5,0x3
    8000521c:	020046b7          	lui	a3,0x2004
    80005220:	00d787b3          	add	a5,a5,a3
    80005224:	00c585b3          	add	a1,a1,a2
    80005228:	00371693          	slli	a3,a4,0x3
    8000522c:	00005717          	auipc	a4,0x5
    80005230:	c6470713          	addi	a4,a4,-924 # 80009e90 <timer_scratch>
    80005234:	00b7b023          	sd	a1,0(a5)
    80005238:	00d70733          	add	a4,a4,a3
    8000523c:	00f73c23          	sd	a5,24(a4)
    80005240:	02c73023          	sd	a2,32(a4)
    80005244:	34071073          	csrw	mscratch,a4
    80005248:	00000797          	auipc	a5,0x0
    8000524c:	6e878793          	addi	a5,a5,1768 # 80005930 <timervec>
    80005250:	30579073          	csrw	mtvec,a5
    80005254:	300027f3          	csrr	a5,mstatus
    80005258:	0087e793          	ori	a5,a5,8
    8000525c:	30079073          	csrw	mstatus,a5
    80005260:	304027f3          	csrr	a5,mie
    80005264:	0807e793          	ori	a5,a5,128
    80005268:	30479073          	csrw	mie,a5
    8000526c:	f14027f3          	csrr	a5,mhartid
    80005270:	0007879b          	sext.w	a5,a5
    80005274:	00078213          	mv	tp,a5
    80005278:	30200073          	mret
    8000527c:	00813403          	ld	s0,8(sp)
    80005280:	01010113          	addi	sp,sp,16
    80005284:	00008067          	ret

0000000080005288 <timerinit>:
    80005288:	ff010113          	addi	sp,sp,-16
    8000528c:	00813423          	sd	s0,8(sp)
    80005290:	01010413          	addi	s0,sp,16
    80005294:	f14027f3          	csrr	a5,mhartid
    80005298:	0200c737          	lui	a4,0x200c
    8000529c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800052a0:	0007869b          	sext.w	a3,a5
    800052a4:	00269713          	slli	a4,a3,0x2
    800052a8:	000f4637          	lui	a2,0xf4
    800052ac:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800052b0:	00d70733          	add	a4,a4,a3
    800052b4:	0037979b          	slliw	a5,a5,0x3
    800052b8:	020046b7          	lui	a3,0x2004
    800052bc:	00d787b3          	add	a5,a5,a3
    800052c0:	00c585b3          	add	a1,a1,a2
    800052c4:	00371693          	slli	a3,a4,0x3
    800052c8:	00005717          	auipc	a4,0x5
    800052cc:	bc870713          	addi	a4,a4,-1080 # 80009e90 <timer_scratch>
    800052d0:	00b7b023          	sd	a1,0(a5)
    800052d4:	00d70733          	add	a4,a4,a3
    800052d8:	00f73c23          	sd	a5,24(a4)
    800052dc:	02c73023          	sd	a2,32(a4)
    800052e0:	34071073          	csrw	mscratch,a4
    800052e4:	00000797          	auipc	a5,0x0
    800052e8:	64c78793          	addi	a5,a5,1612 # 80005930 <timervec>
    800052ec:	30579073          	csrw	mtvec,a5
    800052f0:	300027f3          	csrr	a5,mstatus
    800052f4:	0087e793          	ori	a5,a5,8
    800052f8:	30079073          	csrw	mstatus,a5
    800052fc:	304027f3          	csrr	a5,mie
    80005300:	0807e793          	ori	a5,a5,128
    80005304:	30479073          	csrw	mie,a5
    80005308:	00813403          	ld	s0,8(sp)
    8000530c:	01010113          	addi	sp,sp,16
    80005310:	00008067          	ret

0000000080005314 <system_main>:
    80005314:	fe010113          	addi	sp,sp,-32
    80005318:	00813823          	sd	s0,16(sp)
    8000531c:	00913423          	sd	s1,8(sp)
    80005320:	00113c23          	sd	ra,24(sp)
    80005324:	02010413          	addi	s0,sp,32
    80005328:	00000097          	auipc	ra,0x0
    8000532c:	0c4080e7          	jalr	196(ra) # 800053ec <cpuid>
    80005330:	00005497          	auipc	s1,0x5
    80005334:	ad048493          	addi	s1,s1,-1328 # 80009e00 <started>
    80005338:	02050263          	beqz	a0,8000535c <system_main+0x48>
    8000533c:	0004a783          	lw	a5,0(s1)
    80005340:	0007879b          	sext.w	a5,a5
    80005344:	fe078ce3          	beqz	a5,8000533c <system_main+0x28>
    80005348:	0ff0000f          	fence
    8000534c:	00003517          	auipc	a0,0x3
    80005350:	1c450513          	addi	a0,a0,452 # 80008510 <_ZL6digits+0x48>
    80005354:	00001097          	auipc	ra,0x1
    80005358:	a78080e7          	jalr	-1416(ra) # 80005dcc <panic>
    8000535c:	00001097          	auipc	ra,0x1
    80005360:	9cc080e7          	jalr	-1588(ra) # 80005d28 <consoleinit>
    80005364:	00001097          	auipc	ra,0x1
    80005368:	158080e7          	jalr	344(ra) # 800064bc <printfinit>
    8000536c:	00003517          	auipc	a0,0x3
    80005370:	e1c50513          	addi	a0,a0,-484 # 80008188 <CONSOLE_STATUS+0x178>
    80005374:	00001097          	auipc	ra,0x1
    80005378:	ab4080e7          	jalr	-1356(ra) # 80005e28 <__printf>
    8000537c:	00003517          	auipc	a0,0x3
    80005380:	16450513          	addi	a0,a0,356 # 800084e0 <_ZL6digits+0x18>
    80005384:	00001097          	auipc	ra,0x1
    80005388:	aa4080e7          	jalr	-1372(ra) # 80005e28 <__printf>
    8000538c:	00003517          	auipc	a0,0x3
    80005390:	dfc50513          	addi	a0,a0,-516 # 80008188 <CONSOLE_STATUS+0x178>
    80005394:	00001097          	auipc	ra,0x1
    80005398:	a94080e7          	jalr	-1388(ra) # 80005e28 <__printf>
    8000539c:	00001097          	auipc	ra,0x1
    800053a0:	4ac080e7          	jalr	1196(ra) # 80006848 <kinit>
    800053a4:	00000097          	auipc	ra,0x0
    800053a8:	148080e7          	jalr	328(ra) # 800054ec <trapinit>
    800053ac:	00000097          	auipc	ra,0x0
    800053b0:	16c080e7          	jalr	364(ra) # 80005518 <trapinithart>
    800053b4:	00000097          	auipc	ra,0x0
    800053b8:	5bc080e7          	jalr	1468(ra) # 80005970 <plicinit>
    800053bc:	00000097          	auipc	ra,0x0
    800053c0:	5dc080e7          	jalr	1500(ra) # 80005998 <plicinithart>
    800053c4:	00000097          	auipc	ra,0x0
    800053c8:	078080e7          	jalr	120(ra) # 8000543c <userinit>
    800053cc:	0ff0000f          	fence
    800053d0:	00100793          	li	a5,1
    800053d4:	00003517          	auipc	a0,0x3
    800053d8:	12450513          	addi	a0,a0,292 # 800084f8 <_ZL6digits+0x30>
    800053dc:	00f4a023          	sw	a5,0(s1)
    800053e0:	00001097          	auipc	ra,0x1
    800053e4:	a48080e7          	jalr	-1464(ra) # 80005e28 <__printf>
    800053e8:	0000006f          	j	800053e8 <system_main+0xd4>

00000000800053ec <cpuid>:
    800053ec:	ff010113          	addi	sp,sp,-16
    800053f0:	00813423          	sd	s0,8(sp)
    800053f4:	01010413          	addi	s0,sp,16
    800053f8:	00020513          	mv	a0,tp
    800053fc:	00813403          	ld	s0,8(sp)
    80005400:	0005051b          	sext.w	a0,a0
    80005404:	01010113          	addi	sp,sp,16
    80005408:	00008067          	ret

000000008000540c <mycpu>:
    8000540c:	ff010113          	addi	sp,sp,-16
    80005410:	00813423          	sd	s0,8(sp)
    80005414:	01010413          	addi	s0,sp,16
    80005418:	00020793          	mv	a5,tp
    8000541c:	00813403          	ld	s0,8(sp)
    80005420:	0007879b          	sext.w	a5,a5
    80005424:	00779793          	slli	a5,a5,0x7
    80005428:	00006517          	auipc	a0,0x6
    8000542c:	a9850513          	addi	a0,a0,-1384 # 8000aec0 <cpus>
    80005430:	00f50533          	add	a0,a0,a5
    80005434:	01010113          	addi	sp,sp,16
    80005438:	00008067          	ret

000000008000543c <userinit>:
    8000543c:	ff010113          	addi	sp,sp,-16
    80005440:	00813423          	sd	s0,8(sp)
    80005444:	01010413          	addi	s0,sp,16
    80005448:	00813403          	ld	s0,8(sp)
    8000544c:	01010113          	addi	sp,sp,16
    80005450:	ffffc317          	auipc	t1,0xffffc
    80005454:	56030067          	jr	1376(t1) # 800019b0 <main>

0000000080005458 <either_copyout>:
    80005458:	ff010113          	addi	sp,sp,-16
    8000545c:	00813023          	sd	s0,0(sp)
    80005460:	00113423          	sd	ra,8(sp)
    80005464:	01010413          	addi	s0,sp,16
    80005468:	02051663          	bnez	a0,80005494 <either_copyout+0x3c>
    8000546c:	00058513          	mv	a0,a1
    80005470:	00060593          	mv	a1,a2
    80005474:	0006861b          	sext.w	a2,a3
    80005478:	00002097          	auipc	ra,0x2
    8000547c:	c5c080e7          	jalr	-932(ra) # 800070d4 <__memmove>
    80005480:	00813083          	ld	ra,8(sp)
    80005484:	00013403          	ld	s0,0(sp)
    80005488:	00000513          	li	a0,0
    8000548c:	01010113          	addi	sp,sp,16
    80005490:	00008067          	ret
    80005494:	00003517          	auipc	a0,0x3
    80005498:	0a450513          	addi	a0,a0,164 # 80008538 <_ZL6digits+0x70>
    8000549c:	00001097          	auipc	ra,0x1
    800054a0:	930080e7          	jalr	-1744(ra) # 80005dcc <panic>

00000000800054a4 <either_copyin>:
    800054a4:	ff010113          	addi	sp,sp,-16
    800054a8:	00813023          	sd	s0,0(sp)
    800054ac:	00113423          	sd	ra,8(sp)
    800054b0:	01010413          	addi	s0,sp,16
    800054b4:	02059463          	bnez	a1,800054dc <either_copyin+0x38>
    800054b8:	00060593          	mv	a1,a2
    800054bc:	0006861b          	sext.w	a2,a3
    800054c0:	00002097          	auipc	ra,0x2
    800054c4:	c14080e7          	jalr	-1004(ra) # 800070d4 <__memmove>
    800054c8:	00813083          	ld	ra,8(sp)
    800054cc:	00013403          	ld	s0,0(sp)
    800054d0:	00000513          	li	a0,0
    800054d4:	01010113          	addi	sp,sp,16
    800054d8:	00008067          	ret
    800054dc:	00003517          	auipc	a0,0x3
    800054e0:	08450513          	addi	a0,a0,132 # 80008560 <_ZL6digits+0x98>
    800054e4:	00001097          	auipc	ra,0x1
    800054e8:	8e8080e7          	jalr	-1816(ra) # 80005dcc <panic>

00000000800054ec <trapinit>:
    800054ec:	ff010113          	addi	sp,sp,-16
    800054f0:	00813423          	sd	s0,8(sp)
    800054f4:	01010413          	addi	s0,sp,16
    800054f8:	00813403          	ld	s0,8(sp)
    800054fc:	00003597          	auipc	a1,0x3
    80005500:	08c58593          	addi	a1,a1,140 # 80008588 <_ZL6digits+0xc0>
    80005504:	00006517          	auipc	a0,0x6
    80005508:	a3c50513          	addi	a0,a0,-1476 # 8000af40 <tickslock>
    8000550c:	01010113          	addi	sp,sp,16
    80005510:	00001317          	auipc	t1,0x1
    80005514:	5c830067          	jr	1480(t1) # 80006ad8 <initlock>

0000000080005518 <trapinithart>:
    80005518:	ff010113          	addi	sp,sp,-16
    8000551c:	00813423          	sd	s0,8(sp)
    80005520:	01010413          	addi	s0,sp,16
    80005524:	00000797          	auipc	a5,0x0
    80005528:	2fc78793          	addi	a5,a5,764 # 80005820 <kernelvec>
    8000552c:	10579073          	csrw	stvec,a5
    80005530:	00813403          	ld	s0,8(sp)
    80005534:	01010113          	addi	sp,sp,16
    80005538:	00008067          	ret

000000008000553c <usertrap>:
    8000553c:	ff010113          	addi	sp,sp,-16
    80005540:	00813423          	sd	s0,8(sp)
    80005544:	01010413          	addi	s0,sp,16
    80005548:	00813403          	ld	s0,8(sp)
    8000554c:	01010113          	addi	sp,sp,16
    80005550:	00008067          	ret

0000000080005554 <usertrapret>:
    80005554:	ff010113          	addi	sp,sp,-16
    80005558:	00813423          	sd	s0,8(sp)
    8000555c:	01010413          	addi	s0,sp,16
    80005560:	00813403          	ld	s0,8(sp)
    80005564:	01010113          	addi	sp,sp,16
    80005568:	00008067          	ret

000000008000556c <kerneltrap>:
    8000556c:	fe010113          	addi	sp,sp,-32
    80005570:	00813823          	sd	s0,16(sp)
    80005574:	00113c23          	sd	ra,24(sp)
    80005578:	00913423          	sd	s1,8(sp)
    8000557c:	02010413          	addi	s0,sp,32
    80005580:	142025f3          	csrr	a1,scause
    80005584:	100027f3          	csrr	a5,sstatus
    80005588:	0027f793          	andi	a5,a5,2
    8000558c:	10079c63          	bnez	a5,800056a4 <kerneltrap+0x138>
    80005590:	142027f3          	csrr	a5,scause
    80005594:	0207ce63          	bltz	a5,800055d0 <kerneltrap+0x64>
    80005598:	00003517          	auipc	a0,0x3
    8000559c:	03850513          	addi	a0,a0,56 # 800085d0 <_ZL6digits+0x108>
    800055a0:	00001097          	auipc	ra,0x1
    800055a4:	888080e7          	jalr	-1912(ra) # 80005e28 <__printf>
    800055a8:	141025f3          	csrr	a1,sepc
    800055ac:	14302673          	csrr	a2,stval
    800055b0:	00003517          	auipc	a0,0x3
    800055b4:	03050513          	addi	a0,a0,48 # 800085e0 <_ZL6digits+0x118>
    800055b8:	00001097          	auipc	ra,0x1
    800055bc:	870080e7          	jalr	-1936(ra) # 80005e28 <__printf>
    800055c0:	00003517          	auipc	a0,0x3
    800055c4:	03850513          	addi	a0,a0,56 # 800085f8 <_ZL6digits+0x130>
    800055c8:	00001097          	auipc	ra,0x1
    800055cc:	804080e7          	jalr	-2044(ra) # 80005dcc <panic>
    800055d0:	0ff7f713          	andi	a4,a5,255
    800055d4:	00900693          	li	a3,9
    800055d8:	04d70063          	beq	a4,a3,80005618 <kerneltrap+0xac>
    800055dc:	fff00713          	li	a4,-1
    800055e0:	03f71713          	slli	a4,a4,0x3f
    800055e4:	00170713          	addi	a4,a4,1
    800055e8:	fae798e3          	bne	a5,a4,80005598 <kerneltrap+0x2c>
    800055ec:	00000097          	auipc	ra,0x0
    800055f0:	e00080e7          	jalr	-512(ra) # 800053ec <cpuid>
    800055f4:	06050663          	beqz	a0,80005660 <kerneltrap+0xf4>
    800055f8:	144027f3          	csrr	a5,sip
    800055fc:	ffd7f793          	andi	a5,a5,-3
    80005600:	14479073          	csrw	sip,a5
    80005604:	01813083          	ld	ra,24(sp)
    80005608:	01013403          	ld	s0,16(sp)
    8000560c:	00813483          	ld	s1,8(sp)
    80005610:	02010113          	addi	sp,sp,32
    80005614:	00008067          	ret
    80005618:	00000097          	auipc	ra,0x0
    8000561c:	3cc080e7          	jalr	972(ra) # 800059e4 <plic_claim>
    80005620:	00a00793          	li	a5,10
    80005624:	00050493          	mv	s1,a0
    80005628:	06f50863          	beq	a0,a5,80005698 <kerneltrap+0x12c>
    8000562c:	fc050ce3          	beqz	a0,80005604 <kerneltrap+0x98>
    80005630:	00050593          	mv	a1,a0
    80005634:	00003517          	auipc	a0,0x3
    80005638:	f7c50513          	addi	a0,a0,-132 # 800085b0 <_ZL6digits+0xe8>
    8000563c:	00000097          	auipc	ra,0x0
    80005640:	7ec080e7          	jalr	2028(ra) # 80005e28 <__printf>
    80005644:	01013403          	ld	s0,16(sp)
    80005648:	01813083          	ld	ra,24(sp)
    8000564c:	00048513          	mv	a0,s1
    80005650:	00813483          	ld	s1,8(sp)
    80005654:	02010113          	addi	sp,sp,32
    80005658:	00000317          	auipc	t1,0x0
    8000565c:	3c430067          	jr	964(t1) # 80005a1c <plic_complete>
    80005660:	00006517          	auipc	a0,0x6
    80005664:	8e050513          	addi	a0,a0,-1824 # 8000af40 <tickslock>
    80005668:	00001097          	auipc	ra,0x1
    8000566c:	494080e7          	jalr	1172(ra) # 80006afc <acquire>
    80005670:	00004717          	auipc	a4,0x4
    80005674:	79470713          	addi	a4,a4,1940 # 80009e04 <ticks>
    80005678:	00072783          	lw	a5,0(a4)
    8000567c:	00006517          	auipc	a0,0x6
    80005680:	8c450513          	addi	a0,a0,-1852 # 8000af40 <tickslock>
    80005684:	0017879b          	addiw	a5,a5,1
    80005688:	00f72023          	sw	a5,0(a4)
    8000568c:	00001097          	auipc	ra,0x1
    80005690:	53c080e7          	jalr	1340(ra) # 80006bc8 <release>
    80005694:	f65ff06f          	j	800055f8 <kerneltrap+0x8c>
    80005698:	00001097          	auipc	ra,0x1
    8000569c:	098080e7          	jalr	152(ra) # 80006730 <uartintr>
    800056a0:	fa5ff06f          	j	80005644 <kerneltrap+0xd8>
    800056a4:	00003517          	auipc	a0,0x3
    800056a8:	eec50513          	addi	a0,a0,-276 # 80008590 <_ZL6digits+0xc8>
    800056ac:	00000097          	auipc	ra,0x0
    800056b0:	720080e7          	jalr	1824(ra) # 80005dcc <panic>

00000000800056b4 <clockintr>:
    800056b4:	fe010113          	addi	sp,sp,-32
    800056b8:	00813823          	sd	s0,16(sp)
    800056bc:	00913423          	sd	s1,8(sp)
    800056c0:	00113c23          	sd	ra,24(sp)
    800056c4:	02010413          	addi	s0,sp,32
    800056c8:	00006497          	auipc	s1,0x6
    800056cc:	87848493          	addi	s1,s1,-1928 # 8000af40 <tickslock>
    800056d0:	00048513          	mv	a0,s1
    800056d4:	00001097          	auipc	ra,0x1
    800056d8:	428080e7          	jalr	1064(ra) # 80006afc <acquire>
    800056dc:	00004717          	auipc	a4,0x4
    800056e0:	72870713          	addi	a4,a4,1832 # 80009e04 <ticks>
    800056e4:	00072783          	lw	a5,0(a4)
    800056e8:	01013403          	ld	s0,16(sp)
    800056ec:	01813083          	ld	ra,24(sp)
    800056f0:	00048513          	mv	a0,s1
    800056f4:	0017879b          	addiw	a5,a5,1
    800056f8:	00813483          	ld	s1,8(sp)
    800056fc:	00f72023          	sw	a5,0(a4)
    80005700:	02010113          	addi	sp,sp,32
    80005704:	00001317          	auipc	t1,0x1
    80005708:	4c430067          	jr	1220(t1) # 80006bc8 <release>

000000008000570c <devintr>:
    8000570c:	142027f3          	csrr	a5,scause
    80005710:	00000513          	li	a0,0
    80005714:	0007c463          	bltz	a5,8000571c <devintr+0x10>
    80005718:	00008067          	ret
    8000571c:	fe010113          	addi	sp,sp,-32
    80005720:	00813823          	sd	s0,16(sp)
    80005724:	00113c23          	sd	ra,24(sp)
    80005728:	00913423          	sd	s1,8(sp)
    8000572c:	02010413          	addi	s0,sp,32
    80005730:	0ff7f713          	andi	a4,a5,255
    80005734:	00900693          	li	a3,9
    80005738:	04d70c63          	beq	a4,a3,80005790 <devintr+0x84>
    8000573c:	fff00713          	li	a4,-1
    80005740:	03f71713          	slli	a4,a4,0x3f
    80005744:	00170713          	addi	a4,a4,1
    80005748:	00e78c63          	beq	a5,a4,80005760 <devintr+0x54>
    8000574c:	01813083          	ld	ra,24(sp)
    80005750:	01013403          	ld	s0,16(sp)
    80005754:	00813483          	ld	s1,8(sp)
    80005758:	02010113          	addi	sp,sp,32
    8000575c:	00008067          	ret
    80005760:	00000097          	auipc	ra,0x0
    80005764:	c8c080e7          	jalr	-884(ra) # 800053ec <cpuid>
    80005768:	06050663          	beqz	a0,800057d4 <devintr+0xc8>
    8000576c:	144027f3          	csrr	a5,sip
    80005770:	ffd7f793          	andi	a5,a5,-3
    80005774:	14479073          	csrw	sip,a5
    80005778:	01813083          	ld	ra,24(sp)
    8000577c:	01013403          	ld	s0,16(sp)
    80005780:	00813483          	ld	s1,8(sp)
    80005784:	00200513          	li	a0,2
    80005788:	02010113          	addi	sp,sp,32
    8000578c:	00008067          	ret
    80005790:	00000097          	auipc	ra,0x0
    80005794:	254080e7          	jalr	596(ra) # 800059e4 <plic_claim>
    80005798:	00a00793          	li	a5,10
    8000579c:	00050493          	mv	s1,a0
    800057a0:	06f50663          	beq	a0,a5,8000580c <devintr+0x100>
    800057a4:	00100513          	li	a0,1
    800057a8:	fa0482e3          	beqz	s1,8000574c <devintr+0x40>
    800057ac:	00048593          	mv	a1,s1
    800057b0:	00003517          	auipc	a0,0x3
    800057b4:	e0050513          	addi	a0,a0,-512 # 800085b0 <_ZL6digits+0xe8>
    800057b8:	00000097          	auipc	ra,0x0
    800057bc:	670080e7          	jalr	1648(ra) # 80005e28 <__printf>
    800057c0:	00048513          	mv	a0,s1
    800057c4:	00000097          	auipc	ra,0x0
    800057c8:	258080e7          	jalr	600(ra) # 80005a1c <plic_complete>
    800057cc:	00100513          	li	a0,1
    800057d0:	f7dff06f          	j	8000574c <devintr+0x40>
    800057d4:	00005517          	auipc	a0,0x5
    800057d8:	76c50513          	addi	a0,a0,1900 # 8000af40 <tickslock>
    800057dc:	00001097          	auipc	ra,0x1
    800057e0:	320080e7          	jalr	800(ra) # 80006afc <acquire>
    800057e4:	00004717          	auipc	a4,0x4
    800057e8:	62070713          	addi	a4,a4,1568 # 80009e04 <ticks>
    800057ec:	00072783          	lw	a5,0(a4)
    800057f0:	00005517          	auipc	a0,0x5
    800057f4:	75050513          	addi	a0,a0,1872 # 8000af40 <tickslock>
    800057f8:	0017879b          	addiw	a5,a5,1
    800057fc:	00f72023          	sw	a5,0(a4)
    80005800:	00001097          	auipc	ra,0x1
    80005804:	3c8080e7          	jalr	968(ra) # 80006bc8 <release>
    80005808:	f65ff06f          	j	8000576c <devintr+0x60>
    8000580c:	00001097          	auipc	ra,0x1
    80005810:	f24080e7          	jalr	-220(ra) # 80006730 <uartintr>
    80005814:	fadff06f          	j	800057c0 <devintr+0xb4>
	...

0000000080005820 <kernelvec>:
    80005820:	f0010113          	addi	sp,sp,-256
    80005824:	00113023          	sd	ra,0(sp)
    80005828:	00213423          	sd	sp,8(sp)
    8000582c:	00313823          	sd	gp,16(sp)
    80005830:	00413c23          	sd	tp,24(sp)
    80005834:	02513023          	sd	t0,32(sp)
    80005838:	02613423          	sd	t1,40(sp)
    8000583c:	02713823          	sd	t2,48(sp)
    80005840:	02813c23          	sd	s0,56(sp)
    80005844:	04913023          	sd	s1,64(sp)
    80005848:	04a13423          	sd	a0,72(sp)
    8000584c:	04b13823          	sd	a1,80(sp)
    80005850:	04c13c23          	sd	a2,88(sp)
    80005854:	06d13023          	sd	a3,96(sp)
    80005858:	06e13423          	sd	a4,104(sp)
    8000585c:	06f13823          	sd	a5,112(sp)
    80005860:	07013c23          	sd	a6,120(sp)
    80005864:	09113023          	sd	a7,128(sp)
    80005868:	09213423          	sd	s2,136(sp)
    8000586c:	09313823          	sd	s3,144(sp)
    80005870:	09413c23          	sd	s4,152(sp)
    80005874:	0b513023          	sd	s5,160(sp)
    80005878:	0b613423          	sd	s6,168(sp)
    8000587c:	0b713823          	sd	s7,176(sp)
    80005880:	0b813c23          	sd	s8,184(sp)
    80005884:	0d913023          	sd	s9,192(sp)
    80005888:	0da13423          	sd	s10,200(sp)
    8000588c:	0db13823          	sd	s11,208(sp)
    80005890:	0dc13c23          	sd	t3,216(sp)
    80005894:	0fd13023          	sd	t4,224(sp)
    80005898:	0fe13423          	sd	t5,232(sp)
    8000589c:	0ff13823          	sd	t6,240(sp)
    800058a0:	ccdff0ef          	jal	ra,8000556c <kerneltrap>
    800058a4:	00013083          	ld	ra,0(sp)
    800058a8:	00813103          	ld	sp,8(sp)
    800058ac:	01013183          	ld	gp,16(sp)
    800058b0:	02013283          	ld	t0,32(sp)
    800058b4:	02813303          	ld	t1,40(sp)
    800058b8:	03013383          	ld	t2,48(sp)
    800058bc:	03813403          	ld	s0,56(sp)
    800058c0:	04013483          	ld	s1,64(sp)
    800058c4:	04813503          	ld	a0,72(sp)
    800058c8:	05013583          	ld	a1,80(sp)
    800058cc:	05813603          	ld	a2,88(sp)
    800058d0:	06013683          	ld	a3,96(sp)
    800058d4:	06813703          	ld	a4,104(sp)
    800058d8:	07013783          	ld	a5,112(sp)
    800058dc:	07813803          	ld	a6,120(sp)
    800058e0:	08013883          	ld	a7,128(sp)
    800058e4:	08813903          	ld	s2,136(sp)
    800058e8:	09013983          	ld	s3,144(sp)
    800058ec:	09813a03          	ld	s4,152(sp)
    800058f0:	0a013a83          	ld	s5,160(sp)
    800058f4:	0a813b03          	ld	s6,168(sp)
    800058f8:	0b013b83          	ld	s7,176(sp)
    800058fc:	0b813c03          	ld	s8,184(sp)
    80005900:	0c013c83          	ld	s9,192(sp)
    80005904:	0c813d03          	ld	s10,200(sp)
    80005908:	0d013d83          	ld	s11,208(sp)
    8000590c:	0d813e03          	ld	t3,216(sp)
    80005910:	0e013e83          	ld	t4,224(sp)
    80005914:	0e813f03          	ld	t5,232(sp)
    80005918:	0f013f83          	ld	t6,240(sp)
    8000591c:	10010113          	addi	sp,sp,256
    80005920:	10200073          	sret
    80005924:	00000013          	nop
    80005928:	00000013          	nop
    8000592c:	00000013          	nop

0000000080005930 <timervec>:
    80005930:	34051573          	csrrw	a0,mscratch,a0
    80005934:	00b53023          	sd	a1,0(a0)
    80005938:	00c53423          	sd	a2,8(a0)
    8000593c:	00d53823          	sd	a3,16(a0)
    80005940:	01853583          	ld	a1,24(a0)
    80005944:	02053603          	ld	a2,32(a0)
    80005948:	0005b683          	ld	a3,0(a1)
    8000594c:	00c686b3          	add	a3,a3,a2
    80005950:	00d5b023          	sd	a3,0(a1)
    80005954:	00200593          	li	a1,2
    80005958:	14459073          	csrw	sip,a1
    8000595c:	01053683          	ld	a3,16(a0)
    80005960:	00853603          	ld	a2,8(a0)
    80005964:	00053583          	ld	a1,0(a0)
    80005968:	34051573          	csrrw	a0,mscratch,a0
    8000596c:	30200073          	mret

0000000080005970 <plicinit>:
    80005970:	ff010113          	addi	sp,sp,-16
    80005974:	00813423          	sd	s0,8(sp)
    80005978:	01010413          	addi	s0,sp,16
    8000597c:	00813403          	ld	s0,8(sp)
    80005980:	0c0007b7          	lui	a5,0xc000
    80005984:	00100713          	li	a4,1
    80005988:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000598c:	00e7a223          	sw	a4,4(a5)
    80005990:	01010113          	addi	sp,sp,16
    80005994:	00008067          	ret

0000000080005998 <plicinithart>:
    80005998:	ff010113          	addi	sp,sp,-16
    8000599c:	00813023          	sd	s0,0(sp)
    800059a0:	00113423          	sd	ra,8(sp)
    800059a4:	01010413          	addi	s0,sp,16
    800059a8:	00000097          	auipc	ra,0x0
    800059ac:	a44080e7          	jalr	-1468(ra) # 800053ec <cpuid>
    800059b0:	0085171b          	slliw	a4,a0,0x8
    800059b4:	0c0027b7          	lui	a5,0xc002
    800059b8:	00e787b3          	add	a5,a5,a4
    800059bc:	40200713          	li	a4,1026
    800059c0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    800059c4:	00813083          	ld	ra,8(sp)
    800059c8:	00013403          	ld	s0,0(sp)
    800059cc:	00d5151b          	slliw	a0,a0,0xd
    800059d0:	0c2017b7          	lui	a5,0xc201
    800059d4:	00a78533          	add	a0,a5,a0
    800059d8:	00052023          	sw	zero,0(a0)
    800059dc:	01010113          	addi	sp,sp,16
    800059e0:	00008067          	ret

00000000800059e4 <plic_claim>:
    800059e4:	ff010113          	addi	sp,sp,-16
    800059e8:	00813023          	sd	s0,0(sp)
    800059ec:	00113423          	sd	ra,8(sp)
    800059f0:	01010413          	addi	s0,sp,16
    800059f4:	00000097          	auipc	ra,0x0
    800059f8:	9f8080e7          	jalr	-1544(ra) # 800053ec <cpuid>
    800059fc:	00813083          	ld	ra,8(sp)
    80005a00:	00013403          	ld	s0,0(sp)
    80005a04:	00d5151b          	slliw	a0,a0,0xd
    80005a08:	0c2017b7          	lui	a5,0xc201
    80005a0c:	00a78533          	add	a0,a5,a0
    80005a10:	00452503          	lw	a0,4(a0)
    80005a14:	01010113          	addi	sp,sp,16
    80005a18:	00008067          	ret

0000000080005a1c <plic_complete>:
    80005a1c:	fe010113          	addi	sp,sp,-32
    80005a20:	00813823          	sd	s0,16(sp)
    80005a24:	00913423          	sd	s1,8(sp)
    80005a28:	00113c23          	sd	ra,24(sp)
    80005a2c:	02010413          	addi	s0,sp,32
    80005a30:	00050493          	mv	s1,a0
    80005a34:	00000097          	auipc	ra,0x0
    80005a38:	9b8080e7          	jalr	-1608(ra) # 800053ec <cpuid>
    80005a3c:	01813083          	ld	ra,24(sp)
    80005a40:	01013403          	ld	s0,16(sp)
    80005a44:	00d5179b          	slliw	a5,a0,0xd
    80005a48:	0c201737          	lui	a4,0xc201
    80005a4c:	00f707b3          	add	a5,a4,a5
    80005a50:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80005a54:	00813483          	ld	s1,8(sp)
    80005a58:	02010113          	addi	sp,sp,32
    80005a5c:	00008067          	ret

0000000080005a60 <consolewrite>:
    80005a60:	fb010113          	addi	sp,sp,-80
    80005a64:	04813023          	sd	s0,64(sp)
    80005a68:	04113423          	sd	ra,72(sp)
    80005a6c:	02913c23          	sd	s1,56(sp)
    80005a70:	03213823          	sd	s2,48(sp)
    80005a74:	03313423          	sd	s3,40(sp)
    80005a78:	03413023          	sd	s4,32(sp)
    80005a7c:	01513c23          	sd	s5,24(sp)
    80005a80:	05010413          	addi	s0,sp,80
    80005a84:	06c05c63          	blez	a2,80005afc <consolewrite+0x9c>
    80005a88:	00060993          	mv	s3,a2
    80005a8c:	00050a13          	mv	s4,a0
    80005a90:	00058493          	mv	s1,a1
    80005a94:	00000913          	li	s2,0
    80005a98:	fff00a93          	li	s5,-1
    80005a9c:	01c0006f          	j	80005ab8 <consolewrite+0x58>
    80005aa0:	fbf44503          	lbu	a0,-65(s0)
    80005aa4:	0019091b          	addiw	s2,s2,1
    80005aa8:	00148493          	addi	s1,s1,1
    80005aac:	00001097          	auipc	ra,0x1
    80005ab0:	a9c080e7          	jalr	-1380(ra) # 80006548 <uartputc>
    80005ab4:	03298063          	beq	s3,s2,80005ad4 <consolewrite+0x74>
    80005ab8:	00048613          	mv	a2,s1
    80005abc:	00100693          	li	a3,1
    80005ac0:	000a0593          	mv	a1,s4
    80005ac4:	fbf40513          	addi	a0,s0,-65
    80005ac8:	00000097          	auipc	ra,0x0
    80005acc:	9dc080e7          	jalr	-1572(ra) # 800054a4 <either_copyin>
    80005ad0:	fd5518e3          	bne	a0,s5,80005aa0 <consolewrite+0x40>
    80005ad4:	04813083          	ld	ra,72(sp)
    80005ad8:	04013403          	ld	s0,64(sp)
    80005adc:	03813483          	ld	s1,56(sp)
    80005ae0:	02813983          	ld	s3,40(sp)
    80005ae4:	02013a03          	ld	s4,32(sp)
    80005ae8:	01813a83          	ld	s5,24(sp)
    80005aec:	00090513          	mv	a0,s2
    80005af0:	03013903          	ld	s2,48(sp)
    80005af4:	05010113          	addi	sp,sp,80
    80005af8:	00008067          	ret
    80005afc:	00000913          	li	s2,0
    80005b00:	fd5ff06f          	j	80005ad4 <consolewrite+0x74>

0000000080005b04 <consoleread>:
    80005b04:	f9010113          	addi	sp,sp,-112
    80005b08:	06813023          	sd	s0,96(sp)
    80005b0c:	04913c23          	sd	s1,88(sp)
    80005b10:	05213823          	sd	s2,80(sp)
    80005b14:	05313423          	sd	s3,72(sp)
    80005b18:	05413023          	sd	s4,64(sp)
    80005b1c:	03513c23          	sd	s5,56(sp)
    80005b20:	03613823          	sd	s6,48(sp)
    80005b24:	03713423          	sd	s7,40(sp)
    80005b28:	03813023          	sd	s8,32(sp)
    80005b2c:	06113423          	sd	ra,104(sp)
    80005b30:	01913c23          	sd	s9,24(sp)
    80005b34:	07010413          	addi	s0,sp,112
    80005b38:	00060b93          	mv	s7,a2
    80005b3c:	00050913          	mv	s2,a0
    80005b40:	00058c13          	mv	s8,a1
    80005b44:	00060b1b          	sext.w	s6,a2
    80005b48:	00005497          	auipc	s1,0x5
    80005b4c:	42048493          	addi	s1,s1,1056 # 8000af68 <cons>
    80005b50:	00400993          	li	s3,4
    80005b54:	fff00a13          	li	s4,-1
    80005b58:	00a00a93          	li	s5,10
    80005b5c:	05705e63          	blez	s7,80005bb8 <consoleread+0xb4>
    80005b60:	09c4a703          	lw	a4,156(s1)
    80005b64:	0984a783          	lw	a5,152(s1)
    80005b68:	0007071b          	sext.w	a4,a4
    80005b6c:	08e78463          	beq	a5,a4,80005bf4 <consoleread+0xf0>
    80005b70:	07f7f713          	andi	a4,a5,127
    80005b74:	00e48733          	add	a4,s1,a4
    80005b78:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80005b7c:	0017869b          	addiw	a3,a5,1
    80005b80:	08d4ac23          	sw	a3,152(s1)
    80005b84:	00070c9b          	sext.w	s9,a4
    80005b88:	0b370663          	beq	a4,s3,80005c34 <consoleread+0x130>
    80005b8c:	00100693          	li	a3,1
    80005b90:	f9f40613          	addi	a2,s0,-97
    80005b94:	000c0593          	mv	a1,s8
    80005b98:	00090513          	mv	a0,s2
    80005b9c:	f8e40fa3          	sb	a4,-97(s0)
    80005ba0:	00000097          	auipc	ra,0x0
    80005ba4:	8b8080e7          	jalr	-1864(ra) # 80005458 <either_copyout>
    80005ba8:	01450863          	beq	a0,s4,80005bb8 <consoleread+0xb4>
    80005bac:	001c0c13          	addi	s8,s8,1
    80005bb0:	fffb8b9b          	addiw	s7,s7,-1
    80005bb4:	fb5c94e3          	bne	s9,s5,80005b5c <consoleread+0x58>
    80005bb8:	000b851b          	sext.w	a0,s7
    80005bbc:	06813083          	ld	ra,104(sp)
    80005bc0:	06013403          	ld	s0,96(sp)
    80005bc4:	05813483          	ld	s1,88(sp)
    80005bc8:	05013903          	ld	s2,80(sp)
    80005bcc:	04813983          	ld	s3,72(sp)
    80005bd0:	04013a03          	ld	s4,64(sp)
    80005bd4:	03813a83          	ld	s5,56(sp)
    80005bd8:	02813b83          	ld	s7,40(sp)
    80005bdc:	02013c03          	ld	s8,32(sp)
    80005be0:	01813c83          	ld	s9,24(sp)
    80005be4:	40ab053b          	subw	a0,s6,a0
    80005be8:	03013b03          	ld	s6,48(sp)
    80005bec:	07010113          	addi	sp,sp,112
    80005bf0:	00008067          	ret
    80005bf4:	00001097          	auipc	ra,0x1
    80005bf8:	1d8080e7          	jalr	472(ra) # 80006dcc <push_on>
    80005bfc:	0984a703          	lw	a4,152(s1)
    80005c00:	09c4a783          	lw	a5,156(s1)
    80005c04:	0007879b          	sext.w	a5,a5
    80005c08:	fef70ce3          	beq	a4,a5,80005c00 <consoleread+0xfc>
    80005c0c:	00001097          	auipc	ra,0x1
    80005c10:	234080e7          	jalr	564(ra) # 80006e40 <pop_on>
    80005c14:	0984a783          	lw	a5,152(s1)
    80005c18:	07f7f713          	andi	a4,a5,127
    80005c1c:	00e48733          	add	a4,s1,a4
    80005c20:	01874703          	lbu	a4,24(a4)
    80005c24:	0017869b          	addiw	a3,a5,1
    80005c28:	08d4ac23          	sw	a3,152(s1)
    80005c2c:	00070c9b          	sext.w	s9,a4
    80005c30:	f5371ee3          	bne	a4,s3,80005b8c <consoleread+0x88>
    80005c34:	000b851b          	sext.w	a0,s7
    80005c38:	f96bf2e3          	bgeu	s7,s6,80005bbc <consoleread+0xb8>
    80005c3c:	08f4ac23          	sw	a5,152(s1)
    80005c40:	f7dff06f          	j	80005bbc <consoleread+0xb8>

0000000080005c44 <consputc>:
    80005c44:	10000793          	li	a5,256
    80005c48:	00f50663          	beq	a0,a5,80005c54 <consputc+0x10>
    80005c4c:	00001317          	auipc	t1,0x1
    80005c50:	9f430067          	jr	-1548(t1) # 80006640 <uartputc_sync>
    80005c54:	ff010113          	addi	sp,sp,-16
    80005c58:	00113423          	sd	ra,8(sp)
    80005c5c:	00813023          	sd	s0,0(sp)
    80005c60:	01010413          	addi	s0,sp,16
    80005c64:	00800513          	li	a0,8
    80005c68:	00001097          	auipc	ra,0x1
    80005c6c:	9d8080e7          	jalr	-1576(ra) # 80006640 <uartputc_sync>
    80005c70:	02000513          	li	a0,32
    80005c74:	00001097          	auipc	ra,0x1
    80005c78:	9cc080e7          	jalr	-1588(ra) # 80006640 <uartputc_sync>
    80005c7c:	00013403          	ld	s0,0(sp)
    80005c80:	00813083          	ld	ra,8(sp)
    80005c84:	00800513          	li	a0,8
    80005c88:	01010113          	addi	sp,sp,16
    80005c8c:	00001317          	auipc	t1,0x1
    80005c90:	9b430067          	jr	-1612(t1) # 80006640 <uartputc_sync>

0000000080005c94 <consoleintr>:
    80005c94:	fe010113          	addi	sp,sp,-32
    80005c98:	00813823          	sd	s0,16(sp)
    80005c9c:	00913423          	sd	s1,8(sp)
    80005ca0:	01213023          	sd	s2,0(sp)
    80005ca4:	00113c23          	sd	ra,24(sp)
    80005ca8:	02010413          	addi	s0,sp,32
    80005cac:	00005917          	auipc	s2,0x5
    80005cb0:	2bc90913          	addi	s2,s2,700 # 8000af68 <cons>
    80005cb4:	00050493          	mv	s1,a0
    80005cb8:	00090513          	mv	a0,s2
    80005cbc:	00001097          	auipc	ra,0x1
    80005cc0:	e40080e7          	jalr	-448(ra) # 80006afc <acquire>
    80005cc4:	02048c63          	beqz	s1,80005cfc <consoleintr+0x68>
    80005cc8:	0a092783          	lw	a5,160(s2)
    80005ccc:	09892703          	lw	a4,152(s2)
    80005cd0:	07f00693          	li	a3,127
    80005cd4:	40e7873b          	subw	a4,a5,a4
    80005cd8:	02e6e263          	bltu	a3,a4,80005cfc <consoleintr+0x68>
    80005cdc:	00d00713          	li	a4,13
    80005ce0:	04e48063          	beq	s1,a4,80005d20 <consoleintr+0x8c>
    80005ce4:	07f7f713          	andi	a4,a5,127
    80005ce8:	00e90733          	add	a4,s2,a4
    80005cec:	0017879b          	addiw	a5,a5,1
    80005cf0:	0af92023          	sw	a5,160(s2)
    80005cf4:	00970c23          	sb	s1,24(a4)
    80005cf8:	08f92e23          	sw	a5,156(s2)
    80005cfc:	01013403          	ld	s0,16(sp)
    80005d00:	01813083          	ld	ra,24(sp)
    80005d04:	00813483          	ld	s1,8(sp)
    80005d08:	00013903          	ld	s2,0(sp)
    80005d0c:	00005517          	auipc	a0,0x5
    80005d10:	25c50513          	addi	a0,a0,604 # 8000af68 <cons>
    80005d14:	02010113          	addi	sp,sp,32
    80005d18:	00001317          	auipc	t1,0x1
    80005d1c:	eb030067          	jr	-336(t1) # 80006bc8 <release>
    80005d20:	00a00493          	li	s1,10
    80005d24:	fc1ff06f          	j	80005ce4 <consoleintr+0x50>

0000000080005d28 <consoleinit>:
    80005d28:	fe010113          	addi	sp,sp,-32
    80005d2c:	00113c23          	sd	ra,24(sp)
    80005d30:	00813823          	sd	s0,16(sp)
    80005d34:	00913423          	sd	s1,8(sp)
    80005d38:	02010413          	addi	s0,sp,32
    80005d3c:	00005497          	auipc	s1,0x5
    80005d40:	22c48493          	addi	s1,s1,556 # 8000af68 <cons>
    80005d44:	00048513          	mv	a0,s1
    80005d48:	00003597          	auipc	a1,0x3
    80005d4c:	8c058593          	addi	a1,a1,-1856 # 80008608 <_ZL6digits+0x140>
    80005d50:	00001097          	auipc	ra,0x1
    80005d54:	d88080e7          	jalr	-632(ra) # 80006ad8 <initlock>
    80005d58:	00000097          	auipc	ra,0x0
    80005d5c:	7ac080e7          	jalr	1964(ra) # 80006504 <uartinit>
    80005d60:	01813083          	ld	ra,24(sp)
    80005d64:	01013403          	ld	s0,16(sp)
    80005d68:	00000797          	auipc	a5,0x0
    80005d6c:	d9c78793          	addi	a5,a5,-612 # 80005b04 <consoleread>
    80005d70:	0af4bc23          	sd	a5,184(s1)
    80005d74:	00000797          	auipc	a5,0x0
    80005d78:	cec78793          	addi	a5,a5,-788 # 80005a60 <consolewrite>
    80005d7c:	0cf4b023          	sd	a5,192(s1)
    80005d80:	00813483          	ld	s1,8(sp)
    80005d84:	02010113          	addi	sp,sp,32
    80005d88:	00008067          	ret

0000000080005d8c <console_read>:
    80005d8c:	ff010113          	addi	sp,sp,-16
    80005d90:	00813423          	sd	s0,8(sp)
    80005d94:	01010413          	addi	s0,sp,16
    80005d98:	00813403          	ld	s0,8(sp)
    80005d9c:	00005317          	auipc	t1,0x5
    80005da0:	28433303          	ld	t1,644(t1) # 8000b020 <devsw+0x10>
    80005da4:	01010113          	addi	sp,sp,16
    80005da8:	00030067          	jr	t1

0000000080005dac <console_write>:
    80005dac:	ff010113          	addi	sp,sp,-16
    80005db0:	00813423          	sd	s0,8(sp)
    80005db4:	01010413          	addi	s0,sp,16
    80005db8:	00813403          	ld	s0,8(sp)
    80005dbc:	00005317          	auipc	t1,0x5
    80005dc0:	26c33303          	ld	t1,620(t1) # 8000b028 <devsw+0x18>
    80005dc4:	01010113          	addi	sp,sp,16
    80005dc8:	00030067          	jr	t1

0000000080005dcc <panic>:
    80005dcc:	fe010113          	addi	sp,sp,-32
    80005dd0:	00113c23          	sd	ra,24(sp)
    80005dd4:	00813823          	sd	s0,16(sp)
    80005dd8:	00913423          	sd	s1,8(sp)
    80005ddc:	02010413          	addi	s0,sp,32
    80005de0:	00050493          	mv	s1,a0
    80005de4:	00003517          	auipc	a0,0x3
    80005de8:	82c50513          	addi	a0,a0,-2004 # 80008610 <_ZL6digits+0x148>
    80005dec:	00005797          	auipc	a5,0x5
    80005df0:	2c07ae23          	sw	zero,732(a5) # 8000b0c8 <pr+0x18>
    80005df4:	00000097          	auipc	ra,0x0
    80005df8:	034080e7          	jalr	52(ra) # 80005e28 <__printf>
    80005dfc:	00048513          	mv	a0,s1
    80005e00:	00000097          	auipc	ra,0x0
    80005e04:	028080e7          	jalr	40(ra) # 80005e28 <__printf>
    80005e08:	00002517          	auipc	a0,0x2
    80005e0c:	38050513          	addi	a0,a0,896 # 80008188 <CONSOLE_STATUS+0x178>
    80005e10:	00000097          	auipc	ra,0x0
    80005e14:	018080e7          	jalr	24(ra) # 80005e28 <__printf>
    80005e18:	00100793          	li	a5,1
    80005e1c:	00004717          	auipc	a4,0x4
    80005e20:	fef72623          	sw	a5,-20(a4) # 80009e08 <panicked>
    80005e24:	0000006f          	j	80005e24 <panic+0x58>

0000000080005e28 <__printf>:
    80005e28:	f3010113          	addi	sp,sp,-208
    80005e2c:	08813023          	sd	s0,128(sp)
    80005e30:	07313423          	sd	s3,104(sp)
    80005e34:	09010413          	addi	s0,sp,144
    80005e38:	05813023          	sd	s8,64(sp)
    80005e3c:	08113423          	sd	ra,136(sp)
    80005e40:	06913c23          	sd	s1,120(sp)
    80005e44:	07213823          	sd	s2,112(sp)
    80005e48:	07413023          	sd	s4,96(sp)
    80005e4c:	05513c23          	sd	s5,88(sp)
    80005e50:	05613823          	sd	s6,80(sp)
    80005e54:	05713423          	sd	s7,72(sp)
    80005e58:	03913c23          	sd	s9,56(sp)
    80005e5c:	03a13823          	sd	s10,48(sp)
    80005e60:	03b13423          	sd	s11,40(sp)
    80005e64:	00005317          	auipc	t1,0x5
    80005e68:	24c30313          	addi	t1,t1,588 # 8000b0b0 <pr>
    80005e6c:	01832c03          	lw	s8,24(t1)
    80005e70:	00b43423          	sd	a1,8(s0)
    80005e74:	00c43823          	sd	a2,16(s0)
    80005e78:	00d43c23          	sd	a3,24(s0)
    80005e7c:	02e43023          	sd	a4,32(s0)
    80005e80:	02f43423          	sd	a5,40(s0)
    80005e84:	03043823          	sd	a6,48(s0)
    80005e88:	03143c23          	sd	a7,56(s0)
    80005e8c:	00050993          	mv	s3,a0
    80005e90:	4a0c1663          	bnez	s8,8000633c <__printf+0x514>
    80005e94:	60098c63          	beqz	s3,800064ac <__printf+0x684>
    80005e98:	0009c503          	lbu	a0,0(s3)
    80005e9c:	00840793          	addi	a5,s0,8
    80005ea0:	f6f43c23          	sd	a5,-136(s0)
    80005ea4:	00000493          	li	s1,0
    80005ea8:	22050063          	beqz	a0,800060c8 <__printf+0x2a0>
    80005eac:	00002a37          	lui	s4,0x2
    80005eb0:	00018ab7          	lui	s5,0x18
    80005eb4:	000f4b37          	lui	s6,0xf4
    80005eb8:	00989bb7          	lui	s7,0x989
    80005ebc:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80005ec0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80005ec4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80005ec8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80005ecc:	00148c9b          	addiw	s9,s1,1
    80005ed0:	02500793          	li	a5,37
    80005ed4:	01998933          	add	s2,s3,s9
    80005ed8:	38f51263          	bne	a0,a5,8000625c <__printf+0x434>
    80005edc:	00094783          	lbu	a5,0(s2)
    80005ee0:	00078c9b          	sext.w	s9,a5
    80005ee4:	1e078263          	beqz	a5,800060c8 <__printf+0x2a0>
    80005ee8:	0024849b          	addiw	s1,s1,2
    80005eec:	07000713          	li	a4,112
    80005ef0:	00998933          	add	s2,s3,s1
    80005ef4:	38e78a63          	beq	a5,a4,80006288 <__printf+0x460>
    80005ef8:	20f76863          	bltu	a4,a5,80006108 <__printf+0x2e0>
    80005efc:	42a78863          	beq	a5,a0,8000632c <__printf+0x504>
    80005f00:	06400713          	li	a4,100
    80005f04:	40e79663          	bne	a5,a4,80006310 <__printf+0x4e8>
    80005f08:	f7843783          	ld	a5,-136(s0)
    80005f0c:	0007a603          	lw	a2,0(a5)
    80005f10:	00878793          	addi	a5,a5,8
    80005f14:	f6f43c23          	sd	a5,-136(s0)
    80005f18:	42064a63          	bltz	a2,8000634c <__printf+0x524>
    80005f1c:	00a00713          	li	a4,10
    80005f20:	02e677bb          	remuw	a5,a2,a4
    80005f24:	00002d97          	auipc	s11,0x2
    80005f28:	714d8d93          	addi	s11,s11,1812 # 80008638 <digits>
    80005f2c:	00900593          	li	a1,9
    80005f30:	0006051b          	sext.w	a0,a2
    80005f34:	00000c93          	li	s9,0
    80005f38:	02079793          	slli	a5,a5,0x20
    80005f3c:	0207d793          	srli	a5,a5,0x20
    80005f40:	00fd87b3          	add	a5,s11,a5
    80005f44:	0007c783          	lbu	a5,0(a5)
    80005f48:	02e656bb          	divuw	a3,a2,a4
    80005f4c:	f8f40023          	sb	a5,-128(s0)
    80005f50:	14c5d863          	bge	a1,a2,800060a0 <__printf+0x278>
    80005f54:	06300593          	li	a1,99
    80005f58:	00100c93          	li	s9,1
    80005f5c:	02e6f7bb          	remuw	a5,a3,a4
    80005f60:	02079793          	slli	a5,a5,0x20
    80005f64:	0207d793          	srli	a5,a5,0x20
    80005f68:	00fd87b3          	add	a5,s11,a5
    80005f6c:	0007c783          	lbu	a5,0(a5)
    80005f70:	02e6d73b          	divuw	a4,a3,a4
    80005f74:	f8f400a3          	sb	a5,-127(s0)
    80005f78:	12a5f463          	bgeu	a1,a0,800060a0 <__printf+0x278>
    80005f7c:	00a00693          	li	a3,10
    80005f80:	00900593          	li	a1,9
    80005f84:	02d777bb          	remuw	a5,a4,a3
    80005f88:	02079793          	slli	a5,a5,0x20
    80005f8c:	0207d793          	srli	a5,a5,0x20
    80005f90:	00fd87b3          	add	a5,s11,a5
    80005f94:	0007c503          	lbu	a0,0(a5)
    80005f98:	02d757bb          	divuw	a5,a4,a3
    80005f9c:	f8a40123          	sb	a0,-126(s0)
    80005fa0:	48e5f263          	bgeu	a1,a4,80006424 <__printf+0x5fc>
    80005fa4:	06300513          	li	a0,99
    80005fa8:	02d7f5bb          	remuw	a1,a5,a3
    80005fac:	02059593          	slli	a1,a1,0x20
    80005fb0:	0205d593          	srli	a1,a1,0x20
    80005fb4:	00bd85b3          	add	a1,s11,a1
    80005fb8:	0005c583          	lbu	a1,0(a1)
    80005fbc:	02d7d7bb          	divuw	a5,a5,a3
    80005fc0:	f8b401a3          	sb	a1,-125(s0)
    80005fc4:	48e57263          	bgeu	a0,a4,80006448 <__printf+0x620>
    80005fc8:	3e700513          	li	a0,999
    80005fcc:	02d7f5bb          	remuw	a1,a5,a3
    80005fd0:	02059593          	slli	a1,a1,0x20
    80005fd4:	0205d593          	srli	a1,a1,0x20
    80005fd8:	00bd85b3          	add	a1,s11,a1
    80005fdc:	0005c583          	lbu	a1,0(a1)
    80005fe0:	02d7d7bb          	divuw	a5,a5,a3
    80005fe4:	f8b40223          	sb	a1,-124(s0)
    80005fe8:	46e57663          	bgeu	a0,a4,80006454 <__printf+0x62c>
    80005fec:	02d7f5bb          	remuw	a1,a5,a3
    80005ff0:	02059593          	slli	a1,a1,0x20
    80005ff4:	0205d593          	srli	a1,a1,0x20
    80005ff8:	00bd85b3          	add	a1,s11,a1
    80005ffc:	0005c583          	lbu	a1,0(a1)
    80006000:	02d7d7bb          	divuw	a5,a5,a3
    80006004:	f8b402a3          	sb	a1,-123(s0)
    80006008:	46ea7863          	bgeu	s4,a4,80006478 <__printf+0x650>
    8000600c:	02d7f5bb          	remuw	a1,a5,a3
    80006010:	02059593          	slli	a1,a1,0x20
    80006014:	0205d593          	srli	a1,a1,0x20
    80006018:	00bd85b3          	add	a1,s11,a1
    8000601c:	0005c583          	lbu	a1,0(a1)
    80006020:	02d7d7bb          	divuw	a5,a5,a3
    80006024:	f8b40323          	sb	a1,-122(s0)
    80006028:	3eeaf863          	bgeu	s5,a4,80006418 <__printf+0x5f0>
    8000602c:	02d7f5bb          	remuw	a1,a5,a3
    80006030:	02059593          	slli	a1,a1,0x20
    80006034:	0205d593          	srli	a1,a1,0x20
    80006038:	00bd85b3          	add	a1,s11,a1
    8000603c:	0005c583          	lbu	a1,0(a1)
    80006040:	02d7d7bb          	divuw	a5,a5,a3
    80006044:	f8b403a3          	sb	a1,-121(s0)
    80006048:	42eb7e63          	bgeu	s6,a4,80006484 <__printf+0x65c>
    8000604c:	02d7f5bb          	remuw	a1,a5,a3
    80006050:	02059593          	slli	a1,a1,0x20
    80006054:	0205d593          	srli	a1,a1,0x20
    80006058:	00bd85b3          	add	a1,s11,a1
    8000605c:	0005c583          	lbu	a1,0(a1)
    80006060:	02d7d7bb          	divuw	a5,a5,a3
    80006064:	f8b40423          	sb	a1,-120(s0)
    80006068:	42ebfc63          	bgeu	s7,a4,800064a0 <__printf+0x678>
    8000606c:	02079793          	slli	a5,a5,0x20
    80006070:	0207d793          	srli	a5,a5,0x20
    80006074:	00fd8db3          	add	s11,s11,a5
    80006078:	000dc703          	lbu	a4,0(s11)
    8000607c:	00a00793          	li	a5,10
    80006080:	00900c93          	li	s9,9
    80006084:	f8e404a3          	sb	a4,-119(s0)
    80006088:	00065c63          	bgez	a2,800060a0 <__printf+0x278>
    8000608c:	f9040713          	addi	a4,s0,-112
    80006090:	00f70733          	add	a4,a4,a5
    80006094:	02d00693          	li	a3,45
    80006098:	fed70823          	sb	a3,-16(a4)
    8000609c:	00078c93          	mv	s9,a5
    800060a0:	f8040793          	addi	a5,s0,-128
    800060a4:	01978cb3          	add	s9,a5,s9
    800060a8:	f7f40d13          	addi	s10,s0,-129
    800060ac:	000cc503          	lbu	a0,0(s9)
    800060b0:	fffc8c93          	addi	s9,s9,-1
    800060b4:	00000097          	auipc	ra,0x0
    800060b8:	b90080e7          	jalr	-1136(ra) # 80005c44 <consputc>
    800060bc:	ffac98e3          	bne	s9,s10,800060ac <__printf+0x284>
    800060c0:	00094503          	lbu	a0,0(s2)
    800060c4:	e00514e3          	bnez	a0,80005ecc <__printf+0xa4>
    800060c8:	1a0c1663          	bnez	s8,80006274 <__printf+0x44c>
    800060cc:	08813083          	ld	ra,136(sp)
    800060d0:	08013403          	ld	s0,128(sp)
    800060d4:	07813483          	ld	s1,120(sp)
    800060d8:	07013903          	ld	s2,112(sp)
    800060dc:	06813983          	ld	s3,104(sp)
    800060e0:	06013a03          	ld	s4,96(sp)
    800060e4:	05813a83          	ld	s5,88(sp)
    800060e8:	05013b03          	ld	s6,80(sp)
    800060ec:	04813b83          	ld	s7,72(sp)
    800060f0:	04013c03          	ld	s8,64(sp)
    800060f4:	03813c83          	ld	s9,56(sp)
    800060f8:	03013d03          	ld	s10,48(sp)
    800060fc:	02813d83          	ld	s11,40(sp)
    80006100:	0d010113          	addi	sp,sp,208
    80006104:	00008067          	ret
    80006108:	07300713          	li	a4,115
    8000610c:	1ce78a63          	beq	a5,a4,800062e0 <__printf+0x4b8>
    80006110:	07800713          	li	a4,120
    80006114:	1ee79e63          	bne	a5,a4,80006310 <__printf+0x4e8>
    80006118:	f7843783          	ld	a5,-136(s0)
    8000611c:	0007a703          	lw	a4,0(a5)
    80006120:	00878793          	addi	a5,a5,8
    80006124:	f6f43c23          	sd	a5,-136(s0)
    80006128:	28074263          	bltz	a4,800063ac <__printf+0x584>
    8000612c:	00002d97          	auipc	s11,0x2
    80006130:	50cd8d93          	addi	s11,s11,1292 # 80008638 <digits>
    80006134:	00f77793          	andi	a5,a4,15
    80006138:	00fd87b3          	add	a5,s11,a5
    8000613c:	0007c683          	lbu	a3,0(a5)
    80006140:	00f00613          	li	a2,15
    80006144:	0007079b          	sext.w	a5,a4
    80006148:	f8d40023          	sb	a3,-128(s0)
    8000614c:	0047559b          	srliw	a1,a4,0x4
    80006150:	0047569b          	srliw	a3,a4,0x4
    80006154:	00000c93          	li	s9,0
    80006158:	0ee65063          	bge	a2,a4,80006238 <__printf+0x410>
    8000615c:	00f6f693          	andi	a3,a3,15
    80006160:	00dd86b3          	add	a3,s11,a3
    80006164:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80006168:	0087d79b          	srliw	a5,a5,0x8
    8000616c:	00100c93          	li	s9,1
    80006170:	f8d400a3          	sb	a3,-127(s0)
    80006174:	0cb67263          	bgeu	a2,a1,80006238 <__printf+0x410>
    80006178:	00f7f693          	andi	a3,a5,15
    8000617c:	00dd86b3          	add	a3,s11,a3
    80006180:	0006c583          	lbu	a1,0(a3)
    80006184:	00f00613          	li	a2,15
    80006188:	0047d69b          	srliw	a3,a5,0x4
    8000618c:	f8b40123          	sb	a1,-126(s0)
    80006190:	0047d593          	srli	a1,a5,0x4
    80006194:	28f67e63          	bgeu	a2,a5,80006430 <__printf+0x608>
    80006198:	00f6f693          	andi	a3,a3,15
    8000619c:	00dd86b3          	add	a3,s11,a3
    800061a0:	0006c503          	lbu	a0,0(a3)
    800061a4:	0087d813          	srli	a6,a5,0x8
    800061a8:	0087d69b          	srliw	a3,a5,0x8
    800061ac:	f8a401a3          	sb	a0,-125(s0)
    800061b0:	28b67663          	bgeu	a2,a1,8000643c <__printf+0x614>
    800061b4:	00f6f693          	andi	a3,a3,15
    800061b8:	00dd86b3          	add	a3,s11,a3
    800061bc:	0006c583          	lbu	a1,0(a3)
    800061c0:	00c7d513          	srli	a0,a5,0xc
    800061c4:	00c7d69b          	srliw	a3,a5,0xc
    800061c8:	f8b40223          	sb	a1,-124(s0)
    800061cc:	29067a63          	bgeu	a2,a6,80006460 <__printf+0x638>
    800061d0:	00f6f693          	andi	a3,a3,15
    800061d4:	00dd86b3          	add	a3,s11,a3
    800061d8:	0006c583          	lbu	a1,0(a3)
    800061dc:	0107d813          	srli	a6,a5,0x10
    800061e0:	0107d69b          	srliw	a3,a5,0x10
    800061e4:	f8b402a3          	sb	a1,-123(s0)
    800061e8:	28a67263          	bgeu	a2,a0,8000646c <__printf+0x644>
    800061ec:	00f6f693          	andi	a3,a3,15
    800061f0:	00dd86b3          	add	a3,s11,a3
    800061f4:	0006c683          	lbu	a3,0(a3)
    800061f8:	0147d79b          	srliw	a5,a5,0x14
    800061fc:	f8d40323          	sb	a3,-122(s0)
    80006200:	21067663          	bgeu	a2,a6,8000640c <__printf+0x5e4>
    80006204:	02079793          	slli	a5,a5,0x20
    80006208:	0207d793          	srli	a5,a5,0x20
    8000620c:	00fd8db3          	add	s11,s11,a5
    80006210:	000dc683          	lbu	a3,0(s11)
    80006214:	00800793          	li	a5,8
    80006218:	00700c93          	li	s9,7
    8000621c:	f8d403a3          	sb	a3,-121(s0)
    80006220:	00075c63          	bgez	a4,80006238 <__printf+0x410>
    80006224:	f9040713          	addi	a4,s0,-112
    80006228:	00f70733          	add	a4,a4,a5
    8000622c:	02d00693          	li	a3,45
    80006230:	fed70823          	sb	a3,-16(a4)
    80006234:	00078c93          	mv	s9,a5
    80006238:	f8040793          	addi	a5,s0,-128
    8000623c:	01978cb3          	add	s9,a5,s9
    80006240:	f7f40d13          	addi	s10,s0,-129
    80006244:	000cc503          	lbu	a0,0(s9)
    80006248:	fffc8c93          	addi	s9,s9,-1
    8000624c:	00000097          	auipc	ra,0x0
    80006250:	9f8080e7          	jalr	-1544(ra) # 80005c44 <consputc>
    80006254:	ff9d18e3          	bne	s10,s9,80006244 <__printf+0x41c>
    80006258:	0100006f          	j	80006268 <__printf+0x440>
    8000625c:	00000097          	auipc	ra,0x0
    80006260:	9e8080e7          	jalr	-1560(ra) # 80005c44 <consputc>
    80006264:	000c8493          	mv	s1,s9
    80006268:	00094503          	lbu	a0,0(s2)
    8000626c:	c60510e3          	bnez	a0,80005ecc <__printf+0xa4>
    80006270:	e40c0ee3          	beqz	s8,800060cc <__printf+0x2a4>
    80006274:	00005517          	auipc	a0,0x5
    80006278:	e3c50513          	addi	a0,a0,-452 # 8000b0b0 <pr>
    8000627c:	00001097          	auipc	ra,0x1
    80006280:	94c080e7          	jalr	-1716(ra) # 80006bc8 <release>
    80006284:	e49ff06f          	j	800060cc <__printf+0x2a4>
    80006288:	f7843783          	ld	a5,-136(s0)
    8000628c:	03000513          	li	a0,48
    80006290:	01000d13          	li	s10,16
    80006294:	00878713          	addi	a4,a5,8
    80006298:	0007bc83          	ld	s9,0(a5)
    8000629c:	f6e43c23          	sd	a4,-136(s0)
    800062a0:	00000097          	auipc	ra,0x0
    800062a4:	9a4080e7          	jalr	-1628(ra) # 80005c44 <consputc>
    800062a8:	07800513          	li	a0,120
    800062ac:	00000097          	auipc	ra,0x0
    800062b0:	998080e7          	jalr	-1640(ra) # 80005c44 <consputc>
    800062b4:	00002d97          	auipc	s11,0x2
    800062b8:	384d8d93          	addi	s11,s11,900 # 80008638 <digits>
    800062bc:	03ccd793          	srli	a5,s9,0x3c
    800062c0:	00fd87b3          	add	a5,s11,a5
    800062c4:	0007c503          	lbu	a0,0(a5)
    800062c8:	fffd0d1b          	addiw	s10,s10,-1
    800062cc:	004c9c93          	slli	s9,s9,0x4
    800062d0:	00000097          	auipc	ra,0x0
    800062d4:	974080e7          	jalr	-1676(ra) # 80005c44 <consputc>
    800062d8:	fe0d12e3          	bnez	s10,800062bc <__printf+0x494>
    800062dc:	f8dff06f          	j	80006268 <__printf+0x440>
    800062e0:	f7843783          	ld	a5,-136(s0)
    800062e4:	0007bc83          	ld	s9,0(a5)
    800062e8:	00878793          	addi	a5,a5,8
    800062ec:	f6f43c23          	sd	a5,-136(s0)
    800062f0:	000c9a63          	bnez	s9,80006304 <__printf+0x4dc>
    800062f4:	1080006f          	j	800063fc <__printf+0x5d4>
    800062f8:	001c8c93          	addi	s9,s9,1
    800062fc:	00000097          	auipc	ra,0x0
    80006300:	948080e7          	jalr	-1720(ra) # 80005c44 <consputc>
    80006304:	000cc503          	lbu	a0,0(s9)
    80006308:	fe0518e3          	bnez	a0,800062f8 <__printf+0x4d0>
    8000630c:	f5dff06f          	j	80006268 <__printf+0x440>
    80006310:	02500513          	li	a0,37
    80006314:	00000097          	auipc	ra,0x0
    80006318:	930080e7          	jalr	-1744(ra) # 80005c44 <consputc>
    8000631c:	000c8513          	mv	a0,s9
    80006320:	00000097          	auipc	ra,0x0
    80006324:	924080e7          	jalr	-1756(ra) # 80005c44 <consputc>
    80006328:	f41ff06f          	j	80006268 <__printf+0x440>
    8000632c:	02500513          	li	a0,37
    80006330:	00000097          	auipc	ra,0x0
    80006334:	914080e7          	jalr	-1772(ra) # 80005c44 <consputc>
    80006338:	f31ff06f          	j	80006268 <__printf+0x440>
    8000633c:	00030513          	mv	a0,t1
    80006340:	00000097          	auipc	ra,0x0
    80006344:	7bc080e7          	jalr	1980(ra) # 80006afc <acquire>
    80006348:	b4dff06f          	j	80005e94 <__printf+0x6c>
    8000634c:	40c0053b          	negw	a0,a2
    80006350:	00a00713          	li	a4,10
    80006354:	02e576bb          	remuw	a3,a0,a4
    80006358:	00002d97          	auipc	s11,0x2
    8000635c:	2e0d8d93          	addi	s11,s11,736 # 80008638 <digits>
    80006360:	ff700593          	li	a1,-9
    80006364:	02069693          	slli	a3,a3,0x20
    80006368:	0206d693          	srli	a3,a3,0x20
    8000636c:	00dd86b3          	add	a3,s11,a3
    80006370:	0006c683          	lbu	a3,0(a3)
    80006374:	02e557bb          	divuw	a5,a0,a4
    80006378:	f8d40023          	sb	a3,-128(s0)
    8000637c:	10b65e63          	bge	a2,a1,80006498 <__printf+0x670>
    80006380:	06300593          	li	a1,99
    80006384:	02e7f6bb          	remuw	a3,a5,a4
    80006388:	02069693          	slli	a3,a3,0x20
    8000638c:	0206d693          	srli	a3,a3,0x20
    80006390:	00dd86b3          	add	a3,s11,a3
    80006394:	0006c683          	lbu	a3,0(a3)
    80006398:	02e7d73b          	divuw	a4,a5,a4
    8000639c:	00200793          	li	a5,2
    800063a0:	f8d400a3          	sb	a3,-127(s0)
    800063a4:	bca5ece3          	bltu	a1,a0,80005f7c <__printf+0x154>
    800063a8:	ce5ff06f          	j	8000608c <__printf+0x264>
    800063ac:	40e007bb          	negw	a5,a4
    800063b0:	00002d97          	auipc	s11,0x2
    800063b4:	288d8d93          	addi	s11,s11,648 # 80008638 <digits>
    800063b8:	00f7f693          	andi	a3,a5,15
    800063bc:	00dd86b3          	add	a3,s11,a3
    800063c0:	0006c583          	lbu	a1,0(a3)
    800063c4:	ff100613          	li	a2,-15
    800063c8:	0047d69b          	srliw	a3,a5,0x4
    800063cc:	f8b40023          	sb	a1,-128(s0)
    800063d0:	0047d59b          	srliw	a1,a5,0x4
    800063d4:	0ac75e63          	bge	a4,a2,80006490 <__printf+0x668>
    800063d8:	00f6f693          	andi	a3,a3,15
    800063dc:	00dd86b3          	add	a3,s11,a3
    800063e0:	0006c603          	lbu	a2,0(a3)
    800063e4:	00f00693          	li	a3,15
    800063e8:	0087d79b          	srliw	a5,a5,0x8
    800063ec:	f8c400a3          	sb	a2,-127(s0)
    800063f0:	d8b6e4e3          	bltu	a3,a1,80006178 <__printf+0x350>
    800063f4:	00200793          	li	a5,2
    800063f8:	e2dff06f          	j	80006224 <__printf+0x3fc>
    800063fc:	00002c97          	auipc	s9,0x2
    80006400:	21cc8c93          	addi	s9,s9,540 # 80008618 <_ZL6digits+0x150>
    80006404:	02800513          	li	a0,40
    80006408:	ef1ff06f          	j	800062f8 <__printf+0x4d0>
    8000640c:	00700793          	li	a5,7
    80006410:	00600c93          	li	s9,6
    80006414:	e0dff06f          	j	80006220 <__printf+0x3f8>
    80006418:	00700793          	li	a5,7
    8000641c:	00600c93          	li	s9,6
    80006420:	c69ff06f          	j	80006088 <__printf+0x260>
    80006424:	00300793          	li	a5,3
    80006428:	00200c93          	li	s9,2
    8000642c:	c5dff06f          	j	80006088 <__printf+0x260>
    80006430:	00300793          	li	a5,3
    80006434:	00200c93          	li	s9,2
    80006438:	de9ff06f          	j	80006220 <__printf+0x3f8>
    8000643c:	00400793          	li	a5,4
    80006440:	00300c93          	li	s9,3
    80006444:	dddff06f          	j	80006220 <__printf+0x3f8>
    80006448:	00400793          	li	a5,4
    8000644c:	00300c93          	li	s9,3
    80006450:	c39ff06f          	j	80006088 <__printf+0x260>
    80006454:	00500793          	li	a5,5
    80006458:	00400c93          	li	s9,4
    8000645c:	c2dff06f          	j	80006088 <__printf+0x260>
    80006460:	00500793          	li	a5,5
    80006464:	00400c93          	li	s9,4
    80006468:	db9ff06f          	j	80006220 <__printf+0x3f8>
    8000646c:	00600793          	li	a5,6
    80006470:	00500c93          	li	s9,5
    80006474:	dadff06f          	j	80006220 <__printf+0x3f8>
    80006478:	00600793          	li	a5,6
    8000647c:	00500c93          	li	s9,5
    80006480:	c09ff06f          	j	80006088 <__printf+0x260>
    80006484:	00800793          	li	a5,8
    80006488:	00700c93          	li	s9,7
    8000648c:	bfdff06f          	j	80006088 <__printf+0x260>
    80006490:	00100793          	li	a5,1
    80006494:	d91ff06f          	j	80006224 <__printf+0x3fc>
    80006498:	00100793          	li	a5,1
    8000649c:	bf1ff06f          	j	8000608c <__printf+0x264>
    800064a0:	00900793          	li	a5,9
    800064a4:	00800c93          	li	s9,8
    800064a8:	be1ff06f          	j	80006088 <__printf+0x260>
    800064ac:	00002517          	auipc	a0,0x2
    800064b0:	17450513          	addi	a0,a0,372 # 80008620 <_ZL6digits+0x158>
    800064b4:	00000097          	auipc	ra,0x0
    800064b8:	918080e7          	jalr	-1768(ra) # 80005dcc <panic>

00000000800064bc <printfinit>:
    800064bc:	fe010113          	addi	sp,sp,-32
    800064c0:	00813823          	sd	s0,16(sp)
    800064c4:	00913423          	sd	s1,8(sp)
    800064c8:	00113c23          	sd	ra,24(sp)
    800064cc:	02010413          	addi	s0,sp,32
    800064d0:	00005497          	auipc	s1,0x5
    800064d4:	be048493          	addi	s1,s1,-1056 # 8000b0b0 <pr>
    800064d8:	00048513          	mv	a0,s1
    800064dc:	00002597          	auipc	a1,0x2
    800064e0:	15458593          	addi	a1,a1,340 # 80008630 <_ZL6digits+0x168>
    800064e4:	00000097          	auipc	ra,0x0
    800064e8:	5f4080e7          	jalr	1524(ra) # 80006ad8 <initlock>
    800064ec:	01813083          	ld	ra,24(sp)
    800064f0:	01013403          	ld	s0,16(sp)
    800064f4:	0004ac23          	sw	zero,24(s1)
    800064f8:	00813483          	ld	s1,8(sp)
    800064fc:	02010113          	addi	sp,sp,32
    80006500:	00008067          	ret

0000000080006504 <uartinit>:
    80006504:	ff010113          	addi	sp,sp,-16
    80006508:	00813423          	sd	s0,8(sp)
    8000650c:	01010413          	addi	s0,sp,16
    80006510:	100007b7          	lui	a5,0x10000
    80006514:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80006518:	f8000713          	li	a4,-128
    8000651c:	00e781a3          	sb	a4,3(a5)
    80006520:	00300713          	li	a4,3
    80006524:	00e78023          	sb	a4,0(a5)
    80006528:	000780a3          	sb	zero,1(a5)
    8000652c:	00e781a3          	sb	a4,3(a5)
    80006530:	00700693          	li	a3,7
    80006534:	00d78123          	sb	a3,2(a5)
    80006538:	00e780a3          	sb	a4,1(a5)
    8000653c:	00813403          	ld	s0,8(sp)
    80006540:	01010113          	addi	sp,sp,16
    80006544:	00008067          	ret

0000000080006548 <uartputc>:
    80006548:	00004797          	auipc	a5,0x4
    8000654c:	8c07a783          	lw	a5,-1856(a5) # 80009e08 <panicked>
    80006550:	00078463          	beqz	a5,80006558 <uartputc+0x10>
    80006554:	0000006f          	j	80006554 <uartputc+0xc>
    80006558:	fd010113          	addi	sp,sp,-48
    8000655c:	02813023          	sd	s0,32(sp)
    80006560:	00913c23          	sd	s1,24(sp)
    80006564:	01213823          	sd	s2,16(sp)
    80006568:	01313423          	sd	s3,8(sp)
    8000656c:	02113423          	sd	ra,40(sp)
    80006570:	03010413          	addi	s0,sp,48
    80006574:	00004917          	auipc	s2,0x4
    80006578:	89c90913          	addi	s2,s2,-1892 # 80009e10 <uart_tx_r>
    8000657c:	00093783          	ld	a5,0(s2)
    80006580:	00004497          	auipc	s1,0x4
    80006584:	89848493          	addi	s1,s1,-1896 # 80009e18 <uart_tx_w>
    80006588:	0004b703          	ld	a4,0(s1)
    8000658c:	02078693          	addi	a3,a5,32
    80006590:	00050993          	mv	s3,a0
    80006594:	02e69c63          	bne	a3,a4,800065cc <uartputc+0x84>
    80006598:	00001097          	auipc	ra,0x1
    8000659c:	834080e7          	jalr	-1996(ra) # 80006dcc <push_on>
    800065a0:	00093783          	ld	a5,0(s2)
    800065a4:	0004b703          	ld	a4,0(s1)
    800065a8:	02078793          	addi	a5,a5,32
    800065ac:	00e79463          	bne	a5,a4,800065b4 <uartputc+0x6c>
    800065b0:	0000006f          	j	800065b0 <uartputc+0x68>
    800065b4:	00001097          	auipc	ra,0x1
    800065b8:	88c080e7          	jalr	-1908(ra) # 80006e40 <pop_on>
    800065bc:	00093783          	ld	a5,0(s2)
    800065c0:	0004b703          	ld	a4,0(s1)
    800065c4:	02078693          	addi	a3,a5,32
    800065c8:	fce688e3          	beq	a3,a4,80006598 <uartputc+0x50>
    800065cc:	01f77693          	andi	a3,a4,31
    800065d0:	00005597          	auipc	a1,0x5
    800065d4:	b0058593          	addi	a1,a1,-1280 # 8000b0d0 <uart_tx_buf>
    800065d8:	00d586b3          	add	a3,a1,a3
    800065dc:	00170713          	addi	a4,a4,1
    800065e0:	01368023          	sb	s3,0(a3)
    800065e4:	00e4b023          	sd	a4,0(s1)
    800065e8:	10000637          	lui	a2,0x10000
    800065ec:	02f71063          	bne	a4,a5,8000660c <uartputc+0xc4>
    800065f0:	0340006f          	j	80006624 <uartputc+0xdc>
    800065f4:	00074703          	lbu	a4,0(a4)
    800065f8:	00f93023          	sd	a5,0(s2)
    800065fc:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80006600:	00093783          	ld	a5,0(s2)
    80006604:	0004b703          	ld	a4,0(s1)
    80006608:	00f70e63          	beq	a4,a5,80006624 <uartputc+0xdc>
    8000660c:	00564683          	lbu	a3,5(a2)
    80006610:	01f7f713          	andi	a4,a5,31
    80006614:	00e58733          	add	a4,a1,a4
    80006618:	0206f693          	andi	a3,a3,32
    8000661c:	00178793          	addi	a5,a5,1
    80006620:	fc069ae3          	bnez	a3,800065f4 <uartputc+0xac>
    80006624:	02813083          	ld	ra,40(sp)
    80006628:	02013403          	ld	s0,32(sp)
    8000662c:	01813483          	ld	s1,24(sp)
    80006630:	01013903          	ld	s2,16(sp)
    80006634:	00813983          	ld	s3,8(sp)
    80006638:	03010113          	addi	sp,sp,48
    8000663c:	00008067          	ret

0000000080006640 <uartputc_sync>:
    80006640:	ff010113          	addi	sp,sp,-16
    80006644:	00813423          	sd	s0,8(sp)
    80006648:	01010413          	addi	s0,sp,16
    8000664c:	00003717          	auipc	a4,0x3
    80006650:	7bc72703          	lw	a4,1980(a4) # 80009e08 <panicked>
    80006654:	02071663          	bnez	a4,80006680 <uartputc_sync+0x40>
    80006658:	00050793          	mv	a5,a0
    8000665c:	100006b7          	lui	a3,0x10000
    80006660:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80006664:	02077713          	andi	a4,a4,32
    80006668:	fe070ce3          	beqz	a4,80006660 <uartputc_sync+0x20>
    8000666c:	0ff7f793          	andi	a5,a5,255
    80006670:	00f68023          	sb	a5,0(a3)
    80006674:	00813403          	ld	s0,8(sp)
    80006678:	01010113          	addi	sp,sp,16
    8000667c:	00008067          	ret
    80006680:	0000006f          	j	80006680 <uartputc_sync+0x40>

0000000080006684 <uartstart>:
    80006684:	ff010113          	addi	sp,sp,-16
    80006688:	00813423          	sd	s0,8(sp)
    8000668c:	01010413          	addi	s0,sp,16
    80006690:	00003617          	auipc	a2,0x3
    80006694:	78060613          	addi	a2,a2,1920 # 80009e10 <uart_tx_r>
    80006698:	00003517          	auipc	a0,0x3
    8000669c:	78050513          	addi	a0,a0,1920 # 80009e18 <uart_tx_w>
    800066a0:	00063783          	ld	a5,0(a2)
    800066a4:	00053703          	ld	a4,0(a0)
    800066a8:	04f70263          	beq	a4,a5,800066ec <uartstart+0x68>
    800066ac:	100005b7          	lui	a1,0x10000
    800066b0:	00005817          	auipc	a6,0x5
    800066b4:	a2080813          	addi	a6,a6,-1504 # 8000b0d0 <uart_tx_buf>
    800066b8:	01c0006f          	j	800066d4 <uartstart+0x50>
    800066bc:	0006c703          	lbu	a4,0(a3)
    800066c0:	00f63023          	sd	a5,0(a2)
    800066c4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800066c8:	00063783          	ld	a5,0(a2)
    800066cc:	00053703          	ld	a4,0(a0)
    800066d0:	00f70e63          	beq	a4,a5,800066ec <uartstart+0x68>
    800066d4:	01f7f713          	andi	a4,a5,31
    800066d8:	00e806b3          	add	a3,a6,a4
    800066dc:	0055c703          	lbu	a4,5(a1)
    800066e0:	00178793          	addi	a5,a5,1
    800066e4:	02077713          	andi	a4,a4,32
    800066e8:	fc071ae3          	bnez	a4,800066bc <uartstart+0x38>
    800066ec:	00813403          	ld	s0,8(sp)
    800066f0:	01010113          	addi	sp,sp,16
    800066f4:	00008067          	ret

00000000800066f8 <uartgetc>:
    800066f8:	ff010113          	addi	sp,sp,-16
    800066fc:	00813423          	sd	s0,8(sp)
    80006700:	01010413          	addi	s0,sp,16
    80006704:	10000737          	lui	a4,0x10000
    80006708:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000670c:	0017f793          	andi	a5,a5,1
    80006710:	00078c63          	beqz	a5,80006728 <uartgetc+0x30>
    80006714:	00074503          	lbu	a0,0(a4)
    80006718:	0ff57513          	andi	a0,a0,255
    8000671c:	00813403          	ld	s0,8(sp)
    80006720:	01010113          	addi	sp,sp,16
    80006724:	00008067          	ret
    80006728:	fff00513          	li	a0,-1
    8000672c:	ff1ff06f          	j	8000671c <uartgetc+0x24>

0000000080006730 <uartintr>:
    80006730:	100007b7          	lui	a5,0x10000
    80006734:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80006738:	0017f793          	andi	a5,a5,1
    8000673c:	0a078463          	beqz	a5,800067e4 <uartintr+0xb4>
    80006740:	fe010113          	addi	sp,sp,-32
    80006744:	00813823          	sd	s0,16(sp)
    80006748:	00913423          	sd	s1,8(sp)
    8000674c:	00113c23          	sd	ra,24(sp)
    80006750:	02010413          	addi	s0,sp,32
    80006754:	100004b7          	lui	s1,0x10000
    80006758:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000675c:	0ff57513          	andi	a0,a0,255
    80006760:	fffff097          	auipc	ra,0xfffff
    80006764:	534080e7          	jalr	1332(ra) # 80005c94 <consoleintr>
    80006768:	0054c783          	lbu	a5,5(s1)
    8000676c:	0017f793          	andi	a5,a5,1
    80006770:	fe0794e3          	bnez	a5,80006758 <uartintr+0x28>
    80006774:	00003617          	auipc	a2,0x3
    80006778:	69c60613          	addi	a2,a2,1692 # 80009e10 <uart_tx_r>
    8000677c:	00003517          	auipc	a0,0x3
    80006780:	69c50513          	addi	a0,a0,1692 # 80009e18 <uart_tx_w>
    80006784:	00063783          	ld	a5,0(a2)
    80006788:	00053703          	ld	a4,0(a0)
    8000678c:	04f70263          	beq	a4,a5,800067d0 <uartintr+0xa0>
    80006790:	100005b7          	lui	a1,0x10000
    80006794:	00005817          	auipc	a6,0x5
    80006798:	93c80813          	addi	a6,a6,-1732 # 8000b0d0 <uart_tx_buf>
    8000679c:	01c0006f          	j	800067b8 <uartintr+0x88>
    800067a0:	0006c703          	lbu	a4,0(a3)
    800067a4:	00f63023          	sd	a5,0(a2)
    800067a8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800067ac:	00063783          	ld	a5,0(a2)
    800067b0:	00053703          	ld	a4,0(a0)
    800067b4:	00f70e63          	beq	a4,a5,800067d0 <uartintr+0xa0>
    800067b8:	01f7f713          	andi	a4,a5,31
    800067bc:	00e806b3          	add	a3,a6,a4
    800067c0:	0055c703          	lbu	a4,5(a1)
    800067c4:	00178793          	addi	a5,a5,1
    800067c8:	02077713          	andi	a4,a4,32
    800067cc:	fc071ae3          	bnez	a4,800067a0 <uartintr+0x70>
    800067d0:	01813083          	ld	ra,24(sp)
    800067d4:	01013403          	ld	s0,16(sp)
    800067d8:	00813483          	ld	s1,8(sp)
    800067dc:	02010113          	addi	sp,sp,32
    800067e0:	00008067          	ret
    800067e4:	00003617          	auipc	a2,0x3
    800067e8:	62c60613          	addi	a2,a2,1580 # 80009e10 <uart_tx_r>
    800067ec:	00003517          	auipc	a0,0x3
    800067f0:	62c50513          	addi	a0,a0,1580 # 80009e18 <uart_tx_w>
    800067f4:	00063783          	ld	a5,0(a2)
    800067f8:	00053703          	ld	a4,0(a0)
    800067fc:	04f70263          	beq	a4,a5,80006840 <uartintr+0x110>
    80006800:	100005b7          	lui	a1,0x10000
    80006804:	00005817          	auipc	a6,0x5
    80006808:	8cc80813          	addi	a6,a6,-1844 # 8000b0d0 <uart_tx_buf>
    8000680c:	01c0006f          	j	80006828 <uartintr+0xf8>
    80006810:	0006c703          	lbu	a4,0(a3)
    80006814:	00f63023          	sd	a5,0(a2)
    80006818:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000681c:	00063783          	ld	a5,0(a2)
    80006820:	00053703          	ld	a4,0(a0)
    80006824:	02f70063          	beq	a4,a5,80006844 <uartintr+0x114>
    80006828:	01f7f713          	andi	a4,a5,31
    8000682c:	00e806b3          	add	a3,a6,a4
    80006830:	0055c703          	lbu	a4,5(a1)
    80006834:	00178793          	addi	a5,a5,1
    80006838:	02077713          	andi	a4,a4,32
    8000683c:	fc071ae3          	bnez	a4,80006810 <uartintr+0xe0>
    80006840:	00008067          	ret
    80006844:	00008067          	ret

0000000080006848 <kinit>:
    80006848:	fc010113          	addi	sp,sp,-64
    8000684c:	02913423          	sd	s1,40(sp)
    80006850:	fffff7b7          	lui	a5,0xfffff
    80006854:	00006497          	auipc	s1,0x6
    80006858:	89b48493          	addi	s1,s1,-1893 # 8000c0ef <end+0xfff>
    8000685c:	02813823          	sd	s0,48(sp)
    80006860:	01313c23          	sd	s3,24(sp)
    80006864:	00f4f4b3          	and	s1,s1,a5
    80006868:	02113c23          	sd	ra,56(sp)
    8000686c:	03213023          	sd	s2,32(sp)
    80006870:	01413823          	sd	s4,16(sp)
    80006874:	01513423          	sd	s5,8(sp)
    80006878:	04010413          	addi	s0,sp,64
    8000687c:	000017b7          	lui	a5,0x1
    80006880:	01100993          	li	s3,17
    80006884:	00f487b3          	add	a5,s1,a5
    80006888:	01b99993          	slli	s3,s3,0x1b
    8000688c:	06f9e063          	bltu	s3,a5,800068ec <kinit+0xa4>
    80006890:	00005a97          	auipc	s5,0x5
    80006894:	860a8a93          	addi	s5,s5,-1952 # 8000b0f0 <end>
    80006898:	0754ec63          	bltu	s1,s5,80006910 <kinit+0xc8>
    8000689c:	0734fa63          	bgeu	s1,s3,80006910 <kinit+0xc8>
    800068a0:	00088a37          	lui	s4,0x88
    800068a4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    800068a8:	00003917          	auipc	s2,0x3
    800068ac:	57890913          	addi	s2,s2,1400 # 80009e20 <kmem>
    800068b0:	00ca1a13          	slli	s4,s4,0xc
    800068b4:	0140006f          	j	800068c8 <kinit+0x80>
    800068b8:	000017b7          	lui	a5,0x1
    800068bc:	00f484b3          	add	s1,s1,a5
    800068c0:	0554e863          	bltu	s1,s5,80006910 <kinit+0xc8>
    800068c4:	0534f663          	bgeu	s1,s3,80006910 <kinit+0xc8>
    800068c8:	00001637          	lui	a2,0x1
    800068cc:	00100593          	li	a1,1
    800068d0:	00048513          	mv	a0,s1
    800068d4:	00000097          	auipc	ra,0x0
    800068d8:	5e4080e7          	jalr	1508(ra) # 80006eb8 <__memset>
    800068dc:	00093783          	ld	a5,0(s2)
    800068e0:	00f4b023          	sd	a5,0(s1)
    800068e4:	00993023          	sd	s1,0(s2)
    800068e8:	fd4498e3          	bne	s1,s4,800068b8 <kinit+0x70>
    800068ec:	03813083          	ld	ra,56(sp)
    800068f0:	03013403          	ld	s0,48(sp)
    800068f4:	02813483          	ld	s1,40(sp)
    800068f8:	02013903          	ld	s2,32(sp)
    800068fc:	01813983          	ld	s3,24(sp)
    80006900:	01013a03          	ld	s4,16(sp)
    80006904:	00813a83          	ld	s5,8(sp)
    80006908:	04010113          	addi	sp,sp,64
    8000690c:	00008067          	ret
    80006910:	00002517          	auipc	a0,0x2
    80006914:	d4050513          	addi	a0,a0,-704 # 80008650 <digits+0x18>
    80006918:	fffff097          	auipc	ra,0xfffff
    8000691c:	4b4080e7          	jalr	1204(ra) # 80005dcc <panic>

0000000080006920 <freerange>:
    80006920:	fc010113          	addi	sp,sp,-64
    80006924:	000017b7          	lui	a5,0x1
    80006928:	02913423          	sd	s1,40(sp)
    8000692c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80006930:	009504b3          	add	s1,a0,s1
    80006934:	fffff537          	lui	a0,0xfffff
    80006938:	02813823          	sd	s0,48(sp)
    8000693c:	02113c23          	sd	ra,56(sp)
    80006940:	03213023          	sd	s2,32(sp)
    80006944:	01313c23          	sd	s3,24(sp)
    80006948:	01413823          	sd	s4,16(sp)
    8000694c:	01513423          	sd	s5,8(sp)
    80006950:	01613023          	sd	s6,0(sp)
    80006954:	04010413          	addi	s0,sp,64
    80006958:	00a4f4b3          	and	s1,s1,a0
    8000695c:	00f487b3          	add	a5,s1,a5
    80006960:	06f5e463          	bltu	a1,a5,800069c8 <freerange+0xa8>
    80006964:	00004a97          	auipc	s5,0x4
    80006968:	78ca8a93          	addi	s5,s5,1932 # 8000b0f0 <end>
    8000696c:	0954e263          	bltu	s1,s5,800069f0 <freerange+0xd0>
    80006970:	01100993          	li	s3,17
    80006974:	01b99993          	slli	s3,s3,0x1b
    80006978:	0734fc63          	bgeu	s1,s3,800069f0 <freerange+0xd0>
    8000697c:	00058a13          	mv	s4,a1
    80006980:	00003917          	auipc	s2,0x3
    80006984:	4a090913          	addi	s2,s2,1184 # 80009e20 <kmem>
    80006988:	00002b37          	lui	s6,0x2
    8000698c:	0140006f          	j	800069a0 <freerange+0x80>
    80006990:	000017b7          	lui	a5,0x1
    80006994:	00f484b3          	add	s1,s1,a5
    80006998:	0554ec63          	bltu	s1,s5,800069f0 <freerange+0xd0>
    8000699c:	0534fa63          	bgeu	s1,s3,800069f0 <freerange+0xd0>
    800069a0:	00001637          	lui	a2,0x1
    800069a4:	00100593          	li	a1,1
    800069a8:	00048513          	mv	a0,s1
    800069ac:	00000097          	auipc	ra,0x0
    800069b0:	50c080e7          	jalr	1292(ra) # 80006eb8 <__memset>
    800069b4:	00093703          	ld	a4,0(s2)
    800069b8:	016487b3          	add	a5,s1,s6
    800069bc:	00e4b023          	sd	a4,0(s1)
    800069c0:	00993023          	sd	s1,0(s2)
    800069c4:	fcfa76e3          	bgeu	s4,a5,80006990 <freerange+0x70>
    800069c8:	03813083          	ld	ra,56(sp)
    800069cc:	03013403          	ld	s0,48(sp)
    800069d0:	02813483          	ld	s1,40(sp)
    800069d4:	02013903          	ld	s2,32(sp)
    800069d8:	01813983          	ld	s3,24(sp)
    800069dc:	01013a03          	ld	s4,16(sp)
    800069e0:	00813a83          	ld	s5,8(sp)
    800069e4:	00013b03          	ld	s6,0(sp)
    800069e8:	04010113          	addi	sp,sp,64
    800069ec:	00008067          	ret
    800069f0:	00002517          	auipc	a0,0x2
    800069f4:	c6050513          	addi	a0,a0,-928 # 80008650 <digits+0x18>
    800069f8:	fffff097          	auipc	ra,0xfffff
    800069fc:	3d4080e7          	jalr	980(ra) # 80005dcc <panic>

0000000080006a00 <kfree>:
    80006a00:	fe010113          	addi	sp,sp,-32
    80006a04:	00813823          	sd	s0,16(sp)
    80006a08:	00113c23          	sd	ra,24(sp)
    80006a0c:	00913423          	sd	s1,8(sp)
    80006a10:	02010413          	addi	s0,sp,32
    80006a14:	03451793          	slli	a5,a0,0x34
    80006a18:	04079c63          	bnez	a5,80006a70 <kfree+0x70>
    80006a1c:	00004797          	auipc	a5,0x4
    80006a20:	6d478793          	addi	a5,a5,1748 # 8000b0f0 <end>
    80006a24:	00050493          	mv	s1,a0
    80006a28:	04f56463          	bltu	a0,a5,80006a70 <kfree+0x70>
    80006a2c:	01100793          	li	a5,17
    80006a30:	01b79793          	slli	a5,a5,0x1b
    80006a34:	02f57e63          	bgeu	a0,a5,80006a70 <kfree+0x70>
    80006a38:	00001637          	lui	a2,0x1
    80006a3c:	00100593          	li	a1,1
    80006a40:	00000097          	auipc	ra,0x0
    80006a44:	478080e7          	jalr	1144(ra) # 80006eb8 <__memset>
    80006a48:	00003797          	auipc	a5,0x3
    80006a4c:	3d878793          	addi	a5,a5,984 # 80009e20 <kmem>
    80006a50:	0007b703          	ld	a4,0(a5)
    80006a54:	01813083          	ld	ra,24(sp)
    80006a58:	01013403          	ld	s0,16(sp)
    80006a5c:	00e4b023          	sd	a4,0(s1)
    80006a60:	0097b023          	sd	s1,0(a5)
    80006a64:	00813483          	ld	s1,8(sp)
    80006a68:	02010113          	addi	sp,sp,32
    80006a6c:	00008067          	ret
    80006a70:	00002517          	auipc	a0,0x2
    80006a74:	be050513          	addi	a0,a0,-1056 # 80008650 <digits+0x18>
    80006a78:	fffff097          	auipc	ra,0xfffff
    80006a7c:	354080e7          	jalr	852(ra) # 80005dcc <panic>

0000000080006a80 <kalloc>:
    80006a80:	fe010113          	addi	sp,sp,-32
    80006a84:	00813823          	sd	s0,16(sp)
    80006a88:	00913423          	sd	s1,8(sp)
    80006a8c:	00113c23          	sd	ra,24(sp)
    80006a90:	02010413          	addi	s0,sp,32
    80006a94:	00003797          	auipc	a5,0x3
    80006a98:	38c78793          	addi	a5,a5,908 # 80009e20 <kmem>
    80006a9c:	0007b483          	ld	s1,0(a5)
    80006aa0:	02048063          	beqz	s1,80006ac0 <kalloc+0x40>
    80006aa4:	0004b703          	ld	a4,0(s1)
    80006aa8:	00001637          	lui	a2,0x1
    80006aac:	00500593          	li	a1,5
    80006ab0:	00048513          	mv	a0,s1
    80006ab4:	00e7b023          	sd	a4,0(a5)
    80006ab8:	00000097          	auipc	ra,0x0
    80006abc:	400080e7          	jalr	1024(ra) # 80006eb8 <__memset>
    80006ac0:	01813083          	ld	ra,24(sp)
    80006ac4:	01013403          	ld	s0,16(sp)
    80006ac8:	00048513          	mv	a0,s1
    80006acc:	00813483          	ld	s1,8(sp)
    80006ad0:	02010113          	addi	sp,sp,32
    80006ad4:	00008067          	ret

0000000080006ad8 <initlock>:
    80006ad8:	ff010113          	addi	sp,sp,-16
    80006adc:	00813423          	sd	s0,8(sp)
    80006ae0:	01010413          	addi	s0,sp,16
    80006ae4:	00813403          	ld	s0,8(sp)
    80006ae8:	00b53423          	sd	a1,8(a0)
    80006aec:	00052023          	sw	zero,0(a0)
    80006af0:	00053823          	sd	zero,16(a0)
    80006af4:	01010113          	addi	sp,sp,16
    80006af8:	00008067          	ret

0000000080006afc <acquire>:
    80006afc:	fe010113          	addi	sp,sp,-32
    80006b00:	00813823          	sd	s0,16(sp)
    80006b04:	00913423          	sd	s1,8(sp)
    80006b08:	00113c23          	sd	ra,24(sp)
    80006b0c:	01213023          	sd	s2,0(sp)
    80006b10:	02010413          	addi	s0,sp,32
    80006b14:	00050493          	mv	s1,a0
    80006b18:	10002973          	csrr	s2,sstatus
    80006b1c:	100027f3          	csrr	a5,sstatus
    80006b20:	ffd7f793          	andi	a5,a5,-3
    80006b24:	10079073          	csrw	sstatus,a5
    80006b28:	fffff097          	auipc	ra,0xfffff
    80006b2c:	8e4080e7          	jalr	-1820(ra) # 8000540c <mycpu>
    80006b30:	07852783          	lw	a5,120(a0)
    80006b34:	06078e63          	beqz	a5,80006bb0 <acquire+0xb4>
    80006b38:	fffff097          	auipc	ra,0xfffff
    80006b3c:	8d4080e7          	jalr	-1836(ra) # 8000540c <mycpu>
    80006b40:	07852783          	lw	a5,120(a0)
    80006b44:	0004a703          	lw	a4,0(s1)
    80006b48:	0017879b          	addiw	a5,a5,1
    80006b4c:	06f52c23          	sw	a5,120(a0)
    80006b50:	04071063          	bnez	a4,80006b90 <acquire+0x94>
    80006b54:	00100713          	li	a4,1
    80006b58:	00070793          	mv	a5,a4
    80006b5c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80006b60:	0007879b          	sext.w	a5,a5
    80006b64:	fe079ae3          	bnez	a5,80006b58 <acquire+0x5c>
    80006b68:	0ff0000f          	fence
    80006b6c:	fffff097          	auipc	ra,0xfffff
    80006b70:	8a0080e7          	jalr	-1888(ra) # 8000540c <mycpu>
    80006b74:	01813083          	ld	ra,24(sp)
    80006b78:	01013403          	ld	s0,16(sp)
    80006b7c:	00a4b823          	sd	a0,16(s1)
    80006b80:	00013903          	ld	s2,0(sp)
    80006b84:	00813483          	ld	s1,8(sp)
    80006b88:	02010113          	addi	sp,sp,32
    80006b8c:	00008067          	ret
    80006b90:	0104b903          	ld	s2,16(s1)
    80006b94:	fffff097          	auipc	ra,0xfffff
    80006b98:	878080e7          	jalr	-1928(ra) # 8000540c <mycpu>
    80006b9c:	faa91ce3          	bne	s2,a0,80006b54 <acquire+0x58>
    80006ba0:	00002517          	auipc	a0,0x2
    80006ba4:	ab850513          	addi	a0,a0,-1352 # 80008658 <digits+0x20>
    80006ba8:	fffff097          	auipc	ra,0xfffff
    80006bac:	224080e7          	jalr	548(ra) # 80005dcc <panic>
    80006bb0:	00195913          	srli	s2,s2,0x1
    80006bb4:	fffff097          	auipc	ra,0xfffff
    80006bb8:	858080e7          	jalr	-1960(ra) # 8000540c <mycpu>
    80006bbc:	00197913          	andi	s2,s2,1
    80006bc0:	07252e23          	sw	s2,124(a0)
    80006bc4:	f75ff06f          	j	80006b38 <acquire+0x3c>

0000000080006bc8 <release>:
    80006bc8:	fe010113          	addi	sp,sp,-32
    80006bcc:	00813823          	sd	s0,16(sp)
    80006bd0:	00113c23          	sd	ra,24(sp)
    80006bd4:	00913423          	sd	s1,8(sp)
    80006bd8:	01213023          	sd	s2,0(sp)
    80006bdc:	02010413          	addi	s0,sp,32
    80006be0:	00052783          	lw	a5,0(a0)
    80006be4:	00079a63          	bnez	a5,80006bf8 <release+0x30>
    80006be8:	00002517          	auipc	a0,0x2
    80006bec:	a7850513          	addi	a0,a0,-1416 # 80008660 <digits+0x28>
    80006bf0:	fffff097          	auipc	ra,0xfffff
    80006bf4:	1dc080e7          	jalr	476(ra) # 80005dcc <panic>
    80006bf8:	01053903          	ld	s2,16(a0)
    80006bfc:	00050493          	mv	s1,a0
    80006c00:	fffff097          	auipc	ra,0xfffff
    80006c04:	80c080e7          	jalr	-2036(ra) # 8000540c <mycpu>
    80006c08:	fea910e3          	bne	s2,a0,80006be8 <release+0x20>
    80006c0c:	0004b823          	sd	zero,16(s1)
    80006c10:	0ff0000f          	fence
    80006c14:	0f50000f          	fence	iorw,ow
    80006c18:	0804a02f          	amoswap.w	zero,zero,(s1)
    80006c1c:	ffffe097          	auipc	ra,0xffffe
    80006c20:	7f0080e7          	jalr	2032(ra) # 8000540c <mycpu>
    80006c24:	100027f3          	csrr	a5,sstatus
    80006c28:	0027f793          	andi	a5,a5,2
    80006c2c:	04079a63          	bnez	a5,80006c80 <release+0xb8>
    80006c30:	07852783          	lw	a5,120(a0)
    80006c34:	02f05e63          	blez	a5,80006c70 <release+0xa8>
    80006c38:	fff7871b          	addiw	a4,a5,-1
    80006c3c:	06e52c23          	sw	a4,120(a0)
    80006c40:	00071c63          	bnez	a4,80006c58 <release+0x90>
    80006c44:	07c52783          	lw	a5,124(a0)
    80006c48:	00078863          	beqz	a5,80006c58 <release+0x90>
    80006c4c:	100027f3          	csrr	a5,sstatus
    80006c50:	0027e793          	ori	a5,a5,2
    80006c54:	10079073          	csrw	sstatus,a5
    80006c58:	01813083          	ld	ra,24(sp)
    80006c5c:	01013403          	ld	s0,16(sp)
    80006c60:	00813483          	ld	s1,8(sp)
    80006c64:	00013903          	ld	s2,0(sp)
    80006c68:	02010113          	addi	sp,sp,32
    80006c6c:	00008067          	ret
    80006c70:	00002517          	auipc	a0,0x2
    80006c74:	a1050513          	addi	a0,a0,-1520 # 80008680 <digits+0x48>
    80006c78:	fffff097          	auipc	ra,0xfffff
    80006c7c:	154080e7          	jalr	340(ra) # 80005dcc <panic>
    80006c80:	00002517          	auipc	a0,0x2
    80006c84:	9e850513          	addi	a0,a0,-1560 # 80008668 <digits+0x30>
    80006c88:	fffff097          	auipc	ra,0xfffff
    80006c8c:	144080e7          	jalr	324(ra) # 80005dcc <panic>

0000000080006c90 <holding>:
    80006c90:	00052783          	lw	a5,0(a0)
    80006c94:	00079663          	bnez	a5,80006ca0 <holding+0x10>
    80006c98:	00000513          	li	a0,0
    80006c9c:	00008067          	ret
    80006ca0:	fe010113          	addi	sp,sp,-32
    80006ca4:	00813823          	sd	s0,16(sp)
    80006ca8:	00913423          	sd	s1,8(sp)
    80006cac:	00113c23          	sd	ra,24(sp)
    80006cb0:	02010413          	addi	s0,sp,32
    80006cb4:	01053483          	ld	s1,16(a0)
    80006cb8:	ffffe097          	auipc	ra,0xffffe
    80006cbc:	754080e7          	jalr	1876(ra) # 8000540c <mycpu>
    80006cc0:	01813083          	ld	ra,24(sp)
    80006cc4:	01013403          	ld	s0,16(sp)
    80006cc8:	40a48533          	sub	a0,s1,a0
    80006ccc:	00153513          	seqz	a0,a0
    80006cd0:	00813483          	ld	s1,8(sp)
    80006cd4:	02010113          	addi	sp,sp,32
    80006cd8:	00008067          	ret

0000000080006cdc <push_off>:
    80006cdc:	fe010113          	addi	sp,sp,-32
    80006ce0:	00813823          	sd	s0,16(sp)
    80006ce4:	00113c23          	sd	ra,24(sp)
    80006ce8:	00913423          	sd	s1,8(sp)
    80006cec:	02010413          	addi	s0,sp,32
    80006cf0:	100024f3          	csrr	s1,sstatus
    80006cf4:	100027f3          	csrr	a5,sstatus
    80006cf8:	ffd7f793          	andi	a5,a5,-3
    80006cfc:	10079073          	csrw	sstatus,a5
    80006d00:	ffffe097          	auipc	ra,0xffffe
    80006d04:	70c080e7          	jalr	1804(ra) # 8000540c <mycpu>
    80006d08:	07852783          	lw	a5,120(a0)
    80006d0c:	02078663          	beqz	a5,80006d38 <push_off+0x5c>
    80006d10:	ffffe097          	auipc	ra,0xffffe
    80006d14:	6fc080e7          	jalr	1788(ra) # 8000540c <mycpu>
    80006d18:	07852783          	lw	a5,120(a0)
    80006d1c:	01813083          	ld	ra,24(sp)
    80006d20:	01013403          	ld	s0,16(sp)
    80006d24:	0017879b          	addiw	a5,a5,1
    80006d28:	06f52c23          	sw	a5,120(a0)
    80006d2c:	00813483          	ld	s1,8(sp)
    80006d30:	02010113          	addi	sp,sp,32
    80006d34:	00008067          	ret
    80006d38:	0014d493          	srli	s1,s1,0x1
    80006d3c:	ffffe097          	auipc	ra,0xffffe
    80006d40:	6d0080e7          	jalr	1744(ra) # 8000540c <mycpu>
    80006d44:	0014f493          	andi	s1,s1,1
    80006d48:	06952e23          	sw	s1,124(a0)
    80006d4c:	fc5ff06f          	j	80006d10 <push_off+0x34>

0000000080006d50 <pop_off>:
    80006d50:	ff010113          	addi	sp,sp,-16
    80006d54:	00813023          	sd	s0,0(sp)
    80006d58:	00113423          	sd	ra,8(sp)
    80006d5c:	01010413          	addi	s0,sp,16
    80006d60:	ffffe097          	auipc	ra,0xffffe
    80006d64:	6ac080e7          	jalr	1708(ra) # 8000540c <mycpu>
    80006d68:	100027f3          	csrr	a5,sstatus
    80006d6c:	0027f793          	andi	a5,a5,2
    80006d70:	04079663          	bnez	a5,80006dbc <pop_off+0x6c>
    80006d74:	07852783          	lw	a5,120(a0)
    80006d78:	02f05a63          	blez	a5,80006dac <pop_off+0x5c>
    80006d7c:	fff7871b          	addiw	a4,a5,-1
    80006d80:	06e52c23          	sw	a4,120(a0)
    80006d84:	00071c63          	bnez	a4,80006d9c <pop_off+0x4c>
    80006d88:	07c52783          	lw	a5,124(a0)
    80006d8c:	00078863          	beqz	a5,80006d9c <pop_off+0x4c>
    80006d90:	100027f3          	csrr	a5,sstatus
    80006d94:	0027e793          	ori	a5,a5,2
    80006d98:	10079073          	csrw	sstatus,a5
    80006d9c:	00813083          	ld	ra,8(sp)
    80006da0:	00013403          	ld	s0,0(sp)
    80006da4:	01010113          	addi	sp,sp,16
    80006da8:	00008067          	ret
    80006dac:	00002517          	auipc	a0,0x2
    80006db0:	8d450513          	addi	a0,a0,-1836 # 80008680 <digits+0x48>
    80006db4:	fffff097          	auipc	ra,0xfffff
    80006db8:	018080e7          	jalr	24(ra) # 80005dcc <panic>
    80006dbc:	00002517          	auipc	a0,0x2
    80006dc0:	8ac50513          	addi	a0,a0,-1876 # 80008668 <digits+0x30>
    80006dc4:	fffff097          	auipc	ra,0xfffff
    80006dc8:	008080e7          	jalr	8(ra) # 80005dcc <panic>

0000000080006dcc <push_on>:
    80006dcc:	fe010113          	addi	sp,sp,-32
    80006dd0:	00813823          	sd	s0,16(sp)
    80006dd4:	00113c23          	sd	ra,24(sp)
    80006dd8:	00913423          	sd	s1,8(sp)
    80006ddc:	02010413          	addi	s0,sp,32
    80006de0:	100024f3          	csrr	s1,sstatus
    80006de4:	100027f3          	csrr	a5,sstatus
    80006de8:	0027e793          	ori	a5,a5,2
    80006dec:	10079073          	csrw	sstatus,a5
    80006df0:	ffffe097          	auipc	ra,0xffffe
    80006df4:	61c080e7          	jalr	1564(ra) # 8000540c <mycpu>
    80006df8:	07852783          	lw	a5,120(a0)
    80006dfc:	02078663          	beqz	a5,80006e28 <push_on+0x5c>
    80006e00:	ffffe097          	auipc	ra,0xffffe
    80006e04:	60c080e7          	jalr	1548(ra) # 8000540c <mycpu>
    80006e08:	07852783          	lw	a5,120(a0)
    80006e0c:	01813083          	ld	ra,24(sp)
    80006e10:	01013403          	ld	s0,16(sp)
    80006e14:	0017879b          	addiw	a5,a5,1
    80006e18:	06f52c23          	sw	a5,120(a0)
    80006e1c:	00813483          	ld	s1,8(sp)
    80006e20:	02010113          	addi	sp,sp,32
    80006e24:	00008067          	ret
    80006e28:	0014d493          	srli	s1,s1,0x1
    80006e2c:	ffffe097          	auipc	ra,0xffffe
    80006e30:	5e0080e7          	jalr	1504(ra) # 8000540c <mycpu>
    80006e34:	0014f493          	andi	s1,s1,1
    80006e38:	06952e23          	sw	s1,124(a0)
    80006e3c:	fc5ff06f          	j	80006e00 <push_on+0x34>

0000000080006e40 <pop_on>:
    80006e40:	ff010113          	addi	sp,sp,-16
    80006e44:	00813023          	sd	s0,0(sp)
    80006e48:	00113423          	sd	ra,8(sp)
    80006e4c:	01010413          	addi	s0,sp,16
    80006e50:	ffffe097          	auipc	ra,0xffffe
    80006e54:	5bc080e7          	jalr	1468(ra) # 8000540c <mycpu>
    80006e58:	100027f3          	csrr	a5,sstatus
    80006e5c:	0027f793          	andi	a5,a5,2
    80006e60:	04078463          	beqz	a5,80006ea8 <pop_on+0x68>
    80006e64:	07852783          	lw	a5,120(a0)
    80006e68:	02f05863          	blez	a5,80006e98 <pop_on+0x58>
    80006e6c:	fff7879b          	addiw	a5,a5,-1
    80006e70:	06f52c23          	sw	a5,120(a0)
    80006e74:	07853783          	ld	a5,120(a0)
    80006e78:	00079863          	bnez	a5,80006e88 <pop_on+0x48>
    80006e7c:	100027f3          	csrr	a5,sstatus
    80006e80:	ffd7f793          	andi	a5,a5,-3
    80006e84:	10079073          	csrw	sstatus,a5
    80006e88:	00813083          	ld	ra,8(sp)
    80006e8c:	00013403          	ld	s0,0(sp)
    80006e90:	01010113          	addi	sp,sp,16
    80006e94:	00008067          	ret
    80006e98:	00002517          	auipc	a0,0x2
    80006e9c:	81050513          	addi	a0,a0,-2032 # 800086a8 <digits+0x70>
    80006ea0:	fffff097          	auipc	ra,0xfffff
    80006ea4:	f2c080e7          	jalr	-212(ra) # 80005dcc <panic>
    80006ea8:	00001517          	auipc	a0,0x1
    80006eac:	7e050513          	addi	a0,a0,2016 # 80008688 <digits+0x50>
    80006eb0:	fffff097          	auipc	ra,0xfffff
    80006eb4:	f1c080e7          	jalr	-228(ra) # 80005dcc <panic>

0000000080006eb8 <__memset>:
    80006eb8:	ff010113          	addi	sp,sp,-16
    80006ebc:	00813423          	sd	s0,8(sp)
    80006ec0:	01010413          	addi	s0,sp,16
    80006ec4:	1a060e63          	beqz	a2,80007080 <__memset+0x1c8>
    80006ec8:	40a007b3          	neg	a5,a0
    80006ecc:	0077f793          	andi	a5,a5,7
    80006ed0:	00778693          	addi	a3,a5,7
    80006ed4:	00b00813          	li	a6,11
    80006ed8:	0ff5f593          	andi	a1,a1,255
    80006edc:	fff6071b          	addiw	a4,a2,-1
    80006ee0:	1b06e663          	bltu	a3,a6,8000708c <__memset+0x1d4>
    80006ee4:	1cd76463          	bltu	a4,a3,800070ac <__memset+0x1f4>
    80006ee8:	1a078e63          	beqz	a5,800070a4 <__memset+0x1ec>
    80006eec:	00b50023          	sb	a1,0(a0)
    80006ef0:	00100713          	li	a4,1
    80006ef4:	1ae78463          	beq	a5,a4,8000709c <__memset+0x1e4>
    80006ef8:	00b500a3          	sb	a1,1(a0)
    80006efc:	00200713          	li	a4,2
    80006f00:	1ae78a63          	beq	a5,a4,800070b4 <__memset+0x1fc>
    80006f04:	00b50123          	sb	a1,2(a0)
    80006f08:	00300713          	li	a4,3
    80006f0c:	18e78463          	beq	a5,a4,80007094 <__memset+0x1dc>
    80006f10:	00b501a3          	sb	a1,3(a0)
    80006f14:	00400713          	li	a4,4
    80006f18:	1ae78263          	beq	a5,a4,800070bc <__memset+0x204>
    80006f1c:	00b50223          	sb	a1,4(a0)
    80006f20:	00500713          	li	a4,5
    80006f24:	1ae78063          	beq	a5,a4,800070c4 <__memset+0x20c>
    80006f28:	00b502a3          	sb	a1,5(a0)
    80006f2c:	00700713          	li	a4,7
    80006f30:	18e79e63          	bne	a5,a4,800070cc <__memset+0x214>
    80006f34:	00b50323          	sb	a1,6(a0)
    80006f38:	00700e93          	li	t4,7
    80006f3c:	00859713          	slli	a4,a1,0x8
    80006f40:	00e5e733          	or	a4,a1,a4
    80006f44:	01059e13          	slli	t3,a1,0x10
    80006f48:	01c76e33          	or	t3,a4,t3
    80006f4c:	01859313          	slli	t1,a1,0x18
    80006f50:	006e6333          	or	t1,t3,t1
    80006f54:	02059893          	slli	a7,a1,0x20
    80006f58:	40f60e3b          	subw	t3,a2,a5
    80006f5c:	011368b3          	or	a7,t1,a7
    80006f60:	02859813          	slli	a6,a1,0x28
    80006f64:	0108e833          	or	a6,a7,a6
    80006f68:	03059693          	slli	a3,a1,0x30
    80006f6c:	003e589b          	srliw	a7,t3,0x3
    80006f70:	00d866b3          	or	a3,a6,a3
    80006f74:	03859713          	slli	a4,a1,0x38
    80006f78:	00389813          	slli	a6,a7,0x3
    80006f7c:	00f507b3          	add	a5,a0,a5
    80006f80:	00e6e733          	or	a4,a3,a4
    80006f84:	000e089b          	sext.w	a7,t3
    80006f88:	00f806b3          	add	a3,a6,a5
    80006f8c:	00e7b023          	sd	a4,0(a5)
    80006f90:	00878793          	addi	a5,a5,8
    80006f94:	fed79ce3          	bne	a5,a3,80006f8c <__memset+0xd4>
    80006f98:	ff8e7793          	andi	a5,t3,-8
    80006f9c:	0007871b          	sext.w	a4,a5
    80006fa0:	01d787bb          	addw	a5,a5,t4
    80006fa4:	0ce88e63          	beq	a7,a4,80007080 <__memset+0x1c8>
    80006fa8:	00f50733          	add	a4,a0,a5
    80006fac:	00b70023          	sb	a1,0(a4)
    80006fb0:	0017871b          	addiw	a4,a5,1
    80006fb4:	0cc77663          	bgeu	a4,a2,80007080 <__memset+0x1c8>
    80006fb8:	00e50733          	add	a4,a0,a4
    80006fbc:	00b70023          	sb	a1,0(a4)
    80006fc0:	0027871b          	addiw	a4,a5,2
    80006fc4:	0ac77e63          	bgeu	a4,a2,80007080 <__memset+0x1c8>
    80006fc8:	00e50733          	add	a4,a0,a4
    80006fcc:	00b70023          	sb	a1,0(a4)
    80006fd0:	0037871b          	addiw	a4,a5,3
    80006fd4:	0ac77663          	bgeu	a4,a2,80007080 <__memset+0x1c8>
    80006fd8:	00e50733          	add	a4,a0,a4
    80006fdc:	00b70023          	sb	a1,0(a4)
    80006fe0:	0047871b          	addiw	a4,a5,4
    80006fe4:	08c77e63          	bgeu	a4,a2,80007080 <__memset+0x1c8>
    80006fe8:	00e50733          	add	a4,a0,a4
    80006fec:	00b70023          	sb	a1,0(a4)
    80006ff0:	0057871b          	addiw	a4,a5,5
    80006ff4:	08c77663          	bgeu	a4,a2,80007080 <__memset+0x1c8>
    80006ff8:	00e50733          	add	a4,a0,a4
    80006ffc:	00b70023          	sb	a1,0(a4)
    80007000:	0067871b          	addiw	a4,a5,6
    80007004:	06c77e63          	bgeu	a4,a2,80007080 <__memset+0x1c8>
    80007008:	00e50733          	add	a4,a0,a4
    8000700c:	00b70023          	sb	a1,0(a4)
    80007010:	0077871b          	addiw	a4,a5,7
    80007014:	06c77663          	bgeu	a4,a2,80007080 <__memset+0x1c8>
    80007018:	00e50733          	add	a4,a0,a4
    8000701c:	00b70023          	sb	a1,0(a4)
    80007020:	0087871b          	addiw	a4,a5,8
    80007024:	04c77e63          	bgeu	a4,a2,80007080 <__memset+0x1c8>
    80007028:	00e50733          	add	a4,a0,a4
    8000702c:	00b70023          	sb	a1,0(a4)
    80007030:	0097871b          	addiw	a4,a5,9
    80007034:	04c77663          	bgeu	a4,a2,80007080 <__memset+0x1c8>
    80007038:	00e50733          	add	a4,a0,a4
    8000703c:	00b70023          	sb	a1,0(a4)
    80007040:	00a7871b          	addiw	a4,a5,10
    80007044:	02c77e63          	bgeu	a4,a2,80007080 <__memset+0x1c8>
    80007048:	00e50733          	add	a4,a0,a4
    8000704c:	00b70023          	sb	a1,0(a4)
    80007050:	00b7871b          	addiw	a4,a5,11
    80007054:	02c77663          	bgeu	a4,a2,80007080 <__memset+0x1c8>
    80007058:	00e50733          	add	a4,a0,a4
    8000705c:	00b70023          	sb	a1,0(a4)
    80007060:	00c7871b          	addiw	a4,a5,12
    80007064:	00c77e63          	bgeu	a4,a2,80007080 <__memset+0x1c8>
    80007068:	00e50733          	add	a4,a0,a4
    8000706c:	00b70023          	sb	a1,0(a4)
    80007070:	00d7879b          	addiw	a5,a5,13
    80007074:	00c7f663          	bgeu	a5,a2,80007080 <__memset+0x1c8>
    80007078:	00f507b3          	add	a5,a0,a5
    8000707c:	00b78023          	sb	a1,0(a5)
    80007080:	00813403          	ld	s0,8(sp)
    80007084:	01010113          	addi	sp,sp,16
    80007088:	00008067          	ret
    8000708c:	00b00693          	li	a3,11
    80007090:	e55ff06f          	j	80006ee4 <__memset+0x2c>
    80007094:	00300e93          	li	t4,3
    80007098:	ea5ff06f          	j	80006f3c <__memset+0x84>
    8000709c:	00100e93          	li	t4,1
    800070a0:	e9dff06f          	j	80006f3c <__memset+0x84>
    800070a4:	00000e93          	li	t4,0
    800070a8:	e95ff06f          	j	80006f3c <__memset+0x84>
    800070ac:	00000793          	li	a5,0
    800070b0:	ef9ff06f          	j	80006fa8 <__memset+0xf0>
    800070b4:	00200e93          	li	t4,2
    800070b8:	e85ff06f          	j	80006f3c <__memset+0x84>
    800070bc:	00400e93          	li	t4,4
    800070c0:	e7dff06f          	j	80006f3c <__memset+0x84>
    800070c4:	00500e93          	li	t4,5
    800070c8:	e75ff06f          	j	80006f3c <__memset+0x84>
    800070cc:	00600e93          	li	t4,6
    800070d0:	e6dff06f          	j	80006f3c <__memset+0x84>

00000000800070d4 <__memmove>:
    800070d4:	ff010113          	addi	sp,sp,-16
    800070d8:	00813423          	sd	s0,8(sp)
    800070dc:	01010413          	addi	s0,sp,16
    800070e0:	0e060863          	beqz	a2,800071d0 <__memmove+0xfc>
    800070e4:	fff6069b          	addiw	a3,a2,-1
    800070e8:	0006881b          	sext.w	a6,a3
    800070ec:	0ea5e863          	bltu	a1,a0,800071dc <__memmove+0x108>
    800070f0:	00758713          	addi	a4,a1,7
    800070f4:	00a5e7b3          	or	a5,a1,a0
    800070f8:	40a70733          	sub	a4,a4,a0
    800070fc:	0077f793          	andi	a5,a5,7
    80007100:	00f73713          	sltiu	a4,a4,15
    80007104:	00174713          	xori	a4,a4,1
    80007108:	0017b793          	seqz	a5,a5
    8000710c:	00e7f7b3          	and	a5,a5,a4
    80007110:	10078863          	beqz	a5,80007220 <__memmove+0x14c>
    80007114:	00900793          	li	a5,9
    80007118:	1107f463          	bgeu	a5,a6,80007220 <__memmove+0x14c>
    8000711c:	0036581b          	srliw	a6,a2,0x3
    80007120:	fff8081b          	addiw	a6,a6,-1
    80007124:	02081813          	slli	a6,a6,0x20
    80007128:	01d85893          	srli	a7,a6,0x1d
    8000712c:	00858813          	addi	a6,a1,8
    80007130:	00058793          	mv	a5,a1
    80007134:	00050713          	mv	a4,a0
    80007138:	01088833          	add	a6,a7,a6
    8000713c:	0007b883          	ld	a7,0(a5)
    80007140:	00878793          	addi	a5,a5,8
    80007144:	00870713          	addi	a4,a4,8
    80007148:	ff173c23          	sd	a7,-8(a4)
    8000714c:	ff0798e3          	bne	a5,a6,8000713c <__memmove+0x68>
    80007150:	ff867713          	andi	a4,a2,-8
    80007154:	02071793          	slli	a5,a4,0x20
    80007158:	0207d793          	srli	a5,a5,0x20
    8000715c:	00f585b3          	add	a1,a1,a5
    80007160:	40e686bb          	subw	a3,a3,a4
    80007164:	00f507b3          	add	a5,a0,a5
    80007168:	06e60463          	beq	a2,a4,800071d0 <__memmove+0xfc>
    8000716c:	0005c703          	lbu	a4,0(a1)
    80007170:	00e78023          	sb	a4,0(a5)
    80007174:	04068e63          	beqz	a3,800071d0 <__memmove+0xfc>
    80007178:	0015c603          	lbu	a2,1(a1)
    8000717c:	00100713          	li	a4,1
    80007180:	00c780a3          	sb	a2,1(a5)
    80007184:	04e68663          	beq	a3,a4,800071d0 <__memmove+0xfc>
    80007188:	0025c603          	lbu	a2,2(a1)
    8000718c:	00200713          	li	a4,2
    80007190:	00c78123          	sb	a2,2(a5)
    80007194:	02e68e63          	beq	a3,a4,800071d0 <__memmove+0xfc>
    80007198:	0035c603          	lbu	a2,3(a1)
    8000719c:	00300713          	li	a4,3
    800071a0:	00c781a3          	sb	a2,3(a5)
    800071a4:	02e68663          	beq	a3,a4,800071d0 <__memmove+0xfc>
    800071a8:	0045c603          	lbu	a2,4(a1)
    800071ac:	00400713          	li	a4,4
    800071b0:	00c78223          	sb	a2,4(a5)
    800071b4:	00e68e63          	beq	a3,a4,800071d0 <__memmove+0xfc>
    800071b8:	0055c603          	lbu	a2,5(a1)
    800071bc:	00500713          	li	a4,5
    800071c0:	00c782a3          	sb	a2,5(a5)
    800071c4:	00e68663          	beq	a3,a4,800071d0 <__memmove+0xfc>
    800071c8:	0065c703          	lbu	a4,6(a1)
    800071cc:	00e78323          	sb	a4,6(a5)
    800071d0:	00813403          	ld	s0,8(sp)
    800071d4:	01010113          	addi	sp,sp,16
    800071d8:	00008067          	ret
    800071dc:	02061713          	slli	a4,a2,0x20
    800071e0:	02075713          	srli	a4,a4,0x20
    800071e4:	00e587b3          	add	a5,a1,a4
    800071e8:	f0f574e3          	bgeu	a0,a5,800070f0 <__memmove+0x1c>
    800071ec:	02069613          	slli	a2,a3,0x20
    800071f0:	02065613          	srli	a2,a2,0x20
    800071f4:	fff64613          	not	a2,a2
    800071f8:	00e50733          	add	a4,a0,a4
    800071fc:	00c78633          	add	a2,a5,a2
    80007200:	fff7c683          	lbu	a3,-1(a5)
    80007204:	fff78793          	addi	a5,a5,-1
    80007208:	fff70713          	addi	a4,a4,-1
    8000720c:	00d70023          	sb	a3,0(a4)
    80007210:	fec798e3          	bne	a5,a2,80007200 <__memmove+0x12c>
    80007214:	00813403          	ld	s0,8(sp)
    80007218:	01010113          	addi	sp,sp,16
    8000721c:	00008067          	ret
    80007220:	02069713          	slli	a4,a3,0x20
    80007224:	02075713          	srli	a4,a4,0x20
    80007228:	00170713          	addi	a4,a4,1
    8000722c:	00e50733          	add	a4,a0,a4
    80007230:	00050793          	mv	a5,a0
    80007234:	0005c683          	lbu	a3,0(a1)
    80007238:	00178793          	addi	a5,a5,1
    8000723c:	00158593          	addi	a1,a1,1
    80007240:	fed78fa3          	sb	a3,-1(a5)
    80007244:	fee798e3          	bne	a5,a4,80007234 <__memmove+0x160>
    80007248:	f89ff06f          	j	800071d0 <__memmove+0xfc>

000000008000724c <__putc>:
    8000724c:	fe010113          	addi	sp,sp,-32
    80007250:	00813823          	sd	s0,16(sp)
    80007254:	00113c23          	sd	ra,24(sp)
    80007258:	02010413          	addi	s0,sp,32
    8000725c:	00050793          	mv	a5,a0
    80007260:	fef40593          	addi	a1,s0,-17
    80007264:	00100613          	li	a2,1
    80007268:	00000513          	li	a0,0
    8000726c:	fef407a3          	sb	a5,-17(s0)
    80007270:	fffff097          	auipc	ra,0xfffff
    80007274:	b3c080e7          	jalr	-1220(ra) # 80005dac <console_write>
    80007278:	01813083          	ld	ra,24(sp)
    8000727c:	01013403          	ld	s0,16(sp)
    80007280:	02010113          	addi	sp,sp,32
    80007284:	00008067          	ret

0000000080007288 <__getc>:
    80007288:	fe010113          	addi	sp,sp,-32
    8000728c:	00813823          	sd	s0,16(sp)
    80007290:	00113c23          	sd	ra,24(sp)
    80007294:	02010413          	addi	s0,sp,32
    80007298:	fe840593          	addi	a1,s0,-24
    8000729c:	00100613          	li	a2,1
    800072a0:	00000513          	li	a0,0
    800072a4:	fffff097          	auipc	ra,0xfffff
    800072a8:	ae8080e7          	jalr	-1304(ra) # 80005d8c <console_read>
    800072ac:	fe844503          	lbu	a0,-24(s0)
    800072b0:	01813083          	ld	ra,24(sp)
    800072b4:	01013403          	ld	s0,16(sp)
    800072b8:	02010113          	addi	sp,sp,32
    800072bc:	00008067          	ret

00000000800072c0 <console_handler>:
    800072c0:	fe010113          	addi	sp,sp,-32
    800072c4:	00813823          	sd	s0,16(sp)
    800072c8:	00113c23          	sd	ra,24(sp)
    800072cc:	00913423          	sd	s1,8(sp)
    800072d0:	02010413          	addi	s0,sp,32
    800072d4:	14202773          	csrr	a4,scause
    800072d8:	100027f3          	csrr	a5,sstatus
    800072dc:	0027f793          	andi	a5,a5,2
    800072e0:	06079e63          	bnez	a5,8000735c <console_handler+0x9c>
    800072e4:	00074c63          	bltz	a4,800072fc <console_handler+0x3c>
    800072e8:	01813083          	ld	ra,24(sp)
    800072ec:	01013403          	ld	s0,16(sp)
    800072f0:	00813483          	ld	s1,8(sp)
    800072f4:	02010113          	addi	sp,sp,32
    800072f8:	00008067          	ret
    800072fc:	0ff77713          	andi	a4,a4,255
    80007300:	00900793          	li	a5,9
    80007304:	fef712e3          	bne	a4,a5,800072e8 <console_handler+0x28>
    80007308:	ffffe097          	auipc	ra,0xffffe
    8000730c:	6dc080e7          	jalr	1756(ra) # 800059e4 <plic_claim>
    80007310:	00a00793          	li	a5,10
    80007314:	00050493          	mv	s1,a0
    80007318:	02f50c63          	beq	a0,a5,80007350 <console_handler+0x90>
    8000731c:	fc0506e3          	beqz	a0,800072e8 <console_handler+0x28>
    80007320:	00050593          	mv	a1,a0
    80007324:	00001517          	auipc	a0,0x1
    80007328:	28c50513          	addi	a0,a0,652 # 800085b0 <_ZL6digits+0xe8>
    8000732c:	fffff097          	auipc	ra,0xfffff
    80007330:	afc080e7          	jalr	-1284(ra) # 80005e28 <__printf>
    80007334:	01013403          	ld	s0,16(sp)
    80007338:	01813083          	ld	ra,24(sp)
    8000733c:	00048513          	mv	a0,s1
    80007340:	00813483          	ld	s1,8(sp)
    80007344:	02010113          	addi	sp,sp,32
    80007348:	ffffe317          	auipc	t1,0xffffe
    8000734c:	6d430067          	jr	1748(t1) # 80005a1c <plic_complete>
    80007350:	fffff097          	auipc	ra,0xfffff
    80007354:	3e0080e7          	jalr	992(ra) # 80006730 <uartintr>
    80007358:	fddff06f          	j	80007334 <console_handler+0x74>
    8000735c:	00001517          	auipc	a0,0x1
    80007360:	35450513          	addi	a0,a0,852 # 800086b0 <digits+0x78>
    80007364:	fffff097          	auipc	ra,0xfffff
    80007368:	a68080e7          	jalr	-1432(ra) # 80005dcc <panic>
	...
