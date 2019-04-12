.pag 'token2'
	.byt 'tab',$a8
tabtk	=@243
	.byt 't',$cf
totk	=@244
	.byt 'f',$ce
fntk	=@245
	.byt 'spc',$a8
spctk	=@246
	.byt 'the',$ce
thentk	=@247
	.byt 'no',$d4
nottk	=@250
	.byt 'ste',$d0
steptk	=@251
	.byt $ab
plustk	=@252
	.byt $ad
minutk	=@253
	.byt $aa
	.byt $af
	.byt $de
	.byt 'an',$c4
	.byt 'o',$d2
	.byt 190
greatk	=@261
	.byt $bd
equltk	=@262
	.byt 188
lesstk	=@263
	.byt 'sg',$ce
onefun	=@264
	.byt 'in',$d4
	.byt 'ab',$d3
	.byt 'us',$d2
	.byt 'fr',$c5
	.byt 'po',$d3
	.byt 'sq',$d2
	.byt 'rn',$c4
	.byt 'lo',$c7
	.byt 'ex',$d0
	.byt 'co',$d3
	.byt 'si',$ce
	.byt 'ta',$ce
	.byt 'at',$ce
	.byt 'pee',$cb
	.byt 'le',$ce
	.byt 'str',$a4
	.byt 'va',$cc
	.byt 'as',$c3
	.byt 'chr',$a4
lasnum	=@307
	.byt 'left',$a4
	.byt 'right',$a4
	.byt 'mid',$a4
	.byt 'g',$cf
gotk	=@313
	.byt 0
.pag 'error messages'
err01	.byt 'too many file',$d3
err02	.byt 'file ope',$ce
err03	.byt 'file not ope',$ce
err04	.byt 'file not foun',$c4
err05	.byt 'device not presen',$d4
err06	.byt 'not input fil',$c5
err07	.byt 'not output fil',$c5
err08	.byt 'missing file nam',$c5
err09	.byt 'illegal device numbe',$d2
err10	.byt 'next without fo',$d2
errnf	=10
err11	.byt 'synta',$d8
errsn	=11
err12	.byt 'return without gosu',$c2
errrg	=12
err13	.byt 'out of dat',$c1
errod	=13
err14	.byt 'illegal quantit',$d9
errfc	=14
err15	.byt 'overflo',$d7
errov	=15
err16	.byt 'out of memor',$d9
errom	=16
err17	.byt 'undef',$27
	.byt 'd statemen',$d4
errus	=17
err18	.byt 'bad subscrip',$d4
errbs	=18
err19	.byt 'redim',$27,'d arra',$d9
errdd	=19
err20	.byt 'division by zer',$cf
errdvo	=20
err21	.byt 'illegal direc',$d4
errid	=21
err22	.byt 'type mismatc',$c8
errtm	=22
err23	.byt 'string too lon',$c7
errls	=23
err24	.byt 'file dat',$c1
errbd	=24
err25	.byt 'formula too comple',$d8
errst	=25
err26	.byt 'can',$27,'t continu',$c5
errcn	=26
err27	.byt 'undef',$27,'d functio',$ce
erruf	=27
err28	.byt 'verif',$d9
ervfy	=28
err29	.byt 'loa',$c4
erload	=29
.pag 'error messages'
; table to translate error message #
; to address of string containing message
;
errtab	.wor err01
	.wor err02
	.wor err03
	.wor err04
	.wor err05
	.wor err06
	.wor err07
	.wor err08
	.wor err09
	.wor err10
	.wor err11
	.wor err12
	.wor err13
	.wor err14
	.wor err15
	.wor err16
	.wor err17
	.wor err18
	.wor err19
	.wor err20
	.wor err21
	.wor err22
	.wor err23
	.wor err24
	.wor err25
	.wor err26
	.wor err27
	.wor err28
	.wor err29
	.wor err30
.ski 5
okmsg	.byt $d,'ok',$d,$0
err	.byt $20,' error',0 ;add a space for vic-40 screen
intxt	.byt ' in ',0
reddy	.byt $d,$a,'ready.',$d,$a,0
erbrk	=30
brktxt	.byt $d,$a
err30	.byt 'break',0,$a0 ;shifted space
.pag
forsiz	=@22
fndfor	tsx
	inx
	inx
	inx
	inx
ffloop	lda 257,x
	cmp #fortk
	bne ffrts
	lda forpnt+1
	bne cmpfor
	lda 258,x
	sta forpnt
	lda 259,x
	sta forpnt+1
cmpfor	cmp 259,x
	bne addfrs
	lda forpnt
	cmp 258,x
	beq ffrts
addfrs	txa 
	clc
	adc #forsiz
	tax
	bne ffloop
ffrts	rts
bltu	jsr reason
	sta strend
	sty strend+1
bltuc	sec
	lda hightr
	sbc lowtr
	sta index
	tay
	lda hightr+1
	sbc lowtr+1
	tax
	inx
	tya
	beq decblt
	lda hightr
	sec
	sbc index
	sta hightr
	bcs blt1
	dec hightr+1
	sec
blt1	lda highds
	sbc index
	sta highds
	bcs moren1
	dec highds+1
	bcc moren1
bltlp	lda (hightr)y
	sta (highds)y
moren1	dey
	bne bltlp
	lda (hightr),y
	sta (highds),y
decblt	dec hightr+1
	dec highds+1
	dex
	bne moren1
	rts
getstk	asl a
	adc #numlev+numlev+16
	bcs omerr
	sta index
	tsx
	cpx index
	bcc omerr
	rts
reason	cpy fretop+1
	bcc rearts
	bne trymor
	cmp fretop
	bcc rearts
trymor	pha
	ldx #8+addprc
	tya
reasav	pha
	lda highds-1,x
	dex
	bpl reasav
	jsr garba2
	ldx #248-addprc
reasto	pla
	sta highds+8+addprc,x
	inx
	bmi reasto
	pla
	tay
	pla
	cpy fretop+1
	bcc rearts
	bne omerr
	cmp fretop
	bcs omerr
rearts	rts
.end
