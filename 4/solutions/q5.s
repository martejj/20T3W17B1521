main:                               # $t0 => x
    
    li $t0, 24                      # x = 24;
    
loop:
    bge $t0, 42, end                # if (x >= 42) goto end;
    
    move $a0, $t0                   # printf("%d", x);
    li $v0, 1
    syscall
    
    li $v0, 11                      # printf("%c", '\n');
    li $a0, '\n'
    syscall
    
    addi $t0, 3                     # x += 3;
    
    j loop                          # goto loop;
    
    end:
    
    jr $ra                          # return 0;