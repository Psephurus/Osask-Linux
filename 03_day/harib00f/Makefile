
# 默认动作

default :
	make img

# 镜像文件生成

ipl.bin : ipl.asm Makefile
	nasm ipl.asm -o ipl.bin -l ipl.lst

haribote.sys : haribote.asm Makefile
	nasm haribote.asm -o haribote.sys -l haribote.lst

haribote.img : ipl.bin haribote.sys Makefile
	dd if=/dev/zero of=haribote.img count=2880
	dd if=ipl.bin of=haribote.img count=1 conv=notrunc
	mkdir -p /tmp/disk
	sudo mount -o loop haribote.img /tmp/disk
	sudo cp haribote.sys /tmp/disk
	sudo umount /tmp/disk

# 其他指令

img :
	make -r haribote.img

run :
	make img
	qemu-system-i386 -L . -m 32m -rtc \
		base=localtime -vga std -hda haribote.img

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
