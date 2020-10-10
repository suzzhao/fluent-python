// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// R0>=0, R1>=0, and R0*R1<32768   
// Your program need not test these conditions, but rather assume that they hold

// Put your code here.
// R0 * R1 是 R1 个 R0 相加 或者是 R0 个 R1 相加
    @R2
    M = 0   // clear R2

// 判断是否小于0 
    @R0
    D = M
    @END
    M;JLT

(LOOP)
    @R1
    D = M   
    @END
    D;JEQ
    @R1
    M = M - 1

    @R0
    D = M

    @R2
    M = M + D

    @LOOP
    0;JMP
(END)

    @END
    0;JMP  // Infinite loop
