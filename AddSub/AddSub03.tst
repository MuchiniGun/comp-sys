// Test file for AddSub.asm: Test Case 03
load AddSub.asm,
output-file AddSub03.out,
compare-to AddSub03.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2 RAM[2]%D2.6.2 RAM[3]%D2.6.2;

set PC 0,
// Set Rams
set RAM[0] 0,
set RAM[1] 25,
set RAM[2] 75,
set RAM[3] 50;
// reapeat for 100 clock cycles
repeat 100 {
  ticktock;
}
output;
