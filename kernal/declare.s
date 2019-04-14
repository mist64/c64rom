	.segment "S0000k" : zeropage ;declare 6510 ports
d6510	.res 1           ;6510 data direction register
r6510	.res 1           ;6510 data register
	.segment "S0002" : zeropage ;miss 6510 regs
;virtual regs for machine language monitor
pch	.res 1
pcl	.res 1
flgs	.res 1
acc	.res 1
xr	.res 1
yr	.res 1
sp	.res 1
invh	.res 1           ;user modifiable irq
invl	.res 1

	.segment "S0090" : zeropage
status	.res 1           ;i/o operation status byte
; crfac .res 2 ;correction factor (unused)
stkey	.res 1           ;stop key flag
svxt	.res 1           ;temporary
verck	.res 1           ;load or verify flag
c3p0	.res 1           ;ieee buffered char flag
bsour	.res 1           ;char buffer for ieee
syno	.res 1           ;cassette sync #
xsav	.res 1           ;temp for basin
ldtnd	.res 1           ;index to logical file
dfltn	.res 1           ;default input device #
dflto	.res 1           ;default output device #
prty	.res 1           ;cassette parity
dpsw	.res 1           ;cassette dipole switch
msgflg	.res 1           ;os message flag
ptr1	;cassette error pass1
t1	.res 1           ;temporary 1
tmpc
ptr2	;cassette error pass2
t2	.res 1           ;temporary 2
time	.res 3           ;24 hour clock in 1/60th seconds
r2d2	;serial bus usage
pcntr	.res 1           ;cassette stuff
; ptch .res 1  (unused)
bsour1	;temp used by serial routine
firt	.res 1
count	;temp used by serial routine
cntdn	.res 1           ;cassette sync countdown
bufpt	.res 1           ;cassette buffer pointer
inbit	;rs-232 rcvr input bit storage
shcnl	.res 1           ;cassette short count
bitci	;rs-232 rcvr bit count in
rer	.res 1           ;cassette read error
rinone	;rs-232 rcvr flag for start bit check
rez	.res 1           ;cassete reading zeroes
ridata	;rs-232 rcvr byte buffer
rdflg	.res 1           ;cassette read mode
riprty	;rs-232 rcvr parity storage
shcnh	.res 1           ;cassette short cnt
sal	.res 1
sah	.res 1
eal	.res 1
eah	.res 1
cmp0	.res 1
temp	.res 1
tape1	.res 2           ;address of tape buffer #1y.
bitts	;rs-232 trns bit count
snsw1	.res 1
nxtbit	;rs-232 trns next bit to be sent
diff	.res 1
rodata	;rs-232 trns byte buffer
prp	.res 1
fnlen	.res 1           ;length current file n str
la	.res 1           ;current file logical addr
sa	.res 1           ;current file 2nd addr
fa	.res 1           ;current file primary addr
fnadr	.res 2           ;addr current file name str
roprty	;rs-232 trns parity buffer
ochar	.res 1
fsblk	.res 1           ;cassette read block count
mych	.res 1
cas1	.res 1           ;cassette manual/controlled switch
tmp0
stal	.res 1
stah	.res 1
memuss	;cassette load temps (2 bytes)
tmp2	.res 2
;
;variables for screen editor
;
lstx	.res 1           ;key scan index
; sfst .res 1 ;keyboard shift flag (unused)
ndx	.res 1           ;index to keyboard q
rvs	.res 1           ;rvs field on flag
indx	.res 1
lsxp	.res 1           ;x pos at start
lstp	.res 1
sfdx	.res 1           ;shift mode on print
blnsw	.res 1           ;cursor blink enab
blnct	.res 1           ;count to toggle cur
gdbln	.res 1           ;char before cursor
blnon	.res 1           ;on/off blink flag
crsw	.res 1           ;input vs get flag
pnt	.res 2           ;pointer to row
; point .res 1   (unused)
pntr	.res 1           ;pointer to column
qtsw	.res 1           ;quote switch
lnmx	.res 1           ;40/80 max positon
tblx	.res 1
data	.res 1
insrt	.res 1           ;insert mode flag
ldtb1	.res 26          ;line flags+endspace
user	.res 2           ;screen editor color ip
keytab	.res 2           ;keyscan table indirect
;rs-232 z-page
ribuf	.res 2           ;rs-232 input buffer pointer
robuf	.res 2           ;rs-232 output buffer pointer
frekzp	.res 4           ;free kernal zero page 9/24/80
baszpt	.res 1           ;location ($00ff) used by basic

	.segment "S0100"
bad	.res 1
	.segment "S0200"
buf	.res 89          ;basic/monitor buffer

; tables for open files
;
lat	.res 10          ;logical file numbers
fat	.res 10          ;primary device numbers
sat	.res 10          ;secondary addresses

; system storage
;
keyd	.res 10          ;irq keyboard buffer
memstr	.res 2           ;start of memory
memsiz	.res 2           ;top of memory
timout	.res 1           ;ieee timeout flag

; screen editor storage
;
color	.res 1           ;activ color nybble
gdcol	.res 1           ;original color before cursor
hibase	.res 1           ;base location of screen (top)
xmax	.res 1
rptflg	.res 1           ;key repeat flag
kount	.res 1
delay	.res 1
shflag	.res 1           ;shift flag byte
lstshf	.res 1           ;last shift pattern
keylog	.res 2           ;indirect for keyboard table setup
mode	.res 1           ;0-pet mode, 1-cattacanna
autodn	.res 1           ;auto scroll down flag(=0 on,<>0 off)

; rs-232 storage
;
m51ctr	.res 1           ;6551 control register
m51cdr	.res 1           ;6551 command register
m51ajb	.res 2           ;non standard (bittime/2-100)
rsstat	.res 1           ; rs-232 status register
bitnum	.res 1           ;number of bits to send (fast response)
baudof	.res 2           ;baud rate full bit time (created by open)
;
; reciever storage
;
; inbit .res 1 ;input bit storage
; bitci .res 1 ;bit count in
; rinone .res 1 ;flag for start bit check
; ridata .res 1 ;byte in buffer
; riprty .res 1 ;byte in parity storage
ridbe	.res 1           ;input buffer index to end
ridbs	.res 1           ;input buffer pointer to start
;
; transmitter storage
;
; bitts .res 1 ;# of bits to be sent
; nxtbit .res 1 ;next bit to be sent
; roprty .res 1 ;parity of byte sent
; rodata .res 1 ;byte buffer out
rodbs	.res 1           ;output buffer index to start
rodbe	.res 1           ;output buffer index to end
;
irqtmp	.res 2           ;holds irq during tape ops
;
; temp space for vic-40 variables ****
;
enabl	.res 1           ;rs-232 enables (replaces ier)
caston	.res 1           ;tod sense during cassettes
kika26	.res 1           ;temp storage for cassette read routine
stupid	.res 1           ;temp d1irq indicator for cassette read
lintmp	.res 1           ;temporary for line index
palnts	.res 1           ;pal vs ntsc flag 0=ntsc 1=pal

	.segment "S0300k"         ;rem program indirects(10)
	.segment "S0314k"      ;rem kernal/os indirects(20)
cinv	.res 2           ;irq ram vector
cbinv	.res 2           ;brk instr ram vector
nminv	.res 2           ;nmi ram vector
iopen	.res 2           ;indirects for code
iclose	.res 2           ; conforms to kernal spec 8/19/80
ichkin	.res 2
ickout	.res 2
iclrch	.res 2
ibasin	.res 2
ibsout	.res 2
istop	.res 2
igetin	.res 2
iclall	.res 2
usrcmd	.res 2
iload	.res 2
isave	.res 2           ;savesp

	.segment "S033C"
tbuffr	.res 192         ;cassette data buffer

	.segment "S0400"
vicscn	.res 1024
ramloc

; i/o devices
;
	.segment "SD000"
vicreg	=* ;vic registers

	.segment "SD400"
sidreg	=* ;sid registers

	.segment "SD800"
viccol	.res 1024        ;vic color nybbles

	.segment "SDC00"        ;device1 6526 (page1 irq)
colm	;keyboard matrix
d1pra	.res 1
rows	;keyboard matrix
d1prb	.res 1
d1ddra	.res 1
d1ddrb	.res 1
d1t1l	.res 1
d1t1h	.res 1
d1t2l	.res 1
d1t2h	.res 1
d1tod1	.res 1
d1tods	.res 1
d1todm	.res 1
d1todh	.res 1
d1sdr	.res 1
d1icr	.res 1
d1cra	.res 1
d1crb	.res 1

	.segment "SDD00"        ;device2 6526 (page2 nmi)
d2pra	.res 1
d2prb	.res 1
d2ddra	.res 1
d2ddrb	.res 1
d2t1l	.res 1
d2t1h	.res 1
d2t2l	.res 1
d2t2h	.res 1
d2tod1	.res 1
d2tods	.res 1
d2todm	.res 1
d2todh	.res 1
d2sdr	.res 1
d2icr	.res 1
d2cra	.res 1
d2crb	.res 1

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
