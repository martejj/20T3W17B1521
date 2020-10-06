main:                           # $t0, $t1 => x, message
    
    la $a0, prompt              # printf("Enter a number: ");
    li $v0, 4
    syscall
    
    li $v0, 5                   # scanf("%d", &x);
    syscall
    move $t0, $v0
    
    la $t1, small_big           # char *message = "small/big\n";
    
    ble $t0, 100, print         # if (x <= 100) goto print;
    bge $t0, 1000, print        # if (x >= 1000) goto print;
        
    la $t1, medium              # message = "medium\n";
    
print:
    
    move $a0, $t1                 # printf("%s", message);
    li $v0, 4
    syscall
    
    jr $ra
    
    .data
prompt:
    .asciiz "Enter a number: "
small_big:
    .asciiz "small/big\n"
medium:
    .asciiz "medium\n"