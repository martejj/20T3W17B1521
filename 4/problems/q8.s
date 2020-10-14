main:
    li $a0, 0x00F3BF20

    li $v0, 1
    syscall
    
    jr $ra