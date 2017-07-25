///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       21/Mar/2017  16:04:49
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\znc\project\K60FN\network_car\Chip\src\MK60_flexbus.c
//    Command line =  
//        E:\znc\project\K60FN\network_car\Chip\src\MK60_flexbus.c -D DEBUG -D
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
//        E:\znc\project\K60FN\network_car\Prj\IAR\FN15_Debug\List\MK60_flexbus.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "1"
        RTMODEL "__dlib_full_locale_support", "1"
        AAPCS BASE,INTERWORK,VFP
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN port_init

        PUBLIC flexbus_8080_init
        
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
        
// E:\znc\project\K60FN\network_car\Chip\src\MK60_flexbus.c
//    1 /*!
//    2  *     COPYRIGHT NOTICE
//    3  *     Copyright (c) 2013,山外科技
//    4  *     All rights reserved.
//    5  *     技术讨论：山外论坛 http://www.vcan123.com
//    6  *
//    7  *     除注明出处外，以下所有内容版权均属山外科技所有，未经允许，不得用于商业用途，
//    8  *     修改内容时必须保留山外科技的版权声明。
//    9  *
//   10  * @file       MK60_flexbus.c
//   11  * @brief      flexbus函数库
//   12  * @author     山外科技
//   13  * @version    v5.0
//   14  * @date       2013-09-02
//   15  */
//   16 
//   17 #include "common.h"
//   18 #include "MK60_flexbus.h"
//   19 
//   20 
//   21 /*!
//   22  *  @brief      flexbus初始化为8080协议
//   23  *  @since      v5.0
//   24  */

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function flexbus_8080_init
        THUMB
//   25 void flexbus_8080_init()
//   26 {
flexbus_8080_init:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   27     //flexbus 本身不直接支持 8080协议，而是支持 6800协议
//   28     //我们可以配置 cmd 与 data 数据的地址不同，从而通过地址线来区分命令和数据
//   29 
//   30     SIM_SOPT2 |= SIM_SOPT2_FBSL(3);             //FlexBus安全水平:允许指令和数据访问
        LDR.N    R0,??flexbus_8080_init_0  ;; 0x40048004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x300
        LDR.N    R1,??flexbus_8080_init_0  ;; 0x40048004
        STR      R0,[R1, #+0]
//   31     SIM_SCGC7 |= SIM_SCGC7_FLEXBUS_MASK;        //使能时钟
        LDR.N    R0,??flexbus_8080_init_0+0x4  ;; 0x40048040
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??flexbus_8080_init_0+0x4  ;; 0x40048040
        STR      R0,[R1, #+0]
//   32 
//   33     //配置数据管脚复用
//   34     port_init(PTD6  , ALT5 | HDS);              //PTD6 复用为 fb_ad[0] ,配置为 输出高驱动能力
        MOV      R1,#+1344
        MOVS     R0,#+102
          CFI FunCall port_init
        BL       port_init
//   35     port_init(PTD5  , ALT5 | HDS);              //PTD5 复用为 fb_ad[1] ,配置为 输出高驱动能力
        MOV      R1,#+1344
        MOVS     R0,#+101
          CFI FunCall port_init
        BL       port_init
//   36     port_init(PTD4  , ALT5 | HDS);              //PTD4 复用为 fb_ad[2] ,配置为 输出高驱动能力
        MOV      R1,#+1344
        MOVS     R0,#+100
          CFI FunCall port_init
        BL       port_init
//   37     port_init(PTD3  , ALT5 | HDS);              //PTD3 复用为 fb_ad[3] ,配置为 输出高驱动能力
        MOV      R1,#+1344
        MOVS     R0,#+99
          CFI FunCall port_init
        BL       port_init
//   38     port_init(PTD2  , ALT5 | HDS);              //PTD2 复用为 fb_ad[4] ,配置为 输出高驱动能力
        MOV      R1,#+1344
        MOVS     R0,#+98
          CFI FunCall port_init
        BL       port_init
//   39     port_init(PTC10 , ALT5 | HDS);              //PTC10复用为 fb_ad[5] ,配置为 输出高驱动能力
        MOV      R1,#+1344
        MOVS     R0,#+74
          CFI FunCall port_init
        BL       port_init
//   40     port_init(PTC9  , ALT5 | HDS);              //PTC9 复用为 fb_ad[6] ,配置为 输出高驱动能力
        MOV      R1,#+1344
        MOVS     R0,#+73
          CFI FunCall port_init
        BL       port_init
//   41     port_init(PTC8  , ALT5 | HDS);              //PTC8 复用为 fb_ad[7] ,配置为 输出高驱动能力
        MOV      R1,#+1344
        MOVS     R0,#+72
          CFI FunCall port_init
        BL       port_init
//   42     port_init(PTC7  , ALT5 | HDS);              //PTC7 复用为 fb_ad[8] ,配置为 输出高驱动能力
        MOV      R1,#+1344
        MOVS     R0,#+71
          CFI FunCall port_init
        BL       port_init
//   43     port_init(PTC6  , ALT5 | HDS);              //PTC6 复用为 fb_ad[9] ,配置为 输出高驱动能力
        MOV      R1,#+1344
        MOVS     R0,#+70
          CFI FunCall port_init
        BL       port_init
//   44     port_init(PTC5  , ALT5 | HDS);              //PTC5 复用为 fb_ad[10],配置为 输出高驱动能力
        MOV      R1,#+1344
        MOVS     R0,#+69
          CFI FunCall port_init
        BL       port_init
//   45     port_init(PTC4  , ALT5 | HDS);              //PTC4 复用为 fb_ad[11],配置为 输出高驱动能力
        MOV      R1,#+1344
        MOVS     R0,#+68
          CFI FunCall port_init
        BL       port_init
//   46     port_init(PTC2  , ALT5 | HDS);              //PTC2 复用为 fb_ad[12],配置为 输出高驱动能力
        MOV      R1,#+1344
        MOVS     R0,#+66
          CFI FunCall port_init
        BL       port_init
//   47     port_init(PTC1  , ALT5 | HDS);              //PTC1 复用为 fb_ad[13],配置为 输出高驱动能力
        MOV      R1,#+1344
        MOVS     R0,#+65
          CFI FunCall port_init
        BL       port_init
//   48     port_init(PTC0  , ALT5 | HDS);              //PTC0 复用为 fb_ad[14],配置为 输出高驱动能力
        MOV      R1,#+1344
        MOVS     R0,#+64
          CFI FunCall port_init
        BL       port_init
//   49     port_init(PTB18 , ALT5 | HDS);              //PTB18复用为 fb_ad[15],配置为 输出高驱动能力
        MOV      R1,#+1344
        MOVS     R0,#+50
          CFI FunCall port_init
        BL       port_init
//   50 
//   51     //配置控制管脚复用
//   52     //8080总线,即Intel总线,需要四根线控制线：RD写使能, WR读使能, RS数据/指令选择, CS片选
//   53     port_init(PTB19 , ALT5 | HDS);              //PTB19复用为 fb_oe_b  ,配置为 输出高驱动能力 , fb_oe_b 时序符合 8080 总线的 RD写使能
        MOV      R1,#+1344
        MOVS     R0,#+51
          CFI FunCall port_init
        BL       port_init
//   54     port_init(PTD1  , ALT5 | HDS);              //PTD1 复用为 fb_cs0_b ,配置为 输出高驱动能力 , fb_cs0_b时序符合 8080 总线的 CS片选
        MOV      R1,#+1344
        MOVS     R0,#+97
          CFI FunCall port_init
        BL       port_init
//   55     port_init(PTC11 , ALT5 | HDS);              //PTC11复用为 fb_r/w   ,配置为 输出高驱动能力 , fb_r/w  时序符合 8080 总线的 WR读使能
        MOV      R1,#+1344
        MOVS     R0,#+75
          CFI FunCall port_init
        BL       port_init
//   56 
//   57     //目前还缺 8080 总线的 RS数据/指令选择线
//   58     //flexbus可配置成两块地址不连续的块（高16位地址不相同），从而利用地址线来符合 8080 总线的 RS数据/指令选择线
//   59     //高16位的地址，FB_BA 我们配置为 0x6000 ，因而可选择的 地址线有 fb_ad[16] ~ fb_ad[28]
//   60     //FB_BAM配置为 0x0800 ，即选择 fb_ad[27] 作为 RS 。(0x0800 0000 == 1<<27 )
//   61     // RS == 1 时 传输数据，RS == 0 时传输命令
//   62     //因而 0x6000 0000 为 命令地址 ， 0x6800 0000 为数据端口
//   63     port_init(PTC12 , ALT5 | HDS);              //PTC12复用为 fb_ad[27],配置为 输出高驱动能力 , fb_ad[27]作为8080 总线的 RS数据/指令选择线
        MOV      R1,#+1344
        MOVS     R0,#+76
          CFI FunCall port_init
        BL       port_init
//   64 
//   65     FB_CSAR(0) = FB_CSAR_BA(FB_BA);             // 基地址 Base address
        MOVS     R0,#+1610612736
        LDR.N    R1,??flexbus_8080_init_0+0x8  ;; 0x4000c000
        STR      R0,[R1, #+0]
//   66     FB_CSMR(0) =  ( 0
//   67                     | FB_CSMR_BAM(FB_BAM)       // BAM = 0x0800 ,基地地址掩码 为 0x,800 FFFF ,即 片选有效的地址为 基地址 ~ （基地址 + 基地地址掩码） ,0x0800 0000 对应与 FB_AD27
//   68                     | FB_CSMR_V_MASK            // 使用片选信号 FB_CS0
//   69                   );
        LDR.N    R0,??flexbus_8080_init_0+0xC  ;; 0x8000001
        LDR.N    R1,??flexbus_8080_init_0+0x10  ;; 0x4000c004
        STR      R0,[R1, #+0]
//   70     FB_CSCR(0) =    FB_CSCR_BLS_MASK            //右对齐
//   71                     | FB_CSCR_PS(2)             //16Byte数据
//   72                     | FB_CSCR_AA_MASK           // 自动应答
//   73                     ;
        MOV      R0,#+896
        LDR.N    R1,??flexbus_8080_init_0+0x14  ;; 0x4000c008
        STR      R0,[R1, #+0]
//   74 
//   75 }
        POP      {R0,PC}          ;; return
        Nop      
        DATA
??flexbus_8080_init_0:
        DC32     0x40048004
        DC32     0x40048040
        DC32     0x4000c000
        DC32     0x8000001
        DC32     0x4000c004
        DC32     0x4000c008
          CFI EndBlock cfiBlock0

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
// 276 bytes in section .text
// 
// 276 bytes of CODE memory
//
//Errors: none
//Warnings: none
