// Test file for Abs.asm: Test Case 01 (Positive Number)
load Abs.asm,
output-file Abs01.out,
compare-to Abs01.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2;

set PC 0,
set RAM[0] 11,  // Reset R0
set RAM[1] 11; // Set R1 to 11
repeat 100 {
  ticktock;    // Run for 100 clock cycles
}
set RAM[1] 11, // Restore args
output;        // Output to file
