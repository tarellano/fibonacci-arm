;*----------------------------------------------------------------------------
;* Name:    	fibonacci
;* Purpose: 	fib calculator
;* Author:      thomas arellano 
;*----------------------------------------------------------------------------
;*----------------------------------------------------------------------------
;* This is where you put the program code (instructions).
;* This section is a read-only segment.
;*----------------------------------------------------------------------------
	THUMB
	AREA MyCode, CODE, READONLY
	ENTRY

main PROC
	EXPORT main
;*----------------------------------------------------------------------------
;* READONLY Instruction section
;*----------------------------------------------------------------------------

        LDR     r1, N
		LDR		r4,=SUM
		MOV		r0,#0		
		BL FIB	
		STR		r0,[r4]
STOP    B		STOP   		; Loop forever (somewhat of a termination)


FIB		STMDB		SP!, {R1,R2,FP,LR}
		
		TEQ r1, #0
		ADDEQ r0, #0
		BEQ exit
		
		TEQ r1, #1
		ADDEQ r0, #1
		BEQ exit
		
		MOV r2, r1
		SUB r1, #1		
		BL FIB
		
				
		SUB r2, #2
		MOV r1, r2
		BL FIB
		

exit	LDMIA		SP!, {R1,R2,FP,PC}

;*----------------------------------------------------------------------------

        ENDP ; main

;*----------------------------------------------------------------------------
;* READONLY DATA section
;*----------------------------------------------------------------------------

N     	DCD     15 

;*----------------------------------------------------------------------------
;* READWRITE DATA section.
;*----------------------------------------------------------------------------
	AREA MyData, DATA, READWRITE
SUM     DCD     0

        END