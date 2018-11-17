%{
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
int asciiA = 0x61;
int variables[26];
void yyerror(char *s);
int lookup(char var);
void assign(char var, int val);
%}
/*declare tokens*/
%token VAR NUM
%token ADD SUB MUL DIV OBR CBR
%token ASMT PRINT EOL

%%

statement: assign EOL {}
         | PRINT VAR EOL { printf("%d\n", lookup($2));}
         ;

assign : VAR ASMT expr { assign($1, $3); }
       ;

expr : fact          { $$ = $1; }
     | expr ADD fact { $$ = $1 + $3; }
     | expr SUB fact { $$ = $1 - $3; }
     ;

fact : term          { $$ = $1; }
     | fact MUL term { $$ = $1 * $3; }
     | fact DIV term { if ($3==0) yyerror("cannot divide by 0");
                       $$ = $1 / $3;
                     }
     ;

term : NUM          { $$ = $1; }
     | VAR          { $$ = lookup($1); }
     | OBR expr CBR { $$ = $2; }
     ;


%%
int main()
{
    memset(variables, 0, 26);
    yyparse();
    return 0;
}
void yyerror(char *s)
{
    printf("%s\n",s);
    exit(0);
}

int lookup(char var)
{
    int index = var - asciiA;
    int val = variables[index];
    return val;
}

void assign(char var, int val)
{
    int index = var - asciiA;
    variables[index] = val;
}
