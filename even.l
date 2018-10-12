/*
 * https://www.scss.tcd.ie/John.Waldron/3071/3071.html
 * author: sastaffo@tcd.ie, student no. 16316349
 */

/*even.l finds even numbers in a list of inputted integers*/
%{
int evens = 0;
%}

%%

[0-9]+	{ if (atoi(yytext) % 2 == 0) evens++;}
\n      { }
.       { }

%%

int main()
{
  yylex();
  printf("%d\n", evens);
	return 0;
}
