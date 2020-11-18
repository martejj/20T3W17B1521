# Tutorial 10 notes

Today we will cover:
* Environment variables
* Pages
* Other Misc bits (Kahoot!)
* Ass 2 (if we get time)

---

## What are environment variables?

<details>

They are variables from the terminal that store information about the computer/system/environment.

<summary>Answer</summary>

</details>

<br>

---

## How do you get environment variables in C?

<details>

`getenv(3)`

<summary>Answer</summary>

</details>

<br>

---

## Q2 - `print_diary.c`

Write a C program, `print_diary.c`, which prints the contents of the file `$HOME/.diary` to stdout
The lecture example `getstatus.c` shows how to get the value of an environment variable.

`snprintf` is a convenient fucntion for constructing the pathname of the diary file.

<br>

---

## What are pages? What is the difference between a virtual page and a physical page?

<details>

Pages are just chunks of program memory. Virtual page is a space on the hard drive where memory can be stored long term. Physical page is a space in RAM that a virtual page can be loaded into for execution.

<summary>Answer</summary>

</details>

<br>

---

## Virtual and physical memory

Assume we have 6 virtual memory pages and 4 physical memory pages and are using a least-recently-used (LRU) replacement strategy.
What will happen if these virtualmemory pages were accessed?

```c
    5 3 5 3 0 1 2 2 3 5
```

<details>

```c
    dcc lru.c -o lru
    ./lru
    Simulating 4 pages of physical memory, 6 pages of virtual memory
    5
    Time 0: virtual page 5 loaded to physical page 0
    3
    Time 1: virtual page 3 loaded to physical page 1
    5
    Time 2: virtual page 5 -> physical page 0
    3
    Time 3: virtual page 3 -> physical page 1
    0
    Time 4: virtual page 0 loaded to physical page 2
    1
    Time 5: virtual page 1 loaded to physical page 3
    2
    Time 6: virtual page 2  - virtual page 5 evicted - loaded to physical page 0
    2
    Time 7: virtual page 2 -> physical page 0
    3
    Time 8: virtual page 3 -> physical page 1
    5
    Time 9: virtual page 5  - virtual page 0 evicted - loaded to physical page 2
```

<summary>Answer</summary>

</details>

<br>

---

## What is the difference between a physical and virtual address?

<details>

Physical address is the location on RAM - so relative to the 0 address of the actual RAM.

Virtual address the the location in the virtual page - so relative to the start of the program's memory.

<summary>Answer</summary>

</details>

<br>

---