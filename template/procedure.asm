section .data
    name db 'Ben Elser', 0xa  ;string to be printed
    len equ $ - name     ;length of the string

section .text
    global _start     ;must be declared for linker (ld)

writename:  
    ; save registers and allocate space
    sub rsp,32+8; parameter area, and stack alignment
    ; function body
    mov edx,len     ;message length
    mov rsi,name     ;message to write
    mov rdi,1       ;file descriptor (stdout)
    mov rax,rdi     ;system call number (sys_write)
    syscall         ;call kernel
    cmp rax, 0
    je close
    add rsp,32+8 ; clean up stack
    ret
    
close:
; Close program
    xor edi, edi    ;Return value = 0
    mov eax,60      ;system call number (sys_exit)
    syscall         ;call kernel

_start:             ;tells linker entry point
    nop
    mov rbx, 8
    call writename    
    mov rbx, 2
    call close