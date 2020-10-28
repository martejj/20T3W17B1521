# uses less saved registers

max:                                        # int max(int a[], int length)
                                            # $a0 => a
                                            # $a1 => length
                                            # $s0 => first_element

    addi $sp, $sp, -8                       # Save s registers
    sw $ra, 0($sp)
    sw $s0, 4($sp)

    lw $s0, ($a0)                           # int first_element = a[0];

    bne $a1, 1, cont                        # if (length != 1) goto cont;

    move $v0, $s0
    j max_return                            # return first_element;

cont:

    # find max value in rest of array
    addi $a0, $a0, 4
    addi $a1, $a1, -1

    jal max
    
    move $t0, $v0                           # int max_so_far = max(a + 4, length - 1);

    blt $s0, $t0, not_bigger                # if (first_element < max_so_far) goto not_bigger;
    
    move $t0, $s0                           # max_so_far = first_element;

not_bigger:

    move $v0, $t0

max_return:

    lw $ra, 0($sp)
    lw $s0, 4($sp)
    addi $sp, $sp, 8                        # Load s registers
    jr $ra                                  # return max_so_far;

main:

    addi $sp, $sp, -4
    sw $ra, 0($sp)

    la $a0, array
    li $a1, 5
    jal max                                 # int max_num = max(nums, 5);

    move $a0, $v0
    li $v0, 1
    syscall                                 # printf("%d", max_num);

    li $a0, 10
    li $v0, 11
    syscall                                 # printf("%c", '\n');

    lw   $ra, 0($sp)
    addi $sp, $sp, 4

    jr $ra

.data
array: 
    .word 1 4 3 5 2                       # int nums[] = {1, 4, 3, 5, 2};