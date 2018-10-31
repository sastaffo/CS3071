roman: roman.yy.c roman.tab.c 
	gcc -o roman roman.yy.c roman.tab.c

roman.yy.c: roman.l
	flex -o roman.yy.c roman.l

roman.tab.c: roman.y
	bison -d roman.y






