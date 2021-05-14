%macro create_new_link 0
    push ecx
    push edx
    push esi
    push dword 1
    push dword 5
    call calloc
    add esp, 8
    pop esi
    pop edx
    pop ecx
%endmacro

%macro update_linkedlist 0
    mov byte [eax], dl                              ; insert dl byte in the first byte in new link   
    cmp dword[current_link_ptr], 0
    jnz %%not_zero
    mov dword [current_link_ptr], eax
    mov dword[first_link], eax
    inc dword [current_link_ptr]
    jmp %%end

%%not_zero:
    push esi
    mov esi, dword [current_link_ptr]               ; esi is now a ptr to the latest updated link (with offset 1)
    mov dword [esi], eax                            ; old link point to the begginig of new link
    inc eax                                         ; old link point to the second byte in new link 
    mov dword [current_link_ptr], eax               ; current_link_ptr point to second byte in new link
    pop esi
%%end:
%endmacro

%macro pushOperandStack 0
    pushad                  ; Save all register values.
    mov eax, dword[current_link_ptr]        ; eax holds the curent link address
    mov esi, dword[stackCounter]
    mov dword[operand_stack + esi], eax ; Next free spot gets the new link address.
    inc dword[stackCounter]         ; Increment the stack counter.
    mov dword[lastInStack], eax     ; Update the "last in stack" pointer.
    popad                           ; Restore state of the registers.
%endmacro

%macro printOperandStack 0
    pushad
    mov eax, dword[stackCounter]
%%pri_loop:
    cmp eax, 0
    jz %%finito
    dec eax
    mov ebx, dword[operand_stack + eax]
    mov edx, 0
    mov dl, byte[ebx]      ; assign the data in the link to edx.
    push edx
    push PrePrintNum
    call printf
    add esp, 8          ; Release memory for the two arguments.  
    jmp %%pri_loop
%%finito:
    popad
%endmacro

%macro fgets_ass 0
    push dword [stdin]              ;path to file(stdin)
    push dword 81                   ;max lenght
    push dword buffer               ;input buffer
    call fgets
    add esp, 12                    
%endmacro

section .text               ; text.
  align 16
  global main
  extern printf
  extern fprintf 
  extern fflush
  extern malloc 
  extern calloc 
  extern free 
  ;extern gets 
  extern getchar 
  extern fgets 
  extern stdout
  extern stdin
  extern stderr

section .bss                ; uninitialized data.
    buffer: resb 81 ; max size - input line , 80 bytes + 1 byte

section .data               ; initialized data.
    PrePrintNum: db "number is: %0x", 10, 0
    PrePrintString: db "%s", 10, 0
    ;preFirstLink: db "First Link is: %0x", 10, 0
    calc_str: db "calc:",0
    current_link_ptr: dd 0 
    lastInStack: dd 0             ; This is the "esp" of our operand_stack
    first_link: dd 0   

section .rodata             ; read-only data.

section .text               ; text
main:
    ; argc in [esp].
    ; 
    ;mov esi, [esp]
    ;cmp esi, 1                 ; If one -> no input from user.
    ;mov eax, [esp+4]           ; [esp+4] points to argv 

    push calc_str
    push PrePrintString
    call printf
    add esp, 8

    call mycalc

    jmp end_program


mycalc:
    push ebp
    mov ebp, esp

    mov ebx, 0                   ; Initialize bx with 0.
    mov eax, 0                   ; Initialize ax with 0.
    mov edx, 0                   ; Initialize dx with 0.
    mov cx,  0                    ; cx will be the index counter of ax.(It is the only one that shl works with..).
    mov ecx, 0

section .bss
    pointer: resb 4              ; Will be used to point at the input string at different
    operand_stack: resd 63          ; The program's operand-stack. 63 is it's maximum size.
section .data               ; Initialized data.
    input_string: db "46517654",0              
    temp: dw 0
    counter: dd 0
    stackCounter: dd 0          ; Will hold the amount of used cells at the operand-stack.
section .text

loop:
    mov dword[current_link_ptr], 0          ; initialize current_link_pointer to 0, so the first link will be recognized.
    fgets_ass                               ; stdio function fgets, put in buffer the wanted data
    mov ebx, 0                              
    mov ecx, 0
    mov esi, 0                              ; counter for byte index
    mov edx, 0
    mov eax, 0
    count_quantity:
        mov bl, byte [buffer + esi]                   
        inc esi
        cmp bl, 10                              ; check if empty(only NL was sent)
        jnz count_quantity
    dec esi

    cmp esi, 0
    jz loop

    dec esi
    mov bl, byte [buffer + esi]

    cmp bl, 57        
    jg lexical_commands
    cmp bl, 48
    jl mathematical_commands

    mov edx, 0

    bit_loop:
        sub bl, 48                 ; get number-value of the input char (binary representation).
        mov bh, 0
        shl bx, cl                 ; Put the bits in the right place before adding to ax.
        add cl, 3
        add dx, bx                 ; Add bits to the representation.

        dec esi

        cmp cl, 8
        jnl make_link

    cont:
        cmp esi, -1
        jz end_loop                ; jmp from loop when counter = 0.
        mov bl, [buffer + esi]
        jmp bit_loop

    make_link:
        create_new_link
    updateLL:
        update_linkedlist
        pushOperandStack                ; Push the created link to the operand-stack.
        inc dword[stackCounter]         ; increment stack-counter.
        
        ; Print current link
    after_link:
    ; Print the current link's data.
        ;pushad
        ;mov esi, dword [current_link_ptr]
        ;dec esi
        ;mov edx, 0
        ;mov dl, byte[esi] 
        ;push dx
        ;push PrePrintNum
        ;call printf
        ;add esp, 6
        ;popad

    break1:

        mov dl, dh
        mov dh, 0               ; Needs to be.
        cmp cl, 8
        jnz next1
        mov cl, 0
        jmp cont
        
    next1:
        cmp cl, 9
        jnz next2
        mov cl, 1
        jmp cont

    next2:
        mov cl, 2
        jmp cont



    end_loop:                      ; We arrive here after reading all the input number.
        cmp dl, 0
        jz loop
        create_new_link
        update_linkedlist
        pushOperandStack
        inc dword[stackCounter]         ; increment stack-counter.
        
    ; Print the current link's data.
        ;pushad
        ;mov esi, dword [current_link_ptr]
        ;dec esi
        ;mov edx, 0
        ;mov dl, byte[esi] 
        ;push dx
        ;push PrePrintNum
        ;call printf
        ;add esp, 6
        ;popad

    ;print the first link of the recently made linked-list.
        ;pushad
        ;mov esi, dword [first_link]
        ;;dec esi
        ;mov edx, 0
        ;mov dl, byte[esi] 
        ;push dx
        ;push preFirstLink
        ;call printf
        ;add esp, 6
        ;popad

        printOperandStack


    jmp loop

mathematical_commands:  

lexical_commands:

    ; Print current link
    pushad
    mov esi, dword [current_link_ptr]
    dec esi
    mov edx, 0
    mov dl, byte[esi] 
    push dx
    push PrePrintNum
    call printf
    add esp, 6
    popad


    mov esp, ebp
    pop ebp
    ret


end_program:
    mov ebx, 0
    mov eax, 1
int 0x80