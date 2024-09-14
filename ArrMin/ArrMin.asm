// Finds the smallest element in the array of length R2 whose first element is at RAM[R1] and stores the result in R0.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Int values
@R1
D=M
@R2
D=D+M
@arrayend
M=D

@R1
A=M
D=M
@R0
M=D

@R1
M=M+1

(LOOP)
@R1
A=M
D=M

@OVERFLOWPOS
D;JLT
@OVERFLOWNEG
D;JGT

(COMPARERETURN)

@R1
A=M
D=M

@R0
D=D-M

@SWITCH
D;JLT

(RETURN)

@R1
M=M+1
D=M

@arrayend
D=M-D

@LOOP
D;JGT

@END
0;JMP

(SWITCH)
@R1
A=M
D=M
@R0
M=D
@RETURN
0;JMP

(OVERFLOWPOS)
@R0
D=M
@COMPARERETURN
D;JLT
@SWITCH
0;JEQ

(OVERFLOWNEG)
@R0
D=M
@COMPARERETURN
D;JGT
@RETURN
0;JEQ

(END)
@END
0;JMP