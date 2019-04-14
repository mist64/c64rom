all:
	ca65 -g basic/basic.s
	ca65 -g kernal/kernal.s
	ld65 -C rom.cfg -o rom.bin basic/basic.o kernal/kernal.o -Ln rom.txt

clean:
	rm -f basic/basic.o kernal/kernal.o basic.bin kernal.bin rom.bin
