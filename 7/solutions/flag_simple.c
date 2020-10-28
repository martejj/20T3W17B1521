#include <stdio.h>

char flag[6][12] = {
    {'#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'},
    {'#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'},
    {'.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'},
    {'.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'},
    {'#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'},
    {'#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'}
};

int main(void) {
    int row = 0;
    outer_loop:
    if (row >= 6) goto outer_end;
        int col = 0;
        inner_loop:
        if (col >= 12) goto inner_end;
            char *location = ((char *)flag) + row*12 + col;
            printf ("%c", *location);
            col++;
            goto inner_loop;
        inner_end:
        printf ("\n");
        row++;
        goto outer_loop;
    outer_end:
    return 0;
}