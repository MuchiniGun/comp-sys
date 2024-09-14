// Test Case 02 file for AddSub.asm
load AddSub.asm,
output-file AddSub02.out,
compare-to AddSub02.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2 RAM[2]%D2.6.2 RAM[3]%D2.6.2;

set PC 0,
// Set Rams
set RAM[0] 0,  
set RAM[1] 0,  
set RAM[2] -20,
set RAM[3] -30;
// 100 Clock Cycles
repeat 100 {
  ticktock;
}
// Output
output;
