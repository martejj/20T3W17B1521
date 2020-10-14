#include <stdio.h>

int main(void) {
    int x, y;
    printf("Enter a number: ");
    scanf("%d", &x);

    if (x <= 46340) goto print:
        printf("square too big for 32 bits\n");
        goto end;
    print:
        y = x * x;
        printf("%d", y);
        printf("%c", '\n');
    end:

    return 0;
}