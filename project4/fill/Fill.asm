// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.
(START)
// addr = SCREEN
@SCREEN
D=A
@addr
M=D
// Listen to the keyboard
@KBD
D=M
@WHITEN
D;JEQ

(BLACKEN)
// n = 8192 - number of screen mapped registers
@8191
D=A
@n
M=D

// if i>n goto NULLER (null the counter)
@i
D=M
@n
D=D-M
@NULLER
D;JGT

//store value to addressed memory register
@addr
A=M
M=-1 		// blackening the screen

@addr
M=M+1

@i
M=M+1

@BLACKEN
0;JMP

(WHITEN)
// n = 8192 - number of screen mapped registers
@8191
D=A
@n
M=D

// if i>n goto NULLER (null the counter)
@i
D=M
@n
D=D-M
@NULLER
D;JGT

//store value to addressed memory register
@addr
A=M
M=0 		// whitening the screen

@addr
M=M+1

@i
M=M+1

@WHITEN
0;JMP

(NULLER)
@nuller
D=M
@i
M=D
@START
0;JMP