%{
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
void yyerror(char *s);
void printRoman(int x);
%}
/*declare tokens*/
%token M D C L X V I EOL
%token ADD SUB MUL DIV OBR CBR

%%

input: /*empty*/        { }
     | input expr EOL   { printRoman($2); }
     | input EOL        { }
     ;

expr : fact             { $$ = $1; }
     | expr ADD fact    { $$ = $1 + $3; }
     | expr SUB fact    { $$ = $1 - $3; }
     ;

fact : term
     | fact MUL term    { $$ = $1 * $3; }
     | fact DIV term    { if ($3==0)
                            yyerror("cannot divide by 0");
                          $$ = $1 / $3;
                        }
     ;

term : roman            { $$ = $1; }
     | OBR expr CBR     { $$ = $2; }
     ;


roman: M roman          { $$ = 1000 + $2; }
     | _cm              { $$ = $1; }
     ;

_cm  : C M _xc          { $$ = 900 + $3; }
     | _dcd             { $$ = $1; }
     ;

_dcd : D _ccc           { $$ = 500 + $2; }
     | C D _xc          { $$ = 400 + $3; }
     | _ccc             { $$ = $1; }
     ;

_ccc : C C C _xc        { $$ = 300 + $4; }
     | C C _xc          { $$ = 200 + $3; }
     | C _xc            { $$ = 100 + $2; }
     | _xc              { $$ = $1; }
     ;

_xc  : X C _ix          { $$ = 90 + $3; }
     | _lxl             { $$ = $1; }
     ;

_lxl : L _xxx           { $$ = 50 + $2; }
     | X L _ix          { $$ = 40 + $3; }
     | _xxx             { $$ = $1; }
     ;

_xxx : X X X _ix        { $$ = 30 + $4; }
     | X X _ix          { $$ = 20 + $3; }
     | X _ix            { $$ = 10 + $2; }
     | _ix              { $$ = $1; }
     ;

_ix  : I X              { $$ = 9; }
     | _viv             { $$ = $1; }
     ;

_viv : V _iii           { $$ = 5 + $2; }
     | I V              { $$ = 4; }
     | _iii             { $$ = $1; }
     ;

_iii : I I I            { $$ = 3; }
     | I I              { $$ = 2; }
     | I                { $$ = 1; }
     | /*empty*/        { $$ = 0; }
     ;

%%
int main()
{
    yyparse();
    return 0;
}
void yyerror(char *s)
{
    printf("%s\n",s);
    exit(0);
}

void printRoman(int x)
{
    char roman[100];
    memset(roman, 0, 100);
    int i = 0;

    if (x==0) {
        printf("Z\n");
        return;
    }

    int xtmp;
    if (x<0) {
        roman[i++] = '-';
        xtmp = x*(-1);
    }
    else {
        xtmp = x;
    }
    int getDigit = 1000;
    while (xtmp>0)
    {
        int digit = xtmp/getDigit;
        //printf("digit: %d\n", digit);
        xtmp = xtmp%getDigit;
        //printf("modulus: %d\n", xtmp);
        char *tmp;
        switch (getDigit) {
        case 1000:
            for (; digit>0; digit--)
                roman[i++] = 'M';
            //printf("M's -> %s\n", roman);
            break;
        case 100:
            switch (digit) {
            case 9: tmp = "CM";   break;
            case 8: tmp = "DCCC"; break;
            case 7: tmp = "DCC";  break;
            case 6: tmp = "DC";   break;
            case 5: tmp = "D";    break;
            case 4: tmp = "CD";   break;
            case 3: tmp = "CCC";  break;
            case 2: tmp = "CC";   break;
            case 1: tmp = "C";    break;
            default:tmp = "";
            }
            strcat(roman, tmp);
            //printf("%s -> %s\n", tmp, roman);
            break;
        case 10:
            switch (digit) {
            case 9: tmp = "XC";   break;
            case 8: tmp = "LXXX"; break;
            case 7: tmp = "LXX";  break;
            case 6: tmp = "LX";   break;
            case 5: tmp = "L";    break;
            case 4: tmp = "XL";   break;
            case 3: tmp = "XXX";  break;
            case 2: tmp = "XX";   break;
            case 1: tmp = "X";    break;
            default:tmp = "";
            }
            strcat(roman, tmp);
            //printf("%s -> %s\n", tmp, roman);
            break;
        case 1:
            switch (digit) {
            case 9: tmp = "IX";   break;
            case 8: tmp = "VIII"; break;
            case 7: tmp = "VII";  break;
            case 6: tmp = "VI";   break;
            case 5: tmp = "V";    break;
            case 4: tmp = "IV";   break;
            case 3: tmp = "III";  break;
            case 2: tmp = "II";   break;
            case 1: tmp = "I";    break;
            default:tmp = "";
            }
            strcat(roman, tmp);
            //printf("%s -> %s\n", tmp, roman);
            break;
        }
        getDigit = getDigit/10;
    }
    printf("%s\n", roman);
    return;
}
