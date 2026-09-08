all: 
	nasm -f elf32 loader.s -o loader.o
	ld -T link.ld -melf_i386 loader.o -o kernel.elf
	mv kernel.elf iso/boot
	grub2-mkrescue -o someOS.iso iso -d /usr/lib/grub/i386-pc

run: 
	bochs -f bochsrc.txt