.page 'tokens'
	*=romloc
	.wor init       ;c000 hard reset
	.wor panic      ;c000 soft reset
	.byt 'cbmbasic'
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
reslst	.byt 'en',$c4
endtk	=@200
	.byt 'fo',$d2
fortk	=@201
	.byt 'nex',$d4
	.byt 'dat',$c1
datatk	=@203
	.byt 'input',$a3
	.byt 'inpu',$d4
	.byt 'di',$cd
	.byt 'rea',$c4
	.byt 'le',$d4
	.byt 'got',$cf
gototk	=@211
	.byt 'ru',$ce
	.byt 'i',$c6
	.byt 'restor',$c5
	.byt 'gosu',$c2
gosutk	=@215
	.byt 'retur',$ce
	.byt 're',$cd
remtk	=@217
	.byt 'sto',$d0
	.byt 'o',$ce
	.byt 'wai',$d4
	.byt 'loa',$c4
	.byt 'sav',$c5
	.byt 'verif',$d9
	.byt 'de',$c6
	.byt 'pok',$c5
	.byt 'print',$a3
	.byt 'prin',$d4
printk	=@231
	.byt 'con',$d4
	.byt 'lis',$d4
	.byt 'cl',$d2
	.byt 'cm',$c4
	.byt 'sy',$d3
	.byt 'ope',$ce
	.byt 'clos',$c5
	.byt 'ge',$d4
	.byt 'ne',$d7
scratk	=@242
.end
