main:                                       # x, y => $t0, $t1
    
    la $a0, prompt                          # printf("Enter a number: ");
    li $v0, 4
    syscall
    
    li $v0, 5                               # scanf("%d", &x);
    syscall                                 # $v0 contains our number
    move $t0, $v0
    
    ble $t0, 46340, print                   # if (x <= 46340) goto print:
    
    la $a0, too_big                         # printf("Too big!");
    li $v0, 4
    syscall
    
    j end                                   # goto end;
print:

    mul $t1, $t0, $t0                       # y = x * x;
    
    move $a0, $t1                           # printf("%d", y);
    li $v0, 1
    syscall
    
    li $v0, 11                              # printf("%c", '\n');
    li $a0, '\n'
    syscall

end:
    
    jr $ra                                  # return;
    
    .data
prompt: .asciiz "Enter a number: \n"
too_big: .asciiz "Too big!\n"