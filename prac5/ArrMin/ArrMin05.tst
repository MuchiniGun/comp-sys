// Test file for ArrMin.asm: Negative Numbers
load ArrMin.asm,
output-file ArrMin05.out,
compare-to ArrMin05.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2 RAM[2]%D2.6.2 RAM[20]%D2.6.2 RAM[21]%D2.6.2 RAM[22]%D2.6.2 RAM[23]%D2.6.2;

set PC 0,
set RAM[0]  0,
set RAM[1]  20,
set RAM[2]  4,
set RAM[20] -1,
set RAM[21] -3,
set RAM[22] -2,
set RAM[23] 0;
repeat 300 {
  ticktock;
}
set RAM[1] 20,
set RAM[2] 4,
output;
