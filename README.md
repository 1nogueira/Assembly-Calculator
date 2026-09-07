# assembly calculator

a simple calculator made in x86-64 assembly using nasm.

it supports:

- addition
- subtraction
- multiplication
- division

## requirements

You need:

- nasm
- gcc / mingw
- windows 64-bit

make sure both commands work in CMD:

```bash
nasm --version
gcc --version
```

## how to use

clone the repository or download the files.

open cmd inside the project folder and compile the assembly file:

```bash
nasm -f win64 calculadora.asm -o calculadora.o
```

then link it with gcc:

gcc calculadora.o -o calculadora.exe

run:

calculadora.exe

the program will ask for two numbers and the operation.

example:

assembly calculator
type the first number: 10
type the second number: 5
type the operation (+, -, *, /): *
result: 50

# supported operations:

+ addition
- subtraction
* multiplication
/ division

division uses integers, so:

10 / 3

returns:

3

# the next one will be in brainfuck

