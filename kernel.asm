
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000a117          	auipc	sp,0xa
    80000004:	ed813103          	ld	sp,-296(sp) # 80009ed8 <_GLOBAL_OFFSET_TABLE_+0x20>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	35c050ef          	jal	ra,80005378 <start>

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
    80001030:	f2453503          	ld	a0,-220(a0) # 80009f50 <_ZN3TCB7runningE>
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
    800010c8:	761000ef          	jal	ra,80002028 <_ZN5Riscv20handleSupervisorTrapEv>

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
    80001160:	df453503          	ld	a0,-524(a0) # 80009f50 <_ZN3TCB7runningE>
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
    800011b0:	02010413          	addi	s0,sp,32
    800011b4:	00050493          	mv	s1,a0
    800011b8:	00053023          	sd	zero,0(a0)
    idleThread = TCB::createKernelThread([](void *){IdleThread::getInstance()->run();}, nullptr);
    800011bc:	00000593          	li	a1,0
    800011c0:	00000517          	auipc	a0,0x0
    800011c4:	0cc50513          	addi	a0,a0,204 # 8000128c <_ZZN10IdleThreadC4EvENUlPvE_4_FUNES0_>
    800011c8:	00002097          	auipc	ra,0x2
    800011cc:	ce8080e7          	jalr	-792(ra) # 80002eb0 <_ZN3TCB18createKernelThreadEPFvPvES0_>
    800011d0:	00a4b023          	sd	a0,0(s1)
    bool isIdle() const {
        return status == IDLE;
    }

    void setIdle() {
        status = IDLE;
    800011d4:	00300793          	li	a5,3
    800011d8:	04f52423          	sw	a5,72(a0)
    idleThread->setIdle();
}
    800011dc:	01813083          	ld	ra,24(sp)
    800011e0:	01013403          	ld	s0,16(sp)
    800011e4:	00813483          	ld	s1,8(sp)
    800011e8:	02010113          	addi	sp,sp,32
    800011ec:	00008067          	ret

00000000800011f0 <_ZN10IdleThread11getInstanceEv>:
    if (!instance) instance = new IdleThread;
    800011f0:	00009797          	auipc	a5,0x9
    800011f4:	d407b783          	ld	a5,-704(a5) # 80009f30 <_ZN10IdleThread8instanceE>
    800011f8:	00078863          	beqz	a5,80001208 <_ZN10IdleThread11getInstanceEv+0x18>
    return instance;
    800011fc:	00009517          	auipc	a0,0x9
    80001200:	d3453503          	ld	a0,-716(a0) # 80009f30 <_ZN10IdleThread8instanceE>
}
    80001204:	00008067          	ret
IdleThread *IdleThread::getInstance() {
    80001208:	fe010113          	addi	sp,sp,-32
    8000120c:	00113c23          	sd	ra,24(sp)
    80001210:	00813823          	sd	s0,16(sp)
    80001214:	00913423          	sd	s1,8(sp)
    80001218:	01213023          	sd	s2,0(sp)
    8000121c:	02010413          	addi	s0,sp,32

class KernelObject {
public:
    static void *operator new(size_t size) {
        size = (size - 1) / MEM_BLOCK_SIZE + 1;
        return kmalloc(size);
    80001220:	00100513          	li	a0,1
    80001224:	00001097          	auipc	ra,0x1
    80001228:	aa4080e7          	jalr	-1372(ra) # 80001cc8 <_Z7kmallocm>
    8000122c:	00050493          	mv	s1,a0
    if (!instance) instance = new IdleThread;
    80001230:	00000097          	auipc	ra,0x0
    80001234:	f70080e7          	jalr	-144(ra) # 800011a0 <_ZN10IdleThreadC1Ev>
    80001238:	00009797          	auipc	a5,0x9
    8000123c:	ce97bc23          	sd	s1,-776(a5) # 80009f30 <_ZN10IdleThread8instanceE>
    return instance;
    80001240:	00009517          	auipc	a0,0x9
    80001244:	cf053503          	ld	a0,-784(a0) # 80009f30 <_ZN10IdleThread8instanceE>
}
    80001248:	01813083          	ld	ra,24(sp)
    8000124c:	01013403          	ld	s0,16(sp)
    80001250:	00813483          	ld	s1,8(sp)
    80001254:	00013903          	ld	s2,0(sp)
    80001258:	02010113          	addi	sp,sp,32
    8000125c:	00008067          	ret
    80001260:	00050913          	mv	s2,a0
        size = (size - 1) / MEM_BLOCK_SIZE + 1;
        return kmalloc(size);
    }

    static void operator delete(void *addr) {
        kfree(addr);
    80001264:	00048513          	mv	a0,s1
    80001268:	00001097          	auipc	ra,0x1
    8000126c:	c5c080e7          	jalr	-932(ra) # 80001ec4 <_Z5kfreePv>
    80001270:	00090513          	mv	a0,s2
    80001274:	0000a097          	auipc	ra,0xa
    80001278:	de4080e7          	jalr	-540(ra) # 8000b058 <_Unwind_Resume>

000000008000127c <_ZN10IdleThread3runEv>:

[[noreturn]] void IdleThread::run() {
    8000127c:	ff010113          	addi	sp,sp,-16
    80001280:	00813423          	sd	s0,8(sp)
    80001284:	01010413          	addi	s0,sp,16
    while (true);
    80001288:	0000006f          	j	80001288 <_ZN10IdleThread3runEv+0xc>

000000008000128c <_ZZN10IdleThreadC4EvENUlPvE_4_FUNES0_>:
    idleThread = TCB::createKernelThread([](void *){IdleThread::getInstance()->run();}, nullptr);
    8000128c:	ff010113          	addi	sp,sp,-16
    80001290:	00113423          	sd	ra,8(sp)
    80001294:	00813023          	sd	s0,0(sp)
    80001298:	01010413          	addi	s0,sp,16
    8000129c:	00000097          	auipc	ra,0x0
    800012a0:	f54080e7          	jalr	-172(ra) # 800011f0 <_ZN10IdleThread11getInstanceEv>
    800012a4:	00000097          	auipc	ra,0x0
    800012a8:	fd8080e7          	jalr	-40(ra) # 8000127c <_ZN10IdleThread3runEv>

00000000800012ac <_ZN10IdleThreadD1Ev>:
}

IdleThread::~IdleThread() {
    800012ac:	fe010113          	addi	sp,sp,-32
    800012b0:	00113c23          	sd	ra,24(sp)
    800012b4:	00813823          	sd	s0,16(sp)
    800012b8:	00913423          	sd	s1,8(sp)
    800012bc:	02010413          	addi	s0,sp,32
    delete idleThread;
    800012c0:	00053483          	ld	s1,0(a0)
    800012c4:	00048e63          	beqz	s1,800012e0 <_ZN10IdleThreadD1Ev+0x34>
    800012c8:	00048513          	mv	a0,s1
    800012cc:	00002097          	auipc	ra,0x2
    800012d0:	f24080e7          	jalr	-220(ra) # 800031f0 <_ZN3TCBD1Ev>
    800012d4:	00048513          	mv	a0,s1
    800012d8:	00001097          	auipc	ra,0x1
    800012dc:	bec080e7          	jalr	-1044(ra) # 80001ec4 <_Z5kfreePv>
}
    800012e0:	01813083          	ld	ra,24(sp)
    800012e4:	01013403          	ld	s0,16(sp)
    800012e8:	00813483          	ld	s1,8(sp)
    800012ec:	02010113          	addi	sp,sp,32
    800012f0:	00008067          	ret

00000000800012f4 <_ZN10IdleThread13getIdleThreadEv>:

TCB *IdleThread::getIdleThread() {
    800012f4:	ff010113          	addi	sp,sp,-16
    800012f8:	00113423          	sd	ra,8(sp)
    800012fc:	00813023          	sd	s0,0(sp)
    80001300:	01010413          	addi	s0,sp,16
    return getInstance()->idleThread;
    80001304:	00000097          	auipc	ra,0x0
    80001308:	eec080e7          	jalr	-276(ra) # 800011f0 <_ZN10IdleThread11getInstanceEv>
}
    8000130c:	00053503          	ld	a0,0(a0)
    80001310:	00813083          	ld	ra,8(sp)
    80001314:	00013403          	ld	s0,0(sp)
    80001318:	01010113          	addi	sp,sp,16
    8000131c:	00008067          	ret

0000000080001320 <_ZN6Kernel9mem_allocEm>:
            kprintString("\n");
            return;
    }
}

void *Kernel::mem_alloc(size_t size) {
    80001320:	ff010113          	addi	sp,sp,-16
    80001324:	00113423          	sd	ra,8(sp)
    80001328:	00813023          	sd	s0,0(sp)
    8000132c:	01010413          	addi	s0,sp,16
    return kmalloc(size);
    80001330:	00001097          	auipc	ra,0x1
    80001334:	998080e7          	jalr	-1640(ra) # 80001cc8 <_Z7kmallocm>
}
    80001338:	00813083          	ld	ra,8(sp)
    8000133c:	00013403          	ld	s0,0(sp)
    80001340:	01010113          	addi	sp,sp,16
    80001344:	00008067          	ret

0000000080001348 <_ZN6Kernel8mem_freeEPv>:

int Kernel::mem_free(void *addr) {
    80001348:	ff010113          	addi	sp,sp,-16
    8000134c:	00113423          	sd	ra,8(sp)
    80001350:	00813023          	sd	s0,0(sp)
    80001354:	01010413          	addi	s0,sp,16
    return kfree(addr);
    80001358:	00001097          	auipc	ra,0x1
    8000135c:	b6c080e7          	jalr	-1172(ra) # 80001ec4 <_Z5kfreePv>
}
    80001360:	00813083          	ld	ra,8(sp)
    80001364:	00013403          	ld	s0,0(sp)
    80001368:	01010113          	addi	sp,sp,16
    8000136c:	00008067          	ret

0000000080001370 <_ZN6Kernel13thread_createEPm>:

int Kernel::thread_create(uint64 *args) {
    80001370:	fe010113          	addi	sp,sp,-32
    80001374:	00113c23          	sd	ra,24(sp)
    80001378:	00813823          	sd	s0,16(sp)
    8000137c:	00913423          	sd	s1,8(sp)
    80001380:	02010413          	addi	s0,sp,32
    TCB **handle = (TCB **) args[0];
    80001384:	00053483          	ld	s1,0(a0)
    if (!handle) return -1;
    80001388:	00049e63          	bnez	s1,800013a4 <_ZN6Kernel13thread_createEPm+0x34>
    8000138c:	fff00513          	li	a0,-1
    void *arg = (void *) args[2];
    uint64 *stack = (uint64 *) args[3];

    *handle = TCB::createUserThread(body, arg, stack);
    return *handle != nullptr;
}
    80001390:	01813083          	ld	ra,24(sp)
    80001394:	01013403          	ld	s0,16(sp)
    80001398:	00813483          	ld	s1,8(sp)
    8000139c:	02010113          	addi	sp,sp,32
    800013a0:	00008067          	ret
    *handle = TCB::createUserThread(body, arg, stack);
    800013a4:	01853603          	ld	a2,24(a0)
    800013a8:	01053583          	ld	a1,16(a0)
    800013ac:	00853503          	ld	a0,8(a0)
    800013b0:	00002097          	auipc	ra,0x2
    800013b4:	b64080e7          	jalr	-1180(ra) # 80002f14 <_ZN3TCB16createUserThreadEPFvPvES0_Pm>
    800013b8:	00a4b023          	sd	a0,0(s1)
    return *handle != nullptr;
    800013bc:	00a03533          	snez	a0,a0
    800013c0:	fd1ff06f          	j	80001390 <_ZN6Kernel13thread_createEPm+0x20>

00000000800013c4 <_ZN6Kernel11thread_exitEv>:

int Kernel::thread_exit() {
    800013c4:	ff010113          	addi	sp,sp,-16
    800013c8:	00113423          	sd	ra,8(sp)
    800013cc:	00813023          	sd	s0,0(sp)
    800013d0:	01010413          	addi	s0,sp,16
    TCB::exit();
    800013d4:	00002097          	auipc	ra,0x2
    800013d8:	d08080e7          	jalr	-760(ra) # 800030dc <_ZN3TCB4exitEv>
    return -1;
}
    800013dc:	fff00513          	li	a0,-1
    800013e0:	00813083          	ld	ra,8(sp)
    800013e4:	00013403          	ld	s0,0(sp)
    800013e8:	01010113          	addi	sp,sp,16
    800013ec:	00008067          	ret

00000000800013f0 <_ZN6Kernel15thread_dispatchEv>:

void Kernel::thread_dispatch() {
    800013f0:	ff010113          	addi	sp,sp,-16
    800013f4:	00113423          	sd	ra,8(sp)
    800013f8:	00813023          	sd	s0,0(sp)
    800013fc:	01010413          	addi	s0,sp,16
    TCB::running->dispatch();
    80001400:	00002097          	auipc	ra,0x2
    80001404:	c18080e7          	jalr	-1000(ra) # 80003018 <_ZN3TCB8dispatchEv>
}
    80001408:	00813083          	ld	ra,8(sp)
    8000140c:	00013403          	ld	s0,0(sp)
    80001410:	01010113          	addi	sp,sp,16
    80001414:	00008067          	ret

0000000080001418 <_ZN6Kernel8sem_openEPm>:

int Kernel::sem_open(uint64 *args) {
    80001418:	fe010113          	addi	sp,sp,-32
    8000141c:	00113c23          	sd	ra,24(sp)
    80001420:	00813823          	sd	s0,16(sp)
    80001424:	00913423          	sd	s1,8(sp)
    80001428:	01213023          	sd	s2,0(sp)
    8000142c:	02010413          	addi	s0,sp,32
    KernelSemaphore **handle = (KernelSemaphore **) args[0];
    80001430:	00053483          	ld	s1,0(a0)
    if (!handle) return -1;
    80001434:	02049063          	bnez	s1,80001454 <_ZN6Kernel8sem_openEPm+0x3c>
    80001438:	fff00513          	li	a0,-1

    unsigned int init = (unsigned int) args[1];

    *handle = new KernelSemaphore(init);
    return *handle != nullptr;
}
    8000143c:	01813083          	ld	ra,24(sp)
    80001440:	01013403          	ld	s0,16(sp)
    80001444:	00813483          	ld	s1,8(sp)
    80001448:	00013903          	ld	s2,0(sp)
    8000144c:	02010113          	addi	sp,sp,32
    80001450:	00008067          	ret
    unsigned int init = (unsigned int) args[1];
    80001454:	00853903          	ld	s2,8(a0)
        return kmalloc(size);
    80001458:	00100513          	li	a0,1
    8000145c:	00001097          	auipc	ra,0x1
    80001460:	86c080e7          	jalr	-1940(ra) # 80001cc8 <_Z7kmallocm>

class TCB;

class KernelSemaphore : public KernelObject {
public:
    KernelSemaphore(int val = 1) : val(val) {}
    80001464:	01252023          	sw	s2,0(a0)
#include "KernelObject.h"
#include "ThreadNode.h"

class ThreadList : public KernelObject {
public:
    explicit ThreadList() = default;
    80001468:	00053423          	sd	zero,8(a0)
    8000146c:	00053823          	sd	zero,16(a0)
    80001470:	00053c23          	sd	zero,24(a0)
    80001474:	02052023          	sw	zero,32(a0)
    *handle = new KernelSemaphore(init);
    80001478:	00a4b023          	sd	a0,0(s1)
    return *handle != nullptr;
    8000147c:	00a03533          	snez	a0,a0
    80001480:	fbdff06f          	j	8000143c <_ZN6Kernel8sem_openEPm+0x24>

0000000080001484 <_ZN6Kernel9sem_closeEPP15KernelSemaphore>:

int Kernel::sem_close(KernelSemaphore **sem) {
    if (!sem || !*sem) return -1;
    80001484:	06050063          	beqz	a0,800014e4 <_ZN6Kernel9sem_closeEPP15KernelSemaphore+0x60>
int Kernel::sem_close(KernelSemaphore **sem) {
    80001488:	fe010113          	addi	sp,sp,-32
    8000148c:	00113c23          	sd	ra,24(sp)
    80001490:	00813823          	sd	s0,16(sp)
    80001494:	00913423          	sd	s1,8(sp)
    80001498:	01213023          	sd	s2,0(sp)
    8000149c:	02010413          	addi	s0,sp,32
    800014a0:	00050493          	mv	s1,a0
    if (!sem || !*sem) return -1;
    800014a4:	00053903          	ld	s2,0(a0)
    800014a8:	04090263          	beqz	s2,800014ec <_ZN6Kernel9sem_closeEPP15KernelSemaphore+0x68>
    delete *sem;
    800014ac:	00090513          	mv	a0,s2
    800014b0:	00000097          	auipc	ra,0x0
    800014b4:	428080e7          	jalr	1064(ra) # 800018d8 <_ZN15KernelSemaphoreD1Ev>
        kfree(addr);
    800014b8:	00090513          	mv	a0,s2
    800014bc:	00001097          	auipc	ra,0x1
    800014c0:	a08080e7          	jalr	-1528(ra) # 80001ec4 <_Z5kfreePv>
    *sem = nullptr;
    800014c4:	0004b023          	sd	zero,0(s1)

    return 0;
    800014c8:	00000513          	li	a0,0
}
    800014cc:	01813083          	ld	ra,24(sp)
    800014d0:	01013403          	ld	s0,16(sp)
    800014d4:	00813483          	ld	s1,8(sp)
    800014d8:	00013903          	ld	s2,0(sp)
    800014dc:	02010113          	addi	sp,sp,32
    800014e0:	00008067          	ret
    if (!sem || !*sem) return -1;
    800014e4:	fff00513          	li	a0,-1
}
    800014e8:	00008067          	ret
    if (!sem || !*sem) return -1;
    800014ec:	fff00513          	li	a0,-1
    800014f0:	fddff06f          	j	800014cc <_ZN6Kernel9sem_closeEPP15KernelSemaphore+0x48>

00000000800014f4 <_ZN6Kernel8sem_waitEPP15KernelSemaphore>:

int Kernel::sem_wait(KernelSemaphore **sem) {
    if (!sem || !*sem) return -1;
    800014f4:	02050c63          	beqz	a0,8000152c <_ZN6Kernel8sem_waitEPP15KernelSemaphore+0x38>
    800014f8:	00053503          	ld	a0,0(a0)
    800014fc:	02050c63          	beqz	a0,80001534 <_ZN6Kernel8sem_waitEPP15KernelSemaphore+0x40>
int Kernel::sem_wait(KernelSemaphore **sem) {
    80001500:	ff010113          	addi	sp,sp,-16
    80001504:	00113423          	sd	ra,8(sp)
    80001508:	00813023          	sd	s0,0(sp)
    8000150c:	01010413          	addi	s0,sp,16
    (*sem)->wait();
    80001510:	00000097          	auipc	ra,0x0
    80001514:	30c080e7          	jalr	780(ra) # 8000181c <_ZN15KernelSemaphore4waitEv>
    return 0;
    80001518:	00000513          	li	a0,0
}
    8000151c:	00813083          	ld	ra,8(sp)
    80001520:	00013403          	ld	s0,0(sp)
    80001524:	01010113          	addi	sp,sp,16
    80001528:	00008067          	ret
    if (!sem || !*sem) return -1;
    8000152c:	fff00513          	li	a0,-1
    80001530:	00008067          	ret
    80001534:	fff00513          	li	a0,-1
}
    80001538:	00008067          	ret

000000008000153c <_ZN6Kernel10sem_signalEPP15KernelSemaphore>:

int Kernel::sem_signal(KernelSemaphore **sem) {
    if (!sem || !*sem) return -1;
    8000153c:	02050c63          	beqz	a0,80001574 <_ZN6Kernel10sem_signalEPP15KernelSemaphore+0x38>
    80001540:	00053503          	ld	a0,0(a0)
    80001544:	02050c63          	beqz	a0,8000157c <_ZN6Kernel10sem_signalEPP15KernelSemaphore+0x40>
int Kernel::sem_signal(KernelSemaphore **sem) {
    80001548:	ff010113          	addi	sp,sp,-16
    8000154c:	00113423          	sd	ra,8(sp)
    80001550:	00813023          	sd	s0,0(sp)
    80001554:	01010413          	addi	s0,sp,16
    (*sem)->signal();
    80001558:	00000097          	auipc	ra,0x0
    8000155c:	324080e7          	jalr	804(ra) # 8000187c <_ZN15KernelSemaphore6signalEv>
    return 0;
    80001560:	00000513          	li	a0,0
}
    80001564:	00813083          	ld	ra,8(sp)
    80001568:	00013403          	ld	s0,0(sp)
    8000156c:	01010113          	addi	sp,sp,16
    80001570:	00008067          	ret
    if (!sem || !*sem) return -1;
    80001574:	fff00513          	li	a0,-1
    80001578:	00008067          	ret
    8000157c:	fff00513          	li	a0,-1
}
    80001580:	00008067          	ret

0000000080001584 <_ZN6Kernel10time_sleepEm>:

int Kernel::time_sleep(time_t time) {
    80001584:	ff010113          	addi	sp,sp,-16
    80001588:	00113423          	sd	ra,8(sp)
    8000158c:	00813023          	sd	s0,0(sp)
    80001590:	01010413          	addi	s0,sp,16
    80001594:	00050593          	mv	a1,a0
    if (time < 0) return -1;
    TimerInterrupt::block(TCB::running, time);
    80001598:	00009797          	auipc	a5,0x9
    8000159c:	9487b783          	ld	a5,-1720(a5) # 80009ee0 <_GLOBAL_OFFSET_TABLE_+0x28>
    800015a0:	0007b503          	ld	a0,0(a5)
    800015a4:	00002097          	auipc	ra,0x2
    800015a8:	2c4080e7          	jalr	708(ra) # 80003868 <_ZN14TimerInterrupt5blockEP3TCBm>
    return 0;
}
    800015ac:	00000513          	li	a0,0
    800015b0:	00813083          	ld	ra,8(sp)
    800015b4:	00013403          	ld	s0,0(sp)
    800015b8:	01010113          	addi	sp,sp,16
    800015bc:	00008067          	ret

00000000800015c0 <_ZN6Kernel4getcEv>:

char Kernel::getc() {
    800015c0:	ff010113          	addi	sp,sp,-16
    800015c4:	00113423          	sd	ra,8(sp)
    800015c8:	00813023          	sd	s0,0(sp)
    800015cc:	01010413          	addi	s0,sp,16
    return __getc();
    800015d0:	00006097          	auipc	ra,0x6
    800015d4:	ea8080e7          	jalr	-344(ra) # 80007478 <__getc>
}
    800015d8:	00813083          	ld	ra,8(sp)
    800015dc:	00013403          	ld	s0,0(sp)
    800015e0:	01010113          	addi	sp,sp,16
    800015e4:	00008067          	ret

00000000800015e8 <_ZN6Kernel4putcEc>:

void Kernel::putc(char c) {
    800015e8:	ff010113          	addi	sp,sp,-16
    800015ec:	00113423          	sd	ra,8(sp)
    800015f0:	00813023          	sd	s0,0(sp)
    800015f4:	01010413          	addi	s0,sp,16
    __putc(c);
    800015f8:	00006097          	auipc	ra,0x6
    800015fc:	e44080e7          	jalr	-444(ra) # 8000743c <__putc>
}
    80001600:	00813083          	ld	ra,8(sp)
    80001604:	00013403          	ld	s0,0(sp)
    80001608:	01010113          	addi	sp,sp,16
    8000160c:	00008067          	ret

0000000080001610 <_ZN6Kernel16handleSystemCallEv>:
void Kernel::handleSystemCall() {
    80001610:	fd010113          	addi	sp,sp,-48
    80001614:	02113423          	sd	ra,40(sp)
    80001618:	02813023          	sd	s0,32(sp)
    8000161c:	00913c23          	sd	s1,24(sp)
    80001620:	01213823          	sd	s2,16(sp)
    80001624:	03010413          	addi	s0,sp,48
    uint64 context = TCB::running->getSavedContext();
    80001628:	00009797          	auipc	a5,0x9
    8000162c:	8b87b783          	ld	a5,-1864(a5) # 80009ee0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001630:	0007b783          	ld	a5,0(a5)
    uint64 getSsp() const {
        return ssp;
    }

    uint64 getSavedContext() const {
        return (uint64) (kernelStack + DEFAULT_STACK_SIZE - 32);
    80001634:	0207b703          	ld	a4,32(a5)
    80001638:	000087b7          	lui	a5,0x8
    8000163c:	f0078793          	addi	a5,a5,-256 # 7f00 <_entry-0x7fff8100>
    80001640:	00f704b3          	add	s1,a4,a5
    return s0;
}

inline uint64 Riscv::r_a0() {
    uint64 volatile a0;
    __asm__ volatile ("mv %[a0], a0" : [a0] "=r"(a0));
    80001644:	00050793          	mv	a5,a0
    80001648:	fcf43c23          	sd	a5,-40(s0)
    return a0;
    8000164c:	fd843903          	ld	s2,-40(s0)
    __asm__ volatile ("mv a0, %[a0]" : : [a0] "r"(a0));
}

inline uint64 Riscv::r_a1() {
    uint64 volatile a1;
    __asm__ volatile ("mv %[a1], a1" : [a1] "=r"(a1));
    80001650:	00058793          	mv	a5,a1
    80001654:	fcf43823          	sd	a5,-48(s0)
    return a1;
    80001658:	fd043503          	ld	a0,-48(s0)
    switch (code) {
    8000165c:	04200793          	li	a5,66
    80001660:	0f27e863          	bltu	a5,s2,80001750 <_ZN6Kernel16handleSystemCallEv+0x140>
    80001664:	00291713          	slli	a4,s2,0x2
    80001668:	00007697          	auipc	a3,0x7
    8000166c:	9d068693          	addi	a3,a3,-1584 # 80008038 <CONSOLE_STATUS+0x28>
    80001670:	00d70733          	add	a4,a4,a3
    80001674:	00072783          	lw	a5,0(a4)
    80001678:	00d787b3          	add	a5,a5,a3
    8000167c:	00078067          	jr	a5
            mem_alloc((size_t) args);
    80001680:	00000097          	auipc	ra,0x0
    80001684:	ca0080e7          	jalr	-864(ra) # 80001320 <_ZN6Kernel9mem_allocEm>
inline void Riscv::enableInterrupts() {
    ms_sstatus(SSTATUS_SIE);
}

inline void Riscv::pushRegisterA0(uint64 context) {
    __asm__ volatile ("sd a0, 10 * 8(%[context])" : : [context] "r"(context));
    80001688:	04a4b823          	sd	a0,80(s1)
}
    8000168c:	02813083          	ld	ra,40(sp)
    80001690:	02013403          	ld	s0,32(sp)
    80001694:	01813483          	ld	s1,24(sp)
    80001698:	01013903          	ld	s2,16(sp)
    8000169c:	03010113          	addi	sp,sp,48
    800016a0:	00008067          	ret
            mem_free(args);
    800016a4:	00000097          	auipc	ra,0x0
    800016a8:	ca4080e7          	jalr	-860(ra) # 80001348 <_ZN6Kernel8mem_freeEPv>
    800016ac:	04a4b823          	sd	a0,80(s1)
}
    800016b0:	fddff06f          	j	8000168c <_ZN6Kernel16handleSystemCallEv+0x7c>
            thread_create((uint64 *) args);
    800016b4:	00000097          	auipc	ra,0x0
    800016b8:	cbc080e7          	jalr	-836(ra) # 80001370 <_ZN6Kernel13thread_createEPm>
    __asm__ volatile ("sd a0, 10 * 8(%[context])" : : [context] "r"(context));
    800016bc:	04a4b823          	sd	a0,80(s1)
}
    800016c0:	fcdff06f          	j	8000168c <_ZN6Kernel16handleSystemCallEv+0x7c>
            thread_exit();
    800016c4:	00000097          	auipc	ra,0x0
    800016c8:	d00080e7          	jalr	-768(ra) # 800013c4 <_ZN6Kernel11thread_exitEv>
    __asm__ volatile ("sd a0, 10 * 8(%[context])" : : [context] "r"(context));
    800016cc:	04a4b823          	sd	a0,80(s1)
}
    800016d0:	fbdff06f          	j	8000168c <_ZN6Kernel16handleSystemCallEv+0x7c>
            thread_dispatch();
    800016d4:	00000097          	auipc	ra,0x0
    800016d8:	d1c080e7          	jalr	-740(ra) # 800013f0 <_ZN6Kernel15thread_dispatchEv>
            break;
    800016dc:	fb1ff06f          	j	8000168c <_ZN6Kernel16handleSystemCallEv+0x7c>
            sem_open((uint64 *) args);
    800016e0:	00000097          	auipc	ra,0x0
    800016e4:	d38080e7          	jalr	-712(ra) # 80001418 <_ZN6Kernel8sem_openEPm>
    __asm__ volatile ("sd a0, 10 * 8(%[context])" : : [context] "r"(context));
    800016e8:	04a4b823          	sd	a0,80(s1)
}
    800016ec:	fa1ff06f          	j	8000168c <_ZN6Kernel16handleSystemCallEv+0x7c>
            sem_close((KernelSemaphore **) args);
    800016f0:	00000097          	auipc	ra,0x0
    800016f4:	d94080e7          	jalr	-620(ra) # 80001484 <_ZN6Kernel9sem_closeEPP15KernelSemaphore>
    __asm__ volatile ("sd a0, 10 * 8(%[context])" : : [context] "r"(context));
    800016f8:	04a4b823          	sd	a0,80(s1)
}
    800016fc:	f91ff06f          	j	8000168c <_ZN6Kernel16handleSystemCallEv+0x7c>
            sem_wait((KernelSemaphore **) args);
    80001700:	00000097          	auipc	ra,0x0
    80001704:	df4080e7          	jalr	-524(ra) # 800014f4 <_ZN6Kernel8sem_waitEPP15KernelSemaphore>
    __asm__ volatile ("sd a0, 10 * 8(%[context])" : : [context] "r"(context));
    80001708:	04a4b823          	sd	a0,80(s1)
}
    8000170c:	f81ff06f          	j	8000168c <_ZN6Kernel16handleSystemCallEv+0x7c>
            sem_signal((KernelSemaphore **) args);
    80001710:	00000097          	auipc	ra,0x0
    80001714:	e2c080e7          	jalr	-468(ra) # 8000153c <_ZN6Kernel10sem_signalEPP15KernelSemaphore>
    __asm__ volatile ("sd a0, 10 * 8(%[context])" : : [context] "r"(context));
    80001718:	04a4b823          	sd	a0,80(s1)
}
    8000171c:	f71ff06f          	j	8000168c <_ZN6Kernel16handleSystemCallEv+0x7c>
            time_sleep((time_t) args);
    80001720:	00000097          	auipc	ra,0x0
    80001724:	e64080e7          	jalr	-412(ra) # 80001584 <_ZN6Kernel10time_sleepEm>
    __asm__ volatile ("sd a0, 10 * 8(%[context])" : : [context] "r"(context));
    80001728:	04a4b823          	sd	a0,80(s1)
}
    8000172c:	f61ff06f          	j	8000168c <_ZN6Kernel16handleSystemCallEv+0x7c>
            getc();
    80001730:	00000097          	auipc	ra,0x0
    80001734:	e90080e7          	jalr	-368(ra) # 800015c0 <_ZN6Kernel4getcEv>
    __asm__ volatile ("sd a0, 10 * 8(%[context])" : : [context] "r"(context));
    80001738:	04a4b823          	sd	a0,80(s1)
}
    8000173c:	f51ff06f          	j	8000168c <_ZN6Kernel16handleSystemCallEv+0x7c>
            putc((uint64) args);
    80001740:	0ff57513          	andi	a0,a0,255
    80001744:	00000097          	auipc	ra,0x0
    80001748:	ea4080e7          	jalr	-348(ra) # 800015e8 <_ZN6Kernel4putcEc>
            break;
    8000174c:	f41ff06f          	j	8000168c <_ZN6Kernel16handleSystemCallEv+0x7c>
            kprintString("Unknown system call: ");
    80001750:	00007517          	auipc	a0,0x7
    80001754:	8d050513          	addi	a0,a0,-1840 # 80008020 <CONSOLE_STATUS+0x10>
    80001758:	00001097          	auipc	ra,0x1
    8000175c:	114080e7          	jalr	276(ra) # 8000286c <_Z12kprintStringPKc>
            kprintUnsigned(code);
    80001760:	00090513          	mv	a0,s2
    80001764:	00001097          	auipc	ra,0x1
    80001768:	360080e7          	jalr	864(ra) # 80002ac4 <_Z14kprintUnsignedm>
            kprintString("\n");
    8000176c:	00007517          	auipc	a0,0x7
    80001770:	a1c50513          	addi	a0,a0,-1508 # 80008188 <CONSOLE_STATUS+0x178>
    80001774:	00001097          	auipc	ra,0x1
    80001778:	0f8080e7          	jalr	248(ra) # 8000286c <_Z12kprintStringPKc>
            return;
    8000177c:	f11ff06f          	j	8000168c <_ZN6Kernel16handleSystemCallEv+0x7c>

0000000080001780 <_ZN15KernelSemaphore5blockEv>:
#include "../h/KernelSemaphore.h"
#include "../h/Riscv.h"
#include "../h/TCB.h"
#include "../h/Scheduler.h"

void KernelSemaphore::block() {
    80001780:	fe010113          	addi	sp,sp,-32
    80001784:	00113c23          	sd	ra,24(sp)
    80001788:	00813823          	sd	s0,16(sp)
    8000178c:	00913423          	sd	s1,8(sp)
    80001790:	02010413          	addi	s0,sp,32
    blockedThreadQueue.addLast(TCB::running->getNode());
    80001794:	00008497          	auipc	s1,0x8
    80001798:	74c4b483          	ld	s1,1868(s1) # 80009ee0 <_GLOBAL_OFFSET_TABLE_+0x28>
    8000179c:	0004b583          	ld	a1,0(s1)
    800017a0:	0a058593          	addi	a1,a1,160
    800017a4:	00850513          	addi	a0,a0,8
    800017a8:	00002097          	auipc	ra,0x2
    800017ac:	e40080e7          	jalr	-448(ra) # 800035e8 <_ZN10ThreadList7addLastEP10ThreadNode>
    TCB::running->setBlocked();
    800017b0:	0004b783          	ld	a5,0(s1)
        status = BLOCKED;
    800017b4:	00200713          	li	a4,2
    800017b8:	04e7a423          	sw	a4,72(a5)
    TCB::dispatch();
    800017bc:	00002097          	auipc	ra,0x2
    800017c0:	85c080e7          	jalr	-1956(ra) # 80003018 <_ZN3TCB8dispatchEv>
}
    800017c4:	01813083          	ld	ra,24(sp)
    800017c8:	01013403          	ld	s0,16(sp)
    800017cc:	00813483          	ld	s1,8(sp)
    800017d0:	02010113          	addi	sp,sp,32
    800017d4:	00008067          	ret

00000000800017d8 <_ZN15KernelSemaphore7deblockEv>:
    bool hasCurr() {
        return curr != nullptr;
    }

    bool isEmpty() {
        return size == 0;
    800017d8:	02052783          	lw	a5,32(a0)

void KernelSemaphore::deblock() {
    if (blockedThreadQueue.isEmpty()) return;
    800017dc:	00079463          	bnez	a5,800017e4 <_ZN15KernelSemaphore7deblockEv+0xc>
    800017e0:	00008067          	ret
void KernelSemaphore::deblock() {
    800017e4:	ff010113          	addi	sp,sp,-16
    800017e8:	00113423          	sd	ra,8(sp)
    800017ec:	00813023          	sd	s0,0(sp)
    800017f0:	01010413          	addi	s0,sp,16
    TCB *tcb = blockedThreadQueue.removeFirst();
    800017f4:	00850513          	addi	a0,a0,8
    800017f8:	00002097          	auipc	ra,0x2
    800017fc:	e34080e7          	jalr	-460(ra) # 8000362c <_ZN10ThreadList11removeFirstEv>
        status = READY;
    80001800:	04052423          	sw	zero,72(a0)
    tcb->setReady();
    Scheduler::put(tcb);
    80001804:	00001097          	auipc	ra,0x1
    80001808:	b40080e7          	jalr	-1216(ra) # 80002344 <_ZN9Scheduler3putEP3TCB>
}
    8000180c:	00813083          	ld	ra,8(sp)
    80001810:	00013403          	ld	s0,0(sp)
    80001814:	01010113          	addi	sp,sp,16
    80001818:	00008067          	ret

000000008000181c <_ZN15KernelSemaphore4waitEv>:

void KernelSemaphore::wait() {
    8000181c:	fe010113          	addi	sp,sp,-32
    80001820:	00113c23          	sd	ra,24(sp)
    80001824:	00813823          	sd	s0,16(sp)
    80001828:	02010413          	addi	s0,sp,32
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    8000182c:	100027f3          	csrr	a5,sstatus
    80001830:	fef43023          	sd	a5,-32(s0)
    return sstatus;
    80001834:	fe043783          	ld	a5,-32(s0)
    lock()
    80001838:	fef43423          	sd	a5,-24(s0)
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    8000183c:	00200793          	li	a5,2
    80001840:	1007b073          	csrc	sstatus,a5
    if (--val < 0) block();
    80001844:	00052783          	lw	a5,0(a0)
    80001848:	fff7879b          	addiw	a5,a5,-1
    8000184c:	00f52023          	sw	a5,0(a0)
    80001850:	02079713          	slli	a4,a5,0x20
    80001854:	00074e63          	bltz	a4,80001870 <_ZN15KernelSemaphore4waitEv+0x54>
    unlock()
    80001858:	fe843783          	ld	a5,-24(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    8000185c:	10079073          	csrw	sstatus,a5
}
    80001860:	01813083          	ld	ra,24(sp)
    80001864:	01013403          	ld	s0,16(sp)
    80001868:	02010113          	addi	sp,sp,32
    8000186c:	00008067          	ret
    if (--val < 0) block();
    80001870:	00000097          	auipc	ra,0x0
    80001874:	f10080e7          	jalr	-240(ra) # 80001780 <_ZN15KernelSemaphore5blockEv>
    80001878:	fe1ff06f          	j	80001858 <_ZN15KernelSemaphore4waitEv+0x3c>

000000008000187c <_ZN15KernelSemaphore6signalEv>:

void KernelSemaphore::signal() {
    8000187c:	fe010113          	addi	sp,sp,-32
    80001880:	00113c23          	sd	ra,24(sp)
    80001884:	00813823          	sd	s0,16(sp)
    80001888:	02010413          	addi	s0,sp,32
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    8000188c:	100027f3          	csrr	a5,sstatus
    80001890:	fef43023          	sd	a5,-32(s0)
    return sstatus;
    80001894:	fe043783          	ld	a5,-32(s0)
    lock()
    80001898:	fef43423          	sd	a5,-24(s0)
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    8000189c:	00200793          	li	a5,2
    800018a0:	1007b073          	csrc	sstatus,a5
    if (val++ < 0) deblock();
    800018a4:	00052783          	lw	a5,0(a0)
    800018a8:	0017871b          	addiw	a4,a5,1
    800018ac:	00e52023          	sw	a4,0(a0)
    800018b0:	0007ce63          	bltz	a5,800018cc <_ZN15KernelSemaphore6signalEv+0x50>
    unlock()
    800018b4:	fe843783          	ld	a5,-24(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    800018b8:	10079073          	csrw	sstatus,a5
}
    800018bc:	01813083          	ld	ra,24(sp)
    800018c0:	01013403          	ld	s0,16(sp)
    800018c4:	02010113          	addi	sp,sp,32
    800018c8:	00008067          	ret
    if (val++ < 0) deblock();
    800018cc:	00000097          	auipc	ra,0x0
    800018d0:	f0c080e7          	jalr	-244(ra) # 800017d8 <_ZN15KernelSemaphore7deblockEv>
    800018d4:	fe1ff06f          	j	800018b4 <_ZN15KernelSemaphore6signalEv+0x38>

00000000800018d8 <_ZN15KernelSemaphoreD1Ev>:

KernelSemaphore::~KernelSemaphore() {
    800018d8:	fd010113          	addi	sp,sp,-48
    800018dc:	02113423          	sd	ra,40(sp)
    800018e0:	02813023          	sd	s0,32(sp)
    800018e4:	00913c23          	sd	s1,24(sp)
    800018e8:	03010413          	addi	s0,sp,48
    800018ec:	00050493          	mv	s1,a0
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    800018f0:	100027f3          	csrr	a5,sstatus
    800018f4:	fcf43c23          	sd	a5,-40(s0)
    return sstatus;
    800018f8:	fd843783          	ld	a5,-40(s0)
    lock()
    800018fc:	fcf43823          	sd	a5,-48(s0)
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80001900:	00200793          	li	a5,2
    80001904:	1007b073          	csrc	sstatus,a5
    80001908:	0204a783          	lw	a5,32(s1)
    while (!blockedThreadQueue.isEmpty())
    8000190c:	00078a63          	beqz	a5,80001920 <_ZN15KernelSemaphoreD1Ev+0x48>
        deblock();
    80001910:	00048513          	mv	a0,s1
    80001914:	00000097          	auipc	ra,0x0
    80001918:	ec4080e7          	jalr	-316(ra) # 800017d8 <_ZN15KernelSemaphore7deblockEv>
    while (!blockedThreadQueue.isEmpty())
    8000191c:	fedff06f          	j	80001908 <_ZN15KernelSemaphoreD1Ev+0x30>
    unlock()
    80001920:	fd043783          	ld	a5,-48(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80001924:	10079073          	csrw	sstatus,a5
    val = 0;
    80001928:	0004a023          	sw	zero,0(s1)
KernelSemaphore::~KernelSemaphore() {
    8000192c:	00848513          	addi	a0,s1,8
    80001930:	00002097          	auipc	ra,0x2
    80001934:	ea0080e7          	jalr	-352(ra) # 800037d0 <_ZN10ThreadListD1Ev>
}
    80001938:	02813083          	ld	ra,40(sp)
    8000193c:	02013403          	ld	s0,32(sp)
    80001940:	01813483          	ld	s1,24(sp)
    80001944:	03010113          	addi	sp,sp,48
    80001948:	00008067          	ret

000000008000194c <_ZZ4mainENUlPvE_4_FUNES_>:
    kprintString("Starting main\n");
    TCB *main = TCB::createKernelThread();
    kprintString("Created main thread\n");
    TCB::running = main;

    TCB *uMain = TCB::createUserThread([](void *){userMain();}, nullptr);
    8000194c:	ff010113          	addi	sp,sp,-16
    80001950:	00113423          	sd	ra,8(sp)
    80001954:	00813023          	sd	s0,0(sp)
    80001958:	01010413          	addi	s0,sp,16
    8000195c:	00004097          	auipc	ra,0x4
    80001960:	844080e7          	jalr	-1980(ra) # 800051a0 <_Z8userMainv>
    80001964:	00813083          	ld	ra,8(sp)
    80001968:	00013403          	ld	s0,0(sp)
    8000196c:	01010113          	addi	sp,sp,16
    80001970:	00008067          	ret

0000000080001974 <main>:
int main() {
    80001974:	fe010113          	addi	sp,sp,-32
    80001978:	00113c23          	sd	ra,24(sp)
    8000197c:	00813823          	sd	s0,16(sp)
    80001980:	00913423          	sd	s1,8(sp)
    80001984:	01213023          	sd	s2,0(sp)
    80001988:	02010413          	addi	s0,sp,32
    kprintString("Starting main\n");
    8000198c:	00006517          	auipc	a0,0x6
    80001990:	7bc50513          	addi	a0,a0,1980 # 80008148 <CONSOLE_STATUS+0x138>
    80001994:	00001097          	auipc	ra,0x1
    80001998:	ed8080e7          	jalr	-296(ra) # 8000286c <_Z12kprintStringPKc>
        return kmalloc(size);
    8000199c:	00300513          	li	a0,3
    800019a0:	00000097          	auipc	ra,0x0
    800019a4:	328080e7          	jalr	808(ra) # 80001cc8 <_Z7kmallocm>
    800019a8:	00050493          	mv	s1,a0
    800019ac:	00001097          	auipc	ra,0x1
    800019b0:	2a8080e7          	jalr	680(ra) # 80002c54 <_ZN3TCBC1Ev>
    kprintString("Created main thread\n");
    800019b4:	00006517          	auipc	a0,0x6
    800019b8:	7a450513          	addi	a0,a0,1956 # 80008158 <CONSOLE_STATUS+0x148>
    800019bc:	00001097          	auipc	ra,0x1
    800019c0:	eb0080e7          	jalr	-336(ra) # 8000286c <_Z12kprintStringPKc>
    TCB::running = main;
    800019c4:	00008797          	auipc	a5,0x8
    800019c8:	51c7b783          	ld	a5,1308(a5) # 80009ee0 <_GLOBAL_OFFSET_TABLE_+0x28>
    800019cc:	0097b023          	sd	s1,0(a5)
    TCB *uMain = TCB::createUserThread([](void *){userMain();}, nullptr);
    800019d0:	00000593          	li	a1,0
    800019d4:	00000517          	auipc	a0,0x0
    800019d8:	f7850513          	addi	a0,a0,-136 # 8000194c <_ZZ4mainENUlPvE_4_FUNES_>
    800019dc:	00001097          	auipc	ra,0x1
    800019e0:	5d8080e7          	jalr	1496(ra) # 80002fb4 <_ZN3TCB16createUserThreadEPFvPvES0_>
    800019e4:	00050493          	mv	s1,a0
    kprintString("Created user main thread\n");
    800019e8:	00006517          	auipc	a0,0x6
    800019ec:	78850513          	addi	a0,a0,1928 # 80008170 <CONSOLE_STATUS+0x160>
    800019f0:	00001097          	auipc	ra,0x1
    800019f4:	e7c080e7          	jalr	-388(ra) # 8000286c <_Z12kprintStringPKc>

    Riscv::w_stvec((uint64) &Riscv::supervisorTrap);
    800019f8:	00008797          	auipc	a5,0x8
    800019fc:	4d07b783          	ld	a5,1232(a5) # 80009ec8 <_GLOBAL_OFFSET_TABLE_+0x10>
    __asm__ volatile ("csrw stvec, %[stvec]" : : [stvec] "r"(stvec));
    80001a00:	10579073          	csrw	stvec,a5

    uMain->join();
    80001a04:	00048513          	mv	a0,s1
    80001a08:	00001097          	auipc	ra,0x1
    80001a0c:	760080e7          	jalr	1888(ra) # 80003168 <_ZN3TCB4joinEv>
        __asm__ volatile ("ecall");
    80001a10:	00000073          	ecall
    TCB::yield();

    delete ThreadCollector::getInstance();
    80001a14:	00002097          	auipc	ra,0x2
    80001a18:	9c0080e7          	jalr	-1600(ra) # 800033d4 <_ZN15ThreadCollector11getInstanceEv>
    80001a1c:	00050493          	mv	s1,a0
    80001a20:	00050c63          	beqz	a0,80001a38 <main+0xc4>
    80001a24:	00002097          	auipc	ra,0x2
    80001a28:	904080e7          	jalr	-1788(ra) # 80003328 <_ZN15ThreadCollectorD1Ev>
        kfree(addr);
    80001a2c:	00048513          	mv	a0,s1
    80001a30:	00000097          	auipc	ra,0x0
    80001a34:	494080e7          	jalr	1172(ra) # 80001ec4 <_Z5kfreePv>
    delete IdleThread::getInstance();
    80001a38:	fffff097          	auipc	ra,0xfffff
    80001a3c:	7b8080e7          	jalr	1976(ra) # 800011f0 <_ZN10IdleThread11getInstanceEv>
    80001a40:	00050493          	mv	s1,a0
    80001a44:	00050c63          	beqz	a0,80001a5c <main+0xe8>
    80001a48:	00000097          	auipc	ra,0x0
    80001a4c:	864080e7          	jalr	-1948(ra) # 800012ac <_ZN10IdleThreadD1Ev>
    80001a50:	00048513          	mv	a0,s1
    80001a54:	00000097          	auipc	ra,0x0
    80001a58:	470080e7          	jalr	1136(ra) # 80001ec4 <_Z5kfreePv>
    delete TimerInterrupt::getInstance();
    80001a5c:	00002097          	auipc	ra,0x2
    80001a60:	d8c080e7          	jalr	-628(ra) # 800037e8 <_ZN14TimerInterrupt11getInstanceEv>
    80001a64:	00050493          	mv	s1,a0
    80001a68:	00050c63          	beqz	a0,80001a80 <main+0x10c>
    80001a6c:	00002097          	auipc	ra,0x2
    80001a70:	fc8080e7          	jalr	-56(ra) # 80003a34 <_ZN14TimerInterruptD1Ev>
    80001a74:	00048513          	mv	a0,s1
    80001a78:	00000097          	auipc	ra,0x0
    80001a7c:	44c080e7          	jalr	1100(ra) # 80001ec4 <_Z5kfreePv>
    delete Scheduler::getInstance();
    80001a80:	00000097          	auipc	ra,0x0
    80001a84:	7d8080e7          	jalr	2008(ra) # 80002258 <_ZN9Scheduler11getInstanceEv>
    80001a88:	00050493          	mv	s1,a0
    80001a8c:	00050c63          	beqz	a0,80001aa4 <main+0x130>
    80001a90:	00001097          	auipc	ra,0x1
    80001a94:	920080e7          	jalr	-1760(ra) # 800023b0 <_ZN9SchedulerD1Ev>
    80001a98:	00048513          	mv	a0,s1
    80001a9c:	00000097          	auipc	ra,0x0
    80001aa0:	428080e7          	jalr	1064(ra) # 80001ec4 <_Z5kfreePv>

    kprintString("Main finished\n");
    80001aa4:	00006517          	auipc	a0,0x6
    80001aa8:	6ec50513          	addi	a0,a0,1772 # 80008190 <CONSOLE_STATUS+0x180>
    80001aac:	00001097          	auipc	ra,0x1
    80001ab0:	dc0080e7          	jalr	-576(ra) # 8000286c <_Z12kprintStringPKc>

    return 0;
}
    80001ab4:	00000513          	li	a0,0
    80001ab8:	01813083          	ld	ra,24(sp)
    80001abc:	01013403          	ld	s0,16(sp)
    80001ac0:	00813483          	ld	s1,8(sp)
    80001ac4:	00013903          	ld	s2,0(sp)
    80001ac8:	02010113          	addi	sp,sp,32
    80001acc:	00008067          	ret
    80001ad0:	00050913          	mv	s2,a0
    80001ad4:	00048513          	mv	a0,s1
    80001ad8:	00000097          	auipc	ra,0x0
    80001adc:	3ec080e7          	jalr	1004(ra) # 80001ec4 <_Z5kfreePv>
    80001ae0:	00090513          	mv	a0,s2
    80001ae4:	00009097          	auipc	ra,0x9
    80001ae8:	574080e7          	jalr	1396(ra) # 8000b058 <_Unwind_Resume>

0000000080001aec <_ZN15MemoryAllocator19initMemoryAllocatorEv>:

int kfree(void *addr) {
    return MemoryAllocator::getInstance()->free(addr);
}

void MemoryAllocator::initMemoryAllocator() {
    80001aec:	ff010113          	addi	sp,sp,-16
    80001af0:	00813423          	sd	s0,8(sp)
    80001af4:	01010413          	addi	s0,sp,16
    instance = (MemoryAllocator *) HEAP_START_ADDR;
    80001af8:	00008697          	auipc	a3,0x8
    80001afc:	3c86b683          	ld	a3,968(a3) # 80009ec0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001b00:	0006b783          	ld	a5,0(a3)
    80001b04:	00008717          	auipc	a4,0x8
    80001b08:	43470713          	addi	a4,a4,1076 # 80009f38 <_ZN15MemoryAllocator8instanceE>
    80001b0c:	00f73023          	sd	a5,0(a4)

    instance->mutex = (Mutex *) ((uint8 *) HEAP_START_ADDR + sizeof(MemoryAllocator));
    80001b10:	01078613          	addi	a2,a5,16
    80001b14:	00c7b423          	sd	a2,8(a5)
    instance->mutex->holder = nullptr;
    80001b18:	0207bc23          	sd	zero,56(a5)
    instance->freeMemHead = (BlockHeader *) ((uint8 *) HEAP_START_ADDR + sizeof(MemoryAllocator) + sizeof(Mutex));
    80001b1c:	04078613          	addi	a2,a5,64
    80001b20:	00c7b023          	sd	a2,0(a5)
    instance->freeMemHead->size = (size_t) ((uint8 *) HEAP_END_ADDR - (uint8 *) HEAP_START_ADDR -
    80001b24:	00008797          	auipc	a5,0x8
    80001b28:	3c47b783          	ld	a5,964(a5) # 80009ee8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001b2c:	0007b783          	ld	a5,0(a5)
    80001b30:	0006b683          	ld	a3,0(a3)
    80001b34:	40d787b3          	sub	a5,a5,a3
    80001b38:	00073683          	ld	a3,0(a4)
    80001b3c:	0006b683          	ld	a3,0(a3)
                                  sizeof(MemoryAllocator) - sizeof(BlockHeader) - sizeof(Mutex));
    80001b40:	fa878793          	addi	a5,a5,-88
    instance->freeMemHead->size = (size_t) ((uint8 *) HEAP_END_ADDR - (uint8 *) HEAP_START_ADDR -
    80001b44:	00f6b023          	sd	a5,0(a3)
    instance->freeMemHead->free = true;
    80001b48:	00073783          	ld	a5,0(a4)
    80001b4c:	0007b703          	ld	a4,0(a5)
    80001b50:	00100693          	li	a3,1
    80001b54:	00d70423          	sb	a3,8(a4)
    instance->freeMemHead->next = nullptr;
    80001b58:	0007b783          	ld	a5,0(a5)
    80001b5c:	0007b823          	sd	zero,16(a5)
}
    80001b60:	00813403          	ld	s0,8(sp)
    80001b64:	01010113          	addi	sp,sp,16
    80001b68:	00008067          	ret

0000000080001b6c <_ZN15MemoryAllocator11getInstanceEv>:

MemoryAllocator *MemoryAllocator::getInstance() {
    if (!instance) initMemoryAllocator();
    80001b6c:	00008797          	auipc	a5,0x8
    80001b70:	3cc7b783          	ld	a5,972(a5) # 80009f38 <_ZN15MemoryAllocator8instanceE>
    80001b74:	00078863          	beqz	a5,80001b84 <_ZN15MemoryAllocator11getInstanceEv+0x18>

    return instance;
}
    80001b78:	00008517          	auipc	a0,0x8
    80001b7c:	3c053503          	ld	a0,960(a0) # 80009f38 <_ZN15MemoryAllocator8instanceE>
    80001b80:	00008067          	ret
MemoryAllocator *MemoryAllocator::getInstance() {
    80001b84:	ff010113          	addi	sp,sp,-16
    80001b88:	00113423          	sd	ra,8(sp)
    80001b8c:	00813023          	sd	s0,0(sp)
    80001b90:	01010413          	addi	s0,sp,16
    if (!instance) initMemoryAllocator();
    80001b94:	00000097          	auipc	ra,0x0
    80001b98:	f58080e7          	jalr	-168(ra) # 80001aec <_ZN15MemoryAllocator19initMemoryAllocatorEv>
}
    80001b9c:	00008517          	auipc	a0,0x8
    80001ba0:	39c53503          	ld	a0,924(a0) # 80009f38 <_ZN15MemoryAllocator8instanceE>
    80001ba4:	00813083          	ld	ra,8(sp)
    80001ba8:	00013403          	ld	s0,0(sp)
    80001bac:	01010113          	addi	sp,sp,16
    80001bb0:	00008067          	ret

0000000080001bb4 <_ZN15MemoryAllocator6mallocEm>:

void *MemoryAllocator::malloc(size_t size) {
    80001bb4:	fd010113          	addi	sp,sp,-48
    80001bb8:	02113423          	sd	ra,40(sp)
    80001bbc:	02813023          	sd	s0,32(sp)
    80001bc0:	00913c23          	sd	s1,24(sp)
    80001bc4:	01213823          	sd	s2,16(sp)
    80001bc8:	01313423          	sd	s3,8(sp)
    80001bcc:	03010413          	addi	s0,sp,48
    // Initial check
    if (!size) return 0;
    80001bd0:	0e058863          	beqz	a1,80001cc0 <_ZN15MemoryAllocator6mallocEm+0x10c>
    80001bd4:	00050993          	mv	s3,a0

    // Rounding and aligning size to size of memory blocks
    size *= MEM_BLOCK_SIZE;
    80001bd8:	00659913          	slli	s2,a1,0x6

    mutex->wait();
    80001bdc:	00853503          	ld	a0,8(a0)
    80001be0:	00000097          	auipc	ra,0x0
    80001be4:	324080e7          	jalr	804(ra) # 80001f04 <_ZN5Mutex4waitEv>
    // Finding suitable free memory block using first fit algorithm
    BlockHeader *curr = freeMemHead, *prev = nullptr;
    80001be8:	0009b483          	ld	s1,0(s3)
    80001bec:	00000713          	li	a4,0
    int i = 0;
    while (curr && curr->size < size)
    80001bf0:	00048c63          	beqz	s1,80001c08 <_ZN15MemoryAllocator6mallocEm+0x54>
    80001bf4:	0004b783          	ld	a5,0(s1)
    80001bf8:	0127f863          	bgeu	a5,s2,80001c08 <_ZN15MemoryAllocator6mallocEm+0x54>
        prev = curr, curr = curr->next, i++;
    80001bfc:	00048713          	mv	a4,s1
    80001c00:	0104b483          	ld	s1,16(s1)
    while (curr && curr->size < size)
    80001c04:	fedff06f          	j	80001bf0 <_ZN15MemoryAllocator6mallocEm+0x3c>
    if (!curr)  {
    80001c08:	04048463          	beqz	s1,80001c50 <_ZN15MemoryAllocator6mallocEm+0x9c>
        mutex->signal();
        return nullptr;
    }

    size_t remainingSize = curr->size - size;
    80001c0c:	0004b783          	ld	a5,0(s1)
    80001c10:	412787b3          	sub	a5,a5,s2
    curr->size = size;
    80001c14:	0124b023          	sd	s2,0(s1)
    curr->free = false;
    80001c18:	00048423          	sb	zero,8(s1)

    // Allocating new free memory block if enough size is left over
    if (remainingSize >= MEM_BLOCK_SIZE + sizeof(BlockHeader)) {
    80001c1c:	05700693          	li	a3,87
    80001c20:	04f6f463          	bgeu	a3,a5,80001c68 <_ZN15MemoryAllocator6mallocEm+0xb4>
        BlockHeader *elem = (BlockHeader *) ((uint8 *) curr + sizeof(BlockHeader) + size);
    80001c24:	01890913          	addi	s2,s2,24
    80001c28:	01248933          	add	s2,s1,s2
        elem->size = remainingSize - sizeof(BlockHeader);
    80001c2c:	fe878793          	addi	a5,a5,-24
    80001c30:	00f93023          	sd	a5,0(s2)
        elem->free = true;
    80001c34:	00100793          	li	a5,1
    80001c38:	00f90423          	sb	a5,8(s2)
        elem->next = curr->next;
    80001c3c:	0104b783          	ld	a5,16(s1)
    80001c40:	00f93823          	sd	a5,16(s2)
        (!prev ? freeMemHead : prev->next) = elem;
    80001c44:	00070e63          	beqz	a4,80001c60 <_ZN15MemoryAllocator6mallocEm+0xac>
    80001c48:	01273823          	sd	s2,16(a4)
    80001c4c:	0340006f          	j	80001c80 <_ZN15MemoryAllocator6mallocEm+0xcc>
        mutex->signal();
    80001c50:	0089b503          	ld	a0,8(s3)
    80001c54:	00000097          	auipc	ra,0x0
    80001c58:	330080e7          	jalr	816(ra) # 80001f84 <_ZN5Mutex6signalEv>
        return nullptr;
    80001c5c:	0380006f          	j	80001c94 <_ZN15MemoryAllocator6mallocEm+0xe0>
        (!prev ? freeMemHead : prev->next) = elem;
    80001c60:	0129b023          	sd	s2,0(s3)
    80001c64:	01c0006f          	j	80001c80 <_ZN15MemoryAllocator6mallocEm+0xcc>
    } else {
        // Removing whole free memory block from free memory list
        (!prev ? freeMemHead : prev->next) = curr->next;
    80001c68:	04070663          	beqz	a4,80001cb4 <_ZN15MemoryAllocator6mallocEm+0x100>
    80001c6c:	0104b683          	ld	a3,16(s1)
    80001c70:	00d73823          	sd	a3,16(a4)
        curr->size += remainingSize;
    80001c74:	0004b703          	ld	a4,0(s1)
    80001c78:	00f707b3          	add	a5,a4,a5
    80001c7c:	00f4b023          	sd	a5,0(s1)
    }
    curr->next = nullptr;
    80001c80:	0004b823          	sd	zero,16(s1)

    // Free memory start address after segment descriptor of allocated memory block
    void *addr = (uint8 *) curr + sizeof(BlockHeader);
    80001c84:	01848493          	addi	s1,s1,24

    mutex->signal();
    80001c88:	0089b503          	ld	a0,8(s3)
    80001c8c:	00000097          	auipc	ra,0x0
    80001c90:	2f8080e7          	jalr	760(ra) # 80001f84 <_ZN5Mutex6signalEv>

    return addr;
}
    80001c94:	00048513          	mv	a0,s1
    80001c98:	02813083          	ld	ra,40(sp)
    80001c9c:	02013403          	ld	s0,32(sp)
    80001ca0:	01813483          	ld	s1,24(sp)
    80001ca4:	01013903          	ld	s2,16(sp)
    80001ca8:	00813983          	ld	s3,8(sp)
    80001cac:	03010113          	addi	sp,sp,48
    80001cb0:	00008067          	ret
        (!prev ? freeMemHead : prev->next) = curr->next;
    80001cb4:	0104b703          	ld	a4,16(s1)
    80001cb8:	00e9b023          	sd	a4,0(s3)
    80001cbc:	fb9ff06f          	j	80001c74 <_ZN15MemoryAllocator6mallocEm+0xc0>
    if (!size) return 0;
    80001cc0:	00000493          	li	s1,0
    80001cc4:	fd1ff06f          	j	80001c94 <_ZN15MemoryAllocator6mallocEm+0xe0>

0000000080001cc8 <_Z7kmallocm>:
void *kmalloc(size_t size) {
    80001cc8:	fe010113          	addi	sp,sp,-32
    80001ccc:	00113c23          	sd	ra,24(sp)
    80001cd0:	00813823          	sd	s0,16(sp)
    80001cd4:	00913423          	sd	s1,8(sp)
    80001cd8:	02010413          	addi	s0,sp,32
    80001cdc:	00050493          	mv	s1,a0
    return MemoryAllocator::getInstance()->malloc(size);
    80001ce0:	00000097          	auipc	ra,0x0
    80001ce4:	e8c080e7          	jalr	-372(ra) # 80001b6c <_ZN15MemoryAllocator11getInstanceEv>
    80001ce8:	00048593          	mv	a1,s1
    80001cec:	00000097          	auipc	ra,0x0
    80001cf0:	ec8080e7          	jalr	-312(ra) # 80001bb4 <_ZN15MemoryAllocator6mallocEm>
}
    80001cf4:	01813083          	ld	ra,24(sp)
    80001cf8:	01013403          	ld	s0,16(sp)
    80001cfc:	00813483          	ld	s1,8(sp)
    80001d00:	02010113          	addi	sp,sp,32
    80001d04:	00008067          	ret

0000000080001d08 <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE>:
    mutex->signal();

    return 0;
}

int MemoryAllocator::tryToJoin(MemoryAllocator::BlockHeader *curr) {
    80001d08:	ff010113          	addi	sp,sp,-16
    80001d0c:	00813423          	sd	s0,8(sp)
    80001d10:	01010413          	addi	s0,sp,16
    if (!curr || !curr->next) return -1;
    80001d14:	04050263          	beqz	a0,80001d58 <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE+0x50>
    80001d18:	01053703          	ld	a4,16(a0)
    80001d1c:	04070263          	beqz	a4,80001d60 <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE+0x58>

    if ((uint8 *) curr + sizeof(BlockHeader) + curr->size != (uint8 *) curr->next) return -2;
    80001d20:	00053783          	ld	a5,0(a0)
    80001d24:	01878693          	addi	a3,a5,24
    80001d28:	00d506b3          	add	a3,a0,a3
    80001d2c:	02d71e63          	bne	a4,a3,80001d68 <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE+0x60>

    curr->size += curr->next->size + sizeof(BlockHeader);
    80001d30:	00073683          	ld	a3,0(a4)
    80001d34:	00d787b3          	add	a5,a5,a3
    80001d38:	01878793          	addi	a5,a5,24
    80001d3c:	00f53023          	sd	a5,0(a0)
    curr->next = curr->next->next;
    80001d40:	01073783          	ld	a5,16(a4)
    80001d44:	00f53823          	sd	a5,16(a0)

    return 0;
    80001d48:	00000513          	li	a0,0
}
    80001d4c:	00813403          	ld	s0,8(sp)
    80001d50:	01010113          	addi	sp,sp,16
    80001d54:	00008067          	ret
    if (!curr || !curr->next) return -1;
    80001d58:	fff00513          	li	a0,-1
    80001d5c:	ff1ff06f          	j	80001d4c <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE+0x44>
    80001d60:	fff00513          	li	a0,-1
    80001d64:	fe9ff06f          	j	80001d4c <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE+0x44>
    if ((uint8 *) curr + sizeof(BlockHeader) + curr->size != (uint8 *) curr->next) return -2;
    80001d68:	ffe00513          	li	a0,-2
    80001d6c:	fe1ff06f          	j	80001d4c <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE+0x44>

0000000080001d70 <_ZN15MemoryAllocator4freeEPv>:
    if (!addr
    80001d70:	10058a63          	beqz	a1,80001e84 <_ZN15MemoryAllocator4freeEPv+0x114>
int MemoryAllocator::free(void *addr) {
    80001d74:	fd010113          	addi	sp,sp,-48
    80001d78:	02113423          	sd	ra,40(sp)
    80001d7c:	02813023          	sd	s0,32(sp)
    80001d80:	00913c23          	sd	s1,24(sp)
    80001d84:	01213823          	sd	s2,16(sp)
    80001d88:	01313423          	sd	s3,8(sp)
    80001d8c:	01413023          	sd	s4,0(sp)
    80001d90:	03010413          	addi	s0,sp,48
    80001d94:	00050a13          	mv	s4,a0
    80001d98:	00058913          	mv	s2,a1
        || (uint8 *) addr < (uint8 *) HEAP_START_ADDR + sizeof(MemoryAllocator) + sizeof(BlockHeader) + sizeof(Mutex)
    80001d9c:	00008797          	auipc	a5,0x8
    80001da0:	1247b783          	ld	a5,292(a5) # 80009ec0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001da4:	0007b783          	ld	a5,0(a5)
    80001da8:	05878793          	addi	a5,a5,88
    80001dac:	0ef5e063          	bltu	a1,a5,80001e8c <_ZN15MemoryAllocator4freeEPv+0x11c>
        || addr >= HEAP_END_ADDR) {
    80001db0:	00008797          	auipc	a5,0x8
    80001db4:	1387b783          	ld	a5,312(a5) # 80009ee8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001db8:	0007b783          	ld	a5,0(a5)
    80001dbc:	0cf5fc63          	bgeu	a1,a5,80001e94 <_ZN15MemoryAllocator4freeEPv+0x124>
    BlockHeader *elem = (BlockHeader *) ((uint8 *) addr - sizeof(BlockHeader));
    80001dc0:	fe858993          	addi	s3,a1,-24
    if (!elem || elem->free || elem->next) {
    80001dc4:	0c098c63          	beqz	s3,80001e9c <_ZN15MemoryAllocator4freeEPv+0x12c>
    80001dc8:	ff05c783          	lbu	a5,-16(a1)
    80001dcc:	0c079c63          	bnez	a5,80001ea4 <_ZN15MemoryAllocator4freeEPv+0x134>
    80001dd0:	ff85b483          	ld	s1,-8(a1)
    80001dd4:	0c049c63          	bnez	s1,80001eac <_ZN15MemoryAllocator4freeEPv+0x13c>
    mutex->wait();
    80001dd8:	00853503          	ld	a0,8(a0)
    80001ddc:	00000097          	auipc	ra,0x0
    80001de0:	128080e7          	jalr	296(ra) # 80001f04 <_ZN5Mutex4waitEv>
    BlockHeader *curr = freeMemHead, *prev = nullptr;
    80001de4:	000a3783          	ld	a5,0(s4)
    while (curr && curr < elem)
    80001de8:	00078a63          	beqz	a5,80001dfc <_ZN15MemoryAllocator4freeEPv+0x8c>
    80001dec:	0137f863          	bgeu	a5,s3,80001dfc <_ZN15MemoryAllocator4freeEPv+0x8c>
        prev = curr, curr = curr->next;
    80001df0:	00078493          	mv	s1,a5
    80001df4:	0107b783          	ld	a5,16(a5)
    while (curr && curr < elem)
    80001df8:	ff1ff06f          	j	80001de8 <_ZN15MemoryAllocator4freeEPv+0x78>
    if ((prev && (uint8 *) prev + prev->size + sizeof(BlockHeader) > addr)
    80001dfc:	00048a63          	beqz	s1,80001e10 <_ZN15MemoryAllocator4freeEPv+0xa0>
    80001e00:	0004b703          	ld	a4,0(s1)
    80001e04:	01870713          	addi	a4,a4,24
    80001e08:	00e48733          	add	a4,s1,a4
    80001e0c:	0ae96463          	bltu	s2,a4,80001eb4 <_ZN15MemoryAllocator4freeEPv+0x144>
        || (curr && (uint8 *) addr + elem->size  > (uint8 *) curr)) {
    80001e10:	00078863          	beqz	a5,80001e20 <_ZN15MemoryAllocator4freeEPv+0xb0>
    80001e14:	fe893703          	ld	a4,-24(s2)
    80001e18:	00e90733          	add	a4,s2,a4
    80001e1c:	0ae7e063          	bltu	a5,a4,80001ebc <_ZN15MemoryAllocator4freeEPv+0x14c>
    elem->next = curr;
    80001e20:	fef93c23          	sd	a5,-8(s2)
    elem->free = true;
    80001e24:	00100793          	li	a5,1
    80001e28:	fef90823          	sb	a5,-16(s2)
    (!prev ? freeMemHead : prev->next) = elem;
    80001e2c:	04048863          	beqz	s1,80001e7c <_ZN15MemoryAllocator4freeEPv+0x10c>
    80001e30:	0134b823          	sd	s3,16(s1)
    tryToJoin(elem);
    80001e34:	00098513          	mv	a0,s3
    80001e38:	00000097          	auipc	ra,0x0
    80001e3c:	ed0080e7          	jalr	-304(ra) # 80001d08 <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE>
    tryToJoin(prev);
    80001e40:	00048513          	mv	a0,s1
    80001e44:	00000097          	auipc	ra,0x0
    80001e48:	ec4080e7          	jalr	-316(ra) # 80001d08 <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE>
    mutex->signal();
    80001e4c:	008a3503          	ld	a0,8(s4)
    80001e50:	00000097          	auipc	ra,0x0
    80001e54:	134080e7          	jalr	308(ra) # 80001f84 <_ZN5Mutex6signalEv>
    return 0;
    80001e58:	00000513          	li	a0,0
}
    80001e5c:	02813083          	ld	ra,40(sp)
    80001e60:	02013403          	ld	s0,32(sp)
    80001e64:	01813483          	ld	s1,24(sp)
    80001e68:	01013903          	ld	s2,16(sp)
    80001e6c:	00813983          	ld	s3,8(sp)
    80001e70:	00013a03          	ld	s4,0(sp)
    80001e74:	03010113          	addi	sp,sp,48
    80001e78:	00008067          	ret
    (!prev ? freeMemHead : prev->next) = elem;
    80001e7c:	013a3023          	sd	s3,0(s4)
    80001e80:	fb5ff06f          	j	80001e34 <_ZN15MemoryAllocator4freeEPv+0xc4>
        return -1;
    80001e84:	fff00513          	li	a0,-1
}
    80001e88:	00008067          	ret
        return -1;
    80001e8c:	fff00513          	li	a0,-1
    80001e90:	fcdff06f          	j	80001e5c <_ZN15MemoryAllocator4freeEPv+0xec>
    80001e94:	fff00513          	li	a0,-1
    80001e98:	fc5ff06f          	j	80001e5c <_ZN15MemoryAllocator4freeEPv+0xec>
        return -2;
    80001e9c:	ffe00513          	li	a0,-2
    80001ea0:	fbdff06f          	j	80001e5c <_ZN15MemoryAllocator4freeEPv+0xec>
    80001ea4:	ffe00513          	li	a0,-2
    80001ea8:	fb5ff06f          	j	80001e5c <_ZN15MemoryAllocator4freeEPv+0xec>
    80001eac:	ffe00513          	li	a0,-2
    80001eb0:	fadff06f          	j	80001e5c <_ZN15MemoryAllocator4freeEPv+0xec>
        return -2;
    80001eb4:	ffe00513          	li	a0,-2
    80001eb8:	fa5ff06f          	j	80001e5c <_ZN15MemoryAllocator4freeEPv+0xec>
    80001ebc:	ffe00513          	li	a0,-2
    80001ec0:	f9dff06f          	j	80001e5c <_ZN15MemoryAllocator4freeEPv+0xec>

0000000080001ec4 <_Z5kfreePv>:
int kfree(void *addr) {
    80001ec4:	fe010113          	addi	sp,sp,-32
    80001ec8:	00113c23          	sd	ra,24(sp)
    80001ecc:	00813823          	sd	s0,16(sp)
    80001ed0:	00913423          	sd	s1,8(sp)
    80001ed4:	02010413          	addi	s0,sp,32
    80001ed8:	00050493          	mv	s1,a0
    return MemoryAllocator::getInstance()->free(addr);
    80001edc:	00000097          	auipc	ra,0x0
    80001ee0:	c90080e7          	jalr	-880(ra) # 80001b6c <_ZN15MemoryAllocator11getInstanceEv>
    80001ee4:	00048593          	mv	a1,s1
    80001ee8:	00000097          	auipc	ra,0x0
    80001eec:	e88080e7          	jalr	-376(ra) # 80001d70 <_ZN15MemoryAllocator4freeEPv>
}
    80001ef0:	01813083          	ld	ra,24(sp)
    80001ef4:	01013403          	ld	s0,16(sp)
    80001ef8:	00813483          	ld	s1,8(sp)
    80001efc:	02010113          	addi	sp,sp,32
    80001f00:	00008067          	ret

0000000080001f04 <_ZN5Mutex4waitEv>:
#include "../h/Mutex.h"
#include "../h/TCB.h"
#include "../h/Riscv.h"

void Mutex::wait() {
    if (holder == TCB::running) return;
    80001f04:	02853703          	ld	a4,40(a0)
    80001f08:	00008797          	auipc	a5,0x8
    80001f0c:	fd87b783          	ld	a5,-40(a5) # 80009ee0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001f10:	0007b783          	ld	a5,0(a5)
    80001f14:	06f70663          	beq	a4,a5,80001f80 <_ZN5Mutex4waitEv+0x7c>
void Mutex::wait() {
    80001f18:	fd010113          	addi	sp,sp,-48
    80001f1c:	02113423          	sd	ra,40(sp)
    80001f20:	02813023          	sd	s0,32(sp)
    80001f24:	00913c23          	sd	s1,24(sp)
    80001f28:	03010413          	addi	s0,sp,48
    80001f2c:	00050493          	mv	s1,a0
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80001f30:	100027f3          	csrr	a5,sstatus
    80001f34:	fcf43823          	sd	a5,-48(s0)
    return sstatus;
    80001f38:	fd043783          	ld	a5,-48(s0)
    lock()
    80001f3c:	fcf43c23          	sd	a5,-40(s0)
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80001f40:	00200793          	li	a5,2
    80001f44:	1007b073          	csrc	sstatus,a5
    if (holder) block();
    80001f48:	00070663          	beqz	a4,80001f54 <_ZN5Mutex4waitEv+0x50>
    80001f4c:	00000097          	auipc	ra,0x0
    80001f50:	834080e7          	jalr	-1996(ra) # 80001780 <_ZN15KernelSemaphore5blockEv>
    holder = TCB::running;
    80001f54:	00008797          	auipc	a5,0x8
    80001f58:	f8c7b783          	ld	a5,-116(a5) # 80009ee0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001f5c:	0007b783          	ld	a5,0(a5)
    80001f60:	02f4b423          	sd	a5,40(s1)
    unlock()
    80001f64:	fd843783          	ld	a5,-40(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80001f68:	10079073          	csrw	sstatus,a5
}
    80001f6c:	02813083          	ld	ra,40(sp)
    80001f70:	02013403          	ld	s0,32(sp)
    80001f74:	01813483          	ld	s1,24(sp)
    80001f78:	03010113          	addi	sp,sp,48
    80001f7c:	00008067          	ret
    80001f80:	00008067          	ret

0000000080001f84 <_ZN5Mutex6signalEv>:

void Mutex::signal() {
    if (holder != TCB::running) return;
    80001f84:	02853703          	ld	a4,40(a0)
    80001f88:	00008797          	auipc	a5,0x8
    80001f8c:	f587b783          	ld	a5,-168(a5) # 80009ee0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001f90:	0007b783          	ld	a5,0(a5)
    80001f94:	00f70463          	beq	a4,a5,80001f9c <_ZN5Mutex6signalEv+0x18>
    80001f98:	00008067          	ret
void Mutex::signal() {
    80001f9c:	fe010113          	addi	sp,sp,-32
    80001fa0:	00113c23          	sd	ra,24(sp)
    80001fa4:	00813823          	sd	s0,16(sp)
    80001fa8:	02010413          	addi	s0,sp,32
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80001fac:	100027f3          	csrr	a5,sstatus
    80001fb0:	fef43023          	sd	a5,-32(s0)
    return sstatus;
    80001fb4:	fe043783          	ld	a5,-32(s0)
    lock()
    80001fb8:	fef43423          	sd	a5,-24(s0)
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80001fbc:	00200793          	li	a5,2
    80001fc0:	1007b073          	csrc	sstatus,a5
    holder = nullptr;
    80001fc4:	02053423          	sd	zero,40(a0)
    deblock();
    80001fc8:	00000097          	auipc	ra,0x0
    80001fcc:	810080e7          	jalr	-2032(ra) # 800017d8 <_ZN15KernelSemaphore7deblockEv>
    unlock()
    80001fd0:	fe843783          	ld	a5,-24(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80001fd4:	10079073          	csrw	sstatus,a5
}
    80001fd8:	01813083          	ld	ra,24(sp)
    80001fdc:	01013403          	ld	s0,16(sp)
    80001fe0:	02010113          	addi	sp,sp,32
    80001fe4:	00008067          	ret

0000000080001fe8 <_ZN5Riscv10popSppSpieEb>:
#include "../h/SysPrint.h"
#include "../h/TCB.h"
#include "../h/Kernel.h"
#include "../h/TimerInterrupt.h"

void Riscv::popSppSpie(bool prMode) {
    80001fe8:	ff010113          	addi	sp,sp,-16
    80001fec:	00813423          	sd	s0,8(sp)
    80001ff0:	01010413          	addi	s0,sp,16
    if(prMode) ms_sstatus(SSTATUS_SPP);
    80001ff4:	02050463          	beqz	a0,8000201c <_ZN5Riscv10popSppSpieEb+0x34>
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80001ff8:	10000793          	li	a5,256
    80001ffc:	1007a073          	csrs	sstatus,a5
    80002000:	02000793          	li	a5,32
    80002004:	1007a073          	csrs	sstatus,a5
    else mc_sstatus(SSTATUS_SPP);
    ms_sstatus(SSTATUS_SPIE);
    __asm__ volatile ("csrw sepc, ra");
    80002008:	14109073          	csrw	sepc,ra
    __asm__ volatile ("sret");
    8000200c:	10200073          	sret
}
    80002010:	00813403          	ld	s0,8(sp)
    80002014:	01010113          	addi	sp,sp,16
    80002018:	00008067          	ret
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    8000201c:	10000793          	li	a5,256
    80002020:	1007b073          	csrc	sstatus,a5
}
    80002024:	fddff06f          	j	80002000 <_ZN5Riscv10popSppSpieEb+0x18>

0000000080002028 <_ZN5Riscv20handleSupervisorTrapEv>:

void Riscv::handleSupervisorTrap() {
    80002028:	f6010113          	addi	sp,sp,-160
    8000202c:	08113c23          	sd	ra,152(sp)
    80002030:	08813823          	sd	s0,144(sp)
    80002034:	08913423          	sd	s1,136(sp)
    80002038:	09213023          	sd	s2,128(sp)
    8000203c:	0a010413          	addi	s0,sp,160
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    80002040:	142027f3          	csrr	a5,scause
    80002044:	f8f43823          	sd	a5,-112(s0)
    return scause;
    80002048:	f9043483          	ld	s1,-112(s0)
    uint64 scause = r_scause();
    switch (scause) {
    8000204c:	fff00793          	li	a5,-1
    80002050:	03f79793          	slli	a5,a5,0x3f
    80002054:	00178793          	addi	a5,a5,1
    80002058:	0cf48663          	beq	s1,a5,80002124 <_ZN5Riscv20handleSupervisorTrapEv+0xfc>
    8000205c:	fff00793          	li	a5,-1
    80002060:	03f79793          	slli	a5,a5,0x3f
    80002064:	00178793          	addi	a5,a5,1
    80002068:	0497ea63          	bltu	a5,s1,800020bc <_ZN5Riscv20handleSupervisorTrapEv+0x94>
    8000206c:	00800793          	li	a5,8
    80002070:	06f48463          	beq	s1,a5,800020d8 <_ZN5Riscv20handleSupervisorTrapEv+0xb0>
    80002074:	00900793          	li	a5,9
    80002078:	14f49263          	bne	s1,a5,800021bc <_ZN5Riscv20handleSupervisorTrapEv+0x194>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    8000207c:	141027f3          	csrr	a5,sepc
    80002080:	faf43823          	sd	a5,-80(s0)
    return sepc;
    80002084:	fb043783          	ld	a5,-80(s0)
            w_sepc(sepc);
            break;
        }
        case 0x0000000000000009UL: {
            // interrupt: no, cause code: environment call from S-mode (9)
            volatile uint64 sepc = r_sepc() + 4;
    80002088:	00478793          	addi	a5,a5,4
    8000208c:	f6f43823          	sd	a5,-144(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80002090:	100027f3          	csrr	a5,sstatus
    80002094:	faf43423          	sd	a5,-88(s0)
    return sstatus;
    80002098:	fa843783          	ld	a5,-88(s0)
            volatile uint64 sstatus = r_sstatus();
    8000209c:	f6f43c23          	sd	a5,-136(s0)

            TCB::dispatch();
    800020a0:	00001097          	auipc	ra,0x1
    800020a4:	f78080e7          	jalr	-136(ra) # 80003018 <_ZN3TCB8dispatchEv>

            w_sstatus(sstatus);
    800020a8:	f7843783          	ld	a5,-136(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    800020ac:	10079073          	csrw	sstatus,a5
            w_sepc(sepc);
    800020b0:	f7043783          	ld	a5,-144(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    800020b4:	14179073          	csrw	sepc,a5
}
    800020b8:	0e00006f          	j	80002198 <_ZN5Riscv20handleSupervisorTrapEv+0x170>
    switch (scause) {
    800020bc:	fff00793          	li	a5,-1
    800020c0:	03f79793          	slli	a5,a5,0x3f
    800020c4:	00978793          	addi	a5,a5,9
    800020c8:	0ef49a63          	bne	s1,a5,800021bc <_ZN5Riscv20handleSupervisorTrapEv+0x194>
            w_sepc(sepc);
            break;
        }
        case 0x8000000000000009UL: {
            // interrupt: yes, cause code: supervisor external interrupt (console)
            console_handler();
    800020cc:	00005097          	auipc	ra,0x5
    800020d0:	3e4080e7          	jalr	996(ra) # 800074b0 <console_handler>
            break;
    800020d4:	0c40006f          	j	80002198 <_ZN5Riscv20handleSupervisorTrapEv+0x170>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    800020d8:	141027f3          	csrr	a5,sepc
    800020dc:	faf43023          	sd	a5,-96(s0)
    return sepc;
    800020e0:	fa043783          	ld	a5,-96(s0)
            volatile uint64 sepc = r_sepc() + 4;
    800020e4:	00478793          	addi	a5,a5,4
    800020e8:	f6f43023          	sd	a5,-160(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    800020ec:	100027f3          	csrr	a5,sstatus
    800020f0:	f8f43c23          	sd	a5,-104(s0)
    return sstatus;
    800020f4:	f9843783          	ld	a5,-104(s0)
            volatile uint64 sstatus = r_sstatus();
    800020f8:	f6f43423          	sd	a5,-152(s0)
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    800020fc:	00200493          	li	s1,2
    80002100:	1004a073          	csrs	sstatus,s1
            Kernel::handleSystemCall();
    80002104:	fffff097          	auipc	ra,0xfffff
    80002108:	50c080e7          	jalr	1292(ra) # 80001610 <_ZN6Kernel16handleSystemCallEv>
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    8000210c:	1004b073          	csrc	sstatus,s1
            w_sstatus(sstatus);
    80002110:	f6843783          	ld	a5,-152(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80002114:	10079073          	csrw	sstatus,a5
            w_sepc(sepc);
    80002118:	f6043783          	ld	a5,-160(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    8000211c:	14179073          	csrw	sepc,a5
}
    80002120:	0780006f          	j	80002198 <_ZN5Riscv20handleSupervisorTrapEv+0x170>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80002124:	141027f3          	csrr	a5,sepc
    80002128:	fcf43023          	sd	a5,-64(s0)
    return sepc;
    8000212c:	fc043783          	ld	a5,-64(s0)
            volatile uint64 sepc = r_sepc();
    80002130:	f8f43023          	sd	a5,-128(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80002134:	100027f3          	csrr	a5,sstatus
    80002138:	faf43c23          	sd	a5,-72(s0)
    return sstatus;
    8000213c:	fb843783          	ld	a5,-72(s0)
            volatile uint64 sstatus = r_sstatus();
    80002140:	f8f43423          	sd	a5,-120(s0)
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    80002144:	00200913          	li	s2,2
    80002148:	14493073          	csrc	sip,s2
            TCB::timeSliceCounter++;
    8000214c:	00008497          	auipc	s1,0x8
    80002150:	d844b483          	ld	s1,-636(s1) # 80009ed0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002154:	0004b783          	ld	a5,0(s1)
    80002158:	00178793          	addi	a5,a5,1
    8000215c:	00f4b023          	sd	a5,0(s1)
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80002160:	10092073          	csrs	sstatus,s2
            TimerInterrupt::tick();
    80002164:	00002097          	auipc	ra,0x2
    80002168:	81c080e7          	jalr	-2020(ra) # 80003980 <_ZN14TimerInterrupt4tickEv>
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    8000216c:	10093073          	csrc	sstatus,s2
            if (TCB::timeSliceCounter >= TCB::running->timeSlice) {
    80002170:	00008797          	auipc	a5,0x8
    80002174:	d707b783          	ld	a5,-656(a5) # 80009ee0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002178:	0007b783          	ld	a5,0(a5)
    8000217c:	0407b703          	ld	a4,64(a5)
    80002180:	0004b783          	ld	a5,0(s1)
    80002184:	02e7f663          	bgeu	a5,a4,800021b0 <_ZN5Riscv20handleSupervisorTrapEv+0x188>
            w_sstatus(sstatus);
    80002188:	f8843783          	ld	a5,-120(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    8000218c:	10079073          	csrw	sstatus,a5
            w_sepc(sepc);
    80002190:	f8043783          	ld	a5,-128(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80002194:	14179073          	csrw	sepc,a5
            kprintUnsigned(r_stval());
            kprintString("\n");
            w_sepc(r_sepc() + 4);
        }
    }
    80002198:	09813083          	ld	ra,152(sp)
    8000219c:	09013403          	ld	s0,144(sp)
    800021a0:	08813483          	ld	s1,136(sp)
    800021a4:	08013903          	ld	s2,128(sp)
    800021a8:	0a010113          	addi	sp,sp,160
    800021ac:	00008067          	ret
                TCB::dispatch();
    800021b0:	00001097          	auipc	ra,0x1
    800021b4:	e68080e7          	jalr	-408(ra) # 80003018 <_ZN3TCB8dispatchEv>
    800021b8:	fd1ff06f          	j	80002188 <_ZN5Riscv20handleSupervisorTrapEv+0x160>
            kprintString("Unexpected trap cause:\n");
    800021bc:	00006517          	auipc	a0,0x6
    800021c0:	fe450513          	addi	a0,a0,-28 # 800081a0 <CONSOLE_STATUS+0x190>
    800021c4:	00000097          	auipc	ra,0x0
    800021c8:	6a8080e7          	jalr	1704(ra) # 8000286c <_Z12kprintStringPKc>
            kprintString("Scause: ");
    800021cc:	00006517          	auipc	a0,0x6
    800021d0:	fec50513          	addi	a0,a0,-20 # 800081b8 <CONSOLE_STATUS+0x1a8>
    800021d4:	00000097          	auipc	ra,0x0
    800021d8:	698080e7          	jalr	1688(ra) # 8000286c <_Z12kprintStringPKc>
            kprintUnsigned(scause);
    800021dc:	00048513          	mv	a0,s1
    800021e0:	00001097          	auipc	ra,0x1
    800021e4:	8e4080e7          	jalr	-1820(ra) # 80002ac4 <_Z14kprintUnsignedm>
            kprintString("\nSepc: ");
    800021e8:	00006517          	auipc	a0,0x6
    800021ec:	fe050513          	addi	a0,a0,-32 # 800081c8 <CONSOLE_STATUS+0x1b8>
    800021f0:	00000097          	auipc	ra,0x0
    800021f4:	67c080e7          	jalr	1660(ra) # 8000286c <_Z12kprintStringPKc>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    800021f8:	141027f3          	csrr	a5,sepc
    800021fc:	fcf43c23          	sd	a5,-40(s0)
    return sepc;
    80002200:	fd843503          	ld	a0,-40(s0)
            kprintUnsigned(r_sepc());
    80002204:	00001097          	auipc	ra,0x1
    80002208:	8c0080e7          	jalr	-1856(ra) # 80002ac4 <_Z14kprintUnsignedm>
            kprintString("\nStval: ");
    8000220c:	00006517          	auipc	a0,0x6
    80002210:	fc450513          	addi	a0,a0,-60 # 800081d0 <CONSOLE_STATUS+0x1c0>
    80002214:	00000097          	auipc	ra,0x0
    80002218:	658080e7          	jalr	1624(ra) # 8000286c <_Z12kprintStringPKc>
    __asm__ volatile ("csrr %[stval], stval" : [stval] "=r"(stval));
    8000221c:	143027f3          	csrr	a5,stval
    80002220:	fcf43823          	sd	a5,-48(s0)
    return stval;
    80002224:	fd043503          	ld	a0,-48(s0)
            kprintUnsigned(r_stval());
    80002228:	00001097          	auipc	ra,0x1
    8000222c:	89c080e7          	jalr	-1892(ra) # 80002ac4 <_Z14kprintUnsignedm>
            kprintString("\n");
    80002230:	00006517          	auipc	a0,0x6
    80002234:	f5850513          	addi	a0,a0,-168 # 80008188 <CONSOLE_STATUS+0x178>
    80002238:	00000097          	auipc	ra,0x0
    8000223c:	634080e7          	jalr	1588(ra) # 8000286c <_Z12kprintStringPKc>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80002240:	141027f3          	csrr	a5,sepc
    80002244:	fcf43423          	sd	a5,-56(s0)
    return sepc;
    80002248:	fc843783          	ld	a5,-56(s0)
            w_sepc(r_sepc() + 4);
    8000224c:	00478793          	addi	a5,a5,4
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80002250:	14179073          	csrw	sepc,a5
    80002254:	f45ff06f          	j	80002198 <_ZN5Riscv20handleSupervisorTrapEv+0x170>

0000000080002258 <_ZN9Scheduler11getInstanceEv>:
    getInstance()->readyThreadQueue.addLast(tcb->getNode());
    getInstance()->mutex.signal();
}

Scheduler *Scheduler::getInstance() {
    if (!instance) instance = new Scheduler;
    80002258:	00008797          	auipc	a5,0x8
    8000225c:	ce87b783          	ld	a5,-792(a5) # 80009f40 <_ZN9Scheduler8instanceE>
    80002260:	00078863          	beqz	a5,80002270 <_ZN9Scheduler11getInstanceEv+0x18>
    return instance;
}
    80002264:	00008517          	auipc	a0,0x8
    80002268:	cdc53503          	ld	a0,-804(a0) # 80009f40 <_ZN9Scheduler8instanceE>
    8000226c:	00008067          	ret
Scheduler *Scheduler::getInstance() {
    80002270:	ff010113          	addi	sp,sp,-16
    80002274:	00113423          	sd	ra,8(sp)
    80002278:	00813023          	sd	s0,0(sp)
    8000227c:	01010413          	addi	s0,sp,16
        return kmalloc(size);
    80002280:	00200513          	li	a0,2
    80002284:	00000097          	auipc	ra,0x0
    80002288:	a44080e7          	jalr	-1468(ra) # 80001cc8 <_Z7kmallocm>
    explicit ThreadList() = default;
    8000228c:	00053423          	sd	zero,8(a0)
    80002290:	00053823          	sd	zero,16(a0)
    80002294:	00053c23          	sd	zero,24(a0)
    80002298:	02052023          	sw	zero,32(a0)
    8000229c:	00100793          	li	a5,1
    800022a0:	02f52423          	sw	a5,40(a0)
    800022a4:	02053823          	sd	zero,48(a0)
    800022a8:	02053c23          	sd	zero,56(a0)
    800022ac:	04053023          	sd	zero,64(a0)
    800022b0:	04052423          	sw	zero,72(a0)

class TCB;

#include "KernelSemaphore.h"

class Mutex : public KernelSemaphore {
    800022b4:	04053823          	sd	zero,80(a0)
    if (!instance) instance = new Scheduler;
    800022b8:	00008797          	auipc	a5,0x8
    800022bc:	c8a7b423          	sd	a0,-888(a5) # 80009f40 <_ZN9Scheduler8instanceE>
}
    800022c0:	00008517          	auipc	a0,0x8
    800022c4:	c8053503          	ld	a0,-896(a0) # 80009f40 <_ZN9Scheduler8instanceE>
    800022c8:	00813083          	ld	ra,8(sp)
    800022cc:	00013403          	ld	s0,0(sp)
    800022d0:	01010113          	addi	sp,sp,16
    800022d4:	00008067          	ret

00000000800022d8 <_ZN9Scheduler3getEv>:
TCB *Scheduler::get() {
    800022d8:	fe010113          	addi	sp,sp,-32
    800022dc:	00113c23          	sd	ra,24(sp)
    800022e0:	00813823          	sd	s0,16(sp)
    800022e4:	00913423          	sd	s1,8(sp)
    800022e8:	02010413          	addi	s0,sp,32
    getInstance()->mutex.wait();
    800022ec:	00000097          	auipc	ra,0x0
    800022f0:	f6c080e7          	jalr	-148(ra) # 80002258 <_ZN9Scheduler11getInstanceEv>
    800022f4:	02850513          	addi	a0,a0,40
    800022f8:	00000097          	auipc	ra,0x0
    800022fc:	c0c080e7          	jalr	-1012(ra) # 80001f04 <_ZN5Mutex4waitEv>
    TCB *tcb = getInstance()->readyThreadQueue.removeFirst();
    80002300:	00000097          	auipc	ra,0x0
    80002304:	f58080e7          	jalr	-168(ra) # 80002258 <_ZN9Scheduler11getInstanceEv>
    80002308:	00850513          	addi	a0,a0,8
    8000230c:	00001097          	auipc	ra,0x1
    80002310:	320080e7          	jalr	800(ra) # 8000362c <_ZN10ThreadList11removeFirstEv>
    80002314:	00050493          	mv	s1,a0
    getInstance()->mutex.signal();
    80002318:	00000097          	auipc	ra,0x0
    8000231c:	f40080e7          	jalr	-192(ra) # 80002258 <_ZN9Scheduler11getInstanceEv>
    80002320:	02850513          	addi	a0,a0,40
    80002324:	00000097          	auipc	ra,0x0
    80002328:	c60080e7          	jalr	-928(ra) # 80001f84 <_ZN5Mutex6signalEv>
}
    8000232c:	00048513          	mv	a0,s1
    80002330:	01813083          	ld	ra,24(sp)
    80002334:	01013403          	ld	s0,16(sp)
    80002338:	00813483          	ld	s1,8(sp)
    8000233c:	02010113          	addi	sp,sp,32
    80002340:	00008067          	ret

0000000080002344 <_ZN9Scheduler3putEP3TCB>:
void Scheduler::put(TCB *tcb) {
    80002344:	fe010113          	addi	sp,sp,-32
    80002348:	00113c23          	sd	ra,24(sp)
    8000234c:	00813823          	sd	s0,16(sp)
    80002350:	00913423          	sd	s1,8(sp)
    80002354:	02010413          	addi	s0,sp,32
    80002358:	00050493          	mv	s1,a0
    getInstance()->mutex.wait();
    8000235c:	00000097          	auipc	ra,0x0
    80002360:	efc080e7          	jalr	-260(ra) # 80002258 <_ZN9Scheduler11getInstanceEv>
    80002364:	02850513          	addi	a0,a0,40
    80002368:	00000097          	auipc	ra,0x0
    8000236c:	b9c080e7          	jalr	-1124(ra) # 80001f04 <_ZN5Mutex4waitEv>
    getInstance()->readyThreadQueue.addLast(tcb->getNode());
    80002370:	00000097          	auipc	ra,0x0
    80002374:	ee8080e7          	jalr	-280(ra) # 80002258 <_ZN9Scheduler11getInstanceEv>
    80002378:	0a048593          	addi	a1,s1,160
    8000237c:	00850513          	addi	a0,a0,8
    80002380:	00001097          	auipc	ra,0x1
    80002384:	268080e7          	jalr	616(ra) # 800035e8 <_ZN10ThreadList7addLastEP10ThreadNode>
    getInstance()->mutex.signal();
    80002388:	00000097          	auipc	ra,0x0
    8000238c:	ed0080e7          	jalr	-304(ra) # 80002258 <_ZN9Scheduler11getInstanceEv>
    80002390:	02850513          	addi	a0,a0,40
    80002394:	00000097          	auipc	ra,0x0
    80002398:	bf0080e7          	jalr	-1040(ra) # 80001f84 <_ZN5Mutex6signalEv>
}
    8000239c:	01813083          	ld	ra,24(sp)
    800023a0:	01013403          	ld	s0,16(sp)
    800023a4:	00813483          	ld	s1,8(sp)
    800023a8:	02010113          	addi	sp,sp,32
    800023ac:	00008067          	ret

00000000800023b0 <_ZN9SchedulerD1Ev>:

Scheduler::~Scheduler() {
    800023b0:	fe010113          	addi	sp,sp,-32
    800023b4:	00113c23          	sd	ra,24(sp)
    800023b8:	00813823          	sd	s0,16(sp)
    800023bc:	00913423          	sd	s1,8(sp)
    800023c0:	01213023          	sd	s2,0(sp)
    800023c4:	02010413          	addi	s0,sp,32
    800023c8:	00050913          	mv	s2,a0
        return size == 0;
    800023cc:	02092783          	lw	a5,32(s2)
    while (!readyThreadQueue.isEmpty()) {
    800023d0:	02078863          	beqz	a5,80002400 <_ZN9SchedulerD1Ev+0x50>
        delete readyThreadQueue.removeFirst();
    800023d4:	00890513          	addi	a0,s2,8
    800023d8:	00001097          	auipc	ra,0x1
    800023dc:	254080e7          	jalr	596(ra) # 8000362c <_ZN10ThreadList11removeFirstEv>
    800023e0:	00050493          	mv	s1,a0
    800023e4:	fe0504e3          	beqz	a0,800023cc <_ZN9SchedulerD1Ev+0x1c>
    800023e8:	00001097          	auipc	ra,0x1
    800023ec:	e08080e7          	jalr	-504(ra) # 800031f0 <_ZN3TCBD1Ev>
        kfree(addr);
    800023f0:	00048513          	mv	a0,s1
    800023f4:	00000097          	auipc	ra,0x0
    800023f8:	ad0080e7          	jalr	-1328(ra) # 80001ec4 <_Z5kfreePv>
    }
    800023fc:	fd1ff06f          	j	800023cc <_ZN9SchedulerD1Ev+0x1c>
    80002400:	02890513          	addi	a0,s2,40
    80002404:	fffff097          	auipc	ra,0xfffff
    80002408:	4d4080e7          	jalr	1236(ra) # 800018d8 <_ZN15KernelSemaphoreD1Ev>
Scheduler::~Scheduler() {
    8000240c:	00890513          	addi	a0,s2,8
    80002410:	00001097          	auipc	ra,0x1
    80002414:	3c0080e7          	jalr	960(ra) # 800037d0 <_ZN10ThreadListD1Ev>
    }
}
    80002418:	01813083          	ld	ra,24(sp)
    8000241c:	01013403          	ld	s0,16(sp)
    80002420:	00813483          	ld	s1,8(sp)
    80002424:	00013903          	ld	s2,0(sp)
    80002428:	02010113          	addi	sp,sp,32
    8000242c:	00008067          	ret

0000000080002430 <_Z18callSupervisorTrapmPv>:
#include "../h/syscall_c.h"

void *callSupervisorTrap(uint64 param, void *args) {
    80002430:	ff010113          	addi	sp,sp,-16
    80002434:	00813423          	sd	s0,8(sp)
    80002438:	01010413          	addi	s0,sp,16
    __asm__ volatile ("ecall");
    8000243c:	00000073          	ecall

    return (void *) param;
}
    80002440:	00813403          	ld	s0,8(sp)
    80002444:	01010113          	addi	sp,sp,16
    80002448:	00008067          	ret

000000008000244c <_ZN7_threadC1EPFvPvES0_>:

_thread::_thread(_thread::Body body, void *arg) : id(0), body(body), arg(arg) {
    8000244c:	ff010113          	addi	sp,sp,-16
    80002450:	00813423          	sd	s0,8(sp)
    80002454:	01010413          	addi	s0,sp,16
    80002458:	00053023          	sd	zero,0(a0)
    8000245c:	00b53423          	sd	a1,8(a0)
    80002460:	00c53823          	sd	a2,16(a0)
}
    80002464:	00813403          	ld	s0,8(sp)
    80002468:	01010113          	addi	sp,sp,16
    8000246c:	00008067          	ret

0000000080002470 <_Z9mem_allocm>:
_sem::~_sem() {
    sem_close(this);
}

void *mem_alloc(size_t size) {
    if (!size) return nullptr;
    80002470:	02050e63          	beqz	a0,800024ac <_Z9mem_allocm+0x3c>
void *mem_alloc(size_t size) {
    80002474:	ff010113          	addi	sp,sp,-16
    80002478:	00113423          	sd	ra,8(sp)
    8000247c:	00813023          	sd	s0,0(sp)
    80002480:	01010413          	addi	s0,sp,16
    size = (size - 1) / MEM_BLOCK_SIZE + 1;
    80002484:	fff50513          	addi	a0,a0,-1
    80002488:	00655593          	srli	a1,a0,0x6
    return callSupervisorTrap(0x01, (void *) size);
    8000248c:	00158593          	addi	a1,a1,1
    80002490:	00100513          	li	a0,1
    80002494:	00000097          	auipc	ra,0x0
    80002498:	f9c080e7          	jalr	-100(ra) # 80002430 <_Z18callSupervisorTrapmPv>
}
    8000249c:	00813083          	ld	ra,8(sp)
    800024a0:	00013403          	ld	s0,0(sp)
    800024a4:	01010113          	addi	sp,sp,16
    800024a8:	00008067          	ret
    if (!size) return nullptr;
    800024ac:	00000513          	li	a0,0
}
    800024b0:	00008067          	ret

00000000800024b4 <_Z8mem_freePv>:

int mem_free(void *addr) {
    800024b4:	ff010113          	addi	sp,sp,-16
    800024b8:	00113423          	sd	ra,8(sp)
    800024bc:	00813023          	sd	s0,0(sp)
    800024c0:	01010413          	addi	s0,sp,16
    800024c4:	00050593          	mv	a1,a0
    return (uint64) callSupervisorTrap(0x02, addr);
    800024c8:	00200513          	li	a0,2
    800024cc:	00000097          	auipc	ra,0x0
    800024d0:	f64080e7          	jalr	-156(ra) # 80002430 <_Z18callSupervisorTrapmPv>
}
    800024d4:	0005051b          	sext.w	a0,a0
    800024d8:	00813083          	ld	ra,8(sp)
    800024dc:	00013403          	ld	s0,0(sp)
    800024e0:	01010113          	addi	sp,sp,16
    800024e4:	00008067          	ret

00000000800024e8 <_Z13thread_createPP7_threadPFvPvES2_>:

int thread_create(thread_t *handle, void(*start_routine)(void *), void *arg) {
    if (!handle) return -1;
    800024e8:	08050a63          	beqz	a0,8000257c <_Z13thread_createPP7_threadPFvPvES2_+0x94>
int thread_create(thread_t *handle, void(*start_routine)(void *), void *arg) {
    800024ec:	fb010113          	addi	sp,sp,-80
    800024f0:	04113423          	sd	ra,72(sp)
    800024f4:	04813023          	sd	s0,64(sp)
    800024f8:	02913c23          	sd	s1,56(sp)
    800024fc:	03213823          	sd	s2,48(sp)
    80002500:	03313423          	sd	s3,40(sp)
    80002504:	05010413          	addi	s0,sp,80
    80002508:	00050493          	mv	s1,a0
    8000250c:	00058993          	mv	s3,a1
    80002510:	00060913          	mv	s2,a2

    *handle = new _thread;
    80002514:	01800513          	li	a0,24
    80002518:	00000097          	auipc	ra,0x0
    8000251c:	2b4080e7          	jalr	692(ra) # 800027cc <_Znwm>
    80002520:	00a4b023          	sd	a0,0(s1)
    if (!*handle) return -1;
    80002524:	06050063          	beqz	a0,80002584 <_Z13thread_createPP7_threadPFvPvES2_+0x9c>

    void *stack = new uint64[DEFAULT_STACK_SIZE];
    80002528:	00008537          	lui	a0,0x8
    8000252c:	00000097          	auipc	ra,0x0
    80002530:	2c8080e7          	jalr	712(ra) # 800027f4 <_Znam>
    if (!stack) return -1;
    80002534:	04050c63          	beqz	a0,8000258c <_Z13thread_createPP7_threadPFvPvES2_+0xa4>

    uint64 args[] = {(uint64) *handle, (uint64) start_routine, (uint64) arg, (uint64) stack};
    80002538:	0004b783          	ld	a5,0(s1)
    8000253c:	faf43823          	sd	a5,-80(s0)
    80002540:	fb343c23          	sd	s3,-72(s0)
    80002544:	fd243023          	sd	s2,-64(s0)
    80002548:	fca43423          	sd	a0,-56(s0)
    return (uint64) callSupervisorTrap(0x11, args);
    8000254c:	fb040593          	addi	a1,s0,-80
    80002550:	01100513          	li	a0,17
    80002554:	00000097          	auipc	ra,0x0
    80002558:	edc080e7          	jalr	-292(ra) # 80002430 <_Z18callSupervisorTrapmPv>
    8000255c:	0005051b          	sext.w	a0,a0
}
    80002560:	04813083          	ld	ra,72(sp)
    80002564:	04013403          	ld	s0,64(sp)
    80002568:	03813483          	ld	s1,56(sp)
    8000256c:	03013903          	ld	s2,48(sp)
    80002570:	02813983          	ld	s3,40(sp)
    80002574:	05010113          	addi	sp,sp,80
    80002578:	00008067          	ret
    if (!handle) return -1;
    8000257c:	fff00513          	li	a0,-1
}
    80002580:	00008067          	ret
    if (!*handle) return -1;
    80002584:	fff00513          	li	a0,-1
    80002588:	fd9ff06f          	j	80002560 <_Z13thread_createPP7_threadPFvPvES2_+0x78>
    if (!stack) return -1;
    8000258c:	fff00513          	li	a0,-1
    80002590:	fd1ff06f          	j	80002560 <_Z13thread_createPP7_threadPFvPvES2_+0x78>

0000000080002594 <_Z11thread_exitv>:

int thread_exit() {
    80002594:	ff010113          	addi	sp,sp,-16
    80002598:	00113423          	sd	ra,8(sp)
    8000259c:	00813023          	sd	s0,0(sp)
    800025a0:	01010413          	addi	s0,sp,16
    return (uint64) callSupervisorTrap(0x12, 0);
    800025a4:	00000593          	li	a1,0
    800025a8:	01200513          	li	a0,18
    800025ac:	00000097          	auipc	ra,0x0
    800025b0:	e84080e7          	jalr	-380(ra) # 80002430 <_Z18callSupervisorTrapmPv>
}
    800025b4:	0005051b          	sext.w	a0,a0
    800025b8:	00813083          	ld	ra,8(sp)
    800025bc:	00013403          	ld	s0,0(sp)
    800025c0:	01010113          	addi	sp,sp,16
    800025c4:	00008067          	ret

00000000800025c8 <_Z15thread_dispatchv>:

void thread_dispatch() {
    800025c8:	ff010113          	addi	sp,sp,-16
    800025cc:	00113423          	sd	ra,8(sp)
    800025d0:	00813023          	sd	s0,0(sp)
    800025d4:	01010413          	addi	s0,sp,16
    callSupervisorTrap(0x13, 0);
    800025d8:	00000593          	li	a1,0
    800025dc:	01300513          	li	a0,19
    800025e0:	00000097          	auipc	ra,0x0
    800025e4:	e50080e7          	jalr	-432(ra) # 80002430 <_Z18callSupervisorTrapmPv>
}
    800025e8:	00813083          	ld	ra,8(sp)
    800025ec:	00013403          	ld	s0,0(sp)
    800025f0:	01010113          	addi	sp,sp,16
    800025f4:	00008067          	ret

00000000800025f8 <_Z8sem_openPP4_semj>:

int sem_open(sem_t *handle, unsigned init) {
    if (!handle) return -1;
    800025f8:	06050863          	beqz	a0,80002668 <_Z8sem_openPP4_semj+0x70>
int sem_open(sem_t *handle, unsigned init) {
    800025fc:	fd010113          	addi	sp,sp,-48
    80002600:	02113423          	sd	ra,40(sp)
    80002604:	02813023          	sd	s0,32(sp)
    80002608:	00913c23          	sd	s1,24(sp)
    8000260c:	01213823          	sd	s2,16(sp)
    80002610:	03010413          	addi	s0,sp,48
    80002614:	00050913          	mv	s2,a0
    80002618:	00058493          	mv	s1,a1
    *handle = new _sem;
    8000261c:	00800513          	li	a0,8
    80002620:	00000097          	auipc	ra,0x0
    80002624:	1ac080e7          	jalr	428(ra) # 800027cc <_Znwm>
    80002628:	00a93023          	sd	a0,0(s2)
    uint64 args[] = {(uint64) *handle, (uint64) init};
    8000262c:	fca43823          	sd	a0,-48(s0)
    80002630:	02049593          	slli	a1,s1,0x20
    80002634:	0205d593          	srli	a1,a1,0x20
    80002638:	fcb43c23          	sd	a1,-40(s0)
    return (uint64) callSupervisorTrap(0x21, args);
    8000263c:	fd040593          	addi	a1,s0,-48
    80002640:	02100513          	li	a0,33
    80002644:	00000097          	auipc	ra,0x0
    80002648:	dec080e7          	jalr	-532(ra) # 80002430 <_Z18callSupervisorTrapmPv>
    8000264c:	0005051b          	sext.w	a0,a0
}
    80002650:	02813083          	ld	ra,40(sp)
    80002654:	02013403          	ld	s0,32(sp)
    80002658:	01813483          	ld	s1,24(sp)
    8000265c:	01013903          	ld	s2,16(sp)
    80002660:	03010113          	addi	sp,sp,48
    80002664:	00008067          	ret
    if (!handle) return -1;
    80002668:	fff00513          	li	a0,-1
}
    8000266c:	00008067          	ret

0000000080002670 <_Z9sem_closeP4_sem>:

int sem_close(sem_t handle) {
    80002670:	ff010113          	addi	sp,sp,-16
    80002674:	00113423          	sd	ra,8(sp)
    80002678:	00813023          	sd	s0,0(sp)
    8000267c:	01010413          	addi	s0,sp,16
    80002680:	00050593          	mv	a1,a0
    return (uint64) callSupervisorTrap(0x22, handle);
    80002684:	02200513          	li	a0,34
    80002688:	00000097          	auipc	ra,0x0
    8000268c:	da8080e7          	jalr	-600(ra) # 80002430 <_Z18callSupervisorTrapmPv>
}
    80002690:	0005051b          	sext.w	a0,a0
    80002694:	00813083          	ld	ra,8(sp)
    80002698:	00013403          	ld	s0,0(sp)
    8000269c:	01010113          	addi	sp,sp,16
    800026a0:	00008067          	ret

00000000800026a4 <_ZN4_semD1Ev>:
_sem::~_sem() {
    800026a4:	ff010113          	addi	sp,sp,-16
    800026a8:	00113423          	sd	ra,8(sp)
    800026ac:	00813023          	sd	s0,0(sp)
    800026b0:	01010413          	addi	s0,sp,16
    sem_close(this);
    800026b4:	00000097          	auipc	ra,0x0
    800026b8:	fbc080e7          	jalr	-68(ra) # 80002670 <_Z9sem_closeP4_sem>
}
    800026bc:	00813083          	ld	ra,8(sp)
    800026c0:	00013403          	ld	s0,0(sp)
    800026c4:	01010113          	addi	sp,sp,16
    800026c8:	00008067          	ret

00000000800026cc <_Z8sem_waitP4_sem>:

int sem_wait(sem_t handle) {
    800026cc:	ff010113          	addi	sp,sp,-16
    800026d0:	00113423          	sd	ra,8(sp)
    800026d4:	00813023          	sd	s0,0(sp)
    800026d8:	01010413          	addi	s0,sp,16
    800026dc:	00050593          	mv	a1,a0
    return (uint64) callSupervisorTrap(0x23, handle);
    800026e0:	02300513          	li	a0,35
    800026e4:	00000097          	auipc	ra,0x0
    800026e8:	d4c080e7          	jalr	-692(ra) # 80002430 <_Z18callSupervisorTrapmPv>
}
    800026ec:	0005051b          	sext.w	a0,a0
    800026f0:	00813083          	ld	ra,8(sp)
    800026f4:	00013403          	ld	s0,0(sp)
    800026f8:	01010113          	addi	sp,sp,16
    800026fc:	00008067          	ret

0000000080002700 <_Z10sem_signalP4_sem>:

int sem_signal(sem_t handle) {
    80002700:	ff010113          	addi	sp,sp,-16
    80002704:	00113423          	sd	ra,8(sp)
    80002708:	00813023          	sd	s0,0(sp)
    8000270c:	01010413          	addi	s0,sp,16
    80002710:	00050593          	mv	a1,a0
    return (uint64) callSupervisorTrap(0x24, handle);
    80002714:	02400513          	li	a0,36
    80002718:	00000097          	auipc	ra,0x0
    8000271c:	d18080e7          	jalr	-744(ra) # 80002430 <_Z18callSupervisorTrapmPv>
}
    80002720:	0005051b          	sext.w	a0,a0
    80002724:	00813083          	ld	ra,8(sp)
    80002728:	00013403          	ld	s0,0(sp)
    8000272c:	01010113          	addi	sp,sp,16
    80002730:	00008067          	ret

0000000080002734 <_Z10time_sleepm>:

int time_sleep(time_t time) {
    80002734:	ff010113          	addi	sp,sp,-16
    80002738:	00113423          	sd	ra,8(sp)
    8000273c:	00813023          	sd	s0,0(sp)
    80002740:	01010413          	addi	s0,sp,16
    80002744:	00050593          	mv	a1,a0
    return (uint64) callSupervisorTrap(0x31, (void *) time);
    80002748:	03100513          	li	a0,49
    8000274c:	00000097          	auipc	ra,0x0
    80002750:	ce4080e7          	jalr	-796(ra) # 80002430 <_Z18callSupervisorTrapmPv>
}
    80002754:	0005051b          	sext.w	a0,a0
    80002758:	00813083          	ld	ra,8(sp)
    8000275c:	00013403          	ld	s0,0(sp)
    80002760:	01010113          	addi	sp,sp,16
    80002764:	00008067          	ret

0000000080002768 <_Z4getcv>:

char getc() {
    80002768:	ff010113          	addi	sp,sp,-16
    8000276c:	00113423          	sd	ra,8(sp)
    80002770:	00813023          	sd	s0,0(sp)
    80002774:	01010413          	addi	s0,sp,16
    return (uint64) callSupervisorTrap(0x41, nullptr);
    80002778:	00000593          	li	a1,0
    8000277c:	04100513          	li	a0,65
    80002780:	00000097          	auipc	ra,0x0
    80002784:	cb0080e7          	jalr	-848(ra) # 80002430 <_Z18callSupervisorTrapmPv>
}
    80002788:	0ff57513          	andi	a0,a0,255
    8000278c:	00813083          	ld	ra,8(sp)
    80002790:	00013403          	ld	s0,0(sp)
    80002794:	01010113          	addi	sp,sp,16
    80002798:	00008067          	ret

000000008000279c <_Z4putcc>:

void putc(char chr) {
    8000279c:	ff010113          	addi	sp,sp,-16
    800027a0:	00113423          	sd	ra,8(sp)
    800027a4:	00813023          	sd	s0,0(sp)
    800027a8:	01010413          	addi	s0,sp,16
    800027ac:	00050593          	mv	a1,a0
    callSupervisorTrap(0x42, (void *) (uint64) chr);
    800027b0:	04200513          	li	a0,66
    800027b4:	00000097          	auipc	ra,0x0
    800027b8:	c7c080e7          	jalr	-900(ra) # 80002430 <_Z18callSupervisorTrapmPv>
}
    800027bc:	00813083          	ld	ra,8(sp)
    800027c0:	00013403          	ld	s0,0(sp)
    800027c4:	01010113          	addi	sp,sp,16
    800027c8:	00008067          	ret

00000000800027cc <_Znwm>:
#include "../h/syscall_cpp.hpp"

void *operator new(size_t sz) {
    800027cc:	ff010113          	addi	sp,sp,-16
    800027d0:	00113423          	sd	ra,8(sp)
    800027d4:	00813023          	sd	s0,0(sp)
    800027d8:	01010413          	addi	s0,sp,16
    return mem_alloc(sz);
    800027dc:	00000097          	auipc	ra,0x0
    800027e0:	c94080e7          	jalr	-876(ra) # 80002470 <_Z9mem_allocm>
}
    800027e4:	00813083          	ld	ra,8(sp)
    800027e8:	00013403          	ld	s0,0(sp)
    800027ec:	01010113          	addi	sp,sp,16
    800027f0:	00008067          	ret

00000000800027f4 <_Znam>:

void *operator new[](size_t sz) {
    800027f4:	ff010113          	addi	sp,sp,-16
    800027f8:	00113423          	sd	ra,8(sp)
    800027fc:	00813023          	sd	s0,0(sp)
    80002800:	01010413          	addi	s0,sp,16
    return mem_alloc(sz);
    80002804:	00000097          	auipc	ra,0x0
    80002808:	c6c080e7          	jalr	-916(ra) # 80002470 <_Z9mem_allocm>
}
    8000280c:	00813083          	ld	ra,8(sp)
    80002810:	00013403          	ld	s0,0(sp)
    80002814:	01010113          	addi	sp,sp,16
    80002818:	00008067          	ret

000000008000281c <_ZdlPv>:

void operator delete(void *addr) {
    8000281c:	ff010113          	addi	sp,sp,-16
    80002820:	00113423          	sd	ra,8(sp)
    80002824:	00813023          	sd	s0,0(sp)
    80002828:	01010413          	addi	s0,sp,16
    mem_free(addr);
    8000282c:	00000097          	auipc	ra,0x0
    80002830:	c88080e7          	jalr	-888(ra) # 800024b4 <_Z8mem_freePv>
}
    80002834:	00813083          	ld	ra,8(sp)
    80002838:	00013403          	ld	s0,0(sp)
    8000283c:	01010113          	addi	sp,sp,16
    80002840:	00008067          	ret

0000000080002844 <_ZdaPv>:

void operator delete[](void *addr) {
    80002844:	ff010113          	addi	sp,sp,-16
    80002848:	00113423          	sd	ra,8(sp)
    8000284c:	00813023          	sd	s0,0(sp)
    80002850:	01010413          	addi	s0,sp,16
    mem_free(addr);
    80002854:	00000097          	auipc	ra,0x0
    80002858:	c60080e7          	jalr	-928(ra) # 800024b4 <_Z8mem_freePv>
}
    8000285c:	00813083          	ld	ra,8(sp)
    80002860:	00013403          	ld	s0,0(sp)
    80002864:	01010113          	addi	sp,sp,16
    80002868:	00008067          	ret

000000008000286c <_Z12kprintStringPKc>:
#include "../h/SysPrint.h"
#include "../lib/console.h"

PrintMutex *PrintMutex::instance = nullptr;

void kprintString(char const *string) {
    8000286c:	fe010113          	addi	sp,sp,-32
    80002870:	00113c23          	sd	ra,24(sp)
    80002874:	00813823          	sd	s0,16(sp)
    80002878:	00913423          	sd	s1,8(sp)
    8000287c:	02010413          	addi	s0,sp,32
    80002880:	00050493          	mv	s1,a0
#include "Mutex.h"

class PrintMutex : public KernelObject {
public:
    static PrintMutex* getInstance() {
        if (!instance) instance = new PrintMutex;
    80002884:	00007797          	auipc	a5,0x7
    80002888:	6c47b783          	ld	a5,1732(a5) # 80009f48 <_ZN10PrintMutex8instanceE>
    8000288c:	02078863          	beqz	a5,800028bc <_Z12kprintStringPKc+0x50>
        return instance;
    }

    static void wait() {
        getInstance()->mutex.wait();
    80002890:	00007517          	auipc	a0,0x7
    80002894:	6b853503          	ld	a0,1720(a0) # 80009f48 <_ZN10PrintMutex8instanceE>
    80002898:	00850513          	addi	a0,a0,8
    8000289c:	fffff097          	auipc	ra,0xfffff
    800028a0:	668080e7          	jalr	1640(ra) # 80001f04 <_ZN5Mutex4waitEv>
    PrintMutex::wait();
    while (*string != '\0') {
    800028a4:	0004c503          	lbu	a0,0(s1)
    800028a8:	04050463          	beqz	a0,800028f0 <_Z12kprintStringPKc+0x84>
        __putc(*string);
    800028ac:	00005097          	auipc	ra,0x5
    800028b0:	b90080e7          	jalr	-1136(ra) # 8000743c <__putc>
        string++;
    800028b4:	00148493          	addi	s1,s1,1
    while (*string != '\0') {
    800028b8:	fedff06f          	j	800028a4 <_Z12kprintStringPKc+0x38>
        return kmalloc(size);
    800028bc:	00100513          	li	a0,1
    800028c0:	fffff097          	auipc	ra,0xfffff
    800028c4:	408080e7          	jalr	1032(ra) # 80001cc8 <_Z7kmallocm>
    800028c8:	00100793          	li	a5,1
    800028cc:	00f52423          	sw	a5,8(a0)
    explicit ThreadList() = default;
    800028d0:	00053823          	sd	zero,16(a0)
    800028d4:	00053c23          	sd	zero,24(a0)
    800028d8:	02053023          	sd	zero,32(a0)
    800028dc:	02052423          	sw	zero,40(a0)
    800028e0:	02053823          	sd	zero,48(a0)
        if (!instance) instance = new PrintMutex;
    800028e4:	00007797          	auipc	a5,0x7
    800028e8:	66a7b223          	sd	a0,1636(a5) # 80009f48 <_ZN10PrintMutex8instanceE>
    800028ec:	fa5ff06f          	j	80002890 <_Z12kprintStringPKc+0x24>
    800028f0:	00007797          	auipc	a5,0x7
    800028f4:	6587b783          	ld	a5,1624(a5) # 80009f48 <_ZN10PrintMutex8instanceE>
    800028f8:	02078663          	beqz	a5,80002924 <_Z12kprintStringPKc+0xb8>
    }

    static void signal() {
        getInstance()->mutex.signal();
    800028fc:	00007517          	auipc	a0,0x7
    80002900:	64c53503          	ld	a0,1612(a0) # 80009f48 <_ZN10PrintMutex8instanceE>
    80002904:	00850513          	addi	a0,a0,8
    80002908:	fffff097          	auipc	ra,0xfffff
    8000290c:	67c080e7          	jalr	1660(ra) # 80001f84 <_ZN5Mutex6signalEv>
    }
    PrintMutex::signal();
}
    80002910:	01813083          	ld	ra,24(sp)
    80002914:	01013403          	ld	s0,16(sp)
    80002918:	00813483          	ld	s1,8(sp)
    8000291c:	02010113          	addi	sp,sp,32
    80002920:	00008067          	ret
    80002924:	00100513          	li	a0,1
    80002928:	fffff097          	auipc	ra,0xfffff
    8000292c:	3a0080e7          	jalr	928(ra) # 80001cc8 <_Z7kmallocm>
    80002930:	00100793          	li	a5,1
    80002934:	00f52423          	sw	a5,8(a0)
    80002938:	00053823          	sd	zero,16(a0)
    8000293c:	00053c23          	sd	zero,24(a0)
    80002940:	02053023          	sd	zero,32(a0)
    80002944:	02052423          	sw	zero,40(a0)
    80002948:	02053823          	sd	zero,48(a0)
        if (!instance) instance = new PrintMutex;
    8000294c:	00007797          	auipc	a5,0x7
    80002950:	5ea7be23          	sd	a0,1532(a5) # 80009f48 <_ZN10PrintMutex8instanceE>
    80002954:	fa9ff06f          	j	800028fc <_Z12kprintStringPKc+0x90>

0000000080002958 <_Z13kprintIntegeri>:

void kprintInteger(int integer) {
    80002958:	fd010113          	addi	sp,sp,-48
    8000295c:	02113423          	sd	ra,40(sp)
    80002960:	02813023          	sd	s0,32(sp)
    80002964:	00913c23          	sd	s1,24(sp)
    80002968:	03010413          	addi	s0,sp,48
    8000296c:	00050493          	mv	s1,a0
    80002970:	00007797          	auipc	a5,0x7
    80002974:	5d87b783          	ld	a5,1496(a5) # 80009f48 <_ZN10PrintMutex8instanceE>
    80002978:	0a078263          	beqz	a5,80002a1c <_Z13kprintIntegeri+0xc4>
        getInstance()->mutex.wait();
    8000297c:	00007517          	auipc	a0,0x7
    80002980:	5cc53503          	ld	a0,1484(a0) # 80009f48 <_ZN10PrintMutex8instanceE>
    80002984:	00850513          	addi	a0,a0,8
    80002988:	fffff097          	auipc	ra,0xfffff
    8000298c:	57c080e7          	jalr	1404(ra) # 80001f04 <_ZN5Mutex4waitEv>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if (integer < 0) {
    80002990:	0c04c063          	bltz	s1,80002a50 <_Z13kprintIntegeri+0xf8>
        neg = 1;
        x = -integer;
    } else {
        x = integer;
    80002994:	0004851b          	sext.w	a0,s1
    neg = 0;
    80002998:	00000593          	li	a1,0
    }

    i = 0;
    8000299c:	00000493          	li	s1,0
    do {
        buf[i++] = digits[x % 10];
    800029a0:	00a00693          	li	a3,10
    800029a4:	02d577bb          	remuw	a5,a0,a3
    800029a8:	00048613          	mv	a2,s1
    800029ac:	0014849b          	addiw	s1,s1,1
    800029b0:	02079713          	slli	a4,a5,0x20
    800029b4:	02075713          	srli	a4,a4,0x20
    800029b8:	00006797          	auipc	a5,0x6
    800029bc:	82878793          	addi	a5,a5,-2008 # 800081e0 <_ZZ13kprintIntegeriE6digits>
    800029c0:	00e787b3          	add	a5,a5,a4
    800029c4:	0007c703          	lbu	a4,0(a5)
    800029c8:	fe040793          	addi	a5,s0,-32
    800029cc:	00c787b3          	add	a5,a5,a2
    800029d0:	fee78823          	sb	a4,-16(a5)
    } while ((x /= 10) != 0);
    800029d4:	0005071b          	sext.w	a4,a0
    800029d8:	02d5553b          	divuw	a0,a0,a3
    800029dc:	00900793          	li	a5,9
    800029e0:	fce7e0e3          	bltu	a5,a4,800029a0 <_Z13kprintIntegeri+0x48>
    if (neg) buf[i++] = '-';
    800029e4:	00058c63          	beqz	a1,800029fc <_Z13kprintIntegeri+0xa4>
    800029e8:	fe040793          	addi	a5,s0,-32
    800029ec:	009784b3          	add	s1,a5,s1
    800029f0:	02d00793          	li	a5,45
    800029f4:	fef48823          	sb	a5,-16(s1)
    800029f8:	0026049b          	addiw	s1,a2,2

    while (--i >= 0)
    800029fc:	fff4849b          	addiw	s1,s1,-1
    80002a00:	0404ce63          	bltz	s1,80002a5c <_Z13kprintIntegeri+0x104>
        __putc(buf[i]);
    80002a04:	fe040793          	addi	a5,s0,-32
    80002a08:	009787b3          	add	a5,a5,s1
    80002a0c:	ff07c503          	lbu	a0,-16(a5)
    80002a10:	00005097          	auipc	ra,0x5
    80002a14:	a2c080e7          	jalr	-1492(ra) # 8000743c <__putc>
    80002a18:	fe5ff06f          	j	800029fc <_Z13kprintIntegeri+0xa4>
    80002a1c:	00100513          	li	a0,1
    80002a20:	fffff097          	auipc	ra,0xfffff
    80002a24:	2a8080e7          	jalr	680(ra) # 80001cc8 <_Z7kmallocm>
    80002a28:	00100793          	li	a5,1
    80002a2c:	00f52423          	sw	a5,8(a0)
    80002a30:	00053823          	sd	zero,16(a0)
    80002a34:	00053c23          	sd	zero,24(a0)
    80002a38:	02053023          	sd	zero,32(a0)
    80002a3c:	02052423          	sw	zero,40(a0)
    80002a40:	02053823          	sd	zero,48(a0)
        if (!instance) instance = new PrintMutex;
    80002a44:	00007797          	auipc	a5,0x7
    80002a48:	50a7b223          	sd	a0,1284(a5) # 80009f48 <_ZN10PrintMutex8instanceE>
    80002a4c:	f31ff06f          	j	8000297c <_Z13kprintIntegeri+0x24>
        x = -integer;
    80002a50:	4090053b          	negw	a0,s1
        neg = 1;
    80002a54:	00100593          	li	a1,1
    80002a58:	f45ff06f          	j	8000299c <_Z13kprintIntegeri+0x44>
    80002a5c:	00007797          	auipc	a5,0x7
    80002a60:	4ec7b783          	ld	a5,1260(a5) # 80009f48 <_ZN10PrintMutex8instanceE>
    80002a64:	02078663          	beqz	a5,80002a90 <_Z13kprintIntegeri+0x138>
        getInstance()->mutex.signal();
    80002a68:	00007517          	auipc	a0,0x7
    80002a6c:	4e053503          	ld	a0,1248(a0) # 80009f48 <_ZN10PrintMutex8instanceE>
    80002a70:	00850513          	addi	a0,a0,8
    80002a74:	fffff097          	auipc	ra,0xfffff
    80002a78:	510080e7          	jalr	1296(ra) # 80001f84 <_ZN5Mutex6signalEv>
    PrintMutex::signal();
}
    80002a7c:	02813083          	ld	ra,40(sp)
    80002a80:	02013403          	ld	s0,32(sp)
    80002a84:	01813483          	ld	s1,24(sp)
    80002a88:	03010113          	addi	sp,sp,48
    80002a8c:	00008067          	ret
    80002a90:	00100513          	li	a0,1
    80002a94:	fffff097          	auipc	ra,0xfffff
    80002a98:	234080e7          	jalr	564(ra) # 80001cc8 <_Z7kmallocm>
    80002a9c:	00100793          	li	a5,1
    80002aa0:	00f52423          	sw	a5,8(a0)
    80002aa4:	00053823          	sd	zero,16(a0)
    80002aa8:	00053c23          	sd	zero,24(a0)
    80002aac:	02053023          	sd	zero,32(a0)
    80002ab0:	02052423          	sw	zero,40(a0)
    80002ab4:	02053823          	sd	zero,48(a0)
        if (!instance) instance = new PrintMutex;
    80002ab8:	00007797          	auipc	a5,0x7
    80002abc:	48a7b823          	sd	a0,1168(a5) # 80009f48 <_ZN10PrintMutex8instanceE>
    80002ac0:	fa9ff06f          	j	80002a68 <_Z13kprintIntegeri+0x110>

0000000080002ac4 <_Z14kprintUnsignedm>:

void kprintUnsigned(uint64 x) {
    80002ac4:	fd010113          	addi	sp,sp,-48
    80002ac8:	02113423          	sd	ra,40(sp)
    80002acc:	02813023          	sd	s0,32(sp)
    80002ad0:	00913c23          	sd	s1,24(sp)
    80002ad4:	01213823          	sd	s2,16(sp)
    80002ad8:	03010413          	addi	s0,sp,48
    80002adc:	00050913          	mv	s2,a0
    80002ae0:	00007797          	auipc	a5,0x7
    80002ae4:	4687b783          	ld	a5,1128(a5) # 80009f48 <_ZN10PrintMutex8instanceE>
    80002ae8:	06078a63          	beqz	a5,80002b5c <_Z14kprintUnsignedm+0x98>
        getInstance()->mutex.wait();
    80002aec:	00007517          	auipc	a0,0x7
    80002af0:	45c53503          	ld	a0,1116(a0) # 80009f48 <_ZN10PrintMutex8instanceE>
    80002af4:	00850513          	addi	a0,a0,8
    80002af8:	fffff097          	auipc	ra,0xfffff
    80002afc:	40c080e7          	jalr	1036(ra) # 80001f04 <_ZN5Mutex4waitEv>
    PrintMutex::wait();
    static char digits[] = "0123456789";
    char buf[16];

    int i = 0;
    80002b00:	00000493          	li	s1,0
    do {
        buf[i++] = digits[x % 10];
    80002b04:	00a00693          	li	a3,10
    80002b08:	02d97633          	remu	a2,s2,a3
    80002b0c:	00005717          	auipc	a4,0x5
    80002b10:	6d470713          	addi	a4,a4,1748 # 800081e0 <_ZZ13kprintIntegeriE6digits>
    80002b14:	00c70733          	add	a4,a4,a2
    80002b18:	01074703          	lbu	a4,16(a4)
    80002b1c:	fe040613          	addi	a2,s0,-32
    80002b20:	009607b3          	add	a5,a2,s1
    80002b24:	0014849b          	addiw	s1,s1,1
    80002b28:	fee78823          	sb	a4,-16(a5)
    } while ((x /= 10) != 0);
    80002b2c:	00090713          	mv	a4,s2
    80002b30:	02d95933          	divu	s2,s2,a3
    80002b34:	00900793          	li	a5,9
    80002b38:	fce7e6e3          	bltu	a5,a4,80002b04 <_Z14kprintUnsignedm+0x40>

    while (--i >= 0)
    80002b3c:	fff4849b          	addiw	s1,s1,-1
    80002b40:	0404c863          	bltz	s1,80002b90 <_Z14kprintUnsignedm+0xcc>
        __putc(buf[i]);
    80002b44:	fe040793          	addi	a5,s0,-32
    80002b48:	009787b3          	add	a5,a5,s1
    80002b4c:	ff07c503          	lbu	a0,-16(a5)
    80002b50:	00005097          	auipc	ra,0x5
    80002b54:	8ec080e7          	jalr	-1812(ra) # 8000743c <__putc>
    80002b58:	fe5ff06f          	j	80002b3c <_Z14kprintUnsignedm+0x78>
    80002b5c:	00100513          	li	a0,1
    80002b60:	fffff097          	auipc	ra,0xfffff
    80002b64:	168080e7          	jalr	360(ra) # 80001cc8 <_Z7kmallocm>
    80002b68:	00100793          	li	a5,1
    80002b6c:	00f52423          	sw	a5,8(a0)
    80002b70:	00053823          	sd	zero,16(a0)
    80002b74:	00053c23          	sd	zero,24(a0)
    80002b78:	02053023          	sd	zero,32(a0)
    80002b7c:	02052423          	sw	zero,40(a0)
    80002b80:	02053823          	sd	zero,48(a0)
        if (!instance) instance = new PrintMutex;
    80002b84:	00007797          	auipc	a5,0x7
    80002b88:	3ca7b223          	sd	a0,964(a5) # 80009f48 <_ZN10PrintMutex8instanceE>
    80002b8c:	f61ff06f          	j	80002aec <_Z14kprintUnsignedm+0x28>
    80002b90:	00007797          	auipc	a5,0x7
    80002b94:	3b87b783          	ld	a5,952(a5) # 80009f48 <_ZN10PrintMutex8instanceE>
    80002b98:	02078863          	beqz	a5,80002bc8 <_Z14kprintUnsignedm+0x104>
        getInstance()->mutex.signal();
    80002b9c:	00007517          	auipc	a0,0x7
    80002ba0:	3ac53503          	ld	a0,940(a0) # 80009f48 <_ZN10PrintMutex8instanceE>
    80002ba4:	00850513          	addi	a0,a0,8
    80002ba8:	fffff097          	auipc	ra,0xfffff
    80002bac:	3dc080e7          	jalr	988(ra) # 80001f84 <_ZN5Mutex6signalEv>
    PrintMutex::signal();
}
    80002bb0:	02813083          	ld	ra,40(sp)
    80002bb4:	02013403          	ld	s0,32(sp)
    80002bb8:	01813483          	ld	s1,24(sp)
    80002bbc:	01013903          	ld	s2,16(sp)
    80002bc0:	03010113          	addi	sp,sp,48
    80002bc4:	00008067          	ret
    80002bc8:	00100513          	li	a0,1
    80002bcc:	fffff097          	auipc	ra,0xfffff
    80002bd0:	0fc080e7          	jalr	252(ra) # 80001cc8 <_Z7kmallocm>
    80002bd4:	00100793          	li	a5,1
    80002bd8:	00f52423          	sw	a5,8(a0)
    80002bdc:	00053823          	sd	zero,16(a0)
    80002be0:	00053c23          	sd	zero,24(a0)
    80002be4:	02053023          	sd	zero,32(a0)
    80002be8:	02052423          	sw	zero,40(a0)
    80002bec:	02053823          	sd	zero,48(a0)
        if (!instance) instance = new PrintMutex;
    80002bf0:	00007797          	auipc	a5,0x7
    80002bf4:	34a7bc23          	sd	a0,856(a5) # 80009f48 <_ZN10PrintMutex8instanceE>
    80002bf8:	fa5ff06f          	j	80002b9c <_Z14kprintUnsignedm+0xd8>

0000000080002bfc <_ZN3TCB13threadWrapperEv>:
    TCB::contextSwitch(&old->context, &running->context);

    unlock()
}

void TCB::threadWrapper() {
    80002bfc:	fe010113          	addi	sp,sp,-32
    80002c00:	00113c23          	sd	ra,24(sp)
    80002c04:	00813823          	sd	s0,16(sp)
    80002c08:	00913423          	sd	s1,8(sp)
    80002c0c:	02010413          	addi	s0,sp,32
    Riscv::popSppSpie(running->privileged);
    80002c10:	00007497          	auipc	s1,0x7
    80002c14:	34048493          	addi	s1,s1,832 # 80009f50 <_ZN3TCB7runningE>
    80002c18:	0004b783          	ld	a5,0(s1)
    80002c1c:	0287c503          	lbu	a0,40(a5)
    80002c20:	fffff097          	auipc	ra,0xfffff
    80002c24:	3c8080e7          	jalr	968(ra) # 80001fe8 <_ZN5Riscv10popSppSpieEb>
    running->body(running->args);
    80002c28:	0004b783          	ld	a5,0(s1)
    80002c2c:	0087b703          	ld	a4,8(a5)
    80002c30:	0107b503          	ld	a0,16(a5)
    80002c34:	000700e7          	jalr	a4

    __asm__ volatile ("li a0, 0x12");
    80002c38:	01200513          	li	a0,18
    __asm__ volatile ("ecall");
    80002c3c:	00000073          	ecall
}
    80002c40:	01813083          	ld	ra,24(sp)
    80002c44:	01013403          	ld	s0,16(sp)
    80002c48:	00813483          	ld	s1,8(sp)
    80002c4c:	02010113          	addi	sp,sp,32
    80002c50:	00008067          	ret

0000000080002c54 <_ZN3TCBC1Ev>:
TCB::TCB() {
    80002c54:	fe010113          	addi	sp,sp,-32
    80002c58:	00113c23          	sd	ra,24(sp)
    80002c5c:	00813823          	sd	s0,16(sp)
    80002c60:	00913423          	sd	s1,8(sp)
    80002c64:	02010413          	addi	s0,sp,32
    80002c68:	00050493          	mv	s1,a0
    80002c6c:	00053023          	sd	zero,0(a0)
    80002c70:	00053423          	sd	zero,8(a0)
    80002c74:	00053823          	sd	zero,16(a0)
    80002c78:	00053c23          	sd	zero,24(a0)
    80002c7c:	00001537          	lui	a0,0x1
    80002c80:	fffff097          	auipc	ra,0xfffff
    80002c84:	048080e7          	jalr	72(ra) # 80001cc8 <_Z7kmallocm>
    80002c88:	02a4b023          	sd	a0,32(s1)
    80002c8c:	00100793          	li	a5,1
    80002c90:	02f48423          	sb	a5,40(s1)
    80002c94:	0204b823          	sd	zero,48(s1)
    80002c98:	0204bc23          	sd	zero,56(s1)
    80002c9c:	00200793          	li	a5,2
    80002ca0:	04f4b023          	sd	a5,64(s1)
    80002ca4:	0404a423          	sw	zero,72(s1)
    80002ca8:	0404b823          	sd	zero,80(s1)
    80002cac:	0404bc23          	sd	zero,88(s1)
    80002cb0:	0604b023          	sd	zero,96(s1)
    80002cb4:	0604a423          	sw	zero,104(s1)
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
}
    80002cf0:	01813083          	ld	ra,24(sp)
    80002cf4:	01013403          	ld	s0,16(sp)
    80002cf8:	00813483          	ld	s1,8(sp)
    80002cfc:	02010113          	addi	sp,sp,32
    80002d00:	00008067          	ret

0000000080002d04 <_ZN3TCBC1EPFvPvES0_Pmb>:
TCB::TCB(TCB::Body body, void *args, uint64 *threadStack, bool privileged) :
    80002d04:	fd010113          	addi	sp,sp,-48
    80002d08:	02113423          	sd	ra,40(sp)
    80002d0c:	02813023          	sd	s0,32(sp)
    80002d10:	00913c23          	sd	s1,24(sp)
    80002d14:	01213823          	sd	s2,16(sp)
    80002d18:	01313423          	sd	s3,8(sp)
    80002d1c:	03010413          	addi	s0,sp,48
    80002d20:	00050493          	mv	s1,a0
    80002d24:	00068913          	mv	s2,a3
    80002d28:	00070993          	mv	s3,a4
        context({(uint64) threadWrapper, (uint64) (threadStack + DEFAULT_STACK_SIZE)}) {
    80002d2c:	00053023          	sd	zero,0(a0) # 1000 <_entry-0x7ffff000>
    80002d30:	00b53423          	sd	a1,8(a0)
    80002d34:	00c53823          	sd	a2,16(a0)
    80002d38:	00d53c23          	sd	a3,24(a0)
    80002d3c:	00001537          	lui	a0,0x1
    80002d40:	fffff097          	auipc	ra,0xfffff
    80002d44:	f88080e7          	jalr	-120(ra) # 80001cc8 <_Z7kmallocm>
    80002d48:	02a4b023          	sd	a0,32(s1)
    80002d4c:	03348423          	sb	s3,40(s1)
    80002d50:	00000797          	auipc	a5,0x0
    80002d54:	eac78793          	addi	a5,a5,-340 # 80002bfc <_ZN3TCB13threadWrapperEv>
    80002d58:	02f4b823          	sd	a5,48(s1)
    80002d5c:	000087b7          	lui	a5,0x8
    80002d60:	00f90933          	add	s2,s2,a5
    80002d64:	0324bc23          	sd	s2,56(s1)
    80002d68:	00200713          	li	a4,2
    80002d6c:	04e4b023          	sd	a4,64(s1)
    80002d70:	0404a423          	sw	zero,72(s1)
    80002d74:	05048913          	addi	s2,s1,80
    80002d78:	0404b823          	sd	zero,80(s1)
    80002d7c:	0404bc23          	sd	zero,88(s1)
    80002d80:	0604b023          	sd	zero,96(s1)
    80002d84:	0604a423          	sw	zero,104(s1)
    80002d88:	00100713          	li	a4,1
    80002d8c:	06e4a823          	sw	a4,112(s1)
    80002d90:	0604bc23          	sd	zero,120(s1)
    80002d94:	0804b023          	sd	zero,128(s1)
    80002d98:	0804b423          	sd	zero,136(s1)
    80002d9c:	0804a823          	sw	zero,144(s1)
    80002da0:	0804bc23          	sd	zero,152(s1)
    80002da4:	0a94b023          	sd	s1,160(s1)
    80002da8:	0a04b423          	sd	zero,168(s1)
    80002dac:	0a04b823          	sd	zero,176(s1)
    80002db0:	0a04bc23          	sd	zero,184(s1)
    ssp = (uint64) (kernelStack + DEFAULT_STACK_SIZE);
    80002db4:	00f50533          	add	a0,a0,a5
    80002db8:	00a4b023          	sd	a0,0(s1)
    Scheduler::put(this);
    80002dbc:	00048513          	mv	a0,s1
    80002dc0:	fffff097          	auipc	ra,0xfffff
    80002dc4:	584080e7          	jalr	1412(ra) # 80002344 <_ZN9Scheduler3putEP3TCB>
    80002dc8:	02c0006f          	j	80002df4 <_ZN3TCBC1EPFvPvES0_Pmb+0xf0>
    80002dcc:	00050993          	mv	s3,a0
    80002dd0:	07048513          	addi	a0,s1,112
    80002dd4:	fffff097          	auipc	ra,0xfffff
    80002dd8:	b04080e7          	jalr	-1276(ra) # 800018d8 <_ZN15KernelSemaphoreD1Ev>
        context({(uint64) threadWrapper, (uint64) (threadStack + DEFAULT_STACK_SIZE)}) {
    80002ddc:	00090513          	mv	a0,s2
    80002de0:	00001097          	auipc	ra,0x1
    80002de4:	9f0080e7          	jalr	-1552(ra) # 800037d0 <_ZN10ThreadListD1Ev>
    80002de8:	00098513          	mv	a0,s3
    80002dec:	00008097          	auipc	ra,0x8
    80002df0:	26c080e7          	jalr	620(ra) # 8000b058 <_Unwind_Resume>
}
    80002df4:	02813083          	ld	ra,40(sp)
    80002df8:	02013403          	ld	s0,32(sp)
    80002dfc:	01813483          	ld	s1,24(sp)
    80002e00:	01013903          	ld	s2,16(sp)
    80002e04:	00813983          	ld	s3,8(sp)
    80002e08:	03010113          	addi	sp,sp,48
    80002e0c:	00008067          	ret

0000000080002e10 <_ZN3TCB18createKernelThreadEPFvPvES0_Pm>:
TCB *TCB::createKernelThread(TCB::Body body, void *args, uint64 *threadStack) {
    80002e10:	fd010113          	addi	sp,sp,-48
    80002e14:	02113423          	sd	ra,40(sp)
    80002e18:	02813023          	sd	s0,32(sp)
    80002e1c:	00913c23          	sd	s1,24(sp)
    80002e20:	01213823          	sd	s2,16(sp)
    80002e24:	01313423          	sd	s3,8(sp)
    80002e28:	01413023          	sd	s4,0(sp)
    80002e2c:	03010413          	addi	s0,sp,48
    if (!body) return nullptr;
    80002e30:	02050e63          	beqz	a0,80002e6c <_ZN3TCB18createKernelThreadEPFvPvES0_Pm+0x5c>
    80002e34:	00050493          	mv	s1,a0
    80002e38:	00058913          	mv	s2,a1
    80002e3c:	00060993          	mv	s3,a2
    80002e40:	00300513          	li	a0,3
    80002e44:	fffff097          	auipc	ra,0xfffff
    80002e48:	e84080e7          	jalr	-380(ra) # 80001cc8 <_Z7kmallocm>
    80002e4c:	00050a13          	mv	s4,a0
    return new TCB(body, args, threadStack, true);
    80002e50:	00100713          	li	a4,1
    80002e54:	00098693          	mv	a3,s3
    80002e58:	00090613          	mv	a2,s2
    80002e5c:	00048593          	mv	a1,s1
    80002e60:	00000097          	auipc	ra,0x0
    80002e64:	ea4080e7          	jalr	-348(ra) # 80002d04 <_ZN3TCBC1EPFvPvES0_Pmb>
    80002e68:	0080006f          	j	80002e70 <_ZN3TCB18createKernelThreadEPFvPvES0_Pm+0x60>
    if (!body) return nullptr;
    80002e6c:	00000a13          	li	s4,0
}
    80002e70:	000a0513          	mv	a0,s4
    80002e74:	02813083          	ld	ra,40(sp)
    80002e78:	02013403          	ld	s0,32(sp)
    80002e7c:	01813483          	ld	s1,24(sp)
    80002e80:	01013903          	ld	s2,16(sp)
    80002e84:	00813983          	ld	s3,8(sp)
    80002e88:	00013a03          	ld	s4,0(sp)
    80002e8c:	03010113          	addi	sp,sp,48
    80002e90:	00008067          	ret
    80002e94:	00050493          	mv	s1,a0
        kfree(addr);
    80002e98:	000a0513          	mv	a0,s4
    80002e9c:	fffff097          	auipc	ra,0xfffff
    80002ea0:	028080e7          	jalr	40(ra) # 80001ec4 <_Z5kfreePv>
    80002ea4:	00048513          	mv	a0,s1
    80002ea8:	00008097          	auipc	ra,0x8
    80002eac:	1b0080e7          	jalr	432(ra) # 8000b058 <_Unwind_Resume>

0000000080002eb0 <_ZN3TCB18createKernelThreadEPFvPvES0_>:
    if (!body) return nullptr;
    80002eb0:	04050e63          	beqz	a0,80002f0c <_ZN3TCB18createKernelThreadEPFvPvES0_+0x5c>
TCB *TCB::createKernelThread(TCB::Body body, void *args) {
    80002eb4:	fe010113          	addi	sp,sp,-32
    80002eb8:	00113c23          	sd	ra,24(sp)
    80002ebc:	00813823          	sd	s0,16(sp)
    80002ec0:	00913423          	sd	s1,8(sp)
    80002ec4:	01213023          	sd	s2,0(sp)
    80002ec8:	02010413          	addi	s0,sp,32
    80002ecc:	00050493          	mv	s1,a0
    80002ed0:	00058913          	mv	s2,a1
    uint64 *threadStack = (uint64 *) kmalloc(DEFAULT_STACK_SIZE * sizeof(uint64));
    80002ed4:	00008537          	lui	a0,0x8
    80002ed8:	fffff097          	auipc	ra,0xfffff
    80002edc:	df0080e7          	jalr	-528(ra) # 80001cc8 <_Z7kmallocm>
    80002ee0:	00050613          	mv	a2,a0
    return createKernelThread(body, args, threadStack);
    80002ee4:	00090593          	mv	a1,s2
    80002ee8:	00048513          	mv	a0,s1
    80002eec:	00000097          	auipc	ra,0x0
    80002ef0:	f24080e7          	jalr	-220(ra) # 80002e10 <_ZN3TCB18createKernelThreadEPFvPvES0_Pm>
}
    80002ef4:	01813083          	ld	ra,24(sp)
    80002ef8:	01013403          	ld	s0,16(sp)
    80002efc:	00813483          	ld	s1,8(sp)
    80002f00:	00013903          	ld	s2,0(sp)
    80002f04:	02010113          	addi	sp,sp,32
    80002f08:	00008067          	ret
    if (!body) return nullptr;
    80002f0c:	00000513          	li	a0,0
}
    80002f10:	00008067          	ret

0000000080002f14 <_ZN3TCB16createUserThreadEPFvPvES0_Pm>:
TCB *TCB::createUserThread(TCB::Body body, void *args, uint64 *threadStack) {
    80002f14:	fd010113          	addi	sp,sp,-48
    80002f18:	02113423          	sd	ra,40(sp)
    80002f1c:	02813023          	sd	s0,32(sp)
    80002f20:	00913c23          	sd	s1,24(sp)
    80002f24:	01213823          	sd	s2,16(sp)
    80002f28:	01313423          	sd	s3,8(sp)
    80002f2c:	01413023          	sd	s4,0(sp)
    80002f30:	03010413          	addi	s0,sp,48
    if (!body) return nullptr;
    80002f34:	02050e63          	beqz	a0,80002f70 <_ZN3TCB16createUserThreadEPFvPvES0_Pm+0x5c>
    80002f38:	00050493          	mv	s1,a0
    80002f3c:	00058913          	mv	s2,a1
    80002f40:	00060993          	mv	s3,a2
        return kmalloc(size);
    80002f44:	00300513          	li	a0,3
    80002f48:	fffff097          	auipc	ra,0xfffff
    80002f4c:	d80080e7          	jalr	-640(ra) # 80001cc8 <_Z7kmallocm>
    80002f50:	00050a13          	mv	s4,a0
    return new TCB(body, args, threadStack, false);
    80002f54:	00000713          	li	a4,0
    80002f58:	00098693          	mv	a3,s3
    80002f5c:	00090613          	mv	a2,s2
    80002f60:	00048593          	mv	a1,s1
    80002f64:	00000097          	auipc	ra,0x0
    80002f68:	da0080e7          	jalr	-608(ra) # 80002d04 <_ZN3TCBC1EPFvPvES0_Pmb>
    80002f6c:	0080006f          	j	80002f74 <_ZN3TCB16createUserThreadEPFvPvES0_Pm+0x60>
    if (!body) return nullptr;
    80002f70:	00000a13          	li	s4,0
}
    80002f74:	000a0513          	mv	a0,s4
    80002f78:	02813083          	ld	ra,40(sp)
    80002f7c:	02013403          	ld	s0,32(sp)
    80002f80:	01813483          	ld	s1,24(sp)
    80002f84:	01013903          	ld	s2,16(sp)
    80002f88:	00813983          	ld	s3,8(sp)
    80002f8c:	00013a03          	ld	s4,0(sp)
    80002f90:	03010113          	addi	sp,sp,48
    80002f94:	00008067          	ret
    80002f98:	00050493          	mv	s1,a0
        kfree(addr);
    80002f9c:	000a0513          	mv	a0,s4
    80002fa0:	fffff097          	auipc	ra,0xfffff
    80002fa4:	f24080e7          	jalr	-220(ra) # 80001ec4 <_Z5kfreePv>
    80002fa8:	00048513          	mv	a0,s1
    80002fac:	00008097          	auipc	ra,0x8
    80002fb0:	0ac080e7          	jalr	172(ra) # 8000b058 <_Unwind_Resume>

0000000080002fb4 <_ZN3TCB16createUserThreadEPFvPvES0_>:
    if (!body) return nullptr;
    80002fb4:	04050e63          	beqz	a0,80003010 <_ZN3TCB16createUserThreadEPFvPvES0_+0x5c>
TCB *TCB::createUserThread(TCB::Body body, void *args) {
    80002fb8:	fe010113          	addi	sp,sp,-32
    80002fbc:	00113c23          	sd	ra,24(sp)
    80002fc0:	00813823          	sd	s0,16(sp)
    80002fc4:	00913423          	sd	s1,8(sp)
    80002fc8:	01213023          	sd	s2,0(sp)
    80002fcc:	02010413          	addi	s0,sp,32
    80002fd0:	00050493          	mv	s1,a0
    80002fd4:	00058913          	mv	s2,a1
    uint64 *threadStack = (uint64 *) kmalloc(DEFAULT_STACK_SIZE * sizeof(uint64));
    80002fd8:	00008537          	lui	a0,0x8
    80002fdc:	fffff097          	auipc	ra,0xfffff
    80002fe0:	cec080e7          	jalr	-788(ra) # 80001cc8 <_Z7kmallocm>
    80002fe4:	00050613          	mv	a2,a0
    return createUserThread(body, args, threadStack);
    80002fe8:	00090593          	mv	a1,s2
    80002fec:	00048513          	mv	a0,s1
    80002ff0:	00000097          	auipc	ra,0x0
    80002ff4:	f24080e7          	jalr	-220(ra) # 80002f14 <_ZN3TCB16createUserThreadEPFvPvES0_Pm>
}
    80002ff8:	01813083          	ld	ra,24(sp)
    80002ffc:	01013403          	ld	s0,16(sp)
    80003000:	00813483          	ld	s1,8(sp)
    80003004:	00013903          	ld	s2,0(sp)
    80003008:	02010113          	addi	sp,sp,32
    8000300c:	00008067          	ret
    if (!body) return nullptr;
    80003010:	00000513          	li	a0,0
}
    80003014:	00008067          	ret

0000000080003018 <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    80003018:	fd010113          	addi	sp,sp,-48
    8000301c:	02113423          	sd	ra,40(sp)
    80003020:	02813023          	sd	s0,32(sp)
    80003024:	00913c23          	sd	s1,24(sp)
    80003028:	03010413          	addi	s0,sp,48
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    8000302c:	100027f3          	csrr	a5,sstatus
    80003030:	fcf43823          	sd	a5,-48(s0)
    return sstatus;
    80003034:	fd043783          	ld	a5,-48(s0)
    lock()
    80003038:	fcf43c23          	sd	a5,-40(s0)
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    8000303c:	00200793          	li	a5,2
    80003040:	1007b073          	csrc	sstatus,a5
    TCB *old = running;
    80003044:	00007497          	auipc	s1,0x7
    80003048:	f0c4b483          	ld	s1,-244(s1) # 80009f50 <_ZN3TCB7runningE>
        return status == READY;
    8000304c:	0484a783          	lw	a5,72(s1)
    if (old->isReady()) Scheduler::put(old);
    80003050:	04078e63          	beqz	a5,800030ac <_ZN3TCB8dispatchEv+0x94>
    else if (old->isFinished()) {
    80003054:	00100713          	li	a4,1
    80003058:	06e78263          	beq	a5,a4,800030bc <_ZN3TCB8dispatchEv+0xa4>
    running = Scheduler::get();
    8000305c:	fffff097          	auipc	ra,0xfffff
    80003060:	27c080e7          	jalr	636(ra) # 800022d8 <_ZN9Scheduler3getEv>
    80003064:	00007797          	auipc	a5,0x7
    80003068:	eea7b623          	sd	a0,-276(a5) # 80009f50 <_ZN3TCB7runningE>
    if (!running) {
    8000306c:	04050e63          	beqz	a0,800030c8 <_ZN3TCB8dispatchEv+0xb0>
    TCB::timeSliceCounter = 0;
    80003070:	00007797          	auipc	a5,0x7
    80003074:	ee078793          	addi	a5,a5,-288 # 80009f50 <_ZN3TCB7runningE>
    80003078:	0007b423          	sd	zero,8(a5)
    TCB::contextSwitch(&old->context, &running->context);
    8000307c:	0007b583          	ld	a1,0(a5)
    80003080:	03058593          	addi	a1,a1,48
    80003084:	03048513          	addi	a0,s1,48
    80003088:	ffffe097          	auipc	ra,0xffffe
    8000308c:	f78080e7          	jalr	-136(ra) # 80001000 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
    unlock()
    80003090:	fd843783          	ld	a5,-40(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80003094:	10079073          	csrw	sstatus,a5
}
    80003098:	02813083          	ld	ra,40(sp)
    8000309c:	02013403          	ld	s0,32(sp)
    800030a0:	01813483          	ld	s1,24(sp)
    800030a4:	03010113          	addi	sp,sp,48
    800030a8:	00008067          	ret
    if (old->isReady()) Scheduler::put(old);
    800030ac:	00048513          	mv	a0,s1
    800030b0:	fffff097          	auipc	ra,0xfffff
    800030b4:	294080e7          	jalr	660(ra) # 80002344 <_ZN9Scheduler3putEP3TCB>
    800030b8:	fa5ff06f          	j	8000305c <_ZN3TCB8dispatchEv+0x44>
        ThreadCollector::signal();
    800030bc:	00000097          	auipc	ra,0x0
    800030c0:	3a4080e7          	jalr	932(ra) # 80003460 <_ZN15ThreadCollector6signalEv>
    800030c4:	f99ff06f          	j	8000305c <_ZN3TCB8dispatchEv+0x44>
        running = IdleThread::getIdleThread();
    800030c8:	ffffe097          	auipc	ra,0xffffe
    800030cc:	22c080e7          	jalr	556(ra) # 800012f4 <_ZN10IdleThread13getIdleThreadEv>
    800030d0:	00007797          	auipc	a5,0x7
    800030d4:	e8a7b023          	sd	a0,-384(a5) # 80009f50 <_ZN3TCB7runningE>
    800030d8:	f99ff06f          	j	80003070 <_ZN3TCB8dispatchEv+0x58>

00000000800030dc <_ZN3TCB4exitEv>:
void TCB::exit() {
    800030dc:	ff010113          	addi	sp,sp,-16
    800030e0:	00113423          	sd	ra,8(sp)
    800030e4:	00813023          	sd	s0,0(sp)
    800030e8:	01010413          	addi	s0,sp,16
    running->setFinished();
    800030ec:	00007517          	auipc	a0,0x7
    800030f0:	e6453503          	ld	a0,-412(a0) # 80009f50 <_ZN3TCB7runningE>
        status = FINISHED;
    800030f4:	00100793          	li	a5,1
    800030f8:	04f52423          	sw	a5,72(a0)
    running->mutex.wait();
    800030fc:	07050513          	addi	a0,a0,112
    80003100:	fffff097          	auipc	ra,0xfffff
    80003104:	e04080e7          	jalr	-508(ra) # 80001f04 <_ZN5Mutex4waitEv>
    while (!running->waitingToJoin.isEmpty()) {
    80003108:	00007517          	auipc	a0,0x7
    8000310c:	e4853503          	ld	a0,-440(a0) # 80009f50 <_ZN3TCB7runningE>
        return size == 0;
    80003110:	06852783          	lw	a5,104(a0)
    80003114:	02078063          	beqz	a5,80003134 <_ZN3TCB4exitEv+0x58>
        TCB *thr = running->waitingToJoin.removeFirst();
    80003118:	05050513          	addi	a0,a0,80
    8000311c:	00000097          	auipc	ra,0x0
    80003120:	510080e7          	jalr	1296(ra) # 8000362c <_ZN10ThreadList11removeFirstEv>
        status = READY;
    80003124:	04052423          	sw	zero,72(a0)
        Scheduler::put(thr);
    80003128:	fffff097          	auipc	ra,0xfffff
    8000312c:	21c080e7          	jalr	540(ra) # 80002344 <_ZN9Scheduler3putEP3TCB>
    while (!running->waitingToJoin.isEmpty()) {
    80003130:	fd9ff06f          	j	80003108 <_ZN3TCB4exitEv+0x2c>
    running->mutex.signal();
    80003134:	07050513          	addi	a0,a0,112
    80003138:	fffff097          	auipc	ra,0xfffff
    8000313c:	e4c080e7          	jalr	-436(ra) # 80001f84 <_ZN5Mutex6signalEv>
    ThreadCollector::put(running);
    80003140:	00007517          	auipc	a0,0x7
    80003144:	e1053503          	ld	a0,-496(a0) # 80009f50 <_ZN3TCB7runningE>
    80003148:	00000097          	auipc	ra,0x0
    8000314c:	34c080e7          	jalr	844(ra) # 80003494 <_ZN15ThreadCollector3putEP3TCB>
    dispatch();
    80003150:	00000097          	auipc	ra,0x0
    80003154:	ec8080e7          	jalr	-312(ra) # 80003018 <_ZN3TCB8dispatchEv>
}
    80003158:	00813083          	ld	ra,8(sp)
    8000315c:	00013403          	ld	s0,0(sp)
    80003160:	01010113          	addi	sp,sp,16
    80003164:	00008067          	ret

0000000080003168 <_ZN3TCB4joinEv>:
        return status == FINISHED;
    80003168:	04852703          	lw	a4,72(a0)

int TCB::join() {
    if (isFinished()) return 0;
    8000316c:	00100793          	li	a5,1
    80003170:	06f70c63          	beq	a4,a5,800031e8 <_ZN3TCB4joinEv+0x80>
int TCB::join() {
    80003174:	fe010113          	addi	sp,sp,-32
    80003178:	00113c23          	sd	ra,24(sp)
    8000317c:	00813823          	sd	s0,16(sp)
    80003180:	00913423          	sd	s1,8(sp)
    80003184:	01213023          	sd	s2,0(sp)
    80003188:	02010413          	addi	s0,sp,32
    8000318c:	00050493          	mv	s1,a0

    mutex.wait();
    80003190:	07050913          	addi	s2,a0,112
    80003194:	00090513          	mv	a0,s2
    80003198:	fffff097          	auipc	ra,0xfffff
    8000319c:	d6c080e7          	jalr	-660(ra) # 80001f04 <_ZN5Mutex4waitEv>

    running->setBlocked();
    800031a0:	00007597          	auipc	a1,0x7
    800031a4:	db05b583          	ld	a1,-592(a1) # 80009f50 <_ZN3TCB7runningE>
        status = BLOCKED;
    800031a8:	00200793          	li	a5,2
    800031ac:	04f5a423          	sw	a5,72(a1)
    waitingToJoin.addLast(&running->node);
    800031b0:	0a058593          	addi	a1,a1,160
    800031b4:	05048513          	addi	a0,s1,80
    800031b8:	00000097          	auipc	ra,0x0
    800031bc:	430080e7          	jalr	1072(ra) # 800035e8 <_ZN10ThreadList7addLastEP10ThreadNode>

    mutex.signal();
    800031c0:	00090513          	mv	a0,s2
    800031c4:	fffff097          	auipc	ra,0xfffff
    800031c8:	dc0080e7          	jalr	-576(ra) # 80001f84 <_ZN5Mutex6signalEv>

    return 0;
}
    800031cc:	00000513          	li	a0,0
    800031d0:	01813083          	ld	ra,24(sp)
    800031d4:	01013403          	ld	s0,16(sp)
    800031d8:	00813483          	ld	s1,8(sp)
    800031dc:	00013903          	ld	s2,0(sp)
    800031e0:	02010113          	addi	sp,sp,32
    800031e4:	00008067          	ret
    800031e8:	00000513          	li	a0,0
    800031ec:	00008067          	ret

00000000800031f0 <_ZN3TCBD1Ev>:

TCB::~TCB() {
    800031f0:	fe010113          	addi	sp,sp,-32
    800031f4:	00113c23          	sd	ra,24(sp)
    800031f8:	00813823          	sd	s0,16(sp)
    800031fc:	00913423          	sd	s1,8(sp)
    80003200:	02010413          	addi	s0,sp,32
    80003204:	00050493          	mv	s1,a0
    kfree(kernelStack);
    80003208:	02053503          	ld	a0,32(a0)
    8000320c:	fffff097          	auipc	ra,0xfffff
    80003210:	cb8080e7          	jalr	-840(ra) # 80001ec4 <_Z5kfreePv>
    kfree(threadStack);
    80003214:	0184b503          	ld	a0,24(s1)
    80003218:	fffff097          	auipc	ra,0xfffff
    8000321c:	cac080e7          	jalr	-852(ra) # 80001ec4 <_Z5kfreePv>
    80003220:	07048513          	addi	a0,s1,112
    80003224:	ffffe097          	auipc	ra,0xffffe
    80003228:	6b4080e7          	jalr	1716(ra) # 800018d8 <_ZN15KernelSemaphoreD1Ev>
TCB::~TCB() {
    8000322c:	05048513          	addi	a0,s1,80
    80003230:	00000097          	auipc	ra,0x0
    80003234:	5a0080e7          	jalr	1440(ra) # 800037d0 <_ZN10ThreadListD1Ev>
}
    80003238:	01813083          	ld	ra,24(sp)
    8000323c:	01013403          	ld	s0,16(sp)
    80003240:	00813483          	ld	s1,8(sp)
    80003244:	02010113          	addi	sp,sp,32
    80003248:	00008067          	ret

000000008000324c <_ZN15ThreadCollectorC1Ev>:
    getInstance()->mutex.wait();
    getInstance()->finishedThreads.addLast(tcb->getNode());
    getInstance()->mutex.signal();
}

ThreadCollector::ThreadCollector() : readyToDelete(0) {
    8000324c:	fd010113          	addi	sp,sp,-48
    80003250:	02113423          	sd	ra,40(sp)
    80003254:	02813023          	sd	s0,32(sp)
    80003258:	00913c23          	sd	s1,24(sp)
    8000325c:	01213823          	sd	s2,16(sp)
    80003260:	01313423          	sd	s3,8(sp)
    80003264:	01413023          	sd	s4,0(sp)
    80003268:	03010413          	addi	s0,sp,48
    8000326c:	00050493          	mv	s1,a0
    80003270:	00053023          	sd	zero,0(a0)
    80003274:	00850913          	addi	s2,a0,8
    explicit ThreadList() = default;
    80003278:	00053423          	sd	zero,8(a0)
    8000327c:	00053823          	sd	zero,16(a0)
    80003280:	00053c23          	sd	zero,24(a0)
    80003284:	02052023          	sw	zero,32(a0)
    80003288:	00100793          	li	a5,1
    8000328c:	02f52423          	sw	a5,40(a0)
    80003290:	02053823          	sd	zero,48(a0)
    80003294:	02053c23          	sd	zero,56(a0)
    80003298:	04053023          	sd	zero,64(a0)
    8000329c:	04052423          	sw	zero,72(a0)
    800032a0:	04053823          	sd	zero,80(a0)
    800032a4:	05850993          	addi	s3,a0,88
    800032a8:	04052c23          	sw	zero,88(a0)
    800032ac:	06053023          	sd	zero,96(a0)
    800032b0:	06053423          	sd	zero,104(a0)
    800032b4:	06053823          	sd	zero,112(a0)
    800032b8:	06052c23          	sw	zero,120(a0)
    threadCollector = TCB::createKernelThread([](void *){ThreadCollector::run();}, nullptr);
    800032bc:	00000593          	li	a1,0
    800032c0:	00000517          	auipc	a0,0x0
    800032c4:	2c850513          	addi	a0,a0,712 # 80003588 <_ZZN15ThreadCollectorC4EvENUlPvE_4_FUNES0_>
    800032c8:	00000097          	auipc	ra,0x0
    800032cc:	be8080e7          	jalr	-1048(ra) # 80002eb0 <_ZN3TCB18createKernelThreadEPFvPvES0_>
    800032d0:	00a4b023          	sd	a0,0(s1)
}
    800032d4:	02813083          	ld	ra,40(sp)
    800032d8:	02013403          	ld	s0,32(sp)
    800032dc:	01813483          	ld	s1,24(sp)
    800032e0:	01013903          	ld	s2,16(sp)
    800032e4:	00813983          	ld	s3,8(sp)
    800032e8:	00013a03          	ld	s4,0(sp)
    800032ec:	03010113          	addi	sp,sp,48
    800032f0:	00008067          	ret
    800032f4:	00050a13          	mv	s4,a0
ThreadCollector::ThreadCollector() : readyToDelete(0) {
    800032f8:	00098513          	mv	a0,s3
    800032fc:	ffffe097          	auipc	ra,0xffffe
    80003300:	5dc080e7          	jalr	1500(ra) # 800018d8 <_ZN15KernelSemaphoreD1Ev>
    80003304:	02848513          	addi	a0,s1,40
    80003308:	ffffe097          	auipc	ra,0xffffe
    8000330c:	5d0080e7          	jalr	1488(ra) # 800018d8 <_ZN15KernelSemaphoreD1Ev>
    80003310:	00090513          	mv	a0,s2
    80003314:	00000097          	auipc	ra,0x0
    80003318:	4bc080e7          	jalr	1212(ra) # 800037d0 <_ZN10ThreadListD1Ev>
    8000331c:	000a0513          	mv	a0,s4
    80003320:	00008097          	auipc	ra,0x8
    80003324:	d38080e7          	jalr	-712(ra) # 8000b058 <_Unwind_Resume>

0000000080003328 <_ZN15ThreadCollectorD1Ev>:
        delete getInstance()->finishedThreads.removeFirst();
        getInstance()->mutex.signal();
    }
}

ThreadCollector::~ThreadCollector() {
    80003328:	fe010113          	addi	sp,sp,-32
    8000332c:	00113c23          	sd	ra,24(sp)
    80003330:	00813823          	sd	s0,16(sp)
    80003334:	00913423          	sd	s1,8(sp)
    80003338:	01213023          	sd	s2,0(sp)
    8000333c:	02010413          	addi	s0,sp,32
    80003340:	00050913          	mv	s2,a0
        return size == 0;
    80003344:	02092783          	lw	a5,32(s2)
    while (!finishedThreads.isEmpty()) {
    80003348:	02078863          	beqz	a5,80003378 <_ZN15ThreadCollectorD1Ev+0x50>
        delete finishedThreads.removeFirst();
    8000334c:	00890513          	addi	a0,s2,8
    80003350:	00000097          	auipc	ra,0x0
    80003354:	2dc080e7          	jalr	732(ra) # 8000362c <_ZN10ThreadList11removeFirstEv>
    80003358:	00050493          	mv	s1,a0
    8000335c:	fe0504e3          	beqz	a0,80003344 <_ZN15ThreadCollectorD1Ev+0x1c>
    80003360:	00000097          	auipc	ra,0x0
    80003364:	e90080e7          	jalr	-368(ra) # 800031f0 <_ZN3TCBD1Ev>
    80003368:	00048513          	mv	a0,s1
    8000336c:	fffff097          	auipc	ra,0xfffff
    80003370:	b58080e7          	jalr	-1192(ra) # 80001ec4 <_Z5kfreePv>
    }
    80003374:	fd1ff06f          	j	80003344 <_ZN15ThreadCollectorD1Ev+0x1c>
    }
    delete threadCollector;
    80003378:	00093483          	ld	s1,0(s2)
    8000337c:	00048e63          	beqz	s1,80003398 <_ZN15ThreadCollectorD1Ev+0x70>
    80003380:	00048513          	mv	a0,s1
    80003384:	00000097          	auipc	ra,0x0
    80003388:	e6c080e7          	jalr	-404(ra) # 800031f0 <_ZN3TCBD1Ev>
        kfree(addr);
    8000338c:	00048513          	mv	a0,s1
    80003390:	fffff097          	auipc	ra,0xfffff
    80003394:	b34080e7          	jalr	-1228(ra) # 80001ec4 <_Z5kfreePv>
ThreadCollector::~ThreadCollector() {
    80003398:	05890513          	addi	a0,s2,88
    8000339c:	ffffe097          	auipc	ra,0xffffe
    800033a0:	53c080e7          	jalr	1340(ra) # 800018d8 <_ZN15KernelSemaphoreD1Ev>
    800033a4:	02890513          	addi	a0,s2,40
    800033a8:	ffffe097          	auipc	ra,0xffffe
    800033ac:	530080e7          	jalr	1328(ra) # 800018d8 <_ZN15KernelSemaphoreD1Ev>
    800033b0:	00890513          	addi	a0,s2,8
    800033b4:	00000097          	auipc	ra,0x0
    800033b8:	41c080e7          	jalr	1052(ra) # 800037d0 <_ZN10ThreadListD1Ev>
}
    800033bc:	01813083          	ld	ra,24(sp)
    800033c0:	01013403          	ld	s0,16(sp)
    800033c4:	00813483          	ld	s1,8(sp)
    800033c8:	00013903          	ld	s2,0(sp)
    800033cc:	02010113          	addi	sp,sp,32
    800033d0:	00008067          	ret

00000000800033d4 <_ZN15ThreadCollector11getInstanceEv>:

ThreadCollector *ThreadCollector::getInstance() {
    if (!instance) instance = new ThreadCollector;
    800033d4:	00007797          	auipc	a5,0x7
    800033d8:	b8c7b783          	ld	a5,-1140(a5) # 80009f60 <_ZN15ThreadCollector8instanceE>
    800033dc:	00078863          	beqz	a5,800033ec <_ZN15ThreadCollector11getInstanceEv+0x18>
    return instance;
    800033e0:	00007517          	auipc	a0,0x7
    800033e4:	b8053503          	ld	a0,-1152(a0) # 80009f60 <_ZN15ThreadCollector8instanceE>
}
    800033e8:	00008067          	ret
ThreadCollector *ThreadCollector::getInstance() {
    800033ec:	fe010113          	addi	sp,sp,-32
    800033f0:	00113c23          	sd	ra,24(sp)
    800033f4:	00813823          	sd	s0,16(sp)
    800033f8:	00913423          	sd	s1,8(sp)
    800033fc:	01213023          	sd	s2,0(sp)
    80003400:	02010413          	addi	s0,sp,32
        return kmalloc(size);
    80003404:	00200513          	li	a0,2
    80003408:	fffff097          	auipc	ra,0xfffff
    8000340c:	8c0080e7          	jalr	-1856(ra) # 80001cc8 <_Z7kmallocm>
    80003410:	00050493          	mv	s1,a0
    if (!instance) instance = new ThreadCollector;
    80003414:	00000097          	auipc	ra,0x0
    80003418:	e38080e7          	jalr	-456(ra) # 8000324c <_ZN15ThreadCollectorC1Ev>
    8000341c:	00007797          	auipc	a5,0x7
    80003420:	b497b223          	sd	s1,-1212(a5) # 80009f60 <_ZN15ThreadCollector8instanceE>
    return instance;
    80003424:	00007517          	auipc	a0,0x7
    80003428:	b3c53503          	ld	a0,-1220(a0) # 80009f60 <_ZN15ThreadCollector8instanceE>
}
    8000342c:	01813083          	ld	ra,24(sp)
    80003430:	01013403          	ld	s0,16(sp)
    80003434:	00813483          	ld	s1,8(sp)
    80003438:	00013903          	ld	s2,0(sp)
    8000343c:	02010113          	addi	sp,sp,32
    80003440:	00008067          	ret
    80003444:	00050913          	mv	s2,a0
        kfree(addr);
    80003448:	00048513          	mv	a0,s1
    8000344c:	fffff097          	auipc	ra,0xfffff
    80003450:	a78080e7          	jalr	-1416(ra) # 80001ec4 <_Z5kfreePv>
    80003454:	00090513          	mv	a0,s2
    80003458:	00008097          	auipc	ra,0x8
    8000345c:	c00080e7          	jalr	-1024(ra) # 8000b058 <_Unwind_Resume>

0000000080003460 <_ZN15ThreadCollector6signalEv>:
void ThreadCollector::signal() {
    80003460:	ff010113          	addi	sp,sp,-16
    80003464:	00113423          	sd	ra,8(sp)
    80003468:	00813023          	sd	s0,0(sp)
    8000346c:	01010413          	addi	s0,sp,16
    getInstance()->readyToDelete.signal();
    80003470:	00000097          	auipc	ra,0x0
    80003474:	f64080e7          	jalr	-156(ra) # 800033d4 <_ZN15ThreadCollector11getInstanceEv>
    80003478:	05850513          	addi	a0,a0,88
    8000347c:	ffffe097          	auipc	ra,0xffffe
    80003480:	400080e7          	jalr	1024(ra) # 8000187c <_ZN15KernelSemaphore6signalEv>
}
    80003484:	00813083          	ld	ra,8(sp)
    80003488:	00013403          	ld	s0,0(sp)
    8000348c:	01010113          	addi	sp,sp,16
    80003490:	00008067          	ret

0000000080003494 <_ZN15ThreadCollector3putEP3TCB>:
void ThreadCollector::put(TCB *tcb) {
    80003494:	fe010113          	addi	sp,sp,-32
    80003498:	00113c23          	sd	ra,24(sp)
    8000349c:	00813823          	sd	s0,16(sp)
    800034a0:	00913423          	sd	s1,8(sp)
    800034a4:	02010413          	addi	s0,sp,32
    800034a8:	00050493          	mv	s1,a0
    getInstance()->mutex.wait();
    800034ac:	00000097          	auipc	ra,0x0
    800034b0:	f28080e7          	jalr	-216(ra) # 800033d4 <_ZN15ThreadCollector11getInstanceEv>
    800034b4:	02850513          	addi	a0,a0,40
    800034b8:	fffff097          	auipc	ra,0xfffff
    800034bc:	a4c080e7          	jalr	-1460(ra) # 80001f04 <_ZN5Mutex4waitEv>
    getInstance()->finishedThreads.addLast(tcb->getNode());
    800034c0:	00000097          	auipc	ra,0x0
    800034c4:	f14080e7          	jalr	-236(ra) # 800033d4 <_ZN15ThreadCollector11getInstanceEv>
    800034c8:	0a048593          	addi	a1,s1,160
    800034cc:	00850513          	addi	a0,a0,8
    800034d0:	00000097          	auipc	ra,0x0
    800034d4:	118080e7          	jalr	280(ra) # 800035e8 <_ZN10ThreadList7addLastEP10ThreadNode>
    getInstance()->mutex.signal();
    800034d8:	00000097          	auipc	ra,0x0
    800034dc:	efc080e7          	jalr	-260(ra) # 800033d4 <_ZN15ThreadCollector11getInstanceEv>
    800034e0:	02850513          	addi	a0,a0,40
    800034e4:	fffff097          	auipc	ra,0xfffff
    800034e8:	aa0080e7          	jalr	-1376(ra) # 80001f84 <_ZN5Mutex6signalEv>
}
    800034ec:	01813083          	ld	ra,24(sp)
    800034f0:	01013403          	ld	s0,16(sp)
    800034f4:	00813483          	ld	s1,8(sp)
    800034f8:	02010113          	addi	sp,sp,32
    800034fc:	00008067          	ret

0000000080003500 <_ZN15ThreadCollector3runEv>:
[[noreturn]] void ThreadCollector::run() {
    80003500:	fe010113          	addi	sp,sp,-32
    80003504:	00113c23          	sd	ra,24(sp)
    80003508:	00813823          	sd	s0,16(sp)
    8000350c:	00913423          	sd	s1,8(sp)
    80003510:	02010413          	addi	s0,sp,32
    80003514:	0300006f          	j	80003544 <_ZN15ThreadCollector3runEv+0x44>
    80003518:	00050493          	mv	s1,a0
        delete getInstance()->finishedThreads.removeFirst();
    8000351c:	00000097          	auipc	ra,0x0
    80003520:	cd4080e7          	jalr	-812(ra) # 800031f0 <_ZN3TCBD1Ev>
    80003524:	00048513          	mv	a0,s1
    80003528:	fffff097          	auipc	ra,0xfffff
    8000352c:	99c080e7          	jalr	-1636(ra) # 80001ec4 <_Z5kfreePv>
        getInstance()->mutex.signal();
    80003530:	00000097          	auipc	ra,0x0
    80003534:	ea4080e7          	jalr	-348(ra) # 800033d4 <_ZN15ThreadCollector11getInstanceEv>
    80003538:	02850513          	addi	a0,a0,40
    8000353c:	fffff097          	auipc	ra,0xfffff
    80003540:	a48080e7          	jalr	-1464(ra) # 80001f84 <_ZN5Mutex6signalEv>
        getInstance()->readyToDelete.wait();
    80003544:	00000097          	auipc	ra,0x0
    80003548:	e90080e7          	jalr	-368(ra) # 800033d4 <_ZN15ThreadCollector11getInstanceEv>
    8000354c:	05850513          	addi	a0,a0,88
    80003550:	ffffe097          	auipc	ra,0xffffe
    80003554:	2cc080e7          	jalr	716(ra) # 8000181c <_ZN15KernelSemaphore4waitEv>
        getInstance()->mutex.wait();
    80003558:	00000097          	auipc	ra,0x0
    8000355c:	e7c080e7          	jalr	-388(ra) # 800033d4 <_ZN15ThreadCollector11getInstanceEv>
    80003560:	02850513          	addi	a0,a0,40
    80003564:	fffff097          	auipc	ra,0xfffff
    80003568:	9a0080e7          	jalr	-1632(ra) # 80001f04 <_ZN5Mutex4waitEv>
        delete getInstance()->finishedThreads.removeFirst();
    8000356c:	00000097          	auipc	ra,0x0
    80003570:	e68080e7          	jalr	-408(ra) # 800033d4 <_ZN15ThreadCollector11getInstanceEv>
    80003574:	00850513          	addi	a0,a0,8
    80003578:	00000097          	auipc	ra,0x0
    8000357c:	0b4080e7          	jalr	180(ra) # 8000362c <_ZN10ThreadList11removeFirstEv>
    80003580:	f8051ce3          	bnez	a0,80003518 <_ZN15ThreadCollector3runEv+0x18>
    80003584:	fadff06f          	j	80003530 <_ZN15ThreadCollector3runEv+0x30>

0000000080003588 <_ZZN15ThreadCollectorC4EvENUlPvE_4_FUNES0_>:
    threadCollector = TCB::createKernelThread([](void *){ThreadCollector::run();}, nullptr);
    80003588:	ff010113          	addi	sp,sp,-16
    8000358c:	00113423          	sd	ra,8(sp)
    80003590:	00813023          	sd	s0,0(sp)
    80003594:	01010413          	addi	s0,sp,16
    80003598:	00000097          	auipc	ra,0x0
    8000359c:	f68080e7          	jalr	-152(ra) # 80003500 <_ZN15ThreadCollector3runEv>

00000000800035a0 <_ZN10ThreadList8addFirstEP10ThreadNode>:
#include "../h/ThreadList.h"

void ThreadList::addFirst(ThreadNode *elem) {
    800035a0:	ff010113          	addi	sp,sp,-16
    800035a4:	00813423          	sd	s0,8(sp)
    800035a8:	01010413          	addi	s0,sp,16
    elem->next = head;
    800035ac:	00053783          	ld	a5,0(a0)
    800035b0:	00f5b423          	sd	a5,8(a1)
    elem->prev = nullptr;
    800035b4:	0005b823          	sd	zero,16(a1)
    if (head) head->prev = elem;
    800035b8:	00053783          	ld	a5,0(a0)
    800035bc:	02078263          	beqz	a5,800035e0 <_ZN10ThreadList8addFirstEP10ThreadNode+0x40>
    800035c0:	00b7b823          	sd	a1,16(a5)
    else tail = elem;
    head = elem;
    800035c4:	00b53023          	sd	a1,0(a0)

    size++;
    800035c8:	01852783          	lw	a5,24(a0)
    800035cc:	0017879b          	addiw	a5,a5,1
    800035d0:	00f52c23          	sw	a5,24(a0)
}
    800035d4:	00813403          	ld	s0,8(sp)
    800035d8:	01010113          	addi	sp,sp,16
    800035dc:	00008067          	ret
    else tail = elem;
    800035e0:	00b53423          	sd	a1,8(a0)
    800035e4:	fe1ff06f          	j	800035c4 <_ZN10ThreadList8addFirstEP10ThreadNode+0x24>

00000000800035e8 <_ZN10ThreadList7addLastEP10ThreadNode>:

void ThreadList::addLast(ThreadNode *elem) {
    800035e8:	ff010113          	addi	sp,sp,-16
    800035ec:	00813423          	sd	s0,8(sp)
    800035f0:	01010413          	addi	s0,sp,16
    elem->next = nullptr;
    800035f4:	0005b423          	sd	zero,8(a1)
    elem->prev = tail;
    800035f8:	00853783          	ld	a5,8(a0)
    800035fc:	00f5b823          	sd	a5,16(a1)
    if (tail) tail->next = elem;
    80003600:	02078263          	beqz	a5,80003624 <_ZN10ThreadList7addLastEP10ThreadNode+0x3c>
    80003604:	00b7b423          	sd	a1,8(a5)
    else head = elem;
    tail = elem;
    80003608:	00b53423          	sd	a1,8(a0)

    size++;
    8000360c:	01852783          	lw	a5,24(a0)
    80003610:	0017879b          	addiw	a5,a5,1
    80003614:	00f52c23          	sw	a5,24(a0)
}
    80003618:	00813403          	ld	s0,8(sp)
    8000361c:	01010113          	addi	sp,sp,16
    80003620:	00008067          	ret
    else head = elem;
    80003624:	00b53023          	sd	a1,0(a0)
    80003628:	fe1ff06f          	j	80003608 <_ZN10ThreadList7addLastEP10ThreadNode+0x20>

000000008000362c <_ZN10ThreadList11removeFirstEv>:

TCB *ThreadList::removeFirst() {
    8000362c:	ff010113          	addi	sp,sp,-16
    80003630:	00813423          	sd	s0,8(sp)
    80003634:	01010413          	addi	s0,sp,16
    if (!head) return nullptr;
    80003638:	00053703          	ld	a4,0(a0)
    8000363c:	04070063          	beqz	a4,8000367c <_ZN10ThreadList11removeFirstEv+0x50>
    80003640:	00050793          	mv	a5,a0

    TCB *data = head->data;
    80003644:	00073503          	ld	a0,0(a4)

    head = head->next;
    80003648:	00873703          	ld	a4,8(a4)
    8000364c:	00e7b023          	sd	a4,0(a5)
    if (head) head->prev = nullptr;
    80003650:	02070063          	beqz	a4,80003670 <_ZN10ThreadList11removeFirstEv+0x44>
    80003654:	00073823          	sd	zero,16(a4)
    else head = tail = nullptr;

    size--;
    80003658:	0187a703          	lw	a4,24(a5)
    8000365c:	fff7071b          	addiw	a4,a4,-1
    80003660:	00e7ac23          	sw	a4,24(a5)

    return data;
}
    80003664:	00813403          	ld	s0,8(sp)
    80003668:	01010113          	addi	sp,sp,16
    8000366c:	00008067          	ret
    else head = tail = nullptr;
    80003670:	0007b423          	sd	zero,8(a5)
    80003674:	0007b023          	sd	zero,0(a5)
    80003678:	fe1ff06f          	j	80003658 <_ZN10ThreadList11removeFirstEv+0x2c>
    if (!head) return nullptr;
    8000367c:	00070513          	mv	a0,a4
    80003680:	fe5ff06f          	j	80003664 <_ZN10ThreadList11removeFirstEv+0x38>

0000000080003684 <_ZN10ThreadList10removeLastEv>:

TCB *ThreadList::removeLast() {
    80003684:	ff010113          	addi	sp,sp,-16
    80003688:	00813423          	sd	s0,8(sp)
    8000368c:	01010413          	addi	s0,sp,16
    if (!tail) return nullptr;
    80003690:	00853703          	ld	a4,8(a0)
    80003694:	04070063          	beqz	a4,800036d4 <_ZN10ThreadList10removeLastEv+0x50>
    80003698:	00050793          	mv	a5,a0

    TCB *data = tail->data;
    8000369c:	00073503          	ld	a0,0(a4)

    tail = tail->prev;
    800036a0:	01073703          	ld	a4,16(a4)
    800036a4:	00e7b423          	sd	a4,8(a5)
    if (tail) tail->next = nullptr;
    800036a8:	02070063          	beqz	a4,800036c8 <_ZN10ThreadList10removeLastEv+0x44>
    800036ac:	00073423          	sd	zero,8(a4)
    else tail = head = nullptr;

    size--;
    800036b0:	0187a703          	lw	a4,24(a5)
    800036b4:	fff7071b          	addiw	a4,a4,-1
    800036b8:	00e7ac23          	sw	a4,24(a5)

    return data;
}
    800036bc:	00813403          	ld	s0,8(sp)
    800036c0:	01010113          	addi	sp,sp,16
    800036c4:	00008067          	ret
    else tail = head = nullptr;
    800036c8:	0007b023          	sd	zero,0(a5)
    800036cc:	0007b423          	sd	zero,8(a5)
    800036d0:	fe1ff06f          	j	800036b0 <_ZN10ThreadList10removeLastEv+0x2c>
    if (!tail) return nullptr;
    800036d4:	00070513          	mv	a0,a4
    800036d8:	fe5ff06f          	j	800036bc <_ZN10ThreadList10removeLastEv+0x38>

00000000800036dc <_ZN10ThreadList9eraseCurrEv>:

void ThreadList::eraseCurr() {
    800036dc:	ff010113          	addi	sp,sp,-16
    800036e0:	00813423          	sd	s0,8(sp)
    800036e4:	01010413          	addi	s0,sp,16
    if (!curr) return;
    800036e8:	01053783          	ld	a5,16(a0)
    800036ec:	02078463          	beqz	a5,80003714 <_ZN10ThreadList9eraseCurrEv+0x38>

    ThreadNode *before = curr->prev, *after = curr->next;
    800036f0:	0107b703          	ld	a4,16(a5)
    800036f4:	0087b783          	ld	a5,8(a5)

    if (before) before->next = after;
    800036f8:	02070463          	beqz	a4,80003720 <_ZN10ThreadList9eraseCurrEv+0x44>
    800036fc:	00f73423          	sd	a5,8(a4)
    else head = after;

    if (after) after->prev = before;
    80003700:	02078463          	beqz	a5,80003728 <_ZN10ThreadList9eraseCurrEv+0x4c>
    80003704:	00e7b823          	sd	a4,16(a5)
    else tail = before;

    size--;
    80003708:	01852783          	lw	a5,24(a0)
    8000370c:	fff7879b          	addiw	a5,a5,-1
    80003710:	00f52c23          	sw	a5,24(a0)
}
    80003714:	00813403          	ld	s0,8(sp)
    80003718:	01010113          	addi	sp,sp,16
    8000371c:	00008067          	ret
    else head = after;
    80003720:	00f53023          	sd	a5,0(a0)
    80003724:	fddff06f          	j	80003700 <_ZN10ThreadList9eraseCurrEv+0x24>
    else tail = before;
    80003728:	00e53423          	sd	a4,8(a0)
    8000372c:	fddff06f          	j	80003708 <_ZN10ThreadList9eraseCurrEv+0x2c>

0000000080003730 <_ZN10ThreadList15insertAfterCurrEP10ThreadNode>:

void ThreadList::insertAfterCurr(ThreadNode *elem) {
    80003730:	ff010113          	addi	sp,sp,-16
    80003734:	00813423          	sd	s0,8(sp)
    80003738:	01010413          	addi	s0,sp,16
    if (!curr) return;
    8000373c:	01053783          	ld	a5,16(a0)
    80003740:	02078663          	beqz	a5,8000376c <_ZN10ThreadList15insertAfterCurrEP10ThreadNode+0x3c>
    ThreadNode *after = curr->next;
    80003744:	0087b783          	ld	a5,8(a5)
    elem->next = after;
    80003748:	00f5b423          	sd	a5,8(a1)
    elem->prev = curr;
    8000374c:	01053703          	ld	a4,16(a0)
    80003750:	00e5b823          	sd	a4,16(a1)
    curr->next = elem;
    80003754:	00b73423          	sd	a1,8(a4)
    if (!after) tail = elem;
    80003758:	02078063          	beqz	a5,80003778 <_ZN10ThreadList15insertAfterCurrEP10ThreadNode+0x48>
    else after->prev = elem;
    8000375c:	00b7b823          	sd	a1,16(a5)
    size++;
    80003760:	01852783          	lw	a5,24(a0)
    80003764:	0017879b          	addiw	a5,a5,1
    80003768:	00f52c23          	sw	a5,24(a0)
}
    8000376c:	00813403          	ld	s0,8(sp)
    80003770:	01010113          	addi	sp,sp,16
    80003774:	00008067          	ret
    if (!after) tail = elem;
    80003778:	00b53423          	sd	a1,8(a0)
    8000377c:	fe5ff06f          	j	80003760 <_ZN10ThreadList15insertAfterCurrEP10ThreadNode+0x30>

0000000080003780 <_ZN10ThreadList16insertBeforeCurrEP10ThreadNode>:

void ThreadList::insertBeforeCurr(ThreadNode *elem) {
    80003780:	ff010113          	addi	sp,sp,-16
    80003784:	00813423          	sd	s0,8(sp)
    80003788:	01010413          	addi	s0,sp,16
    if (!curr) return;
    8000378c:	01053783          	ld	a5,16(a0)
    80003790:	02078663          	beqz	a5,800037bc <_ZN10ThreadList16insertBeforeCurrEP10ThreadNode+0x3c>
    ThreadNode *before = curr->prev;
    80003794:	0107b703          	ld	a4,16(a5)
    elem->next = curr;
    80003798:	00f5b423          	sd	a5,8(a1)
    elem->prev = before;
    8000379c:	00e5b823          	sd	a4,16(a1)
    curr->prev = elem;
    800037a0:	01053783          	ld	a5,16(a0)
    800037a4:	00b7b823          	sd	a1,16(a5)
    if (!before) head = elem;
    800037a8:	02070063          	beqz	a4,800037c8 <_ZN10ThreadList16insertBeforeCurrEP10ThreadNode+0x48>
    else before->next = elem;
    800037ac:	00b73423          	sd	a1,8(a4)
    size++;
    800037b0:	01852783          	lw	a5,24(a0)
    800037b4:	0017879b          	addiw	a5,a5,1
    800037b8:	00f52c23          	sw	a5,24(a0)
}
    800037bc:	00813403          	ld	s0,8(sp)
    800037c0:	01010113          	addi	sp,sp,16
    800037c4:	00008067          	ret
    if (!before) head = elem;
    800037c8:	00b53023          	sd	a1,0(a0)
    800037cc:	fe5ff06f          	j	800037b0 <_ZN10ThreadList16insertBeforeCurrEP10ThreadNode+0x30>

00000000800037d0 <_ZN10ThreadListD1Ev>:

ThreadList::~ThreadList() {
    800037d0:	ff010113          	addi	sp,sp,-16
    800037d4:	00813423          	sd	s0,8(sp)
    800037d8:	01010413          	addi	s0,sp,16
    head = nullptr;
    tail = nullptr;
    curr = nullptr;
    size = 0;
}
    800037dc:	00813403          	ld	s0,8(sp)
    800037e0:	01010113          	addi	sp,sp,16
    800037e4:	00008067          	ret

00000000800037e8 <_ZN14TimerInterrupt11getInstanceEv>:
#include "../h/Scheduler.h"

TimerInterrupt *TimerInterrupt::instance = nullptr;

TimerInterrupt *TimerInterrupt::getInstance() {
    if (!instance) instance = new TimerInterrupt;
    800037e8:	00006797          	auipc	a5,0x6
    800037ec:	7807b783          	ld	a5,1920(a5) # 80009f68 <_ZN14TimerInterrupt8instanceE>
    800037f0:	00078863          	beqz	a5,80003800 <_ZN14TimerInterrupt11getInstanceEv+0x18>
    return instance;
}
    800037f4:	00006517          	auipc	a0,0x6
    800037f8:	77453503          	ld	a0,1908(a0) # 80009f68 <_ZN14TimerInterrupt8instanceE>
    800037fc:	00008067          	ret
TimerInterrupt *TimerInterrupt::getInstance() {
    80003800:	ff010113          	addi	sp,sp,-16
    80003804:	00113423          	sd	ra,8(sp)
    80003808:	00813023          	sd	s0,0(sp)
    8000380c:	01010413          	addi	s0,sp,16
        return kmalloc(size);
    80003810:	00200513          	li	a0,2
    80003814:	ffffe097          	auipc	ra,0xffffe
    80003818:	4b4080e7          	jalr	1204(ra) # 80001cc8 <_Z7kmallocm>
    8000381c:	00100793          	li	a5,1
    80003820:	00f52423          	sw	a5,8(a0)
    explicit ThreadList() = default;
    80003824:	00053823          	sd	zero,16(a0)
    80003828:	00053c23          	sd	zero,24(a0)
    8000382c:	02053023          	sd	zero,32(a0)
    80003830:	02052423          	sw	zero,40(a0)
    80003834:	02053823          	sd	zero,48(a0)
    80003838:	02053c23          	sd	zero,56(a0)
    8000383c:	04053023          	sd	zero,64(a0)
    80003840:	04053423          	sd	zero,72(a0)
    80003844:	04052823          	sw	zero,80(a0)
    if (!instance) instance = new TimerInterrupt;
    80003848:	00006797          	auipc	a5,0x6
    8000384c:	72a7b023          	sd	a0,1824(a5) # 80009f68 <_ZN14TimerInterrupt8instanceE>
}
    80003850:	00006517          	auipc	a0,0x6
    80003854:	71853503          	ld	a0,1816(a0) # 80009f68 <_ZN14TimerInterrupt8instanceE>
    80003858:	00813083          	ld	ra,8(sp)
    8000385c:	00013403          	ld	s0,0(sp)
    80003860:	01010113          	addi	sp,sp,16
    80003864:	00008067          	ret

0000000080003868 <_ZN14TimerInterrupt5blockEP3TCBm>:

void TimerInterrupt::block(TCB *tcb, time_t time) {
    80003868:	fd010113          	addi	sp,sp,-48
    8000386c:	02113423          	sd	ra,40(sp)
    80003870:	02813023          	sd	s0,32(sp)
    80003874:	00913c23          	sd	s1,24(sp)
    80003878:	01213823          	sd	s2,16(sp)
    8000387c:	01313423          	sd	s3,8(sp)
    80003880:	01413023          	sd	s4,0(sp)
    80003884:	03010413          	addi	s0,sp,48
    80003888:	00050993          	mv	s3,a0
    8000388c:	00058913          	mv	s2,a1
    ThreadList *blockedThreads = &getInstance()->blockedThreadList;
    80003890:	00000097          	auipc	ra,0x0
    80003894:	f58080e7          	jalr	-168(ra) # 800037e8 <_ZN14TimerInterrupt11getInstanceEv>
    80003898:	00050493          	mv	s1,a0
    8000389c:	03850a13          	addi	s4,a0,56

    getInstance()->mutex.wait();
    800038a0:	00000097          	auipc	ra,0x0
    800038a4:	f48080e7          	jalr	-184(ra) # 800037e8 <_ZN14TimerInterrupt11getInstanceEv>
    800038a8:	00850513          	addi	a0,a0,8
    800038ac:	ffffe097          	auipc	ra,0xffffe
    800038b0:	658080e7          	jalr	1624(ra) # 80001f04 <_ZN5Mutex4waitEv>
        curr = head;
    800038b4:	0384b783          	ld	a5,56(s1)
    800038b8:	04f4b423          	sd	a5,72(s1)
        return curr != nullptr;
    800038bc:	0484b783          	ld	a5,72(s1)

    for (blockedThreads->toHead(); blockedThreads->hasCurr(); blockedThreads->toNext()) {
    800038c0:	02078863          	beqz	a5,800038f0 <_ZN14TimerInterrupt5blockEP3TCBm+0x88>
    }

    TCB *getCurr() {
        if (!curr) return nullptr;
        return curr->data;
    800038c4:	0007b703          	ld	a4,0(a5)
        return blockedTime;
    800038c8:	0b873703          	ld	a4,184(a4)
        time_t currTime = blockedThreads->getCurr()->getBlockedTime();
        if (time >= currTime) {
    800038cc:	00e96a63          	bltu	s2,a4,800038e0 <_ZN14TimerInterrupt5blockEP3TCBm+0x78>
            time -= currTime;
    800038d0:	40e90933          	sub	s2,s2,a4
        if (curr) curr = curr->next;
    800038d4:	0087b783          	ld	a5,8(a5)
    800038d8:	04f4b423          	sd	a5,72(s1)
    }
    800038dc:	fe1ff06f          	j	800038bc <_ZN14TimerInterrupt5blockEP3TCBm+0x54>
        } else {
            blockedThreads->insertBeforeCurr(tcb->getNode());
    800038e0:	0a098593          	addi	a1,s3,160
    800038e4:	000a0513          	mv	a0,s4
    800038e8:	00000097          	auipc	ra,0x0
    800038ec:	e98080e7          	jalr	-360(ra) # 80003780 <_ZN10ThreadList16insertBeforeCurrEP10ThreadNode>
        return curr != nullptr;
    800038f0:	0484b783          	ld	a5,72(s1)
            break;
        }
    }

    // insert at end
    if (!blockedThreads->hasCurr()) blockedThreads->addLast(tcb->getNode());
    800038f4:	02078863          	beqz	a5,80003924 <_ZN14TimerInterrupt5blockEP3TCBm+0xbc>
    800038f8:	0484b783          	ld	a5,72(s1)

    // updating relative time for blocked threads after currently inserted
    while (blockedThreads->hasCurr()) {
    800038fc:	02078e63          	beqz	a5,80003938 <_ZN14TimerInterrupt5blockEP3TCBm+0xd0>
        return curr->data;
    80003900:	0007b703          	ld	a4,0(a5)
        this->blockedTime -= time;
    80003904:	0b873783          	ld	a5,184(a4)
    80003908:	412787b3          	sub	a5,a5,s2
    8000390c:	0af73c23          	sd	a5,184(a4)
        if (curr) curr = curr->next;
    80003910:	0484b783          	ld	a5,72(s1)
    80003914:	fe0782e3          	beqz	a5,800038f8 <_ZN14TimerInterrupt5blockEP3TCBm+0x90>
    80003918:	0087b783          	ld	a5,8(a5)
    8000391c:	04f4b423          	sd	a5,72(s1)
    80003920:	fd9ff06f          	j	800038f8 <_ZN14TimerInterrupt5blockEP3TCBm+0x90>
    if (!blockedThreads->hasCurr()) blockedThreads->addLast(tcb->getNode());
    80003924:	0a098593          	addi	a1,s3,160
    80003928:	000a0513          	mv	a0,s4
    8000392c:	00000097          	auipc	ra,0x0
    80003930:	cbc080e7          	jalr	-836(ra) # 800035e8 <_ZN10ThreadList7addLastEP10ThreadNode>
    80003934:	fc5ff06f          	j	800038f8 <_ZN14TimerInterrupt5blockEP3TCBm+0x90>
        blockedThreads->getCurr()->decBlockedTime(time);
        blockedThreads->toNext();
    }

    getInstance()->mutex.signal();
    80003938:	00000097          	auipc	ra,0x0
    8000393c:	eb0080e7          	jalr	-336(ra) # 800037e8 <_ZN14TimerInterrupt11getInstanceEv>
    80003940:	00850513          	addi	a0,a0,8
    80003944:	ffffe097          	auipc	ra,0xffffe
    80003948:	640080e7          	jalr	1600(ra) # 80001f84 <_ZN5Mutex6signalEv>
        this->blockedTime = blockedTime;
    8000394c:	0b29bc23          	sd	s2,184(s3)
        status = BLOCKED;
    80003950:	00200793          	li	a5,2
    80003954:	04f9a423          	sw	a5,72(s3)

    tcb->setBlockedTime(time);
    tcb->setBlocked();
    TCB::dispatch();
    80003958:	fffff097          	auipc	ra,0xfffff
    8000395c:	6c0080e7          	jalr	1728(ra) # 80003018 <_ZN3TCB8dispatchEv>
}
    80003960:	02813083          	ld	ra,40(sp)
    80003964:	02013403          	ld	s0,32(sp)
    80003968:	01813483          	ld	s1,24(sp)
    8000396c:	01013903          	ld	s2,16(sp)
    80003970:	00813983          	ld	s3,8(sp)
    80003974:	00013a03          	ld	s4,0(sp)
    80003978:	03010113          	addi	sp,sp,48
    8000397c:	00008067          	ret

0000000080003980 <_ZN14TimerInterrupt4tickEv>:

void TimerInterrupt::tick() {
    80003980:	fd010113          	addi	sp,sp,-48
    80003984:	02113423          	sd	ra,40(sp)
    80003988:	02813023          	sd	s0,32(sp)
    8000398c:	00913c23          	sd	s1,24(sp)
    80003990:	01213823          	sd	s2,16(sp)
    80003994:	01313423          	sd	s3,8(sp)
    80003998:	03010413          	addi	s0,sp,48
    ThreadList *blockedThreads = &getInstance()->blockedThreadList;
    8000399c:	00000097          	auipc	ra,0x0
    800039a0:	e4c080e7          	jalr	-436(ra) # 800037e8 <_ZN14TimerInterrupt11getInstanceEv>
    800039a4:	00050913          	mv	s2,a0
    800039a8:	03850993          	addi	s3,a0,56

    TCB *tcb;

    getInstance()->mutex.wait();
    800039ac:	00000097          	auipc	ra,0x0
    800039b0:	e3c080e7          	jalr	-452(ra) # 800037e8 <_ZN14TimerInterrupt11getInstanceEv>
    800039b4:	00850513          	addi	a0,a0,8
    800039b8:	ffffe097          	auipc	ra,0xffffe
    800039bc:	54c080e7          	jalr	1356(ra) # 80001f04 <_ZN5Mutex4waitEv>
    800039c0:	01c0006f          	j	800039dc <_ZN14TimerInterrupt4tickEv+0x5c>
        status = READY;
    800039c4:	0404a423          	sw	zero,72(s1)

    while ((tcb = blockedThreads->getFirst()) && !tcb->getBlockedTime()) {
        tcb->setReady();
        Scheduler::put(blockedThreads->removeFirst());
    800039c8:	00098513          	mv	a0,s3
    800039cc:	00000097          	auipc	ra,0x0
    800039d0:	c60080e7          	jalr	-928(ra) # 8000362c <_ZN10ThreadList11removeFirstEv>
    800039d4:	fffff097          	auipc	ra,0xfffff
    800039d8:	970080e7          	jalr	-1680(ra) # 80002344 <_ZN9Scheduler3putEP3TCB>
        if (!head) return nullptr;
    800039dc:	03893483          	ld	s1,56(s2)
    800039e0:	00048a63          	beqz	s1,800039f4 <_ZN14TimerInterrupt4tickEv+0x74>
        return head->data;
    800039e4:	0004b483          	ld	s1,0(s1)
    while ((tcb = blockedThreads->getFirst()) && !tcb->getBlockedTime()) {
    800039e8:	00048663          	beqz	s1,800039f4 <_ZN14TimerInterrupt4tickEv+0x74>
        return blockedTime;
    800039ec:	0b84b783          	ld	a5,184(s1)
    800039f0:	fc078ae3          	beqz	a5,800039c4 <_ZN14TimerInterrupt4tickEv+0x44>
    }

    getInstance()->mutex.signal();
    800039f4:	00000097          	auipc	ra,0x0
    800039f8:	df4080e7          	jalr	-524(ra) # 800037e8 <_ZN14TimerInterrupt11getInstanceEv>
    800039fc:	00850513          	addi	a0,a0,8
    80003a00:	ffffe097          	auipc	ra,0xffffe
    80003a04:	584080e7          	jalr	1412(ra) # 80001f84 <_ZN5Mutex6signalEv>

    if (!tcb) return;
    80003a08:	00048863          	beqz	s1,80003a18 <_ZN14TimerInterrupt4tickEv+0x98>
        this->blockedTime -= time;
    80003a0c:	0b84b783          	ld	a5,184(s1)
    80003a10:	fff78793          	addi	a5,a5,-1
    80003a14:	0af4bc23          	sd	a5,184(s1)
    tcb->decBlockedTime();
}
    80003a18:	02813083          	ld	ra,40(sp)
    80003a1c:	02013403          	ld	s0,32(sp)
    80003a20:	01813483          	ld	s1,24(sp)
    80003a24:	01013903          	ld	s2,16(sp)
    80003a28:	00813983          	ld	s3,8(sp)
    80003a2c:	03010113          	addi	sp,sp,48
    80003a30:	00008067          	ret

0000000080003a34 <_ZN14TimerInterruptD1Ev>:

TimerInterrupt::~TimerInterrupt() {
    80003a34:	fe010113          	addi	sp,sp,-32
    80003a38:	00113c23          	sd	ra,24(sp)
    80003a3c:	00813823          	sd	s0,16(sp)
    80003a40:	00913423          	sd	s1,8(sp)
    80003a44:	01213023          	sd	s2,0(sp)
    80003a48:	02010413          	addi	s0,sp,32
    80003a4c:	00050913          	mv	s2,a0
        return size == 0;
    80003a50:	05092783          	lw	a5,80(s2)
    while (!blockedThreadList.isEmpty()) {
    80003a54:	02078863          	beqz	a5,80003a84 <_ZN14TimerInterruptD1Ev+0x50>
        delete blockedThreadList.removeFirst();
    80003a58:	03890513          	addi	a0,s2,56
    80003a5c:	00000097          	auipc	ra,0x0
    80003a60:	bd0080e7          	jalr	-1072(ra) # 8000362c <_ZN10ThreadList11removeFirstEv>
    80003a64:	00050493          	mv	s1,a0
    80003a68:	fe0504e3          	beqz	a0,80003a50 <_ZN14TimerInterruptD1Ev+0x1c>
    80003a6c:	fffff097          	auipc	ra,0xfffff
    80003a70:	784080e7          	jalr	1924(ra) # 800031f0 <_ZN3TCBD1Ev>
        kfree(addr);
    80003a74:	00048513          	mv	a0,s1
    80003a78:	ffffe097          	auipc	ra,0xffffe
    80003a7c:	44c080e7          	jalr	1100(ra) # 80001ec4 <_Z5kfreePv>
    }
    80003a80:	fd1ff06f          	j	80003a50 <_ZN14TimerInterruptD1Ev+0x1c>
TimerInterrupt::~TimerInterrupt() {
    80003a84:	03890513          	addi	a0,s2,56
    80003a88:	00000097          	auipc	ra,0x0
    80003a8c:	d48080e7          	jalr	-696(ra) # 800037d0 <_ZN10ThreadListD1Ev>
    80003a90:	00890513          	addi	a0,s2,8
    80003a94:	ffffe097          	auipc	ra,0xffffe
    80003a98:	e44080e7          	jalr	-444(ra) # 800018d8 <_ZN15KernelSemaphoreD1Ev>
    }
}
    80003a9c:	01813083          	ld	ra,24(sp)
    80003aa0:	01013403          	ld	s0,16(sp)
    80003aa4:	00813483          	ld	s1,8(sp)
    80003aa8:	00013903          	ld	s2,0(sp)
    80003aac:	02010113          	addi	sp,sp,32
    80003ab0:	00008067          	ret

0000000080003ab4 <_ZN6BufferC1Ei>:
#include "buffer.hpp"
#include "../h/syscall_c.h"
//#include "../h/std.h"


Buffer::Buffer(int _cap) : cap(_cap), head(0), tail(0) {
    80003ab4:	fe010113          	addi	sp,sp,-32
    80003ab8:	00113c23          	sd	ra,24(sp)
    80003abc:	00813823          	sd	s0,16(sp)
    80003ac0:	00913423          	sd	s1,8(sp)
    80003ac4:	02010413          	addi	s0,sp,32
    80003ac8:	00050493          	mv	s1,a0
    80003acc:	00b52023          	sw	a1,0(a0)
    80003ad0:	00052823          	sw	zero,16(a0)
    80003ad4:	00052a23          	sw	zero,20(a0)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80003ad8:	00259513          	slli	a0,a1,0x2
    80003adc:	fffff097          	auipc	ra,0xfffff
    80003ae0:	994080e7          	jalr	-1644(ra) # 80002470 <_Z9mem_allocm>
    80003ae4:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80003ae8:	00000593          	li	a1,0
    80003aec:	02048513          	addi	a0,s1,32
    80003af0:	fffff097          	auipc	ra,0xfffff
    80003af4:	b08080e7          	jalr	-1272(ra) # 800025f8 <_Z8sem_openPP4_semj>
    sem_open(&spaceAvailable, cap);
    80003af8:	0004a583          	lw	a1,0(s1)
    80003afc:	01848513          	addi	a0,s1,24
    80003b00:	fffff097          	auipc	ra,0xfffff
    80003b04:	af8080e7          	jalr	-1288(ra) # 800025f8 <_Z8sem_openPP4_semj>
    sem_open(&mutexHead, 1);
    80003b08:	00100593          	li	a1,1
    80003b0c:	02848513          	addi	a0,s1,40
    80003b10:	fffff097          	auipc	ra,0xfffff
    80003b14:	ae8080e7          	jalr	-1304(ra) # 800025f8 <_Z8sem_openPP4_semj>
    sem_open(&mutexTail, 1);
    80003b18:	00100593          	li	a1,1
    80003b1c:	03048513          	addi	a0,s1,48
    80003b20:	fffff097          	auipc	ra,0xfffff
    80003b24:	ad8080e7          	jalr	-1320(ra) # 800025f8 <_Z8sem_openPP4_semj>
}
    80003b28:	01813083          	ld	ra,24(sp)
    80003b2c:	01013403          	ld	s0,16(sp)
    80003b30:	00813483          	ld	s1,8(sp)
    80003b34:	02010113          	addi	sp,sp,32
    80003b38:	00008067          	ret

0000000080003b3c <_ZN6BufferD1Ev>:

Buffer::~Buffer() {
    80003b3c:	fe010113          	addi	sp,sp,-32
    80003b40:	00113c23          	sd	ra,24(sp)
    80003b44:	00813823          	sd	s0,16(sp)
    80003b48:	00913423          	sd	s1,8(sp)
    80003b4c:	02010413          	addi	s0,sp,32
    80003b50:	00050493          	mv	s1,a0
    putc('\n');
    80003b54:	00a00513          	li	a0,10
    80003b58:	fffff097          	auipc	ra,0xfffff
    80003b5c:	c44080e7          	jalr	-956(ra) # 8000279c <_Z4putcc>
//    printf("Buffer deleted!\n");
    while (head != tail) {
    80003b60:	0104a783          	lw	a5,16(s1)
    80003b64:	0144a703          	lw	a4,20(s1)
    80003b68:	00e78c63          	beq	a5,a4,80003b80 <_ZN6BufferD1Ev+0x44>
//        printf("%c ", buffer[head]);
        head = (head + 1) % cap;
    80003b6c:	0017879b          	addiw	a5,a5,1
    80003b70:	0004a703          	lw	a4,0(s1)
    80003b74:	02e7e7bb          	remw	a5,a5,a4
    80003b78:	00f4a823          	sw	a5,16(s1)
    while (head != tail) {
    80003b7c:	fe5ff06f          	j	80003b60 <_ZN6BufferD1Ev+0x24>
    }
    putc('!');
    80003b80:	02100513          	li	a0,33
    80003b84:	fffff097          	auipc	ra,0xfffff
    80003b88:	c18080e7          	jalr	-1000(ra) # 8000279c <_Z4putcc>
    putc('\n');
    80003b8c:	00a00513          	li	a0,10
    80003b90:	fffff097          	auipc	ra,0xfffff
    80003b94:	c0c080e7          	jalr	-1012(ra) # 8000279c <_Z4putcc>

    mem_free(buffer);
    80003b98:	0084b503          	ld	a0,8(s1)
    80003b9c:	fffff097          	auipc	ra,0xfffff
    80003ba0:	918080e7          	jalr	-1768(ra) # 800024b4 <_Z8mem_freePv>
    sem_close(itemAvailable);
    80003ba4:	0204b503          	ld	a0,32(s1)
    80003ba8:	fffff097          	auipc	ra,0xfffff
    80003bac:	ac8080e7          	jalr	-1336(ra) # 80002670 <_Z9sem_closeP4_sem>
    sem_close(spaceAvailable);
    80003bb0:	0184b503          	ld	a0,24(s1)
    80003bb4:	fffff097          	auipc	ra,0xfffff
    80003bb8:	abc080e7          	jalr	-1348(ra) # 80002670 <_Z9sem_closeP4_sem>
    sem_close(mutexTail);
    80003bbc:	0304b503          	ld	a0,48(s1)
    80003bc0:	fffff097          	auipc	ra,0xfffff
    80003bc4:	ab0080e7          	jalr	-1360(ra) # 80002670 <_Z9sem_closeP4_sem>
    sem_close(mutexHead);
    80003bc8:	0284b503          	ld	a0,40(s1)
    80003bcc:	fffff097          	auipc	ra,0xfffff
    80003bd0:	aa4080e7          	jalr	-1372(ra) # 80002670 <_Z9sem_closeP4_sem>
}
    80003bd4:	01813083          	ld	ra,24(sp)
    80003bd8:	01013403          	ld	s0,16(sp)
    80003bdc:	00813483          	ld	s1,8(sp)
    80003be0:	02010113          	addi	sp,sp,32
    80003be4:	00008067          	ret

0000000080003be8 <_ZN6Buffer3putEi>:

void Buffer::put(int val) {
    80003be8:	fe010113          	addi	sp,sp,-32
    80003bec:	00113c23          	sd	ra,24(sp)
    80003bf0:	00813823          	sd	s0,16(sp)
    80003bf4:	00913423          	sd	s1,8(sp)
    80003bf8:	01213023          	sd	s2,0(sp)
    80003bfc:	02010413          	addi	s0,sp,32
    80003c00:	00050493          	mv	s1,a0
    80003c04:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80003c08:	01853503          	ld	a0,24(a0)
    80003c0c:	fffff097          	auipc	ra,0xfffff
    80003c10:	ac0080e7          	jalr	-1344(ra) # 800026cc <_Z8sem_waitP4_sem>

    sem_wait(mutexTail);
    80003c14:	0304b503          	ld	a0,48(s1)
    80003c18:	fffff097          	auipc	ra,0xfffff
    80003c1c:	ab4080e7          	jalr	-1356(ra) # 800026cc <_Z8sem_waitP4_sem>
    buffer[tail] = val;
    80003c20:	0084b783          	ld	a5,8(s1)
    80003c24:	0144a703          	lw	a4,20(s1)
    80003c28:	00271713          	slli	a4,a4,0x2
    80003c2c:	00e787b3          	add	a5,a5,a4
    80003c30:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80003c34:	0144a783          	lw	a5,20(s1)
    80003c38:	0017879b          	addiw	a5,a5,1
    80003c3c:	0004a703          	lw	a4,0(s1)
    80003c40:	02e7e7bb          	remw	a5,a5,a4
    80003c44:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80003c48:	0304b503          	ld	a0,48(s1)
    80003c4c:	fffff097          	auipc	ra,0xfffff
    80003c50:	ab4080e7          	jalr	-1356(ra) # 80002700 <_Z10sem_signalP4_sem>

    sem_signal(itemAvailable);
    80003c54:	0204b503          	ld	a0,32(s1)
    80003c58:	fffff097          	auipc	ra,0xfffff
    80003c5c:	aa8080e7          	jalr	-1368(ra) # 80002700 <_Z10sem_signalP4_sem>

}
    80003c60:	01813083          	ld	ra,24(sp)
    80003c64:	01013403          	ld	s0,16(sp)
    80003c68:	00813483          	ld	s1,8(sp)
    80003c6c:	00013903          	ld	s2,0(sp)
    80003c70:	02010113          	addi	sp,sp,32
    80003c74:	00008067          	ret

0000000080003c78 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80003c78:	fe010113          	addi	sp,sp,-32
    80003c7c:	00113c23          	sd	ra,24(sp)
    80003c80:	00813823          	sd	s0,16(sp)
    80003c84:	00913423          	sd	s1,8(sp)
    80003c88:	01213023          	sd	s2,0(sp)
    80003c8c:	02010413          	addi	s0,sp,32
    80003c90:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80003c94:	02053503          	ld	a0,32(a0)
    80003c98:	fffff097          	auipc	ra,0xfffff
    80003c9c:	a34080e7          	jalr	-1484(ra) # 800026cc <_Z8sem_waitP4_sem>

    sem_wait(mutexHead);
    80003ca0:	0284b503          	ld	a0,40(s1)
    80003ca4:	fffff097          	auipc	ra,0xfffff
    80003ca8:	a28080e7          	jalr	-1496(ra) # 800026cc <_Z8sem_waitP4_sem>

    int ret = buffer[head];
    80003cac:	0084b703          	ld	a4,8(s1)
    80003cb0:	0104a783          	lw	a5,16(s1)
    80003cb4:	00279693          	slli	a3,a5,0x2
    80003cb8:	00d70733          	add	a4,a4,a3
    80003cbc:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80003cc0:	0017879b          	addiw	a5,a5,1
    80003cc4:	0004a703          	lw	a4,0(s1)
    80003cc8:	02e7e7bb          	remw	a5,a5,a4
    80003ccc:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80003cd0:	0284b503          	ld	a0,40(s1)
    80003cd4:	fffff097          	auipc	ra,0xfffff
    80003cd8:	a2c080e7          	jalr	-1492(ra) # 80002700 <_Z10sem_signalP4_sem>

    sem_signal(spaceAvailable);
    80003cdc:	0184b503          	ld	a0,24(s1)
    80003ce0:	fffff097          	auipc	ra,0xfffff
    80003ce4:	a20080e7          	jalr	-1504(ra) # 80002700 <_Z10sem_signalP4_sem>

    return ret;
}
    80003ce8:	00090513          	mv	a0,s2
    80003cec:	01813083          	ld	ra,24(sp)
    80003cf0:	01013403          	ld	s0,16(sp)
    80003cf4:	00813483          	ld	s1,8(sp)
    80003cf8:	00013903          	ld	s2,0(sp)
    80003cfc:	02010113          	addi	sp,sp,32
    80003d00:	00008067          	ret

0000000080003d04 <_ZL8printIntiii>:
}

static char digits[] = "0123456789ABCDEF";

static void printInt(int xx, int base=10, int sgn=0)
{
    80003d04:	fc010113          	addi	sp,sp,-64
    80003d08:	02113c23          	sd	ra,56(sp)
    80003d0c:	02813823          	sd	s0,48(sp)
    80003d10:	02913423          	sd	s1,40(sp)
    80003d14:	03213023          	sd	s2,32(sp)
    80003d18:	01313c23          	sd	s3,24(sp)
    80003d1c:	04010413          	addi	s0,sp,64
    80003d20:	00050493          	mv	s1,a0
    80003d24:	00058913          	mv	s2,a1
    80003d28:	00060993          	mv	s3,a2
    LOCK();
    80003d2c:	00100613          	li	a2,1
    80003d30:	00000593          	li	a1,0
    80003d34:	00006517          	auipc	a0,0x6
    80003d38:	23c50513          	addi	a0,a0,572 # 80009f70 <lockPrint>
    80003d3c:	ffffd097          	auipc	ra,0xffffd
    80003d40:	444080e7          	jalr	1092(ra) # 80001180 <copy_and_swap>
    80003d44:	fe0514e3          	bnez	a0,80003d2c <_ZL8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80003d48:	00098463          	beqz	s3,80003d50 <_ZL8printIntiii+0x4c>
    80003d4c:	0804c463          	bltz	s1,80003dd4 <_ZL8printIntiii+0xd0>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80003d50:	0004851b          	sext.w	a0,s1
    neg = 0;
    80003d54:	00000593          	li	a1,0
    }

    i = 0;
    80003d58:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80003d5c:	0009079b          	sext.w	a5,s2
    80003d60:	0325773b          	remuw	a4,a0,s2
    80003d64:	00048613          	mv	a2,s1
    80003d68:	0014849b          	addiw	s1,s1,1
    80003d6c:	02071693          	slli	a3,a4,0x20
    80003d70:	0206d693          	srli	a3,a3,0x20
    80003d74:	00004717          	auipc	a4,0x4
    80003d78:	75470713          	addi	a4,a4,1876 # 800084c8 <_ZL6digits>
    80003d7c:	00d70733          	add	a4,a4,a3
    80003d80:	00074683          	lbu	a3,0(a4)
    80003d84:	fd040713          	addi	a4,s0,-48
    80003d88:	00c70733          	add	a4,a4,a2
    80003d8c:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80003d90:	0005071b          	sext.w	a4,a0
    80003d94:	0325553b          	divuw	a0,a0,s2
    80003d98:	fcf772e3          	bgeu	a4,a5,80003d5c <_ZL8printIntiii+0x58>
    if(neg)
    80003d9c:	00058c63          	beqz	a1,80003db4 <_ZL8printIntiii+0xb0>
        buf[i++] = '-';
    80003da0:	fd040793          	addi	a5,s0,-48
    80003da4:	009784b3          	add	s1,a5,s1
    80003da8:	02d00793          	li	a5,45
    80003dac:	fef48823          	sb	a5,-16(s1)
    80003db0:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80003db4:	fff4849b          	addiw	s1,s1,-1
    80003db8:	0204c463          	bltz	s1,80003de0 <_ZL8printIntiii+0xdc>
        putc(buf[i]);
    80003dbc:	fd040793          	addi	a5,s0,-48
    80003dc0:	009787b3          	add	a5,a5,s1
    80003dc4:	ff07c503          	lbu	a0,-16(a5)
    80003dc8:	fffff097          	auipc	ra,0xfffff
    80003dcc:	9d4080e7          	jalr	-1580(ra) # 8000279c <_Z4putcc>
    80003dd0:	fe5ff06f          	j	80003db4 <_ZL8printIntiii+0xb0>
        x = -xx;
    80003dd4:	4090053b          	negw	a0,s1
        neg = 1;
    80003dd8:	00100593          	li	a1,1
        x = -xx;
    80003ddc:	f7dff06f          	j	80003d58 <_ZL8printIntiii+0x54>

    UNLOCK();
    80003de0:	00000613          	li	a2,0
    80003de4:	00100593          	li	a1,1
    80003de8:	00006517          	auipc	a0,0x6
    80003dec:	18850513          	addi	a0,a0,392 # 80009f70 <lockPrint>
    80003df0:	ffffd097          	auipc	ra,0xffffd
    80003df4:	390080e7          	jalr	912(ra) # 80001180 <copy_and_swap>
    80003df8:	fe0514e3          	bnez	a0,80003de0 <_ZL8printIntiii+0xdc>
}
    80003dfc:	03813083          	ld	ra,56(sp)
    80003e00:	03013403          	ld	s0,48(sp)
    80003e04:	02813483          	ld	s1,40(sp)
    80003e08:	02013903          	ld	s2,32(sp)
    80003e0c:	01813983          	ld	s3,24(sp)
    80003e10:	04010113          	addi	sp,sp,64
    80003e14:	00008067          	ret

0000000080003e18 <_Z16producerKeyboardPv>:
    sem_t wait;
};

volatile int threadEnd = 0;

void producerKeyboard(void *arg) {
    80003e18:	fe010113          	addi	sp,sp,-32
    80003e1c:	00113c23          	sd	ra,24(sp)
    80003e20:	00813823          	sd	s0,16(sp)
    80003e24:	00913423          	sd	s1,8(sp)
    80003e28:	01213023          	sd	s2,0(sp)
    80003e2c:	02010413          	addi	s0,sp,32
    80003e30:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80003e34:	00000913          	li	s2,0
    80003e38:	00c0006f          	j	80003e44 <_Z16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003e3c:	ffffe097          	auipc	ra,0xffffe
    80003e40:	78c080e7          	jalr	1932(ra) # 800025c8 <_Z15thread_dispatchv>
    while ((key = getc()) != 0x1b) {
    80003e44:	fffff097          	auipc	ra,0xfffff
    80003e48:	924080e7          	jalr	-1756(ra) # 80002768 <_Z4getcv>
    80003e4c:	0005059b          	sext.w	a1,a0
    80003e50:	01b00793          	li	a5,27
    80003e54:	02f58a63          	beq	a1,a5,80003e88 <_Z16producerKeyboardPv+0x70>
        data->buffer->put(key);
    80003e58:	0084b503          	ld	a0,8(s1)
    80003e5c:	00000097          	auipc	ra,0x0
    80003e60:	d8c080e7          	jalr	-628(ra) # 80003be8 <_ZN6Buffer3putEi>
        i++;
    80003e64:	0019071b          	addiw	a4,s2,1
    80003e68:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003e6c:	0004a683          	lw	a3,0(s1)
    80003e70:	0026979b          	slliw	a5,a3,0x2
    80003e74:	00d787bb          	addw	a5,a5,a3
    80003e78:	0017979b          	slliw	a5,a5,0x1
    80003e7c:	02f767bb          	remw	a5,a4,a5
    80003e80:	fc0792e3          	bnez	a5,80003e44 <_Z16producerKeyboardPv+0x2c>
    80003e84:	fb9ff06f          	j	80003e3c <_Z16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    80003e88:	00100793          	li	a5,1
    80003e8c:	00006717          	auipc	a4,0x6
    80003e90:	0ef72623          	sw	a5,236(a4) # 80009f78 <threadEnd>

    delete data->buffer;
    80003e94:	0084b903          	ld	s2,8(s1)
    80003e98:	00090e63          	beqz	s2,80003eb4 <_Z16producerKeyboardPv+0x9c>
    80003e9c:	00090513          	mv	a0,s2
    80003ea0:	00000097          	auipc	ra,0x0
    80003ea4:	c9c080e7          	jalr	-868(ra) # 80003b3c <_ZN6BufferD1Ev>
    80003ea8:	00090513          	mv	a0,s2
    80003eac:	fffff097          	auipc	ra,0xfffff
    80003eb0:	970080e7          	jalr	-1680(ra) # 8000281c <_ZdlPv>

    sem_signal(data->wait);
    80003eb4:	0104b503          	ld	a0,16(s1)
    80003eb8:	fffff097          	auipc	ra,0xfffff
    80003ebc:	848080e7          	jalr	-1976(ra) # 80002700 <_Z10sem_signalP4_sem>
}
    80003ec0:	01813083          	ld	ra,24(sp)
    80003ec4:	01013403          	ld	s0,16(sp)
    80003ec8:	00813483          	ld	s1,8(sp)
    80003ecc:	00013903          	ld	s2,0(sp)
    80003ed0:	02010113          	addi	sp,sp,32
    80003ed4:	00008067          	ret

0000000080003ed8 <_Z8producerPv>:

void producer(void *arg) {
    80003ed8:	fe010113          	addi	sp,sp,-32
    80003edc:	00113c23          	sd	ra,24(sp)
    80003ee0:	00813823          	sd	s0,16(sp)
    80003ee4:	00913423          	sd	s1,8(sp)
    80003ee8:	01213023          	sd	s2,0(sp)
    80003eec:	02010413          	addi	s0,sp,32
    80003ef0:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003ef4:	00000913          	li	s2,0
    80003ef8:	00c0006f          	j	80003f04 <_Z8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003efc:	ffffe097          	auipc	ra,0xffffe
    80003f00:	6cc080e7          	jalr	1740(ra) # 800025c8 <_Z15thread_dispatchv>
    while (!threadEnd) {
    80003f04:	00006797          	auipc	a5,0x6
    80003f08:	0747a783          	lw	a5,116(a5) # 80009f78 <threadEnd>
    80003f0c:	02079e63          	bnez	a5,80003f48 <_Z8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80003f10:	0004a583          	lw	a1,0(s1)
    80003f14:	0305859b          	addiw	a1,a1,48
    80003f18:	0084b503          	ld	a0,8(s1)
    80003f1c:	00000097          	auipc	ra,0x0
    80003f20:	ccc080e7          	jalr	-820(ra) # 80003be8 <_ZN6Buffer3putEi>
        i++;
    80003f24:	0019071b          	addiw	a4,s2,1
    80003f28:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003f2c:	0004a683          	lw	a3,0(s1)
    80003f30:	0026979b          	slliw	a5,a3,0x2
    80003f34:	00d787bb          	addw	a5,a5,a3
    80003f38:	0017979b          	slliw	a5,a5,0x1
    80003f3c:	02f767bb          	remw	a5,a4,a5
    80003f40:	fc0792e3          	bnez	a5,80003f04 <_Z8producerPv+0x2c>
    80003f44:	fb9ff06f          	j	80003efc <_Z8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    80003f48:	0104b503          	ld	a0,16(s1)
    80003f4c:	ffffe097          	auipc	ra,0xffffe
    80003f50:	7b4080e7          	jalr	1972(ra) # 80002700 <_Z10sem_signalP4_sem>
}
    80003f54:	01813083          	ld	ra,24(sp)
    80003f58:	01013403          	ld	s0,16(sp)
    80003f5c:	00813483          	ld	s1,8(sp)
    80003f60:	00013903          	ld	s2,0(sp)
    80003f64:	02010113          	addi	sp,sp,32
    80003f68:	00008067          	ret

0000000080003f6c <_Z8consumerPv>:

void consumer(void *arg) {
    80003f6c:	fd010113          	addi	sp,sp,-48
    80003f70:	02113423          	sd	ra,40(sp)
    80003f74:	02813023          	sd	s0,32(sp)
    80003f78:	00913c23          	sd	s1,24(sp)
    80003f7c:	01213823          	sd	s2,16(sp)
    80003f80:	01313423          	sd	s3,8(sp)
    80003f84:	03010413          	addi	s0,sp,48
    80003f88:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;


    int i = 0;
    80003f8c:	00000993          	li	s3,0
    80003f90:	01c0006f          	j	80003fac <_Z8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    80003f94:	ffffe097          	auipc	ra,0xffffe
    80003f98:	634080e7          	jalr	1588(ra) # 800025c8 <_Z15thread_dispatchv>
    80003f9c:	0500006f          	j	80003fec <_Z8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    80003fa0:	00a00513          	li	a0,10
    80003fa4:	ffffe097          	auipc	ra,0xffffe
    80003fa8:	7f8080e7          	jalr	2040(ra) # 8000279c <_Z4putcc>
    while (!threadEnd) {
    80003fac:	00006797          	auipc	a5,0x6
    80003fb0:	fcc7a783          	lw	a5,-52(a5) # 80009f78 <threadEnd>
    80003fb4:	04079463          	bnez	a5,80003ffc <_Z8consumerPv+0x90>
        int key = data->buffer->get();
    80003fb8:	00893503          	ld	a0,8(s2)
    80003fbc:	00000097          	auipc	ra,0x0
    80003fc0:	cbc080e7          	jalr	-836(ra) # 80003c78 <_ZN6Buffer3getEv>
        i++;
    80003fc4:	0019849b          	addiw	s1,s3,1
    80003fc8:	0004899b          	sext.w	s3,s1
        putc(key);
    80003fcc:	0ff57513          	andi	a0,a0,255
    80003fd0:	ffffe097          	auipc	ra,0xffffe
    80003fd4:	7cc080e7          	jalr	1996(ra) # 8000279c <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80003fd8:	00092703          	lw	a4,0(s2)
    80003fdc:	0027179b          	slliw	a5,a4,0x2
    80003fe0:	00e787bb          	addw	a5,a5,a4
    80003fe4:	02f4e7bb          	remw	a5,s1,a5
    80003fe8:	fa0786e3          	beqz	a5,80003f94 <_Z8consumerPv+0x28>
        if (i % 80 == 0) {
    80003fec:	05000793          	li	a5,80
    80003ff0:	02f4e4bb          	remw	s1,s1,a5
    80003ff4:	fa049ce3          	bnez	s1,80003fac <_Z8consumerPv+0x40>
    80003ff8:	fa9ff06f          	j	80003fa0 <_Z8consumerPv+0x34>
        }
    }

    sem_signal(data->wait);
    80003ffc:	01093503          	ld	a0,16(s2)
    80004000:	ffffe097          	auipc	ra,0xffffe
    80004004:	700080e7          	jalr	1792(ra) # 80002700 <_Z10sem_signalP4_sem>
}
    80004008:	02813083          	ld	ra,40(sp)
    8000400c:	02013403          	ld	s0,32(sp)
    80004010:	01813483          	ld	s1,24(sp)
    80004014:	01013903          	ld	s2,16(sp)
    80004018:	00813983          	ld	s3,8(sp)
    8000401c:	03010113          	addi	sp,sp,48
    80004020:	00008067          	ret

0000000080004024 <_Z11printStringPKc>:
{
    80004024:	fe010113          	addi	sp,sp,-32
    80004028:	00113c23          	sd	ra,24(sp)
    8000402c:	00813823          	sd	s0,16(sp)
    80004030:	00913423          	sd	s1,8(sp)
    80004034:	02010413          	addi	s0,sp,32
    80004038:	00050493          	mv	s1,a0
    LOCK();
    8000403c:	00100613          	li	a2,1
    80004040:	00000593          	li	a1,0
    80004044:	00006517          	auipc	a0,0x6
    80004048:	f2c50513          	addi	a0,a0,-212 # 80009f70 <lockPrint>
    8000404c:	ffffd097          	auipc	ra,0xffffd
    80004050:	134080e7          	jalr	308(ra) # 80001180 <copy_and_swap>
    80004054:	fe0514e3          	bnez	a0,8000403c <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80004058:	0004c503          	lbu	a0,0(s1)
    8000405c:	00050a63          	beqz	a0,80004070 <_Z11printStringPKc+0x4c>
        putc(*string);
    80004060:	ffffe097          	auipc	ra,0xffffe
    80004064:	73c080e7          	jalr	1852(ra) # 8000279c <_Z4putcc>
        string++;
    80004068:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    8000406c:	fedff06f          	j	80004058 <_Z11printStringPKc+0x34>
    UNLOCK();
    80004070:	00000613          	li	a2,0
    80004074:	00100593          	li	a1,1
    80004078:	00006517          	auipc	a0,0x6
    8000407c:	ef850513          	addi	a0,a0,-264 # 80009f70 <lockPrint>
    80004080:	ffffd097          	auipc	ra,0xffffd
    80004084:	100080e7          	jalr	256(ra) # 80001180 <copy_and_swap>
    80004088:	fe0514e3          	bnez	a0,80004070 <_Z11printStringPKc+0x4c>
}
    8000408c:	01813083          	ld	ra,24(sp)
    80004090:	01013403          	ld	s0,16(sp)
    80004094:	00813483          	ld	s1,8(sp)
    80004098:	02010113          	addi	sp,sp,32
    8000409c:	00008067          	ret

00000000800040a0 <_Z11workerBodyAPv>:
    if (n == 0 || n == 1) { return n; }
    if (n % 10 == 0) { thread_dispatch(); }
    return fibonacci(n - 1) + fibonacci(n - 2);
}

void workerBodyA(void* arg) {
    800040a0:	fe010113          	addi	sp,sp,-32
    800040a4:	00113c23          	sd	ra,24(sp)
    800040a8:	00813823          	sd	s0,16(sp)
    800040ac:	00913423          	sd	s1,8(sp)
    800040b0:	01213023          	sd	s2,0(sp)
    800040b4:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    800040b8:	00000913          	li	s2,0
    800040bc:	0380006f          	j	800040f4 <_Z11workerBodyAPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    800040c0:	ffffe097          	auipc	ra,0xffffe
    800040c4:	508080e7          	jalr	1288(ra) # 800025c8 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800040c8:	00148493          	addi	s1,s1,1
    800040cc:	000027b7          	lui	a5,0x2
    800040d0:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800040d4:	0097ee63          	bltu	a5,s1,800040f0 <_Z11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800040d8:	00000713          	li	a4,0
    800040dc:	000077b7          	lui	a5,0x7
    800040e0:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800040e4:	fce7eee3          	bltu	a5,a4,800040c0 <_Z11workerBodyAPv+0x20>
    800040e8:	00170713          	addi	a4,a4,1
    800040ec:	ff1ff06f          	j	800040dc <_Z11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    800040f0:	00190913          	addi	s2,s2,1
    800040f4:	00900793          	li	a5,9
    800040f8:	0527e063          	bltu	a5,s2,80004138 <_Z11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    800040fc:	00004517          	auipc	a0,0x4
    80004100:	10450513          	addi	a0,a0,260 # 80008200 <_ZZ14kprintUnsignedmE6digits+0x10>
    80004104:	00000097          	auipc	ra,0x0
    80004108:	f20080e7          	jalr	-224(ra) # 80004024 <_Z11printStringPKc>
    8000410c:	00000613          	li	a2,0
    80004110:	00a00593          	li	a1,10
    80004114:	0009051b          	sext.w	a0,s2
    80004118:	00000097          	auipc	ra,0x0
    8000411c:	bec080e7          	jalr	-1044(ra) # 80003d04 <_ZL8printIntiii>
    80004120:	00004517          	auipc	a0,0x4
    80004124:	06850513          	addi	a0,a0,104 # 80008188 <CONSOLE_STATUS+0x178>
    80004128:	00000097          	auipc	ra,0x0
    8000412c:	efc080e7          	jalr	-260(ra) # 80004024 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80004130:	00000493          	li	s1,0
    80004134:	f99ff06f          	j	800040cc <_Z11workerBodyAPv+0x2c>
        }
    }
    printString("A finished!\n");
    80004138:	00004517          	auipc	a0,0x4
    8000413c:	0d050513          	addi	a0,a0,208 # 80008208 <_ZZ14kprintUnsignedmE6digits+0x18>
    80004140:	00000097          	auipc	ra,0x0
    80004144:	ee4080e7          	jalr	-284(ra) # 80004024 <_Z11printStringPKc>
    finishedA = true;
    80004148:	00100793          	li	a5,1
    8000414c:	00006717          	auipc	a4,0x6
    80004150:	e2f70823          	sb	a5,-464(a4) # 80009f7c <finishedA>
}
    80004154:	01813083          	ld	ra,24(sp)
    80004158:	01013403          	ld	s0,16(sp)
    8000415c:	00813483          	ld	s1,8(sp)
    80004160:	00013903          	ld	s2,0(sp)
    80004164:	02010113          	addi	sp,sp,32
    80004168:	00008067          	ret

000000008000416c <_Z11workerBodyBPv>:

void workerBodyB(void* arg) {
    8000416c:	fe010113          	addi	sp,sp,-32
    80004170:	00113c23          	sd	ra,24(sp)
    80004174:	00813823          	sd	s0,16(sp)
    80004178:	00913423          	sd	s1,8(sp)
    8000417c:	01213023          	sd	s2,0(sp)
    80004180:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80004184:	00000913          	li	s2,0
    80004188:	0380006f          	j	800041c0 <_Z11workerBodyBPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    8000418c:	ffffe097          	auipc	ra,0xffffe
    80004190:	43c080e7          	jalr	1084(ra) # 800025c8 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80004194:	00148493          	addi	s1,s1,1
    80004198:	000027b7          	lui	a5,0x2
    8000419c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800041a0:	0097ee63          	bltu	a5,s1,800041bc <_Z11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800041a4:	00000713          	li	a4,0
    800041a8:	000077b7          	lui	a5,0x7
    800041ac:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800041b0:	fce7eee3          	bltu	a5,a4,8000418c <_Z11workerBodyBPv+0x20>
    800041b4:	00170713          	addi	a4,a4,1
    800041b8:	ff1ff06f          	j	800041a8 <_Z11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    800041bc:	00190913          	addi	s2,s2,1
    800041c0:	00f00793          	li	a5,15
    800041c4:	0527e063          	bltu	a5,s2,80004204 <_Z11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    800041c8:	00004517          	auipc	a0,0x4
    800041cc:	05050513          	addi	a0,a0,80 # 80008218 <_ZZ14kprintUnsignedmE6digits+0x28>
    800041d0:	00000097          	auipc	ra,0x0
    800041d4:	e54080e7          	jalr	-428(ra) # 80004024 <_Z11printStringPKc>
    800041d8:	00000613          	li	a2,0
    800041dc:	00a00593          	li	a1,10
    800041e0:	0009051b          	sext.w	a0,s2
    800041e4:	00000097          	auipc	ra,0x0
    800041e8:	b20080e7          	jalr	-1248(ra) # 80003d04 <_ZL8printIntiii>
    800041ec:	00004517          	auipc	a0,0x4
    800041f0:	f9c50513          	addi	a0,a0,-100 # 80008188 <CONSOLE_STATUS+0x178>
    800041f4:	00000097          	auipc	ra,0x0
    800041f8:	e30080e7          	jalr	-464(ra) # 80004024 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800041fc:	00000493          	li	s1,0
    80004200:	f99ff06f          	j	80004198 <_Z11workerBodyBPv+0x2c>
        }
    }
    printString("B finished!\n");
    80004204:	00004517          	auipc	a0,0x4
    80004208:	01c50513          	addi	a0,a0,28 # 80008220 <_ZZ14kprintUnsignedmE6digits+0x30>
    8000420c:	00000097          	auipc	ra,0x0
    80004210:	e18080e7          	jalr	-488(ra) # 80004024 <_Z11printStringPKc>
    finishedB = true;
    80004214:	00100793          	li	a5,1
    80004218:	00006717          	auipc	a4,0x6
    8000421c:	d6f702a3          	sb	a5,-667(a4) # 80009f7d <finishedB>
    thread_dispatch();
    80004220:	ffffe097          	auipc	ra,0xffffe
    80004224:	3a8080e7          	jalr	936(ra) # 800025c8 <_Z15thread_dispatchv>
}
    80004228:	01813083          	ld	ra,24(sp)
    8000422c:	01013403          	ld	s0,16(sp)
    80004230:	00813483          	ld	s1,8(sp)
    80004234:	00013903          	ld	s2,0(sp)
    80004238:	02010113          	addi	sp,sp,32
    8000423c:	00008067          	ret

0000000080004240 <_Z9sleepyRunPv>:

#include "printing.hpp"

bool finished[2];

void sleepyRun(void *arg) {
    80004240:	fe010113          	addi	sp,sp,-32
    80004244:	00113c23          	sd	ra,24(sp)
    80004248:	00813823          	sd	s0,16(sp)
    8000424c:	00913423          	sd	s1,8(sp)
    80004250:	01213023          	sd	s2,0(sp)
    80004254:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    80004258:	00053903          	ld	s2,0(a0)
    int i = 6;
    8000425c:	00600493          	li	s1,6
    while (--i > 0) {
    80004260:	fff4849b          	addiw	s1,s1,-1
    80004264:	04905463          	blez	s1,800042ac <_Z9sleepyRunPv+0x6c>
        printString("Hello ");
    80004268:	00004517          	auipc	a0,0x4
    8000426c:	fc850513          	addi	a0,a0,-56 # 80008230 <_ZZ14kprintUnsignedmE6digits+0x40>
    80004270:	00000097          	auipc	ra,0x0
    80004274:	db4080e7          	jalr	-588(ra) # 80004024 <_Z11printStringPKc>
        printInt(sleep_time);
    80004278:	00000613          	li	a2,0
    8000427c:	00a00593          	li	a1,10
    80004280:	0009051b          	sext.w	a0,s2
    80004284:	00000097          	auipc	ra,0x0
    80004288:	a80080e7          	jalr	-1408(ra) # 80003d04 <_ZL8printIntiii>
        printString(" !\n");
    8000428c:	00004517          	auipc	a0,0x4
    80004290:	fac50513          	addi	a0,a0,-84 # 80008238 <_ZZ14kprintUnsignedmE6digits+0x48>
    80004294:	00000097          	auipc	ra,0x0
    80004298:	d90080e7          	jalr	-624(ra) # 80004024 <_Z11printStringPKc>
        time_sleep(sleep_time);
    8000429c:	00090513          	mv	a0,s2
    800042a0:	ffffe097          	auipc	ra,0xffffe
    800042a4:	494080e7          	jalr	1172(ra) # 80002734 <_Z10time_sleepm>
    while (--i > 0) {
    800042a8:	fb9ff06f          	j	80004260 <_Z9sleepyRunPv+0x20>
    }
    finished[sleep_time/10-1] = true;
    800042ac:	00a00793          	li	a5,10
    800042b0:	02f95933          	divu	s2,s2,a5
    800042b4:	fff90913          	addi	s2,s2,-1
    800042b8:	00006797          	auipc	a5,0x6
    800042bc:	cb878793          	addi	a5,a5,-840 # 80009f70 <lockPrint>
    800042c0:	01278933          	add	s2,a5,s2
    800042c4:	00100793          	li	a5,1
    800042c8:	00f90823          	sb	a5,16(s2)
}
    800042cc:	01813083          	ld	ra,24(sp)
    800042d0:	01013403          	ld	s0,16(sp)
    800042d4:	00813483          	ld	s1,8(sp)
    800042d8:	00013903          	ld	s2,0(sp)
    800042dc:	02010113          	addi	sp,sp,32
    800042e0:	00008067          	ret

00000000800042e4 <_Z11workerBodyEPv>:
//    printInteger(n);
//    printString(" fibonacci number\n");
    return fibonacci(n-1) + fibonacci(n-2);
}

void workerBodyE(void *) {
    800042e4:	fe010113          	addi	sp,sp,-32
    800042e8:	00113c23          	sd	ra,24(sp)
    800042ec:	00813823          	sd	s0,16(sp)
    800042f0:	00913423          	sd	s1,8(sp)
    800042f4:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    800042f8:	00000493          	li	s1,0
    800042fc:	0180006f          	j	80004314 <_Z11workerBodyEPv+0x30>
        printString("A: i=");
        printInt(i);
        printString("\n");
        if (i % 4 == 0) time_sleep(50);
    80004300:	03200513          	li	a0,50
    80004304:	ffffe097          	auipc	ra,0xffffe
    80004308:	430080e7          	jalr	1072(ra) # 80002734 <_Z10time_sleepm>
    8000430c:	04c0006f          	j	80004358 <_Z11workerBodyEPv+0x74>
    for (uint64 i = 0; i < 10; i++) {
    80004310:	00148493          	addi	s1,s1,1
    80004314:	00900793          	li	a5,9
    80004318:	0497ec63          	bltu	a5,s1,80004370 <_Z11workerBodyEPv+0x8c>
        printString("A: i=");
    8000431c:	00004517          	auipc	a0,0x4
    80004320:	ee450513          	addi	a0,a0,-284 # 80008200 <_ZZ14kprintUnsignedmE6digits+0x10>
    80004324:	00000097          	auipc	ra,0x0
    80004328:	d00080e7          	jalr	-768(ra) # 80004024 <_Z11printStringPKc>
        printInt(i);
    8000432c:	00000613          	li	a2,0
    80004330:	00a00593          	li	a1,10
    80004334:	0004851b          	sext.w	a0,s1
    80004338:	00000097          	auipc	ra,0x0
    8000433c:	9cc080e7          	jalr	-1588(ra) # 80003d04 <_ZL8printIntiii>
        printString("\n");
    80004340:	00004517          	auipc	a0,0x4
    80004344:	e4850513          	addi	a0,a0,-440 # 80008188 <CONSOLE_STATUS+0x178>
    80004348:	00000097          	auipc	ra,0x0
    8000434c:	cdc080e7          	jalr	-804(ra) # 80004024 <_Z11printStringPKc>
        if (i % 4 == 0) time_sleep(50);
    80004350:	0034f793          	andi	a5,s1,3
    80004354:	fa0786e3          	beqz	a5,80004300 <_Z11workerBodyEPv+0x1c>
        for (uint64 k = 0; k < 30000; k++) {
    80004358:	00000713          	li	a4,0
    8000435c:	000077b7          	lui	a5,0x7
    80004360:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80004364:	fae7e6e3          	bltu	a5,a4,80004310 <_Z11workerBodyEPv+0x2c>
    80004368:	00170713          	addi	a4,a4,1
    8000436c:	ff1ff06f          	j	8000435c <_Z11workerBodyEPv+0x78>
            //busy wait
        }
        // TCB::yield();
    }
    printString("Worker A finished\n");
    80004370:	00004517          	auipc	a0,0x4
    80004374:	ed050513          	addi	a0,a0,-304 # 80008240 <_ZZ14kprintUnsignedmE6digits+0x50>
    80004378:	00000097          	auipc	ra,0x0
    8000437c:	cac080e7          	jalr	-852(ra) # 80004024 <_Z11printStringPKc>
}
    80004380:	01813083          	ld	ra,24(sp)
    80004384:	01013403          	ld	s0,16(sp)
    80004388:	00813483          	ld	s1,8(sp)
    8000438c:	02010113          	addi	sp,sp,32
    80004390:	00008067          	ret

0000000080004394 <_Z11workerBodyFPv>:

void workerBodyF(void *) {
    80004394:	fe010113          	addi	sp,sp,-32
    80004398:	00113c23          	sd	ra,24(sp)
    8000439c:	00813823          	sd	s0,16(sp)
    800043a0:	00913423          	sd	s1,8(sp)
    800043a4:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    800043a8:	00000493          	li	s1,0
    800043ac:	0380006f          	j	800043e4 <_Z11workerBodyFPv+0x50>
        printString("B: i=");
        printInt(i);
        printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
    800043b0:	00168693          	addi	a3,a3,1
    800043b4:	000027b7          	lui	a5,0x2
    800043b8:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800043bc:	00d7ee63          	bltu	a5,a3,800043d8 <_Z11workerBodyFPv+0x44>
            for (uint64 k = 0; k < 30000; k++) {
    800043c0:	00000713          	li	a4,0
    800043c4:	000077b7          	lui	a5,0x7
    800043c8:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800043cc:	fee7e2e3          	bltu	a5,a4,800043b0 <_Z11workerBodyFPv+0x1c>
    800043d0:	00170713          	addi	a4,a4,1
    800043d4:	ff1ff06f          	j	800043c4 <_Z11workerBodyFPv+0x30>
                // busy wait
            }
            // TCB::yield()
        }
        thread_dispatch();
    800043d8:	ffffe097          	auipc	ra,0xffffe
    800043dc:	1f0080e7          	jalr	496(ra) # 800025c8 <_Z15thread_dispatchv>
    for (uint64 i = 0; i < 16; i++) {
    800043e0:	00148493          	addi	s1,s1,1
    800043e4:	00f00793          	li	a5,15
    800043e8:	0497e063          	bltu	a5,s1,80004428 <_Z11workerBodyFPv+0x94>
        printString("B: i=");
    800043ec:	00004517          	auipc	a0,0x4
    800043f0:	e2c50513          	addi	a0,a0,-468 # 80008218 <_ZZ14kprintUnsignedmE6digits+0x28>
    800043f4:	00000097          	auipc	ra,0x0
    800043f8:	c30080e7          	jalr	-976(ra) # 80004024 <_Z11printStringPKc>
        printInt(i);
    800043fc:	00000613          	li	a2,0
    80004400:	00a00593          	li	a1,10
    80004404:	0004851b          	sext.w	a0,s1
    80004408:	00000097          	auipc	ra,0x0
    8000440c:	8fc080e7          	jalr	-1796(ra) # 80003d04 <_ZL8printIntiii>
        printString("\n");
    80004410:	00004517          	auipc	a0,0x4
    80004414:	d7850513          	addi	a0,a0,-648 # 80008188 <CONSOLE_STATUS+0x178>
    80004418:	00000097          	auipc	ra,0x0
    8000441c:	c0c080e7          	jalr	-1012(ra) # 80004024 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80004420:	00000693          	li	a3,0
    80004424:	f91ff06f          	j	800043b4 <_Z11workerBodyFPv+0x20>
    }
    printString("Worker B finished\n");
    80004428:	00004517          	auipc	a0,0x4
    8000442c:	e3050513          	addi	a0,a0,-464 # 80008258 <_ZZ14kprintUnsignedmE6digits+0x68>
    80004430:	00000097          	auipc	ra,0x0
    80004434:	bf4080e7          	jalr	-1036(ra) # 80004024 <_Z11printStringPKc>
}
    80004438:	01813083          	ld	ra,24(sp)
    8000443c:	01013403          	ld	s0,16(sp)
    80004440:	00813483          	ld	s1,8(sp)
    80004444:	02010113          	addi	sp,sp,32
    80004448:	00008067          	ret

000000008000444c <_Z9getStringPci>:
char* getString(char *buf, int max) {
    8000444c:	fd010113          	addi	sp,sp,-48
    80004450:	02113423          	sd	ra,40(sp)
    80004454:	02813023          	sd	s0,32(sp)
    80004458:	00913c23          	sd	s1,24(sp)
    8000445c:	01213823          	sd	s2,16(sp)
    80004460:	01313423          	sd	s3,8(sp)
    80004464:	01413023          	sd	s4,0(sp)
    80004468:	03010413          	addi	s0,sp,48
    8000446c:	00050993          	mv	s3,a0
    80004470:	00058a13          	mv	s4,a1
    LOCK();
    80004474:	00100613          	li	a2,1
    80004478:	00000593          	li	a1,0
    8000447c:	00006517          	auipc	a0,0x6
    80004480:	af450513          	addi	a0,a0,-1292 # 80009f70 <lockPrint>
    80004484:	ffffd097          	auipc	ra,0xffffd
    80004488:	cfc080e7          	jalr	-772(ra) # 80001180 <copy_and_swap>
    8000448c:	fe0514e3          	bnez	a0,80004474 <_Z9getStringPci+0x28>
    for(i=0; i+1 < max; ){
    80004490:	00000913          	li	s2,0
    80004494:	00090493          	mv	s1,s2
    80004498:	0019091b          	addiw	s2,s2,1
    8000449c:	03495a63          	bge	s2,s4,800044d0 <_Z9getStringPci+0x84>
        cc = getc();
    800044a0:	ffffe097          	auipc	ra,0xffffe
    800044a4:	2c8080e7          	jalr	712(ra) # 80002768 <_Z4getcv>
        if(cc < 1)
    800044a8:	02050463          	beqz	a0,800044d0 <_Z9getStringPci+0x84>
        buf[i++] = c;
    800044ac:	009984b3          	add	s1,s3,s1
    800044b0:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    800044b4:	00a00793          	li	a5,10
    800044b8:	00f50a63          	beq	a0,a5,800044cc <_Z9getStringPci+0x80>
    800044bc:	00d00793          	li	a5,13
    800044c0:	fcf51ae3          	bne	a0,a5,80004494 <_Z9getStringPci+0x48>
        buf[i++] = c;
    800044c4:	00090493          	mv	s1,s2
    800044c8:	0080006f          	j	800044d0 <_Z9getStringPci+0x84>
    800044cc:	00090493          	mv	s1,s2
    buf[i] = '\0';
    800044d0:	009984b3          	add	s1,s3,s1
    800044d4:	00048023          	sb	zero,0(s1)
    UNLOCK();
    800044d8:	00000613          	li	a2,0
    800044dc:	00100593          	li	a1,1
    800044e0:	00006517          	auipc	a0,0x6
    800044e4:	a9050513          	addi	a0,a0,-1392 # 80009f70 <lockPrint>
    800044e8:	ffffd097          	auipc	ra,0xffffd
    800044ec:	c98080e7          	jalr	-872(ra) # 80001180 <copy_and_swap>
    800044f0:	fe0514e3          	bnez	a0,800044d8 <_Z9getStringPci+0x8c>
}
    800044f4:	00098513          	mv	a0,s3
    800044f8:	02813083          	ld	ra,40(sp)
    800044fc:	02013403          	ld	s0,32(sp)
    80004500:	01813483          	ld	s1,24(sp)
    80004504:	01013903          	ld	s2,16(sp)
    80004508:	00813983          	ld	s3,8(sp)
    8000450c:	00013a03          	ld	s4,0(sp)
    80004510:	03010113          	addi	sp,sp,48
    80004514:	00008067          	ret

0000000080004518 <_Z11stringToIntPKc>:
int stringToInt(const char *s) {
    80004518:	ff010113          	addi	sp,sp,-16
    8000451c:	00813423          	sd	s0,8(sp)
    80004520:	01010413          	addi	s0,sp,16
    80004524:	00050693          	mv	a3,a0
    n = 0;
    80004528:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    8000452c:	0006c603          	lbu	a2,0(a3)
    80004530:	fd06071b          	addiw	a4,a2,-48
    80004534:	0ff77713          	andi	a4,a4,255
    80004538:	00900793          	li	a5,9
    8000453c:	02e7e063          	bltu	a5,a4,8000455c <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80004540:	0025179b          	slliw	a5,a0,0x2
    80004544:	00a787bb          	addw	a5,a5,a0
    80004548:	0017979b          	slliw	a5,a5,0x1
    8000454c:	00168693          	addi	a3,a3,1
    80004550:	00c787bb          	addw	a5,a5,a2
    80004554:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80004558:	fd5ff06f          	j	8000452c <_Z11stringToIntPKc+0x14>
}
    8000455c:	00813403          	ld	s0,8(sp)
    80004560:	01010113          	addi	sp,sp,16
    80004564:	00008067          	ret

0000000080004568 <_Z9fibonaccim>:
uint64 fibonacci(uint64 n) {
    80004568:	fe010113          	addi	sp,sp,-32
    8000456c:	00113c23          	sd	ra,24(sp)
    80004570:	00813823          	sd	s0,16(sp)
    80004574:	00913423          	sd	s1,8(sp)
    80004578:	01213023          	sd	s2,0(sp)
    8000457c:	02010413          	addi	s0,sp,32
    80004580:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80004584:	00100793          	li	a5,1
    80004588:	02a7f863          	bgeu	a5,a0,800045b8 <_Z9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    8000458c:	00a00793          	li	a5,10
    80004590:	02f577b3          	remu	a5,a0,a5
    80004594:	02078e63          	beqz	a5,800045d0 <_Z9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80004598:	fff48513          	addi	a0,s1,-1
    8000459c:	00000097          	auipc	ra,0x0
    800045a0:	fcc080e7          	jalr	-52(ra) # 80004568 <_Z9fibonaccim>
    800045a4:	00050913          	mv	s2,a0
    800045a8:	ffe48513          	addi	a0,s1,-2
    800045ac:	00000097          	auipc	ra,0x0
    800045b0:	fbc080e7          	jalr	-68(ra) # 80004568 <_Z9fibonaccim>
    800045b4:	00a90533          	add	a0,s2,a0
}
    800045b8:	01813083          	ld	ra,24(sp)
    800045bc:	01013403          	ld	s0,16(sp)
    800045c0:	00813483          	ld	s1,8(sp)
    800045c4:	00013903          	ld	s2,0(sp)
    800045c8:	02010113          	addi	sp,sp,32
    800045cc:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    800045d0:	ffffe097          	auipc	ra,0xffffe
    800045d4:	ff8080e7          	jalr	-8(ra) # 800025c8 <_Z15thread_dispatchv>
    800045d8:	fc1ff06f          	j	80004598 <_Z9fibonaccim+0x30>

00000000800045dc <_Z11workerBodyCPv>:

void workerBodyC(void* arg) {
    800045dc:	fe010113          	addi	sp,sp,-32
    800045e0:	00113c23          	sd	ra,24(sp)
    800045e4:	00813823          	sd	s0,16(sp)
    800045e8:	00913423          	sd	s1,8(sp)
    800045ec:	01213023          	sd	s2,0(sp)
    800045f0:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800045f4:	00000493          	li	s1,0
    800045f8:	0400006f          	j	80004638 <_Z11workerBodyCPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    800045fc:	00004517          	auipc	a0,0x4
    80004600:	c7450513          	addi	a0,a0,-908 # 80008270 <_ZZ14kprintUnsignedmE6digits+0x80>
    80004604:	00000097          	auipc	ra,0x0
    80004608:	a20080e7          	jalr	-1504(ra) # 80004024 <_Z11printStringPKc>
    8000460c:	00000613          	li	a2,0
    80004610:	00a00593          	li	a1,10
    80004614:	00048513          	mv	a0,s1
    80004618:	fffff097          	auipc	ra,0xfffff
    8000461c:	6ec080e7          	jalr	1772(ra) # 80003d04 <_ZL8printIntiii>
    80004620:	00004517          	auipc	a0,0x4
    80004624:	b6850513          	addi	a0,a0,-1176 # 80008188 <CONSOLE_STATUS+0x178>
    80004628:	00000097          	auipc	ra,0x0
    8000462c:	9fc080e7          	jalr	-1540(ra) # 80004024 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80004630:	0014849b          	addiw	s1,s1,1
    80004634:	0ff4f493          	andi	s1,s1,255
    80004638:	00200793          	li	a5,2
    8000463c:	fc97f0e3          	bgeu	a5,s1,800045fc <_Z11workerBodyCPv+0x20>
    }

    printString("C: dispatch\n");
    80004640:	00004517          	auipc	a0,0x4
    80004644:	c3850513          	addi	a0,a0,-968 # 80008278 <_ZZ14kprintUnsignedmE6digits+0x88>
    80004648:	00000097          	auipc	ra,0x0
    8000464c:	9dc080e7          	jalr	-1572(ra) # 80004024 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80004650:	00700313          	li	t1,7
    thread_dispatch();
    80004654:	ffffe097          	auipc	ra,0xffffe
    80004658:	f74080e7          	jalr	-140(ra) # 800025c8 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    8000465c:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    80004660:	00004517          	auipc	a0,0x4
    80004664:	c2850513          	addi	a0,a0,-984 # 80008288 <_ZZ14kprintUnsignedmE6digits+0x98>
    80004668:	00000097          	auipc	ra,0x0
    8000466c:	9bc080e7          	jalr	-1604(ra) # 80004024 <_Z11printStringPKc>
    80004670:	00000613          	li	a2,0
    80004674:	00a00593          	li	a1,10
    80004678:	0009051b          	sext.w	a0,s2
    8000467c:	fffff097          	auipc	ra,0xfffff
    80004680:	688080e7          	jalr	1672(ra) # 80003d04 <_ZL8printIntiii>
    80004684:	00004517          	auipc	a0,0x4
    80004688:	b0450513          	addi	a0,a0,-1276 # 80008188 <CONSOLE_STATUS+0x178>
    8000468c:	00000097          	auipc	ra,0x0
    80004690:	998080e7          	jalr	-1640(ra) # 80004024 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80004694:	00c00513          	li	a0,12
    80004698:	00000097          	auipc	ra,0x0
    8000469c:	ed0080e7          	jalr	-304(ra) # 80004568 <_Z9fibonaccim>
    800046a0:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    800046a4:	00004517          	auipc	a0,0x4
    800046a8:	bec50513          	addi	a0,a0,-1044 # 80008290 <_ZZ14kprintUnsignedmE6digits+0xa0>
    800046ac:	00000097          	auipc	ra,0x0
    800046b0:	978080e7          	jalr	-1672(ra) # 80004024 <_Z11printStringPKc>
    800046b4:	00000613          	li	a2,0
    800046b8:	00a00593          	li	a1,10
    800046bc:	0009051b          	sext.w	a0,s2
    800046c0:	fffff097          	auipc	ra,0xfffff
    800046c4:	644080e7          	jalr	1604(ra) # 80003d04 <_ZL8printIntiii>
    800046c8:	00004517          	auipc	a0,0x4
    800046cc:	ac050513          	addi	a0,a0,-1344 # 80008188 <CONSOLE_STATUS+0x178>
    800046d0:	00000097          	auipc	ra,0x0
    800046d4:	954080e7          	jalr	-1708(ra) # 80004024 <_Z11printStringPKc>
    800046d8:	0400006f          	j	80004718 <_Z11workerBodyCPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    800046dc:	00004517          	auipc	a0,0x4
    800046e0:	b9450513          	addi	a0,a0,-1132 # 80008270 <_ZZ14kprintUnsignedmE6digits+0x80>
    800046e4:	00000097          	auipc	ra,0x0
    800046e8:	940080e7          	jalr	-1728(ra) # 80004024 <_Z11printStringPKc>
    800046ec:	00000613          	li	a2,0
    800046f0:	00a00593          	li	a1,10
    800046f4:	00048513          	mv	a0,s1
    800046f8:	fffff097          	auipc	ra,0xfffff
    800046fc:	60c080e7          	jalr	1548(ra) # 80003d04 <_ZL8printIntiii>
    80004700:	00004517          	auipc	a0,0x4
    80004704:	a8850513          	addi	a0,a0,-1400 # 80008188 <CONSOLE_STATUS+0x178>
    80004708:	00000097          	auipc	ra,0x0
    8000470c:	91c080e7          	jalr	-1764(ra) # 80004024 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80004710:	0014849b          	addiw	s1,s1,1
    80004714:	0ff4f493          	andi	s1,s1,255
    80004718:	00500793          	li	a5,5
    8000471c:	fc97f0e3          	bgeu	a5,s1,800046dc <_Z11workerBodyCPv+0x100>
    }

    printString("C finished!\n");
    80004720:	00004517          	auipc	a0,0x4
    80004724:	b8050513          	addi	a0,a0,-1152 # 800082a0 <_ZZ14kprintUnsignedmE6digits+0xb0>
    80004728:	00000097          	auipc	ra,0x0
    8000472c:	8fc080e7          	jalr	-1796(ra) # 80004024 <_Z11printStringPKc>
    finishedC = true;
    80004730:	00100793          	li	a5,1
    80004734:	00006717          	auipc	a4,0x6
    80004738:	84f70723          	sb	a5,-1970(a4) # 80009f82 <finishedC>
    thread_dispatch();
    8000473c:	ffffe097          	auipc	ra,0xffffe
    80004740:	e8c080e7          	jalr	-372(ra) # 800025c8 <_Z15thread_dispatchv>
}
    80004744:	01813083          	ld	ra,24(sp)
    80004748:	01013403          	ld	s0,16(sp)
    8000474c:	00813483          	ld	s1,8(sp)
    80004750:	00013903          	ld	s2,0(sp)
    80004754:	02010113          	addi	sp,sp,32
    80004758:	00008067          	ret

000000008000475c <_Z11workerBodyDPv>:

void workerBodyD(void* arg) {
    8000475c:	fe010113          	addi	sp,sp,-32
    80004760:	00113c23          	sd	ra,24(sp)
    80004764:	00813823          	sd	s0,16(sp)
    80004768:	00913423          	sd	s1,8(sp)
    8000476c:	01213023          	sd	s2,0(sp)
    80004770:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80004774:	00a00493          	li	s1,10
    80004778:	0400006f          	j	800047b8 <_Z11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    8000477c:	00004517          	auipc	a0,0x4
    80004780:	b3450513          	addi	a0,a0,-1228 # 800082b0 <_ZZ14kprintUnsignedmE6digits+0xc0>
    80004784:	00000097          	auipc	ra,0x0
    80004788:	8a0080e7          	jalr	-1888(ra) # 80004024 <_Z11printStringPKc>
    8000478c:	00000613          	li	a2,0
    80004790:	00a00593          	li	a1,10
    80004794:	00048513          	mv	a0,s1
    80004798:	fffff097          	auipc	ra,0xfffff
    8000479c:	56c080e7          	jalr	1388(ra) # 80003d04 <_ZL8printIntiii>
    800047a0:	00004517          	auipc	a0,0x4
    800047a4:	9e850513          	addi	a0,a0,-1560 # 80008188 <CONSOLE_STATUS+0x178>
    800047a8:	00000097          	auipc	ra,0x0
    800047ac:	87c080e7          	jalr	-1924(ra) # 80004024 <_Z11printStringPKc>
    for (; i < 13; i++) {
    800047b0:	0014849b          	addiw	s1,s1,1
    800047b4:	0ff4f493          	andi	s1,s1,255
    800047b8:	00c00793          	li	a5,12
    800047bc:	fc97f0e3          	bgeu	a5,s1,8000477c <_Z11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    800047c0:	00004517          	auipc	a0,0x4
    800047c4:	af850513          	addi	a0,a0,-1288 # 800082b8 <_ZZ14kprintUnsignedmE6digits+0xc8>
    800047c8:	00000097          	auipc	ra,0x0
    800047cc:	85c080e7          	jalr	-1956(ra) # 80004024 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    800047d0:	00500313          	li	t1,5
    thread_dispatch();
    800047d4:	ffffe097          	auipc	ra,0xffffe
    800047d8:	df4080e7          	jalr	-524(ra) # 800025c8 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    800047dc:	01000513          	li	a0,16
    800047e0:	00000097          	auipc	ra,0x0
    800047e4:	d88080e7          	jalr	-632(ra) # 80004568 <_Z9fibonaccim>
    800047e8:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    800047ec:	00004517          	auipc	a0,0x4
    800047f0:	adc50513          	addi	a0,a0,-1316 # 800082c8 <_ZZ14kprintUnsignedmE6digits+0xd8>
    800047f4:	00000097          	auipc	ra,0x0
    800047f8:	830080e7          	jalr	-2000(ra) # 80004024 <_Z11printStringPKc>
    800047fc:	00000613          	li	a2,0
    80004800:	00a00593          	li	a1,10
    80004804:	0009051b          	sext.w	a0,s2
    80004808:	fffff097          	auipc	ra,0xfffff
    8000480c:	4fc080e7          	jalr	1276(ra) # 80003d04 <_ZL8printIntiii>
    80004810:	00004517          	auipc	a0,0x4
    80004814:	97850513          	addi	a0,a0,-1672 # 80008188 <CONSOLE_STATUS+0x178>
    80004818:	00000097          	auipc	ra,0x0
    8000481c:	80c080e7          	jalr	-2036(ra) # 80004024 <_Z11printStringPKc>
    80004820:	0400006f          	j	80004860 <_Z11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004824:	00004517          	auipc	a0,0x4
    80004828:	a8c50513          	addi	a0,a0,-1396 # 800082b0 <_ZZ14kprintUnsignedmE6digits+0xc0>
    8000482c:	fffff097          	auipc	ra,0xfffff
    80004830:	7f8080e7          	jalr	2040(ra) # 80004024 <_Z11printStringPKc>
    80004834:	00000613          	li	a2,0
    80004838:	00a00593          	li	a1,10
    8000483c:	00048513          	mv	a0,s1
    80004840:	fffff097          	auipc	ra,0xfffff
    80004844:	4c4080e7          	jalr	1220(ra) # 80003d04 <_ZL8printIntiii>
    80004848:	00004517          	auipc	a0,0x4
    8000484c:	94050513          	addi	a0,a0,-1728 # 80008188 <CONSOLE_STATUS+0x178>
    80004850:	fffff097          	auipc	ra,0xfffff
    80004854:	7d4080e7          	jalr	2004(ra) # 80004024 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80004858:	0014849b          	addiw	s1,s1,1
    8000485c:	0ff4f493          	andi	s1,s1,255
    80004860:	00f00793          	li	a5,15
    80004864:	fc97f0e3          	bgeu	a5,s1,80004824 <_Z11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80004868:	00004517          	auipc	a0,0x4
    8000486c:	a7050513          	addi	a0,a0,-1424 # 800082d8 <_ZZ14kprintUnsignedmE6digits+0xe8>
    80004870:	fffff097          	auipc	ra,0xfffff
    80004874:	7b4080e7          	jalr	1972(ra) # 80004024 <_Z11printStringPKc>
    finishedD = true;
    80004878:	00100793          	li	a5,1
    8000487c:	00005717          	auipc	a4,0x5
    80004880:	70f703a3          	sb	a5,1799(a4) # 80009f83 <finishedD>
    thread_dispatch();
    80004884:	ffffe097          	auipc	ra,0xffffe
    80004888:	d44080e7          	jalr	-700(ra) # 800025c8 <_Z15thread_dispatchv>
}
    8000488c:	01813083          	ld	ra,24(sp)
    80004890:	01013403          	ld	s0,16(sp)
    80004894:	00813483          	ld	s1,8(sp)
    80004898:	00013903          	ld	s2,0(sp)
    8000489c:	02010113          	addi	sp,sp,32
    800048a0:	00008067          	ret

00000000800048a4 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    800048a4:	fc010113          	addi	sp,sp,-64
    800048a8:	02113c23          	sd	ra,56(sp)
    800048ac:	02813823          	sd	s0,48(sp)
    800048b0:	02913423          	sd	s1,40(sp)
    800048b4:	04010413          	addi	s0,sp,64
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    800048b8:	00000613          	li	a2,0
    800048bc:	fffff597          	auipc	a1,0xfffff
    800048c0:	7e458593          	addi	a1,a1,2020 # 800040a0 <_Z11workerBodyAPv>
    800048c4:	fc040513          	addi	a0,s0,-64
    800048c8:	ffffe097          	auipc	ra,0xffffe
    800048cc:	c20080e7          	jalr	-992(ra) # 800024e8 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadA created\n");
    800048d0:	00004517          	auipc	a0,0x4
    800048d4:	a1850513          	addi	a0,a0,-1512 # 800082e8 <_ZZ14kprintUnsignedmE6digits+0xf8>
    800048d8:	fffff097          	auipc	ra,0xfffff
    800048dc:	74c080e7          	jalr	1868(ra) # 80004024 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    800048e0:	00000613          	li	a2,0
    800048e4:	00000597          	auipc	a1,0x0
    800048e8:	88858593          	addi	a1,a1,-1912 # 8000416c <_Z11workerBodyBPv>
    800048ec:	fc840513          	addi	a0,s0,-56
    800048f0:	ffffe097          	auipc	ra,0xffffe
    800048f4:	bf8080e7          	jalr	-1032(ra) # 800024e8 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadB created\n");
    800048f8:	00004517          	auipc	a0,0x4
    800048fc:	a0850513          	addi	a0,a0,-1528 # 80008300 <_ZZ14kprintUnsignedmE6digits+0x110>
    80004900:	fffff097          	auipc	ra,0xfffff
    80004904:	724080e7          	jalr	1828(ra) # 80004024 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80004908:	00000613          	li	a2,0
    8000490c:	00000597          	auipc	a1,0x0
    80004910:	cd058593          	addi	a1,a1,-816 # 800045dc <_Z11workerBodyCPv>
    80004914:	fd040513          	addi	a0,s0,-48
    80004918:	ffffe097          	auipc	ra,0xffffe
    8000491c:	bd0080e7          	jalr	-1072(ra) # 800024e8 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadC created\n");
    80004920:	00004517          	auipc	a0,0x4
    80004924:	9f850513          	addi	a0,a0,-1544 # 80008318 <_ZZ14kprintUnsignedmE6digits+0x128>
    80004928:	fffff097          	auipc	ra,0xfffff
    8000492c:	6fc080e7          	jalr	1788(ra) # 80004024 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80004930:	00000613          	li	a2,0
    80004934:	00000597          	auipc	a1,0x0
    80004938:	e2858593          	addi	a1,a1,-472 # 8000475c <_Z11workerBodyDPv>
    8000493c:	fd840513          	addi	a0,s0,-40
    80004940:	ffffe097          	auipc	ra,0xffffe
    80004944:	ba8080e7          	jalr	-1112(ra) # 800024e8 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadD created\n");
    80004948:	00004517          	auipc	a0,0x4
    8000494c:	9e850513          	addi	a0,a0,-1560 # 80008330 <_ZZ14kprintUnsignedmE6digits+0x140>
    80004950:	fffff097          	auipc	ra,0xfffff
    80004954:	6d4080e7          	jalr	1748(ra) # 80004024 <_Z11printStringPKc>
    80004958:	00c0006f          	j	80004964 <_Z18Threads_C_API_testv+0xc0>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    8000495c:	ffffe097          	auipc	ra,0xffffe
    80004960:	c6c080e7          	jalr	-916(ra) # 800025c8 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80004964:	00005797          	auipc	a5,0x5
    80004968:	6187c783          	lbu	a5,1560(a5) # 80009f7c <finishedA>
    8000496c:	fe0788e3          	beqz	a5,8000495c <_Z18Threads_C_API_testv+0xb8>
    80004970:	00005797          	auipc	a5,0x5
    80004974:	60d7c783          	lbu	a5,1549(a5) # 80009f7d <finishedB>
    80004978:	fe0782e3          	beqz	a5,8000495c <_Z18Threads_C_API_testv+0xb8>
    8000497c:	00005797          	auipc	a5,0x5
    80004980:	6067c783          	lbu	a5,1542(a5) # 80009f82 <finishedC>
    80004984:	fc078ce3          	beqz	a5,8000495c <_Z18Threads_C_API_testv+0xb8>
    80004988:	00005797          	auipc	a5,0x5
    8000498c:	5fb7c783          	lbu	a5,1531(a5) # 80009f83 <finishedD>
    80004990:	fc0786e3          	beqz	a5,8000495c <_Z18Threads_C_API_testv+0xb8>
    }

    for (auto &thread: threads) { delete thread; }
    80004994:	fc040493          	addi	s1,s0,-64
    80004998:	0080006f          	j	800049a0 <_Z18Threads_C_API_testv+0xfc>
    8000499c:	00848493          	addi	s1,s1,8
    800049a0:	fe040793          	addi	a5,s0,-32
    800049a4:	00f48c63          	beq	s1,a5,800049bc <_Z18Threads_C_API_testv+0x118>
    800049a8:	0004b503          	ld	a0,0(s1)
    800049ac:	fe0508e3          	beqz	a0,8000499c <_Z18Threads_C_API_testv+0xf8>
    800049b0:	ffffe097          	auipc	ra,0xffffe
    800049b4:	e6c080e7          	jalr	-404(ra) # 8000281c <_ZdlPv>
    800049b8:	fe5ff06f          	j	8000499c <_Z18Threads_C_API_testv+0xf8>
}
    800049bc:	03813083          	ld	ra,56(sp)
    800049c0:	03013403          	ld	s0,48(sp)
    800049c4:	02813483          	ld	s1,40(sp)
    800049c8:	04010113          	addi	sp,sp,64
    800049cc:	00008067          	ret

00000000800049d0 <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    800049d0:	f7010113          	addi	sp,sp,-144
    800049d4:	08113423          	sd	ra,136(sp)
    800049d8:	08813023          	sd	s0,128(sp)
    800049dc:	06913c23          	sd	s1,120(sp)
    800049e0:	07213823          	sd	s2,112(sp)
    800049e4:	07313423          	sd	s3,104(sp)
    800049e8:	09010413          	addi	s0,sp,144
//    getString(input, 30);
//    n = stringToInt(input);

    n = 20;

    printString("Broj proizvodjaca "); printInt(threadNum);
    800049ec:	00004517          	auipc	a0,0x4
    800049f0:	95c50513          	addi	a0,a0,-1700 # 80008348 <_ZZ14kprintUnsignedmE6digits+0x158>
    800049f4:	fffff097          	auipc	ra,0xfffff
    800049f8:	630080e7          	jalr	1584(ra) # 80004024 <_Z11printStringPKc>
    800049fc:	00000613          	li	a2,0
    80004a00:	00a00593          	li	a1,10
    80004a04:	00a00513          	li	a0,10
    80004a08:	fffff097          	auipc	ra,0xfffff
    80004a0c:	2fc080e7          	jalr	764(ra) # 80003d04 <_ZL8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80004a10:	00004517          	auipc	a0,0x4
    80004a14:	95050513          	addi	a0,a0,-1712 # 80008360 <_ZZ14kprintUnsignedmE6digits+0x170>
    80004a18:	fffff097          	auipc	ra,0xfffff
    80004a1c:	60c080e7          	jalr	1548(ra) # 80004024 <_Z11printStringPKc>
    80004a20:	00000613          	li	a2,0
    80004a24:	00a00593          	li	a1,10
    80004a28:	01400513          	li	a0,20
    80004a2c:	fffff097          	auipc	ra,0xfffff
    80004a30:	2d8080e7          	jalr	728(ra) # 80003d04 <_ZL8printIntiii>
    printString(".\n");
    80004a34:	00004517          	auipc	a0,0x4
    80004a38:	94450513          	addi	a0,a0,-1724 # 80008378 <_ZZ14kprintUnsignedmE6digits+0x188>
    80004a3c:	fffff097          	auipc	ra,0xfffff
    80004a40:	5e8080e7          	jalr	1512(ra) # 80004024 <_Z11printStringPKc>

    Buffer *buffer = new Buffer(n);
    80004a44:	03800513          	li	a0,56
    80004a48:	ffffe097          	auipc	ra,0xffffe
    80004a4c:	d84080e7          	jalr	-636(ra) # 800027cc <_Znwm>
    80004a50:	00050993          	mv	s3,a0
    80004a54:	01400593          	li	a1,20
    80004a58:	fffff097          	auipc	ra,0xfffff
    80004a5c:	05c080e7          	jalr	92(ra) # 80003ab4 <_ZN6BufferC1Ei>

    sem_open(&waitForAll, 0);
    80004a60:	00000593          	li	a1,0
    80004a64:	00005517          	auipc	a0,0x5
    80004a68:	52450513          	addi	a0,a0,1316 # 80009f88 <waitForAll>
    80004a6c:	ffffe097          	auipc	ra,0xffffe
    80004a70:	b8c080e7          	jalr	-1140(ra) # 800025f8 <_Z8sem_openPP4_semj>

    thread_t threads[threadNum];
    thread_t consumerThread;

    struct thread_data data[threadNum + 1];
    80004a74:	ef010113          	addi	sp,sp,-272
    80004a78:	00010913          	mv	s2,sp

    data[threadNum].id = threadNum;
    80004a7c:	00a00793          	li	a5,10
    80004a80:	0ef92823          	sw	a5,240(s2)
    data[threadNum].buffer = buffer;
    80004a84:	0f393c23          	sd	s3,248(s2)
    data[threadNum].wait = waitForAll;
    80004a88:	00005797          	auipc	a5,0x5
    80004a8c:	5007b783          	ld	a5,1280(a5) # 80009f88 <waitForAll>
    80004a90:	10f93023          	sd	a5,256(s2)
    thread_create(&consumerThread, consumer, data + threadNum);
    80004a94:	0f090613          	addi	a2,s2,240
    80004a98:	fffff597          	auipc	a1,0xfffff
    80004a9c:	4d458593          	addi	a1,a1,1236 # 80003f6c <_Z8consumerPv>
    80004aa0:	fc840513          	addi	a0,s0,-56
    80004aa4:	ffffe097          	auipc	ra,0xffffe
    80004aa8:	a44080e7          	jalr	-1468(ra) # 800024e8 <_Z13thread_createPP7_threadPFvPvES2_>

    for (int i = 0; i < threadNum; i++) {
    80004aac:	00000493          	li	s1,0
    80004ab0:	00900793          	li	a5,9
    80004ab4:	0697c863          	blt	a5,s1,80004b24 <_Z22producerConsumer_C_APIv+0x154>
        data[i].id = i;
    80004ab8:	00149793          	slli	a5,s1,0x1
    80004abc:	009787b3          	add	a5,a5,s1
    80004ac0:	00379793          	slli	a5,a5,0x3
    80004ac4:	00f907b3          	add	a5,s2,a5
    80004ac8:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80004acc:	0137b423          	sd	s3,8(a5)
        data[i].wait = waitForAll;
    80004ad0:	00005717          	auipc	a4,0x5
    80004ad4:	4b873703          	ld	a4,1208(a4) # 80009f88 <waitForAll>
    80004ad8:	00e7b823          	sd	a4,16(a5)

        thread_create(threads + i,
    80004adc:	00048713          	mv	a4,s1
    80004ae0:	00349513          	slli	a0,s1,0x3
    80004ae4:	f7840793          	addi	a5,s0,-136
    80004ae8:	00a78533          	add	a0,a5,a0
    80004aec:	02905663          	blez	s1,80004b18 <_Z22producerConsumer_C_APIv+0x148>
    80004af0:	fffff597          	auipc	a1,0xfffff
    80004af4:	3e858593          	addi	a1,a1,1000 # 80003ed8 <_Z8producerPv>
                      i > 0 ? producer : producerKeyboard,
                      data + i);
    80004af8:	00171613          	slli	a2,a4,0x1
    80004afc:	00e60633          	add	a2,a2,a4
    80004b00:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    80004b04:	00c90633          	add	a2,s2,a2
    80004b08:	ffffe097          	auipc	ra,0xffffe
    80004b0c:	9e0080e7          	jalr	-1568(ra) # 800024e8 <_Z13thread_createPP7_threadPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80004b10:	0014849b          	addiw	s1,s1,1
    80004b14:	f9dff06f          	j	80004ab0 <_Z22producerConsumer_C_APIv+0xe0>
        thread_create(threads + i,
    80004b18:	fffff597          	auipc	a1,0xfffff
    80004b1c:	30058593          	addi	a1,a1,768 # 80003e18 <_Z16producerKeyboardPv>
    80004b20:	fd9ff06f          	j	80004af8 <_Z22producerConsumer_C_APIv+0x128>
    }

    thread_dispatch();
    80004b24:	ffffe097          	auipc	ra,0xffffe
    80004b28:	aa4080e7          	jalr	-1372(ra) # 800025c8 <_Z15thread_dispatchv>

    for (int i = 0; i <= threadNum; i++) {
    80004b2c:	00000493          	li	s1,0
    80004b30:	0180006f          	j	80004b48 <_Z22producerConsumer_C_APIv+0x178>
        sem_wait(waitForAll);
    80004b34:	00005517          	auipc	a0,0x5
    80004b38:	45453503          	ld	a0,1108(a0) # 80009f88 <waitForAll>
    80004b3c:	ffffe097          	auipc	ra,0xffffe
    80004b40:	b90080e7          	jalr	-1136(ra) # 800026cc <_Z8sem_waitP4_sem>
    for (int i = 0; i <= threadNum; i++) {
    80004b44:	0014849b          	addiw	s1,s1,1
    80004b48:	00a00793          	li	a5,10
    80004b4c:	fe97d4e3          	bge	a5,s1,80004b34 <_Z22producerConsumer_C_APIv+0x164>
    }

    sem_close(waitForAll);
    80004b50:	00005517          	auipc	a0,0x5
    80004b54:	43853503          	ld	a0,1080(a0) # 80009f88 <waitForAll>
    80004b58:	ffffe097          	auipc	ra,0xffffe
    80004b5c:	b18080e7          	jalr	-1256(ra) # 80002670 <_Z9sem_closeP4_sem>
}
    80004b60:	f7040113          	addi	sp,s0,-144
    80004b64:	08813083          	ld	ra,136(sp)
    80004b68:	08013403          	ld	s0,128(sp)
    80004b6c:	07813483          	ld	s1,120(sp)
    80004b70:	07013903          	ld	s2,112(sp)
    80004b74:	06813983          	ld	s3,104(sp)
    80004b78:	09010113          	addi	sp,sp,144
    80004b7c:	00008067          	ret
    80004b80:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    80004b84:	00098513          	mv	a0,s3
    80004b88:	ffffe097          	auipc	ra,0xffffe
    80004b8c:	c94080e7          	jalr	-876(ra) # 8000281c <_ZdlPv>
    80004b90:	00048513          	mv	a0,s1
    80004b94:	00006097          	auipc	ra,0x6
    80004b98:	4c4080e7          	jalr	1220(ra) # 8000b058 <_Unwind_Resume>

0000000080004b9c <_Z12testSleepingv>:

void testSleeping() {
    80004b9c:	fc010113          	addi	sp,sp,-64
    80004ba0:	02113c23          	sd	ra,56(sp)
    80004ba4:	02813823          	sd	s0,48(sp)
    80004ba8:	02913423          	sd	s1,40(sp)
    80004bac:	04010413          	addi	s0,sp,64
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    80004bb0:	00a00793          	li	a5,10
    80004bb4:	fcf43823          	sd	a5,-48(s0)
    80004bb8:	01400793          	li	a5,20
    80004bbc:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    for (int i = 0; i < sleepy_thread_count; i++) {
    80004bc0:	00000493          	li	s1,0
    80004bc4:	02c0006f          	j	80004bf0 <_Z12testSleepingv+0x54>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    80004bc8:	00349793          	slli	a5,s1,0x3
    80004bcc:	fd040613          	addi	a2,s0,-48
    80004bd0:	00f60633          	add	a2,a2,a5
    80004bd4:	fffff597          	auipc	a1,0xfffff
    80004bd8:	66c58593          	addi	a1,a1,1644 # 80004240 <_Z9sleepyRunPv>
    80004bdc:	fc040513          	addi	a0,s0,-64
    80004be0:	00f50533          	add	a0,a0,a5
    80004be4:	ffffe097          	auipc	ra,0xffffe
    80004be8:	904080e7          	jalr	-1788(ra) # 800024e8 <_Z13thread_createPP7_threadPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    80004bec:	0014849b          	addiw	s1,s1,1
    80004bf0:	00100793          	li	a5,1
    80004bf4:	fc97dae3          	bge	a5,s1,80004bc8 <_Z12testSleepingv+0x2c>
    }

    while (!(finished[0] && finished[1])) {}
    80004bf8:	00005797          	auipc	a5,0x5
    80004bfc:	3887c783          	lbu	a5,904(a5) # 80009f80 <finished>
    80004c00:	fe078ce3          	beqz	a5,80004bf8 <_Z12testSleepingv+0x5c>
    80004c04:	00005797          	auipc	a5,0x5
    80004c08:	37d7c783          	lbu	a5,893(a5) # 80009f81 <finished+0x1>
    80004c0c:	fe0786e3          	beqz	a5,80004bf8 <_Z12testSleepingv+0x5c>
}
    80004c10:	03813083          	ld	ra,56(sp)
    80004c14:	03013403          	ld	s0,48(sp)
    80004c18:	02813483          	ld	s1,40(sp)
    80004c1c:	04010113          	addi	sp,sp,64
    80004c20:	00008067          	ret

0000000080004c24 <_Z3fibm>:
uint64 fib(uint64 n) {
    80004c24:	fe010113          	addi	sp,sp,-32
    80004c28:	00113c23          	sd	ra,24(sp)
    80004c2c:	00813823          	sd	s0,16(sp)
    80004c30:	00913423          	sd	s1,8(sp)
    80004c34:	01213023          	sd	s2,0(sp)
    80004c38:	02010413          	addi	s0,sp,32
    80004c3c:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) return n;
    80004c40:	00100793          	li	a5,1
    80004c44:	02a7f663          	bgeu	a5,a0,80004c70 <_Z3fibm+0x4c>
    if (n % 4 == 0) {
    80004c48:	00357793          	andi	a5,a0,3
    80004c4c:	02078e63          	beqz	a5,80004c88 <_Z3fibm+0x64>
    return fibonacci(n-1) + fibonacci(n-2);
    80004c50:	fff48513          	addi	a0,s1,-1
    80004c54:	00000097          	auipc	ra,0x0
    80004c58:	914080e7          	jalr	-1772(ra) # 80004568 <_Z9fibonaccim>
    80004c5c:	00050913          	mv	s2,a0
    80004c60:	ffe48513          	addi	a0,s1,-2
    80004c64:	00000097          	auipc	ra,0x0
    80004c68:	904080e7          	jalr	-1788(ra) # 80004568 <_Z9fibonaccim>
    80004c6c:	00a90533          	add	a0,s2,a0
}
    80004c70:	01813083          	ld	ra,24(sp)
    80004c74:	01013403          	ld	s0,16(sp)
    80004c78:	00813483          	ld	s1,8(sp)
    80004c7c:	00013903          	ld	s2,0(sp)
    80004c80:	02010113          	addi	sp,sp,32
    80004c84:	00008067          	ret
        thread_dispatch();
    80004c88:	ffffe097          	auipc	ra,0xffffe
    80004c8c:	940080e7          	jalr	-1728(ra) # 800025c8 <_Z15thread_dispatchv>
    80004c90:	fc1ff06f          	j	80004c50 <_Z3fibm+0x2c>

0000000080004c94 <_Z11workerBodyGPv>:

void workerBodyG(void *) {
    80004c94:	fe010113          	addi	sp,sp,-32
    80004c98:	00113c23          	sd	ra,24(sp)
    80004c9c:	00813823          	sd	s0,16(sp)
    80004ca0:	00913423          	sd	s1,8(sp)
    80004ca4:	01213023          	sd	s2,0(sp)
    80004ca8:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80004cac:	00000493          	li	s1,0
    80004cb0:	0400006f          	j	80004cf0 <_Z11workerBodyGPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i=");
    80004cb4:	00003517          	auipc	a0,0x3
    80004cb8:	5bc50513          	addi	a0,a0,1468 # 80008270 <_ZZ14kprintUnsignedmE6digits+0x80>
    80004cbc:	fffff097          	auipc	ra,0xfffff
    80004cc0:	368080e7          	jalr	872(ra) # 80004024 <_Z11printStringPKc>
        printInt(i);
    80004cc4:	00000613          	li	a2,0
    80004cc8:	00a00593          	li	a1,10
    80004ccc:	00048513          	mv	a0,s1
    80004cd0:	fffff097          	auipc	ra,0xfffff
    80004cd4:	034080e7          	jalr	52(ra) # 80003d04 <_ZL8printIntiii>
        printString("\n");
    80004cd8:	00003517          	auipc	a0,0x3
    80004cdc:	4b050513          	addi	a0,a0,1200 # 80008188 <CONSOLE_STATUS+0x178>
    80004ce0:	fffff097          	auipc	ra,0xfffff
    80004ce4:	344080e7          	jalr	836(ra) # 80004024 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80004ce8:	0014849b          	addiw	s1,s1,1
    80004cec:	0ff4f493          	andi	s1,s1,255
    80004cf0:	00200793          	li	a5,2
    80004cf4:	fc97f0e3          	bgeu	a5,s1,80004cb4 <_Z11workerBodyGPv+0x20>
    }

    printString("C: yield\n");
    80004cf8:	00003517          	auipc	a0,0x3
    80004cfc:	68850513          	addi	a0,a0,1672 # 80008380 <_ZZ14kprintUnsignedmE6digits+0x190>
    80004d00:	fffff097          	auipc	ra,0xfffff
    80004d04:	324080e7          	jalr	804(ra) # 80004024 <_Z11printStringPKc>
    __asm__("li t1, 7");
    80004d08:	00700313          	li	t1,7
    thread_dispatch();
    80004d0c:	ffffe097          	auipc	ra,0xffffe
    80004d10:	8bc080e7          	jalr	-1860(ra) # 800025c8 <_Z15thread_dispatchv>

    uint64  t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80004d14:	00030913          	mv	s2,t1

    printString("C: t1=");
    80004d18:	00003517          	auipc	a0,0x3
    80004d1c:	57050513          	addi	a0,a0,1392 # 80008288 <_ZZ14kprintUnsignedmE6digits+0x98>
    80004d20:	fffff097          	auipc	ra,0xfffff
    80004d24:	304080e7          	jalr	772(ra) # 80004024 <_Z11printStringPKc>
    printInt(t1);
    80004d28:	00000613          	li	a2,0
    80004d2c:	00a00593          	li	a1,10
    80004d30:	0009051b          	sext.w	a0,s2
    80004d34:	fffff097          	auipc	ra,0xfffff
    80004d38:	fd0080e7          	jalr	-48(ra) # 80003d04 <_ZL8printIntiii>
    printString("\n");
    80004d3c:	00003517          	auipc	a0,0x3
    80004d40:	44c50513          	addi	a0,a0,1100 # 80008188 <CONSOLE_STATUS+0x178>
    80004d44:	fffff097          	auipc	ra,0xfffff
    80004d48:	2e0080e7          	jalr	736(ra) # 80004024 <_Z11printStringPKc>

    uint64 result = fib(30);
    80004d4c:	01e00513          	li	a0,30
    80004d50:	00000097          	auipc	ra,0x0
    80004d54:	ed4080e7          	jalr	-300(ra) # 80004c24 <_Z3fibm>
    80004d58:	00050913          	mv	s2,a0
    printString("C: fibonacci=");
    80004d5c:	00003517          	auipc	a0,0x3
    80004d60:	63450513          	addi	a0,a0,1588 # 80008390 <_ZZ14kprintUnsignedmE6digits+0x1a0>
    80004d64:	fffff097          	auipc	ra,0xfffff
    80004d68:	2c0080e7          	jalr	704(ra) # 80004024 <_Z11printStringPKc>
    printInt(result);
    80004d6c:	00000613          	li	a2,0
    80004d70:	00a00593          	li	a1,10
    80004d74:	0009051b          	sext.w	a0,s2
    80004d78:	fffff097          	auipc	ra,0xfffff
    80004d7c:	f8c080e7          	jalr	-116(ra) # 80003d04 <_ZL8printIntiii>
    printString("\n");
    80004d80:	00003517          	auipc	a0,0x3
    80004d84:	40850513          	addi	a0,a0,1032 # 80008188 <CONSOLE_STATUS+0x178>
    80004d88:	fffff097          	auipc	ra,0xfffff
    80004d8c:	29c080e7          	jalr	668(ra) # 80004024 <_Z11printStringPKc>
    80004d90:	0400006f          	j	80004dd0 <_Z11workerBodyGPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i=");
    80004d94:	00003517          	auipc	a0,0x3
    80004d98:	4dc50513          	addi	a0,a0,1244 # 80008270 <_ZZ14kprintUnsignedmE6digits+0x80>
    80004d9c:	fffff097          	auipc	ra,0xfffff
    80004da0:	288080e7          	jalr	648(ra) # 80004024 <_Z11printStringPKc>
        printInt(i);
    80004da4:	00000613          	li	a2,0
    80004da8:	00a00593          	li	a1,10
    80004dac:	00048513          	mv	a0,s1
    80004db0:	fffff097          	auipc	ra,0xfffff
    80004db4:	f54080e7          	jalr	-172(ra) # 80003d04 <_ZL8printIntiii>
        printString("\n");
    80004db8:	00003517          	auipc	a0,0x3
    80004dbc:	3d050513          	addi	a0,a0,976 # 80008188 <CONSOLE_STATUS+0x178>
    80004dc0:	fffff097          	auipc	ra,0xfffff
    80004dc4:	264080e7          	jalr	612(ra) # 80004024 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80004dc8:	0014849b          	addiw	s1,s1,1
    80004dcc:	0ff4f493          	andi	s1,s1,255
    80004dd0:	00500793          	li	a5,5
    80004dd4:	fc97f0e3          	bgeu	a5,s1,80004d94 <_Z11workerBodyGPv+0x100>
    }
    // TCB::yield()
    printString("Worker C finished\n");
    80004dd8:	00003517          	auipc	a0,0x3
    80004ddc:	5c850513          	addi	a0,a0,1480 # 800083a0 <_ZZ14kprintUnsignedmE6digits+0x1b0>
    80004de0:	fffff097          	auipc	ra,0xfffff
    80004de4:	244080e7          	jalr	580(ra) # 80004024 <_Z11printStringPKc>
}
    80004de8:	01813083          	ld	ra,24(sp)
    80004dec:	01013403          	ld	s0,16(sp)
    80004df0:	00813483          	ld	s1,8(sp)
    80004df4:	00013903          	ld	s2,0(sp)
    80004df8:	02010113          	addi	sp,sp,32
    80004dfc:	00008067          	ret

0000000080004e00 <_Z11workerBodyHPv>:

void workerBodyH(void *) {
    80004e00:	fe010113          	addi	sp,sp,-32
    80004e04:	00113c23          	sd	ra,24(sp)
    80004e08:	00813823          	sd	s0,16(sp)
    80004e0c:	00913423          	sd	s1,8(sp)
    80004e10:	01213023          	sd	s2,0(sp)
    80004e14:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80004e18:	00a00493          	li	s1,10
    80004e1c:	0400006f          	j	80004e5c <_Z11workerBodyHPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i=");
    80004e20:	00003517          	auipc	a0,0x3
    80004e24:	49050513          	addi	a0,a0,1168 # 800082b0 <_ZZ14kprintUnsignedmE6digits+0xc0>
    80004e28:	fffff097          	auipc	ra,0xfffff
    80004e2c:	1fc080e7          	jalr	508(ra) # 80004024 <_Z11printStringPKc>
        printInt(i);
    80004e30:	00000613          	li	a2,0
    80004e34:	00a00593          	li	a1,10
    80004e38:	00048513          	mv	a0,s1
    80004e3c:	fffff097          	auipc	ra,0xfffff
    80004e40:	ec8080e7          	jalr	-312(ra) # 80003d04 <_ZL8printIntiii>
        printString("\n");
    80004e44:	00003517          	auipc	a0,0x3
    80004e48:	34450513          	addi	a0,a0,836 # 80008188 <CONSOLE_STATUS+0x178>
    80004e4c:	fffff097          	auipc	ra,0xfffff
    80004e50:	1d8080e7          	jalr	472(ra) # 80004024 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80004e54:	0014849b          	addiw	s1,s1,1
    80004e58:	0ff4f493          	andi	s1,s1,255
    80004e5c:	00c00793          	li	a5,12
    80004e60:	fc97f0e3          	bgeu	a5,s1,80004e20 <_Z11workerBodyHPv+0x20>
    }

    printString("D: yield\n");
    80004e64:	00003517          	auipc	a0,0x3
    80004e68:	55450513          	addi	a0,a0,1364 # 800083b8 <_ZZ14kprintUnsignedmE6digits+0x1c8>
    80004e6c:	fffff097          	auipc	ra,0xfffff
    80004e70:	1b8080e7          	jalr	440(ra) # 80004024 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80004e74:	00500313          	li	t1,5
    thread_dispatch();
    80004e78:	ffffd097          	auipc	ra,0xffffd
    80004e7c:	750080e7          	jalr	1872(ra) # 800025c8 <_Z15thread_dispatchv>

    uint64 result = fib(23);
    80004e80:	01700513          	li	a0,23
    80004e84:	00000097          	auipc	ra,0x0
    80004e88:	da0080e7          	jalr	-608(ra) # 80004c24 <_Z3fibm>
    80004e8c:	00050913          	mv	s2,a0
    printString("D: fibonacci=");
    80004e90:	00003517          	auipc	a0,0x3
    80004e94:	53850513          	addi	a0,a0,1336 # 800083c8 <_ZZ14kprintUnsignedmE6digits+0x1d8>
    80004e98:	fffff097          	auipc	ra,0xfffff
    80004e9c:	18c080e7          	jalr	396(ra) # 80004024 <_Z11printStringPKc>
    printInt(result);
    80004ea0:	00000613          	li	a2,0
    80004ea4:	00a00593          	li	a1,10
    80004ea8:	0009051b          	sext.w	a0,s2
    80004eac:	fffff097          	auipc	ra,0xfffff
    80004eb0:	e58080e7          	jalr	-424(ra) # 80003d04 <_ZL8printIntiii>
    printString("\n");
    80004eb4:	00003517          	auipc	a0,0x3
    80004eb8:	2d450513          	addi	a0,a0,724 # 80008188 <CONSOLE_STATUS+0x178>
    80004ebc:	fffff097          	auipc	ra,0xfffff
    80004ec0:	168080e7          	jalr	360(ra) # 80004024 <_Z11printStringPKc>
    80004ec4:	0400006f          	j	80004f04 <_Z11workerBodyHPv+0x104>

    for (; i < 16; i++) {
        printString("D: i=");
    80004ec8:	00003517          	auipc	a0,0x3
    80004ecc:	3e850513          	addi	a0,a0,1000 # 800082b0 <_ZZ14kprintUnsignedmE6digits+0xc0>
    80004ed0:	fffff097          	auipc	ra,0xfffff
    80004ed4:	154080e7          	jalr	340(ra) # 80004024 <_Z11printStringPKc>
        printInt(i);
    80004ed8:	00000613          	li	a2,0
    80004edc:	00a00593          	li	a1,10
    80004ee0:	00048513          	mv	a0,s1
    80004ee4:	fffff097          	auipc	ra,0xfffff
    80004ee8:	e20080e7          	jalr	-480(ra) # 80003d04 <_ZL8printIntiii>
        printString("\n");
    80004eec:	00003517          	auipc	a0,0x3
    80004ef0:	29c50513          	addi	a0,a0,668 # 80008188 <CONSOLE_STATUS+0x178>
    80004ef4:	fffff097          	auipc	ra,0xfffff
    80004ef8:	130080e7          	jalr	304(ra) # 80004024 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80004efc:	0014849b          	addiw	s1,s1,1
    80004f00:	0ff4f493          	andi	s1,s1,255
    80004f04:	00f00793          	li	a5,15
    80004f08:	fc97f0e3          	bgeu	a5,s1,80004ec8 <_Z11workerBodyHPv+0xc8>
    }
    // TCB::yield()
    printString("Worker D finished\n");
    80004f0c:	00003517          	auipc	a0,0x3
    80004f10:	4cc50513          	addi	a0,a0,1228 # 800083d8 <_ZZ14kprintUnsignedmE6digits+0x1e8>
    80004f14:	fffff097          	auipc	ra,0xfffff
    80004f18:	110080e7          	jalr	272(ra) # 80004024 <_Z11printStringPKc>
}
    80004f1c:	01813083          	ld	ra,24(sp)
    80004f20:	01013403          	ld	s0,16(sp)
    80004f24:	00813483          	ld	s1,8(sp)
    80004f28:	00013903          	ld	s2,0(sp)
    80004f2c:	02010113          	addi	sp,sp,32
    80004f30:	00008067          	ret

0000000080004f34 <_Z10myUserMainv>:
#include "Workers.h"
#include "../h/syscall_c.h"
#include "ProducerConsumer.h"
#include "printing.hpp"

void myUserMain() {
    80004f34:	fa010113          	addi	sp,sp,-96
    80004f38:	04113c23          	sd	ra,88(sp)
    80004f3c:	04813823          	sd	s0,80(sp)
    80004f40:	04913423          	sd	s1,72(sp)
    80004f44:	05213023          	sd	s2,64(sp)
    80004f48:	06010413          	addi	s0,sp,96
    printString("In user main\n");
    80004f4c:	00003517          	auipc	a0,0x3
    80004f50:	4a450513          	addi	a0,a0,1188 # 800083f0 <_ZZ14kprintUnsignedmE6digits+0x200>
    80004f54:	fffff097          	auipc	ra,0xfffff
    80004f58:	0d0080e7          	jalr	208(ra) # 80004024 <_Z11printStringPKc>

    void *mem = mem_alloc(25000);
    80004f5c:	00006537          	lui	a0,0x6
    80004f60:	1a850513          	addi	a0,a0,424 # 61a8 <_entry-0x7fff9e58>
    80004f64:	ffffd097          	auipc	ra,0xffffd
    80004f68:	50c080e7          	jalr	1292(ra) # 80002470 <_Z9mem_allocm>
    80004f6c:	00050913          	mv	s2,a0
    printInt((uint64) mem);
    80004f70:	00000613          	li	a2,0
    80004f74:	00a00593          	li	a1,10
    80004f78:	0005051b          	sext.w	a0,a0
    80004f7c:	fffff097          	auipc	ra,0xfffff
    80004f80:	d88080e7          	jalr	-632(ra) # 80003d04 <_ZL8printIntiii>
    printString("\n");
    80004f84:	00003517          	auipc	a0,0x3
    80004f88:	20450513          	addi	a0,a0,516 # 80008188 <CONSOLE_STATUS+0x178>
    80004f8c:	fffff097          	auipc	ra,0xfffff
    80004f90:	098080e7          	jalr	152(ra) # 80004024 <_Z11printStringPKc>

    ProducerConsumer *obj = new ProducerConsumer();
    80004f94:	01800513          	li	a0,24
    80004f98:	ffffe097          	auipc	ra,0xffffe
    80004f9c:	834080e7          	jalr	-1996(ra) # 800027cc <_Znwm>
    80004fa0:	00050493          	mv	s1,a0
#include "../h/syscall_c.h"
#include "printing.hpp"

class ProducerConsumer {
public:
    ProducerConsumer() {
    80004fa4:	00052823          	sw	zero,16(a0)
        sem_open(&semConsumer, 0);
    80004fa8:	00000593          	li	a1,0
    80004fac:	00850513          	addi	a0,a0,8
    80004fb0:	ffffd097          	auipc	ra,0xffffd
    80004fb4:	648080e7          	jalr	1608(ra) # 800025f8 <_Z8sem_openPP4_semj>
        sem_open(&semProducer, 1);
    80004fb8:	00100593          	li	a1,1
    80004fbc:	00048513          	mv	a0,s1
    80004fc0:	ffffd097          	auipc	ra,0xffffd
    80004fc4:	638080e7          	jalr	1592(ra) # 800025f8 <_Z8sem_openPP4_semj>
    thread_t t5;
    thread_t t6;
    thread_t t7;
    thread_t t8;

    thread_create(&t1, &workerBodyE, nullptr);
    80004fc8:	00000613          	li	a2,0
    80004fcc:	fffff597          	auipc	a1,0xfffff
    80004fd0:	31858593          	addi	a1,a1,792 # 800042e4 <_Z11workerBodyEPv>
    80004fd4:	fd840513          	addi	a0,s0,-40
    80004fd8:	ffffd097          	auipc	ra,0xffffd
    80004fdc:	510080e7          	jalr	1296(ra) # 800024e8 <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t2, &workerBodyF, nullptr);
    80004fe0:	00000613          	li	a2,0
    80004fe4:	fffff597          	auipc	a1,0xfffff
    80004fe8:	3b058593          	addi	a1,a1,944 # 80004394 <_Z11workerBodyFPv>
    80004fec:	fd040513          	addi	a0,s0,-48
    80004ff0:	ffffd097          	auipc	ra,0xffffd
    80004ff4:	4f8080e7          	jalr	1272(ra) # 800024e8 <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t3, &workerBodyG, nullptr);
    80004ff8:	00000613          	li	a2,0
    80004ffc:	00000597          	auipc	a1,0x0
    80005000:	c9858593          	addi	a1,a1,-872 # 80004c94 <_Z11workerBodyGPv>
    80005004:	fc840513          	addi	a0,s0,-56
    80005008:	ffffd097          	auipc	ra,0xffffd
    8000500c:	4e0080e7          	jalr	1248(ra) # 800024e8 <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t4, &workerBodyH, nullptr);
    80005010:	00000613          	li	a2,0
    80005014:	00000597          	auipc	a1,0x0
    80005018:	dec58593          	addi	a1,a1,-532 # 80004e00 <_Z11workerBodyHPv>
    8000501c:	fc040513          	addi	a0,s0,-64
    80005020:	ffffd097          	auipc	ra,0xffffd
    80005024:	4c8080e7          	jalr	1224(ra) # 800024e8 <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t5, &ProducerConsumer::produceWrapper, obj);
    80005028:	00048613          	mv	a2,s1
    8000502c:	00000597          	auipc	a1,0x0
    80005030:	1ac58593          	addi	a1,a1,428 # 800051d8 <_ZN16ProducerConsumer14produceWrapperEPv>
    80005034:	fb840513          	addi	a0,s0,-72
    80005038:	ffffd097          	auipc	ra,0xffffd
    8000503c:	4b0080e7          	jalr	1200(ra) # 800024e8 <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t6, &ProducerConsumer::consumeWrapper, obj);
    80005040:	00048613          	mv	a2,s1
    80005044:	00000597          	auipc	a1,0x0
    80005048:	27858593          	addi	a1,a1,632 # 800052bc <_ZN16ProducerConsumer14consumeWrapperEPv>
    8000504c:	fb040513          	addi	a0,s0,-80
    80005050:	ffffd097          	auipc	ra,0xffffd
    80005054:	498080e7          	jalr	1176(ra) # 800024e8 <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t7, &ProducerConsumer::consumeWrapper, obj);
    80005058:	00048613          	mv	a2,s1
    8000505c:	00000597          	auipc	a1,0x0
    80005060:	26058593          	addi	a1,a1,608 # 800052bc <_ZN16ProducerConsumer14consumeWrapperEPv>
    80005064:	fa840513          	addi	a0,s0,-88
    80005068:	ffffd097          	auipc	ra,0xffffd
    8000506c:	480080e7          	jalr	1152(ra) # 800024e8 <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t8, &ProducerConsumer::consumeWrapper, obj);
    80005070:	00048613          	mv	a2,s1
    80005074:	00000597          	auipc	a1,0x0
    80005078:	24858593          	addi	a1,a1,584 # 800052bc <_ZN16ProducerConsumer14consumeWrapperEPv>
    8000507c:	fa040513          	addi	a0,s0,-96
    80005080:	ffffd097          	auipc	ra,0xffffd
    80005084:	468080e7          	jalr	1128(ra) # 800024e8 <_Z13thread_createPP7_threadPFvPvES2_>

    time_sleep(50);
    80005088:	03200513          	li	a0,50
    8000508c:	ffffd097          	auipc	ra,0xffffd
    80005090:	6a8080e7          	jalr	1704(ra) # 80002734 <_Z10time_sleepm>

    printString("Nit t2: ");
    80005094:	00003517          	auipc	a0,0x3
    80005098:	36c50513          	addi	a0,a0,876 # 80008400 <_ZZ14kprintUnsignedmE6digits+0x210>
    8000509c:	fffff097          	auipc	ra,0xfffff
    800050a0:	f88080e7          	jalr	-120(ra) # 80004024 <_Z11printStringPKc>
    printInt((uint64) t2);
    800050a4:	00000613          	li	a2,0
    800050a8:	00a00593          	li	a1,10
    800050ac:	fd042503          	lw	a0,-48(s0)
    800050b0:	fffff097          	auipc	ra,0xfffff
    800050b4:	c54080e7          	jalr	-940(ra) # 80003d04 <_ZL8printIntiii>
    printString("\n");
    800050b8:	00003517          	auipc	a0,0x3
    800050bc:	0d050513          	addi	a0,a0,208 # 80008188 <CONSOLE_STATUS+0x178>
    800050c0:	fffff097          	auipc	ra,0xfffff
    800050c4:	f64080e7          	jalr	-156(ra) # 80004024 <_Z11printStringPKc>

    time_sleep(150);
    800050c8:	09600513          	li	a0,150
    800050cc:	ffffd097          	auipc	ra,0xffffd
    800050d0:	668080e7          	jalr	1640(ra) # 80002734 <_Z10time_sleepm>

    printString("Mem free called with ret value ");
    800050d4:	00003517          	auipc	a0,0x3
    800050d8:	33c50513          	addi	a0,a0,828 # 80008410 <_ZZ14kprintUnsignedmE6digits+0x220>
    800050dc:	fffff097          	auipc	ra,0xfffff
    800050e0:	f48080e7          	jalr	-184(ra) # 80004024 <_Z11printStringPKc>
    printInt(mem_free(mem));
    800050e4:	00090513          	mv	a0,s2
    800050e8:	ffffd097          	auipc	ra,0xffffd
    800050ec:	3cc080e7          	jalr	972(ra) # 800024b4 <_Z8mem_freePv>
    800050f0:	00000613          	li	a2,0
    800050f4:	00a00593          	li	a1,10
    800050f8:	fffff097          	auipc	ra,0xfffff
    800050fc:	c0c080e7          	jalr	-1012(ra) # 80003d04 <_ZL8printIntiii>
    printString("\n");
    80005100:	00003517          	auipc	a0,0x3
    80005104:	08850513          	addi	a0,a0,136 # 80008188 <CONSOLE_STATUS+0x178>
    80005108:	fffff097          	auipc	ra,0xfffff
    8000510c:	f1c080e7          	jalr	-228(ra) # 80004024 <_Z11printStringPKc>

    printString("Mem free called again with ret value ");
    80005110:	00003517          	auipc	a0,0x3
    80005114:	32050513          	addi	a0,a0,800 # 80008430 <_ZZ14kprintUnsignedmE6digits+0x240>
    80005118:	fffff097          	auipc	ra,0xfffff
    8000511c:	f0c080e7          	jalr	-244(ra) # 80004024 <_Z11printStringPKc>
    printInt(mem_free(mem), 10, 1);
    80005120:	00090513          	mv	a0,s2
    80005124:	ffffd097          	auipc	ra,0xffffd
    80005128:	390080e7          	jalr	912(ra) # 800024b4 <_Z8mem_freePv>
    8000512c:	00100613          	li	a2,1
    80005130:	00a00593          	li	a1,10
    80005134:	fffff097          	auipc	ra,0xfffff
    80005138:	bd0080e7          	jalr	-1072(ra) # 80003d04 <_ZL8printIntiii>
    printString("\n");
    8000513c:	00003517          	auipc	a0,0x3
    80005140:	04c50513          	addi	a0,a0,76 # 80008188 <CONSOLE_STATUS+0x178>
    80005144:	fffff097          	auipc	ra,0xfffff
    80005148:	ee0080e7          	jalr	-288(ra) # 80004024 <_Z11printStringPKc>

    delete obj;
    8000514c:	00048863          	beqz	s1,8000515c <_Z10myUserMainv+0x228>
    80005150:	00048513          	mv	a0,s1
    80005154:	ffffd097          	auipc	ra,0xffffd
    80005158:	6c8080e7          	jalr	1736(ra) # 8000281c <_ZdlPv>

    printString("User main finished\n");
    8000515c:	00003517          	auipc	a0,0x3
    80005160:	2fc50513          	addi	a0,a0,764 # 80008458 <_ZZ14kprintUnsignedmE6digits+0x268>
    80005164:	fffff097          	auipc	ra,0xfffff
    80005168:	ec0080e7          	jalr	-320(ra) # 80004024 <_Z11printStringPKc>
}
    8000516c:	05813083          	ld	ra,88(sp)
    80005170:	05013403          	ld	s0,80(sp)
    80005174:	04813483          	ld	s1,72(sp)
    80005178:	04013903          	ld	s2,64(sp)
    8000517c:	06010113          	addi	sp,sp,96
    80005180:	00008067          	ret
    80005184:	00050913          	mv	s2,a0
    ProducerConsumer *obj = new ProducerConsumer();
    80005188:	00048513          	mv	a0,s1
    8000518c:	ffffd097          	auipc	ra,0xffffd
    80005190:	690080e7          	jalr	1680(ra) # 8000281c <_ZdlPv>
    80005194:	00090513          	mv	a0,s2
    80005198:	00006097          	auipc	ra,0x6
    8000519c:	ec0080e7          	jalr	-320(ra) # 8000b058 <_Unwind_Resume>

00000000800051a0 <_Z8userMainv>:
#include "../test/ThreadSleep_C_API_test.hpp" // thread_sleep test C API
//#include "../test/ConsumerProducer_CPP_API_test.hpp" // zadatak 4. CPP API i asinhrona promena konteksta

#include "../test/myUserMain.h" // additional C API tests

void userMain() {
    800051a0:	ff010113          	addi	sp,sp,-16
    800051a4:	00113423          	sd	ra,8(sp)
    800051a8:	00813023          	sd	s0,0(sp)
    800051ac:	01010413          	addi	s0,sp,16
    Threads_C_API_test(); // zadatak 2., niti C API i sinhrona promena konteksta
    800051b0:	fffff097          	auipc	ra,0xfffff
    800051b4:	6f4080e7          	jalr	1780(ra) # 800048a4 <_Z18Threads_C_API_testv>
    //Threads_CPP_API_test(); // zadatak 2., niti CPP API i sinhrona promena konteksta

//    producerConsumer_C_API(); // zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta
    //producerConsumer_CPP_Sync_API(); // zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta

    testSleeping(); // thread_sleep test C API
    800051b8:	00000097          	auipc	ra,0x0
    800051bc:	9e4080e7          	jalr	-1564(ra) # 80004b9c <_Z12testSleepingv>
    //ConsumerProducerCPP::testConsumerProducer(); // zadatak 4. CPP API i asinhrona promena konteksta, kompletan test svega

    myUserMain(); // additional C API tests - Extreme - Testing every functionality
    800051c0:	00000097          	auipc	ra,0x0
    800051c4:	d74080e7          	jalr	-652(ra) # 80004f34 <_Z10myUserMainv>

    800051c8:	00813083          	ld	ra,8(sp)
    800051cc:	00013403          	ld	s0,0(sp)
    800051d0:	01010113          	addi	sp,sp,16
    800051d4:	00008067          	ret

00000000800051d8 <_ZN16ProducerConsumer14produceWrapperEPv>:
        }

        printString("Consumer finished\n");
    }

    static void produceWrapper(void *obj) {
    800051d8:	fe010113          	addi	sp,sp,-32
    800051dc:	00113c23          	sd	ra,24(sp)
    800051e0:	00813823          	sd	s0,16(sp)
    800051e4:	00913423          	sd	s1,8(sp)
    800051e8:	01213023          	sd	s2,0(sp)
    800051ec:	02010413          	addi	s0,sp,32
    800051f0:	00050493          	mv	s1,a0
        for (int i = 1; i <= 150; i++) {
    800051f4:	00100913          	li	s2,1
    800051f8:	09600793          	li	a5,150
    800051fc:	0327c863          	blt	a5,s2,8000522c <_ZN16ProducerConsumer14produceWrapperEPv+0x54>
            sem_wait(semProducer);
    80005200:	0004b503          	ld	a0,0(s1)
    80005204:	ffffd097          	auipc	ra,0xffffd
    80005208:	4c8080e7          	jalr	1224(ra) # 800026cc <_Z8sem_waitP4_sem>
            value++;
    8000520c:	0104a783          	lw	a5,16(s1)
    80005210:	0017879b          	addiw	a5,a5,1
    80005214:	00f4a823          	sw	a5,16(s1)
            sem_signal(semConsumer);
    80005218:	0084b503          	ld	a0,8(s1)
    8000521c:	ffffd097          	auipc	ra,0xffffd
    80005220:	4e4080e7          	jalr	1252(ra) # 80002700 <_Z10sem_signalP4_sem>
        for (int i = 1; i <= 150; i++) {
    80005224:	0019091b          	addiw	s2,s2,1
    80005228:	fd1ff06f          	j	800051f8 <_ZN16ProducerConsumer14produceWrapperEPv+0x20>
        int a = sem_close(semProducer);
    8000522c:	0004b503          	ld	a0,0(s1)
    80005230:	ffffd097          	auipc	ra,0xffffd
    80005234:	440080e7          	jalr	1088(ra) # 80002670 <_Z9sem_closeP4_sem>
    80005238:	00050913          	mv	s2,a0
        int b = sem_close(semConsumer);
    8000523c:	0084b503          	ld	a0,8(s1)
    80005240:	ffffd097          	auipc	ra,0xffffd
    80005244:	430080e7          	jalr	1072(ra) # 80002670 <_Z9sem_closeP4_sem>
    80005248:	00050493          	mv	s1,a0
        printString("Producer finished with exit values: ");
    8000524c:	00003517          	auipc	a0,0x3
    80005250:	22450513          	addi	a0,a0,548 # 80008470 <_ZZ14kprintUnsignedmE6digits+0x280>
    80005254:	fffff097          	auipc	ra,0xfffff
    80005258:	dd0080e7          	jalr	-560(ra) # 80004024 <_Z11printStringPKc>
        printInt(a);
    8000525c:	00000613          	li	a2,0
    80005260:	00a00593          	li	a1,10
    80005264:	00090513          	mv	a0,s2
    80005268:	fffff097          	auipc	ra,0xfffff
    8000526c:	a9c080e7          	jalr	-1380(ra) # 80003d04 <_ZL8printIntiii>
        printString(" and ");
    80005270:	00003517          	auipc	a0,0x3
    80005274:	22850513          	addi	a0,a0,552 # 80008498 <_ZZ14kprintUnsignedmE6digits+0x2a8>
    80005278:	fffff097          	auipc	ra,0xfffff
    8000527c:	dac080e7          	jalr	-596(ra) # 80004024 <_Z11printStringPKc>
        printInt(b);
    80005280:	00000613          	li	a2,0
    80005284:	00a00593          	li	a1,10
    80005288:	00048513          	mv	a0,s1
    8000528c:	fffff097          	auipc	ra,0xfffff
    80005290:	a78080e7          	jalr	-1416(ra) # 80003d04 <_ZL8printIntiii>
        printString("\n");
    80005294:	00003517          	auipc	a0,0x3
    80005298:	ef450513          	addi	a0,a0,-268 # 80008188 <CONSOLE_STATUS+0x178>
    8000529c:	fffff097          	auipc	ra,0xfffff
    800052a0:	d88080e7          	jalr	-632(ra) # 80004024 <_Z11printStringPKc>
        ProducerConsumer *pc = (ProducerConsumer *) obj;
        pc->produce();
    }
    800052a4:	01813083          	ld	ra,24(sp)
    800052a8:	01013403          	ld	s0,16(sp)
    800052ac:	00813483          	ld	s1,8(sp)
    800052b0:	00013903          	ld	s2,0(sp)
    800052b4:	02010113          	addi	sp,sp,32
    800052b8:	00008067          	ret

00000000800052bc <_ZN16ProducerConsumer14consumeWrapperEPv>:

    static void consumeWrapper(void *obj) {
    800052bc:	fe010113          	addi	sp,sp,-32
    800052c0:	00113c23          	sd	ra,24(sp)
    800052c4:	00813823          	sd	s0,16(sp)
    800052c8:	00913423          	sd	s1,8(sp)
    800052cc:	01213023          	sd	s2,0(sp)
    800052d0:	02010413          	addi	s0,sp,32
    800052d4:	00050493          	mv	s1,a0
        for (int i = 1; i <= 50; i++) {
    800052d8:	00100913          	li	s2,1
    800052dc:	03200793          	li	a5,50
    800052e0:	0727c863          	blt	a5,s2,80005350 <_ZN16ProducerConsumer14consumeWrapperEPv+0x94>
            sem_wait(semConsumer);
    800052e4:	0084b503          	ld	a0,8(s1)
    800052e8:	ffffd097          	auipc	ra,0xffffd
    800052ec:	3e4080e7          	jalr	996(ra) # 800026cc <_Z8sem_waitP4_sem>
            printInt(value);
    800052f0:	00000613          	li	a2,0
    800052f4:	00a00593          	li	a1,10
    800052f8:	0104a503          	lw	a0,16(s1)
    800052fc:	fffff097          	auipc	ra,0xfffff
    80005300:	a08080e7          	jalr	-1528(ra) # 80003d04 <_ZL8printIntiii>
            printString(" squared is: ");
    80005304:	00003517          	auipc	a0,0x3
    80005308:	19c50513          	addi	a0,a0,412 # 800084a0 <_ZZ14kprintUnsignedmE6digits+0x2b0>
    8000530c:	fffff097          	auipc	ra,0xfffff
    80005310:	d18080e7          	jalr	-744(ra) # 80004024 <_Z11printStringPKc>
            printInt(value * value);
    80005314:	0104a503          	lw	a0,16(s1)
    80005318:	00000613          	li	a2,0
    8000531c:	00a00593          	li	a1,10
    80005320:	02a5053b          	mulw	a0,a0,a0
    80005324:	fffff097          	auipc	ra,0xfffff
    80005328:	9e0080e7          	jalr	-1568(ra) # 80003d04 <_ZL8printIntiii>
            printString("\n");
    8000532c:	00003517          	auipc	a0,0x3
    80005330:	e5c50513          	addi	a0,a0,-420 # 80008188 <CONSOLE_STATUS+0x178>
    80005334:	fffff097          	auipc	ra,0xfffff
    80005338:	cf0080e7          	jalr	-784(ra) # 80004024 <_Z11printStringPKc>
            sem_signal(semProducer);
    8000533c:	0004b503          	ld	a0,0(s1)
    80005340:	ffffd097          	auipc	ra,0xffffd
    80005344:	3c0080e7          	jalr	960(ra) # 80002700 <_Z10sem_signalP4_sem>
        for (int i = 1; i <= 50; i++) {
    80005348:	0019091b          	addiw	s2,s2,1
    8000534c:	f91ff06f          	j	800052dc <_ZN16ProducerConsumer14consumeWrapperEPv+0x20>
        printString("Consumer finished\n");
    80005350:	00003517          	auipc	a0,0x3
    80005354:	16050513          	addi	a0,a0,352 # 800084b0 <_ZZ14kprintUnsignedmE6digits+0x2c0>
    80005358:	fffff097          	auipc	ra,0xfffff
    8000535c:	ccc080e7          	jalr	-820(ra) # 80004024 <_Z11printStringPKc>
        ProducerConsumer *pc = (ProducerConsumer *) obj;
        pc->consume();
    }
    80005360:	01813083          	ld	ra,24(sp)
    80005364:	01013403          	ld	s0,16(sp)
    80005368:	00813483          	ld	s1,8(sp)
    8000536c:	00013903          	ld	s2,0(sp)
    80005370:	02010113          	addi	sp,sp,32
    80005374:	00008067          	ret

0000000080005378 <start>:
    80005378:	ff010113          	addi	sp,sp,-16
    8000537c:	00813423          	sd	s0,8(sp)
    80005380:	01010413          	addi	s0,sp,16
    80005384:	300027f3          	csrr	a5,mstatus
    80005388:	ffffe737          	lui	a4,0xffffe
    8000538c:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff360f>
    80005390:	00e7f7b3          	and	a5,a5,a4
    80005394:	00001737          	lui	a4,0x1
    80005398:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    8000539c:	00e7e7b3          	or	a5,a5,a4
    800053a0:	30079073          	csrw	mstatus,a5
    800053a4:	00000797          	auipc	a5,0x0
    800053a8:	16078793          	addi	a5,a5,352 # 80005504 <system_main>
    800053ac:	34179073          	csrw	mepc,a5
    800053b0:	00000793          	li	a5,0
    800053b4:	18079073          	csrw	satp,a5
    800053b8:	000107b7          	lui	a5,0x10
    800053bc:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    800053c0:	30279073          	csrw	medeleg,a5
    800053c4:	30379073          	csrw	mideleg,a5
    800053c8:	104027f3          	csrr	a5,sie
    800053cc:	2227e793          	ori	a5,a5,546
    800053d0:	10479073          	csrw	sie,a5
    800053d4:	fff00793          	li	a5,-1
    800053d8:	00a7d793          	srli	a5,a5,0xa
    800053dc:	3b079073          	csrw	pmpaddr0,a5
    800053e0:	00f00793          	li	a5,15
    800053e4:	3a079073          	csrw	pmpcfg0,a5
    800053e8:	f14027f3          	csrr	a5,mhartid
    800053ec:	0200c737          	lui	a4,0x200c
    800053f0:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800053f4:	0007869b          	sext.w	a3,a5
    800053f8:	00269713          	slli	a4,a3,0x2
    800053fc:	000f4637          	lui	a2,0xf4
    80005400:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80005404:	00d70733          	add	a4,a4,a3
    80005408:	0037979b          	slliw	a5,a5,0x3
    8000540c:	020046b7          	lui	a3,0x2004
    80005410:	00d787b3          	add	a5,a5,a3
    80005414:	00c585b3          	add	a1,a1,a2
    80005418:	00371693          	slli	a3,a4,0x3
    8000541c:	00005717          	auipc	a4,0x5
    80005420:	b7470713          	addi	a4,a4,-1164 # 80009f90 <timer_scratch>
    80005424:	00b7b023          	sd	a1,0(a5)
    80005428:	00d70733          	add	a4,a4,a3
    8000542c:	00f73c23          	sd	a5,24(a4)
    80005430:	02c73023          	sd	a2,32(a4)
    80005434:	34071073          	csrw	mscratch,a4
    80005438:	00000797          	auipc	a5,0x0
    8000543c:	6e878793          	addi	a5,a5,1768 # 80005b20 <timervec>
    80005440:	30579073          	csrw	mtvec,a5
    80005444:	300027f3          	csrr	a5,mstatus
    80005448:	0087e793          	ori	a5,a5,8
    8000544c:	30079073          	csrw	mstatus,a5
    80005450:	304027f3          	csrr	a5,mie
    80005454:	0807e793          	ori	a5,a5,128
    80005458:	30479073          	csrw	mie,a5
    8000545c:	f14027f3          	csrr	a5,mhartid
    80005460:	0007879b          	sext.w	a5,a5
    80005464:	00078213          	mv	tp,a5
    80005468:	30200073          	mret
    8000546c:	00813403          	ld	s0,8(sp)
    80005470:	01010113          	addi	sp,sp,16
    80005474:	00008067          	ret

0000000080005478 <timerinit>:
    80005478:	ff010113          	addi	sp,sp,-16
    8000547c:	00813423          	sd	s0,8(sp)
    80005480:	01010413          	addi	s0,sp,16
    80005484:	f14027f3          	csrr	a5,mhartid
    80005488:	0200c737          	lui	a4,0x200c
    8000548c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80005490:	0007869b          	sext.w	a3,a5
    80005494:	00269713          	slli	a4,a3,0x2
    80005498:	000f4637          	lui	a2,0xf4
    8000549c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800054a0:	00d70733          	add	a4,a4,a3
    800054a4:	0037979b          	slliw	a5,a5,0x3
    800054a8:	020046b7          	lui	a3,0x2004
    800054ac:	00d787b3          	add	a5,a5,a3
    800054b0:	00c585b3          	add	a1,a1,a2
    800054b4:	00371693          	slli	a3,a4,0x3
    800054b8:	00005717          	auipc	a4,0x5
    800054bc:	ad870713          	addi	a4,a4,-1320 # 80009f90 <timer_scratch>
    800054c0:	00b7b023          	sd	a1,0(a5)
    800054c4:	00d70733          	add	a4,a4,a3
    800054c8:	00f73c23          	sd	a5,24(a4)
    800054cc:	02c73023          	sd	a2,32(a4)
    800054d0:	34071073          	csrw	mscratch,a4
    800054d4:	00000797          	auipc	a5,0x0
    800054d8:	64c78793          	addi	a5,a5,1612 # 80005b20 <timervec>
    800054dc:	30579073          	csrw	mtvec,a5
    800054e0:	300027f3          	csrr	a5,mstatus
    800054e4:	0087e793          	ori	a5,a5,8
    800054e8:	30079073          	csrw	mstatus,a5
    800054ec:	304027f3          	csrr	a5,mie
    800054f0:	0807e793          	ori	a5,a5,128
    800054f4:	30479073          	csrw	mie,a5
    800054f8:	00813403          	ld	s0,8(sp)
    800054fc:	01010113          	addi	sp,sp,16
    80005500:	00008067          	ret

0000000080005504 <system_main>:
    80005504:	fe010113          	addi	sp,sp,-32
    80005508:	00813823          	sd	s0,16(sp)
    8000550c:	00913423          	sd	s1,8(sp)
    80005510:	00113c23          	sd	ra,24(sp)
    80005514:	02010413          	addi	s0,sp,32
    80005518:	00000097          	auipc	ra,0x0
    8000551c:	0c4080e7          	jalr	196(ra) # 800055dc <cpuid>
    80005520:	00005497          	auipc	s1,0x5
    80005524:	9e048493          	addi	s1,s1,-1568 # 80009f00 <started>
    80005528:	02050263          	beqz	a0,8000554c <system_main+0x48>
    8000552c:	0004a783          	lw	a5,0(s1)
    80005530:	0007879b          	sext.w	a5,a5
    80005534:	fe078ce3          	beqz	a5,8000552c <system_main+0x28>
    80005538:	0ff0000f          	fence
    8000553c:	00003517          	auipc	a0,0x3
    80005540:	fd450513          	addi	a0,a0,-44 # 80008510 <_ZL6digits+0x48>
    80005544:	00001097          	auipc	ra,0x1
    80005548:	a78080e7          	jalr	-1416(ra) # 80005fbc <panic>
    8000554c:	00001097          	auipc	ra,0x1
    80005550:	9cc080e7          	jalr	-1588(ra) # 80005f18 <consoleinit>
    80005554:	00001097          	auipc	ra,0x1
    80005558:	158080e7          	jalr	344(ra) # 800066ac <printfinit>
    8000555c:	00003517          	auipc	a0,0x3
    80005560:	c2c50513          	addi	a0,a0,-980 # 80008188 <CONSOLE_STATUS+0x178>
    80005564:	00001097          	auipc	ra,0x1
    80005568:	ab4080e7          	jalr	-1356(ra) # 80006018 <__printf>
    8000556c:	00003517          	auipc	a0,0x3
    80005570:	f7450513          	addi	a0,a0,-140 # 800084e0 <_ZL6digits+0x18>
    80005574:	00001097          	auipc	ra,0x1
    80005578:	aa4080e7          	jalr	-1372(ra) # 80006018 <__printf>
    8000557c:	00003517          	auipc	a0,0x3
    80005580:	c0c50513          	addi	a0,a0,-1012 # 80008188 <CONSOLE_STATUS+0x178>
    80005584:	00001097          	auipc	ra,0x1
    80005588:	a94080e7          	jalr	-1388(ra) # 80006018 <__printf>
    8000558c:	00001097          	auipc	ra,0x1
    80005590:	4ac080e7          	jalr	1196(ra) # 80006a38 <kinit>
    80005594:	00000097          	auipc	ra,0x0
    80005598:	148080e7          	jalr	328(ra) # 800056dc <trapinit>
    8000559c:	00000097          	auipc	ra,0x0
    800055a0:	16c080e7          	jalr	364(ra) # 80005708 <trapinithart>
    800055a4:	00000097          	auipc	ra,0x0
    800055a8:	5bc080e7          	jalr	1468(ra) # 80005b60 <plicinit>
    800055ac:	00000097          	auipc	ra,0x0
    800055b0:	5dc080e7          	jalr	1500(ra) # 80005b88 <plicinithart>
    800055b4:	00000097          	auipc	ra,0x0
    800055b8:	078080e7          	jalr	120(ra) # 8000562c <userinit>
    800055bc:	0ff0000f          	fence
    800055c0:	00100793          	li	a5,1
    800055c4:	00003517          	auipc	a0,0x3
    800055c8:	f3450513          	addi	a0,a0,-204 # 800084f8 <_ZL6digits+0x30>
    800055cc:	00f4a023          	sw	a5,0(s1)
    800055d0:	00001097          	auipc	ra,0x1
    800055d4:	a48080e7          	jalr	-1464(ra) # 80006018 <__printf>
    800055d8:	0000006f          	j	800055d8 <system_main+0xd4>

00000000800055dc <cpuid>:
    800055dc:	ff010113          	addi	sp,sp,-16
    800055e0:	00813423          	sd	s0,8(sp)
    800055e4:	01010413          	addi	s0,sp,16
    800055e8:	00020513          	mv	a0,tp
    800055ec:	00813403          	ld	s0,8(sp)
    800055f0:	0005051b          	sext.w	a0,a0
    800055f4:	01010113          	addi	sp,sp,16
    800055f8:	00008067          	ret

00000000800055fc <mycpu>:
    800055fc:	ff010113          	addi	sp,sp,-16
    80005600:	00813423          	sd	s0,8(sp)
    80005604:	01010413          	addi	s0,sp,16
    80005608:	00020793          	mv	a5,tp
    8000560c:	00813403          	ld	s0,8(sp)
    80005610:	0007879b          	sext.w	a5,a5
    80005614:	00779793          	slli	a5,a5,0x7
    80005618:	00006517          	auipc	a0,0x6
    8000561c:	9a850513          	addi	a0,a0,-1624 # 8000afc0 <cpus>
    80005620:	00f50533          	add	a0,a0,a5
    80005624:	01010113          	addi	sp,sp,16
    80005628:	00008067          	ret

000000008000562c <userinit>:
    8000562c:	ff010113          	addi	sp,sp,-16
    80005630:	00813423          	sd	s0,8(sp)
    80005634:	01010413          	addi	s0,sp,16
    80005638:	00813403          	ld	s0,8(sp)
    8000563c:	01010113          	addi	sp,sp,16
    80005640:	ffffc317          	auipc	t1,0xffffc
    80005644:	33430067          	jr	820(t1) # 80001974 <main>

0000000080005648 <either_copyout>:
    80005648:	ff010113          	addi	sp,sp,-16
    8000564c:	00813023          	sd	s0,0(sp)
    80005650:	00113423          	sd	ra,8(sp)
    80005654:	01010413          	addi	s0,sp,16
    80005658:	02051663          	bnez	a0,80005684 <either_copyout+0x3c>
    8000565c:	00058513          	mv	a0,a1
    80005660:	00060593          	mv	a1,a2
    80005664:	0006861b          	sext.w	a2,a3
    80005668:	00002097          	auipc	ra,0x2
    8000566c:	c5c080e7          	jalr	-932(ra) # 800072c4 <__memmove>
    80005670:	00813083          	ld	ra,8(sp)
    80005674:	00013403          	ld	s0,0(sp)
    80005678:	00000513          	li	a0,0
    8000567c:	01010113          	addi	sp,sp,16
    80005680:	00008067          	ret
    80005684:	00003517          	auipc	a0,0x3
    80005688:	eb450513          	addi	a0,a0,-332 # 80008538 <_ZL6digits+0x70>
    8000568c:	00001097          	auipc	ra,0x1
    80005690:	930080e7          	jalr	-1744(ra) # 80005fbc <panic>

0000000080005694 <either_copyin>:
    80005694:	ff010113          	addi	sp,sp,-16
    80005698:	00813023          	sd	s0,0(sp)
    8000569c:	00113423          	sd	ra,8(sp)
    800056a0:	01010413          	addi	s0,sp,16
    800056a4:	02059463          	bnez	a1,800056cc <either_copyin+0x38>
    800056a8:	00060593          	mv	a1,a2
    800056ac:	0006861b          	sext.w	a2,a3
    800056b0:	00002097          	auipc	ra,0x2
    800056b4:	c14080e7          	jalr	-1004(ra) # 800072c4 <__memmove>
    800056b8:	00813083          	ld	ra,8(sp)
    800056bc:	00013403          	ld	s0,0(sp)
    800056c0:	00000513          	li	a0,0
    800056c4:	01010113          	addi	sp,sp,16
    800056c8:	00008067          	ret
    800056cc:	00003517          	auipc	a0,0x3
    800056d0:	e9450513          	addi	a0,a0,-364 # 80008560 <_ZL6digits+0x98>
    800056d4:	00001097          	auipc	ra,0x1
    800056d8:	8e8080e7          	jalr	-1816(ra) # 80005fbc <panic>

00000000800056dc <trapinit>:
    800056dc:	ff010113          	addi	sp,sp,-16
    800056e0:	00813423          	sd	s0,8(sp)
    800056e4:	01010413          	addi	s0,sp,16
    800056e8:	00813403          	ld	s0,8(sp)
    800056ec:	00003597          	auipc	a1,0x3
    800056f0:	e9c58593          	addi	a1,a1,-356 # 80008588 <_ZL6digits+0xc0>
    800056f4:	00006517          	auipc	a0,0x6
    800056f8:	94c50513          	addi	a0,a0,-1716 # 8000b040 <tickslock>
    800056fc:	01010113          	addi	sp,sp,16
    80005700:	00001317          	auipc	t1,0x1
    80005704:	5c830067          	jr	1480(t1) # 80006cc8 <initlock>

0000000080005708 <trapinithart>:
    80005708:	ff010113          	addi	sp,sp,-16
    8000570c:	00813423          	sd	s0,8(sp)
    80005710:	01010413          	addi	s0,sp,16
    80005714:	00000797          	auipc	a5,0x0
    80005718:	2fc78793          	addi	a5,a5,764 # 80005a10 <kernelvec>
    8000571c:	10579073          	csrw	stvec,a5
    80005720:	00813403          	ld	s0,8(sp)
    80005724:	01010113          	addi	sp,sp,16
    80005728:	00008067          	ret

000000008000572c <usertrap>:
    8000572c:	ff010113          	addi	sp,sp,-16
    80005730:	00813423          	sd	s0,8(sp)
    80005734:	01010413          	addi	s0,sp,16
    80005738:	00813403          	ld	s0,8(sp)
    8000573c:	01010113          	addi	sp,sp,16
    80005740:	00008067          	ret

0000000080005744 <usertrapret>:
    80005744:	ff010113          	addi	sp,sp,-16
    80005748:	00813423          	sd	s0,8(sp)
    8000574c:	01010413          	addi	s0,sp,16
    80005750:	00813403          	ld	s0,8(sp)
    80005754:	01010113          	addi	sp,sp,16
    80005758:	00008067          	ret

000000008000575c <kerneltrap>:
    8000575c:	fe010113          	addi	sp,sp,-32
    80005760:	00813823          	sd	s0,16(sp)
    80005764:	00113c23          	sd	ra,24(sp)
    80005768:	00913423          	sd	s1,8(sp)
    8000576c:	02010413          	addi	s0,sp,32
    80005770:	142025f3          	csrr	a1,scause
    80005774:	100027f3          	csrr	a5,sstatus
    80005778:	0027f793          	andi	a5,a5,2
    8000577c:	10079c63          	bnez	a5,80005894 <kerneltrap+0x138>
    80005780:	142027f3          	csrr	a5,scause
    80005784:	0207ce63          	bltz	a5,800057c0 <kerneltrap+0x64>
    80005788:	00003517          	auipc	a0,0x3
    8000578c:	e4850513          	addi	a0,a0,-440 # 800085d0 <_ZL6digits+0x108>
    80005790:	00001097          	auipc	ra,0x1
    80005794:	888080e7          	jalr	-1912(ra) # 80006018 <__printf>
    80005798:	141025f3          	csrr	a1,sepc
    8000579c:	14302673          	csrr	a2,stval
    800057a0:	00003517          	auipc	a0,0x3
    800057a4:	e4050513          	addi	a0,a0,-448 # 800085e0 <_ZL6digits+0x118>
    800057a8:	00001097          	auipc	ra,0x1
    800057ac:	870080e7          	jalr	-1936(ra) # 80006018 <__printf>
    800057b0:	00003517          	auipc	a0,0x3
    800057b4:	e4850513          	addi	a0,a0,-440 # 800085f8 <_ZL6digits+0x130>
    800057b8:	00001097          	auipc	ra,0x1
    800057bc:	804080e7          	jalr	-2044(ra) # 80005fbc <panic>
    800057c0:	0ff7f713          	andi	a4,a5,255
    800057c4:	00900693          	li	a3,9
    800057c8:	04d70063          	beq	a4,a3,80005808 <kerneltrap+0xac>
    800057cc:	fff00713          	li	a4,-1
    800057d0:	03f71713          	slli	a4,a4,0x3f
    800057d4:	00170713          	addi	a4,a4,1
    800057d8:	fae798e3          	bne	a5,a4,80005788 <kerneltrap+0x2c>
    800057dc:	00000097          	auipc	ra,0x0
    800057e0:	e00080e7          	jalr	-512(ra) # 800055dc <cpuid>
    800057e4:	06050663          	beqz	a0,80005850 <kerneltrap+0xf4>
    800057e8:	144027f3          	csrr	a5,sip
    800057ec:	ffd7f793          	andi	a5,a5,-3
    800057f0:	14479073          	csrw	sip,a5
    800057f4:	01813083          	ld	ra,24(sp)
    800057f8:	01013403          	ld	s0,16(sp)
    800057fc:	00813483          	ld	s1,8(sp)
    80005800:	02010113          	addi	sp,sp,32
    80005804:	00008067          	ret
    80005808:	00000097          	auipc	ra,0x0
    8000580c:	3cc080e7          	jalr	972(ra) # 80005bd4 <plic_claim>
    80005810:	00a00793          	li	a5,10
    80005814:	00050493          	mv	s1,a0
    80005818:	06f50863          	beq	a0,a5,80005888 <kerneltrap+0x12c>
    8000581c:	fc050ce3          	beqz	a0,800057f4 <kerneltrap+0x98>
    80005820:	00050593          	mv	a1,a0
    80005824:	00003517          	auipc	a0,0x3
    80005828:	d8c50513          	addi	a0,a0,-628 # 800085b0 <_ZL6digits+0xe8>
    8000582c:	00000097          	auipc	ra,0x0
    80005830:	7ec080e7          	jalr	2028(ra) # 80006018 <__printf>
    80005834:	01013403          	ld	s0,16(sp)
    80005838:	01813083          	ld	ra,24(sp)
    8000583c:	00048513          	mv	a0,s1
    80005840:	00813483          	ld	s1,8(sp)
    80005844:	02010113          	addi	sp,sp,32
    80005848:	00000317          	auipc	t1,0x0
    8000584c:	3c430067          	jr	964(t1) # 80005c0c <plic_complete>
    80005850:	00005517          	auipc	a0,0x5
    80005854:	7f050513          	addi	a0,a0,2032 # 8000b040 <tickslock>
    80005858:	00001097          	auipc	ra,0x1
    8000585c:	494080e7          	jalr	1172(ra) # 80006cec <acquire>
    80005860:	00004717          	auipc	a4,0x4
    80005864:	6a470713          	addi	a4,a4,1700 # 80009f04 <ticks>
    80005868:	00072783          	lw	a5,0(a4)
    8000586c:	00005517          	auipc	a0,0x5
    80005870:	7d450513          	addi	a0,a0,2004 # 8000b040 <tickslock>
    80005874:	0017879b          	addiw	a5,a5,1
    80005878:	00f72023          	sw	a5,0(a4)
    8000587c:	00001097          	auipc	ra,0x1
    80005880:	53c080e7          	jalr	1340(ra) # 80006db8 <release>
    80005884:	f65ff06f          	j	800057e8 <kerneltrap+0x8c>
    80005888:	00001097          	auipc	ra,0x1
    8000588c:	098080e7          	jalr	152(ra) # 80006920 <uartintr>
    80005890:	fa5ff06f          	j	80005834 <kerneltrap+0xd8>
    80005894:	00003517          	auipc	a0,0x3
    80005898:	cfc50513          	addi	a0,a0,-772 # 80008590 <_ZL6digits+0xc8>
    8000589c:	00000097          	auipc	ra,0x0
    800058a0:	720080e7          	jalr	1824(ra) # 80005fbc <panic>

00000000800058a4 <clockintr>:
    800058a4:	fe010113          	addi	sp,sp,-32
    800058a8:	00813823          	sd	s0,16(sp)
    800058ac:	00913423          	sd	s1,8(sp)
    800058b0:	00113c23          	sd	ra,24(sp)
    800058b4:	02010413          	addi	s0,sp,32
    800058b8:	00005497          	auipc	s1,0x5
    800058bc:	78848493          	addi	s1,s1,1928 # 8000b040 <tickslock>
    800058c0:	00048513          	mv	a0,s1
    800058c4:	00001097          	auipc	ra,0x1
    800058c8:	428080e7          	jalr	1064(ra) # 80006cec <acquire>
    800058cc:	00004717          	auipc	a4,0x4
    800058d0:	63870713          	addi	a4,a4,1592 # 80009f04 <ticks>
    800058d4:	00072783          	lw	a5,0(a4)
    800058d8:	01013403          	ld	s0,16(sp)
    800058dc:	01813083          	ld	ra,24(sp)
    800058e0:	00048513          	mv	a0,s1
    800058e4:	0017879b          	addiw	a5,a5,1
    800058e8:	00813483          	ld	s1,8(sp)
    800058ec:	00f72023          	sw	a5,0(a4)
    800058f0:	02010113          	addi	sp,sp,32
    800058f4:	00001317          	auipc	t1,0x1
    800058f8:	4c430067          	jr	1220(t1) # 80006db8 <release>

00000000800058fc <devintr>:
    800058fc:	142027f3          	csrr	a5,scause
    80005900:	00000513          	li	a0,0
    80005904:	0007c463          	bltz	a5,8000590c <devintr+0x10>
    80005908:	00008067          	ret
    8000590c:	fe010113          	addi	sp,sp,-32
    80005910:	00813823          	sd	s0,16(sp)
    80005914:	00113c23          	sd	ra,24(sp)
    80005918:	00913423          	sd	s1,8(sp)
    8000591c:	02010413          	addi	s0,sp,32
    80005920:	0ff7f713          	andi	a4,a5,255
    80005924:	00900693          	li	a3,9
    80005928:	04d70c63          	beq	a4,a3,80005980 <devintr+0x84>
    8000592c:	fff00713          	li	a4,-1
    80005930:	03f71713          	slli	a4,a4,0x3f
    80005934:	00170713          	addi	a4,a4,1
    80005938:	00e78c63          	beq	a5,a4,80005950 <devintr+0x54>
    8000593c:	01813083          	ld	ra,24(sp)
    80005940:	01013403          	ld	s0,16(sp)
    80005944:	00813483          	ld	s1,8(sp)
    80005948:	02010113          	addi	sp,sp,32
    8000594c:	00008067          	ret
    80005950:	00000097          	auipc	ra,0x0
    80005954:	c8c080e7          	jalr	-884(ra) # 800055dc <cpuid>
    80005958:	06050663          	beqz	a0,800059c4 <devintr+0xc8>
    8000595c:	144027f3          	csrr	a5,sip
    80005960:	ffd7f793          	andi	a5,a5,-3
    80005964:	14479073          	csrw	sip,a5
    80005968:	01813083          	ld	ra,24(sp)
    8000596c:	01013403          	ld	s0,16(sp)
    80005970:	00813483          	ld	s1,8(sp)
    80005974:	00200513          	li	a0,2
    80005978:	02010113          	addi	sp,sp,32
    8000597c:	00008067          	ret
    80005980:	00000097          	auipc	ra,0x0
    80005984:	254080e7          	jalr	596(ra) # 80005bd4 <plic_claim>
    80005988:	00a00793          	li	a5,10
    8000598c:	00050493          	mv	s1,a0
    80005990:	06f50663          	beq	a0,a5,800059fc <devintr+0x100>
    80005994:	00100513          	li	a0,1
    80005998:	fa0482e3          	beqz	s1,8000593c <devintr+0x40>
    8000599c:	00048593          	mv	a1,s1
    800059a0:	00003517          	auipc	a0,0x3
    800059a4:	c1050513          	addi	a0,a0,-1008 # 800085b0 <_ZL6digits+0xe8>
    800059a8:	00000097          	auipc	ra,0x0
    800059ac:	670080e7          	jalr	1648(ra) # 80006018 <__printf>
    800059b0:	00048513          	mv	a0,s1
    800059b4:	00000097          	auipc	ra,0x0
    800059b8:	258080e7          	jalr	600(ra) # 80005c0c <plic_complete>
    800059bc:	00100513          	li	a0,1
    800059c0:	f7dff06f          	j	8000593c <devintr+0x40>
    800059c4:	00005517          	auipc	a0,0x5
    800059c8:	67c50513          	addi	a0,a0,1660 # 8000b040 <tickslock>
    800059cc:	00001097          	auipc	ra,0x1
    800059d0:	320080e7          	jalr	800(ra) # 80006cec <acquire>
    800059d4:	00004717          	auipc	a4,0x4
    800059d8:	53070713          	addi	a4,a4,1328 # 80009f04 <ticks>
    800059dc:	00072783          	lw	a5,0(a4)
    800059e0:	00005517          	auipc	a0,0x5
    800059e4:	66050513          	addi	a0,a0,1632 # 8000b040 <tickslock>
    800059e8:	0017879b          	addiw	a5,a5,1
    800059ec:	00f72023          	sw	a5,0(a4)
    800059f0:	00001097          	auipc	ra,0x1
    800059f4:	3c8080e7          	jalr	968(ra) # 80006db8 <release>
    800059f8:	f65ff06f          	j	8000595c <devintr+0x60>
    800059fc:	00001097          	auipc	ra,0x1
    80005a00:	f24080e7          	jalr	-220(ra) # 80006920 <uartintr>
    80005a04:	fadff06f          	j	800059b0 <devintr+0xb4>
	...

0000000080005a10 <kernelvec>:
    80005a10:	f0010113          	addi	sp,sp,-256
    80005a14:	00113023          	sd	ra,0(sp)
    80005a18:	00213423          	sd	sp,8(sp)
    80005a1c:	00313823          	sd	gp,16(sp)
    80005a20:	00413c23          	sd	tp,24(sp)
    80005a24:	02513023          	sd	t0,32(sp)
    80005a28:	02613423          	sd	t1,40(sp)
    80005a2c:	02713823          	sd	t2,48(sp)
    80005a30:	02813c23          	sd	s0,56(sp)
    80005a34:	04913023          	sd	s1,64(sp)
    80005a38:	04a13423          	sd	a0,72(sp)
    80005a3c:	04b13823          	sd	a1,80(sp)
    80005a40:	04c13c23          	sd	a2,88(sp)
    80005a44:	06d13023          	sd	a3,96(sp)
    80005a48:	06e13423          	sd	a4,104(sp)
    80005a4c:	06f13823          	sd	a5,112(sp)
    80005a50:	07013c23          	sd	a6,120(sp)
    80005a54:	09113023          	sd	a7,128(sp)
    80005a58:	09213423          	sd	s2,136(sp)
    80005a5c:	09313823          	sd	s3,144(sp)
    80005a60:	09413c23          	sd	s4,152(sp)
    80005a64:	0b513023          	sd	s5,160(sp)
    80005a68:	0b613423          	sd	s6,168(sp)
    80005a6c:	0b713823          	sd	s7,176(sp)
    80005a70:	0b813c23          	sd	s8,184(sp)
    80005a74:	0d913023          	sd	s9,192(sp)
    80005a78:	0da13423          	sd	s10,200(sp)
    80005a7c:	0db13823          	sd	s11,208(sp)
    80005a80:	0dc13c23          	sd	t3,216(sp)
    80005a84:	0fd13023          	sd	t4,224(sp)
    80005a88:	0fe13423          	sd	t5,232(sp)
    80005a8c:	0ff13823          	sd	t6,240(sp)
    80005a90:	ccdff0ef          	jal	ra,8000575c <kerneltrap>
    80005a94:	00013083          	ld	ra,0(sp)
    80005a98:	00813103          	ld	sp,8(sp)
    80005a9c:	01013183          	ld	gp,16(sp)
    80005aa0:	02013283          	ld	t0,32(sp)
    80005aa4:	02813303          	ld	t1,40(sp)
    80005aa8:	03013383          	ld	t2,48(sp)
    80005aac:	03813403          	ld	s0,56(sp)
    80005ab0:	04013483          	ld	s1,64(sp)
    80005ab4:	04813503          	ld	a0,72(sp)
    80005ab8:	05013583          	ld	a1,80(sp)
    80005abc:	05813603          	ld	a2,88(sp)
    80005ac0:	06013683          	ld	a3,96(sp)
    80005ac4:	06813703          	ld	a4,104(sp)
    80005ac8:	07013783          	ld	a5,112(sp)
    80005acc:	07813803          	ld	a6,120(sp)
    80005ad0:	08013883          	ld	a7,128(sp)
    80005ad4:	08813903          	ld	s2,136(sp)
    80005ad8:	09013983          	ld	s3,144(sp)
    80005adc:	09813a03          	ld	s4,152(sp)
    80005ae0:	0a013a83          	ld	s5,160(sp)
    80005ae4:	0a813b03          	ld	s6,168(sp)
    80005ae8:	0b013b83          	ld	s7,176(sp)
    80005aec:	0b813c03          	ld	s8,184(sp)
    80005af0:	0c013c83          	ld	s9,192(sp)
    80005af4:	0c813d03          	ld	s10,200(sp)
    80005af8:	0d013d83          	ld	s11,208(sp)
    80005afc:	0d813e03          	ld	t3,216(sp)
    80005b00:	0e013e83          	ld	t4,224(sp)
    80005b04:	0e813f03          	ld	t5,232(sp)
    80005b08:	0f013f83          	ld	t6,240(sp)
    80005b0c:	10010113          	addi	sp,sp,256
    80005b10:	10200073          	sret
    80005b14:	00000013          	nop
    80005b18:	00000013          	nop
    80005b1c:	00000013          	nop

0000000080005b20 <timervec>:
    80005b20:	34051573          	csrrw	a0,mscratch,a0
    80005b24:	00b53023          	sd	a1,0(a0)
    80005b28:	00c53423          	sd	a2,8(a0)
    80005b2c:	00d53823          	sd	a3,16(a0)
    80005b30:	01853583          	ld	a1,24(a0)
    80005b34:	02053603          	ld	a2,32(a0)
    80005b38:	0005b683          	ld	a3,0(a1)
    80005b3c:	00c686b3          	add	a3,a3,a2
    80005b40:	00d5b023          	sd	a3,0(a1)
    80005b44:	00200593          	li	a1,2
    80005b48:	14459073          	csrw	sip,a1
    80005b4c:	01053683          	ld	a3,16(a0)
    80005b50:	00853603          	ld	a2,8(a0)
    80005b54:	00053583          	ld	a1,0(a0)
    80005b58:	34051573          	csrrw	a0,mscratch,a0
    80005b5c:	30200073          	mret

0000000080005b60 <plicinit>:
    80005b60:	ff010113          	addi	sp,sp,-16
    80005b64:	00813423          	sd	s0,8(sp)
    80005b68:	01010413          	addi	s0,sp,16
    80005b6c:	00813403          	ld	s0,8(sp)
    80005b70:	0c0007b7          	lui	a5,0xc000
    80005b74:	00100713          	li	a4,1
    80005b78:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    80005b7c:	00e7a223          	sw	a4,4(a5)
    80005b80:	01010113          	addi	sp,sp,16
    80005b84:	00008067          	ret

0000000080005b88 <plicinithart>:
    80005b88:	ff010113          	addi	sp,sp,-16
    80005b8c:	00813023          	sd	s0,0(sp)
    80005b90:	00113423          	sd	ra,8(sp)
    80005b94:	01010413          	addi	s0,sp,16
    80005b98:	00000097          	auipc	ra,0x0
    80005b9c:	a44080e7          	jalr	-1468(ra) # 800055dc <cpuid>
    80005ba0:	0085171b          	slliw	a4,a0,0x8
    80005ba4:	0c0027b7          	lui	a5,0xc002
    80005ba8:	00e787b3          	add	a5,a5,a4
    80005bac:	40200713          	li	a4,1026
    80005bb0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80005bb4:	00813083          	ld	ra,8(sp)
    80005bb8:	00013403          	ld	s0,0(sp)
    80005bbc:	00d5151b          	slliw	a0,a0,0xd
    80005bc0:	0c2017b7          	lui	a5,0xc201
    80005bc4:	00a78533          	add	a0,a5,a0
    80005bc8:	00052023          	sw	zero,0(a0)
    80005bcc:	01010113          	addi	sp,sp,16
    80005bd0:	00008067          	ret

0000000080005bd4 <plic_claim>:
    80005bd4:	ff010113          	addi	sp,sp,-16
    80005bd8:	00813023          	sd	s0,0(sp)
    80005bdc:	00113423          	sd	ra,8(sp)
    80005be0:	01010413          	addi	s0,sp,16
    80005be4:	00000097          	auipc	ra,0x0
    80005be8:	9f8080e7          	jalr	-1544(ra) # 800055dc <cpuid>
    80005bec:	00813083          	ld	ra,8(sp)
    80005bf0:	00013403          	ld	s0,0(sp)
    80005bf4:	00d5151b          	slliw	a0,a0,0xd
    80005bf8:	0c2017b7          	lui	a5,0xc201
    80005bfc:	00a78533          	add	a0,a5,a0
    80005c00:	00452503          	lw	a0,4(a0)
    80005c04:	01010113          	addi	sp,sp,16
    80005c08:	00008067          	ret

0000000080005c0c <plic_complete>:
    80005c0c:	fe010113          	addi	sp,sp,-32
    80005c10:	00813823          	sd	s0,16(sp)
    80005c14:	00913423          	sd	s1,8(sp)
    80005c18:	00113c23          	sd	ra,24(sp)
    80005c1c:	02010413          	addi	s0,sp,32
    80005c20:	00050493          	mv	s1,a0
    80005c24:	00000097          	auipc	ra,0x0
    80005c28:	9b8080e7          	jalr	-1608(ra) # 800055dc <cpuid>
    80005c2c:	01813083          	ld	ra,24(sp)
    80005c30:	01013403          	ld	s0,16(sp)
    80005c34:	00d5179b          	slliw	a5,a0,0xd
    80005c38:	0c201737          	lui	a4,0xc201
    80005c3c:	00f707b3          	add	a5,a4,a5
    80005c40:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80005c44:	00813483          	ld	s1,8(sp)
    80005c48:	02010113          	addi	sp,sp,32
    80005c4c:	00008067          	ret

0000000080005c50 <consolewrite>:
    80005c50:	fb010113          	addi	sp,sp,-80
    80005c54:	04813023          	sd	s0,64(sp)
    80005c58:	04113423          	sd	ra,72(sp)
    80005c5c:	02913c23          	sd	s1,56(sp)
    80005c60:	03213823          	sd	s2,48(sp)
    80005c64:	03313423          	sd	s3,40(sp)
    80005c68:	03413023          	sd	s4,32(sp)
    80005c6c:	01513c23          	sd	s5,24(sp)
    80005c70:	05010413          	addi	s0,sp,80
    80005c74:	06c05c63          	blez	a2,80005cec <consolewrite+0x9c>
    80005c78:	00060993          	mv	s3,a2
    80005c7c:	00050a13          	mv	s4,a0
    80005c80:	00058493          	mv	s1,a1
    80005c84:	00000913          	li	s2,0
    80005c88:	fff00a93          	li	s5,-1
    80005c8c:	01c0006f          	j	80005ca8 <consolewrite+0x58>
    80005c90:	fbf44503          	lbu	a0,-65(s0)
    80005c94:	0019091b          	addiw	s2,s2,1
    80005c98:	00148493          	addi	s1,s1,1
    80005c9c:	00001097          	auipc	ra,0x1
    80005ca0:	a9c080e7          	jalr	-1380(ra) # 80006738 <uartputc>
    80005ca4:	03298063          	beq	s3,s2,80005cc4 <consolewrite+0x74>
    80005ca8:	00048613          	mv	a2,s1
    80005cac:	00100693          	li	a3,1
    80005cb0:	000a0593          	mv	a1,s4
    80005cb4:	fbf40513          	addi	a0,s0,-65
    80005cb8:	00000097          	auipc	ra,0x0
    80005cbc:	9dc080e7          	jalr	-1572(ra) # 80005694 <either_copyin>
    80005cc0:	fd5518e3          	bne	a0,s5,80005c90 <consolewrite+0x40>
    80005cc4:	04813083          	ld	ra,72(sp)
    80005cc8:	04013403          	ld	s0,64(sp)
    80005ccc:	03813483          	ld	s1,56(sp)
    80005cd0:	02813983          	ld	s3,40(sp)
    80005cd4:	02013a03          	ld	s4,32(sp)
    80005cd8:	01813a83          	ld	s5,24(sp)
    80005cdc:	00090513          	mv	a0,s2
    80005ce0:	03013903          	ld	s2,48(sp)
    80005ce4:	05010113          	addi	sp,sp,80
    80005ce8:	00008067          	ret
    80005cec:	00000913          	li	s2,0
    80005cf0:	fd5ff06f          	j	80005cc4 <consolewrite+0x74>

0000000080005cf4 <consoleread>:
    80005cf4:	f9010113          	addi	sp,sp,-112
    80005cf8:	06813023          	sd	s0,96(sp)
    80005cfc:	04913c23          	sd	s1,88(sp)
    80005d00:	05213823          	sd	s2,80(sp)
    80005d04:	05313423          	sd	s3,72(sp)
    80005d08:	05413023          	sd	s4,64(sp)
    80005d0c:	03513c23          	sd	s5,56(sp)
    80005d10:	03613823          	sd	s6,48(sp)
    80005d14:	03713423          	sd	s7,40(sp)
    80005d18:	03813023          	sd	s8,32(sp)
    80005d1c:	06113423          	sd	ra,104(sp)
    80005d20:	01913c23          	sd	s9,24(sp)
    80005d24:	07010413          	addi	s0,sp,112
    80005d28:	00060b93          	mv	s7,a2
    80005d2c:	00050913          	mv	s2,a0
    80005d30:	00058c13          	mv	s8,a1
    80005d34:	00060b1b          	sext.w	s6,a2
    80005d38:	00005497          	auipc	s1,0x5
    80005d3c:	33048493          	addi	s1,s1,816 # 8000b068 <cons>
    80005d40:	00400993          	li	s3,4
    80005d44:	fff00a13          	li	s4,-1
    80005d48:	00a00a93          	li	s5,10
    80005d4c:	05705e63          	blez	s7,80005da8 <consoleread+0xb4>
    80005d50:	09c4a703          	lw	a4,156(s1)
    80005d54:	0984a783          	lw	a5,152(s1)
    80005d58:	0007071b          	sext.w	a4,a4
    80005d5c:	08e78463          	beq	a5,a4,80005de4 <consoleread+0xf0>
    80005d60:	07f7f713          	andi	a4,a5,127
    80005d64:	00e48733          	add	a4,s1,a4
    80005d68:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80005d6c:	0017869b          	addiw	a3,a5,1
    80005d70:	08d4ac23          	sw	a3,152(s1)
    80005d74:	00070c9b          	sext.w	s9,a4
    80005d78:	0b370663          	beq	a4,s3,80005e24 <consoleread+0x130>
    80005d7c:	00100693          	li	a3,1
    80005d80:	f9f40613          	addi	a2,s0,-97
    80005d84:	000c0593          	mv	a1,s8
    80005d88:	00090513          	mv	a0,s2
    80005d8c:	f8e40fa3          	sb	a4,-97(s0)
    80005d90:	00000097          	auipc	ra,0x0
    80005d94:	8b8080e7          	jalr	-1864(ra) # 80005648 <either_copyout>
    80005d98:	01450863          	beq	a0,s4,80005da8 <consoleread+0xb4>
    80005d9c:	001c0c13          	addi	s8,s8,1
    80005da0:	fffb8b9b          	addiw	s7,s7,-1
    80005da4:	fb5c94e3          	bne	s9,s5,80005d4c <consoleread+0x58>
    80005da8:	000b851b          	sext.w	a0,s7
    80005dac:	06813083          	ld	ra,104(sp)
    80005db0:	06013403          	ld	s0,96(sp)
    80005db4:	05813483          	ld	s1,88(sp)
    80005db8:	05013903          	ld	s2,80(sp)
    80005dbc:	04813983          	ld	s3,72(sp)
    80005dc0:	04013a03          	ld	s4,64(sp)
    80005dc4:	03813a83          	ld	s5,56(sp)
    80005dc8:	02813b83          	ld	s7,40(sp)
    80005dcc:	02013c03          	ld	s8,32(sp)
    80005dd0:	01813c83          	ld	s9,24(sp)
    80005dd4:	40ab053b          	subw	a0,s6,a0
    80005dd8:	03013b03          	ld	s6,48(sp)
    80005ddc:	07010113          	addi	sp,sp,112
    80005de0:	00008067          	ret
    80005de4:	00001097          	auipc	ra,0x1
    80005de8:	1d8080e7          	jalr	472(ra) # 80006fbc <push_on>
    80005dec:	0984a703          	lw	a4,152(s1)
    80005df0:	09c4a783          	lw	a5,156(s1)
    80005df4:	0007879b          	sext.w	a5,a5
    80005df8:	fef70ce3          	beq	a4,a5,80005df0 <consoleread+0xfc>
    80005dfc:	00001097          	auipc	ra,0x1
    80005e00:	234080e7          	jalr	564(ra) # 80007030 <pop_on>
    80005e04:	0984a783          	lw	a5,152(s1)
    80005e08:	07f7f713          	andi	a4,a5,127
    80005e0c:	00e48733          	add	a4,s1,a4
    80005e10:	01874703          	lbu	a4,24(a4)
    80005e14:	0017869b          	addiw	a3,a5,1
    80005e18:	08d4ac23          	sw	a3,152(s1)
    80005e1c:	00070c9b          	sext.w	s9,a4
    80005e20:	f5371ee3          	bne	a4,s3,80005d7c <consoleread+0x88>
    80005e24:	000b851b          	sext.w	a0,s7
    80005e28:	f96bf2e3          	bgeu	s7,s6,80005dac <consoleread+0xb8>
    80005e2c:	08f4ac23          	sw	a5,152(s1)
    80005e30:	f7dff06f          	j	80005dac <consoleread+0xb8>

0000000080005e34 <consputc>:
    80005e34:	10000793          	li	a5,256
    80005e38:	00f50663          	beq	a0,a5,80005e44 <consputc+0x10>
    80005e3c:	00001317          	auipc	t1,0x1
    80005e40:	9f430067          	jr	-1548(t1) # 80006830 <uartputc_sync>
    80005e44:	ff010113          	addi	sp,sp,-16
    80005e48:	00113423          	sd	ra,8(sp)
    80005e4c:	00813023          	sd	s0,0(sp)
    80005e50:	01010413          	addi	s0,sp,16
    80005e54:	00800513          	li	a0,8
    80005e58:	00001097          	auipc	ra,0x1
    80005e5c:	9d8080e7          	jalr	-1576(ra) # 80006830 <uartputc_sync>
    80005e60:	02000513          	li	a0,32
    80005e64:	00001097          	auipc	ra,0x1
    80005e68:	9cc080e7          	jalr	-1588(ra) # 80006830 <uartputc_sync>
    80005e6c:	00013403          	ld	s0,0(sp)
    80005e70:	00813083          	ld	ra,8(sp)
    80005e74:	00800513          	li	a0,8
    80005e78:	01010113          	addi	sp,sp,16
    80005e7c:	00001317          	auipc	t1,0x1
    80005e80:	9b430067          	jr	-1612(t1) # 80006830 <uartputc_sync>

0000000080005e84 <consoleintr>:
    80005e84:	fe010113          	addi	sp,sp,-32
    80005e88:	00813823          	sd	s0,16(sp)
    80005e8c:	00913423          	sd	s1,8(sp)
    80005e90:	01213023          	sd	s2,0(sp)
    80005e94:	00113c23          	sd	ra,24(sp)
    80005e98:	02010413          	addi	s0,sp,32
    80005e9c:	00005917          	auipc	s2,0x5
    80005ea0:	1cc90913          	addi	s2,s2,460 # 8000b068 <cons>
    80005ea4:	00050493          	mv	s1,a0
    80005ea8:	00090513          	mv	a0,s2
    80005eac:	00001097          	auipc	ra,0x1
    80005eb0:	e40080e7          	jalr	-448(ra) # 80006cec <acquire>
    80005eb4:	02048c63          	beqz	s1,80005eec <consoleintr+0x68>
    80005eb8:	0a092783          	lw	a5,160(s2)
    80005ebc:	09892703          	lw	a4,152(s2)
    80005ec0:	07f00693          	li	a3,127
    80005ec4:	40e7873b          	subw	a4,a5,a4
    80005ec8:	02e6e263          	bltu	a3,a4,80005eec <consoleintr+0x68>
    80005ecc:	00d00713          	li	a4,13
    80005ed0:	04e48063          	beq	s1,a4,80005f10 <consoleintr+0x8c>
    80005ed4:	07f7f713          	andi	a4,a5,127
    80005ed8:	00e90733          	add	a4,s2,a4
    80005edc:	0017879b          	addiw	a5,a5,1
    80005ee0:	0af92023          	sw	a5,160(s2)
    80005ee4:	00970c23          	sb	s1,24(a4)
    80005ee8:	08f92e23          	sw	a5,156(s2)
    80005eec:	01013403          	ld	s0,16(sp)
    80005ef0:	01813083          	ld	ra,24(sp)
    80005ef4:	00813483          	ld	s1,8(sp)
    80005ef8:	00013903          	ld	s2,0(sp)
    80005efc:	00005517          	auipc	a0,0x5
    80005f00:	16c50513          	addi	a0,a0,364 # 8000b068 <cons>
    80005f04:	02010113          	addi	sp,sp,32
    80005f08:	00001317          	auipc	t1,0x1
    80005f0c:	eb030067          	jr	-336(t1) # 80006db8 <release>
    80005f10:	00a00493          	li	s1,10
    80005f14:	fc1ff06f          	j	80005ed4 <consoleintr+0x50>

0000000080005f18 <consoleinit>:
    80005f18:	fe010113          	addi	sp,sp,-32
    80005f1c:	00113c23          	sd	ra,24(sp)
    80005f20:	00813823          	sd	s0,16(sp)
    80005f24:	00913423          	sd	s1,8(sp)
    80005f28:	02010413          	addi	s0,sp,32
    80005f2c:	00005497          	auipc	s1,0x5
    80005f30:	13c48493          	addi	s1,s1,316 # 8000b068 <cons>
    80005f34:	00048513          	mv	a0,s1
    80005f38:	00002597          	auipc	a1,0x2
    80005f3c:	6d058593          	addi	a1,a1,1744 # 80008608 <_ZL6digits+0x140>
    80005f40:	00001097          	auipc	ra,0x1
    80005f44:	d88080e7          	jalr	-632(ra) # 80006cc8 <initlock>
    80005f48:	00000097          	auipc	ra,0x0
    80005f4c:	7ac080e7          	jalr	1964(ra) # 800066f4 <uartinit>
    80005f50:	01813083          	ld	ra,24(sp)
    80005f54:	01013403          	ld	s0,16(sp)
    80005f58:	00000797          	auipc	a5,0x0
    80005f5c:	d9c78793          	addi	a5,a5,-612 # 80005cf4 <consoleread>
    80005f60:	0af4bc23          	sd	a5,184(s1)
    80005f64:	00000797          	auipc	a5,0x0
    80005f68:	cec78793          	addi	a5,a5,-788 # 80005c50 <consolewrite>
    80005f6c:	0cf4b023          	sd	a5,192(s1)
    80005f70:	00813483          	ld	s1,8(sp)
    80005f74:	02010113          	addi	sp,sp,32
    80005f78:	00008067          	ret

0000000080005f7c <console_read>:
    80005f7c:	ff010113          	addi	sp,sp,-16
    80005f80:	00813423          	sd	s0,8(sp)
    80005f84:	01010413          	addi	s0,sp,16
    80005f88:	00813403          	ld	s0,8(sp)
    80005f8c:	00005317          	auipc	t1,0x5
    80005f90:	19433303          	ld	t1,404(t1) # 8000b120 <devsw+0x10>
    80005f94:	01010113          	addi	sp,sp,16
    80005f98:	00030067          	jr	t1

0000000080005f9c <console_write>:
    80005f9c:	ff010113          	addi	sp,sp,-16
    80005fa0:	00813423          	sd	s0,8(sp)
    80005fa4:	01010413          	addi	s0,sp,16
    80005fa8:	00813403          	ld	s0,8(sp)
    80005fac:	00005317          	auipc	t1,0x5
    80005fb0:	17c33303          	ld	t1,380(t1) # 8000b128 <devsw+0x18>
    80005fb4:	01010113          	addi	sp,sp,16
    80005fb8:	00030067          	jr	t1

0000000080005fbc <panic>:
    80005fbc:	fe010113          	addi	sp,sp,-32
    80005fc0:	00113c23          	sd	ra,24(sp)
    80005fc4:	00813823          	sd	s0,16(sp)
    80005fc8:	00913423          	sd	s1,8(sp)
    80005fcc:	02010413          	addi	s0,sp,32
    80005fd0:	00050493          	mv	s1,a0
    80005fd4:	00002517          	auipc	a0,0x2
    80005fd8:	63c50513          	addi	a0,a0,1596 # 80008610 <_ZL6digits+0x148>
    80005fdc:	00005797          	auipc	a5,0x5
    80005fe0:	1e07a623          	sw	zero,492(a5) # 8000b1c8 <pr+0x18>
    80005fe4:	00000097          	auipc	ra,0x0
    80005fe8:	034080e7          	jalr	52(ra) # 80006018 <__printf>
    80005fec:	00048513          	mv	a0,s1
    80005ff0:	00000097          	auipc	ra,0x0
    80005ff4:	028080e7          	jalr	40(ra) # 80006018 <__printf>
    80005ff8:	00002517          	auipc	a0,0x2
    80005ffc:	19050513          	addi	a0,a0,400 # 80008188 <CONSOLE_STATUS+0x178>
    80006000:	00000097          	auipc	ra,0x0
    80006004:	018080e7          	jalr	24(ra) # 80006018 <__printf>
    80006008:	00100793          	li	a5,1
    8000600c:	00004717          	auipc	a4,0x4
    80006010:	eef72e23          	sw	a5,-260(a4) # 80009f08 <panicked>
    80006014:	0000006f          	j	80006014 <panic+0x58>

0000000080006018 <__printf>:
    80006018:	f3010113          	addi	sp,sp,-208
    8000601c:	08813023          	sd	s0,128(sp)
    80006020:	07313423          	sd	s3,104(sp)
    80006024:	09010413          	addi	s0,sp,144
    80006028:	05813023          	sd	s8,64(sp)
    8000602c:	08113423          	sd	ra,136(sp)
    80006030:	06913c23          	sd	s1,120(sp)
    80006034:	07213823          	sd	s2,112(sp)
    80006038:	07413023          	sd	s4,96(sp)
    8000603c:	05513c23          	sd	s5,88(sp)
    80006040:	05613823          	sd	s6,80(sp)
    80006044:	05713423          	sd	s7,72(sp)
    80006048:	03913c23          	sd	s9,56(sp)
    8000604c:	03a13823          	sd	s10,48(sp)
    80006050:	03b13423          	sd	s11,40(sp)
    80006054:	00005317          	auipc	t1,0x5
    80006058:	15c30313          	addi	t1,t1,348 # 8000b1b0 <pr>
    8000605c:	01832c03          	lw	s8,24(t1)
    80006060:	00b43423          	sd	a1,8(s0)
    80006064:	00c43823          	sd	a2,16(s0)
    80006068:	00d43c23          	sd	a3,24(s0)
    8000606c:	02e43023          	sd	a4,32(s0)
    80006070:	02f43423          	sd	a5,40(s0)
    80006074:	03043823          	sd	a6,48(s0)
    80006078:	03143c23          	sd	a7,56(s0)
    8000607c:	00050993          	mv	s3,a0
    80006080:	4a0c1663          	bnez	s8,8000652c <__printf+0x514>
    80006084:	60098c63          	beqz	s3,8000669c <__printf+0x684>
    80006088:	0009c503          	lbu	a0,0(s3)
    8000608c:	00840793          	addi	a5,s0,8
    80006090:	f6f43c23          	sd	a5,-136(s0)
    80006094:	00000493          	li	s1,0
    80006098:	22050063          	beqz	a0,800062b8 <__printf+0x2a0>
    8000609c:	00002a37          	lui	s4,0x2
    800060a0:	00018ab7          	lui	s5,0x18
    800060a4:	000f4b37          	lui	s6,0xf4
    800060a8:	00989bb7          	lui	s7,0x989
    800060ac:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    800060b0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    800060b4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    800060b8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    800060bc:	00148c9b          	addiw	s9,s1,1
    800060c0:	02500793          	li	a5,37
    800060c4:	01998933          	add	s2,s3,s9
    800060c8:	38f51263          	bne	a0,a5,8000644c <__printf+0x434>
    800060cc:	00094783          	lbu	a5,0(s2)
    800060d0:	00078c9b          	sext.w	s9,a5
    800060d4:	1e078263          	beqz	a5,800062b8 <__printf+0x2a0>
    800060d8:	0024849b          	addiw	s1,s1,2
    800060dc:	07000713          	li	a4,112
    800060e0:	00998933          	add	s2,s3,s1
    800060e4:	38e78a63          	beq	a5,a4,80006478 <__printf+0x460>
    800060e8:	20f76863          	bltu	a4,a5,800062f8 <__printf+0x2e0>
    800060ec:	42a78863          	beq	a5,a0,8000651c <__printf+0x504>
    800060f0:	06400713          	li	a4,100
    800060f4:	40e79663          	bne	a5,a4,80006500 <__printf+0x4e8>
    800060f8:	f7843783          	ld	a5,-136(s0)
    800060fc:	0007a603          	lw	a2,0(a5)
    80006100:	00878793          	addi	a5,a5,8
    80006104:	f6f43c23          	sd	a5,-136(s0)
    80006108:	42064a63          	bltz	a2,8000653c <__printf+0x524>
    8000610c:	00a00713          	li	a4,10
    80006110:	02e677bb          	remuw	a5,a2,a4
    80006114:	00002d97          	auipc	s11,0x2
    80006118:	524d8d93          	addi	s11,s11,1316 # 80008638 <digits>
    8000611c:	00900593          	li	a1,9
    80006120:	0006051b          	sext.w	a0,a2
    80006124:	00000c93          	li	s9,0
    80006128:	02079793          	slli	a5,a5,0x20
    8000612c:	0207d793          	srli	a5,a5,0x20
    80006130:	00fd87b3          	add	a5,s11,a5
    80006134:	0007c783          	lbu	a5,0(a5)
    80006138:	02e656bb          	divuw	a3,a2,a4
    8000613c:	f8f40023          	sb	a5,-128(s0)
    80006140:	14c5d863          	bge	a1,a2,80006290 <__printf+0x278>
    80006144:	06300593          	li	a1,99
    80006148:	00100c93          	li	s9,1
    8000614c:	02e6f7bb          	remuw	a5,a3,a4
    80006150:	02079793          	slli	a5,a5,0x20
    80006154:	0207d793          	srli	a5,a5,0x20
    80006158:	00fd87b3          	add	a5,s11,a5
    8000615c:	0007c783          	lbu	a5,0(a5)
    80006160:	02e6d73b          	divuw	a4,a3,a4
    80006164:	f8f400a3          	sb	a5,-127(s0)
    80006168:	12a5f463          	bgeu	a1,a0,80006290 <__printf+0x278>
    8000616c:	00a00693          	li	a3,10
    80006170:	00900593          	li	a1,9
    80006174:	02d777bb          	remuw	a5,a4,a3
    80006178:	02079793          	slli	a5,a5,0x20
    8000617c:	0207d793          	srli	a5,a5,0x20
    80006180:	00fd87b3          	add	a5,s11,a5
    80006184:	0007c503          	lbu	a0,0(a5)
    80006188:	02d757bb          	divuw	a5,a4,a3
    8000618c:	f8a40123          	sb	a0,-126(s0)
    80006190:	48e5f263          	bgeu	a1,a4,80006614 <__printf+0x5fc>
    80006194:	06300513          	li	a0,99
    80006198:	02d7f5bb          	remuw	a1,a5,a3
    8000619c:	02059593          	slli	a1,a1,0x20
    800061a0:	0205d593          	srli	a1,a1,0x20
    800061a4:	00bd85b3          	add	a1,s11,a1
    800061a8:	0005c583          	lbu	a1,0(a1)
    800061ac:	02d7d7bb          	divuw	a5,a5,a3
    800061b0:	f8b401a3          	sb	a1,-125(s0)
    800061b4:	48e57263          	bgeu	a0,a4,80006638 <__printf+0x620>
    800061b8:	3e700513          	li	a0,999
    800061bc:	02d7f5bb          	remuw	a1,a5,a3
    800061c0:	02059593          	slli	a1,a1,0x20
    800061c4:	0205d593          	srli	a1,a1,0x20
    800061c8:	00bd85b3          	add	a1,s11,a1
    800061cc:	0005c583          	lbu	a1,0(a1)
    800061d0:	02d7d7bb          	divuw	a5,a5,a3
    800061d4:	f8b40223          	sb	a1,-124(s0)
    800061d8:	46e57663          	bgeu	a0,a4,80006644 <__printf+0x62c>
    800061dc:	02d7f5bb          	remuw	a1,a5,a3
    800061e0:	02059593          	slli	a1,a1,0x20
    800061e4:	0205d593          	srli	a1,a1,0x20
    800061e8:	00bd85b3          	add	a1,s11,a1
    800061ec:	0005c583          	lbu	a1,0(a1)
    800061f0:	02d7d7bb          	divuw	a5,a5,a3
    800061f4:	f8b402a3          	sb	a1,-123(s0)
    800061f8:	46ea7863          	bgeu	s4,a4,80006668 <__printf+0x650>
    800061fc:	02d7f5bb          	remuw	a1,a5,a3
    80006200:	02059593          	slli	a1,a1,0x20
    80006204:	0205d593          	srli	a1,a1,0x20
    80006208:	00bd85b3          	add	a1,s11,a1
    8000620c:	0005c583          	lbu	a1,0(a1)
    80006210:	02d7d7bb          	divuw	a5,a5,a3
    80006214:	f8b40323          	sb	a1,-122(s0)
    80006218:	3eeaf863          	bgeu	s5,a4,80006608 <__printf+0x5f0>
    8000621c:	02d7f5bb          	remuw	a1,a5,a3
    80006220:	02059593          	slli	a1,a1,0x20
    80006224:	0205d593          	srli	a1,a1,0x20
    80006228:	00bd85b3          	add	a1,s11,a1
    8000622c:	0005c583          	lbu	a1,0(a1)
    80006230:	02d7d7bb          	divuw	a5,a5,a3
    80006234:	f8b403a3          	sb	a1,-121(s0)
    80006238:	42eb7e63          	bgeu	s6,a4,80006674 <__printf+0x65c>
    8000623c:	02d7f5bb          	remuw	a1,a5,a3
    80006240:	02059593          	slli	a1,a1,0x20
    80006244:	0205d593          	srli	a1,a1,0x20
    80006248:	00bd85b3          	add	a1,s11,a1
    8000624c:	0005c583          	lbu	a1,0(a1)
    80006250:	02d7d7bb          	divuw	a5,a5,a3
    80006254:	f8b40423          	sb	a1,-120(s0)
    80006258:	42ebfc63          	bgeu	s7,a4,80006690 <__printf+0x678>
    8000625c:	02079793          	slli	a5,a5,0x20
    80006260:	0207d793          	srli	a5,a5,0x20
    80006264:	00fd8db3          	add	s11,s11,a5
    80006268:	000dc703          	lbu	a4,0(s11)
    8000626c:	00a00793          	li	a5,10
    80006270:	00900c93          	li	s9,9
    80006274:	f8e404a3          	sb	a4,-119(s0)
    80006278:	00065c63          	bgez	a2,80006290 <__printf+0x278>
    8000627c:	f9040713          	addi	a4,s0,-112
    80006280:	00f70733          	add	a4,a4,a5
    80006284:	02d00693          	li	a3,45
    80006288:	fed70823          	sb	a3,-16(a4)
    8000628c:	00078c93          	mv	s9,a5
    80006290:	f8040793          	addi	a5,s0,-128
    80006294:	01978cb3          	add	s9,a5,s9
    80006298:	f7f40d13          	addi	s10,s0,-129
    8000629c:	000cc503          	lbu	a0,0(s9)
    800062a0:	fffc8c93          	addi	s9,s9,-1
    800062a4:	00000097          	auipc	ra,0x0
    800062a8:	b90080e7          	jalr	-1136(ra) # 80005e34 <consputc>
    800062ac:	ffac98e3          	bne	s9,s10,8000629c <__printf+0x284>
    800062b0:	00094503          	lbu	a0,0(s2)
    800062b4:	e00514e3          	bnez	a0,800060bc <__printf+0xa4>
    800062b8:	1a0c1663          	bnez	s8,80006464 <__printf+0x44c>
    800062bc:	08813083          	ld	ra,136(sp)
    800062c0:	08013403          	ld	s0,128(sp)
    800062c4:	07813483          	ld	s1,120(sp)
    800062c8:	07013903          	ld	s2,112(sp)
    800062cc:	06813983          	ld	s3,104(sp)
    800062d0:	06013a03          	ld	s4,96(sp)
    800062d4:	05813a83          	ld	s5,88(sp)
    800062d8:	05013b03          	ld	s6,80(sp)
    800062dc:	04813b83          	ld	s7,72(sp)
    800062e0:	04013c03          	ld	s8,64(sp)
    800062e4:	03813c83          	ld	s9,56(sp)
    800062e8:	03013d03          	ld	s10,48(sp)
    800062ec:	02813d83          	ld	s11,40(sp)
    800062f0:	0d010113          	addi	sp,sp,208
    800062f4:	00008067          	ret
    800062f8:	07300713          	li	a4,115
    800062fc:	1ce78a63          	beq	a5,a4,800064d0 <__printf+0x4b8>
    80006300:	07800713          	li	a4,120
    80006304:	1ee79e63          	bne	a5,a4,80006500 <__printf+0x4e8>
    80006308:	f7843783          	ld	a5,-136(s0)
    8000630c:	0007a703          	lw	a4,0(a5)
    80006310:	00878793          	addi	a5,a5,8
    80006314:	f6f43c23          	sd	a5,-136(s0)
    80006318:	28074263          	bltz	a4,8000659c <__printf+0x584>
    8000631c:	00002d97          	auipc	s11,0x2
    80006320:	31cd8d93          	addi	s11,s11,796 # 80008638 <digits>
    80006324:	00f77793          	andi	a5,a4,15
    80006328:	00fd87b3          	add	a5,s11,a5
    8000632c:	0007c683          	lbu	a3,0(a5)
    80006330:	00f00613          	li	a2,15
    80006334:	0007079b          	sext.w	a5,a4
    80006338:	f8d40023          	sb	a3,-128(s0)
    8000633c:	0047559b          	srliw	a1,a4,0x4
    80006340:	0047569b          	srliw	a3,a4,0x4
    80006344:	00000c93          	li	s9,0
    80006348:	0ee65063          	bge	a2,a4,80006428 <__printf+0x410>
    8000634c:	00f6f693          	andi	a3,a3,15
    80006350:	00dd86b3          	add	a3,s11,a3
    80006354:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80006358:	0087d79b          	srliw	a5,a5,0x8
    8000635c:	00100c93          	li	s9,1
    80006360:	f8d400a3          	sb	a3,-127(s0)
    80006364:	0cb67263          	bgeu	a2,a1,80006428 <__printf+0x410>
    80006368:	00f7f693          	andi	a3,a5,15
    8000636c:	00dd86b3          	add	a3,s11,a3
    80006370:	0006c583          	lbu	a1,0(a3)
    80006374:	00f00613          	li	a2,15
    80006378:	0047d69b          	srliw	a3,a5,0x4
    8000637c:	f8b40123          	sb	a1,-126(s0)
    80006380:	0047d593          	srli	a1,a5,0x4
    80006384:	28f67e63          	bgeu	a2,a5,80006620 <__printf+0x608>
    80006388:	00f6f693          	andi	a3,a3,15
    8000638c:	00dd86b3          	add	a3,s11,a3
    80006390:	0006c503          	lbu	a0,0(a3)
    80006394:	0087d813          	srli	a6,a5,0x8
    80006398:	0087d69b          	srliw	a3,a5,0x8
    8000639c:	f8a401a3          	sb	a0,-125(s0)
    800063a0:	28b67663          	bgeu	a2,a1,8000662c <__printf+0x614>
    800063a4:	00f6f693          	andi	a3,a3,15
    800063a8:	00dd86b3          	add	a3,s11,a3
    800063ac:	0006c583          	lbu	a1,0(a3)
    800063b0:	00c7d513          	srli	a0,a5,0xc
    800063b4:	00c7d69b          	srliw	a3,a5,0xc
    800063b8:	f8b40223          	sb	a1,-124(s0)
    800063bc:	29067a63          	bgeu	a2,a6,80006650 <__printf+0x638>
    800063c0:	00f6f693          	andi	a3,a3,15
    800063c4:	00dd86b3          	add	a3,s11,a3
    800063c8:	0006c583          	lbu	a1,0(a3)
    800063cc:	0107d813          	srli	a6,a5,0x10
    800063d0:	0107d69b          	srliw	a3,a5,0x10
    800063d4:	f8b402a3          	sb	a1,-123(s0)
    800063d8:	28a67263          	bgeu	a2,a0,8000665c <__printf+0x644>
    800063dc:	00f6f693          	andi	a3,a3,15
    800063e0:	00dd86b3          	add	a3,s11,a3
    800063e4:	0006c683          	lbu	a3,0(a3)
    800063e8:	0147d79b          	srliw	a5,a5,0x14
    800063ec:	f8d40323          	sb	a3,-122(s0)
    800063f0:	21067663          	bgeu	a2,a6,800065fc <__printf+0x5e4>
    800063f4:	02079793          	slli	a5,a5,0x20
    800063f8:	0207d793          	srli	a5,a5,0x20
    800063fc:	00fd8db3          	add	s11,s11,a5
    80006400:	000dc683          	lbu	a3,0(s11)
    80006404:	00800793          	li	a5,8
    80006408:	00700c93          	li	s9,7
    8000640c:	f8d403a3          	sb	a3,-121(s0)
    80006410:	00075c63          	bgez	a4,80006428 <__printf+0x410>
    80006414:	f9040713          	addi	a4,s0,-112
    80006418:	00f70733          	add	a4,a4,a5
    8000641c:	02d00693          	li	a3,45
    80006420:	fed70823          	sb	a3,-16(a4)
    80006424:	00078c93          	mv	s9,a5
    80006428:	f8040793          	addi	a5,s0,-128
    8000642c:	01978cb3          	add	s9,a5,s9
    80006430:	f7f40d13          	addi	s10,s0,-129
    80006434:	000cc503          	lbu	a0,0(s9)
    80006438:	fffc8c93          	addi	s9,s9,-1
    8000643c:	00000097          	auipc	ra,0x0
    80006440:	9f8080e7          	jalr	-1544(ra) # 80005e34 <consputc>
    80006444:	ff9d18e3          	bne	s10,s9,80006434 <__printf+0x41c>
    80006448:	0100006f          	j	80006458 <__printf+0x440>
    8000644c:	00000097          	auipc	ra,0x0
    80006450:	9e8080e7          	jalr	-1560(ra) # 80005e34 <consputc>
    80006454:	000c8493          	mv	s1,s9
    80006458:	00094503          	lbu	a0,0(s2)
    8000645c:	c60510e3          	bnez	a0,800060bc <__printf+0xa4>
    80006460:	e40c0ee3          	beqz	s8,800062bc <__printf+0x2a4>
    80006464:	00005517          	auipc	a0,0x5
    80006468:	d4c50513          	addi	a0,a0,-692 # 8000b1b0 <pr>
    8000646c:	00001097          	auipc	ra,0x1
    80006470:	94c080e7          	jalr	-1716(ra) # 80006db8 <release>
    80006474:	e49ff06f          	j	800062bc <__printf+0x2a4>
    80006478:	f7843783          	ld	a5,-136(s0)
    8000647c:	03000513          	li	a0,48
    80006480:	01000d13          	li	s10,16
    80006484:	00878713          	addi	a4,a5,8
    80006488:	0007bc83          	ld	s9,0(a5)
    8000648c:	f6e43c23          	sd	a4,-136(s0)
    80006490:	00000097          	auipc	ra,0x0
    80006494:	9a4080e7          	jalr	-1628(ra) # 80005e34 <consputc>
    80006498:	07800513          	li	a0,120
    8000649c:	00000097          	auipc	ra,0x0
    800064a0:	998080e7          	jalr	-1640(ra) # 80005e34 <consputc>
    800064a4:	00002d97          	auipc	s11,0x2
    800064a8:	194d8d93          	addi	s11,s11,404 # 80008638 <digits>
    800064ac:	03ccd793          	srli	a5,s9,0x3c
    800064b0:	00fd87b3          	add	a5,s11,a5
    800064b4:	0007c503          	lbu	a0,0(a5)
    800064b8:	fffd0d1b          	addiw	s10,s10,-1
    800064bc:	004c9c93          	slli	s9,s9,0x4
    800064c0:	00000097          	auipc	ra,0x0
    800064c4:	974080e7          	jalr	-1676(ra) # 80005e34 <consputc>
    800064c8:	fe0d12e3          	bnez	s10,800064ac <__printf+0x494>
    800064cc:	f8dff06f          	j	80006458 <__printf+0x440>
    800064d0:	f7843783          	ld	a5,-136(s0)
    800064d4:	0007bc83          	ld	s9,0(a5)
    800064d8:	00878793          	addi	a5,a5,8
    800064dc:	f6f43c23          	sd	a5,-136(s0)
    800064e0:	000c9a63          	bnez	s9,800064f4 <__printf+0x4dc>
    800064e4:	1080006f          	j	800065ec <__printf+0x5d4>
    800064e8:	001c8c93          	addi	s9,s9,1
    800064ec:	00000097          	auipc	ra,0x0
    800064f0:	948080e7          	jalr	-1720(ra) # 80005e34 <consputc>
    800064f4:	000cc503          	lbu	a0,0(s9)
    800064f8:	fe0518e3          	bnez	a0,800064e8 <__printf+0x4d0>
    800064fc:	f5dff06f          	j	80006458 <__printf+0x440>
    80006500:	02500513          	li	a0,37
    80006504:	00000097          	auipc	ra,0x0
    80006508:	930080e7          	jalr	-1744(ra) # 80005e34 <consputc>
    8000650c:	000c8513          	mv	a0,s9
    80006510:	00000097          	auipc	ra,0x0
    80006514:	924080e7          	jalr	-1756(ra) # 80005e34 <consputc>
    80006518:	f41ff06f          	j	80006458 <__printf+0x440>
    8000651c:	02500513          	li	a0,37
    80006520:	00000097          	auipc	ra,0x0
    80006524:	914080e7          	jalr	-1772(ra) # 80005e34 <consputc>
    80006528:	f31ff06f          	j	80006458 <__printf+0x440>
    8000652c:	00030513          	mv	a0,t1
    80006530:	00000097          	auipc	ra,0x0
    80006534:	7bc080e7          	jalr	1980(ra) # 80006cec <acquire>
    80006538:	b4dff06f          	j	80006084 <__printf+0x6c>
    8000653c:	40c0053b          	negw	a0,a2
    80006540:	00a00713          	li	a4,10
    80006544:	02e576bb          	remuw	a3,a0,a4
    80006548:	00002d97          	auipc	s11,0x2
    8000654c:	0f0d8d93          	addi	s11,s11,240 # 80008638 <digits>
    80006550:	ff700593          	li	a1,-9
    80006554:	02069693          	slli	a3,a3,0x20
    80006558:	0206d693          	srli	a3,a3,0x20
    8000655c:	00dd86b3          	add	a3,s11,a3
    80006560:	0006c683          	lbu	a3,0(a3)
    80006564:	02e557bb          	divuw	a5,a0,a4
    80006568:	f8d40023          	sb	a3,-128(s0)
    8000656c:	10b65e63          	bge	a2,a1,80006688 <__printf+0x670>
    80006570:	06300593          	li	a1,99
    80006574:	02e7f6bb          	remuw	a3,a5,a4
    80006578:	02069693          	slli	a3,a3,0x20
    8000657c:	0206d693          	srli	a3,a3,0x20
    80006580:	00dd86b3          	add	a3,s11,a3
    80006584:	0006c683          	lbu	a3,0(a3)
    80006588:	02e7d73b          	divuw	a4,a5,a4
    8000658c:	00200793          	li	a5,2
    80006590:	f8d400a3          	sb	a3,-127(s0)
    80006594:	bca5ece3          	bltu	a1,a0,8000616c <__printf+0x154>
    80006598:	ce5ff06f          	j	8000627c <__printf+0x264>
    8000659c:	40e007bb          	negw	a5,a4
    800065a0:	00002d97          	auipc	s11,0x2
    800065a4:	098d8d93          	addi	s11,s11,152 # 80008638 <digits>
    800065a8:	00f7f693          	andi	a3,a5,15
    800065ac:	00dd86b3          	add	a3,s11,a3
    800065b0:	0006c583          	lbu	a1,0(a3)
    800065b4:	ff100613          	li	a2,-15
    800065b8:	0047d69b          	srliw	a3,a5,0x4
    800065bc:	f8b40023          	sb	a1,-128(s0)
    800065c0:	0047d59b          	srliw	a1,a5,0x4
    800065c4:	0ac75e63          	bge	a4,a2,80006680 <__printf+0x668>
    800065c8:	00f6f693          	andi	a3,a3,15
    800065cc:	00dd86b3          	add	a3,s11,a3
    800065d0:	0006c603          	lbu	a2,0(a3)
    800065d4:	00f00693          	li	a3,15
    800065d8:	0087d79b          	srliw	a5,a5,0x8
    800065dc:	f8c400a3          	sb	a2,-127(s0)
    800065e0:	d8b6e4e3          	bltu	a3,a1,80006368 <__printf+0x350>
    800065e4:	00200793          	li	a5,2
    800065e8:	e2dff06f          	j	80006414 <__printf+0x3fc>
    800065ec:	00002c97          	auipc	s9,0x2
    800065f0:	02cc8c93          	addi	s9,s9,44 # 80008618 <_ZL6digits+0x150>
    800065f4:	02800513          	li	a0,40
    800065f8:	ef1ff06f          	j	800064e8 <__printf+0x4d0>
    800065fc:	00700793          	li	a5,7
    80006600:	00600c93          	li	s9,6
    80006604:	e0dff06f          	j	80006410 <__printf+0x3f8>
    80006608:	00700793          	li	a5,7
    8000660c:	00600c93          	li	s9,6
    80006610:	c69ff06f          	j	80006278 <__printf+0x260>
    80006614:	00300793          	li	a5,3
    80006618:	00200c93          	li	s9,2
    8000661c:	c5dff06f          	j	80006278 <__printf+0x260>
    80006620:	00300793          	li	a5,3
    80006624:	00200c93          	li	s9,2
    80006628:	de9ff06f          	j	80006410 <__printf+0x3f8>
    8000662c:	00400793          	li	a5,4
    80006630:	00300c93          	li	s9,3
    80006634:	dddff06f          	j	80006410 <__printf+0x3f8>
    80006638:	00400793          	li	a5,4
    8000663c:	00300c93          	li	s9,3
    80006640:	c39ff06f          	j	80006278 <__printf+0x260>
    80006644:	00500793          	li	a5,5
    80006648:	00400c93          	li	s9,4
    8000664c:	c2dff06f          	j	80006278 <__printf+0x260>
    80006650:	00500793          	li	a5,5
    80006654:	00400c93          	li	s9,4
    80006658:	db9ff06f          	j	80006410 <__printf+0x3f8>
    8000665c:	00600793          	li	a5,6
    80006660:	00500c93          	li	s9,5
    80006664:	dadff06f          	j	80006410 <__printf+0x3f8>
    80006668:	00600793          	li	a5,6
    8000666c:	00500c93          	li	s9,5
    80006670:	c09ff06f          	j	80006278 <__printf+0x260>
    80006674:	00800793          	li	a5,8
    80006678:	00700c93          	li	s9,7
    8000667c:	bfdff06f          	j	80006278 <__printf+0x260>
    80006680:	00100793          	li	a5,1
    80006684:	d91ff06f          	j	80006414 <__printf+0x3fc>
    80006688:	00100793          	li	a5,1
    8000668c:	bf1ff06f          	j	8000627c <__printf+0x264>
    80006690:	00900793          	li	a5,9
    80006694:	00800c93          	li	s9,8
    80006698:	be1ff06f          	j	80006278 <__printf+0x260>
    8000669c:	00002517          	auipc	a0,0x2
    800066a0:	f8450513          	addi	a0,a0,-124 # 80008620 <_ZL6digits+0x158>
    800066a4:	00000097          	auipc	ra,0x0
    800066a8:	918080e7          	jalr	-1768(ra) # 80005fbc <panic>

00000000800066ac <printfinit>:
    800066ac:	fe010113          	addi	sp,sp,-32
    800066b0:	00813823          	sd	s0,16(sp)
    800066b4:	00913423          	sd	s1,8(sp)
    800066b8:	00113c23          	sd	ra,24(sp)
    800066bc:	02010413          	addi	s0,sp,32
    800066c0:	00005497          	auipc	s1,0x5
    800066c4:	af048493          	addi	s1,s1,-1296 # 8000b1b0 <pr>
    800066c8:	00048513          	mv	a0,s1
    800066cc:	00002597          	auipc	a1,0x2
    800066d0:	f6458593          	addi	a1,a1,-156 # 80008630 <_ZL6digits+0x168>
    800066d4:	00000097          	auipc	ra,0x0
    800066d8:	5f4080e7          	jalr	1524(ra) # 80006cc8 <initlock>
    800066dc:	01813083          	ld	ra,24(sp)
    800066e0:	01013403          	ld	s0,16(sp)
    800066e4:	0004ac23          	sw	zero,24(s1)
    800066e8:	00813483          	ld	s1,8(sp)
    800066ec:	02010113          	addi	sp,sp,32
    800066f0:	00008067          	ret

00000000800066f4 <uartinit>:
    800066f4:	ff010113          	addi	sp,sp,-16
    800066f8:	00813423          	sd	s0,8(sp)
    800066fc:	01010413          	addi	s0,sp,16
    80006700:	100007b7          	lui	a5,0x10000
    80006704:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80006708:	f8000713          	li	a4,-128
    8000670c:	00e781a3          	sb	a4,3(a5)
    80006710:	00300713          	li	a4,3
    80006714:	00e78023          	sb	a4,0(a5)
    80006718:	000780a3          	sb	zero,1(a5)
    8000671c:	00e781a3          	sb	a4,3(a5)
    80006720:	00700693          	li	a3,7
    80006724:	00d78123          	sb	a3,2(a5)
    80006728:	00e780a3          	sb	a4,1(a5)
    8000672c:	00813403          	ld	s0,8(sp)
    80006730:	01010113          	addi	sp,sp,16
    80006734:	00008067          	ret

0000000080006738 <uartputc>:
    80006738:	00003797          	auipc	a5,0x3
    8000673c:	7d07a783          	lw	a5,2000(a5) # 80009f08 <panicked>
    80006740:	00078463          	beqz	a5,80006748 <uartputc+0x10>
    80006744:	0000006f          	j	80006744 <uartputc+0xc>
    80006748:	fd010113          	addi	sp,sp,-48
    8000674c:	02813023          	sd	s0,32(sp)
    80006750:	00913c23          	sd	s1,24(sp)
    80006754:	01213823          	sd	s2,16(sp)
    80006758:	01313423          	sd	s3,8(sp)
    8000675c:	02113423          	sd	ra,40(sp)
    80006760:	03010413          	addi	s0,sp,48
    80006764:	00003917          	auipc	s2,0x3
    80006768:	7ac90913          	addi	s2,s2,1964 # 80009f10 <uart_tx_r>
    8000676c:	00093783          	ld	a5,0(s2)
    80006770:	00003497          	auipc	s1,0x3
    80006774:	7a848493          	addi	s1,s1,1960 # 80009f18 <uart_tx_w>
    80006778:	0004b703          	ld	a4,0(s1)
    8000677c:	02078693          	addi	a3,a5,32
    80006780:	00050993          	mv	s3,a0
    80006784:	02e69c63          	bne	a3,a4,800067bc <uartputc+0x84>
    80006788:	00001097          	auipc	ra,0x1
    8000678c:	834080e7          	jalr	-1996(ra) # 80006fbc <push_on>
    80006790:	00093783          	ld	a5,0(s2)
    80006794:	0004b703          	ld	a4,0(s1)
    80006798:	02078793          	addi	a5,a5,32
    8000679c:	00e79463          	bne	a5,a4,800067a4 <uartputc+0x6c>
    800067a0:	0000006f          	j	800067a0 <uartputc+0x68>
    800067a4:	00001097          	auipc	ra,0x1
    800067a8:	88c080e7          	jalr	-1908(ra) # 80007030 <pop_on>
    800067ac:	00093783          	ld	a5,0(s2)
    800067b0:	0004b703          	ld	a4,0(s1)
    800067b4:	02078693          	addi	a3,a5,32
    800067b8:	fce688e3          	beq	a3,a4,80006788 <uartputc+0x50>
    800067bc:	01f77693          	andi	a3,a4,31
    800067c0:	00005597          	auipc	a1,0x5
    800067c4:	a1058593          	addi	a1,a1,-1520 # 8000b1d0 <uart_tx_buf>
    800067c8:	00d586b3          	add	a3,a1,a3
    800067cc:	00170713          	addi	a4,a4,1
    800067d0:	01368023          	sb	s3,0(a3)
    800067d4:	00e4b023          	sd	a4,0(s1)
    800067d8:	10000637          	lui	a2,0x10000
    800067dc:	02f71063          	bne	a4,a5,800067fc <uartputc+0xc4>
    800067e0:	0340006f          	j	80006814 <uartputc+0xdc>
    800067e4:	00074703          	lbu	a4,0(a4)
    800067e8:	00f93023          	sd	a5,0(s2)
    800067ec:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    800067f0:	00093783          	ld	a5,0(s2)
    800067f4:	0004b703          	ld	a4,0(s1)
    800067f8:	00f70e63          	beq	a4,a5,80006814 <uartputc+0xdc>
    800067fc:	00564683          	lbu	a3,5(a2)
    80006800:	01f7f713          	andi	a4,a5,31
    80006804:	00e58733          	add	a4,a1,a4
    80006808:	0206f693          	andi	a3,a3,32
    8000680c:	00178793          	addi	a5,a5,1
    80006810:	fc069ae3          	bnez	a3,800067e4 <uartputc+0xac>
    80006814:	02813083          	ld	ra,40(sp)
    80006818:	02013403          	ld	s0,32(sp)
    8000681c:	01813483          	ld	s1,24(sp)
    80006820:	01013903          	ld	s2,16(sp)
    80006824:	00813983          	ld	s3,8(sp)
    80006828:	03010113          	addi	sp,sp,48
    8000682c:	00008067          	ret

0000000080006830 <uartputc_sync>:
    80006830:	ff010113          	addi	sp,sp,-16
    80006834:	00813423          	sd	s0,8(sp)
    80006838:	01010413          	addi	s0,sp,16
    8000683c:	00003717          	auipc	a4,0x3
    80006840:	6cc72703          	lw	a4,1740(a4) # 80009f08 <panicked>
    80006844:	02071663          	bnez	a4,80006870 <uartputc_sync+0x40>
    80006848:	00050793          	mv	a5,a0
    8000684c:	100006b7          	lui	a3,0x10000
    80006850:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80006854:	02077713          	andi	a4,a4,32
    80006858:	fe070ce3          	beqz	a4,80006850 <uartputc_sync+0x20>
    8000685c:	0ff7f793          	andi	a5,a5,255
    80006860:	00f68023          	sb	a5,0(a3)
    80006864:	00813403          	ld	s0,8(sp)
    80006868:	01010113          	addi	sp,sp,16
    8000686c:	00008067          	ret
    80006870:	0000006f          	j	80006870 <uartputc_sync+0x40>

0000000080006874 <uartstart>:
    80006874:	ff010113          	addi	sp,sp,-16
    80006878:	00813423          	sd	s0,8(sp)
    8000687c:	01010413          	addi	s0,sp,16
    80006880:	00003617          	auipc	a2,0x3
    80006884:	69060613          	addi	a2,a2,1680 # 80009f10 <uart_tx_r>
    80006888:	00003517          	auipc	a0,0x3
    8000688c:	69050513          	addi	a0,a0,1680 # 80009f18 <uart_tx_w>
    80006890:	00063783          	ld	a5,0(a2)
    80006894:	00053703          	ld	a4,0(a0)
    80006898:	04f70263          	beq	a4,a5,800068dc <uartstart+0x68>
    8000689c:	100005b7          	lui	a1,0x10000
    800068a0:	00005817          	auipc	a6,0x5
    800068a4:	93080813          	addi	a6,a6,-1744 # 8000b1d0 <uart_tx_buf>
    800068a8:	01c0006f          	j	800068c4 <uartstart+0x50>
    800068ac:	0006c703          	lbu	a4,0(a3)
    800068b0:	00f63023          	sd	a5,0(a2)
    800068b4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800068b8:	00063783          	ld	a5,0(a2)
    800068bc:	00053703          	ld	a4,0(a0)
    800068c0:	00f70e63          	beq	a4,a5,800068dc <uartstart+0x68>
    800068c4:	01f7f713          	andi	a4,a5,31
    800068c8:	00e806b3          	add	a3,a6,a4
    800068cc:	0055c703          	lbu	a4,5(a1)
    800068d0:	00178793          	addi	a5,a5,1
    800068d4:	02077713          	andi	a4,a4,32
    800068d8:	fc071ae3          	bnez	a4,800068ac <uartstart+0x38>
    800068dc:	00813403          	ld	s0,8(sp)
    800068e0:	01010113          	addi	sp,sp,16
    800068e4:	00008067          	ret

00000000800068e8 <uartgetc>:
    800068e8:	ff010113          	addi	sp,sp,-16
    800068ec:	00813423          	sd	s0,8(sp)
    800068f0:	01010413          	addi	s0,sp,16
    800068f4:	10000737          	lui	a4,0x10000
    800068f8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    800068fc:	0017f793          	andi	a5,a5,1
    80006900:	00078c63          	beqz	a5,80006918 <uartgetc+0x30>
    80006904:	00074503          	lbu	a0,0(a4)
    80006908:	0ff57513          	andi	a0,a0,255
    8000690c:	00813403          	ld	s0,8(sp)
    80006910:	01010113          	addi	sp,sp,16
    80006914:	00008067          	ret
    80006918:	fff00513          	li	a0,-1
    8000691c:	ff1ff06f          	j	8000690c <uartgetc+0x24>

0000000080006920 <uartintr>:
    80006920:	100007b7          	lui	a5,0x10000
    80006924:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80006928:	0017f793          	andi	a5,a5,1
    8000692c:	0a078463          	beqz	a5,800069d4 <uartintr+0xb4>
    80006930:	fe010113          	addi	sp,sp,-32
    80006934:	00813823          	sd	s0,16(sp)
    80006938:	00913423          	sd	s1,8(sp)
    8000693c:	00113c23          	sd	ra,24(sp)
    80006940:	02010413          	addi	s0,sp,32
    80006944:	100004b7          	lui	s1,0x10000
    80006948:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000694c:	0ff57513          	andi	a0,a0,255
    80006950:	fffff097          	auipc	ra,0xfffff
    80006954:	534080e7          	jalr	1332(ra) # 80005e84 <consoleintr>
    80006958:	0054c783          	lbu	a5,5(s1)
    8000695c:	0017f793          	andi	a5,a5,1
    80006960:	fe0794e3          	bnez	a5,80006948 <uartintr+0x28>
    80006964:	00003617          	auipc	a2,0x3
    80006968:	5ac60613          	addi	a2,a2,1452 # 80009f10 <uart_tx_r>
    8000696c:	00003517          	auipc	a0,0x3
    80006970:	5ac50513          	addi	a0,a0,1452 # 80009f18 <uart_tx_w>
    80006974:	00063783          	ld	a5,0(a2)
    80006978:	00053703          	ld	a4,0(a0)
    8000697c:	04f70263          	beq	a4,a5,800069c0 <uartintr+0xa0>
    80006980:	100005b7          	lui	a1,0x10000
    80006984:	00005817          	auipc	a6,0x5
    80006988:	84c80813          	addi	a6,a6,-1972 # 8000b1d0 <uart_tx_buf>
    8000698c:	01c0006f          	j	800069a8 <uartintr+0x88>
    80006990:	0006c703          	lbu	a4,0(a3)
    80006994:	00f63023          	sd	a5,0(a2)
    80006998:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000699c:	00063783          	ld	a5,0(a2)
    800069a0:	00053703          	ld	a4,0(a0)
    800069a4:	00f70e63          	beq	a4,a5,800069c0 <uartintr+0xa0>
    800069a8:	01f7f713          	andi	a4,a5,31
    800069ac:	00e806b3          	add	a3,a6,a4
    800069b0:	0055c703          	lbu	a4,5(a1)
    800069b4:	00178793          	addi	a5,a5,1
    800069b8:	02077713          	andi	a4,a4,32
    800069bc:	fc071ae3          	bnez	a4,80006990 <uartintr+0x70>
    800069c0:	01813083          	ld	ra,24(sp)
    800069c4:	01013403          	ld	s0,16(sp)
    800069c8:	00813483          	ld	s1,8(sp)
    800069cc:	02010113          	addi	sp,sp,32
    800069d0:	00008067          	ret
    800069d4:	00003617          	auipc	a2,0x3
    800069d8:	53c60613          	addi	a2,a2,1340 # 80009f10 <uart_tx_r>
    800069dc:	00003517          	auipc	a0,0x3
    800069e0:	53c50513          	addi	a0,a0,1340 # 80009f18 <uart_tx_w>
    800069e4:	00063783          	ld	a5,0(a2)
    800069e8:	00053703          	ld	a4,0(a0)
    800069ec:	04f70263          	beq	a4,a5,80006a30 <uartintr+0x110>
    800069f0:	100005b7          	lui	a1,0x10000
    800069f4:	00004817          	auipc	a6,0x4
    800069f8:	7dc80813          	addi	a6,a6,2012 # 8000b1d0 <uart_tx_buf>
    800069fc:	01c0006f          	j	80006a18 <uartintr+0xf8>
    80006a00:	0006c703          	lbu	a4,0(a3)
    80006a04:	00f63023          	sd	a5,0(a2)
    80006a08:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80006a0c:	00063783          	ld	a5,0(a2)
    80006a10:	00053703          	ld	a4,0(a0)
    80006a14:	02f70063          	beq	a4,a5,80006a34 <uartintr+0x114>
    80006a18:	01f7f713          	andi	a4,a5,31
    80006a1c:	00e806b3          	add	a3,a6,a4
    80006a20:	0055c703          	lbu	a4,5(a1)
    80006a24:	00178793          	addi	a5,a5,1
    80006a28:	02077713          	andi	a4,a4,32
    80006a2c:	fc071ae3          	bnez	a4,80006a00 <uartintr+0xe0>
    80006a30:	00008067          	ret
    80006a34:	00008067          	ret

0000000080006a38 <kinit>:
    80006a38:	fc010113          	addi	sp,sp,-64
    80006a3c:	02913423          	sd	s1,40(sp)
    80006a40:	fffff7b7          	lui	a5,0xfffff
    80006a44:	00005497          	auipc	s1,0x5
    80006a48:	7ab48493          	addi	s1,s1,1963 # 8000c1ef <end+0xfff>
    80006a4c:	02813823          	sd	s0,48(sp)
    80006a50:	01313c23          	sd	s3,24(sp)
    80006a54:	00f4f4b3          	and	s1,s1,a5
    80006a58:	02113c23          	sd	ra,56(sp)
    80006a5c:	03213023          	sd	s2,32(sp)
    80006a60:	01413823          	sd	s4,16(sp)
    80006a64:	01513423          	sd	s5,8(sp)
    80006a68:	04010413          	addi	s0,sp,64
    80006a6c:	000017b7          	lui	a5,0x1
    80006a70:	01100993          	li	s3,17
    80006a74:	00f487b3          	add	a5,s1,a5
    80006a78:	01b99993          	slli	s3,s3,0x1b
    80006a7c:	06f9e063          	bltu	s3,a5,80006adc <kinit+0xa4>
    80006a80:	00004a97          	auipc	s5,0x4
    80006a84:	770a8a93          	addi	s5,s5,1904 # 8000b1f0 <end>
    80006a88:	0754ec63          	bltu	s1,s5,80006b00 <kinit+0xc8>
    80006a8c:	0734fa63          	bgeu	s1,s3,80006b00 <kinit+0xc8>
    80006a90:	00088a37          	lui	s4,0x88
    80006a94:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80006a98:	00003917          	auipc	s2,0x3
    80006a9c:	48890913          	addi	s2,s2,1160 # 80009f20 <kmem>
    80006aa0:	00ca1a13          	slli	s4,s4,0xc
    80006aa4:	0140006f          	j	80006ab8 <kinit+0x80>
    80006aa8:	000017b7          	lui	a5,0x1
    80006aac:	00f484b3          	add	s1,s1,a5
    80006ab0:	0554e863          	bltu	s1,s5,80006b00 <kinit+0xc8>
    80006ab4:	0534f663          	bgeu	s1,s3,80006b00 <kinit+0xc8>
    80006ab8:	00001637          	lui	a2,0x1
    80006abc:	00100593          	li	a1,1
    80006ac0:	00048513          	mv	a0,s1
    80006ac4:	00000097          	auipc	ra,0x0
    80006ac8:	5e4080e7          	jalr	1508(ra) # 800070a8 <__memset>
    80006acc:	00093783          	ld	a5,0(s2)
    80006ad0:	00f4b023          	sd	a5,0(s1)
    80006ad4:	00993023          	sd	s1,0(s2)
    80006ad8:	fd4498e3          	bne	s1,s4,80006aa8 <kinit+0x70>
    80006adc:	03813083          	ld	ra,56(sp)
    80006ae0:	03013403          	ld	s0,48(sp)
    80006ae4:	02813483          	ld	s1,40(sp)
    80006ae8:	02013903          	ld	s2,32(sp)
    80006aec:	01813983          	ld	s3,24(sp)
    80006af0:	01013a03          	ld	s4,16(sp)
    80006af4:	00813a83          	ld	s5,8(sp)
    80006af8:	04010113          	addi	sp,sp,64
    80006afc:	00008067          	ret
    80006b00:	00002517          	auipc	a0,0x2
    80006b04:	b5050513          	addi	a0,a0,-1200 # 80008650 <digits+0x18>
    80006b08:	fffff097          	auipc	ra,0xfffff
    80006b0c:	4b4080e7          	jalr	1204(ra) # 80005fbc <panic>

0000000080006b10 <freerange>:
    80006b10:	fc010113          	addi	sp,sp,-64
    80006b14:	000017b7          	lui	a5,0x1
    80006b18:	02913423          	sd	s1,40(sp)
    80006b1c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80006b20:	009504b3          	add	s1,a0,s1
    80006b24:	fffff537          	lui	a0,0xfffff
    80006b28:	02813823          	sd	s0,48(sp)
    80006b2c:	02113c23          	sd	ra,56(sp)
    80006b30:	03213023          	sd	s2,32(sp)
    80006b34:	01313c23          	sd	s3,24(sp)
    80006b38:	01413823          	sd	s4,16(sp)
    80006b3c:	01513423          	sd	s5,8(sp)
    80006b40:	01613023          	sd	s6,0(sp)
    80006b44:	04010413          	addi	s0,sp,64
    80006b48:	00a4f4b3          	and	s1,s1,a0
    80006b4c:	00f487b3          	add	a5,s1,a5
    80006b50:	06f5e463          	bltu	a1,a5,80006bb8 <freerange+0xa8>
    80006b54:	00004a97          	auipc	s5,0x4
    80006b58:	69ca8a93          	addi	s5,s5,1692 # 8000b1f0 <end>
    80006b5c:	0954e263          	bltu	s1,s5,80006be0 <freerange+0xd0>
    80006b60:	01100993          	li	s3,17
    80006b64:	01b99993          	slli	s3,s3,0x1b
    80006b68:	0734fc63          	bgeu	s1,s3,80006be0 <freerange+0xd0>
    80006b6c:	00058a13          	mv	s4,a1
    80006b70:	00003917          	auipc	s2,0x3
    80006b74:	3b090913          	addi	s2,s2,944 # 80009f20 <kmem>
    80006b78:	00002b37          	lui	s6,0x2
    80006b7c:	0140006f          	j	80006b90 <freerange+0x80>
    80006b80:	000017b7          	lui	a5,0x1
    80006b84:	00f484b3          	add	s1,s1,a5
    80006b88:	0554ec63          	bltu	s1,s5,80006be0 <freerange+0xd0>
    80006b8c:	0534fa63          	bgeu	s1,s3,80006be0 <freerange+0xd0>
    80006b90:	00001637          	lui	a2,0x1
    80006b94:	00100593          	li	a1,1
    80006b98:	00048513          	mv	a0,s1
    80006b9c:	00000097          	auipc	ra,0x0
    80006ba0:	50c080e7          	jalr	1292(ra) # 800070a8 <__memset>
    80006ba4:	00093703          	ld	a4,0(s2)
    80006ba8:	016487b3          	add	a5,s1,s6
    80006bac:	00e4b023          	sd	a4,0(s1)
    80006bb0:	00993023          	sd	s1,0(s2)
    80006bb4:	fcfa76e3          	bgeu	s4,a5,80006b80 <freerange+0x70>
    80006bb8:	03813083          	ld	ra,56(sp)
    80006bbc:	03013403          	ld	s0,48(sp)
    80006bc0:	02813483          	ld	s1,40(sp)
    80006bc4:	02013903          	ld	s2,32(sp)
    80006bc8:	01813983          	ld	s3,24(sp)
    80006bcc:	01013a03          	ld	s4,16(sp)
    80006bd0:	00813a83          	ld	s5,8(sp)
    80006bd4:	00013b03          	ld	s6,0(sp)
    80006bd8:	04010113          	addi	sp,sp,64
    80006bdc:	00008067          	ret
    80006be0:	00002517          	auipc	a0,0x2
    80006be4:	a7050513          	addi	a0,a0,-1424 # 80008650 <digits+0x18>
    80006be8:	fffff097          	auipc	ra,0xfffff
    80006bec:	3d4080e7          	jalr	980(ra) # 80005fbc <panic>

0000000080006bf0 <kfree>:
    80006bf0:	fe010113          	addi	sp,sp,-32
    80006bf4:	00813823          	sd	s0,16(sp)
    80006bf8:	00113c23          	sd	ra,24(sp)
    80006bfc:	00913423          	sd	s1,8(sp)
    80006c00:	02010413          	addi	s0,sp,32
    80006c04:	03451793          	slli	a5,a0,0x34
    80006c08:	04079c63          	bnez	a5,80006c60 <kfree+0x70>
    80006c0c:	00004797          	auipc	a5,0x4
    80006c10:	5e478793          	addi	a5,a5,1508 # 8000b1f0 <end>
    80006c14:	00050493          	mv	s1,a0
    80006c18:	04f56463          	bltu	a0,a5,80006c60 <kfree+0x70>
    80006c1c:	01100793          	li	a5,17
    80006c20:	01b79793          	slli	a5,a5,0x1b
    80006c24:	02f57e63          	bgeu	a0,a5,80006c60 <kfree+0x70>
    80006c28:	00001637          	lui	a2,0x1
    80006c2c:	00100593          	li	a1,1
    80006c30:	00000097          	auipc	ra,0x0
    80006c34:	478080e7          	jalr	1144(ra) # 800070a8 <__memset>
    80006c38:	00003797          	auipc	a5,0x3
    80006c3c:	2e878793          	addi	a5,a5,744 # 80009f20 <kmem>
    80006c40:	0007b703          	ld	a4,0(a5)
    80006c44:	01813083          	ld	ra,24(sp)
    80006c48:	01013403          	ld	s0,16(sp)
    80006c4c:	00e4b023          	sd	a4,0(s1)
    80006c50:	0097b023          	sd	s1,0(a5)
    80006c54:	00813483          	ld	s1,8(sp)
    80006c58:	02010113          	addi	sp,sp,32
    80006c5c:	00008067          	ret
    80006c60:	00002517          	auipc	a0,0x2
    80006c64:	9f050513          	addi	a0,a0,-1552 # 80008650 <digits+0x18>
    80006c68:	fffff097          	auipc	ra,0xfffff
    80006c6c:	354080e7          	jalr	852(ra) # 80005fbc <panic>

0000000080006c70 <kalloc>:
    80006c70:	fe010113          	addi	sp,sp,-32
    80006c74:	00813823          	sd	s0,16(sp)
    80006c78:	00913423          	sd	s1,8(sp)
    80006c7c:	00113c23          	sd	ra,24(sp)
    80006c80:	02010413          	addi	s0,sp,32
    80006c84:	00003797          	auipc	a5,0x3
    80006c88:	29c78793          	addi	a5,a5,668 # 80009f20 <kmem>
    80006c8c:	0007b483          	ld	s1,0(a5)
    80006c90:	02048063          	beqz	s1,80006cb0 <kalloc+0x40>
    80006c94:	0004b703          	ld	a4,0(s1)
    80006c98:	00001637          	lui	a2,0x1
    80006c9c:	00500593          	li	a1,5
    80006ca0:	00048513          	mv	a0,s1
    80006ca4:	00e7b023          	sd	a4,0(a5)
    80006ca8:	00000097          	auipc	ra,0x0
    80006cac:	400080e7          	jalr	1024(ra) # 800070a8 <__memset>
    80006cb0:	01813083          	ld	ra,24(sp)
    80006cb4:	01013403          	ld	s0,16(sp)
    80006cb8:	00048513          	mv	a0,s1
    80006cbc:	00813483          	ld	s1,8(sp)
    80006cc0:	02010113          	addi	sp,sp,32
    80006cc4:	00008067          	ret

0000000080006cc8 <initlock>:
    80006cc8:	ff010113          	addi	sp,sp,-16
    80006ccc:	00813423          	sd	s0,8(sp)
    80006cd0:	01010413          	addi	s0,sp,16
    80006cd4:	00813403          	ld	s0,8(sp)
    80006cd8:	00b53423          	sd	a1,8(a0)
    80006cdc:	00052023          	sw	zero,0(a0)
    80006ce0:	00053823          	sd	zero,16(a0)
    80006ce4:	01010113          	addi	sp,sp,16
    80006ce8:	00008067          	ret

0000000080006cec <acquire>:
    80006cec:	fe010113          	addi	sp,sp,-32
    80006cf0:	00813823          	sd	s0,16(sp)
    80006cf4:	00913423          	sd	s1,8(sp)
    80006cf8:	00113c23          	sd	ra,24(sp)
    80006cfc:	01213023          	sd	s2,0(sp)
    80006d00:	02010413          	addi	s0,sp,32
    80006d04:	00050493          	mv	s1,a0
    80006d08:	10002973          	csrr	s2,sstatus
    80006d0c:	100027f3          	csrr	a5,sstatus
    80006d10:	ffd7f793          	andi	a5,a5,-3
    80006d14:	10079073          	csrw	sstatus,a5
    80006d18:	fffff097          	auipc	ra,0xfffff
    80006d1c:	8e4080e7          	jalr	-1820(ra) # 800055fc <mycpu>
    80006d20:	07852783          	lw	a5,120(a0)
    80006d24:	06078e63          	beqz	a5,80006da0 <acquire+0xb4>
    80006d28:	fffff097          	auipc	ra,0xfffff
    80006d2c:	8d4080e7          	jalr	-1836(ra) # 800055fc <mycpu>
    80006d30:	07852783          	lw	a5,120(a0)
    80006d34:	0004a703          	lw	a4,0(s1)
    80006d38:	0017879b          	addiw	a5,a5,1
    80006d3c:	06f52c23          	sw	a5,120(a0)
    80006d40:	04071063          	bnez	a4,80006d80 <acquire+0x94>
    80006d44:	00100713          	li	a4,1
    80006d48:	00070793          	mv	a5,a4
    80006d4c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80006d50:	0007879b          	sext.w	a5,a5
    80006d54:	fe079ae3          	bnez	a5,80006d48 <acquire+0x5c>
    80006d58:	0ff0000f          	fence
    80006d5c:	fffff097          	auipc	ra,0xfffff
    80006d60:	8a0080e7          	jalr	-1888(ra) # 800055fc <mycpu>
    80006d64:	01813083          	ld	ra,24(sp)
    80006d68:	01013403          	ld	s0,16(sp)
    80006d6c:	00a4b823          	sd	a0,16(s1)
    80006d70:	00013903          	ld	s2,0(sp)
    80006d74:	00813483          	ld	s1,8(sp)
    80006d78:	02010113          	addi	sp,sp,32
    80006d7c:	00008067          	ret
    80006d80:	0104b903          	ld	s2,16(s1)
    80006d84:	fffff097          	auipc	ra,0xfffff
    80006d88:	878080e7          	jalr	-1928(ra) # 800055fc <mycpu>
    80006d8c:	faa91ce3          	bne	s2,a0,80006d44 <acquire+0x58>
    80006d90:	00002517          	auipc	a0,0x2
    80006d94:	8c850513          	addi	a0,a0,-1848 # 80008658 <digits+0x20>
    80006d98:	fffff097          	auipc	ra,0xfffff
    80006d9c:	224080e7          	jalr	548(ra) # 80005fbc <panic>
    80006da0:	00195913          	srli	s2,s2,0x1
    80006da4:	fffff097          	auipc	ra,0xfffff
    80006da8:	858080e7          	jalr	-1960(ra) # 800055fc <mycpu>
    80006dac:	00197913          	andi	s2,s2,1
    80006db0:	07252e23          	sw	s2,124(a0)
    80006db4:	f75ff06f          	j	80006d28 <acquire+0x3c>

0000000080006db8 <release>:
    80006db8:	fe010113          	addi	sp,sp,-32
    80006dbc:	00813823          	sd	s0,16(sp)
    80006dc0:	00113c23          	sd	ra,24(sp)
    80006dc4:	00913423          	sd	s1,8(sp)
    80006dc8:	01213023          	sd	s2,0(sp)
    80006dcc:	02010413          	addi	s0,sp,32
    80006dd0:	00052783          	lw	a5,0(a0)
    80006dd4:	00079a63          	bnez	a5,80006de8 <release+0x30>
    80006dd8:	00002517          	auipc	a0,0x2
    80006ddc:	88850513          	addi	a0,a0,-1912 # 80008660 <digits+0x28>
    80006de0:	fffff097          	auipc	ra,0xfffff
    80006de4:	1dc080e7          	jalr	476(ra) # 80005fbc <panic>
    80006de8:	01053903          	ld	s2,16(a0)
    80006dec:	00050493          	mv	s1,a0
    80006df0:	fffff097          	auipc	ra,0xfffff
    80006df4:	80c080e7          	jalr	-2036(ra) # 800055fc <mycpu>
    80006df8:	fea910e3          	bne	s2,a0,80006dd8 <release+0x20>
    80006dfc:	0004b823          	sd	zero,16(s1)
    80006e00:	0ff0000f          	fence
    80006e04:	0f50000f          	fence	iorw,ow
    80006e08:	0804a02f          	amoswap.w	zero,zero,(s1)
    80006e0c:	ffffe097          	auipc	ra,0xffffe
    80006e10:	7f0080e7          	jalr	2032(ra) # 800055fc <mycpu>
    80006e14:	100027f3          	csrr	a5,sstatus
    80006e18:	0027f793          	andi	a5,a5,2
    80006e1c:	04079a63          	bnez	a5,80006e70 <release+0xb8>
    80006e20:	07852783          	lw	a5,120(a0)
    80006e24:	02f05e63          	blez	a5,80006e60 <release+0xa8>
    80006e28:	fff7871b          	addiw	a4,a5,-1
    80006e2c:	06e52c23          	sw	a4,120(a0)
    80006e30:	00071c63          	bnez	a4,80006e48 <release+0x90>
    80006e34:	07c52783          	lw	a5,124(a0)
    80006e38:	00078863          	beqz	a5,80006e48 <release+0x90>
    80006e3c:	100027f3          	csrr	a5,sstatus
    80006e40:	0027e793          	ori	a5,a5,2
    80006e44:	10079073          	csrw	sstatus,a5
    80006e48:	01813083          	ld	ra,24(sp)
    80006e4c:	01013403          	ld	s0,16(sp)
    80006e50:	00813483          	ld	s1,8(sp)
    80006e54:	00013903          	ld	s2,0(sp)
    80006e58:	02010113          	addi	sp,sp,32
    80006e5c:	00008067          	ret
    80006e60:	00002517          	auipc	a0,0x2
    80006e64:	82050513          	addi	a0,a0,-2016 # 80008680 <digits+0x48>
    80006e68:	fffff097          	auipc	ra,0xfffff
    80006e6c:	154080e7          	jalr	340(ra) # 80005fbc <panic>
    80006e70:	00001517          	auipc	a0,0x1
    80006e74:	7f850513          	addi	a0,a0,2040 # 80008668 <digits+0x30>
    80006e78:	fffff097          	auipc	ra,0xfffff
    80006e7c:	144080e7          	jalr	324(ra) # 80005fbc <panic>

0000000080006e80 <holding>:
    80006e80:	00052783          	lw	a5,0(a0)
    80006e84:	00079663          	bnez	a5,80006e90 <holding+0x10>
    80006e88:	00000513          	li	a0,0
    80006e8c:	00008067          	ret
    80006e90:	fe010113          	addi	sp,sp,-32
    80006e94:	00813823          	sd	s0,16(sp)
    80006e98:	00913423          	sd	s1,8(sp)
    80006e9c:	00113c23          	sd	ra,24(sp)
    80006ea0:	02010413          	addi	s0,sp,32
    80006ea4:	01053483          	ld	s1,16(a0)
    80006ea8:	ffffe097          	auipc	ra,0xffffe
    80006eac:	754080e7          	jalr	1876(ra) # 800055fc <mycpu>
    80006eb0:	01813083          	ld	ra,24(sp)
    80006eb4:	01013403          	ld	s0,16(sp)
    80006eb8:	40a48533          	sub	a0,s1,a0
    80006ebc:	00153513          	seqz	a0,a0
    80006ec0:	00813483          	ld	s1,8(sp)
    80006ec4:	02010113          	addi	sp,sp,32
    80006ec8:	00008067          	ret

0000000080006ecc <push_off>:
    80006ecc:	fe010113          	addi	sp,sp,-32
    80006ed0:	00813823          	sd	s0,16(sp)
    80006ed4:	00113c23          	sd	ra,24(sp)
    80006ed8:	00913423          	sd	s1,8(sp)
    80006edc:	02010413          	addi	s0,sp,32
    80006ee0:	100024f3          	csrr	s1,sstatus
    80006ee4:	100027f3          	csrr	a5,sstatus
    80006ee8:	ffd7f793          	andi	a5,a5,-3
    80006eec:	10079073          	csrw	sstatus,a5
    80006ef0:	ffffe097          	auipc	ra,0xffffe
    80006ef4:	70c080e7          	jalr	1804(ra) # 800055fc <mycpu>
    80006ef8:	07852783          	lw	a5,120(a0)
    80006efc:	02078663          	beqz	a5,80006f28 <push_off+0x5c>
    80006f00:	ffffe097          	auipc	ra,0xffffe
    80006f04:	6fc080e7          	jalr	1788(ra) # 800055fc <mycpu>
    80006f08:	07852783          	lw	a5,120(a0)
    80006f0c:	01813083          	ld	ra,24(sp)
    80006f10:	01013403          	ld	s0,16(sp)
    80006f14:	0017879b          	addiw	a5,a5,1
    80006f18:	06f52c23          	sw	a5,120(a0)
    80006f1c:	00813483          	ld	s1,8(sp)
    80006f20:	02010113          	addi	sp,sp,32
    80006f24:	00008067          	ret
    80006f28:	0014d493          	srli	s1,s1,0x1
    80006f2c:	ffffe097          	auipc	ra,0xffffe
    80006f30:	6d0080e7          	jalr	1744(ra) # 800055fc <mycpu>
    80006f34:	0014f493          	andi	s1,s1,1
    80006f38:	06952e23          	sw	s1,124(a0)
    80006f3c:	fc5ff06f          	j	80006f00 <push_off+0x34>

0000000080006f40 <pop_off>:
    80006f40:	ff010113          	addi	sp,sp,-16
    80006f44:	00813023          	sd	s0,0(sp)
    80006f48:	00113423          	sd	ra,8(sp)
    80006f4c:	01010413          	addi	s0,sp,16
    80006f50:	ffffe097          	auipc	ra,0xffffe
    80006f54:	6ac080e7          	jalr	1708(ra) # 800055fc <mycpu>
    80006f58:	100027f3          	csrr	a5,sstatus
    80006f5c:	0027f793          	andi	a5,a5,2
    80006f60:	04079663          	bnez	a5,80006fac <pop_off+0x6c>
    80006f64:	07852783          	lw	a5,120(a0)
    80006f68:	02f05a63          	blez	a5,80006f9c <pop_off+0x5c>
    80006f6c:	fff7871b          	addiw	a4,a5,-1
    80006f70:	06e52c23          	sw	a4,120(a0)
    80006f74:	00071c63          	bnez	a4,80006f8c <pop_off+0x4c>
    80006f78:	07c52783          	lw	a5,124(a0)
    80006f7c:	00078863          	beqz	a5,80006f8c <pop_off+0x4c>
    80006f80:	100027f3          	csrr	a5,sstatus
    80006f84:	0027e793          	ori	a5,a5,2
    80006f88:	10079073          	csrw	sstatus,a5
    80006f8c:	00813083          	ld	ra,8(sp)
    80006f90:	00013403          	ld	s0,0(sp)
    80006f94:	01010113          	addi	sp,sp,16
    80006f98:	00008067          	ret
    80006f9c:	00001517          	auipc	a0,0x1
    80006fa0:	6e450513          	addi	a0,a0,1764 # 80008680 <digits+0x48>
    80006fa4:	fffff097          	auipc	ra,0xfffff
    80006fa8:	018080e7          	jalr	24(ra) # 80005fbc <panic>
    80006fac:	00001517          	auipc	a0,0x1
    80006fb0:	6bc50513          	addi	a0,a0,1724 # 80008668 <digits+0x30>
    80006fb4:	fffff097          	auipc	ra,0xfffff
    80006fb8:	008080e7          	jalr	8(ra) # 80005fbc <panic>

0000000080006fbc <push_on>:
    80006fbc:	fe010113          	addi	sp,sp,-32
    80006fc0:	00813823          	sd	s0,16(sp)
    80006fc4:	00113c23          	sd	ra,24(sp)
    80006fc8:	00913423          	sd	s1,8(sp)
    80006fcc:	02010413          	addi	s0,sp,32
    80006fd0:	100024f3          	csrr	s1,sstatus
    80006fd4:	100027f3          	csrr	a5,sstatus
    80006fd8:	0027e793          	ori	a5,a5,2
    80006fdc:	10079073          	csrw	sstatus,a5
    80006fe0:	ffffe097          	auipc	ra,0xffffe
    80006fe4:	61c080e7          	jalr	1564(ra) # 800055fc <mycpu>
    80006fe8:	07852783          	lw	a5,120(a0)
    80006fec:	02078663          	beqz	a5,80007018 <push_on+0x5c>
    80006ff0:	ffffe097          	auipc	ra,0xffffe
    80006ff4:	60c080e7          	jalr	1548(ra) # 800055fc <mycpu>
    80006ff8:	07852783          	lw	a5,120(a0)
    80006ffc:	01813083          	ld	ra,24(sp)
    80007000:	01013403          	ld	s0,16(sp)
    80007004:	0017879b          	addiw	a5,a5,1
    80007008:	06f52c23          	sw	a5,120(a0)
    8000700c:	00813483          	ld	s1,8(sp)
    80007010:	02010113          	addi	sp,sp,32
    80007014:	00008067          	ret
    80007018:	0014d493          	srli	s1,s1,0x1
    8000701c:	ffffe097          	auipc	ra,0xffffe
    80007020:	5e0080e7          	jalr	1504(ra) # 800055fc <mycpu>
    80007024:	0014f493          	andi	s1,s1,1
    80007028:	06952e23          	sw	s1,124(a0)
    8000702c:	fc5ff06f          	j	80006ff0 <push_on+0x34>

0000000080007030 <pop_on>:
    80007030:	ff010113          	addi	sp,sp,-16
    80007034:	00813023          	sd	s0,0(sp)
    80007038:	00113423          	sd	ra,8(sp)
    8000703c:	01010413          	addi	s0,sp,16
    80007040:	ffffe097          	auipc	ra,0xffffe
    80007044:	5bc080e7          	jalr	1468(ra) # 800055fc <mycpu>
    80007048:	100027f3          	csrr	a5,sstatus
    8000704c:	0027f793          	andi	a5,a5,2
    80007050:	04078463          	beqz	a5,80007098 <pop_on+0x68>
    80007054:	07852783          	lw	a5,120(a0)
    80007058:	02f05863          	blez	a5,80007088 <pop_on+0x58>
    8000705c:	fff7879b          	addiw	a5,a5,-1
    80007060:	06f52c23          	sw	a5,120(a0)
    80007064:	07853783          	ld	a5,120(a0)
    80007068:	00079863          	bnez	a5,80007078 <pop_on+0x48>
    8000706c:	100027f3          	csrr	a5,sstatus
    80007070:	ffd7f793          	andi	a5,a5,-3
    80007074:	10079073          	csrw	sstatus,a5
    80007078:	00813083          	ld	ra,8(sp)
    8000707c:	00013403          	ld	s0,0(sp)
    80007080:	01010113          	addi	sp,sp,16
    80007084:	00008067          	ret
    80007088:	00001517          	auipc	a0,0x1
    8000708c:	62050513          	addi	a0,a0,1568 # 800086a8 <digits+0x70>
    80007090:	fffff097          	auipc	ra,0xfffff
    80007094:	f2c080e7          	jalr	-212(ra) # 80005fbc <panic>
    80007098:	00001517          	auipc	a0,0x1
    8000709c:	5f050513          	addi	a0,a0,1520 # 80008688 <digits+0x50>
    800070a0:	fffff097          	auipc	ra,0xfffff
    800070a4:	f1c080e7          	jalr	-228(ra) # 80005fbc <panic>

00000000800070a8 <__memset>:
    800070a8:	ff010113          	addi	sp,sp,-16
    800070ac:	00813423          	sd	s0,8(sp)
    800070b0:	01010413          	addi	s0,sp,16
    800070b4:	1a060e63          	beqz	a2,80007270 <__memset+0x1c8>
    800070b8:	40a007b3          	neg	a5,a0
    800070bc:	0077f793          	andi	a5,a5,7
    800070c0:	00778693          	addi	a3,a5,7
    800070c4:	00b00813          	li	a6,11
    800070c8:	0ff5f593          	andi	a1,a1,255
    800070cc:	fff6071b          	addiw	a4,a2,-1
    800070d0:	1b06e663          	bltu	a3,a6,8000727c <__memset+0x1d4>
    800070d4:	1cd76463          	bltu	a4,a3,8000729c <__memset+0x1f4>
    800070d8:	1a078e63          	beqz	a5,80007294 <__memset+0x1ec>
    800070dc:	00b50023          	sb	a1,0(a0)
    800070e0:	00100713          	li	a4,1
    800070e4:	1ae78463          	beq	a5,a4,8000728c <__memset+0x1e4>
    800070e8:	00b500a3          	sb	a1,1(a0)
    800070ec:	00200713          	li	a4,2
    800070f0:	1ae78a63          	beq	a5,a4,800072a4 <__memset+0x1fc>
    800070f4:	00b50123          	sb	a1,2(a0)
    800070f8:	00300713          	li	a4,3
    800070fc:	18e78463          	beq	a5,a4,80007284 <__memset+0x1dc>
    80007100:	00b501a3          	sb	a1,3(a0)
    80007104:	00400713          	li	a4,4
    80007108:	1ae78263          	beq	a5,a4,800072ac <__memset+0x204>
    8000710c:	00b50223          	sb	a1,4(a0)
    80007110:	00500713          	li	a4,5
    80007114:	1ae78063          	beq	a5,a4,800072b4 <__memset+0x20c>
    80007118:	00b502a3          	sb	a1,5(a0)
    8000711c:	00700713          	li	a4,7
    80007120:	18e79e63          	bne	a5,a4,800072bc <__memset+0x214>
    80007124:	00b50323          	sb	a1,6(a0)
    80007128:	00700e93          	li	t4,7
    8000712c:	00859713          	slli	a4,a1,0x8
    80007130:	00e5e733          	or	a4,a1,a4
    80007134:	01059e13          	slli	t3,a1,0x10
    80007138:	01c76e33          	or	t3,a4,t3
    8000713c:	01859313          	slli	t1,a1,0x18
    80007140:	006e6333          	or	t1,t3,t1
    80007144:	02059893          	slli	a7,a1,0x20
    80007148:	40f60e3b          	subw	t3,a2,a5
    8000714c:	011368b3          	or	a7,t1,a7
    80007150:	02859813          	slli	a6,a1,0x28
    80007154:	0108e833          	or	a6,a7,a6
    80007158:	03059693          	slli	a3,a1,0x30
    8000715c:	003e589b          	srliw	a7,t3,0x3
    80007160:	00d866b3          	or	a3,a6,a3
    80007164:	03859713          	slli	a4,a1,0x38
    80007168:	00389813          	slli	a6,a7,0x3
    8000716c:	00f507b3          	add	a5,a0,a5
    80007170:	00e6e733          	or	a4,a3,a4
    80007174:	000e089b          	sext.w	a7,t3
    80007178:	00f806b3          	add	a3,a6,a5
    8000717c:	00e7b023          	sd	a4,0(a5)
    80007180:	00878793          	addi	a5,a5,8
    80007184:	fed79ce3          	bne	a5,a3,8000717c <__memset+0xd4>
    80007188:	ff8e7793          	andi	a5,t3,-8
    8000718c:	0007871b          	sext.w	a4,a5
    80007190:	01d787bb          	addw	a5,a5,t4
    80007194:	0ce88e63          	beq	a7,a4,80007270 <__memset+0x1c8>
    80007198:	00f50733          	add	a4,a0,a5
    8000719c:	00b70023          	sb	a1,0(a4)
    800071a0:	0017871b          	addiw	a4,a5,1
    800071a4:	0cc77663          	bgeu	a4,a2,80007270 <__memset+0x1c8>
    800071a8:	00e50733          	add	a4,a0,a4
    800071ac:	00b70023          	sb	a1,0(a4)
    800071b0:	0027871b          	addiw	a4,a5,2
    800071b4:	0ac77e63          	bgeu	a4,a2,80007270 <__memset+0x1c8>
    800071b8:	00e50733          	add	a4,a0,a4
    800071bc:	00b70023          	sb	a1,0(a4)
    800071c0:	0037871b          	addiw	a4,a5,3
    800071c4:	0ac77663          	bgeu	a4,a2,80007270 <__memset+0x1c8>
    800071c8:	00e50733          	add	a4,a0,a4
    800071cc:	00b70023          	sb	a1,0(a4)
    800071d0:	0047871b          	addiw	a4,a5,4
    800071d4:	08c77e63          	bgeu	a4,a2,80007270 <__memset+0x1c8>
    800071d8:	00e50733          	add	a4,a0,a4
    800071dc:	00b70023          	sb	a1,0(a4)
    800071e0:	0057871b          	addiw	a4,a5,5
    800071e4:	08c77663          	bgeu	a4,a2,80007270 <__memset+0x1c8>
    800071e8:	00e50733          	add	a4,a0,a4
    800071ec:	00b70023          	sb	a1,0(a4)
    800071f0:	0067871b          	addiw	a4,a5,6
    800071f4:	06c77e63          	bgeu	a4,a2,80007270 <__memset+0x1c8>
    800071f8:	00e50733          	add	a4,a0,a4
    800071fc:	00b70023          	sb	a1,0(a4)
    80007200:	0077871b          	addiw	a4,a5,7
    80007204:	06c77663          	bgeu	a4,a2,80007270 <__memset+0x1c8>
    80007208:	00e50733          	add	a4,a0,a4
    8000720c:	00b70023          	sb	a1,0(a4)
    80007210:	0087871b          	addiw	a4,a5,8
    80007214:	04c77e63          	bgeu	a4,a2,80007270 <__memset+0x1c8>
    80007218:	00e50733          	add	a4,a0,a4
    8000721c:	00b70023          	sb	a1,0(a4)
    80007220:	0097871b          	addiw	a4,a5,9
    80007224:	04c77663          	bgeu	a4,a2,80007270 <__memset+0x1c8>
    80007228:	00e50733          	add	a4,a0,a4
    8000722c:	00b70023          	sb	a1,0(a4)
    80007230:	00a7871b          	addiw	a4,a5,10
    80007234:	02c77e63          	bgeu	a4,a2,80007270 <__memset+0x1c8>
    80007238:	00e50733          	add	a4,a0,a4
    8000723c:	00b70023          	sb	a1,0(a4)
    80007240:	00b7871b          	addiw	a4,a5,11
    80007244:	02c77663          	bgeu	a4,a2,80007270 <__memset+0x1c8>
    80007248:	00e50733          	add	a4,a0,a4
    8000724c:	00b70023          	sb	a1,0(a4)
    80007250:	00c7871b          	addiw	a4,a5,12
    80007254:	00c77e63          	bgeu	a4,a2,80007270 <__memset+0x1c8>
    80007258:	00e50733          	add	a4,a0,a4
    8000725c:	00b70023          	sb	a1,0(a4)
    80007260:	00d7879b          	addiw	a5,a5,13
    80007264:	00c7f663          	bgeu	a5,a2,80007270 <__memset+0x1c8>
    80007268:	00f507b3          	add	a5,a0,a5
    8000726c:	00b78023          	sb	a1,0(a5)
    80007270:	00813403          	ld	s0,8(sp)
    80007274:	01010113          	addi	sp,sp,16
    80007278:	00008067          	ret
    8000727c:	00b00693          	li	a3,11
    80007280:	e55ff06f          	j	800070d4 <__memset+0x2c>
    80007284:	00300e93          	li	t4,3
    80007288:	ea5ff06f          	j	8000712c <__memset+0x84>
    8000728c:	00100e93          	li	t4,1
    80007290:	e9dff06f          	j	8000712c <__memset+0x84>
    80007294:	00000e93          	li	t4,0
    80007298:	e95ff06f          	j	8000712c <__memset+0x84>
    8000729c:	00000793          	li	a5,0
    800072a0:	ef9ff06f          	j	80007198 <__memset+0xf0>
    800072a4:	00200e93          	li	t4,2
    800072a8:	e85ff06f          	j	8000712c <__memset+0x84>
    800072ac:	00400e93          	li	t4,4
    800072b0:	e7dff06f          	j	8000712c <__memset+0x84>
    800072b4:	00500e93          	li	t4,5
    800072b8:	e75ff06f          	j	8000712c <__memset+0x84>
    800072bc:	00600e93          	li	t4,6
    800072c0:	e6dff06f          	j	8000712c <__memset+0x84>

00000000800072c4 <__memmove>:
    800072c4:	ff010113          	addi	sp,sp,-16
    800072c8:	00813423          	sd	s0,8(sp)
    800072cc:	01010413          	addi	s0,sp,16
    800072d0:	0e060863          	beqz	a2,800073c0 <__memmove+0xfc>
    800072d4:	fff6069b          	addiw	a3,a2,-1
    800072d8:	0006881b          	sext.w	a6,a3
    800072dc:	0ea5e863          	bltu	a1,a0,800073cc <__memmove+0x108>
    800072e0:	00758713          	addi	a4,a1,7
    800072e4:	00a5e7b3          	or	a5,a1,a0
    800072e8:	40a70733          	sub	a4,a4,a0
    800072ec:	0077f793          	andi	a5,a5,7
    800072f0:	00f73713          	sltiu	a4,a4,15
    800072f4:	00174713          	xori	a4,a4,1
    800072f8:	0017b793          	seqz	a5,a5
    800072fc:	00e7f7b3          	and	a5,a5,a4
    80007300:	10078863          	beqz	a5,80007410 <__memmove+0x14c>
    80007304:	00900793          	li	a5,9
    80007308:	1107f463          	bgeu	a5,a6,80007410 <__memmove+0x14c>
    8000730c:	0036581b          	srliw	a6,a2,0x3
    80007310:	fff8081b          	addiw	a6,a6,-1
    80007314:	02081813          	slli	a6,a6,0x20
    80007318:	01d85893          	srli	a7,a6,0x1d
    8000731c:	00858813          	addi	a6,a1,8
    80007320:	00058793          	mv	a5,a1
    80007324:	00050713          	mv	a4,a0
    80007328:	01088833          	add	a6,a7,a6
    8000732c:	0007b883          	ld	a7,0(a5)
    80007330:	00878793          	addi	a5,a5,8
    80007334:	00870713          	addi	a4,a4,8
    80007338:	ff173c23          	sd	a7,-8(a4)
    8000733c:	ff0798e3          	bne	a5,a6,8000732c <__memmove+0x68>
    80007340:	ff867713          	andi	a4,a2,-8
    80007344:	02071793          	slli	a5,a4,0x20
    80007348:	0207d793          	srli	a5,a5,0x20
    8000734c:	00f585b3          	add	a1,a1,a5
    80007350:	40e686bb          	subw	a3,a3,a4
    80007354:	00f507b3          	add	a5,a0,a5
    80007358:	06e60463          	beq	a2,a4,800073c0 <__memmove+0xfc>
    8000735c:	0005c703          	lbu	a4,0(a1)
    80007360:	00e78023          	sb	a4,0(a5)
    80007364:	04068e63          	beqz	a3,800073c0 <__memmove+0xfc>
    80007368:	0015c603          	lbu	a2,1(a1)
    8000736c:	00100713          	li	a4,1
    80007370:	00c780a3          	sb	a2,1(a5)
    80007374:	04e68663          	beq	a3,a4,800073c0 <__memmove+0xfc>
    80007378:	0025c603          	lbu	a2,2(a1)
    8000737c:	00200713          	li	a4,2
    80007380:	00c78123          	sb	a2,2(a5)
    80007384:	02e68e63          	beq	a3,a4,800073c0 <__memmove+0xfc>
    80007388:	0035c603          	lbu	a2,3(a1)
    8000738c:	00300713          	li	a4,3
    80007390:	00c781a3          	sb	a2,3(a5)
    80007394:	02e68663          	beq	a3,a4,800073c0 <__memmove+0xfc>
    80007398:	0045c603          	lbu	a2,4(a1)
    8000739c:	00400713          	li	a4,4
    800073a0:	00c78223          	sb	a2,4(a5)
    800073a4:	00e68e63          	beq	a3,a4,800073c0 <__memmove+0xfc>
    800073a8:	0055c603          	lbu	a2,5(a1)
    800073ac:	00500713          	li	a4,5
    800073b0:	00c782a3          	sb	a2,5(a5)
    800073b4:	00e68663          	beq	a3,a4,800073c0 <__memmove+0xfc>
    800073b8:	0065c703          	lbu	a4,6(a1)
    800073bc:	00e78323          	sb	a4,6(a5)
    800073c0:	00813403          	ld	s0,8(sp)
    800073c4:	01010113          	addi	sp,sp,16
    800073c8:	00008067          	ret
    800073cc:	02061713          	slli	a4,a2,0x20
    800073d0:	02075713          	srli	a4,a4,0x20
    800073d4:	00e587b3          	add	a5,a1,a4
    800073d8:	f0f574e3          	bgeu	a0,a5,800072e0 <__memmove+0x1c>
    800073dc:	02069613          	slli	a2,a3,0x20
    800073e0:	02065613          	srli	a2,a2,0x20
    800073e4:	fff64613          	not	a2,a2
    800073e8:	00e50733          	add	a4,a0,a4
    800073ec:	00c78633          	add	a2,a5,a2
    800073f0:	fff7c683          	lbu	a3,-1(a5)
    800073f4:	fff78793          	addi	a5,a5,-1
    800073f8:	fff70713          	addi	a4,a4,-1
    800073fc:	00d70023          	sb	a3,0(a4)
    80007400:	fec798e3          	bne	a5,a2,800073f0 <__memmove+0x12c>
    80007404:	00813403          	ld	s0,8(sp)
    80007408:	01010113          	addi	sp,sp,16
    8000740c:	00008067          	ret
    80007410:	02069713          	slli	a4,a3,0x20
    80007414:	02075713          	srli	a4,a4,0x20
    80007418:	00170713          	addi	a4,a4,1
    8000741c:	00e50733          	add	a4,a0,a4
    80007420:	00050793          	mv	a5,a0
    80007424:	0005c683          	lbu	a3,0(a1)
    80007428:	00178793          	addi	a5,a5,1
    8000742c:	00158593          	addi	a1,a1,1
    80007430:	fed78fa3          	sb	a3,-1(a5)
    80007434:	fee798e3          	bne	a5,a4,80007424 <__memmove+0x160>
    80007438:	f89ff06f          	j	800073c0 <__memmove+0xfc>

000000008000743c <__putc>:
    8000743c:	fe010113          	addi	sp,sp,-32
    80007440:	00813823          	sd	s0,16(sp)
    80007444:	00113c23          	sd	ra,24(sp)
    80007448:	02010413          	addi	s0,sp,32
    8000744c:	00050793          	mv	a5,a0
    80007450:	fef40593          	addi	a1,s0,-17
    80007454:	00100613          	li	a2,1
    80007458:	00000513          	li	a0,0
    8000745c:	fef407a3          	sb	a5,-17(s0)
    80007460:	fffff097          	auipc	ra,0xfffff
    80007464:	b3c080e7          	jalr	-1220(ra) # 80005f9c <console_write>
    80007468:	01813083          	ld	ra,24(sp)
    8000746c:	01013403          	ld	s0,16(sp)
    80007470:	02010113          	addi	sp,sp,32
    80007474:	00008067          	ret

0000000080007478 <__getc>:
    80007478:	fe010113          	addi	sp,sp,-32
    8000747c:	00813823          	sd	s0,16(sp)
    80007480:	00113c23          	sd	ra,24(sp)
    80007484:	02010413          	addi	s0,sp,32
    80007488:	fe840593          	addi	a1,s0,-24
    8000748c:	00100613          	li	a2,1
    80007490:	00000513          	li	a0,0
    80007494:	fffff097          	auipc	ra,0xfffff
    80007498:	ae8080e7          	jalr	-1304(ra) # 80005f7c <console_read>
    8000749c:	fe844503          	lbu	a0,-24(s0)
    800074a0:	01813083          	ld	ra,24(sp)
    800074a4:	01013403          	ld	s0,16(sp)
    800074a8:	02010113          	addi	sp,sp,32
    800074ac:	00008067          	ret

00000000800074b0 <console_handler>:
    800074b0:	fe010113          	addi	sp,sp,-32
    800074b4:	00813823          	sd	s0,16(sp)
    800074b8:	00113c23          	sd	ra,24(sp)
    800074bc:	00913423          	sd	s1,8(sp)
    800074c0:	02010413          	addi	s0,sp,32
    800074c4:	14202773          	csrr	a4,scause
    800074c8:	100027f3          	csrr	a5,sstatus
    800074cc:	0027f793          	andi	a5,a5,2
    800074d0:	06079e63          	bnez	a5,8000754c <console_handler+0x9c>
    800074d4:	00074c63          	bltz	a4,800074ec <console_handler+0x3c>
    800074d8:	01813083          	ld	ra,24(sp)
    800074dc:	01013403          	ld	s0,16(sp)
    800074e0:	00813483          	ld	s1,8(sp)
    800074e4:	02010113          	addi	sp,sp,32
    800074e8:	00008067          	ret
    800074ec:	0ff77713          	andi	a4,a4,255
    800074f0:	00900793          	li	a5,9
    800074f4:	fef712e3          	bne	a4,a5,800074d8 <console_handler+0x28>
    800074f8:	ffffe097          	auipc	ra,0xffffe
    800074fc:	6dc080e7          	jalr	1756(ra) # 80005bd4 <plic_claim>
    80007500:	00a00793          	li	a5,10
    80007504:	00050493          	mv	s1,a0
    80007508:	02f50c63          	beq	a0,a5,80007540 <console_handler+0x90>
    8000750c:	fc0506e3          	beqz	a0,800074d8 <console_handler+0x28>
    80007510:	00050593          	mv	a1,a0
    80007514:	00001517          	auipc	a0,0x1
    80007518:	09c50513          	addi	a0,a0,156 # 800085b0 <_ZL6digits+0xe8>
    8000751c:	fffff097          	auipc	ra,0xfffff
    80007520:	afc080e7          	jalr	-1284(ra) # 80006018 <__printf>
    80007524:	01013403          	ld	s0,16(sp)
    80007528:	01813083          	ld	ra,24(sp)
    8000752c:	00048513          	mv	a0,s1
    80007530:	00813483          	ld	s1,8(sp)
    80007534:	02010113          	addi	sp,sp,32
    80007538:	ffffe317          	auipc	t1,0xffffe
    8000753c:	6d430067          	jr	1748(t1) # 80005c0c <plic_complete>
    80007540:	fffff097          	auipc	ra,0xfffff
    80007544:	3e0080e7          	jalr	992(ra) # 80006920 <uartintr>
    80007548:	fddff06f          	j	80007524 <console_handler+0x74>
    8000754c:	00001517          	auipc	a0,0x1
    80007550:	16450513          	addi	a0,a0,356 # 800086b0 <digits+0x78>
    80007554:	fffff097          	auipc	ra,0xfffff
    80007558:	a68080e7          	jalr	-1432(ra) # 80005fbc <panic>
	...
