BITS 32
section .data
    msg:  db 'HTTP/1 200 OK', 13, 10, 'Content-Length:15', 13, 10, 13, 10, 'Hello cSphere!',10
    len:  equ $-msg
section .text
global _start
_start:
    xor edx, edx
    xor ebx, ebx
    xor eax, eax
;server=socket(2,1,0)
    inc bl
    push eax
    push ebx
    push byte 0x2
    mov ecx,esp
    mov al,102
    int 0x80
    mov esi,eax
;bind(server,(struct sockaddr *)&serv_addr,0x10)
    push edx
    push 0x50000002

    mov ecx,esp
    push byte 0x10
    push ecx
    push esi
    mov ecx,esp
    inc bl
    mov al,102
    int 0x80
;listen(server,0)
    push edx
    push esi
    mov ecx,esp
    mov bl,0x4
    mov al,102
    int 0x80
a:
;client=accept(server,0,0)
    push edx
    push edx
    push esi
    mov ecx,esp
    mov bl, 05
    mov al, 102
    int 0x80

;send(fd, buf, len, 0)
    push edx
    push len
    push msg
    push eax
    mov ecx, esp
    mov bl, 9
    mov al, 102   
    int 0x80

    jmp a


