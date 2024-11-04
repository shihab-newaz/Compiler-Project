# Custom Programming Language

A custom programming language implementation using Flex and Bison, featuring basic programming constructs with unique syntax.

## Table of Contents
- [Features](#features)
- [Syntax Overview](#syntax-overview)
- [Data Types](#data-types)
- [Control Structures](#control-structures)
- [Operators](#operators)
- [Mathematical Functions](#mathematical-functions)
- [Building and Running](#building-and-running)
- [Examples](#examples)

## Features

- Custom syntax with readable keywords
- Support for basic arithmetic and logical operations
- Control structures (if-else, loops, switch)
- Mathematical functions (sin, cos, tan, log, etc.)
- Variable declarations and assignments
- Basic I/O operations

## Syntax Overview

### General Rules
- Lines end with `$` (equivalent to semicolon in other languages)
- Code blocks are enclosed in `{ }`
- Parameters are enclosed in `( )`
- Header files are included using `@comprise header.h`

### Keywords vs Traditional Syntax

| Traditional | Custom Language |
|------------|----------------|
| if         | in_case        |
| else       | else           |
| elif       | elif           |
| switch     | shift_to       |
| case       | case           |
| default    | if_failure     |
| while      | when           |
| for        | as_long_as     |
| break      | end            |
| return     | put_back       |
| print      | write         |
| scan       | read          |

## Data Types

- `integer`: Integer type
- `float`: Floating-point type
- `character`: Character type

## Control Structures

### If-Elif-Else
```
in_case (condition) {
    // code
}
elif (condition) {
    // code
}
else {
    // code
}
```

### Switch
```
shift_to (expression) {
    case value1:
        // code
        end$
    case value2:
        // code
        end$
    if_failure:
        // code
}
```

### Loops
```
when (condition) {
    // code
}

as_long_as (init; condition; increment) {
    // code
}
```

## Operators

### Arithmetic Operators
- `add`: Addition
- `sub`: Subtraction
- `mul`: Multiplication
- `div`: Division
- `mod`: Modulus
- `add_one`: Increment
- `sub_one`: Decrement

### Assignment
- `:=`: Assignment operator

### Comparison Operators
- `<=`: Less than or equal
- `>=`: Greater than or equal
- `<`: Less than
- `>`: Greater than
- `==`: Equal to
- `!=`: Not equal to

### Bitwise Operators
- `bit_and`: Bitwise AND
- `bit_or`: Bitwise OR
- `bit_not`: Bitwise NOT

## Mathematical Functions

The language supports various mathematical functions:
- `sin`: Sine function
- `cos`: Cosine function
- `tan`: Tangent function
- `log`: Logarithm (base 10)
- `ln`: Natural logarithm
- `sqrt`: Square root
- `^`: Power operation

## Building and Running

1. Make sure you have Flex and Bison installed on your system
2. Generate the lexer and parser:
   ```bash
   flex lexer.l
   bison -d parser.y
   ```
3. Compile the generated files:
   ```bash
   gcc lex.yy.c parser.tab.c -o compiler
   ```
4. Run the compiler:
   ```bash
   ./compiler
   ```

## Examples

### Variable Declaration and Assignment
```
integer x, y$
x := 10$
y := 20$
```

### Basic Arithmetic
```
write < 'Result: ' > $
z := x add y$
```

### If-Else Statement
```
in_case (x greater y) {
    write < 'x is greater' > $
}
else {
    write < 'y is greater' > $
}
```

### Loop Example
```
as_long_as (i := 0; i <= 10; i := i add 1) {
    write < i > $
}
```

### Mathematical Operations
```
integer angle$
angle := 45$
write < 'Sin value: ' > $
write < sin angle > $
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
