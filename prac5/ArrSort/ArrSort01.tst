// Test file for ArrSort.asm: Descending Order Array
load ArrSort.asm,
output-file ArrSort01.out,
compare-to ArrSort01.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2 RAM[2]%D2.6.2 RAM[20]%D2.6.2 RAM[21]%D2.6.2 RAM[22]%D2.6.2 RAM[23]%D2.6.2;

set PC 0,
// Set Rams
set RAM[0]  0,
set RAM[1]  20,
set RAM[2]  4,
set RAM[20] 4,
set RAM[21] 3,
set RAM[22] 2,
set RAM[23] 1;
// repaet for 600 clock counts
repeat 600 {
  ticktock;
}
set RAM[1] 20,
set RAM[2] 4,
output;
