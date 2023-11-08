%.bin: %.s
	ca65 -g "$<"

all:
	ca65 -g basic/basic.s
	ca65 -g kernal/kernal.s
	ld65 -C rom.cfg -o /dev/null basic/basic.o kernal/kernal.o -Ln rom.txt
	# if it's the unchanged 901226-01 image, use old checksum algorithm
	$$SHELL -c "if [ $$(crc32 basic.bin) == cfdebff8 ]; then \
		python3 checksum.py -y --old basic.bin 0xa0 0x1f52; \
	else \
		python3 checksum.py -y --new basic.bin 0xa0 0x1f52; \
	fi"
	python3 checksum.py -y --new kernal.bin 0xe0 0x4ac

clean:
	rm -f basic/basic.o kernal/kernal.o basic.bin kernal.bin rom.bin
