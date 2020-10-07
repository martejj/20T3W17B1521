#include <stdio.h>

int main(void) {
    int x;
    printf("Enter a number: ");
    scanf("%d", &x);

    if (x <= 100) goto small_big;
    if (x >= 1000) goto small_big;
        printf("medium\n");
        goto end;
    small_big:
        printf("small/big\n");
    end:

    return 0;
    
}