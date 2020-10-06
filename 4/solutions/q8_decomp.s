main:
    lui $at, 0x00F3
    ori $a0, $at, 0xBF20

    li $v0, 1
    syscall
    
    jr $ra