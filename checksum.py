#!/usr/bin/env python3
from __future__ import print_function

import sys, argparse

def calc_checksum(data, old):
	a = 0
	c = 0
	for b in data:
		a = a + b + c
		c = 0
		if a > 255:
			a = a - 256
			c = 1
	if not old:
		a += c
	return a

def to_base(num:int,base:int):
	if base > 36: raise NotImplementedError("only bases up to 36")
	digits="0123456789abcdefghijklmnopqrstuvwxyz"
	ret = ""
	remainder = int(abs(num))
	if remainder==0: return "0"
	while remainder>0:
		ret = digits[remainder % base] + ret
		remainder=remainder // base	
	return ret

def confirm(msg):	
	r=input(f"{msg} (Y/N)? ").strip().lower()
	if r != "y": return False
	return True

# main

if __name__ == "__main__":
	parser = argparse.ArgumentParser(description="Calculates Commodore checksums for a file")
	parser.add_argument("--old",action="store_const",const="old",dest="type",default="old",help="Use Old Algorithm (default)")
	parser.add_argument("--new",action="store_const",const="new",dest="type",help="Use New Algorithm")
	parser.add_argument("file",type=argparse.FileType("rb"),default=None,help="Input filename")
	parser.add_argument("checksum",nargs="?",type=str,default=None,help="Desired checksum, for inserting checksum modifier")
	parser.add_argument("offset",nargs="?",type=str,default=None,help="Offset for checksum modifier")

	parser.add_argument("-d","--dec",action="store_const",const=10,dest="base",default=16,help="Use Decimal")
	parser.add_argument("-8","--oct",action="store_const",const=8,dest="base",help="Use Octal")
	parser.add_argument("-2","--bin",action="store_const",const=2,dest="base",help="Use Binary")

	parser.add_argument("-y","--yes",action="store_const",const=False,dest="ask",default=True,help="Don't prompt about writing to file")
	parser.add_argument("-a","--append",action="store_const",const=True,dest="append",default=False,help="Append checksum to output (for USR files)")

	parser.add_argument("-o","--output",type=str,metavar="outfile",default=None,help="Output filename (default: same as input file)")
	
	parser.add_argument("-q","--quiet",action="store_const",const=True,dest="quiet",default=False,help="Don't output anything except the checksum")
	

	opts = parser.parse_args()

	if ((opts.checksum is not None and opts.offset is None) or
		(opts.offset is not None and opts.checksum is None)
	):
			print("Error: Both or neither of offset and checksum are required")
			parser.print_usage()
			sys.exit()

	
	#print(opts)
	old = (opts.type == "old")

	data = bytearray(opts.file.read())

	checksum = calc_checksum(data, old)
	opts.file.close()

	disp_checksum=to_base(checksum,opts.base)

	msg = f"{opts.file.name}: {disp_checksum}"
	if opts.quiet:
		msg = disp_checksum

	print(msg)
	
	outfile = opts.output
	if outfile is None:
		outfile = opts.file.name

	if opts.checksum is not None and opts.offset is not None:
		
		desired_checksum = int(opts.checksum, opts.base)
		offset = int(opts.offset, opts.base)

		if checksum < desired_checksum:
			data[offset] = desired_checksum - checksum
		else:
			data[offset] = 0xff - (checksum - desired_checksum)


		if opts.ask and not confirm(f"Write byte {offset} of '{outfile}'? "): sys.exit()
		
		file = open(outfile, "wb")
		file.write(data)

	if opts.append:
		# Append the checksum to the file, for e.g "&file" USR disk utilities	
		if opts.ask and not confirm(f"Append byte to '{outfile}'? "): sys.exit()

		data.append(checksum)
		file = open(outfile, "wb")
		file.write(data)

		
