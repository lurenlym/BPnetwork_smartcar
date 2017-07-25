///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       21/Mar/2017  16:05:08
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\znc\project\K60FN\network_car\Chip\src\MK60_uart.c
//    Command line =  
//        E:\znc\project\K60FN\network_car\Chip\src\MK60_uart.c -D DEBUG -D
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
//        E:\znc\project\K60FN\network_car\Prj\IAR\FN15_Debug\List\MK60_uart.s
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
        EXTERN bus_clk_khz
        EXTERN core_clk_khz
        EXTERN port_init

        PUBLIC UARTN
        PUBLIC uart3_test_handler
        PUBLIC uart_getchar
        PUBLIC uart_init
        PUBLIC uart_putbuff
        PUBLIC uart_putchar
        PUBLIC uart_putstr
        PUBLIC uart_query
        PUBLIC uart_querybuff
        PUBLIC uart_querychar
        PUBLIC uart_querystr
        PUBLIC uart_rx_irq_dis
        PUBLIC uart_rx_irq_en
        PUBLIC uart_tx_irq_dis
        PUBLIC uart_tx_irq_en
        PUBLIC uart_txc_irq_dis
        PUBLIC uart_txc_irq_en
        
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
        
// E:\znc\project\K60FN\network_car\Chip\src\MK60_uart.c
//    1 /*!
//    2  *     COPYRIGHT NOTICE
//    3  *     Copyright (c) 2013,山外科技
//    4  *     All rights reserved.
//    5  *     技术讨论：山外论坛 http://www.vcan123.com
//    6  *
//    7  *     除注明出处外，以下所有内容版权均属山外科技所有，未经允许，不得用于商业用途，
//    8  *     修改内容时必须保留山外科技的版权声明。
//    9  *
//   10  * @file       MK60_uart.c
//   11  * @brief      uart串口函数
//   12  * @author     山外科技
//   13  * @version    v5.2
//   14  * @date       2014-10-09
//   15  */
//   16 
//   17 
//   18 #include "common.h"

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function NVIC_EnableIRQ
          CFI NoCalls
        THUMB
// static __interwork __softfp void NVIC_EnableIRQ(IRQn_Type)
NVIC_EnableIRQ:
        MOVS     R1,#+1
        ANDS     R2,R0,#0x1F
        LSLS     R1,R1,R2
        LDR.W    R2,??DataTable13  ;; 0xe000e100
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        LSRS     R3,R0,#+5
        STR      R1,[R2, R3, LSL #+2]
        BX       LR               ;; return
          CFI EndBlock cfiBlock0

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function NVIC_DisableIRQ
          CFI NoCalls
        THUMB
// static __interwork __softfp void NVIC_DisableIRQ(IRQn_Type)
NVIC_DisableIRQ:
        MOVS     R1,#+1
        ANDS     R2,R0,#0x1F
        LSLS     R1,R1,R2
        LDR.W    R2,??DataTable13_1  ;; 0xe000e180
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        LSRS     R3,R0,#+5
        STR      R1,[R2, R3, LSL #+2]
        BX       LR               ;; return
          CFI EndBlock cfiBlock1
//   19 #include "MK60_uart.h"
//   20 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   21 UART_MemMapPtr UARTN[UART_MAX] = {UART0_BASE_PTR, UART1_BASE_PTR, UART2_BASE_PTR, UART3_BASE_PTR, UART4_BASE_PTR, UART5_BASE_PTR}; //定义五个指针数组保存 UARTN 的地址
UARTN:
        DATA
        DC32 4006A000H, 4006B000H, 4006C000H, 4006D000H, 400EA000H, 400EB000H
//   22 
//   23 
//   24 /*!
//   25  *  @brief      初始化串口，设置波特率
//   26  *  @param      UARTn_e       模块号（UART0~UART5）
//   27  *  @param      baud        波特率，如9600、19200、56000、115200等
//   28  *  @since      v5.0
//   29  *  @note       UART所用的管脚在 App\Inc\PORT_cfg.h 里进行配置，
//   30                 printf所用的管脚和波特率在 App\Inc\MK60_conf.h 里进行配置
//   31  *  Sample usage:       uart_init (UART3, 9600);        //初始化串口3，波特率为9600
//   32  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function uart_init
        THUMB
//   33 void uart_init (UARTn_e uratn, uint32 baud)
//   34 {
uart_init:
        PUSH     {R3-R9,LR}
          CFI R14 Frame(CFA, -4)
          CFI R9 Frame(CFA, -8)
          CFI R8 Frame(CFA, -12)
          CFI R7 Frame(CFA, -16)
          CFI R6 Frame(CFA, -20)
          CFI R5 Frame(CFA, -24)
          CFI R4 Frame(CFA, -28)
          CFI CFA R13+32
        MOVS     R4,R0
        MOVS     R5,R1
//   35     register uint16 sbr, brfa;
//   36     uint8 temp;
//   37     uint32 sysclk;     //时钟
//   38 
//   39     /* 配置 UART功能的 复用管脚 */
//   40     switch(uratn)
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??uart_init_0
        CMP      R4,#+2
        BEQ.N    ??uart_init_1
        BCC.N    ??uart_init_2
        CMP      R4,#+4
        BEQ.N    ??uart_init_3
        BCC.N    ??uart_init_4
        CMP      R4,#+5
        BEQ.N    ??uart_init_5
        B.N      ??uart_init_6
//   41     {
//   42     case UART0:
//   43         SIM_SCGC4 |= SIM_SCGC4_UART0_MASK;      //使能 UART0 时钟
??uart_init_0:
        LDR.W    R0,??DataTable13_2  ;; 0x40048034
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x400
        LDR.W    R1,??DataTable13_2  ;; 0x40048034
        STR      R0,[R1, #+0]
//   44 
//   45         if(UART0_RX_PIN == PTA1)
//   46         {
//   47             port_init( UART0_RX_PIN, ALT2);
//   48         }
//   49         else if((UART0_RX_PIN == PTA15) || (UART0_RX_PIN == PTB16) || (UART0_RX_PIN == PTD6)  )
//   50         {
//   51             port_init( UART0_RX_PIN, ALT3);
        MOV      R1,#+768
        MOVS     R0,#+102
          CFI FunCall port_init
        BL       port_init
//   52         }
//   53         else
//   54         {
//   55             ASSERT(0);                           //上诉条件都不满足，直接断言失败了，设置管脚有误？
//   56         }
//   57 
//   58         if(UART0_TX_PIN == PTA2)
//   59         {
//   60             port_init( UART0_TX_PIN, ALT2);
//   61         }
//   62         else if((UART0_TX_PIN == PTA14) || (UART0_TX_PIN == PTB17) || (UART0_TX_PIN == PTD7) )
//   63         {
//   64             port_init( UART0_TX_PIN, ALT3);
        MOV      R1,#+768
        MOVS     R0,#+103
          CFI FunCall port_init
        BL       port_init
//   65         }
//   66         else
//   67         {
//   68             ASSERT(0);                           //上诉条件都不满足，直接断言失败了，设置管脚有误？
//   69         }
//   70 
//   71         break;
        B.N      ??uart_init_7
//   72 
//   73     case UART1:
//   74         SIM_SCGC4 |= SIM_SCGC4_UART1_MASK;
??uart_init_2:
        LDR.W    R0,??DataTable13_2  ;; 0x40048034
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x800
        LDR.W    R1,??DataTable13_2  ;; 0x40048034
        STR      R0,[R1, #+0]
//   75 
//   76         if((UART1_RX_PIN == PTC3) || (UART1_RX_PIN == PTE1))
//   77         {
//   78             port_init( UART1_RX_PIN, ALT3);
        MOV      R1,#+768
        MOVS     R0,#+67
          CFI FunCall port_init
        BL       port_init
//   79         }
//   80         else
//   81         {
//   82             ASSERT(0);                           //上诉条件都不满足，直接断言失败了，设置管脚有误？
//   83         }
//   84 
//   85         if((UART1_TX_PIN == PTC4) || (UART1_TX_PIN == PTE0))
//   86         {
//   87             port_init( UART1_TX_PIN, ALT3);
        MOV      R1,#+768
        MOVS     R0,#+68
          CFI FunCall port_init
        BL       port_init
//   88         }
//   89         else
//   90         {
//   91             ASSERT(0);                           //上诉条件都不满足，直接断言失败了，设置管脚有误？
//   92         }
//   93 
//   94         break;
        B.N      ??uart_init_7
//   95 
//   96     case UART2:
//   97         SIM_SCGC4 |= SIM_SCGC4_UART2_MASK;
??uart_init_1:
        LDR.W    R0,??DataTable13_2  ;; 0x40048034
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000
        LDR.W    R1,??DataTable13_2  ;; 0x40048034
        STR      R0,[R1, #+0]
//   98         if(UART2_TX_PIN == PTD3)
//   99         {
//  100             port_init( UART2_TX_PIN, ALT3);
        MOV      R1,#+768
        MOVS     R0,#+99
          CFI FunCall port_init
        BL       port_init
//  101         }
//  102         else
//  103         {
//  104             ASSERT(0);                           //上诉条件都不满足，直接断言失败了，设置管脚有误？
//  105         }
//  106 
//  107 
//  108         if(UART2_RX_PIN == PTD2)
//  109         {
//  110             port_init( UART2_RX_PIN, ALT3);
        MOV      R1,#+768
        MOVS     R0,#+98
          CFI FunCall port_init
        BL       port_init
//  111         }
//  112         else
//  113         {
//  114             ASSERT(0);                           //上诉条件都不满足，直接断言失败了，设置管脚有误？
//  115         }
//  116 
//  117         break;
        B.N      ??uart_init_7
//  118 
//  119     case UART3:
//  120         SIM_SCGC4 |= SIM_SCGC4_UART3_MASK;
??uart_init_4:
        LDR.W    R0,??DataTable13_2  ;; 0x40048034
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2000
        LDR.W    R1,??DataTable13_2  ;; 0x40048034
        STR      R0,[R1, #+0]
//  121 
//  122         if((UART3_RX_PIN == PTB10)|| (UART3_RX_PIN == PTC16) || (UART3_RX_PIN == PTE5) )
//  123         {
//  124             port_init( UART3_RX_PIN, ALT3);
        MOV      R1,#+768
        MOVS     R0,#+80
          CFI FunCall port_init
        BL       port_init
//  125         }
//  126         else
//  127         {
//  128             ASSERT(0);                           //上诉条件都不满足，直接断言失败了，设置管脚有误？
//  129         }
//  130 
//  131         if((UART3_TX_PIN == PTB11) || (UART3_TX_PIN == PTC17) || (UART3_TX_PIN == PTE4) )
//  132         {
//  133             port_init( UART3_TX_PIN, ALT3);             //在PTB11上使能UART3_RXD
        MOV      R1,#+768
        MOVS     R0,#+81
          CFI FunCall port_init
        BL       port_init
//  134         }
//  135         else
//  136         {
//  137             ASSERT(0);                           //上诉条件都不满足，直接断言失败了，设置管脚有误？
//  138         }
//  139         break;
        B.N      ??uart_init_7
//  140 
//  141     case UART4:
//  142         SIM_SCGC1 |= SIM_SCGC1_UART4_MASK;
??uart_init_3:
        LDR.W    R0,??DataTable13_3  ;; 0x40048028
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x400
        LDR.W    R1,??DataTable13_3  ;; 0x40048028
        STR      R0,[R1, #+0]
//  143 
//  144         if((UART4_RX_PIN == PTC14) || (UART4_RX_PIN == PTE25)  )
//  145         {
//  146             port_init( UART4_RX_PIN, ALT3);            //在PTC14上使能UART4_RXD
        MOV      R1,#+768
        MOVS     R0,#+153
          CFI FunCall port_init
        BL       port_init
//  147         }
//  148         else
//  149         {
//  150             ASSERT(0);                           //上诉条件都不满足，直接断言失败了，设置管脚有误？
//  151         }
//  152 
//  153         if((UART4_TX_PIN == PTC15) || (UART4_TX_PIN == PTE24)  )
//  154         {
//  155             port_init( UART4_TX_PIN, ALT3);
        MOV      R1,#+768
        MOVS     R0,#+152
          CFI FunCall port_init
        BL       port_init
//  156         }
//  157         else
//  158         {
//  159             ASSERT(0);                           //上诉条件都不满足，直接断言失败了，设置管脚有误？
//  160         }
//  161         break;
        B.N      ??uart_init_7
//  162 
//  163     case UART5:
//  164         SIM_SCGC1 |= SIM_SCGC1_UART5_MASK;
??uart_init_5:
        LDR.W    R0,??DataTable13_3  ;; 0x40048028
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x800
        LDR.W    R1,??DataTable13_3  ;; 0x40048028
        STR      R0,[R1, #+0]
//  165 
//  166         if((UART5_RX_PIN == PTD8) || (UART5_RX_PIN == PTE9))
//  167         {
//  168             port_init( UART5_RX_PIN, ALT3);
        MOV      R1,#+768
        MOVS     R0,#+104
          CFI FunCall port_init
        BL       port_init
//  169         }
//  170         else
//  171         {
//  172             ASSERT(0);                           //上诉条件都不满足，直接断言失败了，设置管脚有误？
//  173         }
//  174 
//  175         if((UART5_TX_PIN == PTD9) ||(UART5_TX_PIN == PTE8))
//  176         {
//  177             port_init( UART5_TX_PIN, ALT3);             //在PTD9上使能UART5_RXD
        MOV      R1,#+768
        MOVS     R0,#+105
          CFI FunCall port_init
        BL       port_init
//  178         }
//  179         else
//  180         {
//  181             ASSERT(0);                           //上诉条件都不满足，直接断言失败了，设置管脚有误？
//  182         }
//  183         break;
        B.N      ??uart_init_7
//  184     default:
//  185         break;
//  186     }
//  187 
//  188     //设置的时候，应该禁止发送接受
//  189     UART_C2_REG(UARTN[uratn]) &= ~(0
//  190                                    | UART_C2_TE_MASK
//  191                                    | UART_C2_RE_MASK
//  192                                   );
??uart_init_6:
??uart_init_7:
        LDR.W    R0,??DataTable13_4
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        LDRB     R0,[R0, #+3]
        ANDS     R0,R0,#0xF3
        LDR.W    R1,??DataTable13_4
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        STRB     R0,[R1, #+3]
//  193 
//  194 
//  195     //配置成8位无校验模式
//  196     //设置 UART 数据格式、校验方式和停止位位数。通过设置 UART 模块控制寄存器 C1 实现；
//  197     UART_C1_REG(UARTN[uratn]) |= (0
//  198                                   //| UART_C1_M_MASK                    //9 位或 8 位模式选择 : 0 为 8位 ，1 为 9位（注释了表示0，即8位） （如果是9位，位8在UARTx_C3里）
//  199                                   //| UART_C1_PE_MASK                   //奇偶校验使能（注释了表示禁用）
//  200                                   //| UART_C1_PT_MASK                   //校验位类型 : 0 为 偶校验 ，1 为 奇校验
//  201                                  );
        LDR.W    R0,??DataTable13_4
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        LDRB     R0,[R0, #+2]
        LDR.W    R1,??DataTable13_4
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        STRB     R0,[R1, #+2]
//  202 
//  203     //计算波特率，串口0、1使用内核时钟，其它串口使用bus时钟
//  204     if ((uratn == UART0) || (uratn == UART1))
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??uart_init_8
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+1
        BNE.N    ??uart_init_9
//  205     {
//  206         sysclk = core_clk_khz * 1000;                                   //内核时钟
??uart_init_8:
        LDR.W    R0,??DataTable13_5
        LDR      R0,[R0, #+0]
        MOV      R1,#+1000
        MULS     R0,R1,R0
        MOV      R9,R0
        B.N      ??uart_init_10
//  207     }
//  208     else
//  209     {
//  210         sysclk = bus_clk_khz * 1000;                                    //bus时钟
??uart_init_9:
        LDR.W    R0,??DataTable13_6
        LDR      R0,[R0, #+0]
        MOV      R1,#+1000
        MULS     R0,R1,R0
        MOV      R9,R0
//  211     }
//  212 
//  213     //UART 波特率 = UART 模块时钟 / (16 × (SBR[12:0] + BRFA))
//  214     //不考虑 BRFA 的情况下， SBR = UART 模块时钟 / (16 * UART 波特率)
//  215     sbr = (uint16)(sysclk / (baud * 16));
??uart_init_10:
        LSLS     R0,R5,#+4
        UDIV     R0,R9,R0
        MOVS     R6,R0
//  216     if(sbr > 0x1FFF)sbr = 0x1FFF;                                       //SBR 是 13bit，最大为 0x1FFF
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R6,#+8192
        BLT.N    ??uart_init_11
        MOVW     R0,#+8191
        MOVS     R6,R0
//  217 
//  218     //已知 SBR ，则 BRFA =  = UART 模块时钟 / UART 波特率 - 16 ×SBR[12:0]
//  219     brfa = (sysclk / baud)  - (sbr * 16);
??uart_init_11:
        UDIV     R0,R9,R5
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        SUBS     R0,R0,R6, LSL #+4
        MOVS     R7,R0
//  220     ASSERT( brfa <= 0x1F);                  //断言，如果此值不符合条件，则设置的条件不满足寄存器的设置
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R7,#+32
        BLT.N    ??uart_init_12
        MOVS     R1,#+220
        LDR.N    R0,??DataTable13_7
          CFI FunCall assert_failed
        BL       assert_failed
//  221                                             //可以通过增大波特率来解决这个问题
//  222 
//  223     //写 SBR
//  224     temp = UART_BDH_REG(UARTN[uratn]) & (~UART_BDH_SBR_MASK);           //缓存 清空 SBR 的 UARTx_BDH的值
??uart_init_12:
        LDR.N    R0,??DataTable13_4
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0xE0
        MOV      R8,R0
//  225     UART_BDH_REG(UARTN[uratn]) = temp |  UART_BDH_SBR(sbr >> 8);        //先写入SBR高位
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        LSRS     R0,R6,#+8
        ANDS     R0,R0,#0x1F
        ORRS     R0,R0,R8
        LDR.N    R1,??DataTable13_4
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        STRB     R0,[R1, #+0]
//  226     UART_BDL_REG(UARTN[uratn]) = UART_BDL_SBR(sbr);                     //再写入SBR低位
        LDR.N    R0,??DataTable13_4
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        STRB     R6,[R0, #+1]
//  227 
//  228     //写 BRFD
//  229     temp = UART_C4_REG(UARTN[uratn]) & (~UART_C4_BRFA_MASK) ;           //缓存 清空 BRFA 的 UARTx_C4 的值
        LDR.N    R0,??DataTable13_4
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        LDRB     R0,[R0, #+10]
        ANDS     R0,R0,#0xE0
        MOV      R8,R0
//  230     UART_C4_REG(UARTN[uratn]) = temp |  UART_C4_BRFA(brfa);             //写入BRFA
        ANDS     R0,R7,#0x1F
        ORRS     R0,R0,R8
        LDR.N    R1,??DataTable13_4
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        STRB     R0,[R1, #+10]
//  231 
//  232 
//  233 
//  234     //设置FIFO(FIFO的深度是由硬件决定的，软件不能设置)
//  235     UART_PFIFO_REG(UARTN[uratn]) |= (0
//  236                                      | UART_PFIFO_TXFE_MASK               //使能TX FIFO(注释表示禁止)
//  237                                      //| UART_PFIFO_TXFIFOSIZE(0)         //（只读）TX FIFO 大小，0为1字节，1~6为 2^(n+1)字节
//  238                                      | UART_PFIFO_RXFE_MASK               //使能RX FIFO(注释表示禁止)
//  239                                      //| UART_PFIFO_RXFIFOSIZE(0)         //（只读）RX FIFO 大小，0为1字节，1~6为 2^(n+1)字节
//  240                                     );
        LDR.N    R0,??DataTable13_4
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        LDRB     R0,[R0, #+16]
        ORRS     R0,R0,#0x88
        LDR.N    R1,??DataTable13_4
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        STRB     R0,[R1, #+16]
//  241 
//  242     /* 允许发送和接收 */
//  243     UART_C2_REG(UARTN[uratn]) |= (0
//  244                                   | UART_C2_TE_MASK                     //发送使能
//  245                                   | UART_C2_RE_MASK                     //接收使能
//  246                                   //| UART_C2_TIE_MASK                  //发送中断或DMA传输请求使能（注释了表示禁用）
//  247                                   //| UART_C2_TCIE_MASK                 //发送完成中断使能（注释了表示禁用）
//  248                                   //| UART_C2_RIE_MASK                  //接收满中断或DMA传输请求使能（注释了表示禁用）
//  249                                  );
        LDR.N    R0,??DataTable13_4
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        LDRB     R0,[R0, #+3]
        ORRS     R0,R0,#0xC
        LDR.N    R1,??DataTable13_4
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        STRB     R0,[R1, #+3]
//  250 
//  251     //设置是否允许接收和发送中断。通过设置 UART 模块的 C2 寄存器的
//  252     //RIE 和 TIE 位实现。如果使能中断，必须首先实现中断服务程序；
//  253 }
        POP      {R0,R4-R9,PC}    ;; return
          CFI EndBlock cfiBlock2
//  254 
//  255 /*!
//  256  *  @brief      等待接受1个字节
//  257  *  @param      UARTn_e       模块号（UART0~UART5）
//  258  *  @param      ch          接收地址
//  259  *  @since      v5.0
//  260  *  @note       如果需要查询接收状态，可用 uart_query ，
//  261                 如果需要查询接收数据，可用 uart_querychar
//  262  *  Sample usage:
//  263                         char ch;
//  264                         uart_getchar (UART3,&ch);   //等待接受1个字节，保存到 ch里
//  265  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function uart_getchar
          CFI NoCalls
        THUMB
//  266 void uart_getchar (UARTn_e uratn, char *ch)
//  267 {
//  268     //等待接收到数据（使能了FIFO后，以下两种方法都可行，都是一样的意思）
//  269     //while( !UART_RCFIFO_REG(UARTN[uratn]) );                                //等待接收到数据数量非0
//  270     //while( (UART_SFIFO_REG(UARTN[uratn]) & UART_SFIFO_RXEMPT_MASK)) ;     //等待接收缓冲区/FIFO 非空的
//  271 
//  272     //如下方法是飞思卡尔官方例程提供的方法
//  273     while (!(UART_S1_REG(UARTN[uratn]) & UART_S1_RDRF_MASK));       //等待接收满了
uart_getchar:
??uart_getchar_0:
        LDR.N    R2,??DataTable13_4
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        LDR      R2,[R2, R0, LSL #+2]
        LDRB     R2,[R2, #+4]
        LSLS     R2,R2,#+26
        BPL.N    ??uart_getchar_0
//  274 
//  275     // 获取接收到的8位数据
//  276     *ch =  UART_D_REG(UARTN[uratn]);
        LDR.N    R2,??DataTable13_4
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        LDR      R2,[R2, R0, LSL #+2]
        LDRSB    R2,[R2, #+7]
        STRB     R2,[R1, #+0]
//  277 
//  278     // 获取 9位数据，应该是（需要修改函数的返回类型）：
//  279     // *ch =   ((( UARTx_C3_REG(UARTN[uratn]) & UART_C3_R8_MASK ) >> UART_C3_R8_SHIFT ) << 8)   |   UART_D_REG(UARTN[uratn]);  //返回9bit
//  280 
//  281 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock3
//  282 
//  283 
//  284 /*!
//  285  *  @brief      查询接收1个字符
//  286  *  @param      UARTn_e       模块号（UART0~UART5）
//  287  *  @param      ch          接收地址
//  288  *  @return     1为接收成功，0为接收失败
//  289  *  @since      v5.0
//  290  *  @note       如果需要等待接收，可用 uart_getchar
//  291  *  Sample usage:       char ch ;
//  292                         if( uart_querychar (UART3,&ch) == 1)     //查询接收1个字符，保存到 ch里
//  293                         {
//  294                             printf("成功接收到一个字节");
//  295                         }
//  296  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function uart_querychar
          CFI NoCalls
        THUMB
//  297 char uart_querychar (UARTn_e uratn, char *ch)
//  298 {
uart_querychar:
        MOVS     R2,R0
//  299     if( UART_RCFIFO_REG(UARTN[uratn]) )         //查询是否接受到数据
        LDR.N    R0,??DataTable13_4
        SXTB     R2,R2            ;; SignExt  R2,R2,#+24,#+24
        LDR      R0,[R0, R2, LSL #+2]
        LDRB     R0,[R0, #+22]
        CMP      R0,#+0
        BEQ.N    ??uart_querychar_0
//  300     {
//  301         *ch  =   UART_D_REG(UARTN[uratn]);      //接受到8位的数据
        LDR.N    R0,??DataTable13_4
        SXTB     R2,R2            ;; SignExt  R2,R2,#+24,#+24
        LDR      R0,[R0, R2, LSL #+2]
        LDRSB    R0,[R0, #+7]
        STRB     R0,[R1, #+0]
//  302         return  1;                              //返回 1 表示接收成功
        MOVS     R0,#+1
        B.N      ??uart_querychar_1
//  303     }
//  304 
//  305     *ch = 0;                                    //接收不到，应该清空了接收区
??uart_querychar_0:
        MOVS     R0,#+0
        STRB     R0,[R1, #+0]
//  306     return 0;                                   //返回0表示接收失败
        MOVS     R0,#+0
??uart_querychar_1:
        BX       LR               ;; return
          CFI EndBlock cfiBlock4
//  307 }
//  308 
//  309 /*!
//  310  *  @brief      查询接收字符串
//  311  *  @param      UARTn_e       模块号（UART0~UART5）
//  312  *  @param      str         接收地址
//  313  *  @param      max_len     最大接收长度
//  314  *  @return     接收到的字节数目
//  315  *  @since      v5.0
//  316  *  Sample usage:       char str[100];
//  317                         uint32 num;
//  318                         num = uart_querystr (UART3,&str,100);
//  319                         if( num != 0 )
//  320                         {
//  321                             printf("成功接收到%d个字节:%s",num,str);
//  322                         }
//  323  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function uart_querystr
        THUMB
//  324 uint32 uart_querystr (UARTn_e uratn, char *str, uint32 max_len)
//  325 {
uart_querystr:
        PUSH     {R4-R8,LR}
          CFI R14 Frame(CFA, -4)
          CFI R8 Frame(CFA, -8)
          CFI R7 Frame(CFA, -12)
          CFI R6 Frame(CFA, -16)
          CFI R5 Frame(CFA, -20)
          CFI R4 Frame(CFA, -24)
          CFI CFA R13+24
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  326     uint32 i = 0,j;
        MOVS     R8,#+0
//  327 
//  328     for(j=0;j<10000;j++)                 // 10000 的作用是延时，可自行根据情况修改
        MOVS     R0,#+0
        MOVS     R7,R0
??uart_querystr_0:
        MOVW     R0,#+10000
        CMP      R7,R0
        BCS.N    ??uart_querystr_1
//  329     {
//  330         while(uart_querychar(uratn, str + i)  )
??uart_querystr_2:
        ADDS     R1,R8,R5
        MOVS     R0,R4
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
          CFI FunCall uart_querychar
        BL       uart_querychar
        CMP      R0,#+0
        BEQ.N    ??uart_querystr_3
//  331         {
//  332             j=0;
        MOVS     R0,#+0
        MOVS     R7,R0
//  333             if( *(str + i) == NULL )    //接收到字符串结束符
        LDRSB    R0,[R8, R5]
        CMP      R0,#+0
        BNE.N    ??uart_querystr_4
//  334             {
//  335                 return i;
        MOV      R0,R8
        B.N      ??uart_querystr_5
//  336             }
//  337 
//  338             i++;
??uart_querystr_4:
        ADDS     R8,R8,#+1
//  339             if(i >= max_len)            //超过设定的最大值，退出
        CMP      R8,R6
        BCC.N    ??uart_querystr_2
//  340             {
//  341                 *(str + i) = 0;     //确保字符串结尾是0x00
        MOVS     R0,#+0
        STRB     R0,[R8, R5]
//  342                 return i;
        MOV      R0,R8
        B.N      ??uart_querystr_5
//  343             }
//  344         }
//  345     }
??uart_querystr_3:
        ADDS     R7,R7,#+1
        B.N      ??uart_querystr_0
//  346 
//  347     *(str + i) = 0;                     //确保字符串结尾是0x00
??uart_querystr_1:
        MOVS     R0,#+0
        STRB     R0,[R8, R5]
//  348     return i;
        MOV      R0,R8
??uart_querystr_5:
        POP      {R4-R8,PC}       ;; return
          CFI EndBlock cfiBlock5
//  349 }
//  350 
//  351 
//  352 /*!
//  353  *  @brief      查询接收buff
//  354  *  @param      UARTn_e       模块号（UART0~UART5）
//  355  *  @param      str         接收地址
//  356  *  @param      max_len     最大接收长度
//  357  *  @return     接收到的字节数目
//  358  *  @since      v5.0
//  359  *  Sample usage:       char buff[100];
//  360                         uint32 num;
//  361                         num = uart_querybuff (UART3,&buff,100);
//  362                         if( num != 0 )
//  363                         {
//  364                             printf("成功接收到%d个字节:%s",num,buff);
//  365                         }
//  366  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function uart_querybuff
        THUMB
//  367 uint32 uart_querybuff (UARTn_e uratn, char *buff, uint32 max_len)
//  368 {
uart_querybuff:
        PUSH     {R4-R8,LR}
          CFI R14 Frame(CFA, -4)
          CFI R8 Frame(CFA, -8)
          CFI R7 Frame(CFA, -12)
          CFI R6 Frame(CFA, -16)
          CFI R5 Frame(CFA, -20)
          CFI R4 Frame(CFA, -24)
          CFI CFA R13+24
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  369     uint32 i = 0,j;
        MOVS     R7,#+0
//  370     for(j=0;j<10000;j++)                 // 10000 的作用是延时，可自行根据情况修改
        MOVS     R0,#+0
        MOV      R8,R0
??uart_querybuff_0:
        MOVW     R0,#+10000
        CMP      R8,R0
        BCS.N    ??uart_querybuff_1
//  371     {
//  372         while(uart_querychar(uratn, buff + i)  )
??uart_querybuff_2:
        ADDS     R1,R7,R5
        MOVS     R0,R4
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
          CFI FunCall uart_querychar
        BL       uart_querychar
        CMP      R0,#+0
        BEQ.N    ??uart_querybuff_3
//  373         {
//  374             i++;
        ADDS     R7,R7,#+1
//  375             if(i >= max_len)            //超过设定的最大值，退出
        CMP      R7,R6
        BCC.N    ??uart_querybuff_2
//  376             {
//  377                 return i;
        MOVS     R0,R7
        B.N      ??uart_querybuff_4
//  378             }
//  379         }
//  380     }
??uart_querybuff_3:
        ADDS     R8,R8,#+1
        B.N      ??uart_querybuff_0
//  381 
//  382     return i;
??uart_querybuff_1:
        MOVS     R0,R7
??uart_querybuff_4:
        POP      {R4-R8,PC}       ;; return
          CFI EndBlock cfiBlock6
//  383 }
//  384 
//  385 
//  386 /*!
//  387  *  @brief      串口发送一个字节
//  388  *  @param      UARTn_e       模块号（UART0~UART5）
//  389  *  @param      ch          需要发送的字节
//  390  *  @since      v5.0
//  391  *  @note       printf需要用到此函数
//  392  *  @see        fputc
//  393  *  Sample usage:       uart_putchar (UART3, 'A');  //发送字节'A'
//  394  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function uart_putchar
          CFI NoCalls
        THUMB
//  395 void uart_putchar (UARTn_e uratn, char ch)
//  396 {
//  397     //等待发送缓冲区空
//  398     while(!(UART_S1_REG(UARTN[uratn]) & UART_S1_TDRE_MASK));
uart_putchar:
??uart_putchar_0:
        LDR.N    R2,??DataTable13_4
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        LDR      R2,[R2, R0, LSL #+2]
        LDRB     R2,[R2, #+4]
        LSLS     R2,R2,#+24
        BPL.N    ??uart_putchar_0
//  399 
//  400     //发送数据
//  401     UART_D_REG(UARTN[uratn]) = (uint8)ch;
        LDR.N    R2,??DataTable13_4
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        LDR      R2,[R2, R0, LSL #+2]
        STRB     R1,[R2, #+7]
//  402 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock7
//  403 
//  404 /*!
//  405  *  @brief      查询是否接受到一个字节
//  406  *  @param      UARTn_e       模块号（UART0~UART5）
//  407  *  @return     接收到数据返回1，没接收到数据返回0
//  408  *  @since      v5.0
//  409  *  Sample usage:       char ch;
//  410                         if(uart_query (UART3) == 1)     //查询是否接收到数据
//  411                         {
//  412                             ch = uart_getchar (UART3);  //等待接收一个数据，保存到 ch里
//  413                         }
//  414  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function uart_query
          CFI NoCalls
        THUMB
//  415 char uart_query (UARTn_e uratn)
//  416 {
uart_query:
        MOVS     R1,R0
//  417     if(UART_RCFIFO_REG(UARTN[uratn]))                 //接收到数据数量非0
        LDR.N    R0,??DataTable13_4
        SXTB     R1,R1            ;; SignExt  R1,R1,#+24,#+24
        LDR      R0,[R0, R1, LSL #+2]
        LDRB     R0,[R0, #+22]
        CMP      R0,#+0
        BEQ.N    ??uart_query_0
//  418         //if(!(UART_SFIFO_REG(UARTN[uratn]) & UART_SFIFO_RXEMPT_MASK))
//  419         //if(UART_S1_REG(UARTN[uratn]) & UART_S1_TDRE_MASK)
//  420     {
//  421         return 1;
        MOVS     R0,#+1
        B.N      ??uart_query_1
//  422     }
//  423     else
//  424     {
//  425         return 0;
??uart_query_0:
        MOVS     R0,#+0
??uart_query_1:
        BX       LR               ;; return
          CFI EndBlock cfiBlock8
//  426     }
//  427     //return UART_RCFIFO_REG(UARTN[uratn]);
//  428 }
//  429 
//  430 /*!
//  431  *  @brief      发送指定len个字节长度数组 （包括 NULL 也会发送）
//  432  *  @param      UARTn_e       模块号（UART0~UART5）
//  433  *  @param      buff        数组地址
//  434  *  @param      len         发送数组的长度
//  435  *  @since      v5.0
//  436  *  Sample usage:       uart_putbuff (UART3,"1234567", 3); //实际发送了3个字节'1','2','3'
//  437  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function uart_putbuff
        THUMB
//  438 void uart_putbuff (UARTn_e uratn, uint8 *buff, uint32 len)
//  439 {
uart_putbuff:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  440     while(len--)
??uart_putbuff_0:
        MOVS     R0,R6
        SUBS     R6,R0,#+1
        CMP      R0,#+0
        BEQ.N    ??uart_putbuff_1
//  441     {
//  442         uart_putchar(uratn, *buff);
        LDRSB    R1,[R5, #+0]
        SXTB     R1,R1            ;; SignExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
          CFI FunCall uart_putchar
        BL       uart_putchar
//  443         buff++;
        ADDS     R5,R5,#+1
        B.N      ??uart_putbuff_0
//  444     }
//  445 }
??uart_putbuff_1:
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock9
//  446 
//  447 
//  448 /*!
//  449  *  @brief      发送字符串(遇 NULL 停止发送)
//  450  *  @param      UARTn_e       模块号（UART0~UART5）
//  451  *  @param      str         字符串地址
//  452  *  @since      v5.0
//  453  *  Sample usage:       uart_putstr (UART3,"1234567"); //实际发送了7个字节
//  454  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function uart_putstr
        THUMB
//  455 void uart_putstr (UARTn_e uratn, const uint8 *str)
//  456 {
uart_putstr:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
//  457     while(*str)
??uart_putstr_0:
        LDRB     R0,[R5, #+0]
        CMP      R0,#+0
        BEQ.N    ??uart_putstr_1
//  458     {
//  459         uart_putchar(uratn, *str++);
        LDRSB    R1,[R5, #+0]
        SXTB     R1,R1            ;; SignExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
          CFI FunCall uart_putchar
        BL       uart_putchar
        ADDS     R5,R5,#+1
        B.N      ??uart_putstr_0
//  460     }
//  461 }
??uart_putstr_1:
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock10
//  462 
//  463 /*!
//  464  *  @brief      开串口接收中断
//  465  *  @param      UARTn_e       模块号（UART0~UART5）
//  466  *  @since      v5.0
//  467  *  Sample usage:       uart_rx_irq_en(UART3);         //开串口3接收中断
//  468  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function uart_rx_irq_en
        THUMB
//  469 void uart_rx_irq_en(UARTn_e uratn)
//  470 {
uart_rx_irq_en:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  471     UART_C2_REG(UARTN[uratn]) |= UART_C2_RIE_MASK;                          //使能UART接收中断
        LDR.N    R0,??DataTable13_4
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        LDRB     R0,[R0, #+3]
        ORRS     R0,R0,#0x20
        LDR.N    R1,??DataTable13_4
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        STRB     R0,[R1, #+3]
//  472     enable_irq((IRQn_t)((uratn << 1) + UART0_RX_TX_IRQn));                  //使能IRQ中断
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LSLS     R0,R4,#+1
        ADDS     R0,R0,#+45
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
          CFI FunCall NVIC_EnableIRQ
        BL       NVIC_EnableIRQ
//  473 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock11
//  474 
//  475 /*!
//  476  *  @brief      开串口发送中断
//  477  *  @param      UARTn_e       模块号（UART0~UART5）
//  478  *  @since      v5.0
//  479  *  Sample usage:       uart_tx_irq_en(UART3);         //开串口3发送中断
//  480  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function uart_tx_irq_en
        THUMB
//  481 void uart_tx_irq_en(UARTn_e uratn)
//  482 {
uart_tx_irq_en:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  483     UART_C2_REG(UARTN[uratn]) |= UART_C2_TIE_MASK;                          //使能UART发送中断
        LDR.N    R0,??DataTable13_4
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        LDRB     R0,[R0, #+3]
        ORRS     R0,R0,#0x80
        LDR.N    R1,??DataTable13_4
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        STRB     R0,[R1, #+3]
//  484     enable_irq((IRQn_t)((uratn << 1) + UART0_RX_TX_IRQn));                  //使能IRQ中断
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LSLS     R0,R4,#+1
        ADDS     R0,R0,#+45
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
          CFI FunCall NVIC_EnableIRQ
        BL       NVIC_EnableIRQ
//  485 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock12
//  486 
//  487 /*!
//  488  *  @brief      开串口发送完成中断
//  489  *  @param      UARTn_e       模块号（UART0~UART5）
//  490  *  @since      v5.0
//  491  *  Sample usage:       uart_tx_irq_en(UART3);         //开串口3发送中断
//  492  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock13 Using cfiCommon0
          CFI Function uart_txc_irq_en
        THUMB
//  493 void uart_txc_irq_en(UARTn_e uratn)
//  494 {
uart_txc_irq_en:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  495     UART_C2_REG(UARTN[uratn]) |= UART_C2_TCIE_MASK;                         //使能UART发送中断
        LDR.N    R0,??DataTable13_4
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        LDRB     R0,[R0, #+3]
        ORRS     R0,R0,#0x40
        LDR.N    R1,??DataTable13_4
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        STRB     R0,[R1, #+3]
//  496     enable_irq((IRQn_t)((uratn << 1) + UART0_RX_TX_IRQn));                  //使能IRQ中断
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LSLS     R0,R4,#+1
        ADDS     R0,R0,#+45
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
          CFI FunCall NVIC_EnableIRQ
        BL       NVIC_EnableIRQ
//  497 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock13
//  498 
//  499 /*!
//  500  *  @brief      关串口接收中断
//  501  *  @param      UARTn_e       模块号（UART0~UART5）
//  502  *  @since      v5.0
//  503  *  Sample usage:       uart_rx_irq_dis(UART3);         //关串口3接收中断
//  504  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock14 Using cfiCommon0
          CFI Function uart_rx_irq_dis
        THUMB
//  505 void uart_rx_irq_dis(UARTn_e uratn)
//  506 {
uart_rx_irq_dis:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  507     UART_C2_REG(UARTN[uratn]) &= ~UART_C2_RIE_MASK;                         //禁止UART接收中断
        LDR.N    R0,??DataTable13_4
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        LDRB     R0,[R0, #+3]
        ANDS     R0,R0,#0xDF
        LDR.N    R1,??DataTable13_4
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        STRB     R0,[R1, #+3]
//  508 
//  509     //如果发送中断还没有关，则不关闭IRQ
//  510     if(!(UART_C2_REG(UARTN[uratn]) & (UART_C2_TIE_MASK | UART_C2_TCIE_MASK)) )
        LDR.N    R0,??DataTable13_4
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        LDRB     R0,[R0, #+3]
        MOVS     R1,#+192
        TST      R0,R1
        BNE.N    ??uart_rx_irq_dis_0
//  511     {
//  512         disable_irq((IRQn_t)((uratn << 1) + UART0_RX_TX_IRQn));             //关IRQ中断
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LSLS     R0,R4,#+1
        ADDS     R0,R0,#+45
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
          CFI FunCall NVIC_DisableIRQ
        BL       NVIC_DisableIRQ
//  513     }
//  514 }
??uart_rx_irq_dis_0:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock14
//  515 
//  516 /*!
//  517  *  @brief      关串口发送中断
//  518  *  @param      UARTn_e       模块号（UART0~UART5）
//  519  *  @since      v5.0
//  520  *  Sample usage:       uart_tx_irq_dis(UART3);         //关串口3发送中断
//  521  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock15 Using cfiCommon0
          CFI Function uart_txc_irq_dis
        THUMB
//  522 void uart_txc_irq_dis(UARTn_e uratn)
//  523 {
uart_txc_irq_dis:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  524     UART_C2_REG(UARTN[uratn]) &= ~UART_C2_TCIE_MASK;                        //禁止UART发送完成中断
        LDR.N    R0,??DataTable13_4
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        LDRB     R0,[R0, #+3]
        ANDS     R0,R0,#0xBF
        LDR.N    R1,??DataTable13_4
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        STRB     R0,[R1, #+3]
//  525 
//  526     //如果接收中断还没有关，则不关闭IRQ
//  527     if(!(UART_C2_REG(UARTN[uratn]) & UART_C2_RIE_MASK) )
        LDR.N    R0,??DataTable13_4
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        LDRB     R0,[R0, #+3]
        LSLS     R0,R0,#+26
        BMI.N    ??uart_txc_irq_dis_0
//  528     {
//  529         disable_irq((IRQn_t)((uratn << 1) + UART0_RX_TX_IRQn));             //关IRQ中断
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LSLS     R0,R4,#+1
        ADDS     R0,R0,#+45
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
          CFI FunCall NVIC_DisableIRQ
        BL       NVIC_DisableIRQ
//  530     }
//  531 }
??uart_txc_irq_dis_0:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock15
//  532 
//  533 /*!
//  534  *  @brief      关串口发送中断
//  535  *  @param      UARTn_e       模块号（UART0~UART5）
//  536  *  @since      v5.0
//  537  *  Sample usage:       uart_tx_irq_dis(UART3);         //关串口3发送中断
//  538  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock16 Using cfiCommon0
          CFI Function uart_tx_irq_dis
        THUMB
//  539 void uart_tx_irq_dis(UARTn_e uratn)
//  540 {
uart_tx_irq_dis:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  541     UART_C2_REG(UARTN[uratn]) &= ~UART_C2_TIE_MASK;                         //禁止UART发送中断
        LDR.N    R0,??DataTable13_4
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        LDRB     R0,[R0, #+3]
        ANDS     R0,R0,#0x7F
        LDR.N    R1,??DataTable13_4
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        STRB     R0,[R1, #+3]
//  542 
//  543     //如果接收中断还没有关，则不关闭IRQ
//  544     if(!(UART_C2_REG(UARTN[uratn]) & UART_C2_RIE_MASK) )
        LDR.N    R0,??DataTable13_4
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        LDRB     R0,[R0, #+3]
        LSLS     R0,R0,#+26
        BMI.N    ??uart_tx_irq_dis_0
//  545     {
//  546         disable_irq((IRQn_t)((uratn << 1) + UART0_RX_TX_IRQn));             //关IRQ中断
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LSLS     R0,R4,#+1
        ADDS     R0,R0,#+45
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
          CFI FunCall NVIC_DisableIRQ
        BL       NVIC_DisableIRQ
//  547     }
//  548 }
??uart_tx_irq_dis_0:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock16
//  549 
//  550 /*!
//  551  *  @brief      UART3测试中断服务函数
//  552  *  @since      v5.0
//  553  *  @warning    此函数需要用户根据自己需求完成，这里仅仅是提供一个模版
//  554  *  Sample usage:       set_vector_handler(UART3_RX_TX_VECTORn , uart3_test_handler);    //把 uart3_handler 函数添加到中断向量表，不需要我们手动调用
//  555  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock17 Using cfiCommon0
          CFI Function uart3_test_handler
          CFI NoCalls
        THUMB
//  556 void uart3_test_handler(void)
//  557 {
//  558     UARTn_e uratn = UART3;
uart3_test_handler:
        MOVS     R0,#+3
//  559 
//  560     if(UART_S1_REG(UARTN[uratn]) & UART_S1_RDRF_MASK)   //接收数据寄存器满
        LDR.N    R1,??DataTable13_4
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        LDR      R1,[R1, R0, LSL #+2]
        LDRB     R1,[R1, #+4]
//  561     {
//  562         //用户需要处理接收数据
//  563 
//  564     }
//  565 
//  566     if(UART_S1_REG(UARTN[uratn]) & UART_S1_TDRE_MASK )  //发送数据寄存器空
        LDR.N    R2,??DataTable13_4
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        LDR      R2,[R2, R0, LSL #+2]
        LDRB     R2,[R2, #+4]
//  567     {
//  568         //用户需要处理发送数据
//  569 
//  570     }
//  571 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock17

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13:
        DC32     0xe000e100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_1:
        DC32     0xe000e180

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_2:
        DC32     0x40048034

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_3:
        DC32     0x40048028

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_4:
        DC32     UARTN

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_5:
        DC32     core_clk_khz

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_6:
        DC32     bus_clk_khz

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_7:
        DC32     ?_0

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
        DC8 63H, 5CH, 4DH, 4BH, 36H, 30H, 5FH, 75H
        DC8 61H, 72H, 74H, 2EH, 63H, 0
        DC8 0, 0

        END
// 
//    24 bytes in section .data
//    56 bytes in section .rodata
// 1 274 bytes in section .text
// 
// 1 274 bytes of CODE  memory
//    56 bytes of CONST memory
//    24 bytes of DATA  memory
//
//Errors: none
//Warnings: none
