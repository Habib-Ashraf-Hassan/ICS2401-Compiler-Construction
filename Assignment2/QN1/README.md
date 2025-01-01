## Explanation
### Grammar Rules:
The program implements this grammar:
```
expr   → term (('+') term)*
term   → factor (('*') factor)*
factor → digit | '(' expr ')'
```

### Recursive Descent Functions:
- **`expr`**: Parses expressions involving addition (`+`).
- **`term`**: Parses terms involving multiplication (`*`).
- **`factor`**: Parses individual numbers or sub-expressions enclosed in parentheses.

### Error Handling:
- The `error` function is called for invalid syntax or unexpected characters.
- Checks for invalid syntax include:
  - Unknown charactersInput:
  - Missing operators
  - Unmatched parentheses

### Global Lookahead Character:
- The `lookahead` variable stores the current character being parsed.
- The `nextChar` function advances the input to the next character.

### Input Parsing:
- Numbers are converted from characters to integers using `lookahead - '0'`.
- Parentheses are handled by recursively calling `expr` inside the `factor` function.

### Final Check:
- After parsing, the program ensures no unexpected characters remain in the input.

## Example Usage
### Compile the program:
```
gcc calculator.c -o calculator
```
### Run the program:
```
./calculator
```
### Input:
```
3+5*2
```
Result: 13

### An erronous input like:
```
3+5#2
```
Should result in an ERROR: Unexptected character

