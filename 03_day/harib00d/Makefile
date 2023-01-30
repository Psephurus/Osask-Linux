
# 默认动作

default :
	make img

# 镜像文件生成

ipl.bin : ipl.asm Makefile
	nasm ipl.asm -o ipl.bin -l ipl.lst

haribote.img : ipl.bin Makefile
	dd if=ipl.bin of=haribote.img count=1
	dd if=/dev/zero of=haribote.img \
		seek=1 skip=1 count=2879

# 其他指令

ipl :
	make -r ipl.bin

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
	-rm ipl.bin
	-rm ipl.lst

src_only :
	make clean
	-rm *.img
