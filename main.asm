section .bss
    num resb 32           ; Reserve space for the binary representation

section .text
    global _start

_start:
    mov rdi, 0            ; Initialize number to 0

print_loop:
    call to_binary        ; Convert number to binary
    call print_num        ; Print the binary number

    inc rdi               ; Increment the number
    jmp print_loop        ; Repeat infinitely

to_binary:
    ; Convert number in RDI to binary string
    mov rsi, num + 31     ; Point to the end of the buffer
    mov rcx, 32           ; 32 bits for the binary representation

convert_loop:
    mov rax, rdi          ; Copy number to RAX
    and rax, 1            ; Get the least significant bit
    add rax, '0'          ; Convert bit to ASCII ('0' or '1')
    mov [rsi], al         ; Store ASCII character in buffer

    shr rdi, 1            ; Shift number right by 1 bit
    dec rsi               ; Move to the next position in the buffer
    loop convert_loop     ; Repeat until all bits are processed

    ret

print_num:
    ; Print the null-terminated binary string in num
    mov rsi, num          ; Point to the start of the binary string
    mov rdx, 32           ; Number of bytes to write

print_char:
    mov rax, 1            ; sys_write
    mov rdi, 1            ; file descriptor (stdout)
    syscall               ; invoke the kernel

    ret
