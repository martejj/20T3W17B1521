main:                                       # i, j => $t0, $t1
    
    li $t0, 1                               # int i = 1;
    
    loop0:
    bgt $t0, 10, end0                       # if (i > 10) goto end0; 
    
    li $t1, 0                               # int j = 0;
        
    loop1:
    bge $t1, $t0, end1                      # if (j >= i) goto end1; 
        
    li $v0, 11                              # printf("*");
    li $a0, '*'
    syscall
            
    addi $t1, 1                             # j++;
            
    j loop1                                 # goto loop1;
        
    end1:
    
    li $v0, 11                              # printf("\n");
    li $a0, '\n'
    syscall
        
    addi $t0, 1                             # i++;
        
    j loop0                                 # goto loop0;
        
    end0:
    
    jr $ra                                  # return;
