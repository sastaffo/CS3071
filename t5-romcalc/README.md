Write a Bison program that takes a series of expressions using uppercase Roman numerals as input, and computes and prints the corresponding value. The expressions should only contain + - / * (associativity is left to right, + and - have the same precedence as does * and /). The expressions will use { and } as parentheses.

Test cases will be newline seperated lists of Roman numeral expressions and the program should output the corresponding value followed by a new line for each one. Use - for a negative number and Z to indicate zero. Use repeated Ms to indicate thousands, ie MMMMMM for 6000.

If an invalid input is detected the program should output the words "syntax error" followed by a newline character to standard output and then exit.

Your source code should be in two files, romcalc.l and romcalc.y, and the defaults filenames lex.yy.c romcalc.tab.c romcalc.tab.h should be generated. Put the two files romcalc.l and romcalc.y only into a zip archive and use the codemark submit archive page to upload. Do not use subdirectories. Supported archive file formats include Zip, Tar-GZip, Tar-BZip2, RAR, 7-zip, LhA, StuffIt and other old and obscure formats.
