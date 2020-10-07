#include <stdio.h>

int main(void) {
    int x;
    printf("Enter a number: ");
    scanf("%d", &x);
    
    char *output;
    
    if (x <= 100) goto medium;
    if (x >= 1000) goto medium;
        output = "small/big\n"; // 1 lines
        goto end;
    medium:
        output = "medium\n"; // 1 lines
    end:
    
    printf("%s", output); // 3 lines
    
}