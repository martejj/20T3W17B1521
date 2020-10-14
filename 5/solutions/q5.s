main:                                   # i => $t0

    li $t0, 0                           # int i = 0;

read_loop:
    bge $t0, 10, read_end               # if (i >= 10) goto end;
    
    li $v0, 5                           # scanf("%d", &numbers[i]);
    syscall

    mul $t1, $t0, 4              
    sw $v0, numbers($t1)

    addi $t0, $t0, 1                    # i++;

    j read_loop                         # goto loop;
read_end:

    li $t0, 0                           # int i = 0;

print_loop:
    bge $t0, 10, print_end              # if (i >= 10) goto end;

    li $v0, 1
    mul $t1, $t0, 4
    lw $a0, numbers($t1)
    syscall

    addi $t0, $t0, 1

    j print_loop

print_end:

    jr $ra                              # return 0;

.data
numbers: .word 0 0 0 0 0 0 0 0 0 0      # int numbers[10] = {0};