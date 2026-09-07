global main 
extern printf
extern scanf

section .data

msg db "Assembly Calculator", 10, 0

question1 db "Type the first number: ", 0
question2 db "Type the second number: ", 0
op_question db "Type the operation (+, -, *, /): ", 0

num_form db "%lld", 0
char_form db " %c", 0

result_msg db "Result: %lld", 10, 0
invalid_msg db "Invalid operation.", 10, 0
zero_msg db "Cannot divide by zero.", 10, 0


section .text

main:
sub rsp, 40


lea rcx, [rel msg]
call printf


lea rcx, [rel question1]
call printf

lea rcx, [rel num_form]
lea rdx, [rel num1]
call scanf


lea rcx, [rel question2]
call printf

lea rcx, [rel num_form]
lea rdx, [rel num2]
call scanf


lea rcx, [rel op_question]
call printf

lea rcx, [rel char_form]
lea rdx, [rel operation]
call scanf


mov al, [rel operation]


cmp al, '+'
je sum

cmp al, '-'
je subtraction

cmp al, '*'
je multiplication

cmp al, '/'
je division

jmp invalid_operation


sum:
mov rax, [rel num1]
add rax, [rel num2]
jmp show_result


subtraction:
mov rax, [rel num1]
sub rax, [rel num2]
jmp show_result


multiplication:
mov rax, [rel num1]
imul rax, [rel num2]
jmp show_result


division:

cmp qword [rel num2], 0
je division_by_zero

mov rax, [rel num1]

cqo

idiv qword [rel num2]

jmp show_result


show_result:

lea rcx, [rel result_msg]
mov rdx, rax
call printf

jmp end_program


invalid_operation:

lea rcx, [rel invalid_msg]
call printf

jmp end_program


division_by_zero:

lea rcx, [rel zero_msg]
call printf


end_program:

add rsp, 40

xor eax, eax

ret


section .bss

num1 resq 1
num2 resq 1
operation resb 1