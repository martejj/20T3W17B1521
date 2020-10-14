main:                                                   # i => $t0 
    
    li $t0, 0                                           # int i = 0;
    
in_loop:
    bge $t0, 10, in_loop_end                            # if (i >= 10) goto in_loop_end;
    
    li $v0, 5                                           # scanf("%d", numbers + 4*i);
    syscall
    
    li $t1, 4                                           # $t1 = 4                               
    mul $t1, $t1, $t0                                   # $t1 = 4*i
    sw $v0, numbers($t1)                                # numbers[i] = $v0
    
    addi $t0, $t0, 1                                    # i++;
    j in_loop                                           # goto in_loop;
in_loop_end:

    li $t0, 0                                           # i = 0;
out_loop:
    bge $t0, 10, out_loop_end                           # if (i >= 10) goto out_loop_end;
    
    # Get number from array and put in a0
    li $t1, 4                                           # $t1 = 4
    mul $t1, $t1, $t0                                   # $t1 = 4*i
    lw $a0, numbers($t1)
    li $v0, 1                                           # printf("%d", numbers[i]);
    syscall
    
    li $v0, 11
    li $a0, '\n'
    syscall
    
    addi $t0, $t0, 1                                    # i++;
    j out_loop                                          # goto out_loop;
out_loop_end:

    jr $ra                                              # return 0;

.data
numbers: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0             # int numbers[10] = {0};
