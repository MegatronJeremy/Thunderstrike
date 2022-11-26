# THUNDERSTRIKE OS
- This is an operating system project made for the college course Operating Systems 1 (OS1), School of Electrical Engineering, Belgrade.
- It was built completely from scratch in C/C++ without any preexisting libraries (and no support for exceptions), 
put toggether to work on a RISC-V 64-bit processor using a host XV6 system, with minimal (or almost no) additional support.

## Operating System Functionality
- **Completely preemptive functionality (including the kernel)**
- **C user interface**
- **C++ user interface**
- **Periodic thread support**
- **Round-robin scheduling algorithm**
- **First Fit memory allocation for heap**
- **Many system threads**
- **And more**

## Needed Linux packages
- build-essential
- qemu-system-misc
- gcc-riscv64-linux-gnu
- binutils-riscv64-linux-gnu
- gdb-multiarch
- g++-riscv64-linux-gnu

Command for installation on an Ubuntu system:
>`sudo apt install git build-essential qemu-system-misc gcc-riscv64-linux-gnu binutils-riscv64-linux-gnu gdb-multiarch g++-riscv64-linux-gnu`

## Starting up

Uncomment/comment wanted tests in `test/userMain.cpp`

### Make commands:
- make clean
- make qemu
- make all
- make qemu-gdb (for debugging)

## Operating Systems project - 2022
