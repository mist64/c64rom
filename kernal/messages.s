.pag 'messages'
ms1	.byt $d,'i/o error ',$a3
ms5	.byt $d,'searching',$a0
ms6	.byt 'for',$a0
ms7	.byt $d,'press play on tap',$c5
ms8	.byt 'press record & play on tap',$c5
ms10	.byt $d,'loadin',$c7
ms11	.byt $d,'saving',$a0
ms21	.byt $d,'verifyin',$c7
ms17	.byt $d,'found',$a0
ms18	.byt $d,'ok',$8d
; ms34 .byt $d,'monitor',$8d
; ms36 .byt $d,'brea',$cb
.ski 5
;print message to screen only if
;output enabled
;
spmsg	bit msgflg      ;printing messages?
	bpl msg10       ;no...
msg	lda ms1,y
	php
	and #$7f
	jsr bsout
	iny
	plp
	bpl msg
msg10	clc
	rts
.end
