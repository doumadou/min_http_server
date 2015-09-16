all:
	nasm -f elf http_server_min.asm
	ld -T ./ld.lds -melf_i386 -s -o http_server http_server_min.o

