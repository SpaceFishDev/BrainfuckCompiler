format ELF executable
entry start
segment readable writeable
	mem rb 1024 * 1024
	pos dd 0
segment executable
start:
;RIGHT
mov eax, pos
mov ebx, 1
add [eax], ebx
;ADD
mov eax, mem
mov ebx, [pos]
add eax, ebx
mov ebx, 8
add [eax], ebx
;loop
label0:
;LEFT
mov eax, pos
mov ebx, 1
sub [eax], ebx
;ADD
mov eax, mem
mov ebx, [pos]
add eax, ebx
mov ebx, 9
add [eax], ebx
;RIGHT
mov eax, pos
mov ebx, 1
add [eax], ebx
;SUB
mov eax, mem
mov ebx, [pos]
add eax, ebx
mov ebx, 1
sub [eax], ebx
;endloop
mov ebx, [pos]
mov eax, mem
add eax, ebx
mov ebx, [eax]
cmp ebx, 0
jne label0
;LEFT
mov eax, pos
mov ebx, 1
sub [eax], ebx
;print
mov eax, mem
mov ebx, [pos]
add eax, ebx
mov ebx, [eax]
push ebx
mov eax, 4
mov ebx, 1
mov ecx, esp
mov edx, 1
int 0x80
add esp, 4
;RIGHT
mov eax, pos
mov ebx, 1
add [eax], ebx
;ADD
mov eax, mem
mov ebx, [pos]
add eax, ebx
mov ebx, 4
add [eax], ebx
;loop
label1:
;LEFT
mov eax, pos
mov ebx, 1
sub [eax], ebx
;ADD
mov eax, mem
mov ebx, [pos]
add eax, ebx
mov ebx, 7
add [eax], ebx
;RIGHT
mov eax, pos
mov ebx, 1
add [eax], ebx
;SUB
mov eax, mem
mov ebx, [pos]
add eax, ebx
mov ebx, 1
sub [eax], ebx
;endloop
mov ebx, [pos]
mov eax, mem
add eax, ebx
mov ebx, [eax]
cmp ebx, 0
jne label1
;LEFT
mov eax, pos
mov ebx, 1
sub [eax], ebx
;ADD
mov eax, mem
mov ebx, [pos]
add eax, ebx
mov ebx, 1
add [eax], ebx
;print
mov eax, mem
mov ebx, [pos]
add eax, ebx
mov ebx, [eax]
push ebx
mov eax, 4
mov ebx, 1
mov ecx, esp
mov edx, 1
int 0x80
add esp, 4
;ADD
mov eax, mem
mov ebx, [pos]
add eax, ebx
mov ebx, 7
add [eax], ebx
;print
mov eax, mem
mov ebx, [pos]
add eax, ebx
mov ebx, [eax]
push ebx
mov eax, 4
mov ebx, 1
mov ecx, esp
mov edx, 1
int 0x80
add esp, 4
;print
mov eax, mem
mov ebx, [pos]
add eax, ebx
mov ebx, [eax]
push ebx
mov eax, 4
mov ebx, 1
mov ecx, esp
mov edx, 1
int 0x80
add esp, 4
;ADD
mov eax, mem
mov ebx, [pos]
add eax, ebx
mov ebx, 3
add [eax], ebx
;print
mov eax, mem
mov ebx, [pos]
add eax, ebx
mov ebx, [eax]
push ebx
mov eax, 4
mov ebx, 1
mov ecx, esp
mov edx, 1
int 0x80
add esp, 4
;RIGHT
mov eax, pos
mov ebx, 2
add [eax], ebx
;ADD
mov eax, mem
mov ebx, [pos]
add eax, ebx
mov ebx, 6
add [eax], ebx
;loop
label2:
;LEFT
mov eax, pos
mov ebx, 1
sub [eax], ebx
;ADD
mov eax, mem
mov ebx, [pos]
add eax, ebx
mov ebx, 7
add [eax], ebx
;RIGHT
mov eax, pos
mov ebx, 1
add [eax], ebx
;SUB
mov eax, mem
mov ebx, [pos]
add eax, ebx
mov ebx, 1
sub [eax], ebx
;endloop
mov ebx, [pos]
mov eax, mem
add eax, ebx
mov ebx, [eax]
cmp ebx, 0
jne label2
;LEFT
mov eax, pos
mov ebx, 1
sub [eax], ebx
;ADD
mov eax, mem
mov ebx, [pos]
add eax, ebx
mov ebx, 1
add [eax], ebx
;ADD
mov eax, mem
mov ebx, [pos]
add eax, ebx
mov ebx, 1
add [eax], ebx
;print
mov eax, mem
mov ebx, [pos]
add eax, ebx
mov ebx, [eax]
push ebx
mov eax, 4
mov ebx, 1
mov ecx, esp
mov edx, 1
int 0x80
add esp, 4
;SUB
mov eax, mem
mov ebx, [pos]
add eax, ebx
mov ebx, 12
sub [eax], ebx
;print
mov eax, mem
mov ebx, [pos]
add eax, ebx
mov ebx, [eax]
push ebx
mov eax, 4
mov ebx, 1
mov ecx, esp
mov edx, 1
int 0x80
add esp, 4
;RIGHT
mov eax, pos
mov ebx, 1
add [eax], ebx
;ADD
mov eax, mem
mov ebx, [pos]
add eax, ebx
mov ebx, 6
add [eax], ebx
;loop
label3:
;LEFT
mov eax, pos
mov ebx, 1
sub [eax], ebx
;ADD
mov eax, mem
mov ebx, [pos]
add eax, ebx
mov ebx, 9
add [eax], ebx
;RIGHT
mov eax, pos
mov ebx, 1
add [eax], ebx
;SUB
mov eax, mem
mov ebx, [pos]
add eax, ebx
mov ebx, 1
sub [eax], ebx
;endloop
mov ebx, [pos]
mov eax, mem
add eax, ebx
mov ebx, [eax]
cmp ebx, 0
jne label3
;LEFT
mov eax, pos
mov ebx, 1
sub [eax], ebx
;ADD
mov eax, mem
mov ebx, [pos]
add eax, ebx
mov ebx, 1
add [eax], ebx
;print
mov eax, mem
mov ebx, [pos]
add eax, ebx
mov ebx, [eax]
push ebx
mov eax, 4
mov ebx, 1
mov ecx, esp
mov edx, 1
int 0x80
add esp, 4
;LEFT
mov eax, pos
mov ebx, 1
sub [eax], ebx
;print
mov eax, mem
mov ebx, [pos]
add eax, ebx
mov ebx, [eax]
push ebx
mov eax, 4
mov ebx, 1
mov ecx, esp
mov edx, 1
int 0x80
add esp, 4
;ADD
mov eax, mem
mov ebx, [pos]
add eax, ebx
mov ebx, 3
add [eax], ebx
;print
mov eax, mem
mov ebx, [pos]
add eax, ebx
mov ebx, [eax]
push ebx
mov eax, 4
mov ebx, 1
mov ecx, esp
mov edx, 1
int 0x80
add esp, 4
;SUB
mov eax, mem
mov ebx, [pos]
add eax, ebx
mov ebx, 6
sub [eax], ebx
;print
mov eax, mem
mov ebx, [pos]
add eax, ebx
mov ebx, [eax]
push ebx
mov eax, 4
mov ebx, 1
mov ecx, esp
mov edx, 1
int 0x80
add esp, 4
;SUB
mov eax, mem
mov ebx, [pos]
add eax, ebx
mov ebx, 8
sub [eax], ebx
;print
mov eax, mem
mov ebx, [pos]
add eax, ebx
mov ebx, [eax]
push ebx
mov eax, 4
mov ebx, 1
mov ecx, esp
mov edx, 1
int 0x80
add esp, 4
;RIGHT
mov eax, pos
mov ebx, 3
add [eax], ebx
;ADD
mov eax, mem
mov ebx, [pos]
add eax, ebx
mov ebx, 4
add [eax], ebx
;loop
label4:
;LEFT
mov eax, pos
mov ebx, 1
sub [eax], ebx
;ADD
mov eax, mem
mov ebx, [pos]
add eax, ebx
mov ebx, 8
add [eax], ebx
;RIGHT
mov eax, pos
mov ebx, 1
add [eax], ebx
;SUB
mov eax, mem
mov ebx, [pos]
add eax, ebx
mov ebx, 1
sub [eax], ebx
;endloop
mov ebx, [pos]
mov eax, mem
add eax, ebx
mov ebx, [eax]
cmp ebx, 0
jne label4
;LEFT
mov eax, pos
mov ebx, 1
sub [eax], ebx
;ADD
mov eax, mem
mov ebx, [pos]
add eax, ebx
mov ebx, 1
add [eax], ebx
;print
mov eax, mem
mov ebx, [pos]
add eax, ebx
mov ebx, [eax]
push ebx
mov eax, 4
mov ebx, 1
mov ecx, esp
mov edx, 1
int 0x80
add esp, 4
mov eax, 1
mov ebx, 0
int 0x80
