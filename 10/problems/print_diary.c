#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(void) {

    char *path = getenv("HOME");
    char *file = ".diary";
    int length = strlen(path) + strlen(file) + 2;
    
    char pathname[length];
    
    sprintf(pathname, "%s/%s", path, file);
    
    FILE *stream = fopen(pathname, "r");
    if (stream == NULL) {
        perror(pathname);
        exit(1);
    }
    
    int ch;
    while ((ch = fgetc(stream)) != EOF) {
        putchar(ch);
    }
    
    fclose(stream);
    
    return 0;
}