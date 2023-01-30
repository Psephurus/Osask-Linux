[SECTION .data]	; 数据在此
    DB 0

[SECTION .text]	; 代码在此

GLOBAL io_hlt	; 我们必须导出 _start 这个入口，以便让链接器识别

io_hlt:
    HLT
    RET