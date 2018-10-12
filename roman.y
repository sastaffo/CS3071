%{
    // bottom-up parser
    #include <stdio.h>
    void yyerror(char *s);
    int yylex();
    int yyparse();
%}
%output "roman.c"

%%



%%
