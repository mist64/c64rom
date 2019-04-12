	*=romloc
	.wor init       ;c000 hard reset
	.wor panic      ;c000 soft reset
	.byt 'CBMBASIC'
stmdsp	.wor end-1
	.wor for-1
	.wor next-1
	.wor data-1
	.wor inputn-1
	.wor input-1
	.wor dim-1
	.wor read-1
	.wor let-1
	.wor goto-1
	.wor run-1
	.wor if-1
	.wor restor-1
	.wor gosub-1
	.wor return-1
	.wor rem-1
	.wor stop-1
	.wor ongoto-1
	.wor fnwait-1
	.wor cload-1
	.wor csave-1
	.wor cverf-1
	.wor def-1
	.wor poke-1
	.wor printn-1
	.wor print-1
	.wor cont-1
	.wor list-1
	.wor clear-1
	.wor cmd-1
	.wor csys-1 
	.wor copen-1
	.wor cclos-1
	.wor get-1
	.wor scrath-1
fundsp	.wor sgn
	.wor int
	.wor abs
usrloc	.wor usrpok
	.wor fre
	.wor pos
	.wor sqr
	.wor rnd
	.wor log
	.wor exp
	.wor cos
	.wor sin
	.wor tan
	.wor atn
	.wor peek
	.wor len
	.wor strd
	.wor val
	.wor asc
	.wor chrd
	.wor leftd
	.wor rightd
	.wor midd
optab	.byt 121
	.wor faddt-1
	.byt 121
	.wor fsubt-1
	.byt 123
	.wor fmultt-1
	.byt 123
	.wor fdivt-1
	.byt 127
	.wor fpwrt-1
	.byt 80
	.wor andop-1
	.byt 70
	.wor orop-1
negtab	.byt 125
	.wor negop-1 
nottab	.byt 90
	.wor notop-1
ptdorl	.byt 100
	.wor dorel-1
q=128-1
reslst	.byt 'EN',$c4
endtk	=@200
	.byt 'FO',$d2
fortk	=@201
	.byt 'NEX',$d4
	.byt 'DAT',$c1
datatk	=@203
	.byt 'INPUT',$a3
	.byt 'INPU',$d4
	.byt 'DI',$cd
	.byt 'REA',$c4
	.byt 'LE',$d4
	.byt 'GOT',$cf
gototk	=@211
	.byt 'RU',$ce
	.byt 'I',$c6
	.byt 'RESTOR',$c5
	.byt 'GOSU',$c2
gosutk	=@215
	.byt 'RETUR',$ce
	.byt 'RE',$cd
remtk	=@217
	.byt 'STO',$d0
	.byt 'O',$ce
	.byt 'WAI',$d4
	.byt 'LOA',$c4
	.byt 'SAV',$c5
	.byt 'VERIF',$d9
	.byt 'DE',$c6
	.byt 'POK',$c5
	.byt 'PRINT',$a3
	.byt 'PRIN',$d4
printk	=@231
	.byt 'CON',$d4
	.byt 'LIS',$d4
	.byt 'CL',$d2
	.byt 'CM',$c4
	.byt 'SY',$d3
	.byt 'OPE',$ce
	.byt 'CLOS',$c5
	.byt 'GE',$d4
	.byt 'NE',$d7
scratk	=@242

