%option noyywrap nodefault yylineno
%{
# include "calcwithvariables.tab.h"
void yyerror(char *s);
int getIndex(char var);
int asciiA = 0x61;
%}

%%
[ \t\n]
\+    { return ADD; }
\-    { return SUB; }
\*    { return MUL; }
\/    { return DIV; }
\(    { return OBR; }
\)    { return CBR; }
:=    { return ASMT; }

print { return PRINT; }
[0-9] { yylval = atoi(yytext); return NUM; }
[a-z] { yylval = getIndex(yytext[0]); return VAR;}

;     { return EOL; }
.     {
        yyerror("syntax error");
      }

%%

int getIndex(char var)
{
    int index = var - asciiA;
    //printf("index: %c -> %d\n", var, index);
    return index;
}
