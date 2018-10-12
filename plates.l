%{
   int currYear = 18;
%}

old      {yrOld}{dash}{cntyOld}{dash}{seqNum}{ws}*
thirteen {yrT}{dash}{cntyOld}{dash}{seqNum}{ws}*
new      {yrNew}{dash}{cntyNew}{dash}{seqNum}{ws}*
invalid  ([0-9]*{dash}[a-zA-Z]*{dash}[0-9]*)*

ws      [\ \t\n]
dash    [-]
seqNum  [1-9][0-9]{0,5}

yrOld   [8][7-9]|[90][0-9]|[1][0-2]
yrT     [1][3][1-2]
cntyOld ("C"|"CE"|"CN"|"CW"|"D"|"DL"|"G"|"KE"|"KK"|"KY"|"L"|"LD"|"LH"|"LK"|"LM"|"LS"|"MH"|"MN"|"MO"|"OY"|"RN"|"SO"|"TN"|"TS"|"W"|"WD"|"WH"|"WX"|"WW")

yrNew   [1][4-8][1-2]
cntyNew ("C"|"CE"|"CN"|"CW"|"D"|"DL"|"G"|"KE"|"KK"|"KY"|"L"|"LD"|"LH"|"LM"|"LS"|"MH"|"MN"|"MO"|"OY"|"RN"|"SO"|"T"|"W"|"WH"|"WX"|"WW")

%%

{ws}* {}
{old} {/*finds all plates from years 1987-2012*/
            while(isspace((unsigned char) *yytext_ptr) ) { yytext_ptr++; }
            char yearS[3];
            memcpy(yearS, yytext, 2);
            yearS[2]='\0';
            int year = atoi(yearS);
            int age;
            if (year>=00&&year<=12) {
                age = currYear-year;
                printf("%d\n", age);
            } else if (year>=87&&year<=99) {
                age = (100+currYear)-year;
                printf("%d\n",age);
            } else printf("INVALID\n");
            return;
        }
{thirteen} { /*finds all plates from year 2013*/
            int age = currYear-13;
            printf("%d\n",age);
            return;
        }
{new} {/*finds all plates from years 2014-currYear*/
            while(isspace((unsigned char) *yytext_ptr) ) { yytext_ptr++; }
            char yearS[3];
            memcpy(yearS, yytext, 2);
            yearS[2]='\0';
            int year = atoi(yearS);
            if (year>=14&&year<=currYear) {
                int age = currYear-year;
                printf("%d\n", age);
            } else printf("INVALID\n");
            return;
        }
{invalid} {printf("INVALID\n");}
.* { printf("INVALID\n"); }
%%
