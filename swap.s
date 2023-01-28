.pos 0x100
                 ld   $first, r0          # r0 = address of first
                 ld   $array, r1          # r1 = address of array
                 ld   $8, r2              # r2 = 8
                 ld   $4, r3              # r3 = 4
                 ld   (r1, r2, 4), r4     # r4 = array[8] 
                 ld   (r1, r3, 4), r5     # r5 = array[4] 
                 st   r4, (r0)            # first = array[8]
                 st   r5, (r1, r2, 4)     # array[8] = array[4]
                 ld   (r0), r0            # r0 = first
                 st   r0, (r1, r3, 4)     # array[4] = first   
                 halt                     # halt
.pos 0x1000
first:           .long 0x00000001         # first
.pos 0x2000
array:           .long 0xffffffff         # array[0]
                 .long 0xffffffff         # array[1]
                 .long 0xffffffff         # array[2]
                 .long 0xffffffff         # array[3]
                 .long 0x00000004         # array[4]
                 .long 0xffffffff         # array[5]
                 .long 0xffffffff         # array[6]
                 .long 0xffffffff         # array[7]
                 .long 0x00000008         # array[8]
                 .long 0xffffffff         # array[9]