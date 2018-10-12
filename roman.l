%{
    int M = 1000;
    int D =  500;
    int C =  100;
    int L =   50;
    int X =   10;
    int V =    5;
    int I =    1;
}%

ms      (M*(CM)?)
dcd     (D|CD)?
cs      (C{0,3}(XC)?)
lxl     (L|XL)?
xs      (X{0,3}(IX)?)
v       (V|IV)?
i       (I{0,3})
valid   {ms}{dcd}{cs}{lxl}{xs}{v}{i}

%%
{valid} { //
            int sum = 0;
            for(int i=0; i<sizeof(yytext); i++) {
                char x = yytext[i];
                switch(x) {
                    case 'M':
                        sum += M;
                        break;
                    case 'D':
                        sum += D;
                        break;
                    case 'C':
                        if (yytext[i+1] == 'M') { sum += (M-C); i++; }
                        else if (yytext[i+1] == 'D') { sum += (D-C); i++; }
                        else { sum += C; }
                        break;
                    case 'L':
                        sum += L;
                        break;
                    case 'X':
                        if (yytext[i+1] == 'C') { sum += (C-X); i++; }
                        else if (yytext[i+1] == 'L') { sum += (L-X); i++; }
                        else sum += X;
                        break;
                    case 'V':
                        sum += V;
                        break;
                    case 'I':
                        if (yytext[i+1] == 'X') { sum += (X-I); i++; }
                        else if (yytext[i+1] == 'V') {sum += (V-I); i++; }
                        else sum += I;
                        break;
                    default:
                        printf("syntax error\n");
                        break; // TODO
                }
            }
            printf("%d", sum);
        }
\n      { }
.*      { printf("syntax error\n"); }

%%

int main()
{
  yylex();
	return 0;
}
