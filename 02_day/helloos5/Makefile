
# 默认动作

default :
	make img

# 镜像文件生成

ipl.bin : ipl.asm Makefile
	nasm ipl.asm -o ipl.bin -l ipl.lst

helloos.img : ipl.bin Makefile
	dd if=ipl.bin of=helloos.img count=1
	dd if=/dev/zero of=helloos.img \
		seek=1 skip=1 count=2879

# 其他指令

ipl :
	make -r ipl.bin

img :
	make -r helloos.img

run :
	make img
	qemu-system-i386 -L . -m 32m -rtc \
		base=localtime -vga std -hda helloos.img

install:
	make helloos.img
	sudo dd if=helloos.img of=/dev/sdb count=1

clean :
	-rm ipl.bin
	-rm ipl.lst

src_only :
	make clean
	-rm helloos.img
