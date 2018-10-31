romcalc: romcalc.yy.c romcalc.tab.c
	gcc -o romcalc romcalc.yy.c romcalc.tab.c

romcalc.yy.c: romcalc.l
	flex -o romcalc.yy.c romcalc.l

romcalc.tab.c: romcalc.y
	bison -d romcalc.y
