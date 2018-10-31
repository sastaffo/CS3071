### Assignment 4: roman.l, roman.y

Write a Bison program that takes a series of uppercase Roman numerals as input, parses them, and takes semantic actions to compute and print the corresponding Hindu-Arabic numeral.

Test cases will be newline seperated lists of Roman numerals and the program should output the corresponding Hindu-Arabic numeral followed by a new line for each one.

If an invalid number is detected the program should output the words "*syntax error\n*" to standard output and then exit.

Your source code should be in two files, roman.l and roman.y, and the defaults filenames lex.yy.c roman.tab.c roman.tab.h should be generated. Put the two files roman.l and roman.y only into a zip archive and use the codemark submit archive page to upload. Do not use subdirectories. Supported archive file formats include Zip, Tar-GZip, Tar-BZip2, RAR, 7-zip, LhA, StuffIt and other old and obscure formats.

Roman numerals, as used today, are based on seven symbols:

Symbol | Value
--- | ---
I | 1
V | 5
X | 10
L | 50
C | 100
D | 500
M | 1000

The numbers from 1 to 10 (including subtractive notation for 4 and 9) are expressed in Roman numerals as follows:

```
I    II   III  IV   V    VI   VII  VIII IX   X
```

The system being basically decimal, tens and hundreds follow the same pattern: with 40 (*XL*), 90 (*XC*), 400 (*CD*), and 900 (*CM*) following the same subtractive pattern as 4 and 9.

___
