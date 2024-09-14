// Test file for ArrSort.asm: Reverse Order
load ArrSort.asm,
output-file ArrSort04.out,
compare-to ArrSort04.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2 RAM[2]%D2.6.2 RAM[20]%D2.6.2 RAM[21]%D2.6.2;

set PC 0,
// set rams
set RAM[0]  0,
set RAM[1]  20,
set RAM[2]  2,
set RAM[20] 9,
set RAM[21] 3;
// repeat for 600 clock counts
repeat 600 {
  ticktock;
}
set RAM[1] 20,
set RAM[2] 2,
output;
