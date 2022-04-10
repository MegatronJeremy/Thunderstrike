
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00004117          	auipc	sp,0x4
    80000004:	39013103          	ld	sp,912(sp) # 80004390 <_GLOBAL_OFFSET_TABLE_+0x10>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	4c8010ef          	jal	ra,800014e4 <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <supervisorTrap>:
.extern handleSupervisorTrap
.global supervisorTrap
.align 4
supervisorTrap:
    addi sp, sp, -8
    80001000:	ff810113          	addi	sp,sp,-8
    sd ra, 0x00(sp)
    80001004:	00113023          	sd	ra,0(sp)

    call handleSupervisorTrap
    80001008:	1cc000ef          	jal	ra,800011d4 <handleSupervisorTrap>

    ld ra, 0x00(sp)
    8000100c:	00013083          	ld	ra,0(sp)
    addi sp, sp, 8
    80001010:	00810113          	addi	sp,sp,8

    csrr t0, sepc
    80001014:	141022f3          	csrr	t0,sepc
    addi t0, t0, 4
    80001018:	00428293          	addi	t0,t0,4
    csrw sepc, t0
    8000101c:	14129073          	csrw	sepc,t0

    80001020:	10200073          	sret
	...

0000000080001030 <main>:
#include "../h/syscall_c.h"

void main() {
    80001030:	fd010113          	addi	sp,sp,-48
    80001034:	02113423          	sd	ra,40(sp)
    80001038:	02813023          	sd	s0,32(sp)
    8000103c:	00913c23          	sd	s1,24(sp)
    80001040:	01213823          	sd	s2,16(sp)
    80001044:	01313423          	sd	s3,8(sp)
    80001048:	03010413          	addi	s0,sp,48
    __asm__ volatile("csrw stvec, %[vector]" : : [vector] "r" (&supervisorTrap));
    8000104c:	00000797          	auipc	a5,0x0
    80001050:	fb478793          	addi	a5,a5,-76 # 80001000 <supervisorTrap>
    80001054:	10579073          	csrw	stvec,a5

    void *a = mem_alloc(100);
    80001058:	06400513          	li	a0,100
    8000105c:	00000097          	auipc	ra,0x0
    80001060:	08c080e7          	jalr	140(ra) # 800010e8 <mem_alloc>
    80001064:	00050913          	mv	s2,a0
    void *b = mem_alloc(1000);
    80001068:	3e800513          	li	a0,1000
    8000106c:	00000097          	auipc	ra,0x0
    80001070:	07c080e7          	jalr	124(ra) # 800010e8 <mem_alloc>
    80001074:	00050993          	mv	s3,a0
    void *c = mem_alloc(10000);
    80001078:	00002537          	lui	a0,0x2
    8000107c:	71050513          	addi	a0,a0,1808 # 2710 <_entry-0x7fffd8f0>
    80001080:	00000097          	auipc	ra,0x0
    80001084:	068080e7          	jalr	104(ra) # 800010e8 <mem_alloc>
    80001088:	00050493          	mv	s1,a0
    mem_free(b);
    8000108c:	00098513          	mv	a0,s3
    80001090:	00000097          	auipc	ra,0x0
    80001094:	08c080e7          	jalr	140(ra) # 8000111c <mem_free>
    mem_free(a);
    80001098:	00090513          	mv	a0,s2
    8000109c:	00000097          	auipc	ra,0x0
    800010a0:	080080e7          	jalr	128(ra) # 8000111c <mem_free>
    mem_free(c);
    800010a4:	00048513          	mv	a0,s1
    800010a8:	00000097          	auipc	ra,0x0
    800010ac:	074080e7          	jalr	116(ra) # 8000111c <mem_free>
}
    800010b0:	02813083          	ld	ra,40(sp)
    800010b4:	02013403          	ld	s0,32(sp)
    800010b8:	01813483          	ld	s1,24(sp)
    800010bc:	01013903          	ld	s2,16(sp)
    800010c0:	00813983          	ld	s3,8(sp)
    800010c4:	03010113          	addi	sp,sp,48
    800010c8:	00008067          	ret

00000000800010cc <callSupervisorTrap>:
#include "../h/syscall_c.h"

uint64 pc;

void callSupervisorTrap(uint code, void *args) {
    800010cc:	ff010113          	addi	sp,sp,-16
    800010d0:	00813423          	sd	s0,8(sp)
    800010d4:	01010413          	addi	s0,sp,16
    __asm__ volatile ("ecall");
    800010d8:	00000073          	ecall
}
    800010dc:	00813403          	ld	s0,8(sp)
    800010e0:	01010113          	addi	sp,sp,16
    800010e4:	00008067          	ret

00000000800010e8 <mem_alloc>:

void *mem_alloc(size_t size) {
    800010e8:	ff010113          	addi	sp,sp,-16
    800010ec:	00113423          	sd	ra,8(sp)
    800010f0:	00813023          	sd	s0,0(sp)
    800010f4:	01010413          	addi	s0,sp,16
    size *= MEM_BLOCK_SIZE;
    callSupervisorTrap(0x01, (void *) size);
    800010f8:	00651593          	slli	a1,a0,0x6
    800010fc:	00100513          	li	a0,1
    80001100:	00000097          	auipc	ra,0x0
    80001104:	fcc080e7          	jalr	-52(ra) # 800010cc <callSupervisorTrap>

    void *ret;
    __asm__ volatile ("sd x10, 0(%[address])" : [address] "=r" (ret));
    80001108:	00a53023          	sd	a0,0(a0)
    return ret;
}
    8000110c:	00813083          	ld	ra,8(sp)
    80001110:	00013403          	ld	s0,0(sp)
    80001114:	01010113          	addi	sp,sp,16
    80001118:	00008067          	ret

000000008000111c <mem_free>:

int mem_free(void *addr) {
    8000111c:	ff010113          	addi	sp,sp,-16
    80001120:	00113423          	sd	ra,8(sp)
    80001124:	00813023          	sd	s0,0(sp)
    80001128:	01010413          	addi	s0,sp,16
    8000112c:	00050593          	mv	a1,a0
    callSupervisorTrap(0x02, addr);
    80001130:	00200513          	li	a0,2
    80001134:	00000097          	auipc	ra,0x0
    80001138:	f98080e7          	jalr	-104(ra) # 800010cc <callSupervisorTrap>

    int ret;
    __asm__ volatile ("sd x10, 0(%[address])" : [address] "=r" (ret));
    8000113c:	00a53023          	sd	a0,0(a0)
    return ret;
}
    80001140:	0005051b          	sext.w	a0,a0
    80001144:	00813083          	ld	ra,8(sp)
    80001148:	00013403          	ld	s0,0(sp)
    8000114c:	01010113          	addi	sp,sp,16
    80001150:	00008067          	ret

0000000080001154 <_Z10kmem_allocm>:
        case (0x02): kmem_free(args); break;
        default: return;
    }
}

void *kmem_alloc(size_t size) {
    80001154:	fe010113          	addi	sp,sp,-32
    80001158:	00113c23          	sd	ra,24(sp)
    8000115c:	00813823          	sd	s0,16(sp)
    80001160:	00913423          	sd	s1,8(sp)
    80001164:	02010413          	addi	s0,sp,32
    80001168:	00050493          	mv	s1,a0
    return MemoryAllocator::getInstance()->malloc(size);
    8000116c:	00000097          	auipc	ra,0x0
    80001170:	120080e7          	jalr	288(ra) # 8000128c <_ZN15MemoryAllocator11getInstanceEv>
    80001174:	00048593          	mv	a1,s1
    80001178:	00000097          	auipc	ra,0x0
    8000117c:	15c080e7          	jalr	348(ra) # 800012d4 <_ZN15MemoryAllocator6mallocEm>
}
    80001180:	01813083          	ld	ra,24(sp)
    80001184:	01013403          	ld	s0,16(sp)
    80001188:	00813483          	ld	s1,8(sp)
    8000118c:	02010113          	addi	sp,sp,32
    80001190:	00008067          	ret

0000000080001194 <_Z9kmem_freePv>:

int kmem_free(void *addr) {
    80001194:	fe010113          	addi	sp,sp,-32
    80001198:	00113c23          	sd	ra,24(sp)
    8000119c:	00813823          	sd	s0,16(sp)
    800011a0:	00913423          	sd	s1,8(sp)
    800011a4:	02010413          	addi	s0,sp,32
    800011a8:	00050493          	mv	s1,a0
    return MemoryAllocator::getInstance()->free(addr);
    800011ac:	00000097          	auipc	ra,0x0
    800011b0:	0e0080e7          	jalr	224(ra) # 8000128c <_ZN15MemoryAllocator11getInstanceEv>
    800011b4:	00048593          	mv	a1,s1
    800011b8:	00000097          	auipc	ra,0x0
    800011bc:	234080e7          	jalr	564(ra) # 800013ec <_ZN15MemoryAllocator4freeEPv>
}
    800011c0:	01813083          	ld	ra,24(sp)
    800011c4:	01013403          	ld	s0,16(sp)
    800011c8:	00813483          	ld	s1,8(sp)
    800011cc:	02010113          	addi	sp,sp,32
    800011d0:	00008067          	ret

00000000800011d4 <handleSupervisorTrap>:
void handleSupervisorTrap(uint code, void *args) {
    800011d4:	ff010113          	addi	sp,sp,-16
    800011d8:	00113423          	sd	ra,8(sp)
    800011dc:	00813023          	sd	s0,0(sp)
    800011e0:	01010413          	addi	s0,sp,16
    800011e4:	00050793          	mv	a5,a0
    800011e8:	00058513          	mv	a0,a1
    switch (code) {
    800011ec:	00100713          	li	a4,1
    800011f0:	00e78e63          	beq	a5,a4,8000120c <handleSupervisorTrap+0x38>
    800011f4:	00200713          	li	a4,2
    800011f8:	02e78063          	beq	a5,a4,80001218 <handleSupervisorTrap+0x44>
}
    800011fc:	00813083          	ld	ra,8(sp)
    80001200:	00013403          	ld	s0,0(sp)
    80001204:	01010113          	addi	sp,sp,16
    80001208:	00008067          	ret
        case (0x01): kmem_alloc((size_t) args); break;
    8000120c:	00000097          	auipc	ra,0x0
    80001210:	f48080e7          	jalr	-184(ra) # 80001154 <_Z10kmem_allocm>
    80001214:	fe9ff06f          	j	800011fc <handleSupervisorTrap+0x28>
        case (0x02): kmem_free(args); break;
    80001218:	00000097          	auipc	ra,0x0
    8000121c:	f7c080e7          	jalr	-132(ra) # 80001194 <_Z9kmem_freePv>
    80001220:	fddff06f          	j	800011fc <handleSupervisorTrap+0x28>

0000000080001224 <_ZN15MemoryAllocator19initMemoryAllocatorEv>:
#include "../h/MemoryAllocator.h"

MemoryAllocator *MemoryAllocator::instance = nullptr;

void MemoryAllocator::initMemoryAllocator() {
    80001224:	ff010113          	addi	sp,sp,-16
    80001228:	00813423          	sd	s0,8(sp)
    8000122c:	01010413          	addi	s0,sp,16
    instance = (MemoryAllocator *) HEAP_START_ADDR;
    80001230:	00003697          	auipc	a3,0x3
    80001234:	1586b683          	ld	a3,344(a3) # 80004388 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001238:	0006b703          	ld	a4,0(a3)
    8000123c:	00003617          	auipc	a2,0x3
    80001240:	1a460613          	addi	a2,a2,420 # 800043e0 <_ZN15MemoryAllocator8instanceE>
    80001244:	00e63023          	sd	a4,0(a2)

    instance->freeMemSize = (uint8 *) HEAP_END_ADDR - (uint8 *) HEAP_START_ADDR - MEM_BLOCK_SIZE;
    80001248:	00003797          	auipc	a5,0x3
    8000124c:	1507b783          	ld	a5,336(a5) # 80004398 <_GLOBAL_OFFSET_TABLE_+0x18>
    80001250:	0007b783          	ld	a5,0(a5)
    80001254:	40e787b3          	sub	a5,a5,a4
    80001258:	fc078793          	addi	a5,a5,-64
    8000125c:	00f73023          	sd	a5,0(a4)

    instance->segDescHead = (FreeSegDesc *) ((uint8 *) HEAP_START_ADDR + MEM_BLOCK_SIZE);
    80001260:	00063783          	ld	a5,0(a2)
    80001264:	0006b703          	ld	a4,0(a3)
    80001268:	04070693          	addi	a3,a4,64
    8000126c:	00d7b423          	sd	a3,8(a5)
    instance->segDescHead->size = instance->freeMemSize;
    80001270:	0007b683          	ld	a3,0(a5)
    80001274:	04d73023          	sd	a3,64(a4)
    instance->segDescHead->next = nullptr;
    80001278:	0087b783          	ld	a5,8(a5)
    8000127c:	0007b423          	sd	zero,8(a5)
}
    80001280:	00813403          	ld	s0,8(sp)
    80001284:	01010113          	addi	sp,sp,16
    80001288:	00008067          	ret

000000008000128c <_ZN15MemoryAllocator11getInstanceEv>:

MemoryAllocator *MemoryAllocator::getInstance() {
    if (!instance) initMemoryAllocator();
    8000128c:	00003797          	auipc	a5,0x3
    80001290:	1547b783          	ld	a5,340(a5) # 800043e0 <_ZN15MemoryAllocator8instanceE>
    80001294:	00078863          	beqz	a5,800012a4 <_ZN15MemoryAllocator11getInstanceEv+0x18>

    return instance;
}
    80001298:	00003517          	auipc	a0,0x3
    8000129c:	14853503          	ld	a0,328(a0) # 800043e0 <_ZN15MemoryAllocator8instanceE>
    800012a0:	00008067          	ret
MemoryAllocator *MemoryAllocator::getInstance() {
    800012a4:	ff010113          	addi	sp,sp,-16
    800012a8:	00113423          	sd	ra,8(sp)
    800012ac:	00813023          	sd	s0,0(sp)
    800012b0:	01010413          	addi	s0,sp,16
    if (!instance) initMemoryAllocator();
    800012b4:	00000097          	auipc	ra,0x0
    800012b8:	f70080e7          	jalr	-144(ra) # 80001224 <_ZN15MemoryAllocator19initMemoryAllocatorEv>
}
    800012bc:	00003517          	auipc	a0,0x3
    800012c0:	12453503          	ld	a0,292(a0) # 800043e0 <_ZN15MemoryAllocator8instanceE>
    800012c4:	00813083          	ld	ra,8(sp)
    800012c8:	00013403          	ld	s0,0(sp)
    800012cc:	01010113          	addi	sp,sp,16
    800012d0:	00008067          	ret

00000000800012d4 <_ZN15MemoryAllocator6mallocEm>:

void *MemoryAllocator::malloc(size_t size) {
    800012d4:	ff010113          	addi	sp,sp,-16
    800012d8:	00813423          	sd	s0,8(sp)
    800012dc:	01010413          	addi	s0,sp,16
    if (size <= 0 || size + MEM_BLOCK_SIZE > freeMemSize) return nullptr;
    800012e0:	08058e63          	beqz	a1,8000137c <_ZN15MemoryAllocator6mallocEm+0xa8>
    800012e4:	00050693          	mv	a3,a0
    800012e8:	04058593          	addi	a1,a1,64
    800012ec:	00053603          	ld	a2,0(a0)
    800012f0:	08b66a63          	bltu	a2,a1,80001384 <_ZN15MemoryAllocator6mallocEm+0xb0>
    size += MEM_BLOCK_SIZE;

    FreeSegDesc *curr = segDescHead, *prev = nullptr;
    800012f4:	00853503          	ld	a0,8(a0)
    800012f8:	00000713          	li	a4,0
    while (curr) {
    800012fc:	00050c63          	beqz	a0,80001314 <_ZN15MemoryAllocator6mallocEm+0x40>
        if (size <= curr->size) break;
    80001300:	00053783          	ld	a5,0(a0)
    80001304:	00b7f863          	bgeu	a5,a1,80001314 <_ZN15MemoryAllocator6mallocEm+0x40>
        prev = curr;
    80001308:	00050713          	mv	a4,a0
        curr = curr->next;
    8000130c:	00853503          	ld	a0,8(a0)
    while (curr) {
    80001310:	fedff06f          	j	800012fc <_ZN15MemoryAllocator6mallocEm+0x28>
    }
    if (!curr) return nullptr;
    80001314:	04050463          	beqz	a0,8000135c <_ZN15MemoryAllocator6mallocEm+0x88>

    freeMemSize -= size;
    80001318:	40b60633          	sub	a2,a2,a1
    8000131c:	00c6b023          	sd	a2,0(a3)

    (!prev ? segDescHead : prev->next) = curr->next;
    80001320:	04070463          	beqz	a4,80001368 <_ZN15MemoryAllocator6mallocEm+0x94>
    80001324:	00853783          	ld	a5,8(a0)
    80001328:	00f73423          	sd	a5,8(a4)

    void *addr = (uint8 *) curr + size;
    8000132c:	00b50633          	add	a2,a0,a1

    if (curr->size - size >= MEM_BLOCK_SIZE) {
    80001330:	00053783          	ld	a5,0(a0)
    80001334:	40b787b3          	sub	a5,a5,a1
    80001338:	03f00813          	li	a6,63
    8000133c:	00f87c63          	bgeu	a6,a5,80001354 <_ZN15MemoryAllocator6mallocEm+0x80>
        FreeSegDesc *elem = (FreeSegDesc *) addr;
        elem->size = curr->size - size;
    80001340:	00f63023          	sd	a5,0(a2)
        elem->next = curr->next;
    80001344:	00853783          	ld	a5,8(a0)
    80001348:	00f63423          	sd	a5,8(a2)
        (!prev ? segDescHead : prev->next) = elem;
    8000134c:	02070463          	beqz	a4,80001374 <_ZN15MemoryAllocator6mallocEm+0xa0>
    80001350:	00c73423          	sd	a2,8(a4)
    }

    *(size_t *) curr = size;
    80001354:	00b53023          	sd	a1,0(a0)

    return (uint8 *) curr + MEM_BLOCK_SIZE;
    80001358:	04050513          	addi	a0,a0,64
}
    8000135c:	00813403          	ld	s0,8(sp)
    80001360:	01010113          	addi	sp,sp,16
    80001364:	00008067          	ret
    (!prev ? segDescHead : prev->next) = curr->next;
    80001368:	00853783          	ld	a5,8(a0)
    8000136c:	00f6b423          	sd	a5,8(a3)
    80001370:	fbdff06f          	j	8000132c <_ZN15MemoryAllocator6mallocEm+0x58>
        (!prev ? segDescHead : prev->next) = elem;
    80001374:	00c6b423          	sd	a2,8(a3)
    80001378:	fddff06f          	j	80001354 <_ZN15MemoryAllocator6mallocEm+0x80>
    if (size <= 0 || size + MEM_BLOCK_SIZE > freeMemSize) return nullptr;
    8000137c:	00000513          	li	a0,0
    80001380:	fddff06f          	j	8000135c <_ZN15MemoryAllocator6mallocEm+0x88>
    80001384:	00000513          	li	a0,0
    80001388:	fd5ff06f          	j	8000135c <_ZN15MemoryAllocator6mallocEm+0x88>

000000008000138c <_ZN15MemoryAllocator9tryToJoinEPNS_11FreeSegDescE>:
    tryToJoin(prev);

    return 0;
}

int MemoryAllocator::tryToJoin(MemoryAllocator::FreeSegDesc *curr) {
    8000138c:	ff010113          	addi	sp,sp,-16
    80001390:	00813423          	sd	s0,8(sp)
    80001394:	01010413          	addi	s0,sp,16
    if (!curr || !curr->next) return -1;
    80001398:	02050e63          	beqz	a0,800013d4 <_ZN15MemoryAllocator9tryToJoinEPNS_11FreeSegDescE+0x48>
    8000139c:	00853783          	ld	a5,8(a0)
    800013a0:	02078e63          	beqz	a5,800013dc <_ZN15MemoryAllocator9tryToJoinEPNS_11FreeSegDescE+0x50>

    if ((uint8 *) curr + curr->size != (uint8 *) curr->next) return -1;
    800013a4:	00053703          	ld	a4,0(a0)
    800013a8:	00e506b3          	add	a3,a0,a4
    800013ac:	02d79c63          	bne	a5,a3,800013e4 <_ZN15MemoryAllocator9tryToJoinEPNS_11FreeSegDescE+0x58>

    curr->size += curr->next->size;
    800013b0:	0007b683          	ld	a3,0(a5)
    800013b4:	00d70733          	add	a4,a4,a3
    800013b8:	00e53023          	sd	a4,0(a0)
    curr->next = curr->next->next;
    800013bc:	0087b783          	ld	a5,8(a5)
    800013c0:	00f53423          	sd	a5,8(a0)

    return 0;
    800013c4:	00000513          	li	a0,0
}
    800013c8:	00813403          	ld	s0,8(sp)
    800013cc:	01010113          	addi	sp,sp,16
    800013d0:	00008067          	ret
    if (!curr || !curr->next) return -1;
    800013d4:	fff00513          	li	a0,-1
    800013d8:	ff1ff06f          	j	800013c8 <_ZN15MemoryAllocator9tryToJoinEPNS_11FreeSegDescE+0x3c>
    800013dc:	fff00513          	li	a0,-1
    800013e0:	fe9ff06f          	j	800013c8 <_ZN15MemoryAllocator9tryToJoinEPNS_11FreeSegDescE+0x3c>
    if ((uint8 *) curr + curr->size != (uint8 *) curr->next) return -1;
    800013e4:	fff00513          	li	a0,-1
    800013e8:	fe1ff06f          	j	800013c8 <_ZN15MemoryAllocator9tryToJoinEPNS_11FreeSegDescE+0x3c>

00000000800013ec <_ZN15MemoryAllocator4freeEPv>:
    if (!addr || (uint8 *)addr < (uint8 *)HEAP_START_ADDR + 2 * MEM_BLOCK_SIZE || addr >= HEAP_END_ADDR) return -1;
    800013ec:	0c058863          	beqz	a1,800014bc <_ZN15MemoryAllocator4freeEPv+0xd0>
    800013f0:	00050713          	mv	a4,a0
    800013f4:	00003797          	auipc	a5,0x3
    800013f8:	f947b783          	ld	a5,-108(a5) # 80004388 <_GLOBAL_OFFSET_TABLE_+0x8>
    800013fc:	0007b783          	ld	a5,0(a5)
    80001400:	08078793          	addi	a5,a5,128
    80001404:	0cf5e063          	bltu	a1,a5,800014c4 <_ZN15MemoryAllocator4freeEPv+0xd8>
    80001408:	00003797          	auipc	a5,0x3
    8000140c:	f907b783          	ld	a5,-112(a5) # 80004398 <_GLOBAL_OFFSET_TABLE_+0x18>
    80001410:	0007b783          	ld	a5,0(a5)
    80001414:	0af5fc63          	bgeu	a1,a5,800014cc <_ZN15MemoryAllocator4freeEPv+0xe0>
int MemoryAllocator::free(void *addr) {
    80001418:	fe010113          	addi	sp,sp,-32
    8000141c:	00113c23          	sd	ra,24(sp)
    80001420:	00813823          	sd	s0,16(sp)
    80001424:	00913423          	sd	s1,8(sp)
    80001428:	02010413          	addi	s0,sp,32
    addr = (uint8 *) addr - MEM_BLOCK_SIZE;
    8000142c:	fc058513          	addi	a0,a1,-64
    size_t size = *(size_t *) addr;
    80001430:	fc05b683          	ld	a3,-64(a1)
    FreeSegDesc *curr = segDescHead, *prev = nullptr;
    80001434:	00873783          	ld	a5,8(a4)
    80001438:	00000493          	li	s1,0
    while (curr && curr < addr) {
    8000143c:	00078a63          	beqz	a5,80001450 <_ZN15MemoryAllocator4freeEPv+0x64>
    80001440:	00a7f863          	bgeu	a5,a0,80001450 <_ZN15MemoryAllocator4freeEPv+0x64>
        prev = curr;
    80001444:	00078493          	mv	s1,a5
        curr = curr->next;
    80001448:	0087b783          	ld	a5,8(a5)
    while (curr && curr < addr) {
    8000144c:	ff1ff06f          	j	8000143c <_ZN15MemoryAllocator4freeEPv+0x50>
    if ((prev && (uint8 *) prev + prev->size > addr) || (curr && (uint8 *) addr + size > (uint8 *) curr))
    80001450:	00048863          	beqz	s1,80001460 <_ZN15MemoryAllocator4freeEPv+0x74>
    80001454:	0004b603          	ld	a2,0(s1)
    80001458:	00c48633          	add	a2,s1,a2
    8000145c:	06c56c63          	bltu	a0,a2,800014d4 <_ZN15MemoryAllocator4freeEPv+0xe8>
    80001460:	00078663          	beqz	a5,8000146c <_ZN15MemoryAllocator4freeEPv+0x80>
    80001464:	00d506b3          	add	a3,a0,a3
    80001468:	06d7ea63          	bltu	a5,a3,800014dc <_ZN15MemoryAllocator4freeEPv+0xf0>
    elem->next = curr;
    8000146c:	fcf5b423          	sd	a5,-56(a1)
    (!prev ? segDescHead : prev->next) = elem;
    80001470:	04048263          	beqz	s1,800014b4 <_ZN15MemoryAllocator4freeEPv+0xc8>
    80001474:	00a4b423          	sd	a0,8(s1)
    freeMemSize += elem->size;
    80001478:	fc05b683          	ld	a3,-64(a1)
    8000147c:	00073783          	ld	a5,0(a4)
    80001480:	00d787b3          	add	a5,a5,a3
    80001484:	00f73023          	sd	a5,0(a4)
    tryToJoin(elem);
    80001488:	00000097          	auipc	ra,0x0
    8000148c:	f04080e7          	jalr	-252(ra) # 8000138c <_ZN15MemoryAllocator9tryToJoinEPNS_11FreeSegDescE>
    tryToJoin(prev);
    80001490:	00048513          	mv	a0,s1
    80001494:	00000097          	auipc	ra,0x0
    80001498:	ef8080e7          	jalr	-264(ra) # 8000138c <_ZN15MemoryAllocator9tryToJoinEPNS_11FreeSegDescE>
    return 0;
    8000149c:	00000513          	li	a0,0
}
    800014a0:	01813083          	ld	ra,24(sp)
    800014a4:	01013403          	ld	s0,16(sp)
    800014a8:	00813483          	ld	s1,8(sp)
    800014ac:	02010113          	addi	sp,sp,32
    800014b0:	00008067          	ret
    (!prev ? segDescHead : prev->next) = elem;
    800014b4:	00a73423          	sd	a0,8(a4)
    800014b8:	fc1ff06f          	j	80001478 <_ZN15MemoryAllocator4freeEPv+0x8c>
    if (!addr || (uint8 *)addr < (uint8 *)HEAP_START_ADDR + 2 * MEM_BLOCK_SIZE || addr >= HEAP_END_ADDR) return -1;
    800014bc:	fff00513          	li	a0,-1
    800014c0:	00008067          	ret
    800014c4:	fff00513          	li	a0,-1
    800014c8:	00008067          	ret
    800014cc:	fff00513          	li	a0,-1
}
    800014d0:	00008067          	ret
        return -2;
    800014d4:	ffe00513          	li	a0,-2
    800014d8:	fc9ff06f          	j	800014a0 <_ZN15MemoryAllocator4freeEPv+0xb4>
    800014dc:	ffe00513          	li	a0,-2
    800014e0:	fc1ff06f          	j	800014a0 <_ZN15MemoryAllocator4freeEPv+0xb4>

00000000800014e4 <start>:
    800014e4:	ff010113          	addi	sp,sp,-16
    800014e8:	00813423          	sd	s0,8(sp)
    800014ec:	01010413          	addi	s0,sp,16
    800014f0:	300027f3          	csrr	a5,mstatus
    800014f4:	ffffe737          	lui	a4,0xffffe
    800014f8:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff91bf>
    800014fc:	00e7f7b3          	and	a5,a5,a4
    80001500:	00001737          	lui	a4,0x1
    80001504:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80001508:	00e7e7b3          	or	a5,a5,a4
    8000150c:	30079073          	csrw	mstatus,a5
    80001510:	00000797          	auipc	a5,0x0
    80001514:	16078793          	addi	a5,a5,352 # 80001670 <system_main>
    80001518:	34179073          	csrw	mepc,a5
    8000151c:	00000793          	li	a5,0
    80001520:	18079073          	csrw	satp,a5
    80001524:	000107b7          	lui	a5,0x10
    80001528:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    8000152c:	30279073          	csrw	medeleg,a5
    80001530:	30379073          	csrw	mideleg,a5
    80001534:	104027f3          	csrr	a5,sie
    80001538:	2227e793          	ori	a5,a5,546
    8000153c:	10479073          	csrw	sie,a5
    80001540:	fff00793          	li	a5,-1
    80001544:	00a7d793          	srli	a5,a5,0xa
    80001548:	3b079073          	csrw	pmpaddr0,a5
    8000154c:	00f00793          	li	a5,15
    80001550:	3a079073          	csrw	pmpcfg0,a5
    80001554:	f14027f3          	csrr	a5,mhartid
    80001558:	0200c737          	lui	a4,0x200c
    8000155c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80001560:	0007869b          	sext.w	a3,a5
    80001564:	00269713          	slli	a4,a3,0x2
    80001568:	000f4637          	lui	a2,0xf4
    8000156c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80001570:	00d70733          	add	a4,a4,a3
    80001574:	0037979b          	slliw	a5,a5,0x3
    80001578:	020046b7          	lui	a3,0x2004
    8000157c:	00d787b3          	add	a5,a5,a3
    80001580:	00c585b3          	add	a1,a1,a2
    80001584:	00371693          	slli	a3,a4,0x3
    80001588:	00003717          	auipc	a4,0x3
    8000158c:	e6870713          	addi	a4,a4,-408 # 800043f0 <timer_scratch>
    80001590:	00b7b023          	sd	a1,0(a5)
    80001594:	00d70733          	add	a4,a4,a3
    80001598:	00f73c23          	sd	a5,24(a4)
    8000159c:	02c73023          	sd	a2,32(a4)
    800015a0:	34071073          	csrw	mscratch,a4
    800015a4:	00000797          	auipc	a5,0x0
    800015a8:	6ec78793          	addi	a5,a5,1772 # 80001c90 <timervec>
    800015ac:	30579073          	csrw	mtvec,a5
    800015b0:	300027f3          	csrr	a5,mstatus
    800015b4:	0087e793          	ori	a5,a5,8
    800015b8:	30079073          	csrw	mstatus,a5
    800015bc:	304027f3          	csrr	a5,mie
    800015c0:	0807e793          	ori	a5,a5,128
    800015c4:	30479073          	csrw	mie,a5
    800015c8:	f14027f3          	csrr	a5,mhartid
    800015cc:	0007879b          	sext.w	a5,a5
    800015d0:	00078213          	mv	tp,a5
    800015d4:	30200073          	mret
    800015d8:	00813403          	ld	s0,8(sp)
    800015dc:	01010113          	addi	sp,sp,16
    800015e0:	00008067          	ret

00000000800015e4 <timerinit>:
    800015e4:	ff010113          	addi	sp,sp,-16
    800015e8:	00813423          	sd	s0,8(sp)
    800015ec:	01010413          	addi	s0,sp,16
    800015f0:	f14027f3          	csrr	a5,mhartid
    800015f4:	0200c737          	lui	a4,0x200c
    800015f8:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800015fc:	0007869b          	sext.w	a3,a5
    80001600:	00269713          	slli	a4,a3,0x2
    80001604:	000f4637          	lui	a2,0xf4
    80001608:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    8000160c:	00d70733          	add	a4,a4,a3
    80001610:	0037979b          	slliw	a5,a5,0x3
    80001614:	020046b7          	lui	a3,0x2004
    80001618:	00d787b3          	add	a5,a5,a3
    8000161c:	00c585b3          	add	a1,a1,a2
    80001620:	00371693          	slli	a3,a4,0x3
    80001624:	00003717          	auipc	a4,0x3
    80001628:	dcc70713          	addi	a4,a4,-564 # 800043f0 <timer_scratch>
    8000162c:	00b7b023          	sd	a1,0(a5)
    80001630:	00d70733          	add	a4,a4,a3
    80001634:	00f73c23          	sd	a5,24(a4)
    80001638:	02c73023          	sd	a2,32(a4)
    8000163c:	34071073          	csrw	mscratch,a4
    80001640:	00000797          	auipc	a5,0x0
    80001644:	65078793          	addi	a5,a5,1616 # 80001c90 <timervec>
    80001648:	30579073          	csrw	mtvec,a5
    8000164c:	300027f3          	csrr	a5,mstatus
    80001650:	0087e793          	ori	a5,a5,8
    80001654:	30079073          	csrw	mstatus,a5
    80001658:	304027f3          	csrr	a5,mie
    8000165c:	0807e793          	ori	a5,a5,128
    80001660:	30479073          	csrw	mie,a5
    80001664:	00813403          	ld	s0,8(sp)
    80001668:	01010113          	addi	sp,sp,16
    8000166c:	00008067          	ret

0000000080001670 <system_main>:
    80001670:	fe010113          	addi	sp,sp,-32
    80001674:	00813823          	sd	s0,16(sp)
    80001678:	00913423          	sd	s1,8(sp)
    8000167c:	00113c23          	sd	ra,24(sp)
    80001680:	02010413          	addi	s0,sp,32
    80001684:	00000097          	auipc	ra,0x0
    80001688:	0c4080e7          	jalr	196(ra) # 80001748 <cpuid>
    8000168c:	00003497          	auipc	s1,0x3
    80001690:	d2c48493          	addi	s1,s1,-724 # 800043b8 <started>
    80001694:	02050263          	beqz	a0,800016b8 <system_main+0x48>
    80001698:	0004a783          	lw	a5,0(s1)
    8000169c:	0007879b          	sext.w	a5,a5
    800016a0:	fe078ce3          	beqz	a5,80001698 <system_main+0x28>
    800016a4:	0ff0000f          	fence
    800016a8:	00003517          	auipc	a0,0x3
    800016ac:	9a850513          	addi	a0,a0,-1624 # 80004050 <CONSOLE_STATUS+0x40>
    800016b0:	00001097          	auipc	ra,0x1
    800016b4:	a7c080e7          	jalr	-1412(ra) # 8000212c <panic>
    800016b8:	00001097          	auipc	ra,0x1
    800016bc:	9d0080e7          	jalr	-1584(ra) # 80002088 <consoleinit>
    800016c0:	00001097          	auipc	ra,0x1
    800016c4:	15c080e7          	jalr	348(ra) # 8000281c <printfinit>
    800016c8:	00003517          	auipc	a0,0x3
    800016cc:	a6850513          	addi	a0,a0,-1432 # 80004130 <CONSOLE_STATUS+0x120>
    800016d0:	00001097          	auipc	ra,0x1
    800016d4:	ab8080e7          	jalr	-1352(ra) # 80002188 <__printf>
    800016d8:	00003517          	auipc	a0,0x3
    800016dc:	94850513          	addi	a0,a0,-1720 # 80004020 <CONSOLE_STATUS+0x10>
    800016e0:	00001097          	auipc	ra,0x1
    800016e4:	aa8080e7          	jalr	-1368(ra) # 80002188 <__printf>
    800016e8:	00003517          	auipc	a0,0x3
    800016ec:	a4850513          	addi	a0,a0,-1464 # 80004130 <CONSOLE_STATUS+0x120>
    800016f0:	00001097          	auipc	ra,0x1
    800016f4:	a98080e7          	jalr	-1384(ra) # 80002188 <__printf>
    800016f8:	00001097          	auipc	ra,0x1
    800016fc:	4b0080e7          	jalr	1200(ra) # 80002ba8 <kinit>
    80001700:	00000097          	auipc	ra,0x0
    80001704:	148080e7          	jalr	328(ra) # 80001848 <trapinit>
    80001708:	00000097          	auipc	ra,0x0
    8000170c:	16c080e7          	jalr	364(ra) # 80001874 <trapinithart>
    80001710:	00000097          	auipc	ra,0x0
    80001714:	5c0080e7          	jalr	1472(ra) # 80001cd0 <plicinit>
    80001718:	00000097          	auipc	ra,0x0
    8000171c:	5e0080e7          	jalr	1504(ra) # 80001cf8 <plicinithart>
    80001720:	00000097          	auipc	ra,0x0
    80001724:	078080e7          	jalr	120(ra) # 80001798 <userinit>
    80001728:	0ff0000f          	fence
    8000172c:	00100793          	li	a5,1
    80001730:	00003517          	auipc	a0,0x3
    80001734:	90850513          	addi	a0,a0,-1784 # 80004038 <CONSOLE_STATUS+0x28>
    80001738:	00f4a023          	sw	a5,0(s1)
    8000173c:	00001097          	auipc	ra,0x1
    80001740:	a4c080e7          	jalr	-1460(ra) # 80002188 <__printf>
    80001744:	0000006f          	j	80001744 <system_main+0xd4>

0000000080001748 <cpuid>:
    80001748:	ff010113          	addi	sp,sp,-16
    8000174c:	00813423          	sd	s0,8(sp)
    80001750:	01010413          	addi	s0,sp,16
    80001754:	00020513          	mv	a0,tp
    80001758:	00813403          	ld	s0,8(sp)
    8000175c:	0005051b          	sext.w	a0,a0
    80001760:	01010113          	addi	sp,sp,16
    80001764:	00008067          	ret

0000000080001768 <mycpu>:
    80001768:	ff010113          	addi	sp,sp,-16
    8000176c:	00813423          	sd	s0,8(sp)
    80001770:	01010413          	addi	s0,sp,16
    80001774:	00020793          	mv	a5,tp
    80001778:	00813403          	ld	s0,8(sp)
    8000177c:	0007879b          	sext.w	a5,a5
    80001780:	00779793          	slli	a5,a5,0x7
    80001784:	00004517          	auipc	a0,0x4
    80001788:	c9c50513          	addi	a0,a0,-868 # 80005420 <cpus>
    8000178c:	00f50533          	add	a0,a0,a5
    80001790:	01010113          	addi	sp,sp,16
    80001794:	00008067          	ret

0000000080001798 <userinit>:
    80001798:	ff010113          	addi	sp,sp,-16
    8000179c:	00813423          	sd	s0,8(sp)
    800017a0:	01010413          	addi	s0,sp,16
    800017a4:	00813403          	ld	s0,8(sp)
    800017a8:	01010113          	addi	sp,sp,16
    800017ac:	00000317          	auipc	t1,0x0
    800017b0:	88430067          	jr	-1916(t1) # 80001030 <main>

00000000800017b4 <either_copyout>:
    800017b4:	ff010113          	addi	sp,sp,-16
    800017b8:	00813023          	sd	s0,0(sp)
    800017bc:	00113423          	sd	ra,8(sp)
    800017c0:	01010413          	addi	s0,sp,16
    800017c4:	02051663          	bnez	a0,800017f0 <either_copyout+0x3c>
    800017c8:	00058513          	mv	a0,a1
    800017cc:	00060593          	mv	a1,a2
    800017d0:	0006861b          	sext.w	a2,a3
    800017d4:	00002097          	auipc	ra,0x2
    800017d8:	c60080e7          	jalr	-928(ra) # 80003434 <__memmove>
    800017dc:	00813083          	ld	ra,8(sp)
    800017e0:	00013403          	ld	s0,0(sp)
    800017e4:	00000513          	li	a0,0
    800017e8:	01010113          	addi	sp,sp,16
    800017ec:	00008067          	ret
    800017f0:	00003517          	auipc	a0,0x3
    800017f4:	88850513          	addi	a0,a0,-1912 # 80004078 <CONSOLE_STATUS+0x68>
    800017f8:	00001097          	auipc	ra,0x1
    800017fc:	934080e7          	jalr	-1740(ra) # 8000212c <panic>

0000000080001800 <either_copyin>:
    80001800:	ff010113          	addi	sp,sp,-16
    80001804:	00813023          	sd	s0,0(sp)
    80001808:	00113423          	sd	ra,8(sp)
    8000180c:	01010413          	addi	s0,sp,16
    80001810:	02059463          	bnez	a1,80001838 <either_copyin+0x38>
    80001814:	00060593          	mv	a1,a2
    80001818:	0006861b          	sext.w	a2,a3
    8000181c:	00002097          	auipc	ra,0x2
    80001820:	c18080e7          	jalr	-1000(ra) # 80003434 <__memmove>
    80001824:	00813083          	ld	ra,8(sp)
    80001828:	00013403          	ld	s0,0(sp)
    8000182c:	00000513          	li	a0,0
    80001830:	01010113          	addi	sp,sp,16
    80001834:	00008067          	ret
    80001838:	00003517          	auipc	a0,0x3
    8000183c:	86850513          	addi	a0,a0,-1944 # 800040a0 <CONSOLE_STATUS+0x90>
    80001840:	00001097          	auipc	ra,0x1
    80001844:	8ec080e7          	jalr	-1812(ra) # 8000212c <panic>

0000000080001848 <trapinit>:
    80001848:	ff010113          	addi	sp,sp,-16
    8000184c:	00813423          	sd	s0,8(sp)
    80001850:	01010413          	addi	s0,sp,16
    80001854:	00813403          	ld	s0,8(sp)
    80001858:	00003597          	auipc	a1,0x3
    8000185c:	87058593          	addi	a1,a1,-1936 # 800040c8 <CONSOLE_STATUS+0xb8>
    80001860:	00004517          	auipc	a0,0x4
    80001864:	c4050513          	addi	a0,a0,-960 # 800054a0 <tickslock>
    80001868:	01010113          	addi	sp,sp,16
    8000186c:	00001317          	auipc	t1,0x1
    80001870:	5cc30067          	jr	1484(t1) # 80002e38 <initlock>

0000000080001874 <trapinithart>:
    80001874:	ff010113          	addi	sp,sp,-16
    80001878:	00813423          	sd	s0,8(sp)
    8000187c:	01010413          	addi	s0,sp,16
    80001880:	00000797          	auipc	a5,0x0
    80001884:	30078793          	addi	a5,a5,768 # 80001b80 <kernelvec>
    80001888:	10579073          	csrw	stvec,a5
    8000188c:	00813403          	ld	s0,8(sp)
    80001890:	01010113          	addi	sp,sp,16
    80001894:	00008067          	ret

0000000080001898 <usertrap>:
    80001898:	ff010113          	addi	sp,sp,-16
    8000189c:	00813423          	sd	s0,8(sp)
    800018a0:	01010413          	addi	s0,sp,16
    800018a4:	00813403          	ld	s0,8(sp)
    800018a8:	01010113          	addi	sp,sp,16
    800018ac:	00008067          	ret

00000000800018b0 <usertrapret>:
    800018b0:	ff010113          	addi	sp,sp,-16
    800018b4:	00813423          	sd	s0,8(sp)
    800018b8:	01010413          	addi	s0,sp,16
    800018bc:	00813403          	ld	s0,8(sp)
    800018c0:	01010113          	addi	sp,sp,16
    800018c4:	00008067          	ret

00000000800018c8 <kerneltrap>:
    800018c8:	fe010113          	addi	sp,sp,-32
    800018cc:	00813823          	sd	s0,16(sp)
    800018d0:	00113c23          	sd	ra,24(sp)
    800018d4:	00913423          	sd	s1,8(sp)
    800018d8:	02010413          	addi	s0,sp,32
    800018dc:	142025f3          	csrr	a1,scause
    800018e0:	100027f3          	csrr	a5,sstatus
    800018e4:	0027f793          	andi	a5,a5,2
    800018e8:	10079c63          	bnez	a5,80001a00 <kerneltrap+0x138>
    800018ec:	142027f3          	csrr	a5,scause
    800018f0:	0207ce63          	bltz	a5,8000192c <kerneltrap+0x64>
    800018f4:	00003517          	auipc	a0,0x3
    800018f8:	81c50513          	addi	a0,a0,-2020 # 80004110 <CONSOLE_STATUS+0x100>
    800018fc:	00001097          	auipc	ra,0x1
    80001900:	88c080e7          	jalr	-1908(ra) # 80002188 <__printf>
    80001904:	141025f3          	csrr	a1,sepc
    80001908:	14302673          	csrr	a2,stval
    8000190c:	00003517          	auipc	a0,0x3
    80001910:	81450513          	addi	a0,a0,-2028 # 80004120 <CONSOLE_STATUS+0x110>
    80001914:	00001097          	auipc	ra,0x1
    80001918:	874080e7          	jalr	-1932(ra) # 80002188 <__printf>
    8000191c:	00003517          	auipc	a0,0x3
    80001920:	81c50513          	addi	a0,a0,-2020 # 80004138 <CONSOLE_STATUS+0x128>
    80001924:	00001097          	auipc	ra,0x1
    80001928:	808080e7          	jalr	-2040(ra) # 8000212c <panic>
    8000192c:	0ff7f713          	andi	a4,a5,255
    80001930:	00900693          	li	a3,9
    80001934:	04d70063          	beq	a4,a3,80001974 <kerneltrap+0xac>
    80001938:	fff00713          	li	a4,-1
    8000193c:	03f71713          	slli	a4,a4,0x3f
    80001940:	00170713          	addi	a4,a4,1
    80001944:	fae798e3          	bne	a5,a4,800018f4 <kerneltrap+0x2c>
    80001948:	00000097          	auipc	ra,0x0
    8000194c:	e00080e7          	jalr	-512(ra) # 80001748 <cpuid>
    80001950:	06050663          	beqz	a0,800019bc <kerneltrap+0xf4>
    80001954:	144027f3          	csrr	a5,sip
    80001958:	ffd7f793          	andi	a5,a5,-3
    8000195c:	14479073          	csrw	sip,a5
    80001960:	01813083          	ld	ra,24(sp)
    80001964:	01013403          	ld	s0,16(sp)
    80001968:	00813483          	ld	s1,8(sp)
    8000196c:	02010113          	addi	sp,sp,32
    80001970:	00008067          	ret
    80001974:	00000097          	auipc	ra,0x0
    80001978:	3d0080e7          	jalr	976(ra) # 80001d44 <plic_claim>
    8000197c:	00a00793          	li	a5,10
    80001980:	00050493          	mv	s1,a0
    80001984:	06f50863          	beq	a0,a5,800019f4 <kerneltrap+0x12c>
    80001988:	fc050ce3          	beqz	a0,80001960 <kerneltrap+0x98>
    8000198c:	00050593          	mv	a1,a0
    80001990:	00002517          	auipc	a0,0x2
    80001994:	76050513          	addi	a0,a0,1888 # 800040f0 <CONSOLE_STATUS+0xe0>
    80001998:	00000097          	auipc	ra,0x0
    8000199c:	7f0080e7          	jalr	2032(ra) # 80002188 <__printf>
    800019a0:	01013403          	ld	s0,16(sp)
    800019a4:	01813083          	ld	ra,24(sp)
    800019a8:	00048513          	mv	a0,s1
    800019ac:	00813483          	ld	s1,8(sp)
    800019b0:	02010113          	addi	sp,sp,32
    800019b4:	00000317          	auipc	t1,0x0
    800019b8:	3c830067          	jr	968(t1) # 80001d7c <plic_complete>
    800019bc:	00004517          	auipc	a0,0x4
    800019c0:	ae450513          	addi	a0,a0,-1308 # 800054a0 <tickslock>
    800019c4:	00001097          	auipc	ra,0x1
    800019c8:	498080e7          	jalr	1176(ra) # 80002e5c <acquire>
    800019cc:	00003717          	auipc	a4,0x3
    800019d0:	9f070713          	addi	a4,a4,-1552 # 800043bc <ticks>
    800019d4:	00072783          	lw	a5,0(a4)
    800019d8:	00004517          	auipc	a0,0x4
    800019dc:	ac850513          	addi	a0,a0,-1336 # 800054a0 <tickslock>
    800019e0:	0017879b          	addiw	a5,a5,1
    800019e4:	00f72023          	sw	a5,0(a4)
    800019e8:	00001097          	auipc	ra,0x1
    800019ec:	540080e7          	jalr	1344(ra) # 80002f28 <release>
    800019f0:	f65ff06f          	j	80001954 <kerneltrap+0x8c>
    800019f4:	00001097          	auipc	ra,0x1
    800019f8:	09c080e7          	jalr	156(ra) # 80002a90 <uartintr>
    800019fc:	fa5ff06f          	j	800019a0 <kerneltrap+0xd8>
    80001a00:	00002517          	auipc	a0,0x2
    80001a04:	6d050513          	addi	a0,a0,1744 # 800040d0 <CONSOLE_STATUS+0xc0>
    80001a08:	00000097          	auipc	ra,0x0
    80001a0c:	724080e7          	jalr	1828(ra) # 8000212c <panic>

0000000080001a10 <clockintr>:
    80001a10:	fe010113          	addi	sp,sp,-32
    80001a14:	00813823          	sd	s0,16(sp)
    80001a18:	00913423          	sd	s1,8(sp)
    80001a1c:	00113c23          	sd	ra,24(sp)
    80001a20:	02010413          	addi	s0,sp,32
    80001a24:	00004497          	auipc	s1,0x4
    80001a28:	a7c48493          	addi	s1,s1,-1412 # 800054a0 <tickslock>
    80001a2c:	00048513          	mv	a0,s1
    80001a30:	00001097          	auipc	ra,0x1
    80001a34:	42c080e7          	jalr	1068(ra) # 80002e5c <acquire>
    80001a38:	00003717          	auipc	a4,0x3
    80001a3c:	98470713          	addi	a4,a4,-1660 # 800043bc <ticks>
    80001a40:	00072783          	lw	a5,0(a4)
    80001a44:	01013403          	ld	s0,16(sp)
    80001a48:	01813083          	ld	ra,24(sp)
    80001a4c:	00048513          	mv	a0,s1
    80001a50:	0017879b          	addiw	a5,a5,1
    80001a54:	00813483          	ld	s1,8(sp)
    80001a58:	00f72023          	sw	a5,0(a4)
    80001a5c:	02010113          	addi	sp,sp,32
    80001a60:	00001317          	auipc	t1,0x1
    80001a64:	4c830067          	jr	1224(t1) # 80002f28 <release>

0000000080001a68 <devintr>:
    80001a68:	142027f3          	csrr	a5,scause
    80001a6c:	00000513          	li	a0,0
    80001a70:	0007c463          	bltz	a5,80001a78 <devintr+0x10>
    80001a74:	00008067          	ret
    80001a78:	fe010113          	addi	sp,sp,-32
    80001a7c:	00813823          	sd	s0,16(sp)
    80001a80:	00113c23          	sd	ra,24(sp)
    80001a84:	00913423          	sd	s1,8(sp)
    80001a88:	02010413          	addi	s0,sp,32
    80001a8c:	0ff7f713          	andi	a4,a5,255
    80001a90:	00900693          	li	a3,9
    80001a94:	04d70c63          	beq	a4,a3,80001aec <devintr+0x84>
    80001a98:	fff00713          	li	a4,-1
    80001a9c:	03f71713          	slli	a4,a4,0x3f
    80001aa0:	00170713          	addi	a4,a4,1
    80001aa4:	00e78c63          	beq	a5,a4,80001abc <devintr+0x54>
    80001aa8:	01813083          	ld	ra,24(sp)
    80001aac:	01013403          	ld	s0,16(sp)
    80001ab0:	00813483          	ld	s1,8(sp)
    80001ab4:	02010113          	addi	sp,sp,32
    80001ab8:	00008067          	ret
    80001abc:	00000097          	auipc	ra,0x0
    80001ac0:	c8c080e7          	jalr	-884(ra) # 80001748 <cpuid>
    80001ac4:	06050663          	beqz	a0,80001b30 <devintr+0xc8>
    80001ac8:	144027f3          	csrr	a5,sip
    80001acc:	ffd7f793          	andi	a5,a5,-3
    80001ad0:	14479073          	csrw	sip,a5
    80001ad4:	01813083          	ld	ra,24(sp)
    80001ad8:	01013403          	ld	s0,16(sp)
    80001adc:	00813483          	ld	s1,8(sp)
    80001ae0:	00200513          	li	a0,2
    80001ae4:	02010113          	addi	sp,sp,32
    80001ae8:	00008067          	ret
    80001aec:	00000097          	auipc	ra,0x0
    80001af0:	258080e7          	jalr	600(ra) # 80001d44 <plic_claim>
    80001af4:	00a00793          	li	a5,10
    80001af8:	00050493          	mv	s1,a0
    80001afc:	06f50663          	beq	a0,a5,80001b68 <devintr+0x100>
    80001b00:	00100513          	li	a0,1
    80001b04:	fa0482e3          	beqz	s1,80001aa8 <devintr+0x40>
    80001b08:	00048593          	mv	a1,s1
    80001b0c:	00002517          	auipc	a0,0x2
    80001b10:	5e450513          	addi	a0,a0,1508 # 800040f0 <CONSOLE_STATUS+0xe0>
    80001b14:	00000097          	auipc	ra,0x0
    80001b18:	674080e7          	jalr	1652(ra) # 80002188 <__printf>
    80001b1c:	00048513          	mv	a0,s1
    80001b20:	00000097          	auipc	ra,0x0
    80001b24:	25c080e7          	jalr	604(ra) # 80001d7c <plic_complete>
    80001b28:	00100513          	li	a0,1
    80001b2c:	f7dff06f          	j	80001aa8 <devintr+0x40>
    80001b30:	00004517          	auipc	a0,0x4
    80001b34:	97050513          	addi	a0,a0,-1680 # 800054a0 <tickslock>
    80001b38:	00001097          	auipc	ra,0x1
    80001b3c:	324080e7          	jalr	804(ra) # 80002e5c <acquire>
    80001b40:	00003717          	auipc	a4,0x3
    80001b44:	87c70713          	addi	a4,a4,-1924 # 800043bc <ticks>
    80001b48:	00072783          	lw	a5,0(a4)
    80001b4c:	00004517          	auipc	a0,0x4
    80001b50:	95450513          	addi	a0,a0,-1708 # 800054a0 <tickslock>
    80001b54:	0017879b          	addiw	a5,a5,1
    80001b58:	00f72023          	sw	a5,0(a4)
    80001b5c:	00001097          	auipc	ra,0x1
    80001b60:	3cc080e7          	jalr	972(ra) # 80002f28 <release>
    80001b64:	f65ff06f          	j	80001ac8 <devintr+0x60>
    80001b68:	00001097          	auipc	ra,0x1
    80001b6c:	f28080e7          	jalr	-216(ra) # 80002a90 <uartintr>
    80001b70:	fadff06f          	j	80001b1c <devintr+0xb4>
	...

0000000080001b80 <kernelvec>:
    80001b80:	f0010113          	addi	sp,sp,-256
    80001b84:	00113023          	sd	ra,0(sp)
    80001b88:	00213423          	sd	sp,8(sp)
    80001b8c:	00313823          	sd	gp,16(sp)
    80001b90:	00413c23          	sd	tp,24(sp)
    80001b94:	02513023          	sd	t0,32(sp)
    80001b98:	02613423          	sd	t1,40(sp)
    80001b9c:	02713823          	sd	t2,48(sp)
    80001ba0:	02813c23          	sd	s0,56(sp)
    80001ba4:	04913023          	sd	s1,64(sp)
    80001ba8:	04a13423          	sd	a0,72(sp)
    80001bac:	04b13823          	sd	a1,80(sp)
    80001bb0:	04c13c23          	sd	a2,88(sp)
    80001bb4:	06d13023          	sd	a3,96(sp)
    80001bb8:	06e13423          	sd	a4,104(sp)
    80001bbc:	06f13823          	sd	a5,112(sp)
    80001bc0:	07013c23          	sd	a6,120(sp)
    80001bc4:	09113023          	sd	a7,128(sp)
    80001bc8:	09213423          	sd	s2,136(sp)
    80001bcc:	09313823          	sd	s3,144(sp)
    80001bd0:	09413c23          	sd	s4,152(sp)
    80001bd4:	0b513023          	sd	s5,160(sp)
    80001bd8:	0b613423          	sd	s6,168(sp)
    80001bdc:	0b713823          	sd	s7,176(sp)
    80001be0:	0b813c23          	sd	s8,184(sp)
    80001be4:	0d913023          	sd	s9,192(sp)
    80001be8:	0da13423          	sd	s10,200(sp)
    80001bec:	0db13823          	sd	s11,208(sp)
    80001bf0:	0dc13c23          	sd	t3,216(sp)
    80001bf4:	0fd13023          	sd	t4,224(sp)
    80001bf8:	0fe13423          	sd	t5,232(sp)
    80001bfc:	0ff13823          	sd	t6,240(sp)
    80001c00:	cc9ff0ef          	jal	ra,800018c8 <kerneltrap>
    80001c04:	00013083          	ld	ra,0(sp)
    80001c08:	00813103          	ld	sp,8(sp)
    80001c0c:	01013183          	ld	gp,16(sp)
    80001c10:	02013283          	ld	t0,32(sp)
    80001c14:	02813303          	ld	t1,40(sp)
    80001c18:	03013383          	ld	t2,48(sp)
    80001c1c:	03813403          	ld	s0,56(sp)
    80001c20:	04013483          	ld	s1,64(sp)
    80001c24:	04813503          	ld	a0,72(sp)
    80001c28:	05013583          	ld	a1,80(sp)
    80001c2c:	05813603          	ld	a2,88(sp)
    80001c30:	06013683          	ld	a3,96(sp)
    80001c34:	06813703          	ld	a4,104(sp)
    80001c38:	07013783          	ld	a5,112(sp)
    80001c3c:	07813803          	ld	a6,120(sp)
    80001c40:	08013883          	ld	a7,128(sp)
    80001c44:	08813903          	ld	s2,136(sp)
    80001c48:	09013983          	ld	s3,144(sp)
    80001c4c:	09813a03          	ld	s4,152(sp)
    80001c50:	0a013a83          	ld	s5,160(sp)
    80001c54:	0a813b03          	ld	s6,168(sp)
    80001c58:	0b013b83          	ld	s7,176(sp)
    80001c5c:	0b813c03          	ld	s8,184(sp)
    80001c60:	0c013c83          	ld	s9,192(sp)
    80001c64:	0c813d03          	ld	s10,200(sp)
    80001c68:	0d013d83          	ld	s11,208(sp)
    80001c6c:	0d813e03          	ld	t3,216(sp)
    80001c70:	0e013e83          	ld	t4,224(sp)
    80001c74:	0e813f03          	ld	t5,232(sp)
    80001c78:	0f013f83          	ld	t6,240(sp)
    80001c7c:	10010113          	addi	sp,sp,256
    80001c80:	10200073          	sret
    80001c84:	00000013          	nop
    80001c88:	00000013          	nop
    80001c8c:	00000013          	nop

0000000080001c90 <timervec>:
    80001c90:	34051573          	csrrw	a0,mscratch,a0
    80001c94:	00b53023          	sd	a1,0(a0)
    80001c98:	00c53423          	sd	a2,8(a0)
    80001c9c:	00d53823          	sd	a3,16(a0)
    80001ca0:	01853583          	ld	a1,24(a0)
    80001ca4:	02053603          	ld	a2,32(a0)
    80001ca8:	0005b683          	ld	a3,0(a1)
    80001cac:	00c686b3          	add	a3,a3,a2
    80001cb0:	00d5b023          	sd	a3,0(a1)
    80001cb4:	00200593          	li	a1,2
    80001cb8:	14459073          	csrw	sip,a1
    80001cbc:	01053683          	ld	a3,16(a0)
    80001cc0:	00853603          	ld	a2,8(a0)
    80001cc4:	00053583          	ld	a1,0(a0)
    80001cc8:	34051573          	csrrw	a0,mscratch,a0
    80001ccc:	30200073          	mret

0000000080001cd0 <plicinit>:
    80001cd0:	ff010113          	addi	sp,sp,-16
    80001cd4:	00813423          	sd	s0,8(sp)
    80001cd8:	01010413          	addi	s0,sp,16
    80001cdc:	00813403          	ld	s0,8(sp)
    80001ce0:	0c0007b7          	lui	a5,0xc000
    80001ce4:	00100713          	li	a4,1
    80001ce8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    80001cec:	00e7a223          	sw	a4,4(a5)
    80001cf0:	01010113          	addi	sp,sp,16
    80001cf4:	00008067          	ret

0000000080001cf8 <plicinithart>:
    80001cf8:	ff010113          	addi	sp,sp,-16
    80001cfc:	00813023          	sd	s0,0(sp)
    80001d00:	00113423          	sd	ra,8(sp)
    80001d04:	01010413          	addi	s0,sp,16
    80001d08:	00000097          	auipc	ra,0x0
    80001d0c:	a40080e7          	jalr	-1472(ra) # 80001748 <cpuid>
    80001d10:	0085171b          	slliw	a4,a0,0x8
    80001d14:	0c0027b7          	lui	a5,0xc002
    80001d18:	00e787b3          	add	a5,a5,a4
    80001d1c:	40200713          	li	a4,1026
    80001d20:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80001d24:	00813083          	ld	ra,8(sp)
    80001d28:	00013403          	ld	s0,0(sp)
    80001d2c:	00d5151b          	slliw	a0,a0,0xd
    80001d30:	0c2017b7          	lui	a5,0xc201
    80001d34:	00a78533          	add	a0,a5,a0
    80001d38:	00052023          	sw	zero,0(a0)
    80001d3c:	01010113          	addi	sp,sp,16
    80001d40:	00008067          	ret

0000000080001d44 <plic_claim>:
    80001d44:	ff010113          	addi	sp,sp,-16
    80001d48:	00813023          	sd	s0,0(sp)
    80001d4c:	00113423          	sd	ra,8(sp)
    80001d50:	01010413          	addi	s0,sp,16
    80001d54:	00000097          	auipc	ra,0x0
    80001d58:	9f4080e7          	jalr	-1548(ra) # 80001748 <cpuid>
    80001d5c:	00813083          	ld	ra,8(sp)
    80001d60:	00013403          	ld	s0,0(sp)
    80001d64:	00d5151b          	slliw	a0,a0,0xd
    80001d68:	0c2017b7          	lui	a5,0xc201
    80001d6c:	00a78533          	add	a0,a5,a0
    80001d70:	00452503          	lw	a0,4(a0)
    80001d74:	01010113          	addi	sp,sp,16
    80001d78:	00008067          	ret

0000000080001d7c <plic_complete>:
    80001d7c:	fe010113          	addi	sp,sp,-32
    80001d80:	00813823          	sd	s0,16(sp)
    80001d84:	00913423          	sd	s1,8(sp)
    80001d88:	00113c23          	sd	ra,24(sp)
    80001d8c:	02010413          	addi	s0,sp,32
    80001d90:	00050493          	mv	s1,a0
    80001d94:	00000097          	auipc	ra,0x0
    80001d98:	9b4080e7          	jalr	-1612(ra) # 80001748 <cpuid>
    80001d9c:	01813083          	ld	ra,24(sp)
    80001da0:	01013403          	ld	s0,16(sp)
    80001da4:	00d5179b          	slliw	a5,a0,0xd
    80001da8:	0c201737          	lui	a4,0xc201
    80001dac:	00f707b3          	add	a5,a4,a5
    80001db0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80001db4:	00813483          	ld	s1,8(sp)
    80001db8:	02010113          	addi	sp,sp,32
    80001dbc:	00008067          	ret

0000000080001dc0 <consolewrite>:
    80001dc0:	fb010113          	addi	sp,sp,-80
    80001dc4:	04813023          	sd	s0,64(sp)
    80001dc8:	04113423          	sd	ra,72(sp)
    80001dcc:	02913c23          	sd	s1,56(sp)
    80001dd0:	03213823          	sd	s2,48(sp)
    80001dd4:	03313423          	sd	s3,40(sp)
    80001dd8:	03413023          	sd	s4,32(sp)
    80001ddc:	01513c23          	sd	s5,24(sp)
    80001de0:	05010413          	addi	s0,sp,80
    80001de4:	06c05c63          	blez	a2,80001e5c <consolewrite+0x9c>
    80001de8:	00060993          	mv	s3,a2
    80001dec:	00050a13          	mv	s4,a0
    80001df0:	00058493          	mv	s1,a1
    80001df4:	00000913          	li	s2,0
    80001df8:	fff00a93          	li	s5,-1
    80001dfc:	01c0006f          	j	80001e18 <consolewrite+0x58>
    80001e00:	fbf44503          	lbu	a0,-65(s0)
    80001e04:	0019091b          	addiw	s2,s2,1
    80001e08:	00148493          	addi	s1,s1,1
    80001e0c:	00001097          	auipc	ra,0x1
    80001e10:	a9c080e7          	jalr	-1380(ra) # 800028a8 <uartputc>
    80001e14:	03298063          	beq	s3,s2,80001e34 <consolewrite+0x74>
    80001e18:	00048613          	mv	a2,s1
    80001e1c:	00100693          	li	a3,1
    80001e20:	000a0593          	mv	a1,s4
    80001e24:	fbf40513          	addi	a0,s0,-65
    80001e28:	00000097          	auipc	ra,0x0
    80001e2c:	9d8080e7          	jalr	-1576(ra) # 80001800 <either_copyin>
    80001e30:	fd5518e3          	bne	a0,s5,80001e00 <consolewrite+0x40>
    80001e34:	04813083          	ld	ra,72(sp)
    80001e38:	04013403          	ld	s0,64(sp)
    80001e3c:	03813483          	ld	s1,56(sp)
    80001e40:	02813983          	ld	s3,40(sp)
    80001e44:	02013a03          	ld	s4,32(sp)
    80001e48:	01813a83          	ld	s5,24(sp)
    80001e4c:	00090513          	mv	a0,s2
    80001e50:	03013903          	ld	s2,48(sp)
    80001e54:	05010113          	addi	sp,sp,80
    80001e58:	00008067          	ret
    80001e5c:	00000913          	li	s2,0
    80001e60:	fd5ff06f          	j	80001e34 <consolewrite+0x74>

0000000080001e64 <consoleread>:
    80001e64:	f9010113          	addi	sp,sp,-112
    80001e68:	06813023          	sd	s0,96(sp)
    80001e6c:	04913c23          	sd	s1,88(sp)
    80001e70:	05213823          	sd	s2,80(sp)
    80001e74:	05313423          	sd	s3,72(sp)
    80001e78:	05413023          	sd	s4,64(sp)
    80001e7c:	03513c23          	sd	s5,56(sp)
    80001e80:	03613823          	sd	s6,48(sp)
    80001e84:	03713423          	sd	s7,40(sp)
    80001e88:	03813023          	sd	s8,32(sp)
    80001e8c:	06113423          	sd	ra,104(sp)
    80001e90:	01913c23          	sd	s9,24(sp)
    80001e94:	07010413          	addi	s0,sp,112
    80001e98:	00060b93          	mv	s7,a2
    80001e9c:	00050913          	mv	s2,a0
    80001ea0:	00058c13          	mv	s8,a1
    80001ea4:	00060b1b          	sext.w	s6,a2
    80001ea8:	00003497          	auipc	s1,0x3
    80001eac:	61048493          	addi	s1,s1,1552 # 800054b8 <cons>
    80001eb0:	00400993          	li	s3,4
    80001eb4:	fff00a13          	li	s4,-1
    80001eb8:	00a00a93          	li	s5,10
    80001ebc:	05705e63          	blez	s7,80001f18 <consoleread+0xb4>
    80001ec0:	09c4a703          	lw	a4,156(s1)
    80001ec4:	0984a783          	lw	a5,152(s1)
    80001ec8:	0007071b          	sext.w	a4,a4
    80001ecc:	08e78463          	beq	a5,a4,80001f54 <consoleread+0xf0>
    80001ed0:	07f7f713          	andi	a4,a5,127
    80001ed4:	00e48733          	add	a4,s1,a4
    80001ed8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80001edc:	0017869b          	addiw	a3,a5,1
    80001ee0:	08d4ac23          	sw	a3,152(s1)
    80001ee4:	00070c9b          	sext.w	s9,a4
    80001ee8:	0b370663          	beq	a4,s3,80001f94 <consoleread+0x130>
    80001eec:	00100693          	li	a3,1
    80001ef0:	f9f40613          	addi	a2,s0,-97
    80001ef4:	000c0593          	mv	a1,s8
    80001ef8:	00090513          	mv	a0,s2
    80001efc:	f8e40fa3          	sb	a4,-97(s0)
    80001f00:	00000097          	auipc	ra,0x0
    80001f04:	8b4080e7          	jalr	-1868(ra) # 800017b4 <either_copyout>
    80001f08:	01450863          	beq	a0,s4,80001f18 <consoleread+0xb4>
    80001f0c:	001c0c13          	addi	s8,s8,1
    80001f10:	fffb8b9b          	addiw	s7,s7,-1
    80001f14:	fb5c94e3          	bne	s9,s5,80001ebc <consoleread+0x58>
    80001f18:	000b851b          	sext.w	a0,s7
    80001f1c:	06813083          	ld	ra,104(sp)
    80001f20:	06013403          	ld	s0,96(sp)
    80001f24:	05813483          	ld	s1,88(sp)
    80001f28:	05013903          	ld	s2,80(sp)
    80001f2c:	04813983          	ld	s3,72(sp)
    80001f30:	04013a03          	ld	s4,64(sp)
    80001f34:	03813a83          	ld	s5,56(sp)
    80001f38:	02813b83          	ld	s7,40(sp)
    80001f3c:	02013c03          	ld	s8,32(sp)
    80001f40:	01813c83          	ld	s9,24(sp)
    80001f44:	40ab053b          	subw	a0,s6,a0
    80001f48:	03013b03          	ld	s6,48(sp)
    80001f4c:	07010113          	addi	sp,sp,112
    80001f50:	00008067          	ret
    80001f54:	00001097          	auipc	ra,0x1
    80001f58:	1d8080e7          	jalr	472(ra) # 8000312c <push_on>
    80001f5c:	0984a703          	lw	a4,152(s1)
    80001f60:	09c4a783          	lw	a5,156(s1)
    80001f64:	0007879b          	sext.w	a5,a5
    80001f68:	fef70ce3          	beq	a4,a5,80001f60 <consoleread+0xfc>
    80001f6c:	00001097          	auipc	ra,0x1
    80001f70:	234080e7          	jalr	564(ra) # 800031a0 <pop_on>
    80001f74:	0984a783          	lw	a5,152(s1)
    80001f78:	07f7f713          	andi	a4,a5,127
    80001f7c:	00e48733          	add	a4,s1,a4
    80001f80:	01874703          	lbu	a4,24(a4)
    80001f84:	0017869b          	addiw	a3,a5,1
    80001f88:	08d4ac23          	sw	a3,152(s1)
    80001f8c:	00070c9b          	sext.w	s9,a4
    80001f90:	f5371ee3          	bne	a4,s3,80001eec <consoleread+0x88>
    80001f94:	000b851b          	sext.w	a0,s7
    80001f98:	f96bf2e3          	bgeu	s7,s6,80001f1c <consoleread+0xb8>
    80001f9c:	08f4ac23          	sw	a5,152(s1)
    80001fa0:	f7dff06f          	j	80001f1c <consoleread+0xb8>

0000000080001fa4 <consputc>:
    80001fa4:	10000793          	li	a5,256
    80001fa8:	00f50663          	beq	a0,a5,80001fb4 <consputc+0x10>
    80001fac:	00001317          	auipc	t1,0x1
    80001fb0:	9f430067          	jr	-1548(t1) # 800029a0 <uartputc_sync>
    80001fb4:	ff010113          	addi	sp,sp,-16
    80001fb8:	00113423          	sd	ra,8(sp)
    80001fbc:	00813023          	sd	s0,0(sp)
    80001fc0:	01010413          	addi	s0,sp,16
    80001fc4:	00800513          	li	a0,8
    80001fc8:	00001097          	auipc	ra,0x1
    80001fcc:	9d8080e7          	jalr	-1576(ra) # 800029a0 <uartputc_sync>
    80001fd0:	02000513          	li	a0,32
    80001fd4:	00001097          	auipc	ra,0x1
    80001fd8:	9cc080e7          	jalr	-1588(ra) # 800029a0 <uartputc_sync>
    80001fdc:	00013403          	ld	s0,0(sp)
    80001fe0:	00813083          	ld	ra,8(sp)
    80001fe4:	00800513          	li	a0,8
    80001fe8:	01010113          	addi	sp,sp,16
    80001fec:	00001317          	auipc	t1,0x1
    80001ff0:	9b430067          	jr	-1612(t1) # 800029a0 <uartputc_sync>

0000000080001ff4 <consoleintr>:
    80001ff4:	fe010113          	addi	sp,sp,-32
    80001ff8:	00813823          	sd	s0,16(sp)
    80001ffc:	00913423          	sd	s1,8(sp)
    80002000:	01213023          	sd	s2,0(sp)
    80002004:	00113c23          	sd	ra,24(sp)
    80002008:	02010413          	addi	s0,sp,32
    8000200c:	00003917          	auipc	s2,0x3
    80002010:	4ac90913          	addi	s2,s2,1196 # 800054b8 <cons>
    80002014:	00050493          	mv	s1,a0
    80002018:	00090513          	mv	a0,s2
    8000201c:	00001097          	auipc	ra,0x1
    80002020:	e40080e7          	jalr	-448(ra) # 80002e5c <acquire>
    80002024:	02048c63          	beqz	s1,8000205c <consoleintr+0x68>
    80002028:	0a092783          	lw	a5,160(s2)
    8000202c:	09892703          	lw	a4,152(s2)
    80002030:	07f00693          	li	a3,127
    80002034:	40e7873b          	subw	a4,a5,a4
    80002038:	02e6e263          	bltu	a3,a4,8000205c <consoleintr+0x68>
    8000203c:	00d00713          	li	a4,13
    80002040:	04e48063          	beq	s1,a4,80002080 <consoleintr+0x8c>
    80002044:	07f7f713          	andi	a4,a5,127
    80002048:	00e90733          	add	a4,s2,a4
    8000204c:	0017879b          	addiw	a5,a5,1
    80002050:	0af92023          	sw	a5,160(s2)
    80002054:	00970c23          	sb	s1,24(a4)
    80002058:	08f92e23          	sw	a5,156(s2)
    8000205c:	01013403          	ld	s0,16(sp)
    80002060:	01813083          	ld	ra,24(sp)
    80002064:	00813483          	ld	s1,8(sp)
    80002068:	00013903          	ld	s2,0(sp)
    8000206c:	00003517          	auipc	a0,0x3
    80002070:	44c50513          	addi	a0,a0,1100 # 800054b8 <cons>
    80002074:	02010113          	addi	sp,sp,32
    80002078:	00001317          	auipc	t1,0x1
    8000207c:	eb030067          	jr	-336(t1) # 80002f28 <release>
    80002080:	00a00493          	li	s1,10
    80002084:	fc1ff06f          	j	80002044 <consoleintr+0x50>

0000000080002088 <consoleinit>:
    80002088:	fe010113          	addi	sp,sp,-32
    8000208c:	00113c23          	sd	ra,24(sp)
    80002090:	00813823          	sd	s0,16(sp)
    80002094:	00913423          	sd	s1,8(sp)
    80002098:	02010413          	addi	s0,sp,32
    8000209c:	00003497          	auipc	s1,0x3
    800020a0:	41c48493          	addi	s1,s1,1052 # 800054b8 <cons>
    800020a4:	00048513          	mv	a0,s1
    800020a8:	00002597          	auipc	a1,0x2
    800020ac:	0a058593          	addi	a1,a1,160 # 80004148 <CONSOLE_STATUS+0x138>
    800020b0:	00001097          	auipc	ra,0x1
    800020b4:	d88080e7          	jalr	-632(ra) # 80002e38 <initlock>
    800020b8:	00000097          	auipc	ra,0x0
    800020bc:	7ac080e7          	jalr	1964(ra) # 80002864 <uartinit>
    800020c0:	01813083          	ld	ra,24(sp)
    800020c4:	01013403          	ld	s0,16(sp)
    800020c8:	00000797          	auipc	a5,0x0
    800020cc:	d9c78793          	addi	a5,a5,-612 # 80001e64 <consoleread>
    800020d0:	0af4bc23          	sd	a5,184(s1)
    800020d4:	00000797          	auipc	a5,0x0
    800020d8:	cec78793          	addi	a5,a5,-788 # 80001dc0 <consolewrite>
    800020dc:	0cf4b023          	sd	a5,192(s1)
    800020e0:	00813483          	ld	s1,8(sp)
    800020e4:	02010113          	addi	sp,sp,32
    800020e8:	00008067          	ret

00000000800020ec <console_read>:
    800020ec:	ff010113          	addi	sp,sp,-16
    800020f0:	00813423          	sd	s0,8(sp)
    800020f4:	01010413          	addi	s0,sp,16
    800020f8:	00813403          	ld	s0,8(sp)
    800020fc:	00003317          	auipc	t1,0x3
    80002100:	47433303          	ld	t1,1140(t1) # 80005570 <devsw+0x10>
    80002104:	01010113          	addi	sp,sp,16
    80002108:	00030067          	jr	t1

000000008000210c <console_write>:
    8000210c:	ff010113          	addi	sp,sp,-16
    80002110:	00813423          	sd	s0,8(sp)
    80002114:	01010413          	addi	s0,sp,16
    80002118:	00813403          	ld	s0,8(sp)
    8000211c:	00003317          	auipc	t1,0x3
    80002120:	45c33303          	ld	t1,1116(t1) # 80005578 <devsw+0x18>
    80002124:	01010113          	addi	sp,sp,16
    80002128:	00030067          	jr	t1

000000008000212c <panic>:
    8000212c:	fe010113          	addi	sp,sp,-32
    80002130:	00113c23          	sd	ra,24(sp)
    80002134:	00813823          	sd	s0,16(sp)
    80002138:	00913423          	sd	s1,8(sp)
    8000213c:	02010413          	addi	s0,sp,32
    80002140:	00050493          	mv	s1,a0
    80002144:	00002517          	auipc	a0,0x2
    80002148:	00c50513          	addi	a0,a0,12 # 80004150 <CONSOLE_STATUS+0x140>
    8000214c:	00003797          	auipc	a5,0x3
    80002150:	4c07a623          	sw	zero,1228(a5) # 80005618 <pr+0x18>
    80002154:	00000097          	auipc	ra,0x0
    80002158:	034080e7          	jalr	52(ra) # 80002188 <__printf>
    8000215c:	00048513          	mv	a0,s1
    80002160:	00000097          	auipc	ra,0x0
    80002164:	028080e7          	jalr	40(ra) # 80002188 <__printf>
    80002168:	00002517          	auipc	a0,0x2
    8000216c:	fc850513          	addi	a0,a0,-56 # 80004130 <CONSOLE_STATUS+0x120>
    80002170:	00000097          	auipc	ra,0x0
    80002174:	018080e7          	jalr	24(ra) # 80002188 <__printf>
    80002178:	00100793          	li	a5,1
    8000217c:	00002717          	auipc	a4,0x2
    80002180:	24f72223          	sw	a5,580(a4) # 800043c0 <panicked>
    80002184:	0000006f          	j	80002184 <panic+0x58>

0000000080002188 <__printf>:
    80002188:	f3010113          	addi	sp,sp,-208
    8000218c:	08813023          	sd	s0,128(sp)
    80002190:	07313423          	sd	s3,104(sp)
    80002194:	09010413          	addi	s0,sp,144
    80002198:	05813023          	sd	s8,64(sp)
    8000219c:	08113423          	sd	ra,136(sp)
    800021a0:	06913c23          	sd	s1,120(sp)
    800021a4:	07213823          	sd	s2,112(sp)
    800021a8:	07413023          	sd	s4,96(sp)
    800021ac:	05513c23          	sd	s5,88(sp)
    800021b0:	05613823          	sd	s6,80(sp)
    800021b4:	05713423          	sd	s7,72(sp)
    800021b8:	03913c23          	sd	s9,56(sp)
    800021bc:	03a13823          	sd	s10,48(sp)
    800021c0:	03b13423          	sd	s11,40(sp)
    800021c4:	00003317          	auipc	t1,0x3
    800021c8:	43c30313          	addi	t1,t1,1084 # 80005600 <pr>
    800021cc:	01832c03          	lw	s8,24(t1)
    800021d0:	00b43423          	sd	a1,8(s0)
    800021d4:	00c43823          	sd	a2,16(s0)
    800021d8:	00d43c23          	sd	a3,24(s0)
    800021dc:	02e43023          	sd	a4,32(s0)
    800021e0:	02f43423          	sd	a5,40(s0)
    800021e4:	03043823          	sd	a6,48(s0)
    800021e8:	03143c23          	sd	a7,56(s0)
    800021ec:	00050993          	mv	s3,a0
    800021f0:	4a0c1663          	bnez	s8,8000269c <__printf+0x514>
    800021f4:	60098c63          	beqz	s3,8000280c <__printf+0x684>
    800021f8:	0009c503          	lbu	a0,0(s3)
    800021fc:	00840793          	addi	a5,s0,8
    80002200:	f6f43c23          	sd	a5,-136(s0)
    80002204:	00000493          	li	s1,0
    80002208:	22050063          	beqz	a0,80002428 <__printf+0x2a0>
    8000220c:	00002a37          	lui	s4,0x2
    80002210:	00018ab7          	lui	s5,0x18
    80002214:	000f4b37          	lui	s6,0xf4
    80002218:	00989bb7          	lui	s7,0x989
    8000221c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80002220:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80002224:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80002228:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    8000222c:	00148c9b          	addiw	s9,s1,1
    80002230:	02500793          	li	a5,37
    80002234:	01998933          	add	s2,s3,s9
    80002238:	38f51263          	bne	a0,a5,800025bc <__printf+0x434>
    8000223c:	00094783          	lbu	a5,0(s2)
    80002240:	00078c9b          	sext.w	s9,a5
    80002244:	1e078263          	beqz	a5,80002428 <__printf+0x2a0>
    80002248:	0024849b          	addiw	s1,s1,2
    8000224c:	07000713          	li	a4,112
    80002250:	00998933          	add	s2,s3,s1
    80002254:	38e78a63          	beq	a5,a4,800025e8 <__printf+0x460>
    80002258:	20f76863          	bltu	a4,a5,80002468 <__printf+0x2e0>
    8000225c:	42a78863          	beq	a5,a0,8000268c <__printf+0x504>
    80002260:	06400713          	li	a4,100
    80002264:	40e79663          	bne	a5,a4,80002670 <__printf+0x4e8>
    80002268:	f7843783          	ld	a5,-136(s0)
    8000226c:	0007a603          	lw	a2,0(a5)
    80002270:	00878793          	addi	a5,a5,8
    80002274:	f6f43c23          	sd	a5,-136(s0)
    80002278:	42064a63          	bltz	a2,800026ac <__printf+0x524>
    8000227c:	00a00713          	li	a4,10
    80002280:	02e677bb          	remuw	a5,a2,a4
    80002284:	00002d97          	auipc	s11,0x2
    80002288:	ef4d8d93          	addi	s11,s11,-268 # 80004178 <digits>
    8000228c:	00900593          	li	a1,9
    80002290:	0006051b          	sext.w	a0,a2
    80002294:	00000c93          	li	s9,0
    80002298:	02079793          	slli	a5,a5,0x20
    8000229c:	0207d793          	srli	a5,a5,0x20
    800022a0:	00fd87b3          	add	a5,s11,a5
    800022a4:	0007c783          	lbu	a5,0(a5)
    800022a8:	02e656bb          	divuw	a3,a2,a4
    800022ac:	f8f40023          	sb	a5,-128(s0)
    800022b0:	14c5d863          	bge	a1,a2,80002400 <__printf+0x278>
    800022b4:	06300593          	li	a1,99
    800022b8:	00100c93          	li	s9,1
    800022bc:	02e6f7bb          	remuw	a5,a3,a4
    800022c0:	02079793          	slli	a5,a5,0x20
    800022c4:	0207d793          	srli	a5,a5,0x20
    800022c8:	00fd87b3          	add	a5,s11,a5
    800022cc:	0007c783          	lbu	a5,0(a5)
    800022d0:	02e6d73b          	divuw	a4,a3,a4
    800022d4:	f8f400a3          	sb	a5,-127(s0)
    800022d8:	12a5f463          	bgeu	a1,a0,80002400 <__printf+0x278>
    800022dc:	00a00693          	li	a3,10
    800022e0:	00900593          	li	a1,9
    800022e4:	02d777bb          	remuw	a5,a4,a3
    800022e8:	02079793          	slli	a5,a5,0x20
    800022ec:	0207d793          	srli	a5,a5,0x20
    800022f0:	00fd87b3          	add	a5,s11,a5
    800022f4:	0007c503          	lbu	a0,0(a5)
    800022f8:	02d757bb          	divuw	a5,a4,a3
    800022fc:	f8a40123          	sb	a0,-126(s0)
    80002300:	48e5f263          	bgeu	a1,a4,80002784 <__printf+0x5fc>
    80002304:	06300513          	li	a0,99
    80002308:	02d7f5bb          	remuw	a1,a5,a3
    8000230c:	02059593          	slli	a1,a1,0x20
    80002310:	0205d593          	srli	a1,a1,0x20
    80002314:	00bd85b3          	add	a1,s11,a1
    80002318:	0005c583          	lbu	a1,0(a1)
    8000231c:	02d7d7bb          	divuw	a5,a5,a3
    80002320:	f8b401a3          	sb	a1,-125(s0)
    80002324:	48e57263          	bgeu	a0,a4,800027a8 <__printf+0x620>
    80002328:	3e700513          	li	a0,999
    8000232c:	02d7f5bb          	remuw	a1,a5,a3
    80002330:	02059593          	slli	a1,a1,0x20
    80002334:	0205d593          	srli	a1,a1,0x20
    80002338:	00bd85b3          	add	a1,s11,a1
    8000233c:	0005c583          	lbu	a1,0(a1)
    80002340:	02d7d7bb          	divuw	a5,a5,a3
    80002344:	f8b40223          	sb	a1,-124(s0)
    80002348:	46e57663          	bgeu	a0,a4,800027b4 <__printf+0x62c>
    8000234c:	02d7f5bb          	remuw	a1,a5,a3
    80002350:	02059593          	slli	a1,a1,0x20
    80002354:	0205d593          	srli	a1,a1,0x20
    80002358:	00bd85b3          	add	a1,s11,a1
    8000235c:	0005c583          	lbu	a1,0(a1)
    80002360:	02d7d7bb          	divuw	a5,a5,a3
    80002364:	f8b402a3          	sb	a1,-123(s0)
    80002368:	46ea7863          	bgeu	s4,a4,800027d8 <__printf+0x650>
    8000236c:	02d7f5bb          	remuw	a1,a5,a3
    80002370:	02059593          	slli	a1,a1,0x20
    80002374:	0205d593          	srli	a1,a1,0x20
    80002378:	00bd85b3          	add	a1,s11,a1
    8000237c:	0005c583          	lbu	a1,0(a1)
    80002380:	02d7d7bb          	divuw	a5,a5,a3
    80002384:	f8b40323          	sb	a1,-122(s0)
    80002388:	3eeaf863          	bgeu	s5,a4,80002778 <__printf+0x5f0>
    8000238c:	02d7f5bb          	remuw	a1,a5,a3
    80002390:	02059593          	slli	a1,a1,0x20
    80002394:	0205d593          	srli	a1,a1,0x20
    80002398:	00bd85b3          	add	a1,s11,a1
    8000239c:	0005c583          	lbu	a1,0(a1)
    800023a0:	02d7d7bb          	divuw	a5,a5,a3
    800023a4:	f8b403a3          	sb	a1,-121(s0)
    800023a8:	42eb7e63          	bgeu	s6,a4,800027e4 <__printf+0x65c>
    800023ac:	02d7f5bb          	remuw	a1,a5,a3
    800023b0:	02059593          	slli	a1,a1,0x20
    800023b4:	0205d593          	srli	a1,a1,0x20
    800023b8:	00bd85b3          	add	a1,s11,a1
    800023bc:	0005c583          	lbu	a1,0(a1)
    800023c0:	02d7d7bb          	divuw	a5,a5,a3
    800023c4:	f8b40423          	sb	a1,-120(s0)
    800023c8:	42ebfc63          	bgeu	s7,a4,80002800 <__printf+0x678>
    800023cc:	02079793          	slli	a5,a5,0x20
    800023d0:	0207d793          	srli	a5,a5,0x20
    800023d4:	00fd8db3          	add	s11,s11,a5
    800023d8:	000dc703          	lbu	a4,0(s11)
    800023dc:	00a00793          	li	a5,10
    800023e0:	00900c93          	li	s9,9
    800023e4:	f8e404a3          	sb	a4,-119(s0)
    800023e8:	00065c63          	bgez	a2,80002400 <__printf+0x278>
    800023ec:	f9040713          	addi	a4,s0,-112
    800023f0:	00f70733          	add	a4,a4,a5
    800023f4:	02d00693          	li	a3,45
    800023f8:	fed70823          	sb	a3,-16(a4)
    800023fc:	00078c93          	mv	s9,a5
    80002400:	f8040793          	addi	a5,s0,-128
    80002404:	01978cb3          	add	s9,a5,s9
    80002408:	f7f40d13          	addi	s10,s0,-129
    8000240c:	000cc503          	lbu	a0,0(s9)
    80002410:	fffc8c93          	addi	s9,s9,-1
    80002414:	00000097          	auipc	ra,0x0
    80002418:	b90080e7          	jalr	-1136(ra) # 80001fa4 <consputc>
    8000241c:	ffac98e3          	bne	s9,s10,8000240c <__printf+0x284>
    80002420:	00094503          	lbu	a0,0(s2)
    80002424:	e00514e3          	bnez	a0,8000222c <__printf+0xa4>
    80002428:	1a0c1663          	bnez	s8,800025d4 <__printf+0x44c>
    8000242c:	08813083          	ld	ra,136(sp)
    80002430:	08013403          	ld	s0,128(sp)
    80002434:	07813483          	ld	s1,120(sp)
    80002438:	07013903          	ld	s2,112(sp)
    8000243c:	06813983          	ld	s3,104(sp)
    80002440:	06013a03          	ld	s4,96(sp)
    80002444:	05813a83          	ld	s5,88(sp)
    80002448:	05013b03          	ld	s6,80(sp)
    8000244c:	04813b83          	ld	s7,72(sp)
    80002450:	04013c03          	ld	s8,64(sp)
    80002454:	03813c83          	ld	s9,56(sp)
    80002458:	03013d03          	ld	s10,48(sp)
    8000245c:	02813d83          	ld	s11,40(sp)
    80002460:	0d010113          	addi	sp,sp,208
    80002464:	00008067          	ret
    80002468:	07300713          	li	a4,115
    8000246c:	1ce78a63          	beq	a5,a4,80002640 <__printf+0x4b8>
    80002470:	07800713          	li	a4,120
    80002474:	1ee79e63          	bne	a5,a4,80002670 <__printf+0x4e8>
    80002478:	f7843783          	ld	a5,-136(s0)
    8000247c:	0007a703          	lw	a4,0(a5)
    80002480:	00878793          	addi	a5,a5,8
    80002484:	f6f43c23          	sd	a5,-136(s0)
    80002488:	28074263          	bltz	a4,8000270c <__printf+0x584>
    8000248c:	00002d97          	auipc	s11,0x2
    80002490:	cecd8d93          	addi	s11,s11,-788 # 80004178 <digits>
    80002494:	00f77793          	andi	a5,a4,15
    80002498:	00fd87b3          	add	a5,s11,a5
    8000249c:	0007c683          	lbu	a3,0(a5)
    800024a0:	00f00613          	li	a2,15
    800024a4:	0007079b          	sext.w	a5,a4
    800024a8:	f8d40023          	sb	a3,-128(s0)
    800024ac:	0047559b          	srliw	a1,a4,0x4
    800024b0:	0047569b          	srliw	a3,a4,0x4
    800024b4:	00000c93          	li	s9,0
    800024b8:	0ee65063          	bge	a2,a4,80002598 <__printf+0x410>
    800024bc:	00f6f693          	andi	a3,a3,15
    800024c0:	00dd86b3          	add	a3,s11,a3
    800024c4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    800024c8:	0087d79b          	srliw	a5,a5,0x8
    800024cc:	00100c93          	li	s9,1
    800024d0:	f8d400a3          	sb	a3,-127(s0)
    800024d4:	0cb67263          	bgeu	a2,a1,80002598 <__printf+0x410>
    800024d8:	00f7f693          	andi	a3,a5,15
    800024dc:	00dd86b3          	add	a3,s11,a3
    800024e0:	0006c583          	lbu	a1,0(a3)
    800024e4:	00f00613          	li	a2,15
    800024e8:	0047d69b          	srliw	a3,a5,0x4
    800024ec:	f8b40123          	sb	a1,-126(s0)
    800024f0:	0047d593          	srli	a1,a5,0x4
    800024f4:	28f67e63          	bgeu	a2,a5,80002790 <__printf+0x608>
    800024f8:	00f6f693          	andi	a3,a3,15
    800024fc:	00dd86b3          	add	a3,s11,a3
    80002500:	0006c503          	lbu	a0,0(a3)
    80002504:	0087d813          	srli	a6,a5,0x8
    80002508:	0087d69b          	srliw	a3,a5,0x8
    8000250c:	f8a401a3          	sb	a0,-125(s0)
    80002510:	28b67663          	bgeu	a2,a1,8000279c <__printf+0x614>
    80002514:	00f6f693          	andi	a3,a3,15
    80002518:	00dd86b3          	add	a3,s11,a3
    8000251c:	0006c583          	lbu	a1,0(a3)
    80002520:	00c7d513          	srli	a0,a5,0xc
    80002524:	00c7d69b          	srliw	a3,a5,0xc
    80002528:	f8b40223          	sb	a1,-124(s0)
    8000252c:	29067a63          	bgeu	a2,a6,800027c0 <__printf+0x638>
    80002530:	00f6f693          	andi	a3,a3,15
    80002534:	00dd86b3          	add	a3,s11,a3
    80002538:	0006c583          	lbu	a1,0(a3)
    8000253c:	0107d813          	srli	a6,a5,0x10
    80002540:	0107d69b          	srliw	a3,a5,0x10
    80002544:	f8b402a3          	sb	a1,-123(s0)
    80002548:	28a67263          	bgeu	a2,a0,800027cc <__printf+0x644>
    8000254c:	00f6f693          	andi	a3,a3,15
    80002550:	00dd86b3          	add	a3,s11,a3
    80002554:	0006c683          	lbu	a3,0(a3)
    80002558:	0147d79b          	srliw	a5,a5,0x14
    8000255c:	f8d40323          	sb	a3,-122(s0)
    80002560:	21067663          	bgeu	a2,a6,8000276c <__printf+0x5e4>
    80002564:	02079793          	slli	a5,a5,0x20
    80002568:	0207d793          	srli	a5,a5,0x20
    8000256c:	00fd8db3          	add	s11,s11,a5
    80002570:	000dc683          	lbu	a3,0(s11)
    80002574:	00800793          	li	a5,8
    80002578:	00700c93          	li	s9,7
    8000257c:	f8d403a3          	sb	a3,-121(s0)
    80002580:	00075c63          	bgez	a4,80002598 <__printf+0x410>
    80002584:	f9040713          	addi	a4,s0,-112
    80002588:	00f70733          	add	a4,a4,a5
    8000258c:	02d00693          	li	a3,45
    80002590:	fed70823          	sb	a3,-16(a4)
    80002594:	00078c93          	mv	s9,a5
    80002598:	f8040793          	addi	a5,s0,-128
    8000259c:	01978cb3          	add	s9,a5,s9
    800025a0:	f7f40d13          	addi	s10,s0,-129
    800025a4:	000cc503          	lbu	a0,0(s9)
    800025a8:	fffc8c93          	addi	s9,s9,-1
    800025ac:	00000097          	auipc	ra,0x0
    800025b0:	9f8080e7          	jalr	-1544(ra) # 80001fa4 <consputc>
    800025b4:	ff9d18e3          	bne	s10,s9,800025a4 <__printf+0x41c>
    800025b8:	0100006f          	j	800025c8 <__printf+0x440>
    800025bc:	00000097          	auipc	ra,0x0
    800025c0:	9e8080e7          	jalr	-1560(ra) # 80001fa4 <consputc>
    800025c4:	000c8493          	mv	s1,s9
    800025c8:	00094503          	lbu	a0,0(s2)
    800025cc:	c60510e3          	bnez	a0,8000222c <__printf+0xa4>
    800025d0:	e40c0ee3          	beqz	s8,8000242c <__printf+0x2a4>
    800025d4:	00003517          	auipc	a0,0x3
    800025d8:	02c50513          	addi	a0,a0,44 # 80005600 <pr>
    800025dc:	00001097          	auipc	ra,0x1
    800025e0:	94c080e7          	jalr	-1716(ra) # 80002f28 <release>
    800025e4:	e49ff06f          	j	8000242c <__printf+0x2a4>
    800025e8:	f7843783          	ld	a5,-136(s0)
    800025ec:	03000513          	li	a0,48
    800025f0:	01000d13          	li	s10,16
    800025f4:	00878713          	addi	a4,a5,8
    800025f8:	0007bc83          	ld	s9,0(a5)
    800025fc:	f6e43c23          	sd	a4,-136(s0)
    80002600:	00000097          	auipc	ra,0x0
    80002604:	9a4080e7          	jalr	-1628(ra) # 80001fa4 <consputc>
    80002608:	07800513          	li	a0,120
    8000260c:	00000097          	auipc	ra,0x0
    80002610:	998080e7          	jalr	-1640(ra) # 80001fa4 <consputc>
    80002614:	00002d97          	auipc	s11,0x2
    80002618:	b64d8d93          	addi	s11,s11,-1180 # 80004178 <digits>
    8000261c:	03ccd793          	srli	a5,s9,0x3c
    80002620:	00fd87b3          	add	a5,s11,a5
    80002624:	0007c503          	lbu	a0,0(a5)
    80002628:	fffd0d1b          	addiw	s10,s10,-1
    8000262c:	004c9c93          	slli	s9,s9,0x4
    80002630:	00000097          	auipc	ra,0x0
    80002634:	974080e7          	jalr	-1676(ra) # 80001fa4 <consputc>
    80002638:	fe0d12e3          	bnez	s10,8000261c <__printf+0x494>
    8000263c:	f8dff06f          	j	800025c8 <__printf+0x440>
    80002640:	f7843783          	ld	a5,-136(s0)
    80002644:	0007bc83          	ld	s9,0(a5)
    80002648:	00878793          	addi	a5,a5,8
    8000264c:	f6f43c23          	sd	a5,-136(s0)
    80002650:	000c9a63          	bnez	s9,80002664 <__printf+0x4dc>
    80002654:	1080006f          	j	8000275c <__printf+0x5d4>
    80002658:	001c8c93          	addi	s9,s9,1
    8000265c:	00000097          	auipc	ra,0x0
    80002660:	948080e7          	jalr	-1720(ra) # 80001fa4 <consputc>
    80002664:	000cc503          	lbu	a0,0(s9)
    80002668:	fe0518e3          	bnez	a0,80002658 <__printf+0x4d0>
    8000266c:	f5dff06f          	j	800025c8 <__printf+0x440>
    80002670:	02500513          	li	a0,37
    80002674:	00000097          	auipc	ra,0x0
    80002678:	930080e7          	jalr	-1744(ra) # 80001fa4 <consputc>
    8000267c:	000c8513          	mv	a0,s9
    80002680:	00000097          	auipc	ra,0x0
    80002684:	924080e7          	jalr	-1756(ra) # 80001fa4 <consputc>
    80002688:	f41ff06f          	j	800025c8 <__printf+0x440>
    8000268c:	02500513          	li	a0,37
    80002690:	00000097          	auipc	ra,0x0
    80002694:	914080e7          	jalr	-1772(ra) # 80001fa4 <consputc>
    80002698:	f31ff06f          	j	800025c8 <__printf+0x440>
    8000269c:	00030513          	mv	a0,t1
    800026a0:	00000097          	auipc	ra,0x0
    800026a4:	7bc080e7          	jalr	1980(ra) # 80002e5c <acquire>
    800026a8:	b4dff06f          	j	800021f4 <__printf+0x6c>
    800026ac:	40c0053b          	negw	a0,a2
    800026b0:	00a00713          	li	a4,10
    800026b4:	02e576bb          	remuw	a3,a0,a4
    800026b8:	00002d97          	auipc	s11,0x2
    800026bc:	ac0d8d93          	addi	s11,s11,-1344 # 80004178 <digits>
    800026c0:	ff700593          	li	a1,-9
    800026c4:	02069693          	slli	a3,a3,0x20
    800026c8:	0206d693          	srli	a3,a3,0x20
    800026cc:	00dd86b3          	add	a3,s11,a3
    800026d0:	0006c683          	lbu	a3,0(a3)
    800026d4:	02e557bb          	divuw	a5,a0,a4
    800026d8:	f8d40023          	sb	a3,-128(s0)
    800026dc:	10b65e63          	bge	a2,a1,800027f8 <__printf+0x670>
    800026e0:	06300593          	li	a1,99
    800026e4:	02e7f6bb          	remuw	a3,a5,a4
    800026e8:	02069693          	slli	a3,a3,0x20
    800026ec:	0206d693          	srli	a3,a3,0x20
    800026f0:	00dd86b3          	add	a3,s11,a3
    800026f4:	0006c683          	lbu	a3,0(a3)
    800026f8:	02e7d73b          	divuw	a4,a5,a4
    800026fc:	00200793          	li	a5,2
    80002700:	f8d400a3          	sb	a3,-127(s0)
    80002704:	bca5ece3          	bltu	a1,a0,800022dc <__printf+0x154>
    80002708:	ce5ff06f          	j	800023ec <__printf+0x264>
    8000270c:	40e007bb          	negw	a5,a4
    80002710:	00002d97          	auipc	s11,0x2
    80002714:	a68d8d93          	addi	s11,s11,-1432 # 80004178 <digits>
    80002718:	00f7f693          	andi	a3,a5,15
    8000271c:	00dd86b3          	add	a3,s11,a3
    80002720:	0006c583          	lbu	a1,0(a3)
    80002724:	ff100613          	li	a2,-15
    80002728:	0047d69b          	srliw	a3,a5,0x4
    8000272c:	f8b40023          	sb	a1,-128(s0)
    80002730:	0047d59b          	srliw	a1,a5,0x4
    80002734:	0ac75e63          	bge	a4,a2,800027f0 <__printf+0x668>
    80002738:	00f6f693          	andi	a3,a3,15
    8000273c:	00dd86b3          	add	a3,s11,a3
    80002740:	0006c603          	lbu	a2,0(a3)
    80002744:	00f00693          	li	a3,15
    80002748:	0087d79b          	srliw	a5,a5,0x8
    8000274c:	f8c400a3          	sb	a2,-127(s0)
    80002750:	d8b6e4e3          	bltu	a3,a1,800024d8 <__printf+0x350>
    80002754:	00200793          	li	a5,2
    80002758:	e2dff06f          	j	80002584 <__printf+0x3fc>
    8000275c:	00002c97          	auipc	s9,0x2
    80002760:	9fcc8c93          	addi	s9,s9,-1540 # 80004158 <CONSOLE_STATUS+0x148>
    80002764:	02800513          	li	a0,40
    80002768:	ef1ff06f          	j	80002658 <__printf+0x4d0>
    8000276c:	00700793          	li	a5,7
    80002770:	00600c93          	li	s9,6
    80002774:	e0dff06f          	j	80002580 <__printf+0x3f8>
    80002778:	00700793          	li	a5,7
    8000277c:	00600c93          	li	s9,6
    80002780:	c69ff06f          	j	800023e8 <__printf+0x260>
    80002784:	00300793          	li	a5,3
    80002788:	00200c93          	li	s9,2
    8000278c:	c5dff06f          	j	800023e8 <__printf+0x260>
    80002790:	00300793          	li	a5,3
    80002794:	00200c93          	li	s9,2
    80002798:	de9ff06f          	j	80002580 <__printf+0x3f8>
    8000279c:	00400793          	li	a5,4
    800027a0:	00300c93          	li	s9,3
    800027a4:	dddff06f          	j	80002580 <__printf+0x3f8>
    800027a8:	00400793          	li	a5,4
    800027ac:	00300c93          	li	s9,3
    800027b0:	c39ff06f          	j	800023e8 <__printf+0x260>
    800027b4:	00500793          	li	a5,5
    800027b8:	00400c93          	li	s9,4
    800027bc:	c2dff06f          	j	800023e8 <__printf+0x260>
    800027c0:	00500793          	li	a5,5
    800027c4:	00400c93          	li	s9,4
    800027c8:	db9ff06f          	j	80002580 <__printf+0x3f8>
    800027cc:	00600793          	li	a5,6
    800027d0:	00500c93          	li	s9,5
    800027d4:	dadff06f          	j	80002580 <__printf+0x3f8>
    800027d8:	00600793          	li	a5,6
    800027dc:	00500c93          	li	s9,5
    800027e0:	c09ff06f          	j	800023e8 <__printf+0x260>
    800027e4:	00800793          	li	a5,8
    800027e8:	00700c93          	li	s9,7
    800027ec:	bfdff06f          	j	800023e8 <__printf+0x260>
    800027f0:	00100793          	li	a5,1
    800027f4:	d91ff06f          	j	80002584 <__printf+0x3fc>
    800027f8:	00100793          	li	a5,1
    800027fc:	bf1ff06f          	j	800023ec <__printf+0x264>
    80002800:	00900793          	li	a5,9
    80002804:	00800c93          	li	s9,8
    80002808:	be1ff06f          	j	800023e8 <__printf+0x260>
    8000280c:	00002517          	auipc	a0,0x2
    80002810:	95450513          	addi	a0,a0,-1708 # 80004160 <CONSOLE_STATUS+0x150>
    80002814:	00000097          	auipc	ra,0x0
    80002818:	918080e7          	jalr	-1768(ra) # 8000212c <panic>

000000008000281c <printfinit>:
    8000281c:	fe010113          	addi	sp,sp,-32
    80002820:	00813823          	sd	s0,16(sp)
    80002824:	00913423          	sd	s1,8(sp)
    80002828:	00113c23          	sd	ra,24(sp)
    8000282c:	02010413          	addi	s0,sp,32
    80002830:	00003497          	auipc	s1,0x3
    80002834:	dd048493          	addi	s1,s1,-560 # 80005600 <pr>
    80002838:	00048513          	mv	a0,s1
    8000283c:	00002597          	auipc	a1,0x2
    80002840:	93458593          	addi	a1,a1,-1740 # 80004170 <CONSOLE_STATUS+0x160>
    80002844:	00000097          	auipc	ra,0x0
    80002848:	5f4080e7          	jalr	1524(ra) # 80002e38 <initlock>
    8000284c:	01813083          	ld	ra,24(sp)
    80002850:	01013403          	ld	s0,16(sp)
    80002854:	0004ac23          	sw	zero,24(s1)
    80002858:	00813483          	ld	s1,8(sp)
    8000285c:	02010113          	addi	sp,sp,32
    80002860:	00008067          	ret

0000000080002864 <uartinit>:
    80002864:	ff010113          	addi	sp,sp,-16
    80002868:	00813423          	sd	s0,8(sp)
    8000286c:	01010413          	addi	s0,sp,16
    80002870:	100007b7          	lui	a5,0x10000
    80002874:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80002878:	f8000713          	li	a4,-128
    8000287c:	00e781a3          	sb	a4,3(a5)
    80002880:	00300713          	li	a4,3
    80002884:	00e78023          	sb	a4,0(a5)
    80002888:	000780a3          	sb	zero,1(a5)
    8000288c:	00e781a3          	sb	a4,3(a5)
    80002890:	00700693          	li	a3,7
    80002894:	00d78123          	sb	a3,2(a5)
    80002898:	00e780a3          	sb	a4,1(a5)
    8000289c:	00813403          	ld	s0,8(sp)
    800028a0:	01010113          	addi	sp,sp,16
    800028a4:	00008067          	ret

00000000800028a8 <uartputc>:
    800028a8:	00002797          	auipc	a5,0x2
    800028ac:	b187a783          	lw	a5,-1256(a5) # 800043c0 <panicked>
    800028b0:	00078463          	beqz	a5,800028b8 <uartputc+0x10>
    800028b4:	0000006f          	j	800028b4 <uartputc+0xc>
    800028b8:	fd010113          	addi	sp,sp,-48
    800028bc:	02813023          	sd	s0,32(sp)
    800028c0:	00913c23          	sd	s1,24(sp)
    800028c4:	01213823          	sd	s2,16(sp)
    800028c8:	01313423          	sd	s3,8(sp)
    800028cc:	02113423          	sd	ra,40(sp)
    800028d0:	03010413          	addi	s0,sp,48
    800028d4:	00002917          	auipc	s2,0x2
    800028d8:	af490913          	addi	s2,s2,-1292 # 800043c8 <uart_tx_r>
    800028dc:	00093783          	ld	a5,0(s2)
    800028e0:	00002497          	auipc	s1,0x2
    800028e4:	af048493          	addi	s1,s1,-1296 # 800043d0 <uart_tx_w>
    800028e8:	0004b703          	ld	a4,0(s1)
    800028ec:	02078693          	addi	a3,a5,32
    800028f0:	00050993          	mv	s3,a0
    800028f4:	02e69c63          	bne	a3,a4,8000292c <uartputc+0x84>
    800028f8:	00001097          	auipc	ra,0x1
    800028fc:	834080e7          	jalr	-1996(ra) # 8000312c <push_on>
    80002900:	00093783          	ld	a5,0(s2)
    80002904:	0004b703          	ld	a4,0(s1)
    80002908:	02078793          	addi	a5,a5,32
    8000290c:	00e79463          	bne	a5,a4,80002914 <uartputc+0x6c>
    80002910:	0000006f          	j	80002910 <uartputc+0x68>
    80002914:	00001097          	auipc	ra,0x1
    80002918:	88c080e7          	jalr	-1908(ra) # 800031a0 <pop_on>
    8000291c:	00093783          	ld	a5,0(s2)
    80002920:	0004b703          	ld	a4,0(s1)
    80002924:	02078693          	addi	a3,a5,32
    80002928:	fce688e3          	beq	a3,a4,800028f8 <uartputc+0x50>
    8000292c:	01f77693          	andi	a3,a4,31
    80002930:	00003597          	auipc	a1,0x3
    80002934:	cf058593          	addi	a1,a1,-784 # 80005620 <uart_tx_buf>
    80002938:	00d586b3          	add	a3,a1,a3
    8000293c:	00170713          	addi	a4,a4,1
    80002940:	01368023          	sb	s3,0(a3)
    80002944:	00e4b023          	sd	a4,0(s1)
    80002948:	10000637          	lui	a2,0x10000
    8000294c:	02f71063          	bne	a4,a5,8000296c <uartputc+0xc4>
    80002950:	0340006f          	j	80002984 <uartputc+0xdc>
    80002954:	00074703          	lbu	a4,0(a4)
    80002958:	00f93023          	sd	a5,0(s2)
    8000295c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80002960:	00093783          	ld	a5,0(s2)
    80002964:	0004b703          	ld	a4,0(s1)
    80002968:	00f70e63          	beq	a4,a5,80002984 <uartputc+0xdc>
    8000296c:	00564683          	lbu	a3,5(a2)
    80002970:	01f7f713          	andi	a4,a5,31
    80002974:	00e58733          	add	a4,a1,a4
    80002978:	0206f693          	andi	a3,a3,32
    8000297c:	00178793          	addi	a5,a5,1
    80002980:	fc069ae3          	bnez	a3,80002954 <uartputc+0xac>
    80002984:	02813083          	ld	ra,40(sp)
    80002988:	02013403          	ld	s0,32(sp)
    8000298c:	01813483          	ld	s1,24(sp)
    80002990:	01013903          	ld	s2,16(sp)
    80002994:	00813983          	ld	s3,8(sp)
    80002998:	03010113          	addi	sp,sp,48
    8000299c:	00008067          	ret

00000000800029a0 <uartputc_sync>:
    800029a0:	ff010113          	addi	sp,sp,-16
    800029a4:	00813423          	sd	s0,8(sp)
    800029a8:	01010413          	addi	s0,sp,16
    800029ac:	00002717          	auipc	a4,0x2
    800029b0:	a1472703          	lw	a4,-1516(a4) # 800043c0 <panicked>
    800029b4:	02071663          	bnez	a4,800029e0 <uartputc_sync+0x40>
    800029b8:	00050793          	mv	a5,a0
    800029bc:	100006b7          	lui	a3,0x10000
    800029c0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    800029c4:	02077713          	andi	a4,a4,32
    800029c8:	fe070ce3          	beqz	a4,800029c0 <uartputc_sync+0x20>
    800029cc:	0ff7f793          	andi	a5,a5,255
    800029d0:	00f68023          	sb	a5,0(a3)
    800029d4:	00813403          	ld	s0,8(sp)
    800029d8:	01010113          	addi	sp,sp,16
    800029dc:	00008067          	ret
    800029e0:	0000006f          	j	800029e0 <uartputc_sync+0x40>

00000000800029e4 <uartstart>:
    800029e4:	ff010113          	addi	sp,sp,-16
    800029e8:	00813423          	sd	s0,8(sp)
    800029ec:	01010413          	addi	s0,sp,16
    800029f0:	00002617          	auipc	a2,0x2
    800029f4:	9d860613          	addi	a2,a2,-1576 # 800043c8 <uart_tx_r>
    800029f8:	00002517          	auipc	a0,0x2
    800029fc:	9d850513          	addi	a0,a0,-1576 # 800043d0 <uart_tx_w>
    80002a00:	00063783          	ld	a5,0(a2)
    80002a04:	00053703          	ld	a4,0(a0)
    80002a08:	04f70263          	beq	a4,a5,80002a4c <uartstart+0x68>
    80002a0c:	100005b7          	lui	a1,0x10000
    80002a10:	00003817          	auipc	a6,0x3
    80002a14:	c1080813          	addi	a6,a6,-1008 # 80005620 <uart_tx_buf>
    80002a18:	01c0006f          	j	80002a34 <uartstart+0x50>
    80002a1c:	0006c703          	lbu	a4,0(a3)
    80002a20:	00f63023          	sd	a5,0(a2)
    80002a24:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80002a28:	00063783          	ld	a5,0(a2)
    80002a2c:	00053703          	ld	a4,0(a0)
    80002a30:	00f70e63          	beq	a4,a5,80002a4c <uartstart+0x68>
    80002a34:	01f7f713          	andi	a4,a5,31
    80002a38:	00e806b3          	add	a3,a6,a4
    80002a3c:	0055c703          	lbu	a4,5(a1)
    80002a40:	00178793          	addi	a5,a5,1
    80002a44:	02077713          	andi	a4,a4,32
    80002a48:	fc071ae3          	bnez	a4,80002a1c <uartstart+0x38>
    80002a4c:	00813403          	ld	s0,8(sp)
    80002a50:	01010113          	addi	sp,sp,16
    80002a54:	00008067          	ret

0000000080002a58 <uartgetc>:
    80002a58:	ff010113          	addi	sp,sp,-16
    80002a5c:	00813423          	sd	s0,8(sp)
    80002a60:	01010413          	addi	s0,sp,16
    80002a64:	10000737          	lui	a4,0x10000
    80002a68:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80002a6c:	0017f793          	andi	a5,a5,1
    80002a70:	00078c63          	beqz	a5,80002a88 <uartgetc+0x30>
    80002a74:	00074503          	lbu	a0,0(a4)
    80002a78:	0ff57513          	andi	a0,a0,255
    80002a7c:	00813403          	ld	s0,8(sp)
    80002a80:	01010113          	addi	sp,sp,16
    80002a84:	00008067          	ret
    80002a88:	fff00513          	li	a0,-1
    80002a8c:	ff1ff06f          	j	80002a7c <uartgetc+0x24>

0000000080002a90 <uartintr>:
    80002a90:	100007b7          	lui	a5,0x10000
    80002a94:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80002a98:	0017f793          	andi	a5,a5,1
    80002a9c:	0a078463          	beqz	a5,80002b44 <uartintr+0xb4>
    80002aa0:	fe010113          	addi	sp,sp,-32
    80002aa4:	00813823          	sd	s0,16(sp)
    80002aa8:	00913423          	sd	s1,8(sp)
    80002aac:	00113c23          	sd	ra,24(sp)
    80002ab0:	02010413          	addi	s0,sp,32
    80002ab4:	100004b7          	lui	s1,0x10000
    80002ab8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    80002abc:	0ff57513          	andi	a0,a0,255
    80002ac0:	fffff097          	auipc	ra,0xfffff
    80002ac4:	534080e7          	jalr	1332(ra) # 80001ff4 <consoleintr>
    80002ac8:	0054c783          	lbu	a5,5(s1)
    80002acc:	0017f793          	andi	a5,a5,1
    80002ad0:	fe0794e3          	bnez	a5,80002ab8 <uartintr+0x28>
    80002ad4:	00002617          	auipc	a2,0x2
    80002ad8:	8f460613          	addi	a2,a2,-1804 # 800043c8 <uart_tx_r>
    80002adc:	00002517          	auipc	a0,0x2
    80002ae0:	8f450513          	addi	a0,a0,-1804 # 800043d0 <uart_tx_w>
    80002ae4:	00063783          	ld	a5,0(a2)
    80002ae8:	00053703          	ld	a4,0(a0)
    80002aec:	04f70263          	beq	a4,a5,80002b30 <uartintr+0xa0>
    80002af0:	100005b7          	lui	a1,0x10000
    80002af4:	00003817          	auipc	a6,0x3
    80002af8:	b2c80813          	addi	a6,a6,-1236 # 80005620 <uart_tx_buf>
    80002afc:	01c0006f          	j	80002b18 <uartintr+0x88>
    80002b00:	0006c703          	lbu	a4,0(a3)
    80002b04:	00f63023          	sd	a5,0(a2)
    80002b08:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80002b0c:	00063783          	ld	a5,0(a2)
    80002b10:	00053703          	ld	a4,0(a0)
    80002b14:	00f70e63          	beq	a4,a5,80002b30 <uartintr+0xa0>
    80002b18:	01f7f713          	andi	a4,a5,31
    80002b1c:	00e806b3          	add	a3,a6,a4
    80002b20:	0055c703          	lbu	a4,5(a1)
    80002b24:	00178793          	addi	a5,a5,1
    80002b28:	02077713          	andi	a4,a4,32
    80002b2c:	fc071ae3          	bnez	a4,80002b00 <uartintr+0x70>
    80002b30:	01813083          	ld	ra,24(sp)
    80002b34:	01013403          	ld	s0,16(sp)
    80002b38:	00813483          	ld	s1,8(sp)
    80002b3c:	02010113          	addi	sp,sp,32
    80002b40:	00008067          	ret
    80002b44:	00002617          	auipc	a2,0x2
    80002b48:	88460613          	addi	a2,a2,-1916 # 800043c8 <uart_tx_r>
    80002b4c:	00002517          	auipc	a0,0x2
    80002b50:	88450513          	addi	a0,a0,-1916 # 800043d0 <uart_tx_w>
    80002b54:	00063783          	ld	a5,0(a2)
    80002b58:	00053703          	ld	a4,0(a0)
    80002b5c:	04f70263          	beq	a4,a5,80002ba0 <uartintr+0x110>
    80002b60:	100005b7          	lui	a1,0x10000
    80002b64:	00003817          	auipc	a6,0x3
    80002b68:	abc80813          	addi	a6,a6,-1348 # 80005620 <uart_tx_buf>
    80002b6c:	01c0006f          	j	80002b88 <uartintr+0xf8>
    80002b70:	0006c703          	lbu	a4,0(a3)
    80002b74:	00f63023          	sd	a5,0(a2)
    80002b78:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80002b7c:	00063783          	ld	a5,0(a2)
    80002b80:	00053703          	ld	a4,0(a0)
    80002b84:	02f70063          	beq	a4,a5,80002ba4 <uartintr+0x114>
    80002b88:	01f7f713          	andi	a4,a5,31
    80002b8c:	00e806b3          	add	a3,a6,a4
    80002b90:	0055c703          	lbu	a4,5(a1)
    80002b94:	00178793          	addi	a5,a5,1
    80002b98:	02077713          	andi	a4,a4,32
    80002b9c:	fc071ae3          	bnez	a4,80002b70 <uartintr+0xe0>
    80002ba0:	00008067          	ret
    80002ba4:	00008067          	ret

0000000080002ba8 <kinit>:
    80002ba8:	fc010113          	addi	sp,sp,-64
    80002bac:	02913423          	sd	s1,40(sp)
    80002bb0:	fffff7b7          	lui	a5,0xfffff
    80002bb4:	00004497          	auipc	s1,0x4
    80002bb8:	a8b48493          	addi	s1,s1,-1397 # 8000663f <end+0xfff>
    80002bbc:	02813823          	sd	s0,48(sp)
    80002bc0:	01313c23          	sd	s3,24(sp)
    80002bc4:	00f4f4b3          	and	s1,s1,a5
    80002bc8:	02113c23          	sd	ra,56(sp)
    80002bcc:	03213023          	sd	s2,32(sp)
    80002bd0:	01413823          	sd	s4,16(sp)
    80002bd4:	01513423          	sd	s5,8(sp)
    80002bd8:	04010413          	addi	s0,sp,64
    80002bdc:	000017b7          	lui	a5,0x1
    80002be0:	01100993          	li	s3,17
    80002be4:	00f487b3          	add	a5,s1,a5
    80002be8:	01b99993          	slli	s3,s3,0x1b
    80002bec:	06f9e063          	bltu	s3,a5,80002c4c <kinit+0xa4>
    80002bf0:	00003a97          	auipc	s5,0x3
    80002bf4:	a50a8a93          	addi	s5,s5,-1456 # 80005640 <end>
    80002bf8:	0754ec63          	bltu	s1,s5,80002c70 <kinit+0xc8>
    80002bfc:	0734fa63          	bgeu	s1,s3,80002c70 <kinit+0xc8>
    80002c00:	00088a37          	lui	s4,0x88
    80002c04:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80002c08:	00001917          	auipc	s2,0x1
    80002c0c:	7d090913          	addi	s2,s2,2000 # 800043d8 <kmem>
    80002c10:	00ca1a13          	slli	s4,s4,0xc
    80002c14:	0140006f          	j	80002c28 <kinit+0x80>
    80002c18:	000017b7          	lui	a5,0x1
    80002c1c:	00f484b3          	add	s1,s1,a5
    80002c20:	0554e863          	bltu	s1,s5,80002c70 <kinit+0xc8>
    80002c24:	0534f663          	bgeu	s1,s3,80002c70 <kinit+0xc8>
    80002c28:	00001637          	lui	a2,0x1
    80002c2c:	00100593          	li	a1,1
    80002c30:	00048513          	mv	a0,s1
    80002c34:	00000097          	auipc	ra,0x0
    80002c38:	5e4080e7          	jalr	1508(ra) # 80003218 <__memset>
    80002c3c:	00093783          	ld	a5,0(s2)
    80002c40:	00f4b023          	sd	a5,0(s1)
    80002c44:	00993023          	sd	s1,0(s2)
    80002c48:	fd4498e3          	bne	s1,s4,80002c18 <kinit+0x70>
    80002c4c:	03813083          	ld	ra,56(sp)
    80002c50:	03013403          	ld	s0,48(sp)
    80002c54:	02813483          	ld	s1,40(sp)
    80002c58:	02013903          	ld	s2,32(sp)
    80002c5c:	01813983          	ld	s3,24(sp)
    80002c60:	01013a03          	ld	s4,16(sp)
    80002c64:	00813a83          	ld	s5,8(sp)
    80002c68:	04010113          	addi	sp,sp,64
    80002c6c:	00008067          	ret
    80002c70:	00001517          	auipc	a0,0x1
    80002c74:	52050513          	addi	a0,a0,1312 # 80004190 <digits+0x18>
    80002c78:	fffff097          	auipc	ra,0xfffff
    80002c7c:	4b4080e7          	jalr	1204(ra) # 8000212c <panic>

0000000080002c80 <freerange>:
    80002c80:	fc010113          	addi	sp,sp,-64
    80002c84:	000017b7          	lui	a5,0x1
    80002c88:	02913423          	sd	s1,40(sp)
    80002c8c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80002c90:	009504b3          	add	s1,a0,s1
    80002c94:	fffff537          	lui	a0,0xfffff
    80002c98:	02813823          	sd	s0,48(sp)
    80002c9c:	02113c23          	sd	ra,56(sp)
    80002ca0:	03213023          	sd	s2,32(sp)
    80002ca4:	01313c23          	sd	s3,24(sp)
    80002ca8:	01413823          	sd	s4,16(sp)
    80002cac:	01513423          	sd	s5,8(sp)
    80002cb0:	01613023          	sd	s6,0(sp)
    80002cb4:	04010413          	addi	s0,sp,64
    80002cb8:	00a4f4b3          	and	s1,s1,a0
    80002cbc:	00f487b3          	add	a5,s1,a5
    80002cc0:	06f5e463          	bltu	a1,a5,80002d28 <freerange+0xa8>
    80002cc4:	00003a97          	auipc	s5,0x3
    80002cc8:	97ca8a93          	addi	s5,s5,-1668 # 80005640 <end>
    80002ccc:	0954e263          	bltu	s1,s5,80002d50 <freerange+0xd0>
    80002cd0:	01100993          	li	s3,17
    80002cd4:	01b99993          	slli	s3,s3,0x1b
    80002cd8:	0734fc63          	bgeu	s1,s3,80002d50 <freerange+0xd0>
    80002cdc:	00058a13          	mv	s4,a1
    80002ce0:	00001917          	auipc	s2,0x1
    80002ce4:	6f890913          	addi	s2,s2,1784 # 800043d8 <kmem>
    80002ce8:	00002b37          	lui	s6,0x2
    80002cec:	0140006f          	j	80002d00 <freerange+0x80>
    80002cf0:	000017b7          	lui	a5,0x1
    80002cf4:	00f484b3          	add	s1,s1,a5
    80002cf8:	0554ec63          	bltu	s1,s5,80002d50 <freerange+0xd0>
    80002cfc:	0534fa63          	bgeu	s1,s3,80002d50 <freerange+0xd0>
    80002d00:	00001637          	lui	a2,0x1
    80002d04:	00100593          	li	a1,1
    80002d08:	00048513          	mv	a0,s1
    80002d0c:	00000097          	auipc	ra,0x0
    80002d10:	50c080e7          	jalr	1292(ra) # 80003218 <__memset>
    80002d14:	00093703          	ld	a4,0(s2)
    80002d18:	016487b3          	add	a5,s1,s6
    80002d1c:	00e4b023          	sd	a4,0(s1)
    80002d20:	00993023          	sd	s1,0(s2)
    80002d24:	fcfa76e3          	bgeu	s4,a5,80002cf0 <freerange+0x70>
    80002d28:	03813083          	ld	ra,56(sp)
    80002d2c:	03013403          	ld	s0,48(sp)
    80002d30:	02813483          	ld	s1,40(sp)
    80002d34:	02013903          	ld	s2,32(sp)
    80002d38:	01813983          	ld	s3,24(sp)
    80002d3c:	01013a03          	ld	s4,16(sp)
    80002d40:	00813a83          	ld	s5,8(sp)
    80002d44:	00013b03          	ld	s6,0(sp)
    80002d48:	04010113          	addi	sp,sp,64
    80002d4c:	00008067          	ret
    80002d50:	00001517          	auipc	a0,0x1
    80002d54:	44050513          	addi	a0,a0,1088 # 80004190 <digits+0x18>
    80002d58:	fffff097          	auipc	ra,0xfffff
    80002d5c:	3d4080e7          	jalr	980(ra) # 8000212c <panic>

0000000080002d60 <kfree>:
    80002d60:	fe010113          	addi	sp,sp,-32
    80002d64:	00813823          	sd	s0,16(sp)
    80002d68:	00113c23          	sd	ra,24(sp)
    80002d6c:	00913423          	sd	s1,8(sp)
    80002d70:	02010413          	addi	s0,sp,32
    80002d74:	03451793          	slli	a5,a0,0x34
    80002d78:	04079c63          	bnez	a5,80002dd0 <kfree+0x70>
    80002d7c:	00003797          	auipc	a5,0x3
    80002d80:	8c478793          	addi	a5,a5,-1852 # 80005640 <end>
    80002d84:	00050493          	mv	s1,a0
    80002d88:	04f56463          	bltu	a0,a5,80002dd0 <kfree+0x70>
    80002d8c:	01100793          	li	a5,17
    80002d90:	01b79793          	slli	a5,a5,0x1b
    80002d94:	02f57e63          	bgeu	a0,a5,80002dd0 <kfree+0x70>
    80002d98:	00001637          	lui	a2,0x1
    80002d9c:	00100593          	li	a1,1
    80002da0:	00000097          	auipc	ra,0x0
    80002da4:	478080e7          	jalr	1144(ra) # 80003218 <__memset>
    80002da8:	00001797          	auipc	a5,0x1
    80002dac:	63078793          	addi	a5,a5,1584 # 800043d8 <kmem>
    80002db0:	0007b703          	ld	a4,0(a5)
    80002db4:	01813083          	ld	ra,24(sp)
    80002db8:	01013403          	ld	s0,16(sp)
    80002dbc:	00e4b023          	sd	a4,0(s1)
    80002dc0:	0097b023          	sd	s1,0(a5)
    80002dc4:	00813483          	ld	s1,8(sp)
    80002dc8:	02010113          	addi	sp,sp,32
    80002dcc:	00008067          	ret
    80002dd0:	00001517          	auipc	a0,0x1
    80002dd4:	3c050513          	addi	a0,a0,960 # 80004190 <digits+0x18>
    80002dd8:	fffff097          	auipc	ra,0xfffff
    80002ddc:	354080e7          	jalr	852(ra) # 8000212c <panic>

0000000080002de0 <kalloc>:
    80002de0:	fe010113          	addi	sp,sp,-32
    80002de4:	00813823          	sd	s0,16(sp)
    80002de8:	00913423          	sd	s1,8(sp)
    80002dec:	00113c23          	sd	ra,24(sp)
    80002df0:	02010413          	addi	s0,sp,32
    80002df4:	00001797          	auipc	a5,0x1
    80002df8:	5e478793          	addi	a5,a5,1508 # 800043d8 <kmem>
    80002dfc:	0007b483          	ld	s1,0(a5)
    80002e00:	02048063          	beqz	s1,80002e20 <kalloc+0x40>
    80002e04:	0004b703          	ld	a4,0(s1)
    80002e08:	00001637          	lui	a2,0x1
    80002e0c:	00500593          	li	a1,5
    80002e10:	00048513          	mv	a0,s1
    80002e14:	00e7b023          	sd	a4,0(a5)
    80002e18:	00000097          	auipc	ra,0x0
    80002e1c:	400080e7          	jalr	1024(ra) # 80003218 <__memset>
    80002e20:	01813083          	ld	ra,24(sp)
    80002e24:	01013403          	ld	s0,16(sp)
    80002e28:	00048513          	mv	a0,s1
    80002e2c:	00813483          	ld	s1,8(sp)
    80002e30:	02010113          	addi	sp,sp,32
    80002e34:	00008067          	ret

0000000080002e38 <initlock>:
    80002e38:	ff010113          	addi	sp,sp,-16
    80002e3c:	00813423          	sd	s0,8(sp)
    80002e40:	01010413          	addi	s0,sp,16
    80002e44:	00813403          	ld	s0,8(sp)
    80002e48:	00b53423          	sd	a1,8(a0)
    80002e4c:	00052023          	sw	zero,0(a0)
    80002e50:	00053823          	sd	zero,16(a0)
    80002e54:	01010113          	addi	sp,sp,16
    80002e58:	00008067          	ret

0000000080002e5c <acquire>:
    80002e5c:	fe010113          	addi	sp,sp,-32
    80002e60:	00813823          	sd	s0,16(sp)
    80002e64:	00913423          	sd	s1,8(sp)
    80002e68:	00113c23          	sd	ra,24(sp)
    80002e6c:	01213023          	sd	s2,0(sp)
    80002e70:	02010413          	addi	s0,sp,32
    80002e74:	00050493          	mv	s1,a0
    80002e78:	10002973          	csrr	s2,sstatus
    80002e7c:	100027f3          	csrr	a5,sstatus
    80002e80:	ffd7f793          	andi	a5,a5,-3
    80002e84:	10079073          	csrw	sstatus,a5
    80002e88:	fffff097          	auipc	ra,0xfffff
    80002e8c:	8e0080e7          	jalr	-1824(ra) # 80001768 <mycpu>
    80002e90:	07852783          	lw	a5,120(a0)
    80002e94:	06078e63          	beqz	a5,80002f10 <acquire+0xb4>
    80002e98:	fffff097          	auipc	ra,0xfffff
    80002e9c:	8d0080e7          	jalr	-1840(ra) # 80001768 <mycpu>
    80002ea0:	07852783          	lw	a5,120(a0)
    80002ea4:	0004a703          	lw	a4,0(s1)
    80002ea8:	0017879b          	addiw	a5,a5,1
    80002eac:	06f52c23          	sw	a5,120(a0)
    80002eb0:	04071063          	bnez	a4,80002ef0 <acquire+0x94>
    80002eb4:	00100713          	li	a4,1
    80002eb8:	00070793          	mv	a5,a4
    80002ebc:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80002ec0:	0007879b          	sext.w	a5,a5
    80002ec4:	fe079ae3          	bnez	a5,80002eb8 <acquire+0x5c>
    80002ec8:	0ff0000f          	fence
    80002ecc:	fffff097          	auipc	ra,0xfffff
    80002ed0:	89c080e7          	jalr	-1892(ra) # 80001768 <mycpu>
    80002ed4:	01813083          	ld	ra,24(sp)
    80002ed8:	01013403          	ld	s0,16(sp)
    80002edc:	00a4b823          	sd	a0,16(s1)
    80002ee0:	00013903          	ld	s2,0(sp)
    80002ee4:	00813483          	ld	s1,8(sp)
    80002ee8:	02010113          	addi	sp,sp,32
    80002eec:	00008067          	ret
    80002ef0:	0104b903          	ld	s2,16(s1)
    80002ef4:	fffff097          	auipc	ra,0xfffff
    80002ef8:	874080e7          	jalr	-1932(ra) # 80001768 <mycpu>
    80002efc:	faa91ce3          	bne	s2,a0,80002eb4 <acquire+0x58>
    80002f00:	00001517          	auipc	a0,0x1
    80002f04:	29850513          	addi	a0,a0,664 # 80004198 <digits+0x20>
    80002f08:	fffff097          	auipc	ra,0xfffff
    80002f0c:	224080e7          	jalr	548(ra) # 8000212c <panic>
    80002f10:	00195913          	srli	s2,s2,0x1
    80002f14:	fffff097          	auipc	ra,0xfffff
    80002f18:	854080e7          	jalr	-1964(ra) # 80001768 <mycpu>
    80002f1c:	00197913          	andi	s2,s2,1
    80002f20:	07252e23          	sw	s2,124(a0)
    80002f24:	f75ff06f          	j	80002e98 <acquire+0x3c>

0000000080002f28 <release>:
    80002f28:	fe010113          	addi	sp,sp,-32
    80002f2c:	00813823          	sd	s0,16(sp)
    80002f30:	00113c23          	sd	ra,24(sp)
    80002f34:	00913423          	sd	s1,8(sp)
    80002f38:	01213023          	sd	s2,0(sp)
    80002f3c:	02010413          	addi	s0,sp,32
    80002f40:	00052783          	lw	a5,0(a0)
    80002f44:	00079a63          	bnez	a5,80002f58 <release+0x30>
    80002f48:	00001517          	auipc	a0,0x1
    80002f4c:	25850513          	addi	a0,a0,600 # 800041a0 <digits+0x28>
    80002f50:	fffff097          	auipc	ra,0xfffff
    80002f54:	1dc080e7          	jalr	476(ra) # 8000212c <panic>
    80002f58:	01053903          	ld	s2,16(a0)
    80002f5c:	00050493          	mv	s1,a0
    80002f60:	fffff097          	auipc	ra,0xfffff
    80002f64:	808080e7          	jalr	-2040(ra) # 80001768 <mycpu>
    80002f68:	fea910e3          	bne	s2,a0,80002f48 <release+0x20>
    80002f6c:	0004b823          	sd	zero,16(s1)
    80002f70:	0ff0000f          	fence
    80002f74:	0f50000f          	fence	iorw,ow
    80002f78:	0804a02f          	amoswap.w	zero,zero,(s1)
    80002f7c:	ffffe097          	auipc	ra,0xffffe
    80002f80:	7ec080e7          	jalr	2028(ra) # 80001768 <mycpu>
    80002f84:	100027f3          	csrr	a5,sstatus
    80002f88:	0027f793          	andi	a5,a5,2
    80002f8c:	04079a63          	bnez	a5,80002fe0 <release+0xb8>
    80002f90:	07852783          	lw	a5,120(a0)
    80002f94:	02f05e63          	blez	a5,80002fd0 <release+0xa8>
    80002f98:	fff7871b          	addiw	a4,a5,-1
    80002f9c:	06e52c23          	sw	a4,120(a0)
    80002fa0:	00071c63          	bnez	a4,80002fb8 <release+0x90>
    80002fa4:	07c52783          	lw	a5,124(a0)
    80002fa8:	00078863          	beqz	a5,80002fb8 <release+0x90>
    80002fac:	100027f3          	csrr	a5,sstatus
    80002fb0:	0027e793          	ori	a5,a5,2
    80002fb4:	10079073          	csrw	sstatus,a5
    80002fb8:	01813083          	ld	ra,24(sp)
    80002fbc:	01013403          	ld	s0,16(sp)
    80002fc0:	00813483          	ld	s1,8(sp)
    80002fc4:	00013903          	ld	s2,0(sp)
    80002fc8:	02010113          	addi	sp,sp,32
    80002fcc:	00008067          	ret
    80002fd0:	00001517          	auipc	a0,0x1
    80002fd4:	1f050513          	addi	a0,a0,496 # 800041c0 <digits+0x48>
    80002fd8:	fffff097          	auipc	ra,0xfffff
    80002fdc:	154080e7          	jalr	340(ra) # 8000212c <panic>
    80002fe0:	00001517          	auipc	a0,0x1
    80002fe4:	1c850513          	addi	a0,a0,456 # 800041a8 <digits+0x30>
    80002fe8:	fffff097          	auipc	ra,0xfffff
    80002fec:	144080e7          	jalr	324(ra) # 8000212c <panic>

0000000080002ff0 <holding>:
    80002ff0:	00052783          	lw	a5,0(a0)
    80002ff4:	00079663          	bnez	a5,80003000 <holding+0x10>
    80002ff8:	00000513          	li	a0,0
    80002ffc:	00008067          	ret
    80003000:	fe010113          	addi	sp,sp,-32
    80003004:	00813823          	sd	s0,16(sp)
    80003008:	00913423          	sd	s1,8(sp)
    8000300c:	00113c23          	sd	ra,24(sp)
    80003010:	02010413          	addi	s0,sp,32
    80003014:	01053483          	ld	s1,16(a0)
    80003018:	ffffe097          	auipc	ra,0xffffe
    8000301c:	750080e7          	jalr	1872(ra) # 80001768 <mycpu>
    80003020:	01813083          	ld	ra,24(sp)
    80003024:	01013403          	ld	s0,16(sp)
    80003028:	40a48533          	sub	a0,s1,a0
    8000302c:	00153513          	seqz	a0,a0
    80003030:	00813483          	ld	s1,8(sp)
    80003034:	02010113          	addi	sp,sp,32
    80003038:	00008067          	ret

000000008000303c <push_off>:
    8000303c:	fe010113          	addi	sp,sp,-32
    80003040:	00813823          	sd	s0,16(sp)
    80003044:	00113c23          	sd	ra,24(sp)
    80003048:	00913423          	sd	s1,8(sp)
    8000304c:	02010413          	addi	s0,sp,32
    80003050:	100024f3          	csrr	s1,sstatus
    80003054:	100027f3          	csrr	a5,sstatus
    80003058:	ffd7f793          	andi	a5,a5,-3
    8000305c:	10079073          	csrw	sstatus,a5
    80003060:	ffffe097          	auipc	ra,0xffffe
    80003064:	708080e7          	jalr	1800(ra) # 80001768 <mycpu>
    80003068:	07852783          	lw	a5,120(a0)
    8000306c:	02078663          	beqz	a5,80003098 <push_off+0x5c>
    80003070:	ffffe097          	auipc	ra,0xffffe
    80003074:	6f8080e7          	jalr	1784(ra) # 80001768 <mycpu>
    80003078:	07852783          	lw	a5,120(a0)
    8000307c:	01813083          	ld	ra,24(sp)
    80003080:	01013403          	ld	s0,16(sp)
    80003084:	0017879b          	addiw	a5,a5,1
    80003088:	06f52c23          	sw	a5,120(a0)
    8000308c:	00813483          	ld	s1,8(sp)
    80003090:	02010113          	addi	sp,sp,32
    80003094:	00008067          	ret
    80003098:	0014d493          	srli	s1,s1,0x1
    8000309c:	ffffe097          	auipc	ra,0xffffe
    800030a0:	6cc080e7          	jalr	1740(ra) # 80001768 <mycpu>
    800030a4:	0014f493          	andi	s1,s1,1
    800030a8:	06952e23          	sw	s1,124(a0)
    800030ac:	fc5ff06f          	j	80003070 <push_off+0x34>

00000000800030b0 <pop_off>:
    800030b0:	ff010113          	addi	sp,sp,-16
    800030b4:	00813023          	sd	s0,0(sp)
    800030b8:	00113423          	sd	ra,8(sp)
    800030bc:	01010413          	addi	s0,sp,16
    800030c0:	ffffe097          	auipc	ra,0xffffe
    800030c4:	6a8080e7          	jalr	1704(ra) # 80001768 <mycpu>
    800030c8:	100027f3          	csrr	a5,sstatus
    800030cc:	0027f793          	andi	a5,a5,2
    800030d0:	04079663          	bnez	a5,8000311c <pop_off+0x6c>
    800030d4:	07852783          	lw	a5,120(a0)
    800030d8:	02f05a63          	blez	a5,8000310c <pop_off+0x5c>
    800030dc:	fff7871b          	addiw	a4,a5,-1
    800030e0:	06e52c23          	sw	a4,120(a0)
    800030e4:	00071c63          	bnez	a4,800030fc <pop_off+0x4c>
    800030e8:	07c52783          	lw	a5,124(a0)
    800030ec:	00078863          	beqz	a5,800030fc <pop_off+0x4c>
    800030f0:	100027f3          	csrr	a5,sstatus
    800030f4:	0027e793          	ori	a5,a5,2
    800030f8:	10079073          	csrw	sstatus,a5
    800030fc:	00813083          	ld	ra,8(sp)
    80003100:	00013403          	ld	s0,0(sp)
    80003104:	01010113          	addi	sp,sp,16
    80003108:	00008067          	ret
    8000310c:	00001517          	auipc	a0,0x1
    80003110:	0b450513          	addi	a0,a0,180 # 800041c0 <digits+0x48>
    80003114:	fffff097          	auipc	ra,0xfffff
    80003118:	018080e7          	jalr	24(ra) # 8000212c <panic>
    8000311c:	00001517          	auipc	a0,0x1
    80003120:	08c50513          	addi	a0,a0,140 # 800041a8 <digits+0x30>
    80003124:	fffff097          	auipc	ra,0xfffff
    80003128:	008080e7          	jalr	8(ra) # 8000212c <panic>

000000008000312c <push_on>:
    8000312c:	fe010113          	addi	sp,sp,-32
    80003130:	00813823          	sd	s0,16(sp)
    80003134:	00113c23          	sd	ra,24(sp)
    80003138:	00913423          	sd	s1,8(sp)
    8000313c:	02010413          	addi	s0,sp,32
    80003140:	100024f3          	csrr	s1,sstatus
    80003144:	100027f3          	csrr	a5,sstatus
    80003148:	0027e793          	ori	a5,a5,2
    8000314c:	10079073          	csrw	sstatus,a5
    80003150:	ffffe097          	auipc	ra,0xffffe
    80003154:	618080e7          	jalr	1560(ra) # 80001768 <mycpu>
    80003158:	07852783          	lw	a5,120(a0)
    8000315c:	02078663          	beqz	a5,80003188 <push_on+0x5c>
    80003160:	ffffe097          	auipc	ra,0xffffe
    80003164:	608080e7          	jalr	1544(ra) # 80001768 <mycpu>
    80003168:	07852783          	lw	a5,120(a0)
    8000316c:	01813083          	ld	ra,24(sp)
    80003170:	01013403          	ld	s0,16(sp)
    80003174:	0017879b          	addiw	a5,a5,1
    80003178:	06f52c23          	sw	a5,120(a0)
    8000317c:	00813483          	ld	s1,8(sp)
    80003180:	02010113          	addi	sp,sp,32
    80003184:	00008067          	ret
    80003188:	0014d493          	srli	s1,s1,0x1
    8000318c:	ffffe097          	auipc	ra,0xffffe
    80003190:	5dc080e7          	jalr	1500(ra) # 80001768 <mycpu>
    80003194:	0014f493          	andi	s1,s1,1
    80003198:	06952e23          	sw	s1,124(a0)
    8000319c:	fc5ff06f          	j	80003160 <push_on+0x34>

00000000800031a0 <pop_on>:
    800031a0:	ff010113          	addi	sp,sp,-16
    800031a4:	00813023          	sd	s0,0(sp)
    800031a8:	00113423          	sd	ra,8(sp)
    800031ac:	01010413          	addi	s0,sp,16
    800031b0:	ffffe097          	auipc	ra,0xffffe
    800031b4:	5b8080e7          	jalr	1464(ra) # 80001768 <mycpu>
    800031b8:	100027f3          	csrr	a5,sstatus
    800031bc:	0027f793          	andi	a5,a5,2
    800031c0:	04078463          	beqz	a5,80003208 <pop_on+0x68>
    800031c4:	07852783          	lw	a5,120(a0)
    800031c8:	02f05863          	blez	a5,800031f8 <pop_on+0x58>
    800031cc:	fff7879b          	addiw	a5,a5,-1
    800031d0:	06f52c23          	sw	a5,120(a0)
    800031d4:	07853783          	ld	a5,120(a0)
    800031d8:	00079863          	bnez	a5,800031e8 <pop_on+0x48>
    800031dc:	100027f3          	csrr	a5,sstatus
    800031e0:	ffd7f793          	andi	a5,a5,-3
    800031e4:	10079073          	csrw	sstatus,a5
    800031e8:	00813083          	ld	ra,8(sp)
    800031ec:	00013403          	ld	s0,0(sp)
    800031f0:	01010113          	addi	sp,sp,16
    800031f4:	00008067          	ret
    800031f8:	00001517          	auipc	a0,0x1
    800031fc:	ff050513          	addi	a0,a0,-16 # 800041e8 <digits+0x70>
    80003200:	fffff097          	auipc	ra,0xfffff
    80003204:	f2c080e7          	jalr	-212(ra) # 8000212c <panic>
    80003208:	00001517          	auipc	a0,0x1
    8000320c:	fc050513          	addi	a0,a0,-64 # 800041c8 <digits+0x50>
    80003210:	fffff097          	auipc	ra,0xfffff
    80003214:	f1c080e7          	jalr	-228(ra) # 8000212c <panic>

0000000080003218 <__memset>:
    80003218:	ff010113          	addi	sp,sp,-16
    8000321c:	00813423          	sd	s0,8(sp)
    80003220:	01010413          	addi	s0,sp,16
    80003224:	1a060e63          	beqz	a2,800033e0 <__memset+0x1c8>
    80003228:	40a007b3          	neg	a5,a0
    8000322c:	0077f793          	andi	a5,a5,7
    80003230:	00778693          	addi	a3,a5,7
    80003234:	00b00813          	li	a6,11
    80003238:	0ff5f593          	andi	a1,a1,255
    8000323c:	fff6071b          	addiw	a4,a2,-1
    80003240:	1b06e663          	bltu	a3,a6,800033ec <__memset+0x1d4>
    80003244:	1cd76463          	bltu	a4,a3,8000340c <__memset+0x1f4>
    80003248:	1a078e63          	beqz	a5,80003404 <__memset+0x1ec>
    8000324c:	00b50023          	sb	a1,0(a0)
    80003250:	00100713          	li	a4,1
    80003254:	1ae78463          	beq	a5,a4,800033fc <__memset+0x1e4>
    80003258:	00b500a3          	sb	a1,1(a0)
    8000325c:	00200713          	li	a4,2
    80003260:	1ae78a63          	beq	a5,a4,80003414 <__memset+0x1fc>
    80003264:	00b50123          	sb	a1,2(a0)
    80003268:	00300713          	li	a4,3
    8000326c:	18e78463          	beq	a5,a4,800033f4 <__memset+0x1dc>
    80003270:	00b501a3          	sb	a1,3(a0)
    80003274:	00400713          	li	a4,4
    80003278:	1ae78263          	beq	a5,a4,8000341c <__memset+0x204>
    8000327c:	00b50223          	sb	a1,4(a0)
    80003280:	00500713          	li	a4,5
    80003284:	1ae78063          	beq	a5,a4,80003424 <__memset+0x20c>
    80003288:	00b502a3          	sb	a1,5(a0)
    8000328c:	00700713          	li	a4,7
    80003290:	18e79e63          	bne	a5,a4,8000342c <__memset+0x214>
    80003294:	00b50323          	sb	a1,6(a0)
    80003298:	00700e93          	li	t4,7
    8000329c:	00859713          	slli	a4,a1,0x8
    800032a0:	00e5e733          	or	a4,a1,a4
    800032a4:	01059e13          	slli	t3,a1,0x10
    800032a8:	01c76e33          	or	t3,a4,t3
    800032ac:	01859313          	slli	t1,a1,0x18
    800032b0:	006e6333          	or	t1,t3,t1
    800032b4:	02059893          	slli	a7,a1,0x20
    800032b8:	40f60e3b          	subw	t3,a2,a5
    800032bc:	011368b3          	or	a7,t1,a7
    800032c0:	02859813          	slli	a6,a1,0x28
    800032c4:	0108e833          	or	a6,a7,a6
    800032c8:	03059693          	slli	a3,a1,0x30
    800032cc:	003e589b          	srliw	a7,t3,0x3
    800032d0:	00d866b3          	or	a3,a6,a3
    800032d4:	03859713          	slli	a4,a1,0x38
    800032d8:	00389813          	slli	a6,a7,0x3
    800032dc:	00f507b3          	add	a5,a0,a5
    800032e0:	00e6e733          	or	a4,a3,a4
    800032e4:	000e089b          	sext.w	a7,t3
    800032e8:	00f806b3          	add	a3,a6,a5
    800032ec:	00e7b023          	sd	a4,0(a5)
    800032f0:	00878793          	addi	a5,a5,8
    800032f4:	fed79ce3          	bne	a5,a3,800032ec <__memset+0xd4>
    800032f8:	ff8e7793          	andi	a5,t3,-8
    800032fc:	0007871b          	sext.w	a4,a5
    80003300:	01d787bb          	addw	a5,a5,t4
    80003304:	0ce88e63          	beq	a7,a4,800033e0 <__memset+0x1c8>
    80003308:	00f50733          	add	a4,a0,a5
    8000330c:	00b70023          	sb	a1,0(a4)
    80003310:	0017871b          	addiw	a4,a5,1
    80003314:	0cc77663          	bgeu	a4,a2,800033e0 <__memset+0x1c8>
    80003318:	00e50733          	add	a4,a0,a4
    8000331c:	00b70023          	sb	a1,0(a4)
    80003320:	0027871b          	addiw	a4,a5,2
    80003324:	0ac77e63          	bgeu	a4,a2,800033e0 <__memset+0x1c8>
    80003328:	00e50733          	add	a4,a0,a4
    8000332c:	00b70023          	sb	a1,0(a4)
    80003330:	0037871b          	addiw	a4,a5,3
    80003334:	0ac77663          	bgeu	a4,a2,800033e0 <__memset+0x1c8>
    80003338:	00e50733          	add	a4,a0,a4
    8000333c:	00b70023          	sb	a1,0(a4)
    80003340:	0047871b          	addiw	a4,a5,4
    80003344:	08c77e63          	bgeu	a4,a2,800033e0 <__memset+0x1c8>
    80003348:	00e50733          	add	a4,a0,a4
    8000334c:	00b70023          	sb	a1,0(a4)
    80003350:	0057871b          	addiw	a4,a5,5
    80003354:	08c77663          	bgeu	a4,a2,800033e0 <__memset+0x1c8>
    80003358:	00e50733          	add	a4,a0,a4
    8000335c:	00b70023          	sb	a1,0(a4)
    80003360:	0067871b          	addiw	a4,a5,6
    80003364:	06c77e63          	bgeu	a4,a2,800033e0 <__memset+0x1c8>
    80003368:	00e50733          	add	a4,a0,a4
    8000336c:	00b70023          	sb	a1,0(a4)
    80003370:	0077871b          	addiw	a4,a5,7
    80003374:	06c77663          	bgeu	a4,a2,800033e0 <__memset+0x1c8>
    80003378:	00e50733          	add	a4,a0,a4
    8000337c:	00b70023          	sb	a1,0(a4)
    80003380:	0087871b          	addiw	a4,a5,8
    80003384:	04c77e63          	bgeu	a4,a2,800033e0 <__memset+0x1c8>
    80003388:	00e50733          	add	a4,a0,a4
    8000338c:	00b70023          	sb	a1,0(a4)
    80003390:	0097871b          	addiw	a4,a5,9
    80003394:	04c77663          	bgeu	a4,a2,800033e0 <__memset+0x1c8>
    80003398:	00e50733          	add	a4,a0,a4
    8000339c:	00b70023          	sb	a1,0(a4)
    800033a0:	00a7871b          	addiw	a4,a5,10
    800033a4:	02c77e63          	bgeu	a4,a2,800033e0 <__memset+0x1c8>
    800033a8:	00e50733          	add	a4,a0,a4
    800033ac:	00b70023          	sb	a1,0(a4)
    800033b0:	00b7871b          	addiw	a4,a5,11
    800033b4:	02c77663          	bgeu	a4,a2,800033e0 <__memset+0x1c8>
    800033b8:	00e50733          	add	a4,a0,a4
    800033bc:	00b70023          	sb	a1,0(a4)
    800033c0:	00c7871b          	addiw	a4,a5,12
    800033c4:	00c77e63          	bgeu	a4,a2,800033e0 <__memset+0x1c8>
    800033c8:	00e50733          	add	a4,a0,a4
    800033cc:	00b70023          	sb	a1,0(a4)
    800033d0:	00d7879b          	addiw	a5,a5,13
    800033d4:	00c7f663          	bgeu	a5,a2,800033e0 <__memset+0x1c8>
    800033d8:	00f507b3          	add	a5,a0,a5
    800033dc:	00b78023          	sb	a1,0(a5)
    800033e0:	00813403          	ld	s0,8(sp)
    800033e4:	01010113          	addi	sp,sp,16
    800033e8:	00008067          	ret
    800033ec:	00b00693          	li	a3,11
    800033f0:	e55ff06f          	j	80003244 <__memset+0x2c>
    800033f4:	00300e93          	li	t4,3
    800033f8:	ea5ff06f          	j	8000329c <__memset+0x84>
    800033fc:	00100e93          	li	t4,1
    80003400:	e9dff06f          	j	8000329c <__memset+0x84>
    80003404:	00000e93          	li	t4,0
    80003408:	e95ff06f          	j	8000329c <__memset+0x84>
    8000340c:	00000793          	li	a5,0
    80003410:	ef9ff06f          	j	80003308 <__memset+0xf0>
    80003414:	00200e93          	li	t4,2
    80003418:	e85ff06f          	j	8000329c <__memset+0x84>
    8000341c:	00400e93          	li	t4,4
    80003420:	e7dff06f          	j	8000329c <__memset+0x84>
    80003424:	00500e93          	li	t4,5
    80003428:	e75ff06f          	j	8000329c <__memset+0x84>
    8000342c:	00600e93          	li	t4,6
    80003430:	e6dff06f          	j	8000329c <__memset+0x84>

0000000080003434 <__memmove>:
    80003434:	ff010113          	addi	sp,sp,-16
    80003438:	00813423          	sd	s0,8(sp)
    8000343c:	01010413          	addi	s0,sp,16
    80003440:	0e060863          	beqz	a2,80003530 <__memmove+0xfc>
    80003444:	fff6069b          	addiw	a3,a2,-1
    80003448:	0006881b          	sext.w	a6,a3
    8000344c:	0ea5e863          	bltu	a1,a0,8000353c <__memmove+0x108>
    80003450:	00758713          	addi	a4,a1,7
    80003454:	00a5e7b3          	or	a5,a1,a0
    80003458:	40a70733          	sub	a4,a4,a0
    8000345c:	0077f793          	andi	a5,a5,7
    80003460:	00f73713          	sltiu	a4,a4,15
    80003464:	00174713          	xori	a4,a4,1
    80003468:	0017b793          	seqz	a5,a5
    8000346c:	00e7f7b3          	and	a5,a5,a4
    80003470:	10078863          	beqz	a5,80003580 <__memmove+0x14c>
    80003474:	00900793          	li	a5,9
    80003478:	1107f463          	bgeu	a5,a6,80003580 <__memmove+0x14c>
    8000347c:	0036581b          	srliw	a6,a2,0x3
    80003480:	fff8081b          	addiw	a6,a6,-1
    80003484:	02081813          	slli	a6,a6,0x20
    80003488:	01d85893          	srli	a7,a6,0x1d
    8000348c:	00858813          	addi	a6,a1,8
    80003490:	00058793          	mv	a5,a1
    80003494:	00050713          	mv	a4,a0
    80003498:	01088833          	add	a6,a7,a6
    8000349c:	0007b883          	ld	a7,0(a5)
    800034a0:	00878793          	addi	a5,a5,8
    800034a4:	00870713          	addi	a4,a4,8
    800034a8:	ff173c23          	sd	a7,-8(a4)
    800034ac:	ff0798e3          	bne	a5,a6,8000349c <__memmove+0x68>
    800034b0:	ff867713          	andi	a4,a2,-8
    800034b4:	02071793          	slli	a5,a4,0x20
    800034b8:	0207d793          	srli	a5,a5,0x20
    800034bc:	00f585b3          	add	a1,a1,a5
    800034c0:	40e686bb          	subw	a3,a3,a4
    800034c4:	00f507b3          	add	a5,a0,a5
    800034c8:	06e60463          	beq	a2,a4,80003530 <__memmove+0xfc>
    800034cc:	0005c703          	lbu	a4,0(a1)
    800034d0:	00e78023          	sb	a4,0(a5)
    800034d4:	04068e63          	beqz	a3,80003530 <__memmove+0xfc>
    800034d8:	0015c603          	lbu	a2,1(a1)
    800034dc:	00100713          	li	a4,1
    800034e0:	00c780a3          	sb	a2,1(a5)
    800034e4:	04e68663          	beq	a3,a4,80003530 <__memmove+0xfc>
    800034e8:	0025c603          	lbu	a2,2(a1)
    800034ec:	00200713          	li	a4,2
    800034f0:	00c78123          	sb	a2,2(a5)
    800034f4:	02e68e63          	beq	a3,a4,80003530 <__memmove+0xfc>
    800034f8:	0035c603          	lbu	a2,3(a1)
    800034fc:	00300713          	li	a4,3
    80003500:	00c781a3          	sb	a2,3(a5)
    80003504:	02e68663          	beq	a3,a4,80003530 <__memmove+0xfc>
    80003508:	0045c603          	lbu	a2,4(a1)
    8000350c:	00400713          	li	a4,4
    80003510:	00c78223          	sb	a2,4(a5)
    80003514:	00e68e63          	beq	a3,a4,80003530 <__memmove+0xfc>
    80003518:	0055c603          	lbu	a2,5(a1)
    8000351c:	00500713          	li	a4,5
    80003520:	00c782a3          	sb	a2,5(a5)
    80003524:	00e68663          	beq	a3,a4,80003530 <__memmove+0xfc>
    80003528:	0065c703          	lbu	a4,6(a1)
    8000352c:	00e78323          	sb	a4,6(a5)
    80003530:	00813403          	ld	s0,8(sp)
    80003534:	01010113          	addi	sp,sp,16
    80003538:	00008067          	ret
    8000353c:	02061713          	slli	a4,a2,0x20
    80003540:	02075713          	srli	a4,a4,0x20
    80003544:	00e587b3          	add	a5,a1,a4
    80003548:	f0f574e3          	bgeu	a0,a5,80003450 <__memmove+0x1c>
    8000354c:	02069613          	slli	a2,a3,0x20
    80003550:	02065613          	srli	a2,a2,0x20
    80003554:	fff64613          	not	a2,a2
    80003558:	00e50733          	add	a4,a0,a4
    8000355c:	00c78633          	add	a2,a5,a2
    80003560:	fff7c683          	lbu	a3,-1(a5)
    80003564:	fff78793          	addi	a5,a5,-1
    80003568:	fff70713          	addi	a4,a4,-1
    8000356c:	00d70023          	sb	a3,0(a4)
    80003570:	fec798e3          	bne	a5,a2,80003560 <__memmove+0x12c>
    80003574:	00813403          	ld	s0,8(sp)
    80003578:	01010113          	addi	sp,sp,16
    8000357c:	00008067          	ret
    80003580:	02069713          	slli	a4,a3,0x20
    80003584:	02075713          	srli	a4,a4,0x20
    80003588:	00170713          	addi	a4,a4,1
    8000358c:	00e50733          	add	a4,a0,a4
    80003590:	00050793          	mv	a5,a0
    80003594:	0005c683          	lbu	a3,0(a1)
    80003598:	00178793          	addi	a5,a5,1
    8000359c:	00158593          	addi	a1,a1,1
    800035a0:	fed78fa3          	sb	a3,-1(a5)
    800035a4:	fee798e3          	bne	a5,a4,80003594 <__memmove+0x160>
    800035a8:	f89ff06f          	j	80003530 <__memmove+0xfc>
	...
