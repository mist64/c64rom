	*=$0000         ;declare 6510 ports
d6510	*=*+1           ;6510 data direction register
r6510	*=*+1           ;6510 data register
	*=$0002         ;miss 6510 regs
;virtual regs for machine language monitor
pch	*=*+1
pcl	*=*+1
flgs	*=*+1
acc	*=*+1
xr	*=*+1
yr	*=*+1
sp	*=*+1
invh	*=*+1           ;user modifiable irq
invl	*=*+1

	* =$90
status	*=*+1           ;i/o operation status byte
; crfac *=*+2 ;correction factor (unused)
stkey	*=*+1           ;stop key flag
svxt	*=*+1           ;temporary
verck	*=*+1           ;load or verify flag
c3p0	*=*+1           ;ieee buffered char flag
bsour	*=*+1           ;char buffer for ieee
syno	*=*+1           ;cassette sync #
xsav	*=*+1           ;temp for basin
ldtnd	*=*+1           ;index to logical file
dfltn	*=*+1           ;default input device #
dflto	*=*+1           ;default output device #
prty	*=*+1           ;cassette parity
dpsw	*=*+1           ;cassette dipole switch
msgflg	*=*+1           ;os message flag
ptr1	;cassette error pass1
t1	*=*+1           ;temporary 1
tmpc
ptr2	;cassette error pass2
t2	*=*+1           ;temporary 2
time	*=*+3           ;24 hour clock in 1/60th seconds
r2d2	;serial bus usage
pcntr	*=*+1           ;cassette stuff
; ptch *=*+1  (unused)
bsour1	;temp used by serial routine
firt	*=*+1
count	;temp used by serial routine
cntdn	*=*+1           ;cassette sync countdown
bufpt	*=*+1           ;cassette buffer pointer
inbit	;rs-232 rcvr input bit storage
shcnl	*=*+1           ;cassette short count
bitci	;rs-232 rcvr bit count in
rer	*=*+1           ;cassette read error
rinone	;rs-232 rcvr flag for start bit check
rez	*=*+1           ;cassete reading zeroes
ridata	;rs-232 rcvr byte buffer
rdflg	*=*+1           ;cassette read mode
riprty	;rs-232 rcvr parity storage
shcnh	*=*+1           ;cassette short cnt
sal	*=*+1
sah	*=*+1
eal	*=*+1
eah	*=*+1
cmp0	*=*+1
temp	*=*+1
tape1	*=*+2           ;address of tape buffer #1y.
bitts	;rs-232 trns bit count
snsw1	*=*+1
nxtbit	;rs-232 trns next bit to be sent
diff	*=*+1
rodata	;rs-232 trns byte buffer
prp	*=*+1
fnlen	*=*+1           ;length current file n str
la	*=*+1           ;current file logical addr
sa	*=*+1           ;current file 2nd addr
fa	*=*+1           ;current file primary addr
fnadr	*=*+2           ;addr current file name str
roprty	;rs-232 trns parity buffer
ochar	*=*+1
fsblk	*=*+1           ;cassette read block count
mych	*=*+1
cas1	*=*+1           ;cassette manual/controlled switch
tmp0
stal	*=*+1
stah	*=*+1
memuss	;cassette load temps (2 bytes)
tmp2	*=*+2
;
;variables for screen editor
;
lstx	*=*+1           ;key scan index
; sfst *=*+1 ;keyboard shift flag (unused)
ndx	*=*+1           ;index to keyboard q
rvs	*=*+1           ;rvs field on flag
indx	*=*+1
lsxp	*=*+1           ;x pos at start
lstp	*=*+1
sfdx	*=*+1           ;shift mode on print
blnsw	*=*+1           ;cursor blink enab
blnct	*=*+1           ;count to toggle cur
gdbln	*=*+1           ;char before cursor
blnon	*=*+1           ;on/off blink flag
crsw	*=*+1           ;input vs get flag
pnt	*=*+2           ;pointer to row
; point *=*+1   (unused)
pntr	*=*+1           ;pointer to column
qtsw	*=*+1           ;quote switch
lnmx	*=*+1           ;40/80 max positon
tblx	*=*+1
data	*=*+1
insrt	*=*+1           ;insert mode flag
ldtb1	*=*+26          ;line flags+endspace
user	*=*+2           ;screen editor color ip
keytab	*=*+2           ;keyscan table indirect
;rs-232 z-page
ribuf	*=*+2           ;rs-232 input buffer pointer
robuf	*=*+2           ;rs-232 output buffer pointer
frekzp	*=*+4           ;free kernal zero page 9/24/80
baszpt	*=*+1           ;location ($00ff) used by basic

	*=$100 
bad	*=*+1
	*=$200
buf	*=*+89          ;basic/monitor buffer

; tables for open files
;
lat	*=*+10          ;logical file numbers
fat	*=*+10          ;primary device numbers
sat	*=*+10          ;secondary addresses

; system storage
;
keyd	*=*+10          ;irq keyboard buffer
memstr	*=*+2           ;start of memory
memsiz	*=*+2           ;top of memory
timout	*=*+1           ;ieee timeout flag

; screen editor storage
;
color	*=*+1           ;activ color nybble
gdcol	*=*+1           ;original color before cursor
hibase	*=*+1           ;base location of screen (top)
xmax	*=*+1
rptflg	*=*+1           ;key repeat flag
kount	*=*+1
delay	*=*+1
shflag	*=*+1           ;shift flag byte
lstshf	*=*+1           ;last shift pattern
keylog	*=*+2           ;indirect for keyboard table setup
mode	*=*+1           ;0-pet mode, 1-cattacanna
autodn	*=*+1           ;auto scroll down flag(=0 on,<>0 off)

; rs-232 storage
;
m51ctr	*=*+1           ;6551 control register
m51cdr	*=*+1           ;6551 command register
m51ajb	*=*+2           ;non standard (bittime/2-100)
rsstat	*=*+1           ; rs-232 status register
bitnum	*=*+1           ;number of bits to send (fast response)
baudof	*=*+2           ;baud rate full bit time (created by open)
;
; reciever storage
;
; inbit *=*+1 ;input bit storage
; bitci *=*+1 ;bit count in
; rinone *=*+1 ;flag for start bit check
; ridata *=*+1 ;byte in buffer
; riprty *=*+1 ;byte in parity storage
ridbe	*=*+1           ;input buffer index to end
ridbs	*=*+1           ;input buffer pointer to start
;
; transmitter storage
;
; bitts *=*+1 ;# of bits to be sent
; nxtbit *=*+1 ;next bit to be sent
; roprty *=*+1 ;parity of byte sent
; rodata *=*+1 ;byte buffer out
rodbs	*=*+1           ;output buffer index to start
rodbe	*=*+1           ;output buffer index to end
;
irqtmp	*=*+2           ;holds irq during tape ops
;
; temp space for vic-40 variables ****
;
enabl	*=*+1           ;rs-232 enables (replaces ier)
caston	*=*+1           ;tod sense during cassettes
kika26	*=*+1           ;temp storage for cassette read routine
stupid	*=*+1           ;temp d1irq indicator for cassette read
lintmp	*=*+1           ;temporary for line index
palnts	*=*+1           ;pal vs ntsc flag 0=ntsc 1=pal

	*=$0300         ;rem program indirects(10)
	*=$0300+20      ;rem kernal/os indirects(20)
cinv	*=*+2           ;irq ram vector
cbinv	*=*+2           ;brk instr ram vector
nminv	*=*+2           ;nmi ram vector
iopen	*=*+2           ;indirects for code
iclose	*=*+2           ; conforms to kernal spec 8/19/80
ichkin	*=*+2
ickout	*=*+2
iclrch	*=*+2
ibasin	*=*+2
ibsout	*=*+2
istop	*=*+2
igetin	*=*+2
iclall	*=*+2
usrcmd	*=*+2
iload	*=*+2
isave	*=*+2           ;savesp

	*=$0300+60
tbuffr	*=*+192         ;cassette data buffer

	* =$400
vicscn	*=*+1024
ramloc

; i/o devices
;
	* =$d000
vicreg	=* ;vic registers

	* =$d400
sidreg	=* ;sid registers

	* =$d800
viccol	*=*+1024        ;vic color nybbles

	* =$dc00        ;device1 6526 (page1 irq)
colm	;keyboard matrix
d1pra	*=*+1
rows	;keyboard matrix
d1prb	*=*+1
d1ddra	*=*+1
d1ddrb	*=*+1
d1t1l	*=*+1
d1t1h	*=*+1
d1t2l	*=*+1
d1t2h	*=*+1
d1tod1	*=*+1
d1tods	*=*+1
d1todm	*=*+1
d1todh	*=*+1
d1sdr	*=*+1
d1icr	*=*+1
d1cra	*=*+1
d1crb	*=*+1

	* =$dd00        ;device2 6526 (page2 nmi)
d2pra	*=*+1
d2prb	*=*+1
d2ddra	*=*+1
d2ddrb	*=*+1
d2t1l	*=*+1
d2t1h	*=*+1
d2t2l	*=*+1
d2t2h	*=*+1
d2tod1	*=*+1
d2tods	*=*+1
d2todm	*=*+1
d2todh	*=*+1
d2sdr	*=*+1
d2icr	*=*+1
d2cra	*=*+1
d2crb	*=*+1

timrb	=$19            ;6526 crb enable one-shot tb

;tape block types
;
eot	=5 ;end of tape
blf	=1 ;basic load file
bdf	=2 ;basic data file
plf	=3 ;fixed program type
bdfh	=4 ;basic data file header
bufsz	=192            ;buffer size
;
;screen editor constants
;
llen	=40             ;single line 40 columns
llen2	=80             ;double line = 80 columns
nlines	=25             ;25 rows on screen
white	=$01            ;white screen color
blue	=$06            ;blue char color
cr	=$d             ;carriage return

;rsr 8/3/80 add & change z-page
;rsr 8/11/80 add memuss & plf type
;rsr 8/22/80 add rs-232 routines
;rsr 8/24/80 add open variables
;rsr 8/29/80 add baud space move rs232 to z-page
;rsr 9/2/80 add screen editor vars&con
;rsr 12/7/81 modify for vic-40
