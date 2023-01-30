
# 默认动作

default :
	make img

# 镜像文件生成

ipl10.bin : ipl10.asm Makefile
	nasm ipl10.asm -o ipl10.bin -l ipl10.lst

haribote.sys : haribote.asm Makefile
	nasm haribote.asm -o haribote.sys -l haribote.lst

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
	make img
	qemu-system-i386 -drive file=haribote.img,if=floppy

install:
	make haribote.img
	sudo dd if=haribote.img of=/dev/sdb count=1

clean :
	-rm *.bin
	-rm *.lst
	-rm haribote.sys

src_only :
	make clean
	-rm *.img
