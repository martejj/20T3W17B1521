## Week 7 Tutorial Notes

How is assignment 1 going?

Today we will be covering:
* Functions in MIPS
* 2D Arrays in MIPS

---

## Q1 -  Complete structs.c

---

## Q2 - How are N-dimension arrays stored?

<details>

They are stored contiguously (flattened into one dimension) by a specific formula (can be derived in the lab).

<summary>Answer</summary>

</details>

---

## Q3 - flag.s

Simplify and then convert the following code into MIPS

```c
    char flag[6][12] = {
        {'#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'},
        {'#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'},
        {'.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'},
        {'.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'},
        {'#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'},
        {'#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'}
    };

    int main(void) {
        for (int row = 0; row < 6; row++) {
            for (int col = 0; col < 12; col++)
                printf ("%c", flag[row][col]);
            printf ("\n");
        }
    }
```

---

## What is a stack and why is it important for us in MIPS?

<details>

Stacks are FILO data structures. They are useful as functions are also FILO, the first function to run (main) is always the last function to run.

<summary>Answer</summary>

</details>

---

## What do the opcodes jr and jal do and what is stored in ra?

<details>

`jr` stands for jump register, and it sets the pc to the address stored in the $ra (return address) register.

`jal` stands for jump and link. It is a pseudo code for the following:

```
    la $ra, return_point
    j some_function
return_point:
```

<summary>Answer</summary>

</details>

---

## sum.s

Simplify and then convert the following code into MIPS

```c
    #include <stdio.h>

    int sum4(int a, int b, int c, int d);
    int sum2(int x, int y);

    int main(void) {
        int z = sum4(11, 13, 17, 19);
        printf("%d\n", z);
        return 0;
    }

    int sum4(int a, int b, int c, int d) {
        int e = sum2(a, b);
        int f = sum2(c, d);
        return sum2(e, f);
    }

    int sum2(int x, int y) {
        return x + y;
    }
```

---

## max.s

Simplify and then convert the following code into MIPS

```c
    int max(int a[], int length) {
        int first_element = a[0];
        if (length == 1) {
            return first_element;
        } else {
            // find max value in rest of array
            int max_so_far = max(&a[1], length - 1);
            if (first_element > max_so_far) {
                max_so_far = first_element;
            }
            return max_so_far;
        }
    }

    int main(void) {
        int nums[] = {1, 4, 3, 5, 2};
        printf("%d\n", max(nums, 5));
        return 0;
    }

```