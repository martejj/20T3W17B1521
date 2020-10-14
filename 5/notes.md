# Week 5 Tutorial

Today we are covering:
* More MIPS
* More MIPS 
* and even more MIPS

---

## Q1-Q3 - Do on course site.

<br>

---

## Q5-6 - reading in and printing arrays

Write a program that reads in 10 numbers and then prints them out. Simply the following code to help.

```c

    #include <stdio.h>

    int main(void) {
        
        int numbers[10] = {0};
        int i = 0;

        while (i < 10) {
            scanf("%d", &numbers[i]);
            i++;
        }

        i = 0;
        while (i < 10) {
            printf("%d\n", numbers[i]);
            i++;
        }

        return 0;

    }

```

---

## Q7 - add_42.c

Write a C program that loops over a given array and adds 42 to any number below 0.

```c

    int main(void) {
        int i;
        int numbers[10] = {0,1,2,-3,4,-5,6,-7,8,9};

        i = 0;
        while (i < 10) {
            if (numbers[i] < 0) {
                numbers[i] += 42;
            }
            i++;
        }
    }
```

---

## Q8 - swap_half.c

Write a MIPS program that swaps all 5 of the first numbers in an array with the numbers in the second half.

Use the following C as reference (simplify it)

```c

#include <stdio.h>

    int main(void) {
        int i;
        int numbers[10] = {0,1,2,3,4,5,6,7,8,9};

        i = 0;
        while (i < 5) {
            int x = numbers[i];
            int y = numbers[9 - i];
            numbers[i] = y;
            numbers[9 - i] = x;
            i++;
        }
    }

```