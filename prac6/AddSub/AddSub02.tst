// Test case 2 for AddSub.vm

load AddSub.vm,
output-file AddSub02.out,
compare-to AddSub02.cmp,
output-list sp%D1.6.1 local%D1.6.1 argument%D1.8.1 this%D1.6.1 that%D1.6.1
            RAM[16]%D1.6.1 RAM[17]%D1.6.1 RAM[18]%D1.6.1
            local[0]%D1.8.1 local[1]%D1.8.1 local[2]%D1.8.1
            argument[0]%D1.11.1 argument[1]%D1.11.1 argument[2]%D1.11.1;

set sp 256,        // stack pointer
set local 300,     // local segment base address
set argument 400,  // argument segment base address
set this 3000,     // this segment base address
set that 3010,     // that segment base address

set RAM[16] 170,
set RAM[17] 2,
set RAM[18] 3,

set local[0] 150,
set local[1] 180,
set local[2] 5,

set argument[0] 100,
set argument[1] 200,
set argument[2] 300;

repeat 25 {
  vmstep;
}
output;
