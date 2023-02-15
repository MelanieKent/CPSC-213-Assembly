.pos 0x100

    # STATEMENT 1: a = 3
    ld $a, r0           # r0 = address of a
    ld $3, r1           # r1 = 3
    st r1, (r0)         # a = 3

    # STATEMENT 2: p = &a
    ld $a, r0           # r0 = address of a
    ld $p, r1           # r1 = address of p
    st r0, (r1)         # p = &a


    # STATEMENT 3: *p = *p - 1
    ld $p, r0           # r0 = address of p
    ld (r0), r1         # r1 = address p is pointing to
    ld (r1), r2         # r2 = value of the variable p is pointing to
    dec r2              # r2 = *p - 1
    st r2, (r1)         # *p = *p - 1


    # STATEMENT 4: p = &b[0]
    ld $p, r0           # r0 = address of p
    ld $b, r1           # r1 = address of b
    st r1, (r0)         # p = &b[0]


    # STATEMENT 5: p++
    ld $p, r0           # r0 = address of p
    ld (r0), r1         # r1 = address that p is pointing to
    inca r1             # r1 = address that p is pointing to + 4
    st r1, (r0)         # p++


    # STATEMENT 6: p[a] = b[a]
    ld $p, r0           # r0 = address of p
    ld $a, r1           # r1 = address of a
    ld (r1), r1         # r1 = value of a
    ld (r0), r4         # r4 = p[0]
    ld $b, r2           # r2 = address of b
    ld (r2, r1, 4), r3  # r3 = b[a]
    st r3, (r4, r1, 4)  # p[a] = b[a]


    # STATEMENT 7: *(p+3) = b[0]
    ld $p, r0           # r0 = address of p
    ld $b, r1           # r1 = address of b
    ld (r1), r1         # r1 = b[0]
    ld (r0), r2         # r2 = address p is pointing to
    ld $12, r3          # r3 = 3*4 = 12
    add r2, r3          # r3 = address p is pointing to + 12
    st r1, (r3)         # *(p+3) = b[0]

    halt

.pos 0x1000
a:              .long 0x00000001             # a
.pos 0x2000
p:              .long 0x00000002             # p
.pos 0x3000
b:              .long 0x00000003             # b[0]
                .long 0x00000004             # b[1]
                .long 0x00000005             # b[2]
                .long 0x00000006             # b[3]
                .long 0x00000007             # b[4]