#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
        
    if (argc != 2) {
        
        printf("Usage: %s [file]", argv[0]);
        
        return 1;
    }
    
    
    FILE *f = fopen(argv[1], "r");
    
    if (f == NULL) {
        perror(argv[1]);
        return 1;
    }
    
    int ch;
    while ((ch = fgetc(f)) != EOF) {
        
        if (ch == '\n') {
            break;
        }
        
        fputc(ch, stdout);
        
    }
    
    
    return 0;
    
}