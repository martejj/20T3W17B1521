#include <stdio.h>
#include <string.h>

#define MAX_LINE 65536

void fgrep_stream(FILE *input, char *name, char *needle);

int main(int argc, char *argv[]) {
    if (argc == 1) {
        printf("Usage: %s [needle] ...[file]\n", argv[0]);
        return 1;
    } else if (argc == 2) {
        fgrep_stream(stdin, "<stdin>", argv[1]);
    } else {
        int arg = 2;
        while (arg < argc) {
            
            FILE *file = fopen(argv[arg], "r");

            if (file == NULL) {
                perror(argv[arg]);
                return 1;
            }

            fgrep_stream(file, argv[arg], argv[1]);
            
            arg++;
        }
    }

    return 0;
}

void fgrep_stream(FILE *input, char *name, char *needle) {

    char line[MAX_LINE];
    int n = 0;
    while (fgets(line, MAX_LINE, input) != NULL) {
        if (strstr(line, needle) != NULL) {
            printf("%s:%d %s", name, n, line);
        }
        n++;
    }
}