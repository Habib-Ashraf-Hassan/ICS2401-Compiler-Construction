%{
#include "y.tab.h"
#include <stdlib.h>
%}

%%
[0-9]+      { yylval = atoi(yytext); return NUMBER; }
"+"         { return PLUS; }
"-"         { return MINUS; }
\n          { return NEWLINE; }
[ \t]       ; /* Skip whitespace */
.           { printf("Invalid character: %s\n", yytext); }
%%

int yywrap() {
    return 1;
}