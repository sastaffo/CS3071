%option noyywrap nodefault yylineno
%{
//# include "roman.h"
# include "calcwithvariables.tab.h"
void yyerror(char *s);
%}

%%
\+    { return ADD; }
\-    { return SUB; }
\*    { return MUL; }
\/    { return DIV; }
\(    { return OBR; }
\)    { return CBR; }
:=    { return ASMT; }

print { return PRINT; }
[0-9] { yylval = atoi(yytext); return NUM; }
[a-z] { return VAR;}

;     { return EOL; }
\n    { }
\s    { }
.     {
        yyerror("LEX: syntax error");
      }

%%
