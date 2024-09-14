// Test file for ArrMin.asm: Random Order
load ArrMin.asm,
output-file ArrMin04.out,
compare-to ArrMin04.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2 RAM[2]%D2.6.2 RAM[20]%D2.6.2 RAM[21]%D2.6.2 RAM[22]%D2.6.2 RAM[23]%D2.6.2;

set PC 0,
// Set Rams and Arrs
set RAM[0]  0,
set RAM[1]  20,
set RAM[2]  4,
set RAM[20] 10,
set RAM[21] 3,
set RAM[22] 7,
set RAM[23] 2;
// repeat for 300 clock cycles
repeat 300 {
  ticktock;
}
// reset
set RAM[1] 20,
set RAM[2] 4,
output;
