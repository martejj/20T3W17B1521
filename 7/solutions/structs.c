int v0;                             // .space 4
int v1 = 42;                        // .word 42
char v2;                            // .space 1
char v3 = 'a';                      // .byte 'a'
double v4;                          // .space 8
int v5[20];                         // .space 80
int v6[10][5];                      // .space 200             
struct { int x; int y; } v7;        // .space 8
struct { int x; int y; } v8[4];     // .space 32
struct { int x; int y; } *v9[4];    // .space 16
