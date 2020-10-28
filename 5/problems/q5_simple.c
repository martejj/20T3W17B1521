#include <stdio.h>

int main(void) {
    
    int numbers[10] = {0};
    int i = 0;
    
    in_loop:
    if (i >= 10) goto in_loop_end;
        scanf("%d", numbers + 4*i);
        i++;
        goto in_loop;
    in_loop_end:

    i = 0;
    out_loop:
        if (i >= 10) goto out_loop_end;
        printf("%d\n", *(numbers + 4*i));
        i++;
        goto out_loop;
    out_loop_end:

    return 0;

}