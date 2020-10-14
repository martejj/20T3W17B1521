main:                                           # i => $t0

    li $t0, 0                                   # int i = 0;

loop:
    bge $t0, 10, end                            # if (i >= 10) goto end;

    mul $t1, $t0, 4                             # $t1 = 4 * i
    lw $t2, numbers($t1)                        # $t2 = numbers[i]
    
    bgez $t2, nothing                           # if (numbers[i] >= 0) goto nothing;
    
    addi $t2, $t2, 42                           # numbers[i] += 42;

    sw $t2, numbers($t1)

nothing:

    addi $t0, $t0, 1                            # i++;
    j loop                                      # goto loop;

end:

    li $t0, 0                           # int i = 0;

print_loop:
    bge $t0, 10, print_end              # if (i >= 10) goto end;

    li $v0, 1
    mul $t1, $t0, 4
    lw $a0, numbers($t1)
    syscall

    li $a0, 10
    li $v0, 11
    syscall

    addi $t0, $t0, 1

    j print_loop

print_end:

    jr $ra 

.data
numbers: .word 0 1 2 -3 4 -5 6 -7 8 9           # int numbers[10] = {0,1,2,-3,4,-5,6,-7,8,9};