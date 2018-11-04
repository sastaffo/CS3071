%option noyywrap nodefault yylineno
%{
//# include "roman.h"
# include "romcalc.tab.h"
void yyerror(char *s);
%}

%%
\+    { return ADD; }
\-    { return SUB; }
\*    { return MUL; }
\/    { return DIV; }
\{    { return OBR; }
\}    { return CBR; }

M     { return M; }
D     { return D; }
C     { return C; }
L     { return L; }
X     { return X; }
V     { return V; }
I     { return I; }

\n    { return EOL; }
\s    { }
.     {
        yyerror("syntax error");
      }

%%
