%{
#include <stdio.h>
#include <stdlib.h>
//	#include "roman.h"
//void yyerror(char *s);
// int yyparse();
//int yylex();
%}
/*declare tokens*/
%token M D C L X V I EOL


%%

input: /*empty*/
     | input line
     ;

line : roman EOL { printf("%d\n", $1);} 
     | EOL
     ;

roman: thous ;

thous: M thous { $$ = 1000+$2; }
     | ncent { $$ = $1; }
     ;
ncent: C M ninety { $$ = 900+$3; }
     | dcent { $$ = $1; }
     ;

dcent: D cents { $$ = 500+$2; }
     | C D ninety { $$ = 400+$3; }
     | cents { $$ = $1; }
     ;

cents: C C C ninety { $$ = 300+$4; }
     | C C ninety { $$ = 200+$3; }
     | C ninety { $$ = 100+$2; }
     | ninety { $$ = $1; }
     ;

ninety: X C nine { $$ = 90+$3; }
     | fifty { $$ = $1; }
     ;

fifty: L tens { $$ = 50+$2; }
     | X L nine { $$ = 40+$3; }
     | tens { $$ = $1; }
     ;

tens : X X X nine { $$ = 30+$4; }
     | X X nine { $$ = 20+$3; }
     | X nine { $$ = 10+$2; }
     | nine { $$ = $1; }
     ;

nine : I X { $$ = 9; }
     | fives { $$ = $1; }

fives: V ones { $$ = 5+$2; }
     | I V  { $$ = 4; }
     | ones { $$ = $1; }
     ;

ones : I I I  { $$ = 3; }
     | I I  { $$ = 2; }
     | I   { $$ = 1; }
     | /*empty*/{ $$ = 0; }
     ;

%%
int main()
{
    yyparse();
    return 0;
}
void yyerror(char *s)
{
  printf("%s\n",s);
  exit(0);
}
