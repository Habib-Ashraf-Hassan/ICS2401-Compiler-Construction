# abc to ABC replacer
This project consists of a lexical analyzer written in LEX to replace occurences of the string "abc" to "ABC"
## Files Included

- `abc_replacer.l`: The LEX source file for replacing the occurences of the string "abc" to "ABC"
- `input.txt`: A sample text file containing sentences with to test our lexical analyzer.

## Requirements

- **Flex**: A tool for generating scanners (lexical analyzers) from LEX specifications.
- **GCC**: A C compiler to compile the generated code.

## Installation

1. Ensure that you have **Flex** and **GCC** installed on your system. You can install them using your package manager:

   - For Ubuntu/Debian:
     ```bash
     sudo apt-get install flex gcc
     ```

   - For macOS (using Homebrew):
     ```bash
     brew install flex
     ```

  ## How to Run the Verb Recognizer

2. **Compile the LEX file**:

   First, navigate to the directory containing the `verbs_recognizer.l` file. Then, run the following command to generate the C code from the LEX file:
  ### Lexical analysis
   ```bash
   lex abc_replacer.l
   ```

  ### compile
   ```bash
   gcc lex.yy.c -o abc_replacer
   ```

  ### see the ouput with 
  ```bash
  ./abc_replacer < input.txt > output.txt
```


OR with any txt file you have which you wish to recognize verbs in it, replace **_filename.txt_** with actual txt file you have
```bash
  ./abc_replacer < filename.txt > output.txt
```

And get to see the results in the txt file: **output.txt**
   




