# Week 2 Tutorial

### Any questions/topics that you want to cover today?

Today we will be covering:

* Binary, Octal, Decimal, Hexadecimal
* Bitwise operations

---

## What is a bit? What is a byte? What is the range of values for a integer?

<details>

A simple way of thinking of a bit is a box that can contain a 1 or a 0, which is binary as it can only contain 2 possibilities. This is in contrast to decimal where we can have a 0, 1, 2, 3, 4, 5, 6, 7, 8 or 9 per 'box', allowing it to contain 10 possibilities.

A byte is 8 bits lined up together. Together they can store 2^8 = 256 combinations/numbers so each byte can count upto 256.

<summary>Answer</summary>

</details>

<br>

## What are binary, decimal, octal and hexadecimal? Can we write the first 16 digits of each?

<details>

Binary | Octal | Hexadecimal
--- | --- | ---
`0000` | `00` | `0x00`
`0001` | `01` | `0x01`
`0010` | `02` | `0x02`
`0011` | `03` | `0x03`
`0100` | `04` | `0x04`
`0101` | `05` | `0x05`
`0110` | `06` | `0x06`
`0111` | `07` | `0x07`
`1000` | `10` | `0x08`
`1001` | `11` | `0x09`
`1010` | `12` | `0x0A`
`1011` | `13` | `0x0B`
`1100` | `14` | `0x0C`
`1101` | `15` | `0x0D`
`1110` | `16` | `0x0E`
`1111` | `17` | `0x0F`

<summary>Answer</summary>

</details>

<br>

---

## Q2 - What do the following decimal values look like in 8-bit binary, 3-digit octal, and 2-digit hexadecimal?

### 1

<details>

Binary | Octal | Hexadecimal
--- | --- | ---
`00000001` | `001` | `0x01`

<summary>Answer</summary>

</details>

<br>

### 8

<details>

Binary | Octal | Hexadecimal
--- | --- | ---
`00001000` | `010` | `0x08`

<summary>Answer</summary>

</details>

<br>

### 10

<details>

Binary | Octal | Hexadecimal
--- | --- | ---
`00001010` | `012` | `0x0A`

<summary>Answer</summary>

</details>

<br>

### 15

<details>

Binary | Octal | Hexadecimal
--- | --- | ---
`00001111` | `017` | `0x0F`

<summary>Answer</summary>

</details>

<br>

### 16

<details>

Binary | Octal | Hexadecimal
--- | --- | ---
`00010000` | `020` | `0x10`

<summary>Answer</summary>

</details>

<br>

### 100

<details>

Binary | Octal | Hexadecimal
--- | --- | ---
`01100100` | `144` | `0x64`

<summary>Answer</summary>

</details>

<br>


### 127

<details>

Binary | Octal | Hexadecimal
--- | --- | ---
`01100100` | `144` | `0x64`

<summary>Answer</summary>

</details>

<br>

### 200

<details>

Binary | Octal | Hexadecimal
--- | --- | ---
`11001000` | `310` | `0xC8`

<summary>Answer</summary>

</details>

<br>


### Can we write a program to solve these for us?

---

## Q3 - Given `uint16_t a = 0x5555, b = 0xAAAA, c = 0x0001`, find:

### `a | b` (bitwise OR)

<details>

`a = 0x5 = 0101, b = 0xA = 1010`

`0101 | 1010 = 1111 = 0xF`

` a | b = 0xFFFF`

<summary> Answer </summary>

</details>

<br>

### `a & b` (bitwise AND)

<details>

`0101 & 1010 = 0000 = 0x0`

` a & b = 0x0000`

<summary> Answer </summary>

</details>

<br>

### `a ^ b` (bitwise XOR)

<details>

`0101 ^ 1010 = 1111 = 0xF`

` a ^ b = 0xFFFF`

<summary> Answer </summary>

</details>

<br>

### `a & ~b` (bitwise AND)

<details>

`~b = ~1010 = 0101`

`a & ~b = 0101 & 0101 = 0101 = 0x5`

`a & ~b = 0x5555`

<summary> Answer </summary>

</details>

<br>

### `c << 6` (left shift)

<details>

`c = 0x0001 = 0000 0000 0000 0001`

`c << 6 = 0000 0000 0100 0000 = 0x0040`

<summary> Answer </summary>

</details>

<br>

### `a >> 4` (right shift)

<details>

`a = 0x5555 = 0101 0101 0101 0101`

`a >> 4 = 0000 0101 0101 0101 = 0x0555`

<summary> Answer </summary>

</details>

<br>

### `a & (b << 1)`

<details>

`b << 1 = 1010 1010 1010 1010 << 1 = 0101 0101 0101 0100 = 0x5554`

`0x5555 & 0x5554 = 0x5554` 

<summary> Answer </summary>

</details>

<br>

### `b | c`

<details>

`0x5554` 

<summary> Answer </summary>

</details>

<br>

### `a & ~c`


<details>

`0x5554` 

<summary> Answer </summary>

</details>

<br>

---

## Precursor question - How do we store booleans in C? 

## Q4 - Consider a scenario where we have the following flags controlling access to a device.

```c
    #define READING   0x01
    #define WRITING   0x02
    #define AS_BYTES  0x04
    #define AS_BLOCKS 0x08
    #define LOCKED    0x10
```

The flags are contained in an 8-bit register, defined as:
unsigned char device;
Write C expressions to implement each of the following:

### Mark the device as locked for reading bytes

<details>

`device = (READING | AS_BYTES | LOCKED);`

<summary>Answer</summary>

</details>

<br>

### Mark the device as locked for writing blocks

<details>

`device = (WRITING | AS_BLOCKS | LOCKED);`

<summary>Answer</summary>

</details>

<br>

### Set the device as locked, leaving other flags unchanged

<details>

`device = device | LOCKED;`

<summary>Answer</summary>

</details>

<br>

### Determine if a device is locked

<details>

`isLocked = device & LOCKED;`

<summary>Answer</summary>

</details>

<br>

### Remove the lock on a device, leaving other flags unchanged

<details>

`device = device | LOCKED;`

<summary>Answer</summary>

</details>

<br>

### Switch a device to/from reading and writing, leaving other flags unchanged

<details>

`device = device | LOCKED;`

<summary>Answer</summary>

</details>

<br>

---

## Q5 - Discuss the starting code for sixteen_out, one of this week's lab exercises. In particular, what does this code (from the provided main) do?

```c
    long l = strtol(argv[arg], NULL, 0);
    assert(l >= INT16_MIN && l <= INT16_MAX);
    int16_t value = l;

    char *bits = sixteen_out(value);
    printf("%s\n", bits);

    free(bits);
```

<details>

strtol(3) is a standard library funcion that converts a nul-terminated string passed as its first argument to an integer value (it returns long).

The third parameter value indicates what radix or numeric base to use; e.g., 10 for decimal. A value of 0 means values starting with 0x are interpreted as hexadeximal, values starting with 0 are interpreted as octal, and otherwise decimal.

strtol(3)'s second argument, if it is not NULL, allows for error checking: it is set to point to the first character that couldn't be understood.

We also check the value will fit in int16_t, a 16-bit signed integer by using assert(3).

sixteen_out needs to return a string allocated with (e.g.,) malloc(3): we call free(3) to release that allocation

<summary>Answer</summary>

</details>

### Q6 - reverseBits()

Given the following type definition

```c 
    typedef unsigned int Word;
```

Write a function

```c
Word reverseBits(Word w);
```

... which reverses the order of the bits in the variable w.
For example: If w == 0x01234567, the underlying bit string looks like:

0000 0001 0010 0011 0100 0101 0110 0111
which, when reversed, looks like:

1110 0110 1010 0010 1100 0100 1000 0000
which is 0xE6A2C480 in hexadecimal.
