
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000a117          	auipc	sp,0xa
    80000004:	5b813103          	ld	sp,1464(sp) # 8000a5b8 <_GLOBAL_OFFSET_TABLE_+0x28>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	1ad050ef          	jal	ra,800059c8 <start>

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
    80001030:	61453503          	ld	a0,1556(a0) # 8000a640 <_ZN3TCB7runningE>
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
    800010c8:	090010ef          	jal	ra,80002158 <_ZN5Riscv20handleSupervisorTrapEv>

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
    80001160:	4e453503          	ld	a0,1252(a0) # 8000a640 <_ZN3TCB7runningE>
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
    800011cc:	314080e7          	jalr	788(ra) # 800034dc <_ZN3TCB18createKernelThreadEPFvPvES0_>
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
    800011f4:	4307b783          	ld	a5,1072(a5) # 8000a620 <_ZN10IdleThread8instanceE>
    800011f8:	00078863          	beqz	a5,80001208 <_ZN10IdleThread11getInstanceEv+0x18>
    return instance;
    800011fc:	00009517          	auipc	a0,0x9
    80001200:	42453503          	ld	a0,1060(a0) # 8000a620 <_ZN10IdleThread8instanceE>
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
    80001228:	b48080e7          	jalr	-1208(ra) # 80001d6c <_Z7kmallocm>
    8000122c:	00050493          	mv	s1,a0
    if (!instance) instance = new IdleThread;
    80001230:	00000097          	auipc	ra,0x0
    80001234:	f70080e7          	jalr	-144(ra) # 800011a0 <_ZN10IdleThreadC1Ev>
    80001238:	00009797          	auipc	a5,0x9
    8000123c:	3e97b423          	sd	s1,1000(a5) # 8000a620 <_ZN10IdleThread8instanceE>
    return instance;
    80001240:	00009517          	auipc	a0,0x9
    80001244:	3e053503          	ld	a0,992(a0) # 8000a620 <_ZN10IdleThread8instanceE>
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
    8000126c:	d0c080e7          	jalr	-756(ra) # 80001f74 <_Z5kfreePv>
    80001270:	00090513          	mv	a0,s2
    80001274:	0000a097          	auipc	ra,0xa
    80001278:	4c4080e7          	jalr	1220(ra) # 8000b738 <_Unwind_Resume>

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
    800012d0:	550080e7          	jalr	1360(ra) # 8000381c <_ZN3TCBD1Ev>
    800012d4:	00048513          	mv	a0,s1
    800012d8:	00001097          	auipc	ra,0x1
    800012dc:	c9c080e7          	jalr	-868(ra) # 80001f74 <_Z5kfreePv>
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
    80001334:	a3c080e7          	jalr	-1476(ra) # 80001d6c <_Z7kmallocm>
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
    8000135c:	c1c080e7          	jalr	-996(ra) # 80001f74 <_Z5kfreePv>
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
    800013b4:	190080e7          	jalr	400(ra) # 80003540 <_ZN3TCB16createUserThreadEPFvPvES0_Pm>
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
    800013d8:	334080e7          	jalr	820(ra) # 80003708 <_ZN3TCB4exitEv>
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
    80001404:	244080e7          	jalr	580(ra) # 80003644 <_ZN3TCB8dispatchEv>
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
    80001460:	910080e7          	jalr	-1776(ra) # 80001d6c <_Z7kmallocm>

class TCB;

class KernelSemaphore : public KernelObject {
public:
    KernelSemaphore(int val = 1) : val(val) {}
    80001464:	00009797          	auipc	a5,0x9
    80001468:	14c7b783          	ld	a5,332(a5) # 8000a5b0 <_GLOBAL_OFFSET_TABLE_+0x20>
    8000146c:	01078793          	addi	a5,a5,16
    80001470:	00f53023          	sd	a5,0(a0)
    80001474:	01252423          	sw	s2,8(a0)
#include "KernelObject.h"
#include "ThreadNode.h"

class ThreadList : public KernelObject {
public:
    explicit ThreadList() = default;
    80001478:	00053823          	sd	zero,16(a0)
    8000147c:	00053c23          	sd	zero,24(a0)
    80001480:	02053023          	sd	zero,32(a0)
    80001484:	02052423          	sw	zero,40(a0)
    *handle = new KernelSemaphore(init);
    80001488:	00a4b023          	sd	a0,0(s1)
    return *handle != nullptr;
    8000148c:	00a03533          	snez	a0,a0
    80001490:	fadff06f          	j	8000143c <_ZN6Kernel8sem_openEPm+0x24>

0000000080001494 <_ZN6Kernel9sem_closeEPP15KernelSemaphore>:

int Kernel::sem_close(KernelSemaphore **sem) {
    if (!sem || !*sem) return -1;
    80001494:	04050663          	beqz	a0,800014e0 <_ZN6Kernel9sem_closeEPP15KernelSemaphore+0x4c>
int Kernel::sem_close(KernelSemaphore **sem) {
    80001498:	fe010113          	addi	sp,sp,-32
    8000149c:	00113c23          	sd	ra,24(sp)
    800014a0:	00813823          	sd	s0,16(sp)
    800014a4:	00913423          	sd	s1,8(sp)
    800014a8:	02010413          	addi	s0,sp,32
    800014ac:	00050493          	mv	s1,a0
    if (!sem || !*sem) return -1;
    800014b0:	00053503          	ld	a0,0(a0)
    800014b4:	02050a63          	beqz	a0,800014e8 <_ZN6Kernel9sem_closeEPP15KernelSemaphore+0x54>
    delete *sem;
    800014b8:	00053783          	ld	a5,0(a0)
    800014bc:	0187b783          	ld	a5,24(a5)
    800014c0:	000780e7          	jalr	a5
    *sem = nullptr;
    800014c4:	0004b023          	sd	zero,0(s1)

    return 0;
    800014c8:	00000513          	li	a0,0
}
    800014cc:	01813083          	ld	ra,24(sp)
    800014d0:	01013403          	ld	s0,16(sp)
    800014d4:	00813483          	ld	s1,8(sp)
    800014d8:	02010113          	addi	sp,sp,32
    800014dc:	00008067          	ret
    if (!sem || !*sem) return -1;
    800014e0:	fff00513          	li	a0,-1
}
    800014e4:	00008067          	ret
    if (!sem || !*sem) return -1;
    800014e8:	fff00513          	li	a0,-1
    800014ec:	fe1ff06f          	j	800014cc <_ZN6Kernel9sem_closeEPP15KernelSemaphore+0x38>

00000000800014f0 <_ZN6Kernel8sem_waitEPP15KernelSemaphore>:

int Kernel::sem_wait(KernelSemaphore **sem) {
    if (!sem || !*sem) return -1;
    800014f0:	02050e63          	beqz	a0,8000152c <_ZN6Kernel8sem_waitEPP15KernelSemaphore+0x3c>
    800014f4:	00053503          	ld	a0,0(a0)
    800014f8:	02050e63          	beqz	a0,80001534 <_ZN6Kernel8sem_waitEPP15KernelSemaphore+0x44>
int Kernel::sem_wait(KernelSemaphore **sem) {
    800014fc:	ff010113          	addi	sp,sp,-16
    80001500:	00113423          	sd	ra,8(sp)
    80001504:	00813023          	sd	s0,0(sp)
    80001508:	01010413          	addi	s0,sp,16
    (*sem)->wait();
    8000150c:	00053783          	ld	a5,0(a0)
    80001510:	0007b783          	ld	a5,0(a5)
    80001514:	000780e7          	jalr	a5
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
    8000153c:	02050e63          	beqz	a0,80001578 <_ZN6Kernel10sem_signalEPP15KernelSemaphore+0x3c>
    80001540:	00053503          	ld	a0,0(a0)
    80001544:	02050e63          	beqz	a0,80001580 <_ZN6Kernel10sem_signalEPP15KernelSemaphore+0x44>
int Kernel::sem_signal(KernelSemaphore **sem) {
    80001548:	ff010113          	addi	sp,sp,-16
    8000154c:	00113423          	sd	ra,8(sp)
    80001550:	00813023          	sd	s0,0(sp)
    80001554:	01010413          	addi	s0,sp,16
    (*sem)->signal();
    80001558:	00053783          	ld	a5,0(a0)
    8000155c:	0087b783          	ld	a5,8(a5)
    80001560:	000780e7          	jalr	a5
    return 0;
    80001564:	00000513          	li	a0,0
}
    80001568:	00813083          	ld	ra,8(sp)
    8000156c:	00013403          	ld	s0,0(sp)
    80001570:	01010113          	addi	sp,sp,16
    80001574:	00008067          	ret
    if (!sem || !*sem) return -1;
    80001578:	fff00513          	li	a0,-1
    8000157c:	00008067          	ret
    80001580:	fff00513          	li	a0,-1
}
    80001584:	00008067          	ret

0000000080001588 <_ZN6Kernel10time_sleepEm>:

int Kernel::time_sleep(time_t time) {
    80001588:	ff010113          	addi	sp,sp,-16
    8000158c:	00113423          	sd	ra,8(sp)
    80001590:	00813023          	sd	s0,0(sp)
    80001594:	01010413          	addi	s0,sp,16
    80001598:	00050593          	mv	a1,a0
    if (time < 0) return -1;
    TimerInterrupt::block(TCB::running, time);
    8000159c:	00009797          	auipc	a5,0x9
    800015a0:	02c7b783          	ld	a5,44(a5) # 8000a5c8 <_GLOBAL_OFFSET_TABLE_+0x38>
    800015a4:	0007b503          	ld	a0,0(a5)
    800015a8:	00003097          	auipc	ra,0x3
    800015ac:	94c080e7          	jalr	-1716(ra) # 80003ef4 <_ZN14TimerInterrupt5blockEP3TCBm>
    return 0;
}
    800015b0:	00000513          	li	a0,0
    800015b4:	00813083          	ld	ra,8(sp)
    800015b8:	00013403          	ld	s0,0(sp)
    800015bc:	01010113          	addi	sp,sp,16
    800015c0:	00008067          	ret

00000000800015c4 <_ZN6Kernel4getcEv>:

char Kernel::getc() {
    800015c4:	ff010113          	addi	sp,sp,-16
    800015c8:	00113423          	sd	ra,8(sp)
    800015cc:	00813023          	sd	s0,0(sp)
    800015d0:	01010413          	addi	s0,sp,16
    return __getc();
    800015d4:	00006097          	auipc	ra,0x6
    800015d8:	4f4080e7          	jalr	1268(ra) # 80007ac8 <__getc>
}
    800015dc:	00813083          	ld	ra,8(sp)
    800015e0:	00013403          	ld	s0,0(sp)
    800015e4:	01010113          	addi	sp,sp,16
    800015e8:	00008067          	ret

00000000800015ec <_ZN6Kernel4putcEc>:

void Kernel::putc(char c) {
    800015ec:	ff010113          	addi	sp,sp,-16
    800015f0:	00113423          	sd	ra,8(sp)
    800015f4:	00813023          	sd	s0,0(sp)
    800015f8:	01010413          	addi	s0,sp,16
    __putc(c);
    800015fc:	00006097          	auipc	ra,0x6
    80001600:	490080e7          	jalr	1168(ra) # 80007a8c <__putc>
}
    80001604:	00813083          	ld	ra,8(sp)
    80001608:	00013403          	ld	s0,0(sp)
    8000160c:	01010113          	addi	sp,sp,16
    80001610:	00008067          	ret

0000000080001614 <_ZN6Kernel16handleSystemCallEv>:
void Kernel::handleSystemCall() {
    80001614:	fd010113          	addi	sp,sp,-48
    80001618:	02113423          	sd	ra,40(sp)
    8000161c:	02813023          	sd	s0,32(sp)
    80001620:	00913c23          	sd	s1,24(sp)
    80001624:	01213823          	sd	s2,16(sp)
    80001628:	03010413          	addi	s0,sp,48
    uint64 context = TCB::running->getSavedContext();
    8000162c:	00009797          	auipc	a5,0x9
    80001630:	f9c7b783          	ld	a5,-100(a5) # 8000a5c8 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001634:	0007b783          	ld	a5,0(a5)
    uint64 getSsp() const {
        return ssp;
    }

    uint64 getSavedContext() const {
        return (uint64) (kernelStack + DEFAULT_STACK_SIZE - 32);
    80001638:	0207b703          	ld	a4,32(a5)
    8000163c:	000087b7          	lui	a5,0x8
    80001640:	f0078793          	addi	a5,a5,-256 # 7f00 <_entry-0x7fff8100>
    80001644:	00f704b3          	add	s1,a4,a5
    return s0;
}

inline uint64 Riscv::r_a0() {
    uint64 volatile a0;
    __asm__ volatile ("mv %[a0], a0" : [a0] "=r"(a0));
    80001648:	00050793          	mv	a5,a0
    8000164c:	fcf43c23          	sd	a5,-40(s0)
    return a0;
    80001650:	fd843903          	ld	s2,-40(s0)
    __asm__ volatile ("mv a0, %[a0]" : : [a0] "r"(a0));
}

inline uint64 Riscv::r_a1() {
    uint64 volatile a1;
    __asm__ volatile ("mv %[a1], a1" : [a1] "=r"(a1));
    80001654:	00058793          	mv	a5,a1
    80001658:	fcf43823          	sd	a5,-48(s0)
    return a1;
    8000165c:	fd043503          	ld	a0,-48(s0)
    switch (code) {
    80001660:	04200793          	li	a5,66
    80001664:	0f27e863          	bltu	a5,s2,80001754 <_ZN6Kernel16handleSystemCallEv+0x140>
    80001668:	00291713          	slli	a4,s2,0x2
    8000166c:	00007697          	auipc	a3,0x7
    80001670:	9cc68693          	addi	a3,a3,-1588 # 80008038 <CONSOLE_STATUS+0x28>
    80001674:	00d70733          	add	a4,a4,a3
    80001678:	00072783          	lw	a5,0(a4)
    8000167c:	00d787b3          	add	a5,a5,a3
    80001680:	00078067          	jr	a5
            mem_alloc((size_t) args);
    80001684:	00000097          	auipc	ra,0x0
    80001688:	c9c080e7          	jalr	-868(ra) # 80001320 <_ZN6Kernel9mem_allocEm>
inline void Riscv::enableInterrupts() {
    ms_sstatus(SSTATUS_SIE);
}

inline void Riscv::pushRegisterA0(uint64 context) {
    __asm__ volatile ("sd a0, 10 * 8(%[context])" : : [context] "r"(context));
    8000168c:	04a4b823          	sd	a0,80(s1)
}
    80001690:	02813083          	ld	ra,40(sp)
    80001694:	02013403          	ld	s0,32(sp)
    80001698:	01813483          	ld	s1,24(sp)
    8000169c:	01013903          	ld	s2,16(sp)
    800016a0:	03010113          	addi	sp,sp,48
    800016a4:	00008067          	ret
            mem_free(args);
    800016a8:	00000097          	auipc	ra,0x0
    800016ac:	ca0080e7          	jalr	-864(ra) # 80001348 <_ZN6Kernel8mem_freeEPv>
    800016b0:	04a4b823          	sd	a0,80(s1)
}
    800016b4:	fddff06f          	j	80001690 <_ZN6Kernel16handleSystemCallEv+0x7c>
            thread_create((uint64 *) args);
    800016b8:	00000097          	auipc	ra,0x0
    800016bc:	cb8080e7          	jalr	-840(ra) # 80001370 <_ZN6Kernel13thread_createEPm>
    __asm__ volatile ("sd a0, 10 * 8(%[context])" : : [context] "r"(context));
    800016c0:	04a4b823          	sd	a0,80(s1)
}
    800016c4:	fcdff06f          	j	80001690 <_ZN6Kernel16handleSystemCallEv+0x7c>
            thread_exit();
    800016c8:	00000097          	auipc	ra,0x0
    800016cc:	cfc080e7          	jalr	-772(ra) # 800013c4 <_ZN6Kernel11thread_exitEv>
    __asm__ volatile ("sd a0, 10 * 8(%[context])" : : [context] "r"(context));
    800016d0:	04a4b823          	sd	a0,80(s1)
}
    800016d4:	fbdff06f          	j	80001690 <_ZN6Kernel16handleSystemCallEv+0x7c>
            thread_dispatch();
    800016d8:	00000097          	auipc	ra,0x0
    800016dc:	d18080e7          	jalr	-744(ra) # 800013f0 <_ZN6Kernel15thread_dispatchEv>
            break;
    800016e0:	fb1ff06f          	j	80001690 <_ZN6Kernel16handleSystemCallEv+0x7c>
            sem_open((uint64 *) args);
    800016e4:	00000097          	auipc	ra,0x0
    800016e8:	d34080e7          	jalr	-716(ra) # 80001418 <_ZN6Kernel8sem_openEPm>
    __asm__ volatile ("sd a0, 10 * 8(%[context])" : : [context] "r"(context));
    800016ec:	04a4b823          	sd	a0,80(s1)
}
    800016f0:	fa1ff06f          	j	80001690 <_ZN6Kernel16handleSystemCallEv+0x7c>
            sem_close((KernelSemaphore **) args);
    800016f4:	00000097          	auipc	ra,0x0
    800016f8:	da0080e7          	jalr	-608(ra) # 80001494 <_ZN6Kernel9sem_closeEPP15KernelSemaphore>
    __asm__ volatile ("sd a0, 10 * 8(%[context])" : : [context] "r"(context));
    800016fc:	04a4b823          	sd	a0,80(s1)
}
    80001700:	f91ff06f          	j	80001690 <_ZN6Kernel16handleSystemCallEv+0x7c>
            sem_wait((KernelSemaphore **) args);
    80001704:	00000097          	auipc	ra,0x0
    80001708:	dec080e7          	jalr	-532(ra) # 800014f0 <_ZN6Kernel8sem_waitEPP15KernelSemaphore>
    __asm__ volatile ("sd a0, 10 * 8(%[context])" : : [context] "r"(context));
    8000170c:	04a4b823          	sd	a0,80(s1)
}
    80001710:	f81ff06f          	j	80001690 <_ZN6Kernel16handleSystemCallEv+0x7c>
            sem_signal((KernelSemaphore **) args);
    80001714:	00000097          	auipc	ra,0x0
    80001718:	e28080e7          	jalr	-472(ra) # 8000153c <_ZN6Kernel10sem_signalEPP15KernelSemaphore>
    __asm__ volatile ("sd a0, 10 * 8(%[context])" : : [context] "r"(context));
    8000171c:	04a4b823          	sd	a0,80(s1)
}
    80001720:	f71ff06f          	j	80001690 <_ZN6Kernel16handleSystemCallEv+0x7c>
            time_sleep((time_t) args);
    80001724:	00000097          	auipc	ra,0x0
    80001728:	e64080e7          	jalr	-412(ra) # 80001588 <_ZN6Kernel10time_sleepEm>
    __asm__ volatile ("sd a0, 10 * 8(%[context])" : : [context] "r"(context));
    8000172c:	04a4b823          	sd	a0,80(s1)
}
    80001730:	f61ff06f          	j	80001690 <_ZN6Kernel16handleSystemCallEv+0x7c>
            getc();
    80001734:	00000097          	auipc	ra,0x0
    80001738:	e90080e7          	jalr	-368(ra) # 800015c4 <_ZN6Kernel4getcEv>
    __asm__ volatile ("sd a0, 10 * 8(%[context])" : : [context] "r"(context));
    8000173c:	04a4b823          	sd	a0,80(s1)
}
    80001740:	f51ff06f          	j	80001690 <_ZN6Kernel16handleSystemCallEv+0x7c>
            putc((uint64) args);
    80001744:	0ff57513          	andi	a0,a0,255
    80001748:	00000097          	auipc	ra,0x0
    8000174c:	ea4080e7          	jalr	-348(ra) # 800015ec <_ZN6Kernel4putcEc>
            break;
    80001750:	f41ff06f          	j	80001690 <_ZN6Kernel16handleSystemCallEv+0x7c>
            kprintString("Unknown system call: ");
    80001754:	00007517          	auipc	a0,0x7
    80001758:	8cc50513          	addi	a0,a0,-1844 # 80008020 <CONSOLE_STATUS+0x10>
    8000175c:	00001097          	auipc	ra,0x1
    80001760:	6ac080e7          	jalr	1708(ra) # 80002e08 <_Z12kprintStringPKc>
            kprintUnsigned(code);
    80001764:	00090513          	mv	a0,s2
    80001768:	00002097          	auipc	ra,0x2
    8000176c:	938080e7          	jalr	-1736(ra) # 800030a0 <_Z14kprintUnsignedm>
            kprintString("\n");
    80001770:	00007517          	auipc	a0,0x7
    80001774:	a1850513          	addi	a0,a0,-1512 # 80008188 <CONSOLE_STATUS+0x178>
    80001778:	00001097          	auipc	ra,0x1
    8000177c:	690080e7          	jalr	1680(ra) # 80002e08 <_Z12kprintStringPKc>
            return;
    80001780:	f11ff06f          	j	80001690 <_ZN6Kernel16handleSystemCallEv+0x7c>

0000000080001784 <_ZN15KernelSemaphore5blockEv>:
#include "../h/KernelSemaphore.h"
#include "../h/Riscv.h"
#include "../h/TCB.h"
#include "../h/Scheduler.h"

void KernelSemaphore::block() {
    80001784:	fe010113          	addi	sp,sp,-32
    80001788:	00113c23          	sd	ra,24(sp)
    8000178c:	00813823          	sd	s0,16(sp)
    80001790:	00913423          	sd	s1,8(sp)
    80001794:	02010413          	addi	s0,sp,32
    blockedThreadQueue.addLast(TCB::running->getNode());
    80001798:	00009497          	auipc	s1,0x9
    8000179c:	e304b483          	ld	s1,-464(s1) # 8000a5c8 <_GLOBAL_OFFSET_TABLE_+0x38>
    800017a0:	0004b583          	ld	a1,0(s1)
    800017a4:	0a858593          	addi	a1,a1,168
    800017a8:	01050513          	addi	a0,a0,16
    800017ac:	00002097          	auipc	ra,0x2
    800017b0:	4b8080e7          	jalr	1208(ra) # 80003c64 <_ZN10ThreadList7addLastEP10ThreadNode>
    TCB::running->setBlocked();
    800017b4:	0004b783          	ld	a5,0(s1)
        status = BLOCKED;
    800017b8:	00200713          	li	a4,2
    800017bc:	04e7a423          	sw	a4,72(a5)
    TCB::dispatch();
    800017c0:	00002097          	auipc	ra,0x2
    800017c4:	e84080e7          	jalr	-380(ra) # 80003644 <_ZN3TCB8dispatchEv>
}
    800017c8:	01813083          	ld	ra,24(sp)
    800017cc:	01013403          	ld	s0,16(sp)
    800017d0:	00813483          	ld	s1,8(sp)
    800017d4:	02010113          	addi	sp,sp,32
    800017d8:	00008067          	ret

00000000800017dc <_ZN15KernelSemaphore4waitEv>:
    TCB *tcb = blockedThreadQueue.removeFirst();
    tcb->setReady();
    Scheduler::put(tcb);
}

void KernelSemaphore::wait() {
    800017dc:	fe010113          	addi	sp,sp,-32
    800017e0:	00113c23          	sd	ra,24(sp)
    800017e4:	00813823          	sd	s0,16(sp)
    800017e8:	02010413          	addi	s0,sp,32
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    800017ec:	100027f3          	csrr	a5,sstatus
    800017f0:	fef43023          	sd	a5,-32(s0)
    return sstatus;
    800017f4:	fe043783          	ld	a5,-32(s0)
    lock()
    800017f8:	fef43423          	sd	a5,-24(s0)
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    800017fc:	00200793          	li	a5,2
    80001800:	1007b073          	csrc	sstatus,a5
    if (--val < 0) block();
    80001804:	00852783          	lw	a5,8(a0)
    80001808:	fff7879b          	addiw	a5,a5,-1
    8000180c:	00f52423          	sw	a5,8(a0)
    80001810:	02079713          	slli	a4,a5,0x20
    80001814:	00074e63          	bltz	a4,80001830 <_ZN15KernelSemaphore4waitEv+0x54>
    unlock()
    80001818:	fe843783          	ld	a5,-24(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    8000181c:	10079073          	csrw	sstatus,a5
}
    80001820:	01813083          	ld	ra,24(sp)
    80001824:	01013403          	ld	s0,16(sp)
    80001828:	02010113          	addi	sp,sp,32
    8000182c:	00008067          	ret
    if (--val < 0) block();
    80001830:	00000097          	auipc	ra,0x0
    80001834:	f54080e7          	jalr	-172(ra) # 80001784 <_ZN15KernelSemaphore5blockEv>
    80001838:	fe1ff06f          	j	80001818 <_ZN15KernelSemaphore4waitEv+0x3c>

000000008000183c <_ZN15KernelSemaphore7deblockEv>:
    bool hasCurr() {
        return curr != nullptr;
    }

    bool isEmpty() {
        return size == 0;
    8000183c:	02852783          	lw	a5,40(a0)
    if (blockedThreadQueue.isEmpty()) return;
    80001840:	00079463          	bnez	a5,80001848 <_ZN15KernelSemaphore7deblockEv+0xc>
    80001844:	00008067          	ret
void KernelSemaphore::deblock() {
    80001848:	ff010113          	addi	sp,sp,-16
    8000184c:	00113423          	sd	ra,8(sp)
    80001850:	00813023          	sd	s0,0(sp)
    80001854:	01010413          	addi	s0,sp,16
    TCB *tcb = blockedThreadQueue.removeFirst();
    80001858:	01050513          	addi	a0,a0,16
    8000185c:	00002097          	auipc	ra,0x2
    80001860:	44c080e7          	jalr	1100(ra) # 80003ca8 <_ZN10ThreadList11removeFirstEv>
        status = READY;
    80001864:	04052423          	sw	zero,72(a0)
    Scheduler::put(tcb);
    80001868:	00001097          	auipc	ra,0x1
    8000186c:	c1c080e7          	jalr	-996(ra) # 80002484 <_ZN9Scheduler3putEP3TCB>
}
    80001870:	00813083          	ld	ra,8(sp)
    80001874:	00013403          	ld	s0,0(sp)
    80001878:	01010113          	addi	sp,sp,16
    8000187c:	00008067          	ret

0000000080001880 <_ZN15KernelSemaphore6signalEv>:

void KernelSemaphore::signal() {
    80001880:	fe010113          	addi	sp,sp,-32
    80001884:	00113c23          	sd	ra,24(sp)
    80001888:	00813823          	sd	s0,16(sp)
    8000188c:	02010413          	addi	s0,sp,32
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80001890:	100027f3          	csrr	a5,sstatus
    80001894:	fef43023          	sd	a5,-32(s0)
    return sstatus;
    80001898:	fe043783          	ld	a5,-32(s0)
    lock()
    8000189c:	fef43423          	sd	a5,-24(s0)
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    800018a0:	00200793          	li	a5,2
    800018a4:	1007b073          	csrc	sstatus,a5
    if (val++ < 0) deblock();
    800018a8:	00852783          	lw	a5,8(a0)
    800018ac:	0017871b          	addiw	a4,a5,1
    800018b0:	00e52423          	sw	a4,8(a0)
    800018b4:	0007ce63          	bltz	a5,800018d0 <_ZN15KernelSemaphore6signalEv+0x50>
    unlock()
    800018b8:	fe843783          	ld	a5,-24(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    800018bc:	10079073          	csrw	sstatus,a5
}
    800018c0:	01813083          	ld	ra,24(sp)
    800018c4:	01013403          	ld	s0,16(sp)
    800018c8:	02010113          	addi	sp,sp,32
    800018cc:	00008067          	ret
    if (val++ < 0) deblock();
    800018d0:	00000097          	auipc	ra,0x0
    800018d4:	f6c080e7          	jalr	-148(ra) # 8000183c <_ZN15KernelSemaphore7deblockEv>
    800018d8:	fe1ff06f          	j	800018b8 <_ZN15KernelSemaphore6signalEv+0x38>

00000000800018dc <_ZN15KernelSemaphoreD1Ev>:

KernelSemaphore::~KernelSemaphore() {
    800018dc:	fd010113          	addi	sp,sp,-48
    800018e0:	02113423          	sd	ra,40(sp)
    800018e4:	02813023          	sd	s0,32(sp)
    800018e8:	00913c23          	sd	s1,24(sp)
    800018ec:	03010413          	addi	s0,sp,48
    800018f0:	00050493          	mv	s1,a0
    800018f4:	00009797          	auipc	a5,0x9
    800018f8:	b3478793          	addi	a5,a5,-1228 # 8000a428 <_ZTV15KernelSemaphore+0x10>
    800018fc:	00f53023          	sd	a5,0(a0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80001900:	100027f3          	csrr	a5,sstatus
    80001904:	fcf43c23          	sd	a5,-40(s0)
    return sstatus;
    80001908:	fd843783          	ld	a5,-40(s0)
    lock()
    8000190c:	fcf43823          	sd	a5,-48(s0)
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80001910:	00200793          	li	a5,2
    80001914:	1007b073          	csrc	sstatus,a5
    80001918:	0284a783          	lw	a5,40(s1)
    while (!blockedThreadQueue.isEmpty())
    8000191c:	00078a63          	beqz	a5,80001930 <_ZN15KernelSemaphoreD1Ev+0x54>
        deblock();
    80001920:	00048513          	mv	a0,s1
    80001924:	00000097          	auipc	ra,0x0
    80001928:	f18080e7          	jalr	-232(ra) # 8000183c <_ZN15KernelSemaphore7deblockEv>
    while (!blockedThreadQueue.isEmpty())
    8000192c:	fedff06f          	j	80001918 <_ZN15KernelSemaphoreD1Ev+0x3c>
    unlock()
    80001930:	fd043783          	ld	a5,-48(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80001934:	10079073          	csrw	sstatus,a5
    val = 0;
    80001938:	0004a423          	sw	zero,8(s1)
KernelSemaphore::~KernelSemaphore() {
    8000193c:	01048513          	addi	a0,s1,16
    80001940:	00002097          	auipc	ra,0x2
    80001944:	50c080e7          	jalr	1292(ra) # 80003e4c <_ZN10ThreadListD1Ev>
}
    80001948:	02813083          	ld	ra,40(sp)
    8000194c:	02013403          	ld	s0,32(sp)
    80001950:	01813483          	ld	s1,24(sp)
    80001954:	03010113          	addi	sp,sp,48
    80001958:	00008067          	ret

000000008000195c <_ZN15KernelSemaphoreD0Ev>:
KernelSemaphore::~KernelSemaphore() {
    8000195c:	fe010113          	addi	sp,sp,-32
    80001960:	00113c23          	sd	ra,24(sp)
    80001964:	00813823          	sd	s0,16(sp)
    80001968:	00913423          	sd	s1,8(sp)
    8000196c:	02010413          	addi	s0,sp,32
    80001970:	00050493          	mv	s1,a0
}
    80001974:	00000097          	auipc	ra,0x0
    80001978:	f68080e7          	jalr	-152(ra) # 800018dc <_ZN15KernelSemaphoreD1Ev>
        kfree(addr);
    8000197c:	00048513          	mv	a0,s1
    80001980:	00000097          	auipc	ra,0x0
    80001984:	5f4080e7          	jalr	1524(ra) # 80001f74 <_Z5kfreePv>
    80001988:	01813083          	ld	ra,24(sp)
    8000198c:	01013403          	ld	s0,16(sp)
    80001990:	00813483          	ld	s1,8(sp)
    80001994:	02010113          	addi	sp,sp,32
    80001998:	00008067          	ret

000000008000199c <_ZZ4mainENUlPvE_4_FUNES_>:
    kprintString("Starting main\n");
    TCB *main = TCB::createKernelThread();
    kprintString("Created main thread\n");
    TCB::running = main;

    TCB *uMain = TCB::createUserThread([](void *){userMain();}, nullptr);
    8000199c:	ff010113          	addi	sp,sp,-16
    800019a0:	00113423          	sd	ra,8(sp)
    800019a4:	00813023          	sd	s0,0(sp)
    800019a8:	01010413          	addi	s0,sp,16
    800019ac:	00004097          	auipc	ra,0x4
    800019b0:	b9c080e7          	jalr	-1124(ra) # 80005548 <_Z8userMainv>
    800019b4:	00813083          	ld	ra,8(sp)
    800019b8:	00013403          	ld	s0,0(sp)
    800019bc:	01010113          	addi	sp,sp,16
    800019c0:	00008067          	ret

00000000800019c4 <main>:
int main() {
    800019c4:	fe010113          	addi	sp,sp,-32
    800019c8:	00113c23          	sd	ra,24(sp)
    800019cc:	00813823          	sd	s0,16(sp)
    800019d0:	00913423          	sd	s1,8(sp)
    800019d4:	01213023          	sd	s2,0(sp)
    800019d8:	02010413          	addi	s0,sp,32
    kprintString("Starting main\n");
    800019dc:	00006517          	auipc	a0,0x6
    800019e0:	76c50513          	addi	a0,a0,1900 # 80008148 <CONSOLE_STATUS+0x138>
    800019e4:	00001097          	auipc	ra,0x1
    800019e8:	424080e7          	jalr	1060(ra) # 80002e08 <_Z12kprintStringPKc>
        return kmalloc(size);
    800019ec:	00400513          	li	a0,4
    800019f0:	00000097          	auipc	ra,0x0
    800019f4:	37c080e7          	jalr	892(ra) # 80001d6c <_Z7kmallocm>
    800019f8:	00050493          	mv	s1,a0
    800019fc:	00002097          	auipc	ra,0x2
    80001a00:	854080e7          	jalr	-1964(ra) # 80003250 <_ZN3TCBC1Ev>
    kprintString("Created main thread\n");
    80001a04:	00006517          	auipc	a0,0x6
    80001a08:	75450513          	addi	a0,a0,1876 # 80008158 <CONSOLE_STATUS+0x148>
    80001a0c:	00001097          	auipc	ra,0x1
    80001a10:	3fc080e7          	jalr	1020(ra) # 80002e08 <_Z12kprintStringPKc>
    TCB::running = main;
    80001a14:	00009797          	auipc	a5,0x9
    80001a18:	bb47b783          	ld	a5,-1100(a5) # 8000a5c8 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001a1c:	0097b023          	sd	s1,0(a5)
    TCB *uMain = TCB::createUserThread([](void *){userMain();}, nullptr);
    80001a20:	00000593          	li	a1,0
    80001a24:	00000517          	auipc	a0,0x0
    80001a28:	f7850513          	addi	a0,a0,-136 # 8000199c <_ZZ4mainENUlPvE_4_FUNES_>
    80001a2c:	00002097          	auipc	ra,0x2
    80001a30:	bb4080e7          	jalr	-1100(ra) # 800035e0 <_ZN3TCB16createUserThreadEPFvPvES0_>
    80001a34:	00050493          	mv	s1,a0
    kprintString("Created user main thread\n");
    80001a38:	00006517          	auipc	a0,0x6
    80001a3c:	73850513          	addi	a0,a0,1848 # 80008170 <CONSOLE_STATUS+0x160>
    80001a40:	00001097          	auipc	ra,0x1
    80001a44:	3c8080e7          	jalr	968(ra) # 80002e08 <_Z12kprintStringPKc>

    Riscv::w_stvec((uint64) &Riscv::supervisorTrap);
    80001a48:	00009797          	auipc	a5,0x9
    80001a4c:	b587b783          	ld	a5,-1192(a5) # 8000a5a0 <_GLOBAL_OFFSET_TABLE_+0x10>
    __asm__ volatile ("csrw stvec, %[stvec]" : : [stvec] "r"(stvec));
    80001a50:	10579073          	csrw	stvec,a5

    uMain->join();
    80001a54:	00048513          	mv	a0,s1
    80001a58:	00002097          	auipc	ra,0x2
    80001a5c:	d3c080e7          	jalr	-708(ra) # 80003794 <_ZN3TCB4joinEv>
        __asm__ volatile ("ecall");
    80001a60:	00000073          	ecall
    TCB::yield();

    delete ThreadCollector::getInstance();
    80001a64:	00002097          	auipc	ra,0x2
    80001a68:	fec080e7          	jalr	-20(ra) # 80003a50 <_ZN15ThreadCollector11getInstanceEv>
    80001a6c:	00050493          	mv	s1,a0
    80001a70:	00050c63          	beqz	a0,80001a88 <main+0xc4>
    80001a74:	00002097          	auipc	ra,0x2
    80001a78:	f20080e7          	jalr	-224(ra) # 80003994 <_ZN15ThreadCollectorD1Ev>
        kfree(addr);
    80001a7c:	00048513          	mv	a0,s1
    80001a80:	00000097          	auipc	ra,0x0
    80001a84:	4f4080e7          	jalr	1268(ra) # 80001f74 <_Z5kfreePv>
    delete IdleThread::getInstance();
    80001a88:	fffff097          	auipc	ra,0xfffff
    80001a8c:	768080e7          	jalr	1896(ra) # 800011f0 <_ZN10IdleThread11getInstanceEv>
    80001a90:	00050493          	mv	s1,a0
    80001a94:	00050c63          	beqz	a0,80001aac <main+0xe8>
    80001a98:	00000097          	auipc	ra,0x0
    80001a9c:	814080e7          	jalr	-2028(ra) # 800012ac <_ZN10IdleThreadD1Ev>
    80001aa0:	00048513          	mv	a0,s1
    80001aa4:	00000097          	auipc	ra,0x0
    80001aa8:	4d0080e7          	jalr	1232(ra) # 80001f74 <_Z5kfreePv>
    delete TimerInterrupt::getInstance();
    80001aac:	00002097          	auipc	ra,0x2
    80001ab0:	3b8080e7          	jalr	952(ra) # 80003e64 <_ZN14TimerInterrupt11getInstanceEv>
    80001ab4:	00050493          	mv	s1,a0
    80001ab8:	00050c63          	beqz	a0,80001ad0 <main+0x10c>
    80001abc:	00002097          	auipc	ra,0x2
    80001ac0:	604080e7          	jalr	1540(ra) # 800040c0 <_ZN14TimerInterruptD1Ev>
    80001ac4:	00048513          	mv	a0,s1
    80001ac8:	00000097          	auipc	ra,0x0
    80001acc:	4ac080e7          	jalr	1196(ra) # 80001f74 <_Z5kfreePv>
    delete Scheduler::getInstance();
    80001ad0:	00001097          	auipc	ra,0x1
    80001ad4:	8b8080e7          	jalr	-1864(ra) # 80002388 <_ZN9Scheduler11getInstanceEv>
    80001ad8:	00050493          	mv	s1,a0
    80001adc:	00050c63          	beqz	a0,80001af4 <main+0x130>
    80001ae0:	00001097          	auipc	ra,0x1
    80001ae4:	a10080e7          	jalr	-1520(ra) # 800024f0 <_ZN9SchedulerD1Ev>
    80001ae8:	00048513          	mv	a0,s1
    80001aec:	00000097          	auipc	ra,0x0
    80001af0:	488080e7          	jalr	1160(ra) # 80001f74 <_Z5kfreePv>

    kprintString("Main finished\n");
    80001af4:	00006517          	auipc	a0,0x6
    80001af8:	69c50513          	addi	a0,a0,1692 # 80008190 <CONSOLE_STATUS+0x180>
    80001afc:	00001097          	auipc	ra,0x1
    80001b00:	30c080e7          	jalr	780(ra) # 80002e08 <_Z12kprintStringPKc>

    return 0;
}
    80001b04:	00000513          	li	a0,0
    80001b08:	01813083          	ld	ra,24(sp)
    80001b0c:	01013403          	ld	s0,16(sp)
    80001b10:	00813483          	ld	s1,8(sp)
    80001b14:	00013903          	ld	s2,0(sp)
    80001b18:	02010113          	addi	sp,sp,32
    80001b1c:	00008067          	ret
    80001b20:	00050913          	mv	s2,a0
    80001b24:	00048513          	mv	a0,s1
    80001b28:	00000097          	auipc	ra,0x0
    80001b2c:	44c080e7          	jalr	1100(ra) # 80001f74 <_Z5kfreePv>
    80001b30:	00090513          	mv	a0,s2
    80001b34:	0000a097          	auipc	ra,0xa
    80001b38:	c04080e7          	jalr	-1020(ra) # 8000b738 <_Unwind_Resume>

0000000080001b3c <_ZN15MemoryAllocatornwEm>:

int kfree(void *addr) {
    return MemoryAllocator::getInstance()->free(addr);
}

void *MemoryAllocator::operator new(size_t) {
    80001b3c:	ff010113          	addi	sp,sp,-16
    80001b40:	00813423          	sd	s0,8(sp)
    80001b44:	01010413          	addi	s0,sp,16
    return (void *) HEAP_START_ADDR;
}
    80001b48:	00009797          	auipc	a5,0x9
    80001b4c:	a507b783          	ld	a5,-1456(a5) # 8000a598 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001b50:	0007b503          	ld	a0,0(a5)
    80001b54:	00813403          	ld	s0,8(sp)
    80001b58:	01010113          	addi	sp,sp,16
    80001b5c:	00008067          	ret

0000000080001b60 <_ZN15MemoryAllocatorC1Ev>:

MemoryAllocator::MemoryAllocator() {
    80001b60:	ff010113          	addi	sp,sp,-16
    80001b64:	00813423          	sd	s0,8(sp)
    80001b68:	01010413          	addi	s0,sp,16
    80001b6c:	00100713          	li	a4,1
    80001b70:	00e52823          	sw	a4,16(a0)
    explicit ThreadList() = default;
    80001b74:	00053c23          	sd	zero,24(a0)
    80001b78:	02053023          	sd	zero,32(a0)
    80001b7c:	02053423          	sd	zero,40(a0)
    80001b80:	02052823          	sw	zero,48(a0)

class TCB;

#include "KernelSemaphore.h"

class Mutex : public KernelSemaphore {
    80001b84:	00009797          	auipc	a5,0x9
    80001b88:	a3c7b783          	ld	a5,-1476(a5) # 8000a5c0 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001b8c:	01078793          	addi	a5,a5,16
    80001b90:	00f53423          	sd	a5,8(a0)
    80001b94:	02053c23          	sd	zero,56(a0)
    freeMemHead = (BlockHeader *) ((uint8 *) HEAP_START_ADDR + sizeof(MemoryAllocator));
    80001b98:	00009617          	auipc	a2,0x9
    80001b9c:	a0063603          	ld	a2,-1536(a2) # 8000a598 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001ba0:	00063683          	ld	a3,0(a2)
    80001ba4:	04068793          	addi	a5,a3,64
    80001ba8:	00f53023          	sd	a5,0(a0)
    freeMemHead->size = (size_t) ((uint8 *) HEAP_END_ADDR - (uint8 *) HEAP_START_ADDR -
    80001bac:	00009797          	auipc	a5,0x9
    80001bb0:	a247b783          	ld	a5,-1500(a5) # 8000a5d0 <_GLOBAL_OFFSET_TABLE_+0x40>
    80001bb4:	0007b783          	ld	a5,0(a5)
    80001bb8:	00063603          	ld	a2,0(a2)
    80001bbc:	40c787b3          	sub	a5,a5,a2
                                            sizeof(MemoryAllocator) - sizeof(BlockHeader));
    80001bc0:	fa878793          	addi	a5,a5,-88
    freeMemHead->size = (size_t) ((uint8 *) HEAP_END_ADDR - (uint8 *) HEAP_START_ADDR -
    80001bc4:	04f6b023          	sd	a5,64(a3)
    freeMemHead->free = true;
    80001bc8:	00053783          	ld	a5,0(a0)
    80001bcc:	00e78423          	sb	a4,8(a5)
    freeMemHead->next = nullptr;
    80001bd0:	00053783          	ld	a5,0(a0)
    80001bd4:	0007b823          	sd	zero,16(a5)
}
    80001bd8:	00813403          	ld	s0,8(sp)
    80001bdc:	01010113          	addi	sp,sp,16
    80001be0:	00008067          	ret

0000000080001be4 <_ZN15MemoryAllocator11getInstanceEv>:

MemoryAllocator *MemoryAllocator::getInstance() {
    if (!instance) instance = new MemoryAllocator;
    80001be4:	00009797          	auipc	a5,0x9
    80001be8:	a447b783          	ld	a5,-1468(a5) # 8000a628 <_ZN15MemoryAllocator8instanceE>
    80001bec:	00078863          	beqz	a5,80001bfc <_ZN15MemoryAllocator11getInstanceEv+0x18>

    return instance;
}
    80001bf0:	00009517          	auipc	a0,0x9
    80001bf4:	a3853503          	ld	a0,-1480(a0) # 8000a628 <_ZN15MemoryAllocator8instanceE>
    80001bf8:	00008067          	ret
MemoryAllocator *MemoryAllocator::getInstance() {
    80001bfc:	fe010113          	addi	sp,sp,-32
    80001c00:	00113c23          	sd	ra,24(sp)
    80001c04:	00813823          	sd	s0,16(sp)
    80001c08:	00913423          	sd	s1,8(sp)
    80001c0c:	02010413          	addi	s0,sp,32
    if (!instance) instance = new MemoryAllocator;
    80001c10:	04000513          	li	a0,64
    80001c14:	00000097          	auipc	ra,0x0
    80001c18:	f28080e7          	jalr	-216(ra) # 80001b3c <_ZN15MemoryAllocatornwEm>
    80001c1c:	00050493          	mv	s1,a0
    80001c20:	00000097          	auipc	ra,0x0
    80001c24:	f40080e7          	jalr	-192(ra) # 80001b60 <_ZN15MemoryAllocatorC1Ev>
    80001c28:	00009797          	auipc	a5,0x9
    80001c2c:	a097b023          	sd	s1,-1536(a5) # 8000a628 <_ZN15MemoryAllocator8instanceE>
}
    80001c30:	00009517          	auipc	a0,0x9
    80001c34:	9f853503          	ld	a0,-1544(a0) # 8000a628 <_ZN15MemoryAllocator8instanceE>
    80001c38:	01813083          	ld	ra,24(sp)
    80001c3c:	01013403          	ld	s0,16(sp)
    80001c40:	00813483          	ld	s1,8(sp)
    80001c44:	02010113          	addi	sp,sp,32
    80001c48:	00008067          	ret

0000000080001c4c <_ZN15MemoryAllocator6mallocEm>:

void *MemoryAllocator::malloc(size_t size) {
    80001c4c:	fd010113          	addi	sp,sp,-48
    80001c50:	02113423          	sd	ra,40(sp)
    80001c54:	02813023          	sd	s0,32(sp)
    80001c58:	00913c23          	sd	s1,24(sp)
    80001c5c:	01213823          	sd	s2,16(sp)
    80001c60:	01313423          	sd	s3,8(sp)
    80001c64:	01413023          	sd	s4,0(sp)
    80001c68:	03010413          	addi	s0,sp,48
    // Initial check
    if (!size) return 0;
    80001c6c:	0e058c63          	beqz	a1,80001d64 <_ZN15MemoryAllocator6mallocEm+0x118>
    80001c70:	00050993          	mv	s3,a0

    // Rounding and aligning size to size of memory blocks
    size *= MEM_BLOCK_SIZE;
    80001c74:	00659913          	slli	s2,a1,0x6

    mutex.wait();
    80001c78:	00850a13          	addi	s4,a0,8
    80001c7c:	000a0513          	mv	a0,s4
    80001c80:	00000097          	auipc	ra,0x0
    80001c84:	334080e7          	jalr	820(ra) # 80001fb4 <_ZN5Mutex4waitEv>
    // Finding suitable free memory block using first fit algorithm
    BlockHeader *curr = freeMemHead, *prev = nullptr;
    80001c88:	0009b483          	ld	s1,0(s3)
    80001c8c:	00000713          	li	a4,0
    int i = 0;
    while (curr && curr->size < size)
    80001c90:	00048c63          	beqz	s1,80001ca8 <_ZN15MemoryAllocator6mallocEm+0x5c>
    80001c94:	0004b783          	ld	a5,0(s1)
    80001c98:	0127f863          	bgeu	a5,s2,80001ca8 <_ZN15MemoryAllocator6mallocEm+0x5c>
        prev = curr, curr = curr->next, i++;
    80001c9c:	00048713          	mv	a4,s1
    80001ca0:	0104b483          	ld	s1,16(s1)
    while (curr && curr->size < size)
    80001ca4:	fedff06f          	j	80001c90 <_ZN15MemoryAllocator6mallocEm+0x44>
    if (!curr)  {
    80001ca8:	04048463          	beqz	s1,80001cf0 <_ZN15MemoryAllocator6mallocEm+0xa4>
        mutex.signal();
        return nullptr;
    }

    size_t remainingSize = curr->size - size;
    80001cac:	0004b783          	ld	a5,0(s1)
    80001cb0:	412787b3          	sub	a5,a5,s2
    curr->size = size;
    80001cb4:	0124b023          	sd	s2,0(s1)
    curr->free = false;
    80001cb8:	00048423          	sb	zero,8(s1)

    // Allocating new free memory block if enough size is left over
    if (remainingSize >= MEM_BLOCK_SIZE + sizeof(BlockHeader)) {
    80001cbc:	05700693          	li	a3,87
    80001cc0:	04f6f463          	bgeu	a3,a5,80001d08 <_ZN15MemoryAllocator6mallocEm+0xbc>
        BlockHeader *elem = (BlockHeader *) ((uint8 *) curr + sizeof(BlockHeader) + size);
    80001cc4:	01890913          	addi	s2,s2,24
    80001cc8:	01248933          	add	s2,s1,s2
        elem->size = remainingSize - sizeof(BlockHeader);
    80001ccc:	fe878793          	addi	a5,a5,-24
    80001cd0:	00f93023          	sd	a5,0(s2)
        elem->free = true;
    80001cd4:	00100793          	li	a5,1
    80001cd8:	00f90423          	sb	a5,8(s2)
        elem->next = curr->next;
    80001cdc:	0104b783          	ld	a5,16(s1)
    80001ce0:	00f93823          	sd	a5,16(s2)
        (!prev ? freeMemHead : prev->next) = elem;
    80001ce4:	00070e63          	beqz	a4,80001d00 <_ZN15MemoryAllocator6mallocEm+0xb4>
    80001ce8:	01273823          	sd	s2,16(a4)
    80001cec:	0340006f          	j	80001d20 <_ZN15MemoryAllocator6mallocEm+0xd4>
        mutex.signal();
    80001cf0:	000a0513          	mv	a0,s4
    80001cf4:	00000097          	auipc	ra,0x0
    80001cf8:	340080e7          	jalr	832(ra) # 80002034 <_ZN5Mutex6signalEv>
        return nullptr;
    80001cfc:	0380006f          	j	80001d34 <_ZN15MemoryAllocator6mallocEm+0xe8>
        (!prev ? freeMemHead : prev->next) = elem;
    80001d00:	0129b023          	sd	s2,0(s3)
    80001d04:	01c0006f          	j	80001d20 <_ZN15MemoryAllocator6mallocEm+0xd4>
    } else {
        // Removing whole free memory block from free memory list
        (!prev ? freeMemHead : prev->next) = curr->next;
    80001d08:	04070863          	beqz	a4,80001d58 <_ZN15MemoryAllocator6mallocEm+0x10c>
    80001d0c:	0104b683          	ld	a3,16(s1)
    80001d10:	00d73823          	sd	a3,16(a4)
        curr->size += remainingSize;
    80001d14:	0004b703          	ld	a4,0(s1)
    80001d18:	00f707b3          	add	a5,a4,a5
    80001d1c:	00f4b023          	sd	a5,0(s1)
    }
    curr->next = nullptr;
    80001d20:	0004b823          	sd	zero,16(s1)

    // Free memory start address after segment descriptor of allocated memory block
    void *addr = (uint8 *) curr + sizeof(BlockHeader);
    80001d24:	01848493          	addi	s1,s1,24

    mutex.signal();
    80001d28:	000a0513          	mv	a0,s4
    80001d2c:	00000097          	auipc	ra,0x0
    80001d30:	308080e7          	jalr	776(ra) # 80002034 <_ZN5Mutex6signalEv>

    return addr;
}
    80001d34:	00048513          	mv	a0,s1
    80001d38:	02813083          	ld	ra,40(sp)
    80001d3c:	02013403          	ld	s0,32(sp)
    80001d40:	01813483          	ld	s1,24(sp)
    80001d44:	01013903          	ld	s2,16(sp)
    80001d48:	00813983          	ld	s3,8(sp)
    80001d4c:	00013a03          	ld	s4,0(sp)
    80001d50:	03010113          	addi	sp,sp,48
    80001d54:	00008067          	ret
        (!prev ? freeMemHead : prev->next) = curr->next;
    80001d58:	0104b703          	ld	a4,16(s1)
    80001d5c:	00e9b023          	sd	a4,0(s3)
    80001d60:	fb5ff06f          	j	80001d14 <_ZN15MemoryAllocator6mallocEm+0xc8>
    if (!size) return 0;
    80001d64:	00000493          	li	s1,0
    80001d68:	fcdff06f          	j	80001d34 <_ZN15MemoryAllocator6mallocEm+0xe8>

0000000080001d6c <_Z7kmallocm>:
void *kmalloc(size_t size) {
    80001d6c:	fe010113          	addi	sp,sp,-32
    80001d70:	00113c23          	sd	ra,24(sp)
    80001d74:	00813823          	sd	s0,16(sp)
    80001d78:	00913423          	sd	s1,8(sp)
    80001d7c:	02010413          	addi	s0,sp,32
    80001d80:	00050493          	mv	s1,a0
    return MemoryAllocator::getInstance()->malloc(size);
    80001d84:	00000097          	auipc	ra,0x0
    80001d88:	e60080e7          	jalr	-416(ra) # 80001be4 <_ZN15MemoryAllocator11getInstanceEv>
    80001d8c:	00048593          	mv	a1,s1
    80001d90:	00000097          	auipc	ra,0x0
    80001d94:	ebc080e7          	jalr	-324(ra) # 80001c4c <_ZN15MemoryAllocator6mallocEm>
}
    80001d98:	01813083          	ld	ra,24(sp)
    80001d9c:	01013403          	ld	s0,16(sp)
    80001da0:	00813483          	ld	s1,8(sp)
    80001da4:	02010113          	addi	sp,sp,32
    80001da8:	00008067          	ret

0000000080001dac <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE>:
    mutex.signal();

    return 0;
}

int MemoryAllocator::tryToJoin(MemoryAllocator::BlockHeader *curr) {
    80001dac:	ff010113          	addi	sp,sp,-16
    80001db0:	00813423          	sd	s0,8(sp)
    80001db4:	01010413          	addi	s0,sp,16
    if (!curr || !curr->next) return -1;
    80001db8:	04050263          	beqz	a0,80001dfc <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE+0x50>
    80001dbc:	01053703          	ld	a4,16(a0)
    80001dc0:	04070263          	beqz	a4,80001e04 <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE+0x58>

    if ((uint8 *) curr + sizeof(BlockHeader) + curr->size != (uint8 *) curr->next) return -2;
    80001dc4:	00053783          	ld	a5,0(a0)
    80001dc8:	01878693          	addi	a3,a5,24
    80001dcc:	00d506b3          	add	a3,a0,a3
    80001dd0:	02d71e63          	bne	a4,a3,80001e0c <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE+0x60>

    curr->size += curr->next->size + sizeof(BlockHeader);
    80001dd4:	00073683          	ld	a3,0(a4)
    80001dd8:	00d787b3          	add	a5,a5,a3
    80001ddc:	01878793          	addi	a5,a5,24
    80001de0:	00f53023          	sd	a5,0(a0)
    curr->next = curr->next->next;
    80001de4:	01073783          	ld	a5,16(a4)
    80001de8:	00f53823          	sd	a5,16(a0)

    return 0;
    80001dec:	00000513          	li	a0,0
}
    80001df0:	00813403          	ld	s0,8(sp)
    80001df4:	01010113          	addi	sp,sp,16
    80001df8:	00008067          	ret
    if (!curr || !curr->next) return -1;
    80001dfc:	fff00513          	li	a0,-1
    80001e00:	ff1ff06f          	j	80001df0 <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE+0x44>
    80001e04:	fff00513          	li	a0,-1
    80001e08:	fe9ff06f          	j	80001df0 <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE+0x44>
    if ((uint8 *) curr + sizeof(BlockHeader) + curr->size != (uint8 *) curr->next) return -2;
    80001e0c:	ffe00513          	li	a0,-2
    80001e10:	fe1ff06f          	j	80001df0 <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE+0x44>

0000000080001e14 <_ZN15MemoryAllocator4freeEPv>:
    if (!addr
    80001e14:	12058063          	beqz	a1,80001f34 <_ZN15MemoryAllocator4freeEPv+0x120>
int MemoryAllocator::free(void *addr) {
    80001e18:	fc010113          	addi	sp,sp,-64
    80001e1c:	02113c23          	sd	ra,56(sp)
    80001e20:	02813823          	sd	s0,48(sp)
    80001e24:	02913423          	sd	s1,40(sp)
    80001e28:	03213023          	sd	s2,32(sp)
    80001e2c:	01313c23          	sd	s3,24(sp)
    80001e30:	01413823          	sd	s4,16(sp)
    80001e34:	01513423          	sd	s5,8(sp)
    80001e38:	04010413          	addi	s0,sp,64
    80001e3c:	00050a13          	mv	s4,a0
    80001e40:	00058913          	mv	s2,a1
        || (uint8 *) addr < (uint8 *) HEAP_START_ADDR + sizeof(MemoryAllocator) + sizeof(BlockHeader) + sizeof(Mutex)
    80001e44:	00008797          	auipc	a5,0x8
    80001e48:	7547b783          	ld	a5,1876(a5) # 8000a598 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001e4c:	0007b783          	ld	a5,0(a5)
    80001e50:	09078793          	addi	a5,a5,144
    80001e54:	0ef5e463          	bltu	a1,a5,80001f3c <_ZN15MemoryAllocator4freeEPv+0x128>
        || addr >= HEAP_END_ADDR) {
    80001e58:	00008797          	auipc	a5,0x8
    80001e5c:	7787b783          	ld	a5,1912(a5) # 8000a5d0 <_GLOBAL_OFFSET_TABLE_+0x40>
    80001e60:	0007b783          	ld	a5,0(a5)
    80001e64:	0ef5f063          	bgeu	a1,a5,80001f44 <_ZN15MemoryAllocator4freeEPv+0x130>
    BlockHeader *elem = (BlockHeader *) ((uint8 *) addr - sizeof(BlockHeader));
    80001e68:	fe858993          	addi	s3,a1,-24
    if (!elem || elem->free || elem->next) {
    80001e6c:	0e098063          	beqz	s3,80001f4c <_ZN15MemoryAllocator4freeEPv+0x138>
    80001e70:	ff05c783          	lbu	a5,-16(a1)
    80001e74:	0e079063          	bnez	a5,80001f54 <_ZN15MemoryAllocator4freeEPv+0x140>
    80001e78:	ff85b483          	ld	s1,-8(a1)
    80001e7c:	0e049063          	bnez	s1,80001f5c <_ZN15MemoryAllocator4freeEPv+0x148>
    mutex.wait();
    80001e80:	00850a93          	addi	s5,a0,8
    80001e84:	000a8513          	mv	a0,s5
    80001e88:	00000097          	auipc	ra,0x0
    80001e8c:	12c080e7          	jalr	300(ra) # 80001fb4 <_ZN5Mutex4waitEv>
    BlockHeader *curr = freeMemHead, *prev = nullptr;
    80001e90:	000a3783          	ld	a5,0(s4)
    while (curr && curr < elem)
    80001e94:	00078a63          	beqz	a5,80001ea8 <_ZN15MemoryAllocator4freeEPv+0x94>
    80001e98:	0137f863          	bgeu	a5,s3,80001ea8 <_ZN15MemoryAllocator4freeEPv+0x94>
        prev = curr, curr = curr->next;
    80001e9c:	00078493          	mv	s1,a5
    80001ea0:	0107b783          	ld	a5,16(a5)
    while (curr && curr < elem)
    80001ea4:	ff1ff06f          	j	80001e94 <_ZN15MemoryAllocator4freeEPv+0x80>
    if ((prev && (uint8 *) prev + prev->size + sizeof(BlockHeader) > addr)
    80001ea8:	00048a63          	beqz	s1,80001ebc <_ZN15MemoryAllocator4freeEPv+0xa8>
    80001eac:	0004b703          	ld	a4,0(s1)
    80001eb0:	01870713          	addi	a4,a4,24
    80001eb4:	00e48733          	add	a4,s1,a4
    80001eb8:	0ae96663          	bltu	s2,a4,80001f64 <_ZN15MemoryAllocator4freeEPv+0x150>
        || (curr && (uint8 *) addr + elem->size  > (uint8 *) curr)) {
    80001ebc:	00078863          	beqz	a5,80001ecc <_ZN15MemoryAllocator4freeEPv+0xb8>
    80001ec0:	fe893703          	ld	a4,-24(s2)
    80001ec4:	00e90733          	add	a4,s2,a4
    80001ec8:	0ae7e263          	bltu	a5,a4,80001f6c <_ZN15MemoryAllocator4freeEPv+0x158>
    elem->next = curr;
    80001ecc:	fef93c23          	sd	a5,-8(s2)
    elem->free = true;
    80001ed0:	00100793          	li	a5,1
    80001ed4:	fef90823          	sb	a5,-16(s2)
    (!prev ? freeMemHead : prev->next) = elem;
    80001ed8:	04048a63          	beqz	s1,80001f2c <_ZN15MemoryAllocator4freeEPv+0x118>
    80001edc:	0134b823          	sd	s3,16(s1)
    tryToJoin(elem);
    80001ee0:	00098513          	mv	a0,s3
    80001ee4:	00000097          	auipc	ra,0x0
    80001ee8:	ec8080e7          	jalr	-312(ra) # 80001dac <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE>
    tryToJoin(prev);
    80001eec:	00048513          	mv	a0,s1
    80001ef0:	00000097          	auipc	ra,0x0
    80001ef4:	ebc080e7          	jalr	-324(ra) # 80001dac <_ZN15MemoryAllocator9tryToJoinEPNS_11BlockHeaderE>
    mutex.signal();
    80001ef8:	000a8513          	mv	a0,s5
    80001efc:	00000097          	auipc	ra,0x0
    80001f00:	138080e7          	jalr	312(ra) # 80002034 <_ZN5Mutex6signalEv>
    return 0;
    80001f04:	00000513          	li	a0,0
}
    80001f08:	03813083          	ld	ra,56(sp)
    80001f0c:	03013403          	ld	s0,48(sp)
    80001f10:	02813483          	ld	s1,40(sp)
    80001f14:	02013903          	ld	s2,32(sp)
    80001f18:	01813983          	ld	s3,24(sp)
    80001f1c:	01013a03          	ld	s4,16(sp)
    80001f20:	00813a83          	ld	s5,8(sp)
    80001f24:	04010113          	addi	sp,sp,64
    80001f28:	00008067          	ret
    (!prev ? freeMemHead : prev->next) = elem;
    80001f2c:	013a3023          	sd	s3,0(s4)
    80001f30:	fb1ff06f          	j	80001ee0 <_ZN15MemoryAllocator4freeEPv+0xcc>
        return -1;
    80001f34:	fff00513          	li	a0,-1
}
    80001f38:	00008067          	ret
        return -1;
    80001f3c:	fff00513          	li	a0,-1
    80001f40:	fc9ff06f          	j	80001f08 <_ZN15MemoryAllocator4freeEPv+0xf4>
    80001f44:	fff00513          	li	a0,-1
    80001f48:	fc1ff06f          	j	80001f08 <_ZN15MemoryAllocator4freeEPv+0xf4>
        return -2;
    80001f4c:	ffe00513          	li	a0,-2
    80001f50:	fb9ff06f          	j	80001f08 <_ZN15MemoryAllocator4freeEPv+0xf4>
    80001f54:	ffe00513          	li	a0,-2
    80001f58:	fb1ff06f          	j	80001f08 <_ZN15MemoryAllocator4freeEPv+0xf4>
    80001f5c:	ffe00513          	li	a0,-2
    80001f60:	fa9ff06f          	j	80001f08 <_ZN15MemoryAllocator4freeEPv+0xf4>
        return -2;
    80001f64:	ffe00513          	li	a0,-2
    80001f68:	fa1ff06f          	j	80001f08 <_ZN15MemoryAllocator4freeEPv+0xf4>
    80001f6c:	ffe00513          	li	a0,-2
    80001f70:	f99ff06f          	j	80001f08 <_ZN15MemoryAllocator4freeEPv+0xf4>

0000000080001f74 <_Z5kfreePv>:
int kfree(void *addr) {
    80001f74:	fe010113          	addi	sp,sp,-32
    80001f78:	00113c23          	sd	ra,24(sp)
    80001f7c:	00813823          	sd	s0,16(sp)
    80001f80:	00913423          	sd	s1,8(sp)
    80001f84:	02010413          	addi	s0,sp,32
    80001f88:	00050493          	mv	s1,a0
    return MemoryAllocator::getInstance()->free(addr);
    80001f8c:	00000097          	auipc	ra,0x0
    80001f90:	c58080e7          	jalr	-936(ra) # 80001be4 <_ZN15MemoryAllocator11getInstanceEv>
    80001f94:	00048593          	mv	a1,s1
    80001f98:	00000097          	auipc	ra,0x0
    80001f9c:	e7c080e7          	jalr	-388(ra) # 80001e14 <_ZN15MemoryAllocator4freeEPv>
}
    80001fa0:	01813083          	ld	ra,24(sp)
    80001fa4:	01013403          	ld	s0,16(sp)
    80001fa8:	00813483          	ld	s1,8(sp)
    80001fac:	02010113          	addi	sp,sp,32
    80001fb0:	00008067          	ret

0000000080001fb4 <_ZN5Mutex4waitEv>:
#include "../h/Mutex.h"
#include "../h/TCB.h"
#include "../h/Riscv.h"

void Mutex::wait() {
    if (holder == TCB::running) return;
    80001fb4:	03053703          	ld	a4,48(a0)
    80001fb8:	00008797          	auipc	a5,0x8
    80001fbc:	6107b783          	ld	a5,1552(a5) # 8000a5c8 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001fc0:	0007b783          	ld	a5,0(a5)
    80001fc4:	06f70663          	beq	a4,a5,80002030 <_ZN5Mutex4waitEv+0x7c>
void Mutex::wait() {
    80001fc8:	fd010113          	addi	sp,sp,-48
    80001fcc:	02113423          	sd	ra,40(sp)
    80001fd0:	02813023          	sd	s0,32(sp)
    80001fd4:	00913c23          	sd	s1,24(sp)
    80001fd8:	03010413          	addi	s0,sp,48
    80001fdc:	00050493          	mv	s1,a0
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80001fe0:	100027f3          	csrr	a5,sstatus
    80001fe4:	fcf43823          	sd	a5,-48(s0)
    return sstatus;
    80001fe8:	fd043783          	ld	a5,-48(s0)
    lock()
    80001fec:	fcf43c23          	sd	a5,-40(s0)
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80001ff0:	00200793          	li	a5,2
    80001ff4:	1007b073          	csrc	sstatus,a5
    if (holder) block();
    80001ff8:	00070663          	beqz	a4,80002004 <_ZN5Mutex4waitEv+0x50>
    80001ffc:	fffff097          	auipc	ra,0xfffff
    80002000:	788080e7          	jalr	1928(ra) # 80001784 <_ZN15KernelSemaphore5blockEv>
    holder = TCB::running;
    80002004:	00008797          	auipc	a5,0x8
    80002008:	5c47b783          	ld	a5,1476(a5) # 8000a5c8 <_GLOBAL_OFFSET_TABLE_+0x38>
    8000200c:	0007b783          	ld	a5,0(a5)
    80002010:	02f4b823          	sd	a5,48(s1)
    unlock()
    80002014:	fd843783          	ld	a5,-40(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80002018:	10079073          	csrw	sstatus,a5
}
    8000201c:	02813083          	ld	ra,40(sp)
    80002020:	02013403          	ld	s0,32(sp)
    80002024:	01813483          	ld	s1,24(sp)
    80002028:	03010113          	addi	sp,sp,48
    8000202c:	00008067          	ret
    80002030:	00008067          	ret

0000000080002034 <_ZN5Mutex6signalEv>:

void Mutex::signal() {
    if (holder != TCB::running) return;
    80002034:	03053703          	ld	a4,48(a0)
    80002038:	00008797          	auipc	a5,0x8
    8000203c:	5907b783          	ld	a5,1424(a5) # 8000a5c8 <_GLOBAL_OFFSET_TABLE_+0x38>
    80002040:	0007b783          	ld	a5,0(a5)
    80002044:	00f70463          	beq	a4,a5,8000204c <_ZN5Mutex6signalEv+0x18>
    80002048:	00008067          	ret
void Mutex::signal() {
    8000204c:	fe010113          	addi	sp,sp,-32
    80002050:	00113c23          	sd	ra,24(sp)
    80002054:	00813823          	sd	s0,16(sp)
    80002058:	02010413          	addi	s0,sp,32
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    8000205c:	100027f3          	csrr	a5,sstatus
    80002060:	fef43023          	sd	a5,-32(s0)
    return sstatus;
    80002064:	fe043783          	ld	a5,-32(s0)
    lock()
    80002068:	fef43423          	sd	a5,-24(s0)
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    8000206c:	00200793          	li	a5,2
    80002070:	1007b073          	csrc	sstatus,a5
    holder = nullptr;
    80002074:	02053823          	sd	zero,48(a0)
    deblock();
    80002078:	fffff097          	auipc	ra,0xfffff
    8000207c:	7c4080e7          	jalr	1988(ra) # 8000183c <_ZN15KernelSemaphore7deblockEv>
    unlock()
    80002080:	fe843783          	ld	a5,-24(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80002084:	10079073          	csrw	sstatus,a5
}
    80002088:	01813083          	ld	ra,24(sp)
    8000208c:	01013403          	ld	s0,16(sp)
    80002090:	02010113          	addi	sp,sp,32
    80002094:	00008067          	ret

0000000080002098 <_ZN5MutexD1Ev>:
    80002098:	ff010113          	addi	sp,sp,-16
    8000209c:	00113423          	sd	ra,8(sp)
    800020a0:	00813023          	sd	s0,0(sp)
    800020a4:	01010413          	addi	s0,sp,16
    800020a8:	00008797          	auipc	a5,0x8
    800020ac:	3b078793          	addi	a5,a5,944 # 8000a458 <_ZTV5Mutex+0x10>
    800020b0:	00f53023          	sd	a5,0(a0)
    800020b4:	00000097          	auipc	ra,0x0
    800020b8:	828080e7          	jalr	-2008(ra) # 800018dc <_ZN15KernelSemaphoreD1Ev>
    800020bc:	00813083          	ld	ra,8(sp)
    800020c0:	00013403          	ld	s0,0(sp)
    800020c4:	01010113          	addi	sp,sp,16
    800020c8:	00008067          	ret

00000000800020cc <_ZN5MutexD0Ev>:
    800020cc:	fe010113          	addi	sp,sp,-32
    800020d0:	00113c23          	sd	ra,24(sp)
    800020d4:	00813823          	sd	s0,16(sp)
    800020d8:	00913423          	sd	s1,8(sp)
    800020dc:	02010413          	addi	s0,sp,32
    800020e0:	00050493          	mv	s1,a0
    800020e4:	00008797          	auipc	a5,0x8
    800020e8:	37478793          	addi	a5,a5,884 # 8000a458 <_ZTV5Mutex+0x10>
    800020ec:	00f53023          	sd	a5,0(a0)
    800020f0:	fffff097          	auipc	ra,0xfffff
    800020f4:	7ec080e7          	jalr	2028(ra) # 800018dc <_ZN15KernelSemaphoreD1Ev>
    800020f8:	00048513          	mv	a0,s1
    800020fc:	00000097          	auipc	ra,0x0
    80002100:	e78080e7          	jalr	-392(ra) # 80001f74 <_Z5kfreePv>
    80002104:	01813083          	ld	ra,24(sp)
    80002108:	01013403          	ld	s0,16(sp)
    8000210c:	00813483          	ld	s1,8(sp)
    80002110:	02010113          	addi	sp,sp,32
    80002114:	00008067          	ret

0000000080002118 <_ZN5Riscv10popSppSpieEb>:
#include "../h/SysPrint.h"
#include "../h/TCB.h"
#include "../h/Kernel.h"
#include "../h/TimerInterrupt.h"

void Riscv::popSppSpie(bool prMode) {
    80002118:	ff010113          	addi	sp,sp,-16
    8000211c:	00813423          	sd	s0,8(sp)
    80002120:	01010413          	addi	s0,sp,16
    if(prMode) ms_sstatus(SSTATUS_SPP);
    80002124:	02050463          	beqz	a0,8000214c <_ZN5Riscv10popSppSpieEb+0x34>
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80002128:	10000793          	li	a5,256
    8000212c:	1007a073          	csrs	sstatus,a5
    80002130:	02000793          	li	a5,32
    80002134:	1007a073          	csrs	sstatus,a5
    else mc_sstatus(SSTATUS_SPP);
    ms_sstatus(SSTATUS_SPIE);
    __asm__ volatile ("csrw sepc, ra");
    80002138:	14109073          	csrw	sepc,ra
    __asm__ volatile ("sret");
    8000213c:	10200073          	sret
}
    80002140:	00813403          	ld	s0,8(sp)
    80002144:	01010113          	addi	sp,sp,16
    80002148:	00008067          	ret
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    8000214c:	10000793          	li	a5,256
    80002150:	1007b073          	csrc	sstatus,a5
}
    80002154:	fddff06f          	j	80002130 <_ZN5Riscv10popSppSpieEb+0x18>

0000000080002158 <_ZN5Riscv20handleSupervisorTrapEv>:

void Riscv::handleSupervisorTrap() {
    80002158:	f6010113          	addi	sp,sp,-160
    8000215c:	08113c23          	sd	ra,152(sp)
    80002160:	08813823          	sd	s0,144(sp)
    80002164:	08913423          	sd	s1,136(sp)
    80002168:	09213023          	sd	s2,128(sp)
    8000216c:	0a010413          	addi	s0,sp,160
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    80002170:	142027f3          	csrr	a5,scause
    80002174:	f8f43823          	sd	a5,-112(s0)
    return scause;
    80002178:	f9043483          	ld	s1,-112(s0)
    uint64 scause = r_scause();
    switch (scause) {
    8000217c:	fff00793          	li	a5,-1
    80002180:	03f79793          	slli	a5,a5,0x3f
    80002184:	00178793          	addi	a5,a5,1
    80002188:	0cf48663          	beq	s1,a5,80002254 <_ZN5Riscv20handleSupervisorTrapEv+0xfc>
    8000218c:	fff00793          	li	a5,-1
    80002190:	03f79793          	slli	a5,a5,0x3f
    80002194:	00178793          	addi	a5,a5,1
    80002198:	0497ea63          	bltu	a5,s1,800021ec <_ZN5Riscv20handleSupervisorTrapEv+0x94>
    8000219c:	00800793          	li	a5,8
    800021a0:	06f48463          	beq	s1,a5,80002208 <_ZN5Riscv20handleSupervisorTrapEv+0xb0>
    800021a4:	00900793          	li	a5,9
    800021a8:	14f49263          	bne	s1,a5,800022ec <_ZN5Riscv20handleSupervisorTrapEv+0x194>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    800021ac:	141027f3          	csrr	a5,sepc
    800021b0:	faf43823          	sd	a5,-80(s0)
    return sepc;
    800021b4:	fb043783          	ld	a5,-80(s0)
            w_sepc(sepc);
            break;
        }
        case 0x0000000000000009UL: {
            // interrupt: no, cause code: environment call from S-mode (9)
            volatile uint64 sepc = r_sepc() + 4;
    800021b8:	00478793          	addi	a5,a5,4
    800021bc:	f6f43823          	sd	a5,-144(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    800021c0:	100027f3          	csrr	a5,sstatus
    800021c4:	faf43423          	sd	a5,-88(s0)
    return sstatus;
    800021c8:	fa843783          	ld	a5,-88(s0)
            volatile uint64 sstatus = r_sstatus();
    800021cc:	f6f43c23          	sd	a5,-136(s0)

            TCB::dispatch();
    800021d0:	00001097          	auipc	ra,0x1
    800021d4:	474080e7          	jalr	1140(ra) # 80003644 <_ZN3TCB8dispatchEv>

            w_sstatus(sstatus);
    800021d8:	f7843783          	ld	a5,-136(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    800021dc:	10079073          	csrw	sstatus,a5
            w_sepc(sepc);
    800021e0:	f7043783          	ld	a5,-144(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    800021e4:	14179073          	csrw	sepc,a5
}
    800021e8:	0e00006f          	j	800022c8 <_ZN5Riscv20handleSupervisorTrapEv+0x170>
    switch (scause) {
    800021ec:	fff00793          	li	a5,-1
    800021f0:	03f79793          	slli	a5,a5,0x3f
    800021f4:	00978793          	addi	a5,a5,9
    800021f8:	0ef49a63          	bne	s1,a5,800022ec <_ZN5Riscv20handleSupervisorTrapEv+0x194>
            w_sepc(sepc);
            break;
        }
        case 0x8000000000000009UL: {
            // interrupt: yes, cause code: supervisor external interrupt (console)
            console_handler();
    800021fc:	00006097          	auipc	ra,0x6
    80002200:	904080e7          	jalr	-1788(ra) # 80007b00 <console_handler>
            break;
    80002204:	0c40006f          	j	800022c8 <_ZN5Riscv20handleSupervisorTrapEv+0x170>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80002208:	141027f3          	csrr	a5,sepc
    8000220c:	faf43023          	sd	a5,-96(s0)
    return sepc;
    80002210:	fa043783          	ld	a5,-96(s0)
            volatile uint64 sepc = r_sepc() + 4;
    80002214:	00478793          	addi	a5,a5,4
    80002218:	f6f43023          	sd	a5,-160(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    8000221c:	100027f3          	csrr	a5,sstatus
    80002220:	f8f43c23          	sd	a5,-104(s0)
    return sstatus;
    80002224:	f9843783          	ld	a5,-104(s0)
            volatile uint64 sstatus = r_sstatus();
    80002228:	f6f43423          	sd	a5,-152(s0)
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    8000222c:	00200493          	li	s1,2
    80002230:	1004a073          	csrs	sstatus,s1
            Kernel::handleSystemCall();
    80002234:	fffff097          	auipc	ra,0xfffff
    80002238:	3e0080e7          	jalr	992(ra) # 80001614 <_ZN6Kernel16handleSystemCallEv>
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    8000223c:	1004b073          	csrc	sstatus,s1
            w_sstatus(sstatus);
    80002240:	f6843783          	ld	a5,-152(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80002244:	10079073          	csrw	sstatus,a5
            w_sepc(sepc);
    80002248:	f6043783          	ld	a5,-160(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    8000224c:	14179073          	csrw	sepc,a5
}
    80002250:	0780006f          	j	800022c8 <_ZN5Riscv20handleSupervisorTrapEv+0x170>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80002254:	141027f3          	csrr	a5,sepc
    80002258:	fcf43023          	sd	a5,-64(s0)
    return sepc;
    8000225c:	fc043783          	ld	a5,-64(s0)
            volatile uint64 sepc = r_sepc();
    80002260:	f8f43023          	sd	a5,-128(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80002264:	100027f3          	csrr	a5,sstatus
    80002268:	faf43c23          	sd	a5,-72(s0)
    return sstatus;
    8000226c:	fb843783          	ld	a5,-72(s0)
            volatile uint64 sstatus = r_sstatus();
    80002270:	f8f43423          	sd	a5,-120(s0)
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    80002274:	00200913          	li	s2,2
    80002278:	14493073          	csrc	sip,s2
            TCB::timeSliceCounter++;
    8000227c:	00008497          	auipc	s1,0x8
    80002280:	32c4b483          	ld	s1,812(s1) # 8000a5a8 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002284:	0004b783          	ld	a5,0(s1)
    80002288:	00178793          	addi	a5,a5,1
    8000228c:	00f4b023          	sd	a5,0(s1)
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80002290:	10092073          	csrs	sstatus,s2
            TimerInterrupt::tick();
    80002294:	00002097          	auipc	ra,0x2
    80002298:	d78080e7          	jalr	-648(ra) # 8000400c <_ZN14TimerInterrupt4tickEv>
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    8000229c:	10093073          	csrc	sstatus,s2
            if (TCB::timeSliceCounter >= TCB::running->timeSlice) {
    800022a0:	00008797          	auipc	a5,0x8
    800022a4:	3287b783          	ld	a5,808(a5) # 8000a5c8 <_GLOBAL_OFFSET_TABLE_+0x38>
    800022a8:	0007b783          	ld	a5,0(a5)
    800022ac:	0407b703          	ld	a4,64(a5)
    800022b0:	0004b783          	ld	a5,0(s1)
    800022b4:	02e7f663          	bgeu	a5,a4,800022e0 <_ZN5Riscv20handleSupervisorTrapEv+0x188>
            w_sstatus(sstatus);
    800022b8:	f8843783          	ld	a5,-120(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    800022bc:	10079073          	csrw	sstatus,a5
            w_sepc(sepc);
    800022c0:	f8043783          	ld	a5,-128(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    800022c4:	14179073          	csrw	sepc,a5
            kprintUnsigned(r_stval());
            kprintString("\n");
            w_sepc(r_sepc() + 4);
        }
    }
    800022c8:	09813083          	ld	ra,152(sp)
    800022cc:	09013403          	ld	s0,144(sp)
    800022d0:	08813483          	ld	s1,136(sp)
    800022d4:	08013903          	ld	s2,128(sp)
    800022d8:	0a010113          	addi	sp,sp,160
    800022dc:	00008067          	ret
                TCB::dispatch();
    800022e0:	00001097          	auipc	ra,0x1
    800022e4:	364080e7          	jalr	868(ra) # 80003644 <_ZN3TCB8dispatchEv>
    800022e8:	fd1ff06f          	j	800022b8 <_ZN5Riscv20handleSupervisorTrapEv+0x160>
            kprintString("Unexpected trap cause:\n");
    800022ec:	00006517          	auipc	a0,0x6
    800022f0:	eb450513          	addi	a0,a0,-332 # 800081a0 <CONSOLE_STATUS+0x190>
    800022f4:	00001097          	auipc	ra,0x1
    800022f8:	b14080e7          	jalr	-1260(ra) # 80002e08 <_Z12kprintStringPKc>
            kprintString("Scause: ");
    800022fc:	00006517          	auipc	a0,0x6
    80002300:	ebc50513          	addi	a0,a0,-324 # 800081b8 <CONSOLE_STATUS+0x1a8>
    80002304:	00001097          	auipc	ra,0x1
    80002308:	b04080e7          	jalr	-1276(ra) # 80002e08 <_Z12kprintStringPKc>
            kprintUnsigned(scause);
    8000230c:	00048513          	mv	a0,s1
    80002310:	00001097          	auipc	ra,0x1
    80002314:	d90080e7          	jalr	-624(ra) # 800030a0 <_Z14kprintUnsignedm>
            kprintString("\nSepc: ");
    80002318:	00006517          	auipc	a0,0x6
    8000231c:	eb050513          	addi	a0,a0,-336 # 800081c8 <CONSOLE_STATUS+0x1b8>
    80002320:	00001097          	auipc	ra,0x1
    80002324:	ae8080e7          	jalr	-1304(ra) # 80002e08 <_Z12kprintStringPKc>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80002328:	141027f3          	csrr	a5,sepc
    8000232c:	fcf43c23          	sd	a5,-40(s0)
    return sepc;
    80002330:	fd843503          	ld	a0,-40(s0)
            kprintUnsigned(r_sepc());
    80002334:	00001097          	auipc	ra,0x1
    80002338:	d6c080e7          	jalr	-660(ra) # 800030a0 <_Z14kprintUnsignedm>
            kprintString("\nStval: ");
    8000233c:	00006517          	auipc	a0,0x6
    80002340:	e9450513          	addi	a0,a0,-364 # 800081d0 <CONSOLE_STATUS+0x1c0>
    80002344:	00001097          	auipc	ra,0x1
    80002348:	ac4080e7          	jalr	-1340(ra) # 80002e08 <_Z12kprintStringPKc>
    __asm__ volatile ("csrr %[stval], stval" : [stval] "=r"(stval));
    8000234c:	143027f3          	csrr	a5,stval
    80002350:	fcf43823          	sd	a5,-48(s0)
    return stval;
    80002354:	fd043503          	ld	a0,-48(s0)
            kprintUnsigned(r_stval());
    80002358:	00001097          	auipc	ra,0x1
    8000235c:	d48080e7          	jalr	-696(ra) # 800030a0 <_Z14kprintUnsignedm>
            kprintString("\n");
    80002360:	00006517          	auipc	a0,0x6
    80002364:	e2850513          	addi	a0,a0,-472 # 80008188 <CONSOLE_STATUS+0x178>
    80002368:	00001097          	auipc	ra,0x1
    8000236c:	aa0080e7          	jalr	-1376(ra) # 80002e08 <_Z12kprintStringPKc>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80002370:	141027f3          	csrr	a5,sepc
    80002374:	fcf43423          	sd	a5,-56(s0)
    return sepc;
    80002378:	fc843783          	ld	a5,-56(s0)
            w_sepc(r_sepc() + 4);
    8000237c:	00478793          	addi	a5,a5,4
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80002380:	14179073          	csrw	sepc,a5
    80002384:	f45ff06f          	j	800022c8 <_ZN5Riscv20handleSupervisorTrapEv+0x170>

0000000080002388 <_ZN9Scheduler11getInstanceEv>:
    getInstance()->readyThreadQueue.addLast(tcb->getNode());
    getInstance()->mutex.signal();
}

Scheduler *Scheduler::getInstance() {
    if (!instance) instance = new Scheduler;
    80002388:	00008797          	auipc	a5,0x8
    8000238c:	2a87b783          	ld	a5,680(a5) # 8000a630 <_ZN9Scheduler8instanceE>
    80002390:	00078863          	beqz	a5,800023a0 <_ZN9Scheduler11getInstanceEv+0x18>
    return instance;
}
    80002394:	00008517          	auipc	a0,0x8
    80002398:	29c53503          	ld	a0,668(a0) # 8000a630 <_ZN9Scheduler8instanceE>
    8000239c:	00008067          	ret
Scheduler *Scheduler::getInstance() {
    800023a0:	ff010113          	addi	sp,sp,-16
    800023a4:	00113423          	sd	ra,8(sp)
    800023a8:	00813023          	sd	s0,0(sp)
    800023ac:	01010413          	addi	s0,sp,16
        return kmalloc(size);
    800023b0:	00200513          	li	a0,2
    800023b4:	00000097          	auipc	ra,0x0
    800023b8:	9b8080e7          	jalr	-1608(ra) # 80001d6c <_Z7kmallocm>
    800023bc:	00053423          	sd	zero,8(a0)
    800023c0:	00053823          	sd	zero,16(a0)
    800023c4:	00053c23          	sd	zero,24(a0)
    800023c8:	02052023          	sw	zero,32(a0)
    800023cc:	00100793          	li	a5,1
    800023d0:	02f52823          	sw	a5,48(a0)
    800023d4:	02053c23          	sd	zero,56(a0)
    800023d8:	04053023          	sd	zero,64(a0)
    800023dc:	04053423          	sd	zero,72(a0)
    800023e0:	04052823          	sw	zero,80(a0)
    800023e4:	00008797          	auipc	a5,0x8
    800023e8:	1dc7b783          	ld	a5,476(a5) # 8000a5c0 <_GLOBAL_OFFSET_TABLE_+0x30>
    800023ec:	01078793          	addi	a5,a5,16
    800023f0:	02f53423          	sd	a5,40(a0)
    800023f4:	04053c23          	sd	zero,88(a0)
    if (!instance) instance = new Scheduler;
    800023f8:	00008797          	auipc	a5,0x8
    800023fc:	22a7bc23          	sd	a0,568(a5) # 8000a630 <_ZN9Scheduler8instanceE>
}
    80002400:	00008517          	auipc	a0,0x8
    80002404:	23053503          	ld	a0,560(a0) # 8000a630 <_ZN9Scheduler8instanceE>
    80002408:	00813083          	ld	ra,8(sp)
    8000240c:	00013403          	ld	s0,0(sp)
    80002410:	01010113          	addi	sp,sp,16
    80002414:	00008067          	ret

0000000080002418 <_ZN9Scheduler3getEv>:
TCB *Scheduler::get() {
    80002418:	fe010113          	addi	sp,sp,-32
    8000241c:	00113c23          	sd	ra,24(sp)
    80002420:	00813823          	sd	s0,16(sp)
    80002424:	00913423          	sd	s1,8(sp)
    80002428:	02010413          	addi	s0,sp,32
    getInstance()->mutex.wait();
    8000242c:	00000097          	auipc	ra,0x0
    80002430:	f5c080e7          	jalr	-164(ra) # 80002388 <_ZN9Scheduler11getInstanceEv>
    80002434:	02850513          	addi	a0,a0,40
    80002438:	00000097          	auipc	ra,0x0
    8000243c:	b7c080e7          	jalr	-1156(ra) # 80001fb4 <_ZN5Mutex4waitEv>
    TCB *tcb = getInstance()->readyThreadQueue.removeFirst();
    80002440:	00000097          	auipc	ra,0x0
    80002444:	f48080e7          	jalr	-184(ra) # 80002388 <_ZN9Scheduler11getInstanceEv>
    80002448:	00850513          	addi	a0,a0,8
    8000244c:	00002097          	auipc	ra,0x2
    80002450:	85c080e7          	jalr	-1956(ra) # 80003ca8 <_ZN10ThreadList11removeFirstEv>
    80002454:	00050493          	mv	s1,a0
    getInstance()->mutex.signal();
    80002458:	00000097          	auipc	ra,0x0
    8000245c:	f30080e7          	jalr	-208(ra) # 80002388 <_ZN9Scheduler11getInstanceEv>
    80002460:	02850513          	addi	a0,a0,40
    80002464:	00000097          	auipc	ra,0x0
    80002468:	bd0080e7          	jalr	-1072(ra) # 80002034 <_ZN5Mutex6signalEv>
}
    8000246c:	00048513          	mv	a0,s1
    80002470:	01813083          	ld	ra,24(sp)
    80002474:	01013403          	ld	s0,16(sp)
    80002478:	00813483          	ld	s1,8(sp)
    8000247c:	02010113          	addi	sp,sp,32
    80002480:	00008067          	ret

0000000080002484 <_ZN9Scheduler3putEP3TCB>:
void Scheduler::put(TCB *tcb) {
    80002484:	fe010113          	addi	sp,sp,-32
    80002488:	00113c23          	sd	ra,24(sp)
    8000248c:	00813823          	sd	s0,16(sp)
    80002490:	00913423          	sd	s1,8(sp)
    80002494:	02010413          	addi	s0,sp,32
    80002498:	00050493          	mv	s1,a0
    getInstance()->mutex.wait();
    8000249c:	00000097          	auipc	ra,0x0
    800024a0:	eec080e7          	jalr	-276(ra) # 80002388 <_ZN9Scheduler11getInstanceEv>
    800024a4:	02850513          	addi	a0,a0,40
    800024a8:	00000097          	auipc	ra,0x0
    800024ac:	b0c080e7          	jalr	-1268(ra) # 80001fb4 <_ZN5Mutex4waitEv>
    getInstance()->readyThreadQueue.addLast(tcb->getNode());
    800024b0:	00000097          	auipc	ra,0x0
    800024b4:	ed8080e7          	jalr	-296(ra) # 80002388 <_ZN9Scheduler11getInstanceEv>
    800024b8:	0a848593          	addi	a1,s1,168
    800024bc:	00850513          	addi	a0,a0,8
    800024c0:	00001097          	auipc	ra,0x1
    800024c4:	7a4080e7          	jalr	1956(ra) # 80003c64 <_ZN10ThreadList7addLastEP10ThreadNode>
    getInstance()->mutex.signal();
    800024c8:	00000097          	auipc	ra,0x0
    800024cc:	ec0080e7          	jalr	-320(ra) # 80002388 <_ZN9Scheduler11getInstanceEv>
    800024d0:	02850513          	addi	a0,a0,40
    800024d4:	00000097          	auipc	ra,0x0
    800024d8:	b60080e7          	jalr	-1184(ra) # 80002034 <_ZN5Mutex6signalEv>
}
    800024dc:	01813083          	ld	ra,24(sp)
    800024e0:	01013403          	ld	s0,16(sp)
    800024e4:	00813483          	ld	s1,8(sp)
    800024e8:	02010113          	addi	sp,sp,32
    800024ec:	00008067          	ret

00000000800024f0 <_ZN9SchedulerD1Ev>:

Scheduler::~Scheduler() {
    800024f0:	fe010113          	addi	sp,sp,-32
    800024f4:	00113c23          	sd	ra,24(sp)
    800024f8:	00813823          	sd	s0,16(sp)
    800024fc:	00913423          	sd	s1,8(sp)
    80002500:	01213023          	sd	s2,0(sp)
    80002504:	02010413          	addi	s0,sp,32
    80002508:	00050913          	mv	s2,a0
        return size == 0;
    8000250c:	02092783          	lw	a5,32(s2)
    while (!readyThreadQueue.isEmpty()) {
    80002510:	02078863          	beqz	a5,80002540 <_ZN9SchedulerD1Ev+0x50>
        delete readyThreadQueue.removeFirst();
    80002514:	00890513          	addi	a0,s2,8
    80002518:	00001097          	auipc	ra,0x1
    8000251c:	790080e7          	jalr	1936(ra) # 80003ca8 <_ZN10ThreadList11removeFirstEv>
    80002520:	00050493          	mv	s1,a0
    80002524:	fe0504e3          	beqz	a0,8000250c <_ZN9SchedulerD1Ev+0x1c>
    80002528:	00001097          	auipc	ra,0x1
    8000252c:	2f4080e7          	jalr	756(ra) # 8000381c <_ZN3TCBD1Ev>
        kfree(addr);
    80002530:	00048513          	mv	a0,s1
    80002534:	00000097          	auipc	ra,0x0
    80002538:	a40080e7          	jalr	-1472(ra) # 80001f74 <_Z5kfreePv>
    }
    8000253c:	fd1ff06f          	j	8000250c <_ZN9SchedulerD1Ev+0x1c>
    80002540:	00008797          	auipc	a5,0x8
    80002544:	0807b783          	ld	a5,128(a5) # 8000a5c0 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002548:	01078793          	addi	a5,a5,16
    8000254c:	02f93423          	sd	a5,40(s2)
    80002550:	02890513          	addi	a0,s2,40
    80002554:	fffff097          	auipc	ra,0xfffff
    80002558:	388080e7          	jalr	904(ra) # 800018dc <_ZN15KernelSemaphoreD1Ev>
Scheduler::~Scheduler() {
    8000255c:	00890513          	addi	a0,s2,8
    80002560:	00002097          	auipc	ra,0x2
    80002564:	8ec080e7          	jalr	-1812(ra) # 80003e4c <_ZN10ThreadListD1Ev>
    }
}
    80002568:	01813083          	ld	ra,24(sp)
    8000256c:	01013403          	ld	s0,16(sp)
    80002570:	00813483          	ld	s1,8(sp)
    80002574:	00013903          	ld	s2,0(sp)
    80002578:	02010113          	addi	sp,sp,32
    8000257c:	00008067          	ret

0000000080002580 <_Z18callSupervisorTrapmPv>:
#include "../h/syscall_c.h"

void *callSupervisorTrap(uint64 param, void *args) {
    80002580:	ff010113          	addi	sp,sp,-16
    80002584:	00813423          	sd	s0,8(sp)
    80002588:	01010413          	addi	s0,sp,16
    __asm__ volatile ("ecall");
    8000258c:	00000073          	ecall

    return (void *) param;
}
    80002590:	00813403          	ld	s0,8(sp)
    80002594:	01010113          	addi	sp,sp,16
    80002598:	00008067          	ret

000000008000259c <_ZN7_threadC1EPFvPvES0_>:

_thread::_thread(_thread::Body body, void *arg) : id(0), body(body), arg(arg) {
    8000259c:	ff010113          	addi	sp,sp,-16
    800025a0:	00813423          	sd	s0,8(sp)
    800025a4:	01010413          	addi	s0,sp,16
    800025a8:	00053023          	sd	zero,0(a0)
    800025ac:	00b53423          	sd	a1,8(a0)
    800025b0:	00c53823          	sd	a2,16(a0)
}
    800025b4:	00813403          	ld	s0,8(sp)
    800025b8:	01010113          	addi	sp,sp,16
    800025bc:	00008067          	ret

00000000800025c0 <_Z9mem_allocm>:
_sem::~_sem() {
    sem_close(this);
}

void *mem_alloc(size_t size) {
    if (!size) return nullptr;
    800025c0:	02050e63          	beqz	a0,800025fc <_Z9mem_allocm+0x3c>
void *mem_alloc(size_t size) {
    800025c4:	ff010113          	addi	sp,sp,-16
    800025c8:	00113423          	sd	ra,8(sp)
    800025cc:	00813023          	sd	s0,0(sp)
    800025d0:	01010413          	addi	s0,sp,16
    size = (size - 1) / MEM_BLOCK_SIZE + 1;
    800025d4:	fff50513          	addi	a0,a0,-1
    800025d8:	00655593          	srli	a1,a0,0x6
    return callSupervisorTrap(0x01, (void *) size);
    800025dc:	00158593          	addi	a1,a1,1
    800025e0:	00100513          	li	a0,1
    800025e4:	00000097          	auipc	ra,0x0
    800025e8:	f9c080e7          	jalr	-100(ra) # 80002580 <_Z18callSupervisorTrapmPv>
}
    800025ec:	00813083          	ld	ra,8(sp)
    800025f0:	00013403          	ld	s0,0(sp)
    800025f4:	01010113          	addi	sp,sp,16
    800025f8:	00008067          	ret
    if (!size) return nullptr;
    800025fc:	00000513          	li	a0,0
}
    80002600:	00008067          	ret

0000000080002604 <_Z8mem_freePv>:

int mem_free(void *addr) {
    80002604:	ff010113          	addi	sp,sp,-16
    80002608:	00113423          	sd	ra,8(sp)
    8000260c:	00813023          	sd	s0,0(sp)
    80002610:	01010413          	addi	s0,sp,16
    80002614:	00050593          	mv	a1,a0
    return (uint64) callSupervisorTrap(0x02, addr);
    80002618:	00200513          	li	a0,2
    8000261c:	00000097          	auipc	ra,0x0
    80002620:	f64080e7          	jalr	-156(ra) # 80002580 <_Z18callSupervisorTrapmPv>
}
    80002624:	0005051b          	sext.w	a0,a0
    80002628:	00813083          	ld	ra,8(sp)
    8000262c:	00013403          	ld	s0,0(sp)
    80002630:	01010113          	addi	sp,sp,16
    80002634:	00008067          	ret

0000000080002638 <_Z13thread_createPP7_threadPFvPvES2_>:

int thread_create(thread_t *handle, void(*start_routine)(void *), void *arg) {
    if (!handle) return -1;
    80002638:	08050a63          	beqz	a0,800026cc <_Z13thread_createPP7_threadPFvPvES2_+0x94>
int thread_create(thread_t *handle, void(*start_routine)(void *), void *arg) {
    8000263c:	fb010113          	addi	sp,sp,-80
    80002640:	04113423          	sd	ra,72(sp)
    80002644:	04813023          	sd	s0,64(sp)
    80002648:	02913c23          	sd	s1,56(sp)
    8000264c:	03213823          	sd	s2,48(sp)
    80002650:	03313423          	sd	s3,40(sp)
    80002654:	05010413          	addi	s0,sp,80
    80002658:	00050493          	mv	s1,a0
    8000265c:	00058993          	mv	s3,a1
    80002660:	00060913          	mv	s2,a2

    *handle = new _thread;
    80002664:	01800513          	li	a0,24
    80002668:	00000097          	auipc	ra,0x0
    8000266c:	2e0080e7          	jalr	736(ra) # 80002948 <_Znwm>
    80002670:	00a4b023          	sd	a0,0(s1)
    if (!*handle) return -1;
    80002674:	06050063          	beqz	a0,800026d4 <_Z13thread_createPP7_threadPFvPvES2_+0x9c>

    void *stack = new uint64[DEFAULT_STACK_SIZE];
    80002678:	00008537          	lui	a0,0x8
    8000267c:	00000097          	auipc	ra,0x0
    80002680:	2f4080e7          	jalr	756(ra) # 80002970 <_Znam>
    if (!stack) return -1;
    80002684:	04050c63          	beqz	a0,800026dc <_Z13thread_createPP7_threadPFvPvES2_+0xa4>

    uint64 args[] = {(uint64) *handle, (uint64) start_routine, (uint64) arg, (uint64) stack};
    80002688:	0004b783          	ld	a5,0(s1)
    8000268c:	faf43823          	sd	a5,-80(s0)
    80002690:	fb343c23          	sd	s3,-72(s0)
    80002694:	fd243023          	sd	s2,-64(s0)
    80002698:	fca43423          	sd	a0,-56(s0)
    return (uint64) callSupervisorTrap(0x11, args);
    8000269c:	fb040593          	addi	a1,s0,-80
    800026a0:	01100513          	li	a0,17
    800026a4:	00000097          	auipc	ra,0x0
    800026a8:	edc080e7          	jalr	-292(ra) # 80002580 <_Z18callSupervisorTrapmPv>
    800026ac:	0005051b          	sext.w	a0,a0
}
    800026b0:	04813083          	ld	ra,72(sp)
    800026b4:	04013403          	ld	s0,64(sp)
    800026b8:	03813483          	ld	s1,56(sp)
    800026bc:	03013903          	ld	s2,48(sp)
    800026c0:	02813983          	ld	s3,40(sp)
    800026c4:	05010113          	addi	sp,sp,80
    800026c8:	00008067          	ret
    if (!handle) return -1;
    800026cc:	fff00513          	li	a0,-1
}
    800026d0:	00008067          	ret
    if (!*handle) return -1;
    800026d4:	fff00513          	li	a0,-1
    800026d8:	fd9ff06f          	j	800026b0 <_Z13thread_createPP7_threadPFvPvES2_+0x78>
    if (!stack) return -1;
    800026dc:	fff00513          	li	a0,-1
    800026e0:	fd1ff06f          	j	800026b0 <_Z13thread_createPP7_threadPFvPvES2_+0x78>

00000000800026e4 <_Z11thread_exitv>:

int thread_exit() {
    800026e4:	ff010113          	addi	sp,sp,-16
    800026e8:	00113423          	sd	ra,8(sp)
    800026ec:	00813023          	sd	s0,0(sp)
    800026f0:	01010413          	addi	s0,sp,16
    return (uint64) callSupervisorTrap(0x12, 0);
    800026f4:	00000593          	li	a1,0
    800026f8:	01200513          	li	a0,18
    800026fc:	00000097          	auipc	ra,0x0
    80002700:	e84080e7          	jalr	-380(ra) # 80002580 <_Z18callSupervisorTrapmPv>
}
    80002704:	0005051b          	sext.w	a0,a0
    80002708:	00813083          	ld	ra,8(sp)
    8000270c:	00013403          	ld	s0,0(sp)
    80002710:	01010113          	addi	sp,sp,16
    80002714:	00008067          	ret

0000000080002718 <_Z15thread_dispatchv>:

void thread_dispatch() {
    80002718:	ff010113          	addi	sp,sp,-16
    8000271c:	00113423          	sd	ra,8(sp)
    80002720:	00813023          	sd	s0,0(sp)
    80002724:	01010413          	addi	s0,sp,16
    callSupervisorTrap(0x13, 0);
    80002728:	00000593          	li	a1,0
    8000272c:	01300513          	li	a0,19
    80002730:	00000097          	auipc	ra,0x0
    80002734:	e50080e7          	jalr	-432(ra) # 80002580 <_Z18callSupervisorTrapmPv>
}
    80002738:	00813083          	ld	ra,8(sp)
    8000273c:	00013403          	ld	s0,0(sp)
    80002740:	01010113          	addi	sp,sp,16
    80002744:	00008067          	ret

0000000080002748 <_Z8sem_openPP4_semj>:

int sem_open(sem_t *handle, unsigned init) {
    if (!handle) return -1;
    80002748:	06050863          	beqz	a0,800027b8 <_Z8sem_openPP4_semj+0x70>
int sem_open(sem_t *handle, unsigned init) {
    8000274c:	fd010113          	addi	sp,sp,-48
    80002750:	02113423          	sd	ra,40(sp)
    80002754:	02813023          	sd	s0,32(sp)
    80002758:	00913c23          	sd	s1,24(sp)
    8000275c:	01213823          	sd	s2,16(sp)
    80002760:	03010413          	addi	s0,sp,48
    80002764:	00050913          	mv	s2,a0
    80002768:	00058493          	mv	s1,a1
    *handle = new _sem;
    8000276c:	00800513          	li	a0,8
    80002770:	00000097          	auipc	ra,0x0
    80002774:	1d8080e7          	jalr	472(ra) # 80002948 <_Znwm>
    80002778:	00a93023          	sd	a0,0(s2)
    uint64 args[] = {(uint64) *handle, (uint64) init};
    8000277c:	fca43823          	sd	a0,-48(s0)
    80002780:	02049593          	slli	a1,s1,0x20
    80002784:	0205d593          	srli	a1,a1,0x20
    80002788:	fcb43c23          	sd	a1,-40(s0)
    return (uint64) callSupervisorTrap(0x21, args);
    8000278c:	fd040593          	addi	a1,s0,-48
    80002790:	02100513          	li	a0,33
    80002794:	00000097          	auipc	ra,0x0
    80002798:	dec080e7          	jalr	-532(ra) # 80002580 <_Z18callSupervisorTrapmPv>
    8000279c:	0005051b          	sext.w	a0,a0
}
    800027a0:	02813083          	ld	ra,40(sp)
    800027a4:	02013403          	ld	s0,32(sp)
    800027a8:	01813483          	ld	s1,24(sp)
    800027ac:	01013903          	ld	s2,16(sp)
    800027b0:	03010113          	addi	sp,sp,48
    800027b4:	00008067          	ret
    if (!handle) return -1;
    800027b8:	fff00513          	li	a0,-1
}
    800027bc:	00008067          	ret

00000000800027c0 <_Z9sem_closeP4_sem>:

int sem_close(sem_t handle) {
    800027c0:	ff010113          	addi	sp,sp,-16
    800027c4:	00113423          	sd	ra,8(sp)
    800027c8:	00813023          	sd	s0,0(sp)
    800027cc:	01010413          	addi	s0,sp,16
    800027d0:	00050593          	mv	a1,a0
    return (uint64) callSupervisorTrap(0x22, handle);
    800027d4:	02200513          	li	a0,34
    800027d8:	00000097          	auipc	ra,0x0
    800027dc:	da8080e7          	jalr	-600(ra) # 80002580 <_Z18callSupervisorTrapmPv>
}
    800027e0:	0005051b          	sext.w	a0,a0
    800027e4:	00813083          	ld	ra,8(sp)
    800027e8:	00013403          	ld	s0,0(sp)
    800027ec:	01010113          	addi	sp,sp,16
    800027f0:	00008067          	ret

00000000800027f4 <_ZN4_semD1Ev>:
_sem::~_sem() {
    800027f4:	ff010113          	addi	sp,sp,-16
    800027f8:	00113423          	sd	ra,8(sp)
    800027fc:	00813023          	sd	s0,0(sp)
    80002800:	01010413          	addi	s0,sp,16
    sem_close(this);
    80002804:	00000097          	auipc	ra,0x0
    80002808:	fbc080e7          	jalr	-68(ra) # 800027c0 <_Z9sem_closeP4_sem>
}
    8000280c:	00813083          	ld	ra,8(sp)
    80002810:	00013403          	ld	s0,0(sp)
    80002814:	01010113          	addi	sp,sp,16
    80002818:	00008067          	ret

000000008000281c <_Z8sem_waitP4_sem>:

int sem_wait(sem_t handle) {
    8000281c:	ff010113          	addi	sp,sp,-16
    80002820:	00113423          	sd	ra,8(sp)
    80002824:	00813023          	sd	s0,0(sp)
    80002828:	01010413          	addi	s0,sp,16
    8000282c:	00050593          	mv	a1,a0
    return (uint64) callSupervisorTrap(0x23, handle);
    80002830:	02300513          	li	a0,35
    80002834:	00000097          	auipc	ra,0x0
    80002838:	d4c080e7          	jalr	-692(ra) # 80002580 <_Z18callSupervisorTrapmPv>
}
    8000283c:	0005051b          	sext.w	a0,a0
    80002840:	00813083          	ld	ra,8(sp)
    80002844:	00013403          	ld	s0,0(sp)
    80002848:	01010113          	addi	sp,sp,16
    8000284c:	00008067          	ret

0000000080002850 <_Z10sem_signalP4_sem>:

int sem_signal(sem_t handle) {
    80002850:	ff010113          	addi	sp,sp,-16
    80002854:	00113423          	sd	ra,8(sp)
    80002858:	00813023          	sd	s0,0(sp)
    8000285c:	01010413          	addi	s0,sp,16
    80002860:	00050593          	mv	a1,a0
    return (uint64) callSupervisorTrap(0x24, handle);
    80002864:	02400513          	li	a0,36
    80002868:	00000097          	auipc	ra,0x0
    8000286c:	d18080e7          	jalr	-744(ra) # 80002580 <_Z18callSupervisorTrapmPv>
}
    80002870:	0005051b          	sext.w	a0,a0
    80002874:	00813083          	ld	ra,8(sp)
    80002878:	00013403          	ld	s0,0(sp)
    8000287c:	01010113          	addi	sp,sp,16
    80002880:	00008067          	ret

0000000080002884 <_Z10time_sleepm>:

int time_sleep(time_t time) {
    80002884:	ff010113          	addi	sp,sp,-16
    80002888:	00113423          	sd	ra,8(sp)
    8000288c:	00813023          	sd	s0,0(sp)
    80002890:	01010413          	addi	s0,sp,16
    80002894:	00050593          	mv	a1,a0
    return (uint64) callSupervisorTrap(0x31, (void *) time);
    80002898:	03100513          	li	a0,49
    8000289c:	00000097          	auipc	ra,0x0
    800028a0:	ce4080e7          	jalr	-796(ra) # 80002580 <_Z18callSupervisorTrapmPv>
}
    800028a4:	0005051b          	sext.w	a0,a0
    800028a8:	00813083          	ld	ra,8(sp)
    800028ac:	00013403          	ld	s0,0(sp)
    800028b0:	01010113          	addi	sp,sp,16
    800028b4:	00008067          	ret

00000000800028b8 <_Z4getcv>:

char getc() {
    800028b8:	ff010113          	addi	sp,sp,-16
    800028bc:	00113423          	sd	ra,8(sp)
    800028c0:	00813023          	sd	s0,0(sp)
    800028c4:	01010413          	addi	s0,sp,16
    return (uint64) callSupervisorTrap(0x41, nullptr);
    800028c8:	00000593          	li	a1,0
    800028cc:	04100513          	li	a0,65
    800028d0:	00000097          	auipc	ra,0x0
    800028d4:	cb0080e7          	jalr	-848(ra) # 80002580 <_Z18callSupervisorTrapmPv>
}
    800028d8:	0ff57513          	andi	a0,a0,255
    800028dc:	00813083          	ld	ra,8(sp)
    800028e0:	00013403          	ld	s0,0(sp)
    800028e4:	01010113          	addi	sp,sp,16
    800028e8:	00008067          	ret

00000000800028ec <_Z4putcc>:

void putc(char chr) {
    800028ec:	ff010113          	addi	sp,sp,-16
    800028f0:	00113423          	sd	ra,8(sp)
    800028f4:	00813023          	sd	s0,0(sp)
    800028f8:	01010413          	addi	s0,sp,16
    800028fc:	00050593          	mv	a1,a0
    callSupervisorTrap(0x42, (void *) (uint64) chr);
    80002900:	04200513          	li	a0,66
    80002904:	00000097          	auipc	ra,0x0
    80002908:	c7c080e7          	jalr	-900(ra) # 80002580 <_Z18callSupervisorTrapmPv>
}
    8000290c:	00813083          	ld	ra,8(sp)
    80002910:	00013403          	ld	s0,0(sp)
    80002914:	01010113          	addi	sp,sp,16
    80002918:	00008067          	ret

000000008000291c <_ZZN6ThreadC4EvENUlPvE_4_FUNES0_>:
int Thread::sleep(time_t time) {
    return time_sleep(time);
}

Thread::Thread() {
    body = [](void *arg) { ((Thread *) arg)->run(); };
    8000291c:	ff010113          	addi	sp,sp,-16
    80002920:	00113423          	sd	ra,8(sp)
    80002924:	00813023          	sd	s0,0(sp)
    80002928:	01010413          	addi	s0,sp,16
    8000292c:	00053783          	ld	a5,0(a0) # 8000 <_entry-0x7fff8000>
    80002930:	0107b783          	ld	a5,16(a5)
    80002934:	000780e7          	jalr	a5
    80002938:	00813083          	ld	ra,8(sp)
    8000293c:	00013403          	ld	s0,0(sp)
    80002940:	01010113          	addi	sp,sp,16
    80002944:	00008067          	ret

0000000080002948 <_Znwm>:
void *operator new(size_t sz) {
    80002948:	ff010113          	addi	sp,sp,-16
    8000294c:	00113423          	sd	ra,8(sp)
    80002950:	00813023          	sd	s0,0(sp)
    80002954:	01010413          	addi	s0,sp,16
    return mem_alloc(sz);
    80002958:	00000097          	auipc	ra,0x0
    8000295c:	c68080e7          	jalr	-920(ra) # 800025c0 <_Z9mem_allocm>
}
    80002960:	00813083          	ld	ra,8(sp)
    80002964:	00013403          	ld	s0,0(sp)
    80002968:	01010113          	addi	sp,sp,16
    8000296c:	00008067          	ret

0000000080002970 <_Znam>:
void *operator new[](size_t sz) {
    80002970:	ff010113          	addi	sp,sp,-16
    80002974:	00113423          	sd	ra,8(sp)
    80002978:	00813023          	sd	s0,0(sp)
    8000297c:	01010413          	addi	s0,sp,16
    return mem_alloc(sz);
    80002980:	00000097          	auipc	ra,0x0
    80002984:	c40080e7          	jalr	-960(ra) # 800025c0 <_Z9mem_allocm>
}
    80002988:	00813083          	ld	ra,8(sp)
    8000298c:	00013403          	ld	s0,0(sp)
    80002990:	01010113          	addi	sp,sp,16
    80002994:	00008067          	ret

0000000080002998 <_ZdlPv>:
void operator delete(void *addr) {
    80002998:	ff010113          	addi	sp,sp,-16
    8000299c:	00113423          	sd	ra,8(sp)
    800029a0:	00813023          	sd	s0,0(sp)
    800029a4:	01010413          	addi	s0,sp,16
    mem_free(addr);
    800029a8:	00000097          	auipc	ra,0x0
    800029ac:	c5c080e7          	jalr	-932(ra) # 80002604 <_Z8mem_freePv>
}
    800029b0:	00813083          	ld	ra,8(sp)
    800029b4:	00013403          	ld	s0,0(sp)
    800029b8:	01010113          	addi	sp,sp,16
    800029bc:	00008067          	ret

00000000800029c0 <_ZN6ThreadD1Ev>:
Thread::~Thread() {
    800029c0:	00008797          	auipc	a5,0x8
    800029c4:	ac878793          	addi	a5,a5,-1336 # 8000a488 <_ZTV6Thread+0x10>
    800029c8:	00f53023          	sd	a5,0(a0)
    delete myHandle;
    800029cc:	00853503          	ld	a0,8(a0)
    800029d0:	02050663          	beqz	a0,800029fc <_ZN6ThreadD1Ev+0x3c>
Thread::~Thread() {
    800029d4:	ff010113          	addi	sp,sp,-16
    800029d8:	00113423          	sd	ra,8(sp)
    800029dc:	00813023          	sd	s0,0(sp)
    800029e0:	01010413          	addi	s0,sp,16
    delete myHandle;
    800029e4:	00000097          	auipc	ra,0x0
    800029e8:	fb4080e7          	jalr	-76(ra) # 80002998 <_ZdlPv>
}
    800029ec:	00813083          	ld	ra,8(sp)
    800029f0:	00013403          	ld	s0,0(sp)
    800029f4:	01010113          	addi	sp,sp,16
    800029f8:	00008067          	ret
    800029fc:	00008067          	ret

0000000080002a00 <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    80002a00:	fe010113          	addi	sp,sp,-32
    80002a04:	00113c23          	sd	ra,24(sp)
    80002a08:	00813823          	sd	s0,16(sp)
    80002a0c:	00913423          	sd	s1,8(sp)
    80002a10:	02010413          	addi	s0,sp,32
    80002a14:	00050493          	mv	s1,a0
}
    80002a18:	00000097          	auipc	ra,0x0
    80002a1c:	fa8080e7          	jalr	-88(ra) # 800029c0 <_ZN6ThreadD1Ev>
    80002a20:	00048513          	mv	a0,s1
    80002a24:	00000097          	auipc	ra,0x0
    80002a28:	f74080e7          	jalr	-140(ra) # 80002998 <_ZdlPv>
    80002a2c:	01813083          	ld	ra,24(sp)
    80002a30:	01013403          	ld	s0,16(sp)
    80002a34:	00813483          	ld	s1,8(sp)
    80002a38:	02010113          	addi	sp,sp,32
    80002a3c:	00008067          	ret

0000000080002a40 <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int init) {
    sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    80002a40:	fe010113          	addi	sp,sp,-32
    80002a44:	00113c23          	sd	ra,24(sp)
    80002a48:	00813823          	sd	s0,16(sp)
    80002a4c:	00913423          	sd	s1,8(sp)
    80002a50:	02010413          	addi	s0,sp,32
    80002a54:	00050493          	mv	s1,a0
    80002a58:	00008797          	auipc	a5,0x8
    80002a5c:	a5878793          	addi	a5,a5,-1448 # 8000a4b0 <_ZTV9Semaphore+0x10>
    80002a60:	00f53023          	sd	a5,0(a0)
    sem_close(myHandle);
    80002a64:	00853503          	ld	a0,8(a0)
    80002a68:	00000097          	auipc	ra,0x0
    80002a6c:	d58080e7          	jalr	-680(ra) # 800027c0 <_Z9sem_closeP4_sem>
    delete myHandle;
    80002a70:	0084b483          	ld	s1,8(s1)
    80002a74:	00048e63          	beqz	s1,80002a90 <_ZN9SemaphoreD1Ev+0x50>
    80002a78:	00048513          	mv	a0,s1
    80002a7c:	00000097          	auipc	ra,0x0
    80002a80:	d78080e7          	jalr	-648(ra) # 800027f4 <_ZN4_semD1Ev>
    80002a84:	00048513          	mv	a0,s1
    80002a88:	00000097          	auipc	ra,0x0
    80002a8c:	f10080e7          	jalr	-240(ra) # 80002998 <_ZdlPv>
    myHandle = nullptr;
}
    80002a90:	01813083          	ld	ra,24(sp)
    80002a94:	01013403          	ld	s0,16(sp)
    80002a98:	00813483          	ld	s1,8(sp)
    80002a9c:	02010113          	addi	sp,sp,32
    80002aa0:	00008067          	ret

0000000080002aa4 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    80002aa4:	fe010113          	addi	sp,sp,-32
    80002aa8:	00113c23          	sd	ra,24(sp)
    80002aac:	00813823          	sd	s0,16(sp)
    80002ab0:	00913423          	sd	s1,8(sp)
    80002ab4:	02010413          	addi	s0,sp,32
    80002ab8:	00050493          	mv	s1,a0
}
    80002abc:	00000097          	auipc	ra,0x0
    80002ac0:	f84080e7          	jalr	-124(ra) # 80002a40 <_ZN9SemaphoreD1Ev>
    80002ac4:	00048513          	mv	a0,s1
    80002ac8:	00000097          	auipc	ra,0x0
    80002acc:	ed0080e7          	jalr	-304(ra) # 80002998 <_ZdlPv>
    80002ad0:	01813083          	ld	ra,24(sp)
    80002ad4:	01013403          	ld	s0,16(sp)
    80002ad8:	00813483          	ld	s1,8(sp)
    80002adc:	02010113          	addi	sp,sp,32
    80002ae0:	00008067          	ret

0000000080002ae4 <_ZdaPv>:
void operator delete[](void *addr) {
    80002ae4:	ff010113          	addi	sp,sp,-16
    80002ae8:	00113423          	sd	ra,8(sp)
    80002aec:	00813023          	sd	s0,0(sp)
    80002af0:	01010413          	addi	s0,sp,16
    mem_free(addr);
    80002af4:	00000097          	auipc	ra,0x0
    80002af8:	b10080e7          	jalr	-1264(ra) # 80002604 <_Z8mem_freePv>
}
    80002afc:	00813083          	ld	ra,8(sp)
    80002b00:	00013403          	ld	s0,0(sp)
    80002b04:	01010113          	addi	sp,sp,16
    80002b08:	00008067          	ret

0000000080002b0c <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(Body body, void *arg) : body(body), arg(arg) {
    80002b0c:	ff010113          	addi	sp,sp,-16
    80002b10:	00813423          	sd	s0,8(sp)
    80002b14:	01010413          	addi	s0,sp,16
    80002b18:	00008797          	auipc	a5,0x8
    80002b1c:	97078793          	addi	a5,a5,-1680 # 8000a488 <_ZTV6Thread+0x10>
    80002b20:	00f53023          	sd	a5,0(a0)
    80002b24:	00b53823          	sd	a1,16(a0)
    80002b28:	00c53c23          	sd	a2,24(a0)
}
    80002b2c:	00813403          	ld	s0,8(sp)
    80002b30:	01010113          	addi	sp,sp,16
    80002b34:	00008067          	ret

0000000080002b38 <_ZN6Thread5startEv>:
int Thread::start() {
    80002b38:	ff010113          	addi	sp,sp,-16
    80002b3c:	00113423          	sd	ra,8(sp)
    80002b40:	00813023          	sd	s0,0(sp)
    80002b44:	01010413          	addi	s0,sp,16
    return thread_create(&myHandle, body, arg);
    80002b48:	01853603          	ld	a2,24(a0)
    80002b4c:	01053583          	ld	a1,16(a0)
    80002b50:	00850513          	addi	a0,a0,8
    80002b54:	00000097          	auipc	ra,0x0
    80002b58:	ae4080e7          	jalr	-1308(ra) # 80002638 <_Z13thread_createPP7_threadPFvPvES2_>
}
    80002b5c:	00813083          	ld	ra,8(sp)
    80002b60:	00013403          	ld	s0,0(sp)
    80002b64:	01010113          	addi	sp,sp,16
    80002b68:	00008067          	ret

0000000080002b6c <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    80002b6c:	ff010113          	addi	sp,sp,-16
    80002b70:	00113423          	sd	ra,8(sp)
    80002b74:	00813023          	sd	s0,0(sp)
    80002b78:	01010413          	addi	s0,sp,16
    thread_dispatch();
    80002b7c:	00000097          	auipc	ra,0x0
    80002b80:	b9c080e7          	jalr	-1124(ra) # 80002718 <_Z15thread_dispatchv>
}
    80002b84:	00813083          	ld	ra,8(sp)
    80002b88:	00013403          	ld	s0,0(sp)
    80002b8c:	01010113          	addi	sp,sp,16
    80002b90:	00008067          	ret

0000000080002b94 <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t time) {
    80002b94:	ff010113          	addi	sp,sp,-16
    80002b98:	00113423          	sd	ra,8(sp)
    80002b9c:	00813023          	sd	s0,0(sp)
    80002ba0:	01010413          	addi	s0,sp,16
    return time_sleep(time);
    80002ba4:	00000097          	auipc	ra,0x0
    80002ba8:	ce0080e7          	jalr	-800(ra) # 80002884 <_Z10time_sleepm>
}
    80002bac:	00813083          	ld	ra,8(sp)
    80002bb0:	00013403          	ld	s0,0(sp)
    80002bb4:	01010113          	addi	sp,sp,16
    80002bb8:	00008067          	ret

0000000080002bbc <_ZN14PeriodicThread3runEv>:
}

PeriodicThread::PeriodicThread(time_t period) : period(period) {
}

[[noreturn]] void PeriodicThread::run() {
    80002bbc:	fe010113          	addi	sp,sp,-32
    80002bc0:	00113c23          	sd	ra,24(sp)
    80002bc4:	00813823          	sd	s0,16(sp)
    80002bc8:	00913423          	sd	s1,8(sp)
    80002bcc:	02010413          	addi	s0,sp,32
    80002bd0:	00050493          	mv	s1,a0
    while (true) {
        sleep(period);
    80002bd4:	0204b503          	ld	a0,32(s1)
    80002bd8:	00000097          	auipc	ra,0x0
    80002bdc:	fbc080e7          	jalr	-68(ra) # 80002b94 <_ZN6Thread5sleepEm>
        periodicActivation();
    80002be0:	0004b783          	ld	a5,0(s1)
    80002be4:	0187b783          	ld	a5,24(a5)
    80002be8:	00048513          	mv	a0,s1
    80002bec:	000780e7          	jalr	a5
    while (true) {
    80002bf0:	fe5ff06f          	j	80002bd4 <_ZN14PeriodicThread3runEv+0x18>

0000000080002bf4 <_ZN6ThreadC1Ev>:
Thread::Thread() {
    80002bf4:	ff010113          	addi	sp,sp,-16
    80002bf8:	00813423          	sd	s0,8(sp)
    80002bfc:	01010413          	addi	s0,sp,16
    80002c00:	00008797          	auipc	a5,0x8
    80002c04:	88878793          	addi	a5,a5,-1912 # 8000a488 <_ZTV6Thread+0x10>
    80002c08:	00f53023          	sd	a5,0(a0)
    body = [](void *arg) { ((Thread *) arg)->run(); };
    80002c0c:	00000797          	auipc	a5,0x0
    80002c10:	d1078793          	addi	a5,a5,-752 # 8000291c <_ZZN6ThreadC4EvENUlPvE_4_FUNES0_>
    80002c14:	00f53823          	sd	a5,16(a0)
    arg = this;
    80002c18:	00a53c23          	sd	a0,24(a0)
};
    80002c1c:	00813403          	ld	s0,8(sp)
    80002c20:	01010113          	addi	sp,sp,16
    80002c24:	00008067          	ret

0000000080002c28 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    80002c28:	ff010113          	addi	sp,sp,-16
    80002c2c:	00113423          	sd	ra,8(sp)
    80002c30:	00813023          	sd	s0,0(sp)
    80002c34:	01010413          	addi	s0,sp,16
    80002c38:	00008797          	auipc	a5,0x8
    80002c3c:	87878793          	addi	a5,a5,-1928 # 8000a4b0 <_ZTV9Semaphore+0x10>
    80002c40:	00f53023          	sd	a5,0(a0)
    sem_open(&myHandle, init);
    80002c44:	00850513          	addi	a0,a0,8
    80002c48:	00000097          	auipc	ra,0x0
    80002c4c:	b00080e7          	jalr	-1280(ra) # 80002748 <_Z8sem_openPP4_semj>
}
    80002c50:	00813083          	ld	ra,8(sp)
    80002c54:	00013403          	ld	s0,0(sp)
    80002c58:	01010113          	addi	sp,sp,16
    80002c5c:	00008067          	ret

0000000080002c60 <_ZN9Semaphore4waitEv>:
int Semaphore::wait() {
    80002c60:	ff010113          	addi	sp,sp,-16
    80002c64:	00113423          	sd	ra,8(sp)
    80002c68:	00813023          	sd	s0,0(sp)
    80002c6c:	01010413          	addi	s0,sp,16
    return sem_wait(myHandle);
    80002c70:	00853503          	ld	a0,8(a0)
    80002c74:	00000097          	auipc	ra,0x0
    80002c78:	ba8080e7          	jalr	-1112(ra) # 8000281c <_Z8sem_waitP4_sem>
}
    80002c7c:	00813083          	ld	ra,8(sp)
    80002c80:	00013403          	ld	s0,0(sp)
    80002c84:	01010113          	addi	sp,sp,16
    80002c88:	00008067          	ret

0000000080002c8c <_ZN9Semaphore6signalEv>:
int Semaphore::signal() {
    80002c8c:	ff010113          	addi	sp,sp,-16
    80002c90:	00113423          	sd	ra,8(sp)
    80002c94:	00813023          	sd	s0,0(sp)
    80002c98:	01010413          	addi	s0,sp,16
    return sem_signal(myHandle);
    80002c9c:	00853503          	ld	a0,8(a0)
    80002ca0:	00000097          	auipc	ra,0x0
    80002ca4:	bb0080e7          	jalr	-1104(ra) # 80002850 <_Z10sem_signalP4_sem>
}
    80002ca8:	00813083          	ld	ra,8(sp)
    80002cac:	00013403          	ld	s0,0(sp)
    80002cb0:	01010113          	addi	sp,sp,16
    80002cb4:	00008067          	ret

0000000080002cb8 <_ZN14PeriodicThreadC1Em>:
PeriodicThread::PeriodicThread(time_t period) : period(period) {
    80002cb8:	fe010113          	addi	sp,sp,-32
    80002cbc:	00113c23          	sd	ra,24(sp)
    80002cc0:	00813823          	sd	s0,16(sp)
    80002cc4:	00913423          	sd	s1,8(sp)
    80002cc8:	01213023          	sd	s2,0(sp)
    80002ccc:	02010413          	addi	s0,sp,32
    80002cd0:	00050493          	mv	s1,a0
    80002cd4:	00058913          	mv	s2,a1
    80002cd8:	00000097          	auipc	ra,0x0
    80002cdc:	f1c080e7          	jalr	-228(ra) # 80002bf4 <_ZN6ThreadC1Ev>
    80002ce0:	00007797          	auipc	a5,0x7
    80002ce4:	7f078793          	addi	a5,a5,2032 # 8000a4d0 <_ZTV14PeriodicThread+0x10>
    80002ce8:	00f4b023          	sd	a5,0(s1)
    80002cec:	0324b023          	sd	s2,32(s1)
}
    80002cf0:	01813083          	ld	ra,24(sp)
    80002cf4:	01013403          	ld	s0,16(sp)
    80002cf8:	00813483          	ld	s1,8(sp)
    80002cfc:	00013903          	ld	s2,0(sp)
    80002d00:	02010113          	addi	sp,sp,32
    80002d04:	00008067          	ret

0000000080002d08 <_ZN7Console4getcEv>:
    }
}

char Console::getc() {
    80002d08:	ff010113          	addi	sp,sp,-16
    80002d0c:	00113423          	sd	ra,8(sp)
    80002d10:	00813023          	sd	s0,0(sp)
    80002d14:	01010413          	addi	s0,sp,16
    return ::getc();
    80002d18:	00000097          	auipc	ra,0x0
    80002d1c:	ba0080e7          	jalr	-1120(ra) # 800028b8 <_Z4getcv>
}
    80002d20:	00813083          	ld	ra,8(sp)
    80002d24:	00013403          	ld	s0,0(sp)
    80002d28:	01010113          	addi	sp,sp,16
    80002d2c:	00008067          	ret

0000000080002d30 <_ZN7Console4putcEc>:

void Console::putc(char c) {
    80002d30:	ff010113          	addi	sp,sp,-16
    80002d34:	00113423          	sd	ra,8(sp)
    80002d38:	00813023          	sd	s0,0(sp)
    80002d3c:	01010413          	addi	s0,sp,16
    ::putc(c);
    80002d40:	00000097          	auipc	ra,0x0
    80002d44:	bac080e7          	jalr	-1108(ra) # 800028ec <_Z4putcc>
}
    80002d48:	00813083          	ld	ra,8(sp)
    80002d4c:	00013403          	ld	s0,0(sp)
    80002d50:	01010113          	addi	sp,sp,16
    80002d54:	00008067          	ret

0000000080002d58 <_ZN6Thread3runEv>:
    static int sleep(time_t);

protected:
    Thread();

    virtual void run() {}
    80002d58:	ff010113          	addi	sp,sp,-16
    80002d5c:	00813423          	sd	s0,8(sp)
    80002d60:	01010413          	addi	s0,sp,16
    80002d64:	00813403          	ld	s0,8(sp)
    80002d68:	01010113          	addi	sp,sp,16
    80002d6c:	00008067          	ret

0000000080002d70 <_ZN14PeriodicThread18periodicActivationEv>:

class PeriodicThread : public Thread {
protected:
    PeriodicThread(time_t period);

    virtual void periodicActivation() {}
    80002d70:	ff010113          	addi	sp,sp,-16
    80002d74:	00813423          	sd	s0,8(sp)
    80002d78:	01010413          	addi	s0,sp,16
    80002d7c:	00813403          	ld	s0,8(sp)
    80002d80:	01010113          	addi	sp,sp,16
    80002d84:	00008067          	ret

0000000080002d88 <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    80002d88:	ff010113          	addi	sp,sp,-16
    80002d8c:	00113423          	sd	ra,8(sp)
    80002d90:	00813023          	sd	s0,0(sp)
    80002d94:	01010413          	addi	s0,sp,16
    80002d98:	00007797          	auipc	a5,0x7
    80002d9c:	73878793          	addi	a5,a5,1848 # 8000a4d0 <_ZTV14PeriodicThread+0x10>
    80002da0:	00f53023          	sd	a5,0(a0)
    80002da4:	00000097          	auipc	ra,0x0
    80002da8:	c1c080e7          	jalr	-996(ra) # 800029c0 <_ZN6ThreadD1Ev>
    80002dac:	00813083          	ld	ra,8(sp)
    80002db0:	00013403          	ld	s0,0(sp)
    80002db4:	01010113          	addi	sp,sp,16
    80002db8:	00008067          	ret

0000000080002dbc <_ZN14PeriodicThreadD0Ev>:
    80002dbc:	fe010113          	addi	sp,sp,-32
    80002dc0:	00113c23          	sd	ra,24(sp)
    80002dc4:	00813823          	sd	s0,16(sp)
    80002dc8:	00913423          	sd	s1,8(sp)
    80002dcc:	02010413          	addi	s0,sp,32
    80002dd0:	00050493          	mv	s1,a0
    80002dd4:	00007797          	auipc	a5,0x7
    80002dd8:	6fc78793          	addi	a5,a5,1788 # 8000a4d0 <_ZTV14PeriodicThread+0x10>
    80002ddc:	00f53023          	sd	a5,0(a0)
    80002de0:	00000097          	auipc	ra,0x0
    80002de4:	be0080e7          	jalr	-1056(ra) # 800029c0 <_ZN6ThreadD1Ev>
    80002de8:	00048513          	mv	a0,s1
    80002dec:	00000097          	auipc	ra,0x0
    80002df0:	bac080e7          	jalr	-1108(ra) # 80002998 <_ZdlPv>
    80002df4:	01813083          	ld	ra,24(sp)
    80002df8:	01013403          	ld	s0,16(sp)
    80002dfc:	00813483          	ld	s1,8(sp)
    80002e00:	02010113          	addi	sp,sp,32
    80002e04:	00008067          	ret

0000000080002e08 <_Z12kprintStringPKc>:
#include "../h/SysPrint.h"
#include "../lib/console.h"

PrintMutex *PrintMutex::instance = nullptr;

void kprintString(char const *string) {
    80002e08:	fe010113          	addi	sp,sp,-32
    80002e0c:	00113c23          	sd	ra,24(sp)
    80002e10:	00813823          	sd	s0,16(sp)
    80002e14:	00913423          	sd	s1,8(sp)
    80002e18:	02010413          	addi	s0,sp,32
    80002e1c:	00050493          	mv	s1,a0
#include "Mutex.h"

class PrintMutex : public KernelObject {
public:
    static PrintMutex* getInstance() {
        if (!instance) instance = new PrintMutex;
    80002e20:	00008797          	auipc	a5,0x8
    80002e24:	8187b783          	ld	a5,-2024(a5) # 8000a638 <_ZN10PrintMutex8instanceE>
    80002e28:	02078863          	beqz	a5,80002e58 <_Z12kprintStringPKc+0x50>
        return instance;
    }

    static void wait() {
        getInstance()->mutex.wait();
    80002e2c:	00008517          	auipc	a0,0x8
    80002e30:	80c53503          	ld	a0,-2036(a0) # 8000a638 <_ZN10PrintMutex8instanceE>
    80002e34:	00850513          	addi	a0,a0,8
    80002e38:	fffff097          	auipc	ra,0xfffff
    80002e3c:	17c080e7          	jalr	380(ra) # 80001fb4 <_ZN5Mutex4waitEv>
    PrintMutex::wait();
    while (*string != '\0') {
    80002e40:	0004c503          	lbu	a0,0(s1)
    80002e44:	04050c63          	beqz	a0,80002e9c <_Z12kprintStringPKc+0x94>
        __putc(*string);
    80002e48:	00005097          	auipc	ra,0x5
    80002e4c:	c44080e7          	jalr	-956(ra) # 80007a8c <__putc>
        string++;
    80002e50:	00148493          	addi	s1,s1,1
    while (*string != '\0') {
    80002e54:	fedff06f          	j	80002e40 <_Z12kprintStringPKc+0x38>
        return kmalloc(size);
    80002e58:	00100513          	li	a0,1
    80002e5c:	fffff097          	auipc	ra,0xfffff
    80002e60:	f10080e7          	jalr	-240(ra) # 80001d6c <_Z7kmallocm>
    80002e64:	00100793          	li	a5,1
    80002e68:	00f52823          	sw	a5,16(a0)
    explicit ThreadList() = default;
    80002e6c:	00053c23          	sd	zero,24(a0)
    80002e70:	02053023          	sd	zero,32(a0)
    80002e74:	02053423          	sd	zero,40(a0)
    80002e78:	02052823          	sw	zero,48(a0)
    80002e7c:	00007797          	auipc	a5,0x7
    80002e80:	7447b783          	ld	a5,1860(a5) # 8000a5c0 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002e84:	01078793          	addi	a5,a5,16
    80002e88:	00f53423          	sd	a5,8(a0)
    80002e8c:	02053c23          	sd	zero,56(a0)
        if (!instance) instance = new PrintMutex;
    80002e90:	00007797          	auipc	a5,0x7
    80002e94:	7aa7b423          	sd	a0,1960(a5) # 8000a638 <_ZN10PrintMutex8instanceE>
    80002e98:	f95ff06f          	j	80002e2c <_Z12kprintStringPKc+0x24>
    80002e9c:	00007797          	auipc	a5,0x7
    80002ea0:	79c7b783          	ld	a5,1948(a5) # 8000a638 <_ZN10PrintMutex8instanceE>
    80002ea4:	02078663          	beqz	a5,80002ed0 <_Z12kprintStringPKc+0xc8>
    }

    static void signal() {
        getInstance()->mutex.signal();
    80002ea8:	00007517          	auipc	a0,0x7
    80002eac:	79053503          	ld	a0,1936(a0) # 8000a638 <_ZN10PrintMutex8instanceE>
    80002eb0:	00850513          	addi	a0,a0,8
    80002eb4:	fffff097          	auipc	ra,0xfffff
    80002eb8:	180080e7          	jalr	384(ra) # 80002034 <_ZN5Mutex6signalEv>
    }
    PrintMutex::signal();
}
    80002ebc:	01813083          	ld	ra,24(sp)
    80002ec0:	01013403          	ld	s0,16(sp)
    80002ec4:	00813483          	ld	s1,8(sp)
    80002ec8:	02010113          	addi	sp,sp,32
    80002ecc:	00008067          	ret
    80002ed0:	00100513          	li	a0,1
    80002ed4:	fffff097          	auipc	ra,0xfffff
    80002ed8:	e98080e7          	jalr	-360(ra) # 80001d6c <_Z7kmallocm>
    80002edc:	00100793          	li	a5,1
    80002ee0:	00f52823          	sw	a5,16(a0)
    80002ee4:	00053c23          	sd	zero,24(a0)
    80002ee8:	02053023          	sd	zero,32(a0)
    80002eec:	02053423          	sd	zero,40(a0)
    80002ef0:	02052823          	sw	zero,48(a0)
    80002ef4:	00007797          	auipc	a5,0x7
    80002ef8:	6cc7b783          	ld	a5,1740(a5) # 8000a5c0 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002efc:	01078793          	addi	a5,a5,16
    80002f00:	00f53423          	sd	a5,8(a0)
    80002f04:	02053c23          	sd	zero,56(a0)
        if (!instance) instance = new PrintMutex;
    80002f08:	00007797          	auipc	a5,0x7
    80002f0c:	72a7b823          	sd	a0,1840(a5) # 8000a638 <_ZN10PrintMutex8instanceE>
    80002f10:	f99ff06f          	j	80002ea8 <_Z12kprintStringPKc+0xa0>

0000000080002f14 <_Z13kprintIntegeri>:

void kprintInteger(int integer) {
    80002f14:	fd010113          	addi	sp,sp,-48
    80002f18:	02113423          	sd	ra,40(sp)
    80002f1c:	02813023          	sd	s0,32(sp)
    80002f20:	00913c23          	sd	s1,24(sp)
    80002f24:	03010413          	addi	s0,sp,48
    80002f28:	00050493          	mv	s1,a0
    80002f2c:	00007797          	auipc	a5,0x7
    80002f30:	70c7b783          	ld	a5,1804(a5) # 8000a638 <_ZN10PrintMutex8instanceE>
    80002f34:	0a078263          	beqz	a5,80002fd8 <_Z13kprintIntegeri+0xc4>
        getInstance()->mutex.wait();
    80002f38:	00007517          	auipc	a0,0x7
    80002f3c:	70053503          	ld	a0,1792(a0) # 8000a638 <_ZN10PrintMutex8instanceE>
    80002f40:	00850513          	addi	a0,a0,8
    80002f44:	fffff097          	auipc	ra,0xfffff
    80002f48:	070080e7          	jalr	112(ra) # 80001fb4 <_ZN5Mutex4waitEv>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if (integer < 0) {
    80002f4c:	0c04c863          	bltz	s1,8000301c <_Z13kprintIntegeri+0x108>
        neg = 1;
        x = -integer;
    } else {
        x = integer;
    80002f50:	0004851b          	sext.w	a0,s1
    neg = 0;
    80002f54:	00000593          	li	a1,0
    }

    i = 0;
    80002f58:	00000493          	li	s1,0
    do {
        buf[i++] = digits[x % 10];
    80002f5c:	00a00693          	li	a3,10
    80002f60:	02d577bb          	remuw	a5,a0,a3
    80002f64:	00048613          	mv	a2,s1
    80002f68:	0014849b          	addiw	s1,s1,1
    80002f6c:	02079713          	slli	a4,a5,0x20
    80002f70:	02075713          	srli	a4,a4,0x20
    80002f74:	00005797          	auipc	a5,0x5
    80002f78:	26c78793          	addi	a5,a5,620 # 800081e0 <_ZZ13kprintIntegeriE6digits>
    80002f7c:	00e787b3          	add	a5,a5,a4
    80002f80:	0007c703          	lbu	a4,0(a5)
    80002f84:	fe040793          	addi	a5,s0,-32
    80002f88:	00c787b3          	add	a5,a5,a2
    80002f8c:	fee78823          	sb	a4,-16(a5)
    } while ((x /= 10) != 0);
    80002f90:	0005071b          	sext.w	a4,a0
    80002f94:	02d5553b          	divuw	a0,a0,a3
    80002f98:	00900793          	li	a5,9
    80002f9c:	fce7e0e3          	bltu	a5,a4,80002f5c <_Z13kprintIntegeri+0x48>
    if (neg) buf[i++] = '-';
    80002fa0:	00058c63          	beqz	a1,80002fb8 <_Z13kprintIntegeri+0xa4>
    80002fa4:	fe040793          	addi	a5,s0,-32
    80002fa8:	009784b3          	add	s1,a5,s1
    80002fac:	02d00793          	li	a5,45
    80002fb0:	fef48823          	sb	a5,-16(s1)
    80002fb4:	0026049b          	addiw	s1,a2,2

    while (--i >= 0)
    80002fb8:	fff4849b          	addiw	s1,s1,-1
    80002fbc:	0604c663          	bltz	s1,80003028 <_Z13kprintIntegeri+0x114>
        __putc(buf[i]);
    80002fc0:	fe040793          	addi	a5,s0,-32
    80002fc4:	009787b3          	add	a5,a5,s1
    80002fc8:	ff07c503          	lbu	a0,-16(a5)
    80002fcc:	00005097          	auipc	ra,0x5
    80002fd0:	ac0080e7          	jalr	-1344(ra) # 80007a8c <__putc>
    80002fd4:	fe5ff06f          	j	80002fb8 <_Z13kprintIntegeri+0xa4>
    80002fd8:	00100513          	li	a0,1
    80002fdc:	fffff097          	auipc	ra,0xfffff
    80002fe0:	d90080e7          	jalr	-624(ra) # 80001d6c <_Z7kmallocm>
    80002fe4:	00100793          	li	a5,1
    80002fe8:	00f52823          	sw	a5,16(a0)
    80002fec:	00053c23          	sd	zero,24(a0)
    80002ff0:	02053023          	sd	zero,32(a0)
    80002ff4:	02053423          	sd	zero,40(a0)
    80002ff8:	02052823          	sw	zero,48(a0)
    80002ffc:	00007797          	auipc	a5,0x7
    80003000:	5c47b783          	ld	a5,1476(a5) # 8000a5c0 <_GLOBAL_OFFSET_TABLE_+0x30>
    80003004:	01078793          	addi	a5,a5,16
    80003008:	00f53423          	sd	a5,8(a0)
    8000300c:	02053c23          	sd	zero,56(a0)
        if (!instance) instance = new PrintMutex;
    80003010:	00007797          	auipc	a5,0x7
    80003014:	62a7b423          	sd	a0,1576(a5) # 8000a638 <_ZN10PrintMutex8instanceE>
    80003018:	f21ff06f          	j	80002f38 <_Z13kprintIntegeri+0x24>
        x = -integer;
    8000301c:	4090053b          	negw	a0,s1
        neg = 1;
    80003020:	00100593          	li	a1,1
    80003024:	f35ff06f          	j	80002f58 <_Z13kprintIntegeri+0x44>
    80003028:	00007797          	auipc	a5,0x7
    8000302c:	6107b783          	ld	a5,1552(a5) # 8000a638 <_ZN10PrintMutex8instanceE>
    80003030:	02078663          	beqz	a5,8000305c <_Z13kprintIntegeri+0x148>
        getInstance()->mutex.signal();
    80003034:	00007517          	auipc	a0,0x7
    80003038:	60453503          	ld	a0,1540(a0) # 8000a638 <_ZN10PrintMutex8instanceE>
    8000303c:	00850513          	addi	a0,a0,8
    80003040:	fffff097          	auipc	ra,0xfffff
    80003044:	ff4080e7          	jalr	-12(ra) # 80002034 <_ZN5Mutex6signalEv>
    PrintMutex::signal();
}
    80003048:	02813083          	ld	ra,40(sp)
    8000304c:	02013403          	ld	s0,32(sp)
    80003050:	01813483          	ld	s1,24(sp)
    80003054:	03010113          	addi	sp,sp,48
    80003058:	00008067          	ret
    8000305c:	00100513          	li	a0,1
    80003060:	fffff097          	auipc	ra,0xfffff
    80003064:	d0c080e7          	jalr	-756(ra) # 80001d6c <_Z7kmallocm>
    80003068:	00100793          	li	a5,1
    8000306c:	00f52823          	sw	a5,16(a0)
    80003070:	00053c23          	sd	zero,24(a0)
    80003074:	02053023          	sd	zero,32(a0)
    80003078:	02053423          	sd	zero,40(a0)
    8000307c:	02052823          	sw	zero,48(a0)
    80003080:	00007797          	auipc	a5,0x7
    80003084:	5407b783          	ld	a5,1344(a5) # 8000a5c0 <_GLOBAL_OFFSET_TABLE_+0x30>
    80003088:	01078793          	addi	a5,a5,16
    8000308c:	00f53423          	sd	a5,8(a0)
    80003090:	02053c23          	sd	zero,56(a0)
        if (!instance) instance = new PrintMutex;
    80003094:	00007797          	auipc	a5,0x7
    80003098:	5aa7b223          	sd	a0,1444(a5) # 8000a638 <_ZN10PrintMutex8instanceE>
    8000309c:	f99ff06f          	j	80003034 <_Z13kprintIntegeri+0x120>

00000000800030a0 <_Z14kprintUnsignedm>:

void kprintUnsigned(uint64 x) {
    800030a0:	fd010113          	addi	sp,sp,-48
    800030a4:	02113423          	sd	ra,40(sp)
    800030a8:	02813023          	sd	s0,32(sp)
    800030ac:	00913c23          	sd	s1,24(sp)
    800030b0:	01213823          	sd	s2,16(sp)
    800030b4:	03010413          	addi	s0,sp,48
    800030b8:	00050913          	mv	s2,a0
    800030bc:	00007797          	auipc	a5,0x7
    800030c0:	57c7b783          	ld	a5,1404(a5) # 8000a638 <_ZN10PrintMutex8instanceE>
    800030c4:	06078a63          	beqz	a5,80003138 <_Z14kprintUnsignedm+0x98>
        getInstance()->mutex.wait();
    800030c8:	00007517          	auipc	a0,0x7
    800030cc:	57053503          	ld	a0,1392(a0) # 8000a638 <_ZN10PrintMutex8instanceE>
    800030d0:	00850513          	addi	a0,a0,8
    800030d4:	fffff097          	auipc	ra,0xfffff
    800030d8:	ee0080e7          	jalr	-288(ra) # 80001fb4 <_ZN5Mutex4waitEv>
    PrintMutex::wait();
    static char digits[] = "0123456789";
    char buf[16];

    int i = 0;
    800030dc:	00000493          	li	s1,0
    do {
        buf[i++] = digits[x % 10];
    800030e0:	00a00693          	li	a3,10
    800030e4:	02d97633          	remu	a2,s2,a3
    800030e8:	00005717          	auipc	a4,0x5
    800030ec:	0f870713          	addi	a4,a4,248 # 800081e0 <_ZZ13kprintIntegeriE6digits>
    800030f0:	00c70733          	add	a4,a4,a2
    800030f4:	01074703          	lbu	a4,16(a4)
    800030f8:	fe040613          	addi	a2,s0,-32
    800030fc:	009607b3          	add	a5,a2,s1
    80003100:	0014849b          	addiw	s1,s1,1
    80003104:	fee78823          	sb	a4,-16(a5)
    } while ((x /= 10) != 0);
    80003108:	00090713          	mv	a4,s2
    8000310c:	02d95933          	divu	s2,s2,a3
    80003110:	00900793          	li	a5,9
    80003114:	fce7e6e3          	bltu	a5,a4,800030e0 <_Z14kprintUnsignedm+0x40>

    while (--i >= 0)
    80003118:	fff4849b          	addiw	s1,s1,-1
    8000311c:	0604c063          	bltz	s1,8000317c <_Z14kprintUnsignedm+0xdc>
        __putc(buf[i]);
    80003120:	fe040793          	addi	a5,s0,-32
    80003124:	009787b3          	add	a5,a5,s1
    80003128:	ff07c503          	lbu	a0,-16(a5)
    8000312c:	00005097          	auipc	ra,0x5
    80003130:	960080e7          	jalr	-1696(ra) # 80007a8c <__putc>
    80003134:	fe5ff06f          	j	80003118 <_Z14kprintUnsignedm+0x78>
    80003138:	00100513          	li	a0,1
    8000313c:	fffff097          	auipc	ra,0xfffff
    80003140:	c30080e7          	jalr	-976(ra) # 80001d6c <_Z7kmallocm>
    80003144:	00100793          	li	a5,1
    80003148:	00f52823          	sw	a5,16(a0)
    8000314c:	00053c23          	sd	zero,24(a0)
    80003150:	02053023          	sd	zero,32(a0)
    80003154:	02053423          	sd	zero,40(a0)
    80003158:	02052823          	sw	zero,48(a0)
    8000315c:	00007797          	auipc	a5,0x7
    80003160:	4647b783          	ld	a5,1124(a5) # 8000a5c0 <_GLOBAL_OFFSET_TABLE_+0x30>
    80003164:	01078793          	addi	a5,a5,16
    80003168:	00f53423          	sd	a5,8(a0)
    8000316c:	02053c23          	sd	zero,56(a0)
        if (!instance) instance = new PrintMutex;
    80003170:	00007797          	auipc	a5,0x7
    80003174:	4ca7b423          	sd	a0,1224(a5) # 8000a638 <_ZN10PrintMutex8instanceE>
    80003178:	f51ff06f          	j	800030c8 <_Z14kprintUnsignedm+0x28>
    8000317c:	00007797          	auipc	a5,0x7
    80003180:	4bc7b783          	ld	a5,1212(a5) # 8000a638 <_ZN10PrintMutex8instanceE>
    80003184:	02078863          	beqz	a5,800031b4 <_Z14kprintUnsignedm+0x114>
        getInstance()->mutex.signal();
    80003188:	00007517          	auipc	a0,0x7
    8000318c:	4b053503          	ld	a0,1200(a0) # 8000a638 <_ZN10PrintMutex8instanceE>
    80003190:	00850513          	addi	a0,a0,8
    80003194:	fffff097          	auipc	ra,0xfffff
    80003198:	ea0080e7          	jalr	-352(ra) # 80002034 <_ZN5Mutex6signalEv>
    PrintMutex::signal();
}
    8000319c:	02813083          	ld	ra,40(sp)
    800031a0:	02013403          	ld	s0,32(sp)
    800031a4:	01813483          	ld	s1,24(sp)
    800031a8:	01013903          	ld	s2,16(sp)
    800031ac:	03010113          	addi	sp,sp,48
    800031b0:	00008067          	ret
    800031b4:	00100513          	li	a0,1
    800031b8:	fffff097          	auipc	ra,0xfffff
    800031bc:	bb4080e7          	jalr	-1100(ra) # 80001d6c <_Z7kmallocm>
    800031c0:	00100793          	li	a5,1
    800031c4:	00f52823          	sw	a5,16(a0)
    800031c8:	00053c23          	sd	zero,24(a0)
    800031cc:	02053023          	sd	zero,32(a0)
    800031d0:	02053423          	sd	zero,40(a0)
    800031d4:	02052823          	sw	zero,48(a0)
    800031d8:	00007797          	auipc	a5,0x7
    800031dc:	3e87b783          	ld	a5,1000(a5) # 8000a5c0 <_GLOBAL_OFFSET_TABLE_+0x30>
    800031e0:	01078793          	addi	a5,a5,16
    800031e4:	00f53423          	sd	a5,8(a0)
    800031e8:	02053c23          	sd	zero,56(a0)
        if (!instance) instance = new PrintMutex;
    800031ec:	00007797          	auipc	a5,0x7
    800031f0:	44a7b623          	sd	a0,1100(a5) # 8000a638 <_ZN10PrintMutex8instanceE>
    800031f4:	f95ff06f          	j	80003188 <_Z14kprintUnsignedm+0xe8>

00000000800031f8 <_ZN3TCB13threadWrapperEv>:
    TCB::contextSwitch(&old->context, &running->context);

    unlock()
}

void TCB::threadWrapper() {
    800031f8:	fe010113          	addi	sp,sp,-32
    800031fc:	00113c23          	sd	ra,24(sp)
    80003200:	00813823          	sd	s0,16(sp)
    80003204:	00913423          	sd	s1,8(sp)
    80003208:	02010413          	addi	s0,sp,32
    Riscv::popSppSpie(running->privileged);
    8000320c:	00007497          	auipc	s1,0x7
    80003210:	43448493          	addi	s1,s1,1076 # 8000a640 <_ZN3TCB7runningE>
    80003214:	0004b783          	ld	a5,0(s1)
    80003218:	0287c503          	lbu	a0,40(a5)
    8000321c:	fffff097          	auipc	ra,0xfffff
    80003220:	efc080e7          	jalr	-260(ra) # 80002118 <_ZN5Riscv10popSppSpieEb>
    running->body(running->args);
    80003224:	0004b783          	ld	a5,0(s1)
    80003228:	0087b703          	ld	a4,8(a5)
    8000322c:	0107b503          	ld	a0,16(a5)
    80003230:	000700e7          	jalr	a4

    __asm__ volatile ("li a0, 0x12");
    80003234:	01200513          	li	a0,18
    __asm__ volatile ("ecall");
    80003238:	00000073          	ecall
}
    8000323c:	01813083          	ld	ra,24(sp)
    80003240:	01013403          	ld	s0,16(sp)
    80003244:	00813483          	ld	s1,8(sp)
    80003248:	02010113          	addi	sp,sp,32
    8000324c:	00008067          	ret

0000000080003250 <_ZN3TCBC1Ev>:
TCB::TCB() {
    80003250:	fe010113          	addi	sp,sp,-32
    80003254:	00113c23          	sd	ra,24(sp)
    80003258:	00813823          	sd	s0,16(sp)
    8000325c:	00913423          	sd	s1,8(sp)
    80003260:	02010413          	addi	s0,sp,32
    80003264:	00050493          	mv	s1,a0
    80003268:	00053023          	sd	zero,0(a0)
    8000326c:	00053423          	sd	zero,8(a0)
    80003270:	00053823          	sd	zero,16(a0)
    80003274:	00053c23          	sd	zero,24(a0)
    80003278:	00001537          	lui	a0,0x1
    8000327c:	fffff097          	auipc	ra,0xfffff
    80003280:	af0080e7          	jalr	-1296(ra) # 80001d6c <_Z7kmallocm>
    80003284:	02a4b023          	sd	a0,32(s1)
    80003288:	00100793          	li	a5,1
    8000328c:	02f48423          	sb	a5,40(s1)
    80003290:	0204b823          	sd	zero,48(s1)
    80003294:	0204bc23          	sd	zero,56(s1)
    80003298:	00200793          	li	a5,2
    8000329c:	04f4b023          	sd	a5,64(s1)
    800032a0:	0404a423          	sw	zero,72(s1)
    800032a4:	0404b823          	sd	zero,80(s1)
    800032a8:	0404bc23          	sd	zero,88(s1)
    800032ac:	0604b023          	sd	zero,96(s1)
    800032b0:	0604a423          	sw	zero,104(s1)
    800032b4:	00100793          	li	a5,1
    800032b8:	06f4ac23          	sw	a5,120(s1)
    800032bc:	0804b023          	sd	zero,128(s1)
    800032c0:	0804b423          	sd	zero,136(s1)
    800032c4:	0804b823          	sd	zero,144(s1)
    800032c8:	0804ac23          	sw	zero,152(s1)
    800032cc:	00007797          	auipc	a5,0x7
    800032d0:	2f47b783          	ld	a5,756(a5) # 8000a5c0 <_GLOBAL_OFFSET_TABLE_+0x30>
    800032d4:	01078793          	addi	a5,a5,16
    800032d8:	06f4b823          	sd	a5,112(s1)
    800032dc:	0a04b023          	sd	zero,160(s1)

class TCB;

class ThreadNode : public KernelObject {
public:
    ThreadNode(TCB *data, ThreadNode *next = nullptr, ThreadNode *prev = nullptr) : data(data), next(next), prev(prev) {}
    800032e0:	0a94b423          	sd	s1,168(s1)
    800032e4:	0a04b823          	sd	zero,176(s1)
    800032e8:	0a04bc23          	sd	zero,184(s1)
    800032ec:	0c04b023          	sd	zero,192(s1)
    ssp = (uint64) (kernelStack + DEFAULT_STACK_SIZE);
    800032f0:	000087b7          	lui	a5,0x8
    800032f4:	00f50533          	add	a0,a0,a5
    800032f8:	00a4b023          	sd	a0,0(s1)
}
    800032fc:	01813083          	ld	ra,24(sp)
    80003300:	01013403          	ld	s0,16(sp)
    80003304:	00813483          	ld	s1,8(sp)
    80003308:	02010113          	addi	sp,sp,32
    8000330c:	00008067          	ret

0000000080003310 <_ZN3TCBC1EPFvPvES0_Pmb>:
TCB::TCB(TCB::Body body, void *args, uint64 *threadStack, bool privileged) :
    80003310:	fd010113          	addi	sp,sp,-48
    80003314:	02113423          	sd	ra,40(sp)
    80003318:	02813023          	sd	s0,32(sp)
    8000331c:	00913c23          	sd	s1,24(sp)
    80003320:	01213823          	sd	s2,16(sp)
    80003324:	01313423          	sd	s3,8(sp)
    80003328:	03010413          	addi	s0,sp,48
    8000332c:	00050493          	mv	s1,a0
    80003330:	00068913          	mv	s2,a3
    80003334:	00070993          	mv	s3,a4
        context({(uint64) threadWrapper, (uint64) (threadStack + DEFAULT_STACK_SIZE)}) {
    80003338:	00053023          	sd	zero,0(a0) # 1000 <_entry-0x7ffff000>
    8000333c:	00b53423          	sd	a1,8(a0)
    80003340:	00c53823          	sd	a2,16(a0)
    80003344:	00d53c23          	sd	a3,24(a0)
    80003348:	00001537          	lui	a0,0x1
    8000334c:	fffff097          	auipc	ra,0xfffff
    80003350:	a20080e7          	jalr	-1504(ra) # 80001d6c <_Z7kmallocm>
    80003354:	02a4b023          	sd	a0,32(s1)
    80003358:	03348423          	sb	s3,40(s1)
    8000335c:	00000797          	auipc	a5,0x0
    80003360:	e9c78793          	addi	a5,a5,-356 # 800031f8 <_ZN3TCB13threadWrapperEv>
    80003364:	02f4b823          	sd	a5,48(s1)
    80003368:	00008737          	lui	a4,0x8
    8000336c:	00e90933          	add	s2,s2,a4
    80003370:	0324bc23          	sd	s2,56(s1)
    80003374:	00200793          	li	a5,2
    80003378:	04f4b023          	sd	a5,64(s1)
    8000337c:	0404a423          	sw	zero,72(s1)
    80003380:	05048913          	addi	s2,s1,80
    80003384:	0404b823          	sd	zero,80(s1)
    80003388:	0404bc23          	sd	zero,88(s1)
    8000338c:	0604b023          	sd	zero,96(s1)
    80003390:	0604a423          	sw	zero,104(s1)
    80003394:	00100793          	li	a5,1
    80003398:	06f4ac23          	sw	a5,120(s1)
    8000339c:	0804b023          	sd	zero,128(s1)
    800033a0:	0804b423          	sd	zero,136(s1)
    800033a4:	0804b823          	sd	zero,144(s1)
    800033a8:	0804ac23          	sw	zero,152(s1)
    800033ac:	00007797          	auipc	a5,0x7
    800033b0:	2147b783          	ld	a5,532(a5) # 8000a5c0 <_GLOBAL_OFFSET_TABLE_+0x30>
    800033b4:	01078793          	addi	a5,a5,16
    800033b8:	06f4b823          	sd	a5,112(s1)
    800033bc:	0a04b023          	sd	zero,160(s1)
    800033c0:	0a94b423          	sd	s1,168(s1)
    800033c4:	0a04b823          	sd	zero,176(s1)
    800033c8:	0a04bc23          	sd	zero,184(s1)
    800033cc:	0c04b023          	sd	zero,192(s1)
    ssp = (uint64) (kernelStack + DEFAULT_STACK_SIZE);
    800033d0:	00e50533          	add	a0,a0,a4
    800033d4:	00a4b023          	sd	a0,0(s1)
    Scheduler::put(this);
    800033d8:	00048513          	mv	a0,s1
    800033dc:	fffff097          	auipc	ra,0xfffff
    800033e0:	0a8080e7          	jalr	168(ra) # 80002484 <_ZN9Scheduler3putEP3TCB>
    800033e4:	03c0006f          	j	80003420 <_ZN3TCBC1EPFvPvES0_Pmb+0x110>
    800033e8:	00050993          	mv	s3,a0
    800033ec:	00007797          	auipc	a5,0x7
    800033f0:	1d47b783          	ld	a5,468(a5) # 8000a5c0 <_GLOBAL_OFFSET_TABLE_+0x30>
    800033f4:	01078793          	addi	a5,a5,16
    800033f8:	06f4b823          	sd	a5,112(s1)
    800033fc:	07048513          	addi	a0,s1,112
    80003400:	ffffe097          	auipc	ra,0xffffe
    80003404:	4dc080e7          	jalr	1244(ra) # 800018dc <_ZN15KernelSemaphoreD1Ev>
        context({(uint64) threadWrapper, (uint64) (threadStack + DEFAULT_STACK_SIZE)}) {
    80003408:	00090513          	mv	a0,s2
    8000340c:	00001097          	auipc	ra,0x1
    80003410:	a40080e7          	jalr	-1472(ra) # 80003e4c <_ZN10ThreadListD1Ev>
    80003414:	00098513          	mv	a0,s3
    80003418:	00008097          	auipc	ra,0x8
    8000341c:	320080e7          	jalr	800(ra) # 8000b738 <_Unwind_Resume>
}
    80003420:	02813083          	ld	ra,40(sp)
    80003424:	02013403          	ld	s0,32(sp)
    80003428:	01813483          	ld	s1,24(sp)
    8000342c:	01013903          	ld	s2,16(sp)
    80003430:	00813983          	ld	s3,8(sp)
    80003434:	03010113          	addi	sp,sp,48
    80003438:	00008067          	ret

000000008000343c <_ZN3TCB18createKernelThreadEPFvPvES0_Pm>:
TCB *TCB::createKernelThread(TCB::Body body, void *args, uint64 *threadStack) {
    8000343c:	fd010113          	addi	sp,sp,-48
    80003440:	02113423          	sd	ra,40(sp)
    80003444:	02813023          	sd	s0,32(sp)
    80003448:	00913c23          	sd	s1,24(sp)
    8000344c:	01213823          	sd	s2,16(sp)
    80003450:	01313423          	sd	s3,8(sp)
    80003454:	01413023          	sd	s4,0(sp)
    80003458:	03010413          	addi	s0,sp,48
    if (!body) return nullptr;
    8000345c:	02050e63          	beqz	a0,80003498 <_ZN3TCB18createKernelThreadEPFvPvES0_Pm+0x5c>
    80003460:	00050493          	mv	s1,a0
    80003464:	00058913          	mv	s2,a1
    80003468:	00060993          	mv	s3,a2
    8000346c:	00400513          	li	a0,4
    80003470:	fffff097          	auipc	ra,0xfffff
    80003474:	8fc080e7          	jalr	-1796(ra) # 80001d6c <_Z7kmallocm>
    80003478:	00050a13          	mv	s4,a0
    return new TCB(body, args, threadStack, true);
    8000347c:	00100713          	li	a4,1
    80003480:	00098693          	mv	a3,s3
    80003484:	00090613          	mv	a2,s2
    80003488:	00048593          	mv	a1,s1
    8000348c:	00000097          	auipc	ra,0x0
    80003490:	e84080e7          	jalr	-380(ra) # 80003310 <_ZN3TCBC1EPFvPvES0_Pmb>
    80003494:	0080006f          	j	8000349c <_ZN3TCB18createKernelThreadEPFvPvES0_Pm+0x60>
    if (!body) return nullptr;
    80003498:	00000a13          	li	s4,0
}
    8000349c:	000a0513          	mv	a0,s4
    800034a0:	02813083          	ld	ra,40(sp)
    800034a4:	02013403          	ld	s0,32(sp)
    800034a8:	01813483          	ld	s1,24(sp)
    800034ac:	01013903          	ld	s2,16(sp)
    800034b0:	00813983          	ld	s3,8(sp)
    800034b4:	00013a03          	ld	s4,0(sp)
    800034b8:	03010113          	addi	sp,sp,48
    800034bc:	00008067          	ret
    800034c0:	00050493          	mv	s1,a0
        kfree(addr);
    800034c4:	000a0513          	mv	a0,s4
    800034c8:	fffff097          	auipc	ra,0xfffff
    800034cc:	aac080e7          	jalr	-1364(ra) # 80001f74 <_Z5kfreePv>
    800034d0:	00048513          	mv	a0,s1
    800034d4:	00008097          	auipc	ra,0x8
    800034d8:	264080e7          	jalr	612(ra) # 8000b738 <_Unwind_Resume>

00000000800034dc <_ZN3TCB18createKernelThreadEPFvPvES0_>:
    if (!body) return nullptr;
    800034dc:	04050e63          	beqz	a0,80003538 <_ZN3TCB18createKernelThreadEPFvPvES0_+0x5c>
TCB *TCB::createKernelThread(TCB::Body body, void *args) {
    800034e0:	fe010113          	addi	sp,sp,-32
    800034e4:	00113c23          	sd	ra,24(sp)
    800034e8:	00813823          	sd	s0,16(sp)
    800034ec:	00913423          	sd	s1,8(sp)
    800034f0:	01213023          	sd	s2,0(sp)
    800034f4:	02010413          	addi	s0,sp,32
    800034f8:	00050493          	mv	s1,a0
    800034fc:	00058913          	mv	s2,a1
    uint64 *threadStack = (uint64 *) kmalloc(DEFAULT_STACK_SIZE * sizeof(uint64));
    80003500:	00008537          	lui	a0,0x8
    80003504:	fffff097          	auipc	ra,0xfffff
    80003508:	868080e7          	jalr	-1944(ra) # 80001d6c <_Z7kmallocm>
    8000350c:	00050613          	mv	a2,a0
    return createKernelThread(body, args, threadStack);
    80003510:	00090593          	mv	a1,s2
    80003514:	00048513          	mv	a0,s1
    80003518:	00000097          	auipc	ra,0x0
    8000351c:	f24080e7          	jalr	-220(ra) # 8000343c <_ZN3TCB18createKernelThreadEPFvPvES0_Pm>
}
    80003520:	01813083          	ld	ra,24(sp)
    80003524:	01013403          	ld	s0,16(sp)
    80003528:	00813483          	ld	s1,8(sp)
    8000352c:	00013903          	ld	s2,0(sp)
    80003530:	02010113          	addi	sp,sp,32
    80003534:	00008067          	ret
    if (!body) return nullptr;
    80003538:	00000513          	li	a0,0
}
    8000353c:	00008067          	ret

0000000080003540 <_ZN3TCB16createUserThreadEPFvPvES0_Pm>:
TCB *TCB::createUserThread(TCB::Body body, void *args, uint64 *threadStack) {
    80003540:	fd010113          	addi	sp,sp,-48
    80003544:	02113423          	sd	ra,40(sp)
    80003548:	02813023          	sd	s0,32(sp)
    8000354c:	00913c23          	sd	s1,24(sp)
    80003550:	01213823          	sd	s2,16(sp)
    80003554:	01313423          	sd	s3,8(sp)
    80003558:	01413023          	sd	s4,0(sp)
    8000355c:	03010413          	addi	s0,sp,48
    if (!body) return nullptr;
    80003560:	02050e63          	beqz	a0,8000359c <_ZN3TCB16createUserThreadEPFvPvES0_Pm+0x5c>
    80003564:	00050493          	mv	s1,a0
    80003568:	00058913          	mv	s2,a1
    8000356c:	00060993          	mv	s3,a2
        return kmalloc(size);
    80003570:	00400513          	li	a0,4
    80003574:	ffffe097          	auipc	ra,0xffffe
    80003578:	7f8080e7          	jalr	2040(ra) # 80001d6c <_Z7kmallocm>
    8000357c:	00050a13          	mv	s4,a0
    return new TCB(body, args, threadStack, false);
    80003580:	00000713          	li	a4,0
    80003584:	00098693          	mv	a3,s3
    80003588:	00090613          	mv	a2,s2
    8000358c:	00048593          	mv	a1,s1
    80003590:	00000097          	auipc	ra,0x0
    80003594:	d80080e7          	jalr	-640(ra) # 80003310 <_ZN3TCBC1EPFvPvES0_Pmb>
    80003598:	0080006f          	j	800035a0 <_ZN3TCB16createUserThreadEPFvPvES0_Pm+0x60>
    if (!body) return nullptr;
    8000359c:	00000a13          	li	s4,0
}
    800035a0:	000a0513          	mv	a0,s4
    800035a4:	02813083          	ld	ra,40(sp)
    800035a8:	02013403          	ld	s0,32(sp)
    800035ac:	01813483          	ld	s1,24(sp)
    800035b0:	01013903          	ld	s2,16(sp)
    800035b4:	00813983          	ld	s3,8(sp)
    800035b8:	00013a03          	ld	s4,0(sp)
    800035bc:	03010113          	addi	sp,sp,48
    800035c0:	00008067          	ret
    800035c4:	00050493          	mv	s1,a0
        kfree(addr);
    800035c8:	000a0513          	mv	a0,s4
    800035cc:	fffff097          	auipc	ra,0xfffff
    800035d0:	9a8080e7          	jalr	-1624(ra) # 80001f74 <_Z5kfreePv>
    800035d4:	00048513          	mv	a0,s1
    800035d8:	00008097          	auipc	ra,0x8
    800035dc:	160080e7          	jalr	352(ra) # 8000b738 <_Unwind_Resume>

00000000800035e0 <_ZN3TCB16createUserThreadEPFvPvES0_>:
    if (!body) return nullptr;
    800035e0:	04050e63          	beqz	a0,8000363c <_ZN3TCB16createUserThreadEPFvPvES0_+0x5c>
TCB *TCB::createUserThread(TCB::Body body, void *args) {
    800035e4:	fe010113          	addi	sp,sp,-32
    800035e8:	00113c23          	sd	ra,24(sp)
    800035ec:	00813823          	sd	s0,16(sp)
    800035f0:	00913423          	sd	s1,8(sp)
    800035f4:	01213023          	sd	s2,0(sp)
    800035f8:	02010413          	addi	s0,sp,32
    800035fc:	00050493          	mv	s1,a0
    80003600:	00058913          	mv	s2,a1
    uint64 *threadStack = (uint64 *) kmalloc(DEFAULT_STACK_SIZE * sizeof(uint64));
    80003604:	00008537          	lui	a0,0x8
    80003608:	ffffe097          	auipc	ra,0xffffe
    8000360c:	764080e7          	jalr	1892(ra) # 80001d6c <_Z7kmallocm>
    80003610:	00050613          	mv	a2,a0
    return createUserThread(body, args, threadStack);
    80003614:	00090593          	mv	a1,s2
    80003618:	00048513          	mv	a0,s1
    8000361c:	00000097          	auipc	ra,0x0
    80003620:	f24080e7          	jalr	-220(ra) # 80003540 <_ZN3TCB16createUserThreadEPFvPvES0_Pm>
}
    80003624:	01813083          	ld	ra,24(sp)
    80003628:	01013403          	ld	s0,16(sp)
    8000362c:	00813483          	ld	s1,8(sp)
    80003630:	00013903          	ld	s2,0(sp)
    80003634:	02010113          	addi	sp,sp,32
    80003638:	00008067          	ret
    if (!body) return nullptr;
    8000363c:	00000513          	li	a0,0
}
    80003640:	00008067          	ret

0000000080003644 <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    80003644:	fd010113          	addi	sp,sp,-48
    80003648:	02113423          	sd	ra,40(sp)
    8000364c:	02813023          	sd	s0,32(sp)
    80003650:	00913c23          	sd	s1,24(sp)
    80003654:	03010413          	addi	s0,sp,48
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80003658:	100027f3          	csrr	a5,sstatus
    8000365c:	fcf43823          	sd	a5,-48(s0)
    return sstatus;
    80003660:	fd043783          	ld	a5,-48(s0)
    lock()
    80003664:	fcf43c23          	sd	a5,-40(s0)
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    80003668:	00200793          	li	a5,2
    8000366c:	1007b073          	csrc	sstatus,a5
    TCB *old = running;
    80003670:	00007497          	auipc	s1,0x7
    80003674:	fd04b483          	ld	s1,-48(s1) # 8000a640 <_ZN3TCB7runningE>
        return status == READY;
    80003678:	0484a783          	lw	a5,72(s1)
    if (old->isReady()) Scheduler::put(old);
    8000367c:	04078e63          	beqz	a5,800036d8 <_ZN3TCB8dispatchEv+0x94>
    else if (old->isFinished()) {
    80003680:	00100713          	li	a4,1
    80003684:	06e78263          	beq	a5,a4,800036e8 <_ZN3TCB8dispatchEv+0xa4>
    running = Scheduler::get();
    80003688:	fffff097          	auipc	ra,0xfffff
    8000368c:	d90080e7          	jalr	-624(ra) # 80002418 <_ZN9Scheduler3getEv>
    80003690:	00007797          	auipc	a5,0x7
    80003694:	faa7b823          	sd	a0,-80(a5) # 8000a640 <_ZN3TCB7runningE>
    if (!running) {
    80003698:	04050e63          	beqz	a0,800036f4 <_ZN3TCB8dispatchEv+0xb0>
    TCB::timeSliceCounter = 0;
    8000369c:	00007797          	auipc	a5,0x7
    800036a0:	fa478793          	addi	a5,a5,-92 # 8000a640 <_ZN3TCB7runningE>
    800036a4:	0007b423          	sd	zero,8(a5)
    TCB::contextSwitch(&old->context, &running->context);
    800036a8:	0007b583          	ld	a1,0(a5)
    800036ac:	03058593          	addi	a1,a1,48
    800036b0:	03048513          	addi	a0,s1,48
    800036b4:	ffffe097          	auipc	ra,0xffffe
    800036b8:	94c080e7          	jalr	-1716(ra) # 80001000 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
    unlock()
    800036bc:	fd843783          	ld	a5,-40(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    800036c0:	10079073          	csrw	sstatus,a5
}
    800036c4:	02813083          	ld	ra,40(sp)
    800036c8:	02013403          	ld	s0,32(sp)
    800036cc:	01813483          	ld	s1,24(sp)
    800036d0:	03010113          	addi	sp,sp,48
    800036d4:	00008067          	ret
    if (old->isReady()) Scheduler::put(old);
    800036d8:	00048513          	mv	a0,s1
    800036dc:	fffff097          	auipc	ra,0xfffff
    800036e0:	da8080e7          	jalr	-600(ra) # 80002484 <_ZN9Scheduler3putEP3TCB>
    800036e4:	fa5ff06f          	j	80003688 <_ZN3TCB8dispatchEv+0x44>
        ThreadCollector::signal();
    800036e8:	00000097          	auipc	ra,0x0
    800036ec:	3f4080e7          	jalr	1012(ra) # 80003adc <_ZN15ThreadCollector6signalEv>
    800036f0:	f99ff06f          	j	80003688 <_ZN3TCB8dispatchEv+0x44>
        running = IdleThread::getIdleThread();
    800036f4:	ffffe097          	auipc	ra,0xffffe
    800036f8:	c00080e7          	jalr	-1024(ra) # 800012f4 <_ZN10IdleThread13getIdleThreadEv>
    800036fc:	00007797          	auipc	a5,0x7
    80003700:	f4a7b223          	sd	a0,-188(a5) # 8000a640 <_ZN3TCB7runningE>
    80003704:	f99ff06f          	j	8000369c <_ZN3TCB8dispatchEv+0x58>

0000000080003708 <_ZN3TCB4exitEv>:
void TCB::exit() {
    80003708:	ff010113          	addi	sp,sp,-16
    8000370c:	00113423          	sd	ra,8(sp)
    80003710:	00813023          	sd	s0,0(sp)
    80003714:	01010413          	addi	s0,sp,16
    running->setFinished();
    80003718:	00007517          	auipc	a0,0x7
    8000371c:	f2853503          	ld	a0,-216(a0) # 8000a640 <_ZN3TCB7runningE>
        status = FINISHED;
    80003720:	00100793          	li	a5,1
    80003724:	04f52423          	sw	a5,72(a0)
    running->mutex.wait();
    80003728:	07050513          	addi	a0,a0,112
    8000372c:	fffff097          	auipc	ra,0xfffff
    80003730:	888080e7          	jalr	-1912(ra) # 80001fb4 <_ZN5Mutex4waitEv>
    while (!running->waitingToJoin.isEmpty()) {
    80003734:	00007517          	auipc	a0,0x7
    80003738:	f0c53503          	ld	a0,-244(a0) # 8000a640 <_ZN3TCB7runningE>
        return size == 0;
    8000373c:	06852783          	lw	a5,104(a0)
    80003740:	02078063          	beqz	a5,80003760 <_ZN3TCB4exitEv+0x58>
        TCB *thr = running->waitingToJoin.removeFirst();
    80003744:	05050513          	addi	a0,a0,80
    80003748:	00000097          	auipc	ra,0x0
    8000374c:	560080e7          	jalr	1376(ra) # 80003ca8 <_ZN10ThreadList11removeFirstEv>
        status = READY;
    80003750:	04052423          	sw	zero,72(a0)
        Scheduler::put(thr);
    80003754:	fffff097          	auipc	ra,0xfffff
    80003758:	d30080e7          	jalr	-720(ra) # 80002484 <_ZN9Scheduler3putEP3TCB>
    while (!running->waitingToJoin.isEmpty()) {
    8000375c:	fd9ff06f          	j	80003734 <_ZN3TCB4exitEv+0x2c>
    running->mutex.signal();
    80003760:	07050513          	addi	a0,a0,112
    80003764:	fffff097          	auipc	ra,0xfffff
    80003768:	8d0080e7          	jalr	-1840(ra) # 80002034 <_ZN5Mutex6signalEv>
    ThreadCollector::put(running);
    8000376c:	00007517          	auipc	a0,0x7
    80003770:	ed453503          	ld	a0,-300(a0) # 8000a640 <_ZN3TCB7runningE>
    80003774:	00000097          	auipc	ra,0x0
    80003778:	39c080e7          	jalr	924(ra) # 80003b10 <_ZN15ThreadCollector3putEP3TCB>
    dispatch();
    8000377c:	00000097          	auipc	ra,0x0
    80003780:	ec8080e7          	jalr	-312(ra) # 80003644 <_ZN3TCB8dispatchEv>
}
    80003784:	00813083          	ld	ra,8(sp)
    80003788:	00013403          	ld	s0,0(sp)
    8000378c:	01010113          	addi	sp,sp,16
    80003790:	00008067          	ret

0000000080003794 <_ZN3TCB4joinEv>:
        return status == FINISHED;
    80003794:	04852703          	lw	a4,72(a0)

int TCB::join() {
    if (isFinished()) return 0;
    80003798:	00100793          	li	a5,1
    8000379c:	06f70c63          	beq	a4,a5,80003814 <_ZN3TCB4joinEv+0x80>
int TCB::join() {
    800037a0:	fe010113          	addi	sp,sp,-32
    800037a4:	00113c23          	sd	ra,24(sp)
    800037a8:	00813823          	sd	s0,16(sp)
    800037ac:	00913423          	sd	s1,8(sp)
    800037b0:	01213023          	sd	s2,0(sp)
    800037b4:	02010413          	addi	s0,sp,32
    800037b8:	00050493          	mv	s1,a0

    mutex.wait();
    800037bc:	07050913          	addi	s2,a0,112
    800037c0:	00090513          	mv	a0,s2
    800037c4:	ffffe097          	auipc	ra,0xffffe
    800037c8:	7f0080e7          	jalr	2032(ra) # 80001fb4 <_ZN5Mutex4waitEv>

    running->setBlocked();
    800037cc:	00007597          	auipc	a1,0x7
    800037d0:	e745b583          	ld	a1,-396(a1) # 8000a640 <_ZN3TCB7runningE>
        status = BLOCKED;
    800037d4:	00200793          	li	a5,2
    800037d8:	04f5a423          	sw	a5,72(a1)
    waitingToJoin.addLast(&running->node);
    800037dc:	0a858593          	addi	a1,a1,168
    800037e0:	05048513          	addi	a0,s1,80
    800037e4:	00000097          	auipc	ra,0x0
    800037e8:	480080e7          	jalr	1152(ra) # 80003c64 <_ZN10ThreadList7addLastEP10ThreadNode>

    mutex.signal();
    800037ec:	00090513          	mv	a0,s2
    800037f0:	fffff097          	auipc	ra,0xfffff
    800037f4:	844080e7          	jalr	-1980(ra) # 80002034 <_ZN5Mutex6signalEv>

    return 0;
}
    800037f8:	00000513          	li	a0,0
    800037fc:	01813083          	ld	ra,24(sp)
    80003800:	01013403          	ld	s0,16(sp)
    80003804:	00813483          	ld	s1,8(sp)
    80003808:	00013903          	ld	s2,0(sp)
    8000380c:	02010113          	addi	sp,sp,32
    80003810:	00008067          	ret
    80003814:	00000513          	li	a0,0
    80003818:	00008067          	ret

000000008000381c <_ZN3TCBD1Ev>:

TCB::~TCB() {
    8000381c:	fe010113          	addi	sp,sp,-32
    80003820:	00113c23          	sd	ra,24(sp)
    80003824:	00813823          	sd	s0,16(sp)
    80003828:	00913423          	sd	s1,8(sp)
    8000382c:	02010413          	addi	s0,sp,32
    80003830:	00050493          	mv	s1,a0
    kfree(kernelStack);
    80003834:	02053503          	ld	a0,32(a0)
    80003838:	ffffe097          	auipc	ra,0xffffe
    8000383c:	73c080e7          	jalr	1852(ra) # 80001f74 <_Z5kfreePv>
    kfree(threadStack);
    80003840:	0184b503          	ld	a0,24(s1)
    80003844:	ffffe097          	auipc	ra,0xffffe
    80003848:	730080e7          	jalr	1840(ra) # 80001f74 <_Z5kfreePv>
    8000384c:	00007797          	auipc	a5,0x7
    80003850:	d747b783          	ld	a5,-652(a5) # 8000a5c0 <_GLOBAL_OFFSET_TABLE_+0x30>
    80003854:	01078793          	addi	a5,a5,16
    80003858:	06f4b823          	sd	a5,112(s1)
    8000385c:	07048513          	addi	a0,s1,112
    80003860:	ffffe097          	auipc	ra,0xffffe
    80003864:	07c080e7          	jalr	124(ra) # 800018dc <_ZN15KernelSemaphoreD1Ev>
TCB::~TCB() {
    80003868:	05048513          	addi	a0,s1,80
    8000386c:	00000097          	auipc	ra,0x0
    80003870:	5e0080e7          	jalr	1504(ra) # 80003e4c <_ZN10ThreadListD1Ev>
}
    80003874:	01813083          	ld	ra,24(sp)
    80003878:	01013403          	ld	s0,16(sp)
    8000387c:	00813483          	ld	s1,8(sp)
    80003880:	02010113          	addi	sp,sp,32
    80003884:	00008067          	ret

0000000080003888 <_ZN15ThreadCollectorC1Ev>:
    getInstance()->mutex.wait();
    getInstance()->finishedThreads.addLast(tcb->getNode());
    getInstance()->mutex.signal();
}

ThreadCollector::ThreadCollector() : readyToDelete(0) {
    80003888:	fd010113          	addi	sp,sp,-48
    8000388c:	02113423          	sd	ra,40(sp)
    80003890:	02813023          	sd	s0,32(sp)
    80003894:	00913c23          	sd	s1,24(sp)
    80003898:	01213823          	sd	s2,16(sp)
    8000389c:	01313423          	sd	s3,8(sp)
    800038a0:	01413023          	sd	s4,0(sp)
    800038a4:	03010413          	addi	s0,sp,48
    800038a8:	00050493          	mv	s1,a0
    800038ac:	00053023          	sd	zero,0(a0)
    800038b0:	00850913          	addi	s2,a0,8
    explicit ThreadList() = default;
    800038b4:	00053423          	sd	zero,8(a0)
    800038b8:	00053823          	sd	zero,16(a0)
    800038bc:	00053c23          	sd	zero,24(a0)
    800038c0:	02052023          	sw	zero,32(a0)
    800038c4:	00100793          	li	a5,1
    800038c8:	02f52823          	sw	a5,48(a0)
    800038cc:	02053c23          	sd	zero,56(a0)
    800038d0:	04053023          	sd	zero,64(a0)
    800038d4:	04053423          	sd	zero,72(a0)
    800038d8:	04052823          	sw	zero,80(a0)
    800038dc:	00007797          	auipc	a5,0x7
    800038e0:	ce47b783          	ld	a5,-796(a5) # 8000a5c0 <_GLOBAL_OFFSET_TABLE_+0x30>
    800038e4:	01078793          	addi	a5,a5,16
    800038e8:	02f53423          	sd	a5,40(a0)
    800038ec:	04053c23          	sd	zero,88(a0)
    800038f0:	06050993          	addi	s3,a0,96
    800038f4:	00007797          	auipc	a5,0x7
    800038f8:	cbc7b783          	ld	a5,-836(a5) # 8000a5b0 <_GLOBAL_OFFSET_TABLE_+0x20>
    800038fc:	01078793          	addi	a5,a5,16
    80003900:	06f53023          	sd	a5,96(a0)
    80003904:	06052423          	sw	zero,104(a0)
    80003908:	06053823          	sd	zero,112(a0)
    8000390c:	06053c23          	sd	zero,120(a0)
    80003910:	08053023          	sd	zero,128(a0)
    80003914:	08052423          	sw	zero,136(a0)
    threadCollector = TCB::createKernelThread([](void *){ThreadCollector::run();}, nullptr);
    80003918:	00000593          	li	a1,0
    8000391c:	00000517          	auipc	a0,0x0
    80003920:	2e850513          	addi	a0,a0,744 # 80003c04 <_ZZN15ThreadCollectorC4EvENUlPvE_4_FUNES0_>
    80003924:	00000097          	auipc	ra,0x0
    80003928:	bb8080e7          	jalr	-1096(ra) # 800034dc <_ZN3TCB18createKernelThreadEPFvPvES0_>
    8000392c:	00a4b023          	sd	a0,0(s1)
}
    80003930:	02813083          	ld	ra,40(sp)
    80003934:	02013403          	ld	s0,32(sp)
    80003938:	01813483          	ld	s1,24(sp)
    8000393c:	01013903          	ld	s2,16(sp)
    80003940:	00813983          	ld	s3,8(sp)
    80003944:	00013a03          	ld	s4,0(sp)
    80003948:	03010113          	addi	sp,sp,48
    8000394c:	00008067          	ret
    80003950:	00050a13          	mv	s4,a0
ThreadCollector::ThreadCollector() : readyToDelete(0) {
    80003954:	00098513          	mv	a0,s3
    80003958:	ffffe097          	auipc	ra,0xffffe
    8000395c:	f84080e7          	jalr	-124(ra) # 800018dc <_ZN15KernelSemaphoreD1Ev>
    80003960:	00007797          	auipc	a5,0x7
    80003964:	c607b783          	ld	a5,-928(a5) # 8000a5c0 <_GLOBAL_OFFSET_TABLE_+0x30>
    80003968:	01078793          	addi	a5,a5,16
    8000396c:	02f4b423          	sd	a5,40(s1)
    80003970:	02848513          	addi	a0,s1,40
    80003974:	ffffe097          	auipc	ra,0xffffe
    80003978:	f68080e7          	jalr	-152(ra) # 800018dc <_ZN15KernelSemaphoreD1Ev>
    8000397c:	00090513          	mv	a0,s2
    80003980:	00000097          	auipc	ra,0x0
    80003984:	4cc080e7          	jalr	1228(ra) # 80003e4c <_ZN10ThreadListD1Ev>
    80003988:	000a0513          	mv	a0,s4
    8000398c:	00008097          	auipc	ra,0x8
    80003990:	dac080e7          	jalr	-596(ra) # 8000b738 <_Unwind_Resume>

0000000080003994 <_ZN15ThreadCollectorD1Ev>:
        delete getInstance()->finishedThreads.removeFirst();
        getInstance()->mutex.signal();
    }
}

ThreadCollector::~ThreadCollector() {
    80003994:	fe010113          	addi	sp,sp,-32
    80003998:	00113c23          	sd	ra,24(sp)
    8000399c:	00813823          	sd	s0,16(sp)
    800039a0:	00913423          	sd	s1,8(sp)
    800039a4:	01213023          	sd	s2,0(sp)
    800039a8:	02010413          	addi	s0,sp,32
    800039ac:	00050913          	mv	s2,a0
        return size == 0;
    800039b0:	02092783          	lw	a5,32(s2)
    while (!finishedThreads.isEmpty()) {
    800039b4:	02078863          	beqz	a5,800039e4 <_ZN15ThreadCollectorD1Ev+0x50>
        delete finishedThreads.removeFirst();
    800039b8:	00890513          	addi	a0,s2,8
    800039bc:	00000097          	auipc	ra,0x0
    800039c0:	2ec080e7          	jalr	748(ra) # 80003ca8 <_ZN10ThreadList11removeFirstEv>
    800039c4:	00050493          	mv	s1,a0
    800039c8:	fe0504e3          	beqz	a0,800039b0 <_ZN15ThreadCollectorD1Ev+0x1c>
    800039cc:	00000097          	auipc	ra,0x0
    800039d0:	e50080e7          	jalr	-432(ra) # 8000381c <_ZN3TCBD1Ev>
    800039d4:	00048513          	mv	a0,s1
    800039d8:	ffffe097          	auipc	ra,0xffffe
    800039dc:	59c080e7          	jalr	1436(ra) # 80001f74 <_Z5kfreePv>
    }
    800039e0:	fd1ff06f          	j	800039b0 <_ZN15ThreadCollectorD1Ev+0x1c>
    }
    delete threadCollector;
    800039e4:	00093483          	ld	s1,0(s2)
    800039e8:	00048e63          	beqz	s1,80003a04 <_ZN15ThreadCollectorD1Ev+0x70>
    800039ec:	00048513          	mv	a0,s1
    800039f0:	00000097          	auipc	ra,0x0
    800039f4:	e2c080e7          	jalr	-468(ra) # 8000381c <_ZN3TCBD1Ev>
        kfree(addr);
    800039f8:	00048513          	mv	a0,s1
    800039fc:	ffffe097          	auipc	ra,0xffffe
    80003a00:	578080e7          	jalr	1400(ra) # 80001f74 <_Z5kfreePv>
ThreadCollector::~ThreadCollector() {
    80003a04:	06090513          	addi	a0,s2,96
    80003a08:	ffffe097          	auipc	ra,0xffffe
    80003a0c:	ed4080e7          	jalr	-300(ra) # 800018dc <_ZN15KernelSemaphoreD1Ev>
    80003a10:	00007797          	auipc	a5,0x7
    80003a14:	bb07b783          	ld	a5,-1104(a5) # 8000a5c0 <_GLOBAL_OFFSET_TABLE_+0x30>
    80003a18:	01078793          	addi	a5,a5,16
    80003a1c:	02f93423          	sd	a5,40(s2)
    80003a20:	02890513          	addi	a0,s2,40
    80003a24:	ffffe097          	auipc	ra,0xffffe
    80003a28:	eb8080e7          	jalr	-328(ra) # 800018dc <_ZN15KernelSemaphoreD1Ev>
    80003a2c:	00890513          	addi	a0,s2,8
    80003a30:	00000097          	auipc	ra,0x0
    80003a34:	41c080e7          	jalr	1052(ra) # 80003e4c <_ZN10ThreadListD1Ev>
}
    80003a38:	01813083          	ld	ra,24(sp)
    80003a3c:	01013403          	ld	s0,16(sp)
    80003a40:	00813483          	ld	s1,8(sp)
    80003a44:	00013903          	ld	s2,0(sp)
    80003a48:	02010113          	addi	sp,sp,32
    80003a4c:	00008067          	ret

0000000080003a50 <_ZN15ThreadCollector11getInstanceEv>:

ThreadCollector *ThreadCollector::getInstance() {
    if (!instance) instance = new ThreadCollector;
    80003a50:	00007797          	auipc	a5,0x7
    80003a54:	c007b783          	ld	a5,-1024(a5) # 8000a650 <_ZN15ThreadCollector8instanceE>
    80003a58:	00078863          	beqz	a5,80003a68 <_ZN15ThreadCollector11getInstanceEv+0x18>
    return instance;
    80003a5c:	00007517          	auipc	a0,0x7
    80003a60:	bf453503          	ld	a0,-1036(a0) # 8000a650 <_ZN15ThreadCollector8instanceE>
}
    80003a64:	00008067          	ret
ThreadCollector *ThreadCollector::getInstance() {
    80003a68:	fe010113          	addi	sp,sp,-32
    80003a6c:	00113c23          	sd	ra,24(sp)
    80003a70:	00813823          	sd	s0,16(sp)
    80003a74:	00913423          	sd	s1,8(sp)
    80003a78:	01213023          	sd	s2,0(sp)
    80003a7c:	02010413          	addi	s0,sp,32
        return kmalloc(size);
    80003a80:	00300513          	li	a0,3
    80003a84:	ffffe097          	auipc	ra,0xffffe
    80003a88:	2e8080e7          	jalr	744(ra) # 80001d6c <_Z7kmallocm>
    80003a8c:	00050493          	mv	s1,a0
    if (!instance) instance = new ThreadCollector;
    80003a90:	00000097          	auipc	ra,0x0
    80003a94:	df8080e7          	jalr	-520(ra) # 80003888 <_ZN15ThreadCollectorC1Ev>
    80003a98:	00007797          	auipc	a5,0x7
    80003a9c:	ba97bc23          	sd	s1,-1096(a5) # 8000a650 <_ZN15ThreadCollector8instanceE>
    return instance;
    80003aa0:	00007517          	auipc	a0,0x7
    80003aa4:	bb053503          	ld	a0,-1104(a0) # 8000a650 <_ZN15ThreadCollector8instanceE>
}
    80003aa8:	01813083          	ld	ra,24(sp)
    80003aac:	01013403          	ld	s0,16(sp)
    80003ab0:	00813483          	ld	s1,8(sp)
    80003ab4:	00013903          	ld	s2,0(sp)
    80003ab8:	02010113          	addi	sp,sp,32
    80003abc:	00008067          	ret
    80003ac0:	00050913          	mv	s2,a0
        kfree(addr);
    80003ac4:	00048513          	mv	a0,s1
    80003ac8:	ffffe097          	auipc	ra,0xffffe
    80003acc:	4ac080e7          	jalr	1196(ra) # 80001f74 <_Z5kfreePv>
    80003ad0:	00090513          	mv	a0,s2
    80003ad4:	00008097          	auipc	ra,0x8
    80003ad8:	c64080e7          	jalr	-924(ra) # 8000b738 <_Unwind_Resume>

0000000080003adc <_ZN15ThreadCollector6signalEv>:
void ThreadCollector::signal() {
    80003adc:	ff010113          	addi	sp,sp,-16
    80003ae0:	00113423          	sd	ra,8(sp)
    80003ae4:	00813023          	sd	s0,0(sp)
    80003ae8:	01010413          	addi	s0,sp,16
    getInstance()->readyToDelete.signal();
    80003aec:	00000097          	auipc	ra,0x0
    80003af0:	f64080e7          	jalr	-156(ra) # 80003a50 <_ZN15ThreadCollector11getInstanceEv>
    80003af4:	06050513          	addi	a0,a0,96
    80003af8:	ffffe097          	auipc	ra,0xffffe
    80003afc:	d88080e7          	jalr	-632(ra) # 80001880 <_ZN15KernelSemaphore6signalEv>
}
    80003b00:	00813083          	ld	ra,8(sp)
    80003b04:	00013403          	ld	s0,0(sp)
    80003b08:	01010113          	addi	sp,sp,16
    80003b0c:	00008067          	ret

0000000080003b10 <_ZN15ThreadCollector3putEP3TCB>:
void ThreadCollector::put(TCB *tcb) {
    80003b10:	fe010113          	addi	sp,sp,-32
    80003b14:	00113c23          	sd	ra,24(sp)
    80003b18:	00813823          	sd	s0,16(sp)
    80003b1c:	00913423          	sd	s1,8(sp)
    80003b20:	02010413          	addi	s0,sp,32
    80003b24:	00050493          	mv	s1,a0
    getInstance()->mutex.wait();
    80003b28:	00000097          	auipc	ra,0x0
    80003b2c:	f28080e7          	jalr	-216(ra) # 80003a50 <_ZN15ThreadCollector11getInstanceEv>
    80003b30:	02850513          	addi	a0,a0,40
    80003b34:	ffffe097          	auipc	ra,0xffffe
    80003b38:	480080e7          	jalr	1152(ra) # 80001fb4 <_ZN5Mutex4waitEv>
    getInstance()->finishedThreads.addLast(tcb->getNode());
    80003b3c:	00000097          	auipc	ra,0x0
    80003b40:	f14080e7          	jalr	-236(ra) # 80003a50 <_ZN15ThreadCollector11getInstanceEv>
    80003b44:	0a848593          	addi	a1,s1,168
    80003b48:	00850513          	addi	a0,a0,8
    80003b4c:	00000097          	auipc	ra,0x0
    80003b50:	118080e7          	jalr	280(ra) # 80003c64 <_ZN10ThreadList7addLastEP10ThreadNode>
    getInstance()->mutex.signal();
    80003b54:	00000097          	auipc	ra,0x0
    80003b58:	efc080e7          	jalr	-260(ra) # 80003a50 <_ZN15ThreadCollector11getInstanceEv>
    80003b5c:	02850513          	addi	a0,a0,40
    80003b60:	ffffe097          	auipc	ra,0xffffe
    80003b64:	4d4080e7          	jalr	1236(ra) # 80002034 <_ZN5Mutex6signalEv>
}
    80003b68:	01813083          	ld	ra,24(sp)
    80003b6c:	01013403          	ld	s0,16(sp)
    80003b70:	00813483          	ld	s1,8(sp)
    80003b74:	02010113          	addi	sp,sp,32
    80003b78:	00008067          	ret

0000000080003b7c <_ZN15ThreadCollector3runEv>:
[[noreturn]] void ThreadCollector::run() {
    80003b7c:	fe010113          	addi	sp,sp,-32
    80003b80:	00113c23          	sd	ra,24(sp)
    80003b84:	00813823          	sd	s0,16(sp)
    80003b88:	00913423          	sd	s1,8(sp)
    80003b8c:	02010413          	addi	s0,sp,32
    80003b90:	0300006f          	j	80003bc0 <_ZN15ThreadCollector3runEv+0x44>
    80003b94:	00050493          	mv	s1,a0
        delete getInstance()->finishedThreads.removeFirst();
    80003b98:	00000097          	auipc	ra,0x0
    80003b9c:	c84080e7          	jalr	-892(ra) # 8000381c <_ZN3TCBD1Ev>
    80003ba0:	00048513          	mv	a0,s1
    80003ba4:	ffffe097          	auipc	ra,0xffffe
    80003ba8:	3d0080e7          	jalr	976(ra) # 80001f74 <_Z5kfreePv>
        getInstance()->mutex.signal();
    80003bac:	00000097          	auipc	ra,0x0
    80003bb0:	ea4080e7          	jalr	-348(ra) # 80003a50 <_ZN15ThreadCollector11getInstanceEv>
    80003bb4:	02850513          	addi	a0,a0,40
    80003bb8:	ffffe097          	auipc	ra,0xffffe
    80003bbc:	47c080e7          	jalr	1148(ra) # 80002034 <_ZN5Mutex6signalEv>
        getInstance()->readyToDelete.wait();
    80003bc0:	00000097          	auipc	ra,0x0
    80003bc4:	e90080e7          	jalr	-368(ra) # 80003a50 <_ZN15ThreadCollector11getInstanceEv>
    80003bc8:	06050513          	addi	a0,a0,96
    80003bcc:	ffffe097          	auipc	ra,0xffffe
    80003bd0:	c10080e7          	jalr	-1008(ra) # 800017dc <_ZN15KernelSemaphore4waitEv>
        getInstance()->mutex.wait();
    80003bd4:	00000097          	auipc	ra,0x0
    80003bd8:	e7c080e7          	jalr	-388(ra) # 80003a50 <_ZN15ThreadCollector11getInstanceEv>
    80003bdc:	02850513          	addi	a0,a0,40
    80003be0:	ffffe097          	auipc	ra,0xffffe
    80003be4:	3d4080e7          	jalr	980(ra) # 80001fb4 <_ZN5Mutex4waitEv>
        delete getInstance()->finishedThreads.removeFirst();
    80003be8:	00000097          	auipc	ra,0x0
    80003bec:	e68080e7          	jalr	-408(ra) # 80003a50 <_ZN15ThreadCollector11getInstanceEv>
    80003bf0:	00850513          	addi	a0,a0,8
    80003bf4:	00000097          	auipc	ra,0x0
    80003bf8:	0b4080e7          	jalr	180(ra) # 80003ca8 <_ZN10ThreadList11removeFirstEv>
    80003bfc:	f8051ce3          	bnez	a0,80003b94 <_ZN15ThreadCollector3runEv+0x18>
    80003c00:	fadff06f          	j	80003bac <_ZN15ThreadCollector3runEv+0x30>

0000000080003c04 <_ZZN15ThreadCollectorC4EvENUlPvE_4_FUNES0_>:
    threadCollector = TCB::createKernelThread([](void *){ThreadCollector::run();}, nullptr);
    80003c04:	ff010113          	addi	sp,sp,-16
    80003c08:	00113423          	sd	ra,8(sp)
    80003c0c:	00813023          	sd	s0,0(sp)
    80003c10:	01010413          	addi	s0,sp,16
    80003c14:	00000097          	auipc	ra,0x0
    80003c18:	f68080e7          	jalr	-152(ra) # 80003b7c <_ZN15ThreadCollector3runEv>

0000000080003c1c <_ZN10ThreadList8addFirstEP10ThreadNode>:
#include "../h/ThreadList.h"

void ThreadList::addFirst(ThreadNode *elem) {
    80003c1c:	ff010113          	addi	sp,sp,-16
    80003c20:	00813423          	sd	s0,8(sp)
    80003c24:	01010413          	addi	s0,sp,16
    elem->next = head;
    80003c28:	00053783          	ld	a5,0(a0)
    80003c2c:	00f5b423          	sd	a5,8(a1)
    elem->prev = nullptr;
    80003c30:	0005b823          	sd	zero,16(a1)
    if (head) head->prev = elem;
    80003c34:	00053783          	ld	a5,0(a0)
    80003c38:	02078263          	beqz	a5,80003c5c <_ZN10ThreadList8addFirstEP10ThreadNode+0x40>
    80003c3c:	00b7b823          	sd	a1,16(a5)
    else tail = elem;
    head = elem;
    80003c40:	00b53023          	sd	a1,0(a0)

    size++;
    80003c44:	01852783          	lw	a5,24(a0)
    80003c48:	0017879b          	addiw	a5,a5,1
    80003c4c:	00f52c23          	sw	a5,24(a0)
}
    80003c50:	00813403          	ld	s0,8(sp)
    80003c54:	01010113          	addi	sp,sp,16
    80003c58:	00008067          	ret
    else tail = elem;
    80003c5c:	00b53423          	sd	a1,8(a0)
    80003c60:	fe1ff06f          	j	80003c40 <_ZN10ThreadList8addFirstEP10ThreadNode+0x24>

0000000080003c64 <_ZN10ThreadList7addLastEP10ThreadNode>:

void ThreadList::addLast(ThreadNode *elem) {
    80003c64:	ff010113          	addi	sp,sp,-16
    80003c68:	00813423          	sd	s0,8(sp)
    80003c6c:	01010413          	addi	s0,sp,16
    elem->next = nullptr;
    80003c70:	0005b423          	sd	zero,8(a1)
    elem->prev = tail;
    80003c74:	00853783          	ld	a5,8(a0)
    80003c78:	00f5b823          	sd	a5,16(a1)
    if (tail) tail->next = elem;
    80003c7c:	02078263          	beqz	a5,80003ca0 <_ZN10ThreadList7addLastEP10ThreadNode+0x3c>
    80003c80:	00b7b423          	sd	a1,8(a5)
    else head = elem;
    tail = elem;
    80003c84:	00b53423          	sd	a1,8(a0)

    size++;
    80003c88:	01852783          	lw	a5,24(a0)
    80003c8c:	0017879b          	addiw	a5,a5,1
    80003c90:	00f52c23          	sw	a5,24(a0)
}
    80003c94:	00813403          	ld	s0,8(sp)
    80003c98:	01010113          	addi	sp,sp,16
    80003c9c:	00008067          	ret
    else head = elem;
    80003ca0:	00b53023          	sd	a1,0(a0)
    80003ca4:	fe1ff06f          	j	80003c84 <_ZN10ThreadList7addLastEP10ThreadNode+0x20>

0000000080003ca8 <_ZN10ThreadList11removeFirstEv>:

TCB *ThreadList::removeFirst() {
    80003ca8:	ff010113          	addi	sp,sp,-16
    80003cac:	00813423          	sd	s0,8(sp)
    80003cb0:	01010413          	addi	s0,sp,16
    if (!head) return nullptr;
    80003cb4:	00053703          	ld	a4,0(a0)
    80003cb8:	04070063          	beqz	a4,80003cf8 <_ZN10ThreadList11removeFirstEv+0x50>
    80003cbc:	00050793          	mv	a5,a0

    TCB *data = head->data;
    80003cc0:	00073503          	ld	a0,0(a4) # 8000 <_entry-0x7fff8000>

    head = head->next;
    80003cc4:	00873703          	ld	a4,8(a4)
    80003cc8:	00e7b023          	sd	a4,0(a5)
    if (head) head->prev = nullptr;
    80003ccc:	02070063          	beqz	a4,80003cec <_ZN10ThreadList11removeFirstEv+0x44>
    80003cd0:	00073823          	sd	zero,16(a4)
    else head = tail = nullptr;

    size--;
    80003cd4:	0187a703          	lw	a4,24(a5)
    80003cd8:	fff7071b          	addiw	a4,a4,-1
    80003cdc:	00e7ac23          	sw	a4,24(a5)

    return data;
}
    80003ce0:	00813403          	ld	s0,8(sp)
    80003ce4:	01010113          	addi	sp,sp,16
    80003ce8:	00008067          	ret
    else head = tail = nullptr;
    80003cec:	0007b423          	sd	zero,8(a5)
    80003cf0:	0007b023          	sd	zero,0(a5)
    80003cf4:	fe1ff06f          	j	80003cd4 <_ZN10ThreadList11removeFirstEv+0x2c>
    if (!head) return nullptr;
    80003cf8:	00070513          	mv	a0,a4
    80003cfc:	fe5ff06f          	j	80003ce0 <_ZN10ThreadList11removeFirstEv+0x38>

0000000080003d00 <_ZN10ThreadList10removeLastEv>:

TCB *ThreadList::removeLast() {
    80003d00:	ff010113          	addi	sp,sp,-16
    80003d04:	00813423          	sd	s0,8(sp)
    80003d08:	01010413          	addi	s0,sp,16
    if (!tail) return nullptr;
    80003d0c:	00853703          	ld	a4,8(a0)
    80003d10:	04070063          	beqz	a4,80003d50 <_ZN10ThreadList10removeLastEv+0x50>
    80003d14:	00050793          	mv	a5,a0

    TCB *data = tail->data;
    80003d18:	00073503          	ld	a0,0(a4)

    tail = tail->prev;
    80003d1c:	01073703          	ld	a4,16(a4)
    80003d20:	00e7b423          	sd	a4,8(a5)
    if (tail) tail->next = nullptr;
    80003d24:	02070063          	beqz	a4,80003d44 <_ZN10ThreadList10removeLastEv+0x44>
    80003d28:	00073423          	sd	zero,8(a4)
    else tail = head = nullptr;

    size--;
    80003d2c:	0187a703          	lw	a4,24(a5)
    80003d30:	fff7071b          	addiw	a4,a4,-1
    80003d34:	00e7ac23          	sw	a4,24(a5)

    return data;
}
    80003d38:	00813403          	ld	s0,8(sp)
    80003d3c:	01010113          	addi	sp,sp,16
    80003d40:	00008067          	ret
    else tail = head = nullptr;
    80003d44:	0007b023          	sd	zero,0(a5)
    80003d48:	0007b423          	sd	zero,8(a5)
    80003d4c:	fe1ff06f          	j	80003d2c <_ZN10ThreadList10removeLastEv+0x2c>
    if (!tail) return nullptr;
    80003d50:	00070513          	mv	a0,a4
    80003d54:	fe5ff06f          	j	80003d38 <_ZN10ThreadList10removeLastEv+0x38>

0000000080003d58 <_ZN10ThreadList9eraseCurrEv>:

void ThreadList::eraseCurr() {
    80003d58:	ff010113          	addi	sp,sp,-16
    80003d5c:	00813423          	sd	s0,8(sp)
    80003d60:	01010413          	addi	s0,sp,16
    if (!curr) return;
    80003d64:	01053783          	ld	a5,16(a0)
    80003d68:	02078463          	beqz	a5,80003d90 <_ZN10ThreadList9eraseCurrEv+0x38>

    ThreadNode *before = curr->prev, *after = curr->next;
    80003d6c:	0107b703          	ld	a4,16(a5)
    80003d70:	0087b783          	ld	a5,8(a5)

    if (before) before->next = after;
    80003d74:	02070463          	beqz	a4,80003d9c <_ZN10ThreadList9eraseCurrEv+0x44>
    80003d78:	00f73423          	sd	a5,8(a4)
    else head = after;

    if (after) after->prev = before;
    80003d7c:	02078463          	beqz	a5,80003da4 <_ZN10ThreadList9eraseCurrEv+0x4c>
    80003d80:	00e7b823          	sd	a4,16(a5)
    else tail = before;

    size--;
    80003d84:	01852783          	lw	a5,24(a0)
    80003d88:	fff7879b          	addiw	a5,a5,-1
    80003d8c:	00f52c23          	sw	a5,24(a0)
}
    80003d90:	00813403          	ld	s0,8(sp)
    80003d94:	01010113          	addi	sp,sp,16
    80003d98:	00008067          	ret
    else head = after;
    80003d9c:	00f53023          	sd	a5,0(a0)
    80003da0:	fddff06f          	j	80003d7c <_ZN10ThreadList9eraseCurrEv+0x24>
    else tail = before;
    80003da4:	00e53423          	sd	a4,8(a0)
    80003da8:	fddff06f          	j	80003d84 <_ZN10ThreadList9eraseCurrEv+0x2c>

0000000080003dac <_ZN10ThreadList15insertAfterCurrEP10ThreadNode>:

void ThreadList::insertAfterCurr(ThreadNode *elem) {
    80003dac:	ff010113          	addi	sp,sp,-16
    80003db0:	00813423          	sd	s0,8(sp)
    80003db4:	01010413          	addi	s0,sp,16
    if (!curr) return;
    80003db8:	01053783          	ld	a5,16(a0)
    80003dbc:	02078663          	beqz	a5,80003de8 <_ZN10ThreadList15insertAfterCurrEP10ThreadNode+0x3c>
    ThreadNode *after = curr->next;
    80003dc0:	0087b783          	ld	a5,8(a5)
    elem->next = after;
    80003dc4:	00f5b423          	sd	a5,8(a1)
    elem->prev = curr;
    80003dc8:	01053703          	ld	a4,16(a0)
    80003dcc:	00e5b823          	sd	a4,16(a1)
    curr->next = elem;
    80003dd0:	00b73423          	sd	a1,8(a4)
    if (!after) tail = elem;
    80003dd4:	02078063          	beqz	a5,80003df4 <_ZN10ThreadList15insertAfterCurrEP10ThreadNode+0x48>
    else after->prev = elem;
    80003dd8:	00b7b823          	sd	a1,16(a5)
    size++;
    80003ddc:	01852783          	lw	a5,24(a0)
    80003de0:	0017879b          	addiw	a5,a5,1
    80003de4:	00f52c23          	sw	a5,24(a0)
}
    80003de8:	00813403          	ld	s0,8(sp)
    80003dec:	01010113          	addi	sp,sp,16
    80003df0:	00008067          	ret
    if (!after) tail = elem;
    80003df4:	00b53423          	sd	a1,8(a0)
    80003df8:	fe5ff06f          	j	80003ddc <_ZN10ThreadList15insertAfterCurrEP10ThreadNode+0x30>

0000000080003dfc <_ZN10ThreadList16insertBeforeCurrEP10ThreadNode>:

void ThreadList::insertBeforeCurr(ThreadNode *elem) {
    80003dfc:	ff010113          	addi	sp,sp,-16
    80003e00:	00813423          	sd	s0,8(sp)
    80003e04:	01010413          	addi	s0,sp,16
    if (!curr) return;
    80003e08:	01053783          	ld	a5,16(a0)
    80003e0c:	02078663          	beqz	a5,80003e38 <_ZN10ThreadList16insertBeforeCurrEP10ThreadNode+0x3c>
    ThreadNode *before = curr->prev;
    80003e10:	0107b703          	ld	a4,16(a5)
    elem->next = curr;
    80003e14:	00f5b423          	sd	a5,8(a1)
    elem->prev = before;
    80003e18:	00e5b823          	sd	a4,16(a1)
    curr->prev = elem;
    80003e1c:	01053783          	ld	a5,16(a0)
    80003e20:	00b7b823          	sd	a1,16(a5)
    if (!before) head = elem;
    80003e24:	02070063          	beqz	a4,80003e44 <_ZN10ThreadList16insertBeforeCurrEP10ThreadNode+0x48>
    else before->next = elem;
    80003e28:	00b73423          	sd	a1,8(a4)
    size++;
    80003e2c:	01852783          	lw	a5,24(a0)
    80003e30:	0017879b          	addiw	a5,a5,1
    80003e34:	00f52c23          	sw	a5,24(a0)
}
    80003e38:	00813403          	ld	s0,8(sp)
    80003e3c:	01010113          	addi	sp,sp,16
    80003e40:	00008067          	ret
    if (!before) head = elem;
    80003e44:	00b53023          	sd	a1,0(a0)
    80003e48:	fe5ff06f          	j	80003e2c <_ZN10ThreadList16insertBeforeCurrEP10ThreadNode+0x30>

0000000080003e4c <_ZN10ThreadListD1Ev>:

ThreadList::~ThreadList() {
    80003e4c:	ff010113          	addi	sp,sp,-16
    80003e50:	00813423          	sd	s0,8(sp)
    80003e54:	01010413          	addi	s0,sp,16
    head = nullptr;
    tail = nullptr;
    curr = nullptr;
    size = 0;
}
    80003e58:	00813403          	ld	s0,8(sp)
    80003e5c:	01010113          	addi	sp,sp,16
    80003e60:	00008067          	ret

0000000080003e64 <_ZN14TimerInterrupt11getInstanceEv>:
#include "../h/Scheduler.h"

TimerInterrupt *TimerInterrupt::instance = nullptr;

TimerInterrupt *TimerInterrupt::getInstance() {
    if (!instance) instance = new TimerInterrupt;
    80003e64:	00006797          	auipc	a5,0x6
    80003e68:	7f47b783          	ld	a5,2036(a5) # 8000a658 <_ZN14TimerInterrupt8instanceE>
    80003e6c:	00078863          	beqz	a5,80003e7c <_ZN14TimerInterrupt11getInstanceEv+0x18>
    return instance;
}
    80003e70:	00006517          	auipc	a0,0x6
    80003e74:	7e853503          	ld	a0,2024(a0) # 8000a658 <_ZN14TimerInterrupt8instanceE>
    80003e78:	00008067          	ret
TimerInterrupt *TimerInterrupt::getInstance() {
    80003e7c:	ff010113          	addi	sp,sp,-16
    80003e80:	00113423          	sd	ra,8(sp)
    80003e84:	00813023          	sd	s0,0(sp)
    80003e88:	01010413          	addi	s0,sp,16
        return kmalloc(size);
    80003e8c:	00200513          	li	a0,2
    80003e90:	ffffe097          	auipc	ra,0xffffe
    80003e94:	edc080e7          	jalr	-292(ra) # 80001d6c <_Z7kmallocm>
    80003e98:	00100793          	li	a5,1
    80003e9c:	00f52823          	sw	a5,16(a0)
    explicit ThreadList() = default;
    80003ea0:	00053c23          	sd	zero,24(a0)
    80003ea4:	02053023          	sd	zero,32(a0)
    80003ea8:	02053423          	sd	zero,40(a0)
    80003eac:	02052823          	sw	zero,48(a0)
    80003eb0:	00006797          	auipc	a5,0x6
    80003eb4:	7107b783          	ld	a5,1808(a5) # 8000a5c0 <_GLOBAL_OFFSET_TABLE_+0x30>
    80003eb8:	01078793          	addi	a5,a5,16
    80003ebc:	00f53423          	sd	a5,8(a0)
    80003ec0:	02053c23          	sd	zero,56(a0)
    80003ec4:	04053023          	sd	zero,64(a0)
    80003ec8:	04053423          	sd	zero,72(a0)
    80003ecc:	04053823          	sd	zero,80(a0)
    80003ed0:	04052c23          	sw	zero,88(a0)
    if (!instance) instance = new TimerInterrupt;
    80003ed4:	00006797          	auipc	a5,0x6
    80003ed8:	78a7b223          	sd	a0,1924(a5) # 8000a658 <_ZN14TimerInterrupt8instanceE>
}
    80003edc:	00006517          	auipc	a0,0x6
    80003ee0:	77c53503          	ld	a0,1916(a0) # 8000a658 <_ZN14TimerInterrupt8instanceE>
    80003ee4:	00813083          	ld	ra,8(sp)
    80003ee8:	00013403          	ld	s0,0(sp)
    80003eec:	01010113          	addi	sp,sp,16
    80003ef0:	00008067          	ret

0000000080003ef4 <_ZN14TimerInterrupt5blockEP3TCBm>:

void TimerInterrupt::block(TCB *tcb, time_t time) {
    80003ef4:	fd010113          	addi	sp,sp,-48
    80003ef8:	02113423          	sd	ra,40(sp)
    80003efc:	02813023          	sd	s0,32(sp)
    80003f00:	00913c23          	sd	s1,24(sp)
    80003f04:	01213823          	sd	s2,16(sp)
    80003f08:	01313423          	sd	s3,8(sp)
    80003f0c:	01413023          	sd	s4,0(sp)
    80003f10:	03010413          	addi	s0,sp,48
    80003f14:	00050993          	mv	s3,a0
    80003f18:	00058913          	mv	s2,a1
    ThreadList *blockedThreads = &getInstance()->blockedThreadList;
    80003f1c:	00000097          	auipc	ra,0x0
    80003f20:	f48080e7          	jalr	-184(ra) # 80003e64 <_ZN14TimerInterrupt11getInstanceEv>
    80003f24:	00050493          	mv	s1,a0
    80003f28:	04050a13          	addi	s4,a0,64

    getInstance()->mutex.wait();
    80003f2c:	00000097          	auipc	ra,0x0
    80003f30:	f38080e7          	jalr	-200(ra) # 80003e64 <_ZN14TimerInterrupt11getInstanceEv>
    80003f34:	00850513          	addi	a0,a0,8
    80003f38:	ffffe097          	auipc	ra,0xffffe
    80003f3c:	07c080e7          	jalr	124(ra) # 80001fb4 <_ZN5Mutex4waitEv>
        curr = head;
    80003f40:	0404b783          	ld	a5,64(s1)
    80003f44:	04f4b823          	sd	a5,80(s1)
        return curr != nullptr;
    80003f48:	0504b783          	ld	a5,80(s1)

    for (blockedThreads->toHead(); blockedThreads->hasCurr(); blockedThreads->toNext()) {
    80003f4c:	02078863          	beqz	a5,80003f7c <_ZN14TimerInterrupt5blockEP3TCBm+0x88>
    }

    TCB *getCurr() {
        if (!curr) return nullptr;
        return curr->data;
    80003f50:	0007b703          	ld	a4,0(a5)
        return blockedTime;
    80003f54:	0c073703          	ld	a4,192(a4)
        time_t currTime = blockedThreads->getCurr()->getBlockedTime();
        if (time >= currTime) {
    80003f58:	00e96a63          	bltu	s2,a4,80003f6c <_ZN14TimerInterrupt5blockEP3TCBm+0x78>
            time -= currTime;
    80003f5c:	40e90933          	sub	s2,s2,a4
        if (curr) curr = curr->next;
    80003f60:	0087b783          	ld	a5,8(a5)
    80003f64:	04f4b823          	sd	a5,80(s1)
    }
    80003f68:	fe1ff06f          	j	80003f48 <_ZN14TimerInterrupt5blockEP3TCBm+0x54>
        } else {
            blockedThreads->insertBeforeCurr(tcb->getNode());
    80003f6c:	0a898593          	addi	a1,s3,168
    80003f70:	000a0513          	mv	a0,s4
    80003f74:	00000097          	auipc	ra,0x0
    80003f78:	e88080e7          	jalr	-376(ra) # 80003dfc <_ZN10ThreadList16insertBeforeCurrEP10ThreadNode>
        return curr != nullptr;
    80003f7c:	0504b783          	ld	a5,80(s1)
            break;
        }
    }

    // insert at end
    if (!blockedThreads->hasCurr()) blockedThreads->addLast(tcb->getNode());
    80003f80:	02078863          	beqz	a5,80003fb0 <_ZN14TimerInterrupt5blockEP3TCBm+0xbc>
    80003f84:	0504b783          	ld	a5,80(s1)

    // updating relative time for blocked threads after currently inserted
    while (blockedThreads->hasCurr()) {
    80003f88:	02078e63          	beqz	a5,80003fc4 <_ZN14TimerInterrupt5blockEP3TCBm+0xd0>
        return curr->data;
    80003f8c:	0007b703          	ld	a4,0(a5)
        this->blockedTime -= time;
    80003f90:	0c073783          	ld	a5,192(a4)
    80003f94:	412787b3          	sub	a5,a5,s2
    80003f98:	0cf73023          	sd	a5,192(a4)
        if (curr) curr = curr->next;
    80003f9c:	0504b783          	ld	a5,80(s1)
    80003fa0:	fe0782e3          	beqz	a5,80003f84 <_ZN14TimerInterrupt5blockEP3TCBm+0x90>
    80003fa4:	0087b783          	ld	a5,8(a5)
    80003fa8:	04f4b823          	sd	a5,80(s1)
    80003fac:	fd9ff06f          	j	80003f84 <_ZN14TimerInterrupt5blockEP3TCBm+0x90>
    if (!blockedThreads->hasCurr()) blockedThreads->addLast(tcb->getNode());
    80003fb0:	0a898593          	addi	a1,s3,168
    80003fb4:	000a0513          	mv	a0,s4
    80003fb8:	00000097          	auipc	ra,0x0
    80003fbc:	cac080e7          	jalr	-852(ra) # 80003c64 <_ZN10ThreadList7addLastEP10ThreadNode>
    80003fc0:	fc5ff06f          	j	80003f84 <_ZN14TimerInterrupt5blockEP3TCBm+0x90>
        blockedThreads->getCurr()->decBlockedTime(time);
        blockedThreads->toNext();
    }

    getInstance()->mutex.signal();
    80003fc4:	00000097          	auipc	ra,0x0
    80003fc8:	ea0080e7          	jalr	-352(ra) # 80003e64 <_ZN14TimerInterrupt11getInstanceEv>
    80003fcc:	00850513          	addi	a0,a0,8
    80003fd0:	ffffe097          	auipc	ra,0xffffe
    80003fd4:	064080e7          	jalr	100(ra) # 80002034 <_ZN5Mutex6signalEv>
        this->blockedTime = blockedTime;
    80003fd8:	0d29b023          	sd	s2,192(s3)
        status = BLOCKED;
    80003fdc:	00200793          	li	a5,2
    80003fe0:	04f9a423          	sw	a5,72(s3)

    tcb->setBlockedTime(time);
    tcb->setBlocked();
    TCB::dispatch();
    80003fe4:	fffff097          	auipc	ra,0xfffff
    80003fe8:	660080e7          	jalr	1632(ra) # 80003644 <_ZN3TCB8dispatchEv>
}
    80003fec:	02813083          	ld	ra,40(sp)
    80003ff0:	02013403          	ld	s0,32(sp)
    80003ff4:	01813483          	ld	s1,24(sp)
    80003ff8:	01013903          	ld	s2,16(sp)
    80003ffc:	00813983          	ld	s3,8(sp)
    80004000:	00013a03          	ld	s4,0(sp)
    80004004:	03010113          	addi	sp,sp,48
    80004008:	00008067          	ret

000000008000400c <_ZN14TimerInterrupt4tickEv>:

void TimerInterrupt::tick() {
    8000400c:	fd010113          	addi	sp,sp,-48
    80004010:	02113423          	sd	ra,40(sp)
    80004014:	02813023          	sd	s0,32(sp)
    80004018:	00913c23          	sd	s1,24(sp)
    8000401c:	01213823          	sd	s2,16(sp)
    80004020:	01313423          	sd	s3,8(sp)
    80004024:	03010413          	addi	s0,sp,48
    ThreadList *blockedThreads = &getInstance()->blockedThreadList;
    80004028:	00000097          	auipc	ra,0x0
    8000402c:	e3c080e7          	jalr	-452(ra) # 80003e64 <_ZN14TimerInterrupt11getInstanceEv>
    80004030:	00050913          	mv	s2,a0
    80004034:	04050993          	addi	s3,a0,64

    TCB *tcb;

    getInstance()->mutex.wait();
    80004038:	00000097          	auipc	ra,0x0
    8000403c:	e2c080e7          	jalr	-468(ra) # 80003e64 <_ZN14TimerInterrupt11getInstanceEv>
    80004040:	00850513          	addi	a0,a0,8
    80004044:	ffffe097          	auipc	ra,0xffffe
    80004048:	f70080e7          	jalr	-144(ra) # 80001fb4 <_ZN5Mutex4waitEv>
    8000404c:	01c0006f          	j	80004068 <_ZN14TimerInterrupt4tickEv+0x5c>
        status = READY;
    80004050:	0404a423          	sw	zero,72(s1)

    while ((tcb = blockedThreads->getFirst()) && !tcb->getBlockedTime()) {
        tcb->setReady();
        Scheduler::put(blockedThreads->removeFirst());
    80004054:	00098513          	mv	a0,s3
    80004058:	00000097          	auipc	ra,0x0
    8000405c:	c50080e7          	jalr	-944(ra) # 80003ca8 <_ZN10ThreadList11removeFirstEv>
    80004060:	ffffe097          	auipc	ra,0xffffe
    80004064:	424080e7          	jalr	1060(ra) # 80002484 <_ZN9Scheduler3putEP3TCB>
        if (!head) return nullptr;
    80004068:	04093483          	ld	s1,64(s2)
    8000406c:	00048a63          	beqz	s1,80004080 <_ZN14TimerInterrupt4tickEv+0x74>
        return head->data;
    80004070:	0004b483          	ld	s1,0(s1)
    while ((tcb = blockedThreads->getFirst()) && !tcb->getBlockedTime()) {
    80004074:	00048663          	beqz	s1,80004080 <_ZN14TimerInterrupt4tickEv+0x74>
        return blockedTime;
    80004078:	0c04b783          	ld	a5,192(s1)
    8000407c:	fc078ae3          	beqz	a5,80004050 <_ZN14TimerInterrupt4tickEv+0x44>
    }

    getInstance()->mutex.signal();
    80004080:	00000097          	auipc	ra,0x0
    80004084:	de4080e7          	jalr	-540(ra) # 80003e64 <_ZN14TimerInterrupt11getInstanceEv>
    80004088:	00850513          	addi	a0,a0,8
    8000408c:	ffffe097          	auipc	ra,0xffffe
    80004090:	fa8080e7          	jalr	-88(ra) # 80002034 <_ZN5Mutex6signalEv>

    if (!tcb) return;
    80004094:	00048863          	beqz	s1,800040a4 <_ZN14TimerInterrupt4tickEv+0x98>
        this->blockedTime -= time;
    80004098:	0c04b783          	ld	a5,192(s1)
    8000409c:	fff78793          	addi	a5,a5,-1
    800040a0:	0cf4b023          	sd	a5,192(s1)
    tcb->decBlockedTime();
}
    800040a4:	02813083          	ld	ra,40(sp)
    800040a8:	02013403          	ld	s0,32(sp)
    800040ac:	01813483          	ld	s1,24(sp)
    800040b0:	01013903          	ld	s2,16(sp)
    800040b4:	00813983          	ld	s3,8(sp)
    800040b8:	03010113          	addi	sp,sp,48
    800040bc:	00008067          	ret

00000000800040c0 <_ZN14TimerInterruptD1Ev>:

TimerInterrupt::~TimerInterrupt() {
    800040c0:	fe010113          	addi	sp,sp,-32
    800040c4:	00113c23          	sd	ra,24(sp)
    800040c8:	00813823          	sd	s0,16(sp)
    800040cc:	00913423          	sd	s1,8(sp)
    800040d0:	01213023          	sd	s2,0(sp)
    800040d4:	02010413          	addi	s0,sp,32
    800040d8:	00050913          	mv	s2,a0
        return size == 0;
    800040dc:	05892783          	lw	a5,88(s2)
    while (!blockedThreadList.isEmpty()) {
    800040e0:	02078863          	beqz	a5,80004110 <_ZN14TimerInterruptD1Ev+0x50>
        delete blockedThreadList.removeFirst();
    800040e4:	04090513          	addi	a0,s2,64
    800040e8:	00000097          	auipc	ra,0x0
    800040ec:	bc0080e7          	jalr	-1088(ra) # 80003ca8 <_ZN10ThreadList11removeFirstEv>
    800040f0:	00050493          	mv	s1,a0
    800040f4:	fe0504e3          	beqz	a0,800040dc <_ZN14TimerInterruptD1Ev+0x1c>
    800040f8:	fffff097          	auipc	ra,0xfffff
    800040fc:	724080e7          	jalr	1828(ra) # 8000381c <_ZN3TCBD1Ev>
        kfree(addr);
    80004100:	00048513          	mv	a0,s1
    80004104:	ffffe097          	auipc	ra,0xffffe
    80004108:	e70080e7          	jalr	-400(ra) # 80001f74 <_Z5kfreePv>
    }
    8000410c:	fd1ff06f          	j	800040dc <_ZN14TimerInterruptD1Ev+0x1c>
TimerInterrupt::~TimerInterrupt() {
    80004110:	04090513          	addi	a0,s2,64
    80004114:	00000097          	auipc	ra,0x0
    80004118:	d38080e7          	jalr	-712(ra) # 80003e4c <_ZN10ThreadListD1Ev>
    8000411c:	00006797          	auipc	a5,0x6
    80004120:	4a47b783          	ld	a5,1188(a5) # 8000a5c0 <_GLOBAL_OFFSET_TABLE_+0x30>
    80004124:	01078793          	addi	a5,a5,16
    80004128:	00f93423          	sd	a5,8(s2)
    8000412c:	00890513          	addi	a0,s2,8
    80004130:	ffffd097          	auipc	ra,0xffffd
    80004134:	7ac080e7          	jalr	1964(ra) # 800018dc <_ZN15KernelSemaphoreD1Ev>
    }
}
    80004138:	01813083          	ld	ra,24(sp)
    8000413c:	01013403          	ld	s0,16(sp)
    80004140:	00813483          	ld	s1,8(sp)
    80004144:	00013903          	ld	s2,0(sp)
    80004148:	02010113          	addi	sp,sp,32
    8000414c:	00008067          	ret

0000000080004150 <_ZN6BufferC1Ei>:
#include "buffer.hpp"
#include "../h/syscall_c.h"
//#include "../h/std.h"


Buffer::Buffer(int _cap) : cap(_cap), head(0), tail(0) {
    80004150:	fe010113          	addi	sp,sp,-32
    80004154:	00113c23          	sd	ra,24(sp)
    80004158:	00813823          	sd	s0,16(sp)
    8000415c:	00913423          	sd	s1,8(sp)
    80004160:	02010413          	addi	s0,sp,32
    80004164:	00050493          	mv	s1,a0
    80004168:	00b52023          	sw	a1,0(a0)
    8000416c:	00052823          	sw	zero,16(a0)
    80004170:	00052a23          	sw	zero,20(a0)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80004174:	00259513          	slli	a0,a1,0x2
    80004178:	ffffe097          	auipc	ra,0xffffe
    8000417c:	448080e7          	jalr	1096(ra) # 800025c0 <_Z9mem_allocm>
    80004180:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80004184:	00000593          	li	a1,0
    80004188:	02048513          	addi	a0,s1,32
    8000418c:	ffffe097          	auipc	ra,0xffffe
    80004190:	5bc080e7          	jalr	1468(ra) # 80002748 <_Z8sem_openPP4_semj>
    sem_open(&spaceAvailable, cap);
    80004194:	0004a583          	lw	a1,0(s1)
    80004198:	01848513          	addi	a0,s1,24
    8000419c:	ffffe097          	auipc	ra,0xffffe
    800041a0:	5ac080e7          	jalr	1452(ra) # 80002748 <_Z8sem_openPP4_semj>
    sem_open(&mutexHead, 1);
    800041a4:	00100593          	li	a1,1
    800041a8:	02848513          	addi	a0,s1,40
    800041ac:	ffffe097          	auipc	ra,0xffffe
    800041b0:	59c080e7          	jalr	1436(ra) # 80002748 <_Z8sem_openPP4_semj>
    sem_open(&mutexTail, 1);
    800041b4:	00100593          	li	a1,1
    800041b8:	03048513          	addi	a0,s1,48
    800041bc:	ffffe097          	auipc	ra,0xffffe
    800041c0:	58c080e7          	jalr	1420(ra) # 80002748 <_Z8sem_openPP4_semj>
}
    800041c4:	01813083          	ld	ra,24(sp)
    800041c8:	01013403          	ld	s0,16(sp)
    800041cc:	00813483          	ld	s1,8(sp)
    800041d0:	02010113          	addi	sp,sp,32
    800041d4:	00008067          	ret

00000000800041d8 <_ZN6BufferD1Ev>:

Buffer::~Buffer() {
    800041d8:	fe010113          	addi	sp,sp,-32
    800041dc:	00113c23          	sd	ra,24(sp)
    800041e0:	00813823          	sd	s0,16(sp)
    800041e4:	00913423          	sd	s1,8(sp)
    800041e8:	02010413          	addi	s0,sp,32
    800041ec:	00050493          	mv	s1,a0
    putc('\n');
    800041f0:	00a00513          	li	a0,10
    800041f4:	ffffe097          	auipc	ra,0xffffe
    800041f8:	6f8080e7          	jalr	1784(ra) # 800028ec <_Z4putcc>
//    printf("Buffer deleted!\n");
    while (head != tail) {
    800041fc:	0104a783          	lw	a5,16(s1)
    80004200:	0144a703          	lw	a4,20(s1)
    80004204:	00e78c63          	beq	a5,a4,8000421c <_ZN6BufferD1Ev+0x44>
//        printf("%c ", buffer[head]);
        head = (head + 1) % cap;
    80004208:	0017879b          	addiw	a5,a5,1
    8000420c:	0004a703          	lw	a4,0(s1)
    80004210:	02e7e7bb          	remw	a5,a5,a4
    80004214:	00f4a823          	sw	a5,16(s1)
    while (head != tail) {
    80004218:	fe5ff06f          	j	800041fc <_ZN6BufferD1Ev+0x24>
    }
    putc('!');
    8000421c:	02100513          	li	a0,33
    80004220:	ffffe097          	auipc	ra,0xffffe
    80004224:	6cc080e7          	jalr	1740(ra) # 800028ec <_Z4putcc>
    putc('\n');
    80004228:	00a00513          	li	a0,10
    8000422c:	ffffe097          	auipc	ra,0xffffe
    80004230:	6c0080e7          	jalr	1728(ra) # 800028ec <_Z4putcc>

    mem_free(buffer);
    80004234:	0084b503          	ld	a0,8(s1)
    80004238:	ffffe097          	auipc	ra,0xffffe
    8000423c:	3cc080e7          	jalr	972(ra) # 80002604 <_Z8mem_freePv>
    sem_close(itemAvailable);
    80004240:	0204b503          	ld	a0,32(s1)
    80004244:	ffffe097          	auipc	ra,0xffffe
    80004248:	57c080e7          	jalr	1404(ra) # 800027c0 <_Z9sem_closeP4_sem>
    sem_close(spaceAvailable);
    8000424c:	0184b503          	ld	a0,24(s1)
    80004250:	ffffe097          	auipc	ra,0xffffe
    80004254:	570080e7          	jalr	1392(ra) # 800027c0 <_Z9sem_closeP4_sem>
    sem_close(mutexTail);
    80004258:	0304b503          	ld	a0,48(s1)
    8000425c:	ffffe097          	auipc	ra,0xffffe
    80004260:	564080e7          	jalr	1380(ra) # 800027c0 <_Z9sem_closeP4_sem>
    sem_close(mutexHead);
    80004264:	0284b503          	ld	a0,40(s1)
    80004268:	ffffe097          	auipc	ra,0xffffe
    8000426c:	558080e7          	jalr	1368(ra) # 800027c0 <_Z9sem_closeP4_sem>
}
    80004270:	01813083          	ld	ra,24(sp)
    80004274:	01013403          	ld	s0,16(sp)
    80004278:	00813483          	ld	s1,8(sp)
    8000427c:	02010113          	addi	sp,sp,32
    80004280:	00008067          	ret

0000000080004284 <_ZN6Buffer3putEi>:

void Buffer::put(int val) {
    80004284:	fe010113          	addi	sp,sp,-32
    80004288:	00113c23          	sd	ra,24(sp)
    8000428c:	00813823          	sd	s0,16(sp)
    80004290:	00913423          	sd	s1,8(sp)
    80004294:	01213023          	sd	s2,0(sp)
    80004298:	02010413          	addi	s0,sp,32
    8000429c:	00050493          	mv	s1,a0
    800042a0:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    800042a4:	01853503          	ld	a0,24(a0)
    800042a8:	ffffe097          	auipc	ra,0xffffe
    800042ac:	574080e7          	jalr	1396(ra) # 8000281c <_Z8sem_waitP4_sem>

    sem_wait(mutexTail);
    800042b0:	0304b503          	ld	a0,48(s1)
    800042b4:	ffffe097          	auipc	ra,0xffffe
    800042b8:	568080e7          	jalr	1384(ra) # 8000281c <_Z8sem_waitP4_sem>
    buffer[tail] = val;
    800042bc:	0084b783          	ld	a5,8(s1)
    800042c0:	0144a703          	lw	a4,20(s1)
    800042c4:	00271713          	slli	a4,a4,0x2
    800042c8:	00e787b3          	add	a5,a5,a4
    800042cc:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    800042d0:	0144a783          	lw	a5,20(s1)
    800042d4:	0017879b          	addiw	a5,a5,1
    800042d8:	0004a703          	lw	a4,0(s1)
    800042dc:	02e7e7bb          	remw	a5,a5,a4
    800042e0:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    800042e4:	0304b503          	ld	a0,48(s1)
    800042e8:	ffffe097          	auipc	ra,0xffffe
    800042ec:	568080e7          	jalr	1384(ra) # 80002850 <_Z10sem_signalP4_sem>

    sem_signal(itemAvailable);
    800042f0:	0204b503          	ld	a0,32(s1)
    800042f4:	ffffe097          	auipc	ra,0xffffe
    800042f8:	55c080e7          	jalr	1372(ra) # 80002850 <_Z10sem_signalP4_sem>

}
    800042fc:	01813083          	ld	ra,24(sp)
    80004300:	01013403          	ld	s0,16(sp)
    80004304:	00813483          	ld	s1,8(sp)
    80004308:	00013903          	ld	s2,0(sp)
    8000430c:	02010113          	addi	sp,sp,32
    80004310:	00008067          	ret

0000000080004314 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80004314:	fe010113          	addi	sp,sp,-32
    80004318:	00113c23          	sd	ra,24(sp)
    8000431c:	00813823          	sd	s0,16(sp)
    80004320:	00913423          	sd	s1,8(sp)
    80004324:	01213023          	sd	s2,0(sp)
    80004328:	02010413          	addi	s0,sp,32
    8000432c:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80004330:	02053503          	ld	a0,32(a0)
    80004334:	ffffe097          	auipc	ra,0xffffe
    80004338:	4e8080e7          	jalr	1256(ra) # 8000281c <_Z8sem_waitP4_sem>

    sem_wait(mutexHead);
    8000433c:	0284b503          	ld	a0,40(s1)
    80004340:	ffffe097          	auipc	ra,0xffffe
    80004344:	4dc080e7          	jalr	1244(ra) # 8000281c <_Z8sem_waitP4_sem>

    int ret = buffer[head];
    80004348:	0084b703          	ld	a4,8(s1)
    8000434c:	0104a783          	lw	a5,16(s1)
    80004350:	00279693          	slli	a3,a5,0x2
    80004354:	00d70733          	add	a4,a4,a3
    80004358:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    8000435c:	0017879b          	addiw	a5,a5,1
    80004360:	0004a703          	lw	a4,0(s1)
    80004364:	02e7e7bb          	remw	a5,a5,a4
    80004368:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    8000436c:	0284b503          	ld	a0,40(s1)
    80004370:	ffffe097          	auipc	ra,0xffffe
    80004374:	4e0080e7          	jalr	1248(ra) # 80002850 <_Z10sem_signalP4_sem>

    sem_signal(spaceAvailable);
    80004378:	0184b503          	ld	a0,24(s1)
    8000437c:	ffffe097          	auipc	ra,0xffffe
    80004380:	4d4080e7          	jalr	1236(ra) # 80002850 <_Z10sem_signalP4_sem>

    return ret;
}
    80004384:	00090513          	mv	a0,s2
    80004388:	01813083          	ld	ra,24(sp)
    8000438c:	01013403          	ld	s0,16(sp)
    80004390:	00813483          	ld	s1,8(sp)
    80004394:	00013903          	ld	s2,0(sp)
    80004398:	02010113          	addi	sp,sp,32
    8000439c:	00008067          	ret

00000000800043a0 <_ZL8printIntiii>:
}

static char digits[] = "0123456789ABCDEF";

static void printInt(int xx, int base=10, int sgn=0)
{
    800043a0:	fc010113          	addi	sp,sp,-64
    800043a4:	02113c23          	sd	ra,56(sp)
    800043a8:	02813823          	sd	s0,48(sp)
    800043ac:	02913423          	sd	s1,40(sp)
    800043b0:	03213023          	sd	s2,32(sp)
    800043b4:	01313c23          	sd	s3,24(sp)
    800043b8:	04010413          	addi	s0,sp,64
    800043bc:	00050493          	mv	s1,a0
    800043c0:	00058913          	mv	s2,a1
    800043c4:	00060993          	mv	s3,a2
    LOCK();
    800043c8:	00100613          	li	a2,1
    800043cc:	00000593          	li	a1,0
    800043d0:	00006517          	auipc	a0,0x6
    800043d4:	29050513          	addi	a0,a0,656 # 8000a660 <lockPrint>
    800043d8:	ffffd097          	auipc	ra,0xffffd
    800043dc:	da8080e7          	jalr	-600(ra) # 80001180 <copy_and_swap>
    800043e0:	fe0514e3          	bnez	a0,800043c8 <_ZL8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    800043e4:	00098463          	beqz	s3,800043ec <_ZL8printIntiii+0x4c>
    800043e8:	0804c463          	bltz	s1,80004470 <_ZL8printIntiii+0xd0>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    800043ec:	0004851b          	sext.w	a0,s1
    neg = 0;
    800043f0:	00000593          	li	a1,0
    }

    i = 0;
    800043f4:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    800043f8:	0009079b          	sext.w	a5,s2
    800043fc:	0325773b          	remuw	a4,a0,s2
    80004400:	00048613          	mv	a2,s1
    80004404:	0014849b          	addiw	s1,s1,1
    80004408:	02071693          	slli	a3,a4,0x20
    8000440c:	0206d693          	srli	a3,a3,0x20
    80004410:	00004717          	auipc	a4,0x4
    80004414:	07070713          	addi	a4,a4,112 # 80008480 <_ZL6digits>
    80004418:	00d70733          	add	a4,a4,a3
    8000441c:	00074683          	lbu	a3,0(a4)
    80004420:	fd040713          	addi	a4,s0,-48
    80004424:	00c70733          	add	a4,a4,a2
    80004428:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    8000442c:	0005071b          	sext.w	a4,a0
    80004430:	0325553b          	divuw	a0,a0,s2
    80004434:	fcf772e3          	bgeu	a4,a5,800043f8 <_ZL8printIntiii+0x58>
    if(neg)
    80004438:	00058c63          	beqz	a1,80004450 <_ZL8printIntiii+0xb0>
        buf[i++] = '-';
    8000443c:	fd040793          	addi	a5,s0,-48
    80004440:	009784b3          	add	s1,a5,s1
    80004444:	02d00793          	li	a5,45
    80004448:	fef48823          	sb	a5,-16(s1)
    8000444c:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80004450:	fff4849b          	addiw	s1,s1,-1
    80004454:	0204c463          	bltz	s1,8000447c <_ZL8printIntiii+0xdc>
        putc(buf[i]);
    80004458:	fd040793          	addi	a5,s0,-48
    8000445c:	009787b3          	add	a5,a5,s1
    80004460:	ff07c503          	lbu	a0,-16(a5)
    80004464:	ffffe097          	auipc	ra,0xffffe
    80004468:	488080e7          	jalr	1160(ra) # 800028ec <_Z4putcc>
    8000446c:	fe5ff06f          	j	80004450 <_ZL8printIntiii+0xb0>
        x = -xx;
    80004470:	4090053b          	negw	a0,s1
        neg = 1;
    80004474:	00100593          	li	a1,1
        x = -xx;
    80004478:	f7dff06f          	j	800043f4 <_ZL8printIntiii+0x54>

    UNLOCK();
    8000447c:	00000613          	li	a2,0
    80004480:	00100593          	li	a1,1
    80004484:	00006517          	auipc	a0,0x6
    80004488:	1dc50513          	addi	a0,a0,476 # 8000a660 <lockPrint>
    8000448c:	ffffd097          	auipc	ra,0xffffd
    80004490:	cf4080e7          	jalr	-780(ra) # 80001180 <copy_and_swap>
    80004494:	fe0514e3          	bnez	a0,8000447c <_ZL8printIntiii+0xdc>
}
    80004498:	03813083          	ld	ra,56(sp)
    8000449c:	03013403          	ld	s0,48(sp)
    800044a0:	02813483          	ld	s1,40(sp)
    800044a4:	02013903          	ld	s2,32(sp)
    800044a8:	01813983          	ld	s3,24(sp)
    800044ac:	04010113          	addi	sp,sp,64
    800044b0:	00008067          	ret

00000000800044b4 <_Z11printStringPKc>:
{
    800044b4:	fe010113          	addi	sp,sp,-32
    800044b8:	00113c23          	sd	ra,24(sp)
    800044bc:	00813823          	sd	s0,16(sp)
    800044c0:	00913423          	sd	s1,8(sp)
    800044c4:	02010413          	addi	s0,sp,32
    800044c8:	00050493          	mv	s1,a0
    LOCK();
    800044cc:	00100613          	li	a2,1
    800044d0:	00000593          	li	a1,0
    800044d4:	00006517          	auipc	a0,0x6
    800044d8:	18c50513          	addi	a0,a0,396 # 8000a660 <lockPrint>
    800044dc:	ffffd097          	auipc	ra,0xffffd
    800044e0:	ca4080e7          	jalr	-860(ra) # 80001180 <copy_and_swap>
    800044e4:	fe0514e3          	bnez	a0,800044cc <_Z11printStringPKc+0x18>
    while (*string != '\0')
    800044e8:	0004c503          	lbu	a0,0(s1)
    800044ec:	00050a63          	beqz	a0,80004500 <_Z11printStringPKc+0x4c>
        putc(*string);
    800044f0:	ffffe097          	auipc	ra,0xffffe
    800044f4:	3fc080e7          	jalr	1020(ra) # 800028ec <_Z4putcc>
        string++;
    800044f8:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    800044fc:	fedff06f          	j	800044e8 <_Z11printStringPKc+0x34>
    UNLOCK();
    80004500:	00000613          	li	a2,0
    80004504:	00100593          	li	a1,1
    80004508:	00006517          	auipc	a0,0x6
    8000450c:	15850513          	addi	a0,a0,344 # 8000a660 <lockPrint>
    80004510:	ffffd097          	auipc	ra,0xffffd
    80004514:	c70080e7          	jalr	-912(ra) # 80001180 <copy_and_swap>
    80004518:	fe0514e3          	bnez	a0,80004500 <_Z11printStringPKc+0x4c>
}
    8000451c:	01813083          	ld	ra,24(sp)
    80004520:	01013403          	ld	s0,16(sp)
    80004524:	00813483          	ld	s1,8(sp)
    80004528:	02010113          	addi	sp,sp,32
    8000452c:	00008067          	ret

0000000080004530 <_Z9sleepyRunPv>:

#include "printing.hpp"

bool finished[2];

void sleepyRun(void *arg) {
    80004530:	fe010113          	addi	sp,sp,-32
    80004534:	00113c23          	sd	ra,24(sp)
    80004538:	00813823          	sd	s0,16(sp)
    8000453c:	00913423          	sd	s1,8(sp)
    80004540:	01213023          	sd	s2,0(sp)
    80004544:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    80004548:	00053903          	ld	s2,0(a0)
    int i = 6;
    8000454c:	00600493          	li	s1,6
    while (--i > 0) {
    80004550:	fff4849b          	addiw	s1,s1,-1
    80004554:	04905463          	blez	s1,8000459c <_Z9sleepyRunPv+0x6c>
        printString("Hello ");
    80004558:	00004517          	auipc	a0,0x4
    8000455c:	ca850513          	addi	a0,a0,-856 # 80008200 <_ZZ14kprintUnsignedmE6digits+0x10>
    80004560:	00000097          	auipc	ra,0x0
    80004564:	f54080e7          	jalr	-172(ra) # 800044b4 <_Z11printStringPKc>
        printInt(sleep_time);
    80004568:	00000613          	li	a2,0
    8000456c:	00a00593          	li	a1,10
    80004570:	0009051b          	sext.w	a0,s2
    80004574:	00000097          	auipc	ra,0x0
    80004578:	e2c080e7          	jalr	-468(ra) # 800043a0 <_ZL8printIntiii>
        printString(" !\n");
    8000457c:	00004517          	auipc	a0,0x4
    80004580:	c8c50513          	addi	a0,a0,-884 # 80008208 <_ZZ14kprintUnsignedmE6digits+0x18>
    80004584:	00000097          	auipc	ra,0x0
    80004588:	f30080e7          	jalr	-208(ra) # 800044b4 <_Z11printStringPKc>
        time_sleep(sleep_time);
    8000458c:	00090513          	mv	a0,s2
    80004590:	ffffe097          	auipc	ra,0xffffe
    80004594:	2f4080e7          	jalr	756(ra) # 80002884 <_Z10time_sleepm>
    while (--i > 0) {
    80004598:	fb9ff06f          	j	80004550 <_Z9sleepyRunPv+0x20>
    }
    finished[sleep_time/10-1] = true;
    8000459c:	00a00793          	li	a5,10
    800045a0:	02f95933          	divu	s2,s2,a5
    800045a4:	fff90913          	addi	s2,s2,-1
    800045a8:	00006797          	auipc	a5,0x6
    800045ac:	0b878793          	addi	a5,a5,184 # 8000a660 <lockPrint>
    800045b0:	01278933          	add	s2,a5,s2
    800045b4:	00100793          	li	a5,1
    800045b8:	00f90423          	sb	a5,8(s2)
}
    800045bc:	01813083          	ld	ra,24(sp)
    800045c0:	01013403          	ld	s0,16(sp)
    800045c4:	00813483          	ld	s1,8(sp)
    800045c8:	00013903          	ld	s2,0(sp)
    800045cc:	02010113          	addi	sp,sp,32
    800045d0:	00008067          	ret

00000000800045d4 <_Z11workerBodyEPv>:
//    printInteger(n);
//    printString(" fibonacci number\n");
    return fibonacci(n-1) + fibonacci(n-2);
}

void workerBodyE(void *) {
    800045d4:	fe010113          	addi	sp,sp,-32
    800045d8:	00113c23          	sd	ra,24(sp)
    800045dc:	00813823          	sd	s0,16(sp)
    800045e0:	00913423          	sd	s1,8(sp)
    800045e4:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    800045e8:	00000493          	li	s1,0
    800045ec:	0180006f          	j	80004604 <_Z11workerBodyEPv+0x30>
        printString("A: i=");
        printInt(i);
        printString("\n");
        if (i % 4 == 0) time_sleep(50);
    800045f0:	03200513          	li	a0,50
    800045f4:	ffffe097          	auipc	ra,0xffffe
    800045f8:	290080e7          	jalr	656(ra) # 80002884 <_Z10time_sleepm>
    800045fc:	04c0006f          	j	80004648 <_Z11workerBodyEPv+0x74>
    for (uint64 i = 0; i < 10; i++) {
    80004600:	00148493          	addi	s1,s1,1
    80004604:	00900793          	li	a5,9
    80004608:	0497ec63          	bltu	a5,s1,80004660 <_Z11workerBodyEPv+0x8c>
        printString("A: i=");
    8000460c:	00004517          	auipc	a0,0x4
    80004610:	c0450513          	addi	a0,a0,-1020 # 80008210 <_ZZ14kprintUnsignedmE6digits+0x20>
    80004614:	00000097          	auipc	ra,0x0
    80004618:	ea0080e7          	jalr	-352(ra) # 800044b4 <_Z11printStringPKc>
        printInt(i);
    8000461c:	00000613          	li	a2,0
    80004620:	00a00593          	li	a1,10
    80004624:	0004851b          	sext.w	a0,s1
    80004628:	00000097          	auipc	ra,0x0
    8000462c:	d78080e7          	jalr	-648(ra) # 800043a0 <_ZL8printIntiii>
        printString("\n");
    80004630:	00004517          	auipc	a0,0x4
    80004634:	b5850513          	addi	a0,a0,-1192 # 80008188 <CONSOLE_STATUS+0x178>
    80004638:	00000097          	auipc	ra,0x0
    8000463c:	e7c080e7          	jalr	-388(ra) # 800044b4 <_Z11printStringPKc>
        if (i % 4 == 0) time_sleep(50);
    80004640:	0034f793          	andi	a5,s1,3
    80004644:	fa0786e3          	beqz	a5,800045f0 <_Z11workerBodyEPv+0x1c>
        for (uint64 k = 0; k < 30000; k++) {
    80004648:	00000713          	li	a4,0
    8000464c:	000077b7          	lui	a5,0x7
    80004650:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80004654:	fae7e6e3          	bltu	a5,a4,80004600 <_Z11workerBodyEPv+0x2c>
    80004658:	00170713          	addi	a4,a4,1
    8000465c:	ff1ff06f          	j	8000464c <_Z11workerBodyEPv+0x78>
            //busy wait
        }
        // TCB::yield();
    }
    printString("Worker A finished\n");
    80004660:	00004517          	auipc	a0,0x4
    80004664:	bb850513          	addi	a0,a0,-1096 # 80008218 <_ZZ14kprintUnsignedmE6digits+0x28>
    80004668:	00000097          	auipc	ra,0x0
    8000466c:	e4c080e7          	jalr	-436(ra) # 800044b4 <_Z11printStringPKc>
}
    80004670:	01813083          	ld	ra,24(sp)
    80004674:	01013403          	ld	s0,16(sp)
    80004678:	00813483          	ld	s1,8(sp)
    8000467c:	02010113          	addi	sp,sp,32
    80004680:	00008067          	ret

0000000080004684 <_Z11workerBodyFPv>:

void workerBodyF(void *) {
    80004684:	fe010113          	addi	sp,sp,-32
    80004688:	00113c23          	sd	ra,24(sp)
    8000468c:	00813823          	sd	s0,16(sp)
    80004690:	00913423          	sd	s1,8(sp)
    80004694:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80004698:	00000493          	li	s1,0
    8000469c:	0380006f          	j	800046d4 <_Z11workerBodyFPv+0x50>
        printString("B: i=");
        printInt(i);
        printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
    800046a0:	00168693          	addi	a3,a3,1
    800046a4:	000027b7          	lui	a5,0x2
    800046a8:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800046ac:	00d7ee63          	bltu	a5,a3,800046c8 <_Z11workerBodyFPv+0x44>
            for (uint64 k = 0; k < 30000; k++) {
    800046b0:	00000713          	li	a4,0
    800046b4:	000077b7          	lui	a5,0x7
    800046b8:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800046bc:	fee7e2e3          	bltu	a5,a4,800046a0 <_Z11workerBodyFPv+0x1c>
    800046c0:	00170713          	addi	a4,a4,1
    800046c4:	ff1ff06f          	j	800046b4 <_Z11workerBodyFPv+0x30>
                // busy wait
            }
            // TCB::yield()
        }
        thread_dispatch();
    800046c8:	ffffe097          	auipc	ra,0xffffe
    800046cc:	050080e7          	jalr	80(ra) # 80002718 <_Z15thread_dispatchv>
    for (uint64 i = 0; i < 16; i++) {
    800046d0:	00148493          	addi	s1,s1,1
    800046d4:	00f00793          	li	a5,15
    800046d8:	0497e063          	bltu	a5,s1,80004718 <_Z11workerBodyFPv+0x94>
        printString("B: i=");
    800046dc:	00004517          	auipc	a0,0x4
    800046e0:	b5450513          	addi	a0,a0,-1196 # 80008230 <_ZZ14kprintUnsignedmE6digits+0x40>
    800046e4:	00000097          	auipc	ra,0x0
    800046e8:	dd0080e7          	jalr	-560(ra) # 800044b4 <_Z11printStringPKc>
        printInt(i);
    800046ec:	00000613          	li	a2,0
    800046f0:	00a00593          	li	a1,10
    800046f4:	0004851b          	sext.w	a0,s1
    800046f8:	00000097          	auipc	ra,0x0
    800046fc:	ca8080e7          	jalr	-856(ra) # 800043a0 <_ZL8printIntiii>
        printString("\n");
    80004700:	00004517          	auipc	a0,0x4
    80004704:	a8850513          	addi	a0,a0,-1400 # 80008188 <CONSOLE_STATUS+0x178>
    80004708:	00000097          	auipc	ra,0x0
    8000470c:	dac080e7          	jalr	-596(ra) # 800044b4 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80004710:	00000693          	li	a3,0
    80004714:	f91ff06f          	j	800046a4 <_Z11workerBodyFPv+0x20>
    }
    printString("Worker B finished\n");
    80004718:	00004517          	auipc	a0,0x4
    8000471c:	b2050513          	addi	a0,a0,-1248 # 80008238 <_ZZ14kprintUnsignedmE6digits+0x48>
    80004720:	00000097          	auipc	ra,0x0
    80004724:	d94080e7          	jalr	-620(ra) # 800044b4 <_Z11printStringPKc>
}
    80004728:	01813083          	ld	ra,24(sp)
    8000472c:	01013403          	ld	s0,16(sp)
    80004730:	00813483          	ld	s1,8(sp)
    80004734:	02010113          	addi	sp,sp,32
    80004738:	00008067          	ret

000000008000473c <_Z9getStringPci>:
char* getString(char *buf, int max) {
    8000473c:	fd010113          	addi	sp,sp,-48
    80004740:	02113423          	sd	ra,40(sp)
    80004744:	02813023          	sd	s0,32(sp)
    80004748:	00913c23          	sd	s1,24(sp)
    8000474c:	01213823          	sd	s2,16(sp)
    80004750:	01313423          	sd	s3,8(sp)
    80004754:	01413023          	sd	s4,0(sp)
    80004758:	03010413          	addi	s0,sp,48
    8000475c:	00050993          	mv	s3,a0
    80004760:	00058a13          	mv	s4,a1
    LOCK();
    80004764:	00100613          	li	a2,1
    80004768:	00000593          	li	a1,0
    8000476c:	00006517          	auipc	a0,0x6
    80004770:	ef450513          	addi	a0,a0,-268 # 8000a660 <lockPrint>
    80004774:	ffffd097          	auipc	ra,0xffffd
    80004778:	a0c080e7          	jalr	-1524(ra) # 80001180 <copy_and_swap>
    8000477c:	fe0514e3          	bnez	a0,80004764 <_Z9getStringPci+0x28>
    for(i=0; i+1 < max; ){
    80004780:	00000913          	li	s2,0
    80004784:	00090493          	mv	s1,s2
    80004788:	0019091b          	addiw	s2,s2,1
    8000478c:	03495a63          	bge	s2,s4,800047c0 <_Z9getStringPci+0x84>
        cc = getc();
    80004790:	ffffe097          	auipc	ra,0xffffe
    80004794:	128080e7          	jalr	296(ra) # 800028b8 <_Z4getcv>
        if(cc < 1)
    80004798:	02050463          	beqz	a0,800047c0 <_Z9getStringPci+0x84>
        buf[i++] = c;
    8000479c:	009984b3          	add	s1,s3,s1
    800047a0:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    800047a4:	00a00793          	li	a5,10
    800047a8:	00f50a63          	beq	a0,a5,800047bc <_Z9getStringPci+0x80>
    800047ac:	00d00793          	li	a5,13
    800047b0:	fcf51ae3          	bne	a0,a5,80004784 <_Z9getStringPci+0x48>
        buf[i++] = c;
    800047b4:	00090493          	mv	s1,s2
    800047b8:	0080006f          	j	800047c0 <_Z9getStringPci+0x84>
    800047bc:	00090493          	mv	s1,s2
    buf[i] = '\0';
    800047c0:	009984b3          	add	s1,s3,s1
    800047c4:	00048023          	sb	zero,0(s1)
    UNLOCK();
    800047c8:	00000613          	li	a2,0
    800047cc:	00100593          	li	a1,1
    800047d0:	00006517          	auipc	a0,0x6
    800047d4:	e9050513          	addi	a0,a0,-368 # 8000a660 <lockPrint>
    800047d8:	ffffd097          	auipc	ra,0xffffd
    800047dc:	9a8080e7          	jalr	-1624(ra) # 80001180 <copy_and_swap>
    800047e0:	fe0514e3          	bnez	a0,800047c8 <_Z9getStringPci+0x8c>
}
    800047e4:	00098513          	mv	a0,s3
    800047e8:	02813083          	ld	ra,40(sp)
    800047ec:	02013403          	ld	s0,32(sp)
    800047f0:	01813483          	ld	s1,24(sp)
    800047f4:	01013903          	ld	s2,16(sp)
    800047f8:	00813983          	ld	s3,8(sp)
    800047fc:	00013a03          	ld	s4,0(sp)
    80004800:	03010113          	addi	sp,sp,48
    80004804:	00008067          	ret

0000000080004808 <_Z11stringToIntPKc>:
int stringToInt(const char *s) {
    80004808:	ff010113          	addi	sp,sp,-16
    8000480c:	00813423          	sd	s0,8(sp)
    80004810:	01010413          	addi	s0,sp,16
    80004814:	00050693          	mv	a3,a0
    n = 0;
    80004818:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    8000481c:	0006c603          	lbu	a2,0(a3)
    80004820:	fd06071b          	addiw	a4,a2,-48
    80004824:	0ff77713          	andi	a4,a4,255
    80004828:	00900793          	li	a5,9
    8000482c:	02e7e063          	bltu	a5,a4,8000484c <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80004830:	0025179b          	slliw	a5,a0,0x2
    80004834:	00a787bb          	addw	a5,a5,a0
    80004838:	0017979b          	slliw	a5,a5,0x1
    8000483c:	00168693          	addi	a3,a3,1
    80004840:	00c787bb          	addw	a5,a5,a2
    80004844:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80004848:	fd5ff06f          	j	8000481c <_Z11stringToIntPKc+0x14>
}
    8000484c:	00813403          	ld	s0,8(sp)
    80004850:	01010113          	addi	sp,sp,16
    80004854:	00008067          	ret

0000000080004858 <_Z9fibonaccim>:
bool finishedA = false;
bool finishedB = false;
bool finishedC = false;
bool finishedD = false;

uint64 fibonacci(uint64 n) {
    80004858:	fe010113          	addi	sp,sp,-32
    8000485c:	00113c23          	sd	ra,24(sp)
    80004860:	00813823          	sd	s0,16(sp)
    80004864:	00913423          	sd	s1,8(sp)
    80004868:	01213023          	sd	s2,0(sp)
    8000486c:	02010413          	addi	s0,sp,32
    80004870:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80004874:	00100793          	li	a5,1
    80004878:	02a7f863          	bgeu	a5,a0,800048a8 <_Z9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    8000487c:	00a00793          	li	a5,10
    80004880:	02f577b3          	remu	a5,a0,a5
    80004884:	02078e63          	beqz	a5,800048c0 <_Z9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80004888:	fff48513          	addi	a0,s1,-1
    8000488c:	00000097          	auipc	ra,0x0
    80004890:	fcc080e7          	jalr	-52(ra) # 80004858 <_Z9fibonaccim>
    80004894:	00050913          	mv	s2,a0
    80004898:	ffe48513          	addi	a0,s1,-2
    8000489c:	00000097          	auipc	ra,0x0
    800048a0:	fbc080e7          	jalr	-68(ra) # 80004858 <_Z9fibonaccim>
    800048a4:	00a90533          	add	a0,s2,a0
}
    800048a8:	01813083          	ld	ra,24(sp)
    800048ac:	01013403          	ld	s0,16(sp)
    800048b0:	00813483          	ld	s1,8(sp)
    800048b4:	00013903          	ld	s2,0(sp)
    800048b8:	02010113          	addi	sp,sp,32
    800048bc:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    800048c0:	ffffe097          	auipc	ra,0xffffe
    800048c4:	e58080e7          	jalr	-424(ra) # 80002718 <_Z15thread_dispatchv>
    800048c8:	fc1ff06f          	j	80004888 <_Z9fibonaccim+0x30>

00000000800048cc <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    800048cc:	fe010113          	addi	sp,sp,-32
    800048d0:	00113c23          	sd	ra,24(sp)
    800048d4:	00813823          	sd	s0,16(sp)
    800048d8:	00913423          	sd	s1,8(sp)
    800048dc:	01213023          	sd	s2,0(sp)
    800048e0:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    800048e4:	00000913          	li	s2,0
    800048e8:	0380006f          	j	80004920 <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    800048ec:	ffffe097          	auipc	ra,0xffffe
    800048f0:	e2c080e7          	jalr	-468(ra) # 80002718 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800048f4:	00148493          	addi	s1,s1,1
    800048f8:	000027b7          	lui	a5,0x2
    800048fc:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80004900:	0097ee63          	bltu	a5,s1,8000491c <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80004904:	00000713          	li	a4,0
    80004908:	000077b7          	lui	a5,0x7
    8000490c:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80004910:	fce7eee3          	bltu	a5,a4,800048ec <_ZN7WorkerA11workerBodyAEPv+0x20>
    80004914:	00170713          	addi	a4,a4,1
    80004918:	ff1ff06f          	j	80004908 <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    8000491c:	00190913          	addi	s2,s2,1
    80004920:	00900793          	li	a5,9
    80004924:	0527e063          	bltu	a5,s2,80004964 <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80004928:	00004517          	auipc	a0,0x4
    8000492c:	8e850513          	addi	a0,a0,-1816 # 80008210 <_ZZ14kprintUnsignedmE6digits+0x20>
    80004930:	00000097          	auipc	ra,0x0
    80004934:	b84080e7          	jalr	-1148(ra) # 800044b4 <_Z11printStringPKc>
    80004938:	00000613          	li	a2,0
    8000493c:	00a00593          	li	a1,10
    80004940:	0009051b          	sext.w	a0,s2
    80004944:	00000097          	auipc	ra,0x0
    80004948:	a5c080e7          	jalr	-1444(ra) # 800043a0 <_ZL8printIntiii>
    8000494c:	00004517          	auipc	a0,0x4
    80004950:	83c50513          	addi	a0,a0,-1988 # 80008188 <CONSOLE_STATUS+0x178>
    80004954:	00000097          	auipc	ra,0x0
    80004958:	b60080e7          	jalr	-1184(ra) # 800044b4 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    8000495c:	00000493          	li	s1,0
    80004960:	f99ff06f          	j	800048f8 <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80004964:	00004517          	auipc	a0,0x4
    80004968:	8ec50513          	addi	a0,a0,-1812 # 80008250 <_ZZ14kprintUnsignedmE6digits+0x60>
    8000496c:	00000097          	auipc	ra,0x0
    80004970:	b48080e7          	jalr	-1208(ra) # 800044b4 <_Z11printStringPKc>
    finishedA = true;
    80004974:	00100793          	li	a5,1
    80004978:	00006717          	auipc	a4,0x6
    8000497c:	cef70923          	sb	a5,-782(a4) # 8000a66a <finishedA>
}
    80004980:	01813083          	ld	ra,24(sp)
    80004984:	01013403          	ld	s0,16(sp)
    80004988:	00813483          	ld	s1,8(sp)
    8000498c:	00013903          	ld	s2,0(sp)
    80004990:	02010113          	addi	sp,sp,32
    80004994:	00008067          	ret

0000000080004998 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80004998:	fe010113          	addi	sp,sp,-32
    8000499c:	00113c23          	sd	ra,24(sp)
    800049a0:	00813823          	sd	s0,16(sp)
    800049a4:	00913423          	sd	s1,8(sp)
    800049a8:	01213023          	sd	s2,0(sp)
    800049ac:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    800049b0:	00000913          	li	s2,0
    800049b4:	0380006f          	j	800049ec <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    800049b8:	ffffe097          	auipc	ra,0xffffe
    800049bc:	d60080e7          	jalr	-672(ra) # 80002718 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800049c0:	00148493          	addi	s1,s1,1
    800049c4:	000027b7          	lui	a5,0x2
    800049c8:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800049cc:	0097ee63          	bltu	a5,s1,800049e8 <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800049d0:	00000713          	li	a4,0
    800049d4:	000077b7          	lui	a5,0x7
    800049d8:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800049dc:	fce7eee3          	bltu	a5,a4,800049b8 <_ZN7WorkerB11workerBodyBEPv+0x20>
    800049e0:	00170713          	addi	a4,a4,1
    800049e4:	ff1ff06f          	j	800049d4 <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    800049e8:	00190913          	addi	s2,s2,1
    800049ec:	00f00793          	li	a5,15
    800049f0:	0527e063          	bltu	a5,s2,80004a30 <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    800049f4:	00004517          	auipc	a0,0x4
    800049f8:	83c50513          	addi	a0,a0,-1988 # 80008230 <_ZZ14kprintUnsignedmE6digits+0x40>
    800049fc:	00000097          	auipc	ra,0x0
    80004a00:	ab8080e7          	jalr	-1352(ra) # 800044b4 <_Z11printStringPKc>
    80004a04:	00000613          	li	a2,0
    80004a08:	00a00593          	li	a1,10
    80004a0c:	0009051b          	sext.w	a0,s2
    80004a10:	00000097          	auipc	ra,0x0
    80004a14:	990080e7          	jalr	-1648(ra) # 800043a0 <_ZL8printIntiii>
    80004a18:	00003517          	auipc	a0,0x3
    80004a1c:	77050513          	addi	a0,a0,1904 # 80008188 <CONSOLE_STATUS+0x178>
    80004a20:	00000097          	auipc	ra,0x0
    80004a24:	a94080e7          	jalr	-1388(ra) # 800044b4 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80004a28:	00000493          	li	s1,0
    80004a2c:	f99ff06f          	j	800049c4 <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    80004a30:	00004517          	auipc	a0,0x4
    80004a34:	83050513          	addi	a0,a0,-2000 # 80008260 <_ZZ14kprintUnsignedmE6digits+0x70>
    80004a38:	00000097          	auipc	ra,0x0
    80004a3c:	a7c080e7          	jalr	-1412(ra) # 800044b4 <_Z11printStringPKc>
    finishedB = true;
    80004a40:	00100793          	li	a5,1
    80004a44:	00006717          	auipc	a4,0x6
    80004a48:	c2f703a3          	sb	a5,-985(a4) # 8000a66b <finishedB>
    thread_dispatch();
    80004a4c:	ffffe097          	auipc	ra,0xffffe
    80004a50:	ccc080e7          	jalr	-820(ra) # 80002718 <_Z15thread_dispatchv>
}
    80004a54:	01813083          	ld	ra,24(sp)
    80004a58:	01013403          	ld	s0,16(sp)
    80004a5c:	00813483          	ld	s1,8(sp)
    80004a60:	00013903          	ld	s2,0(sp)
    80004a64:	02010113          	addi	sp,sp,32
    80004a68:	00008067          	ret

0000000080004a6c <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80004a6c:	fe010113          	addi	sp,sp,-32
    80004a70:	00113c23          	sd	ra,24(sp)
    80004a74:	00813823          	sd	s0,16(sp)
    80004a78:	00913423          	sd	s1,8(sp)
    80004a7c:	01213023          	sd	s2,0(sp)
    80004a80:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80004a84:	00000493          	li	s1,0
    80004a88:	0400006f          	j	80004ac8 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80004a8c:	00003517          	auipc	a0,0x3
    80004a90:	7e450513          	addi	a0,a0,2020 # 80008270 <_ZZ14kprintUnsignedmE6digits+0x80>
    80004a94:	00000097          	auipc	ra,0x0
    80004a98:	a20080e7          	jalr	-1504(ra) # 800044b4 <_Z11printStringPKc>
    80004a9c:	00000613          	li	a2,0
    80004aa0:	00a00593          	li	a1,10
    80004aa4:	00048513          	mv	a0,s1
    80004aa8:	00000097          	auipc	ra,0x0
    80004aac:	8f8080e7          	jalr	-1800(ra) # 800043a0 <_ZL8printIntiii>
    80004ab0:	00003517          	auipc	a0,0x3
    80004ab4:	6d850513          	addi	a0,a0,1752 # 80008188 <CONSOLE_STATUS+0x178>
    80004ab8:	00000097          	auipc	ra,0x0
    80004abc:	9fc080e7          	jalr	-1540(ra) # 800044b4 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80004ac0:	0014849b          	addiw	s1,s1,1
    80004ac4:	0ff4f493          	andi	s1,s1,255
    80004ac8:	00200793          	li	a5,2
    80004acc:	fc97f0e3          	bgeu	a5,s1,80004a8c <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    80004ad0:	00003517          	auipc	a0,0x3
    80004ad4:	7a850513          	addi	a0,a0,1960 # 80008278 <_ZZ14kprintUnsignedmE6digits+0x88>
    80004ad8:	00000097          	auipc	ra,0x0
    80004adc:	9dc080e7          	jalr	-1572(ra) # 800044b4 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80004ae0:	00700313          	li	t1,7
    thread_dispatch();
    80004ae4:	ffffe097          	auipc	ra,0xffffe
    80004ae8:	c34080e7          	jalr	-972(ra) # 80002718 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80004aec:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    80004af0:	00003517          	auipc	a0,0x3
    80004af4:	79850513          	addi	a0,a0,1944 # 80008288 <_ZZ14kprintUnsignedmE6digits+0x98>
    80004af8:	00000097          	auipc	ra,0x0
    80004afc:	9bc080e7          	jalr	-1604(ra) # 800044b4 <_Z11printStringPKc>
    80004b00:	00000613          	li	a2,0
    80004b04:	00a00593          	li	a1,10
    80004b08:	0009051b          	sext.w	a0,s2
    80004b0c:	00000097          	auipc	ra,0x0
    80004b10:	894080e7          	jalr	-1900(ra) # 800043a0 <_ZL8printIntiii>
    80004b14:	00003517          	auipc	a0,0x3
    80004b18:	67450513          	addi	a0,a0,1652 # 80008188 <CONSOLE_STATUS+0x178>
    80004b1c:	00000097          	auipc	ra,0x0
    80004b20:	998080e7          	jalr	-1640(ra) # 800044b4 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80004b24:	00c00513          	li	a0,12
    80004b28:	00000097          	auipc	ra,0x0
    80004b2c:	d30080e7          	jalr	-720(ra) # 80004858 <_Z9fibonaccim>
    80004b30:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80004b34:	00003517          	auipc	a0,0x3
    80004b38:	75c50513          	addi	a0,a0,1884 # 80008290 <_ZZ14kprintUnsignedmE6digits+0xa0>
    80004b3c:	00000097          	auipc	ra,0x0
    80004b40:	978080e7          	jalr	-1672(ra) # 800044b4 <_Z11printStringPKc>
    80004b44:	00000613          	li	a2,0
    80004b48:	00a00593          	li	a1,10
    80004b4c:	0009051b          	sext.w	a0,s2
    80004b50:	00000097          	auipc	ra,0x0
    80004b54:	850080e7          	jalr	-1968(ra) # 800043a0 <_ZL8printIntiii>
    80004b58:	00003517          	auipc	a0,0x3
    80004b5c:	63050513          	addi	a0,a0,1584 # 80008188 <CONSOLE_STATUS+0x178>
    80004b60:	00000097          	auipc	ra,0x0
    80004b64:	954080e7          	jalr	-1708(ra) # 800044b4 <_Z11printStringPKc>
    80004b68:	0400006f          	j	80004ba8 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80004b6c:	00003517          	auipc	a0,0x3
    80004b70:	70450513          	addi	a0,a0,1796 # 80008270 <_ZZ14kprintUnsignedmE6digits+0x80>
    80004b74:	00000097          	auipc	ra,0x0
    80004b78:	940080e7          	jalr	-1728(ra) # 800044b4 <_Z11printStringPKc>
    80004b7c:	00000613          	li	a2,0
    80004b80:	00a00593          	li	a1,10
    80004b84:	00048513          	mv	a0,s1
    80004b88:	00000097          	auipc	ra,0x0
    80004b8c:	818080e7          	jalr	-2024(ra) # 800043a0 <_ZL8printIntiii>
    80004b90:	00003517          	auipc	a0,0x3
    80004b94:	5f850513          	addi	a0,a0,1528 # 80008188 <CONSOLE_STATUS+0x178>
    80004b98:	00000097          	auipc	ra,0x0
    80004b9c:	91c080e7          	jalr	-1764(ra) # 800044b4 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80004ba0:	0014849b          	addiw	s1,s1,1
    80004ba4:	0ff4f493          	andi	s1,s1,255
    80004ba8:	00500793          	li	a5,5
    80004bac:	fc97f0e3          	bgeu	a5,s1,80004b6c <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("A finished!\n");
    80004bb0:	00003517          	auipc	a0,0x3
    80004bb4:	6a050513          	addi	a0,a0,1696 # 80008250 <_ZZ14kprintUnsignedmE6digits+0x60>
    80004bb8:	00000097          	auipc	ra,0x0
    80004bbc:	8fc080e7          	jalr	-1796(ra) # 800044b4 <_Z11printStringPKc>
    finishedC = true;
    80004bc0:	00100793          	li	a5,1
    80004bc4:	00006717          	auipc	a4,0x6
    80004bc8:	aaf70423          	sb	a5,-1368(a4) # 8000a66c <finishedC>
    thread_dispatch();
    80004bcc:	ffffe097          	auipc	ra,0xffffe
    80004bd0:	b4c080e7          	jalr	-1204(ra) # 80002718 <_Z15thread_dispatchv>
}
    80004bd4:	01813083          	ld	ra,24(sp)
    80004bd8:	01013403          	ld	s0,16(sp)
    80004bdc:	00813483          	ld	s1,8(sp)
    80004be0:	00013903          	ld	s2,0(sp)
    80004be4:	02010113          	addi	sp,sp,32
    80004be8:	00008067          	ret

0000000080004bec <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    80004bec:	fe010113          	addi	sp,sp,-32
    80004bf0:	00113c23          	sd	ra,24(sp)
    80004bf4:	00813823          	sd	s0,16(sp)
    80004bf8:	00913423          	sd	s1,8(sp)
    80004bfc:	01213023          	sd	s2,0(sp)
    80004c00:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80004c04:	00a00493          	li	s1,10
    80004c08:	0400006f          	j	80004c48 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004c0c:	00003517          	auipc	a0,0x3
    80004c10:	69450513          	addi	a0,a0,1684 # 800082a0 <_ZZ14kprintUnsignedmE6digits+0xb0>
    80004c14:	00000097          	auipc	ra,0x0
    80004c18:	8a0080e7          	jalr	-1888(ra) # 800044b4 <_Z11printStringPKc>
    80004c1c:	00000613          	li	a2,0
    80004c20:	00a00593          	li	a1,10
    80004c24:	00048513          	mv	a0,s1
    80004c28:	fffff097          	auipc	ra,0xfffff
    80004c2c:	778080e7          	jalr	1912(ra) # 800043a0 <_ZL8printIntiii>
    80004c30:	00003517          	auipc	a0,0x3
    80004c34:	55850513          	addi	a0,a0,1368 # 80008188 <CONSOLE_STATUS+0x178>
    80004c38:	00000097          	auipc	ra,0x0
    80004c3c:	87c080e7          	jalr	-1924(ra) # 800044b4 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80004c40:	0014849b          	addiw	s1,s1,1
    80004c44:	0ff4f493          	andi	s1,s1,255
    80004c48:	00c00793          	li	a5,12
    80004c4c:	fc97f0e3          	bgeu	a5,s1,80004c0c <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    80004c50:	00003517          	auipc	a0,0x3
    80004c54:	65850513          	addi	a0,a0,1624 # 800082a8 <_ZZ14kprintUnsignedmE6digits+0xb8>
    80004c58:	00000097          	auipc	ra,0x0
    80004c5c:	85c080e7          	jalr	-1956(ra) # 800044b4 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80004c60:	00500313          	li	t1,5
    thread_dispatch();
    80004c64:	ffffe097          	auipc	ra,0xffffe
    80004c68:	ab4080e7          	jalr	-1356(ra) # 80002718 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80004c6c:	01000513          	li	a0,16
    80004c70:	00000097          	auipc	ra,0x0
    80004c74:	be8080e7          	jalr	-1048(ra) # 80004858 <_Z9fibonaccim>
    80004c78:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80004c7c:	00003517          	auipc	a0,0x3
    80004c80:	63c50513          	addi	a0,a0,1596 # 800082b8 <_ZZ14kprintUnsignedmE6digits+0xc8>
    80004c84:	00000097          	auipc	ra,0x0
    80004c88:	830080e7          	jalr	-2000(ra) # 800044b4 <_Z11printStringPKc>
    80004c8c:	00000613          	li	a2,0
    80004c90:	00a00593          	li	a1,10
    80004c94:	0009051b          	sext.w	a0,s2
    80004c98:	fffff097          	auipc	ra,0xfffff
    80004c9c:	708080e7          	jalr	1800(ra) # 800043a0 <_ZL8printIntiii>
    80004ca0:	00003517          	auipc	a0,0x3
    80004ca4:	4e850513          	addi	a0,a0,1256 # 80008188 <CONSOLE_STATUS+0x178>
    80004ca8:	00000097          	auipc	ra,0x0
    80004cac:	80c080e7          	jalr	-2036(ra) # 800044b4 <_Z11printStringPKc>
    80004cb0:	0400006f          	j	80004cf0 <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004cb4:	00003517          	auipc	a0,0x3
    80004cb8:	5ec50513          	addi	a0,a0,1516 # 800082a0 <_ZZ14kprintUnsignedmE6digits+0xb0>
    80004cbc:	fffff097          	auipc	ra,0xfffff
    80004cc0:	7f8080e7          	jalr	2040(ra) # 800044b4 <_Z11printStringPKc>
    80004cc4:	00000613          	li	a2,0
    80004cc8:	00a00593          	li	a1,10
    80004ccc:	00048513          	mv	a0,s1
    80004cd0:	fffff097          	auipc	ra,0xfffff
    80004cd4:	6d0080e7          	jalr	1744(ra) # 800043a0 <_ZL8printIntiii>
    80004cd8:	00003517          	auipc	a0,0x3
    80004cdc:	4b050513          	addi	a0,a0,1200 # 80008188 <CONSOLE_STATUS+0x178>
    80004ce0:	fffff097          	auipc	ra,0xfffff
    80004ce4:	7d4080e7          	jalr	2004(ra) # 800044b4 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80004ce8:	0014849b          	addiw	s1,s1,1
    80004cec:	0ff4f493          	andi	s1,s1,255
    80004cf0:	00f00793          	li	a5,15
    80004cf4:	fc97f0e3          	bgeu	a5,s1,80004cb4 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    80004cf8:	00003517          	auipc	a0,0x3
    80004cfc:	5d050513          	addi	a0,a0,1488 # 800082c8 <_ZZ14kprintUnsignedmE6digits+0xd8>
    80004d00:	fffff097          	auipc	ra,0xfffff
    80004d04:	7b4080e7          	jalr	1972(ra) # 800044b4 <_Z11printStringPKc>
    finishedD = true;
    80004d08:	00100793          	li	a5,1
    80004d0c:	00006717          	auipc	a4,0x6
    80004d10:	96f700a3          	sb	a5,-1695(a4) # 8000a66d <finishedD>
    thread_dispatch();
    80004d14:	ffffe097          	auipc	ra,0xffffe
    80004d18:	a04080e7          	jalr	-1532(ra) # 80002718 <_Z15thread_dispatchv>
}
    80004d1c:	01813083          	ld	ra,24(sp)
    80004d20:	01013403          	ld	s0,16(sp)
    80004d24:	00813483          	ld	s1,8(sp)
    80004d28:	00013903          	ld	s2,0(sp)
    80004d2c:	02010113          	addi	sp,sp,32
    80004d30:	00008067          	ret

0000000080004d34 <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    80004d34:	fc010113          	addi	sp,sp,-64
    80004d38:	02113c23          	sd	ra,56(sp)
    80004d3c:	02813823          	sd	s0,48(sp)
    80004d40:	02913423          	sd	s1,40(sp)
    80004d44:	03213023          	sd	s2,32(sp)
    80004d48:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    80004d4c:	02000513          	li	a0,32
    80004d50:	ffffe097          	auipc	ra,0xffffe
    80004d54:	bf8080e7          	jalr	-1032(ra) # 80002948 <_Znwm>
    80004d58:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    80004d5c:	ffffe097          	auipc	ra,0xffffe
    80004d60:	e98080e7          	jalr	-360(ra) # 80002bf4 <_ZN6ThreadC1Ev>
    80004d64:	00005797          	auipc	a5,0x5
    80004d68:	79c78793          	addi	a5,a5,1948 # 8000a500 <_ZTV7WorkerA+0x10>
    80004d6c:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    80004d70:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    80004d74:	00003517          	auipc	a0,0x3
    80004d78:	56450513          	addi	a0,a0,1380 # 800082d8 <_ZZ14kprintUnsignedmE6digits+0xe8>
    80004d7c:	fffff097          	auipc	ra,0xfffff
    80004d80:	738080e7          	jalr	1848(ra) # 800044b4 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    80004d84:	02000513          	li	a0,32
    80004d88:	ffffe097          	auipc	ra,0xffffe
    80004d8c:	bc0080e7          	jalr	-1088(ra) # 80002948 <_Znwm>
    80004d90:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    80004d94:	ffffe097          	auipc	ra,0xffffe
    80004d98:	e60080e7          	jalr	-416(ra) # 80002bf4 <_ZN6ThreadC1Ev>
    80004d9c:	00005797          	auipc	a5,0x5
    80004da0:	78c78793          	addi	a5,a5,1932 # 8000a528 <_ZTV7WorkerB+0x10>
    80004da4:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    80004da8:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    80004dac:	00003517          	auipc	a0,0x3
    80004db0:	54450513          	addi	a0,a0,1348 # 800082f0 <_ZZ14kprintUnsignedmE6digits+0x100>
    80004db4:	fffff097          	auipc	ra,0xfffff
    80004db8:	700080e7          	jalr	1792(ra) # 800044b4 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    80004dbc:	02000513          	li	a0,32
    80004dc0:	ffffe097          	auipc	ra,0xffffe
    80004dc4:	b88080e7          	jalr	-1144(ra) # 80002948 <_Znwm>
    80004dc8:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    80004dcc:	ffffe097          	auipc	ra,0xffffe
    80004dd0:	e28080e7          	jalr	-472(ra) # 80002bf4 <_ZN6ThreadC1Ev>
    80004dd4:	00005797          	auipc	a5,0x5
    80004dd8:	77c78793          	addi	a5,a5,1916 # 8000a550 <_ZTV7WorkerC+0x10>
    80004ddc:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    80004de0:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    80004de4:	00003517          	auipc	a0,0x3
    80004de8:	52450513          	addi	a0,a0,1316 # 80008308 <_ZZ14kprintUnsignedmE6digits+0x118>
    80004dec:	fffff097          	auipc	ra,0xfffff
    80004df0:	6c8080e7          	jalr	1736(ra) # 800044b4 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    80004df4:	02000513          	li	a0,32
    80004df8:	ffffe097          	auipc	ra,0xffffe
    80004dfc:	b50080e7          	jalr	-1200(ra) # 80002948 <_Znwm>
    80004e00:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    80004e04:	ffffe097          	auipc	ra,0xffffe
    80004e08:	df0080e7          	jalr	-528(ra) # 80002bf4 <_ZN6ThreadC1Ev>
    80004e0c:	00005797          	auipc	a5,0x5
    80004e10:	76c78793          	addi	a5,a5,1900 # 8000a578 <_ZTV7WorkerD+0x10>
    80004e14:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    80004e18:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    80004e1c:	00003517          	auipc	a0,0x3
    80004e20:	50450513          	addi	a0,a0,1284 # 80008320 <_ZZ14kprintUnsignedmE6digits+0x130>
    80004e24:	fffff097          	auipc	ra,0xfffff
    80004e28:	690080e7          	jalr	1680(ra) # 800044b4 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    80004e2c:	00000493          	li	s1,0
    80004e30:	00300793          	li	a5,3
    80004e34:	0297c663          	blt	a5,s1,80004e60 <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    80004e38:	00349793          	slli	a5,s1,0x3
    80004e3c:	fe040713          	addi	a4,s0,-32
    80004e40:	00f707b3          	add	a5,a4,a5
    80004e44:	fe07b503          	ld	a0,-32(a5)
    80004e48:	ffffe097          	auipc	ra,0xffffe
    80004e4c:	cf0080e7          	jalr	-784(ra) # 80002b38 <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    80004e50:	0014849b          	addiw	s1,s1,1
    80004e54:	fddff06f          	j	80004e30 <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    80004e58:	ffffe097          	auipc	ra,0xffffe
    80004e5c:	d14080e7          	jalr	-748(ra) # 80002b6c <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80004e60:	00006797          	auipc	a5,0x6
    80004e64:	80a7c783          	lbu	a5,-2038(a5) # 8000a66a <finishedA>
    80004e68:	fe0788e3          	beqz	a5,80004e58 <_Z20Threads_CPP_API_testv+0x124>
    80004e6c:	00005797          	auipc	a5,0x5
    80004e70:	7ff7c783          	lbu	a5,2047(a5) # 8000a66b <finishedB>
    80004e74:	fe0782e3          	beqz	a5,80004e58 <_Z20Threads_CPP_API_testv+0x124>
    80004e78:	00005797          	auipc	a5,0x5
    80004e7c:	7f47c783          	lbu	a5,2036(a5) # 8000a66c <finishedC>
    80004e80:	fc078ce3          	beqz	a5,80004e58 <_Z20Threads_CPP_API_testv+0x124>
    80004e84:	00005797          	auipc	a5,0x5
    80004e88:	7e97c783          	lbu	a5,2025(a5) # 8000a66d <finishedD>
    80004e8c:	fc0786e3          	beqz	a5,80004e58 <_Z20Threads_CPP_API_testv+0x124>
    }

    for (auto thread: threads) { delete thread; }
    80004e90:	fc040493          	addi	s1,s0,-64
    80004e94:	0080006f          	j	80004e9c <_Z20Threads_CPP_API_testv+0x168>
    80004e98:	00848493          	addi	s1,s1,8
    80004e9c:	fe040793          	addi	a5,s0,-32
    80004ea0:	08f48663          	beq	s1,a5,80004f2c <_Z20Threads_CPP_API_testv+0x1f8>
    80004ea4:	0004b503          	ld	a0,0(s1)
    80004ea8:	fe0508e3          	beqz	a0,80004e98 <_Z20Threads_CPP_API_testv+0x164>
    80004eac:	00053783          	ld	a5,0(a0)
    80004eb0:	0087b783          	ld	a5,8(a5)
    80004eb4:	000780e7          	jalr	a5
    80004eb8:	fe1ff06f          	j	80004e98 <_Z20Threads_CPP_API_testv+0x164>
    80004ebc:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    80004ec0:	00048513          	mv	a0,s1
    80004ec4:	ffffe097          	auipc	ra,0xffffe
    80004ec8:	ad4080e7          	jalr	-1324(ra) # 80002998 <_ZdlPv>
    80004ecc:	00090513          	mv	a0,s2
    80004ed0:	00007097          	auipc	ra,0x7
    80004ed4:	868080e7          	jalr	-1944(ra) # 8000b738 <_Unwind_Resume>
    80004ed8:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    80004edc:	00048513          	mv	a0,s1
    80004ee0:	ffffe097          	auipc	ra,0xffffe
    80004ee4:	ab8080e7          	jalr	-1352(ra) # 80002998 <_ZdlPv>
    80004ee8:	00090513          	mv	a0,s2
    80004eec:	00007097          	auipc	ra,0x7
    80004ef0:	84c080e7          	jalr	-1972(ra) # 8000b738 <_Unwind_Resume>
    80004ef4:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    80004ef8:	00048513          	mv	a0,s1
    80004efc:	ffffe097          	auipc	ra,0xffffe
    80004f00:	a9c080e7          	jalr	-1380(ra) # 80002998 <_ZdlPv>
    80004f04:	00090513          	mv	a0,s2
    80004f08:	00007097          	auipc	ra,0x7
    80004f0c:	830080e7          	jalr	-2000(ra) # 8000b738 <_Unwind_Resume>
    80004f10:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    80004f14:	00048513          	mv	a0,s1
    80004f18:	ffffe097          	auipc	ra,0xffffe
    80004f1c:	a80080e7          	jalr	-1408(ra) # 80002998 <_ZdlPv>
    80004f20:	00090513          	mv	a0,s2
    80004f24:	00007097          	auipc	ra,0x7
    80004f28:	814080e7          	jalr	-2028(ra) # 8000b738 <_Unwind_Resume>
}
    80004f2c:	03813083          	ld	ra,56(sp)
    80004f30:	03013403          	ld	s0,48(sp)
    80004f34:	02813483          	ld	s1,40(sp)
    80004f38:	02013903          	ld	s2,32(sp)
    80004f3c:	04010113          	addi	sp,sp,64
    80004f40:	00008067          	ret

0000000080004f44 <_Z12testSleepingv>:

void testSleeping() {
    80004f44:	fc010113          	addi	sp,sp,-64
    80004f48:	02113c23          	sd	ra,56(sp)
    80004f4c:	02813823          	sd	s0,48(sp)
    80004f50:	02913423          	sd	s1,40(sp)
    80004f54:	04010413          	addi	s0,sp,64
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    80004f58:	00a00793          	li	a5,10
    80004f5c:	fcf43823          	sd	a5,-48(s0)
    80004f60:	01400793          	li	a5,20
    80004f64:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    for (int i = 0; i < sleepy_thread_count; i++) {
    80004f68:	00000493          	li	s1,0
    80004f6c:	02c0006f          	j	80004f98 <_Z12testSleepingv+0x54>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    80004f70:	00349793          	slli	a5,s1,0x3
    80004f74:	fd040613          	addi	a2,s0,-48
    80004f78:	00f60633          	add	a2,a2,a5
    80004f7c:	fffff597          	auipc	a1,0xfffff
    80004f80:	5b458593          	addi	a1,a1,1460 # 80004530 <_Z9sleepyRunPv>
    80004f84:	fc040513          	addi	a0,s0,-64
    80004f88:	00f50533          	add	a0,a0,a5
    80004f8c:	ffffd097          	auipc	ra,0xffffd
    80004f90:	6ac080e7          	jalr	1708(ra) # 80002638 <_Z13thread_createPP7_threadPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    80004f94:	0014849b          	addiw	s1,s1,1
    80004f98:	00100793          	li	a5,1
    80004f9c:	fc97dae3          	bge	a5,s1,80004f70 <_Z12testSleepingv+0x2c>
    }

    while (!(finished[0] && finished[1])) {}
    80004fa0:	00005797          	auipc	a5,0x5
    80004fa4:	6c87c783          	lbu	a5,1736(a5) # 8000a668 <finished>
    80004fa8:	fe078ce3          	beqz	a5,80004fa0 <_Z12testSleepingv+0x5c>
    80004fac:	00005797          	auipc	a5,0x5
    80004fb0:	6bd7c783          	lbu	a5,1725(a5) # 8000a669 <finished+0x1>
    80004fb4:	fe0786e3          	beqz	a5,80004fa0 <_Z12testSleepingv+0x5c>
}
    80004fb8:	03813083          	ld	ra,56(sp)
    80004fbc:	03013403          	ld	s0,48(sp)
    80004fc0:	02813483          	ld	s1,40(sp)
    80004fc4:	04010113          	addi	sp,sp,64
    80004fc8:	00008067          	ret

0000000080004fcc <_Z3fibm>:
uint64 fib(uint64 n) {
    80004fcc:	fe010113          	addi	sp,sp,-32
    80004fd0:	00113c23          	sd	ra,24(sp)
    80004fd4:	00813823          	sd	s0,16(sp)
    80004fd8:	00913423          	sd	s1,8(sp)
    80004fdc:	01213023          	sd	s2,0(sp)
    80004fe0:	02010413          	addi	s0,sp,32
    80004fe4:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) return n;
    80004fe8:	00100793          	li	a5,1
    80004fec:	02a7f663          	bgeu	a5,a0,80005018 <_Z3fibm+0x4c>
    if (n % 4 == 0) {
    80004ff0:	00357793          	andi	a5,a0,3
    80004ff4:	02078e63          	beqz	a5,80005030 <_Z3fibm+0x64>
    return fibonacci(n-1) + fibonacci(n-2);
    80004ff8:	fff48513          	addi	a0,s1,-1
    80004ffc:	00000097          	auipc	ra,0x0
    80005000:	85c080e7          	jalr	-1956(ra) # 80004858 <_Z9fibonaccim>
    80005004:	00050913          	mv	s2,a0
    80005008:	ffe48513          	addi	a0,s1,-2
    8000500c:	00000097          	auipc	ra,0x0
    80005010:	84c080e7          	jalr	-1972(ra) # 80004858 <_Z9fibonaccim>
    80005014:	00a90533          	add	a0,s2,a0
}
    80005018:	01813083          	ld	ra,24(sp)
    8000501c:	01013403          	ld	s0,16(sp)
    80005020:	00813483          	ld	s1,8(sp)
    80005024:	00013903          	ld	s2,0(sp)
    80005028:	02010113          	addi	sp,sp,32
    8000502c:	00008067          	ret
        thread_dispatch();
    80005030:	ffffd097          	auipc	ra,0xffffd
    80005034:	6e8080e7          	jalr	1768(ra) # 80002718 <_Z15thread_dispatchv>
    80005038:	fc1ff06f          	j	80004ff8 <_Z3fibm+0x2c>

000000008000503c <_Z11workerBodyGPv>:

void workerBodyG(void *) {
    8000503c:	fe010113          	addi	sp,sp,-32
    80005040:	00113c23          	sd	ra,24(sp)
    80005044:	00813823          	sd	s0,16(sp)
    80005048:	00913423          	sd	s1,8(sp)
    8000504c:	01213023          	sd	s2,0(sp)
    80005050:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80005054:	00000493          	li	s1,0
    80005058:	0400006f          	j	80005098 <_Z11workerBodyGPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i=");
    8000505c:	00003517          	auipc	a0,0x3
    80005060:	21450513          	addi	a0,a0,532 # 80008270 <_ZZ14kprintUnsignedmE6digits+0x80>
    80005064:	fffff097          	auipc	ra,0xfffff
    80005068:	450080e7          	jalr	1104(ra) # 800044b4 <_Z11printStringPKc>
        printInt(i);
    8000506c:	00000613          	li	a2,0
    80005070:	00a00593          	li	a1,10
    80005074:	00048513          	mv	a0,s1
    80005078:	fffff097          	auipc	ra,0xfffff
    8000507c:	328080e7          	jalr	808(ra) # 800043a0 <_ZL8printIntiii>
        printString("\n");
    80005080:	00003517          	auipc	a0,0x3
    80005084:	10850513          	addi	a0,a0,264 # 80008188 <CONSOLE_STATUS+0x178>
    80005088:	fffff097          	auipc	ra,0xfffff
    8000508c:	42c080e7          	jalr	1068(ra) # 800044b4 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80005090:	0014849b          	addiw	s1,s1,1
    80005094:	0ff4f493          	andi	s1,s1,255
    80005098:	00200793          	li	a5,2
    8000509c:	fc97f0e3          	bgeu	a5,s1,8000505c <_Z11workerBodyGPv+0x20>
    }

    printString("C: yield\n");
    800050a0:	00003517          	auipc	a0,0x3
    800050a4:	29850513          	addi	a0,a0,664 # 80008338 <_ZZ14kprintUnsignedmE6digits+0x148>
    800050a8:	fffff097          	auipc	ra,0xfffff
    800050ac:	40c080e7          	jalr	1036(ra) # 800044b4 <_Z11printStringPKc>
    __asm__("li t1, 7");
    800050b0:	00700313          	li	t1,7
    thread_dispatch();
    800050b4:	ffffd097          	auipc	ra,0xffffd
    800050b8:	664080e7          	jalr	1636(ra) # 80002718 <_Z15thread_dispatchv>

    uint64  t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    800050bc:	00030913          	mv	s2,t1

    printString("C: t1=");
    800050c0:	00003517          	auipc	a0,0x3
    800050c4:	1c850513          	addi	a0,a0,456 # 80008288 <_ZZ14kprintUnsignedmE6digits+0x98>
    800050c8:	fffff097          	auipc	ra,0xfffff
    800050cc:	3ec080e7          	jalr	1004(ra) # 800044b4 <_Z11printStringPKc>
    printInt(t1);
    800050d0:	00000613          	li	a2,0
    800050d4:	00a00593          	li	a1,10
    800050d8:	0009051b          	sext.w	a0,s2
    800050dc:	fffff097          	auipc	ra,0xfffff
    800050e0:	2c4080e7          	jalr	708(ra) # 800043a0 <_ZL8printIntiii>
    printString("\n");
    800050e4:	00003517          	auipc	a0,0x3
    800050e8:	0a450513          	addi	a0,a0,164 # 80008188 <CONSOLE_STATUS+0x178>
    800050ec:	fffff097          	auipc	ra,0xfffff
    800050f0:	3c8080e7          	jalr	968(ra) # 800044b4 <_Z11printStringPKc>

    uint64 result = fib(30);
    800050f4:	01e00513          	li	a0,30
    800050f8:	00000097          	auipc	ra,0x0
    800050fc:	ed4080e7          	jalr	-300(ra) # 80004fcc <_Z3fibm>
    80005100:	00050913          	mv	s2,a0
    printString("C: fibonacci=");
    80005104:	00003517          	auipc	a0,0x3
    80005108:	24450513          	addi	a0,a0,580 # 80008348 <_ZZ14kprintUnsignedmE6digits+0x158>
    8000510c:	fffff097          	auipc	ra,0xfffff
    80005110:	3a8080e7          	jalr	936(ra) # 800044b4 <_Z11printStringPKc>
    printInt(result);
    80005114:	00000613          	li	a2,0
    80005118:	00a00593          	li	a1,10
    8000511c:	0009051b          	sext.w	a0,s2
    80005120:	fffff097          	auipc	ra,0xfffff
    80005124:	280080e7          	jalr	640(ra) # 800043a0 <_ZL8printIntiii>
    printString("\n");
    80005128:	00003517          	auipc	a0,0x3
    8000512c:	06050513          	addi	a0,a0,96 # 80008188 <CONSOLE_STATUS+0x178>
    80005130:	fffff097          	auipc	ra,0xfffff
    80005134:	384080e7          	jalr	900(ra) # 800044b4 <_Z11printStringPKc>
    80005138:	0400006f          	j	80005178 <_Z11workerBodyGPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i=");
    8000513c:	00003517          	auipc	a0,0x3
    80005140:	13450513          	addi	a0,a0,308 # 80008270 <_ZZ14kprintUnsignedmE6digits+0x80>
    80005144:	fffff097          	auipc	ra,0xfffff
    80005148:	370080e7          	jalr	880(ra) # 800044b4 <_Z11printStringPKc>
        printInt(i);
    8000514c:	00000613          	li	a2,0
    80005150:	00a00593          	li	a1,10
    80005154:	00048513          	mv	a0,s1
    80005158:	fffff097          	auipc	ra,0xfffff
    8000515c:	248080e7          	jalr	584(ra) # 800043a0 <_ZL8printIntiii>
        printString("\n");
    80005160:	00003517          	auipc	a0,0x3
    80005164:	02850513          	addi	a0,a0,40 # 80008188 <CONSOLE_STATUS+0x178>
    80005168:	fffff097          	auipc	ra,0xfffff
    8000516c:	34c080e7          	jalr	844(ra) # 800044b4 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80005170:	0014849b          	addiw	s1,s1,1
    80005174:	0ff4f493          	andi	s1,s1,255
    80005178:	00500793          	li	a5,5
    8000517c:	fc97f0e3          	bgeu	a5,s1,8000513c <_Z11workerBodyGPv+0x100>
    }
    // TCB::yield()
    printString("Worker C finished\n");
    80005180:	00003517          	auipc	a0,0x3
    80005184:	1d850513          	addi	a0,a0,472 # 80008358 <_ZZ14kprintUnsignedmE6digits+0x168>
    80005188:	fffff097          	auipc	ra,0xfffff
    8000518c:	32c080e7          	jalr	812(ra) # 800044b4 <_Z11printStringPKc>
}
    80005190:	01813083          	ld	ra,24(sp)
    80005194:	01013403          	ld	s0,16(sp)
    80005198:	00813483          	ld	s1,8(sp)
    8000519c:	00013903          	ld	s2,0(sp)
    800051a0:	02010113          	addi	sp,sp,32
    800051a4:	00008067          	ret

00000000800051a8 <_Z11workerBodyHPv>:

void workerBodyH(void *) {
    800051a8:	fe010113          	addi	sp,sp,-32
    800051ac:	00113c23          	sd	ra,24(sp)
    800051b0:	00813823          	sd	s0,16(sp)
    800051b4:	00913423          	sd	s1,8(sp)
    800051b8:	01213023          	sd	s2,0(sp)
    800051bc:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800051c0:	00a00493          	li	s1,10
    800051c4:	0400006f          	j	80005204 <_Z11workerBodyHPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i=");
    800051c8:	00003517          	auipc	a0,0x3
    800051cc:	0d850513          	addi	a0,a0,216 # 800082a0 <_ZZ14kprintUnsignedmE6digits+0xb0>
    800051d0:	fffff097          	auipc	ra,0xfffff
    800051d4:	2e4080e7          	jalr	740(ra) # 800044b4 <_Z11printStringPKc>
        printInt(i);
    800051d8:	00000613          	li	a2,0
    800051dc:	00a00593          	li	a1,10
    800051e0:	00048513          	mv	a0,s1
    800051e4:	fffff097          	auipc	ra,0xfffff
    800051e8:	1bc080e7          	jalr	444(ra) # 800043a0 <_ZL8printIntiii>
        printString("\n");
    800051ec:	00003517          	auipc	a0,0x3
    800051f0:	f9c50513          	addi	a0,a0,-100 # 80008188 <CONSOLE_STATUS+0x178>
    800051f4:	fffff097          	auipc	ra,0xfffff
    800051f8:	2c0080e7          	jalr	704(ra) # 800044b4 <_Z11printStringPKc>
    for (; i < 13; i++) {
    800051fc:	0014849b          	addiw	s1,s1,1
    80005200:	0ff4f493          	andi	s1,s1,255
    80005204:	00c00793          	li	a5,12
    80005208:	fc97f0e3          	bgeu	a5,s1,800051c8 <_Z11workerBodyHPv+0x20>
    }

    printString("D: yield\n");
    8000520c:	00003517          	auipc	a0,0x3
    80005210:	16450513          	addi	a0,a0,356 # 80008370 <_ZZ14kprintUnsignedmE6digits+0x180>
    80005214:	fffff097          	auipc	ra,0xfffff
    80005218:	2a0080e7          	jalr	672(ra) # 800044b4 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    8000521c:	00500313          	li	t1,5
    thread_dispatch();
    80005220:	ffffd097          	auipc	ra,0xffffd
    80005224:	4f8080e7          	jalr	1272(ra) # 80002718 <_Z15thread_dispatchv>

    uint64 result = fib(23);
    80005228:	01700513          	li	a0,23
    8000522c:	00000097          	auipc	ra,0x0
    80005230:	da0080e7          	jalr	-608(ra) # 80004fcc <_Z3fibm>
    80005234:	00050913          	mv	s2,a0
    printString("D: fibonacci=");
    80005238:	00003517          	auipc	a0,0x3
    8000523c:	14850513          	addi	a0,a0,328 # 80008380 <_ZZ14kprintUnsignedmE6digits+0x190>
    80005240:	fffff097          	auipc	ra,0xfffff
    80005244:	274080e7          	jalr	628(ra) # 800044b4 <_Z11printStringPKc>
    printInt(result);
    80005248:	00000613          	li	a2,0
    8000524c:	00a00593          	li	a1,10
    80005250:	0009051b          	sext.w	a0,s2
    80005254:	fffff097          	auipc	ra,0xfffff
    80005258:	14c080e7          	jalr	332(ra) # 800043a0 <_ZL8printIntiii>
    printString("\n");
    8000525c:	00003517          	auipc	a0,0x3
    80005260:	f2c50513          	addi	a0,a0,-212 # 80008188 <CONSOLE_STATUS+0x178>
    80005264:	fffff097          	auipc	ra,0xfffff
    80005268:	250080e7          	jalr	592(ra) # 800044b4 <_Z11printStringPKc>
    8000526c:	0400006f          	j	800052ac <_Z11workerBodyHPv+0x104>

    for (; i < 16; i++) {
        printString("D: i=");
    80005270:	00003517          	auipc	a0,0x3
    80005274:	03050513          	addi	a0,a0,48 # 800082a0 <_ZZ14kprintUnsignedmE6digits+0xb0>
    80005278:	fffff097          	auipc	ra,0xfffff
    8000527c:	23c080e7          	jalr	572(ra) # 800044b4 <_Z11printStringPKc>
        printInt(i);
    80005280:	00000613          	li	a2,0
    80005284:	00a00593          	li	a1,10
    80005288:	00048513          	mv	a0,s1
    8000528c:	fffff097          	auipc	ra,0xfffff
    80005290:	114080e7          	jalr	276(ra) # 800043a0 <_ZL8printIntiii>
        printString("\n");
    80005294:	00003517          	auipc	a0,0x3
    80005298:	ef450513          	addi	a0,a0,-268 # 80008188 <CONSOLE_STATUS+0x178>
    8000529c:	fffff097          	auipc	ra,0xfffff
    800052a0:	218080e7          	jalr	536(ra) # 800044b4 <_Z11printStringPKc>
    for (; i < 16; i++) {
    800052a4:	0014849b          	addiw	s1,s1,1
    800052a8:	0ff4f493          	andi	s1,s1,255
    800052ac:	00f00793          	li	a5,15
    800052b0:	fc97f0e3          	bgeu	a5,s1,80005270 <_Z11workerBodyHPv+0xc8>
    }
    // TCB::yield()
    printString("Worker D finished\n");
    800052b4:	00003517          	auipc	a0,0x3
    800052b8:	0dc50513          	addi	a0,a0,220 # 80008390 <_ZZ14kprintUnsignedmE6digits+0x1a0>
    800052bc:	fffff097          	auipc	ra,0xfffff
    800052c0:	1f8080e7          	jalr	504(ra) # 800044b4 <_Z11printStringPKc>
}
    800052c4:	01813083          	ld	ra,24(sp)
    800052c8:	01013403          	ld	s0,16(sp)
    800052cc:	00813483          	ld	s1,8(sp)
    800052d0:	00013903          	ld	s2,0(sp)
    800052d4:	02010113          	addi	sp,sp,32
    800052d8:	00008067          	ret

00000000800052dc <_Z10myUserMainv>:
#include "Workers.h"
#include "../h/syscall_c.h"
#include "ProducerConsumer.h"
#include "printing.hpp"

void myUserMain() {
    800052dc:	fa010113          	addi	sp,sp,-96
    800052e0:	04113c23          	sd	ra,88(sp)
    800052e4:	04813823          	sd	s0,80(sp)
    800052e8:	04913423          	sd	s1,72(sp)
    800052ec:	05213023          	sd	s2,64(sp)
    800052f0:	06010413          	addi	s0,sp,96
    printString("In user main\n");
    800052f4:	00003517          	auipc	a0,0x3
    800052f8:	0b450513          	addi	a0,a0,180 # 800083a8 <_ZZ14kprintUnsignedmE6digits+0x1b8>
    800052fc:	fffff097          	auipc	ra,0xfffff
    80005300:	1b8080e7          	jalr	440(ra) # 800044b4 <_Z11printStringPKc>

    void *mem = mem_alloc(25000);
    80005304:	00006537          	lui	a0,0x6
    80005308:	1a850513          	addi	a0,a0,424 # 61a8 <_entry-0x7fff9e58>
    8000530c:	ffffd097          	auipc	ra,0xffffd
    80005310:	2b4080e7          	jalr	692(ra) # 800025c0 <_Z9mem_allocm>
    80005314:	00050913          	mv	s2,a0
    printInt((uint64) mem);
    80005318:	00000613          	li	a2,0
    8000531c:	00a00593          	li	a1,10
    80005320:	0005051b          	sext.w	a0,a0
    80005324:	fffff097          	auipc	ra,0xfffff
    80005328:	07c080e7          	jalr	124(ra) # 800043a0 <_ZL8printIntiii>
    printString("\n");
    8000532c:	00003517          	auipc	a0,0x3
    80005330:	e5c50513          	addi	a0,a0,-420 # 80008188 <CONSOLE_STATUS+0x178>
    80005334:	fffff097          	auipc	ra,0xfffff
    80005338:	180080e7          	jalr	384(ra) # 800044b4 <_Z11printStringPKc>

    ProducerConsumer *obj = new ProducerConsumer();
    8000533c:	01800513          	li	a0,24
    80005340:	ffffd097          	auipc	ra,0xffffd
    80005344:	608080e7          	jalr	1544(ra) # 80002948 <_Znwm>
    80005348:	00050493          	mv	s1,a0
#include "../h/syscall_c.h"
#include "printing.hpp"

class ProducerConsumer {
public:
    ProducerConsumer() {
    8000534c:	00052823          	sw	zero,16(a0)
        sem_open(&semConsumer, 0);
    80005350:	00000593          	li	a1,0
    80005354:	00850513          	addi	a0,a0,8
    80005358:	ffffd097          	auipc	ra,0xffffd
    8000535c:	3f0080e7          	jalr	1008(ra) # 80002748 <_Z8sem_openPP4_semj>
        sem_open(&semProducer, 1);
    80005360:	00100593          	li	a1,1
    80005364:	00048513          	mv	a0,s1
    80005368:	ffffd097          	auipc	ra,0xffffd
    8000536c:	3e0080e7          	jalr	992(ra) # 80002748 <_Z8sem_openPP4_semj>
    thread_t t5;
    thread_t t6;
    thread_t t7;
    thread_t t8;

    thread_create(&t1, &workerBodyE, nullptr);
    80005370:	00000613          	li	a2,0
    80005374:	fffff597          	auipc	a1,0xfffff
    80005378:	26058593          	addi	a1,a1,608 # 800045d4 <_Z11workerBodyEPv>
    8000537c:	fd840513          	addi	a0,s0,-40
    80005380:	ffffd097          	auipc	ra,0xffffd
    80005384:	2b8080e7          	jalr	696(ra) # 80002638 <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t2, &workerBodyF, nullptr);
    80005388:	00000613          	li	a2,0
    8000538c:	fffff597          	auipc	a1,0xfffff
    80005390:	2f858593          	addi	a1,a1,760 # 80004684 <_Z11workerBodyFPv>
    80005394:	fd040513          	addi	a0,s0,-48
    80005398:	ffffd097          	auipc	ra,0xffffd
    8000539c:	2a0080e7          	jalr	672(ra) # 80002638 <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t3, &workerBodyG, nullptr);
    800053a0:	00000613          	li	a2,0
    800053a4:	00000597          	auipc	a1,0x0
    800053a8:	c9858593          	addi	a1,a1,-872 # 8000503c <_Z11workerBodyGPv>
    800053ac:	fc840513          	addi	a0,s0,-56
    800053b0:	ffffd097          	auipc	ra,0xffffd
    800053b4:	288080e7          	jalr	648(ra) # 80002638 <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t4, &workerBodyH, nullptr);
    800053b8:	00000613          	li	a2,0
    800053bc:	00000597          	auipc	a1,0x0
    800053c0:	dec58593          	addi	a1,a1,-532 # 800051a8 <_Z11workerBodyHPv>
    800053c4:	fc040513          	addi	a0,s0,-64
    800053c8:	ffffd097          	auipc	ra,0xffffd
    800053cc:	270080e7          	jalr	624(ra) # 80002638 <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t5, &ProducerConsumer::produceWrapper, obj);
    800053d0:	00048613          	mv	a2,s1
    800053d4:	00000597          	auipc	a1,0x0
    800053d8:	3a458593          	addi	a1,a1,932 # 80005778 <_ZN16ProducerConsumer14produceWrapperEPv>
    800053dc:	fb840513          	addi	a0,s0,-72
    800053e0:	ffffd097          	auipc	ra,0xffffd
    800053e4:	258080e7          	jalr	600(ra) # 80002638 <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t6, &ProducerConsumer::consumeWrapper, obj);
    800053e8:	00048613          	mv	a2,s1
    800053ec:	00000597          	auipc	a1,0x0
    800053f0:	47058593          	addi	a1,a1,1136 # 8000585c <_ZN16ProducerConsumer14consumeWrapperEPv>
    800053f4:	fb040513          	addi	a0,s0,-80
    800053f8:	ffffd097          	auipc	ra,0xffffd
    800053fc:	240080e7          	jalr	576(ra) # 80002638 <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t7, &ProducerConsumer::consumeWrapper, obj);
    80005400:	00048613          	mv	a2,s1
    80005404:	00000597          	auipc	a1,0x0
    80005408:	45858593          	addi	a1,a1,1112 # 8000585c <_ZN16ProducerConsumer14consumeWrapperEPv>
    8000540c:	fa840513          	addi	a0,s0,-88
    80005410:	ffffd097          	auipc	ra,0xffffd
    80005414:	228080e7          	jalr	552(ra) # 80002638 <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&t8, &ProducerConsumer::consumeWrapper, obj);
    80005418:	00048613          	mv	a2,s1
    8000541c:	00000597          	auipc	a1,0x0
    80005420:	44058593          	addi	a1,a1,1088 # 8000585c <_ZN16ProducerConsumer14consumeWrapperEPv>
    80005424:	fa040513          	addi	a0,s0,-96
    80005428:	ffffd097          	auipc	ra,0xffffd
    8000542c:	210080e7          	jalr	528(ra) # 80002638 <_Z13thread_createPP7_threadPFvPvES2_>

    time_sleep(50);
    80005430:	03200513          	li	a0,50
    80005434:	ffffd097          	auipc	ra,0xffffd
    80005438:	450080e7          	jalr	1104(ra) # 80002884 <_Z10time_sleepm>

    printString("Nit t2: ");
    8000543c:	00003517          	auipc	a0,0x3
    80005440:	f7c50513          	addi	a0,a0,-132 # 800083b8 <_ZZ14kprintUnsignedmE6digits+0x1c8>
    80005444:	fffff097          	auipc	ra,0xfffff
    80005448:	070080e7          	jalr	112(ra) # 800044b4 <_Z11printStringPKc>
    printInt((uint64) t2);
    8000544c:	00000613          	li	a2,0
    80005450:	00a00593          	li	a1,10
    80005454:	fd042503          	lw	a0,-48(s0)
    80005458:	fffff097          	auipc	ra,0xfffff
    8000545c:	f48080e7          	jalr	-184(ra) # 800043a0 <_ZL8printIntiii>
    printString("\n");
    80005460:	00003517          	auipc	a0,0x3
    80005464:	d2850513          	addi	a0,a0,-728 # 80008188 <CONSOLE_STATUS+0x178>
    80005468:	fffff097          	auipc	ra,0xfffff
    8000546c:	04c080e7          	jalr	76(ra) # 800044b4 <_Z11printStringPKc>

    time_sleep(150);
    80005470:	09600513          	li	a0,150
    80005474:	ffffd097          	auipc	ra,0xffffd
    80005478:	410080e7          	jalr	1040(ra) # 80002884 <_Z10time_sleepm>

    printString("Mem free called with ret value ");
    8000547c:	00003517          	auipc	a0,0x3
    80005480:	f4c50513          	addi	a0,a0,-180 # 800083c8 <_ZZ14kprintUnsignedmE6digits+0x1d8>
    80005484:	fffff097          	auipc	ra,0xfffff
    80005488:	030080e7          	jalr	48(ra) # 800044b4 <_Z11printStringPKc>
    printInt(mem_free(mem));
    8000548c:	00090513          	mv	a0,s2
    80005490:	ffffd097          	auipc	ra,0xffffd
    80005494:	174080e7          	jalr	372(ra) # 80002604 <_Z8mem_freePv>
    80005498:	00000613          	li	a2,0
    8000549c:	00a00593          	li	a1,10
    800054a0:	fffff097          	auipc	ra,0xfffff
    800054a4:	f00080e7          	jalr	-256(ra) # 800043a0 <_ZL8printIntiii>
    printString("\n");
    800054a8:	00003517          	auipc	a0,0x3
    800054ac:	ce050513          	addi	a0,a0,-800 # 80008188 <CONSOLE_STATUS+0x178>
    800054b0:	fffff097          	auipc	ra,0xfffff
    800054b4:	004080e7          	jalr	4(ra) # 800044b4 <_Z11printStringPKc>

    printString("Mem free called again with ret value ");
    800054b8:	00003517          	auipc	a0,0x3
    800054bc:	f3050513          	addi	a0,a0,-208 # 800083e8 <_ZZ14kprintUnsignedmE6digits+0x1f8>
    800054c0:	fffff097          	auipc	ra,0xfffff
    800054c4:	ff4080e7          	jalr	-12(ra) # 800044b4 <_Z11printStringPKc>
    printInt(mem_free(mem), 10, 1);
    800054c8:	00090513          	mv	a0,s2
    800054cc:	ffffd097          	auipc	ra,0xffffd
    800054d0:	138080e7          	jalr	312(ra) # 80002604 <_Z8mem_freePv>
    800054d4:	00100613          	li	a2,1
    800054d8:	00a00593          	li	a1,10
    800054dc:	fffff097          	auipc	ra,0xfffff
    800054e0:	ec4080e7          	jalr	-316(ra) # 800043a0 <_ZL8printIntiii>
    printString("\n");
    800054e4:	00003517          	auipc	a0,0x3
    800054e8:	ca450513          	addi	a0,a0,-860 # 80008188 <CONSOLE_STATUS+0x178>
    800054ec:	fffff097          	auipc	ra,0xfffff
    800054f0:	fc8080e7          	jalr	-56(ra) # 800044b4 <_Z11printStringPKc>

    delete obj;
    800054f4:	00048863          	beqz	s1,80005504 <_Z10myUserMainv+0x228>
    800054f8:	00048513          	mv	a0,s1
    800054fc:	ffffd097          	auipc	ra,0xffffd
    80005500:	49c080e7          	jalr	1180(ra) # 80002998 <_ZdlPv>

    printString("User main finished\n");
    80005504:	00003517          	auipc	a0,0x3
    80005508:	f0c50513          	addi	a0,a0,-244 # 80008410 <_ZZ14kprintUnsignedmE6digits+0x220>
    8000550c:	fffff097          	auipc	ra,0xfffff
    80005510:	fa8080e7          	jalr	-88(ra) # 800044b4 <_Z11printStringPKc>
}
    80005514:	05813083          	ld	ra,88(sp)
    80005518:	05013403          	ld	s0,80(sp)
    8000551c:	04813483          	ld	s1,72(sp)
    80005520:	04013903          	ld	s2,64(sp)
    80005524:	06010113          	addi	sp,sp,96
    80005528:	00008067          	ret
    8000552c:	00050913          	mv	s2,a0
    ProducerConsumer *obj = new ProducerConsumer();
    80005530:	00048513          	mv	a0,s1
    80005534:	ffffd097          	auipc	ra,0xffffd
    80005538:	464080e7          	jalr	1124(ra) # 80002998 <_ZdlPv>
    8000553c:	00090513          	mv	a0,s2
    80005540:	00006097          	auipc	ra,0x6
    80005544:	1f8080e7          	jalr	504(ra) # 8000b738 <_Unwind_Resume>

0000000080005548 <_Z8userMainv>:
#include "../test/ThreadSleep_C_API_test.hpp" // thread_sleep test C API
//#include "../test/ConsumerProducer_CPP_API_test.hpp" // zadatak 4. CPP API i asinhrona promena konteksta

#include "../test/myUserMain.h" // additional C API tests

void userMain() {
    80005548:	ff010113          	addi	sp,sp,-16
    8000554c:	00113423          	sd	ra,8(sp)
    80005550:	00813023          	sd	s0,0(sp)
    80005554:	01010413          	addi	s0,sp,16
//    Threads_CPP_API_test(); // zadatak 2., niti CPP API i sinhrona promena konteksta

//    producerConsumer_C_API(); // zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta
    //producerConsumer_CPP_Sync_API(); // zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta

    testSleeping(); // thread_sleep test C API
    80005558:	00000097          	auipc	ra,0x0
    8000555c:	9ec080e7          	jalr	-1556(ra) # 80004f44 <_Z12testSleepingv>
    //ConsumerProducerCPP::testConsumerProducer(); // zadatak 4. CPP API i asinhrona promena konteksta, kompletan test svega

    myUserMain(); // additional C API tests - Extreme - Testing every functionality
    80005560:	00000097          	auipc	ra,0x0
    80005564:	d7c080e7          	jalr	-644(ra) # 800052dc <_Z10myUserMainv>

    80005568:	00813083          	ld	ra,8(sp)
    8000556c:	00013403          	ld	s0,0(sp)
    80005570:	01010113          	addi	sp,sp,16
    80005574:	00008067          	ret

0000000080005578 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    80005578:	ff010113          	addi	sp,sp,-16
    8000557c:	00113423          	sd	ra,8(sp)
    80005580:	00813023          	sd	s0,0(sp)
    80005584:	01010413          	addi	s0,sp,16
    80005588:	00005797          	auipc	a5,0x5
    8000558c:	f7878793          	addi	a5,a5,-136 # 8000a500 <_ZTV7WorkerA+0x10>
    80005590:	00f53023          	sd	a5,0(a0)
    80005594:	ffffd097          	auipc	ra,0xffffd
    80005598:	42c080e7          	jalr	1068(ra) # 800029c0 <_ZN6ThreadD1Ev>
    8000559c:	00813083          	ld	ra,8(sp)
    800055a0:	00013403          	ld	s0,0(sp)
    800055a4:	01010113          	addi	sp,sp,16
    800055a8:	00008067          	ret

00000000800055ac <_ZN7WorkerAD0Ev>:
    800055ac:	fe010113          	addi	sp,sp,-32
    800055b0:	00113c23          	sd	ra,24(sp)
    800055b4:	00813823          	sd	s0,16(sp)
    800055b8:	00913423          	sd	s1,8(sp)
    800055bc:	02010413          	addi	s0,sp,32
    800055c0:	00050493          	mv	s1,a0
    800055c4:	00005797          	auipc	a5,0x5
    800055c8:	f3c78793          	addi	a5,a5,-196 # 8000a500 <_ZTV7WorkerA+0x10>
    800055cc:	00f53023          	sd	a5,0(a0)
    800055d0:	ffffd097          	auipc	ra,0xffffd
    800055d4:	3f0080e7          	jalr	1008(ra) # 800029c0 <_ZN6ThreadD1Ev>
    800055d8:	00048513          	mv	a0,s1
    800055dc:	ffffd097          	auipc	ra,0xffffd
    800055e0:	3bc080e7          	jalr	956(ra) # 80002998 <_ZdlPv>
    800055e4:	01813083          	ld	ra,24(sp)
    800055e8:	01013403          	ld	s0,16(sp)
    800055ec:	00813483          	ld	s1,8(sp)
    800055f0:	02010113          	addi	sp,sp,32
    800055f4:	00008067          	ret

00000000800055f8 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    800055f8:	ff010113          	addi	sp,sp,-16
    800055fc:	00113423          	sd	ra,8(sp)
    80005600:	00813023          	sd	s0,0(sp)
    80005604:	01010413          	addi	s0,sp,16
    80005608:	00005797          	auipc	a5,0x5
    8000560c:	f2078793          	addi	a5,a5,-224 # 8000a528 <_ZTV7WorkerB+0x10>
    80005610:	00f53023          	sd	a5,0(a0)
    80005614:	ffffd097          	auipc	ra,0xffffd
    80005618:	3ac080e7          	jalr	940(ra) # 800029c0 <_ZN6ThreadD1Ev>
    8000561c:	00813083          	ld	ra,8(sp)
    80005620:	00013403          	ld	s0,0(sp)
    80005624:	01010113          	addi	sp,sp,16
    80005628:	00008067          	ret

000000008000562c <_ZN7WorkerBD0Ev>:
    8000562c:	fe010113          	addi	sp,sp,-32
    80005630:	00113c23          	sd	ra,24(sp)
    80005634:	00813823          	sd	s0,16(sp)
    80005638:	00913423          	sd	s1,8(sp)
    8000563c:	02010413          	addi	s0,sp,32
    80005640:	00050493          	mv	s1,a0
    80005644:	00005797          	auipc	a5,0x5
    80005648:	ee478793          	addi	a5,a5,-284 # 8000a528 <_ZTV7WorkerB+0x10>
    8000564c:	00f53023          	sd	a5,0(a0)
    80005650:	ffffd097          	auipc	ra,0xffffd
    80005654:	370080e7          	jalr	880(ra) # 800029c0 <_ZN6ThreadD1Ev>
    80005658:	00048513          	mv	a0,s1
    8000565c:	ffffd097          	auipc	ra,0xffffd
    80005660:	33c080e7          	jalr	828(ra) # 80002998 <_ZdlPv>
    80005664:	01813083          	ld	ra,24(sp)
    80005668:	01013403          	ld	s0,16(sp)
    8000566c:	00813483          	ld	s1,8(sp)
    80005670:	02010113          	addi	sp,sp,32
    80005674:	00008067          	ret

0000000080005678 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    80005678:	ff010113          	addi	sp,sp,-16
    8000567c:	00113423          	sd	ra,8(sp)
    80005680:	00813023          	sd	s0,0(sp)
    80005684:	01010413          	addi	s0,sp,16
    80005688:	00005797          	auipc	a5,0x5
    8000568c:	ec878793          	addi	a5,a5,-312 # 8000a550 <_ZTV7WorkerC+0x10>
    80005690:	00f53023          	sd	a5,0(a0)
    80005694:	ffffd097          	auipc	ra,0xffffd
    80005698:	32c080e7          	jalr	812(ra) # 800029c0 <_ZN6ThreadD1Ev>
    8000569c:	00813083          	ld	ra,8(sp)
    800056a0:	00013403          	ld	s0,0(sp)
    800056a4:	01010113          	addi	sp,sp,16
    800056a8:	00008067          	ret

00000000800056ac <_ZN7WorkerCD0Ev>:
    800056ac:	fe010113          	addi	sp,sp,-32
    800056b0:	00113c23          	sd	ra,24(sp)
    800056b4:	00813823          	sd	s0,16(sp)
    800056b8:	00913423          	sd	s1,8(sp)
    800056bc:	02010413          	addi	s0,sp,32
    800056c0:	00050493          	mv	s1,a0
    800056c4:	00005797          	auipc	a5,0x5
    800056c8:	e8c78793          	addi	a5,a5,-372 # 8000a550 <_ZTV7WorkerC+0x10>
    800056cc:	00f53023          	sd	a5,0(a0)
    800056d0:	ffffd097          	auipc	ra,0xffffd
    800056d4:	2f0080e7          	jalr	752(ra) # 800029c0 <_ZN6ThreadD1Ev>
    800056d8:	00048513          	mv	a0,s1
    800056dc:	ffffd097          	auipc	ra,0xffffd
    800056e0:	2bc080e7          	jalr	700(ra) # 80002998 <_ZdlPv>
    800056e4:	01813083          	ld	ra,24(sp)
    800056e8:	01013403          	ld	s0,16(sp)
    800056ec:	00813483          	ld	s1,8(sp)
    800056f0:	02010113          	addi	sp,sp,32
    800056f4:	00008067          	ret

00000000800056f8 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    800056f8:	ff010113          	addi	sp,sp,-16
    800056fc:	00113423          	sd	ra,8(sp)
    80005700:	00813023          	sd	s0,0(sp)
    80005704:	01010413          	addi	s0,sp,16
    80005708:	00005797          	auipc	a5,0x5
    8000570c:	e7078793          	addi	a5,a5,-400 # 8000a578 <_ZTV7WorkerD+0x10>
    80005710:	00f53023          	sd	a5,0(a0)
    80005714:	ffffd097          	auipc	ra,0xffffd
    80005718:	2ac080e7          	jalr	684(ra) # 800029c0 <_ZN6ThreadD1Ev>
    8000571c:	00813083          	ld	ra,8(sp)
    80005720:	00013403          	ld	s0,0(sp)
    80005724:	01010113          	addi	sp,sp,16
    80005728:	00008067          	ret

000000008000572c <_ZN7WorkerDD0Ev>:
    8000572c:	fe010113          	addi	sp,sp,-32
    80005730:	00113c23          	sd	ra,24(sp)
    80005734:	00813823          	sd	s0,16(sp)
    80005738:	00913423          	sd	s1,8(sp)
    8000573c:	02010413          	addi	s0,sp,32
    80005740:	00050493          	mv	s1,a0
    80005744:	00005797          	auipc	a5,0x5
    80005748:	e3478793          	addi	a5,a5,-460 # 8000a578 <_ZTV7WorkerD+0x10>
    8000574c:	00f53023          	sd	a5,0(a0)
    80005750:	ffffd097          	auipc	ra,0xffffd
    80005754:	270080e7          	jalr	624(ra) # 800029c0 <_ZN6ThreadD1Ev>
    80005758:	00048513          	mv	a0,s1
    8000575c:	ffffd097          	auipc	ra,0xffffd
    80005760:	23c080e7          	jalr	572(ra) # 80002998 <_ZdlPv>
    80005764:	01813083          	ld	ra,24(sp)
    80005768:	01013403          	ld	s0,16(sp)
    8000576c:	00813483          	ld	s1,8(sp)
    80005770:	02010113          	addi	sp,sp,32
    80005774:	00008067          	ret

0000000080005778 <_ZN16ProducerConsumer14produceWrapperEPv>:
        }

        printString("Consumer finished\n");
    }

    static void produceWrapper(void *obj) {
    80005778:	fe010113          	addi	sp,sp,-32
    8000577c:	00113c23          	sd	ra,24(sp)
    80005780:	00813823          	sd	s0,16(sp)
    80005784:	00913423          	sd	s1,8(sp)
    80005788:	01213023          	sd	s2,0(sp)
    8000578c:	02010413          	addi	s0,sp,32
    80005790:	00050493          	mv	s1,a0
        for (int i = 1; i <= 150; i++) {
    80005794:	00100913          	li	s2,1
    80005798:	09600793          	li	a5,150
    8000579c:	0327c863          	blt	a5,s2,800057cc <_ZN16ProducerConsumer14produceWrapperEPv+0x54>
            sem_wait(semProducer);
    800057a0:	0004b503          	ld	a0,0(s1)
    800057a4:	ffffd097          	auipc	ra,0xffffd
    800057a8:	078080e7          	jalr	120(ra) # 8000281c <_Z8sem_waitP4_sem>
            value++;
    800057ac:	0104a783          	lw	a5,16(s1)
    800057b0:	0017879b          	addiw	a5,a5,1
    800057b4:	00f4a823          	sw	a5,16(s1)
            sem_signal(semConsumer);
    800057b8:	0084b503          	ld	a0,8(s1)
    800057bc:	ffffd097          	auipc	ra,0xffffd
    800057c0:	094080e7          	jalr	148(ra) # 80002850 <_Z10sem_signalP4_sem>
        for (int i = 1; i <= 150; i++) {
    800057c4:	0019091b          	addiw	s2,s2,1
    800057c8:	fd1ff06f          	j	80005798 <_ZN16ProducerConsumer14produceWrapperEPv+0x20>
        int a = sem_close(semProducer);
    800057cc:	0004b503          	ld	a0,0(s1)
    800057d0:	ffffd097          	auipc	ra,0xffffd
    800057d4:	ff0080e7          	jalr	-16(ra) # 800027c0 <_Z9sem_closeP4_sem>
    800057d8:	00050913          	mv	s2,a0
        int b = sem_close(semConsumer);
    800057dc:	0084b503          	ld	a0,8(s1)
    800057e0:	ffffd097          	auipc	ra,0xffffd
    800057e4:	fe0080e7          	jalr	-32(ra) # 800027c0 <_Z9sem_closeP4_sem>
    800057e8:	00050493          	mv	s1,a0
        printString("Producer finished with exit values: ");
    800057ec:	00003517          	auipc	a0,0x3
    800057f0:	c3c50513          	addi	a0,a0,-964 # 80008428 <_ZZ14kprintUnsignedmE6digits+0x238>
    800057f4:	fffff097          	auipc	ra,0xfffff
    800057f8:	cc0080e7          	jalr	-832(ra) # 800044b4 <_Z11printStringPKc>
        printInt(a);
    800057fc:	00000613          	li	a2,0
    80005800:	00a00593          	li	a1,10
    80005804:	00090513          	mv	a0,s2
    80005808:	fffff097          	auipc	ra,0xfffff
    8000580c:	b98080e7          	jalr	-1128(ra) # 800043a0 <_ZL8printIntiii>
        printString(" and ");
    80005810:	00003517          	auipc	a0,0x3
    80005814:	c4050513          	addi	a0,a0,-960 # 80008450 <_ZZ14kprintUnsignedmE6digits+0x260>
    80005818:	fffff097          	auipc	ra,0xfffff
    8000581c:	c9c080e7          	jalr	-868(ra) # 800044b4 <_Z11printStringPKc>
        printInt(b);
    80005820:	00000613          	li	a2,0
    80005824:	00a00593          	li	a1,10
    80005828:	00048513          	mv	a0,s1
    8000582c:	fffff097          	auipc	ra,0xfffff
    80005830:	b74080e7          	jalr	-1164(ra) # 800043a0 <_ZL8printIntiii>
        printString("\n");
    80005834:	00003517          	auipc	a0,0x3
    80005838:	95450513          	addi	a0,a0,-1708 # 80008188 <CONSOLE_STATUS+0x178>
    8000583c:	fffff097          	auipc	ra,0xfffff
    80005840:	c78080e7          	jalr	-904(ra) # 800044b4 <_Z11printStringPKc>
        ProducerConsumer *pc = (ProducerConsumer *) obj;
        pc->produce();
    }
    80005844:	01813083          	ld	ra,24(sp)
    80005848:	01013403          	ld	s0,16(sp)
    8000584c:	00813483          	ld	s1,8(sp)
    80005850:	00013903          	ld	s2,0(sp)
    80005854:	02010113          	addi	sp,sp,32
    80005858:	00008067          	ret

000000008000585c <_ZN16ProducerConsumer14consumeWrapperEPv>:

    static void consumeWrapper(void *obj) {
    8000585c:	fe010113          	addi	sp,sp,-32
    80005860:	00113c23          	sd	ra,24(sp)
    80005864:	00813823          	sd	s0,16(sp)
    80005868:	00913423          	sd	s1,8(sp)
    8000586c:	01213023          	sd	s2,0(sp)
    80005870:	02010413          	addi	s0,sp,32
    80005874:	00050493          	mv	s1,a0
        for (int i = 1; i <= 50; i++) {
    80005878:	00100913          	li	s2,1
    8000587c:	03200793          	li	a5,50
    80005880:	0727c863          	blt	a5,s2,800058f0 <_ZN16ProducerConsumer14consumeWrapperEPv+0x94>
            sem_wait(semConsumer);
    80005884:	0084b503          	ld	a0,8(s1)
    80005888:	ffffd097          	auipc	ra,0xffffd
    8000588c:	f94080e7          	jalr	-108(ra) # 8000281c <_Z8sem_waitP4_sem>
            printInt(value);
    80005890:	00000613          	li	a2,0
    80005894:	00a00593          	li	a1,10
    80005898:	0104a503          	lw	a0,16(s1)
    8000589c:	fffff097          	auipc	ra,0xfffff
    800058a0:	b04080e7          	jalr	-1276(ra) # 800043a0 <_ZL8printIntiii>
            printString(" squared is: ");
    800058a4:	00003517          	auipc	a0,0x3
    800058a8:	bb450513          	addi	a0,a0,-1100 # 80008458 <_ZZ14kprintUnsignedmE6digits+0x268>
    800058ac:	fffff097          	auipc	ra,0xfffff
    800058b0:	c08080e7          	jalr	-1016(ra) # 800044b4 <_Z11printStringPKc>
            printInt(value * value);
    800058b4:	0104a503          	lw	a0,16(s1)
    800058b8:	00000613          	li	a2,0
    800058bc:	00a00593          	li	a1,10
    800058c0:	02a5053b          	mulw	a0,a0,a0
    800058c4:	fffff097          	auipc	ra,0xfffff
    800058c8:	adc080e7          	jalr	-1316(ra) # 800043a0 <_ZL8printIntiii>
            printString("\n");
    800058cc:	00003517          	auipc	a0,0x3
    800058d0:	8bc50513          	addi	a0,a0,-1860 # 80008188 <CONSOLE_STATUS+0x178>
    800058d4:	fffff097          	auipc	ra,0xfffff
    800058d8:	be0080e7          	jalr	-1056(ra) # 800044b4 <_Z11printStringPKc>
            sem_signal(semProducer);
    800058dc:	0004b503          	ld	a0,0(s1)
    800058e0:	ffffd097          	auipc	ra,0xffffd
    800058e4:	f70080e7          	jalr	-144(ra) # 80002850 <_Z10sem_signalP4_sem>
        for (int i = 1; i <= 50; i++) {
    800058e8:	0019091b          	addiw	s2,s2,1
    800058ec:	f91ff06f          	j	8000587c <_ZN16ProducerConsumer14consumeWrapperEPv+0x20>
        printString("Consumer finished\n");
    800058f0:	00003517          	auipc	a0,0x3
    800058f4:	b7850513          	addi	a0,a0,-1160 # 80008468 <_ZZ14kprintUnsignedmE6digits+0x278>
    800058f8:	fffff097          	auipc	ra,0xfffff
    800058fc:	bbc080e7          	jalr	-1092(ra) # 800044b4 <_Z11printStringPKc>
        ProducerConsumer *pc = (ProducerConsumer *) obj;
        pc->consume();
    }
    80005900:	01813083          	ld	ra,24(sp)
    80005904:	01013403          	ld	s0,16(sp)
    80005908:	00813483          	ld	s1,8(sp)
    8000590c:	00013903          	ld	s2,0(sp)
    80005910:	02010113          	addi	sp,sp,32
    80005914:	00008067          	ret

0000000080005918 <_ZN7WorkerA3runEv>:
    void run() override {
    80005918:	ff010113          	addi	sp,sp,-16
    8000591c:	00113423          	sd	ra,8(sp)
    80005920:	00813023          	sd	s0,0(sp)
    80005924:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    80005928:	00000593          	li	a1,0
    8000592c:	fffff097          	auipc	ra,0xfffff
    80005930:	fa0080e7          	jalr	-96(ra) # 800048cc <_ZN7WorkerA11workerBodyAEPv>
    }
    80005934:	00813083          	ld	ra,8(sp)
    80005938:	00013403          	ld	s0,0(sp)
    8000593c:	01010113          	addi	sp,sp,16
    80005940:	00008067          	ret

0000000080005944 <_ZN7WorkerB3runEv>:
    void run() override {
    80005944:	ff010113          	addi	sp,sp,-16
    80005948:	00113423          	sd	ra,8(sp)
    8000594c:	00813023          	sd	s0,0(sp)
    80005950:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    80005954:	00000593          	li	a1,0
    80005958:	fffff097          	auipc	ra,0xfffff
    8000595c:	040080e7          	jalr	64(ra) # 80004998 <_ZN7WorkerB11workerBodyBEPv>
    }
    80005960:	00813083          	ld	ra,8(sp)
    80005964:	00013403          	ld	s0,0(sp)
    80005968:	01010113          	addi	sp,sp,16
    8000596c:	00008067          	ret

0000000080005970 <_ZN7WorkerC3runEv>:
    void run() override {
    80005970:	ff010113          	addi	sp,sp,-16
    80005974:	00113423          	sd	ra,8(sp)
    80005978:	00813023          	sd	s0,0(sp)
    8000597c:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    80005980:	00000593          	li	a1,0
    80005984:	fffff097          	auipc	ra,0xfffff
    80005988:	0e8080e7          	jalr	232(ra) # 80004a6c <_ZN7WorkerC11workerBodyCEPv>
    }
    8000598c:	00813083          	ld	ra,8(sp)
    80005990:	00013403          	ld	s0,0(sp)
    80005994:	01010113          	addi	sp,sp,16
    80005998:	00008067          	ret

000000008000599c <_ZN7WorkerD3runEv>:
    void run() override {
    8000599c:	ff010113          	addi	sp,sp,-16
    800059a0:	00113423          	sd	ra,8(sp)
    800059a4:	00813023          	sd	s0,0(sp)
    800059a8:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    800059ac:	00000593          	li	a1,0
    800059b0:	fffff097          	auipc	ra,0xfffff
    800059b4:	23c080e7          	jalr	572(ra) # 80004bec <_ZN7WorkerD11workerBodyDEPv>
    }
    800059b8:	00813083          	ld	ra,8(sp)
    800059bc:	00013403          	ld	s0,0(sp)
    800059c0:	01010113          	addi	sp,sp,16
    800059c4:	00008067          	ret

00000000800059c8 <start>:
    800059c8:	ff010113          	addi	sp,sp,-16
    800059cc:	00813423          	sd	s0,8(sp)
    800059d0:	01010413          	addi	s0,sp,16
    800059d4:	300027f3          	csrr	a5,mstatus
    800059d8:	ffffe737          	lui	a4,0xffffe
    800059dc:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff2f2f>
    800059e0:	00e7f7b3          	and	a5,a5,a4
    800059e4:	00001737          	lui	a4,0x1
    800059e8:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    800059ec:	00e7e7b3          	or	a5,a5,a4
    800059f0:	30079073          	csrw	mstatus,a5
    800059f4:	00000797          	auipc	a5,0x0
    800059f8:	16078793          	addi	a5,a5,352 # 80005b54 <system_main>
    800059fc:	34179073          	csrw	mepc,a5
    80005a00:	00000793          	li	a5,0
    80005a04:	18079073          	csrw	satp,a5
    80005a08:	000107b7          	lui	a5,0x10
    80005a0c:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80005a10:	30279073          	csrw	medeleg,a5
    80005a14:	30379073          	csrw	mideleg,a5
    80005a18:	104027f3          	csrr	a5,sie
    80005a1c:	2227e793          	ori	a5,a5,546
    80005a20:	10479073          	csrw	sie,a5
    80005a24:	fff00793          	li	a5,-1
    80005a28:	00a7d793          	srli	a5,a5,0xa
    80005a2c:	3b079073          	csrw	pmpaddr0,a5
    80005a30:	00f00793          	li	a5,15
    80005a34:	3a079073          	csrw	pmpcfg0,a5
    80005a38:	f14027f3          	csrr	a5,mhartid
    80005a3c:	0200c737          	lui	a4,0x200c
    80005a40:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80005a44:	0007869b          	sext.w	a3,a5
    80005a48:	00269713          	slli	a4,a3,0x2
    80005a4c:	000f4637          	lui	a2,0xf4
    80005a50:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80005a54:	00d70733          	add	a4,a4,a3
    80005a58:	0037979b          	slliw	a5,a5,0x3
    80005a5c:	020046b7          	lui	a3,0x2004
    80005a60:	00d787b3          	add	a5,a5,a3
    80005a64:	00c585b3          	add	a1,a1,a2
    80005a68:	00371693          	slli	a3,a4,0x3
    80005a6c:	00005717          	auipc	a4,0x5
    80005a70:	c0470713          	addi	a4,a4,-1020 # 8000a670 <timer_scratch>
    80005a74:	00b7b023          	sd	a1,0(a5)
    80005a78:	00d70733          	add	a4,a4,a3
    80005a7c:	00f73c23          	sd	a5,24(a4)
    80005a80:	02c73023          	sd	a2,32(a4)
    80005a84:	34071073          	csrw	mscratch,a4
    80005a88:	00000797          	auipc	a5,0x0
    80005a8c:	6e878793          	addi	a5,a5,1768 # 80006170 <timervec>
    80005a90:	30579073          	csrw	mtvec,a5
    80005a94:	300027f3          	csrr	a5,mstatus
    80005a98:	0087e793          	ori	a5,a5,8
    80005a9c:	30079073          	csrw	mstatus,a5
    80005aa0:	304027f3          	csrr	a5,mie
    80005aa4:	0807e793          	ori	a5,a5,128
    80005aa8:	30479073          	csrw	mie,a5
    80005aac:	f14027f3          	csrr	a5,mhartid
    80005ab0:	0007879b          	sext.w	a5,a5
    80005ab4:	00078213          	mv	tp,a5
    80005ab8:	30200073          	mret
    80005abc:	00813403          	ld	s0,8(sp)
    80005ac0:	01010113          	addi	sp,sp,16
    80005ac4:	00008067          	ret

0000000080005ac8 <timerinit>:
    80005ac8:	ff010113          	addi	sp,sp,-16
    80005acc:	00813423          	sd	s0,8(sp)
    80005ad0:	01010413          	addi	s0,sp,16
    80005ad4:	f14027f3          	csrr	a5,mhartid
    80005ad8:	0200c737          	lui	a4,0x200c
    80005adc:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80005ae0:	0007869b          	sext.w	a3,a5
    80005ae4:	00269713          	slli	a4,a3,0x2
    80005ae8:	000f4637          	lui	a2,0xf4
    80005aec:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80005af0:	00d70733          	add	a4,a4,a3
    80005af4:	0037979b          	slliw	a5,a5,0x3
    80005af8:	020046b7          	lui	a3,0x2004
    80005afc:	00d787b3          	add	a5,a5,a3
    80005b00:	00c585b3          	add	a1,a1,a2
    80005b04:	00371693          	slli	a3,a4,0x3
    80005b08:	00005717          	auipc	a4,0x5
    80005b0c:	b6870713          	addi	a4,a4,-1176 # 8000a670 <timer_scratch>
    80005b10:	00b7b023          	sd	a1,0(a5)
    80005b14:	00d70733          	add	a4,a4,a3
    80005b18:	00f73c23          	sd	a5,24(a4)
    80005b1c:	02c73023          	sd	a2,32(a4)
    80005b20:	34071073          	csrw	mscratch,a4
    80005b24:	00000797          	auipc	a5,0x0
    80005b28:	64c78793          	addi	a5,a5,1612 # 80006170 <timervec>
    80005b2c:	30579073          	csrw	mtvec,a5
    80005b30:	300027f3          	csrr	a5,mstatus
    80005b34:	0087e793          	ori	a5,a5,8
    80005b38:	30079073          	csrw	mstatus,a5
    80005b3c:	304027f3          	csrr	a5,mie
    80005b40:	0807e793          	ori	a5,a5,128
    80005b44:	30479073          	csrw	mie,a5
    80005b48:	00813403          	ld	s0,8(sp)
    80005b4c:	01010113          	addi	sp,sp,16
    80005b50:	00008067          	ret

0000000080005b54 <system_main>:
    80005b54:	fe010113          	addi	sp,sp,-32
    80005b58:	00813823          	sd	s0,16(sp)
    80005b5c:	00913423          	sd	s1,8(sp)
    80005b60:	00113c23          	sd	ra,24(sp)
    80005b64:	02010413          	addi	s0,sp,32
    80005b68:	00000097          	auipc	ra,0x0
    80005b6c:	0c4080e7          	jalr	196(ra) # 80005c2c <cpuid>
    80005b70:	00005497          	auipc	s1,0x5
    80005b74:	a8048493          	addi	s1,s1,-1408 # 8000a5f0 <started>
    80005b78:	02050263          	beqz	a0,80005b9c <system_main+0x48>
    80005b7c:	0004a783          	lw	a5,0(s1)
    80005b80:	0007879b          	sext.w	a5,a5
    80005b84:	fe078ce3          	beqz	a5,80005b7c <system_main+0x28>
    80005b88:	0ff0000f          	fence
    80005b8c:	00003517          	auipc	a0,0x3
    80005b90:	93c50513          	addi	a0,a0,-1732 # 800084c8 <_ZL6digits+0x48>
    80005b94:	00001097          	auipc	ra,0x1
    80005b98:	a78080e7          	jalr	-1416(ra) # 8000660c <panic>
    80005b9c:	00001097          	auipc	ra,0x1
    80005ba0:	9cc080e7          	jalr	-1588(ra) # 80006568 <consoleinit>
    80005ba4:	00001097          	auipc	ra,0x1
    80005ba8:	158080e7          	jalr	344(ra) # 80006cfc <printfinit>
    80005bac:	00002517          	auipc	a0,0x2
    80005bb0:	5dc50513          	addi	a0,a0,1500 # 80008188 <CONSOLE_STATUS+0x178>
    80005bb4:	00001097          	auipc	ra,0x1
    80005bb8:	ab4080e7          	jalr	-1356(ra) # 80006668 <__printf>
    80005bbc:	00003517          	auipc	a0,0x3
    80005bc0:	8dc50513          	addi	a0,a0,-1828 # 80008498 <_ZL6digits+0x18>
    80005bc4:	00001097          	auipc	ra,0x1
    80005bc8:	aa4080e7          	jalr	-1372(ra) # 80006668 <__printf>
    80005bcc:	00002517          	auipc	a0,0x2
    80005bd0:	5bc50513          	addi	a0,a0,1468 # 80008188 <CONSOLE_STATUS+0x178>
    80005bd4:	00001097          	auipc	ra,0x1
    80005bd8:	a94080e7          	jalr	-1388(ra) # 80006668 <__printf>
    80005bdc:	00001097          	auipc	ra,0x1
    80005be0:	4ac080e7          	jalr	1196(ra) # 80007088 <kinit>
    80005be4:	00000097          	auipc	ra,0x0
    80005be8:	148080e7          	jalr	328(ra) # 80005d2c <trapinit>
    80005bec:	00000097          	auipc	ra,0x0
    80005bf0:	16c080e7          	jalr	364(ra) # 80005d58 <trapinithart>
    80005bf4:	00000097          	auipc	ra,0x0
    80005bf8:	5bc080e7          	jalr	1468(ra) # 800061b0 <plicinit>
    80005bfc:	00000097          	auipc	ra,0x0
    80005c00:	5dc080e7          	jalr	1500(ra) # 800061d8 <plicinithart>
    80005c04:	00000097          	auipc	ra,0x0
    80005c08:	078080e7          	jalr	120(ra) # 80005c7c <userinit>
    80005c0c:	0ff0000f          	fence
    80005c10:	00100793          	li	a5,1
    80005c14:	00003517          	auipc	a0,0x3
    80005c18:	89c50513          	addi	a0,a0,-1892 # 800084b0 <_ZL6digits+0x30>
    80005c1c:	00f4a023          	sw	a5,0(s1)
    80005c20:	00001097          	auipc	ra,0x1
    80005c24:	a48080e7          	jalr	-1464(ra) # 80006668 <__printf>
    80005c28:	0000006f          	j	80005c28 <system_main+0xd4>

0000000080005c2c <cpuid>:
    80005c2c:	ff010113          	addi	sp,sp,-16
    80005c30:	00813423          	sd	s0,8(sp)
    80005c34:	01010413          	addi	s0,sp,16
    80005c38:	00020513          	mv	a0,tp
    80005c3c:	00813403          	ld	s0,8(sp)
    80005c40:	0005051b          	sext.w	a0,a0
    80005c44:	01010113          	addi	sp,sp,16
    80005c48:	00008067          	ret

0000000080005c4c <mycpu>:
    80005c4c:	ff010113          	addi	sp,sp,-16
    80005c50:	00813423          	sd	s0,8(sp)
    80005c54:	01010413          	addi	s0,sp,16
    80005c58:	00020793          	mv	a5,tp
    80005c5c:	00813403          	ld	s0,8(sp)
    80005c60:	0007879b          	sext.w	a5,a5
    80005c64:	00779793          	slli	a5,a5,0x7
    80005c68:	00006517          	auipc	a0,0x6
    80005c6c:	a3850513          	addi	a0,a0,-1480 # 8000b6a0 <cpus>
    80005c70:	00f50533          	add	a0,a0,a5
    80005c74:	01010113          	addi	sp,sp,16
    80005c78:	00008067          	ret

0000000080005c7c <userinit>:
    80005c7c:	ff010113          	addi	sp,sp,-16
    80005c80:	00813423          	sd	s0,8(sp)
    80005c84:	01010413          	addi	s0,sp,16
    80005c88:	00813403          	ld	s0,8(sp)
    80005c8c:	01010113          	addi	sp,sp,16
    80005c90:	ffffc317          	auipc	t1,0xffffc
    80005c94:	d3430067          	jr	-716(t1) # 800019c4 <main>

0000000080005c98 <either_copyout>:
    80005c98:	ff010113          	addi	sp,sp,-16
    80005c9c:	00813023          	sd	s0,0(sp)
    80005ca0:	00113423          	sd	ra,8(sp)
    80005ca4:	01010413          	addi	s0,sp,16
    80005ca8:	02051663          	bnez	a0,80005cd4 <either_copyout+0x3c>
    80005cac:	00058513          	mv	a0,a1
    80005cb0:	00060593          	mv	a1,a2
    80005cb4:	0006861b          	sext.w	a2,a3
    80005cb8:	00002097          	auipc	ra,0x2
    80005cbc:	c5c080e7          	jalr	-932(ra) # 80007914 <__memmove>
    80005cc0:	00813083          	ld	ra,8(sp)
    80005cc4:	00013403          	ld	s0,0(sp)
    80005cc8:	00000513          	li	a0,0
    80005ccc:	01010113          	addi	sp,sp,16
    80005cd0:	00008067          	ret
    80005cd4:	00003517          	auipc	a0,0x3
    80005cd8:	81c50513          	addi	a0,a0,-2020 # 800084f0 <_ZL6digits+0x70>
    80005cdc:	00001097          	auipc	ra,0x1
    80005ce0:	930080e7          	jalr	-1744(ra) # 8000660c <panic>

0000000080005ce4 <either_copyin>:
    80005ce4:	ff010113          	addi	sp,sp,-16
    80005ce8:	00813023          	sd	s0,0(sp)
    80005cec:	00113423          	sd	ra,8(sp)
    80005cf0:	01010413          	addi	s0,sp,16
    80005cf4:	02059463          	bnez	a1,80005d1c <either_copyin+0x38>
    80005cf8:	00060593          	mv	a1,a2
    80005cfc:	0006861b          	sext.w	a2,a3
    80005d00:	00002097          	auipc	ra,0x2
    80005d04:	c14080e7          	jalr	-1004(ra) # 80007914 <__memmove>
    80005d08:	00813083          	ld	ra,8(sp)
    80005d0c:	00013403          	ld	s0,0(sp)
    80005d10:	00000513          	li	a0,0
    80005d14:	01010113          	addi	sp,sp,16
    80005d18:	00008067          	ret
    80005d1c:	00002517          	auipc	a0,0x2
    80005d20:	7fc50513          	addi	a0,a0,2044 # 80008518 <_ZL6digits+0x98>
    80005d24:	00001097          	auipc	ra,0x1
    80005d28:	8e8080e7          	jalr	-1816(ra) # 8000660c <panic>

0000000080005d2c <trapinit>:
    80005d2c:	ff010113          	addi	sp,sp,-16
    80005d30:	00813423          	sd	s0,8(sp)
    80005d34:	01010413          	addi	s0,sp,16
    80005d38:	00813403          	ld	s0,8(sp)
    80005d3c:	00003597          	auipc	a1,0x3
    80005d40:	80458593          	addi	a1,a1,-2044 # 80008540 <_ZL6digits+0xc0>
    80005d44:	00006517          	auipc	a0,0x6
    80005d48:	9dc50513          	addi	a0,a0,-1572 # 8000b720 <tickslock>
    80005d4c:	01010113          	addi	sp,sp,16
    80005d50:	00001317          	auipc	t1,0x1
    80005d54:	5c830067          	jr	1480(t1) # 80007318 <initlock>

0000000080005d58 <trapinithart>:
    80005d58:	ff010113          	addi	sp,sp,-16
    80005d5c:	00813423          	sd	s0,8(sp)
    80005d60:	01010413          	addi	s0,sp,16
    80005d64:	00000797          	auipc	a5,0x0
    80005d68:	2fc78793          	addi	a5,a5,764 # 80006060 <kernelvec>
    80005d6c:	10579073          	csrw	stvec,a5
    80005d70:	00813403          	ld	s0,8(sp)
    80005d74:	01010113          	addi	sp,sp,16
    80005d78:	00008067          	ret

0000000080005d7c <usertrap>:
    80005d7c:	ff010113          	addi	sp,sp,-16
    80005d80:	00813423          	sd	s0,8(sp)
    80005d84:	01010413          	addi	s0,sp,16
    80005d88:	00813403          	ld	s0,8(sp)
    80005d8c:	01010113          	addi	sp,sp,16
    80005d90:	00008067          	ret

0000000080005d94 <usertrapret>:
    80005d94:	ff010113          	addi	sp,sp,-16
    80005d98:	00813423          	sd	s0,8(sp)
    80005d9c:	01010413          	addi	s0,sp,16
    80005da0:	00813403          	ld	s0,8(sp)
    80005da4:	01010113          	addi	sp,sp,16
    80005da8:	00008067          	ret

0000000080005dac <kerneltrap>:
    80005dac:	fe010113          	addi	sp,sp,-32
    80005db0:	00813823          	sd	s0,16(sp)
    80005db4:	00113c23          	sd	ra,24(sp)
    80005db8:	00913423          	sd	s1,8(sp)
    80005dbc:	02010413          	addi	s0,sp,32
    80005dc0:	142025f3          	csrr	a1,scause
    80005dc4:	100027f3          	csrr	a5,sstatus
    80005dc8:	0027f793          	andi	a5,a5,2
    80005dcc:	10079c63          	bnez	a5,80005ee4 <kerneltrap+0x138>
    80005dd0:	142027f3          	csrr	a5,scause
    80005dd4:	0207ce63          	bltz	a5,80005e10 <kerneltrap+0x64>
    80005dd8:	00002517          	auipc	a0,0x2
    80005ddc:	7b050513          	addi	a0,a0,1968 # 80008588 <_ZL6digits+0x108>
    80005de0:	00001097          	auipc	ra,0x1
    80005de4:	888080e7          	jalr	-1912(ra) # 80006668 <__printf>
    80005de8:	141025f3          	csrr	a1,sepc
    80005dec:	14302673          	csrr	a2,stval
    80005df0:	00002517          	auipc	a0,0x2
    80005df4:	7a850513          	addi	a0,a0,1960 # 80008598 <_ZL6digits+0x118>
    80005df8:	00001097          	auipc	ra,0x1
    80005dfc:	870080e7          	jalr	-1936(ra) # 80006668 <__printf>
    80005e00:	00002517          	auipc	a0,0x2
    80005e04:	7b050513          	addi	a0,a0,1968 # 800085b0 <_ZL6digits+0x130>
    80005e08:	00001097          	auipc	ra,0x1
    80005e0c:	804080e7          	jalr	-2044(ra) # 8000660c <panic>
    80005e10:	0ff7f713          	andi	a4,a5,255
    80005e14:	00900693          	li	a3,9
    80005e18:	04d70063          	beq	a4,a3,80005e58 <kerneltrap+0xac>
    80005e1c:	fff00713          	li	a4,-1
    80005e20:	03f71713          	slli	a4,a4,0x3f
    80005e24:	00170713          	addi	a4,a4,1
    80005e28:	fae798e3          	bne	a5,a4,80005dd8 <kerneltrap+0x2c>
    80005e2c:	00000097          	auipc	ra,0x0
    80005e30:	e00080e7          	jalr	-512(ra) # 80005c2c <cpuid>
    80005e34:	06050663          	beqz	a0,80005ea0 <kerneltrap+0xf4>
    80005e38:	144027f3          	csrr	a5,sip
    80005e3c:	ffd7f793          	andi	a5,a5,-3
    80005e40:	14479073          	csrw	sip,a5
    80005e44:	01813083          	ld	ra,24(sp)
    80005e48:	01013403          	ld	s0,16(sp)
    80005e4c:	00813483          	ld	s1,8(sp)
    80005e50:	02010113          	addi	sp,sp,32
    80005e54:	00008067          	ret
    80005e58:	00000097          	auipc	ra,0x0
    80005e5c:	3cc080e7          	jalr	972(ra) # 80006224 <plic_claim>
    80005e60:	00a00793          	li	a5,10
    80005e64:	00050493          	mv	s1,a0
    80005e68:	06f50863          	beq	a0,a5,80005ed8 <kerneltrap+0x12c>
    80005e6c:	fc050ce3          	beqz	a0,80005e44 <kerneltrap+0x98>
    80005e70:	00050593          	mv	a1,a0
    80005e74:	00002517          	auipc	a0,0x2
    80005e78:	6f450513          	addi	a0,a0,1780 # 80008568 <_ZL6digits+0xe8>
    80005e7c:	00000097          	auipc	ra,0x0
    80005e80:	7ec080e7          	jalr	2028(ra) # 80006668 <__printf>
    80005e84:	01013403          	ld	s0,16(sp)
    80005e88:	01813083          	ld	ra,24(sp)
    80005e8c:	00048513          	mv	a0,s1
    80005e90:	00813483          	ld	s1,8(sp)
    80005e94:	02010113          	addi	sp,sp,32
    80005e98:	00000317          	auipc	t1,0x0
    80005e9c:	3c430067          	jr	964(t1) # 8000625c <plic_complete>
    80005ea0:	00006517          	auipc	a0,0x6
    80005ea4:	88050513          	addi	a0,a0,-1920 # 8000b720 <tickslock>
    80005ea8:	00001097          	auipc	ra,0x1
    80005eac:	494080e7          	jalr	1172(ra) # 8000733c <acquire>
    80005eb0:	00004717          	auipc	a4,0x4
    80005eb4:	74470713          	addi	a4,a4,1860 # 8000a5f4 <ticks>
    80005eb8:	00072783          	lw	a5,0(a4)
    80005ebc:	00006517          	auipc	a0,0x6
    80005ec0:	86450513          	addi	a0,a0,-1948 # 8000b720 <tickslock>
    80005ec4:	0017879b          	addiw	a5,a5,1
    80005ec8:	00f72023          	sw	a5,0(a4)
    80005ecc:	00001097          	auipc	ra,0x1
    80005ed0:	53c080e7          	jalr	1340(ra) # 80007408 <release>
    80005ed4:	f65ff06f          	j	80005e38 <kerneltrap+0x8c>
    80005ed8:	00001097          	auipc	ra,0x1
    80005edc:	098080e7          	jalr	152(ra) # 80006f70 <uartintr>
    80005ee0:	fa5ff06f          	j	80005e84 <kerneltrap+0xd8>
    80005ee4:	00002517          	auipc	a0,0x2
    80005ee8:	66450513          	addi	a0,a0,1636 # 80008548 <_ZL6digits+0xc8>
    80005eec:	00000097          	auipc	ra,0x0
    80005ef0:	720080e7          	jalr	1824(ra) # 8000660c <panic>

0000000080005ef4 <clockintr>:
    80005ef4:	fe010113          	addi	sp,sp,-32
    80005ef8:	00813823          	sd	s0,16(sp)
    80005efc:	00913423          	sd	s1,8(sp)
    80005f00:	00113c23          	sd	ra,24(sp)
    80005f04:	02010413          	addi	s0,sp,32
    80005f08:	00006497          	auipc	s1,0x6
    80005f0c:	81848493          	addi	s1,s1,-2024 # 8000b720 <tickslock>
    80005f10:	00048513          	mv	a0,s1
    80005f14:	00001097          	auipc	ra,0x1
    80005f18:	428080e7          	jalr	1064(ra) # 8000733c <acquire>
    80005f1c:	00004717          	auipc	a4,0x4
    80005f20:	6d870713          	addi	a4,a4,1752 # 8000a5f4 <ticks>
    80005f24:	00072783          	lw	a5,0(a4)
    80005f28:	01013403          	ld	s0,16(sp)
    80005f2c:	01813083          	ld	ra,24(sp)
    80005f30:	00048513          	mv	a0,s1
    80005f34:	0017879b          	addiw	a5,a5,1
    80005f38:	00813483          	ld	s1,8(sp)
    80005f3c:	00f72023          	sw	a5,0(a4)
    80005f40:	02010113          	addi	sp,sp,32
    80005f44:	00001317          	auipc	t1,0x1
    80005f48:	4c430067          	jr	1220(t1) # 80007408 <release>

0000000080005f4c <devintr>:
    80005f4c:	142027f3          	csrr	a5,scause
    80005f50:	00000513          	li	a0,0
    80005f54:	0007c463          	bltz	a5,80005f5c <devintr+0x10>
    80005f58:	00008067          	ret
    80005f5c:	fe010113          	addi	sp,sp,-32
    80005f60:	00813823          	sd	s0,16(sp)
    80005f64:	00113c23          	sd	ra,24(sp)
    80005f68:	00913423          	sd	s1,8(sp)
    80005f6c:	02010413          	addi	s0,sp,32
    80005f70:	0ff7f713          	andi	a4,a5,255
    80005f74:	00900693          	li	a3,9
    80005f78:	04d70c63          	beq	a4,a3,80005fd0 <devintr+0x84>
    80005f7c:	fff00713          	li	a4,-1
    80005f80:	03f71713          	slli	a4,a4,0x3f
    80005f84:	00170713          	addi	a4,a4,1
    80005f88:	00e78c63          	beq	a5,a4,80005fa0 <devintr+0x54>
    80005f8c:	01813083          	ld	ra,24(sp)
    80005f90:	01013403          	ld	s0,16(sp)
    80005f94:	00813483          	ld	s1,8(sp)
    80005f98:	02010113          	addi	sp,sp,32
    80005f9c:	00008067          	ret
    80005fa0:	00000097          	auipc	ra,0x0
    80005fa4:	c8c080e7          	jalr	-884(ra) # 80005c2c <cpuid>
    80005fa8:	06050663          	beqz	a0,80006014 <devintr+0xc8>
    80005fac:	144027f3          	csrr	a5,sip
    80005fb0:	ffd7f793          	andi	a5,a5,-3
    80005fb4:	14479073          	csrw	sip,a5
    80005fb8:	01813083          	ld	ra,24(sp)
    80005fbc:	01013403          	ld	s0,16(sp)
    80005fc0:	00813483          	ld	s1,8(sp)
    80005fc4:	00200513          	li	a0,2
    80005fc8:	02010113          	addi	sp,sp,32
    80005fcc:	00008067          	ret
    80005fd0:	00000097          	auipc	ra,0x0
    80005fd4:	254080e7          	jalr	596(ra) # 80006224 <plic_claim>
    80005fd8:	00a00793          	li	a5,10
    80005fdc:	00050493          	mv	s1,a0
    80005fe0:	06f50663          	beq	a0,a5,8000604c <devintr+0x100>
    80005fe4:	00100513          	li	a0,1
    80005fe8:	fa0482e3          	beqz	s1,80005f8c <devintr+0x40>
    80005fec:	00048593          	mv	a1,s1
    80005ff0:	00002517          	auipc	a0,0x2
    80005ff4:	57850513          	addi	a0,a0,1400 # 80008568 <_ZL6digits+0xe8>
    80005ff8:	00000097          	auipc	ra,0x0
    80005ffc:	670080e7          	jalr	1648(ra) # 80006668 <__printf>
    80006000:	00048513          	mv	a0,s1
    80006004:	00000097          	auipc	ra,0x0
    80006008:	258080e7          	jalr	600(ra) # 8000625c <plic_complete>
    8000600c:	00100513          	li	a0,1
    80006010:	f7dff06f          	j	80005f8c <devintr+0x40>
    80006014:	00005517          	auipc	a0,0x5
    80006018:	70c50513          	addi	a0,a0,1804 # 8000b720 <tickslock>
    8000601c:	00001097          	auipc	ra,0x1
    80006020:	320080e7          	jalr	800(ra) # 8000733c <acquire>
    80006024:	00004717          	auipc	a4,0x4
    80006028:	5d070713          	addi	a4,a4,1488 # 8000a5f4 <ticks>
    8000602c:	00072783          	lw	a5,0(a4)
    80006030:	00005517          	auipc	a0,0x5
    80006034:	6f050513          	addi	a0,a0,1776 # 8000b720 <tickslock>
    80006038:	0017879b          	addiw	a5,a5,1
    8000603c:	00f72023          	sw	a5,0(a4)
    80006040:	00001097          	auipc	ra,0x1
    80006044:	3c8080e7          	jalr	968(ra) # 80007408 <release>
    80006048:	f65ff06f          	j	80005fac <devintr+0x60>
    8000604c:	00001097          	auipc	ra,0x1
    80006050:	f24080e7          	jalr	-220(ra) # 80006f70 <uartintr>
    80006054:	fadff06f          	j	80006000 <devintr+0xb4>
	...

0000000080006060 <kernelvec>:
    80006060:	f0010113          	addi	sp,sp,-256
    80006064:	00113023          	sd	ra,0(sp)
    80006068:	00213423          	sd	sp,8(sp)
    8000606c:	00313823          	sd	gp,16(sp)
    80006070:	00413c23          	sd	tp,24(sp)
    80006074:	02513023          	sd	t0,32(sp)
    80006078:	02613423          	sd	t1,40(sp)
    8000607c:	02713823          	sd	t2,48(sp)
    80006080:	02813c23          	sd	s0,56(sp)
    80006084:	04913023          	sd	s1,64(sp)
    80006088:	04a13423          	sd	a0,72(sp)
    8000608c:	04b13823          	sd	a1,80(sp)
    80006090:	04c13c23          	sd	a2,88(sp)
    80006094:	06d13023          	sd	a3,96(sp)
    80006098:	06e13423          	sd	a4,104(sp)
    8000609c:	06f13823          	sd	a5,112(sp)
    800060a0:	07013c23          	sd	a6,120(sp)
    800060a4:	09113023          	sd	a7,128(sp)
    800060a8:	09213423          	sd	s2,136(sp)
    800060ac:	09313823          	sd	s3,144(sp)
    800060b0:	09413c23          	sd	s4,152(sp)
    800060b4:	0b513023          	sd	s5,160(sp)
    800060b8:	0b613423          	sd	s6,168(sp)
    800060bc:	0b713823          	sd	s7,176(sp)
    800060c0:	0b813c23          	sd	s8,184(sp)
    800060c4:	0d913023          	sd	s9,192(sp)
    800060c8:	0da13423          	sd	s10,200(sp)
    800060cc:	0db13823          	sd	s11,208(sp)
    800060d0:	0dc13c23          	sd	t3,216(sp)
    800060d4:	0fd13023          	sd	t4,224(sp)
    800060d8:	0fe13423          	sd	t5,232(sp)
    800060dc:	0ff13823          	sd	t6,240(sp)
    800060e0:	ccdff0ef          	jal	ra,80005dac <kerneltrap>
    800060e4:	00013083          	ld	ra,0(sp)
    800060e8:	00813103          	ld	sp,8(sp)
    800060ec:	01013183          	ld	gp,16(sp)
    800060f0:	02013283          	ld	t0,32(sp)
    800060f4:	02813303          	ld	t1,40(sp)
    800060f8:	03013383          	ld	t2,48(sp)
    800060fc:	03813403          	ld	s0,56(sp)
    80006100:	04013483          	ld	s1,64(sp)
    80006104:	04813503          	ld	a0,72(sp)
    80006108:	05013583          	ld	a1,80(sp)
    8000610c:	05813603          	ld	a2,88(sp)
    80006110:	06013683          	ld	a3,96(sp)
    80006114:	06813703          	ld	a4,104(sp)
    80006118:	07013783          	ld	a5,112(sp)
    8000611c:	07813803          	ld	a6,120(sp)
    80006120:	08013883          	ld	a7,128(sp)
    80006124:	08813903          	ld	s2,136(sp)
    80006128:	09013983          	ld	s3,144(sp)
    8000612c:	09813a03          	ld	s4,152(sp)
    80006130:	0a013a83          	ld	s5,160(sp)
    80006134:	0a813b03          	ld	s6,168(sp)
    80006138:	0b013b83          	ld	s7,176(sp)
    8000613c:	0b813c03          	ld	s8,184(sp)
    80006140:	0c013c83          	ld	s9,192(sp)
    80006144:	0c813d03          	ld	s10,200(sp)
    80006148:	0d013d83          	ld	s11,208(sp)
    8000614c:	0d813e03          	ld	t3,216(sp)
    80006150:	0e013e83          	ld	t4,224(sp)
    80006154:	0e813f03          	ld	t5,232(sp)
    80006158:	0f013f83          	ld	t6,240(sp)
    8000615c:	10010113          	addi	sp,sp,256
    80006160:	10200073          	sret
    80006164:	00000013          	nop
    80006168:	00000013          	nop
    8000616c:	00000013          	nop

0000000080006170 <timervec>:
    80006170:	34051573          	csrrw	a0,mscratch,a0
    80006174:	00b53023          	sd	a1,0(a0)
    80006178:	00c53423          	sd	a2,8(a0)
    8000617c:	00d53823          	sd	a3,16(a0)
    80006180:	01853583          	ld	a1,24(a0)
    80006184:	02053603          	ld	a2,32(a0)
    80006188:	0005b683          	ld	a3,0(a1)
    8000618c:	00c686b3          	add	a3,a3,a2
    80006190:	00d5b023          	sd	a3,0(a1)
    80006194:	00200593          	li	a1,2
    80006198:	14459073          	csrw	sip,a1
    8000619c:	01053683          	ld	a3,16(a0)
    800061a0:	00853603          	ld	a2,8(a0)
    800061a4:	00053583          	ld	a1,0(a0)
    800061a8:	34051573          	csrrw	a0,mscratch,a0
    800061ac:	30200073          	mret

00000000800061b0 <plicinit>:
    800061b0:	ff010113          	addi	sp,sp,-16
    800061b4:	00813423          	sd	s0,8(sp)
    800061b8:	01010413          	addi	s0,sp,16
    800061bc:	00813403          	ld	s0,8(sp)
    800061c0:	0c0007b7          	lui	a5,0xc000
    800061c4:	00100713          	li	a4,1
    800061c8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    800061cc:	00e7a223          	sw	a4,4(a5)
    800061d0:	01010113          	addi	sp,sp,16
    800061d4:	00008067          	ret

00000000800061d8 <plicinithart>:
    800061d8:	ff010113          	addi	sp,sp,-16
    800061dc:	00813023          	sd	s0,0(sp)
    800061e0:	00113423          	sd	ra,8(sp)
    800061e4:	01010413          	addi	s0,sp,16
    800061e8:	00000097          	auipc	ra,0x0
    800061ec:	a44080e7          	jalr	-1468(ra) # 80005c2c <cpuid>
    800061f0:	0085171b          	slliw	a4,a0,0x8
    800061f4:	0c0027b7          	lui	a5,0xc002
    800061f8:	00e787b3          	add	a5,a5,a4
    800061fc:	40200713          	li	a4,1026
    80006200:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80006204:	00813083          	ld	ra,8(sp)
    80006208:	00013403          	ld	s0,0(sp)
    8000620c:	00d5151b          	slliw	a0,a0,0xd
    80006210:	0c2017b7          	lui	a5,0xc201
    80006214:	00a78533          	add	a0,a5,a0
    80006218:	00052023          	sw	zero,0(a0)
    8000621c:	01010113          	addi	sp,sp,16
    80006220:	00008067          	ret

0000000080006224 <plic_claim>:
    80006224:	ff010113          	addi	sp,sp,-16
    80006228:	00813023          	sd	s0,0(sp)
    8000622c:	00113423          	sd	ra,8(sp)
    80006230:	01010413          	addi	s0,sp,16
    80006234:	00000097          	auipc	ra,0x0
    80006238:	9f8080e7          	jalr	-1544(ra) # 80005c2c <cpuid>
    8000623c:	00813083          	ld	ra,8(sp)
    80006240:	00013403          	ld	s0,0(sp)
    80006244:	00d5151b          	slliw	a0,a0,0xd
    80006248:	0c2017b7          	lui	a5,0xc201
    8000624c:	00a78533          	add	a0,a5,a0
    80006250:	00452503          	lw	a0,4(a0)
    80006254:	01010113          	addi	sp,sp,16
    80006258:	00008067          	ret

000000008000625c <plic_complete>:
    8000625c:	fe010113          	addi	sp,sp,-32
    80006260:	00813823          	sd	s0,16(sp)
    80006264:	00913423          	sd	s1,8(sp)
    80006268:	00113c23          	sd	ra,24(sp)
    8000626c:	02010413          	addi	s0,sp,32
    80006270:	00050493          	mv	s1,a0
    80006274:	00000097          	auipc	ra,0x0
    80006278:	9b8080e7          	jalr	-1608(ra) # 80005c2c <cpuid>
    8000627c:	01813083          	ld	ra,24(sp)
    80006280:	01013403          	ld	s0,16(sp)
    80006284:	00d5179b          	slliw	a5,a0,0xd
    80006288:	0c201737          	lui	a4,0xc201
    8000628c:	00f707b3          	add	a5,a4,a5
    80006290:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80006294:	00813483          	ld	s1,8(sp)
    80006298:	02010113          	addi	sp,sp,32
    8000629c:	00008067          	ret

00000000800062a0 <consolewrite>:
    800062a0:	fb010113          	addi	sp,sp,-80
    800062a4:	04813023          	sd	s0,64(sp)
    800062a8:	04113423          	sd	ra,72(sp)
    800062ac:	02913c23          	sd	s1,56(sp)
    800062b0:	03213823          	sd	s2,48(sp)
    800062b4:	03313423          	sd	s3,40(sp)
    800062b8:	03413023          	sd	s4,32(sp)
    800062bc:	01513c23          	sd	s5,24(sp)
    800062c0:	05010413          	addi	s0,sp,80
    800062c4:	06c05c63          	blez	a2,8000633c <consolewrite+0x9c>
    800062c8:	00060993          	mv	s3,a2
    800062cc:	00050a13          	mv	s4,a0
    800062d0:	00058493          	mv	s1,a1
    800062d4:	00000913          	li	s2,0
    800062d8:	fff00a93          	li	s5,-1
    800062dc:	01c0006f          	j	800062f8 <consolewrite+0x58>
    800062e0:	fbf44503          	lbu	a0,-65(s0)
    800062e4:	0019091b          	addiw	s2,s2,1
    800062e8:	00148493          	addi	s1,s1,1
    800062ec:	00001097          	auipc	ra,0x1
    800062f0:	a9c080e7          	jalr	-1380(ra) # 80006d88 <uartputc>
    800062f4:	03298063          	beq	s3,s2,80006314 <consolewrite+0x74>
    800062f8:	00048613          	mv	a2,s1
    800062fc:	00100693          	li	a3,1
    80006300:	000a0593          	mv	a1,s4
    80006304:	fbf40513          	addi	a0,s0,-65
    80006308:	00000097          	auipc	ra,0x0
    8000630c:	9dc080e7          	jalr	-1572(ra) # 80005ce4 <either_copyin>
    80006310:	fd5518e3          	bne	a0,s5,800062e0 <consolewrite+0x40>
    80006314:	04813083          	ld	ra,72(sp)
    80006318:	04013403          	ld	s0,64(sp)
    8000631c:	03813483          	ld	s1,56(sp)
    80006320:	02813983          	ld	s3,40(sp)
    80006324:	02013a03          	ld	s4,32(sp)
    80006328:	01813a83          	ld	s5,24(sp)
    8000632c:	00090513          	mv	a0,s2
    80006330:	03013903          	ld	s2,48(sp)
    80006334:	05010113          	addi	sp,sp,80
    80006338:	00008067          	ret
    8000633c:	00000913          	li	s2,0
    80006340:	fd5ff06f          	j	80006314 <consolewrite+0x74>

0000000080006344 <consoleread>:
    80006344:	f9010113          	addi	sp,sp,-112
    80006348:	06813023          	sd	s0,96(sp)
    8000634c:	04913c23          	sd	s1,88(sp)
    80006350:	05213823          	sd	s2,80(sp)
    80006354:	05313423          	sd	s3,72(sp)
    80006358:	05413023          	sd	s4,64(sp)
    8000635c:	03513c23          	sd	s5,56(sp)
    80006360:	03613823          	sd	s6,48(sp)
    80006364:	03713423          	sd	s7,40(sp)
    80006368:	03813023          	sd	s8,32(sp)
    8000636c:	06113423          	sd	ra,104(sp)
    80006370:	01913c23          	sd	s9,24(sp)
    80006374:	07010413          	addi	s0,sp,112
    80006378:	00060b93          	mv	s7,a2
    8000637c:	00050913          	mv	s2,a0
    80006380:	00058c13          	mv	s8,a1
    80006384:	00060b1b          	sext.w	s6,a2
    80006388:	00005497          	auipc	s1,0x5
    8000638c:	3c048493          	addi	s1,s1,960 # 8000b748 <cons>
    80006390:	00400993          	li	s3,4
    80006394:	fff00a13          	li	s4,-1
    80006398:	00a00a93          	li	s5,10
    8000639c:	05705e63          	blez	s7,800063f8 <consoleread+0xb4>
    800063a0:	09c4a703          	lw	a4,156(s1)
    800063a4:	0984a783          	lw	a5,152(s1)
    800063a8:	0007071b          	sext.w	a4,a4
    800063ac:	08e78463          	beq	a5,a4,80006434 <consoleread+0xf0>
    800063b0:	07f7f713          	andi	a4,a5,127
    800063b4:	00e48733          	add	a4,s1,a4
    800063b8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    800063bc:	0017869b          	addiw	a3,a5,1
    800063c0:	08d4ac23          	sw	a3,152(s1)
    800063c4:	00070c9b          	sext.w	s9,a4
    800063c8:	0b370663          	beq	a4,s3,80006474 <consoleread+0x130>
    800063cc:	00100693          	li	a3,1
    800063d0:	f9f40613          	addi	a2,s0,-97
    800063d4:	000c0593          	mv	a1,s8
    800063d8:	00090513          	mv	a0,s2
    800063dc:	f8e40fa3          	sb	a4,-97(s0)
    800063e0:	00000097          	auipc	ra,0x0
    800063e4:	8b8080e7          	jalr	-1864(ra) # 80005c98 <either_copyout>
    800063e8:	01450863          	beq	a0,s4,800063f8 <consoleread+0xb4>
    800063ec:	001c0c13          	addi	s8,s8,1
    800063f0:	fffb8b9b          	addiw	s7,s7,-1
    800063f4:	fb5c94e3          	bne	s9,s5,8000639c <consoleread+0x58>
    800063f8:	000b851b          	sext.w	a0,s7
    800063fc:	06813083          	ld	ra,104(sp)
    80006400:	06013403          	ld	s0,96(sp)
    80006404:	05813483          	ld	s1,88(sp)
    80006408:	05013903          	ld	s2,80(sp)
    8000640c:	04813983          	ld	s3,72(sp)
    80006410:	04013a03          	ld	s4,64(sp)
    80006414:	03813a83          	ld	s5,56(sp)
    80006418:	02813b83          	ld	s7,40(sp)
    8000641c:	02013c03          	ld	s8,32(sp)
    80006420:	01813c83          	ld	s9,24(sp)
    80006424:	40ab053b          	subw	a0,s6,a0
    80006428:	03013b03          	ld	s6,48(sp)
    8000642c:	07010113          	addi	sp,sp,112
    80006430:	00008067          	ret
    80006434:	00001097          	auipc	ra,0x1
    80006438:	1d8080e7          	jalr	472(ra) # 8000760c <push_on>
    8000643c:	0984a703          	lw	a4,152(s1)
    80006440:	09c4a783          	lw	a5,156(s1)
    80006444:	0007879b          	sext.w	a5,a5
    80006448:	fef70ce3          	beq	a4,a5,80006440 <consoleread+0xfc>
    8000644c:	00001097          	auipc	ra,0x1
    80006450:	234080e7          	jalr	564(ra) # 80007680 <pop_on>
    80006454:	0984a783          	lw	a5,152(s1)
    80006458:	07f7f713          	andi	a4,a5,127
    8000645c:	00e48733          	add	a4,s1,a4
    80006460:	01874703          	lbu	a4,24(a4)
    80006464:	0017869b          	addiw	a3,a5,1
    80006468:	08d4ac23          	sw	a3,152(s1)
    8000646c:	00070c9b          	sext.w	s9,a4
    80006470:	f5371ee3          	bne	a4,s3,800063cc <consoleread+0x88>
    80006474:	000b851b          	sext.w	a0,s7
    80006478:	f96bf2e3          	bgeu	s7,s6,800063fc <consoleread+0xb8>
    8000647c:	08f4ac23          	sw	a5,152(s1)
    80006480:	f7dff06f          	j	800063fc <consoleread+0xb8>

0000000080006484 <consputc>:
    80006484:	10000793          	li	a5,256
    80006488:	00f50663          	beq	a0,a5,80006494 <consputc+0x10>
    8000648c:	00001317          	auipc	t1,0x1
    80006490:	9f430067          	jr	-1548(t1) # 80006e80 <uartputc_sync>
    80006494:	ff010113          	addi	sp,sp,-16
    80006498:	00113423          	sd	ra,8(sp)
    8000649c:	00813023          	sd	s0,0(sp)
    800064a0:	01010413          	addi	s0,sp,16
    800064a4:	00800513          	li	a0,8
    800064a8:	00001097          	auipc	ra,0x1
    800064ac:	9d8080e7          	jalr	-1576(ra) # 80006e80 <uartputc_sync>
    800064b0:	02000513          	li	a0,32
    800064b4:	00001097          	auipc	ra,0x1
    800064b8:	9cc080e7          	jalr	-1588(ra) # 80006e80 <uartputc_sync>
    800064bc:	00013403          	ld	s0,0(sp)
    800064c0:	00813083          	ld	ra,8(sp)
    800064c4:	00800513          	li	a0,8
    800064c8:	01010113          	addi	sp,sp,16
    800064cc:	00001317          	auipc	t1,0x1
    800064d0:	9b430067          	jr	-1612(t1) # 80006e80 <uartputc_sync>

00000000800064d4 <consoleintr>:
    800064d4:	fe010113          	addi	sp,sp,-32
    800064d8:	00813823          	sd	s0,16(sp)
    800064dc:	00913423          	sd	s1,8(sp)
    800064e0:	01213023          	sd	s2,0(sp)
    800064e4:	00113c23          	sd	ra,24(sp)
    800064e8:	02010413          	addi	s0,sp,32
    800064ec:	00005917          	auipc	s2,0x5
    800064f0:	25c90913          	addi	s2,s2,604 # 8000b748 <cons>
    800064f4:	00050493          	mv	s1,a0
    800064f8:	00090513          	mv	a0,s2
    800064fc:	00001097          	auipc	ra,0x1
    80006500:	e40080e7          	jalr	-448(ra) # 8000733c <acquire>
    80006504:	02048c63          	beqz	s1,8000653c <consoleintr+0x68>
    80006508:	0a092783          	lw	a5,160(s2)
    8000650c:	09892703          	lw	a4,152(s2)
    80006510:	07f00693          	li	a3,127
    80006514:	40e7873b          	subw	a4,a5,a4
    80006518:	02e6e263          	bltu	a3,a4,8000653c <consoleintr+0x68>
    8000651c:	00d00713          	li	a4,13
    80006520:	04e48063          	beq	s1,a4,80006560 <consoleintr+0x8c>
    80006524:	07f7f713          	andi	a4,a5,127
    80006528:	00e90733          	add	a4,s2,a4
    8000652c:	0017879b          	addiw	a5,a5,1
    80006530:	0af92023          	sw	a5,160(s2)
    80006534:	00970c23          	sb	s1,24(a4)
    80006538:	08f92e23          	sw	a5,156(s2)
    8000653c:	01013403          	ld	s0,16(sp)
    80006540:	01813083          	ld	ra,24(sp)
    80006544:	00813483          	ld	s1,8(sp)
    80006548:	00013903          	ld	s2,0(sp)
    8000654c:	00005517          	auipc	a0,0x5
    80006550:	1fc50513          	addi	a0,a0,508 # 8000b748 <cons>
    80006554:	02010113          	addi	sp,sp,32
    80006558:	00001317          	auipc	t1,0x1
    8000655c:	eb030067          	jr	-336(t1) # 80007408 <release>
    80006560:	00a00493          	li	s1,10
    80006564:	fc1ff06f          	j	80006524 <consoleintr+0x50>

0000000080006568 <consoleinit>:
    80006568:	fe010113          	addi	sp,sp,-32
    8000656c:	00113c23          	sd	ra,24(sp)
    80006570:	00813823          	sd	s0,16(sp)
    80006574:	00913423          	sd	s1,8(sp)
    80006578:	02010413          	addi	s0,sp,32
    8000657c:	00005497          	auipc	s1,0x5
    80006580:	1cc48493          	addi	s1,s1,460 # 8000b748 <cons>
    80006584:	00048513          	mv	a0,s1
    80006588:	00002597          	auipc	a1,0x2
    8000658c:	03858593          	addi	a1,a1,56 # 800085c0 <_ZL6digits+0x140>
    80006590:	00001097          	auipc	ra,0x1
    80006594:	d88080e7          	jalr	-632(ra) # 80007318 <initlock>
    80006598:	00000097          	auipc	ra,0x0
    8000659c:	7ac080e7          	jalr	1964(ra) # 80006d44 <uartinit>
    800065a0:	01813083          	ld	ra,24(sp)
    800065a4:	01013403          	ld	s0,16(sp)
    800065a8:	00000797          	auipc	a5,0x0
    800065ac:	d9c78793          	addi	a5,a5,-612 # 80006344 <consoleread>
    800065b0:	0af4bc23          	sd	a5,184(s1)
    800065b4:	00000797          	auipc	a5,0x0
    800065b8:	cec78793          	addi	a5,a5,-788 # 800062a0 <consolewrite>
    800065bc:	0cf4b023          	sd	a5,192(s1)
    800065c0:	00813483          	ld	s1,8(sp)
    800065c4:	02010113          	addi	sp,sp,32
    800065c8:	00008067          	ret

00000000800065cc <console_read>:
    800065cc:	ff010113          	addi	sp,sp,-16
    800065d0:	00813423          	sd	s0,8(sp)
    800065d4:	01010413          	addi	s0,sp,16
    800065d8:	00813403          	ld	s0,8(sp)
    800065dc:	00005317          	auipc	t1,0x5
    800065e0:	22433303          	ld	t1,548(t1) # 8000b800 <devsw+0x10>
    800065e4:	01010113          	addi	sp,sp,16
    800065e8:	00030067          	jr	t1

00000000800065ec <console_write>:
    800065ec:	ff010113          	addi	sp,sp,-16
    800065f0:	00813423          	sd	s0,8(sp)
    800065f4:	01010413          	addi	s0,sp,16
    800065f8:	00813403          	ld	s0,8(sp)
    800065fc:	00005317          	auipc	t1,0x5
    80006600:	20c33303          	ld	t1,524(t1) # 8000b808 <devsw+0x18>
    80006604:	01010113          	addi	sp,sp,16
    80006608:	00030067          	jr	t1

000000008000660c <panic>:
    8000660c:	fe010113          	addi	sp,sp,-32
    80006610:	00113c23          	sd	ra,24(sp)
    80006614:	00813823          	sd	s0,16(sp)
    80006618:	00913423          	sd	s1,8(sp)
    8000661c:	02010413          	addi	s0,sp,32
    80006620:	00050493          	mv	s1,a0
    80006624:	00002517          	auipc	a0,0x2
    80006628:	fa450513          	addi	a0,a0,-92 # 800085c8 <_ZL6digits+0x148>
    8000662c:	00005797          	auipc	a5,0x5
    80006630:	2607ae23          	sw	zero,636(a5) # 8000b8a8 <pr+0x18>
    80006634:	00000097          	auipc	ra,0x0
    80006638:	034080e7          	jalr	52(ra) # 80006668 <__printf>
    8000663c:	00048513          	mv	a0,s1
    80006640:	00000097          	auipc	ra,0x0
    80006644:	028080e7          	jalr	40(ra) # 80006668 <__printf>
    80006648:	00002517          	auipc	a0,0x2
    8000664c:	b4050513          	addi	a0,a0,-1216 # 80008188 <CONSOLE_STATUS+0x178>
    80006650:	00000097          	auipc	ra,0x0
    80006654:	018080e7          	jalr	24(ra) # 80006668 <__printf>
    80006658:	00100793          	li	a5,1
    8000665c:	00004717          	auipc	a4,0x4
    80006660:	f8f72e23          	sw	a5,-100(a4) # 8000a5f8 <panicked>
    80006664:	0000006f          	j	80006664 <panic+0x58>

0000000080006668 <__printf>:
    80006668:	f3010113          	addi	sp,sp,-208
    8000666c:	08813023          	sd	s0,128(sp)
    80006670:	07313423          	sd	s3,104(sp)
    80006674:	09010413          	addi	s0,sp,144
    80006678:	05813023          	sd	s8,64(sp)
    8000667c:	08113423          	sd	ra,136(sp)
    80006680:	06913c23          	sd	s1,120(sp)
    80006684:	07213823          	sd	s2,112(sp)
    80006688:	07413023          	sd	s4,96(sp)
    8000668c:	05513c23          	sd	s5,88(sp)
    80006690:	05613823          	sd	s6,80(sp)
    80006694:	05713423          	sd	s7,72(sp)
    80006698:	03913c23          	sd	s9,56(sp)
    8000669c:	03a13823          	sd	s10,48(sp)
    800066a0:	03b13423          	sd	s11,40(sp)
    800066a4:	00005317          	auipc	t1,0x5
    800066a8:	1ec30313          	addi	t1,t1,492 # 8000b890 <pr>
    800066ac:	01832c03          	lw	s8,24(t1)
    800066b0:	00b43423          	sd	a1,8(s0)
    800066b4:	00c43823          	sd	a2,16(s0)
    800066b8:	00d43c23          	sd	a3,24(s0)
    800066bc:	02e43023          	sd	a4,32(s0)
    800066c0:	02f43423          	sd	a5,40(s0)
    800066c4:	03043823          	sd	a6,48(s0)
    800066c8:	03143c23          	sd	a7,56(s0)
    800066cc:	00050993          	mv	s3,a0
    800066d0:	4a0c1663          	bnez	s8,80006b7c <__printf+0x514>
    800066d4:	60098c63          	beqz	s3,80006cec <__printf+0x684>
    800066d8:	0009c503          	lbu	a0,0(s3)
    800066dc:	00840793          	addi	a5,s0,8
    800066e0:	f6f43c23          	sd	a5,-136(s0)
    800066e4:	00000493          	li	s1,0
    800066e8:	22050063          	beqz	a0,80006908 <__printf+0x2a0>
    800066ec:	00002a37          	lui	s4,0x2
    800066f0:	00018ab7          	lui	s5,0x18
    800066f4:	000f4b37          	lui	s6,0xf4
    800066f8:	00989bb7          	lui	s7,0x989
    800066fc:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80006700:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80006704:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80006708:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    8000670c:	00148c9b          	addiw	s9,s1,1
    80006710:	02500793          	li	a5,37
    80006714:	01998933          	add	s2,s3,s9
    80006718:	38f51263          	bne	a0,a5,80006a9c <__printf+0x434>
    8000671c:	00094783          	lbu	a5,0(s2)
    80006720:	00078c9b          	sext.w	s9,a5
    80006724:	1e078263          	beqz	a5,80006908 <__printf+0x2a0>
    80006728:	0024849b          	addiw	s1,s1,2
    8000672c:	07000713          	li	a4,112
    80006730:	00998933          	add	s2,s3,s1
    80006734:	38e78a63          	beq	a5,a4,80006ac8 <__printf+0x460>
    80006738:	20f76863          	bltu	a4,a5,80006948 <__printf+0x2e0>
    8000673c:	42a78863          	beq	a5,a0,80006b6c <__printf+0x504>
    80006740:	06400713          	li	a4,100
    80006744:	40e79663          	bne	a5,a4,80006b50 <__printf+0x4e8>
    80006748:	f7843783          	ld	a5,-136(s0)
    8000674c:	0007a603          	lw	a2,0(a5)
    80006750:	00878793          	addi	a5,a5,8
    80006754:	f6f43c23          	sd	a5,-136(s0)
    80006758:	42064a63          	bltz	a2,80006b8c <__printf+0x524>
    8000675c:	00a00713          	li	a4,10
    80006760:	02e677bb          	remuw	a5,a2,a4
    80006764:	00002d97          	auipc	s11,0x2
    80006768:	e8cd8d93          	addi	s11,s11,-372 # 800085f0 <digits>
    8000676c:	00900593          	li	a1,9
    80006770:	0006051b          	sext.w	a0,a2
    80006774:	00000c93          	li	s9,0
    80006778:	02079793          	slli	a5,a5,0x20
    8000677c:	0207d793          	srli	a5,a5,0x20
    80006780:	00fd87b3          	add	a5,s11,a5
    80006784:	0007c783          	lbu	a5,0(a5)
    80006788:	02e656bb          	divuw	a3,a2,a4
    8000678c:	f8f40023          	sb	a5,-128(s0)
    80006790:	14c5d863          	bge	a1,a2,800068e0 <__printf+0x278>
    80006794:	06300593          	li	a1,99
    80006798:	00100c93          	li	s9,1
    8000679c:	02e6f7bb          	remuw	a5,a3,a4
    800067a0:	02079793          	slli	a5,a5,0x20
    800067a4:	0207d793          	srli	a5,a5,0x20
    800067a8:	00fd87b3          	add	a5,s11,a5
    800067ac:	0007c783          	lbu	a5,0(a5)
    800067b0:	02e6d73b          	divuw	a4,a3,a4
    800067b4:	f8f400a3          	sb	a5,-127(s0)
    800067b8:	12a5f463          	bgeu	a1,a0,800068e0 <__printf+0x278>
    800067bc:	00a00693          	li	a3,10
    800067c0:	00900593          	li	a1,9
    800067c4:	02d777bb          	remuw	a5,a4,a3
    800067c8:	02079793          	slli	a5,a5,0x20
    800067cc:	0207d793          	srli	a5,a5,0x20
    800067d0:	00fd87b3          	add	a5,s11,a5
    800067d4:	0007c503          	lbu	a0,0(a5)
    800067d8:	02d757bb          	divuw	a5,a4,a3
    800067dc:	f8a40123          	sb	a0,-126(s0)
    800067e0:	48e5f263          	bgeu	a1,a4,80006c64 <__printf+0x5fc>
    800067e4:	06300513          	li	a0,99
    800067e8:	02d7f5bb          	remuw	a1,a5,a3
    800067ec:	02059593          	slli	a1,a1,0x20
    800067f0:	0205d593          	srli	a1,a1,0x20
    800067f4:	00bd85b3          	add	a1,s11,a1
    800067f8:	0005c583          	lbu	a1,0(a1)
    800067fc:	02d7d7bb          	divuw	a5,a5,a3
    80006800:	f8b401a3          	sb	a1,-125(s0)
    80006804:	48e57263          	bgeu	a0,a4,80006c88 <__printf+0x620>
    80006808:	3e700513          	li	a0,999
    8000680c:	02d7f5bb          	remuw	a1,a5,a3
    80006810:	02059593          	slli	a1,a1,0x20
    80006814:	0205d593          	srli	a1,a1,0x20
    80006818:	00bd85b3          	add	a1,s11,a1
    8000681c:	0005c583          	lbu	a1,0(a1)
    80006820:	02d7d7bb          	divuw	a5,a5,a3
    80006824:	f8b40223          	sb	a1,-124(s0)
    80006828:	46e57663          	bgeu	a0,a4,80006c94 <__printf+0x62c>
    8000682c:	02d7f5bb          	remuw	a1,a5,a3
    80006830:	02059593          	slli	a1,a1,0x20
    80006834:	0205d593          	srli	a1,a1,0x20
    80006838:	00bd85b3          	add	a1,s11,a1
    8000683c:	0005c583          	lbu	a1,0(a1)
    80006840:	02d7d7bb          	divuw	a5,a5,a3
    80006844:	f8b402a3          	sb	a1,-123(s0)
    80006848:	46ea7863          	bgeu	s4,a4,80006cb8 <__printf+0x650>
    8000684c:	02d7f5bb          	remuw	a1,a5,a3
    80006850:	02059593          	slli	a1,a1,0x20
    80006854:	0205d593          	srli	a1,a1,0x20
    80006858:	00bd85b3          	add	a1,s11,a1
    8000685c:	0005c583          	lbu	a1,0(a1)
    80006860:	02d7d7bb          	divuw	a5,a5,a3
    80006864:	f8b40323          	sb	a1,-122(s0)
    80006868:	3eeaf863          	bgeu	s5,a4,80006c58 <__printf+0x5f0>
    8000686c:	02d7f5bb          	remuw	a1,a5,a3
    80006870:	02059593          	slli	a1,a1,0x20
    80006874:	0205d593          	srli	a1,a1,0x20
    80006878:	00bd85b3          	add	a1,s11,a1
    8000687c:	0005c583          	lbu	a1,0(a1)
    80006880:	02d7d7bb          	divuw	a5,a5,a3
    80006884:	f8b403a3          	sb	a1,-121(s0)
    80006888:	42eb7e63          	bgeu	s6,a4,80006cc4 <__printf+0x65c>
    8000688c:	02d7f5bb          	remuw	a1,a5,a3
    80006890:	02059593          	slli	a1,a1,0x20
    80006894:	0205d593          	srli	a1,a1,0x20
    80006898:	00bd85b3          	add	a1,s11,a1
    8000689c:	0005c583          	lbu	a1,0(a1)
    800068a0:	02d7d7bb          	divuw	a5,a5,a3
    800068a4:	f8b40423          	sb	a1,-120(s0)
    800068a8:	42ebfc63          	bgeu	s7,a4,80006ce0 <__printf+0x678>
    800068ac:	02079793          	slli	a5,a5,0x20
    800068b0:	0207d793          	srli	a5,a5,0x20
    800068b4:	00fd8db3          	add	s11,s11,a5
    800068b8:	000dc703          	lbu	a4,0(s11)
    800068bc:	00a00793          	li	a5,10
    800068c0:	00900c93          	li	s9,9
    800068c4:	f8e404a3          	sb	a4,-119(s0)
    800068c8:	00065c63          	bgez	a2,800068e0 <__printf+0x278>
    800068cc:	f9040713          	addi	a4,s0,-112
    800068d0:	00f70733          	add	a4,a4,a5
    800068d4:	02d00693          	li	a3,45
    800068d8:	fed70823          	sb	a3,-16(a4)
    800068dc:	00078c93          	mv	s9,a5
    800068e0:	f8040793          	addi	a5,s0,-128
    800068e4:	01978cb3          	add	s9,a5,s9
    800068e8:	f7f40d13          	addi	s10,s0,-129
    800068ec:	000cc503          	lbu	a0,0(s9)
    800068f0:	fffc8c93          	addi	s9,s9,-1
    800068f4:	00000097          	auipc	ra,0x0
    800068f8:	b90080e7          	jalr	-1136(ra) # 80006484 <consputc>
    800068fc:	ffac98e3          	bne	s9,s10,800068ec <__printf+0x284>
    80006900:	00094503          	lbu	a0,0(s2)
    80006904:	e00514e3          	bnez	a0,8000670c <__printf+0xa4>
    80006908:	1a0c1663          	bnez	s8,80006ab4 <__printf+0x44c>
    8000690c:	08813083          	ld	ra,136(sp)
    80006910:	08013403          	ld	s0,128(sp)
    80006914:	07813483          	ld	s1,120(sp)
    80006918:	07013903          	ld	s2,112(sp)
    8000691c:	06813983          	ld	s3,104(sp)
    80006920:	06013a03          	ld	s4,96(sp)
    80006924:	05813a83          	ld	s5,88(sp)
    80006928:	05013b03          	ld	s6,80(sp)
    8000692c:	04813b83          	ld	s7,72(sp)
    80006930:	04013c03          	ld	s8,64(sp)
    80006934:	03813c83          	ld	s9,56(sp)
    80006938:	03013d03          	ld	s10,48(sp)
    8000693c:	02813d83          	ld	s11,40(sp)
    80006940:	0d010113          	addi	sp,sp,208
    80006944:	00008067          	ret
    80006948:	07300713          	li	a4,115
    8000694c:	1ce78a63          	beq	a5,a4,80006b20 <__printf+0x4b8>
    80006950:	07800713          	li	a4,120
    80006954:	1ee79e63          	bne	a5,a4,80006b50 <__printf+0x4e8>
    80006958:	f7843783          	ld	a5,-136(s0)
    8000695c:	0007a703          	lw	a4,0(a5)
    80006960:	00878793          	addi	a5,a5,8
    80006964:	f6f43c23          	sd	a5,-136(s0)
    80006968:	28074263          	bltz	a4,80006bec <__printf+0x584>
    8000696c:	00002d97          	auipc	s11,0x2
    80006970:	c84d8d93          	addi	s11,s11,-892 # 800085f0 <digits>
    80006974:	00f77793          	andi	a5,a4,15
    80006978:	00fd87b3          	add	a5,s11,a5
    8000697c:	0007c683          	lbu	a3,0(a5)
    80006980:	00f00613          	li	a2,15
    80006984:	0007079b          	sext.w	a5,a4
    80006988:	f8d40023          	sb	a3,-128(s0)
    8000698c:	0047559b          	srliw	a1,a4,0x4
    80006990:	0047569b          	srliw	a3,a4,0x4
    80006994:	00000c93          	li	s9,0
    80006998:	0ee65063          	bge	a2,a4,80006a78 <__printf+0x410>
    8000699c:	00f6f693          	andi	a3,a3,15
    800069a0:	00dd86b3          	add	a3,s11,a3
    800069a4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    800069a8:	0087d79b          	srliw	a5,a5,0x8
    800069ac:	00100c93          	li	s9,1
    800069b0:	f8d400a3          	sb	a3,-127(s0)
    800069b4:	0cb67263          	bgeu	a2,a1,80006a78 <__printf+0x410>
    800069b8:	00f7f693          	andi	a3,a5,15
    800069bc:	00dd86b3          	add	a3,s11,a3
    800069c0:	0006c583          	lbu	a1,0(a3)
    800069c4:	00f00613          	li	a2,15
    800069c8:	0047d69b          	srliw	a3,a5,0x4
    800069cc:	f8b40123          	sb	a1,-126(s0)
    800069d0:	0047d593          	srli	a1,a5,0x4
    800069d4:	28f67e63          	bgeu	a2,a5,80006c70 <__printf+0x608>
    800069d8:	00f6f693          	andi	a3,a3,15
    800069dc:	00dd86b3          	add	a3,s11,a3
    800069e0:	0006c503          	lbu	a0,0(a3)
    800069e4:	0087d813          	srli	a6,a5,0x8
    800069e8:	0087d69b          	srliw	a3,a5,0x8
    800069ec:	f8a401a3          	sb	a0,-125(s0)
    800069f0:	28b67663          	bgeu	a2,a1,80006c7c <__printf+0x614>
    800069f4:	00f6f693          	andi	a3,a3,15
    800069f8:	00dd86b3          	add	a3,s11,a3
    800069fc:	0006c583          	lbu	a1,0(a3)
    80006a00:	00c7d513          	srli	a0,a5,0xc
    80006a04:	00c7d69b          	srliw	a3,a5,0xc
    80006a08:	f8b40223          	sb	a1,-124(s0)
    80006a0c:	29067a63          	bgeu	a2,a6,80006ca0 <__printf+0x638>
    80006a10:	00f6f693          	andi	a3,a3,15
    80006a14:	00dd86b3          	add	a3,s11,a3
    80006a18:	0006c583          	lbu	a1,0(a3)
    80006a1c:	0107d813          	srli	a6,a5,0x10
    80006a20:	0107d69b          	srliw	a3,a5,0x10
    80006a24:	f8b402a3          	sb	a1,-123(s0)
    80006a28:	28a67263          	bgeu	a2,a0,80006cac <__printf+0x644>
    80006a2c:	00f6f693          	andi	a3,a3,15
    80006a30:	00dd86b3          	add	a3,s11,a3
    80006a34:	0006c683          	lbu	a3,0(a3)
    80006a38:	0147d79b          	srliw	a5,a5,0x14
    80006a3c:	f8d40323          	sb	a3,-122(s0)
    80006a40:	21067663          	bgeu	a2,a6,80006c4c <__printf+0x5e4>
    80006a44:	02079793          	slli	a5,a5,0x20
    80006a48:	0207d793          	srli	a5,a5,0x20
    80006a4c:	00fd8db3          	add	s11,s11,a5
    80006a50:	000dc683          	lbu	a3,0(s11)
    80006a54:	00800793          	li	a5,8
    80006a58:	00700c93          	li	s9,7
    80006a5c:	f8d403a3          	sb	a3,-121(s0)
    80006a60:	00075c63          	bgez	a4,80006a78 <__printf+0x410>
    80006a64:	f9040713          	addi	a4,s0,-112
    80006a68:	00f70733          	add	a4,a4,a5
    80006a6c:	02d00693          	li	a3,45
    80006a70:	fed70823          	sb	a3,-16(a4)
    80006a74:	00078c93          	mv	s9,a5
    80006a78:	f8040793          	addi	a5,s0,-128
    80006a7c:	01978cb3          	add	s9,a5,s9
    80006a80:	f7f40d13          	addi	s10,s0,-129
    80006a84:	000cc503          	lbu	a0,0(s9)
    80006a88:	fffc8c93          	addi	s9,s9,-1
    80006a8c:	00000097          	auipc	ra,0x0
    80006a90:	9f8080e7          	jalr	-1544(ra) # 80006484 <consputc>
    80006a94:	ff9d18e3          	bne	s10,s9,80006a84 <__printf+0x41c>
    80006a98:	0100006f          	j	80006aa8 <__printf+0x440>
    80006a9c:	00000097          	auipc	ra,0x0
    80006aa0:	9e8080e7          	jalr	-1560(ra) # 80006484 <consputc>
    80006aa4:	000c8493          	mv	s1,s9
    80006aa8:	00094503          	lbu	a0,0(s2)
    80006aac:	c60510e3          	bnez	a0,8000670c <__printf+0xa4>
    80006ab0:	e40c0ee3          	beqz	s8,8000690c <__printf+0x2a4>
    80006ab4:	00005517          	auipc	a0,0x5
    80006ab8:	ddc50513          	addi	a0,a0,-548 # 8000b890 <pr>
    80006abc:	00001097          	auipc	ra,0x1
    80006ac0:	94c080e7          	jalr	-1716(ra) # 80007408 <release>
    80006ac4:	e49ff06f          	j	8000690c <__printf+0x2a4>
    80006ac8:	f7843783          	ld	a5,-136(s0)
    80006acc:	03000513          	li	a0,48
    80006ad0:	01000d13          	li	s10,16
    80006ad4:	00878713          	addi	a4,a5,8
    80006ad8:	0007bc83          	ld	s9,0(a5)
    80006adc:	f6e43c23          	sd	a4,-136(s0)
    80006ae0:	00000097          	auipc	ra,0x0
    80006ae4:	9a4080e7          	jalr	-1628(ra) # 80006484 <consputc>
    80006ae8:	07800513          	li	a0,120
    80006aec:	00000097          	auipc	ra,0x0
    80006af0:	998080e7          	jalr	-1640(ra) # 80006484 <consputc>
    80006af4:	00002d97          	auipc	s11,0x2
    80006af8:	afcd8d93          	addi	s11,s11,-1284 # 800085f0 <digits>
    80006afc:	03ccd793          	srli	a5,s9,0x3c
    80006b00:	00fd87b3          	add	a5,s11,a5
    80006b04:	0007c503          	lbu	a0,0(a5)
    80006b08:	fffd0d1b          	addiw	s10,s10,-1
    80006b0c:	004c9c93          	slli	s9,s9,0x4
    80006b10:	00000097          	auipc	ra,0x0
    80006b14:	974080e7          	jalr	-1676(ra) # 80006484 <consputc>
    80006b18:	fe0d12e3          	bnez	s10,80006afc <__printf+0x494>
    80006b1c:	f8dff06f          	j	80006aa8 <__printf+0x440>
    80006b20:	f7843783          	ld	a5,-136(s0)
    80006b24:	0007bc83          	ld	s9,0(a5)
    80006b28:	00878793          	addi	a5,a5,8
    80006b2c:	f6f43c23          	sd	a5,-136(s0)
    80006b30:	000c9a63          	bnez	s9,80006b44 <__printf+0x4dc>
    80006b34:	1080006f          	j	80006c3c <__printf+0x5d4>
    80006b38:	001c8c93          	addi	s9,s9,1
    80006b3c:	00000097          	auipc	ra,0x0
    80006b40:	948080e7          	jalr	-1720(ra) # 80006484 <consputc>
    80006b44:	000cc503          	lbu	a0,0(s9)
    80006b48:	fe0518e3          	bnez	a0,80006b38 <__printf+0x4d0>
    80006b4c:	f5dff06f          	j	80006aa8 <__printf+0x440>
    80006b50:	02500513          	li	a0,37
    80006b54:	00000097          	auipc	ra,0x0
    80006b58:	930080e7          	jalr	-1744(ra) # 80006484 <consputc>
    80006b5c:	000c8513          	mv	a0,s9
    80006b60:	00000097          	auipc	ra,0x0
    80006b64:	924080e7          	jalr	-1756(ra) # 80006484 <consputc>
    80006b68:	f41ff06f          	j	80006aa8 <__printf+0x440>
    80006b6c:	02500513          	li	a0,37
    80006b70:	00000097          	auipc	ra,0x0
    80006b74:	914080e7          	jalr	-1772(ra) # 80006484 <consputc>
    80006b78:	f31ff06f          	j	80006aa8 <__printf+0x440>
    80006b7c:	00030513          	mv	a0,t1
    80006b80:	00000097          	auipc	ra,0x0
    80006b84:	7bc080e7          	jalr	1980(ra) # 8000733c <acquire>
    80006b88:	b4dff06f          	j	800066d4 <__printf+0x6c>
    80006b8c:	40c0053b          	negw	a0,a2
    80006b90:	00a00713          	li	a4,10
    80006b94:	02e576bb          	remuw	a3,a0,a4
    80006b98:	00002d97          	auipc	s11,0x2
    80006b9c:	a58d8d93          	addi	s11,s11,-1448 # 800085f0 <digits>
    80006ba0:	ff700593          	li	a1,-9
    80006ba4:	02069693          	slli	a3,a3,0x20
    80006ba8:	0206d693          	srli	a3,a3,0x20
    80006bac:	00dd86b3          	add	a3,s11,a3
    80006bb0:	0006c683          	lbu	a3,0(a3)
    80006bb4:	02e557bb          	divuw	a5,a0,a4
    80006bb8:	f8d40023          	sb	a3,-128(s0)
    80006bbc:	10b65e63          	bge	a2,a1,80006cd8 <__printf+0x670>
    80006bc0:	06300593          	li	a1,99
    80006bc4:	02e7f6bb          	remuw	a3,a5,a4
    80006bc8:	02069693          	slli	a3,a3,0x20
    80006bcc:	0206d693          	srli	a3,a3,0x20
    80006bd0:	00dd86b3          	add	a3,s11,a3
    80006bd4:	0006c683          	lbu	a3,0(a3)
    80006bd8:	02e7d73b          	divuw	a4,a5,a4
    80006bdc:	00200793          	li	a5,2
    80006be0:	f8d400a3          	sb	a3,-127(s0)
    80006be4:	bca5ece3          	bltu	a1,a0,800067bc <__printf+0x154>
    80006be8:	ce5ff06f          	j	800068cc <__printf+0x264>
    80006bec:	40e007bb          	negw	a5,a4
    80006bf0:	00002d97          	auipc	s11,0x2
    80006bf4:	a00d8d93          	addi	s11,s11,-1536 # 800085f0 <digits>
    80006bf8:	00f7f693          	andi	a3,a5,15
    80006bfc:	00dd86b3          	add	a3,s11,a3
    80006c00:	0006c583          	lbu	a1,0(a3)
    80006c04:	ff100613          	li	a2,-15
    80006c08:	0047d69b          	srliw	a3,a5,0x4
    80006c0c:	f8b40023          	sb	a1,-128(s0)
    80006c10:	0047d59b          	srliw	a1,a5,0x4
    80006c14:	0ac75e63          	bge	a4,a2,80006cd0 <__printf+0x668>
    80006c18:	00f6f693          	andi	a3,a3,15
    80006c1c:	00dd86b3          	add	a3,s11,a3
    80006c20:	0006c603          	lbu	a2,0(a3)
    80006c24:	00f00693          	li	a3,15
    80006c28:	0087d79b          	srliw	a5,a5,0x8
    80006c2c:	f8c400a3          	sb	a2,-127(s0)
    80006c30:	d8b6e4e3          	bltu	a3,a1,800069b8 <__printf+0x350>
    80006c34:	00200793          	li	a5,2
    80006c38:	e2dff06f          	j	80006a64 <__printf+0x3fc>
    80006c3c:	00002c97          	auipc	s9,0x2
    80006c40:	994c8c93          	addi	s9,s9,-1644 # 800085d0 <_ZL6digits+0x150>
    80006c44:	02800513          	li	a0,40
    80006c48:	ef1ff06f          	j	80006b38 <__printf+0x4d0>
    80006c4c:	00700793          	li	a5,7
    80006c50:	00600c93          	li	s9,6
    80006c54:	e0dff06f          	j	80006a60 <__printf+0x3f8>
    80006c58:	00700793          	li	a5,7
    80006c5c:	00600c93          	li	s9,6
    80006c60:	c69ff06f          	j	800068c8 <__printf+0x260>
    80006c64:	00300793          	li	a5,3
    80006c68:	00200c93          	li	s9,2
    80006c6c:	c5dff06f          	j	800068c8 <__printf+0x260>
    80006c70:	00300793          	li	a5,3
    80006c74:	00200c93          	li	s9,2
    80006c78:	de9ff06f          	j	80006a60 <__printf+0x3f8>
    80006c7c:	00400793          	li	a5,4
    80006c80:	00300c93          	li	s9,3
    80006c84:	dddff06f          	j	80006a60 <__printf+0x3f8>
    80006c88:	00400793          	li	a5,4
    80006c8c:	00300c93          	li	s9,3
    80006c90:	c39ff06f          	j	800068c8 <__printf+0x260>
    80006c94:	00500793          	li	a5,5
    80006c98:	00400c93          	li	s9,4
    80006c9c:	c2dff06f          	j	800068c8 <__printf+0x260>
    80006ca0:	00500793          	li	a5,5
    80006ca4:	00400c93          	li	s9,4
    80006ca8:	db9ff06f          	j	80006a60 <__printf+0x3f8>
    80006cac:	00600793          	li	a5,6
    80006cb0:	00500c93          	li	s9,5
    80006cb4:	dadff06f          	j	80006a60 <__printf+0x3f8>
    80006cb8:	00600793          	li	a5,6
    80006cbc:	00500c93          	li	s9,5
    80006cc0:	c09ff06f          	j	800068c8 <__printf+0x260>
    80006cc4:	00800793          	li	a5,8
    80006cc8:	00700c93          	li	s9,7
    80006ccc:	bfdff06f          	j	800068c8 <__printf+0x260>
    80006cd0:	00100793          	li	a5,1
    80006cd4:	d91ff06f          	j	80006a64 <__printf+0x3fc>
    80006cd8:	00100793          	li	a5,1
    80006cdc:	bf1ff06f          	j	800068cc <__printf+0x264>
    80006ce0:	00900793          	li	a5,9
    80006ce4:	00800c93          	li	s9,8
    80006ce8:	be1ff06f          	j	800068c8 <__printf+0x260>
    80006cec:	00002517          	auipc	a0,0x2
    80006cf0:	8ec50513          	addi	a0,a0,-1812 # 800085d8 <_ZL6digits+0x158>
    80006cf4:	00000097          	auipc	ra,0x0
    80006cf8:	918080e7          	jalr	-1768(ra) # 8000660c <panic>

0000000080006cfc <printfinit>:
    80006cfc:	fe010113          	addi	sp,sp,-32
    80006d00:	00813823          	sd	s0,16(sp)
    80006d04:	00913423          	sd	s1,8(sp)
    80006d08:	00113c23          	sd	ra,24(sp)
    80006d0c:	02010413          	addi	s0,sp,32
    80006d10:	00005497          	auipc	s1,0x5
    80006d14:	b8048493          	addi	s1,s1,-1152 # 8000b890 <pr>
    80006d18:	00048513          	mv	a0,s1
    80006d1c:	00002597          	auipc	a1,0x2
    80006d20:	8cc58593          	addi	a1,a1,-1844 # 800085e8 <_ZL6digits+0x168>
    80006d24:	00000097          	auipc	ra,0x0
    80006d28:	5f4080e7          	jalr	1524(ra) # 80007318 <initlock>
    80006d2c:	01813083          	ld	ra,24(sp)
    80006d30:	01013403          	ld	s0,16(sp)
    80006d34:	0004ac23          	sw	zero,24(s1)
    80006d38:	00813483          	ld	s1,8(sp)
    80006d3c:	02010113          	addi	sp,sp,32
    80006d40:	00008067          	ret

0000000080006d44 <uartinit>:
    80006d44:	ff010113          	addi	sp,sp,-16
    80006d48:	00813423          	sd	s0,8(sp)
    80006d4c:	01010413          	addi	s0,sp,16
    80006d50:	100007b7          	lui	a5,0x10000
    80006d54:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80006d58:	f8000713          	li	a4,-128
    80006d5c:	00e781a3          	sb	a4,3(a5)
    80006d60:	00300713          	li	a4,3
    80006d64:	00e78023          	sb	a4,0(a5)
    80006d68:	000780a3          	sb	zero,1(a5)
    80006d6c:	00e781a3          	sb	a4,3(a5)
    80006d70:	00700693          	li	a3,7
    80006d74:	00d78123          	sb	a3,2(a5)
    80006d78:	00e780a3          	sb	a4,1(a5)
    80006d7c:	00813403          	ld	s0,8(sp)
    80006d80:	01010113          	addi	sp,sp,16
    80006d84:	00008067          	ret

0000000080006d88 <uartputc>:
    80006d88:	00004797          	auipc	a5,0x4
    80006d8c:	8707a783          	lw	a5,-1936(a5) # 8000a5f8 <panicked>
    80006d90:	00078463          	beqz	a5,80006d98 <uartputc+0x10>
    80006d94:	0000006f          	j	80006d94 <uartputc+0xc>
    80006d98:	fd010113          	addi	sp,sp,-48
    80006d9c:	02813023          	sd	s0,32(sp)
    80006da0:	00913c23          	sd	s1,24(sp)
    80006da4:	01213823          	sd	s2,16(sp)
    80006da8:	01313423          	sd	s3,8(sp)
    80006dac:	02113423          	sd	ra,40(sp)
    80006db0:	03010413          	addi	s0,sp,48
    80006db4:	00004917          	auipc	s2,0x4
    80006db8:	84c90913          	addi	s2,s2,-1972 # 8000a600 <uart_tx_r>
    80006dbc:	00093783          	ld	a5,0(s2)
    80006dc0:	00004497          	auipc	s1,0x4
    80006dc4:	84848493          	addi	s1,s1,-1976 # 8000a608 <uart_tx_w>
    80006dc8:	0004b703          	ld	a4,0(s1)
    80006dcc:	02078693          	addi	a3,a5,32
    80006dd0:	00050993          	mv	s3,a0
    80006dd4:	02e69c63          	bne	a3,a4,80006e0c <uartputc+0x84>
    80006dd8:	00001097          	auipc	ra,0x1
    80006ddc:	834080e7          	jalr	-1996(ra) # 8000760c <push_on>
    80006de0:	00093783          	ld	a5,0(s2)
    80006de4:	0004b703          	ld	a4,0(s1)
    80006de8:	02078793          	addi	a5,a5,32
    80006dec:	00e79463          	bne	a5,a4,80006df4 <uartputc+0x6c>
    80006df0:	0000006f          	j	80006df0 <uartputc+0x68>
    80006df4:	00001097          	auipc	ra,0x1
    80006df8:	88c080e7          	jalr	-1908(ra) # 80007680 <pop_on>
    80006dfc:	00093783          	ld	a5,0(s2)
    80006e00:	0004b703          	ld	a4,0(s1)
    80006e04:	02078693          	addi	a3,a5,32
    80006e08:	fce688e3          	beq	a3,a4,80006dd8 <uartputc+0x50>
    80006e0c:	01f77693          	andi	a3,a4,31
    80006e10:	00005597          	auipc	a1,0x5
    80006e14:	aa058593          	addi	a1,a1,-1376 # 8000b8b0 <uart_tx_buf>
    80006e18:	00d586b3          	add	a3,a1,a3
    80006e1c:	00170713          	addi	a4,a4,1
    80006e20:	01368023          	sb	s3,0(a3)
    80006e24:	00e4b023          	sd	a4,0(s1)
    80006e28:	10000637          	lui	a2,0x10000
    80006e2c:	02f71063          	bne	a4,a5,80006e4c <uartputc+0xc4>
    80006e30:	0340006f          	j	80006e64 <uartputc+0xdc>
    80006e34:	00074703          	lbu	a4,0(a4)
    80006e38:	00f93023          	sd	a5,0(s2)
    80006e3c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80006e40:	00093783          	ld	a5,0(s2)
    80006e44:	0004b703          	ld	a4,0(s1)
    80006e48:	00f70e63          	beq	a4,a5,80006e64 <uartputc+0xdc>
    80006e4c:	00564683          	lbu	a3,5(a2)
    80006e50:	01f7f713          	andi	a4,a5,31
    80006e54:	00e58733          	add	a4,a1,a4
    80006e58:	0206f693          	andi	a3,a3,32
    80006e5c:	00178793          	addi	a5,a5,1
    80006e60:	fc069ae3          	bnez	a3,80006e34 <uartputc+0xac>
    80006e64:	02813083          	ld	ra,40(sp)
    80006e68:	02013403          	ld	s0,32(sp)
    80006e6c:	01813483          	ld	s1,24(sp)
    80006e70:	01013903          	ld	s2,16(sp)
    80006e74:	00813983          	ld	s3,8(sp)
    80006e78:	03010113          	addi	sp,sp,48
    80006e7c:	00008067          	ret

0000000080006e80 <uartputc_sync>:
    80006e80:	ff010113          	addi	sp,sp,-16
    80006e84:	00813423          	sd	s0,8(sp)
    80006e88:	01010413          	addi	s0,sp,16
    80006e8c:	00003717          	auipc	a4,0x3
    80006e90:	76c72703          	lw	a4,1900(a4) # 8000a5f8 <panicked>
    80006e94:	02071663          	bnez	a4,80006ec0 <uartputc_sync+0x40>
    80006e98:	00050793          	mv	a5,a0
    80006e9c:	100006b7          	lui	a3,0x10000
    80006ea0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80006ea4:	02077713          	andi	a4,a4,32
    80006ea8:	fe070ce3          	beqz	a4,80006ea0 <uartputc_sync+0x20>
    80006eac:	0ff7f793          	andi	a5,a5,255
    80006eb0:	00f68023          	sb	a5,0(a3)
    80006eb4:	00813403          	ld	s0,8(sp)
    80006eb8:	01010113          	addi	sp,sp,16
    80006ebc:	00008067          	ret
    80006ec0:	0000006f          	j	80006ec0 <uartputc_sync+0x40>

0000000080006ec4 <uartstart>:
    80006ec4:	ff010113          	addi	sp,sp,-16
    80006ec8:	00813423          	sd	s0,8(sp)
    80006ecc:	01010413          	addi	s0,sp,16
    80006ed0:	00003617          	auipc	a2,0x3
    80006ed4:	73060613          	addi	a2,a2,1840 # 8000a600 <uart_tx_r>
    80006ed8:	00003517          	auipc	a0,0x3
    80006edc:	73050513          	addi	a0,a0,1840 # 8000a608 <uart_tx_w>
    80006ee0:	00063783          	ld	a5,0(a2)
    80006ee4:	00053703          	ld	a4,0(a0)
    80006ee8:	04f70263          	beq	a4,a5,80006f2c <uartstart+0x68>
    80006eec:	100005b7          	lui	a1,0x10000
    80006ef0:	00005817          	auipc	a6,0x5
    80006ef4:	9c080813          	addi	a6,a6,-1600 # 8000b8b0 <uart_tx_buf>
    80006ef8:	01c0006f          	j	80006f14 <uartstart+0x50>
    80006efc:	0006c703          	lbu	a4,0(a3)
    80006f00:	00f63023          	sd	a5,0(a2)
    80006f04:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80006f08:	00063783          	ld	a5,0(a2)
    80006f0c:	00053703          	ld	a4,0(a0)
    80006f10:	00f70e63          	beq	a4,a5,80006f2c <uartstart+0x68>
    80006f14:	01f7f713          	andi	a4,a5,31
    80006f18:	00e806b3          	add	a3,a6,a4
    80006f1c:	0055c703          	lbu	a4,5(a1)
    80006f20:	00178793          	addi	a5,a5,1
    80006f24:	02077713          	andi	a4,a4,32
    80006f28:	fc071ae3          	bnez	a4,80006efc <uartstart+0x38>
    80006f2c:	00813403          	ld	s0,8(sp)
    80006f30:	01010113          	addi	sp,sp,16
    80006f34:	00008067          	ret

0000000080006f38 <uartgetc>:
    80006f38:	ff010113          	addi	sp,sp,-16
    80006f3c:	00813423          	sd	s0,8(sp)
    80006f40:	01010413          	addi	s0,sp,16
    80006f44:	10000737          	lui	a4,0x10000
    80006f48:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80006f4c:	0017f793          	andi	a5,a5,1
    80006f50:	00078c63          	beqz	a5,80006f68 <uartgetc+0x30>
    80006f54:	00074503          	lbu	a0,0(a4)
    80006f58:	0ff57513          	andi	a0,a0,255
    80006f5c:	00813403          	ld	s0,8(sp)
    80006f60:	01010113          	addi	sp,sp,16
    80006f64:	00008067          	ret
    80006f68:	fff00513          	li	a0,-1
    80006f6c:	ff1ff06f          	j	80006f5c <uartgetc+0x24>

0000000080006f70 <uartintr>:
    80006f70:	100007b7          	lui	a5,0x10000
    80006f74:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80006f78:	0017f793          	andi	a5,a5,1
    80006f7c:	0a078463          	beqz	a5,80007024 <uartintr+0xb4>
    80006f80:	fe010113          	addi	sp,sp,-32
    80006f84:	00813823          	sd	s0,16(sp)
    80006f88:	00913423          	sd	s1,8(sp)
    80006f8c:	00113c23          	sd	ra,24(sp)
    80006f90:	02010413          	addi	s0,sp,32
    80006f94:	100004b7          	lui	s1,0x10000
    80006f98:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    80006f9c:	0ff57513          	andi	a0,a0,255
    80006fa0:	fffff097          	auipc	ra,0xfffff
    80006fa4:	534080e7          	jalr	1332(ra) # 800064d4 <consoleintr>
    80006fa8:	0054c783          	lbu	a5,5(s1)
    80006fac:	0017f793          	andi	a5,a5,1
    80006fb0:	fe0794e3          	bnez	a5,80006f98 <uartintr+0x28>
    80006fb4:	00003617          	auipc	a2,0x3
    80006fb8:	64c60613          	addi	a2,a2,1612 # 8000a600 <uart_tx_r>
    80006fbc:	00003517          	auipc	a0,0x3
    80006fc0:	64c50513          	addi	a0,a0,1612 # 8000a608 <uart_tx_w>
    80006fc4:	00063783          	ld	a5,0(a2)
    80006fc8:	00053703          	ld	a4,0(a0)
    80006fcc:	04f70263          	beq	a4,a5,80007010 <uartintr+0xa0>
    80006fd0:	100005b7          	lui	a1,0x10000
    80006fd4:	00005817          	auipc	a6,0x5
    80006fd8:	8dc80813          	addi	a6,a6,-1828 # 8000b8b0 <uart_tx_buf>
    80006fdc:	01c0006f          	j	80006ff8 <uartintr+0x88>
    80006fe0:	0006c703          	lbu	a4,0(a3)
    80006fe4:	00f63023          	sd	a5,0(a2)
    80006fe8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80006fec:	00063783          	ld	a5,0(a2)
    80006ff0:	00053703          	ld	a4,0(a0)
    80006ff4:	00f70e63          	beq	a4,a5,80007010 <uartintr+0xa0>
    80006ff8:	01f7f713          	andi	a4,a5,31
    80006ffc:	00e806b3          	add	a3,a6,a4
    80007000:	0055c703          	lbu	a4,5(a1)
    80007004:	00178793          	addi	a5,a5,1
    80007008:	02077713          	andi	a4,a4,32
    8000700c:	fc071ae3          	bnez	a4,80006fe0 <uartintr+0x70>
    80007010:	01813083          	ld	ra,24(sp)
    80007014:	01013403          	ld	s0,16(sp)
    80007018:	00813483          	ld	s1,8(sp)
    8000701c:	02010113          	addi	sp,sp,32
    80007020:	00008067          	ret
    80007024:	00003617          	auipc	a2,0x3
    80007028:	5dc60613          	addi	a2,a2,1500 # 8000a600 <uart_tx_r>
    8000702c:	00003517          	auipc	a0,0x3
    80007030:	5dc50513          	addi	a0,a0,1500 # 8000a608 <uart_tx_w>
    80007034:	00063783          	ld	a5,0(a2)
    80007038:	00053703          	ld	a4,0(a0)
    8000703c:	04f70263          	beq	a4,a5,80007080 <uartintr+0x110>
    80007040:	100005b7          	lui	a1,0x10000
    80007044:	00005817          	auipc	a6,0x5
    80007048:	86c80813          	addi	a6,a6,-1940 # 8000b8b0 <uart_tx_buf>
    8000704c:	01c0006f          	j	80007068 <uartintr+0xf8>
    80007050:	0006c703          	lbu	a4,0(a3)
    80007054:	00f63023          	sd	a5,0(a2)
    80007058:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000705c:	00063783          	ld	a5,0(a2)
    80007060:	00053703          	ld	a4,0(a0)
    80007064:	02f70063          	beq	a4,a5,80007084 <uartintr+0x114>
    80007068:	01f7f713          	andi	a4,a5,31
    8000706c:	00e806b3          	add	a3,a6,a4
    80007070:	0055c703          	lbu	a4,5(a1)
    80007074:	00178793          	addi	a5,a5,1
    80007078:	02077713          	andi	a4,a4,32
    8000707c:	fc071ae3          	bnez	a4,80007050 <uartintr+0xe0>
    80007080:	00008067          	ret
    80007084:	00008067          	ret

0000000080007088 <kinit>:
    80007088:	fc010113          	addi	sp,sp,-64
    8000708c:	02913423          	sd	s1,40(sp)
    80007090:	fffff7b7          	lui	a5,0xfffff
    80007094:	00006497          	auipc	s1,0x6
    80007098:	83b48493          	addi	s1,s1,-1989 # 8000c8cf <end+0xfff>
    8000709c:	02813823          	sd	s0,48(sp)
    800070a0:	01313c23          	sd	s3,24(sp)
    800070a4:	00f4f4b3          	and	s1,s1,a5
    800070a8:	02113c23          	sd	ra,56(sp)
    800070ac:	03213023          	sd	s2,32(sp)
    800070b0:	01413823          	sd	s4,16(sp)
    800070b4:	01513423          	sd	s5,8(sp)
    800070b8:	04010413          	addi	s0,sp,64
    800070bc:	000017b7          	lui	a5,0x1
    800070c0:	01100993          	li	s3,17
    800070c4:	00f487b3          	add	a5,s1,a5
    800070c8:	01b99993          	slli	s3,s3,0x1b
    800070cc:	06f9e063          	bltu	s3,a5,8000712c <kinit+0xa4>
    800070d0:	00005a97          	auipc	s5,0x5
    800070d4:	800a8a93          	addi	s5,s5,-2048 # 8000b8d0 <end>
    800070d8:	0754ec63          	bltu	s1,s5,80007150 <kinit+0xc8>
    800070dc:	0734fa63          	bgeu	s1,s3,80007150 <kinit+0xc8>
    800070e0:	00088a37          	lui	s4,0x88
    800070e4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    800070e8:	00003917          	auipc	s2,0x3
    800070ec:	52890913          	addi	s2,s2,1320 # 8000a610 <kmem>
    800070f0:	00ca1a13          	slli	s4,s4,0xc
    800070f4:	0140006f          	j	80007108 <kinit+0x80>
    800070f8:	000017b7          	lui	a5,0x1
    800070fc:	00f484b3          	add	s1,s1,a5
    80007100:	0554e863          	bltu	s1,s5,80007150 <kinit+0xc8>
    80007104:	0534f663          	bgeu	s1,s3,80007150 <kinit+0xc8>
    80007108:	00001637          	lui	a2,0x1
    8000710c:	00100593          	li	a1,1
    80007110:	00048513          	mv	a0,s1
    80007114:	00000097          	auipc	ra,0x0
    80007118:	5e4080e7          	jalr	1508(ra) # 800076f8 <__memset>
    8000711c:	00093783          	ld	a5,0(s2)
    80007120:	00f4b023          	sd	a5,0(s1)
    80007124:	00993023          	sd	s1,0(s2)
    80007128:	fd4498e3          	bne	s1,s4,800070f8 <kinit+0x70>
    8000712c:	03813083          	ld	ra,56(sp)
    80007130:	03013403          	ld	s0,48(sp)
    80007134:	02813483          	ld	s1,40(sp)
    80007138:	02013903          	ld	s2,32(sp)
    8000713c:	01813983          	ld	s3,24(sp)
    80007140:	01013a03          	ld	s4,16(sp)
    80007144:	00813a83          	ld	s5,8(sp)
    80007148:	04010113          	addi	sp,sp,64
    8000714c:	00008067          	ret
    80007150:	00001517          	auipc	a0,0x1
    80007154:	4b850513          	addi	a0,a0,1208 # 80008608 <digits+0x18>
    80007158:	fffff097          	auipc	ra,0xfffff
    8000715c:	4b4080e7          	jalr	1204(ra) # 8000660c <panic>

0000000080007160 <freerange>:
    80007160:	fc010113          	addi	sp,sp,-64
    80007164:	000017b7          	lui	a5,0x1
    80007168:	02913423          	sd	s1,40(sp)
    8000716c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80007170:	009504b3          	add	s1,a0,s1
    80007174:	fffff537          	lui	a0,0xfffff
    80007178:	02813823          	sd	s0,48(sp)
    8000717c:	02113c23          	sd	ra,56(sp)
    80007180:	03213023          	sd	s2,32(sp)
    80007184:	01313c23          	sd	s3,24(sp)
    80007188:	01413823          	sd	s4,16(sp)
    8000718c:	01513423          	sd	s5,8(sp)
    80007190:	01613023          	sd	s6,0(sp)
    80007194:	04010413          	addi	s0,sp,64
    80007198:	00a4f4b3          	and	s1,s1,a0
    8000719c:	00f487b3          	add	a5,s1,a5
    800071a0:	06f5e463          	bltu	a1,a5,80007208 <freerange+0xa8>
    800071a4:	00004a97          	auipc	s5,0x4
    800071a8:	72ca8a93          	addi	s5,s5,1836 # 8000b8d0 <end>
    800071ac:	0954e263          	bltu	s1,s5,80007230 <freerange+0xd0>
    800071b0:	01100993          	li	s3,17
    800071b4:	01b99993          	slli	s3,s3,0x1b
    800071b8:	0734fc63          	bgeu	s1,s3,80007230 <freerange+0xd0>
    800071bc:	00058a13          	mv	s4,a1
    800071c0:	00003917          	auipc	s2,0x3
    800071c4:	45090913          	addi	s2,s2,1104 # 8000a610 <kmem>
    800071c8:	00002b37          	lui	s6,0x2
    800071cc:	0140006f          	j	800071e0 <freerange+0x80>
    800071d0:	000017b7          	lui	a5,0x1
    800071d4:	00f484b3          	add	s1,s1,a5
    800071d8:	0554ec63          	bltu	s1,s5,80007230 <freerange+0xd0>
    800071dc:	0534fa63          	bgeu	s1,s3,80007230 <freerange+0xd0>
    800071e0:	00001637          	lui	a2,0x1
    800071e4:	00100593          	li	a1,1
    800071e8:	00048513          	mv	a0,s1
    800071ec:	00000097          	auipc	ra,0x0
    800071f0:	50c080e7          	jalr	1292(ra) # 800076f8 <__memset>
    800071f4:	00093703          	ld	a4,0(s2)
    800071f8:	016487b3          	add	a5,s1,s6
    800071fc:	00e4b023          	sd	a4,0(s1)
    80007200:	00993023          	sd	s1,0(s2)
    80007204:	fcfa76e3          	bgeu	s4,a5,800071d0 <freerange+0x70>
    80007208:	03813083          	ld	ra,56(sp)
    8000720c:	03013403          	ld	s0,48(sp)
    80007210:	02813483          	ld	s1,40(sp)
    80007214:	02013903          	ld	s2,32(sp)
    80007218:	01813983          	ld	s3,24(sp)
    8000721c:	01013a03          	ld	s4,16(sp)
    80007220:	00813a83          	ld	s5,8(sp)
    80007224:	00013b03          	ld	s6,0(sp)
    80007228:	04010113          	addi	sp,sp,64
    8000722c:	00008067          	ret
    80007230:	00001517          	auipc	a0,0x1
    80007234:	3d850513          	addi	a0,a0,984 # 80008608 <digits+0x18>
    80007238:	fffff097          	auipc	ra,0xfffff
    8000723c:	3d4080e7          	jalr	980(ra) # 8000660c <panic>

0000000080007240 <kfree>:
    80007240:	fe010113          	addi	sp,sp,-32
    80007244:	00813823          	sd	s0,16(sp)
    80007248:	00113c23          	sd	ra,24(sp)
    8000724c:	00913423          	sd	s1,8(sp)
    80007250:	02010413          	addi	s0,sp,32
    80007254:	03451793          	slli	a5,a0,0x34
    80007258:	04079c63          	bnez	a5,800072b0 <kfree+0x70>
    8000725c:	00004797          	auipc	a5,0x4
    80007260:	67478793          	addi	a5,a5,1652 # 8000b8d0 <end>
    80007264:	00050493          	mv	s1,a0
    80007268:	04f56463          	bltu	a0,a5,800072b0 <kfree+0x70>
    8000726c:	01100793          	li	a5,17
    80007270:	01b79793          	slli	a5,a5,0x1b
    80007274:	02f57e63          	bgeu	a0,a5,800072b0 <kfree+0x70>
    80007278:	00001637          	lui	a2,0x1
    8000727c:	00100593          	li	a1,1
    80007280:	00000097          	auipc	ra,0x0
    80007284:	478080e7          	jalr	1144(ra) # 800076f8 <__memset>
    80007288:	00003797          	auipc	a5,0x3
    8000728c:	38878793          	addi	a5,a5,904 # 8000a610 <kmem>
    80007290:	0007b703          	ld	a4,0(a5)
    80007294:	01813083          	ld	ra,24(sp)
    80007298:	01013403          	ld	s0,16(sp)
    8000729c:	00e4b023          	sd	a4,0(s1)
    800072a0:	0097b023          	sd	s1,0(a5)
    800072a4:	00813483          	ld	s1,8(sp)
    800072a8:	02010113          	addi	sp,sp,32
    800072ac:	00008067          	ret
    800072b0:	00001517          	auipc	a0,0x1
    800072b4:	35850513          	addi	a0,a0,856 # 80008608 <digits+0x18>
    800072b8:	fffff097          	auipc	ra,0xfffff
    800072bc:	354080e7          	jalr	852(ra) # 8000660c <panic>

00000000800072c0 <kalloc>:
    800072c0:	fe010113          	addi	sp,sp,-32
    800072c4:	00813823          	sd	s0,16(sp)
    800072c8:	00913423          	sd	s1,8(sp)
    800072cc:	00113c23          	sd	ra,24(sp)
    800072d0:	02010413          	addi	s0,sp,32
    800072d4:	00003797          	auipc	a5,0x3
    800072d8:	33c78793          	addi	a5,a5,828 # 8000a610 <kmem>
    800072dc:	0007b483          	ld	s1,0(a5)
    800072e0:	02048063          	beqz	s1,80007300 <kalloc+0x40>
    800072e4:	0004b703          	ld	a4,0(s1)
    800072e8:	00001637          	lui	a2,0x1
    800072ec:	00500593          	li	a1,5
    800072f0:	00048513          	mv	a0,s1
    800072f4:	00e7b023          	sd	a4,0(a5)
    800072f8:	00000097          	auipc	ra,0x0
    800072fc:	400080e7          	jalr	1024(ra) # 800076f8 <__memset>
    80007300:	01813083          	ld	ra,24(sp)
    80007304:	01013403          	ld	s0,16(sp)
    80007308:	00048513          	mv	a0,s1
    8000730c:	00813483          	ld	s1,8(sp)
    80007310:	02010113          	addi	sp,sp,32
    80007314:	00008067          	ret

0000000080007318 <initlock>:
    80007318:	ff010113          	addi	sp,sp,-16
    8000731c:	00813423          	sd	s0,8(sp)
    80007320:	01010413          	addi	s0,sp,16
    80007324:	00813403          	ld	s0,8(sp)
    80007328:	00b53423          	sd	a1,8(a0)
    8000732c:	00052023          	sw	zero,0(a0)
    80007330:	00053823          	sd	zero,16(a0)
    80007334:	01010113          	addi	sp,sp,16
    80007338:	00008067          	ret

000000008000733c <acquire>:
    8000733c:	fe010113          	addi	sp,sp,-32
    80007340:	00813823          	sd	s0,16(sp)
    80007344:	00913423          	sd	s1,8(sp)
    80007348:	00113c23          	sd	ra,24(sp)
    8000734c:	01213023          	sd	s2,0(sp)
    80007350:	02010413          	addi	s0,sp,32
    80007354:	00050493          	mv	s1,a0
    80007358:	10002973          	csrr	s2,sstatus
    8000735c:	100027f3          	csrr	a5,sstatus
    80007360:	ffd7f793          	andi	a5,a5,-3
    80007364:	10079073          	csrw	sstatus,a5
    80007368:	fffff097          	auipc	ra,0xfffff
    8000736c:	8e4080e7          	jalr	-1820(ra) # 80005c4c <mycpu>
    80007370:	07852783          	lw	a5,120(a0)
    80007374:	06078e63          	beqz	a5,800073f0 <acquire+0xb4>
    80007378:	fffff097          	auipc	ra,0xfffff
    8000737c:	8d4080e7          	jalr	-1836(ra) # 80005c4c <mycpu>
    80007380:	07852783          	lw	a5,120(a0)
    80007384:	0004a703          	lw	a4,0(s1)
    80007388:	0017879b          	addiw	a5,a5,1
    8000738c:	06f52c23          	sw	a5,120(a0)
    80007390:	04071063          	bnez	a4,800073d0 <acquire+0x94>
    80007394:	00100713          	li	a4,1
    80007398:	00070793          	mv	a5,a4
    8000739c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    800073a0:	0007879b          	sext.w	a5,a5
    800073a4:	fe079ae3          	bnez	a5,80007398 <acquire+0x5c>
    800073a8:	0ff0000f          	fence
    800073ac:	fffff097          	auipc	ra,0xfffff
    800073b0:	8a0080e7          	jalr	-1888(ra) # 80005c4c <mycpu>
    800073b4:	01813083          	ld	ra,24(sp)
    800073b8:	01013403          	ld	s0,16(sp)
    800073bc:	00a4b823          	sd	a0,16(s1)
    800073c0:	00013903          	ld	s2,0(sp)
    800073c4:	00813483          	ld	s1,8(sp)
    800073c8:	02010113          	addi	sp,sp,32
    800073cc:	00008067          	ret
    800073d0:	0104b903          	ld	s2,16(s1)
    800073d4:	fffff097          	auipc	ra,0xfffff
    800073d8:	878080e7          	jalr	-1928(ra) # 80005c4c <mycpu>
    800073dc:	faa91ce3          	bne	s2,a0,80007394 <acquire+0x58>
    800073e0:	00001517          	auipc	a0,0x1
    800073e4:	23050513          	addi	a0,a0,560 # 80008610 <digits+0x20>
    800073e8:	fffff097          	auipc	ra,0xfffff
    800073ec:	224080e7          	jalr	548(ra) # 8000660c <panic>
    800073f0:	00195913          	srli	s2,s2,0x1
    800073f4:	fffff097          	auipc	ra,0xfffff
    800073f8:	858080e7          	jalr	-1960(ra) # 80005c4c <mycpu>
    800073fc:	00197913          	andi	s2,s2,1
    80007400:	07252e23          	sw	s2,124(a0)
    80007404:	f75ff06f          	j	80007378 <acquire+0x3c>

0000000080007408 <release>:
    80007408:	fe010113          	addi	sp,sp,-32
    8000740c:	00813823          	sd	s0,16(sp)
    80007410:	00113c23          	sd	ra,24(sp)
    80007414:	00913423          	sd	s1,8(sp)
    80007418:	01213023          	sd	s2,0(sp)
    8000741c:	02010413          	addi	s0,sp,32
    80007420:	00052783          	lw	a5,0(a0)
    80007424:	00079a63          	bnez	a5,80007438 <release+0x30>
    80007428:	00001517          	auipc	a0,0x1
    8000742c:	1f050513          	addi	a0,a0,496 # 80008618 <digits+0x28>
    80007430:	fffff097          	auipc	ra,0xfffff
    80007434:	1dc080e7          	jalr	476(ra) # 8000660c <panic>
    80007438:	01053903          	ld	s2,16(a0)
    8000743c:	00050493          	mv	s1,a0
    80007440:	fffff097          	auipc	ra,0xfffff
    80007444:	80c080e7          	jalr	-2036(ra) # 80005c4c <mycpu>
    80007448:	fea910e3          	bne	s2,a0,80007428 <release+0x20>
    8000744c:	0004b823          	sd	zero,16(s1)
    80007450:	0ff0000f          	fence
    80007454:	0f50000f          	fence	iorw,ow
    80007458:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000745c:	ffffe097          	auipc	ra,0xffffe
    80007460:	7f0080e7          	jalr	2032(ra) # 80005c4c <mycpu>
    80007464:	100027f3          	csrr	a5,sstatus
    80007468:	0027f793          	andi	a5,a5,2
    8000746c:	04079a63          	bnez	a5,800074c0 <release+0xb8>
    80007470:	07852783          	lw	a5,120(a0)
    80007474:	02f05e63          	blez	a5,800074b0 <release+0xa8>
    80007478:	fff7871b          	addiw	a4,a5,-1
    8000747c:	06e52c23          	sw	a4,120(a0)
    80007480:	00071c63          	bnez	a4,80007498 <release+0x90>
    80007484:	07c52783          	lw	a5,124(a0)
    80007488:	00078863          	beqz	a5,80007498 <release+0x90>
    8000748c:	100027f3          	csrr	a5,sstatus
    80007490:	0027e793          	ori	a5,a5,2
    80007494:	10079073          	csrw	sstatus,a5
    80007498:	01813083          	ld	ra,24(sp)
    8000749c:	01013403          	ld	s0,16(sp)
    800074a0:	00813483          	ld	s1,8(sp)
    800074a4:	00013903          	ld	s2,0(sp)
    800074a8:	02010113          	addi	sp,sp,32
    800074ac:	00008067          	ret
    800074b0:	00001517          	auipc	a0,0x1
    800074b4:	18850513          	addi	a0,a0,392 # 80008638 <digits+0x48>
    800074b8:	fffff097          	auipc	ra,0xfffff
    800074bc:	154080e7          	jalr	340(ra) # 8000660c <panic>
    800074c0:	00001517          	auipc	a0,0x1
    800074c4:	16050513          	addi	a0,a0,352 # 80008620 <digits+0x30>
    800074c8:	fffff097          	auipc	ra,0xfffff
    800074cc:	144080e7          	jalr	324(ra) # 8000660c <panic>

00000000800074d0 <holding>:
    800074d0:	00052783          	lw	a5,0(a0)
    800074d4:	00079663          	bnez	a5,800074e0 <holding+0x10>
    800074d8:	00000513          	li	a0,0
    800074dc:	00008067          	ret
    800074e0:	fe010113          	addi	sp,sp,-32
    800074e4:	00813823          	sd	s0,16(sp)
    800074e8:	00913423          	sd	s1,8(sp)
    800074ec:	00113c23          	sd	ra,24(sp)
    800074f0:	02010413          	addi	s0,sp,32
    800074f4:	01053483          	ld	s1,16(a0)
    800074f8:	ffffe097          	auipc	ra,0xffffe
    800074fc:	754080e7          	jalr	1876(ra) # 80005c4c <mycpu>
    80007500:	01813083          	ld	ra,24(sp)
    80007504:	01013403          	ld	s0,16(sp)
    80007508:	40a48533          	sub	a0,s1,a0
    8000750c:	00153513          	seqz	a0,a0
    80007510:	00813483          	ld	s1,8(sp)
    80007514:	02010113          	addi	sp,sp,32
    80007518:	00008067          	ret

000000008000751c <push_off>:
    8000751c:	fe010113          	addi	sp,sp,-32
    80007520:	00813823          	sd	s0,16(sp)
    80007524:	00113c23          	sd	ra,24(sp)
    80007528:	00913423          	sd	s1,8(sp)
    8000752c:	02010413          	addi	s0,sp,32
    80007530:	100024f3          	csrr	s1,sstatus
    80007534:	100027f3          	csrr	a5,sstatus
    80007538:	ffd7f793          	andi	a5,a5,-3
    8000753c:	10079073          	csrw	sstatus,a5
    80007540:	ffffe097          	auipc	ra,0xffffe
    80007544:	70c080e7          	jalr	1804(ra) # 80005c4c <mycpu>
    80007548:	07852783          	lw	a5,120(a0)
    8000754c:	02078663          	beqz	a5,80007578 <push_off+0x5c>
    80007550:	ffffe097          	auipc	ra,0xffffe
    80007554:	6fc080e7          	jalr	1788(ra) # 80005c4c <mycpu>
    80007558:	07852783          	lw	a5,120(a0)
    8000755c:	01813083          	ld	ra,24(sp)
    80007560:	01013403          	ld	s0,16(sp)
    80007564:	0017879b          	addiw	a5,a5,1
    80007568:	06f52c23          	sw	a5,120(a0)
    8000756c:	00813483          	ld	s1,8(sp)
    80007570:	02010113          	addi	sp,sp,32
    80007574:	00008067          	ret
    80007578:	0014d493          	srli	s1,s1,0x1
    8000757c:	ffffe097          	auipc	ra,0xffffe
    80007580:	6d0080e7          	jalr	1744(ra) # 80005c4c <mycpu>
    80007584:	0014f493          	andi	s1,s1,1
    80007588:	06952e23          	sw	s1,124(a0)
    8000758c:	fc5ff06f          	j	80007550 <push_off+0x34>

0000000080007590 <pop_off>:
    80007590:	ff010113          	addi	sp,sp,-16
    80007594:	00813023          	sd	s0,0(sp)
    80007598:	00113423          	sd	ra,8(sp)
    8000759c:	01010413          	addi	s0,sp,16
    800075a0:	ffffe097          	auipc	ra,0xffffe
    800075a4:	6ac080e7          	jalr	1708(ra) # 80005c4c <mycpu>
    800075a8:	100027f3          	csrr	a5,sstatus
    800075ac:	0027f793          	andi	a5,a5,2
    800075b0:	04079663          	bnez	a5,800075fc <pop_off+0x6c>
    800075b4:	07852783          	lw	a5,120(a0)
    800075b8:	02f05a63          	blez	a5,800075ec <pop_off+0x5c>
    800075bc:	fff7871b          	addiw	a4,a5,-1
    800075c0:	06e52c23          	sw	a4,120(a0)
    800075c4:	00071c63          	bnez	a4,800075dc <pop_off+0x4c>
    800075c8:	07c52783          	lw	a5,124(a0)
    800075cc:	00078863          	beqz	a5,800075dc <pop_off+0x4c>
    800075d0:	100027f3          	csrr	a5,sstatus
    800075d4:	0027e793          	ori	a5,a5,2
    800075d8:	10079073          	csrw	sstatus,a5
    800075dc:	00813083          	ld	ra,8(sp)
    800075e0:	00013403          	ld	s0,0(sp)
    800075e4:	01010113          	addi	sp,sp,16
    800075e8:	00008067          	ret
    800075ec:	00001517          	auipc	a0,0x1
    800075f0:	04c50513          	addi	a0,a0,76 # 80008638 <digits+0x48>
    800075f4:	fffff097          	auipc	ra,0xfffff
    800075f8:	018080e7          	jalr	24(ra) # 8000660c <panic>
    800075fc:	00001517          	auipc	a0,0x1
    80007600:	02450513          	addi	a0,a0,36 # 80008620 <digits+0x30>
    80007604:	fffff097          	auipc	ra,0xfffff
    80007608:	008080e7          	jalr	8(ra) # 8000660c <panic>

000000008000760c <push_on>:
    8000760c:	fe010113          	addi	sp,sp,-32
    80007610:	00813823          	sd	s0,16(sp)
    80007614:	00113c23          	sd	ra,24(sp)
    80007618:	00913423          	sd	s1,8(sp)
    8000761c:	02010413          	addi	s0,sp,32
    80007620:	100024f3          	csrr	s1,sstatus
    80007624:	100027f3          	csrr	a5,sstatus
    80007628:	0027e793          	ori	a5,a5,2
    8000762c:	10079073          	csrw	sstatus,a5
    80007630:	ffffe097          	auipc	ra,0xffffe
    80007634:	61c080e7          	jalr	1564(ra) # 80005c4c <mycpu>
    80007638:	07852783          	lw	a5,120(a0)
    8000763c:	02078663          	beqz	a5,80007668 <push_on+0x5c>
    80007640:	ffffe097          	auipc	ra,0xffffe
    80007644:	60c080e7          	jalr	1548(ra) # 80005c4c <mycpu>
    80007648:	07852783          	lw	a5,120(a0)
    8000764c:	01813083          	ld	ra,24(sp)
    80007650:	01013403          	ld	s0,16(sp)
    80007654:	0017879b          	addiw	a5,a5,1
    80007658:	06f52c23          	sw	a5,120(a0)
    8000765c:	00813483          	ld	s1,8(sp)
    80007660:	02010113          	addi	sp,sp,32
    80007664:	00008067          	ret
    80007668:	0014d493          	srli	s1,s1,0x1
    8000766c:	ffffe097          	auipc	ra,0xffffe
    80007670:	5e0080e7          	jalr	1504(ra) # 80005c4c <mycpu>
    80007674:	0014f493          	andi	s1,s1,1
    80007678:	06952e23          	sw	s1,124(a0)
    8000767c:	fc5ff06f          	j	80007640 <push_on+0x34>

0000000080007680 <pop_on>:
    80007680:	ff010113          	addi	sp,sp,-16
    80007684:	00813023          	sd	s0,0(sp)
    80007688:	00113423          	sd	ra,8(sp)
    8000768c:	01010413          	addi	s0,sp,16
    80007690:	ffffe097          	auipc	ra,0xffffe
    80007694:	5bc080e7          	jalr	1468(ra) # 80005c4c <mycpu>
    80007698:	100027f3          	csrr	a5,sstatus
    8000769c:	0027f793          	andi	a5,a5,2
    800076a0:	04078463          	beqz	a5,800076e8 <pop_on+0x68>
    800076a4:	07852783          	lw	a5,120(a0)
    800076a8:	02f05863          	blez	a5,800076d8 <pop_on+0x58>
    800076ac:	fff7879b          	addiw	a5,a5,-1
    800076b0:	06f52c23          	sw	a5,120(a0)
    800076b4:	07853783          	ld	a5,120(a0)
    800076b8:	00079863          	bnez	a5,800076c8 <pop_on+0x48>
    800076bc:	100027f3          	csrr	a5,sstatus
    800076c0:	ffd7f793          	andi	a5,a5,-3
    800076c4:	10079073          	csrw	sstatus,a5
    800076c8:	00813083          	ld	ra,8(sp)
    800076cc:	00013403          	ld	s0,0(sp)
    800076d0:	01010113          	addi	sp,sp,16
    800076d4:	00008067          	ret
    800076d8:	00001517          	auipc	a0,0x1
    800076dc:	f8850513          	addi	a0,a0,-120 # 80008660 <digits+0x70>
    800076e0:	fffff097          	auipc	ra,0xfffff
    800076e4:	f2c080e7          	jalr	-212(ra) # 8000660c <panic>
    800076e8:	00001517          	auipc	a0,0x1
    800076ec:	f5850513          	addi	a0,a0,-168 # 80008640 <digits+0x50>
    800076f0:	fffff097          	auipc	ra,0xfffff
    800076f4:	f1c080e7          	jalr	-228(ra) # 8000660c <panic>

00000000800076f8 <__memset>:
    800076f8:	ff010113          	addi	sp,sp,-16
    800076fc:	00813423          	sd	s0,8(sp)
    80007700:	01010413          	addi	s0,sp,16
    80007704:	1a060e63          	beqz	a2,800078c0 <__memset+0x1c8>
    80007708:	40a007b3          	neg	a5,a0
    8000770c:	0077f793          	andi	a5,a5,7
    80007710:	00778693          	addi	a3,a5,7
    80007714:	00b00813          	li	a6,11
    80007718:	0ff5f593          	andi	a1,a1,255
    8000771c:	fff6071b          	addiw	a4,a2,-1
    80007720:	1b06e663          	bltu	a3,a6,800078cc <__memset+0x1d4>
    80007724:	1cd76463          	bltu	a4,a3,800078ec <__memset+0x1f4>
    80007728:	1a078e63          	beqz	a5,800078e4 <__memset+0x1ec>
    8000772c:	00b50023          	sb	a1,0(a0)
    80007730:	00100713          	li	a4,1
    80007734:	1ae78463          	beq	a5,a4,800078dc <__memset+0x1e4>
    80007738:	00b500a3          	sb	a1,1(a0)
    8000773c:	00200713          	li	a4,2
    80007740:	1ae78a63          	beq	a5,a4,800078f4 <__memset+0x1fc>
    80007744:	00b50123          	sb	a1,2(a0)
    80007748:	00300713          	li	a4,3
    8000774c:	18e78463          	beq	a5,a4,800078d4 <__memset+0x1dc>
    80007750:	00b501a3          	sb	a1,3(a0)
    80007754:	00400713          	li	a4,4
    80007758:	1ae78263          	beq	a5,a4,800078fc <__memset+0x204>
    8000775c:	00b50223          	sb	a1,4(a0)
    80007760:	00500713          	li	a4,5
    80007764:	1ae78063          	beq	a5,a4,80007904 <__memset+0x20c>
    80007768:	00b502a3          	sb	a1,5(a0)
    8000776c:	00700713          	li	a4,7
    80007770:	18e79e63          	bne	a5,a4,8000790c <__memset+0x214>
    80007774:	00b50323          	sb	a1,6(a0)
    80007778:	00700e93          	li	t4,7
    8000777c:	00859713          	slli	a4,a1,0x8
    80007780:	00e5e733          	or	a4,a1,a4
    80007784:	01059e13          	slli	t3,a1,0x10
    80007788:	01c76e33          	or	t3,a4,t3
    8000778c:	01859313          	slli	t1,a1,0x18
    80007790:	006e6333          	or	t1,t3,t1
    80007794:	02059893          	slli	a7,a1,0x20
    80007798:	40f60e3b          	subw	t3,a2,a5
    8000779c:	011368b3          	or	a7,t1,a7
    800077a0:	02859813          	slli	a6,a1,0x28
    800077a4:	0108e833          	or	a6,a7,a6
    800077a8:	03059693          	slli	a3,a1,0x30
    800077ac:	003e589b          	srliw	a7,t3,0x3
    800077b0:	00d866b3          	or	a3,a6,a3
    800077b4:	03859713          	slli	a4,a1,0x38
    800077b8:	00389813          	slli	a6,a7,0x3
    800077bc:	00f507b3          	add	a5,a0,a5
    800077c0:	00e6e733          	or	a4,a3,a4
    800077c4:	000e089b          	sext.w	a7,t3
    800077c8:	00f806b3          	add	a3,a6,a5
    800077cc:	00e7b023          	sd	a4,0(a5)
    800077d0:	00878793          	addi	a5,a5,8
    800077d4:	fed79ce3          	bne	a5,a3,800077cc <__memset+0xd4>
    800077d8:	ff8e7793          	andi	a5,t3,-8
    800077dc:	0007871b          	sext.w	a4,a5
    800077e0:	01d787bb          	addw	a5,a5,t4
    800077e4:	0ce88e63          	beq	a7,a4,800078c0 <__memset+0x1c8>
    800077e8:	00f50733          	add	a4,a0,a5
    800077ec:	00b70023          	sb	a1,0(a4)
    800077f0:	0017871b          	addiw	a4,a5,1
    800077f4:	0cc77663          	bgeu	a4,a2,800078c0 <__memset+0x1c8>
    800077f8:	00e50733          	add	a4,a0,a4
    800077fc:	00b70023          	sb	a1,0(a4)
    80007800:	0027871b          	addiw	a4,a5,2
    80007804:	0ac77e63          	bgeu	a4,a2,800078c0 <__memset+0x1c8>
    80007808:	00e50733          	add	a4,a0,a4
    8000780c:	00b70023          	sb	a1,0(a4)
    80007810:	0037871b          	addiw	a4,a5,3
    80007814:	0ac77663          	bgeu	a4,a2,800078c0 <__memset+0x1c8>
    80007818:	00e50733          	add	a4,a0,a4
    8000781c:	00b70023          	sb	a1,0(a4)
    80007820:	0047871b          	addiw	a4,a5,4
    80007824:	08c77e63          	bgeu	a4,a2,800078c0 <__memset+0x1c8>
    80007828:	00e50733          	add	a4,a0,a4
    8000782c:	00b70023          	sb	a1,0(a4)
    80007830:	0057871b          	addiw	a4,a5,5
    80007834:	08c77663          	bgeu	a4,a2,800078c0 <__memset+0x1c8>
    80007838:	00e50733          	add	a4,a0,a4
    8000783c:	00b70023          	sb	a1,0(a4)
    80007840:	0067871b          	addiw	a4,a5,6
    80007844:	06c77e63          	bgeu	a4,a2,800078c0 <__memset+0x1c8>
    80007848:	00e50733          	add	a4,a0,a4
    8000784c:	00b70023          	sb	a1,0(a4)
    80007850:	0077871b          	addiw	a4,a5,7
    80007854:	06c77663          	bgeu	a4,a2,800078c0 <__memset+0x1c8>
    80007858:	00e50733          	add	a4,a0,a4
    8000785c:	00b70023          	sb	a1,0(a4)
    80007860:	0087871b          	addiw	a4,a5,8
    80007864:	04c77e63          	bgeu	a4,a2,800078c0 <__memset+0x1c8>
    80007868:	00e50733          	add	a4,a0,a4
    8000786c:	00b70023          	sb	a1,0(a4)
    80007870:	0097871b          	addiw	a4,a5,9
    80007874:	04c77663          	bgeu	a4,a2,800078c0 <__memset+0x1c8>
    80007878:	00e50733          	add	a4,a0,a4
    8000787c:	00b70023          	sb	a1,0(a4)
    80007880:	00a7871b          	addiw	a4,a5,10
    80007884:	02c77e63          	bgeu	a4,a2,800078c0 <__memset+0x1c8>
    80007888:	00e50733          	add	a4,a0,a4
    8000788c:	00b70023          	sb	a1,0(a4)
    80007890:	00b7871b          	addiw	a4,a5,11
    80007894:	02c77663          	bgeu	a4,a2,800078c0 <__memset+0x1c8>
    80007898:	00e50733          	add	a4,a0,a4
    8000789c:	00b70023          	sb	a1,0(a4)
    800078a0:	00c7871b          	addiw	a4,a5,12
    800078a4:	00c77e63          	bgeu	a4,a2,800078c0 <__memset+0x1c8>
    800078a8:	00e50733          	add	a4,a0,a4
    800078ac:	00b70023          	sb	a1,0(a4)
    800078b0:	00d7879b          	addiw	a5,a5,13
    800078b4:	00c7f663          	bgeu	a5,a2,800078c0 <__memset+0x1c8>
    800078b8:	00f507b3          	add	a5,a0,a5
    800078bc:	00b78023          	sb	a1,0(a5)
    800078c0:	00813403          	ld	s0,8(sp)
    800078c4:	01010113          	addi	sp,sp,16
    800078c8:	00008067          	ret
    800078cc:	00b00693          	li	a3,11
    800078d0:	e55ff06f          	j	80007724 <__memset+0x2c>
    800078d4:	00300e93          	li	t4,3
    800078d8:	ea5ff06f          	j	8000777c <__memset+0x84>
    800078dc:	00100e93          	li	t4,1
    800078e0:	e9dff06f          	j	8000777c <__memset+0x84>
    800078e4:	00000e93          	li	t4,0
    800078e8:	e95ff06f          	j	8000777c <__memset+0x84>
    800078ec:	00000793          	li	a5,0
    800078f0:	ef9ff06f          	j	800077e8 <__memset+0xf0>
    800078f4:	00200e93          	li	t4,2
    800078f8:	e85ff06f          	j	8000777c <__memset+0x84>
    800078fc:	00400e93          	li	t4,4
    80007900:	e7dff06f          	j	8000777c <__memset+0x84>
    80007904:	00500e93          	li	t4,5
    80007908:	e75ff06f          	j	8000777c <__memset+0x84>
    8000790c:	00600e93          	li	t4,6
    80007910:	e6dff06f          	j	8000777c <__memset+0x84>

0000000080007914 <__memmove>:
    80007914:	ff010113          	addi	sp,sp,-16
    80007918:	00813423          	sd	s0,8(sp)
    8000791c:	01010413          	addi	s0,sp,16
    80007920:	0e060863          	beqz	a2,80007a10 <__memmove+0xfc>
    80007924:	fff6069b          	addiw	a3,a2,-1
    80007928:	0006881b          	sext.w	a6,a3
    8000792c:	0ea5e863          	bltu	a1,a0,80007a1c <__memmove+0x108>
    80007930:	00758713          	addi	a4,a1,7
    80007934:	00a5e7b3          	or	a5,a1,a0
    80007938:	40a70733          	sub	a4,a4,a0
    8000793c:	0077f793          	andi	a5,a5,7
    80007940:	00f73713          	sltiu	a4,a4,15
    80007944:	00174713          	xori	a4,a4,1
    80007948:	0017b793          	seqz	a5,a5
    8000794c:	00e7f7b3          	and	a5,a5,a4
    80007950:	10078863          	beqz	a5,80007a60 <__memmove+0x14c>
    80007954:	00900793          	li	a5,9
    80007958:	1107f463          	bgeu	a5,a6,80007a60 <__memmove+0x14c>
    8000795c:	0036581b          	srliw	a6,a2,0x3
    80007960:	fff8081b          	addiw	a6,a6,-1
    80007964:	02081813          	slli	a6,a6,0x20
    80007968:	01d85893          	srli	a7,a6,0x1d
    8000796c:	00858813          	addi	a6,a1,8
    80007970:	00058793          	mv	a5,a1
    80007974:	00050713          	mv	a4,a0
    80007978:	01088833          	add	a6,a7,a6
    8000797c:	0007b883          	ld	a7,0(a5)
    80007980:	00878793          	addi	a5,a5,8
    80007984:	00870713          	addi	a4,a4,8
    80007988:	ff173c23          	sd	a7,-8(a4)
    8000798c:	ff0798e3          	bne	a5,a6,8000797c <__memmove+0x68>
    80007990:	ff867713          	andi	a4,a2,-8
    80007994:	02071793          	slli	a5,a4,0x20
    80007998:	0207d793          	srli	a5,a5,0x20
    8000799c:	00f585b3          	add	a1,a1,a5
    800079a0:	40e686bb          	subw	a3,a3,a4
    800079a4:	00f507b3          	add	a5,a0,a5
    800079a8:	06e60463          	beq	a2,a4,80007a10 <__memmove+0xfc>
    800079ac:	0005c703          	lbu	a4,0(a1)
    800079b0:	00e78023          	sb	a4,0(a5)
    800079b4:	04068e63          	beqz	a3,80007a10 <__memmove+0xfc>
    800079b8:	0015c603          	lbu	a2,1(a1)
    800079bc:	00100713          	li	a4,1
    800079c0:	00c780a3          	sb	a2,1(a5)
    800079c4:	04e68663          	beq	a3,a4,80007a10 <__memmove+0xfc>
    800079c8:	0025c603          	lbu	a2,2(a1)
    800079cc:	00200713          	li	a4,2
    800079d0:	00c78123          	sb	a2,2(a5)
    800079d4:	02e68e63          	beq	a3,a4,80007a10 <__memmove+0xfc>
    800079d8:	0035c603          	lbu	a2,3(a1)
    800079dc:	00300713          	li	a4,3
    800079e0:	00c781a3          	sb	a2,3(a5)
    800079e4:	02e68663          	beq	a3,a4,80007a10 <__memmove+0xfc>
    800079e8:	0045c603          	lbu	a2,4(a1)
    800079ec:	00400713          	li	a4,4
    800079f0:	00c78223          	sb	a2,4(a5)
    800079f4:	00e68e63          	beq	a3,a4,80007a10 <__memmove+0xfc>
    800079f8:	0055c603          	lbu	a2,5(a1)
    800079fc:	00500713          	li	a4,5
    80007a00:	00c782a3          	sb	a2,5(a5)
    80007a04:	00e68663          	beq	a3,a4,80007a10 <__memmove+0xfc>
    80007a08:	0065c703          	lbu	a4,6(a1)
    80007a0c:	00e78323          	sb	a4,6(a5)
    80007a10:	00813403          	ld	s0,8(sp)
    80007a14:	01010113          	addi	sp,sp,16
    80007a18:	00008067          	ret
    80007a1c:	02061713          	slli	a4,a2,0x20
    80007a20:	02075713          	srli	a4,a4,0x20
    80007a24:	00e587b3          	add	a5,a1,a4
    80007a28:	f0f574e3          	bgeu	a0,a5,80007930 <__memmove+0x1c>
    80007a2c:	02069613          	slli	a2,a3,0x20
    80007a30:	02065613          	srli	a2,a2,0x20
    80007a34:	fff64613          	not	a2,a2
    80007a38:	00e50733          	add	a4,a0,a4
    80007a3c:	00c78633          	add	a2,a5,a2
    80007a40:	fff7c683          	lbu	a3,-1(a5)
    80007a44:	fff78793          	addi	a5,a5,-1
    80007a48:	fff70713          	addi	a4,a4,-1
    80007a4c:	00d70023          	sb	a3,0(a4)
    80007a50:	fec798e3          	bne	a5,a2,80007a40 <__memmove+0x12c>
    80007a54:	00813403          	ld	s0,8(sp)
    80007a58:	01010113          	addi	sp,sp,16
    80007a5c:	00008067          	ret
    80007a60:	02069713          	slli	a4,a3,0x20
    80007a64:	02075713          	srli	a4,a4,0x20
    80007a68:	00170713          	addi	a4,a4,1
    80007a6c:	00e50733          	add	a4,a0,a4
    80007a70:	00050793          	mv	a5,a0
    80007a74:	0005c683          	lbu	a3,0(a1)
    80007a78:	00178793          	addi	a5,a5,1
    80007a7c:	00158593          	addi	a1,a1,1
    80007a80:	fed78fa3          	sb	a3,-1(a5)
    80007a84:	fee798e3          	bne	a5,a4,80007a74 <__memmove+0x160>
    80007a88:	f89ff06f          	j	80007a10 <__memmove+0xfc>

0000000080007a8c <__putc>:
    80007a8c:	fe010113          	addi	sp,sp,-32
    80007a90:	00813823          	sd	s0,16(sp)
    80007a94:	00113c23          	sd	ra,24(sp)
    80007a98:	02010413          	addi	s0,sp,32
    80007a9c:	00050793          	mv	a5,a0
    80007aa0:	fef40593          	addi	a1,s0,-17
    80007aa4:	00100613          	li	a2,1
    80007aa8:	00000513          	li	a0,0
    80007aac:	fef407a3          	sb	a5,-17(s0)
    80007ab0:	fffff097          	auipc	ra,0xfffff
    80007ab4:	b3c080e7          	jalr	-1220(ra) # 800065ec <console_write>
    80007ab8:	01813083          	ld	ra,24(sp)
    80007abc:	01013403          	ld	s0,16(sp)
    80007ac0:	02010113          	addi	sp,sp,32
    80007ac4:	00008067          	ret

0000000080007ac8 <__getc>:
    80007ac8:	fe010113          	addi	sp,sp,-32
    80007acc:	00813823          	sd	s0,16(sp)
    80007ad0:	00113c23          	sd	ra,24(sp)
    80007ad4:	02010413          	addi	s0,sp,32
    80007ad8:	fe840593          	addi	a1,s0,-24
    80007adc:	00100613          	li	a2,1
    80007ae0:	00000513          	li	a0,0
    80007ae4:	fffff097          	auipc	ra,0xfffff
    80007ae8:	ae8080e7          	jalr	-1304(ra) # 800065cc <console_read>
    80007aec:	fe844503          	lbu	a0,-24(s0)
    80007af0:	01813083          	ld	ra,24(sp)
    80007af4:	01013403          	ld	s0,16(sp)
    80007af8:	02010113          	addi	sp,sp,32
    80007afc:	00008067          	ret

0000000080007b00 <console_handler>:
    80007b00:	fe010113          	addi	sp,sp,-32
    80007b04:	00813823          	sd	s0,16(sp)
    80007b08:	00113c23          	sd	ra,24(sp)
    80007b0c:	00913423          	sd	s1,8(sp)
    80007b10:	02010413          	addi	s0,sp,32
    80007b14:	14202773          	csrr	a4,scause
    80007b18:	100027f3          	csrr	a5,sstatus
    80007b1c:	0027f793          	andi	a5,a5,2
    80007b20:	06079e63          	bnez	a5,80007b9c <console_handler+0x9c>
    80007b24:	00074c63          	bltz	a4,80007b3c <console_handler+0x3c>
    80007b28:	01813083          	ld	ra,24(sp)
    80007b2c:	01013403          	ld	s0,16(sp)
    80007b30:	00813483          	ld	s1,8(sp)
    80007b34:	02010113          	addi	sp,sp,32
    80007b38:	00008067          	ret
    80007b3c:	0ff77713          	andi	a4,a4,255
    80007b40:	00900793          	li	a5,9
    80007b44:	fef712e3          	bne	a4,a5,80007b28 <console_handler+0x28>
    80007b48:	ffffe097          	auipc	ra,0xffffe
    80007b4c:	6dc080e7          	jalr	1756(ra) # 80006224 <plic_claim>
    80007b50:	00a00793          	li	a5,10
    80007b54:	00050493          	mv	s1,a0
    80007b58:	02f50c63          	beq	a0,a5,80007b90 <console_handler+0x90>
    80007b5c:	fc0506e3          	beqz	a0,80007b28 <console_handler+0x28>
    80007b60:	00050593          	mv	a1,a0
    80007b64:	00001517          	auipc	a0,0x1
    80007b68:	a0450513          	addi	a0,a0,-1532 # 80008568 <_ZL6digits+0xe8>
    80007b6c:	fffff097          	auipc	ra,0xfffff
    80007b70:	afc080e7          	jalr	-1284(ra) # 80006668 <__printf>
    80007b74:	01013403          	ld	s0,16(sp)
    80007b78:	01813083          	ld	ra,24(sp)
    80007b7c:	00048513          	mv	a0,s1
    80007b80:	00813483          	ld	s1,8(sp)
    80007b84:	02010113          	addi	sp,sp,32
    80007b88:	ffffe317          	auipc	t1,0xffffe
    80007b8c:	6d430067          	jr	1748(t1) # 8000625c <plic_complete>
    80007b90:	fffff097          	auipc	ra,0xfffff
    80007b94:	3e0080e7          	jalr	992(ra) # 80006f70 <uartintr>
    80007b98:	fddff06f          	j	80007b74 <console_handler+0x74>
    80007b9c:	00001517          	auipc	a0,0x1
    80007ba0:	acc50513          	addi	a0,a0,-1332 # 80008668 <digits+0x78>
    80007ba4:	fffff097          	auipc	ra,0xfffff
    80007ba8:	a68080e7          	jalr	-1432(ra) # 8000660c <panic>
	...
