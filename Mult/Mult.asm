// This file is based on part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: Mult.asm

// Multiplies R1 and R2 and stores the result in R0.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively
// Multiplies two non-negative integers stored in R1 and R2.
// Outputs the result into R0.

(START)
@R0
M=0            
@R3
M=0            

// Checks if R1 is negative
@R1
D=M
@labelTrueR1
D;JLT          

(secondInteger)

// Checks if R2 is negative
@R2
D=M
@labelTrueR2
D;JLT          
@LOOP
0;JMP          

(labelTrueR1)
@R1
M=M-1          
M=!M           // negating R1 with two's complement
@R3
M=M+1          
@secondInteger
0;JMP          

(labelTrueR2)
@R2
M=M-1          
M=!M           // negating R2
@R3
M=M-1          
@LOOP
0;JMP          

// Multiplication loop
(LOOP)
@R1
D=M
@CHECK
D;JLE          
@R2
D=M
@R0
M=M+D          // find product for R0
@R1
M=M-1          
@LOOP
0;JMP          

(CHECK)
@R3
D=M
@labelTrueR3
D;JNE          
@END
0;JMP          

(labelTrueR3)
@R0
M=M-1          
M=!M           // Negating result to get correct signage
@END
0;JMP          

(END)
@END
0;JMP          
