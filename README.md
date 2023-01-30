# Osask-Linux
《30天自制操作系统》原书代码Linux版本

# 测试环境
  * 操作系统：UOS V22.0 (Debian 11)

# 环境依赖

- GNU Make
- Netwide Assembler (NASM)
- GNU Compiler Collection (GCC)
- QEMU

安装：`sudo apt install make nasm gcc qemu`

# 运行方式

1. 进入计算机 BIOS (F12/ESC)，关闭 Secure Boot，开启 CSM Support
2. 使用磁盘管理工具（或 `df -h`）查看U盘挂载位置，例如 `/dev/sdc`
3. 替换文件中的U盘路径
- 使用`SED`：```sed -i "s/<old_path>/<new_path>/g"  `grep <old_path> -rl <search_path>` ```
- 例如，`原路径`为`/dev/sdb`，`实际路径`为`/dev/sdc`，`执行文件夹`为`当前目录`。替换命令为：```sed -i "s/dev\/sdb/dev\/sdc/g"  `grep dev/sdb -rl ./` ```
