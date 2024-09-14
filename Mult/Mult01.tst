// Test case for multiplying a positive number by zero
load Mult.asm,
output-file Mult01.out,
compare-to Mult01.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2 RAM[2]%D2.6.2;

set PC 0,
// set Rams
set RAM[0] 0,  
set RAM[1] 5,  
set RAM[2] 0; 
// Run for 200 clock cycles 
repeat 200 {
  ticktock;    
}
set RAM[1] 5,  
set RAM[2] 0,  
output;        
