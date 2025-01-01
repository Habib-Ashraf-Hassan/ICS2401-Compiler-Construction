# Compile the files
```
yacc -d calc.y
```
```
lex calc.l
```
```
gcc lex.yy.c y.tab.c -o calculator
```
### Run the calculator
```
./calculator
```
## Example usage:
```
Enter expressions (e.g., '5 + 3 - 2'):
5 + 3
Result: 8
10 - 4
Result: 6
7 + 3 - 2
Result: 8
```

**NOTE: Error handling has been taken care of, thus entering foreign characters(including '*' becuase this calculator does addition and substraction only) or having imbalanced paranthesis or sntax error shall be caught after running the executable(calculator)**
# Explanation of how the files work:

calc.l (Lexer):

Recognizes these patterns:

Numbers: One or more digits [0-9]+
Plus: "+"
Minus: "-"
Newline: \n
Whitespace: Ignored


For numbers, converts the text to integer using atoi()
Returns appropriate tokens to the parser


calc.y (Parser):

Defines tokens: NUMBER, PLUS, MINUS, NEWLINE
Grammar rules:

Can handle expressions like: "5 + 3 - 2"
Evaluates expressions left to right
Prints result after each newline
