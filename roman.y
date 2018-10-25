%{
    // bottom-up parser
    #include <stdio.h>
	#include <stdlib.h>
//	#include "roman.h"
    void yyerror(char *s);
   // int yyparse();
   int yylex();
%}
/*declare tokens*/
%token M D C L X V I EOL


%%

roman: thous
     ;

thous: M thous { $$ = 1000+$2; }
     | ncent { $$ = $1; }
     ;
ncent: C M dcent { $$ = 900+$3; }
     | dcent { $$ = $1; }
     ;

dcent: D cents { $$ = 500+$2; }
     | C D cents { $$ = 400+$3; }
     | cents { $$ = $1; }
     ;

cents: C C C ninety { $$ = 300+$2; }
     | C C ninety { $$ = 200+$2; }
     | C ninety { $$ = 100+$2; }
     | ninety { $$ = $1; }
     ;

ninety: X C fifty { $$ = 90+$3; }
     | fifty { $$ = $1; }
     ;

fifty: L tens { $$ = 50+$2; }
     | X L tens { $$ = 40+$3; }
     | tens { $$ = $1; }
     ;

tens : X X X nine { $$ = 30+$2; }
     | X X nine { $$ = 20+$2; }
     | X nine { $$ = 10+$2; }
     | nine { $$ = $1; }
     ;

nine : I X fives { $$ = 9+$3; }
     | fives { $$ = $1; }

fives: V ones { $$ = 5+$2; }
     | I V ones { $$ = 4+$3; }
     | ones { $$ = $1; }
     ;

ones : I I I EOL { $$ = 3; }
     | I I EOL { $$ = 2; }
     | I EOL  { $$ = 1; }
	 | EOL
     ;

%%
int main()
{
    yyparse();
    return 0;
}
void yyerror(char *s)
{
  printf("error: %s\n", s);
}
