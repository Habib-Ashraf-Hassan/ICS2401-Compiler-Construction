%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(const char *s);
int yylex();
%}

%token NUMBER
%token PLUS MINUS NEWLINE

%%
calculation:
    | calculation expression NEWLINE { printf("Result: %d\n", $2); }
    ;

expression: NUMBER           { $$ = $1; }
    | expression PLUS NUMBER { $$ = $1 + $3; }
    | expression MINUS NUMBER { $$ = $1 - $3; }
    ;
%%

void yyerror(const char *s) {
    printf("Error: %s\n", s);
}

int main() {
    printf("Enter expressions (e.g., '5 + 3 - 2'):\n");
    printf("Press Ctrl+D (Unix) to exit\n");
    yyparse();
    return 0;
}