
# 默认动作

default :
	make img

# 镜像文件生成

ipl10.bin : ipl10.asm Makefile
	nasm ipl10.asm -o ipl10.bin -l ipl10.lst

asmhead.bin : asmhead.asm Makefile
	nasm -f elf asmhead.asm -o asmhead.bin -l asmhead.lst

bootpack.bin : bootpack.c Makefile
	cc -m32 bootpack.c -o bootpack.bin 

func.bin:
	nasm -f elf func.asm -o func.bin -l func.lst

haribote.sys : asmhead.bin bootpack.bin Makefile
	ld -m elf_i386 --oformat binary \
		asmhead.bin bootpack.bin func.bin \
		-o haribote.sys -T haribote.ld

haribote.img : ipl10.bin haribote.sys Makefile
	dd if=/dev/zero of=haribote.img count=2880
	dd if=ipl10.bin of=haribote.img count=1 conv=notrunc
	mkdir -p /tmp/disk
	sudo mount -o loop haribote.img /tmp/disk
	sudo cp haribote.sys /tmp/disk
	sudo umount /tmp/disk

# 其他指令

img :
	make -r haribote.img

run :
	make -r img
	qemu-system-i386 -drive file=haribote.img,if=floppy

install :
	make -r img
	sudo dd if=haribote.img of=/dev/sdb count=1

clean :
	-rm *.bin
	-rm *.lst
	-rm *.obj
	-rm *.sys

src_only :
	make -r clean
	-rm haribote.img
