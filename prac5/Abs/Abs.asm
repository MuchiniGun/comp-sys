// Calculates the absolute value of R1 and stores the result in R0.
// (R0, R1 refer to RAM[0], and RAM[1], respectively.)

// Put your code here.
@R1
D=M

@OUTPUT
D;JGE 

@R1
D=-D
(OUTPUT)

@R0
M=D