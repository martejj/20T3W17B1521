#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(void) {

    char *base = getenv("HOME");

    char *file = ".diary";

    int length = strlen(base) + strlen(file) + 2;

    char diary_pathname[length];

    sprintf(diary_pathname, "%s/%s", base, file);

    FILE *stream = fopen(diary_pathname, "r");

    if (stream == NULL) {
        perror(diary_pathname);
        exit(1);
    }

    int byte;
    while((byte = fgetc(stream)) != EOF) {
        putchar(byte);
    }

    fclose(stream);

    return 0;

}