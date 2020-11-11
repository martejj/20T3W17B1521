#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>

int main(int argc, char * argv[]) {

    int arg = 1;
    
    while (arg < argc) {
        char *path = argv[arg];
        
        struct stat s;
        
        if (stat(path, &s) == -1) {
            perror(path);
            return 1;
        }
        
        // printf("%o\n", s.st_mode);
        
        if (s.st_mode & (1 << 1)) {
            printf("%s: Write is on - lets turn it off\n", path);
            mode_t new_mode = s.st_mode & ~ (1 << 1);
            
            if (chmod(path, new_mode) == -1) {
                perror(path);
                return 1;
            }
            
            
        } else {
            printf("%s: Write is off doing nothing\n", path);
        }
        
        arg++;
        
    }

    return 0;

}