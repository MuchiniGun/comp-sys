// Sample Test file for AddSub.asm
// Follows the Test Scripting Language format described in 
// Appendix B of the book "The Elements of Computing Systems"

load AddSub.asm,
output-file AddSub00.out,
compare-to AddSub00.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2 RAM[2]%D2.6.2 RAM[3]%D2.6.2;

set PC 0,
// Set Rams
set RAM[0] 0,
set RAM[1] 6,  
set RAM[2] 2,  
set RAM[3] 1; 
// Run for 100 clock cycles 
repeat 100 {
  ticktock;    
}
// Restore arguments
set RAM[1] 6,  
set RAM[2] 2,
set RAM[3] 1,
output;        



