/*
 * https://www.scss.tcd.ie/John.Waldron/3071/3071.html
 * author: sastaffo@tcd.ie, student no. 16316349
 * extension to 5th October
 */

/*comments.l removes properly formatted comments from the input*/

%%

\*\*.*      { /* finds ** and ignores all chars after on the line*/ }
\".*\"      { /*prints all chars in double quotes*/
              printf(yytext);
            }
\{[^]]*\}   { /*ignores all chars between {}*/ }


\{          { /*returns an error if { or } appear alone*/
              printf("syntax error\n"); return;}
\}          { printf("syntax error\n"); return;}

%%

int main()
{
  yylex();
	return 0;
}
