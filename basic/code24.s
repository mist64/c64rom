logeb2	.byt @201,@70,@252,@73,@51
expcon	.byt 7,@161,@64,@130,@76
	.byt @126,@164,@26,@176
	.byt @263,@33,@167,@57
	.byt @356,@343,@205,@172
	.byt @35,@204,@34,@52
	.byt @174,@143,@131,@130
	.byt @12,@176,@165,@375
	.byt @347,@306,@200,@61
	.byt @162,@30,@20,@201
	.byt 0,0,0,0
;
; start of kernal rom
;
exp	lda #<logeb2
	ldy #>logeb2
	jsr fmult
	lda facov
	adc #@120
	bcc stoldx
	jsr incrnd
stoldx	jmp stold       ;cross boundries

