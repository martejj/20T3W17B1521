#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {

    if (argc != 2) {
        printf("Usage: %s [path]", argv[0]);
        return 1;
    }

    print_borts_file(argv[1]);

}

void print_borts_file(char *path) {
    FILE *stream = fopen(path, "r");

    if (stream == NULL) {
        perror(path);
        exit(1);
    }

    int i = 0;
    int bort = 0;

    while ((bort = get_bort(stream)) != EOF) {
        printf("bort\t%d: %d", i, bort);
        i++;
    }

}

int get_bort(FILE *stream) {

    int left = fgetc(stream);
    
    if (left == EOF) {
        return EOF;
    }

    int right = fgetc(stream);

    if (right == EOF) {
        return EOF;
    }

    return (left << 8) | right;

}