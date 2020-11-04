# Tutorial 8 notes

Today we will cover:
* Not MIPS!
* File I/O

<br>

---

## Q1 - What does `fopen(3)` do? What are its parameters and return value?

<details>

`FILE *fopen(const char *pathname, const char *mode);`

<summary>Answer</summary>

</details>

<br>

---

## Q2 - What are some circumstances when `fopen(3)` returns `NULL`?

<details>

When something went wrong.

* If the file you tried to open for reading does not exist.
* If you try to open a file you do not have permission to access.
* If the "mode" string was invalid.
* If the system is out of memory.
* If you try to create a file and your quota of disk blocks or inodes has been exhausted.
* If the pathname was too long.

<summary>Answer</summary>

</details>

<br>

---

## Q3 - How do you print the specific reason that caused `fopen(3)` to return `NULL`?

<details>

Short story: `perror(char *path)`

The global variable errno is given a value that indicates what went wrong (see tutorial 1, question 8).

The library function strerror(3) turns known values of errno into strings, which you could just print out.

```c
#include <errno.h>      // for `errno' values
#include <string.h>     // for `strerror(3)`

errno = ENOENT;
char *error = strerror(errno);
assert(strcmp(error, "No such file or directory") == 0);
```

Because this is such a common operation, there aren't many library functions that do this. perror(3) is the only standard way to do this:

```c
#include <errno.h>      // for `errno' values
#include <stdio.h>      // for `perror(3)'

errno = ENOENT;
perror("");             // prints "No such file or directory"
```

There are several nonstandard ways to do this; the most common is warn(3):

```c
#include <err.h>        // for `err(3)', `warn(3)', etc.
#include <errno.h>      // for `errno' values

errno = ENOENT;
warn(NULL);             // prints "<progname>: No such file or directory"
```

Often, though, you want to immediately end the program if one of these errors occurs: there is no single standard function to do this, but err(3) (related to warn(3)) is one very common option:

```c
#include <err.h>        // for `err(3)', `warn(3)', etc.
#include <errno.h>      // for `errno' values

errno = ENOENT;
err(1, NULL);           // prints "<progname>: No such file or directory"
                        // and terminates the program with exit code 1.
```

Similarly, the GNU C library provides error(3):

```c
#include <error.h>      // for `error(3)', etc.
#include <errno.h>      // for `errno' values

error(1, ENOENT, NULL); // prints "<progname>: No such file or directory"
                        // and terminates the program with exit code 1.
```

<summary>Answer</summary>

</details>

---

<br>

## Q4-6 - Write programs to do each of the following:

They should take a file name as the first command line argument and if given an incorrect number of arguments, or if there was an error opening the file, it should print a suitable error message.

<br>

### `read_line.c` - Read a line from a file

<br>

### `write_line.c` - Write a line to a file

<br>

### `append_line.c` - Append a line to a file

<br>

---

## Q7 - Why should you not use `fgets(3)` or `fputs(3)` with binary data?

<details>

`fgets(3)` or `fputs(3)` work with C strings: arrays of bytes, terminated with a zero byte, `'\0'`.

Binary data may naturally contain zero bytes, and thus cannot be treated as a normal string, therefore functions that work on strings (including `fgets(3)` or `fputs(3)`) will not behave correctly.

<summary>Answer</summary>

</details>

<br>

---

## Q8 - What does the following `printf(3)` statement display?

```c
    printf ("%c%c%c%c%c%c", 72, 101, 0x6c, 108, 111, 0x0a);
```

<details>

`Hello!\n`

<summary>Answer</summary>

</details>

<br>

---

## Q9 - How many different values can `fgetc(3)` return?

<details>

<summary>Answer</summary>

257.

It returns one of 256 values (0…255) if it manages to read a byte, and a special value EOF if it can't.

Often, `<stdio.h>` will contain something like:

```c
    #define EOF (-1)
```

</details>

<br>

---

## Q10 - Why are the names of `fgetc(3)`, `fputc(3)`, `getc(3)`, `putc(3)`, `putchar(3)`, and `getchar(3)` misleading?

<details>

Programmers often think they are only for character I/O, but all of them just read or write a byte. `fgetb`, `fputb`, `getb`, `putb`, `putbyte`, and `getbyte` would have been better names.

<summary>Answer</summary>

</details>

<br>

---

## What is a `bort`?

<details>

A bort is an unsigned two-byte big-endian integer (bort is a contraction of big-endian short).

The possible bort values are 0..65535.

<summary>Answer</summary>


<br>

---

## Revision: What is the difference between big endian and little endian?

<details>

<image src="images/endian.jpg"/>

<summary>Answer</summary>

</details>

</details>

<br>

---

## Q10 - Write a C program, `print_borts_file.c`, which prints the contents of a file containing borts.