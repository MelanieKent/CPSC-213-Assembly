.pos 0x100
                 ld   $0x5, r0              # r0 = 5
                 ld   $0x10, r1             # r1 = 16
                 ld   $q, r2                # r2 = address of q
                 ld   $m, r3                # r3 = address of m
                 ld   (r3), r3              # r3 = m
                 add  r3, r0                # r0 = m + 5 (36)
                 shl  $2, r0                # r0 = (m + 5) << 2 bits (144)
                 and  r3, r0                # r0 = ((m + 5) << 2) & m (16)
                 shr  $4, r0                # r0 = (((m + 5) << 2) & m) >> 4 bits (to divide by 16)
                 st   r0, (r2)              # q = (((m + 5) << 2) & m) >> 4
                 halt                       # halt
.pos 0x1000
q:               .long 0x00000001         # q
.pos 0x2000
m:               .long 0x0000001f         # m