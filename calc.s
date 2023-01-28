.pos 0x100
                 ld   $0x2, r0            # r0 = 2
                 ld   $g, r1              # r1 = address of g
                 ld   $p, r2              # r2 = address of p
                 ld   $y, r3              # r3 = address of y
                 ld   $z, r4              # r4 = address of z
                 ld   (r1), r1            # r1 = g
                 add  r1, r0              # r0 = g + 2
                 ld   (r4, r0, 4), r0     # r0 = z[g + 2]
                 ld   (r4, r1, 4), r1     # r1 = z[g]
                 add  r1, r0              # r0 = z[g] + z[g + 2]
                 st   r0, (r3)            # y = z[g] + z[g + 2]
                 ld   $0xf, r5            # r5 = 0xf
                 and  r0, r5              # r5 = z[g] + z[g + 2] & 0xf
                 st   r5, (r2)            # p = z[g] + z[g + 2] & 0xf
                 halt                     # halt
.pos 0x1000
g:               .long 0x00000001         # g
.pos 0x2000
p:               .long 0xffffffff         # p
.pos 0x3000
y:               .long 0xffffffff         # y
.pos 0x4000
z:               .long 0xffffffff         # z[0]
                 .long 0x00000002         # z[1]
                 .long 0xffffffff         # z[2]
                 .long 0x00000003         # z[3]
                 .long 0xffffffff         # z[4]
                 .long 0xffffffff         # z[5]
                 .long 0xffffffff         # z[6]
                 .long 0xffffffff         # z[7]
                 .long 0xffffffff         # z[8]
                 .long 0xffffffff         # z[9]
