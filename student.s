.pos 0x1000
#load initial values into registers

ld $n, r0               #r0 = address of n
ld (r0), r0             #r0 = n' 
ld $s, r1               #r1 = address of s
ld (r1), r1             #r1 = s' (address that s points to)

#iterate through the list of students, calculate their grade average and store each in the average variable

loop: beq r0, end       #if n' == 0, branch to end

inca r1                 #s' = address of the n'th student's grade[0]
ld (r1), r2             #r2 = grade[0]
inca r1                 #s' = address of the n'th student's grade[1]
ld (r1), r3             #r3 = grade[1]
inca r1                 #s' = address of the n'th student's grade[2]
ld (r1), r4             #r4 = grade[2] 
inca r1                 #s' = address of the n'th student's grade[3]
ld (r1), r5             #r5 = grade[3] 

add r2, r3              #r3 = grade[0] + grade[1]   
add r3, r4              #r4 = grade[0] + grade[1] + grade[2]
add r4, r5              #r5 = grade[0] + grade[1] + grade[2] + grade[3]

shr $2, r5              #r5 = (grade[0] + grade[1] + grade[2] + grade[3])/4

inca r1                 #s' = address of the n'th student's average
st r5, (r1)             #average = (grade[0] + grade[1] + grade[2] + grade[3])/4

inca r1                 #s' = address of the next student struct in the array
dec r0                  #n'--
br loop                 #return to loop      

end: 


#load initial values into registers

ld $n, r0               #r0 = address of n
ld (r0), r0             #r0 = n' 
ld $s, r1               #r1 = address of s
ld (r1), r1             #r1 = s' (address that s points to)

#if n == 1, skip to store

dec r0                  #n'--
beq r0, store           #if n' == 0, jump to store

#sort array of student structs from smallest to largest average

                        #r0 = n' - 1 = i'                                   #beginning of outer loop                                                           
L0: ld $1, r2           #r2 = j'
bgt r0, L1              #if i' > 0, branch to L1
br store                #else branch to store
                                                                            #beginning of inner loop
L1: mov r0, r3          #r3 = copy of i'
not r3                  #r3 = not i'
inc r3                  #r3 = -i'
add r2, r3              #r3 = j' - i'
bgt r3, L2              #if (j' - i' > 0), branch to L2, else continue to body of inner loop
                                                                            #setup of condition of if statement
mov r2, r4              #r4 = copy of j'
mov r2, r5              #r5 = copy of j'
shl $4, r4              #r4 = j' * 16
shl $3, r5              #r5 = j' * 8
add r5, r4              #r4 = j' * 24

ld $20, r6              #r6 = 20 (offset to average within student struct)           
mov r1, r7              #r7 = copy of s'
add r6, r7              #r7 = s' + 20                         

add r7, r4              #r4 = s' + 20 + (j' * 24) = address of s[j].average
ld $-24, r5             #r5 = -24
add r4, r5              #r5 = s' + 20 + (j' * 24) - 24 = address of s[j-1].average
ld (r4), r6             #r6 = s[j].average
ld (r5), r7             #r7 = s[j-1].average

not r6                  #r6 = not s[j].average
inc r6                  #r6 = -s[j].average
add r7, r6              #r6 = s[j-1].average - s[j].average

bgt r6, L4              #if s[j-1].average - s[j].average > 0, branch to L4 (body of if statement)
br L3                   #else branch to L3
                                                                            #body of if statement
L4: ld (r4), r6         #r6 = s[j].average
st r6, (r5)             #s[j-1].average = s[j].average
st r7, (r4)             #s[j].average = s[j-1].average

deca r4                 #r4 = address of s[j].grade[3]     
deca r5                 #r5 = address of s[j-1].grade[3]
ld (r4), r6             #r6 = s[j].grade[3]  
ld (r5), r7             #r7 = s[j-1].grade[3]
st r6, (r5)             #s[j-1].grade[3] = s[j].grade[3]
st r7, (r4)             #s[j].grade[3] = s[j-1].grade[3]

deca r4                 #r4 = address of s[j].grade[2]     
deca r5                 #r5 = address of s[j-1].grade[2]
ld (r4), r6             #r6 = s[j].grade[2]  
ld (r5), r7             #r7 = s[j-1].grade[2]
st r6, (r5)             #s[j-1].grade[2] = s[j].grade[2]
st r7, (r4)             #s[j].grade[2] = s[j-1].grade[2]

deca r4                 #r4 = address of s[j].grade[1]     
deca r5                 #r5 = address of s[j-1].grade[1]
ld (r4), r6             #r6 = s[j].grade[1]  
ld (r5), r7             #r7 = s[j-1].grade[1]
st r6, (r5)             #s[j-1].grade[1] = s[j].grade[1]
st r7, (r4)             #s[j].grade[1] = s[j-1].grade[1]

deca r4                 #r4 = address of s[j].grade[0]     
deca r5                 #r5 = address of s[j-1].grade[0]
ld (r4), r6             #r6 = s[j].grade[0]  
ld (r5), r7             #r7 = s[j-1].grade[0]
st r6, (r5)             #s[j-1].grade[0] = s[j].grade[0]
st r7, (r4)             #s[j].grade[0] = s[j-1].grade[0]

deca r4                 #r4 = address of s[j].sid  
deca r5                 #r5 = address of s[j-1].sid
ld (r4), r6             #r6 = s[j].sid  
ld (r5), r7             #r7 = s[j-1].sid
st r6, (r5)             #s[j-1].sid = s[j].sid
st r7, (r4)             #s[j].sid = s[j-1].sid
                                                                            #end of if statement                                                                         
L3: inc r2              #j'++
br L1                   #return to L1 (beginning of inner loop)             #end of inner loop

L2: dec r0              #i'--
br L0                   #return to L0 (beginning of outer loop)             #end of outer loop

store: 


#load initial values into registers

ld $n, r0               #r0 = address of n
ld (r0), r0             #r0 = n
ld $m, r1               #r1 = address of m
ld $s, r2               #r2 = address of s
ld (r2), r2             #r2 = s (address that s points to)

#store median student's id in m

shr $1, r0              #r0 = floor (n / 2) = median value of n

mov r0, r3              #r3 = median value of n
shl $4, r0              #r0 = median value of n * 16
shl $3, r3              #r3 = median value of n * 8
add r0, r3              #r3 = median value of n * 24

add r2, r3              #r3 = s + median value of n * 24
ld (r3), r3             #r3 = median student's id

st r3, (r1)             #m = median student's id

halt

.pos 0x200
n:      .long 3
m:      .long 0
s:      .long base

.pos 0x3000
base:   .long 1234
        .long 80
        .long 60
        .long 78
        .long 90
        .long 0         #77
s1:     .long 2345
        .long 80
        .long 68
        .long 21
        .long 14
        .long 0         #45.75
s2:     .long 3456
        .long 41
        .long 78
        .long 60
        .long 40
        .long 0         #54.75
        