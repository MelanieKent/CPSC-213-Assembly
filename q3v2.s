.pos 0x1000
code:
ld $i, r0		                      # r0 = address of i
ld $v0, r1		                      # r1 = address of v0
ld (r0), r2		                      # r2 = value of i
ld $s, r3		                      # r3 = address of s.x
ld (r3, r2, 4), r4	                  # r4 = s.x[i]
st r4, (r1)  		                  # v0 = s.x[i]

ld $i, r0		                      # r0 = address of i
ld $v1, r1		                      # r1 = address of v1
ld (r0), r2		                      # r2 = value of i
ld 0x8(r3), r5		                  # r5 = address of s.y[0]
ld (r5, r2, 4), r4	                  # r4 = s.y[i]
st r4, (r1)  		                  # v1 = s.y[i]

ld $i, r0		                      # r0 = address of i
ld $v2, r1		                      # r1 = address of v2
ld (r0), r2		                      # r2 = value of i
ld 0xc(r3), r5		                  # r5 = address of s.z->x[0]
ld (r5, r2, 4), r4	                  # r4 = s.z->x[i]
st r4, (r1)  		                  # v2 = s.z->x[i]

ld $i, r0	                          # r0 = address of i
ld $v3, r1	                          # r1 = address of v3
ld (r0), r2		                      # r2 = value of i
ld 0x18(r5), r3		                  # r3 = address of s.z->z->x[0]
ld (r3, r2, 4), r7	                  # r7 = s.z->z->y[i]
st r7, (r1)  		                  # v3 = s.z->z->y[i]
halt

.pos 0x2000
static:
i:	             .long 0                  
v0:              .long 0
v1: 	         .long 0
v2:              .long 0
v3:              .long 0
s:               .long 0              # x[0]
	             .long 0              # x[1]
	             .long s_y            # y
	             .long s_z            # z

.pos 0x3000
heap:
s_y:	         .long 1		      # s.y[0]
	             .long 2		      # s.y[1]
s_z:	         .long 3		      # s.z->x[0]
	             .long 4		      # s.z->x[1]
	             .long 5		      # s.z->y
	             .long s_z_z	      # s.z->z
s_z_z:	         .long 6		      # s.z->x[0]
	             .long 7		      # s.z->x[1]
	             .long s_z_z_y	      # s.z->y
s_z_z_y:         .long 8