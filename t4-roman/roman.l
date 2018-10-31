%option noyywrap nodefault yylineno
%{
//# include "roman.h"
# include "roman.tab.h"
void yyerror(char *s);
%}

%%

M     { return M; }
D     { return D; }
C     { return C; }
L     { return L; }
X     { return X; }
V     { return V; }
I     { return I; }
\n    { return EOL; }
\s    { return; }
.     {
        yyerror("syntax error");
      }

%%
