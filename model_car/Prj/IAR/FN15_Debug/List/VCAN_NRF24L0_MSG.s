///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       21/Mar/2017  16:05:44
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        E:\znc\project\K60FN\network_car\Board\src\VCAN_NRF24L0_MSG.c
//    Command line =  
//        E:\znc\project\K60FN\network_car\Board\src\VCAN_NRF24L0_MSG.c -D
//        DEBUG -D ARM_MATH_CM4 -D MK60F15 -D MK60FN15 -lA
//        E:\znc\project\K60FN\network_car\Prj\IAR\FN15_Debug\List\ -o
//        E:\znc\project\K60FN\network_car\Prj\IAR\FN15_Debug\Obj\ --no_cse
//        --no_unroll --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M4F -e
//        --char_is_signed --fpu=VFPv4_sp --dlib_config
//        E:\iar\arm\INC\c\DLib_Config_Full.h -I
//        E:\znc\project\K60FN\network_car\Prj\IAR\..\..\App\ -I
//        E:\znc\project\K60FN\network_car\Prj\IAR\..\..\App\Inc\ -I
//        E:\znc\project\K60FN\network_car\Prj\IAR\..\..\Board\Inc\ -I
//        E:\znc\project\K60FN\network_car\Prj\IAR\..\..\Chip\inc\ -I
//        E:\znc\project\K60FN\network_car\Prj\IAR\..\..\Chip\inc\IAR\ -I
//        E:\znc\project\K60FN\network_car\Prj\IAR\..\..\Chip\inc\kinetis\ -I
//        E:\znc\project\K60FN\network_car\Prj\IAR\..\..\Lib\CMSIS\Inc\ -I
//        E:\znc\project\K60FN\network_car\Prj\IAR\..\..\Lib\FatFs\ -I
//        E:\znc\project\K60FN\network_car\Prj\IAR\..\..\Lib\USB\ -On
//    List file    =  
//        E:\znc\project\K60FN\network_car\Prj\IAR\FN15_Debug\List\VCAN_NRF24L0_MSG.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "1"
        RTMODEL "__dlib_full_locale_support", "1"
        AAPCS BASE,INTERWORK,VFP
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN assert_failed
        EXTERN last_tab
        EXTERN nrf_rx
        EXTERN nrf_rx_fifo_check
        EXTERN nrf_tx
        EXTERN save_var
        EXTERN var_display

        PUBLIC nrf_com_size
        PUBLIC nrf_com_totalsize
        PUBLIC nrf_msg_init
        PUBLIC nrf_msg_rx
        PUBLIC nrf_msg_tx
        PUBLIC rxbuflen
        
          CFI Names cfiNames0
          CFI StackFrame CFA R13 DATA
          CFI Resource R0:32, R1:32, R2:32, R3:32, R4:32, R5:32, R6:32, R7:32
          CFI Resource R8:32, R9:32, R10:32, R11:32, R12:32, R13:32, R14:32
          CFI Resource D0:64, D1:64, D2:64, D3:64, D4:64, D5:64, D6:64, D7:64
          CFI Resource D8:64, D9:64, D10:64, D11:64, D12:64, D13:64, D14:64
          CFI Resource D15:64
          CFI EndNames cfiNames0
        
          CFI Common cfiCommon0 Using cfiNames0
          CFI CodeAlign 2
          CFI DataAlign 4
          CFI ReturnAddress R14 CODE
          CFI CFA R13+0
          CFI R0 Undefined
          CFI R1 Undefined
          CFI R2 Undefined
          CFI R3 Undefined
          CFI R4 SameValue
          CFI R5 SameValue
          CFI R6 SameValue
          CFI R7 SameValue
          CFI R8 SameValue
          CFI R9 SameValue
          CFI R10 SameValue
          CFI R11 SameValue
          CFI R12 Undefined
          CFI R14 SameValue
          CFI D0 Undefined
          CFI D1 Undefined
          CFI D2 Undefined
          CFI D3 Undefined
          CFI D4 Undefined
          CFI D5 Undefined
          CFI D6 Undefined
          CFI D7 Undefined
          CFI D8 SameValue
          CFI D9 SameValue
          CFI D10 SameValue
          CFI D11 SameValue
          CFI D12 SameValue
          CFI D13 SameValue
          CFI D14 SameValue
          CFI D15 SameValue
          CFI EndCommon cfiCommon0
        
// E:\znc\project\K60FN\network_car\Board\src\VCAN_NRF24L0_MSG.c
//    1 #include "common.h"
//    2 #include "MK60_gpio.h"
//    3 #include "MK60_port.h"
//    4 #include "MK60_spi.h"
//    5 #include "VCAN_camera.h"
//    6 #include "VCAN_NRF24L0.h"
//    7 #include "VCAN_NRF24L0_MSG.h"
//    8 #include "VCAN_TSL1401.h"
//    9 
//   10 /**************************** 变量接收与发送 **********************************/
//   11 
//   12 
//   13 
//   14 
//   15 /**************************** 变量接收与发送 **********************************/
//   16 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   17 uint32 rxbuflen = 0;           //用于接收方返回接收到多少数据。（包含第一次传递进去的那个包大小）
rxbuflen:
        DS8 4

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_0:
        DATA
        DC8 45H, 3AH, 5CH, 7AH, 6EH, 63H, 5CH, 70H
        DC8 72H, 6FH, 6AH, 65H, 63H, 74H, 5CH, 4BH
        DC8 36H, 30H, 46H, 4EH, 5CH, 6EH, 65H, 74H
        DC8 77H, 6FH, 72H, 6BH, 5FH, 63H, 61H, 72H
        DC8 5CH, 42H, 6FH, 61H, 72H, 64H, 5CH, 73H
        DC8 72H, 63H, 5CH, 56H, 43H, 41H, 4EH, 5FH
        DC8 4EH, 52H, 46H, 32H, 34H, 4CH, 30H, 5FH
        DC8 4DH, 53H, 47H, 2EH, 63H, 0
        DC8 0, 0
//   18 
//   19 

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//   20 const uint32 nrf_com_size[COM_MAX] = {CAMERA_SIZE , TSL1401_MAX *TSL1401_SIZE , 8, 0};
nrf_com_size:
        DATA
        DC32 600, 384, 8, 0
//   21 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   22 uint32 nrf_com_totalsize[COM_MAX];                                                                  // 所占用 包 的 总 占用空间
nrf_com_totalsize:
        DS8 16
//   23 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function nrf_msg_init
          CFI NoCalls
        THUMB
//   24 void nrf_msg_init()
//   25 {
//   26     uint32 i = COM_MAX;
nrf_msg_init:
        MOVS     R0,#+4
//   27 
//   28     while(i--)
??nrf_msg_init_0:
        MOVS     R1,R0
        SUBS     R0,R1,#+1
        CMP      R1,#+0
        BEQ.N    ??nrf_msg_init_1
//   29     {
//   30         nrf_com_totalsize[i] = (( nrf_com_size[i] + 2 * COM_LEN + DATA_PACKET - 1 ) / DATA_PACKET)  //求得包的数目
//   31                                *DATA_PACKET;                                                      //总共占用的空间
        LDR.N    R1,??DataTable2
        LDR      R1,[R1, R0, LSL #+2]
        ADDS     R1,R1,#+35
        LSRS     R1,R1,#+5
        LSLS     R1,R1,#+5
        LDR.N    R2,??DataTable2_1
        STR      R1,[R2, R0, LSL #+2]
        B.N      ??nrf_msg_init_0
//   32     }
//   33 
//   34 }
??nrf_msg_init_1:
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
//   35 
//   36 
//   37 //发送命令。前两个字节用在命令识别，后面就是需要传输的内容

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function nrf_msg_tx
        THUMB
//   38 nrf_result_e nrf_msg_tx(com_e  com, uint8 *sendbuf)
//   39 {
nrf_msg_tx:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
//   40     ASSERT(com < COM_MAX);          //命令不能超过最大的数目
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+4
        BLT.N    ??nrf_msg_tx_0
        MOVS     R1,#+40
        LDR.N    R0,??DataTable2_2
          CFI FunCall assert_failed
        BL       assert_failed
//   41 
//   42     //把命令写进数据缓冲区
//   43     sendbuf[0] =  com;
??nrf_msg_tx_0:
        STRB     R4,[R5, #+0]
//   44     sendbuf[1] = ~com;
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        MVNS     R0,R4
        STRB     R0,[R5, #+1]
//   45     sendbuf[nrf_com_size[com] + 2 * COM_LEN - 2] = ~com;
        LDR.N    R0,??DataTable2
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        ADDS     R0,R0,R5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        MVNS     R1,R4
        STRB     R1,[R0, #+2]
//   46     sendbuf[nrf_com_size[com] + 2 * COM_LEN - 1] = com;
        LDR.N    R0,??DataTable2
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        ADDS     R0,R0,R5
        STRB     R4,[R0, #+3]
//   47 
//   48     while( !nrf_tx(sendbuf , nrf_com_size[com] + 2 * COM_LEN)); //发送数据
??nrf_msg_tx_1:
        LDR.N    R0,??DataTable2
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        ADDS     R1,R0,#+4
        MOVS     R0,R5
          CFI FunCall nrf_tx
        BL       nrf_tx
        CMP      R0,#+0
        BEQ.N    ??nrf_msg_tx_1
//   49 
//   50     return NRF_RESULT_NULL;
        MOVS     R0,#+3
        POP      {R1,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock1
//   51 }
//   52 
//   53 //查询是否有接收数据，并进行处理。rebuf 为可供使用的缓冲区
//   54 //

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function nrf_msg_rx
        THUMB
//   55 nrf_result_e nrf_msg_rx(com_e  *com, uint8 *rebuf)
//   56 {
nrf_msg_rx:
        PUSH     {R3-R11,LR}
          CFI R14 Frame(CFA, -4)
          CFI R11 Frame(CFA, -8)
          CFI R10 Frame(CFA, -12)
          CFI R9 Frame(CFA, -16)
          CFI R8 Frame(CFA, -20)
          CFI R7 Frame(CFA, -24)
          CFI R6 Frame(CFA, -28)
          CFI R5 Frame(CFA, -32)
          CFI R4 Frame(CFA, -36)
          CFI CFA R13+40
        MOVS     R4,R0
        MOVS     R5,R1
//   57     com_e   comtmp;
//   58     uint32  len;
//   59     uint32  tmplen;
//   60     uint32  relen;                              //接收到的数据长度
//   61     uint8   *buftemp;
//   62 
//   63     uint32  totallen ;                          //总需要接收包的数目(包的整数倍)
//   64     uint16  tmpcheck;
//   65 
//   66 RE_LOOP:
//   67     buftemp = rebuf;                            //加载起始地址
??nrf_msg_rx_0:
        MOV      R10,R5
//   68 
//   69     relen = nrf_rx(buftemp, DATA_PACKET);       //接收 第一个包
        MOVS     R1,#+32
        MOV      R0,R10
          CFI FunCall nrf_rx
        BL       nrf_rx
        MOV      R9,R0
//   70     if(relen == 0)
        CMP      R9,#+0
        BNE.N    ??nrf_msg_rx_1
//   71     {
//   72         //如果是 预校验 失败，那么 肯定可以接收到数据，不会进入此处
//   73 
//   74         //只有 一开始 进入函数 第一次接收的时候，才出现接收失败
//   75 
//   76         return NRF_RESULT_RX_NO;                //没接收到数据
        MOVS     R0,#+4
        B.N      ??nrf_msg_rx_2
//   77     }
//   78 
//   79     comtmp = (com_e)buftemp[0];
??nrf_msg_rx_1:
        LDRSB    R0,[R10, #+0]
        MOVS     R6,R0
//   80     if(((uint8)comtmp < (uint8)COM_MAX) && (buftemp[1] ==  (uint8)~comtmp) && (comtmp != COM_RETRAN) )
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+4
        BGE.N    ??nrf_msg_rx_3
        LDRB     R0,[R10, #+1]
        MVNS     R1,R6
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R0,R1
        BNE.N    ??nrf_msg_rx_3
        SXTB     R6,R6            ;; SignExt  R6,R6,#+24,#+24
        CMP      R6,#+3
        BEQ.N    ??nrf_msg_rx_3
//   81     {
//   82         //校验正确,继续接收剩余 的数据
//   83 
//   84         totallen = nrf_com_totalsize[comtmp];   //总接收参数
        LDR.N    R0,??DataTable2_1
        SXTB     R6,R6            ;; SignExt  R6,R6,#+24,#+24
        LDR      R0,[R0, R6, LSL #+2]
        MOV      R11,R0
//   85 
//   86         if(totallen > relen )                   //数据长度 超过 已接收长度
        CMP      R9,R11
        BCS.N    ??nrf_msg_rx_4
//   87         {
//   88             //需要继续接收
//   89             len = totallen - relen;             //剩余接收的 长度
        SUBS     R0,R11,R9
        MOVS     R7,R0
//   90 
//   91             //等待接收FIFO里的数据校验正确才接收
//   92             while( !nrf_rx_fifo_check(nrf_com_size[comtmp] + 2 * COM_LEN - relen,&tmpcheck)  );   //等待接收
??nrf_msg_rx_5:
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable2
        SXTB     R6,R6            ;; SignExt  R6,R6,#+24,#+24
        LDR      R0,[R0, R6, LSL #+2]
        ADDS     R0,R0,#+4
        SUBS     R0,R0,R9
          CFI FunCall nrf_rx_fifo_check
        BL       nrf_rx_fifo_check
        CMP      R0,#+0
        BEQ.N    ??nrf_msg_rx_5
//   93             if( tmpcheck !=  (uint16)((uint8)~comtmp + (comtmp<<8)))
        LDRH     R0,[SP, #+0]
        MVNS     R1,R6
        SXTB     R6,R6            ;; SignExt  R6,R6,#+24,#+24
        LSLS     R2,R6,#+8
        UXTAB    R1,R2,R1
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R0,R1
        BNE.N    ??nrf_msg_rx_0
//   94             {
//   95                 goto RE_LOOP;                   //校验失败 ，放弃刚才接收的 第一个 包 （重新接收数据）
//   96             }
//   97 
//   98             tmplen = relen;
??nrf_msg_rx_6:
        MOV      R8,R9
//   99             do
//  100             {
//  101                 buftemp += tmplen;              //移动到尚未接收数据的缓冲区
??nrf_msg_rx_7:
        ADDS     R10,R8,R10
//  102                 tmplen = nrf_rx(buftemp, len);  //接收数据
        MOVS     R1,R7
        MOV      R0,R10
          CFI FunCall nrf_rx
        BL       nrf_rx
        MOV      R8,R0
//  103                 //relen += tmplen;
//  104                 len -= tmplen;
        SUBS     R7,R7,R8
//  105             }
//  106             while(len);
        CMP      R7,#+0
        BNE.N    ??nrf_msg_rx_7
//  107         }
//  108 
//  109         //校验尾部数据是否正确
//  110         if(
//  111             (rebuf[nrf_com_size[comtmp] + 2 * COM_LEN - 2] ==   (uint8)~comtmp)
//  112             &&  (rebuf[nrf_com_size[comtmp] + 2 * COM_LEN - 1] ==   (uint8) comtmp)   )
??nrf_msg_rx_4:
        LDR.N    R0,??DataTable2
        SXTB     R6,R6            ;; SignExt  R6,R6,#+24,#+24
        LDR      R0,[R0, R6, LSL #+2]
        ADDS     R0,R0,R5
        LDRB     R0,[R0, #+2]
        MVNS     R1,R6
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R0,R1
        BNE.N    ??nrf_msg_rx_3
        LDR.N    R0,??DataTable2
        SXTB     R6,R6            ;; SignExt  R6,R6,#+24,#+24
        LDR      R0,[R0, R6, LSL #+2]
        ADDS     R0,R0,R5
        LDRB     R0,[R0, #+3]
        MOVS     R1,R6
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R0,R1
        BNE.N    ??nrf_msg_rx_3
//  113         {
//  114             *com = comtmp;                          //存储命令
        STRB     R6,[R4, #+0]
//  115 
//  116             //对 命令 数据进行 处理
//  117             switch(*com)
        LDRSB    R0,[R4, #+0]
        CMP      R0,#+2
        BNE.N    ??nrf_msg_rx_8
//  118             {
//  119             case COM_VAR:
//  120                 last_tab = *((uint32 *)&rebuf[COM_LEN]);                                    //读取变量编号
        LDR      R0,[R5, #+2]
        LDR.N    R1,??DataTable2_3
        STR      R0,[R1, #+0]
//  121                 if(last_tab < VAR_MAX)
        LDR.N    R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        CMP      R0,#+7
        BCS.N    ??nrf_msg_rx_9
//  122                 {
//  123                     save_var((var_tab_e)last_tab, *((uint32 *)&rebuf[COM_LEN + sizeof(uint32)]));          //存储 变量
        LDR      R1,[R5, #+6]
        LDR.N    R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
          CFI FunCall save_var
        BL       save_var
//  124                     var_display(last_tab);                                                  //显示 变量
        LDR.N    R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall var_display
        BL       var_display
//  125                 }
//  126                 else
//  127                 {
//  128                     return NRF_RESULT_RX_NOVALID;
//  129                 }
//  130                 break;
        B.N      ??nrf_msg_rx_10
??nrf_msg_rx_9:
        MOVS     R0,#+6
        B.N      ??nrf_msg_rx_2
//  131             default:
//  132                 break;
//  133             }
//  134 
//  135             return NRF_RESULT_RX_VALID;             //接收有效数据
??nrf_msg_rx_8:
??nrf_msg_rx_10:
        MOVS     R0,#+5
        B.N      ??nrf_msg_rx_2
//  136         }
//  137     }
//  138 
//  139     //有接收到数据，但接收数据无效
//  140     return NRF_RESULT_RX_NOVALID;
??nrf_msg_rx_3:
        MOVS     R0,#+6
??nrf_msg_rx_2:
        POP      {R1,R4-R11,PC}   ;; return
          CFI EndBlock cfiBlock2
//  141 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     nrf_com_size

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     nrf_com_totalsize

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     ?_0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     last_tab

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  142 
//  143 
//  144 
// 
//  20 bytes in section .bss
//  80 bytes in section .rodata
// 384 bytes in section .text
// 
// 384 bytes of CODE  memory
//  80 bytes of CONST memory
//  20 bytes of DATA  memory
//
//Errors: none
//Warnings: none
