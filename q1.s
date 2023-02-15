.pos 0x100

    # STATEMENT 1: r = s[1]
    ld $r, r0           # r0 = address of r
    ld $s, r1           # r1 = address of s
    ld $1, r2           # r2 = 1
    ld (r1, r2, 4), r3  # r3  = s[1]
    st r3, (r0)         # r = s[1]


    # STATEMENT 2: r = s[r]
    ld $r, r0           # r0 = address of r
    ld (r0), r3         # r3 = value of r
    ld $s, r1           # r1 = address of s
    ld (r1, r3, 4), r2  # r2 = s[r]
    st r2, (r0)         # r = s[r]


    # STATEMENT 3: x = &o
    ld $o, r0           # r0 = address of o
    ld $x, r1           # r1 = address of x
    st r0, (r1)         # x = &o


    # STATEMENT 4: *x = 8
    ld $8, r0           # r0 = 8
    ld $x, r1           # r1 = address of x
    ld (r1), r1         # r1 = address x is pointing to
    st r0, (r1)         # *x = 8


    # STATEMENT 5: x = &s[s[2]]
    ld $2, r0           # r0 = 2
    ld $x, r1           # r1 = address of x
    ld $s, r2           # r2 = address of s
    ld (r2, r0, 4), r3  # r3 = s[2]
    shl $2, r3          # r3 = s[2] * 4
    add r3, r2          # r2 = &s[s[2]]
    st r2, (r1)         # x = &s[s[2]]


    # STATEMENT 6: *x = *x + s[5]
    ld $5, r0           # r0 = 5
    ld $x, r1           # r1 = address of x
    ld (r1), r1         # r1 = address x is pointing to
    ld $s, r2           # r2 = address of s
    ld (r2, r0, 4), r3  # r3 = s[5]
    ld (r1), r4         # r4 = value of address x is pointing to
    add r4, r3          # r3 = s[5] + *x
    st r3, (r1)         # *x = *x + s[5]

    halt

.pos 0x2000

r:  .long 0x000000001   # r
o:  .long 0x000000002   # o
x:  .long 0x000000003   # x
s:  .long 0x000000004   # s[0]
    .long 0x000000005   # s[1]
    .long 0x000000006   # s[2]
    .long 0x000000007   # s[3]
    .long 0x000000008   # s[4]
    .long 0x000000009   # s[5]
    .long 0x00000000a   # s[6]
    .long 0x00000000b   # s[7]
    .long 0x00000000c   # s[8]
    .long 0x00000000d   # s[9]