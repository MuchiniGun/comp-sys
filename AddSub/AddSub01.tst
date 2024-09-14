// Test Case 01
load AddSub.asm,
output-file AddSub01.out,
compare-to AddSub01.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2 RAM[2]%D2.6.2 RAM[3]%D2.6.2;

set PC 0,
// Set Rams
set RAM[0] 0,  
set RAM[1] 30, 
set RAM[2] 15,
set RAM[3] 5;
// Run for 100 clock cycles 
repeat 100 {
  ticktock;
}
output;
