///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       21/Mar/2017  16:04:42
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\znc\project\K60FN\network_car\App\MK60_conf.c
//    Command line =  
//        E:\znc\project\K60FN\network_car\App\MK60_conf.c -D DEBUG -D
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
//        E:\znc\project\K60FN\network_car\Prj\IAR\FN15_Debug\List\MK60_conf.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "1"
        RTMODEL "__dlib_full_locale_support", "1"
        RTMODEL "__iar_require _Printf", "unknown"
        AAPCS BASE,INTERWORK,VFP
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN flash_erase_sector
        EXTERN flash_init
        EXTERN key_check
        EXTERN key_init
        EXTERN led_init
        EXTERN led_turn
        EXTERN printf
        EXTERN systick_delay_ms
        EXTERN uart_putchar

        PUBLIC ASSERT_FAILED_STR
        PUBLIC assert_failed
        PUBLIC default_isr
        PUBLIC fputc
        PUBLIC start_check
        PUBLIC vector_str
        
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
        
// E:\znc\project\K60FN\network_car\App\MK60_conf.c
//    1 /*!
//    2  *     COPYRIGHT NOTICE
//    3  *     Copyright (c) 2013,山外科技
//    4  *     All rights reserved.
//    5  *     技术讨论：山外论坛 http://www.vcan123.com
//    6  *
//    7  *     除注明出处外，以下所有内容版权均属山外科技所有，未经允许，不得用于商业用途，
//    8  *     修改内容时必须保留山外科技的版权声明。
//    9  *
//   10  * @file       MK60_conf.c
//   11  * @brief      山外K60 平台配置功能实现文件
//   12  * @author     山外科技
//   13  * @version    v5.1
//   14  * @date       2013-06-26
//   15  */
//   16 
//   17 #include    "common.h"

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function NVIC_SystemReset
          CFI NoCalls
        THUMB
// static __interwork __softfp void NVIC_SystemReset(void)
NVIC_SystemReset:
        DSB      
        LDR.N    R0,??DataTable3  ;; 0xe000ed0c
        LDR      R0,[R0, #+0]
        ANDS     R0,R0,#0x700
        LDR.N    R1,??DataTable3_1  ;; 0x5fa0004
        ORRS     R0,R1,R0
        LDR.N    R1,??DataTable3  ;; 0xe000ed0c
        STR      R0,[R1, #+0]
        DSB      
??NVIC_SystemReset_0:
        B.N      ??NVIC_SystemReset_0
          CFI EndBlock cfiBlock0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_0:
        DATA
        DC8 "\012\275\370\310\353\313\300\321\255\273\267\265\310\264\375\243\241"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_1:
        DATA
        DC8 "\012\275\370\320\320\275\342\313\370\262\331\327\367\243\254\307\353\326\330\320\302\313\242\310\353\271\314\274\376"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_2:
        DATA
        DC8 0AH, 2AH, 2AH, 2AH, 2AH, 64H, 65H, 66H
        DC8 61H, 75H, 6CH, 74H, 5FH, 69H, 73H, 72H
        DC8 20H, 65H, 6EH, 74H, 65H, 72H, 65H, 64H
        DC8 20H, 6FH, 6EH, 20H, 76H, 65H, 63H, 74H
        DC8 6FH, 72H, 20H, 25H, 64H, 2AH, 2AH, 2AH
        DC8 2AH, 2AH, 0AH, 0AH, 25H, 73H, 20H, 49H
        DC8 6EH, 74H, 65H, 72H, 72H, 75H, 70H, 74H
        DC8 0
        DC8 0, 0, 0
//   18 #include    "stdio.h"
//   19 #include    "MK60_uart.h"
//   20 #include    "VCAN_KEY.h"
//   21 #include    "VCAN_LED.h"
//   22 #include    "MK60_flash.h"
//   23 
//   24 
//   25 /*!
//   26  *  @brief      断言失败所执行的函数
//   27  *  @param      file    文件路径地址
//   28  *  @param      line    行数
//   29  *  @since      v5.0
//   30  *  Sample usage:       assert_failed(__FILE__, __LINE__);
//   31  */

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//   32 const char ASSERT_FAILED_STR[] = "Assertion failed in %s at line %d\n";
ASSERT_FAILED_STR:
        DATA
        DC8 "Assertion failed in %s at line %d\012"
        DC8 0
//   33 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function assert_failed
        THUMB
//   34 void assert_failed(char *file, int line)
//   35 {
assert_failed:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
//   36     led_init(LED1);
        MOVS     R0,#+1
          CFI FunCall led_init
        BL       led_init
//   37     while (1)
//   38     {
//   39 
//   40         DEBUG_PRINTF(ASSERT_FAILED_STR, file, line);      //通过串口提示断言失败
??assert_failed_0:
        MOVS     R2,R5
        MOVS     R1,R4
        LDR.N    R0,??DataTable3_2
          CFI FunCall printf
        BL       printf
//   41 
//   42         //死循环等待程序员检测为何断言失败
//   43         led_turn(LED1);
        MOVS     R0,#+1
          CFI FunCall led_turn
        BL       led_turn
//   44         DELAY_MS(1000);
        MOV      R0,#+1000
          CFI FunCall systick_delay_ms
        BL       systick_delay_ms
        B.N      ??assert_failed_0
          CFI EndBlock cfiBlock1
//   45 
//   46     }
//   47 }
//   48 
//   49 /*!
//   50  *  @brief      重定义printf 到串口
//   51  *  @param      ch      需要打印的字节
//   52  *  @param      stream  数据流
//   53  *  @since      v5.0
//   54  *  @note       此函数由编译器自带库里的printf所调用
//   55  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function fputc
        THUMB
//   56 int fputc(int ch, FILE *stream)
//   57 {
fputc:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
//   58     uart_putchar(VCAN_PORT, (char)ch);
        MOVS     R1,R4
        SXTB     R1,R1            ;; SignExt  R1,R1,#+24,#+24
        MOVS     R0,#+4
          CFI FunCall uart_putchar
        BL       uart_putchar
//   59     return(ch);
        MOVS     R0,R4
        POP      {R1,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock2
//   60 }
//   61 
//   62 /*!
//   63  *  @brief      启动前进行检测（检测按键是否按下，按下则进入死循环，防止进入 main 函数,松开按键后再按下则进行解锁）
//   64  *  @since      v5.0
//   65  *  @note       此函数可避免 下载口在 main 前 复用了导致无法下载等问题
//   66  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function start_check
        THUMB
//   67 void start_check()
//   68 {
start_check:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//   69     uint8 flag = 0;
        MOVS     R4,#+0
//   70 
//   71     key_init(KEY_A);
        MOVS     R0,#+4
          CFI FunCall key_init
        BL       key_init
//   72 
//   73     if(key_check(KEY_A) == KEY_DOWN )
        MOVS     R0,#+4
          CFI FunCall key_check
        BL       key_check
        CMP      R0,#+0
        BNE.N    ??start_check_0
//   74     {
//   75         //按键按下
//   76 
//   77         led_init(LED0);
        MOVS     R0,#+0
          CFI FunCall led_init
        BL       led_init
//   78 
//   79         while(1)
//   80         {
//   81 
//   82             if(key_check(KEY_A) == KEY_UP)
??start_check_1:
        MOVS     R0,#+4
          CFI FunCall key_check
        BL       key_check
        CMP      R0,#+1
        BNE.N    ??start_check_2
//   83             {
//   84                 flag = 1;
        MOVS     R0,#+1
        MOVS     R4,R0
//   85             }
//   86 
//   87             led_turn(LED0);
??start_check_2:
        MOVS     R0,#+0
          CFI FunCall led_turn
        BL       led_turn
//   88             printf("\n进入死循环等待！");
        LDR.N    R0,??DataTable3_3
          CFI FunCall printf
        BL       printf
//   89             DELAY_MS(500);                          //此处的延时，可起到 按键 消抖的功能
        MOV      R0,#+500
          CFI FunCall systick_delay_ms
        BL       systick_delay_ms
//   90 
//   91             //如果 送开按键后，再按下 按键，则 进行解锁 操作
//   92             if((flag == 1)  && (key_check(KEY_A) == KEY_DOWN ))
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+1
        BNE.N    ??start_check_1
        MOVS     R0,#+4
          CFI FunCall key_check
        BL       key_check
        CMP      R0,#+0
        BNE.N    ??start_check_1
//   93             {
//   94                 while(key_check(KEY_A) == KEY_DOWN)         //等待按键 弹起
??start_check_3:
        MOVS     R0,#+4
          CFI FunCall key_check
        BL       key_check
        CMP      R0,#+0
        BNE.N    ??start_check_4
//   95                 {
//   96                     led_turn(LED0);
        MOVS     R0,#+0
          CFI FunCall led_turn
        BL       led_turn
//   97                     DELAY_MS(100);                          //此处的延时，可起到 按键 消抖的功能
        MOVS     R0,#+100
          CFI FunCall systick_delay_ms
        BL       systick_delay_ms
        B.N      ??start_check_3
//   98                 }
//   99 
//  100                 while(key_check(KEY_A) == KEY_UP)         //等待按键 弹起后 再 进行解锁
??start_check_4:
        MOVS     R0,#+4
          CFI FunCall key_check
        BL       key_check
        CMP      R0,#+1
        BNE.N    ??start_check_5
//  101                 {
//  102                     led_turn(LED0);
        MOVS     R0,#+0
          CFI FunCall led_turn
        BL       led_turn
//  103                     DELAY_MS(50);                          //此处的延时，可起到 按键 消抖的功能
        MOVS     R0,#+50
          CFI FunCall systick_delay_ms
        BL       systick_delay_ms
        B.N      ??start_check_4
//  104                 }
//  105 
//  106                 printf("\n进行解锁操作，请重新刷入固件");
??start_check_5:
        LDR.N    R0,??DataTable3_4
          CFI FunCall printf
        BL       printf
//  107 
//  108                 //解锁单片机
//  109                 flash_init();
          CFI FunCall flash_init
        BL       flash_init
//  110                 DELAY_MS(100);
        MOVS     R0,#+100
          CFI FunCall systick_delay_ms
        BL       systick_delay_ms
//  111                 flash_erase_sector(0);        //擦除扇区 0  (解锁)
        MOVS     R0,#+0
          CFI FunCall flash_erase_sector
        BL       flash_erase_sector
//  112                 NVIC_SystemReset();           //复位单片机
          CFI FunCall NVIC_SystemReset
        BL       NVIC_SystemReset
        B.N      ??start_check_1
//  113 
//  114             }
//  115         }
//  116     }
//  117 }
??start_check_0:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock3
//  118 
//  119 #ifdef  DEBUG
//  120 // VECTOR_TABLE end
//  121 static char vector_str[][15];
//  122 #endif
//  123 
//  124 /*!
//  125  *  @brief      默认中断服务函数
//  126  *  @since      v5.0
//  127  *  @note       此函数写入中断向量表里，不需要用户执行
//  128  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function default_isr
        THUMB
//  129 void default_isr(void)
//  130 {
default_isr:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  131 
//  132 
//  133 #ifdef  DEBUG
//  134 #define VECTORNUM    ((SCB_ICSR & SCB_ICSR_VECTACTIVE_MASK)>>SCB_ICSR_VECTACTIVE_SHIFT)
//  135                             //等效于 (*(volatile uint8_t*)(0xE000ED04))
//  136     uint8 vtr = VECTORNUM;
        LDR.N    R0,??DataTable3_5  ;; 0xe000ed04
        LDR      R4,[R0, #+0]
//  137     led_init(LED1);
        MOVS     R0,#+1
          CFI FunCall led_init
        BL       led_init
//  138 
//  139     while(1)
//  140     {
//  141         led_turn(LED1);
??default_isr_0:
        MOVS     R0,#+1
          CFI FunCall led_turn
        BL       led_turn
//  142         DEBUG_PRINTF("\n****default_isr entered on vector %d*****\n\n%s Interrupt", vtr, vector_str[vtr]);
        LDR.N    R0,??DataTable3_6
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+15
        MLA      R2,R1,R4,R0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,R4
        LDR.N    R0,??DataTable3_7
          CFI FunCall printf
        BL       printf
//  143 
//  144         DELAY_MS(1000);
        MOV      R0,#+1000
          CFI FunCall systick_delay_ms
        BL       systick_delay_ms
        B.N      ??default_isr_0
          CFI EndBlock cfiBlock4
//  145     }
//  146 #else
//  147     return;
//  148 #endif
//  149 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     0xe000ed0c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     0x5fa0004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     ASSERT_FAILED_STR

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     ?_0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_4:
        DC32     ?_1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_5:
        DC32     0xe000ed04

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_6:
        DC32     vector_str

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_7:
        DC32     ?_2
//  150 
//  151 #ifdef DEBUG
//  152 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  153 char vector_str[][15] =
vector_str:
        DATA
        DC8 ""
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 ""
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "NonMaskable"
        DC8 0, 0, 0
        DC8 "HardFault"
        DC8 0, 0, 0, 0, 0
        DC8 "MemManagement"
        DC8 0
        DC8 "BusFault"
        DC8 0, 0, 0, 0, 0, 0
        DC8 "UsageFault"
        DC8 0, 0, 0, 0
        DC8 ""
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 ""
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 ""
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 ""
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "SVCall"
        DC8 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "DebugMonitor"
        DC8 0, 0
        DC8 ""
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "PendSV"
        DC8 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "SysTick"
        DC8 0, 0, 0, 0, 0, 0, 0
        DC8 "DMA0"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "DMA1"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "DMA2"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "DMA3"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "DMA4"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "DMA5"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "DMA6"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "DMA7"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "DMA8"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "DMA9"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "DMA10"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "DMA11"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "DMA12"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "DMA13"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "DMA14"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "DMA15"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "DMA_Error"
        DC8 0, 0, 0, 0, 0
        DC8 "MCM"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "FTFL"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "Read_Collision"
        DC8 "LVD_LVW"
        DC8 0, 0, 0, 0, 0, 0, 0
        DC8 "LLW"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "Watchdog"
        DC8 0, 0, 0, 0, 0, 0
        DC8 "RNG"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "I2C0"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "I2C1"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "SPI0"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "SPI1"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "SPI2"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "CAN0_OR_MB_buf"
        DC8 "CAN0_Bus_Off"
        DC8 0, 0
        DC8 "CAN0_Error"
        DC8 0, 0, 0, 0
        DC8 43H, 41H, 4EH, 30H, 5FH, 54H, 78H, 5FH
        DC8 57H, 61H, 72H, 6EH, 69H, 6EH, 67H
        DC8 43H, 41H, 4EH, 30H, 5FH, 52H, 78H, 5FH
        DC8 57H, 61H, 72H, 6EH, 69H, 6EH, 67H
        DC8 "CAN0_Wake_Up"
        DC8 0, 0
        DC8 "Reserved51"
        DC8 0, 0, 0, 0
        DC8 "Reserved52"
        DC8 0, 0, 0, 0
        DC8 "CAN1_OR_MB_buf"
        DC8 "CAN1_Bus_Off"
        DC8 0, 0
        DC8 "CAN1_Error"
        DC8 0, 0, 0, 0
        DC8 43H, 41H, 4EH, 31H, 5FH, 54H, 78H, 5FH
        DC8 57H, 61H, 72H, 6EH, 69H, 6EH, 67H
        DC8 43H, 41H, 4EH, 31H, 5FH, 52H, 78H, 5FH
        DC8 57H, 61H, 72H, 6EH, 69H, 6EH, 67H
        DC8 "CAN1_Wake_Up"
        DC8 0, 0
        DC8 "Reserved59"
        DC8 0, 0, 0, 0
        DC8 "Reserved60"
        DC8 0, 0, 0, 0
        DC8 "UART0_RX_TX"
        DC8 0, 0, 0
        DC8 "UART0_ERR"
        DC8 0, 0, 0, 0, 0
        DC8 "UART1_RX_TX"
        DC8 0, 0, 0
        DC8 "UART1_ERR"
        DC8 0, 0, 0, 0, 0
        DC8 "UART2_RX_TX"
        DC8 0, 0, 0
        DC8 "UART2_ERR"
        DC8 0, 0, 0, 0, 0
        DC8 "UART3_RX_TX"
        DC8 0, 0, 0
        DC8 "UART3_ERR"
        DC8 0, 0, 0, 0, 0
        DC8 "UART4_RX_TX"
        DC8 0, 0, 0
        DC8 "UART4_ERR"
        DC8 0, 0, 0, 0, 0
        DC8 "UART5_RX_TX"
        DC8 0, 0, 0
        DC8 "UART5_ERR"
        DC8 0, 0, 0, 0, 0
        DC8 "ADC0"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "ADC1"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "CMP0"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "CMP1"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "CMP2"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "FTM0"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "FTM1"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "FTM2"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "CMT"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "RTC"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "Reserved83"
        DC8 0, 0, 0, 0
        DC8 "PIT0"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "PIT1"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "PIT2"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "PIT3"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "PDB0"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "USB0"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "USBDCD"
        DC8 0, 0, 0, 0, 0, 0, 0, 0
        DC8 45H, 4EH, 45H, 54H, 5FH, 31H, 35H, 38H
        DC8 38H, 5FH, 54H, 69H, 6DH, 65H, 72H
        DC8 "ENET_Transmit"
        DC8 0
        DC8 "ENET_Receive"
        DC8 0, 0
        DC8 "ENET_Error"
        DC8 0, 0, 0, 0
        DC8 "I2S0"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "SDHC"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "DAC0"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "DAC1"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "TSI0"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "MCG"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "LPTimer"
        DC8 0, 0, 0, 0, 0, 0, 0
        DC8 "Reserved102"
        DC8 0, 0, 0
        DC8 "PORTA"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "PORTB"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "PORTC"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "PORTD"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "PORTE"
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 "Reserved108"
        DC8 0, 0, 0
        DC8 "Reserved109"
        DC8 0, 0, 0
        DC8 "Reserved110"
        DC8 0, 0, 0
        DC8 "Reserved111"
        DC8 0, 0, 0
        DC8 "Reserved112"
        DC8 0, 0, 0
        DC8 "Reserved113"
        DC8 0, 0, 0
        DC8 "Reserved114"
        DC8 0, 0, 0
        DC8 "Reserved115"
        DC8 0, 0, 0
        DC8 "Reserved116"
        DC8 0, 0, 0
        DC8 "Reserved117"
        DC8 0, 0, 0
        DC8 "Reserved118"
        DC8 0, 0, 0
        DC8 "Reserved119"
        DC8 0, 0, 0

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  154 {
//  155     /******  Cortex-M4 Processor Exceptions Numbers ****************************************************************/
//  156     "",                         //0
//  157     "",
//  158     "NonMaskable"               , /*!< 2 Non Maskable Interrupt                              */
//  159     "HardFault"                 , /*!< 3 Hard Fault                                          */
//  160     "MemManagement"             , /*!< 4 Cortex-M4 Memory Management Interrupt               */
//  161     "BusFault"                  , /*!< 5 Cortex-M4 Bus Fault Interrupt                       */
//  162     "UsageFault"                , /*!< 6 Cortex-M4 Usage Fault Interrupt                     */
//  163     "",                         //7
//  164     "",
//  165     "",                         //9
//  166     "",
//  167     "SVCall"                    , /*!< 11 Cortex-M4 SV Call Interrupt                        */
//  168     "DebugMonitor"              , /*!< 12 Cortex-M4 Debug Monitor Interrupt                  */
//  169     "",
//  170     "PendSV"                    , /*!< 14 Cortex-M4 Pend SV Interrupt                        */
//  171     "SysTick"                   , /*!< 15 Cortex-M4 System Tick Interrupt                    */
//  172     /******  Kinetis 60 specific Interrupt Numbers **********************************************************************/
//  173     "DMA0"                      , // DMA Channel 0 Transfer Complete
//  174     "DMA1"                      , // DMA Channel 1 Transfer Complete
//  175     "DMA2"                      , // DMA Channel 2 Transfer Complete
//  176     "DMA3"                      , // DMA Channel 3 Transfer Complete
//  177     "DMA4"                      , // DMA Channel 4 Transfer Complete
//  178     "DMA5"                      , // DMA Channel 5 Transfer Complete
//  179     "DMA6"                      , // DMA Channel 6 Transfer Complete
//  180     "DMA7"                      , // DMA Channel 7 Transfer Complete
//  181     "DMA8"                      , // DMA Channel 8 Transfer Complete
//  182     "DMA9"                      , // DMA Channel 9 Transfer Complete
//  183     "DMA10"                     , // DMA Channel 10 Transfer Complete
//  184     "DMA11"                     , // DMA Channel 11 Transfer Complete
//  185     "DMA12"                     , // DMA Channel 12 Transfer Complete
//  186     "DMA13"                     , // DMA Channel 13 Transfer Complete
//  187     "DMA14"                     , // DMA Channel 14 Transfer Complete
//  188     "DMA15"                     , // DMA Channel 15 Transfer Complete
//  189     "DMA_Error"                 , // DMA Error Interrupt
//  190     "MCM"                       , // Normal Interrupt
//  191     "FTFL"                      , // FTFL Interrupt
//  192     "Read_Collision"            , // Read Collision Interrupt
//  193     "LVD_LVW"                   , // Low Voltage Detect, Low Voltage Warning
//  194     "LLW"                       , // Low Leakage Wakeup
//  195     "Watchdog"                  , // WDOG Interrupt
//  196     "RNG"                       , // RNGB Interrupt
//  197     "I2C0"                      , // I2C0 interrupt
//  198     "I2C1"                      , // I2C1 interrupt
//  199     "SPI0"                      , // SPI0 Interrupt
//  200     "SPI1"                      , // SPI1 Interrupt
//  201     "SPI2"                      , // SPI2 Interrupt
//  202     "CAN0_OR_MB_buf"            , // CAN0 OR'd Message Buffers Interrupt
//  203     "CAN0_Bus_Off"              , // CAN0 Bus Off Interrupt
//  204     "CAN0_Error"                , // CAN0 Error Interrupt
//  205     "CAN0_Tx_Warning"           , // CAN0 Tx Warning Interrupt
//  206     "CAN0_Rx_Warning"           , // CAN0 Rx Warning Interrupt
//  207     "CAN0_Wake_Up"              , // CAN0 Wake Up Interrupt
//  208     "Reserved51"                , // 保留 interrupt 51
//  209     "Reserved52"                , // 保留 interrupt 52
//  210     "CAN1_OR_MB_buf"            , // CAN1 OR'd Message Buffers Interrupt
//  211     "CAN1_Bus_Off"              , // CAN1 Bus Off Interrupt
//  212     "CAN1_Error"                , // CAN1 Error Interrupt
//  213     "CAN1_Tx_Warning"           , // CAN1 Tx Warning Interrupt
//  214     "CAN1_Rx_Warning"           , // CAN1 Rx Warning Interrupt
//  215     "CAN1_Wake_Up"              , // CAN1 Wake Up Interrupt
//  216     "Reserved59"                , // 保留 interrupt 59
//  217     "Reserved60"                , // 保留 interrupt 60
//  218     "UART0_RX_TX"               , // UART0 Receive/Transmit interrupt
//  219     "UART0_ERR"                 , // UART0 Error interrupt
//  220     "UART1_RX_TX"               , // UART1 Receive/Transmit interrupt
//  221     "UART1_ERR"                 , // UART1 Error interrupt
//  222     "UART2_RX_TX"               , // UART2 Receive/Transmit interrupt
//  223     "UART2_ERR"                 , // UART2 Error interrupt
//  224     "UART3_RX_TX"               , // UART3 Receive/Transmit interrupt
//  225     "UART3_ERR"                 , // UART3 Error interrupt
//  226     "UART4_RX_TX"               , // UART4 Receive/Transmit interrupt
//  227     "UART4_ERR"                 , // UART4 Error interrupt
//  228     "UART5_RX_TX"               , // UART5 Receive/Transmit interrupt
//  229     "UART5_ERR"                 , // UART5 Error interrupt
//  230     "ADC0"                      , // ADC0 interrupt
//  231     "ADC1"                      , // ADC1 interrupt
//  232     "CMP0"                      , // CMP0 interrupt
//  233     "CMP1"                      , // CMP1 interrupt
//  234     "CMP2"                      , // CMP2 interrupt
//  235     "FTM0"                      , // FTM0 fault, overflow and channels interrupt
//  236     "FTM1"                      , // FTM1 fault, overflow and channels interrupt
//  237     "FTM2"                      , // FTM2 fault, overflow and channels interrupt
//  238     "CMT"                       , // CMT interrupt
//  239     "RTC"                       , // RTC interrupt
//  240     "Reserved83"                , // 保留 interrupt 83
//  241     "PIT0"                      , // PIT timer channel 0 interrupt
//  242     "PIT1"                      , // PIT timer channel 1 interrupt
//  243     "PIT2"                      , // PIT timer channel 2 interrupt
//  244     "PIT3"                      , // PIT timer channel 3 interrupt
//  245     "PDB0"                      , // PDB0 Interrupt
//  246     "USB0"                      , // USB0 interrupt
//  247     "USBDCD"                    , // USBDCD Interrupt
//  248     "ENET_1588_Timer"           , // Ethernet MAC IEEE 1588 Timer Interrupt
//  249     "ENET_Transmit"             , // Ethernet MAC Transmit Interrupt
//  250     "ENET_Receive"              , // Ethernet MAC Receive Interrupt
//  251     "ENET_Error"                , // Ethernet MAC Error and miscelaneous Interrupt
//  252     "I2S0"                      , // I2S0 Interrupt
//  253     "SDHC"                      , // SDHC Interrupt
//  254     "DAC0"                      , // DAC0 interrupt
//  255     "DAC1"                      , // DAC1 interrupt
//  256     "TSI0"                      , // TSI0 Interrupt
//  257     "MCG"                       , // MCG Interrupt
//  258     "LPTimer"                   , // LPTimer interrupt
//  259     "Reserved102"               , // 保留 interrupt 102
//  260     "PORTA"                     , // Port A interrupt
//  261     "PORTB"                     , // Port B interrupt
//  262     "PORTC"                     , // Port C interrupt
//  263     "PORTD"                     , // Port D interrupt
//  264     "PORTE"                     , // Port E interrupt
//  265     "Reserved108"               , // 保留 interrupt 108
//  266     "Reserved109"               , // 保留 interrupt 109
//  267     "Reserved110"               , // 保留 interrupt 110
//  268     "Reserved111"               , // 保留 interrupt 111
//  269     "Reserved112"               , // 保留 interrupt 112
//  270     "Reserved113"               , // 保留 interrupt 113
//  271     "Reserved114"               , // 保留 interrupt 114
//  272     "Reserved115"               , // 保留 interrupt 115
//  273     "Reserved116"               , // 保留 interrupt 116
//  274     "Reserved117"               , // 保留 interrupt 117
//  275     "Reserved118"               , // 保留 interrupt 118
//  276     "Reserved119"               , // 保留 interrupt 119
//  277 };
//  278 #endif
// 
// 1 800 bytes in section .data
//   148 bytes in section .rodata
//   318 bytes in section .text
// 
//   318 bytes of CODE  memory
//   148 bytes of CONST memory
// 1 800 bytes of DATA  memory
//
//Errors: none
//Warnings: none
