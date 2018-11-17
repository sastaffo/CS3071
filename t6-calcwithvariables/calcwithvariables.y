%{
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
int variables[26];
void yyerror(char *s);
int get(int index);
void put(int index, int val);
%}
/*declare tokens*/
%token VAR NUM
%token ADD SUB MUL DIV OBR CBR
%token ASMT PRINT EOL

%%
input : /*nothing*/
      | input EOL {}
      | input statement EOL {}
      ;

statement: VAR ASMT expr_u { put($1, $3); }
         | PRINT VAR      { printf("%d\n", get($2));}
         ;

expr_u : expr     { $$ = $1; }
       | SUB expr { $$ = $2 * -1; }
       ;
expr   : fact           { $$ = $1; }
       | expr_u ADD fact_u { $$ = $1 + $3; }
       | expr_u SUB fact_u { $$ = $1 - $3; }
       ;

fact_u : fact { $$ = $1; }
       | SUB fact { $$ = $2 * -1; }
       ;
fact   : term_u            { $$ = $1; }
       | fact_u MUL term_u { $$ = $1 * $3; }
       | fact_u DIV term_u { if ($3==0) yyerror("cannot divide by 0");
                           else $$ = $1 / $3;
                         }
       ;

term_u : term { $$ = $1; }
       | SUB term { $$ = $2 * -1; }
       ;
term   : NUM           { $$ = $1; }
       | VAR           { $$ = get($1); }
       | OBR expr_u CBR { $$ = $2; }
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

int get(int index)
{
    int val = variables[index];
    //printf("getting [%d] = %d\n", index, val);
    return val;
}

void put(int index, int val)
{
    variables[index] = val;
    //printf("putting [%d] = %d\n", index, val);
}
