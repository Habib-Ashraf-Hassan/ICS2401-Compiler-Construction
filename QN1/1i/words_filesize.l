%{
#include <stdio.h>
int word_count = 0;
int total_word_size = 0;
int total_file_size = 0;
%}

%%

[a-zA-Z]+   { word_count++; total_word_size += yyleng; total_file_size += yyleng; }
[ \t\n]     { total_file_size += yyleng; }  /* Count whitespace, tabs, newlines */
.           { total_file_size++; }          /* Count any other character */

%%

int main() {
    yylex();

    printf("Number of words: %d\n", word_count);
    printf("Total size of words: %d characters/bytes \n", total_word_size);
    printf("Total file size: %d characters/bytes using a single-byte character encoding ie ASCII\n", total_file_size);
    return 0;
}

int yywrap() {
    return 1;
}
