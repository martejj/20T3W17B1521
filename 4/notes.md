# Tutorial 4 notes

This week we will cover:
* MIPS
* MIPS
* More MIPS

--- 

## What is MIPS?

<details>

It is an assembly language which is a special purpose built programming language that is meant to be read by the CPU. But also, youre probably getting sick of this, in effect it is another way of reading binary (same with ASCII, Two's Complement, Floats, etc). In assembly languages the commands we write down are able to be directly converted into binary that a specifically designed CPU can read and execute. Most assembly languages are abstracted and have symbolic references (e.g. labels, register names) and pseudoinstructions.

<br>

<image src="images/mips_op.PNG"/>

<br>

These operations are all stored in the code section of the program memory

<br>

<image src="images/memory.png"/>

<br>

Somewhere there is code that reads this code and executes it in a loop like this

<image src="images/pc_pseudo.PNG"/>

<br>

<summary>Answer</summary>

</details>

---

## Q1 - What are registers? Which do we use and what to we use them for?

<details>

In effect registers are equivalent to variables. They are memory spots located directly on the CPU. The best place to refer to them is via 

<summary>Answer</details>

</details>

---

## Q2 - square.s

Convert the following to MIPS

```c
    // print the square of a number
    #include <stdio.h>

    int main(void) {
        int x, y;
        printf("Enter a number: ");
        scanf("%d", &x);
        y = x * x;
        printf("%d\n", y);
        return 0;
    }
```

---

## Q3a - Convert this statement into MIPS

```c

    if (1 < 2) {
        printf("IF");
    } else {
        printf("ELSE")
    }

```

<details>

Ugly:

```

    blt 1, 2, if
    bge 1, 2, else
if:
    #printf("IF");
    j end
else:
    #printf("ELSE");
end:

```

Better:

```

    bge 1, 2, else
    #printf("IF");
    j end
else:
    #printf("ELSE");
end:

```

<summary>Answer</details>

</details>

## Q3b - too_big.s

Convert the following into simple C - use only simple if's and goto's.

Then convert it into MIPS.

```c
    #include <stdio.h>

    int main(void) {
        int x, y;
        printf("Enter a number: ");
        scanf("%d", &x);

        if (x > 46340) {
            printf("square too big for 32 bits\n");
        } else {
            y = x * x;
            printf("%d\n", y);
        }

        return 0;
    }
```

---

## Q4 - small_medium_big.s

Convert the following into simple C - use only simple if's and goto's.

Then convert it into MIPS.

```c
    #include <stdio.h>

    int main(void) {
        int x;
        printf("Enter a number: ");
        scanf("%d", &x);

        if (x > 100 && x < 1000) {
            printf("medium\n");
        } else {
            printf("small/big\n");
        }
    }

```

---

## Q5 - while.s

Convert the following into simple C - use only simple if's and goto's.

Then convert it into MIPS.

```c
    #include <stdio.h>

    int main(void) {
        for (int x = 24; x < 42; x += 3) {
            printf("%d\n",x);
        }
    }
```

---

## Q6 - triangle.s

Convert the following into simple C - use only simple if's and goto's.

Then convert it into MIPS.

```c
    // print a triangle
    #include <stdio.h>

    int main (void) {
        for (int i = 1; i <= 10; i++) {
            for (int j = 0; j < i; j++) {
                printf("*");
            }
            printf("\n");
        };
        return 0;
    }
```

---

## Q7 - factorial.s

Convert the following into simple C - use only simple if's and goto's.

Then convert it into MIPS.

```c
    // Simple factorial calculator  - without error checking

    #include <stdio.h>

    int main (void) {
        int n;
        printf("n  = ");
        scanf("%d", &n);

        int fac = 1;
        for (int i = 1; i <= n; i++) {
            fac *= i;
        }

        printf ("n! = %d\n", fac);
        return 0;
    }
```

---

## Does the following instruction work?

```sh

    li $t0, 0xF356A2                    # 0xF356A2 = 15,974,176

```

<details>

Even though the command takes up a space of 5 + 6 + 4*6 = 35 bits it still works.

This is as it is actually a pseudoinstruction that decomposes into the following two commands

```sh

    lui $at, 0x00F3
    ori $t0, $at, 0x56A2

```

### examples of pseduoinstructions are:

* abs
* blt
* bgt
* ble
* neg
* not
* bge
* li
* la
* move
* sge
* sgt

<summary>Answer</summary>

</details>