main:                                       # x, y => $t0, $t1
    
    la $a0, prompt                          # printf("Enter a number: ");
    li $v0, 4
    syscall
    
    li $v0, 5                               # scanf("%d", &x);
    syscall                                 # $v0 contains our number
    move $t0, $v0
    
    mul $t1, $t0, $t0                       # y = x * x;
    
    move $a0, $t1                           # printf("%d", y);
    li $v0, 1
    syscall
    
    li $v0, 11                              #printf("%c", '\n');
    li $a0, '\n'
    syscall
    
    jr $ra                                  # return;
    
    .data
prompt: .asciiz "Enter a number: \n"