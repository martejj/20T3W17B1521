main:                                               # $t0, $t1, $t2 => row, col, location

    li $t0, 0                                       # int row = 0;

outer_loop:

    bge $t0, 6, outer_end                           # if (row >= 6) goto outer_end;

    li $t1, 0                                       # int col = 0;
inner_loop:
    
    bge $t1, 12, inner_end                          # if (col >= 12) goto inner_end;
            
    mul $t2, $t0, 12
    add $t2, $t2, $t1
    la $t3, flag
    add $t2, $t2, $t3

    lb $a0, ($t2)                                   # char *location = ((char *)flag) + row*12 + col;
            
    li $v0, 11
    syscall                                         # printf ("%c", *location);
    
    addi $t1, $t1, 1                                # col++;
    j inner_loop                                    # goto inner_loop;
inner_end:
    
    li $v0, 11
    li $a0, 10                                      # printf ("\n");
    syscall

    addi $t0, $t0, 1                                # row++;
    j outer_loop                                    # goto outer_loop;
outer_end:
    
    jr $ra                                          # return 0

.data
flag:
    .byte '#' '#' '#' '#' '#' '.' '.' '#' '#' '#' '#' '#'
    .byte '#' '#' '#' '#' '#' '.' '.' '#' '#' '#' '#' '#'
    .byte '.' '.' '.' '.' '.' '.' '.' '.' '.' '.' '.' '.'
    .byte '.' '.' '.' '.' '.' '.' '.' '.' '.' '.' '.' '.'
    .byte '#' '#' '#' '#' '#' '.' '.' '#' '#' '#' '#' '#'
    .byte '#' '#' '#' '#' '#' '.' '.' '#' '#' '#' '#' '#'
