// Test file for ArrMin.asm: Single Element
load ArrMin.asm,
output-file ArrMin03.out,
compare-to ArrMin03.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2 RAM[2]%D2.6.2 RAM[20]%D2.6.2;

set PC 0,
// Set Rams
set RAM[0]  0,
set RAM[1]  20, // R1 --> start of the array
set RAM[2]  1,  // R2 = 1 = arr len
set RAM[20] 5;  // go to single element located at RAM[20]
// Run the program for 300 clock cycles
repeat 300 {
  ticktock;    
}
// Restore args
set RAM[1] 20,  
set RAM[2] 1,
output;        
