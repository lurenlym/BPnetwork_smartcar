///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       21/Mar/2017  16:06:00
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\znc\project\K60FN\network_car\Board\src\VCAN_TSL1401.c
//    Command line =  
//        E:\znc\project\K60FN\network_car\Board\src\VCAN_TSL1401.c -D DEBUG -D
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
//        E:\znc\project\K60FN\network_car\Prj\IAR\FN15_Debug\List\VCAN_TSL1401.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "1"
        RTMODEL "__dlib_full_locale_support", "1"
        AAPCS BASE,INTERWORK,VFP
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN adc_init
        EXTERN adc_once
        EXTERN assert_failed
        EXTERN bus_clk_khz
        EXTERN gpio_init
        EXTERN gpio_set
        EXTERN pit_init

        PUBLIC tsl1401_addr
        PUBLIC tsl1401_ch
        PUBLIC tsl1401_clk
        PUBLIC tsl1401_clk_out
        PUBLIC tsl1401_get_img
        PUBLIC tsl1401_get_time
        PUBLIC tsl1401_init
        PUBLIC tsl1401_led
        PUBLIC tsl1401_led_dis
        PUBLIC tsl1401_led_en
        PUBLIC tsl1401_set_addrs
        PUBLIC tsl1401_set_time
        PUBLIC tsl1401_si
        PUBLIC tsl1401_si_out
        PUBLIC tsl1401_time_isr
        
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
        
// E:\znc\project\K60FN\network_car\Board\src\VCAN_TSL1401.c
//    1 /*!
//    2  *     COPYRIGHT NOTICE
//    3  *     Copyright (c) 2013,山外科技
//    4  *     All rights reserved.
//    5  *     技术讨论：山外论坛 http://www.vcan123.com
//    6  *
//    7  *     除注明出处外，以下所有内容版权均属山外科技所有，未经允许，不得用于商业用途，
//    8  *     修改内容时必须保留山外科技的版权声明。
//    9  *
//   10  * @file       VCAN_TSL1401.c
//   11  * @brief      线阵CCD函数库
//   12  * @author     山外科技
//   13  * @version    v5.0
//   14  * @date       2014-01-04
//   15  */
//   16 
//   17 #include "common.h"
//   18 #include "math.h"
//   19 #include <stdarg.h>
//   20 #include "MK60_port.h"
//   21 #include "MK60_gpio.h"
//   22 #include "MK60_adc.h"
//   23 #include "MK60_pit.h"
//   24 #include "VCAN_TSL1401.h"
//   25 
//   26 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   27 static volatile tsl1401_status_e  tsl1401_flag = tsl1401_noint;
tsl1401_flag:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   28 static volatile uint32            tsl1401_time;
tsl1401_time:
        DS8 4
//   29 
//   30 
//   31 static void tsl1401_restet();
//   32 static void tsl1401_delay(volatile uint32 time );
//   33 static void tsl1401_gather(void);
//   34 
//   35 //配置CCD管脚
//   36 //                          CCD1            CCD2        CCD3
//   37 
//   38 #if 1             //宏条件编译选择不同的信号类型

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   39 ADCn_Ch_e   tsl1401_ch[] = {ADC0_DP1,     ADC0_DP0,    ADC1_DP1};       //CCD所用的 ADC通道(原始信号)
tsl1401_ch:
        DATA
        DC8 1, 0, 33, 0
//   40 #else
//   41 ADCn_Ch_e   tsl1401_ch[] = {ADC0_DM1,     ADC0_DM0,    ADC1_DM1};       //CCD所用的 ADC通道(放大信号)
//   42 #endif

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   43 PTXn_e      tsl1401_si[] = {PTE6 ,        PTE8 ,       PTE10};          //CCD所用的 SI管脚
tsl1401_si:
        DATA
        DC8 134, 136, 138, 0

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   44 PTXn_e      tsl1401_clk[] = {PTE7 ,        PTE9 ,       PTE12};         //CCD所用的 SI管脚
tsl1401_clk:
        DATA
        DC8 135, 137, 140, 0

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   45 PTXn_e      tsl1401_led[] = {PTA8 ,        PTA9 ,       PTD15};         //CCD 补光 所用的 LED_EN 管脚
tsl1401_led:
        DATA
        DC8 8, 9, 111, 0
//   46 
//   47 //CCD 采集回来的存储空间指针数组

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   48 uint8 *tsl1401_addr[TSL1401_MAX] = {0};                                 //CCD 采集图像的地址数组
tsl1401_addr:
        DS8 12
//   49 
//   50 //全部CCD的SI管脚输出数据

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function tsl1401_si_out
        THUMB
//   51 void tsl1401_si_out(uint8 data)
//   52 {
tsl1401_si_out:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
//   53     uint8   i = TSL1401_MAX;
        MOVS     R5,#+3
//   54 
//   55     ASSERT(data < 2);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+2
        BLT.N    ??tsl1401_si_out_0
        MOVS     R1,#+55
        LDR.N    R0,??DataTable10
          CFI FunCall assert_failed
        BL       assert_failed
//   56 
//   57     while(i--)
??tsl1401_si_out_0:
        MOVS     R0,R5
        SUBS     R5,R0,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??tsl1401_si_out_1
//   58     {
//   59         gpio_set(tsl1401_si[i], data);
        MOVS     R1,R4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable10_1
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDRB     R0,[R5, R0]
          CFI FunCall gpio_set
        BL       gpio_set
        B.N      ??tsl1401_si_out_0
//   60     }
//   61 }
??tsl1401_si_out_1:
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock0
//   62 
//   63 //全部CCD的CLK管脚输出数据

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function tsl1401_clk_out
        THUMB
//   64 void tsl1401_clk_out(uint8 data)
//   65 {
tsl1401_clk_out:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
//   66     uint8   i = TSL1401_MAX;
        MOVS     R5,#+3
//   67 
//   68     ASSERT(data < 2);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+2
        BLT.N    ??tsl1401_clk_out_0
        MOVS     R1,#+68
        LDR.N    R0,??DataTable10
          CFI FunCall assert_failed
        BL       assert_failed
//   69 
//   70     while(i--)
??tsl1401_clk_out_0:
        MOVS     R0,R5
        SUBS     R5,R0,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??tsl1401_clk_out_1
//   71     {
//   72         gpio_set(tsl1401_clk[i], data);
        MOVS     R1,R4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable10_2
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDRB     R0,[R5, R0]
          CFI FunCall gpio_set
        BL       gpio_set
        B.N      ??tsl1401_clk_out_0
//   73     }
//   74 }
??tsl1401_clk_out_1:
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock1
//   75 
//   76 //tsl1401,线性CCD初始化，time为曝光时间，单位与 TSL1401_INT_TIME 的设置一致，初始化后必须调用tsl1401_set_addrs 来设置存储地址（或者先设置存储图像地址）

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function tsl1401_init
        THUMB
//   77 void tsl1401_init(uint32 time)
//   78 {
tsl1401_init:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
//   79     uint8 i = TSL1401_MAX;
        MOVS     R5,#+3
//   80 
//   81     while(i)
??tsl1401_init_0:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??tsl1401_init_1
//   82     {
//   83         i--;
        SUBS     R5,R5,#+1
//   84         adc_init(tsl1401_ch[i]); //初始化 CCD 所用的 ADC通道
        LDR.N    R0,??DataTable10_3
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDRSB    R0,[R5, R0]
          CFI FunCall adc_init
        BL       adc_init
//   85 
//   86         //初始化 CCD 的控制管脚 CLK 和 SI
//   87         gpio_init (tsl1401_clk[i], GPO, 0);
        MOVS     R2,#+0
        MOVS     R1,#+1
        LDR.N    R0,??DataTable10_2
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDRB     R0,[R5, R0]
          CFI FunCall gpio_init
        BL       gpio_init
//   88         gpio_init (tsl1401_si[i] , GPO, 0);
        MOVS     R2,#+0
        MOVS     R1,#+1
        LDR.N    R0,??DataTable10_1
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDRB     R0,[R5, R0]
          CFI FunCall gpio_init
        BL       gpio_init
        B.N      ??tsl1401_init_0
//   89     }
//   90 
//   91     tsl1401_time = time;
??tsl1401_init_1:
        LDR.N    R0,??DataTable10_4
        STR      R4,[R0, #+0]
//   92     TSL1401_INT_TIME(tsl1401_time);         //  设置中断时间
        LDR.N    R0,??DataTable10_4
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable10_5
        LDR      R1,[R1, #+0]
        MUL      R1,R1,R0
        MOVS     R0,#+0
          CFI FunCall pit_init
        BL       pit_init
//   93 
//   94     tsl1401_restet();                       //  丢弃第一帧的数据（乱的）
          CFI FunCall tsl1401_restet
        BL       tsl1401_restet
//   95 }
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock2
//   96 
//   97 //设置采集图像的地址
//   98 //num 为 TSL1401_MAX 时，设置全部地址，否则设置指定的地址

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function tsl1401_set_addrs
        THUMB
//   99 void tsl1401_set_addrs(TSL1401_e num, uint8 *addr, ... )
//  100 {
tsl1401_set_addrs:
        PUSH     {R2,R3}
          CFI CFA R13+8
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R4,R0
        MOVS     R5,R1
//  101     ASSERT(num <= TSL1401_MAX);
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+4
        BLT.N    ??tsl1401_set_addrs_0
        MOVS     R1,#+101
        LDR.N    R0,??DataTable10
          CFI FunCall assert_failed
        BL       assert_failed
//  102 
//  103     va_list ap;                                 //创建栈指针ap
//  104     uint8_t *value;
//  105     uint8_t n = 0;
??tsl1401_set_addrs_0:
        MOVS     R2,#+0
//  106 
//  107     if(num < TSL1401_MAX)
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+3
        BGE.N    ??tsl1401_set_addrs_1
//  108     {
//  109         tsl1401_addr[num] = addr;
        LDR.N    R3,??DataTable10_6
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        STR      R5,[R3, R4, LSL #+2]
        B.N      ??tsl1401_set_addrs_2
//  110     }
//  111     else if(num == TSL1401_MAX)
??tsl1401_set_addrs_1:
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+3
        BNE.N    ??tsl1401_set_addrs_2
//  112     {
//  113         va_start(ap, addr);                         //获取可变参数列表的第一个参数的地址
        ADD      R3,SP,#+16
        MOVS     R0,R3
//  114         value = addr;
        MOVS     R1,R5
//  115         while(num--)
??tsl1401_set_addrs_3:
        MOVS     R3,R4
        SUBS     R4,R3,#+1
        SXTB     R3,R3            ;; SignExt  R3,R3,#+24,#+24
        CMP      R3,#+0
        BEQ.N    ??tsl1401_set_addrs_2
//  116         {
//  117             tsl1401_addr[n++] = value;
        LDR.N    R3,??DataTable10_6
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        STR      R1,[R3, R2, LSL #+2]
        ADDS     R2,R2,#+1
//  118             value = va_arg(ap, uint8_t * );             //获取可变参数的当前参数，返回指定类型并将指针指向下一参数
        LDR      R3,[R0, #+0]
        ADDS     R0,R0,#+4
        MOVS     R1,R3
        B.N      ??tsl1401_set_addrs_3
//  119         }
//  120 
//  121         va_end(ap);                                 //清空va_list可变参数列表
//  122     }
//  123 }
??tsl1401_set_addrs_2:
        POP      {R0,R4,R5}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI CFA R13+12
        LDR      PC,[SP], #+12    ;; return
          CFI EndBlock cfiBlock3
//  124 
//  125 
//  126 //num 为 TSL1401_MAX 时，开启全部LED，否则开启对应的 LED

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function tsl1401_led_en
        THUMB
//  127 void tsl1401_led_en(TSL1401_e num)
//  128 {
tsl1401_led_en:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  129     ASSERT(num <= TSL1401_MAX);
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+4
        BLT.N    ??tsl1401_led_en_0
        MOVS     R1,#+129
        LDR.N    R0,??DataTable10
          CFI FunCall assert_failed
        BL       assert_failed
//  130 
//  131     if(num < TSL1401_MAX)
??tsl1401_led_en_0:
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+3
        BGE.N    ??tsl1401_led_en_1
//  132     {
//  133         gpio_init(tsl1401_led[num], GPO, 0);
        MOVS     R2,#+0
        MOVS     R1,#+1
        LDR.N    R0,??DataTable10_7
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDRB     R0,[R4, R0]
          CFI FunCall gpio_init
        BL       gpio_init
        B.N      ??tsl1401_led_en_2
//  134     }
//  135     else if(num == TSL1401_MAX)
??tsl1401_led_en_1:
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+3
        BNE.N    ??tsl1401_led_en_2
//  136     {
//  137 
//  138         while(num--)
??tsl1401_led_en_3:
        MOVS     R0,R4
        SUBS     R4,R0,#+1
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??tsl1401_led_en_2
//  139         {
//  140             gpio_init(tsl1401_led[num], GPO, 0);
        MOVS     R2,#+0
        MOVS     R1,#+1
        LDR.N    R0,??DataTable10_7
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDRB     R0,[R4, R0]
          CFI FunCall gpio_init
        BL       gpio_init
        B.N      ??tsl1401_led_en_3
//  141         }
//  142     }
//  143 }
??tsl1401_led_en_2:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock4
//  144 
//  145 //num 为 TSL1401_MAX 时，开启全部LED，否则开启对应的 LED

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function tsl1401_led_dis
        THUMB
//  146 void tsl1401_led_dis(TSL1401_e num)
//  147 {
tsl1401_led_dis:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  148     ASSERT(num <= TSL1401_MAX);
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+4
        BLT.N    ??tsl1401_led_dis_0
        MOVS     R1,#+148
        LDR.N    R0,??DataTable10
          CFI FunCall assert_failed
        BL       assert_failed
//  149 
//  150     if(num < TSL1401_MAX)
??tsl1401_led_dis_0:
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+3
        BGE.N    ??tsl1401_led_dis_1
//  151     {
//  152         gpio_init(tsl1401_led[num], GPI, 1);
        MOVS     R2,#+1
        MOVS     R1,#+0
        LDR.N    R0,??DataTable10_7
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDRB     R0,[R4, R0]
          CFI FunCall gpio_init
        BL       gpio_init
        B.N      ??tsl1401_led_dis_2
//  153     }
//  154     else if(num == TSL1401_MAX)
??tsl1401_led_dis_1:
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+3
        BNE.N    ??tsl1401_led_dis_2
//  155     {
//  156 
//  157         while(num--)
??tsl1401_led_dis_3:
        MOVS     R0,R4
        SUBS     R4,R0,#+1
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??tsl1401_led_dis_2
//  158         {
//  159             gpio_init(tsl1401_led[num], GPI, 1);
        MOVS     R2,#+1
        MOVS     R1,#+0
        LDR.N    R0,??DataTable10_7
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDRB     R0,[R4, R0]
          CFI FunCall gpio_init
        BL       gpio_init
        B.N      ??tsl1401_led_dis_3
//  160         }
//  161     }
//  162 }
??tsl1401_led_dis_2:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock5
//  163 
//  164 //tsl1401,线性CCD采集图像

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function tsl1401_get_img
          CFI NoCalls
        THUMB
//  165 void tsl1401_get_img(void)
//  166 {
//  167     tsl1401_flag = tsl1401_start;           //启动采集
tsl1401_get_img:
        MOVS     R0,#+1
        LDR.N    R1,??DataTable10_8
        STRB     R0,[R1, #+0]
//  168     while(tsl1401_flag != tsl1401_finish);  //等待采集完成
??tsl1401_get_img_0:
        LDR.N    R0,??DataTable10_8
        LDRSB    R0,[R0, #+0]
        CMP      R0,#+2
        BNE.N    ??tsl1401_get_img_0
//  169 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock6
//  170 
//  171 //获取 tsl1401,线性CCD 曝光时间

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function tsl1401_get_time
          CFI NoCalls
        THUMB
//  172 uint32 tsl1401_get_time(void)
//  173 {
//  174     return tsl1401_time;
tsl1401_get_time:
        LDR.N    R0,??DataTable10_4
        LDR      R0,[R0, #+0]
        BX       LR               ;; return
          CFI EndBlock cfiBlock7
//  175 }
//  176 
//  177 //设置 tsl1401,线性CCD 曝光时间

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function tsl1401_set_time
        THUMB
//  178 void tsl1401_set_time(uint32 time)
//  179 {
tsl1401_set_time:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  180     tsl1401_time = time;
        LDR.N    R0,??DataTable10_4
        STR      R4,[R0, #+0]
//  181     TSL1401_INT_TIME(tsl1401_time);         //  设置中断时间
        LDR.N    R0,??DataTable10_4
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable10_5
        LDR      R1,[R1, #+0]
        MUL      R1,R1,R0
        MOVS     R0,#+0
          CFI FunCall pit_init
        BL       pit_init
//  182 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock8
//  183 
//  184 //放入定时中断里，以便于定时复位曝光时间

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function tsl1401_time_isr
        THUMB
//  185 void tsl1401_time_isr()
//  186 {
tsl1401_time_isr:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  187     //只判断是否开始采集和是否采集完成
//  188     if(tsl1401_flag == tsl1401_start)
        LDR.N    R0,??DataTable10_8
        LDRSB    R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??tsl1401_time_isr_0
//  189     {
//  190         tsl1401_gather();
          CFI FunCall tsl1401_gather
        BL       tsl1401_gather
//  191         tsl1401_flag = tsl1401_finish;
        MOVS     R0,#+2
        LDR.N    R1,??DataTable10_8
        STRB     R0,[R1, #+0]
        B.N      ??tsl1401_time_isr_1
//  192     }
//  193     else
//  194     {
//  195         tsl1401_restet();                   // 复位
??tsl1401_time_isr_0:
          CFI FunCall tsl1401_restet
        BL       tsl1401_restet
//  196     }
//  197 }
??tsl1401_time_isr_1:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock9
//  198 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function tsl1401_delay
          CFI NoCalls
        THUMB
//  199 void tsl1401_delay( uint32 time )
//  200 {
tsl1401_delay:
        SUB      SP,SP,#+4
          CFI CFA R13+4
//  201     volatile uint32 i = time;
        STR      R0,[SP, #+0]
//  202 
//  203     while(i--);
??tsl1401_delay_0:
        LDR      R1,[SP, #+0]
        SUBS     R2,R1,#+1
        STR      R2,[SP, #+0]
        CMP      R1,#+0
        BNE.N    ??tsl1401_delay_0
//  204 }
        ADD      SP,SP,#+4
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock10
//  205 
//  206 
//  207 //采集图像

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function tsl1401_gather
        THUMB
//  208 void tsl1401_gather(void)
//  209 {
tsl1401_gather:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
//  210 #define TSL1401_TIME   10   //延时时间
//  211 
//  212     uint8_t n = TSL1401_SIZE, k = 0;
        MOVS     R5,#+128
        MOVS     R4,#+0
//  213     uint8_t i;
//  214 
//  215     tsl1401_clk_out(0);             //CLK = 0
        MOVS     R0,#+0
          CFI FunCall tsl1401_clk_out
        BL       tsl1401_clk_out
//  216     tsl1401_delay(TSL1401_TIME);
        MOVS     R0,#+10
          CFI FunCall tsl1401_delay
        BL       tsl1401_delay
//  217     tsl1401_si_out(1);              //SI  = 1
        MOVS     R0,#+1
          CFI FunCall tsl1401_si_out
        BL       tsl1401_si_out
//  218     tsl1401_delay(TSL1401_TIME);
        MOVS     R0,#+10
          CFI FunCall tsl1401_delay
        BL       tsl1401_delay
//  219     tsl1401_clk_out(1);             //CLK = 1
        MOVS     R0,#+1
          CFI FunCall tsl1401_clk_out
        BL       tsl1401_clk_out
//  220     tsl1401_delay(TSL1401_TIME);
        MOVS     R0,#+10
          CFI FunCall tsl1401_delay
        BL       tsl1401_delay
//  221 
//  222     tsl1401_si_out(0);              //SI  = 0
        MOVS     R0,#+0
          CFI FunCall tsl1401_si_out
        BL       tsl1401_si_out
//  223     tsl1401_delay(TSL1401_TIME);
        MOVS     R0,#+10
          CFI FunCall tsl1401_delay
        BL       tsl1401_delay
//  224 
//  225     while(n--)
??tsl1401_gather_0:
        MOVS     R0,R5
        SUBS     R5,R0,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??tsl1401_gather_1
//  226     {
//  227 
//  228         tsl1401_clk_out(0);        //CLK = 0
        MOVS     R0,#+0
          CFI FunCall tsl1401_clk_out
        BL       tsl1401_clk_out
//  229 
//  230         i = TSL1401_MAX;
        MOVS     R0,#+3
        MOVS     R6,R0
//  231         while(i--)
??tsl1401_gather_2:
        MOVS     R0,R6
        SUBS     R6,R0,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??tsl1401_gather_3
//  232         {
//  233             (tsl1401_addr[i])[k] = (uint8_t)adc_once(tsl1401_ch[i], ADC_8bit);
        MOVS     R1,#+0
        LDR.N    R0,??DataTable10_3
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LDRSB    R0,[R6, R0]
          CFI FunCall adc_once
        BL       adc_once
        LDR.N    R1,??DataTable10_6
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LDR      R1,[R1, R6, LSL #+2]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        STRB     R0,[R4, R1]
        B.N      ??tsl1401_gather_2
//  234             //*img++ =  adc_once(ADC1_AD8, ADC_8bit);
//  235         }
//  236 
//  237         tsl1401_clk_out(1);        //CLK = 1
??tsl1401_gather_3:
        MOVS     R0,#+1
          CFI FunCall tsl1401_clk_out
        BL       tsl1401_clk_out
//  238         tsl1401_delay(TSL1401_TIME);
        MOVS     R0,#+10
          CFI FunCall tsl1401_delay
        BL       tsl1401_delay
//  239         k++;
        ADDS     R4,R4,#+1
        B.N      ??tsl1401_gather_0
//  240     }
//  241 #undef TSL1401_TIME
//  242 }
??tsl1401_gather_1:
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock11

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10:
        DC32     ?_0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_1:
        DC32     tsl1401_si

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_2:
        DC32     tsl1401_clk

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_3:
        DC32     tsl1401_ch

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_4:
        DC32     tsl1401_time

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_5:
        DC32     bus_clk_khz

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_6:
        DC32     tsl1401_addr

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_7:
        DC32     tsl1401_led

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_8:
        DC32     tsl1401_flag
//  243 
//  244 //用于调整曝光时间

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function tsl1401_restet
        THUMB
//  245 void tsl1401_restet()
//  246 {
tsl1401_restet:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  247 #define TSL1401_RETIME   1
//  248 
//  249     uint8 n = TSL1401_SIZE;
        MOVS     R4,#+128
//  250 
//  251     tsl1401_clk_out(0);             //CLK = 0
        MOVS     R0,#+0
          CFI FunCall tsl1401_clk_out
        BL       tsl1401_clk_out
//  252     tsl1401_delay(TSL1401_RETIME);
        MOVS     R0,#+1
          CFI FunCall tsl1401_delay
        BL       tsl1401_delay
//  253     tsl1401_si_out(1);              //SI  = 1
        MOVS     R0,#+1
          CFI FunCall tsl1401_si_out
        BL       tsl1401_si_out
//  254     tsl1401_delay(TSL1401_RETIME);
        MOVS     R0,#+1
          CFI FunCall tsl1401_delay
        BL       tsl1401_delay
//  255     tsl1401_clk_out(1);             //CLK = 1
        MOVS     R0,#+1
          CFI FunCall tsl1401_clk_out
        BL       tsl1401_clk_out
//  256     tsl1401_delay(TSL1401_RETIME);
        MOVS     R0,#+1
          CFI FunCall tsl1401_delay
        BL       tsl1401_delay
//  257 
//  258     tsl1401_si_out(0);              //SI  = 0
        MOVS     R0,#+0
          CFI FunCall tsl1401_si_out
        BL       tsl1401_si_out
//  259     tsl1401_delay(TSL1401_RETIME);
        MOVS     R0,#+1
          CFI FunCall tsl1401_delay
        BL       tsl1401_delay
//  260 
//  261     while(n--)
??tsl1401_restet_0:
        MOVS     R0,R4
        SUBS     R4,R0,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??tsl1401_restet_1
//  262     {
//  263         tsl1401_clk_out(0);             //CLK = 0
        MOVS     R0,#+0
          CFI FunCall tsl1401_clk_out
        BL       tsl1401_clk_out
//  264         tsl1401_delay(TSL1401_RETIME);
        MOVS     R0,#+1
          CFI FunCall tsl1401_delay
        BL       tsl1401_delay
//  265         tsl1401_clk_out(1);             //CLK = 1
        MOVS     R0,#+1
          CFI FunCall tsl1401_clk_out
        BL       tsl1401_clk_out
//  266         tsl1401_delay(TSL1401_RETIME);
        MOVS     R0,#+1
          CFI FunCall tsl1401_delay
        BL       tsl1401_delay
        B.N      ??tsl1401_restet_0
//  267     }
//  268 #undef TSL1401_RETIME
//  269 }
??tsl1401_restet_1:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock12

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
        DC8 5CH, 42H, 6FH, 61H, 72H, 64H, 5CH, 73H
        DC8 72H, 63H, 5CH, 56H, 43H, 41H, 4EH, 5FH
        DC8 54H, 53H, 4CH, 31H, 34H, 30H, 31H, 2EH
        DC8 63H, 0
        DC8 0, 0

        END
//  270 
//  271 
// 
//  17 bytes in section .bss
//  16 bytes in section .data
//  60 bytes in section .rodata
// 766 bytes in section .text
// 
// 766 bytes of CODE  memory
//  60 bytes of CONST memory
//  33 bytes of DATA  memory
//
//Errors: none
//Warnings: none
