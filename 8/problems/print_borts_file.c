#include <stdio.h>
#include <stdlib.h>

void print_borts_file(char *name);

int fgetbort(FILE *file);

int main(int argc, char *argv[]) {
    
    if (argc != 2) {
        printf("Usage: %s [file]", argv[0]);
        return 1;
    }
    
    print_borts_file(argv[1]);
    
    return 0;
    
}

void print_borts_file(char *name) {

    FILE *f = fopen(name, "r");
    
    if (f == NULL) {
        perror(name);
        exit(1);
    }
    
    int bort;
    int i = 0;
    while ((bort = fgetbort(f)) != EOF) {
        printf("%d: %d, %x\n", i, bort, bort);
        i++;
    }
    
}

int fgetbort(FILE *file) {
    
    int left = fgetc(file);
    if (left == EOF) {
        return EOF;
    }
    int right = fgetc(file);
    if (right == EOF) {
        return EOF;
    }
    
    return (left << 8) | right;
    
}