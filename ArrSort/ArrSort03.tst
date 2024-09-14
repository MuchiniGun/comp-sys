// Test file for ArrSort.asm: Single Element
load ArrSort.asm,
output-file ArrSort03.out,
compare-to ArrSort03.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2 RAM[2]%D2.6.2 RAM[20]%D2.6.2;

set PC 0,
// Set Rams
set RAM[0]  0,
set RAM[1]  20,
set RAM[2]  1,
set RAM[20] 5;
// repeat for 600 clock counts
repeat 600 {
  ticktock;
}
set RAM[1] 20,
set RAM[2] 1,
output;
