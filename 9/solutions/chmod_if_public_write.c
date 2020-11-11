#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>

int main(int argc, char *argv[]) {

    int i = 1;

    while (i < argc) {

        struct stat s;
        if (stat(argv[i], &s) != 0) {
            perror(argv[i]);
            return 1;
        }
        
        printf("%o\n", s.st_mode);

        if (s.st_mode & (0x1 << 1)) {
            printf("%s is publicly writable, making it not\n", argv[1]);
            mode_t new_mode = s.st_mode & ~(0x1 << 1);
            if (chmod(argv[1], new_mode) != 0) {
                perror(argv[1]);
                return 1;
            }
        } else {
            printf("%s is not publicly writable\n", argv[1]);
        }

        i++;
    }


    return 0;

}