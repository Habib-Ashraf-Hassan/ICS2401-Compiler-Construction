# Compiler Construction: Understanding Lex and Yacc Compilation

This guide explains the compilation process for Lex and Yacc files, breaking down each command and its purpose.
# Compile the files by:
```
yacc -d grammar.y
```
then 
```
lex grammar.l
```
then
```
gcc lex.yy.c y.tab.c -o counter
```

## Finally run the executable by:
```
./counter
```
## Example usage:
```
Enter a string (using only 'a' and 'b', end with newline):
aaab
Number of a's: 3

Enter a string (using only 'a' and 'b', end with newline):
aaaaab
Number of a's: 5
```
## Compilation Commands

### 1. Yacc Command: `yacc -d grammar.y`

**Purpose**: Processes the grammar file and generates a parser

**Outputs**:
- `y.tab.c`: The generated C source code for the parser
- `y.tab.h`: Header file containing token definitions

The `-d` flag tells yacc to create the header file.

**Why "y.tab"?**
- "y" comes from YACC (Yet Another Compiler Compiler)
- "tab" is historical, referring to parsing tables
- This naming is conventional and many systems expect these names

### 2. Lex Command: `lex grammar.l`

**Purpose**: Processes the lexical analyzer specification

**Output**:
- `lex.yy.c`: The generated C source code for the lexer

**Why we include `y.tab.h` in the lex file:**
- The lexer needs to know what token values to return
- `y.tab.h` contains #defines for tokens (A, B, NL)

Example content from y.tab.h:
```c
#define A 257    // Token value for 'a'
#define B 258    // Token value for 'b'
#define NL 259   // Token value for newline
```

### 3. GCC Command: `gcc lex.yy.c y.tab.c -o compiler`

**Purpose**: Compiles both generated C files into an executable

**Process Flow**:
```
Input → [lex.yy.c] → tokens → [y.tab.c] → parsing
```

## Visual Compilation Process

```
grammar.l ──[lex]──> lex.yy.c ─┐
                               ├──[gcc]──> executable
grammar.y ──[yacc]─> y.tab.c ──┘
              │
              └────> y.tab.h
```

## File Interactions

1. The parser (`y.tab.c`) calls `yylex()` to get tokens
2. The lexer (`lex.yy.c`) reads input and returns token values
3. Token values are defined in `y.tab.h`
4. The parser uses these tokens to follow grammar rules

# Explanation of grammar.l (Lex file):

The code between %{ and %} is copied directly to the generated C file
We include the Yacc-generated header file and declare the external counter
The rules section (between %%) defines token patterns:

- a returns token A
- b returns token B
- \n returns token NL (newline)
- Any other character is treated as invalid

yywrap() returns 1 to indicate end of input


## Explanation of grammar.y (Yacc file):

- Declares the counter variable count_a
- Defines tokens A, B, and NL
- Implements the grammar rules:

- start: S NL matches our input followed by newline
- S: A S | B implements the given grammar


Counts 'a's by incrementing count_a whenever an 'a' is processed

Main function provides a simple prompt and calls the parse

## Common Issues

If any component is missing:
- Without y.tab.h: Lexer won't know token values
- Without lex.yy.c: No input tokenization
- Without y.tab.c: No parser implementation
