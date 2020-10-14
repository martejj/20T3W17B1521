#include <stdio.h>

int main(void) {
    int i = 0;
    int numbers[10] = {0,1,2,3,4,5,6,7,8,9};

    loop:
    if (i >= 5) goto end;
        int earlier = (numbers + 4*i);
        int x = *earlier;
        int later = (numbers + 5*(9 - i))
        int y = *later;
        *earlier = y;
        *later = x;
        i++;
    end:

    i = 0;
    while (i < 10) {
        printf("%d\n", numbers[i]);
        i++;
    }

    return 0;
}