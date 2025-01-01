%{
    #include "y.tab.h"
    extern int count_a;
%}

%%
a    { return A; }
b    { return B; }
\n   { return NL; }
.    { printf("Invalid character\n"); }
%%

int yywrap() {
    return 1;
}