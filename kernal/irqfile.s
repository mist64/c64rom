; simirq - simulate an irq (for cassette read)
;  enter by a jsr simirq
;
simirq	php
	pla             ;fix the break flag
	and #$ef
	pha
; puls - checks for real irq's or breaks
;
puls	pha
	txa
	pha
	tya
	pha
	tsx
	lda $104,x      ;get old p status
	and #$10        ;break flag?
	beq puls1       ;...no
	jmp (cbinv)     ;...yes...break instr
puls1	jmp (cinv)      ;...irq

; pcint - add universal to cinit
;
pcint	jsr cint
p0010	lda vicreg+18   ;check raster compare for zero
	bne p0010       ;if it's zero then check value
	lda vicreg+25   ;get raster irq value
	and #$01
	sta palnts      ;place in pal/ntsc indicator
	jmp iokeys
;
; piokey - add universal to iokeys
;
piokey	lda #$81        ;enable t1 irq's
	sta d1icr
	lda d1cra
	and #$80        ;save only tod bit
	ora #%00010001  ;enable timer1
	sta d1cra
	jmp clklo       ;release the clock line***901227-03***
	*=$e500-20
;
; baudop - baud rate table for pal
;   .985248e6/baud-rate/2-100
;
baudop	.wor 9853-cbit ;50 baud
	.wor 6568-cbit ;75 baud
	.wor 4478-cbit ;110 baus
	.wor 3660-cbit ;134.6 baud
	.wor 3284-cbit ;150 baud
	.wor 1642-cbit ;300 baud
	.wor 821-cbit  ;600 baud
	.wor 411-cbit  ;1200 baud
	.wor 274-cbit  ;1800 baud
	.wor 205-cbit  ;2400 baud

	*=$e500-32      ;(20-12)
; fpatch - tape filename timeout
;
fpatch	adc #2          ;time is (8 to 13 sec of display)
fpat00	ldy stkey       ;check for key down on last row...
	iny
	bne fpat01      ;key...exit loop
	cmp time+1      ;watch timer
	bne fpat00
fpat01	rts

	*=$e500-38      ;(32-6)
; cpatch - fix to clear line...modified 901227-03
;  prevents white character flash...
cpatch                  ;always clear to current foregnd color
	lda color
	sta (user)y
	rts

	*=$e500-45      ;(38-7)
; prtyp - rs232 parity patch...added 901227-03
;
prtyp	sta rinone      ;good receiver start...disable flag
	lda #1          ;set parity to 1 always
	sta riprty
	rts

