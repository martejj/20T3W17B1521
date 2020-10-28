#include <stdio.h>

max:                                        # int max(int a[], int length)
                                            # $a0 => a
                                            # $a1 => length
                                            # $s0 => first_element
                                            # $s1 => a
                                            # $s2 => length
                                            # $s3 => max_so_far

    addi $sp, $sp, -20                      # Save s registers
    sw $ra, 0($sp)
    sw $s0, 4($sp)
    sw $s1, 8($sp)
    sw $s2, 12($sp)
    sw $s3, 16($sp)

    move $s1, $a0                           # $s1 = a
    move $s2, $a1                           # $s2 = length

    lw $s0, ($s1)                           # int first_element = a[0];

    bne $a1, 1, cont                        # if (length != 1) goto cont;

    move $v0, $s2
    j max_return                            # return first_element;

cont:

    # find max value in rest of array
    addi $a0, $s1, 4
    addi $a1, $s2, -1

    jal max
    
    move $s3, $v0                           # int max_so_far = max(a + 4, length - 1);

    blt $s0, $s3, not_bigger                # if (first_element < max_so_far) goto not_bigger;
    
    move $s3, $s0                           # max_so_far = first_element;

not_bigger:

    move $v0, $s3

max_return:

    lw $ra, 0($sp)
    lw $s0, 4($sp)
    lw $s1, 8($sp)
    lw $s2, 12($sp)
    lw $s3, 16($sp)
    addi $sp, $sp, 20                       # Load s registers
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