///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       21/Mar/2017  16:05:02
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\znc\project\K60FN\network_car\Chip\src\MK60_rtc.c
//    Command line =  
//        E:\znc\project\K60FN\network_car\Chip\src\MK60_rtc.c -D DEBUG -D
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
//        E:\znc\project\K60FN\network_car\Prj\IAR\FN15_Debug\List\MK60_rtc.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "1"
        RTMODEL "__dlib_full_locale_support", "1"
        AAPCS BASE,INTERWORK,VFP
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        PUBLIC rtc_close_alarm
        PUBLIC rtc_get_time
        PUBLIC rtc_init
        PUBLIC rtc_set_alarm
        PUBLIC rtc_set_time
        PUBLIC rtc_test_handler
        
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
        
// E:\znc\project\K60FN\network_car\Chip\src\MK60_rtc.c
//    1 /*!
//    2  *     COPYRIGHT NOTICE
//    3  *     Copyright (c) 2013,山外科技
//    4  *     All rights reserved.
//    5  *     技术讨论：山外论坛 http://www.vcan123.com
//    6  *
//    7  *     除注明出处外，以下所有内容版权均属山外科技所有，未经允许，不得用于商业用途，
//    8  *     修改内容时必须保留山外科技的版权声明。
//    9  *
//   10  * @file       MK60_rtc.c
//   11  * @brief      rtc模块函数
//   12  * @author     山外科技
//   13  * @version    v5.1
//   14  * @date       2014-04-25
//   15  */
//   16 
//   17 #include "common.h"
//   18 #include "MK60_rtc.h"
//   19 
//   20 /*!
//   21  *  @brief      RTC初始化
//   22  *  @since      v5.0
//   23  *  Sample usage:       rtc_init();    //RTC初始化
//   24  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function rtc_init
          CFI NoCalls
        THUMB
//   25 void rtc_init(void)
//   26 {
rtc_init:
        SUB      SP,SP,#+4
          CFI CFA R13+4
//   27     volatile uint32 delay;
//   28 
//   29     SIM_SCGC6 |= SIM_SCGC6_RTC_MASK;    //开启 RTC 时钟
        LDR.N    R0,??DataTable5  ;; 0x4004803c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20000000
        LDR.N    R1,??DataTable5  ;; 0x4004803c
        STR      R0,[R1, #+0]
//   30 
//   31     RTC_CR  = RTC_CR_SWR_MASK;          //复位 RTC 寄存器（除 SWR， RTC_WAR ， RTC_RAR ）
        MOVS     R0,#+1
        LDR.N    R1,??DataTable5_1  ;; 0x4003d010
        STR      R0,[R1, #+0]
//   32     RTC_CR  &= ~RTC_CR_SWR_MASK;        //清空复位标志位
        LDR.N    R0,??DataTable5_1  ;; 0x4003d010
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.N    R1,??DataTable5_1  ;; 0x4003d010
        STR      R0,[R1, #+0]
//   33     RTC_CR  = (0
//   34                | RTC_CR_OSCE_MASK       //32.768 kHz 晶振 使能
//   35                //| RTC_CR_SC2P_MASK     //加入 2p 电容
//   36                //| RTC_CR_SC4P_MASK     //加入 4p 电容
//   37                //| RTC_CR_SC8P_MASK     //加入 8p 电容
//   38                | RTC_CR_SC16P_MASK      //加入 16p 电容
//   39                | RTC_CR_CLKO_MASK       //RTC_CLKOUT 输出 32k 使能 (0表示输出，1表示禁止)
//   40               );
        MOV      R0,#+1792
        LDR.N    R1,??DataTable5_1  ;; 0x4003d010
        STR      R0,[R1, #+0]
//   41 
//   42     delay = 0x600000;
        MOVS     R0,#+6291456
        STR      R0,[SP, #+0]
//   43     while(delay--);                     //等待 32K 晶振稳定（起振时间需要看晶振手册）
??rtc_init_0:
        LDR      R0,[SP, #+0]
        SUBS     R1,R0,#+1
        STR      R1,[SP, #+0]
        CMP      R0,#+0
        BNE.N    ??rtc_init_0
//   44 
//   45     //设置时间补偿
//   46     RTC_TCR = (0
//   47                | RTC_TCR_CIR(0)         //补偿间隔(可以从1秒(0X0)到256(0xFF)的范围内),8bit
//   48                | RTC_TCR_TCR(0)         //补偿值的范围从 32*1024Hz -127 的周期到 32*1024Hz +128 周期，即 TCR 范围为 (int8)-127 ~ (int8)128
//   49               );
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_2  ;; 0x4003d00c
        STR      R0,[R1, #+0]
//   50 
//   51     RTC_SR &= RTC_SR_TCE_MASK;          //禁用RTC 计数器，便于后续设置寄存器  TSR 和 TPR
        LDR.N    R0,??DataTable5_3  ;; 0x4003d014
        LDR      R0,[R0, #+0]
        ANDS     R0,R0,#0x10
        LDR.N    R1,??DataTable5_3  ;; 0x4003d014
        STR      R0,[R1, #+0]
//   52 
//   53     //时间和闹钟设置
//   54     RTC_TSR = 0;                        //当前时间
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_4  ;; 0x4003d000
        STR      R0,[R1, #+0]
//   55     RTC_TAR = 0;                        //闹钟时间
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_5  ;; 0x4003d008
        STR      R0,[R1, #+0]
//   56 
//   57     //中断配置
//   58     RTC_IER = (0
//   59                //| RTC_IER_TAIE_MASK    //闹钟中断使能（0表示禁止，1表示使能）
//   60                //| RTC_IER_TOIE_MASK    //溢出中断使能（0表示禁止，1表示使能）
//   61                //| RTC_IER_TIIE_MASK    //无效时间中断使能（0表示禁止，1表示使能）
//   62               );
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_6  ;; 0x4003d01c
        STR      R0,[R1, #+0]
//   63 
//   64     RTC_SR |= RTC_SR_TCE_MASK;          //使能RTC 计数器
        LDR.N    R0,??DataTable5_3  ;; 0x4003d014
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10
        LDR.N    R1,??DataTable5_3  ;; 0x4003d014
        STR      R0,[R1, #+0]
//   65 }
        ADD      SP,SP,#+4
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
//   66 
//   67 /*!
//   68  *  @brief      设置当前时间
//   69  *  @since      v5.0
//   70  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function rtc_set_time
          CFI NoCalls
        THUMB
//   71 void rtc_set_time(uint32 seconds)
//   72 {
//   73     RTC_SR &= ~RTC_SR_TCE_MASK;         //禁用RTC 计数器，便于后续设置寄存器  TSR 和 TPR
rtc_set_time:
        LDR.N    R1,??DataTable5_3  ;; 0x4003d014
        LDR      R1,[R1, #+0]
        BICS     R1,R1,#0x10
        LDR.N    R2,??DataTable5_3  ;; 0x4003d014
        STR      R1,[R2, #+0]
//   74     RTC_TSR = seconds;                  //当前时间
        LDR.N    R1,??DataTable5_4  ;; 0x4003d000
        STR      R0,[R1, #+0]
//   75     RTC_SR |= RTC_SR_TCE_MASK;          //使能RTC 计数器
        LDR.N    R1,??DataTable5_3  ;; 0x4003d014
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x10
        LDR.N    R2,??DataTable5_3  ;; 0x4003d014
        STR      R1,[R2, #+0]
//   76 
//   77 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock1
//   78 
//   79 /*!
//   80  *  @brief      获取当前时间
//   81  *  @since      v5.0
//   82  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function rtc_get_time
          CFI NoCalls
        THUMB
//   83 uint32 rtc_get_time(void)
//   84 {
//   85     return RTC_TSR;
rtc_get_time:
        LDR.N    R0,??DataTable5_4  ;; 0x4003d000
        LDR      R0,[R0, #+0]
        BX       LR               ;; return
          CFI EndBlock cfiBlock2
//   86 }
//   87 
//   88 
//   89 /*!
//   90  *  @brief      设置RTC闹钟时间，使能闹钟中断
//   91  *  @param      alarm    闹钟时间
//   92  *  @return     设置闹钟结果(0表示失败，1表示成功)
//   93  *  @since      v5.0
//   94  *  Sample usage:       if( rtc_set_alarm(sec) == 0 )       //设置闹钟时间 为 sec
//   95                         {
//   96                             printf("\n设置闹钟失败，不能设置过去的时间为闹钟时间!");
//   97                         }
//   98  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function rtc_set_alarm
          CFI NoCalls
        THUMB
//   99 uint8 rtc_set_alarm(uint32 alarm)
//  100 {
rtc_set_alarm:
        MOVS     R1,R0
//  101     if(alarm < RTC_TSR)                 //闹钟时间不能为过去时间
        LDR.N    R0,??DataTable5_4  ;; 0x4003d000
        LDR      R0,[R0, #+0]
        CMP      R1,R0
        BCS.N    ??rtc_set_alarm_0
//  102     {
//  103         return 0;
        MOVS     R0,#+0
        B.N      ??rtc_set_alarm_1
//  104     }
//  105 
//  106     RTC_SR &= ~RTC_SR_TCE_MASK;         //禁用RTC 计数器，便于后续设置寄存器  TSR 和 TPR
??rtc_set_alarm_0:
        LDR.N    R0,??DataTable5_3  ;; 0x4003d014
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x10
        LDR.N    R2,??DataTable5_3  ;; 0x4003d014
        STR      R0,[R2, #+0]
//  107 
//  108     RTC_TAR = alarm;                    //闹钟时间
        LDR.N    R0,??DataTable5_5  ;; 0x4003d008
        STR      R1,[R0, #+0]
//  109     RTC_SR |= RTC_SR_TCE_MASK;          //使能RTC 计数器
        LDR.N    R0,??DataTable5_3  ;; 0x4003d014
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10
        LDR.N    R2,??DataTable5_3  ;; 0x4003d014
        STR      R0,[R2, #+0]
//  110 
//  111     RTC_IER |= RTC_IER_TAIE_MASK;       //使能闹钟中断
        LDR.N    R0,??DataTable5_6  ;; 0x4003d01c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.N    R2,??DataTable5_6  ;; 0x4003d01c
        STR      R0,[R2, #+0]
//  112 
//  113     return 1;
        MOVS     R0,#+1
??rtc_set_alarm_1:
        BX       LR               ;; return
          CFI EndBlock cfiBlock3
//  114 }
//  115 
//  116 /*!
//  117  *  @brief      关闭闹钟中断
//  118  *  @since      v5.0
//  119  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function rtc_close_alarm
          CFI NoCalls
        THUMB
//  120 void rtc_close_alarm()
//  121 {
//  122     RTC_IER &= ~RTC_IER_TAIE_MASK;      //禁止闹钟中断
rtc_close_alarm:
        LDR.N    R0,??DataTable5_6  ;; 0x4003d01c
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x4
        LDR.N    R1,??DataTable5_6  ;; 0x4003d01c
        STR      R0,[R1, #+0]
//  123 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock4
//  124 
//  125 /*!
//  126  *  @brief      RTC测试中断服务函数
//  127  *  @since      v5.0
//  128  *  @warning    此函数需要用户根据自己需求完成，这里仅仅是提供一个模版
//  129  *  Sample usage:       set_vector_handler(RTC_VECTORn , rtc_test_handler);    //把 rtc_test_handler 函数添加到中断向量表，不需要我们手动调用
//  130  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function rtc_test_handler
          CFI NoCalls
        THUMB
//  131 void rtc_test_handler(void)
//  132 {
//  133     uint32 sr = RTC_SR;
rtc_test_handler:
        LDR.N    R0,??DataTable5_3  ;; 0x4003d014
        LDR      R0,[R0, #+0]
//  134 
//  135     if(sr & RTC_SR_TIF_MASK) //无效设置
        LSLS     R1,R0,#+31
        BPL.N    ??rtc_test_handler_0
//  136     {
//  137         //清TIF、TOF位，禁用计数时写TSR寄存器就会清空此位
//  138         RTC_SR = (0
//  139                   //| RTC_SR_TCE_MASK    //计能使数(0为禁止，1为使能)
//  140                   );
        MOVS     R1,#+0
        LDR.N    R2,??DataTable5_3  ;; 0x4003d014
        STR      R1,[R2, #+0]
//  141         RTC_TSR = 0;  //秒计数寄存器，写操作来清空TIF位
        MOVS     R1,#+0
        LDR.N    R2,??DataTable5_4  ;; 0x4003d000
        STR      R1,[R2, #+0]
//  142 
//  143         //下面由用户加入自己的代码
//  144         //printf("\nRTC无效设置");
//  145     }
//  146 
//  147     if(sr & RTC_SR_TOF_MASK)  //溢出
??rtc_test_handler_0:
        LSLS     R1,R0,#+30
        BPL.N    ??rtc_test_handler_1
//  148     {
//  149 
//  150         //清TIF、TOF位，禁用计数时写TSR寄存器就会清空此位
//  151         RTC_SR = (0
//  152                   //| RTC_SR_TCE_MASK    //计能使数(0为禁止，1为使能)
//  153                   );
        MOVS     R1,#+0
        LDR.N    R2,??DataTable5_3  ;; 0x4003d014
        STR      R1,[R2, #+0]
//  154         RTC_TSR = 0;  //秒计数寄存器，写操作来清空TIF位
        MOVS     R1,#+0
        LDR.N    R2,??DataTable5_4  ;; 0x4003d000
        STR      R1,[R2, #+0]
//  155 
//  156         //下面由用户加入自己的代码
//  157         //printf("\nRTC溢出");
//  158     }
//  159 
//  160     if(sr & RTC_SR_TAF_MASK)  //报警
??rtc_test_handler_1:
        LSLS     R1,R0,#+29
        BPL.N    ??rtc_test_handler_2
//  161     {
//  162         //写 TAR 来清空 SR_TAF
//  163         RTC_TAR = 0;
        MOVS     R1,#+0
        LDR.N    R2,??DataTable5_5  ;; 0x4003d008
        STR      R1,[R2, #+0]
//  164 
//  165         //下面由用户加入自己的代码
//  166         //printf("\nRTC报警");
//  167     }
//  168 
//  169 
//  170 
//  171 
//  172 }
??rtc_test_handler_2:
        BX       LR               ;; return
          CFI EndBlock cfiBlock5

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     0x4004803c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     0x4003d010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     0x4003d00c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_3:
        DC32     0x4003d014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_4:
        DC32     0x4003d000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_5:
        DC32     0x4003d008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_6:
        DC32     0x4003d01c

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
// 292 bytes in section .text
// 
// 292 bytes of CODE memory
//
//Errors: none
//Warnings: none
