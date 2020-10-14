#include <stdio.h>

int main(void) {
    int i;
    int numbers[10] = {0};

    i = 0;
    loop:
    if (i >= 10) goto end;
        scanf("%d", numbers + 4*i);
        i++;
        goto loop;
    end:
}