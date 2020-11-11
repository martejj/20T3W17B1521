# Tutorial 9 notes

* How is assignment 2 going?
* Today we will be covering file metadata
* Let me know about extensions

<br>

---

## What is metadata?

<details>

Simply put: Data about data. For example the data of a file is its contents. The metadata of a file is who made it, when, and its name.

<summary>Answer</summary>

</details>

<br>

---

## What is `stat(2)`?

<details>

`stat(2)` Takes in a file name and a stat struct and fills the stat struct with information about the file metadata.

</details>

<br>

---

## Q3 - What is a stat struct composed of? What are each of these (in greater depth)?

```c
    struct stat {
        ino_t st_ino;         /* inode number */
        mode_t st_mode;       /* protection */
        uid_t st_uid;         /* user ID of owner */
        gid_t st_gid;         /* group ID of owner */
        off_t st_size;        /* total size, in bytes */
        blksize_t st_blksize; /* blocksize for filesystem I/O */
        blkcnt_t st_blocks;   /* number of 512B blocks allocated */
        time_t st_atime;      /* time of last access */
        time_t st_mtime;      /* time of last modification */
        time_t st_ctime;      /* time of last status change */
    };
```

Explain what each of the fields represents (in more detail than given in the comment!) and give a typical value for a regular file which appears as follows:

` $ ls -ls stat.c`
`8 -rw-r--r--  1 jas  cs1521  1855  Sep  9 14:24 stat.c`

Assume that jas has user id `516`, and the cs1521 group has group id `36820`.

<br>

---

### `ino_t st_ino`

<details>

An inode number, giving an index into the filesystem's table of file metadata structures. For stat.c, it could be any largish positive integer. The inode number can be accessed using ls -li.

<summary>Answer</summary>

</details>

<br>

---

### `mode_t st_mode`

<details>

Contains information about the file type and the file permissions, encoded as a bit-string. These bit-strings are usually written in octal, to make it easy to see the 3 groups of 3 bits defining the file permissions. A regular file like stat.c would have an st_mode value of 0100644 (from S_IFREG | S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH).

<summary>Answer</summary>

</details>

<br>

---

### `uid_t st_uid`

<details>

Gives the numeric user id (uid) of the user to whom the file belongs (its owner); in this case, 516. This can be retrieved using ls -ln.

<summary>Answer</summary>

</details>

<br>

---

### `gid_t st_gid`

<details>

Gives the numeric id (gid) of the group to which the file belongs; in this case, 36820. This can be retrieved using ls -ln.

<summary>Answer</summary>

</details>

<br>

---

### `off_t st_size`

<details>

Gives the total size of the file in bytes. For a text file like stat.c, it's simply the number of characters in the file's content (i.e., 1855).

<summary>Answer</summary>

</details>

<br>

---

### `blksize_t st_blksize`

<details>

Gives the size of a block on the storage device useful for files of this type. Typical block size are 512, 1024, 4096, 8192.

<summary>Answer</summary>

</details>

<br>

---

### `blkcnt_t st_blocks`

<details>

Gives the amount of space on the storage device allocated for this file. Since it's allocated in 512B chunks, more space might be allocated than is actually required to store the bytes. Often blocks are allocated in groups of size 2^n. The total bytes allocated in the blocks must, of course, be larger than st_size. For stat.c, there are 8 blocks allocated (a total of 4096 bytes, to store the 1855 actually in the file).
<summary>Answer</summary>

</details>

<br>

---

### `time_t st_mtime`

<details>

Gives the last time the file was modified. A time_t value is typically implemented as an integer giving the number of seconds since midnight on Jan 1 1970. For the stat.c file, the most recent update time is shown in the ls output as Sep 9 14:24, which, here, is implied to be 2017/09/09 14:24, a value around 1504931040.

<summary>Answer</summary>

</details>

<br>

---

### `time_t st_atime`

<details>

The last time the file content was accessed (read or written). This value can be retrieved using ls -lu.

<summary>Answer</summary>

</details>

<br>

---

### `time_t st_ctime`

<details>

The last time the file status was changed. This could mean changing the file contents, or changing its associated metadata. This value can be retrieved using ls -lc.

<summary>Answer</summary>

</details>

<br>

---

## Q4 - Consider the following output

```
    $ ls -l cs1521
    drwxr-x--- 11 cs1521 cs1521 4096 Aug 27 11:59 17s2.work
    drwxr-xr-x  2 cs1521 cs1521 4096 Aug 20 13:20 bin
    -rw-r-----  1 cs1521 cs1521   38 Jul 20 14:28 give.spec
    drwxr-xr-x  3 cs1521 cs1521 4096 Aug 20 13:20 lib
    drwxr-x--x  3 cs1521 cs1521 4096 Jul 20 10:58 public_html
    drwxr-xr-x 12 cs1521 cs1521 4096 Aug 13 17:31 spim
    drwxr-x---  2 cs1521 cs1521 4096 Sep  4 15:18 tmp
    lrwxrwxrwx  1 cs1521 cs1521   11 Jul 16 18:33 web -> public_html
```

<br>

---

### Who can access the `17s2.work` directory?

<details>

The user cs1521, and any member of the cs1521 group can cd into the 17s2.work directory and list the directory contents. The user cs1521 can also create new entries in 17s2.work.

<summary>Answer</summary>

</details>

<br>

---

### What operations can a typical user perform on the `public_html` directory?

<details>

Assume that typical user means someone who is not a member of the cs1521 group. Such a user can cd into the directory, but they cannot list the contents of the directory. If they know the name of a file in the directory, they can also open that file (assuming they have read permission on the file).

<summary>Answer</summary>

</details>

<br>

---

### What is the file web?

<details>

The file web is a symbolic link (or symlink). It effectively makes web an alternative name for the public_html directory.

<summary>Answer</summary>

</details>

<br>

---

## What is the difference between `stat("web", &info)` and `lstat("web", &info)`? (where info is an object of type (struct stat))

<details>

The function call stat("web", &info) follows the symlink, and places meta-data about the public_html directory in the info struct.

The function call lstat("web", &info) places meta-data about the symlink itself into the info struct.

<summary>Answer</summary>

</details>

<br>

---

## Q5 - chmod_if_public.c

Write a C program, chmod_if_public_write.c, which is given 1+ command-line arguments which are the pathnames of files or directories
If the file or directory is publically-writeable, it should change it to be not publically-writeable, leaving other permissions unchanged.

It also should print a line to stdout as in the example below

```c
    $ dcc chmod_if_public_write.c -o chmod_if_public_write
    $ ls -ld file_modes.c file_modes file_sizes.c file_sizes
    -rwxr-xrwx 1 z5555555 z5555555 116744 Nov  2 13:00 file_sizes
    -rw-r--r-- 1 z5555555 z5555555    604 Nov  2 12:58 file_sizes.c
    -rwxr-xr-x 1 z5555555 z5555555 222672 Nov  2 13:00 file_modes
    -rw-r--rw- 1 z5555555 z5555555   2934 Nov  2 12:59 file_modes.c
    $ ./file_modes file_modes file_modes.c file_sizes file_sizes.c
    removing public write from file_sizes
    file_sizes.c is not publically writable
    file_modes is not publically writable
    removing public write from file_modes.c
    $ ls -ld file_modes.c file_modes file_sizes.c file_sizes
    -rwxr-xr-x 1 z5555555 z5555555 116744 Nov  2 13:00 file_sizes
    -rw-r--r-- 1 z5555555 z5555555    604 Nov  2 12:58 file_sizes.c
    -rwxr-xr-x 1 z5555555 z5555555 222672 Nov  2 13:00 file_modes
    -rw-r--r-- 1 z5555555 z5555555   2934 Nov  2 12:59 file_modes.c
```

<br>

---

## Q6 - fgrep.c

Write a C program, fgrep.c, which is given 1+ command-line arguments which is a string to search for.
If there is only 1 command-line argument it should read lines from stdin and print them to stdout iff they contain the string specified as the first command line argumenbt.

If there are 2 or more command line arguments, it should treat arguments after the first as fiilenames and print any lines they contain which contain the string specified as the first command line arguments.

When printing lines your program should prefix them with a line number.

It should print suitable error messages if given an incorrect number of arguments or if there is an error opening a file.