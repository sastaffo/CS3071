### Assignment 5: romcalc.l, romcalc.y

Write a Bison program that takes a series of expressions using uppercase Roman numerals as input, and computes and prints the corresponding value. The expressions should only contain __+ - / *__ (associativity is _left to right_, __+ and -__ have the same precedence as does __* and /__). The expressions will use __{__ and __}__ as parentheses.

Test cases will be newline seperated lists of Roman numeral expressions and the program should output the corresponding value in roman numerals followed by a new line for each one. Use __-__ _for a negative number_ and __Z__ _to indicate zero_. Use repeated Ms to indicate thousands, ie MMMMMM for 6000.

If an invalid input is detected the program should output the words __"syntax error\\n"__ to standard output and then exit.

Your source code should be in two files, _romcalc.l_ and _romcalc.y_, and the defaults filenames _lex.yy.c romcalc.tab.c romcalc.tab.h_ should be generated. Put the two files romcalc.l and romcalc.y only into a zip archive and use the codemark submit archive page to upload. Do not use subdirectories. Supported archive file formats include Zip, Tar-GZip, Tar-BZip2, RAR, 7-zip, LhA, StuffIt and other old and obscure formats.
