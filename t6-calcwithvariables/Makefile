romcalc: lex.yy.c calcwithvariables.tab.c
	gcc -o calc lex.yy.c calcwithvariables.tab.c

romcalc.yy.c: calcwithvariables.l
	flex -o lex.yy.c calcwithvariables.l

romcalc.tab.c: calcwithvariables.y
	bison -d calcwithvariables.y
