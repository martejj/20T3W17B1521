main:
    
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    
    li $a0, 11
    li $a1, 13
    li $a2, 17
    li $a3, 19
    jal sum4                                    # int z = sum4(11, 13, 17, 19);
    
    move $a0, $v0
    li $v0, 1
    syscall                                     # printf("%d", z);

    li $a0, 10
    li $v0, 11
    syscall
    
    lw $ra, 0($sp)
    addi $sp, $sp, 4

    jr $ra                                      # return 0;

sum4:                                           # int sum4(int a, int b, int c, int d)
    addi $sp, $sp, -16
    sw $ra, 12($sp)
    sw $s0, 8($sp)
    sw $a2, 4($sp)
    sw $a3, 0($sp)

    jal sum2                                    # int e = sum2(a, b);
    
    move $s0, $v0
    lw $a0, 4($sp)                              # Restore a2, a3 => a0, a1
    lw $a1, 0($sp)

    jal sum2                                    # int f = sum2(c, d);
    
    move $a0, $s0
    move $a1, $v0

    jal sum2

    lw $ra, 12($sp)
    lw $s0, 8($sp)
    addi $sp, $sp, 16

    jr $ra

sum2:                                           # int sum2(int x, int y)
                                                # return x + y;
    add $v0, $a0, $a1

    jr $ra
