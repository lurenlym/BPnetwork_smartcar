///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       21/Mar/2017  16:05:04
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\znc\project\K60FN\network_car\Chip\src\MK60_sdhc.c
//    Command line =  
//        E:\znc\project\K60FN\network_car\Chip\src\MK60_sdhc.c -D DEBUG -D
//        ARM_MATH_CM4 -D MK60F15 -D MK60FN15 -lA
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
//        E:\znc\project\K60FN\network_car\Prj\IAR\FN15_Debug\List\MK60_sdhc.s
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
        EXTERN core_clk_khz
        EXTERN port_init
        EXTERN systick_delay_ms

        PUBLIC ESDHC_COMMAND_XFERTYP
        PUBLIC SDHC_card
        PUBLIC SDHC_cmd
        PUBLIC SDHC_init
        PUBLIC SDHC_ioctl
        PUBLIC SDHC_set_baudrate
        
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
        
// E:\znc\project\K60FN\network_car\Chip\src\MK60_sdhc.c
//    1 /*!
//    2  *     COPYRIGHT NOTICE
//    3  *     Copyright (c) 2013,山外科技
//    4  *     All rights reserved.
//    5  *     技术讨论：山外论坛 http://www.vcan123.com
//    6  *
//    7  *     除注明出处外，以下所有内容版权均属山外科技所有，未经允许，不得用于商业用途，
//    8  *     修改内容时必须保留山外科技的版权声明。
//    9  *
//   10  *     本驱动由brtos代码提取并修改而成:http://code.google.com/p/brtos/downloads/detail?name=BRTOS%201.66%20Kinetis%20-%20SD%20card%20-%20BMP%2024%20bit.rar&can=2&q=
//   11  *
//   12  * @file       MK60_sdhc.c
//   13  * @brief      SD模块函数
//   14  * @author     山外科技 & gustavo(brtos作者)
//   15  * @version    v5.0
//   16  * @date       2013-09-19
//   17  */
//   18 
//   19 
//   20 #include "common.h"
//   21 #include "MK60_sdhc.h"
//   22 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   23 SDCARD_t        SDHC_card;
SDHC_card:
        DS8 20

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_0:
        DATA
        DC8 45H, 3AH, 5CH, 7AH, 6EH, 63H, 5CH, 70H
        DC8 72H, 6FH, 6AH, 65H, 63H, 74H, 5CH, 4BH
        DC8 36H, 30H, 46H, 4EH, 5CH, 6EH, 65H, 74H
        DC8 77H, 6FH, 72H, 6BH, 5FH, 63H, 61H, 72H
        DC8 5CH, 43H, 68H, 69H, 70H, 5CH, 73H, 72H
        DC8 63H, 5CH, 4DH, 4BH, 36H, 30H, 5FH, 73H
        DC8 64H, 68H, 63H, 2EH, 63H, 0
        DC8 0, 0
//   24 
//   25 
//   26 //SD卡命令

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//   27 const uint32 ESDHC_COMMAND_XFERTYP[] =
ESDHC_COMMAND_XFERTYP:
        DATA
        DC32 0, 16777216, 34144256, 52035584, 67108864, 84017152, 102367232
        DC32 119209984, 135921664, 151584768, 168361984, 186253312, 215678976
        DC32 219807744, 4294967295, 251658240, 270139392, 286916608, 303693828
        DC32 4294967295, 337248256, 4294967295, 370802688, 387579904, 404357120
        DC32 421134340, 437911552, 454688768, 471531520, 488308736, 505020416
        DC32 4294967295, 538574848, 555352064, 572129280, 588906496, 605683712
        DC32 622460928, 639303680, 654442496, 672792576, 687996928, 706412544
        DC32 4294967295, 4294967295, 4294967295, 4294967295, 4294967295
        DC32 4294967295, 4294967295, 4294967295, 857341952, 874119168
        DC32 890896384, 4294967295, 924450816, 941293568, 4294967295
        DC32 4294967295, 4294967295, 1008402432, 1025179648, 4294967295
        DC32 4294967295
//   28 {
//   29     /* CMD0 */
//   30     SDHC_XFERTYP_CMDINX(ESDHC_CMD0) | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_NO),
//   31     SDHC_XFERTYP_CMDINX(ESDHC_CMD1) | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_NO),
//   32     SDHC_XFERTYP_CMDINX(ESDHC_CMD2) | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_136),
//   33     SDHC_XFERTYP_CMDINX(ESDHC_CMD3) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//   34     SDHC_XFERTYP_CMDINX(ESDHC_CMD4) | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_NO),
//   35     /* CMD5 */
//   36     SDHC_XFERTYP_CMDINX(ESDHC_CMD5) | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//   37     SDHC_XFERTYP_CMDINX(ESDHC_CMD6) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//   38     SDHC_XFERTYP_CMDINX(ESDHC_CMD7) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48BUSY),
//   39     SDHC_XFERTYP_CMDINX(ESDHC_CMD8) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//   40     SDHC_XFERTYP_CMDINX(ESDHC_CMD9) | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_136),
//   41     /* CMD10 */
//   42     SDHC_XFERTYP_CMDINX(ESDHC_CMD10) | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_136),
//   43     SDHC_XFERTYP_CMDINX(ESDHC_CMD11) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//   44     SDHC_XFERTYP_CMDINX(ESDHC_CMD12) | SDHC_XFERTYP_CMDTYP(ESDHC_XFERTYP_CMDTYP_ABORT) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48BUSY),
//   45     SDHC_XFERTYP_CMDINX(ESDHC_CMD13) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//   46     ~0,
//   47     /* CMD15 */
//   48     SDHC_XFERTYP_CMDINX(ESDHC_CMD15) | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_NO),
//   49     SDHC_XFERTYP_CMDINX(ESDHC_CMD16) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//   50     SDHC_XFERTYP_CMDINX(ESDHC_CMD17) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//   51     SDHC_XFERTYP_CMDINX(ESDHC_CMD18) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48)| SDHC_XFERTYP_AC12EN_MASK,
//   52     ~0,
//   53     /* CMD20 */
//   54     SDHC_XFERTYP_CMDINX(ESDHC_CMD20) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//   55     ~0,
//   56     SDHC_XFERTYP_CMDINX(ESDHC_ACMD22) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//   57     SDHC_XFERTYP_CMDINX(ESDHC_ACMD23) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//   58     SDHC_XFERTYP_CMDINX(ESDHC_CMD24) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//   59     /* CMD25 */
//   60     SDHC_XFERTYP_CMDINX(ESDHC_CMD25) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48) | SDHC_XFERTYP_AC12EN_MASK,
//   61     SDHC_XFERTYP_CMDINX(ESDHC_CMD26) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//   62     SDHC_XFERTYP_CMDINX(ESDHC_CMD27) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//   63     SDHC_XFERTYP_CMDINX(ESDHC_CMD28) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48BUSY),
//   64     SDHC_XFERTYP_CMDINX(ESDHC_CMD29) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48BUSY),
//   65     /* CMD30 */
//   66     SDHC_XFERTYP_CMDINX(ESDHC_CMD30) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//   67     ~0,
//   68     SDHC_XFERTYP_CMDINX(ESDHC_CMD32) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//   69     SDHC_XFERTYP_CMDINX(ESDHC_CMD33) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//   70     SDHC_XFERTYP_CMDINX(ESDHC_CMD34) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//   71     /* CMD35 */
//   72     SDHC_XFERTYP_CMDINX(ESDHC_CMD35) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//   73     SDHC_XFERTYP_CMDINX(ESDHC_CMD36) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//   74     SDHC_XFERTYP_CMDINX(ESDHC_CMD37) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//   75     SDHC_XFERTYP_CMDINX(ESDHC_CMD38) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48BUSY),
//   76     SDHC_XFERTYP_CMDINX(ESDHC_CMD39) | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//   77     /* CMD40 */
//   78     SDHC_XFERTYP_CMDINX(ESDHC_CMD40) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//   79     SDHC_XFERTYP_CMDINX(ESDHC_ACMD41) | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//   80     SDHC_XFERTYP_CMDINX(ESDHC_CMD42) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48BUSY),
//   81     ~0,
//   82     ~0,
//   83     /* CMD45 */
//   84     ~0,
//   85     ~0,
//   86     ~0,
//   87     ~0,
//   88     ~0,
//   89     /* CMD50 */
//   90     ~0,
//   91     SDHC_XFERTYP_CMDINX(ESDHC_ACMD51) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//   92     SDHC_XFERTYP_CMDINX(ESDHC_CMD52) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//   93     SDHC_XFERTYP_CMDINX(ESDHC_CMD53) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//   94     ~0,
//   95     /* CMD55 */
//   96     SDHC_XFERTYP_CMDINX(ESDHC_CMD55) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48),
//   97     SDHC_XFERTYP_CMDINX(ESDHC_CMD56) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48BUSY),
//   98     ~0,
//   99     ~0,
//  100     ~0,
//  101     /* CMD60 */
//  102     SDHC_XFERTYP_CMDINX(ESDHC_CMD60) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48BUSY),
//  103     SDHC_XFERTYP_CMDINX(ESDHC_CMD61) | SDHC_XFERTYP_CICEN_MASK | SDHC_XFERTYP_CCCEN_MASK | SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48BUSY),
//  104     ~0,
//  105     ~0
//  106 };
//  107 
//  108 #define SDHC_CMD_MAX    ARR_SIZE( ESDHC_COMMAND_XFERTYP )
//  109 
//  110 
//  111 
//  112 /*!
//  113  *  @brief      SDHC初始化(仅初始化模块，不初始化SD卡)
//  114  *  @since      v5.0
//  115  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function SDHC_init
        THUMB
//  116 void SDHC_init()
//  117 {
SDHC_init:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  118 
//  119     SDHC_card.CARD = ESDHC_CARD_NONE;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3
        STR      R0,[R1, #+0]
//  120 
//  121 #if defined( MK60DZ10)
//  122     /* 使能 SDHC 模块时钟 */
//  123     SIM_SCGC3 |= SIM_SCGC3_SDHC_MASK;
//  124 
//  125 #elif defined( MK60F15)
//  126     /* 使能 SDHC 模块时钟 */
//  127     SIM_SCGC3 |= SIM_SCGC3_ESDHC_MASK;
        LDR.W    R0,??DataTable3_1  ;; 0x40048030
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20000
        LDR.W    R1,??DataTable3_1  ;; 0x40048030
        STR      R0,[R1, #+0]
//  128 #endif
//  129 
//  130     /* 复位 ESDHC */
//  131     SDHC_SYSCTL = SDHC_SYSCTL_RSTA_MASK | SDHC_SYSCTL_SDCLKFS(0x80);
        LDR.W    R0,??DataTable3_2  ;; 0x1008000
        LDR.W    R1,??DataTable3_3  ;; 0x400b102c
        STR      R0,[R1, #+0]
//  132     while (SDHC_SYSCTL & SDHC_SYSCTL_RSTA_MASK) {};
??SDHC_init_0:
        LDR.W    R0,??DataTable3_3  ;; 0x400b102c
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+7
        BMI.N    ??SDHC_init_0
//  133 
//  134     /* 初始化值 */
//  135     SDHC_VENDOR     = 0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_4  ;; 0x400b10c0
        STR      R0,[R1, #+0]
//  136     SDHC_BLKATTR    = SDHC_BLKATTR_BLKCNT(1) | SDHC_BLKATTR_BLKSIZE(512);
        MOVS     R0,#+66048
        LDR.W    R1,??DataTable3_5  ;; 0x400b1004
        STR      R0,[R1, #+0]
//  137     SDHC_PROCTL     = SDHC_PROCTL_EMODE(ESDHC_PROCTL_EMODE_INVARIANT) | SDHC_PROCTL_D3CD_MASK;
        MOVS     R0,#+40
        LDR.W    R1,??DataTable3_6  ;; 0x400b1028
        STR      R0,[R1, #+0]
//  138     SDHC_WML        = SDHC_WML_RDWML(1) | SDHC_WML_WRWML(1);
        MOVS     R0,#+65537
        LDR.W    R1,??DataTable3_7  ;; 0x400b1044
        STR      R0,[R1, #+0]
//  139 
//  140     /* 配置 ESDHC 波特率 */
//  141     SDHC_set_baudrate ( SDHC_INIT_BANDRATE );
        LDR.W    R0,??DataTable3_8  ;; 0x493e0
          CFI FunCall SDHC_set_baudrate
        BL       SDHC_set_baudrate
//  142 
//  143     /* Poll inhibit bits */
//  144     while (SDHC_PRSSTAT & (SDHC_PRSSTAT_CIHB_MASK | SDHC_PRSSTAT_CDIHB_MASK)) {};
??SDHC_init_1:
        LDR.W    R0,??DataTable3_9  ;; 0x400b1024
        LDR      R0,[R0, #+0]
        TST      R0,#0x3
        BNE.N    ??SDHC_init_1
//  145 
//  146     /* 初始化管脚复用 */
//  147     port_init(PTE0, ALT4 | HDS | PULLUP ); /* ESDHC.D1  */
        MOVW     R1,#+1091
        MOVS     R0,#+128
          CFI FunCall port_init
        BL       port_init
//  148     port_init(PTE1, ALT4 | HDS | PULLUP ); /* ESDHC.D0  */
        MOVW     R1,#+1091
        MOVS     R0,#+129
          CFI FunCall port_init
        BL       port_init
//  149     port_init(PTE2, ALT4 | HDS          ); /* ESDHC.CLK */
        MOV      R1,#+1088
        MOVS     R0,#+130
          CFI FunCall port_init
        BL       port_init
//  150     port_init(PTE3, ALT4 | HDS | PULLUP ); /* ESDHC.CMD */
        MOVW     R1,#+1091
        MOVS     R0,#+131
          CFI FunCall port_init
        BL       port_init
//  151     port_init(PTE4, ALT4 | HDS | PULLUP ); /* ESDHC.D3  */
        MOVW     R1,#+1091
        MOVS     R0,#+132
          CFI FunCall port_init
        BL       port_init
//  152     port_init(PTE5, ALT4 | HDS | PULLUP ); /* ESDHC.D2  */
        MOVW     R1,#+1091
        MOVS     R0,#+133
          CFI FunCall port_init
        BL       port_init
//  153 
//  154     /* 使能请求 */
//  155     SDHC_IRQSTAT = 0xFFFF;
        MOVW     R0,#+65535
        LDR.W    R1,??DataTable3_10  ;; 0x400b1030
        STR      R0,[R1, #+0]
//  156     SDHC_IRQSTATEN =      SDHC_IRQSTATEN_DEBESEN_MASK | SDHC_IRQSTATEN_DCESEN_MASK | SDHC_IRQSTATEN_DTOESEN_MASK
//  157                           | SDHC_IRQSTATEN_CIESEN_MASK | SDHC_IRQSTATEN_CEBESEN_MASK | SDHC_IRQSTATEN_CCESEN_MASK | SDHC_IRQSTATEN_CTOESEN_MASK
//  158                           | SDHC_IRQSTATEN_BRRSEN_MASK | SDHC_IRQSTATEN_BWRSEN_MASK | SDHC_IRQSTATEN_CRMSEN_MASK
//  159                           | SDHC_IRQSTATEN_TCSEN_MASK | SDHC_IRQSTATEN_CCSEN_MASK;
        LDR.W    R0,??DataTable3_11  ;; 0x7f00b3
        LDR.W    R1,??DataTable3_12  ;; 0x400b1034
        STR      R0,[R1, #+0]
//  160 
//  161     /* 发送 80 个 最初的时钟周期 到卡上，卡上电期间是需要用到 */
//  162     SDHC_SYSCTL |= SDHC_SYSCTL_INITA_MASK;
        LDR.W    R0,??DataTable3_3  ;; 0x400b102c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8000000
        LDR.W    R1,??DataTable3_3  ;; 0x400b102c
        STR      R0,[R1, #+0]
//  163     while (SDHC_SYSCTL & SDHC_SYSCTL_INITA_MASK) {};        //等待 80个SD周期发送完成
??SDHC_init_2:
        LDR.W    R0,??DataTable3_3  ;; 0x400b102c
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+4
        BMI.N    ??SDHC_init_2
//  164 
//  165     /* 检测 卡是否插入 */
//  166     if (SDHC_PRSSTAT & SDHC_PRSSTAT_CINS_MASK)              // CINS 字段 由 0变1表示插入卡，由1变0表示拔出卡
        LDR.W    R0,??DataTable3_9  ;; 0x400b1024
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+15
        BPL.N    ??SDHC_init_3
//  167     {
//  168         SDHC_card.CARD = ESDHC_CARD_UNKNOWN;          //插入了卡，类型未知
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3
        STR      R0,[R1, #+0]
//  169     }
//  170     SDHC_IRQSTAT |= SDHC_IRQSTAT_CRM_MASK;                  //写1清 CRM 标志位。0表示插入卡，1表示移除卡。写1清0后，卡还是没有插入，则恢复值为1
??SDHC_init_3:
        LDR.W    R0,??DataTable3_10  ;; 0x400b1030
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80
        LDR.W    R1,??DataTable3_10  ;; 0x400b1030
        STR      R0,[R1, #+0]
//  171 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock0
//  172 
//  173 
//  174 
//  175 
//  176 /*!
//  177  *  @brief      SDHC波特率配置
//  178  *  @param      baudrate    波特率(Hz)
//  179  *  @since      v5.0
//  180  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function SDHC_set_baudrate
          CFI NoCalls
        THUMB
//  181 void SDHC_set_baudrate(uint32 baudrate)
//  182 {
SDHC_set_baudrate:
        PUSH     {R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+20
//  183     uint32 pres, div, min, minpres = 0x80, mindiv = 0x0F;
        MOVS     R4,#+128
        MOVS     R5,#+15
//  184     int32  val;
//  185     uint32 clock = SDHC_CLOCK;
        LDR.W    R7,??DataTable3_13
        LDR      R7,[R7, #+0]
        MOV      R12,#+1000
        MUL      R7,R12,R7
//  186 
//  187     /* 计算最佳配置 */
//  188     //SDCLK 时钟频率 = 基时钟/(预分频器*除数)
//  189     //SD 时钟频率的最大值是 50MHz
//  190     //预分频 = 2,4,8,16,32,64,128,256  ,且 SDCLKFS = 预分频 >> 1;
//  191     //除数 = DVS + 1 ,DVS 的取值范围是 0~ 0xF
//  192     min = (uint32) - 1;                         //先把 min 配置为最大值
        MOVS     R12,#-1
        MOV      R3,R12
//  193     for (pres = 2; pres <= 256; pres <<= 1)     //pres 即 预分频器 prescaler
        MOVS     R12,#+2
        MOV      R1,R12
??SDHC_set_baudrate_0:
        CMP      R1,#+256
        BHI.N    ??SDHC_set_baudrate_1
//  194     {
//  195         for (div = 1; div <= 16; div++)         //div 即 除数Divisor
        MOVS     R12,#+1
        MOV      R2,R12
??SDHC_set_baudrate_2:
        CMP      R2,#+17
        BCS.N    ??SDHC_set_baudrate_3
//  196         {
//  197             val = pres * div * baudrate - clock;
        MUL      R12,R2,R1
        MUL      R12,R0,R12
        SUBS     R12,R12,R7
        MOV      R6,R12
//  198             if (val >= 0)                       //波特率 大于或等于 设定的目标值
        CMP      R6,#+0
        BMI.N    ??SDHC_set_baudrate_4
//  199             {
//  200                 if (min > val)                  //选择最接近 目标值 的
        CMP      R6,R3
        BCS.N    ??SDHC_set_baudrate_4
//  201                 {
//  202                     min = val;
        MOVS     R3,R6
//  203                     minpres = pres;
        MOVS     R4,R1
//  204                     mindiv = div;
        MOVS     R5,R2
//  205                 }
//  206             }
//  207         }
??SDHC_set_baudrate_4:
        ADDS     R2,R2,#+1
        B.N      ??SDHC_set_baudrate_2
//  208     }
??SDHC_set_baudrate_3:
        LSLS     R1,R1,#+1
        B.N      ??SDHC_set_baudrate_0
//  209 
//  210     /* 禁止 ESDHC 时钟 */
//  211     SDHC_SYSCTL &= (~ SDHC_SYSCTL_SDCLKEN_MASK);
??SDHC_set_baudrate_1:
        LDR.W    R12,??DataTable3_3  ;; 0x400b102c
        LDR      R12,[R12, #+0]
        BICS     R12,R12,#0x8
        LDR.W    LR,??DataTable3_3  ;; 0x400b102c
        STR      R12,[LR, #+0]
//  212 
//  213     /* 改变分频系数 */
//  214     SDHC_SYSCTL = (   (SDHC_SYSCTL & (~ (SDHC_SYSCTL_DTOCV_MASK | SDHC_SYSCTL_SDCLKFS_MASK | SDHC_SYSCTL_DVS_MASK)) ) //先 清 SDHC_SYSCTL 的 DTOCV 、SDCLKFS 、DVS 字段
//  215                       | SDHC_SYSCTL_DTOCV(0x0E)               //数据超时计数器值 = SDCLK x (DTOCV + 213)  ,DTOCV 的范围是 0 - 0x0E
//  216                       | SDHC_SYSCTL_SDCLKFS(minpres >> 1)     //SDCLK 频率选择 = 基时钟 / (1 << SDCLKFS )
//  217                       | SDHC_SYSCTL_DVS(mindiv - 1)
//  218 
//  219                   );
        LDR.W    R12,??DataTable3_3  ;; 0x400b102c
        LDR      R12,[R12, #+0]
        BFC      R12,#+4,#+16
        LSLS     LR,R4,#+7
        ANDS     LR,LR,#0xFF00
        ORRS     R12,LR,R12
        SUBS     LR,R5,#+1
        LSLS     LR,LR,#+4
        ANDS     LR,LR,#0xF0
        ORRS     R12,LR,R12
        ORRS     R12,R12,#0xE0000
        LDR.W    LR,??DataTable3_3  ;; 0x400b102c
        STR      R12,[LR, #+0]
//  220 
//  221     /* 等待 SD 时钟稳定  */
//  222     while (0 == (SDHC_PRSSTAT & SDHC_PRSSTAT_SDSTB_MASK));
??SDHC_set_baudrate_5:
        LDR.W    R12,??DataTable3_9  ;; 0x400b1024
        LDR      R12,[R12, #+0]
        LSLS     R12,R12,#+28
        BPL.N    ??SDHC_set_baudrate_5
//  223 
//  224 
//  225     /* 使能 ESDHC 时钟 */
//  226     SDHC_SYSCTL |= SDHC_SYSCTL_SDCLKEN_MASK;
        LDR.W    R12,??DataTable3_3  ;; 0x400b102c
        LDR      R12,[R12, #+0]
        ORRS     R12,R12,#0x8
        LDR.W    LR,??DataTable3_3  ;; 0x400b102c
        STR      R12,[LR, #+0]
//  227 
//  228     SDHC_IRQSTAT |= SDHC_IRQSTAT_DTOE_MASK;     //清 数据超时错误 标志
        LDR.W    R12,??DataTable3_10  ;; 0x400b1030
        LDR      R12,[R12, #+0]
        ORRS     R12,R12,#0x100000
        LDR.W    LR,??DataTable3_10  ;; 0x400b1030
        STR      R12,[LR, #+0]
//  229 }
        POP      {R4-R7,PC}       ;; return
          CFI EndBlock cfiBlock1
//  230 
//  231 
//  232 /*!
//  233  *  @brief      SDHC发送cmd命令
//  234  *  @param      command     命令
//  235  *  @return     发送命令结果，    0表示成功，1表示错误，-1 表示 超时
//  236  *  @since      v5.0
//  237  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function SDHC_cmd
        THUMB
//  238 uint32 SDHC_cmd (pESDHC_CMD_t command) /* [IN/OUT] Command specification */
//  239 {
SDHC_cmd:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
//  240     uint32  xfertyp;
//  241     uint32  blkattr;
//  242 
//  243     //ASSERT(SDHC_CMD_MAX > command->COMMAND  );      //断言，命令不能超过 SDHC_CMD_MAX
//  244 
//  245     /* 检查命令 */
//  246     xfertyp = ESDHC_COMMAND_XFERTYP[command->COMMAND ];
        LDR.W    R0,??DataTable3_14
        LDRB     R1,[R4, #+0]
        LDR      R0,[R0, R1, LSL #+2]
        MOVS     R5,R0
//  247 
//  248     ASSERT (~0 != xfertyp);                             //断言，合法的CMD,xfertyp 不能为 ~0
        CMN      R5,#+1
        BNE.N    ??SDHC_cmd_0
        MOVS     R1,#+248
        LDR.W    R0,??DataTable3_15
          CFI FunCall assert_failed
        BL       assert_failed
//  249 
//  250     /* 准备检测卡插拔状态 */
//  251     SDHC_IRQSTAT |= SDHC_IRQSTAT_CRM_MASK;
??SDHC_cmd_0:
        LDR.W    R0,??DataTable3_10  ;; 0x400b1030
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80
        LDR.W    R1,??DataTable3_10  ;; 0x400b1030
        STR      R0,[R1, #+0]
//  252 
//  253     /* 等待CMD 线空闲 */
//  254     while (SDHC_PRSSTAT & SDHC_PRSSTAT_CIHB_MASK) {};
??SDHC_cmd_1:
        LDR.W    R0,??DataTable3_9  ;; 0x400b1024
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+31
        BMI.N    ??SDHC_cmd_1
//  255 
//  256     /* 设置命令 */
//  257     SDHC_CMDARG = command->ARGUMENT;
        LDR      R0,[R4, #+4]
        LDR.W    R1,??DataTable3_16  ;; 0x400b1008
        STR      R0,[R1, #+0]
//  258     xfertyp &= (~ SDHC_XFERTYP_CMDTYP_MASK);
        BICS     R5,R5,#0xC00000
//  259     xfertyp |= SDHC_XFERTYP_CMDTYP(command->TYPE);
        LDRB     R0,[R4, #+1]
        LSLS     R0,R0,#+22
        ANDS     R0,R0,#0xC00000
        ORRS     R5,R0,R5
//  260     if (ESDHC_TYPE_RESUME == command->TYPE)     //恢复命令 必须 DPSEL 位 置位
        LDRB     R0,[R4, #+1]
        CMP      R0,#+2
        BNE.N    ??SDHC_cmd_2
//  261     {
//  262         xfertyp |= SDHC_XFERTYP_DPSEL_MASK;
        ORRS     R5,R5,#0x200000
//  263     }
//  264 
//  265     if (0 != command->BLOCKS)
??SDHC_cmd_2:
        LDR      R0,[R4, #+8]
        CMP      R0,#+0
        BEQ.N    ??SDHC_cmd_3
//  266     {
//  267         if ((xfertyp & SDHC_XFERTYP_RSPTYP_MASK) != SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_48BUSY))
        ANDS     R0,R5,#0x30000
        CMP      R0,#+196608
        BEQ.N    ??SDHC_cmd_4
//  268         {
//  269             xfertyp |= SDHC_XFERTYP_DPSEL_MASK;
        ORRS     R5,R5,#0x200000
//  270         }
//  271         if (command->READ)       //写数据
??SDHC_cmd_4:
        LDRB     R0,[R4, #+2]
        CMP      R0,#+0
        BEQ.N    ??SDHC_cmd_5
//  272         {
//  273            xfertyp |= SDHC_XFERTYP_DTDSEL_MASK;
        ORRS     R5,R5,#0x10
//  274         }
//  275         if (command->BLOCKS > 1)
??SDHC_cmd_5:
        LDR      R0,[R4, #+8]
        CMP      R0,#+2
        BCC.N    ??SDHC_cmd_6
//  276         {
//  277             xfertyp |= SDHC_XFERTYP_MSBSEL_MASK;
        ORRS     R5,R5,#0x20
//  278         }
//  279         if ((uint32) - 1 != command->BLOCKS)
??SDHC_cmd_6:
        LDR      R0,[R4, #+8]
        CMN      R0,#+1
        BEQ.N    ??SDHC_cmd_7
//  280         {
//  281             blkattr  = SDHC_BLKATTR_BLKCNT(command->BLOCKS) | SDHC_BLKATTR_BLKSIZE(SDCARD_BLOCK_SIZE);
        LDR      R0,[R4, #+8]
        LSLS     R0,R0,#+16
        ORRS     R0,R0,#0x200
        MOVS     R6,R0
//  282             xfertyp |= SDHC_XFERTYP_BCEN_MASK;
        ORRS     R5,R5,#0x2
        B.N      ??SDHC_cmd_8
//  283         }
//  284         else
//  285         {
//  286             blkattr = SDHC_BLKATTR_BLKCNT(0xFFFF)| SDHC_BLKATTR_BLKSIZE(SDCARD_BLOCK_SIZE) ;
??SDHC_cmd_7:
        LDR.W    R0,??DataTable3_17  ;; 0xffff0200
        MOVS     R6,R0
        B.N      ??SDHC_cmd_8
//  287         }
//  288     }
//  289     else
//  290     {
//  291         blkattr = 0;
??SDHC_cmd_3:
        MOVS     R0,#+0
        MOVS     R6,R0
//  292     }
//  293 
//  294     SDHC_BLKATTR = blkattr;
??SDHC_cmd_8:
        LDR.W    R0,??DataTable3_5  ;; 0x400b1004
        STR      R6,[R0, #+0]
//  295 
//  296 
//  297     /* 发出命令 */
//  298     SDHC_DSADDR = 0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_18  ;; 0x400b1000
        STR      R0,[R1, #+0]
//  299     SDHC_XFERTYP = xfertyp;
        LDR.W    R0,??DataTable3_19  ;; 0x400b100c
        STR      R5,[R0, #+0]
//  300 
//  301     /* 等待回应 */
//  302     SDHC_STATUS_WAIT (SDHC_IRQSTAT_CIE_MASK | SDHC_IRQSTAT_CEBE_MASK | SDHC_IRQSTAT_CCE_MASK | SDHC_IRQSTAT_CC_MASK);
??SDHC_cmd_9:
        LDR.W    R0,??DataTable3_10  ;; 0x400b1030
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable3_20  ;; 0xe0001
        TST      R0,R1
        BEQ.N    ??SDHC_cmd_9
//  303     if (SDHC_STATUS_GET(SDHC_IRQSTAT_CIE_MASK | SDHC_IRQSTAT_CEBE_MASK | SDHC_IRQSTAT_CCE_MASK | SDHC_IRQSTAT_CC_MASK) != SDHC_IRQSTAT_CC_MASK)
        LDR.W    R0,??DataTable3_10  ;; 0x400b1030
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable3_20  ;; 0xe0001
        ANDS     R0,R1,R0
        CMP      R0,#+1
        BEQ.N    ??SDHC_cmd_10
//  304     {
//  305         SDHC_IRQSTAT |= SDHC_IRQSTAT_CTOE_MASK | SDHC_IRQSTAT_CIE_MASK | SDHC_IRQSTAT_CEBE_MASK | SDHC_IRQSTAT_CCE_MASK | SDHC_IRQSTAT_CC_MASK;
        LDR.W    R0,??DataTable3_10  ;; 0x400b1030
        LDR      R0,[R0, #+0]
        ORR      R0,R0,#0xF0000
        ORRS     R0,R0,#0x1
        LDR.W    R1,??DataTable3_10  ;; 0x400b1030
        STR      R0,[R1, #+0]
//  306         return ESDHC_CMD_TIMEOUT;
        MOVS     R0,#+3
        B.N      ??SDHC_cmd_11
//  307     }
//  308 
//  309     /* 检测卡拔插状态 */
//  310     if (SDHC_IRQSTAT & SDHC_IRQSTAT_CRM_MASK)
??SDHC_cmd_10:
        LDR.W    R0,??DataTable3_10  ;; 0x400b1030
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+24
        BPL.N    ??SDHC_cmd_12
//  311     {
//  312         SDHC_IRQSTAT |= SDHC_IRQSTAT_CTOE_MASK | SDHC_IRQSTAT_CC_MASK;
        LDR.W    R0,??DataTable3_10  ;; 0x400b1030
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10001
        LDR.W    R1,??DataTable3_10  ;; 0x400b1030
        STR      R0,[R1, #+0]
//  313         return ESDHC_CMD_ERR;
        MOVS     R0,#+2
        B.N      ??SDHC_cmd_11
//  314     }
//  315 
//  316     /* 如果有，则获取相应 */
//  317     if (SDHC_IRQSTAT & SDHC_IRQSTAT_CTOE_MASK)
??SDHC_cmd_12:
        LDR.W    R0,??DataTable3_10  ;; 0x400b1030
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+15
        BPL.N    ??SDHC_cmd_13
//  318     {
//  319         SDHC_IRQSTAT |= SDHC_IRQSTAT_CTOE_MASK | SDHC_IRQSTAT_CC_MASK;
        LDR.W    R0,??DataTable3_10  ;; 0x400b1030
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10001
        LDR.W    R1,??DataTable3_10  ;; 0x400b1030
        STR      R0,[R1, #+0]
//  320         return ESDHC_CMD_TIMEOUT;
        MOVS     R0,#+3
        B.N      ??SDHC_cmd_11
//  321     }
//  322 
//  323     //如果 发送有相应 命令
//  324     if ((xfertyp & SDHC_XFERTYP_RSPTYP_MASK) != SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_NO))
??SDHC_cmd_13:
        TST      R5,#0x30000
        BEQ.N    ??SDHC_cmd_14
//  325     {
//  326         command->RESPONSE[0] = SDHC_CMDRSP(0);
        LDR.W    R0,??DataTable3_21  ;; 0x400b1010
        LDR      R0,[R0, #+0]
        STR      R0,[R4, #+12]
//  327 
//  328         //如果接收到长相应
//  329         if ((xfertyp & SDHC_XFERTYP_RSPTYP_MASK) == SDHC_XFERTYP_RSPTYP(ESDHC_XFERTYP_RSPTYP_136))
        ANDS     R0,R5,#0x30000
        CMP      R0,#+65536
        BNE.N    ??SDHC_cmd_14
//  330         {
//  331             command->RESPONSE[1] = SDHC_CMDRSP(1);
        LDR.W    R0,??DataTable3_22  ;; 0x400b1014
        LDR      R0,[R0, #+0]
        STR      R0,[R4, #+16]
//  332             command->RESPONSE[2] = SDHC_CMDRSP(2);
        LDR.W    R0,??DataTable3_23  ;; 0x400b1018
        LDR      R0,[R0, #+0]
        STR      R0,[R4, #+20]
//  333             command->RESPONSE[3] = SDHC_CMDRSP(3);
        LDR.W    R0,??DataTable3_24  ;; 0x400b101c
        LDR      R0,[R0, #+0]
        STR      R0,[R4, #+24]
//  334         }
//  335     }
//  336 
//  337     //完成命令
//  338     SDHC_IRQSTAT |= SDHC_IRQSTAT_CC_MASK;
??SDHC_cmd_14:
        LDR.W    R0,??DataTable3_10  ;; 0x400b1030
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.W    R1,??DataTable3_10  ;; 0x400b1030
        STR      R0,[R1, #+0]
//  339 
//  340     return 0;
        MOVS     R0,#+0
??SDHC_cmd_11:
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock2
//  341 }
//  342 
//  343 
//  344 
//  345 /*!
//  346  *  @brief      SDHC 控制命令
//  347  *  @param      ESDHC_IOCTL_CMD_e       命令
//  348  *  @return     ESDHC_IOCTL_ERR_e       操作结果
//  349  *  @since      v5.0
//  350  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function SDHC_ioctl
        THUMB
//  351 ESDHC_IOCTL_ERR_e SDHC_ioctl(ESDHC_IOCTL_CMD_e cmd, void *param_ptr )
//  352 {
SDHC_ioctl:
        PUSH     {R4-R11,LR}
          CFI R14 Frame(CFA, -4)
          CFI R11 Frame(CFA, -8)
          CFI R10 Frame(CFA, -12)
          CFI R9 Frame(CFA, -16)
          CFI R8 Frame(CFA, -20)
          CFI R7 Frame(CFA, -24)
          CFI R6 Frame(CFA, -28)
          CFI R5 Frame(CFA, -32)
          CFI R4 Frame(CFA, -36)
          CFI CFA R13+36
        SUB      SP,SP,#+36
          CFI CFA R13+72
        MOVS     R4,R0
        MOVS     R5,R1
//  353     ESDHC_CMD_t             command;
//  354     uint8                   mem, io, mmc, ceata, mp, hc;
//  355     int32                   val;
//  356     ESDHC_IOCTL_ERR_e                  result ;
//  357     uint32                  *param32_ptr = param_ptr;
        MOV      R10,R5
//  358 
//  359     result = ESDHC_IOCTL_OK;
        MOVS     R0,#+0
        MOV      R9,R0
//  360 
//  361     switch (cmd)
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??SDHC_ioctl_0
        CMP      R4,#+2
        BEQ.W    ??SDHC_ioctl_1
        BCC.W    ??SDHC_ioctl_2
        CMP      R4,#+4
        BEQ.W    ??SDHC_ioctl_3
        BCC.W    ??SDHC_ioctl_4
        B.N      ??SDHC_ioctl_5
//  362     {
//  363     case ESDHC_IOCTL_INIT:
//  364 
//  365         SDHC_init();        //初始化 SD卡模块
??SDHC_ioctl_0:
          CFI FunCall SDHC_init
        BL       SDHC_init
//  366 
//  367         mem = FALSE;
        MOVS     R0,#+0
        MOVS     R6,R0
//  368         io  = FALSE;
        MOVS     R0,#+0
        STRB     R0,[SP, #+0]
//  369         mmc = FALSE;
        MOVS     R0,#+0
        MOVS     R7,R0
//  370         ceata = FALSE;
        MOVS     R0,#+0
        STRB     R0,[SP, #+2]
//  371         hc = FALSE;
        MOVS     R0,#+0
        MOV      R8,R0
//  372         mp = FALSE;
        MOVS     R0,#+0
        STRB     R0,[SP, #+1]
//  373 
//  374         /* CMD0 - Go to idle - reset card */
//  375         command.COMMAND = ESDHC_CMD0;
        MOVS     R0,#+0
        STRB     R0,[SP, #+4]
//  376         command.TYPE = ESDHC_TYPE_NORMAL;
        MOVS     R0,#+0
        STRB     R0,[SP, #+5]
//  377         command.ARGUMENT = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
//  378         command.READ = FALSE;
        MOVS     R0,#+0
        STRB     R0,[SP, #+6]
//  379         command.BLOCKS = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
//  380         if (SDHC_cmd (&command))
        ADD      R0,SP,#+4
          CFI FunCall SDHC_cmd
        BL       SDHC_cmd
        CMP      R0,#+0
        BEQ.N    ??SDHC_ioctl_6
//  381         {
//  382             result = ESDHC_INIT_ERR;
        MOVS     R0,#+1
        MOV      R9,R0
//  383             break;
        B.N      ??SDHC_ioctl_7
//  384         }
//  385 
//  386         DELAY_MS(1100);
??SDHC_ioctl_6:
        MOVW     R0,#+1100
          CFI FunCall systick_delay_ms
        BL       systick_delay_ms
//  387 
//  388         /* CMD8 - Send interface condition - check HC support */
//  389         command.COMMAND = ESDHC_CMD8;
        MOVS     R0,#+8
        STRB     R0,[SP, #+4]
//  390         command.TYPE = ESDHC_TYPE_NORMAL;
        MOVS     R0,#+0
        STRB     R0,[SP, #+5]
//  391         command.ARGUMENT = 0x000001AA;
        MOV      R0,#+426
        STR      R0,[SP, #+8]
//  392         command.READ = FALSE;
        MOVS     R0,#+0
        STRB     R0,[SP, #+6]
//  393         command.BLOCKS = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
//  394         val = SDHC_cmd (&command);
        ADD      R0,SP,#+4
          CFI FunCall SDHC_cmd
        BL       SDHC_cmd
        MOV      R11,R0
//  395 
//  396         if (val == 0)
        CMP      R11,#+0
        BNE.N    ??SDHC_ioctl_8
//  397         {
//  398             // SDHC Card
//  399             if (command.RESPONSE[0] != command.ARGUMENT)
        LDR      R0,[SP, #+16]
        LDR      R1,[SP, #+8]
        CMP      R0,R1
        BEQ.N    ??SDHC_ioctl_9
//  400             {
//  401                 result = ESDHC_INIT_ERR;
        MOVS     R0,#+1
        MOV      R9,R0
//  402                 break;
        B.N      ??SDHC_ioctl_7
//  403             }
//  404             hc = TRUE;
??SDHC_ioctl_9:
        MOVS     R0,#+1
        MOV      R8,R0
//  405         }
//  406 
//  407         mp = TRUE;
??SDHC_ioctl_8:
        MOVS     R0,#+1
        STRB     R0,[SP, #+1]
//  408 
//  409         if (mp)
        LDRB     R0,[SP, #+1]
        CMP      R0,#+0
        BEQ.W    ??SDHC_ioctl_10
//  410         {
//  411             /* CMD55 - Application specific command - check MMC */
//  412             command.COMMAND = ESDHC_CMD55;
        MOVS     R0,#+55
        STRB     R0,[SP, #+4]
//  413             command.TYPE = ESDHC_TYPE_NORMAL;
        MOVS     R0,#+0
        STRB     R0,[SP, #+5]
//  414             command.ARGUMENT = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
//  415             command.READ = FALSE;
        MOVS     R0,#+0
        STRB     R0,[SP, #+6]
//  416             command.BLOCKS = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
//  417             val = SDHC_cmd (&command);
        ADD      R0,SP,#+4
          CFI FunCall SDHC_cmd
        BL       SDHC_cmd
        MOV      R11,R0
//  418             if (val > 0)
        CMP      R11,#+1
        BLT.N    ??SDHC_ioctl_11
//  419             {
//  420                 result = ESDHC_INIT_ERR;
        MOVS     R0,#+1
        MOV      R9,R0
//  421                 break;
        B.N      ??SDHC_ioctl_7
//  422             }
//  423             if (val < 0)
??SDHC_ioctl_11:
        CMP      R11,#+0
        BPL.N    ??SDHC_ioctl_12
//  424             {
//  425                 /* MMC or CE-ATA */
//  426                 io = FALSE;
        MOVS     R0,#+0
        STRB     R0,[SP, #+0]
//  427                 mem = FALSE;
        MOVS     R0,#+0
        MOVS     R6,R0
//  428                 hc = FALSE;
        MOVS     R0,#+0
        MOV      R8,R0
//  429 
//  430                 /* CMD1 - Send operating conditions - check HC */
//  431                 command.COMMAND = ESDHC_CMD1;
        MOVS     R0,#+1
        STRB     R0,[SP, #+4]
//  432                 command.TYPE = ESDHC_TYPE_NORMAL;
        MOVS     R0,#+0
        STRB     R0,[SP, #+5]
//  433                 command.ARGUMENT = 0x40300000;
        LDR.W    R0,??DataTable3_25  ;; 0x40300000
        STR      R0,[SP, #+8]
//  434                 command.READ = FALSE;
        MOVS     R0,#+0
        STRB     R0,[SP, #+6]
//  435                 command.BLOCKS = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
//  436                 if (SDHC_cmd (&command))
        ADD      R0,SP,#+4
          CFI FunCall SDHC_cmd
        BL       SDHC_cmd
        CMP      R0,#+0
        BEQ.N    ??SDHC_ioctl_13
//  437                 {
//  438                     result = ESDHC_INIT_ERR;
        MOVS     R0,#+1
        MOV      R9,R0
//  439                     break;
        B.N      ??SDHC_ioctl_7
//  440                 }
//  441                 if (0x20000000 == (command.RESPONSE[0] & 0x60000000))
??SDHC_ioctl_13:
        LDR      R0,[SP, #+16]
        ANDS     R0,R0,#0x60000000
        CMP      R0,#+536870912
        BNE.N    ??SDHC_ioctl_14
//  442                 {
//  443                     hc = TRUE;
        MOVS     R0,#+1
        MOV      R8,R0
//  444                 }
//  445                 mmc = TRUE;
??SDHC_ioctl_14:
        MOVS     R0,#+1
        MOVS     R7,R0
//  446 
//  447                 /* CMD39 - Fast IO - check CE-ATA signature CE */
//  448                 command.COMMAND = ESDHC_CMD39;
        MOVS     R0,#+39
        STRB     R0,[SP, #+4]
//  449                 command.TYPE = ESDHC_TYPE_NORMAL;
        MOVS     R0,#+0
        STRB     R0,[SP, #+5]
//  450                 command.ARGUMENT = 0x0C00;
        MOV      R0,#+3072
        STR      R0,[SP, #+8]
//  451                 command.READ = FALSE;
        MOVS     R0,#+0
        STRB     R0,[SP, #+6]
//  452                 command.BLOCKS = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
//  453                 if (SDHC_cmd (&command))
        ADD      R0,SP,#+4
          CFI FunCall SDHC_cmd
        BL       SDHC_cmd
        CMP      R0,#+0
        BEQ.N    ??SDHC_ioctl_15
//  454                 {
//  455                     result = ESDHC_INIT_ERR;
        MOVS     R0,#+1
        MOV      R9,R0
//  456                     break;
        B.N      ??SDHC_ioctl_7
//  457                 }
//  458                 if (0xCE == (command.RESPONSE[0] >> 8) & 0xFF)
??SDHC_ioctl_15:
        LDR      R0,[SP, #+16]
        LSRS     R0,R0,#+8
        CMP      R0,#+206
        BNE.N    ??SDHC_ioctl_16
        MOVS     R0,#+1
        B.N      ??SDHC_ioctl_17
??SDHC_ioctl_16:
        MOVS     R0,#+0
??SDHC_ioctl_17:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.W    ??SDHC_ioctl_10
//  459                 {
//  460                     /* CMD39 - Fast IO - check CE-ATA signature AA */
//  461                     command.COMMAND = ESDHC_CMD39;
        MOVS     R0,#+39
        STRB     R0,[SP, #+4]
//  462                     command.TYPE = ESDHC_TYPE_NORMAL;
        MOVS     R0,#+0
        STRB     R0,[SP, #+5]
//  463                     command.ARGUMENT = 0x0D00;
        MOV      R0,#+3328
        STR      R0,[SP, #+8]
//  464                     command.READ = FALSE;
        MOVS     R0,#+0
        STRB     R0,[SP, #+6]
//  465                     command.BLOCKS = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
//  466                     if (SDHC_cmd (&command))
        ADD      R0,SP,#+4
          CFI FunCall SDHC_cmd
        BL       SDHC_cmd
        CMP      R0,#+0
        BEQ.N    ??SDHC_ioctl_18
//  467                     {
//  468                         result = ESDHC_INIT_ERR;
        MOVS     R0,#+1
        MOV      R9,R0
//  469                         break;
        B.N      ??SDHC_ioctl_7
//  470                     }
//  471                     if (0xAA == (command.RESPONSE[0] >> 8) & 0xFF)
??SDHC_ioctl_18:
        LDR      R0,[SP, #+16]
        LSRS     R0,R0,#+8
        CMP      R0,#+170
        BNE.N    ??SDHC_ioctl_19
        MOVS     R0,#+1
        B.N      ??SDHC_ioctl_20
??SDHC_ioctl_19:
        MOVS     R0,#+0
??SDHC_ioctl_20:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??SDHC_ioctl_10
//  472                     {
//  473                         mmc = FALSE;
        MOVS     R0,#+0
        MOVS     R7,R0
//  474                         ceata = TRUE;
        MOVS     R0,#+1
        STRB     R0,[SP, #+2]
        B.N      ??SDHC_ioctl_10
//  475                     }
//  476                 }
//  477             }
//  478             else
//  479             {
//  480                 /* SD */
//  481                 /* ACMD41 - Send Operating Conditions */
//  482                 command.COMMAND = ESDHC_ACMD41;
??SDHC_ioctl_12:
        MOVS     R0,#+41
        STRB     R0,[SP, #+4]
//  483                 command.TYPE = ESDHC_TYPE_NORMAL;
        MOVS     R0,#+0
        STRB     R0,[SP, #+5]
//  484                 command.ARGUMENT = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
//  485                 command.READ = FALSE;
        MOVS     R0,#+0
        STRB     R0,[SP, #+6]
//  486                 command.BLOCKS = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
//  487                 if (SDHC_cmd (&command))
        ADD      R0,SP,#+4
          CFI FunCall SDHC_cmd
        BL       SDHC_cmd
        CMP      R0,#+0
        BEQ.N    ??SDHC_ioctl_21
//  488                 {
//  489                     result = ESDHC_INIT_ERR;
        MOVS     R0,#+1
        MOV      R9,R0
//  490                     break;
        B.N      ??SDHC_ioctl_7
//  491                 }
//  492                 if (command.RESPONSE[0] & 0x300000)
??SDHC_ioctl_21:
        LDR      R0,[SP, #+16]
        TST      R0,#0x300000
        BEQ.N    ??SDHC_ioctl_10
//  493                 {
//  494                     val = 0;
        MOVS     R0,#+0
        MOV      R11,R0
//  495                     do
//  496                     {
//  497                         DELAY_MS(10);
??SDHC_ioctl_22:
        MOVS     R0,#+10
          CFI FunCall systick_delay_ms
        BL       systick_delay_ms
//  498                         val++;
        ADDS     R11,R11,#+1
//  499 
//  500                         /* CMD55 + ACMD41 - Send OCR */
//  501                         //MMC卡对CMD55+ACMD41命令不作响应，故在初始化过程中用这一命令可以区别SD卡跟MMC卡
//  502                         command.COMMAND = ESDHC_CMD55;
        MOVS     R0,#+55
        STRB     R0,[SP, #+4]
//  503                         command.TYPE = ESDHC_TYPE_NORMAL;
        MOVS     R0,#+0
        STRB     R0,[SP, #+5]
//  504                         command.ARGUMENT = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
//  505                         command.READ = FALSE;
        MOVS     R0,#+0
        STRB     R0,[SP, #+6]
//  506                         command.BLOCKS = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
//  507                         if (SDHC_cmd (&command))
        ADD      R0,SP,#+4
          CFI FunCall SDHC_cmd
        BL       SDHC_cmd
        CMP      R0,#+0
        BEQ.N    ??SDHC_ioctl_23
//  508                         {
//  509                             result = ESDHC_INIT_ERR;
        MOVS     R0,#+1
        MOV      R9,R0
//  510                             break;
        B.N      ??SDHC_ioctl_24
//  511                         }
//  512 
//  513                         command.COMMAND = ESDHC_ACMD41;
??SDHC_ioctl_23:
        MOVS     R0,#+41
        STRB     R0,[SP, #+4]
//  514                         command.TYPE = ESDHC_TYPE_NORMAL;
        MOVS     R0,#+0
        STRB     R0,[SP, #+5]
//  515                         if (hc)
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+0
        BEQ.N    ??SDHC_ioctl_25
//  516                         {
//  517                             command.ARGUMENT = 0x40300000;
        LDR.N    R0,??DataTable3_25  ;; 0x40300000
        STR      R0,[SP, #+8]
        B.N      ??SDHC_ioctl_26
//  518                         }
//  519                         else
//  520                         {
//  521                             command.ARGUMENT = 0x00300000;
??SDHC_ioctl_25:
        MOVS     R0,#+3145728
        STR      R0,[SP, #+8]
//  522                         }
//  523                         command.READ = FALSE;
??SDHC_ioctl_26:
        MOVS     R0,#+0
        STRB     R0,[SP, #+6]
//  524                         command.BLOCKS = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
//  525                         if (SDHC_cmd (&command))
        ADD      R0,SP,#+4
          CFI FunCall SDHC_cmd
        BL       SDHC_cmd
        CMP      R0,#+0
        BEQ.N    ??SDHC_ioctl_27
//  526                         {
//  527                             result = ESDHC_INIT_ERR;
        MOVS     R0,#+1
        MOV      R9,R0
//  528                             break;
        B.N      ??SDHC_ioctl_24
//  529                         }
//  530                     }
//  531                     while ((0 == (command.RESPONSE[0] & 0x80000000)) && (val < SEND_OCR_TIME));
??SDHC_ioctl_27:
        LDR      R0,[SP, #+16]
        CMP      R0,#+0
        BMI.N    ??SDHC_ioctl_24
        CMP      R11,#+100
        BLT.N    ??SDHC_ioctl_22
//  532                     if (ESDHC_IOCTL_OK != result)
??SDHC_ioctl_24:
        SXTB     R9,R9            ;; SignExt  R9,R9,#+24,#+24
        CMP      R9,#+0
        BNE.W    ??SDHC_ioctl_7
//  533                     {
//  534                         break;
//  535                     }
//  536                     if (val >= SEND_OCR_TIME)
??SDHC_ioctl_28:
        CMP      R11,#+100
        BLT.N    ??SDHC_ioctl_29
//  537                     {
//  538                         hc = FALSE;
        MOVS     R0,#+0
        MOV      R8,R0
        B.N      ??SDHC_ioctl_10
//  539                     }
//  540                     else
//  541                     {
//  542                         mem = TRUE;
??SDHC_ioctl_29:
        MOVS     R0,#+1
        MOVS     R6,R0
//  543                         if (hc)
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+0
        BEQ.N    ??SDHC_ioctl_10
//  544                         {
//  545                             hc = FALSE;
        MOVS     R0,#+0
        MOV      R8,R0
//  546                             if (command.RESPONSE[0] & 0x40000000)
        LDR      R0,[SP, #+16]
        LSLS     R0,R0,#+1
        BPL.N    ??SDHC_ioctl_10
//  547                             {
//  548                                 hc = TRUE;
        MOVS     R0,#+1
        MOV      R8,R0
//  549                             }
//  550                         }
//  551                     }
//  552                 }
//  553             }
//  554         }
//  555 
//  556 
//  557         if (mmc)
??SDHC_ioctl_10:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+0
        BEQ.N    ??SDHC_ioctl_30
//  558         {
//  559             SDHC_card.CARD = ESDHC_CARD_MMC;
        MOVS     R0,#+7
        LDR.N    R1,??DataTable3
        STR      R0,[R1, #+0]
//  560         }
//  561         if (ceata)
??SDHC_ioctl_30:
        LDRB     R0,[SP, #+2]
        CMP      R0,#+0
        BEQ.N    ??SDHC_ioctl_31
//  562         {
//  563             SDHC_card.CARD = ESDHC_CARD_CEATA;
        MOVS     R0,#+8
        LDR.N    R1,??DataTable3
        STR      R0,[R1, #+0]
//  564         }
//  565         if (io)
??SDHC_ioctl_31:
        LDRB     R0,[SP, #+0]
        CMP      R0,#+0
        BEQ.N    ??SDHC_ioctl_32
//  566         {
//  567             SDHC_card.CARD = ESDHC_CARD_SDIO;
        MOVS     R0,#+4
        LDR.N    R1,??DataTable3
        STR      R0,[R1, #+0]
//  568         }
//  569         if (mem)
??SDHC_ioctl_32:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??SDHC_ioctl_33
//  570         {
//  571             SDHC_card.CARD = ESDHC_CARD_SD;
        MOVS     R0,#+2
        LDR.N    R1,??DataTable3
        STR      R0,[R1, #+0]
//  572             if (hc)
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+0
        BEQ.N    ??SDHC_ioctl_33
//  573             {
//  574                 SDHC_card.CARD = ESDHC_CARD_SDHC;
        MOVS     R0,#+3
        LDR.N    R1,??DataTable3
        STR      R0,[R1, #+0]
//  575             }
//  576         }
//  577         if (io && mem)
??SDHC_ioctl_33:
        LDRB     R0,[SP, #+0]
        CMP      R0,#+0
        BEQ.N    ??SDHC_ioctl_34
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??SDHC_ioctl_34
//  578         {
//  579             SDHC_card.CARD = ESDHC_CARD_SDCOMBO;
        MOVS     R0,#+5
        LDR.N    R1,??DataTable3
        STR      R0,[R1, #+0]
//  580             if (hc)
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+0
        BEQ.N    ??SDHC_ioctl_34
//  581             {
//  582                 SDHC_card.CARD = ESDHC_CARD_SDHCCOMBO;
        MOVS     R0,#+6
        LDR.N    R1,??DataTable3
        STR      R0,[R1, #+0]
//  583             }
//  584         }
//  585 
//  586         /* 设置 ESDHC 默认波特率 */
//  587         SDHC_set_baudrate (SDHC_BANDRATE);
??SDHC_ioctl_34:
        LDR.N    R0,??DataTable3_26  ;; 0x16e3600
          CFI FunCall SDHC_set_baudrate
        BL       SDHC_set_baudrate
//  588 
//  589 #if defined( MK60DZ10)
//  590         /* 使能 SDHC 模块时钟 */
//  591         SIM_SCGC3 |= SIM_SCGC3_SDHC_MASK;
//  592 
//  593 #elif defined( MK60F15)
//  594         /* 使能 SDHC 模块时钟 */
//  595         SIM_SCGC3 |= SIM_SCGC3_ESDHC_MASK;
        LDR.N    R0,??DataTable3_1  ;; 0x40048030
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20000
        LDR.N    R1,??DataTable3_1  ;; 0x40048030
        STR      R0,[R1, #+0]
//  596 #endif
//  597         break;
        B.N      ??SDHC_ioctl_7
//  598     case ESDHC_IOCTL_SEND_CMD:
//  599         val = SDHC_cmd ((pESDHC_CMD_t)param32_ptr);
??SDHC_ioctl_2:
        MOV      R0,R10
          CFI FunCall SDHC_cmd
        BL       SDHC_cmd
        MOV      R11,R0
//  600         if (val > 0)
        CMP      R11,#+1
        BLT.N    ??SDHC_ioctl_35
//  601         {
//  602             result = ESDHC_CMD_ERR;
        MOVS     R0,#+2
        MOV      R9,R0
//  603         }
//  604         if (val < 0)
??SDHC_ioctl_35:
        CMP      R11,#+0
        BPL.N    ??SDHC_ioctl_36
//  605         {
//  606             result = ESDHC_CMD_TIMEOUT;
        MOVS     R0,#+3
        MOV      R9,R0
//  607         }
//  608         break;
??SDHC_ioctl_36:
        B.N      ??SDHC_ioctl_7
//  609     case ESDHC_IOCTL_GET_BUS_WIDTH:
//  610         if (NULL == param32_ptr)
??SDHC_ioctl_4:
        CMP      R10,#+0
        BNE.N    ??SDHC_ioctl_37
//  611         {
//  612             result = ESDHC_PARAM_INVALID;
        MOVS     R0,#+5
        MOV      R9,R0
        B.N      ??SDHC_ioctl_38
//  613         }
//  614         else
//  615         {
//  616             /* 获取 ESDHC 总线宽度 */
//  617             val = (SDHC_PROCTL & SDHC_PROCTL_DTW_MASK) >> SDHC_PROCTL_DTW_SHIFT;
??SDHC_ioctl_37:
        LDR.N    R0,??DataTable3_6  ;; 0x400b1028
        LDR      R0,[R0, #+0]
        UBFX     R0,R0,#+1,#+2
        MOV      R11,R0
//  618             if (ESDHC_PROCTL_DTW_1BIT == val)
        CMP      R11,#+0
        BNE.N    ??SDHC_ioctl_39
//  619             {
//  620                 *param32_ptr = ESDHC_BUS_WIDTH_1BIT;
        MOVS     R0,#+0
        STR      R0,[R10, #+0]
        B.N      ??SDHC_ioctl_38
//  621             }
//  622             else if (ESDHC_PROCTL_DTW_4BIT == val)
??SDHC_ioctl_39:
        CMP      R11,#+1
        BNE.N    ??SDHC_ioctl_40
//  623             {
//  624                 *param32_ptr = ESDHC_BUS_WIDTH_4BIT;
        MOVS     R0,#+1
        STR      R0,[R10, #+0]
        B.N      ??SDHC_ioctl_38
//  625             }
//  626             else if (ESDHC_PROCTL_DTW_8BIT == val)
??SDHC_ioctl_40:
        CMP      R11,#+16
        BNE.N    ??SDHC_ioctl_41
//  627             {
//  628                 *param32_ptr = ESDHC_BUS_WIDTH_8BIT;
        MOVS     R0,#+2
        STR      R0,[R10, #+0]
        B.N      ??SDHC_ioctl_38
//  629             }
//  630             else
//  631             {
//  632                 result = ESDHC_BUS_WIDTH_INVALID;
??SDHC_ioctl_41:
        MOVS     R0,#+6
        MOV      R9,R0
//  633             }
//  634         }
//  635         break;
??SDHC_ioctl_38:
        B.N      ??SDHC_ioctl_7
//  636     case ESDHC_IOCTL_SET_BUS_WIDTH:
//  637         if (NULL == param32_ptr)
??SDHC_ioctl_3:
        CMP      R10,#+0
        BNE.N    ??SDHC_ioctl_42
//  638         {
//  639             result = ESDHC_PARAM_INVALID;
        MOVS     R0,#+5
        MOV      R9,R0
        B.N      ??SDHC_ioctl_43
//  640         }
//  641         else
//  642         {
//  643             /* 设置 ESDHC 总线宽度 */
//  644             if (! SDHC_is_running())
??SDHC_ioctl_42:
        LDR.N    R0,??DataTable3_9  ;; 0x400b1024
        LDR      R0,[R0, #+0]
        MOVW     R1,#+775
        TST      R0,R1
        BNE.N    ??SDHC_ioctl_44
//  645             {
//  646                 if (ESDHC_BUS_WIDTH_1BIT == *param32_ptr)
        LDR      R0,[R10, #+0]
        CMP      R0,#+0
        BNE.N    ??SDHC_ioctl_45
//  647                 {
//  648                     SDHC_PROCTL &= (~ SDHC_PROCTL_DTW_MASK);
        LDR.N    R0,??DataTable3_6  ;; 0x400b1028
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x6
        LDR.N    R1,??DataTable3_6  ;; 0x400b1028
        STR      R0,[R1, #+0]
//  649                     SDHC_PROCTL |= SDHC_PROCTL_DTW(ESDHC_PROCTL_DTW_1BIT);
        LDR.N    R0,??DataTable3_6  ;; 0x400b1028
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable3_6  ;; 0x400b1028
        STR      R0,[R1, #+0]
        B.N      ??SDHC_ioctl_43
//  650                 }
//  651                 else if (ESDHC_BUS_WIDTH_4BIT == *param32_ptr)
??SDHC_ioctl_45:
        LDR      R0,[R10, #+0]
        CMP      R0,#+1
        BNE.N    ??SDHC_ioctl_46
//  652                 {
//  653                     SDHC_PROCTL &= (~ SDHC_PROCTL_DTW_MASK);
        LDR.N    R0,??DataTable3_6  ;; 0x400b1028
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x6
        LDR.N    R1,??DataTable3_6  ;; 0x400b1028
        STR      R0,[R1, #+0]
//  654                     SDHC_PROCTL |= SDHC_PROCTL_DTW(ESDHC_PROCTL_DTW_4BIT);
        LDR.N    R0,??DataTable3_6  ;; 0x400b1028
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.N    R1,??DataTable3_6  ;; 0x400b1028
        STR      R0,[R1, #+0]
        B.N      ??SDHC_ioctl_43
//  655                 }
//  656                 else if (ESDHC_BUS_WIDTH_8BIT == *param32_ptr)
??SDHC_ioctl_46:
        LDR      R0,[R10, #+0]
        CMP      R0,#+2
        BNE.N    ??SDHC_ioctl_47
//  657                 {
//  658                     SDHC_PROCTL &= (~ SDHC_PROCTL_DTW_MASK);
        LDR.N    R0,??DataTable3_6  ;; 0x400b1028
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x6
        LDR.N    R1,??DataTable3_6  ;; 0x400b1028
        STR      R0,[R1, #+0]
//  659                     SDHC_PROCTL |= SDHC_PROCTL_DTW(ESDHC_PROCTL_DTW_8BIT);
        LDR.N    R0,??DataTable3_6  ;; 0x400b1028
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable3_6  ;; 0x400b1028
        STR      R0,[R1, #+0]
        B.N      ??SDHC_ioctl_43
//  660                 }
//  661                 else
//  662                 {
//  663                     result = ESDHC_BUS_WIDTH_INVALID;
??SDHC_ioctl_47:
        MOVS     R0,#+6
        MOV      R9,R0
        B.N      ??SDHC_ioctl_43
//  664                 }
//  665             }
//  666             else
//  667             {
//  668                 result = ESDHC_BUSY;
??SDHC_ioctl_44:
        MOVS     R0,#+7
        MOV      R9,R0
//  669             }
//  670         }
//  671         break;
??SDHC_ioctl_43:
        B.N      ??SDHC_ioctl_7
//  672     case ESDHC_IOCTL_GET_CARD:
//  673         if (NULL == param32_ptr)
??SDHC_ioctl_1:
        CMP      R10,#+0
        BNE.N    ??SDHC_ioctl_48
//  674         {
//  675             result = ESDHC_PARAM_INVALID;
        MOVS     R0,#+5
        MOV      R9,R0
        B.N      ??SDHC_ioctl_49
//  676         }
//  677         else
//  678         {
//  679             /* 80 clocks to update levels */
//  680             SDHC_SYSCTL |= SDHC_SYSCTL_INITA_MASK;
??SDHC_ioctl_48:
        LDR.N    R0,??DataTable3_3  ;; 0x400b102c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x8000000
        LDR.N    R1,??DataTable3_3  ;; 0x400b102c
        STR      R0,[R1, #+0]
//  681             while (SDHC_SYSCTL & SDHC_SYSCTL_INITA_MASK)
??SDHC_ioctl_50:
        LDR.N    R0,??DataTable3_3  ;; 0x400b102c
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+4
        BMI.N    ??SDHC_ioctl_50
//  682                 { };
//  683 
//  684             /* Update and return actual card status */
//  685             if (SDHC_IRQSTAT & SDHC_IRQSTAT_CRM_MASK)
        LDR.N    R0,??DataTable3_10  ;; 0x400b1030
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+24
        BPL.N    ??SDHC_ioctl_51
//  686             {
//  687                 SDHC_IRQSTAT |= SDHC_IRQSTAT_CRM_MASK;
        LDR.N    R0,??DataTable3_10  ;; 0x400b1030
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80
        LDR.N    R1,??DataTable3_10  ;; 0x400b1030
        STR      R0,[R1, #+0]
//  688                 SDHC_card.CARD = ESDHC_CARD_NONE;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3
        STR      R0,[R1, #+0]
//  689             }
//  690             if (SDHC_PRSSTAT & SDHC_PRSSTAT_CINS_MASK)
??SDHC_ioctl_51:
        LDR.N    R0,??DataTable3_9  ;; 0x400b1024
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+15
        BPL.N    ??SDHC_ioctl_52
//  691             {
//  692                 if (ESDHC_CARD_NONE == SDHC_card.CARD)
        LDR.N    R0,??DataTable3
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??SDHC_ioctl_53
//  693                 {
//  694                     SDHC_card.CARD = ESDHC_CARD_UNKNOWN;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3
        STR      R0,[R1, #+0]
        B.N      ??SDHC_ioctl_53
//  695                 }
//  696             }
//  697             else
//  698             {
//  699                 SDHC_card.CARD = ESDHC_CARD_NONE;
??SDHC_ioctl_52:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3
        STR      R0,[R1, #+0]
//  700             }
//  701             *param32_ptr = SDHC_card.CARD;
??SDHC_ioctl_53:
        LDR.N    R0,??DataTable3
        LDR      R0,[R0, #+0]
        STR      R0,[R10, #+0]
//  702         }
//  703         break;
??SDHC_ioctl_49:
        B.N      ??SDHC_ioctl_7
//  704     default:
//  705         result = ESDHC_CMD_INVALID;
??SDHC_ioctl_5:
        MOVS     R0,#+4
        MOV      R9,R0
//  706         break;
//  707     }
//  708     return result;
??SDHC_ioctl_7:
        MOV      R0,R9
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        ADD      SP,SP,#+36
          CFI CFA R13+36
        POP      {R4-R11,PC}      ;; return
          CFI EndBlock cfiBlock3
//  709 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     SDHC_card

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     0x40048030

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     0x1008000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     0x400b102c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_4:
        DC32     0x400b10c0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_5:
        DC32     0x400b1004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_6:
        DC32     0x400b1028

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_7:
        DC32     0x400b1044

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_8:
        DC32     0x493e0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_9:
        DC32     0x400b1024

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_10:
        DC32     0x400b1030

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_11:
        DC32     0x7f00b3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_12:
        DC32     0x400b1034

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_13:
        DC32     core_clk_khz

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_14:
        DC32     ESDHC_COMMAND_XFERTYP

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_15:
        DC32     ?_0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_16:
        DC32     0x400b1008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_17:
        DC32     0xffff0200

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_18:
        DC32     0x400b1000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_19:
        DC32     0x400b100c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_20:
        DC32     0xe0001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_21:
        DC32     0x400b1010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_22:
        DC32     0x400b1014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_23:
        DC32     0x400b1018

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_24:
        DC32     0x400b101c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_25:
        DC32     0x40300000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_26:
        DC32     0x16e3600

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
// 
//    20 bytes in section .bss
//   312 bytes in section .rodata
// 2 104 bytes in section .text
// 
// 2 104 bytes of CODE  memory
//   312 bytes of CONST memory
//    20 bytes of DATA  memory
//
//Errors: none
//Warnings: none
