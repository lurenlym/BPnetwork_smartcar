///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       21/Mar/2017  16:04:46
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\znc\project\K60FN\network_car\Chip\src\MK60_DWT.c
//    Command line =  
//        E:\znc\project\K60FN\network_car\Chip\src\MK60_DWT.c -D DEBUG -D
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
//        E:\znc\project\K60FN\network_car\Prj\IAR\FN15_Debug\List\MK60_DWT.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "1"
        RTMODEL "__dlib_full_locale_support", "1"
        AAPCS BASE,INTERWORK,VFP
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN core_clk_khz

        PUBLIC dwt_delay_ms
        PUBLIC dwt_delay_us
        
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
        
// E:\znc\project\K60FN\network_car\Chip\src\MK60_DWT.c
//    1 /*!
//    2  *     COPYRIGHT NOTICE
//    3  *     Copyright (c) 2013,山外科技
//    4  *     All rights reserved.
//    5  *     技术讨论：山外论坛 http://www.vcan123.com
//    6  *
//    7  *     除注明出处外，以下所有内容版权均属山外科技所有，未经允许，不得用于商业用途，
//    8  *     修改内容时必须保留山外科技的版权声明。
//    9  *
//   10  * @file       MK60_dwt.h
//   11  * @brief      flash函数库
//   12  * @author     山外科技
//   13  * @version    v5.0
//   14  * @date       2013-10-22
//   15  */
//   16 
//   17 #include "common.h"
//   18 
//   19 #define  DWT_CLK_HHZ                        (core_clk_khz )
//   20 #define  DEM_CR_TRCENA_MASK                 (1 << 24)
//   21 #define  DWT_CTRL_CYCCNTENA                 (1 <<  0)
//   22 
//   23 /*!
//   24  *  @brief      延时(us)
//   25  *  @param      us      延时时间
//   26  *  @since      v5.0
//   27  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function dwt_delay_us
          CFI NoCalls
        THUMB
//   28 void dwt_delay_us(uint32 us)
//   29 {
dwt_delay_us:
        PUSH     {R4,R5}
          CFI R5 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//   30     uint32 st,et,ts;
//   31     DEMCR            |=  DEM_CR_TRCENA_MASK;        //使能 调试时钟 （默认已经打开）
        LDR.N    R4,??DataTable0  ;; 0xe000edfc
        LDR      R4,[R4, #+0]
        ORRS     R4,R4,#0x1000000
        LDR.N    R5,??DataTable0  ;; 0xe000edfc
        STR      R4,[R5, #+0]
//   32     DWT_CTRL         |=  DWT_CTRL_CYCCNTENA;
        LDR.N    R4,??DataTable0_1  ;; 0xe0001000
        LDR      R4,[R4, #+0]
        ORRS     R4,R4,#0x1
        LDR.N    R5,??DataTable0_1  ;; 0xe0001000
        STR      R4,[R5, #+0]
//   33 
//   34     st = DWT_CYCCNT;
        LDR.N    R4,??DataTable0_2  ;; 0xe0001004
        LDR      R4,[R4, #+0]
        MOVS     R1,R4
//   35     ts =  us * (DWT_CLK_HHZ /(1000));
        LDR.N    R4,??DataTable0_3
        LDR      R4,[R4, #+0]
        MOV      R5,#+1000
        SDIV     R4,R4,R5
        MUL      R4,R4,R0
        MOVS     R3,R4
//   36     et = st + ts;
        ADDS     R4,R3,R1
        MOVS     R2,R4
//   37     if(et < st)
        CMP      R2,R1
        BCS.N    ??dwt_delay_us_0
//   38     {
//   39         //溢出，需要转动一周
//   40         while(DWT_CYCCNT > et);      //等待 DWT_CYCCNT 溢出 返回0
??dwt_delay_us_1:
        LDR.N    R4,??DataTable0_2  ;; 0xe0001004
        LDR      R4,[R4, #+0]
        CMP      R2,R4
        BCC.N    ??dwt_delay_us_1
//   41     }
//   42 
//   43     while(DWT_CYCCNT < et);      //等待 DWT_CYCCNT 到底计数值
??dwt_delay_us_0:
        LDR.N    R4,??DataTable0_2  ;; 0xe0001004
        LDR      R4,[R4, #+0]
        CMP      R4,R2
        BCC.N    ??dwt_delay_us_0
//   44 }
        POP      {R4,R5}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC32     0xe000edfc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_1:
        DC32     0xe0001000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_2:
        DC32     0xe0001004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_3:
        DC32     core_clk_khz
//   45 
//   46 /*!
//   47  *  @brief      延时(ms)
//   48  *  @param      ms      延时时间
//   49  *  @since      v5.0
//   50  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function dwt_delay_ms
        THUMB
//   51 void dwt_delay_ms(uint32 ms)
//   52 {
dwt_delay_ms:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//   53     while(ms--)
??dwt_delay_ms_0:
        MOVS     R0,R4
        SUBS     R4,R0,#+1
        CMP      R0,#+0
        BEQ.N    ??dwt_delay_ms_1
//   54     {
//   55         dwt_delay_us(1000);
        MOV      R0,#+1000
          CFI FunCall dwt_delay_us
        BL       dwt_delay_us
        B.N      ??dwt_delay_ms_0
//   56     }
//   57 }
??dwt_delay_ms_1:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock1

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
// 118 bytes in section .text
// 
// 118 bytes of CODE memory
//
//Errors: none
//Warnings: none
