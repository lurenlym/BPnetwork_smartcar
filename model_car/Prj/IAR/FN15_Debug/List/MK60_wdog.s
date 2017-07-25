///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       21/Mar/2017  16:05:12
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\znc\project\K60FN\network_car\Chip\src\MK60_wdog.c
//    Command line =  
//        E:\znc\project\K60FN\network_car\Chip\src\MK60_wdog.c -D DEBUG -D
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
//        E:\znc\project\K60FN\network_car\Prj\IAR\FN15_Debug\List\MK60_wdog.s
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

        PUBLIC wdog_disable
        PUBLIC wdog_enable
        PUBLIC wdog_feed
        PUBLIC wdog_init_ms
        
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
        
// E:\znc\project\K60FN\network_car\Chip\src\MK60_wdog.c
//    1 /*!
//    2  *     COPYRIGHT NOTICE
//    3  *     Copyright (c) 2013,山外科技
//    4  *     All rights reserved.
//    5  *     技术讨论：山外论坛 http://www.vcan123.com
//    6  *
//    7  *     除注明出处外，以下所有内容版权均属山外科技所有，未经允许，不得用于商业用途，
//    8  *     修改内容时必须保留山外科技的版权声明。
//    9  *
//   10  * @file       MK60_wdog.c
//   11  * @brief      看门狗驱动函数
//   12  * @author     山外科技
//   13  * @version    v5.1
//   14  * @date       2014-04-25
//   15  */
//   16 
//   17 #include "common.h"
//   18 #include "MK60_wdog.h"
//   19 
//   20 //内部函数声明
//   21 static void wdog_unlock(void);          //看门狗解锁
//   22 
//   23 /*!
//   24  *  @brief      初始化看门狗，设置喂狗时间
//   25  *  @param      cnt     喂狗时间（单位为 ms）
//   26  *  @since      v5.0
//   27  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function wdog_init_ms
        THUMB
//   28 void wdog_init_ms(uint32 ms)
//   29 {
wdog_init_ms:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//   30     ASSERT(ms >= 4);                                //断言，计数时间最小为4个时钟周期（WDOG_TOVALL里说明）
        CMP      R4,#+4
        BCS.N    ??wdog_init_ms_0
        MOVS     R1,#+30
        LDR.N    R0,??DataTable4
          CFI FunCall assert_failed
        BL       assert_failed
//   31 
//   32     wdog_unlock();                                  //解锁看门狗，这样才能配置看门狗
??wdog_init_ms_0:
          CFI FunCall wdog_unlock
        BL       wdog_unlock
//   33 
//   34     WDOG_PRESC = WDOG_PRESC_PRESCVAL(0);            //设置分频系数 = PRESCVAL +1(PRESCVAL取值范围为0~7)
        MOVS     R0,#+0
        LDR.N    R1,??DataTable4_1  ;; 0x40052016
        STRH     R0,[R1, #+0]
//   35 
//   36     WDOG_TOVALH = ms >> 16;                         //设置喂狗时间
        LSRS     R0,R4,#+16
        LDR.N    R1,??DataTable4_2  ;; 0x40052004
        STRH     R0,[R1, #+0]
//   37     WDOG_TOVALL = (uint16)ms;
        LDR.N    R0,??DataTable4_3  ;; 0x40052006
        STRH     R4,[R0, #+0]
//   38 
//   39     WDOG_STCTRLH = ( 0
//   40                     | WDOG_STCTRLH_WDOGEN_MASK     //WDOGEN置位，使能 看门狗
//   41                     //| WDOG_STCTRLH_CLKSRC_MASK   //看门狗时钟选择（0为 LDO ，1为bus 时钟）
//   42                     | WDOG_STCTRLH_ALLOWUPDATE_MASK
//   43                     | WDOG_STCTRLH_STOPEN_MASK
//   44                     | WDOG_STCTRLH_WAITEN_MASK
//   45                     | WDOG_STCTRLH_STNDBYEN_MASK
//   46                     //|
//   47                     );
        MOVW     R0,#+465
        LDR.N    R1,??DataTable4_4  ;; 0x40052000
        STRH     R0,[R1, #+0]
//   48 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock0
//   49 
//   50 
//   51 /*!
//   52  *  @brief      启用看门狗
//   53  *  @since      v5.0
//   54  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function wdog_enable
        THUMB
//   55 void wdog_enable(void)
//   56 {
wdog_enable:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   57     wdog_unlock();                                  //解锁看门狗，这样才能配置看门狗
          CFI FunCall wdog_unlock
        BL       wdog_unlock
//   58 
//   59     WDOG_STCTRLH |= WDOG_STCTRLH_WDOGEN_MASK;       //WDOGEN置位，使能 看门狗
        LDR.N    R0,??DataTable4_4  ;; 0x40052000
        LDRH     R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable4_4  ;; 0x40052000
        STRH     R0,[R1, #+0]
//   60 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock1
//   61 
//   62 
//   63 /*!
//   64  *  @brief      禁用看门狗
//   65  *  @since      v5.0
//   66  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function wdog_disable
        THUMB
//   67 void wdog_disable(void)
//   68 {
wdog_disable:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   69     wdog_unlock();                                  //解锁看门狗，这样才能配置看门狗
          CFI FunCall wdog_unlock
        BL       wdog_unlock
//   70 
//   71     WDOG_STCTRLH &= ~WDOG_STCTRLH_WDOGEN_MASK;      //WDOGEN清0，禁用 看门狗
        LDR.N    R0,??DataTable4_4  ;; 0x40052000
        LDRH     R0,[R0, #+0]
        MOVW     R1,#+65534
        ANDS     R0,R1,R0
        LDR.N    R1,??DataTable4_4  ;; 0x40052000
        STRH     R0,[R1, #+0]
//   72 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock2
//   73 
//   74 /*!
//   75  *  @brief      喂狗
//   76  *  @since      v5.0
//   77  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function wdog_feed
          CFI NoCalls
        THUMB
//   78 void wdog_feed(void)
//   79 {
//   80     //此函数不能单步执行
//   81 
//   82     //WDOG_REFRESH 寄存器里描述，连续向此寄存器写入0xA602 、0xB480即可解锁，
//   83     //中间不得超过20个时钟周期，因此需要先关总中断
//   84 
//   85     uint8 tmp = __get_BASEPRI();    //用于返回寄存器 PRIMASK 的值(1bit)
wdog_feed:
        MRS      R0,BASEPRI
//   86                                     //1表示关中断，0表示开中断
//   87 
//   88     //关闭总中断，否则有可能没法在 20个周期内连续写入 WDOG_UNLOCK
//   89     DisableInterrupts;
        CPSID    I
//   90 
//   91     //更新 看门狗（喂狗）
//   92     WDOG_REFRESH = 0xA602;
        MOVW     R1,#+42498
        LDR.N    R2,??DataTable4_5  ;; 0x4005200c
        STRH     R1,[R2, #+0]
//   93     WDOG_REFRESH = 0xB480;
        MOVW     R1,#+46208
        LDR.N    R2,??DataTable4_5  ;; 0x4005200c
        STRH     R1,[R2, #+0]
//   94 
//   95     if(tmp == 0)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??wdog_feed_0
//   96     {
//   97         EnableInterrupts;
        CPSIE    I
//   98     }
//   99 }
??wdog_feed_0:
        BX       LR               ;; return
          CFI EndBlock cfiBlock3
//  100 
//  101 /*!
//  102  *  @brief      解锁看门狗
//  103  *  @since      v5.0
//  104  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function wdog_unlock
          CFI NoCalls
        THUMB
//  105 void wdog_unlock(void)
//  106 {
//  107     //此函数不能单步执行
//  108 
//  109     //WDOG_UNLOCK 寄存器里描述，连续向此寄存器写入0xC520、0xD928即可解锁，
//  110     //中间不得超过20个时钟周期，因此需要先关总中断
//  111     uint8 tmp = __get_BASEPRI();        //用于返回寄存器 PRIMASK 的值(1bit)
wdog_unlock:
        MRS      R0,BASEPRI
//  112                                         //1表示关中断，0表示开中断
//  113 
//  114     //关闭总中断，否则有可能没法在 20个周期内连续写入 WDOG_UNLOCK
//  115     DisableInterrupts;
        CPSID    I
//  116 
//  117     //解锁 看门狗
//  118     WDOG_UNLOCK = 0xC520;
        MOVW     R1,#+50464
        LDR.N    R2,??DataTable4_6  ;; 0x4005200e
        STRH     R1,[R2, #+0]
//  119     WDOG_UNLOCK = 0xD928;
        MOVW     R1,#+55592
        LDR.N    R2,??DataTable4_6  ;; 0x4005200e
        STRH     R1,[R2, #+0]
//  120 
//  121     if(tmp == 0)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??wdog_unlock_0
//  122     {
//  123         EnableInterrupts;
        CPSIE    I
//  124     }
//  125 }
??wdog_unlock_0:
        BX       LR               ;; return
          CFI EndBlock cfiBlock4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     ?_0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     0x40052016

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     0x40052004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     0x40052006

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     0x40052000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_5:
        DC32     0x4005200c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_6:
        DC32     0x4005200e

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
        DC8 63H, 5CH, 4DH, 4BH, 36H, 30H, 5FH, 77H
        DC8 64H, 6FH, 67H, 2EH, 63H, 0
        DC8 0, 0

        END
//  126 
// 
//  56 bytes in section .rodata
// 180 bytes in section .text
// 
// 180 bytes of CODE  memory
//  56 bytes of CONST memory
//
//Errors: none
//Warnings: none
