///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       21/Mar/2017  16:05:06
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\znc\project\K60FN\network_car\Chip\src\MK60_SysTick.c
//    Command line =  
//        E:\znc\project\K60FN\network_car\Chip\src\MK60_SysTick.c -D DEBUG -D
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
//        E:\znc\project\K60FN\network_car\Prj\IAR\FN15_Debug\List\MK60_SysTick.s
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

        PUBLIC systick_delay
        PUBLIC systick_delay_ms
        PUBLIC systick_timing
        
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
        
// E:\znc\project\K60FN\network_car\Chip\src\MK60_SysTick.c
//    1 /*!
//    2  *     COPYRIGHT NOTICE
//    3  *     Copyright (c) 2013,山外科技
//    4  *     All rights reserved.
//    5  *     技术讨论：山外论坛 http://www.vcan123.com
//    6  *
//    7  *     除注明出处外，以下所有内容版权均属山外科技所有，未经允许，不得用于商业用途，
//    8  *     修改内容时必须保留山外科技的版权声明。
//    9  *
//   10  * @file       MK60_SysTick.c
//   11  * @brief      SysTick 驱动函数，包括延时
//   12  * @author     山外科技
//   13  * @version    v5.0
//   14  * @date       2013-10-08
//   15  */
//   16 
//   17 
//   18 #include "common.h"

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function NVIC_SetPriority
          CFI NoCalls
        THUMB
// static __interwork __softfp void NVIC_SetPriority(IRQn_Type, uint32_t)
NVIC_SetPriority:
        PUSH     {R4}
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+4
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BPL.N    ??NVIC_SetPriority_0
        LSLS     R2,R1,#+4
        LDR.N    R3,??DataTable3  ;; 0xe000ed18
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        ANDS     R4,R0,#0xF
        ADDS     R3,R4,R3
        STRB     R2,[R3, #-4]
        B.N      ??NVIC_SetPriority_1
??NVIC_SetPriority_0:
        LSLS     R2,R1,#+4
        LDR.N    R3,??DataTable3_1  ;; 0xe000e400
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        STRB     R2,[R0, R3]
??NVIC_SetPriority_1:
        POP      {R4}
          CFI R4 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
//   19 #include "MK60_SysTick.h"
//   20 /*
//   21 Cortex-M4 的内核中包含一个 SysTick 时钟。SysTick?为一个?24?位递减计数器，
//   22 SysTick 设定初值并使能后，每经过 1 个系统时钟周期，计数值就减 1。
//   23 计数到 0 时，SysTick 计数器自动重装初值并继续计数，
//   24 同时内部的 COUNTFLAG 标志会置位，触发中断(如果中断使能情况下)。
//   25 */
//   26 
//   27 
//   28 /*!
//   29  *  @brief      SysTick延时函数
//   30  *  @param      time          LPTMR延时时间(0~65535)
//   31  *  @since      v5.0
//   32  *  Sample usage:       systick_delay(32);     // systick 延时32 个系统周期
//   33  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function systick_delay
        THUMB
//   34 void systick_delay(uint32 time)
//   35 {
systick_delay:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//   36     if(time == 0)
        CMP      R4,#+0
        BEQ.N    ??systick_delay_0
//   37     {
//   38         return;
//   39     }
//   40 
//   41     ASSERT(time <= (SysTick_RVR_RELOAD_MASK >> SysTick_RVR_RELOAD_SHIFT));  //24位
??systick_delay_1:
        CMP      R4,#+16777216
        BCC.N    ??systick_delay_2
        MOVS     R1,#+41
        LDR.N    R0,??DataTable3_2
          CFI FunCall assert_failed
        BL       assert_failed
//   42 
//   43     SYST_CSR = 0x00;                        //先关了 systick ,清标志位
??systick_delay_2:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_3  ;; 0xe000e010
        STR      R0,[R1, #+0]
//   44 
//   45     SYST_RVR = time;                        //设置延时时间
        LDR.N    R0,??DataTable3_4  ;; 0xe000e014
        STR      R4,[R0, #+0]
//   46 
//   47     SYST_CVR = 0x00;                        //清空计数器
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_5  ;; 0xe000e018
        STR      R0,[R1, #+0]
//   48 
//   49     SYST_CSR = ( 0
//   50                  | SysTick_CSR_ENABLE_MASK       //使能 systick
//   51                  //| SysTick_CSR_TICKINT_MASK    //使能中断 (注释了表示关闭中断)
//   52                  | SysTick_CSR_CLKSOURCE_MASK    //时钟源选择 ( core clk)
//   53                );
        MOVS     R0,#+5
        LDR.N    R1,??DataTable3_3  ;; 0xe000e010
        STR      R0,[R1, #+0]
//   54 
//   55     while( !(SYST_CSR & SysTick_CSR_COUNTFLAG_MASK));   //等待时间到
??systick_delay_3:
        LDR.N    R0,??DataTable3_3  ;; 0xe000e010
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+15
        BPL.N    ??systick_delay_3
//   56 }
??systick_delay_0:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock1
//   57 
//   58 /*!
//   59  *  @brief      SysTick延时函数
//   60  *  @param      ms          延时时间
//   61  *  @since      v5.0
//   62  *  Sample usage:       systick_delay_ms(32);     // systick 延时32 ms
//   63  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function systick_delay_ms
        THUMB
//   64 void systick_delay_ms(uint32 ms)
//   65 {
systick_delay_ms:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//   66     while(ms--)
??systick_delay_ms_0:
        MOVS     R0,R4
        SUBS     R4,R0,#+1
        CMP      R0,#+0
        BEQ.N    ??systick_delay_ms_1
//   67     {
//   68         systick_delay(SYSTICK_CLK_KHZ);
        LDR.N    R0,??DataTable3_6
        LDR      R0,[R0, #+0]
          CFI FunCall systick_delay
        BL       systick_delay
        B.N      ??systick_delay_ms_0
//   69     }
//   70 }
??systick_delay_ms_1:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock2
//   71 
//   72 /*!
//   73  *  @brief      SysTick定时函数
//   74  *  @param      time          定时时间(0~65535)
//   75  *  @since      v5.0
//   76  *  Sample usage:       systick_timing(32);     // systick 定时 32 个系统周期
//   77  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function systick_timing
        THUMB
//   78 void systick_timing(uint32 time)
//   79 {
systick_timing:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//   80 
//   81     ASSERT(time <= (SysTick_RVR_RELOAD_MASK >> SysTick_RVR_RELOAD_SHIFT));  //24位
        CMP      R4,#+16777216
        BCC.N    ??systick_timing_0
        MOVS     R1,#+81
        LDR.N    R0,??DataTable3_2
          CFI FunCall assert_failed
        BL       assert_failed
//   82 
//   83     SYST_RVR = time;                        //设置延时时间
??systick_timing_0:
        LDR.N    R0,??DataTable3_4  ;; 0xe000e014
        STR      R4,[R0, #+0]
//   84 
//   85     //设置优先级
//   86     NVIC_SetPriority (SysTick_IRQn, (1 << __NVIC_PRIO_BITS) - 1); /* set Priority for Cortex-M4 System Interrupts */
        MOVS     R1,#+15
        MOVS     R0,#-1
          CFI FunCall NVIC_SetPriority
        BL       NVIC_SetPriority
//   87 
//   88     SYST_CVR = 0x00;                        //清空计数器
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_5  ;; 0xe000e018
        STR      R0,[R1, #+0]
//   89 
//   90     SYST_CSR = ( 0
//   91                  | SysTick_CSR_ENABLE_MASK       //使能 systick
//   92                  | SysTick_CSR_TICKINT_MASK      //使能中断 (注释了表示关闭中断)
//   93                  | SysTick_CSR_CLKSOURCE_MASK    //时钟源选择 ( core clk)
//   94                );
        MOVS     R0,#+7
        LDR.N    R1,??DataTable3_3  ;; 0xe000e010
        STR      R0,[R1, #+0]
//   95 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     0xe000ed18

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     0xe000e400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     ?_0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     0xe000e010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_4:
        DC32     0xe000e014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_5:
        DC32     0xe000e018

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_6:
        DC32     core_clk_khz

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_0:
        DATA
        DC8 45H, 3AH, 5CH, 7AH, 6EH, 63H, 5CH, 70H
        DC8 72H, 6FH, 6AH, 65H, 63H, 74H, 5CH, 4BH
        DC8 36H, 30H, 46H, 4EH, 5CH, 6EH, 65H, 74H
        DC8 77H, 6FH, 72H, 6BH, 5FH, 63H, 61H, 72H
        DC8 5CH, 43H, 68H, 69H, 70H, 5CH, 73H, 72H
        DC8 63H, 5CH, 4DH, 4BH, 36H, 30H, 5FH, 53H
        DC8 79H, 73H, 54H, 69H, 63H, 6BH, 2EH, 63H
        DC8 0
        DC8 0, 0, 0

        END
//   96 
//   97 
//   98 
//   99 
// 
//  60 bytes in section .rodata
// 190 bytes in section .text
// 
// 190 bytes of CODE  memory
//  60 bytes of CONST memory
//
//Errors: none
//Warnings: none
