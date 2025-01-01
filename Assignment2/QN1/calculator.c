#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

// Function declarations for mutual recursion
int expr(); // Parses addition expressions
int term(); // Parses multiplication terms
int factor(); // Parses individual numbers

// Global variable for the current character
char lookahead;

// Function to consume the current character and move to the next
void nextChar() {
    lookahead = getchar();
}

// Error handling for invalid syn'('tax
void error(const char *message) {
    printf("Error: %s\n", message);
    exit(EXIT_FAILURE);
}

// Ensure the current character matches an expected one
void match(char expected) {
    if (lookahead == expected) {
        nextChar();
    } else {
        error("Unexpected character");
    }
}

// Recursive Descent Parsing Functions
int expr() {
    int result = term(); // Parse the first term
    while (lookahead == '+') { // Handle addition
        match('+');
        result += term();
    }
    return result;
}

int term() {
    int result = factor(); // Parse the first factor
    while (lookahead == '*') { // Handle multiplication
        match('*');
        result *= factor();
    }
    return result;
}

int factor() {
    int result = 0;
    if (isdigit(lookahead)) { // If the character is a digit
        result = lookahead - '0'; // Convert char to integer
        match(lookahead); // Consume the digit
    } else if (lookahead == '(') { // Handle parenthesized expressions
        match('(');
        result = expr();
        match(')');
    } else {
        error("Invalid syntax !!!");
    }
    return result;
}

// Main function
int main() {
    printf("Enter an expression: ");
    nextChar(); // Initialize the lookahead character
    int result = expr(); // Start parsing the expression

    if (lookahead == '\n' || lookahead == EOF) { // Ensure no extra characters are left
        printf("Result: %d\n", result);
    } else {
        error("Unexpected characters at the input");
    }

    return 0;
}
