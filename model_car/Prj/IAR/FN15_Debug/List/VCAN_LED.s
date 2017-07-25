///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       21/Mar/2017  16:05:39
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\znc\project\K60FN\network_car\Board\src\VCAN_LED.C
//    Command line =  
//        E:\znc\project\K60FN\network_car\Board\src\VCAN_LED.C -D DEBUG -D
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
//        E:\znc\project\K60FN\network_car\Prj\IAR\FN15_Debug\List\VCAN_LED.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "1"
        RTMODEL "__dlib_full_locale_support", "1"
        AAPCS BASE,INTERWORK,VFP
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN gpio_init
        EXTERN gpio_set
        EXTERN gpio_turn

        PUBLIC LED_PTxn
        PUBLIC led
        PUBLIC led_init
        PUBLIC led_turn
        
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
        
// E:\znc\project\K60FN\network_car\Board\src\VCAN_LED.C
//    1  /*!
//    2   *     COPYRIGHT NOTICE
//    3   *     Copyright (c) 2014,山外科技
//    4   *     All rights reserved.
//    5   *     技术讨论：山外论坛 http://www.vcan123.com
//    6   *
//    7   *     除注明出处外，以下所有内容版权均属山外科技所有，未经允许，不得用于商业用途，
//    8   *     修改内容时必须保留山外科技的版权声明。
//    9   *
//   10   * @file       VCAN_LED.c
//   11   * @brief      led驱动函数实现
//   12   * @author     山外科技
//   13   * @version    v5.2
//   14   * @date       2014-10-4
//   15   */
//   16 
//   17 /*
//   18  * 包含头文件
//   19  */
//   20 #include "common.h"
//   21 #include "MK60_port.h"
//   22 #include "MK60_gpio.h"
//   23 #include "VCAN_LED.H"
//   24 
//   25 
//   26 /*
//   27  * 定义LED 编号对应的管脚
//   28  */

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   29 PTXn_e LED_PTxn[LED_MAX] = {PTB20,PTB21,PTB22,PTB23};
LED_PTxn:
        DATA
        DC8 52, 53, 54, 55
//   30 
//   31 
//   32 /*!
//   33  *  @brief      初始化LED端口
//   34  *  @param      LED_e    LED编号
//   35  *  @since      v5.0
//   36  *  Sample usage:       led_init (LED0);    //初始化 LED0
//   37  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function led_init
        THUMB
//   38 void    led_init(LED_e ledn)
//   39 {
led_init:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//   40     if(ledn < LED_MAX)
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+4
        BGE.N    ??led_init_0
//   41     {
//   42         gpio_init(LED_PTxn[ledn],GPO,LED_OFF);
        MOVS     R2,#+1
        MOVS     R1,#+1
        LDR.N    R0,??DataTable2
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDRB     R0,[R4, R0]
          CFI FunCall gpio_init
        BL       gpio_init
        B.N      ??led_init_1
//   43     }
//   44     else
//   45     {
//   46         ledn = LED_MAX;
??led_init_0:
        MOVS     R0,#+4
        MOVS     R4,R0
//   47         while(ledn--)
??led_init_2:
        MOVS     R0,R4
        SUBS     R4,R0,#+1
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??led_init_1
//   48         {
//   49             gpio_init(LED_PTxn[ledn],GPO,LED_OFF);
        MOVS     R2,#+1
        MOVS     R1,#+1
        LDR.N    R0,??DataTable2
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDRB     R0,[R4, R0]
          CFI FunCall gpio_init
        BL       gpio_init
        B.N      ??led_init_2
//   50         }
//   51 
//   52     }
//   53 }
??led_init_1:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock0
//   54 
//   55 
//   56 
//   57 /*!
//   58  *  @brief      设置LED灯亮灭
//   59  *  @param      LED_e           LED编号（LED0、LED1、LED2、LED3）
//   60  *  @param      LED_status      LED亮灭状态（LED_ON、LED_OFF）
//   61  *  @since      v5.2
//   62  *  Sample usage:       led (LED0,LED_ON);    //点亮 LED0
//   63  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function led
        THUMB
//   64 void    led(LED_e ledn,LED_status status)
//   65 {
led:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
//   66     if(ledn < LED_MAX)
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+4
        BGE.N    ??led_0
//   67     {
//   68         gpio_set(LED_PTxn[ledn],status);
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable2
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDRB     R0,[R4, R0]
          CFI FunCall gpio_set
        BL       gpio_set
        B.N      ??led_1
//   69     }
//   70     else
//   71     {
//   72         ledn = LED_MAX;
??led_0:
        MOVS     R0,#+4
        MOVS     R4,R0
//   73         while(ledn--)
??led_2:
        MOVS     R0,R4
        SUBS     R4,R0,#+1
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??led_1
//   74         {
//   75             gpio_set(LED_PTxn[ledn],status);
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable2
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDRB     R0,[R4, R0]
          CFI FunCall gpio_set
        BL       gpio_set
        B.N      ??led_2
//   76         }
//   77     }
//   78 }
??led_1:
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock1
//   79 
//   80 /*!
//   81  *  @brief      设置LED灯亮灭反转
//   82  *  @param      LED_e           LED编号（LED0、LED1、LED2、LED3）
//   83  *  @since      v5.2
//   84  *  Sample usage:       led_turn (LED0);    // LED0灯亮灭反转
//   85  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function led_turn
        THUMB
//   86 void led_turn(LED_e ledn)
//   87 {
led_turn:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//   88     if(ledn < LED_MAX)
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+4
        BGE.N    ??led_turn_0
//   89     {
//   90         gpio_turn(LED_PTxn[ledn]);
        LDR.N    R0,??DataTable2
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDRB     R0,[R4, R0]
          CFI FunCall gpio_turn
        BL       gpio_turn
        B.N      ??led_turn_1
//   91     }
//   92     else
//   93     {
//   94         ledn = LED_MAX;
??led_turn_0:
        MOVS     R0,#+4
        MOVS     R4,R0
//   95         while(ledn--)
??led_turn_2:
        MOVS     R0,R4
        SUBS     R4,R0,#+1
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??led_turn_1
//   96         {
//   97             gpio_turn(LED_PTxn[ledn]);
        LDR.N    R0,??DataTable2
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDRB     R0,[R4, R0]
          CFI FunCall gpio_turn
        BL       gpio_turn
        B.N      ??led_turn_2
//   98         }
//   99     }
//  100 }
??led_turn_1:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     LED_PTxn

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
//   4 bytes in section .data
// 172 bytes in section .text
// 
// 172 bytes of CODE memory
//   4 bytes of DATA memory
//
//Errors: none
//Warnings: none
