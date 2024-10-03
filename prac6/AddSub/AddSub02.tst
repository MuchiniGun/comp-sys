// Test case 2 for AddSub.vm

load AddSub.vm,
output-file AddSub02.out,
compare-to AddSub02.cmp,
output-list sp%D1.6.1 local%D1.6.1 argument%D1.8.1 this%D1.6.1 that%D1.6.1
            RAM[16]%D1.6.1 RAM[17]%D1.6.1 RAM[18]%D1.6.1
            local[0]%D1.8.1 local[1]%D1.8.1 local[2]%D1.8.1
            argument[0]%D1.11.1 argument[1]%D1.11.1 argument[2]%D1.11.1;

set sp 256,        // stack pointer
set local 300,     // base address of the local segment
set argument 400,  // base address of the argument segment
set this 3000,     // base address of the this segment
set that 3010,     // base address of the that segment

set RAM[16] 3,  // static 0
set RAM[17] 1,  // static 1
set RAM[18] 2,  // static 2

set local[0] 5,  // local 0
set local[1] 8,  // local 1
set local[2] 10,  // local 2

set argument[0] 80,  // argument 0
set argument[1] 90,  // argument 1
set argument[2] 100;  // argument 2

repeat 25 {
  vmstep;
}
output;
