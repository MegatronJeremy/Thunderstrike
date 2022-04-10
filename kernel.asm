
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000a117          	auipc	sp,0xa
    80000004:	df813103          	ld	sp,-520(sp) # 80009df8 <_GLOBAL_OFFSET_TABLE_+0x20>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	7a9040ef          	jal	ra,80004fc4 <start>

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
    80001030:	e3c53503          	ld	a0,-452(a0) # 80009e68 <_ZN3TCB7runningE>
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
    800010c8:	799000ef          	jal	ra,80002060 <_ZN5Riscv20handleSupervisorTrapEv>

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
    80001160:	d0c53503          	ld	a0,-756(a0) # 80009e68 <_ZN3TCB7runningE>
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
    800011c8:	cf0080e7          	jalr	-784(ra) # 80001eb4 <_Z7kmallocm>
    800011cc:	00050493          	mv	s1,a0
    idleThread = new TCB([](void *){IdleThread::getInstance()->run();}, nullptr, DEFAULT_TIME_SLICE);
    800011d0:	00000713          	li	a4,0
    800011d4:	00200693          	li	a3,2
    800011d8:	00000613          	li	a2,0
    800011dc:	00000597          	auipc	a1,0x0
    800011e0:	0ec58593          	addi	a1,a1,236 # 800012c8 <_ZZN10IdleThreadC4EvENUlPvE_4_FUNES0_>
    800011e4:	00002097          	auipc	ra,0x2
    800011e8:	804080e7          	jalr	-2044(ra) # 800029e8 <_ZN3TCBC1EPFvPvES0_mb>
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
    8000121c:	cdc080e7          	jalr	-804(ra) # 80001ef4 <_Z5kfreePv>
    80001220:	00090513          	mv	a0,s2
    80001224:	0000a097          	auipc	ra,0xa
    80001228:	d54080e7          	jalr	-684(ra) # 8000af78 <_Unwind_Resume>

000000008000122c <_ZN10IdleThread11getInstanceEv>:
    if (!instance) instance = new IdleThread;
    8000122c:	00009797          	auipc	a5,0x9
    80001230:	c247b783          	ld	a5,-988(a5) # 80009e50 <_ZN10IdleThread8instanceE>
    80001234:	00078863          	beqz	a5,80001244 <_ZN10IdleThread11getInstanceEv+0x18>
    return instance;
    80001238:	00009517          	auipc	a0,0x9
    8000123c:	c1853503          	ld	a0,-1000(a0) # 80009e50 <_ZN10IdleThread8instanceE>
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
    80001264:	c54080e7          	jalr	-940(ra) # 80001eb4 <_Z7kmallocm>
    80001268:	00050493          	mv	s1,a0
    if (!instance) instance = new IdleThread;
    8000126c:	00000097          	auipc	ra,0x0
    80001270:	f34080e7          	jalr	-204(ra) # 800011a0 <_ZN10IdleThreadC1Ev>
    80001274:	00009797          	auipc	a5,0x9
    80001278:	bc97be23          	sd	s1,-1060(a5) # 80009e50 <_ZN10IdleThread8instanceE>
    return instance;
    8000127c:	00009517          	auipc	a0,0x9
    80001280:	bd453503          	ld	a0,-1068(a0) # 80009e50 <_ZN10IdleThread8instanceE>
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
    800012a8:	c50080e7          	jalr	-944(ra) # 80001ef4 <_Z5kfreePv>
    800012ac:	00090513          	mv	a0,s2
    800012b0:	0000a097          	auipc	ra,0xa
    800012b4:	cc8080e7          	jalr	-824(ra) # 8000af78 <_Unwind_Resume>

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
    8000130c:	afc080e7          	jalr	-1284(ra) # 80002e04 <_ZN3TCBD1Ev>
    80001310:	00048513          	mv	a0,s1
    80001314:	00001097          	auipc	ra,0x1
    80001318:	be0080e7          	jalr	-1056(ra) # 80001ef4 <_Z5kfreePv>
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
    80001370:	b48080e7          	jalr	-1208(ra) # 80001eb4 <_Z7kmallocm>
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
    80001398:	b60080e7          	jalr	-1184(ra) # 80001ef4 <_Z5kfreePv>
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
    800013ec:	740080e7          	jalr	1856(ra) # 80002b28 <_ZN3TCB12createThreadEPFvPvES0_>
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
    80001410:	88c080e7          	jalr	-1908(ra) # 80002c98 <_ZN3TCB4exitEv>
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
    8000143c:	79c080e7          	jalr	1948(ra) # 80002bd4 <_ZN3TCB8dispatchEv>
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
    80001498:	a20080e7          	jalr	-1504(ra) # 80001eb4 <_Z7kmallocm>

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
    800014f8:	a00080e7          	jalr	-1536(ra) # 80001ef4 <_Z5kfreePv>
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
    800015d4:	8307b783          	ld	a5,-2000(a5) # 80009e00 <_GLOBAL_OFFSET_TABLE_+0x28>
    800015d8:	0007b503          	ld	a0,0(a5)
    800015dc:	00002097          	auipc	ra,0x2
    800015e0:	ed8080e7          	jalr	-296(ra) # 800034b4 <_ZN14TimerInterrupt5blockEP3TCBm>
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
    8000160c:	ac0080e7          	jalr	-1344(ra) # 800070c8 <__getc>
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
    80001634:	a5c080e7          	jalr	-1444(ra) # 8000708c <__putc>
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
    80001664:	7a07b783          	ld	a5,1952(a5) # 80009e00 <_GLOBAL_OFFSET_TABLE_+0x28>
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
    80001798:	074080e7          	jalr	116(ra) # 80002808 <_Z12kprintStringPKc>
            kprintUnsigned(code);
    8000179c:	00090513          	mv	a0,s2
    800017a0:	00001097          	auipc	ra,0x1
    800017a4:	16c080e7          	jalr	364(ra) # 8000290c <_Z14kprintUnsignedm>
            kprintString("\n");
    800017a8:	00007517          	auipc	a0,0x7
    800017ac:	9e050513          	addi	a0,a0,-1568 # 80008188 <CONSOLE_STATUS+0x178>
    800017b0:	00001097          	auipc	ra,0x1
    800017b4:	058080e7          	jalr	88(ra) # 80002808 <_Z12kprintStringPKc>
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
    800017d4:	6304b483          	ld	s1,1584(s1) # 80009e00 <_GLOBAL_OFFSET_TABLE_+0x28>
    800017d8:	0004b583          	ld	a1,0(s1)
    800017dc:	0a058593          	addi	a1,a1,160
    800017e0:	00850513          	addi	a0,a0,8
    800017e4:	00002097          	auipc	ra,0x2
    800017e8:	a50080e7          	jalr	-1456(ra) # 80003234 <_ZN10ThreadList7addLastEP10ThreadNode>
    // setjmp
    TCB::running->setBlocked();
    800017ec:	0004b783          	ld	a5,0(s1)
        status = BLOCKED;
    800017f0:	00200713          	li	a4,2
    800017f4:	04e7a023          	sw	a4,64(a5)
    TCB::dispatch();
    800017f8:	00001097          	auipc	ra,0x1
    800017fc:	3dc080e7          	jalr	988(ra) # 80002bd4 <_ZN3TCB8dispatchEv>
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
    80001838:	a44080e7          	jalr	-1468(ra) # 80003278 <_ZN10ThreadList11removeFirstEv>
        status = READY;
    8000183c:	04052023          	sw	zero,64(a0)
//    if (!tcb) {
//        kprintString("Queue empty!\n");
//        return;
//    }
    tcb->setReady();
    Scheduler::put(tcb);
    80001840:	00001097          	auipc	ra,0x1
    80001844:	b28080e7          	jalr	-1240(ra) # 80002368 <_ZN9Scheduler3putEP3TCB>
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
    80001970:	ab0080e7          	jalr	-1360(ra) # 8000341c <_ZN10ThreadListD1Ev>
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
    8000199c:	454080e7          	jalr	1108(ra) # 80004dec <_Z8userMainv>
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
    800019c0:	01213023          	sd	s2,0(sp)
    800019c4:	02010413          	addi	s0,sp,32
    kprintString("Starting main\n");
    800019c8:	00006517          	auipc	a0,0x6
    800019cc:	78050513          	addi	a0,a0,1920 # 80008148 <CONSOLE_STATUS+0x138>
    800019d0:	00001097          	auipc	ra,0x1
    800019d4:	e38080e7          	jalr	-456(ra) # 80002808 <_Z12kprintStringPKc>
    TCB *main = TCB::createThread(nullptr, nullptr);
    800019d8:	00000593          	li	a1,0
    800019dc:	00000513          	li	a0,0
    800019e0:	00001097          	auipc	ra,0x1
    800019e4:	148080e7          	jalr	328(ra) # 80002b28 <_ZN3TCB12createThreadEPFvPvES0_>
    800019e8:	00050493          	mv	s1,a0
    kprintString("Created main thread\n");
    800019ec:	00006517          	auipc	a0,0x6
    800019f0:	76c50513          	addi	a0,a0,1900 # 80008158 <CONSOLE_STATUS+0x148>
    800019f4:	00001097          	auipc	ra,0x1
    800019f8:	e14080e7          	jalr	-492(ra) # 80002808 <_Z12kprintStringPKc>
    TCB::running = main;
    800019fc:	00008797          	auipc	a5,0x8
    80001a00:	4047b783          	ld	a5,1028(a5) # 80009e00 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001a04:	0097b023          	sd	s1,0(a5)
    TCB *uMain = TCB::createThread([](void *){userMain();}, nullptr);
    80001a08:	00000593          	li	a1,0
    80001a0c:	00000517          	auipc	a0,0x0
    80001a10:	f7c50513          	addi	a0,a0,-132 # 80001988 <_ZZ4mainENUlPvE_4_FUNES_>
    80001a14:	00001097          	auipc	ra,0x1
    80001a18:	114080e7          	jalr	276(ra) # 80002b28 <_ZN3TCB12createThreadEPFvPvES0_>
    80001a1c:	00050493          	mv	s1,a0
    kprintString("Created user main thread\n");
    80001a20:	00006517          	auipc	a0,0x6
    80001a24:	75050513          	addi	a0,a0,1872 # 80008170 <CONSOLE_STATUS+0x160>
    80001a28:	00001097          	auipc	ra,0x1
    80001a2c:	de0080e7          	jalr	-544(ra) # 80002808 <_Z12kprintStringPKc>

    Riscv::w_stvec((uint64) &Riscv::supervisorTrap);
    80001a30:	00008797          	auipc	a5,0x8
    80001a34:	3b87b783          	ld	a5,952(a5) # 80009de8 <_GLOBAL_OFFSET_TABLE_+0x10>
    __asm__ volatile ("csrw stvec, %[stvec]" : : [stvec] "r"(stvec));
    80001a38:	10579073          	csrw	stvec,a5
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80001a3c:	00200913          	li	s2,2
    80001a40:	10092073          	csrs	sstatus,s2

    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    uMain->join();
    80001a44:	00048513          	mv	a0,s1
    80001a48:	00001097          	auipc	ra,0x1
    80001a4c:	32c080e7          	jalr	812(ra) # 80002d74 <_ZN3TCB4joinEv>
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80001a50:	10093073          	csrc	sstatus,s2

    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);

    delete ThreadCollector::getInstance();
    80001a54:	00001097          	auipc	ra,0x1
    80001a58:	5cc080e7          	jalr	1484(ra) # 80003020 <_ZN15ThreadCollector11getInstanceEv>
    80001a5c:	00050e63          	beqz	a0,80001a78 <main+0xc8>
    80001a60:	00050493          	mv	s1,a0
    80001a64:	00001097          	auipc	ra,0x1
    80001a68:	510080e7          	jalr	1296(ra) # 80002f74 <_ZN15ThreadCollectorD1Ev>
    80001a6c:	00048513          	mv	a0,s1
    80001a70:	00000097          	auipc	ra,0x0
    80001a74:	484080e7          	jalr	1156(ra) # 80001ef4 <_Z5kfreePv>
    delete IdleThread::getInstance();
    80001a78:	fffff097          	auipc	ra,0xfffff
    80001a7c:	7b4080e7          	jalr	1972(ra) # 8000122c <_ZN10IdleThread11getInstanceEv>
    80001a80:	00050493          	mv	s1,a0
    80001a84:	00050c63          	beqz	a0,80001a9c <main+0xec>
    80001a88:	00000097          	auipc	ra,0x0
    80001a8c:	860080e7          	jalr	-1952(ra) # 800012e8 <_ZN10IdleThreadD1Ev>
    80001a90:	00048513          	mv	a0,s1
    80001a94:	00000097          	auipc	ra,0x0
    80001a98:	460080e7          	jalr	1120(ra) # 80001ef4 <_Z5kfreePv>
    delete TimerInterrupt::getInstance();
    80001a9c:	00002097          	auipc	ra,0x2
    80001aa0:	998080e7          	jalr	-1640(ra) # 80003434 <_ZN14TimerInterrupt11getInstanceEv>
    80001aa4:	00050493          	mv	s1,a0
    80001aa8:	00050c63          	beqz	a0,80001ac0 <main+0x110>
    80001aac:	00002097          	auipc	ra,0x2
    80001ab0:	bd4080e7          	jalr	-1068(ra) # 80003680 <_ZN14TimerInterruptD1Ev>
    80001ab4:	00048513          	mv	a0,s1
    80001ab8:	00000097          	auipc	ra,0x0
    80001abc:	43c080e7          	jalr	1084(ra) # 80001ef4 <_Z5kfreePv>
    delete Scheduler::getInstance();
    80001ac0:	00000097          	auipc	ra,0x0
    80001ac4:	7bc080e7          	jalr	1980(ra) # 8000227c <_ZN9Scheduler11getInstanceEv>
    80001ac8:	00050493          	mv	s1,a0
    80001acc:	00050c63          	beqz	a0,80001ae4 <main+0x134>
    80001ad0:	00001097          	auipc	ra,0x1
    80001ad4:	904080e7          	jalr	-1788(ra) # 800023d4 <_ZN9SchedulerD1Ev>
    80001ad8:	00048513          	mv	a0,s1
    80001adc:	00000097          	auipc	ra,0x0
    80001ae0:	418080e7          	jalr	1048(ra) # 80001ef4 <_Z5kfreePv>

    kprintString("Main finished\n");
    80001ae4:	00006517          	auipc	a0,0x6
    80001ae8:	6ac50513          	addi	a0,a0,1708 # 80008190 <CONSOLE_STATUS+0x180>
    80001aec:	00001097          	auipc	ra,0x1
    80001af0:	d1c080e7          	jalr	-740(ra) # 80002808 <_Z12kprintStringPKc>

    return 0;
}
    80001af4:	00000513          	li	a0,0
    80001af8:	01813083          	ld	ra,24(sp)
    80001afc:	01013403          	ld	s0,16(sp)
    80001b00:	00813483          	ld	s1,8(sp)
    80001b04:	00013903          	ld	s2,0(sp)
    80001b08:	02010113          	addi	sp,sp,32
    80001b0c:	00008067          	ret

0000000080001b10 <_ZN15MemoryAllocator19initMemoryAllocatorEv>:
#include "../h/SysPrint.h"
#include "../h/Mutex.h"

MemoryAllocator *MemoryAllocator::instance = nullptr;

void MemoryAllocator::initMemoryAllocator() {
    80001b10:	ff010113          	addi	sp,sp,-16
    80001b14:	00813423          	sd	s0,8(sp)
    80001b18:	01010413          	addi	s0,sp,16
    instance = (MemoryAllocator *) HEAP_START_ADDR;
    80001b1c:	00008617          	auipc	a2,0x8
    80001b20:	2c463603          	ld	a2,708(a2) # 80009de0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001b24:	00063783          	ld	a5,0(a2)
    80001b28:	00008717          	auipc	a4,0x8
    80001b2c:	33070713          	addi	a4,a4,816 # 80009e58 <_ZN15MemoryAllocator8instanceE>
    80001b30:	00f73023          	sd	a5,0(a4)

    instance->mutex = (Mutex *) ((uint8 *) HEAP_START_ADDR + sizeof(MemoryAllocator));
    80001b34:	01078693          	addi	a3,a5,16
    80001b38:	00d7b423          	sd	a3,8(a5)
    instance->mutex->val = 1;
    80001b3c:	00100693          	li	a3,1
    80001b40:	00d7a823          	sw	a3,16(a5)
    instance->freeMemHead = (BlockHeader *) ((uint8 *) HEAP_START_ADDR + sizeof(MemoryAllocator) + sizeof(Mutex));
    80001b44:	04078593          	addi	a1,a5,64
    80001b48:	00b7b023          	sd	a1,0(a5)
    instance->freeMemHead->size = (size_t) ((uint8 *) HEAP_END_ADDR - (uint8 *) HEAP_START_ADDR -
    80001b4c:	00008797          	auipc	a5,0x8
    80001b50:	2bc7b783          	ld	a5,700(a5) # 80009e08 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001b54:	0007b783          	ld	a5,0(a5)
    80001b58:	00063603          	ld	a2,0(a2)
    80001b5c:	40c787b3          	sub	a5,a5,a2
    80001b60:	00073603          	ld	a2,0(a4)
    80001b64:	00063603          	ld	a2,0(a2)
                                  sizeof(MemoryAllocator) - sizeof(BlockHeader) - sizeof(Mutex));
    80001b68:	fa878793          	addi	a5,a5,-88
    instance->freeMemHead->size = (size_t) ((uint8 *) HEAP_END_ADDR - (uint8 *) HEAP_START_ADDR -
    80001b6c:	00f63023          	sd	a5,0(a2)
    instance->freeMemHead->free = true;
    80001b70:	00073783          	ld	a5,0(a4)
    80001b74:	0007b703          	ld	a4,0(a5)
    80001b78:	00d70423          	sb	a3,8(a4)
    instance->freeMemHead->next = nullptr;
    80001b7c:	0007b783          	ld	a5,0(a5)
    80001b80:	0007b823          	sd	zero,16(a5)

//    kprintString("Initializing memory allocator: ");
//    kprintUnsigned(instance->freeMemHead->size);
//    kprintString("\n");

}
    80001b84:	00813403          	ld	s0,8(sp)
    80001b88:	01010113          	addi	sp,sp,16
    80001b8c:	00008067          	ret

0000000080001b90 <_ZN15MemoryAllocator11getInstanceEv>:

MemoryAllocator *MemoryAllocator::getInstance() {
    if (!instance) initMemoryAllocator();
    80001b90:	00008797          	auipc	a5,0x8
    80001b94:	2c87b783          	ld	a5,712(a5) # 80009e58 <_ZN15MemoryAllocator8instanceE>
    80001b98:	00078863          	beqz	a5,80001ba8 <_ZN15MemoryAllocator11getInstanceEv+0x18>

    return instance;
}
    80001b9c:	00008517          	auipc	a0,0x8
    80001ba0:	2bc53503          	ld	a0,700(a0) # 80009e58 <_ZN15MemoryAllocator8instanceE>
    80001ba4:	00008067          	ret
MemoryAllocator *MemoryAllocator::getInstance() {
    80001ba8:	ff010113          	addi	sp,sp,-16
    80001bac:	00113423          	sd	ra,8(sp)
    80001bb0:	00813023          	sd	s0,0(sp)
    80001bb4:	01010413          	addi	s0,sp,16
    if (!instance) initMemoryAllocator();
    80001bb8:	00000097          	auipc	ra,0x0
    80001bbc:	f58080e7          	jalr	-168(ra) # 80001b10 <_ZN15MemoryAllocator19initMemoryAllocatorEv>
}
    80001bc0:	00008517          	auipc	a0,0x8
    80001bc4:	29853503          	ld	a0,664(a0) # 80009e58 <_ZN15MemoryAllocator8instanceE>
    80001bc8:	00813083          	ld	ra,8(sp)
    80001bcc:	00013403          	ld	s0,0(sp)
    80001bd0:	01010113          	addi	sp,sp,16
    80001bd4:	00008067          	ret

0000000080001bd8 <_ZN15MemoryAllocator6mallocEm>:

void *MemoryAllocator::malloc(size_t size) {
    80001bd8:	fd010113          	addi	sp,sp,-48
    80001bdc:	02113423          	sd	ra,40(sp)
    80001be0:	02813023          	sd	s0,32(sp)
    80001be4:	00913c23          	sd	s1,24(sp)
    80001be8:	01213823          	sd	s2,16(sp)
    80001bec:	01313423          	sd	s3,8(sp)
    80001bf0:	03010413          	addi	s0,sp,48
    // Initial check
    if (!size) return 0;
    80001bf4:	0e058e63          	beqz	a1,80001cf0 <_ZN15MemoryAllocator6mallocEm+0x118>
    80001bf8:	00050993          	mv	s3,a0

    // Rounding and aligning size to size of memory blocks
    size = ((size - 1) / MEM_BLOCK_SIZE + 1) * MEM_BLOCK_SIZE;
    80001bfc:	fff58913          	addi	s2,a1,-1
    80001c00:	00695913          	srli	s2,s2,0x6
    80001c04:	00190913          	addi	s2,s2,1
    80001c08:	00691913          	slli	s2,s2,0x6

    mutex->wait();
    80001c0c:	00853503          	ld	a0,8(a0)
    80001c10:	00000097          	auipc	ra,0x0
    80001c14:	324080e7          	jalr	804(ra) # 80001f34 <_ZN5Mutex4waitEv>
    // Finding suitable free memory block using first fit algorithm
    BlockHeader *curr = freeMemHead, *prev = nullptr;
    80001c18:	0009b483          	ld	s1,0(s3)
    80001c1c:	00000713          	li	a4,0
    int i = 0;
    while (curr && curr->size < size)
    80001c20:	00048c63          	beqz	s1,80001c38 <_ZN15MemoryAllocator6mallocEm+0x60>
    80001c24:	0004b783          	ld	a5,0(s1)
    80001c28:	0127f863          	bgeu	a5,s2,80001c38 <_ZN15MemoryAllocator6mallocEm+0x60>
        prev = curr, curr = curr->next, i++;
    80001c2c:	00048713          	mv	a4,s1
    80001c30:	0104b483          	ld	s1,16(s1)
    while (curr && curr->size < size)
    80001c34:	fedff06f          	j	80001c20 <_ZN15MemoryAllocator6mallocEm+0x48>
    if (!curr)  {
    80001c38:	04048463          	beqz	s1,80001c80 <_ZN15MemoryAllocator6mallocEm+0xa8>
//        kprintString("Failed allocation\n");
        mutex->signal();
        return nullptr;
    }

    size_t remainingSize = curr->size - size;
    80001c3c:	0004b783          	ld	a5,0(s1)
    80001c40:	412787b3          	sub	a5,a5,s2
    curr->size = size;
    80001c44:	0124b023          	sd	s2,0(s1)
    curr->free = false;
    80001c48:	00048423          	sb	zero,8(s1)
    // Allocating new free memory block if enough size is left over
    if (remainingSize >= MEM_BLOCK_SIZE + sizeof(BlockHeader)) {
    80001c4c:	05700693          	li	a3,87
    80001c50:	04f6f463          	bgeu	a3,a5,80001c98 <_ZN15MemoryAllocator6mallocEm+0xc0>
        BlockHeader *elem = (BlockHeader *) ((uint8 *) curr + sizeof(BlockHeader) + size);
    80001c54:	01890913          	addi	s2,s2,24
    80001c58:	01248933          	add	s2,s1,s2
        elem->size = remainingSize - sizeof(BlockHeader);
    80001c5c:	fe878793          	addi	a5,a5,-24
    80001c60:	00f93023          	sd	a5,0(s2)
        elem->free = true;
    80001c64:	00100793          	li	a5,1
    80001c68:	00f90423          	sb	a5,8(s2)
        elem->next = curr->next;
    80001c6c:	0104b783          	ld	a5,16(s1)
    80001c70:	00f93823          	sd	a5,16(s2)
        (!prev ? freeMemHead : prev->next) = elem;
    80001c74:	00070e63          	beqz	a4,80001c90 <_ZN15MemoryAllocator6mallocEm+0xb8>
    80001c78:	01273823          	sd	s2,16(a4)
    80001c7c:	0340006f          	j	80001cb0 <_ZN15MemoryAllocator6mallocEm+0xd8>
        mutex->signal();
    80001c80:	0089b503          	ld	a0,8(s3)
    80001c84:	00000097          	auipc	ra,0x0
    80001c88:	324080e7          	jalr	804(ra) # 80001fa8 <_ZN5Mutex6signalEv>
        return nullptr;
    80001c8c:	0380006f          	j	80001cc4 <_ZN15MemoryAllocator6mallocEm+0xec>
        (!prev ? freeMemHead : prev->next) = elem;
    80001c90:	0129b023          	sd	s2,0(s3)
    80001c94:	01c0006f          	j	80001cb0 <_ZN15MemoryAllocator6mallocEm+0xd8>
    } else {
        // Removing whole free memory block from free memory list
        (!prev ? freeMemHead : prev->next) = curr->next;
    80001c98:	04070663          	beqz	a4,80001ce4 <_ZN15MemoryAllocator6mallocEm+0x10c>
    80001c9c:	0104b683          	ld	a3,16(s1)
    80001ca0:	00d73823          	sd	a3,16(a4)
        curr->size += remainingSize;
    80001ca4:	0004b703          	ld	a4,0(s1)
    80001ca8:	00f707b3          	add	a5,a4,a5
    80001cac:	00f4b023          	sd	a5,0(s1)
    }
    curr->next = nullptr;
    80001cb0:	0004b823          	sd	zero,16(s1)

    // Free memory start address after segment descriptor of allocated memory block
    void *addr = (uint8 *) curr + sizeof(BlockHeader);
    80001cb4:	01848493          	addi	s1,s1,24
//
//    (!prev ? allocMemHead : prev->next) = curr;
//    curr->next = next;
    //

    mutex->signal();
    80001cb8:	0089b503          	ld	a0,8(s3)
    80001cbc:	00000097          	auipc	ra,0x0
    80001cc0:	2ec080e7          	jalr	748(ra) # 80001fa8 <_ZN5Mutex6signalEv>

    return addr;
}
    80001cc4:	00048513          	mv	a0,s1
    80001cc8:	02813083          	ld	ra,40(sp)
    80001ccc:	02013403          	ld	s0,32(sp)
    80001cd0:	01813483          	ld	s1,24(sp)
    80001cd4:	01013903          	ld	s2,16(sp)
    80001cd8:	00813983          	ld	s3,8(sp)
    80001cdc:	03010113          	addi	sp,sp,48
    80001ce0:	00008067          	ret
        (!prev ? freeMemHead : prev->next) = curr->next;
    80001ce4:	0104b703          	ld	a4,16(s1)
    80001ce8:	00e9b023          	sd	a4,0(s3)
    80001cec:	fb9ff06f          	j	80001ca4 <_ZN15MemoryAllocator6mallocEm+0xcc>
    if (!size) return 0;
    80001cf0:	00000493          	li	s1,0
    80001cf4:	fd1ff06f          	j	80001cc4 <_ZN15MemoryAllocator6mallocEm+0xec>

0000000080001cf8 <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE>:
    mutex->signal();

    return 0;
}

int MemoryAllocator::tryToJoin(MemoryAllocator::BlockHeader *curr) {
    80001cf8:	ff010113          	addi	sp,sp,-16
    80001cfc:	00813423          	sd	s0,8(sp)
    80001d00:	01010413          	addi	s0,sp,16
    if (!curr || !curr->next) return -1;
    80001d04:	04050263          	beqz	a0,80001d48 <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE+0x50>
    80001d08:	01053703          	ld	a4,16(a0)
    80001d0c:	04070263          	beqz	a4,80001d50 <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE+0x58>

    if ((uint8 *) curr + sizeof(BlockHeader) + curr->size != (uint8 *) curr->next) return -2;
    80001d10:	00053783          	ld	a5,0(a0)
    80001d14:	01878693          	addi	a3,a5,24
    80001d18:	00d506b3          	add	a3,a0,a3
    80001d1c:	02d71e63          	bne	a4,a3,80001d58 <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE+0x60>

    curr->size += curr->next->size + sizeof(BlockHeader);
    80001d20:	00073683          	ld	a3,0(a4)
    80001d24:	00d787b3          	add	a5,a5,a3
    80001d28:	01878793          	addi	a5,a5,24
    80001d2c:	00f53023          	sd	a5,0(a0)
    curr->next = curr->next->next;
    80001d30:	01073783          	ld	a5,16(a4)
    80001d34:	00f53823          	sd	a5,16(a0)

    return 0;
    80001d38:	00000513          	li	a0,0
}
    80001d3c:	00813403          	ld	s0,8(sp)
    80001d40:	01010113          	addi	sp,sp,16
    80001d44:	00008067          	ret
    if (!curr || !curr->next) return -1;
    80001d48:	fff00513          	li	a0,-1
    80001d4c:	ff1ff06f          	j	80001d3c <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE+0x44>
    80001d50:	fff00513          	li	a0,-1
    80001d54:	fe9ff06f          	j	80001d3c <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE+0x44>
    if ((uint8 *) curr + sizeof(BlockHeader) + curr->size != (uint8 *) curr->next) return -2;
    80001d58:	ffe00513          	li	a0,-2
    80001d5c:	fe1ff06f          	j	80001d3c <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE+0x44>

0000000080001d60 <_ZN15MemoryAllocator4freeEPv>:
    if (!addr
    80001d60:	10058a63          	beqz	a1,80001e74 <_ZN15MemoryAllocator4freeEPv+0x114>
int MemoryAllocator::free(void *addr) {
    80001d64:	fd010113          	addi	sp,sp,-48
    80001d68:	02113423          	sd	ra,40(sp)
    80001d6c:	02813023          	sd	s0,32(sp)
    80001d70:	00913c23          	sd	s1,24(sp)
    80001d74:	01213823          	sd	s2,16(sp)
    80001d78:	01313423          	sd	s3,8(sp)
    80001d7c:	01413023          	sd	s4,0(sp)
    80001d80:	03010413          	addi	s0,sp,48
    80001d84:	00050a13          	mv	s4,a0
    80001d88:	00058913          	mv	s2,a1
        || (uint8 *) addr < (uint8 *) HEAP_START_ADDR + sizeof(MemoryAllocator) + sizeof(BlockHeader) + sizeof(Mutex)
    80001d8c:	00008797          	auipc	a5,0x8
    80001d90:	0547b783          	ld	a5,84(a5) # 80009de0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001d94:	0007b783          	ld	a5,0(a5)
    80001d98:	05878793          	addi	a5,a5,88
    80001d9c:	0ef5e063          	bltu	a1,a5,80001e7c <_ZN15MemoryAllocator4freeEPv+0x11c>
        || addr >= HEAP_END_ADDR) {
    80001da0:	00008797          	auipc	a5,0x8
    80001da4:	0687b783          	ld	a5,104(a5) # 80009e08 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001da8:	0007b783          	ld	a5,0(a5)
    80001dac:	0cf5fc63          	bgeu	a1,a5,80001e84 <_ZN15MemoryAllocator4freeEPv+0x124>
    BlockHeader *elem = (BlockHeader *) ((uint8 *) addr - sizeof(BlockHeader));
    80001db0:	fe858993          	addi	s3,a1,-24
    if (!elem || elem->free || elem->next) {
    80001db4:	0c098c63          	beqz	s3,80001e8c <_ZN15MemoryAllocator4freeEPv+0x12c>
    80001db8:	ff05c783          	lbu	a5,-16(a1)
    80001dbc:	0c079c63          	bnez	a5,80001e94 <_ZN15MemoryAllocator4freeEPv+0x134>
    80001dc0:	ff85b483          	ld	s1,-8(a1)
    80001dc4:	0c049c63          	bnez	s1,80001e9c <_ZN15MemoryAllocator4freeEPv+0x13c>
    mutex->wait();
    80001dc8:	00853503          	ld	a0,8(a0)
    80001dcc:	00000097          	auipc	ra,0x0
    80001dd0:	168080e7          	jalr	360(ra) # 80001f34 <_ZN5Mutex4waitEv>
    BlockHeader *curr = freeMemHead, *prev = nullptr;
    80001dd4:	000a3783          	ld	a5,0(s4)
    while (curr && curr < elem)
    80001dd8:	00078a63          	beqz	a5,80001dec <_ZN15MemoryAllocator4freeEPv+0x8c>
    80001ddc:	0137f863          	bgeu	a5,s3,80001dec <_ZN15MemoryAllocator4freeEPv+0x8c>
        prev = curr, curr = curr->next;
    80001de0:	00078493          	mv	s1,a5
    80001de4:	0107b783          	ld	a5,16(a5)
    while (curr && curr < elem)
    80001de8:	ff1ff06f          	j	80001dd8 <_ZN15MemoryAllocator4freeEPv+0x78>
    if ((prev && (uint8 *) prev + prev->size + sizeof(BlockHeader) > addr)
    80001dec:	00048a63          	beqz	s1,80001e00 <_ZN15MemoryAllocator4freeEPv+0xa0>
    80001df0:	0004b703          	ld	a4,0(s1)
    80001df4:	01870713          	addi	a4,a4,24
    80001df8:	00e48733          	add	a4,s1,a4
    80001dfc:	0ae96463          	bltu	s2,a4,80001ea4 <_ZN15MemoryAllocator4freeEPv+0x144>
        || (curr && (uint8 *) addr + elem->size  > (uint8 *) curr)) {
    80001e00:	00078863          	beqz	a5,80001e10 <_ZN15MemoryAllocator4freeEPv+0xb0>
    80001e04:	fe893703          	ld	a4,-24(s2)
    80001e08:	00e90733          	add	a4,s2,a4
    80001e0c:	0ae7e063          	bltu	a5,a4,80001eac <_ZN15MemoryAllocator4freeEPv+0x14c>
    elem->next = curr;
    80001e10:	fef93c23          	sd	a5,-8(s2)
    elem->free = true;
    80001e14:	00100793          	li	a5,1
    80001e18:	fef90823          	sb	a5,-16(s2)
    (!prev ? freeMemHead : prev->next) = elem;
    80001e1c:	04048863          	beqz	s1,80001e6c <_ZN15MemoryAllocator4freeEPv+0x10c>
    80001e20:	0134b823          	sd	s3,16(s1)
    tryToJoin(elem);
    80001e24:	00098513          	mv	a0,s3
    80001e28:	00000097          	auipc	ra,0x0
    80001e2c:	ed0080e7          	jalr	-304(ra) # 80001cf8 <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE>
    tryToJoin(prev);
    80001e30:	00048513          	mv	a0,s1
    80001e34:	00000097          	auipc	ra,0x0
    80001e38:	ec4080e7          	jalr	-316(ra) # 80001cf8 <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE>
    mutex->signal();
    80001e3c:	008a3503          	ld	a0,8(s4)
    80001e40:	00000097          	auipc	ra,0x0
    80001e44:	168080e7          	jalr	360(ra) # 80001fa8 <_ZN5Mutex6signalEv>
    return 0;
    80001e48:	00000513          	li	a0,0
}
    80001e4c:	02813083          	ld	ra,40(sp)
    80001e50:	02013403          	ld	s0,32(sp)
    80001e54:	01813483          	ld	s1,24(sp)
    80001e58:	01013903          	ld	s2,16(sp)
    80001e5c:	00813983          	ld	s3,8(sp)
    80001e60:	00013a03          	ld	s4,0(sp)
    80001e64:	03010113          	addi	sp,sp,48
    80001e68:	00008067          	ret
    (!prev ? freeMemHead : prev->next) = elem;
    80001e6c:	013a3023          	sd	s3,0(s4)
    80001e70:	fb5ff06f          	j	80001e24 <_ZN15MemoryAllocator4freeEPv+0xc4>
        return -1;
    80001e74:	fff00513          	li	a0,-1
}
    80001e78:	00008067          	ret
        return -1;
    80001e7c:	fff00513          	li	a0,-1
    80001e80:	fcdff06f          	j	80001e4c <_ZN15MemoryAllocator4freeEPv+0xec>
    80001e84:	fff00513          	li	a0,-1
    80001e88:	fc5ff06f          	j	80001e4c <_ZN15MemoryAllocator4freeEPv+0xec>
        return -2;
    80001e8c:	ffe00513          	li	a0,-2
    80001e90:	fbdff06f          	j	80001e4c <_ZN15MemoryAllocator4freeEPv+0xec>
    80001e94:	ffe00513          	li	a0,-2
    80001e98:	fb5ff06f          	j	80001e4c <_ZN15MemoryAllocator4freeEPv+0xec>
    80001e9c:	ffe00513          	li	a0,-2
    80001ea0:	fadff06f          	j	80001e4c <_ZN15MemoryAllocator4freeEPv+0xec>
        return -2;
    80001ea4:	ffe00513          	li	a0,-2
    80001ea8:	fa5ff06f          	j	80001e4c <_ZN15MemoryAllocator4freeEPv+0xec>
    80001eac:	ffe00513          	li	a0,-2
    80001eb0:	f9dff06f          	j	80001e4c <_ZN15MemoryAllocator4freeEPv+0xec>

0000000080001eb4 <_Z7kmallocm>:

void *kmalloc(size_t size) {
    80001eb4:	fe010113          	addi	sp,sp,-32
    80001eb8:	00113c23          	sd	ra,24(sp)
    80001ebc:	00813823          	sd	s0,16(sp)
    80001ec0:	00913423          	sd	s1,8(sp)
    80001ec4:	02010413          	addi	s0,sp,32
    80001ec8:	00050493          	mv	s1,a0
    return MemoryAllocator::getInstance()->malloc(size);
    80001ecc:	00000097          	auipc	ra,0x0
    80001ed0:	cc4080e7          	jalr	-828(ra) # 80001b90 <_ZN15MemoryAllocator11getInstanceEv>
    80001ed4:	00048593          	mv	a1,s1
    80001ed8:	00000097          	auipc	ra,0x0
    80001edc:	d00080e7          	jalr	-768(ra) # 80001bd8 <_ZN15MemoryAllocator6mallocEm>
}
    80001ee0:	01813083          	ld	ra,24(sp)
    80001ee4:	01013403          	ld	s0,16(sp)
    80001ee8:	00813483          	ld	s1,8(sp)
    80001eec:	02010113          	addi	sp,sp,32
    80001ef0:	00008067          	ret

0000000080001ef4 <_Z5kfreePv>:

int kfree(void *addr) {
    80001ef4:	fe010113          	addi	sp,sp,-32
    80001ef8:	00113c23          	sd	ra,24(sp)
    80001efc:	00813823          	sd	s0,16(sp)
    80001f00:	00913423          	sd	s1,8(sp)
    80001f04:	02010413          	addi	s0,sp,32
    80001f08:	00050493          	mv	s1,a0
    return MemoryAllocator::getInstance()->free(addr);
    80001f0c:	00000097          	auipc	ra,0x0
    80001f10:	c84080e7          	jalr	-892(ra) # 80001b90 <_ZN15MemoryAllocator11getInstanceEv>
    80001f14:	00048593          	mv	a1,s1
    80001f18:	00000097          	auipc	ra,0x0
    80001f1c:	e48080e7          	jalr	-440(ra) # 80001d60 <_ZN15MemoryAllocator4freeEPv>
}
    80001f20:	01813083          	ld	ra,24(sp)
    80001f24:	01013403          	ld	s0,16(sp)
    80001f28:	00813483          	ld	s1,8(sp)
    80001f2c:	02010113          	addi	sp,sp,32
    80001f30:	00008067          	ret

0000000080001f34 <_ZN5Mutex4waitEv>:
#include "../h/Mutex.h"
#include "../h/TCB.h"
#include "../h/SysPrint.h"
#include "../h/Riscv.h"

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
//    kprintString("Waiting on mutex");
//    kprintUnsigned(val);
//    kprintString("\n");
    if (!val) block();
    80001f64:	00052783          	lw	a5,0(a0)
    80001f68:	02078a63          	beqz	a5,80001f9c <_ZN5Mutex4waitEv+0x68>
    holder = TCB::running;
    80001f6c:	00008797          	auipc	a5,0x8
    80001f70:	e947b783          	ld	a5,-364(a5) # 80009e00 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001f74:	0007b783          	ld	a5,0(a5)
    80001f78:	02f4b423          	sd	a5,40(s1)
    val = 0;
    80001f7c:	0004a023          	sw	zero,0(s1)
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
    if (!val) block();
    80001f9c:	00000097          	auipc	ra,0x0
    80001fa0:	820080e7          	jalr	-2016(ra) # 800017bc <_ZN15KernelSemaphore5blockEv>
    80001fa4:	fc9ff06f          	j	80001f6c <_ZN5Mutex4waitEv+0x38>

0000000080001fa8 <_ZN5Mutex6signalEv>:

void Mutex::signal() {
    if (holder != TCB::running) return;
    80001fa8:	02853703          	ld	a4,40(a0)
    80001fac:	00008797          	auipc	a5,0x8
    80001fb0:	e547b783          	ld	a5,-428(a5) # 80009e00 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001fb4:	0007b783          	ld	a5,0(a5)
    80001fb8:	00f70463          	beq	a4,a5,80001fc0 <_ZN5Mutex6signalEv+0x18>
    80001fbc:	00008067          	ret
void Mutex::signal() {
    80001fc0:	fe010113          	addi	sp,sp,-32
    80001fc4:	00113c23          	sd	ra,24(sp)
    80001fc8:	00813823          	sd	s0,16(sp)
    80001fcc:	02010413          	addi	s0,sp,32
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80001fd0:	100027f3          	csrr	a5,sstatus
    80001fd4:	fef43023          	sd	a5,-32(s0)
    return sstatus;
    80001fd8:	fe043783          	ld	a5,-32(s0)
    lock()
    80001fdc:	fef43423          	sd	a5,-24(s0)
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80001fe0:	00200793          	li	a5,2
    80001fe4:	1007b073          	csrc	sstatus,a5
    val = 1;
    80001fe8:	00100793          	li	a5,1
    80001fec:	00f52023          	sw	a5,0(a0)
    holder = nullptr;
    80001ff0:	02053423          	sd	zero,40(a0)
    80001ff4:	02052783          	lw	a5,32(a0)
    if (blockedThreadQueue.getCount() != 0)
    80001ff8:	00079e63          	bnez	a5,80002014 <_ZN5Mutex6signalEv+0x6c>
        deblock();
    unlock()
    80001ffc:	fe843783          	ld	a5,-24(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80002000:	10079073          	csrw	sstatus,a5
}
    80002004:	01813083          	ld	ra,24(sp)
    80002008:	01013403          	ld	s0,16(sp)
    8000200c:	02010113          	addi	sp,sp,32
    80002010:	00008067          	ret
        deblock();
    80002014:	00000097          	auipc	ra,0x0
    80002018:	800080e7          	jalr	-2048(ra) # 80001814 <_ZN15KernelSemaphore7deblockEv>
    8000201c:	fe1ff06f          	j	80001ffc <_ZN5Mutex6signalEv+0x54>

0000000080002020 <_ZN5Riscv10popSppSpieEb>:
#include "../h/SysPrint.h"
#include "../h/TCB.h"
#include "../h/Kernel.h"
#include "../h/TimerInterrupt.h"

void Riscv::popSppSpie(bool prMode) {
    80002020:	ff010113          	addi	sp,sp,-16
    80002024:	00813423          	sd	s0,8(sp)
    80002028:	01010413          	addi	s0,sp,16
    if(prMode) ms_sstatus(SSTATUS_SPP);
    8000202c:	02050463          	beqz	a0,80002054 <_ZN5Riscv10popSppSpieEb+0x34>
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80002030:	10000793          	li	a5,256
    80002034:	1007a073          	csrs	sstatus,a5
    80002038:	02000793          	li	a5,32
    8000203c:	1007a073          	csrs	sstatus,a5
    else mc_sstatus(SSTATUS_SPP);
    ms_sstatus(SSTATUS_SPIE);
    __asm__ volatile ("csrw sepc, ra");
    80002040:	14109073          	csrw	sepc,ra
    __asm__ volatile ("sret");
    80002044:	10200073          	sret
}
    80002048:	00813403          	ld	s0,8(sp)
    8000204c:	01010113          	addi	sp,sp,16
    80002050:	00008067          	ret
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80002054:	10000793          	li	a5,256
    80002058:	1007b073          	csrc	sstatus,a5
}
    8000205c:	fddff06f          	j	80002038 <_ZN5Riscv10popSppSpieEb+0x18>

0000000080002060 <_ZN5Riscv20handleSupervisorTrapEv>:

void Riscv::handleSupervisorTrap() {
    80002060:	f6010113          	addi	sp,sp,-160
    80002064:	08113c23          	sd	ra,152(sp)
    80002068:	08813823          	sd	s0,144(sp)
    8000206c:	08913423          	sd	s1,136(sp)
    80002070:	09213023          	sd	s2,128(sp)
    80002074:	0a010413          	addi	s0,sp,160
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    80002078:	142027f3          	csrr	a5,scause
    8000207c:	f8f43c23          	sd	a5,-104(s0)
    return scause;
    80002080:	f9843483          	ld	s1,-104(s0)
    uint64 scause = r_scause();
    switch (scause) {
    80002084:	fff00793          	li	a5,-1
    80002088:	03f79793          	slli	a5,a5,0x3f
    8000208c:	00178793          	addi	a5,a5,1
    80002090:	0cf48663          	beq	s1,a5,8000215c <_ZN5Riscv20handleSupervisorTrapEv+0xfc>
    80002094:	fff00793          	li	a5,-1
    80002098:	03f79793          	slli	a5,a5,0x3f
    8000209c:	00178793          	addi	a5,a5,1
    800020a0:	0497ea63          	bltu	a5,s1,800020f4 <_ZN5Riscv20handleSupervisorTrapEv+0x94>
    800020a4:	00800793          	li	a5,8
    800020a8:	06f48463          	beq	s1,a5,80002110 <_ZN5Riscv20handleSupervisorTrapEv+0xb0>
    800020ac:	00900793          	li	a5,9
    800020b0:	14f49263          	bne	s1,a5,800021f4 <_ZN5Riscv20handleSupervisorTrapEv+0x194>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    800020b4:	141027f3          	csrr	a5,sepc
    800020b8:	faf43c23          	sd	a5,-72(s0)
    return sepc;
    800020bc:	fb843783          	ld	a5,-72(s0)
            w_sepc(sepc);
            break;
        }
        case 0x0000000000000009UL: {
            // interrupt: no, cause code: environment call from S-mode (9)
            volatile uint64 sepc = r_sepc() + 4;
    800020c0:	00478793          	addi	a5,a5,4
    800020c4:	f6f43c23          	sd	a5,-136(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    800020c8:	100027f3          	csrr	a5,sstatus
    800020cc:	faf43823          	sd	a5,-80(s0)
    return sstatus;
    800020d0:	fb043783          	ld	a5,-80(s0)
            volatile uint64 sstatus = r_sstatus();
    800020d4:	f8f43023          	sd	a5,-128(s0)
//            kprintString("Ecall from S-mode for thread: ");
//            kprintUnsigned((uint64) TCB::running->getID());
//            kprintString("\n");

            TCB::dispatch();
    800020d8:	00001097          	auipc	ra,0x1
    800020dc:	afc080e7          	jalr	-1284(ra) # 80002bd4 <_ZN3TCB8dispatchEv>

            w_sstatus(sstatus);
    800020e0:	f8043783          	ld	a5,-128(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    800020e4:	10079073          	csrw	sstatus,a5
            w_sepc(sepc);
    800020e8:	f7843783          	ld	a5,-136(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    800020ec:	14179073          	csrw	sepc,a5
}
    800020f0:	0e00006f          	j	800021d0 <_ZN5Riscv20handleSupervisorTrapEv+0x170>
    switch (scause) {
    800020f4:	fff00793          	li	a5,-1
    800020f8:	03f79793          	slli	a5,a5,0x3f
    800020fc:	00978793          	addi	a5,a5,9
    80002100:	0ef49a63          	bne	s1,a5,800021f4 <_ZN5Riscv20handleSupervisorTrapEv+0x194>
            w_sepc(sepc);
            break;
        }
        case 0x8000000000000009UL: {
            // interrupt: yes, cause code: supervisor external interrupt (console)
            console_handler();
    80002104:	00005097          	auipc	ra,0x5
    80002108:	ffc080e7          	jalr	-4(ra) # 80007100 <console_handler>
            break;
    8000210c:	0c40006f          	j	800021d0 <_ZN5Riscv20handleSupervisorTrapEv+0x170>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80002110:	141027f3          	csrr	a5,sepc
    80002114:	faf43423          	sd	a5,-88(s0)
    return sepc;
    80002118:	fa843783          	ld	a5,-88(s0)
            volatile uint64 sepc = r_sepc() + 4;
    8000211c:	00478793          	addi	a5,a5,4
    80002120:	f6f43423          	sd	a5,-152(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80002124:	100027f3          	csrr	a5,sstatus
    80002128:	faf43023          	sd	a5,-96(s0)
    return sstatus;
    8000212c:	fa043783          	ld	a5,-96(s0)
            volatile uint64 sstatus = r_sstatus();
    80002130:	f6f43823          	sd	a5,-144(s0)
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80002134:	00200493          	li	s1,2
    80002138:	1004a073          	csrs	sstatus,s1
            Kernel::handleSystemCall();
    8000213c:	fffff097          	auipc	ra,0xfffff
    80002140:	50c080e7          	jalr	1292(ra) # 80001648 <_ZN6Kernel16handleSystemCallEv>
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80002144:	1004b073          	csrc	sstatus,s1
            w_sstatus(sstatus);
    80002148:	f7043783          	ld	a5,-144(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    8000214c:	10079073          	csrw	sstatus,a5
            w_sepc(sepc);
    80002150:	f6843783          	ld	a5,-152(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80002154:	14179073          	csrw	sepc,a5
}
    80002158:	0780006f          	j	800021d0 <_ZN5Riscv20handleSupervisorTrapEv+0x170>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    8000215c:	141027f3          	csrr	a5,sepc
    80002160:	fcf43423          	sd	a5,-56(s0)
    return sepc;
    80002164:	fc843783          	ld	a5,-56(s0)
            volatile uint64 sepc = r_sepc();
    80002168:	f8f43423          	sd	a5,-120(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    8000216c:	100027f3          	csrr	a5,sstatus
    80002170:	fcf43023          	sd	a5,-64(s0)
    return sstatus;
    80002174:	fc043783          	ld	a5,-64(s0)
            volatile uint64 sstatus = r_sstatus();
    80002178:	f8f43823          	sd	a5,-112(s0)
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    8000217c:	00200913          	li	s2,2
    80002180:	14493073          	csrc	sip,s2
            TCB::timeSliceCounter++;
    80002184:	00008497          	auipc	s1,0x8
    80002188:	c6c4b483          	ld	s1,-916(s1) # 80009df0 <_GLOBAL_OFFSET_TABLE_+0x18>
    8000218c:	0004b783          	ld	a5,0(s1)
    80002190:	00178793          	addi	a5,a5,1
    80002194:	00f4b023          	sd	a5,0(s1)
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80002198:	10092073          	csrs	sstatus,s2
            TimerInterrupt::tick();
    8000219c:	00001097          	auipc	ra,0x1
    800021a0:	430080e7          	jalr	1072(ra) # 800035cc <_ZN14TimerInterrupt4tickEv>
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    800021a4:	10093073          	csrc	sstatus,s2
            if (TCB::timeSliceCounter >= TCB::running->timeSlice) {
    800021a8:	00008797          	auipc	a5,0x8
    800021ac:	c587b783          	ld	a5,-936(a5) # 80009e00 <_GLOBAL_OFFSET_TABLE_+0x28>
    800021b0:	0007b783          	ld	a5,0(a5)
    800021b4:	0387b703          	ld	a4,56(a5)
    800021b8:	0004b783          	ld	a5,0(s1)
    800021bc:	02e7f663          	bgeu	a5,a4,800021e8 <_ZN5Riscv20handleSupervisorTrapEv+0x188>
            w_sstatus(sstatus);
    800021c0:	f9043783          	ld	a5,-112(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    800021c4:	10079073          	csrw	sstatus,a5
            w_sepc(sepc);
    800021c8:	f8843783          	ld	a5,-120(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    800021cc:	14179073          	csrw	sepc,a5
            kprintString("\nStval: ");
            kprintUnsigned(r_stval());
            kprintString("\n");
        }
    }
    800021d0:	09813083          	ld	ra,152(sp)
    800021d4:	09013403          	ld	s0,144(sp)
    800021d8:	08813483          	ld	s1,136(sp)
    800021dc:	08013903          	ld	s2,128(sp)
    800021e0:	0a010113          	addi	sp,sp,160
    800021e4:	00008067          	ret
                TCB::dispatch();
    800021e8:	00001097          	auipc	ra,0x1
    800021ec:	9ec080e7          	jalr	-1556(ra) # 80002bd4 <_ZN3TCB8dispatchEv>
    800021f0:	fd1ff06f          	j	800021c0 <_ZN5Riscv20handleSupervisorTrapEv+0x160>
            kprintString("Unexpected trap cause:\n");
    800021f4:	00006517          	auipc	a0,0x6
    800021f8:	fac50513          	addi	a0,a0,-84 # 800081a0 <CONSOLE_STATUS+0x190>
    800021fc:	00000097          	auipc	ra,0x0
    80002200:	60c080e7          	jalr	1548(ra) # 80002808 <_Z12kprintStringPKc>
            kprintString("Scause: ");
    80002204:	00006517          	auipc	a0,0x6
    80002208:	fb450513          	addi	a0,a0,-76 # 800081b8 <CONSOLE_STATUS+0x1a8>
    8000220c:	00000097          	auipc	ra,0x0
    80002210:	5fc080e7          	jalr	1532(ra) # 80002808 <_Z12kprintStringPKc>
            kprintUnsigned(scause);
    80002214:	00048513          	mv	a0,s1
    80002218:	00000097          	auipc	ra,0x0
    8000221c:	6f4080e7          	jalr	1780(ra) # 8000290c <_Z14kprintUnsignedm>
            kprintString("\nSepc: ");
    80002220:	00006517          	auipc	a0,0x6
    80002224:	fa850513          	addi	a0,a0,-88 # 800081c8 <CONSOLE_STATUS+0x1b8>
    80002228:	00000097          	auipc	ra,0x0
    8000222c:	5e0080e7          	jalr	1504(ra) # 80002808 <_Z12kprintStringPKc>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80002230:	141027f3          	csrr	a5,sepc
    80002234:	fcf43c23          	sd	a5,-40(s0)
    return sepc;
    80002238:	fd843503          	ld	a0,-40(s0)
            kprintUnsigned(r_sepc());
    8000223c:	00000097          	auipc	ra,0x0
    80002240:	6d0080e7          	jalr	1744(ra) # 8000290c <_Z14kprintUnsignedm>
            kprintString("\nStval: ");
    80002244:	00006517          	auipc	a0,0x6
    80002248:	f8c50513          	addi	a0,a0,-116 # 800081d0 <CONSOLE_STATUS+0x1c0>
    8000224c:	00000097          	auipc	ra,0x0
    80002250:	5bc080e7          	jalr	1468(ra) # 80002808 <_Z12kprintStringPKc>
    __asm__ volatile ("csrr %[stval], stval" : [stval] "=r"(stval));
    80002254:	143027f3          	csrr	a5,stval
    80002258:	fcf43823          	sd	a5,-48(s0)
    return stval;
    8000225c:	fd043503          	ld	a0,-48(s0)
            kprintUnsigned(r_stval());
    80002260:	00000097          	auipc	ra,0x0
    80002264:	6ac080e7          	jalr	1708(ra) # 8000290c <_Z14kprintUnsignedm>
            kprintString("\n");
    80002268:	00006517          	auipc	a0,0x6
    8000226c:	f2050513          	addi	a0,a0,-224 # 80008188 <CONSOLE_STATUS+0x178>
    80002270:	00000097          	auipc	ra,0x0
    80002274:	598080e7          	jalr	1432(ra) # 80002808 <_Z12kprintStringPKc>
    80002278:	f59ff06f          	j	800021d0 <_ZN5Riscv20handleSupervisorTrapEv+0x170>

000000008000227c <_ZN9Scheduler11getInstanceEv>:
    getInstance()->readyThreadQueue.addLast(tcb->getNode());
    getInstance()->mutex.signal();
}

Scheduler *Scheduler::getInstance() {
    if (!instance) instance = new Scheduler;
    8000227c:	00008797          	auipc	a5,0x8
    80002280:	be47b783          	ld	a5,-1052(a5) # 80009e60 <_ZN9Scheduler8instanceE>
    80002284:	00078863          	beqz	a5,80002294 <_ZN9Scheduler11getInstanceEv+0x18>
    return instance;
}
    80002288:	00008517          	auipc	a0,0x8
    8000228c:	bd853503          	ld	a0,-1064(a0) # 80009e60 <_ZN9Scheduler8instanceE>
    80002290:	00008067          	ret
Scheduler *Scheduler::getInstance() {
    80002294:	ff010113          	addi	sp,sp,-16
    80002298:	00113423          	sd	ra,8(sp)
    8000229c:	00813023          	sd	s0,0(sp)
    800022a0:	01010413          	addi	s0,sp,16
        return kmalloc(size);
    800022a4:	05800513          	li	a0,88
    800022a8:	00000097          	auipc	ra,0x0
    800022ac:	c0c080e7          	jalr	-1012(ra) # 80001eb4 <_Z7kmallocm>
    explicit ThreadList() = default;
    800022b0:	00053423          	sd	zero,8(a0)
    800022b4:	00053823          	sd	zero,16(a0)
    800022b8:	00053c23          	sd	zero,24(a0)
    800022bc:	02052023          	sw	zero,32(a0)
    800022c0:	00100793          	li	a5,1
    800022c4:	02f52423          	sw	a5,40(a0)
    800022c8:	02053823          	sd	zero,48(a0)
    800022cc:	02053c23          	sd	zero,56(a0)
    800022d0:	04053023          	sd	zero,64(a0)
    800022d4:	04052423          	sw	zero,72(a0)

#include "KernelSemaphore.h"
#include "MemoryAllocator.h"


class Mutex : public KernelSemaphore {
    800022d8:	04053823          	sd	zero,80(a0)
    if (!instance) instance = new Scheduler;
    800022dc:	00008797          	auipc	a5,0x8
    800022e0:	b8a7b223          	sd	a0,-1148(a5) # 80009e60 <_ZN9Scheduler8instanceE>
}
    800022e4:	00008517          	auipc	a0,0x8
    800022e8:	b7c53503          	ld	a0,-1156(a0) # 80009e60 <_ZN9Scheduler8instanceE>
    800022ec:	00813083          	ld	ra,8(sp)
    800022f0:	00013403          	ld	s0,0(sp)
    800022f4:	01010113          	addi	sp,sp,16
    800022f8:	00008067          	ret

00000000800022fc <_ZN9Scheduler3getEv>:
TCB *Scheduler::get() {
    800022fc:	fe010113          	addi	sp,sp,-32
    80002300:	00113c23          	sd	ra,24(sp)
    80002304:	00813823          	sd	s0,16(sp)
    80002308:	00913423          	sd	s1,8(sp)
    8000230c:	02010413          	addi	s0,sp,32
    getInstance()->mutex.wait();
    80002310:	00000097          	auipc	ra,0x0
    80002314:	f6c080e7          	jalr	-148(ra) # 8000227c <_ZN9Scheduler11getInstanceEv>
    80002318:	02850513          	addi	a0,a0,40
    8000231c:	00000097          	auipc	ra,0x0
    80002320:	c18080e7          	jalr	-1000(ra) # 80001f34 <_ZN5Mutex4waitEv>
    TCB *tcb = getInstance()->readyThreadQueue.removeFirst();
    80002324:	00000097          	auipc	ra,0x0
    80002328:	f58080e7          	jalr	-168(ra) # 8000227c <_ZN9Scheduler11getInstanceEv>
    8000232c:	00850513          	addi	a0,a0,8
    80002330:	00001097          	auipc	ra,0x1
    80002334:	f48080e7          	jalr	-184(ra) # 80003278 <_ZN10ThreadList11removeFirstEv>
    80002338:	00050493          	mv	s1,a0
    getInstance()->mutex.signal();
    8000233c:	00000097          	auipc	ra,0x0
    80002340:	f40080e7          	jalr	-192(ra) # 8000227c <_ZN9Scheduler11getInstanceEv>
    80002344:	02850513          	addi	a0,a0,40
    80002348:	00000097          	auipc	ra,0x0
    8000234c:	c60080e7          	jalr	-928(ra) # 80001fa8 <_ZN5Mutex6signalEv>
}
    80002350:	00048513          	mv	a0,s1
    80002354:	01813083          	ld	ra,24(sp)
    80002358:	01013403          	ld	s0,16(sp)
    8000235c:	00813483          	ld	s1,8(sp)
    80002360:	02010113          	addi	sp,sp,32
    80002364:	00008067          	ret

0000000080002368 <_ZN9Scheduler3putEP3TCB>:
void Scheduler::put(TCB *tcb) {
    80002368:	fe010113          	addi	sp,sp,-32
    8000236c:	00113c23          	sd	ra,24(sp)
    80002370:	00813823          	sd	s0,16(sp)
    80002374:	00913423          	sd	s1,8(sp)
    80002378:	02010413          	addi	s0,sp,32
    8000237c:	00050493          	mv	s1,a0
    getInstance()->mutex.wait();
    80002380:	00000097          	auipc	ra,0x0
    80002384:	efc080e7          	jalr	-260(ra) # 8000227c <_ZN9Scheduler11getInstanceEv>
    80002388:	02850513          	addi	a0,a0,40
    8000238c:	00000097          	auipc	ra,0x0
    80002390:	ba8080e7          	jalr	-1112(ra) # 80001f34 <_ZN5Mutex4waitEv>
    getInstance()->readyThreadQueue.addLast(tcb->getNode());
    80002394:	00000097          	auipc	ra,0x0
    80002398:	ee8080e7          	jalr	-280(ra) # 8000227c <_ZN9Scheduler11getInstanceEv>
    8000239c:	0a048593          	addi	a1,s1,160
    800023a0:	00850513          	addi	a0,a0,8
    800023a4:	00001097          	auipc	ra,0x1
    800023a8:	e90080e7          	jalr	-368(ra) # 80003234 <_ZN10ThreadList7addLastEP10ThreadNode>
    getInstance()->mutex.signal();
    800023ac:	00000097          	auipc	ra,0x0
    800023b0:	ed0080e7          	jalr	-304(ra) # 8000227c <_ZN9Scheduler11getInstanceEv>
    800023b4:	02850513          	addi	a0,a0,40
    800023b8:	00000097          	auipc	ra,0x0
    800023bc:	bf0080e7          	jalr	-1040(ra) # 80001fa8 <_ZN5Mutex6signalEv>
}
    800023c0:	01813083          	ld	ra,24(sp)
    800023c4:	01013403          	ld	s0,16(sp)
    800023c8:	00813483          	ld	s1,8(sp)
    800023cc:	02010113          	addi	sp,sp,32
    800023d0:	00008067          	ret

00000000800023d4 <_ZN9SchedulerD1Ev>:

Scheduler::~Scheduler() {
    800023d4:	fe010113          	addi	sp,sp,-32
    800023d8:	00113c23          	sd	ra,24(sp)
    800023dc:	00813823          	sd	s0,16(sp)
    800023e0:	00913423          	sd	s1,8(sp)
    800023e4:	01213023          	sd	s2,0(sp)
    800023e8:	02010413          	addi	s0,sp,32
    800023ec:	00050913          	mv	s2,a0
    bool hasCurr() {
        return curr != nullptr;
    }

    bool isEmpty() {
        return size == 0;
    800023f0:	02092783          	lw	a5,32(s2)
    while (!readyThreadQueue.isEmpty()) {
    800023f4:	02078863          	beqz	a5,80002424 <_ZN9SchedulerD1Ev+0x50>
//        kprintString("Scheduler deleting...\n");
        delete readyThreadQueue.removeFirst();
    800023f8:	00890513          	addi	a0,s2,8
    800023fc:	00001097          	auipc	ra,0x1
    80002400:	e7c080e7          	jalr	-388(ra) # 80003278 <_ZN10ThreadList11removeFirstEv>
    80002404:	00050493          	mv	s1,a0
    80002408:	fe0504e3          	beqz	a0,800023f0 <_ZN9SchedulerD1Ev+0x1c>
    8000240c:	00001097          	auipc	ra,0x1
    80002410:	9f8080e7          	jalr	-1544(ra) # 80002e04 <_ZN3TCBD1Ev>
        kfree(addr);
    80002414:	00048513          	mv	a0,s1
    80002418:	00000097          	auipc	ra,0x0
    8000241c:	adc080e7          	jalr	-1316(ra) # 80001ef4 <_Z5kfreePv>
    }
    80002420:	fd1ff06f          	j	800023f0 <_ZN9SchedulerD1Ev+0x1c>
    80002424:	02890513          	addi	a0,s2,40
    80002428:	fffff097          	auipc	ra,0xfffff
    8000242c:	4ec080e7          	jalr	1260(ra) # 80001914 <_ZN15KernelSemaphoreD1Ev>
Scheduler::~Scheduler() {
    80002430:	00890513          	addi	a0,s2,8
    80002434:	00001097          	auipc	ra,0x1
    80002438:	fe8080e7          	jalr	-24(ra) # 8000341c <_ZN10ThreadListD1Ev>
    }
}
    8000243c:	01813083          	ld	ra,24(sp)
    80002440:	01013403          	ld	s0,16(sp)
    80002444:	00813483          	ld	s1,8(sp)
    80002448:	00013903          	ld	s2,0(sp)
    8000244c:	02010113          	addi	sp,sp,32
    80002450:	00008067          	ret

0000000080002454 <_Z18callSupervisorTrapmPv>:
#include "../h/syscall_c.h"
#include "../h/SysPrint.h"


void *callSupervisorTrap(uint64 param, void *args) {
    80002454:	ff010113          	addi	sp,sp,-16
    80002458:	00813423          	sd	s0,8(sp)
    8000245c:	01010413          	addi	s0,sp,16
    __asm__ volatile ("ecall");
    80002460:	00000073          	ecall

    return (void *) param;
}
    80002464:	00813403          	ld	s0,8(sp)
    80002468:	01010113          	addi	sp,sp,16
    8000246c:	00008067          	ret

0000000080002470 <_Z9mem_allocm>:

void *mem_alloc(size_t size) {
    80002470:	fe010113          	addi	sp,sp,-32
    80002474:	00113c23          	sd	ra,24(sp)
    80002478:	00813823          	sd	s0,16(sp)
    8000247c:	02010413          	addi	s0,sp,32
    80002480:	fea43423          	sd	a0,-24(s0)
    return callSupervisorTrap(0x01, &size);
    80002484:	fe840593          	addi	a1,s0,-24
    80002488:	00100513          	li	a0,1
    8000248c:	00000097          	auipc	ra,0x0
    80002490:	fc8080e7          	jalr	-56(ra) # 80002454 <_Z18callSupervisorTrapmPv>
}
    80002494:	01813083          	ld	ra,24(sp)
    80002498:	01013403          	ld	s0,16(sp)
    8000249c:	02010113          	addi	sp,sp,32
    800024a0:	00008067          	ret

00000000800024a4 <_Z8mem_freePv>:

int mem_free(void *addr) {
    800024a4:	ff010113          	addi	sp,sp,-16
    800024a8:	00113423          	sd	ra,8(sp)
    800024ac:	00813023          	sd	s0,0(sp)
    800024b0:	01010413          	addi	s0,sp,16
    800024b4:	00050593          	mv	a1,a0
    return (uint64) callSupervisorTrap(0x02, addr);
    800024b8:	00200513          	li	a0,2
    800024bc:	00000097          	auipc	ra,0x0
    800024c0:	f98080e7          	jalr	-104(ra) # 80002454 <_Z18callSupervisorTrapmPv>
}
    800024c4:	0005051b          	sext.w	a0,a0
    800024c8:	00813083          	ld	ra,8(sp)
    800024cc:	00013403          	ld	s0,0(sp)
    800024d0:	01010113          	addi	sp,sp,16
    800024d4:	00008067          	ret

00000000800024d8 <_Z13thread_createPP7_threadPFvPvES2_>:

int thread_create(thread_t *handle, void(*start_routine)(void *), void *arg) {
    if (!handle) return -1;
    800024d8:	06050c63          	beqz	a0,80002550 <_Z13thread_createPP7_threadPFvPvES2_+0x78>
int thread_create(thread_t *handle, void(*start_routine)(void *), void *arg) {
    800024dc:	fb010113          	addi	sp,sp,-80
    800024e0:	04113423          	sd	ra,72(sp)
    800024e4:	04813023          	sd	s0,64(sp)
    800024e8:	02913c23          	sd	s1,56(sp)
    800024ec:	03213823          	sd	s2,48(sp)
    800024f0:	03313423          	sd	s3,40(sp)
    800024f4:	05010413          	addi	s0,sp,80
    800024f8:	00050493          	mv	s1,a0
    800024fc:	00058993          	mv	s3,a1
    80002500:	00060913          	mv	s2,a2
    *handle = new _thread;
    80002504:	01800513          	li	a0,24
    80002508:	00000097          	auipc	ra,0x0
    8000250c:	260080e7          	jalr	608(ra) # 80002768 <_Znwm>
    80002510:	00a4b023          	sd	a0,0(s1)
    uint64 args[] = {(uint64) *handle, (uint64) start_routine, (uint64) arg};
    80002514:	faa43c23          	sd	a0,-72(s0)
    80002518:	fd343023          	sd	s3,-64(s0)
    8000251c:	fd243423          	sd	s2,-56(s0)
    return (uint64) callSupervisorTrap(0x11, args);
    80002520:	fb840593          	addi	a1,s0,-72
    80002524:	01100513          	li	a0,17
    80002528:	00000097          	auipc	ra,0x0
    8000252c:	f2c080e7          	jalr	-212(ra) # 80002454 <_Z18callSupervisorTrapmPv>
    80002530:	0005051b          	sext.w	a0,a0
}
    80002534:	04813083          	ld	ra,72(sp)
    80002538:	04013403          	ld	s0,64(sp)
    8000253c:	03813483          	ld	s1,56(sp)
    80002540:	03013903          	ld	s2,48(sp)
    80002544:	02813983          	ld	s3,40(sp)
    80002548:	05010113          	addi	sp,sp,80
    8000254c:	00008067          	ret
    if (!handle) return -1;
    80002550:	fff00513          	li	a0,-1
}
    80002554:	00008067          	ret

0000000080002558 <_Z11thread_exitv>:

int thread_exit() {
    80002558:	ff010113          	addi	sp,sp,-16
    8000255c:	00113423          	sd	ra,8(sp)
    80002560:	00813023          	sd	s0,0(sp)
    80002564:	01010413          	addi	s0,sp,16
    return (uint64) callSupervisorTrap(0x12, 0);
    80002568:	00000593          	li	a1,0
    8000256c:	01200513          	li	a0,18
    80002570:	00000097          	auipc	ra,0x0
    80002574:	ee4080e7          	jalr	-284(ra) # 80002454 <_Z18callSupervisorTrapmPv>
}
    80002578:	0005051b          	sext.w	a0,a0
    8000257c:	00813083          	ld	ra,8(sp)
    80002580:	00013403          	ld	s0,0(sp)
    80002584:	01010113          	addi	sp,sp,16
    80002588:	00008067          	ret

000000008000258c <_Z15thread_dispatchv>:

void thread_dispatch() {
    8000258c:	ff010113          	addi	sp,sp,-16
    80002590:	00113423          	sd	ra,8(sp)
    80002594:	00813023          	sd	s0,0(sp)
    80002598:	01010413          	addi	s0,sp,16
    callSupervisorTrap(0x13, 0);
    8000259c:	00000593          	li	a1,0
    800025a0:	01300513          	li	a0,19
    800025a4:	00000097          	auipc	ra,0x0
    800025a8:	eb0080e7          	jalr	-336(ra) # 80002454 <_Z18callSupervisorTrapmPv>
}
    800025ac:	00813083          	ld	ra,8(sp)
    800025b0:	00013403          	ld	s0,0(sp)
    800025b4:	01010113          	addi	sp,sp,16
    800025b8:	00008067          	ret

00000000800025bc <_Z8sem_openPP4_semj>:

int sem_open(sem_t *handle, unsigned init) {
    if (!handle) return -1;
    800025bc:	06050863          	beqz	a0,8000262c <_Z8sem_openPP4_semj+0x70>
int sem_open(sem_t *handle, unsigned init) {
    800025c0:	fd010113          	addi	sp,sp,-48
    800025c4:	02113423          	sd	ra,40(sp)
    800025c8:	02813023          	sd	s0,32(sp)
    800025cc:	00913c23          	sd	s1,24(sp)
    800025d0:	01213823          	sd	s2,16(sp)
    800025d4:	03010413          	addi	s0,sp,48
    800025d8:	00050913          	mv	s2,a0
    800025dc:	00058493          	mv	s1,a1
    *handle = new _sem;
    800025e0:	00800513          	li	a0,8
    800025e4:	00000097          	auipc	ra,0x0
    800025e8:	184080e7          	jalr	388(ra) # 80002768 <_Znwm>
    800025ec:	00a93023          	sd	a0,0(s2)
//    kprintString("\n");
//    kprintString("Handle address: ");
//    kprintUnsigned((uint64) *handle);
//    kprintString("\n");

    uint64 args[] = {(uint64) *handle, (uint64) init};
    800025f0:	fca43823          	sd	a0,-48(s0)
    800025f4:	02049593          	slli	a1,s1,0x20
    800025f8:	0205d593          	srli	a1,a1,0x20
    800025fc:	fcb43c23          	sd	a1,-40(s0)
    return (uint64) callSupervisorTrap(0x21, args);
    80002600:	fd040593          	addi	a1,s0,-48
    80002604:	02100513          	li	a0,33
    80002608:	00000097          	auipc	ra,0x0
    8000260c:	e4c080e7          	jalr	-436(ra) # 80002454 <_Z18callSupervisorTrapmPv>
    80002610:	0005051b          	sext.w	a0,a0
}
    80002614:	02813083          	ld	ra,40(sp)
    80002618:	02013403          	ld	s0,32(sp)
    8000261c:	01813483          	ld	s1,24(sp)
    80002620:	01013903          	ld	s2,16(sp)
    80002624:	03010113          	addi	sp,sp,48
    80002628:	00008067          	ret
    if (!handle) return -1;
    8000262c:	fff00513          	li	a0,-1
}
    80002630:	00008067          	ret

0000000080002634 <_Z9sem_closeP4_sem>:

int sem_close(sem_t handle) {
    80002634:	ff010113          	addi	sp,sp,-16
    80002638:	00113423          	sd	ra,8(sp)
    8000263c:	00813023          	sd	s0,0(sp)
    80002640:	01010413          	addi	s0,sp,16
    80002644:	00050593          	mv	a1,a0
    return (uint64) callSupervisorTrap(0x22, handle);
    80002648:	02200513          	li	a0,34
    8000264c:	00000097          	auipc	ra,0x0
    80002650:	e08080e7          	jalr	-504(ra) # 80002454 <_Z18callSupervisorTrapmPv>
}
    80002654:	0005051b          	sext.w	a0,a0
    80002658:	00813083          	ld	ra,8(sp)
    8000265c:	00013403          	ld	s0,0(sp)
    80002660:	01010113          	addi	sp,sp,16
    80002664:	00008067          	ret

0000000080002668 <_Z8sem_waitP4_sem>:

int sem_wait(sem_t handle) {
    80002668:	ff010113          	addi	sp,sp,-16
    8000266c:	00113423          	sd	ra,8(sp)
    80002670:	00813023          	sd	s0,0(sp)
    80002674:	01010413          	addi	s0,sp,16
    80002678:	00050593          	mv	a1,a0
    return (uint64) callSupervisorTrap(0x23, handle);
    8000267c:	02300513          	li	a0,35
    80002680:	00000097          	auipc	ra,0x0
    80002684:	dd4080e7          	jalr	-556(ra) # 80002454 <_Z18callSupervisorTrapmPv>
}
    80002688:	0005051b          	sext.w	a0,a0
    8000268c:	00813083          	ld	ra,8(sp)
    80002690:	00013403          	ld	s0,0(sp)
    80002694:	01010113          	addi	sp,sp,16
    80002698:	00008067          	ret

000000008000269c <_Z10sem_signalP4_sem>:

int sem_signal(sem_t handle) {
    8000269c:	ff010113          	addi	sp,sp,-16
    800026a0:	00113423          	sd	ra,8(sp)
    800026a4:	00813023          	sd	s0,0(sp)
    800026a8:	01010413          	addi	s0,sp,16
    800026ac:	00050593          	mv	a1,a0
    return (uint64) callSupervisorTrap(0x24, handle);
    800026b0:	02400513          	li	a0,36
    800026b4:	00000097          	auipc	ra,0x0
    800026b8:	da0080e7          	jalr	-608(ra) # 80002454 <_Z18callSupervisorTrapmPv>
}
    800026bc:	0005051b          	sext.w	a0,a0
    800026c0:	00813083          	ld	ra,8(sp)
    800026c4:	00013403          	ld	s0,0(sp)
    800026c8:	01010113          	addi	sp,sp,16
    800026cc:	00008067          	ret

00000000800026d0 <_Z10time_sleepm>:

int time_sleep(time_t time) {
    800026d0:	ff010113          	addi	sp,sp,-16
    800026d4:	00113423          	sd	ra,8(sp)
    800026d8:	00813023          	sd	s0,0(sp)
    800026dc:	01010413          	addi	s0,sp,16
    800026e0:	00050593          	mv	a1,a0
    return (uint64) callSupervisorTrap(0x31, (void *) time);
    800026e4:	03100513          	li	a0,49
    800026e8:	00000097          	auipc	ra,0x0
    800026ec:	d6c080e7          	jalr	-660(ra) # 80002454 <_Z18callSupervisorTrapmPv>
}
    800026f0:	0005051b          	sext.w	a0,a0
    800026f4:	00813083          	ld	ra,8(sp)
    800026f8:	00013403          	ld	s0,0(sp)
    800026fc:	01010113          	addi	sp,sp,16
    80002700:	00008067          	ret

0000000080002704 <_Z4getcv>:

char getc() {
    80002704:	ff010113          	addi	sp,sp,-16
    80002708:	00113423          	sd	ra,8(sp)
    8000270c:	00813023          	sd	s0,0(sp)
    80002710:	01010413          	addi	s0,sp,16
    return (uint64) callSupervisorTrap(0x41, nullptr);
    80002714:	00000593          	li	a1,0
    80002718:	04100513          	li	a0,65
    8000271c:	00000097          	auipc	ra,0x0
    80002720:	d38080e7          	jalr	-712(ra) # 80002454 <_Z18callSupervisorTrapmPv>
}
    80002724:	0ff57513          	andi	a0,a0,255
    80002728:	00813083          	ld	ra,8(sp)
    8000272c:	00013403          	ld	s0,0(sp)
    80002730:	01010113          	addi	sp,sp,16
    80002734:	00008067          	ret

0000000080002738 <_Z4putcc>:

void putc(char chr) {
    80002738:	ff010113          	addi	sp,sp,-16
    8000273c:	00113423          	sd	ra,8(sp)
    80002740:	00813023          	sd	s0,0(sp)
    80002744:	01010413          	addi	s0,sp,16
    80002748:	00050593          	mv	a1,a0
    callSupervisorTrap(0x42, (void *) (uint64) chr);
    8000274c:	04200513          	li	a0,66
    80002750:	00000097          	auipc	ra,0x0
    80002754:	d04080e7          	jalr	-764(ra) # 80002454 <_Z18callSupervisorTrapmPv>
}
    80002758:	00813083          	ld	ra,8(sp)
    8000275c:	00013403          	ld	s0,0(sp)
    80002760:	01010113          	addi	sp,sp,16
    80002764:	00008067          	ret

0000000080002768 <_Znwm>:
#include "../h/syscall_cpp.hpp"

void *operator new(size_t sz) {
    80002768:	ff010113          	addi	sp,sp,-16
    8000276c:	00113423          	sd	ra,8(sp)
    80002770:	00813023          	sd	s0,0(sp)
    80002774:	01010413          	addi	s0,sp,16
    return mem_alloc(sz);
    80002778:	00000097          	auipc	ra,0x0
    8000277c:	cf8080e7          	jalr	-776(ra) # 80002470 <_Z9mem_allocm>
}
    80002780:	00813083          	ld	ra,8(sp)
    80002784:	00013403          	ld	s0,0(sp)
    80002788:	01010113          	addi	sp,sp,16
    8000278c:	00008067          	ret

0000000080002790 <_Znam>:

void *operator new[](size_t sz) {
    80002790:	ff010113          	addi	sp,sp,-16
    80002794:	00113423          	sd	ra,8(sp)
    80002798:	00813023          	sd	s0,0(sp)
    8000279c:	01010413          	addi	s0,sp,16
    return mem_alloc(sz);
    800027a0:	00000097          	auipc	ra,0x0
    800027a4:	cd0080e7          	jalr	-816(ra) # 80002470 <_Z9mem_allocm>
}
    800027a8:	00813083          	ld	ra,8(sp)
    800027ac:	00013403          	ld	s0,0(sp)
    800027b0:	01010113          	addi	sp,sp,16
    800027b4:	00008067          	ret

00000000800027b8 <_ZdlPv>:

void operator delete(void *addr) {
    800027b8:	ff010113          	addi	sp,sp,-16
    800027bc:	00113423          	sd	ra,8(sp)
    800027c0:	00813023          	sd	s0,0(sp)
    800027c4:	01010413          	addi	s0,sp,16
    mem_free(addr);
    800027c8:	00000097          	auipc	ra,0x0
    800027cc:	cdc080e7          	jalr	-804(ra) # 800024a4 <_Z8mem_freePv>
}
    800027d0:	00813083          	ld	ra,8(sp)
    800027d4:	00013403          	ld	s0,0(sp)
    800027d8:	01010113          	addi	sp,sp,16
    800027dc:	00008067          	ret

00000000800027e0 <_ZdaPv>:

void operator delete[](void *addr) {
    800027e0:	ff010113          	addi	sp,sp,-16
    800027e4:	00113423          	sd	ra,8(sp)
    800027e8:	00813023          	sd	s0,0(sp)
    800027ec:	01010413          	addi	s0,sp,16
    mem_free(addr);
    800027f0:	00000097          	auipc	ra,0x0
    800027f4:	cb4080e7          	jalr	-844(ra) # 800024a4 <_Z8mem_freePv>
}
    800027f8:	00813083          	ld	ra,8(sp)
    800027fc:	00013403          	ld	s0,0(sp)
    80002800:	01010113          	addi	sp,sp,16
    80002804:	00008067          	ret

0000000080002808 <_Z12kprintStringPKc>:

#include "../h/SysPrint.h"
#include "../lib/console.h"
#include "../h/Riscv.h"

void kprintString(char const *string) {
    80002808:	fe010113          	addi	sp,sp,-32
    8000280c:	00113c23          	sd	ra,24(sp)
    80002810:	00813823          	sd	s0,16(sp)
    80002814:	00913423          	sd	s1,8(sp)
    80002818:	02010413          	addi	s0,sp,32
    8000281c:	00050493          	mv	s1,a0
//    uint64 sstatus;
//    Riscv::lock(sstatus);

    while (*string != '\0') {
    80002820:	0004c503          	lbu	a0,0(s1)
    80002824:	00050a63          	beqz	a0,80002838 <_Z12kprintStringPKc+0x30>
        __putc(*string);
    80002828:	00005097          	auipc	ra,0x5
    8000282c:	864080e7          	jalr	-1948(ra) # 8000708c <__putc>
        string++;
    80002830:	00148493          	addi	s1,s1,1
    while (*string != '\0') {
    80002834:	fedff06f          	j	80002820 <_Z12kprintStringPKc+0x18>
    }

//    Riscv::unlock(sstatus);
}
    80002838:	01813083          	ld	ra,24(sp)
    8000283c:	01013403          	ld	s0,16(sp)
    80002840:	00813483          	ld	s1,8(sp)
    80002844:	02010113          	addi	sp,sp,32
    80002848:	00008067          	ret

000000008000284c <_Z13kprintIntegeri>:

void kprintInteger(int integer) {
    8000284c:	fd010113          	addi	sp,sp,-48
    80002850:	02113423          	sd	ra,40(sp)
    80002854:	02813023          	sd	s0,32(sp)
    80002858:	00913c23          	sd	s1,24(sp)
    8000285c:	03010413          	addi	s0,sp,48
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if (integer < 0) {
    80002860:	08054663          	bltz	a0,800028ec <_Z13kprintIntegeri+0xa0>
        neg = 1;
        x = -integer;
    } else {
        x = integer;
    80002864:	0005051b          	sext.w	a0,a0
    neg = 0;
    80002868:	00000593          	li	a1,0
    }

    i = 0;
    8000286c:	00000493          	li	s1,0
    do {
        buf[i++] = digits[x % 10];
    80002870:	00a00693          	li	a3,10
    80002874:	02d577bb          	remuw	a5,a0,a3
    80002878:	00048613          	mv	a2,s1
    8000287c:	0014849b          	addiw	s1,s1,1
    80002880:	02079713          	slli	a4,a5,0x20
    80002884:	02075713          	srli	a4,a4,0x20
    80002888:	00006797          	auipc	a5,0x6
    8000288c:	95878793          	addi	a5,a5,-1704 # 800081e0 <_ZZ13kprintIntegeriE6digits>
    80002890:	00e787b3          	add	a5,a5,a4
    80002894:	0007c703          	lbu	a4,0(a5)
    80002898:	fe040793          	addi	a5,s0,-32
    8000289c:	00c787b3          	add	a5,a5,a2
    800028a0:	fee78823          	sb	a4,-16(a5)
    } while ((x /= 10) != 0);
    800028a4:	0005071b          	sext.w	a4,a0
    800028a8:	02d5553b          	divuw	a0,a0,a3
    800028ac:	00900793          	li	a5,9
    800028b0:	fce7e0e3          	bltu	a5,a4,80002870 <_Z13kprintIntegeri+0x24>
    if (neg) buf[i++] = '-';
    800028b4:	00058c63          	beqz	a1,800028cc <_Z13kprintIntegeri+0x80>
    800028b8:	fe040793          	addi	a5,s0,-32
    800028bc:	009784b3          	add	s1,a5,s1
    800028c0:	02d00793          	li	a5,45
    800028c4:	fef48823          	sb	a5,-16(s1)
    800028c8:	0026049b          	addiw	s1,a2,2

    while (--i >= 0)
    800028cc:	fff4849b          	addiw	s1,s1,-1
    800028d0:	0204c463          	bltz	s1,800028f8 <_Z13kprintIntegeri+0xac>
        __putc(buf[i]);
    800028d4:	fe040793          	addi	a5,s0,-32
    800028d8:	009787b3          	add	a5,a5,s1
    800028dc:	ff07c503          	lbu	a0,-16(a5)
    800028e0:	00004097          	auipc	ra,0x4
    800028e4:	7ac080e7          	jalr	1964(ra) # 8000708c <__putc>
    800028e8:	fe5ff06f          	j	800028cc <_Z13kprintIntegeri+0x80>
        x = -integer;
    800028ec:	40a0053b          	negw	a0,a0
        neg = 1;
    800028f0:	00100593          	li	a1,1
    800028f4:	f79ff06f          	j	8000286c <_Z13kprintIntegeri+0x20>

//    Riscv::unlock(sstatus);
}
    800028f8:	02813083          	ld	ra,40(sp)
    800028fc:	02013403          	ld	s0,32(sp)
    80002900:	01813483          	ld	s1,24(sp)
    80002904:	03010113          	addi	sp,sp,48
    80002908:	00008067          	ret

000000008000290c <_Z14kprintUnsignedm>:

void kprintUnsigned(uint64 x) {
    8000290c:	fd010113          	addi	sp,sp,-48
    80002910:	02113423          	sd	ra,40(sp)
    80002914:	02813023          	sd	s0,32(sp)
    80002918:	00913c23          	sd	s1,24(sp)
    8000291c:	03010413          	addi	s0,sp,48
//    Riscv::lock(sstatus);

    static char digits[] = "0123456789";
    char buf[16];

    int i = 0;
    80002920:	00000493          	li	s1,0
    do {
        buf[i++] = digits[x % 10];
    80002924:	00a00693          	li	a3,10
    80002928:	02d57633          	remu	a2,a0,a3
    8000292c:	00006717          	auipc	a4,0x6
    80002930:	8b470713          	addi	a4,a4,-1868 # 800081e0 <_ZZ13kprintIntegeriE6digits>
    80002934:	00c70733          	add	a4,a4,a2
    80002938:	01074703          	lbu	a4,16(a4)
    8000293c:	fe040613          	addi	a2,s0,-32
    80002940:	009607b3          	add	a5,a2,s1
    80002944:	0014849b          	addiw	s1,s1,1
    80002948:	fee78823          	sb	a4,-16(a5)
    } while ((x /= 10) != 0);
    8000294c:	00050713          	mv	a4,a0
    80002950:	02d55533          	divu	a0,a0,a3
    80002954:	00900793          	li	a5,9
    80002958:	fce7e6e3          	bltu	a5,a4,80002924 <_Z14kprintUnsignedm+0x18>

    while (--i >= 0)
    8000295c:	fff4849b          	addiw	s1,s1,-1
    80002960:	0004ce63          	bltz	s1,8000297c <_Z14kprintUnsignedm+0x70>
        __putc(buf[i]);
    80002964:	fe040793          	addi	a5,s0,-32
    80002968:	009787b3          	add	a5,a5,s1
    8000296c:	ff07c503          	lbu	a0,-16(a5)
    80002970:	00004097          	auipc	ra,0x4
    80002974:	71c080e7          	jalr	1820(ra) # 8000708c <__putc>
    80002978:	fe5ff06f          	j	8000295c <_Z14kprintUnsignedm+0x50>

//    Riscv::unlock(sstatus);
}
    8000297c:	02813083          	ld	ra,40(sp)
    80002980:	02013403          	ld	s0,32(sp)
    80002984:	01813483          	ld	s1,24(sp)
    80002988:	03010113          	addi	sp,sp,48
    8000298c:	00008067          	ret

0000000080002990 <_ZN3TCB13threadWrapperEv>:
    TCB::contextSwitch(&old->context, &running->context);

    unlock()
}

void TCB::threadWrapper() {
    80002990:	fe010113          	addi	sp,sp,-32
    80002994:	00113c23          	sd	ra,24(sp)
    80002998:	00813823          	sd	s0,16(sp)
    8000299c:	00913423          	sd	s1,8(sp)
    800029a0:	02010413          	addi	s0,sp,32
    Riscv::popSppSpie(running->privileged);
    800029a4:	00007497          	auipc	s1,0x7
    800029a8:	4c448493          	addi	s1,s1,1220 # 80009e68 <_ZN3TCB7runningE>
    800029ac:	0004b783          	ld	a5,0(s1)
    800029b0:	0687c503          	lbu	a0,104(a5)
    800029b4:	fffff097          	auipc	ra,0xfffff
    800029b8:	66c080e7          	jalr	1644(ra) # 80002020 <_ZN5Riscv10popSppSpieEb>
    running->body(running->args);
    800029bc:	0004b783          	ld	a5,0(s1)
    800029c0:	0087b703          	ld	a4,8(a5)
    800029c4:	0107b503          	ld	a0,16(a5)
    800029c8:	000700e7          	jalr	a4

//    kprintString("Ending thread...\n");

    __asm__ volatile ("li a0, 0x12");
    800029cc:	01200513          	li	a0,18
    __asm__ volatile ("ecall");
    800029d0:	00000073          	ecall
}
    800029d4:	01813083          	ld	ra,24(sp)
    800029d8:	01013403          	ld	s0,16(sp)
    800029dc:	00813483          	ld	s1,8(sp)
    800029e0:	02010113          	addi	sp,sp,32
    800029e4:	00008067          	ret

00000000800029e8 <_ZN3TCBC1EPFvPvES0_mb>:
TCB::TCB(Body body, void *args, uint64 timeSlice, bool privileged) :
    800029e8:	fd010113          	addi	sp,sp,-48
    800029ec:	02113423          	sd	ra,40(sp)
    800029f0:	02813023          	sd	s0,32(sp)
    800029f4:	00913c23          	sd	s1,24(sp)
    800029f8:	01213823          	sd	s2,16(sp)
    800029fc:	01313423          	sd	s3,8(sp)
    80002a00:	01413023          	sd	s4,0(sp)
    80002a04:	03010413          	addi	s0,sp,48
    80002a08:	00050493          	mv	s1,a0
    80002a0c:	00058913          	mv	s2,a1
    80002a10:	00068a13          	mv	s4,a3
    80002a14:	00070993          	mv	s3,a4
        node(this) {
    80002a18:	00b53423          	sd	a1,8(a0)
    80002a1c:	00c53823          	sd	a2,16(a0)
        threadStack(body != nullptr ? (uint64 *) kmalloc(DEFAULT_STACK_SIZE * sizeof(uint64)) : nullptr),
    80002a20:	0a058863          	beqz	a1,80002ad0 <_ZN3TCBC1EPFvPvES0_mb+0xe8>
    80002a24:	00008537          	lui	a0,0x8
    80002a28:	fffff097          	auipc	ra,0xfffff
    80002a2c:	48c080e7          	jalr	1164(ra) # 80001eb4 <_Z7kmallocm>
        node(this) {
    80002a30:	00a4bc23          	sd	a0,24(s1)
        kernelStack((uint64 *) kmalloc(DEFAULT_STACK_SIZE * sizeof(uint64))),
    80002a34:	00008537          	lui	a0,0x8
    80002a38:	fffff097          	auipc	ra,0xfffff
    80002a3c:	47c080e7          	jalr	1148(ra) # 80001eb4 <_Z7kmallocm>
        node(this) {
    80002a40:	02a4b023          	sd	a0,32(s1)
    80002a44:	00000797          	auipc	a5,0x0
    80002a48:	f4c78793          	addi	a5,a5,-180 # 80002990 <_ZN3TCB13threadWrapperEv>
    80002a4c:	02f4b423          	sd	a5,40(s1)
        context({(uint64) &threadWrapper, threadStack != nullptr ? (uint64) (threadStack + DEFAULT_STACK_SIZE) : 0}),
    80002a50:	0184b783          	ld	a5,24(s1)
    80002a54:	08078263          	beqz	a5,80002ad8 <_ZN3TCBC1EPFvPvES0_mb+0xf0>
    80002a58:	00008737          	lui	a4,0x8
    80002a5c:	00e787b3          	add	a5,a5,a4
        node(this) {
    80002a60:	02f4b823          	sd	a5,48(s1)
    80002a64:	0344bc23          	sd	s4,56(s1)
    80002a68:	0404a023          	sw	zero,64(s1)
    80002a6c:	04848a13          	addi	s4,s1,72
    explicit ThreadList() = default;
    80002a70:	0404b423          	sd	zero,72(s1)
    80002a74:	0404b823          	sd	zero,80(s1)
    80002a78:	0404bc23          	sd	zero,88(s1)
    80002a7c:	0604a023          	sw	zero,96(s1)
    80002a80:	07348423          	sb	s3,104(s1)
    80002a84:	00100793          	li	a5,1
    80002a88:	06f4a823          	sw	a5,112(s1)
    80002a8c:	0604bc23          	sd	zero,120(s1)
    80002a90:	0804b023          	sd	zero,128(s1)
    80002a94:	0804b423          	sd	zero,136(s1)
    80002a98:	0804a823          	sw	zero,144(s1)
    80002a9c:	0804bc23          	sd	zero,152(s1)

class TCB;

class ThreadNode : public KernelObject {
public:
    ThreadNode(TCB *data, ThreadNode *next = nullptr, ThreadNode *prev = nullptr) : data(data), next(next), prev(prev) {}
    80002aa0:	0a94b023          	sd	s1,160(s1)
    80002aa4:	0a04b423          	sd	zero,168(s1)
    80002aa8:	0a04b823          	sd	zero,176(s1)
    80002aac:	0a04bc23          	sd	zero,184(s1)
    ssp = (uint64) (kernelStack + DEFAULT_STACK_SIZE);
    80002ab0:	000087b7          	lui	a5,0x8
    80002ab4:	00f50533          	add	a0,a0,a5
    80002ab8:	00a4b023          	sd	a0,0(s1)
    if (body != nullptr)
    80002abc:	04090663          	beqz	s2,80002b08 <_ZN3TCBC1EPFvPvES0_mb+0x120>
        Scheduler::put(this);
    80002ac0:	00048513          	mv	a0,s1
    80002ac4:	00000097          	auipc	ra,0x0
    80002ac8:	8a4080e7          	jalr	-1884(ra) # 80002368 <_ZN9Scheduler3putEP3TCB>
    80002acc:	03c0006f          	j	80002b08 <_ZN3TCBC1EPFvPvES0_mb+0x120>
        threadStack(body != nullptr ? (uint64 *) kmalloc(DEFAULT_STACK_SIZE * sizeof(uint64)) : nullptr),
    80002ad0:	00000513          	li	a0,0
    80002ad4:	f5dff06f          	j	80002a30 <_ZN3TCBC1EPFvPvES0_mb+0x48>
        context({(uint64) &threadWrapper, threadStack != nullptr ? (uint64) (threadStack + DEFAULT_STACK_SIZE) : 0}),
    80002ad8:	00000793          	li	a5,0
    80002adc:	f85ff06f          	j	80002a60 <_ZN3TCBC1EPFvPvES0_mb+0x78>
    80002ae0:	00050913          	mv	s2,a0
    80002ae4:	07048513          	addi	a0,s1,112
    80002ae8:	fffff097          	auipc	ra,0xfffff
    80002aec:	e2c080e7          	jalr	-468(ra) # 80001914 <_ZN15KernelSemaphoreD1Ev>
        node(this) {
    80002af0:	000a0513          	mv	a0,s4
    80002af4:	00001097          	auipc	ra,0x1
    80002af8:	928080e7          	jalr	-1752(ra) # 8000341c <_ZN10ThreadListD1Ev>
    80002afc:	00090513          	mv	a0,s2
    80002b00:	00008097          	auipc	ra,0x8
    80002b04:	478080e7          	jalr	1144(ra) # 8000af78 <_Unwind_Resume>
}
    80002b08:	02813083          	ld	ra,40(sp)
    80002b0c:	02013403          	ld	s0,32(sp)
    80002b10:	01813483          	ld	s1,24(sp)
    80002b14:	01013903          	ld	s2,16(sp)
    80002b18:	00813983          	ld	s3,8(sp)
    80002b1c:	00013a03          	ld	s4,0(sp)
    80002b20:	03010113          	addi	sp,sp,48
    80002b24:	00008067          	ret

0000000080002b28 <_ZN3TCB12createThreadEPFvPvES0_>:
TCB *TCB::createThread(TCB::Body body, void *args) {
    80002b28:	fd010113          	addi	sp,sp,-48
    80002b2c:	02113423          	sd	ra,40(sp)
    80002b30:	02813023          	sd	s0,32(sp)
    80002b34:	00913c23          	sd	s1,24(sp)
    80002b38:	01213823          	sd	s2,16(sp)
    80002b3c:	01313423          	sd	s3,8(sp)
    80002b40:	03010413          	addi	s0,sp,48
    80002b44:	00050913          	mv	s2,a0
    80002b48:	00058993          	mv	s3,a1
        return kmalloc(size);
    80002b4c:	0c000513          	li	a0,192
    80002b50:	fffff097          	auipc	ra,0xfffff
    80002b54:	364080e7          	jalr	868(ra) # 80001eb4 <_Z7kmallocm>
    80002b58:	00050493          	mv	s1,a0
    return new TCB(body, args, DEFAULT_TIME_SLICE);
    80002b5c:	00000713          	li	a4,0
    80002b60:	00200693          	li	a3,2
    80002b64:	00098613          	mv	a2,s3
    80002b68:	00090593          	mv	a1,s2
    80002b6c:	00000097          	auipc	ra,0x0
    80002b70:	e7c080e7          	jalr	-388(ra) # 800029e8 <_ZN3TCBC1EPFvPvES0_mb>
    80002b74:	0200006f          	j	80002b94 <_ZN3TCB12createThreadEPFvPvES0_+0x6c>
    80002b78:	00050913          	mv	s2,a0
        kfree(addr);
    80002b7c:	00048513          	mv	a0,s1
    80002b80:	fffff097          	auipc	ra,0xfffff
    80002b84:	374080e7          	jalr	884(ra) # 80001ef4 <_Z5kfreePv>
    80002b88:	00090513          	mv	a0,s2
    80002b8c:	00008097          	auipc	ra,0x8
    80002b90:	3ec080e7          	jalr	1004(ra) # 8000af78 <_Unwind_Resume>
}
    80002b94:	00048513          	mv	a0,s1
    80002b98:	02813083          	ld	ra,40(sp)
    80002b9c:	02013403          	ld	s0,32(sp)
    80002ba0:	01813483          	ld	s1,24(sp)
    80002ba4:	01013903          	ld	s2,16(sp)
    80002ba8:	00813983          	ld	s3,8(sp)
    80002bac:	03010113          	addi	sp,sp,48
    80002bb0:	00008067          	ret

0000000080002bb4 <_ZN3TCB5yieldEv>:
void TCB::yield() {
    80002bb4:	ff010113          	addi	sp,sp,-16
    80002bb8:	00813423          	sd	s0,8(sp)
    80002bbc:	01010413          	addi	s0,sp,16
    __asm__ volatile ("li a0, 0x13");
    80002bc0:	01300513          	li	a0,19
    __asm__ volatile ("ecall");
    80002bc4:	00000073          	ecall
}
    80002bc8:	00813403          	ld	s0,8(sp)
    80002bcc:	01010113          	addi	sp,sp,16
    80002bd0:	00008067          	ret

0000000080002bd4 <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    80002bd4:	fd010113          	addi	sp,sp,-48
    80002bd8:	02113423          	sd	ra,40(sp)
    80002bdc:	02813023          	sd	s0,32(sp)
    80002be0:	00913c23          	sd	s1,24(sp)
    80002be4:	03010413          	addi	s0,sp,48
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80002be8:	100027f3          	csrr	a5,sstatus
    80002bec:	fcf43823          	sd	a5,-48(s0)
    return sstatus;
    80002bf0:	fd043783          	ld	a5,-48(s0)
    lock()
    80002bf4:	fcf43c23          	sd	a5,-40(s0)
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80002bf8:	00200793          	li	a5,2
    80002bfc:	1007b073          	csrc	sstatus,a5
    TCB *old = running;
    80002c00:	00007497          	auipc	s1,0x7
    80002c04:	2684b483          	ld	s1,616(s1) # 80009e68 <_ZN3TCB7runningE>
        return status == READY;
    80002c08:	0404a783          	lw	a5,64(s1)
    if (old->isReady()) Scheduler::put(old);
    80002c0c:	04078e63          	beqz	a5,80002c68 <_ZN3TCB8dispatchEv+0x94>
    else if (old->isFinished()) {
    80002c10:	00100713          	li	a4,1
    80002c14:	06e78263          	beq	a5,a4,80002c78 <_ZN3TCB8dispatchEv+0xa4>
    running = Scheduler::get();
    80002c18:	fffff097          	auipc	ra,0xfffff
    80002c1c:	6e4080e7          	jalr	1764(ra) # 800022fc <_ZN9Scheduler3getEv>
    80002c20:	00007797          	auipc	a5,0x7
    80002c24:	24a7b423          	sd	a0,584(a5) # 80009e68 <_ZN3TCB7runningE>
    if (!running) {
    80002c28:	04050e63          	beqz	a0,80002c84 <_ZN3TCB8dispatchEv+0xb0>
    TCB::timeSliceCounter = 0;
    80002c2c:	00007797          	auipc	a5,0x7
    80002c30:	23c78793          	addi	a5,a5,572 # 80009e68 <_ZN3TCB7runningE>
    80002c34:	0007b423          	sd	zero,8(a5)
    TCB::contextSwitch(&old->context, &running->context);
    80002c38:	0007b583          	ld	a1,0(a5)
    80002c3c:	02858593          	addi	a1,a1,40
    80002c40:	02848513          	addi	a0,s1,40
    80002c44:	ffffe097          	auipc	ra,0xffffe
    80002c48:	3bc080e7          	jalr	956(ra) # 80001000 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
    unlock()
    80002c4c:	fd843783          	ld	a5,-40(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80002c50:	10079073          	csrw	sstatus,a5
}
    80002c54:	02813083          	ld	ra,40(sp)
    80002c58:	02013403          	ld	s0,32(sp)
    80002c5c:	01813483          	ld	s1,24(sp)
    80002c60:	03010113          	addi	sp,sp,48
    80002c64:	00008067          	ret
    if (old->isReady()) Scheduler::put(old);
    80002c68:	00048513          	mv	a0,s1
    80002c6c:	fffff097          	auipc	ra,0xfffff
    80002c70:	6fc080e7          	jalr	1788(ra) # 80002368 <_ZN9Scheduler3putEP3TCB>
    80002c74:	fa5ff06f          	j	80002c18 <_ZN3TCB8dispatchEv+0x44>
        ThreadCollector::signal();
    80002c78:	00000097          	auipc	ra,0x0
    80002c7c:	434080e7          	jalr	1076(ra) # 800030ac <_ZN15ThreadCollector6signalEv>
    80002c80:	f99ff06f          	j	80002c18 <_ZN3TCB8dispatchEv+0x44>
        running = IdleThread::getIdleThread();
    80002c84:	ffffe097          	auipc	ra,0xffffe
    80002c88:	6ac080e7          	jalr	1708(ra) # 80001330 <_ZN10IdleThread13getIdleThreadEv>
    80002c8c:	00007797          	auipc	a5,0x7
    80002c90:	1ca7be23          	sd	a0,476(a5) # 80009e68 <_ZN3TCB7runningE>
    80002c94:	f99ff06f          	j	80002c2c <_ZN3TCB8dispatchEv+0x58>

0000000080002c98 <_ZN3TCB4exitEv>:
void TCB::exit() {
    80002c98:	ff010113          	addi	sp,sp,-16
    80002c9c:	00113423          	sd	ra,8(sp)
    80002ca0:	00813023          	sd	s0,0(sp)
    80002ca4:	01010413          	addi	s0,sp,16
    running->setFinished();
    80002ca8:	00007517          	auipc	a0,0x7
    80002cac:	1c053503          	ld	a0,448(a0) # 80009e68 <_ZN3TCB7runningE>
        status = FINISHED;
    80002cb0:	00100793          	li	a5,1
    80002cb4:	04f52023          	sw	a5,64(a0)
    running->mutex.wait();
    80002cb8:	07050513          	addi	a0,a0,112
    80002cbc:	fffff097          	auipc	ra,0xfffff
    80002cc0:	278080e7          	jalr	632(ra) # 80001f34 <_ZN5Mutex4waitEv>
    while (!running->waitingToJoin.isEmpty()) {
    80002cc4:	00007517          	auipc	a0,0x7
    80002cc8:	1a453503          	ld	a0,420(a0) # 80009e68 <_ZN3TCB7runningE>
        return size == 0;
    80002ccc:	06052783          	lw	a5,96(a0)
    80002cd0:	02078063          	beqz	a5,80002cf0 <_ZN3TCB4exitEv+0x58>
        TCB *thr = running->waitingToJoin.removeFirst();
    80002cd4:	04850513          	addi	a0,a0,72
    80002cd8:	00000097          	auipc	ra,0x0
    80002cdc:	5a0080e7          	jalr	1440(ra) # 80003278 <_ZN10ThreadList11removeFirstEv>
        status = READY;
    80002ce0:	04052023          	sw	zero,64(a0)
        Scheduler::put(thr);
    80002ce4:	fffff097          	auipc	ra,0xfffff
    80002ce8:	684080e7          	jalr	1668(ra) # 80002368 <_ZN9Scheduler3putEP3TCB>
    while (!running->waitingToJoin.isEmpty()) {
    80002cec:	fd9ff06f          	j	80002cc4 <_ZN3TCB4exitEv+0x2c>
    running->mutex.signal();
    80002cf0:	07050513          	addi	a0,a0,112
    80002cf4:	fffff097          	auipc	ra,0xfffff
    80002cf8:	2b4080e7          	jalr	692(ra) # 80001fa8 <_ZN5Mutex6signalEv>
    ThreadCollector::put(running);
    80002cfc:	00007517          	auipc	a0,0x7
    80002d00:	16c53503          	ld	a0,364(a0) # 80009e68 <_ZN3TCB7runningE>
    80002d04:	00000097          	auipc	ra,0x0
    80002d08:	3dc080e7          	jalr	988(ra) # 800030e0 <_ZN15ThreadCollector3putEP3TCB>
    running->dispatch();
    80002d0c:	00000097          	auipc	ra,0x0
    80002d10:	ec8080e7          	jalr	-312(ra) # 80002bd4 <_ZN3TCB8dispatchEv>
}
    80002d14:	00813083          	ld	ra,8(sp)
    80002d18:	00013403          	ld	s0,0(sp)
    80002d1c:	01010113          	addi	sp,sp,16
    80002d20:	00008067          	ret

0000000080002d24 <_ZN3TCB14readSavedStackEv>:

void TCB::readSavedStack() {
    80002d24:	ff010113          	addi	sp,sp,-16
    80002d28:	00813423          	sd	s0,8(sp)
    80002d2c:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sscratch, %[ssp]" : : [ssp] "r"(TCB::running->ssp));
    80002d30:	00007797          	auipc	a5,0x7
    80002d34:	1387b783          	ld	a5,312(a5) # 80009e68 <_ZN3TCB7runningE>
    80002d38:	0007b783          	ld	a5,0(a5)
    80002d3c:	14079073          	csrw	sscratch,a5
}
    80002d40:	00813403          	ld	s0,8(sp)
    80002d44:	01010113          	addi	sp,sp,16
    80002d48:	00008067          	ret

0000000080002d4c <_ZN3TCB15writeSavedStackEv>:

void TCB::writeSavedStack() {
    80002d4c:	ff010113          	addi	sp,sp,-16
    80002d50:	00813423          	sd	s0,8(sp)
    80002d54:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrr %[ssp], sscratch" : [ssp] "=r"(TCB::running->ssp));
    80002d58:	14002773          	csrr	a4,sscratch
    80002d5c:	00007797          	auipc	a5,0x7
    80002d60:	10c7b783          	ld	a5,268(a5) # 80009e68 <_ZN3TCB7runningE>
    80002d64:	00e7b023          	sd	a4,0(a5)
}
    80002d68:	00813403          	ld	s0,8(sp)
    80002d6c:	01010113          	addi	sp,sp,16
    80002d70:	00008067          	ret

0000000080002d74 <_ZN3TCB4joinEv>:
        return status == FINISHED;
    80002d74:	04052703          	lw	a4,64(a0)

int TCB::join() {
    if (isFinished()) return 0;
    80002d78:	00100793          	li	a5,1
    80002d7c:	08f70063          	beq	a4,a5,80002dfc <_ZN3TCB4joinEv+0x88>
int TCB::join() {
    80002d80:	fe010113          	addi	sp,sp,-32
    80002d84:	00113c23          	sd	ra,24(sp)
    80002d88:	00813823          	sd	s0,16(sp)
    80002d8c:	00913423          	sd	s1,8(sp)
    80002d90:	01213023          	sd	s2,0(sp)
    80002d94:	02010413          	addi	s0,sp,32
    80002d98:	00050493          	mv	s1,a0

    mutex.wait();
    80002d9c:	07050913          	addi	s2,a0,112
    80002da0:	00090513          	mv	a0,s2
    80002da4:	fffff097          	auipc	ra,0xfffff
    80002da8:	190080e7          	jalr	400(ra) # 80001f34 <_ZN5Mutex4waitEv>

    running->setBlocked();
    80002dac:	00007597          	auipc	a1,0x7
    80002db0:	0bc5b583          	ld	a1,188(a1) # 80009e68 <_ZN3TCB7runningE>
        status = BLOCKED;
    80002db4:	00200793          	li	a5,2
    80002db8:	04f5a023          	sw	a5,64(a1)
    waitingToJoin.addLast(&running->node);
    80002dbc:	0a058593          	addi	a1,a1,160
    80002dc0:	04848513          	addi	a0,s1,72
    80002dc4:	00000097          	auipc	ra,0x0
    80002dc8:	470080e7          	jalr	1136(ra) # 80003234 <_ZN10ThreadList7addLastEP10ThreadNode>

    mutex.signal();
    80002dcc:	00090513          	mv	a0,s2
    80002dd0:	fffff097          	auipc	ra,0xfffff
    80002dd4:	1d8080e7          	jalr	472(ra) # 80001fa8 <_ZN5Mutex6signalEv>

    yield();
    80002dd8:	00000097          	auipc	ra,0x0
    80002ddc:	ddc080e7          	jalr	-548(ra) # 80002bb4 <_ZN3TCB5yieldEv>

    return 0;
}
    80002de0:	00000513          	li	a0,0
    80002de4:	01813083          	ld	ra,24(sp)
    80002de8:	01013403          	ld	s0,16(sp)
    80002dec:	00813483          	ld	s1,8(sp)
    80002df0:	00013903          	ld	s2,0(sp)
    80002df4:	02010113          	addi	sp,sp,32
    80002df8:	00008067          	ret
    80002dfc:	00000513          	li	a0,0
    80002e00:	00008067          	ret

0000000080002e04 <_ZN3TCBD1Ev>:

TCB::~TCB() {
    80002e04:	fe010113          	addi	sp,sp,-32
    80002e08:	00113c23          	sd	ra,24(sp)
    80002e0c:	00813823          	sd	s0,16(sp)
    80002e10:	00913423          	sd	s1,8(sp)
    80002e14:	02010413          	addi	s0,sp,32
    80002e18:	00050493          	mv	s1,a0
    kfree(kernelStack);
    80002e1c:	02053503          	ld	a0,32(a0)
    80002e20:	fffff097          	auipc	ra,0xfffff
    80002e24:	0d4080e7          	jalr	212(ra) # 80001ef4 <_Z5kfreePv>
    kfree(threadStack);
    80002e28:	0184b503          	ld	a0,24(s1)
    80002e2c:	fffff097          	auipc	ra,0xfffff
    80002e30:	0c8080e7          	jalr	200(ra) # 80001ef4 <_Z5kfreePv>
    80002e34:	07048513          	addi	a0,s1,112
    80002e38:	fffff097          	auipc	ra,0xfffff
    80002e3c:	adc080e7          	jalr	-1316(ra) # 80001914 <_ZN15KernelSemaphoreD1Ev>
TCB::~TCB() {
    80002e40:	04848513          	addi	a0,s1,72
    80002e44:	00000097          	auipc	ra,0x0
    80002e48:	5d8080e7          	jalr	1496(ra) # 8000341c <_ZN10ThreadListD1Ev>
}
    80002e4c:	01813083          	ld	ra,24(sp)
    80002e50:	01013403          	ld	s0,16(sp)
    80002e54:	00813483          	ld	s1,8(sp)
    80002e58:	02010113          	addi	sp,sp,32
    80002e5c:	00008067          	ret

0000000080002e60 <_ZN15ThreadCollectorC1Ev>:
    getInstance()->mutex.wait();
    getInstance()->finishedThreads.addLast(tcb->getNode());
    getInstance()->mutex.signal();
}

ThreadCollector::ThreadCollector() : readyToDelete(0) {
    80002e60:	fc010113          	addi	sp,sp,-64
    80002e64:	02113c23          	sd	ra,56(sp)
    80002e68:	02813823          	sd	s0,48(sp)
    80002e6c:	02913423          	sd	s1,40(sp)
    80002e70:	03213023          	sd	s2,32(sp)
    80002e74:	01313c23          	sd	s3,24(sp)
    80002e78:	01413823          	sd	s4,16(sp)
    80002e7c:	01513423          	sd	s5,8(sp)
    80002e80:	04010413          	addi	s0,sp,64
    80002e84:	00050493          	mv	s1,a0
    80002e88:	00053023          	sd	zero,0(a0)
    80002e8c:	00850993          	addi	s3,a0,8
    explicit ThreadList() = default;
    80002e90:	00053423          	sd	zero,8(a0)
    80002e94:	00053823          	sd	zero,16(a0)
    80002e98:	00053c23          	sd	zero,24(a0)
    80002e9c:	02052023          	sw	zero,32(a0)
    80002ea0:	00100793          	li	a5,1
    80002ea4:	02f52423          	sw	a5,40(a0)
    80002ea8:	02053823          	sd	zero,48(a0)
    80002eac:	02053c23          	sd	zero,56(a0)
    80002eb0:	04053023          	sd	zero,64(a0)
    80002eb4:	04052423          	sw	zero,72(a0)
    80002eb8:	04053823          	sd	zero,80(a0)
    80002ebc:	05850a13          	addi	s4,a0,88
    80002ec0:	04052c23          	sw	zero,88(a0)
    80002ec4:	06053023          	sd	zero,96(a0)
    80002ec8:	06053423          	sd	zero,104(a0)
    80002ecc:	06053823          	sd	zero,112(a0)
    80002ed0:	06052c23          	sw	zero,120(a0)
        return kmalloc(size);
    80002ed4:	0c000513          	li	a0,192
    80002ed8:	fffff097          	auipc	ra,0xfffff
    80002edc:	fdc080e7          	jalr	-36(ra) # 80001eb4 <_Z7kmallocm>
    80002ee0:	00050913          	mv	s2,a0
    threadCollector = new TCB([](void *){ThreadCollector::run();}, nullptr, DEFAULT_TIME_SLICE, true);
    80002ee4:	00100713          	li	a4,1
    80002ee8:	00200693          	li	a3,2
    80002eec:	00000613          	li	a2,0
    80002ef0:	00000597          	auipc	a1,0x0
    80002ef4:	2e458593          	addi	a1,a1,740 # 800031d4 <_ZZN15ThreadCollectorC4EvENUlPvE_4_FUNES0_>
    80002ef8:	00000097          	auipc	ra,0x0
    80002efc:	af0080e7          	jalr	-1296(ra) # 800029e8 <_ZN3TCBC1EPFvPvES0_mb>
    80002f00:	0124b023          	sd	s2,0(s1)
}
    80002f04:	03813083          	ld	ra,56(sp)
    80002f08:	03013403          	ld	s0,48(sp)
    80002f0c:	02813483          	ld	s1,40(sp)
    80002f10:	02013903          	ld	s2,32(sp)
    80002f14:	01813983          	ld	s3,24(sp)
    80002f18:	01013a03          	ld	s4,16(sp)
    80002f1c:	00813a83          	ld	s5,8(sp)
    80002f20:	04010113          	addi	sp,sp,64
    80002f24:	00008067          	ret
    80002f28:	00050a93          	mv	s5,a0
        kfree(addr);
    80002f2c:	00090513          	mv	a0,s2
    80002f30:	fffff097          	auipc	ra,0xfffff
    80002f34:	fc4080e7          	jalr	-60(ra) # 80001ef4 <_Z5kfreePv>
    80002f38:	000a8913          	mv	s2,s5
ThreadCollector::ThreadCollector() : readyToDelete(0) {
    80002f3c:	000a0513          	mv	a0,s4
    80002f40:	fffff097          	auipc	ra,0xfffff
    80002f44:	9d4080e7          	jalr	-1580(ra) # 80001914 <_ZN15KernelSemaphoreD1Ev>
    80002f48:	02848513          	addi	a0,s1,40
    80002f4c:	fffff097          	auipc	ra,0xfffff
    80002f50:	9c8080e7          	jalr	-1592(ra) # 80001914 <_ZN15KernelSemaphoreD1Ev>
    80002f54:	00098513          	mv	a0,s3
    80002f58:	00000097          	auipc	ra,0x0
    80002f5c:	4c4080e7          	jalr	1220(ra) # 8000341c <_ZN10ThreadListD1Ev>
    80002f60:	00090513          	mv	a0,s2
    80002f64:	00008097          	auipc	ra,0x8
    80002f68:	014080e7          	jalr	20(ra) # 8000af78 <_Unwind_Resume>
    80002f6c:	00050913          	mv	s2,a0
    80002f70:	fcdff06f          	j	80002f3c <_ZN15ThreadCollectorC1Ev+0xdc>

0000000080002f74 <_ZN15ThreadCollectorD1Ev>:
        delete getInstance()->finishedThreads.removeFirst();
        getInstance()->mutex.signal();
    }
}

ThreadCollector::~ThreadCollector() {
    80002f74:	fe010113          	addi	sp,sp,-32
    80002f78:	00113c23          	sd	ra,24(sp)
    80002f7c:	00813823          	sd	s0,16(sp)
    80002f80:	00913423          	sd	s1,8(sp)
    80002f84:	01213023          	sd	s2,0(sp)
    80002f88:	02010413          	addi	s0,sp,32
    80002f8c:	00050913          	mv	s2,a0
        return size == 0;
    80002f90:	02092783          	lw	a5,32(s2)
    while (!finishedThreads.isEmpty()) {
    80002f94:	02078863          	beqz	a5,80002fc4 <_ZN15ThreadCollectorD1Ev+0x50>
//        kprintString("Collector deleting...\n");
        delete finishedThreads.removeFirst();
    80002f98:	00890513          	addi	a0,s2,8
    80002f9c:	00000097          	auipc	ra,0x0
    80002fa0:	2dc080e7          	jalr	732(ra) # 80003278 <_ZN10ThreadList11removeFirstEv>
    80002fa4:	00050493          	mv	s1,a0
    80002fa8:	fe0504e3          	beqz	a0,80002f90 <_ZN15ThreadCollectorD1Ev+0x1c>
    80002fac:	00000097          	auipc	ra,0x0
    80002fb0:	e58080e7          	jalr	-424(ra) # 80002e04 <_ZN3TCBD1Ev>
    80002fb4:	00048513          	mv	a0,s1
    80002fb8:	fffff097          	auipc	ra,0xfffff
    80002fbc:	f3c080e7          	jalr	-196(ra) # 80001ef4 <_Z5kfreePv>
    }
    80002fc0:	fd1ff06f          	j	80002f90 <_ZN15ThreadCollectorD1Ev+0x1c>
    }
    delete threadCollector;
    80002fc4:	00093483          	ld	s1,0(s2)
    80002fc8:	00048e63          	beqz	s1,80002fe4 <_ZN15ThreadCollectorD1Ev+0x70>
    80002fcc:	00048513          	mv	a0,s1
    80002fd0:	00000097          	auipc	ra,0x0
    80002fd4:	e34080e7          	jalr	-460(ra) # 80002e04 <_ZN3TCBD1Ev>
        kfree(addr);
    80002fd8:	00048513          	mv	a0,s1
    80002fdc:	fffff097          	auipc	ra,0xfffff
    80002fe0:	f18080e7          	jalr	-232(ra) # 80001ef4 <_Z5kfreePv>
ThreadCollector::~ThreadCollector() {
    80002fe4:	05890513          	addi	a0,s2,88
    80002fe8:	fffff097          	auipc	ra,0xfffff
    80002fec:	92c080e7          	jalr	-1748(ra) # 80001914 <_ZN15KernelSemaphoreD1Ev>
    80002ff0:	02890513          	addi	a0,s2,40
    80002ff4:	fffff097          	auipc	ra,0xfffff
    80002ff8:	920080e7          	jalr	-1760(ra) # 80001914 <_ZN15KernelSemaphoreD1Ev>
    80002ffc:	00890513          	addi	a0,s2,8
    80003000:	00000097          	auipc	ra,0x0
    80003004:	41c080e7          	jalr	1052(ra) # 8000341c <_ZN10ThreadListD1Ev>
}
    80003008:	01813083          	ld	ra,24(sp)
    8000300c:	01013403          	ld	s0,16(sp)
    80003010:	00813483          	ld	s1,8(sp)
    80003014:	00013903          	ld	s2,0(sp)
    80003018:	02010113          	addi	sp,sp,32
    8000301c:	00008067          	ret

0000000080003020 <_ZN15ThreadCollector11getInstanceEv>:

ThreadCollector *ThreadCollector::getInstance() {
    if (!instance) instance = new ThreadCollector;
    80003020:	00007797          	auipc	a5,0x7
    80003024:	e587b783          	ld	a5,-424(a5) # 80009e78 <_ZN15ThreadCollector8instanceE>
    80003028:	00078863          	beqz	a5,80003038 <_ZN15ThreadCollector11getInstanceEv+0x18>
    return instance;
    8000302c:	00007517          	auipc	a0,0x7
    80003030:	e4c53503          	ld	a0,-436(a0) # 80009e78 <_ZN15ThreadCollector8instanceE>
}
    80003034:	00008067          	ret
ThreadCollector *ThreadCollector::getInstance() {
    80003038:	fe010113          	addi	sp,sp,-32
    8000303c:	00113c23          	sd	ra,24(sp)
    80003040:	00813823          	sd	s0,16(sp)
    80003044:	00913423          	sd	s1,8(sp)
    80003048:	01213023          	sd	s2,0(sp)
    8000304c:	02010413          	addi	s0,sp,32
        return kmalloc(size);
    80003050:	08000513          	li	a0,128
    80003054:	fffff097          	auipc	ra,0xfffff
    80003058:	e60080e7          	jalr	-416(ra) # 80001eb4 <_Z7kmallocm>
    8000305c:	00050493          	mv	s1,a0
    if (!instance) instance = new ThreadCollector;
    80003060:	00000097          	auipc	ra,0x0
    80003064:	e00080e7          	jalr	-512(ra) # 80002e60 <_ZN15ThreadCollectorC1Ev>
    80003068:	00007797          	auipc	a5,0x7
    8000306c:	e097b823          	sd	s1,-496(a5) # 80009e78 <_ZN15ThreadCollector8instanceE>
    return instance;
    80003070:	00007517          	auipc	a0,0x7
    80003074:	e0853503          	ld	a0,-504(a0) # 80009e78 <_ZN15ThreadCollector8instanceE>
}
    80003078:	01813083          	ld	ra,24(sp)
    8000307c:	01013403          	ld	s0,16(sp)
    80003080:	00813483          	ld	s1,8(sp)
    80003084:	00013903          	ld	s2,0(sp)
    80003088:	02010113          	addi	sp,sp,32
    8000308c:	00008067          	ret
    80003090:	00050913          	mv	s2,a0
        kfree(addr);
    80003094:	00048513          	mv	a0,s1
    80003098:	fffff097          	auipc	ra,0xfffff
    8000309c:	e5c080e7          	jalr	-420(ra) # 80001ef4 <_Z5kfreePv>
    800030a0:	00090513          	mv	a0,s2
    800030a4:	00008097          	auipc	ra,0x8
    800030a8:	ed4080e7          	jalr	-300(ra) # 8000af78 <_Unwind_Resume>

00000000800030ac <_ZN15ThreadCollector6signalEv>:
void ThreadCollector::signal() {
    800030ac:	ff010113          	addi	sp,sp,-16
    800030b0:	00113423          	sd	ra,8(sp)
    800030b4:	00813023          	sd	s0,0(sp)
    800030b8:	01010413          	addi	s0,sp,16
    getInstance()->readyToDelete.signal();
    800030bc:	00000097          	auipc	ra,0x0
    800030c0:	f64080e7          	jalr	-156(ra) # 80003020 <_ZN15ThreadCollector11getInstanceEv>
    800030c4:	05850513          	addi	a0,a0,88
    800030c8:	ffffe097          	auipc	ra,0xffffe
    800030cc:	7f0080e7          	jalr	2032(ra) # 800018b8 <_ZN15KernelSemaphore6signalEv>
}
    800030d0:	00813083          	ld	ra,8(sp)
    800030d4:	00013403          	ld	s0,0(sp)
    800030d8:	01010113          	addi	sp,sp,16
    800030dc:	00008067          	ret

00000000800030e0 <_ZN15ThreadCollector3putEP3TCB>:
void ThreadCollector::put(TCB *tcb) {
    800030e0:	fe010113          	addi	sp,sp,-32
    800030e4:	00113c23          	sd	ra,24(sp)
    800030e8:	00813823          	sd	s0,16(sp)
    800030ec:	00913423          	sd	s1,8(sp)
    800030f0:	02010413          	addi	s0,sp,32
    800030f4:	00050493          	mv	s1,a0
    getInstance()->mutex.wait();
    800030f8:	00000097          	auipc	ra,0x0
    800030fc:	f28080e7          	jalr	-216(ra) # 80003020 <_ZN15ThreadCollector11getInstanceEv>
    80003100:	02850513          	addi	a0,a0,40
    80003104:	fffff097          	auipc	ra,0xfffff
    80003108:	e30080e7          	jalr	-464(ra) # 80001f34 <_ZN5Mutex4waitEv>
    getInstance()->finishedThreads.addLast(tcb->getNode());
    8000310c:	00000097          	auipc	ra,0x0
    80003110:	f14080e7          	jalr	-236(ra) # 80003020 <_ZN15ThreadCollector11getInstanceEv>
    80003114:	0a048593          	addi	a1,s1,160
    80003118:	00850513          	addi	a0,a0,8
    8000311c:	00000097          	auipc	ra,0x0
    80003120:	118080e7          	jalr	280(ra) # 80003234 <_ZN10ThreadList7addLastEP10ThreadNode>
    getInstance()->mutex.signal();
    80003124:	00000097          	auipc	ra,0x0
    80003128:	efc080e7          	jalr	-260(ra) # 80003020 <_ZN15ThreadCollector11getInstanceEv>
    8000312c:	02850513          	addi	a0,a0,40
    80003130:	fffff097          	auipc	ra,0xfffff
    80003134:	e78080e7          	jalr	-392(ra) # 80001fa8 <_ZN5Mutex6signalEv>
}
    80003138:	01813083          	ld	ra,24(sp)
    8000313c:	01013403          	ld	s0,16(sp)
    80003140:	00813483          	ld	s1,8(sp)
    80003144:	02010113          	addi	sp,sp,32
    80003148:	00008067          	ret

000000008000314c <_ZN15ThreadCollector3runEv>:
[[noreturn]] void ThreadCollector::run() {
    8000314c:	fe010113          	addi	sp,sp,-32
    80003150:	00113c23          	sd	ra,24(sp)
    80003154:	00813823          	sd	s0,16(sp)
    80003158:	00913423          	sd	s1,8(sp)
    8000315c:	02010413          	addi	s0,sp,32
    80003160:	0300006f          	j	80003190 <_ZN15ThreadCollector3runEv+0x44>
    80003164:	00050493          	mv	s1,a0
        delete getInstance()->finishedThreads.removeFirst();
    80003168:	00000097          	auipc	ra,0x0
    8000316c:	c9c080e7          	jalr	-868(ra) # 80002e04 <_ZN3TCBD1Ev>
    80003170:	00048513          	mv	a0,s1
    80003174:	fffff097          	auipc	ra,0xfffff
    80003178:	d80080e7          	jalr	-640(ra) # 80001ef4 <_Z5kfreePv>
        getInstance()->mutex.signal();
    8000317c:	00000097          	auipc	ra,0x0
    80003180:	ea4080e7          	jalr	-348(ra) # 80003020 <_ZN15ThreadCollector11getInstanceEv>
    80003184:	02850513          	addi	a0,a0,40
    80003188:	fffff097          	auipc	ra,0xfffff
    8000318c:	e20080e7          	jalr	-480(ra) # 80001fa8 <_ZN5Mutex6signalEv>
        getInstance()->readyToDelete.wait();
    80003190:	00000097          	auipc	ra,0x0
    80003194:	e90080e7          	jalr	-368(ra) # 80003020 <_ZN15ThreadCollector11getInstanceEv>
    80003198:	05850513          	addi	a0,a0,88
    8000319c:	ffffe097          	auipc	ra,0xffffe
    800031a0:	6bc080e7          	jalr	1724(ra) # 80001858 <_ZN15KernelSemaphore4waitEv>
        getInstance()->mutex.wait();
    800031a4:	00000097          	auipc	ra,0x0
    800031a8:	e7c080e7          	jalr	-388(ra) # 80003020 <_ZN15ThreadCollector11getInstanceEv>
    800031ac:	02850513          	addi	a0,a0,40
    800031b0:	fffff097          	auipc	ra,0xfffff
    800031b4:	d84080e7          	jalr	-636(ra) # 80001f34 <_ZN5Mutex4waitEv>
        delete getInstance()->finishedThreads.removeFirst();
    800031b8:	00000097          	auipc	ra,0x0
    800031bc:	e68080e7          	jalr	-408(ra) # 80003020 <_ZN15ThreadCollector11getInstanceEv>
    800031c0:	00850513          	addi	a0,a0,8
    800031c4:	00000097          	auipc	ra,0x0
    800031c8:	0b4080e7          	jalr	180(ra) # 80003278 <_ZN10ThreadList11removeFirstEv>
    800031cc:	f8051ce3          	bnez	a0,80003164 <_ZN15ThreadCollector3runEv+0x18>
    800031d0:	fadff06f          	j	8000317c <_ZN15ThreadCollector3runEv+0x30>

00000000800031d4 <_ZZN15ThreadCollectorC4EvENUlPvE_4_FUNES0_>:
    threadCollector = new TCB([](void *){ThreadCollector::run();}, nullptr, DEFAULT_TIME_SLICE, true);
    800031d4:	ff010113          	addi	sp,sp,-16
    800031d8:	00113423          	sd	ra,8(sp)
    800031dc:	00813023          	sd	s0,0(sp)
    800031e0:	01010413          	addi	s0,sp,16
    800031e4:	00000097          	auipc	ra,0x0
    800031e8:	f68080e7          	jalr	-152(ra) # 8000314c <_ZN15ThreadCollector3runEv>

00000000800031ec <_ZN10ThreadList8addFirstEP10ThreadNode>:
// Created by xparh on 5/13/2022.
//

#include "../h/ThreadList.h"

void ThreadList::addFirst(ThreadNode *elem) {
    800031ec:	ff010113          	addi	sp,sp,-16
    800031f0:	00813423          	sd	s0,8(sp)
    800031f4:	01010413          	addi	s0,sp,16
    elem->next = head;
    800031f8:	00053783          	ld	a5,0(a0)
    800031fc:	00f5b423          	sd	a5,8(a1)
    elem->prev = nullptr;
    80003200:	0005b823          	sd	zero,16(a1)
    if (head) head->prev = elem;
    80003204:	00053783          	ld	a5,0(a0)
    80003208:	02078263          	beqz	a5,8000322c <_ZN10ThreadList8addFirstEP10ThreadNode+0x40>
    8000320c:	00b7b823          	sd	a1,16(a5)
    else tail = elem;
    head = elem;
    80003210:	00b53023          	sd	a1,0(a0)

    size++;
    80003214:	01852783          	lw	a5,24(a0)
    80003218:	0017879b          	addiw	a5,a5,1
    8000321c:	00f52c23          	sw	a5,24(a0)
}
    80003220:	00813403          	ld	s0,8(sp)
    80003224:	01010113          	addi	sp,sp,16
    80003228:	00008067          	ret
    else tail = elem;
    8000322c:	00b53423          	sd	a1,8(a0)
    80003230:	fe1ff06f          	j	80003210 <_ZN10ThreadList8addFirstEP10ThreadNode+0x24>

0000000080003234 <_ZN10ThreadList7addLastEP10ThreadNode>:

void ThreadList::addLast(ThreadNode *elem) {
    80003234:	ff010113          	addi	sp,sp,-16
    80003238:	00813423          	sd	s0,8(sp)
    8000323c:	01010413          	addi	s0,sp,16
    elem->next = nullptr;
    80003240:	0005b423          	sd	zero,8(a1)
    elem->prev = tail;
    80003244:	00853783          	ld	a5,8(a0)
    80003248:	00f5b823          	sd	a5,16(a1)
    if (tail) tail->next = elem;
    8000324c:	02078263          	beqz	a5,80003270 <_ZN10ThreadList7addLastEP10ThreadNode+0x3c>
    80003250:	00b7b423          	sd	a1,8(a5)
    else head = elem;
    tail = elem;
    80003254:	00b53423          	sd	a1,8(a0)

    size++;
    80003258:	01852783          	lw	a5,24(a0)
    8000325c:	0017879b          	addiw	a5,a5,1
    80003260:	00f52c23          	sw	a5,24(a0)
}
    80003264:	00813403          	ld	s0,8(sp)
    80003268:	01010113          	addi	sp,sp,16
    8000326c:	00008067          	ret
    else head = elem;
    80003270:	00b53023          	sd	a1,0(a0)
    80003274:	fe1ff06f          	j	80003254 <_ZN10ThreadList7addLastEP10ThreadNode+0x20>

0000000080003278 <_ZN10ThreadList11removeFirstEv>:

TCB *ThreadList::removeFirst() {
    80003278:	ff010113          	addi	sp,sp,-16
    8000327c:	00813423          	sd	s0,8(sp)
    80003280:	01010413          	addi	s0,sp,16
    if (!head) return nullptr;
    80003284:	00053703          	ld	a4,0(a0)
    80003288:	04070063          	beqz	a4,800032c8 <_ZN10ThreadList11removeFirstEv+0x50>
    8000328c:	00050793          	mv	a5,a0

    TCB *data = head->data;
    80003290:	00073503          	ld	a0,0(a4) # 8000 <_entry-0x7fff8000>

    head = head->next;
    80003294:	00873703          	ld	a4,8(a4)
    80003298:	00e7b023          	sd	a4,0(a5)
    if (head) head->prev = nullptr;
    8000329c:	02070063          	beqz	a4,800032bc <_ZN10ThreadList11removeFirstEv+0x44>
    800032a0:	00073823          	sd	zero,16(a4)
    else head = tail = nullptr;

    size--;
    800032a4:	0187a703          	lw	a4,24(a5)
    800032a8:	fff7071b          	addiw	a4,a4,-1
    800032ac:	00e7ac23          	sw	a4,24(a5)

    return data;
}
    800032b0:	00813403          	ld	s0,8(sp)
    800032b4:	01010113          	addi	sp,sp,16
    800032b8:	00008067          	ret
    else head = tail = nullptr;
    800032bc:	0007b423          	sd	zero,8(a5)
    800032c0:	0007b023          	sd	zero,0(a5)
    800032c4:	fe1ff06f          	j	800032a4 <_ZN10ThreadList11removeFirstEv+0x2c>
    if (!head) return nullptr;
    800032c8:	00070513          	mv	a0,a4
    800032cc:	fe5ff06f          	j	800032b0 <_ZN10ThreadList11removeFirstEv+0x38>

00000000800032d0 <_ZN10ThreadList10removeLastEv>:

TCB *ThreadList::removeLast() {
    800032d0:	ff010113          	addi	sp,sp,-16
    800032d4:	00813423          	sd	s0,8(sp)
    800032d8:	01010413          	addi	s0,sp,16
    if (!tail) return nullptr;
    800032dc:	00853703          	ld	a4,8(a0)
    800032e0:	04070063          	beqz	a4,80003320 <_ZN10ThreadList10removeLastEv+0x50>
    800032e4:	00050793          	mv	a5,a0

    TCB *data = tail->data;
    800032e8:	00073503          	ld	a0,0(a4)

    tail = tail->prev;
    800032ec:	01073703          	ld	a4,16(a4)
    800032f0:	00e7b423          	sd	a4,8(a5)
    if (tail) tail->next = nullptr;
    800032f4:	02070063          	beqz	a4,80003314 <_ZN10ThreadList10removeLastEv+0x44>
    800032f8:	00073423          	sd	zero,8(a4)
    else tail = head = nullptr;

    size--;
    800032fc:	0187a703          	lw	a4,24(a5)
    80003300:	fff7071b          	addiw	a4,a4,-1
    80003304:	00e7ac23          	sw	a4,24(a5)

    return data;
}
    80003308:	00813403          	ld	s0,8(sp)
    8000330c:	01010113          	addi	sp,sp,16
    80003310:	00008067          	ret
    else tail = head = nullptr;
    80003314:	0007b023          	sd	zero,0(a5)
    80003318:	0007b423          	sd	zero,8(a5)
    8000331c:	fe1ff06f          	j	800032fc <_ZN10ThreadList10removeLastEv+0x2c>
    if (!tail) return nullptr;
    80003320:	00070513          	mv	a0,a4
    80003324:	fe5ff06f          	j	80003308 <_ZN10ThreadList10removeLastEv+0x38>

0000000080003328 <_ZN10ThreadList9eraseCurrEv>:

void ThreadList::eraseCurr() {
    80003328:	ff010113          	addi	sp,sp,-16
    8000332c:	00813423          	sd	s0,8(sp)
    80003330:	01010413          	addi	s0,sp,16
    if (!curr) return;
    80003334:	01053783          	ld	a5,16(a0)
    80003338:	02078463          	beqz	a5,80003360 <_ZN10ThreadList9eraseCurrEv+0x38>

    ThreadNode *before = curr->prev, *after = curr->next;
    8000333c:	0107b703          	ld	a4,16(a5)
    80003340:	0087b783          	ld	a5,8(a5)

    if (before) before->next = after;
    80003344:	02070463          	beqz	a4,8000336c <_ZN10ThreadList9eraseCurrEv+0x44>
    80003348:	00f73423          	sd	a5,8(a4)
    else head = after;

    if (after) after->prev = before;
    8000334c:	02078463          	beqz	a5,80003374 <_ZN10ThreadList9eraseCurrEv+0x4c>
    80003350:	00e7b823          	sd	a4,16(a5)
    else tail = before;

    size--;
    80003354:	01852783          	lw	a5,24(a0)
    80003358:	fff7879b          	addiw	a5,a5,-1
    8000335c:	00f52c23          	sw	a5,24(a0)
}
    80003360:	00813403          	ld	s0,8(sp)
    80003364:	01010113          	addi	sp,sp,16
    80003368:	00008067          	ret
    else head = after;
    8000336c:	00f53023          	sd	a5,0(a0)
    80003370:	fddff06f          	j	8000334c <_ZN10ThreadList9eraseCurrEv+0x24>
    else tail = before;
    80003374:	00e53423          	sd	a4,8(a0)
    80003378:	fddff06f          	j	80003354 <_ZN10ThreadList9eraseCurrEv+0x2c>

000000008000337c <_ZN10ThreadList15insertAfterCurrEP10ThreadNode>:

void ThreadList::insertAfterCurr(ThreadNode *elem) {
    8000337c:	ff010113          	addi	sp,sp,-16
    80003380:	00813423          	sd	s0,8(sp)
    80003384:	01010413          	addi	s0,sp,16
    if (!curr) return;
    80003388:	01053783          	ld	a5,16(a0)
    8000338c:	02078663          	beqz	a5,800033b8 <_ZN10ThreadList15insertAfterCurrEP10ThreadNode+0x3c>
    ThreadNode *after = curr->next;
    80003390:	0087b783          	ld	a5,8(a5)
    elem->next = after;
    80003394:	00f5b423          	sd	a5,8(a1)
    elem->prev = curr;
    80003398:	01053703          	ld	a4,16(a0)
    8000339c:	00e5b823          	sd	a4,16(a1)
    curr->next = elem;
    800033a0:	00b73423          	sd	a1,8(a4)
    if (!after) tail = elem;
    800033a4:	02078063          	beqz	a5,800033c4 <_ZN10ThreadList15insertAfterCurrEP10ThreadNode+0x48>
    else after->prev = elem;
    800033a8:	00b7b823          	sd	a1,16(a5)
    size++;
    800033ac:	01852783          	lw	a5,24(a0)
    800033b0:	0017879b          	addiw	a5,a5,1
    800033b4:	00f52c23          	sw	a5,24(a0)
}
    800033b8:	00813403          	ld	s0,8(sp)
    800033bc:	01010113          	addi	sp,sp,16
    800033c0:	00008067          	ret
    if (!after) tail = elem;
    800033c4:	00b53423          	sd	a1,8(a0)
    800033c8:	fe5ff06f          	j	800033ac <_ZN10ThreadList15insertAfterCurrEP10ThreadNode+0x30>

00000000800033cc <_ZN10ThreadList16insertBeforeCurrEP10ThreadNode>:

void ThreadList::insertBeforeCurr(ThreadNode *elem) {
    800033cc:	ff010113          	addi	sp,sp,-16
    800033d0:	00813423          	sd	s0,8(sp)
    800033d4:	01010413          	addi	s0,sp,16
    if (!curr) return;
    800033d8:	01053783          	ld	a5,16(a0)
    800033dc:	02078663          	beqz	a5,80003408 <_ZN10ThreadList16insertBeforeCurrEP10ThreadNode+0x3c>
    ThreadNode *before = curr->prev;
    800033e0:	0107b703          	ld	a4,16(a5)
    elem->next = curr;
    800033e4:	00f5b423          	sd	a5,8(a1)
    elem->prev = before;
    800033e8:	00e5b823          	sd	a4,16(a1)
    curr->prev = elem;
    800033ec:	01053783          	ld	a5,16(a0)
    800033f0:	00b7b823          	sd	a1,16(a5)
    if (!before) head = elem;
    800033f4:	02070063          	beqz	a4,80003414 <_ZN10ThreadList16insertBeforeCurrEP10ThreadNode+0x48>
    else before->next = elem;
    800033f8:	00b73423          	sd	a1,8(a4)
    size++;
    800033fc:	01852783          	lw	a5,24(a0)
    80003400:	0017879b          	addiw	a5,a5,1
    80003404:	00f52c23          	sw	a5,24(a0)
}
    80003408:	00813403          	ld	s0,8(sp)
    8000340c:	01010113          	addi	sp,sp,16
    80003410:	00008067          	ret
    if (!before) head = elem;
    80003414:	00b53023          	sd	a1,0(a0)
    80003418:	fe5ff06f          	j	800033fc <_ZN10ThreadList16insertBeforeCurrEP10ThreadNode+0x30>

000000008000341c <_ZN10ThreadListD1Ev>:

ThreadList::~ThreadList() {
    8000341c:	ff010113          	addi	sp,sp,-16
    80003420:	00813423          	sd	s0,8(sp)
    80003424:	01010413          	addi	s0,sp,16
    head = nullptr;
    tail = nullptr;
    curr = nullptr;
    size = 0;
}
    80003428:	00813403          	ld	s0,8(sp)
    8000342c:	01010113          	addi	sp,sp,16
    80003430:	00008067          	ret

0000000080003434 <_ZN14TimerInterrupt11getInstanceEv>:
#include "../h/SysPrint.h"

TimerInterrupt *TimerInterrupt::instance = nullptr;

TimerInterrupt *TimerInterrupt::getInstance() {
    if (!instance) instance = new TimerInterrupt;
    80003434:	00007797          	auipc	a5,0x7
    80003438:	a4c7b783          	ld	a5,-1460(a5) # 80009e80 <_ZN14TimerInterrupt8instanceE>
    8000343c:	00078863          	beqz	a5,8000344c <_ZN14TimerInterrupt11getInstanceEv+0x18>
    return instance;
}
    80003440:	00007517          	auipc	a0,0x7
    80003444:	a4053503          	ld	a0,-1472(a0) # 80009e80 <_ZN14TimerInterrupt8instanceE>
    80003448:	00008067          	ret
TimerInterrupt *TimerInterrupt::getInstance() {
    8000344c:	ff010113          	addi	sp,sp,-16
    80003450:	00113423          	sd	ra,8(sp)
    80003454:	00813023          	sd	s0,0(sp)
    80003458:	01010413          	addi	s0,sp,16
        return kmalloc(size);
    8000345c:	05800513          	li	a0,88
    80003460:	fffff097          	auipc	ra,0xfffff
    80003464:	a54080e7          	jalr	-1452(ra) # 80001eb4 <_Z7kmallocm>
    80003468:	00100793          	li	a5,1
    8000346c:	00f52423          	sw	a5,8(a0)
    explicit ThreadList() = default;
    80003470:	00053823          	sd	zero,16(a0)
    80003474:	00053c23          	sd	zero,24(a0)
    80003478:	02053023          	sd	zero,32(a0)
    8000347c:	02052423          	sw	zero,40(a0)
    80003480:	02053823          	sd	zero,48(a0)
    80003484:	02053c23          	sd	zero,56(a0)
    80003488:	04053023          	sd	zero,64(a0)
    8000348c:	04053423          	sd	zero,72(a0)
    80003490:	04052823          	sw	zero,80(a0)
    if (!instance) instance = new TimerInterrupt;
    80003494:	00007797          	auipc	a5,0x7
    80003498:	9ea7b623          	sd	a0,-1556(a5) # 80009e80 <_ZN14TimerInterrupt8instanceE>
}
    8000349c:	00007517          	auipc	a0,0x7
    800034a0:	9e453503          	ld	a0,-1564(a0) # 80009e80 <_ZN14TimerInterrupt8instanceE>
    800034a4:	00813083          	ld	ra,8(sp)
    800034a8:	00013403          	ld	s0,0(sp)
    800034ac:	01010113          	addi	sp,sp,16
    800034b0:	00008067          	ret

00000000800034b4 <_ZN14TimerInterrupt5blockEP3TCBm>:

void TimerInterrupt::block(TCB *tcb, time_t time) {
    800034b4:	fd010113          	addi	sp,sp,-48
    800034b8:	02113423          	sd	ra,40(sp)
    800034bc:	02813023          	sd	s0,32(sp)
    800034c0:	00913c23          	sd	s1,24(sp)
    800034c4:	01213823          	sd	s2,16(sp)
    800034c8:	01313423          	sd	s3,8(sp)
    800034cc:	01413023          	sd	s4,0(sp)
    800034d0:	03010413          	addi	s0,sp,48
    800034d4:	00050993          	mv	s3,a0
    800034d8:	00058913          	mv	s2,a1
    ThreadList *blockedThreads = &getInstance()->blockedThreadList;
    800034dc:	00000097          	auipc	ra,0x0
    800034e0:	f58080e7          	jalr	-168(ra) # 80003434 <_ZN14TimerInterrupt11getInstanceEv>
    800034e4:	00050493          	mv	s1,a0
    800034e8:	03850a13          	addi	s4,a0,56

    instance->mutex.wait();
    800034ec:	00007517          	auipc	a0,0x7
    800034f0:	99453503          	ld	a0,-1644(a0) # 80009e80 <_ZN14TimerInterrupt8instanceE>
    800034f4:	00850513          	addi	a0,a0,8
    800034f8:	fffff097          	auipc	ra,0xfffff
    800034fc:	a3c080e7          	jalr	-1476(ra) # 80001f34 <_ZN5Mutex4waitEv>
        curr = head;
    80003500:	0384b783          	ld	a5,56(s1)
    80003504:	04f4b423          	sd	a5,72(s1)
        return curr != nullptr;
    80003508:	0484b783          	ld	a5,72(s1)

    for (blockedThreads->toHead(); blockedThreads->hasCurr(); blockedThreads->toNext()) {
    8000350c:	02078863          	beqz	a5,8000353c <_ZN14TimerInterrupt5blockEP3TCBm+0x88>
    }

    TCB *getCurr() {
        if (!curr) return nullptr;
        return curr->data;
    80003510:	0007b703          	ld	a4,0(a5)
        return blockedTime;
    80003514:	0b873703          	ld	a4,184(a4)
        time_t currTime = blockedThreads->getCurr()->getBlockedTime();
        if (time >= currTime) {
    80003518:	00e96a63          	bltu	s2,a4,8000352c <_ZN14TimerInterrupt5blockEP3TCBm+0x78>
            time -= currTime;
    8000351c:	40e90933          	sub	s2,s2,a4
        if (curr) curr = curr->next;
    80003520:	0087b783          	ld	a5,8(a5)
    80003524:	04f4b423          	sd	a5,72(s1)
    }
    80003528:	fe1ff06f          	j	80003508 <_ZN14TimerInterrupt5blockEP3TCBm+0x54>
        } else {
            blockedThreads->insertBeforeCurr(tcb->getNode());
    8000352c:	0a098593          	addi	a1,s3,160
    80003530:	000a0513          	mv	a0,s4
    80003534:	00000097          	auipc	ra,0x0
    80003538:	e98080e7          	jalr	-360(ra) # 800033cc <_ZN10ThreadList16insertBeforeCurrEP10ThreadNode>
        return curr != nullptr;
    8000353c:	0484b783          	ld	a5,72(s1)
            break;
        }
    }

    // insert at end
    if (!blockedThreads->hasCurr()) blockedThreads->addLast(tcb->getNode());
    80003540:	02078863          	beqz	a5,80003570 <_ZN14TimerInterrupt5blockEP3TCBm+0xbc>
    80003544:	0484b783          	ld	a5,72(s1)

    // updating relative time for blocked threads after currently inserted
    while (blockedThreads->hasCurr()) {
    80003548:	02078e63          	beqz	a5,80003584 <_ZN14TimerInterrupt5blockEP3TCBm+0xd0>
        return curr->data;
    8000354c:	0007b703          	ld	a4,0(a5)
        this->blockedTime -= time;
    80003550:	0b873783          	ld	a5,184(a4)
    80003554:	412787b3          	sub	a5,a5,s2
    80003558:	0af73c23          	sd	a5,184(a4)
        if (curr) curr = curr->next;
    8000355c:	0484b783          	ld	a5,72(s1)
    80003560:	fe0782e3          	beqz	a5,80003544 <_ZN14TimerInterrupt5blockEP3TCBm+0x90>
    80003564:	0087b783          	ld	a5,8(a5)
    80003568:	04f4b423          	sd	a5,72(s1)
    8000356c:	fd9ff06f          	j	80003544 <_ZN14TimerInterrupt5blockEP3TCBm+0x90>
    if (!blockedThreads->hasCurr()) blockedThreads->addLast(tcb->getNode());
    80003570:	0a098593          	addi	a1,s3,160
    80003574:	000a0513          	mv	a0,s4
    80003578:	00000097          	auipc	ra,0x0
    8000357c:	cbc080e7          	jalr	-836(ra) # 80003234 <_ZN10ThreadList7addLastEP10ThreadNode>
    80003580:	fc5ff06f          	j	80003544 <_ZN14TimerInterrupt5blockEP3TCBm+0x90>
        blockedThreads->getCurr()->decBlockedTime(time);
        blockedThreads->toNext();
    }

    instance->mutex.signal();
    80003584:	00007517          	auipc	a0,0x7
    80003588:	8fc53503          	ld	a0,-1796(a0) # 80009e80 <_ZN14TimerInterrupt8instanceE>
    8000358c:	00850513          	addi	a0,a0,8
    80003590:	fffff097          	auipc	ra,0xfffff
    80003594:	a18080e7          	jalr	-1512(ra) # 80001fa8 <_ZN5Mutex6signalEv>
        this->blockedTime = blockedTime;
    80003598:	0b29bc23          	sd	s2,184(s3)
        status = BLOCKED;
    8000359c:	00200793          	li	a5,2
    800035a0:	04f9a023          	sw	a5,64(s3)

    tcb->setBlockedTime(time);
    tcb->setBlocked();
    tcb->dispatch();
    800035a4:	fffff097          	auipc	ra,0xfffff
    800035a8:	630080e7          	jalr	1584(ra) # 80002bd4 <_ZN3TCB8dispatchEv>
}
    800035ac:	02813083          	ld	ra,40(sp)
    800035b0:	02013403          	ld	s0,32(sp)
    800035b4:	01813483          	ld	s1,24(sp)
    800035b8:	01013903          	ld	s2,16(sp)
    800035bc:	00813983          	ld	s3,8(sp)
    800035c0:	00013a03          	ld	s4,0(sp)
    800035c4:	03010113          	addi	sp,sp,48
    800035c8:	00008067          	ret

00000000800035cc <_ZN14TimerInterrupt4tickEv>:

void TimerInterrupt::tick() {
    800035cc:	fd010113          	addi	sp,sp,-48
    800035d0:	02113423          	sd	ra,40(sp)
    800035d4:	02813023          	sd	s0,32(sp)
    800035d8:	00913c23          	sd	s1,24(sp)
    800035dc:	01213823          	sd	s2,16(sp)
    800035e0:	01313423          	sd	s3,8(sp)
    800035e4:	03010413          	addi	s0,sp,48
    ThreadList *blockedThreads = &getInstance()->blockedThreadList;
    800035e8:	00000097          	auipc	ra,0x0
    800035ec:	e4c080e7          	jalr	-436(ra) # 80003434 <_ZN14TimerInterrupt11getInstanceEv>
    800035f0:	00050913          	mv	s2,a0
    800035f4:	03850993          	addi	s3,a0,56

    TCB *tcb;

    instance->mutex.wait();
    800035f8:	00007517          	auipc	a0,0x7
    800035fc:	88853503          	ld	a0,-1912(a0) # 80009e80 <_ZN14TimerInterrupt8instanceE>
    80003600:	00850513          	addi	a0,a0,8
    80003604:	fffff097          	auipc	ra,0xfffff
    80003608:	930080e7          	jalr	-1744(ra) # 80001f34 <_ZN5Mutex4waitEv>
    8000360c:	01c0006f          	j	80003628 <_ZN14TimerInterrupt4tickEv+0x5c>
        status = READY;
    80003610:	0404a023          	sw	zero,64(s1)

    while ((tcb = blockedThreads->getFirst()) && !tcb->getBlockedTime()) {
        tcb->setReady();
        Scheduler::put(blockedThreads->removeFirst());
    80003614:	00098513          	mv	a0,s3
    80003618:	00000097          	auipc	ra,0x0
    8000361c:	c60080e7          	jalr	-928(ra) # 80003278 <_ZN10ThreadList11removeFirstEv>
    80003620:	fffff097          	auipc	ra,0xfffff
    80003624:	d48080e7          	jalr	-696(ra) # 80002368 <_ZN9Scheduler3putEP3TCB>
        if (!head) return nullptr;
    80003628:	03893483          	ld	s1,56(s2)
    8000362c:	00048a63          	beqz	s1,80003640 <_ZN14TimerInterrupt4tickEv+0x74>
        return head->data;
    80003630:	0004b483          	ld	s1,0(s1)
    while ((tcb = blockedThreads->getFirst()) && !tcb->getBlockedTime()) {
    80003634:	00048663          	beqz	s1,80003640 <_ZN14TimerInterrupt4tickEv+0x74>
        return blockedTime;
    80003638:	0b84b783          	ld	a5,184(s1)
    8000363c:	fc078ae3          	beqz	a5,80003610 <_ZN14TimerInterrupt4tickEv+0x44>
    }

    instance->mutex.signal();
    80003640:	00007517          	auipc	a0,0x7
    80003644:	84053503          	ld	a0,-1984(a0) # 80009e80 <_ZN14TimerInterrupt8instanceE>
    80003648:	00850513          	addi	a0,a0,8
    8000364c:	fffff097          	auipc	ra,0xfffff
    80003650:	95c080e7          	jalr	-1700(ra) # 80001fa8 <_ZN5Mutex6signalEv>

    if (!tcb) return;
    80003654:	00048863          	beqz	s1,80003664 <_ZN14TimerInterrupt4tickEv+0x98>
        this->blockedTime -= time;
    80003658:	0b84b783          	ld	a5,184(s1)
    8000365c:	fff78793          	addi	a5,a5,-1
    80003660:	0af4bc23          	sd	a5,184(s1)
    tcb->decBlockedTime();
}
    80003664:	02813083          	ld	ra,40(sp)
    80003668:	02013403          	ld	s0,32(sp)
    8000366c:	01813483          	ld	s1,24(sp)
    80003670:	01013903          	ld	s2,16(sp)
    80003674:	00813983          	ld	s3,8(sp)
    80003678:	03010113          	addi	sp,sp,48
    8000367c:	00008067          	ret

0000000080003680 <_ZN14TimerInterruptD1Ev>:

TimerInterrupt::~TimerInterrupt() {
    80003680:	fe010113          	addi	sp,sp,-32
    80003684:	00113c23          	sd	ra,24(sp)
    80003688:	00813823          	sd	s0,16(sp)
    8000368c:	00913423          	sd	s1,8(sp)
    80003690:	01213023          	sd	s2,0(sp)
    80003694:	02010413          	addi	s0,sp,32
    80003698:	00050913          	mv	s2,a0
        return size == 0;
    8000369c:	05092783          	lw	a5,80(s2)
    while (!blockedThreadList.isEmpty()) {
    800036a0:	02078863          	beqz	a5,800036d0 <_ZN14TimerInterruptD1Ev+0x50>
//        kprintString("Timer deleting...\n");
        delete blockedThreadList.removeFirst();
    800036a4:	03890513          	addi	a0,s2,56
    800036a8:	00000097          	auipc	ra,0x0
    800036ac:	bd0080e7          	jalr	-1072(ra) # 80003278 <_ZN10ThreadList11removeFirstEv>
    800036b0:	00050493          	mv	s1,a0
    800036b4:	fe0504e3          	beqz	a0,8000369c <_ZN14TimerInterruptD1Ev+0x1c>
    800036b8:	fffff097          	auipc	ra,0xfffff
    800036bc:	74c080e7          	jalr	1868(ra) # 80002e04 <_ZN3TCBD1Ev>
        kfree(addr);
    800036c0:	00048513          	mv	a0,s1
    800036c4:	fffff097          	auipc	ra,0xfffff
    800036c8:	830080e7          	jalr	-2000(ra) # 80001ef4 <_Z5kfreePv>
    }
    800036cc:	fd1ff06f          	j	8000369c <_ZN14TimerInterruptD1Ev+0x1c>
TimerInterrupt::~TimerInterrupt() {
    800036d0:	03890513          	addi	a0,s2,56
    800036d4:	00000097          	auipc	ra,0x0
    800036d8:	d48080e7          	jalr	-696(ra) # 8000341c <_ZN10ThreadListD1Ev>
    800036dc:	00890513          	addi	a0,s2,8
    800036e0:	ffffe097          	auipc	ra,0xffffe
    800036e4:	234080e7          	jalr	564(ra) # 80001914 <_ZN15KernelSemaphoreD1Ev>
    }
}
    800036e8:	01813083          	ld	ra,24(sp)
    800036ec:	01013403          	ld	s0,16(sp)
    800036f0:	00813483          	ld	s1,8(sp)
    800036f4:	00013903          	ld	s2,0(sp)
    800036f8:	02010113          	addi	sp,sp,32
    800036fc:	00008067          	ret

0000000080003700 <_ZN6BufferC1Ei>:
#include "buffer.hpp"
#include "../h/syscall_c.h"
//#include "../h/std.h"


Buffer::Buffer(int _cap) : cap(_cap), head(0), tail(0) {
    80003700:	fe010113          	addi	sp,sp,-32
    80003704:	00113c23          	sd	ra,24(sp)
    80003708:	00813823          	sd	s0,16(sp)
    8000370c:	00913423          	sd	s1,8(sp)
    80003710:	02010413          	addi	s0,sp,32
    80003714:	00050493          	mv	s1,a0
    80003718:	00b52023          	sw	a1,0(a0)
    8000371c:	00052823          	sw	zero,16(a0)
    80003720:	00052a23          	sw	zero,20(a0)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80003724:	00259513          	slli	a0,a1,0x2
    80003728:	fffff097          	auipc	ra,0xfffff
    8000372c:	d48080e7          	jalr	-696(ra) # 80002470 <_Z9mem_allocm>
    80003730:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80003734:	00000593          	li	a1,0
    80003738:	02048513          	addi	a0,s1,32
    8000373c:	fffff097          	auipc	ra,0xfffff
    80003740:	e80080e7          	jalr	-384(ra) # 800025bc <_Z8sem_openPP4_semj>
    sem_open(&spaceAvailable, cap);
    80003744:	0004a583          	lw	a1,0(s1)
    80003748:	01848513          	addi	a0,s1,24
    8000374c:	fffff097          	auipc	ra,0xfffff
    80003750:	e70080e7          	jalr	-400(ra) # 800025bc <_Z8sem_openPP4_semj>
    sem_open(&mutexHead, 1);
    80003754:	00100593          	li	a1,1
    80003758:	02848513          	addi	a0,s1,40
    8000375c:	fffff097          	auipc	ra,0xfffff
    80003760:	e60080e7          	jalr	-416(ra) # 800025bc <_Z8sem_openPP4_semj>
    sem_open(&mutexTail, 1);
    80003764:	00100593          	li	a1,1
    80003768:	03048513          	addi	a0,s1,48
    8000376c:	fffff097          	auipc	ra,0xfffff
    80003770:	e50080e7          	jalr	-432(ra) # 800025bc <_Z8sem_openPP4_semj>
}
    80003774:	01813083          	ld	ra,24(sp)
    80003778:	01013403          	ld	s0,16(sp)
    8000377c:	00813483          	ld	s1,8(sp)
    80003780:	02010113          	addi	sp,sp,32
    80003784:	00008067          	ret

0000000080003788 <_ZN6BufferD1Ev>:

Buffer::~Buffer() {
    80003788:	fe010113          	addi	sp,sp,-32
    8000378c:	00113c23          	sd	ra,24(sp)
    80003790:	00813823          	sd	s0,16(sp)
    80003794:	00913423          	sd	s1,8(sp)
    80003798:	02010413          	addi	s0,sp,32
    8000379c:	00050493          	mv	s1,a0
    putc('\n');
    800037a0:	00a00513          	li	a0,10
    800037a4:	fffff097          	auipc	ra,0xfffff
    800037a8:	f94080e7          	jalr	-108(ra) # 80002738 <_Z4putcc>
//    printf("Buffer deleted!\n");
    while (head != tail) {
    800037ac:	0104a783          	lw	a5,16(s1)
    800037b0:	0144a703          	lw	a4,20(s1)
    800037b4:	00e78c63          	beq	a5,a4,800037cc <_ZN6BufferD1Ev+0x44>
//        printf("%c ", buffer[head]);
        head = (head + 1) % cap;
    800037b8:	0017879b          	addiw	a5,a5,1
    800037bc:	0004a703          	lw	a4,0(s1)
    800037c0:	02e7e7bb          	remw	a5,a5,a4
    800037c4:	00f4a823          	sw	a5,16(s1)
    while (head != tail) {
    800037c8:	fe5ff06f          	j	800037ac <_ZN6BufferD1Ev+0x24>
    }
    putc('!');
    800037cc:	02100513          	li	a0,33
    800037d0:	fffff097          	auipc	ra,0xfffff
    800037d4:	f68080e7          	jalr	-152(ra) # 80002738 <_Z4putcc>
    putc('\n');
    800037d8:	00a00513          	li	a0,10
    800037dc:	fffff097          	auipc	ra,0xfffff
    800037e0:	f5c080e7          	jalr	-164(ra) # 80002738 <_Z4putcc>

    mem_free(buffer);
    800037e4:	0084b503          	ld	a0,8(s1)
    800037e8:	fffff097          	auipc	ra,0xfffff
    800037ec:	cbc080e7          	jalr	-836(ra) # 800024a4 <_Z8mem_freePv>
    sem_close(itemAvailable);
    800037f0:	0204b503          	ld	a0,32(s1)
    800037f4:	fffff097          	auipc	ra,0xfffff
    800037f8:	e40080e7          	jalr	-448(ra) # 80002634 <_Z9sem_closeP4_sem>
    sem_close(spaceAvailable);
    800037fc:	0184b503          	ld	a0,24(s1)
    80003800:	fffff097          	auipc	ra,0xfffff
    80003804:	e34080e7          	jalr	-460(ra) # 80002634 <_Z9sem_closeP4_sem>
    sem_close(mutexTail);
    80003808:	0304b503          	ld	a0,48(s1)
    8000380c:	fffff097          	auipc	ra,0xfffff
    80003810:	e28080e7          	jalr	-472(ra) # 80002634 <_Z9sem_closeP4_sem>
    sem_close(mutexHead);
    80003814:	0284b503          	ld	a0,40(s1)
    80003818:	fffff097          	auipc	ra,0xfffff
    8000381c:	e1c080e7          	jalr	-484(ra) # 80002634 <_Z9sem_closeP4_sem>
}
    80003820:	01813083          	ld	ra,24(sp)
    80003824:	01013403          	ld	s0,16(sp)
    80003828:	00813483          	ld	s1,8(sp)
    8000382c:	02010113          	addi	sp,sp,32
    80003830:	00008067          	ret

0000000080003834 <_ZN6Buffer3putEi>:

void Buffer::put(int val) {
    80003834:	fe010113          	addi	sp,sp,-32
    80003838:	00113c23          	sd	ra,24(sp)
    8000383c:	00813823          	sd	s0,16(sp)
    80003840:	00913423          	sd	s1,8(sp)
    80003844:	01213023          	sd	s2,0(sp)
    80003848:	02010413          	addi	s0,sp,32
    8000384c:	00050493          	mv	s1,a0
    80003850:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80003854:	01853503          	ld	a0,24(a0)
    80003858:	fffff097          	auipc	ra,0xfffff
    8000385c:	e10080e7          	jalr	-496(ra) # 80002668 <_Z8sem_waitP4_sem>

    sem_wait(mutexTail);
    80003860:	0304b503          	ld	a0,48(s1)
    80003864:	fffff097          	auipc	ra,0xfffff
    80003868:	e04080e7          	jalr	-508(ra) # 80002668 <_Z8sem_waitP4_sem>
    buffer[tail] = val;
    8000386c:	0084b783          	ld	a5,8(s1)
    80003870:	0144a703          	lw	a4,20(s1)
    80003874:	00271713          	slli	a4,a4,0x2
    80003878:	00e787b3          	add	a5,a5,a4
    8000387c:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80003880:	0144a783          	lw	a5,20(s1)
    80003884:	0017879b          	addiw	a5,a5,1
    80003888:	0004a703          	lw	a4,0(s1)
    8000388c:	02e7e7bb          	remw	a5,a5,a4
    80003890:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80003894:	0304b503          	ld	a0,48(s1)
    80003898:	fffff097          	auipc	ra,0xfffff
    8000389c:	e04080e7          	jalr	-508(ra) # 8000269c <_Z10sem_signalP4_sem>

    sem_signal(itemAvailable);
    800038a0:	0204b503          	ld	a0,32(s1)
    800038a4:	fffff097          	auipc	ra,0xfffff
    800038a8:	df8080e7          	jalr	-520(ra) # 8000269c <_Z10sem_signalP4_sem>

}
    800038ac:	01813083          	ld	ra,24(sp)
    800038b0:	01013403          	ld	s0,16(sp)
    800038b4:	00813483          	ld	s1,8(sp)
    800038b8:	00013903          	ld	s2,0(sp)
    800038bc:	02010113          	addi	sp,sp,32
    800038c0:	00008067          	ret

00000000800038c4 <_ZN6Buffer3getEv>:

int Buffer::get() {
    800038c4:	fe010113          	addi	sp,sp,-32
    800038c8:	00113c23          	sd	ra,24(sp)
    800038cc:	00813823          	sd	s0,16(sp)
    800038d0:	00913423          	sd	s1,8(sp)
    800038d4:	01213023          	sd	s2,0(sp)
    800038d8:	02010413          	addi	s0,sp,32
    800038dc:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    800038e0:	02053503          	ld	a0,32(a0)
    800038e4:	fffff097          	auipc	ra,0xfffff
    800038e8:	d84080e7          	jalr	-636(ra) # 80002668 <_Z8sem_waitP4_sem>

    sem_wait(mutexHead);
    800038ec:	0284b503          	ld	a0,40(s1)
    800038f0:	fffff097          	auipc	ra,0xfffff
    800038f4:	d78080e7          	jalr	-648(ra) # 80002668 <_Z8sem_waitP4_sem>

    int ret = buffer[head];
    800038f8:	0084b703          	ld	a4,8(s1)
    800038fc:	0104a783          	lw	a5,16(s1)
    80003900:	00279693          	slli	a3,a5,0x2
    80003904:	00d70733          	add	a4,a4,a3
    80003908:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    8000390c:	0017879b          	addiw	a5,a5,1
    80003910:	0004a703          	lw	a4,0(s1)
    80003914:	02e7e7bb          	remw	a5,a5,a4
    80003918:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    8000391c:	0284b503          	ld	a0,40(s1)
    80003920:	fffff097          	auipc	ra,0xfffff
    80003924:	d7c080e7          	jalr	-644(ra) # 8000269c <_Z10sem_signalP4_sem>

    sem_signal(spaceAvailable);
    80003928:	0184b503          	ld	a0,24(s1)
    8000392c:	fffff097          	auipc	ra,0xfffff
    80003930:	d70080e7          	jalr	-656(ra) # 8000269c <_Z10sem_signalP4_sem>

    return ret;
}
    80003934:	00090513          	mv	a0,s2
    80003938:	01813083          	ld	ra,24(sp)
    8000393c:	01013403          	ld	s0,16(sp)
    80003940:	00813483          	ld	s1,8(sp)
    80003944:	00013903          	ld	s2,0(sp)
    80003948:	02010113          	addi	sp,sp,32
    8000394c:	00008067          	ret

0000000080003950 <_ZL8printIntiii>:
}

static char digits[] = "0123456789ABCDEF";

static void printInt(int xx, int base=10, int sgn=0)
{
    80003950:	fc010113          	addi	sp,sp,-64
    80003954:	02113c23          	sd	ra,56(sp)
    80003958:	02813823          	sd	s0,48(sp)
    8000395c:	02913423          	sd	s1,40(sp)
    80003960:	03213023          	sd	s2,32(sp)
    80003964:	01313c23          	sd	s3,24(sp)
    80003968:	04010413          	addi	s0,sp,64
    8000396c:	00050493          	mv	s1,a0
    80003970:	00058913          	mv	s2,a1
    80003974:	00060993          	mv	s3,a2
    LOCK();
    80003978:	00100613          	li	a2,1
    8000397c:	00000593          	li	a1,0
    80003980:	00006517          	auipc	a0,0x6
    80003984:	50850513          	addi	a0,a0,1288 # 80009e88 <lockPrint>
    80003988:	ffffd097          	auipc	ra,0xffffd
    8000398c:	7f8080e7          	jalr	2040(ra) # 80001180 <copy_and_swap>
    80003990:	fe0514e3          	bnez	a0,80003978 <_ZL8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80003994:	00098463          	beqz	s3,8000399c <_ZL8printIntiii+0x4c>
    80003998:	0804c463          	bltz	s1,80003a20 <_ZL8printIntiii+0xd0>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    8000399c:	0004851b          	sext.w	a0,s1
    neg = 0;
    800039a0:	00000593          	li	a1,0
    }

    i = 0;
    800039a4:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    800039a8:	0009079b          	sext.w	a5,s2
    800039ac:	0325773b          	remuw	a4,a0,s2
    800039b0:	00048613          	mv	a2,s1
    800039b4:	0014849b          	addiw	s1,s1,1
    800039b8:	02071693          	slli	a3,a4,0x20
    800039bc:	0206d693          	srli	a3,a3,0x20
    800039c0:	00005717          	auipc	a4,0x5
    800039c4:	b0870713          	addi	a4,a4,-1272 # 800084c8 <_ZL6digits>
    800039c8:	00d70733          	add	a4,a4,a3
    800039cc:	00074683          	lbu	a3,0(a4)
    800039d0:	fd040713          	addi	a4,s0,-48
    800039d4:	00c70733          	add	a4,a4,a2
    800039d8:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    800039dc:	0005071b          	sext.w	a4,a0
    800039e0:	0325553b          	divuw	a0,a0,s2
    800039e4:	fcf772e3          	bgeu	a4,a5,800039a8 <_ZL8printIntiii+0x58>
    if(neg)
    800039e8:	00058c63          	beqz	a1,80003a00 <_ZL8printIntiii+0xb0>
        buf[i++] = '-';
    800039ec:	fd040793          	addi	a5,s0,-48
    800039f0:	009784b3          	add	s1,a5,s1
    800039f4:	02d00793          	li	a5,45
    800039f8:	fef48823          	sb	a5,-16(s1)
    800039fc:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80003a00:	fff4849b          	addiw	s1,s1,-1
    80003a04:	0204c463          	bltz	s1,80003a2c <_ZL8printIntiii+0xdc>
        putc(buf[i]);
    80003a08:	fd040793          	addi	a5,s0,-48
    80003a0c:	009787b3          	add	a5,a5,s1
    80003a10:	ff07c503          	lbu	a0,-16(a5)
    80003a14:	fffff097          	auipc	ra,0xfffff
    80003a18:	d24080e7          	jalr	-732(ra) # 80002738 <_Z4putcc>
    80003a1c:	fe5ff06f          	j	80003a00 <_ZL8printIntiii+0xb0>
        x = -xx;
    80003a20:	4090053b          	negw	a0,s1
        neg = 1;
    80003a24:	00100593          	li	a1,1
        x = -xx;
    80003a28:	f7dff06f          	j	800039a4 <_ZL8printIntiii+0x54>

    UNLOCK();
    80003a2c:	00000613          	li	a2,0
    80003a30:	00100593          	li	a1,1
    80003a34:	00006517          	auipc	a0,0x6
    80003a38:	45450513          	addi	a0,a0,1108 # 80009e88 <lockPrint>
    80003a3c:	ffffd097          	auipc	ra,0xffffd
    80003a40:	744080e7          	jalr	1860(ra) # 80001180 <copy_and_swap>
    80003a44:	fe0514e3          	bnez	a0,80003a2c <_ZL8printIntiii+0xdc>
}
    80003a48:	03813083          	ld	ra,56(sp)
    80003a4c:	03013403          	ld	s0,48(sp)
    80003a50:	02813483          	ld	s1,40(sp)
    80003a54:	02013903          	ld	s2,32(sp)
    80003a58:	01813983          	ld	s3,24(sp)
    80003a5c:	04010113          	addi	sp,sp,64
    80003a60:	00008067          	ret

0000000080003a64 <_Z16producerKeyboardPv>:
    sem_t wait;
};

volatile int threadEnd = 0;

void producerKeyboard(void *arg) {
    80003a64:	fe010113          	addi	sp,sp,-32
    80003a68:	00113c23          	sd	ra,24(sp)
    80003a6c:	00813823          	sd	s0,16(sp)
    80003a70:	00913423          	sd	s1,8(sp)
    80003a74:	01213023          	sd	s2,0(sp)
    80003a78:	02010413          	addi	s0,sp,32
    80003a7c:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80003a80:	00000913          	li	s2,0
    80003a84:	00c0006f          	j	80003a90 <_Z16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003a88:	fffff097          	auipc	ra,0xfffff
    80003a8c:	b04080e7          	jalr	-1276(ra) # 8000258c <_Z15thread_dispatchv>
    while ((key = getc()) != 0x1b) {
    80003a90:	fffff097          	auipc	ra,0xfffff
    80003a94:	c74080e7          	jalr	-908(ra) # 80002704 <_Z4getcv>
    80003a98:	0005059b          	sext.w	a1,a0
    80003a9c:	01b00793          	li	a5,27
    80003aa0:	02f58a63          	beq	a1,a5,80003ad4 <_Z16producerKeyboardPv+0x70>
        data->buffer->put(key);
    80003aa4:	0084b503          	ld	a0,8(s1)
    80003aa8:	00000097          	auipc	ra,0x0
    80003aac:	d8c080e7          	jalr	-628(ra) # 80003834 <_ZN6Buffer3putEi>
        i++;
    80003ab0:	0019071b          	addiw	a4,s2,1
    80003ab4:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003ab8:	0004a683          	lw	a3,0(s1)
    80003abc:	0026979b          	slliw	a5,a3,0x2
    80003ac0:	00d787bb          	addw	a5,a5,a3
    80003ac4:	0017979b          	slliw	a5,a5,0x1
    80003ac8:	02f767bb          	remw	a5,a4,a5
    80003acc:	fc0792e3          	bnez	a5,80003a90 <_Z16producerKeyboardPv+0x2c>
    80003ad0:	fb9ff06f          	j	80003a88 <_Z16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    80003ad4:	00100793          	li	a5,1
    80003ad8:	00006717          	auipc	a4,0x6
    80003adc:	3af72c23          	sw	a5,952(a4) # 80009e90 <threadEnd>

    delete data->buffer;
    80003ae0:	0084b903          	ld	s2,8(s1)
    80003ae4:	00090e63          	beqz	s2,80003b00 <_Z16producerKeyboardPv+0x9c>
    80003ae8:	00090513          	mv	a0,s2
    80003aec:	00000097          	auipc	ra,0x0
    80003af0:	c9c080e7          	jalr	-868(ra) # 80003788 <_ZN6BufferD1Ev>
    80003af4:	00090513          	mv	a0,s2
    80003af8:	fffff097          	auipc	ra,0xfffff
    80003afc:	cc0080e7          	jalr	-832(ra) # 800027b8 <_ZdlPv>

    sem_signal(data->wait);
    80003b00:	0104b503          	ld	a0,16(s1)
    80003b04:	fffff097          	auipc	ra,0xfffff
    80003b08:	b98080e7          	jalr	-1128(ra) # 8000269c <_Z10sem_signalP4_sem>
}
    80003b0c:	01813083          	ld	ra,24(sp)
    80003b10:	01013403          	ld	s0,16(sp)
    80003b14:	00813483          	ld	s1,8(sp)
    80003b18:	00013903          	ld	s2,0(sp)
    80003b1c:	02010113          	addi	sp,sp,32
    80003b20:	00008067          	ret

0000000080003b24 <_Z8producerPv>:

void producer(void *arg) {
    80003b24:	fe010113          	addi	sp,sp,-32
    80003b28:	00113c23          	sd	ra,24(sp)
    80003b2c:	00813823          	sd	s0,16(sp)
    80003b30:	00913423          	sd	s1,8(sp)
    80003b34:	01213023          	sd	s2,0(sp)
    80003b38:	02010413          	addi	s0,sp,32
    80003b3c:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003b40:	00000913          	li	s2,0
    80003b44:	00c0006f          	j	80003b50 <_Z8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003b48:	fffff097          	auipc	ra,0xfffff
    80003b4c:	a44080e7          	jalr	-1468(ra) # 8000258c <_Z15thread_dispatchv>
    while (!threadEnd) {
    80003b50:	00006797          	auipc	a5,0x6
    80003b54:	3407a783          	lw	a5,832(a5) # 80009e90 <threadEnd>
    80003b58:	02079e63          	bnez	a5,80003b94 <_Z8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80003b5c:	0004a583          	lw	a1,0(s1)
    80003b60:	0305859b          	addiw	a1,a1,48
    80003b64:	0084b503          	ld	a0,8(s1)
    80003b68:	00000097          	auipc	ra,0x0
    80003b6c:	ccc080e7          	jalr	-820(ra) # 80003834 <_ZN6Buffer3putEi>
        i++;
    80003b70:	0019071b          	addiw	a4,s2,1
    80003b74:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003b78:	0004a683          	lw	a3,0(s1)
    80003b7c:	0026979b          	slliw	a5,a3,0x2
    80003b80:	00d787bb          	addw	a5,a5,a3
    80003b84:	0017979b          	slliw	a5,a5,0x1
    80003b88:	02f767bb          	remw	a5,a4,a5
    80003b8c:	fc0792e3          	bnez	a5,80003b50 <_Z8producerPv+0x2c>
    80003b90:	fb9ff06f          	j	80003b48 <_Z8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    80003b94:	0104b503          	ld	a0,16(s1)
    80003b98:	fffff097          	auipc	ra,0xfffff
    80003b9c:	b04080e7          	jalr	-1276(ra) # 8000269c <_Z10sem_signalP4_sem>
}
    80003ba0:	01813083          	ld	ra,24(sp)
    80003ba4:	01013403          	ld	s0,16(sp)
    80003ba8:	00813483          	ld	s1,8(sp)
    80003bac:	00013903          	ld	s2,0(sp)
    80003bb0:	02010113          	addi	sp,sp,32
    80003bb4:	00008067          	ret

0000000080003bb8 <_Z8consumerPv>:

void consumer(void *arg) {
    80003bb8:	fd010113          	addi	sp,sp,-48
    80003bbc:	02113423          	sd	ra,40(sp)
    80003bc0:	02813023          	sd	s0,32(sp)
    80003bc4:	00913c23          	sd	s1,24(sp)
    80003bc8:	01213823          	sd	s2,16(sp)
    80003bcc:	01313423          	sd	s3,8(sp)
    80003bd0:	03010413          	addi	s0,sp,48
    80003bd4:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;


    int i = 0;
    80003bd8:	00000993          	li	s3,0
    80003bdc:	01c0006f          	j	80003bf8 <_Z8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    80003be0:	fffff097          	auipc	ra,0xfffff
    80003be4:	9ac080e7          	jalr	-1620(ra) # 8000258c <_Z15thread_dispatchv>
    80003be8:	0500006f          	j	80003c38 <_Z8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    80003bec:	00a00513          	li	a0,10
    80003bf0:	fffff097          	auipc	ra,0xfffff
    80003bf4:	b48080e7          	jalr	-1208(ra) # 80002738 <_Z4putcc>
    while (!threadEnd) {
    80003bf8:	00006797          	auipc	a5,0x6
    80003bfc:	2987a783          	lw	a5,664(a5) # 80009e90 <threadEnd>
    80003c00:	04079463          	bnez	a5,80003c48 <_Z8consumerPv+0x90>
        int key = data->buffer->get();
    80003c04:	00893503          	ld	a0,8(s2)
    80003c08:	00000097          	auipc	ra,0x0
    80003c0c:	cbc080e7          	jalr	-836(ra) # 800038c4 <_ZN6Buffer3getEv>
        i++;
    80003c10:	0019849b          	addiw	s1,s3,1
    80003c14:	0004899b          	sext.w	s3,s1
        putc(key);
    80003c18:	0ff57513          	andi	a0,a0,255
    80003c1c:	fffff097          	auipc	ra,0xfffff
    80003c20:	b1c080e7          	jalr	-1252(ra) # 80002738 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80003c24:	00092703          	lw	a4,0(s2)
    80003c28:	0027179b          	slliw	a5,a4,0x2
    80003c2c:	00e787bb          	addw	a5,a5,a4
    80003c30:	02f4e7bb          	remw	a5,s1,a5
    80003c34:	fa0786e3          	beqz	a5,80003be0 <_Z8consumerPv+0x28>
        if (i % 80 == 0) {
    80003c38:	05000793          	li	a5,80
    80003c3c:	02f4e4bb          	remw	s1,s1,a5
    80003c40:	fa049ce3          	bnez	s1,80003bf8 <_Z8consumerPv+0x40>
    80003c44:	fa9ff06f          	j	80003bec <_Z8consumerPv+0x34>
        }
    }

    sem_signal(data->wait);
    80003c48:	01093503          	ld	a0,16(s2)
    80003c4c:	fffff097          	auipc	ra,0xfffff
    80003c50:	a50080e7          	jalr	-1456(ra) # 8000269c <_Z10sem_signalP4_sem>
}
    80003c54:	02813083          	ld	ra,40(sp)
    80003c58:	02013403          	ld	s0,32(sp)
    80003c5c:	01813483          	ld	s1,24(sp)
    80003c60:	01013903          	ld	s2,16(sp)
    80003c64:	00813983          	ld	s3,8(sp)
    80003c68:	03010113          	addi	sp,sp,48
    80003c6c:	00008067          	ret

0000000080003c70 <_Z11printStringPKc>:
{
    80003c70:	fe010113          	addi	sp,sp,-32
    80003c74:	00113c23          	sd	ra,24(sp)
    80003c78:	00813823          	sd	s0,16(sp)
    80003c7c:	00913423          	sd	s1,8(sp)
    80003c80:	02010413          	addi	s0,sp,32
    80003c84:	00050493          	mv	s1,a0
    LOCK();
    80003c88:	00100613          	li	a2,1
    80003c8c:	00000593          	li	a1,0
    80003c90:	00006517          	auipc	a0,0x6
    80003c94:	1f850513          	addi	a0,a0,504 # 80009e88 <lockPrint>
    80003c98:	ffffd097          	auipc	ra,0xffffd
    80003c9c:	4e8080e7          	jalr	1256(ra) # 80001180 <copy_and_swap>
    80003ca0:	fe0514e3          	bnez	a0,80003c88 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80003ca4:	0004c503          	lbu	a0,0(s1)
    80003ca8:	00050a63          	beqz	a0,80003cbc <_Z11printStringPKc+0x4c>
        putc(*string);
    80003cac:	fffff097          	auipc	ra,0xfffff
    80003cb0:	a8c080e7          	jalr	-1396(ra) # 80002738 <_Z4putcc>
        string++;
    80003cb4:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80003cb8:	fedff06f          	j	80003ca4 <_Z11printStringPKc+0x34>
    UNLOCK();
    80003cbc:	00000613          	li	a2,0
    80003cc0:	00100593          	li	a1,1
    80003cc4:	00006517          	auipc	a0,0x6
    80003cc8:	1c450513          	addi	a0,a0,452 # 80009e88 <lockPrint>
    80003ccc:	ffffd097          	auipc	ra,0xffffd
    80003cd0:	4b4080e7          	jalr	1204(ra) # 80001180 <copy_and_swap>
    80003cd4:	fe0514e3          	bnez	a0,80003cbc <_Z11printStringPKc+0x4c>
}
    80003cd8:	01813083          	ld	ra,24(sp)
    80003cdc:	01013403          	ld	s0,16(sp)
    80003ce0:	00813483          	ld	s1,8(sp)
    80003ce4:	02010113          	addi	sp,sp,32
    80003ce8:	00008067          	ret

0000000080003cec <_Z11workerBodyAPv>:
    if (n == 0 || n == 1) { return n; }
    if (n % 10 == 0) { thread_dispatch(); }
    return fibonacci(n - 1) + fibonacci(n - 2);
}

void workerBodyA(void* arg) {
    80003cec:	fe010113          	addi	sp,sp,-32
    80003cf0:	00113c23          	sd	ra,24(sp)
    80003cf4:	00813823          	sd	s0,16(sp)
    80003cf8:	00913423          	sd	s1,8(sp)
    80003cfc:	01213023          	sd	s2,0(sp)
    80003d00:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80003d04:	00000913          	li	s2,0
    80003d08:	0380006f          	j	80003d40 <_Z11workerBodyAPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003d0c:	fffff097          	auipc	ra,0xfffff
    80003d10:	880080e7          	jalr	-1920(ra) # 8000258c <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003d14:	00148493          	addi	s1,s1,1
    80003d18:	000027b7          	lui	a5,0x2
    80003d1c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003d20:	0097ee63          	bltu	a5,s1,80003d3c <_Z11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003d24:	00000713          	li	a4,0
    80003d28:	000077b7          	lui	a5,0x7
    80003d2c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003d30:	fce7eee3          	bltu	a5,a4,80003d0c <_Z11workerBodyAPv+0x20>
    80003d34:	00170713          	addi	a4,a4,1
    80003d38:	ff1ff06f          	j	80003d28 <_Z11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80003d3c:	00190913          	addi	s2,s2,1
    80003d40:	00900793          	li	a5,9
    80003d44:	0527e063          	bltu	a5,s2,80003d84 <_Z11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80003d48:	00004517          	auipc	a0,0x4
    80003d4c:	4b850513          	addi	a0,a0,1208 # 80008200 <_ZZ14kprintUnsignedmE6digits+0x10>
    80003d50:	00000097          	auipc	ra,0x0
    80003d54:	f20080e7          	jalr	-224(ra) # 80003c70 <_Z11printStringPKc>
    80003d58:	00000613          	li	a2,0
    80003d5c:	00a00593          	li	a1,10
    80003d60:	0009051b          	sext.w	a0,s2
    80003d64:	00000097          	auipc	ra,0x0
    80003d68:	bec080e7          	jalr	-1044(ra) # 80003950 <_ZL8printIntiii>
    80003d6c:	00004517          	auipc	a0,0x4
    80003d70:	41c50513          	addi	a0,a0,1052 # 80008188 <CONSOLE_STATUS+0x178>
    80003d74:	00000097          	auipc	ra,0x0
    80003d78:	efc080e7          	jalr	-260(ra) # 80003c70 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003d7c:	00000493          	li	s1,0
    80003d80:	f99ff06f          	j	80003d18 <_Z11workerBodyAPv+0x2c>
        }
    }
    printString("A finished!\n");
    80003d84:	00004517          	auipc	a0,0x4
    80003d88:	48450513          	addi	a0,a0,1156 # 80008208 <_ZZ14kprintUnsignedmE6digits+0x18>
    80003d8c:	00000097          	auipc	ra,0x0
    80003d90:	ee4080e7          	jalr	-284(ra) # 80003c70 <_Z11printStringPKc>
    finishedA = true;
    80003d94:	00100793          	li	a5,1
    80003d98:	00006717          	auipc	a4,0x6
    80003d9c:	0ef70e23          	sb	a5,252(a4) # 80009e94 <finishedA>
}
    80003da0:	01813083          	ld	ra,24(sp)
    80003da4:	01013403          	ld	s0,16(sp)
    80003da8:	00813483          	ld	s1,8(sp)
    80003dac:	00013903          	ld	s2,0(sp)
    80003db0:	02010113          	addi	sp,sp,32
    80003db4:	00008067          	ret

0000000080003db8 <_Z11workerBodyBPv>:

void workerBodyB(void* arg) {
    80003db8:	fe010113          	addi	sp,sp,-32
    80003dbc:	00113c23          	sd	ra,24(sp)
    80003dc0:	00813823          	sd	s0,16(sp)
    80003dc4:	00913423          	sd	s1,8(sp)
    80003dc8:	01213023          	sd	s2,0(sp)
    80003dcc:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80003dd0:	00000913          	li	s2,0
    80003dd4:	0380006f          	j	80003e0c <_Z11workerBodyBPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003dd8:	ffffe097          	auipc	ra,0xffffe
    80003ddc:	7b4080e7          	jalr	1972(ra) # 8000258c <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003de0:	00148493          	addi	s1,s1,1
    80003de4:	000027b7          	lui	a5,0x2
    80003de8:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003dec:	0097ee63          	bltu	a5,s1,80003e08 <_Z11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003df0:	00000713          	li	a4,0
    80003df4:	000077b7          	lui	a5,0x7
    80003df8:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003dfc:	fce7eee3          	bltu	a5,a4,80003dd8 <_Z11workerBodyBPv+0x20>
    80003e00:	00170713          	addi	a4,a4,1
    80003e04:	ff1ff06f          	j	80003df4 <_Z11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80003e08:	00190913          	addi	s2,s2,1
    80003e0c:	00f00793          	li	a5,15
    80003e10:	0527e063          	bltu	a5,s2,80003e50 <_Z11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80003e14:	00004517          	auipc	a0,0x4
    80003e18:	40450513          	addi	a0,a0,1028 # 80008218 <_ZZ14kprintUnsignedmE6digits+0x28>
    80003e1c:	00000097          	auipc	ra,0x0
    80003e20:	e54080e7          	jalr	-428(ra) # 80003c70 <_Z11printStringPKc>
    80003e24:	00000613          	li	a2,0
    80003e28:	00a00593          	li	a1,10
    80003e2c:	0009051b          	sext.w	a0,s2
    80003e30:	00000097          	auipc	ra,0x0
    80003e34:	b20080e7          	jalr	-1248(ra) # 80003950 <_ZL8printIntiii>
    80003e38:	00004517          	auipc	a0,0x4
    80003e3c:	35050513          	addi	a0,a0,848 # 80008188 <CONSOLE_STATUS+0x178>
    80003e40:	00000097          	auipc	ra,0x0
    80003e44:	e30080e7          	jalr	-464(ra) # 80003c70 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003e48:	00000493          	li	s1,0
    80003e4c:	f99ff06f          	j	80003de4 <_Z11workerBodyBPv+0x2c>
        }
    }
    printString("B finished!\n");
    80003e50:	00004517          	auipc	a0,0x4
    80003e54:	3d050513          	addi	a0,a0,976 # 80008220 <_ZZ14kprintUnsignedmE6digits+0x30>
    80003e58:	00000097          	auipc	ra,0x0
    80003e5c:	e18080e7          	jalr	-488(ra) # 80003c70 <_Z11printStringPKc>
    finishedB = true;
    80003e60:	00100793          	li	a5,1
    80003e64:	00006717          	auipc	a4,0x6
    80003e68:	02f708a3          	sb	a5,49(a4) # 80009e95 <finishedB>
    thread_dispatch();
    80003e6c:	ffffe097          	auipc	ra,0xffffe
    80003e70:	720080e7          	jalr	1824(ra) # 8000258c <_Z15thread_dispatchv>
}
    80003e74:	01813083          	ld	ra,24(sp)
    80003e78:	01013403          	ld	s0,16(sp)
    80003e7c:	00813483          	ld	s1,8(sp)
    80003e80:	00013903          	ld	s2,0(sp)
    80003e84:	02010113          	addi	sp,sp,32
    80003e88:	00008067          	ret

0000000080003e8c <_Z9sleepyRunPv>:

#include "printing.hpp"

bool finished[2];

void sleepyRun(void *arg) {
    80003e8c:	fe010113          	addi	sp,sp,-32
    80003e90:	00113c23          	sd	ra,24(sp)
    80003e94:	00813823          	sd	s0,16(sp)
    80003e98:	00913423          	sd	s1,8(sp)
    80003e9c:	01213023          	sd	s2,0(sp)
    80003ea0:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    80003ea4:	00053903          	ld	s2,0(a0)
    int i = 6;
    80003ea8:	00600493          	li	s1,6
    while (--i > 0) {
    80003eac:	fff4849b          	addiw	s1,s1,-1
    80003eb0:	04905463          	blez	s1,80003ef8 <_Z9sleepyRunPv+0x6c>
        printString("Hello ");
    80003eb4:	00004517          	auipc	a0,0x4
    80003eb8:	37c50513          	addi	a0,a0,892 # 80008230 <_ZZ14kprintUnsignedmE6digits+0x40>
    80003ebc:	00000097          	auipc	ra,0x0
    80003ec0:	db4080e7          	jalr	-588(ra) # 80003c70 <_Z11printStringPKc>
        printInt(sleep_time);
    80003ec4:	00000613          	li	a2,0
    80003ec8:	00a00593          	li	a1,10
    80003ecc:	0009051b          	sext.w	a0,s2
    80003ed0:	00000097          	auipc	ra,0x0
    80003ed4:	a80080e7          	jalr	-1408(ra) # 80003950 <_ZL8printIntiii>
        printString(" !\n");
    80003ed8:	00004517          	auipc	a0,0x4
    80003edc:	36050513          	addi	a0,a0,864 # 80008238 <_ZZ14kprintUnsignedmE6digits+0x48>
    80003ee0:	00000097          	auipc	ra,0x0
    80003ee4:	d90080e7          	jalr	-624(ra) # 80003c70 <_Z11printStringPKc>
        time_sleep(sleep_time);
    80003ee8:	00090513          	mv	a0,s2
    80003eec:	ffffe097          	auipc	ra,0xffffe
    80003ef0:	7e4080e7          	jalr	2020(ra) # 800026d0 <_Z10time_sleepm>
    while (--i > 0) {
    80003ef4:	fb9ff06f          	j	80003eac <_Z9sleepyRunPv+0x20>
    }
    finished[sleep_time/10-1] = true;
    80003ef8:	00a00793          	li	a5,10
    80003efc:	02f95933          	divu	s2,s2,a5
    80003f00:	fff90913          	addi	s2,s2,-1
    80003f04:	00006797          	auipc	a5,0x6
    80003f08:	f8478793          	addi	a5,a5,-124 # 80009e88 <lockPrint>
    80003f0c:	01278933          	add	s2,a5,s2
    80003f10:	00100793          	li	a5,1
    80003f14:	00f90823          	sb	a5,16(s2)
}
    80003f18:	01813083          	ld	ra,24(sp)
    80003f1c:	01013403          	ld	s0,16(sp)
    80003f20:	00813483          	ld	s1,8(sp)
    80003f24:	00013903          	ld	s2,0(sp)
    80003f28:	02010113          	addi	sp,sp,32
    80003f2c:	00008067          	ret

0000000080003f30 <_Z11workerBodyEPv>:
//    printInteger(n);
//    printString(" fibonacci number\n");
    return fibonacci(n-1) + fibonacci(n-2);
}

void workerBodyE(void *) {
    80003f30:	fe010113          	addi	sp,sp,-32
    80003f34:	00113c23          	sd	ra,24(sp)
    80003f38:	00813823          	sd	s0,16(sp)
    80003f3c:	00913423          	sd	s1,8(sp)
    80003f40:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80003f44:	00000493          	li	s1,0
    80003f48:	0180006f          	j	80003f60 <_Z11workerBodyEPv+0x30>
        printString("A: i=");
        printInt(i);
        printString("\n");
        if (i % 4 == 0) time_sleep(50);
    80003f4c:	03200513          	li	a0,50
    80003f50:	ffffe097          	auipc	ra,0xffffe
    80003f54:	780080e7          	jalr	1920(ra) # 800026d0 <_Z10time_sleepm>
    80003f58:	04c0006f          	j	80003fa4 <_Z11workerBodyEPv+0x74>
    for (uint64 i = 0; i < 10; i++) {
    80003f5c:	00148493          	addi	s1,s1,1
    80003f60:	00900793          	li	a5,9
    80003f64:	0497ec63          	bltu	a5,s1,80003fbc <_Z11workerBodyEPv+0x8c>
        printString("A: i=");
    80003f68:	00004517          	auipc	a0,0x4
    80003f6c:	29850513          	addi	a0,a0,664 # 80008200 <_ZZ14kprintUnsignedmE6digits+0x10>
    80003f70:	00000097          	auipc	ra,0x0
    80003f74:	d00080e7          	jalr	-768(ra) # 80003c70 <_Z11printStringPKc>
        printInt(i);
    80003f78:	00000613          	li	a2,0
    80003f7c:	00a00593          	li	a1,10
    80003f80:	0004851b          	sext.w	a0,s1
    80003f84:	00000097          	auipc	ra,0x0
    80003f88:	9cc080e7          	jalr	-1588(ra) # 80003950 <_ZL8printIntiii>
        printString("\n");
    80003f8c:	00004517          	auipc	a0,0x4
    80003f90:	1fc50513          	addi	a0,a0,508 # 80008188 <CONSOLE_STATUS+0x178>
    80003f94:	00000097          	auipc	ra,0x0
    80003f98:	cdc080e7          	jalr	-804(ra) # 80003c70 <_Z11printStringPKc>
        if (i % 4 == 0) time_sleep(50);
    80003f9c:	0034f793          	andi	a5,s1,3
    80003fa0:	fa0786e3          	beqz	a5,80003f4c <_Z11workerBodyEPv+0x1c>
        for (uint64 k = 0; k < 30000; k++) {
    80003fa4:	00000713          	li	a4,0
    80003fa8:	000077b7          	lui	a5,0x7
    80003fac:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003fb0:	fae7e6e3          	bltu	a5,a4,80003f5c <_Z11workerBodyEPv+0x2c>
    80003fb4:	00170713          	addi	a4,a4,1
    80003fb8:	ff1ff06f          	j	80003fa8 <_Z11workerBodyEPv+0x78>
            //busy wait
        }
        // TCB::yield();
    }
    printString("Worker A finished\n");
    80003fbc:	00004517          	auipc	a0,0x4
    80003fc0:	28450513          	addi	a0,a0,644 # 80008240 <_ZZ14kprintUnsignedmE6digits+0x50>
    80003fc4:	00000097          	auipc	ra,0x0
    80003fc8:	cac080e7          	jalr	-852(ra) # 80003c70 <_Z11printStringPKc>
}
    80003fcc:	01813083          	ld	ra,24(sp)
    80003fd0:	01013403          	ld	s0,16(sp)
    80003fd4:	00813483          	ld	s1,8(sp)
    80003fd8:	02010113          	addi	sp,sp,32
    80003fdc:	00008067          	ret

0000000080003fe0 <_Z11workerBodyFPv>:

void workerBodyF(void *) {
    80003fe0:	fe010113          	addi	sp,sp,-32
    80003fe4:	00113c23          	sd	ra,24(sp)
    80003fe8:	00813823          	sd	s0,16(sp)
    80003fec:	00913423          	sd	s1,8(sp)
    80003ff0:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80003ff4:	00000493          	li	s1,0
    80003ff8:	0380006f          	j	80004030 <_Z11workerBodyFPv+0x50>
        printString("B: i=");
        printInt(i);
        printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
    80003ffc:	00168693          	addi	a3,a3,1
    80004000:	000027b7          	lui	a5,0x2
    80004004:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80004008:	00d7ee63          	bltu	a5,a3,80004024 <_Z11workerBodyFPv+0x44>
            for (uint64 k = 0; k < 30000; k++) {
    8000400c:	00000713          	li	a4,0
    80004010:	000077b7          	lui	a5,0x7
    80004014:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80004018:	fee7e2e3          	bltu	a5,a4,80003ffc <_Z11workerBodyFPv+0x1c>
    8000401c:	00170713          	addi	a4,a4,1
    80004020:	ff1ff06f          	j	80004010 <_Z11workerBodyFPv+0x30>
                // busy wait
            }
            // TCB::yield()
        }
        thread_dispatch();
    80004024:	ffffe097          	auipc	ra,0xffffe
    80004028:	568080e7          	jalr	1384(ra) # 8000258c <_Z15thread_dispatchv>
    for (uint64 i = 0; i < 16; i++) {
    8000402c:	00148493          	addi	s1,s1,1
    80004030:	00f00793          	li	a5,15
    80004034:	0497e063          	bltu	a5,s1,80004074 <_Z11workerBodyFPv+0x94>
        printString("B: i=");
    80004038:	00004517          	auipc	a0,0x4
    8000403c:	1e050513          	addi	a0,a0,480 # 80008218 <_ZZ14kprintUnsignedmE6digits+0x28>
    80004040:	00000097          	auipc	ra,0x0
    80004044:	c30080e7          	jalr	-976(ra) # 80003c70 <_Z11printStringPKc>
        printInt(i);
    80004048:	00000613          	li	a2,0
    8000404c:	00a00593          	li	a1,10
    80004050:	0004851b          	sext.w	a0,s1
    80004054:	00000097          	auipc	ra,0x0
    80004058:	8fc080e7          	jalr	-1796(ra) # 80003950 <_ZL8printIntiii>
        printString("\n");
    8000405c:	00004517          	auipc	a0,0x4
    80004060:	12c50513          	addi	a0,a0,300 # 80008188 <CONSOLE_STATUS+0x178>
    80004064:	00000097          	auipc	ra,0x0
    80004068:	c0c080e7          	jalr	-1012(ra) # 80003c70 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    8000406c:	00000693          	li	a3,0
    80004070:	f91ff06f          	j	80004000 <_Z11workerBodyFPv+0x20>
    }
    printString("Worker B finished\n");
    80004074:	00004517          	auipc	a0,0x4
    80004078:	1e450513          	addi	a0,a0,484 # 80008258 <_ZZ14kprintUnsignedmE6digits+0x68>
    8000407c:	00000097          	auipc	ra,0x0
    80004080:	bf4080e7          	jalr	-1036(ra) # 80003c70 <_Z11printStringPKc>
}
    80004084:	01813083          	ld	ra,24(sp)
    80004088:	01013403          	ld	s0,16(sp)
    8000408c:	00813483          	ld	s1,8(sp)
    80004090:	02010113          	addi	sp,sp,32
    80004094:	00008067          	ret

0000000080004098 <_Z9getStringPci>:
char* getString(char *buf, int max) {
    80004098:	fd010113          	addi	sp,sp,-48
    8000409c:	02113423          	sd	ra,40(sp)
    800040a0:	02813023          	sd	s0,32(sp)
    800040a4:	00913c23          	sd	s1,24(sp)
    800040a8:	01213823          	sd	s2,16(sp)
    800040ac:	01313423          	sd	s3,8(sp)
    800040b0:	01413023          	sd	s4,0(sp)
    800040b4:	03010413          	addi	s0,sp,48
    800040b8:	00050993          	mv	s3,a0
    800040bc:	00058a13          	mv	s4,a1
    LOCK();
    800040c0:	00100613          	li	a2,1
    800040c4:	00000593          	li	a1,0
    800040c8:	00006517          	auipc	a0,0x6
    800040cc:	dc050513          	addi	a0,a0,-576 # 80009e88 <lockPrint>
    800040d0:	ffffd097          	auipc	ra,0xffffd
    800040d4:	0b0080e7          	jalr	176(ra) # 80001180 <copy_and_swap>
    800040d8:	fe0514e3          	bnez	a0,800040c0 <_Z9getStringPci+0x28>
    for(i=0; i+1 < max; ){
    800040dc:	00000913          	li	s2,0
    800040e0:	00090493          	mv	s1,s2
    800040e4:	0019091b          	addiw	s2,s2,1
    800040e8:	03495a63          	bge	s2,s4,8000411c <_Z9getStringPci+0x84>
        cc = getc();
    800040ec:	ffffe097          	auipc	ra,0xffffe
    800040f0:	618080e7          	jalr	1560(ra) # 80002704 <_Z4getcv>
        if(cc < 1)
    800040f4:	02050463          	beqz	a0,8000411c <_Z9getStringPci+0x84>
        buf[i++] = c;
    800040f8:	009984b3          	add	s1,s3,s1
    800040fc:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80004100:	00a00793          	li	a5,10
    80004104:	00f50a63          	beq	a0,a5,80004118 <_Z9getStringPci+0x80>
    80004108:	00d00793          	li	a5,13
    8000410c:	fcf51ae3          	bne	a0,a5,800040e0 <_Z9getStringPci+0x48>
        buf[i++] = c;
    80004110:	00090493          	mv	s1,s2
    80004114:	0080006f          	j	8000411c <_Z9getStringPci+0x84>
    80004118:	00090493          	mv	s1,s2
    buf[i] = '\0';
    8000411c:	009984b3          	add	s1,s3,s1
    80004120:	00048023          	sb	zero,0(s1)
    UNLOCK();
    80004124:	00000613          	li	a2,0
    80004128:	00100593          	li	a1,1
    8000412c:	00006517          	auipc	a0,0x6
    80004130:	d5c50513          	addi	a0,a0,-676 # 80009e88 <lockPrint>
    80004134:	ffffd097          	auipc	ra,0xffffd
    80004138:	04c080e7          	jalr	76(ra) # 80001180 <copy_and_swap>
    8000413c:	fe0514e3          	bnez	a0,80004124 <_Z9getStringPci+0x8c>
}
    80004140:	00098513          	mv	a0,s3
    80004144:	02813083          	ld	ra,40(sp)
    80004148:	02013403          	ld	s0,32(sp)
    8000414c:	01813483          	ld	s1,24(sp)
    80004150:	01013903          	ld	s2,16(sp)
    80004154:	00813983          	ld	s3,8(sp)
    80004158:	00013a03          	ld	s4,0(sp)
    8000415c:	03010113          	addi	sp,sp,48
    80004160:	00008067          	ret

0000000080004164 <_Z11stringToIntPKc>:
int stringToInt(const char *s) {
    80004164:	ff010113          	addi	sp,sp,-16
    80004168:	00813423          	sd	s0,8(sp)
    8000416c:	01010413          	addi	s0,sp,16
    80004170:	00050693          	mv	a3,a0
    n = 0;
    80004174:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80004178:	0006c603          	lbu	a2,0(a3)
    8000417c:	fd06071b          	addiw	a4,a2,-48
    80004180:	0ff77713          	andi	a4,a4,255
    80004184:	00900793          	li	a5,9
    80004188:	02e7e063          	bltu	a5,a4,800041a8 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    8000418c:	0025179b          	slliw	a5,a0,0x2
    80004190:	00a787bb          	addw	a5,a5,a0
    80004194:	0017979b          	slliw	a5,a5,0x1
    80004198:	00168693          	addi	a3,a3,1
    8000419c:	00c787bb          	addw	a5,a5,a2
    800041a0:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    800041a4:	fd5ff06f          	j	80004178 <_Z11stringToIntPKc+0x14>
}
    800041a8:	00813403          	ld	s0,8(sp)
    800041ac:	01010113          	addi	sp,sp,16
    800041b0:	00008067          	ret

00000000800041b4 <_Z9fibonaccim>:
uint64 fibonacci(uint64 n) {
    800041b4:	fe010113          	addi	sp,sp,-32
    800041b8:	00113c23          	sd	ra,24(sp)
    800041bc:	00813823          	sd	s0,16(sp)
    800041c0:	00913423          	sd	s1,8(sp)
    800041c4:	01213023          	sd	s2,0(sp)
    800041c8:	02010413          	addi	s0,sp,32
    800041cc:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    800041d0:	00100793          	li	a5,1
    800041d4:	02a7f863          	bgeu	a5,a0,80004204 <_Z9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    800041d8:	00a00793          	li	a5,10
    800041dc:	02f577b3          	remu	a5,a0,a5
    800041e0:	02078e63          	beqz	a5,8000421c <_Z9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    800041e4:	fff48513          	addi	a0,s1,-1
    800041e8:	00000097          	auipc	ra,0x0
    800041ec:	fcc080e7          	jalr	-52(ra) # 800041b4 <_Z9fibonaccim>
    800041f0:	00050913          	mv	s2,a0
    800041f4:	ffe48513          	addi	a0,s1,-2
    800041f8:	00000097          	auipc	ra,0x0
    800041fc:	fbc080e7          	jalr	-68(ra) # 800041b4 <_Z9fibonaccim>
    80004200:	00a90533          	add	a0,s2,a0
}
    80004204:	01813083          	ld	ra,24(sp)
    80004208:	01013403          	ld	s0,16(sp)
    8000420c:	00813483          	ld	s1,8(sp)
    80004210:	00013903          	ld	s2,0(sp)
    80004214:	02010113          	addi	sp,sp,32
    80004218:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    8000421c:	ffffe097          	auipc	ra,0xffffe
    80004220:	370080e7          	jalr	880(ra) # 8000258c <_Z15thread_dispatchv>
    80004224:	fc1ff06f          	j	800041e4 <_Z9fibonaccim+0x30>

0000000080004228 <_Z11workerBodyCPv>:

void workerBodyC(void* arg) {
    80004228:	fe010113          	addi	sp,sp,-32
    8000422c:	00113c23          	sd	ra,24(sp)
    80004230:	00813823          	sd	s0,16(sp)
    80004234:	00913423          	sd	s1,8(sp)
    80004238:	01213023          	sd	s2,0(sp)
    8000423c:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80004240:	00000493          	li	s1,0
    80004244:	0400006f          	j	80004284 <_Z11workerBodyCPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80004248:	00004517          	auipc	a0,0x4
    8000424c:	02850513          	addi	a0,a0,40 # 80008270 <_ZZ14kprintUnsignedmE6digits+0x80>
    80004250:	00000097          	auipc	ra,0x0
    80004254:	a20080e7          	jalr	-1504(ra) # 80003c70 <_Z11printStringPKc>
    80004258:	00000613          	li	a2,0
    8000425c:	00a00593          	li	a1,10
    80004260:	00048513          	mv	a0,s1
    80004264:	fffff097          	auipc	ra,0xfffff
    80004268:	6ec080e7          	jalr	1772(ra) # 80003950 <_ZL8printIntiii>
    8000426c:	00004517          	auipc	a0,0x4
    80004270:	f1c50513          	addi	a0,a0,-228 # 80008188 <CONSOLE_STATUS+0x178>
    80004274:	00000097          	auipc	ra,0x0
    80004278:	9fc080e7          	jalr	-1540(ra) # 80003c70 <_Z11printStringPKc>
    for (; i < 3; i++) {
    8000427c:	0014849b          	addiw	s1,s1,1
    80004280:	0ff4f493          	andi	s1,s1,255
    80004284:	00200793          	li	a5,2
    80004288:	fc97f0e3          	bgeu	a5,s1,80004248 <_Z11workerBodyCPv+0x20>
    }

    printString("C: dispatch\n");
    8000428c:	00004517          	auipc	a0,0x4
    80004290:	fec50513          	addi	a0,a0,-20 # 80008278 <_ZZ14kprintUnsignedmE6digits+0x88>
    80004294:	00000097          	auipc	ra,0x0
    80004298:	9dc080e7          	jalr	-1572(ra) # 80003c70 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    8000429c:	00700313          	li	t1,7
    thread_dispatch();
    800042a0:	ffffe097          	auipc	ra,0xffffe
    800042a4:	2ec080e7          	jalr	748(ra) # 8000258c <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    800042a8:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    800042ac:	00004517          	auipc	a0,0x4
    800042b0:	fdc50513          	addi	a0,a0,-36 # 80008288 <_ZZ14kprintUnsignedmE6digits+0x98>
    800042b4:	00000097          	auipc	ra,0x0
    800042b8:	9bc080e7          	jalr	-1604(ra) # 80003c70 <_Z11printStringPKc>
    800042bc:	00000613          	li	a2,0
    800042c0:	00a00593          	li	a1,10
    800042c4:	0009051b          	sext.w	a0,s2
    800042c8:	fffff097          	auipc	ra,0xfffff
    800042cc:	688080e7          	jalr	1672(ra) # 80003950 <_ZL8printIntiii>
    800042d0:	00004517          	auipc	a0,0x4
    800042d4:	eb850513          	addi	a0,a0,-328 # 80008188 <CONSOLE_STATUS+0x178>
    800042d8:	00000097          	auipc	ra,0x0
    800042dc:	998080e7          	jalr	-1640(ra) # 80003c70 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    800042e0:	00c00513          	li	a0,12
    800042e4:	00000097          	auipc	ra,0x0
    800042e8:	ed0080e7          	jalr	-304(ra) # 800041b4 <_Z9fibonaccim>
    800042ec:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    800042f0:	00004517          	auipc	a0,0x4
    800042f4:	fa050513          	addi	a0,a0,-96 # 80008290 <_ZZ14kprintUnsignedmE6digits+0xa0>
    800042f8:	00000097          	auipc	ra,0x0
    800042fc:	978080e7          	jalr	-1672(ra) # 80003c70 <_Z11printStringPKc>
    80004300:	00000613          	li	a2,0
    80004304:	00a00593          	li	a1,10
    80004308:	0009051b          	sext.w	a0,s2
    8000430c:	fffff097          	auipc	ra,0xfffff
    80004310:	644080e7          	jalr	1604(ra) # 80003950 <_ZL8printIntiii>
    80004314:	00004517          	auipc	a0,0x4
    80004318:	e7450513          	addi	a0,a0,-396 # 80008188 <CONSOLE_STATUS+0x178>
    8000431c:	00000097          	auipc	ra,0x0
    80004320:	954080e7          	jalr	-1708(ra) # 80003c70 <_Z11printStringPKc>
    80004324:	0400006f          	j	80004364 <_Z11workerBodyCPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80004328:	00004517          	auipc	a0,0x4
    8000432c:	f4850513          	addi	a0,a0,-184 # 80008270 <_ZZ14kprintUnsignedmE6digits+0x80>
    80004330:	00000097          	auipc	ra,0x0
    80004334:	940080e7          	jalr	-1728(ra) # 80003c70 <_Z11printStringPKc>
    80004338:	00000613          	li	a2,0
    8000433c:	00a00593          	li	a1,10
    80004340:	00048513          	mv	a0,s1
    80004344:	fffff097          	auipc	ra,0xfffff
    80004348:	60c080e7          	jalr	1548(ra) # 80003950 <_ZL8printIntiii>
    8000434c:	00004517          	auipc	a0,0x4
    80004350:	e3c50513          	addi	a0,a0,-452 # 80008188 <CONSOLE_STATUS+0x178>
    80004354:	00000097          	auipc	ra,0x0
    80004358:	91c080e7          	jalr	-1764(ra) # 80003c70 <_Z11printStringPKc>
    for (; i < 6; i++) {
    8000435c:	0014849b          	addiw	s1,s1,1
    80004360:	0ff4f493          	andi	s1,s1,255
    80004364:	00500793          	li	a5,5
    80004368:	fc97f0e3          	bgeu	a5,s1,80004328 <_Z11workerBodyCPv+0x100>
    }

    printString("C finished!\n");
    8000436c:	00004517          	auipc	a0,0x4
    80004370:	f3450513          	addi	a0,a0,-204 # 800082a0 <_ZZ14kprintUnsignedmE6digits+0xb0>
    80004374:	00000097          	auipc	ra,0x0
    80004378:	8fc080e7          	jalr	-1796(ra) # 80003c70 <_Z11printStringPKc>
    finishedC = true;
    8000437c:	00100793          	li	a5,1
    80004380:	00006717          	auipc	a4,0x6
    80004384:	b0f70d23          	sb	a5,-1254(a4) # 80009e9a <finishedC>
    thread_dispatch();
    80004388:	ffffe097          	auipc	ra,0xffffe
    8000438c:	204080e7          	jalr	516(ra) # 8000258c <_Z15thread_dispatchv>
}
    80004390:	01813083          	ld	ra,24(sp)
    80004394:	01013403          	ld	s0,16(sp)
    80004398:	00813483          	ld	s1,8(sp)
    8000439c:	00013903          	ld	s2,0(sp)
    800043a0:	02010113          	addi	sp,sp,32
    800043a4:	00008067          	ret

00000000800043a8 <_Z11workerBodyDPv>:

void workerBodyD(void* arg) {
    800043a8:	fe010113          	addi	sp,sp,-32
    800043ac:	00113c23          	sd	ra,24(sp)
    800043b0:	00813823          	sd	s0,16(sp)
    800043b4:	00913423          	sd	s1,8(sp)
    800043b8:	01213023          	sd	s2,0(sp)
    800043bc:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800043c0:	00a00493          	li	s1,10
    800043c4:	0400006f          	j	80004404 <_Z11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800043c8:	00004517          	auipc	a0,0x4
    800043cc:	ee850513          	addi	a0,a0,-280 # 800082b0 <_ZZ14kprintUnsignedmE6digits+0xc0>
    800043d0:	00000097          	auipc	ra,0x0
    800043d4:	8a0080e7          	jalr	-1888(ra) # 80003c70 <_Z11printStringPKc>
    800043d8:	00000613          	li	a2,0
    800043dc:	00a00593          	li	a1,10
    800043e0:	00048513          	mv	a0,s1
    800043e4:	fffff097          	auipc	ra,0xfffff
    800043e8:	56c080e7          	jalr	1388(ra) # 80003950 <_ZL8printIntiii>
    800043ec:	00004517          	auipc	a0,0x4
    800043f0:	d9c50513          	addi	a0,a0,-612 # 80008188 <CONSOLE_STATUS+0x178>
    800043f4:	00000097          	auipc	ra,0x0
    800043f8:	87c080e7          	jalr	-1924(ra) # 80003c70 <_Z11printStringPKc>
    for (; i < 13; i++) {
    800043fc:	0014849b          	addiw	s1,s1,1
    80004400:	0ff4f493          	andi	s1,s1,255
    80004404:	00c00793          	li	a5,12
    80004408:	fc97f0e3          	bgeu	a5,s1,800043c8 <_Z11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    8000440c:	00004517          	auipc	a0,0x4
    80004410:	eac50513          	addi	a0,a0,-340 # 800082b8 <_ZZ14kprintUnsignedmE6digits+0xc8>
    80004414:	00000097          	auipc	ra,0x0
    80004418:	85c080e7          	jalr	-1956(ra) # 80003c70 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    8000441c:	00500313          	li	t1,5
    thread_dispatch();
    80004420:	ffffe097          	auipc	ra,0xffffe
    80004424:	16c080e7          	jalr	364(ra) # 8000258c <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80004428:	01000513          	li	a0,16
    8000442c:	00000097          	auipc	ra,0x0
    80004430:	d88080e7          	jalr	-632(ra) # 800041b4 <_Z9fibonaccim>
    80004434:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80004438:	00004517          	auipc	a0,0x4
    8000443c:	e9050513          	addi	a0,a0,-368 # 800082c8 <_ZZ14kprintUnsignedmE6digits+0xd8>
    80004440:	00000097          	auipc	ra,0x0
    80004444:	830080e7          	jalr	-2000(ra) # 80003c70 <_Z11printStringPKc>
    80004448:	00000613          	li	a2,0
    8000444c:	00a00593          	li	a1,10
    80004450:	0009051b          	sext.w	a0,s2
    80004454:	fffff097          	auipc	ra,0xfffff
    80004458:	4fc080e7          	jalr	1276(ra) # 80003950 <_ZL8printIntiii>
    8000445c:	00004517          	auipc	a0,0x4
    80004460:	d2c50513          	addi	a0,a0,-724 # 80008188 <CONSOLE_STATUS+0x178>
    80004464:	00000097          	auipc	ra,0x0
    80004468:	80c080e7          	jalr	-2036(ra) # 80003c70 <_Z11printStringPKc>
    8000446c:	0400006f          	j	800044ac <_Z11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004470:	00004517          	auipc	a0,0x4
    80004474:	e4050513          	addi	a0,a0,-448 # 800082b0 <_ZZ14kprintUnsignedmE6digits+0xc0>
    80004478:	fffff097          	auipc	ra,0xfffff
    8000447c:	7f8080e7          	jalr	2040(ra) # 80003c70 <_Z11printStringPKc>
    80004480:	00000613          	li	a2,0
    80004484:	00a00593          	li	a1,10
    80004488:	00048513          	mv	a0,s1
    8000448c:	fffff097          	auipc	ra,0xfffff
    80004490:	4c4080e7          	jalr	1220(ra) # 80003950 <_ZL8printIntiii>
    80004494:	00004517          	auipc	a0,0x4
    80004498:	cf450513          	addi	a0,a0,-780 # 80008188 <CONSOLE_STATUS+0x178>
    8000449c:	fffff097          	auipc	ra,0xfffff
    800044a0:	7d4080e7          	jalr	2004(ra) # 80003c70 <_Z11printStringPKc>
    for (; i < 16; i++) {
    800044a4:	0014849b          	addiw	s1,s1,1
    800044a8:	0ff4f493          	andi	s1,s1,255
    800044ac:	00f00793          	li	a5,15
    800044b0:	fc97f0e3          	bgeu	a5,s1,80004470 <_Z11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    800044b4:	00004517          	auipc	a0,0x4
    800044b8:	e2450513          	addi	a0,a0,-476 # 800082d8 <_ZZ14kprintUnsignedmE6digits+0xe8>
    800044bc:	fffff097          	auipc	ra,0xfffff
    800044c0:	7b4080e7          	jalr	1972(ra) # 80003c70 <_Z11printStringPKc>
    finishedD = true;
    800044c4:	00100793          	li	a5,1
    800044c8:	00006717          	auipc	a4,0x6
    800044cc:	9cf709a3          	sb	a5,-1581(a4) # 80009e9b <finishedD>
    thread_dispatch();
    800044d0:	ffffe097          	auipc	ra,0xffffe
    800044d4:	0bc080e7          	jalr	188(ra) # 8000258c <_Z15thread_dispatchv>
}
    800044d8:	01813083          	ld	ra,24(sp)
    800044dc:	01013403          	ld	s0,16(sp)
    800044e0:	00813483          	ld	s1,8(sp)
    800044e4:	00013903          	ld	s2,0(sp)
    800044e8:	02010113          	addi	sp,sp,32
    800044ec:	00008067          	ret

00000000800044f0 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    800044f0:	fc010113          	addi	sp,sp,-64
    800044f4:	02113c23          	sd	ra,56(sp)
    800044f8:	02813823          	sd	s0,48(sp)
    800044fc:	02913423          	sd	s1,40(sp)
    80004500:	04010413          	addi	s0,sp,64
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80004504:	00000613          	li	a2,0
    80004508:	fffff597          	auipc	a1,0xfffff
    8000450c:	7e458593          	addi	a1,a1,2020 # 80003cec <_Z11workerBodyAPv>
    80004510:	fc040513          	addi	a0,s0,-64
    80004514:	ffffe097          	auipc	ra,0xffffe
    80004518:	fc4080e7          	jalr	-60(ra) # 800024d8 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadA created\n");
    8000451c:	00004517          	auipc	a0,0x4
    80004520:	dcc50513          	addi	a0,a0,-564 # 800082e8 <_ZZ14kprintUnsignedmE6digits+0xf8>
    80004524:	fffff097          	auipc	ra,0xfffff
    80004528:	74c080e7          	jalr	1868(ra) # 80003c70 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    8000452c:	00000613          	li	a2,0
    80004530:	00000597          	auipc	a1,0x0
    80004534:	88858593          	addi	a1,a1,-1912 # 80003db8 <_Z11workerBodyBPv>
    80004538:	fc840513          	addi	a0,s0,-56
    8000453c:	ffffe097          	auipc	ra,0xffffe
    80004540:	f9c080e7          	jalr	-100(ra) # 800024d8 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadB created\n");
    80004544:	00004517          	auipc	a0,0x4
    80004548:	dbc50513          	addi	a0,a0,-580 # 80008300 <_ZZ14kprintUnsignedmE6digits+0x110>
    8000454c:	fffff097          	auipc	ra,0xfffff
    80004550:	724080e7          	jalr	1828(ra) # 80003c70 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80004554:	00000613          	li	a2,0
    80004558:	00000597          	auipc	a1,0x0
    8000455c:	cd058593          	addi	a1,a1,-816 # 80004228 <_Z11workerBodyCPv>
    80004560:	fd040513          	addi	a0,s0,-48
    80004564:	ffffe097          	auipc	ra,0xffffe
    80004568:	f74080e7          	jalr	-140(ra) # 800024d8 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadC created\n");
    8000456c:	00004517          	auipc	a0,0x4
    80004570:	dac50513          	addi	a0,a0,-596 # 80008318 <_ZZ14kprintUnsignedmE6digits+0x128>
    80004574:	fffff097          	auipc	ra,0xfffff
    80004578:	6fc080e7          	jalr	1788(ra) # 80003c70 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    8000457c:	00000613          	li	a2,0
    80004580:	00000597          	auipc	a1,0x0
    80004584:	e2858593          	addi	a1,a1,-472 # 800043a8 <_Z11workerBodyDPv>
    80004588:	fd840513          	addi	a0,s0,-40
    8000458c:	ffffe097          	auipc	ra,0xffffe
    80004590:	f4c080e7          	jalr	-180(ra) # 800024d8 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadD created\n");
    80004594:	00004517          	auipc	a0,0x4
    80004598:	d9c50513          	addi	a0,a0,-612 # 80008330 <_ZZ14kprintUnsignedmE6digits+0x140>
    8000459c:	fffff097          	auipc	ra,0xfffff
    800045a0:	6d4080e7          	jalr	1748(ra) # 80003c70 <_Z11printStringPKc>
    800045a4:	00c0006f          	j	800045b0 <_Z18Threads_C_API_testv+0xc0>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    800045a8:	ffffe097          	auipc	ra,0xffffe
    800045ac:	fe4080e7          	jalr	-28(ra) # 8000258c <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    800045b0:	00006797          	auipc	a5,0x6
    800045b4:	8e47c783          	lbu	a5,-1820(a5) # 80009e94 <finishedA>
    800045b8:	fe0788e3          	beqz	a5,800045a8 <_Z18Threads_C_API_testv+0xb8>
    800045bc:	00006797          	auipc	a5,0x6
    800045c0:	8d97c783          	lbu	a5,-1831(a5) # 80009e95 <finishedB>
    800045c4:	fe0782e3          	beqz	a5,800045a8 <_Z18Threads_C_API_testv+0xb8>
    800045c8:	00006797          	auipc	a5,0x6
    800045cc:	8d27c783          	lbu	a5,-1838(a5) # 80009e9a <finishedC>
    800045d0:	fc078ce3          	beqz	a5,800045a8 <_Z18Threads_C_API_testv+0xb8>
    800045d4:	00006797          	auipc	a5,0x6
    800045d8:	8c77c783          	lbu	a5,-1849(a5) # 80009e9b <finishedD>
    800045dc:	fc0786e3          	beqz	a5,800045a8 <_Z18Threads_C_API_testv+0xb8>
    }

    for (auto &thread: threads) { delete thread; }
    800045e0:	fc040493          	addi	s1,s0,-64
    800045e4:	0080006f          	j	800045ec <_Z18Threads_C_API_testv+0xfc>
    800045e8:	00848493          	addi	s1,s1,8
    800045ec:	fe040793          	addi	a5,s0,-32
    800045f0:	00f48c63          	beq	s1,a5,80004608 <_Z18Threads_C_API_testv+0x118>
    800045f4:	0004b503          	ld	a0,0(s1)
    800045f8:	fe0508e3          	beqz	a0,800045e8 <_Z18Threads_C_API_testv+0xf8>
    800045fc:	ffffe097          	auipc	ra,0xffffe
    80004600:	1bc080e7          	jalr	444(ra) # 800027b8 <_ZdlPv>
    80004604:	fe5ff06f          	j	800045e8 <_Z18Threads_C_API_testv+0xf8>
}
    80004608:	03813083          	ld	ra,56(sp)
    8000460c:	03013403          	ld	s0,48(sp)
    80004610:	02813483          	ld	s1,40(sp)
    80004614:	04010113          	addi	sp,sp,64
    80004618:	00008067          	ret

000000008000461c <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    8000461c:	f7010113          	addi	sp,sp,-144
    80004620:	08113423          	sd	ra,136(sp)
    80004624:	08813023          	sd	s0,128(sp)
    80004628:	06913c23          	sd	s1,120(sp)
    8000462c:	07213823          	sd	s2,112(sp)
    80004630:	07313423          	sd	s3,104(sp)
    80004634:	09010413          	addi	s0,sp,144
//    getString(input, 30);
//    n = stringToInt(input);

    n = 20;

    printString("Broj proizvodjaca "); printInt(threadNum);
    80004638:	00004517          	auipc	a0,0x4
    8000463c:	d1050513          	addi	a0,a0,-752 # 80008348 <_ZZ14kprintUnsignedmE6digits+0x158>
    80004640:	fffff097          	auipc	ra,0xfffff
    80004644:	630080e7          	jalr	1584(ra) # 80003c70 <_Z11printStringPKc>
    80004648:	00000613          	li	a2,0
    8000464c:	00a00593          	li	a1,10
    80004650:	00a00513          	li	a0,10
    80004654:	fffff097          	auipc	ra,0xfffff
    80004658:	2fc080e7          	jalr	764(ra) # 80003950 <_ZL8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    8000465c:	00004517          	auipc	a0,0x4
    80004660:	d0450513          	addi	a0,a0,-764 # 80008360 <_ZZ14kprintUnsignedmE6digits+0x170>
    80004664:	fffff097          	auipc	ra,0xfffff
    80004668:	60c080e7          	jalr	1548(ra) # 80003c70 <_Z11printStringPKc>
    8000466c:	00000613          	li	a2,0
    80004670:	00a00593          	li	a1,10
    80004674:	01400513          	li	a0,20
    80004678:	fffff097          	auipc	ra,0xfffff
    8000467c:	2d8080e7          	jalr	728(ra) # 80003950 <_ZL8printIntiii>
    printString(".\n");
    80004680:	00004517          	auipc	a0,0x4
    80004684:	cf850513          	addi	a0,a0,-776 # 80008378 <_ZZ14kprintUnsignedmE6digits+0x188>
    80004688:	fffff097          	auipc	ra,0xfffff
    8000468c:	5e8080e7          	jalr	1512(ra) # 80003c70 <_Z11printStringPKc>

    Buffer *buffer = new Buffer(n);
    80004690:	03800513          	li	a0,56
    80004694:	ffffe097          	auipc	ra,0xffffe
    80004698:	0d4080e7          	jalr	212(ra) # 80002768 <_Znwm>
    8000469c:	00050993          	mv	s3,a0
    800046a0:	01400593          	li	a1,20
    800046a4:	fffff097          	auipc	ra,0xfffff
    800046a8:	05c080e7          	jalr	92(ra) # 80003700 <_ZN6BufferC1Ei>

    sem_open(&waitForAll, 0);
    800046ac:	00000593          	li	a1,0
    800046b0:	00005517          	auipc	a0,0x5
    800046b4:	7f050513          	addi	a0,a0,2032 # 80009ea0 <waitForAll>
    800046b8:	ffffe097          	auipc	ra,0xffffe
    800046bc:	f04080e7          	jalr	-252(ra) # 800025bc <_Z8sem_openPP4_semj>

    thread_t threads[threadNum];
    thread_t consumerThread;

    struct thread_data data[threadNum + 1];
    800046c0:	ef010113          	addi	sp,sp,-272
    800046c4:	00010913          	mv	s2,sp

    data[threadNum].id = threadNum;
    800046c8:	00a00793          	li	a5,10
    800046cc:	0ef92823          	sw	a5,240(s2)
    data[threadNum].buffer = buffer;
    800046d0:	0f393c23          	sd	s3,248(s2)
    data[threadNum].wait = waitForAll;
    800046d4:	00005797          	auipc	a5,0x5
    800046d8:	7cc7b783          	ld	a5,1996(a5) # 80009ea0 <waitForAll>
    800046dc:	10f93023          	sd	a5,256(s2)
    thread_create(&consumerThread, consumer, data + threadNum);
    800046e0:	0f090613          	addi	a2,s2,240
    800046e4:	fffff597          	auipc	a1,0xfffff
    800046e8:	4d458593          	addi	a1,a1,1236 # 80003bb8 <_Z8consumerPv>
    800046ec:	fc840513          	addi	a0,s0,-56
    800046f0:	ffffe097          	auipc	ra,0xffffe
    800046f4:	de8080e7          	jalr	-536(ra) # 800024d8 <_Z13thread_createPP7_threadPFvPvES2_>

    for (int i = 0; i < threadNum; i++) {
    800046f8:	00000493          	li	s1,0
    800046fc:	00900793          	li	a5,9
    80004700:	0697c863          	blt	a5,s1,80004770 <_Z22producerConsumer_C_APIv+0x154>
        data[i].id = i;
    80004704:	00149793          	slli	a5,s1,0x1
    80004708:	009787b3          	add	a5,a5,s1
    8000470c:	00379793          	slli	a5,a5,0x3
    80004710:	00f907b3          	add	a5,s2,a5
    80004714:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80004718:	0137b423          	sd	s3,8(a5)
        data[i].wait = waitForAll;
    8000471c:	00005717          	auipc	a4,0x5
    80004720:	78473703          	ld	a4,1924(a4) # 80009ea0 <waitForAll>
    80004724:	00e7b823          	sd	a4,16(a5)

        thread_create(threads + i,
    80004728:	00048713          	mv	a4,s1
    8000472c:	00349513          	slli	a0,s1,0x3
    80004730:	f7840793          	addi	a5,s0,-136
    80004734:	00a78533          	add	a0,a5,a0
    80004738:	02905663          	blez	s1,80004764 <_Z22producerConsumer_C_APIv+0x148>
    8000473c:	fffff597          	auipc	a1,0xfffff
    80004740:	3e858593          	addi	a1,a1,1000 # 80003b24 <_Z8producerPv>
                      i > 0 ? producer : producerKeyboard,
                      data + i);
    80004744:	00171613          	slli	a2,a4,0x1
    80004748:	00e60633          	add	a2,a2,a4
    8000474c:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    80004750:	00c90633          	add	a2,s2,a2
    80004754:	ffffe097          	auipc	ra,0xffffe
    80004758:	d84080e7          	jalr	-636(ra) # 800024d8 <_Z13thread_createPP7_threadPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    8000475c:	0014849b          	addiw	s1,s1,1
    80004760:	f9dff06f          	j	800046fc <_Z22producerConsumer_C_APIv+0xe0>
        thread_create(threads + i,
    80004764:	fffff597          	auipc	a1,0xfffff
    80004768:	30058593          	addi	a1,a1,768 # 80003a64 <_Z16producerKeyboardPv>
    8000476c:	fd9ff06f          	j	80004744 <_Z22producerConsumer_C_APIv+0x128>
    }

    thread_dispatch();
    80004770:	ffffe097          	auipc	ra,0xffffe
    80004774:	e1c080e7          	jalr	-484(ra) # 8000258c <_Z15thread_dispatchv>

    for (int i = 0; i <= threadNum; i++) {
    80004778:	00000493          	li	s1,0
    8000477c:	0180006f          	j	80004794 <_Z22producerConsumer_C_APIv+0x178>
        sem_wait(waitForAll);
    80004780:	00005517          	auipc	a0,0x5
    80004784:	72053503          	ld	a0,1824(a0) # 80009ea0 <waitForAll>
    80004788:	ffffe097          	auipc	ra,0xffffe
    8000478c:	ee0080e7          	jalr	-288(ra) # 80002668 <_Z8sem_waitP4_sem>
    for (int i = 0; i <= threadNum; i++) {
    80004790:	0014849b          	addiw	s1,s1,1
    80004794:	00a00793          	li	a5,10
    80004798:	fe97d4e3          	bge	a5,s1,80004780 <_Z22producerConsumer_C_APIv+0x164>
    }

    sem_close(waitForAll);
    8000479c:	00005517          	auipc	a0,0x5
    800047a0:	70453503          	ld	a0,1796(a0) # 80009ea0 <waitForAll>
    800047a4:	ffffe097          	auipc	ra,0xffffe
    800047a8:	e90080e7          	jalr	-368(ra) # 80002634 <_Z9sem_closeP4_sem>
}
    800047ac:	f7040113          	addi	sp,s0,-144
    800047b0:	08813083          	ld	ra,136(sp)
    800047b4:	08013403          	ld	s0,128(sp)
    800047b8:	07813483          	ld	s1,120(sp)
    800047bc:	07013903          	ld	s2,112(sp)
    800047c0:	06813983          	ld	s3,104(sp)
    800047c4:	09010113          	addi	sp,sp,144
    800047c8:	00008067          	ret
    800047cc:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    800047d0:	00098513          	mv	a0,s3
    800047d4:	ffffe097          	auipc	ra,0xffffe
    800047d8:	fe4080e7          	jalr	-28(ra) # 800027b8 <_ZdlPv>
    800047dc:	00048513          	mv	a0,s1
    800047e0:	00006097          	auipc	ra,0x6
    800047e4:	798080e7          	jalr	1944(ra) # 8000af78 <_Unwind_Resume>

00000000800047e8 <_Z12testSleepingv>:

void testSleeping() {
    800047e8:	fc010113          	addi	sp,sp,-64
    800047ec:	02113c23          	sd	ra,56(sp)
    800047f0:	02813823          	sd	s0,48(sp)
    800047f4:	02913423          	sd	s1,40(sp)
    800047f8:	04010413          	addi	s0,sp,64
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    800047fc:	00a00793          	li	a5,10
    80004800:	fcf43823          	sd	a5,-48(s0)
    80004804:	01400793          	li	a5,20
    80004808:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    for (int i = 0; i < sleepy_thread_count; i++) {
    8000480c:	00000493          	li	s1,0
    80004810:	02c0006f          	j	8000483c <_Z12testSleepingv+0x54>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    80004814:	00349793          	slli	a5,s1,0x3
    80004818:	fd040613          	addi	a2,s0,-48
    8000481c:	00f60633          	add	a2,a2,a5
    80004820:	fffff597          	auipc	a1,0xfffff
    80004824:	66c58593          	addi	a1,a1,1644 # 80003e8c <_Z9sleepyRunPv>
    80004828:	fc040513          	addi	a0,s0,-64
    8000482c:	00f50533          	add	a0,a0,a5
    80004830:	ffffe097          	auipc	ra,0xffffe
    80004834:	ca8080e7          	jalr	-856(ra) # 800024d8 <_Z13thread_createPP7_threadPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    80004838:	0014849b          	addiw	s1,s1,1
    8000483c:	00100793          	li	a5,1
    80004840:	fc97dae3          	bge	a5,s1,80004814 <_Z12testSleepingv+0x2c>
    }

    while (!(finished[0] && finished[1])) {}
    80004844:	00005797          	auipc	a5,0x5
    80004848:	6547c783          	lbu	a5,1620(a5) # 80009e98 <finished>
    8000484c:	fe078ce3          	beqz	a5,80004844 <_Z12testSleepingv+0x5c>
    80004850:	00005797          	auipc	a5,0x5
    80004854:	6497c783          	lbu	a5,1609(a5) # 80009e99 <finished+0x1>
    80004858:	fe0786e3          	beqz	a5,80004844 <_Z12testSleepingv+0x5c>
}
    8000485c:	03813083          	ld	ra,56(sp)
    80004860:	03013403          	ld	s0,48(sp)
    80004864:	02813483          	ld	s1,40(sp)
    80004868:	04010113          	addi	sp,sp,64
    8000486c:	00008067          	ret

0000000080004870 <_Z3fibm>:
uint64 fib(uint64 n) {
    80004870:	fe010113          	addi	sp,sp,-32
    80004874:	00113c23          	sd	ra,24(sp)
    80004878:	00813823          	sd	s0,16(sp)
    8000487c:	00913423          	sd	s1,8(sp)
    80004880:	01213023          	sd	s2,0(sp)
    80004884:	02010413          	addi	s0,sp,32
    80004888:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) return n;
    8000488c:	00100793          	li	a5,1
    80004890:	02a7f663          	bgeu	a5,a0,800048bc <_Z3fibm+0x4c>
    if (n % 4 == 0) {
    80004894:	00357793          	andi	a5,a0,3
    80004898:	02078e63          	beqz	a5,800048d4 <_Z3fibm+0x64>
    return fibonacci(n-1) + fibonacci(n-2);
    8000489c:	fff48513          	addi	a0,s1,-1
    800048a0:	00000097          	auipc	ra,0x0
    800048a4:	914080e7          	jalr	-1772(ra) # 800041b4 <_Z9fibonaccim>
    800048a8:	00050913          	mv	s2,a0
    800048ac:	ffe48513          	addi	a0,s1,-2
    800048b0:	00000097          	auipc	ra,0x0
    800048b4:	904080e7          	jalr	-1788(ra) # 800041b4 <_Z9fibonaccim>
    800048b8:	00a90533          	add	a0,s2,a0
}
    800048bc:	01813083          	ld	ra,24(sp)
    800048c0:	01013403          	ld	s0,16(sp)
    800048c4:	00813483          	ld	s1,8(sp)
    800048c8:	00013903          	ld	s2,0(sp)
    800048cc:	02010113          	addi	sp,sp,32
    800048d0:	00008067          	ret
        thread_dispatch();
    800048d4:	ffffe097          	auipc	ra,0xffffe
    800048d8:	cb8080e7          	jalr	-840(ra) # 8000258c <_Z15thread_dispatchv>
    800048dc:	fc1ff06f          	j	8000489c <_Z3fibm+0x2c>

00000000800048e0 <_Z11workerBodyGPv>:

void workerBodyG(void *) {
    800048e0:	fe010113          	addi	sp,sp,-32
    800048e4:	00113c23          	sd	ra,24(sp)
    800048e8:	00813823          	sd	s0,16(sp)
    800048ec:	00913423          	sd	s1,8(sp)
    800048f0:	01213023          	sd	s2,0(sp)
    800048f4:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800048f8:	00000493          	li	s1,0
    800048fc:	0400006f          	j	8000493c <_Z11workerBodyGPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i=");
    80004900:	00004517          	auipc	a0,0x4
    80004904:	97050513          	addi	a0,a0,-1680 # 80008270 <_ZZ14kprintUnsignedmE6digits+0x80>
    80004908:	fffff097          	auipc	ra,0xfffff
    8000490c:	368080e7          	jalr	872(ra) # 80003c70 <_Z11printStringPKc>
        printInt(i);
    80004910:	00000613          	li	a2,0
    80004914:	00a00593          	li	a1,10
    80004918:	00048513          	mv	a0,s1
    8000491c:	fffff097          	auipc	ra,0xfffff
    80004920:	034080e7          	jalr	52(ra) # 80003950 <_ZL8printIntiii>
        printString("\n");
    80004924:	00004517          	auipc	a0,0x4
    80004928:	86450513          	addi	a0,a0,-1948 # 80008188 <CONSOLE_STATUS+0x178>
    8000492c:	fffff097          	auipc	ra,0xfffff
    80004930:	344080e7          	jalr	836(ra) # 80003c70 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80004934:	0014849b          	addiw	s1,s1,1
    80004938:	0ff4f493          	andi	s1,s1,255
    8000493c:	00200793          	li	a5,2
    80004940:	fc97f0e3          	bgeu	a5,s1,80004900 <_Z11workerBodyGPv+0x20>
    }

    printString("C: yield\n");
    80004944:	00004517          	auipc	a0,0x4
    80004948:	a3c50513          	addi	a0,a0,-1476 # 80008380 <_ZZ14kprintUnsignedmE6digits+0x190>
    8000494c:	fffff097          	auipc	ra,0xfffff
    80004950:	324080e7          	jalr	804(ra) # 80003c70 <_Z11printStringPKc>
    __asm__("li t1, 7");
    80004954:	00700313          	li	t1,7
    thread_dispatch();
    80004958:	ffffe097          	auipc	ra,0xffffe
    8000495c:	c34080e7          	jalr	-972(ra) # 8000258c <_Z15thread_dispatchv>

    uint64  t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80004960:	00030913          	mv	s2,t1

    printString("C: t1=");
    80004964:	00004517          	auipc	a0,0x4
    80004968:	92450513          	addi	a0,a0,-1756 # 80008288 <_ZZ14kprintUnsignedmE6digits+0x98>
    8000496c:	fffff097          	auipc	ra,0xfffff
    80004970:	304080e7          	jalr	772(ra) # 80003c70 <_Z11printStringPKc>
    printInt(t1);
    80004974:	00000613          	li	a2,0
    80004978:	00a00593          	li	a1,10
    8000497c:	0009051b          	sext.w	a0,s2
    80004980:	fffff097          	auipc	ra,0xfffff
    80004984:	fd0080e7          	jalr	-48(ra) # 80003950 <_ZL8printIntiii>
    printString("\n");
    80004988:	00004517          	auipc	a0,0x4
    8000498c:	80050513          	addi	a0,a0,-2048 # 80008188 <CONSOLE_STATUS+0x178>
    80004990:	fffff097          	auipc	ra,0xfffff
    80004994:	2e0080e7          	jalr	736(ra) # 80003c70 <_Z11printStringPKc>

    uint64 result = fib(30);
    80004998:	01e00513          	li	a0,30
    8000499c:	00000097          	auipc	ra,0x0
    800049a0:	ed4080e7          	jalr	-300(ra) # 80004870 <_Z3fibm>
    800049a4:	00050913          	mv	s2,a0
    printString("C: fibonacci=");
    800049a8:	00004517          	auipc	a0,0x4
    800049ac:	9e850513          	addi	a0,a0,-1560 # 80008390 <_ZZ14kprintUnsignedmE6digits+0x1a0>
    800049b0:	fffff097          	auipc	ra,0xfffff
    800049b4:	2c0080e7          	jalr	704(ra) # 80003c70 <_Z11printStringPKc>
    printInt(result);
    800049b8:	00000613          	li	a2,0
    800049bc:	00a00593          	li	a1,10
    800049c0:	0009051b          	sext.w	a0,s2
    800049c4:	fffff097          	auipc	ra,0xfffff
    800049c8:	f8c080e7          	jalr	-116(ra) # 80003950 <_ZL8printIntiii>
    printString("\n");
    800049cc:	00003517          	auipc	a0,0x3
    800049d0:	7bc50513          	addi	a0,a0,1980 # 80008188 <CONSOLE_STATUS+0x178>
    800049d4:	fffff097          	auipc	ra,0xfffff
    800049d8:	29c080e7          	jalr	668(ra) # 80003c70 <_Z11printStringPKc>
    800049dc:	0400006f          	j	80004a1c <_Z11workerBodyGPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i=");
    800049e0:	00004517          	auipc	a0,0x4
    800049e4:	89050513          	addi	a0,a0,-1904 # 80008270 <_ZZ14kprintUnsignedmE6digits+0x80>
    800049e8:	fffff097          	auipc	ra,0xfffff
    800049ec:	288080e7          	jalr	648(ra) # 80003c70 <_Z11printStringPKc>
        printInt(i);
    800049f0:	00000613          	li	a2,0
    800049f4:	00a00593          	li	a1,10
    800049f8:	00048513          	mv	a0,s1
    800049fc:	fffff097          	auipc	ra,0xfffff
    80004a00:	f54080e7          	jalr	-172(ra) # 80003950 <_ZL8printIntiii>
        printString("\n");
    80004a04:	00003517          	auipc	a0,0x3
    80004a08:	78450513          	addi	a0,a0,1924 # 80008188 <CONSOLE_STATUS+0x178>
    80004a0c:	fffff097          	auipc	ra,0xfffff
    80004a10:	264080e7          	jalr	612(ra) # 80003c70 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80004a14:	0014849b          	addiw	s1,s1,1
    80004a18:	0ff4f493          	andi	s1,s1,255
    80004a1c:	00500793          	li	a5,5
    80004a20:	fc97f0e3          	bgeu	a5,s1,800049e0 <_Z11workerBodyGPv+0x100>
    }
    // TCB::yield()
    printString("Worker C finished\n");
    80004a24:	00004517          	auipc	a0,0x4
    80004a28:	97c50513          	addi	a0,a0,-1668 # 800083a0 <_ZZ14kprintUnsignedmE6digits+0x1b0>
    80004a2c:	fffff097          	auipc	ra,0xfffff
    80004a30:	244080e7          	jalr	580(ra) # 80003c70 <_Z11printStringPKc>
}
    80004a34:	01813083          	ld	ra,24(sp)
    80004a38:	01013403          	ld	s0,16(sp)
    80004a3c:	00813483          	ld	s1,8(sp)
    80004a40:	00013903          	ld	s2,0(sp)
    80004a44:	02010113          	addi	sp,sp,32
    80004a48:	00008067          	ret

0000000080004a4c <_Z11workerBodyHPv>:

void workerBodyH(void *) {
    80004a4c:	fe010113          	addi	sp,sp,-32
    80004a50:	00113c23          	sd	ra,24(sp)
    80004a54:	00813823          	sd	s0,16(sp)
    80004a58:	00913423          	sd	s1,8(sp)
    80004a5c:	01213023          	sd	s2,0(sp)
    80004a60:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80004a64:	00a00493          	li	s1,10
    80004a68:	0400006f          	j	80004aa8 <_Z11workerBodyHPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i=");
    80004a6c:	00004517          	auipc	a0,0x4
    80004a70:	84450513          	addi	a0,a0,-1980 # 800082b0 <_ZZ14kprintUnsignedmE6digits+0xc0>
    80004a74:	fffff097          	auipc	ra,0xfffff
    80004a78:	1fc080e7          	jalr	508(ra) # 80003c70 <_Z11printStringPKc>
        printInt(i);
    80004a7c:	00000613          	li	a2,0
    80004a80:	00a00593          	li	a1,10
    80004a84:	00048513          	mv	a0,s1
    80004a88:	fffff097          	auipc	ra,0xfffff
    80004a8c:	ec8080e7          	jalr	-312(ra) # 80003950 <_ZL8printIntiii>
        printString("\n");
    80004a90:	00003517          	auipc	a0,0x3
    80004a94:	6f850513          	addi	a0,a0,1784 # 80008188 <CONSOLE_STATUS+0x178>
    80004a98:	fffff097          	auipc	ra,0xfffff
    80004a9c:	1d8080e7          	jalr	472(ra) # 80003c70 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80004aa0:	0014849b          	addiw	s1,s1,1
    80004aa4:	0ff4f493          	andi	s1,s1,255
    80004aa8:	00c00793          	li	a5,12
    80004aac:	fc97f0e3          	bgeu	a5,s1,80004a6c <_Z11workerBodyHPv+0x20>
    }

    printString("D: yield\n");
    80004ab0:	00004517          	auipc	a0,0x4
    80004ab4:	90850513          	addi	a0,a0,-1784 # 800083b8 <_ZZ14kprintUnsignedmE6digits+0x1c8>
    80004ab8:	fffff097          	auipc	ra,0xfffff
    80004abc:	1b8080e7          	jalr	440(ra) # 80003c70 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80004ac0:	00500313          	li	t1,5
    thread_dispatch();
    80004ac4:	ffffe097          	auipc	ra,0xffffe
    80004ac8:	ac8080e7          	jalr	-1336(ra) # 8000258c <_Z15thread_dispatchv>

    uint64 result = fib(23);
    80004acc:	01700513          	li	a0,23
    80004ad0:	00000097          	auipc	ra,0x0
    80004ad4:	da0080e7          	jalr	-608(ra) # 80004870 <_Z3fibm>
    80004ad8:	00050913          	mv	s2,a0
    printString("D: fibonacci=");
    80004adc:	00004517          	auipc	a0,0x4
    80004ae0:	8ec50513          	addi	a0,a0,-1812 # 800083c8 <_ZZ14kprintUnsignedmE6digits+0x1d8>
    80004ae4:	fffff097          	auipc	ra,0xfffff
    80004ae8:	18c080e7          	jalr	396(ra) # 80003c70 <_Z11printStringPKc>
    printInt(result);
    80004aec:	00000613          	li	a2,0
    80004af0:	00a00593          	li	a1,10
    80004af4:	0009051b          	sext.w	a0,s2
    80004af8:	fffff097          	auipc	ra,0xfffff
    80004afc:	e58080e7          	jalr	-424(ra) # 80003950 <_ZL8printIntiii>
    printString("\n");
    80004b00:	00003517          	auipc	a0,0x3
    80004b04:	68850513          	addi	a0,a0,1672 # 80008188 <CONSOLE_STATUS+0x178>
    80004b08:	fffff097          	auipc	ra,0xfffff
    80004b0c:	168080e7          	jalr	360(ra) # 80003c70 <_Z11printStringPKc>
    80004b10:	0400006f          	j	80004b50 <_Z11workerBodyHPv+0x104>

    for (; i < 16; i++) {
        printString("D: i=");
    80004b14:	00003517          	auipc	a0,0x3
    80004b18:	79c50513          	addi	a0,a0,1948 # 800082b0 <_ZZ14kprintUnsignedmE6digits+0xc0>
    80004b1c:	fffff097          	auipc	ra,0xfffff
    80004b20:	154080e7          	jalr	340(ra) # 80003c70 <_Z11printStringPKc>
        printInt(i);
    80004b24:	00000613          	li	a2,0
    80004b28:	00a00593          	li	a1,10
    80004b2c:	00048513          	mv	a0,s1
    80004b30:	fffff097          	auipc	ra,0xfffff
    80004b34:	e20080e7          	jalr	-480(ra) # 80003950 <_ZL8printIntiii>
        printString("\n");
    80004b38:	00003517          	auipc	a0,0x3
    80004b3c:	65050513          	addi	a0,a0,1616 # 80008188 <CONSOLE_STATUS+0x178>
    80004b40:	fffff097          	auipc	ra,0xfffff
    80004b44:	130080e7          	jalr	304(ra) # 80003c70 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80004b48:	0014849b          	addiw	s1,s1,1
    80004b4c:	0ff4f493          	andi	s1,s1,255
    80004b50:	00f00793          	li	a5,15
    80004b54:	fc97f0e3          	bgeu	a5,s1,80004b14 <_Z11workerBodyHPv+0xc8>
    }
    // TCB::yield()
    printString("Worker D finished\n");
    80004b58:	00004517          	auipc	a0,0x4
    80004b5c:	88050513          	addi	a0,a0,-1920 # 800083d8 <_ZZ14kprintUnsignedmE6digits+0x1e8>
    80004b60:	fffff097          	auipc	ra,0xfffff
    80004b64:	110080e7          	jalr	272(ra) # 80003c70 <_Z11printStringPKc>
}
    80004b68:	01813083          	ld	ra,24(sp)
    80004b6c:	01013403          	ld	s0,16(sp)
    80004b70:	00813483          	ld	s1,8(sp)
    80004b74:	00013903          	ld	s2,0(sp)
    80004b78:	02010113          	addi	sp,sp,32
    80004b7c:	00008067          	ret

0000000080004b80 <_Z10myUserMainv>:
#include "Workers.h"
#include "../h/syscall_c.h"
#include "ProducerConsumer.h"
#include "printing.hpp"

void myUserMain() {
    80004b80:	fa010113          	addi	sp,sp,-96
    80004b84:	04113c23          	sd	ra,88(sp)
    80004b88:	04813823          	sd	s0,80(sp)
    80004b8c:	04913423          	sd	s1,72(sp)
    80004b90:	05213023          	sd	s2,64(sp)
    80004b94:	06010413          	addi	s0,sp,96
    printString("In user main\n");
    80004b98:	00004517          	auipc	a0,0x4
    80004b9c:	85850513          	addi	a0,a0,-1960 # 800083f0 <_ZZ14kprintUnsignedmE6digits+0x200>
    80004ba0:	fffff097          	auipc	ra,0xfffff
    80004ba4:	0d0080e7          	jalr	208(ra) # 80003c70 <_Z11printStringPKc>

    void *mem = mem_alloc(25000);
    80004ba8:	00006537          	lui	a0,0x6
    80004bac:	1a850513          	addi	a0,a0,424 # 61a8 <_entry-0x7fff9e58>
    80004bb0:	ffffe097          	auipc	ra,0xffffe
    80004bb4:	8c0080e7          	jalr	-1856(ra) # 80002470 <_Z9mem_allocm>
    80004bb8:	00050913          	mv	s2,a0
    printInt((uint64) mem);
    80004bbc:	00000613          	li	a2,0
    80004bc0:	00a00593          	li	a1,10
    80004bc4:	0005051b          	sext.w	a0,a0
    80004bc8:	fffff097          	auipc	ra,0xfffff
    80004bcc:	d88080e7          	jalr	-632(ra) # 80003950 <_ZL8printIntiii>
    printString("\n");
    80004bd0:	00003517          	auipc	a0,0x3
    80004bd4:	5b850513          	addi	a0,a0,1464 # 80008188 <CONSOLE_STATUS+0x178>
    80004bd8:	fffff097          	auipc	ra,0xfffff
    80004bdc:	098080e7          	jalr	152(ra) # 80003c70 <_Z11printStringPKc>

    ProducerConsumer *obj = new ProducerConsumer();
    80004be0:	01800513          	li	a0,24
    80004be4:	ffffe097          	auipc	ra,0xffffe
    80004be8:	b84080e7          	jalr	-1148(ra) # 80002768 <_Znwm>
    80004bec:	00050493          	mv	s1,a0
#include "../h/syscall_c.h"
#include "printing.hpp"

class ProducerConsumer {
public:
    ProducerConsumer() {
    80004bf0:	00052823          	sw	zero,16(a0)
        sem_open(&semConsumer, 0);
    80004bf4:	00000593          	li	a1,0
    80004bf8:	00850513          	addi	a0,a0,8
    80004bfc:	ffffe097          	auipc	ra,0xffffe
    80004c00:	9c0080e7          	jalr	-1600(ra) # 800025bc <_Z8sem_openPP4_semj>
        sem_open(&semProducer, 1);
    80004c04:	00100593          	li	a1,1
    80004c08:	00048513          	mv	a0,s1
    80004c0c:	ffffe097          	auipc	ra,0xffffe
    80004c10:	9b0080e7          	jalr	-1616(ra) # 800025bc <_Z8sem_openPP4_semj>
    thread_t t5;
    thread_t t6;
    thread_t t7;
    thread_t t8;

    thread_create(&t1, &workerBodyE, nullptr);
    80004c14:	00000613          	li	a2,0
    80004c18:	fffff597          	auipc	a1,0xfffff
    80004c1c:	31858593          	addi	a1,a1,792 # 80003f30 <_Z11workerBodyEPv>
    80004c20:	fd840513          	addi	a0,s0,-40
    80004c24:	ffffe097          	auipc	ra,0xffffe
    80004c28:	8b4080e7          	jalr	-1868(ra) # 800024d8 <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t2, &workerBodyF, nullptr);
    80004c2c:	00000613          	li	a2,0
    80004c30:	fffff597          	auipc	a1,0xfffff
    80004c34:	3b058593          	addi	a1,a1,944 # 80003fe0 <_Z11workerBodyFPv>
    80004c38:	fd040513          	addi	a0,s0,-48
    80004c3c:	ffffe097          	auipc	ra,0xffffe
    80004c40:	89c080e7          	jalr	-1892(ra) # 800024d8 <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t3, &workerBodyG, nullptr);
    80004c44:	00000613          	li	a2,0
    80004c48:	00000597          	auipc	a1,0x0
    80004c4c:	c9858593          	addi	a1,a1,-872 # 800048e0 <_Z11workerBodyGPv>
    80004c50:	fc840513          	addi	a0,s0,-56
    80004c54:	ffffe097          	auipc	ra,0xffffe
    80004c58:	884080e7          	jalr	-1916(ra) # 800024d8 <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t4, &workerBodyH, nullptr);
    80004c5c:	00000613          	li	a2,0
    80004c60:	00000597          	auipc	a1,0x0
    80004c64:	dec58593          	addi	a1,a1,-532 # 80004a4c <_Z11workerBodyHPv>
    80004c68:	fc040513          	addi	a0,s0,-64
    80004c6c:	ffffe097          	auipc	ra,0xffffe
    80004c70:	86c080e7          	jalr	-1940(ra) # 800024d8 <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t5, &ProducerConsumer::produceWrapper, obj);
    80004c74:	00048613          	mv	a2,s1
    80004c78:	00000597          	auipc	a1,0x0
    80004c7c:	1ac58593          	addi	a1,a1,428 # 80004e24 <_ZN16ProducerConsumer14produceWrapperEPv>
    80004c80:	fb840513          	addi	a0,s0,-72
    80004c84:	ffffe097          	auipc	ra,0xffffe
    80004c88:	854080e7          	jalr	-1964(ra) # 800024d8 <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t6, &ProducerConsumer::consumeWrapper, obj);
    80004c8c:	00048613          	mv	a2,s1
    80004c90:	00000597          	auipc	a1,0x0
    80004c94:	27858593          	addi	a1,a1,632 # 80004f08 <_ZN16ProducerConsumer14consumeWrapperEPv>
    80004c98:	fb040513          	addi	a0,s0,-80
    80004c9c:	ffffe097          	auipc	ra,0xffffe
    80004ca0:	83c080e7          	jalr	-1988(ra) # 800024d8 <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t7, &ProducerConsumer::consumeWrapper, obj);
    80004ca4:	00048613          	mv	a2,s1
    80004ca8:	00000597          	auipc	a1,0x0
    80004cac:	26058593          	addi	a1,a1,608 # 80004f08 <_ZN16ProducerConsumer14consumeWrapperEPv>
    80004cb0:	fa840513          	addi	a0,s0,-88
    80004cb4:	ffffe097          	auipc	ra,0xffffe
    80004cb8:	824080e7          	jalr	-2012(ra) # 800024d8 <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t8, &ProducerConsumer::consumeWrapper, obj);
    80004cbc:	00048613          	mv	a2,s1
    80004cc0:	00000597          	auipc	a1,0x0
    80004cc4:	24858593          	addi	a1,a1,584 # 80004f08 <_ZN16ProducerConsumer14consumeWrapperEPv>
    80004cc8:	fa040513          	addi	a0,s0,-96
    80004ccc:	ffffe097          	auipc	ra,0xffffe
    80004cd0:	80c080e7          	jalr	-2036(ra) # 800024d8 <_Z13thread_createPP7_threadPFvPvES2_>

    time_sleep(50);
    80004cd4:	03200513          	li	a0,50
    80004cd8:	ffffe097          	auipc	ra,0xffffe
    80004cdc:	9f8080e7          	jalr	-1544(ra) # 800026d0 <_Z10time_sleepm>

    printString("Nit t2: ");
    80004ce0:	00003517          	auipc	a0,0x3
    80004ce4:	72050513          	addi	a0,a0,1824 # 80008400 <_ZZ14kprintUnsignedmE6digits+0x210>
    80004ce8:	fffff097          	auipc	ra,0xfffff
    80004cec:	f88080e7          	jalr	-120(ra) # 80003c70 <_Z11printStringPKc>
    printInt((uint64) t2);
    80004cf0:	00000613          	li	a2,0
    80004cf4:	00a00593          	li	a1,10
    80004cf8:	fd042503          	lw	a0,-48(s0)
    80004cfc:	fffff097          	auipc	ra,0xfffff
    80004d00:	c54080e7          	jalr	-940(ra) # 80003950 <_ZL8printIntiii>
    printString("\n");
    80004d04:	00003517          	auipc	a0,0x3
    80004d08:	48450513          	addi	a0,a0,1156 # 80008188 <CONSOLE_STATUS+0x178>
    80004d0c:	fffff097          	auipc	ra,0xfffff
    80004d10:	f64080e7          	jalr	-156(ra) # 80003c70 <_Z11printStringPKc>

    time_sleep(150);
    80004d14:	09600513          	li	a0,150
    80004d18:	ffffe097          	auipc	ra,0xffffe
    80004d1c:	9b8080e7          	jalr	-1608(ra) # 800026d0 <_Z10time_sleepm>

    printString("Mem free called with ret value ");
    80004d20:	00003517          	auipc	a0,0x3
    80004d24:	6f050513          	addi	a0,a0,1776 # 80008410 <_ZZ14kprintUnsignedmE6digits+0x220>
    80004d28:	fffff097          	auipc	ra,0xfffff
    80004d2c:	f48080e7          	jalr	-184(ra) # 80003c70 <_Z11printStringPKc>
    printInt(mem_free(mem));
    80004d30:	00090513          	mv	a0,s2
    80004d34:	ffffd097          	auipc	ra,0xffffd
    80004d38:	770080e7          	jalr	1904(ra) # 800024a4 <_Z8mem_freePv>
    80004d3c:	00000613          	li	a2,0
    80004d40:	00a00593          	li	a1,10
    80004d44:	fffff097          	auipc	ra,0xfffff
    80004d48:	c0c080e7          	jalr	-1012(ra) # 80003950 <_ZL8printIntiii>
    printString("\n");
    80004d4c:	00003517          	auipc	a0,0x3
    80004d50:	43c50513          	addi	a0,a0,1084 # 80008188 <CONSOLE_STATUS+0x178>
    80004d54:	fffff097          	auipc	ra,0xfffff
    80004d58:	f1c080e7          	jalr	-228(ra) # 80003c70 <_Z11printStringPKc>

    printString("Mem free called again with ret value ");
    80004d5c:	00003517          	auipc	a0,0x3
    80004d60:	6d450513          	addi	a0,a0,1748 # 80008430 <_ZZ14kprintUnsignedmE6digits+0x240>
    80004d64:	fffff097          	auipc	ra,0xfffff
    80004d68:	f0c080e7          	jalr	-244(ra) # 80003c70 <_Z11printStringPKc>
    printInt(mem_free(mem));
    80004d6c:	00090513          	mv	a0,s2
    80004d70:	ffffd097          	auipc	ra,0xffffd
    80004d74:	734080e7          	jalr	1844(ra) # 800024a4 <_Z8mem_freePv>
    80004d78:	00000613          	li	a2,0
    80004d7c:	00a00593          	li	a1,10
    80004d80:	fffff097          	auipc	ra,0xfffff
    80004d84:	bd0080e7          	jalr	-1072(ra) # 80003950 <_ZL8printIntiii>
    printString("\n");
    80004d88:	00003517          	auipc	a0,0x3
    80004d8c:	40050513          	addi	a0,a0,1024 # 80008188 <CONSOLE_STATUS+0x178>
    80004d90:	fffff097          	auipc	ra,0xfffff
    80004d94:	ee0080e7          	jalr	-288(ra) # 80003c70 <_Z11printStringPKc>

    delete obj;
    80004d98:	00048863          	beqz	s1,80004da8 <_Z10myUserMainv+0x228>
    80004d9c:	00048513          	mv	a0,s1
    80004da0:	ffffe097          	auipc	ra,0xffffe
    80004da4:	a18080e7          	jalr	-1512(ra) # 800027b8 <_ZdlPv>

    printString("User main finished\n");
    80004da8:	00003517          	auipc	a0,0x3
    80004dac:	6b050513          	addi	a0,a0,1712 # 80008458 <_ZZ14kprintUnsignedmE6digits+0x268>
    80004db0:	fffff097          	auipc	ra,0xfffff
    80004db4:	ec0080e7          	jalr	-320(ra) # 80003c70 <_Z11printStringPKc>
}
    80004db8:	05813083          	ld	ra,88(sp)
    80004dbc:	05013403          	ld	s0,80(sp)
    80004dc0:	04813483          	ld	s1,72(sp)
    80004dc4:	04013903          	ld	s2,64(sp)
    80004dc8:	06010113          	addi	sp,sp,96
    80004dcc:	00008067          	ret
    80004dd0:	00050913          	mv	s2,a0
    ProducerConsumer *obj = new ProducerConsumer();
    80004dd4:	00048513          	mv	a0,s1
    80004dd8:	ffffe097          	auipc	ra,0xffffe
    80004ddc:	9e0080e7          	jalr	-1568(ra) # 800027b8 <_ZdlPv>
    80004de0:	00090513          	mv	a0,s2
    80004de4:	00006097          	auipc	ra,0x6
    80004de8:	194080e7          	jalr	404(ra) # 8000af78 <_Unwind_Resume>

0000000080004dec <_Z8userMainv>:
#include "../test/ThreadSleep_C_API_test.hpp" // thread_sleep test C API
//#include "../test/ConsumerProducer_CPP_API_test.hpp" // zadatak 4. CPP API i asinhrona promena konteksta

#include "../test/myUserMain.h" // additional C API tests

void userMain() {
    80004dec:	ff010113          	addi	sp,sp,-16
    80004df0:	00113423          	sd	ra,8(sp)
    80004df4:	00813023          	sd	s0,0(sp)
    80004df8:	01010413          	addi	s0,sp,16
    Threads_C_API_test(); // zadatak 2., niti C API i sinhrona promena konteksta
    80004dfc:	fffff097          	auipc	ra,0xfffff
    80004e00:	6f4080e7          	jalr	1780(ra) # 800044f0 <_Z18Threads_C_API_testv>
    //Threads_CPP_API_test(); // zadatak 2., niti CPP API i sinhrona promena konteksta

//    producerConsumer_C_API(); // zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta
    //producerConsumer_CPP_Sync_API(); // zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta

    testSleeping(); // thread_sleep test C API
    80004e04:	00000097          	auipc	ra,0x0
    80004e08:	9e4080e7          	jalr	-1564(ra) # 800047e8 <_Z12testSleepingv>
    //ConsumerProducerCPP::testConsumerProducer(); // zadatak 4. CPP API i asinhrona promena konteksta, kompletan test svega

    myUserMain(); // additional C API tests - Extreme - Testing every functionality
    80004e0c:	00000097          	auipc	ra,0x0
    80004e10:	d74080e7          	jalr	-652(ra) # 80004b80 <_Z10myUserMainv>

    80004e14:	00813083          	ld	ra,8(sp)
    80004e18:	00013403          	ld	s0,0(sp)
    80004e1c:	01010113          	addi	sp,sp,16
    80004e20:	00008067          	ret

0000000080004e24 <_ZN16ProducerConsumer14produceWrapperEPv>:
        }

        printString("Consumer finished\n");
    }

    static void produceWrapper(void *obj) {
    80004e24:	fe010113          	addi	sp,sp,-32
    80004e28:	00113c23          	sd	ra,24(sp)
    80004e2c:	00813823          	sd	s0,16(sp)
    80004e30:	00913423          	sd	s1,8(sp)
    80004e34:	01213023          	sd	s2,0(sp)
    80004e38:	02010413          	addi	s0,sp,32
    80004e3c:	00050493          	mv	s1,a0
        for (int i = 1; i <= 150; i++) {
    80004e40:	00100913          	li	s2,1
    80004e44:	09600793          	li	a5,150
    80004e48:	0327c863          	blt	a5,s2,80004e78 <_ZN16ProducerConsumer14produceWrapperEPv+0x54>
            sem_wait(semProducer);
    80004e4c:	0004b503          	ld	a0,0(s1)
    80004e50:	ffffe097          	auipc	ra,0xffffe
    80004e54:	818080e7          	jalr	-2024(ra) # 80002668 <_Z8sem_waitP4_sem>
            value++;
    80004e58:	0104a783          	lw	a5,16(s1)
    80004e5c:	0017879b          	addiw	a5,a5,1
    80004e60:	00f4a823          	sw	a5,16(s1)
            sem_signal(semConsumer);
    80004e64:	0084b503          	ld	a0,8(s1)
    80004e68:	ffffe097          	auipc	ra,0xffffe
    80004e6c:	834080e7          	jalr	-1996(ra) # 8000269c <_Z10sem_signalP4_sem>
        for (int i = 1; i <= 150; i++) {
    80004e70:	0019091b          	addiw	s2,s2,1
    80004e74:	fd1ff06f          	j	80004e44 <_ZN16ProducerConsumer14produceWrapperEPv+0x20>
        int a = sem_close(semProducer);
    80004e78:	0004b503          	ld	a0,0(s1)
    80004e7c:	ffffd097          	auipc	ra,0xffffd
    80004e80:	7b8080e7          	jalr	1976(ra) # 80002634 <_Z9sem_closeP4_sem>
    80004e84:	00050913          	mv	s2,a0
        int b = sem_close(semConsumer);
    80004e88:	0084b503          	ld	a0,8(s1)
    80004e8c:	ffffd097          	auipc	ra,0xffffd
    80004e90:	7a8080e7          	jalr	1960(ra) # 80002634 <_Z9sem_closeP4_sem>
    80004e94:	00050493          	mv	s1,a0
        printString("Producer finished with exit values: ");
    80004e98:	00003517          	auipc	a0,0x3
    80004e9c:	5d850513          	addi	a0,a0,1496 # 80008470 <_ZZ14kprintUnsignedmE6digits+0x280>
    80004ea0:	fffff097          	auipc	ra,0xfffff
    80004ea4:	dd0080e7          	jalr	-560(ra) # 80003c70 <_Z11printStringPKc>
        printInt(a);
    80004ea8:	00000613          	li	a2,0
    80004eac:	00a00593          	li	a1,10
    80004eb0:	00090513          	mv	a0,s2
    80004eb4:	fffff097          	auipc	ra,0xfffff
    80004eb8:	a9c080e7          	jalr	-1380(ra) # 80003950 <_ZL8printIntiii>
        printString(" and ");
    80004ebc:	00003517          	auipc	a0,0x3
    80004ec0:	5dc50513          	addi	a0,a0,1500 # 80008498 <_ZZ14kprintUnsignedmE6digits+0x2a8>
    80004ec4:	fffff097          	auipc	ra,0xfffff
    80004ec8:	dac080e7          	jalr	-596(ra) # 80003c70 <_Z11printStringPKc>
        printInt(b);
    80004ecc:	00000613          	li	a2,0
    80004ed0:	00a00593          	li	a1,10
    80004ed4:	00048513          	mv	a0,s1
    80004ed8:	fffff097          	auipc	ra,0xfffff
    80004edc:	a78080e7          	jalr	-1416(ra) # 80003950 <_ZL8printIntiii>
        printString("\n");
    80004ee0:	00003517          	auipc	a0,0x3
    80004ee4:	2a850513          	addi	a0,a0,680 # 80008188 <CONSOLE_STATUS+0x178>
    80004ee8:	fffff097          	auipc	ra,0xfffff
    80004eec:	d88080e7          	jalr	-632(ra) # 80003c70 <_Z11printStringPKc>
        ProducerConsumer *pc = (ProducerConsumer *) obj;
        pc->produce();
    }
    80004ef0:	01813083          	ld	ra,24(sp)
    80004ef4:	01013403          	ld	s0,16(sp)
    80004ef8:	00813483          	ld	s1,8(sp)
    80004efc:	00013903          	ld	s2,0(sp)
    80004f00:	02010113          	addi	sp,sp,32
    80004f04:	00008067          	ret

0000000080004f08 <_ZN16ProducerConsumer14consumeWrapperEPv>:

    static void consumeWrapper(void *obj) {
    80004f08:	fe010113          	addi	sp,sp,-32
    80004f0c:	00113c23          	sd	ra,24(sp)
    80004f10:	00813823          	sd	s0,16(sp)
    80004f14:	00913423          	sd	s1,8(sp)
    80004f18:	01213023          	sd	s2,0(sp)
    80004f1c:	02010413          	addi	s0,sp,32
    80004f20:	00050493          	mv	s1,a0
        for (int i = 1; i <= 50; i++) {
    80004f24:	00100913          	li	s2,1
    80004f28:	03200793          	li	a5,50
    80004f2c:	0727c863          	blt	a5,s2,80004f9c <_ZN16ProducerConsumer14consumeWrapperEPv+0x94>
            sem_wait(semConsumer);
    80004f30:	0084b503          	ld	a0,8(s1)
    80004f34:	ffffd097          	auipc	ra,0xffffd
    80004f38:	734080e7          	jalr	1844(ra) # 80002668 <_Z8sem_waitP4_sem>
            printInt(value);
    80004f3c:	00000613          	li	a2,0
    80004f40:	00a00593          	li	a1,10
    80004f44:	0104a503          	lw	a0,16(s1)
    80004f48:	fffff097          	auipc	ra,0xfffff
    80004f4c:	a08080e7          	jalr	-1528(ra) # 80003950 <_ZL8printIntiii>
            printString(" squared is: ");
    80004f50:	00003517          	auipc	a0,0x3
    80004f54:	55050513          	addi	a0,a0,1360 # 800084a0 <_ZZ14kprintUnsignedmE6digits+0x2b0>
    80004f58:	fffff097          	auipc	ra,0xfffff
    80004f5c:	d18080e7          	jalr	-744(ra) # 80003c70 <_Z11printStringPKc>
            printInt(value * value);
    80004f60:	0104a503          	lw	a0,16(s1)
    80004f64:	00000613          	li	a2,0
    80004f68:	00a00593          	li	a1,10
    80004f6c:	02a5053b          	mulw	a0,a0,a0
    80004f70:	fffff097          	auipc	ra,0xfffff
    80004f74:	9e0080e7          	jalr	-1568(ra) # 80003950 <_ZL8printIntiii>
            printString("\n");
    80004f78:	00003517          	auipc	a0,0x3
    80004f7c:	21050513          	addi	a0,a0,528 # 80008188 <CONSOLE_STATUS+0x178>
    80004f80:	fffff097          	auipc	ra,0xfffff
    80004f84:	cf0080e7          	jalr	-784(ra) # 80003c70 <_Z11printStringPKc>
            sem_signal(semProducer);
    80004f88:	0004b503          	ld	a0,0(s1)
    80004f8c:	ffffd097          	auipc	ra,0xffffd
    80004f90:	710080e7          	jalr	1808(ra) # 8000269c <_Z10sem_signalP4_sem>
        for (int i = 1; i <= 50; i++) {
    80004f94:	0019091b          	addiw	s2,s2,1
    80004f98:	f91ff06f          	j	80004f28 <_ZN16ProducerConsumer14consumeWrapperEPv+0x20>
        printString("Consumer finished\n");
    80004f9c:	00003517          	auipc	a0,0x3
    80004fa0:	51450513          	addi	a0,a0,1300 # 800084b0 <_ZZ14kprintUnsignedmE6digits+0x2c0>
    80004fa4:	fffff097          	auipc	ra,0xfffff
    80004fa8:	ccc080e7          	jalr	-820(ra) # 80003c70 <_Z11printStringPKc>
        ProducerConsumer *pc = (ProducerConsumer *) obj;
        pc->consume();
    }
    80004fac:	01813083          	ld	ra,24(sp)
    80004fb0:	01013403          	ld	s0,16(sp)
    80004fb4:	00813483          	ld	s1,8(sp)
    80004fb8:	00013903          	ld	s2,0(sp)
    80004fbc:	02010113          	addi	sp,sp,32
    80004fc0:	00008067          	ret

0000000080004fc4 <start>:
    80004fc4:	ff010113          	addi	sp,sp,-16
    80004fc8:	00813423          	sd	s0,8(sp)
    80004fcc:	01010413          	addi	s0,sp,16
    80004fd0:	300027f3          	csrr	a5,mstatus
    80004fd4:	ffffe737          	lui	a4,0xffffe
    80004fd8:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff36ef>
    80004fdc:	00e7f7b3          	and	a5,a5,a4
    80004fe0:	00001737          	lui	a4,0x1
    80004fe4:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80004fe8:	00e7e7b3          	or	a5,a5,a4
    80004fec:	30079073          	csrw	mstatus,a5
    80004ff0:	00000797          	auipc	a5,0x0
    80004ff4:	16078793          	addi	a5,a5,352 # 80005150 <system_main>
    80004ff8:	34179073          	csrw	mepc,a5
    80004ffc:	00000793          	li	a5,0
    80005000:	18079073          	csrw	satp,a5
    80005004:	000107b7          	lui	a5,0x10
    80005008:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    8000500c:	30279073          	csrw	medeleg,a5
    80005010:	30379073          	csrw	mideleg,a5
    80005014:	104027f3          	csrr	a5,sie
    80005018:	2227e793          	ori	a5,a5,546
    8000501c:	10479073          	csrw	sie,a5
    80005020:	fff00793          	li	a5,-1
    80005024:	00a7d793          	srli	a5,a5,0xa
    80005028:	3b079073          	csrw	pmpaddr0,a5
    8000502c:	00f00793          	li	a5,15
    80005030:	3a079073          	csrw	pmpcfg0,a5
    80005034:	f14027f3          	csrr	a5,mhartid
    80005038:	0200c737          	lui	a4,0x200c
    8000503c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80005040:	0007869b          	sext.w	a3,a5
    80005044:	00269713          	slli	a4,a3,0x2
    80005048:	000f4637          	lui	a2,0xf4
    8000504c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80005050:	00d70733          	add	a4,a4,a3
    80005054:	0037979b          	slliw	a5,a5,0x3
    80005058:	020046b7          	lui	a3,0x2004
    8000505c:	00d787b3          	add	a5,a5,a3
    80005060:	00c585b3          	add	a1,a1,a2
    80005064:	00371693          	slli	a3,a4,0x3
    80005068:	00005717          	auipc	a4,0x5
    8000506c:	e4870713          	addi	a4,a4,-440 # 80009eb0 <timer_scratch>
    80005070:	00b7b023          	sd	a1,0(a5)
    80005074:	00d70733          	add	a4,a4,a3
    80005078:	00f73c23          	sd	a5,24(a4)
    8000507c:	02c73023          	sd	a2,32(a4)
    80005080:	34071073          	csrw	mscratch,a4
    80005084:	00000797          	auipc	a5,0x0
    80005088:	6ec78793          	addi	a5,a5,1772 # 80005770 <timervec>
    8000508c:	30579073          	csrw	mtvec,a5
    80005090:	300027f3          	csrr	a5,mstatus
    80005094:	0087e793          	ori	a5,a5,8
    80005098:	30079073          	csrw	mstatus,a5
    8000509c:	304027f3          	csrr	a5,mie
    800050a0:	0807e793          	ori	a5,a5,128
    800050a4:	30479073          	csrw	mie,a5
    800050a8:	f14027f3          	csrr	a5,mhartid
    800050ac:	0007879b          	sext.w	a5,a5
    800050b0:	00078213          	mv	tp,a5
    800050b4:	30200073          	mret
    800050b8:	00813403          	ld	s0,8(sp)
    800050bc:	01010113          	addi	sp,sp,16
    800050c0:	00008067          	ret

00000000800050c4 <timerinit>:
    800050c4:	ff010113          	addi	sp,sp,-16
    800050c8:	00813423          	sd	s0,8(sp)
    800050cc:	01010413          	addi	s0,sp,16
    800050d0:	f14027f3          	csrr	a5,mhartid
    800050d4:	0200c737          	lui	a4,0x200c
    800050d8:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800050dc:	0007869b          	sext.w	a3,a5
    800050e0:	00269713          	slli	a4,a3,0x2
    800050e4:	000f4637          	lui	a2,0xf4
    800050e8:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800050ec:	00d70733          	add	a4,a4,a3
    800050f0:	0037979b          	slliw	a5,a5,0x3
    800050f4:	020046b7          	lui	a3,0x2004
    800050f8:	00d787b3          	add	a5,a5,a3
    800050fc:	00c585b3          	add	a1,a1,a2
    80005100:	00371693          	slli	a3,a4,0x3
    80005104:	00005717          	auipc	a4,0x5
    80005108:	dac70713          	addi	a4,a4,-596 # 80009eb0 <timer_scratch>
    8000510c:	00b7b023          	sd	a1,0(a5)
    80005110:	00d70733          	add	a4,a4,a3
    80005114:	00f73c23          	sd	a5,24(a4)
    80005118:	02c73023          	sd	a2,32(a4)
    8000511c:	34071073          	csrw	mscratch,a4
    80005120:	00000797          	auipc	a5,0x0
    80005124:	65078793          	addi	a5,a5,1616 # 80005770 <timervec>
    80005128:	30579073          	csrw	mtvec,a5
    8000512c:	300027f3          	csrr	a5,mstatus
    80005130:	0087e793          	ori	a5,a5,8
    80005134:	30079073          	csrw	mstatus,a5
    80005138:	304027f3          	csrr	a5,mie
    8000513c:	0807e793          	ori	a5,a5,128
    80005140:	30479073          	csrw	mie,a5
    80005144:	00813403          	ld	s0,8(sp)
    80005148:	01010113          	addi	sp,sp,16
    8000514c:	00008067          	ret

0000000080005150 <system_main>:
    80005150:	fe010113          	addi	sp,sp,-32
    80005154:	00813823          	sd	s0,16(sp)
    80005158:	00913423          	sd	s1,8(sp)
    8000515c:	00113c23          	sd	ra,24(sp)
    80005160:	02010413          	addi	s0,sp,32
    80005164:	00000097          	auipc	ra,0x0
    80005168:	0c4080e7          	jalr	196(ra) # 80005228 <cpuid>
    8000516c:	00005497          	auipc	s1,0x5
    80005170:	cb448493          	addi	s1,s1,-844 # 80009e20 <started>
    80005174:	02050263          	beqz	a0,80005198 <system_main+0x48>
    80005178:	0004a783          	lw	a5,0(s1)
    8000517c:	0007879b          	sext.w	a5,a5
    80005180:	fe078ce3          	beqz	a5,80005178 <system_main+0x28>
    80005184:	0ff0000f          	fence
    80005188:	00003517          	auipc	a0,0x3
    8000518c:	38850513          	addi	a0,a0,904 # 80008510 <_ZL6digits+0x48>
    80005190:	00001097          	auipc	ra,0x1
    80005194:	a7c080e7          	jalr	-1412(ra) # 80005c0c <panic>
    80005198:	00001097          	auipc	ra,0x1
    8000519c:	9d0080e7          	jalr	-1584(ra) # 80005b68 <consoleinit>
    800051a0:	00001097          	auipc	ra,0x1
    800051a4:	15c080e7          	jalr	348(ra) # 800062fc <printfinit>
    800051a8:	00003517          	auipc	a0,0x3
    800051ac:	fe050513          	addi	a0,a0,-32 # 80008188 <CONSOLE_STATUS+0x178>
    800051b0:	00001097          	auipc	ra,0x1
    800051b4:	ab8080e7          	jalr	-1352(ra) # 80005c68 <__printf>
    800051b8:	00003517          	auipc	a0,0x3
    800051bc:	32850513          	addi	a0,a0,808 # 800084e0 <_ZL6digits+0x18>
    800051c0:	00001097          	auipc	ra,0x1
    800051c4:	aa8080e7          	jalr	-1368(ra) # 80005c68 <__printf>
    800051c8:	00003517          	auipc	a0,0x3
    800051cc:	fc050513          	addi	a0,a0,-64 # 80008188 <CONSOLE_STATUS+0x178>
    800051d0:	00001097          	auipc	ra,0x1
    800051d4:	a98080e7          	jalr	-1384(ra) # 80005c68 <__printf>
    800051d8:	00001097          	auipc	ra,0x1
    800051dc:	4b0080e7          	jalr	1200(ra) # 80006688 <kinit>
    800051e0:	00000097          	auipc	ra,0x0
    800051e4:	148080e7          	jalr	328(ra) # 80005328 <trapinit>
    800051e8:	00000097          	auipc	ra,0x0
    800051ec:	16c080e7          	jalr	364(ra) # 80005354 <trapinithart>
    800051f0:	00000097          	auipc	ra,0x0
    800051f4:	5c0080e7          	jalr	1472(ra) # 800057b0 <plicinit>
    800051f8:	00000097          	auipc	ra,0x0
    800051fc:	5e0080e7          	jalr	1504(ra) # 800057d8 <plicinithart>
    80005200:	00000097          	auipc	ra,0x0
    80005204:	078080e7          	jalr	120(ra) # 80005278 <userinit>
    80005208:	0ff0000f          	fence
    8000520c:	00100793          	li	a5,1
    80005210:	00003517          	auipc	a0,0x3
    80005214:	2e850513          	addi	a0,a0,744 # 800084f8 <_ZL6digits+0x30>
    80005218:	00f4a023          	sw	a5,0(s1)
    8000521c:	00001097          	auipc	ra,0x1
    80005220:	a4c080e7          	jalr	-1460(ra) # 80005c68 <__printf>
    80005224:	0000006f          	j	80005224 <system_main+0xd4>

0000000080005228 <cpuid>:
    80005228:	ff010113          	addi	sp,sp,-16
    8000522c:	00813423          	sd	s0,8(sp)
    80005230:	01010413          	addi	s0,sp,16
    80005234:	00020513          	mv	a0,tp
    80005238:	00813403          	ld	s0,8(sp)
    8000523c:	0005051b          	sext.w	a0,a0
    80005240:	01010113          	addi	sp,sp,16
    80005244:	00008067          	ret

0000000080005248 <mycpu>:
    80005248:	ff010113          	addi	sp,sp,-16
    8000524c:	00813423          	sd	s0,8(sp)
    80005250:	01010413          	addi	s0,sp,16
    80005254:	00020793          	mv	a5,tp
    80005258:	00813403          	ld	s0,8(sp)
    8000525c:	0007879b          	sext.w	a5,a5
    80005260:	00779793          	slli	a5,a5,0x7
    80005264:	00006517          	auipc	a0,0x6
    80005268:	c7c50513          	addi	a0,a0,-900 # 8000aee0 <cpus>
    8000526c:	00f50533          	add	a0,a0,a5
    80005270:	01010113          	addi	sp,sp,16
    80005274:	00008067          	ret

0000000080005278 <userinit>:
    80005278:	ff010113          	addi	sp,sp,-16
    8000527c:	00813423          	sd	s0,8(sp)
    80005280:	01010413          	addi	s0,sp,16
    80005284:	00813403          	ld	s0,8(sp)
    80005288:	01010113          	addi	sp,sp,16
    8000528c:	ffffc317          	auipc	t1,0xffffc
    80005290:	72430067          	jr	1828(t1) # 800019b0 <main>

0000000080005294 <either_copyout>:
    80005294:	ff010113          	addi	sp,sp,-16
    80005298:	00813023          	sd	s0,0(sp)
    8000529c:	00113423          	sd	ra,8(sp)
    800052a0:	01010413          	addi	s0,sp,16
    800052a4:	02051663          	bnez	a0,800052d0 <either_copyout+0x3c>
    800052a8:	00058513          	mv	a0,a1
    800052ac:	00060593          	mv	a1,a2
    800052b0:	0006861b          	sext.w	a2,a3
    800052b4:	00002097          	auipc	ra,0x2
    800052b8:	c60080e7          	jalr	-928(ra) # 80006f14 <__memmove>
    800052bc:	00813083          	ld	ra,8(sp)
    800052c0:	00013403          	ld	s0,0(sp)
    800052c4:	00000513          	li	a0,0
    800052c8:	01010113          	addi	sp,sp,16
    800052cc:	00008067          	ret
    800052d0:	00003517          	auipc	a0,0x3
    800052d4:	26850513          	addi	a0,a0,616 # 80008538 <_ZL6digits+0x70>
    800052d8:	00001097          	auipc	ra,0x1
    800052dc:	934080e7          	jalr	-1740(ra) # 80005c0c <panic>

00000000800052e0 <either_copyin>:
    800052e0:	ff010113          	addi	sp,sp,-16
    800052e4:	00813023          	sd	s0,0(sp)
    800052e8:	00113423          	sd	ra,8(sp)
    800052ec:	01010413          	addi	s0,sp,16
    800052f0:	02059463          	bnez	a1,80005318 <either_copyin+0x38>
    800052f4:	00060593          	mv	a1,a2
    800052f8:	0006861b          	sext.w	a2,a3
    800052fc:	00002097          	auipc	ra,0x2
    80005300:	c18080e7          	jalr	-1000(ra) # 80006f14 <__memmove>
    80005304:	00813083          	ld	ra,8(sp)
    80005308:	00013403          	ld	s0,0(sp)
    8000530c:	00000513          	li	a0,0
    80005310:	01010113          	addi	sp,sp,16
    80005314:	00008067          	ret
    80005318:	00003517          	auipc	a0,0x3
    8000531c:	24850513          	addi	a0,a0,584 # 80008560 <_ZL6digits+0x98>
    80005320:	00001097          	auipc	ra,0x1
    80005324:	8ec080e7          	jalr	-1812(ra) # 80005c0c <panic>

0000000080005328 <trapinit>:
    80005328:	ff010113          	addi	sp,sp,-16
    8000532c:	00813423          	sd	s0,8(sp)
    80005330:	01010413          	addi	s0,sp,16
    80005334:	00813403          	ld	s0,8(sp)
    80005338:	00003597          	auipc	a1,0x3
    8000533c:	25058593          	addi	a1,a1,592 # 80008588 <_ZL6digits+0xc0>
    80005340:	00006517          	auipc	a0,0x6
    80005344:	c2050513          	addi	a0,a0,-992 # 8000af60 <tickslock>
    80005348:	01010113          	addi	sp,sp,16
    8000534c:	00001317          	auipc	t1,0x1
    80005350:	5cc30067          	jr	1484(t1) # 80006918 <initlock>

0000000080005354 <trapinithart>:
    80005354:	ff010113          	addi	sp,sp,-16
    80005358:	00813423          	sd	s0,8(sp)
    8000535c:	01010413          	addi	s0,sp,16
    80005360:	00000797          	auipc	a5,0x0
    80005364:	30078793          	addi	a5,a5,768 # 80005660 <kernelvec>
    80005368:	10579073          	csrw	stvec,a5
    8000536c:	00813403          	ld	s0,8(sp)
    80005370:	01010113          	addi	sp,sp,16
    80005374:	00008067          	ret

0000000080005378 <usertrap>:
    80005378:	ff010113          	addi	sp,sp,-16
    8000537c:	00813423          	sd	s0,8(sp)
    80005380:	01010413          	addi	s0,sp,16
    80005384:	00813403          	ld	s0,8(sp)
    80005388:	01010113          	addi	sp,sp,16
    8000538c:	00008067          	ret

0000000080005390 <usertrapret>:
    80005390:	ff010113          	addi	sp,sp,-16
    80005394:	00813423          	sd	s0,8(sp)
    80005398:	01010413          	addi	s0,sp,16
    8000539c:	00813403          	ld	s0,8(sp)
    800053a0:	01010113          	addi	sp,sp,16
    800053a4:	00008067          	ret

00000000800053a8 <kerneltrap>:
    800053a8:	fe010113          	addi	sp,sp,-32
    800053ac:	00813823          	sd	s0,16(sp)
    800053b0:	00113c23          	sd	ra,24(sp)
    800053b4:	00913423          	sd	s1,8(sp)
    800053b8:	02010413          	addi	s0,sp,32
    800053bc:	142025f3          	csrr	a1,scause
    800053c0:	100027f3          	csrr	a5,sstatus
    800053c4:	0027f793          	andi	a5,a5,2
    800053c8:	10079c63          	bnez	a5,800054e0 <kerneltrap+0x138>
    800053cc:	142027f3          	csrr	a5,scause
    800053d0:	0207ce63          	bltz	a5,8000540c <kerneltrap+0x64>
    800053d4:	00003517          	auipc	a0,0x3
    800053d8:	1fc50513          	addi	a0,a0,508 # 800085d0 <_ZL6digits+0x108>
    800053dc:	00001097          	auipc	ra,0x1
    800053e0:	88c080e7          	jalr	-1908(ra) # 80005c68 <__printf>
    800053e4:	141025f3          	csrr	a1,sepc
    800053e8:	14302673          	csrr	a2,stval
    800053ec:	00003517          	auipc	a0,0x3
    800053f0:	1f450513          	addi	a0,a0,500 # 800085e0 <_ZL6digits+0x118>
    800053f4:	00001097          	auipc	ra,0x1
    800053f8:	874080e7          	jalr	-1932(ra) # 80005c68 <__printf>
    800053fc:	00003517          	auipc	a0,0x3
    80005400:	1fc50513          	addi	a0,a0,508 # 800085f8 <_ZL6digits+0x130>
    80005404:	00001097          	auipc	ra,0x1
    80005408:	808080e7          	jalr	-2040(ra) # 80005c0c <panic>
    8000540c:	0ff7f713          	andi	a4,a5,255
    80005410:	00900693          	li	a3,9
    80005414:	04d70063          	beq	a4,a3,80005454 <kerneltrap+0xac>
    80005418:	fff00713          	li	a4,-1
    8000541c:	03f71713          	slli	a4,a4,0x3f
    80005420:	00170713          	addi	a4,a4,1
    80005424:	fae798e3          	bne	a5,a4,800053d4 <kerneltrap+0x2c>
    80005428:	00000097          	auipc	ra,0x0
    8000542c:	e00080e7          	jalr	-512(ra) # 80005228 <cpuid>
    80005430:	06050663          	beqz	a0,8000549c <kerneltrap+0xf4>
    80005434:	144027f3          	csrr	a5,sip
    80005438:	ffd7f793          	andi	a5,a5,-3
    8000543c:	14479073          	csrw	sip,a5
    80005440:	01813083          	ld	ra,24(sp)
    80005444:	01013403          	ld	s0,16(sp)
    80005448:	00813483          	ld	s1,8(sp)
    8000544c:	02010113          	addi	sp,sp,32
    80005450:	00008067          	ret
    80005454:	00000097          	auipc	ra,0x0
    80005458:	3d0080e7          	jalr	976(ra) # 80005824 <plic_claim>
    8000545c:	00a00793          	li	a5,10
    80005460:	00050493          	mv	s1,a0
    80005464:	06f50863          	beq	a0,a5,800054d4 <kerneltrap+0x12c>
    80005468:	fc050ce3          	beqz	a0,80005440 <kerneltrap+0x98>
    8000546c:	00050593          	mv	a1,a0
    80005470:	00003517          	auipc	a0,0x3
    80005474:	14050513          	addi	a0,a0,320 # 800085b0 <_ZL6digits+0xe8>
    80005478:	00000097          	auipc	ra,0x0
    8000547c:	7f0080e7          	jalr	2032(ra) # 80005c68 <__printf>
    80005480:	01013403          	ld	s0,16(sp)
    80005484:	01813083          	ld	ra,24(sp)
    80005488:	00048513          	mv	a0,s1
    8000548c:	00813483          	ld	s1,8(sp)
    80005490:	02010113          	addi	sp,sp,32
    80005494:	00000317          	auipc	t1,0x0
    80005498:	3c830067          	jr	968(t1) # 8000585c <plic_complete>
    8000549c:	00006517          	auipc	a0,0x6
    800054a0:	ac450513          	addi	a0,a0,-1340 # 8000af60 <tickslock>
    800054a4:	00001097          	auipc	ra,0x1
    800054a8:	498080e7          	jalr	1176(ra) # 8000693c <acquire>
    800054ac:	00005717          	auipc	a4,0x5
    800054b0:	97870713          	addi	a4,a4,-1672 # 80009e24 <ticks>
    800054b4:	00072783          	lw	a5,0(a4)
    800054b8:	00006517          	auipc	a0,0x6
    800054bc:	aa850513          	addi	a0,a0,-1368 # 8000af60 <tickslock>
    800054c0:	0017879b          	addiw	a5,a5,1
    800054c4:	00f72023          	sw	a5,0(a4)
    800054c8:	00001097          	auipc	ra,0x1
    800054cc:	540080e7          	jalr	1344(ra) # 80006a08 <release>
    800054d0:	f65ff06f          	j	80005434 <kerneltrap+0x8c>
    800054d4:	00001097          	auipc	ra,0x1
    800054d8:	09c080e7          	jalr	156(ra) # 80006570 <uartintr>
    800054dc:	fa5ff06f          	j	80005480 <kerneltrap+0xd8>
    800054e0:	00003517          	auipc	a0,0x3
    800054e4:	0b050513          	addi	a0,a0,176 # 80008590 <_ZL6digits+0xc8>
    800054e8:	00000097          	auipc	ra,0x0
    800054ec:	724080e7          	jalr	1828(ra) # 80005c0c <panic>

00000000800054f0 <clockintr>:
    800054f0:	fe010113          	addi	sp,sp,-32
    800054f4:	00813823          	sd	s0,16(sp)
    800054f8:	00913423          	sd	s1,8(sp)
    800054fc:	00113c23          	sd	ra,24(sp)
    80005500:	02010413          	addi	s0,sp,32
    80005504:	00006497          	auipc	s1,0x6
    80005508:	a5c48493          	addi	s1,s1,-1444 # 8000af60 <tickslock>
    8000550c:	00048513          	mv	a0,s1
    80005510:	00001097          	auipc	ra,0x1
    80005514:	42c080e7          	jalr	1068(ra) # 8000693c <acquire>
    80005518:	00005717          	auipc	a4,0x5
    8000551c:	90c70713          	addi	a4,a4,-1780 # 80009e24 <ticks>
    80005520:	00072783          	lw	a5,0(a4)
    80005524:	01013403          	ld	s0,16(sp)
    80005528:	01813083          	ld	ra,24(sp)
    8000552c:	00048513          	mv	a0,s1
    80005530:	0017879b          	addiw	a5,a5,1
    80005534:	00813483          	ld	s1,8(sp)
    80005538:	00f72023          	sw	a5,0(a4)
    8000553c:	02010113          	addi	sp,sp,32
    80005540:	00001317          	auipc	t1,0x1
    80005544:	4c830067          	jr	1224(t1) # 80006a08 <release>

0000000080005548 <devintr>:
    80005548:	142027f3          	csrr	a5,scause
    8000554c:	00000513          	li	a0,0
    80005550:	0007c463          	bltz	a5,80005558 <devintr+0x10>
    80005554:	00008067          	ret
    80005558:	fe010113          	addi	sp,sp,-32
    8000555c:	00813823          	sd	s0,16(sp)
    80005560:	00113c23          	sd	ra,24(sp)
    80005564:	00913423          	sd	s1,8(sp)
    80005568:	02010413          	addi	s0,sp,32
    8000556c:	0ff7f713          	andi	a4,a5,255
    80005570:	00900693          	li	a3,9
    80005574:	04d70c63          	beq	a4,a3,800055cc <devintr+0x84>
    80005578:	fff00713          	li	a4,-1
    8000557c:	03f71713          	slli	a4,a4,0x3f
    80005580:	00170713          	addi	a4,a4,1
    80005584:	00e78c63          	beq	a5,a4,8000559c <devintr+0x54>
    80005588:	01813083          	ld	ra,24(sp)
    8000558c:	01013403          	ld	s0,16(sp)
    80005590:	00813483          	ld	s1,8(sp)
    80005594:	02010113          	addi	sp,sp,32
    80005598:	00008067          	ret
    8000559c:	00000097          	auipc	ra,0x0
    800055a0:	c8c080e7          	jalr	-884(ra) # 80005228 <cpuid>
    800055a4:	06050663          	beqz	a0,80005610 <devintr+0xc8>
    800055a8:	144027f3          	csrr	a5,sip
    800055ac:	ffd7f793          	andi	a5,a5,-3
    800055b0:	14479073          	csrw	sip,a5
    800055b4:	01813083          	ld	ra,24(sp)
    800055b8:	01013403          	ld	s0,16(sp)
    800055bc:	00813483          	ld	s1,8(sp)
    800055c0:	00200513          	li	a0,2
    800055c4:	02010113          	addi	sp,sp,32
    800055c8:	00008067          	ret
    800055cc:	00000097          	auipc	ra,0x0
    800055d0:	258080e7          	jalr	600(ra) # 80005824 <plic_claim>
    800055d4:	00a00793          	li	a5,10
    800055d8:	00050493          	mv	s1,a0
    800055dc:	06f50663          	beq	a0,a5,80005648 <devintr+0x100>
    800055e0:	00100513          	li	a0,1
    800055e4:	fa0482e3          	beqz	s1,80005588 <devintr+0x40>
    800055e8:	00048593          	mv	a1,s1
    800055ec:	00003517          	auipc	a0,0x3
    800055f0:	fc450513          	addi	a0,a0,-60 # 800085b0 <_ZL6digits+0xe8>
    800055f4:	00000097          	auipc	ra,0x0
    800055f8:	674080e7          	jalr	1652(ra) # 80005c68 <__printf>
    800055fc:	00048513          	mv	a0,s1
    80005600:	00000097          	auipc	ra,0x0
    80005604:	25c080e7          	jalr	604(ra) # 8000585c <plic_complete>
    80005608:	00100513          	li	a0,1
    8000560c:	f7dff06f          	j	80005588 <devintr+0x40>
    80005610:	00006517          	auipc	a0,0x6
    80005614:	95050513          	addi	a0,a0,-1712 # 8000af60 <tickslock>
    80005618:	00001097          	auipc	ra,0x1
    8000561c:	324080e7          	jalr	804(ra) # 8000693c <acquire>
    80005620:	00005717          	auipc	a4,0x5
    80005624:	80470713          	addi	a4,a4,-2044 # 80009e24 <ticks>
    80005628:	00072783          	lw	a5,0(a4)
    8000562c:	00006517          	auipc	a0,0x6
    80005630:	93450513          	addi	a0,a0,-1740 # 8000af60 <tickslock>
    80005634:	0017879b          	addiw	a5,a5,1
    80005638:	00f72023          	sw	a5,0(a4)
    8000563c:	00001097          	auipc	ra,0x1
    80005640:	3cc080e7          	jalr	972(ra) # 80006a08 <release>
    80005644:	f65ff06f          	j	800055a8 <devintr+0x60>
    80005648:	00001097          	auipc	ra,0x1
    8000564c:	f28080e7          	jalr	-216(ra) # 80006570 <uartintr>
    80005650:	fadff06f          	j	800055fc <devintr+0xb4>
	...

0000000080005660 <kernelvec>:
    80005660:	f0010113          	addi	sp,sp,-256
    80005664:	00113023          	sd	ra,0(sp)
    80005668:	00213423          	sd	sp,8(sp)
    8000566c:	00313823          	sd	gp,16(sp)
    80005670:	00413c23          	sd	tp,24(sp)
    80005674:	02513023          	sd	t0,32(sp)
    80005678:	02613423          	sd	t1,40(sp)
    8000567c:	02713823          	sd	t2,48(sp)
    80005680:	02813c23          	sd	s0,56(sp)
    80005684:	04913023          	sd	s1,64(sp)
    80005688:	04a13423          	sd	a0,72(sp)
    8000568c:	04b13823          	sd	a1,80(sp)
    80005690:	04c13c23          	sd	a2,88(sp)
    80005694:	06d13023          	sd	a3,96(sp)
    80005698:	06e13423          	sd	a4,104(sp)
    8000569c:	06f13823          	sd	a5,112(sp)
    800056a0:	07013c23          	sd	a6,120(sp)
    800056a4:	09113023          	sd	a7,128(sp)
    800056a8:	09213423          	sd	s2,136(sp)
    800056ac:	09313823          	sd	s3,144(sp)
    800056b0:	09413c23          	sd	s4,152(sp)
    800056b4:	0b513023          	sd	s5,160(sp)
    800056b8:	0b613423          	sd	s6,168(sp)
    800056bc:	0b713823          	sd	s7,176(sp)
    800056c0:	0b813c23          	sd	s8,184(sp)
    800056c4:	0d913023          	sd	s9,192(sp)
    800056c8:	0da13423          	sd	s10,200(sp)
    800056cc:	0db13823          	sd	s11,208(sp)
    800056d0:	0dc13c23          	sd	t3,216(sp)
    800056d4:	0fd13023          	sd	t4,224(sp)
    800056d8:	0fe13423          	sd	t5,232(sp)
    800056dc:	0ff13823          	sd	t6,240(sp)
    800056e0:	cc9ff0ef          	jal	ra,800053a8 <kerneltrap>
    800056e4:	00013083          	ld	ra,0(sp)
    800056e8:	00813103          	ld	sp,8(sp)
    800056ec:	01013183          	ld	gp,16(sp)
    800056f0:	02013283          	ld	t0,32(sp)
    800056f4:	02813303          	ld	t1,40(sp)
    800056f8:	03013383          	ld	t2,48(sp)
    800056fc:	03813403          	ld	s0,56(sp)
    80005700:	04013483          	ld	s1,64(sp)
    80005704:	04813503          	ld	a0,72(sp)
    80005708:	05013583          	ld	a1,80(sp)
    8000570c:	05813603          	ld	a2,88(sp)
    80005710:	06013683          	ld	a3,96(sp)
    80005714:	06813703          	ld	a4,104(sp)
    80005718:	07013783          	ld	a5,112(sp)
    8000571c:	07813803          	ld	a6,120(sp)
    80005720:	08013883          	ld	a7,128(sp)
    80005724:	08813903          	ld	s2,136(sp)
    80005728:	09013983          	ld	s3,144(sp)
    8000572c:	09813a03          	ld	s4,152(sp)
    80005730:	0a013a83          	ld	s5,160(sp)
    80005734:	0a813b03          	ld	s6,168(sp)
    80005738:	0b013b83          	ld	s7,176(sp)
    8000573c:	0b813c03          	ld	s8,184(sp)
    80005740:	0c013c83          	ld	s9,192(sp)
    80005744:	0c813d03          	ld	s10,200(sp)
    80005748:	0d013d83          	ld	s11,208(sp)
    8000574c:	0d813e03          	ld	t3,216(sp)
    80005750:	0e013e83          	ld	t4,224(sp)
    80005754:	0e813f03          	ld	t5,232(sp)
    80005758:	0f013f83          	ld	t6,240(sp)
    8000575c:	10010113          	addi	sp,sp,256
    80005760:	10200073          	sret
    80005764:	00000013          	nop
    80005768:	00000013          	nop
    8000576c:	00000013          	nop

0000000080005770 <timervec>:
    80005770:	34051573          	csrrw	a0,mscratch,a0
    80005774:	00b53023          	sd	a1,0(a0)
    80005778:	00c53423          	sd	a2,8(a0)
    8000577c:	00d53823          	sd	a3,16(a0)
    80005780:	01853583          	ld	a1,24(a0)
    80005784:	02053603          	ld	a2,32(a0)
    80005788:	0005b683          	ld	a3,0(a1)
    8000578c:	00c686b3          	add	a3,a3,a2
    80005790:	00d5b023          	sd	a3,0(a1)
    80005794:	00200593          	li	a1,2
    80005798:	14459073          	csrw	sip,a1
    8000579c:	01053683          	ld	a3,16(a0)
    800057a0:	00853603          	ld	a2,8(a0)
    800057a4:	00053583          	ld	a1,0(a0)
    800057a8:	34051573          	csrrw	a0,mscratch,a0
    800057ac:	30200073          	mret

00000000800057b0 <plicinit>:
    800057b0:	ff010113          	addi	sp,sp,-16
    800057b4:	00813423          	sd	s0,8(sp)
    800057b8:	01010413          	addi	s0,sp,16
    800057bc:	00813403          	ld	s0,8(sp)
    800057c0:	0c0007b7          	lui	a5,0xc000
    800057c4:	00100713          	li	a4,1
    800057c8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    800057cc:	00e7a223          	sw	a4,4(a5)
    800057d0:	01010113          	addi	sp,sp,16
    800057d4:	00008067          	ret

00000000800057d8 <plicinithart>:
    800057d8:	ff010113          	addi	sp,sp,-16
    800057dc:	00813023          	sd	s0,0(sp)
    800057e0:	00113423          	sd	ra,8(sp)
    800057e4:	01010413          	addi	s0,sp,16
    800057e8:	00000097          	auipc	ra,0x0
    800057ec:	a40080e7          	jalr	-1472(ra) # 80005228 <cpuid>
    800057f0:	0085171b          	slliw	a4,a0,0x8
    800057f4:	0c0027b7          	lui	a5,0xc002
    800057f8:	00e787b3          	add	a5,a5,a4
    800057fc:	40200713          	li	a4,1026
    80005800:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80005804:	00813083          	ld	ra,8(sp)
    80005808:	00013403          	ld	s0,0(sp)
    8000580c:	00d5151b          	slliw	a0,a0,0xd
    80005810:	0c2017b7          	lui	a5,0xc201
    80005814:	00a78533          	add	a0,a5,a0
    80005818:	00052023          	sw	zero,0(a0)
    8000581c:	01010113          	addi	sp,sp,16
    80005820:	00008067          	ret

0000000080005824 <plic_claim>:
    80005824:	ff010113          	addi	sp,sp,-16
    80005828:	00813023          	sd	s0,0(sp)
    8000582c:	00113423          	sd	ra,8(sp)
    80005830:	01010413          	addi	s0,sp,16
    80005834:	00000097          	auipc	ra,0x0
    80005838:	9f4080e7          	jalr	-1548(ra) # 80005228 <cpuid>
    8000583c:	00813083          	ld	ra,8(sp)
    80005840:	00013403          	ld	s0,0(sp)
    80005844:	00d5151b          	slliw	a0,a0,0xd
    80005848:	0c2017b7          	lui	a5,0xc201
    8000584c:	00a78533          	add	a0,a5,a0
    80005850:	00452503          	lw	a0,4(a0)
    80005854:	01010113          	addi	sp,sp,16
    80005858:	00008067          	ret

000000008000585c <plic_complete>:
    8000585c:	fe010113          	addi	sp,sp,-32
    80005860:	00813823          	sd	s0,16(sp)
    80005864:	00913423          	sd	s1,8(sp)
    80005868:	00113c23          	sd	ra,24(sp)
    8000586c:	02010413          	addi	s0,sp,32
    80005870:	00050493          	mv	s1,a0
    80005874:	00000097          	auipc	ra,0x0
    80005878:	9b4080e7          	jalr	-1612(ra) # 80005228 <cpuid>
    8000587c:	01813083          	ld	ra,24(sp)
    80005880:	01013403          	ld	s0,16(sp)
    80005884:	00d5179b          	slliw	a5,a0,0xd
    80005888:	0c201737          	lui	a4,0xc201
    8000588c:	00f707b3          	add	a5,a4,a5
    80005890:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80005894:	00813483          	ld	s1,8(sp)
    80005898:	02010113          	addi	sp,sp,32
    8000589c:	00008067          	ret

00000000800058a0 <consolewrite>:
    800058a0:	fb010113          	addi	sp,sp,-80
    800058a4:	04813023          	sd	s0,64(sp)
    800058a8:	04113423          	sd	ra,72(sp)
    800058ac:	02913c23          	sd	s1,56(sp)
    800058b0:	03213823          	sd	s2,48(sp)
    800058b4:	03313423          	sd	s3,40(sp)
    800058b8:	03413023          	sd	s4,32(sp)
    800058bc:	01513c23          	sd	s5,24(sp)
    800058c0:	05010413          	addi	s0,sp,80
    800058c4:	06c05c63          	blez	a2,8000593c <consolewrite+0x9c>
    800058c8:	00060993          	mv	s3,a2
    800058cc:	00050a13          	mv	s4,a0
    800058d0:	00058493          	mv	s1,a1
    800058d4:	00000913          	li	s2,0
    800058d8:	fff00a93          	li	s5,-1
    800058dc:	01c0006f          	j	800058f8 <consolewrite+0x58>
    800058e0:	fbf44503          	lbu	a0,-65(s0)
    800058e4:	0019091b          	addiw	s2,s2,1
    800058e8:	00148493          	addi	s1,s1,1
    800058ec:	00001097          	auipc	ra,0x1
    800058f0:	a9c080e7          	jalr	-1380(ra) # 80006388 <uartputc>
    800058f4:	03298063          	beq	s3,s2,80005914 <consolewrite+0x74>
    800058f8:	00048613          	mv	a2,s1
    800058fc:	00100693          	li	a3,1
    80005900:	000a0593          	mv	a1,s4
    80005904:	fbf40513          	addi	a0,s0,-65
    80005908:	00000097          	auipc	ra,0x0
    8000590c:	9d8080e7          	jalr	-1576(ra) # 800052e0 <either_copyin>
    80005910:	fd5518e3          	bne	a0,s5,800058e0 <consolewrite+0x40>
    80005914:	04813083          	ld	ra,72(sp)
    80005918:	04013403          	ld	s0,64(sp)
    8000591c:	03813483          	ld	s1,56(sp)
    80005920:	02813983          	ld	s3,40(sp)
    80005924:	02013a03          	ld	s4,32(sp)
    80005928:	01813a83          	ld	s5,24(sp)
    8000592c:	00090513          	mv	a0,s2
    80005930:	03013903          	ld	s2,48(sp)
    80005934:	05010113          	addi	sp,sp,80
    80005938:	00008067          	ret
    8000593c:	00000913          	li	s2,0
    80005940:	fd5ff06f          	j	80005914 <consolewrite+0x74>

0000000080005944 <consoleread>:
    80005944:	f9010113          	addi	sp,sp,-112
    80005948:	06813023          	sd	s0,96(sp)
    8000594c:	04913c23          	sd	s1,88(sp)
    80005950:	05213823          	sd	s2,80(sp)
    80005954:	05313423          	sd	s3,72(sp)
    80005958:	05413023          	sd	s4,64(sp)
    8000595c:	03513c23          	sd	s5,56(sp)
    80005960:	03613823          	sd	s6,48(sp)
    80005964:	03713423          	sd	s7,40(sp)
    80005968:	03813023          	sd	s8,32(sp)
    8000596c:	06113423          	sd	ra,104(sp)
    80005970:	01913c23          	sd	s9,24(sp)
    80005974:	07010413          	addi	s0,sp,112
    80005978:	00060b93          	mv	s7,a2
    8000597c:	00050913          	mv	s2,a0
    80005980:	00058c13          	mv	s8,a1
    80005984:	00060b1b          	sext.w	s6,a2
    80005988:	00005497          	auipc	s1,0x5
    8000598c:	60048493          	addi	s1,s1,1536 # 8000af88 <cons>
    80005990:	00400993          	li	s3,4
    80005994:	fff00a13          	li	s4,-1
    80005998:	00a00a93          	li	s5,10
    8000599c:	05705e63          	blez	s7,800059f8 <consoleread+0xb4>
    800059a0:	09c4a703          	lw	a4,156(s1)
    800059a4:	0984a783          	lw	a5,152(s1)
    800059a8:	0007071b          	sext.w	a4,a4
    800059ac:	08e78463          	beq	a5,a4,80005a34 <consoleread+0xf0>
    800059b0:	07f7f713          	andi	a4,a5,127
    800059b4:	00e48733          	add	a4,s1,a4
    800059b8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    800059bc:	0017869b          	addiw	a3,a5,1
    800059c0:	08d4ac23          	sw	a3,152(s1)
    800059c4:	00070c9b          	sext.w	s9,a4
    800059c8:	0b370663          	beq	a4,s3,80005a74 <consoleread+0x130>
    800059cc:	00100693          	li	a3,1
    800059d0:	f9f40613          	addi	a2,s0,-97
    800059d4:	000c0593          	mv	a1,s8
    800059d8:	00090513          	mv	a0,s2
    800059dc:	f8e40fa3          	sb	a4,-97(s0)
    800059e0:	00000097          	auipc	ra,0x0
    800059e4:	8b4080e7          	jalr	-1868(ra) # 80005294 <either_copyout>
    800059e8:	01450863          	beq	a0,s4,800059f8 <consoleread+0xb4>
    800059ec:	001c0c13          	addi	s8,s8,1
    800059f0:	fffb8b9b          	addiw	s7,s7,-1
    800059f4:	fb5c94e3          	bne	s9,s5,8000599c <consoleread+0x58>
    800059f8:	000b851b          	sext.w	a0,s7
    800059fc:	06813083          	ld	ra,104(sp)
    80005a00:	06013403          	ld	s0,96(sp)
    80005a04:	05813483          	ld	s1,88(sp)
    80005a08:	05013903          	ld	s2,80(sp)
    80005a0c:	04813983          	ld	s3,72(sp)
    80005a10:	04013a03          	ld	s4,64(sp)
    80005a14:	03813a83          	ld	s5,56(sp)
    80005a18:	02813b83          	ld	s7,40(sp)
    80005a1c:	02013c03          	ld	s8,32(sp)
    80005a20:	01813c83          	ld	s9,24(sp)
    80005a24:	40ab053b          	subw	a0,s6,a0
    80005a28:	03013b03          	ld	s6,48(sp)
    80005a2c:	07010113          	addi	sp,sp,112
    80005a30:	00008067          	ret
    80005a34:	00001097          	auipc	ra,0x1
    80005a38:	1d8080e7          	jalr	472(ra) # 80006c0c <push_on>
    80005a3c:	0984a703          	lw	a4,152(s1)
    80005a40:	09c4a783          	lw	a5,156(s1)
    80005a44:	0007879b          	sext.w	a5,a5
    80005a48:	fef70ce3          	beq	a4,a5,80005a40 <consoleread+0xfc>
    80005a4c:	00001097          	auipc	ra,0x1
    80005a50:	234080e7          	jalr	564(ra) # 80006c80 <pop_on>
    80005a54:	0984a783          	lw	a5,152(s1)
    80005a58:	07f7f713          	andi	a4,a5,127
    80005a5c:	00e48733          	add	a4,s1,a4
    80005a60:	01874703          	lbu	a4,24(a4)
    80005a64:	0017869b          	addiw	a3,a5,1
    80005a68:	08d4ac23          	sw	a3,152(s1)
    80005a6c:	00070c9b          	sext.w	s9,a4
    80005a70:	f5371ee3          	bne	a4,s3,800059cc <consoleread+0x88>
    80005a74:	000b851b          	sext.w	a0,s7
    80005a78:	f96bf2e3          	bgeu	s7,s6,800059fc <consoleread+0xb8>
    80005a7c:	08f4ac23          	sw	a5,152(s1)
    80005a80:	f7dff06f          	j	800059fc <consoleread+0xb8>

0000000080005a84 <consputc>:
    80005a84:	10000793          	li	a5,256
    80005a88:	00f50663          	beq	a0,a5,80005a94 <consputc+0x10>
    80005a8c:	00001317          	auipc	t1,0x1
    80005a90:	9f430067          	jr	-1548(t1) # 80006480 <uartputc_sync>
    80005a94:	ff010113          	addi	sp,sp,-16
    80005a98:	00113423          	sd	ra,8(sp)
    80005a9c:	00813023          	sd	s0,0(sp)
    80005aa0:	01010413          	addi	s0,sp,16
    80005aa4:	00800513          	li	a0,8
    80005aa8:	00001097          	auipc	ra,0x1
    80005aac:	9d8080e7          	jalr	-1576(ra) # 80006480 <uartputc_sync>
    80005ab0:	02000513          	li	a0,32
    80005ab4:	00001097          	auipc	ra,0x1
    80005ab8:	9cc080e7          	jalr	-1588(ra) # 80006480 <uartputc_sync>
    80005abc:	00013403          	ld	s0,0(sp)
    80005ac0:	00813083          	ld	ra,8(sp)
    80005ac4:	00800513          	li	a0,8
    80005ac8:	01010113          	addi	sp,sp,16
    80005acc:	00001317          	auipc	t1,0x1
    80005ad0:	9b430067          	jr	-1612(t1) # 80006480 <uartputc_sync>

0000000080005ad4 <consoleintr>:
    80005ad4:	fe010113          	addi	sp,sp,-32
    80005ad8:	00813823          	sd	s0,16(sp)
    80005adc:	00913423          	sd	s1,8(sp)
    80005ae0:	01213023          	sd	s2,0(sp)
    80005ae4:	00113c23          	sd	ra,24(sp)
    80005ae8:	02010413          	addi	s0,sp,32
    80005aec:	00005917          	auipc	s2,0x5
    80005af0:	49c90913          	addi	s2,s2,1180 # 8000af88 <cons>
    80005af4:	00050493          	mv	s1,a0
    80005af8:	00090513          	mv	a0,s2
    80005afc:	00001097          	auipc	ra,0x1
    80005b00:	e40080e7          	jalr	-448(ra) # 8000693c <acquire>
    80005b04:	02048c63          	beqz	s1,80005b3c <consoleintr+0x68>
    80005b08:	0a092783          	lw	a5,160(s2)
    80005b0c:	09892703          	lw	a4,152(s2)
    80005b10:	07f00693          	li	a3,127
    80005b14:	40e7873b          	subw	a4,a5,a4
    80005b18:	02e6e263          	bltu	a3,a4,80005b3c <consoleintr+0x68>
    80005b1c:	00d00713          	li	a4,13
    80005b20:	04e48063          	beq	s1,a4,80005b60 <consoleintr+0x8c>
    80005b24:	07f7f713          	andi	a4,a5,127
    80005b28:	00e90733          	add	a4,s2,a4
    80005b2c:	0017879b          	addiw	a5,a5,1
    80005b30:	0af92023          	sw	a5,160(s2)
    80005b34:	00970c23          	sb	s1,24(a4)
    80005b38:	08f92e23          	sw	a5,156(s2)
    80005b3c:	01013403          	ld	s0,16(sp)
    80005b40:	01813083          	ld	ra,24(sp)
    80005b44:	00813483          	ld	s1,8(sp)
    80005b48:	00013903          	ld	s2,0(sp)
    80005b4c:	00005517          	auipc	a0,0x5
    80005b50:	43c50513          	addi	a0,a0,1084 # 8000af88 <cons>
    80005b54:	02010113          	addi	sp,sp,32
    80005b58:	00001317          	auipc	t1,0x1
    80005b5c:	eb030067          	jr	-336(t1) # 80006a08 <release>
    80005b60:	00a00493          	li	s1,10
    80005b64:	fc1ff06f          	j	80005b24 <consoleintr+0x50>

0000000080005b68 <consoleinit>:
    80005b68:	fe010113          	addi	sp,sp,-32
    80005b6c:	00113c23          	sd	ra,24(sp)
    80005b70:	00813823          	sd	s0,16(sp)
    80005b74:	00913423          	sd	s1,8(sp)
    80005b78:	02010413          	addi	s0,sp,32
    80005b7c:	00005497          	auipc	s1,0x5
    80005b80:	40c48493          	addi	s1,s1,1036 # 8000af88 <cons>
    80005b84:	00048513          	mv	a0,s1
    80005b88:	00003597          	auipc	a1,0x3
    80005b8c:	a8058593          	addi	a1,a1,-1408 # 80008608 <_ZL6digits+0x140>
    80005b90:	00001097          	auipc	ra,0x1
    80005b94:	d88080e7          	jalr	-632(ra) # 80006918 <initlock>
    80005b98:	00000097          	auipc	ra,0x0
    80005b9c:	7ac080e7          	jalr	1964(ra) # 80006344 <uartinit>
    80005ba0:	01813083          	ld	ra,24(sp)
    80005ba4:	01013403          	ld	s0,16(sp)
    80005ba8:	00000797          	auipc	a5,0x0
    80005bac:	d9c78793          	addi	a5,a5,-612 # 80005944 <consoleread>
    80005bb0:	0af4bc23          	sd	a5,184(s1)
    80005bb4:	00000797          	auipc	a5,0x0
    80005bb8:	cec78793          	addi	a5,a5,-788 # 800058a0 <consolewrite>
    80005bbc:	0cf4b023          	sd	a5,192(s1)
    80005bc0:	00813483          	ld	s1,8(sp)
    80005bc4:	02010113          	addi	sp,sp,32
    80005bc8:	00008067          	ret

0000000080005bcc <console_read>:
    80005bcc:	ff010113          	addi	sp,sp,-16
    80005bd0:	00813423          	sd	s0,8(sp)
    80005bd4:	01010413          	addi	s0,sp,16
    80005bd8:	00813403          	ld	s0,8(sp)
    80005bdc:	00005317          	auipc	t1,0x5
    80005be0:	46433303          	ld	t1,1124(t1) # 8000b040 <devsw+0x10>
    80005be4:	01010113          	addi	sp,sp,16
    80005be8:	00030067          	jr	t1

0000000080005bec <console_write>:
    80005bec:	ff010113          	addi	sp,sp,-16
    80005bf0:	00813423          	sd	s0,8(sp)
    80005bf4:	01010413          	addi	s0,sp,16
    80005bf8:	00813403          	ld	s0,8(sp)
    80005bfc:	00005317          	auipc	t1,0x5
    80005c00:	44c33303          	ld	t1,1100(t1) # 8000b048 <devsw+0x18>
    80005c04:	01010113          	addi	sp,sp,16
    80005c08:	00030067          	jr	t1

0000000080005c0c <panic>:
    80005c0c:	fe010113          	addi	sp,sp,-32
    80005c10:	00113c23          	sd	ra,24(sp)
    80005c14:	00813823          	sd	s0,16(sp)
    80005c18:	00913423          	sd	s1,8(sp)
    80005c1c:	02010413          	addi	s0,sp,32
    80005c20:	00050493          	mv	s1,a0
    80005c24:	00003517          	auipc	a0,0x3
    80005c28:	9ec50513          	addi	a0,a0,-1556 # 80008610 <_ZL6digits+0x148>
    80005c2c:	00005797          	auipc	a5,0x5
    80005c30:	4a07ae23          	sw	zero,1212(a5) # 8000b0e8 <pr+0x18>
    80005c34:	00000097          	auipc	ra,0x0
    80005c38:	034080e7          	jalr	52(ra) # 80005c68 <__printf>
    80005c3c:	00048513          	mv	a0,s1
    80005c40:	00000097          	auipc	ra,0x0
    80005c44:	028080e7          	jalr	40(ra) # 80005c68 <__printf>
    80005c48:	00002517          	auipc	a0,0x2
    80005c4c:	54050513          	addi	a0,a0,1344 # 80008188 <CONSOLE_STATUS+0x178>
    80005c50:	00000097          	auipc	ra,0x0
    80005c54:	018080e7          	jalr	24(ra) # 80005c68 <__printf>
    80005c58:	00100793          	li	a5,1
    80005c5c:	00004717          	auipc	a4,0x4
    80005c60:	1cf72623          	sw	a5,460(a4) # 80009e28 <panicked>
    80005c64:	0000006f          	j	80005c64 <panic+0x58>

0000000080005c68 <__printf>:
    80005c68:	f3010113          	addi	sp,sp,-208
    80005c6c:	08813023          	sd	s0,128(sp)
    80005c70:	07313423          	sd	s3,104(sp)
    80005c74:	09010413          	addi	s0,sp,144
    80005c78:	05813023          	sd	s8,64(sp)
    80005c7c:	08113423          	sd	ra,136(sp)
    80005c80:	06913c23          	sd	s1,120(sp)
    80005c84:	07213823          	sd	s2,112(sp)
    80005c88:	07413023          	sd	s4,96(sp)
    80005c8c:	05513c23          	sd	s5,88(sp)
    80005c90:	05613823          	sd	s6,80(sp)
    80005c94:	05713423          	sd	s7,72(sp)
    80005c98:	03913c23          	sd	s9,56(sp)
    80005c9c:	03a13823          	sd	s10,48(sp)
    80005ca0:	03b13423          	sd	s11,40(sp)
    80005ca4:	00005317          	auipc	t1,0x5
    80005ca8:	42c30313          	addi	t1,t1,1068 # 8000b0d0 <pr>
    80005cac:	01832c03          	lw	s8,24(t1)
    80005cb0:	00b43423          	sd	a1,8(s0)
    80005cb4:	00c43823          	sd	a2,16(s0)
    80005cb8:	00d43c23          	sd	a3,24(s0)
    80005cbc:	02e43023          	sd	a4,32(s0)
    80005cc0:	02f43423          	sd	a5,40(s0)
    80005cc4:	03043823          	sd	a6,48(s0)
    80005cc8:	03143c23          	sd	a7,56(s0)
    80005ccc:	00050993          	mv	s3,a0
    80005cd0:	4a0c1663          	bnez	s8,8000617c <__printf+0x514>
    80005cd4:	60098c63          	beqz	s3,800062ec <__printf+0x684>
    80005cd8:	0009c503          	lbu	a0,0(s3)
    80005cdc:	00840793          	addi	a5,s0,8
    80005ce0:	f6f43c23          	sd	a5,-136(s0)
    80005ce4:	00000493          	li	s1,0
    80005ce8:	22050063          	beqz	a0,80005f08 <__printf+0x2a0>
    80005cec:	00002a37          	lui	s4,0x2
    80005cf0:	00018ab7          	lui	s5,0x18
    80005cf4:	000f4b37          	lui	s6,0xf4
    80005cf8:	00989bb7          	lui	s7,0x989
    80005cfc:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80005d00:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80005d04:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80005d08:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80005d0c:	00148c9b          	addiw	s9,s1,1
    80005d10:	02500793          	li	a5,37
    80005d14:	01998933          	add	s2,s3,s9
    80005d18:	38f51263          	bne	a0,a5,8000609c <__printf+0x434>
    80005d1c:	00094783          	lbu	a5,0(s2)
    80005d20:	00078c9b          	sext.w	s9,a5
    80005d24:	1e078263          	beqz	a5,80005f08 <__printf+0x2a0>
    80005d28:	0024849b          	addiw	s1,s1,2
    80005d2c:	07000713          	li	a4,112
    80005d30:	00998933          	add	s2,s3,s1
    80005d34:	38e78a63          	beq	a5,a4,800060c8 <__printf+0x460>
    80005d38:	20f76863          	bltu	a4,a5,80005f48 <__printf+0x2e0>
    80005d3c:	42a78863          	beq	a5,a0,8000616c <__printf+0x504>
    80005d40:	06400713          	li	a4,100
    80005d44:	40e79663          	bne	a5,a4,80006150 <__printf+0x4e8>
    80005d48:	f7843783          	ld	a5,-136(s0)
    80005d4c:	0007a603          	lw	a2,0(a5)
    80005d50:	00878793          	addi	a5,a5,8
    80005d54:	f6f43c23          	sd	a5,-136(s0)
    80005d58:	42064a63          	bltz	a2,8000618c <__printf+0x524>
    80005d5c:	00a00713          	li	a4,10
    80005d60:	02e677bb          	remuw	a5,a2,a4
    80005d64:	00003d97          	auipc	s11,0x3
    80005d68:	8d4d8d93          	addi	s11,s11,-1836 # 80008638 <digits>
    80005d6c:	00900593          	li	a1,9
    80005d70:	0006051b          	sext.w	a0,a2
    80005d74:	00000c93          	li	s9,0
    80005d78:	02079793          	slli	a5,a5,0x20
    80005d7c:	0207d793          	srli	a5,a5,0x20
    80005d80:	00fd87b3          	add	a5,s11,a5
    80005d84:	0007c783          	lbu	a5,0(a5)
    80005d88:	02e656bb          	divuw	a3,a2,a4
    80005d8c:	f8f40023          	sb	a5,-128(s0)
    80005d90:	14c5d863          	bge	a1,a2,80005ee0 <__printf+0x278>
    80005d94:	06300593          	li	a1,99
    80005d98:	00100c93          	li	s9,1
    80005d9c:	02e6f7bb          	remuw	a5,a3,a4
    80005da0:	02079793          	slli	a5,a5,0x20
    80005da4:	0207d793          	srli	a5,a5,0x20
    80005da8:	00fd87b3          	add	a5,s11,a5
    80005dac:	0007c783          	lbu	a5,0(a5)
    80005db0:	02e6d73b          	divuw	a4,a3,a4
    80005db4:	f8f400a3          	sb	a5,-127(s0)
    80005db8:	12a5f463          	bgeu	a1,a0,80005ee0 <__printf+0x278>
    80005dbc:	00a00693          	li	a3,10
    80005dc0:	00900593          	li	a1,9
    80005dc4:	02d777bb          	remuw	a5,a4,a3
    80005dc8:	02079793          	slli	a5,a5,0x20
    80005dcc:	0207d793          	srli	a5,a5,0x20
    80005dd0:	00fd87b3          	add	a5,s11,a5
    80005dd4:	0007c503          	lbu	a0,0(a5)
    80005dd8:	02d757bb          	divuw	a5,a4,a3
    80005ddc:	f8a40123          	sb	a0,-126(s0)
    80005de0:	48e5f263          	bgeu	a1,a4,80006264 <__printf+0x5fc>
    80005de4:	06300513          	li	a0,99
    80005de8:	02d7f5bb          	remuw	a1,a5,a3
    80005dec:	02059593          	slli	a1,a1,0x20
    80005df0:	0205d593          	srli	a1,a1,0x20
    80005df4:	00bd85b3          	add	a1,s11,a1
    80005df8:	0005c583          	lbu	a1,0(a1)
    80005dfc:	02d7d7bb          	divuw	a5,a5,a3
    80005e00:	f8b401a3          	sb	a1,-125(s0)
    80005e04:	48e57263          	bgeu	a0,a4,80006288 <__printf+0x620>
    80005e08:	3e700513          	li	a0,999
    80005e0c:	02d7f5bb          	remuw	a1,a5,a3
    80005e10:	02059593          	slli	a1,a1,0x20
    80005e14:	0205d593          	srli	a1,a1,0x20
    80005e18:	00bd85b3          	add	a1,s11,a1
    80005e1c:	0005c583          	lbu	a1,0(a1)
    80005e20:	02d7d7bb          	divuw	a5,a5,a3
    80005e24:	f8b40223          	sb	a1,-124(s0)
    80005e28:	46e57663          	bgeu	a0,a4,80006294 <__printf+0x62c>
    80005e2c:	02d7f5bb          	remuw	a1,a5,a3
    80005e30:	02059593          	slli	a1,a1,0x20
    80005e34:	0205d593          	srli	a1,a1,0x20
    80005e38:	00bd85b3          	add	a1,s11,a1
    80005e3c:	0005c583          	lbu	a1,0(a1)
    80005e40:	02d7d7bb          	divuw	a5,a5,a3
    80005e44:	f8b402a3          	sb	a1,-123(s0)
    80005e48:	46ea7863          	bgeu	s4,a4,800062b8 <__printf+0x650>
    80005e4c:	02d7f5bb          	remuw	a1,a5,a3
    80005e50:	02059593          	slli	a1,a1,0x20
    80005e54:	0205d593          	srli	a1,a1,0x20
    80005e58:	00bd85b3          	add	a1,s11,a1
    80005e5c:	0005c583          	lbu	a1,0(a1)
    80005e60:	02d7d7bb          	divuw	a5,a5,a3
    80005e64:	f8b40323          	sb	a1,-122(s0)
    80005e68:	3eeaf863          	bgeu	s5,a4,80006258 <__printf+0x5f0>
    80005e6c:	02d7f5bb          	remuw	a1,a5,a3
    80005e70:	02059593          	slli	a1,a1,0x20
    80005e74:	0205d593          	srli	a1,a1,0x20
    80005e78:	00bd85b3          	add	a1,s11,a1
    80005e7c:	0005c583          	lbu	a1,0(a1)
    80005e80:	02d7d7bb          	divuw	a5,a5,a3
    80005e84:	f8b403a3          	sb	a1,-121(s0)
    80005e88:	42eb7e63          	bgeu	s6,a4,800062c4 <__printf+0x65c>
    80005e8c:	02d7f5bb          	remuw	a1,a5,a3
    80005e90:	02059593          	slli	a1,a1,0x20
    80005e94:	0205d593          	srli	a1,a1,0x20
    80005e98:	00bd85b3          	add	a1,s11,a1
    80005e9c:	0005c583          	lbu	a1,0(a1)
    80005ea0:	02d7d7bb          	divuw	a5,a5,a3
    80005ea4:	f8b40423          	sb	a1,-120(s0)
    80005ea8:	42ebfc63          	bgeu	s7,a4,800062e0 <__printf+0x678>
    80005eac:	02079793          	slli	a5,a5,0x20
    80005eb0:	0207d793          	srli	a5,a5,0x20
    80005eb4:	00fd8db3          	add	s11,s11,a5
    80005eb8:	000dc703          	lbu	a4,0(s11)
    80005ebc:	00a00793          	li	a5,10
    80005ec0:	00900c93          	li	s9,9
    80005ec4:	f8e404a3          	sb	a4,-119(s0)
    80005ec8:	00065c63          	bgez	a2,80005ee0 <__printf+0x278>
    80005ecc:	f9040713          	addi	a4,s0,-112
    80005ed0:	00f70733          	add	a4,a4,a5
    80005ed4:	02d00693          	li	a3,45
    80005ed8:	fed70823          	sb	a3,-16(a4)
    80005edc:	00078c93          	mv	s9,a5
    80005ee0:	f8040793          	addi	a5,s0,-128
    80005ee4:	01978cb3          	add	s9,a5,s9
    80005ee8:	f7f40d13          	addi	s10,s0,-129
    80005eec:	000cc503          	lbu	a0,0(s9)
    80005ef0:	fffc8c93          	addi	s9,s9,-1
    80005ef4:	00000097          	auipc	ra,0x0
    80005ef8:	b90080e7          	jalr	-1136(ra) # 80005a84 <consputc>
    80005efc:	ffac98e3          	bne	s9,s10,80005eec <__printf+0x284>
    80005f00:	00094503          	lbu	a0,0(s2)
    80005f04:	e00514e3          	bnez	a0,80005d0c <__printf+0xa4>
    80005f08:	1a0c1663          	bnez	s8,800060b4 <__printf+0x44c>
    80005f0c:	08813083          	ld	ra,136(sp)
    80005f10:	08013403          	ld	s0,128(sp)
    80005f14:	07813483          	ld	s1,120(sp)
    80005f18:	07013903          	ld	s2,112(sp)
    80005f1c:	06813983          	ld	s3,104(sp)
    80005f20:	06013a03          	ld	s4,96(sp)
    80005f24:	05813a83          	ld	s5,88(sp)
    80005f28:	05013b03          	ld	s6,80(sp)
    80005f2c:	04813b83          	ld	s7,72(sp)
    80005f30:	04013c03          	ld	s8,64(sp)
    80005f34:	03813c83          	ld	s9,56(sp)
    80005f38:	03013d03          	ld	s10,48(sp)
    80005f3c:	02813d83          	ld	s11,40(sp)
    80005f40:	0d010113          	addi	sp,sp,208
    80005f44:	00008067          	ret
    80005f48:	07300713          	li	a4,115
    80005f4c:	1ce78a63          	beq	a5,a4,80006120 <__printf+0x4b8>
    80005f50:	07800713          	li	a4,120
    80005f54:	1ee79e63          	bne	a5,a4,80006150 <__printf+0x4e8>
    80005f58:	f7843783          	ld	a5,-136(s0)
    80005f5c:	0007a703          	lw	a4,0(a5)
    80005f60:	00878793          	addi	a5,a5,8
    80005f64:	f6f43c23          	sd	a5,-136(s0)
    80005f68:	28074263          	bltz	a4,800061ec <__printf+0x584>
    80005f6c:	00002d97          	auipc	s11,0x2
    80005f70:	6ccd8d93          	addi	s11,s11,1740 # 80008638 <digits>
    80005f74:	00f77793          	andi	a5,a4,15
    80005f78:	00fd87b3          	add	a5,s11,a5
    80005f7c:	0007c683          	lbu	a3,0(a5)
    80005f80:	00f00613          	li	a2,15
    80005f84:	0007079b          	sext.w	a5,a4
    80005f88:	f8d40023          	sb	a3,-128(s0)
    80005f8c:	0047559b          	srliw	a1,a4,0x4
    80005f90:	0047569b          	srliw	a3,a4,0x4
    80005f94:	00000c93          	li	s9,0
    80005f98:	0ee65063          	bge	a2,a4,80006078 <__printf+0x410>
    80005f9c:	00f6f693          	andi	a3,a3,15
    80005fa0:	00dd86b3          	add	a3,s11,a3
    80005fa4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80005fa8:	0087d79b          	srliw	a5,a5,0x8
    80005fac:	00100c93          	li	s9,1
    80005fb0:	f8d400a3          	sb	a3,-127(s0)
    80005fb4:	0cb67263          	bgeu	a2,a1,80006078 <__printf+0x410>
    80005fb8:	00f7f693          	andi	a3,a5,15
    80005fbc:	00dd86b3          	add	a3,s11,a3
    80005fc0:	0006c583          	lbu	a1,0(a3)
    80005fc4:	00f00613          	li	a2,15
    80005fc8:	0047d69b          	srliw	a3,a5,0x4
    80005fcc:	f8b40123          	sb	a1,-126(s0)
    80005fd0:	0047d593          	srli	a1,a5,0x4
    80005fd4:	28f67e63          	bgeu	a2,a5,80006270 <__printf+0x608>
    80005fd8:	00f6f693          	andi	a3,a3,15
    80005fdc:	00dd86b3          	add	a3,s11,a3
    80005fe0:	0006c503          	lbu	a0,0(a3)
    80005fe4:	0087d813          	srli	a6,a5,0x8
    80005fe8:	0087d69b          	srliw	a3,a5,0x8
    80005fec:	f8a401a3          	sb	a0,-125(s0)
    80005ff0:	28b67663          	bgeu	a2,a1,8000627c <__printf+0x614>
    80005ff4:	00f6f693          	andi	a3,a3,15
    80005ff8:	00dd86b3          	add	a3,s11,a3
    80005ffc:	0006c583          	lbu	a1,0(a3)
    80006000:	00c7d513          	srli	a0,a5,0xc
    80006004:	00c7d69b          	srliw	a3,a5,0xc
    80006008:	f8b40223          	sb	a1,-124(s0)
    8000600c:	29067a63          	bgeu	a2,a6,800062a0 <__printf+0x638>
    80006010:	00f6f693          	andi	a3,a3,15
    80006014:	00dd86b3          	add	a3,s11,a3
    80006018:	0006c583          	lbu	a1,0(a3)
    8000601c:	0107d813          	srli	a6,a5,0x10
    80006020:	0107d69b          	srliw	a3,a5,0x10
    80006024:	f8b402a3          	sb	a1,-123(s0)
    80006028:	28a67263          	bgeu	a2,a0,800062ac <__printf+0x644>
    8000602c:	00f6f693          	andi	a3,a3,15
    80006030:	00dd86b3          	add	a3,s11,a3
    80006034:	0006c683          	lbu	a3,0(a3)
    80006038:	0147d79b          	srliw	a5,a5,0x14
    8000603c:	f8d40323          	sb	a3,-122(s0)
    80006040:	21067663          	bgeu	a2,a6,8000624c <__printf+0x5e4>
    80006044:	02079793          	slli	a5,a5,0x20
    80006048:	0207d793          	srli	a5,a5,0x20
    8000604c:	00fd8db3          	add	s11,s11,a5
    80006050:	000dc683          	lbu	a3,0(s11)
    80006054:	00800793          	li	a5,8
    80006058:	00700c93          	li	s9,7
    8000605c:	f8d403a3          	sb	a3,-121(s0)
    80006060:	00075c63          	bgez	a4,80006078 <__printf+0x410>
    80006064:	f9040713          	addi	a4,s0,-112
    80006068:	00f70733          	add	a4,a4,a5
    8000606c:	02d00693          	li	a3,45
    80006070:	fed70823          	sb	a3,-16(a4)
    80006074:	00078c93          	mv	s9,a5
    80006078:	f8040793          	addi	a5,s0,-128
    8000607c:	01978cb3          	add	s9,a5,s9
    80006080:	f7f40d13          	addi	s10,s0,-129
    80006084:	000cc503          	lbu	a0,0(s9)
    80006088:	fffc8c93          	addi	s9,s9,-1
    8000608c:	00000097          	auipc	ra,0x0
    80006090:	9f8080e7          	jalr	-1544(ra) # 80005a84 <consputc>
    80006094:	ff9d18e3          	bne	s10,s9,80006084 <__printf+0x41c>
    80006098:	0100006f          	j	800060a8 <__printf+0x440>
    8000609c:	00000097          	auipc	ra,0x0
    800060a0:	9e8080e7          	jalr	-1560(ra) # 80005a84 <consputc>
    800060a4:	000c8493          	mv	s1,s9
    800060a8:	00094503          	lbu	a0,0(s2)
    800060ac:	c60510e3          	bnez	a0,80005d0c <__printf+0xa4>
    800060b0:	e40c0ee3          	beqz	s8,80005f0c <__printf+0x2a4>
    800060b4:	00005517          	auipc	a0,0x5
    800060b8:	01c50513          	addi	a0,a0,28 # 8000b0d0 <pr>
    800060bc:	00001097          	auipc	ra,0x1
    800060c0:	94c080e7          	jalr	-1716(ra) # 80006a08 <release>
    800060c4:	e49ff06f          	j	80005f0c <__printf+0x2a4>
    800060c8:	f7843783          	ld	a5,-136(s0)
    800060cc:	03000513          	li	a0,48
    800060d0:	01000d13          	li	s10,16
    800060d4:	00878713          	addi	a4,a5,8
    800060d8:	0007bc83          	ld	s9,0(a5)
    800060dc:	f6e43c23          	sd	a4,-136(s0)
    800060e0:	00000097          	auipc	ra,0x0
    800060e4:	9a4080e7          	jalr	-1628(ra) # 80005a84 <consputc>
    800060e8:	07800513          	li	a0,120
    800060ec:	00000097          	auipc	ra,0x0
    800060f0:	998080e7          	jalr	-1640(ra) # 80005a84 <consputc>
    800060f4:	00002d97          	auipc	s11,0x2
    800060f8:	544d8d93          	addi	s11,s11,1348 # 80008638 <digits>
    800060fc:	03ccd793          	srli	a5,s9,0x3c
    80006100:	00fd87b3          	add	a5,s11,a5
    80006104:	0007c503          	lbu	a0,0(a5)
    80006108:	fffd0d1b          	addiw	s10,s10,-1
    8000610c:	004c9c93          	slli	s9,s9,0x4
    80006110:	00000097          	auipc	ra,0x0
    80006114:	974080e7          	jalr	-1676(ra) # 80005a84 <consputc>
    80006118:	fe0d12e3          	bnez	s10,800060fc <__printf+0x494>
    8000611c:	f8dff06f          	j	800060a8 <__printf+0x440>
    80006120:	f7843783          	ld	a5,-136(s0)
    80006124:	0007bc83          	ld	s9,0(a5)
    80006128:	00878793          	addi	a5,a5,8
    8000612c:	f6f43c23          	sd	a5,-136(s0)
    80006130:	000c9a63          	bnez	s9,80006144 <__printf+0x4dc>
    80006134:	1080006f          	j	8000623c <__printf+0x5d4>
    80006138:	001c8c93          	addi	s9,s9,1
    8000613c:	00000097          	auipc	ra,0x0
    80006140:	948080e7          	jalr	-1720(ra) # 80005a84 <consputc>
    80006144:	000cc503          	lbu	a0,0(s9)
    80006148:	fe0518e3          	bnez	a0,80006138 <__printf+0x4d0>
    8000614c:	f5dff06f          	j	800060a8 <__printf+0x440>
    80006150:	02500513          	li	a0,37
    80006154:	00000097          	auipc	ra,0x0
    80006158:	930080e7          	jalr	-1744(ra) # 80005a84 <consputc>
    8000615c:	000c8513          	mv	a0,s9
    80006160:	00000097          	auipc	ra,0x0
    80006164:	924080e7          	jalr	-1756(ra) # 80005a84 <consputc>
    80006168:	f41ff06f          	j	800060a8 <__printf+0x440>
    8000616c:	02500513          	li	a0,37
    80006170:	00000097          	auipc	ra,0x0
    80006174:	914080e7          	jalr	-1772(ra) # 80005a84 <consputc>
    80006178:	f31ff06f          	j	800060a8 <__printf+0x440>
    8000617c:	00030513          	mv	a0,t1
    80006180:	00000097          	auipc	ra,0x0
    80006184:	7bc080e7          	jalr	1980(ra) # 8000693c <acquire>
    80006188:	b4dff06f          	j	80005cd4 <__printf+0x6c>
    8000618c:	40c0053b          	negw	a0,a2
    80006190:	00a00713          	li	a4,10
    80006194:	02e576bb          	remuw	a3,a0,a4
    80006198:	00002d97          	auipc	s11,0x2
    8000619c:	4a0d8d93          	addi	s11,s11,1184 # 80008638 <digits>
    800061a0:	ff700593          	li	a1,-9
    800061a4:	02069693          	slli	a3,a3,0x20
    800061a8:	0206d693          	srli	a3,a3,0x20
    800061ac:	00dd86b3          	add	a3,s11,a3
    800061b0:	0006c683          	lbu	a3,0(a3)
    800061b4:	02e557bb          	divuw	a5,a0,a4
    800061b8:	f8d40023          	sb	a3,-128(s0)
    800061bc:	10b65e63          	bge	a2,a1,800062d8 <__printf+0x670>
    800061c0:	06300593          	li	a1,99
    800061c4:	02e7f6bb          	remuw	a3,a5,a4
    800061c8:	02069693          	slli	a3,a3,0x20
    800061cc:	0206d693          	srli	a3,a3,0x20
    800061d0:	00dd86b3          	add	a3,s11,a3
    800061d4:	0006c683          	lbu	a3,0(a3)
    800061d8:	02e7d73b          	divuw	a4,a5,a4
    800061dc:	00200793          	li	a5,2
    800061e0:	f8d400a3          	sb	a3,-127(s0)
    800061e4:	bca5ece3          	bltu	a1,a0,80005dbc <__printf+0x154>
    800061e8:	ce5ff06f          	j	80005ecc <__printf+0x264>
    800061ec:	40e007bb          	negw	a5,a4
    800061f0:	00002d97          	auipc	s11,0x2
    800061f4:	448d8d93          	addi	s11,s11,1096 # 80008638 <digits>
    800061f8:	00f7f693          	andi	a3,a5,15
    800061fc:	00dd86b3          	add	a3,s11,a3
    80006200:	0006c583          	lbu	a1,0(a3)
    80006204:	ff100613          	li	a2,-15
    80006208:	0047d69b          	srliw	a3,a5,0x4
    8000620c:	f8b40023          	sb	a1,-128(s0)
    80006210:	0047d59b          	srliw	a1,a5,0x4
    80006214:	0ac75e63          	bge	a4,a2,800062d0 <__printf+0x668>
    80006218:	00f6f693          	andi	a3,a3,15
    8000621c:	00dd86b3          	add	a3,s11,a3
    80006220:	0006c603          	lbu	a2,0(a3)
    80006224:	00f00693          	li	a3,15
    80006228:	0087d79b          	srliw	a5,a5,0x8
    8000622c:	f8c400a3          	sb	a2,-127(s0)
    80006230:	d8b6e4e3          	bltu	a3,a1,80005fb8 <__printf+0x350>
    80006234:	00200793          	li	a5,2
    80006238:	e2dff06f          	j	80006064 <__printf+0x3fc>
    8000623c:	00002c97          	auipc	s9,0x2
    80006240:	3dcc8c93          	addi	s9,s9,988 # 80008618 <_ZL6digits+0x150>
    80006244:	02800513          	li	a0,40
    80006248:	ef1ff06f          	j	80006138 <__printf+0x4d0>
    8000624c:	00700793          	li	a5,7
    80006250:	00600c93          	li	s9,6
    80006254:	e0dff06f          	j	80006060 <__printf+0x3f8>
    80006258:	00700793          	li	a5,7
    8000625c:	00600c93          	li	s9,6
    80006260:	c69ff06f          	j	80005ec8 <__printf+0x260>
    80006264:	00300793          	li	a5,3
    80006268:	00200c93          	li	s9,2
    8000626c:	c5dff06f          	j	80005ec8 <__printf+0x260>
    80006270:	00300793          	li	a5,3
    80006274:	00200c93          	li	s9,2
    80006278:	de9ff06f          	j	80006060 <__printf+0x3f8>
    8000627c:	00400793          	li	a5,4
    80006280:	00300c93          	li	s9,3
    80006284:	dddff06f          	j	80006060 <__printf+0x3f8>
    80006288:	00400793          	li	a5,4
    8000628c:	00300c93          	li	s9,3
    80006290:	c39ff06f          	j	80005ec8 <__printf+0x260>
    80006294:	00500793          	li	a5,5
    80006298:	00400c93          	li	s9,4
    8000629c:	c2dff06f          	j	80005ec8 <__printf+0x260>
    800062a0:	00500793          	li	a5,5
    800062a4:	00400c93          	li	s9,4
    800062a8:	db9ff06f          	j	80006060 <__printf+0x3f8>
    800062ac:	00600793          	li	a5,6
    800062b0:	00500c93          	li	s9,5
    800062b4:	dadff06f          	j	80006060 <__printf+0x3f8>
    800062b8:	00600793          	li	a5,6
    800062bc:	00500c93          	li	s9,5
    800062c0:	c09ff06f          	j	80005ec8 <__printf+0x260>
    800062c4:	00800793          	li	a5,8
    800062c8:	00700c93          	li	s9,7
    800062cc:	bfdff06f          	j	80005ec8 <__printf+0x260>
    800062d0:	00100793          	li	a5,1
    800062d4:	d91ff06f          	j	80006064 <__printf+0x3fc>
    800062d8:	00100793          	li	a5,1
    800062dc:	bf1ff06f          	j	80005ecc <__printf+0x264>
    800062e0:	00900793          	li	a5,9
    800062e4:	00800c93          	li	s9,8
    800062e8:	be1ff06f          	j	80005ec8 <__printf+0x260>
    800062ec:	00002517          	auipc	a0,0x2
    800062f0:	33450513          	addi	a0,a0,820 # 80008620 <_ZL6digits+0x158>
    800062f4:	00000097          	auipc	ra,0x0
    800062f8:	918080e7          	jalr	-1768(ra) # 80005c0c <panic>

00000000800062fc <printfinit>:
    800062fc:	fe010113          	addi	sp,sp,-32
    80006300:	00813823          	sd	s0,16(sp)
    80006304:	00913423          	sd	s1,8(sp)
    80006308:	00113c23          	sd	ra,24(sp)
    8000630c:	02010413          	addi	s0,sp,32
    80006310:	00005497          	auipc	s1,0x5
    80006314:	dc048493          	addi	s1,s1,-576 # 8000b0d0 <pr>
    80006318:	00048513          	mv	a0,s1
    8000631c:	00002597          	auipc	a1,0x2
    80006320:	31458593          	addi	a1,a1,788 # 80008630 <_ZL6digits+0x168>
    80006324:	00000097          	auipc	ra,0x0
    80006328:	5f4080e7          	jalr	1524(ra) # 80006918 <initlock>
    8000632c:	01813083          	ld	ra,24(sp)
    80006330:	01013403          	ld	s0,16(sp)
    80006334:	0004ac23          	sw	zero,24(s1)
    80006338:	00813483          	ld	s1,8(sp)
    8000633c:	02010113          	addi	sp,sp,32
    80006340:	00008067          	ret

0000000080006344 <uartinit>:
    80006344:	ff010113          	addi	sp,sp,-16
    80006348:	00813423          	sd	s0,8(sp)
    8000634c:	01010413          	addi	s0,sp,16
    80006350:	100007b7          	lui	a5,0x10000
    80006354:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80006358:	f8000713          	li	a4,-128
    8000635c:	00e781a3          	sb	a4,3(a5)
    80006360:	00300713          	li	a4,3
    80006364:	00e78023          	sb	a4,0(a5)
    80006368:	000780a3          	sb	zero,1(a5)
    8000636c:	00e781a3          	sb	a4,3(a5)
    80006370:	00700693          	li	a3,7
    80006374:	00d78123          	sb	a3,2(a5)
    80006378:	00e780a3          	sb	a4,1(a5)
    8000637c:	00813403          	ld	s0,8(sp)
    80006380:	01010113          	addi	sp,sp,16
    80006384:	00008067          	ret

0000000080006388 <uartputc>:
    80006388:	00004797          	auipc	a5,0x4
    8000638c:	aa07a783          	lw	a5,-1376(a5) # 80009e28 <panicked>
    80006390:	00078463          	beqz	a5,80006398 <uartputc+0x10>
    80006394:	0000006f          	j	80006394 <uartputc+0xc>
    80006398:	fd010113          	addi	sp,sp,-48
    8000639c:	02813023          	sd	s0,32(sp)
    800063a0:	00913c23          	sd	s1,24(sp)
    800063a4:	01213823          	sd	s2,16(sp)
    800063a8:	01313423          	sd	s3,8(sp)
    800063ac:	02113423          	sd	ra,40(sp)
    800063b0:	03010413          	addi	s0,sp,48
    800063b4:	00004917          	auipc	s2,0x4
    800063b8:	a7c90913          	addi	s2,s2,-1412 # 80009e30 <uart_tx_r>
    800063bc:	00093783          	ld	a5,0(s2)
    800063c0:	00004497          	auipc	s1,0x4
    800063c4:	a7848493          	addi	s1,s1,-1416 # 80009e38 <uart_tx_w>
    800063c8:	0004b703          	ld	a4,0(s1)
    800063cc:	02078693          	addi	a3,a5,32
    800063d0:	00050993          	mv	s3,a0
    800063d4:	02e69c63          	bne	a3,a4,8000640c <uartputc+0x84>
    800063d8:	00001097          	auipc	ra,0x1
    800063dc:	834080e7          	jalr	-1996(ra) # 80006c0c <push_on>
    800063e0:	00093783          	ld	a5,0(s2)
    800063e4:	0004b703          	ld	a4,0(s1)
    800063e8:	02078793          	addi	a5,a5,32
    800063ec:	00e79463          	bne	a5,a4,800063f4 <uartputc+0x6c>
    800063f0:	0000006f          	j	800063f0 <uartputc+0x68>
    800063f4:	00001097          	auipc	ra,0x1
    800063f8:	88c080e7          	jalr	-1908(ra) # 80006c80 <pop_on>
    800063fc:	00093783          	ld	a5,0(s2)
    80006400:	0004b703          	ld	a4,0(s1)
    80006404:	02078693          	addi	a3,a5,32
    80006408:	fce688e3          	beq	a3,a4,800063d8 <uartputc+0x50>
    8000640c:	01f77693          	andi	a3,a4,31
    80006410:	00005597          	auipc	a1,0x5
    80006414:	ce058593          	addi	a1,a1,-800 # 8000b0f0 <uart_tx_buf>
    80006418:	00d586b3          	add	a3,a1,a3
    8000641c:	00170713          	addi	a4,a4,1
    80006420:	01368023          	sb	s3,0(a3)
    80006424:	00e4b023          	sd	a4,0(s1)
    80006428:	10000637          	lui	a2,0x10000
    8000642c:	02f71063          	bne	a4,a5,8000644c <uartputc+0xc4>
    80006430:	0340006f          	j	80006464 <uartputc+0xdc>
    80006434:	00074703          	lbu	a4,0(a4)
    80006438:	00f93023          	sd	a5,0(s2)
    8000643c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80006440:	00093783          	ld	a5,0(s2)
    80006444:	0004b703          	ld	a4,0(s1)
    80006448:	00f70e63          	beq	a4,a5,80006464 <uartputc+0xdc>
    8000644c:	00564683          	lbu	a3,5(a2)
    80006450:	01f7f713          	andi	a4,a5,31
    80006454:	00e58733          	add	a4,a1,a4
    80006458:	0206f693          	andi	a3,a3,32
    8000645c:	00178793          	addi	a5,a5,1
    80006460:	fc069ae3          	bnez	a3,80006434 <uartputc+0xac>
    80006464:	02813083          	ld	ra,40(sp)
    80006468:	02013403          	ld	s0,32(sp)
    8000646c:	01813483          	ld	s1,24(sp)
    80006470:	01013903          	ld	s2,16(sp)
    80006474:	00813983          	ld	s3,8(sp)
    80006478:	03010113          	addi	sp,sp,48
    8000647c:	00008067          	ret

0000000080006480 <uartputc_sync>:
    80006480:	ff010113          	addi	sp,sp,-16
    80006484:	00813423          	sd	s0,8(sp)
    80006488:	01010413          	addi	s0,sp,16
    8000648c:	00004717          	auipc	a4,0x4
    80006490:	99c72703          	lw	a4,-1636(a4) # 80009e28 <panicked>
    80006494:	02071663          	bnez	a4,800064c0 <uartputc_sync+0x40>
    80006498:	00050793          	mv	a5,a0
    8000649c:	100006b7          	lui	a3,0x10000
    800064a0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    800064a4:	02077713          	andi	a4,a4,32
    800064a8:	fe070ce3          	beqz	a4,800064a0 <uartputc_sync+0x20>
    800064ac:	0ff7f793          	andi	a5,a5,255
    800064b0:	00f68023          	sb	a5,0(a3)
    800064b4:	00813403          	ld	s0,8(sp)
    800064b8:	01010113          	addi	sp,sp,16
    800064bc:	00008067          	ret
    800064c0:	0000006f          	j	800064c0 <uartputc_sync+0x40>

00000000800064c4 <uartstart>:
    800064c4:	ff010113          	addi	sp,sp,-16
    800064c8:	00813423          	sd	s0,8(sp)
    800064cc:	01010413          	addi	s0,sp,16
    800064d0:	00004617          	auipc	a2,0x4
    800064d4:	96060613          	addi	a2,a2,-1696 # 80009e30 <uart_tx_r>
    800064d8:	00004517          	auipc	a0,0x4
    800064dc:	96050513          	addi	a0,a0,-1696 # 80009e38 <uart_tx_w>
    800064e0:	00063783          	ld	a5,0(a2)
    800064e4:	00053703          	ld	a4,0(a0)
    800064e8:	04f70263          	beq	a4,a5,8000652c <uartstart+0x68>
    800064ec:	100005b7          	lui	a1,0x10000
    800064f0:	00005817          	auipc	a6,0x5
    800064f4:	c0080813          	addi	a6,a6,-1024 # 8000b0f0 <uart_tx_buf>
    800064f8:	01c0006f          	j	80006514 <uartstart+0x50>
    800064fc:	0006c703          	lbu	a4,0(a3)
    80006500:	00f63023          	sd	a5,0(a2)
    80006504:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80006508:	00063783          	ld	a5,0(a2)
    8000650c:	00053703          	ld	a4,0(a0)
    80006510:	00f70e63          	beq	a4,a5,8000652c <uartstart+0x68>
    80006514:	01f7f713          	andi	a4,a5,31
    80006518:	00e806b3          	add	a3,a6,a4
    8000651c:	0055c703          	lbu	a4,5(a1)
    80006520:	00178793          	addi	a5,a5,1
    80006524:	02077713          	andi	a4,a4,32
    80006528:	fc071ae3          	bnez	a4,800064fc <uartstart+0x38>
    8000652c:	00813403          	ld	s0,8(sp)
    80006530:	01010113          	addi	sp,sp,16
    80006534:	00008067          	ret

0000000080006538 <uartgetc>:
    80006538:	ff010113          	addi	sp,sp,-16
    8000653c:	00813423          	sd	s0,8(sp)
    80006540:	01010413          	addi	s0,sp,16
    80006544:	10000737          	lui	a4,0x10000
    80006548:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000654c:	0017f793          	andi	a5,a5,1
    80006550:	00078c63          	beqz	a5,80006568 <uartgetc+0x30>
    80006554:	00074503          	lbu	a0,0(a4)
    80006558:	0ff57513          	andi	a0,a0,255
    8000655c:	00813403          	ld	s0,8(sp)
    80006560:	01010113          	addi	sp,sp,16
    80006564:	00008067          	ret
    80006568:	fff00513          	li	a0,-1
    8000656c:	ff1ff06f          	j	8000655c <uartgetc+0x24>

0000000080006570 <uartintr>:
    80006570:	100007b7          	lui	a5,0x10000
    80006574:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80006578:	0017f793          	andi	a5,a5,1
    8000657c:	0a078463          	beqz	a5,80006624 <uartintr+0xb4>
    80006580:	fe010113          	addi	sp,sp,-32
    80006584:	00813823          	sd	s0,16(sp)
    80006588:	00913423          	sd	s1,8(sp)
    8000658c:	00113c23          	sd	ra,24(sp)
    80006590:	02010413          	addi	s0,sp,32
    80006594:	100004b7          	lui	s1,0x10000
    80006598:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000659c:	0ff57513          	andi	a0,a0,255
    800065a0:	fffff097          	auipc	ra,0xfffff
    800065a4:	534080e7          	jalr	1332(ra) # 80005ad4 <consoleintr>
    800065a8:	0054c783          	lbu	a5,5(s1)
    800065ac:	0017f793          	andi	a5,a5,1
    800065b0:	fe0794e3          	bnez	a5,80006598 <uartintr+0x28>
    800065b4:	00004617          	auipc	a2,0x4
    800065b8:	87c60613          	addi	a2,a2,-1924 # 80009e30 <uart_tx_r>
    800065bc:	00004517          	auipc	a0,0x4
    800065c0:	87c50513          	addi	a0,a0,-1924 # 80009e38 <uart_tx_w>
    800065c4:	00063783          	ld	a5,0(a2)
    800065c8:	00053703          	ld	a4,0(a0)
    800065cc:	04f70263          	beq	a4,a5,80006610 <uartintr+0xa0>
    800065d0:	100005b7          	lui	a1,0x10000
    800065d4:	00005817          	auipc	a6,0x5
    800065d8:	b1c80813          	addi	a6,a6,-1252 # 8000b0f0 <uart_tx_buf>
    800065dc:	01c0006f          	j	800065f8 <uartintr+0x88>
    800065e0:	0006c703          	lbu	a4,0(a3)
    800065e4:	00f63023          	sd	a5,0(a2)
    800065e8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800065ec:	00063783          	ld	a5,0(a2)
    800065f0:	00053703          	ld	a4,0(a0)
    800065f4:	00f70e63          	beq	a4,a5,80006610 <uartintr+0xa0>
    800065f8:	01f7f713          	andi	a4,a5,31
    800065fc:	00e806b3          	add	a3,a6,a4
    80006600:	0055c703          	lbu	a4,5(a1)
    80006604:	00178793          	addi	a5,a5,1
    80006608:	02077713          	andi	a4,a4,32
    8000660c:	fc071ae3          	bnez	a4,800065e0 <uartintr+0x70>
    80006610:	01813083          	ld	ra,24(sp)
    80006614:	01013403          	ld	s0,16(sp)
    80006618:	00813483          	ld	s1,8(sp)
    8000661c:	02010113          	addi	sp,sp,32
    80006620:	00008067          	ret
    80006624:	00004617          	auipc	a2,0x4
    80006628:	80c60613          	addi	a2,a2,-2036 # 80009e30 <uart_tx_r>
    8000662c:	00004517          	auipc	a0,0x4
    80006630:	80c50513          	addi	a0,a0,-2036 # 80009e38 <uart_tx_w>
    80006634:	00063783          	ld	a5,0(a2)
    80006638:	00053703          	ld	a4,0(a0)
    8000663c:	04f70263          	beq	a4,a5,80006680 <uartintr+0x110>
    80006640:	100005b7          	lui	a1,0x10000
    80006644:	00005817          	auipc	a6,0x5
    80006648:	aac80813          	addi	a6,a6,-1364 # 8000b0f0 <uart_tx_buf>
    8000664c:	01c0006f          	j	80006668 <uartintr+0xf8>
    80006650:	0006c703          	lbu	a4,0(a3)
    80006654:	00f63023          	sd	a5,0(a2)
    80006658:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000665c:	00063783          	ld	a5,0(a2)
    80006660:	00053703          	ld	a4,0(a0)
    80006664:	02f70063          	beq	a4,a5,80006684 <uartintr+0x114>
    80006668:	01f7f713          	andi	a4,a5,31
    8000666c:	00e806b3          	add	a3,a6,a4
    80006670:	0055c703          	lbu	a4,5(a1)
    80006674:	00178793          	addi	a5,a5,1
    80006678:	02077713          	andi	a4,a4,32
    8000667c:	fc071ae3          	bnez	a4,80006650 <uartintr+0xe0>
    80006680:	00008067          	ret
    80006684:	00008067          	ret

0000000080006688 <kinit>:
    80006688:	fc010113          	addi	sp,sp,-64
    8000668c:	02913423          	sd	s1,40(sp)
    80006690:	fffff7b7          	lui	a5,0xfffff
    80006694:	00006497          	auipc	s1,0x6
    80006698:	a7b48493          	addi	s1,s1,-1413 # 8000c10f <end+0xfff>
    8000669c:	02813823          	sd	s0,48(sp)
    800066a0:	01313c23          	sd	s3,24(sp)
    800066a4:	00f4f4b3          	and	s1,s1,a5
    800066a8:	02113c23          	sd	ra,56(sp)
    800066ac:	03213023          	sd	s2,32(sp)
    800066b0:	01413823          	sd	s4,16(sp)
    800066b4:	01513423          	sd	s5,8(sp)
    800066b8:	04010413          	addi	s0,sp,64
    800066bc:	000017b7          	lui	a5,0x1
    800066c0:	01100993          	li	s3,17
    800066c4:	00f487b3          	add	a5,s1,a5
    800066c8:	01b99993          	slli	s3,s3,0x1b
    800066cc:	06f9e063          	bltu	s3,a5,8000672c <kinit+0xa4>
    800066d0:	00005a97          	auipc	s5,0x5
    800066d4:	a40a8a93          	addi	s5,s5,-1472 # 8000b110 <end>
    800066d8:	0754ec63          	bltu	s1,s5,80006750 <kinit+0xc8>
    800066dc:	0734fa63          	bgeu	s1,s3,80006750 <kinit+0xc8>
    800066e0:	00088a37          	lui	s4,0x88
    800066e4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    800066e8:	00003917          	auipc	s2,0x3
    800066ec:	75890913          	addi	s2,s2,1880 # 80009e40 <kmem>
    800066f0:	00ca1a13          	slli	s4,s4,0xc
    800066f4:	0140006f          	j	80006708 <kinit+0x80>
    800066f8:	000017b7          	lui	a5,0x1
    800066fc:	00f484b3          	add	s1,s1,a5
    80006700:	0554e863          	bltu	s1,s5,80006750 <kinit+0xc8>
    80006704:	0534f663          	bgeu	s1,s3,80006750 <kinit+0xc8>
    80006708:	00001637          	lui	a2,0x1
    8000670c:	00100593          	li	a1,1
    80006710:	00048513          	mv	a0,s1
    80006714:	00000097          	auipc	ra,0x0
    80006718:	5e4080e7          	jalr	1508(ra) # 80006cf8 <__memset>
    8000671c:	00093783          	ld	a5,0(s2)
    80006720:	00f4b023          	sd	a5,0(s1)
    80006724:	00993023          	sd	s1,0(s2)
    80006728:	fd4498e3          	bne	s1,s4,800066f8 <kinit+0x70>
    8000672c:	03813083          	ld	ra,56(sp)
    80006730:	03013403          	ld	s0,48(sp)
    80006734:	02813483          	ld	s1,40(sp)
    80006738:	02013903          	ld	s2,32(sp)
    8000673c:	01813983          	ld	s3,24(sp)
    80006740:	01013a03          	ld	s4,16(sp)
    80006744:	00813a83          	ld	s5,8(sp)
    80006748:	04010113          	addi	sp,sp,64
    8000674c:	00008067          	ret
    80006750:	00002517          	auipc	a0,0x2
    80006754:	f0050513          	addi	a0,a0,-256 # 80008650 <digits+0x18>
    80006758:	fffff097          	auipc	ra,0xfffff
    8000675c:	4b4080e7          	jalr	1204(ra) # 80005c0c <panic>

0000000080006760 <freerange>:
    80006760:	fc010113          	addi	sp,sp,-64
    80006764:	000017b7          	lui	a5,0x1
    80006768:	02913423          	sd	s1,40(sp)
    8000676c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80006770:	009504b3          	add	s1,a0,s1
    80006774:	fffff537          	lui	a0,0xfffff
    80006778:	02813823          	sd	s0,48(sp)
    8000677c:	02113c23          	sd	ra,56(sp)
    80006780:	03213023          	sd	s2,32(sp)
    80006784:	01313c23          	sd	s3,24(sp)
    80006788:	01413823          	sd	s4,16(sp)
    8000678c:	01513423          	sd	s5,8(sp)
    80006790:	01613023          	sd	s6,0(sp)
    80006794:	04010413          	addi	s0,sp,64
    80006798:	00a4f4b3          	and	s1,s1,a0
    8000679c:	00f487b3          	add	a5,s1,a5
    800067a0:	06f5e463          	bltu	a1,a5,80006808 <freerange+0xa8>
    800067a4:	00005a97          	auipc	s5,0x5
    800067a8:	96ca8a93          	addi	s5,s5,-1684 # 8000b110 <end>
    800067ac:	0954e263          	bltu	s1,s5,80006830 <freerange+0xd0>
    800067b0:	01100993          	li	s3,17
    800067b4:	01b99993          	slli	s3,s3,0x1b
    800067b8:	0734fc63          	bgeu	s1,s3,80006830 <freerange+0xd0>
    800067bc:	00058a13          	mv	s4,a1
    800067c0:	00003917          	auipc	s2,0x3
    800067c4:	68090913          	addi	s2,s2,1664 # 80009e40 <kmem>
    800067c8:	00002b37          	lui	s6,0x2
    800067cc:	0140006f          	j	800067e0 <freerange+0x80>
    800067d0:	000017b7          	lui	a5,0x1
    800067d4:	00f484b3          	add	s1,s1,a5
    800067d8:	0554ec63          	bltu	s1,s5,80006830 <freerange+0xd0>
    800067dc:	0534fa63          	bgeu	s1,s3,80006830 <freerange+0xd0>
    800067e0:	00001637          	lui	a2,0x1
    800067e4:	00100593          	li	a1,1
    800067e8:	00048513          	mv	a0,s1
    800067ec:	00000097          	auipc	ra,0x0
    800067f0:	50c080e7          	jalr	1292(ra) # 80006cf8 <__memset>
    800067f4:	00093703          	ld	a4,0(s2)
    800067f8:	016487b3          	add	a5,s1,s6
    800067fc:	00e4b023          	sd	a4,0(s1)
    80006800:	00993023          	sd	s1,0(s2)
    80006804:	fcfa76e3          	bgeu	s4,a5,800067d0 <freerange+0x70>
    80006808:	03813083          	ld	ra,56(sp)
    8000680c:	03013403          	ld	s0,48(sp)
    80006810:	02813483          	ld	s1,40(sp)
    80006814:	02013903          	ld	s2,32(sp)
    80006818:	01813983          	ld	s3,24(sp)
    8000681c:	01013a03          	ld	s4,16(sp)
    80006820:	00813a83          	ld	s5,8(sp)
    80006824:	00013b03          	ld	s6,0(sp)
    80006828:	04010113          	addi	sp,sp,64
    8000682c:	00008067          	ret
    80006830:	00002517          	auipc	a0,0x2
    80006834:	e2050513          	addi	a0,a0,-480 # 80008650 <digits+0x18>
    80006838:	fffff097          	auipc	ra,0xfffff
    8000683c:	3d4080e7          	jalr	980(ra) # 80005c0c <panic>

0000000080006840 <kfree>:
    80006840:	fe010113          	addi	sp,sp,-32
    80006844:	00813823          	sd	s0,16(sp)
    80006848:	00113c23          	sd	ra,24(sp)
    8000684c:	00913423          	sd	s1,8(sp)
    80006850:	02010413          	addi	s0,sp,32
    80006854:	03451793          	slli	a5,a0,0x34
    80006858:	04079c63          	bnez	a5,800068b0 <kfree+0x70>
    8000685c:	00005797          	auipc	a5,0x5
    80006860:	8b478793          	addi	a5,a5,-1868 # 8000b110 <end>
    80006864:	00050493          	mv	s1,a0
    80006868:	04f56463          	bltu	a0,a5,800068b0 <kfree+0x70>
    8000686c:	01100793          	li	a5,17
    80006870:	01b79793          	slli	a5,a5,0x1b
    80006874:	02f57e63          	bgeu	a0,a5,800068b0 <kfree+0x70>
    80006878:	00001637          	lui	a2,0x1
    8000687c:	00100593          	li	a1,1
    80006880:	00000097          	auipc	ra,0x0
    80006884:	478080e7          	jalr	1144(ra) # 80006cf8 <__memset>
    80006888:	00003797          	auipc	a5,0x3
    8000688c:	5b878793          	addi	a5,a5,1464 # 80009e40 <kmem>
    80006890:	0007b703          	ld	a4,0(a5)
    80006894:	01813083          	ld	ra,24(sp)
    80006898:	01013403          	ld	s0,16(sp)
    8000689c:	00e4b023          	sd	a4,0(s1)
    800068a0:	0097b023          	sd	s1,0(a5)
    800068a4:	00813483          	ld	s1,8(sp)
    800068a8:	02010113          	addi	sp,sp,32
    800068ac:	00008067          	ret
    800068b0:	00002517          	auipc	a0,0x2
    800068b4:	da050513          	addi	a0,a0,-608 # 80008650 <digits+0x18>
    800068b8:	fffff097          	auipc	ra,0xfffff
    800068bc:	354080e7          	jalr	852(ra) # 80005c0c <panic>

00000000800068c0 <kalloc>:
    800068c0:	fe010113          	addi	sp,sp,-32
    800068c4:	00813823          	sd	s0,16(sp)
    800068c8:	00913423          	sd	s1,8(sp)
    800068cc:	00113c23          	sd	ra,24(sp)
    800068d0:	02010413          	addi	s0,sp,32
    800068d4:	00003797          	auipc	a5,0x3
    800068d8:	56c78793          	addi	a5,a5,1388 # 80009e40 <kmem>
    800068dc:	0007b483          	ld	s1,0(a5)
    800068e0:	02048063          	beqz	s1,80006900 <kalloc+0x40>
    800068e4:	0004b703          	ld	a4,0(s1)
    800068e8:	00001637          	lui	a2,0x1
    800068ec:	00500593          	li	a1,5
    800068f0:	00048513          	mv	a0,s1
    800068f4:	00e7b023          	sd	a4,0(a5)
    800068f8:	00000097          	auipc	ra,0x0
    800068fc:	400080e7          	jalr	1024(ra) # 80006cf8 <__memset>
    80006900:	01813083          	ld	ra,24(sp)
    80006904:	01013403          	ld	s0,16(sp)
    80006908:	00048513          	mv	a0,s1
    8000690c:	00813483          	ld	s1,8(sp)
    80006910:	02010113          	addi	sp,sp,32
    80006914:	00008067          	ret

0000000080006918 <initlock>:
    80006918:	ff010113          	addi	sp,sp,-16
    8000691c:	00813423          	sd	s0,8(sp)
    80006920:	01010413          	addi	s0,sp,16
    80006924:	00813403          	ld	s0,8(sp)
    80006928:	00b53423          	sd	a1,8(a0)
    8000692c:	00052023          	sw	zero,0(a0)
    80006930:	00053823          	sd	zero,16(a0)
    80006934:	01010113          	addi	sp,sp,16
    80006938:	00008067          	ret

000000008000693c <acquire>:
    8000693c:	fe010113          	addi	sp,sp,-32
    80006940:	00813823          	sd	s0,16(sp)
    80006944:	00913423          	sd	s1,8(sp)
    80006948:	00113c23          	sd	ra,24(sp)
    8000694c:	01213023          	sd	s2,0(sp)
    80006950:	02010413          	addi	s0,sp,32
    80006954:	00050493          	mv	s1,a0
    80006958:	10002973          	csrr	s2,sstatus
    8000695c:	100027f3          	csrr	a5,sstatus
    80006960:	ffd7f793          	andi	a5,a5,-3
    80006964:	10079073          	csrw	sstatus,a5
    80006968:	fffff097          	auipc	ra,0xfffff
    8000696c:	8e0080e7          	jalr	-1824(ra) # 80005248 <mycpu>
    80006970:	07852783          	lw	a5,120(a0)
    80006974:	06078e63          	beqz	a5,800069f0 <acquire+0xb4>
    80006978:	fffff097          	auipc	ra,0xfffff
    8000697c:	8d0080e7          	jalr	-1840(ra) # 80005248 <mycpu>
    80006980:	07852783          	lw	a5,120(a0)
    80006984:	0004a703          	lw	a4,0(s1)
    80006988:	0017879b          	addiw	a5,a5,1
    8000698c:	06f52c23          	sw	a5,120(a0)
    80006990:	04071063          	bnez	a4,800069d0 <acquire+0x94>
    80006994:	00100713          	li	a4,1
    80006998:	00070793          	mv	a5,a4
    8000699c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    800069a0:	0007879b          	sext.w	a5,a5
    800069a4:	fe079ae3          	bnez	a5,80006998 <acquire+0x5c>
    800069a8:	0ff0000f          	fence
    800069ac:	fffff097          	auipc	ra,0xfffff
    800069b0:	89c080e7          	jalr	-1892(ra) # 80005248 <mycpu>
    800069b4:	01813083          	ld	ra,24(sp)
    800069b8:	01013403          	ld	s0,16(sp)
    800069bc:	00a4b823          	sd	a0,16(s1)
    800069c0:	00013903          	ld	s2,0(sp)
    800069c4:	00813483          	ld	s1,8(sp)
    800069c8:	02010113          	addi	sp,sp,32
    800069cc:	00008067          	ret
    800069d0:	0104b903          	ld	s2,16(s1)
    800069d4:	fffff097          	auipc	ra,0xfffff
    800069d8:	874080e7          	jalr	-1932(ra) # 80005248 <mycpu>
    800069dc:	faa91ce3          	bne	s2,a0,80006994 <acquire+0x58>
    800069e0:	00002517          	auipc	a0,0x2
    800069e4:	c7850513          	addi	a0,a0,-904 # 80008658 <digits+0x20>
    800069e8:	fffff097          	auipc	ra,0xfffff
    800069ec:	224080e7          	jalr	548(ra) # 80005c0c <panic>
    800069f0:	00195913          	srli	s2,s2,0x1
    800069f4:	fffff097          	auipc	ra,0xfffff
    800069f8:	854080e7          	jalr	-1964(ra) # 80005248 <mycpu>
    800069fc:	00197913          	andi	s2,s2,1
    80006a00:	07252e23          	sw	s2,124(a0)
    80006a04:	f75ff06f          	j	80006978 <acquire+0x3c>

0000000080006a08 <release>:
    80006a08:	fe010113          	addi	sp,sp,-32
    80006a0c:	00813823          	sd	s0,16(sp)
    80006a10:	00113c23          	sd	ra,24(sp)
    80006a14:	00913423          	sd	s1,8(sp)
    80006a18:	01213023          	sd	s2,0(sp)
    80006a1c:	02010413          	addi	s0,sp,32
    80006a20:	00052783          	lw	a5,0(a0)
    80006a24:	00079a63          	bnez	a5,80006a38 <release+0x30>
    80006a28:	00002517          	auipc	a0,0x2
    80006a2c:	c3850513          	addi	a0,a0,-968 # 80008660 <digits+0x28>
    80006a30:	fffff097          	auipc	ra,0xfffff
    80006a34:	1dc080e7          	jalr	476(ra) # 80005c0c <panic>
    80006a38:	01053903          	ld	s2,16(a0)
    80006a3c:	00050493          	mv	s1,a0
    80006a40:	fffff097          	auipc	ra,0xfffff
    80006a44:	808080e7          	jalr	-2040(ra) # 80005248 <mycpu>
    80006a48:	fea910e3          	bne	s2,a0,80006a28 <release+0x20>
    80006a4c:	0004b823          	sd	zero,16(s1)
    80006a50:	0ff0000f          	fence
    80006a54:	0f50000f          	fence	iorw,ow
    80006a58:	0804a02f          	amoswap.w	zero,zero,(s1)
    80006a5c:	ffffe097          	auipc	ra,0xffffe
    80006a60:	7ec080e7          	jalr	2028(ra) # 80005248 <mycpu>
    80006a64:	100027f3          	csrr	a5,sstatus
    80006a68:	0027f793          	andi	a5,a5,2
    80006a6c:	04079a63          	bnez	a5,80006ac0 <release+0xb8>
    80006a70:	07852783          	lw	a5,120(a0)
    80006a74:	02f05e63          	blez	a5,80006ab0 <release+0xa8>
    80006a78:	fff7871b          	addiw	a4,a5,-1
    80006a7c:	06e52c23          	sw	a4,120(a0)
    80006a80:	00071c63          	bnez	a4,80006a98 <release+0x90>
    80006a84:	07c52783          	lw	a5,124(a0)
    80006a88:	00078863          	beqz	a5,80006a98 <release+0x90>
    80006a8c:	100027f3          	csrr	a5,sstatus
    80006a90:	0027e793          	ori	a5,a5,2
    80006a94:	10079073          	csrw	sstatus,a5
    80006a98:	01813083          	ld	ra,24(sp)
    80006a9c:	01013403          	ld	s0,16(sp)
    80006aa0:	00813483          	ld	s1,8(sp)
    80006aa4:	00013903          	ld	s2,0(sp)
    80006aa8:	02010113          	addi	sp,sp,32
    80006aac:	00008067          	ret
    80006ab0:	00002517          	auipc	a0,0x2
    80006ab4:	bd050513          	addi	a0,a0,-1072 # 80008680 <digits+0x48>
    80006ab8:	fffff097          	auipc	ra,0xfffff
    80006abc:	154080e7          	jalr	340(ra) # 80005c0c <panic>
    80006ac0:	00002517          	auipc	a0,0x2
    80006ac4:	ba850513          	addi	a0,a0,-1112 # 80008668 <digits+0x30>
    80006ac8:	fffff097          	auipc	ra,0xfffff
    80006acc:	144080e7          	jalr	324(ra) # 80005c0c <panic>

0000000080006ad0 <holding>:
    80006ad0:	00052783          	lw	a5,0(a0)
    80006ad4:	00079663          	bnez	a5,80006ae0 <holding+0x10>
    80006ad8:	00000513          	li	a0,0
    80006adc:	00008067          	ret
    80006ae0:	fe010113          	addi	sp,sp,-32
    80006ae4:	00813823          	sd	s0,16(sp)
    80006ae8:	00913423          	sd	s1,8(sp)
    80006aec:	00113c23          	sd	ra,24(sp)
    80006af0:	02010413          	addi	s0,sp,32
    80006af4:	01053483          	ld	s1,16(a0)
    80006af8:	ffffe097          	auipc	ra,0xffffe
    80006afc:	750080e7          	jalr	1872(ra) # 80005248 <mycpu>
    80006b00:	01813083          	ld	ra,24(sp)
    80006b04:	01013403          	ld	s0,16(sp)
    80006b08:	40a48533          	sub	a0,s1,a0
    80006b0c:	00153513          	seqz	a0,a0
    80006b10:	00813483          	ld	s1,8(sp)
    80006b14:	02010113          	addi	sp,sp,32
    80006b18:	00008067          	ret

0000000080006b1c <push_off>:
    80006b1c:	fe010113          	addi	sp,sp,-32
    80006b20:	00813823          	sd	s0,16(sp)
    80006b24:	00113c23          	sd	ra,24(sp)
    80006b28:	00913423          	sd	s1,8(sp)
    80006b2c:	02010413          	addi	s0,sp,32
    80006b30:	100024f3          	csrr	s1,sstatus
    80006b34:	100027f3          	csrr	a5,sstatus
    80006b38:	ffd7f793          	andi	a5,a5,-3
    80006b3c:	10079073          	csrw	sstatus,a5
    80006b40:	ffffe097          	auipc	ra,0xffffe
    80006b44:	708080e7          	jalr	1800(ra) # 80005248 <mycpu>
    80006b48:	07852783          	lw	a5,120(a0)
    80006b4c:	02078663          	beqz	a5,80006b78 <push_off+0x5c>
    80006b50:	ffffe097          	auipc	ra,0xffffe
    80006b54:	6f8080e7          	jalr	1784(ra) # 80005248 <mycpu>
    80006b58:	07852783          	lw	a5,120(a0)
    80006b5c:	01813083          	ld	ra,24(sp)
    80006b60:	01013403          	ld	s0,16(sp)
    80006b64:	0017879b          	addiw	a5,a5,1
    80006b68:	06f52c23          	sw	a5,120(a0)
    80006b6c:	00813483          	ld	s1,8(sp)
    80006b70:	02010113          	addi	sp,sp,32
    80006b74:	00008067          	ret
    80006b78:	0014d493          	srli	s1,s1,0x1
    80006b7c:	ffffe097          	auipc	ra,0xffffe
    80006b80:	6cc080e7          	jalr	1740(ra) # 80005248 <mycpu>
    80006b84:	0014f493          	andi	s1,s1,1
    80006b88:	06952e23          	sw	s1,124(a0)
    80006b8c:	fc5ff06f          	j	80006b50 <push_off+0x34>

0000000080006b90 <pop_off>:
    80006b90:	ff010113          	addi	sp,sp,-16
    80006b94:	00813023          	sd	s0,0(sp)
    80006b98:	00113423          	sd	ra,8(sp)
    80006b9c:	01010413          	addi	s0,sp,16
    80006ba0:	ffffe097          	auipc	ra,0xffffe
    80006ba4:	6a8080e7          	jalr	1704(ra) # 80005248 <mycpu>
    80006ba8:	100027f3          	csrr	a5,sstatus
    80006bac:	0027f793          	andi	a5,a5,2
    80006bb0:	04079663          	bnez	a5,80006bfc <pop_off+0x6c>
    80006bb4:	07852783          	lw	a5,120(a0)
    80006bb8:	02f05a63          	blez	a5,80006bec <pop_off+0x5c>
    80006bbc:	fff7871b          	addiw	a4,a5,-1
    80006bc0:	06e52c23          	sw	a4,120(a0)
    80006bc4:	00071c63          	bnez	a4,80006bdc <pop_off+0x4c>
    80006bc8:	07c52783          	lw	a5,124(a0)
    80006bcc:	00078863          	beqz	a5,80006bdc <pop_off+0x4c>
    80006bd0:	100027f3          	csrr	a5,sstatus
    80006bd4:	0027e793          	ori	a5,a5,2
    80006bd8:	10079073          	csrw	sstatus,a5
    80006bdc:	00813083          	ld	ra,8(sp)
    80006be0:	00013403          	ld	s0,0(sp)
    80006be4:	01010113          	addi	sp,sp,16
    80006be8:	00008067          	ret
    80006bec:	00002517          	auipc	a0,0x2
    80006bf0:	a9450513          	addi	a0,a0,-1388 # 80008680 <digits+0x48>
    80006bf4:	fffff097          	auipc	ra,0xfffff
    80006bf8:	018080e7          	jalr	24(ra) # 80005c0c <panic>
    80006bfc:	00002517          	auipc	a0,0x2
    80006c00:	a6c50513          	addi	a0,a0,-1428 # 80008668 <digits+0x30>
    80006c04:	fffff097          	auipc	ra,0xfffff
    80006c08:	008080e7          	jalr	8(ra) # 80005c0c <panic>

0000000080006c0c <push_on>:
    80006c0c:	fe010113          	addi	sp,sp,-32
    80006c10:	00813823          	sd	s0,16(sp)
    80006c14:	00113c23          	sd	ra,24(sp)
    80006c18:	00913423          	sd	s1,8(sp)
    80006c1c:	02010413          	addi	s0,sp,32
    80006c20:	100024f3          	csrr	s1,sstatus
    80006c24:	100027f3          	csrr	a5,sstatus
    80006c28:	0027e793          	ori	a5,a5,2
    80006c2c:	10079073          	csrw	sstatus,a5
    80006c30:	ffffe097          	auipc	ra,0xffffe
    80006c34:	618080e7          	jalr	1560(ra) # 80005248 <mycpu>
    80006c38:	07852783          	lw	a5,120(a0)
    80006c3c:	02078663          	beqz	a5,80006c68 <push_on+0x5c>
    80006c40:	ffffe097          	auipc	ra,0xffffe
    80006c44:	608080e7          	jalr	1544(ra) # 80005248 <mycpu>
    80006c48:	07852783          	lw	a5,120(a0)
    80006c4c:	01813083          	ld	ra,24(sp)
    80006c50:	01013403          	ld	s0,16(sp)
    80006c54:	0017879b          	addiw	a5,a5,1
    80006c58:	06f52c23          	sw	a5,120(a0)
    80006c5c:	00813483          	ld	s1,8(sp)
    80006c60:	02010113          	addi	sp,sp,32
    80006c64:	00008067          	ret
    80006c68:	0014d493          	srli	s1,s1,0x1
    80006c6c:	ffffe097          	auipc	ra,0xffffe
    80006c70:	5dc080e7          	jalr	1500(ra) # 80005248 <mycpu>
    80006c74:	0014f493          	andi	s1,s1,1
    80006c78:	06952e23          	sw	s1,124(a0)
    80006c7c:	fc5ff06f          	j	80006c40 <push_on+0x34>

0000000080006c80 <pop_on>:
    80006c80:	ff010113          	addi	sp,sp,-16
    80006c84:	00813023          	sd	s0,0(sp)
    80006c88:	00113423          	sd	ra,8(sp)
    80006c8c:	01010413          	addi	s0,sp,16
    80006c90:	ffffe097          	auipc	ra,0xffffe
    80006c94:	5b8080e7          	jalr	1464(ra) # 80005248 <mycpu>
    80006c98:	100027f3          	csrr	a5,sstatus
    80006c9c:	0027f793          	andi	a5,a5,2
    80006ca0:	04078463          	beqz	a5,80006ce8 <pop_on+0x68>
    80006ca4:	07852783          	lw	a5,120(a0)
    80006ca8:	02f05863          	blez	a5,80006cd8 <pop_on+0x58>
    80006cac:	fff7879b          	addiw	a5,a5,-1
    80006cb0:	06f52c23          	sw	a5,120(a0)
    80006cb4:	07853783          	ld	a5,120(a0)
    80006cb8:	00079863          	bnez	a5,80006cc8 <pop_on+0x48>
    80006cbc:	100027f3          	csrr	a5,sstatus
    80006cc0:	ffd7f793          	andi	a5,a5,-3
    80006cc4:	10079073          	csrw	sstatus,a5
    80006cc8:	00813083          	ld	ra,8(sp)
    80006ccc:	00013403          	ld	s0,0(sp)
    80006cd0:	01010113          	addi	sp,sp,16
    80006cd4:	00008067          	ret
    80006cd8:	00002517          	auipc	a0,0x2
    80006cdc:	9d050513          	addi	a0,a0,-1584 # 800086a8 <digits+0x70>
    80006ce0:	fffff097          	auipc	ra,0xfffff
    80006ce4:	f2c080e7          	jalr	-212(ra) # 80005c0c <panic>
    80006ce8:	00002517          	auipc	a0,0x2
    80006cec:	9a050513          	addi	a0,a0,-1632 # 80008688 <digits+0x50>
    80006cf0:	fffff097          	auipc	ra,0xfffff
    80006cf4:	f1c080e7          	jalr	-228(ra) # 80005c0c <panic>

0000000080006cf8 <__memset>:
    80006cf8:	ff010113          	addi	sp,sp,-16
    80006cfc:	00813423          	sd	s0,8(sp)
    80006d00:	01010413          	addi	s0,sp,16
    80006d04:	1a060e63          	beqz	a2,80006ec0 <__memset+0x1c8>
    80006d08:	40a007b3          	neg	a5,a0
    80006d0c:	0077f793          	andi	a5,a5,7
    80006d10:	00778693          	addi	a3,a5,7
    80006d14:	00b00813          	li	a6,11
    80006d18:	0ff5f593          	andi	a1,a1,255
    80006d1c:	fff6071b          	addiw	a4,a2,-1
    80006d20:	1b06e663          	bltu	a3,a6,80006ecc <__memset+0x1d4>
    80006d24:	1cd76463          	bltu	a4,a3,80006eec <__memset+0x1f4>
    80006d28:	1a078e63          	beqz	a5,80006ee4 <__memset+0x1ec>
    80006d2c:	00b50023          	sb	a1,0(a0)
    80006d30:	00100713          	li	a4,1
    80006d34:	1ae78463          	beq	a5,a4,80006edc <__memset+0x1e4>
    80006d38:	00b500a3          	sb	a1,1(a0)
    80006d3c:	00200713          	li	a4,2
    80006d40:	1ae78a63          	beq	a5,a4,80006ef4 <__memset+0x1fc>
    80006d44:	00b50123          	sb	a1,2(a0)
    80006d48:	00300713          	li	a4,3
    80006d4c:	18e78463          	beq	a5,a4,80006ed4 <__memset+0x1dc>
    80006d50:	00b501a3          	sb	a1,3(a0)
    80006d54:	00400713          	li	a4,4
    80006d58:	1ae78263          	beq	a5,a4,80006efc <__memset+0x204>
    80006d5c:	00b50223          	sb	a1,4(a0)
    80006d60:	00500713          	li	a4,5
    80006d64:	1ae78063          	beq	a5,a4,80006f04 <__memset+0x20c>
    80006d68:	00b502a3          	sb	a1,5(a0)
    80006d6c:	00700713          	li	a4,7
    80006d70:	18e79e63          	bne	a5,a4,80006f0c <__memset+0x214>
    80006d74:	00b50323          	sb	a1,6(a0)
    80006d78:	00700e93          	li	t4,7
    80006d7c:	00859713          	slli	a4,a1,0x8
    80006d80:	00e5e733          	or	a4,a1,a4
    80006d84:	01059e13          	slli	t3,a1,0x10
    80006d88:	01c76e33          	or	t3,a4,t3
    80006d8c:	01859313          	slli	t1,a1,0x18
    80006d90:	006e6333          	or	t1,t3,t1
    80006d94:	02059893          	slli	a7,a1,0x20
    80006d98:	40f60e3b          	subw	t3,a2,a5
    80006d9c:	011368b3          	or	a7,t1,a7
    80006da0:	02859813          	slli	a6,a1,0x28
    80006da4:	0108e833          	or	a6,a7,a6
    80006da8:	03059693          	slli	a3,a1,0x30
    80006dac:	003e589b          	srliw	a7,t3,0x3
    80006db0:	00d866b3          	or	a3,a6,a3
    80006db4:	03859713          	slli	a4,a1,0x38
    80006db8:	00389813          	slli	a6,a7,0x3
    80006dbc:	00f507b3          	add	a5,a0,a5
    80006dc0:	00e6e733          	or	a4,a3,a4
    80006dc4:	000e089b          	sext.w	a7,t3
    80006dc8:	00f806b3          	add	a3,a6,a5
    80006dcc:	00e7b023          	sd	a4,0(a5)
    80006dd0:	00878793          	addi	a5,a5,8
    80006dd4:	fed79ce3          	bne	a5,a3,80006dcc <__memset+0xd4>
    80006dd8:	ff8e7793          	andi	a5,t3,-8
    80006ddc:	0007871b          	sext.w	a4,a5
    80006de0:	01d787bb          	addw	a5,a5,t4
    80006de4:	0ce88e63          	beq	a7,a4,80006ec0 <__memset+0x1c8>
    80006de8:	00f50733          	add	a4,a0,a5
    80006dec:	00b70023          	sb	a1,0(a4)
    80006df0:	0017871b          	addiw	a4,a5,1
    80006df4:	0cc77663          	bgeu	a4,a2,80006ec0 <__memset+0x1c8>
    80006df8:	00e50733          	add	a4,a0,a4
    80006dfc:	00b70023          	sb	a1,0(a4)
    80006e00:	0027871b          	addiw	a4,a5,2
    80006e04:	0ac77e63          	bgeu	a4,a2,80006ec0 <__memset+0x1c8>
    80006e08:	00e50733          	add	a4,a0,a4
    80006e0c:	00b70023          	sb	a1,0(a4)
    80006e10:	0037871b          	addiw	a4,a5,3
    80006e14:	0ac77663          	bgeu	a4,a2,80006ec0 <__memset+0x1c8>
    80006e18:	00e50733          	add	a4,a0,a4
    80006e1c:	00b70023          	sb	a1,0(a4)
    80006e20:	0047871b          	addiw	a4,a5,4
    80006e24:	08c77e63          	bgeu	a4,a2,80006ec0 <__memset+0x1c8>
    80006e28:	00e50733          	add	a4,a0,a4
    80006e2c:	00b70023          	sb	a1,0(a4)
    80006e30:	0057871b          	addiw	a4,a5,5
    80006e34:	08c77663          	bgeu	a4,a2,80006ec0 <__memset+0x1c8>
    80006e38:	00e50733          	add	a4,a0,a4
    80006e3c:	00b70023          	sb	a1,0(a4)
    80006e40:	0067871b          	addiw	a4,a5,6
    80006e44:	06c77e63          	bgeu	a4,a2,80006ec0 <__memset+0x1c8>
    80006e48:	00e50733          	add	a4,a0,a4
    80006e4c:	00b70023          	sb	a1,0(a4)
    80006e50:	0077871b          	addiw	a4,a5,7
    80006e54:	06c77663          	bgeu	a4,a2,80006ec0 <__memset+0x1c8>
    80006e58:	00e50733          	add	a4,a0,a4
    80006e5c:	00b70023          	sb	a1,0(a4)
    80006e60:	0087871b          	addiw	a4,a5,8
    80006e64:	04c77e63          	bgeu	a4,a2,80006ec0 <__memset+0x1c8>
    80006e68:	00e50733          	add	a4,a0,a4
    80006e6c:	00b70023          	sb	a1,0(a4)
    80006e70:	0097871b          	addiw	a4,a5,9
    80006e74:	04c77663          	bgeu	a4,a2,80006ec0 <__memset+0x1c8>
    80006e78:	00e50733          	add	a4,a0,a4
    80006e7c:	00b70023          	sb	a1,0(a4)
    80006e80:	00a7871b          	addiw	a4,a5,10
    80006e84:	02c77e63          	bgeu	a4,a2,80006ec0 <__memset+0x1c8>
    80006e88:	00e50733          	add	a4,a0,a4
    80006e8c:	00b70023          	sb	a1,0(a4)
    80006e90:	00b7871b          	addiw	a4,a5,11
    80006e94:	02c77663          	bgeu	a4,a2,80006ec0 <__memset+0x1c8>
    80006e98:	00e50733          	add	a4,a0,a4
    80006e9c:	00b70023          	sb	a1,0(a4)
    80006ea0:	00c7871b          	addiw	a4,a5,12
    80006ea4:	00c77e63          	bgeu	a4,a2,80006ec0 <__memset+0x1c8>
    80006ea8:	00e50733          	add	a4,a0,a4
    80006eac:	00b70023          	sb	a1,0(a4)
    80006eb0:	00d7879b          	addiw	a5,a5,13
    80006eb4:	00c7f663          	bgeu	a5,a2,80006ec0 <__memset+0x1c8>
    80006eb8:	00f507b3          	add	a5,a0,a5
    80006ebc:	00b78023          	sb	a1,0(a5)
    80006ec0:	00813403          	ld	s0,8(sp)
    80006ec4:	01010113          	addi	sp,sp,16
    80006ec8:	00008067          	ret
    80006ecc:	00b00693          	li	a3,11
    80006ed0:	e55ff06f          	j	80006d24 <__memset+0x2c>
    80006ed4:	00300e93          	li	t4,3
    80006ed8:	ea5ff06f          	j	80006d7c <__memset+0x84>
    80006edc:	00100e93          	li	t4,1
    80006ee0:	e9dff06f          	j	80006d7c <__memset+0x84>
    80006ee4:	00000e93          	li	t4,0
    80006ee8:	e95ff06f          	j	80006d7c <__memset+0x84>
    80006eec:	00000793          	li	a5,0
    80006ef0:	ef9ff06f          	j	80006de8 <__memset+0xf0>
    80006ef4:	00200e93          	li	t4,2
    80006ef8:	e85ff06f          	j	80006d7c <__memset+0x84>
    80006efc:	00400e93          	li	t4,4
    80006f00:	e7dff06f          	j	80006d7c <__memset+0x84>
    80006f04:	00500e93          	li	t4,5
    80006f08:	e75ff06f          	j	80006d7c <__memset+0x84>
    80006f0c:	00600e93          	li	t4,6
    80006f10:	e6dff06f          	j	80006d7c <__memset+0x84>

0000000080006f14 <__memmove>:
    80006f14:	ff010113          	addi	sp,sp,-16
    80006f18:	00813423          	sd	s0,8(sp)
    80006f1c:	01010413          	addi	s0,sp,16
    80006f20:	0e060863          	beqz	a2,80007010 <__memmove+0xfc>
    80006f24:	fff6069b          	addiw	a3,a2,-1
    80006f28:	0006881b          	sext.w	a6,a3
    80006f2c:	0ea5e863          	bltu	a1,a0,8000701c <__memmove+0x108>
    80006f30:	00758713          	addi	a4,a1,7
    80006f34:	00a5e7b3          	or	a5,a1,a0
    80006f38:	40a70733          	sub	a4,a4,a0
    80006f3c:	0077f793          	andi	a5,a5,7
    80006f40:	00f73713          	sltiu	a4,a4,15
    80006f44:	00174713          	xori	a4,a4,1
    80006f48:	0017b793          	seqz	a5,a5
    80006f4c:	00e7f7b3          	and	a5,a5,a4
    80006f50:	10078863          	beqz	a5,80007060 <__memmove+0x14c>
    80006f54:	00900793          	li	a5,9
    80006f58:	1107f463          	bgeu	a5,a6,80007060 <__memmove+0x14c>
    80006f5c:	0036581b          	srliw	a6,a2,0x3
    80006f60:	fff8081b          	addiw	a6,a6,-1
    80006f64:	02081813          	slli	a6,a6,0x20
    80006f68:	01d85893          	srli	a7,a6,0x1d
    80006f6c:	00858813          	addi	a6,a1,8
    80006f70:	00058793          	mv	a5,a1
    80006f74:	00050713          	mv	a4,a0
    80006f78:	01088833          	add	a6,a7,a6
    80006f7c:	0007b883          	ld	a7,0(a5)
    80006f80:	00878793          	addi	a5,a5,8
    80006f84:	00870713          	addi	a4,a4,8
    80006f88:	ff173c23          	sd	a7,-8(a4)
    80006f8c:	ff0798e3          	bne	a5,a6,80006f7c <__memmove+0x68>
    80006f90:	ff867713          	andi	a4,a2,-8
    80006f94:	02071793          	slli	a5,a4,0x20
    80006f98:	0207d793          	srli	a5,a5,0x20
    80006f9c:	00f585b3          	add	a1,a1,a5
    80006fa0:	40e686bb          	subw	a3,a3,a4
    80006fa4:	00f507b3          	add	a5,a0,a5
    80006fa8:	06e60463          	beq	a2,a4,80007010 <__memmove+0xfc>
    80006fac:	0005c703          	lbu	a4,0(a1)
    80006fb0:	00e78023          	sb	a4,0(a5)
    80006fb4:	04068e63          	beqz	a3,80007010 <__memmove+0xfc>
    80006fb8:	0015c603          	lbu	a2,1(a1)
    80006fbc:	00100713          	li	a4,1
    80006fc0:	00c780a3          	sb	a2,1(a5)
    80006fc4:	04e68663          	beq	a3,a4,80007010 <__memmove+0xfc>
    80006fc8:	0025c603          	lbu	a2,2(a1)
    80006fcc:	00200713          	li	a4,2
    80006fd0:	00c78123          	sb	a2,2(a5)
    80006fd4:	02e68e63          	beq	a3,a4,80007010 <__memmove+0xfc>
    80006fd8:	0035c603          	lbu	a2,3(a1)
    80006fdc:	00300713          	li	a4,3
    80006fe0:	00c781a3          	sb	a2,3(a5)
    80006fe4:	02e68663          	beq	a3,a4,80007010 <__memmove+0xfc>
    80006fe8:	0045c603          	lbu	a2,4(a1)
    80006fec:	00400713          	li	a4,4
    80006ff0:	00c78223          	sb	a2,4(a5)
    80006ff4:	00e68e63          	beq	a3,a4,80007010 <__memmove+0xfc>
    80006ff8:	0055c603          	lbu	a2,5(a1)
    80006ffc:	00500713          	li	a4,5
    80007000:	00c782a3          	sb	a2,5(a5)
    80007004:	00e68663          	beq	a3,a4,80007010 <__memmove+0xfc>
    80007008:	0065c703          	lbu	a4,6(a1)
    8000700c:	00e78323          	sb	a4,6(a5)
    80007010:	00813403          	ld	s0,8(sp)
    80007014:	01010113          	addi	sp,sp,16
    80007018:	00008067          	ret
    8000701c:	02061713          	slli	a4,a2,0x20
    80007020:	02075713          	srli	a4,a4,0x20
    80007024:	00e587b3          	add	a5,a1,a4
    80007028:	f0f574e3          	bgeu	a0,a5,80006f30 <__memmove+0x1c>
    8000702c:	02069613          	slli	a2,a3,0x20
    80007030:	02065613          	srli	a2,a2,0x20
    80007034:	fff64613          	not	a2,a2
    80007038:	00e50733          	add	a4,a0,a4
    8000703c:	00c78633          	add	a2,a5,a2
    80007040:	fff7c683          	lbu	a3,-1(a5)
    80007044:	fff78793          	addi	a5,a5,-1
    80007048:	fff70713          	addi	a4,a4,-1
    8000704c:	00d70023          	sb	a3,0(a4)
    80007050:	fec798e3          	bne	a5,a2,80007040 <__memmove+0x12c>
    80007054:	00813403          	ld	s0,8(sp)
    80007058:	01010113          	addi	sp,sp,16
    8000705c:	00008067          	ret
    80007060:	02069713          	slli	a4,a3,0x20
    80007064:	02075713          	srli	a4,a4,0x20
    80007068:	00170713          	addi	a4,a4,1
    8000706c:	00e50733          	add	a4,a0,a4
    80007070:	00050793          	mv	a5,a0
    80007074:	0005c683          	lbu	a3,0(a1)
    80007078:	00178793          	addi	a5,a5,1
    8000707c:	00158593          	addi	a1,a1,1
    80007080:	fed78fa3          	sb	a3,-1(a5)
    80007084:	fee798e3          	bne	a5,a4,80007074 <__memmove+0x160>
    80007088:	f89ff06f          	j	80007010 <__memmove+0xfc>

000000008000708c <__putc>:
    8000708c:	fe010113          	addi	sp,sp,-32
    80007090:	00813823          	sd	s0,16(sp)
    80007094:	00113c23          	sd	ra,24(sp)
    80007098:	02010413          	addi	s0,sp,32
    8000709c:	00050793          	mv	a5,a0
    800070a0:	fef40593          	addi	a1,s0,-17
    800070a4:	00100613          	li	a2,1
    800070a8:	00000513          	li	a0,0
    800070ac:	fef407a3          	sb	a5,-17(s0)
    800070b0:	fffff097          	auipc	ra,0xfffff
    800070b4:	b3c080e7          	jalr	-1220(ra) # 80005bec <console_write>
    800070b8:	01813083          	ld	ra,24(sp)
    800070bc:	01013403          	ld	s0,16(sp)
    800070c0:	02010113          	addi	sp,sp,32
    800070c4:	00008067          	ret

00000000800070c8 <__getc>:
    800070c8:	fe010113          	addi	sp,sp,-32
    800070cc:	00813823          	sd	s0,16(sp)
    800070d0:	00113c23          	sd	ra,24(sp)
    800070d4:	02010413          	addi	s0,sp,32
    800070d8:	fe840593          	addi	a1,s0,-24
    800070dc:	00100613          	li	a2,1
    800070e0:	00000513          	li	a0,0
    800070e4:	fffff097          	auipc	ra,0xfffff
    800070e8:	ae8080e7          	jalr	-1304(ra) # 80005bcc <console_read>
    800070ec:	fe844503          	lbu	a0,-24(s0)
    800070f0:	01813083          	ld	ra,24(sp)
    800070f4:	01013403          	ld	s0,16(sp)
    800070f8:	02010113          	addi	sp,sp,32
    800070fc:	00008067          	ret

0000000080007100 <console_handler>:
    80007100:	fe010113          	addi	sp,sp,-32
    80007104:	00813823          	sd	s0,16(sp)
    80007108:	00113c23          	sd	ra,24(sp)
    8000710c:	00913423          	sd	s1,8(sp)
    80007110:	02010413          	addi	s0,sp,32
    80007114:	14202773          	csrr	a4,scause
    80007118:	100027f3          	csrr	a5,sstatus
    8000711c:	0027f793          	andi	a5,a5,2
    80007120:	06079e63          	bnez	a5,8000719c <console_handler+0x9c>
    80007124:	00074c63          	bltz	a4,8000713c <console_handler+0x3c>
    80007128:	01813083          	ld	ra,24(sp)
    8000712c:	01013403          	ld	s0,16(sp)
    80007130:	00813483          	ld	s1,8(sp)
    80007134:	02010113          	addi	sp,sp,32
    80007138:	00008067          	ret
    8000713c:	0ff77713          	andi	a4,a4,255
    80007140:	00900793          	li	a5,9
    80007144:	fef712e3          	bne	a4,a5,80007128 <console_handler+0x28>
    80007148:	ffffe097          	auipc	ra,0xffffe
    8000714c:	6dc080e7          	jalr	1756(ra) # 80005824 <plic_claim>
    80007150:	00a00793          	li	a5,10
    80007154:	00050493          	mv	s1,a0
    80007158:	02f50c63          	beq	a0,a5,80007190 <console_handler+0x90>
    8000715c:	fc0506e3          	beqz	a0,80007128 <console_handler+0x28>
    80007160:	00050593          	mv	a1,a0
    80007164:	00001517          	auipc	a0,0x1
    80007168:	44c50513          	addi	a0,a0,1100 # 800085b0 <_ZL6digits+0xe8>
    8000716c:	fffff097          	auipc	ra,0xfffff
    80007170:	afc080e7          	jalr	-1284(ra) # 80005c68 <__printf>
    80007174:	01013403          	ld	s0,16(sp)
    80007178:	01813083          	ld	ra,24(sp)
    8000717c:	00048513          	mv	a0,s1
    80007180:	00813483          	ld	s1,8(sp)
    80007184:	02010113          	addi	sp,sp,32
    80007188:	ffffe317          	auipc	t1,0xffffe
    8000718c:	6d430067          	jr	1748(t1) # 8000585c <plic_complete>
    80007190:	fffff097          	auipc	ra,0xfffff
    80007194:	3e0080e7          	jalr	992(ra) # 80006570 <uartintr>
    80007198:	fddff06f          	j	80007174 <console_handler+0x74>
    8000719c:	00001517          	auipc	a0,0x1
    800071a0:	51450513          	addi	a0,a0,1300 # 800086b0 <digits+0x78>
    800071a4:	fffff097          	auipc	ra,0xfffff
    800071a8:	a68080e7          	jalr	-1432(ra) # 80005c0c <panic>
	...
