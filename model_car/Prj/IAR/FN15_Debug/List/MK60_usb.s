///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       21/Mar/2017  16:05:10
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\znc\project\K60FN\network_car\Chip\src\MK60_usb.c
//    Command line =  
//        E:\znc\project\K60FN\network_car\Chip\src\MK60_usb.c -D DEBUG -D
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
//        E:\znc\project\K60FN\network_car\Prj\IAR\FN15_Debug\List\MK60_usb.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "1"
        RTMODEL "__dlib_full_locale_support", "1"
        AAPCS BASE,INTERWORK,VFP
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN BufferPointer
        EXTERN CDC_Init
        EXTERN EP_IN_Transfer
        EXTERN Setup_Pkt
        EXTERN USB_EP_OUT_SizeCheck
        EXTERN USB_ISR
        EXTERN gu8EP3_OUT_ODD_Buffer
        EXTERN gu8USB_Flags
        EXTERN gu8USB_State
        EXTERN set_vector_handler
        EXTERN tBDTtable

        PUBLIC usb_com_init
        PUBLIC usb_com_rx
        PUBLIC usb_com_tx
        PUBLIC usb_enum_wait
        PUBLIC usb_init
        
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
        
// E:\znc\project\K60FN\network_car\Chip\src\MK60_usb.c
//    1 /*!
//    2  *     COPYRIGHT NOTICE
//    3  *     Copyright (c) 2013,山外科技
//    4  *     All rights reserved.
//    5  *     技术讨论：山外论坛 http://www.vcan123.com
//    6  *
//    7  *     除注明出处外，以下所有内容版权均属山外科技所有，未经允许，不得用于商业用途，
//    8  *     修改内容时必须保留山外科技的版权声明。
//    9  *
//   10  * @file       MK60_usb.c
//   11  * @brief      USB 代码库(目前 仅 有 虚拟 串口 )
//   12  * @author     山外科技
//   13  * @version    v5.0
//   14  * @date       2013-09-26
//   15  * @note       本例程 移植 飞思卡尔公司 提供的 K60 参考代码
//   16  */
//   17 
//   18 
//   19 #include "common.h"

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
        LDR.N    R2,??DataTable3  ;; 0xe000e100
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        LSRS     R3,R0,#+5
        STR      R1,[R2, R3, LSL #+2]
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
//   20 #include "usb.h"
//   21 #include "MK60_usb.h"
//   22 
//   23 
//   24 /*!
//   25  *  @brief      USB模块 初始化
//   26  *  @since      v5.0
//   27  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function usb_init
        THUMB
//   28 void usb_init(void)
//   29 {
usb_init:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   30     /* 软件配置 */
//   31     Setup_Pkt = (tUSB_Setup *)BufferPointer[bEP0OUT_ODD];
        LDR.N    R0,??DataTable3_1
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable3_2
        STR      R0,[R1, #+0]
//   32     gu8USB_State = uPOWER;                          //标记状态为上电状态
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_3
        STRB     R0,[R1, #+0]
//   33     /* MPU 配置 */
//   34     MPU_CESR = 0;                                   // MPU is disable. All accesses from all bus masters are allowed
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_4  ;; 0x4000d000
        STR      R0,[R1, #+0]
//   35 
//   36     /* SIM 配置 */
//   37 #ifdef USB_CLOCK_CLKIN
//   38     FLAG_SET(SIM_SCGC5_PORTE_SHIFT, SIM_SCGC5);
//   39     PORTE_PCR26 = (0 | PORT_PCR_MUX(7));            // Enabling PTE26 as CLK input
//   40 
//   41 #endif
//   42 
//   43 
//   44 #if defined(MK60DZ10)
//   45 #ifdef USB_CLOCK_PLL
//   46     FLAG_SET(SIM_SOPT2_PLLFLLSEL_SHIFT, SIM_SOPT2); // Select PLL output
//   47 #endif
//   48 
//   49 
//   50 #ifndef USB_CLOCK_CLKIN
//   51     FLAG_SET(SIM_SOPT2_USBSRC_SHIFT, SIM_SOPT2);    // PLL/FLL selected as CLK source
//   52 #endif
//   53 
//   54     SIM_CLKDIV2 = ((SIM_CLKDIV2 & ~( SIM_CLKDIV2_USBDIV_MASK | SIM_CLKDIV2_USBFRAC_MASK ))
//   55                    | SIM_CLKDIV2_USBDIV(USB_CLK_DIV)                    //USB 分频因子
//   56                    | (USB_CLK_FRAC << SIM_CLKDIV2_USBFRAC_SHIFT)        //USB 倍频因子
//   57                    //USB clk = PLL × [ (USBFRAC+1) / (USBDIV+1) ]
//   58                   );
//   59     SIM_SCGC4 |= SIM_SCGC4_USBOTG_MASK;             //USB Clock Gating
//   60                                                     //开启USB模块的时钟源
//   61 #elif defined(MK60F15)
//   62 #ifdef USB_CLOCK_PLL
//   63     SIM_SOPT2 |=(0
//   64                 | SIM_SOPT2_PLLFLLSEL(1)       /** PLL0 reference */   
//   65                 | SIM_SOPT2_USBFSRC(0)         /** MCGPLLCLK as CLKC source */
//   66                 | SIM_SOPT2_USBF_CLKSEL_MASK   /** USB fractional divider like USB reference clock */  
//   67                 );
        LDR.N    R0,??DataTable3_5  ;; 0x40048004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x50000
        LDR.N    R1,??DataTable3_5  ;; 0x40048004
        STR      R0,[R1, #+0]
//   68 
//   69 #endif
//   70 
//   71 
//   72 #ifndef USB_CLOCK_CLKIN
//   73     FLAG_SET(SIM_SOPT2_USBHSRC_SHIFT, SIM_SOPT2);    // PLL/FLL selected as CLK source
        LDR.N    R0,??DataTable3_5  ;; 0x40048004
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.N    R1,??DataTable3_5  ;; 0x40048004
        STR      R0,[R1, #+0]
//   74 #endif
//   75 
//   76     SIM_CLKDIV2 = ((SIM_CLKDIV2 & ~( SIM_CLKDIV2_USBFSDIV_MASK | SIM_CLKDIV2_USBFSFRAC_MASK ))
//   77                    | SIM_CLKDIV2_USBFSDIV(USB_CLK_DIV)                  //USB 分频因子
//   78                    | (USB_CLK_FRAC << SIM_CLKDIV2_USBFSFRAC_SHIFT)      //USB 倍频因子
//   79                    //USB clk = PLL × [ (USBFRAC+1) / (USBDIV+1) ]
//   80                   );
        LDR.N    R0,??DataTable3_6  ;; 0x40048048
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+4
        LSLS     R0,R0,#+4
        ORRS     R0,R0,#0x9
        LDR.N    R1,??DataTable3_6  ;; 0x40048048
        STR      R0,[R1, #+0]
//   81 
//   82     //SIM_SCGC6 |= SIM_SCGC6_USB2OTG_MASK;
//   83     SIM_SCGC4 |= SIM_SCGC4_USBFS_MASK;             //USB Clock Gating
        LDR.N    R0,??DataTable3_7  ;; 0x40048034
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x40000
        LDR.N    R1,??DataTable3_7  ;; 0x40048034
        STR      R0,[R1, #+0]
//   84                                                     //开启USB模块的时钟源
//   85 #endif
//   86 
//   87 
//   88     /* NVIC模块配置 */
//   89     set_vector_handler(USB0_VECTORn, USB_ISR);
        LDR.N    R1,??DataTable3_8
        MOVS     R0,#+89
          CFI FunCall set_vector_handler
        BL       set_vector_handler
//   90     enable_irq(USB0_IRQn);                          //使能NVIC中的USB OTG中断
        MOVS     R0,#+73
          CFI FunCall NVIC_EnableIRQ
        BL       NVIC_EnableIRQ
//   91 
//   92     /* USB模块配置 */
//   93     USB0_USBTRC0 |= USB_USBTRC0_USBRESET_MASK;      //复位USB模块
        LDR.N    R0,??DataTable3_9  ;; 0x4007210c
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x80
        LDR.N    R1,??DataTable3_9  ;; 0x4007210c
        STRB     R0,[R1, #+0]
//   94     while(FLAG_CHK(USB_USBTRC0_USBRESET_SHIFT, USB0_USBTRC0));
??usb_init_0:
        LDR.N    R0,??DataTable3_9  ;; 0x4007210c
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+24
        BMI.N    ??usb_init_0
//   95     USB0_BDTPAGE1 = (uint8)((uint32)tBDTtable >> 8); //配置当前缓冲描述符表BDT
        LDR.N    R0,??DataTable3_10
        LSRS     R0,R0,#+8
        LDR.N    R1,??DataTable3_11  ;; 0x4007209c
        STRB     R0,[R1, #+0]
//   96     USB0_BDTPAGE2 = (uint8)((uint32)tBDTtable >> 16);
        LDR.N    R0,??DataTable3_10
        LSRS     R0,R0,#+16
        LDR.N    R1,??DataTable3_12  ;; 0x400720b0
        STRB     R0,[R1, #+0]
//   97     USB0_BDTPAGE3 = (uint8)((uint32)tBDTtable >> 24);
        LDR.N    R0,??DataTable3_10
        LSRS     R0,R0,#+24
        LDR.N    R1,??DataTable3_13  ;; 0x400720b4
        STRB     R0,[R1, #+0]
//   98 
//   99     // 清 USB 复位标记
//  100     FLAG_SET(USB_ISTAT_USBRST_MASK, USB0_ISTAT);
        LDR.N    R0,??DataTable3_14  ;; 0x40072080
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.N    R1,??DataTable3_14  ;; 0x40072080
        STRB     R0,[R1, #+0]
//  101 
//  102     // 使能 USB 复位中断
//  103     FLAG_SET(USB_INTEN_USBRSTEN_SHIFT, USB0_INTEN);
        LDR.N    R0,??DataTable3_15  ;; 0x40072084
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable3_15  ;; 0x40072084
        STRB     R0,[R1, #+0]
//  104 
//  105     // Enable weak pull downs
//  106     USB0_USBCTRL = 0x40;
        MOVS     R0,#+64
        LDR.N    R1,??DataTable3_16  ;; 0x40072100
        STRB     R0,[R1, #+0]
//  107 
//  108     USB0_USBTRC0 |= 0x40;
        LDR.N    R0,??DataTable3_9  ;; 0x4007210c
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x40
        LDR.N    R1,??DataTable3_9  ;; 0x4007210c
        STRB     R0,[R1, #+0]
//  109 
//  110     USB0_CTL |= 0x01;
        LDR.N    R0,??DataTable3_17  ;; 0x40072094
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable3_17  ;; 0x40072094
        STRB     R0,[R1, #+0]
//  111 
//  112     // 上拉使能
//  113     FLAG_SET(USB_CONTROL_DPPULLUPNONOTG_SHIFT, USB0_CONTROL);
        LDR.N    R0,??DataTable3_18  ;; 0x40072108
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x10
        LDR.N    R1,??DataTable3_18  ;; 0x40072108
        STRB     R0,[R1, #+0]
//  114 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock1
//  115 
//  116 
//  117 /*!
//  118  *  @brief      USB 虚拟串口 初始化
//  119  *  @since      v5.0
//  120  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function usb_com_init
        THUMB
//  121 void usb_com_init(void)
//  122 {
usb_com_init:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  123     usb_init(); //初始化USB模块
          CFI FunCall usb_init
        BL       usb_init
//  124 
//  125     CDC_Init(); //初始化USB CDC模式
          CFI FunCall CDC_Init
        BL       CDC_Init
//  126 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock2
//  127 
//  128 
//  129 /*!
//  130  *  @brief      USB 等待枚举
//  131  *  @since      v5.0
//  132  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function usb_enum_wait
          CFI NoCalls
        THUMB
//  133 void usb_enum_wait(void)
//  134 {
//  135     while(gu8USB_State != uENUMERATED);//等待USB设备被枚举
usb_enum_wait:
??usb_enum_wait_0:
        LDR.N    R0,??DataTable3_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??usb_enum_wait_0
//  136 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock3
//  137 
//  138 /*!
//  139  *  @brief      USB 虚拟串口 接收
//  140  *  @param      rx_buf          数据接收缓冲区
//  141  *  @return     接收到的长度
//  142  *  @since      v5.0
//  143  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function usb_com_rx
        THUMB
//  144 uint8 usb_com_rx(uint8_t *rx_buf)
//  145 {
usb_com_rx:
        PUSH     {R3-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R4,R0
//  146     uint8 len;
//  147     uint8 temp = 0;
        MOVS     R6,#+0
//  148     uint8 *pu8EPBuffer;
//  149 
//  150     if(FLAG_CHK(EP_OUT, gu8USB_Flags)) // 如果有数据到来
        LDR.N    R0,??DataTable3_19
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+28
        BPL.N    ??usb_com_rx_0
//  151     {
//  152         len = USB_EP_OUT_SizeCheck(EP_OUT);
        MOVS     R0,#+3
          CFI FunCall USB_EP_OUT_SizeCheck
        BL       USB_EP_OUT_SizeCheck
        MOVS     R5,R0
//  153         temp = len;
        MOVS     R6,R5
//  154         pu8EPBuffer = gu8EP3_OUT_ODD_Buffer;
        LDR.N    R0,??DataTable3_20
        MOVS     R7,R0
//  155 
//  156         while(len--)
??usb_com_rx_1:
        MOVS     R0,R5
        SUBS     R5,R0,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??usb_com_rx_2
//  157             *rx_buf++ = *pu8EPBuffer++;
        LDRB     R0,[R7, #+0]
        STRB     R0,[R4, #+0]
        ADDS     R7,R7,#+1
        ADDS     R4,R4,#+1
        B.N      ??usb_com_rx_1
//  158 
//  159         usbEP_Reset(EP_OUT);
??usb_com_rx_2:
        MOVS     R0,#+64
        LDR.N    R1,??DataTable3_10
        STRH     R0,[R1, #+98]
//  160         usbSIE_CONTROL(EP_OUT);
        MOVS     R0,#+128
        LDR.N    R1,??DataTable3_10
        STRB     R0,[R1, #+96]
//  161         FLAG_CLR(EP_OUT, gu8USB_Flags);
        LDR.N    R0,??DataTable3_19
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0xF7
        LDR.N    R1,??DataTable3_19
        STRB     R0,[R1, #+0]
//  162     }
//  163     return temp;
??usb_com_rx_0:
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4-R7,PC}    ;; return
          CFI EndBlock cfiBlock4
//  164 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     0xe000e100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     BufferPointer

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     Setup_Pkt

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     gu8USB_State

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_4:
        DC32     0x4000d000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_5:
        DC32     0x40048004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_6:
        DC32     0x40048048

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_7:
        DC32     0x40048034

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_8:
        DC32     USB_ISR

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_9:
        DC32     0x4007210c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_10:
        DC32     tBDTtable

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_11:
        DC32     0x4007209c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_12:
        DC32     0x400720b0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_13:
        DC32     0x400720b4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_14:
        DC32     0x40072080

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_15:
        DC32     0x40072084

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_16:
        DC32     0x40072100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_17:
        DC32     0x40072094

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_18:
        DC32     0x40072108

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_19:
        DC32     gu8USB_Flags

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_20:
        DC32     gu8EP3_OUT_ODD_Buffer
//  165 
//  166 
//  167 /*!
//  168  *  @brief      USB 虚拟串口 发送
//  169  *  @param      tx_buf          数据发送缓冲区
//  170  *  @param      需要发送的数据长度
//  171  *  @since      v5.0
//  172  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function usb_com_tx
        THUMB
//  173 void usb_com_tx(uint8 *tx_buf, uint8 len)
//  174 {
usb_com_tx:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
//  175     EP_IN_Transfer(EP_IN, tx_buf, len);
        MOVS     R2,R5
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,R4
        MOVS     R0,#+2
          CFI FunCall EP_IN_Transfer
        BL       EP_IN_Transfer
//  176 }
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock5

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  177 
//  178 
//  179 
//  180 
// 
// 428 bytes in section .text
// 
// 428 bytes of CODE memory
//
//Errors: none
//Warnings: none
