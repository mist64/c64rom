addprc	=1
romloc	=$a000          ;vic-40 basic rom
linlen	=40             ;vic screen size ?why?
buflen	=89             ;vic buffer
bufpag	=2
buf	=512
stkend	=507
clmwid	=10             ;print window 10 chars
pi	=255
numlev	=23
strsiz	=3
blank0	*=*+3           ;6510 register area
adray1	*=*+2           ;convert float->integer
adray2	*=*+2           ;convert integer->float
integr
charac	*=*+1
endchr	*=*+1
trmpos	*=*+1
verck	*=*+1
count	*=*+1
dimflg	*=*+1
valtyp	*=*+1
intflg	*=*+1
garbfl
dores	*=*+1
subflg	*=*+1
inpflg	*=*+1
domask
tansgn	*=*+1
channl	*=*+1
poker
linnum	*=*+2
temppt	*=*+1
lastpt	*=*+2
tempst	*=*+9
index
index1	*=*+2
index2	*=*+2
resho	*=*+1
resmoh	*=*+1
addend
resmo	*=*+1
reslo	*=*+1
	*=*+1
txttab	*=*+2
vartab	*=*+2
arytab	*=*+2
strend	*=*+2
fretop	*=*+2
frespc	*=*+2
memsiz	*=*+2
curlin	*=*+2
oldlin	*=*+2
oldtxt	*=*+2
datlin	*=*+2
datptr	*=*+2
inpptr	*=*+2
varnam	*=*+2
fdecpt	
varpnt	*=*+2
lstpnt
andmsk
forpnt	*=*+2
eormsk	=forpnt+1
vartxt
opptr	*=*+2
opmask	*=*+1
grbpnt
tempf3
defpnt	*=*+2
dscpnt	*=*+2
	*=*+1
four6	*=*+1
jmper	*=*+1
size	*=*+1
oldov	*=*+1
tempf1	*=*+1
arypnt
highds	*=*+2
hightr	*=*+2
tempf2
	*=*+1
deccnt
lowds	*=*+2
grbtop
dptflg
lowtr	*=*+1
expsgn	*=*+1
tenexp	=lowds+1
epsgn	=lowtr+1
dsctmp
fac
facexp	*=*+1
facho	*=*+1
facmoh	*=*+1
indice
facmo	*=*+1
faclo	*=*+1
facsgn	*=*+1
degree
sgnflg	*=*+1
bits	*=*+1
argexp	*=*+1
argho	*=*+1
argmoh	*=*+1
argmo	*=*+1
arglo	*=*+1
argsgn	*=*+1
strngi
arisgn	*=*+1
facov	*=*+1
bufptr
strng2
polypt
curtol
fbufpt	*=*+2
chrget	*=*+6
chrgot	*=*+1
txtptr	*=*+6
qnum	*=*+10
chrrts	*=*+1
rndx	*=*+5
	*=255
lofbuf	*=*+1
fbuffr	*=*+1
strng1	=arisgn
;
	*=$0300         ;basic indirects
ierror	*=*+2           ;indirect error (output error in .x)
imain	*=*+2           ;indirect main (system direct loop)
icrnch	*=*+2           ;indirect crunch (tokenization routine)
iqplop	*=*+2           ;indirect list (char list)
igone	*=*+2           ;indirect gone (char dispatch)
ieval	*=*+2           ;indirect eval (symbol evaluation)
;temp storage untill system intergration
; sys 6502 regs
sareg	*=*+1           ;.a reg
sxreg	*=*+1           ;.x reg
syreg	*=*+1           ;.y reg
spreg	*=*+1           ;.p reg
usrpok	*=*+3           ;user function dispatch
	*=$0300+20      ;system indirects follow

