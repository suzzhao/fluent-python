// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
// loop count: 24575-16384 + 1 = 8192
// @8192
// D = A
// @R0
// M = D   // save loop count in R0

(LOOP)
    @8192
    D = A
    @R0
    M = D   // save loop count in R0
    @KBD
    D = M
    @SETBLACK
    D;JGT
    @SETWHITE
    D;JEQ

(SETBLACK)
    @R1
    M = -1
    @FILL
    0;JMP

(SETWHITE)
    @R1
    M = 0
    @FILL
    0;JMP

(FILL)
    @R0
    MD = M - 1
    @LOOP
    D;JLT
    @SCREEN
    D = D + A
    @R2
    M = D
    @R1
    D = M
    @R2
    A = M
    M = D
    
    @FILL
    0;JMP


