section .data
    name db 'Ben Elser', 0xa  ;string to be printed
    len equ $ - name     ;length of the string

section .text
    global _start     ;must be declared for linker (ld)

_start:             ;tells linker entry point
    mov edx,len     ;message length
    mov rsi,name     ;message to write
    mov edi,1       ;file descriptor (stdout)
    mov eax,edi     ;system call number (sys_write)
    syscall         ;call kernel


; Close program
    xor edi, edi    ;Return value = 0
    mov eax,60      ;system call number (sys_exit)
    syscall         ;call kernel
