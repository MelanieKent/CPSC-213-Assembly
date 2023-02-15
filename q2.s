.pos 0x100
                 ld $tmp, r0              # r0 = address of tmp
                 ld $tos, r1              # r1 = address of tos
                 ld $a, r2                # r2 = address of a
                 ld $s, r3                # r3 = address of s
                 ld $0, r4                # r4 = 0
                 ld $1, r5                # r5 = 1
                 ld $2, r6                # r6 = 2

                 st r4, (r0)              # tmp = 0
                 st r4, (r1)              # tos = 0
                 ld (r2, r4, 4), r7       # r7 = a[0]
                 st r7, (r3)              # s[tos] = s[0] = a[0]

                 ld (r1), r7              # r7 = value of tos
                 inc r7                   # r7 = value of tos+1
                 st r7, (r1)              # tos++
                 ld (r2, r5, 4), r7       # r7 = a[1]
                 st r7, (r3, r5, 4)       # s[tos] = a[1]

                 ld (r1), r7              # r7 = value of tos
                 inc r7                   # r7 = value of tos+1
                 st r7, (r1)              # tos++
                 ld (r2, r6, 4), r7       # r7 = a[2]
                 st r7, (r3, r6, 4)       # s[tos]  = a[2]

                 ld (r1), r7              # r7 = value of tos
                 inc r7                   # r7 = value of tos+1
                 st r7, (r1)              # tos++
                 ld (r1), r7              # r7 = value of tos
                 dec r7                   # r7 = value of tos-1
                 st r7, (r1)              # tos--

                 ld (r3, r6, 4), r7       # r7 = s[tos] = s[2]
                 st r7, (r0)              # tmp = s[tos]

                 ld (r1), r7              # r7 = value of tos
                 dec r7                   # r7 = value of tos-1
                 st r7, (r1)              # tos--
                 ld (r3, r5, 4), r7       # r7 = s[tos] = s[1]
                 ld (r0), r6              # r6 = value of tmp
                 add r6, r7               # r7 = tmp + s[tos]
                 st r7, (r0)              # tmp = tmp + s[tos]

                 ld (r1), r7              # r7 = value of tos
                 dec r7                   # r7 = value of tos-1
                 st r7, (r1)              # tos--
                 ld (r3, r4, 4), r7       # r7 = s[tos] = s[0]
                 ld (r0), r6              # r6 = value of temp
                 add r6, r7               # tmp + s[tos]
                 st r7, (r0)              # tmp = tmp + s[tos]

                 halt                     # halt
.pos 0x1000
tos:             .long 0xffffffff         # tos
.pos 0x2000
tmp:             .long 0xffffffff         # tmp
.pos 0x3000
a:               .long 0x00000001         # a[0]
                 .long 0x00000002         # a[1]
                 .long 0x00000003         # a[2]
                 
.pos 0x4000
s:               .long 0x00000004         # s[0]
                 .long 0x00000005         # s[1]
                 .long 0x00000006         # s[2]
                 .long 0x00000007         # s[3]
                 .long 0x00000008         # s[4]

