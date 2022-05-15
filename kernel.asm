
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
    8000001c:	164050ef          	jal	ra,80005180 <start>

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
    800010c8:	77d000ef          	jal	ra,80002044 <_ZN5Riscv20handleSupervisorTrapEv>

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
    800011c8:	b20080e7          	jalr	-1248(ra) # 80001ce4 <_Z7kmallocm>
    800011cc:	00050493          	mv	s1,a0
    idleThread = new TCB([](void *){IdleThread::getInstance()->run();}, nullptr, DEFAULT_TIME_SLICE);
    800011d0:	00000713          	li	a4,0
    800011d4:	00200693          	li	a3,2
    800011d8:	00000613          	li	a2,0
    800011dc:	00000597          	auipc	a1,0x0
    800011e0:	0ec58593          	addi	a1,a1,236 # 800012c8 <_ZZN10IdleThreadC4EvENUlPvE_4_FUNES0_>
    800011e4:	00002097          	auipc	ra,0x2
    800011e8:	a38080e7          	jalr	-1480(ra) # 80002c1c <_ZN3TCBC1EPFvPvES0_mb>
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
    8000121c:	cc8080e7          	jalr	-824(ra) # 80001ee0 <_Z5kfreePv>
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
    80001264:	a84080e7          	jalr	-1404(ra) # 80001ce4 <_Z7kmallocm>
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
    800012a8:	c3c080e7          	jalr	-964(ra) # 80001ee0 <_Z5kfreePv>
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
    8000130c:	cb8080e7          	jalr	-840(ra) # 80002fc0 <_ZN3TCBD1Ev>
    80001310:	00048513          	mv	a0,s1
    80001314:	00001097          	auipc	ra,0x1
    80001318:	bcc080e7          	jalr	-1076(ra) # 80001ee0 <_Z5kfreePv>
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
    80001370:	978080e7          	jalr	-1672(ra) # 80001ce4 <_Z7kmallocm>
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
    80001398:	b4c080e7          	jalr	-1204(ra) # 80001ee0 <_Z5kfreePv>
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
    800013ec:	974080e7          	jalr	-1676(ra) # 80002d5c <_ZN3TCB12createThreadEPFvPvES0_>
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
    80001410:	aa0080e7          	jalr	-1376(ra) # 80002eac <_ZN3TCB4exitEv>
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
    8000143c:	9b0080e7          	jalr	-1616(ra) # 80002de8 <_ZN3TCB8dispatchEv>
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
    80001498:	850080e7          	jalr	-1968(ra) # 80001ce4 <_Z7kmallocm>

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
    800014ec:	428080e7          	jalr	1064(ra) # 80001910 <_ZN15KernelSemaphoreD1Ev>
        kfree(addr);
    800014f0:	00090513          	mv	a0,s2
    800014f4:	00001097          	auipc	ra,0x1
    800014f8:	9ec080e7          	jalr	-1556(ra) # 80001ee0 <_Z5kfreePv>
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
    8000154c:	30c080e7          	jalr	780(ra) # 80001854 <_ZN15KernelSemaphore4waitEv>
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
    80001594:	324080e7          	jalr	804(ra) # 800018b4 <_ZN15KernelSemaphore6signalEv>
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
    800015e0:	094080e7          	jalr	148(ra) # 80003670 <_ZN14TimerInterrupt5blockEP3TCBm>
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
    8000160c:	c70080e7          	jalr	-912(ra) # 80007278 <__getc>
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
    80001634:	c0c080e7          	jalr	-1012(ra) # 8000723c <__putc>
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
    80001698:	0f27e863          	bltu	a5,s2,80001788 <_ZN6Kernel16handleSystemCallEv+0x140>
    8000169c:	00291713          	slli	a4,s2,0x2
    800016a0:	00007697          	auipc	a3,0x7
    800016a4:	99868693          	addi	a3,a3,-1640 # 80008038 <CONSOLE_STATUS+0x28>
    800016a8:	00d70733          	add	a4,a4,a3
    800016ac:	00072783          	lw	a5,0(a4)
    800016b0:	00d787b3          	add	a5,a5,a3
    800016b4:	00078067          	jr	a5
            mem_alloc((size_t) args);
    800016b8:	00000097          	auipc	ra,0x0
    800016bc:	ca4080e7          	jalr	-860(ra) # 8000135c <_ZN6Kernel9mem_allocEm>
inline void Riscv::enableInterrupts() {
    ms_sstatus(SSTATUS_SIE);
}

inline void Riscv::pushRegisterA0(uint64 context) {
    __asm__ volatile ("sd a0, 10 * 8(%[context])" : : [context] "r"(context));
    800016c0:	04a4b823          	sd	a0,80(s1)
}
    800016c4:	02813083          	ld	ra,40(sp)
    800016c8:	02013403          	ld	s0,32(sp)
    800016cc:	01813483          	ld	s1,24(sp)
    800016d0:	01013903          	ld	s2,16(sp)
    800016d4:	03010113          	addi	sp,sp,48
    800016d8:	00008067          	ret
            mem_free(args);
    800016dc:	00000097          	auipc	ra,0x0
    800016e0:	ca8080e7          	jalr	-856(ra) # 80001384 <_ZN6Kernel8mem_freeEPv>
    800016e4:	04a4b823          	sd	a0,80(s1)
}
    800016e8:	fddff06f          	j	800016c4 <_ZN6Kernel16handleSystemCallEv+0x7c>
            thread_create((uint64 *) args);
    800016ec:	00000097          	auipc	ra,0x0
    800016f0:	cc0080e7          	jalr	-832(ra) # 800013ac <_ZN6Kernel13thread_createEPm>
    __asm__ volatile ("sd a0, 10 * 8(%[context])" : : [context] "r"(context));
    800016f4:	04a4b823          	sd	a0,80(s1)
}
    800016f8:	fcdff06f          	j	800016c4 <_ZN6Kernel16handleSystemCallEv+0x7c>
            thread_exit();
    800016fc:	00000097          	auipc	ra,0x0
    80001700:	d00080e7          	jalr	-768(ra) # 800013fc <_ZN6Kernel11thread_exitEv>
    __asm__ volatile ("sd a0, 10 * 8(%[context])" : : [context] "r"(context));
    80001704:	04a4b823          	sd	a0,80(s1)
}
    80001708:	fbdff06f          	j	800016c4 <_ZN6Kernel16handleSystemCallEv+0x7c>
            thread_dispatch();
    8000170c:	00000097          	auipc	ra,0x0
    80001710:	d1c080e7          	jalr	-740(ra) # 80001428 <_ZN6Kernel15thread_dispatchEv>
            break;
    80001714:	fb1ff06f          	j	800016c4 <_ZN6Kernel16handleSystemCallEv+0x7c>
            sem_open((uint64 *) args);
    80001718:	00000097          	auipc	ra,0x0
    8000171c:	d38080e7          	jalr	-712(ra) # 80001450 <_ZN6Kernel8sem_openEPm>
    __asm__ volatile ("sd a0, 10 * 8(%[context])" : : [context] "r"(context));
    80001720:	04a4b823          	sd	a0,80(s1)
}
    80001724:	fa1ff06f          	j	800016c4 <_ZN6Kernel16handleSystemCallEv+0x7c>
            sem_close((KernelSemaphore **) args);
    80001728:	00000097          	auipc	ra,0x0
    8000172c:	d94080e7          	jalr	-620(ra) # 800014bc <_ZN6Kernel9sem_closeEPP15KernelSemaphore>
    __asm__ volatile ("sd a0, 10 * 8(%[context])" : : [context] "r"(context));
    80001730:	04a4b823          	sd	a0,80(s1)
}
    80001734:	f91ff06f          	j	800016c4 <_ZN6Kernel16handleSystemCallEv+0x7c>
            sem_wait((KernelSemaphore **) args);
    80001738:	00000097          	auipc	ra,0x0
    8000173c:	df4080e7          	jalr	-524(ra) # 8000152c <_ZN6Kernel8sem_waitEPP15KernelSemaphore>
    __asm__ volatile ("sd a0, 10 * 8(%[context])" : : [context] "r"(context));
    80001740:	04a4b823          	sd	a0,80(s1)
}
    80001744:	f81ff06f          	j	800016c4 <_ZN6Kernel16handleSystemCallEv+0x7c>
            sem_signal((KernelSemaphore **) args);
    80001748:	00000097          	auipc	ra,0x0
    8000174c:	e2c080e7          	jalr	-468(ra) # 80001574 <_ZN6Kernel10sem_signalEPP15KernelSemaphore>
    __asm__ volatile ("sd a0, 10 * 8(%[context])" : : [context] "r"(context));
    80001750:	04a4b823          	sd	a0,80(s1)
}
    80001754:	f71ff06f          	j	800016c4 <_ZN6Kernel16handleSystemCallEv+0x7c>
            time_sleep((time_t) args);
    80001758:	00000097          	auipc	ra,0x0
    8000175c:	e64080e7          	jalr	-412(ra) # 800015bc <_ZN6Kernel10time_sleepEm>
    __asm__ volatile ("sd a0, 10 * 8(%[context])" : : [context] "r"(context));
    80001760:	04a4b823          	sd	a0,80(s1)
}
    80001764:	f61ff06f          	j	800016c4 <_ZN6Kernel16handleSystemCallEv+0x7c>
            getc();
    80001768:	00000097          	auipc	ra,0x0
    8000176c:	e90080e7          	jalr	-368(ra) # 800015f8 <_ZN6Kernel4getcEv>
    __asm__ volatile ("sd a0, 10 * 8(%[context])" : : [context] "r"(context));
    80001770:	04a4b823          	sd	a0,80(s1)
}
    80001774:	f51ff06f          	j	800016c4 <_ZN6Kernel16handleSystemCallEv+0x7c>
            putc((uint64) args);
    80001778:	0ff57513          	andi	a0,a0,255
    8000177c:	00000097          	auipc	ra,0x0
    80001780:	ea4080e7          	jalr	-348(ra) # 80001620 <_ZN6Kernel4putcEc>
            break;
    80001784:	f41ff06f          	j	800016c4 <_ZN6Kernel16handleSystemCallEv+0x7c>
            kprintString("Unknown system call: ");
    80001788:	00007517          	auipc	a0,0x7
    8000178c:	89850513          	addi	a0,a0,-1896 # 80008020 <CONSOLE_STATUS+0x10>
    80001790:	00001097          	auipc	ra,0x1
    80001794:	0a4080e7          	jalr	164(ra) # 80002834 <_Z12kprintStringPKc>
            kprintUnsigned(code);
    80001798:	00090513          	mv	a0,s2
    8000179c:	00001097          	auipc	ra,0x1
    800017a0:	2f0080e7          	jalr	752(ra) # 80002a8c <_Z14kprintUnsignedm>
            kprintString("\n");
    800017a4:	00007517          	auipc	a0,0x7
    800017a8:	9e450513          	addi	a0,a0,-1564 # 80008188 <CONSOLE_STATUS+0x178>
    800017ac:	00001097          	auipc	ra,0x1
    800017b0:	088080e7          	jalr	136(ra) # 80002834 <_Z12kprintStringPKc>
            return;
    800017b4:	f11ff06f          	j	800016c4 <_ZN6Kernel16handleSystemCallEv+0x7c>

00000000800017b8 <_ZN15KernelSemaphore5blockEv>:
#include "../h/KernelSemaphore.h"
#include "../h/Riscv.h"
#include "../h/TCB.h"
#include "../h/Scheduler.h"

void KernelSemaphore::block() {
    800017b8:	fe010113          	addi	sp,sp,-32
    800017bc:	00113c23          	sd	ra,24(sp)
    800017c0:	00813823          	sd	s0,16(sp)
    800017c4:	00913423          	sd	s1,8(sp)
    800017c8:	02010413          	addi	s0,sp,32
    blockedThreadQueue.addLast(TCB::running->getNode());
    800017cc:	00008497          	auipc	s1,0x8
    800017d0:	6144b483          	ld	s1,1556(s1) # 80009de0 <_GLOBAL_OFFSET_TABLE_+0x28>
    800017d4:	0004b583          	ld	a1,0(s1)
    800017d8:	0a058593          	addi	a1,a1,160
    800017dc:	00850513          	addi	a0,a0,8
    800017e0:	00002097          	auipc	ra,0x2
    800017e4:	c10080e7          	jalr	-1008(ra) # 800033f0 <_ZN10ThreadList7addLastEP10ThreadNode>
    TCB::running->setBlocked();
    800017e8:	0004b783          	ld	a5,0(s1)
        status = BLOCKED;
    800017ec:	00200713          	li	a4,2
    800017f0:	04e7a023          	sw	a4,64(a5)
    TCB::dispatch();
    800017f4:	00001097          	auipc	ra,0x1
    800017f8:	5f4080e7          	jalr	1524(ra) # 80002de8 <_ZN3TCB8dispatchEv>
}
    800017fc:	01813083          	ld	ra,24(sp)
    80001800:	01013403          	ld	s0,16(sp)
    80001804:	00813483          	ld	s1,8(sp)
    80001808:	02010113          	addi	sp,sp,32
    8000180c:	00008067          	ret

0000000080001810 <_ZN15KernelSemaphore7deblockEv>:
    bool hasCurr() {
        return curr != nullptr;
    }

    bool isEmpty() {
        return size == 0;
    80001810:	02052783          	lw	a5,32(a0)

void KernelSemaphore::deblock() {
    if (blockedThreadQueue.isEmpty()) return;
    80001814:	00079463          	bnez	a5,8000181c <_ZN15KernelSemaphore7deblockEv+0xc>
    80001818:	00008067          	ret
void KernelSemaphore::deblock() {
    8000181c:	ff010113          	addi	sp,sp,-16
    80001820:	00113423          	sd	ra,8(sp)
    80001824:	00813023          	sd	s0,0(sp)
    80001828:	01010413          	addi	s0,sp,16
    TCB *tcb = blockedThreadQueue.removeFirst();
    8000182c:	00850513          	addi	a0,a0,8
    80001830:	00002097          	auipc	ra,0x2
    80001834:	c04080e7          	jalr	-1020(ra) # 80003434 <_ZN10ThreadList11removeFirstEv>
        status = READY;
    80001838:	04052023          	sw	zero,64(a0)
    tcb->setReady();
    Scheduler::put(tcb);
    8000183c:	00001097          	auipc	ra,0x1
    80001840:	b10080e7          	jalr	-1264(ra) # 8000234c <_ZN9Scheduler3putEP3TCB>
}
    80001844:	00813083          	ld	ra,8(sp)
    80001848:	00013403          	ld	s0,0(sp)
    8000184c:	01010113          	addi	sp,sp,16
    80001850:	00008067          	ret

0000000080001854 <_ZN15KernelSemaphore4waitEv>:

void KernelSemaphore::wait() {
    80001854:	fe010113          	addi	sp,sp,-32
    80001858:	00113c23          	sd	ra,24(sp)
    8000185c:	00813823          	sd	s0,16(sp)
    80001860:	02010413          	addi	s0,sp,32
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80001864:	100027f3          	csrr	a5,sstatus
    80001868:	fef43023          	sd	a5,-32(s0)
    return sstatus;
    8000186c:	fe043783          	ld	a5,-32(s0)
    lock()
    80001870:	fef43423          	sd	a5,-24(s0)
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80001874:	00200793          	li	a5,2
    80001878:	1007b073          	csrc	sstatus,a5
    if (--val < 0) block();
    8000187c:	00052783          	lw	a5,0(a0)
    80001880:	fff7879b          	addiw	a5,a5,-1
    80001884:	00f52023          	sw	a5,0(a0)
    80001888:	02079713          	slli	a4,a5,0x20
    8000188c:	00074e63          	bltz	a4,800018a8 <_ZN15KernelSemaphore4waitEv+0x54>
    unlock()
    80001890:	fe843783          	ld	a5,-24(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80001894:	10079073          	csrw	sstatus,a5
}
    80001898:	01813083          	ld	ra,24(sp)
    8000189c:	01013403          	ld	s0,16(sp)
    800018a0:	02010113          	addi	sp,sp,32
    800018a4:	00008067          	ret
    if (--val < 0) block();
    800018a8:	00000097          	auipc	ra,0x0
    800018ac:	f10080e7          	jalr	-240(ra) # 800017b8 <_ZN15KernelSemaphore5blockEv>
    800018b0:	fe1ff06f          	j	80001890 <_ZN15KernelSemaphore4waitEv+0x3c>

00000000800018b4 <_ZN15KernelSemaphore6signalEv>:

void KernelSemaphore::signal() {
    800018b4:	fe010113          	addi	sp,sp,-32
    800018b8:	00113c23          	sd	ra,24(sp)
    800018bc:	00813823          	sd	s0,16(sp)
    800018c0:	02010413          	addi	s0,sp,32
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    800018c4:	100027f3          	csrr	a5,sstatus
    800018c8:	fef43023          	sd	a5,-32(s0)
    return sstatus;
    800018cc:	fe043783          	ld	a5,-32(s0)
    lock()
    800018d0:	fef43423          	sd	a5,-24(s0)
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    800018d4:	00200793          	li	a5,2
    800018d8:	1007b073          	csrc	sstatus,a5
    if (val++ < 0) deblock();
    800018dc:	00052783          	lw	a5,0(a0)
    800018e0:	0017871b          	addiw	a4,a5,1
    800018e4:	00e52023          	sw	a4,0(a0)
    800018e8:	0007ce63          	bltz	a5,80001904 <_ZN15KernelSemaphore6signalEv+0x50>
    unlock()
    800018ec:	fe843783          	ld	a5,-24(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    800018f0:	10079073          	csrw	sstatus,a5
}
    800018f4:	01813083          	ld	ra,24(sp)
    800018f8:	01013403          	ld	s0,16(sp)
    800018fc:	02010113          	addi	sp,sp,32
    80001900:	00008067          	ret
    if (val++ < 0) deblock();
    80001904:	00000097          	auipc	ra,0x0
    80001908:	f0c080e7          	jalr	-244(ra) # 80001810 <_ZN15KernelSemaphore7deblockEv>
    8000190c:	fe1ff06f          	j	800018ec <_ZN15KernelSemaphore6signalEv+0x38>

0000000080001910 <_ZN15KernelSemaphoreD1Ev>:

KernelSemaphore::~KernelSemaphore() {
    80001910:	fd010113          	addi	sp,sp,-48
    80001914:	02113423          	sd	ra,40(sp)
    80001918:	02813023          	sd	s0,32(sp)
    8000191c:	00913c23          	sd	s1,24(sp)
    80001920:	03010413          	addi	s0,sp,48
    80001924:	00050493          	mv	s1,a0
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80001928:	100027f3          	csrr	a5,sstatus
    8000192c:	fcf43c23          	sd	a5,-40(s0)
    return sstatus;
    80001930:	fd843783          	ld	a5,-40(s0)
    lock()
    80001934:	fcf43823          	sd	a5,-48(s0)
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80001938:	00200793          	li	a5,2
    8000193c:	1007b073          	csrc	sstatus,a5
    80001940:	0204a783          	lw	a5,32(s1)
    while (!blockedThreadQueue.isEmpty())
    80001944:	00078a63          	beqz	a5,80001958 <_ZN15KernelSemaphoreD1Ev+0x48>
        deblock();
    80001948:	00048513          	mv	a0,s1
    8000194c:	00000097          	auipc	ra,0x0
    80001950:	ec4080e7          	jalr	-316(ra) # 80001810 <_ZN15KernelSemaphore7deblockEv>
    while (!blockedThreadQueue.isEmpty())
    80001954:	fedff06f          	j	80001940 <_ZN15KernelSemaphoreD1Ev+0x30>
    unlock()
    80001958:	fd043783          	ld	a5,-48(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    8000195c:	10079073          	csrw	sstatus,a5
    val = 0;
    80001960:	0004a023          	sw	zero,0(s1)
KernelSemaphore::~KernelSemaphore() {
    80001964:	00848513          	addi	a0,s1,8
    80001968:	00002097          	auipc	ra,0x2
    8000196c:	c70080e7          	jalr	-912(ra) # 800035d8 <_ZN10ThreadListD1Ev>
}
    80001970:	02813083          	ld	ra,40(sp)
    80001974:	02013403          	ld	s0,32(sp)
    80001978:	01813483          	ld	s1,24(sp)
    8000197c:	03010113          	addi	sp,sp,48
    80001980:	00008067          	ret

0000000080001984 <_ZZ4mainENUlPvE_4_FUNES_>:
    kprintString("Starting main\n");
    TCB *main = TCB::createThread(nullptr, nullptr);
    kprintString("Created main thread\n");
    TCB::running = main;

    TCB *uMain = TCB::createThread([](void *){userMain();}, nullptr);
    80001984:	ff010113          	addi	sp,sp,-16
    80001988:	00113423          	sd	ra,8(sp)
    8000198c:	00813023          	sd	s0,0(sp)
    80001990:	01010413          	addi	s0,sp,16
    80001994:	00003097          	auipc	ra,0x3
    80001998:	614080e7          	jalr	1556(ra) # 80004fa8 <_Z8userMainv>
    8000199c:	00813083          	ld	ra,8(sp)
    800019a0:	00013403          	ld	s0,0(sp)
    800019a4:	01010113          	addi	sp,sp,16
    800019a8:	00008067          	ret

00000000800019ac <main>:
int main() {
    800019ac:	fe010113          	addi	sp,sp,-32
    800019b0:	00113c23          	sd	ra,24(sp)
    800019b4:	00813823          	sd	s0,16(sp)
    800019b8:	00913423          	sd	s1,8(sp)
    800019bc:	02010413          	addi	s0,sp,32
    kprintString("Starting main\n");
    800019c0:	00006517          	auipc	a0,0x6
    800019c4:	78850513          	addi	a0,a0,1928 # 80008148 <CONSOLE_STATUS+0x138>
    800019c8:	00001097          	auipc	ra,0x1
    800019cc:	e6c080e7          	jalr	-404(ra) # 80002834 <_Z12kprintStringPKc>
    TCB *main = TCB::createThread(nullptr, nullptr);
    800019d0:	00000593          	li	a1,0
    800019d4:	00000513          	li	a0,0
    800019d8:	00001097          	auipc	ra,0x1
    800019dc:	384080e7          	jalr	900(ra) # 80002d5c <_ZN3TCB12createThreadEPFvPvES0_>
    800019e0:	00050493          	mv	s1,a0
    kprintString("Created main thread\n");
    800019e4:	00006517          	auipc	a0,0x6
    800019e8:	77450513          	addi	a0,a0,1908 # 80008158 <CONSOLE_STATUS+0x148>
    800019ec:	00001097          	auipc	ra,0x1
    800019f0:	e48080e7          	jalr	-440(ra) # 80002834 <_Z12kprintStringPKc>
    TCB::running = main;
    800019f4:	00008797          	auipc	a5,0x8
    800019f8:	3ec7b783          	ld	a5,1004(a5) # 80009de0 <_GLOBAL_OFFSET_TABLE_+0x28>
    800019fc:	0097b023          	sd	s1,0(a5)
    TCB *uMain = TCB::createThread([](void *){userMain();}, nullptr);
    80001a00:	00000593          	li	a1,0
    80001a04:	00000517          	auipc	a0,0x0
    80001a08:	f8050513          	addi	a0,a0,-128 # 80001984 <_ZZ4mainENUlPvE_4_FUNES_>
    80001a0c:	00001097          	auipc	ra,0x1
    80001a10:	350080e7          	jalr	848(ra) # 80002d5c <_ZN3TCB12createThreadEPFvPvES0_>
    80001a14:	00050493          	mv	s1,a0
    kprintString("Created user main thread\n");
    80001a18:	00006517          	auipc	a0,0x6
    80001a1c:	75850513          	addi	a0,a0,1880 # 80008170 <CONSOLE_STATUS+0x160>
    80001a20:	00001097          	auipc	ra,0x1
    80001a24:	e14080e7          	jalr	-492(ra) # 80002834 <_Z12kprintStringPKc>

    Riscv::w_stvec((uint64) &Riscv::supervisorTrap);
    80001a28:	00008797          	auipc	a5,0x8
    80001a2c:	3a07b783          	ld	a5,928(a5) # 80009dc8 <_GLOBAL_OFFSET_TABLE_+0x10>
    __asm__ volatile ("csrw stvec, %[stvec]" : : [stvec] "r"(stvec));
    80001a30:	10579073          	csrw	stvec,a5

    uMain->join();
    80001a34:	00048513          	mv	a0,s1
    80001a38:	00001097          	auipc	ra,0x1
    80001a3c:	500080e7          	jalr	1280(ra) # 80002f38 <_ZN3TCB4joinEv>
    int join();

    static TCB *createThread(Body body, void *args);

    static void yield() {
        __asm__ volatile ("ecall");
    80001a40:	00000073          	ecall
    TCB::yield();

    delete ThreadCollector::getInstance();
    80001a44:	00001097          	auipc	ra,0x1
    80001a48:	798080e7          	jalr	1944(ra) # 800031dc <_ZN15ThreadCollector11getInstanceEv>
    80001a4c:	00050e63          	beqz	a0,80001a68 <main+0xbc>
    80001a50:	00050493          	mv	s1,a0
    80001a54:	00001097          	auipc	ra,0x1
    80001a58:	6dc080e7          	jalr	1756(ra) # 80003130 <_ZN15ThreadCollectorD1Ev>
    80001a5c:	00048513          	mv	a0,s1
    80001a60:	00000097          	auipc	ra,0x0
    80001a64:	480080e7          	jalr	1152(ra) # 80001ee0 <_Z5kfreePv>
    delete IdleThread::getInstance();
    80001a68:	fffff097          	auipc	ra,0xfffff
    80001a6c:	7c4080e7          	jalr	1988(ra) # 8000122c <_ZN10IdleThread11getInstanceEv>
    80001a70:	00050493          	mv	s1,a0
    80001a74:	00050c63          	beqz	a0,80001a8c <main+0xe0>
    80001a78:	00000097          	auipc	ra,0x0
    80001a7c:	870080e7          	jalr	-1936(ra) # 800012e8 <_ZN10IdleThreadD1Ev>
    80001a80:	00048513          	mv	a0,s1
    80001a84:	00000097          	auipc	ra,0x0
    80001a88:	45c080e7          	jalr	1116(ra) # 80001ee0 <_Z5kfreePv>
    delete TimerInterrupt::getInstance();
    80001a8c:	00002097          	auipc	ra,0x2
    80001a90:	b64080e7          	jalr	-1180(ra) # 800035f0 <_ZN14TimerInterrupt11getInstanceEv>
    80001a94:	00050493          	mv	s1,a0
    80001a98:	00050c63          	beqz	a0,80001ab0 <main+0x104>
    80001a9c:	00002097          	auipc	ra,0x2
    80001aa0:	da0080e7          	jalr	-608(ra) # 8000383c <_ZN14TimerInterruptD1Ev>
    80001aa4:	00048513          	mv	a0,s1
    80001aa8:	00000097          	auipc	ra,0x0
    80001aac:	438080e7          	jalr	1080(ra) # 80001ee0 <_Z5kfreePv>
    delete Scheduler::getInstance();
    80001ab0:	00000097          	auipc	ra,0x0
    80001ab4:	7b0080e7          	jalr	1968(ra) # 80002260 <_ZN9Scheduler11getInstanceEv>
    80001ab8:	00050493          	mv	s1,a0
    80001abc:	00050c63          	beqz	a0,80001ad4 <main+0x128>
    80001ac0:	00001097          	auipc	ra,0x1
    80001ac4:	8f8080e7          	jalr	-1800(ra) # 800023b8 <_ZN9SchedulerD1Ev>
    80001ac8:	00048513          	mv	a0,s1
    80001acc:	00000097          	auipc	ra,0x0
    80001ad0:	414080e7          	jalr	1044(ra) # 80001ee0 <_Z5kfreePv>

    kprintString("Main finished\n");
    80001ad4:	00006517          	auipc	a0,0x6
    80001ad8:	6bc50513          	addi	a0,a0,1724 # 80008190 <CONSOLE_STATUS+0x180>
    80001adc:	00001097          	auipc	ra,0x1
    80001ae0:	d58080e7          	jalr	-680(ra) # 80002834 <_Z12kprintStringPKc>

    return 0;
}
    80001ae4:	00000513          	li	a0,0
    80001ae8:	01813083          	ld	ra,24(sp)
    80001aec:	01013403          	ld	s0,16(sp)
    80001af0:	00813483          	ld	s1,8(sp)
    80001af4:	02010113          	addi	sp,sp,32
    80001af8:	00008067          	ret

0000000080001afc <_ZN15MemoryAllocator19initMemoryAllocatorEv>:

int kfree(void *addr) {
    return MemoryAllocator::getInstance()->free(addr);
}

void MemoryAllocator::initMemoryAllocator() {
    80001afc:	ff010113          	addi	sp,sp,-16
    80001b00:	00813423          	sd	s0,8(sp)
    80001b04:	01010413          	addi	s0,sp,16
    instance = (MemoryAllocator *) HEAP_START_ADDR;
    80001b08:	00008697          	auipc	a3,0x8
    80001b0c:	2b86b683          	ld	a3,696(a3) # 80009dc0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001b10:	0006b783          	ld	a5,0(a3)
    80001b14:	00008717          	auipc	a4,0x8
    80001b18:	32470713          	addi	a4,a4,804 # 80009e38 <_ZN15MemoryAllocator8instanceE>
    80001b1c:	00f73023          	sd	a5,0(a4)

    instance->mutex = (Mutex *) ((uint8 *) HEAP_START_ADDR + sizeof(MemoryAllocator));
    80001b20:	01078613          	addi	a2,a5,16
    80001b24:	00c7b423          	sd	a2,8(a5)
    instance->mutex->holder = nullptr;
    80001b28:	0207bc23          	sd	zero,56(a5)
    instance->freeMemHead = (BlockHeader *) ((uint8 *) HEAP_START_ADDR + sizeof(MemoryAllocator) + sizeof(Mutex));
    80001b2c:	04078613          	addi	a2,a5,64
    80001b30:	00c7b023          	sd	a2,0(a5)
    instance->freeMemHead->size = (size_t) ((uint8 *) HEAP_END_ADDR - (uint8 *) HEAP_START_ADDR -
    80001b34:	00008797          	auipc	a5,0x8
    80001b38:	2b47b783          	ld	a5,692(a5) # 80009de8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001b3c:	0007b783          	ld	a5,0(a5)
    80001b40:	0006b683          	ld	a3,0(a3)
    80001b44:	40d787b3          	sub	a5,a5,a3
    80001b48:	00073683          	ld	a3,0(a4)
    80001b4c:	0006b683          	ld	a3,0(a3)
                                  sizeof(MemoryAllocator) - sizeof(BlockHeader) - sizeof(Mutex));
    80001b50:	fa878793          	addi	a5,a5,-88
    instance->freeMemHead->size = (size_t) ((uint8 *) HEAP_END_ADDR - (uint8 *) HEAP_START_ADDR -
    80001b54:	00f6b023          	sd	a5,0(a3)
    instance->freeMemHead->free = true;
    80001b58:	00073783          	ld	a5,0(a4)
    80001b5c:	0007b703          	ld	a4,0(a5)
    80001b60:	00100693          	li	a3,1
    80001b64:	00d70423          	sb	a3,8(a4)
    instance->freeMemHead->next = nullptr;
    80001b68:	0007b783          	ld	a5,0(a5)
    80001b6c:	0007b823          	sd	zero,16(a5)
}
    80001b70:	00813403          	ld	s0,8(sp)
    80001b74:	01010113          	addi	sp,sp,16
    80001b78:	00008067          	ret

0000000080001b7c <_ZN15MemoryAllocator11getInstanceEv>:

MemoryAllocator *MemoryAllocator::getInstance() {
    if (!instance) initMemoryAllocator();
    80001b7c:	00008797          	auipc	a5,0x8
    80001b80:	2bc7b783          	ld	a5,700(a5) # 80009e38 <_ZN15MemoryAllocator8instanceE>
    80001b84:	00078863          	beqz	a5,80001b94 <_ZN15MemoryAllocator11getInstanceEv+0x18>

    return instance;
}
    80001b88:	00008517          	auipc	a0,0x8
    80001b8c:	2b053503          	ld	a0,688(a0) # 80009e38 <_ZN15MemoryAllocator8instanceE>
    80001b90:	00008067          	ret
MemoryAllocator *MemoryAllocator::getInstance() {
    80001b94:	ff010113          	addi	sp,sp,-16
    80001b98:	00113423          	sd	ra,8(sp)
    80001b9c:	00813023          	sd	s0,0(sp)
    80001ba0:	01010413          	addi	s0,sp,16
    if (!instance) initMemoryAllocator();
    80001ba4:	00000097          	auipc	ra,0x0
    80001ba8:	f58080e7          	jalr	-168(ra) # 80001afc <_ZN15MemoryAllocator19initMemoryAllocatorEv>
}
    80001bac:	00008517          	auipc	a0,0x8
    80001bb0:	28c53503          	ld	a0,652(a0) # 80009e38 <_ZN15MemoryAllocator8instanceE>
    80001bb4:	00813083          	ld	ra,8(sp)
    80001bb8:	00013403          	ld	s0,0(sp)
    80001bbc:	01010113          	addi	sp,sp,16
    80001bc0:	00008067          	ret

0000000080001bc4 <_ZN15MemoryAllocator6mallocEm>:

void *MemoryAllocator::malloc(size_t size) {
    80001bc4:	fd010113          	addi	sp,sp,-48
    80001bc8:	02113423          	sd	ra,40(sp)
    80001bcc:	02813023          	sd	s0,32(sp)
    80001bd0:	00913c23          	sd	s1,24(sp)
    80001bd4:	01213823          	sd	s2,16(sp)
    80001bd8:	01313423          	sd	s3,8(sp)
    80001bdc:	03010413          	addi	s0,sp,48
    // Initial check
    if (!size) return 0;
    80001be0:	0e058e63          	beqz	a1,80001cdc <_ZN15MemoryAllocator6mallocEm+0x118>
    80001be4:	00050993          	mv	s3,a0

    // Rounding and aligning size to size of memory blocks
    size = ((size - 1) / MEM_BLOCK_SIZE + 1) * MEM_BLOCK_SIZE;
    80001be8:	fff58913          	addi	s2,a1,-1
    80001bec:	00695913          	srli	s2,s2,0x6
    80001bf0:	00190913          	addi	s2,s2,1
    80001bf4:	00691913          	slli	s2,s2,0x6

    mutex->wait();
    80001bf8:	00853503          	ld	a0,8(a0)
    80001bfc:	00000097          	auipc	ra,0x0
    80001c00:	324080e7          	jalr	804(ra) # 80001f20 <_ZN5Mutex4waitEv>
    // Finding suitable free memory block using first fit algorithm
    BlockHeader *curr = freeMemHead, *prev = nullptr;
    80001c04:	0009b483          	ld	s1,0(s3)
    80001c08:	00000713          	li	a4,0
    int i = 0;
    while (curr && curr->size < size)
    80001c0c:	00048c63          	beqz	s1,80001c24 <_ZN15MemoryAllocator6mallocEm+0x60>
    80001c10:	0004b783          	ld	a5,0(s1)
    80001c14:	0127f863          	bgeu	a5,s2,80001c24 <_ZN15MemoryAllocator6mallocEm+0x60>
        prev = curr, curr = curr->next, i++;
    80001c18:	00048713          	mv	a4,s1
    80001c1c:	0104b483          	ld	s1,16(s1)
    while (curr && curr->size < size)
    80001c20:	fedff06f          	j	80001c0c <_ZN15MemoryAllocator6mallocEm+0x48>
    if (!curr)  {
    80001c24:	04048463          	beqz	s1,80001c6c <_ZN15MemoryAllocator6mallocEm+0xa8>
        mutex->signal();
        return nullptr;
    }

    size_t remainingSize = curr->size - size;
    80001c28:	0004b783          	ld	a5,0(s1)
    80001c2c:	412787b3          	sub	a5,a5,s2
    curr->size = size;
    80001c30:	0124b023          	sd	s2,0(s1)
    curr->free = false;
    80001c34:	00048423          	sb	zero,8(s1)

    // Allocating new free memory block if enough size is left over
    if (remainingSize >= MEM_BLOCK_SIZE + sizeof(BlockHeader)) {
    80001c38:	05700693          	li	a3,87
    80001c3c:	04f6f463          	bgeu	a3,a5,80001c84 <_ZN15MemoryAllocator6mallocEm+0xc0>
        BlockHeader *elem = (BlockHeader *) ((uint8 *) curr + sizeof(BlockHeader) + size);
    80001c40:	01890913          	addi	s2,s2,24
    80001c44:	01248933          	add	s2,s1,s2
        elem->size = remainingSize - sizeof(BlockHeader);
    80001c48:	fe878793          	addi	a5,a5,-24
    80001c4c:	00f93023          	sd	a5,0(s2)
        elem->free = true;
    80001c50:	00100793          	li	a5,1
    80001c54:	00f90423          	sb	a5,8(s2)
        elem->next = curr->next;
    80001c58:	0104b783          	ld	a5,16(s1)
    80001c5c:	00f93823          	sd	a5,16(s2)
        (!prev ? freeMemHead : prev->next) = elem;
    80001c60:	00070e63          	beqz	a4,80001c7c <_ZN15MemoryAllocator6mallocEm+0xb8>
    80001c64:	01273823          	sd	s2,16(a4)
    80001c68:	0340006f          	j	80001c9c <_ZN15MemoryAllocator6mallocEm+0xd8>
        mutex->signal();
    80001c6c:	0089b503          	ld	a0,8(s3)
    80001c70:	00000097          	auipc	ra,0x0
    80001c74:	330080e7          	jalr	816(ra) # 80001fa0 <_ZN5Mutex6signalEv>
        return nullptr;
    80001c78:	0380006f          	j	80001cb0 <_ZN15MemoryAllocator6mallocEm+0xec>
        (!prev ? freeMemHead : prev->next) = elem;
    80001c7c:	0129b023          	sd	s2,0(s3)
    80001c80:	01c0006f          	j	80001c9c <_ZN15MemoryAllocator6mallocEm+0xd8>
    } else {
        // Removing whole free memory block from free memory list
        (!prev ? freeMemHead : prev->next) = curr->next;
    80001c84:	04070663          	beqz	a4,80001cd0 <_ZN15MemoryAllocator6mallocEm+0x10c>
    80001c88:	0104b683          	ld	a3,16(s1)
    80001c8c:	00d73823          	sd	a3,16(a4)
        curr->size += remainingSize;
    80001c90:	0004b703          	ld	a4,0(s1)
    80001c94:	00f707b3          	add	a5,a4,a5
    80001c98:	00f4b023          	sd	a5,0(s1)
    }
    curr->next = nullptr;
    80001c9c:	0004b823          	sd	zero,16(s1)

    // Free memory start address after segment descriptor of allocated memory block
    void *addr = (uint8 *) curr + sizeof(BlockHeader);
    80001ca0:	01848493          	addi	s1,s1,24

    mutex->signal();
    80001ca4:	0089b503          	ld	a0,8(s3)
    80001ca8:	00000097          	auipc	ra,0x0
    80001cac:	2f8080e7          	jalr	760(ra) # 80001fa0 <_ZN5Mutex6signalEv>

    return addr;
}
    80001cb0:	00048513          	mv	a0,s1
    80001cb4:	02813083          	ld	ra,40(sp)
    80001cb8:	02013403          	ld	s0,32(sp)
    80001cbc:	01813483          	ld	s1,24(sp)
    80001cc0:	01013903          	ld	s2,16(sp)
    80001cc4:	00813983          	ld	s3,8(sp)
    80001cc8:	03010113          	addi	sp,sp,48
    80001ccc:	00008067          	ret
        (!prev ? freeMemHead : prev->next) = curr->next;
    80001cd0:	0104b703          	ld	a4,16(s1)
    80001cd4:	00e9b023          	sd	a4,0(s3)
    80001cd8:	fb9ff06f          	j	80001c90 <_ZN15MemoryAllocator6mallocEm+0xcc>
    if (!size) return 0;
    80001cdc:	00000493          	li	s1,0
    80001ce0:	fd1ff06f          	j	80001cb0 <_ZN15MemoryAllocator6mallocEm+0xec>

0000000080001ce4 <_Z7kmallocm>:
void *kmalloc(size_t size) {
    80001ce4:	fe010113          	addi	sp,sp,-32
    80001ce8:	00113c23          	sd	ra,24(sp)
    80001cec:	00813823          	sd	s0,16(sp)
    80001cf0:	00913423          	sd	s1,8(sp)
    80001cf4:	02010413          	addi	s0,sp,32
    80001cf8:	00050493          	mv	s1,a0
    return MemoryAllocator::getInstance()->malloc(size);
    80001cfc:	00000097          	auipc	ra,0x0
    80001d00:	e80080e7          	jalr	-384(ra) # 80001b7c <_ZN15MemoryAllocator11getInstanceEv>
    80001d04:	00048593          	mv	a1,s1
    80001d08:	00000097          	auipc	ra,0x0
    80001d0c:	ebc080e7          	jalr	-324(ra) # 80001bc4 <_ZN15MemoryAllocator6mallocEm>
}
    80001d10:	01813083          	ld	ra,24(sp)
    80001d14:	01013403          	ld	s0,16(sp)
    80001d18:	00813483          	ld	s1,8(sp)
    80001d1c:	02010113          	addi	sp,sp,32
    80001d20:	00008067          	ret

0000000080001d24 <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE>:
    mutex->signal();

    return 0;
}

int MemoryAllocator::tryToJoin(MemoryAllocator::BlockHeader *curr) {
    80001d24:	ff010113          	addi	sp,sp,-16
    80001d28:	00813423          	sd	s0,8(sp)
    80001d2c:	01010413          	addi	s0,sp,16
    if (!curr || !curr->next) return -1;
    80001d30:	04050263          	beqz	a0,80001d74 <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE+0x50>
    80001d34:	01053703          	ld	a4,16(a0)
    80001d38:	04070263          	beqz	a4,80001d7c <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE+0x58>

    if ((uint8 *) curr + sizeof(BlockHeader) + curr->size != (uint8 *) curr->next) return -2;
    80001d3c:	00053783          	ld	a5,0(a0)
    80001d40:	01878693          	addi	a3,a5,24
    80001d44:	00d506b3          	add	a3,a0,a3
    80001d48:	02d71e63          	bne	a4,a3,80001d84 <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE+0x60>

    curr->size += curr->next->size + sizeof(BlockHeader);
    80001d4c:	00073683          	ld	a3,0(a4)
    80001d50:	00d787b3          	add	a5,a5,a3
    80001d54:	01878793          	addi	a5,a5,24
    80001d58:	00f53023          	sd	a5,0(a0)
    curr->next = curr->next->next;
    80001d5c:	01073783          	ld	a5,16(a4)
    80001d60:	00f53823          	sd	a5,16(a0)

    return 0;
    80001d64:	00000513          	li	a0,0
}
    80001d68:	00813403          	ld	s0,8(sp)
    80001d6c:	01010113          	addi	sp,sp,16
    80001d70:	00008067          	ret
    if (!curr || !curr->next) return -1;
    80001d74:	fff00513          	li	a0,-1
    80001d78:	ff1ff06f          	j	80001d68 <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE+0x44>
    80001d7c:	fff00513          	li	a0,-1
    80001d80:	fe9ff06f          	j	80001d68 <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE+0x44>
    if ((uint8 *) curr + sizeof(BlockHeader) + curr->size != (uint8 *) curr->next) return -2;
    80001d84:	ffe00513          	li	a0,-2
    80001d88:	fe1ff06f          	j	80001d68 <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE+0x44>

0000000080001d8c <_ZN15MemoryAllocator4freeEPv>:
    if (!addr
    80001d8c:	10058a63          	beqz	a1,80001ea0 <_ZN15MemoryAllocator4freeEPv+0x114>
int MemoryAllocator::free(void *addr) {
    80001d90:	fd010113          	addi	sp,sp,-48
    80001d94:	02113423          	sd	ra,40(sp)
    80001d98:	02813023          	sd	s0,32(sp)
    80001d9c:	00913c23          	sd	s1,24(sp)
    80001da0:	01213823          	sd	s2,16(sp)
    80001da4:	01313423          	sd	s3,8(sp)
    80001da8:	01413023          	sd	s4,0(sp)
    80001dac:	03010413          	addi	s0,sp,48
    80001db0:	00050a13          	mv	s4,a0
    80001db4:	00058913          	mv	s2,a1
        || (uint8 *) addr < (uint8 *) HEAP_START_ADDR + sizeof(MemoryAllocator) + sizeof(BlockHeader) + sizeof(Mutex)
    80001db8:	00008797          	auipc	a5,0x8
    80001dbc:	0087b783          	ld	a5,8(a5) # 80009dc0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001dc0:	0007b783          	ld	a5,0(a5)
    80001dc4:	05878793          	addi	a5,a5,88
    80001dc8:	0ef5e063          	bltu	a1,a5,80001ea8 <_ZN15MemoryAllocator4freeEPv+0x11c>
        || addr >= HEAP_END_ADDR) {
    80001dcc:	00008797          	auipc	a5,0x8
    80001dd0:	01c7b783          	ld	a5,28(a5) # 80009de8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001dd4:	0007b783          	ld	a5,0(a5)
    80001dd8:	0cf5fc63          	bgeu	a1,a5,80001eb0 <_ZN15MemoryAllocator4freeEPv+0x124>
    BlockHeader *elem = (BlockHeader *) ((uint8 *) addr - sizeof(BlockHeader));
    80001ddc:	fe858993          	addi	s3,a1,-24
    if (!elem || elem->free || elem->next) {
    80001de0:	0c098c63          	beqz	s3,80001eb8 <_ZN15MemoryAllocator4freeEPv+0x12c>
    80001de4:	ff05c783          	lbu	a5,-16(a1)
    80001de8:	0c079c63          	bnez	a5,80001ec0 <_ZN15MemoryAllocator4freeEPv+0x134>
    80001dec:	ff85b483          	ld	s1,-8(a1)
    80001df0:	0c049c63          	bnez	s1,80001ec8 <_ZN15MemoryAllocator4freeEPv+0x13c>
    mutex->wait();
    80001df4:	00853503          	ld	a0,8(a0)
    80001df8:	00000097          	auipc	ra,0x0
    80001dfc:	128080e7          	jalr	296(ra) # 80001f20 <_ZN5Mutex4waitEv>
    BlockHeader *curr = freeMemHead, *prev = nullptr;
    80001e00:	000a3783          	ld	a5,0(s4)
    while (curr && curr < elem)
    80001e04:	00078a63          	beqz	a5,80001e18 <_ZN15MemoryAllocator4freeEPv+0x8c>
    80001e08:	0137f863          	bgeu	a5,s3,80001e18 <_ZN15MemoryAllocator4freeEPv+0x8c>
        prev = curr, curr = curr->next;
    80001e0c:	00078493          	mv	s1,a5
    80001e10:	0107b783          	ld	a5,16(a5)
    while (curr && curr < elem)
    80001e14:	ff1ff06f          	j	80001e04 <_ZN15MemoryAllocator4freeEPv+0x78>
    if ((prev && (uint8 *) prev + prev->size + sizeof(BlockHeader) > addr)
    80001e18:	00048a63          	beqz	s1,80001e2c <_ZN15MemoryAllocator4freeEPv+0xa0>
    80001e1c:	0004b703          	ld	a4,0(s1)
    80001e20:	01870713          	addi	a4,a4,24
    80001e24:	00e48733          	add	a4,s1,a4
    80001e28:	0ae96463          	bltu	s2,a4,80001ed0 <_ZN15MemoryAllocator4freeEPv+0x144>
        || (curr && (uint8 *) addr + elem->size  > (uint8 *) curr)) {
    80001e2c:	00078863          	beqz	a5,80001e3c <_ZN15MemoryAllocator4freeEPv+0xb0>
    80001e30:	fe893703          	ld	a4,-24(s2)
    80001e34:	00e90733          	add	a4,s2,a4
    80001e38:	0ae7e063          	bltu	a5,a4,80001ed8 <_ZN15MemoryAllocator4freeEPv+0x14c>
    elem->next = curr;
    80001e3c:	fef93c23          	sd	a5,-8(s2)
    elem->free = true;
    80001e40:	00100793          	li	a5,1
    80001e44:	fef90823          	sb	a5,-16(s2)
    (!prev ? freeMemHead : prev->next) = elem;
    80001e48:	04048863          	beqz	s1,80001e98 <_ZN15MemoryAllocator4freeEPv+0x10c>
    80001e4c:	0134b823          	sd	s3,16(s1)
    tryToJoin(elem);
    80001e50:	00098513          	mv	a0,s3
    80001e54:	00000097          	auipc	ra,0x0
    80001e58:	ed0080e7          	jalr	-304(ra) # 80001d24 <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE>
    tryToJoin(prev);
    80001e5c:	00048513          	mv	a0,s1
    80001e60:	00000097          	auipc	ra,0x0
    80001e64:	ec4080e7          	jalr	-316(ra) # 80001d24 <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE>
    mutex->signal();
    80001e68:	008a3503          	ld	a0,8(s4)
    80001e6c:	00000097          	auipc	ra,0x0
    80001e70:	134080e7          	jalr	308(ra) # 80001fa0 <_ZN5Mutex6signalEv>
    return 0;
    80001e74:	00000513          	li	a0,0
}
    80001e78:	02813083          	ld	ra,40(sp)
    80001e7c:	02013403          	ld	s0,32(sp)
    80001e80:	01813483          	ld	s1,24(sp)
    80001e84:	01013903          	ld	s2,16(sp)
    80001e88:	00813983          	ld	s3,8(sp)
    80001e8c:	00013a03          	ld	s4,0(sp)
    80001e90:	03010113          	addi	sp,sp,48
    80001e94:	00008067          	ret
    (!prev ? freeMemHead : prev->next) = elem;
    80001e98:	013a3023          	sd	s3,0(s4)
    80001e9c:	fb5ff06f          	j	80001e50 <_ZN15MemoryAllocator4freeEPv+0xc4>
        return -1;
    80001ea0:	fff00513          	li	a0,-1
}
    80001ea4:	00008067          	ret
        return -1;
    80001ea8:	fff00513          	li	a0,-1
    80001eac:	fcdff06f          	j	80001e78 <_ZN15MemoryAllocator4freeEPv+0xec>
    80001eb0:	fff00513          	li	a0,-1
    80001eb4:	fc5ff06f          	j	80001e78 <_ZN15MemoryAllocator4freeEPv+0xec>
        return -2;
    80001eb8:	ffe00513          	li	a0,-2
    80001ebc:	fbdff06f          	j	80001e78 <_ZN15MemoryAllocator4freeEPv+0xec>
    80001ec0:	ffe00513          	li	a0,-2
    80001ec4:	fb5ff06f          	j	80001e78 <_ZN15MemoryAllocator4freeEPv+0xec>
    80001ec8:	ffe00513          	li	a0,-2
    80001ecc:	fadff06f          	j	80001e78 <_ZN15MemoryAllocator4freeEPv+0xec>
        return -2;
    80001ed0:	ffe00513          	li	a0,-2
    80001ed4:	fa5ff06f          	j	80001e78 <_ZN15MemoryAllocator4freeEPv+0xec>
    80001ed8:	ffe00513          	li	a0,-2
    80001edc:	f9dff06f          	j	80001e78 <_ZN15MemoryAllocator4freeEPv+0xec>

0000000080001ee0 <_Z5kfreePv>:
int kfree(void *addr) {
    80001ee0:	fe010113          	addi	sp,sp,-32
    80001ee4:	00113c23          	sd	ra,24(sp)
    80001ee8:	00813823          	sd	s0,16(sp)
    80001eec:	00913423          	sd	s1,8(sp)
    80001ef0:	02010413          	addi	s0,sp,32
    80001ef4:	00050493          	mv	s1,a0
    return MemoryAllocator::getInstance()->free(addr);
    80001ef8:	00000097          	auipc	ra,0x0
    80001efc:	c84080e7          	jalr	-892(ra) # 80001b7c <_ZN15MemoryAllocator11getInstanceEv>
    80001f00:	00048593          	mv	a1,s1
    80001f04:	00000097          	auipc	ra,0x0
    80001f08:	e88080e7          	jalr	-376(ra) # 80001d8c <_ZN15MemoryAllocator4freeEPv>
}
    80001f0c:	01813083          	ld	ra,24(sp)
    80001f10:	01013403          	ld	s0,16(sp)
    80001f14:	00813483          	ld	s1,8(sp)
    80001f18:	02010113          	addi	sp,sp,32
    80001f1c:	00008067          	ret

0000000080001f20 <_ZN5Mutex4waitEv>:
#include "../h/Mutex.h"
#include "../h/TCB.h"
#include "../h/Riscv.h"

void Mutex::wait() {
    if (holder == TCB::running) return;
    80001f20:	02853703          	ld	a4,40(a0)
    80001f24:	00008797          	auipc	a5,0x8
    80001f28:	ebc7b783          	ld	a5,-324(a5) # 80009de0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001f2c:	0007b783          	ld	a5,0(a5)
    80001f30:	06f70663          	beq	a4,a5,80001f9c <_ZN5Mutex4waitEv+0x7c>
void Mutex::wait() {
    80001f34:	fd010113          	addi	sp,sp,-48
    80001f38:	02113423          	sd	ra,40(sp)
    80001f3c:	02813023          	sd	s0,32(sp)
    80001f40:	00913c23          	sd	s1,24(sp)
    80001f44:	03010413          	addi	s0,sp,48
    80001f48:	00050493          	mv	s1,a0
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80001f4c:	100027f3          	csrr	a5,sstatus
    80001f50:	fcf43823          	sd	a5,-48(s0)
    return sstatus;
    80001f54:	fd043783          	ld	a5,-48(s0)
    lock()
    80001f58:	fcf43c23          	sd	a5,-40(s0)
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80001f5c:	00200793          	li	a5,2
    80001f60:	1007b073          	csrc	sstatus,a5
    if (holder) block();
    80001f64:	00070663          	beqz	a4,80001f70 <_ZN5Mutex4waitEv+0x50>
    80001f68:	00000097          	auipc	ra,0x0
    80001f6c:	850080e7          	jalr	-1968(ra) # 800017b8 <_ZN15KernelSemaphore5blockEv>
    holder = TCB::running;
    80001f70:	00008797          	auipc	a5,0x8
    80001f74:	e707b783          	ld	a5,-400(a5) # 80009de0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001f78:	0007b783          	ld	a5,0(a5)
    80001f7c:	02f4b423          	sd	a5,40(s1)
    unlock()
    80001f80:	fd843783          	ld	a5,-40(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80001f84:	10079073          	csrw	sstatus,a5
}
    80001f88:	02813083          	ld	ra,40(sp)
    80001f8c:	02013403          	ld	s0,32(sp)
    80001f90:	01813483          	ld	s1,24(sp)
    80001f94:	03010113          	addi	sp,sp,48
    80001f98:	00008067          	ret
    80001f9c:	00008067          	ret

0000000080001fa0 <_ZN5Mutex6signalEv>:

void Mutex::signal() {
    if (holder != TCB::running) return;
    80001fa0:	02853703          	ld	a4,40(a0)
    80001fa4:	00008797          	auipc	a5,0x8
    80001fa8:	e3c7b783          	ld	a5,-452(a5) # 80009de0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001fac:	0007b783          	ld	a5,0(a5)
    80001fb0:	00f70463          	beq	a4,a5,80001fb8 <_ZN5Mutex6signalEv+0x18>
    80001fb4:	00008067          	ret
void Mutex::signal() {
    80001fb8:	fe010113          	addi	sp,sp,-32
    80001fbc:	00113c23          	sd	ra,24(sp)
    80001fc0:	00813823          	sd	s0,16(sp)
    80001fc4:	02010413          	addi	s0,sp,32
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80001fc8:	100027f3          	csrr	a5,sstatus
    80001fcc:	fef43023          	sd	a5,-32(s0)
    return sstatus;
    80001fd0:	fe043783          	ld	a5,-32(s0)
    lock()
    80001fd4:	fef43423          	sd	a5,-24(s0)
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80001fd8:	00200793          	li	a5,2
    80001fdc:	1007b073          	csrc	sstatus,a5
    holder = nullptr;
    80001fe0:	02053423          	sd	zero,40(a0)
    deblock();
    80001fe4:	00000097          	auipc	ra,0x0
    80001fe8:	82c080e7          	jalr	-2004(ra) # 80001810 <_ZN15KernelSemaphore7deblockEv>
    unlock()
    80001fec:	fe843783          	ld	a5,-24(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80001ff0:	10079073          	csrw	sstatus,a5
}
    80001ff4:	01813083          	ld	ra,24(sp)
    80001ff8:	01013403          	ld	s0,16(sp)
    80001ffc:	02010113          	addi	sp,sp,32
    80002000:	00008067          	ret

0000000080002004 <_ZN5Riscv10popSppSpieEb>:
#include "../h/SysPrint.h"
#include "../h/TCB.h"
#include "../h/Kernel.h"
#include "../h/TimerInterrupt.h"

void Riscv::popSppSpie(bool prMode) {
    80002004:	ff010113          	addi	sp,sp,-16
    80002008:	00813423          	sd	s0,8(sp)
    8000200c:	01010413          	addi	s0,sp,16
    if(prMode) ms_sstatus(SSTATUS_SPP);
    80002010:	02050463          	beqz	a0,80002038 <_ZN5Riscv10popSppSpieEb+0x34>
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80002014:	10000793          	li	a5,256
    80002018:	1007a073          	csrs	sstatus,a5
    8000201c:	02000793          	li	a5,32
    80002020:	1007a073          	csrs	sstatus,a5
    else mc_sstatus(SSTATUS_SPP);
    ms_sstatus(SSTATUS_SPIE);
    __asm__ volatile ("csrw sepc, ra");
    80002024:	14109073          	csrw	sepc,ra
    __asm__ volatile ("sret");
    80002028:	10200073          	sret
}
    8000202c:	00813403          	ld	s0,8(sp)
    80002030:	01010113          	addi	sp,sp,16
    80002034:	00008067          	ret
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80002038:	10000793          	li	a5,256
    8000203c:	1007b073          	csrc	sstatus,a5
}
    80002040:	fddff06f          	j	8000201c <_ZN5Riscv10popSppSpieEb+0x18>

0000000080002044 <_ZN5Riscv20handleSupervisorTrapEv>:

void Riscv::handleSupervisorTrap() {
    80002044:	f6010113          	addi	sp,sp,-160
    80002048:	08113c23          	sd	ra,152(sp)
    8000204c:	08813823          	sd	s0,144(sp)
    80002050:	08913423          	sd	s1,136(sp)
    80002054:	09213023          	sd	s2,128(sp)
    80002058:	0a010413          	addi	s0,sp,160
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    8000205c:	142027f3          	csrr	a5,scause
    80002060:	f8f43c23          	sd	a5,-104(s0)
    return scause;
    80002064:	f9843483          	ld	s1,-104(s0)
    uint64 scause = r_scause();
    switch (scause) {
    80002068:	fff00793          	li	a5,-1
    8000206c:	03f79793          	slli	a5,a5,0x3f
    80002070:	00178793          	addi	a5,a5,1
    80002074:	0cf48663          	beq	s1,a5,80002140 <_ZN5Riscv20handleSupervisorTrapEv+0xfc>
    80002078:	fff00793          	li	a5,-1
    8000207c:	03f79793          	slli	a5,a5,0x3f
    80002080:	00178793          	addi	a5,a5,1
    80002084:	0497ea63          	bltu	a5,s1,800020d8 <_ZN5Riscv20handleSupervisorTrapEv+0x94>
    80002088:	00800793          	li	a5,8
    8000208c:	06f48463          	beq	s1,a5,800020f4 <_ZN5Riscv20handleSupervisorTrapEv+0xb0>
    80002090:	00900793          	li	a5,9
    80002094:	14f49263          	bne	s1,a5,800021d8 <_ZN5Riscv20handleSupervisorTrapEv+0x194>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80002098:	141027f3          	csrr	a5,sepc
    8000209c:	faf43c23          	sd	a5,-72(s0)
    return sepc;
    800020a0:	fb843783          	ld	a5,-72(s0)
            w_sepc(sepc);
            break;
        }
        case 0x0000000000000009UL: {
            // interrupt: no, cause code: environment call from S-mode (9)
            volatile uint64 sepc = r_sepc() + 4;
    800020a4:	00478793          	addi	a5,a5,4
    800020a8:	f6f43c23          	sd	a5,-136(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    800020ac:	100027f3          	csrr	a5,sstatus
    800020b0:	faf43823          	sd	a5,-80(s0)
    return sstatus;
    800020b4:	fb043783          	ld	a5,-80(s0)
            volatile uint64 sstatus = r_sstatus();
    800020b8:	f8f43023          	sd	a5,-128(s0)

            TCB::dispatch();
    800020bc:	00001097          	auipc	ra,0x1
    800020c0:	d2c080e7          	jalr	-724(ra) # 80002de8 <_ZN3TCB8dispatchEv>

            w_sstatus(sstatus);
    800020c4:	f8043783          	ld	a5,-128(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    800020c8:	10079073          	csrw	sstatus,a5
            w_sepc(sepc);
    800020cc:	f7843783          	ld	a5,-136(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    800020d0:	14179073          	csrw	sepc,a5
}
    800020d4:	0e00006f          	j	800021b4 <_ZN5Riscv20handleSupervisorTrapEv+0x170>
    switch (scause) {
    800020d8:	fff00793          	li	a5,-1
    800020dc:	03f79793          	slli	a5,a5,0x3f
    800020e0:	00978793          	addi	a5,a5,9
    800020e4:	0ef49a63          	bne	s1,a5,800021d8 <_ZN5Riscv20handleSupervisorTrapEv+0x194>
            w_sepc(sepc);
            break;
        }
        case 0x8000000000000009UL: {
            // interrupt: yes, cause code: supervisor external interrupt (console)
            console_handler();
    800020e8:	00005097          	auipc	ra,0x5
    800020ec:	1c8080e7          	jalr	456(ra) # 800072b0 <console_handler>
            break;
    800020f0:	0c40006f          	j	800021b4 <_ZN5Riscv20handleSupervisorTrapEv+0x170>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    800020f4:	141027f3          	csrr	a5,sepc
    800020f8:	faf43423          	sd	a5,-88(s0)
    return sepc;
    800020fc:	fa843783          	ld	a5,-88(s0)
            volatile uint64 sepc = r_sepc() + 4;
    80002100:	00478793          	addi	a5,a5,4
    80002104:	f6f43423          	sd	a5,-152(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80002108:	100027f3          	csrr	a5,sstatus
    8000210c:	faf43023          	sd	a5,-96(s0)
    return sstatus;
    80002110:	fa043783          	ld	a5,-96(s0)
            volatile uint64 sstatus = r_sstatus();
    80002114:	f6f43823          	sd	a5,-144(s0)
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80002118:	00200493          	li	s1,2
    8000211c:	1004a073          	csrs	sstatus,s1
            Kernel::handleSystemCall();
    80002120:	fffff097          	auipc	ra,0xfffff
    80002124:	528080e7          	jalr	1320(ra) # 80001648 <_ZN6Kernel16handleSystemCallEv>
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80002128:	1004b073          	csrc	sstatus,s1
            w_sstatus(sstatus);
    8000212c:	f7043783          	ld	a5,-144(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80002130:	10079073          	csrw	sstatus,a5
            w_sepc(sepc);
    80002134:	f6843783          	ld	a5,-152(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80002138:	14179073          	csrw	sepc,a5
}
    8000213c:	0780006f          	j	800021b4 <_ZN5Riscv20handleSupervisorTrapEv+0x170>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80002140:	141027f3          	csrr	a5,sepc
    80002144:	fcf43423          	sd	a5,-56(s0)
    return sepc;
    80002148:	fc843783          	ld	a5,-56(s0)
            volatile uint64 sepc = r_sepc();
    8000214c:	f8f43423          	sd	a5,-120(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80002150:	100027f3          	csrr	a5,sstatus
    80002154:	fcf43023          	sd	a5,-64(s0)
    return sstatus;
    80002158:	fc043783          	ld	a5,-64(s0)
            volatile uint64 sstatus = r_sstatus();
    8000215c:	f8f43823          	sd	a5,-112(s0)
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    80002160:	00200913          	li	s2,2
    80002164:	14493073          	csrc	sip,s2
            TCB::timeSliceCounter++;
    80002168:	00008497          	auipc	s1,0x8
    8000216c:	c684b483          	ld	s1,-920(s1) # 80009dd0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002170:	0004b783          	ld	a5,0(s1)
    80002174:	00178793          	addi	a5,a5,1
    80002178:	00f4b023          	sd	a5,0(s1)
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    8000217c:	10092073          	csrs	sstatus,s2
            TimerInterrupt::tick();
    80002180:	00001097          	auipc	ra,0x1
    80002184:	608080e7          	jalr	1544(ra) # 80003788 <_ZN14TimerInterrupt4tickEv>
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80002188:	10093073          	csrc	sstatus,s2
            if (TCB::timeSliceCounter >= TCB::running->timeSlice) {
    8000218c:	00008797          	auipc	a5,0x8
    80002190:	c547b783          	ld	a5,-940(a5) # 80009de0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002194:	0007b783          	ld	a5,0(a5)
    80002198:	0387b703          	ld	a4,56(a5)
    8000219c:	0004b783          	ld	a5,0(s1)
    800021a0:	02e7f663          	bgeu	a5,a4,800021cc <_ZN5Riscv20handleSupervisorTrapEv+0x188>
            w_sstatus(sstatus);
    800021a4:	f9043783          	ld	a5,-112(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    800021a8:	10079073          	csrw	sstatus,a5
            w_sepc(sepc);
    800021ac:	f8843783          	ld	a5,-120(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    800021b0:	14179073          	csrw	sepc,a5
            kprintString("\nStval: ");
            kprintUnsigned(r_stval());
            kprintString("\n");
        }
    }
    800021b4:	09813083          	ld	ra,152(sp)
    800021b8:	09013403          	ld	s0,144(sp)
    800021bc:	08813483          	ld	s1,136(sp)
    800021c0:	08013903          	ld	s2,128(sp)
    800021c4:	0a010113          	addi	sp,sp,160
    800021c8:	00008067          	ret
                TCB::dispatch();
    800021cc:	00001097          	auipc	ra,0x1
    800021d0:	c1c080e7          	jalr	-996(ra) # 80002de8 <_ZN3TCB8dispatchEv>
    800021d4:	fd1ff06f          	j	800021a4 <_ZN5Riscv20handleSupervisorTrapEv+0x160>
            kprintString("Unexpected trap cause:\n");
    800021d8:	00006517          	auipc	a0,0x6
    800021dc:	fc850513          	addi	a0,a0,-56 # 800081a0 <CONSOLE_STATUS+0x190>
    800021e0:	00000097          	auipc	ra,0x0
    800021e4:	654080e7          	jalr	1620(ra) # 80002834 <_Z12kprintStringPKc>
            kprintString("Scause: ");
    800021e8:	00006517          	auipc	a0,0x6
    800021ec:	fd050513          	addi	a0,a0,-48 # 800081b8 <CONSOLE_STATUS+0x1a8>
    800021f0:	00000097          	auipc	ra,0x0
    800021f4:	644080e7          	jalr	1604(ra) # 80002834 <_Z12kprintStringPKc>
            kprintUnsigned(scause);
    800021f8:	00048513          	mv	a0,s1
    800021fc:	00001097          	auipc	ra,0x1
    80002200:	890080e7          	jalr	-1904(ra) # 80002a8c <_Z14kprintUnsignedm>
            kprintString("\nSepc: ");
    80002204:	00006517          	auipc	a0,0x6
    80002208:	fc450513          	addi	a0,a0,-60 # 800081c8 <CONSOLE_STATUS+0x1b8>
    8000220c:	00000097          	auipc	ra,0x0
    80002210:	628080e7          	jalr	1576(ra) # 80002834 <_Z12kprintStringPKc>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80002214:	141027f3          	csrr	a5,sepc
    80002218:	fcf43c23          	sd	a5,-40(s0)
    return sepc;
    8000221c:	fd843503          	ld	a0,-40(s0)
            kprintUnsigned(r_sepc());
    80002220:	00001097          	auipc	ra,0x1
    80002224:	86c080e7          	jalr	-1940(ra) # 80002a8c <_Z14kprintUnsignedm>
            kprintString("\nStval: ");
    80002228:	00006517          	auipc	a0,0x6
    8000222c:	fa850513          	addi	a0,a0,-88 # 800081d0 <CONSOLE_STATUS+0x1c0>
    80002230:	00000097          	auipc	ra,0x0
    80002234:	604080e7          	jalr	1540(ra) # 80002834 <_Z12kprintStringPKc>
    __asm__ volatile ("csrr %[stval], stval" : [stval] "=r"(stval));
    80002238:	143027f3          	csrr	a5,stval
    8000223c:	fcf43823          	sd	a5,-48(s0)
    return stval;
    80002240:	fd043503          	ld	a0,-48(s0)
            kprintUnsigned(r_stval());
    80002244:	00001097          	auipc	ra,0x1
    80002248:	848080e7          	jalr	-1976(ra) # 80002a8c <_Z14kprintUnsignedm>
            kprintString("\n");
    8000224c:	00006517          	auipc	a0,0x6
    80002250:	f3c50513          	addi	a0,a0,-196 # 80008188 <CONSOLE_STATUS+0x178>
    80002254:	00000097          	auipc	ra,0x0
    80002258:	5e0080e7          	jalr	1504(ra) # 80002834 <_Z12kprintStringPKc>
    8000225c:	f59ff06f          	j	800021b4 <_ZN5Riscv20handleSupervisorTrapEv+0x170>

0000000080002260 <_ZN9Scheduler11getInstanceEv>:
    getInstance()->readyThreadQueue.addLast(tcb->getNode());
    getInstance()->mutex.signal();
}

Scheduler *Scheduler::getInstance() {
    if (!instance) instance = new Scheduler;
    80002260:	00008797          	auipc	a5,0x8
    80002264:	be07b783          	ld	a5,-1056(a5) # 80009e40 <_ZN9Scheduler8instanceE>
    80002268:	00078863          	beqz	a5,80002278 <_ZN9Scheduler11getInstanceEv+0x18>
    return instance;
}
    8000226c:	00008517          	auipc	a0,0x8
    80002270:	bd453503          	ld	a0,-1068(a0) # 80009e40 <_ZN9Scheduler8instanceE>
    80002274:	00008067          	ret
Scheduler *Scheduler::getInstance() {
    80002278:	ff010113          	addi	sp,sp,-16
    8000227c:	00113423          	sd	ra,8(sp)
    80002280:	00813023          	sd	s0,0(sp)
    80002284:	01010413          	addi	s0,sp,16
        return kmalloc(size);
    80002288:	05800513          	li	a0,88
    8000228c:	00000097          	auipc	ra,0x0
    80002290:	a58080e7          	jalr	-1448(ra) # 80001ce4 <_Z7kmallocm>
    explicit ThreadList() = default;
    80002294:	00053423          	sd	zero,8(a0)
    80002298:	00053823          	sd	zero,16(a0)
    8000229c:	00053c23          	sd	zero,24(a0)
    800022a0:	02052023          	sw	zero,32(a0)
    800022a4:	00100793          	li	a5,1
    800022a8:	02f52423          	sw	a5,40(a0)
    800022ac:	02053823          	sd	zero,48(a0)
    800022b0:	02053c23          	sd	zero,56(a0)
    800022b4:	04053023          	sd	zero,64(a0)
    800022b8:	04052423          	sw	zero,72(a0)

class TCB;

#include "KernelSemaphore.h"

class Mutex : public KernelSemaphore {
    800022bc:	04053823          	sd	zero,80(a0)
    if (!instance) instance = new Scheduler;
    800022c0:	00008797          	auipc	a5,0x8
    800022c4:	b8a7b023          	sd	a0,-1152(a5) # 80009e40 <_ZN9Scheduler8instanceE>
}
    800022c8:	00008517          	auipc	a0,0x8
    800022cc:	b7853503          	ld	a0,-1160(a0) # 80009e40 <_ZN9Scheduler8instanceE>
    800022d0:	00813083          	ld	ra,8(sp)
    800022d4:	00013403          	ld	s0,0(sp)
    800022d8:	01010113          	addi	sp,sp,16
    800022dc:	00008067          	ret

00000000800022e0 <_ZN9Scheduler3getEv>:
TCB *Scheduler::get() {
    800022e0:	fe010113          	addi	sp,sp,-32
    800022e4:	00113c23          	sd	ra,24(sp)
    800022e8:	00813823          	sd	s0,16(sp)
    800022ec:	00913423          	sd	s1,8(sp)
    800022f0:	02010413          	addi	s0,sp,32
    getInstance()->mutex.wait();
    800022f4:	00000097          	auipc	ra,0x0
    800022f8:	f6c080e7          	jalr	-148(ra) # 80002260 <_ZN9Scheduler11getInstanceEv>
    800022fc:	02850513          	addi	a0,a0,40
    80002300:	00000097          	auipc	ra,0x0
    80002304:	c20080e7          	jalr	-992(ra) # 80001f20 <_ZN5Mutex4waitEv>
    TCB *tcb = getInstance()->readyThreadQueue.removeFirst();
    80002308:	00000097          	auipc	ra,0x0
    8000230c:	f58080e7          	jalr	-168(ra) # 80002260 <_ZN9Scheduler11getInstanceEv>
    80002310:	00850513          	addi	a0,a0,8
    80002314:	00001097          	auipc	ra,0x1
    80002318:	120080e7          	jalr	288(ra) # 80003434 <_ZN10ThreadList11removeFirstEv>
    8000231c:	00050493          	mv	s1,a0
    getInstance()->mutex.signal();
    80002320:	00000097          	auipc	ra,0x0
    80002324:	f40080e7          	jalr	-192(ra) # 80002260 <_ZN9Scheduler11getInstanceEv>
    80002328:	02850513          	addi	a0,a0,40
    8000232c:	00000097          	auipc	ra,0x0
    80002330:	c74080e7          	jalr	-908(ra) # 80001fa0 <_ZN5Mutex6signalEv>
}
    80002334:	00048513          	mv	a0,s1
    80002338:	01813083          	ld	ra,24(sp)
    8000233c:	01013403          	ld	s0,16(sp)
    80002340:	00813483          	ld	s1,8(sp)
    80002344:	02010113          	addi	sp,sp,32
    80002348:	00008067          	ret

000000008000234c <_ZN9Scheduler3putEP3TCB>:
void Scheduler::put(TCB *tcb) {
    8000234c:	fe010113          	addi	sp,sp,-32
    80002350:	00113c23          	sd	ra,24(sp)
    80002354:	00813823          	sd	s0,16(sp)
    80002358:	00913423          	sd	s1,8(sp)
    8000235c:	02010413          	addi	s0,sp,32
    80002360:	00050493          	mv	s1,a0
    getInstance()->mutex.wait();
    80002364:	00000097          	auipc	ra,0x0
    80002368:	efc080e7          	jalr	-260(ra) # 80002260 <_ZN9Scheduler11getInstanceEv>
    8000236c:	02850513          	addi	a0,a0,40
    80002370:	00000097          	auipc	ra,0x0
    80002374:	bb0080e7          	jalr	-1104(ra) # 80001f20 <_ZN5Mutex4waitEv>
    getInstance()->readyThreadQueue.addLast(tcb->getNode());
    80002378:	00000097          	auipc	ra,0x0
    8000237c:	ee8080e7          	jalr	-280(ra) # 80002260 <_ZN9Scheduler11getInstanceEv>
    80002380:	0a048593          	addi	a1,s1,160
    80002384:	00850513          	addi	a0,a0,8
    80002388:	00001097          	auipc	ra,0x1
    8000238c:	068080e7          	jalr	104(ra) # 800033f0 <_ZN10ThreadList7addLastEP10ThreadNode>
    getInstance()->mutex.signal();
    80002390:	00000097          	auipc	ra,0x0
    80002394:	ed0080e7          	jalr	-304(ra) # 80002260 <_ZN9Scheduler11getInstanceEv>
    80002398:	02850513          	addi	a0,a0,40
    8000239c:	00000097          	auipc	ra,0x0
    800023a0:	c04080e7          	jalr	-1020(ra) # 80001fa0 <_ZN5Mutex6signalEv>
}
    800023a4:	01813083          	ld	ra,24(sp)
    800023a8:	01013403          	ld	s0,16(sp)
    800023ac:	00813483          	ld	s1,8(sp)
    800023b0:	02010113          	addi	sp,sp,32
    800023b4:	00008067          	ret

00000000800023b8 <_ZN9SchedulerD1Ev>:

Scheduler::~Scheduler() {
    800023b8:	fe010113          	addi	sp,sp,-32
    800023bc:	00113c23          	sd	ra,24(sp)
    800023c0:	00813823          	sd	s0,16(sp)
    800023c4:	00913423          	sd	s1,8(sp)
    800023c8:	01213023          	sd	s2,0(sp)
    800023cc:	02010413          	addi	s0,sp,32
    800023d0:	00050913          	mv	s2,a0
        return size == 0;
    800023d4:	02092783          	lw	a5,32(s2)
    while (!readyThreadQueue.isEmpty()) {
    800023d8:	02078863          	beqz	a5,80002408 <_ZN9SchedulerD1Ev+0x50>
        delete readyThreadQueue.removeFirst();
    800023dc:	00890513          	addi	a0,s2,8
    800023e0:	00001097          	auipc	ra,0x1
    800023e4:	054080e7          	jalr	84(ra) # 80003434 <_ZN10ThreadList11removeFirstEv>
    800023e8:	00050493          	mv	s1,a0
    800023ec:	fe0504e3          	beqz	a0,800023d4 <_ZN9SchedulerD1Ev+0x1c>
    800023f0:	00001097          	auipc	ra,0x1
    800023f4:	bd0080e7          	jalr	-1072(ra) # 80002fc0 <_ZN3TCBD1Ev>
        kfree(addr);
    800023f8:	00048513          	mv	a0,s1
    800023fc:	00000097          	auipc	ra,0x0
    80002400:	ae4080e7          	jalr	-1308(ra) # 80001ee0 <_Z5kfreePv>
    }
    80002404:	fd1ff06f          	j	800023d4 <_ZN9SchedulerD1Ev+0x1c>
    80002408:	02890513          	addi	a0,s2,40
    8000240c:	fffff097          	auipc	ra,0xfffff
    80002410:	504080e7          	jalr	1284(ra) # 80001910 <_ZN15KernelSemaphoreD1Ev>
Scheduler::~Scheduler() {
    80002414:	00890513          	addi	a0,s2,8
    80002418:	00001097          	auipc	ra,0x1
    8000241c:	1c0080e7          	jalr	448(ra) # 800035d8 <_ZN10ThreadListD1Ev>
    }
}
    80002420:	01813083          	ld	ra,24(sp)
    80002424:	01013403          	ld	s0,16(sp)
    80002428:	00813483          	ld	s1,8(sp)
    8000242c:	00013903          	ld	s2,0(sp)
    80002430:	02010113          	addi	sp,sp,32
    80002434:	00008067          	ret

0000000080002438 <_Z18callSupervisorTrapmPv>:
#include "../h/syscall_c.h"

void *callSupervisorTrap(uint64 param, void *args) {
    80002438:	ff010113          	addi	sp,sp,-16
    8000243c:	00813423          	sd	s0,8(sp)
    80002440:	01010413          	addi	s0,sp,16
    __asm__ volatile ("ecall");
    80002444:	00000073          	ecall

    return (void *) param;
}
    80002448:	00813403          	ld	s0,8(sp)
    8000244c:	01010113          	addi	sp,sp,16
    80002450:	00008067          	ret

0000000080002454 <_ZN7_threadC1EPFvPvES0_>:

_thread::_thread(_thread::Body body, void *arg) : id(0), body(body), arg(arg) {
    80002454:	ff010113          	addi	sp,sp,-16
    80002458:	00813423          	sd	s0,8(sp)
    8000245c:	01010413          	addi	s0,sp,16
    80002460:	00053023          	sd	zero,0(a0)
    80002464:	00b53423          	sd	a1,8(a0)
    80002468:	00c53823          	sd	a2,16(a0)
}
    8000246c:	00813403          	ld	s0,8(sp)
    80002470:	01010113          	addi	sp,sp,16
    80002474:	00008067          	ret

0000000080002478 <_Z9mem_allocm>:

_sem::~_sem() {
    sem_close(this);
}

void *mem_alloc(size_t size) {
    80002478:	ff010113          	addi	sp,sp,-16
    8000247c:	00113423          	sd	ra,8(sp)
    80002480:	00813023          	sd	s0,0(sp)
    80002484:	01010413          	addi	s0,sp,16
    80002488:	00050593          	mv	a1,a0
    return callSupervisorTrap(0x01, (void *) size);
    8000248c:	00100513          	li	a0,1
    80002490:	00000097          	auipc	ra,0x0
    80002494:	fa8080e7          	jalr	-88(ra) # 80002438 <_Z18callSupervisorTrapmPv>
}
    80002498:	00813083          	ld	ra,8(sp)
    8000249c:	00013403          	ld	s0,0(sp)
    800024a0:	01010113          	addi	sp,sp,16
    800024a4:	00008067          	ret

00000000800024a8 <_Z8mem_freePv>:

int mem_free(void *addr) {
    800024a8:	ff010113          	addi	sp,sp,-16
    800024ac:	00113423          	sd	ra,8(sp)
    800024b0:	00813023          	sd	s0,0(sp)
    800024b4:	01010413          	addi	s0,sp,16
    800024b8:	00050593          	mv	a1,a0
    return (uint64) callSupervisorTrap(0x02, addr);
    800024bc:	00200513          	li	a0,2
    800024c0:	00000097          	auipc	ra,0x0
    800024c4:	f78080e7          	jalr	-136(ra) # 80002438 <_Z18callSupervisorTrapmPv>
}
    800024c8:	0005051b          	sext.w	a0,a0
    800024cc:	00813083          	ld	ra,8(sp)
    800024d0:	00013403          	ld	s0,0(sp)
    800024d4:	01010113          	addi	sp,sp,16
    800024d8:	00008067          	ret

00000000800024dc <_Z13thread_createPP7_threadPFvPvES2_>:

int thread_create(thread_t *handle, void(*start_routine)(void *), void *arg) {
    if (!handle) return -1;
    800024dc:	06050c63          	beqz	a0,80002554 <_Z13thread_createPP7_threadPFvPvES2_+0x78>
int thread_create(thread_t *handle, void(*start_routine)(void *), void *arg) {
    800024e0:	fb010113          	addi	sp,sp,-80
    800024e4:	04113423          	sd	ra,72(sp)
    800024e8:	04813023          	sd	s0,64(sp)
    800024ec:	02913c23          	sd	s1,56(sp)
    800024f0:	03213823          	sd	s2,48(sp)
    800024f4:	03313423          	sd	s3,40(sp)
    800024f8:	05010413          	addi	s0,sp,80
    800024fc:	00050493          	mv	s1,a0
    80002500:	00058993          	mv	s3,a1
    80002504:	00060913          	mv	s2,a2
    *handle = new _thread;
    80002508:	01800513          	li	a0,24
    8000250c:	00000097          	auipc	ra,0x0
    80002510:	288080e7          	jalr	648(ra) # 80002794 <_Znwm>
    80002514:	00a4b023          	sd	a0,0(s1)
    uint64 args[] = {(uint64) *handle, (uint64) start_routine, (uint64) arg};
    80002518:	faa43c23          	sd	a0,-72(s0)
    8000251c:	fd343023          	sd	s3,-64(s0)
    80002520:	fd243423          	sd	s2,-56(s0)
    return (uint64) callSupervisorTrap(0x11, args);
    80002524:	fb840593          	addi	a1,s0,-72
    80002528:	01100513          	li	a0,17
    8000252c:	00000097          	auipc	ra,0x0
    80002530:	f0c080e7          	jalr	-244(ra) # 80002438 <_Z18callSupervisorTrapmPv>
    80002534:	0005051b          	sext.w	a0,a0
}
    80002538:	04813083          	ld	ra,72(sp)
    8000253c:	04013403          	ld	s0,64(sp)
    80002540:	03813483          	ld	s1,56(sp)
    80002544:	03013903          	ld	s2,48(sp)
    80002548:	02813983          	ld	s3,40(sp)
    8000254c:	05010113          	addi	sp,sp,80
    80002550:	00008067          	ret
    if (!handle) return -1;
    80002554:	fff00513          	li	a0,-1
}
    80002558:	00008067          	ret

000000008000255c <_Z11thread_exitv>:

int thread_exit() {
    8000255c:	ff010113          	addi	sp,sp,-16
    80002560:	00113423          	sd	ra,8(sp)
    80002564:	00813023          	sd	s0,0(sp)
    80002568:	01010413          	addi	s0,sp,16
    return (uint64) callSupervisorTrap(0x12, 0);
    8000256c:	00000593          	li	a1,0
    80002570:	01200513          	li	a0,18
    80002574:	00000097          	auipc	ra,0x0
    80002578:	ec4080e7          	jalr	-316(ra) # 80002438 <_Z18callSupervisorTrapmPv>
}
    8000257c:	0005051b          	sext.w	a0,a0
    80002580:	00813083          	ld	ra,8(sp)
    80002584:	00013403          	ld	s0,0(sp)
    80002588:	01010113          	addi	sp,sp,16
    8000258c:	00008067          	ret

0000000080002590 <_Z15thread_dispatchv>:

void thread_dispatch() {
    80002590:	ff010113          	addi	sp,sp,-16
    80002594:	00113423          	sd	ra,8(sp)
    80002598:	00813023          	sd	s0,0(sp)
    8000259c:	01010413          	addi	s0,sp,16
    callSupervisorTrap(0x13, 0);
    800025a0:	00000593          	li	a1,0
    800025a4:	01300513          	li	a0,19
    800025a8:	00000097          	auipc	ra,0x0
    800025ac:	e90080e7          	jalr	-368(ra) # 80002438 <_Z18callSupervisorTrapmPv>
}
    800025b0:	00813083          	ld	ra,8(sp)
    800025b4:	00013403          	ld	s0,0(sp)
    800025b8:	01010113          	addi	sp,sp,16
    800025bc:	00008067          	ret

00000000800025c0 <_Z8sem_openPP4_semj>:

int sem_open(sem_t *handle, unsigned init) {
    if (!handle) return -1;
    800025c0:	06050863          	beqz	a0,80002630 <_Z8sem_openPP4_semj+0x70>
int sem_open(sem_t *handle, unsigned init) {
    800025c4:	fd010113          	addi	sp,sp,-48
    800025c8:	02113423          	sd	ra,40(sp)
    800025cc:	02813023          	sd	s0,32(sp)
    800025d0:	00913c23          	sd	s1,24(sp)
    800025d4:	01213823          	sd	s2,16(sp)
    800025d8:	03010413          	addi	s0,sp,48
    800025dc:	00050913          	mv	s2,a0
    800025e0:	00058493          	mv	s1,a1
    *handle = new _sem;
    800025e4:	00800513          	li	a0,8
    800025e8:	00000097          	auipc	ra,0x0
    800025ec:	1ac080e7          	jalr	428(ra) # 80002794 <_Znwm>
    800025f0:	00a93023          	sd	a0,0(s2)
    uint64 args[] = {(uint64) *handle, (uint64) init};
    800025f4:	fca43823          	sd	a0,-48(s0)
    800025f8:	02049593          	slli	a1,s1,0x20
    800025fc:	0205d593          	srli	a1,a1,0x20
    80002600:	fcb43c23          	sd	a1,-40(s0)
    return (uint64) callSupervisorTrap(0x21, args);
    80002604:	fd040593          	addi	a1,s0,-48
    80002608:	02100513          	li	a0,33
    8000260c:	00000097          	auipc	ra,0x0
    80002610:	e2c080e7          	jalr	-468(ra) # 80002438 <_Z18callSupervisorTrapmPv>
    80002614:	0005051b          	sext.w	a0,a0
}
    80002618:	02813083          	ld	ra,40(sp)
    8000261c:	02013403          	ld	s0,32(sp)
    80002620:	01813483          	ld	s1,24(sp)
    80002624:	01013903          	ld	s2,16(sp)
    80002628:	03010113          	addi	sp,sp,48
    8000262c:	00008067          	ret
    if (!handle) return -1;
    80002630:	fff00513          	li	a0,-1
}
    80002634:	00008067          	ret

0000000080002638 <_Z9sem_closeP4_sem>:

int sem_close(sem_t handle) {
    80002638:	ff010113          	addi	sp,sp,-16
    8000263c:	00113423          	sd	ra,8(sp)
    80002640:	00813023          	sd	s0,0(sp)
    80002644:	01010413          	addi	s0,sp,16
    80002648:	00050593          	mv	a1,a0
    return (uint64) callSupervisorTrap(0x22, handle);
    8000264c:	02200513          	li	a0,34
    80002650:	00000097          	auipc	ra,0x0
    80002654:	de8080e7          	jalr	-536(ra) # 80002438 <_Z18callSupervisorTrapmPv>
}
    80002658:	0005051b          	sext.w	a0,a0
    8000265c:	00813083          	ld	ra,8(sp)
    80002660:	00013403          	ld	s0,0(sp)
    80002664:	01010113          	addi	sp,sp,16
    80002668:	00008067          	ret

000000008000266c <_ZN4_semD1Ev>:
_sem::~_sem() {
    8000266c:	ff010113          	addi	sp,sp,-16
    80002670:	00113423          	sd	ra,8(sp)
    80002674:	00813023          	sd	s0,0(sp)
    80002678:	01010413          	addi	s0,sp,16
    sem_close(this);
    8000267c:	00000097          	auipc	ra,0x0
    80002680:	fbc080e7          	jalr	-68(ra) # 80002638 <_Z9sem_closeP4_sem>
}
    80002684:	00813083          	ld	ra,8(sp)
    80002688:	00013403          	ld	s0,0(sp)
    8000268c:	01010113          	addi	sp,sp,16
    80002690:	00008067          	ret

0000000080002694 <_Z8sem_waitP4_sem>:

int sem_wait(sem_t handle) {
    80002694:	ff010113          	addi	sp,sp,-16
    80002698:	00113423          	sd	ra,8(sp)
    8000269c:	00813023          	sd	s0,0(sp)
    800026a0:	01010413          	addi	s0,sp,16
    800026a4:	00050593          	mv	a1,a0
    return (uint64) callSupervisorTrap(0x23, handle);
    800026a8:	02300513          	li	a0,35
    800026ac:	00000097          	auipc	ra,0x0
    800026b0:	d8c080e7          	jalr	-628(ra) # 80002438 <_Z18callSupervisorTrapmPv>
}
    800026b4:	0005051b          	sext.w	a0,a0
    800026b8:	00813083          	ld	ra,8(sp)
    800026bc:	00013403          	ld	s0,0(sp)
    800026c0:	01010113          	addi	sp,sp,16
    800026c4:	00008067          	ret

00000000800026c8 <_Z10sem_signalP4_sem>:

int sem_signal(sem_t handle) {
    800026c8:	ff010113          	addi	sp,sp,-16
    800026cc:	00113423          	sd	ra,8(sp)
    800026d0:	00813023          	sd	s0,0(sp)
    800026d4:	01010413          	addi	s0,sp,16
    800026d8:	00050593          	mv	a1,a0
    return (uint64) callSupervisorTrap(0x24, handle);
    800026dc:	02400513          	li	a0,36
    800026e0:	00000097          	auipc	ra,0x0
    800026e4:	d58080e7          	jalr	-680(ra) # 80002438 <_Z18callSupervisorTrapmPv>
}
    800026e8:	0005051b          	sext.w	a0,a0
    800026ec:	00813083          	ld	ra,8(sp)
    800026f0:	00013403          	ld	s0,0(sp)
    800026f4:	01010113          	addi	sp,sp,16
    800026f8:	00008067          	ret

00000000800026fc <_Z10time_sleepm>:

int time_sleep(time_t time) {
    800026fc:	ff010113          	addi	sp,sp,-16
    80002700:	00113423          	sd	ra,8(sp)
    80002704:	00813023          	sd	s0,0(sp)
    80002708:	01010413          	addi	s0,sp,16
    8000270c:	00050593          	mv	a1,a0
    return (uint64) callSupervisorTrap(0x31, (void *) time);
    80002710:	03100513          	li	a0,49
    80002714:	00000097          	auipc	ra,0x0
    80002718:	d24080e7          	jalr	-732(ra) # 80002438 <_Z18callSupervisorTrapmPv>
}
    8000271c:	0005051b          	sext.w	a0,a0
    80002720:	00813083          	ld	ra,8(sp)
    80002724:	00013403          	ld	s0,0(sp)
    80002728:	01010113          	addi	sp,sp,16
    8000272c:	00008067          	ret

0000000080002730 <_Z4getcv>:

char getc() {
    80002730:	ff010113          	addi	sp,sp,-16
    80002734:	00113423          	sd	ra,8(sp)
    80002738:	00813023          	sd	s0,0(sp)
    8000273c:	01010413          	addi	s0,sp,16
    return (uint64) callSupervisorTrap(0x41, nullptr);
    80002740:	00000593          	li	a1,0
    80002744:	04100513          	li	a0,65
    80002748:	00000097          	auipc	ra,0x0
    8000274c:	cf0080e7          	jalr	-784(ra) # 80002438 <_Z18callSupervisorTrapmPv>
}
    80002750:	0ff57513          	andi	a0,a0,255
    80002754:	00813083          	ld	ra,8(sp)
    80002758:	00013403          	ld	s0,0(sp)
    8000275c:	01010113          	addi	sp,sp,16
    80002760:	00008067          	ret

0000000080002764 <_Z4putcc>:

void putc(char chr) {
    80002764:	ff010113          	addi	sp,sp,-16
    80002768:	00113423          	sd	ra,8(sp)
    8000276c:	00813023          	sd	s0,0(sp)
    80002770:	01010413          	addi	s0,sp,16
    80002774:	00050593          	mv	a1,a0
    callSupervisorTrap(0x42, (void *) (uint64) chr);
    80002778:	04200513          	li	a0,66
    8000277c:	00000097          	auipc	ra,0x0
    80002780:	cbc080e7          	jalr	-836(ra) # 80002438 <_Z18callSupervisorTrapmPv>
}
    80002784:	00813083          	ld	ra,8(sp)
    80002788:	00013403          	ld	s0,0(sp)
    8000278c:	01010113          	addi	sp,sp,16
    80002790:	00008067          	ret

0000000080002794 <_Znwm>:
#include "../h/syscall_cpp.hpp"

void *operator new(size_t sz) {
    80002794:	ff010113          	addi	sp,sp,-16
    80002798:	00113423          	sd	ra,8(sp)
    8000279c:	00813023          	sd	s0,0(sp)
    800027a0:	01010413          	addi	s0,sp,16
    return mem_alloc(sz);
    800027a4:	00000097          	auipc	ra,0x0
    800027a8:	cd4080e7          	jalr	-812(ra) # 80002478 <_Z9mem_allocm>
}
    800027ac:	00813083          	ld	ra,8(sp)
    800027b0:	00013403          	ld	s0,0(sp)
    800027b4:	01010113          	addi	sp,sp,16
    800027b8:	00008067          	ret

00000000800027bc <_Znam>:

void *operator new[](size_t sz) {
    800027bc:	ff010113          	addi	sp,sp,-16
    800027c0:	00113423          	sd	ra,8(sp)
    800027c4:	00813023          	sd	s0,0(sp)
    800027c8:	01010413          	addi	s0,sp,16
    return mem_alloc(sz);
    800027cc:	00000097          	auipc	ra,0x0
    800027d0:	cac080e7          	jalr	-852(ra) # 80002478 <_Z9mem_allocm>
}
    800027d4:	00813083          	ld	ra,8(sp)
    800027d8:	00013403          	ld	s0,0(sp)
    800027dc:	01010113          	addi	sp,sp,16
    800027e0:	00008067          	ret

00000000800027e4 <_ZdlPv>:

void operator delete(void *addr) {
    800027e4:	ff010113          	addi	sp,sp,-16
    800027e8:	00113423          	sd	ra,8(sp)
    800027ec:	00813023          	sd	s0,0(sp)
    800027f0:	01010413          	addi	s0,sp,16
    mem_free(addr);
    800027f4:	00000097          	auipc	ra,0x0
    800027f8:	cb4080e7          	jalr	-844(ra) # 800024a8 <_Z8mem_freePv>
}
    800027fc:	00813083          	ld	ra,8(sp)
    80002800:	00013403          	ld	s0,0(sp)
    80002804:	01010113          	addi	sp,sp,16
    80002808:	00008067          	ret

000000008000280c <_ZdaPv>:

void operator delete[](void *addr) {
    8000280c:	ff010113          	addi	sp,sp,-16
    80002810:	00113423          	sd	ra,8(sp)
    80002814:	00813023          	sd	s0,0(sp)
    80002818:	01010413          	addi	s0,sp,16
    mem_free(addr);
    8000281c:	00000097          	auipc	ra,0x0
    80002820:	c8c080e7          	jalr	-884(ra) # 800024a8 <_Z8mem_freePv>
}
    80002824:	00813083          	ld	ra,8(sp)
    80002828:	00013403          	ld	s0,0(sp)
    8000282c:	01010113          	addi	sp,sp,16
    80002830:	00008067          	ret

0000000080002834 <_Z12kprintStringPKc>:
#include "../h/SysPrint.h"
#include "../lib/console.h"

PrintMutex *PrintMutex::instance = nullptr;

void kprintString(char const *string) {
    80002834:	fe010113          	addi	sp,sp,-32
    80002838:	00113c23          	sd	ra,24(sp)
    8000283c:	00813823          	sd	s0,16(sp)
    80002840:	00913423          	sd	s1,8(sp)
    80002844:	02010413          	addi	s0,sp,32
    80002848:	00050493          	mv	s1,a0
#include "Mutex.h"

class PrintMutex : public KernelObject {
public:
    static PrintMutex* getInstance() {
        if (!instance) instance = new PrintMutex;
    8000284c:	00007797          	auipc	a5,0x7
    80002850:	5fc7b783          	ld	a5,1532(a5) # 80009e48 <_ZN10PrintMutex8instanceE>
    80002854:	02078863          	beqz	a5,80002884 <_Z12kprintStringPKc+0x50>
        return instance;
    }

    static void wait() {
        getInstance()->mutex.wait();
    80002858:	00007517          	auipc	a0,0x7
    8000285c:	5f053503          	ld	a0,1520(a0) # 80009e48 <_ZN10PrintMutex8instanceE>
    80002860:	00850513          	addi	a0,a0,8
    80002864:	fffff097          	auipc	ra,0xfffff
    80002868:	6bc080e7          	jalr	1724(ra) # 80001f20 <_ZN5Mutex4waitEv>
    PrintMutex::wait();
    while (*string != '\0') {
    8000286c:	0004c503          	lbu	a0,0(s1)
    80002870:	04050463          	beqz	a0,800028b8 <_Z12kprintStringPKc+0x84>
        __putc(*string);
    80002874:	00005097          	auipc	ra,0x5
    80002878:	9c8080e7          	jalr	-1592(ra) # 8000723c <__putc>
        string++;
    8000287c:	00148493          	addi	s1,s1,1
    while (*string != '\0') {
    80002880:	fedff06f          	j	8000286c <_Z12kprintStringPKc+0x38>
        return kmalloc(size);
    80002884:	03800513          	li	a0,56
    80002888:	fffff097          	auipc	ra,0xfffff
    8000288c:	45c080e7          	jalr	1116(ra) # 80001ce4 <_Z7kmallocm>
    80002890:	00100793          	li	a5,1
    80002894:	00f52423          	sw	a5,8(a0)
    explicit ThreadList() = default;
    80002898:	00053823          	sd	zero,16(a0)
    8000289c:	00053c23          	sd	zero,24(a0)
    800028a0:	02053023          	sd	zero,32(a0)
    800028a4:	02052423          	sw	zero,40(a0)
    800028a8:	02053823          	sd	zero,48(a0)
        if (!instance) instance = new PrintMutex;
    800028ac:	00007797          	auipc	a5,0x7
    800028b0:	58a7be23          	sd	a0,1436(a5) # 80009e48 <_ZN10PrintMutex8instanceE>
    800028b4:	fa5ff06f          	j	80002858 <_Z12kprintStringPKc+0x24>
    800028b8:	00007797          	auipc	a5,0x7
    800028bc:	5907b783          	ld	a5,1424(a5) # 80009e48 <_ZN10PrintMutex8instanceE>
    800028c0:	02078663          	beqz	a5,800028ec <_Z12kprintStringPKc+0xb8>
    }

    static void signal() {
        getInstance()->mutex.signal();
    800028c4:	00007517          	auipc	a0,0x7
    800028c8:	58453503          	ld	a0,1412(a0) # 80009e48 <_ZN10PrintMutex8instanceE>
    800028cc:	00850513          	addi	a0,a0,8
    800028d0:	fffff097          	auipc	ra,0xfffff
    800028d4:	6d0080e7          	jalr	1744(ra) # 80001fa0 <_ZN5Mutex6signalEv>
    }
    PrintMutex::signal();
}
    800028d8:	01813083          	ld	ra,24(sp)
    800028dc:	01013403          	ld	s0,16(sp)
    800028e0:	00813483          	ld	s1,8(sp)
    800028e4:	02010113          	addi	sp,sp,32
    800028e8:	00008067          	ret
    800028ec:	03800513          	li	a0,56
    800028f0:	fffff097          	auipc	ra,0xfffff
    800028f4:	3f4080e7          	jalr	1012(ra) # 80001ce4 <_Z7kmallocm>
    800028f8:	00100793          	li	a5,1
    800028fc:	00f52423          	sw	a5,8(a0)
    80002900:	00053823          	sd	zero,16(a0)
    80002904:	00053c23          	sd	zero,24(a0)
    80002908:	02053023          	sd	zero,32(a0)
    8000290c:	02052423          	sw	zero,40(a0)
    80002910:	02053823          	sd	zero,48(a0)
        if (!instance) instance = new PrintMutex;
    80002914:	00007797          	auipc	a5,0x7
    80002918:	52a7ba23          	sd	a0,1332(a5) # 80009e48 <_ZN10PrintMutex8instanceE>
    8000291c:	fa9ff06f          	j	800028c4 <_Z12kprintStringPKc+0x90>

0000000080002920 <_Z13kprintIntegeri>:

void kprintInteger(int integer) {
    80002920:	fd010113          	addi	sp,sp,-48
    80002924:	02113423          	sd	ra,40(sp)
    80002928:	02813023          	sd	s0,32(sp)
    8000292c:	00913c23          	sd	s1,24(sp)
    80002930:	03010413          	addi	s0,sp,48
    80002934:	00050493          	mv	s1,a0
    80002938:	00007797          	auipc	a5,0x7
    8000293c:	5107b783          	ld	a5,1296(a5) # 80009e48 <_ZN10PrintMutex8instanceE>
    80002940:	0a078263          	beqz	a5,800029e4 <_Z13kprintIntegeri+0xc4>
        getInstance()->mutex.wait();
    80002944:	00007517          	auipc	a0,0x7
    80002948:	50453503          	ld	a0,1284(a0) # 80009e48 <_ZN10PrintMutex8instanceE>
    8000294c:	00850513          	addi	a0,a0,8
    80002950:	fffff097          	auipc	ra,0xfffff
    80002954:	5d0080e7          	jalr	1488(ra) # 80001f20 <_ZN5Mutex4waitEv>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if (integer < 0) {
    80002958:	0c04c063          	bltz	s1,80002a18 <_Z13kprintIntegeri+0xf8>
        neg = 1;
        x = -integer;
    } else {
        x = integer;
    8000295c:	0004851b          	sext.w	a0,s1
    neg = 0;
    80002960:	00000593          	li	a1,0
    }

    i = 0;
    80002964:	00000493          	li	s1,0
    do {
        buf[i++] = digits[x % 10];
    80002968:	00a00693          	li	a3,10
    8000296c:	02d577bb          	remuw	a5,a0,a3
    80002970:	00048613          	mv	a2,s1
    80002974:	0014849b          	addiw	s1,s1,1
    80002978:	02079713          	slli	a4,a5,0x20
    8000297c:	02075713          	srli	a4,a4,0x20
    80002980:	00006797          	auipc	a5,0x6
    80002984:	86078793          	addi	a5,a5,-1952 # 800081e0 <_ZZ13kprintIntegeriE6digits>
    80002988:	00e787b3          	add	a5,a5,a4
    8000298c:	0007c703          	lbu	a4,0(a5)
    80002990:	fe040793          	addi	a5,s0,-32
    80002994:	00c787b3          	add	a5,a5,a2
    80002998:	fee78823          	sb	a4,-16(a5)
    } while ((x /= 10) != 0);
    8000299c:	0005071b          	sext.w	a4,a0
    800029a0:	02d5553b          	divuw	a0,a0,a3
    800029a4:	00900793          	li	a5,9
    800029a8:	fce7e0e3          	bltu	a5,a4,80002968 <_Z13kprintIntegeri+0x48>
    if (neg) buf[i++] = '-';
    800029ac:	00058c63          	beqz	a1,800029c4 <_Z13kprintIntegeri+0xa4>
    800029b0:	fe040793          	addi	a5,s0,-32
    800029b4:	009784b3          	add	s1,a5,s1
    800029b8:	02d00793          	li	a5,45
    800029bc:	fef48823          	sb	a5,-16(s1)
    800029c0:	0026049b          	addiw	s1,a2,2

    while (--i >= 0)
    800029c4:	fff4849b          	addiw	s1,s1,-1
    800029c8:	0404ce63          	bltz	s1,80002a24 <_Z13kprintIntegeri+0x104>
        __putc(buf[i]);
    800029cc:	fe040793          	addi	a5,s0,-32
    800029d0:	009787b3          	add	a5,a5,s1
    800029d4:	ff07c503          	lbu	a0,-16(a5)
    800029d8:	00005097          	auipc	ra,0x5
    800029dc:	864080e7          	jalr	-1948(ra) # 8000723c <__putc>
    800029e0:	fe5ff06f          	j	800029c4 <_Z13kprintIntegeri+0xa4>
    800029e4:	03800513          	li	a0,56
    800029e8:	fffff097          	auipc	ra,0xfffff
    800029ec:	2fc080e7          	jalr	764(ra) # 80001ce4 <_Z7kmallocm>
    800029f0:	00100793          	li	a5,1
    800029f4:	00f52423          	sw	a5,8(a0)
    800029f8:	00053823          	sd	zero,16(a0)
    800029fc:	00053c23          	sd	zero,24(a0)
    80002a00:	02053023          	sd	zero,32(a0)
    80002a04:	02052423          	sw	zero,40(a0)
    80002a08:	02053823          	sd	zero,48(a0)
        if (!instance) instance = new PrintMutex;
    80002a0c:	00007797          	auipc	a5,0x7
    80002a10:	42a7be23          	sd	a0,1084(a5) # 80009e48 <_ZN10PrintMutex8instanceE>
    80002a14:	f31ff06f          	j	80002944 <_Z13kprintIntegeri+0x24>
        x = -integer;
    80002a18:	4090053b          	negw	a0,s1
        neg = 1;
    80002a1c:	00100593          	li	a1,1
    80002a20:	f45ff06f          	j	80002964 <_Z13kprintIntegeri+0x44>
    80002a24:	00007797          	auipc	a5,0x7
    80002a28:	4247b783          	ld	a5,1060(a5) # 80009e48 <_ZN10PrintMutex8instanceE>
    80002a2c:	02078663          	beqz	a5,80002a58 <_Z13kprintIntegeri+0x138>
        getInstance()->mutex.signal();
    80002a30:	00007517          	auipc	a0,0x7
    80002a34:	41853503          	ld	a0,1048(a0) # 80009e48 <_ZN10PrintMutex8instanceE>
    80002a38:	00850513          	addi	a0,a0,8
    80002a3c:	fffff097          	auipc	ra,0xfffff
    80002a40:	564080e7          	jalr	1380(ra) # 80001fa0 <_ZN5Mutex6signalEv>
    PrintMutex::signal();
}
    80002a44:	02813083          	ld	ra,40(sp)
    80002a48:	02013403          	ld	s0,32(sp)
    80002a4c:	01813483          	ld	s1,24(sp)
    80002a50:	03010113          	addi	sp,sp,48
    80002a54:	00008067          	ret
    80002a58:	03800513          	li	a0,56
    80002a5c:	fffff097          	auipc	ra,0xfffff
    80002a60:	288080e7          	jalr	648(ra) # 80001ce4 <_Z7kmallocm>
    80002a64:	00100793          	li	a5,1
    80002a68:	00f52423          	sw	a5,8(a0)
    80002a6c:	00053823          	sd	zero,16(a0)
    80002a70:	00053c23          	sd	zero,24(a0)
    80002a74:	02053023          	sd	zero,32(a0)
    80002a78:	02052423          	sw	zero,40(a0)
    80002a7c:	02053823          	sd	zero,48(a0)
        if (!instance) instance = new PrintMutex;
    80002a80:	00007797          	auipc	a5,0x7
    80002a84:	3ca7b423          	sd	a0,968(a5) # 80009e48 <_ZN10PrintMutex8instanceE>
    80002a88:	fa9ff06f          	j	80002a30 <_Z13kprintIntegeri+0x110>

0000000080002a8c <_Z14kprintUnsignedm>:

void kprintUnsigned(uint64 x) {
    80002a8c:	fd010113          	addi	sp,sp,-48
    80002a90:	02113423          	sd	ra,40(sp)
    80002a94:	02813023          	sd	s0,32(sp)
    80002a98:	00913c23          	sd	s1,24(sp)
    80002a9c:	01213823          	sd	s2,16(sp)
    80002aa0:	03010413          	addi	s0,sp,48
    80002aa4:	00050913          	mv	s2,a0
    80002aa8:	00007797          	auipc	a5,0x7
    80002aac:	3a07b783          	ld	a5,928(a5) # 80009e48 <_ZN10PrintMutex8instanceE>
    80002ab0:	06078a63          	beqz	a5,80002b24 <_Z14kprintUnsignedm+0x98>
        getInstance()->mutex.wait();
    80002ab4:	00007517          	auipc	a0,0x7
    80002ab8:	39453503          	ld	a0,916(a0) # 80009e48 <_ZN10PrintMutex8instanceE>
    80002abc:	00850513          	addi	a0,a0,8
    80002ac0:	fffff097          	auipc	ra,0xfffff
    80002ac4:	460080e7          	jalr	1120(ra) # 80001f20 <_ZN5Mutex4waitEv>
    PrintMutex::wait();
    static char digits[] = "0123456789";
    char buf[16];

    int i = 0;
    80002ac8:	00000493          	li	s1,0
    do {
        buf[i++] = digits[x % 10];
    80002acc:	00a00693          	li	a3,10
    80002ad0:	02d97633          	remu	a2,s2,a3
    80002ad4:	00005717          	auipc	a4,0x5
    80002ad8:	70c70713          	addi	a4,a4,1804 # 800081e0 <_ZZ13kprintIntegeriE6digits>
    80002adc:	00c70733          	add	a4,a4,a2
    80002ae0:	01074703          	lbu	a4,16(a4)
    80002ae4:	fe040613          	addi	a2,s0,-32
    80002ae8:	009607b3          	add	a5,a2,s1
    80002aec:	0014849b          	addiw	s1,s1,1
    80002af0:	fee78823          	sb	a4,-16(a5)
    } while ((x /= 10) != 0);
    80002af4:	00090713          	mv	a4,s2
    80002af8:	02d95933          	divu	s2,s2,a3
    80002afc:	00900793          	li	a5,9
    80002b00:	fce7e6e3          	bltu	a5,a4,80002acc <_Z14kprintUnsignedm+0x40>

    while (--i >= 0)
    80002b04:	fff4849b          	addiw	s1,s1,-1
    80002b08:	0404c863          	bltz	s1,80002b58 <_Z14kprintUnsignedm+0xcc>
        __putc(buf[i]);
    80002b0c:	fe040793          	addi	a5,s0,-32
    80002b10:	009787b3          	add	a5,a5,s1
    80002b14:	ff07c503          	lbu	a0,-16(a5)
    80002b18:	00004097          	auipc	ra,0x4
    80002b1c:	724080e7          	jalr	1828(ra) # 8000723c <__putc>
    80002b20:	fe5ff06f          	j	80002b04 <_Z14kprintUnsignedm+0x78>
    80002b24:	03800513          	li	a0,56
    80002b28:	fffff097          	auipc	ra,0xfffff
    80002b2c:	1bc080e7          	jalr	444(ra) # 80001ce4 <_Z7kmallocm>
    80002b30:	00100793          	li	a5,1
    80002b34:	00f52423          	sw	a5,8(a0)
    80002b38:	00053823          	sd	zero,16(a0)
    80002b3c:	00053c23          	sd	zero,24(a0)
    80002b40:	02053023          	sd	zero,32(a0)
    80002b44:	02052423          	sw	zero,40(a0)
    80002b48:	02053823          	sd	zero,48(a0)
        if (!instance) instance = new PrintMutex;
    80002b4c:	00007797          	auipc	a5,0x7
    80002b50:	2ea7be23          	sd	a0,764(a5) # 80009e48 <_ZN10PrintMutex8instanceE>
    80002b54:	f61ff06f          	j	80002ab4 <_Z14kprintUnsignedm+0x28>
    80002b58:	00007797          	auipc	a5,0x7
    80002b5c:	2f07b783          	ld	a5,752(a5) # 80009e48 <_ZN10PrintMutex8instanceE>
    80002b60:	02078863          	beqz	a5,80002b90 <_Z14kprintUnsignedm+0x104>
        getInstance()->mutex.signal();
    80002b64:	00007517          	auipc	a0,0x7
    80002b68:	2e453503          	ld	a0,740(a0) # 80009e48 <_ZN10PrintMutex8instanceE>
    80002b6c:	00850513          	addi	a0,a0,8
    80002b70:	fffff097          	auipc	ra,0xfffff
    80002b74:	430080e7          	jalr	1072(ra) # 80001fa0 <_ZN5Mutex6signalEv>
    PrintMutex::signal();
}
    80002b78:	02813083          	ld	ra,40(sp)
    80002b7c:	02013403          	ld	s0,32(sp)
    80002b80:	01813483          	ld	s1,24(sp)
    80002b84:	01013903          	ld	s2,16(sp)
    80002b88:	03010113          	addi	sp,sp,48
    80002b8c:	00008067          	ret
    80002b90:	03800513          	li	a0,56
    80002b94:	fffff097          	auipc	ra,0xfffff
    80002b98:	150080e7          	jalr	336(ra) # 80001ce4 <_Z7kmallocm>
    80002b9c:	00100793          	li	a5,1
    80002ba0:	00f52423          	sw	a5,8(a0)
    80002ba4:	00053823          	sd	zero,16(a0)
    80002ba8:	00053c23          	sd	zero,24(a0)
    80002bac:	02053023          	sd	zero,32(a0)
    80002bb0:	02052423          	sw	zero,40(a0)
    80002bb4:	02053823          	sd	zero,48(a0)
        if (!instance) instance = new PrintMutex;
    80002bb8:	00007797          	auipc	a5,0x7
    80002bbc:	28a7b823          	sd	a0,656(a5) # 80009e48 <_ZN10PrintMutex8instanceE>
    80002bc0:	fa5ff06f          	j	80002b64 <_Z14kprintUnsignedm+0xd8>

0000000080002bc4 <_ZN3TCB13threadWrapperEv>:
    TCB::contextSwitch(&old->context, &running->context);

    unlock()
}

void TCB::threadWrapper() {
    80002bc4:	fe010113          	addi	sp,sp,-32
    80002bc8:	00113c23          	sd	ra,24(sp)
    80002bcc:	00813823          	sd	s0,16(sp)
    80002bd0:	00913423          	sd	s1,8(sp)
    80002bd4:	02010413          	addi	s0,sp,32
    Riscv::popSppSpie(running->privileged);
    80002bd8:	00007497          	auipc	s1,0x7
    80002bdc:	27848493          	addi	s1,s1,632 # 80009e50 <_ZN3TCB7runningE>
    80002be0:	0004b783          	ld	a5,0(s1)
    80002be4:	0687c503          	lbu	a0,104(a5)
    80002be8:	fffff097          	auipc	ra,0xfffff
    80002bec:	41c080e7          	jalr	1052(ra) # 80002004 <_ZN5Riscv10popSppSpieEb>
    running->body(running->args);
    80002bf0:	0004b783          	ld	a5,0(s1)
    80002bf4:	0087b703          	ld	a4,8(a5)
    80002bf8:	0107b503          	ld	a0,16(a5)
    80002bfc:	000700e7          	jalr	a4

    __asm__ volatile ("li a0, 0x12");
    80002c00:	01200513          	li	a0,18
    __asm__ volatile ("ecall");
    80002c04:	00000073          	ecall
}
    80002c08:	01813083          	ld	ra,24(sp)
    80002c0c:	01013403          	ld	s0,16(sp)
    80002c10:	00813483          	ld	s1,8(sp)
    80002c14:	02010113          	addi	sp,sp,32
    80002c18:	00008067          	ret

0000000080002c1c <_ZN3TCBC1EPFvPvES0_mb>:
TCB::TCB(Body body, void *args, uint64 timeSlice, bool privileged) :
    80002c1c:	fd010113          	addi	sp,sp,-48
    80002c20:	02113423          	sd	ra,40(sp)
    80002c24:	02813023          	sd	s0,32(sp)
    80002c28:	00913c23          	sd	s1,24(sp)
    80002c2c:	01213823          	sd	s2,16(sp)
    80002c30:	01313423          	sd	s3,8(sp)
    80002c34:	01413023          	sd	s4,0(sp)
    80002c38:	03010413          	addi	s0,sp,48
    80002c3c:	00050493          	mv	s1,a0
    80002c40:	00058913          	mv	s2,a1
    80002c44:	00068a13          	mv	s4,a3
    80002c48:	00070993          	mv	s3,a4
        node(this) {
    80002c4c:	00b53423          	sd	a1,8(a0)
    80002c50:	00c53823          	sd	a2,16(a0)
        threadStack(body != nullptr ? (uint64 *) kmalloc(DEFAULT_STACK_SIZE * sizeof(uint64)) : nullptr),
    80002c54:	0a058863          	beqz	a1,80002d04 <_ZN3TCBC1EPFvPvES0_mb+0xe8>
    80002c58:	00008537          	lui	a0,0x8
    80002c5c:	fffff097          	auipc	ra,0xfffff
    80002c60:	088080e7          	jalr	136(ra) # 80001ce4 <_Z7kmallocm>
        node(this) {
    80002c64:	00a4bc23          	sd	a0,24(s1)
        kernelStack((uint64 *) kmalloc(DEFAULT_STACK_SIZE * sizeof(uint64))),
    80002c68:	00008537          	lui	a0,0x8
    80002c6c:	fffff097          	auipc	ra,0xfffff
    80002c70:	078080e7          	jalr	120(ra) # 80001ce4 <_Z7kmallocm>
        node(this) {
    80002c74:	02a4b023          	sd	a0,32(s1)
    80002c78:	00000797          	auipc	a5,0x0
    80002c7c:	f4c78793          	addi	a5,a5,-180 # 80002bc4 <_ZN3TCB13threadWrapperEv>
    80002c80:	02f4b423          	sd	a5,40(s1)
        context({(uint64) &threadWrapper, threadStack != nullptr ? (uint64) (threadStack + DEFAULT_STACK_SIZE) : 0}),
    80002c84:	0184b783          	ld	a5,24(s1)
    80002c88:	08078263          	beqz	a5,80002d0c <_ZN3TCBC1EPFvPvES0_mb+0xf0>
    80002c8c:	00008737          	lui	a4,0x8
    80002c90:	00e787b3          	add	a5,a5,a4
        node(this) {
    80002c94:	02f4b823          	sd	a5,48(s1)
    80002c98:	0344bc23          	sd	s4,56(s1)
    80002c9c:	0404a023          	sw	zero,64(s1)
    80002ca0:	04848a13          	addi	s4,s1,72
    80002ca4:	0404b423          	sd	zero,72(s1)
    80002ca8:	0404b823          	sd	zero,80(s1)
    80002cac:	0404bc23          	sd	zero,88(s1)
    80002cb0:	0604a023          	sw	zero,96(s1)
    80002cb4:	07348423          	sb	s3,104(s1)
    80002cb8:	00100793          	li	a5,1
    80002cbc:	06f4a823          	sw	a5,112(s1)
    80002cc0:	0604bc23          	sd	zero,120(s1)
    80002cc4:	0804b023          	sd	zero,128(s1)
    80002cc8:	0804b423          	sd	zero,136(s1)
    80002ccc:	0804a823          	sw	zero,144(s1)
    80002cd0:	0804bc23          	sd	zero,152(s1)

class TCB;

class ThreadNode : public KernelObject {
public:
    ThreadNode(TCB *data, ThreadNode *next = nullptr, ThreadNode *prev = nullptr) : data(data), next(next), prev(prev) {}
    80002cd4:	0a94b023          	sd	s1,160(s1)
    80002cd8:	0a04b423          	sd	zero,168(s1)
    80002cdc:	0a04b823          	sd	zero,176(s1)
    80002ce0:	0a04bc23          	sd	zero,184(s1)
    ssp = (uint64) (kernelStack + DEFAULT_STACK_SIZE);
    80002ce4:	000087b7          	lui	a5,0x8
    80002ce8:	00f50533          	add	a0,a0,a5
    80002cec:	00a4b023          	sd	a0,0(s1)
    if (body != nullptr)
    80002cf0:	04090663          	beqz	s2,80002d3c <_ZN3TCBC1EPFvPvES0_mb+0x120>
        Scheduler::put(this);
    80002cf4:	00048513          	mv	a0,s1
    80002cf8:	fffff097          	auipc	ra,0xfffff
    80002cfc:	654080e7          	jalr	1620(ra) # 8000234c <_ZN9Scheduler3putEP3TCB>
    80002d00:	03c0006f          	j	80002d3c <_ZN3TCBC1EPFvPvES0_mb+0x120>
        threadStack(body != nullptr ? (uint64 *) kmalloc(DEFAULT_STACK_SIZE * sizeof(uint64)) : nullptr),
    80002d04:	00000513          	li	a0,0
    80002d08:	f5dff06f          	j	80002c64 <_ZN3TCBC1EPFvPvES0_mb+0x48>
        context({(uint64) &threadWrapper, threadStack != nullptr ? (uint64) (threadStack + DEFAULT_STACK_SIZE) : 0}),
    80002d0c:	00000793          	li	a5,0
    80002d10:	f85ff06f          	j	80002c94 <_ZN3TCBC1EPFvPvES0_mb+0x78>
    80002d14:	00050913          	mv	s2,a0
    80002d18:	07048513          	addi	a0,s1,112
    80002d1c:	fffff097          	auipc	ra,0xfffff
    80002d20:	bf4080e7          	jalr	-1036(ra) # 80001910 <_ZN15KernelSemaphoreD1Ev>
        node(this) {
    80002d24:	000a0513          	mv	a0,s4
    80002d28:	00001097          	auipc	ra,0x1
    80002d2c:	8b0080e7          	jalr	-1872(ra) # 800035d8 <_ZN10ThreadListD1Ev>
    80002d30:	00090513          	mv	a0,s2
    80002d34:	00008097          	auipc	ra,0x8
    80002d38:	224080e7          	jalr	548(ra) # 8000af58 <_Unwind_Resume>
}
    80002d3c:	02813083          	ld	ra,40(sp)
    80002d40:	02013403          	ld	s0,32(sp)
    80002d44:	01813483          	ld	s1,24(sp)
    80002d48:	01013903          	ld	s2,16(sp)
    80002d4c:	00813983          	ld	s3,8(sp)
    80002d50:	00013a03          	ld	s4,0(sp)
    80002d54:	03010113          	addi	sp,sp,48
    80002d58:	00008067          	ret

0000000080002d5c <_ZN3TCB12createThreadEPFvPvES0_>:
TCB *TCB::createThread(TCB::Body body, void *args) {
    80002d5c:	fd010113          	addi	sp,sp,-48
    80002d60:	02113423          	sd	ra,40(sp)
    80002d64:	02813023          	sd	s0,32(sp)
    80002d68:	00913c23          	sd	s1,24(sp)
    80002d6c:	01213823          	sd	s2,16(sp)
    80002d70:	01313423          	sd	s3,8(sp)
    80002d74:	03010413          	addi	s0,sp,48
    80002d78:	00050913          	mv	s2,a0
    80002d7c:	00058993          	mv	s3,a1
    80002d80:	0c000513          	li	a0,192
    80002d84:	fffff097          	auipc	ra,0xfffff
    80002d88:	f60080e7          	jalr	-160(ra) # 80001ce4 <_Z7kmallocm>
    80002d8c:	00050493          	mv	s1,a0
    return new TCB(body, args, DEFAULT_TIME_SLICE);
    80002d90:	00000713          	li	a4,0
    80002d94:	00200693          	li	a3,2
    80002d98:	00098613          	mv	a2,s3
    80002d9c:	00090593          	mv	a1,s2
    80002da0:	00000097          	auipc	ra,0x0
    80002da4:	e7c080e7          	jalr	-388(ra) # 80002c1c <_ZN3TCBC1EPFvPvES0_mb>
    80002da8:	0200006f          	j	80002dc8 <_ZN3TCB12createThreadEPFvPvES0_+0x6c>
    80002dac:	00050913          	mv	s2,a0
        kfree(addr);
    80002db0:	00048513          	mv	a0,s1
    80002db4:	fffff097          	auipc	ra,0xfffff
    80002db8:	12c080e7          	jalr	300(ra) # 80001ee0 <_Z5kfreePv>
    80002dbc:	00090513          	mv	a0,s2
    80002dc0:	00008097          	auipc	ra,0x8
    80002dc4:	198080e7          	jalr	408(ra) # 8000af58 <_Unwind_Resume>
}
    80002dc8:	00048513          	mv	a0,s1
    80002dcc:	02813083          	ld	ra,40(sp)
    80002dd0:	02013403          	ld	s0,32(sp)
    80002dd4:	01813483          	ld	s1,24(sp)
    80002dd8:	01013903          	ld	s2,16(sp)
    80002ddc:	00813983          	ld	s3,8(sp)
    80002de0:	03010113          	addi	sp,sp,48
    80002de4:	00008067          	ret

0000000080002de8 <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    80002de8:	fd010113          	addi	sp,sp,-48
    80002dec:	02113423          	sd	ra,40(sp)
    80002df0:	02813023          	sd	s0,32(sp)
    80002df4:	00913c23          	sd	s1,24(sp)
    80002df8:	03010413          	addi	s0,sp,48
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80002dfc:	100027f3          	csrr	a5,sstatus
    80002e00:	fcf43823          	sd	a5,-48(s0)
    return sstatus;
    80002e04:	fd043783          	ld	a5,-48(s0)
    lock()
    80002e08:	fcf43c23          	sd	a5,-40(s0)
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80002e0c:	00200793          	li	a5,2
    80002e10:	1007b073          	csrc	sstatus,a5
    TCB *old = running;
    80002e14:	00007497          	auipc	s1,0x7
    80002e18:	03c4b483          	ld	s1,60(s1) # 80009e50 <_ZN3TCB7runningE>
        return status == READY;
    80002e1c:	0404a783          	lw	a5,64(s1)
    if (old->isReady()) Scheduler::put(old);
    80002e20:	04078e63          	beqz	a5,80002e7c <_ZN3TCB8dispatchEv+0x94>
    else if (old->isFinished()) {
    80002e24:	00100713          	li	a4,1
    80002e28:	06e78263          	beq	a5,a4,80002e8c <_ZN3TCB8dispatchEv+0xa4>
    running = Scheduler::get();
    80002e2c:	fffff097          	auipc	ra,0xfffff
    80002e30:	4b4080e7          	jalr	1204(ra) # 800022e0 <_ZN9Scheduler3getEv>
    80002e34:	00007797          	auipc	a5,0x7
    80002e38:	00a7be23          	sd	a0,28(a5) # 80009e50 <_ZN3TCB7runningE>
    if (!running) {
    80002e3c:	04050e63          	beqz	a0,80002e98 <_ZN3TCB8dispatchEv+0xb0>
    TCB::timeSliceCounter = 0;
    80002e40:	00007797          	auipc	a5,0x7
    80002e44:	01078793          	addi	a5,a5,16 # 80009e50 <_ZN3TCB7runningE>
    80002e48:	0007b423          	sd	zero,8(a5)
    TCB::contextSwitch(&old->context, &running->context);
    80002e4c:	0007b583          	ld	a1,0(a5)
    80002e50:	02858593          	addi	a1,a1,40
    80002e54:	02848513          	addi	a0,s1,40
    80002e58:	ffffe097          	auipc	ra,0xffffe
    80002e5c:	1a8080e7          	jalr	424(ra) # 80001000 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
    unlock()
    80002e60:	fd843783          	ld	a5,-40(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80002e64:	10079073          	csrw	sstatus,a5
}
    80002e68:	02813083          	ld	ra,40(sp)
    80002e6c:	02013403          	ld	s0,32(sp)
    80002e70:	01813483          	ld	s1,24(sp)
    80002e74:	03010113          	addi	sp,sp,48
    80002e78:	00008067          	ret
    if (old->isReady()) Scheduler::put(old);
    80002e7c:	00048513          	mv	a0,s1
    80002e80:	fffff097          	auipc	ra,0xfffff
    80002e84:	4cc080e7          	jalr	1228(ra) # 8000234c <_ZN9Scheduler3putEP3TCB>
    80002e88:	fa5ff06f          	j	80002e2c <_ZN3TCB8dispatchEv+0x44>
        ThreadCollector::signal();
    80002e8c:	00000097          	auipc	ra,0x0
    80002e90:	3dc080e7          	jalr	988(ra) # 80003268 <_ZN15ThreadCollector6signalEv>
    80002e94:	f99ff06f          	j	80002e2c <_ZN3TCB8dispatchEv+0x44>
        running = IdleThread::getIdleThread();
    80002e98:	ffffe097          	auipc	ra,0xffffe
    80002e9c:	498080e7          	jalr	1176(ra) # 80001330 <_ZN10IdleThread13getIdleThreadEv>
    80002ea0:	00007797          	auipc	a5,0x7
    80002ea4:	faa7b823          	sd	a0,-80(a5) # 80009e50 <_ZN3TCB7runningE>
    80002ea8:	f99ff06f          	j	80002e40 <_ZN3TCB8dispatchEv+0x58>

0000000080002eac <_ZN3TCB4exitEv>:
void TCB::exit() {
    80002eac:	ff010113          	addi	sp,sp,-16
    80002eb0:	00113423          	sd	ra,8(sp)
    80002eb4:	00813023          	sd	s0,0(sp)
    80002eb8:	01010413          	addi	s0,sp,16
    running->setFinished();
    80002ebc:	00007517          	auipc	a0,0x7
    80002ec0:	f9453503          	ld	a0,-108(a0) # 80009e50 <_ZN3TCB7runningE>
        status = FINISHED;
    80002ec4:	00100793          	li	a5,1
    80002ec8:	04f52023          	sw	a5,64(a0)
    running->mutex.wait();
    80002ecc:	07050513          	addi	a0,a0,112
    80002ed0:	fffff097          	auipc	ra,0xfffff
    80002ed4:	050080e7          	jalr	80(ra) # 80001f20 <_ZN5Mutex4waitEv>
    while (!running->waitingToJoin.isEmpty()) {
    80002ed8:	00007517          	auipc	a0,0x7
    80002edc:	f7853503          	ld	a0,-136(a0) # 80009e50 <_ZN3TCB7runningE>
        return size == 0;
    80002ee0:	06052783          	lw	a5,96(a0)
    80002ee4:	02078063          	beqz	a5,80002f04 <_ZN3TCB4exitEv+0x58>
        TCB *thr = running->waitingToJoin.removeFirst();
    80002ee8:	04850513          	addi	a0,a0,72
    80002eec:	00000097          	auipc	ra,0x0
    80002ef0:	548080e7          	jalr	1352(ra) # 80003434 <_ZN10ThreadList11removeFirstEv>
        status = READY;
    80002ef4:	04052023          	sw	zero,64(a0)
        Scheduler::put(thr);
    80002ef8:	fffff097          	auipc	ra,0xfffff
    80002efc:	454080e7          	jalr	1108(ra) # 8000234c <_ZN9Scheduler3putEP3TCB>
    while (!running->waitingToJoin.isEmpty()) {
    80002f00:	fd9ff06f          	j	80002ed8 <_ZN3TCB4exitEv+0x2c>
    running->mutex.signal();
    80002f04:	07050513          	addi	a0,a0,112
    80002f08:	fffff097          	auipc	ra,0xfffff
    80002f0c:	098080e7          	jalr	152(ra) # 80001fa0 <_ZN5Mutex6signalEv>
    ThreadCollector::put(running);
    80002f10:	00007517          	auipc	a0,0x7
    80002f14:	f4053503          	ld	a0,-192(a0) # 80009e50 <_ZN3TCB7runningE>
    80002f18:	00000097          	auipc	ra,0x0
    80002f1c:	384080e7          	jalr	900(ra) # 8000329c <_ZN15ThreadCollector3putEP3TCB>
    dispatch();
    80002f20:	00000097          	auipc	ra,0x0
    80002f24:	ec8080e7          	jalr	-312(ra) # 80002de8 <_ZN3TCB8dispatchEv>
}
    80002f28:	00813083          	ld	ra,8(sp)
    80002f2c:	00013403          	ld	s0,0(sp)
    80002f30:	01010113          	addi	sp,sp,16
    80002f34:	00008067          	ret

0000000080002f38 <_ZN3TCB4joinEv>:
        return status == FINISHED;
    80002f38:	04052703          	lw	a4,64(a0)

int TCB::join() {
    if (isFinished()) return 0;
    80002f3c:	00100793          	li	a5,1
    80002f40:	06f70c63          	beq	a4,a5,80002fb8 <_ZN3TCB4joinEv+0x80>
int TCB::join() {
    80002f44:	fe010113          	addi	sp,sp,-32
    80002f48:	00113c23          	sd	ra,24(sp)
    80002f4c:	00813823          	sd	s0,16(sp)
    80002f50:	00913423          	sd	s1,8(sp)
    80002f54:	01213023          	sd	s2,0(sp)
    80002f58:	02010413          	addi	s0,sp,32
    80002f5c:	00050493          	mv	s1,a0

    mutex.wait();
    80002f60:	07050913          	addi	s2,a0,112
    80002f64:	00090513          	mv	a0,s2
    80002f68:	fffff097          	auipc	ra,0xfffff
    80002f6c:	fb8080e7          	jalr	-72(ra) # 80001f20 <_ZN5Mutex4waitEv>

    running->setBlocked();
    80002f70:	00007597          	auipc	a1,0x7
    80002f74:	ee05b583          	ld	a1,-288(a1) # 80009e50 <_ZN3TCB7runningE>
        status = BLOCKED;
    80002f78:	00200793          	li	a5,2
    80002f7c:	04f5a023          	sw	a5,64(a1)
    waitingToJoin.addLast(&running->node);
    80002f80:	0a058593          	addi	a1,a1,160
    80002f84:	04848513          	addi	a0,s1,72
    80002f88:	00000097          	auipc	ra,0x0
    80002f8c:	468080e7          	jalr	1128(ra) # 800033f0 <_ZN10ThreadList7addLastEP10ThreadNode>

    mutex.signal();
    80002f90:	00090513          	mv	a0,s2
    80002f94:	fffff097          	auipc	ra,0xfffff
    80002f98:	00c080e7          	jalr	12(ra) # 80001fa0 <_ZN5Mutex6signalEv>

    return 0;
}
    80002f9c:	00000513          	li	a0,0
    80002fa0:	01813083          	ld	ra,24(sp)
    80002fa4:	01013403          	ld	s0,16(sp)
    80002fa8:	00813483          	ld	s1,8(sp)
    80002fac:	00013903          	ld	s2,0(sp)
    80002fb0:	02010113          	addi	sp,sp,32
    80002fb4:	00008067          	ret
    80002fb8:	00000513          	li	a0,0
    80002fbc:	00008067          	ret

0000000080002fc0 <_ZN3TCBD1Ev>:

TCB::~TCB() {
    80002fc0:	fe010113          	addi	sp,sp,-32
    80002fc4:	00113c23          	sd	ra,24(sp)
    80002fc8:	00813823          	sd	s0,16(sp)
    80002fcc:	00913423          	sd	s1,8(sp)
    80002fd0:	02010413          	addi	s0,sp,32
    80002fd4:	00050493          	mv	s1,a0
    kfree(kernelStack);
    80002fd8:	02053503          	ld	a0,32(a0)
    80002fdc:	fffff097          	auipc	ra,0xfffff
    80002fe0:	f04080e7          	jalr	-252(ra) # 80001ee0 <_Z5kfreePv>
    kfree(threadStack);
    80002fe4:	0184b503          	ld	a0,24(s1)
    80002fe8:	fffff097          	auipc	ra,0xfffff
    80002fec:	ef8080e7          	jalr	-264(ra) # 80001ee0 <_Z5kfreePv>
    80002ff0:	07048513          	addi	a0,s1,112
    80002ff4:	fffff097          	auipc	ra,0xfffff
    80002ff8:	91c080e7          	jalr	-1764(ra) # 80001910 <_ZN15KernelSemaphoreD1Ev>
TCB::~TCB() {
    80002ffc:	04848513          	addi	a0,s1,72
    80003000:	00000097          	auipc	ra,0x0
    80003004:	5d8080e7          	jalr	1496(ra) # 800035d8 <_ZN10ThreadListD1Ev>
}
    80003008:	01813083          	ld	ra,24(sp)
    8000300c:	01013403          	ld	s0,16(sp)
    80003010:	00813483          	ld	s1,8(sp)
    80003014:	02010113          	addi	sp,sp,32
    80003018:	00008067          	ret

000000008000301c <_ZN15ThreadCollectorC1Ev>:
    getInstance()->mutex.wait();
    getInstance()->finishedThreads.addLast(tcb->getNode());
    getInstance()->mutex.signal();
}

ThreadCollector::ThreadCollector() : readyToDelete(0) {
    8000301c:	fc010113          	addi	sp,sp,-64
    80003020:	02113c23          	sd	ra,56(sp)
    80003024:	02813823          	sd	s0,48(sp)
    80003028:	02913423          	sd	s1,40(sp)
    8000302c:	03213023          	sd	s2,32(sp)
    80003030:	01313c23          	sd	s3,24(sp)
    80003034:	01413823          	sd	s4,16(sp)
    80003038:	01513423          	sd	s5,8(sp)
    8000303c:	04010413          	addi	s0,sp,64
    80003040:	00050493          	mv	s1,a0
    80003044:	00053023          	sd	zero,0(a0)
    80003048:	00850993          	addi	s3,a0,8
    explicit ThreadList() = default;
    8000304c:	00053423          	sd	zero,8(a0)
    80003050:	00053823          	sd	zero,16(a0)
    80003054:	00053c23          	sd	zero,24(a0)
    80003058:	02052023          	sw	zero,32(a0)
    8000305c:	00100793          	li	a5,1
    80003060:	02f52423          	sw	a5,40(a0)
    80003064:	02053823          	sd	zero,48(a0)
    80003068:	02053c23          	sd	zero,56(a0)
    8000306c:	04053023          	sd	zero,64(a0)
    80003070:	04052423          	sw	zero,72(a0)
    80003074:	04053823          	sd	zero,80(a0)
    80003078:	05850a13          	addi	s4,a0,88
    8000307c:	04052c23          	sw	zero,88(a0)
    80003080:	06053023          	sd	zero,96(a0)
    80003084:	06053423          	sd	zero,104(a0)
    80003088:	06053823          	sd	zero,112(a0)
    8000308c:	06052c23          	sw	zero,120(a0)
        return kmalloc(size);
    80003090:	0c000513          	li	a0,192
    80003094:	fffff097          	auipc	ra,0xfffff
    80003098:	c50080e7          	jalr	-944(ra) # 80001ce4 <_Z7kmallocm>
    8000309c:	00050913          	mv	s2,a0
    threadCollector = new TCB([](void *){ThreadCollector::run();}, nullptr, DEFAULT_TIME_SLICE, true);
    800030a0:	00100713          	li	a4,1
    800030a4:	00200693          	li	a3,2
    800030a8:	00000613          	li	a2,0
    800030ac:	00000597          	auipc	a1,0x0
    800030b0:	2e458593          	addi	a1,a1,740 # 80003390 <_ZZN15ThreadCollectorC4EvENUlPvE_4_FUNES0_>
    800030b4:	00000097          	auipc	ra,0x0
    800030b8:	b68080e7          	jalr	-1176(ra) # 80002c1c <_ZN3TCBC1EPFvPvES0_mb>
    800030bc:	0124b023          	sd	s2,0(s1)
}
    800030c0:	03813083          	ld	ra,56(sp)
    800030c4:	03013403          	ld	s0,48(sp)
    800030c8:	02813483          	ld	s1,40(sp)
    800030cc:	02013903          	ld	s2,32(sp)
    800030d0:	01813983          	ld	s3,24(sp)
    800030d4:	01013a03          	ld	s4,16(sp)
    800030d8:	00813a83          	ld	s5,8(sp)
    800030dc:	04010113          	addi	sp,sp,64
    800030e0:	00008067          	ret
    800030e4:	00050a93          	mv	s5,a0
        kfree(addr);
    800030e8:	00090513          	mv	a0,s2
    800030ec:	fffff097          	auipc	ra,0xfffff
    800030f0:	df4080e7          	jalr	-524(ra) # 80001ee0 <_Z5kfreePv>
    800030f4:	000a8913          	mv	s2,s5
ThreadCollector::ThreadCollector() : readyToDelete(0) {
    800030f8:	000a0513          	mv	a0,s4
    800030fc:	fffff097          	auipc	ra,0xfffff
    80003100:	814080e7          	jalr	-2028(ra) # 80001910 <_ZN15KernelSemaphoreD1Ev>
    80003104:	02848513          	addi	a0,s1,40
    80003108:	fffff097          	auipc	ra,0xfffff
    8000310c:	808080e7          	jalr	-2040(ra) # 80001910 <_ZN15KernelSemaphoreD1Ev>
    80003110:	00098513          	mv	a0,s3
    80003114:	00000097          	auipc	ra,0x0
    80003118:	4c4080e7          	jalr	1220(ra) # 800035d8 <_ZN10ThreadListD1Ev>
    8000311c:	00090513          	mv	a0,s2
    80003120:	00008097          	auipc	ra,0x8
    80003124:	e38080e7          	jalr	-456(ra) # 8000af58 <_Unwind_Resume>
    80003128:	00050913          	mv	s2,a0
    8000312c:	fcdff06f          	j	800030f8 <_ZN15ThreadCollectorC1Ev+0xdc>

0000000080003130 <_ZN15ThreadCollectorD1Ev>:
        delete getInstance()->finishedThreads.removeFirst();
        getInstance()->mutex.signal();
    }
}

ThreadCollector::~ThreadCollector() {
    80003130:	fe010113          	addi	sp,sp,-32
    80003134:	00113c23          	sd	ra,24(sp)
    80003138:	00813823          	sd	s0,16(sp)
    8000313c:	00913423          	sd	s1,8(sp)
    80003140:	01213023          	sd	s2,0(sp)
    80003144:	02010413          	addi	s0,sp,32
    80003148:	00050913          	mv	s2,a0
        return size == 0;
    8000314c:	02092783          	lw	a5,32(s2)
    while (!finishedThreads.isEmpty()) {
    80003150:	02078863          	beqz	a5,80003180 <_ZN15ThreadCollectorD1Ev+0x50>
        delete finishedThreads.removeFirst();
    80003154:	00890513          	addi	a0,s2,8
    80003158:	00000097          	auipc	ra,0x0
    8000315c:	2dc080e7          	jalr	732(ra) # 80003434 <_ZN10ThreadList11removeFirstEv>
    80003160:	00050493          	mv	s1,a0
    80003164:	fe0504e3          	beqz	a0,8000314c <_ZN15ThreadCollectorD1Ev+0x1c>
    80003168:	00000097          	auipc	ra,0x0
    8000316c:	e58080e7          	jalr	-424(ra) # 80002fc0 <_ZN3TCBD1Ev>
    80003170:	00048513          	mv	a0,s1
    80003174:	fffff097          	auipc	ra,0xfffff
    80003178:	d6c080e7          	jalr	-660(ra) # 80001ee0 <_Z5kfreePv>
    }
    8000317c:	fd1ff06f          	j	8000314c <_ZN15ThreadCollectorD1Ev+0x1c>
    }
    delete threadCollector;
    80003180:	00093483          	ld	s1,0(s2)
    80003184:	00048e63          	beqz	s1,800031a0 <_ZN15ThreadCollectorD1Ev+0x70>
    80003188:	00048513          	mv	a0,s1
    8000318c:	00000097          	auipc	ra,0x0
    80003190:	e34080e7          	jalr	-460(ra) # 80002fc0 <_ZN3TCBD1Ev>
        kfree(addr);
    80003194:	00048513          	mv	a0,s1
    80003198:	fffff097          	auipc	ra,0xfffff
    8000319c:	d48080e7          	jalr	-696(ra) # 80001ee0 <_Z5kfreePv>
ThreadCollector::~ThreadCollector() {
    800031a0:	05890513          	addi	a0,s2,88
    800031a4:	ffffe097          	auipc	ra,0xffffe
    800031a8:	76c080e7          	jalr	1900(ra) # 80001910 <_ZN15KernelSemaphoreD1Ev>
    800031ac:	02890513          	addi	a0,s2,40
    800031b0:	ffffe097          	auipc	ra,0xffffe
    800031b4:	760080e7          	jalr	1888(ra) # 80001910 <_ZN15KernelSemaphoreD1Ev>
    800031b8:	00890513          	addi	a0,s2,8
    800031bc:	00000097          	auipc	ra,0x0
    800031c0:	41c080e7          	jalr	1052(ra) # 800035d8 <_ZN10ThreadListD1Ev>
}
    800031c4:	01813083          	ld	ra,24(sp)
    800031c8:	01013403          	ld	s0,16(sp)
    800031cc:	00813483          	ld	s1,8(sp)
    800031d0:	00013903          	ld	s2,0(sp)
    800031d4:	02010113          	addi	sp,sp,32
    800031d8:	00008067          	ret

00000000800031dc <_ZN15ThreadCollector11getInstanceEv>:

ThreadCollector *ThreadCollector::getInstance() {
    if (!instance) instance = new ThreadCollector;
    800031dc:	00007797          	auipc	a5,0x7
    800031e0:	c847b783          	ld	a5,-892(a5) # 80009e60 <_ZN15ThreadCollector8instanceE>
    800031e4:	00078863          	beqz	a5,800031f4 <_ZN15ThreadCollector11getInstanceEv+0x18>
    return instance;
    800031e8:	00007517          	auipc	a0,0x7
    800031ec:	c7853503          	ld	a0,-904(a0) # 80009e60 <_ZN15ThreadCollector8instanceE>
}
    800031f0:	00008067          	ret
ThreadCollector *ThreadCollector::getInstance() {
    800031f4:	fe010113          	addi	sp,sp,-32
    800031f8:	00113c23          	sd	ra,24(sp)
    800031fc:	00813823          	sd	s0,16(sp)
    80003200:	00913423          	sd	s1,8(sp)
    80003204:	01213023          	sd	s2,0(sp)
    80003208:	02010413          	addi	s0,sp,32
        return kmalloc(size);
    8000320c:	08000513          	li	a0,128
    80003210:	fffff097          	auipc	ra,0xfffff
    80003214:	ad4080e7          	jalr	-1324(ra) # 80001ce4 <_Z7kmallocm>
    80003218:	00050493          	mv	s1,a0
    if (!instance) instance = new ThreadCollector;
    8000321c:	00000097          	auipc	ra,0x0
    80003220:	e00080e7          	jalr	-512(ra) # 8000301c <_ZN15ThreadCollectorC1Ev>
    80003224:	00007797          	auipc	a5,0x7
    80003228:	c297be23          	sd	s1,-964(a5) # 80009e60 <_ZN15ThreadCollector8instanceE>
    return instance;
    8000322c:	00007517          	auipc	a0,0x7
    80003230:	c3453503          	ld	a0,-972(a0) # 80009e60 <_ZN15ThreadCollector8instanceE>
}
    80003234:	01813083          	ld	ra,24(sp)
    80003238:	01013403          	ld	s0,16(sp)
    8000323c:	00813483          	ld	s1,8(sp)
    80003240:	00013903          	ld	s2,0(sp)
    80003244:	02010113          	addi	sp,sp,32
    80003248:	00008067          	ret
    8000324c:	00050913          	mv	s2,a0
        kfree(addr);
    80003250:	00048513          	mv	a0,s1
    80003254:	fffff097          	auipc	ra,0xfffff
    80003258:	c8c080e7          	jalr	-884(ra) # 80001ee0 <_Z5kfreePv>
    8000325c:	00090513          	mv	a0,s2
    80003260:	00008097          	auipc	ra,0x8
    80003264:	cf8080e7          	jalr	-776(ra) # 8000af58 <_Unwind_Resume>

0000000080003268 <_ZN15ThreadCollector6signalEv>:
void ThreadCollector::signal() {
    80003268:	ff010113          	addi	sp,sp,-16
    8000326c:	00113423          	sd	ra,8(sp)
    80003270:	00813023          	sd	s0,0(sp)
    80003274:	01010413          	addi	s0,sp,16
    getInstance()->readyToDelete.signal();
    80003278:	00000097          	auipc	ra,0x0
    8000327c:	f64080e7          	jalr	-156(ra) # 800031dc <_ZN15ThreadCollector11getInstanceEv>
    80003280:	05850513          	addi	a0,a0,88
    80003284:	ffffe097          	auipc	ra,0xffffe
    80003288:	630080e7          	jalr	1584(ra) # 800018b4 <_ZN15KernelSemaphore6signalEv>
}
    8000328c:	00813083          	ld	ra,8(sp)
    80003290:	00013403          	ld	s0,0(sp)
    80003294:	01010113          	addi	sp,sp,16
    80003298:	00008067          	ret

000000008000329c <_ZN15ThreadCollector3putEP3TCB>:
void ThreadCollector::put(TCB *tcb) {
    8000329c:	fe010113          	addi	sp,sp,-32
    800032a0:	00113c23          	sd	ra,24(sp)
    800032a4:	00813823          	sd	s0,16(sp)
    800032a8:	00913423          	sd	s1,8(sp)
    800032ac:	02010413          	addi	s0,sp,32
    800032b0:	00050493          	mv	s1,a0
    getInstance()->mutex.wait();
    800032b4:	00000097          	auipc	ra,0x0
    800032b8:	f28080e7          	jalr	-216(ra) # 800031dc <_ZN15ThreadCollector11getInstanceEv>
    800032bc:	02850513          	addi	a0,a0,40
    800032c0:	fffff097          	auipc	ra,0xfffff
    800032c4:	c60080e7          	jalr	-928(ra) # 80001f20 <_ZN5Mutex4waitEv>
    getInstance()->finishedThreads.addLast(tcb->getNode());
    800032c8:	00000097          	auipc	ra,0x0
    800032cc:	f14080e7          	jalr	-236(ra) # 800031dc <_ZN15ThreadCollector11getInstanceEv>
    800032d0:	0a048593          	addi	a1,s1,160
    800032d4:	00850513          	addi	a0,a0,8
    800032d8:	00000097          	auipc	ra,0x0
    800032dc:	118080e7          	jalr	280(ra) # 800033f0 <_ZN10ThreadList7addLastEP10ThreadNode>
    getInstance()->mutex.signal();
    800032e0:	00000097          	auipc	ra,0x0
    800032e4:	efc080e7          	jalr	-260(ra) # 800031dc <_ZN15ThreadCollector11getInstanceEv>
    800032e8:	02850513          	addi	a0,a0,40
    800032ec:	fffff097          	auipc	ra,0xfffff
    800032f0:	cb4080e7          	jalr	-844(ra) # 80001fa0 <_ZN5Mutex6signalEv>
}
    800032f4:	01813083          	ld	ra,24(sp)
    800032f8:	01013403          	ld	s0,16(sp)
    800032fc:	00813483          	ld	s1,8(sp)
    80003300:	02010113          	addi	sp,sp,32
    80003304:	00008067          	ret

0000000080003308 <_ZN15ThreadCollector3runEv>:
[[noreturn]] void ThreadCollector::run() {
    80003308:	fe010113          	addi	sp,sp,-32
    8000330c:	00113c23          	sd	ra,24(sp)
    80003310:	00813823          	sd	s0,16(sp)
    80003314:	00913423          	sd	s1,8(sp)
    80003318:	02010413          	addi	s0,sp,32
    8000331c:	0300006f          	j	8000334c <_ZN15ThreadCollector3runEv+0x44>
    80003320:	00050493          	mv	s1,a0
        delete getInstance()->finishedThreads.removeFirst();
    80003324:	00000097          	auipc	ra,0x0
    80003328:	c9c080e7          	jalr	-868(ra) # 80002fc0 <_ZN3TCBD1Ev>
    8000332c:	00048513          	mv	a0,s1
    80003330:	fffff097          	auipc	ra,0xfffff
    80003334:	bb0080e7          	jalr	-1104(ra) # 80001ee0 <_Z5kfreePv>
        getInstance()->mutex.signal();
    80003338:	00000097          	auipc	ra,0x0
    8000333c:	ea4080e7          	jalr	-348(ra) # 800031dc <_ZN15ThreadCollector11getInstanceEv>
    80003340:	02850513          	addi	a0,a0,40
    80003344:	fffff097          	auipc	ra,0xfffff
    80003348:	c5c080e7          	jalr	-932(ra) # 80001fa0 <_ZN5Mutex6signalEv>
        getInstance()->readyToDelete.wait();
    8000334c:	00000097          	auipc	ra,0x0
    80003350:	e90080e7          	jalr	-368(ra) # 800031dc <_ZN15ThreadCollector11getInstanceEv>
    80003354:	05850513          	addi	a0,a0,88
    80003358:	ffffe097          	auipc	ra,0xffffe
    8000335c:	4fc080e7          	jalr	1276(ra) # 80001854 <_ZN15KernelSemaphore4waitEv>
        getInstance()->mutex.wait();
    80003360:	00000097          	auipc	ra,0x0
    80003364:	e7c080e7          	jalr	-388(ra) # 800031dc <_ZN15ThreadCollector11getInstanceEv>
    80003368:	02850513          	addi	a0,a0,40
    8000336c:	fffff097          	auipc	ra,0xfffff
    80003370:	bb4080e7          	jalr	-1100(ra) # 80001f20 <_ZN5Mutex4waitEv>
        delete getInstance()->finishedThreads.removeFirst();
    80003374:	00000097          	auipc	ra,0x0
    80003378:	e68080e7          	jalr	-408(ra) # 800031dc <_ZN15ThreadCollector11getInstanceEv>
    8000337c:	00850513          	addi	a0,a0,8
    80003380:	00000097          	auipc	ra,0x0
    80003384:	0b4080e7          	jalr	180(ra) # 80003434 <_ZN10ThreadList11removeFirstEv>
    80003388:	f8051ce3          	bnez	a0,80003320 <_ZN15ThreadCollector3runEv+0x18>
    8000338c:	fadff06f          	j	80003338 <_ZN15ThreadCollector3runEv+0x30>

0000000080003390 <_ZZN15ThreadCollectorC4EvENUlPvE_4_FUNES0_>:
    threadCollector = new TCB([](void *){ThreadCollector::run();}, nullptr, DEFAULT_TIME_SLICE, true);
    80003390:	ff010113          	addi	sp,sp,-16
    80003394:	00113423          	sd	ra,8(sp)
    80003398:	00813023          	sd	s0,0(sp)
    8000339c:	01010413          	addi	s0,sp,16
    800033a0:	00000097          	auipc	ra,0x0
    800033a4:	f68080e7          	jalr	-152(ra) # 80003308 <_ZN15ThreadCollector3runEv>

00000000800033a8 <_ZN10ThreadList8addFirstEP10ThreadNode>:
#include "../h/ThreadList.h"

void ThreadList::addFirst(ThreadNode *elem) {
    800033a8:	ff010113          	addi	sp,sp,-16
    800033ac:	00813423          	sd	s0,8(sp)
    800033b0:	01010413          	addi	s0,sp,16
    elem->next = head;
    800033b4:	00053783          	ld	a5,0(a0)
    800033b8:	00f5b423          	sd	a5,8(a1)
    elem->prev = nullptr;
    800033bc:	0005b823          	sd	zero,16(a1)
    if (head) head->prev = elem;
    800033c0:	00053783          	ld	a5,0(a0)
    800033c4:	02078263          	beqz	a5,800033e8 <_ZN10ThreadList8addFirstEP10ThreadNode+0x40>
    800033c8:	00b7b823          	sd	a1,16(a5)
    else tail = elem;
    head = elem;
    800033cc:	00b53023          	sd	a1,0(a0)

    size++;
    800033d0:	01852783          	lw	a5,24(a0)
    800033d4:	0017879b          	addiw	a5,a5,1
    800033d8:	00f52c23          	sw	a5,24(a0)
}
    800033dc:	00813403          	ld	s0,8(sp)
    800033e0:	01010113          	addi	sp,sp,16
    800033e4:	00008067          	ret
    else tail = elem;
    800033e8:	00b53423          	sd	a1,8(a0)
    800033ec:	fe1ff06f          	j	800033cc <_ZN10ThreadList8addFirstEP10ThreadNode+0x24>

00000000800033f0 <_ZN10ThreadList7addLastEP10ThreadNode>:

void ThreadList::addLast(ThreadNode *elem) {
    800033f0:	ff010113          	addi	sp,sp,-16
    800033f4:	00813423          	sd	s0,8(sp)
    800033f8:	01010413          	addi	s0,sp,16
    elem->next = nullptr;
    800033fc:	0005b423          	sd	zero,8(a1)
    elem->prev = tail;
    80003400:	00853783          	ld	a5,8(a0)
    80003404:	00f5b823          	sd	a5,16(a1)
    if (tail) tail->next = elem;
    80003408:	02078263          	beqz	a5,8000342c <_ZN10ThreadList7addLastEP10ThreadNode+0x3c>
    8000340c:	00b7b423          	sd	a1,8(a5)
    else head = elem;
    tail = elem;
    80003410:	00b53423          	sd	a1,8(a0)

    size++;
    80003414:	01852783          	lw	a5,24(a0)
    80003418:	0017879b          	addiw	a5,a5,1
    8000341c:	00f52c23          	sw	a5,24(a0)
}
    80003420:	00813403          	ld	s0,8(sp)
    80003424:	01010113          	addi	sp,sp,16
    80003428:	00008067          	ret
    else head = elem;
    8000342c:	00b53023          	sd	a1,0(a0)
    80003430:	fe1ff06f          	j	80003410 <_ZN10ThreadList7addLastEP10ThreadNode+0x20>

0000000080003434 <_ZN10ThreadList11removeFirstEv>:

TCB *ThreadList::removeFirst() {
    80003434:	ff010113          	addi	sp,sp,-16
    80003438:	00813423          	sd	s0,8(sp)
    8000343c:	01010413          	addi	s0,sp,16
    if (!head) return nullptr;
    80003440:	00053703          	ld	a4,0(a0)
    80003444:	04070063          	beqz	a4,80003484 <_ZN10ThreadList11removeFirstEv+0x50>
    80003448:	00050793          	mv	a5,a0

    TCB *data = head->data;
    8000344c:	00073503          	ld	a0,0(a4) # 8000 <_entry-0x7fff8000>

    head = head->next;
    80003450:	00873703          	ld	a4,8(a4)
    80003454:	00e7b023          	sd	a4,0(a5)
    if (head) head->prev = nullptr;
    80003458:	02070063          	beqz	a4,80003478 <_ZN10ThreadList11removeFirstEv+0x44>
    8000345c:	00073823          	sd	zero,16(a4)
    else head = tail = nullptr;

    size--;
    80003460:	0187a703          	lw	a4,24(a5)
    80003464:	fff7071b          	addiw	a4,a4,-1
    80003468:	00e7ac23          	sw	a4,24(a5)

    return data;
}
    8000346c:	00813403          	ld	s0,8(sp)
    80003470:	01010113          	addi	sp,sp,16
    80003474:	00008067          	ret
    else head = tail = nullptr;
    80003478:	0007b423          	sd	zero,8(a5)
    8000347c:	0007b023          	sd	zero,0(a5)
    80003480:	fe1ff06f          	j	80003460 <_ZN10ThreadList11removeFirstEv+0x2c>
    if (!head) return nullptr;
    80003484:	00070513          	mv	a0,a4
    80003488:	fe5ff06f          	j	8000346c <_ZN10ThreadList11removeFirstEv+0x38>

000000008000348c <_ZN10ThreadList10removeLastEv>:

TCB *ThreadList::removeLast() {
    8000348c:	ff010113          	addi	sp,sp,-16
    80003490:	00813423          	sd	s0,8(sp)
    80003494:	01010413          	addi	s0,sp,16
    if (!tail) return nullptr;
    80003498:	00853703          	ld	a4,8(a0)
    8000349c:	04070063          	beqz	a4,800034dc <_ZN10ThreadList10removeLastEv+0x50>
    800034a0:	00050793          	mv	a5,a0

    TCB *data = tail->data;
    800034a4:	00073503          	ld	a0,0(a4)

    tail = tail->prev;
    800034a8:	01073703          	ld	a4,16(a4)
    800034ac:	00e7b423          	sd	a4,8(a5)
    if (tail) tail->next = nullptr;
    800034b0:	02070063          	beqz	a4,800034d0 <_ZN10ThreadList10removeLastEv+0x44>
    800034b4:	00073423          	sd	zero,8(a4)
    else tail = head = nullptr;

    size--;
    800034b8:	0187a703          	lw	a4,24(a5)
    800034bc:	fff7071b          	addiw	a4,a4,-1
    800034c0:	00e7ac23          	sw	a4,24(a5)

    return data;
}
    800034c4:	00813403          	ld	s0,8(sp)
    800034c8:	01010113          	addi	sp,sp,16
    800034cc:	00008067          	ret
    else tail = head = nullptr;
    800034d0:	0007b023          	sd	zero,0(a5)
    800034d4:	0007b423          	sd	zero,8(a5)
    800034d8:	fe1ff06f          	j	800034b8 <_ZN10ThreadList10removeLastEv+0x2c>
    if (!tail) return nullptr;
    800034dc:	00070513          	mv	a0,a4
    800034e0:	fe5ff06f          	j	800034c4 <_ZN10ThreadList10removeLastEv+0x38>

00000000800034e4 <_ZN10ThreadList9eraseCurrEv>:

void ThreadList::eraseCurr() {
    800034e4:	ff010113          	addi	sp,sp,-16
    800034e8:	00813423          	sd	s0,8(sp)
    800034ec:	01010413          	addi	s0,sp,16
    if (!curr) return;
    800034f0:	01053783          	ld	a5,16(a0)
    800034f4:	02078463          	beqz	a5,8000351c <_ZN10ThreadList9eraseCurrEv+0x38>

    ThreadNode *before = curr->prev, *after = curr->next;
    800034f8:	0107b703          	ld	a4,16(a5)
    800034fc:	0087b783          	ld	a5,8(a5)

    if (before) before->next = after;
    80003500:	02070463          	beqz	a4,80003528 <_ZN10ThreadList9eraseCurrEv+0x44>
    80003504:	00f73423          	sd	a5,8(a4)
    else head = after;

    if (after) after->prev = before;
    80003508:	02078463          	beqz	a5,80003530 <_ZN10ThreadList9eraseCurrEv+0x4c>
    8000350c:	00e7b823          	sd	a4,16(a5)
    else tail = before;

    size--;
    80003510:	01852783          	lw	a5,24(a0)
    80003514:	fff7879b          	addiw	a5,a5,-1
    80003518:	00f52c23          	sw	a5,24(a0)
}
    8000351c:	00813403          	ld	s0,8(sp)
    80003520:	01010113          	addi	sp,sp,16
    80003524:	00008067          	ret
    else head = after;
    80003528:	00f53023          	sd	a5,0(a0)
    8000352c:	fddff06f          	j	80003508 <_ZN10ThreadList9eraseCurrEv+0x24>
    else tail = before;
    80003530:	00e53423          	sd	a4,8(a0)
    80003534:	fddff06f          	j	80003510 <_ZN10ThreadList9eraseCurrEv+0x2c>

0000000080003538 <_ZN10ThreadList15insertAfterCurrEP10ThreadNode>:

void ThreadList::insertAfterCurr(ThreadNode *elem) {
    80003538:	ff010113          	addi	sp,sp,-16
    8000353c:	00813423          	sd	s0,8(sp)
    80003540:	01010413          	addi	s0,sp,16
    if (!curr) return;
    80003544:	01053783          	ld	a5,16(a0)
    80003548:	02078663          	beqz	a5,80003574 <_ZN10ThreadList15insertAfterCurrEP10ThreadNode+0x3c>
    ThreadNode *after = curr->next;
    8000354c:	0087b783          	ld	a5,8(a5)
    elem->next = after;
    80003550:	00f5b423          	sd	a5,8(a1)
    elem->prev = curr;
    80003554:	01053703          	ld	a4,16(a0)
    80003558:	00e5b823          	sd	a4,16(a1)
    curr->next = elem;
    8000355c:	00b73423          	sd	a1,8(a4)
    if (!after) tail = elem;
    80003560:	02078063          	beqz	a5,80003580 <_ZN10ThreadList15insertAfterCurrEP10ThreadNode+0x48>
    else after->prev = elem;
    80003564:	00b7b823          	sd	a1,16(a5)
    size++;
    80003568:	01852783          	lw	a5,24(a0)
    8000356c:	0017879b          	addiw	a5,a5,1
    80003570:	00f52c23          	sw	a5,24(a0)
}
    80003574:	00813403          	ld	s0,8(sp)
    80003578:	01010113          	addi	sp,sp,16
    8000357c:	00008067          	ret
    if (!after) tail = elem;
    80003580:	00b53423          	sd	a1,8(a0)
    80003584:	fe5ff06f          	j	80003568 <_ZN10ThreadList15insertAfterCurrEP10ThreadNode+0x30>

0000000080003588 <_ZN10ThreadList16insertBeforeCurrEP10ThreadNode>:

void ThreadList::insertBeforeCurr(ThreadNode *elem) {
    80003588:	ff010113          	addi	sp,sp,-16
    8000358c:	00813423          	sd	s0,8(sp)
    80003590:	01010413          	addi	s0,sp,16
    if (!curr) return;
    80003594:	01053783          	ld	a5,16(a0)
    80003598:	02078663          	beqz	a5,800035c4 <_ZN10ThreadList16insertBeforeCurrEP10ThreadNode+0x3c>
    ThreadNode *before = curr->prev;
    8000359c:	0107b703          	ld	a4,16(a5)
    elem->next = curr;
    800035a0:	00f5b423          	sd	a5,8(a1)
    elem->prev = before;
    800035a4:	00e5b823          	sd	a4,16(a1)
    curr->prev = elem;
    800035a8:	01053783          	ld	a5,16(a0)
    800035ac:	00b7b823          	sd	a1,16(a5)
    if (!before) head = elem;
    800035b0:	02070063          	beqz	a4,800035d0 <_ZN10ThreadList16insertBeforeCurrEP10ThreadNode+0x48>
    else before->next = elem;
    800035b4:	00b73423          	sd	a1,8(a4)
    size++;
    800035b8:	01852783          	lw	a5,24(a0)
    800035bc:	0017879b          	addiw	a5,a5,1
    800035c0:	00f52c23          	sw	a5,24(a0)
}
    800035c4:	00813403          	ld	s0,8(sp)
    800035c8:	01010113          	addi	sp,sp,16
    800035cc:	00008067          	ret
    if (!before) head = elem;
    800035d0:	00b53023          	sd	a1,0(a0)
    800035d4:	fe5ff06f          	j	800035b8 <_ZN10ThreadList16insertBeforeCurrEP10ThreadNode+0x30>

00000000800035d8 <_ZN10ThreadListD1Ev>:

ThreadList::~ThreadList() {
    800035d8:	ff010113          	addi	sp,sp,-16
    800035dc:	00813423          	sd	s0,8(sp)
    800035e0:	01010413          	addi	s0,sp,16
    head = nullptr;
    tail = nullptr;
    curr = nullptr;
    size = 0;
}
    800035e4:	00813403          	ld	s0,8(sp)
    800035e8:	01010113          	addi	sp,sp,16
    800035ec:	00008067          	ret

00000000800035f0 <_ZN14TimerInterrupt11getInstanceEv>:
#include "../h/Scheduler.h"

TimerInterrupt *TimerInterrupt::instance = nullptr;

TimerInterrupt *TimerInterrupt::getInstance() {
    if (!instance) instance = new TimerInterrupt;
    800035f0:	00007797          	auipc	a5,0x7
    800035f4:	8787b783          	ld	a5,-1928(a5) # 80009e68 <_ZN14TimerInterrupt8instanceE>
    800035f8:	00078863          	beqz	a5,80003608 <_ZN14TimerInterrupt11getInstanceEv+0x18>
    return instance;
}
    800035fc:	00007517          	auipc	a0,0x7
    80003600:	86c53503          	ld	a0,-1940(a0) # 80009e68 <_ZN14TimerInterrupt8instanceE>
    80003604:	00008067          	ret
TimerInterrupt *TimerInterrupt::getInstance() {
    80003608:	ff010113          	addi	sp,sp,-16
    8000360c:	00113423          	sd	ra,8(sp)
    80003610:	00813023          	sd	s0,0(sp)
    80003614:	01010413          	addi	s0,sp,16
        return kmalloc(size);
    80003618:	05800513          	li	a0,88
    8000361c:	ffffe097          	auipc	ra,0xffffe
    80003620:	6c8080e7          	jalr	1736(ra) # 80001ce4 <_Z7kmallocm>
    80003624:	00100793          	li	a5,1
    80003628:	00f52423          	sw	a5,8(a0)
    explicit ThreadList() = default;
    8000362c:	00053823          	sd	zero,16(a0)
    80003630:	00053c23          	sd	zero,24(a0)
    80003634:	02053023          	sd	zero,32(a0)
    80003638:	02052423          	sw	zero,40(a0)
    8000363c:	02053823          	sd	zero,48(a0)
    80003640:	02053c23          	sd	zero,56(a0)
    80003644:	04053023          	sd	zero,64(a0)
    80003648:	04053423          	sd	zero,72(a0)
    8000364c:	04052823          	sw	zero,80(a0)
    if (!instance) instance = new TimerInterrupt;
    80003650:	00007797          	auipc	a5,0x7
    80003654:	80a7bc23          	sd	a0,-2024(a5) # 80009e68 <_ZN14TimerInterrupt8instanceE>
}
    80003658:	00007517          	auipc	a0,0x7
    8000365c:	81053503          	ld	a0,-2032(a0) # 80009e68 <_ZN14TimerInterrupt8instanceE>
    80003660:	00813083          	ld	ra,8(sp)
    80003664:	00013403          	ld	s0,0(sp)
    80003668:	01010113          	addi	sp,sp,16
    8000366c:	00008067          	ret

0000000080003670 <_ZN14TimerInterrupt5blockEP3TCBm>:

void TimerInterrupt::block(TCB *tcb, time_t time) {
    80003670:	fd010113          	addi	sp,sp,-48
    80003674:	02113423          	sd	ra,40(sp)
    80003678:	02813023          	sd	s0,32(sp)
    8000367c:	00913c23          	sd	s1,24(sp)
    80003680:	01213823          	sd	s2,16(sp)
    80003684:	01313423          	sd	s3,8(sp)
    80003688:	01413023          	sd	s4,0(sp)
    8000368c:	03010413          	addi	s0,sp,48
    80003690:	00050993          	mv	s3,a0
    80003694:	00058913          	mv	s2,a1
    ThreadList *blockedThreads = &getInstance()->blockedThreadList;
    80003698:	00000097          	auipc	ra,0x0
    8000369c:	f58080e7          	jalr	-168(ra) # 800035f0 <_ZN14TimerInterrupt11getInstanceEv>
    800036a0:	00050493          	mv	s1,a0
    800036a4:	03850a13          	addi	s4,a0,56

    getInstance()->mutex.wait();
    800036a8:	00000097          	auipc	ra,0x0
    800036ac:	f48080e7          	jalr	-184(ra) # 800035f0 <_ZN14TimerInterrupt11getInstanceEv>
    800036b0:	00850513          	addi	a0,a0,8
    800036b4:	fffff097          	auipc	ra,0xfffff
    800036b8:	86c080e7          	jalr	-1940(ra) # 80001f20 <_ZN5Mutex4waitEv>
        curr = head;
    800036bc:	0384b783          	ld	a5,56(s1)
    800036c0:	04f4b423          	sd	a5,72(s1)
        return curr != nullptr;
    800036c4:	0484b783          	ld	a5,72(s1)

    for (blockedThreads->toHead(); blockedThreads->hasCurr(); blockedThreads->toNext()) {
    800036c8:	02078863          	beqz	a5,800036f8 <_ZN14TimerInterrupt5blockEP3TCBm+0x88>
    }

    TCB *getCurr() {
        if (!curr) return nullptr;
        return curr->data;
    800036cc:	0007b703          	ld	a4,0(a5)
        return blockedTime;
    800036d0:	0b873703          	ld	a4,184(a4)
        time_t currTime = blockedThreads->getCurr()->getBlockedTime();
        if (time >= currTime) {
    800036d4:	00e96a63          	bltu	s2,a4,800036e8 <_ZN14TimerInterrupt5blockEP3TCBm+0x78>
            time -= currTime;
    800036d8:	40e90933          	sub	s2,s2,a4
        if (curr) curr = curr->next;
    800036dc:	0087b783          	ld	a5,8(a5)
    800036e0:	04f4b423          	sd	a5,72(s1)
    }
    800036e4:	fe1ff06f          	j	800036c4 <_ZN14TimerInterrupt5blockEP3TCBm+0x54>
        } else {
            blockedThreads->insertBeforeCurr(tcb->getNode());
    800036e8:	0a098593          	addi	a1,s3,160
    800036ec:	000a0513          	mv	a0,s4
    800036f0:	00000097          	auipc	ra,0x0
    800036f4:	e98080e7          	jalr	-360(ra) # 80003588 <_ZN10ThreadList16insertBeforeCurrEP10ThreadNode>
        return curr != nullptr;
    800036f8:	0484b783          	ld	a5,72(s1)
            break;
        }
    }

    // insert at end
    if (!blockedThreads->hasCurr()) blockedThreads->addLast(tcb->getNode());
    800036fc:	02078863          	beqz	a5,8000372c <_ZN14TimerInterrupt5blockEP3TCBm+0xbc>
    80003700:	0484b783          	ld	a5,72(s1)

    // updating relative time for blocked threads after currently inserted
    while (blockedThreads->hasCurr()) {
    80003704:	02078e63          	beqz	a5,80003740 <_ZN14TimerInterrupt5blockEP3TCBm+0xd0>
        return curr->data;
    80003708:	0007b703          	ld	a4,0(a5)
        this->blockedTime -= time;
    8000370c:	0b873783          	ld	a5,184(a4)
    80003710:	412787b3          	sub	a5,a5,s2
    80003714:	0af73c23          	sd	a5,184(a4)
        if (curr) curr = curr->next;
    80003718:	0484b783          	ld	a5,72(s1)
    8000371c:	fe0782e3          	beqz	a5,80003700 <_ZN14TimerInterrupt5blockEP3TCBm+0x90>
    80003720:	0087b783          	ld	a5,8(a5)
    80003724:	04f4b423          	sd	a5,72(s1)
    80003728:	fd9ff06f          	j	80003700 <_ZN14TimerInterrupt5blockEP3TCBm+0x90>
    if (!blockedThreads->hasCurr()) blockedThreads->addLast(tcb->getNode());
    8000372c:	0a098593          	addi	a1,s3,160
    80003730:	000a0513          	mv	a0,s4
    80003734:	00000097          	auipc	ra,0x0
    80003738:	cbc080e7          	jalr	-836(ra) # 800033f0 <_ZN10ThreadList7addLastEP10ThreadNode>
    8000373c:	fc5ff06f          	j	80003700 <_ZN14TimerInterrupt5blockEP3TCBm+0x90>
        blockedThreads->getCurr()->decBlockedTime(time);
        blockedThreads->toNext();
    }

    getInstance()->mutex.signal();
    80003740:	00000097          	auipc	ra,0x0
    80003744:	eb0080e7          	jalr	-336(ra) # 800035f0 <_ZN14TimerInterrupt11getInstanceEv>
    80003748:	00850513          	addi	a0,a0,8
    8000374c:	fffff097          	auipc	ra,0xfffff
    80003750:	854080e7          	jalr	-1964(ra) # 80001fa0 <_ZN5Mutex6signalEv>
        this->blockedTime = blockedTime;
    80003754:	0b29bc23          	sd	s2,184(s3)
        status = BLOCKED;
    80003758:	00200793          	li	a5,2
    8000375c:	04f9a023          	sw	a5,64(s3)

    tcb->setBlockedTime(time);
    tcb->setBlocked();
    TCB::dispatch();
    80003760:	fffff097          	auipc	ra,0xfffff
    80003764:	688080e7          	jalr	1672(ra) # 80002de8 <_ZN3TCB8dispatchEv>
}
    80003768:	02813083          	ld	ra,40(sp)
    8000376c:	02013403          	ld	s0,32(sp)
    80003770:	01813483          	ld	s1,24(sp)
    80003774:	01013903          	ld	s2,16(sp)
    80003778:	00813983          	ld	s3,8(sp)
    8000377c:	00013a03          	ld	s4,0(sp)
    80003780:	03010113          	addi	sp,sp,48
    80003784:	00008067          	ret

0000000080003788 <_ZN14TimerInterrupt4tickEv>:

void TimerInterrupt::tick() {
    80003788:	fd010113          	addi	sp,sp,-48
    8000378c:	02113423          	sd	ra,40(sp)
    80003790:	02813023          	sd	s0,32(sp)
    80003794:	00913c23          	sd	s1,24(sp)
    80003798:	01213823          	sd	s2,16(sp)
    8000379c:	01313423          	sd	s3,8(sp)
    800037a0:	03010413          	addi	s0,sp,48
    ThreadList *blockedThreads = &getInstance()->blockedThreadList;
    800037a4:	00000097          	auipc	ra,0x0
    800037a8:	e4c080e7          	jalr	-436(ra) # 800035f0 <_ZN14TimerInterrupt11getInstanceEv>
    800037ac:	00050913          	mv	s2,a0
    800037b0:	03850993          	addi	s3,a0,56

    TCB *tcb;

    getInstance()->mutex.wait();
    800037b4:	00000097          	auipc	ra,0x0
    800037b8:	e3c080e7          	jalr	-452(ra) # 800035f0 <_ZN14TimerInterrupt11getInstanceEv>
    800037bc:	00850513          	addi	a0,a0,8
    800037c0:	ffffe097          	auipc	ra,0xffffe
    800037c4:	760080e7          	jalr	1888(ra) # 80001f20 <_ZN5Mutex4waitEv>
    800037c8:	01c0006f          	j	800037e4 <_ZN14TimerInterrupt4tickEv+0x5c>
        status = READY;
    800037cc:	0404a023          	sw	zero,64(s1)

    while ((tcb = blockedThreads->getFirst()) && !tcb->getBlockedTime()) {
        tcb->setReady();
        Scheduler::put(blockedThreads->removeFirst());
    800037d0:	00098513          	mv	a0,s3
    800037d4:	00000097          	auipc	ra,0x0
    800037d8:	c60080e7          	jalr	-928(ra) # 80003434 <_ZN10ThreadList11removeFirstEv>
    800037dc:	fffff097          	auipc	ra,0xfffff
    800037e0:	b70080e7          	jalr	-1168(ra) # 8000234c <_ZN9Scheduler3putEP3TCB>
        if (!head) return nullptr;
    800037e4:	03893483          	ld	s1,56(s2)
    800037e8:	00048a63          	beqz	s1,800037fc <_ZN14TimerInterrupt4tickEv+0x74>
        return head->data;
    800037ec:	0004b483          	ld	s1,0(s1)
    while ((tcb = blockedThreads->getFirst()) && !tcb->getBlockedTime()) {
    800037f0:	00048663          	beqz	s1,800037fc <_ZN14TimerInterrupt4tickEv+0x74>
        return blockedTime;
    800037f4:	0b84b783          	ld	a5,184(s1)
    800037f8:	fc078ae3          	beqz	a5,800037cc <_ZN14TimerInterrupt4tickEv+0x44>
    }

    getInstance()->mutex.signal();
    800037fc:	00000097          	auipc	ra,0x0
    80003800:	df4080e7          	jalr	-524(ra) # 800035f0 <_ZN14TimerInterrupt11getInstanceEv>
    80003804:	00850513          	addi	a0,a0,8
    80003808:	ffffe097          	auipc	ra,0xffffe
    8000380c:	798080e7          	jalr	1944(ra) # 80001fa0 <_ZN5Mutex6signalEv>

    if (!tcb) return;
    80003810:	00048863          	beqz	s1,80003820 <_ZN14TimerInterrupt4tickEv+0x98>
        this->blockedTime -= time;
    80003814:	0b84b783          	ld	a5,184(s1)
    80003818:	fff78793          	addi	a5,a5,-1
    8000381c:	0af4bc23          	sd	a5,184(s1)
    tcb->decBlockedTime();
}
    80003820:	02813083          	ld	ra,40(sp)
    80003824:	02013403          	ld	s0,32(sp)
    80003828:	01813483          	ld	s1,24(sp)
    8000382c:	01013903          	ld	s2,16(sp)
    80003830:	00813983          	ld	s3,8(sp)
    80003834:	03010113          	addi	sp,sp,48
    80003838:	00008067          	ret

000000008000383c <_ZN14TimerInterruptD1Ev>:

TimerInterrupt::~TimerInterrupt() {
    8000383c:	fe010113          	addi	sp,sp,-32
    80003840:	00113c23          	sd	ra,24(sp)
    80003844:	00813823          	sd	s0,16(sp)
    80003848:	00913423          	sd	s1,8(sp)
    8000384c:	01213023          	sd	s2,0(sp)
    80003850:	02010413          	addi	s0,sp,32
    80003854:	00050913          	mv	s2,a0
        return size == 0;
    80003858:	05092783          	lw	a5,80(s2)
    while (!blockedThreadList.isEmpty()) {
    8000385c:	02078863          	beqz	a5,8000388c <_ZN14TimerInterruptD1Ev+0x50>
        delete blockedThreadList.removeFirst();
    80003860:	03890513          	addi	a0,s2,56
    80003864:	00000097          	auipc	ra,0x0
    80003868:	bd0080e7          	jalr	-1072(ra) # 80003434 <_ZN10ThreadList11removeFirstEv>
    8000386c:	00050493          	mv	s1,a0
    80003870:	fe0504e3          	beqz	a0,80003858 <_ZN14TimerInterruptD1Ev+0x1c>
    80003874:	fffff097          	auipc	ra,0xfffff
    80003878:	74c080e7          	jalr	1868(ra) # 80002fc0 <_ZN3TCBD1Ev>
        kfree(addr);
    8000387c:	00048513          	mv	a0,s1
    80003880:	ffffe097          	auipc	ra,0xffffe
    80003884:	660080e7          	jalr	1632(ra) # 80001ee0 <_Z5kfreePv>
    }
    80003888:	fd1ff06f          	j	80003858 <_ZN14TimerInterruptD1Ev+0x1c>
TimerInterrupt::~TimerInterrupt() {
    8000388c:	03890513          	addi	a0,s2,56
    80003890:	00000097          	auipc	ra,0x0
    80003894:	d48080e7          	jalr	-696(ra) # 800035d8 <_ZN10ThreadListD1Ev>
    80003898:	00890513          	addi	a0,s2,8
    8000389c:	ffffe097          	auipc	ra,0xffffe
    800038a0:	074080e7          	jalr	116(ra) # 80001910 <_ZN15KernelSemaphoreD1Ev>
    }
}
    800038a4:	01813083          	ld	ra,24(sp)
    800038a8:	01013403          	ld	s0,16(sp)
    800038ac:	00813483          	ld	s1,8(sp)
    800038b0:	00013903          	ld	s2,0(sp)
    800038b4:	02010113          	addi	sp,sp,32
    800038b8:	00008067          	ret

00000000800038bc <_ZN6BufferC1Ei>:
#include "buffer.hpp"
#include "../h/syscall_c.h"
//#include "../h/std.h"


Buffer::Buffer(int _cap) : cap(_cap), head(0), tail(0) {
    800038bc:	fe010113          	addi	sp,sp,-32
    800038c0:	00113c23          	sd	ra,24(sp)
    800038c4:	00813823          	sd	s0,16(sp)
    800038c8:	00913423          	sd	s1,8(sp)
    800038cc:	02010413          	addi	s0,sp,32
    800038d0:	00050493          	mv	s1,a0
    800038d4:	00b52023          	sw	a1,0(a0)
    800038d8:	00052823          	sw	zero,16(a0)
    800038dc:	00052a23          	sw	zero,20(a0)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    800038e0:	00259513          	slli	a0,a1,0x2
    800038e4:	fffff097          	auipc	ra,0xfffff
    800038e8:	b94080e7          	jalr	-1132(ra) # 80002478 <_Z9mem_allocm>
    800038ec:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    800038f0:	00000593          	li	a1,0
    800038f4:	02048513          	addi	a0,s1,32
    800038f8:	fffff097          	auipc	ra,0xfffff
    800038fc:	cc8080e7          	jalr	-824(ra) # 800025c0 <_Z8sem_openPP4_semj>
    sem_open(&spaceAvailable, cap);
    80003900:	0004a583          	lw	a1,0(s1)
    80003904:	01848513          	addi	a0,s1,24
    80003908:	fffff097          	auipc	ra,0xfffff
    8000390c:	cb8080e7          	jalr	-840(ra) # 800025c0 <_Z8sem_openPP4_semj>
    sem_open(&mutexHead, 1);
    80003910:	00100593          	li	a1,1
    80003914:	02848513          	addi	a0,s1,40
    80003918:	fffff097          	auipc	ra,0xfffff
    8000391c:	ca8080e7          	jalr	-856(ra) # 800025c0 <_Z8sem_openPP4_semj>
    sem_open(&mutexTail, 1);
    80003920:	00100593          	li	a1,1
    80003924:	03048513          	addi	a0,s1,48
    80003928:	fffff097          	auipc	ra,0xfffff
    8000392c:	c98080e7          	jalr	-872(ra) # 800025c0 <_Z8sem_openPP4_semj>
}
    80003930:	01813083          	ld	ra,24(sp)
    80003934:	01013403          	ld	s0,16(sp)
    80003938:	00813483          	ld	s1,8(sp)
    8000393c:	02010113          	addi	sp,sp,32
    80003940:	00008067          	ret

0000000080003944 <_ZN6BufferD1Ev>:

Buffer::~Buffer() {
    80003944:	fe010113          	addi	sp,sp,-32
    80003948:	00113c23          	sd	ra,24(sp)
    8000394c:	00813823          	sd	s0,16(sp)
    80003950:	00913423          	sd	s1,8(sp)
    80003954:	02010413          	addi	s0,sp,32
    80003958:	00050493          	mv	s1,a0
    putc('\n');
    8000395c:	00a00513          	li	a0,10
    80003960:	fffff097          	auipc	ra,0xfffff
    80003964:	e04080e7          	jalr	-508(ra) # 80002764 <_Z4putcc>
//    printf("Buffer deleted!\n");
    while (head != tail) {
    80003968:	0104a783          	lw	a5,16(s1)
    8000396c:	0144a703          	lw	a4,20(s1)
    80003970:	00e78c63          	beq	a5,a4,80003988 <_ZN6BufferD1Ev+0x44>
//        printf("%c ", buffer[head]);
        head = (head + 1) % cap;
    80003974:	0017879b          	addiw	a5,a5,1
    80003978:	0004a703          	lw	a4,0(s1)
    8000397c:	02e7e7bb          	remw	a5,a5,a4
    80003980:	00f4a823          	sw	a5,16(s1)
    while (head != tail) {
    80003984:	fe5ff06f          	j	80003968 <_ZN6BufferD1Ev+0x24>
    }
    putc('!');
    80003988:	02100513          	li	a0,33
    8000398c:	fffff097          	auipc	ra,0xfffff
    80003990:	dd8080e7          	jalr	-552(ra) # 80002764 <_Z4putcc>
    putc('\n');
    80003994:	00a00513          	li	a0,10
    80003998:	fffff097          	auipc	ra,0xfffff
    8000399c:	dcc080e7          	jalr	-564(ra) # 80002764 <_Z4putcc>

    mem_free(buffer);
    800039a0:	0084b503          	ld	a0,8(s1)
    800039a4:	fffff097          	auipc	ra,0xfffff
    800039a8:	b04080e7          	jalr	-1276(ra) # 800024a8 <_Z8mem_freePv>
    sem_close(itemAvailable);
    800039ac:	0204b503          	ld	a0,32(s1)
    800039b0:	fffff097          	auipc	ra,0xfffff
    800039b4:	c88080e7          	jalr	-888(ra) # 80002638 <_Z9sem_closeP4_sem>
    sem_close(spaceAvailable);
    800039b8:	0184b503          	ld	a0,24(s1)
    800039bc:	fffff097          	auipc	ra,0xfffff
    800039c0:	c7c080e7          	jalr	-900(ra) # 80002638 <_Z9sem_closeP4_sem>
    sem_close(mutexTail);
    800039c4:	0304b503          	ld	a0,48(s1)
    800039c8:	fffff097          	auipc	ra,0xfffff
    800039cc:	c70080e7          	jalr	-912(ra) # 80002638 <_Z9sem_closeP4_sem>
    sem_close(mutexHead);
    800039d0:	0284b503          	ld	a0,40(s1)
    800039d4:	fffff097          	auipc	ra,0xfffff
    800039d8:	c64080e7          	jalr	-924(ra) # 80002638 <_Z9sem_closeP4_sem>
}
    800039dc:	01813083          	ld	ra,24(sp)
    800039e0:	01013403          	ld	s0,16(sp)
    800039e4:	00813483          	ld	s1,8(sp)
    800039e8:	02010113          	addi	sp,sp,32
    800039ec:	00008067          	ret

00000000800039f0 <_ZN6Buffer3putEi>:

void Buffer::put(int val) {
    800039f0:	fe010113          	addi	sp,sp,-32
    800039f4:	00113c23          	sd	ra,24(sp)
    800039f8:	00813823          	sd	s0,16(sp)
    800039fc:	00913423          	sd	s1,8(sp)
    80003a00:	01213023          	sd	s2,0(sp)
    80003a04:	02010413          	addi	s0,sp,32
    80003a08:	00050493          	mv	s1,a0
    80003a0c:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80003a10:	01853503          	ld	a0,24(a0)
    80003a14:	fffff097          	auipc	ra,0xfffff
    80003a18:	c80080e7          	jalr	-896(ra) # 80002694 <_Z8sem_waitP4_sem>

    sem_wait(mutexTail);
    80003a1c:	0304b503          	ld	a0,48(s1)
    80003a20:	fffff097          	auipc	ra,0xfffff
    80003a24:	c74080e7          	jalr	-908(ra) # 80002694 <_Z8sem_waitP4_sem>
    buffer[tail] = val;
    80003a28:	0084b783          	ld	a5,8(s1)
    80003a2c:	0144a703          	lw	a4,20(s1)
    80003a30:	00271713          	slli	a4,a4,0x2
    80003a34:	00e787b3          	add	a5,a5,a4
    80003a38:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80003a3c:	0144a783          	lw	a5,20(s1)
    80003a40:	0017879b          	addiw	a5,a5,1
    80003a44:	0004a703          	lw	a4,0(s1)
    80003a48:	02e7e7bb          	remw	a5,a5,a4
    80003a4c:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80003a50:	0304b503          	ld	a0,48(s1)
    80003a54:	fffff097          	auipc	ra,0xfffff
    80003a58:	c74080e7          	jalr	-908(ra) # 800026c8 <_Z10sem_signalP4_sem>

    sem_signal(itemAvailable);
    80003a5c:	0204b503          	ld	a0,32(s1)
    80003a60:	fffff097          	auipc	ra,0xfffff
    80003a64:	c68080e7          	jalr	-920(ra) # 800026c8 <_Z10sem_signalP4_sem>

}
    80003a68:	01813083          	ld	ra,24(sp)
    80003a6c:	01013403          	ld	s0,16(sp)
    80003a70:	00813483          	ld	s1,8(sp)
    80003a74:	00013903          	ld	s2,0(sp)
    80003a78:	02010113          	addi	sp,sp,32
    80003a7c:	00008067          	ret

0000000080003a80 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80003a80:	fe010113          	addi	sp,sp,-32
    80003a84:	00113c23          	sd	ra,24(sp)
    80003a88:	00813823          	sd	s0,16(sp)
    80003a8c:	00913423          	sd	s1,8(sp)
    80003a90:	01213023          	sd	s2,0(sp)
    80003a94:	02010413          	addi	s0,sp,32
    80003a98:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80003a9c:	02053503          	ld	a0,32(a0)
    80003aa0:	fffff097          	auipc	ra,0xfffff
    80003aa4:	bf4080e7          	jalr	-1036(ra) # 80002694 <_Z8sem_waitP4_sem>

    sem_wait(mutexHead);
    80003aa8:	0284b503          	ld	a0,40(s1)
    80003aac:	fffff097          	auipc	ra,0xfffff
    80003ab0:	be8080e7          	jalr	-1048(ra) # 80002694 <_Z8sem_waitP4_sem>

    int ret = buffer[head];
    80003ab4:	0084b703          	ld	a4,8(s1)
    80003ab8:	0104a783          	lw	a5,16(s1)
    80003abc:	00279693          	slli	a3,a5,0x2
    80003ac0:	00d70733          	add	a4,a4,a3
    80003ac4:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80003ac8:	0017879b          	addiw	a5,a5,1
    80003acc:	0004a703          	lw	a4,0(s1)
    80003ad0:	02e7e7bb          	remw	a5,a5,a4
    80003ad4:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80003ad8:	0284b503          	ld	a0,40(s1)
    80003adc:	fffff097          	auipc	ra,0xfffff
    80003ae0:	bec080e7          	jalr	-1044(ra) # 800026c8 <_Z10sem_signalP4_sem>

    sem_signal(spaceAvailable);
    80003ae4:	0184b503          	ld	a0,24(s1)
    80003ae8:	fffff097          	auipc	ra,0xfffff
    80003aec:	be0080e7          	jalr	-1056(ra) # 800026c8 <_Z10sem_signalP4_sem>

    return ret;
}
    80003af0:	00090513          	mv	a0,s2
    80003af4:	01813083          	ld	ra,24(sp)
    80003af8:	01013403          	ld	s0,16(sp)
    80003afc:	00813483          	ld	s1,8(sp)
    80003b00:	00013903          	ld	s2,0(sp)
    80003b04:	02010113          	addi	sp,sp,32
    80003b08:	00008067          	ret

0000000080003b0c <_ZL8printIntiii>:
}

static char digits[] = "0123456789ABCDEF";

static void printInt(int xx, int base=10, int sgn=0)
{
    80003b0c:	fc010113          	addi	sp,sp,-64
    80003b10:	02113c23          	sd	ra,56(sp)
    80003b14:	02813823          	sd	s0,48(sp)
    80003b18:	02913423          	sd	s1,40(sp)
    80003b1c:	03213023          	sd	s2,32(sp)
    80003b20:	01313c23          	sd	s3,24(sp)
    80003b24:	04010413          	addi	s0,sp,64
    80003b28:	00050493          	mv	s1,a0
    80003b2c:	00058913          	mv	s2,a1
    80003b30:	00060993          	mv	s3,a2
    LOCK();
    80003b34:	00100613          	li	a2,1
    80003b38:	00000593          	li	a1,0
    80003b3c:	00006517          	auipc	a0,0x6
    80003b40:	33450513          	addi	a0,a0,820 # 80009e70 <lockPrint>
    80003b44:	ffffd097          	auipc	ra,0xffffd
    80003b48:	63c080e7          	jalr	1596(ra) # 80001180 <copy_and_swap>
    80003b4c:	fe0514e3          	bnez	a0,80003b34 <_ZL8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80003b50:	00098463          	beqz	s3,80003b58 <_ZL8printIntiii+0x4c>
    80003b54:	0804c463          	bltz	s1,80003bdc <_ZL8printIntiii+0xd0>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80003b58:	0004851b          	sext.w	a0,s1
    neg = 0;
    80003b5c:	00000593          	li	a1,0
    }

    i = 0;
    80003b60:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80003b64:	0009079b          	sext.w	a5,s2
    80003b68:	0325773b          	remuw	a4,a0,s2
    80003b6c:	00048613          	mv	a2,s1
    80003b70:	0014849b          	addiw	s1,s1,1
    80003b74:	02071693          	slli	a3,a4,0x20
    80003b78:	0206d693          	srli	a3,a3,0x20
    80003b7c:	00005717          	auipc	a4,0x5
    80003b80:	94c70713          	addi	a4,a4,-1716 # 800084c8 <_ZL6digits>
    80003b84:	00d70733          	add	a4,a4,a3
    80003b88:	00074683          	lbu	a3,0(a4)
    80003b8c:	fd040713          	addi	a4,s0,-48
    80003b90:	00c70733          	add	a4,a4,a2
    80003b94:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80003b98:	0005071b          	sext.w	a4,a0
    80003b9c:	0325553b          	divuw	a0,a0,s2
    80003ba0:	fcf772e3          	bgeu	a4,a5,80003b64 <_ZL8printIntiii+0x58>
    if(neg)
    80003ba4:	00058c63          	beqz	a1,80003bbc <_ZL8printIntiii+0xb0>
        buf[i++] = '-';
    80003ba8:	fd040793          	addi	a5,s0,-48
    80003bac:	009784b3          	add	s1,a5,s1
    80003bb0:	02d00793          	li	a5,45
    80003bb4:	fef48823          	sb	a5,-16(s1)
    80003bb8:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80003bbc:	fff4849b          	addiw	s1,s1,-1
    80003bc0:	0204c463          	bltz	s1,80003be8 <_ZL8printIntiii+0xdc>
        putc(buf[i]);
    80003bc4:	fd040793          	addi	a5,s0,-48
    80003bc8:	009787b3          	add	a5,a5,s1
    80003bcc:	ff07c503          	lbu	a0,-16(a5)
    80003bd0:	fffff097          	auipc	ra,0xfffff
    80003bd4:	b94080e7          	jalr	-1132(ra) # 80002764 <_Z4putcc>
    80003bd8:	fe5ff06f          	j	80003bbc <_ZL8printIntiii+0xb0>
        x = -xx;
    80003bdc:	4090053b          	negw	a0,s1
        neg = 1;
    80003be0:	00100593          	li	a1,1
        x = -xx;
    80003be4:	f7dff06f          	j	80003b60 <_ZL8printIntiii+0x54>

    UNLOCK();
    80003be8:	00000613          	li	a2,0
    80003bec:	00100593          	li	a1,1
    80003bf0:	00006517          	auipc	a0,0x6
    80003bf4:	28050513          	addi	a0,a0,640 # 80009e70 <lockPrint>
    80003bf8:	ffffd097          	auipc	ra,0xffffd
    80003bfc:	588080e7          	jalr	1416(ra) # 80001180 <copy_and_swap>
    80003c00:	fe0514e3          	bnez	a0,80003be8 <_ZL8printIntiii+0xdc>
}
    80003c04:	03813083          	ld	ra,56(sp)
    80003c08:	03013403          	ld	s0,48(sp)
    80003c0c:	02813483          	ld	s1,40(sp)
    80003c10:	02013903          	ld	s2,32(sp)
    80003c14:	01813983          	ld	s3,24(sp)
    80003c18:	04010113          	addi	sp,sp,64
    80003c1c:	00008067          	ret

0000000080003c20 <_Z16producerKeyboardPv>:
    sem_t wait;
};

volatile int threadEnd = 0;

void producerKeyboard(void *arg) {
    80003c20:	fe010113          	addi	sp,sp,-32
    80003c24:	00113c23          	sd	ra,24(sp)
    80003c28:	00813823          	sd	s0,16(sp)
    80003c2c:	00913423          	sd	s1,8(sp)
    80003c30:	01213023          	sd	s2,0(sp)
    80003c34:	02010413          	addi	s0,sp,32
    80003c38:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80003c3c:	00000913          	li	s2,0
    80003c40:	00c0006f          	j	80003c4c <_Z16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003c44:	fffff097          	auipc	ra,0xfffff
    80003c48:	94c080e7          	jalr	-1716(ra) # 80002590 <_Z15thread_dispatchv>
    while ((key = getc()) != 0x1b) {
    80003c4c:	fffff097          	auipc	ra,0xfffff
    80003c50:	ae4080e7          	jalr	-1308(ra) # 80002730 <_Z4getcv>
    80003c54:	0005059b          	sext.w	a1,a0
    80003c58:	01b00793          	li	a5,27
    80003c5c:	02f58a63          	beq	a1,a5,80003c90 <_Z16producerKeyboardPv+0x70>
        data->buffer->put(key);
    80003c60:	0084b503          	ld	a0,8(s1)
    80003c64:	00000097          	auipc	ra,0x0
    80003c68:	d8c080e7          	jalr	-628(ra) # 800039f0 <_ZN6Buffer3putEi>
        i++;
    80003c6c:	0019071b          	addiw	a4,s2,1
    80003c70:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003c74:	0004a683          	lw	a3,0(s1)
    80003c78:	0026979b          	slliw	a5,a3,0x2
    80003c7c:	00d787bb          	addw	a5,a5,a3
    80003c80:	0017979b          	slliw	a5,a5,0x1
    80003c84:	02f767bb          	remw	a5,a4,a5
    80003c88:	fc0792e3          	bnez	a5,80003c4c <_Z16producerKeyboardPv+0x2c>
    80003c8c:	fb9ff06f          	j	80003c44 <_Z16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    80003c90:	00100793          	li	a5,1
    80003c94:	00006717          	auipc	a4,0x6
    80003c98:	1ef72223          	sw	a5,484(a4) # 80009e78 <threadEnd>

    delete data->buffer;
    80003c9c:	0084b903          	ld	s2,8(s1)
    80003ca0:	00090e63          	beqz	s2,80003cbc <_Z16producerKeyboardPv+0x9c>
    80003ca4:	00090513          	mv	a0,s2
    80003ca8:	00000097          	auipc	ra,0x0
    80003cac:	c9c080e7          	jalr	-868(ra) # 80003944 <_ZN6BufferD1Ev>
    80003cb0:	00090513          	mv	a0,s2
    80003cb4:	fffff097          	auipc	ra,0xfffff
    80003cb8:	b30080e7          	jalr	-1232(ra) # 800027e4 <_ZdlPv>

    sem_signal(data->wait);
    80003cbc:	0104b503          	ld	a0,16(s1)
    80003cc0:	fffff097          	auipc	ra,0xfffff
    80003cc4:	a08080e7          	jalr	-1528(ra) # 800026c8 <_Z10sem_signalP4_sem>
}
    80003cc8:	01813083          	ld	ra,24(sp)
    80003ccc:	01013403          	ld	s0,16(sp)
    80003cd0:	00813483          	ld	s1,8(sp)
    80003cd4:	00013903          	ld	s2,0(sp)
    80003cd8:	02010113          	addi	sp,sp,32
    80003cdc:	00008067          	ret

0000000080003ce0 <_Z8producerPv>:

void producer(void *arg) {
    80003ce0:	fe010113          	addi	sp,sp,-32
    80003ce4:	00113c23          	sd	ra,24(sp)
    80003ce8:	00813823          	sd	s0,16(sp)
    80003cec:	00913423          	sd	s1,8(sp)
    80003cf0:	01213023          	sd	s2,0(sp)
    80003cf4:	02010413          	addi	s0,sp,32
    80003cf8:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003cfc:	00000913          	li	s2,0
    80003d00:	00c0006f          	j	80003d0c <_Z8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003d04:	fffff097          	auipc	ra,0xfffff
    80003d08:	88c080e7          	jalr	-1908(ra) # 80002590 <_Z15thread_dispatchv>
    while (!threadEnd) {
    80003d0c:	00006797          	auipc	a5,0x6
    80003d10:	16c7a783          	lw	a5,364(a5) # 80009e78 <threadEnd>
    80003d14:	02079e63          	bnez	a5,80003d50 <_Z8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80003d18:	0004a583          	lw	a1,0(s1)
    80003d1c:	0305859b          	addiw	a1,a1,48
    80003d20:	0084b503          	ld	a0,8(s1)
    80003d24:	00000097          	auipc	ra,0x0
    80003d28:	ccc080e7          	jalr	-820(ra) # 800039f0 <_ZN6Buffer3putEi>
        i++;
    80003d2c:	0019071b          	addiw	a4,s2,1
    80003d30:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003d34:	0004a683          	lw	a3,0(s1)
    80003d38:	0026979b          	slliw	a5,a3,0x2
    80003d3c:	00d787bb          	addw	a5,a5,a3
    80003d40:	0017979b          	slliw	a5,a5,0x1
    80003d44:	02f767bb          	remw	a5,a4,a5
    80003d48:	fc0792e3          	bnez	a5,80003d0c <_Z8producerPv+0x2c>
    80003d4c:	fb9ff06f          	j	80003d04 <_Z8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    80003d50:	0104b503          	ld	a0,16(s1)
    80003d54:	fffff097          	auipc	ra,0xfffff
    80003d58:	974080e7          	jalr	-1676(ra) # 800026c8 <_Z10sem_signalP4_sem>
}
    80003d5c:	01813083          	ld	ra,24(sp)
    80003d60:	01013403          	ld	s0,16(sp)
    80003d64:	00813483          	ld	s1,8(sp)
    80003d68:	00013903          	ld	s2,0(sp)
    80003d6c:	02010113          	addi	sp,sp,32
    80003d70:	00008067          	ret

0000000080003d74 <_Z8consumerPv>:

void consumer(void *arg) {
    80003d74:	fd010113          	addi	sp,sp,-48
    80003d78:	02113423          	sd	ra,40(sp)
    80003d7c:	02813023          	sd	s0,32(sp)
    80003d80:	00913c23          	sd	s1,24(sp)
    80003d84:	01213823          	sd	s2,16(sp)
    80003d88:	01313423          	sd	s3,8(sp)
    80003d8c:	03010413          	addi	s0,sp,48
    80003d90:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;


    int i = 0;
    80003d94:	00000993          	li	s3,0
    80003d98:	01c0006f          	j	80003db4 <_Z8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    80003d9c:	ffffe097          	auipc	ra,0xffffe
    80003da0:	7f4080e7          	jalr	2036(ra) # 80002590 <_Z15thread_dispatchv>
    80003da4:	0500006f          	j	80003df4 <_Z8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    80003da8:	00a00513          	li	a0,10
    80003dac:	fffff097          	auipc	ra,0xfffff
    80003db0:	9b8080e7          	jalr	-1608(ra) # 80002764 <_Z4putcc>
    while (!threadEnd) {
    80003db4:	00006797          	auipc	a5,0x6
    80003db8:	0c47a783          	lw	a5,196(a5) # 80009e78 <threadEnd>
    80003dbc:	04079463          	bnez	a5,80003e04 <_Z8consumerPv+0x90>
        int key = data->buffer->get();
    80003dc0:	00893503          	ld	a0,8(s2)
    80003dc4:	00000097          	auipc	ra,0x0
    80003dc8:	cbc080e7          	jalr	-836(ra) # 80003a80 <_ZN6Buffer3getEv>
        i++;
    80003dcc:	0019849b          	addiw	s1,s3,1
    80003dd0:	0004899b          	sext.w	s3,s1
        putc(key);
    80003dd4:	0ff57513          	andi	a0,a0,255
    80003dd8:	fffff097          	auipc	ra,0xfffff
    80003ddc:	98c080e7          	jalr	-1652(ra) # 80002764 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80003de0:	00092703          	lw	a4,0(s2)
    80003de4:	0027179b          	slliw	a5,a4,0x2
    80003de8:	00e787bb          	addw	a5,a5,a4
    80003dec:	02f4e7bb          	remw	a5,s1,a5
    80003df0:	fa0786e3          	beqz	a5,80003d9c <_Z8consumerPv+0x28>
        if (i % 80 == 0) {
    80003df4:	05000793          	li	a5,80
    80003df8:	02f4e4bb          	remw	s1,s1,a5
    80003dfc:	fa049ce3          	bnez	s1,80003db4 <_Z8consumerPv+0x40>
    80003e00:	fa9ff06f          	j	80003da8 <_Z8consumerPv+0x34>
        }
    }

    sem_signal(data->wait);
    80003e04:	01093503          	ld	a0,16(s2)
    80003e08:	fffff097          	auipc	ra,0xfffff
    80003e0c:	8c0080e7          	jalr	-1856(ra) # 800026c8 <_Z10sem_signalP4_sem>
}
    80003e10:	02813083          	ld	ra,40(sp)
    80003e14:	02013403          	ld	s0,32(sp)
    80003e18:	01813483          	ld	s1,24(sp)
    80003e1c:	01013903          	ld	s2,16(sp)
    80003e20:	00813983          	ld	s3,8(sp)
    80003e24:	03010113          	addi	sp,sp,48
    80003e28:	00008067          	ret

0000000080003e2c <_Z11printStringPKc>:
{
    80003e2c:	fe010113          	addi	sp,sp,-32
    80003e30:	00113c23          	sd	ra,24(sp)
    80003e34:	00813823          	sd	s0,16(sp)
    80003e38:	00913423          	sd	s1,8(sp)
    80003e3c:	02010413          	addi	s0,sp,32
    80003e40:	00050493          	mv	s1,a0
    LOCK();
    80003e44:	00100613          	li	a2,1
    80003e48:	00000593          	li	a1,0
    80003e4c:	00006517          	auipc	a0,0x6
    80003e50:	02450513          	addi	a0,a0,36 # 80009e70 <lockPrint>
    80003e54:	ffffd097          	auipc	ra,0xffffd
    80003e58:	32c080e7          	jalr	812(ra) # 80001180 <copy_and_swap>
    80003e5c:	fe0514e3          	bnez	a0,80003e44 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80003e60:	0004c503          	lbu	a0,0(s1)
    80003e64:	00050a63          	beqz	a0,80003e78 <_Z11printStringPKc+0x4c>
        putc(*string);
    80003e68:	fffff097          	auipc	ra,0xfffff
    80003e6c:	8fc080e7          	jalr	-1796(ra) # 80002764 <_Z4putcc>
        string++;
    80003e70:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80003e74:	fedff06f          	j	80003e60 <_Z11printStringPKc+0x34>
    UNLOCK();
    80003e78:	00000613          	li	a2,0
    80003e7c:	00100593          	li	a1,1
    80003e80:	00006517          	auipc	a0,0x6
    80003e84:	ff050513          	addi	a0,a0,-16 # 80009e70 <lockPrint>
    80003e88:	ffffd097          	auipc	ra,0xffffd
    80003e8c:	2f8080e7          	jalr	760(ra) # 80001180 <copy_and_swap>
    80003e90:	fe0514e3          	bnez	a0,80003e78 <_Z11printStringPKc+0x4c>
}
    80003e94:	01813083          	ld	ra,24(sp)
    80003e98:	01013403          	ld	s0,16(sp)
    80003e9c:	00813483          	ld	s1,8(sp)
    80003ea0:	02010113          	addi	sp,sp,32
    80003ea4:	00008067          	ret

0000000080003ea8 <_Z11workerBodyAPv>:
    if (n == 0 || n == 1) { return n; }
    if (n % 10 == 0) { thread_dispatch(); }
    return fibonacci(n - 1) + fibonacci(n - 2);
}

void workerBodyA(void* arg) {
    80003ea8:	fe010113          	addi	sp,sp,-32
    80003eac:	00113c23          	sd	ra,24(sp)
    80003eb0:	00813823          	sd	s0,16(sp)
    80003eb4:	00913423          	sd	s1,8(sp)
    80003eb8:	01213023          	sd	s2,0(sp)
    80003ebc:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80003ec0:	00000913          	li	s2,0
    80003ec4:	0380006f          	j	80003efc <_Z11workerBodyAPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003ec8:	ffffe097          	auipc	ra,0xffffe
    80003ecc:	6c8080e7          	jalr	1736(ra) # 80002590 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003ed0:	00148493          	addi	s1,s1,1
    80003ed4:	000027b7          	lui	a5,0x2
    80003ed8:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003edc:	0097ee63          	bltu	a5,s1,80003ef8 <_Z11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003ee0:	00000713          	li	a4,0
    80003ee4:	000077b7          	lui	a5,0x7
    80003ee8:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003eec:	fce7eee3          	bltu	a5,a4,80003ec8 <_Z11workerBodyAPv+0x20>
    80003ef0:	00170713          	addi	a4,a4,1
    80003ef4:	ff1ff06f          	j	80003ee4 <_Z11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80003ef8:	00190913          	addi	s2,s2,1
    80003efc:	00900793          	li	a5,9
    80003f00:	0527e063          	bltu	a5,s2,80003f40 <_Z11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80003f04:	00004517          	auipc	a0,0x4
    80003f08:	2fc50513          	addi	a0,a0,764 # 80008200 <_ZZ14kprintUnsignedmE6digits+0x10>
    80003f0c:	00000097          	auipc	ra,0x0
    80003f10:	f20080e7          	jalr	-224(ra) # 80003e2c <_Z11printStringPKc>
    80003f14:	00000613          	li	a2,0
    80003f18:	00a00593          	li	a1,10
    80003f1c:	0009051b          	sext.w	a0,s2
    80003f20:	00000097          	auipc	ra,0x0
    80003f24:	bec080e7          	jalr	-1044(ra) # 80003b0c <_ZL8printIntiii>
    80003f28:	00004517          	auipc	a0,0x4
    80003f2c:	26050513          	addi	a0,a0,608 # 80008188 <CONSOLE_STATUS+0x178>
    80003f30:	00000097          	auipc	ra,0x0
    80003f34:	efc080e7          	jalr	-260(ra) # 80003e2c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003f38:	00000493          	li	s1,0
    80003f3c:	f99ff06f          	j	80003ed4 <_Z11workerBodyAPv+0x2c>
        }
    }
    printString("A finished!\n");
    80003f40:	00004517          	auipc	a0,0x4
    80003f44:	2c850513          	addi	a0,a0,712 # 80008208 <_ZZ14kprintUnsignedmE6digits+0x18>
    80003f48:	00000097          	auipc	ra,0x0
    80003f4c:	ee4080e7          	jalr	-284(ra) # 80003e2c <_Z11printStringPKc>
    finishedA = true;
    80003f50:	00100793          	li	a5,1
    80003f54:	00006717          	auipc	a4,0x6
    80003f58:	f2f70423          	sb	a5,-216(a4) # 80009e7c <finishedA>
}
    80003f5c:	01813083          	ld	ra,24(sp)
    80003f60:	01013403          	ld	s0,16(sp)
    80003f64:	00813483          	ld	s1,8(sp)
    80003f68:	00013903          	ld	s2,0(sp)
    80003f6c:	02010113          	addi	sp,sp,32
    80003f70:	00008067          	ret

0000000080003f74 <_Z11workerBodyBPv>:

void workerBodyB(void* arg) {
    80003f74:	fe010113          	addi	sp,sp,-32
    80003f78:	00113c23          	sd	ra,24(sp)
    80003f7c:	00813823          	sd	s0,16(sp)
    80003f80:	00913423          	sd	s1,8(sp)
    80003f84:	01213023          	sd	s2,0(sp)
    80003f88:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80003f8c:	00000913          	li	s2,0
    80003f90:	0380006f          	j	80003fc8 <_Z11workerBodyBPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003f94:	ffffe097          	auipc	ra,0xffffe
    80003f98:	5fc080e7          	jalr	1532(ra) # 80002590 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003f9c:	00148493          	addi	s1,s1,1
    80003fa0:	000027b7          	lui	a5,0x2
    80003fa4:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003fa8:	0097ee63          	bltu	a5,s1,80003fc4 <_Z11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003fac:	00000713          	li	a4,0
    80003fb0:	000077b7          	lui	a5,0x7
    80003fb4:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003fb8:	fce7eee3          	bltu	a5,a4,80003f94 <_Z11workerBodyBPv+0x20>
    80003fbc:	00170713          	addi	a4,a4,1
    80003fc0:	ff1ff06f          	j	80003fb0 <_Z11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80003fc4:	00190913          	addi	s2,s2,1
    80003fc8:	00f00793          	li	a5,15
    80003fcc:	0527e063          	bltu	a5,s2,8000400c <_Z11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80003fd0:	00004517          	auipc	a0,0x4
    80003fd4:	24850513          	addi	a0,a0,584 # 80008218 <_ZZ14kprintUnsignedmE6digits+0x28>
    80003fd8:	00000097          	auipc	ra,0x0
    80003fdc:	e54080e7          	jalr	-428(ra) # 80003e2c <_Z11printStringPKc>
    80003fe0:	00000613          	li	a2,0
    80003fe4:	00a00593          	li	a1,10
    80003fe8:	0009051b          	sext.w	a0,s2
    80003fec:	00000097          	auipc	ra,0x0
    80003ff0:	b20080e7          	jalr	-1248(ra) # 80003b0c <_ZL8printIntiii>
    80003ff4:	00004517          	auipc	a0,0x4
    80003ff8:	19450513          	addi	a0,a0,404 # 80008188 <CONSOLE_STATUS+0x178>
    80003ffc:	00000097          	auipc	ra,0x0
    80004000:	e30080e7          	jalr	-464(ra) # 80003e2c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80004004:	00000493          	li	s1,0
    80004008:	f99ff06f          	j	80003fa0 <_Z11workerBodyBPv+0x2c>
        }
    }
    printString("B finished!\n");
    8000400c:	00004517          	auipc	a0,0x4
    80004010:	21450513          	addi	a0,a0,532 # 80008220 <_ZZ14kprintUnsignedmE6digits+0x30>
    80004014:	00000097          	auipc	ra,0x0
    80004018:	e18080e7          	jalr	-488(ra) # 80003e2c <_Z11printStringPKc>
    finishedB = true;
    8000401c:	00100793          	li	a5,1
    80004020:	00006717          	auipc	a4,0x6
    80004024:	e4f70ea3          	sb	a5,-419(a4) # 80009e7d <finishedB>
    thread_dispatch();
    80004028:	ffffe097          	auipc	ra,0xffffe
    8000402c:	568080e7          	jalr	1384(ra) # 80002590 <_Z15thread_dispatchv>
}
    80004030:	01813083          	ld	ra,24(sp)
    80004034:	01013403          	ld	s0,16(sp)
    80004038:	00813483          	ld	s1,8(sp)
    8000403c:	00013903          	ld	s2,0(sp)
    80004040:	02010113          	addi	sp,sp,32
    80004044:	00008067          	ret

0000000080004048 <_Z9sleepyRunPv>:

#include "printing.hpp"

bool finished[2];

void sleepyRun(void *arg) {
    80004048:	fe010113          	addi	sp,sp,-32
    8000404c:	00113c23          	sd	ra,24(sp)
    80004050:	00813823          	sd	s0,16(sp)
    80004054:	00913423          	sd	s1,8(sp)
    80004058:	01213023          	sd	s2,0(sp)
    8000405c:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    80004060:	00053903          	ld	s2,0(a0)
    int i = 6;
    80004064:	00600493          	li	s1,6
    while (--i > 0) {
    80004068:	fff4849b          	addiw	s1,s1,-1
    8000406c:	04905463          	blez	s1,800040b4 <_Z9sleepyRunPv+0x6c>
        printString("Hello ");
    80004070:	00004517          	auipc	a0,0x4
    80004074:	1c050513          	addi	a0,a0,448 # 80008230 <_ZZ14kprintUnsignedmE6digits+0x40>
    80004078:	00000097          	auipc	ra,0x0
    8000407c:	db4080e7          	jalr	-588(ra) # 80003e2c <_Z11printStringPKc>
        printInt(sleep_time);
    80004080:	00000613          	li	a2,0
    80004084:	00a00593          	li	a1,10
    80004088:	0009051b          	sext.w	a0,s2
    8000408c:	00000097          	auipc	ra,0x0
    80004090:	a80080e7          	jalr	-1408(ra) # 80003b0c <_ZL8printIntiii>
        printString(" !\n");
    80004094:	00004517          	auipc	a0,0x4
    80004098:	1a450513          	addi	a0,a0,420 # 80008238 <_ZZ14kprintUnsignedmE6digits+0x48>
    8000409c:	00000097          	auipc	ra,0x0
    800040a0:	d90080e7          	jalr	-624(ra) # 80003e2c <_Z11printStringPKc>
        time_sleep(sleep_time);
    800040a4:	00090513          	mv	a0,s2
    800040a8:	ffffe097          	auipc	ra,0xffffe
    800040ac:	654080e7          	jalr	1620(ra) # 800026fc <_Z10time_sleepm>
    while (--i > 0) {
    800040b0:	fb9ff06f          	j	80004068 <_Z9sleepyRunPv+0x20>
    }
    finished[sleep_time/10-1] = true;
    800040b4:	00a00793          	li	a5,10
    800040b8:	02f95933          	divu	s2,s2,a5
    800040bc:	fff90913          	addi	s2,s2,-1
    800040c0:	00006797          	auipc	a5,0x6
    800040c4:	db078793          	addi	a5,a5,-592 # 80009e70 <lockPrint>
    800040c8:	01278933          	add	s2,a5,s2
    800040cc:	00100793          	li	a5,1
    800040d0:	00f90823          	sb	a5,16(s2)
}
    800040d4:	01813083          	ld	ra,24(sp)
    800040d8:	01013403          	ld	s0,16(sp)
    800040dc:	00813483          	ld	s1,8(sp)
    800040e0:	00013903          	ld	s2,0(sp)
    800040e4:	02010113          	addi	sp,sp,32
    800040e8:	00008067          	ret

00000000800040ec <_Z11workerBodyEPv>:
//    printInteger(n);
//    printString(" fibonacci number\n");
    return fibonacci(n-1) + fibonacci(n-2);
}

void workerBodyE(void *) {
    800040ec:	fe010113          	addi	sp,sp,-32
    800040f0:	00113c23          	sd	ra,24(sp)
    800040f4:	00813823          	sd	s0,16(sp)
    800040f8:	00913423          	sd	s1,8(sp)
    800040fc:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80004100:	00000493          	li	s1,0
    80004104:	0180006f          	j	8000411c <_Z11workerBodyEPv+0x30>
        printString("A: i=");
        printInt(i);
        printString("\n");
        if (i % 4 == 0) time_sleep(50);
    80004108:	03200513          	li	a0,50
    8000410c:	ffffe097          	auipc	ra,0xffffe
    80004110:	5f0080e7          	jalr	1520(ra) # 800026fc <_Z10time_sleepm>
    80004114:	04c0006f          	j	80004160 <_Z11workerBodyEPv+0x74>
    for (uint64 i = 0; i < 10; i++) {
    80004118:	00148493          	addi	s1,s1,1
    8000411c:	00900793          	li	a5,9
    80004120:	0497ec63          	bltu	a5,s1,80004178 <_Z11workerBodyEPv+0x8c>
        printString("A: i=");
    80004124:	00004517          	auipc	a0,0x4
    80004128:	0dc50513          	addi	a0,a0,220 # 80008200 <_ZZ14kprintUnsignedmE6digits+0x10>
    8000412c:	00000097          	auipc	ra,0x0
    80004130:	d00080e7          	jalr	-768(ra) # 80003e2c <_Z11printStringPKc>
        printInt(i);
    80004134:	00000613          	li	a2,0
    80004138:	00a00593          	li	a1,10
    8000413c:	0004851b          	sext.w	a0,s1
    80004140:	00000097          	auipc	ra,0x0
    80004144:	9cc080e7          	jalr	-1588(ra) # 80003b0c <_ZL8printIntiii>
        printString("\n");
    80004148:	00004517          	auipc	a0,0x4
    8000414c:	04050513          	addi	a0,a0,64 # 80008188 <CONSOLE_STATUS+0x178>
    80004150:	00000097          	auipc	ra,0x0
    80004154:	cdc080e7          	jalr	-804(ra) # 80003e2c <_Z11printStringPKc>
        if (i % 4 == 0) time_sleep(50);
    80004158:	0034f793          	andi	a5,s1,3
    8000415c:	fa0786e3          	beqz	a5,80004108 <_Z11workerBodyEPv+0x1c>
        for (uint64 k = 0; k < 30000; k++) {
    80004160:	00000713          	li	a4,0
    80004164:	000077b7          	lui	a5,0x7
    80004168:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    8000416c:	fae7e6e3          	bltu	a5,a4,80004118 <_Z11workerBodyEPv+0x2c>
    80004170:	00170713          	addi	a4,a4,1
    80004174:	ff1ff06f          	j	80004164 <_Z11workerBodyEPv+0x78>
            //busy wait
        }
        // TCB::yield();
    }
    printString("Worker A finished\n");
    80004178:	00004517          	auipc	a0,0x4
    8000417c:	0c850513          	addi	a0,a0,200 # 80008240 <_ZZ14kprintUnsignedmE6digits+0x50>
    80004180:	00000097          	auipc	ra,0x0
    80004184:	cac080e7          	jalr	-852(ra) # 80003e2c <_Z11printStringPKc>
}
    80004188:	01813083          	ld	ra,24(sp)
    8000418c:	01013403          	ld	s0,16(sp)
    80004190:	00813483          	ld	s1,8(sp)
    80004194:	02010113          	addi	sp,sp,32
    80004198:	00008067          	ret

000000008000419c <_Z11workerBodyFPv>:

void workerBodyF(void *) {
    8000419c:	fe010113          	addi	sp,sp,-32
    800041a0:	00113c23          	sd	ra,24(sp)
    800041a4:	00813823          	sd	s0,16(sp)
    800041a8:	00913423          	sd	s1,8(sp)
    800041ac:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    800041b0:	00000493          	li	s1,0
    800041b4:	0380006f          	j	800041ec <_Z11workerBodyFPv+0x50>
        printString("B: i=");
        printInt(i);
        printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
    800041b8:	00168693          	addi	a3,a3,1
    800041bc:	000027b7          	lui	a5,0x2
    800041c0:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800041c4:	00d7ee63          	bltu	a5,a3,800041e0 <_Z11workerBodyFPv+0x44>
            for (uint64 k = 0; k < 30000; k++) {
    800041c8:	00000713          	li	a4,0
    800041cc:	000077b7          	lui	a5,0x7
    800041d0:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800041d4:	fee7e2e3          	bltu	a5,a4,800041b8 <_Z11workerBodyFPv+0x1c>
    800041d8:	00170713          	addi	a4,a4,1
    800041dc:	ff1ff06f          	j	800041cc <_Z11workerBodyFPv+0x30>
                // busy wait
            }
            // TCB::yield()
        }
        thread_dispatch();
    800041e0:	ffffe097          	auipc	ra,0xffffe
    800041e4:	3b0080e7          	jalr	944(ra) # 80002590 <_Z15thread_dispatchv>
    for (uint64 i = 0; i < 16; i++) {
    800041e8:	00148493          	addi	s1,s1,1
    800041ec:	00f00793          	li	a5,15
    800041f0:	0497e063          	bltu	a5,s1,80004230 <_Z11workerBodyFPv+0x94>
        printString("B: i=");
    800041f4:	00004517          	auipc	a0,0x4
    800041f8:	02450513          	addi	a0,a0,36 # 80008218 <_ZZ14kprintUnsignedmE6digits+0x28>
    800041fc:	00000097          	auipc	ra,0x0
    80004200:	c30080e7          	jalr	-976(ra) # 80003e2c <_Z11printStringPKc>
        printInt(i);
    80004204:	00000613          	li	a2,0
    80004208:	00a00593          	li	a1,10
    8000420c:	0004851b          	sext.w	a0,s1
    80004210:	00000097          	auipc	ra,0x0
    80004214:	8fc080e7          	jalr	-1796(ra) # 80003b0c <_ZL8printIntiii>
        printString("\n");
    80004218:	00004517          	auipc	a0,0x4
    8000421c:	f7050513          	addi	a0,a0,-144 # 80008188 <CONSOLE_STATUS+0x178>
    80004220:	00000097          	auipc	ra,0x0
    80004224:	c0c080e7          	jalr	-1012(ra) # 80003e2c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80004228:	00000693          	li	a3,0
    8000422c:	f91ff06f          	j	800041bc <_Z11workerBodyFPv+0x20>
    }
    printString("Worker B finished\n");
    80004230:	00004517          	auipc	a0,0x4
    80004234:	02850513          	addi	a0,a0,40 # 80008258 <_ZZ14kprintUnsignedmE6digits+0x68>
    80004238:	00000097          	auipc	ra,0x0
    8000423c:	bf4080e7          	jalr	-1036(ra) # 80003e2c <_Z11printStringPKc>
}
    80004240:	01813083          	ld	ra,24(sp)
    80004244:	01013403          	ld	s0,16(sp)
    80004248:	00813483          	ld	s1,8(sp)
    8000424c:	02010113          	addi	sp,sp,32
    80004250:	00008067          	ret

0000000080004254 <_Z9getStringPci>:
char* getString(char *buf, int max) {
    80004254:	fd010113          	addi	sp,sp,-48
    80004258:	02113423          	sd	ra,40(sp)
    8000425c:	02813023          	sd	s0,32(sp)
    80004260:	00913c23          	sd	s1,24(sp)
    80004264:	01213823          	sd	s2,16(sp)
    80004268:	01313423          	sd	s3,8(sp)
    8000426c:	01413023          	sd	s4,0(sp)
    80004270:	03010413          	addi	s0,sp,48
    80004274:	00050993          	mv	s3,a0
    80004278:	00058a13          	mv	s4,a1
    LOCK();
    8000427c:	00100613          	li	a2,1
    80004280:	00000593          	li	a1,0
    80004284:	00006517          	auipc	a0,0x6
    80004288:	bec50513          	addi	a0,a0,-1044 # 80009e70 <lockPrint>
    8000428c:	ffffd097          	auipc	ra,0xffffd
    80004290:	ef4080e7          	jalr	-268(ra) # 80001180 <copy_and_swap>
    80004294:	fe0514e3          	bnez	a0,8000427c <_Z9getStringPci+0x28>
    for(i=0; i+1 < max; ){
    80004298:	00000913          	li	s2,0
    8000429c:	00090493          	mv	s1,s2
    800042a0:	0019091b          	addiw	s2,s2,1
    800042a4:	03495a63          	bge	s2,s4,800042d8 <_Z9getStringPci+0x84>
        cc = getc();
    800042a8:	ffffe097          	auipc	ra,0xffffe
    800042ac:	488080e7          	jalr	1160(ra) # 80002730 <_Z4getcv>
        if(cc < 1)
    800042b0:	02050463          	beqz	a0,800042d8 <_Z9getStringPci+0x84>
        buf[i++] = c;
    800042b4:	009984b3          	add	s1,s3,s1
    800042b8:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    800042bc:	00a00793          	li	a5,10
    800042c0:	00f50a63          	beq	a0,a5,800042d4 <_Z9getStringPci+0x80>
    800042c4:	00d00793          	li	a5,13
    800042c8:	fcf51ae3          	bne	a0,a5,8000429c <_Z9getStringPci+0x48>
        buf[i++] = c;
    800042cc:	00090493          	mv	s1,s2
    800042d0:	0080006f          	j	800042d8 <_Z9getStringPci+0x84>
    800042d4:	00090493          	mv	s1,s2
    buf[i] = '\0';
    800042d8:	009984b3          	add	s1,s3,s1
    800042dc:	00048023          	sb	zero,0(s1)
    UNLOCK();
    800042e0:	00000613          	li	a2,0
    800042e4:	00100593          	li	a1,1
    800042e8:	00006517          	auipc	a0,0x6
    800042ec:	b8850513          	addi	a0,a0,-1144 # 80009e70 <lockPrint>
    800042f0:	ffffd097          	auipc	ra,0xffffd
    800042f4:	e90080e7          	jalr	-368(ra) # 80001180 <copy_and_swap>
    800042f8:	fe0514e3          	bnez	a0,800042e0 <_Z9getStringPci+0x8c>
}
    800042fc:	00098513          	mv	a0,s3
    80004300:	02813083          	ld	ra,40(sp)
    80004304:	02013403          	ld	s0,32(sp)
    80004308:	01813483          	ld	s1,24(sp)
    8000430c:	01013903          	ld	s2,16(sp)
    80004310:	00813983          	ld	s3,8(sp)
    80004314:	00013a03          	ld	s4,0(sp)
    80004318:	03010113          	addi	sp,sp,48
    8000431c:	00008067          	ret

0000000080004320 <_Z11stringToIntPKc>:
int stringToInt(const char *s) {
    80004320:	ff010113          	addi	sp,sp,-16
    80004324:	00813423          	sd	s0,8(sp)
    80004328:	01010413          	addi	s0,sp,16
    8000432c:	00050693          	mv	a3,a0
    n = 0;
    80004330:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80004334:	0006c603          	lbu	a2,0(a3)
    80004338:	fd06071b          	addiw	a4,a2,-48
    8000433c:	0ff77713          	andi	a4,a4,255
    80004340:	00900793          	li	a5,9
    80004344:	02e7e063          	bltu	a5,a4,80004364 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80004348:	0025179b          	slliw	a5,a0,0x2
    8000434c:	00a787bb          	addw	a5,a5,a0
    80004350:	0017979b          	slliw	a5,a5,0x1
    80004354:	00168693          	addi	a3,a3,1
    80004358:	00c787bb          	addw	a5,a5,a2
    8000435c:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80004360:	fd5ff06f          	j	80004334 <_Z11stringToIntPKc+0x14>
}
    80004364:	00813403          	ld	s0,8(sp)
    80004368:	01010113          	addi	sp,sp,16
    8000436c:	00008067          	ret

0000000080004370 <_Z9fibonaccim>:
uint64 fibonacci(uint64 n) {
    80004370:	fe010113          	addi	sp,sp,-32
    80004374:	00113c23          	sd	ra,24(sp)
    80004378:	00813823          	sd	s0,16(sp)
    8000437c:	00913423          	sd	s1,8(sp)
    80004380:	01213023          	sd	s2,0(sp)
    80004384:	02010413          	addi	s0,sp,32
    80004388:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    8000438c:	00100793          	li	a5,1
    80004390:	02a7f863          	bgeu	a5,a0,800043c0 <_Z9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80004394:	00a00793          	li	a5,10
    80004398:	02f577b3          	remu	a5,a0,a5
    8000439c:	02078e63          	beqz	a5,800043d8 <_Z9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    800043a0:	fff48513          	addi	a0,s1,-1
    800043a4:	00000097          	auipc	ra,0x0
    800043a8:	fcc080e7          	jalr	-52(ra) # 80004370 <_Z9fibonaccim>
    800043ac:	00050913          	mv	s2,a0
    800043b0:	ffe48513          	addi	a0,s1,-2
    800043b4:	00000097          	auipc	ra,0x0
    800043b8:	fbc080e7          	jalr	-68(ra) # 80004370 <_Z9fibonaccim>
    800043bc:	00a90533          	add	a0,s2,a0
}
    800043c0:	01813083          	ld	ra,24(sp)
    800043c4:	01013403          	ld	s0,16(sp)
    800043c8:	00813483          	ld	s1,8(sp)
    800043cc:	00013903          	ld	s2,0(sp)
    800043d0:	02010113          	addi	sp,sp,32
    800043d4:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    800043d8:	ffffe097          	auipc	ra,0xffffe
    800043dc:	1b8080e7          	jalr	440(ra) # 80002590 <_Z15thread_dispatchv>
    800043e0:	fc1ff06f          	j	800043a0 <_Z9fibonaccim+0x30>

00000000800043e4 <_Z11workerBodyCPv>:

void workerBodyC(void* arg) {
    800043e4:	fe010113          	addi	sp,sp,-32
    800043e8:	00113c23          	sd	ra,24(sp)
    800043ec:	00813823          	sd	s0,16(sp)
    800043f0:	00913423          	sd	s1,8(sp)
    800043f4:	01213023          	sd	s2,0(sp)
    800043f8:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800043fc:	00000493          	li	s1,0
    80004400:	0400006f          	j	80004440 <_Z11workerBodyCPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80004404:	00004517          	auipc	a0,0x4
    80004408:	e6c50513          	addi	a0,a0,-404 # 80008270 <_ZZ14kprintUnsignedmE6digits+0x80>
    8000440c:	00000097          	auipc	ra,0x0
    80004410:	a20080e7          	jalr	-1504(ra) # 80003e2c <_Z11printStringPKc>
    80004414:	00000613          	li	a2,0
    80004418:	00a00593          	li	a1,10
    8000441c:	00048513          	mv	a0,s1
    80004420:	fffff097          	auipc	ra,0xfffff
    80004424:	6ec080e7          	jalr	1772(ra) # 80003b0c <_ZL8printIntiii>
    80004428:	00004517          	auipc	a0,0x4
    8000442c:	d6050513          	addi	a0,a0,-672 # 80008188 <CONSOLE_STATUS+0x178>
    80004430:	00000097          	auipc	ra,0x0
    80004434:	9fc080e7          	jalr	-1540(ra) # 80003e2c <_Z11printStringPKc>
    for (; i < 3; i++) {
    80004438:	0014849b          	addiw	s1,s1,1
    8000443c:	0ff4f493          	andi	s1,s1,255
    80004440:	00200793          	li	a5,2
    80004444:	fc97f0e3          	bgeu	a5,s1,80004404 <_Z11workerBodyCPv+0x20>
    }

    printString("C: dispatch\n");
    80004448:	00004517          	auipc	a0,0x4
    8000444c:	e3050513          	addi	a0,a0,-464 # 80008278 <_ZZ14kprintUnsignedmE6digits+0x88>
    80004450:	00000097          	auipc	ra,0x0
    80004454:	9dc080e7          	jalr	-1572(ra) # 80003e2c <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80004458:	00700313          	li	t1,7
    thread_dispatch();
    8000445c:	ffffe097          	auipc	ra,0xffffe
    80004460:	134080e7          	jalr	308(ra) # 80002590 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80004464:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    80004468:	00004517          	auipc	a0,0x4
    8000446c:	e2050513          	addi	a0,a0,-480 # 80008288 <_ZZ14kprintUnsignedmE6digits+0x98>
    80004470:	00000097          	auipc	ra,0x0
    80004474:	9bc080e7          	jalr	-1604(ra) # 80003e2c <_Z11printStringPKc>
    80004478:	00000613          	li	a2,0
    8000447c:	00a00593          	li	a1,10
    80004480:	0009051b          	sext.w	a0,s2
    80004484:	fffff097          	auipc	ra,0xfffff
    80004488:	688080e7          	jalr	1672(ra) # 80003b0c <_ZL8printIntiii>
    8000448c:	00004517          	auipc	a0,0x4
    80004490:	cfc50513          	addi	a0,a0,-772 # 80008188 <CONSOLE_STATUS+0x178>
    80004494:	00000097          	auipc	ra,0x0
    80004498:	998080e7          	jalr	-1640(ra) # 80003e2c <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    8000449c:	00c00513          	li	a0,12
    800044a0:	00000097          	auipc	ra,0x0
    800044a4:	ed0080e7          	jalr	-304(ra) # 80004370 <_Z9fibonaccim>
    800044a8:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    800044ac:	00004517          	auipc	a0,0x4
    800044b0:	de450513          	addi	a0,a0,-540 # 80008290 <_ZZ14kprintUnsignedmE6digits+0xa0>
    800044b4:	00000097          	auipc	ra,0x0
    800044b8:	978080e7          	jalr	-1672(ra) # 80003e2c <_Z11printStringPKc>
    800044bc:	00000613          	li	a2,0
    800044c0:	00a00593          	li	a1,10
    800044c4:	0009051b          	sext.w	a0,s2
    800044c8:	fffff097          	auipc	ra,0xfffff
    800044cc:	644080e7          	jalr	1604(ra) # 80003b0c <_ZL8printIntiii>
    800044d0:	00004517          	auipc	a0,0x4
    800044d4:	cb850513          	addi	a0,a0,-840 # 80008188 <CONSOLE_STATUS+0x178>
    800044d8:	00000097          	auipc	ra,0x0
    800044dc:	954080e7          	jalr	-1708(ra) # 80003e2c <_Z11printStringPKc>
    800044e0:	0400006f          	j	80004520 <_Z11workerBodyCPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    800044e4:	00004517          	auipc	a0,0x4
    800044e8:	d8c50513          	addi	a0,a0,-628 # 80008270 <_ZZ14kprintUnsignedmE6digits+0x80>
    800044ec:	00000097          	auipc	ra,0x0
    800044f0:	940080e7          	jalr	-1728(ra) # 80003e2c <_Z11printStringPKc>
    800044f4:	00000613          	li	a2,0
    800044f8:	00a00593          	li	a1,10
    800044fc:	00048513          	mv	a0,s1
    80004500:	fffff097          	auipc	ra,0xfffff
    80004504:	60c080e7          	jalr	1548(ra) # 80003b0c <_ZL8printIntiii>
    80004508:	00004517          	auipc	a0,0x4
    8000450c:	c8050513          	addi	a0,a0,-896 # 80008188 <CONSOLE_STATUS+0x178>
    80004510:	00000097          	auipc	ra,0x0
    80004514:	91c080e7          	jalr	-1764(ra) # 80003e2c <_Z11printStringPKc>
    for (; i < 6; i++) {
    80004518:	0014849b          	addiw	s1,s1,1
    8000451c:	0ff4f493          	andi	s1,s1,255
    80004520:	00500793          	li	a5,5
    80004524:	fc97f0e3          	bgeu	a5,s1,800044e4 <_Z11workerBodyCPv+0x100>
    }

    printString("C finished!\n");
    80004528:	00004517          	auipc	a0,0x4
    8000452c:	d7850513          	addi	a0,a0,-648 # 800082a0 <_ZZ14kprintUnsignedmE6digits+0xb0>
    80004530:	00000097          	auipc	ra,0x0
    80004534:	8fc080e7          	jalr	-1796(ra) # 80003e2c <_Z11printStringPKc>
    finishedC = true;
    80004538:	00100793          	li	a5,1
    8000453c:	00006717          	auipc	a4,0x6
    80004540:	94f70323          	sb	a5,-1722(a4) # 80009e82 <finishedC>
    thread_dispatch();
    80004544:	ffffe097          	auipc	ra,0xffffe
    80004548:	04c080e7          	jalr	76(ra) # 80002590 <_Z15thread_dispatchv>
}
    8000454c:	01813083          	ld	ra,24(sp)
    80004550:	01013403          	ld	s0,16(sp)
    80004554:	00813483          	ld	s1,8(sp)
    80004558:	00013903          	ld	s2,0(sp)
    8000455c:	02010113          	addi	sp,sp,32
    80004560:	00008067          	ret

0000000080004564 <_Z11workerBodyDPv>:

void workerBodyD(void* arg) {
    80004564:	fe010113          	addi	sp,sp,-32
    80004568:	00113c23          	sd	ra,24(sp)
    8000456c:	00813823          	sd	s0,16(sp)
    80004570:	00913423          	sd	s1,8(sp)
    80004574:	01213023          	sd	s2,0(sp)
    80004578:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    8000457c:	00a00493          	li	s1,10
    80004580:	0400006f          	j	800045c0 <_Z11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004584:	00004517          	auipc	a0,0x4
    80004588:	d2c50513          	addi	a0,a0,-724 # 800082b0 <_ZZ14kprintUnsignedmE6digits+0xc0>
    8000458c:	00000097          	auipc	ra,0x0
    80004590:	8a0080e7          	jalr	-1888(ra) # 80003e2c <_Z11printStringPKc>
    80004594:	00000613          	li	a2,0
    80004598:	00a00593          	li	a1,10
    8000459c:	00048513          	mv	a0,s1
    800045a0:	fffff097          	auipc	ra,0xfffff
    800045a4:	56c080e7          	jalr	1388(ra) # 80003b0c <_ZL8printIntiii>
    800045a8:	00004517          	auipc	a0,0x4
    800045ac:	be050513          	addi	a0,a0,-1056 # 80008188 <CONSOLE_STATUS+0x178>
    800045b0:	00000097          	auipc	ra,0x0
    800045b4:	87c080e7          	jalr	-1924(ra) # 80003e2c <_Z11printStringPKc>
    for (; i < 13; i++) {
    800045b8:	0014849b          	addiw	s1,s1,1
    800045bc:	0ff4f493          	andi	s1,s1,255
    800045c0:	00c00793          	li	a5,12
    800045c4:	fc97f0e3          	bgeu	a5,s1,80004584 <_Z11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    800045c8:	00004517          	auipc	a0,0x4
    800045cc:	cf050513          	addi	a0,a0,-784 # 800082b8 <_ZZ14kprintUnsignedmE6digits+0xc8>
    800045d0:	00000097          	auipc	ra,0x0
    800045d4:	85c080e7          	jalr	-1956(ra) # 80003e2c <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    800045d8:	00500313          	li	t1,5
    thread_dispatch();
    800045dc:	ffffe097          	auipc	ra,0xffffe
    800045e0:	fb4080e7          	jalr	-76(ra) # 80002590 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    800045e4:	01000513          	li	a0,16
    800045e8:	00000097          	auipc	ra,0x0
    800045ec:	d88080e7          	jalr	-632(ra) # 80004370 <_Z9fibonaccim>
    800045f0:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    800045f4:	00004517          	auipc	a0,0x4
    800045f8:	cd450513          	addi	a0,a0,-812 # 800082c8 <_ZZ14kprintUnsignedmE6digits+0xd8>
    800045fc:	00000097          	auipc	ra,0x0
    80004600:	830080e7          	jalr	-2000(ra) # 80003e2c <_Z11printStringPKc>
    80004604:	00000613          	li	a2,0
    80004608:	00a00593          	li	a1,10
    8000460c:	0009051b          	sext.w	a0,s2
    80004610:	fffff097          	auipc	ra,0xfffff
    80004614:	4fc080e7          	jalr	1276(ra) # 80003b0c <_ZL8printIntiii>
    80004618:	00004517          	auipc	a0,0x4
    8000461c:	b7050513          	addi	a0,a0,-1168 # 80008188 <CONSOLE_STATUS+0x178>
    80004620:	00000097          	auipc	ra,0x0
    80004624:	80c080e7          	jalr	-2036(ra) # 80003e2c <_Z11printStringPKc>
    80004628:	0400006f          	j	80004668 <_Z11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    8000462c:	00004517          	auipc	a0,0x4
    80004630:	c8450513          	addi	a0,a0,-892 # 800082b0 <_ZZ14kprintUnsignedmE6digits+0xc0>
    80004634:	fffff097          	auipc	ra,0xfffff
    80004638:	7f8080e7          	jalr	2040(ra) # 80003e2c <_Z11printStringPKc>
    8000463c:	00000613          	li	a2,0
    80004640:	00a00593          	li	a1,10
    80004644:	00048513          	mv	a0,s1
    80004648:	fffff097          	auipc	ra,0xfffff
    8000464c:	4c4080e7          	jalr	1220(ra) # 80003b0c <_ZL8printIntiii>
    80004650:	00004517          	auipc	a0,0x4
    80004654:	b3850513          	addi	a0,a0,-1224 # 80008188 <CONSOLE_STATUS+0x178>
    80004658:	fffff097          	auipc	ra,0xfffff
    8000465c:	7d4080e7          	jalr	2004(ra) # 80003e2c <_Z11printStringPKc>
    for (; i < 16; i++) {
    80004660:	0014849b          	addiw	s1,s1,1
    80004664:	0ff4f493          	andi	s1,s1,255
    80004668:	00f00793          	li	a5,15
    8000466c:	fc97f0e3          	bgeu	a5,s1,8000462c <_Z11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80004670:	00004517          	auipc	a0,0x4
    80004674:	c6850513          	addi	a0,a0,-920 # 800082d8 <_ZZ14kprintUnsignedmE6digits+0xe8>
    80004678:	fffff097          	auipc	ra,0xfffff
    8000467c:	7b4080e7          	jalr	1972(ra) # 80003e2c <_Z11printStringPKc>
    finishedD = true;
    80004680:	00100793          	li	a5,1
    80004684:	00005717          	auipc	a4,0x5
    80004688:	7ef70fa3          	sb	a5,2047(a4) # 80009e83 <finishedD>
    thread_dispatch();
    8000468c:	ffffe097          	auipc	ra,0xffffe
    80004690:	f04080e7          	jalr	-252(ra) # 80002590 <_Z15thread_dispatchv>
}
    80004694:	01813083          	ld	ra,24(sp)
    80004698:	01013403          	ld	s0,16(sp)
    8000469c:	00813483          	ld	s1,8(sp)
    800046a0:	00013903          	ld	s2,0(sp)
    800046a4:	02010113          	addi	sp,sp,32
    800046a8:	00008067          	ret

00000000800046ac <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    800046ac:	fc010113          	addi	sp,sp,-64
    800046b0:	02113c23          	sd	ra,56(sp)
    800046b4:	02813823          	sd	s0,48(sp)
    800046b8:	02913423          	sd	s1,40(sp)
    800046bc:	04010413          	addi	s0,sp,64
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    800046c0:	00000613          	li	a2,0
    800046c4:	fffff597          	auipc	a1,0xfffff
    800046c8:	7e458593          	addi	a1,a1,2020 # 80003ea8 <_Z11workerBodyAPv>
    800046cc:	fc040513          	addi	a0,s0,-64
    800046d0:	ffffe097          	auipc	ra,0xffffe
    800046d4:	e0c080e7          	jalr	-500(ra) # 800024dc <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadA created\n");
    800046d8:	00004517          	auipc	a0,0x4
    800046dc:	c1050513          	addi	a0,a0,-1008 # 800082e8 <_ZZ14kprintUnsignedmE6digits+0xf8>
    800046e0:	fffff097          	auipc	ra,0xfffff
    800046e4:	74c080e7          	jalr	1868(ra) # 80003e2c <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    800046e8:	00000613          	li	a2,0
    800046ec:	00000597          	auipc	a1,0x0
    800046f0:	88858593          	addi	a1,a1,-1912 # 80003f74 <_Z11workerBodyBPv>
    800046f4:	fc840513          	addi	a0,s0,-56
    800046f8:	ffffe097          	auipc	ra,0xffffe
    800046fc:	de4080e7          	jalr	-540(ra) # 800024dc <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadB created\n");
    80004700:	00004517          	auipc	a0,0x4
    80004704:	c0050513          	addi	a0,a0,-1024 # 80008300 <_ZZ14kprintUnsignedmE6digits+0x110>
    80004708:	fffff097          	auipc	ra,0xfffff
    8000470c:	724080e7          	jalr	1828(ra) # 80003e2c <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80004710:	00000613          	li	a2,0
    80004714:	00000597          	auipc	a1,0x0
    80004718:	cd058593          	addi	a1,a1,-816 # 800043e4 <_Z11workerBodyCPv>
    8000471c:	fd040513          	addi	a0,s0,-48
    80004720:	ffffe097          	auipc	ra,0xffffe
    80004724:	dbc080e7          	jalr	-580(ra) # 800024dc <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadC created\n");
    80004728:	00004517          	auipc	a0,0x4
    8000472c:	bf050513          	addi	a0,a0,-1040 # 80008318 <_ZZ14kprintUnsignedmE6digits+0x128>
    80004730:	fffff097          	auipc	ra,0xfffff
    80004734:	6fc080e7          	jalr	1788(ra) # 80003e2c <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80004738:	00000613          	li	a2,0
    8000473c:	00000597          	auipc	a1,0x0
    80004740:	e2858593          	addi	a1,a1,-472 # 80004564 <_Z11workerBodyDPv>
    80004744:	fd840513          	addi	a0,s0,-40
    80004748:	ffffe097          	auipc	ra,0xffffe
    8000474c:	d94080e7          	jalr	-620(ra) # 800024dc <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadD created\n");
    80004750:	00004517          	auipc	a0,0x4
    80004754:	be050513          	addi	a0,a0,-1056 # 80008330 <_ZZ14kprintUnsignedmE6digits+0x140>
    80004758:	fffff097          	auipc	ra,0xfffff
    8000475c:	6d4080e7          	jalr	1748(ra) # 80003e2c <_Z11printStringPKc>
    80004760:	00c0006f          	j	8000476c <_Z18Threads_C_API_testv+0xc0>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80004764:	ffffe097          	auipc	ra,0xffffe
    80004768:	e2c080e7          	jalr	-468(ra) # 80002590 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    8000476c:	00005797          	auipc	a5,0x5
    80004770:	7107c783          	lbu	a5,1808(a5) # 80009e7c <finishedA>
    80004774:	fe0788e3          	beqz	a5,80004764 <_Z18Threads_C_API_testv+0xb8>
    80004778:	00005797          	auipc	a5,0x5
    8000477c:	7057c783          	lbu	a5,1797(a5) # 80009e7d <finishedB>
    80004780:	fe0782e3          	beqz	a5,80004764 <_Z18Threads_C_API_testv+0xb8>
    80004784:	00005797          	auipc	a5,0x5
    80004788:	6fe7c783          	lbu	a5,1790(a5) # 80009e82 <finishedC>
    8000478c:	fc078ce3          	beqz	a5,80004764 <_Z18Threads_C_API_testv+0xb8>
    80004790:	00005797          	auipc	a5,0x5
    80004794:	6f37c783          	lbu	a5,1779(a5) # 80009e83 <finishedD>
    80004798:	fc0786e3          	beqz	a5,80004764 <_Z18Threads_C_API_testv+0xb8>
    }

    for (auto &thread: threads) { delete thread; }
    8000479c:	fc040493          	addi	s1,s0,-64
    800047a0:	0080006f          	j	800047a8 <_Z18Threads_C_API_testv+0xfc>
    800047a4:	00848493          	addi	s1,s1,8
    800047a8:	fe040793          	addi	a5,s0,-32
    800047ac:	00f48c63          	beq	s1,a5,800047c4 <_Z18Threads_C_API_testv+0x118>
    800047b0:	0004b503          	ld	a0,0(s1)
    800047b4:	fe0508e3          	beqz	a0,800047a4 <_Z18Threads_C_API_testv+0xf8>
    800047b8:	ffffe097          	auipc	ra,0xffffe
    800047bc:	02c080e7          	jalr	44(ra) # 800027e4 <_ZdlPv>
    800047c0:	fe5ff06f          	j	800047a4 <_Z18Threads_C_API_testv+0xf8>
}
    800047c4:	03813083          	ld	ra,56(sp)
    800047c8:	03013403          	ld	s0,48(sp)
    800047cc:	02813483          	ld	s1,40(sp)
    800047d0:	04010113          	addi	sp,sp,64
    800047d4:	00008067          	ret

00000000800047d8 <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    800047d8:	f7010113          	addi	sp,sp,-144
    800047dc:	08113423          	sd	ra,136(sp)
    800047e0:	08813023          	sd	s0,128(sp)
    800047e4:	06913c23          	sd	s1,120(sp)
    800047e8:	07213823          	sd	s2,112(sp)
    800047ec:	07313423          	sd	s3,104(sp)
    800047f0:	09010413          	addi	s0,sp,144
//    getString(input, 30);
//    n = stringToInt(input);

    n = 20;

    printString("Broj proizvodjaca "); printInt(threadNum);
    800047f4:	00004517          	auipc	a0,0x4
    800047f8:	b5450513          	addi	a0,a0,-1196 # 80008348 <_ZZ14kprintUnsignedmE6digits+0x158>
    800047fc:	fffff097          	auipc	ra,0xfffff
    80004800:	630080e7          	jalr	1584(ra) # 80003e2c <_Z11printStringPKc>
    80004804:	00000613          	li	a2,0
    80004808:	00a00593          	li	a1,10
    8000480c:	00a00513          	li	a0,10
    80004810:	fffff097          	auipc	ra,0xfffff
    80004814:	2fc080e7          	jalr	764(ra) # 80003b0c <_ZL8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80004818:	00004517          	auipc	a0,0x4
    8000481c:	b4850513          	addi	a0,a0,-1208 # 80008360 <_ZZ14kprintUnsignedmE6digits+0x170>
    80004820:	fffff097          	auipc	ra,0xfffff
    80004824:	60c080e7          	jalr	1548(ra) # 80003e2c <_Z11printStringPKc>
    80004828:	00000613          	li	a2,0
    8000482c:	00a00593          	li	a1,10
    80004830:	01400513          	li	a0,20
    80004834:	fffff097          	auipc	ra,0xfffff
    80004838:	2d8080e7          	jalr	728(ra) # 80003b0c <_ZL8printIntiii>
    printString(".\n");
    8000483c:	00004517          	auipc	a0,0x4
    80004840:	b3c50513          	addi	a0,a0,-1220 # 80008378 <_ZZ14kprintUnsignedmE6digits+0x188>
    80004844:	fffff097          	auipc	ra,0xfffff
    80004848:	5e8080e7          	jalr	1512(ra) # 80003e2c <_Z11printStringPKc>

    Buffer *buffer = new Buffer(n);
    8000484c:	03800513          	li	a0,56
    80004850:	ffffe097          	auipc	ra,0xffffe
    80004854:	f44080e7          	jalr	-188(ra) # 80002794 <_Znwm>
    80004858:	00050993          	mv	s3,a0
    8000485c:	01400593          	li	a1,20
    80004860:	fffff097          	auipc	ra,0xfffff
    80004864:	05c080e7          	jalr	92(ra) # 800038bc <_ZN6BufferC1Ei>

    sem_open(&waitForAll, 0);
    80004868:	00000593          	li	a1,0
    8000486c:	00005517          	auipc	a0,0x5
    80004870:	61c50513          	addi	a0,a0,1564 # 80009e88 <waitForAll>
    80004874:	ffffe097          	auipc	ra,0xffffe
    80004878:	d4c080e7          	jalr	-692(ra) # 800025c0 <_Z8sem_openPP4_semj>

    thread_t threads[threadNum];
    thread_t consumerThread;

    struct thread_data data[threadNum + 1];
    8000487c:	ef010113          	addi	sp,sp,-272
    80004880:	00010913          	mv	s2,sp

    data[threadNum].id = threadNum;
    80004884:	00a00793          	li	a5,10
    80004888:	0ef92823          	sw	a5,240(s2)
    data[threadNum].buffer = buffer;
    8000488c:	0f393c23          	sd	s3,248(s2)
    data[threadNum].wait = waitForAll;
    80004890:	00005797          	auipc	a5,0x5
    80004894:	5f87b783          	ld	a5,1528(a5) # 80009e88 <waitForAll>
    80004898:	10f93023          	sd	a5,256(s2)
    thread_create(&consumerThread, consumer, data + threadNum);
    8000489c:	0f090613          	addi	a2,s2,240
    800048a0:	fffff597          	auipc	a1,0xfffff
    800048a4:	4d458593          	addi	a1,a1,1236 # 80003d74 <_Z8consumerPv>
    800048a8:	fc840513          	addi	a0,s0,-56
    800048ac:	ffffe097          	auipc	ra,0xffffe
    800048b0:	c30080e7          	jalr	-976(ra) # 800024dc <_Z13thread_createPP7_threadPFvPvES2_>

    for (int i = 0; i < threadNum; i++) {
    800048b4:	00000493          	li	s1,0
    800048b8:	00900793          	li	a5,9
    800048bc:	0697c863          	blt	a5,s1,8000492c <_Z22producerConsumer_C_APIv+0x154>
        data[i].id = i;
    800048c0:	00149793          	slli	a5,s1,0x1
    800048c4:	009787b3          	add	a5,a5,s1
    800048c8:	00379793          	slli	a5,a5,0x3
    800048cc:	00f907b3          	add	a5,s2,a5
    800048d0:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    800048d4:	0137b423          	sd	s3,8(a5)
        data[i].wait = waitForAll;
    800048d8:	00005717          	auipc	a4,0x5
    800048dc:	5b073703          	ld	a4,1456(a4) # 80009e88 <waitForAll>
    800048e0:	00e7b823          	sd	a4,16(a5)

        thread_create(threads + i,
    800048e4:	00048713          	mv	a4,s1
    800048e8:	00349513          	slli	a0,s1,0x3
    800048ec:	f7840793          	addi	a5,s0,-136
    800048f0:	00a78533          	add	a0,a5,a0
    800048f4:	02905663          	blez	s1,80004920 <_Z22producerConsumer_C_APIv+0x148>
    800048f8:	fffff597          	auipc	a1,0xfffff
    800048fc:	3e858593          	addi	a1,a1,1000 # 80003ce0 <_Z8producerPv>
                      i > 0 ? producer : producerKeyboard,
                      data + i);
    80004900:	00171613          	slli	a2,a4,0x1
    80004904:	00e60633          	add	a2,a2,a4
    80004908:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    8000490c:	00c90633          	add	a2,s2,a2
    80004910:	ffffe097          	auipc	ra,0xffffe
    80004914:	bcc080e7          	jalr	-1076(ra) # 800024dc <_Z13thread_createPP7_threadPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80004918:	0014849b          	addiw	s1,s1,1
    8000491c:	f9dff06f          	j	800048b8 <_Z22producerConsumer_C_APIv+0xe0>
        thread_create(threads + i,
    80004920:	fffff597          	auipc	a1,0xfffff
    80004924:	30058593          	addi	a1,a1,768 # 80003c20 <_Z16producerKeyboardPv>
    80004928:	fd9ff06f          	j	80004900 <_Z22producerConsumer_C_APIv+0x128>
    }

    thread_dispatch();
    8000492c:	ffffe097          	auipc	ra,0xffffe
    80004930:	c64080e7          	jalr	-924(ra) # 80002590 <_Z15thread_dispatchv>

    for (int i = 0; i <= threadNum; i++) {
    80004934:	00000493          	li	s1,0
    80004938:	0180006f          	j	80004950 <_Z22producerConsumer_C_APIv+0x178>
        sem_wait(waitForAll);
    8000493c:	00005517          	auipc	a0,0x5
    80004940:	54c53503          	ld	a0,1356(a0) # 80009e88 <waitForAll>
    80004944:	ffffe097          	auipc	ra,0xffffe
    80004948:	d50080e7          	jalr	-688(ra) # 80002694 <_Z8sem_waitP4_sem>
    for (int i = 0; i <= threadNum; i++) {
    8000494c:	0014849b          	addiw	s1,s1,1
    80004950:	00a00793          	li	a5,10
    80004954:	fe97d4e3          	bge	a5,s1,8000493c <_Z22producerConsumer_C_APIv+0x164>
    }

    sem_close(waitForAll);
    80004958:	00005517          	auipc	a0,0x5
    8000495c:	53053503          	ld	a0,1328(a0) # 80009e88 <waitForAll>
    80004960:	ffffe097          	auipc	ra,0xffffe
    80004964:	cd8080e7          	jalr	-808(ra) # 80002638 <_Z9sem_closeP4_sem>
}
    80004968:	f7040113          	addi	sp,s0,-144
    8000496c:	08813083          	ld	ra,136(sp)
    80004970:	08013403          	ld	s0,128(sp)
    80004974:	07813483          	ld	s1,120(sp)
    80004978:	07013903          	ld	s2,112(sp)
    8000497c:	06813983          	ld	s3,104(sp)
    80004980:	09010113          	addi	sp,sp,144
    80004984:	00008067          	ret
    80004988:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    8000498c:	00098513          	mv	a0,s3
    80004990:	ffffe097          	auipc	ra,0xffffe
    80004994:	e54080e7          	jalr	-428(ra) # 800027e4 <_ZdlPv>
    80004998:	00048513          	mv	a0,s1
    8000499c:	00006097          	auipc	ra,0x6
    800049a0:	5bc080e7          	jalr	1468(ra) # 8000af58 <_Unwind_Resume>

00000000800049a4 <_Z12testSleepingv>:

void testSleeping() {
    800049a4:	fc010113          	addi	sp,sp,-64
    800049a8:	02113c23          	sd	ra,56(sp)
    800049ac:	02813823          	sd	s0,48(sp)
    800049b0:	02913423          	sd	s1,40(sp)
    800049b4:	04010413          	addi	s0,sp,64
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    800049b8:	00a00793          	li	a5,10
    800049bc:	fcf43823          	sd	a5,-48(s0)
    800049c0:	01400793          	li	a5,20
    800049c4:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    for (int i = 0; i < sleepy_thread_count; i++) {
    800049c8:	00000493          	li	s1,0
    800049cc:	02c0006f          	j	800049f8 <_Z12testSleepingv+0x54>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    800049d0:	00349793          	slli	a5,s1,0x3
    800049d4:	fd040613          	addi	a2,s0,-48
    800049d8:	00f60633          	add	a2,a2,a5
    800049dc:	fffff597          	auipc	a1,0xfffff
    800049e0:	66c58593          	addi	a1,a1,1644 # 80004048 <_Z9sleepyRunPv>
    800049e4:	fc040513          	addi	a0,s0,-64
    800049e8:	00f50533          	add	a0,a0,a5
    800049ec:	ffffe097          	auipc	ra,0xffffe
    800049f0:	af0080e7          	jalr	-1296(ra) # 800024dc <_Z13thread_createPP7_threadPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    800049f4:	0014849b          	addiw	s1,s1,1
    800049f8:	00100793          	li	a5,1
    800049fc:	fc97dae3          	bge	a5,s1,800049d0 <_Z12testSleepingv+0x2c>
    }

    while (!(finished[0] && finished[1])) {}
    80004a00:	00005797          	auipc	a5,0x5
    80004a04:	4807c783          	lbu	a5,1152(a5) # 80009e80 <finished>
    80004a08:	fe078ce3          	beqz	a5,80004a00 <_Z12testSleepingv+0x5c>
    80004a0c:	00005797          	auipc	a5,0x5
    80004a10:	4757c783          	lbu	a5,1141(a5) # 80009e81 <finished+0x1>
    80004a14:	fe0786e3          	beqz	a5,80004a00 <_Z12testSleepingv+0x5c>
}
    80004a18:	03813083          	ld	ra,56(sp)
    80004a1c:	03013403          	ld	s0,48(sp)
    80004a20:	02813483          	ld	s1,40(sp)
    80004a24:	04010113          	addi	sp,sp,64
    80004a28:	00008067          	ret

0000000080004a2c <_Z3fibm>:
uint64 fib(uint64 n) {
    80004a2c:	fe010113          	addi	sp,sp,-32
    80004a30:	00113c23          	sd	ra,24(sp)
    80004a34:	00813823          	sd	s0,16(sp)
    80004a38:	00913423          	sd	s1,8(sp)
    80004a3c:	01213023          	sd	s2,0(sp)
    80004a40:	02010413          	addi	s0,sp,32
    80004a44:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) return n;
    80004a48:	00100793          	li	a5,1
    80004a4c:	02a7f663          	bgeu	a5,a0,80004a78 <_Z3fibm+0x4c>
    if (n % 4 == 0) {
    80004a50:	00357793          	andi	a5,a0,3
    80004a54:	02078e63          	beqz	a5,80004a90 <_Z3fibm+0x64>
    return fibonacci(n-1) + fibonacci(n-2);
    80004a58:	fff48513          	addi	a0,s1,-1
    80004a5c:	00000097          	auipc	ra,0x0
    80004a60:	914080e7          	jalr	-1772(ra) # 80004370 <_Z9fibonaccim>
    80004a64:	00050913          	mv	s2,a0
    80004a68:	ffe48513          	addi	a0,s1,-2
    80004a6c:	00000097          	auipc	ra,0x0
    80004a70:	904080e7          	jalr	-1788(ra) # 80004370 <_Z9fibonaccim>
    80004a74:	00a90533          	add	a0,s2,a0
}
    80004a78:	01813083          	ld	ra,24(sp)
    80004a7c:	01013403          	ld	s0,16(sp)
    80004a80:	00813483          	ld	s1,8(sp)
    80004a84:	00013903          	ld	s2,0(sp)
    80004a88:	02010113          	addi	sp,sp,32
    80004a8c:	00008067          	ret
        thread_dispatch();
    80004a90:	ffffe097          	auipc	ra,0xffffe
    80004a94:	b00080e7          	jalr	-1280(ra) # 80002590 <_Z15thread_dispatchv>
    80004a98:	fc1ff06f          	j	80004a58 <_Z3fibm+0x2c>

0000000080004a9c <_Z11workerBodyGPv>:

void workerBodyG(void *) {
    80004a9c:	fe010113          	addi	sp,sp,-32
    80004aa0:	00113c23          	sd	ra,24(sp)
    80004aa4:	00813823          	sd	s0,16(sp)
    80004aa8:	00913423          	sd	s1,8(sp)
    80004aac:	01213023          	sd	s2,0(sp)
    80004ab0:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80004ab4:	00000493          	li	s1,0
    80004ab8:	0400006f          	j	80004af8 <_Z11workerBodyGPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i=");
    80004abc:	00003517          	auipc	a0,0x3
    80004ac0:	7b450513          	addi	a0,a0,1972 # 80008270 <_ZZ14kprintUnsignedmE6digits+0x80>
    80004ac4:	fffff097          	auipc	ra,0xfffff
    80004ac8:	368080e7          	jalr	872(ra) # 80003e2c <_Z11printStringPKc>
        printInt(i);
    80004acc:	00000613          	li	a2,0
    80004ad0:	00a00593          	li	a1,10
    80004ad4:	00048513          	mv	a0,s1
    80004ad8:	fffff097          	auipc	ra,0xfffff
    80004adc:	034080e7          	jalr	52(ra) # 80003b0c <_ZL8printIntiii>
        printString("\n");
    80004ae0:	00003517          	auipc	a0,0x3
    80004ae4:	6a850513          	addi	a0,a0,1704 # 80008188 <CONSOLE_STATUS+0x178>
    80004ae8:	fffff097          	auipc	ra,0xfffff
    80004aec:	344080e7          	jalr	836(ra) # 80003e2c <_Z11printStringPKc>
    for (; i < 3; i++) {
    80004af0:	0014849b          	addiw	s1,s1,1
    80004af4:	0ff4f493          	andi	s1,s1,255
    80004af8:	00200793          	li	a5,2
    80004afc:	fc97f0e3          	bgeu	a5,s1,80004abc <_Z11workerBodyGPv+0x20>
    }

    printString("C: yield\n");
    80004b00:	00004517          	auipc	a0,0x4
    80004b04:	88050513          	addi	a0,a0,-1920 # 80008380 <_ZZ14kprintUnsignedmE6digits+0x190>
    80004b08:	fffff097          	auipc	ra,0xfffff
    80004b0c:	324080e7          	jalr	804(ra) # 80003e2c <_Z11printStringPKc>
    __asm__("li t1, 7");
    80004b10:	00700313          	li	t1,7
    thread_dispatch();
    80004b14:	ffffe097          	auipc	ra,0xffffe
    80004b18:	a7c080e7          	jalr	-1412(ra) # 80002590 <_Z15thread_dispatchv>

    uint64  t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80004b1c:	00030913          	mv	s2,t1

    printString("C: t1=");
    80004b20:	00003517          	auipc	a0,0x3
    80004b24:	76850513          	addi	a0,a0,1896 # 80008288 <_ZZ14kprintUnsignedmE6digits+0x98>
    80004b28:	fffff097          	auipc	ra,0xfffff
    80004b2c:	304080e7          	jalr	772(ra) # 80003e2c <_Z11printStringPKc>
    printInt(t1);
    80004b30:	00000613          	li	a2,0
    80004b34:	00a00593          	li	a1,10
    80004b38:	0009051b          	sext.w	a0,s2
    80004b3c:	fffff097          	auipc	ra,0xfffff
    80004b40:	fd0080e7          	jalr	-48(ra) # 80003b0c <_ZL8printIntiii>
    printString("\n");
    80004b44:	00003517          	auipc	a0,0x3
    80004b48:	64450513          	addi	a0,a0,1604 # 80008188 <CONSOLE_STATUS+0x178>
    80004b4c:	fffff097          	auipc	ra,0xfffff
    80004b50:	2e0080e7          	jalr	736(ra) # 80003e2c <_Z11printStringPKc>

    uint64 result = fib(30);
    80004b54:	01e00513          	li	a0,30
    80004b58:	00000097          	auipc	ra,0x0
    80004b5c:	ed4080e7          	jalr	-300(ra) # 80004a2c <_Z3fibm>
    80004b60:	00050913          	mv	s2,a0
    printString("C: fibonacci=");
    80004b64:	00004517          	auipc	a0,0x4
    80004b68:	82c50513          	addi	a0,a0,-2004 # 80008390 <_ZZ14kprintUnsignedmE6digits+0x1a0>
    80004b6c:	fffff097          	auipc	ra,0xfffff
    80004b70:	2c0080e7          	jalr	704(ra) # 80003e2c <_Z11printStringPKc>
    printInt(result);
    80004b74:	00000613          	li	a2,0
    80004b78:	00a00593          	li	a1,10
    80004b7c:	0009051b          	sext.w	a0,s2
    80004b80:	fffff097          	auipc	ra,0xfffff
    80004b84:	f8c080e7          	jalr	-116(ra) # 80003b0c <_ZL8printIntiii>
    printString("\n");
    80004b88:	00003517          	auipc	a0,0x3
    80004b8c:	60050513          	addi	a0,a0,1536 # 80008188 <CONSOLE_STATUS+0x178>
    80004b90:	fffff097          	auipc	ra,0xfffff
    80004b94:	29c080e7          	jalr	668(ra) # 80003e2c <_Z11printStringPKc>
    80004b98:	0400006f          	j	80004bd8 <_Z11workerBodyGPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i=");
    80004b9c:	00003517          	auipc	a0,0x3
    80004ba0:	6d450513          	addi	a0,a0,1748 # 80008270 <_ZZ14kprintUnsignedmE6digits+0x80>
    80004ba4:	fffff097          	auipc	ra,0xfffff
    80004ba8:	288080e7          	jalr	648(ra) # 80003e2c <_Z11printStringPKc>
        printInt(i);
    80004bac:	00000613          	li	a2,0
    80004bb0:	00a00593          	li	a1,10
    80004bb4:	00048513          	mv	a0,s1
    80004bb8:	fffff097          	auipc	ra,0xfffff
    80004bbc:	f54080e7          	jalr	-172(ra) # 80003b0c <_ZL8printIntiii>
        printString("\n");
    80004bc0:	00003517          	auipc	a0,0x3
    80004bc4:	5c850513          	addi	a0,a0,1480 # 80008188 <CONSOLE_STATUS+0x178>
    80004bc8:	fffff097          	auipc	ra,0xfffff
    80004bcc:	264080e7          	jalr	612(ra) # 80003e2c <_Z11printStringPKc>
    for (; i < 6; i++) {
    80004bd0:	0014849b          	addiw	s1,s1,1
    80004bd4:	0ff4f493          	andi	s1,s1,255
    80004bd8:	00500793          	li	a5,5
    80004bdc:	fc97f0e3          	bgeu	a5,s1,80004b9c <_Z11workerBodyGPv+0x100>
    }
    // TCB::yield()
    printString("Worker C finished\n");
    80004be0:	00003517          	auipc	a0,0x3
    80004be4:	7c050513          	addi	a0,a0,1984 # 800083a0 <_ZZ14kprintUnsignedmE6digits+0x1b0>
    80004be8:	fffff097          	auipc	ra,0xfffff
    80004bec:	244080e7          	jalr	580(ra) # 80003e2c <_Z11printStringPKc>
}
    80004bf0:	01813083          	ld	ra,24(sp)
    80004bf4:	01013403          	ld	s0,16(sp)
    80004bf8:	00813483          	ld	s1,8(sp)
    80004bfc:	00013903          	ld	s2,0(sp)
    80004c00:	02010113          	addi	sp,sp,32
    80004c04:	00008067          	ret

0000000080004c08 <_Z11workerBodyHPv>:

void workerBodyH(void *) {
    80004c08:	fe010113          	addi	sp,sp,-32
    80004c0c:	00113c23          	sd	ra,24(sp)
    80004c10:	00813823          	sd	s0,16(sp)
    80004c14:	00913423          	sd	s1,8(sp)
    80004c18:	01213023          	sd	s2,0(sp)
    80004c1c:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80004c20:	00a00493          	li	s1,10
    80004c24:	0400006f          	j	80004c64 <_Z11workerBodyHPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i=");
    80004c28:	00003517          	auipc	a0,0x3
    80004c2c:	68850513          	addi	a0,a0,1672 # 800082b0 <_ZZ14kprintUnsignedmE6digits+0xc0>
    80004c30:	fffff097          	auipc	ra,0xfffff
    80004c34:	1fc080e7          	jalr	508(ra) # 80003e2c <_Z11printStringPKc>
        printInt(i);
    80004c38:	00000613          	li	a2,0
    80004c3c:	00a00593          	li	a1,10
    80004c40:	00048513          	mv	a0,s1
    80004c44:	fffff097          	auipc	ra,0xfffff
    80004c48:	ec8080e7          	jalr	-312(ra) # 80003b0c <_ZL8printIntiii>
        printString("\n");
    80004c4c:	00003517          	auipc	a0,0x3
    80004c50:	53c50513          	addi	a0,a0,1340 # 80008188 <CONSOLE_STATUS+0x178>
    80004c54:	fffff097          	auipc	ra,0xfffff
    80004c58:	1d8080e7          	jalr	472(ra) # 80003e2c <_Z11printStringPKc>
    for (; i < 13; i++) {
    80004c5c:	0014849b          	addiw	s1,s1,1
    80004c60:	0ff4f493          	andi	s1,s1,255
    80004c64:	00c00793          	li	a5,12
    80004c68:	fc97f0e3          	bgeu	a5,s1,80004c28 <_Z11workerBodyHPv+0x20>
    }

    printString("D: yield\n");
    80004c6c:	00003517          	auipc	a0,0x3
    80004c70:	74c50513          	addi	a0,a0,1868 # 800083b8 <_ZZ14kprintUnsignedmE6digits+0x1c8>
    80004c74:	fffff097          	auipc	ra,0xfffff
    80004c78:	1b8080e7          	jalr	440(ra) # 80003e2c <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80004c7c:	00500313          	li	t1,5
    thread_dispatch();
    80004c80:	ffffe097          	auipc	ra,0xffffe
    80004c84:	910080e7          	jalr	-1776(ra) # 80002590 <_Z15thread_dispatchv>

    uint64 result = fib(23);
    80004c88:	01700513          	li	a0,23
    80004c8c:	00000097          	auipc	ra,0x0
    80004c90:	da0080e7          	jalr	-608(ra) # 80004a2c <_Z3fibm>
    80004c94:	00050913          	mv	s2,a0
    printString("D: fibonacci=");
    80004c98:	00003517          	auipc	a0,0x3
    80004c9c:	73050513          	addi	a0,a0,1840 # 800083c8 <_ZZ14kprintUnsignedmE6digits+0x1d8>
    80004ca0:	fffff097          	auipc	ra,0xfffff
    80004ca4:	18c080e7          	jalr	396(ra) # 80003e2c <_Z11printStringPKc>
    printInt(result);
    80004ca8:	00000613          	li	a2,0
    80004cac:	00a00593          	li	a1,10
    80004cb0:	0009051b          	sext.w	a0,s2
    80004cb4:	fffff097          	auipc	ra,0xfffff
    80004cb8:	e58080e7          	jalr	-424(ra) # 80003b0c <_ZL8printIntiii>
    printString("\n");
    80004cbc:	00003517          	auipc	a0,0x3
    80004cc0:	4cc50513          	addi	a0,a0,1228 # 80008188 <CONSOLE_STATUS+0x178>
    80004cc4:	fffff097          	auipc	ra,0xfffff
    80004cc8:	168080e7          	jalr	360(ra) # 80003e2c <_Z11printStringPKc>
    80004ccc:	0400006f          	j	80004d0c <_Z11workerBodyHPv+0x104>

    for (; i < 16; i++) {
        printString("D: i=");
    80004cd0:	00003517          	auipc	a0,0x3
    80004cd4:	5e050513          	addi	a0,a0,1504 # 800082b0 <_ZZ14kprintUnsignedmE6digits+0xc0>
    80004cd8:	fffff097          	auipc	ra,0xfffff
    80004cdc:	154080e7          	jalr	340(ra) # 80003e2c <_Z11printStringPKc>
        printInt(i);
    80004ce0:	00000613          	li	a2,0
    80004ce4:	00a00593          	li	a1,10
    80004ce8:	00048513          	mv	a0,s1
    80004cec:	fffff097          	auipc	ra,0xfffff
    80004cf0:	e20080e7          	jalr	-480(ra) # 80003b0c <_ZL8printIntiii>
        printString("\n");
    80004cf4:	00003517          	auipc	a0,0x3
    80004cf8:	49450513          	addi	a0,a0,1172 # 80008188 <CONSOLE_STATUS+0x178>
    80004cfc:	fffff097          	auipc	ra,0xfffff
    80004d00:	130080e7          	jalr	304(ra) # 80003e2c <_Z11printStringPKc>
    for (; i < 16; i++) {
    80004d04:	0014849b          	addiw	s1,s1,1
    80004d08:	0ff4f493          	andi	s1,s1,255
    80004d0c:	00f00793          	li	a5,15
    80004d10:	fc97f0e3          	bgeu	a5,s1,80004cd0 <_Z11workerBodyHPv+0xc8>
    }
    // TCB::yield()
    printString("Worker D finished\n");
    80004d14:	00003517          	auipc	a0,0x3
    80004d18:	6c450513          	addi	a0,a0,1732 # 800083d8 <_ZZ14kprintUnsignedmE6digits+0x1e8>
    80004d1c:	fffff097          	auipc	ra,0xfffff
    80004d20:	110080e7          	jalr	272(ra) # 80003e2c <_Z11printStringPKc>
}
    80004d24:	01813083          	ld	ra,24(sp)
    80004d28:	01013403          	ld	s0,16(sp)
    80004d2c:	00813483          	ld	s1,8(sp)
    80004d30:	00013903          	ld	s2,0(sp)
    80004d34:	02010113          	addi	sp,sp,32
    80004d38:	00008067          	ret

0000000080004d3c <_Z10myUserMainv>:

void myUserMain() {
    printString("In user main\n");

    void *mem = mem_alloc(25000);
    printInt((uint64) mem);
    80004d3c:	fa010113          	addi	sp,sp,-96
    80004d40:	04113c23          	sd	ra,88(sp)
    80004d44:	04813823          	sd	s0,80(sp)
    80004d48:	04913423          	sd	s1,72(sp)
    80004d4c:	05213023          	sd	s2,64(sp)
    80004d50:	06010413          	addi	s0,sp,96
    printString("\n");
    80004d54:	00003517          	auipc	a0,0x3
    80004d58:	69c50513          	addi	a0,a0,1692 # 800083f0 <_ZZ14kprintUnsignedmE6digits+0x200>
    80004d5c:	fffff097          	auipc	ra,0xfffff
    80004d60:	0d0080e7          	jalr	208(ra) # 80003e2c <_Z11printStringPKc>

    ProducerConsumer *obj = new ProducerConsumer();
    80004d64:	00006537          	lui	a0,0x6
    80004d68:	1a850513          	addi	a0,a0,424 # 61a8 <_entry-0x7fff9e58>
    80004d6c:	ffffd097          	auipc	ra,0xffffd
    80004d70:	70c080e7          	jalr	1804(ra) # 80002478 <_Z9mem_allocm>
    80004d74:	00050913          	mv	s2,a0

    80004d78:	00000613          	li	a2,0
    80004d7c:	00a00593          	li	a1,10
    80004d80:	0005051b          	sext.w	a0,a0
    80004d84:	fffff097          	auipc	ra,0xfffff
    80004d88:	d88080e7          	jalr	-632(ra) # 80003b0c <_ZL8printIntiii>
    thread_t t1;
    80004d8c:	00003517          	auipc	a0,0x3
    80004d90:	3fc50513          	addi	a0,a0,1020 # 80008188 <CONSOLE_STATUS+0x178>
    80004d94:	fffff097          	auipc	ra,0xfffff
    80004d98:	098080e7          	jalr	152(ra) # 80003e2c <_Z11printStringPKc>
    thread_t t2;
    thread_t t3;
    80004d9c:	01800513          	li	a0,24
    80004da0:	ffffe097          	auipc	ra,0xffffe
    80004da4:	9f4080e7          	jalr	-1548(ra) # 80002794 <_Znwm>
    80004da8:	00050493          	mv	s1,a0
#include "../h/syscall_c.h"
#include "printing.hpp"

class ProducerConsumer {
public:
    ProducerConsumer() {
    80004dac:	00052823          	sw	zero,16(a0)
        sem_open(&semConsumer, 0);
    80004db0:	00000593          	li	a1,0
    80004db4:	00850513          	addi	a0,a0,8
    80004db8:	ffffe097          	auipc	ra,0xffffe
    80004dbc:	808080e7          	jalr	-2040(ra) # 800025c0 <_Z8sem_openPP4_semj>
        sem_open(&semProducer, 1);
    80004dc0:	00100593          	li	a1,1
    80004dc4:	00048513          	mv	a0,s1
    80004dc8:	ffffd097          	auipc	ra,0xffffd
    80004dcc:	7f8080e7          	jalr	2040(ra) # 800025c0 <_Z8sem_openPP4_semj>

    thread_create(&t1, &workerBodyE, nullptr);
    thread_create(&t2, &workerBodyF, nullptr);
    thread_create(&t3, &workerBodyG, nullptr);
    thread_create(&t4, &workerBodyH, nullptr);
    thread_create(&t5, &ProducerConsumer::produceWrapper, obj);
    80004dd0:	00000613          	li	a2,0
    80004dd4:	fffff597          	auipc	a1,0xfffff
    80004dd8:	31858593          	addi	a1,a1,792 # 800040ec <_Z11workerBodyEPv>
    80004ddc:	fd840513          	addi	a0,s0,-40
    80004de0:	ffffd097          	auipc	ra,0xffffd
    80004de4:	6fc080e7          	jalr	1788(ra) # 800024dc <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t6, &ProducerConsumer::consumeWrapper, obj);
    80004de8:	00000613          	li	a2,0
    80004dec:	fffff597          	auipc	a1,0xfffff
    80004df0:	3b058593          	addi	a1,a1,944 # 8000419c <_Z11workerBodyFPv>
    80004df4:	fd040513          	addi	a0,s0,-48
    80004df8:	ffffd097          	auipc	ra,0xffffd
    80004dfc:	6e4080e7          	jalr	1764(ra) # 800024dc <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t7, &ProducerConsumer::consumeWrapper, obj);
    80004e00:	00000613          	li	a2,0
    80004e04:	00000597          	auipc	a1,0x0
    80004e08:	c9858593          	addi	a1,a1,-872 # 80004a9c <_Z11workerBodyGPv>
    80004e0c:	fc840513          	addi	a0,s0,-56
    80004e10:	ffffd097          	auipc	ra,0xffffd
    80004e14:	6cc080e7          	jalr	1740(ra) # 800024dc <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t8, &ProducerConsumer::consumeWrapper, obj);
    80004e18:	00000613          	li	a2,0
    80004e1c:	00000597          	auipc	a1,0x0
    80004e20:	dec58593          	addi	a1,a1,-532 # 80004c08 <_Z11workerBodyHPv>
    80004e24:	fc040513          	addi	a0,s0,-64
    80004e28:	ffffd097          	auipc	ra,0xffffd
    80004e2c:	6b4080e7          	jalr	1716(ra) # 800024dc <_Z13thread_createPP7_threadPFvPvES2_>

    80004e30:	00048613          	mv	a2,s1
    80004e34:	00000597          	auipc	a1,0x0
    80004e38:	1ac58593          	addi	a1,a1,428 # 80004fe0 <_ZN16ProducerConsumer14produceWrapperEPv>
    80004e3c:	fb840513          	addi	a0,s0,-72
    80004e40:	ffffd097          	auipc	ra,0xffffd
    80004e44:	69c080e7          	jalr	1692(ra) # 800024dc <_Z13thread_createPP7_threadPFvPvES2_>
    time_sleep(50);
    80004e48:	00048613          	mv	a2,s1
    80004e4c:	00000597          	auipc	a1,0x0
    80004e50:	27858593          	addi	a1,a1,632 # 800050c4 <_ZN16ProducerConsumer14consumeWrapperEPv>
    80004e54:	fb040513          	addi	a0,s0,-80
    80004e58:	ffffd097          	auipc	ra,0xffffd
    80004e5c:	684080e7          	jalr	1668(ra) # 800024dc <_Z13thread_createPP7_threadPFvPvES2_>

    80004e60:	00048613          	mv	a2,s1
    80004e64:	00000597          	auipc	a1,0x0
    80004e68:	26058593          	addi	a1,a1,608 # 800050c4 <_ZN16ProducerConsumer14consumeWrapperEPv>
    80004e6c:	fa840513          	addi	a0,s0,-88
    80004e70:	ffffd097          	auipc	ra,0xffffd
    80004e74:	66c080e7          	jalr	1644(ra) # 800024dc <_Z13thread_createPP7_threadPFvPvES2_>
    printString("Nit t2: ");
    80004e78:	00048613          	mv	a2,s1
    80004e7c:	00000597          	auipc	a1,0x0
    80004e80:	24858593          	addi	a1,a1,584 # 800050c4 <_ZN16ProducerConsumer14consumeWrapperEPv>
    80004e84:	fa040513          	addi	a0,s0,-96
    80004e88:	ffffd097          	auipc	ra,0xffffd
    80004e8c:	654080e7          	jalr	1620(ra) # 800024dc <_Z13thread_createPP7_threadPFvPvES2_>
    printInt((uint64) t2);
    printString("\n");
    80004e90:	03200513          	li	a0,50
    80004e94:	ffffe097          	auipc	ra,0xffffe
    80004e98:	868080e7          	jalr	-1944(ra) # 800026fc <_Z10time_sleepm>

    time_sleep(150);
    80004e9c:	00003517          	auipc	a0,0x3
    80004ea0:	56450513          	addi	a0,a0,1380 # 80008400 <_ZZ14kprintUnsignedmE6digits+0x210>
    80004ea4:	fffff097          	auipc	ra,0xfffff
    80004ea8:	f88080e7          	jalr	-120(ra) # 80003e2c <_Z11printStringPKc>

    80004eac:	00000613          	li	a2,0
    80004eb0:	00a00593          	li	a1,10
    80004eb4:	fd042503          	lw	a0,-48(s0)
    80004eb8:	fffff097          	auipc	ra,0xfffff
    80004ebc:	c54080e7          	jalr	-940(ra) # 80003b0c <_ZL8printIntiii>
    printString("Mem free called with ret value ");
    80004ec0:	00003517          	auipc	a0,0x3
    80004ec4:	2c850513          	addi	a0,a0,712 # 80008188 <CONSOLE_STATUS+0x178>
    80004ec8:	fffff097          	auipc	ra,0xfffff
    80004ecc:	f64080e7          	jalr	-156(ra) # 80003e2c <_Z11printStringPKc>
    printInt(mem_free(mem));
    printString("\n");
    80004ed0:	09600513          	li	a0,150
    80004ed4:	ffffe097          	auipc	ra,0xffffe
    80004ed8:	828080e7          	jalr	-2008(ra) # 800026fc <_Z10time_sleepm>

    printString("Mem free called again with ret value ");
    80004edc:	00003517          	auipc	a0,0x3
    80004ee0:	53450513          	addi	a0,a0,1332 # 80008410 <_ZZ14kprintUnsignedmE6digits+0x220>
    80004ee4:	fffff097          	auipc	ra,0xfffff
    80004ee8:	f48080e7          	jalr	-184(ra) # 80003e2c <_Z11printStringPKc>
    printInt(mem_free(mem), 10, 1);
    80004eec:	00090513          	mv	a0,s2
    80004ef0:	ffffd097          	auipc	ra,0xffffd
    80004ef4:	5b8080e7          	jalr	1464(ra) # 800024a8 <_Z8mem_freePv>
    80004ef8:	00000613          	li	a2,0
    80004efc:	00a00593          	li	a1,10
    80004f00:	fffff097          	auipc	ra,0xfffff
    80004f04:	c0c080e7          	jalr	-1012(ra) # 80003b0c <_ZL8printIntiii>
    printString("\n");
    80004f08:	00003517          	auipc	a0,0x3
    80004f0c:	28050513          	addi	a0,a0,640 # 80008188 <CONSOLE_STATUS+0x178>
    80004f10:	fffff097          	auipc	ra,0xfffff
    80004f14:	f1c080e7          	jalr	-228(ra) # 80003e2c <_Z11printStringPKc>

    delete obj;
    80004f18:	00003517          	auipc	a0,0x3
    80004f1c:	51850513          	addi	a0,a0,1304 # 80008430 <_ZZ14kprintUnsignedmE6digits+0x240>
    80004f20:	fffff097          	auipc	ra,0xfffff
    80004f24:	f0c080e7          	jalr	-244(ra) # 80003e2c <_Z11printStringPKc>

    80004f28:	00090513          	mv	a0,s2
    80004f2c:	ffffd097          	auipc	ra,0xffffd
    80004f30:	57c080e7          	jalr	1404(ra) # 800024a8 <_Z8mem_freePv>
    80004f34:	00100613          	li	a2,1
    80004f38:	00a00593          	li	a1,10
    80004f3c:	fffff097          	auipc	ra,0xfffff
    80004f40:	bd0080e7          	jalr	-1072(ra) # 80003b0c <_ZL8printIntiii>
    printString("User main finished\n");
    80004f44:	00003517          	auipc	a0,0x3
    80004f48:	24450513          	addi	a0,a0,580 # 80008188 <CONSOLE_STATUS+0x178>
    80004f4c:	fffff097          	auipc	ra,0xfffff
    80004f50:	ee0080e7          	jalr	-288(ra) # 80003e2c <_Z11printStringPKc>
}

    80004f54:	00048863          	beqz	s1,80004f64 <_Z10myUserMainv+0x228>
    80004f58:	00048513          	mv	a0,s1
    80004f5c:	ffffe097          	auipc	ra,0xffffe
    80004f60:	888080e7          	jalr	-1912(ra) # 800027e4 <_ZdlPv>
    80004f64:	00003517          	auipc	a0,0x3
    80004f68:	4f450513          	addi	a0,a0,1268 # 80008458 <_ZZ14kprintUnsignedmE6digits+0x268>
    80004f6c:	fffff097          	auipc	ra,0xfffff
    80004f70:	ec0080e7          	jalr	-320(ra) # 80003e2c <_Z11printStringPKc>
    80004f74:	05813083          	ld	ra,88(sp)
    80004f78:	05013403          	ld	s0,80(sp)
    80004f7c:	04813483          	ld	s1,72(sp)
    80004f80:	04013903          	ld	s2,64(sp)
    80004f84:	06010113          	addi	sp,sp,96
    80004f88:	00008067          	ret
    80004f8c:	00050913          	mv	s2,a0
    thread_t t3;
    80004f90:	00048513          	mv	a0,s1
    80004f94:	ffffe097          	auipc	ra,0xffffe
    80004f98:	850080e7          	jalr	-1968(ra) # 800027e4 <_ZdlPv>
    80004f9c:	00090513          	mv	a0,s2
    80004fa0:	00006097          	auipc	ra,0x6
    80004fa4:	fb8080e7          	jalr	-72(ra) # 8000af58 <_Unwind_Resume>

0000000080004fa8 <_Z8userMainv>:
#include "../test/ThreadSleep_C_API_test.hpp" // thread_sleep test C API
//#include "../test/ConsumerProducer_CPP_API_test.hpp" // zadatak 4. CPP API i asinhrona promena konteksta

#include "../test/myUserMain.h" // additional C API tests

void userMain() {
    80004fa8:	ff010113          	addi	sp,sp,-16
    80004fac:	00113423          	sd	ra,8(sp)
    80004fb0:	00813023          	sd	s0,0(sp)
    80004fb4:	01010413          	addi	s0,sp,16
    Threads_C_API_test(); // zadatak 2., niti C API i sinhrona promena konteksta
    80004fb8:	fffff097          	auipc	ra,0xfffff
    80004fbc:	6f4080e7          	jalr	1780(ra) # 800046ac <_Z18Threads_C_API_testv>
    //Threads_CPP_API_test(); // zadatak 2., niti CPP API i sinhrona promena konteksta

//    producerConsumer_C_API(); // zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta
    //producerConsumer_CPP_Sync_API(); // zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta

    testSleeping(); // thread_sleep test C API
    80004fc0:	00000097          	auipc	ra,0x0
    80004fc4:	9e4080e7          	jalr	-1564(ra) # 800049a4 <_Z12testSleepingv>
    //ConsumerProducerCPP::testConsumerProducer(); // zadatak 4. CPP API i asinhrona promena konteksta, kompletan test svega

    myUserMain(); // additional C API tests - Extreme - Testing every functionality
    80004fc8:	00000097          	auipc	ra,0x0
    80004fcc:	d74080e7          	jalr	-652(ra) # 80004d3c <_Z10myUserMainv>

    80004fd0:	00813083          	ld	ra,8(sp)
    80004fd4:	00013403          	ld	s0,0(sp)
    80004fd8:	01010113          	addi	sp,sp,16
    80004fdc:	00008067          	ret

0000000080004fe0 <_ZN16ProducerConsumer14produceWrapperEPv>:
        }

        printString("Consumer finished\n");
    }

    static void produceWrapper(void *obj) {
    80004fe0:	fe010113          	addi	sp,sp,-32
    80004fe4:	00113c23          	sd	ra,24(sp)
    80004fe8:	00813823          	sd	s0,16(sp)
    80004fec:	00913423          	sd	s1,8(sp)
    80004ff0:	01213023          	sd	s2,0(sp)
    80004ff4:	02010413          	addi	s0,sp,32
    80004ff8:	00050493          	mv	s1,a0
        for (int i = 1; i <= 150; i++) {
    80004ffc:	00100913          	li	s2,1
    80005000:	09600793          	li	a5,150
    80005004:	0327c863          	blt	a5,s2,80005034 <_ZN16ProducerConsumer14produceWrapperEPv+0x54>
            sem_wait(semProducer);
    80005008:	0004b503          	ld	a0,0(s1)
    8000500c:	ffffd097          	auipc	ra,0xffffd
    80005010:	688080e7          	jalr	1672(ra) # 80002694 <_Z8sem_waitP4_sem>
            value++;
    80005014:	0104a783          	lw	a5,16(s1)
    80005018:	0017879b          	addiw	a5,a5,1
    8000501c:	00f4a823          	sw	a5,16(s1)
            sem_signal(semConsumer);
    80005020:	0084b503          	ld	a0,8(s1)
    80005024:	ffffd097          	auipc	ra,0xffffd
    80005028:	6a4080e7          	jalr	1700(ra) # 800026c8 <_Z10sem_signalP4_sem>
        for (int i = 1; i <= 150; i++) {
    8000502c:	0019091b          	addiw	s2,s2,1
    80005030:	fd1ff06f          	j	80005000 <_ZN16ProducerConsumer14produceWrapperEPv+0x20>
        int a = sem_close(semProducer);
    80005034:	0004b503          	ld	a0,0(s1)
    80005038:	ffffd097          	auipc	ra,0xffffd
    8000503c:	600080e7          	jalr	1536(ra) # 80002638 <_Z9sem_closeP4_sem>
    80005040:	00050913          	mv	s2,a0
        int b = sem_close(semConsumer);
    80005044:	0084b503          	ld	a0,8(s1)
    80005048:	ffffd097          	auipc	ra,0xffffd
    8000504c:	5f0080e7          	jalr	1520(ra) # 80002638 <_Z9sem_closeP4_sem>
    80005050:	00050493          	mv	s1,a0
        printString("Producer finished with exit values: ");
    80005054:	00003517          	auipc	a0,0x3
    80005058:	41c50513          	addi	a0,a0,1052 # 80008470 <_ZZ14kprintUnsignedmE6digits+0x280>
    8000505c:	fffff097          	auipc	ra,0xfffff
    80005060:	dd0080e7          	jalr	-560(ra) # 80003e2c <_Z11printStringPKc>
        printInt(a);
    80005064:	00000613          	li	a2,0
    80005068:	00a00593          	li	a1,10
    8000506c:	00090513          	mv	a0,s2
    80005070:	fffff097          	auipc	ra,0xfffff
    80005074:	a9c080e7          	jalr	-1380(ra) # 80003b0c <_ZL8printIntiii>
        printString(" and ");
    80005078:	00003517          	auipc	a0,0x3
    8000507c:	42050513          	addi	a0,a0,1056 # 80008498 <_ZZ14kprintUnsignedmE6digits+0x2a8>
    80005080:	fffff097          	auipc	ra,0xfffff
    80005084:	dac080e7          	jalr	-596(ra) # 80003e2c <_Z11printStringPKc>
        printInt(b);
    80005088:	00000613          	li	a2,0
    8000508c:	00a00593          	li	a1,10
    80005090:	00048513          	mv	a0,s1
    80005094:	fffff097          	auipc	ra,0xfffff
    80005098:	a78080e7          	jalr	-1416(ra) # 80003b0c <_ZL8printIntiii>
        printString("\n");
    8000509c:	00003517          	auipc	a0,0x3
    800050a0:	0ec50513          	addi	a0,a0,236 # 80008188 <CONSOLE_STATUS+0x178>
    800050a4:	fffff097          	auipc	ra,0xfffff
    800050a8:	d88080e7          	jalr	-632(ra) # 80003e2c <_Z11printStringPKc>
        ProducerConsumer *pc = (ProducerConsumer *) obj;
        pc->produce();
    }
    800050ac:	01813083          	ld	ra,24(sp)
    800050b0:	01013403          	ld	s0,16(sp)
    800050b4:	00813483          	ld	s1,8(sp)
    800050b8:	00013903          	ld	s2,0(sp)
    800050bc:	02010113          	addi	sp,sp,32
    800050c0:	00008067          	ret

00000000800050c4 <_ZN16ProducerConsumer14consumeWrapperEPv>:

    static void consumeWrapper(void *obj) {
    800050c4:	fe010113          	addi	sp,sp,-32
    800050c8:	00113c23          	sd	ra,24(sp)
    800050cc:	00813823          	sd	s0,16(sp)
    800050d0:	00913423          	sd	s1,8(sp)
    800050d4:	01213023          	sd	s2,0(sp)
    800050d8:	02010413          	addi	s0,sp,32
    800050dc:	00050493          	mv	s1,a0
        for (int i = 1; i <= 50; i++) {
    800050e0:	00100913          	li	s2,1
    800050e4:	03200793          	li	a5,50
    800050e8:	0727c863          	blt	a5,s2,80005158 <_ZN16ProducerConsumer14consumeWrapperEPv+0x94>
            sem_wait(semConsumer);
    800050ec:	0084b503          	ld	a0,8(s1)
    800050f0:	ffffd097          	auipc	ra,0xffffd
    800050f4:	5a4080e7          	jalr	1444(ra) # 80002694 <_Z8sem_waitP4_sem>
            printInt(value);
    800050f8:	00000613          	li	a2,0
    800050fc:	00a00593          	li	a1,10
    80005100:	0104a503          	lw	a0,16(s1)
    80005104:	fffff097          	auipc	ra,0xfffff
    80005108:	a08080e7          	jalr	-1528(ra) # 80003b0c <_ZL8printIntiii>
            printString(" squared is: ");
    8000510c:	00003517          	auipc	a0,0x3
    80005110:	39450513          	addi	a0,a0,916 # 800084a0 <_ZZ14kprintUnsignedmE6digits+0x2b0>
    80005114:	fffff097          	auipc	ra,0xfffff
    80005118:	d18080e7          	jalr	-744(ra) # 80003e2c <_Z11printStringPKc>
            printInt(value * value);
    8000511c:	0104a503          	lw	a0,16(s1)
    80005120:	00000613          	li	a2,0
    80005124:	00a00593          	li	a1,10
    80005128:	02a5053b          	mulw	a0,a0,a0
    8000512c:	fffff097          	auipc	ra,0xfffff
    80005130:	9e0080e7          	jalr	-1568(ra) # 80003b0c <_ZL8printIntiii>
            printString("\n");
    80005134:	00003517          	auipc	a0,0x3
    80005138:	05450513          	addi	a0,a0,84 # 80008188 <CONSOLE_STATUS+0x178>
    8000513c:	fffff097          	auipc	ra,0xfffff
    80005140:	cf0080e7          	jalr	-784(ra) # 80003e2c <_Z11printStringPKc>
            sem_signal(semProducer);
    80005144:	0004b503          	ld	a0,0(s1)
    80005148:	ffffd097          	auipc	ra,0xffffd
    8000514c:	580080e7          	jalr	1408(ra) # 800026c8 <_Z10sem_signalP4_sem>
        for (int i = 1; i <= 50; i++) {
    80005150:	0019091b          	addiw	s2,s2,1
    80005154:	f91ff06f          	j	800050e4 <_ZN16ProducerConsumer14consumeWrapperEPv+0x20>
        printString("Consumer finished\n");
    80005158:	00003517          	auipc	a0,0x3
    8000515c:	35850513          	addi	a0,a0,856 # 800084b0 <_ZZ14kprintUnsignedmE6digits+0x2c0>
    80005160:	fffff097          	auipc	ra,0xfffff
    80005164:	ccc080e7          	jalr	-820(ra) # 80003e2c <_Z11printStringPKc>
        ProducerConsumer *pc = (ProducerConsumer *) obj;
        pc->consume();
    }
    80005168:	01813083          	ld	ra,24(sp)
    8000516c:	01013403          	ld	s0,16(sp)
    80005170:	00813483          	ld	s1,8(sp)
    80005174:	00013903          	ld	s2,0(sp)
    80005178:	02010113          	addi	sp,sp,32
    8000517c:	00008067          	ret

0000000080005180 <start>:
    80005180:	ff010113          	addi	sp,sp,-16
    80005184:	00813423          	sd	s0,8(sp)
    80005188:	01010413          	addi	s0,sp,16
    8000518c:	300027f3          	csrr	a5,mstatus
    80005190:	ffffe737          	lui	a4,0xffffe
    80005194:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff370f>
    80005198:	00e7f7b3          	and	a5,a5,a4
    8000519c:	00001737          	lui	a4,0x1
    800051a0:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    800051a4:	00e7e7b3          	or	a5,a5,a4
    800051a8:	30079073          	csrw	mstatus,a5
    800051ac:	00000797          	auipc	a5,0x0
    800051b0:	16078793          	addi	a5,a5,352 # 8000530c <system_main>
    800051b4:	34179073          	csrw	mepc,a5
    800051b8:	00000793          	li	a5,0
    800051bc:	18079073          	csrw	satp,a5
    800051c0:	000107b7          	lui	a5,0x10
    800051c4:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    800051c8:	30279073          	csrw	medeleg,a5
    800051cc:	30379073          	csrw	mideleg,a5
    800051d0:	104027f3          	csrr	a5,sie
    800051d4:	2227e793          	ori	a5,a5,546
    800051d8:	10479073          	csrw	sie,a5
    800051dc:	fff00793          	li	a5,-1
    800051e0:	00a7d793          	srli	a5,a5,0xa
    800051e4:	3b079073          	csrw	pmpaddr0,a5
    800051e8:	00f00793          	li	a5,15
    800051ec:	3a079073          	csrw	pmpcfg0,a5
    800051f0:	f14027f3          	csrr	a5,mhartid
    800051f4:	0200c737          	lui	a4,0x200c
    800051f8:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800051fc:	0007869b          	sext.w	a3,a5
    80005200:	00269713          	slli	a4,a3,0x2
    80005204:	000f4637          	lui	a2,0xf4
    80005208:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    8000520c:	00d70733          	add	a4,a4,a3
    80005210:	0037979b          	slliw	a5,a5,0x3
    80005214:	020046b7          	lui	a3,0x2004
    80005218:	00d787b3          	add	a5,a5,a3
    8000521c:	00c585b3          	add	a1,a1,a2
    80005220:	00371693          	slli	a3,a4,0x3
    80005224:	00005717          	auipc	a4,0x5
    80005228:	c6c70713          	addi	a4,a4,-916 # 80009e90 <timer_scratch>
    8000522c:	00b7b023          	sd	a1,0(a5)
    80005230:	00d70733          	add	a4,a4,a3
    80005234:	00f73c23          	sd	a5,24(a4)
    80005238:	02c73023          	sd	a2,32(a4)
    8000523c:	34071073          	csrw	mscratch,a4
    80005240:	00000797          	auipc	a5,0x0
    80005244:	6e078793          	addi	a5,a5,1760 # 80005920 <timervec>
    80005248:	30579073          	csrw	mtvec,a5
    8000524c:	300027f3          	csrr	a5,mstatus
    80005250:	0087e793          	ori	a5,a5,8
    80005254:	30079073          	csrw	mstatus,a5
    80005258:	304027f3          	csrr	a5,mie
    8000525c:	0807e793          	ori	a5,a5,128
    80005260:	30479073          	csrw	mie,a5
    80005264:	f14027f3          	csrr	a5,mhartid
    80005268:	0007879b          	sext.w	a5,a5
    8000526c:	00078213          	mv	tp,a5
    80005270:	30200073          	mret
    80005274:	00813403          	ld	s0,8(sp)
    80005278:	01010113          	addi	sp,sp,16
    8000527c:	00008067          	ret

0000000080005280 <timerinit>:
    80005280:	ff010113          	addi	sp,sp,-16
    80005284:	00813423          	sd	s0,8(sp)
    80005288:	01010413          	addi	s0,sp,16
    8000528c:	f14027f3          	csrr	a5,mhartid
    80005290:	0200c737          	lui	a4,0x200c
    80005294:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80005298:	0007869b          	sext.w	a3,a5
    8000529c:	00269713          	slli	a4,a3,0x2
    800052a0:	000f4637          	lui	a2,0xf4
    800052a4:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800052a8:	00d70733          	add	a4,a4,a3
    800052ac:	0037979b          	slliw	a5,a5,0x3
    800052b0:	020046b7          	lui	a3,0x2004
    800052b4:	00d787b3          	add	a5,a5,a3
    800052b8:	00c585b3          	add	a1,a1,a2
    800052bc:	00371693          	slli	a3,a4,0x3
    800052c0:	00005717          	auipc	a4,0x5
    800052c4:	bd070713          	addi	a4,a4,-1072 # 80009e90 <timer_scratch>
    800052c8:	00b7b023          	sd	a1,0(a5)
    800052cc:	00d70733          	add	a4,a4,a3
    800052d0:	00f73c23          	sd	a5,24(a4)
    800052d4:	02c73023          	sd	a2,32(a4)
    800052d8:	34071073          	csrw	mscratch,a4
    800052dc:	00000797          	auipc	a5,0x0
    800052e0:	64478793          	addi	a5,a5,1604 # 80005920 <timervec>
    800052e4:	30579073          	csrw	mtvec,a5
    800052e8:	300027f3          	csrr	a5,mstatus
    800052ec:	0087e793          	ori	a5,a5,8
    800052f0:	30079073          	csrw	mstatus,a5
    800052f4:	304027f3          	csrr	a5,mie
    800052f8:	0807e793          	ori	a5,a5,128
    800052fc:	30479073          	csrw	mie,a5
    80005300:	00813403          	ld	s0,8(sp)
    80005304:	01010113          	addi	sp,sp,16
    80005308:	00008067          	ret

000000008000530c <system_main>:
    8000530c:	fe010113          	addi	sp,sp,-32
    80005310:	00813823          	sd	s0,16(sp)
    80005314:	00913423          	sd	s1,8(sp)
    80005318:	00113c23          	sd	ra,24(sp)
    8000531c:	02010413          	addi	s0,sp,32
    80005320:	00000097          	auipc	ra,0x0
    80005324:	0c4080e7          	jalr	196(ra) # 800053e4 <cpuid>
    80005328:	00005497          	auipc	s1,0x5
    8000532c:	ad848493          	addi	s1,s1,-1320 # 80009e00 <started>
    80005330:	02050263          	beqz	a0,80005354 <system_main+0x48>
    80005334:	0004a783          	lw	a5,0(s1)
    80005338:	0007879b          	sext.w	a5,a5
    8000533c:	fe078ce3          	beqz	a5,80005334 <system_main+0x28>
    80005340:	0ff0000f          	fence
    80005344:	00003517          	auipc	a0,0x3
    80005348:	1cc50513          	addi	a0,a0,460 # 80008510 <_ZL6digits+0x48>
    8000534c:	00001097          	auipc	ra,0x1
    80005350:	a70080e7          	jalr	-1424(ra) # 80005dbc <panic>
    80005354:	00001097          	auipc	ra,0x1
    80005358:	9c4080e7          	jalr	-1596(ra) # 80005d18 <consoleinit>
    8000535c:	00001097          	auipc	ra,0x1
    80005360:	150080e7          	jalr	336(ra) # 800064ac <printfinit>
    80005364:	00003517          	auipc	a0,0x3
    80005368:	e2450513          	addi	a0,a0,-476 # 80008188 <CONSOLE_STATUS+0x178>
    8000536c:	00001097          	auipc	ra,0x1
    80005370:	aac080e7          	jalr	-1364(ra) # 80005e18 <__printf>
    80005374:	00003517          	auipc	a0,0x3
    80005378:	16c50513          	addi	a0,a0,364 # 800084e0 <_ZL6digits+0x18>
    8000537c:	00001097          	auipc	ra,0x1
    80005380:	a9c080e7          	jalr	-1380(ra) # 80005e18 <__printf>
    80005384:	00003517          	auipc	a0,0x3
    80005388:	e0450513          	addi	a0,a0,-508 # 80008188 <CONSOLE_STATUS+0x178>
    8000538c:	00001097          	auipc	ra,0x1
    80005390:	a8c080e7          	jalr	-1396(ra) # 80005e18 <__printf>
    80005394:	00001097          	auipc	ra,0x1
    80005398:	4a4080e7          	jalr	1188(ra) # 80006838 <kinit>
    8000539c:	00000097          	auipc	ra,0x0
    800053a0:	148080e7          	jalr	328(ra) # 800054e4 <trapinit>
    800053a4:	00000097          	auipc	ra,0x0
    800053a8:	16c080e7          	jalr	364(ra) # 80005510 <trapinithart>
    800053ac:	00000097          	auipc	ra,0x0
    800053b0:	5b4080e7          	jalr	1460(ra) # 80005960 <plicinit>
    800053b4:	00000097          	auipc	ra,0x0
    800053b8:	5d4080e7          	jalr	1492(ra) # 80005988 <plicinithart>
    800053bc:	00000097          	auipc	ra,0x0
    800053c0:	078080e7          	jalr	120(ra) # 80005434 <userinit>
    800053c4:	0ff0000f          	fence
    800053c8:	00100793          	li	a5,1
    800053cc:	00003517          	auipc	a0,0x3
    800053d0:	12c50513          	addi	a0,a0,300 # 800084f8 <_ZL6digits+0x30>
    800053d4:	00f4a023          	sw	a5,0(s1)
    800053d8:	00001097          	auipc	ra,0x1
    800053dc:	a40080e7          	jalr	-1472(ra) # 80005e18 <__printf>
    800053e0:	0000006f          	j	800053e0 <system_main+0xd4>

00000000800053e4 <cpuid>:
    800053e4:	ff010113          	addi	sp,sp,-16
    800053e8:	00813423          	sd	s0,8(sp)
    800053ec:	01010413          	addi	s0,sp,16
    800053f0:	00020513          	mv	a0,tp
    800053f4:	00813403          	ld	s0,8(sp)
    800053f8:	0005051b          	sext.w	a0,a0
    800053fc:	01010113          	addi	sp,sp,16
    80005400:	00008067          	ret

0000000080005404 <mycpu>:
    80005404:	ff010113          	addi	sp,sp,-16
    80005408:	00813423          	sd	s0,8(sp)
    8000540c:	01010413          	addi	s0,sp,16
    80005410:	00020793          	mv	a5,tp
    80005414:	00813403          	ld	s0,8(sp)
    80005418:	0007879b          	sext.w	a5,a5
    8000541c:	00779793          	slli	a5,a5,0x7
    80005420:	00006517          	auipc	a0,0x6
    80005424:	aa050513          	addi	a0,a0,-1376 # 8000aec0 <cpus>
    80005428:	00f50533          	add	a0,a0,a5
    8000542c:	01010113          	addi	sp,sp,16
    80005430:	00008067          	ret

0000000080005434 <userinit>:
    80005434:	ff010113          	addi	sp,sp,-16
    80005438:	00813423          	sd	s0,8(sp)
    8000543c:	01010413          	addi	s0,sp,16
    80005440:	00813403          	ld	s0,8(sp)
    80005444:	01010113          	addi	sp,sp,16
    80005448:	ffffc317          	auipc	t1,0xffffc
    8000544c:	56430067          	jr	1380(t1) # 800019ac <main>

0000000080005450 <either_copyout>:
    80005450:	ff010113          	addi	sp,sp,-16
    80005454:	00813023          	sd	s0,0(sp)
    80005458:	00113423          	sd	ra,8(sp)
    8000545c:	01010413          	addi	s0,sp,16
    80005460:	02051663          	bnez	a0,8000548c <either_copyout+0x3c>
    80005464:	00058513          	mv	a0,a1
    80005468:	00060593          	mv	a1,a2
    8000546c:	0006861b          	sext.w	a2,a3
    80005470:	00002097          	auipc	ra,0x2
    80005474:	c54080e7          	jalr	-940(ra) # 800070c4 <__memmove>
    80005478:	00813083          	ld	ra,8(sp)
    8000547c:	00013403          	ld	s0,0(sp)
    80005480:	00000513          	li	a0,0
    80005484:	01010113          	addi	sp,sp,16
    80005488:	00008067          	ret
    8000548c:	00003517          	auipc	a0,0x3
    80005490:	0ac50513          	addi	a0,a0,172 # 80008538 <_ZL6digits+0x70>
    80005494:	00001097          	auipc	ra,0x1
    80005498:	928080e7          	jalr	-1752(ra) # 80005dbc <panic>

000000008000549c <either_copyin>:
    8000549c:	ff010113          	addi	sp,sp,-16
    800054a0:	00813023          	sd	s0,0(sp)
    800054a4:	00113423          	sd	ra,8(sp)
    800054a8:	01010413          	addi	s0,sp,16
    800054ac:	02059463          	bnez	a1,800054d4 <either_copyin+0x38>
    800054b0:	00060593          	mv	a1,a2
    800054b4:	0006861b          	sext.w	a2,a3
    800054b8:	00002097          	auipc	ra,0x2
    800054bc:	c0c080e7          	jalr	-1012(ra) # 800070c4 <__memmove>
    800054c0:	00813083          	ld	ra,8(sp)
    800054c4:	00013403          	ld	s0,0(sp)
    800054c8:	00000513          	li	a0,0
    800054cc:	01010113          	addi	sp,sp,16
    800054d0:	00008067          	ret
    800054d4:	00003517          	auipc	a0,0x3
    800054d8:	08c50513          	addi	a0,a0,140 # 80008560 <_ZL6digits+0x98>
    800054dc:	00001097          	auipc	ra,0x1
    800054e0:	8e0080e7          	jalr	-1824(ra) # 80005dbc <panic>

00000000800054e4 <trapinit>:
    800054e4:	ff010113          	addi	sp,sp,-16
    800054e8:	00813423          	sd	s0,8(sp)
    800054ec:	01010413          	addi	s0,sp,16
    800054f0:	00813403          	ld	s0,8(sp)
    800054f4:	00003597          	auipc	a1,0x3
    800054f8:	09458593          	addi	a1,a1,148 # 80008588 <_ZL6digits+0xc0>
    800054fc:	00006517          	auipc	a0,0x6
    80005500:	a4450513          	addi	a0,a0,-1468 # 8000af40 <tickslock>
    80005504:	01010113          	addi	sp,sp,16
    80005508:	00001317          	auipc	t1,0x1
    8000550c:	5c030067          	jr	1472(t1) # 80006ac8 <initlock>

0000000080005510 <trapinithart>:
    80005510:	ff010113          	addi	sp,sp,-16
    80005514:	00813423          	sd	s0,8(sp)
    80005518:	01010413          	addi	s0,sp,16
    8000551c:	00000797          	auipc	a5,0x0
    80005520:	2f478793          	addi	a5,a5,756 # 80005810 <kernelvec>
    80005524:	10579073          	csrw	stvec,a5
    80005528:	00813403          	ld	s0,8(sp)
    8000552c:	01010113          	addi	sp,sp,16
    80005530:	00008067          	ret

0000000080005534 <usertrap>:
    80005534:	ff010113          	addi	sp,sp,-16
    80005538:	00813423          	sd	s0,8(sp)
    8000553c:	01010413          	addi	s0,sp,16
    80005540:	00813403          	ld	s0,8(sp)
    80005544:	01010113          	addi	sp,sp,16
    80005548:	00008067          	ret

000000008000554c <usertrapret>:
    8000554c:	ff010113          	addi	sp,sp,-16
    80005550:	00813423          	sd	s0,8(sp)
    80005554:	01010413          	addi	s0,sp,16
    80005558:	00813403          	ld	s0,8(sp)
    8000555c:	01010113          	addi	sp,sp,16
    80005560:	00008067          	ret

0000000080005564 <kerneltrap>:
    80005564:	fe010113          	addi	sp,sp,-32
    80005568:	00813823          	sd	s0,16(sp)
    8000556c:	00113c23          	sd	ra,24(sp)
    80005570:	00913423          	sd	s1,8(sp)
    80005574:	02010413          	addi	s0,sp,32
    80005578:	142025f3          	csrr	a1,scause
    8000557c:	100027f3          	csrr	a5,sstatus
    80005580:	0027f793          	andi	a5,a5,2
    80005584:	10079c63          	bnez	a5,8000569c <kerneltrap+0x138>
    80005588:	142027f3          	csrr	a5,scause
    8000558c:	0207ce63          	bltz	a5,800055c8 <kerneltrap+0x64>
    80005590:	00003517          	auipc	a0,0x3
    80005594:	04050513          	addi	a0,a0,64 # 800085d0 <_ZL6digits+0x108>
    80005598:	00001097          	auipc	ra,0x1
    8000559c:	880080e7          	jalr	-1920(ra) # 80005e18 <__printf>
    800055a0:	141025f3          	csrr	a1,sepc
    800055a4:	14302673          	csrr	a2,stval
    800055a8:	00003517          	auipc	a0,0x3
    800055ac:	03850513          	addi	a0,a0,56 # 800085e0 <_ZL6digits+0x118>
    800055b0:	00001097          	auipc	ra,0x1
    800055b4:	868080e7          	jalr	-1944(ra) # 80005e18 <__printf>
    800055b8:	00003517          	auipc	a0,0x3
    800055bc:	04050513          	addi	a0,a0,64 # 800085f8 <_ZL6digits+0x130>
    800055c0:	00000097          	auipc	ra,0x0
    800055c4:	7fc080e7          	jalr	2044(ra) # 80005dbc <panic>
    800055c8:	0ff7f713          	andi	a4,a5,255
    800055cc:	00900693          	li	a3,9
    800055d0:	04d70063          	beq	a4,a3,80005610 <kerneltrap+0xac>
    800055d4:	fff00713          	li	a4,-1
    800055d8:	03f71713          	slli	a4,a4,0x3f
    800055dc:	00170713          	addi	a4,a4,1
    800055e0:	fae798e3          	bne	a5,a4,80005590 <kerneltrap+0x2c>
    800055e4:	00000097          	auipc	ra,0x0
    800055e8:	e00080e7          	jalr	-512(ra) # 800053e4 <cpuid>
    800055ec:	06050663          	beqz	a0,80005658 <kerneltrap+0xf4>
    800055f0:	144027f3          	csrr	a5,sip
    800055f4:	ffd7f793          	andi	a5,a5,-3
    800055f8:	14479073          	csrw	sip,a5
    800055fc:	01813083          	ld	ra,24(sp)
    80005600:	01013403          	ld	s0,16(sp)
    80005604:	00813483          	ld	s1,8(sp)
    80005608:	02010113          	addi	sp,sp,32
    8000560c:	00008067          	ret
    80005610:	00000097          	auipc	ra,0x0
    80005614:	3c4080e7          	jalr	964(ra) # 800059d4 <plic_claim>
    80005618:	00a00793          	li	a5,10
    8000561c:	00050493          	mv	s1,a0
    80005620:	06f50863          	beq	a0,a5,80005690 <kerneltrap+0x12c>
    80005624:	fc050ce3          	beqz	a0,800055fc <kerneltrap+0x98>
    80005628:	00050593          	mv	a1,a0
    8000562c:	00003517          	auipc	a0,0x3
    80005630:	f8450513          	addi	a0,a0,-124 # 800085b0 <_ZL6digits+0xe8>
    80005634:	00000097          	auipc	ra,0x0
    80005638:	7e4080e7          	jalr	2020(ra) # 80005e18 <__printf>
    8000563c:	01013403          	ld	s0,16(sp)
    80005640:	01813083          	ld	ra,24(sp)
    80005644:	00048513          	mv	a0,s1
    80005648:	00813483          	ld	s1,8(sp)
    8000564c:	02010113          	addi	sp,sp,32
    80005650:	00000317          	auipc	t1,0x0
    80005654:	3bc30067          	jr	956(t1) # 80005a0c <plic_complete>
    80005658:	00006517          	auipc	a0,0x6
    8000565c:	8e850513          	addi	a0,a0,-1816 # 8000af40 <tickslock>
    80005660:	00001097          	auipc	ra,0x1
    80005664:	48c080e7          	jalr	1164(ra) # 80006aec <acquire>
    80005668:	00004717          	auipc	a4,0x4
    8000566c:	79c70713          	addi	a4,a4,1948 # 80009e04 <ticks>
    80005670:	00072783          	lw	a5,0(a4)
    80005674:	00006517          	auipc	a0,0x6
    80005678:	8cc50513          	addi	a0,a0,-1844 # 8000af40 <tickslock>
    8000567c:	0017879b          	addiw	a5,a5,1
    80005680:	00f72023          	sw	a5,0(a4)
    80005684:	00001097          	auipc	ra,0x1
    80005688:	534080e7          	jalr	1332(ra) # 80006bb8 <release>
    8000568c:	f65ff06f          	j	800055f0 <kerneltrap+0x8c>
    80005690:	00001097          	auipc	ra,0x1
    80005694:	090080e7          	jalr	144(ra) # 80006720 <uartintr>
    80005698:	fa5ff06f          	j	8000563c <kerneltrap+0xd8>
    8000569c:	00003517          	auipc	a0,0x3
    800056a0:	ef450513          	addi	a0,a0,-268 # 80008590 <_ZL6digits+0xc8>
    800056a4:	00000097          	auipc	ra,0x0
    800056a8:	718080e7          	jalr	1816(ra) # 80005dbc <panic>

00000000800056ac <clockintr>:
    800056ac:	fe010113          	addi	sp,sp,-32
    800056b0:	00813823          	sd	s0,16(sp)
    800056b4:	00913423          	sd	s1,8(sp)
    800056b8:	00113c23          	sd	ra,24(sp)
    800056bc:	02010413          	addi	s0,sp,32
    800056c0:	00006497          	auipc	s1,0x6
    800056c4:	88048493          	addi	s1,s1,-1920 # 8000af40 <tickslock>
    800056c8:	00048513          	mv	a0,s1
    800056cc:	00001097          	auipc	ra,0x1
    800056d0:	420080e7          	jalr	1056(ra) # 80006aec <acquire>
    800056d4:	00004717          	auipc	a4,0x4
    800056d8:	73070713          	addi	a4,a4,1840 # 80009e04 <ticks>
    800056dc:	00072783          	lw	a5,0(a4)
    800056e0:	01013403          	ld	s0,16(sp)
    800056e4:	01813083          	ld	ra,24(sp)
    800056e8:	00048513          	mv	a0,s1
    800056ec:	0017879b          	addiw	a5,a5,1
    800056f0:	00813483          	ld	s1,8(sp)
    800056f4:	00f72023          	sw	a5,0(a4)
    800056f8:	02010113          	addi	sp,sp,32
    800056fc:	00001317          	auipc	t1,0x1
    80005700:	4bc30067          	jr	1212(t1) # 80006bb8 <release>

0000000080005704 <devintr>:
    80005704:	142027f3          	csrr	a5,scause
    80005708:	00000513          	li	a0,0
    8000570c:	0007c463          	bltz	a5,80005714 <devintr+0x10>
    80005710:	00008067          	ret
    80005714:	fe010113          	addi	sp,sp,-32
    80005718:	00813823          	sd	s0,16(sp)
    8000571c:	00113c23          	sd	ra,24(sp)
    80005720:	00913423          	sd	s1,8(sp)
    80005724:	02010413          	addi	s0,sp,32
    80005728:	0ff7f713          	andi	a4,a5,255
    8000572c:	00900693          	li	a3,9
    80005730:	04d70c63          	beq	a4,a3,80005788 <devintr+0x84>
    80005734:	fff00713          	li	a4,-1
    80005738:	03f71713          	slli	a4,a4,0x3f
    8000573c:	00170713          	addi	a4,a4,1
    80005740:	00e78c63          	beq	a5,a4,80005758 <devintr+0x54>
    80005744:	01813083          	ld	ra,24(sp)
    80005748:	01013403          	ld	s0,16(sp)
    8000574c:	00813483          	ld	s1,8(sp)
    80005750:	02010113          	addi	sp,sp,32
    80005754:	00008067          	ret
    80005758:	00000097          	auipc	ra,0x0
    8000575c:	c8c080e7          	jalr	-884(ra) # 800053e4 <cpuid>
    80005760:	06050663          	beqz	a0,800057cc <devintr+0xc8>
    80005764:	144027f3          	csrr	a5,sip
    80005768:	ffd7f793          	andi	a5,a5,-3
    8000576c:	14479073          	csrw	sip,a5
    80005770:	01813083          	ld	ra,24(sp)
    80005774:	01013403          	ld	s0,16(sp)
    80005778:	00813483          	ld	s1,8(sp)
    8000577c:	00200513          	li	a0,2
    80005780:	02010113          	addi	sp,sp,32
    80005784:	00008067          	ret
    80005788:	00000097          	auipc	ra,0x0
    8000578c:	24c080e7          	jalr	588(ra) # 800059d4 <plic_claim>
    80005790:	00a00793          	li	a5,10
    80005794:	00050493          	mv	s1,a0
    80005798:	06f50663          	beq	a0,a5,80005804 <devintr+0x100>
    8000579c:	00100513          	li	a0,1
    800057a0:	fa0482e3          	beqz	s1,80005744 <devintr+0x40>
    800057a4:	00048593          	mv	a1,s1
    800057a8:	00003517          	auipc	a0,0x3
    800057ac:	e0850513          	addi	a0,a0,-504 # 800085b0 <_ZL6digits+0xe8>
    800057b0:	00000097          	auipc	ra,0x0
    800057b4:	668080e7          	jalr	1640(ra) # 80005e18 <__printf>
    800057b8:	00048513          	mv	a0,s1
    800057bc:	00000097          	auipc	ra,0x0
    800057c0:	250080e7          	jalr	592(ra) # 80005a0c <plic_complete>
    800057c4:	00100513          	li	a0,1
    800057c8:	f7dff06f          	j	80005744 <devintr+0x40>
    800057cc:	00005517          	auipc	a0,0x5
    800057d0:	77450513          	addi	a0,a0,1908 # 8000af40 <tickslock>
    800057d4:	00001097          	auipc	ra,0x1
    800057d8:	318080e7          	jalr	792(ra) # 80006aec <acquire>
    800057dc:	00004717          	auipc	a4,0x4
    800057e0:	62870713          	addi	a4,a4,1576 # 80009e04 <ticks>
    800057e4:	00072783          	lw	a5,0(a4)
    800057e8:	00005517          	auipc	a0,0x5
    800057ec:	75850513          	addi	a0,a0,1880 # 8000af40 <tickslock>
    800057f0:	0017879b          	addiw	a5,a5,1
    800057f4:	00f72023          	sw	a5,0(a4)
    800057f8:	00001097          	auipc	ra,0x1
    800057fc:	3c0080e7          	jalr	960(ra) # 80006bb8 <release>
    80005800:	f65ff06f          	j	80005764 <devintr+0x60>
    80005804:	00001097          	auipc	ra,0x1
    80005808:	f1c080e7          	jalr	-228(ra) # 80006720 <uartintr>
    8000580c:	fadff06f          	j	800057b8 <devintr+0xb4>

0000000080005810 <kernelvec>:
    80005810:	f0010113          	addi	sp,sp,-256
    80005814:	00113023          	sd	ra,0(sp)
    80005818:	00213423          	sd	sp,8(sp)
    8000581c:	00313823          	sd	gp,16(sp)
    80005820:	00413c23          	sd	tp,24(sp)
    80005824:	02513023          	sd	t0,32(sp)
    80005828:	02613423          	sd	t1,40(sp)
    8000582c:	02713823          	sd	t2,48(sp)
    80005830:	02813c23          	sd	s0,56(sp)
    80005834:	04913023          	sd	s1,64(sp)
    80005838:	04a13423          	sd	a0,72(sp)
    8000583c:	04b13823          	sd	a1,80(sp)
    80005840:	04c13c23          	sd	a2,88(sp)
    80005844:	06d13023          	sd	a3,96(sp)
    80005848:	06e13423          	sd	a4,104(sp)
    8000584c:	06f13823          	sd	a5,112(sp)
    80005850:	07013c23          	sd	a6,120(sp)
    80005854:	09113023          	sd	a7,128(sp)
    80005858:	09213423          	sd	s2,136(sp)
    8000585c:	09313823          	sd	s3,144(sp)
    80005860:	09413c23          	sd	s4,152(sp)
    80005864:	0b513023          	sd	s5,160(sp)
    80005868:	0b613423          	sd	s6,168(sp)
    8000586c:	0b713823          	sd	s7,176(sp)
    80005870:	0b813c23          	sd	s8,184(sp)
    80005874:	0d913023          	sd	s9,192(sp)
    80005878:	0da13423          	sd	s10,200(sp)
    8000587c:	0db13823          	sd	s11,208(sp)
    80005880:	0dc13c23          	sd	t3,216(sp)
    80005884:	0fd13023          	sd	t4,224(sp)
    80005888:	0fe13423          	sd	t5,232(sp)
    8000588c:	0ff13823          	sd	t6,240(sp)
    80005890:	cd5ff0ef          	jal	ra,80005564 <kerneltrap>
    80005894:	00013083          	ld	ra,0(sp)
    80005898:	00813103          	ld	sp,8(sp)
    8000589c:	01013183          	ld	gp,16(sp)
    800058a0:	02013283          	ld	t0,32(sp)
    800058a4:	02813303          	ld	t1,40(sp)
    800058a8:	03013383          	ld	t2,48(sp)
    800058ac:	03813403          	ld	s0,56(sp)
    800058b0:	04013483          	ld	s1,64(sp)
    800058b4:	04813503          	ld	a0,72(sp)
    800058b8:	05013583          	ld	a1,80(sp)
    800058bc:	05813603          	ld	a2,88(sp)
    800058c0:	06013683          	ld	a3,96(sp)
    800058c4:	06813703          	ld	a4,104(sp)
    800058c8:	07013783          	ld	a5,112(sp)
    800058cc:	07813803          	ld	a6,120(sp)
    800058d0:	08013883          	ld	a7,128(sp)
    800058d4:	08813903          	ld	s2,136(sp)
    800058d8:	09013983          	ld	s3,144(sp)
    800058dc:	09813a03          	ld	s4,152(sp)
    800058e0:	0a013a83          	ld	s5,160(sp)
    800058e4:	0a813b03          	ld	s6,168(sp)
    800058e8:	0b013b83          	ld	s7,176(sp)
    800058ec:	0b813c03          	ld	s8,184(sp)
    800058f0:	0c013c83          	ld	s9,192(sp)
    800058f4:	0c813d03          	ld	s10,200(sp)
    800058f8:	0d013d83          	ld	s11,208(sp)
    800058fc:	0d813e03          	ld	t3,216(sp)
    80005900:	0e013e83          	ld	t4,224(sp)
    80005904:	0e813f03          	ld	t5,232(sp)
    80005908:	0f013f83          	ld	t6,240(sp)
    8000590c:	10010113          	addi	sp,sp,256
    80005910:	10200073          	sret
    80005914:	00000013          	nop
    80005918:	00000013          	nop
    8000591c:	00000013          	nop

0000000080005920 <timervec>:
    80005920:	34051573          	csrrw	a0,mscratch,a0
    80005924:	00b53023          	sd	a1,0(a0)
    80005928:	00c53423          	sd	a2,8(a0)
    8000592c:	00d53823          	sd	a3,16(a0)
    80005930:	01853583          	ld	a1,24(a0)
    80005934:	02053603          	ld	a2,32(a0)
    80005938:	0005b683          	ld	a3,0(a1)
    8000593c:	00c686b3          	add	a3,a3,a2
    80005940:	00d5b023          	sd	a3,0(a1)
    80005944:	00200593          	li	a1,2
    80005948:	14459073          	csrw	sip,a1
    8000594c:	01053683          	ld	a3,16(a0)
    80005950:	00853603          	ld	a2,8(a0)
    80005954:	00053583          	ld	a1,0(a0)
    80005958:	34051573          	csrrw	a0,mscratch,a0
    8000595c:	30200073          	mret

0000000080005960 <plicinit>:
    80005960:	ff010113          	addi	sp,sp,-16
    80005964:	00813423          	sd	s0,8(sp)
    80005968:	01010413          	addi	s0,sp,16
    8000596c:	00813403          	ld	s0,8(sp)
    80005970:	0c0007b7          	lui	a5,0xc000
    80005974:	00100713          	li	a4,1
    80005978:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000597c:	00e7a223          	sw	a4,4(a5)
    80005980:	01010113          	addi	sp,sp,16
    80005984:	00008067          	ret

0000000080005988 <plicinithart>:
    80005988:	ff010113          	addi	sp,sp,-16
    8000598c:	00813023          	sd	s0,0(sp)
    80005990:	00113423          	sd	ra,8(sp)
    80005994:	01010413          	addi	s0,sp,16
    80005998:	00000097          	auipc	ra,0x0
    8000599c:	a4c080e7          	jalr	-1460(ra) # 800053e4 <cpuid>
    800059a0:	0085171b          	slliw	a4,a0,0x8
    800059a4:	0c0027b7          	lui	a5,0xc002
    800059a8:	00e787b3          	add	a5,a5,a4
    800059ac:	40200713          	li	a4,1026
    800059b0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    800059b4:	00813083          	ld	ra,8(sp)
    800059b8:	00013403          	ld	s0,0(sp)
    800059bc:	00d5151b          	slliw	a0,a0,0xd
    800059c0:	0c2017b7          	lui	a5,0xc201
    800059c4:	00a78533          	add	a0,a5,a0
    800059c8:	00052023          	sw	zero,0(a0)
    800059cc:	01010113          	addi	sp,sp,16
    800059d0:	00008067          	ret

00000000800059d4 <plic_claim>:
    800059d4:	ff010113          	addi	sp,sp,-16
    800059d8:	00813023          	sd	s0,0(sp)
    800059dc:	00113423          	sd	ra,8(sp)
    800059e0:	01010413          	addi	s0,sp,16
    800059e4:	00000097          	auipc	ra,0x0
    800059e8:	a00080e7          	jalr	-1536(ra) # 800053e4 <cpuid>
    800059ec:	00813083          	ld	ra,8(sp)
    800059f0:	00013403          	ld	s0,0(sp)
    800059f4:	00d5151b          	slliw	a0,a0,0xd
    800059f8:	0c2017b7          	lui	a5,0xc201
    800059fc:	00a78533          	add	a0,a5,a0
    80005a00:	00452503          	lw	a0,4(a0)
    80005a04:	01010113          	addi	sp,sp,16
    80005a08:	00008067          	ret

0000000080005a0c <plic_complete>:
    80005a0c:	fe010113          	addi	sp,sp,-32
    80005a10:	00813823          	sd	s0,16(sp)
    80005a14:	00913423          	sd	s1,8(sp)
    80005a18:	00113c23          	sd	ra,24(sp)
    80005a1c:	02010413          	addi	s0,sp,32
    80005a20:	00050493          	mv	s1,a0
    80005a24:	00000097          	auipc	ra,0x0
    80005a28:	9c0080e7          	jalr	-1600(ra) # 800053e4 <cpuid>
    80005a2c:	01813083          	ld	ra,24(sp)
    80005a30:	01013403          	ld	s0,16(sp)
    80005a34:	00d5179b          	slliw	a5,a0,0xd
    80005a38:	0c201737          	lui	a4,0xc201
    80005a3c:	00f707b3          	add	a5,a4,a5
    80005a40:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80005a44:	00813483          	ld	s1,8(sp)
    80005a48:	02010113          	addi	sp,sp,32
    80005a4c:	00008067          	ret

0000000080005a50 <consolewrite>:
    80005a50:	fb010113          	addi	sp,sp,-80
    80005a54:	04813023          	sd	s0,64(sp)
    80005a58:	04113423          	sd	ra,72(sp)
    80005a5c:	02913c23          	sd	s1,56(sp)
    80005a60:	03213823          	sd	s2,48(sp)
    80005a64:	03313423          	sd	s3,40(sp)
    80005a68:	03413023          	sd	s4,32(sp)
    80005a6c:	01513c23          	sd	s5,24(sp)
    80005a70:	05010413          	addi	s0,sp,80
    80005a74:	06c05c63          	blez	a2,80005aec <consolewrite+0x9c>
    80005a78:	00060993          	mv	s3,a2
    80005a7c:	00050a13          	mv	s4,a0
    80005a80:	00058493          	mv	s1,a1
    80005a84:	00000913          	li	s2,0
    80005a88:	fff00a93          	li	s5,-1
    80005a8c:	01c0006f          	j	80005aa8 <consolewrite+0x58>
    80005a90:	fbf44503          	lbu	a0,-65(s0)
    80005a94:	0019091b          	addiw	s2,s2,1
    80005a98:	00148493          	addi	s1,s1,1
    80005a9c:	00001097          	auipc	ra,0x1
    80005aa0:	a9c080e7          	jalr	-1380(ra) # 80006538 <uartputc>
    80005aa4:	03298063          	beq	s3,s2,80005ac4 <consolewrite+0x74>
    80005aa8:	00048613          	mv	a2,s1
    80005aac:	00100693          	li	a3,1
    80005ab0:	000a0593          	mv	a1,s4
    80005ab4:	fbf40513          	addi	a0,s0,-65
    80005ab8:	00000097          	auipc	ra,0x0
    80005abc:	9e4080e7          	jalr	-1564(ra) # 8000549c <either_copyin>
    80005ac0:	fd5518e3          	bne	a0,s5,80005a90 <consolewrite+0x40>
    80005ac4:	04813083          	ld	ra,72(sp)
    80005ac8:	04013403          	ld	s0,64(sp)
    80005acc:	03813483          	ld	s1,56(sp)
    80005ad0:	02813983          	ld	s3,40(sp)
    80005ad4:	02013a03          	ld	s4,32(sp)
    80005ad8:	01813a83          	ld	s5,24(sp)
    80005adc:	00090513          	mv	a0,s2
    80005ae0:	03013903          	ld	s2,48(sp)
    80005ae4:	05010113          	addi	sp,sp,80
    80005ae8:	00008067          	ret
    80005aec:	00000913          	li	s2,0
    80005af0:	fd5ff06f          	j	80005ac4 <consolewrite+0x74>

0000000080005af4 <consoleread>:
    80005af4:	f9010113          	addi	sp,sp,-112
    80005af8:	06813023          	sd	s0,96(sp)
    80005afc:	04913c23          	sd	s1,88(sp)
    80005b00:	05213823          	sd	s2,80(sp)
    80005b04:	05313423          	sd	s3,72(sp)
    80005b08:	05413023          	sd	s4,64(sp)
    80005b0c:	03513c23          	sd	s5,56(sp)
    80005b10:	03613823          	sd	s6,48(sp)
    80005b14:	03713423          	sd	s7,40(sp)
    80005b18:	03813023          	sd	s8,32(sp)
    80005b1c:	06113423          	sd	ra,104(sp)
    80005b20:	01913c23          	sd	s9,24(sp)
    80005b24:	07010413          	addi	s0,sp,112
    80005b28:	00060b93          	mv	s7,a2
    80005b2c:	00050913          	mv	s2,a0
    80005b30:	00058c13          	mv	s8,a1
    80005b34:	00060b1b          	sext.w	s6,a2
    80005b38:	00005497          	auipc	s1,0x5
    80005b3c:	43048493          	addi	s1,s1,1072 # 8000af68 <cons>
    80005b40:	00400993          	li	s3,4
    80005b44:	fff00a13          	li	s4,-1
    80005b48:	00a00a93          	li	s5,10
    80005b4c:	05705e63          	blez	s7,80005ba8 <consoleread+0xb4>
    80005b50:	09c4a703          	lw	a4,156(s1)
    80005b54:	0984a783          	lw	a5,152(s1)
    80005b58:	0007071b          	sext.w	a4,a4
    80005b5c:	08e78463          	beq	a5,a4,80005be4 <consoleread+0xf0>
    80005b60:	07f7f713          	andi	a4,a5,127
    80005b64:	00e48733          	add	a4,s1,a4
    80005b68:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80005b6c:	0017869b          	addiw	a3,a5,1
    80005b70:	08d4ac23          	sw	a3,152(s1)
    80005b74:	00070c9b          	sext.w	s9,a4
    80005b78:	0b370663          	beq	a4,s3,80005c24 <consoleread+0x130>
    80005b7c:	00100693          	li	a3,1
    80005b80:	f9f40613          	addi	a2,s0,-97
    80005b84:	000c0593          	mv	a1,s8
    80005b88:	00090513          	mv	a0,s2
    80005b8c:	f8e40fa3          	sb	a4,-97(s0)
    80005b90:	00000097          	auipc	ra,0x0
    80005b94:	8c0080e7          	jalr	-1856(ra) # 80005450 <either_copyout>
    80005b98:	01450863          	beq	a0,s4,80005ba8 <consoleread+0xb4>
    80005b9c:	001c0c13          	addi	s8,s8,1
    80005ba0:	fffb8b9b          	addiw	s7,s7,-1
    80005ba4:	fb5c94e3          	bne	s9,s5,80005b4c <consoleread+0x58>
    80005ba8:	000b851b          	sext.w	a0,s7
    80005bac:	06813083          	ld	ra,104(sp)
    80005bb0:	06013403          	ld	s0,96(sp)
    80005bb4:	05813483          	ld	s1,88(sp)
    80005bb8:	05013903          	ld	s2,80(sp)
    80005bbc:	04813983          	ld	s3,72(sp)
    80005bc0:	04013a03          	ld	s4,64(sp)
    80005bc4:	03813a83          	ld	s5,56(sp)
    80005bc8:	02813b83          	ld	s7,40(sp)
    80005bcc:	02013c03          	ld	s8,32(sp)
    80005bd0:	01813c83          	ld	s9,24(sp)
    80005bd4:	40ab053b          	subw	a0,s6,a0
    80005bd8:	03013b03          	ld	s6,48(sp)
    80005bdc:	07010113          	addi	sp,sp,112
    80005be0:	00008067          	ret
    80005be4:	00001097          	auipc	ra,0x1
    80005be8:	1d8080e7          	jalr	472(ra) # 80006dbc <push_on>
    80005bec:	0984a703          	lw	a4,152(s1)
    80005bf0:	09c4a783          	lw	a5,156(s1)
    80005bf4:	0007879b          	sext.w	a5,a5
    80005bf8:	fef70ce3          	beq	a4,a5,80005bf0 <consoleread+0xfc>
    80005bfc:	00001097          	auipc	ra,0x1
    80005c00:	234080e7          	jalr	564(ra) # 80006e30 <pop_on>
    80005c04:	0984a783          	lw	a5,152(s1)
    80005c08:	07f7f713          	andi	a4,a5,127
    80005c0c:	00e48733          	add	a4,s1,a4
    80005c10:	01874703          	lbu	a4,24(a4)
    80005c14:	0017869b          	addiw	a3,a5,1
    80005c18:	08d4ac23          	sw	a3,152(s1)
    80005c1c:	00070c9b          	sext.w	s9,a4
    80005c20:	f5371ee3          	bne	a4,s3,80005b7c <consoleread+0x88>
    80005c24:	000b851b          	sext.w	a0,s7
    80005c28:	f96bf2e3          	bgeu	s7,s6,80005bac <consoleread+0xb8>
    80005c2c:	08f4ac23          	sw	a5,152(s1)
    80005c30:	f7dff06f          	j	80005bac <consoleread+0xb8>

0000000080005c34 <consputc>:
    80005c34:	10000793          	li	a5,256
    80005c38:	00f50663          	beq	a0,a5,80005c44 <consputc+0x10>
    80005c3c:	00001317          	auipc	t1,0x1
    80005c40:	9f430067          	jr	-1548(t1) # 80006630 <uartputc_sync>
    80005c44:	ff010113          	addi	sp,sp,-16
    80005c48:	00113423          	sd	ra,8(sp)
    80005c4c:	00813023          	sd	s0,0(sp)
    80005c50:	01010413          	addi	s0,sp,16
    80005c54:	00800513          	li	a0,8
    80005c58:	00001097          	auipc	ra,0x1
    80005c5c:	9d8080e7          	jalr	-1576(ra) # 80006630 <uartputc_sync>
    80005c60:	02000513          	li	a0,32
    80005c64:	00001097          	auipc	ra,0x1
    80005c68:	9cc080e7          	jalr	-1588(ra) # 80006630 <uartputc_sync>
    80005c6c:	00013403          	ld	s0,0(sp)
    80005c70:	00813083          	ld	ra,8(sp)
    80005c74:	00800513          	li	a0,8
    80005c78:	01010113          	addi	sp,sp,16
    80005c7c:	00001317          	auipc	t1,0x1
    80005c80:	9b430067          	jr	-1612(t1) # 80006630 <uartputc_sync>

0000000080005c84 <consoleintr>:
    80005c84:	fe010113          	addi	sp,sp,-32
    80005c88:	00813823          	sd	s0,16(sp)
    80005c8c:	00913423          	sd	s1,8(sp)
    80005c90:	01213023          	sd	s2,0(sp)
    80005c94:	00113c23          	sd	ra,24(sp)
    80005c98:	02010413          	addi	s0,sp,32
    80005c9c:	00005917          	auipc	s2,0x5
    80005ca0:	2cc90913          	addi	s2,s2,716 # 8000af68 <cons>
    80005ca4:	00050493          	mv	s1,a0
    80005ca8:	00090513          	mv	a0,s2
    80005cac:	00001097          	auipc	ra,0x1
    80005cb0:	e40080e7          	jalr	-448(ra) # 80006aec <acquire>
    80005cb4:	02048c63          	beqz	s1,80005cec <consoleintr+0x68>
    80005cb8:	0a092783          	lw	a5,160(s2)
    80005cbc:	09892703          	lw	a4,152(s2)
    80005cc0:	07f00693          	li	a3,127
    80005cc4:	40e7873b          	subw	a4,a5,a4
    80005cc8:	02e6e263          	bltu	a3,a4,80005cec <consoleintr+0x68>
    80005ccc:	00d00713          	li	a4,13
    80005cd0:	04e48063          	beq	s1,a4,80005d10 <consoleintr+0x8c>
    80005cd4:	07f7f713          	andi	a4,a5,127
    80005cd8:	00e90733          	add	a4,s2,a4
    80005cdc:	0017879b          	addiw	a5,a5,1
    80005ce0:	0af92023          	sw	a5,160(s2)
    80005ce4:	00970c23          	sb	s1,24(a4)
    80005ce8:	08f92e23          	sw	a5,156(s2)
    80005cec:	01013403          	ld	s0,16(sp)
    80005cf0:	01813083          	ld	ra,24(sp)
    80005cf4:	00813483          	ld	s1,8(sp)
    80005cf8:	00013903          	ld	s2,0(sp)
    80005cfc:	00005517          	auipc	a0,0x5
    80005d00:	26c50513          	addi	a0,a0,620 # 8000af68 <cons>
    80005d04:	02010113          	addi	sp,sp,32
    80005d08:	00001317          	auipc	t1,0x1
    80005d0c:	eb030067          	jr	-336(t1) # 80006bb8 <release>
    80005d10:	00a00493          	li	s1,10
    80005d14:	fc1ff06f          	j	80005cd4 <consoleintr+0x50>

0000000080005d18 <consoleinit>:
    80005d18:	fe010113          	addi	sp,sp,-32
    80005d1c:	00113c23          	sd	ra,24(sp)
    80005d20:	00813823          	sd	s0,16(sp)
    80005d24:	00913423          	sd	s1,8(sp)
    80005d28:	02010413          	addi	s0,sp,32
    80005d2c:	00005497          	auipc	s1,0x5
    80005d30:	23c48493          	addi	s1,s1,572 # 8000af68 <cons>
    80005d34:	00048513          	mv	a0,s1
    80005d38:	00003597          	auipc	a1,0x3
    80005d3c:	8d058593          	addi	a1,a1,-1840 # 80008608 <_ZL6digits+0x140>
    80005d40:	00001097          	auipc	ra,0x1
    80005d44:	d88080e7          	jalr	-632(ra) # 80006ac8 <initlock>
    80005d48:	00000097          	auipc	ra,0x0
    80005d4c:	7ac080e7          	jalr	1964(ra) # 800064f4 <uartinit>
    80005d50:	01813083          	ld	ra,24(sp)
    80005d54:	01013403          	ld	s0,16(sp)
    80005d58:	00000797          	auipc	a5,0x0
    80005d5c:	d9c78793          	addi	a5,a5,-612 # 80005af4 <consoleread>
    80005d60:	0af4bc23          	sd	a5,184(s1)
    80005d64:	00000797          	auipc	a5,0x0
    80005d68:	cec78793          	addi	a5,a5,-788 # 80005a50 <consolewrite>
    80005d6c:	0cf4b023          	sd	a5,192(s1)
    80005d70:	00813483          	ld	s1,8(sp)
    80005d74:	02010113          	addi	sp,sp,32
    80005d78:	00008067          	ret

0000000080005d7c <console_read>:
    80005d7c:	ff010113          	addi	sp,sp,-16
    80005d80:	00813423          	sd	s0,8(sp)
    80005d84:	01010413          	addi	s0,sp,16
    80005d88:	00813403          	ld	s0,8(sp)
    80005d8c:	00005317          	auipc	t1,0x5
    80005d90:	29433303          	ld	t1,660(t1) # 8000b020 <devsw+0x10>
    80005d94:	01010113          	addi	sp,sp,16
    80005d98:	00030067          	jr	t1

0000000080005d9c <console_write>:
    80005d9c:	ff010113          	addi	sp,sp,-16
    80005da0:	00813423          	sd	s0,8(sp)
    80005da4:	01010413          	addi	s0,sp,16
    80005da8:	00813403          	ld	s0,8(sp)
    80005dac:	00005317          	auipc	t1,0x5
    80005db0:	27c33303          	ld	t1,636(t1) # 8000b028 <devsw+0x18>
    80005db4:	01010113          	addi	sp,sp,16
    80005db8:	00030067          	jr	t1

0000000080005dbc <panic>:
    80005dbc:	fe010113          	addi	sp,sp,-32
    80005dc0:	00113c23          	sd	ra,24(sp)
    80005dc4:	00813823          	sd	s0,16(sp)
    80005dc8:	00913423          	sd	s1,8(sp)
    80005dcc:	02010413          	addi	s0,sp,32
    80005dd0:	00050493          	mv	s1,a0
    80005dd4:	00003517          	auipc	a0,0x3
    80005dd8:	83c50513          	addi	a0,a0,-1988 # 80008610 <_ZL6digits+0x148>
    80005ddc:	00005797          	auipc	a5,0x5
    80005de0:	2e07a623          	sw	zero,748(a5) # 8000b0c8 <pr+0x18>
    80005de4:	00000097          	auipc	ra,0x0
    80005de8:	034080e7          	jalr	52(ra) # 80005e18 <__printf>
    80005dec:	00048513          	mv	a0,s1
    80005df0:	00000097          	auipc	ra,0x0
    80005df4:	028080e7          	jalr	40(ra) # 80005e18 <__printf>
    80005df8:	00002517          	auipc	a0,0x2
    80005dfc:	39050513          	addi	a0,a0,912 # 80008188 <CONSOLE_STATUS+0x178>
    80005e00:	00000097          	auipc	ra,0x0
    80005e04:	018080e7          	jalr	24(ra) # 80005e18 <__printf>
    80005e08:	00100793          	li	a5,1
    80005e0c:	00004717          	auipc	a4,0x4
    80005e10:	fef72e23          	sw	a5,-4(a4) # 80009e08 <panicked>
    80005e14:	0000006f          	j	80005e14 <panic+0x58>

0000000080005e18 <__printf>:
    80005e18:	f3010113          	addi	sp,sp,-208
    80005e1c:	08813023          	sd	s0,128(sp)
    80005e20:	07313423          	sd	s3,104(sp)
    80005e24:	09010413          	addi	s0,sp,144
    80005e28:	05813023          	sd	s8,64(sp)
    80005e2c:	08113423          	sd	ra,136(sp)
    80005e30:	06913c23          	sd	s1,120(sp)
    80005e34:	07213823          	sd	s2,112(sp)
    80005e38:	07413023          	sd	s4,96(sp)
    80005e3c:	05513c23          	sd	s5,88(sp)
    80005e40:	05613823          	sd	s6,80(sp)
    80005e44:	05713423          	sd	s7,72(sp)
    80005e48:	03913c23          	sd	s9,56(sp)
    80005e4c:	03a13823          	sd	s10,48(sp)
    80005e50:	03b13423          	sd	s11,40(sp)
    80005e54:	00005317          	auipc	t1,0x5
    80005e58:	25c30313          	addi	t1,t1,604 # 8000b0b0 <pr>
    80005e5c:	01832c03          	lw	s8,24(t1)
    80005e60:	00b43423          	sd	a1,8(s0)
    80005e64:	00c43823          	sd	a2,16(s0)
    80005e68:	00d43c23          	sd	a3,24(s0)
    80005e6c:	02e43023          	sd	a4,32(s0)
    80005e70:	02f43423          	sd	a5,40(s0)
    80005e74:	03043823          	sd	a6,48(s0)
    80005e78:	03143c23          	sd	a7,56(s0)
    80005e7c:	00050993          	mv	s3,a0
    80005e80:	4a0c1663          	bnez	s8,8000632c <__printf+0x514>
    80005e84:	60098c63          	beqz	s3,8000649c <__printf+0x684>
    80005e88:	0009c503          	lbu	a0,0(s3)
    80005e8c:	00840793          	addi	a5,s0,8
    80005e90:	f6f43c23          	sd	a5,-136(s0)
    80005e94:	00000493          	li	s1,0
    80005e98:	22050063          	beqz	a0,800060b8 <__printf+0x2a0>
    80005e9c:	00002a37          	lui	s4,0x2
    80005ea0:	00018ab7          	lui	s5,0x18
    80005ea4:	000f4b37          	lui	s6,0xf4
    80005ea8:	00989bb7          	lui	s7,0x989
    80005eac:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80005eb0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80005eb4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80005eb8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80005ebc:	00148c9b          	addiw	s9,s1,1
    80005ec0:	02500793          	li	a5,37
    80005ec4:	01998933          	add	s2,s3,s9
    80005ec8:	38f51263          	bne	a0,a5,8000624c <__printf+0x434>
    80005ecc:	00094783          	lbu	a5,0(s2)
    80005ed0:	00078c9b          	sext.w	s9,a5
    80005ed4:	1e078263          	beqz	a5,800060b8 <__printf+0x2a0>
    80005ed8:	0024849b          	addiw	s1,s1,2
    80005edc:	07000713          	li	a4,112
    80005ee0:	00998933          	add	s2,s3,s1
    80005ee4:	38e78a63          	beq	a5,a4,80006278 <__printf+0x460>
    80005ee8:	20f76863          	bltu	a4,a5,800060f8 <__printf+0x2e0>
    80005eec:	42a78863          	beq	a5,a0,8000631c <__printf+0x504>
    80005ef0:	06400713          	li	a4,100
    80005ef4:	40e79663          	bne	a5,a4,80006300 <__printf+0x4e8>
    80005ef8:	f7843783          	ld	a5,-136(s0)
    80005efc:	0007a603          	lw	a2,0(a5)
    80005f00:	00878793          	addi	a5,a5,8
    80005f04:	f6f43c23          	sd	a5,-136(s0)
    80005f08:	42064a63          	bltz	a2,8000633c <__printf+0x524>
    80005f0c:	00a00713          	li	a4,10
    80005f10:	02e677bb          	remuw	a5,a2,a4
    80005f14:	00002d97          	auipc	s11,0x2
    80005f18:	724d8d93          	addi	s11,s11,1828 # 80008638 <digits>
    80005f1c:	00900593          	li	a1,9
    80005f20:	0006051b          	sext.w	a0,a2
    80005f24:	00000c93          	li	s9,0
    80005f28:	02079793          	slli	a5,a5,0x20
    80005f2c:	0207d793          	srli	a5,a5,0x20
    80005f30:	00fd87b3          	add	a5,s11,a5
    80005f34:	0007c783          	lbu	a5,0(a5)
    80005f38:	02e656bb          	divuw	a3,a2,a4
    80005f3c:	f8f40023          	sb	a5,-128(s0)
    80005f40:	14c5d863          	bge	a1,a2,80006090 <__printf+0x278>
    80005f44:	06300593          	li	a1,99
    80005f48:	00100c93          	li	s9,1
    80005f4c:	02e6f7bb          	remuw	a5,a3,a4
    80005f50:	02079793          	slli	a5,a5,0x20
    80005f54:	0207d793          	srli	a5,a5,0x20
    80005f58:	00fd87b3          	add	a5,s11,a5
    80005f5c:	0007c783          	lbu	a5,0(a5)
    80005f60:	02e6d73b          	divuw	a4,a3,a4
    80005f64:	f8f400a3          	sb	a5,-127(s0)
    80005f68:	12a5f463          	bgeu	a1,a0,80006090 <__printf+0x278>
    80005f6c:	00a00693          	li	a3,10
    80005f70:	00900593          	li	a1,9
    80005f74:	02d777bb          	remuw	a5,a4,a3
    80005f78:	02079793          	slli	a5,a5,0x20
    80005f7c:	0207d793          	srli	a5,a5,0x20
    80005f80:	00fd87b3          	add	a5,s11,a5
    80005f84:	0007c503          	lbu	a0,0(a5)
    80005f88:	02d757bb          	divuw	a5,a4,a3
    80005f8c:	f8a40123          	sb	a0,-126(s0)
    80005f90:	48e5f263          	bgeu	a1,a4,80006414 <__printf+0x5fc>
    80005f94:	06300513          	li	a0,99
    80005f98:	02d7f5bb          	remuw	a1,a5,a3
    80005f9c:	02059593          	slli	a1,a1,0x20
    80005fa0:	0205d593          	srli	a1,a1,0x20
    80005fa4:	00bd85b3          	add	a1,s11,a1
    80005fa8:	0005c583          	lbu	a1,0(a1)
    80005fac:	02d7d7bb          	divuw	a5,a5,a3
    80005fb0:	f8b401a3          	sb	a1,-125(s0)
    80005fb4:	48e57263          	bgeu	a0,a4,80006438 <__printf+0x620>
    80005fb8:	3e700513          	li	a0,999
    80005fbc:	02d7f5bb          	remuw	a1,a5,a3
    80005fc0:	02059593          	slli	a1,a1,0x20
    80005fc4:	0205d593          	srli	a1,a1,0x20
    80005fc8:	00bd85b3          	add	a1,s11,a1
    80005fcc:	0005c583          	lbu	a1,0(a1)
    80005fd0:	02d7d7bb          	divuw	a5,a5,a3
    80005fd4:	f8b40223          	sb	a1,-124(s0)
    80005fd8:	46e57663          	bgeu	a0,a4,80006444 <__printf+0x62c>
    80005fdc:	02d7f5bb          	remuw	a1,a5,a3
    80005fe0:	02059593          	slli	a1,a1,0x20
    80005fe4:	0205d593          	srli	a1,a1,0x20
    80005fe8:	00bd85b3          	add	a1,s11,a1
    80005fec:	0005c583          	lbu	a1,0(a1)
    80005ff0:	02d7d7bb          	divuw	a5,a5,a3
    80005ff4:	f8b402a3          	sb	a1,-123(s0)
    80005ff8:	46ea7863          	bgeu	s4,a4,80006468 <__printf+0x650>
    80005ffc:	02d7f5bb          	remuw	a1,a5,a3
    80006000:	02059593          	slli	a1,a1,0x20
    80006004:	0205d593          	srli	a1,a1,0x20
    80006008:	00bd85b3          	add	a1,s11,a1
    8000600c:	0005c583          	lbu	a1,0(a1)
    80006010:	02d7d7bb          	divuw	a5,a5,a3
    80006014:	f8b40323          	sb	a1,-122(s0)
    80006018:	3eeaf863          	bgeu	s5,a4,80006408 <__printf+0x5f0>
    8000601c:	02d7f5bb          	remuw	a1,a5,a3
    80006020:	02059593          	slli	a1,a1,0x20
    80006024:	0205d593          	srli	a1,a1,0x20
    80006028:	00bd85b3          	add	a1,s11,a1
    8000602c:	0005c583          	lbu	a1,0(a1)
    80006030:	02d7d7bb          	divuw	a5,a5,a3
    80006034:	f8b403a3          	sb	a1,-121(s0)
    80006038:	42eb7e63          	bgeu	s6,a4,80006474 <__printf+0x65c>
    8000603c:	02d7f5bb          	remuw	a1,a5,a3
    80006040:	02059593          	slli	a1,a1,0x20
    80006044:	0205d593          	srli	a1,a1,0x20
    80006048:	00bd85b3          	add	a1,s11,a1
    8000604c:	0005c583          	lbu	a1,0(a1)
    80006050:	02d7d7bb          	divuw	a5,a5,a3
    80006054:	f8b40423          	sb	a1,-120(s0)
    80006058:	42ebfc63          	bgeu	s7,a4,80006490 <__printf+0x678>
    8000605c:	02079793          	slli	a5,a5,0x20
    80006060:	0207d793          	srli	a5,a5,0x20
    80006064:	00fd8db3          	add	s11,s11,a5
    80006068:	000dc703          	lbu	a4,0(s11)
    8000606c:	00a00793          	li	a5,10
    80006070:	00900c93          	li	s9,9
    80006074:	f8e404a3          	sb	a4,-119(s0)
    80006078:	00065c63          	bgez	a2,80006090 <__printf+0x278>
    8000607c:	f9040713          	addi	a4,s0,-112
    80006080:	00f70733          	add	a4,a4,a5
    80006084:	02d00693          	li	a3,45
    80006088:	fed70823          	sb	a3,-16(a4)
    8000608c:	00078c93          	mv	s9,a5
    80006090:	f8040793          	addi	a5,s0,-128
    80006094:	01978cb3          	add	s9,a5,s9
    80006098:	f7f40d13          	addi	s10,s0,-129
    8000609c:	000cc503          	lbu	a0,0(s9)
    800060a0:	fffc8c93          	addi	s9,s9,-1
    800060a4:	00000097          	auipc	ra,0x0
    800060a8:	b90080e7          	jalr	-1136(ra) # 80005c34 <consputc>
    800060ac:	ffac98e3          	bne	s9,s10,8000609c <__printf+0x284>
    800060b0:	00094503          	lbu	a0,0(s2)
    800060b4:	e00514e3          	bnez	a0,80005ebc <__printf+0xa4>
    800060b8:	1a0c1663          	bnez	s8,80006264 <__printf+0x44c>
    800060bc:	08813083          	ld	ra,136(sp)
    800060c0:	08013403          	ld	s0,128(sp)
    800060c4:	07813483          	ld	s1,120(sp)
    800060c8:	07013903          	ld	s2,112(sp)
    800060cc:	06813983          	ld	s3,104(sp)
    800060d0:	06013a03          	ld	s4,96(sp)
    800060d4:	05813a83          	ld	s5,88(sp)
    800060d8:	05013b03          	ld	s6,80(sp)
    800060dc:	04813b83          	ld	s7,72(sp)
    800060e0:	04013c03          	ld	s8,64(sp)
    800060e4:	03813c83          	ld	s9,56(sp)
    800060e8:	03013d03          	ld	s10,48(sp)
    800060ec:	02813d83          	ld	s11,40(sp)
    800060f0:	0d010113          	addi	sp,sp,208
    800060f4:	00008067          	ret
    800060f8:	07300713          	li	a4,115
    800060fc:	1ce78a63          	beq	a5,a4,800062d0 <__printf+0x4b8>
    80006100:	07800713          	li	a4,120
    80006104:	1ee79e63          	bne	a5,a4,80006300 <__printf+0x4e8>
    80006108:	f7843783          	ld	a5,-136(s0)
    8000610c:	0007a703          	lw	a4,0(a5)
    80006110:	00878793          	addi	a5,a5,8
    80006114:	f6f43c23          	sd	a5,-136(s0)
    80006118:	28074263          	bltz	a4,8000639c <__printf+0x584>
    8000611c:	00002d97          	auipc	s11,0x2
    80006120:	51cd8d93          	addi	s11,s11,1308 # 80008638 <digits>
    80006124:	00f77793          	andi	a5,a4,15
    80006128:	00fd87b3          	add	a5,s11,a5
    8000612c:	0007c683          	lbu	a3,0(a5)
    80006130:	00f00613          	li	a2,15
    80006134:	0007079b          	sext.w	a5,a4
    80006138:	f8d40023          	sb	a3,-128(s0)
    8000613c:	0047559b          	srliw	a1,a4,0x4
    80006140:	0047569b          	srliw	a3,a4,0x4
    80006144:	00000c93          	li	s9,0
    80006148:	0ee65063          	bge	a2,a4,80006228 <__printf+0x410>
    8000614c:	00f6f693          	andi	a3,a3,15
    80006150:	00dd86b3          	add	a3,s11,a3
    80006154:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80006158:	0087d79b          	srliw	a5,a5,0x8
    8000615c:	00100c93          	li	s9,1
    80006160:	f8d400a3          	sb	a3,-127(s0)
    80006164:	0cb67263          	bgeu	a2,a1,80006228 <__printf+0x410>
    80006168:	00f7f693          	andi	a3,a5,15
    8000616c:	00dd86b3          	add	a3,s11,a3
    80006170:	0006c583          	lbu	a1,0(a3)
    80006174:	00f00613          	li	a2,15
    80006178:	0047d69b          	srliw	a3,a5,0x4
    8000617c:	f8b40123          	sb	a1,-126(s0)
    80006180:	0047d593          	srli	a1,a5,0x4
    80006184:	28f67e63          	bgeu	a2,a5,80006420 <__printf+0x608>
    80006188:	00f6f693          	andi	a3,a3,15
    8000618c:	00dd86b3          	add	a3,s11,a3
    80006190:	0006c503          	lbu	a0,0(a3)
    80006194:	0087d813          	srli	a6,a5,0x8
    80006198:	0087d69b          	srliw	a3,a5,0x8
    8000619c:	f8a401a3          	sb	a0,-125(s0)
    800061a0:	28b67663          	bgeu	a2,a1,8000642c <__printf+0x614>
    800061a4:	00f6f693          	andi	a3,a3,15
    800061a8:	00dd86b3          	add	a3,s11,a3
    800061ac:	0006c583          	lbu	a1,0(a3)
    800061b0:	00c7d513          	srli	a0,a5,0xc
    800061b4:	00c7d69b          	srliw	a3,a5,0xc
    800061b8:	f8b40223          	sb	a1,-124(s0)
    800061bc:	29067a63          	bgeu	a2,a6,80006450 <__printf+0x638>
    800061c0:	00f6f693          	andi	a3,a3,15
    800061c4:	00dd86b3          	add	a3,s11,a3
    800061c8:	0006c583          	lbu	a1,0(a3)
    800061cc:	0107d813          	srli	a6,a5,0x10
    800061d0:	0107d69b          	srliw	a3,a5,0x10
    800061d4:	f8b402a3          	sb	a1,-123(s0)
    800061d8:	28a67263          	bgeu	a2,a0,8000645c <__printf+0x644>
    800061dc:	00f6f693          	andi	a3,a3,15
    800061e0:	00dd86b3          	add	a3,s11,a3
    800061e4:	0006c683          	lbu	a3,0(a3)
    800061e8:	0147d79b          	srliw	a5,a5,0x14
    800061ec:	f8d40323          	sb	a3,-122(s0)
    800061f0:	21067663          	bgeu	a2,a6,800063fc <__printf+0x5e4>
    800061f4:	02079793          	slli	a5,a5,0x20
    800061f8:	0207d793          	srli	a5,a5,0x20
    800061fc:	00fd8db3          	add	s11,s11,a5
    80006200:	000dc683          	lbu	a3,0(s11)
    80006204:	00800793          	li	a5,8
    80006208:	00700c93          	li	s9,7
    8000620c:	f8d403a3          	sb	a3,-121(s0)
    80006210:	00075c63          	bgez	a4,80006228 <__printf+0x410>
    80006214:	f9040713          	addi	a4,s0,-112
    80006218:	00f70733          	add	a4,a4,a5
    8000621c:	02d00693          	li	a3,45
    80006220:	fed70823          	sb	a3,-16(a4)
    80006224:	00078c93          	mv	s9,a5
    80006228:	f8040793          	addi	a5,s0,-128
    8000622c:	01978cb3          	add	s9,a5,s9
    80006230:	f7f40d13          	addi	s10,s0,-129
    80006234:	000cc503          	lbu	a0,0(s9)
    80006238:	fffc8c93          	addi	s9,s9,-1
    8000623c:	00000097          	auipc	ra,0x0
    80006240:	9f8080e7          	jalr	-1544(ra) # 80005c34 <consputc>
    80006244:	ff9d18e3          	bne	s10,s9,80006234 <__printf+0x41c>
    80006248:	0100006f          	j	80006258 <__printf+0x440>
    8000624c:	00000097          	auipc	ra,0x0
    80006250:	9e8080e7          	jalr	-1560(ra) # 80005c34 <consputc>
    80006254:	000c8493          	mv	s1,s9
    80006258:	00094503          	lbu	a0,0(s2)
    8000625c:	c60510e3          	bnez	a0,80005ebc <__printf+0xa4>
    80006260:	e40c0ee3          	beqz	s8,800060bc <__printf+0x2a4>
    80006264:	00005517          	auipc	a0,0x5
    80006268:	e4c50513          	addi	a0,a0,-436 # 8000b0b0 <pr>
    8000626c:	00001097          	auipc	ra,0x1
    80006270:	94c080e7          	jalr	-1716(ra) # 80006bb8 <release>
    80006274:	e49ff06f          	j	800060bc <__printf+0x2a4>
    80006278:	f7843783          	ld	a5,-136(s0)
    8000627c:	03000513          	li	a0,48
    80006280:	01000d13          	li	s10,16
    80006284:	00878713          	addi	a4,a5,8
    80006288:	0007bc83          	ld	s9,0(a5)
    8000628c:	f6e43c23          	sd	a4,-136(s0)
    80006290:	00000097          	auipc	ra,0x0
    80006294:	9a4080e7          	jalr	-1628(ra) # 80005c34 <consputc>
    80006298:	07800513          	li	a0,120
    8000629c:	00000097          	auipc	ra,0x0
    800062a0:	998080e7          	jalr	-1640(ra) # 80005c34 <consputc>
    800062a4:	00002d97          	auipc	s11,0x2
    800062a8:	394d8d93          	addi	s11,s11,916 # 80008638 <digits>
    800062ac:	03ccd793          	srli	a5,s9,0x3c
    800062b0:	00fd87b3          	add	a5,s11,a5
    800062b4:	0007c503          	lbu	a0,0(a5)
    800062b8:	fffd0d1b          	addiw	s10,s10,-1
    800062bc:	004c9c93          	slli	s9,s9,0x4
    800062c0:	00000097          	auipc	ra,0x0
    800062c4:	974080e7          	jalr	-1676(ra) # 80005c34 <consputc>
    800062c8:	fe0d12e3          	bnez	s10,800062ac <__printf+0x494>
    800062cc:	f8dff06f          	j	80006258 <__printf+0x440>
    800062d0:	f7843783          	ld	a5,-136(s0)
    800062d4:	0007bc83          	ld	s9,0(a5)
    800062d8:	00878793          	addi	a5,a5,8
    800062dc:	f6f43c23          	sd	a5,-136(s0)
    800062e0:	000c9a63          	bnez	s9,800062f4 <__printf+0x4dc>
    800062e4:	1080006f          	j	800063ec <__printf+0x5d4>
    800062e8:	001c8c93          	addi	s9,s9,1
    800062ec:	00000097          	auipc	ra,0x0
    800062f0:	948080e7          	jalr	-1720(ra) # 80005c34 <consputc>
    800062f4:	000cc503          	lbu	a0,0(s9)
    800062f8:	fe0518e3          	bnez	a0,800062e8 <__printf+0x4d0>
    800062fc:	f5dff06f          	j	80006258 <__printf+0x440>
    80006300:	02500513          	li	a0,37
    80006304:	00000097          	auipc	ra,0x0
    80006308:	930080e7          	jalr	-1744(ra) # 80005c34 <consputc>
    8000630c:	000c8513          	mv	a0,s9
    80006310:	00000097          	auipc	ra,0x0
    80006314:	924080e7          	jalr	-1756(ra) # 80005c34 <consputc>
    80006318:	f41ff06f          	j	80006258 <__printf+0x440>
    8000631c:	02500513          	li	a0,37
    80006320:	00000097          	auipc	ra,0x0
    80006324:	914080e7          	jalr	-1772(ra) # 80005c34 <consputc>
    80006328:	f31ff06f          	j	80006258 <__printf+0x440>
    8000632c:	00030513          	mv	a0,t1
    80006330:	00000097          	auipc	ra,0x0
    80006334:	7bc080e7          	jalr	1980(ra) # 80006aec <acquire>
    80006338:	b4dff06f          	j	80005e84 <__printf+0x6c>
    8000633c:	40c0053b          	negw	a0,a2
    80006340:	00a00713          	li	a4,10
    80006344:	02e576bb          	remuw	a3,a0,a4
    80006348:	00002d97          	auipc	s11,0x2
    8000634c:	2f0d8d93          	addi	s11,s11,752 # 80008638 <digits>
    80006350:	ff700593          	li	a1,-9
    80006354:	02069693          	slli	a3,a3,0x20
    80006358:	0206d693          	srli	a3,a3,0x20
    8000635c:	00dd86b3          	add	a3,s11,a3
    80006360:	0006c683          	lbu	a3,0(a3)
    80006364:	02e557bb          	divuw	a5,a0,a4
    80006368:	f8d40023          	sb	a3,-128(s0)
    8000636c:	10b65e63          	bge	a2,a1,80006488 <__printf+0x670>
    80006370:	06300593          	li	a1,99
    80006374:	02e7f6bb          	remuw	a3,a5,a4
    80006378:	02069693          	slli	a3,a3,0x20
    8000637c:	0206d693          	srli	a3,a3,0x20
    80006380:	00dd86b3          	add	a3,s11,a3
    80006384:	0006c683          	lbu	a3,0(a3)
    80006388:	02e7d73b          	divuw	a4,a5,a4
    8000638c:	00200793          	li	a5,2
    80006390:	f8d400a3          	sb	a3,-127(s0)
    80006394:	bca5ece3          	bltu	a1,a0,80005f6c <__printf+0x154>
    80006398:	ce5ff06f          	j	8000607c <__printf+0x264>
    8000639c:	40e007bb          	negw	a5,a4
    800063a0:	00002d97          	auipc	s11,0x2
    800063a4:	298d8d93          	addi	s11,s11,664 # 80008638 <digits>
    800063a8:	00f7f693          	andi	a3,a5,15
    800063ac:	00dd86b3          	add	a3,s11,a3
    800063b0:	0006c583          	lbu	a1,0(a3)
    800063b4:	ff100613          	li	a2,-15
    800063b8:	0047d69b          	srliw	a3,a5,0x4
    800063bc:	f8b40023          	sb	a1,-128(s0)
    800063c0:	0047d59b          	srliw	a1,a5,0x4
    800063c4:	0ac75e63          	bge	a4,a2,80006480 <__printf+0x668>
    800063c8:	00f6f693          	andi	a3,a3,15
    800063cc:	00dd86b3          	add	a3,s11,a3
    800063d0:	0006c603          	lbu	a2,0(a3)
    800063d4:	00f00693          	li	a3,15
    800063d8:	0087d79b          	srliw	a5,a5,0x8
    800063dc:	f8c400a3          	sb	a2,-127(s0)
    800063e0:	d8b6e4e3          	bltu	a3,a1,80006168 <__printf+0x350>
    800063e4:	00200793          	li	a5,2
    800063e8:	e2dff06f          	j	80006214 <__printf+0x3fc>
    800063ec:	00002c97          	auipc	s9,0x2
    800063f0:	22cc8c93          	addi	s9,s9,556 # 80008618 <_ZL6digits+0x150>
    800063f4:	02800513          	li	a0,40
    800063f8:	ef1ff06f          	j	800062e8 <__printf+0x4d0>
    800063fc:	00700793          	li	a5,7
    80006400:	00600c93          	li	s9,6
    80006404:	e0dff06f          	j	80006210 <__printf+0x3f8>
    80006408:	00700793          	li	a5,7
    8000640c:	00600c93          	li	s9,6
    80006410:	c69ff06f          	j	80006078 <__printf+0x260>
    80006414:	00300793          	li	a5,3
    80006418:	00200c93          	li	s9,2
    8000641c:	c5dff06f          	j	80006078 <__printf+0x260>
    80006420:	00300793          	li	a5,3
    80006424:	00200c93          	li	s9,2
    80006428:	de9ff06f          	j	80006210 <__printf+0x3f8>
    8000642c:	00400793          	li	a5,4
    80006430:	00300c93          	li	s9,3
    80006434:	dddff06f          	j	80006210 <__printf+0x3f8>
    80006438:	00400793          	li	a5,4
    8000643c:	00300c93          	li	s9,3
    80006440:	c39ff06f          	j	80006078 <__printf+0x260>
    80006444:	00500793          	li	a5,5
    80006448:	00400c93          	li	s9,4
    8000644c:	c2dff06f          	j	80006078 <__printf+0x260>
    80006450:	00500793          	li	a5,5
    80006454:	00400c93          	li	s9,4
    80006458:	db9ff06f          	j	80006210 <__printf+0x3f8>
    8000645c:	00600793          	li	a5,6
    80006460:	00500c93          	li	s9,5
    80006464:	dadff06f          	j	80006210 <__printf+0x3f8>
    80006468:	00600793          	li	a5,6
    8000646c:	00500c93          	li	s9,5
    80006470:	c09ff06f          	j	80006078 <__printf+0x260>
    80006474:	00800793          	li	a5,8
    80006478:	00700c93          	li	s9,7
    8000647c:	bfdff06f          	j	80006078 <__printf+0x260>
    80006480:	00100793          	li	a5,1
    80006484:	d91ff06f          	j	80006214 <__printf+0x3fc>
    80006488:	00100793          	li	a5,1
    8000648c:	bf1ff06f          	j	8000607c <__printf+0x264>
    80006490:	00900793          	li	a5,9
    80006494:	00800c93          	li	s9,8
    80006498:	be1ff06f          	j	80006078 <__printf+0x260>
    8000649c:	00002517          	auipc	a0,0x2
    800064a0:	18450513          	addi	a0,a0,388 # 80008620 <_ZL6digits+0x158>
    800064a4:	00000097          	auipc	ra,0x0
    800064a8:	918080e7          	jalr	-1768(ra) # 80005dbc <panic>

00000000800064ac <printfinit>:
    800064ac:	fe010113          	addi	sp,sp,-32
    800064b0:	00813823          	sd	s0,16(sp)
    800064b4:	00913423          	sd	s1,8(sp)
    800064b8:	00113c23          	sd	ra,24(sp)
    800064bc:	02010413          	addi	s0,sp,32
    800064c0:	00005497          	auipc	s1,0x5
    800064c4:	bf048493          	addi	s1,s1,-1040 # 8000b0b0 <pr>
    800064c8:	00048513          	mv	a0,s1
    800064cc:	00002597          	auipc	a1,0x2
    800064d0:	16458593          	addi	a1,a1,356 # 80008630 <_ZL6digits+0x168>
    800064d4:	00000097          	auipc	ra,0x0
    800064d8:	5f4080e7          	jalr	1524(ra) # 80006ac8 <initlock>
    800064dc:	01813083          	ld	ra,24(sp)
    800064e0:	01013403          	ld	s0,16(sp)
    800064e4:	0004ac23          	sw	zero,24(s1)
    800064e8:	00813483          	ld	s1,8(sp)
    800064ec:	02010113          	addi	sp,sp,32
    800064f0:	00008067          	ret

00000000800064f4 <uartinit>:
    800064f4:	ff010113          	addi	sp,sp,-16
    800064f8:	00813423          	sd	s0,8(sp)
    800064fc:	01010413          	addi	s0,sp,16
    80006500:	100007b7          	lui	a5,0x10000
    80006504:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80006508:	f8000713          	li	a4,-128
    8000650c:	00e781a3          	sb	a4,3(a5)
    80006510:	00300713          	li	a4,3
    80006514:	00e78023          	sb	a4,0(a5)
    80006518:	000780a3          	sb	zero,1(a5)
    8000651c:	00e781a3          	sb	a4,3(a5)
    80006520:	00700693          	li	a3,7
    80006524:	00d78123          	sb	a3,2(a5)
    80006528:	00e780a3          	sb	a4,1(a5)
    8000652c:	00813403          	ld	s0,8(sp)
    80006530:	01010113          	addi	sp,sp,16
    80006534:	00008067          	ret

0000000080006538 <uartputc>:
    80006538:	00004797          	auipc	a5,0x4
    8000653c:	8d07a783          	lw	a5,-1840(a5) # 80009e08 <panicked>
    80006540:	00078463          	beqz	a5,80006548 <uartputc+0x10>
    80006544:	0000006f          	j	80006544 <uartputc+0xc>
    80006548:	fd010113          	addi	sp,sp,-48
    8000654c:	02813023          	sd	s0,32(sp)
    80006550:	00913c23          	sd	s1,24(sp)
    80006554:	01213823          	sd	s2,16(sp)
    80006558:	01313423          	sd	s3,8(sp)
    8000655c:	02113423          	sd	ra,40(sp)
    80006560:	03010413          	addi	s0,sp,48
    80006564:	00004917          	auipc	s2,0x4
    80006568:	8ac90913          	addi	s2,s2,-1876 # 80009e10 <uart_tx_r>
    8000656c:	00093783          	ld	a5,0(s2)
    80006570:	00004497          	auipc	s1,0x4
    80006574:	8a848493          	addi	s1,s1,-1880 # 80009e18 <uart_tx_w>
    80006578:	0004b703          	ld	a4,0(s1)
    8000657c:	02078693          	addi	a3,a5,32
    80006580:	00050993          	mv	s3,a0
    80006584:	02e69c63          	bne	a3,a4,800065bc <uartputc+0x84>
    80006588:	00001097          	auipc	ra,0x1
    8000658c:	834080e7          	jalr	-1996(ra) # 80006dbc <push_on>
    80006590:	00093783          	ld	a5,0(s2)
    80006594:	0004b703          	ld	a4,0(s1)
    80006598:	02078793          	addi	a5,a5,32
    8000659c:	00e79463          	bne	a5,a4,800065a4 <uartputc+0x6c>
    800065a0:	0000006f          	j	800065a0 <uartputc+0x68>
    800065a4:	00001097          	auipc	ra,0x1
    800065a8:	88c080e7          	jalr	-1908(ra) # 80006e30 <pop_on>
    800065ac:	00093783          	ld	a5,0(s2)
    800065b0:	0004b703          	ld	a4,0(s1)
    800065b4:	02078693          	addi	a3,a5,32
    800065b8:	fce688e3          	beq	a3,a4,80006588 <uartputc+0x50>
    800065bc:	01f77693          	andi	a3,a4,31
    800065c0:	00005597          	auipc	a1,0x5
    800065c4:	b1058593          	addi	a1,a1,-1264 # 8000b0d0 <uart_tx_buf>
    800065c8:	00d586b3          	add	a3,a1,a3
    800065cc:	00170713          	addi	a4,a4,1
    800065d0:	01368023          	sb	s3,0(a3)
    800065d4:	00e4b023          	sd	a4,0(s1)
    800065d8:	10000637          	lui	a2,0x10000
    800065dc:	02f71063          	bne	a4,a5,800065fc <uartputc+0xc4>
    800065e0:	0340006f          	j	80006614 <uartputc+0xdc>
    800065e4:	00074703          	lbu	a4,0(a4)
    800065e8:	00f93023          	sd	a5,0(s2)
    800065ec:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    800065f0:	00093783          	ld	a5,0(s2)
    800065f4:	0004b703          	ld	a4,0(s1)
    800065f8:	00f70e63          	beq	a4,a5,80006614 <uartputc+0xdc>
    800065fc:	00564683          	lbu	a3,5(a2)
    80006600:	01f7f713          	andi	a4,a5,31
    80006604:	00e58733          	add	a4,a1,a4
    80006608:	0206f693          	andi	a3,a3,32
    8000660c:	00178793          	addi	a5,a5,1
    80006610:	fc069ae3          	bnez	a3,800065e4 <uartputc+0xac>
    80006614:	02813083          	ld	ra,40(sp)
    80006618:	02013403          	ld	s0,32(sp)
    8000661c:	01813483          	ld	s1,24(sp)
    80006620:	01013903          	ld	s2,16(sp)
    80006624:	00813983          	ld	s3,8(sp)
    80006628:	03010113          	addi	sp,sp,48
    8000662c:	00008067          	ret

0000000080006630 <uartputc_sync>:
    80006630:	ff010113          	addi	sp,sp,-16
    80006634:	00813423          	sd	s0,8(sp)
    80006638:	01010413          	addi	s0,sp,16
    8000663c:	00003717          	auipc	a4,0x3
    80006640:	7cc72703          	lw	a4,1996(a4) # 80009e08 <panicked>
    80006644:	02071663          	bnez	a4,80006670 <uartputc_sync+0x40>
    80006648:	00050793          	mv	a5,a0
    8000664c:	100006b7          	lui	a3,0x10000
    80006650:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80006654:	02077713          	andi	a4,a4,32
    80006658:	fe070ce3          	beqz	a4,80006650 <uartputc_sync+0x20>
    8000665c:	0ff7f793          	andi	a5,a5,255
    80006660:	00f68023          	sb	a5,0(a3)
    80006664:	00813403          	ld	s0,8(sp)
    80006668:	01010113          	addi	sp,sp,16
    8000666c:	00008067          	ret
    80006670:	0000006f          	j	80006670 <uartputc_sync+0x40>

0000000080006674 <uartstart>:
    80006674:	ff010113          	addi	sp,sp,-16
    80006678:	00813423          	sd	s0,8(sp)
    8000667c:	01010413          	addi	s0,sp,16
    80006680:	00003617          	auipc	a2,0x3
    80006684:	79060613          	addi	a2,a2,1936 # 80009e10 <uart_tx_r>
    80006688:	00003517          	auipc	a0,0x3
    8000668c:	79050513          	addi	a0,a0,1936 # 80009e18 <uart_tx_w>
    80006690:	00063783          	ld	a5,0(a2)
    80006694:	00053703          	ld	a4,0(a0)
    80006698:	04f70263          	beq	a4,a5,800066dc <uartstart+0x68>
    8000669c:	100005b7          	lui	a1,0x10000
    800066a0:	00005817          	auipc	a6,0x5
    800066a4:	a3080813          	addi	a6,a6,-1488 # 8000b0d0 <uart_tx_buf>
    800066a8:	01c0006f          	j	800066c4 <uartstart+0x50>
    800066ac:	0006c703          	lbu	a4,0(a3)
    800066b0:	00f63023          	sd	a5,0(a2)
    800066b4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800066b8:	00063783          	ld	a5,0(a2)
    800066bc:	00053703          	ld	a4,0(a0)
    800066c0:	00f70e63          	beq	a4,a5,800066dc <uartstart+0x68>
    800066c4:	01f7f713          	andi	a4,a5,31
    800066c8:	00e806b3          	add	a3,a6,a4
    800066cc:	0055c703          	lbu	a4,5(a1)
    800066d0:	00178793          	addi	a5,a5,1
    800066d4:	02077713          	andi	a4,a4,32
    800066d8:	fc071ae3          	bnez	a4,800066ac <uartstart+0x38>
    800066dc:	00813403          	ld	s0,8(sp)
    800066e0:	01010113          	addi	sp,sp,16
    800066e4:	00008067          	ret

00000000800066e8 <uartgetc>:
    800066e8:	ff010113          	addi	sp,sp,-16
    800066ec:	00813423          	sd	s0,8(sp)
    800066f0:	01010413          	addi	s0,sp,16
    800066f4:	10000737          	lui	a4,0x10000
    800066f8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    800066fc:	0017f793          	andi	a5,a5,1
    80006700:	00078c63          	beqz	a5,80006718 <uartgetc+0x30>
    80006704:	00074503          	lbu	a0,0(a4)
    80006708:	0ff57513          	andi	a0,a0,255
    8000670c:	00813403          	ld	s0,8(sp)
    80006710:	01010113          	addi	sp,sp,16
    80006714:	00008067          	ret
    80006718:	fff00513          	li	a0,-1
    8000671c:	ff1ff06f          	j	8000670c <uartgetc+0x24>

0000000080006720 <uartintr>:
    80006720:	100007b7          	lui	a5,0x10000
    80006724:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80006728:	0017f793          	andi	a5,a5,1
    8000672c:	0a078463          	beqz	a5,800067d4 <uartintr+0xb4>
    80006730:	fe010113          	addi	sp,sp,-32
    80006734:	00813823          	sd	s0,16(sp)
    80006738:	00913423          	sd	s1,8(sp)
    8000673c:	00113c23          	sd	ra,24(sp)
    80006740:	02010413          	addi	s0,sp,32
    80006744:	100004b7          	lui	s1,0x10000
    80006748:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000674c:	0ff57513          	andi	a0,a0,255
    80006750:	fffff097          	auipc	ra,0xfffff
    80006754:	534080e7          	jalr	1332(ra) # 80005c84 <consoleintr>
    80006758:	0054c783          	lbu	a5,5(s1)
    8000675c:	0017f793          	andi	a5,a5,1
    80006760:	fe0794e3          	bnez	a5,80006748 <uartintr+0x28>
    80006764:	00003617          	auipc	a2,0x3
    80006768:	6ac60613          	addi	a2,a2,1708 # 80009e10 <uart_tx_r>
    8000676c:	00003517          	auipc	a0,0x3
    80006770:	6ac50513          	addi	a0,a0,1708 # 80009e18 <uart_tx_w>
    80006774:	00063783          	ld	a5,0(a2)
    80006778:	00053703          	ld	a4,0(a0)
    8000677c:	04f70263          	beq	a4,a5,800067c0 <uartintr+0xa0>
    80006780:	100005b7          	lui	a1,0x10000
    80006784:	00005817          	auipc	a6,0x5
    80006788:	94c80813          	addi	a6,a6,-1716 # 8000b0d0 <uart_tx_buf>
    8000678c:	01c0006f          	j	800067a8 <uartintr+0x88>
    80006790:	0006c703          	lbu	a4,0(a3)
    80006794:	00f63023          	sd	a5,0(a2)
    80006798:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000679c:	00063783          	ld	a5,0(a2)
    800067a0:	00053703          	ld	a4,0(a0)
    800067a4:	00f70e63          	beq	a4,a5,800067c0 <uartintr+0xa0>
    800067a8:	01f7f713          	andi	a4,a5,31
    800067ac:	00e806b3          	add	a3,a6,a4
    800067b0:	0055c703          	lbu	a4,5(a1)
    800067b4:	00178793          	addi	a5,a5,1
    800067b8:	02077713          	andi	a4,a4,32
    800067bc:	fc071ae3          	bnez	a4,80006790 <uartintr+0x70>
    800067c0:	01813083          	ld	ra,24(sp)
    800067c4:	01013403          	ld	s0,16(sp)
    800067c8:	00813483          	ld	s1,8(sp)
    800067cc:	02010113          	addi	sp,sp,32
    800067d0:	00008067          	ret
    800067d4:	00003617          	auipc	a2,0x3
    800067d8:	63c60613          	addi	a2,a2,1596 # 80009e10 <uart_tx_r>
    800067dc:	00003517          	auipc	a0,0x3
    800067e0:	63c50513          	addi	a0,a0,1596 # 80009e18 <uart_tx_w>
    800067e4:	00063783          	ld	a5,0(a2)
    800067e8:	00053703          	ld	a4,0(a0)
    800067ec:	04f70263          	beq	a4,a5,80006830 <uartintr+0x110>
    800067f0:	100005b7          	lui	a1,0x10000
    800067f4:	00005817          	auipc	a6,0x5
    800067f8:	8dc80813          	addi	a6,a6,-1828 # 8000b0d0 <uart_tx_buf>
    800067fc:	01c0006f          	j	80006818 <uartintr+0xf8>
    80006800:	0006c703          	lbu	a4,0(a3)
    80006804:	00f63023          	sd	a5,0(a2)
    80006808:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000680c:	00063783          	ld	a5,0(a2)
    80006810:	00053703          	ld	a4,0(a0)
    80006814:	02f70063          	beq	a4,a5,80006834 <uartintr+0x114>
    80006818:	01f7f713          	andi	a4,a5,31
    8000681c:	00e806b3          	add	a3,a6,a4
    80006820:	0055c703          	lbu	a4,5(a1)
    80006824:	00178793          	addi	a5,a5,1
    80006828:	02077713          	andi	a4,a4,32
    8000682c:	fc071ae3          	bnez	a4,80006800 <uartintr+0xe0>
    80006830:	00008067          	ret
    80006834:	00008067          	ret

0000000080006838 <kinit>:
    80006838:	fc010113          	addi	sp,sp,-64
    8000683c:	02913423          	sd	s1,40(sp)
    80006840:	fffff7b7          	lui	a5,0xfffff
    80006844:	00006497          	auipc	s1,0x6
    80006848:	8ab48493          	addi	s1,s1,-1877 # 8000c0ef <end+0xfff>
    8000684c:	02813823          	sd	s0,48(sp)
    80006850:	01313c23          	sd	s3,24(sp)
    80006854:	00f4f4b3          	and	s1,s1,a5
    80006858:	02113c23          	sd	ra,56(sp)
    8000685c:	03213023          	sd	s2,32(sp)
    80006860:	01413823          	sd	s4,16(sp)
    80006864:	01513423          	sd	s5,8(sp)
    80006868:	04010413          	addi	s0,sp,64
    8000686c:	000017b7          	lui	a5,0x1
    80006870:	01100993          	li	s3,17
    80006874:	00f487b3          	add	a5,s1,a5
    80006878:	01b99993          	slli	s3,s3,0x1b
    8000687c:	06f9e063          	bltu	s3,a5,800068dc <kinit+0xa4>
    80006880:	00005a97          	auipc	s5,0x5
    80006884:	870a8a93          	addi	s5,s5,-1936 # 8000b0f0 <end>
    80006888:	0754ec63          	bltu	s1,s5,80006900 <kinit+0xc8>
    8000688c:	0734fa63          	bgeu	s1,s3,80006900 <kinit+0xc8>
    80006890:	00088a37          	lui	s4,0x88
    80006894:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80006898:	00003917          	auipc	s2,0x3
    8000689c:	58890913          	addi	s2,s2,1416 # 80009e20 <kmem>
    800068a0:	00ca1a13          	slli	s4,s4,0xc
    800068a4:	0140006f          	j	800068b8 <kinit+0x80>
    800068a8:	000017b7          	lui	a5,0x1
    800068ac:	00f484b3          	add	s1,s1,a5
    800068b0:	0554e863          	bltu	s1,s5,80006900 <kinit+0xc8>
    800068b4:	0534f663          	bgeu	s1,s3,80006900 <kinit+0xc8>
    800068b8:	00001637          	lui	a2,0x1
    800068bc:	00100593          	li	a1,1
    800068c0:	00048513          	mv	a0,s1
    800068c4:	00000097          	auipc	ra,0x0
    800068c8:	5e4080e7          	jalr	1508(ra) # 80006ea8 <__memset>
    800068cc:	00093783          	ld	a5,0(s2)
    800068d0:	00f4b023          	sd	a5,0(s1)
    800068d4:	00993023          	sd	s1,0(s2)
    800068d8:	fd4498e3          	bne	s1,s4,800068a8 <kinit+0x70>
    800068dc:	03813083          	ld	ra,56(sp)
    800068e0:	03013403          	ld	s0,48(sp)
    800068e4:	02813483          	ld	s1,40(sp)
    800068e8:	02013903          	ld	s2,32(sp)
    800068ec:	01813983          	ld	s3,24(sp)
    800068f0:	01013a03          	ld	s4,16(sp)
    800068f4:	00813a83          	ld	s5,8(sp)
    800068f8:	04010113          	addi	sp,sp,64
    800068fc:	00008067          	ret
    80006900:	00002517          	auipc	a0,0x2
    80006904:	d5050513          	addi	a0,a0,-688 # 80008650 <digits+0x18>
    80006908:	fffff097          	auipc	ra,0xfffff
    8000690c:	4b4080e7          	jalr	1204(ra) # 80005dbc <panic>

0000000080006910 <freerange>:
    80006910:	fc010113          	addi	sp,sp,-64
    80006914:	000017b7          	lui	a5,0x1
    80006918:	02913423          	sd	s1,40(sp)
    8000691c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80006920:	009504b3          	add	s1,a0,s1
    80006924:	fffff537          	lui	a0,0xfffff
    80006928:	02813823          	sd	s0,48(sp)
    8000692c:	02113c23          	sd	ra,56(sp)
    80006930:	03213023          	sd	s2,32(sp)
    80006934:	01313c23          	sd	s3,24(sp)
    80006938:	01413823          	sd	s4,16(sp)
    8000693c:	01513423          	sd	s5,8(sp)
    80006940:	01613023          	sd	s6,0(sp)
    80006944:	04010413          	addi	s0,sp,64
    80006948:	00a4f4b3          	and	s1,s1,a0
    8000694c:	00f487b3          	add	a5,s1,a5
    80006950:	06f5e463          	bltu	a1,a5,800069b8 <freerange+0xa8>
    80006954:	00004a97          	auipc	s5,0x4
    80006958:	79ca8a93          	addi	s5,s5,1948 # 8000b0f0 <end>
    8000695c:	0954e263          	bltu	s1,s5,800069e0 <freerange+0xd0>
    80006960:	01100993          	li	s3,17
    80006964:	01b99993          	slli	s3,s3,0x1b
    80006968:	0734fc63          	bgeu	s1,s3,800069e0 <freerange+0xd0>
    8000696c:	00058a13          	mv	s4,a1
    80006970:	00003917          	auipc	s2,0x3
    80006974:	4b090913          	addi	s2,s2,1200 # 80009e20 <kmem>
    80006978:	00002b37          	lui	s6,0x2
    8000697c:	0140006f          	j	80006990 <freerange+0x80>
    80006980:	000017b7          	lui	a5,0x1
    80006984:	00f484b3          	add	s1,s1,a5
    80006988:	0554ec63          	bltu	s1,s5,800069e0 <freerange+0xd0>
    8000698c:	0534fa63          	bgeu	s1,s3,800069e0 <freerange+0xd0>
    80006990:	00001637          	lui	a2,0x1
    80006994:	00100593          	li	a1,1
    80006998:	00048513          	mv	a0,s1
    8000699c:	00000097          	auipc	ra,0x0
    800069a0:	50c080e7          	jalr	1292(ra) # 80006ea8 <__memset>
    800069a4:	00093703          	ld	a4,0(s2)
    800069a8:	016487b3          	add	a5,s1,s6
    800069ac:	00e4b023          	sd	a4,0(s1)
    800069b0:	00993023          	sd	s1,0(s2)
    800069b4:	fcfa76e3          	bgeu	s4,a5,80006980 <freerange+0x70>
    800069b8:	03813083          	ld	ra,56(sp)
    800069bc:	03013403          	ld	s0,48(sp)
    800069c0:	02813483          	ld	s1,40(sp)
    800069c4:	02013903          	ld	s2,32(sp)
    800069c8:	01813983          	ld	s3,24(sp)
    800069cc:	01013a03          	ld	s4,16(sp)
    800069d0:	00813a83          	ld	s5,8(sp)
    800069d4:	00013b03          	ld	s6,0(sp)
    800069d8:	04010113          	addi	sp,sp,64
    800069dc:	00008067          	ret
    800069e0:	00002517          	auipc	a0,0x2
    800069e4:	c7050513          	addi	a0,a0,-912 # 80008650 <digits+0x18>
    800069e8:	fffff097          	auipc	ra,0xfffff
    800069ec:	3d4080e7          	jalr	980(ra) # 80005dbc <panic>

00000000800069f0 <kfree>:
    800069f0:	fe010113          	addi	sp,sp,-32
    800069f4:	00813823          	sd	s0,16(sp)
    800069f8:	00113c23          	sd	ra,24(sp)
    800069fc:	00913423          	sd	s1,8(sp)
    80006a00:	02010413          	addi	s0,sp,32
    80006a04:	03451793          	slli	a5,a0,0x34
    80006a08:	04079c63          	bnez	a5,80006a60 <kfree+0x70>
    80006a0c:	00004797          	auipc	a5,0x4
    80006a10:	6e478793          	addi	a5,a5,1764 # 8000b0f0 <end>
    80006a14:	00050493          	mv	s1,a0
    80006a18:	04f56463          	bltu	a0,a5,80006a60 <kfree+0x70>
    80006a1c:	01100793          	li	a5,17
    80006a20:	01b79793          	slli	a5,a5,0x1b
    80006a24:	02f57e63          	bgeu	a0,a5,80006a60 <kfree+0x70>
    80006a28:	00001637          	lui	a2,0x1
    80006a2c:	00100593          	li	a1,1
    80006a30:	00000097          	auipc	ra,0x0
    80006a34:	478080e7          	jalr	1144(ra) # 80006ea8 <__memset>
    80006a38:	00003797          	auipc	a5,0x3
    80006a3c:	3e878793          	addi	a5,a5,1000 # 80009e20 <kmem>
    80006a40:	0007b703          	ld	a4,0(a5)
    80006a44:	01813083          	ld	ra,24(sp)
    80006a48:	01013403          	ld	s0,16(sp)
    80006a4c:	00e4b023          	sd	a4,0(s1)
    80006a50:	0097b023          	sd	s1,0(a5)
    80006a54:	00813483          	ld	s1,8(sp)
    80006a58:	02010113          	addi	sp,sp,32
    80006a5c:	00008067          	ret
    80006a60:	00002517          	auipc	a0,0x2
    80006a64:	bf050513          	addi	a0,a0,-1040 # 80008650 <digits+0x18>
    80006a68:	fffff097          	auipc	ra,0xfffff
    80006a6c:	354080e7          	jalr	852(ra) # 80005dbc <panic>

0000000080006a70 <kalloc>:
    80006a70:	fe010113          	addi	sp,sp,-32
    80006a74:	00813823          	sd	s0,16(sp)
    80006a78:	00913423          	sd	s1,8(sp)
    80006a7c:	00113c23          	sd	ra,24(sp)
    80006a80:	02010413          	addi	s0,sp,32
    80006a84:	00003797          	auipc	a5,0x3
    80006a88:	39c78793          	addi	a5,a5,924 # 80009e20 <kmem>
    80006a8c:	0007b483          	ld	s1,0(a5)
    80006a90:	02048063          	beqz	s1,80006ab0 <kalloc+0x40>
    80006a94:	0004b703          	ld	a4,0(s1)
    80006a98:	00001637          	lui	a2,0x1
    80006a9c:	00500593          	li	a1,5
    80006aa0:	00048513          	mv	a0,s1
    80006aa4:	00e7b023          	sd	a4,0(a5)
    80006aa8:	00000097          	auipc	ra,0x0
    80006aac:	400080e7          	jalr	1024(ra) # 80006ea8 <__memset>
    80006ab0:	01813083          	ld	ra,24(sp)
    80006ab4:	01013403          	ld	s0,16(sp)
    80006ab8:	00048513          	mv	a0,s1
    80006abc:	00813483          	ld	s1,8(sp)
    80006ac0:	02010113          	addi	sp,sp,32
    80006ac4:	00008067          	ret

0000000080006ac8 <initlock>:
    80006ac8:	ff010113          	addi	sp,sp,-16
    80006acc:	00813423          	sd	s0,8(sp)
    80006ad0:	01010413          	addi	s0,sp,16
    80006ad4:	00813403          	ld	s0,8(sp)
    80006ad8:	00b53423          	sd	a1,8(a0)
    80006adc:	00052023          	sw	zero,0(a0)
    80006ae0:	00053823          	sd	zero,16(a0)
    80006ae4:	01010113          	addi	sp,sp,16
    80006ae8:	00008067          	ret

0000000080006aec <acquire>:
    80006aec:	fe010113          	addi	sp,sp,-32
    80006af0:	00813823          	sd	s0,16(sp)
    80006af4:	00913423          	sd	s1,8(sp)
    80006af8:	00113c23          	sd	ra,24(sp)
    80006afc:	01213023          	sd	s2,0(sp)
    80006b00:	02010413          	addi	s0,sp,32
    80006b04:	00050493          	mv	s1,a0
    80006b08:	10002973          	csrr	s2,sstatus
    80006b0c:	100027f3          	csrr	a5,sstatus
    80006b10:	ffd7f793          	andi	a5,a5,-3
    80006b14:	10079073          	csrw	sstatus,a5
    80006b18:	fffff097          	auipc	ra,0xfffff
    80006b1c:	8ec080e7          	jalr	-1812(ra) # 80005404 <mycpu>
    80006b20:	07852783          	lw	a5,120(a0)
    80006b24:	06078e63          	beqz	a5,80006ba0 <acquire+0xb4>
    80006b28:	fffff097          	auipc	ra,0xfffff
    80006b2c:	8dc080e7          	jalr	-1828(ra) # 80005404 <mycpu>
    80006b30:	07852783          	lw	a5,120(a0)
    80006b34:	0004a703          	lw	a4,0(s1)
    80006b38:	0017879b          	addiw	a5,a5,1
    80006b3c:	06f52c23          	sw	a5,120(a0)
    80006b40:	04071063          	bnez	a4,80006b80 <acquire+0x94>
    80006b44:	00100713          	li	a4,1
    80006b48:	00070793          	mv	a5,a4
    80006b4c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80006b50:	0007879b          	sext.w	a5,a5
    80006b54:	fe079ae3          	bnez	a5,80006b48 <acquire+0x5c>
    80006b58:	0ff0000f          	fence
    80006b5c:	fffff097          	auipc	ra,0xfffff
    80006b60:	8a8080e7          	jalr	-1880(ra) # 80005404 <mycpu>
    80006b64:	01813083          	ld	ra,24(sp)
    80006b68:	01013403          	ld	s0,16(sp)
    80006b6c:	00a4b823          	sd	a0,16(s1)
    80006b70:	00013903          	ld	s2,0(sp)
    80006b74:	00813483          	ld	s1,8(sp)
    80006b78:	02010113          	addi	sp,sp,32
    80006b7c:	00008067          	ret
    80006b80:	0104b903          	ld	s2,16(s1)
    80006b84:	fffff097          	auipc	ra,0xfffff
    80006b88:	880080e7          	jalr	-1920(ra) # 80005404 <mycpu>
    80006b8c:	faa91ce3          	bne	s2,a0,80006b44 <acquire+0x58>
    80006b90:	00002517          	auipc	a0,0x2
    80006b94:	ac850513          	addi	a0,a0,-1336 # 80008658 <digits+0x20>
    80006b98:	fffff097          	auipc	ra,0xfffff
    80006b9c:	224080e7          	jalr	548(ra) # 80005dbc <panic>
    80006ba0:	00195913          	srli	s2,s2,0x1
    80006ba4:	fffff097          	auipc	ra,0xfffff
    80006ba8:	860080e7          	jalr	-1952(ra) # 80005404 <mycpu>
    80006bac:	00197913          	andi	s2,s2,1
    80006bb0:	07252e23          	sw	s2,124(a0)
    80006bb4:	f75ff06f          	j	80006b28 <acquire+0x3c>

0000000080006bb8 <release>:
    80006bb8:	fe010113          	addi	sp,sp,-32
    80006bbc:	00813823          	sd	s0,16(sp)
    80006bc0:	00113c23          	sd	ra,24(sp)
    80006bc4:	00913423          	sd	s1,8(sp)
    80006bc8:	01213023          	sd	s2,0(sp)
    80006bcc:	02010413          	addi	s0,sp,32
    80006bd0:	00052783          	lw	a5,0(a0)
    80006bd4:	00079a63          	bnez	a5,80006be8 <release+0x30>
    80006bd8:	00002517          	auipc	a0,0x2
    80006bdc:	a8850513          	addi	a0,a0,-1400 # 80008660 <digits+0x28>
    80006be0:	fffff097          	auipc	ra,0xfffff
    80006be4:	1dc080e7          	jalr	476(ra) # 80005dbc <panic>
    80006be8:	01053903          	ld	s2,16(a0)
    80006bec:	00050493          	mv	s1,a0
    80006bf0:	fffff097          	auipc	ra,0xfffff
    80006bf4:	814080e7          	jalr	-2028(ra) # 80005404 <mycpu>
    80006bf8:	fea910e3          	bne	s2,a0,80006bd8 <release+0x20>
    80006bfc:	0004b823          	sd	zero,16(s1)
    80006c00:	0ff0000f          	fence
    80006c04:	0f50000f          	fence	iorw,ow
    80006c08:	0804a02f          	amoswap.w	zero,zero,(s1)
    80006c0c:	ffffe097          	auipc	ra,0xffffe
    80006c10:	7f8080e7          	jalr	2040(ra) # 80005404 <mycpu>
    80006c14:	100027f3          	csrr	a5,sstatus
    80006c18:	0027f793          	andi	a5,a5,2
    80006c1c:	04079a63          	bnez	a5,80006c70 <release+0xb8>
    80006c20:	07852783          	lw	a5,120(a0)
    80006c24:	02f05e63          	blez	a5,80006c60 <release+0xa8>
    80006c28:	fff7871b          	addiw	a4,a5,-1
    80006c2c:	06e52c23          	sw	a4,120(a0)
    80006c30:	00071c63          	bnez	a4,80006c48 <release+0x90>
    80006c34:	07c52783          	lw	a5,124(a0)
    80006c38:	00078863          	beqz	a5,80006c48 <release+0x90>
    80006c3c:	100027f3          	csrr	a5,sstatus
    80006c40:	0027e793          	ori	a5,a5,2
    80006c44:	10079073          	csrw	sstatus,a5
    80006c48:	01813083          	ld	ra,24(sp)
    80006c4c:	01013403          	ld	s0,16(sp)
    80006c50:	00813483          	ld	s1,8(sp)
    80006c54:	00013903          	ld	s2,0(sp)
    80006c58:	02010113          	addi	sp,sp,32
    80006c5c:	00008067          	ret
    80006c60:	00002517          	auipc	a0,0x2
    80006c64:	a2050513          	addi	a0,a0,-1504 # 80008680 <digits+0x48>
    80006c68:	fffff097          	auipc	ra,0xfffff
    80006c6c:	154080e7          	jalr	340(ra) # 80005dbc <panic>
    80006c70:	00002517          	auipc	a0,0x2
    80006c74:	9f850513          	addi	a0,a0,-1544 # 80008668 <digits+0x30>
    80006c78:	fffff097          	auipc	ra,0xfffff
    80006c7c:	144080e7          	jalr	324(ra) # 80005dbc <panic>

0000000080006c80 <holding>:
    80006c80:	00052783          	lw	a5,0(a0)
    80006c84:	00079663          	bnez	a5,80006c90 <holding+0x10>
    80006c88:	00000513          	li	a0,0
    80006c8c:	00008067          	ret
    80006c90:	fe010113          	addi	sp,sp,-32
    80006c94:	00813823          	sd	s0,16(sp)
    80006c98:	00913423          	sd	s1,8(sp)
    80006c9c:	00113c23          	sd	ra,24(sp)
    80006ca0:	02010413          	addi	s0,sp,32
    80006ca4:	01053483          	ld	s1,16(a0)
    80006ca8:	ffffe097          	auipc	ra,0xffffe
    80006cac:	75c080e7          	jalr	1884(ra) # 80005404 <mycpu>
    80006cb0:	01813083          	ld	ra,24(sp)
    80006cb4:	01013403          	ld	s0,16(sp)
    80006cb8:	40a48533          	sub	a0,s1,a0
    80006cbc:	00153513          	seqz	a0,a0
    80006cc0:	00813483          	ld	s1,8(sp)
    80006cc4:	02010113          	addi	sp,sp,32
    80006cc8:	00008067          	ret

0000000080006ccc <push_off>:
    80006ccc:	fe010113          	addi	sp,sp,-32
    80006cd0:	00813823          	sd	s0,16(sp)
    80006cd4:	00113c23          	sd	ra,24(sp)
    80006cd8:	00913423          	sd	s1,8(sp)
    80006cdc:	02010413          	addi	s0,sp,32
    80006ce0:	100024f3          	csrr	s1,sstatus
    80006ce4:	100027f3          	csrr	a5,sstatus
    80006ce8:	ffd7f793          	andi	a5,a5,-3
    80006cec:	10079073          	csrw	sstatus,a5
    80006cf0:	ffffe097          	auipc	ra,0xffffe
    80006cf4:	714080e7          	jalr	1812(ra) # 80005404 <mycpu>
    80006cf8:	07852783          	lw	a5,120(a0)
    80006cfc:	02078663          	beqz	a5,80006d28 <push_off+0x5c>
    80006d00:	ffffe097          	auipc	ra,0xffffe
    80006d04:	704080e7          	jalr	1796(ra) # 80005404 <mycpu>
    80006d08:	07852783          	lw	a5,120(a0)
    80006d0c:	01813083          	ld	ra,24(sp)
    80006d10:	01013403          	ld	s0,16(sp)
    80006d14:	0017879b          	addiw	a5,a5,1
    80006d18:	06f52c23          	sw	a5,120(a0)
    80006d1c:	00813483          	ld	s1,8(sp)
    80006d20:	02010113          	addi	sp,sp,32
    80006d24:	00008067          	ret
    80006d28:	0014d493          	srli	s1,s1,0x1
    80006d2c:	ffffe097          	auipc	ra,0xffffe
    80006d30:	6d8080e7          	jalr	1752(ra) # 80005404 <mycpu>
    80006d34:	0014f493          	andi	s1,s1,1
    80006d38:	06952e23          	sw	s1,124(a0)
    80006d3c:	fc5ff06f          	j	80006d00 <push_off+0x34>

0000000080006d40 <pop_off>:
    80006d40:	ff010113          	addi	sp,sp,-16
    80006d44:	00813023          	sd	s0,0(sp)
    80006d48:	00113423          	sd	ra,8(sp)
    80006d4c:	01010413          	addi	s0,sp,16
    80006d50:	ffffe097          	auipc	ra,0xffffe
    80006d54:	6b4080e7          	jalr	1716(ra) # 80005404 <mycpu>
    80006d58:	100027f3          	csrr	a5,sstatus
    80006d5c:	0027f793          	andi	a5,a5,2
    80006d60:	04079663          	bnez	a5,80006dac <pop_off+0x6c>
    80006d64:	07852783          	lw	a5,120(a0)
    80006d68:	02f05a63          	blez	a5,80006d9c <pop_off+0x5c>
    80006d6c:	fff7871b          	addiw	a4,a5,-1
    80006d70:	06e52c23          	sw	a4,120(a0)
    80006d74:	00071c63          	bnez	a4,80006d8c <pop_off+0x4c>
    80006d78:	07c52783          	lw	a5,124(a0)
    80006d7c:	00078863          	beqz	a5,80006d8c <pop_off+0x4c>
    80006d80:	100027f3          	csrr	a5,sstatus
    80006d84:	0027e793          	ori	a5,a5,2
    80006d88:	10079073          	csrw	sstatus,a5
    80006d8c:	00813083          	ld	ra,8(sp)
    80006d90:	00013403          	ld	s0,0(sp)
    80006d94:	01010113          	addi	sp,sp,16
    80006d98:	00008067          	ret
    80006d9c:	00002517          	auipc	a0,0x2
    80006da0:	8e450513          	addi	a0,a0,-1820 # 80008680 <digits+0x48>
    80006da4:	fffff097          	auipc	ra,0xfffff
    80006da8:	018080e7          	jalr	24(ra) # 80005dbc <panic>
    80006dac:	00002517          	auipc	a0,0x2
    80006db0:	8bc50513          	addi	a0,a0,-1860 # 80008668 <digits+0x30>
    80006db4:	fffff097          	auipc	ra,0xfffff
    80006db8:	008080e7          	jalr	8(ra) # 80005dbc <panic>

0000000080006dbc <push_on>:
    80006dbc:	fe010113          	addi	sp,sp,-32
    80006dc0:	00813823          	sd	s0,16(sp)
    80006dc4:	00113c23          	sd	ra,24(sp)
    80006dc8:	00913423          	sd	s1,8(sp)
    80006dcc:	02010413          	addi	s0,sp,32
    80006dd0:	100024f3          	csrr	s1,sstatus
    80006dd4:	100027f3          	csrr	a5,sstatus
    80006dd8:	0027e793          	ori	a5,a5,2
    80006ddc:	10079073          	csrw	sstatus,a5
    80006de0:	ffffe097          	auipc	ra,0xffffe
    80006de4:	624080e7          	jalr	1572(ra) # 80005404 <mycpu>
    80006de8:	07852783          	lw	a5,120(a0)
    80006dec:	02078663          	beqz	a5,80006e18 <push_on+0x5c>
    80006df0:	ffffe097          	auipc	ra,0xffffe
    80006df4:	614080e7          	jalr	1556(ra) # 80005404 <mycpu>
    80006df8:	07852783          	lw	a5,120(a0)
    80006dfc:	01813083          	ld	ra,24(sp)
    80006e00:	01013403          	ld	s0,16(sp)
    80006e04:	0017879b          	addiw	a5,a5,1
    80006e08:	06f52c23          	sw	a5,120(a0)
    80006e0c:	00813483          	ld	s1,8(sp)
    80006e10:	02010113          	addi	sp,sp,32
    80006e14:	00008067          	ret
    80006e18:	0014d493          	srli	s1,s1,0x1
    80006e1c:	ffffe097          	auipc	ra,0xffffe
    80006e20:	5e8080e7          	jalr	1512(ra) # 80005404 <mycpu>
    80006e24:	0014f493          	andi	s1,s1,1
    80006e28:	06952e23          	sw	s1,124(a0)
    80006e2c:	fc5ff06f          	j	80006df0 <push_on+0x34>

0000000080006e30 <pop_on>:
    80006e30:	ff010113          	addi	sp,sp,-16
    80006e34:	00813023          	sd	s0,0(sp)
    80006e38:	00113423          	sd	ra,8(sp)
    80006e3c:	01010413          	addi	s0,sp,16
    80006e40:	ffffe097          	auipc	ra,0xffffe
    80006e44:	5c4080e7          	jalr	1476(ra) # 80005404 <mycpu>
    80006e48:	100027f3          	csrr	a5,sstatus
    80006e4c:	0027f793          	andi	a5,a5,2
    80006e50:	04078463          	beqz	a5,80006e98 <pop_on+0x68>
    80006e54:	07852783          	lw	a5,120(a0)
    80006e58:	02f05863          	blez	a5,80006e88 <pop_on+0x58>
    80006e5c:	fff7879b          	addiw	a5,a5,-1
    80006e60:	06f52c23          	sw	a5,120(a0)
    80006e64:	07853783          	ld	a5,120(a0)
    80006e68:	00079863          	bnez	a5,80006e78 <pop_on+0x48>
    80006e6c:	100027f3          	csrr	a5,sstatus
    80006e70:	ffd7f793          	andi	a5,a5,-3
    80006e74:	10079073          	csrw	sstatus,a5
    80006e78:	00813083          	ld	ra,8(sp)
    80006e7c:	00013403          	ld	s0,0(sp)
    80006e80:	01010113          	addi	sp,sp,16
    80006e84:	00008067          	ret
    80006e88:	00002517          	auipc	a0,0x2
    80006e8c:	82050513          	addi	a0,a0,-2016 # 800086a8 <digits+0x70>
    80006e90:	fffff097          	auipc	ra,0xfffff
    80006e94:	f2c080e7          	jalr	-212(ra) # 80005dbc <panic>
    80006e98:	00001517          	auipc	a0,0x1
    80006e9c:	7f050513          	addi	a0,a0,2032 # 80008688 <digits+0x50>
    80006ea0:	fffff097          	auipc	ra,0xfffff
    80006ea4:	f1c080e7          	jalr	-228(ra) # 80005dbc <panic>

0000000080006ea8 <__memset>:
    80006ea8:	ff010113          	addi	sp,sp,-16
    80006eac:	00813423          	sd	s0,8(sp)
    80006eb0:	01010413          	addi	s0,sp,16
    80006eb4:	1a060e63          	beqz	a2,80007070 <__memset+0x1c8>
    80006eb8:	40a007b3          	neg	a5,a0
    80006ebc:	0077f793          	andi	a5,a5,7
    80006ec0:	00778693          	addi	a3,a5,7
    80006ec4:	00b00813          	li	a6,11
    80006ec8:	0ff5f593          	andi	a1,a1,255
    80006ecc:	fff6071b          	addiw	a4,a2,-1
    80006ed0:	1b06e663          	bltu	a3,a6,8000707c <__memset+0x1d4>
    80006ed4:	1cd76463          	bltu	a4,a3,8000709c <__memset+0x1f4>
    80006ed8:	1a078e63          	beqz	a5,80007094 <__memset+0x1ec>
    80006edc:	00b50023          	sb	a1,0(a0)
    80006ee0:	00100713          	li	a4,1
    80006ee4:	1ae78463          	beq	a5,a4,8000708c <__memset+0x1e4>
    80006ee8:	00b500a3          	sb	a1,1(a0)
    80006eec:	00200713          	li	a4,2
    80006ef0:	1ae78a63          	beq	a5,a4,800070a4 <__memset+0x1fc>
    80006ef4:	00b50123          	sb	a1,2(a0)
    80006ef8:	00300713          	li	a4,3
    80006efc:	18e78463          	beq	a5,a4,80007084 <__memset+0x1dc>
    80006f00:	00b501a3          	sb	a1,3(a0)
    80006f04:	00400713          	li	a4,4
    80006f08:	1ae78263          	beq	a5,a4,800070ac <__memset+0x204>
    80006f0c:	00b50223          	sb	a1,4(a0)
    80006f10:	00500713          	li	a4,5
    80006f14:	1ae78063          	beq	a5,a4,800070b4 <__memset+0x20c>
    80006f18:	00b502a3          	sb	a1,5(a0)
    80006f1c:	00700713          	li	a4,7
    80006f20:	18e79e63          	bne	a5,a4,800070bc <__memset+0x214>
    80006f24:	00b50323          	sb	a1,6(a0)
    80006f28:	00700e93          	li	t4,7
    80006f2c:	00859713          	slli	a4,a1,0x8
    80006f30:	00e5e733          	or	a4,a1,a4
    80006f34:	01059e13          	slli	t3,a1,0x10
    80006f38:	01c76e33          	or	t3,a4,t3
    80006f3c:	01859313          	slli	t1,a1,0x18
    80006f40:	006e6333          	or	t1,t3,t1
    80006f44:	02059893          	slli	a7,a1,0x20
    80006f48:	40f60e3b          	subw	t3,a2,a5
    80006f4c:	011368b3          	or	a7,t1,a7
    80006f50:	02859813          	slli	a6,a1,0x28
    80006f54:	0108e833          	or	a6,a7,a6
    80006f58:	03059693          	slli	a3,a1,0x30
    80006f5c:	003e589b          	srliw	a7,t3,0x3
    80006f60:	00d866b3          	or	a3,a6,a3
    80006f64:	03859713          	slli	a4,a1,0x38
    80006f68:	00389813          	slli	a6,a7,0x3
    80006f6c:	00f507b3          	add	a5,a0,a5
    80006f70:	00e6e733          	or	a4,a3,a4
    80006f74:	000e089b          	sext.w	a7,t3
    80006f78:	00f806b3          	add	a3,a6,a5
    80006f7c:	00e7b023          	sd	a4,0(a5)
    80006f80:	00878793          	addi	a5,a5,8
    80006f84:	fed79ce3          	bne	a5,a3,80006f7c <__memset+0xd4>
    80006f88:	ff8e7793          	andi	a5,t3,-8
    80006f8c:	0007871b          	sext.w	a4,a5
    80006f90:	01d787bb          	addw	a5,a5,t4
    80006f94:	0ce88e63          	beq	a7,a4,80007070 <__memset+0x1c8>
    80006f98:	00f50733          	add	a4,a0,a5
    80006f9c:	00b70023          	sb	a1,0(a4)
    80006fa0:	0017871b          	addiw	a4,a5,1
    80006fa4:	0cc77663          	bgeu	a4,a2,80007070 <__memset+0x1c8>
    80006fa8:	00e50733          	add	a4,a0,a4
    80006fac:	00b70023          	sb	a1,0(a4)
    80006fb0:	0027871b          	addiw	a4,a5,2
    80006fb4:	0ac77e63          	bgeu	a4,a2,80007070 <__memset+0x1c8>
    80006fb8:	00e50733          	add	a4,a0,a4
    80006fbc:	00b70023          	sb	a1,0(a4)
    80006fc0:	0037871b          	addiw	a4,a5,3
    80006fc4:	0ac77663          	bgeu	a4,a2,80007070 <__memset+0x1c8>
    80006fc8:	00e50733          	add	a4,a0,a4
    80006fcc:	00b70023          	sb	a1,0(a4)
    80006fd0:	0047871b          	addiw	a4,a5,4
    80006fd4:	08c77e63          	bgeu	a4,a2,80007070 <__memset+0x1c8>
    80006fd8:	00e50733          	add	a4,a0,a4
    80006fdc:	00b70023          	sb	a1,0(a4)
    80006fe0:	0057871b          	addiw	a4,a5,5
    80006fe4:	08c77663          	bgeu	a4,a2,80007070 <__memset+0x1c8>
    80006fe8:	00e50733          	add	a4,a0,a4
    80006fec:	00b70023          	sb	a1,0(a4)
    80006ff0:	0067871b          	addiw	a4,a5,6
    80006ff4:	06c77e63          	bgeu	a4,a2,80007070 <__memset+0x1c8>
    80006ff8:	00e50733          	add	a4,a0,a4
    80006ffc:	00b70023          	sb	a1,0(a4)
    80007000:	0077871b          	addiw	a4,a5,7
    80007004:	06c77663          	bgeu	a4,a2,80007070 <__memset+0x1c8>
    80007008:	00e50733          	add	a4,a0,a4
    8000700c:	00b70023          	sb	a1,0(a4)
    80007010:	0087871b          	addiw	a4,a5,8
    80007014:	04c77e63          	bgeu	a4,a2,80007070 <__memset+0x1c8>
    80007018:	00e50733          	add	a4,a0,a4
    8000701c:	00b70023          	sb	a1,0(a4)
    80007020:	0097871b          	addiw	a4,a5,9
    80007024:	04c77663          	bgeu	a4,a2,80007070 <__memset+0x1c8>
    80007028:	00e50733          	add	a4,a0,a4
    8000702c:	00b70023          	sb	a1,0(a4)
    80007030:	00a7871b          	addiw	a4,a5,10
    80007034:	02c77e63          	bgeu	a4,a2,80007070 <__memset+0x1c8>
    80007038:	00e50733          	add	a4,a0,a4
    8000703c:	00b70023          	sb	a1,0(a4)
    80007040:	00b7871b          	addiw	a4,a5,11
    80007044:	02c77663          	bgeu	a4,a2,80007070 <__memset+0x1c8>
    80007048:	00e50733          	add	a4,a0,a4
    8000704c:	00b70023          	sb	a1,0(a4)
    80007050:	00c7871b          	addiw	a4,a5,12
    80007054:	00c77e63          	bgeu	a4,a2,80007070 <__memset+0x1c8>
    80007058:	00e50733          	add	a4,a0,a4
    8000705c:	00b70023          	sb	a1,0(a4)
    80007060:	00d7879b          	addiw	a5,a5,13
    80007064:	00c7f663          	bgeu	a5,a2,80007070 <__memset+0x1c8>
    80007068:	00f507b3          	add	a5,a0,a5
    8000706c:	00b78023          	sb	a1,0(a5)
    80007070:	00813403          	ld	s0,8(sp)
    80007074:	01010113          	addi	sp,sp,16
    80007078:	00008067          	ret
    8000707c:	00b00693          	li	a3,11
    80007080:	e55ff06f          	j	80006ed4 <__memset+0x2c>
    80007084:	00300e93          	li	t4,3
    80007088:	ea5ff06f          	j	80006f2c <__memset+0x84>
    8000708c:	00100e93          	li	t4,1
    80007090:	e9dff06f          	j	80006f2c <__memset+0x84>
    80007094:	00000e93          	li	t4,0
    80007098:	e95ff06f          	j	80006f2c <__memset+0x84>
    8000709c:	00000793          	li	a5,0
    800070a0:	ef9ff06f          	j	80006f98 <__memset+0xf0>
    800070a4:	00200e93          	li	t4,2
    800070a8:	e85ff06f          	j	80006f2c <__memset+0x84>
    800070ac:	00400e93          	li	t4,4
    800070b0:	e7dff06f          	j	80006f2c <__memset+0x84>
    800070b4:	00500e93          	li	t4,5
    800070b8:	e75ff06f          	j	80006f2c <__memset+0x84>
    800070bc:	00600e93          	li	t4,6
    800070c0:	e6dff06f          	j	80006f2c <__memset+0x84>

00000000800070c4 <__memmove>:
    800070c4:	ff010113          	addi	sp,sp,-16
    800070c8:	00813423          	sd	s0,8(sp)
    800070cc:	01010413          	addi	s0,sp,16
    800070d0:	0e060863          	beqz	a2,800071c0 <__memmove+0xfc>
    800070d4:	fff6069b          	addiw	a3,a2,-1
    800070d8:	0006881b          	sext.w	a6,a3
    800070dc:	0ea5e863          	bltu	a1,a0,800071cc <__memmove+0x108>
    800070e0:	00758713          	addi	a4,a1,7
    800070e4:	00a5e7b3          	or	a5,a1,a0
    800070e8:	40a70733          	sub	a4,a4,a0
    800070ec:	0077f793          	andi	a5,a5,7
    800070f0:	00f73713          	sltiu	a4,a4,15
    800070f4:	00174713          	xori	a4,a4,1
    800070f8:	0017b793          	seqz	a5,a5
    800070fc:	00e7f7b3          	and	a5,a5,a4
    80007100:	10078863          	beqz	a5,80007210 <__memmove+0x14c>
    80007104:	00900793          	li	a5,9
    80007108:	1107f463          	bgeu	a5,a6,80007210 <__memmove+0x14c>
    8000710c:	0036581b          	srliw	a6,a2,0x3
    80007110:	fff8081b          	addiw	a6,a6,-1
    80007114:	02081813          	slli	a6,a6,0x20
    80007118:	01d85893          	srli	a7,a6,0x1d
    8000711c:	00858813          	addi	a6,a1,8
    80007120:	00058793          	mv	a5,a1
    80007124:	00050713          	mv	a4,a0
    80007128:	01088833          	add	a6,a7,a6
    8000712c:	0007b883          	ld	a7,0(a5)
    80007130:	00878793          	addi	a5,a5,8
    80007134:	00870713          	addi	a4,a4,8
    80007138:	ff173c23          	sd	a7,-8(a4)
    8000713c:	ff0798e3          	bne	a5,a6,8000712c <__memmove+0x68>
    80007140:	ff867713          	andi	a4,a2,-8
    80007144:	02071793          	slli	a5,a4,0x20
    80007148:	0207d793          	srli	a5,a5,0x20
    8000714c:	00f585b3          	add	a1,a1,a5
    80007150:	40e686bb          	subw	a3,a3,a4
    80007154:	00f507b3          	add	a5,a0,a5
    80007158:	06e60463          	beq	a2,a4,800071c0 <__memmove+0xfc>
    8000715c:	0005c703          	lbu	a4,0(a1)
    80007160:	00e78023          	sb	a4,0(a5)
    80007164:	04068e63          	beqz	a3,800071c0 <__memmove+0xfc>
    80007168:	0015c603          	lbu	a2,1(a1)
    8000716c:	00100713          	li	a4,1
    80007170:	00c780a3          	sb	a2,1(a5)
    80007174:	04e68663          	beq	a3,a4,800071c0 <__memmove+0xfc>
    80007178:	0025c603          	lbu	a2,2(a1)
    8000717c:	00200713          	li	a4,2
    80007180:	00c78123          	sb	a2,2(a5)
    80007184:	02e68e63          	beq	a3,a4,800071c0 <__memmove+0xfc>
    80007188:	0035c603          	lbu	a2,3(a1)
    8000718c:	00300713          	li	a4,3
    80007190:	00c781a3          	sb	a2,3(a5)
    80007194:	02e68663          	beq	a3,a4,800071c0 <__memmove+0xfc>
    80007198:	0045c603          	lbu	a2,4(a1)
    8000719c:	00400713          	li	a4,4
    800071a0:	00c78223          	sb	a2,4(a5)
    800071a4:	00e68e63          	beq	a3,a4,800071c0 <__memmove+0xfc>
    800071a8:	0055c603          	lbu	a2,5(a1)
    800071ac:	00500713          	li	a4,5
    800071b0:	00c782a3          	sb	a2,5(a5)
    800071b4:	00e68663          	beq	a3,a4,800071c0 <__memmove+0xfc>
    800071b8:	0065c703          	lbu	a4,6(a1)
    800071bc:	00e78323          	sb	a4,6(a5)
    800071c0:	00813403          	ld	s0,8(sp)
    800071c4:	01010113          	addi	sp,sp,16
    800071c8:	00008067          	ret
    800071cc:	02061713          	slli	a4,a2,0x20
    800071d0:	02075713          	srli	a4,a4,0x20
    800071d4:	00e587b3          	add	a5,a1,a4
    800071d8:	f0f574e3          	bgeu	a0,a5,800070e0 <__memmove+0x1c>
    800071dc:	02069613          	slli	a2,a3,0x20
    800071e0:	02065613          	srli	a2,a2,0x20
    800071e4:	fff64613          	not	a2,a2
    800071e8:	00e50733          	add	a4,a0,a4
    800071ec:	00c78633          	add	a2,a5,a2
    800071f0:	fff7c683          	lbu	a3,-1(a5)
    800071f4:	fff78793          	addi	a5,a5,-1
    800071f8:	fff70713          	addi	a4,a4,-1
    800071fc:	00d70023          	sb	a3,0(a4)
    80007200:	fec798e3          	bne	a5,a2,800071f0 <__memmove+0x12c>
    80007204:	00813403          	ld	s0,8(sp)
    80007208:	01010113          	addi	sp,sp,16
    8000720c:	00008067          	ret
    80007210:	02069713          	slli	a4,a3,0x20
    80007214:	02075713          	srli	a4,a4,0x20
    80007218:	00170713          	addi	a4,a4,1
    8000721c:	00e50733          	add	a4,a0,a4
    80007220:	00050793          	mv	a5,a0
    80007224:	0005c683          	lbu	a3,0(a1)
    80007228:	00178793          	addi	a5,a5,1
    8000722c:	00158593          	addi	a1,a1,1
    80007230:	fed78fa3          	sb	a3,-1(a5)
    80007234:	fee798e3          	bne	a5,a4,80007224 <__memmove+0x160>
    80007238:	f89ff06f          	j	800071c0 <__memmove+0xfc>

000000008000723c <__putc>:
    8000723c:	fe010113          	addi	sp,sp,-32
    80007240:	00813823          	sd	s0,16(sp)
    80007244:	00113c23          	sd	ra,24(sp)
    80007248:	02010413          	addi	s0,sp,32
    8000724c:	00050793          	mv	a5,a0
    80007250:	fef40593          	addi	a1,s0,-17
    80007254:	00100613          	li	a2,1
    80007258:	00000513          	li	a0,0
    8000725c:	fef407a3          	sb	a5,-17(s0)
    80007260:	fffff097          	auipc	ra,0xfffff
    80007264:	b3c080e7          	jalr	-1220(ra) # 80005d9c <console_write>
    80007268:	01813083          	ld	ra,24(sp)
    8000726c:	01013403          	ld	s0,16(sp)
    80007270:	02010113          	addi	sp,sp,32
    80007274:	00008067          	ret

0000000080007278 <__getc>:
    80007278:	fe010113          	addi	sp,sp,-32
    8000727c:	00813823          	sd	s0,16(sp)
    80007280:	00113c23          	sd	ra,24(sp)
    80007284:	02010413          	addi	s0,sp,32
    80007288:	fe840593          	addi	a1,s0,-24
    8000728c:	00100613          	li	a2,1
    80007290:	00000513          	li	a0,0
    80007294:	fffff097          	auipc	ra,0xfffff
    80007298:	ae8080e7          	jalr	-1304(ra) # 80005d7c <console_read>
    8000729c:	fe844503          	lbu	a0,-24(s0)
    800072a0:	01813083          	ld	ra,24(sp)
    800072a4:	01013403          	ld	s0,16(sp)
    800072a8:	02010113          	addi	sp,sp,32
    800072ac:	00008067          	ret

00000000800072b0 <console_handler>:
    800072b0:	fe010113          	addi	sp,sp,-32
    800072b4:	00813823          	sd	s0,16(sp)
    800072b8:	00113c23          	sd	ra,24(sp)
    800072bc:	00913423          	sd	s1,8(sp)
    800072c0:	02010413          	addi	s0,sp,32
    800072c4:	14202773          	csrr	a4,scause
    800072c8:	100027f3          	csrr	a5,sstatus
    800072cc:	0027f793          	andi	a5,a5,2
    800072d0:	06079e63          	bnez	a5,8000734c <console_handler+0x9c>
    800072d4:	00074c63          	bltz	a4,800072ec <console_handler+0x3c>
    800072d8:	01813083          	ld	ra,24(sp)
    800072dc:	01013403          	ld	s0,16(sp)
    800072e0:	00813483          	ld	s1,8(sp)
    800072e4:	02010113          	addi	sp,sp,32
    800072e8:	00008067          	ret
    800072ec:	0ff77713          	andi	a4,a4,255
    800072f0:	00900793          	li	a5,9
    800072f4:	fef712e3          	bne	a4,a5,800072d8 <console_handler+0x28>
    800072f8:	ffffe097          	auipc	ra,0xffffe
    800072fc:	6dc080e7          	jalr	1756(ra) # 800059d4 <plic_claim>
    80007300:	00a00793          	li	a5,10
    80007304:	00050493          	mv	s1,a0
    80007308:	02f50c63          	beq	a0,a5,80007340 <console_handler+0x90>
    8000730c:	fc0506e3          	beqz	a0,800072d8 <console_handler+0x28>
    80007310:	00050593          	mv	a1,a0
    80007314:	00001517          	auipc	a0,0x1
    80007318:	29c50513          	addi	a0,a0,668 # 800085b0 <_ZL6digits+0xe8>
    8000731c:	fffff097          	auipc	ra,0xfffff
    80007320:	afc080e7          	jalr	-1284(ra) # 80005e18 <__printf>
    80007324:	01013403          	ld	s0,16(sp)
    80007328:	01813083          	ld	ra,24(sp)
    8000732c:	00048513          	mv	a0,s1
    80007330:	00813483          	ld	s1,8(sp)
    80007334:	02010113          	addi	sp,sp,32
    80007338:	ffffe317          	auipc	t1,0xffffe
    8000733c:	6d430067          	jr	1748(t1) # 80005a0c <plic_complete>
    80007340:	fffff097          	auipc	ra,0xfffff
    80007344:	3e0080e7          	jalr	992(ra) # 80006720 <uartintr>
    80007348:	fddff06f          	j	80007324 <console_handler+0x74>
    8000734c:	00001517          	auipc	a0,0x1
    80007350:	36450513          	addi	a0,a0,868 # 800086b0 <digits+0x78>
    80007354:	fffff097          	auipc	ra,0xfffff
    80007358:	a68080e7          	jalr	-1432(ra) # 80005dbc <panic>
	...
