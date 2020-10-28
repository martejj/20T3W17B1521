main:                                               # $t0, $t1 => row, col
    li $t0, 0                                       # int row = 0;
outer_loop: 
    bge $t0, 6, outer_end                           # if (row >= 6) goto outer_end;
    
    li $t1, 0                                       # int col = 0;
inner_loop:
    bge $t1, 12, inner_end                          # if (col >= 12) goto inner_end;
    
    li $a0, 12
    mul $a0, $a0, $t0
    add $a0, $a0, $t1
    la $t2, flag
    add $a0, $a0, $t2
    lb $a0, ($a0)
    li $v0, 11                                      # printf ("%c", *(flag + (row*12 + col)));
    syscall
    
    addi $t1, $t1, 1                                # col++;
    j inner_loop                                    # goto inner_loop;
    
inner_end:

    li $v0, 11
    li $a0, 10                                      # printf ("\n");
    syscall
    
    addi $t0, $t0, 1                                # row++;
    j outer_loop                                    # goto outer_loop;
outer_end:
    jr $ra # Update the PC to point to the previous functions's instructions

.data
flag:
    .byte '#' '#' '#' '#' '#' '.' '.' '#' '#' '#' '#' '#'
    .byte '#' '#' '#' '#' '#' '.' '.' '#' '#' '#' '#' '#'
    .byte '.' '.' '.' '.' '.' '.' '.' '.' '.' '.' '.' '.'
    .byte '.' '.' '.' '.' '.' '.' '.' '.' '.' '.' '.' '.'
    .byte '#' '#' '#' '#' '#' '.' '.' '#' '#' '#' '#' '#'
    .byte '#' '#' '#' '#' '#' '.' '.' '#' '#' '#' '#' '#'
