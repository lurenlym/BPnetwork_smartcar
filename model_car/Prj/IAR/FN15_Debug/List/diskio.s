///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       21/Mar/2017  16:04:27
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\znc\project\K60FN\network_car\Lib\FatFs\diskio.c
//    Command line =  
//        E:\znc\project\K60FN\network_car\Lib\FatFs\diskio.c -D DEBUG -D
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
//        E:\znc\project\K60FN\network_car\Prj\IAR\FN15_Debug\List\diskio.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "1"
        RTMODEL "__dlib_full_locale_support", "1"
        AAPCS BASE,INTERWORK,VFP
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN SDHC_card
        EXTERN SDHC_ioctl

        PUBLIC disk_initialize
        PUBLIC disk_ioctl
        PUBLIC disk_read
        PUBLIC disk_status
        PUBLIC disk_write
        PUBLIC get_fattime
        
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
        
// E:\znc\project\K60FN\network_car\Lib\FatFs\diskio.c
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
//   12  * @file       diskio.c
//   13  * @brief      FATFS 底层接口实现函数
//   14  * @author     山外科技 & gustavo(brtos作者)
//   15  * @version    v5.0
//   16  * @date       2013-09-19
//   17  */
//   18 
//   19 #include "common.h"
//   20 #include "MK60_sdhc.h"
//   21 #include "diskio.h"
//   22 
//   23 

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   24 static volatile DSTATUS   Stat             = STA_NOINIT;    /* 硬盘状态         */
Stat:
        DATA
        DC8 1
//   25 
//   26 /*!
//   27  *  @brief      硬盘初始化
//   28  *  @param      drv                 设备号(目前代码仅支持为 0)
//   29  *  @since      v5.0
//   30  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function disk_initialize
        THUMB
//   31 DSTATUS disk_initialize (unsigned char drv)
//   32 {
disk_initialize:
        PUSH     {R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+20
        SUB      SP,SP,#+36
          CFI CFA R13+56
        MOVS     R4,R0
//   33     uint32                      param, c_size, c_size_mult, read_bl_len;
//   34     ESDHC_CMD_t                 command;
//   35 
//   36     if (drv) return STA_NOINIT;         /* 目前代码仅支持1个设备 */
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??disk_initialize_0
        MOVS     R0,#+1
        B.N      ??disk_initialize_1
//   37     if (Stat & STA_NODISK) return Stat; /* 没有插入卡 */
??disk_initialize_0:
        LDR.W    R0,??DataTable6
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+30
        BPL.N    ??disk_initialize_2
        LDR.W    R0,??DataTable6
        LDRB     R0,[R0, #+0]
        B.N      ??disk_initialize_1
//   38     if ((Stat & STA_NOINIT) == 0)   return 0;/* 没有初始化 */
??disk_initialize_2:
        LDR.W    R0,??DataTable6
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+31
        BMI.N    ??disk_initialize_3
        MOVS     R0,#+0
        B.N      ??disk_initialize_1
//   39 
//   40     SDHC_card.SD_TIMEOUT = 0;
??disk_initialize_3:
        MOVS     R0,#+0
        LDR.W    R1,??DataTable6_1
        STR      R0,[R1, #+4]
//   41     SDHC_card.NUM_BLOCKS = 0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable6_1
        STR      R0,[R1, #+8]
//   42     SDHC_card.ADDRESS = 0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable6_1
        STR      R0,[R1, #+12]
//   43     SDHC_card.SDHC = FALSE;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable6_1
        STRB     R0,[R1, #+16]
//   44     SDHC_card.VERSION2 = FALSE;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable6_1
        STRB     R0,[R1, #+17]
//   45 
//   46     /* 初始化和检测卡 */
//   47     if (ESDHC_IOCTL_OK != SDHC_ioctl (ESDHC_IOCTL_INIT, NULL))
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall SDHC_ioctl
        BL       SDHC_ioctl
        CMP      R0,#+0
        BEQ.N    ??disk_initialize_4
//   48     {
//   49         return FALSE;
        MOVS     R0,#+0
        B.N      ??disk_initialize_1
//   50     }
//   51 
//   52     /* SDHC 检测 */
//   53     param = 0;
??disk_initialize_4:
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
//   54     if (ESDHC_IOCTL_OK != SDHC_ioctl (ESDHC_IOCTL_GET_CARD, &param))
        ADD      R1,SP,#+0
        MOVS     R0,#+2
          CFI FunCall SDHC_ioctl
        BL       SDHC_ioctl
        CMP      R0,#+0
        BEQ.N    ??disk_initialize_5
//   55     {
//   56         return FALSE;
        MOVS     R0,#+0
        B.N      ??disk_initialize_1
//   57     }
//   58     if ((ESDHC_CARD_SD == param) || (ESDHC_CARD_SDHC == param) || (ESDHC_CARD_SDCOMBO == param) || (ESDHC_CARD_SDHCCOMBO == param))
??disk_initialize_5:
        LDR      R0,[SP, #+0]
        CMP      R0,#+2
        BEQ.N    ??disk_initialize_6
        LDR      R0,[SP, #+0]
        CMP      R0,#+3
        BEQ.N    ??disk_initialize_6
        LDR      R0,[SP, #+0]
        CMP      R0,#+5
        BEQ.N    ??disk_initialize_6
        LDR      R0,[SP, #+0]
        CMP      R0,#+6
        BNE.N    ??disk_initialize_7
//   59     {
//   60         if ((ESDHC_CARD_SDHC == param) || (ESDHC_CARD_SDHCCOMBO == param))
??disk_initialize_6:
        LDR      R0,[SP, #+0]
        CMP      R0,#+3
        BEQ.N    ??disk_initialize_8
        LDR      R0,[SP, #+0]
        CMP      R0,#+6
        BNE.N    ??disk_initialize_9
//   61         {
//   62             SDHC_card.SDHC = TRUE;
??disk_initialize_8:
        MOVS     R0,#+1
        LDR.W    R1,??DataTable6_1
        STRB     R0,[R1, #+16]
//   63         }
//   64     }
//   65     else
//   66     {
//   67         return FALSE;
//   68     }
//   69 
//   70     /* 卡识别 */
//   71     command.COMMAND = ESDHC_CMD2;
??disk_initialize_9:
        MOVS     R0,#+2
        STRB     R0,[SP, #+4]
//   72     command.TYPE = ESDHC_TYPE_NORMAL;
        MOVS     R0,#+0
        STRB     R0,[SP, #+5]
//   73     command.ARGUMENT = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
//   74     command.READ = FALSE;
        MOVS     R0,#+0
        STRB     R0,[SP, #+6]
//   75     command.BLOCKS = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
//   76     if (ESDHC_IOCTL_OK != SDHC_ioctl (ESDHC_IOCTL_SEND_CMD, &command))
        ADD      R1,SP,#+4
        MOVS     R0,#+1
          CFI FunCall SDHC_ioctl
        BL       SDHC_ioctl
        CMP      R0,#+0
        BNE.N    ??disk_initialize_10
        B.N      ??disk_initialize_11
??disk_initialize_7:
        MOVS     R0,#+0
        B.N      ??disk_initialize_1
//   77     {
//   78         return FALSE;
??disk_initialize_10:
        MOVS     R0,#+0
        B.N      ??disk_initialize_1
//   79     }
//   80 
//   81     /* 获得卡地址 */
//   82     command.COMMAND = ESDHC_CMD3;
??disk_initialize_11:
        MOVS     R0,#+3
        STRB     R0,[SP, #+4]
//   83     command.TYPE = ESDHC_TYPE_NORMAL;
        MOVS     R0,#+0
        STRB     R0,[SP, #+5]
//   84     command.ARGUMENT = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
//   85     command.READ = FALSE;
        MOVS     R0,#+0
        STRB     R0,[SP, #+6]
//   86     command.BLOCKS = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
//   87     if (ESDHC_IOCTL_OK != SDHC_ioctl (ESDHC_IOCTL_SEND_CMD, &command))
        ADD      R1,SP,#+4
        MOVS     R0,#+1
          CFI FunCall SDHC_ioctl
        BL       SDHC_ioctl
        CMP      R0,#+0
        BEQ.N    ??disk_initialize_12
//   88     {
//   89         return FALSE;
        MOVS     R0,#+0
        B.N      ??disk_initialize_1
//   90     }
//   91     SDHC_card.ADDRESS = command.RESPONSE[0] & 0xFFFF0000;
??disk_initialize_12:
        LDR      R0,[SP, #+16]
        LSRS     R0,R0,#+16
        LSLS     R0,R0,#+16
        LDR.W    R1,??DataTable6_1
        STR      R0,[R1, #+12]
//   92 
//   93     /* 获得卡参数 */
//   94     command.COMMAND = ESDHC_CMD9;
        MOVS     R0,#+9
        STRB     R0,[SP, #+4]
//   95     command.TYPE = ESDHC_TYPE_NORMAL;
        MOVS     R0,#+0
        STRB     R0,[SP, #+5]
//   96     command.ARGUMENT = SDHC_card.ADDRESS;
        LDR.W    R0,??DataTable6_1
        LDR      R0,[R0, #+12]
        STR      R0,[SP, #+8]
//   97     command.READ = FALSE;
        MOVS     R0,#+0
        STRB     R0,[SP, #+6]
//   98     command.BLOCKS = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
//   99     if (ESDHC_IOCTL_OK != SDHC_ioctl (ESDHC_IOCTL_SEND_CMD, &command))
        ADD      R1,SP,#+4
        MOVS     R0,#+1
          CFI FunCall SDHC_ioctl
        BL       SDHC_ioctl
        CMP      R0,#+0
        BEQ.N    ??disk_initialize_13
//  100     {
//  101         return FALSE;
        MOVS     R0,#+0
        B.N      ??disk_initialize_1
//  102     }
//  103     if (0 == (command.RESPONSE[3] & 0x00C00000))
??disk_initialize_13:
        LDR      R0,[SP, #+28]
        TST      R0,#0xC00000
        BNE.N    ??disk_initialize_14
//  104     {
//  105         read_bl_len = (command.RESPONSE[2] >> 8) & 0x0F;
        LDR      R0,[SP, #+24]
        UBFX     R0,R0,#+8,#+4
        MOVS     R6,R0
//  106         c_size = command.RESPONSE[2] & 0x03;
        LDRB     R0,[SP, #+24]
        ANDS     R0,R0,#0x3
        MOVS     R7,R0
//  107         c_size = (c_size << 10) | (command.RESPONSE[1] >> 22);
        LDR      R0,[SP, #+20]
        LSRS     R0,R0,#+22
        ORRS     R7,R0,R7, LSL #+10
//  108         c_size_mult = (command.RESPONSE[1] >> 7) & 0x07;
        LDR      R0,[SP, #+20]
        UBFX     R0,R0,#+7,#+3
        MOVS     R5,R0
//  109         SDHC_card.NUM_BLOCKS = (c_size + 1) * (1 << (c_size_mult + 2)) * (1 << (read_bl_len - 9));
        ADDS     R0,R7,#+1
        MOVS     R1,#+1
        ADDS     R2,R5,#+2
        LSLS     R1,R1,R2
        MULS     R0,R1,R0
        MOVS     R1,#+1
        MOVS     R2,R6
        SUBS     R2,R2,#+9
        LSLS     R1,R1,R2
        MULS     R0,R1,R0
        LDR.W    R1,??DataTable6_1
        STR      R0,[R1, #+8]
        B.N      ??disk_initialize_15
//  110     }
//  111     else
//  112     {
//  113         SDHC_card.VERSION2 = TRUE;
??disk_initialize_14:
        MOVS     R0,#+1
        LDR.W    R1,??DataTable6_1
        STRB     R0,[R1, #+17]
//  114         c_size = (command.RESPONSE[1] >> 8) & 0x003FFFFF;
        LDR      R0,[SP, #+20]
        UBFX     R0,R0,#+8,#+22
        MOVS     R7,R0
//  115         SDHC_card.NUM_BLOCKS = (c_size + 1) << 10;
        ADDS     R0,R7,#+1
        LSLS     R0,R0,#+10
        LDR.W    R1,??DataTable6_1
        STR      R0,[R1, #+8]
//  116     }
//  117 
//  118     /* 选择卡 */
//  119     command.COMMAND = ESDHC_CMD7;
??disk_initialize_15:
        MOVS     R0,#+7
        STRB     R0,[SP, #+4]
//  120     command.TYPE = ESDHC_TYPE_NORMAL;
        MOVS     R0,#+0
        STRB     R0,[SP, #+5]
//  121     command.ARGUMENT = SDHC_card.ADDRESS;
        LDR.W    R0,??DataTable6_1
        LDR      R0,[R0, #+12]
        STR      R0,[SP, #+8]
//  122     command.READ = FALSE;
        MOVS     R0,#+0
        STRB     R0,[SP, #+6]
//  123     command.BLOCKS = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
//  124     if (ESDHC_IOCTL_OK != SDHC_ioctl (ESDHC_IOCTL_SEND_CMD, &command))
        ADD      R1,SP,#+4
        MOVS     R0,#+1
          CFI FunCall SDHC_ioctl
        BL       SDHC_ioctl
        CMP      R0,#+0
        BEQ.N    ??disk_initialize_16
//  125     {
//  126         return FALSE;
        MOVS     R0,#+0
        B.N      ??disk_initialize_1
//  127     }
//  128 
//  129     /* 设置块的大小 */
//  130     command.COMMAND = ESDHC_CMD16;
??disk_initialize_16:
        MOVS     R0,#+16
        STRB     R0,[SP, #+4]
//  131     command.TYPE = ESDHC_TYPE_NORMAL;
        MOVS     R0,#+0
        STRB     R0,[SP, #+5]
//  132     command.ARGUMENT = SDCARD_BLOCK_SIZE;
        MOV      R0,#+512
        STR      R0,[SP, #+8]
//  133     command.READ = FALSE;
        MOVS     R0,#+0
        STRB     R0,[SP, #+6]
//  134     command.BLOCKS = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
//  135     if (ESDHC_IOCTL_OK != SDHC_ioctl (ESDHC_IOCTL_SEND_CMD, &command))
        ADD      R1,SP,#+4
        MOVS     R0,#+1
          CFI FunCall SDHC_ioctl
        BL       SDHC_ioctl
        CMP      R0,#+0
        BEQ.N    ??disk_initialize_17
//  136     {
//  137         return FALSE;
        MOVS     R0,#+0
        B.N      ??disk_initialize_1
//  138     }
//  139 
//  140     if (ESDHC_BUS_WIDTH_4BIT == SDHC_BUS_WIDTH)
//  141     {
//  142         /* 应用程序特定的命令 */
//  143         command.COMMAND = ESDHC_CMD55;
??disk_initialize_17:
        MOVS     R0,#+55
        STRB     R0,[SP, #+4]
//  144         command.TYPE = ESDHC_TYPE_NORMAL;
        MOVS     R0,#+0
        STRB     R0,[SP, #+5]
//  145         command.ARGUMENT = SDHC_card.ADDRESS;
        LDR.W    R0,??DataTable6_1
        LDR      R0,[R0, #+12]
        STR      R0,[SP, #+8]
//  146         command.READ = FALSE;
        MOVS     R0,#+0
        STRB     R0,[SP, #+6]
//  147         command.BLOCKS = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
//  148         if (ESDHC_IOCTL_OK != SDHC_ioctl (ESDHC_IOCTL_SEND_CMD, &command))
        ADD      R1,SP,#+4
        MOVS     R0,#+1
          CFI FunCall SDHC_ioctl
        BL       SDHC_ioctl
        CMP      R0,#+0
        BEQ.N    ??disk_initialize_18
//  149         {
//  150             return FALSE;
        MOVS     R0,#+0
        B.N      ??disk_initialize_1
//  151         }
//  152 
//  153         /* 设置总线带宽 == 4 */
//  154         command.COMMAND = ESDHC_ACMD6;
??disk_initialize_18:
        MOVS     R0,#+6
        STRB     R0,[SP, #+4]
//  155         command.TYPE = ESDHC_TYPE_NORMAL;
        MOVS     R0,#+0
        STRB     R0,[SP, #+5]
//  156         command.ARGUMENT = 2;
        MOVS     R0,#+2
        STR      R0,[SP, #+8]
//  157         command.READ = FALSE;
        MOVS     R0,#+0
        STRB     R0,[SP, #+6]
//  158         command.BLOCKS = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
//  159         if (ESDHC_IOCTL_OK != SDHC_ioctl (ESDHC_IOCTL_SEND_CMD, &command))
        ADD      R1,SP,#+4
        MOVS     R0,#+1
          CFI FunCall SDHC_ioctl
        BL       SDHC_ioctl
        CMP      R0,#+0
        BEQ.N    ??disk_initialize_19
//  160         {
//  161             return FALSE;
        MOVS     R0,#+0
        B.N      ??disk_initialize_1
//  162         }
//  163 
//  164         param = ESDHC_BUS_WIDTH_4BIT;
??disk_initialize_19:
        MOVS     R0,#+1
        STR      R0,[SP, #+0]
//  165         if (ESDHC_IOCTL_OK != SDHC_ioctl (ESDHC_IOCTL_SET_BUS_WIDTH, &param))
        ADD      R1,SP,#+0
        MOVS     R0,#+4
          CFI FunCall SDHC_ioctl
        BL       SDHC_ioctl
        CMP      R0,#+0
        BEQ.N    ??disk_initialize_20
//  166         {
//  167             return FALSE;
        MOVS     R0,#+0
        B.N      ??disk_initialize_1
//  168         }
//  169     }
//  170 
//  171     Stat &= ~STA_NOINIT;        /* 清 STA_NOINIT */
??disk_initialize_20:
        LDR.W    R0,??DataTable6
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0xFE
        LDR.W    R1,??DataTable6
        STRB     R0,[R1, #+0]
//  172 
//  173     return (Stat & 0x03);
        LDR.W    R0,??DataTable6
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0x3
??disk_initialize_1:
        ADD      SP,SP,#+36
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
          CFI EndBlock cfiBlock0
//  174 }
//  175 
//  176 /*!
//  177  *  @brief      从MMC接收数据包
//  178  *  @param      buff                接收 SDCARD_BLOCK_SIZE 个字节的数据块到数据缓冲区地址
//  179  *  @param      btr                 字节数目(必须是 4 的倍数)
//  180  *  @since      v5.0
//  181  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function rcvr_datablock
          CFI NoCalls
        THUMB
//  182 static int rcvr_datablock (uint8   *buff, uint32  btr)
//  183 {
rcvr_datablock:
        PUSH     {R4-R7}
          CFI R7 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R2,R0
//  184     uint32  bytes, i, j;
//  185     uint32  *ptr = (uint32 *)buff;
        MOVS     R5,R2
//  186 
//  187 
//  188     /* Workaround for random bit polling failures - not suitable for IO cards    */
//  189 
//  190     while(!(SDHC_IRQSTAT & SDHC_IRQSTAT_BRR_MASK));
??rcvr_datablock_0:
        LDR.W    R0,??DataTable6_2  ;; 0x400b1030
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+26
        BPL.N    ??rcvr_datablock_0
//  191     SDHC_IRQSTAT =  SDHC_IRQSTAT_BRR_MASK ;
        MOVS     R0,#+32
        LDR.W    R7,??DataTable6_2  ;; 0x400b1030
        STR      R0,[R7, #+0]
//  192 
//  193     /* Read data in 4 byte counts */
//  194     bytes = btr;
        MOVS     R3,R1
//  195     while (bytes)
??rcvr_datablock_1:
        CMP      R3,#+0
        BEQ.N    ??rcvr_datablock_2
//  196     {
//  197         i = bytes > SDCARD_BLOCK_SIZE ? SDCARD_BLOCK_SIZE : bytes;
        CMP      R3,#+512
        BLS.N    ??rcvr_datablock_3
        MOV      R6,#+512
        B.N      ??rcvr_datablock_4
??rcvr_datablock_3:
        MOVS     R6,R3
//  198         for (j = (i + 3) >> 2; j != 0; j--)
??rcvr_datablock_4:
        ADDS     R0,R6,#+3
        LSRS     R0,R0,#+2
        MOVS     R4,R0
??rcvr_datablock_5:
        CMP      R4,#+0
        BEQ.N    ??rcvr_datablock_6
//  199         {
//  200             if (SDHC_IRQSTAT & (SDHC_IRQSTAT_DEBE_MASK | SDHC_IRQSTAT_DCE_MASK | SDHC_IRQSTAT_DTOE_MASK))
        LDR.W    R0,??DataTable6_2  ;; 0x400b1030
        LDR      R0,[R0, #+0]
        TST      R0,#0x700000
        BEQ.N    ??rcvr_datablock_7
//  201             {
//  202                 SDHC_IRQSTAT |= SDHC_IRQSTAT_DEBE_MASK | SDHC_IRQSTAT_DCE_MASK | SDHC_IRQSTAT_DTOE_MASK | SDHC_IRQSTAT_BRR_MASK;
        LDR.W    R0,??DataTable6_2  ;; 0x400b1030
        LDR      R0,[R0, #+0]
        ORR      R0,R0,#0x700000
        ORRS     R0,R0,#0x20
        LDR.W    R7,??DataTable6_2  ;; 0x400b1030
        STR      R0,[R7, #+0]
//  203                 return 0;
        MOVS     R0,#+0
        B.N      ??rcvr_datablock_8
//  204             }
//  205 
//  206             while (0 == (SDHC_PRSSTAT & SDHC_PRSSTAT_BREN_MASK)) {};
??rcvr_datablock_7:
        LDR.W    R0,??DataTable6_3  ;; 0x400b1024
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+20
        BPL.N    ??rcvr_datablock_7
//  207 
//  208             //小端
//  209             *ptr++ = SDHC_DATPORT;
        LDR.W    R0,??DataTable6_4  ;; 0x400b1020
        LDR      R0,[R0, #+0]
        STR      R0,[R5, #+0]
        ADDS     R5,R5,#+4
//  210         }
        SUBS     R4,R4,#+1
        B.N      ??rcvr_datablock_5
//  211         bytes -= i;
??rcvr_datablock_6:
        SUBS     R3,R3,R6
        B.N      ??rcvr_datablock_1
//  212     }
//  213 
//  214     return 1;                       /* Return with success */
??rcvr_datablock_2:
        MOVS     R0,#+1
??rcvr_datablock_8:
        POP      {R4-R7}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI R6 SameValue
          CFI R7 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock1
//  215 }
//  216 
//  217 /*!
//  218  *  @brief      读扇区
//  219  *  @param      drv                 驱动号(目前代码仅支持为 0)
//  220  *  @param      buff                缓冲区地址
//  221  *  @param      sector              扇区号
//  222  *  @param      count               扇区数(1~255)
//  223  *  @return     DRESULT             执行结果
//  224  *  @since      v5.0
//  225  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function disk_read
        THUMB
//  226 DRESULT disk_read (         //读磁盘扇区
//  227     uint8  drv,             /* 物理驱动编号 (0) */
//  228     uint8  *buff,           /* 指向数据缓冲区来存储读到的数据 */
//  229     uint32 sector,          /* 开始的扇区号 (LBA) */
//  230     uint8  count            /* 扇区总数(1..255) */
//  231 )
//  232 {
disk_read:
        PUSH     {R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+20
        SUB      SP,SP,#+28
          CFI CFA R13+48
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R7,R2
        MOVS     R6,R3
//  233     ESDHC_CMD_t command;
//  234 
//  235     if (drv || (!count)) return RES_PARERR;       //drv 只能为 0， count 必须不等于0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??disk_read_0
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??disk_read_1
??disk_read_0:
        MOVS     R0,#+4
        B.N      ??disk_read_2
//  236     if (Stat & STA_NOINIT) return RES_NOTRDY;     //未就绪
??disk_read_1:
        LDR.N    R0,??DataTable6
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+31
        BPL.N    ??disk_read_3
        MOVS     R0,#+3
        B.N      ??disk_read_2
//  237 
//  238     /* 检测参数 */
//  239     if ((NULL == buff))
??disk_read_3:
        CMP      R5,#+0
        BNE.N    ??disk_read_4
//  240     {
//  241         return RES_PARERR;//参数无效
        MOVS     R0,#+4
        B.N      ??disk_read_2
//  242     }
//  243 
//  244     if (!SDHC_card.SDHC)
??disk_read_4:
        LDR.N    R0,??DataTable6_1
        LDRB     R0,[R0, #+16]
        CMP      R0,#+0
        BNE.N    ??disk_read_5
//  245     {
//  246         sector *= SDCARD_BLOCK_SIZE;    /* 如果需要,转换为字节地址 */
        MOV      R0,#+512
        MULS     R7,R0,R7
//  247     }
//  248 
//  249     if (count == 1) /* 单块读 */
??disk_read_5:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+1
        BNE.N    ??disk_read_6
//  250     {
//  251         command.COMMAND = ESDHC_CMD17;
        MOVS     R0,#+17
        STRB     R0,[SP, #+0]
//  252         command.TYPE = ESDHC_TYPE_NORMAL;
        MOVS     R0,#+0
        STRB     R0,[SP, #+1]
//  253         command.ARGUMENT = sector;
        STR      R7,[SP, #+4]
//  254         command.READ = TRUE;
        MOVS     R0,#+1
        STRB     R0,[SP, #+2]
//  255         command.BLOCKS = count;
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        STR      R6,[SP, #+8]
//  256 
//  257         if (ESDHC_IOCTL_OK == SDHC_ioctl (ESDHC_IOCTL_SEND_CMD, &command))
        ADD      R1,SP,#+0
        MOVS     R0,#+1
          CFI FunCall SDHC_ioctl
        BL       SDHC_ioctl
        CMP      R0,#+0
        BNE.N    ??disk_read_7
//  258         {
//  259             if (rcvr_datablock(buff, SDCARD_BLOCK_SIZE))
        MOV      R1,#+512
        MOVS     R0,R5
          CFI FunCall rcvr_datablock
        BL       rcvr_datablock
        CMP      R0,#+0
        BEQ.N    ??disk_read_7
//  260             {
//  261                 count = 0;
        MOVS     R0,#+0
        MOVS     R6,R0
        B.N      ??disk_read_7
//  262             }
//  263         }
//  264     }
//  265     else
//  266     {
//  267         /* 多块读 */
//  268         //
//  269         command.COMMAND = ESDHC_CMD18;
??disk_read_6:
        MOVS     R0,#+18
        STRB     R0,[SP, #+0]
//  270         //command.COMMAND = ESDHC_CMD17;
//  271         command.TYPE = ESDHC_TYPE_NORMAL;
        MOVS     R0,#+0
        STRB     R0,[SP, #+1]
//  272         command.ARGUMENT = sector;
        STR      R7,[SP, #+4]
//  273         command.READ = TRUE;
        MOVS     R0,#+1
        STRB     R0,[SP, #+2]
//  274         command.BLOCKS = count;
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        STR      R6,[SP, #+8]
//  275 
//  276         if (ESDHC_IOCTL_OK == SDHC_ioctl (ESDHC_IOCTL_SEND_CMD, &command))
        ADD      R1,SP,#+0
        MOVS     R0,#+1
          CFI FunCall SDHC_ioctl
        BL       SDHC_ioctl
        CMP      R0,#+0
        BNE.N    ??disk_read_7
//  277         {
//  278             if (rcvr_datablock(buff, SDCARD_BLOCK_SIZE * count))
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        MOV      R0,#+512
        MUL      R1,R0,R6
        MOVS     R0,R5
          CFI FunCall rcvr_datablock
        BL       rcvr_datablock
        CMP      R0,#+0
        BEQ.N    ??disk_read_7
//  279             {
//  280                 count = 0;
        MOVS     R0,#+0
        MOVS     R6,R0
//  281             }
//  282         }
//  283     }
//  284 
//  285     return count ? RES_ERROR : RES_OK;
??disk_read_7:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??disk_read_8
        MOVS     R0,#+1
        B.N      ??disk_read_9
??disk_read_8:
        MOVS     R0,#+0
??disk_read_9:
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
??disk_read_2:
        ADD      SP,SP,#+28
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
          CFI EndBlock cfiBlock2
//  286 }
//  287 
//  288 /*!
//  289  *  @brief      发送数据包到 MMC
//  290  *  @param      buff                发送 SDCARD_BLOCK_SIZE 个字节的数据块的数据缓冲区地址
//  291  *  @param      btr                 字节数目(必须是 4 的倍数)
//  292  *  @since      v5.0
//  293  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function xmit_datablock
          CFI NoCalls
        THUMB
//  294 static int xmit_datablock (const uint8 *buff, uint32 btr    )
//  295 {
xmit_datablock:
        PUSH     {R4-R6}
          CFI R6 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
        MOVS     R2,R0
//  296     uint32  bytes, i;
//  297     uint32  *ptr = (uint32 *)buff;
        MOVS     R3,R2
//  298 
//  299     /* Write data in 4 byte counts */
//  300     bytes = btr;
        MOVS     R4,R1
//  301     while (bytes)
??xmit_datablock_0:
        CMP      R4,#+0
        BEQ.N    ??xmit_datablock_1
//  302     {
//  303         i = bytes > SDCARD_BLOCK_SIZE ? SDCARD_BLOCK_SIZE : bytes;
        CMP      R4,#+512
        BLS.N    ??xmit_datablock_2
        MOV      R5,#+512
        B.N      ??xmit_datablock_3
??xmit_datablock_2:
        MOVS     R5,R4
//  304         bytes -= i;
??xmit_datablock_3:
        SUBS     R4,R4,R5
//  305         for (i = (i + 3) >> 2; i != 0; i--)
        ADDS     R0,R5,#+3
        LSRS     R5,R0,#+2
??xmit_datablock_4:
        CMP      R5,#+0
        BEQ.N    ??xmit_datablock_0
//  306         {
//  307             if (SDHC_IRQSTAT & (SDHC_IRQSTAT_DEBE_MASK | SDHC_IRQSTAT_DCE_MASK | SDHC_IRQSTAT_DTOE_MASK))
        LDR.N    R0,??DataTable6_2  ;; 0x400b1030
        LDR      R0,[R0, #+0]
        TST      R0,#0x700000
        BEQ.N    ??xmit_datablock_5
//  308             {
//  309                 SDHC_IRQSTAT |= SDHC_IRQSTAT_DEBE_MASK | SDHC_IRQSTAT_DCE_MASK | SDHC_IRQSTAT_DTOE_MASK | SDHC_IRQSTAT_BWR_MASK;
        LDR.N    R0,??DataTable6_2  ;; 0x400b1030
        LDR      R0,[R0, #+0]
        ORR      R0,R0,#0x700000
        ORRS     R0,R0,#0x10
        LDR.N    R6,??DataTable6_2  ;; 0x400b1030
        STR      R0,[R6, #+0]
//  310                 return IO_ERROR;
        MOVS     R0,#-1
        B.N      ??xmit_datablock_6
//  311             }
//  312             while (0 == (SDHC_PRSSTAT & SDHC_PRSSTAT_BWEN_MASK)) {};
??xmit_datablock_5:
        LDR.N    R0,??DataTable6_3  ;; 0x400b1024
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+21
        BPL.N    ??xmit_datablock_5
//  313 
//  314             SDHC_DATPORT = *ptr++;
        LDR      R0,[R3, #+0]
        LDR.N    R6,??DataTable6_4  ;; 0x400b1020
        STR      R0,[R6, #+0]
        ADDS     R3,R3,#+4
//  315         }
        SUBS     R5,R5,#+1
        B.N      ??xmit_datablock_4
//  316     }
//  317 
//  318     return 1;
??xmit_datablock_1:
        MOVS     R0,#+1
??xmit_datablock_6:
        POP      {R4-R6}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI R6 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock3
//  319 }
//  320 
//  321 
//  322 
//  323 /*!
//  324  *  @brief      写扇区
//  325  *  @param      drv                 驱动号(目前代码仅支持为 0)
//  326  *  @param      buff                缓冲区地址
//  327  *  @param      sector              扇区号
//  328  *  @param      count               扇区数(1~255)
//  329  *  @return     DRESULT             执行结果
//  330  *  @since      v5.0
//  331  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function disk_write
        THUMB
//  332 DRESULT disk_write (uint8  drv, const uint8  *buff, uint32 sector, uint8  count)
//  333 {
disk_write:
        PUSH     {R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+20
        SUB      SP,SP,#+28
          CFI CFA R13+48
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R7,R2
        MOVS     R6,R3
//  334     ESDHC_CMD_t command;
//  335     //pSDCARD_t    sdcard_ptr = (pSDCARD_t)&SDHC_card;
//  336 
//  337     if (drv || !count) return RES_PARERR;
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??disk_write_0
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??disk_write_1
??disk_write_0:
        MOVS     R0,#+4
        B.N      ??disk_write_2
//  338     if (Stat & STA_NOINIT) return RES_NOTRDY;
??disk_write_1:
        LDR.N    R0,??DataTable6
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+31
        BPL.N    ??disk_write_3
        MOVS     R0,#+3
        B.N      ??disk_write_2
//  339     if (Stat & STA_PROTECT) return RES_WRPRT;
??disk_write_3:
        LDR.N    R0,??DataTable6
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+29
        BPL.N    ??disk_write_4
        MOVS     R0,#+2
        B.N      ??disk_write_2
//  340 
//  341     /* Check parameters */
//  342     if ((NULL == buff))
??disk_write_4:
        CMP      R5,#+0
        BNE.N    ??disk_write_5
//  343     {
//  344         return RES_PARERR;      // 参数无效
        MOVS     R0,#+4
        B.N      ??disk_write_2
//  345     }
//  346 
//  347     if (!SDHC_card.SDHC)
??disk_write_5:
        LDR.N    R0,??DataTable6_1
        LDRB     R0,[R0, #+16]
        CMP      R0,#+0
        BNE.N    ??disk_write_6
//  348     {
//  349         sector *= SDCARD_BLOCK_SIZE;    /* Convert to byte address if needed */
        MOV      R0,#+512
        MULS     R7,R0,R7
//  350     }
//  351 
//  352     if (count == 1) /* Single block write */
??disk_write_6:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+1
        BNE.N    ??disk_write_7
//  353     {
//  354         command.COMMAND = ESDHC_CMD24;
        MOVS     R0,#+24
        STRB     R0,[SP, #+0]
//  355         command.TYPE = ESDHC_TYPE_NORMAL;
        MOVS     R0,#+0
        STRB     R0,[SP, #+1]
//  356         command.ARGUMENT = sector;
        STR      R7,[SP, #+4]
//  357         command.READ = FALSE;
        MOVS     R0,#+0
        STRB     R0,[SP, #+2]
//  358         command.BLOCKS = count;
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        STR      R6,[SP, #+8]
//  359 
//  360         if (ESDHC_IOCTL_OK == SDHC_ioctl (ESDHC_IOCTL_SEND_CMD, &command))
        ADD      R1,SP,#+0
        MOVS     R0,#+1
          CFI FunCall SDHC_ioctl
        BL       SDHC_ioctl
        CMP      R0,#+0
        BNE.N    ??disk_write_8
//  361         {
//  362             if (xmit_datablock(buff, SDCARD_BLOCK_SIZE))
        MOV      R1,#+512
        MOVS     R0,R5
          CFI FunCall xmit_datablock
        BL       xmit_datablock
        CMP      R0,#+0
        BEQ.N    ??disk_write_8
//  363             {
//  364                 count = 0;
        MOVS     R0,#+0
        MOVS     R6,R0
        B.N      ??disk_write_8
//  365             }
//  366         }
//  367     }
//  368     else
//  369     {
//  370         command.COMMAND = ESDHC_CMD25;
??disk_write_7:
        MOVS     R0,#+25
        STRB     R0,[SP, #+0]
//  371         command.TYPE = ESDHC_TYPE_NORMAL;
        MOVS     R0,#+0
        STRB     R0,[SP, #+1]
//  372         command.ARGUMENT = sector;
        STR      R7,[SP, #+4]
//  373         command.READ = FALSE;
        MOVS     R0,#+0
        STRB     R0,[SP, #+2]
//  374         command.BLOCKS = count;
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        STR      R6,[SP, #+8]
//  375 
//  376         if (ESDHC_IOCTL_OK == SDHC_ioctl (ESDHC_IOCTL_SEND_CMD, &command))
        ADD      R1,SP,#+0
        MOVS     R0,#+1
          CFI FunCall SDHC_ioctl
        BL       SDHC_ioctl
        CMP      R0,#+0
        BNE.N    ??disk_write_8
//  377         {
//  378             if (xmit_datablock(buff, SDCARD_BLOCK_SIZE * count))
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        MOV      R0,#+512
        MUL      R1,R0,R6
        MOVS     R0,R5
          CFI FunCall xmit_datablock
        BL       xmit_datablock
        CMP      R0,#+0
        BEQ.N    ??disk_write_9
//  379             {
//  380                 count = 0;
        MOVS     R0,#+0
        MOVS     R6,R0
//  381             }
//  382             while((SDHC_IRQSTAT & SDHC_IRQSTAT_TC_MASK)==0);
??disk_write_9:
        LDR.N    R0,??DataTable6_2  ;; 0x400b1030
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+30
        BPL.N    ??disk_write_9
//  383 
//  384             if (SDHC_IRQSTAT & (SDHC_IRQSTAT_DEBE_MASK | SDHC_IRQSTAT_DCE_MASK | SDHC_IRQSTAT_DTOE_MASK))
        LDR.N    R0,??DataTable6_2  ;; 0x400b1030
        LDR      R0,[R0, #+0]
        TST      R0,#0x700000
        BEQ.N    ??disk_write_10
//  385             {
//  386                 SDHC_IRQSTAT |= SDHC_IRQSTAT_DEBE_MASK | SDHC_IRQSTAT_DCE_MASK | SDHC_IRQSTAT_DTOE_MASK;
        LDR.N    R0,??DataTable6_2  ;; 0x400b1030
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x700000
        LDR.N    R1,??DataTable6_2  ;; 0x400b1030
        STR      R0,[R1, #+0]
//  387             }
//  388             SDHC_IRQSTAT |= SDHC_IRQSTAT_TC_MASK | SDHC_IRQSTAT_BRR_MASK | SDHC_IRQSTAT_BWR_MASK;
??disk_write_10:
        LDR.N    R0,??DataTable6_2  ;; 0x400b1030
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x32
        LDR.N    R1,??DataTable6_2  ;; 0x400b1030
        STR      R0,[R1, #+0]
//  389 
//  390 
//  391         }
//  392     }
//  393 
//  394     /* Wait for card ready / transaction state */
//  395     do
//  396     {
//  397         command.COMMAND = ESDHC_CMD13;
??disk_write_8:
        MOVS     R0,#+13
        STRB     R0,[SP, #+0]
//  398         command.TYPE = ESDHC_TYPE_NORMAL;
        MOVS     R0,#+0
        STRB     R0,[SP, #+1]
//  399         command.ARGUMENT = SDHC_card.ADDRESS;
        LDR.N    R0,??DataTable6_1
        LDR      R0,[R0, #+12]
        STR      R0,[SP, #+4]
//  400         command.READ = FALSE;
        MOVS     R0,#+0
        STRB     R0,[SP, #+2]
//  401         command.BLOCKS = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
//  402         if (ESDHC_IOCTL_OK != SDHC_ioctl (ESDHC_IOCTL_SEND_CMD, &command))
        ADD      R1,SP,#+0
        MOVS     R0,#+1
          CFI FunCall SDHC_ioctl
        BL       SDHC_ioctl
        CMP      R0,#+0
        BEQ.N    ??disk_write_11
//  403         {
//  404             return RES_ERROR;
        MOVS     R0,#+1
        B.N      ??disk_write_2
//  405         }
//  406 
//  407         /* Card status error check */
//  408         if (command.RESPONSE[0] & 0xFFD98008)
??disk_write_11:
        LDR      R0,[SP, #+12]
        LDR.N    R1,??DataTable6_5  ;; 0xffd98008
        TST      R0,R1
        BEQ.N    ??disk_write_12
//  409         {
//  410             return RES_ERROR;
        MOVS     R0,#+1
        B.N      ??disk_write_2
//  411         }
//  412     }
//  413     while (0x000000900 != (command.RESPONSE[0] & 0x00001F00));
??disk_write_12:
        LDR      R0,[SP, #+12]
        ANDS     R0,R0,#0x1F00
        CMP      R0,#+2304
        BNE.N    ??disk_write_8
//  414 
//  415     return count ? RES_ERROR : RES_OK;
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??disk_write_13
        MOVS     R0,#+1
        B.N      ??disk_write_14
??disk_write_13:
        MOVS     R0,#+0
??disk_write_14:
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
??disk_write_2:
        ADD      SP,SP,#+28
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
          CFI EndBlock cfiBlock4
//  416 }
//  417 
//  418 
//  419 /*!
//  420  *  @brief      硬盘 控制命令
//  421  *  @param      drv                 驱动号
//  422  *  @param      ctrl                控制命令
//  423  *  @param      buff                缓冲区地址，用于接收和发送控制数据
//  424  *  @since      v5.0
//  425  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function disk_ioctl
        THUMB
//  426 DRESULT disk_ioctl (
//  427     uint8 drv,      /* Physical drive nmuber (0) */
//  428     uint8 ctrl,     /* Control code */
//  429     void  *buff     /* Buffer to send/receive control data */
//  430 )
//  431 {
disk_ioctl:
        PUSH     {R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+20
        SUB      SP,SP,#+28
          CFI CFA R13+48
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  432     DRESULT              res;
//  433     ESDHC_CMD_t command;
//  434     //pSDCARD_t  sdcard_ptr = (pSDCARD_t)&SDHC_card;
//  435 
//  436     if (drv) return RES_PARERR;
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??disk_ioctl_0
        MOVS     R0,#+4
        B.N      ??disk_ioctl_1
//  437 
//  438     res = RES_ERROR;
??disk_ioctl_0:
        MOVS     R0,#+1
        MOVS     R7,R0
//  439 
//  440     if (Stat & STA_NOINIT) return RES_NOTRDY;
        LDR.N    R0,??DataTable6
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+31
        BPL.N    ??disk_ioctl_2
        MOVS     R0,#+3
        B.N      ??disk_ioctl_1
//  441 
//  442     switch (ctrl)
??disk_ioctl_2:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??disk_ioctl_3
        CMP      R5,#+2
        BEQ.N    ??disk_ioctl_4
        BCC.N    ??disk_ioctl_5
        CMP      R5,#+3
        BEQ.N    ??disk_ioctl_6
        B.N      ??disk_ioctl_7
//  443     {
//  444     case CTRL_SYNC :        /* Make sure that no pending write process. Do not remove this or written sector might not left updated. */
//  445         res = RES_OK;
??disk_ioctl_3:
        MOVS     R0,#+0
        MOVS     R7,R0
//  446         break;
        B.N      ??disk_ioctl_8
//  447 
//  448     case GET_SECTOR_COUNT : /* Get number of sectors on the disk (uint32) */
//  449         *(unsigned long *)buff = SDHC_card.NUM_BLOCKS;
??disk_ioctl_5:
        LDR.N    R0,??DataTable6_1
        LDR      R0,[R0, #+8]
        STR      R0,[R6, #+0]
//  450         res = RES_OK;
        MOVS     R0,#+0
        MOVS     R7,R0
//  451         break;
        B.N      ??disk_ioctl_8
//  452 
//  453     case GET_SECTOR_SIZE :  /* Get R/W sector size (WORD) */
//  454         *(unsigned short *)buff = SDCARD_BLOCK_SIZE;
??disk_ioctl_4:
        MOV      R0,#+512
        STRH     R0,[R6, #+0]
//  455         res = RES_OK;
        MOVS     R0,#+0
        MOVS     R7,R0
//  456         break;
        B.N      ??disk_ioctl_8
//  457 
//  458     case GET_BLOCK_SIZE :           /* Get erase block size in unit of sector (uint32) */
//  459         // Implementar
//  460         command.COMMAND = ESDHC_CMD9;
??disk_ioctl_6:
        MOVS     R0,#+9
        STRB     R0,[SP, #+0]
//  461         command.TYPE = ESDHC_TYPE_NORMAL;
        MOVS     R0,#+0
        STRB     R0,[SP, #+1]
//  462         command.ARGUMENT = SDHC_card.ADDRESS;
        LDR.N    R0,??DataTable6_1
        LDR      R0,[R0, #+12]
        STR      R0,[SP, #+4]
//  463         command.READ = FALSE;
        MOVS     R0,#+0
        STRB     R0,[SP, #+2]
//  464         command.BLOCKS = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
//  465         if (ESDHC_IOCTL_OK != SDHC_ioctl (ESDHC_IOCTL_SEND_CMD, &command))
        ADD      R1,SP,#+0
        MOVS     R0,#+1
          CFI FunCall SDHC_ioctl
        BL       SDHC_ioctl
        CMP      R0,#+0
        BEQ.N    ??disk_ioctl_9
//  466         {
//  467             return RES_ERROR;
        MOVS     R0,#+1
        B.N      ??disk_ioctl_1
//  468         }
//  469         if (0 == (command.RESPONSE[3] & 0x00C00000))
??disk_ioctl_9:
        LDR      R0,[SP, #+24]
        TST      R0,#0xC00000
        BNE.N    ??disk_ioctl_10
//  470         {
//  471             //SD V1
//  472             *(unsigned long *)buff = ((((command.RESPONSE[2] >> 18) & 0x7F) + 1) << (((command.RESPONSE[3] >> 8) & 0x03) - 1));
        LDR      R0,[SP, #+20]
        UBFX     R0,R0,#+18,#+7
        ADDS     R0,R0,#+1
        LDR      R1,[SP, #+24]
        LSRS     R1,R1,#+8
        ANDS     R1,R1,#0x3
        SUBS     R1,R1,#+1
        LSLS     R0,R0,R1
        STR      R0,[R6, #+0]
//  473         }
//  474         else
//  475         {
//  476             //SD V2
//  477             // Implementar
//  478             //*(uint32*)buff = (((command.RESPONSE[2] >> 18) & 0x7F) << (((command.RESPONSE[3] >> 8) & 0x03) - 1));
//  479         }
//  480         res = RES_OK;
??disk_ioctl_10:
        MOVS     R0,#+0
        MOVS     R7,R0
//  481         break;
        B.N      ??disk_ioctl_8
//  482 
//  483     default:
//  484         res = RES_PARERR;
??disk_ioctl_7:
        MOVS     R0,#+4
        MOVS     R7,R0
//  485     }
//  486 
//  487     return res;
??disk_ioctl_8:
        MOVS     R0,R7
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
??disk_ioctl_1:
        ADD      SP,SP,#+28
          CFI CFA R13+20
        POP      {R4-R7,PC}       ;; return
          CFI EndBlock cfiBlock5
//  488 }
//  489 
//  490 
//  491 /*!
//  492  *  @brief      获取硬盘状态
//  493  *  @return     硬盘状态
//  494  *  @since      v5.0
//  495  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function disk_status
          CFI NoCalls
        THUMB
//  496 DSTATUS disk_status (
//  497     uint8 drv       /* Physical drive nmuber (0) */
//  498 )
//  499 {
disk_status:
        MOVS     R1,R0
//  500     if (drv) return STA_NOINIT;     /* Supports only single drive */
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??disk_status_0
        MOVS     R0,#+1
        B.N      ??disk_status_1
//  501     return Stat;
??disk_status_0:
        LDR.N    R0,??DataTable6
        LDRB     R0,[R0, #+0]
??disk_status_1:
        BX       LR               ;; return
          CFI EndBlock cfiBlock6
//  502 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     Stat

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     SDHC_card

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
        DC32     0x400b1030

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_3:
        DC32     0x400b1024

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_4:
        DC32     0x400b1020

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_5:
        DC32     0xffd98008
//  503 
//  504 
//  505 /*!
//  506  *  @brief      获取时间(为了满足接口需要而添加，实际上并没用实现功能)
//  507  *  @return     结果总是为 0
//  508  *  @since      v5.0
//  509  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function get_fattime
          CFI NoCalls
        THUMB
//  510 uint32  get_fattime (void)
//  511 {
//  512     return   0;
get_fattime:
        MOVS     R0,#+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock7
//  513 }

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  514 
//  515 
// 
//     1 byte  in section .data
// 1 606 bytes in section .text
// 
// 1 606 bytes of CODE memory
//     1 byte  of DATA memory
//
//Errors: none
//Warnings: none
