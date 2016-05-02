// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
@i
M=0 		//reset iterations counter to zero
@res
M=0 		//reset buffer to zero

@R0
D=M
@a
M=D 		//a=R0
@R1
D=M
@b
M=D  		//b=R1

// check if a or b equals zero
@b
D=M
@ZERO
D;JEQ
@a
D=M
@ZERO
D;JEQ

// a-cond (if "a" is negative)
@a
D=M
@COND1CHECK
D;JLT
@LOOP
D;JGT

// a&b condition (go to the branch if both are negative)
(COND1CHECK)
@b
D=M
@COND1BEGIN
D;JLT
@COND2
D;JGT


// this is executed if b<0
(LOOP)
@i
D=M
@a
D=D-M
@i
M=M+1		// i++
@END
D;JGE		// if i>=a, goto END

@R2
M=0 		// reset R2 to zero 
			// (in case it hasn't been empty)
@b
D=M
@res
M=M+D
D=M 
@R2
M=D 		// R2=b+b
@LOOP
0;JMP

(COND1BEGIN)
@rev
D=M
@a
M=D-M 		//set -a to a
@COND1
0;JMP

(COND1)
@i
D=M
@a
D=D-M
@i
M=M+1		// i++
@END
D;JGE		// if i>=a, goto END

@R2
M=0 		// reset R2 to zero 
			// (in case it hasn't been empty)
@b
D=M
@res
M=M+D
D=M 
@R2
M=D 		//R2=(-b)+(-b)



@rev
D=M
@R2
M=D-M 		//R2=0-(-b)
@COND1
0;JMP


(COND2)
@i
D=M
@b
D=D-M
@i
M=M+1		// i++
@END
D;JGE		// if i>=b, goto END

@R2
M=0 		// reset R2 to zero 
			// (in case it hasn't been empty)
@a
D=M
@res
M=M+D
D=M 
@R2
M=D 		// R2=a+a
@COND2
0;JMP

(ZERO)
@R2
M=0

(END)
@END
0;JMP