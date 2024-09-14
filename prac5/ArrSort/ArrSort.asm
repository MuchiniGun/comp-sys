// Sorts the array of length R2 whose first element is at RAM[R1] in ascending order in place. Sets R0 to True (-1) when complete.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
// sorts an array in ascending order using a bubble sort algorithm.

// init outer loop counter
@i
M=0

(OUTTER)
@j
M=0

(INNER)
@R1
D=M       // Load start address of array
@j
A=M+D    // Point to current element
D=A       // Store address of current element for swapping
@x
M=D      // x --> address of the current element
@y
M=D+1    // y --> address of the next element

@x
A=M
D=M
@NEGX
D;JLT 
@POSX
D;JGT 

(COMPARE)
@x
A=M
D=M      // Load value at address x
@y
A=M
D=D-M    // Subtract value at address y from x
@SWAP
D;JGT    

(CHECK)
@i
D=M
@R2
D=D+1
D=M-D
@j
M=M+1
D=D-M
@INNER
D;JGT    

@i
M=M+1
D=M
@R2
D=M-D
D=D-1
@OUTTER
D;JGT    

// Set R0 to -1 to exit the program
(END)
@R0
M=-1
@END
0;JMP

// Swap the elements pointed to by x and y
(SWAP)
@x
A=M
D=M
@R4
M=D      

@y
A=M
D=M
@x
A=M
M=D      

@R4
D=M
@y
A=M
M=D      

@CHECK
0;JMP

(NEGX)
@y
A=M
D=M
@CHECK
D;JGT   
@COMPARE
0;JMP

(POSX)
@y
A=M
D=M
@SWAP
D;JLT   
@COMPARE
0;JMP
