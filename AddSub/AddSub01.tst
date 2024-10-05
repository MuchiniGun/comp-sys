// Test case 1 for AddSub.vm
// Calculates x = (a + b) - x with different values for a, b, and x

load AddSub.vm,
output-file AddSub01.out,
compare-to AddSub01.cmp,
output-list sp%D1.6.1 local%D1.6.1 argument%D1.8.1 this%D1.6.1 that%D1.6.1
            RAM[16]%D1.6.1 RAM[17]%D1.6.1 RAM[18]%D1.6.1
            local[0]%D1.8.1 local[1]%D1.8.1 local[2]%D1.8.1
            argument[0]%D1.11.1 argument[1]%D1.11.1 argument[2]%D1.11.1;

set sp 256,        // stack pointer
set local 300,     // local segment base address
set argument 400,  // argument segment base address
set this 3000,     // this segment base address
set that 3010,     // that segment base address

set RAM[16] 5,  // static 0, x = 5
set RAM[17] 2,  // static 1
set RAM[18] 3,  // static 2

set local[0] 15,  // local 0, a = 15
set local[1] 25,  // local 1, b = 25
set local[2] 35,  // local 2

set argument[0] 105,  // argument 0
set argument[1] 205,  // argument 1
set argument[2] 305;  // argument 2

repeat 25 {
  vmstep;
}
output;
