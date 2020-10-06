main:                                       # n, fac, i => $t0, $t1, $t2
    
    li $v0, 4                               # printf("n  = ");
    la $a0, n_equals
    syscall
    
    li $v0, 5                               # scanf("%d", &n);
    syscall
    move $t0, $v0
    
    li $t1, 1                               # int fac = 1;
    li $t2, 1                               # int i = 1;
    
loop:

    bgt $t2, $t0, end                       # if (i > n) goto end;
    
    mul $t1, $t1, $t2                       # fac = fac*i;
    
    addi $t2, 1                             # i++;
    
    j loop                                  # goto loop;
    
end:

    li $v0, 4                               # printf("n! = ");
    la $a0, n_fac_equals
    syscall
    
    li $v0, 1                               # printf("%d", fac);
    move $a0, $t1
    syscall
    
    li $v0, 11                              # printf("%c", '\n');
    li $a0, '\n'
    syscall
    
    jr $ra                                  # return 0;
    
    .data
n_equals:
    .asciiz "n = "
n_fac_equals:
    .asciiz "n! = "