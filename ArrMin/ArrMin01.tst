// Test file for ArrMin.asm: All Elements Same
load ArrMin.asm,
output-file ArrMin01.out,
compare-to ArrMin01.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2 RAM[2]%D2.6.2 RAM[20]%D2.6.2 RAM[21]%D2.6.2 RAM[22]%D2.6.2 RAM[23]%D2.6.2;

set PC 0,
// Set Rams and Arrs
set RAM[0]  0,
set RAM[1]  20,
set RAM[2]  4,
set RAM[20] 5,
set RAM[21] 5,
set RAM[22] 5,
set RAM[23] 5;
// repeat for 300 clock cycles
repeat 300 {
  ticktock;
}
// Restore args
set RAM[1] 20,
set RAM[2] 4,
output;
