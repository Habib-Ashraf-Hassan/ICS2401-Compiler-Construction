%{
#include <stdio.h>

int verb_count = 0;  
%}

%%

is|am|are|were|was|be|being|been|do|does|did|will|would|should|can|could|has|have|had|go  {
    printf("Verb: %s\n", yytext);  
    verb_count++; 
} 

[a-zA-Z]+ { /* Ignores other words */ }

[ \t\n]+  { /* Ignore whitespace */ }

.         { /* Ignores any other character */ }

%%

int main() {
    printf("Enter a sentence: ");
    yylex();  

    printf("\nTotal number of verbs found: %d\n", verb_count);
    return 0;
}

int yywrap() {
    return 1;
}