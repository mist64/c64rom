.PAG 'CODE17'
GETBYT	JSR FRMNUM
CONINT	JSR POSINT
	LDX FACMO
	BNE GOFUC
	LDX FACLO
	JMP CHRGOT
VAL	JSR LEN1
	BNE *+5
	JMP ZEROFC
	LDX TXTPTR
	LDY TXTPTR+1
	STX STRNG2
	STY STRNG2+1
	LDX INDEX1
	STX TXTPTR
	CLC
	ADC INDEX1
	STA INDEX2
	LDX INDEX1+1
	STX TXTPTR+1
	BCC VAL2
	INX
VAL2	STX INDEX2+1
	LDY #0
	LDA (INDEX2)Y
	PHA
	TYA             ;A=0
	STA (INDEX2)Y
	JSR CHRGOT
	JSR FIN
	PLA
	LDY #0
	STA (INDEX2)Y
ST2TXT	LDX STRNG2
	LDY STRNG2+1
	STX TXTPTR
	STY TXTPTR+1
VALRTS	RTS
GETNUM	JSR FRMNUM
	JSR GETADR
COMBYT	JSR CHKCOM
	JMP GETBYT
GETADR	LDA FACSGN
	BMI GOFUC
	LDA FACEXP
	CMP #145
	BCS GOFUC
	JSR QINT
	LDA FACMO
	LDY FACMO+1
	STY POKER
	STA POKER+1
	RTS
PEEK	LDA POKER+1
	PHA
	LDA POKER
	PHA
	JSR GETADR
	LDY #0
GETCON	LDA (POKER)Y
	TAY
DOSGFL	PLA
	STA POKER
	PLA
	STA POKER+1
	JMP SNGFLT
POKE	JSR GETNUM
	TXA
	LDY #0
	STA (POKER)Y
	RTS
FNWAIT	JSR GETNUM
	STX ANDMSK
	LDX #0
	JSR CHRGOT
	BEQ STORDO
	JSR COMBYT
STORDO	STX EORMSK
	LDY #0
WAITER	LDA (POKER)Y
	EOR EORMSK
	AND ANDMSK
	BEQ WAITER
ZERRTS	RTS
FADDH	LDA #<FHALF
	LDY #>FHALF
	JMP FADD
FSUB	JSR CONUPK
FSUBT	LDA FACSGN
	EOR #@377
	STA FACSGN
	EOR ARGSGN
	STA ARISGN
	LDA FACEXP
	JMP FADDT
FADD5	JSR SHIFTR
	BCC FADD4
FADD	JSR CONUPK
FADDT	BNE *+5
	JMP MOVFA
	LDX FACOV
	STX OLDOV
	LDX #ARGEXP
	LDA ARGEXP
FADDC	TAY
	BEQ ZERRTS
	SEC
	SBC FACEXP
	BEQ FADD4
	BCC FADDA
	STY FACEXP
	LDY ARGSGN
	STY FACSGN
	EOR #@377
	ADC #0
	LDY #0
	STY OLDOV
	LDX #FAC
	BNE FADD1
FADDA	LDY #0
	STY FACOV
FADD1	CMP #$F9
	BMI FADD5
	TAY
	LDA FACOV
	LSR 1,X
	JSR ROLSHF
FADD4	BIT ARISGN
	BPL FADD2
	LDY #FACEXP
	CPX #ARGEXP
	BEQ SUBIT
	LDY #ARGEXP
SUBIT	SEC
	EOR #@377
	ADC OLDOV
	STA FACOV
	LDA 3+ADDPRC,Y
	SBC 3+ADDPRC,X
	STA FACLO
	LDA ADDPRC+2,Y
	SBC 2+ADDPRC,X
	STA FACMO
	LDA 2,Y
	SBC 2,X
	STA FACMOH
	LDA 1,Y
	SBC 1,X
	STA FACHO
FADFLT	BCS NORMAL
	JSR NEGFAC
NORMAL	LDY #0
	TYA
	CLC
NORM3	LDX FACHO
	BNE NORM1
	LDX FACHO+1
	STX FACHO
	LDX FACMOH+1
.END