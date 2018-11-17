calc: lex.yy.c calcwithvariables.tab.c
	gcc -o calc lex.yy.c calcwithvariables.tab.c

lex.yy.c: calcwithvariables.l
	flex -o lex.yy.c calcwithvariables.l

calcwithvariables.tab.c: calcwithvariables.y
	bison -d calcwithvariables.y
