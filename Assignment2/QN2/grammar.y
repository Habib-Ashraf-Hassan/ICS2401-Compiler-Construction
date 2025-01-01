%{
    #include <stdio.h>
    #include <stdlib.h>
    int yylex();
    void yyerror(const char *s);
    int count_a = 0;    // Counter for 'a's
%}

%token A B NL

%%
start: S NL    { 
                 printf("Number of a's: %d\n", count_a);
                 count_a = 0;    // Reset counter for next input
                 return 0; 
               }
     ;

S: A S         { count_a++; }
 | B          { }
 ;
%%

void yyerror(const char *s) {
    printf("Error: %s\n", s);
}

int main() {
    printf("Enter a string (using only 'a' and 'b', end with newline):\n");
    yyparse();
    return 0;
}