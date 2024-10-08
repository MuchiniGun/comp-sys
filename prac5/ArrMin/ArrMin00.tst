// Sample Test file for ArrMin.asm
// Follows the Test Scripting Language format described in 
// Appendix B of the book "The Elements of Computing Systems"

load ArrMin.asm,
output-file ArrMin00.out,
compare-to ArrMin00.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2 RAM[2]%D2.6.2 RAM[20]%D2.6.2 RAM[21]%D2.6.2 RAM[22]%D2.6.2 RAM[23]%D2.6.2;

set PC 0,
// Set Rams and Arrs
set RAM[0]  0,  
set RAM[1]  20, 
set RAM[2]  4,  
set RAM[20] 2,  
set RAM[21] 1,  
set RAM[22] 4,  
set RAM[23] 3;  
// repeat for 300 clock cycles
repeat 300 {
  ticktock;
}
set RAM[1] 20,  // Restore args
set RAM[2] 4,
output;        

