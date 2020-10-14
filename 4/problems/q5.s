main:                                       # x => $t0
    li $t0, 24                              # int x = 24;
    loop:
    
    bge $t0, 42, end_loop                   # if (x >= 42) goto end_loop;
    
    move $a0, $t0                           # printf("%d",x);
    li $v0, 1
    syscall
    
    li $a0, '\n'                            # printf("%c", '\n');
    li $v0, 11
    syscall
    
    addi $t0, $t0, 3                        # x = x + 3;
    
    j loop                                  # goto loop;
    end_loop:
    
    jr $ra                                  # return;
}