# CS3071

## 3rd Year Compiler Design module using flex and bison

___

### Assignment 1: even.l

Write a flex program even.l which takes a sequence of integers as its input and outputs a count of the number of even integers a \n and no other characters.

___

### Assignment 2: comments.l

Write a flex program comments.l which removes comments from a slightly odd programming language and sends the remaining code to its output.

__**__ means regard the two asterisks and all following characters on that line up to a *\\n* as comment.

anything between **{** and **}** is comment, potentially across multiple lines.

a **{** inside a comment is just part of the comment.

a **{** not followed by **}** is regarded as a syntax error and your program should output the phrase "*syntax error\n*" in place of the remaining input and exit when it detects this.

a **}** not preceded by a matching **{** is regarded as a syntax error and your program should output the phrase "*syntax error\n*" and exit at this place.

between double-quote characters **{}** and __**__ are regarded as part of a string and dont indicate comments.

there's no facility to put a double-quote inside a string.

___

### Assignment 3: plates.l

Write a flex program that reads a whitespace (space tab or newline) seperated list of Irish car registration numbers and outputs the number of years since registration followed by a new line for each one.

If an invalid registration is detected the program should output the word "*INVALID*" followed by a newline character.

The current specification for number plates is the format *YYY-CC-SSSSSS*. Those issued from 1987 to 2012 had the format *YY-CC-SSSSSS*.

**The components are:**

*YYY* - a 3-digit year (e.g. 131 for January to June 2013; 132 for July to December 2013)
*YY* from 1987-2012 - a 2-digit year (e.g. 87 for 1987; 05 for 2005)
*CC* - a 1- or 2-character County/City identifier (e.g. L for Limerick City and County; SO for County Sligo).
*SSSSSS* - a 1- to 6-digit sequence number, starting with the first vehicle registered in the county/city that year/period.

**2014-present:**

Tag  | County
---- | ----
*C*  | Cork 	
*CE* | Clare 	
*CN* | Cavan 	
*CW* | Carlow 	
*D*  | Dublin
*DL* | Donegal
*G*  | Galway 	
*KE* | Kildare 	
*KK* | Kilkenny 	
*KY* | Kerry 	
*L*  | Limerick
*LD* | Longford
*LH* | Louth 	
*LM* | Leitrim
*LS* | Laois 	
*MH* | Meath
*MN* | Monaghan 	
*MO* | Mayo
*OY* | Offaly 	
*RN* | Roscommon 	
*SO* | Sligo 	
*T*  | Tipperary 	
*W*  | Waterford 	
*WH* | Westmeath 	
*WX* | Wexford 	
*WW* | Wicklow

**Differences 1987-2013:**

Tag  | County/City
---- | ----
*L*  | Limerick City
*LK* | County Limerick
---- | ----
*TN* | North Tipperary
*TS* | South Tipperary
*T*  | INVALID
---- | ----
*W*  | Waterford City
*WD* | County Waterford

Note you can define sub-parts of regular expressions in the definitions section and then
use these in the rule:
```
NUMBER  [0-9]...
COUNTY  KK|...
YEAR  [0-9]...
%%
{YEAR}{COUNTY}{NUMBER}   { do stuff... }
%%
```

___

### Assignment 4: roman.l, roman.y

Write a Bison program that takes a series of uppercase Roman numerals as input, parses them, and takes semantic actions to compute and print the corresponding Hindu-Arabic numeral.

Test cases will be newline seperated lists of Roman numerals and the program should output the corresponding Hindu-Arabic numeral followed by a new line for each one.

If an invalid number is detected the program should output the words "syntax error" followed by a newline character to standard output and then exit.

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
I II III IV V VI VII VIII IX X
```

The system being basically decimal, tens and hundreds follow the same pattern: with 40 (*XL*), 90 (*XC*), 400 (*CD*), and 900 (*CM*) following the same subtractive pattern as 4 and 9.
