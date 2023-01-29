# cpsc_213_assembly
Short segments of SM213 assembly code for CPSC 213.

Swap assembly code in C: 

int first;  
int array[10];  
void swap() {  
    first = array[8];  
    array[8] = array[4];  
    array[4] = first;  
}  

Math assembly code in C:  

int q, m;  
void math() {  
    q = ((((m + 1) + 4) << 2) & m) / 16;  
}  

Calc assembly code in C:  

int z[7];  
int g, p, y;  
void calc() {  
    y = z[g] + z[g + 2];  
    p = y & 0xf;  
}  
