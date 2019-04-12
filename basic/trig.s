.pag 'trig functions'
cos	lda #<pi2
	ldy #>pi2
	jsr fadd
sin	jsr movaf
	lda #<twopi
	ldy #>twopi
	ldx argsgn
	jsr fdivf
	jsr movaf
	jsr int
	lda #0
	sta arisgn
	jsr fsubt
	lda #<fr4
	ldy #>fr4
	jsr fsub
	lda facsgn
	pha
	bpl sin1
	jsr faddh
	lda facsgn
	bmi sin2
	lda tansgn
	eor #$ff
	sta tansgn
sin1	jsr negop
sin2	lda #<fr4
	ldy #>fr4
	jsr fadd
	pla
	bpl sin3
	jsr negop
sin3	lda #<sincon
	ldy #>sincon
	jmp polyx
tan	jsr mov1f
	lda #0
	sta tansgn
	jsr sin
	ldx #<tempf3
	ldy #>tempf3
	jsr gmovmf
	lda #<tempf1
	ldy #>tempf1
	jsr movfm
	lda #0
	sta facsgn
	lda tansgn
	jsr cosc
	lda #<tempf3
	ldy #>tempf3
	jmp fdiv
cosc	pha
	jmp sin1
pi2	.byt @201,@111,@17,@332,@242
twopi	.byt @203,@111,@17,@332,@242
fr4	.byt @177,0,0,0,0
sincon	.byt 5,@204,@346,@32,@55
	.byt @33,@206,@50,@7,@373
	.byt @370,@207,@231,@150,@211
	.byt 1,@207,@43,@65,@337,@341
	.byt @206,@245,@135,@347,@50,@203
	.byt @111,@17,@332,@242
atn	lda facsgn
	pha
	bpl atn1
	jsr negop
atn1	lda facexp
	pha
	cmp #@201
	bcc atn2
	lda #<fone
	ldy #>fone
	jsr fdiv
atn2	lda #<atncon
	ldy #>atncon
	jsr polyx
	pla
	cmp #@201
	bcc atn3
	lda #<pi2
	ldy #>pi2
	jsr fsub
atn3	pla
	bpl atn4
	jmp negop
atn4	rts
atncon	.byt @13,@166,@263,@203
	.byt @275,@323,@171,@36,@364
	.byt @246,@365,@173,@203,@374
	.byt @260,@20
	.byt @174,@14,@37,@147,@312
	.byt @174,@336,@123,@313,@301
	.byt @175,@24,@144,@160,@114
	.byt @175,@267,@352,@121,@172
	.byt @175,@143,@60,@210,@176
	.byt @176,@222,@104,@231,@72
	.byt @176,@114,@314,@221,@307
	.byt @177,@252,@252,@252,@23
	.byt @201,0,0,0,0
.end
