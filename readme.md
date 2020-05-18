# Getting Started with ASM on Ubuntu using WSL
```bash
sudo apt-get update
sudo apt-get upgrade 
sudo apt-get install nasm
sudo apt-get install binutils
sudo apt-get install gdb
```

## Restart subsystem
```powershell
wsl -t Ubuntu
```

## References 
- [x86_64 syscall table](https://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/)
- [Debugging with gdb](https://cs61.seas.harvard.edu/wiki/Useful_GDB_commands)
- [gdb tui commands](https://sourceware.org/gdb/onlinedocs/gdb/TUI-Commands.html)
- [Registers](https://wiki.cdot.senecacollege.ca/wiki/X86_64_Register_and_Instruction_Quick_Start)
- [x64 cheat sheet1](https://cs.brown.edu/courses/cs033/docs/guides/x64_cheatsheet.pdf)
- [x64 cheat sheet2](https://www.cs.uaf.edu/2017/fall/cs301/reference/x86_64.html)
- [The Definitive Guide to Linux System Calls](https://blog.packagecloud.io/eng/2016/04/05/the-definitive-guide-to-linux-system-calls/#syscallsysret)

## Build 
```bash
nasm -f elf64 -g -F stabs helloworld.asm
ld helloworld.o  -o helloworld
```

## Debug 
```bash
gdb helloworld
(gdb) b 1 # set breakpount on line 1 or in this case start address 
(gdb) layout asm # see asm instructions
(gdb) layout regs # see asm instructions
(gdb) run # run program
(gdb) si # step into
(gdb) info registers edx # print value of register
(gdb) info registers # print all registers
(gdb) x/s 0x402000 # prints value at address
```