void io_hlt(void);

void HairMain(void)
{

fin:
    /* 这里想写上HLT，但C语言中不能用HLT！ */
    goto fin;

}
