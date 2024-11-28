%{
#include <stdio.h>
#include <string.h>

void replace_abc(char* str) {
    char* found;
    while ((found = strstr(str, "abc")) != NULL) {
        found[0] = 'A';
        found[1] = 'B';
        found[2] = 'C';
    }
}
%}

%%

abc         { printf("ABC"); }
[a-zA-Z0-9]+   { 
                replace_abc(yytext);
                printf("%s", yytext);
            }
[ \t\n]     { printf("%s", yytext); }  /* Explicitly handle whitespace */
.           { printf("%s", yytext); }  /* Handle any other character */

%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
