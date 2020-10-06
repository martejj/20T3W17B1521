main:                           # x, y => $t0, $t1
    
    la $a0, prompt              # printf("Enter a number: ");
    li $v0, 4
    syscall
    
    li $v0, 5                   # scanf("%d", &x);
    syscall
    move $t0, $v0
    
    bgt $t0, 46340, too_big     # if (x > 46340) goto too_big;
    
    mul $t1, $t0, $t0           # y = x * x;
    
    move $a0, $t1               # printf("%d", y);
    li $v0, 1
    syscall
    
    li $a0, '\n'                # printf("%c", '\n');
    li $v0, 11
    syscall
    
    j end;
too_big:
    
    la $a0, big_msg             # printf("Enter a number: ");
    li $v0, 4
    syscall
    
end:

    jr $ra                      # return 0;
                            
    .data
prompt:
    .asciiz "Enter a number: "
big_msg:
    .asciiz "square too big for 32 bits\n"