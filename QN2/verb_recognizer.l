%{
#include <stdio.h>

// Global variables to count and store recognized verbs
int verb_count = 0;
char recognized_verbs[100][50];  // Array to store recognized verbs
%}

%%

is|am|are|were|was|be|being|been|do|does|did|will|would|should|can|could|has|have|had|go  {
    strcpy(recognized_verbs[verb_count++], yytext);
} 

[a-zA-Z]+ { /* Ignores other words */ }

[ \t\n]+  { /* Ignore whitespace */ }

.         { /* Ignores any other character */ }

%%

int main() {
    yylex(); // Start the lexical analysis

    // Output the results
    if (verb_count > 0) {
        printf("Number of verbs recognized: %d\n", verb_count);
        printf("Verbs recognized: ");
        for (int i = 0; i < verb_count; i++) {
            printf("%s ", recognized_verbs[i]);
        }
        printf("\n");
    } else {
        printf("0 verbs recognized\n");
    }
    return 0;
}

int yywrap() {
    return 1;
}
