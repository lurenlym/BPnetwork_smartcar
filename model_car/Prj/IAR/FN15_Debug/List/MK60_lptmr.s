///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       21/Mar/2017  16:04:56
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\znc\project\K60FN\network_car\Chip\src\MK60_lptmr.c
//    Command line =  
//        E:\znc\project\K60FN\network_car\Chip\src\MK60_lptmr.c -D DEBUG -D
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
//        E:\znc\project\K60FN\network_car\Prj\IAR\FN15_Debug\List\MK60_lptmr.s
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
        EXTERN port_init

        PUBLIC lptmr_delay_ms
        PUBLIC lptmr_delay_us
        PUBLIC lptmr_pulse_clean
        PUBLIC lptmr_pulse_get
        PUBLIC lptmr_pulse_init
        PUBLIC lptmr_test_handler
        PUBLIC lptmr_time_close
        PUBLIC lptmr_time_get_ms
        PUBLIC lptmr_time_get_us
        PUBLIC lptmr_time_start_ms
        PUBLIC lptmr_time_start_us
        PUBLIC lptmr_timing_ms
        PUBLIC lptmr_timing_us
        
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
        
// E:\znc\project\K60FN\network_car\Chip\src\MK60_lptmr.c
//    1 /*!
//    2  *     COPYRIGHT NOTICE
//    3  *     Copyright (c) 2013,山外科技
//    4  *     All rights reserved.
//    5  *     技术讨论：山外论坛 http://www.vcan123.com
//    6  *
//    7  *     除注明出处外，以下所有内容版权均属山外科技所有，未经允许，不得用于商业用途，
//    8  *     修改内容时必须保留山外科技的版权声明。
//    9  *
//   10  * @file       MK60_lptmr.c
//   11  * @brief      lptmr驱动函数，包括延时，脉冲计数（定时功能待实现）
//   12  * @author     山外科技
//   13  * @version    v5.0
//   14  * @date       2013-06-26
//   15  */
//   16 
//   17 
//   18 #include "common.h"
//   19 #include "MK60_lptmr.h"
//   20 
//   21 /*!
//   22  *  @brief      LPTMR脉冲计数初始化
//   23  *  @param      LPT0_ALTn   LPTMR脉冲计数管脚
//   24  *  @param      count       LPTMR脉冲比较值
//   25  *  @param      LPT_CFG     LPTMR脉冲计数方式：上升沿计数或下降沿计数
//   26  *  @since      v5.0
//   27  *  Sample usage:       lptmr_pulse_init(LPT0_ALT1,0xFFFF,LPT_Rising);     // LPTMR 脉冲计数，计数0xFFFF后触发中断请求（需要开中断才执行中断服务函数），上升沿捕捉
//   28  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function lptmr_pulse_init
        THUMB
//   29 void lptmr_pulse_init(LPT0_ALTn altn, uint16 count, LPT_CFG cfg)
//   30 {
lptmr_pulse_init:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//   31 
//   32 #if  defined(MK60F15)
//   33     OSC0_CR |= OSC_CR_ERCLKEN_MASK;                              //使能 OSCERCLK
        LDR.N    R0,??DataTable12  ;; 0x40065000
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x80
        LDR.N    R1,??DataTable12  ;; 0x40065000
        STRB     R0,[R1, #+0]
//   34 #endif
//   35 
//   36     // 开启模块时钟
//   37     SIM_SCGC5 |= SIM_SCGC5_LPTIMER_MASK;                        //使能LPT模块时钟
        LDR.N    R0,??DataTable12_1  ;; 0x40048038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable12_1  ;; 0x40048038
        STR      R0,[R1, #+0]
//   38 
//   39     //设置输入管脚
//   40     if(altn == LPT0_ALT1)
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+1
        BNE.N    ??lptmr_pulse_init_0
//   41     {
//   42         port_init(PTA19, ALT6 );            //在PTA19上使用 ALT6
        MOV      R1,#+1536
        MOVS     R0,#+19
          CFI FunCall port_init
        BL       port_init
        B.N      ??lptmr_pulse_init_1
//   43     }
//   44     else if(altn == LPT0_ALT2)
??lptmr_pulse_init_0:
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+2
        BNE.N    ??lptmr_pulse_init_2
//   45     {
//   46         port_init(PTC5, ALT4 );             //在PTC5上使用 ALT4
        MOV      R1,#+1024
        MOVS     R0,#+69
          CFI FunCall port_init
        BL       port_init
        B.N      ??lptmr_pulse_init_1
//   47     }
//   48     else                                    //不可能发生事件
//   49     {
//   50         ASSERT((altn == LPT0_ALT1 ) || (altn == LPT0_ALT2 ));   //设置管脚有误？
??lptmr_pulse_init_2:
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+1
        BEQ.N    ??lptmr_pulse_init_1
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+2
        BEQ.N    ??lptmr_pulse_init_1
        MOVS     R1,#+50
        LDR.N    R0,??DataTable12_2
          CFI FunCall assert_failed
        BL       assert_failed
//   51     }
//   52 
//   53     // 清状态寄存器
//   54     LPTMR0_CSR = 0x00;                                          //先关了LPT，这样才能设置时钟分频,清空计数值等
??lptmr_pulse_init_1:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable12_3  ;; 0x40040000
        STR      R0,[R1, #+0]
//   55 
//   56 #if defined(MK60DZ10)
//   57     //选择时钟源
//   58     LPTMR0_PSR  =   ( 0
//   59                       | LPTMR_PSR_PCS(1)                  //选择时钟源： 0 为 MCGIRCLK ，1为 LPO（1KHz） ，2为 ERCLK32K ，3为 OSCERCLK
//   60                       | LPTMR_PSR_PBYP_MASK               //旁路 预分频/干扰滤波器 ,即不用 预分频/干扰滤波器(注释了表示使用预分频/干扰滤波器)
//   61                       //| LPTMR_PSR_PRESCALE(1)           //预分频值 = 2^(n+1) ,n = 0~ 0xF
//   62                     );
//   63 #elif defined(MK60F15)
//   64     //选择时钟源
//   65     LPTMR0_PSR  =   ( 0
//   66                       | LPTMR_PSR_PCS(3)          //选择时钟源： 0 为 MCGIRCLK ，1为 LPO（1KHz） ，2为 ERCLK32K ，3为 OSCERCLK
//   67                       //| LPTMR_PSR_PBYP_MASK     //旁路 预分频/干扰滤波器 ,即不用 预分频/干扰滤波器(注释了表示使用预分频/干扰滤波器)
//   68                       | LPTMR_PSR_PRESCALE(4)     //预分频值 = 2^(n+1) ,n = 0~ 0xF
//   69                     );
        MOVS     R0,#+35
        LDR.N    R1,??DataTable12_4  ;; 0x40040004
        STR      R0,[R1, #+0]
//   70 #endif
//   71 
//   72     // 设置累加计数值
//   73     LPTMR0_CMR  =   LPTMR_CMR_COMPARE(count);                   //设置比较值
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LDR.N    R0,??DataTable12_5  ;; 0x40040008
        STR      R5,[R0, #+0]
//   74 
//   75     // 管脚设置、使能中断
//   76     LPTMR0_CSR  =  (0
//   77                     | LPTMR_CSR_TPS(altn)       // 选择输入管脚 选择
//   78                     | LPTMR_CSR_TMS_MASK        // 选择脉冲计数 (注释了表示时间计数模式)
//   79                     | ( cfg == LPT_Falling ?  LPTMR_CSR_TPP_MASK :   0  )  //脉冲计数器触发方式选择：0为高电平有效，上升沿加1
//   80                     | LPTMR_CSR_TEN_MASK        //使能LPT(注释了表示禁用)
//   81                     | LPTMR_CSR_TIE_MASK        //中断使能
//   82                     //| LPTMR_CSR_TFC_MASK      //0:计数值等于比较值就复位；1：溢出复位（注释表示0）
//   83                    );
        SXTB     R6,R6            ;; SignExt  R6,R6,#+24,#+24
        CMP      R6,#+1
        BNE.N    ??lptmr_pulse_init_3
        MOVS     R0,#+8
        B.N      ??lptmr_pulse_init_4
??lptmr_pulse_init_3:
        MOVS     R0,#+0
??lptmr_pulse_init_4:
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LSLS     R1,R4,#+4
        ANDS     R1,R1,#0x30
        ORRS     R0,R0,R1
        ORRS     R0,R0,#0x43
        LDR.N    R1,??DataTable12_3  ;; 0x40040000
        STR      R0,[R1, #+0]
//   84 }
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock0
//   85 
//   86 /*!
//   87  *  @brief      获取LPTMR脉冲计数值
//   88  *  @return     脉冲计数值
//   89  *  @since      v5.0
//   90  *  Sample usage:       uint16 data = lptmr_pulse_get();  //获取脉冲计数值
//   91  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function lptmr_pulse_get
          CFI NoCalls
        THUMB
//   92 uint16 lptmr_pulse_get(void)
//   93 {
//   94     uint16 data;
//   95     if(LPTMR0_CSR & LPTMR_CSR_TCF_MASK)     //已经溢出了
lptmr_pulse_get:
        LDR.N    R1,??DataTable12_3  ;; 0x40040000
        LDR      R1,[R1, #+0]
        LSLS     R1,R1,#+24
        BPL.N    ??lptmr_pulse_get_0
//   96     {
//   97 
//   98         data = ~0;                          //返回 0xffffffff 表示错误
        MOVW     R1,#+65535
        MOVS     R0,R1
        B.N      ??lptmr_pulse_get_1
//   99     }
//  100     else
//  101     {
//  102 #if defined(MK60F15)
//  103         LPTMR0_CNR = 0;
??lptmr_pulse_get_0:
        MOVS     R1,#+0
        LDR.N    R2,??DataTable12_6  ;; 0x4004000c
        STR      R1,[R2, #+0]
//  104 #endif
//  105         data = LPTMR0_CNR;
        LDR.N    R1,??DataTable12_6  ;; 0x4004000c
        LDR      R1,[R1, #+0]
        MOVS     R0,R1
//  106     }
//  107     return data;
??lptmr_pulse_get_1:
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BX       LR               ;; return
          CFI EndBlock cfiBlock1
//  108 }
//  109 
//  110 
//  111 /*!
//  112  *  @brief      清空LPTMR脉冲计数
//  113  *  @since      v5.0
//  114  *  Sample usage:       lptmr_counter_clean();          //清空LPTMR脉冲计数
//  115  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function lptmr_pulse_clean
          CFI NoCalls
        THUMB
//  116 void lptmr_pulse_clean(void)
//  117 {
//  118     LPTMR0_CSR  &= ~LPTMR_CSR_TEN_MASK;     //禁用LPT的时候就会自动清计数器的值
lptmr_pulse_clean:
        LDR.N    R0,??DataTable12_3  ;; 0x40040000
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.N    R1,??DataTable12_3  ;; 0x40040000
        STR      R0,[R1, #+0]
//  119     LPTMR0_CSR  |= LPTMR_CSR_TEN_MASK;
        LDR.N    R0,??DataTable12_3  ;; 0x40040000
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable12_3  ;; 0x40040000
        STR      R0,[R1, #+0]
//  120 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock2
//  121 
//  122 /*!
//  123  *  @brief      LPTMR延时函数（ms）
//  124  *  @param      ms          LPTMR延时时间(0~65535)
//  125  *  @since      v5.0
//  126  *  Sample usage:       lptmr_delay_ms(32);     // LPTMR 延时32ms
//  127  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function lptmr_delay_ms
          CFI NoCalls
        THUMB
//  128 void lptmr_delay_ms(uint16 ms)
//  129 {
//  130     if(ms == 0)
lptmr_delay_ms:
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+0
        BEQ.N    ??lptmr_delay_ms_0
//  131     {
//  132         return;
//  133     }
//  134 
//  135     SIM_SCGC5 |= SIM_SCGC5_LPTIMER_MASK;    //使能LPT模块时钟
??lptmr_delay_ms_1:
        LDR.N    R1,??DataTable12_1  ;; 0x40048038
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x1
        LDR.N    R2,??DataTable12_1  ;; 0x40048038
        STR      R1,[R2, #+0]
//  136 
//  137     LPTMR0_CSR = 0x00;                      //先关了LPT，自动清计数器的值
        MOVS     R1,#+0
        LDR.N    R2,??DataTable12_3  ;; 0x40040000
        STR      R1,[R2, #+0]
//  138 
//  139     LPTMR0_CMR = ms;                        //设置比较值，即延时时间
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDR.N    R1,??DataTable12_5  ;; 0x40040008
        STR      R0,[R1, #+0]
//  140 
//  141     //选择时钟源
//  142     LPTMR0_PSR  =   ( 0
//  143                       | LPTMR_PSR_PCS(1)                  //选择时钟源： 0 为 MCGIRCLK ，1为 LPO（1KHz） ，2为 ERCLK32K ，3为 OSCERCLK
//  144                       | LPTMR_PSR_PBYP_MASK               //旁路 预分频/干扰滤波器 ,即不用 预分频/干扰滤波器(注释了表示使用预分频/干扰滤波器)
//  145                       //| LPTMR_PSR_PRESCALE(1)           //预分频值 = 2^(n+1) ,n = 0~ 0xF
//  146                     );
        MOVS     R1,#+5
        LDR.N    R2,??DataTable12_4  ;; 0x40040004
        STR      R1,[R2, #+0]
//  147 
//  148     //使能 LPT
//  149     LPTMR0_CSR  =  (0
//  150                     //| LPTMR_CSR_TPS(1)        // 选择输入管脚 选择
//  151                     //| LPTMR_CSR_TMS_MASK      // 选择脉冲计数 (注释了表示时间计数模式)
//  152                     //| ( cfg == LPT_Falling ?  LPTMR_CSR_TPP_MASK :   0  )  //脉冲计数器触发方式选择：0为高电平有效，上升沿加1
//  153                     | LPTMR_CSR_TEN_MASK        //使能LPT(注释了表示禁用)
//  154                     //| LPTMR_CSR_TIE_MASK      //中断使能
//  155                     //| LPTMR_CSR_TFC_MASK      //0:计数值等于比较值就复位；1：溢出复位（注释表示0）
//  156                    );
        MOVS     R1,#+1
        LDR.N    R2,??DataTable12_3  ;; 0x40040000
        STR      R1,[R2, #+0]
//  157 
//  158     while (!(LPTMR0_CSR & LPTMR_CSR_TCF_MASK)); //等待比较值与计数值相等，即时间到了
??lptmr_delay_ms_2:
        LDR.N    R1,??DataTable12_3  ;; 0x40040000
        LDR      R1,[R1, #+0]
        LSLS     R1,R1,#+24
        BPL.N    ??lptmr_delay_ms_2
//  159 
//  160     LPTMR0_CSR &= ~LPTMR_CSR_TEN_MASK;          //清除比较标志位
        LDR.N    R1,??DataTable12_3  ;; 0x40040000
        LDR      R1,[R1, #+0]
        LSRS     R1,R1,#+1
        LSLS     R1,R1,#+1
        LDR.N    R2,??DataTable12_3  ;; 0x40040000
        STR      R1,[R2, #+0]
//  161 
//  162     return;
??lptmr_delay_ms_0:
        BX       LR               ;; return
          CFI EndBlock cfiBlock3
//  163 }
//  164 
//  165 /*!
//  166  *  @brief      LPTMR定时函数（ms）
//  167  *  @param      ms          LPTMR定时时间(0~65535)
//  168  *  @since      v5.0
//  169  *  Sample usage:
//  170                     lptmr_timing_ms(32);                                // LPTMR 定时 32ms
//  171                     set_vector_handler(LPTimer_VECTORn,lptmr_hander);   // 设置中断服务函数到中断向量表里
//  172                     enable_irq(LPTimer_IRQn);                           // 使能LPTMR中断
//  173  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function lptmr_timing_ms
          CFI NoCalls
        THUMB
//  174 void lptmr_timing_ms(uint16 ms)
//  175 {
//  176     if(ms == 0)
lptmr_timing_ms:
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+0
        BEQ.N    ??lptmr_timing_ms_0
//  177     {
//  178         return;
//  179     }
//  180 
//  181     SIM_SCGC5 |= SIM_SCGC5_LPTIMER_MASK;    //使能LPT模块时钟
??lptmr_timing_ms_1:
        LDR.N    R1,??DataTable12_1  ;; 0x40048038
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x1
        LDR.N    R2,??DataTable12_1  ;; 0x40048038
        STR      R1,[R2, #+0]
//  182 
//  183     LPTMR0_CSR = 0x00;                      //先关了LPT，自动清计数器的值
        MOVS     R1,#+0
        LDR.N    R2,??DataTable12_3  ;; 0x40040000
        STR      R1,[R2, #+0]
//  184 
//  185     LPTMR0_CMR = ms;                        //设置比较值，即延时时间
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LDR.N    R1,??DataTable12_5  ;; 0x40040008
        STR      R0,[R1, #+0]
//  186 
//  187     //选择时钟源
//  188     LPTMR0_PSR  =   ( 0
//  189                       | LPTMR_PSR_PCS(1)                  //选择时钟源： 0 为 MCGIRCLK ，1为 LPO（1KHz） ，2为 ERCLK32K ，3为 OSCERCLK
//  190                       | LPTMR_PSR_PBYP_MASK               //旁路 预分频/干扰滤波器 ,即不用 预分频/干扰滤波器(注释了表示使用预分频/干扰滤波器)
//  191                       //| LPTMR_PSR_PRESCALE(1)           //预分频值 = 2^(n+1) ,n = 0~ 0xF
//  192                     );
        MOVS     R1,#+5
        LDR.N    R2,??DataTable12_4  ;; 0x40040004
        STR      R1,[R2, #+0]
//  193 
//  194     //使能 LPT
//  195     LPTMR0_CSR  =  (0
//  196                     //| LPTMR_CSR_TPS(1)        // 选择输入管脚 选择
//  197                     //| LPTMR_CSR_TMS_MASK      // 选择脉冲计数 (注释了表示时间计数模式)
//  198                     //| ( cfg == LPT_Falling ?  LPTMR_CSR_TPP_MASK :   0  )  //脉冲计数器触发方式选择：0为高电平有效，上升沿加1
//  199                     | LPTMR_CSR_TEN_MASK        //使能LPT(注释了表示禁用)
//  200                     | LPTMR_CSR_TIE_MASK        //中断使能
//  201                     //| LPTMR_CSR_TFC_MASK      //0:计数值等于比较值就复位；1：溢出复位（注释表示0）
//  202                    );
        MOVS     R1,#+65
        LDR.N    R2,??DataTable12_3  ;; 0x40040000
        STR      R1,[R2, #+0]
//  203 
//  204     return;
??lptmr_timing_ms_0:
        BX       LR               ;; return
          CFI EndBlock cfiBlock4
//  205 }
//  206 
//  207 /*!
//  208  *  @brief      LPTMR延时函数（us）
//  209  *  @param      ms          LPTMR延时时间(0~41942)
//  210  *  @since      v5.0
//  211  *  Sample usage:       lptmr_delay_us(32);     // LPTMR 延时32us
//  212  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function lptmr_delay_us
        THUMB
//  213 void lptmr_delay_us(uint16 us)
//  214 {
lptmr_delay_us:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  215     ASSERT( ( (us * EXTAL_IN_MHz + 16) /  32 )  <= 0xFFFF );    //断言，确保寄存器不溢出
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        MOVS     R0,#+50
        MUL      R0,R0,R4
        ADDS     R0,R0,#+16
        MOVS     R1,#+32
        SDIV     R0,R0,R1
        CMP      R0,#+65536
        BLT.N    ??lptmr_delay_us_0
        MOVS     R1,#+215
        LDR.N    R0,??DataTable12_2
          CFI FunCall assert_failed
        BL       assert_failed
//  216     //us * 晶振频率  /32 <= 0xFFFF
//  217     //除以 32 ，是下面的计数进行了 分频
//  218     //加上 16是为了 四舍五入
//  219 
//  220     if(us == 0)
??lptmr_delay_us_0:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,#+0
        BEQ.N    ??lptmr_delay_us_1
//  221     {
//  222         return;
//  223     }
//  224 #if defined(MK60DZ10)
//  225     OSC_CR |= OSC_CR_ERCLKEN_MASK;                              //使能 OSCERCLK
//  226 #elif defined(MK60F15)
//  227     OSC0_CR |= OSC_CR_ERCLKEN_MASK;                              //使能 OSCERCLK
??lptmr_delay_us_2:
        LDR.N    R0,??DataTable12  ;; 0x40065000
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x80
        LDR.N    R1,??DataTable12  ;; 0x40065000
        STRB     R0,[R1, #+0]
//  228 #endif
//  229 
//  230     SIM_SCGC5 |= SIM_SCGC5_LPTIMER_MASK;                        //使能LPT模块时钟
        LDR.N    R0,??DataTable12_1  ;; 0x40048038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable12_1  ;; 0x40048038
        STR      R0,[R1, #+0]
//  231 
//  232     LPTMR0_CSR = 0x00;                                          //先关了LPT，自动清计数器的值
        MOVS     R0,#+0
        LDR.N    R1,??DataTable12_3  ;; 0x40040000
        STR      R0,[R1, #+0]
//  233 
//  234     LPTMR0_CMR = (us * EXTAL_IN_MHz + 16) / 32;                 //设置比较值，即延时时间
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        MOVS     R0,#+50
        MUL      R0,R0,R4
        ADDS     R0,R0,#+16
        MOVS     R1,#+32
        SDIV     R0,R0,R1
        LDR.N    R1,??DataTable12_5  ;; 0x40040008
        STR      R0,[R1, #+0]
//  235 
//  236     //选择时钟源
//  237     LPTMR0_PSR  =   ( 0
//  238                       | LPTMR_PSR_PCS(3)          //选择时钟源： 0 为 MCGIRCLK ，1为 LPO（1KHz） ，2为 ERCLK32K ，3为 OSCERCLK
//  239                       //| LPTMR_PSR_PBYP_MASK     //旁路 预分频/干扰滤波器 ,即不用 预分频/干扰滤波器(注释了表示使用预分频/干扰滤波器)
//  240                       | LPTMR_PSR_PRESCALE(4)     //预分频值 = 2^(n+1) ,n = 0~ 0xF
//  241                     );
        MOVS     R0,#+35
        LDR.N    R1,??DataTable12_4  ;; 0x40040004
        STR      R0,[R1, #+0]
//  242 
//  243     //使能 LPT
//  244     LPTMR0_CSR  =  (0
//  245                     //| LPTMR_CSR_TPS(1)        // 选择输入管脚 选择
//  246                     //| LPTMR_CSR_TMS_MASK      // 选择脉冲计数 (注释了表示时间计数模式)
//  247                     //| ( cfg == LPT_Falling ?  LPTMR_CSR_TPP_MASK :   0  )  //脉冲计数器触发方式选择：0为高电平有效，上升沿加1
//  248                     | LPTMR_CSR_TEN_MASK        //使能LPT(注释了表示禁用)
//  249                     //| LPTMR_CSR_TIE_MASK      //中断使能
//  250                     //| LPTMR_CSR_TFC_MASK      //0:计数值等于比较值就复位；1：溢出复位（注释表示0）
//  251                    );
        MOVS     R0,#+1
        LDR.N    R1,??DataTable12_3  ;; 0x40040000
        STR      R0,[R1, #+0]
//  252 
//  253     while (!(LPTMR0_CSR & LPTMR_CSR_TCF_MASK)); //等待比较值与计数值相等，即时间到了
??lptmr_delay_us_3:
        LDR.N    R0,??DataTable12_3  ;; 0x40040000
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+24
        BPL.N    ??lptmr_delay_us_3
//  254 
//  255     LPTMR0_CSR &= ~LPTMR_CSR_TEN_MASK;          //清除比较标志位
        LDR.N    R0,??DataTable12_3  ;; 0x40040000
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.N    R1,??DataTable12_3  ;; 0x40040000
        STR      R0,[R1, #+0]
//  256 
//  257     return;
??lptmr_delay_us_1:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock5
//  258 }
//  259 
//  260 
//  261 
//  262 /*!
//  263  *  @brief      LPTMR定时函数（us）
//  264  *  @param      ms          LPTMR定时时间(0~41942)
//  265  *  @since      v5.0
//  266  *  Sample usage:
//  267                     lptmr_timing_us(32);     // LPTMR 定时32us
//  268                     set_vector_handler(LPTimer_VECTORn,lptmr_hander);   // 设置中断服务函数到中断向量表里
//  269                     enable_irq(LPTimer_IRQn);                           // 使能LPTMR中断
//  270  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function lptmr_timing_us
        THUMB
//  271 void lptmr_timing_us(uint16 us)
//  272 {
lptmr_timing_us:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  273     ASSERT( ( (us * EXTAL_IN_MHz + 16) /  32 )  <= 0xFFFF );    //断言，确保寄存器不溢出
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        MOVS     R0,#+50
        MUL      R0,R0,R4
        ADDS     R0,R0,#+16
        MOVS     R1,#+32
        SDIV     R0,R0,R1
        CMP      R0,#+65536
        BLT.N    ??lptmr_timing_us_0
        MOVW     R1,#+273
        LDR.N    R0,??DataTable12_2
          CFI FunCall assert_failed
        BL       assert_failed
//  274     //us * 晶振频率  /32 <= 0xFFFF
//  275     //除以 32 ，是下面的计数进行了 分频
//  276     //加上 16是为了 四舍五入
//  277 
//  278     if(us == 0)
??lptmr_timing_us_0:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,#+0
        BEQ.N    ??lptmr_timing_us_1
//  279     {
//  280         return;
//  281     }
//  282 
//  283 #if defined(MK60DZ10)
//  284     OSC_CR |= OSC_CR_ERCLKEN_MASK;                              //使能 OSCERCLK
//  285 #elif defined(MK60F15)
//  286     OSC0_CR |= OSC_CR_ERCLKEN_MASK;                              //使能 OSCERCLK
??lptmr_timing_us_2:
        LDR.N    R0,??DataTable12  ;; 0x40065000
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x80
        LDR.N    R1,??DataTable12  ;; 0x40065000
        STRB     R0,[R1, #+0]
//  287 #endif
//  288 
//  289     SIM_SCGC5 |= SIM_SCGC5_LPTIMER_MASK;                        //使能LPT模块时钟
        LDR.N    R0,??DataTable12_1  ;; 0x40048038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable12_1  ;; 0x40048038
        STR      R0,[R1, #+0]
//  290 
//  291     LPTMR0_CSR = 0x00;                                          //先关了LPT，自动清计数器的值
        MOVS     R0,#+0
        LDR.N    R1,??DataTable12_3  ;; 0x40040000
        STR      R0,[R1, #+0]
//  292 
//  293     LPTMR0_CMR = (us * EXTAL_IN_MHz + 16) / 32;                 //设置比较值，即延时时间
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        MOVS     R0,#+50
        MUL      R0,R0,R4
        ADDS     R0,R0,#+16
        MOVS     R1,#+32
        SDIV     R0,R0,R1
        LDR.N    R1,??DataTable12_5  ;; 0x40040008
        STR      R0,[R1, #+0]
//  294 
//  295     //选择时钟源
//  296     LPTMR0_PSR  =   ( 0
//  297                       | LPTMR_PSR_PCS(3)          //选择时钟源： 0 为 MCGIRCLK ，1为 LPO（1KHz） ，2为 ERCLK32K ，3为 OSCERCLK
//  298                       //| LPTMR_PSR_PBYP_MASK     //旁路 预分频/干扰滤波器 ,即不用 预分频/干扰滤波器(注释了表示使用预分频/干扰滤波器)
//  299                       | LPTMR_PSR_PRESCALE(4)     //预分频值 = 2^(n+1) ,n = 0~ 0xF
//  300                     );
        MOVS     R0,#+35
        LDR.N    R1,??DataTable12_4  ;; 0x40040004
        STR      R0,[R1, #+0]
//  301 
//  302     //使能 LPT
//  303     LPTMR0_CSR  =  (0
//  304                     //| LPTMR_CSR_TPS(1)        // 选择输入管脚 选择
//  305                     //| LPTMR_CSR_TMS_MASK      // 选择脉冲计数 (注释了表示时间计数模式)
//  306                     //| ( cfg == LPT_Falling ?  LPTMR_CSR_TPP_MASK :   0  )  //脉冲计数器触发方式选择：0为高电平有效，上升沿加1
//  307                     | LPTMR_CSR_TEN_MASK        //使能LPT(注释了表示禁用)
//  308                     | LPTMR_CSR_TIE_MASK      //中断使能
//  309                     //| LPTMR_CSR_TFC_MASK      //0:计数值等于比较值就复位；1：溢出复位（注释表示0）
//  310                    );
        MOVS     R0,#+65
        LDR.N    R1,??DataTable12_3  ;; 0x40040000
        STR      R0,[R1, #+0]
//  311 
//  312     return;
??lptmr_timing_us_1:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock6
//  313 }
//  314 
//  315 
//  316 
//  317 /*!
//  318  *  @brief      LPTMR计时函数（ms,计时时间最大为65534ms）
//  319  *  @since      v5.0
//  320  *  Sample usage:
//  321                     void my_delay(uint32 time)
//  322                     {
//  323                         volatile uint32 i = time;
//  324                         while(i--);
//  325 
//  326                     }
//  327 
//  328 
//  329                     lptmr_time_start_ms();
//  330 
//  331                     my_delay(600000);
//  332                     i = lptmr_time_get_ms();
//  333                     if(i == ~0)
//  334                     {
//  335                         printf("\n计时时间超时");
//  336                     }
//  337                     else
//  338                     {
//  339                         printf("\n计时时间为：%dms",i);
//  340                     }
//  341  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function lptmr_time_start_ms
          CFI NoCalls
        THUMB
//  342 void lptmr_time_start_ms(void)
//  343 {
//  344     SIM_SCGC5 |= SIM_SCGC5_LPTIMER_MASK;    //使能LPT模块时钟
lptmr_time_start_ms:
        LDR.N    R0,??DataTable12_1  ;; 0x40048038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable12_1  ;; 0x40048038
        STR      R0,[R1, #+0]
//  345 
//  346     LPTMR0_CSR = 0x00;                      //先关了LPT，自动清计数器的值
        MOVS     R0,#+0
        LDR.N    R1,??DataTable12_3  ;; 0x40040000
        STR      R0,[R1, #+0]
//  347 
//  348     LPTMR0_CMR = ~0;                        //设置比较值，即延时时间
        MOVS     R0,#-1
        LDR.N    R1,??DataTable12_5  ;; 0x40040008
        STR      R0,[R1, #+0]
//  349 
//  350     //选择时钟源
//  351     LPTMR0_PSR  =   ( 0
//  352                       | LPTMR_PSR_PCS(1)                  //选择时钟源： 0 为 MCGIRCLK ，1为 LPO（1KHz） ，2为 ERCLK32K ，3为 OSCERCLK
//  353                       | LPTMR_PSR_PBYP_MASK               //旁路 预分频/干扰滤波器 ,即不用 预分频/干扰滤波器(注释了表示使用预分频/干扰滤波器)
//  354                       //| LPTMR_PSR_PRESCALE(1)           //预分频值 = 2^(n+1) ,n = 0~ 0xF
//  355                     );
        MOVS     R0,#+5
        LDR.N    R1,??DataTable12_4  ;; 0x40040004
        STR      R0,[R1, #+0]
//  356 
//  357     //使能 LPT
//  358     LPTMR0_CSR  =  (0
//  359                     //| LPTMR_CSR_TPS(1)        // 选择输入管脚 选择
//  360                     //| LPTMR_CSR_TMS_MASK      // 选择脉冲计数 (注释了表示时间计数模式)
//  361                     //| ( cfg == LPT_Falling ?  LPTMR_CSR_TPP_MASK :   0  )  //脉冲计数器触发方式选择：0为高电平有效，上升沿加1
//  362                     | LPTMR_CSR_TEN_MASK        //使能LPT(注释了表示禁用)
//  363                     //| LPTMR_CSR_TIE_MASK      //中断使能
//  364                     //| LPTMR_CSR_TFC_MASK      //0:计数值等于比较值就复位；1：溢出复位（注释表示0）
//  365                    );
        MOVS     R0,#+1
        LDR.N    R1,??DataTable12_3  ;; 0x40040000
        STR      R0,[R1, #+0]
//  366     return;
        BX       LR               ;; return
          CFI EndBlock cfiBlock7
//  367 }
//  368 
//  369 
//  370 
//  371 
//  372 /*!
//  373  *  @brief      获取LPTMR计时时间（ms）
//  374 *   @return     计时时间（返回值为 ~0 表示计时超时，其他值在 0~ 65534ms 区间内 ）
//  375  *  @since      v5.0
//  376  *  Sample usage:   参考 lptmr_time_start_ms 的调用例子
//  377  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function lptmr_time_get_ms
          CFI NoCalls
        THUMB
//  378 uint32 lptmr_time_get_ms(void)
//  379 {
//  380     uint32 data;
//  381 
//  382     if(LPTMR0_CSR & LPTMR_CSR_TCF_MASK)     //已经溢出了
lptmr_time_get_ms:
        LDR.N    R1,??DataTable12_3  ;; 0x40040000
        LDR      R1,[R1, #+0]
        LSLS     R1,R1,#+24
        BPL.N    ??lptmr_time_get_ms_0
//  383     {
//  384 
//  385         data = ~0;                          //返回 0xffffffff 表示错误
        MOVS     R1,#-1
        MOVS     R0,R1
        B.N      ??lptmr_time_get_ms_1
//  386     }
//  387     else
//  388     {
//  389 #if defined(MK60F15)
//  390         LPTMR0_CNR = 0;
??lptmr_time_get_ms_0:
        MOVS     R1,#+0
        LDR.N    R2,??DataTable12_6  ;; 0x4004000c
        STR      R1,[R2, #+0]
//  391 #endif
//  392         data = LPTMR0_CNR;                  //返回计时时间(此值最大为 0xffff)
        LDR.N    R1,??DataTable12_6  ;; 0x4004000c
        LDR      R1,[R1, #+0]
        MOVS     R0,R1
//  393     }
//  394 
//  395     return data;
??lptmr_time_get_ms_1:
        BX       LR               ;; return
          CFI EndBlock cfiBlock8
//  396 }
//  397 
//  398 /*!
//  399  *  @brief      关闭 LPTMR计时
//  400  *  @since      v5.0
//  401  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function lptmr_time_close
          CFI NoCalls
        THUMB
//  402 void lptmr_time_close()
//  403 {
//  404     LPTMR0_CSR = 0x00;                                          //先关了LPT，自动清计数器的值，清空溢出标记
lptmr_time_close:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable12_3  ;; 0x40040000
        STR      R0,[R1, #+0]
//  405 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock9
//  406 
//  407 /*!
//  408  *  @brief      LPTMR计时函数（us,计时时间最大为41942us）
//  409  *  @since      v5.0
//  410  *  Sample usage:
//  411                     void my_delay(uint32 time)
//  412                     {
//  413                         volatile uint32 i = time;
//  414                         while(i--);
//  415 
//  416                     }
//  417 
//  418                     uint32 i;
//  419                     lptmr_time_start_us();
//  420 
//  421                     my_delay(5894);
//  422 
//  423                     i = lptmr_time_get_us();
//  424                     if(i == ~0)
//  425                     {
//  426                         printf("\n计时时间超时");
//  427                     }
//  428                     else
//  429                     {
//  430                         printf("\n计时时间为：%dus",i);
//  431                     }
//  432  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function lptmr_time_start_us
          CFI NoCalls
        THUMB
//  433 void lptmr_time_start_us(void)
//  434 {
//  435 
//  436 #if defined(MK60DZ10)
//  437     OSC_CR |= OSC_CR_ERCLKEN_MASK;                              //使能 OSCERCLK
//  438 #elif defined(MK60F15)
//  439     OSC0_CR |= OSC_CR_ERCLKEN_MASK;                              //使能 OSCERCLK
lptmr_time_start_us:
        LDR.N    R0,??DataTable12  ;; 0x40065000
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x80
        LDR.N    R1,??DataTable12  ;; 0x40065000
        STRB     R0,[R1, #+0]
//  440 #endif
//  441 
//  442     SIM_SCGC5 |= SIM_SCGC5_LPTIMER_MASK;                        //使能LPT模块时钟
        LDR.N    R0,??DataTable12_1  ;; 0x40048038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable12_1  ;; 0x40048038
        STR      R0,[R1, #+0]
//  443 
//  444     LPTMR0_CSR = 0x00;                                          //先关了LPT，自动清计数器的值
        MOVS     R0,#+0
        LDR.N    R1,??DataTable12_3  ;; 0x40040000
        STR      R0,[R1, #+0]
//  445 
//  446     LPTMR0_CMR = ~0;                                            //设置比较值为最大值
        MOVS     R0,#-1
        LDR.N    R1,??DataTable12_5  ;; 0x40040008
        STR      R0,[R1, #+0]
//  447 
//  448     //选择时钟源
//  449     LPTMR0_PSR  =   ( 0
//  450                       | LPTMR_PSR_PCS(3)          //选择时钟源： 0 为 MCGIRCLK ，1为 LPO（1KHz） ，2为 ERCLK32K ，3为 OSCERCLK
//  451                       //| LPTMR_PSR_PBYP_MASK     //旁路 预分频/干扰滤波器 ,即不用 预分频/干扰滤波器(注释了表示使用预分频/干扰滤波器)
//  452                       | LPTMR_PSR_PRESCALE(4)     //预分频值 = 2^(n+1) ,n = 0~ 0xF
//  453                     );
        MOVS     R0,#+35
        LDR.N    R1,??DataTable12_4  ;; 0x40040004
        STR      R0,[R1, #+0]
//  454 
//  455     //使能 LPT
//  456     LPTMR0_CSR  =  (0
//  457                     //| LPTMR_CSR_TPS(1)        // 选择输入管脚 选择
//  458                     //| LPTMR_CSR_TMS_MASK      // 选择脉冲计数 (注释了表示时间计数模式)
//  459                     //| ( cfg == LPT_Falling ?  LPTMR_CSR_TPP_MASK :   0  )  //脉冲计数器触发方式选择：0为高电平有效，上升沿加1
//  460                     | LPTMR_CSR_TEN_MASK        //使能LPT(注释了表示禁用)
//  461                     //| LPTMR_CSR_TIE_MASK      //中断使能
//  462                     //| LPTMR_CSR_TFC_MASK      //0:计数值等于比较值就复位；1：溢出复位（注释表示0）
//  463                    );
        MOVS     R0,#+1
        LDR.N    R1,??DataTable12_3  ;; 0x40040000
        STR      R0,[R1, #+0]
//  464 
//  465     return;
        BX       LR               ;; return
          CFI EndBlock cfiBlock10
//  466 }
//  467 
//  468 /*!
//  469  *  @brief      获取LPTMR计时时间（us）
//  470 *   @return     计时时间（返回值为 ~0 表示计时超时，其他值在 0~ 41942us 区间内 ）
//  471  *  @since      v5.0
//  472  *  Sample usage:   参考 lptmr_time_start_us 的调用例子
//  473  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function lptmr_time_get_us
          CFI NoCalls
        THUMB
//  474 uint32 lptmr_time_get_us(void)
//  475 {
//  476     uint32 data;
//  477 
//  478     if(LPTMR0_CSR & LPTMR_CSR_TCF_MASK)     //已经溢出了
lptmr_time_get_us:
        LDR.N    R1,??DataTable12_3  ;; 0x40040000
        LDR      R1,[R1, #+0]
        LSLS     R1,R1,#+24
        BPL.N    ??lptmr_time_get_us_0
//  479     {
//  480 
//  481         data = ~0;                          //返回 0xffffffff 表示错误
        MOVS     R1,#-1
        MOVS     R0,R1
        B.N      ??lptmr_time_get_us_1
//  482     }
//  483     else
//  484     {
//  485 #if defined(MK60F15)
//  486         LPTMR0_CNR = 0;
??lptmr_time_get_us_0:
        MOVS     R1,#+0
        LDR.N    R2,??DataTable12_6  ;; 0x4004000c
        STR      R1,[R2, #+0]
//  487 #endif
//  488         data = (LPTMR0_CNR * 32) / EXTAL_IN_MHz; //进行单位换算
        LDR.N    R1,??DataTable12_6  ;; 0x4004000c
        LDR      R1,[R1, #+0]
        LSLS     R1,R1,#+5
        MOVS     R2,#+50
        UDIV     R1,R1,R2
        MOVS     R0,R1
//  489     }
//  490 
//  491     return data;
??lptmr_time_get_us_1:
        BX       LR               ;; return
          CFI EndBlock cfiBlock11
//  492 }
//  493 
//  494 
//  495 /*!
//  496  *  @brief      LPTMR中断服务函数
//  497  *  @since      v5.0
//  498  *  @warning    此函数需要用户根据自己需求完成，这里仅仅是提供一个模版
//  499  *  Sample usage:       set_vector_handler(LPTimer_VECTORn , lptmr_handler);    //把 lptmr_handler 函数添加到中断向量表，不需要我们手动调用
//  500  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function lptmr_test_handler
          CFI NoCalls
        THUMB
//  501 void lptmr_test_handler(void)
//  502 {
//  503     LPTMR_Flag_Clear();
lptmr_test_handler:
        LDR.N    R0,??DataTable12_3  ;; 0x40040000
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80
        LDR.N    R1,??DataTable12_3  ;; 0x40040000
        STR      R0,[R1, #+0]
//  504 
//  505     //下面由用户添加实现代码
//  506 
//  507 
//  508 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock12

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12:
        DC32     0x40065000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_1:
        DC32     0x40048038

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_2:
        DC32     ?_0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_3:
        DC32     0x40040000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_4:
        DC32     0x40040004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_5:
        DC32     0x40040008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_6:
        DC32     0x4004000c

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
        DC8 63H, 5CH, 4DH, 4BH, 36H, 30H, 5FH, 6CH
        DC8 70H, 74H, 6DH, 72H, 2EH, 63H, 0
        DC8 0

        END
//  509 
// 
//  56 bytes in section .rodata
// 744 bytes in section .text
// 
// 744 bytes of CODE  memory
//  56 bytes of CONST memory
//
//Errors: none
//Warnings: none
