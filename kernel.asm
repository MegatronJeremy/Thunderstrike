
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000a117          	auipc	sp,0xa
    80000004:	cd813103          	ld	sp,-808(sp) # 80009cd8 <_GLOBAL_OFFSET_TABLE_+0x20>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	010050ef          	jal	ra,8000502c <start>

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
    80001030:	d1c53503          	ld	a0,-740(a0) # 80009d48 <_ZN3TCB7runningE>
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
    800010c8:	088010ef          	jal	ra,80002150 <_ZN5Riscv20handleSupervisorTrapEv>

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
    80001160:	bec53503          	ld	a0,-1044(a0) # 80009d48 <_ZN3TCB7runningE>
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
    800011c0:	0a800513          	li	a0,168
    800011c4:	00001097          	auipc	ra,0x1
    800011c8:	df0080e7          	jalr	-528(ra) # 80001fb4 <_Z7kmallocm>
    800011cc:	00050493          	mv	s1,a0
    idleThread = new TCB([](void *){IdleThread::getInstance()->run();}, nullptr, DEFAULT_TIME_SLICE);
    800011d0:	00000713          	li	a4,0
    800011d4:	00200693          	li	a3,2
    800011d8:	00000613          	li	a2,0
    800011dc:	00000597          	auipc	a1,0x0
    800011e0:	0ec58593          	addi	a1,a1,236 # 800012c8 <_ZZN10IdleThreadC4EvENUlPvE_4_FUNES0_>
    800011e4:	00002097          	auipc	ra,0x2
    800011e8:	90c080e7          	jalr	-1780(ra) # 80002af0 <_ZN3TCBC1EPFvPvES0_mb>
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
    8000121c:	ddc080e7          	jalr	-548(ra) # 80001ff4 <_Z5kfreePv>
    80001220:	00090513          	mv	a0,s2
    80001224:	0000a097          	auipc	ra,0xa
    80001228:	c34080e7          	jalr	-972(ra) # 8000ae58 <_Unwind_Resume>

000000008000122c <_ZN10IdleThread11getInstanceEv>:
    if (!instance) instance = new IdleThread;
    8000122c:	00009797          	auipc	a5,0x9
    80001230:	b047b783          	ld	a5,-1276(a5) # 80009d30 <_ZN10IdleThread8instanceE>
    80001234:	00078863          	beqz	a5,80001244 <_ZN10IdleThread11getInstanceEv+0x18>
    return instance;
    80001238:	00009517          	auipc	a0,0x9
    8000123c:	af853503          	ld	a0,-1288(a0) # 80009d30 <_ZN10IdleThread8instanceE>
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
    80001264:	d54080e7          	jalr	-684(ra) # 80001fb4 <_Z7kmallocm>
    80001268:	00050493          	mv	s1,a0
    if (!instance) instance = new IdleThread;
    8000126c:	00000097          	auipc	ra,0x0
    80001270:	f34080e7          	jalr	-204(ra) # 800011a0 <_ZN10IdleThreadC1Ev>
    80001274:	00009797          	auipc	a5,0x9
    80001278:	aa97be23          	sd	s1,-1348(a5) # 80009d30 <_ZN10IdleThread8instanceE>
    return instance;
    8000127c:	00009517          	auipc	a0,0x9
    80001280:	ab453503          	ld	a0,-1356(a0) # 80009d30 <_ZN10IdleThread8instanceE>
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
    800012a8:	d50080e7          	jalr	-688(ra) # 80001ff4 <_Z5kfreePv>
    800012ac:	00090513          	mv	a0,s2
    800012b0:	0000a097          	auipc	ra,0xa
    800012b4:	ba8080e7          	jalr	-1112(ra) # 8000ae58 <_Unwind_Resume>

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
    8000130c:	c80080e7          	jalr	-896(ra) # 80002f88 <_ZN3TCBD1Ev>
    80001310:	00048513          	mv	a0,s1
    80001314:	00001097          	auipc	ra,0x1
    80001318:	ce0080e7          	jalr	-800(ra) # 80001ff4 <_Z5kfreePv>
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
    80001370:	c48080e7          	jalr	-952(ra) # 80001fb4 <_Z7kmallocm>
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
    80001398:	c60080e7          	jalr	-928(ra) # 80001ff4 <_Z5kfreePv>
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
    800013ec:	84c080e7          	jalr	-1972(ra) # 80002c34 <_ZN3TCB12createThreadEPFvPvES0_>
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
    80001410:	998080e7          	jalr	-1640(ra) # 80002da4 <_ZN3TCB4exitEv>
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
    8000143c:	8a8080e7          	jalr	-1880(ra) # 80002ce0 <_ZN3TCB8dispatchEv>
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
    80001498:	b20080e7          	jalr	-1248(ra) # 80001fb4 <_Z7kmallocm>

class TCB;

class KernelSemaphore : public KernelObject {
public:
    KernelSemaphore(int val = 1) : val(val) {}
    8000149c:	01252023          	sw	s2,0(a0)
#include "KernelObject.h"

template<typename T>
class List : public KernelObject {
public:
    explicit List() = default;
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
    800014ec:	4d0080e7          	jalr	1232(ra) # 800019b8 <_ZN15KernelSemaphoreD1Ev>
        kfree(addr);
    800014f0:	00090513          	mv	a0,s2
    800014f4:	00001097          	auipc	ra,0x1
    800014f8:	b00080e7          	jalr	-1280(ra) # 80001ff4 <_Z5kfreePv>
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
    8000154c:	3b4080e7          	jalr	948(ra) # 800018fc <_ZN15KernelSemaphore4waitEv>
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
    80001594:	3cc080e7          	jalr	972(ra) # 8000195c <_ZN15KernelSemaphore6signalEv>
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
    800015d0:	00008797          	auipc	a5,0x8
    800015d4:	7107b783          	ld	a5,1808(a5) # 80009ce0 <_GLOBAL_OFFSET_TABLE_+0x28>
    800015d8:	0007b503          	ld	a0,0(a5)
    800015dc:	00002097          	auipc	ra,0x2
    800015e0:	f18080e7          	jalr	-232(ra) # 800034f4 <_ZN14TimerInterrupt5blockEP3TCBm>
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
    8000160c:	b20080e7          	jalr	-1248(ra) # 80007128 <__getc>
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
    80001634:	abc080e7          	jalr	-1348(ra) # 800070ec <__putc>
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
    80001664:	6807b783          	ld	a5,1664(a5) # 80009ce0 <_GLOBAL_OFFSET_TABLE_+0x28>
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
    80001798:	174080e7          	jalr	372(ra) # 80002908 <_Z12kprintStringPKc>
            kprintUnsigned(code);
    8000179c:	00090513          	mv	a0,s2
    800017a0:	00001097          	auipc	ra,0x1
    800017a4:	26c080e7          	jalr	620(ra) # 80002a0c <_Z14kprintUnsignedm>
            kprintString("\n");
    800017a8:	00007517          	auipc	a0,0x7
    800017ac:	9e050513          	addi	a0,a0,-1568 # 80008188 <CONSOLE_STATUS+0x178>
    800017b0:	00001097          	auipc	ra,0x1
    800017b4:	158080e7          	jalr	344(ra) # 80002908 <_Z12kprintStringPKc>
            return;
    800017b8:	f11ff06f          	j	800016c8 <_ZN6Kernel16handleSystemCallEv+0x80>

00000000800017bc <_ZN15KernelSemaphore5blockEv>:
#include "../h/Riscv.h"
#include "../h/TCB.h"
#include "../h/Scheduler.h"
#include "../h/SysPrint.h"

void KernelSemaphore::block() {
    800017bc:	fd010113          	addi	sp,sp,-48
    800017c0:	02113423          	sd	ra,40(sp)
    800017c4:	02813023          	sd	s0,32(sp)
    800017c8:	00913c23          	sd	s1,24(sp)
    800017cc:	01213823          	sd	s2,16(sp)
    800017d0:	01313423          	sd	s3,8(sp)
    800017d4:	03010413          	addi	s0,sp,48
    800017d8:	00050913          	mv	s2,a0
    blockedThreadQueue.addLast(TCB::running);
    800017dc:	00850493          	addi	s1,a0,8
    800017e0:	00008797          	auipc	a5,0x8
    800017e4:	5007b783          	ld	a5,1280(a5) # 80009ce0 <_GLOBAL_OFFSET_TABLE_+0x28>
    800017e8:	0007b983          	ld	s3,0(a5)
        return kmalloc(size);
    800017ec:	01800513          	li	a0,24
    800017f0:	00000097          	auipc	ra,0x0
    800017f4:	7c4080e7          	jalr	1988(ra) # 80001fb4 <_Z7kmallocm>

        size++;
    }

    void addLast(T *data) {
        Node *elem = new Node(data, nullptr, tail);
    800017f8:	0084b783          	ld	a5,8(s1)

private:
    struct Node : public KernelObject {
        T *data;
        Node *next, *prev;
        Node(T *data, Node *next = nullptr, Node *prev = nullptr) : data(data), next(next), prev(prev) {}
    800017fc:	01353023          	sd	s3,0(a0)
    80001800:	00053423          	sd	zero,8(a0)
    80001804:	00f53823          	sd	a5,16(a0)
        if (tail) tail->next = elem;
    80001808:	0084b783          	ld	a5,8(s1)
    8000180c:	04078863          	beqz	a5,8000185c <_ZN15KernelSemaphore5blockEv+0xa0>
    80001810:	00a7b423          	sd	a0,8(a5)
        tail = elem;
    80001814:	00a4b423          	sd	a0,8(s1)
        size++;
    80001818:	0184a783          	lw	a5,24(s1)
    8000181c:	0017879b          	addiw	a5,a5,1
    80001820:	00f4ac23          	sw	a5,24(s1)
    // setjmp
    TCB::running->setBlocked();
    80001824:	00008797          	auipc	a5,0x8
    80001828:	4bc7b783          	ld	a5,1212(a5) # 80009ce0 <_GLOBAL_OFFSET_TABLE_+0x28>
    8000182c:	0007b783          	ld	a5,0(a5)
        status = BLOCKED;
    80001830:	00200713          	li	a4,2
    80001834:	04e7a023          	sw	a4,64(a5)
    TCB::dispatch();
    80001838:	00001097          	auipc	ra,0x1
    8000183c:	4a8080e7          	jalr	1192(ra) # 80002ce0 <_ZN3TCB8dispatchEv>
}
    80001840:	02813083          	ld	ra,40(sp)
    80001844:	02013403          	ld	s0,32(sp)
    80001848:	01813483          	ld	s1,24(sp)
    8000184c:	01013903          	ld	s2,16(sp)
    80001850:	00813983          	ld	s3,8(sp)
    80001854:	03010113          	addi	sp,sp,48
    80001858:	00008067          	ret
        else head = elem;
    8000185c:	00a93423          	sd	a0,8(s2)
    80001860:	fb5ff06f          	j	80001814 <_ZN15KernelSemaphore5blockEv+0x58>

0000000080001864 <_ZN15KernelSemaphore7deblockEv>:
        return size;
    80001864:	02052703          	lw	a4,32(a0)

void KernelSemaphore::deblock() {
    if (!blockedThreadQueue.getCount()) return;
    80001868:	00071463          	bnez	a4,80001870 <_ZN15KernelSemaphore7deblockEv+0xc>
    8000186c:	00008067          	ret
void KernelSemaphore::deblock() {
    80001870:	fe010113          	addi	sp,sp,-32
    80001874:	00113c23          	sd	ra,24(sp)
    80001878:	00813823          	sd	s0,16(sp)
    8000187c:	00913423          	sd	s1,8(sp)
    80001880:	01213023          	sd	s2,0(sp)
    80001884:	02010413          	addi	s0,sp,32
    80001888:	00050793          	mv	a5,a0
    TCB *tcb = blockedThreadQueue.removeFirst();
    8000188c:	00850493          	addi	s1,a0,8
        if (!head) return nullptr;
    80001890:	00853503          	ld	a0,8(a0)
    80001894:	06050063          	beqz	a0,800018f4 <_ZN15KernelSemaphore7deblockEv+0x90>
        T *data = head->data;
    80001898:	00053903          	ld	s2,0(a0)
        head = head->next;
    8000189c:	00853703          	ld	a4,8(a0)
    800018a0:	00e7b423          	sd	a4,8(a5)
        if (head) head->prev = nullptr;
    800018a4:	04070263          	beqz	a4,800018e8 <_ZN15KernelSemaphore7deblockEv+0x84>
    800018a8:	00073823          	sd	zero,16(a4)
        kfree(addr);
    800018ac:	00000097          	auipc	ra,0x0
    800018b0:	748080e7          	jalr	1864(ra) # 80001ff4 <_Z5kfreePv>
        size--;
    800018b4:	0184a783          	lw	a5,24(s1)
    800018b8:	fff7879b          	addiw	a5,a5,-1
    800018bc:	00f4ac23          	sw	a5,24(s1)
        status = READY;
    800018c0:	04092023          	sw	zero,64(s2)
//    if (!tcb) {
//        kprintString("Queue empty!\n");
//        return;
//    }
    tcb->setReady();
    Scheduler::put(tcb);
    800018c4:	00090513          	mv	a0,s2
    800018c8:	00001097          	auipc	ra,0x1
    800018cc:	bd4080e7          	jalr	-1068(ra) # 8000249c <_ZN9Scheduler3putEP3TCB>
}
    800018d0:	01813083          	ld	ra,24(sp)
    800018d4:	01013403          	ld	s0,16(sp)
    800018d8:	00813483          	ld	s1,8(sp)
    800018dc:	00013903          	ld	s2,0(sp)
    800018e0:	02010113          	addi	sp,sp,32
    800018e4:	00008067          	ret
        else head = tail = nullptr;
    800018e8:	0004b423          	sd	zero,8(s1)
    800018ec:	0007b423          	sd	zero,8(a5)
    800018f0:	fbdff06f          	j	800018ac <_ZN15KernelSemaphore7deblockEv+0x48>
        if (!head) return nullptr;
    800018f4:	00050913          	mv	s2,a0
    800018f8:	fc9ff06f          	j	800018c0 <_ZN15KernelSemaphore7deblockEv+0x5c>

00000000800018fc <_ZN15KernelSemaphore4waitEv>:

void KernelSemaphore::wait() {
    800018fc:	fe010113          	addi	sp,sp,-32
    80001900:	00113c23          	sd	ra,24(sp)
    80001904:	00813823          	sd	s0,16(sp)
    80001908:	02010413          	addi	s0,sp,32
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    8000190c:	100027f3          	csrr	a5,sstatus
    80001910:	fef43023          	sd	a5,-32(s0)
    return sstatus;
    80001914:	fe043783          	ld	a5,-32(s0)
    lock()
    80001918:	fef43423          	sd	a5,-24(s0)
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    8000191c:	00200793          	li	a5,2
    80001920:	1007b073          	csrc	sstatus,a5
    if (--val < 0) block();
    80001924:	00052783          	lw	a5,0(a0)
    80001928:	fff7879b          	addiw	a5,a5,-1
    8000192c:	00f52023          	sw	a5,0(a0)
    80001930:	02079713          	slli	a4,a5,0x20
    80001934:	00074e63          	bltz	a4,80001950 <_ZN15KernelSemaphore4waitEv+0x54>
    unlock()
    80001938:	fe843783          	ld	a5,-24(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    8000193c:	10079073          	csrw	sstatus,a5
}
    80001940:	01813083          	ld	ra,24(sp)
    80001944:	01013403          	ld	s0,16(sp)
    80001948:	02010113          	addi	sp,sp,32
    8000194c:	00008067          	ret
    if (--val < 0) block();
    80001950:	00000097          	auipc	ra,0x0
    80001954:	e6c080e7          	jalr	-404(ra) # 800017bc <_ZN15KernelSemaphore5blockEv>
    80001958:	fe1ff06f          	j	80001938 <_ZN15KernelSemaphore4waitEv+0x3c>

000000008000195c <_ZN15KernelSemaphore6signalEv>:

void KernelSemaphore::signal() {
    8000195c:	fe010113          	addi	sp,sp,-32
    80001960:	00113c23          	sd	ra,24(sp)
    80001964:	00813823          	sd	s0,16(sp)
    80001968:	02010413          	addi	s0,sp,32
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    8000196c:	100027f3          	csrr	a5,sstatus
    80001970:	fef43023          	sd	a5,-32(s0)
    return sstatus;
    80001974:	fe043783          	ld	a5,-32(s0)
    lock()
    80001978:	fef43423          	sd	a5,-24(s0)
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    8000197c:	00200793          	li	a5,2
    80001980:	1007b073          	csrc	sstatus,a5
    if (val++ < 0) deblock();
    80001984:	00052783          	lw	a5,0(a0)
    80001988:	0017871b          	addiw	a4,a5,1
    8000198c:	00e52023          	sw	a4,0(a0)
    80001990:	0007ce63          	bltz	a5,800019ac <_ZN15KernelSemaphore6signalEv+0x50>
    unlock()
    80001994:	fe843783          	ld	a5,-24(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80001998:	10079073          	csrw	sstatus,a5
}
    8000199c:	01813083          	ld	ra,24(sp)
    800019a0:	01013403          	ld	s0,16(sp)
    800019a4:	02010113          	addi	sp,sp,32
    800019a8:	00008067          	ret
    if (val++ < 0) deblock();
    800019ac:	00000097          	auipc	ra,0x0
    800019b0:	eb8080e7          	jalr	-328(ra) # 80001864 <_ZN15KernelSemaphore7deblockEv>
    800019b4:	fe1ff06f          	j	80001994 <_ZN15KernelSemaphore6signalEv+0x38>

00000000800019b8 <_ZN15KernelSemaphoreD1Ev>:

KernelSemaphore::~KernelSemaphore() {
    800019b8:	fd010113          	addi	sp,sp,-48
    800019bc:	02113423          	sd	ra,40(sp)
    800019c0:	02813023          	sd	s0,32(sp)
    800019c4:	00913c23          	sd	s1,24(sp)
    800019c8:	03010413          	addi	s0,sp,48
    800019cc:	00050493          	mv	s1,a0
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    800019d0:	100027f3          	csrr	a5,sstatus
    800019d4:	fcf43c23          	sd	a5,-40(s0)
    return sstatus;
    800019d8:	fd843783          	ld	a5,-40(s0)
    lock()
    800019dc:	fcf43823          	sd	a5,-48(s0)
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    800019e0:	00200793          	li	a5,2
    800019e4:	1007b073          	csrc	sstatus,a5
        return size;
    800019e8:	0204a783          	lw	a5,32(s1)
    while (blockedThreadQueue.getCount() != 0)
    800019ec:	00078a63          	beqz	a5,80001a00 <_ZN15KernelSemaphoreD1Ev+0x48>
        deblock();
    800019f0:	00048513          	mv	a0,s1
    800019f4:	00000097          	auipc	ra,0x0
    800019f8:	e70080e7          	jalr	-400(ra) # 80001864 <_ZN15KernelSemaphore7deblockEv>
    while (blockedThreadQueue.getCount() != 0)
    800019fc:	fedff06f          	j	800019e8 <_ZN15KernelSemaphoreD1Ev+0x30>
    unlock()
    80001a00:	fd043783          	ld	a5,-48(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80001a04:	10079073          	csrw	sstatus,a5
    val = 0;
    80001a08:	0004a023          	sw	zero,0(s1)
        while (head) {
    80001a0c:	0084b503          	ld	a0,8(s1)
    80001a10:	00050e63          	beqz	a0,80001a2c <_ZN15KernelSemaphoreD1Ev+0x74>
    80001a14:	00000097          	auipc	ra,0x0
    80001a18:	5e0080e7          	jalr	1504(ra) # 80001ff4 <_Z5kfreePv>
            head = head->next;
    80001a1c:	0084b783          	ld	a5,8(s1)
    80001a20:	0087b783          	ld	a5,8(a5)
    80001a24:	00f4b423          	sd	a5,8(s1)
        while (head) {
    80001a28:	fe5ff06f          	j	80001a0c <_ZN15KernelSemaphoreD1Ev+0x54>
}
    80001a2c:	02813083          	ld	ra,40(sp)
    80001a30:	02013403          	ld	s0,32(sp)
    80001a34:	01813483          	ld	s1,24(sp)
    80001a38:	03010113          	addi	sp,sp,48
    80001a3c:	00008067          	ret

0000000080001a40 <_ZZ4mainENUlPvE_4_FUNES_>:
    kprintString("Starting main\n");
    TCB *main = TCB::createThread(nullptr, nullptr);
    kprintString("Created main thread\n");
    TCB::running = main;

    TCB *uMain = TCB::createThread([](void *){userMain();}, nullptr);
    80001a40:	ff010113          	addi	sp,sp,-16
    80001a44:	00113423          	sd	ra,8(sp)
    80001a48:	00813023          	sd	s0,0(sp)
    80001a4c:	01010413          	addi	s0,sp,16
    80001a50:	00003097          	auipc	ra,0x3
    80001a54:	40c080e7          	jalr	1036(ra) # 80004e5c <_Z8userMainv>
    80001a58:	00813083          	ld	ra,8(sp)
    80001a5c:	00013403          	ld	s0,0(sp)
    80001a60:	01010113          	addi	sp,sp,16
    80001a64:	00008067          	ret

0000000080001a68 <main>:
int main() {
    80001a68:	fe010113          	addi	sp,sp,-32
    80001a6c:	00113c23          	sd	ra,24(sp)
    80001a70:	00813823          	sd	s0,16(sp)
    80001a74:	00913423          	sd	s1,8(sp)
    80001a78:	01213023          	sd	s2,0(sp)
    80001a7c:	02010413          	addi	s0,sp,32
    kprintString("Starting main\n");
    80001a80:	00006517          	auipc	a0,0x6
    80001a84:	6c850513          	addi	a0,a0,1736 # 80008148 <CONSOLE_STATUS+0x138>
    80001a88:	00001097          	auipc	ra,0x1
    80001a8c:	e80080e7          	jalr	-384(ra) # 80002908 <_Z12kprintStringPKc>
    TCB *main = TCB::createThread(nullptr, nullptr);
    80001a90:	00000593          	li	a1,0
    80001a94:	00000513          	li	a0,0
    80001a98:	00001097          	auipc	ra,0x1
    80001a9c:	19c080e7          	jalr	412(ra) # 80002c34 <_ZN3TCB12createThreadEPFvPvES0_>
    80001aa0:	00050493          	mv	s1,a0
    kprintString("Created main thread\n");
    80001aa4:	00006517          	auipc	a0,0x6
    80001aa8:	6b450513          	addi	a0,a0,1716 # 80008158 <CONSOLE_STATUS+0x148>
    80001aac:	00001097          	auipc	ra,0x1
    80001ab0:	e5c080e7          	jalr	-420(ra) # 80002908 <_Z12kprintStringPKc>
    TCB::running = main;
    80001ab4:	00008797          	auipc	a5,0x8
    80001ab8:	22c7b783          	ld	a5,556(a5) # 80009ce0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001abc:	0097b023          	sd	s1,0(a5)
    TCB *uMain = TCB::createThread([](void *){userMain();}, nullptr);
    80001ac0:	00000593          	li	a1,0
    80001ac4:	00000517          	auipc	a0,0x0
    80001ac8:	f7c50513          	addi	a0,a0,-132 # 80001a40 <_ZZ4mainENUlPvE_4_FUNES_>
    80001acc:	00001097          	auipc	ra,0x1
    80001ad0:	168080e7          	jalr	360(ra) # 80002c34 <_ZN3TCB12createThreadEPFvPvES0_>
    80001ad4:	00050493          	mv	s1,a0
    kprintString("Created user main thread\n");
    80001ad8:	00006517          	auipc	a0,0x6
    80001adc:	69850513          	addi	a0,a0,1688 # 80008170 <CONSOLE_STATUS+0x160>
    80001ae0:	00001097          	auipc	ra,0x1
    80001ae4:	e28080e7          	jalr	-472(ra) # 80002908 <_Z12kprintStringPKc>

    Riscv::w_stvec((uint64) &Riscv::supervisorTrap);
    80001ae8:	00008797          	auipc	a5,0x8
    80001aec:	1e07b783          	ld	a5,480(a5) # 80009cc8 <_GLOBAL_OFFSET_TABLE_+0x10>
    __asm__ volatile ("csrw stvec, %[stvec]" : : [stvec] "r"(stvec));
    80001af0:	10579073          	csrw	stvec,a5
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80001af4:	00200913          	li	s2,2
    80001af8:	10092073          	csrs	sstatus,s2
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    uMain->join();
    80001afc:	00048513          	mv	a0,s1
    80001b00:	00001097          	auipc	ra,0x1
    80001b04:	3b4080e7          	jalr	948(ra) # 80002eb4 <_ZN3TCB4joinEv>
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80001b08:	10093073          	csrc	sstatus,s2

    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);

    delete TimerInterrupt::getInstance();
    80001b0c:	00002097          	auipc	ra,0x2
    80001b10:	968080e7          	jalr	-1688(ra) # 80003474 <_ZN14TimerInterrupt11getInstanceEv>
    80001b14:	00050493          	mv	s1,a0
    80001b18:	00051e63          	bnez	a0,80001b34 <main+0xcc>
    80001b1c:	0380006f          	j	80001b54 <main+0xec>
    80001b20:	00000097          	auipc	ra,0x0
    80001b24:	4d4080e7          	jalr	1236(ra) # 80001ff4 <_Z5kfreePv>
            head = head->next;
    80001b28:	0384b783          	ld	a5,56(s1)
    80001b2c:	0087b783          	ld	a5,8(a5)
    80001b30:	02f4bc23          	sd	a5,56(s1)
        while (head) {
    80001b34:	0384b503          	ld	a0,56(s1)
    80001b38:	fe0514e3          	bnez	a0,80001b20 <main+0xb8>

#include "KernelSemaphore.h"
#include "MemoryAllocator.h"


class Mutex : public KernelSemaphore {
    80001b3c:	00848513          	addi	a0,s1,8
    80001b40:	00000097          	auipc	ra,0x0
    80001b44:	e78080e7          	jalr	-392(ra) # 800019b8 <_ZN15KernelSemaphoreD1Ev>
    80001b48:	00048513          	mv	a0,s1
    80001b4c:	00000097          	auipc	ra,0x0
    80001b50:	4a8080e7          	jalr	1192(ra) # 80001ff4 <_Z5kfreePv>
    delete Scheduler::getInstance();
    80001b54:	00001097          	auipc	ra,0x1
    80001b58:	818080e7          	jalr	-2024(ra) # 8000236c <_ZN9Scheduler11getInstanceEv>
    80001b5c:	00050493          	mv	s1,a0
    80001b60:	02050e63          	beqz	a0,80001b9c <main+0x134>
    80001b64:	02850513          	addi	a0,a0,40
    80001b68:	00000097          	auipc	ra,0x0
    80001b6c:	e50080e7          	jalr	-432(ra) # 800019b8 <_ZN15KernelSemaphoreD1Ev>
    80001b70:	0084b503          	ld	a0,8(s1)
    80001b74:	00050e63          	beqz	a0,80001b90 <main+0x128>
    80001b78:	00000097          	auipc	ra,0x0
    80001b7c:	47c080e7          	jalr	1148(ra) # 80001ff4 <_Z5kfreePv>
            head = head->next;
    80001b80:	0084b783          	ld	a5,8(s1)
    80001b84:	0087b783          	ld	a5,8(a5)
    80001b88:	00f4b423          	sd	a5,8(s1)
        while (head) {
    80001b8c:	fe5ff06f          	j	80001b70 <main+0x108>
    80001b90:	00048513          	mv	a0,s1
    80001b94:	00000097          	auipc	ra,0x0
    80001b98:	460080e7          	jalr	1120(ra) # 80001ff4 <_Z5kfreePv>
    delete ThreadCollector::getInstance();
    80001b9c:	00001097          	auipc	ra,0x1
    80001ba0:	680080e7          	jalr	1664(ra) # 8000321c <_ZN15ThreadCollector11getInstanceEv>
    80001ba4:	00050493          	mv	s1,a0
    80001ba8:	00050c63          	beqz	a0,80001bc0 <main+0x158>
    80001bac:	00001097          	auipc	ra,0x1
    80001bb0:	568080e7          	jalr	1384(ra) # 80003114 <_ZN15ThreadCollectorD1Ev>
    80001bb4:	00048513          	mv	a0,s1
    80001bb8:	00000097          	auipc	ra,0x0
    80001bbc:	43c080e7          	jalr	1084(ra) # 80001ff4 <_Z5kfreePv>
    delete IdleThread::getInstance();
    80001bc0:	fffff097          	auipc	ra,0xfffff
    80001bc4:	66c080e7          	jalr	1644(ra) # 8000122c <_ZN10IdleThread11getInstanceEv>
    80001bc8:	00050493          	mv	s1,a0
    80001bcc:	00050c63          	beqz	a0,80001be4 <main+0x17c>
    80001bd0:	fffff097          	auipc	ra,0xfffff
    80001bd4:	718080e7          	jalr	1816(ra) # 800012e8 <_ZN10IdleThreadD1Ev>
    80001bd8:	00048513          	mv	a0,s1
    80001bdc:	00000097          	auipc	ra,0x0
    80001be0:	418080e7          	jalr	1048(ra) # 80001ff4 <_Z5kfreePv>

    kprintString("Main finished\n");
    80001be4:	00006517          	auipc	a0,0x6
    80001be8:	5ac50513          	addi	a0,a0,1452 # 80008190 <CONSOLE_STATUS+0x180>
    80001bec:	00001097          	auipc	ra,0x1
    80001bf0:	d1c080e7          	jalr	-740(ra) # 80002908 <_Z12kprintStringPKc>

    return 0;
}
    80001bf4:	00000513          	li	a0,0
    80001bf8:	01813083          	ld	ra,24(sp)
    80001bfc:	01013403          	ld	s0,16(sp)
    80001c00:	00813483          	ld	s1,8(sp)
    80001c04:	00013903          	ld	s2,0(sp)
    80001c08:	02010113          	addi	sp,sp,32
    80001c0c:	00008067          	ret

0000000080001c10 <_ZN15MemoryAllocator19initMemoryAllocatorEv>:
#include "../h/SysPrint.h"
#include "../h/Mutex.h"

MemoryAllocator *MemoryAllocator::instance = nullptr;

void MemoryAllocator::initMemoryAllocator() {
    80001c10:	ff010113          	addi	sp,sp,-16
    80001c14:	00813423          	sd	s0,8(sp)
    80001c18:	01010413          	addi	s0,sp,16
    instance = (MemoryAllocator *) HEAP_START_ADDR;
    80001c1c:	00008617          	auipc	a2,0x8
    80001c20:	0a463603          	ld	a2,164(a2) # 80009cc0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001c24:	00063783          	ld	a5,0(a2)
    80001c28:	00008717          	auipc	a4,0x8
    80001c2c:	11070713          	addi	a4,a4,272 # 80009d38 <_ZN15MemoryAllocator8instanceE>
    80001c30:	00f73023          	sd	a5,0(a4)

    instance->mutex = (Mutex *) ((uint8 *) HEAP_START_ADDR + sizeof(MemoryAllocator));
    80001c34:	01078693          	addi	a3,a5,16
    80001c38:	00d7b423          	sd	a3,8(a5)
    instance->mutex->val = 1;
    80001c3c:	00100693          	li	a3,1
    80001c40:	00d7a823          	sw	a3,16(a5)
    instance->freeMemHead = (BlockHeader *) ((uint8 *) HEAP_START_ADDR + sizeof(MemoryAllocator) + sizeof(Mutex));
    80001c44:	04078593          	addi	a1,a5,64
    80001c48:	00b7b023          	sd	a1,0(a5)
    instance->freeMemHead->size = (size_t) ((uint8 *) HEAP_END_ADDR - (uint8 *) HEAP_START_ADDR -
    80001c4c:	00008797          	auipc	a5,0x8
    80001c50:	09c7b783          	ld	a5,156(a5) # 80009ce8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001c54:	0007b783          	ld	a5,0(a5)
    80001c58:	00063603          	ld	a2,0(a2)
    80001c5c:	40c787b3          	sub	a5,a5,a2
    80001c60:	00073603          	ld	a2,0(a4)
    80001c64:	00063603          	ld	a2,0(a2)
                                  sizeof(MemoryAllocator) - sizeof(BlockHeader) - sizeof(Mutex));
    80001c68:	fa878793          	addi	a5,a5,-88
    instance->freeMemHead->size = (size_t) ((uint8 *) HEAP_END_ADDR - (uint8 *) HEAP_START_ADDR -
    80001c6c:	00f63023          	sd	a5,0(a2)
    instance->freeMemHead->free = true;
    80001c70:	00073783          	ld	a5,0(a4)
    80001c74:	0007b703          	ld	a4,0(a5)
    80001c78:	00d70423          	sb	a3,8(a4)
    instance->freeMemHead->next = nullptr;
    80001c7c:	0007b783          	ld	a5,0(a5)
    80001c80:	0007b823          	sd	zero,16(a5)

//    kprintString("Initializing memory allocator: ");
//    kprintUnsigned(instance->freeMemHead->size);
//    kprintString("\n");

}
    80001c84:	00813403          	ld	s0,8(sp)
    80001c88:	01010113          	addi	sp,sp,16
    80001c8c:	00008067          	ret

0000000080001c90 <_ZN15MemoryAllocator11getInstanceEv>:

MemoryAllocator *MemoryAllocator::getInstance() {
    if (!instance) initMemoryAllocator();
    80001c90:	00008797          	auipc	a5,0x8
    80001c94:	0a87b783          	ld	a5,168(a5) # 80009d38 <_ZN15MemoryAllocator8instanceE>
    80001c98:	00078863          	beqz	a5,80001ca8 <_ZN15MemoryAllocator11getInstanceEv+0x18>

    return instance;
}
    80001c9c:	00008517          	auipc	a0,0x8
    80001ca0:	09c53503          	ld	a0,156(a0) # 80009d38 <_ZN15MemoryAllocator8instanceE>
    80001ca4:	00008067          	ret
MemoryAllocator *MemoryAllocator::getInstance() {
    80001ca8:	ff010113          	addi	sp,sp,-16
    80001cac:	00113423          	sd	ra,8(sp)
    80001cb0:	00813023          	sd	s0,0(sp)
    80001cb4:	01010413          	addi	s0,sp,16
    if (!instance) initMemoryAllocator();
    80001cb8:	00000097          	auipc	ra,0x0
    80001cbc:	f58080e7          	jalr	-168(ra) # 80001c10 <_ZN15MemoryAllocator19initMemoryAllocatorEv>
}
    80001cc0:	00008517          	auipc	a0,0x8
    80001cc4:	07853503          	ld	a0,120(a0) # 80009d38 <_ZN15MemoryAllocator8instanceE>
    80001cc8:	00813083          	ld	ra,8(sp)
    80001ccc:	00013403          	ld	s0,0(sp)
    80001cd0:	01010113          	addi	sp,sp,16
    80001cd4:	00008067          	ret

0000000080001cd8 <_ZN15MemoryAllocator6mallocEm>:

void *MemoryAllocator::malloc(size_t size) {
    80001cd8:	fd010113          	addi	sp,sp,-48
    80001cdc:	02113423          	sd	ra,40(sp)
    80001ce0:	02813023          	sd	s0,32(sp)
    80001ce4:	00913c23          	sd	s1,24(sp)
    80001ce8:	01213823          	sd	s2,16(sp)
    80001cec:	01313423          	sd	s3,8(sp)
    80001cf0:	03010413          	addi	s0,sp,48
    // Initial check
    if (!size) return 0;
    80001cf4:	0e058e63          	beqz	a1,80001df0 <_ZN15MemoryAllocator6mallocEm+0x118>
    80001cf8:	00050993          	mv	s3,a0

    // Rounding and aligning size to size of memory blocks
    size = ((size - 1) / MEM_BLOCK_SIZE + 1) * MEM_BLOCK_SIZE;
    80001cfc:	fff58913          	addi	s2,a1,-1
    80001d00:	00695913          	srli	s2,s2,0x6
    80001d04:	00190913          	addi	s2,s2,1
    80001d08:	00691913          	slli	s2,s2,0x6

    mutex->wait();
    80001d0c:	00853503          	ld	a0,8(a0)
    80001d10:	00000097          	auipc	ra,0x0
    80001d14:	324080e7          	jalr	804(ra) # 80002034 <_ZN5Mutex4waitEv>
    // Finding suitable free memory block using first fit algorithm
    BlockHeader *curr = freeMemHead, *prev = nullptr;
    80001d18:	0009b483          	ld	s1,0(s3)
    80001d1c:	00000713          	li	a4,0
    int i = 0;
    while (curr && curr->size < size)
    80001d20:	00048c63          	beqz	s1,80001d38 <_ZN15MemoryAllocator6mallocEm+0x60>
    80001d24:	0004b783          	ld	a5,0(s1)
    80001d28:	0127f863          	bgeu	a5,s2,80001d38 <_ZN15MemoryAllocator6mallocEm+0x60>
        prev = curr, curr = curr->next, i++;
    80001d2c:	00048713          	mv	a4,s1
    80001d30:	0104b483          	ld	s1,16(s1)
    while (curr && curr->size < size)
    80001d34:	fedff06f          	j	80001d20 <_ZN15MemoryAllocator6mallocEm+0x48>
    if (!curr)  {
    80001d38:	04048463          	beqz	s1,80001d80 <_ZN15MemoryAllocator6mallocEm+0xa8>
//        kprintString("Failed allocation\n");
        mutex->signal();
        return nullptr;
    }

    size_t remainingSize = curr->size - size;
    80001d3c:	0004b783          	ld	a5,0(s1)
    80001d40:	412787b3          	sub	a5,a5,s2
    curr->size = size;
    80001d44:	0124b023          	sd	s2,0(s1)
    curr->free = false;
    80001d48:	00048423          	sb	zero,8(s1)
    // Allocating new free memory block if enough size is left over
    if (remainingSize >= MEM_BLOCK_SIZE + sizeof(BlockHeader)) {
    80001d4c:	05700693          	li	a3,87
    80001d50:	04f6f463          	bgeu	a3,a5,80001d98 <_ZN15MemoryAllocator6mallocEm+0xc0>
        BlockHeader *elem = (BlockHeader *) ((uint8 *) curr + sizeof(BlockHeader) + size);
    80001d54:	01890913          	addi	s2,s2,24
    80001d58:	01248933          	add	s2,s1,s2
        elem->size = remainingSize - sizeof(BlockHeader);
    80001d5c:	fe878793          	addi	a5,a5,-24
    80001d60:	00f93023          	sd	a5,0(s2)
        elem->free = true;
    80001d64:	00100793          	li	a5,1
    80001d68:	00f90423          	sb	a5,8(s2)
        elem->next = curr->next;
    80001d6c:	0104b783          	ld	a5,16(s1)
    80001d70:	00f93823          	sd	a5,16(s2)
        (!prev ? freeMemHead : prev->next) = elem;
    80001d74:	00070e63          	beqz	a4,80001d90 <_ZN15MemoryAllocator6mallocEm+0xb8>
    80001d78:	01273823          	sd	s2,16(a4)
    80001d7c:	0340006f          	j	80001db0 <_ZN15MemoryAllocator6mallocEm+0xd8>
        mutex->signal();
    80001d80:	0089b503          	ld	a0,8(s3)
    80001d84:	00000097          	auipc	ra,0x0
    80001d88:	324080e7          	jalr	804(ra) # 800020a8 <_ZN5Mutex6signalEv>
        return nullptr;
    80001d8c:	0380006f          	j	80001dc4 <_ZN15MemoryAllocator6mallocEm+0xec>
        (!prev ? freeMemHead : prev->next) = elem;
    80001d90:	0129b023          	sd	s2,0(s3)
    80001d94:	01c0006f          	j	80001db0 <_ZN15MemoryAllocator6mallocEm+0xd8>
    } else {
        // Removing whole free memory block from free memory list
        (!prev ? freeMemHead : prev->next) = curr->next;
    80001d98:	04070663          	beqz	a4,80001de4 <_ZN15MemoryAllocator6mallocEm+0x10c>
    80001d9c:	0104b683          	ld	a3,16(s1)
    80001da0:	00d73823          	sd	a3,16(a4)
        curr->size += remainingSize;
    80001da4:	0004b703          	ld	a4,0(s1)
    80001da8:	00f707b3          	add	a5,a4,a5
    80001dac:	00f4b023          	sd	a5,0(s1)
    }
    curr->next = nullptr;
    80001db0:	0004b823          	sd	zero,16(s1)

    // Free memory start address after segment descriptor of allocated memory block
    void *addr = (uint8 *) curr + sizeof(BlockHeader);
    80001db4:	01848493          	addi	s1,s1,24
//
//    (!prev ? allocMemHead : prev->next) = curr;
//    curr->next = next;
    //

    mutex->signal();
    80001db8:	0089b503          	ld	a0,8(s3)
    80001dbc:	00000097          	auipc	ra,0x0
    80001dc0:	2ec080e7          	jalr	748(ra) # 800020a8 <_ZN5Mutex6signalEv>

    return addr;
}
    80001dc4:	00048513          	mv	a0,s1
    80001dc8:	02813083          	ld	ra,40(sp)
    80001dcc:	02013403          	ld	s0,32(sp)
    80001dd0:	01813483          	ld	s1,24(sp)
    80001dd4:	01013903          	ld	s2,16(sp)
    80001dd8:	00813983          	ld	s3,8(sp)
    80001ddc:	03010113          	addi	sp,sp,48
    80001de0:	00008067          	ret
        (!prev ? freeMemHead : prev->next) = curr->next;
    80001de4:	0104b703          	ld	a4,16(s1)
    80001de8:	00e9b023          	sd	a4,0(s3)
    80001dec:	fb9ff06f          	j	80001da4 <_ZN15MemoryAllocator6mallocEm+0xcc>
    if (!size) return 0;
    80001df0:	00000493          	li	s1,0
    80001df4:	fd1ff06f          	j	80001dc4 <_ZN15MemoryAllocator6mallocEm+0xec>

0000000080001df8 <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE>:
    mutex->signal();

    return 0;
}

int MemoryAllocator::tryToJoin(MemoryAllocator::BlockHeader *curr) {
    80001df8:	ff010113          	addi	sp,sp,-16
    80001dfc:	00813423          	sd	s0,8(sp)
    80001e00:	01010413          	addi	s0,sp,16
    if (!curr || !curr->next) return -1;
    80001e04:	04050263          	beqz	a0,80001e48 <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE+0x50>
    80001e08:	01053703          	ld	a4,16(a0)
    80001e0c:	04070263          	beqz	a4,80001e50 <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE+0x58>

    if ((uint8 *) curr + sizeof(BlockHeader) + curr->size != (uint8 *) curr->next) return -2;
    80001e10:	00053783          	ld	a5,0(a0)
    80001e14:	01878693          	addi	a3,a5,24
    80001e18:	00d506b3          	add	a3,a0,a3
    80001e1c:	02d71e63          	bne	a4,a3,80001e58 <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE+0x60>

    curr->size += curr->next->size + sizeof(BlockHeader);
    80001e20:	00073683          	ld	a3,0(a4)
    80001e24:	00d787b3          	add	a5,a5,a3
    80001e28:	01878793          	addi	a5,a5,24
    80001e2c:	00f53023          	sd	a5,0(a0)
    curr->next = curr->next->next;
    80001e30:	01073783          	ld	a5,16(a4)
    80001e34:	00f53823          	sd	a5,16(a0)

    return 0;
    80001e38:	00000513          	li	a0,0
}
    80001e3c:	00813403          	ld	s0,8(sp)
    80001e40:	01010113          	addi	sp,sp,16
    80001e44:	00008067          	ret
    if (!curr || !curr->next) return -1;
    80001e48:	fff00513          	li	a0,-1
    80001e4c:	ff1ff06f          	j	80001e3c <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE+0x44>
    80001e50:	fff00513          	li	a0,-1
    80001e54:	fe9ff06f          	j	80001e3c <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE+0x44>
    if ((uint8 *) curr + sizeof(BlockHeader) + curr->size != (uint8 *) curr->next) return -2;
    80001e58:	ffe00513          	li	a0,-2
    80001e5c:	fe1ff06f          	j	80001e3c <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE+0x44>

0000000080001e60 <_ZN15MemoryAllocator4freeEPv>:
    if (!addr
    80001e60:	10058a63          	beqz	a1,80001f74 <_ZN15MemoryAllocator4freeEPv+0x114>
int MemoryAllocator::free(void *addr) {
    80001e64:	fd010113          	addi	sp,sp,-48
    80001e68:	02113423          	sd	ra,40(sp)
    80001e6c:	02813023          	sd	s0,32(sp)
    80001e70:	00913c23          	sd	s1,24(sp)
    80001e74:	01213823          	sd	s2,16(sp)
    80001e78:	01313423          	sd	s3,8(sp)
    80001e7c:	01413023          	sd	s4,0(sp)
    80001e80:	03010413          	addi	s0,sp,48
    80001e84:	00050a13          	mv	s4,a0
    80001e88:	00058913          	mv	s2,a1
        || (uint8 *) addr < (uint8 *) HEAP_START_ADDR + sizeof(MemoryAllocator) + sizeof(BlockHeader) + sizeof(Mutex)
    80001e8c:	00008797          	auipc	a5,0x8
    80001e90:	e347b783          	ld	a5,-460(a5) # 80009cc0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001e94:	0007b783          	ld	a5,0(a5)
    80001e98:	05878793          	addi	a5,a5,88
    80001e9c:	0ef5e063          	bltu	a1,a5,80001f7c <_ZN15MemoryAllocator4freeEPv+0x11c>
        || addr >= HEAP_END_ADDR) {
    80001ea0:	00008797          	auipc	a5,0x8
    80001ea4:	e487b783          	ld	a5,-440(a5) # 80009ce8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001ea8:	0007b783          	ld	a5,0(a5)
    80001eac:	0cf5fc63          	bgeu	a1,a5,80001f84 <_ZN15MemoryAllocator4freeEPv+0x124>
    BlockHeader *elem = (BlockHeader *) ((uint8 *) addr - sizeof(BlockHeader));
    80001eb0:	fe858993          	addi	s3,a1,-24
    if (!elem || elem->free || elem->next) {
    80001eb4:	0c098c63          	beqz	s3,80001f8c <_ZN15MemoryAllocator4freeEPv+0x12c>
    80001eb8:	ff05c783          	lbu	a5,-16(a1)
    80001ebc:	0c079c63          	bnez	a5,80001f94 <_ZN15MemoryAllocator4freeEPv+0x134>
    80001ec0:	ff85b483          	ld	s1,-8(a1)
    80001ec4:	0c049c63          	bnez	s1,80001f9c <_ZN15MemoryAllocator4freeEPv+0x13c>
    mutex->wait();
    80001ec8:	00853503          	ld	a0,8(a0)
    80001ecc:	00000097          	auipc	ra,0x0
    80001ed0:	168080e7          	jalr	360(ra) # 80002034 <_ZN5Mutex4waitEv>
    BlockHeader *curr = freeMemHead, *prev = nullptr;
    80001ed4:	000a3783          	ld	a5,0(s4)
    while (curr && curr < elem)
    80001ed8:	00078a63          	beqz	a5,80001eec <_ZN15MemoryAllocator4freeEPv+0x8c>
    80001edc:	0137f863          	bgeu	a5,s3,80001eec <_ZN15MemoryAllocator4freeEPv+0x8c>
        prev = curr, curr = curr->next;
    80001ee0:	00078493          	mv	s1,a5
    80001ee4:	0107b783          	ld	a5,16(a5)
    while (curr && curr < elem)
    80001ee8:	ff1ff06f          	j	80001ed8 <_ZN15MemoryAllocator4freeEPv+0x78>
    if ((prev && (uint8 *) prev + prev->size + sizeof(BlockHeader) > addr)
    80001eec:	00048a63          	beqz	s1,80001f00 <_ZN15MemoryAllocator4freeEPv+0xa0>
    80001ef0:	0004b703          	ld	a4,0(s1)
    80001ef4:	01870713          	addi	a4,a4,24
    80001ef8:	00e48733          	add	a4,s1,a4
    80001efc:	0ae96463          	bltu	s2,a4,80001fa4 <_ZN15MemoryAllocator4freeEPv+0x144>
        || (curr && (uint8 *) addr + elem->size  > (uint8 *) curr)) {
    80001f00:	00078863          	beqz	a5,80001f10 <_ZN15MemoryAllocator4freeEPv+0xb0>
    80001f04:	fe893703          	ld	a4,-24(s2)
    80001f08:	00e90733          	add	a4,s2,a4
    80001f0c:	0ae7e063          	bltu	a5,a4,80001fac <_ZN15MemoryAllocator4freeEPv+0x14c>
    elem->next = curr;
    80001f10:	fef93c23          	sd	a5,-8(s2)
    elem->free = true;
    80001f14:	00100793          	li	a5,1
    80001f18:	fef90823          	sb	a5,-16(s2)
    (!prev ? freeMemHead : prev->next) = elem;
    80001f1c:	04048863          	beqz	s1,80001f6c <_ZN15MemoryAllocator4freeEPv+0x10c>
    80001f20:	0134b823          	sd	s3,16(s1)
    tryToJoin(elem);
    80001f24:	00098513          	mv	a0,s3
    80001f28:	00000097          	auipc	ra,0x0
    80001f2c:	ed0080e7          	jalr	-304(ra) # 80001df8 <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE>
    tryToJoin(prev);
    80001f30:	00048513          	mv	a0,s1
    80001f34:	00000097          	auipc	ra,0x0
    80001f38:	ec4080e7          	jalr	-316(ra) # 80001df8 <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE>
    mutex->signal();
    80001f3c:	008a3503          	ld	a0,8(s4)
    80001f40:	00000097          	auipc	ra,0x0
    80001f44:	168080e7          	jalr	360(ra) # 800020a8 <_ZN5Mutex6signalEv>
    return 0;
    80001f48:	00000513          	li	a0,0
}
    80001f4c:	02813083          	ld	ra,40(sp)
    80001f50:	02013403          	ld	s0,32(sp)
    80001f54:	01813483          	ld	s1,24(sp)
    80001f58:	01013903          	ld	s2,16(sp)
    80001f5c:	00813983          	ld	s3,8(sp)
    80001f60:	00013a03          	ld	s4,0(sp)
    80001f64:	03010113          	addi	sp,sp,48
    80001f68:	00008067          	ret
    (!prev ? freeMemHead : prev->next) = elem;
    80001f6c:	013a3023          	sd	s3,0(s4)
    80001f70:	fb5ff06f          	j	80001f24 <_ZN15MemoryAllocator4freeEPv+0xc4>
        return -1;
    80001f74:	fff00513          	li	a0,-1
}
    80001f78:	00008067          	ret
        return -1;
    80001f7c:	fff00513          	li	a0,-1
    80001f80:	fcdff06f          	j	80001f4c <_ZN15MemoryAllocator4freeEPv+0xec>
    80001f84:	fff00513          	li	a0,-1
    80001f88:	fc5ff06f          	j	80001f4c <_ZN15MemoryAllocator4freeEPv+0xec>
        return -2;
    80001f8c:	ffe00513          	li	a0,-2
    80001f90:	fbdff06f          	j	80001f4c <_ZN15MemoryAllocator4freeEPv+0xec>
    80001f94:	ffe00513          	li	a0,-2
    80001f98:	fb5ff06f          	j	80001f4c <_ZN15MemoryAllocator4freeEPv+0xec>
    80001f9c:	ffe00513          	li	a0,-2
    80001fa0:	fadff06f          	j	80001f4c <_ZN15MemoryAllocator4freeEPv+0xec>
        return -2;
    80001fa4:	ffe00513          	li	a0,-2
    80001fa8:	fa5ff06f          	j	80001f4c <_ZN15MemoryAllocator4freeEPv+0xec>
    80001fac:	ffe00513          	li	a0,-2
    80001fb0:	f9dff06f          	j	80001f4c <_ZN15MemoryAllocator4freeEPv+0xec>

0000000080001fb4 <_Z7kmallocm>:

void *kmalloc(size_t size) {
    80001fb4:	fe010113          	addi	sp,sp,-32
    80001fb8:	00113c23          	sd	ra,24(sp)
    80001fbc:	00813823          	sd	s0,16(sp)
    80001fc0:	00913423          	sd	s1,8(sp)
    80001fc4:	02010413          	addi	s0,sp,32
    80001fc8:	00050493          	mv	s1,a0
    return MemoryAllocator::getInstance()->malloc(size);
    80001fcc:	00000097          	auipc	ra,0x0
    80001fd0:	cc4080e7          	jalr	-828(ra) # 80001c90 <_ZN15MemoryAllocator11getInstanceEv>
    80001fd4:	00048593          	mv	a1,s1
    80001fd8:	00000097          	auipc	ra,0x0
    80001fdc:	d00080e7          	jalr	-768(ra) # 80001cd8 <_ZN15MemoryAllocator6mallocEm>
}
    80001fe0:	01813083          	ld	ra,24(sp)
    80001fe4:	01013403          	ld	s0,16(sp)
    80001fe8:	00813483          	ld	s1,8(sp)
    80001fec:	02010113          	addi	sp,sp,32
    80001ff0:	00008067          	ret

0000000080001ff4 <_Z5kfreePv>:

int kfree(void *addr) {
    80001ff4:	fe010113          	addi	sp,sp,-32
    80001ff8:	00113c23          	sd	ra,24(sp)
    80001ffc:	00813823          	sd	s0,16(sp)
    80002000:	00913423          	sd	s1,8(sp)
    80002004:	02010413          	addi	s0,sp,32
    80002008:	00050493          	mv	s1,a0
    return MemoryAllocator::getInstance()->free(addr);
    8000200c:	00000097          	auipc	ra,0x0
    80002010:	c84080e7          	jalr	-892(ra) # 80001c90 <_ZN15MemoryAllocator11getInstanceEv>
    80002014:	00048593          	mv	a1,s1
    80002018:	00000097          	auipc	ra,0x0
    8000201c:	e48080e7          	jalr	-440(ra) # 80001e60 <_ZN15MemoryAllocator4freeEPv>
}
    80002020:	01813083          	ld	ra,24(sp)
    80002024:	01013403          	ld	s0,16(sp)
    80002028:	00813483          	ld	s1,8(sp)
    8000202c:	02010113          	addi	sp,sp,32
    80002030:	00008067          	ret

0000000080002034 <_ZN5Mutex4waitEv>:
#include "../h/Mutex.h"
#include "../h/TCB.h"
#include "../h/SysPrint.h"
#include "../h/Riscv.h"

void Mutex::wait() {
    80002034:	fd010113          	addi	sp,sp,-48
    80002038:	02113423          	sd	ra,40(sp)
    8000203c:	02813023          	sd	s0,32(sp)
    80002040:	00913c23          	sd	s1,24(sp)
    80002044:	03010413          	addi	s0,sp,48
    80002048:	00050493          	mv	s1,a0
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    8000204c:	100027f3          	csrr	a5,sstatus
    80002050:	fcf43823          	sd	a5,-48(s0)
    return sstatus;
    80002054:	fd043783          	ld	a5,-48(s0)
    lock()
    80002058:	fcf43c23          	sd	a5,-40(s0)
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    8000205c:	00200793          	li	a5,2
    80002060:	1007b073          	csrc	sstatus,a5
//    kprintString("Waiting on mutex");
//    kprintUnsigned(val);
//    kprintString("\n");
    if (!val) block();
    80002064:	00052783          	lw	a5,0(a0)
    80002068:	02078a63          	beqz	a5,8000209c <_ZN5Mutex4waitEv+0x68>
    holder = TCB::running;
    8000206c:	00008797          	auipc	a5,0x8
    80002070:	c747b783          	ld	a5,-908(a5) # 80009ce0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002074:	0007b783          	ld	a5,0(a5)
    80002078:	02f4b423          	sd	a5,40(s1)
    val = 0;
    8000207c:	0004a023          	sw	zero,0(s1)
    unlock()
    80002080:	fd843783          	ld	a5,-40(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80002084:	10079073          	csrw	sstatus,a5
}
    80002088:	02813083          	ld	ra,40(sp)
    8000208c:	02013403          	ld	s0,32(sp)
    80002090:	01813483          	ld	s1,24(sp)
    80002094:	03010113          	addi	sp,sp,48
    80002098:	00008067          	ret
    if (!val) block();
    8000209c:	fffff097          	auipc	ra,0xfffff
    800020a0:	720080e7          	jalr	1824(ra) # 800017bc <_ZN15KernelSemaphore5blockEv>
    800020a4:	fc9ff06f          	j	8000206c <_ZN5Mutex4waitEv+0x38>

00000000800020a8 <_ZN5Mutex6signalEv>:

void Mutex::signal() {
    if (holder != TCB::running) return;
    800020a8:	02853703          	ld	a4,40(a0)
    800020ac:	00008797          	auipc	a5,0x8
    800020b0:	c347b783          	ld	a5,-972(a5) # 80009ce0 <_GLOBAL_OFFSET_TABLE_+0x28>
    800020b4:	0007b783          	ld	a5,0(a5)
    800020b8:	00f70463          	beq	a4,a5,800020c0 <_ZN5Mutex6signalEv+0x18>
    800020bc:	00008067          	ret
void Mutex::signal() {
    800020c0:	fe010113          	addi	sp,sp,-32
    800020c4:	00113c23          	sd	ra,24(sp)
    800020c8:	00813823          	sd	s0,16(sp)
    800020cc:	02010413          	addi	s0,sp,32
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    800020d0:	100027f3          	csrr	a5,sstatus
    800020d4:	fef43023          	sd	a5,-32(s0)
    return sstatus;
    800020d8:	fe043783          	ld	a5,-32(s0)
    lock()
    800020dc:	fef43423          	sd	a5,-24(s0)
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    800020e0:	00200793          	li	a5,2
    800020e4:	1007b073          	csrc	sstatus,a5
    val = 1;
    800020e8:	00100793          	li	a5,1
    800020ec:	00f52023          	sw	a5,0(a0)
    holder = nullptr;
    800020f0:	02053423          	sd	zero,40(a0)
        return size;
    800020f4:	02052783          	lw	a5,32(a0)
    if (blockedThreadQueue.getCount() != 0)
    800020f8:	00079e63          	bnez	a5,80002114 <_ZN5Mutex6signalEv+0x6c>
        deblock();
    unlock()
    800020fc:	fe843783          	ld	a5,-24(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80002100:	10079073          	csrw	sstatus,a5
}
    80002104:	01813083          	ld	ra,24(sp)
    80002108:	01013403          	ld	s0,16(sp)
    8000210c:	02010113          	addi	sp,sp,32
    80002110:	00008067          	ret
        deblock();
    80002114:	fffff097          	auipc	ra,0xfffff
    80002118:	750080e7          	jalr	1872(ra) # 80001864 <_ZN15KernelSemaphore7deblockEv>
    8000211c:	fe1ff06f          	j	800020fc <_ZN5Mutex6signalEv+0x54>

0000000080002120 <_ZN5Riscv10popSppSpieEv>:
#include "../h/SysPrint.h"
#include "../h/TCB.h"
#include "../h/Kernel.h"
#include "../h/TimerInterrupt.h"

void Riscv::popSppSpie() {
    80002120:	ff010113          	addi	sp,sp,-16
    80002124:	00813423          	sd	s0,8(sp)
    80002128:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    8000212c:	10000793          	li	a5,256
    80002130:	1007b073          	csrc	sstatus,a5
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80002134:	02000793          	li	a5,32
    80002138:	1007a073          	csrs	sstatus,a5
    mc_sstatus(SSTATUS_SPP);
    ms_sstatus(SSTATUS_SPIE);
    __asm__ volatile ("csrw sepc, ra");
    8000213c:	14109073          	csrw	sepc,ra
    __asm__ volatile ("sret");
    80002140:	10200073          	sret
}
    80002144:	00813403          	ld	s0,8(sp)
    80002148:	01010113          	addi	sp,sp,16
    8000214c:	00008067          	ret

0000000080002150 <_ZN5Riscv20handleSupervisorTrapEv>:

void Riscv::handleSupervisorTrap() {
    80002150:	f6010113          	addi	sp,sp,-160
    80002154:	08113c23          	sd	ra,152(sp)
    80002158:	08813823          	sd	s0,144(sp)
    8000215c:	08913423          	sd	s1,136(sp)
    80002160:	09213023          	sd	s2,128(sp)
    80002164:	0a010413          	addi	s0,sp,160
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    80002168:	142027f3          	csrr	a5,scause
    8000216c:	f8f43c23          	sd	a5,-104(s0)
    return scause;
    80002170:	f9843483          	ld	s1,-104(s0)
    uint64 scause = r_scause();
    switch (scause) {
    80002174:	fff00793          	li	a5,-1
    80002178:	03f79793          	slli	a5,a5,0x3f
    8000217c:	00178793          	addi	a5,a5,1
    80002180:	0cf48663          	beq	s1,a5,8000224c <_ZN5Riscv20handleSupervisorTrapEv+0xfc>
    80002184:	fff00793          	li	a5,-1
    80002188:	03f79793          	slli	a5,a5,0x3f
    8000218c:	00178793          	addi	a5,a5,1
    80002190:	0497ea63          	bltu	a5,s1,800021e4 <_ZN5Riscv20handleSupervisorTrapEv+0x94>
    80002194:	00800793          	li	a5,8
    80002198:	06f48463          	beq	s1,a5,80002200 <_ZN5Riscv20handleSupervisorTrapEv+0xb0>
    8000219c:	00900793          	li	a5,9
    800021a0:	14f49263          	bne	s1,a5,800022e4 <_ZN5Riscv20handleSupervisorTrapEv+0x194>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    800021a4:	141027f3          	csrr	a5,sepc
    800021a8:	faf43c23          	sd	a5,-72(s0)
    return sepc;
    800021ac:	fb843783          	ld	a5,-72(s0)
            w_sepc(sepc);
            break;
        }
        case 0x0000000000000009UL: {
            // interrupt: no, cause code: environment call from S-mode (9)
            volatile uint64 sepc = r_sepc() + 4;
    800021b0:	00478793          	addi	a5,a5,4
    800021b4:	f6f43c23          	sd	a5,-136(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    800021b8:	100027f3          	csrr	a5,sstatus
    800021bc:	faf43823          	sd	a5,-80(s0)
    return sstatus;
    800021c0:	fb043783          	ld	a5,-80(s0)
            volatile uint64 sstatus = r_sstatus();
    800021c4:	f8f43023          	sd	a5,-128(s0)
//            kprintString("Ecall from S-mode for thread: ");
//            kprintUnsigned((uint64) TCB::running->getID());
//            kprintString("\n");

            TCB::dispatch();
    800021c8:	00001097          	auipc	ra,0x1
    800021cc:	b18080e7          	jalr	-1256(ra) # 80002ce0 <_ZN3TCB8dispatchEv>

            w_sstatus(sstatus);
    800021d0:	f8043783          	ld	a5,-128(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    800021d4:	10079073          	csrw	sstatus,a5
            w_sepc(sepc);
    800021d8:	f7843783          	ld	a5,-136(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    800021dc:	14179073          	csrw	sepc,a5
}
    800021e0:	0e00006f          	j	800022c0 <_ZN5Riscv20handleSupervisorTrapEv+0x170>
    switch (scause) {
    800021e4:	fff00793          	li	a5,-1
    800021e8:	03f79793          	slli	a5,a5,0x3f
    800021ec:	00978793          	addi	a5,a5,9
    800021f0:	0ef49a63          	bne	s1,a5,800022e4 <_ZN5Riscv20handleSupervisorTrapEv+0x194>
            w_sepc(sepc);
            break;
        }
        case 0x8000000000000009UL: {
            // interrupt: yes, cause code: supervisor external interrupt (console)
            console_handler();
    800021f4:	00005097          	auipc	ra,0x5
    800021f8:	f6c080e7          	jalr	-148(ra) # 80007160 <console_handler>
            break;
    800021fc:	0c40006f          	j	800022c0 <_ZN5Riscv20handleSupervisorTrapEv+0x170>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80002200:	141027f3          	csrr	a5,sepc
    80002204:	faf43423          	sd	a5,-88(s0)
    return sepc;
    80002208:	fa843783          	ld	a5,-88(s0)
            volatile uint64 sepc = r_sepc() + 4;
    8000220c:	00478793          	addi	a5,a5,4
    80002210:	f6f43423          	sd	a5,-152(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80002214:	100027f3          	csrr	a5,sstatus
    80002218:	faf43023          	sd	a5,-96(s0)
    return sstatus;
    8000221c:	fa043783          	ld	a5,-96(s0)
            volatile uint64 sstatus = r_sstatus();
    80002220:	f6f43823          	sd	a5,-144(s0)
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80002224:	00200493          	li	s1,2
    80002228:	1004a073          	csrs	sstatus,s1
            Kernel::handleSystemCall();
    8000222c:	fffff097          	auipc	ra,0xfffff
    80002230:	41c080e7          	jalr	1052(ra) # 80001648 <_ZN6Kernel16handleSystemCallEv>
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80002234:	1004b073          	csrc	sstatus,s1
            w_sstatus(sstatus);
    80002238:	f7043783          	ld	a5,-144(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    8000223c:	10079073          	csrw	sstatus,a5
            w_sepc(sepc);
    80002240:	f6843783          	ld	a5,-152(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80002244:	14179073          	csrw	sepc,a5
}
    80002248:	0780006f          	j	800022c0 <_ZN5Riscv20handleSupervisorTrapEv+0x170>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    8000224c:	141027f3          	csrr	a5,sepc
    80002250:	fcf43423          	sd	a5,-56(s0)
    return sepc;
    80002254:	fc843783          	ld	a5,-56(s0)
            volatile uint64 sepc = r_sepc();
    80002258:	f8f43423          	sd	a5,-120(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    8000225c:	100027f3          	csrr	a5,sstatus
    80002260:	fcf43023          	sd	a5,-64(s0)
    return sstatus;
    80002264:	fc043783          	ld	a5,-64(s0)
            volatile uint64 sstatus = r_sstatus();
    80002268:	f8f43823          	sd	a5,-112(s0)
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    8000226c:	00200913          	li	s2,2
    80002270:	14493073          	csrc	sip,s2
            TCB::timeSliceCounter++;
    80002274:	00008497          	auipc	s1,0x8
    80002278:	a5c4b483          	ld	s1,-1444(s1) # 80009cd0 <_GLOBAL_OFFSET_TABLE_+0x18>
    8000227c:	0004b783          	ld	a5,0(s1)
    80002280:	00178793          	addi	a5,a5,1
    80002284:	00f4b023          	sd	a5,0(s1)
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80002288:	10092073          	csrs	sstatus,s2
            TimerInterrupt::tick();
    8000228c:	00001097          	auipc	ra,0x1
    80002290:	3f4080e7          	jalr	1012(ra) # 80003680 <_ZN14TimerInterrupt4tickEv>
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80002294:	10093073          	csrc	sstatus,s2
            if (TCB::timeSliceCounter >= TCB::running->timeSlice) {
    80002298:	00008797          	auipc	a5,0x8
    8000229c:	a487b783          	ld	a5,-1464(a5) # 80009ce0 <_GLOBAL_OFFSET_TABLE_+0x28>
    800022a0:	0007b783          	ld	a5,0(a5)
    800022a4:	0387b703          	ld	a4,56(a5)
    800022a8:	0004b783          	ld	a5,0(s1)
    800022ac:	02e7f663          	bgeu	a5,a4,800022d8 <_ZN5Riscv20handleSupervisorTrapEv+0x188>
            w_sstatus(sstatus);
    800022b0:	f9043783          	ld	a5,-112(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    800022b4:	10079073          	csrw	sstatus,a5
            w_sepc(sepc);
    800022b8:	f8843783          	ld	a5,-120(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    800022bc:	14179073          	csrw	sepc,a5
            kprintString("\nStval: ");
            kprintUnsigned(r_stval());
            kprintString("\n");
        }
    }
    800022c0:	09813083          	ld	ra,152(sp)
    800022c4:	09013403          	ld	s0,144(sp)
    800022c8:	08813483          	ld	s1,136(sp)
    800022cc:	08013903          	ld	s2,128(sp)
    800022d0:	0a010113          	addi	sp,sp,160
    800022d4:	00008067          	ret
                TCB::dispatch();
    800022d8:	00001097          	auipc	ra,0x1
    800022dc:	a08080e7          	jalr	-1528(ra) # 80002ce0 <_ZN3TCB8dispatchEv>
    800022e0:	fd1ff06f          	j	800022b0 <_ZN5Riscv20handleSupervisorTrapEv+0x160>
            kprintString("Unexpected trap cause:\n");
    800022e4:	00006517          	auipc	a0,0x6
    800022e8:	ebc50513          	addi	a0,a0,-324 # 800081a0 <CONSOLE_STATUS+0x190>
    800022ec:	00000097          	auipc	ra,0x0
    800022f0:	61c080e7          	jalr	1564(ra) # 80002908 <_Z12kprintStringPKc>
            kprintString("Scause: ");
    800022f4:	00006517          	auipc	a0,0x6
    800022f8:	ec450513          	addi	a0,a0,-316 # 800081b8 <CONSOLE_STATUS+0x1a8>
    800022fc:	00000097          	auipc	ra,0x0
    80002300:	60c080e7          	jalr	1548(ra) # 80002908 <_Z12kprintStringPKc>
            kprintUnsigned(scause);
    80002304:	00048513          	mv	a0,s1
    80002308:	00000097          	auipc	ra,0x0
    8000230c:	704080e7          	jalr	1796(ra) # 80002a0c <_Z14kprintUnsignedm>
            kprintString("\nSepc: ");
    80002310:	00006517          	auipc	a0,0x6
    80002314:	eb850513          	addi	a0,a0,-328 # 800081c8 <CONSOLE_STATUS+0x1b8>
    80002318:	00000097          	auipc	ra,0x0
    8000231c:	5f0080e7          	jalr	1520(ra) # 80002908 <_Z12kprintStringPKc>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80002320:	141027f3          	csrr	a5,sepc
    80002324:	fcf43c23          	sd	a5,-40(s0)
    return sepc;
    80002328:	fd843503          	ld	a0,-40(s0)
            kprintUnsigned(r_sepc());
    8000232c:	00000097          	auipc	ra,0x0
    80002330:	6e0080e7          	jalr	1760(ra) # 80002a0c <_Z14kprintUnsignedm>
            kprintString("\nStval: ");
    80002334:	00006517          	auipc	a0,0x6
    80002338:	e9c50513          	addi	a0,a0,-356 # 800081d0 <CONSOLE_STATUS+0x1c0>
    8000233c:	00000097          	auipc	ra,0x0
    80002340:	5cc080e7          	jalr	1484(ra) # 80002908 <_Z12kprintStringPKc>
    __asm__ volatile ("csrr %[stval], stval" : [stval] "=r"(stval));
    80002344:	143027f3          	csrr	a5,stval
    80002348:	fcf43823          	sd	a5,-48(s0)
    return stval;
    8000234c:	fd043503          	ld	a0,-48(s0)
            kprintUnsigned(r_stval());
    80002350:	00000097          	auipc	ra,0x0
    80002354:	6bc080e7          	jalr	1724(ra) # 80002a0c <_Z14kprintUnsignedm>
            kprintString("\n");
    80002358:	00006517          	auipc	a0,0x6
    8000235c:	e3050513          	addi	a0,a0,-464 # 80008188 <CONSOLE_STATUS+0x178>
    80002360:	00000097          	auipc	ra,0x0
    80002364:	5a8080e7          	jalr	1448(ra) # 80002908 <_Z12kprintStringPKc>
    80002368:	f59ff06f          	j	800022c0 <_ZN5Riscv20handleSupervisorTrapEv+0x170>

000000008000236c <_ZN9Scheduler11getInstanceEv>:
    getInstance()->readyThreadQueue.addLast(tcb);
    getInstance()->mutex.signal();
}

Scheduler *Scheduler::getInstance() {
    if (!instance) instance = new Scheduler;
    8000236c:	00008797          	auipc	a5,0x8
    80002370:	9d47b783          	ld	a5,-1580(a5) # 80009d40 <_ZN9Scheduler8instanceE>
    80002374:	00078863          	beqz	a5,80002384 <_ZN9Scheduler11getInstanceEv+0x18>
    return instance;
}
    80002378:	00008517          	auipc	a0,0x8
    8000237c:	9c853503          	ld	a0,-1592(a0) # 80009d40 <_ZN9Scheduler8instanceE>
    80002380:	00008067          	ret
Scheduler *Scheduler::getInstance() {
    80002384:	ff010113          	addi	sp,sp,-16
    80002388:	00113423          	sd	ra,8(sp)
    8000238c:	00813023          	sd	s0,0(sp)
    80002390:	01010413          	addi	s0,sp,16
        return kmalloc(size);
    80002394:	05800513          	li	a0,88
    80002398:	00000097          	auipc	ra,0x0
    8000239c:	c1c080e7          	jalr	-996(ra) # 80001fb4 <_Z7kmallocm>
    explicit List() = default;
    800023a0:	00053423          	sd	zero,8(a0)
    800023a4:	00053823          	sd	zero,16(a0)
    800023a8:	00053c23          	sd	zero,24(a0)
    800023ac:	02052023          	sw	zero,32(a0)
    800023b0:	00100793          	li	a5,1
    800023b4:	02f52423          	sw	a5,40(a0)
    800023b8:	02053823          	sd	zero,48(a0)
    800023bc:	02053c23          	sd	zero,56(a0)
    800023c0:	04053023          	sd	zero,64(a0)
    800023c4:	04052423          	sw	zero,72(a0)
    800023c8:	04053823          	sd	zero,80(a0)
    if (!instance) instance = new Scheduler;
    800023cc:	00008797          	auipc	a5,0x8
    800023d0:	96a7ba23          	sd	a0,-1676(a5) # 80009d40 <_ZN9Scheduler8instanceE>
}
    800023d4:	00008517          	auipc	a0,0x8
    800023d8:	96c53503          	ld	a0,-1684(a0) # 80009d40 <_ZN9Scheduler8instanceE>
    800023dc:	00813083          	ld	ra,8(sp)
    800023e0:	00013403          	ld	s0,0(sp)
    800023e4:	01010113          	addi	sp,sp,16
    800023e8:	00008067          	ret

00000000800023ec <_ZN9Scheduler3getEv>:
TCB *Scheduler::get() {
    800023ec:	fe010113          	addi	sp,sp,-32
    800023f0:	00113c23          	sd	ra,24(sp)
    800023f4:	00813823          	sd	s0,16(sp)
    800023f8:	00913423          	sd	s1,8(sp)
    800023fc:	01213023          	sd	s2,0(sp)
    80002400:	02010413          	addi	s0,sp,32
    getInstance()->mutex.wait();
    80002404:	00000097          	auipc	ra,0x0
    80002408:	f68080e7          	jalr	-152(ra) # 8000236c <_ZN9Scheduler11getInstanceEv>
    8000240c:	02850513          	addi	a0,a0,40
    80002410:	00000097          	auipc	ra,0x0
    80002414:	c24080e7          	jalr	-988(ra) # 80002034 <_ZN5Mutex4waitEv>
    TCB *tcb = getInstance()->readyThreadQueue.removeFirst();
    80002418:	00000097          	auipc	ra,0x0
    8000241c:	f54080e7          	jalr	-172(ra) # 8000236c <_ZN9Scheduler11getInstanceEv>
    80002420:	00050793          	mv	a5,a0
    80002424:	00850493          	addi	s1,a0,8
        if (!head) return nullptr;
    80002428:	00853503          	ld	a0,8(a0)
    8000242c:	06050463          	beqz	a0,80002494 <_ZN9Scheduler3getEv+0xa8>
        T *data = head->data;
    80002430:	00053903          	ld	s2,0(a0)
        head = head->next;
    80002434:	00853703          	ld	a4,8(a0)
    80002438:	00e7b423          	sd	a4,8(a5)
        if (head) head->prev = nullptr;
    8000243c:	04070663          	beqz	a4,80002488 <_ZN9Scheduler3getEv+0x9c>
    80002440:	00073823          	sd	zero,16(a4)
        kfree(addr);
    80002444:	00000097          	auipc	ra,0x0
    80002448:	bb0080e7          	jalr	-1104(ra) # 80001ff4 <_Z5kfreePv>
        size--;
    8000244c:	0184a783          	lw	a5,24(s1)
    80002450:	fff7879b          	addiw	a5,a5,-1
    80002454:	00f4ac23          	sw	a5,24(s1)
    getInstance()->mutex.signal();
    80002458:	00000097          	auipc	ra,0x0
    8000245c:	f14080e7          	jalr	-236(ra) # 8000236c <_ZN9Scheduler11getInstanceEv>
    80002460:	02850513          	addi	a0,a0,40
    80002464:	00000097          	auipc	ra,0x0
    80002468:	c44080e7          	jalr	-956(ra) # 800020a8 <_ZN5Mutex6signalEv>
}
    8000246c:	00090513          	mv	a0,s2
    80002470:	01813083          	ld	ra,24(sp)
    80002474:	01013403          	ld	s0,16(sp)
    80002478:	00813483          	ld	s1,8(sp)
    8000247c:	00013903          	ld	s2,0(sp)
    80002480:	02010113          	addi	sp,sp,32
    80002484:	00008067          	ret
        else head = tail = nullptr;
    80002488:	0004b423          	sd	zero,8(s1)
    8000248c:	0007b423          	sd	zero,8(a5)
    80002490:	fb5ff06f          	j	80002444 <_ZN9Scheduler3getEv+0x58>
        if (!head) return nullptr;
    80002494:	00050913          	mv	s2,a0
    80002498:	fc1ff06f          	j	80002458 <_ZN9Scheduler3getEv+0x6c>

000000008000249c <_ZN9Scheduler3putEP3TCB>:
void Scheduler::put(TCB *tcb) {
    8000249c:	fd010113          	addi	sp,sp,-48
    800024a0:	02113423          	sd	ra,40(sp)
    800024a4:	02813023          	sd	s0,32(sp)
    800024a8:	00913c23          	sd	s1,24(sp)
    800024ac:	01213823          	sd	s2,16(sp)
    800024b0:	01313423          	sd	s3,8(sp)
    800024b4:	03010413          	addi	s0,sp,48
    800024b8:	00050993          	mv	s3,a0
    getInstance()->mutex.wait();
    800024bc:	00000097          	auipc	ra,0x0
    800024c0:	eb0080e7          	jalr	-336(ra) # 8000236c <_ZN9Scheduler11getInstanceEv>
    800024c4:	02850513          	addi	a0,a0,40
    800024c8:	00000097          	auipc	ra,0x0
    800024cc:	b6c080e7          	jalr	-1172(ra) # 80002034 <_ZN5Mutex4waitEv>
    getInstance()->readyThreadQueue.addLast(tcb);
    800024d0:	00000097          	auipc	ra,0x0
    800024d4:	e9c080e7          	jalr	-356(ra) # 8000236c <_ZN9Scheduler11getInstanceEv>
    800024d8:	00050913          	mv	s2,a0
    800024dc:	00850493          	addi	s1,a0,8
        return kmalloc(size);
    800024e0:	01800513          	li	a0,24
    800024e4:	00000097          	auipc	ra,0x0
    800024e8:	ad0080e7          	jalr	-1328(ra) # 80001fb4 <_Z7kmallocm>
    800024ec:	00050793          	mv	a5,a0
        Node *elem = new Node(data, nullptr, tail);
    800024f0:	0084b703          	ld	a4,8(s1)
        Node(T *data, Node *next = nullptr, Node *prev = nullptr) : data(data), next(next), prev(prev) {}
    800024f4:	01353023          	sd	s3,0(a0)
    800024f8:	00053423          	sd	zero,8(a0)
    800024fc:	00e53823          	sd	a4,16(a0)
        if (tail) tail->next = elem;
    80002500:	0084b703          	ld	a4,8(s1)
    80002504:	04070463          	beqz	a4,8000254c <_ZN9Scheduler3putEP3TCB+0xb0>
    80002508:	00a73423          	sd	a0,8(a4)
        tail = elem;
    8000250c:	00f4b423          	sd	a5,8(s1)
        size++;
    80002510:	0184a783          	lw	a5,24(s1)
    80002514:	0017879b          	addiw	a5,a5,1
    80002518:	00f4ac23          	sw	a5,24(s1)
    getInstance()->mutex.signal();
    8000251c:	00000097          	auipc	ra,0x0
    80002520:	e50080e7          	jalr	-432(ra) # 8000236c <_ZN9Scheduler11getInstanceEv>
    80002524:	02850513          	addi	a0,a0,40
    80002528:	00000097          	auipc	ra,0x0
    8000252c:	b80080e7          	jalr	-1152(ra) # 800020a8 <_ZN5Mutex6signalEv>
}
    80002530:	02813083          	ld	ra,40(sp)
    80002534:	02013403          	ld	s0,32(sp)
    80002538:	01813483          	ld	s1,24(sp)
    8000253c:	01013903          	ld	s2,16(sp)
    80002540:	00813983          	ld	s3,8(sp)
    80002544:	03010113          	addi	sp,sp,48
    80002548:	00008067          	ret
        else head = elem;
    8000254c:	00a93423          	sd	a0,8(s2)
    80002550:	fbdff06f          	j	8000250c <_ZN9Scheduler3putEP3TCB+0x70>

0000000080002554 <_Z18callSupervisorTrapmPv>:
#include "../h/syscall_c.h"
#include "../h/SysPrint.h"


void *callSupervisorTrap(uint64 param, void *args) {
    80002554:	ff010113          	addi	sp,sp,-16
    80002558:	00813423          	sd	s0,8(sp)
    8000255c:	01010413          	addi	s0,sp,16
    __asm__ volatile ("ecall");
    80002560:	00000073          	ecall

    return (void *) param;
}
    80002564:	00813403          	ld	s0,8(sp)
    80002568:	01010113          	addi	sp,sp,16
    8000256c:	00008067          	ret

0000000080002570 <_Z9mem_allocm>:

void *mem_alloc(size_t size) {
    80002570:	fe010113          	addi	sp,sp,-32
    80002574:	00113c23          	sd	ra,24(sp)
    80002578:	00813823          	sd	s0,16(sp)
    8000257c:	02010413          	addi	s0,sp,32
    80002580:	fea43423          	sd	a0,-24(s0)
    return callSupervisorTrap(0x01, &size);
    80002584:	fe840593          	addi	a1,s0,-24
    80002588:	00100513          	li	a0,1
    8000258c:	00000097          	auipc	ra,0x0
    80002590:	fc8080e7          	jalr	-56(ra) # 80002554 <_Z18callSupervisorTrapmPv>
}
    80002594:	01813083          	ld	ra,24(sp)
    80002598:	01013403          	ld	s0,16(sp)
    8000259c:	02010113          	addi	sp,sp,32
    800025a0:	00008067          	ret

00000000800025a4 <_Z8mem_freePv>:

int mem_free(void *addr) {
    800025a4:	ff010113          	addi	sp,sp,-16
    800025a8:	00113423          	sd	ra,8(sp)
    800025ac:	00813023          	sd	s0,0(sp)
    800025b0:	01010413          	addi	s0,sp,16
    800025b4:	00050593          	mv	a1,a0
    return (uint64) callSupervisorTrap(0x02, addr);
    800025b8:	00200513          	li	a0,2
    800025bc:	00000097          	auipc	ra,0x0
    800025c0:	f98080e7          	jalr	-104(ra) # 80002554 <_Z18callSupervisorTrapmPv>
}
    800025c4:	0005051b          	sext.w	a0,a0
    800025c8:	00813083          	ld	ra,8(sp)
    800025cc:	00013403          	ld	s0,0(sp)
    800025d0:	01010113          	addi	sp,sp,16
    800025d4:	00008067          	ret

00000000800025d8 <_Z13thread_createPP7_threadPFvPvES2_>:

int thread_create(thread_t *handle, void(*start_routine)(void *), void *arg) {
    if (!handle) return -1;
    800025d8:	06050c63          	beqz	a0,80002650 <_Z13thread_createPP7_threadPFvPvES2_+0x78>
int thread_create(thread_t *handle, void(*start_routine)(void *), void *arg) {
    800025dc:	fb010113          	addi	sp,sp,-80
    800025e0:	04113423          	sd	ra,72(sp)
    800025e4:	04813023          	sd	s0,64(sp)
    800025e8:	02913c23          	sd	s1,56(sp)
    800025ec:	03213823          	sd	s2,48(sp)
    800025f0:	03313423          	sd	s3,40(sp)
    800025f4:	05010413          	addi	s0,sp,80
    800025f8:	00050493          	mv	s1,a0
    800025fc:	00058993          	mv	s3,a1
    80002600:	00060913          	mv	s2,a2
    *handle = new _thread;
    80002604:	01800513          	li	a0,24
    80002608:	00000097          	auipc	ra,0x0
    8000260c:	260080e7          	jalr	608(ra) # 80002868 <_Znwm>
    80002610:	00a4b023          	sd	a0,0(s1)
    uint64 args[] = {(uint64) handle, (uint64) start_routine, (uint64) arg};
    80002614:	fa943c23          	sd	s1,-72(s0)
    80002618:	fd343023          	sd	s3,-64(s0)
    8000261c:	fd243423          	sd	s2,-56(s0)
    return (uint64) callSupervisorTrap(0x11, args);
    80002620:	fb840593          	addi	a1,s0,-72
    80002624:	01100513          	li	a0,17
    80002628:	00000097          	auipc	ra,0x0
    8000262c:	f2c080e7          	jalr	-212(ra) # 80002554 <_Z18callSupervisorTrapmPv>
    80002630:	0005051b          	sext.w	a0,a0
}
    80002634:	04813083          	ld	ra,72(sp)
    80002638:	04013403          	ld	s0,64(sp)
    8000263c:	03813483          	ld	s1,56(sp)
    80002640:	03013903          	ld	s2,48(sp)
    80002644:	02813983          	ld	s3,40(sp)
    80002648:	05010113          	addi	sp,sp,80
    8000264c:	00008067          	ret
    if (!handle) return -1;
    80002650:	fff00513          	li	a0,-1
}
    80002654:	00008067          	ret

0000000080002658 <_Z11thread_exitv>:

int thread_exit() {
    80002658:	ff010113          	addi	sp,sp,-16
    8000265c:	00113423          	sd	ra,8(sp)
    80002660:	00813023          	sd	s0,0(sp)
    80002664:	01010413          	addi	s0,sp,16
    return (uint64) callSupervisorTrap(0x12, 0);
    80002668:	00000593          	li	a1,0
    8000266c:	01200513          	li	a0,18
    80002670:	00000097          	auipc	ra,0x0
    80002674:	ee4080e7          	jalr	-284(ra) # 80002554 <_Z18callSupervisorTrapmPv>
}
    80002678:	0005051b          	sext.w	a0,a0
    8000267c:	00813083          	ld	ra,8(sp)
    80002680:	00013403          	ld	s0,0(sp)
    80002684:	01010113          	addi	sp,sp,16
    80002688:	00008067          	ret

000000008000268c <_Z15thread_dispatchv>:

void thread_dispatch() {
    8000268c:	ff010113          	addi	sp,sp,-16
    80002690:	00113423          	sd	ra,8(sp)
    80002694:	00813023          	sd	s0,0(sp)
    80002698:	01010413          	addi	s0,sp,16
    callSupervisorTrap(0x13, 0);
    8000269c:	00000593          	li	a1,0
    800026a0:	01300513          	li	a0,19
    800026a4:	00000097          	auipc	ra,0x0
    800026a8:	eb0080e7          	jalr	-336(ra) # 80002554 <_Z18callSupervisorTrapmPv>
}
    800026ac:	00813083          	ld	ra,8(sp)
    800026b0:	00013403          	ld	s0,0(sp)
    800026b4:	01010113          	addi	sp,sp,16
    800026b8:	00008067          	ret

00000000800026bc <_Z8sem_openPP4_semj>:

int sem_open(sem_t *handle, unsigned init) {
    if (!handle) return -1;
    800026bc:	06050863          	beqz	a0,8000272c <_Z8sem_openPP4_semj+0x70>
int sem_open(sem_t *handle, unsigned init) {
    800026c0:	fd010113          	addi	sp,sp,-48
    800026c4:	02113423          	sd	ra,40(sp)
    800026c8:	02813023          	sd	s0,32(sp)
    800026cc:	00913c23          	sd	s1,24(sp)
    800026d0:	01213823          	sd	s2,16(sp)
    800026d4:	03010413          	addi	s0,sp,48
    800026d8:	00050913          	mv	s2,a0
    800026dc:	00058493          	mv	s1,a1
    *handle = new _sem;
    800026e0:	00800513          	li	a0,8
    800026e4:	00000097          	auipc	ra,0x0
    800026e8:	184080e7          	jalr	388(ra) # 80002868 <_Znwm>
    800026ec:	00a93023          	sd	a0,0(s2)
//    kprintString("\n");
//    kprintString("Handle address: ");
//    kprintUnsigned((uint64) *handle);
//    kprintString("\n");

    uint64 args[] = {(uint64) *handle, (uint64) init};
    800026f0:	fca43823          	sd	a0,-48(s0)
    800026f4:	02049593          	slli	a1,s1,0x20
    800026f8:	0205d593          	srli	a1,a1,0x20
    800026fc:	fcb43c23          	sd	a1,-40(s0)
    return (uint64) callSupervisorTrap(0x21, args);
    80002700:	fd040593          	addi	a1,s0,-48
    80002704:	02100513          	li	a0,33
    80002708:	00000097          	auipc	ra,0x0
    8000270c:	e4c080e7          	jalr	-436(ra) # 80002554 <_Z18callSupervisorTrapmPv>
    80002710:	0005051b          	sext.w	a0,a0
}
    80002714:	02813083          	ld	ra,40(sp)
    80002718:	02013403          	ld	s0,32(sp)
    8000271c:	01813483          	ld	s1,24(sp)
    80002720:	01013903          	ld	s2,16(sp)
    80002724:	03010113          	addi	sp,sp,48
    80002728:	00008067          	ret
    if (!handle) return -1;
    8000272c:	fff00513          	li	a0,-1
}
    80002730:	00008067          	ret

0000000080002734 <_Z9sem_closeP4_sem>:

int sem_close(sem_t handle) {
    80002734:	ff010113          	addi	sp,sp,-16
    80002738:	00113423          	sd	ra,8(sp)
    8000273c:	00813023          	sd	s0,0(sp)
    80002740:	01010413          	addi	s0,sp,16
    80002744:	00050593          	mv	a1,a0
    return (uint64) callSupervisorTrap(0x22, handle);
    80002748:	02200513          	li	a0,34
    8000274c:	00000097          	auipc	ra,0x0
    80002750:	e08080e7          	jalr	-504(ra) # 80002554 <_Z18callSupervisorTrapmPv>
}
    80002754:	0005051b          	sext.w	a0,a0
    80002758:	00813083          	ld	ra,8(sp)
    8000275c:	00013403          	ld	s0,0(sp)
    80002760:	01010113          	addi	sp,sp,16
    80002764:	00008067          	ret

0000000080002768 <_Z8sem_waitP4_sem>:

int sem_wait(sem_t handle) {
    80002768:	ff010113          	addi	sp,sp,-16
    8000276c:	00113423          	sd	ra,8(sp)
    80002770:	00813023          	sd	s0,0(sp)
    80002774:	01010413          	addi	s0,sp,16
    80002778:	00050593          	mv	a1,a0
    return (uint64) callSupervisorTrap(0x23, handle);
    8000277c:	02300513          	li	a0,35
    80002780:	00000097          	auipc	ra,0x0
    80002784:	dd4080e7          	jalr	-556(ra) # 80002554 <_Z18callSupervisorTrapmPv>
}
    80002788:	0005051b          	sext.w	a0,a0
    8000278c:	00813083          	ld	ra,8(sp)
    80002790:	00013403          	ld	s0,0(sp)
    80002794:	01010113          	addi	sp,sp,16
    80002798:	00008067          	ret

000000008000279c <_Z10sem_signalP4_sem>:

int sem_signal(sem_t handle) {
    8000279c:	ff010113          	addi	sp,sp,-16
    800027a0:	00113423          	sd	ra,8(sp)
    800027a4:	00813023          	sd	s0,0(sp)
    800027a8:	01010413          	addi	s0,sp,16
    800027ac:	00050593          	mv	a1,a0
    return (uint64) callSupervisorTrap(0x24, handle);
    800027b0:	02400513          	li	a0,36
    800027b4:	00000097          	auipc	ra,0x0
    800027b8:	da0080e7          	jalr	-608(ra) # 80002554 <_Z18callSupervisorTrapmPv>
}
    800027bc:	0005051b          	sext.w	a0,a0
    800027c0:	00813083          	ld	ra,8(sp)
    800027c4:	00013403          	ld	s0,0(sp)
    800027c8:	01010113          	addi	sp,sp,16
    800027cc:	00008067          	ret

00000000800027d0 <_Z10time_sleepm>:

int time_sleep(time_t time) {
    800027d0:	ff010113          	addi	sp,sp,-16
    800027d4:	00113423          	sd	ra,8(sp)
    800027d8:	00813023          	sd	s0,0(sp)
    800027dc:	01010413          	addi	s0,sp,16
    800027e0:	00050593          	mv	a1,a0
    return (uint64) callSupervisorTrap(0x31, (void *) time);
    800027e4:	03100513          	li	a0,49
    800027e8:	00000097          	auipc	ra,0x0
    800027ec:	d6c080e7          	jalr	-660(ra) # 80002554 <_Z18callSupervisorTrapmPv>
}
    800027f0:	0005051b          	sext.w	a0,a0
    800027f4:	00813083          	ld	ra,8(sp)
    800027f8:	00013403          	ld	s0,0(sp)
    800027fc:	01010113          	addi	sp,sp,16
    80002800:	00008067          	ret

0000000080002804 <_Z4getcv>:

char getc() {
    80002804:	ff010113          	addi	sp,sp,-16
    80002808:	00113423          	sd	ra,8(sp)
    8000280c:	00813023          	sd	s0,0(sp)
    80002810:	01010413          	addi	s0,sp,16
    return (uint64) callSupervisorTrap(0x41, nullptr);
    80002814:	00000593          	li	a1,0
    80002818:	04100513          	li	a0,65
    8000281c:	00000097          	auipc	ra,0x0
    80002820:	d38080e7          	jalr	-712(ra) # 80002554 <_Z18callSupervisorTrapmPv>
}
    80002824:	0ff57513          	andi	a0,a0,255
    80002828:	00813083          	ld	ra,8(sp)
    8000282c:	00013403          	ld	s0,0(sp)
    80002830:	01010113          	addi	sp,sp,16
    80002834:	00008067          	ret

0000000080002838 <_Z4putcc>:

void putc(char chr) {
    80002838:	ff010113          	addi	sp,sp,-16
    8000283c:	00113423          	sd	ra,8(sp)
    80002840:	00813023          	sd	s0,0(sp)
    80002844:	01010413          	addi	s0,sp,16
    80002848:	00050593          	mv	a1,a0
    callSupervisorTrap(0x42, (void *) (uint64) chr);
    8000284c:	04200513          	li	a0,66
    80002850:	00000097          	auipc	ra,0x0
    80002854:	d04080e7          	jalr	-764(ra) # 80002554 <_Z18callSupervisorTrapmPv>
}
    80002858:	00813083          	ld	ra,8(sp)
    8000285c:	00013403          	ld	s0,0(sp)
    80002860:	01010113          	addi	sp,sp,16
    80002864:	00008067          	ret

0000000080002868 <_Znwm>:
#include "../h/syscall_cpp.hpp"

void *operator new(size_t sz) {
    80002868:	ff010113          	addi	sp,sp,-16
    8000286c:	00113423          	sd	ra,8(sp)
    80002870:	00813023          	sd	s0,0(sp)
    80002874:	01010413          	addi	s0,sp,16
    return mem_alloc(sz);
    80002878:	00000097          	auipc	ra,0x0
    8000287c:	cf8080e7          	jalr	-776(ra) # 80002570 <_Z9mem_allocm>
}
    80002880:	00813083          	ld	ra,8(sp)
    80002884:	00013403          	ld	s0,0(sp)
    80002888:	01010113          	addi	sp,sp,16
    8000288c:	00008067          	ret

0000000080002890 <_Znam>:

void *operator new[](size_t sz) {
    80002890:	ff010113          	addi	sp,sp,-16
    80002894:	00113423          	sd	ra,8(sp)
    80002898:	00813023          	sd	s0,0(sp)
    8000289c:	01010413          	addi	s0,sp,16
    return mem_alloc(sz);
    800028a0:	00000097          	auipc	ra,0x0
    800028a4:	cd0080e7          	jalr	-816(ra) # 80002570 <_Z9mem_allocm>
}
    800028a8:	00813083          	ld	ra,8(sp)
    800028ac:	00013403          	ld	s0,0(sp)
    800028b0:	01010113          	addi	sp,sp,16
    800028b4:	00008067          	ret

00000000800028b8 <_ZdlPv>:

void operator delete(void *addr) {
    800028b8:	ff010113          	addi	sp,sp,-16
    800028bc:	00113423          	sd	ra,8(sp)
    800028c0:	00813023          	sd	s0,0(sp)
    800028c4:	01010413          	addi	s0,sp,16
    mem_free(addr);
    800028c8:	00000097          	auipc	ra,0x0
    800028cc:	cdc080e7          	jalr	-804(ra) # 800025a4 <_Z8mem_freePv>
}
    800028d0:	00813083          	ld	ra,8(sp)
    800028d4:	00013403          	ld	s0,0(sp)
    800028d8:	01010113          	addi	sp,sp,16
    800028dc:	00008067          	ret

00000000800028e0 <_ZdaPv>:

void operator delete[](void *addr) {
    800028e0:	ff010113          	addi	sp,sp,-16
    800028e4:	00113423          	sd	ra,8(sp)
    800028e8:	00813023          	sd	s0,0(sp)
    800028ec:	01010413          	addi	s0,sp,16
    mem_free(addr);
    800028f0:	00000097          	auipc	ra,0x0
    800028f4:	cb4080e7          	jalr	-844(ra) # 800025a4 <_Z8mem_freePv>
}
    800028f8:	00813083          	ld	ra,8(sp)
    800028fc:	00013403          	ld	s0,0(sp)
    80002900:	01010113          	addi	sp,sp,16
    80002904:	00008067          	ret

0000000080002908 <_Z12kprintStringPKc>:

#include "../h/SysPrint.h"
#include "../lib/console.h"
#include "../h/Riscv.h"

void kprintString(char const *string) {
    80002908:	fe010113          	addi	sp,sp,-32
    8000290c:	00113c23          	sd	ra,24(sp)
    80002910:	00813823          	sd	s0,16(sp)
    80002914:	00913423          	sd	s1,8(sp)
    80002918:	02010413          	addi	s0,sp,32
    8000291c:	00050493          	mv	s1,a0
//    uint64 sstatus;
//    Riscv::lock(sstatus);

    while (*string != '\0') {
    80002920:	0004c503          	lbu	a0,0(s1)
    80002924:	00050a63          	beqz	a0,80002938 <_Z12kprintStringPKc+0x30>
        __putc(*string);
    80002928:	00004097          	auipc	ra,0x4
    8000292c:	7c4080e7          	jalr	1988(ra) # 800070ec <__putc>
        string++;
    80002930:	00148493          	addi	s1,s1,1
    while (*string != '\0') {
    80002934:	fedff06f          	j	80002920 <_Z12kprintStringPKc+0x18>
    }

//    Riscv::unlock(sstatus);
}
    80002938:	01813083          	ld	ra,24(sp)
    8000293c:	01013403          	ld	s0,16(sp)
    80002940:	00813483          	ld	s1,8(sp)
    80002944:	02010113          	addi	sp,sp,32
    80002948:	00008067          	ret

000000008000294c <_Z13kprintIntegeri>:

void kprintInteger(int integer) {
    8000294c:	fd010113          	addi	sp,sp,-48
    80002950:	02113423          	sd	ra,40(sp)
    80002954:	02813023          	sd	s0,32(sp)
    80002958:	00913c23          	sd	s1,24(sp)
    8000295c:	03010413          	addi	s0,sp,48
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if (integer < 0) {
    80002960:	08054663          	bltz	a0,800029ec <_Z13kprintIntegeri+0xa0>
        neg = 1;
        x = -integer;
    } else {
        x = integer;
    80002964:	0005051b          	sext.w	a0,a0
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
    800029b0:	fce7e0e3          	bltu	a5,a4,80002970 <_Z13kprintIntegeri+0x24>
    if (neg) buf[i++] = '-';
    800029b4:	00058c63          	beqz	a1,800029cc <_Z13kprintIntegeri+0x80>
    800029b8:	fe040793          	addi	a5,s0,-32
    800029bc:	009784b3          	add	s1,a5,s1
    800029c0:	02d00793          	li	a5,45
    800029c4:	fef48823          	sb	a5,-16(s1)
    800029c8:	0026049b          	addiw	s1,a2,2

    while (--i >= 0)
    800029cc:	fff4849b          	addiw	s1,s1,-1
    800029d0:	0204c463          	bltz	s1,800029f8 <_Z13kprintIntegeri+0xac>
        __putc(buf[i]);
    800029d4:	fe040793          	addi	a5,s0,-32
    800029d8:	009787b3          	add	a5,a5,s1
    800029dc:	ff07c503          	lbu	a0,-16(a5)
    800029e0:	00004097          	auipc	ra,0x4
    800029e4:	70c080e7          	jalr	1804(ra) # 800070ec <__putc>
    800029e8:	fe5ff06f          	j	800029cc <_Z13kprintIntegeri+0x80>
        x = -integer;
    800029ec:	40a0053b          	negw	a0,a0
        neg = 1;
    800029f0:	00100593          	li	a1,1
    800029f4:	f79ff06f          	j	8000296c <_Z13kprintIntegeri+0x20>

//    Riscv::unlock(sstatus);
}
    800029f8:	02813083          	ld	ra,40(sp)
    800029fc:	02013403          	ld	s0,32(sp)
    80002a00:	01813483          	ld	s1,24(sp)
    80002a04:	03010113          	addi	sp,sp,48
    80002a08:	00008067          	ret

0000000080002a0c <_Z14kprintUnsignedm>:

void kprintUnsigned(uint64 x) {
    80002a0c:	fd010113          	addi	sp,sp,-48
    80002a10:	02113423          	sd	ra,40(sp)
    80002a14:	02813023          	sd	s0,32(sp)
    80002a18:	00913c23          	sd	s1,24(sp)
    80002a1c:	03010413          	addi	s0,sp,48
//    Riscv::lock(sstatus);

    static char digits[] = "0123456789";
    char buf[16];

    int i = 0;
    80002a20:	00000493          	li	s1,0
    do {
        buf[i++] = digits[x % 10];
    80002a24:	00a00693          	li	a3,10
    80002a28:	02d57633          	remu	a2,a0,a3
    80002a2c:	00005717          	auipc	a4,0x5
    80002a30:	7b470713          	addi	a4,a4,1972 # 800081e0 <_ZZ13kprintIntegeriE6digits>
    80002a34:	00c70733          	add	a4,a4,a2
    80002a38:	01074703          	lbu	a4,16(a4)
    80002a3c:	fe040613          	addi	a2,s0,-32
    80002a40:	009607b3          	add	a5,a2,s1
    80002a44:	0014849b          	addiw	s1,s1,1
    80002a48:	fee78823          	sb	a4,-16(a5)
    } while ((x /= 10) != 0);
    80002a4c:	00050713          	mv	a4,a0
    80002a50:	02d55533          	divu	a0,a0,a3
    80002a54:	00900793          	li	a5,9
    80002a58:	fce7e6e3          	bltu	a5,a4,80002a24 <_Z14kprintUnsignedm+0x18>

    while (--i >= 0)
    80002a5c:	fff4849b          	addiw	s1,s1,-1
    80002a60:	0004ce63          	bltz	s1,80002a7c <_Z14kprintUnsignedm+0x70>
        __putc(buf[i]);
    80002a64:	fe040793          	addi	a5,s0,-32
    80002a68:	009787b3          	add	a5,a5,s1
    80002a6c:	ff07c503          	lbu	a0,-16(a5)
    80002a70:	00004097          	auipc	ra,0x4
    80002a74:	67c080e7          	jalr	1660(ra) # 800070ec <__putc>
    80002a78:	fe5ff06f          	j	80002a5c <_Z14kprintUnsignedm+0x50>

//    Riscv::unlock(sstatus);
}
    80002a7c:	02813083          	ld	ra,40(sp)
    80002a80:	02013403          	ld	s0,32(sp)
    80002a84:	01813483          	ld	s1,24(sp)
    80002a88:	03010113          	addi	sp,sp,48
    80002a8c:	00008067          	ret

0000000080002a90 <_ZN3TCB13threadWrapperEv>:
    TCB::contextSwitch(&old->context, &running->context);

    unlock()
}

void TCB::threadWrapper() {
    80002a90:	ff010113          	addi	sp,sp,-16
    80002a94:	00113423          	sd	ra,8(sp)
    80002a98:	00813023          	sd	s0,0(sp)
    80002a9c:	01010413          	addi	s0,sp,16
    if (!running->kernelThread)
    80002aa0:	00007797          	auipc	a5,0x7
    80002aa4:	2a87b783          	ld	a5,680(a5) # 80009d48 <_ZN3TCB7runningE>
    80002aa8:	0687c783          	lbu	a5,104(a5)
    80002aac:	02078c63          	beqz	a5,80002ae4 <_ZN3TCB13threadWrapperEv+0x54>
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80002ab0:	00200793          	li	a5,2
    80002ab4:	1007a073          	csrs	sstatus,a5
        Riscv::popSppSpie();
    else
        Riscv::enableInterrupts();
    running->body(running->args);
    80002ab8:	00007797          	auipc	a5,0x7
    80002abc:	2907b783          	ld	a5,656(a5) # 80009d48 <_ZN3TCB7runningE>
    80002ac0:	0087b703          	ld	a4,8(a5)
    80002ac4:	0107b503          	ld	a0,16(a5)
    80002ac8:	000700e7          	jalr	a4

    __asm__ volatile ("li a0, 0x12");
    80002acc:	01200513          	li	a0,18
    __asm__ volatile ("ecall");
    80002ad0:	00000073          	ecall
}
    80002ad4:	00813083          	ld	ra,8(sp)
    80002ad8:	00013403          	ld	s0,0(sp)
    80002adc:	01010113          	addi	sp,sp,16
    80002ae0:	00008067          	ret
        Riscv::popSppSpie();
    80002ae4:	fffff097          	auipc	ra,0xfffff
    80002ae8:	63c080e7          	jalr	1596(ra) # 80002120 <_ZN5Riscv10popSppSpieEv>
    80002aec:	fcdff06f          	j	80002ab8 <_ZN3TCB13threadWrapperEv+0x28>

0000000080002af0 <_ZN3TCBC1EPFvPvES0_mb>:
TCB::TCB(Body body, void *args, uint64 timeSlice, bool kernelThread) :
    80002af0:	fd010113          	addi	sp,sp,-48
    80002af4:	02113423          	sd	ra,40(sp)
    80002af8:	02813023          	sd	s0,32(sp)
    80002afc:	00913c23          	sd	s1,24(sp)
    80002b00:	01213823          	sd	s2,16(sp)
    80002b04:	01313423          	sd	s3,8(sp)
    80002b08:	01413023          	sd	s4,0(sp)
    80002b0c:	03010413          	addi	s0,sp,48
    80002b10:	00050493          	mv	s1,a0
    80002b14:	00058913          	mv	s2,a1
    80002b18:	00068a13          	mv	s4,a3
    80002b1c:	00070993          	mv	s3,a4
        kernelThread(kernelThread) {
    80002b20:	00b53423          	sd	a1,8(a0)
    80002b24:	00c53823          	sd	a2,16(a0)
        threadStack(body != nullptr ? (uint64 *) kmalloc(DEFAULT_STACK_SIZE * sizeof(uint64)) : nullptr),
    80002b28:	0a058063          	beqz	a1,80002bc8 <_ZN3TCBC1EPFvPvES0_mb+0xd8>
    80002b2c:	00008537          	lui	a0,0x8
    80002b30:	fffff097          	auipc	ra,0xfffff
    80002b34:	484080e7          	jalr	1156(ra) # 80001fb4 <_Z7kmallocm>
        kernelThread(kernelThread) {
    80002b38:	00a4bc23          	sd	a0,24(s1)
        kernelStack((uint64 *) kmalloc(DEFAULT_STACK_SIZE * sizeof(uint64))),
    80002b3c:	00008537          	lui	a0,0x8
    80002b40:	fffff097          	auipc	ra,0xfffff
    80002b44:	474080e7          	jalr	1140(ra) # 80001fb4 <_Z7kmallocm>
        kernelThread(kernelThread) {
    80002b48:	02a4b023          	sd	a0,32(s1)
    80002b4c:	00000797          	auipc	a5,0x0
    80002b50:	f4478793          	addi	a5,a5,-188 # 80002a90 <_ZN3TCB13threadWrapperEv>
    80002b54:	02f4b423          	sd	a5,40(s1)
        context({(uint64) &threadWrapper, threadStack != nullptr ? (uint64) (threadStack + DEFAULT_STACK_SIZE) : 0}),
    80002b58:	0184b783          	ld	a5,24(s1)
    80002b5c:	06078a63          	beqz	a5,80002bd0 <_ZN3TCBC1EPFvPvES0_mb+0xe0>
    80002b60:	00008737          	lui	a4,0x8
    80002b64:	00e787b3          	add	a5,a5,a4
        kernelThread(kernelThread) {
    80002b68:	02f4b823          	sd	a5,48(s1)
    80002b6c:	0344bc23          	sd	s4,56(s1)
    80002b70:	0404a023          	sw	zero,64(s1)
    explicit List() = default;
    80002b74:	0404b423          	sd	zero,72(s1)
    80002b78:	0404b823          	sd	zero,80(s1)
    80002b7c:	0404bc23          	sd	zero,88(s1)
    80002b80:	0604a023          	sw	zero,96(s1)
    80002b84:	07348423          	sb	s3,104(s1)
    80002b88:	00100793          	li	a5,1
    80002b8c:	06f4a823          	sw	a5,112(s1)
    80002b90:	0604bc23          	sd	zero,120(s1)
    80002b94:	0804b023          	sd	zero,128(s1)
    80002b98:	0804b423          	sd	zero,136(s1)
    80002b9c:	0804a823          	sw	zero,144(s1)
    80002ba0:	0804bc23          	sd	zero,152(s1)
    80002ba4:	0a04b023          	sd	zero,160(s1)
    ssp = (uint64) (kernelStack + DEFAULT_STACK_SIZE);
    80002ba8:	000087b7          	lui	a5,0x8
    80002bac:	00f50533          	add	a0,a0,a5
    80002bb0:	00a4b023          	sd	a0,0(s1)
    if (body != nullptr)
    80002bb4:	06090063          	beqz	s2,80002c14 <_ZN3TCBC1EPFvPvES0_mb+0x124>
        Scheduler::put(this);
    80002bb8:	00048513          	mv	a0,s1
    80002bbc:	00000097          	auipc	ra,0x0
    80002bc0:	8e0080e7          	jalr	-1824(ra) # 8000249c <_ZN9Scheduler3putEP3TCB>
    80002bc4:	0500006f          	j	80002c14 <_ZN3TCBC1EPFvPvES0_mb+0x124>
        threadStack(body != nullptr ? (uint64 *) kmalloc(DEFAULT_STACK_SIZE * sizeof(uint64)) : nullptr),
    80002bc8:	00000513          	li	a0,0
    80002bcc:	f6dff06f          	j	80002b38 <_ZN3TCBC1EPFvPvES0_mb+0x48>
        context({(uint64) &threadWrapper, threadStack != nullptr ? (uint64) (threadStack + DEFAULT_STACK_SIZE) : 0}),
    80002bd0:	00000793          	li	a5,0
    80002bd4:	f95ff06f          	j	80002b68 <_ZN3TCBC1EPFvPvES0_mb+0x78>
    80002bd8:	00050913          	mv	s2,a0
    80002bdc:	07048513          	addi	a0,s1,112
    80002be0:	fffff097          	auipc	ra,0xfffff
    80002be4:	dd8080e7          	jalr	-552(ra) # 800019b8 <_ZN15KernelSemaphoreD1Ev>
        while (head) {
    80002be8:	0484b503          	ld	a0,72(s1)
    80002bec:	00050e63          	beqz	a0,80002c08 <_ZN3TCBC1EPFvPvES0_mb+0x118>
        kfree(addr);
    80002bf0:	fffff097          	auipc	ra,0xfffff
    80002bf4:	404080e7          	jalr	1028(ra) # 80001ff4 <_Z5kfreePv>
            head = head->next;
    80002bf8:	0484b783          	ld	a5,72(s1)
    80002bfc:	0087b783          	ld	a5,8(a5) # 8008 <_entry-0x7fff7ff8>
    80002c00:	04f4b423          	sd	a5,72(s1)
        while (head) {
    80002c04:	fe5ff06f          	j	80002be8 <_ZN3TCBC1EPFvPvES0_mb+0xf8>
    80002c08:	00090513          	mv	a0,s2
    80002c0c:	00008097          	auipc	ra,0x8
    80002c10:	24c080e7          	jalr	588(ra) # 8000ae58 <_Unwind_Resume>
}
    80002c14:	02813083          	ld	ra,40(sp)
    80002c18:	02013403          	ld	s0,32(sp)
    80002c1c:	01813483          	ld	s1,24(sp)
    80002c20:	01013903          	ld	s2,16(sp)
    80002c24:	00813983          	ld	s3,8(sp)
    80002c28:	00013a03          	ld	s4,0(sp)
    80002c2c:	03010113          	addi	sp,sp,48
    80002c30:	00008067          	ret

0000000080002c34 <_ZN3TCB12createThreadEPFvPvES0_>:
TCB *TCB::createThread(TCB::Body body, void *args) {
    80002c34:	fd010113          	addi	sp,sp,-48
    80002c38:	02113423          	sd	ra,40(sp)
    80002c3c:	02813023          	sd	s0,32(sp)
    80002c40:	00913c23          	sd	s1,24(sp)
    80002c44:	01213823          	sd	s2,16(sp)
    80002c48:	01313423          	sd	s3,8(sp)
    80002c4c:	03010413          	addi	s0,sp,48
    80002c50:	00050913          	mv	s2,a0
    80002c54:	00058993          	mv	s3,a1
        return kmalloc(size);
    80002c58:	0a800513          	li	a0,168
    80002c5c:	fffff097          	auipc	ra,0xfffff
    80002c60:	358080e7          	jalr	856(ra) # 80001fb4 <_Z7kmallocm>
    80002c64:	00050493          	mv	s1,a0
    return new TCB(body, args, DEFAULT_TIME_SLICE);
    80002c68:	00000713          	li	a4,0
    80002c6c:	00200693          	li	a3,2
    80002c70:	00098613          	mv	a2,s3
    80002c74:	00090593          	mv	a1,s2
    80002c78:	00000097          	auipc	ra,0x0
    80002c7c:	e78080e7          	jalr	-392(ra) # 80002af0 <_ZN3TCBC1EPFvPvES0_mb>
    80002c80:	0200006f          	j	80002ca0 <_ZN3TCB12createThreadEPFvPvES0_+0x6c>
    80002c84:	00050913          	mv	s2,a0
        kfree(addr);
    80002c88:	00048513          	mv	a0,s1
    80002c8c:	fffff097          	auipc	ra,0xfffff
    80002c90:	368080e7          	jalr	872(ra) # 80001ff4 <_Z5kfreePv>
    80002c94:	00090513          	mv	a0,s2
    80002c98:	00008097          	auipc	ra,0x8
    80002c9c:	1c0080e7          	jalr	448(ra) # 8000ae58 <_Unwind_Resume>
}
    80002ca0:	00048513          	mv	a0,s1
    80002ca4:	02813083          	ld	ra,40(sp)
    80002ca8:	02013403          	ld	s0,32(sp)
    80002cac:	01813483          	ld	s1,24(sp)
    80002cb0:	01013903          	ld	s2,16(sp)
    80002cb4:	00813983          	ld	s3,8(sp)
    80002cb8:	03010113          	addi	sp,sp,48
    80002cbc:	00008067          	ret

0000000080002cc0 <_ZN3TCB5yieldEv>:
void TCB::yield() {
    80002cc0:	ff010113          	addi	sp,sp,-16
    80002cc4:	00813423          	sd	s0,8(sp)
    80002cc8:	01010413          	addi	s0,sp,16
    __asm__ volatile ("li a0, 0x13");
    80002ccc:	01300513          	li	a0,19
    __asm__ volatile ("ecall");
    80002cd0:	00000073          	ecall
}
    80002cd4:	00813403          	ld	s0,8(sp)
    80002cd8:	01010113          	addi	sp,sp,16
    80002cdc:	00008067          	ret

0000000080002ce0 <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    80002ce0:	fd010113          	addi	sp,sp,-48
    80002ce4:	02113423          	sd	ra,40(sp)
    80002ce8:	02813023          	sd	s0,32(sp)
    80002cec:	00913c23          	sd	s1,24(sp)
    80002cf0:	03010413          	addi	s0,sp,48
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80002cf4:	100027f3          	csrr	a5,sstatus
    80002cf8:	fcf43823          	sd	a5,-48(s0)
    return sstatus;
    80002cfc:	fd043783          	ld	a5,-48(s0)
    lock()
    80002d00:	fcf43c23          	sd	a5,-40(s0)
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80002d04:	00200793          	li	a5,2
    80002d08:	1007b073          	csrc	sstatus,a5
    TCB *old = running;
    80002d0c:	00007497          	auipc	s1,0x7
    80002d10:	03c4b483          	ld	s1,60(s1) # 80009d48 <_ZN3TCB7runningE>
        return status == READY;
    80002d14:	0404a783          	lw	a5,64(s1)
    if (old->isReady()) Scheduler::put(old);
    80002d18:	04078e63          	beqz	a5,80002d74 <_ZN3TCB8dispatchEv+0x94>
    else if (old->isFinished()) {
    80002d1c:	00100713          	li	a4,1
    80002d20:	06e78263          	beq	a5,a4,80002d84 <_ZN3TCB8dispatchEv+0xa4>
    running = Scheduler::get();
    80002d24:	fffff097          	auipc	ra,0xfffff
    80002d28:	6c8080e7          	jalr	1736(ra) # 800023ec <_ZN9Scheduler3getEv>
    80002d2c:	00007797          	auipc	a5,0x7
    80002d30:	00a7be23          	sd	a0,28(a5) # 80009d48 <_ZN3TCB7runningE>
    if (!running) {
    80002d34:	04050e63          	beqz	a0,80002d90 <_ZN3TCB8dispatchEv+0xb0>
    TCB::timeSliceCounter = 0;
    80002d38:	00007797          	auipc	a5,0x7
    80002d3c:	01078793          	addi	a5,a5,16 # 80009d48 <_ZN3TCB7runningE>
    80002d40:	0007b423          	sd	zero,8(a5)
    TCB::contextSwitch(&old->context, &running->context);
    80002d44:	0007b583          	ld	a1,0(a5)
    80002d48:	02858593          	addi	a1,a1,40
    80002d4c:	02848513          	addi	a0,s1,40
    80002d50:	ffffe097          	auipc	ra,0xffffe
    80002d54:	2b0080e7          	jalr	688(ra) # 80001000 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
    unlock()
    80002d58:	fd843783          	ld	a5,-40(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80002d5c:	10079073          	csrw	sstatus,a5
}
    80002d60:	02813083          	ld	ra,40(sp)
    80002d64:	02013403          	ld	s0,32(sp)
    80002d68:	01813483          	ld	s1,24(sp)
    80002d6c:	03010113          	addi	sp,sp,48
    80002d70:	00008067          	ret
    if (old->isReady()) Scheduler::put(old);
    80002d74:	00048513          	mv	a0,s1
    80002d78:	fffff097          	auipc	ra,0xfffff
    80002d7c:	724080e7          	jalr	1828(ra) # 8000249c <_ZN9Scheduler3putEP3TCB>
    80002d80:	fa5ff06f          	j	80002d24 <_ZN3TCB8dispatchEv+0x44>
        ThreadCollector::signal();
    80002d84:	00000097          	auipc	ra,0x0
    80002d88:	524080e7          	jalr	1316(ra) # 800032a8 <_ZN15ThreadCollector6signalEv>
    80002d8c:	f99ff06f          	j	80002d24 <_ZN3TCB8dispatchEv+0x44>
        running = IdleThread::getIdleThread();
    80002d90:	ffffe097          	auipc	ra,0xffffe
    80002d94:	5a0080e7          	jalr	1440(ra) # 80001330 <_ZN10IdleThread13getIdleThreadEv>
    80002d98:	00007797          	auipc	a5,0x7
    80002d9c:	faa7b823          	sd	a0,-80(a5) # 80009d48 <_ZN3TCB7runningE>
    80002da0:	f99ff06f          	j	80002d38 <_ZN3TCB8dispatchEv+0x58>

0000000080002da4 <_ZN3TCB4exitEv>:
void TCB::exit() {
    80002da4:	fe010113          	addi	sp,sp,-32
    80002da8:	00113c23          	sd	ra,24(sp)
    80002dac:	00813823          	sd	s0,16(sp)
    80002db0:	00913423          	sd	s1,8(sp)
    80002db4:	01213023          	sd	s2,0(sp)
    80002db8:	02010413          	addi	s0,sp,32
        status = FINISHED;
    80002dbc:	00007797          	auipc	a5,0x7
    80002dc0:	f8c7b783          	ld	a5,-116(a5) # 80009d48 <_ZN3TCB7runningE>
    80002dc4:	00100713          	li	a4,1
    80002dc8:	04e7a023          	sw	a4,64(a5)
    }
    80002dcc:	0300006f          	j	80002dfc <_ZN3TCB4exitEv+0x58>
        else head = tail = nullptr;
    80002dd0:	0004b423          	sd	zero,8(s1)
    80002dd4:	0407b423          	sd	zero,72(a5)
    80002dd8:	fffff097          	auipc	ra,0xfffff
    80002ddc:	21c080e7          	jalr	540(ra) # 80001ff4 <_Z5kfreePv>
        size--;
    80002de0:	0184a783          	lw	a5,24(s1)
    80002de4:	fff7879b          	addiw	a5,a5,-1
    80002de8:	00f4ac23          	sw	a5,24(s1)
        status = READY;
    80002dec:	04092023          	sw	zero,64(s2)
        Scheduler::put(thr);
    80002df0:	00090513          	mv	a0,s2
    80002df4:	fffff097          	auipc	ra,0xfffff
    80002df8:	6a8080e7          	jalr	1704(ra) # 8000249c <_ZN9Scheduler3putEP3TCB>
    while (!running->waitingToJoin.isEmpty()) {
    80002dfc:	00007797          	auipc	a5,0x7
    80002e00:	f4c7b783          	ld	a5,-180(a5) # 80009d48 <_ZN3TCB7runningE>
        return size == 0;
    80002e04:	0607a703          	lw	a4,96(a5)
    80002e08:	02070863          	beqz	a4,80002e38 <_ZN3TCB4exitEv+0x94>
        TCB *thr = running->waitingToJoin.removeFirst();
    80002e0c:	04878493          	addi	s1,a5,72
        if (!head) return nullptr;
    80002e10:	0487b503          	ld	a0,72(a5)
    80002e14:	00050e63          	beqz	a0,80002e30 <_ZN3TCB4exitEv+0x8c>
        T *data = head->data;
    80002e18:	00053903          	ld	s2,0(a0) # 8000 <_entry-0x7fff8000>
        head = head->next;
    80002e1c:	00853703          	ld	a4,8(a0)
    80002e20:	04e7b423          	sd	a4,72(a5)
        if (head) head->prev = nullptr;
    80002e24:	fa0706e3          	beqz	a4,80002dd0 <_ZN3TCB4exitEv+0x2c>
    80002e28:	00073823          	sd	zero,16(a4) # 8010 <_entry-0x7fff7ff0>
    80002e2c:	fadff06f          	j	80002dd8 <_ZN3TCB4exitEv+0x34>
        if (!head) return nullptr;
    80002e30:	00050913          	mv	s2,a0
    80002e34:	fb9ff06f          	j	80002dec <_ZN3TCB4exitEv+0x48>
    ThreadCollector::put(running);
    80002e38:	00078513          	mv	a0,a5
    80002e3c:	00000097          	auipc	ra,0x0
    80002e40:	580080e7          	jalr	1408(ra) # 800033bc <_ZN15ThreadCollector3putEP3TCB>
    running->dispatch();
    80002e44:	00000097          	auipc	ra,0x0
    80002e48:	e9c080e7          	jalr	-356(ra) # 80002ce0 <_ZN3TCB8dispatchEv>
}
    80002e4c:	01813083          	ld	ra,24(sp)
    80002e50:	01013403          	ld	s0,16(sp)
    80002e54:	00813483          	ld	s1,8(sp)
    80002e58:	00013903          	ld	s2,0(sp)
    80002e5c:	02010113          	addi	sp,sp,32
    80002e60:	00008067          	ret

0000000080002e64 <_ZN3TCB14readSavedStackEv>:

void TCB::readSavedStack() {
    80002e64:	ff010113          	addi	sp,sp,-16
    80002e68:	00813423          	sd	s0,8(sp)
    80002e6c:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sscratch, %[ssp]" : : [ssp] "r"(TCB::running->ssp));
    80002e70:	00007797          	auipc	a5,0x7
    80002e74:	ed87b783          	ld	a5,-296(a5) # 80009d48 <_ZN3TCB7runningE>
    80002e78:	0007b783          	ld	a5,0(a5)
    80002e7c:	14079073          	csrw	sscratch,a5
}
    80002e80:	00813403          	ld	s0,8(sp)
    80002e84:	01010113          	addi	sp,sp,16
    80002e88:	00008067          	ret

0000000080002e8c <_ZN3TCB15writeSavedStackEv>:

void TCB::writeSavedStack() {
    80002e8c:	ff010113          	addi	sp,sp,-16
    80002e90:	00813423          	sd	s0,8(sp)
    80002e94:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrr %[ssp], sscratch" : [ssp] "=r"(TCB::running->ssp));
    80002e98:	14002773          	csrr	a4,sscratch
    80002e9c:	00007797          	auipc	a5,0x7
    80002ea0:	eac7b783          	ld	a5,-340(a5) # 80009d48 <_ZN3TCB7runningE>
    80002ea4:	00e7b023          	sd	a4,0(a5)
}
    80002ea8:	00813403          	ld	s0,8(sp)
    80002eac:	01010113          	addi	sp,sp,16
    80002eb0:	00008067          	ret

0000000080002eb4 <_ZN3TCB4joinEv>:
        return status == FINISHED;
    80002eb4:	04052703          	lw	a4,64(a0)

int TCB::join() {
    if (isFinished()) return 0;
    80002eb8:	00100793          	li	a5,1
    80002ebc:	0cf70263          	beq	a4,a5,80002f80 <_ZN3TCB4joinEv+0xcc>
int TCB::join() {
    80002ec0:	fd010113          	addi	sp,sp,-48
    80002ec4:	02113423          	sd	ra,40(sp)
    80002ec8:	02813023          	sd	s0,32(sp)
    80002ecc:	00913c23          	sd	s1,24(sp)
    80002ed0:	01213823          	sd	s2,16(sp)
    80002ed4:	01313423          	sd	s3,8(sp)
    80002ed8:	01413023          	sd	s4,0(sp)
    80002edc:	03010413          	addi	s0,sp,48
    80002ee0:	00050493          	mv	s1,a0

    mutex.wait();
    80002ee4:	07050993          	addi	s3,a0,112
    80002ee8:	00098513          	mv	a0,s3
    80002eec:	fffff097          	auipc	ra,0xfffff
    80002ef0:	148080e7          	jalr	328(ra) # 80002034 <_ZN5Mutex4waitEv>

    running->setBlocked();
    80002ef4:	00007a17          	auipc	s4,0x7
    80002ef8:	e54a3a03          	ld	s4,-428(s4) # 80009d48 <_ZN3TCB7runningE>
        status = BLOCKED;
    80002efc:	00200793          	li	a5,2
    80002f00:	04fa2023          	sw	a5,64(s4)
    waitingToJoin.addLast(running);
    80002f04:	04848913          	addi	s2,s1,72
        return kmalloc(size);
    80002f08:	01800513          	li	a0,24
    80002f0c:	fffff097          	auipc	ra,0xfffff
    80002f10:	0a8080e7          	jalr	168(ra) # 80001fb4 <_Z7kmallocm>
        Node *elem = new Node(data, nullptr, tail);
    80002f14:	00893783          	ld	a5,8(s2)
        Node(T *data, Node *next = nullptr, Node *prev = nullptr) : data(data), next(next), prev(prev) {}
    80002f18:	01453023          	sd	s4,0(a0)
    80002f1c:	00053423          	sd	zero,8(a0)
    80002f20:	00f53823          	sd	a5,16(a0)
        if (tail) tail->next = elem;
    80002f24:	00893783          	ld	a5,8(s2)
    80002f28:	04078863          	beqz	a5,80002f78 <_ZN3TCB4joinEv+0xc4>
    80002f2c:	00a7b423          	sd	a0,8(a5)
        tail = elem;
    80002f30:	00a93423          	sd	a0,8(s2)
        size++;
    80002f34:	01892783          	lw	a5,24(s2)
    80002f38:	0017879b          	addiw	a5,a5,1
    80002f3c:	00f92c23          	sw	a5,24(s2)

    mutex.signal();
    80002f40:	00098513          	mv	a0,s3
    80002f44:	fffff097          	auipc	ra,0xfffff
    80002f48:	164080e7          	jalr	356(ra) # 800020a8 <_ZN5Mutex6signalEv>

    yield();
    80002f4c:	00000097          	auipc	ra,0x0
    80002f50:	d74080e7          	jalr	-652(ra) # 80002cc0 <_ZN3TCB5yieldEv>

    return 0;
}
    80002f54:	00000513          	li	a0,0
    80002f58:	02813083          	ld	ra,40(sp)
    80002f5c:	02013403          	ld	s0,32(sp)
    80002f60:	01813483          	ld	s1,24(sp)
    80002f64:	01013903          	ld	s2,16(sp)
    80002f68:	00813983          	ld	s3,8(sp)
    80002f6c:	00013a03          	ld	s4,0(sp)
    80002f70:	03010113          	addi	sp,sp,48
    80002f74:	00008067          	ret
        else head = elem;
    80002f78:	04a4b423          	sd	a0,72(s1)
    80002f7c:	fb5ff06f          	j	80002f30 <_ZN3TCB4joinEv+0x7c>
    80002f80:	00000513          	li	a0,0
    80002f84:	00008067          	ret

0000000080002f88 <_ZN3TCBD1Ev>:

TCB::~TCB() {
    80002f88:	fe010113          	addi	sp,sp,-32
    80002f8c:	00113c23          	sd	ra,24(sp)
    80002f90:	00813823          	sd	s0,16(sp)
    80002f94:	00913423          	sd	s1,8(sp)
    80002f98:	02010413          	addi	s0,sp,32
    80002f9c:	00050493          	mv	s1,a0
    kfree(kernelStack);
    80002fa0:	02053503          	ld	a0,32(a0)
    80002fa4:	fffff097          	auipc	ra,0xfffff
    80002fa8:	050080e7          	jalr	80(ra) # 80001ff4 <_Z5kfreePv>
    kfree(threadStack);
    80002fac:	0184b503          	ld	a0,24(s1)
    80002fb0:	fffff097          	auipc	ra,0xfffff
    80002fb4:	044080e7          	jalr	68(ra) # 80001ff4 <_Z5kfreePv>
    80002fb8:	07048513          	addi	a0,s1,112
    80002fbc:	fffff097          	auipc	ra,0xfffff
    80002fc0:	9fc080e7          	jalr	-1540(ra) # 800019b8 <_ZN15KernelSemaphoreD1Ev>
        while (head) {
    80002fc4:	0484b503          	ld	a0,72(s1)
    80002fc8:	00050e63          	beqz	a0,80002fe4 <_ZN3TCBD1Ev+0x5c>
        kfree(addr);
    80002fcc:	fffff097          	auipc	ra,0xfffff
    80002fd0:	028080e7          	jalr	40(ra) # 80001ff4 <_Z5kfreePv>
            head = head->next;
    80002fd4:	0484b783          	ld	a5,72(s1)
    80002fd8:	0087b783          	ld	a5,8(a5)
    80002fdc:	04f4b423          	sd	a5,72(s1)
        while (head) {
    80002fe0:	fe5ff06f          	j	80002fc4 <_ZN3TCBD1Ev+0x3c>
}
    80002fe4:	01813083          	ld	ra,24(sp)
    80002fe8:	01013403          	ld	s0,16(sp)
    80002fec:	00813483          	ld	s1,8(sp)
    80002ff0:	02010113          	addi	sp,sp,32
    80002ff4:	00008067          	ret

0000000080002ff8 <_ZN15ThreadCollectorC1Ev>:
    getInstance()->mutex.wait();
    getInstance()->finishedThreads.addLast(tcb);
    getInstance()->mutex.signal();
}

ThreadCollector::ThreadCollector() : readyToDelete(0) {
    80002ff8:	fd010113          	addi	sp,sp,-48
    80002ffc:	02113423          	sd	ra,40(sp)
    80003000:	02813023          	sd	s0,32(sp)
    80003004:	00913c23          	sd	s1,24(sp)
    80003008:	01213823          	sd	s2,16(sp)
    8000300c:	01313423          	sd	s3,8(sp)
    80003010:	01413023          	sd	s4,0(sp)
    80003014:	03010413          	addi	s0,sp,48
    80003018:	00050493          	mv	s1,a0
    8000301c:	00053023          	sd	zero,0(a0)
    explicit List() = default;
    80003020:	00053423          	sd	zero,8(a0)
    80003024:	00053823          	sd	zero,16(a0)
    80003028:	00053c23          	sd	zero,24(a0)
    8000302c:	02052023          	sw	zero,32(a0)
    80003030:	00100793          	li	a5,1
    80003034:	02f52423          	sw	a5,40(a0)
    80003038:	02053823          	sd	zero,48(a0)
    8000303c:	02053c23          	sd	zero,56(a0)
    80003040:	04053023          	sd	zero,64(a0)
    80003044:	04052423          	sw	zero,72(a0)
    80003048:	04053823          	sd	zero,80(a0)
    8000304c:	05850993          	addi	s3,a0,88
    80003050:	04052c23          	sw	zero,88(a0)
    80003054:	06053023          	sd	zero,96(a0)
    80003058:	06053423          	sd	zero,104(a0)
    8000305c:	06053823          	sd	zero,112(a0)
    80003060:	06052c23          	sw	zero,120(a0)
        return kmalloc(size);
    80003064:	0a800513          	li	a0,168
    80003068:	fffff097          	auipc	ra,0xfffff
    8000306c:	f4c080e7          	jalr	-180(ra) # 80001fb4 <_Z7kmallocm>
    80003070:	00050913          	mv	s2,a0
    threadCollector = new TCB([](void *){ThreadCollector::run();}, nullptr, DEFAULT_TIME_SLICE, true);
    80003074:	00100713          	li	a4,1
    80003078:	00200693          	li	a3,2
    8000307c:	00000613          	li	a2,0
    80003080:	00000597          	auipc	a1,0x0
    80003084:	32458593          	addi	a1,a1,804 # 800033a4 <_ZZN15ThreadCollectorC4EvENUlPvE_4_FUNES0_>
    80003088:	00000097          	auipc	ra,0x0
    8000308c:	a68080e7          	jalr	-1432(ra) # 80002af0 <_ZN3TCBC1EPFvPvES0_mb>
    80003090:	0124b023          	sd	s2,0(s1)
}
    80003094:	02813083          	ld	ra,40(sp)
    80003098:	02013403          	ld	s0,32(sp)
    8000309c:	01813483          	ld	s1,24(sp)
    800030a0:	01013903          	ld	s2,16(sp)
    800030a4:	00813983          	ld	s3,8(sp)
    800030a8:	00013a03          	ld	s4,0(sp)
    800030ac:	03010113          	addi	sp,sp,48
    800030b0:	00008067          	ret
    800030b4:	00050a13          	mv	s4,a0
        kfree(addr);
    800030b8:	00090513          	mv	a0,s2
    800030bc:	fffff097          	auipc	ra,0xfffff
    800030c0:	f38080e7          	jalr	-200(ra) # 80001ff4 <_Z5kfreePv>
    800030c4:	000a0913          	mv	s2,s4
ThreadCollector::ThreadCollector() : readyToDelete(0) {
    800030c8:	00098513          	mv	a0,s3
    800030cc:	fffff097          	auipc	ra,0xfffff
    800030d0:	8ec080e7          	jalr	-1812(ra) # 800019b8 <_ZN15KernelSemaphoreD1Ev>
    800030d4:	02848513          	addi	a0,s1,40
    800030d8:	fffff097          	auipc	ra,0xfffff
    800030dc:	8e0080e7          	jalr	-1824(ra) # 800019b8 <_ZN15KernelSemaphoreD1Ev>
        while (head) {
    800030e0:	0084b503          	ld	a0,8(s1)
    800030e4:	02050263          	beqz	a0,80003108 <_ZN15ThreadCollectorC1Ev+0x110>
    800030e8:	fffff097          	auipc	ra,0xfffff
    800030ec:	f0c080e7          	jalr	-244(ra) # 80001ff4 <_Z5kfreePv>
            head = head->next;
    800030f0:	0084b783          	ld	a5,8(s1)
    800030f4:	0087b783          	ld	a5,8(a5)
    800030f8:	00f4b423          	sd	a5,8(s1)
        while (head) {
    800030fc:	fe5ff06f          	j	800030e0 <_ZN15ThreadCollectorC1Ev+0xe8>
    80003100:	00050913          	mv	s2,a0
    80003104:	fc5ff06f          	j	800030c8 <_ZN15ThreadCollectorC1Ev+0xd0>
    80003108:	00090513          	mv	a0,s2
    8000310c:	00008097          	auipc	ra,0x8
    80003110:	d4c080e7          	jalr	-692(ra) # 8000ae58 <_Unwind_Resume>

0000000080003114 <_ZN15ThreadCollectorD1Ev>:
        delete ThreadCollector::getInstance()->finishedThreads.removeFirst();
        getInstance()->mutex.signal();
    }
}

ThreadCollector::~ThreadCollector() {
    80003114:	fd010113          	addi	sp,sp,-48
    80003118:	02113423          	sd	ra,40(sp)
    8000311c:	02813023          	sd	s0,32(sp)
    80003120:	00913c23          	sd	s1,24(sp)
    80003124:	01213823          	sd	s2,16(sp)
    80003128:	01313423          	sd	s3,8(sp)
    8000312c:	03010413          	addi	s0,sp,48
    80003130:	00050493          	mv	s1,a0
    80003134:	0240006f          	j	80003158 <_ZN15ThreadCollectorD1Ev+0x44>
        else head = tail = nullptr;
    80003138:	00093423          	sd	zero,8(s2)
    8000313c:	0004b423          	sd	zero,8(s1)
    80003140:	fffff097          	auipc	ra,0xfffff
    80003144:	eb4080e7          	jalr	-332(ra) # 80001ff4 <_Z5kfreePv>
        size--;
    80003148:	01892783          	lw	a5,24(s2)
    8000314c:	fff7879b          	addiw	a5,a5,-1
    80003150:	00f92c23          	sw	a5,24(s2)
    while (finishedThreads.getCount() != 0) {
//        kprintString("Deleting thread...\n");
        delete finishedThreads.removeFirst();
    80003154:	02099c63          	bnez	s3,8000318c <_ZN15ThreadCollectorD1Ev+0x78>
        return size;
    80003158:	0204a783          	lw	a5,32(s1)
    while (finishedThreads.getCount() != 0) {
    8000315c:	04078663          	beqz	a5,800031a8 <_ZN15ThreadCollectorD1Ev+0x94>
        delete finishedThreads.removeFirst();
    80003160:	00848913          	addi	s2,s1,8
        if (!head) return nullptr;
    80003164:	0084b503          	ld	a0,8(s1)
    80003168:	00050e63          	beqz	a0,80003184 <_ZN15ThreadCollectorD1Ev+0x70>
        T *data = head->data;
    8000316c:	00053983          	ld	s3,0(a0)
        head = head->next;
    80003170:	00853783          	ld	a5,8(a0)
    80003174:	00f4b423          	sd	a5,8(s1)
        if (head) head->prev = nullptr;
    80003178:	fc0780e3          	beqz	a5,80003138 <_ZN15ThreadCollectorD1Ev+0x24>
    8000317c:	0007b823          	sd	zero,16(a5)
    80003180:	fc1ff06f          	j	80003140 <_ZN15ThreadCollectorD1Ev+0x2c>
        if (!head) return nullptr;
    80003184:	00050993          	mv	s3,a0
    80003188:	fcdff06f          	j	80003154 <_ZN15ThreadCollectorD1Ev+0x40>
    8000318c:	00098513          	mv	a0,s3
    80003190:	00000097          	auipc	ra,0x0
    80003194:	df8080e7          	jalr	-520(ra) # 80002f88 <_ZN3TCBD1Ev>
    80003198:	00098513          	mv	a0,s3
    8000319c:	fffff097          	auipc	ra,0xfffff
    800031a0:	e58080e7          	jalr	-424(ra) # 80001ff4 <_Z5kfreePv>
    }
    800031a4:	fb5ff06f          	j	80003158 <_ZN15ThreadCollectorD1Ev+0x44>
    }
    delete threadCollector;
    800031a8:	0004b903          	ld	s2,0(s1)
    800031ac:	00090e63          	beqz	s2,800031c8 <_ZN15ThreadCollectorD1Ev+0xb4>
    800031b0:	00090513          	mv	a0,s2
    800031b4:	00000097          	auipc	ra,0x0
    800031b8:	dd4080e7          	jalr	-556(ra) # 80002f88 <_ZN3TCBD1Ev>
        kfree(addr);
    800031bc:	00090513          	mv	a0,s2
    800031c0:	fffff097          	auipc	ra,0xfffff
    800031c4:	e34080e7          	jalr	-460(ra) # 80001ff4 <_Z5kfreePv>
ThreadCollector::~ThreadCollector() {
    800031c8:	05848513          	addi	a0,s1,88
    800031cc:	ffffe097          	auipc	ra,0xffffe
    800031d0:	7ec080e7          	jalr	2028(ra) # 800019b8 <_ZN15KernelSemaphoreD1Ev>
    800031d4:	02848513          	addi	a0,s1,40
    800031d8:	ffffe097          	auipc	ra,0xffffe
    800031dc:	7e0080e7          	jalr	2016(ra) # 800019b8 <_ZN15KernelSemaphoreD1Ev>
        while (head) {
    800031e0:	0084b503          	ld	a0,8(s1)
    800031e4:	00050e63          	beqz	a0,80003200 <_ZN15ThreadCollectorD1Ev+0xec>
    800031e8:	fffff097          	auipc	ra,0xfffff
    800031ec:	e0c080e7          	jalr	-500(ra) # 80001ff4 <_Z5kfreePv>
            head = head->next;
    800031f0:	0084b783          	ld	a5,8(s1)
    800031f4:	0087b783          	ld	a5,8(a5)
    800031f8:	00f4b423          	sd	a5,8(s1)
        while (head) {
    800031fc:	fe5ff06f          	j	800031e0 <_ZN15ThreadCollectorD1Ev+0xcc>
}
    80003200:	02813083          	ld	ra,40(sp)
    80003204:	02013403          	ld	s0,32(sp)
    80003208:	01813483          	ld	s1,24(sp)
    8000320c:	01013903          	ld	s2,16(sp)
    80003210:	00813983          	ld	s3,8(sp)
    80003214:	03010113          	addi	sp,sp,48
    80003218:	00008067          	ret

000000008000321c <_ZN15ThreadCollector11getInstanceEv>:

ThreadCollector *ThreadCollector::getInstance() {
    if (!instance) instance = new ThreadCollector;
    8000321c:	00007797          	auipc	a5,0x7
    80003220:	b3c7b783          	ld	a5,-1220(a5) # 80009d58 <_ZN15ThreadCollector8instanceE>
    80003224:	00078863          	beqz	a5,80003234 <_ZN15ThreadCollector11getInstanceEv+0x18>
    return instance;
    80003228:	00007517          	auipc	a0,0x7
    8000322c:	b3053503          	ld	a0,-1232(a0) # 80009d58 <_ZN15ThreadCollector8instanceE>
}
    80003230:	00008067          	ret
ThreadCollector *ThreadCollector::getInstance() {
    80003234:	fe010113          	addi	sp,sp,-32
    80003238:	00113c23          	sd	ra,24(sp)
    8000323c:	00813823          	sd	s0,16(sp)
    80003240:	00913423          	sd	s1,8(sp)
    80003244:	01213023          	sd	s2,0(sp)
    80003248:	02010413          	addi	s0,sp,32
        return kmalloc(size);
    8000324c:	08000513          	li	a0,128
    80003250:	fffff097          	auipc	ra,0xfffff
    80003254:	d64080e7          	jalr	-668(ra) # 80001fb4 <_Z7kmallocm>
    80003258:	00050493          	mv	s1,a0
    if (!instance) instance = new ThreadCollector;
    8000325c:	00000097          	auipc	ra,0x0
    80003260:	d9c080e7          	jalr	-612(ra) # 80002ff8 <_ZN15ThreadCollectorC1Ev>
    80003264:	00007797          	auipc	a5,0x7
    80003268:	ae97ba23          	sd	s1,-1292(a5) # 80009d58 <_ZN15ThreadCollector8instanceE>
    return instance;
    8000326c:	00007517          	auipc	a0,0x7
    80003270:	aec53503          	ld	a0,-1300(a0) # 80009d58 <_ZN15ThreadCollector8instanceE>
}
    80003274:	01813083          	ld	ra,24(sp)
    80003278:	01013403          	ld	s0,16(sp)
    8000327c:	00813483          	ld	s1,8(sp)
    80003280:	00013903          	ld	s2,0(sp)
    80003284:	02010113          	addi	sp,sp,32
    80003288:	00008067          	ret
    8000328c:	00050913          	mv	s2,a0
        kfree(addr);
    80003290:	00048513          	mv	a0,s1
    80003294:	fffff097          	auipc	ra,0xfffff
    80003298:	d60080e7          	jalr	-672(ra) # 80001ff4 <_Z5kfreePv>
    8000329c:	00090513          	mv	a0,s2
    800032a0:	00008097          	auipc	ra,0x8
    800032a4:	bb8080e7          	jalr	-1096(ra) # 8000ae58 <_Unwind_Resume>

00000000800032a8 <_ZN15ThreadCollector6signalEv>:
void ThreadCollector::signal() {
    800032a8:	ff010113          	addi	sp,sp,-16
    800032ac:	00113423          	sd	ra,8(sp)
    800032b0:	00813023          	sd	s0,0(sp)
    800032b4:	01010413          	addi	s0,sp,16
    getInstance()->readyToDelete.signal();
    800032b8:	00000097          	auipc	ra,0x0
    800032bc:	f64080e7          	jalr	-156(ra) # 8000321c <_ZN15ThreadCollector11getInstanceEv>
    800032c0:	05850513          	addi	a0,a0,88
    800032c4:	ffffe097          	auipc	ra,0xffffe
    800032c8:	698080e7          	jalr	1688(ra) # 8000195c <_ZN15KernelSemaphore6signalEv>
}
    800032cc:	00813083          	ld	ra,8(sp)
    800032d0:	00013403          	ld	s0,0(sp)
    800032d4:	01010113          	addi	sp,sp,16
    800032d8:	00008067          	ret

00000000800032dc <_ZN15ThreadCollector3runEv>:
[[noreturn]] void ThreadCollector::run() {
    800032dc:	fe010113          	addi	sp,sp,-32
    800032e0:	00113c23          	sd	ra,24(sp)
    800032e4:	00813823          	sd	s0,16(sp)
    800032e8:	00913423          	sd	s1,8(sp)
    800032ec:	01213023          	sd	s2,0(sp)
    800032f0:	02010413          	addi	s0,sp,32
    800032f4:	0500006f          	j	80003344 <_ZN15ThreadCollector3runEv+0x68>
        else head = tail = nullptr;
    800032f8:	00093423          	sd	zero,8(s2)
    800032fc:	0007b423          	sd	zero,8(a5)
    80003300:	fffff097          	auipc	ra,0xfffff
    80003304:	cf4080e7          	jalr	-780(ra) # 80001ff4 <_Z5kfreePv>
        size--;
    80003308:	01892783          	lw	a5,24(s2)
    8000330c:	fff7879b          	addiw	a5,a5,-1
    80003310:	00f92c23          	sw	a5,24(s2)
        delete ThreadCollector::getInstance()->finishedThreads.removeFirst();
    80003314:	00048e63          	beqz	s1,80003330 <_ZN15ThreadCollector3runEv+0x54>
    80003318:	00048513          	mv	a0,s1
    8000331c:	00000097          	auipc	ra,0x0
    80003320:	c6c080e7          	jalr	-916(ra) # 80002f88 <_ZN3TCBD1Ev>
    80003324:	00048513          	mv	a0,s1
    80003328:	fffff097          	auipc	ra,0xfffff
    8000332c:	ccc080e7          	jalr	-820(ra) # 80001ff4 <_Z5kfreePv>
        getInstance()->mutex.signal();
    80003330:	00000097          	auipc	ra,0x0
    80003334:	eec080e7          	jalr	-276(ra) # 8000321c <_ZN15ThreadCollector11getInstanceEv>
    80003338:	02850513          	addi	a0,a0,40
    8000333c:	fffff097          	auipc	ra,0xfffff
    80003340:	d6c080e7          	jalr	-660(ra) # 800020a8 <_ZN5Mutex6signalEv>
        ThreadCollector::getInstance()->readyToDelete.wait();
    80003344:	00000097          	auipc	ra,0x0
    80003348:	ed8080e7          	jalr	-296(ra) # 8000321c <_ZN15ThreadCollector11getInstanceEv>
    8000334c:	05850513          	addi	a0,a0,88
    80003350:	ffffe097          	auipc	ra,0xffffe
    80003354:	5ac080e7          	jalr	1452(ra) # 800018fc <_ZN15KernelSemaphore4waitEv>
        getInstance()->mutex.wait();
    80003358:	00000097          	auipc	ra,0x0
    8000335c:	ec4080e7          	jalr	-316(ra) # 8000321c <_ZN15ThreadCollector11getInstanceEv>
    80003360:	02850513          	addi	a0,a0,40
    80003364:	fffff097          	auipc	ra,0xfffff
    80003368:	cd0080e7          	jalr	-816(ra) # 80002034 <_ZN5Mutex4waitEv>
        delete ThreadCollector::getInstance()->finishedThreads.removeFirst();
    8000336c:	00000097          	auipc	ra,0x0
    80003370:	eb0080e7          	jalr	-336(ra) # 8000321c <_ZN15ThreadCollector11getInstanceEv>
    80003374:	00050793          	mv	a5,a0
    80003378:	00850913          	addi	s2,a0,8
        if (!head) return nullptr;
    8000337c:	00853503          	ld	a0,8(a0)
    80003380:	00050e63          	beqz	a0,8000339c <_ZN15ThreadCollector3runEv+0xc0>
        T *data = head->data;
    80003384:	00053483          	ld	s1,0(a0)
        head = head->next;
    80003388:	00853703          	ld	a4,8(a0)
    8000338c:	00e7b423          	sd	a4,8(a5)
        if (head) head->prev = nullptr;
    80003390:	f60704e3          	beqz	a4,800032f8 <_ZN15ThreadCollector3runEv+0x1c>
    80003394:	00073823          	sd	zero,16(a4)
    80003398:	f69ff06f          	j	80003300 <_ZN15ThreadCollector3runEv+0x24>
        if (!head) return nullptr;
    8000339c:	00050493          	mv	s1,a0
    800033a0:	f75ff06f          	j	80003314 <_ZN15ThreadCollector3runEv+0x38>

00000000800033a4 <_ZZN15ThreadCollectorC4EvENUlPvE_4_FUNES0_>:
    threadCollector = new TCB([](void *){ThreadCollector::run();}, nullptr, DEFAULT_TIME_SLICE, true);
    800033a4:	ff010113          	addi	sp,sp,-16
    800033a8:	00113423          	sd	ra,8(sp)
    800033ac:	00813023          	sd	s0,0(sp)
    800033b0:	01010413          	addi	s0,sp,16
    800033b4:	00000097          	auipc	ra,0x0
    800033b8:	f28080e7          	jalr	-216(ra) # 800032dc <_ZN15ThreadCollector3runEv>

00000000800033bc <_ZN15ThreadCollector3putEP3TCB>:
void ThreadCollector::put(TCB *tcb) {
    800033bc:	fd010113          	addi	sp,sp,-48
    800033c0:	02113423          	sd	ra,40(sp)
    800033c4:	02813023          	sd	s0,32(sp)
    800033c8:	00913c23          	sd	s1,24(sp)
    800033cc:	01213823          	sd	s2,16(sp)
    800033d0:	01313423          	sd	s3,8(sp)
    800033d4:	03010413          	addi	s0,sp,48
    800033d8:	00050993          	mv	s3,a0
    getInstance()->mutex.wait();
    800033dc:	00000097          	auipc	ra,0x0
    800033e0:	e40080e7          	jalr	-448(ra) # 8000321c <_ZN15ThreadCollector11getInstanceEv>
    800033e4:	02850513          	addi	a0,a0,40
    800033e8:	fffff097          	auipc	ra,0xfffff
    800033ec:	c4c080e7          	jalr	-948(ra) # 80002034 <_ZN5Mutex4waitEv>
    getInstance()->finishedThreads.addLast(tcb);
    800033f0:	00000097          	auipc	ra,0x0
    800033f4:	e2c080e7          	jalr	-468(ra) # 8000321c <_ZN15ThreadCollector11getInstanceEv>
    800033f8:	00050913          	mv	s2,a0
    800033fc:	00850493          	addi	s1,a0,8
        return kmalloc(size);
    80003400:	01800513          	li	a0,24
    80003404:	fffff097          	auipc	ra,0xfffff
    80003408:	bb0080e7          	jalr	-1104(ra) # 80001fb4 <_Z7kmallocm>
    8000340c:	00050793          	mv	a5,a0
        Node *elem = new Node(data, nullptr, tail);
    80003410:	0084b703          	ld	a4,8(s1)
        Node(T *data, Node *next = nullptr, Node *prev = nullptr) : data(data), next(next), prev(prev) {}
    80003414:	01353023          	sd	s3,0(a0)
    80003418:	00053423          	sd	zero,8(a0)
    8000341c:	00e53823          	sd	a4,16(a0)
        if (tail) tail->next = elem;
    80003420:	0084b703          	ld	a4,8(s1)
    80003424:	04070463          	beqz	a4,8000346c <_ZN15ThreadCollector3putEP3TCB+0xb0>
    80003428:	00a73423          	sd	a0,8(a4)
        tail = elem;
    8000342c:	00f4b423          	sd	a5,8(s1)
        size++;
    80003430:	0184a783          	lw	a5,24(s1)
    80003434:	0017879b          	addiw	a5,a5,1
    80003438:	00f4ac23          	sw	a5,24(s1)
    getInstance()->mutex.signal();
    8000343c:	00000097          	auipc	ra,0x0
    80003440:	de0080e7          	jalr	-544(ra) # 8000321c <_ZN15ThreadCollector11getInstanceEv>
    80003444:	02850513          	addi	a0,a0,40
    80003448:	fffff097          	auipc	ra,0xfffff
    8000344c:	c60080e7          	jalr	-928(ra) # 800020a8 <_ZN5Mutex6signalEv>
}
    80003450:	02813083          	ld	ra,40(sp)
    80003454:	02013403          	ld	s0,32(sp)
    80003458:	01813483          	ld	s1,24(sp)
    8000345c:	01013903          	ld	s2,16(sp)
    80003460:	00813983          	ld	s3,8(sp)
    80003464:	03010113          	addi	sp,sp,48
    80003468:	00008067          	ret
        else head = elem;
    8000346c:	00a93423          	sd	a0,8(s2)
    80003470:	fbdff06f          	j	8000342c <_ZN15ThreadCollector3putEP3TCB+0x70>

0000000080003474 <_ZN14TimerInterrupt11getInstanceEv>:
#include "../h/Scheduler.h"

TimerInterrupt *TimerInterrupt::instance = nullptr;

TimerInterrupt *TimerInterrupt::getInstance() {
    if (!instance) instance = new TimerInterrupt;
    80003474:	00007797          	auipc	a5,0x7
    80003478:	8ec7b783          	ld	a5,-1812(a5) # 80009d60 <_ZN14TimerInterrupt8instanceE>
    8000347c:	00078863          	beqz	a5,8000348c <_ZN14TimerInterrupt11getInstanceEv+0x18>
    return instance;
}
    80003480:	00007517          	auipc	a0,0x7
    80003484:	8e053503          	ld	a0,-1824(a0) # 80009d60 <_ZN14TimerInterrupt8instanceE>
    80003488:	00008067          	ret
TimerInterrupt *TimerInterrupt::getInstance() {
    8000348c:	ff010113          	addi	sp,sp,-16
    80003490:	00113423          	sd	ra,8(sp)
    80003494:	00813023          	sd	s0,0(sp)
    80003498:	01010413          	addi	s0,sp,16
    8000349c:	05800513          	li	a0,88
    800034a0:	fffff097          	auipc	ra,0xfffff
    800034a4:	b14080e7          	jalr	-1260(ra) # 80001fb4 <_Z7kmallocm>
    800034a8:	00100793          	li	a5,1
    800034ac:	00f52423          	sw	a5,8(a0)
    explicit List() = default;
    800034b0:	00053823          	sd	zero,16(a0)
    800034b4:	00053c23          	sd	zero,24(a0)
    800034b8:	02053023          	sd	zero,32(a0)
    800034bc:	02052423          	sw	zero,40(a0)
    800034c0:	02053823          	sd	zero,48(a0)
    800034c4:	02053c23          	sd	zero,56(a0)
    800034c8:	04053023          	sd	zero,64(a0)
    800034cc:	04053423          	sd	zero,72(a0)
    800034d0:	04052823          	sw	zero,80(a0)
    if (!instance) instance = new TimerInterrupt;
    800034d4:	00007797          	auipc	a5,0x7
    800034d8:	88a7b623          	sd	a0,-1908(a5) # 80009d60 <_ZN14TimerInterrupt8instanceE>
}
    800034dc:	00007517          	auipc	a0,0x7
    800034e0:	88453503          	ld	a0,-1916(a0) # 80009d60 <_ZN14TimerInterrupt8instanceE>
    800034e4:	00813083          	ld	ra,8(sp)
    800034e8:	00013403          	ld	s0,0(sp)
    800034ec:	01010113          	addi	sp,sp,16
    800034f0:	00008067          	ret

00000000800034f4 <_ZN14TimerInterrupt5blockEP3TCBm>:

void TimerInterrupt::block(TCB *tcb, time_t time) {
    800034f4:	fc010113          	addi	sp,sp,-64
    800034f8:	02113c23          	sd	ra,56(sp)
    800034fc:	02813823          	sd	s0,48(sp)
    80003500:	02913423          	sd	s1,40(sp)
    80003504:	03213023          	sd	s2,32(sp)
    80003508:	01313c23          	sd	s3,24(sp)
    8000350c:	01413823          	sd	s4,16(sp)
    80003510:	01513423          	sd	s5,8(sp)
    80003514:	04010413          	addi	s0,sp,64
    80003518:	00050993          	mv	s3,a0
    8000351c:	00058913          	mv	s2,a1
    List<TCB> *blockedThreads = &getInstance()->blockedThreadList;
    80003520:	00000097          	auipc	ra,0x0
    80003524:	f54080e7          	jalr	-172(ra) # 80003474 <_ZN14TimerInterrupt11getInstanceEv>
    80003528:	00050493          	mv	s1,a0
    8000352c:	03850a13          	addi	s4,a0,56

    instance->mutex.wait();
    80003530:	00007517          	auipc	a0,0x7
    80003534:	83053503          	ld	a0,-2000(a0) # 80009d60 <_ZN14TimerInterrupt8instanceE>
    80003538:	00850513          	addi	a0,a0,8
    8000353c:	fffff097          	auipc	ra,0xfffff
    80003540:	af8080e7          	jalr	-1288(ra) # 80002034 <_ZN5Mutex4waitEv>
        curr = head;
    80003544:	0384b783          	ld	a5,56(s1)
    80003548:	04f4b423          	sd	a5,72(s1)
        return curr != nullptr;
    8000354c:	0484b783          	ld	a5,72(s1)

    for (blockedThreads->toHead(); blockedThreads->hasCurr(); blockedThreads->toNext()) {
    80003550:	06078263          	beqz	a5,800035b4 <_ZN14TimerInterrupt5blockEP3TCBm+0xc0>
        return curr->data;
    80003554:	0007b703          	ld	a4,0(a5)
        return blockedTime;
    80003558:	0a073703          	ld	a4,160(a4)
        time_t currTime = blockedThreads->getCurr()->getBlockedTime();
        if (time >= currTime) {
    8000355c:	00e96a63          	bltu	s2,a4,80003570 <_ZN14TimerInterrupt5blockEP3TCBm+0x7c>
            time -= currTime;
    80003560:	40e90933          	sub	s2,s2,a4
        if (curr) curr = curr->next;
    80003564:	0087b783          	ld	a5,8(a5)
    80003568:	04f4b423          	sd	a5,72(s1)
    }
    8000356c:	fe1ff06f          	j	8000354c <_ZN14TimerInterrupt5blockEP3TCBm+0x58>
        if (!curr) return;
    80003570:	010a3783          	ld	a5,16(s4)
    80003574:	04078063          	beqz	a5,800035b4 <_ZN14TimerInterrupt5blockEP3TCBm+0xc0>
        Node *before = curr->prev;
    80003578:	0107ba83          	ld	s5,16(a5)
    8000357c:	01800513          	li	a0,24
    80003580:	fffff097          	auipc	ra,0xfffff
    80003584:	a34080e7          	jalr	-1484(ra) # 80001fb4 <_Z7kmallocm>
        Node *elem = new Node(data, curr, before);
    80003588:	010a3783          	ld	a5,16(s4)
        Node(T *data, Node *next = nullptr, Node *prev = nullptr) : data(data), next(next), prev(prev) {}
    8000358c:	01353023          	sd	s3,0(a0)
    80003590:	00f53423          	sd	a5,8(a0)
    80003594:	01553823          	sd	s5,16(a0)
        curr->prev = elem;
    80003598:	010a3783          	ld	a5,16(s4)
    8000359c:	00a7b823          	sd	a0,16(a5)
        if (!before) head = elem;
    800035a0:	040a8463          	beqz	s5,800035e8 <_ZN14TimerInterrupt5blockEP3TCBm+0xf4>
        else before->next = elem;
    800035a4:	00aab423          	sd	a0,8(s5)
        size++;
    800035a8:	018a2783          	lw	a5,24(s4)
    800035ac:	0017879b          	addiw	a5,a5,1
    800035b0:	00fa2c23          	sw	a5,24(s4)
        return curr != nullptr;
    800035b4:	0484b783          	ld	a5,72(s1)
            break;
        }
    }

    // insert at end
    if (!blockedThreads->hasCurr()) blockedThreads->addLast(tcb);
    800035b8:	02078c63          	beqz	a5,800035f0 <_ZN14TimerInterrupt5blockEP3TCBm+0xfc>
    800035bc:	0484b783          	ld	a5,72(s1)

    // updating relative time for blocked threads after currently inserted
    while (blockedThreads->hasCurr()) {
    800035c0:	06078a63          	beqz	a5,80003634 <_ZN14TimerInterrupt5blockEP3TCBm+0x140>
        return curr->data;
    800035c4:	0007b703          	ld	a4,0(a5)
        this->blockedTime -= time;
    800035c8:	0a073783          	ld	a5,160(a4)
    800035cc:	412787b3          	sub	a5,a5,s2
    800035d0:	0af73023          	sd	a5,160(a4)
        if (curr) curr = curr->next;
    800035d4:	0484b783          	ld	a5,72(s1)
    800035d8:	fe0782e3          	beqz	a5,800035bc <_ZN14TimerInterrupt5blockEP3TCBm+0xc8>
    800035dc:	0087b783          	ld	a5,8(a5)
    800035e0:	04f4b423          	sd	a5,72(s1)
    800035e4:	fd9ff06f          	j	800035bc <_ZN14TimerInterrupt5blockEP3TCBm+0xc8>
        if (!before) head = elem;
    800035e8:	02a4bc23          	sd	a0,56(s1)
    800035ec:	fbdff06f          	j	800035a8 <_ZN14TimerInterrupt5blockEP3TCBm+0xb4>
    800035f0:	01800513          	li	a0,24
    800035f4:	fffff097          	auipc	ra,0xfffff
    800035f8:	9c0080e7          	jalr	-1600(ra) # 80001fb4 <_Z7kmallocm>
        Node *elem = new Node(data, nullptr, tail);
    800035fc:	008a3783          	ld	a5,8(s4)
        Node(T *data, Node *next = nullptr, Node *prev = nullptr) : data(data), next(next), prev(prev) {}
    80003600:	01353023          	sd	s3,0(a0)
    80003604:	00053423          	sd	zero,8(a0)
    80003608:	00f53823          	sd	a5,16(a0)
        if (tail) tail->next = elem;
    8000360c:	008a3783          	ld	a5,8(s4)
    80003610:	00078e63          	beqz	a5,8000362c <_ZN14TimerInterrupt5blockEP3TCBm+0x138>
    80003614:	00a7b423          	sd	a0,8(a5)
        tail = elem;
    80003618:	00aa3423          	sd	a0,8(s4)
        size++;
    8000361c:	018a2783          	lw	a5,24(s4)
    80003620:	0017879b          	addiw	a5,a5,1
    80003624:	00fa2c23          	sw	a5,24(s4)
    }
    80003628:	f95ff06f          	j	800035bc <_ZN14TimerInterrupt5blockEP3TCBm+0xc8>
        else head = elem;
    8000362c:	02a4bc23          	sd	a0,56(s1)
    80003630:	fe9ff06f          	j	80003618 <_ZN14TimerInterrupt5blockEP3TCBm+0x124>
        blockedThreads->getCurr()->decBlockedTime(time);
        blockedThreads->toNext();
    }

    instance->mutex.signal();
    80003634:	00006517          	auipc	a0,0x6
    80003638:	72c53503          	ld	a0,1836(a0) # 80009d60 <_ZN14TimerInterrupt8instanceE>
    8000363c:	00850513          	addi	a0,a0,8
    80003640:	fffff097          	auipc	ra,0xfffff
    80003644:	a68080e7          	jalr	-1432(ra) # 800020a8 <_ZN5Mutex6signalEv>
        this->blockedTime = blockedTime;
    80003648:	0b29b023          	sd	s2,160(s3)
        status = BLOCKED;
    8000364c:	00200793          	li	a5,2
    80003650:	04f9a023          	sw	a5,64(s3)

    tcb->setBlockedTime(time);
    tcb->setBlocked();
    tcb->dispatch();
    80003654:	fffff097          	auipc	ra,0xfffff
    80003658:	68c080e7          	jalr	1676(ra) # 80002ce0 <_ZN3TCB8dispatchEv>
}
    8000365c:	03813083          	ld	ra,56(sp)
    80003660:	03013403          	ld	s0,48(sp)
    80003664:	02813483          	ld	s1,40(sp)
    80003668:	02013903          	ld	s2,32(sp)
    8000366c:	01813983          	ld	s3,24(sp)
    80003670:	01013a03          	ld	s4,16(sp)
    80003674:	00813a83          	ld	s5,8(sp)
    80003678:	04010113          	addi	sp,sp,64
    8000367c:	00008067          	ret

0000000080003680 <_ZN14TimerInterrupt4tickEv>:

void TimerInterrupt::tick() {
    80003680:	fd010113          	addi	sp,sp,-48
    80003684:	02113423          	sd	ra,40(sp)
    80003688:	02813023          	sd	s0,32(sp)
    8000368c:	00913c23          	sd	s1,24(sp)
    80003690:	01213823          	sd	s2,16(sp)
    80003694:	01313423          	sd	s3,8(sp)
    80003698:	03010413          	addi	s0,sp,48
    List<TCB> *blockedThreads = &getInstance()->blockedThreadList;
    8000369c:	00000097          	auipc	ra,0x0
    800036a0:	dd8080e7          	jalr	-552(ra) # 80003474 <_ZN14TimerInterrupt11getInstanceEv>
    800036a4:	00050993          	mv	s3,a0
    800036a8:	03850913          	addi	s2,a0,56

    TCB *tcb;

    instance->mutex.wait();
    800036ac:	00006517          	auipc	a0,0x6
    800036b0:	6b453503          	ld	a0,1716(a0) # 80009d60 <_ZN14TimerInterrupt8instanceE>
    800036b4:	00850513          	addi	a0,a0,8
    800036b8:	fffff097          	auipc	ra,0xfffff
    800036bc:	97c080e7          	jalr	-1668(ra) # 80002034 <_ZN5Mutex4waitEv>
    800036c0:	06c0006f          	j	8000372c <_ZN14TimerInterrupt4tickEv+0xac>
    while ((tcb = blockedThreads->getFirst()) && !tcb->getBlockedTime()) {
        tcb->setReady();
        Scheduler::put(blockedThreads->removeFirst());
    }

    instance->mutex.signal();
    800036c4:	00006517          	auipc	a0,0x6
    800036c8:	69c53503          	ld	a0,1692(a0) # 80009d60 <_ZN14TimerInterrupt8instanceE>
    800036cc:	00850513          	addi	a0,a0,8
    800036d0:	fffff097          	auipc	ra,0xfffff
    800036d4:	9d8080e7          	jalr	-1576(ra) # 800020a8 <_ZN5Mutex6signalEv>

    if (!tcb) return;
    800036d8:	00048863          	beqz	s1,800036e8 <_ZN14TimerInterrupt4tickEv+0x68>
        this->blockedTime -= time;
    800036dc:	0a04b783          	ld	a5,160(s1)
    800036e0:	fff78793          	addi	a5,a5,-1
    800036e4:	0af4b023          	sd	a5,160(s1)
    tcb->decBlockedTime();
}
    800036e8:	02813083          	ld	ra,40(sp)
    800036ec:	02013403          	ld	s0,32(sp)
    800036f0:	01813483          	ld	s1,24(sp)
    800036f4:	01013903          	ld	s2,16(sp)
    800036f8:	00813983          	ld	s3,8(sp)
    800036fc:	03010113          	addi	sp,sp,48
    80003700:	00008067          	ret
        else head = tail = nullptr;
    80003704:	00093423          	sd	zero,8(s2)
    80003708:	00093023          	sd	zero,0(s2)
        kfree(addr);
    8000370c:	fffff097          	auipc	ra,0xfffff
    80003710:	8e8080e7          	jalr	-1816(ra) # 80001ff4 <_Z5kfreePv>
        size--;
    80003714:	01892783          	lw	a5,24(s2)
    80003718:	fff7879b          	addiw	a5,a5,-1
    8000371c:	00f92c23          	sw	a5,24(s2)
        Scheduler::put(blockedThreads->removeFirst());
    80003720:	00048513          	mv	a0,s1
    80003724:	fffff097          	auipc	ra,0xfffff
    80003728:	d78080e7          	jalr	-648(ra) # 8000249c <_ZN9Scheduler3putEP3TCB>
        if (!head) return nullptr;
    8000372c:	0389b483          	ld	s1,56(s3)
    80003730:	f8048ae3          	beqz	s1,800036c4 <_ZN14TimerInterrupt4tickEv+0x44>
        return head->data;
    80003734:	0004b483          	ld	s1,0(s1)
    while ((tcb = blockedThreads->getFirst()) && !tcb->getBlockedTime()) {
    80003738:	f80486e3          	beqz	s1,800036c4 <_ZN14TimerInterrupt4tickEv+0x44>
        return blockedTime;
    8000373c:	0a04b783          	ld	a5,160(s1)
    80003740:	f80792e3          	bnez	a5,800036c4 <_ZN14TimerInterrupt4tickEv+0x44>
        status = READY;
    80003744:	0404a023          	sw	zero,64(s1)
        if (!head) return nullptr;
    80003748:	00093503          	ld	a0,0(s2)
    8000374c:	00050e63          	beqz	a0,80003768 <_ZN14TimerInterrupt4tickEv+0xe8>
        T *data = head->data;
    80003750:	00053483          	ld	s1,0(a0)
        head = head->next;
    80003754:	00853783          	ld	a5,8(a0)
    80003758:	00f93023          	sd	a5,0(s2)
        if (head) head->prev = nullptr;
    8000375c:	fa0784e3          	beqz	a5,80003704 <_ZN14TimerInterrupt4tickEv+0x84>
    80003760:	0007b823          	sd	zero,16(a5)
    80003764:	fa9ff06f          	j	8000370c <_ZN14TimerInterrupt4tickEv+0x8c>
        if (!head) return nullptr;
    80003768:	00050493          	mv	s1,a0
    8000376c:	fb5ff06f          	j	80003720 <_ZN14TimerInterrupt4tickEv+0xa0>

0000000080003770 <_ZN6BufferC1Ei>:
#include "buffer.hpp"
#include "../h/syscall_c.h"
//#include "../h/std.h"


Buffer::Buffer(int _cap) : cap(_cap), head(0), tail(0) {
    80003770:	fe010113          	addi	sp,sp,-32
    80003774:	00113c23          	sd	ra,24(sp)
    80003778:	00813823          	sd	s0,16(sp)
    8000377c:	00913423          	sd	s1,8(sp)
    80003780:	02010413          	addi	s0,sp,32
    80003784:	00050493          	mv	s1,a0
    80003788:	00b52023          	sw	a1,0(a0)
    8000378c:	00052823          	sw	zero,16(a0)
    80003790:	00052a23          	sw	zero,20(a0)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80003794:	00259513          	slli	a0,a1,0x2
    80003798:	fffff097          	auipc	ra,0xfffff
    8000379c:	dd8080e7          	jalr	-552(ra) # 80002570 <_Z9mem_allocm>
    800037a0:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    800037a4:	00000593          	li	a1,0
    800037a8:	02048513          	addi	a0,s1,32
    800037ac:	fffff097          	auipc	ra,0xfffff
    800037b0:	f10080e7          	jalr	-240(ra) # 800026bc <_Z8sem_openPP4_semj>
    sem_open(&spaceAvailable, cap);
    800037b4:	0004a583          	lw	a1,0(s1)
    800037b8:	01848513          	addi	a0,s1,24
    800037bc:	fffff097          	auipc	ra,0xfffff
    800037c0:	f00080e7          	jalr	-256(ra) # 800026bc <_Z8sem_openPP4_semj>
    sem_open(&mutexHead, 1);
    800037c4:	00100593          	li	a1,1
    800037c8:	02848513          	addi	a0,s1,40
    800037cc:	fffff097          	auipc	ra,0xfffff
    800037d0:	ef0080e7          	jalr	-272(ra) # 800026bc <_Z8sem_openPP4_semj>
    sem_open(&mutexTail, 1);
    800037d4:	00100593          	li	a1,1
    800037d8:	03048513          	addi	a0,s1,48
    800037dc:	fffff097          	auipc	ra,0xfffff
    800037e0:	ee0080e7          	jalr	-288(ra) # 800026bc <_Z8sem_openPP4_semj>
}
    800037e4:	01813083          	ld	ra,24(sp)
    800037e8:	01013403          	ld	s0,16(sp)
    800037ec:	00813483          	ld	s1,8(sp)
    800037f0:	02010113          	addi	sp,sp,32
    800037f4:	00008067          	ret

00000000800037f8 <_ZN6BufferD1Ev>:

Buffer::~Buffer() {
    800037f8:	fe010113          	addi	sp,sp,-32
    800037fc:	00113c23          	sd	ra,24(sp)
    80003800:	00813823          	sd	s0,16(sp)
    80003804:	00913423          	sd	s1,8(sp)
    80003808:	02010413          	addi	s0,sp,32
    8000380c:	00050493          	mv	s1,a0
    putc('\n');
    80003810:	00a00513          	li	a0,10
    80003814:	fffff097          	auipc	ra,0xfffff
    80003818:	024080e7          	jalr	36(ra) # 80002838 <_Z4putcc>
//    printf("Buffer deleted!\n");
    while (head != tail) {
    8000381c:	0104a783          	lw	a5,16(s1)
    80003820:	0144a703          	lw	a4,20(s1)
    80003824:	00e78c63          	beq	a5,a4,8000383c <_ZN6BufferD1Ev+0x44>
//        printf("%c ", buffer[head]);
        head = (head + 1) % cap;
    80003828:	0017879b          	addiw	a5,a5,1
    8000382c:	0004a703          	lw	a4,0(s1)
    80003830:	02e7e7bb          	remw	a5,a5,a4
    80003834:	00f4a823          	sw	a5,16(s1)
    while (head != tail) {
    80003838:	fe5ff06f          	j	8000381c <_ZN6BufferD1Ev+0x24>
    }
    putc('!');
    8000383c:	02100513          	li	a0,33
    80003840:	fffff097          	auipc	ra,0xfffff
    80003844:	ff8080e7          	jalr	-8(ra) # 80002838 <_Z4putcc>
    putc('\n');
    80003848:	00a00513          	li	a0,10
    8000384c:	fffff097          	auipc	ra,0xfffff
    80003850:	fec080e7          	jalr	-20(ra) # 80002838 <_Z4putcc>

    mem_free(buffer);
    80003854:	0084b503          	ld	a0,8(s1)
    80003858:	fffff097          	auipc	ra,0xfffff
    8000385c:	d4c080e7          	jalr	-692(ra) # 800025a4 <_Z8mem_freePv>
    sem_close(itemAvailable);
    80003860:	0204b503          	ld	a0,32(s1)
    80003864:	fffff097          	auipc	ra,0xfffff
    80003868:	ed0080e7          	jalr	-304(ra) # 80002734 <_Z9sem_closeP4_sem>
    sem_close(spaceAvailable);
    8000386c:	0184b503          	ld	a0,24(s1)
    80003870:	fffff097          	auipc	ra,0xfffff
    80003874:	ec4080e7          	jalr	-316(ra) # 80002734 <_Z9sem_closeP4_sem>
    sem_close(mutexTail);
    80003878:	0304b503          	ld	a0,48(s1)
    8000387c:	fffff097          	auipc	ra,0xfffff
    80003880:	eb8080e7          	jalr	-328(ra) # 80002734 <_Z9sem_closeP4_sem>
    sem_close(mutexHead);
    80003884:	0284b503          	ld	a0,40(s1)
    80003888:	fffff097          	auipc	ra,0xfffff
    8000388c:	eac080e7          	jalr	-340(ra) # 80002734 <_Z9sem_closeP4_sem>
}
    80003890:	01813083          	ld	ra,24(sp)
    80003894:	01013403          	ld	s0,16(sp)
    80003898:	00813483          	ld	s1,8(sp)
    8000389c:	02010113          	addi	sp,sp,32
    800038a0:	00008067          	ret

00000000800038a4 <_ZN6Buffer3putEi>:

void Buffer::put(int val) {
    800038a4:	fe010113          	addi	sp,sp,-32
    800038a8:	00113c23          	sd	ra,24(sp)
    800038ac:	00813823          	sd	s0,16(sp)
    800038b0:	00913423          	sd	s1,8(sp)
    800038b4:	01213023          	sd	s2,0(sp)
    800038b8:	02010413          	addi	s0,sp,32
    800038bc:	00050493          	mv	s1,a0
    800038c0:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    800038c4:	01853503          	ld	a0,24(a0)
    800038c8:	fffff097          	auipc	ra,0xfffff
    800038cc:	ea0080e7          	jalr	-352(ra) # 80002768 <_Z8sem_waitP4_sem>

    sem_wait(mutexTail);
    800038d0:	0304b503          	ld	a0,48(s1)
    800038d4:	fffff097          	auipc	ra,0xfffff
    800038d8:	e94080e7          	jalr	-364(ra) # 80002768 <_Z8sem_waitP4_sem>
    buffer[tail] = val;
    800038dc:	0084b783          	ld	a5,8(s1)
    800038e0:	0144a703          	lw	a4,20(s1)
    800038e4:	00271713          	slli	a4,a4,0x2
    800038e8:	00e787b3          	add	a5,a5,a4
    800038ec:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    800038f0:	0144a783          	lw	a5,20(s1)
    800038f4:	0017879b          	addiw	a5,a5,1
    800038f8:	0004a703          	lw	a4,0(s1)
    800038fc:	02e7e7bb          	remw	a5,a5,a4
    80003900:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80003904:	0304b503          	ld	a0,48(s1)
    80003908:	fffff097          	auipc	ra,0xfffff
    8000390c:	e94080e7          	jalr	-364(ra) # 8000279c <_Z10sem_signalP4_sem>

    sem_signal(itemAvailable);
    80003910:	0204b503          	ld	a0,32(s1)
    80003914:	fffff097          	auipc	ra,0xfffff
    80003918:	e88080e7          	jalr	-376(ra) # 8000279c <_Z10sem_signalP4_sem>

}
    8000391c:	01813083          	ld	ra,24(sp)
    80003920:	01013403          	ld	s0,16(sp)
    80003924:	00813483          	ld	s1,8(sp)
    80003928:	00013903          	ld	s2,0(sp)
    8000392c:	02010113          	addi	sp,sp,32
    80003930:	00008067          	ret

0000000080003934 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80003934:	fe010113          	addi	sp,sp,-32
    80003938:	00113c23          	sd	ra,24(sp)
    8000393c:	00813823          	sd	s0,16(sp)
    80003940:	00913423          	sd	s1,8(sp)
    80003944:	01213023          	sd	s2,0(sp)
    80003948:	02010413          	addi	s0,sp,32
    8000394c:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80003950:	02053503          	ld	a0,32(a0)
    80003954:	fffff097          	auipc	ra,0xfffff
    80003958:	e14080e7          	jalr	-492(ra) # 80002768 <_Z8sem_waitP4_sem>

    sem_wait(mutexHead);
    8000395c:	0284b503          	ld	a0,40(s1)
    80003960:	fffff097          	auipc	ra,0xfffff
    80003964:	e08080e7          	jalr	-504(ra) # 80002768 <_Z8sem_waitP4_sem>

    int ret = buffer[head];
    80003968:	0084b703          	ld	a4,8(s1)
    8000396c:	0104a783          	lw	a5,16(s1)
    80003970:	00279693          	slli	a3,a5,0x2
    80003974:	00d70733          	add	a4,a4,a3
    80003978:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    8000397c:	0017879b          	addiw	a5,a5,1
    80003980:	0004a703          	lw	a4,0(s1)
    80003984:	02e7e7bb          	remw	a5,a5,a4
    80003988:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    8000398c:	0284b503          	ld	a0,40(s1)
    80003990:	fffff097          	auipc	ra,0xfffff
    80003994:	e0c080e7          	jalr	-500(ra) # 8000279c <_Z10sem_signalP4_sem>

    sem_signal(spaceAvailable);
    80003998:	0184b503          	ld	a0,24(s1)
    8000399c:	fffff097          	auipc	ra,0xfffff
    800039a0:	e00080e7          	jalr	-512(ra) # 8000279c <_Z10sem_signalP4_sem>

    return ret;
}
    800039a4:	00090513          	mv	a0,s2
    800039a8:	01813083          	ld	ra,24(sp)
    800039ac:	01013403          	ld	s0,16(sp)
    800039b0:	00813483          	ld	s1,8(sp)
    800039b4:	00013903          	ld	s2,0(sp)
    800039b8:	02010113          	addi	sp,sp,32
    800039bc:	00008067          	ret

00000000800039c0 <_ZL8printIntiii>:
}

static char digits[] = "0123456789ABCDEF";

static void printInt(int xx, int base=10, int sgn=0)
{
    800039c0:	fc010113          	addi	sp,sp,-64
    800039c4:	02113c23          	sd	ra,56(sp)
    800039c8:	02813823          	sd	s0,48(sp)
    800039cc:	02913423          	sd	s1,40(sp)
    800039d0:	03213023          	sd	s2,32(sp)
    800039d4:	01313c23          	sd	s3,24(sp)
    800039d8:	04010413          	addi	s0,sp,64
    800039dc:	00050493          	mv	s1,a0
    800039e0:	00058913          	mv	s2,a1
    800039e4:	00060993          	mv	s3,a2
    LOCK();
    800039e8:	00100613          	li	a2,1
    800039ec:	00000593          	li	a1,0
    800039f0:	00006517          	auipc	a0,0x6
    800039f4:	37850513          	addi	a0,a0,888 # 80009d68 <lockPrint>
    800039f8:	ffffd097          	auipc	ra,0xffffd
    800039fc:	788080e7          	jalr	1928(ra) # 80001180 <copy_and_swap>
    80003a00:	fe0514e3          	bnez	a0,800039e8 <_ZL8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80003a04:	00098463          	beqz	s3,80003a0c <_ZL8printIntiii+0x4c>
    80003a08:	0804c463          	bltz	s1,80003a90 <_ZL8printIntiii+0xd0>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80003a0c:	0004851b          	sext.w	a0,s1
    neg = 0;
    80003a10:	00000593          	li	a1,0
    }

    i = 0;
    80003a14:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80003a18:	0009079b          	sext.w	a5,s2
    80003a1c:	0325773b          	remuw	a4,a0,s2
    80003a20:	00048613          	mv	a2,s1
    80003a24:	0014849b          	addiw	s1,s1,1
    80003a28:	02071693          	slli	a3,a4,0x20
    80003a2c:	0206d693          	srli	a3,a3,0x20
    80003a30:	00005717          	auipc	a4,0x5
    80003a34:	a9870713          	addi	a4,a4,-1384 # 800084c8 <_ZL6digits>
    80003a38:	00d70733          	add	a4,a4,a3
    80003a3c:	00074683          	lbu	a3,0(a4)
    80003a40:	fd040713          	addi	a4,s0,-48
    80003a44:	00c70733          	add	a4,a4,a2
    80003a48:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80003a4c:	0005071b          	sext.w	a4,a0
    80003a50:	0325553b          	divuw	a0,a0,s2
    80003a54:	fcf772e3          	bgeu	a4,a5,80003a18 <_ZL8printIntiii+0x58>
    if(neg)
    80003a58:	00058c63          	beqz	a1,80003a70 <_ZL8printIntiii+0xb0>
        buf[i++] = '-';
    80003a5c:	fd040793          	addi	a5,s0,-48
    80003a60:	009784b3          	add	s1,a5,s1
    80003a64:	02d00793          	li	a5,45
    80003a68:	fef48823          	sb	a5,-16(s1)
    80003a6c:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80003a70:	fff4849b          	addiw	s1,s1,-1
    80003a74:	0204c463          	bltz	s1,80003a9c <_ZL8printIntiii+0xdc>
        putc(buf[i]);
    80003a78:	fd040793          	addi	a5,s0,-48
    80003a7c:	009787b3          	add	a5,a5,s1
    80003a80:	ff07c503          	lbu	a0,-16(a5)
    80003a84:	fffff097          	auipc	ra,0xfffff
    80003a88:	db4080e7          	jalr	-588(ra) # 80002838 <_Z4putcc>
    80003a8c:	fe5ff06f          	j	80003a70 <_ZL8printIntiii+0xb0>
        x = -xx;
    80003a90:	4090053b          	negw	a0,s1
        neg = 1;
    80003a94:	00100593          	li	a1,1
        x = -xx;
    80003a98:	f7dff06f          	j	80003a14 <_ZL8printIntiii+0x54>

    UNLOCK();
    80003a9c:	00000613          	li	a2,0
    80003aa0:	00100593          	li	a1,1
    80003aa4:	00006517          	auipc	a0,0x6
    80003aa8:	2c450513          	addi	a0,a0,708 # 80009d68 <lockPrint>
    80003aac:	ffffd097          	auipc	ra,0xffffd
    80003ab0:	6d4080e7          	jalr	1748(ra) # 80001180 <copy_and_swap>
    80003ab4:	fe0514e3          	bnez	a0,80003a9c <_ZL8printIntiii+0xdc>
}
    80003ab8:	03813083          	ld	ra,56(sp)
    80003abc:	03013403          	ld	s0,48(sp)
    80003ac0:	02813483          	ld	s1,40(sp)
    80003ac4:	02013903          	ld	s2,32(sp)
    80003ac8:	01813983          	ld	s3,24(sp)
    80003acc:	04010113          	addi	sp,sp,64
    80003ad0:	00008067          	ret

0000000080003ad4 <_Z16producerKeyboardPv>:
    sem_t wait;
};

volatile int threadEnd = 0;

void producerKeyboard(void *arg) {
    80003ad4:	fe010113          	addi	sp,sp,-32
    80003ad8:	00113c23          	sd	ra,24(sp)
    80003adc:	00813823          	sd	s0,16(sp)
    80003ae0:	00913423          	sd	s1,8(sp)
    80003ae4:	01213023          	sd	s2,0(sp)
    80003ae8:	02010413          	addi	s0,sp,32
    80003aec:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80003af0:	00000913          	li	s2,0
    80003af4:	00c0006f          	j	80003b00 <_Z16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003af8:	fffff097          	auipc	ra,0xfffff
    80003afc:	b94080e7          	jalr	-1132(ra) # 8000268c <_Z15thread_dispatchv>
    while ((key = getc()) != 0x1b) {
    80003b00:	fffff097          	auipc	ra,0xfffff
    80003b04:	d04080e7          	jalr	-764(ra) # 80002804 <_Z4getcv>
    80003b08:	0005059b          	sext.w	a1,a0
    80003b0c:	01b00793          	li	a5,27
    80003b10:	02f58a63          	beq	a1,a5,80003b44 <_Z16producerKeyboardPv+0x70>
        data->buffer->put(key);
    80003b14:	0084b503          	ld	a0,8(s1)
    80003b18:	00000097          	auipc	ra,0x0
    80003b1c:	d8c080e7          	jalr	-628(ra) # 800038a4 <_ZN6Buffer3putEi>
        i++;
    80003b20:	0019071b          	addiw	a4,s2,1
    80003b24:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003b28:	0004a683          	lw	a3,0(s1)
    80003b2c:	0026979b          	slliw	a5,a3,0x2
    80003b30:	00d787bb          	addw	a5,a5,a3
    80003b34:	0017979b          	slliw	a5,a5,0x1
    80003b38:	02f767bb          	remw	a5,a4,a5
    80003b3c:	fc0792e3          	bnez	a5,80003b00 <_Z16producerKeyboardPv+0x2c>
    80003b40:	fb9ff06f          	j	80003af8 <_Z16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    80003b44:	00100793          	li	a5,1
    80003b48:	00006717          	auipc	a4,0x6
    80003b4c:	22f72423          	sw	a5,552(a4) # 80009d70 <threadEnd>

    delete data->buffer;
    80003b50:	0084b903          	ld	s2,8(s1)
    80003b54:	00090e63          	beqz	s2,80003b70 <_Z16producerKeyboardPv+0x9c>
    80003b58:	00090513          	mv	a0,s2
    80003b5c:	00000097          	auipc	ra,0x0
    80003b60:	c9c080e7          	jalr	-868(ra) # 800037f8 <_ZN6BufferD1Ev>
    80003b64:	00090513          	mv	a0,s2
    80003b68:	fffff097          	auipc	ra,0xfffff
    80003b6c:	d50080e7          	jalr	-688(ra) # 800028b8 <_ZdlPv>

    sem_signal(data->wait);
    80003b70:	0104b503          	ld	a0,16(s1)
    80003b74:	fffff097          	auipc	ra,0xfffff
    80003b78:	c28080e7          	jalr	-984(ra) # 8000279c <_Z10sem_signalP4_sem>
}
    80003b7c:	01813083          	ld	ra,24(sp)
    80003b80:	01013403          	ld	s0,16(sp)
    80003b84:	00813483          	ld	s1,8(sp)
    80003b88:	00013903          	ld	s2,0(sp)
    80003b8c:	02010113          	addi	sp,sp,32
    80003b90:	00008067          	ret

0000000080003b94 <_Z8producerPv>:

void producer(void *arg) {
    80003b94:	fe010113          	addi	sp,sp,-32
    80003b98:	00113c23          	sd	ra,24(sp)
    80003b9c:	00813823          	sd	s0,16(sp)
    80003ba0:	00913423          	sd	s1,8(sp)
    80003ba4:	01213023          	sd	s2,0(sp)
    80003ba8:	02010413          	addi	s0,sp,32
    80003bac:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003bb0:	00000913          	li	s2,0
    80003bb4:	00c0006f          	j	80003bc0 <_Z8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003bb8:	fffff097          	auipc	ra,0xfffff
    80003bbc:	ad4080e7          	jalr	-1324(ra) # 8000268c <_Z15thread_dispatchv>
    while (!threadEnd) {
    80003bc0:	00006797          	auipc	a5,0x6
    80003bc4:	1b07a783          	lw	a5,432(a5) # 80009d70 <threadEnd>
    80003bc8:	02079e63          	bnez	a5,80003c04 <_Z8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80003bcc:	0004a583          	lw	a1,0(s1)
    80003bd0:	0305859b          	addiw	a1,a1,48
    80003bd4:	0084b503          	ld	a0,8(s1)
    80003bd8:	00000097          	auipc	ra,0x0
    80003bdc:	ccc080e7          	jalr	-820(ra) # 800038a4 <_ZN6Buffer3putEi>
        i++;
    80003be0:	0019071b          	addiw	a4,s2,1
    80003be4:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003be8:	0004a683          	lw	a3,0(s1)
    80003bec:	0026979b          	slliw	a5,a3,0x2
    80003bf0:	00d787bb          	addw	a5,a5,a3
    80003bf4:	0017979b          	slliw	a5,a5,0x1
    80003bf8:	02f767bb          	remw	a5,a4,a5
    80003bfc:	fc0792e3          	bnez	a5,80003bc0 <_Z8producerPv+0x2c>
    80003c00:	fb9ff06f          	j	80003bb8 <_Z8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    80003c04:	0104b503          	ld	a0,16(s1)
    80003c08:	fffff097          	auipc	ra,0xfffff
    80003c0c:	b94080e7          	jalr	-1132(ra) # 8000279c <_Z10sem_signalP4_sem>
}
    80003c10:	01813083          	ld	ra,24(sp)
    80003c14:	01013403          	ld	s0,16(sp)
    80003c18:	00813483          	ld	s1,8(sp)
    80003c1c:	00013903          	ld	s2,0(sp)
    80003c20:	02010113          	addi	sp,sp,32
    80003c24:	00008067          	ret

0000000080003c28 <_Z8consumerPv>:

void consumer(void *arg) {
    80003c28:	fd010113          	addi	sp,sp,-48
    80003c2c:	02113423          	sd	ra,40(sp)
    80003c30:	02813023          	sd	s0,32(sp)
    80003c34:	00913c23          	sd	s1,24(sp)
    80003c38:	01213823          	sd	s2,16(sp)
    80003c3c:	01313423          	sd	s3,8(sp)
    80003c40:	03010413          	addi	s0,sp,48
    80003c44:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;


    int i = 0;
    80003c48:	00000993          	li	s3,0
    80003c4c:	01c0006f          	j	80003c68 <_Z8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    80003c50:	fffff097          	auipc	ra,0xfffff
    80003c54:	a3c080e7          	jalr	-1476(ra) # 8000268c <_Z15thread_dispatchv>
    80003c58:	0500006f          	j	80003ca8 <_Z8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    80003c5c:	00a00513          	li	a0,10
    80003c60:	fffff097          	auipc	ra,0xfffff
    80003c64:	bd8080e7          	jalr	-1064(ra) # 80002838 <_Z4putcc>
    while (!threadEnd) {
    80003c68:	00006797          	auipc	a5,0x6
    80003c6c:	1087a783          	lw	a5,264(a5) # 80009d70 <threadEnd>
    80003c70:	04079463          	bnez	a5,80003cb8 <_Z8consumerPv+0x90>
        int key = data->buffer->get();
    80003c74:	00893503          	ld	a0,8(s2)
    80003c78:	00000097          	auipc	ra,0x0
    80003c7c:	cbc080e7          	jalr	-836(ra) # 80003934 <_ZN6Buffer3getEv>
        i++;
    80003c80:	0019849b          	addiw	s1,s3,1
    80003c84:	0004899b          	sext.w	s3,s1
        putc(key);
    80003c88:	0ff57513          	andi	a0,a0,255
    80003c8c:	fffff097          	auipc	ra,0xfffff
    80003c90:	bac080e7          	jalr	-1108(ra) # 80002838 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80003c94:	00092703          	lw	a4,0(s2)
    80003c98:	0027179b          	slliw	a5,a4,0x2
    80003c9c:	00e787bb          	addw	a5,a5,a4
    80003ca0:	02f4e7bb          	remw	a5,s1,a5
    80003ca4:	fa0786e3          	beqz	a5,80003c50 <_Z8consumerPv+0x28>
        if (i % 80 == 0) {
    80003ca8:	05000793          	li	a5,80
    80003cac:	02f4e4bb          	remw	s1,s1,a5
    80003cb0:	fa049ce3          	bnez	s1,80003c68 <_Z8consumerPv+0x40>
    80003cb4:	fa9ff06f          	j	80003c5c <_Z8consumerPv+0x34>
        }
    }

    sem_signal(data->wait);
    80003cb8:	01093503          	ld	a0,16(s2)
    80003cbc:	fffff097          	auipc	ra,0xfffff
    80003cc0:	ae0080e7          	jalr	-1312(ra) # 8000279c <_Z10sem_signalP4_sem>
}
    80003cc4:	02813083          	ld	ra,40(sp)
    80003cc8:	02013403          	ld	s0,32(sp)
    80003ccc:	01813483          	ld	s1,24(sp)
    80003cd0:	01013903          	ld	s2,16(sp)
    80003cd4:	00813983          	ld	s3,8(sp)
    80003cd8:	03010113          	addi	sp,sp,48
    80003cdc:	00008067          	ret

0000000080003ce0 <_Z11printStringPKc>:
{
    80003ce0:	fe010113          	addi	sp,sp,-32
    80003ce4:	00113c23          	sd	ra,24(sp)
    80003ce8:	00813823          	sd	s0,16(sp)
    80003cec:	00913423          	sd	s1,8(sp)
    80003cf0:	02010413          	addi	s0,sp,32
    80003cf4:	00050493          	mv	s1,a0
    LOCK();
    80003cf8:	00100613          	li	a2,1
    80003cfc:	00000593          	li	a1,0
    80003d00:	00006517          	auipc	a0,0x6
    80003d04:	06850513          	addi	a0,a0,104 # 80009d68 <lockPrint>
    80003d08:	ffffd097          	auipc	ra,0xffffd
    80003d0c:	478080e7          	jalr	1144(ra) # 80001180 <copy_and_swap>
    80003d10:	fe0514e3          	bnez	a0,80003cf8 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80003d14:	0004c503          	lbu	a0,0(s1)
    80003d18:	00050a63          	beqz	a0,80003d2c <_Z11printStringPKc+0x4c>
        putc(*string);
    80003d1c:	fffff097          	auipc	ra,0xfffff
    80003d20:	b1c080e7          	jalr	-1252(ra) # 80002838 <_Z4putcc>
        string++;
    80003d24:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80003d28:	fedff06f          	j	80003d14 <_Z11printStringPKc+0x34>
    UNLOCK();
    80003d2c:	00000613          	li	a2,0
    80003d30:	00100593          	li	a1,1
    80003d34:	00006517          	auipc	a0,0x6
    80003d38:	03450513          	addi	a0,a0,52 # 80009d68 <lockPrint>
    80003d3c:	ffffd097          	auipc	ra,0xffffd
    80003d40:	444080e7          	jalr	1092(ra) # 80001180 <copy_and_swap>
    80003d44:	fe0514e3          	bnez	a0,80003d2c <_Z11printStringPKc+0x4c>
}
    80003d48:	01813083          	ld	ra,24(sp)
    80003d4c:	01013403          	ld	s0,16(sp)
    80003d50:	00813483          	ld	s1,8(sp)
    80003d54:	02010113          	addi	sp,sp,32
    80003d58:	00008067          	ret

0000000080003d5c <_Z11workerBodyAPv>:
    if (n == 0 || n == 1) { return n; }
    if (n % 10 == 0) { thread_dispatch(); }
    return fibonacci(n - 1) + fibonacci(n - 2);
}

void workerBodyA(void* arg) {
    80003d5c:	fe010113          	addi	sp,sp,-32
    80003d60:	00113c23          	sd	ra,24(sp)
    80003d64:	00813823          	sd	s0,16(sp)
    80003d68:	00913423          	sd	s1,8(sp)
    80003d6c:	01213023          	sd	s2,0(sp)
    80003d70:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80003d74:	00000913          	li	s2,0
    80003d78:	0380006f          	j	80003db0 <_Z11workerBodyAPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003d7c:	fffff097          	auipc	ra,0xfffff
    80003d80:	910080e7          	jalr	-1776(ra) # 8000268c <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003d84:	00148493          	addi	s1,s1,1
    80003d88:	000027b7          	lui	a5,0x2
    80003d8c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003d90:	0097ee63          	bltu	a5,s1,80003dac <_Z11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003d94:	00000713          	li	a4,0
    80003d98:	000077b7          	lui	a5,0x7
    80003d9c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003da0:	fce7eee3          	bltu	a5,a4,80003d7c <_Z11workerBodyAPv+0x20>
    80003da4:	00170713          	addi	a4,a4,1
    80003da8:	ff1ff06f          	j	80003d98 <_Z11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80003dac:	00190913          	addi	s2,s2,1
    80003db0:	00900793          	li	a5,9
    80003db4:	0527e063          	bltu	a5,s2,80003df4 <_Z11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80003db8:	00004517          	auipc	a0,0x4
    80003dbc:	44850513          	addi	a0,a0,1096 # 80008200 <_ZZ14kprintUnsignedmE6digits+0x10>
    80003dc0:	00000097          	auipc	ra,0x0
    80003dc4:	f20080e7          	jalr	-224(ra) # 80003ce0 <_Z11printStringPKc>
    80003dc8:	00000613          	li	a2,0
    80003dcc:	00a00593          	li	a1,10
    80003dd0:	0009051b          	sext.w	a0,s2
    80003dd4:	00000097          	auipc	ra,0x0
    80003dd8:	bec080e7          	jalr	-1044(ra) # 800039c0 <_ZL8printIntiii>
    80003ddc:	00004517          	auipc	a0,0x4
    80003de0:	3ac50513          	addi	a0,a0,940 # 80008188 <CONSOLE_STATUS+0x178>
    80003de4:	00000097          	auipc	ra,0x0
    80003de8:	efc080e7          	jalr	-260(ra) # 80003ce0 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003dec:	00000493          	li	s1,0
    80003df0:	f99ff06f          	j	80003d88 <_Z11workerBodyAPv+0x2c>
        }
    }
    printString("A finished!\n");
    80003df4:	00004517          	auipc	a0,0x4
    80003df8:	41450513          	addi	a0,a0,1044 # 80008208 <_ZZ14kprintUnsignedmE6digits+0x18>
    80003dfc:	00000097          	auipc	ra,0x0
    80003e00:	ee4080e7          	jalr	-284(ra) # 80003ce0 <_Z11printStringPKc>
    finishedA = true;
    80003e04:	00100793          	li	a5,1
    80003e08:	00006717          	auipc	a4,0x6
    80003e0c:	f6f70623          	sb	a5,-148(a4) # 80009d74 <finishedA>
}
    80003e10:	01813083          	ld	ra,24(sp)
    80003e14:	01013403          	ld	s0,16(sp)
    80003e18:	00813483          	ld	s1,8(sp)
    80003e1c:	00013903          	ld	s2,0(sp)
    80003e20:	02010113          	addi	sp,sp,32
    80003e24:	00008067          	ret

0000000080003e28 <_Z11workerBodyBPv>:

void workerBodyB(void* arg) {
    80003e28:	fe010113          	addi	sp,sp,-32
    80003e2c:	00113c23          	sd	ra,24(sp)
    80003e30:	00813823          	sd	s0,16(sp)
    80003e34:	00913423          	sd	s1,8(sp)
    80003e38:	01213023          	sd	s2,0(sp)
    80003e3c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80003e40:	00000913          	li	s2,0
    80003e44:	0380006f          	j	80003e7c <_Z11workerBodyBPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003e48:	fffff097          	auipc	ra,0xfffff
    80003e4c:	844080e7          	jalr	-1980(ra) # 8000268c <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003e50:	00148493          	addi	s1,s1,1
    80003e54:	000027b7          	lui	a5,0x2
    80003e58:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003e5c:	0097ee63          	bltu	a5,s1,80003e78 <_Z11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003e60:	00000713          	li	a4,0
    80003e64:	000077b7          	lui	a5,0x7
    80003e68:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003e6c:	fce7eee3          	bltu	a5,a4,80003e48 <_Z11workerBodyBPv+0x20>
    80003e70:	00170713          	addi	a4,a4,1
    80003e74:	ff1ff06f          	j	80003e64 <_Z11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80003e78:	00190913          	addi	s2,s2,1
    80003e7c:	00f00793          	li	a5,15
    80003e80:	0527e063          	bltu	a5,s2,80003ec0 <_Z11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80003e84:	00004517          	auipc	a0,0x4
    80003e88:	39450513          	addi	a0,a0,916 # 80008218 <_ZZ14kprintUnsignedmE6digits+0x28>
    80003e8c:	00000097          	auipc	ra,0x0
    80003e90:	e54080e7          	jalr	-428(ra) # 80003ce0 <_Z11printStringPKc>
    80003e94:	00000613          	li	a2,0
    80003e98:	00a00593          	li	a1,10
    80003e9c:	0009051b          	sext.w	a0,s2
    80003ea0:	00000097          	auipc	ra,0x0
    80003ea4:	b20080e7          	jalr	-1248(ra) # 800039c0 <_ZL8printIntiii>
    80003ea8:	00004517          	auipc	a0,0x4
    80003eac:	2e050513          	addi	a0,a0,736 # 80008188 <CONSOLE_STATUS+0x178>
    80003eb0:	00000097          	auipc	ra,0x0
    80003eb4:	e30080e7          	jalr	-464(ra) # 80003ce0 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003eb8:	00000493          	li	s1,0
    80003ebc:	f99ff06f          	j	80003e54 <_Z11workerBodyBPv+0x2c>
        }
    }
    printString("B finished!\n");
    80003ec0:	00004517          	auipc	a0,0x4
    80003ec4:	36050513          	addi	a0,a0,864 # 80008220 <_ZZ14kprintUnsignedmE6digits+0x30>
    80003ec8:	00000097          	auipc	ra,0x0
    80003ecc:	e18080e7          	jalr	-488(ra) # 80003ce0 <_Z11printStringPKc>
    finishedB = true;
    80003ed0:	00100793          	li	a5,1
    80003ed4:	00006717          	auipc	a4,0x6
    80003ed8:	eaf700a3          	sb	a5,-351(a4) # 80009d75 <finishedB>
    thread_dispatch();
    80003edc:	ffffe097          	auipc	ra,0xffffe
    80003ee0:	7b0080e7          	jalr	1968(ra) # 8000268c <_Z15thread_dispatchv>
}
    80003ee4:	01813083          	ld	ra,24(sp)
    80003ee8:	01013403          	ld	s0,16(sp)
    80003eec:	00813483          	ld	s1,8(sp)
    80003ef0:	00013903          	ld	s2,0(sp)
    80003ef4:	02010113          	addi	sp,sp,32
    80003ef8:	00008067          	ret

0000000080003efc <_Z9sleepyRunPv>:

#include "printing.hpp"

bool finished[2];

void sleepyRun(void *arg) {
    80003efc:	fe010113          	addi	sp,sp,-32
    80003f00:	00113c23          	sd	ra,24(sp)
    80003f04:	00813823          	sd	s0,16(sp)
    80003f08:	00913423          	sd	s1,8(sp)
    80003f0c:	01213023          	sd	s2,0(sp)
    80003f10:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    80003f14:	00053903          	ld	s2,0(a0)
    int i = 6;
    80003f18:	00600493          	li	s1,6
    while (--i > 0) {
    80003f1c:	fff4849b          	addiw	s1,s1,-1
    80003f20:	04905463          	blez	s1,80003f68 <_Z9sleepyRunPv+0x6c>

        printString("Hello ");
    80003f24:	00004517          	auipc	a0,0x4
    80003f28:	30c50513          	addi	a0,a0,780 # 80008230 <_ZZ14kprintUnsignedmE6digits+0x40>
    80003f2c:	00000097          	auipc	ra,0x0
    80003f30:	db4080e7          	jalr	-588(ra) # 80003ce0 <_Z11printStringPKc>
        printInt(sleep_time);
    80003f34:	00000613          	li	a2,0
    80003f38:	00a00593          	li	a1,10
    80003f3c:	0009051b          	sext.w	a0,s2
    80003f40:	00000097          	auipc	ra,0x0
    80003f44:	a80080e7          	jalr	-1408(ra) # 800039c0 <_ZL8printIntiii>
        printString(" !\n");
    80003f48:	00004517          	auipc	a0,0x4
    80003f4c:	2f050513          	addi	a0,a0,752 # 80008238 <_ZZ14kprintUnsignedmE6digits+0x48>
    80003f50:	00000097          	auipc	ra,0x0
    80003f54:	d90080e7          	jalr	-624(ra) # 80003ce0 <_Z11printStringPKc>
        time_sleep(sleep_time);
    80003f58:	00090513          	mv	a0,s2
    80003f5c:	fffff097          	auipc	ra,0xfffff
    80003f60:	874080e7          	jalr	-1932(ra) # 800027d0 <_Z10time_sleepm>
    while (--i > 0) {
    80003f64:	fb9ff06f          	j	80003f1c <_Z9sleepyRunPv+0x20>
    }
    finished[sleep_time/10-1] = true;
    80003f68:	00a00793          	li	a5,10
    80003f6c:	02f95933          	divu	s2,s2,a5
    80003f70:	fff90913          	addi	s2,s2,-1
    80003f74:	00006797          	auipc	a5,0x6
    80003f78:	df478793          	addi	a5,a5,-524 # 80009d68 <lockPrint>
    80003f7c:	01278933          	add	s2,a5,s2
    80003f80:	00100793          	li	a5,1
    80003f84:	00f90823          	sb	a5,16(s2)
}
    80003f88:	01813083          	ld	ra,24(sp)
    80003f8c:	01013403          	ld	s0,16(sp)
    80003f90:	00813483          	ld	s1,8(sp)
    80003f94:	00013903          	ld	s2,0(sp)
    80003f98:	02010113          	addi	sp,sp,32
    80003f9c:	00008067          	ret

0000000080003fa0 <_Z11workerBodyEPv>:
//    printInteger(n);
//    printString(" fibonacci number\n");
    return fibonacci(n-1) + fibonacci(n-2);
}

void workerBodyE(void *) {
    80003fa0:	fe010113          	addi	sp,sp,-32
    80003fa4:	00113c23          	sd	ra,24(sp)
    80003fa8:	00813823          	sd	s0,16(sp)
    80003fac:	00913423          	sd	s1,8(sp)
    80003fb0:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80003fb4:	00000493          	li	s1,0
    80003fb8:	0180006f          	j	80003fd0 <_Z11workerBodyEPv+0x30>
        printString("A: i=");
        printInt(i);
        printString("\n");
        if (i % 4 == 0) time_sleep(50);
    80003fbc:	03200513          	li	a0,50
    80003fc0:	fffff097          	auipc	ra,0xfffff
    80003fc4:	810080e7          	jalr	-2032(ra) # 800027d0 <_Z10time_sleepm>
    80003fc8:	04c0006f          	j	80004014 <_Z11workerBodyEPv+0x74>
    for (uint64 i = 0; i < 10; i++) {
    80003fcc:	00148493          	addi	s1,s1,1
    80003fd0:	00900793          	li	a5,9
    80003fd4:	0497ec63          	bltu	a5,s1,8000402c <_Z11workerBodyEPv+0x8c>
        printString("A: i=");
    80003fd8:	00004517          	auipc	a0,0x4
    80003fdc:	22850513          	addi	a0,a0,552 # 80008200 <_ZZ14kprintUnsignedmE6digits+0x10>
    80003fe0:	00000097          	auipc	ra,0x0
    80003fe4:	d00080e7          	jalr	-768(ra) # 80003ce0 <_Z11printStringPKc>
        printInt(i);
    80003fe8:	00000613          	li	a2,0
    80003fec:	00a00593          	li	a1,10
    80003ff0:	0004851b          	sext.w	a0,s1
    80003ff4:	00000097          	auipc	ra,0x0
    80003ff8:	9cc080e7          	jalr	-1588(ra) # 800039c0 <_ZL8printIntiii>
        printString("\n");
    80003ffc:	00004517          	auipc	a0,0x4
    80004000:	18c50513          	addi	a0,a0,396 # 80008188 <CONSOLE_STATUS+0x178>
    80004004:	00000097          	auipc	ra,0x0
    80004008:	cdc080e7          	jalr	-804(ra) # 80003ce0 <_Z11printStringPKc>
        if (i % 4 == 0) time_sleep(50);
    8000400c:	0034f793          	andi	a5,s1,3
    80004010:	fa0786e3          	beqz	a5,80003fbc <_Z11workerBodyEPv+0x1c>
        for (uint64 k = 0; k < 30000; k++) {
    80004014:	00000713          	li	a4,0
    80004018:	000077b7          	lui	a5,0x7
    8000401c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80004020:	fae7e6e3          	bltu	a5,a4,80003fcc <_Z11workerBodyEPv+0x2c>
    80004024:	00170713          	addi	a4,a4,1
    80004028:	ff1ff06f          	j	80004018 <_Z11workerBodyEPv+0x78>
            //busy wait
        }
        // TCB::yield();
    }
    printString("Worker A finished\n");
    8000402c:	00004517          	auipc	a0,0x4
    80004030:	21450513          	addi	a0,a0,532 # 80008240 <_ZZ14kprintUnsignedmE6digits+0x50>
    80004034:	00000097          	auipc	ra,0x0
    80004038:	cac080e7          	jalr	-852(ra) # 80003ce0 <_Z11printStringPKc>
}
    8000403c:	01813083          	ld	ra,24(sp)
    80004040:	01013403          	ld	s0,16(sp)
    80004044:	00813483          	ld	s1,8(sp)
    80004048:	02010113          	addi	sp,sp,32
    8000404c:	00008067          	ret

0000000080004050 <_Z11workerBodyFPv>:

void workerBodyF(void *) {
    80004050:	fe010113          	addi	sp,sp,-32
    80004054:	00113c23          	sd	ra,24(sp)
    80004058:	00813823          	sd	s0,16(sp)
    8000405c:	00913423          	sd	s1,8(sp)
    80004060:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80004064:	00000493          	li	s1,0
    80004068:	0380006f          	j	800040a0 <_Z11workerBodyFPv+0x50>
        printString("B: i=");
        printInt(i);
        printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
    8000406c:	00168693          	addi	a3,a3,1
    80004070:	000027b7          	lui	a5,0x2
    80004074:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80004078:	00d7ee63          	bltu	a5,a3,80004094 <_Z11workerBodyFPv+0x44>
            for (uint64 k = 0; k < 30000; k++) {
    8000407c:	00000713          	li	a4,0
    80004080:	000077b7          	lui	a5,0x7
    80004084:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80004088:	fee7e2e3          	bltu	a5,a4,8000406c <_Z11workerBodyFPv+0x1c>
    8000408c:	00170713          	addi	a4,a4,1
    80004090:	ff1ff06f          	j	80004080 <_Z11workerBodyFPv+0x30>
                // busy wait
            }
            // TCB::yield()
        }
        thread_dispatch();
    80004094:	ffffe097          	auipc	ra,0xffffe
    80004098:	5f8080e7          	jalr	1528(ra) # 8000268c <_Z15thread_dispatchv>
    for (uint64 i = 0; i < 16; i++) {
    8000409c:	00148493          	addi	s1,s1,1
    800040a0:	00f00793          	li	a5,15
    800040a4:	0497e063          	bltu	a5,s1,800040e4 <_Z11workerBodyFPv+0x94>
        printString("B: i=");
    800040a8:	00004517          	auipc	a0,0x4
    800040ac:	17050513          	addi	a0,a0,368 # 80008218 <_ZZ14kprintUnsignedmE6digits+0x28>
    800040b0:	00000097          	auipc	ra,0x0
    800040b4:	c30080e7          	jalr	-976(ra) # 80003ce0 <_Z11printStringPKc>
        printInt(i);
    800040b8:	00000613          	li	a2,0
    800040bc:	00a00593          	li	a1,10
    800040c0:	0004851b          	sext.w	a0,s1
    800040c4:	00000097          	auipc	ra,0x0
    800040c8:	8fc080e7          	jalr	-1796(ra) # 800039c0 <_ZL8printIntiii>
        printString("\n");
    800040cc:	00004517          	auipc	a0,0x4
    800040d0:	0bc50513          	addi	a0,a0,188 # 80008188 <CONSOLE_STATUS+0x178>
    800040d4:	00000097          	auipc	ra,0x0
    800040d8:	c0c080e7          	jalr	-1012(ra) # 80003ce0 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800040dc:	00000693          	li	a3,0
    800040e0:	f91ff06f          	j	80004070 <_Z11workerBodyFPv+0x20>
    }
    printString("Worker B finished\n");
    800040e4:	00004517          	auipc	a0,0x4
    800040e8:	17450513          	addi	a0,a0,372 # 80008258 <_ZZ14kprintUnsignedmE6digits+0x68>
    800040ec:	00000097          	auipc	ra,0x0
    800040f0:	bf4080e7          	jalr	-1036(ra) # 80003ce0 <_Z11printStringPKc>
}
    800040f4:	01813083          	ld	ra,24(sp)
    800040f8:	01013403          	ld	s0,16(sp)
    800040fc:	00813483          	ld	s1,8(sp)
    80004100:	02010113          	addi	sp,sp,32
    80004104:	00008067          	ret

0000000080004108 <_Z9getStringPci>:
char* getString(char *buf, int max) {
    80004108:	fd010113          	addi	sp,sp,-48
    8000410c:	02113423          	sd	ra,40(sp)
    80004110:	02813023          	sd	s0,32(sp)
    80004114:	00913c23          	sd	s1,24(sp)
    80004118:	01213823          	sd	s2,16(sp)
    8000411c:	01313423          	sd	s3,8(sp)
    80004120:	01413023          	sd	s4,0(sp)
    80004124:	03010413          	addi	s0,sp,48
    80004128:	00050993          	mv	s3,a0
    8000412c:	00058a13          	mv	s4,a1
    LOCK();
    80004130:	00100613          	li	a2,1
    80004134:	00000593          	li	a1,0
    80004138:	00006517          	auipc	a0,0x6
    8000413c:	c3050513          	addi	a0,a0,-976 # 80009d68 <lockPrint>
    80004140:	ffffd097          	auipc	ra,0xffffd
    80004144:	040080e7          	jalr	64(ra) # 80001180 <copy_and_swap>
    80004148:	fe0514e3          	bnez	a0,80004130 <_Z9getStringPci+0x28>
    for(i=0; i+1 < max; ){
    8000414c:	00000913          	li	s2,0
    80004150:	00090493          	mv	s1,s2
    80004154:	0019091b          	addiw	s2,s2,1
    80004158:	03495a63          	bge	s2,s4,8000418c <_Z9getStringPci+0x84>
        cc = getc();
    8000415c:	ffffe097          	auipc	ra,0xffffe
    80004160:	6a8080e7          	jalr	1704(ra) # 80002804 <_Z4getcv>
        if(cc < 1)
    80004164:	02050463          	beqz	a0,8000418c <_Z9getStringPci+0x84>
        buf[i++] = c;
    80004168:	009984b3          	add	s1,s3,s1
    8000416c:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80004170:	00a00793          	li	a5,10
    80004174:	00f50a63          	beq	a0,a5,80004188 <_Z9getStringPci+0x80>
    80004178:	00d00793          	li	a5,13
    8000417c:	fcf51ae3          	bne	a0,a5,80004150 <_Z9getStringPci+0x48>
        buf[i++] = c;
    80004180:	00090493          	mv	s1,s2
    80004184:	0080006f          	j	8000418c <_Z9getStringPci+0x84>
    80004188:	00090493          	mv	s1,s2
    buf[i] = '\0';
    8000418c:	009984b3          	add	s1,s3,s1
    80004190:	00048023          	sb	zero,0(s1)
    UNLOCK();
    80004194:	00000613          	li	a2,0
    80004198:	00100593          	li	a1,1
    8000419c:	00006517          	auipc	a0,0x6
    800041a0:	bcc50513          	addi	a0,a0,-1076 # 80009d68 <lockPrint>
    800041a4:	ffffd097          	auipc	ra,0xffffd
    800041a8:	fdc080e7          	jalr	-36(ra) # 80001180 <copy_and_swap>
    800041ac:	fe0514e3          	bnez	a0,80004194 <_Z9getStringPci+0x8c>
}
    800041b0:	00098513          	mv	a0,s3
    800041b4:	02813083          	ld	ra,40(sp)
    800041b8:	02013403          	ld	s0,32(sp)
    800041bc:	01813483          	ld	s1,24(sp)
    800041c0:	01013903          	ld	s2,16(sp)
    800041c4:	00813983          	ld	s3,8(sp)
    800041c8:	00013a03          	ld	s4,0(sp)
    800041cc:	03010113          	addi	sp,sp,48
    800041d0:	00008067          	ret

00000000800041d4 <_Z11stringToIntPKc>:
int stringToInt(const char *s) {
    800041d4:	ff010113          	addi	sp,sp,-16
    800041d8:	00813423          	sd	s0,8(sp)
    800041dc:	01010413          	addi	s0,sp,16
    800041e0:	00050693          	mv	a3,a0
    n = 0;
    800041e4:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    800041e8:	0006c603          	lbu	a2,0(a3)
    800041ec:	fd06071b          	addiw	a4,a2,-48
    800041f0:	0ff77713          	andi	a4,a4,255
    800041f4:	00900793          	li	a5,9
    800041f8:	02e7e063          	bltu	a5,a4,80004218 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    800041fc:	0025179b          	slliw	a5,a0,0x2
    80004200:	00a787bb          	addw	a5,a5,a0
    80004204:	0017979b          	slliw	a5,a5,0x1
    80004208:	00168693          	addi	a3,a3,1
    8000420c:	00c787bb          	addw	a5,a5,a2
    80004210:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80004214:	fd5ff06f          	j	800041e8 <_Z11stringToIntPKc+0x14>
}
    80004218:	00813403          	ld	s0,8(sp)
    8000421c:	01010113          	addi	sp,sp,16
    80004220:	00008067          	ret

0000000080004224 <_Z9fibonaccim>:
uint64 fibonacci(uint64 n) {
    80004224:	fe010113          	addi	sp,sp,-32
    80004228:	00113c23          	sd	ra,24(sp)
    8000422c:	00813823          	sd	s0,16(sp)
    80004230:	00913423          	sd	s1,8(sp)
    80004234:	01213023          	sd	s2,0(sp)
    80004238:	02010413          	addi	s0,sp,32
    8000423c:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80004240:	00100793          	li	a5,1
    80004244:	02a7f863          	bgeu	a5,a0,80004274 <_Z9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80004248:	00a00793          	li	a5,10
    8000424c:	02f577b3          	remu	a5,a0,a5
    80004250:	02078e63          	beqz	a5,8000428c <_Z9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80004254:	fff48513          	addi	a0,s1,-1
    80004258:	00000097          	auipc	ra,0x0
    8000425c:	fcc080e7          	jalr	-52(ra) # 80004224 <_Z9fibonaccim>
    80004260:	00050913          	mv	s2,a0
    80004264:	ffe48513          	addi	a0,s1,-2
    80004268:	00000097          	auipc	ra,0x0
    8000426c:	fbc080e7          	jalr	-68(ra) # 80004224 <_Z9fibonaccim>
    80004270:	00a90533          	add	a0,s2,a0
}
    80004274:	01813083          	ld	ra,24(sp)
    80004278:	01013403          	ld	s0,16(sp)
    8000427c:	00813483          	ld	s1,8(sp)
    80004280:	00013903          	ld	s2,0(sp)
    80004284:	02010113          	addi	sp,sp,32
    80004288:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    8000428c:	ffffe097          	auipc	ra,0xffffe
    80004290:	400080e7          	jalr	1024(ra) # 8000268c <_Z15thread_dispatchv>
    80004294:	fc1ff06f          	j	80004254 <_Z9fibonaccim+0x30>

0000000080004298 <_Z11workerBodyCPv>:

void workerBodyC(void* arg) {
    80004298:	fe010113          	addi	sp,sp,-32
    8000429c:	00113c23          	sd	ra,24(sp)
    800042a0:	00813823          	sd	s0,16(sp)
    800042a4:	00913423          	sd	s1,8(sp)
    800042a8:	01213023          	sd	s2,0(sp)
    800042ac:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800042b0:	00000493          	li	s1,0
    800042b4:	0400006f          	j	800042f4 <_Z11workerBodyCPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    800042b8:	00004517          	auipc	a0,0x4
    800042bc:	fb850513          	addi	a0,a0,-72 # 80008270 <_ZZ14kprintUnsignedmE6digits+0x80>
    800042c0:	00000097          	auipc	ra,0x0
    800042c4:	a20080e7          	jalr	-1504(ra) # 80003ce0 <_Z11printStringPKc>
    800042c8:	00000613          	li	a2,0
    800042cc:	00a00593          	li	a1,10
    800042d0:	00048513          	mv	a0,s1
    800042d4:	fffff097          	auipc	ra,0xfffff
    800042d8:	6ec080e7          	jalr	1772(ra) # 800039c0 <_ZL8printIntiii>
    800042dc:	00004517          	auipc	a0,0x4
    800042e0:	eac50513          	addi	a0,a0,-340 # 80008188 <CONSOLE_STATUS+0x178>
    800042e4:	00000097          	auipc	ra,0x0
    800042e8:	9fc080e7          	jalr	-1540(ra) # 80003ce0 <_Z11printStringPKc>
    for (; i < 3; i++) {
    800042ec:	0014849b          	addiw	s1,s1,1
    800042f0:	0ff4f493          	andi	s1,s1,255
    800042f4:	00200793          	li	a5,2
    800042f8:	fc97f0e3          	bgeu	a5,s1,800042b8 <_Z11workerBodyCPv+0x20>
    }

    printString("C: dispatch\n");
    800042fc:	00004517          	auipc	a0,0x4
    80004300:	f7c50513          	addi	a0,a0,-132 # 80008278 <_ZZ14kprintUnsignedmE6digits+0x88>
    80004304:	00000097          	auipc	ra,0x0
    80004308:	9dc080e7          	jalr	-1572(ra) # 80003ce0 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    8000430c:	00700313          	li	t1,7
    thread_dispatch();
    80004310:	ffffe097          	auipc	ra,0xffffe
    80004314:	37c080e7          	jalr	892(ra) # 8000268c <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80004318:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    8000431c:	00004517          	auipc	a0,0x4
    80004320:	f6c50513          	addi	a0,a0,-148 # 80008288 <_ZZ14kprintUnsignedmE6digits+0x98>
    80004324:	00000097          	auipc	ra,0x0
    80004328:	9bc080e7          	jalr	-1604(ra) # 80003ce0 <_Z11printStringPKc>
    8000432c:	00000613          	li	a2,0
    80004330:	00a00593          	li	a1,10
    80004334:	0009051b          	sext.w	a0,s2
    80004338:	fffff097          	auipc	ra,0xfffff
    8000433c:	688080e7          	jalr	1672(ra) # 800039c0 <_ZL8printIntiii>
    80004340:	00004517          	auipc	a0,0x4
    80004344:	e4850513          	addi	a0,a0,-440 # 80008188 <CONSOLE_STATUS+0x178>
    80004348:	00000097          	auipc	ra,0x0
    8000434c:	998080e7          	jalr	-1640(ra) # 80003ce0 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80004350:	00c00513          	li	a0,12
    80004354:	00000097          	auipc	ra,0x0
    80004358:	ed0080e7          	jalr	-304(ra) # 80004224 <_Z9fibonaccim>
    8000435c:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80004360:	00004517          	auipc	a0,0x4
    80004364:	f3050513          	addi	a0,a0,-208 # 80008290 <_ZZ14kprintUnsignedmE6digits+0xa0>
    80004368:	00000097          	auipc	ra,0x0
    8000436c:	978080e7          	jalr	-1672(ra) # 80003ce0 <_Z11printStringPKc>
    80004370:	00000613          	li	a2,0
    80004374:	00a00593          	li	a1,10
    80004378:	0009051b          	sext.w	a0,s2
    8000437c:	fffff097          	auipc	ra,0xfffff
    80004380:	644080e7          	jalr	1604(ra) # 800039c0 <_ZL8printIntiii>
    80004384:	00004517          	auipc	a0,0x4
    80004388:	e0450513          	addi	a0,a0,-508 # 80008188 <CONSOLE_STATUS+0x178>
    8000438c:	00000097          	auipc	ra,0x0
    80004390:	954080e7          	jalr	-1708(ra) # 80003ce0 <_Z11printStringPKc>
    80004394:	0400006f          	j	800043d4 <_Z11workerBodyCPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80004398:	00004517          	auipc	a0,0x4
    8000439c:	ed850513          	addi	a0,a0,-296 # 80008270 <_ZZ14kprintUnsignedmE6digits+0x80>
    800043a0:	00000097          	auipc	ra,0x0
    800043a4:	940080e7          	jalr	-1728(ra) # 80003ce0 <_Z11printStringPKc>
    800043a8:	00000613          	li	a2,0
    800043ac:	00a00593          	li	a1,10
    800043b0:	00048513          	mv	a0,s1
    800043b4:	fffff097          	auipc	ra,0xfffff
    800043b8:	60c080e7          	jalr	1548(ra) # 800039c0 <_ZL8printIntiii>
    800043bc:	00004517          	auipc	a0,0x4
    800043c0:	dcc50513          	addi	a0,a0,-564 # 80008188 <CONSOLE_STATUS+0x178>
    800043c4:	00000097          	auipc	ra,0x0
    800043c8:	91c080e7          	jalr	-1764(ra) # 80003ce0 <_Z11printStringPKc>
    for (; i < 6; i++) {
    800043cc:	0014849b          	addiw	s1,s1,1
    800043d0:	0ff4f493          	andi	s1,s1,255
    800043d4:	00500793          	li	a5,5
    800043d8:	fc97f0e3          	bgeu	a5,s1,80004398 <_Z11workerBodyCPv+0x100>
    }

    printString("C finished!\n");
    800043dc:	00004517          	auipc	a0,0x4
    800043e0:	ec450513          	addi	a0,a0,-316 # 800082a0 <_ZZ14kprintUnsignedmE6digits+0xb0>
    800043e4:	00000097          	auipc	ra,0x0
    800043e8:	8fc080e7          	jalr	-1796(ra) # 80003ce0 <_Z11printStringPKc>
    finishedC = true;
    800043ec:	00100793          	li	a5,1
    800043f0:	00006717          	auipc	a4,0x6
    800043f4:	98f70523          	sb	a5,-1654(a4) # 80009d7a <finishedC>
    thread_dispatch();
    800043f8:	ffffe097          	auipc	ra,0xffffe
    800043fc:	294080e7          	jalr	660(ra) # 8000268c <_Z15thread_dispatchv>
}
    80004400:	01813083          	ld	ra,24(sp)
    80004404:	01013403          	ld	s0,16(sp)
    80004408:	00813483          	ld	s1,8(sp)
    8000440c:	00013903          	ld	s2,0(sp)
    80004410:	02010113          	addi	sp,sp,32
    80004414:	00008067          	ret

0000000080004418 <_Z11workerBodyDPv>:

void workerBodyD(void* arg) {
    80004418:	fe010113          	addi	sp,sp,-32
    8000441c:	00113c23          	sd	ra,24(sp)
    80004420:	00813823          	sd	s0,16(sp)
    80004424:	00913423          	sd	s1,8(sp)
    80004428:	01213023          	sd	s2,0(sp)
    8000442c:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80004430:	00a00493          	li	s1,10
    80004434:	0400006f          	j	80004474 <_Z11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004438:	00004517          	auipc	a0,0x4
    8000443c:	e7850513          	addi	a0,a0,-392 # 800082b0 <_ZZ14kprintUnsignedmE6digits+0xc0>
    80004440:	00000097          	auipc	ra,0x0
    80004444:	8a0080e7          	jalr	-1888(ra) # 80003ce0 <_Z11printStringPKc>
    80004448:	00000613          	li	a2,0
    8000444c:	00a00593          	li	a1,10
    80004450:	00048513          	mv	a0,s1
    80004454:	fffff097          	auipc	ra,0xfffff
    80004458:	56c080e7          	jalr	1388(ra) # 800039c0 <_ZL8printIntiii>
    8000445c:	00004517          	auipc	a0,0x4
    80004460:	d2c50513          	addi	a0,a0,-724 # 80008188 <CONSOLE_STATUS+0x178>
    80004464:	00000097          	auipc	ra,0x0
    80004468:	87c080e7          	jalr	-1924(ra) # 80003ce0 <_Z11printStringPKc>
    for (; i < 13; i++) {
    8000446c:	0014849b          	addiw	s1,s1,1
    80004470:	0ff4f493          	andi	s1,s1,255
    80004474:	00c00793          	li	a5,12
    80004478:	fc97f0e3          	bgeu	a5,s1,80004438 <_Z11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    8000447c:	00004517          	auipc	a0,0x4
    80004480:	e3c50513          	addi	a0,a0,-452 # 800082b8 <_ZZ14kprintUnsignedmE6digits+0xc8>
    80004484:	00000097          	auipc	ra,0x0
    80004488:	85c080e7          	jalr	-1956(ra) # 80003ce0 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    8000448c:	00500313          	li	t1,5
    thread_dispatch();
    80004490:	ffffe097          	auipc	ra,0xffffe
    80004494:	1fc080e7          	jalr	508(ra) # 8000268c <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80004498:	01000513          	li	a0,16
    8000449c:	00000097          	auipc	ra,0x0
    800044a0:	d88080e7          	jalr	-632(ra) # 80004224 <_Z9fibonaccim>
    800044a4:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    800044a8:	00004517          	auipc	a0,0x4
    800044ac:	e2050513          	addi	a0,a0,-480 # 800082c8 <_ZZ14kprintUnsignedmE6digits+0xd8>
    800044b0:	00000097          	auipc	ra,0x0
    800044b4:	830080e7          	jalr	-2000(ra) # 80003ce0 <_Z11printStringPKc>
    800044b8:	00000613          	li	a2,0
    800044bc:	00a00593          	li	a1,10
    800044c0:	0009051b          	sext.w	a0,s2
    800044c4:	fffff097          	auipc	ra,0xfffff
    800044c8:	4fc080e7          	jalr	1276(ra) # 800039c0 <_ZL8printIntiii>
    800044cc:	00004517          	auipc	a0,0x4
    800044d0:	cbc50513          	addi	a0,a0,-836 # 80008188 <CONSOLE_STATUS+0x178>
    800044d4:	00000097          	auipc	ra,0x0
    800044d8:	80c080e7          	jalr	-2036(ra) # 80003ce0 <_Z11printStringPKc>
    800044dc:	0400006f          	j	8000451c <_Z11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800044e0:	00004517          	auipc	a0,0x4
    800044e4:	dd050513          	addi	a0,a0,-560 # 800082b0 <_ZZ14kprintUnsignedmE6digits+0xc0>
    800044e8:	fffff097          	auipc	ra,0xfffff
    800044ec:	7f8080e7          	jalr	2040(ra) # 80003ce0 <_Z11printStringPKc>
    800044f0:	00000613          	li	a2,0
    800044f4:	00a00593          	li	a1,10
    800044f8:	00048513          	mv	a0,s1
    800044fc:	fffff097          	auipc	ra,0xfffff
    80004500:	4c4080e7          	jalr	1220(ra) # 800039c0 <_ZL8printIntiii>
    80004504:	00004517          	auipc	a0,0x4
    80004508:	c8450513          	addi	a0,a0,-892 # 80008188 <CONSOLE_STATUS+0x178>
    8000450c:	fffff097          	auipc	ra,0xfffff
    80004510:	7d4080e7          	jalr	2004(ra) # 80003ce0 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80004514:	0014849b          	addiw	s1,s1,1
    80004518:	0ff4f493          	andi	s1,s1,255
    8000451c:	00f00793          	li	a5,15
    80004520:	fc97f0e3          	bgeu	a5,s1,800044e0 <_Z11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80004524:	00004517          	auipc	a0,0x4
    80004528:	db450513          	addi	a0,a0,-588 # 800082d8 <_ZZ14kprintUnsignedmE6digits+0xe8>
    8000452c:	fffff097          	auipc	ra,0xfffff
    80004530:	7b4080e7          	jalr	1972(ra) # 80003ce0 <_Z11printStringPKc>
    finishedD = true;
    80004534:	00100793          	li	a5,1
    80004538:	00006717          	auipc	a4,0x6
    8000453c:	84f701a3          	sb	a5,-1981(a4) # 80009d7b <finishedD>
    thread_dispatch();
    80004540:	ffffe097          	auipc	ra,0xffffe
    80004544:	14c080e7          	jalr	332(ra) # 8000268c <_Z15thread_dispatchv>
}
    80004548:	01813083          	ld	ra,24(sp)
    8000454c:	01013403          	ld	s0,16(sp)
    80004550:	00813483          	ld	s1,8(sp)
    80004554:	00013903          	ld	s2,0(sp)
    80004558:	02010113          	addi	sp,sp,32
    8000455c:	00008067          	ret

0000000080004560 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    80004560:	fc010113          	addi	sp,sp,-64
    80004564:	02113c23          	sd	ra,56(sp)
    80004568:	02813823          	sd	s0,48(sp)
    8000456c:	02913423          	sd	s1,40(sp)
    80004570:	04010413          	addi	s0,sp,64
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80004574:	00000613          	li	a2,0
    80004578:	fffff597          	auipc	a1,0xfffff
    8000457c:	7e458593          	addi	a1,a1,2020 # 80003d5c <_Z11workerBodyAPv>
    80004580:	fc040513          	addi	a0,s0,-64
    80004584:	ffffe097          	auipc	ra,0xffffe
    80004588:	054080e7          	jalr	84(ra) # 800025d8 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadA created\n");
    8000458c:	00004517          	auipc	a0,0x4
    80004590:	d5c50513          	addi	a0,a0,-676 # 800082e8 <_ZZ14kprintUnsignedmE6digits+0xf8>
    80004594:	fffff097          	auipc	ra,0xfffff
    80004598:	74c080e7          	jalr	1868(ra) # 80003ce0 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    8000459c:	00000613          	li	a2,0
    800045a0:	00000597          	auipc	a1,0x0
    800045a4:	88858593          	addi	a1,a1,-1912 # 80003e28 <_Z11workerBodyBPv>
    800045a8:	fc840513          	addi	a0,s0,-56
    800045ac:	ffffe097          	auipc	ra,0xffffe
    800045b0:	02c080e7          	jalr	44(ra) # 800025d8 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadB created\n");
    800045b4:	00004517          	auipc	a0,0x4
    800045b8:	d4c50513          	addi	a0,a0,-692 # 80008300 <_ZZ14kprintUnsignedmE6digits+0x110>
    800045bc:	fffff097          	auipc	ra,0xfffff
    800045c0:	724080e7          	jalr	1828(ra) # 80003ce0 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    800045c4:	00000613          	li	a2,0
    800045c8:	00000597          	auipc	a1,0x0
    800045cc:	cd058593          	addi	a1,a1,-816 # 80004298 <_Z11workerBodyCPv>
    800045d0:	fd040513          	addi	a0,s0,-48
    800045d4:	ffffe097          	auipc	ra,0xffffe
    800045d8:	004080e7          	jalr	4(ra) # 800025d8 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadC created\n");
    800045dc:	00004517          	auipc	a0,0x4
    800045e0:	d3c50513          	addi	a0,a0,-708 # 80008318 <_ZZ14kprintUnsignedmE6digits+0x128>
    800045e4:	fffff097          	auipc	ra,0xfffff
    800045e8:	6fc080e7          	jalr	1788(ra) # 80003ce0 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    800045ec:	00000613          	li	a2,0
    800045f0:	00000597          	auipc	a1,0x0
    800045f4:	e2858593          	addi	a1,a1,-472 # 80004418 <_Z11workerBodyDPv>
    800045f8:	fd840513          	addi	a0,s0,-40
    800045fc:	ffffe097          	auipc	ra,0xffffe
    80004600:	fdc080e7          	jalr	-36(ra) # 800025d8 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadD created\n");
    80004604:	00004517          	auipc	a0,0x4
    80004608:	d2c50513          	addi	a0,a0,-724 # 80008330 <_ZZ14kprintUnsignedmE6digits+0x140>
    8000460c:	fffff097          	auipc	ra,0xfffff
    80004610:	6d4080e7          	jalr	1748(ra) # 80003ce0 <_Z11printStringPKc>
    80004614:	00c0006f          	j	80004620 <_Z18Threads_C_API_testv+0xc0>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80004618:	ffffe097          	auipc	ra,0xffffe
    8000461c:	074080e7          	jalr	116(ra) # 8000268c <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80004620:	00005797          	auipc	a5,0x5
    80004624:	7547c783          	lbu	a5,1876(a5) # 80009d74 <finishedA>
    80004628:	fe0788e3          	beqz	a5,80004618 <_Z18Threads_C_API_testv+0xb8>
    8000462c:	00005797          	auipc	a5,0x5
    80004630:	7497c783          	lbu	a5,1865(a5) # 80009d75 <finishedB>
    80004634:	fe0782e3          	beqz	a5,80004618 <_Z18Threads_C_API_testv+0xb8>
    80004638:	00005797          	auipc	a5,0x5
    8000463c:	7427c783          	lbu	a5,1858(a5) # 80009d7a <finishedC>
    80004640:	fc078ce3          	beqz	a5,80004618 <_Z18Threads_C_API_testv+0xb8>
    80004644:	00005797          	auipc	a5,0x5
    80004648:	7377c783          	lbu	a5,1847(a5) # 80009d7b <finishedD>
    8000464c:	fc0786e3          	beqz	a5,80004618 <_Z18Threads_C_API_testv+0xb8>
    }

    for (auto &thread: threads) { delete thread; }
    80004650:	fc040493          	addi	s1,s0,-64
    80004654:	0080006f          	j	8000465c <_Z18Threads_C_API_testv+0xfc>
    80004658:	00848493          	addi	s1,s1,8
    8000465c:	fe040793          	addi	a5,s0,-32
    80004660:	00f48c63          	beq	s1,a5,80004678 <_Z18Threads_C_API_testv+0x118>
    80004664:	0004b503          	ld	a0,0(s1)
    80004668:	fe0508e3          	beqz	a0,80004658 <_Z18Threads_C_API_testv+0xf8>
    8000466c:	ffffe097          	auipc	ra,0xffffe
    80004670:	24c080e7          	jalr	588(ra) # 800028b8 <_ZdlPv>
    80004674:	fe5ff06f          	j	80004658 <_Z18Threads_C_API_testv+0xf8>
}
    80004678:	03813083          	ld	ra,56(sp)
    8000467c:	03013403          	ld	s0,48(sp)
    80004680:	02813483          	ld	s1,40(sp)
    80004684:	04010113          	addi	sp,sp,64
    80004688:	00008067          	ret

000000008000468c <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    8000468c:	f7010113          	addi	sp,sp,-144
    80004690:	08113423          	sd	ra,136(sp)
    80004694:	08813023          	sd	s0,128(sp)
    80004698:	06913c23          	sd	s1,120(sp)
    8000469c:	07213823          	sd	s2,112(sp)
    800046a0:	07313423          	sd	s3,104(sp)
    800046a4:	09010413          	addi	s0,sp,144
//    getString(input, 30);
//    n = stringToInt(input);

    n = 20;

    printString("Broj proizvodjaca "); printInt(threadNum);
    800046a8:	00004517          	auipc	a0,0x4
    800046ac:	ca050513          	addi	a0,a0,-864 # 80008348 <_ZZ14kprintUnsignedmE6digits+0x158>
    800046b0:	fffff097          	auipc	ra,0xfffff
    800046b4:	630080e7          	jalr	1584(ra) # 80003ce0 <_Z11printStringPKc>
    800046b8:	00000613          	li	a2,0
    800046bc:	00a00593          	li	a1,10
    800046c0:	00a00513          	li	a0,10
    800046c4:	fffff097          	auipc	ra,0xfffff
    800046c8:	2fc080e7          	jalr	764(ra) # 800039c0 <_ZL8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    800046cc:	00004517          	auipc	a0,0x4
    800046d0:	c9450513          	addi	a0,a0,-876 # 80008360 <_ZZ14kprintUnsignedmE6digits+0x170>
    800046d4:	fffff097          	auipc	ra,0xfffff
    800046d8:	60c080e7          	jalr	1548(ra) # 80003ce0 <_Z11printStringPKc>
    800046dc:	00000613          	li	a2,0
    800046e0:	00a00593          	li	a1,10
    800046e4:	01400513          	li	a0,20
    800046e8:	fffff097          	auipc	ra,0xfffff
    800046ec:	2d8080e7          	jalr	728(ra) # 800039c0 <_ZL8printIntiii>
    printString(".\n");
    800046f0:	00004517          	auipc	a0,0x4
    800046f4:	c8850513          	addi	a0,a0,-888 # 80008378 <_ZZ14kprintUnsignedmE6digits+0x188>
    800046f8:	fffff097          	auipc	ra,0xfffff
    800046fc:	5e8080e7          	jalr	1512(ra) # 80003ce0 <_Z11printStringPKc>

    Buffer *buffer = new Buffer(n);
    80004700:	03800513          	li	a0,56
    80004704:	ffffe097          	auipc	ra,0xffffe
    80004708:	164080e7          	jalr	356(ra) # 80002868 <_Znwm>
    8000470c:	00050993          	mv	s3,a0
    80004710:	01400593          	li	a1,20
    80004714:	fffff097          	auipc	ra,0xfffff
    80004718:	05c080e7          	jalr	92(ra) # 80003770 <_ZN6BufferC1Ei>

    sem_open(&waitForAll, 0);
    8000471c:	00000593          	li	a1,0
    80004720:	00005517          	auipc	a0,0x5
    80004724:	66050513          	addi	a0,a0,1632 # 80009d80 <waitForAll>
    80004728:	ffffe097          	auipc	ra,0xffffe
    8000472c:	f94080e7          	jalr	-108(ra) # 800026bc <_Z8sem_openPP4_semj>

    thread_t threads[threadNum];
    thread_t consumerThread;

    struct thread_data data[threadNum + 1];
    80004730:	ef010113          	addi	sp,sp,-272
    80004734:	00010913          	mv	s2,sp

    data[threadNum].id = threadNum;
    80004738:	00a00793          	li	a5,10
    8000473c:	0ef92823          	sw	a5,240(s2)
    data[threadNum].buffer = buffer;
    80004740:	0f393c23          	sd	s3,248(s2)
    data[threadNum].wait = waitForAll;
    80004744:	00005797          	auipc	a5,0x5
    80004748:	63c7b783          	ld	a5,1596(a5) # 80009d80 <waitForAll>
    8000474c:	10f93023          	sd	a5,256(s2)
    thread_create(&consumerThread, consumer, data + threadNum);
    80004750:	0f090613          	addi	a2,s2,240
    80004754:	fffff597          	auipc	a1,0xfffff
    80004758:	4d458593          	addi	a1,a1,1236 # 80003c28 <_Z8consumerPv>
    8000475c:	fc840513          	addi	a0,s0,-56
    80004760:	ffffe097          	auipc	ra,0xffffe
    80004764:	e78080e7          	jalr	-392(ra) # 800025d8 <_Z13thread_createPP7_threadPFvPvES2_>

    for (int i = 0; i < threadNum; i++) {
    80004768:	00000493          	li	s1,0
    8000476c:	00900793          	li	a5,9
    80004770:	0697c863          	blt	a5,s1,800047e0 <_Z22producerConsumer_C_APIv+0x154>
        data[i].id = i;
    80004774:	00149793          	slli	a5,s1,0x1
    80004778:	009787b3          	add	a5,a5,s1
    8000477c:	00379793          	slli	a5,a5,0x3
    80004780:	00f907b3          	add	a5,s2,a5
    80004784:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80004788:	0137b423          	sd	s3,8(a5)
        data[i].wait = waitForAll;
    8000478c:	00005717          	auipc	a4,0x5
    80004790:	5f473703          	ld	a4,1524(a4) # 80009d80 <waitForAll>
    80004794:	00e7b823          	sd	a4,16(a5)

        thread_create(threads + i,
    80004798:	00048713          	mv	a4,s1
    8000479c:	00349513          	slli	a0,s1,0x3
    800047a0:	f7840793          	addi	a5,s0,-136
    800047a4:	00a78533          	add	a0,a5,a0
    800047a8:	02905663          	blez	s1,800047d4 <_Z22producerConsumer_C_APIv+0x148>
    800047ac:	fffff597          	auipc	a1,0xfffff
    800047b0:	3e858593          	addi	a1,a1,1000 # 80003b94 <_Z8producerPv>
                      i > 0 ? producer : producerKeyboard,
                      data + i);
    800047b4:	00171613          	slli	a2,a4,0x1
    800047b8:	00e60633          	add	a2,a2,a4
    800047bc:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    800047c0:	00c90633          	add	a2,s2,a2
    800047c4:	ffffe097          	auipc	ra,0xffffe
    800047c8:	e14080e7          	jalr	-492(ra) # 800025d8 <_Z13thread_createPP7_threadPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    800047cc:	0014849b          	addiw	s1,s1,1
    800047d0:	f9dff06f          	j	8000476c <_Z22producerConsumer_C_APIv+0xe0>
        thread_create(threads + i,
    800047d4:	fffff597          	auipc	a1,0xfffff
    800047d8:	30058593          	addi	a1,a1,768 # 80003ad4 <_Z16producerKeyboardPv>
    800047dc:	fd9ff06f          	j	800047b4 <_Z22producerConsumer_C_APIv+0x128>
    }

    thread_dispatch();
    800047e0:	ffffe097          	auipc	ra,0xffffe
    800047e4:	eac080e7          	jalr	-340(ra) # 8000268c <_Z15thread_dispatchv>

    for (int i = 0; i <= threadNum; i++) {
    800047e8:	00000493          	li	s1,0
    800047ec:	0180006f          	j	80004804 <_Z22producerConsumer_C_APIv+0x178>
        sem_wait(waitForAll);
    800047f0:	00005517          	auipc	a0,0x5
    800047f4:	59053503          	ld	a0,1424(a0) # 80009d80 <waitForAll>
    800047f8:	ffffe097          	auipc	ra,0xffffe
    800047fc:	f70080e7          	jalr	-144(ra) # 80002768 <_Z8sem_waitP4_sem>
    for (int i = 0; i <= threadNum; i++) {
    80004800:	0014849b          	addiw	s1,s1,1
    80004804:	00a00793          	li	a5,10
    80004808:	fe97d4e3          	bge	a5,s1,800047f0 <_Z22producerConsumer_C_APIv+0x164>
    }

    sem_close(waitForAll);
    8000480c:	00005517          	auipc	a0,0x5
    80004810:	57453503          	ld	a0,1396(a0) # 80009d80 <waitForAll>
    80004814:	ffffe097          	auipc	ra,0xffffe
    80004818:	f20080e7          	jalr	-224(ra) # 80002734 <_Z9sem_closeP4_sem>
}
    8000481c:	f7040113          	addi	sp,s0,-144
    80004820:	08813083          	ld	ra,136(sp)
    80004824:	08013403          	ld	s0,128(sp)
    80004828:	07813483          	ld	s1,120(sp)
    8000482c:	07013903          	ld	s2,112(sp)
    80004830:	06813983          	ld	s3,104(sp)
    80004834:	09010113          	addi	sp,sp,144
    80004838:	00008067          	ret
    8000483c:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    80004840:	00098513          	mv	a0,s3
    80004844:	ffffe097          	auipc	ra,0xffffe
    80004848:	074080e7          	jalr	116(ra) # 800028b8 <_ZdlPv>
    8000484c:	00048513          	mv	a0,s1
    80004850:	00006097          	auipc	ra,0x6
    80004854:	608080e7          	jalr	1544(ra) # 8000ae58 <_Unwind_Resume>

0000000080004858 <_Z12testSleepingv>:

void testSleeping() {
    80004858:	fc010113          	addi	sp,sp,-64
    8000485c:	02113c23          	sd	ra,56(sp)
    80004860:	02813823          	sd	s0,48(sp)
    80004864:	02913423          	sd	s1,40(sp)
    80004868:	04010413          	addi	s0,sp,64
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    8000486c:	00a00793          	li	a5,10
    80004870:	fcf43823          	sd	a5,-48(s0)
    80004874:	01400793          	li	a5,20
    80004878:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    for (int i = 0; i < sleepy_thread_count; i++) {
    8000487c:	00000493          	li	s1,0
    80004880:	02c0006f          	j	800048ac <_Z12testSleepingv+0x54>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    80004884:	00349793          	slli	a5,s1,0x3
    80004888:	fd040613          	addi	a2,s0,-48
    8000488c:	00f60633          	add	a2,a2,a5
    80004890:	fffff597          	auipc	a1,0xfffff
    80004894:	66c58593          	addi	a1,a1,1644 # 80003efc <_Z9sleepyRunPv>
    80004898:	fc040513          	addi	a0,s0,-64
    8000489c:	00f50533          	add	a0,a0,a5
    800048a0:	ffffe097          	auipc	ra,0xffffe
    800048a4:	d38080e7          	jalr	-712(ra) # 800025d8 <_Z13thread_createPP7_threadPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    800048a8:	0014849b          	addiw	s1,s1,1
    800048ac:	00100793          	li	a5,1
    800048b0:	fc97dae3          	bge	a5,s1,80004884 <_Z12testSleepingv+0x2c>
    }

    while (!(finished[0] && finished[1])) {}
    800048b4:	00005797          	auipc	a5,0x5
    800048b8:	4c47c783          	lbu	a5,1220(a5) # 80009d78 <finished>
    800048bc:	fe078ce3          	beqz	a5,800048b4 <_Z12testSleepingv+0x5c>
    800048c0:	00005797          	auipc	a5,0x5
    800048c4:	4b97c783          	lbu	a5,1209(a5) # 80009d79 <finished+0x1>
    800048c8:	fe0786e3          	beqz	a5,800048b4 <_Z12testSleepingv+0x5c>
}
    800048cc:	03813083          	ld	ra,56(sp)
    800048d0:	03013403          	ld	s0,48(sp)
    800048d4:	02813483          	ld	s1,40(sp)
    800048d8:	04010113          	addi	sp,sp,64
    800048dc:	00008067          	ret

00000000800048e0 <_Z3fibm>:
uint64 fib(uint64 n) {
    800048e0:	fe010113          	addi	sp,sp,-32
    800048e4:	00113c23          	sd	ra,24(sp)
    800048e8:	00813823          	sd	s0,16(sp)
    800048ec:	00913423          	sd	s1,8(sp)
    800048f0:	01213023          	sd	s2,0(sp)
    800048f4:	02010413          	addi	s0,sp,32
    800048f8:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) return n;
    800048fc:	00100793          	li	a5,1
    80004900:	02a7f663          	bgeu	a5,a0,8000492c <_Z3fibm+0x4c>
    if (n % 4 == 0) {
    80004904:	00357793          	andi	a5,a0,3
    80004908:	02078e63          	beqz	a5,80004944 <_Z3fibm+0x64>
    return fibonacci(n-1) + fibonacci(n-2);
    8000490c:	fff48513          	addi	a0,s1,-1
    80004910:	00000097          	auipc	ra,0x0
    80004914:	914080e7          	jalr	-1772(ra) # 80004224 <_Z9fibonaccim>
    80004918:	00050913          	mv	s2,a0
    8000491c:	ffe48513          	addi	a0,s1,-2
    80004920:	00000097          	auipc	ra,0x0
    80004924:	904080e7          	jalr	-1788(ra) # 80004224 <_Z9fibonaccim>
    80004928:	00a90533          	add	a0,s2,a0
}
    8000492c:	01813083          	ld	ra,24(sp)
    80004930:	01013403          	ld	s0,16(sp)
    80004934:	00813483          	ld	s1,8(sp)
    80004938:	00013903          	ld	s2,0(sp)
    8000493c:	02010113          	addi	sp,sp,32
    80004940:	00008067          	ret
        thread_dispatch();
    80004944:	ffffe097          	auipc	ra,0xffffe
    80004948:	d48080e7          	jalr	-696(ra) # 8000268c <_Z15thread_dispatchv>
    8000494c:	fc1ff06f          	j	8000490c <_Z3fibm+0x2c>

0000000080004950 <_Z11workerBodyGPv>:

void workerBodyG(void *) {
    80004950:	fe010113          	addi	sp,sp,-32
    80004954:	00113c23          	sd	ra,24(sp)
    80004958:	00813823          	sd	s0,16(sp)
    8000495c:	00913423          	sd	s1,8(sp)
    80004960:	01213023          	sd	s2,0(sp)
    80004964:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80004968:	00000493          	li	s1,0
    8000496c:	0400006f          	j	800049ac <_Z11workerBodyGPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i=");
    80004970:	00004517          	auipc	a0,0x4
    80004974:	90050513          	addi	a0,a0,-1792 # 80008270 <_ZZ14kprintUnsignedmE6digits+0x80>
    80004978:	fffff097          	auipc	ra,0xfffff
    8000497c:	368080e7          	jalr	872(ra) # 80003ce0 <_Z11printStringPKc>
        printInt(i);
    80004980:	00000613          	li	a2,0
    80004984:	00a00593          	li	a1,10
    80004988:	00048513          	mv	a0,s1
    8000498c:	fffff097          	auipc	ra,0xfffff
    80004990:	034080e7          	jalr	52(ra) # 800039c0 <_ZL8printIntiii>
        printString("\n");
    80004994:	00003517          	auipc	a0,0x3
    80004998:	7f450513          	addi	a0,a0,2036 # 80008188 <CONSOLE_STATUS+0x178>
    8000499c:	fffff097          	auipc	ra,0xfffff
    800049a0:	344080e7          	jalr	836(ra) # 80003ce0 <_Z11printStringPKc>
    for (; i < 3; i++) {
    800049a4:	0014849b          	addiw	s1,s1,1
    800049a8:	0ff4f493          	andi	s1,s1,255
    800049ac:	00200793          	li	a5,2
    800049b0:	fc97f0e3          	bgeu	a5,s1,80004970 <_Z11workerBodyGPv+0x20>
    }

    printString("C: yield\n");
    800049b4:	00004517          	auipc	a0,0x4
    800049b8:	9cc50513          	addi	a0,a0,-1588 # 80008380 <_ZZ14kprintUnsignedmE6digits+0x190>
    800049bc:	fffff097          	auipc	ra,0xfffff
    800049c0:	324080e7          	jalr	804(ra) # 80003ce0 <_Z11printStringPKc>
    __asm__("li t1, 7");
    800049c4:	00700313          	li	t1,7
    thread_dispatch();
    800049c8:	ffffe097          	auipc	ra,0xffffe
    800049cc:	cc4080e7          	jalr	-828(ra) # 8000268c <_Z15thread_dispatchv>

    uint64  t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    800049d0:	00030913          	mv	s2,t1

    printString("C: t1=");
    800049d4:	00004517          	auipc	a0,0x4
    800049d8:	8b450513          	addi	a0,a0,-1868 # 80008288 <_ZZ14kprintUnsignedmE6digits+0x98>
    800049dc:	fffff097          	auipc	ra,0xfffff
    800049e0:	304080e7          	jalr	772(ra) # 80003ce0 <_Z11printStringPKc>
    printInt(t1);
    800049e4:	00000613          	li	a2,0
    800049e8:	00a00593          	li	a1,10
    800049ec:	0009051b          	sext.w	a0,s2
    800049f0:	fffff097          	auipc	ra,0xfffff
    800049f4:	fd0080e7          	jalr	-48(ra) # 800039c0 <_ZL8printIntiii>
    printString("\n");
    800049f8:	00003517          	auipc	a0,0x3
    800049fc:	79050513          	addi	a0,a0,1936 # 80008188 <CONSOLE_STATUS+0x178>
    80004a00:	fffff097          	auipc	ra,0xfffff
    80004a04:	2e0080e7          	jalr	736(ra) # 80003ce0 <_Z11printStringPKc>

    uint64 result = fib(30);
    80004a08:	01e00513          	li	a0,30
    80004a0c:	00000097          	auipc	ra,0x0
    80004a10:	ed4080e7          	jalr	-300(ra) # 800048e0 <_Z3fibm>
    80004a14:	00050913          	mv	s2,a0
    printString("C: fibonacci=");
    80004a18:	00004517          	auipc	a0,0x4
    80004a1c:	97850513          	addi	a0,a0,-1672 # 80008390 <_ZZ14kprintUnsignedmE6digits+0x1a0>
    80004a20:	fffff097          	auipc	ra,0xfffff
    80004a24:	2c0080e7          	jalr	704(ra) # 80003ce0 <_Z11printStringPKc>
    printInt(result);
    80004a28:	00000613          	li	a2,0
    80004a2c:	00a00593          	li	a1,10
    80004a30:	0009051b          	sext.w	a0,s2
    80004a34:	fffff097          	auipc	ra,0xfffff
    80004a38:	f8c080e7          	jalr	-116(ra) # 800039c0 <_ZL8printIntiii>
    printString("\n");
    80004a3c:	00003517          	auipc	a0,0x3
    80004a40:	74c50513          	addi	a0,a0,1868 # 80008188 <CONSOLE_STATUS+0x178>
    80004a44:	fffff097          	auipc	ra,0xfffff
    80004a48:	29c080e7          	jalr	668(ra) # 80003ce0 <_Z11printStringPKc>
    80004a4c:	0400006f          	j	80004a8c <_Z11workerBodyGPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i=");
    80004a50:	00004517          	auipc	a0,0x4
    80004a54:	82050513          	addi	a0,a0,-2016 # 80008270 <_ZZ14kprintUnsignedmE6digits+0x80>
    80004a58:	fffff097          	auipc	ra,0xfffff
    80004a5c:	288080e7          	jalr	648(ra) # 80003ce0 <_Z11printStringPKc>
        printInt(i);
    80004a60:	00000613          	li	a2,0
    80004a64:	00a00593          	li	a1,10
    80004a68:	00048513          	mv	a0,s1
    80004a6c:	fffff097          	auipc	ra,0xfffff
    80004a70:	f54080e7          	jalr	-172(ra) # 800039c0 <_ZL8printIntiii>
        printString("\n");
    80004a74:	00003517          	auipc	a0,0x3
    80004a78:	71450513          	addi	a0,a0,1812 # 80008188 <CONSOLE_STATUS+0x178>
    80004a7c:	fffff097          	auipc	ra,0xfffff
    80004a80:	264080e7          	jalr	612(ra) # 80003ce0 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80004a84:	0014849b          	addiw	s1,s1,1
    80004a88:	0ff4f493          	andi	s1,s1,255
    80004a8c:	00500793          	li	a5,5
    80004a90:	fc97f0e3          	bgeu	a5,s1,80004a50 <_Z11workerBodyGPv+0x100>
    }
    // TCB::yield()
    printString("Worker C finished\n");
    80004a94:	00004517          	auipc	a0,0x4
    80004a98:	90c50513          	addi	a0,a0,-1780 # 800083a0 <_ZZ14kprintUnsignedmE6digits+0x1b0>
    80004a9c:	fffff097          	auipc	ra,0xfffff
    80004aa0:	244080e7          	jalr	580(ra) # 80003ce0 <_Z11printStringPKc>
}
    80004aa4:	01813083          	ld	ra,24(sp)
    80004aa8:	01013403          	ld	s0,16(sp)
    80004aac:	00813483          	ld	s1,8(sp)
    80004ab0:	00013903          	ld	s2,0(sp)
    80004ab4:	02010113          	addi	sp,sp,32
    80004ab8:	00008067          	ret

0000000080004abc <_Z11workerBodyHPv>:

void workerBodyH(void *) {
    80004abc:	fe010113          	addi	sp,sp,-32
    80004ac0:	00113c23          	sd	ra,24(sp)
    80004ac4:	00813823          	sd	s0,16(sp)
    80004ac8:	00913423          	sd	s1,8(sp)
    80004acc:	01213023          	sd	s2,0(sp)
    80004ad0:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80004ad4:	00a00493          	li	s1,10
    80004ad8:	0400006f          	j	80004b18 <_Z11workerBodyHPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i=");
    80004adc:	00003517          	auipc	a0,0x3
    80004ae0:	7d450513          	addi	a0,a0,2004 # 800082b0 <_ZZ14kprintUnsignedmE6digits+0xc0>
    80004ae4:	fffff097          	auipc	ra,0xfffff
    80004ae8:	1fc080e7          	jalr	508(ra) # 80003ce0 <_Z11printStringPKc>
        printInt(i);
    80004aec:	00000613          	li	a2,0
    80004af0:	00a00593          	li	a1,10
    80004af4:	00048513          	mv	a0,s1
    80004af8:	fffff097          	auipc	ra,0xfffff
    80004afc:	ec8080e7          	jalr	-312(ra) # 800039c0 <_ZL8printIntiii>
        printString("\n");
    80004b00:	00003517          	auipc	a0,0x3
    80004b04:	68850513          	addi	a0,a0,1672 # 80008188 <CONSOLE_STATUS+0x178>
    80004b08:	fffff097          	auipc	ra,0xfffff
    80004b0c:	1d8080e7          	jalr	472(ra) # 80003ce0 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80004b10:	0014849b          	addiw	s1,s1,1
    80004b14:	0ff4f493          	andi	s1,s1,255
    80004b18:	00c00793          	li	a5,12
    80004b1c:	fc97f0e3          	bgeu	a5,s1,80004adc <_Z11workerBodyHPv+0x20>
    }

    printString("D: yield\n");
    80004b20:	00004517          	auipc	a0,0x4
    80004b24:	89850513          	addi	a0,a0,-1896 # 800083b8 <_ZZ14kprintUnsignedmE6digits+0x1c8>
    80004b28:	fffff097          	auipc	ra,0xfffff
    80004b2c:	1b8080e7          	jalr	440(ra) # 80003ce0 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80004b30:	00500313          	li	t1,5
    thread_dispatch();
    80004b34:	ffffe097          	auipc	ra,0xffffe
    80004b38:	b58080e7          	jalr	-1192(ra) # 8000268c <_Z15thread_dispatchv>

    uint64 result = fib(23);
    80004b3c:	01700513          	li	a0,23
    80004b40:	00000097          	auipc	ra,0x0
    80004b44:	da0080e7          	jalr	-608(ra) # 800048e0 <_Z3fibm>
    80004b48:	00050913          	mv	s2,a0
    printString("D: fibonacci=");
    80004b4c:	00004517          	auipc	a0,0x4
    80004b50:	87c50513          	addi	a0,a0,-1924 # 800083c8 <_ZZ14kprintUnsignedmE6digits+0x1d8>
    80004b54:	fffff097          	auipc	ra,0xfffff
    80004b58:	18c080e7          	jalr	396(ra) # 80003ce0 <_Z11printStringPKc>
    printInt(result);
    80004b5c:	00000613          	li	a2,0
    80004b60:	00a00593          	li	a1,10
    80004b64:	0009051b          	sext.w	a0,s2
    80004b68:	fffff097          	auipc	ra,0xfffff
    80004b6c:	e58080e7          	jalr	-424(ra) # 800039c0 <_ZL8printIntiii>
    printString("\n");
    80004b70:	00003517          	auipc	a0,0x3
    80004b74:	61850513          	addi	a0,a0,1560 # 80008188 <CONSOLE_STATUS+0x178>
    80004b78:	fffff097          	auipc	ra,0xfffff
    80004b7c:	168080e7          	jalr	360(ra) # 80003ce0 <_Z11printStringPKc>
    80004b80:	0400006f          	j	80004bc0 <_Z11workerBodyHPv+0x104>

    for (; i < 16; i++) {
        printString("D: i=");
    80004b84:	00003517          	auipc	a0,0x3
    80004b88:	72c50513          	addi	a0,a0,1836 # 800082b0 <_ZZ14kprintUnsignedmE6digits+0xc0>
    80004b8c:	fffff097          	auipc	ra,0xfffff
    80004b90:	154080e7          	jalr	340(ra) # 80003ce0 <_Z11printStringPKc>
        printInt(i);
    80004b94:	00000613          	li	a2,0
    80004b98:	00a00593          	li	a1,10
    80004b9c:	00048513          	mv	a0,s1
    80004ba0:	fffff097          	auipc	ra,0xfffff
    80004ba4:	e20080e7          	jalr	-480(ra) # 800039c0 <_ZL8printIntiii>
        printString("\n");
    80004ba8:	00003517          	auipc	a0,0x3
    80004bac:	5e050513          	addi	a0,a0,1504 # 80008188 <CONSOLE_STATUS+0x178>
    80004bb0:	fffff097          	auipc	ra,0xfffff
    80004bb4:	130080e7          	jalr	304(ra) # 80003ce0 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80004bb8:	0014849b          	addiw	s1,s1,1
    80004bbc:	0ff4f493          	andi	s1,s1,255
    80004bc0:	00f00793          	li	a5,15
    80004bc4:	fc97f0e3          	bgeu	a5,s1,80004b84 <_Z11workerBodyHPv+0xc8>
    }
    // TCB::yield()
    printString("Worker D finished\n");
    80004bc8:	00004517          	auipc	a0,0x4
    80004bcc:	81050513          	addi	a0,a0,-2032 # 800083d8 <_ZZ14kprintUnsignedmE6digits+0x1e8>
    80004bd0:	fffff097          	auipc	ra,0xfffff
    80004bd4:	110080e7          	jalr	272(ra) # 80003ce0 <_Z11printStringPKc>
}
    80004bd8:	01813083          	ld	ra,24(sp)
    80004bdc:	01013403          	ld	s0,16(sp)
    80004be0:	00813483          	ld	s1,8(sp)
    80004be4:	00013903          	ld	s2,0(sp)
    80004be8:	02010113          	addi	sp,sp,32
    80004bec:	00008067          	ret

0000000080004bf0 <_Z10myUserMainv>:
#include "Workers.h"
#include "../h/syscall_c.h"
#include "ProducerConsumer.h"
#include "printing.hpp"

void myUserMain() {
    80004bf0:	fa010113          	addi	sp,sp,-96
    80004bf4:	04113c23          	sd	ra,88(sp)
    80004bf8:	04813823          	sd	s0,80(sp)
    80004bfc:	04913423          	sd	s1,72(sp)
    80004c00:	05213023          	sd	s2,64(sp)
    80004c04:	06010413          	addi	s0,sp,96
    printString("In user main\n");
    80004c08:	00003517          	auipc	a0,0x3
    80004c0c:	7e850513          	addi	a0,a0,2024 # 800083f0 <_ZZ14kprintUnsignedmE6digits+0x200>
    80004c10:	fffff097          	auipc	ra,0xfffff
    80004c14:	0d0080e7          	jalr	208(ra) # 80003ce0 <_Z11printStringPKc>

    void *mem = mem_alloc(25000);
    80004c18:	00006537          	lui	a0,0x6
    80004c1c:	1a850513          	addi	a0,a0,424 # 61a8 <_entry-0x7fff9e58>
    80004c20:	ffffe097          	auipc	ra,0xffffe
    80004c24:	950080e7          	jalr	-1712(ra) # 80002570 <_Z9mem_allocm>
    80004c28:	00050913          	mv	s2,a0
    printInt((uint64) mem);
    80004c2c:	00000613          	li	a2,0
    80004c30:	00a00593          	li	a1,10
    80004c34:	0005051b          	sext.w	a0,a0
    80004c38:	fffff097          	auipc	ra,0xfffff
    80004c3c:	d88080e7          	jalr	-632(ra) # 800039c0 <_ZL8printIntiii>
    printString("\n");
    80004c40:	00003517          	auipc	a0,0x3
    80004c44:	54850513          	addi	a0,a0,1352 # 80008188 <CONSOLE_STATUS+0x178>
    80004c48:	fffff097          	auipc	ra,0xfffff
    80004c4c:	098080e7          	jalr	152(ra) # 80003ce0 <_Z11printStringPKc>

    ProducerConsumer *obj = new ProducerConsumer();
    80004c50:	01800513          	li	a0,24
    80004c54:	ffffe097          	auipc	ra,0xffffe
    80004c58:	c14080e7          	jalr	-1004(ra) # 80002868 <_Znwm>
    80004c5c:	00050493          	mv	s1,a0
#include "../h/syscall_c.h"
#include "printing.hpp"

class ProducerConsumer {
public:
    ProducerConsumer() {
    80004c60:	00052823          	sw	zero,16(a0)
        sem_open(&semConsumer, 0);
    80004c64:	00000593          	li	a1,0
    80004c68:	00850513          	addi	a0,a0,8
    80004c6c:	ffffe097          	auipc	ra,0xffffe
    80004c70:	a50080e7          	jalr	-1456(ra) # 800026bc <_Z8sem_openPP4_semj>
        sem_open(&semProducer, 1);
    80004c74:	00100593          	li	a1,1
    80004c78:	00048513          	mv	a0,s1
    80004c7c:	ffffe097          	auipc	ra,0xffffe
    80004c80:	a40080e7          	jalr	-1472(ra) # 800026bc <_Z8sem_openPP4_semj>
    thread_t t5;
    thread_t t6;
    thread_t t7;
    thread_t t8;

    thread_create(&t1, &workerBodyE, nullptr);
    80004c84:	00000613          	li	a2,0
    80004c88:	fffff597          	auipc	a1,0xfffff
    80004c8c:	31858593          	addi	a1,a1,792 # 80003fa0 <_Z11workerBodyEPv>
    80004c90:	fd840513          	addi	a0,s0,-40
    80004c94:	ffffe097          	auipc	ra,0xffffe
    80004c98:	944080e7          	jalr	-1724(ra) # 800025d8 <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t2, &workerBodyF, nullptr);
    80004c9c:	00000613          	li	a2,0
    80004ca0:	fffff597          	auipc	a1,0xfffff
    80004ca4:	3b058593          	addi	a1,a1,944 # 80004050 <_Z11workerBodyFPv>
    80004ca8:	fd040513          	addi	a0,s0,-48
    80004cac:	ffffe097          	auipc	ra,0xffffe
    80004cb0:	92c080e7          	jalr	-1748(ra) # 800025d8 <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t3, &workerBodyG, nullptr);
    80004cb4:	00000613          	li	a2,0
    80004cb8:	00000597          	auipc	a1,0x0
    80004cbc:	c9858593          	addi	a1,a1,-872 # 80004950 <_Z11workerBodyGPv>
    80004cc0:	fc840513          	addi	a0,s0,-56
    80004cc4:	ffffe097          	auipc	ra,0xffffe
    80004cc8:	914080e7          	jalr	-1772(ra) # 800025d8 <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t4, &workerBodyH, nullptr);
    80004ccc:	00000613          	li	a2,0
    80004cd0:	00000597          	auipc	a1,0x0
    80004cd4:	dec58593          	addi	a1,a1,-532 # 80004abc <_Z11workerBodyHPv>
    80004cd8:	fc040513          	addi	a0,s0,-64
    80004cdc:	ffffe097          	auipc	ra,0xffffe
    80004ce0:	8fc080e7          	jalr	-1796(ra) # 800025d8 <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t5, &ProducerConsumer::produceWrapper, obj);
    80004ce4:	00048613          	mv	a2,s1
    80004ce8:	00000597          	auipc	a1,0x0
    80004cec:	1a458593          	addi	a1,a1,420 # 80004e8c <_ZN16ProducerConsumer14produceWrapperEPv>
    80004cf0:	fb840513          	addi	a0,s0,-72
    80004cf4:	ffffe097          	auipc	ra,0xffffe
    80004cf8:	8e4080e7          	jalr	-1820(ra) # 800025d8 <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t6, &ProducerConsumer::consumeWrapper, obj);
    80004cfc:	00048613          	mv	a2,s1
    80004d00:	00000597          	auipc	a1,0x0
    80004d04:	27058593          	addi	a1,a1,624 # 80004f70 <_ZN16ProducerConsumer14consumeWrapperEPv>
    80004d08:	fb040513          	addi	a0,s0,-80
    80004d0c:	ffffe097          	auipc	ra,0xffffe
    80004d10:	8cc080e7          	jalr	-1844(ra) # 800025d8 <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t7, &ProducerConsumer::consumeWrapper, obj);
    80004d14:	00048613          	mv	a2,s1
    80004d18:	00000597          	auipc	a1,0x0
    80004d1c:	25858593          	addi	a1,a1,600 # 80004f70 <_ZN16ProducerConsumer14consumeWrapperEPv>
    80004d20:	fa840513          	addi	a0,s0,-88
    80004d24:	ffffe097          	auipc	ra,0xffffe
    80004d28:	8b4080e7          	jalr	-1868(ra) # 800025d8 <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t8, &ProducerConsumer::consumeWrapper, obj);
    80004d2c:	00048613          	mv	a2,s1
    80004d30:	00000597          	auipc	a1,0x0
    80004d34:	24058593          	addi	a1,a1,576 # 80004f70 <_ZN16ProducerConsumer14consumeWrapperEPv>
    80004d38:	fa040513          	addi	a0,s0,-96
    80004d3c:	ffffe097          	auipc	ra,0xffffe
    80004d40:	89c080e7          	jalr	-1892(ra) # 800025d8 <_Z13thread_createPP7_threadPFvPvES2_>

    time_sleep(50);
    80004d44:	03200513          	li	a0,50
    80004d48:	ffffe097          	auipc	ra,0xffffe
    80004d4c:	a88080e7          	jalr	-1400(ra) # 800027d0 <_Z10time_sleepm>

    printString("Nit t2: ");
    80004d50:	00003517          	auipc	a0,0x3
    80004d54:	6b050513          	addi	a0,a0,1712 # 80008400 <_ZZ14kprintUnsignedmE6digits+0x210>
    80004d58:	fffff097          	auipc	ra,0xfffff
    80004d5c:	f88080e7          	jalr	-120(ra) # 80003ce0 <_Z11printStringPKc>
    printInt((uint64) t2);
    80004d60:	00000613          	li	a2,0
    80004d64:	00a00593          	li	a1,10
    80004d68:	fd042503          	lw	a0,-48(s0)
    80004d6c:	fffff097          	auipc	ra,0xfffff
    80004d70:	c54080e7          	jalr	-940(ra) # 800039c0 <_ZL8printIntiii>
    printString("\n");
    80004d74:	00003517          	auipc	a0,0x3
    80004d78:	41450513          	addi	a0,a0,1044 # 80008188 <CONSOLE_STATUS+0x178>
    80004d7c:	fffff097          	auipc	ra,0xfffff
    80004d80:	f64080e7          	jalr	-156(ra) # 80003ce0 <_Z11printStringPKc>

    time_sleep(150);
    80004d84:	09600513          	li	a0,150
    80004d88:	ffffe097          	auipc	ra,0xffffe
    80004d8c:	a48080e7          	jalr	-1464(ra) # 800027d0 <_Z10time_sleepm>

    printString("Mem free called with ret value ");
    80004d90:	00003517          	auipc	a0,0x3
    80004d94:	68050513          	addi	a0,a0,1664 # 80008410 <_ZZ14kprintUnsignedmE6digits+0x220>
    80004d98:	fffff097          	auipc	ra,0xfffff
    80004d9c:	f48080e7          	jalr	-184(ra) # 80003ce0 <_Z11printStringPKc>
    printInt(mem_free(mem));
    80004da0:	00090513          	mv	a0,s2
    80004da4:	ffffe097          	auipc	ra,0xffffe
    80004da8:	800080e7          	jalr	-2048(ra) # 800025a4 <_Z8mem_freePv>
    80004dac:	00000613          	li	a2,0
    80004db0:	00a00593          	li	a1,10
    80004db4:	fffff097          	auipc	ra,0xfffff
    80004db8:	c0c080e7          	jalr	-1012(ra) # 800039c0 <_ZL8printIntiii>
    printString("\n");
    80004dbc:	00003517          	auipc	a0,0x3
    80004dc0:	3cc50513          	addi	a0,a0,972 # 80008188 <CONSOLE_STATUS+0x178>
    80004dc4:	fffff097          	auipc	ra,0xfffff
    80004dc8:	f1c080e7          	jalr	-228(ra) # 80003ce0 <_Z11printStringPKc>

    printString("Mem free called again with ret value ");
    80004dcc:	00003517          	auipc	a0,0x3
    80004dd0:	66450513          	addi	a0,a0,1636 # 80008430 <_ZZ14kprintUnsignedmE6digits+0x240>
    80004dd4:	fffff097          	auipc	ra,0xfffff
    80004dd8:	f0c080e7          	jalr	-244(ra) # 80003ce0 <_Z11printStringPKc>
    printInt(mem_free(mem));
    80004ddc:	00090513          	mv	a0,s2
    80004de0:	ffffd097          	auipc	ra,0xffffd
    80004de4:	7c4080e7          	jalr	1988(ra) # 800025a4 <_Z8mem_freePv>
    80004de8:	00000613          	li	a2,0
    80004dec:	00a00593          	li	a1,10
    80004df0:	fffff097          	auipc	ra,0xfffff
    80004df4:	bd0080e7          	jalr	-1072(ra) # 800039c0 <_ZL8printIntiii>
    printString("\n");
    80004df8:	00003517          	auipc	a0,0x3
    80004dfc:	39050513          	addi	a0,a0,912 # 80008188 <CONSOLE_STATUS+0x178>
    80004e00:	fffff097          	auipc	ra,0xfffff
    80004e04:	ee0080e7          	jalr	-288(ra) # 80003ce0 <_Z11printStringPKc>

    delete obj;
    80004e08:	00048863          	beqz	s1,80004e18 <_Z10myUserMainv+0x228>
    80004e0c:	00048513          	mv	a0,s1
    80004e10:	ffffe097          	auipc	ra,0xffffe
    80004e14:	aa8080e7          	jalr	-1368(ra) # 800028b8 <_ZdlPv>

    printString("User main finished\n");
    80004e18:	00003517          	auipc	a0,0x3
    80004e1c:	64050513          	addi	a0,a0,1600 # 80008458 <_ZZ14kprintUnsignedmE6digits+0x268>
    80004e20:	fffff097          	auipc	ra,0xfffff
    80004e24:	ec0080e7          	jalr	-320(ra) # 80003ce0 <_Z11printStringPKc>
}
    80004e28:	05813083          	ld	ra,88(sp)
    80004e2c:	05013403          	ld	s0,80(sp)
    80004e30:	04813483          	ld	s1,72(sp)
    80004e34:	04013903          	ld	s2,64(sp)
    80004e38:	06010113          	addi	sp,sp,96
    80004e3c:	00008067          	ret
    80004e40:	00050913          	mv	s2,a0
    ProducerConsumer *obj = new ProducerConsumer();
    80004e44:	00048513          	mv	a0,s1
    80004e48:	ffffe097          	auipc	ra,0xffffe
    80004e4c:	a70080e7          	jalr	-1424(ra) # 800028b8 <_ZdlPv>
    80004e50:	00090513          	mv	a0,s2
    80004e54:	00006097          	auipc	ra,0x6
    80004e58:	004080e7          	jalr	4(ra) # 8000ae58 <_Unwind_Resume>

0000000080004e5c <_Z8userMainv>:
#include "../test/ThreadSleep_C_API_test.hpp" // thread_sleep test C API
//#include "../test/ConsumerProducer_CPP_API_test.hpp" // zadatak 4. CPP API i asinhrona promena konteksta

#include "../test/myUserMain.h" // additional C API tests

void userMain() {
    80004e5c:	ff010113          	addi	sp,sp,-16
    80004e60:	00113423          	sd	ra,8(sp)
    80004e64:	00813023          	sd	s0,0(sp)
    80004e68:	01010413          	addi	s0,sp,16
    Threads_C_API_test(); // zadatak 2., niti C API i sinhrona promena konteksta
    80004e6c:	fffff097          	auipc	ra,0xfffff
    80004e70:	6f4080e7          	jalr	1780(ra) # 80004560 <_Z18Threads_C_API_testv>
    //Threads_CPP_API_test(); // zadatak 2., niti CPP API i sinhrona promena konteksta

//    producerConsumer_C_API(); // zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta
    //producerConsumer_CPP_Sync_API(); // zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta

    testSleeping(); // thread_sleep test C API
    80004e74:	00000097          	auipc	ra,0x0
    80004e78:	9e4080e7          	jalr	-1564(ra) # 80004858 <_Z12testSleepingv>
    //ConsumerProducerCPP::testConsumerProducer(); // zadatak 4. CPP API i asinhrona promena konteksta, kompletan test svega

//    myUserMain(); // additional C API tests - Extreme - Testing every functionality

    80004e7c:	00813083          	ld	ra,8(sp)
    80004e80:	00013403          	ld	s0,0(sp)
    80004e84:	01010113          	addi	sp,sp,16
    80004e88:	00008067          	ret

0000000080004e8c <_ZN16ProducerConsumer14produceWrapperEPv>:
        }

        printString("Consumer finished\n");
    }

    static void produceWrapper(void *obj) {
    80004e8c:	fe010113          	addi	sp,sp,-32
    80004e90:	00113c23          	sd	ra,24(sp)
    80004e94:	00813823          	sd	s0,16(sp)
    80004e98:	00913423          	sd	s1,8(sp)
    80004e9c:	01213023          	sd	s2,0(sp)
    80004ea0:	02010413          	addi	s0,sp,32
    80004ea4:	00050493          	mv	s1,a0
        for (int i = 1; i <= 150; i++) {
    80004ea8:	00100913          	li	s2,1
    80004eac:	09600793          	li	a5,150
    80004eb0:	0327c863          	blt	a5,s2,80004ee0 <_ZN16ProducerConsumer14produceWrapperEPv+0x54>
            sem_wait(semProducer);
    80004eb4:	0004b503          	ld	a0,0(s1)
    80004eb8:	ffffe097          	auipc	ra,0xffffe
    80004ebc:	8b0080e7          	jalr	-1872(ra) # 80002768 <_Z8sem_waitP4_sem>
            value++;
    80004ec0:	0104a783          	lw	a5,16(s1)
    80004ec4:	0017879b          	addiw	a5,a5,1
    80004ec8:	00f4a823          	sw	a5,16(s1)
            sem_signal(semConsumer);
    80004ecc:	0084b503          	ld	a0,8(s1)
    80004ed0:	ffffe097          	auipc	ra,0xffffe
    80004ed4:	8cc080e7          	jalr	-1844(ra) # 8000279c <_Z10sem_signalP4_sem>
        for (int i = 1; i <= 150; i++) {
    80004ed8:	0019091b          	addiw	s2,s2,1
    80004edc:	fd1ff06f          	j	80004eac <_ZN16ProducerConsumer14produceWrapperEPv+0x20>
        int a = sem_close(semProducer);
    80004ee0:	0004b503          	ld	a0,0(s1)
    80004ee4:	ffffe097          	auipc	ra,0xffffe
    80004ee8:	850080e7          	jalr	-1968(ra) # 80002734 <_Z9sem_closeP4_sem>
    80004eec:	00050913          	mv	s2,a0
        int b = sem_close(semConsumer);
    80004ef0:	0084b503          	ld	a0,8(s1)
    80004ef4:	ffffe097          	auipc	ra,0xffffe
    80004ef8:	840080e7          	jalr	-1984(ra) # 80002734 <_Z9sem_closeP4_sem>
    80004efc:	00050493          	mv	s1,a0
        printString("Producer finished with exit values: ");
    80004f00:	00003517          	auipc	a0,0x3
    80004f04:	57050513          	addi	a0,a0,1392 # 80008470 <_ZZ14kprintUnsignedmE6digits+0x280>
    80004f08:	fffff097          	auipc	ra,0xfffff
    80004f0c:	dd8080e7          	jalr	-552(ra) # 80003ce0 <_Z11printStringPKc>
        printInt(a);
    80004f10:	00000613          	li	a2,0
    80004f14:	00a00593          	li	a1,10
    80004f18:	00090513          	mv	a0,s2
    80004f1c:	fffff097          	auipc	ra,0xfffff
    80004f20:	aa4080e7          	jalr	-1372(ra) # 800039c0 <_ZL8printIntiii>
        printString(" and ");
    80004f24:	00003517          	auipc	a0,0x3
    80004f28:	57450513          	addi	a0,a0,1396 # 80008498 <_ZZ14kprintUnsignedmE6digits+0x2a8>
    80004f2c:	fffff097          	auipc	ra,0xfffff
    80004f30:	db4080e7          	jalr	-588(ra) # 80003ce0 <_Z11printStringPKc>
        printInt(b);
    80004f34:	00000613          	li	a2,0
    80004f38:	00a00593          	li	a1,10
    80004f3c:	00048513          	mv	a0,s1
    80004f40:	fffff097          	auipc	ra,0xfffff
    80004f44:	a80080e7          	jalr	-1408(ra) # 800039c0 <_ZL8printIntiii>
        printString("\n");
    80004f48:	00003517          	auipc	a0,0x3
    80004f4c:	24050513          	addi	a0,a0,576 # 80008188 <CONSOLE_STATUS+0x178>
    80004f50:	fffff097          	auipc	ra,0xfffff
    80004f54:	d90080e7          	jalr	-624(ra) # 80003ce0 <_Z11printStringPKc>
        ProducerConsumer *pc = (ProducerConsumer *) obj;
        pc->produce();
    }
    80004f58:	01813083          	ld	ra,24(sp)
    80004f5c:	01013403          	ld	s0,16(sp)
    80004f60:	00813483          	ld	s1,8(sp)
    80004f64:	00013903          	ld	s2,0(sp)
    80004f68:	02010113          	addi	sp,sp,32
    80004f6c:	00008067          	ret

0000000080004f70 <_ZN16ProducerConsumer14consumeWrapperEPv>:

    static void consumeWrapper(void *obj) {
    80004f70:	fe010113          	addi	sp,sp,-32
    80004f74:	00113c23          	sd	ra,24(sp)
    80004f78:	00813823          	sd	s0,16(sp)
    80004f7c:	00913423          	sd	s1,8(sp)
    80004f80:	01213023          	sd	s2,0(sp)
    80004f84:	02010413          	addi	s0,sp,32
    80004f88:	00050493          	mv	s1,a0
        for (int i = 1; i <= 50; i++) {
    80004f8c:	00100913          	li	s2,1
    80004f90:	03200793          	li	a5,50
    80004f94:	0727c863          	blt	a5,s2,80005004 <_ZN16ProducerConsumer14consumeWrapperEPv+0x94>
            sem_wait(semConsumer);
    80004f98:	0084b503          	ld	a0,8(s1)
    80004f9c:	ffffd097          	auipc	ra,0xffffd
    80004fa0:	7cc080e7          	jalr	1996(ra) # 80002768 <_Z8sem_waitP4_sem>
            printInt(value);
    80004fa4:	00000613          	li	a2,0
    80004fa8:	00a00593          	li	a1,10
    80004fac:	0104a503          	lw	a0,16(s1)
    80004fb0:	fffff097          	auipc	ra,0xfffff
    80004fb4:	a10080e7          	jalr	-1520(ra) # 800039c0 <_ZL8printIntiii>
            printString(" squared is: ");
    80004fb8:	00003517          	auipc	a0,0x3
    80004fbc:	4e850513          	addi	a0,a0,1256 # 800084a0 <_ZZ14kprintUnsignedmE6digits+0x2b0>
    80004fc0:	fffff097          	auipc	ra,0xfffff
    80004fc4:	d20080e7          	jalr	-736(ra) # 80003ce0 <_Z11printStringPKc>
            printInt(value * value);
    80004fc8:	0104a503          	lw	a0,16(s1)
    80004fcc:	00000613          	li	a2,0
    80004fd0:	00a00593          	li	a1,10
    80004fd4:	02a5053b          	mulw	a0,a0,a0
    80004fd8:	fffff097          	auipc	ra,0xfffff
    80004fdc:	9e8080e7          	jalr	-1560(ra) # 800039c0 <_ZL8printIntiii>
            printString("\n");
    80004fe0:	00003517          	auipc	a0,0x3
    80004fe4:	1a850513          	addi	a0,a0,424 # 80008188 <CONSOLE_STATUS+0x178>
    80004fe8:	fffff097          	auipc	ra,0xfffff
    80004fec:	cf8080e7          	jalr	-776(ra) # 80003ce0 <_Z11printStringPKc>
            sem_signal(semProducer);
    80004ff0:	0004b503          	ld	a0,0(s1)
    80004ff4:	ffffd097          	auipc	ra,0xffffd
    80004ff8:	7a8080e7          	jalr	1960(ra) # 8000279c <_Z10sem_signalP4_sem>
        for (int i = 1; i <= 50; i++) {
    80004ffc:	0019091b          	addiw	s2,s2,1
    80005000:	f91ff06f          	j	80004f90 <_ZN16ProducerConsumer14consumeWrapperEPv+0x20>
        printString("Consumer finished\n");
    80005004:	00003517          	auipc	a0,0x3
    80005008:	4ac50513          	addi	a0,a0,1196 # 800084b0 <_ZZ14kprintUnsignedmE6digits+0x2c0>
    8000500c:	fffff097          	auipc	ra,0xfffff
    80005010:	cd4080e7          	jalr	-812(ra) # 80003ce0 <_Z11printStringPKc>
        ProducerConsumer *pc = (ProducerConsumer *) obj;
        pc->consume();
    }
    80005014:	01813083          	ld	ra,24(sp)
    80005018:	01013403          	ld	s0,16(sp)
    8000501c:	00813483          	ld	s1,8(sp)
    80005020:	00013903          	ld	s2,0(sp)
    80005024:	02010113          	addi	sp,sp,32
    80005028:	00008067          	ret

000000008000502c <start>:
    8000502c:	ff010113          	addi	sp,sp,-16
    80005030:	00813423          	sd	s0,8(sp)
    80005034:	01010413          	addi	s0,sp,16
    80005038:	300027f3          	csrr	a5,mstatus
    8000503c:	ffffe737          	lui	a4,0xffffe
    80005040:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff380f>
    80005044:	00e7f7b3          	and	a5,a5,a4
    80005048:	00001737          	lui	a4,0x1
    8000504c:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80005050:	00e7e7b3          	or	a5,a5,a4
    80005054:	30079073          	csrw	mstatus,a5
    80005058:	00000797          	auipc	a5,0x0
    8000505c:	16078793          	addi	a5,a5,352 # 800051b8 <system_main>
    80005060:	34179073          	csrw	mepc,a5
    80005064:	00000793          	li	a5,0
    80005068:	18079073          	csrw	satp,a5
    8000506c:	000107b7          	lui	a5,0x10
    80005070:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80005074:	30279073          	csrw	medeleg,a5
    80005078:	30379073          	csrw	mideleg,a5
    8000507c:	104027f3          	csrr	a5,sie
    80005080:	2227e793          	ori	a5,a5,546
    80005084:	10479073          	csrw	sie,a5
    80005088:	fff00793          	li	a5,-1
    8000508c:	00a7d793          	srli	a5,a5,0xa
    80005090:	3b079073          	csrw	pmpaddr0,a5
    80005094:	00f00793          	li	a5,15
    80005098:	3a079073          	csrw	pmpcfg0,a5
    8000509c:	f14027f3          	csrr	a5,mhartid
    800050a0:	0200c737          	lui	a4,0x200c
    800050a4:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800050a8:	0007869b          	sext.w	a3,a5
    800050ac:	00269713          	slli	a4,a3,0x2
    800050b0:	000f4637          	lui	a2,0xf4
    800050b4:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800050b8:	00d70733          	add	a4,a4,a3
    800050bc:	0037979b          	slliw	a5,a5,0x3
    800050c0:	020046b7          	lui	a3,0x2004
    800050c4:	00d787b3          	add	a5,a5,a3
    800050c8:	00c585b3          	add	a1,a1,a2
    800050cc:	00371693          	slli	a3,a4,0x3
    800050d0:	00005717          	auipc	a4,0x5
    800050d4:	cc070713          	addi	a4,a4,-832 # 80009d90 <timer_scratch>
    800050d8:	00b7b023          	sd	a1,0(a5)
    800050dc:	00d70733          	add	a4,a4,a3
    800050e0:	00f73c23          	sd	a5,24(a4)
    800050e4:	02c73023          	sd	a2,32(a4)
    800050e8:	34071073          	csrw	mscratch,a4
    800050ec:	00000797          	auipc	a5,0x0
    800050f0:	6e478793          	addi	a5,a5,1764 # 800057d0 <timervec>
    800050f4:	30579073          	csrw	mtvec,a5
    800050f8:	300027f3          	csrr	a5,mstatus
    800050fc:	0087e793          	ori	a5,a5,8
    80005100:	30079073          	csrw	mstatus,a5
    80005104:	304027f3          	csrr	a5,mie
    80005108:	0807e793          	ori	a5,a5,128
    8000510c:	30479073          	csrw	mie,a5
    80005110:	f14027f3          	csrr	a5,mhartid
    80005114:	0007879b          	sext.w	a5,a5
    80005118:	00078213          	mv	tp,a5
    8000511c:	30200073          	mret
    80005120:	00813403          	ld	s0,8(sp)
    80005124:	01010113          	addi	sp,sp,16
    80005128:	00008067          	ret

000000008000512c <timerinit>:
    8000512c:	ff010113          	addi	sp,sp,-16
    80005130:	00813423          	sd	s0,8(sp)
    80005134:	01010413          	addi	s0,sp,16
    80005138:	f14027f3          	csrr	a5,mhartid
    8000513c:	0200c737          	lui	a4,0x200c
    80005140:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80005144:	0007869b          	sext.w	a3,a5
    80005148:	00269713          	slli	a4,a3,0x2
    8000514c:	000f4637          	lui	a2,0xf4
    80005150:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80005154:	00d70733          	add	a4,a4,a3
    80005158:	0037979b          	slliw	a5,a5,0x3
    8000515c:	020046b7          	lui	a3,0x2004
    80005160:	00d787b3          	add	a5,a5,a3
    80005164:	00c585b3          	add	a1,a1,a2
    80005168:	00371693          	slli	a3,a4,0x3
    8000516c:	00005717          	auipc	a4,0x5
    80005170:	c2470713          	addi	a4,a4,-988 # 80009d90 <timer_scratch>
    80005174:	00b7b023          	sd	a1,0(a5)
    80005178:	00d70733          	add	a4,a4,a3
    8000517c:	00f73c23          	sd	a5,24(a4)
    80005180:	02c73023          	sd	a2,32(a4)
    80005184:	34071073          	csrw	mscratch,a4
    80005188:	00000797          	auipc	a5,0x0
    8000518c:	64878793          	addi	a5,a5,1608 # 800057d0 <timervec>
    80005190:	30579073          	csrw	mtvec,a5
    80005194:	300027f3          	csrr	a5,mstatus
    80005198:	0087e793          	ori	a5,a5,8
    8000519c:	30079073          	csrw	mstatus,a5
    800051a0:	304027f3          	csrr	a5,mie
    800051a4:	0807e793          	ori	a5,a5,128
    800051a8:	30479073          	csrw	mie,a5
    800051ac:	00813403          	ld	s0,8(sp)
    800051b0:	01010113          	addi	sp,sp,16
    800051b4:	00008067          	ret

00000000800051b8 <system_main>:
    800051b8:	fe010113          	addi	sp,sp,-32
    800051bc:	00813823          	sd	s0,16(sp)
    800051c0:	00913423          	sd	s1,8(sp)
    800051c4:	00113c23          	sd	ra,24(sp)
    800051c8:	02010413          	addi	s0,sp,32
    800051cc:	00000097          	auipc	ra,0x0
    800051d0:	0c4080e7          	jalr	196(ra) # 80005290 <cpuid>
    800051d4:	00005497          	auipc	s1,0x5
    800051d8:	b2c48493          	addi	s1,s1,-1236 # 80009d00 <started>
    800051dc:	02050263          	beqz	a0,80005200 <system_main+0x48>
    800051e0:	0004a783          	lw	a5,0(s1)
    800051e4:	0007879b          	sext.w	a5,a5
    800051e8:	fe078ce3          	beqz	a5,800051e0 <system_main+0x28>
    800051ec:	0ff0000f          	fence
    800051f0:	00003517          	auipc	a0,0x3
    800051f4:	32050513          	addi	a0,a0,800 # 80008510 <_ZL6digits+0x48>
    800051f8:	00001097          	auipc	ra,0x1
    800051fc:	a74080e7          	jalr	-1420(ra) # 80005c6c <panic>
    80005200:	00001097          	auipc	ra,0x1
    80005204:	9c8080e7          	jalr	-1592(ra) # 80005bc8 <consoleinit>
    80005208:	00001097          	auipc	ra,0x1
    8000520c:	154080e7          	jalr	340(ra) # 8000635c <printfinit>
    80005210:	00003517          	auipc	a0,0x3
    80005214:	f7850513          	addi	a0,a0,-136 # 80008188 <CONSOLE_STATUS+0x178>
    80005218:	00001097          	auipc	ra,0x1
    8000521c:	ab0080e7          	jalr	-1360(ra) # 80005cc8 <__printf>
    80005220:	00003517          	auipc	a0,0x3
    80005224:	2c050513          	addi	a0,a0,704 # 800084e0 <_ZL6digits+0x18>
    80005228:	00001097          	auipc	ra,0x1
    8000522c:	aa0080e7          	jalr	-1376(ra) # 80005cc8 <__printf>
    80005230:	00003517          	auipc	a0,0x3
    80005234:	f5850513          	addi	a0,a0,-168 # 80008188 <CONSOLE_STATUS+0x178>
    80005238:	00001097          	auipc	ra,0x1
    8000523c:	a90080e7          	jalr	-1392(ra) # 80005cc8 <__printf>
    80005240:	00001097          	auipc	ra,0x1
    80005244:	4a8080e7          	jalr	1192(ra) # 800066e8 <kinit>
    80005248:	00000097          	auipc	ra,0x0
    8000524c:	148080e7          	jalr	328(ra) # 80005390 <trapinit>
    80005250:	00000097          	auipc	ra,0x0
    80005254:	16c080e7          	jalr	364(ra) # 800053bc <trapinithart>
    80005258:	00000097          	auipc	ra,0x0
    8000525c:	5b8080e7          	jalr	1464(ra) # 80005810 <plicinit>
    80005260:	00000097          	auipc	ra,0x0
    80005264:	5d8080e7          	jalr	1496(ra) # 80005838 <plicinithart>
    80005268:	00000097          	auipc	ra,0x0
    8000526c:	078080e7          	jalr	120(ra) # 800052e0 <userinit>
    80005270:	0ff0000f          	fence
    80005274:	00100793          	li	a5,1
    80005278:	00003517          	auipc	a0,0x3
    8000527c:	28050513          	addi	a0,a0,640 # 800084f8 <_ZL6digits+0x30>
    80005280:	00f4a023          	sw	a5,0(s1)
    80005284:	00001097          	auipc	ra,0x1
    80005288:	a44080e7          	jalr	-1468(ra) # 80005cc8 <__printf>
    8000528c:	0000006f          	j	8000528c <system_main+0xd4>

0000000080005290 <cpuid>:
    80005290:	ff010113          	addi	sp,sp,-16
    80005294:	00813423          	sd	s0,8(sp)
    80005298:	01010413          	addi	s0,sp,16
    8000529c:	00020513          	mv	a0,tp
    800052a0:	00813403          	ld	s0,8(sp)
    800052a4:	0005051b          	sext.w	a0,a0
    800052a8:	01010113          	addi	sp,sp,16
    800052ac:	00008067          	ret

00000000800052b0 <mycpu>:
    800052b0:	ff010113          	addi	sp,sp,-16
    800052b4:	00813423          	sd	s0,8(sp)
    800052b8:	01010413          	addi	s0,sp,16
    800052bc:	00020793          	mv	a5,tp
    800052c0:	00813403          	ld	s0,8(sp)
    800052c4:	0007879b          	sext.w	a5,a5
    800052c8:	00779793          	slli	a5,a5,0x7
    800052cc:	00006517          	auipc	a0,0x6
    800052d0:	af450513          	addi	a0,a0,-1292 # 8000adc0 <cpus>
    800052d4:	00f50533          	add	a0,a0,a5
    800052d8:	01010113          	addi	sp,sp,16
    800052dc:	00008067          	ret

00000000800052e0 <userinit>:
    800052e0:	ff010113          	addi	sp,sp,-16
    800052e4:	00813423          	sd	s0,8(sp)
    800052e8:	01010413          	addi	s0,sp,16
    800052ec:	00813403          	ld	s0,8(sp)
    800052f0:	01010113          	addi	sp,sp,16
    800052f4:	ffffc317          	auipc	t1,0xffffc
    800052f8:	77430067          	jr	1908(t1) # 80001a68 <main>

00000000800052fc <either_copyout>:
    800052fc:	ff010113          	addi	sp,sp,-16
    80005300:	00813023          	sd	s0,0(sp)
    80005304:	00113423          	sd	ra,8(sp)
    80005308:	01010413          	addi	s0,sp,16
    8000530c:	02051663          	bnez	a0,80005338 <either_copyout+0x3c>
    80005310:	00058513          	mv	a0,a1
    80005314:	00060593          	mv	a1,a2
    80005318:	0006861b          	sext.w	a2,a3
    8000531c:	00002097          	auipc	ra,0x2
    80005320:	c58080e7          	jalr	-936(ra) # 80006f74 <__memmove>
    80005324:	00813083          	ld	ra,8(sp)
    80005328:	00013403          	ld	s0,0(sp)
    8000532c:	00000513          	li	a0,0
    80005330:	01010113          	addi	sp,sp,16
    80005334:	00008067          	ret
    80005338:	00003517          	auipc	a0,0x3
    8000533c:	20050513          	addi	a0,a0,512 # 80008538 <_ZL6digits+0x70>
    80005340:	00001097          	auipc	ra,0x1
    80005344:	92c080e7          	jalr	-1748(ra) # 80005c6c <panic>

0000000080005348 <either_copyin>:
    80005348:	ff010113          	addi	sp,sp,-16
    8000534c:	00813023          	sd	s0,0(sp)
    80005350:	00113423          	sd	ra,8(sp)
    80005354:	01010413          	addi	s0,sp,16
    80005358:	02059463          	bnez	a1,80005380 <either_copyin+0x38>
    8000535c:	00060593          	mv	a1,a2
    80005360:	0006861b          	sext.w	a2,a3
    80005364:	00002097          	auipc	ra,0x2
    80005368:	c10080e7          	jalr	-1008(ra) # 80006f74 <__memmove>
    8000536c:	00813083          	ld	ra,8(sp)
    80005370:	00013403          	ld	s0,0(sp)
    80005374:	00000513          	li	a0,0
    80005378:	01010113          	addi	sp,sp,16
    8000537c:	00008067          	ret
    80005380:	00003517          	auipc	a0,0x3
    80005384:	1e050513          	addi	a0,a0,480 # 80008560 <_ZL6digits+0x98>
    80005388:	00001097          	auipc	ra,0x1
    8000538c:	8e4080e7          	jalr	-1820(ra) # 80005c6c <panic>

0000000080005390 <trapinit>:
    80005390:	ff010113          	addi	sp,sp,-16
    80005394:	00813423          	sd	s0,8(sp)
    80005398:	01010413          	addi	s0,sp,16
    8000539c:	00813403          	ld	s0,8(sp)
    800053a0:	00003597          	auipc	a1,0x3
    800053a4:	1e858593          	addi	a1,a1,488 # 80008588 <_ZL6digits+0xc0>
    800053a8:	00006517          	auipc	a0,0x6
    800053ac:	a9850513          	addi	a0,a0,-1384 # 8000ae40 <tickslock>
    800053b0:	01010113          	addi	sp,sp,16
    800053b4:	00001317          	auipc	t1,0x1
    800053b8:	5c430067          	jr	1476(t1) # 80006978 <initlock>

00000000800053bc <trapinithart>:
    800053bc:	ff010113          	addi	sp,sp,-16
    800053c0:	00813423          	sd	s0,8(sp)
    800053c4:	01010413          	addi	s0,sp,16
    800053c8:	00000797          	auipc	a5,0x0
    800053cc:	2f878793          	addi	a5,a5,760 # 800056c0 <kernelvec>
    800053d0:	10579073          	csrw	stvec,a5
    800053d4:	00813403          	ld	s0,8(sp)
    800053d8:	01010113          	addi	sp,sp,16
    800053dc:	00008067          	ret

00000000800053e0 <usertrap>:
    800053e0:	ff010113          	addi	sp,sp,-16
    800053e4:	00813423          	sd	s0,8(sp)
    800053e8:	01010413          	addi	s0,sp,16
    800053ec:	00813403          	ld	s0,8(sp)
    800053f0:	01010113          	addi	sp,sp,16
    800053f4:	00008067          	ret

00000000800053f8 <usertrapret>:
    800053f8:	ff010113          	addi	sp,sp,-16
    800053fc:	00813423          	sd	s0,8(sp)
    80005400:	01010413          	addi	s0,sp,16
    80005404:	00813403          	ld	s0,8(sp)
    80005408:	01010113          	addi	sp,sp,16
    8000540c:	00008067          	ret

0000000080005410 <kerneltrap>:
    80005410:	fe010113          	addi	sp,sp,-32
    80005414:	00813823          	sd	s0,16(sp)
    80005418:	00113c23          	sd	ra,24(sp)
    8000541c:	00913423          	sd	s1,8(sp)
    80005420:	02010413          	addi	s0,sp,32
    80005424:	142025f3          	csrr	a1,scause
    80005428:	100027f3          	csrr	a5,sstatus
    8000542c:	0027f793          	andi	a5,a5,2
    80005430:	10079c63          	bnez	a5,80005548 <kerneltrap+0x138>
    80005434:	142027f3          	csrr	a5,scause
    80005438:	0207ce63          	bltz	a5,80005474 <kerneltrap+0x64>
    8000543c:	00003517          	auipc	a0,0x3
    80005440:	19450513          	addi	a0,a0,404 # 800085d0 <_ZL6digits+0x108>
    80005444:	00001097          	auipc	ra,0x1
    80005448:	884080e7          	jalr	-1916(ra) # 80005cc8 <__printf>
    8000544c:	141025f3          	csrr	a1,sepc
    80005450:	14302673          	csrr	a2,stval
    80005454:	00003517          	auipc	a0,0x3
    80005458:	18c50513          	addi	a0,a0,396 # 800085e0 <_ZL6digits+0x118>
    8000545c:	00001097          	auipc	ra,0x1
    80005460:	86c080e7          	jalr	-1940(ra) # 80005cc8 <__printf>
    80005464:	00003517          	auipc	a0,0x3
    80005468:	19450513          	addi	a0,a0,404 # 800085f8 <_ZL6digits+0x130>
    8000546c:	00001097          	auipc	ra,0x1
    80005470:	800080e7          	jalr	-2048(ra) # 80005c6c <panic>
    80005474:	0ff7f713          	andi	a4,a5,255
    80005478:	00900693          	li	a3,9
    8000547c:	04d70063          	beq	a4,a3,800054bc <kerneltrap+0xac>
    80005480:	fff00713          	li	a4,-1
    80005484:	03f71713          	slli	a4,a4,0x3f
    80005488:	00170713          	addi	a4,a4,1
    8000548c:	fae798e3          	bne	a5,a4,8000543c <kerneltrap+0x2c>
    80005490:	00000097          	auipc	ra,0x0
    80005494:	e00080e7          	jalr	-512(ra) # 80005290 <cpuid>
    80005498:	06050663          	beqz	a0,80005504 <kerneltrap+0xf4>
    8000549c:	144027f3          	csrr	a5,sip
    800054a0:	ffd7f793          	andi	a5,a5,-3
    800054a4:	14479073          	csrw	sip,a5
    800054a8:	01813083          	ld	ra,24(sp)
    800054ac:	01013403          	ld	s0,16(sp)
    800054b0:	00813483          	ld	s1,8(sp)
    800054b4:	02010113          	addi	sp,sp,32
    800054b8:	00008067          	ret
    800054bc:	00000097          	auipc	ra,0x0
    800054c0:	3c8080e7          	jalr	968(ra) # 80005884 <plic_claim>
    800054c4:	00a00793          	li	a5,10
    800054c8:	00050493          	mv	s1,a0
    800054cc:	06f50863          	beq	a0,a5,8000553c <kerneltrap+0x12c>
    800054d0:	fc050ce3          	beqz	a0,800054a8 <kerneltrap+0x98>
    800054d4:	00050593          	mv	a1,a0
    800054d8:	00003517          	auipc	a0,0x3
    800054dc:	0d850513          	addi	a0,a0,216 # 800085b0 <_ZL6digits+0xe8>
    800054e0:	00000097          	auipc	ra,0x0
    800054e4:	7e8080e7          	jalr	2024(ra) # 80005cc8 <__printf>
    800054e8:	01013403          	ld	s0,16(sp)
    800054ec:	01813083          	ld	ra,24(sp)
    800054f0:	00048513          	mv	a0,s1
    800054f4:	00813483          	ld	s1,8(sp)
    800054f8:	02010113          	addi	sp,sp,32
    800054fc:	00000317          	auipc	t1,0x0
    80005500:	3c030067          	jr	960(t1) # 800058bc <plic_complete>
    80005504:	00006517          	auipc	a0,0x6
    80005508:	93c50513          	addi	a0,a0,-1732 # 8000ae40 <tickslock>
    8000550c:	00001097          	auipc	ra,0x1
    80005510:	490080e7          	jalr	1168(ra) # 8000699c <acquire>
    80005514:	00004717          	auipc	a4,0x4
    80005518:	7f070713          	addi	a4,a4,2032 # 80009d04 <ticks>
    8000551c:	00072783          	lw	a5,0(a4)
    80005520:	00006517          	auipc	a0,0x6
    80005524:	92050513          	addi	a0,a0,-1760 # 8000ae40 <tickslock>
    80005528:	0017879b          	addiw	a5,a5,1
    8000552c:	00f72023          	sw	a5,0(a4)
    80005530:	00001097          	auipc	ra,0x1
    80005534:	538080e7          	jalr	1336(ra) # 80006a68 <release>
    80005538:	f65ff06f          	j	8000549c <kerneltrap+0x8c>
    8000553c:	00001097          	auipc	ra,0x1
    80005540:	094080e7          	jalr	148(ra) # 800065d0 <uartintr>
    80005544:	fa5ff06f          	j	800054e8 <kerneltrap+0xd8>
    80005548:	00003517          	auipc	a0,0x3
    8000554c:	04850513          	addi	a0,a0,72 # 80008590 <_ZL6digits+0xc8>
    80005550:	00000097          	auipc	ra,0x0
    80005554:	71c080e7          	jalr	1820(ra) # 80005c6c <panic>

0000000080005558 <clockintr>:
    80005558:	fe010113          	addi	sp,sp,-32
    8000555c:	00813823          	sd	s0,16(sp)
    80005560:	00913423          	sd	s1,8(sp)
    80005564:	00113c23          	sd	ra,24(sp)
    80005568:	02010413          	addi	s0,sp,32
    8000556c:	00006497          	auipc	s1,0x6
    80005570:	8d448493          	addi	s1,s1,-1836 # 8000ae40 <tickslock>
    80005574:	00048513          	mv	a0,s1
    80005578:	00001097          	auipc	ra,0x1
    8000557c:	424080e7          	jalr	1060(ra) # 8000699c <acquire>
    80005580:	00004717          	auipc	a4,0x4
    80005584:	78470713          	addi	a4,a4,1924 # 80009d04 <ticks>
    80005588:	00072783          	lw	a5,0(a4)
    8000558c:	01013403          	ld	s0,16(sp)
    80005590:	01813083          	ld	ra,24(sp)
    80005594:	00048513          	mv	a0,s1
    80005598:	0017879b          	addiw	a5,a5,1
    8000559c:	00813483          	ld	s1,8(sp)
    800055a0:	00f72023          	sw	a5,0(a4)
    800055a4:	02010113          	addi	sp,sp,32
    800055a8:	00001317          	auipc	t1,0x1
    800055ac:	4c030067          	jr	1216(t1) # 80006a68 <release>

00000000800055b0 <devintr>:
    800055b0:	142027f3          	csrr	a5,scause
    800055b4:	00000513          	li	a0,0
    800055b8:	0007c463          	bltz	a5,800055c0 <devintr+0x10>
    800055bc:	00008067          	ret
    800055c0:	fe010113          	addi	sp,sp,-32
    800055c4:	00813823          	sd	s0,16(sp)
    800055c8:	00113c23          	sd	ra,24(sp)
    800055cc:	00913423          	sd	s1,8(sp)
    800055d0:	02010413          	addi	s0,sp,32
    800055d4:	0ff7f713          	andi	a4,a5,255
    800055d8:	00900693          	li	a3,9
    800055dc:	04d70c63          	beq	a4,a3,80005634 <devintr+0x84>
    800055e0:	fff00713          	li	a4,-1
    800055e4:	03f71713          	slli	a4,a4,0x3f
    800055e8:	00170713          	addi	a4,a4,1
    800055ec:	00e78c63          	beq	a5,a4,80005604 <devintr+0x54>
    800055f0:	01813083          	ld	ra,24(sp)
    800055f4:	01013403          	ld	s0,16(sp)
    800055f8:	00813483          	ld	s1,8(sp)
    800055fc:	02010113          	addi	sp,sp,32
    80005600:	00008067          	ret
    80005604:	00000097          	auipc	ra,0x0
    80005608:	c8c080e7          	jalr	-884(ra) # 80005290 <cpuid>
    8000560c:	06050663          	beqz	a0,80005678 <devintr+0xc8>
    80005610:	144027f3          	csrr	a5,sip
    80005614:	ffd7f793          	andi	a5,a5,-3
    80005618:	14479073          	csrw	sip,a5
    8000561c:	01813083          	ld	ra,24(sp)
    80005620:	01013403          	ld	s0,16(sp)
    80005624:	00813483          	ld	s1,8(sp)
    80005628:	00200513          	li	a0,2
    8000562c:	02010113          	addi	sp,sp,32
    80005630:	00008067          	ret
    80005634:	00000097          	auipc	ra,0x0
    80005638:	250080e7          	jalr	592(ra) # 80005884 <plic_claim>
    8000563c:	00a00793          	li	a5,10
    80005640:	00050493          	mv	s1,a0
    80005644:	06f50663          	beq	a0,a5,800056b0 <devintr+0x100>
    80005648:	00100513          	li	a0,1
    8000564c:	fa0482e3          	beqz	s1,800055f0 <devintr+0x40>
    80005650:	00048593          	mv	a1,s1
    80005654:	00003517          	auipc	a0,0x3
    80005658:	f5c50513          	addi	a0,a0,-164 # 800085b0 <_ZL6digits+0xe8>
    8000565c:	00000097          	auipc	ra,0x0
    80005660:	66c080e7          	jalr	1644(ra) # 80005cc8 <__printf>
    80005664:	00048513          	mv	a0,s1
    80005668:	00000097          	auipc	ra,0x0
    8000566c:	254080e7          	jalr	596(ra) # 800058bc <plic_complete>
    80005670:	00100513          	li	a0,1
    80005674:	f7dff06f          	j	800055f0 <devintr+0x40>
    80005678:	00005517          	auipc	a0,0x5
    8000567c:	7c850513          	addi	a0,a0,1992 # 8000ae40 <tickslock>
    80005680:	00001097          	auipc	ra,0x1
    80005684:	31c080e7          	jalr	796(ra) # 8000699c <acquire>
    80005688:	00004717          	auipc	a4,0x4
    8000568c:	67c70713          	addi	a4,a4,1660 # 80009d04 <ticks>
    80005690:	00072783          	lw	a5,0(a4)
    80005694:	00005517          	auipc	a0,0x5
    80005698:	7ac50513          	addi	a0,a0,1964 # 8000ae40 <tickslock>
    8000569c:	0017879b          	addiw	a5,a5,1
    800056a0:	00f72023          	sw	a5,0(a4)
    800056a4:	00001097          	auipc	ra,0x1
    800056a8:	3c4080e7          	jalr	964(ra) # 80006a68 <release>
    800056ac:	f65ff06f          	j	80005610 <devintr+0x60>
    800056b0:	00001097          	auipc	ra,0x1
    800056b4:	f20080e7          	jalr	-224(ra) # 800065d0 <uartintr>
    800056b8:	fadff06f          	j	80005664 <devintr+0xb4>
    800056bc:	0000                	unimp
	...

00000000800056c0 <kernelvec>:
    800056c0:	f0010113          	addi	sp,sp,-256
    800056c4:	00113023          	sd	ra,0(sp)
    800056c8:	00213423          	sd	sp,8(sp)
    800056cc:	00313823          	sd	gp,16(sp)
    800056d0:	00413c23          	sd	tp,24(sp)
    800056d4:	02513023          	sd	t0,32(sp)
    800056d8:	02613423          	sd	t1,40(sp)
    800056dc:	02713823          	sd	t2,48(sp)
    800056e0:	02813c23          	sd	s0,56(sp)
    800056e4:	04913023          	sd	s1,64(sp)
    800056e8:	04a13423          	sd	a0,72(sp)
    800056ec:	04b13823          	sd	a1,80(sp)
    800056f0:	04c13c23          	sd	a2,88(sp)
    800056f4:	06d13023          	sd	a3,96(sp)
    800056f8:	06e13423          	sd	a4,104(sp)
    800056fc:	06f13823          	sd	a5,112(sp)
    80005700:	07013c23          	sd	a6,120(sp)
    80005704:	09113023          	sd	a7,128(sp)
    80005708:	09213423          	sd	s2,136(sp)
    8000570c:	09313823          	sd	s3,144(sp)
    80005710:	09413c23          	sd	s4,152(sp)
    80005714:	0b513023          	sd	s5,160(sp)
    80005718:	0b613423          	sd	s6,168(sp)
    8000571c:	0b713823          	sd	s7,176(sp)
    80005720:	0b813c23          	sd	s8,184(sp)
    80005724:	0d913023          	sd	s9,192(sp)
    80005728:	0da13423          	sd	s10,200(sp)
    8000572c:	0db13823          	sd	s11,208(sp)
    80005730:	0dc13c23          	sd	t3,216(sp)
    80005734:	0fd13023          	sd	t4,224(sp)
    80005738:	0fe13423          	sd	t5,232(sp)
    8000573c:	0ff13823          	sd	t6,240(sp)
    80005740:	cd1ff0ef          	jal	ra,80005410 <kerneltrap>
    80005744:	00013083          	ld	ra,0(sp)
    80005748:	00813103          	ld	sp,8(sp)
    8000574c:	01013183          	ld	gp,16(sp)
    80005750:	02013283          	ld	t0,32(sp)
    80005754:	02813303          	ld	t1,40(sp)
    80005758:	03013383          	ld	t2,48(sp)
    8000575c:	03813403          	ld	s0,56(sp)
    80005760:	04013483          	ld	s1,64(sp)
    80005764:	04813503          	ld	a0,72(sp)
    80005768:	05013583          	ld	a1,80(sp)
    8000576c:	05813603          	ld	a2,88(sp)
    80005770:	06013683          	ld	a3,96(sp)
    80005774:	06813703          	ld	a4,104(sp)
    80005778:	07013783          	ld	a5,112(sp)
    8000577c:	07813803          	ld	a6,120(sp)
    80005780:	08013883          	ld	a7,128(sp)
    80005784:	08813903          	ld	s2,136(sp)
    80005788:	09013983          	ld	s3,144(sp)
    8000578c:	09813a03          	ld	s4,152(sp)
    80005790:	0a013a83          	ld	s5,160(sp)
    80005794:	0a813b03          	ld	s6,168(sp)
    80005798:	0b013b83          	ld	s7,176(sp)
    8000579c:	0b813c03          	ld	s8,184(sp)
    800057a0:	0c013c83          	ld	s9,192(sp)
    800057a4:	0c813d03          	ld	s10,200(sp)
    800057a8:	0d013d83          	ld	s11,208(sp)
    800057ac:	0d813e03          	ld	t3,216(sp)
    800057b0:	0e013e83          	ld	t4,224(sp)
    800057b4:	0e813f03          	ld	t5,232(sp)
    800057b8:	0f013f83          	ld	t6,240(sp)
    800057bc:	10010113          	addi	sp,sp,256
    800057c0:	10200073          	sret
    800057c4:	00000013          	nop
    800057c8:	00000013          	nop
    800057cc:	00000013          	nop

00000000800057d0 <timervec>:
    800057d0:	34051573          	csrrw	a0,mscratch,a0
    800057d4:	00b53023          	sd	a1,0(a0)
    800057d8:	00c53423          	sd	a2,8(a0)
    800057dc:	00d53823          	sd	a3,16(a0)
    800057e0:	01853583          	ld	a1,24(a0)
    800057e4:	02053603          	ld	a2,32(a0)
    800057e8:	0005b683          	ld	a3,0(a1)
    800057ec:	00c686b3          	add	a3,a3,a2
    800057f0:	00d5b023          	sd	a3,0(a1)
    800057f4:	00200593          	li	a1,2
    800057f8:	14459073          	csrw	sip,a1
    800057fc:	01053683          	ld	a3,16(a0)
    80005800:	00853603          	ld	a2,8(a0)
    80005804:	00053583          	ld	a1,0(a0)
    80005808:	34051573          	csrrw	a0,mscratch,a0
    8000580c:	30200073          	mret

0000000080005810 <plicinit>:
    80005810:	ff010113          	addi	sp,sp,-16
    80005814:	00813423          	sd	s0,8(sp)
    80005818:	01010413          	addi	s0,sp,16
    8000581c:	00813403          	ld	s0,8(sp)
    80005820:	0c0007b7          	lui	a5,0xc000
    80005824:	00100713          	li	a4,1
    80005828:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000582c:	00e7a223          	sw	a4,4(a5)
    80005830:	01010113          	addi	sp,sp,16
    80005834:	00008067          	ret

0000000080005838 <plicinithart>:
    80005838:	ff010113          	addi	sp,sp,-16
    8000583c:	00813023          	sd	s0,0(sp)
    80005840:	00113423          	sd	ra,8(sp)
    80005844:	01010413          	addi	s0,sp,16
    80005848:	00000097          	auipc	ra,0x0
    8000584c:	a48080e7          	jalr	-1464(ra) # 80005290 <cpuid>
    80005850:	0085171b          	slliw	a4,a0,0x8
    80005854:	0c0027b7          	lui	a5,0xc002
    80005858:	00e787b3          	add	a5,a5,a4
    8000585c:	40200713          	li	a4,1026
    80005860:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80005864:	00813083          	ld	ra,8(sp)
    80005868:	00013403          	ld	s0,0(sp)
    8000586c:	00d5151b          	slliw	a0,a0,0xd
    80005870:	0c2017b7          	lui	a5,0xc201
    80005874:	00a78533          	add	a0,a5,a0
    80005878:	00052023          	sw	zero,0(a0)
    8000587c:	01010113          	addi	sp,sp,16
    80005880:	00008067          	ret

0000000080005884 <plic_claim>:
    80005884:	ff010113          	addi	sp,sp,-16
    80005888:	00813023          	sd	s0,0(sp)
    8000588c:	00113423          	sd	ra,8(sp)
    80005890:	01010413          	addi	s0,sp,16
    80005894:	00000097          	auipc	ra,0x0
    80005898:	9fc080e7          	jalr	-1540(ra) # 80005290 <cpuid>
    8000589c:	00813083          	ld	ra,8(sp)
    800058a0:	00013403          	ld	s0,0(sp)
    800058a4:	00d5151b          	slliw	a0,a0,0xd
    800058a8:	0c2017b7          	lui	a5,0xc201
    800058ac:	00a78533          	add	a0,a5,a0
    800058b0:	00452503          	lw	a0,4(a0)
    800058b4:	01010113          	addi	sp,sp,16
    800058b8:	00008067          	ret

00000000800058bc <plic_complete>:
    800058bc:	fe010113          	addi	sp,sp,-32
    800058c0:	00813823          	sd	s0,16(sp)
    800058c4:	00913423          	sd	s1,8(sp)
    800058c8:	00113c23          	sd	ra,24(sp)
    800058cc:	02010413          	addi	s0,sp,32
    800058d0:	00050493          	mv	s1,a0
    800058d4:	00000097          	auipc	ra,0x0
    800058d8:	9bc080e7          	jalr	-1604(ra) # 80005290 <cpuid>
    800058dc:	01813083          	ld	ra,24(sp)
    800058e0:	01013403          	ld	s0,16(sp)
    800058e4:	00d5179b          	slliw	a5,a0,0xd
    800058e8:	0c201737          	lui	a4,0xc201
    800058ec:	00f707b3          	add	a5,a4,a5
    800058f0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    800058f4:	00813483          	ld	s1,8(sp)
    800058f8:	02010113          	addi	sp,sp,32
    800058fc:	00008067          	ret

0000000080005900 <consolewrite>:
    80005900:	fb010113          	addi	sp,sp,-80
    80005904:	04813023          	sd	s0,64(sp)
    80005908:	04113423          	sd	ra,72(sp)
    8000590c:	02913c23          	sd	s1,56(sp)
    80005910:	03213823          	sd	s2,48(sp)
    80005914:	03313423          	sd	s3,40(sp)
    80005918:	03413023          	sd	s4,32(sp)
    8000591c:	01513c23          	sd	s5,24(sp)
    80005920:	05010413          	addi	s0,sp,80
    80005924:	06c05c63          	blez	a2,8000599c <consolewrite+0x9c>
    80005928:	00060993          	mv	s3,a2
    8000592c:	00050a13          	mv	s4,a0
    80005930:	00058493          	mv	s1,a1
    80005934:	00000913          	li	s2,0
    80005938:	fff00a93          	li	s5,-1
    8000593c:	01c0006f          	j	80005958 <consolewrite+0x58>
    80005940:	fbf44503          	lbu	a0,-65(s0)
    80005944:	0019091b          	addiw	s2,s2,1
    80005948:	00148493          	addi	s1,s1,1
    8000594c:	00001097          	auipc	ra,0x1
    80005950:	a9c080e7          	jalr	-1380(ra) # 800063e8 <uartputc>
    80005954:	03298063          	beq	s3,s2,80005974 <consolewrite+0x74>
    80005958:	00048613          	mv	a2,s1
    8000595c:	00100693          	li	a3,1
    80005960:	000a0593          	mv	a1,s4
    80005964:	fbf40513          	addi	a0,s0,-65
    80005968:	00000097          	auipc	ra,0x0
    8000596c:	9e0080e7          	jalr	-1568(ra) # 80005348 <either_copyin>
    80005970:	fd5518e3          	bne	a0,s5,80005940 <consolewrite+0x40>
    80005974:	04813083          	ld	ra,72(sp)
    80005978:	04013403          	ld	s0,64(sp)
    8000597c:	03813483          	ld	s1,56(sp)
    80005980:	02813983          	ld	s3,40(sp)
    80005984:	02013a03          	ld	s4,32(sp)
    80005988:	01813a83          	ld	s5,24(sp)
    8000598c:	00090513          	mv	a0,s2
    80005990:	03013903          	ld	s2,48(sp)
    80005994:	05010113          	addi	sp,sp,80
    80005998:	00008067          	ret
    8000599c:	00000913          	li	s2,0
    800059a0:	fd5ff06f          	j	80005974 <consolewrite+0x74>

00000000800059a4 <consoleread>:
    800059a4:	f9010113          	addi	sp,sp,-112
    800059a8:	06813023          	sd	s0,96(sp)
    800059ac:	04913c23          	sd	s1,88(sp)
    800059b0:	05213823          	sd	s2,80(sp)
    800059b4:	05313423          	sd	s3,72(sp)
    800059b8:	05413023          	sd	s4,64(sp)
    800059bc:	03513c23          	sd	s5,56(sp)
    800059c0:	03613823          	sd	s6,48(sp)
    800059c4:	03713423          	sd	s7,40(sp)
    800059c8:	03813023          	sd	s8,32(sp)
    800059cc:	06113423          	sd	ra,104(sp)
    800059d0:	01913c23          	sd	s9,24(sp)
    800059d4:	07010413          	addi	s0,sp,112
    800059d8:	00060b93          	mv	s7,a2
    800059dc:	00050913          	mv	s2,a0
    800059e0:	00058c13          	mv	s8,a1
    800059e4:	00060b1b          	sext.w	s6,a2
    800059e8:	00005497          	auipc	s1,0x5
    800059ec:	48048493          	addi	s1,s1,1152 # 8000ae68 <cons>
    800059f0:	00400993          	li	s3,4
    800059f4:	fff00a13          	li	s4,-1
    800059f8:	00a00a93          	li	s5,10
    800059fc:	05705e63          	blez	s7,80005a58 <consoleread+0xb4>
    80005a00:	09c4a703          	lw	a4,156(s1)
    80005a04:	0984a783          	lw	a5,152(s1)
    80005a08:	0007071b          	sext.w	a4,a4
    80005a0c:	08e78463          	beq	a5,a4,80005a94 <consoleread+0xf0>
    80005a10:	07f7f713          	andi	a4,a5,127
    80005a14:	00e48733          	add	a4,s1,a4
    80005a18:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80005a1c:	0017869b          	addiw	a3,a5,1
    80005a20:	08d4ac23          	sw	a3,152(s1)
    80005a24:	00070c9b          	sext.w	s9,a4
    80005a28:	0b370663          	beq	a4,s3,80005ad4 <consoleread+0x130>
    80005a2c:	00100693          	li	a3,1
    80005a30:	f9f40613          	addi	a2,s0,-97
    80005a34:	000c0593          	mv	a1,s8
    80005a38:	00090513          	mv	a0,s2
    80005a3c:	f8e40fa3          	sb	a4,-97(s0)
    80005a40:	00000097          	auipc	ra,0x0
    80005a44:	8bc080e7          	jalr	-1860(ra) # 800052fc <either_copyout>
    80005a48:	01450863          	beq	a0,s4,80005a58 <consoleread+0xb4>
    80005a4c:	001c0c13          	addi	s8,s8,1
    80005a50:	fffb8b9b          	addiw	s7,s7,-1
    80005a54:	fb5c94e3          	bne	s9,s5,800059fc <consoleread+0x58>
    80005a58:	000b851b          	sext.w	a0,s7
    80005a5c:	06813083          	ld	ra,104(sp)
    80005a60:	06013403          	ld	s0,96(sp)
    80005a64:	05813483          	ld	s1,88(sp)
    80005a68:	05013903          	ld	s2,80(sp)
    80005a6c:	04813983          	ld	s3,72(sp)
    80005a70:	04013a03          	ld	s4,64(sp)
    80005a74:	03813a83          	ld	s5,56(sp)
    80005a78:	02813b83          	ld	s7,40(sp)
    80005a7c:	02013c03          	ld	s8,32(sp)
    80005a80:	01813c83          	ld	s9,24(sp)
    80005a84:	40ab053b          	subw	a0,s6,a0
    80005a88:	03013b03          	ld	s6,48(sp)
    80005a8c:	07010113          	addi	sp,sp,112
    80005a90:	00008067          	ret
    80005a94:	00001097          	auipc	ra,0x1
    80005a98:	1d8080e7          	jalr	472(ra) # 80006c6c <push_on>
    80005a9c:	0984a703          	lw	a4,152(s1)
    80005aa0:	09c4a783          	lw	a5,156(s1)
    80005aa4:	0007879b          	sext.w	a5,a5
    80005aa8:	fef70ce3          	beq	a4,a5,80005aa0 <consoleread+0xfc>
    80005aac:	00001097          	auipc	ra,0x1
    80005ab0:	234080e7          	jalr	564(ra) # 80006ce0 <pop_on>
    80005ab4:	0984a783          	lw	a5,152(s1)
    80005ab8:	07f7f713          	andi	a4,a5,127
    80005abc:	00e48733          	add	a4,s1,a4
    80005ac0:	01874703          	lbu	a4,24(a4)
    80005ac4:	0017869b          	addiw	a3,a5,1
    80005ac8:	08d4ac23          	sw	a3,152(s1)
    80005acc:	00070c9b          	sext.w	s9,a4
    80005ad0:	f5371ee3          	bne	a4,s3,80005a2c <consoleread+0x88>
    80005ad4:	000b851b          	sext.w	a0,s7
    80005ad8:	f96bf2e3          	bgeu	s7,s6,80005a5c <consoleread+0xb8>
    80005adc:	08f4ac23          	sw	a5,152(s1)
    80005ae0:	f7dff06f          	j	80005a5c <consoleread+0xb8>

0000000080005ae4 <consputc>:
    80005ae4:	10000793          	li	a5,256
    80005ae8:	00f50663          	beq	a0,a5,80005af4 <consputc+0x10>
    80005aec:	00001317          	auipc	t1,0x1
    80005af0:	9f430067          	jr	-1548(t1) # 800064e0 <uartputc_sync>
    80005af4:	ff010113          	addi	sp,sp,-16
    80005af8:	00113423          	sd	ra,8(sp)
    80005afc:	00813023          	sd	s0,0(sp)
    80005b00:	01010413          	addi	s0,sp,16
    80005b04:	00800513          	li	a0,8
    80005b08:	00001097          	auipc	ra,0x1
    80005b0c:	9d8080e7          	jalr	-1576(ra) # 800064e0 <uartputc_sync>
    80005b10:	02000513          	li	a0,32
    80005b14:	00001097          	auipc	ra,0x1
    80005b18:	9cc080e7          	jalr	-1588(ra) # 800064e0 <uartputc_sync>
    80005b1c:	00013403          	ld	s0,0(sp)
    80005b20:	00813083          	ld	ra,8(sp)
    80005b24:	00800513          	li	a0,8
    80005b28:	01010113          	addi	sp,sp,16
    80005b2c:	00001317          	auipc	t1,0x1
    80005b30:	9b430067          	jr	-1612(t1) # 800064e0 <uartputc_sync>

0000000080005b34 <consoleintr>:
    80005b34:	fe010113          	addi	sp,sp,-32
    80005b38:	00813823          	sd	s0,16(sp)
    80005b3c:	00913423          	sd	s1,8(sp)
    80005b40:	01213023          	sd	s2,0(sp)
    80005b44:	00113c23          	sd	ra,24(sp)
    80005b48:	02010413          	addi	s0,sp,32
    80005b4c:	00005917          	auipc	s2,0x5
    80005b50:	31c90913          	addi	s2,s2,796 # 8000ae68 <cons>
    80005b54:	00050493          	mv	s1,a0
    80005b58:	00090513          	mv	a0,s2
    80005b5c:	00001097          	auipc	ra,0x1
    80005b60:	e40080e7          	jalr	-448(ra) # 8000699c <acquire>
    80005b64:	02048c63          	beqz	s1,80005b9c <consoleintr+0x68>
    80005b68:	0a092783          	lw	a5,160(s2)
    80005b6c:	09892703          	lw	a4,152(s2)
    80005b70:	07f00693          	li	a3,127
    80005b74:	40e7873b          	subw	a4,a5,a4
    80005b78:	02e6e263          	bltu	a3,a4,80005b9c <consoleintr+0x68>
    80005b7c:	00d00713          	li	a4,13
    80005b80:	04e48063          	beq	s1,a4,80005bc0 <consoleintr+0x8c>
    80005b84:	07f7f713          	andi	a4,a5,127
    80005b88:	00e90733          	add	a4,s2,a4
    80005b8c:	0017879b          	addiw	a5,a5,1
    80005b90:	0af92023          	sw	a5,160(s2)
    80005b94:	00970c23          	sb	s1,24(a4)
    80005b98:	08f92e23          	sw	a5,156(s2)
    80005b9c:	01013403          	ld	s0,16(sp)
    80005ba0:	01813083          	ld	ra,24(sp)
    80005ba4:	00813483          	ld	s1,8(sp)
    80005ba8:	00013903          	ld	s2,0(sp)
    80005bac:	00005517          	auipc	a0,0x5
    80005bb0:	2bc50513          	addi	a0,a0,700 # 8000ae68 <cons>
    80005bb4:	02010113          	addi	sp,sp,32
    80005bb8:	00001317          	auipc	t1,0x1
    80005bbc:	eb030067          	jr	-336(t1) # 80006a68 <release>
    80005bc0:	00a00493          	li	s1,10
    80005bc4:	fc1ff06f          	j	80005b84 <consoleintr+0x50>

0000000080005bc8 <consoleinit>:
    80005bc8:	fe010113          	addi	sp,sp,-32
    80005bcc:	00113c23          	sd	ra,24(sp)
    80005bd0:	00813823          	sd	s0,16(sp)
    80005bd4:	00913423          	sd	s1,8(sp)
    80005bd8:	02010413          	addi	s0,sp,32
    80005bdc:	00005497          	auipc	s1,0x5
    80005be0:	28c48493          	addi	s1,s1,652 # 8000ae68 <cons>
    80005be4:	00048513          	mv	a0,s1
    80005be8:	00003597          	auipc	a1,0x3
    80005bec:	a2058593          	addi	a1,a1,-1504 # 80008608 <_ZL6digits+0x140>
    80005bf0:	00001097          	auipc	ra,0x1
    80005bf4:	d88080e7          	jalr	-632(ra) # 80006978 <initlock>
    80005bf8:	00000097          	auipc	ra,0x0
    80005bfc:	7ac080e7          	jalr	1964(ra) # 800063a4 <uartinit>
    80005c00:	01813083          	ld	ra,24(sp)
    80005c04:	01013403          	ld	s0,16(sp)
    80005c08:	00000797          	auipc	a5,0x0
    80005c0c:	d9c78793          	addi	a5,a5,-612 # 800059a4 <consoleread>
    80005c10:	0af4bc23          	sd	a5,184(s1)
    80005c14:	00000797          	auipc	a5,0x0
    80005c18:	cec78793          	addi	a5,a5,-788 # 80005900 <consolewrite>
    80005c1c:	0cf4b023          	sd	a5,192(s1)
    80005c20:	00813483          	ld	s1,8(sp)
    80005c24:	02010113          	addi	sp,sp,32
    80005c28:	00008067          	ret

0000000080005c2c <console_read>:
    80005c2c:	ff010113          	addi	sp,sp,-16
    80005c30:	00813423          	sd	s0,8(sp)
    80005c34:	01010413          	addi	s0,sp,16
    80005c38:	00813403          	ld	s0,8(sp)
    80005c3c:	00005317          	auipc	t1,0x5
    80005c40:	2e433303          	ld	t1,740(t1) # 8000af20 <devsw+0x10>
    80005c44:	01010113          	addi	sp,sp,16
    80005c48:	00030067          	jr	t1

0000000080005c4c <console_write>:
    80005c4c:	ff010113          	addi	sp,sp,-16
    80005c50:	00813423          	sd	s0,8(sp)
    80005c54:	01010413          	addi	s0,sp,16
    80005c58:	00813403          	ld	s0,8(sp)
    80005c5c:	00005317          	auipc	t1,0x5
    80005c60:	2cc33303          	ld	t1,716(t1) # 8000af28 <devsw+0x18>
    80005c64:	01010113          	addi	sp,sp,16
    80005c68:	00030067          	jr	t1

0000000080005c6c <panic>:
    80005c6c:	fe010113          	addi	sp,sp,-32
    80005c70:	00113c23          	sd	ra,24(sp)
    80005c74:	00813823          	sd	s0,16(sp)
    80005c78:	00913423          	sd	s1,8(sp)
    80005c7c:	02010413          	addi	s0,sp,32
    80005c80:	00050493          	mv	s1,a0
    80005c84:	00003517          	auipc	a0,0x3
    80005c88:	98c50513          	addi	a0,a0,-1652 # 80008610 <_ZL6digits+0x148>
    80005c8c:	00005797          	auipc	a5,0x5
    80005c90:	3207ae23          	sw	zero,828(a5) # 8000afc8 <pr+0x18>
    80005c94:	00000097          	auipc	ra,0x0
    80005c98:	034080e7          	jalr	52(ra) # 80005cc8 <__printf>
    80005c9c:	00048513          	mv	a0,s1
    80005ca0:	00000097          	auipc	ra,0x0
    80005ca4:	028080e7          	jalr	40(ra) # 80005cc8 <__printf>
    80005ca8:	00002517          	auipc	a0,0x2
    80005cac:	4e050513          	addi	a0,a0,1248 # 80008188 <CONSOLE_STATUS+0x178>
    80005cb0:	00000097          	auipc	ra,0x0
    80005cb4:	018080e7          	jalr	24(ra) # 80005cc8 <__printf>
    80005cb8:	00100793          	li	a5,1
    80005cbc:	00004717          	auipc	a4,0x4
    80005cc0:	04f72623          	sw	a5,76(a4) # 80009d08 <panicked>
    80005cc4:	0000006f          	j	80005cc4 <panic+0x58>

0000000080005cc8 <__printf>:
    80005cc8:	f3010113          	addi	sp,sp,-208
    80005ccc:	08813023          	sd	s0,128(sp)
    80005cd0:	07313423          	sd	s3,104(sp)
    80005cd4:	09010413          	addi	s0,sp,144
    80005cd8:	05813023          	sd	s8,64(sp)
    80005cdc:	08113423          	sd	ra,136(sp)
    80005ce0:	06913c23          	sd	s1,120(sp)
    80005ce4:	07213823          	sd	s2,112(sp)
    80005ce8:	07413023          	sd	s4,96(sp)
    80005cec:	05513c23          	sd	s5,88(sp)
    80005cf0:	05613823          	sd	s6,80(sp)
    80005cf4:	05713423          	sd	s7,72(sp)
    80005cf8:	03913c23          	sd	s9,56(sp)
    80005cfc:	03a13823          	sd	s10,48(sp)
    80005d00:	03b13423          	sd	s11,40(sp)
    80005d04:	00005317          	auipc	t1,0x5
    80005d08:	2ac30313          	addi	t1,t1,684 # 8000afb0 <pr>
    80005d0c:	01832c03          	lw	s8,24(t1)
    80005d10:	00b43423          	sd	a1,8(s0)
    80005d14:	00c43823          	sd	a2,16(s0)
    80005d18:	00d43c23          	sd	a3,24(s0)
    80005d1c:	02e43023          	sd	a4,32(s0)
    80005d20:	02f43423          	sd	a5,40(s0)
    80005d24:	03043823          	sd	a6,48(s0)
    80005d28:	03143c23          	sd	a7,56(s0)
    80005d2c:	00050993          	mv	s3,a0
    80005d30:	4a0c1663          	bnez	s8,800061dc <__printf+0x514>
    80005d34:	60098c63          	beqz	s3,8000634c <__printf+0x684>
    80005d38:	0009c503          	lbu	a0,0(s3)
    80005d3c:	00840793          	addi	a5,s0,8
    80005d40:	f6f43c23          	sd	a5,-136(s0)
    80005d44:	00000493          	li	s1,0
    80005d48:	22050063          	beqz	a0,80005f68 <__printf+0x2a0>
    80005d4c:	00002a37          	lui	s4,0x2
    80005d50:	00018ab7          	lui	s5,0x18
    80005d54:	000f4b37          	lui	s6,0xf4
    80005d58:	00989bb7          	lui	s7,0x989
    80005d5c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80005d60:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80005d64:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80005d68:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80005d6c:	00148c9b          	addiw	s9,s1,1
    80005d70:	02500793          	li	a5,37
    80005d74:	01998933          	add	s2,s3,s9
    80005d78:	38f51263          	bne	a0,a5,800060fc <__printf+0x434>
    80005d7c:	00094783          	lbu	a5,0(s2)
    80005d80:	00078c9b          	sext.w	s9,a5
    80005d84:	1e078263          	beqz	a5,80005f68 <__printf+0x2a0>
    80005d88:	0024849b          	addiw	s1,s1,2
    80005d8c:	07000713          	li	a4,112
    80005d90:	00998933          	add	s2,s3,s1
    80005d94:	38e78a63          	beq	a5,a4,80006128 <__printf+0x460>
    80005d98:	20f76863          	bltu	a4,a5,80005fa8 <__printf+0x2e0>
    80005d9c:	42a78863          	beq	a5,a0,800061cc <__printf+0x504>
    80005da0:	06400713          	li	a4,100
    80005da4:	40e79663          	bne	a5,a4,800061b0 <__printf+0x4e8>
    80005da8:	f7843783          	ld	a5,-136(s0)
    80005dac:	0007a603          	lw	a2,0(a5)
    80005db0:	00878793          	addi	a5,a5,8
    80005db4:	f6f43c23          	sd	a5,-136(s0)
    80005db8:	42064a63          	bltz	a2,800061ec <__printf+0x524>
    80005dbc:	00a00713          	li	a4,10
    80005dc0:	02e677bb          	remuw	a5,a2,a4
    80005dc4:	00003d97          	auipc	s11,0x3
    80005dc8:	874d8d93          	addi	s11,s11,-1932 # 80008638 <digits>
    80005dcc:	00900593          	li	a1,9
    80005dd0:	0006051b          	sext.w	a0,a2
    80005dd4:	00000c93          	li	s9,0
    80005dd8:	02079793          	slli	a5,a5,0x20
    80005ddc:	0207d793          	srli	a5,a5,0x20
    80005de0:	00fd87b3          	add	a5,s11,a5
    80005de4:	0007c783          	lbu	a5,0(a5)
    80005de8:	02e656bb          	divuw	a3,a2,a4
    80005dec:	f8f40023          	sb	a5,-128(s0)
    80005df0:	14c5d863          	bge	a1,a2,80005f40 <__printf+0x278>
    80005df4:	06300593          	li	a1,99
    80005df8:	00100c93          	li	s9,1
    80005dfc:	02e6f7bb          	remuw	a5,a3,a4
    80005e00:	02079793          	slli	a5,a5,0x20
    80005e04:	0207d793          	srli	a5,a5,0x20
    80005e08:	00fd87b3          	add	a5,s11,a5
    80005e0c:	0007c783          	lbu	a5,0(a5)
    80005e10:	02e6d73b          	divuw	a4,a3,a4
    80005e14:	f8f400a3          	sb	a5,-127(s0)
    80005e18:	12a5f463          	bgeu	a1,a0,80005f40 <__printf+0x278>
    80005e1c:	00a00693          	li	a3,10
    80005e20:	00900593          	li	a1,9
    80005e24:	02d777bb          	remuw	a5,a4,a3
    80005e28:	02079793          	slli	a5,a5,0x20
    80005e2c:	0207d793          	srli	a5,a5,0x20
    80005e30:	00fd87b3          	add	a5,s11,a5
    80005e34:	0007c503          	lbu	a0,0(a5)
    80005e38:	02d757bb          	divuw	a5,a4,a3
    80005e3c:	f8a40123          	sb	a0,-126(s0)
    80005e40:	48e5f263          	bgeu	a1,a4,800062c4 <__printf+0x5fc>
    80005e44:	06300513          	li	a0,99
    80005e48:	02d7f5bb          	remuw	a1,a5,a3
    80005e4c:	02059593          	slli	a1,a1,0x20
    80005e50:	0205d593          	srli	a1,a1,0x20
    80005e54:	00bd85b3          	add	a1,s11,a1
    80005e58:	0005c583          	lbu	a1,0(a1)
    80005e5c:	02d7d7bb          	divuw	a5,a5,a3
    80005e60:	f8b401a3          	sb	a1,-125(s0)
    80005e64:	48e57263          	bgeu	a0,a4,800062e8 <__printf+0x620>
    80005e68:	3e700513          	li	a0,999
    80005e6c:	02d7f5bb          	remuw	a1,a5,a3
    80005e70:	02059593          	slli	a1,a1,0x20
    80005e74:	0205d593          	srli	a1,a1,0x20
    80005e78:	00bd85b3          	add	a1,s11,a1
    80005e7c:	0005c583          	lbu	a1,0(a1)
    80005e80:	02d7d7bb          	divuw	a5,a5,a3
    80005e84:	f8b40223          	sb	a1,-124(s0)
    80005e88:	46e57663          	bgeu	a0,a4,800062f4 <__printf+0x62c>
    80005e8c:	02d7f5bb          	remuw	a1,a5,a3
    80005e90:	02059593          	slli	a1,a1,0x20
    80005e94:	0205d593          	srli	a1,a1,0x20
    80005e98:	00bd85b3          	add	a1,s11,a1
    80005e9c:	0005c583          	lbu	a1,0(a1)
    80005ea0:	02d7d7bb          	divuw	a5,a5,a3
    80005ea4:	f8b402a3          	sb	a1,-123(s0)
    80005ea8:	46ea7863          	bgeu	s4,a4,80006318 <__printf+0x650>
    80005eac:	02d7f5bb          	remuw	a1,a5,a3
    80005eb0:	02059593          	slli	a1,a1,0x20
    80005eb4:	0205d593          	srli	a1,a1,0x20
    80005eb8:	00bd85b3          	add	a1,s11,a1
    80005ebc:	0005c583          	lbu	a1,0(a1)
    80005ec0:	02d7d7bb          	divuw	a5,a5,a3
    80005ec4:	f8b40323          	sb	a1,-122(s0)
    80005ec8:	3eeaf863          	bgeu	s5,a4,800062b8 <__printf+0x5f0>
    80005ecc:	02d7f5bb          	remuw	a1,a5,a3
    80005ed0:	02059593          	slli	a1,a1,0x20
    80005ed4:	0205d593          	srli	a1,a1,0x20
    80005ed8:	00bd85b3          	add	a1,s11,a1
    80005edc:	0005c583          	lbu	a1,0(a1)
    80005ee0:	02d7d7bb          	divuw	a5,a5,a3
    80005ee4:	f8b403a3          	sb	a1,-121(s0)
    80005ee8:	42eb7e63          	bgeu	s6,a4,80006324 <__printf+0x65c>
    80005eec:	02d7f5bb          	remuw	a1,a5,a3
    80005ef0:	02059593          	slli	a1,a1,0x20
    80005ef4:	0205d593          	srli	a1,a1,0x20
    80005ef8:	00bd85b3          	add	a1,s11,a1
    80005efc:	0005c583          	lbu	a1,0(a1)
    80005f00:	02d7d7bb          	divuw	a5,a5,a3
    80005f04:	f8b40423          	sb	a1,-120(s0)
    80005f08:	42ebfc63          	bgeu	s7,a4,80006340 <__printf+0x678>
    80005f0c:	02079793          	slli	a5,a5,0x20
    80005f10:	0207d793          	srli	a5,a5,0x20
    80005f14:	00fd8db3          	add	s11,s11,a5
    80005f18:	000dc703          	lbu	a4,0(s11)
    80005f1c:	00a00793          	li	a5,10
    80005f20:	00900c93          	li	s9,9
    80005f24:	f8e404a3          	sb	a4,-119(s0)
    80005f28:	00065c63          	bgez	a2,80005f40 <__printf+0x278>
    80005f2c:	f9040713          	addi	a4,s0,-112
    80005f30:	00f70733          	add	a4,a4,a5
    80005f34:	02d00693          	li	a3,45
    80005f38:	fed70823          	sb	a3,-16(a4)
    80005f3c:	00078c93          	mv	s9,a5
    80005f40:	f8040793          	addi	a5,s0,-128
    80005f44:	01978cb3          	add	s9,a5,s9
    80005f48:	f7f40d13          	addi	s10,s0,-129
    80005f4c:	000cc503          	lbu	a0,0(s9)
    80005f50:	fffc8c93          	addi	s9,s9,-1
    80005f54:	00000097          	auipc	ra,0x0
    80005f58:	b90080e7          	jalr	-1136(ra) # 80005ae4 <consputc>
    80005f5c:	ffac98e3          	bne	s9,s10,80005f4c <__printf+0x284>
    80005f60:	00094503          	lbu	a0,0(s2)
    80005f64:	e00514e3          	bnez	a0,80005d6c <__printf+0xa4>
    80005f68:	1a0c1663          	bnez	s8,80006114 <__printf+0x44c>
    80005f6c:	08813083          	ld	ra,136(sp)
    80005f70:	08013403          	ld	s0,128(sp)
    80005f74:	07813483          	ld	s1,120(sp)
    80005f78:	07013903          	ld	s2,112(sp)
    80005f7c:	06813983          	ld	s3,104(sp)
    80005f80:	06013a03          	ld	s4,96(sp)
    80005f84:	05813a83          	ld	s5,88(sp)
    80005f88:	05013b03          	ld	s6,80(sp)
    80005f8c:	04813b83          	ld	s7,72(sp)
    80005f90:	04013c03          	ld	s8,64(sp)
    80005f94:	03813c83          	ld	s9,56(sp)
    80005f98:	03013d03          	ld	s10,48(sp)
    80005f9c:	02813d83          	ld	s11,40(sp)
    80005fa0:	0d010113          	addi	sp,sp,208
    80005fa4:	00008067          	ret
    80005fa8:	07300713          	li	a4,115
    80005fac:	1ce78a63          	beq	a5,a4,80006180 <__printf+0x4b8>
    80005fb0:	07800713          	li	a4,120
    80005fb4:	1ee79e63          	bne	a5,a4,800061b0 <__printf+0x4e8>
    80005fb8:	f7843783          	ld	a5,-136(s0)
    80005fbc:	0007a703          	lw	a4,0(a5)
    80005fc0:	00878793          	addi	a5,a5,8
    80005fc4:	f6f43c23          	sd	a5,-136(s0)
    80005fc8:	28074263          	bltz	a4,8000624c <__printf+0x584>
    80005fcc:	00002d97          	auipc	s11,0x2
    80005fd0:	66cd8d93          	addi	s11,s11,1644 # 80008638 <digits>
    80005fd4:	00f77793          	andi	a5,a4,15
    80005fd8:	00fd87b3          	add	a5,s11,a5
    80005fdc:	0007c683          	lbu	a3,0(a5)
    80005fe0:	00f00613          	li	a2,15
    80005fe4:	0007079b          	sext.w	a5,a4
    80005fe8:	f8d40023          	sb	a3,-128(s0)
    80005fec:	0047559b          	srliw	a1,a4,0x4
    80005ff0:	0047569b          	srliw	a3,a4,0x4
    80005ff4:	00000c93          	li	s9,0
    80005ff8:	0ee65063          	bge	a2,a4,800060d8 <__printf+0x410>
    80005ffc:	00f6f693          	andi	a3,a3,15
    80006000:	00dd86b3          	add	a3,s11,a3
    80006004:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80006008:	0087d79b          	srliw	a5,a5,0x8
    8000600c:	00100c93          	li	s9,1
    80006010:	f8d400a3          	sb	a3,-127(s0)
    80006014:	0cb67263          	bgeu	a2,a1,800060d8 <__printf+0x410>
    80006018:	00f7f693          	andi	a3,a5,15
    8000601c:	00dd86b3          	add	a3,s11,a3
    80006020:	0006c583          	lbu	a1,0(a3)
    80006024:	00f00613          	li	a2,15
    80006028:	0047d69b          	srliw	a3,a5,0x4
    8000602c:	f8b40123          	sb	a1,-126(s0)
    80006030:	0047d593          	srli	a1,a5,0x4
    80006034:	28f67e63          	bgeu	a2,a5,800062d0 <__printf+0x608>
    80006038:	00f6f693          	andi	a3,a3,15
    8000603c:	00dd86b3          	add	a3,s11,a3
    80006040:	0006c503          	lbu	a0,0(a3)
    80006044:	0087d813          	srli	a6,a5,0x8
    80006048:	0087d69b          	srliw	a3,a5,0x8
    8000604c:	f8a401a3          	sb	a0,-125(s0)
    80006050:	28b67663          	bgeu	a2,a1,800062dc <__printf+0x614>
    80006054:	00f6f693          	andi	a3,a3,15
    80006058:	00dd86b3          	add	a3,s11,a3
    8000605c:	0006c583          	lbu	a1,0(a3)
    80006060:	00c7d513          	srli	a0,a5,0xc
    80006064:	00c7d69b          	srliw	a3,a5,0xc
    80006068:	f8b40223          	sb	a1,-124(s0)
    8000606c:	29067a63          	bgeu	a2,a6,80006300 <__printf+0x638>
    80006070:	00f6f693          	andi	a3,a3,15
    80006074:	00dd86b3          	add	a3,s11,a3
    80006078:	0006c583          	lbu	a1,0(a3)
    8000607c:	0107d813          	srli	a6,a5,0x10
    80006080:	0107d69b          	srliw	a3,a5,0x10
    80006084:	f8b402a3          	sb	a1,-123(s0)
    80006088:	28a67263          	bgeu	a2,a0,8000630c <__printf+0x644>
    8000608c:	00f6f693          	andi	a3,a3,15
    80006090:	00dd86b3          	add	a3,s11,a3
    80006094:	0006c683          	lbu	a3,0(a3)
    80006098:	0147d79b          	srliw	a5,a5,0x14
    8000609c:	f8d40323          	sb	a3,-122(s0)
    800060a0:	21067663          	bgeu	a2,a6,800062ac <__printf+0x5e4>
    800060a4:	02079793          	slli	a5,a5,0x20
    800060a8:	0207d793          	srli	a5,a5,0x20
    800060ac:	00fd8db3          	add	s11,s11,a5
    800060b0:	000dc683          	lbu	a3,0(s11)
    800060b4:	00800793          	li	a5,8
    800060b8:	00700c93          	li	s9,7
    800060bc:	f8d403a3          	sb	a3,-121(s0)
    800060c0:	00075c63          	bgez	a4,800060d8 <__printf+0x410>
    800060c4:	f9040713          	addi	a4,s0,-112
    800060c8:	00f70733          	add	a4,a4,a5
    800060cc:	02d00693          	li	a3,45
    800060d0:	fed70823          	sb	a3,-16(a4)
    800060d4:	00078c93          	mv	s9,a5
    800060d8:	f8040793          	addi	a5,s0,-128
    800060dc:	01978cb3          	add	s9,a5,s9
    800060e0:	f7f40d13          	addi	s10,s0,-129
    800060e4:	000cc503          	lbu	a0,0(s9)
    800060e8:	fffc8c93          	addi	s9,s9,-1
    800060ec:	00000097          	auipc	ra,0x0
    800060f0:	9f8080e7          	jalr	-1544(ra) # 80005ae4 <consputc>
    800060f4:	ff9d18e3          	bne	s10,s9,800060e4 <__printf+0x41c>
    800060f8:	0100006f          	j	80006108 <__printf+0x440>
    800060fc:	00000097          	auipc	ra,0x0
    80006100:	9e8080e7          	jalr	-1560(ra) # 80005ae4 <consputc>
    80006104:	000c8493          	mv	s1,s9
    80006108:	00094503          	lbu	a0,0(s2)
    8000610c:	c60510e3          	bnez	a0,80005d6c <__printf+0xa4>
    80006110:	e40c0ee3          	beqz	s8,80005f6c <__printf+0x2a4>
    80006114:	00005517          	auipc	a0,0x5
    80006118:	e9c50513          	addi	a0,a0,-356 # 8000afb0 <pr>
    8000611c:	00001097          	auipc	ra,0x1
    80006120:	94c080e7          	jalr	-1716(ra) # 80006a68 <release>
    80006124:	e49ff06f          	j	80005f6c <__printf+0x2a4>
    80006128:	f7843783          	ld	a5,-136(s0)
    8000612c:	03000513          	li	a0,48
    80006130:	01000d13          	li	s10,16
    80006134:	00878713          	addi	a4,a5,8
    80006138:	0007bc83          	ld	s9,0(a5)
    8000613c:	f6e43c23          	sd	a4,-136(s0)
    80006140:	00000097          	auipc	ra,0x0
    80006144:	9a4080e7          	jalr	-1628(ra) # 80005ae4 <consputc>
    80006148:	07800513          	li	a0,120
    8000614c:	00000097          	auipc	ra,0x0
    80006150:	998080e7          	jalr	-1640(ra) # 80005ae4 <consputc>
    80006154:	00002d97          	auipc	s11,0x2
    80006158:	4e4d8d93          	addi	s11,s11,1252 # 80008638 <digits>
    8000615c:	03ccd793          	srli	a5,s9,0x3c
    80006160:	00fd87b3          	add	a5,s11,a5
    80006164:	0007c503          	lbu	a0,0(a5)
    80006168:	fffd0d1b          	addiw	s10,s10,-1
    8000616c:	004c9c93          	slli	s9,s9,0x4
    80006170:	00000097          	auipc	ra,0x0
    80006174:	974080e7          	jalr	-1676(ra) # 80005ae4 <consputc>
    80006178:	fe0d12e3          	bnez	s10,8000615c <__printf+0x494>
    8000617c:	f8dff06f          	j	80006108 <__printf+0x440>
    80006180:	f7843783          	ld	a5,-136(s0)
    80006184:	0007bc83          	ld	s9,0(a5)
    80006188:	00878793          	addi	a5,a5,8
    8000618c:	f6f43c23          	sd	a5,-136(s0)
    80006190:	000c9a63          	bnez	s9,800061a4 <__printf+0x4dc>
    80006194:	1080006f          	j	8000629c <__printf+0x5d4>
    80006198:	001c8c93          	addi	s9,s9,1
    8000619c:	00000097          	auipc	ra,0x0
    800061a0:	948080e7          	jalr	-1720(ra) # 80005ae4 <consputc>
    800061a4:	000cc503          	lbu	a0,0(s9)
    800061a8:	fe0518e3          	bnez	a0,80006198 <__printf+0x4d0>
    800061ac:	f5dff06f          	j	80006108 <__printf+0x440>
    800061b0:	02500513          	li	a0,37
    800061b4:	00000097          	auipc	ra,0x0
    800061b8:	930080e7          	jalr	-1744(ra) # 80005ae4 <consputc>
    800061bc:	000c8513          	mv	a0,s9
    800061c0:	00000097          	auipc	ra,0x0
    800061c4:	924080e7          	jalr	-1756(ra) # 80005ae4 <consputc>
    800061c8:	f41ff06f          	j	80006108 <__printf+0x440>
    800061cc:	02500513          	li	a0,37
    800061d0:	00000097          	auipc	ra,0x0
    800061d4:	914080e7          	jalr	-1772(ra) # 80005ae4 <consputc>
    800061d8:	f31ff06f          	j	80006108 <__printf+0x440>
    800061dc:	00030513          	mv	a0,t1
    800061e0:	00000097          	auipc	ra,0x0
    800061e4:	7bc080e7          	jalr	1980(ra) # 8000699c <acquire>
    800061e8:	b4dff06f          	j	80005d34 <__printf+0x6c>
    800061ec:	40c0053b          	negw	a0,a2
    800061f0:	00a00713          	li	a4,10
    800061f4:	02e576bb          	remuw	a3,a0,a4
    800061f8:	00002d97          	auipc	s11,0x2
    800061fc:	440d8d93          	addi	s11,s11,1088 # 80008638 <digits>
    80006200:	ff700593          	li	a1,-9
    80006204:	02069693          	slli	a3,a3,0x20
    80006208:	0206d693          	srli	a3,a3,0x20
    8000620c:	00dd86b3          	add	a3,s11,a3
    80006210:	0006c683          	lbu	a3,0(a3)
    80006214:	02e557bb          	divuw	a5,a0,a4
    80006218:	f8d40023          	sb	a3,-128(s0)
    8000621c:	10b65e63          	bge	a2,a1,80006338 <__printf+0x670>
    80006220:	06300593          	li	a1,99
    80006224:	02e7f6bb          	remuw	a3,a5,a4
    80006228:	02069693          	slli	a3,a3,0x20
    8000622c:	0206d693          	srli	a3,a3,0x20
    80006230:	00dd86b3          	add	a3,s11,a3
    80006234:	0006c683          	lbu	a3,0(a3)
    80006238:	02e7d73b          	divuw	a4,a5,a4
    8000623c:	00200793          	li	a5,2
    80006240:	f8d400a3          	sb	a3,-127(s0)
    80006244:	bca5ece3          	bltu	a1,a0,80005e1c <__printf+0x154>
    80006248:	ce5ff06f          	j	80005f2c <__printf+0x264>
    8000624c:	40e007bb          	negw	a5,a4
    80006250:	00002d97          	auipc	s11,0x2
    80006254:	3e8d8d93          	addi	s11,s11,1000 # 80008638 <digits>
    80006258:	00f7f693          	andi	a3,a5,15
    8000625c:	00dd86b3          	add	a3,s11,a3
    80006260:	0006c583          	lbu	a1,0(a3)
    80006264:	ff100613          	li	a2,-15
    80006268:	0047d69b          	srliw	a3,a5,0x4
    8000626c:	f8b40023          	sb	a1,-128(s0)
    80006270:	0047d59b          	srliw	a1,a5,0x4
    80006274:	0ac75e63          	bge	a4,a2,80006330 <__printf+0x668>
    80006278:	00f6f693          	andi	a3,a3,15
    8000627c:	00dd86b3          	add	a3,s11,a3
    80006280:	0006c603          	lbu	a2,0(a3)
    80006284:	00f00693          	li	a3,15
    80006288:	0087d79b          	srliw	a5,a5,0x8
    8000628c:	f8c400a3          	sb	a2,-127(s0)
    80006290:	d8b6e4e3          	bltu	a3,a1,80006018 <__printf+0x350>
    80006294:	00200793          	li	a5,2
    80006298:	e2dff06f          	j	800060c4 <__printf+0x3fc>
    8000629c:	00002c97          	auipc	s9,0x2
    800062a0:	37cc8c93          	addi	s9,s9,892 # 80008618 <_ZL6digits+0x150>
    800062a4:	02800513          	li	a0,40
    800062a8:	ef1ff06f          	j	80006198 <__printf+0x4d0>
    800062ac:	00700793          	li	a5,7
    800062b0:	00600c93          	li	s9,6
    800062b4:	e0dff06f          	j	800060c0 <__printf+0x3f8>
    800062b8:	00700793          	li	a5,7
    800062bc:	00600c93          	li	s9,6
    800062c0:	c69ff06f          	j	80005f28 <__printf+0x260>
    800062c4:	00300793          	li	a5,3
    800062c8:	00200c93          	li	s9,2
    800062cc:	c5dff06f          	j	80005f28 <__printf+0x260>
    800062d0:	00300793          	li	a5,3
    800062d4:	00200c93          	li	s9,2
    800062d8:	de9ff06f          	j	800060c0 <__printf+0x3f8>
    800062dc:	00400793          	li	a5,4
    800062e0:	00300c93          	li	s9,3
    800062e4:	dddff06f          	j	800060c0 <__printf+0x3f8>
    800062e8:	00400793          	li	a5,4
    800062ec:	00300c93          	li	s9,3
    800062f0:	c39ff06f          	j	80005f28 <__printf+0x260>
    800062f4:	00500793          	li	a5,5
    800062f8:	00400c93          	li	s9,4
    800062fc:	c2dff06f          	j	80005f28 <__printf+0x260>
    80006300:	00500793          	li	a5,5
    80006304:	00400c93          	li	s9,4
    80006308:	db9ff06f          	j	800060c0 <__printf+0x3f8>
    8000630c:	00600793          	li	a5,6
    80006310:	00500c93          	li	s9,5
    80006314:	dadff06f          	j	800060c0 <__printf+0x3f8>
    80006318:	00600793          	li	a5,6
    8000631c:	00500c93          	li	s9,5
    80006320:	c09ff06f          	j	80005f28 <__printf+0x260>
    80006324:	00800793          	li	a5,8
    80006328:	00700c93          	li	s9,7
    8000632c:	bfdff06f          	j	80005f28 <__printf+0x260>
    80006330:	00100793          	li	a5,1
    80006334:	d91ff06f          	j	800060c4 <__printf+0x3fc>
    80006338:	00100793          	li	a5,1
    8000633c:	bf1ff06f          	j	80005f2c <__printf+0x264>
    80006340:	00900793          	li	a5,9
    80006344:	00800c93          	li	s9,8
    80006348:	be1ff06f          	j	80005f28 <__printf+0x260>
    8000634c:	00002517          	auipc	a0,0x2
    80006350:	2d450513          	addi	a0,a0,724 # 80008620 <_ZL6digits+0x158>
    80006354:	00000097          	auipc	ra,0x0
    80006358:	918080e7          	jalr	-1768(ra) # 80005c6c <panic>

000000008000635c <printfinit>:
    8000635c:	fe010113          	addi	sp,sp,-32
    80006360:	00813823          	sd	s0,16(sp)
    80006364:	00913423          	sd	s1,8(sp)
    80006368:	00113c23          	sd	ra,24(sp)
    8000636c:	02010413          	addi	s0,sp,32
    80006370:	00005497          	auipc	s1,0x5
    80006374:	c4048493          	addi	s1,s1,-960 # 8000afb0 <pr>
    80006378:	00048513          	mv	a0,s1
    8000637c:	00002597          	auipc	a1,0x2
    80006380:	2b458593          	addi	a1,a1,692 # 80008630 <_ZL6digits+0x168>
    80006384:	00000097          	auipc	ra,0x0
    80006388:	5f4080e7          	jalr	1524(ra) # 80006978 <initlock>
    8000638c:	01813083          	ld	ra,24(sp)
    80006390:	01013403          	ld	s0,16(sp)
    80006394:	0004ac23          	sw	zero,24(s1)
    80006398:	00813483          	ld	s1,8(sp)
    8000639c:	02010113          	addi	sp,sp,32
    800063a0:	00008067          	ret

00000000800063a4 <uartinit>:
    800063a4:	ff010113          	addi	sp,sp,-16
    800063a8:	00813423          	sd	s0,8(sp)
    800063ac:	01010413          	addi	s0,sp,16
    800063b0:	100007b7          	lui	a5,0x10000
    800063b4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    800063b8:	f8000713          	li	a4,-128
    800063bc:	00e781a3          	sb	a4,3(a5)
    800063c0:	00300713          	li	a4,3
    800063c4:	00e78023          	sb	a4,0(a5)
    800063c8:	000780a3          	sb	zero,1(a5)
    800063cc:	00e781a3          	sb	a4,3(a5)
    800063d0:	00700693          	li	a3,7
    800063d4:	00d78123          	sb	a3,2(a5)
    800063d8:	00e780a3          	sb	a4,1(a5)
    800063dc:	00813403          	ld	s0,8(sp)
    800063e0:	01010113          	addi	sp,sp,16
    800063e4:	00008067          	ret

00000000800063e8 <uartputc>:
    800063e8:	00004797          	auipc	a5,0x4
    800063ec:	9207a783          	lw	a5,-1760(a5) # 80009d08 <panicked>
    800063f0:	00078463          	beqz	a5,800063f8 <uartputc+0x10>
    800063f4:	0000006f          	j	800063f4 <uartputc+0xc>
    800063f8:	fd010113          	addi	sp,sp,-48
    800063fc:	02813023          	sd	s0,32(sp)
    80006400:	00913c23          	sd	s1,24(sp)
    80006404:	01213823          	sd	s2,16(sp)
    80006408:	01313423          	sd	s3,8(sp)
    8000640c:	02113423          	sd	ra,40(sp)
    80006410:	03010413          	addi	s0,sp,48
    80006414:	00004917          	auipc	s2,0x4
    80006418:	8fc90913          	addi	s2,s2,-1796 # 80009d10 <uart_tx_r>
    8000641c:	00093783          	ld	a5,0(s2)
    80006420:	00004497          	auipc	s1,0x4
    80006424:	8f848493          	addi	s1,s1,-1800 # 80009d18 <uart_tx_w>
    80006428:	0004b703          	ld	a4,0(s1)
    8000642c:	02078693          	addi	a3,a5,32
    80006430:	00050993          	mv	s3,a0
    80006434:	02e69c63          	bne	a3,a4,8000646c <uartputc+0x84>
    80006438:	00001097          	auipc	ra,0x1
    8000643c:	834080e7          	jalr	-1996(ra) # 80006c6c <push_on>
    80006440:	00093783          	ld	a5,0(s2)
    80006444:	0004b703          	ld	a4,0(s1)
    80006448:	02078793          	addi	a5,a5,32
    8000644c:	00e79463          	bne	a5,a4,80006454 <uartputc+0x6c>
    80006450:	0000006f          	j	80006450 <uartputc+0x68>
    80006454:	00001097          	auipc	ra,0x1
    80006458:	88c080e7          	jalr	-1908(ra) # 80006ce0 <pop_on>
    8000645c:	00093783          	ld	a5,0(s2)
    80006460:	0004b703          	ld	a4,0(s1)
    80006464:	02078693          	addi	a3,a5,32
    80006468:	fce688e3          	beq	a3,a4,80006438 <uartputc+0x50>
    8000646c:	01f77693          	andi	a3,a4,31
    80006470:	00005597          	auipc	a1,0x5
    80006474:	b6058593          	addi	a1,a1,-1184 # 8000afd0 <uart_tx_buf>
    80006478:	00d586b3          	add	a3,a1,a3
    8000647c:	00170713          	addi	a4,a4,1
    80006480:	01368023          	sb	s3,0(a3)
    80006484:	00e4b023          	sd	a4,0(s1)
    80006488:	10000637          	lui	a2,0x10000
    8000648c:	02f71063          	bne	a4,a5,800064ac <uartputc+0xc4>
    80006490:	0340006f          	j	800064c4 <uartputc+0xdc>
    80006494:	00074703          	lbu	a4,0(a4)
    80006498:	00f93023          	sd	a5,0(s2)
    8000649c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    800064a0:	00093783          	ld	a5,0(s2)
    800064a4:	0004b703          	ld	a4,0(s1)
    800064a8:	00f70e63          	beq	a4,a5,800064c4 <uartputc+0xdc>
    800064ac:	00564683          	lbu	a3,5(a2)
    800064b0:	01f7f713          	andi	a4,a5,31
    800064b4:	00e58733          	add	a4,a1,a4
    800064b8:	0206f693          	andi	a3,a3,32
    800064bc:	00178793          	addi	a5,a5,1
    800064c0:	fc069ae3          	bnez	a3,80006494 <uartputc+0xac>
    800064c4:	02813083          	ld	ra,40(sp)
    800064c8:	02013403          	ld	s0,32(sp)
    800064cc:	01813483          	ld	s1,24(sp)
    800064d0:	01013903          	ld	s2,16(sp)
    800064d4:	00813983          	ld	s3,8(sp)
    800064d8:	03010113          	addi	sp,sp,48
    800064dc:	00008067          	ret

00000000800064e0 <uartputc_sync>:
    800064e0:	ff010113          	addi	sp,sp,-16
    800064e4:	00813423          	sd	s0,8(sp)
    800064e8:	01010413          	addi	s0,sp,16
    800064ec:	00004717          	auipc	a4,0x4
    800064f0:	81c72703          	lw	a4,-2020(a4) # 80009d08 <panicked>
    800064f4:	02071663          	bnez	a4,80006520 <uartputc_sync+0x40>
    800064f8:	00050793          	mv	a5,a0
    800064fc:	100006b7          	lui	a3,0x10000
    80006500:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80006504:	02077713          	andi	a4,a4,32
    80006508:	fe070ce3          	beqz	a4,80006500 <uartputc_sync+0x20>
    8000650c:	0ff7f793          	andi	a5,a5,255
    80006510:	00f68023          	sb	a5,0(a3)
    80006514:	00813403          	ld	s0,8(sp)
    80006518:	01010113          	addi	sp,sp,16
    8000651c:	00008067          	ret
    80006520:	0000006f          	j	80006520 <uartputc_sync+0x40>

0000000080006524 <uartstart>:
    80006524:	ff010113          	addi	sp,sp,-16
    80006528:	00813423          	sd	s0,8(sp)
    8000652c:	01010413          	addi	s0,sp,16
    80006530:	00003617          	auipc	a2,0x3
    80006534:	7e060613          	addi	a2,a2,2016 # 80009d10 <uart_tx_r>
    80006538:	00003517          	auipc	a0,0x3
    8000653c:	7e050513          	addi	a0,a0,2016 # 80009d18 <uart_tx_w>
    80006540:	00063783          	ld	a5,0(a2)
    80006544:	00053703          	ld	a4,0(a0)
    80006548:	04f70263          	beq	a4,a5,8000658c <uartstart+0x68>
    8000654c:	100005b7          	lui	a1,0x10000
    80006550:	00005817          	auipc	a6,0x5
    80006554:	a8080813          	addi	a6,a6,-1408 # 8000afd0 <uart_tx_buf>
    80006558:	01c0006f          	j	80006574 <uartstart+0x50>
    8000655c:	0006c703          	lbu	a4,0(a3)
    80006560:	00f63023          	sd	a5,0(a2)
    80006564:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80006568:	00063783          	ld	a5,0(a2)
    8000656c:	00053703          	ld	a4,0(a0)
    80006570:	00f70e63          	beq	a4,a5,8000658c <uartstart+0x68>
    80006574:	01f7f713          	andi	a4,a5,31
    80006578:	00e806b3          	add	a3,a6,a4
    8000657c:	0055c703          	lbu	a4,5(a1)
    80006580:	00178793          	addi	a5,a5,1
    80006584:	02077713          	andi	a4,a4,32
    80006588:	fc071ae3          	bnez	a4,8000655c <uartstart+0x38>
    8000658c:	00813403          	ld	s0,8(sp)
    80006590:	01010113          	addi	sp,sp,16
    80006594:	00008067          	ret

0000000080006598 <uartgetc>:
    80006598:	ff010113          	addi	sp,sp,-16
    8000659c:	00813423          	sd	s0,8(sp)
    800065a0:	01010413          	addi	s0,sp,16
    800065a4:	10000737          	lui	a4,0x10000
    800065a8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    800065ac:	0017f793          	andi	a5,a5,1
    800065b0:	00078c63          	beqz	a5,800065c8 <uartgetc+0x30>
    800065b4:	00074503          	lbu	a0,0(a4)
    800065b8:	0ff57513          	andi	a0,a0,255
    800065bc:	00813403          	ld	s0,8(sp)
    800065c0:	01010113          	addi	sp,sp,16
    800065c4:	00008067          	ret
    800065c8:	fff00513          	li	a0,-1
    800065cc:	ff1ff06f          	j	800065bc <uartgetc+0x24>

00000000800065d0 <uartintr>:
    800065d0:	100007b7          	lui	a5,0x10000
    800065d4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    800065d8:	0017f793          	andi	a5,a5,1
    800065dc:	0a078463          	beqz	a5,80006684 <uartintr+0xb4>
    800065e0:	fe010113          	addi	sp,sp,-32
    800065e4:	00813823          	sd	s0,16(sp)
    800065e8:	00913423          	sd	s1,8(sp)
    800065ec:	00113c23          	sd	ra,24(sp)
    800065f0:	02010413          	addi	s0,sp,32
    800065f4:	100004b7          	lui	s1,0x10000
    800065f8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    800065fc:	0ff57513          	andi	a0,a0,255
    80006600:	fffff097          	auipc	ra,0xfffff
    80006604:	534080e7          	jalr	1332(ra) # 80005b34 <consoleintr>
    80006608:	0054c783          	lbu	a5,5(s1)
    8000660c:	0017f793          	andi	a5,a5,1
    80006610:	fe0794e3          	bnez	a5,800065f8 <uartintr+0x28>
    80006614:	00003617          	auipc	a2,0x3
    80006618:	6fc60613          	addi	a2,a2,1788 # 80009d10 <uart_tx_r>
    8000661c:	00003517          	auipc	a0,0x3
    80006620:	6fc50513          	addi	a0,a0,1788 # 80009d18 <uart_tx_w>
    80006624:	00063783          	ld	a5,0(a2)
    80006628:	00053703          	ld	a4,0(a0)
    8000662c:	04f70263          	beq	a4,a5,80006670 <uartintr+0xa0>
    80006630:	100005b7          	lui	a1,0x10000
    80006634:	00005817          	auipc	a6,0x5
    80006638:	99c80813          	addi	a6,a6,-1636 # 8000afd0 <uart_tx_buf>
    8000663c:	01c0006f          	j	80006658 <uartintr+0x88>
    80006640:	0006c703          	lbu	a4,0(a3)
    80006644:	00f63023          	sd	a5,0(a2)
    80006648:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000664c:	00063783          	ld	a5,0(a2)
    80006650:	00053703          	ld	a4,0(a0)
    80006654:	00f70e63          	beq	a4,a5,80006670 <uartintr+0xa0>
    80006658:	01f7f713          	andi	a4,a5,31
    8000665c:	00e806b3          	add	a3,a6,a4
    80006660:	0055c703          	lbu	a4,5(a1)
    80006664:	00178793          	addi	a5,a5,1
    80006668:	02077713          	andi	a4,a4,32
    8000666c:	fc071ae3          	bnez	a4,80006640 <uartintr+0x70>
    80006670:	01813083          	ld	ra,24(sp)
    80006674:	01013403          	ld	s0,16(sp)
    80006678:	00813483          	ld	s1,8(sp)
    8000667c:	02010113          	addi	sp,sp,32
    80006680:	00008067          	ret
    80006684:	00003617          	auipc	a2,0x3
    80006688:	68c60613          	addi	a2,a2,1676 # 80009d10 <uart_tx_r>
    8000668c:	00003517          	auipc	a0,0x3
    80006690:	68c50513          	addi	a0,a0,1676 # 80009d18 <uart_tx_w>
    80006694:	00063783          	ld	a5,0(a2)
    80006698:	00053703          	ld	a4,0(a0)
    8000669c:	04f70263          	beq	a4,a5,800066e0 <uartintr+0x110>
    800066a0:	100005b7          	lui	a1,0x10000
    800066a4:	00005817          	auipc	a6,0x5
    800066a8:	92c80813          	addi	a6,a6,-1748 # 8000afd0 <uart_tx_buf>
    800066ac:	01c0006f          	j	800066c8 <uartintr+0xf8>
    800066b0:	0006c703          	lbu	a4,0(a3)
    800066b4:	00f63023          	sd	a5,0(a2)
    800066b8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800066bc:	00063783          	ld	a5,0(a2)
    800066c0:	00053703          	ld	a4,0(a0)
    800066c4:	02f70063          	beq	a4,a5,800066e4 <uartintr+0x114>
    800066c8:	01f7f713          	andi	a4,a5,31
    800066cc:	00e806b3          	add	a3,a6,a4
    800066d0:	0055c703          	lbu	a4,5(a1)
    800066d4:	00178793          	addi	a5,a5,1
    800066d8:	02077713          	andi	a4,a4,32
    800066dc:	fc071ae3          	bnez	a4,800066b0 <uartintr+0xe0>
    800066e0:	00008067          	ret
    800066e4:	00008067          	ret

00000000800066e8 <kinit>:
    800066e8:	fc010113          	addi	sp,sp,-64
    800066ec:	02913423          	sd	s1,40(sp)
    800066f0:	fffff7b7          	lui	a5,0xfffff
    800066f4:	00006497          	auipc	s1,0x6
    800066f8:	8fb48493          	addi	s1,s1,-1797 # 8000bfef <end+0xfff>
    800066fc:	02813823          	sd	s0,48(sp)
    80006700:	01313c23          	sd	s3,24(sp)
    80006704:	00f4f4b3          	and	s1,s1,a5
    80006708:	02113c23          	sd	ra,56(sp)
    8000670c:	03213023          	sd	s2,32(sp)
    80006710:	01413823          	sd	s4,16(sp)
    80006714:	01513423          	sd	s5,8(sp)
    80006718:	04010413          	addi	s0,sp,64
    8000671c:	000017b7          	lui	a5,0x1
    80006720:	01100993          	li	s3,17
    80006724:	00f487b3          	add	a5,s1,a5
    80006728:	01b99993          	slli	s3,s3,0x1b
    8000672c:	06f9e063          	bltu	s3,a5,8000678c <kinit+0xa4>
    80006730:	00005a97          	auipc	s5,0x5
    80006734:	8c0a8a93          	addi	s5,s5,-1856 # 8000aff0 <end>
    80006738:	0754ec63          	bltu	s1,s5,800067b0 <kinit+0xc8>
    8000673c:	0734fa63          	bgeu	s1,s3,800067b0 <kinit+0xc8>
    80006740:	00088a37          	lui	s4,0x88
    80006744:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80006748:	00003917          	auipc	s2,0x3
    8000674c:	5d890913          	addi	s2,s2,1496 # 80009d20 <kmem>
    80006750:	00ca1a13          	slli	s4,s4,0xc
    80006754:	0140006f          	j	80006768 <kinit+0x80>
    80006758:	000017b7          	lui	a5,0x1
    8000675c:	00f484b3          	add	s1,s1,a5
    80006760:	0554e863          	bltu	s1,s5,800067b0 <kinit+0xc8>
    80006764:	0534f663          	bgeu	s1,s3,800067b0 <kinit+0xc8>
    80006768:	00001637          	lui	a2,0x1
    8000676c:	00100593          	li	a1,1
    80006770:	00048513          	mv	a0,s1
    80006774:	00000097          	auipc	ra,0x0
    80006778:	5e4080e7          	jalr	1508(ra) # 80006d58 <__memset>
    8000677c:	00093783          	ld	a5,0(s2)
    80006780:	00f4b023          	sd	a5,0(s1)
    80006784:	00993023          	sd	s1,0(s2)
    80006788:	fd4498e3          	bne	s1,s4,80006758 <kinit+0x70>
    8000678c:	03813083          	ld	ra,56(sp)
    80006790:	03013403          	ld	s0,48(sp)
    80006794:	02813483          	ld	s1,40(sp)
    80006798:	02013903          	ld	s2,32(sp)
    8000679c:	01813983          	ld	s3,24(sp)
    800067a0:	01013a03          	ld	s4,16(sp)
    800067a4:	00813a83          	ld	s5,8(sp)
    800067a8:	04010113          	addi	sp,sp,64
    800067ac:	00008067          	ret
    800067b0:	00002517          	auipc	a0,0x2
    800067b4:	ea050513          	addi	a0,a0,-352 # 80008650 <digits+0x18>
    800067b8:	fffff097          	auipc	ra,0xfffff
    800067bc:	4b4080e7          	jalr	1204(ra) # 80005c6c <panic>

00000000800067c0 <freerange>:
    800067c0:	fc010113          	addi	sp,sp,-64
    800067c4:	000017b7          	lui	a5,0x1
    800067c8:	02913423          	sd	s1,40(sp)
    800067cc:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    800067d0:	009504b3          	add	s1,a0,s1
    800067d4:	fffff537          	lui	a0,0xfffff
    800067d8:	02813823          	sd	s0,48(sp)
    800067dc:	02113c23          	sd	ra,56(sp)
    800067e0:	03213023          	sd	s2,32(sp)
    800067e4:	01313c23          	sd	s3,24(sp)
    800067e8:	01413823          	sd	s4,16(sp)
    800067ec:	01513423          	sd	s5,8(sp)
    800067f0:	01613023          	sd	s6,0(sp)
    800067f4:	04010413          	addi	s0,sp,64
    800067f8:	00a4f4b3          	and	s1,s1,a0
    800067fc:	00f487b3          	add	a5,s1,a5
    80006800:	06f5e463          	bltu	a1,a5,80006868 <freerange+0xa8>
    80006804:	00004a97          	auipc	s5,0x4
    80006808:	7eca8a93          	addi	s5,s5,2028 # 8000aff0 <end>
    8000680c:	0954e263          	bltu	s1,s5,80006890 <freerange+0xd0>
    80006810:	01100993          	li	s3,17
    80006814:	01b99993          	slli	s3,s3,0x1b
    80006818:	0734fc63          	bgeu	s1,s3,80006890 <freerange+0xd0>
    8000681c:	00058a13          	mv	s4,a1
    80006820:	00003917          	auipc	s2,0x3
    80006824:	50090913          	addi	s2,s2,1280 # 80009d20 <kmem>
    80006828:	00002b37          	lui	s6,0x2
    8000682c:	0140006f          	j	80006840 <freerange+0x80>
    80006830:	000017b7          	lui	a5,0x1
    80006834:	00f484b3          	add	s1,s1,a5
    80006838:	0554ec63          	bltu	s1,s5,80006890 <freerange+0xd0>
    8000683c:	0534fa63          	bgeu	s1,s3,80006890 <freerange+0xd0>
    80006840:	00001637          	lui	a2,0x1
    80006844:	00100593          	li	a1,1
    80006848:	00048513          	mv	a0,s1
    8000684c:	00000097          	auipc	ra,0x0
    80006850:	50c080e7          	jalr	1292(ra) # 80006d58 <__memset>
    80006854:	00093703          	ld	a4,0(s2)
    80006858:	016487b3          	add	a5,s1,s6
    8000685c:	00e4b023          	sd	a4,0(s1)
    80006860:	00993023          	sd	s1,0(s2)
    80006864:	fcfa76e3          	bgeu	s4,a5,80006830 <freerange+0x70>
    80006868:	03813083          	ld	ra,56(sp)
    8000686c:	03013403          	ld	s0,48(sp)
    80006870:	02813483          	ld	s1,40(sp)
    80006874:	02013903          	ld	s2,32(sp)
    80006878:	01813983          	ld	s3,24(sp)
    8000687c:	01013a03          	ld	s4,16(sp)
    80006880:	00813a83          	ld	s5,8(sp)
    80006884:	00013b03          	ld	s6,0(sp)
    80006888:	04010113          	addi	sp,sp,64
    8000688c:	00008067          	ret
    80006890:	00002517          	auipc	a0,0x2
    80006894:	dc050513          	addi	a0,a0,-576 # 80008650 <digits+0x18>
    80006898:	fffff097          	auipc	ra,0xfffff
    8000689c:	3d4080e7          	jalr	980(ra) # 80005c6c <panic>

00000000800068a0 <kfree>:
    800068a0:	fe010113          	addi	sp,sp,-32
    800068a4:	00813823          	sd	s0,16(sp)
    800068a8:	00113c23          	sd	ra,24(sp)
    800068ac:	00913423          	sd	s1,8(sp)
    800068b0:	02010413          	addi	s0,sp,32
    800068b4:	03451793          	slli	a5,a0,0x34
    800068b8:	04079c63          	bnez	a5,80006910 <kfree+0x70>
    800068bc:	00004797          	auipc	a5,0x4
    800068c0:	73478793          	addi	a5,a5,1844 # 8000aff0 <end>
    800068c4:	00050493          	mv	s1,a0
    800068c8:	04f56463          	bltu	a0,a5,80006910 <kfree+0x70>
    800068cc:	01100793          	li	a5,17
    800068d0:	01b79793          	slli	a5,a5,0x1b
    800068d4:	02f57e63          	bgeu	a0,a5,80006910 <kfree+0x70>
    800068d8:	00001637          	lui	a2,0x1
    800068dc:	00100593          	li	a1,1
    800068e0:	00000097          	auipc	ra,0x0
    800068e4:	478080e7          	jalr	1144(ra) # 80006d58 <__memset>
    800068e8:	00003797          	auipc	a5,0x3
    800068ec:	43878793          	addi	a5,a5,1080 # 80009d20 <kmem>
    800068f0:	0007b703          	ld	a4,0(a5)
    800068f4:	01813083          	ld	ra,24(sp)
    800068f8:	01013403          	ld	s0,16(sp)
    800068fc:	00e4b023          	sd	a4,0(s1)
    80006900:	0097b023          	sd	s1,0(a5)
    80006904:	00813483          	ld	s1,8(sp)
    80006908:	02010113          	addi	sp,sp,32
    8000690c:	00008067          	ret
    80006910:	00002517          	auipc	a0,0x2
    80006914:	d4050513          	addi	a0,a0,-704 # 80008650 <digits+0x18>
    80006918:	fffff097          	auipc	ra,0xfffff
    8000691c:	354080e7          	jalr	852(ra) # 80005c6c <panic>

0000000080006920 <kalloc>:
    80006920:	fe010113          	addi	sp,sp,-32
    80006924:	00813823          	sd	s0,16(sp)
    80006928:	00913423          	sd	s1,8(sp)
    8000692c:	00113c23          	sd	ra,24(sp)
    80006930:	02010413          	addi	s0,sp,32
    80006934:	00003797          	auipc	a5,0x3
    80006938:	3ec78793          	addi	a5,a5,1004 # 80009d20 <kmem>
    8000693c:	0007b483          	ld	s1,0(a5)
    80006940:	02048063          	beqz	s1,80006960 <kalloc+0x40>
    80006944:	0004b703          	ld	a4,0(s1)
    80006948:	00001637          	lui	a2,0x1
    8000694c:	00500593          	li	a1,5
    80006950:	00048513          	mv	a0,s1
    80006954:	00e7b023          	sd	a4,0(a5)
    80006958:	00000097          	auipc	ra,0x0
    8000695c:	400080e7          	jalr	1024(ra) # 80006d58 <__memset>
    80006960:	01813083          	ld	ra,24(sp)
    80006964:	01013403          	ld	s0,16(sp)
    80006968:	00048513          	mv	a0,s1
    8000696c:	00813483          	ld	s1,8(sp)
    80006970:	02010113          	addi	sp,sp,32
    80006974:	00008067          	ret

0000000080006978 <initlock>:
    80006978:	ff010113          	addi	sp,sp,-16
    8000697c:	00813423          	sd	s0,8(sp)
    80006980:	01010413          	addi	s0,sp,16
    80006984:	00813403          	ld	s0,8(sp)
    80006988:	00b53423          	sd	a1,8(a0)
    8000698c:	00052023          	sw	zero,0(a0)
    80006990:	00053823          	sd	zero,16(a0)
    80006994:	01010113          	addi	sp,sp,16
    80006998:	00008067          	ret

000000008000699c <acquire>:
    8000699c:	fe010113          	addi	sp,sp,-32
    800069a0:	00813823          	sd	s0,16(sp)
    800069a4:	00913423          	sd	s1,8(sp)
    800069a8:	00113c23          	sd	ra,24(sp)
    800069ac:	01213023          	sd	s2,0(sp)
    800069b0:	02010413          	addi	s0,sp,32
    800069b4:	00050493          	mv	s1,a0
    800069b8:	10002973          	csrr	s2,sstatus
    800069bc:	100027f3          	csrr	a5,sstatus
    800069c0:	ffd7f793          	andi	a5,a5,-3
    800069c4:	10079073          	csrw	sstatus,a5
    800069c8:	fffff097          	auipc	ra,0xfffff
    800069cc:	8e8080e7          	jalr	-1816(ra) # 800052b0 <mycpu>
    800069d0:	07852783          	lw	a5,120(a0)
    800069d4:	06078e63          	beqz	a5,80006a50 <acquire+0xb4>
    800069d8:	fffff097          	auipc	ra,0xfffff
    800069dc:	8d8080e7          	jalr	-1832(ra) # 800052b0 <mycpu>
    800069e0:	07852783          	lw	a5,120(a0)
    800069e4:	0004a703          	lw	a4,0(s1)
    800069e8:	0017879b          	addiw	a5,a5,1
    800069ec:	06f52c23          	sw	a5,120(a0)
    800069f0:	04071063          	bnez	a4,80006a30 <acquire+0x94>
    800069f4:	00100713          	li	a4,1
    800069f8:	00070793          	mv	a5,a4
    800069fc:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80006a00:	0007879b          	sext.w	a5,a5
    80006a04:	fe079ae3          	bnez	a5,800069f8 <acquire+0x5c>
    80006a08:	0ff0000f          	fence
    80006a0c:	fffff097          	auipc	ra,0xfffff
    80006a10:	8a4080e7          	jalr	-1884(ra) # 800052b0 <mycpu>
    80006a14:	01813083          	ld	ra,24(sp)
    80006a18:	01013403          	ld	s0,16(sp)
    80006a1c:	00a4b823          	sd	a0,16(s1)
    80006a20:	00013903          	ld	s2,0(sp)
    80006a24:	00813483          	ld	s1,8(sp)
    80006a28:	02010113          	addi	sp,sp,32
    80006a2c:	00008067          	ret
    80006a30:	0104b903          	ld	s2,16(s1)
    80006a34:	fffff097          	auipc	ra,0xfffff
    80006a38:	87c080e7          	jalr	-1924(ra) # 800052b0 <mycpu>
    80006a3c:	faa91ce3          	bne	s2,a0,800069f4 <acquire+0x58>
    80006a40:	00002517          	auipc	a0,0x2
    80006a44:	c1850513          	addi	a0,a0,-1000 # 80008658 <digits+0x20>
    80006a48:	fffff097          	auipc	ra,0xfffff
    80006a4c:	224080e7          	jalr	548(ra) # 80005c6c <panic>
    80006a50:	00195913          	srli	s2,s2,0x1
    80006a54:	fffff097          	auipc	ra,0xfffff
    80006a58:	85c080e7          	jalr	-1956(ra) # 800052b0 <mycpu>
    80006a5c:	00197913          	andi	s2,s2,1
    80006a60:	07252e23          	sw	s2,124(a0)
    80006a64:	f75ff06f          	j	800069d8 <acquire+0x3c>

0000000080006a68 <release>:
    80006a68:	fe010113          	addi	sp,sp,-32
    80006a6c:	00813823          	sd	s0,16(sp)
    80006a70:	00113c23          	sd	ra,24(sp)
    80006a74:	00913423          	sd	s1,8(sp)
    80006a78:	01213023          	sd	s2,0(sp)
    80006a7c:	02010413          	addi	s0,sp,32
    80006a80:	00052783          	lw	a5,0(a0)
    80006a84:	00079a63          	bnez	a5,80006a98 <release+0x30>
    80006a88:	00002517          	auipc	a0,0x2
    80006a8c:	bd850513          	addi	a0,a0,-1064 # 80008660 <digits+0x28>
    80006a90:	fffff097          	auipc	ra,0xfffff
    80006a94:	1dc080e7          	jalr	476(ra) # 80005c6c <panic>
    80006a98:	01053903          	ld	s2,16(a0)
    80006a9c:	00050493          	mv	s1,a0
    80006aa0:	fffff097          	auipc	ra,0xfffff
    80006aa4:	810080e7          	jalr	-2032(ra) # 800052b0 <mycpu>
    80006aa8:	fea910e3          	bne	s2,a0,80006a88 <release+0x20>
    80006aac:	0004b823          	sd	zero,16(s1)
    80006ab0:	0ff0000f          	fence
    80006ab4:	0f50000f          	fence	iorw,ow
    80006ab8:	0804a02f          	amoswap.w	zero,zero,(s1)
    80006abc:	ffffe097          	auipc	ra,0xffffe
    80006ac0:	7f4080e7          	jalr	2036(ra) # 800052b0 <mycpu>
    80006ac4:	100027f3          	csrr	a5,sstatus
    80006ac8:	0027f793          	andi	a5,a5,2
    80006acc:	04079a63          	bnez	a5,80006b20 <release+0xb8>
    80006ad0:	07852783          	lw	a5,120(a0)
    80006ad4:	02f05e63          	blez	a5,80006b10 <release+0xa8>
    80006ad8:	fff7871b          	addiw	a4,a5,-1
    80006adc:	06e52c23          	sw	a4,120(a0)
    80006ae0:	00071c63          	bnez	a4,80006af8 <release+0x90>
    80006ae4:	07c52783          	lw	a5,124(a0)
    80006ae8:	00078863          	beqz	a5,80006af8 <release+0x90>
    80006aec:	100027f3          	csrr	a5,sstatus
    80006af0:	0027e793          	ori	a5,a5,2
    80006af4:	10079073          	csrw	sstatus,a5
    80006af8:	01813083          	ld	ra,24(sp)
    80006afc:	01013403          	ld	s0,16(sp)
    80006b00:	00813483          	ld	s1,8(sp)
    80006b04:	00013903          	ld	s2,0(sp)
    80006b08:	02010113          	addi	sp,sp,32
    80006b0c:	00008067          	ret
    80006b10:	00002517          	auipc	a0,0x2
    80006b14:	b7050513          	addi	a0,a0,-1168 # 80008680 <digits+0x48>
    80006b18:	fffff097          	auipc	ra,0xfffff
    80006b1c:	154080e7          	jalr	340(ra) # 80005c6c <panic>
    80006b20:	00002517          	auipc	a0,0x2
    80006b24:	b4850513          	addi	a0,a0,-1208 # 80008668 <digits+0x30>
    80006b28:	fffff097          	auipc	ra,0xfffff
    80006b2c:	144080e7          	jalr	324(ra) # 80005c6c <panic>

0000000080006b30 <holding>:
    80006b30:	00052783          	lw	a5,0(a0)
    80006b34:	00079663          	bnez	a5,80006b40 <holding+0x10>
    80006b38:	00000513          	li	a0,0
    80006b3c:	00008067          	ret
    80006b40:	fe010113          	addi	sp,sp,-32
    80006b44:	00813823          	sd	s0,16(sp)
    80006b48:	00913423          	sd	s1,8(sp)
    80006b4c:	00113c23          	sd	ra,24(sp)
    80006b50:	02010413          	addi	s0,sp,32
    80006b54:	01053483          	ld	s1,16(a0)
    80006b58:	ffffe097          	auipc	ra,0xffffe
    80006b5c:	758080e7          	jalr	1880(ra) # 800052b0 <mycpu>
    80006b60:	01813083          	ld	ra,24(sp)
    80006b64:	01013403          	ld	s0,16(sp)
    80006b68:	40a48533          	sub	a0,s1,a0
    80006b6c:	00153513          	seqz	a0,a0
    80006b70:	00813483          	ld	s1,8(sp)
    80006b74:	02010113          	addi	sp,sp,32
    80006b78:	00008067          	ret

0000000080006b7c <push_off>:
    80006b7c:	fe010113          	addi	sp,sp,-32
    80006b80:	00813823          	sd	s0,16(sp)
    80006b84:	00113c23          	sd	ra,24(sp)
    80006b88:	00913423          	sd	s1,8(sp)
    80006b8c:	02010413          	addi	s0,sp,32
    80006b90:	100024f3          	csrr	s1,sstatus
    80006b94:	100027f3          	csrr	a5,sstatus
    80006b98:	ffd7f793          	andi	a5,a5,-3
    80006b9c:	10079073          	csrw	sstatus,a5
    80006ba0:	ffffe097          	auipc	ra,0xffffe
    80006ba4:	710080e7          	jalr	1808(ra) # 800052b0 <mycpu>
    80006ba8:	07852783          	lw	a5,120(a0)
    80006bac:	02078663          	beqz	a5,80006bd8 <push_off+0x5c>
    80006bb0:	ffffe097          	auipc	ra,0xffffe
    80006bb4:	700080e7          	jalr	1792(ra) # 800052b0 <mycpu>
    80006bb8:	07852783          	lw	a5,120(a0)
    80006bbc:	01813083          	ld	ra,24(sp)
    80006bc0:	01013403          	ld	s0,16(sp)
    80006bc4:	0017879b          	addiw	a5,a5,1
    80006bc8:	06f52c23          	sw	a5,120(a0)
    80006bcc:	00813483          	ld	s1,8(sp)
    80006bd0:	02010113          	addi	sp,sp,32
    80006bd4:	00008067          	ret
    80006bd8:	0014d493          	srli	s1,s1,0x1
    80006bdc:	ffffe097          	auipc	ra,0xffffe
    80006be0:	6d4080e7          	jalr	1748(ra) # 800052b0 <mycpu>
    80006be4:	0014f493          	andi	s1,s1,1
    80006be8:	06952e23          	sw	s1,124(a0)
    80006bec:	fc5ff06f          	j	80006bb0 <push_off+0x34>

0000000080006bf0 <pop_off>:
    80006bf0:	ff010113          	addi	sp,sp,-16
    80006bf4:	00813023          	sd	s0,0(sp)
    80006bf8:	00113423          	sd	ra,8(sp)
    80006bfc:	01010413          	addi	s0,sp,16
    80006c00:	ffffe097          	auipc	ra,0xffffe
    80006c04:	6b0080e7          	jalr	1712(ra) # 800052b0 <mycpu>
    80006c08:	100027f3          	csrr	a5,sstatus
    80006c0c:	0027f793          	andi	a5,a5,2
    80006c10:	04079663          	bnez	a5,80006c5c <pop_off+0x6c>
    80006c14:	07852783          	lw	a5,120(a0)
    80006c18:	02f05a63          	blez	a5,80006c4c <pop_off+0x5c>
    80006c1c:	fff7871b          	addiw	a4,a5,-1
    80006c20:	06e52c23          	sw	a4,120(a0)
    80006c24:	00071c63          	bnez	a4,80006c3c <pop_off+0x4c>
    80006c28:	07c52783          	lw	a5,124(a0)
    80006c2c:	00078863          	beqz	a5,80006c3c <pop_off+0x4c>
    80006c30:	100027f3          	csrr	a5,sstatus
    80006c34:	0027e793          	ori	a5,a5,2
    80006c38:	10079073          	csrw	sstatus,a5
    80006c3c:	00813083          	ld	ra,8(sp)
    80006c40:	00013403          	ld	s0,0(sp)
    80006c44:	01010113          	addi	sp,sp,16
    80006c48:	00008067          	ret
    80006c4c:	00002517          	auipc	a0,0x2
    80006c50:	a3450513          	addi	a0,a0,-1484 # 80008680 <digits+0x48>
    80006c54:	fffff097          	auipc	ra,0xfffff
    80006c58:	018080e7          	jalr	24(ra) # 80005c6c <panic>
    80006c5c:	00002517          	auipc	a0,0x2
    80006c60:	a0c50513          	addi	a0,a0,-1524 # 80008668 <digits+0x30>
    80006c64:	fffff097          	auipc	ra,0xfffff
    80006c68:	008080e7          	jalr	8(ra) # 80005c6c <panic>

0000000080006c6c <push_on>:
    80006c6c:	fe010113          	addi	sp,sp,-32
    80006c70:	00813823          	sd	s0,16(sp)
    80006c74:	00113c23          	sd	ra,24(sp)
    80006c78:	00913423          	sd	s1,8(sp)
    80006c7c:	02010413          	addi	s0,sp,32
    80006c80:	100024f3          	csrr	s1,sstatus
    80006c84:	100027f3          	csrr	a5,sstatus
    80006c88:	0027e793          	ori	a5,a5,2
    80006c8c:	10079073          	csrw	sstatus,a5
    80006c90:	ffffe097          	auipc	ra,0xffffe
    80006c94:	620080e7          	jalr	1568(ra) # 800052b0 <mycpu>
    80006c98:	07852783          	lw	a5,120(a0)
    80006c9c:	02078663          	beqz	a5,80006cc8 <push_on+0x5c>
    80006ca0:	ffffe097          	auipc	ra,0xffffe
    80006ca4:	610080e7          	jalr	1552(ra) # 800052b0 <mycpu>
    80006ca8:	07852783          	lw	a5,120(a0)
    80006cac:	01813083          	ld	ra,24(sp)
    80006cb0:	01013403          	ld	s0,16(sp)
    80006cb4:	0017879b          	addiw	a5,a5,1
    80006cb8:	06f52c23          	sw	a5,120(a0)
    80006cbc:	00813483          	ld	s1,8(sp)
    80006cc0:	02010113          	addi	sp,sp,32
    80006cc4:	00008067          	ret
    80006cc8:	0014d493          	srli	s1,s1,0x1
    80006ccc:	ffffe097          	auipc	ra,0xffffe
    80006cd0:	5e4080e7          	jalr	1508(ra) # 800052b0 <mycpu>
    80006cd4:	0014f493          	andi	s1,s1,1
    80006cd8:	06952e23          	sw	s1,124(a0)
    80006cdc:	fc5ff06f          	j	80006ca0 <push_on+0x34>

0000000080006ce0 <pop_on>:
    80006ce0:	ff010113          	addi	sp,sp,-16
    80006ce4:	00813023          	sd	s0,0(sp)
    80006ce8:	00113423          	sd	ra,8(sp)
    80006cec:	01010413          	addi	s0,sp,16
    80006cf0:	ffffe097          	auipc	ra,0xffffe
    80006cf4:	5c0080e7          	jalr	1472(ra) # 800052b0 <mycpu>
    80006cf8:	100027f3          	csrr	a5,sstatus
    80006cfc:	0027f793          	andi	a5,a5,2
    80006d00:	04078463          	beqz	a5,80006d48 <pop_on+0x68>
    80006d04:	07852783          	lw	a5,120(a0)
    80006d08:	02f05863          	blez	a5,80006d38 <pop_on+0x58>
    80006d0c:	fff7879b          	addiw	a5,a5,-1
    80006d10:	06f52c23          	sw	a5,120(a0)
    80006d14:	07853783          	ld	a5,120(a0)
    80006d18:	00079863          	bnez	a5,80006d28 <pop_on+0x48>
    80006d1c:	100027f3          	csrr	a5,sstatus
    80006d20:	ffd7f793          	andi	a5,a5,-3
    80006d24:	10079073          	csrw	sstatus,a5
    80006d28:	00813083          	ld	ra,8(sp)
    80006d2c:	00013403          	ld	s0,0(sp)
    80006d30:	01010113          	addi	sp,sp,16
    80006d34:	00008067          	ret
    80006d38:	00002517          	auipc	a0,0x2
    80006d3c:	97050513          	addi	a0,a0,-1680 # 800086a8 <digits+0x70>
    80006d40:	fffff097          	auipc	ra,0xfffff
    80006d44:	f2c080e7          	jalr	-212(ra) # 80005c6c <panic>
    80006d48:	00002517          	auipc	a0,0x2
    80006d4c:	94050513          	addi	a0,a0,-1728 # 80008688 <digits+0x50>
    80006d50:	fffff097          	auipc	ra,0xfffff
    80006d54:	f1c080e7          	jalr	-228(ra) # 80005c6c <panic>

0000000080006d58 <__memset>:
    80006d58:	ff010113          	addi	sp,sp,-16
    80006d5c:	00813423          	sd	s0,8(sp)
    80006d60:	01010413          	addi	s0,sp,16
    80006d64:	1a060e63          	beqz	a2,80006f20 <__memset+0x1c8>
    80006d68:	40a007b3          	neg	a5,a0
    80006d6c:	0077f793          	andi	a5,a5,7
    80006d70:	00778693          	addi	a3,a5,7
    80006d74:	00b00813          	li	a6,11
    80006d78:	0ff5f593          	andi	a1,a1,255
    80006d7c:	fff6071b          	addiw	a4,a2,-1
    80006d80:	1b06e663          	bltu	a3,a6,80006f2c <__memset+0x1d4>
    80006d84:	1cd76463          	bltu	a4,a3,80006f4c <__memset+0x1f4>
    80006d88:	1a078e63          	beqz	a5,80006f44 <__memset+0x1ec>
    80006d8c:	00b50023          	sb	a1,0(a0)
    80006d90:	00100713          	li	a4,1
    80006d94:	1ae78463          	beq	a5,a4,80006f3c <__memset+0x1e4>
    80006d98:	00b500a3          	sb	a1,1(a0)
    80006d9c:	00200713          	li	a4,2
    80006da0:	1ae78a63          	beq	a5,a4,80006f54 <__memset+0x1fc>
    80006da4:	00b50123          	sb	a1,2(a0)
    80006da8:	00300713          	li	a4,3
    80006dac:	18e78463          	beq	a5,a4,80006f34 <__memset+0x1dc>
    80006db0:	00b501a3          	sb	a1,3(a0)
    80006db4:	00400713          	li	a4,4
    80006db8:	1ae78263          	beq	a5,a4,80006f5c <__memset+0x204>
    80006dbc:	00b50223          	sb	a1,4(a0)
    80006dc0:	00500713          	li	a4,5
    80006dc4:	1ae78063          	beq	a5,a4,80006f64 <__memset+0x20c>
    80006dc8:	00b502a3          	sb	a1,5(a0)
    80006dcc:	00700713          	li	a4,7
    80006dd0:	18e79e63          	bne	a5,a4,80006f6c <__memset+0x214>
    80006dd4:	00b50323          	sb	a1,6(a0)
    80006dd8:	00700e93          	li	t4,7
    80006ddc:	00859713          	slli	a4,a1,0x8
    80006de0:	00e5e733          	or	a4,a1,a4
    80006de4:	01059e13          	slli	t3,a1,0x10
    80006de8:	01c76e33          	or	t3,a4,t3
    80006dec:	01859313          	slli	t1,a1,0x18
    80006df0:	006e6333          	or	t1,t3,t1
    80006df4:	02059893          	slli	a7,a1,0x20
    80006df8:	40f60e3b          	subw	t3,a2,a5
    80006dfc:	011368b3          	or	a7,t1,a7
    80006e00:	02859813          	slli	a6,a1,0x28
    80006e04:	0108e833          	or	a6,a7,a6
    80006e08:	03059693          	slli	a3,a1,0x30
    80006e0c:	003e589b          	srliw	a7,t3,0x3
    80006e10:	00d866b3          	or	a3,a6,a3
    80006e14:	03859713          	slli	a4,a1,0x38
    80006e18:	00389813          	slli	a6,a7,0x3
    80006e1c:	00f507b3          	add	a5,a0,a5
    80006e20:	00e6e733          	or	a4,a3,a4
    80006e24:	000e089b          	sext.w	a7,t3
    80006e28:	00f806b3          	add	a3,a6,a5
    80006e2c:	00e7b023          	sd	a4,0(a5)
    80006e30:	00878793          	addi	a5,a5,8
    80006e34:	fed79ce3          	bne	a5,a3,80006e2c <__memset+0xd4>
    80006e38:	ff8e7793          	andi	a5,t3,-8
    80006e3c:	0007871b          	sext.w	a4,a5
    80006e40:	01d787bb          	addw	a5,a5,t4
    80006e44:	0ce88e63          	beq	a7,a4,80006f20 <__memset+0x1c8>
    80006e48:	00f50733          	add	a4,a0,a5
    80006e4c:	00b70023          	sb	a1,0(a4)
    80006e50:	0017871b          	addiw	a4,a5,1
    80006e54:	0cc77663          	bgeu	a4,a2,80006f20 <__memset+0x1c8>
    80006e58:	00e50733          	add	a4,a0,a4
    80006e5c:	00b70023          	sb	a1,0(a4)
    80006e60:	0027871b          	addiw	a4,a5,2
    80006e64:	0ac77e63          	bgeu	a4,a2,80006f20 <__memset+0x1c8>
    80006e68:	00e50733          	add	a4,a0,a4
    80006e6c:	00b70023          	sb	a1,0(a4)
    80006e70:	0037871b          	addiw	a4,a5,3
    80006e74:	0ac77663          	bgeu	a4,a2,80006f20 <__memset+0x1c8>
    80006e78:	00e50733          	add	a4,a0,a4
    80006e7c:	00b70023          	sb	a1,0(a4)
    80006e80:	0047871b          	addiw	a4,a5,4
    80006e84:	08c77e63          	bgeu	a4,a2,80006f20 <__memset+0x1c8>
    80006e88:	00e50733          	add	a4,a0,a4
    80006e8c:	00b70023          	sb	a1,0(a4)
    80006e90:	0057871b          	addiw	a4,a5,5
    80006e94:	08c77663          	bgeu	a4,a2,80006f20 <__memset+0x1c8>
    80006e98:	00e50733          	add	a4,a0,a4
    80006e9c:	00b70023          	sb	a1,0(a4)
    80006ea0:	0067871b          	addiw	a4,a5,6
    80006ea4:	06c77e63          	bgeu	a4,a2,80006f20 <__memset+0x1c8>
    80006ea8:	00e50733          	add	a4,a0,a4
    80006eac:	00b70023          	sb	a1,0(a4)
    80006eb0:	0077871b          	addiw	a4,a5,7
    80006eb4:	06c77663          	bgeu	a4,a2,80006f20 <__memset+0x1c8>
    80006eb8:	00e50733          	add	a4,a0,a4
    80006ebc:	00b70023          	sb	a1,0(a4)
    80006ec0:	0087871b          	addiw	a4,a5,8
    80006ec4:	04c77e63          	bgeu	a4,a2,80006f20 <__memset+0x1c8>
    80006ec8:	00e50733          	add	a4,a0,a4
    80006ecc:	00b70023          	sb	a1,0(a4)
    80006ed0:	0097871b          	addiw	a4,a5,9
    80006ed4:	04c77663          	bgeu	a4,a2,80006f20 <__memset+0x1c8>
    80006ed8:	00e50733          	add	a4,a0,a4
    80006edc:	00b70023          	sb	a1,0(a4)
    80006ee0:	00a7871b          	addiw	a4,a5,10
    80006ee4:	02c77e63          	bgeu	a4,a2,80006f20 <__memset+0x1c8>
    80006ee8:	00e50733          	add	a4,a0,a4
    80006eec:	00b70023          	sb	a1,0(a4)
    80006ef0:	00b7871b          	addiw	a4,a5,11
    80006ef4:	02c77663          	bgeu	a4,a2,80006f20 <__memset+0x1c8>
    80006ef8:	00e50733          	add	a4,a0,a4
    80006efc:	00b70023          	sb	a1,0(a4)
    80006f00:	00c7871b          	addiw	a4,a5,12
    80006f04:	00c77e63          	bgeu	a4,a2,80006f20 <__memset+0x1c8>
    80006f08:	00e50733          	add	a4,a0,a4
    80006f0c:	00b70023          	sb	a1,0(a4)
    80006f10:	00d7879b          	addiw	a5,a5,13
    80006f14:	00c7f663          	bgeu	a5,a2,80006f20 <__memset+0x1c8>
    80006f18:	00f507b3          	add	a5,a0,a5
    80006f1c:	00b78023          	sb	a1,0(a5)
    80006f20:	00813403          	ld	s0,8(sp)
    80006f24:	01010113          	addi	sp,sp,16
    80006f28:	00008067          	ret
    80006f2c:	00b00693          	li	a3,11
    80006f30:	e55ff06f          	j	80006d84 <__memset+0x2c>
    80006f34:	00300e93          	li	t4,3
    80006f38:	ea5ff06f          	j	80006ddc <__memset+0x84>
    80006f3c:	00100e93          	li	t4,1
    80006f40:	e9dff06f          	j	80006ddc <__memset+0x84>
    80006f44:	00000e93          	li	t4,0
    80006f48:	e95ff06f          	j	80006ddc <__memset+0x84>
    80006f4c:	00000793          	li	a5,0
    80006f50:	ef9ff06f          	j	80006e48 <__memset+0xf0>
    80006f54:	00200e93          	li	t4,2
    80006f58:	e85ff06f          	j	80006ddc <__memset+0x84>
    80006f5c:	00400e93          	li	t4,4
    80006f60:	e7dff06f          	j	80006ddc <__memset+0x84>
    80006f64:	00500e93          	li	t4,5
    80006f68:	e75ff06f          	j	80006ddc <__memset+0x84>
    80006f6c:	00600e93          	li	t4,6
    80006f70:	e6dff06f          	j	80006ddc <__memset+0x84>

0000000080006f74 <__memmove>:
    80006f74:	ff010113          	addi	sp,sp,-16
    80006f78:	00813423          	sd	s0,8(sp)
    80006f7c:	01010413          	addi	s0,sp,16
    80006f80:	0e060863          	beqz	a2,80007070 <__memmove+0xfc>
    80006f84:	fff6069b          	addiw	a3,a2,-1
    80006f88:	0006881b          	sext.w	a6,a3
    80006f8c:	0ea5e863          	bltu	a1,a0,8000707c <__memmove+0x108>
    80006f90:	00758713          	addi	a4,a1,7
    80006f94:	00a5e7b3          	or	a5,a1,a0
    80006f98:	40a70733          	sub	a4,a4,a0
    80006f9c:	0077f793          	andi	a5,a5,7
    80006fa0:	00f73713          	sltiu	a4,a4,15
    80006fa4:	00174713          	xori	a4,a4,1
    80006fa8:	0017b793          	seqz	a5,a5
    80006fac:	00e7f7b3          	and	a5,a5,a4
    80006fb0:	10078863          	beqz	a5,800070c0 <__memmove+0x14c>
    80006fb4:	00900793          	li	a5,9
    80006fb8:	1107f463          	bgeu	a5,a6,800070c0 <__memmove+0x14c>
    80006fbc:	0036581b          	srliw	a6,a2,0x3
    80006fc0:	fff8081b          	addiw	a6,a6,-1
    80006fc4:	02081813          	slli	a6,a6,0x20
    80006fc8:	01d85893          	srli	a7,a6,0x1d
    80006fcc:	00858813          	addi	a6,a1,8
    80006fd0:	00058793          	mv	a5,a1
    80006fd4:	00050713          	mv	a4,a0
    80006fd8:	01088833          	add	a6,a7,a6
    80006fdc:	0007b883          	ld	a7,0(a5)
    80006fe0:	00878793          	addi	a5,a5,8
    80006fe4:	00870713          	addi	a4,a4,8
    80006fe8:	ff173c23          	sd	a7,-8(a4)
    80006fec:	ff0798e3          	bne	a5,a6,80006fdc <__memmove+0x68>
    80006ff0:	ff867713          	andi	a4,a2,-8
    80006ff4:	02071793          	slli	a5,a4,0x20
    80006ff8:	0207d793          	srli	a5,a5,0x20
    80006ffc:	00f585b3          	add	a1,a1,a5
    80007000:	40e686bb          	subw	a3,a3,a4
    80007004:	00f507b3          	add	a5,a0,a5
    80007008:	06e60463          	beq	a2,a4,80007070 <__memmove+0xfc>
    8000700c:	0005c703          	lbu	a4,0(a1)
    80007010:	00e78023          	sb	a4,0(a5)
    80007014:	04068e63          	beqz	a3,80007070 <__memmove+0xfc>
    80007018:	0015c603          	lbu	a2,1(a1)
    8000701c:	00100713          	li	a4,1
    80007020:	00c780a3          	sb	a2,1(a5)
    80007024:	04e68663          	beq	a3,a4,80007070 <__memmove+0xfc>
    80007028:	0025c603          	lbu	a2,2(a1)
    8000702c:	00200713          	li	a4,2
    80007030:	00c78123          	sb	a2,2(a5)
    80007034:	02e68e63          	beq	a3,a4,80007070 <__memmove+0xfc>
    80007038:	0035c603          	lbu	a2,3(a1)
    8000703c:	00300713          	li	a4,3
    80007040:	00c781a3          	sb	a2,3(a5)
    80007044:	02e68663          	beq	a3,a4,80007070 <__memmove+0xfc>
    80007048:	0045c603          	lbu	a2,4(a1)
    8000704c:	00400713          	li	a4,4
    80007050:	00c78223          	sb	a2,4(a5)
    80007054:	00e68e63          	beq	a3,a4,80007070 <__memmove+0xfc>
    80007058:	0055c603          	lbu	a2,5(a1)
    8000705c:	00500713          	li	a4,5
    80007060:	00c782a3          	sb	a2,5(a5)
    80007064:	00e68663          	beq	a3,a4,80007070 <__memmove+0xfc>
    80007068:	0065c703          	lbu	a4,6(a1)
    8000706c:	00e78323          	sb	a4,6(a5)
    80007070:	00813403          	ld	s0,8(sp)
    80007074:	01010113          	addi	sp,sp,16
    80007078:	00008067          	ret
    8000707c:	02061713          	slli	a4,a2,0x20
    80007080:	02075713          	srli	a4,a4,0x20
    80007084:	00e587b3          	add	a5,a1,a4
    80007088:	f0f574e3          	bgeu	a0,a5,80006f90 <__memmove+0x1c>
    8000708c:	02069613          	slli	a2,a3,0x20
    80007090:	02065613          	srli	a2,a2,0x20
    80007094:	fff64613          	not	a2,a2
    80007098:	00e50733          	add	a4,a0,a4
    8000709c:	00c78633          	add	a2,a5,a2
    800070a0:	fff7c683          	lbu	a3,-1(a5)
    800070a4:	fff78793          	addi	a5,a5,-1
    800070a8:	fff70713          	addi	a4,a4,-1
    800070ac:	00d70023          	sb	a3,0(a4)
    800070b0:	fec798e3          	bne	a5,a2,800070a0 <__memmove+0x12c>
    800070b4:	00813403          	ld	s0,8(sp)
    800070b8:	01010113          	addi	sp,sp,16
    800070bc:	00008067          	ret
    800070c0:	02069713          	slli	a4,a3,0x20
    800070c4:	02075713          	srli	a4,a4,0x20
    800070c8:	00170713          	addi	a4,a4,1
    800070cc:	00e50733          	add	a4,a0,a4
    800070d0:	00050793          	mv	a5,a0
    800070d4:	0005c683          	lbu	a3,0(a1)
    800070d8:	00178793          	addi	a5,a5,1
    800070dc:	00158593          	addi	a1,a1,1
    800070e0:	fed78fa3          	sb	a3,-1(a5)
    800070e4:	fee798e3          	bne	a5,a4,800070d4 <__memmove+0x160>
    800070e8:	f89ff06f          	j	80007070 <__memmove+0xfc>

00000000800070ec <__putc>:
    800070ec:	fe010113          	addi	sp,sp,-32
    800070f0:	00813823          	sd	s0,16(sp)
    800070f4:	00113c23          	sd	ra,24(sp)
    800070f8:	02010413          	addi	s0,sp,32
    800070fc:	00050793          	mv	a5,a0
    80007100:	fef40593          	addi	a1,s0,-17
    80007104:	00100613          	li	a2,1
    80007108:	00000513          	li	a0,0
    8000710c:	fef407a3          	sb	a5,-17(s0)
    80007110:	fffff097          	auipc	ra,0xfffff
    80007114:	b3c080e7          	jalr	-1220(ra) # 80005c4c <console_write>
    80007118:	01813083          	ld	ra,24(sp)
    8000711c:	01013403          	ld	s0,16(sp)
    80007120:	02010113          	addi	sp,sp,32
    80007124:	00008067          	ret

0000000080007128 <__getc>:
    80007128:	fe010113          	addi	sp,sp,-32
    8000712c:	00813823          	sd	s0,16(sp)
    80007130:	00113c23          	sd	ra,24(sp)
    80007134:	02010413          	addi	s0,sp,32
    80007138:	fe840593          	addi	a1,s0,-24
    8000713c:	00100613          	li	a2,1
    80007140:	00000513          	li	a0,0
    80007144:	fffff097          	auipc	ra,0xfffff
    80007148:	ae8080e7          	jalr	-1304(ra) # 80005c2c <console_read>
    8000714c:	fe844503          	lbu	a0,-24(s0)
    80007150:	01813083          	ld	ra,24(sp)
    80007154:	01013403          	ld	s0,16(sp)
    80007158:	02010113          	addi	sp,sp,32
    8000715c:	00008067          	ret

0000000080007160 <console_handler>:
    80007160:	fe010113          	addi	sp,sp,-32
    80007164:	00813823          	sd	s0,16(sp)
    80007168:	00113c23          	sd	ra,24(sp)
    8000716c:	00913423          	sd	s1,8(sp)
    80007170:	02010413          	addi	s0,sp,32
    80007174:	14202773          	csrr	a4,scause
    80007178:	100027f3          	csrr	a5,sstatus
    8000717c:	0027f793          	andi	a5,a5,2
    80007180:	06079e63          	bnez	a5,800071fc <console_handler+0x9c>
    80007184:	00074c63          	bltz	a4,8000719c <console_handler+0x3c>
    80007188:	01813083          	ld	ra,24(sp)
    8000718c:	01013403          	ld	s0,16(sp)
    80007190:	00813483          	ld	s1,8(sp)
    80007194:	02010113          	addi	sp,sp,32
    80007198:	00008067          	ret
    8000719c:	0ff77713          	andi	a4,a4,255
    800071a0:	00900793          	li	a5,9
    800071a4:	fef712e3          	bne	a4,a5,80007188 <console_handler+0x28>
    800071a8:	ffffe097          	auipc	ra,0xffffe
    800071ac:	6dc080e7          	jalr	1756(ra) # 80005884 <plic_claim>
    800071b0:	00a00793          	li	a5,10
    800071b4:	00050493          	mv	s1,a0
    800071b8:	02f50c63          	beq	a0,a5,800071f0 <console_handler+0x90>
    800071bc:	fc0506e3          	beqz	a0,80007188 <console_handler+0x28>
    800071c0:	00050593          	mv	a1,a0
    800071c4:	00001517          	auipc	a0,0x1
    800071c8:	3ec50513          	addi	a0,a0,1004 # 800085b0 <_ZL6digits+0xe8>
    800071cc:	fffff097          	auipc	ra,0xfffff
    800071d0:	afc080e7          	jalr	-1284(ra) # 80005cc8 <__printf>
    800071d4:	01013403          	ld	s0,16(sp)
    800071d8:	01813083          	ld	ra,24(sp)
    800071dc:	00048513          	mv	a0,s1
    800071e0:	00813483          	ld	s1,8(sp)
    800071e4:	02010113          	addi	sp,sp,32
    800071e8:	ffffe317          	auipc	t1,0xffffe
    800071ec:	6d430067          	jr	1748(t1) # 800058bc <plic_complete>
    800071f0:	fffff097          	auipc	ra,0xfffff
    800071f4:	3e0080e7          	jalr	992(ra) # 800065d0 <uartintr>
    800071f8:	fddff06f          	j	800071d4 <console_handler+0x74>
    800071fc:	00001517          	auipc	a0,0x1
    80007200:	4b450513          	addi	a0,a0,1204 # 800086b0 <digits+0x78>
    80007204:	fffff097          	auipc	ra,0xfffff
    80007208:	a68080e7          	jalr	-1432(ra) # 80005c6c <panic>
	...
