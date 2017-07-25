///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       21/Mar/2017  16:04:41
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\znc\project\K60FN\network_car\Chip\src\MK60_can.c
//    Command line =  
//        E:\znc\project\K60FN\network_car\Chip\src\MK60_can.c -D DEBUG -D
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
//        E:\znc\project\K60FN\network_car\Prj\IAR\FN15_Debug\List\MK60_can.s
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
        EXTERN port_init

        PUBLIC CANN
        PUBLIC can_band_cfg_50000K
        PUBLIC can_band_cfg_60000K
        PUBLIC can_clear_flag
        PUBLIC can_get_flag
        PUBLIC can_init
        PUBLIC can_irq_dis
        PUBLIC can_irq_en
        PUBLIC can_rx
        PUBLIC can_rxbuff_enble
        PUBLIC can_rxbuff_mask
        PUBLIC can_setband
        PUBLIC can_tx
        
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
        
// E:\znc\project\K60FN\network_car\Chip\src\MK60_can.c
//    1 /*!
//    2  *     COPYRIGHT NOTICE
//    3  *     Copyright (c) 2013,山外科技
//    4  *     All rights reserved.
//    5  *     技术讨论：山外论坛 http://www.vcan123.com
//    6  *
//    7  *     除注明出处外，以下所有内容版权均属山外科技所有，未经允许，不得用于商业用途，
//    8  *     修改内容时必须保留山外科技的版权声明。
//    9  *
//   10  * @file       MK60_can.c
//   11  * @brief      CAN函数
//   12  * @author     山外科技
//   13  * @version    v5.1
//   14  * @date       2014-04-25
//   15  */
//   16 
//   17 #include "common.h"

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
        LDR.W    R2,??DataTable11  ;; 0xe000e100
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
        LDR.W    R2,??DataTable11_1  ;; 0xe000e180
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        LSRS     R3,R0,#+5
        STR      R1,[R2, R3, LSL #+2]
        BX       LR               ;; return
          CFI EndBlock cfiBlock1
//   18 #include "MK60_port.h"
//   19 #include "MK60_can.h"
//   20 
//   21 
//   22 // CAN ID值越低，报文优先级越高
//   23 // CAN 掩码用于屏蔽
//   24 
//   25 
//   26 // 用于发送缓冲区的报文缓冲区码字
//   27 #define CAN_CS_CODE_TX_INACTIVE     B8(1000)            //MB 处于非激活状态
//   28 #define CAN_CS_CODE_TX_ABORT        B8(1001)            //MB 被丢弃
//   29 #define CAN_CS_CODE_TX_DATA         B8(1100)            //MB 为一个发送数据帧（MB 的 RTR 位为 0）
//   30 #define CAN_CS_CODE_TX_REMOTE       B8(1100)            //MB 为一个发送远程请求帧（MB 的 RTR 位为 1）
//   31 #define CAN_CS_CODE_TX_TANSWER      B8(1110)            //MB 为是远程请求帧的一个发送回应帧
//   32 
//   33 // 用于接收缓冲区的报文缓冲区码字
//   34 #define CAN_CS_CODE_RX_INACTIVE     B8(0000)            //MB 处于非激活状态
//   35 #define CAN_CS_CODE_RX_EMPTY        B8(0100)            //MB 激活并且为空
//   36 #define CAN_CS_CODE_RX_FULL         B8(0010)            //MB 为满
//   37 #define CAN_CS_CODE_RX_OVERRUN      B8(0110)            //写入到一个满缓冲区 导致 MB 被覆盖
//   38 #define CAN_CS_CODE_RX_RANSWER      B8(1010)            //一个新帧被配置为确认一个远程请求帧并且发送一个回复帧。
//   39 #define CAN_CS_CODE_RX_BUSY         B8(0001)            //正在更新 MB 的内容。CPU 不允许访问MB
//   40 
//   41 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   42 CAN_MemMapPtr CANN[] = {CAN0_BASE_PTR, CAN1_BASE_PTR};
CANN:
        DATA
        DC32 40024000H, 400A4000H
//   43 
//   44 
//   45 //仅适用于CAN时钟源为 50.00MHz

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   46 CAN_band_cfg_t can_band_cfg_50000K[CAN_BAUD_MAX] =
can_band_cfg_50000K:
        DATA
        DC32 10
        DC16 624
        DC8 4, 0, 0, 0, 0, 0
        DC32 20
        DC16 124
        DC8 12, 2, 2, 2, 0, 0
        DC32 50
        DC16 124
        DC8 4, 0, 0, 0, 0, 0
        DC32 100
        DC16 24
        DC8 12, 2, 2, 2, 0, 0
        DC32 125
        DC16 24
        DC8 10, 1, 1, 1, 0, 0
        DC32 250
        DC16 24
        DC8 4, 0, 0, 0, 0, 0
        DC32 500
        DC16 4
        DC8 12, 2, 2, 2, 0, 0
        DC32 1000
        DC16 1
        DC8 9, 6, 6, 3, 0, 0
//   47 {
//   48     //BAND, PRESDIV, PROP_SEG, PSEG1,   PSEG2, RJW
//   49     {10,    624,    4,          0,      0,      0},         //采样点:87.50%
//   50     {20,    124,    12,         2,      2,      2},         //采样点:85.00%
//   51     {50,    124,    4,          0,      0,      0},         //采样点:87.50%
//   52     {100,   24,     12,         2,      2,      2},         //采样点:85.00%
//   53     {125,   24,     10,         1,      1,      1},         //采样点:87.50%
//   54     {250,   24,     4,          0,      0,      0},         //采样点:87.50%
//   55     {500,   4,      12,         2,      2,      2},         //采样点:85.00%
//   56     {1000,  1,      9,          6,      6,      3},         //采样点:72.00%
//   57 };
//   58 //仅适用于CAN时钟源为 60.00MHz

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   59 CAN_band_cfg_t can_band_cfg_60000K[CAN_BAUD_MAX] =
can_band_cfg_60000K:
        DATA
        DC32 10
        DC16 249
        DC8 16, 2, 2, 2, 0, 0
        DC32 20
        DC16 124
        DC8 16, 2, 2, 2, 0, 0
        DC32 50
        DC16 49
        DC8 16, 2, 2, 2, 0, 0
        DC32 100
        DC16 24
        DC8 16, 2, 2, 2, 0, 0
        DC32 125
        DC16 19
        DC8 16, 2, 2, 2, 0, 0
        DC32 250
        DC16 9
        DC8 16, 2, 2, 2, 0, 0
        DC32 500
        DC16 4
        DC8 16, 2, 2, 2, 0, 0
        DC32 1000
        DC16 2
        DC8 8, 4, 4, 3, 0, 0
//   60 {
//   61     //BAND, PRESDIV, PROP_SEG, PSEG1,   PSEG2, RJW
//   62     {10,    249,    16,         2,      2,      2},		//采样点:87.50%
//   63     {20,    124,    16,         2,      2,      2},		//采样点:87.50%
//   64     {50,    49,     16,         2,      2,      2},		//采样点:87.50%
//   65     {100,   24,     16,         2,      2,      2},		//采样点:87.50%
//   66     {125,   19,     16,         2,      2,      2},		//采样点:87.50%
//   67     {250,   9,      16,         2,      2,      2},		//采样点:87.50%
//   68     {500,   4,      16,         2,      2,      2},		//采样点:87.50%
//   69     {1000,  2,      8,          4,      4,      3},		//采样点:75.00%
//   70 };
//   71 
//   72 /*!
//   73  *  @brief      CAN 初始化
//   74  *  @param      CANn_e          CAN 模块号
//   75  *  @param      CAN_BAUD_e      波特率编号
//   76  *  @param      CAN_mode_e      CAN 模式( 正常 、 回环 模式)
//   77  *  @param      CAN_CLKSRC_e    CAN 时钟源( bus 、 外部晶振)
//   78  *  @since      v5.0
//   79  *  Sample usage:       can_init(CAN1,CAN_BAUD_20K,CAN_LOOPBACK);   //初始化 CAN1 ，波特率 20Kb/s ， 回环模式
//   80  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function can_init
        THUMB
//   81 void can_init(CANn_e cann, CAN_BAUD_e band, CAN_mode_e mode,CAN_CLKSRC_e clksrc)
//   82 {
can_init:
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
        MOVS     R6,R2
        MOVS     R7,R3
//   83     uint8 i;
//   84     CAN_MemMapPtr canptr = CANN[cann];
        LDR.W    R0,??DataTable11_2
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R9,[R0, R4, LSL #+2]
//   85 
//   86     switch(cann)
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??can_init_0
        CMP      R4,#+1
        BEQ.N    ??can_init_1
        B.N      ??can_init_2
//   87     {
//   88     case CAN0:
//   89         SIM_SCGC6 |= SIM_SCGC6_FLEXCAN0_MASK ;                  //开启 CAN0 时钟
??can_init_0:
        LDR.W    R0,??DataTable11_3  ;; 0x4004803c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10
        LDR.W    R1,??DataTable11_3  ;; 0x4004803c
        STR      R0,[R1, #+0]
//   90         port_init(CAN0_TX_PIN, ALT2);
        MOV      R1,#+512
        MOVS     R0,#+12
          CFI FunCall port_init
        BL       port_init
//   91         port_init(CAN0_RX_PIN, ALT2);
        MOV      R1,#+512
        MOVS     R0,#+13
          CFI FunCall port_init
        BL       port_init
//   92         break;
        B.N      ??can_init_3
//   93     case CAN1:
//   94         SIM_SCGC3 |= SIM_SCGC3_FLEXCAN1_MASK;                   //开启 CAN1 时钟
??can_init_1:
        LDR.W    R0,??DataTable11_4  ;; 0x40048030
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10
        LDR.W    R1,??DataTable11_4  ;; 0x40048030
        STR      R0,[R1, #+0]
//   95         port_init(CAN1_TX_PIN, ALT2);
        MOV      R1,#+512
        MOVS     R0,#+152
          CFI FunCall port_init
        BL       port_init
//   96         port_init(CAN1_RX_PIN, ALT2);
        MOV      R1,#+512
        MOVS     R0,#+153
          CFI FunCall port_init
        BL       port_init
//   97         break;
        B.N      ??can_init_3
//   98     default:
//   99         ASSERT(0);                                              //断言，cann值有误？
??can_init_2:
        MOVS     R1,#+99
        LDR.W    R0,??DataTable11_5
          CFI FunCall assert_failed
        BL       assert_failed
//  100     }
//  101 
//  102     //选择时钟源
//  103     if(clksrc == CAN_CLKSRC_BUS)
??can_init_3:
        SXTB     R7,R7            ;; SignExt  R7,R7,#+24,#+24
        CMP      R7,#+0
        BNE.N    ??can_init_4
//  104     {
//  105         CAN_CTRL1_REG(canptr)   |= CAN_CTRL1_CLKSRC_MASK;           //选择为bus 时钟
        LDR      R0,[R9, #+4]
        ORRS     R0,R0,#0x2000
        STR      R0,[R9, #+4]
        B.N      ??can_init_5
//  106     }
//  107     else
//  108     {
//  109 #if defined(MK60DZ10)
//  110         OSC_CR |= OSC_CR_ERCLKEN_MASK;                              //使能 OSCERCLK
//  111 #elif  defined(MK60F15)
//  112         OSC0_CR |= OSC_CR_ERCLKEN_MASK;                              //使能 OSCERCLK
??can_init_4:
        LDR.W    R0,??DataTable11_6  ;; 0x40065000
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x80
        LDR.W    R1,??DataTable11_6  ;; 0x40065000
        STRB     R0,[R1, #+0]
//  113 #endif
//  114         CAN_CTRL1_REG(canptr)   &= ~CAN_CTRL1_CLKSRC_MASK;
        LDR      R0,[R9, #+4]
        BICS     R0,R0,#0x2000
        STR      R0,[R9, #+4]
//  115     }
//  116 
//  117     CAN_MCR_REG(canptr) &= ~CAN_MCR_MDIS_MASK;                  //使能CAN模块
??can_init_5:
        LDR      R0,[R9, #+0]
        LSLS     R0,R0,#+1        ;; ZeroExtS R0,R0,#+1,#+1
        LSRS     R0,R0,#+1
        STR      R0,[R9, #+0]
//  118 
//  119     CAN_MCR_REG(canptr) |=  CAN_MCR_FRZ_MASK;                   //使能冻结模式
        LDR      R0,[R9, #+0]
        ORRS     R0,R0,#0x40000000
        STR      R0,[R9, #+0]
//  120 
//  121     while((CAN_MCR_REG(canptr) & CAN_MCR_LPMACK_MASK ));        //等待复位（低功耗模式无法复位成功）
??can_init_6:
        LDR      R0,[R9, #+0]
        LSLS     R0,R0,#+11
        BMI.N    ??can_init_6
//  122 
//  123     CAN_MCR_REG(canptr) |= CAN_MCR_SOFTRST_MASK;                //软件复位
        LDR      R0,[R9, #+0]
        ORRS     R0,R0,#0x2000000
        STR      R0,[R9, #+0]
//  124 
//  125     while(!(CAN_MCR_REG(canptr) & CAN_MCR_FRZACK_MASK));        //等待进入冻结模式
??can_init_7:
        LDR      R0,[R9, #+0]
        LSLS     R0,R0,#+7
        BPL.N    ??can_init_7
//  126 
//  127     //清空邮箱缓冲区内容清0
//  128     i = 16;
        MOVS     R0,#+16
        MOV      R8,R0
//  129     while(i)
??can_init_8:
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+0
        BEQ.N    ??can_init_9
//  130     {
//  131         i--;
        SUBS     R8,R8,#+1
//  132         CAN_CS_REG(canptr, i) = 0;
        MOVS     R0,#+0
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        ADDS     R1,R9,R8, LSL #+4
        STR      R0,[R1, #+128]
//  133         CAN_ID_REG(canptr, i) = 0;
        MOVS     R0,#+0
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        ADDS     R1,R9,R8, LSL #+4
        STR      R0,[R1, #+132]
//  134         CAN_WORD0_REG(canptr, i) = 0;
        MOVS     R0,#+0
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        ADDS     R1,R9,R8, LSL #+4
        STR      R0,[R1, #+136]
//  135         CAN_WORD1_REG(canptr, i) = 0;
        MOVS     R0,#+0
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        ADDS     R1,R9,R8, LSL #+4
        STR      R0,[R1, #+140]
        B.N      ??can_init_8
//  136     }
//  137 
//  138     CAN_CTRL2_REG(canptr) = (0
//  139                              //| CAN_CTRL2_EACEN_MASK            //接收邮箱过滤IDE匹配，RTR不匹配
//  140                              //| CAN_CTRL2_RRS_MASK              //不自动产生远程请求帧
//  141                              //| CAN_CTRL2_MRP_MASK              //邮箱首先从接收FIFO队列匹配然后再在邮箱中匹配
//  142                              | CAN_CTRL2_TASD(22)                //Tx Arbitration Start Delay
//  143                             );
??can_init_9:
        MOVS     R0,#+11534336
        STR      R0,[R9, #+52]
//  144 
//  145     //使用一个32位过滤器
//  146     CAN_MCR_REG(canptr) = (CAN_MCR_REG(canptr) & (~CAN_MCR_IDAM_MASK)) | CAN_MCR_IDAM(0);
        LDR      R0,[R9, #+0]
        BICS     R0,R0,#0x300
        STR      R0,[R9, #+0]
//  147 
//  148     //设置波特率
//  149     can_setband(cann, band);
        MOVS     R1,R5
        SXTB     R1,R1            ;; SignExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
          CFI FunCall can_setband
        BL       can_setband
//  150 
//  151     //回环模式
//  152     if(mode == CAN_LOOPBACK)
        SXTB     R6,R6            ;; SignExt  R6,R6,#+24,#+24
        CMP      R6,#+1
        BNE.N    ??can_init_10
//  153     {
//  154         CAN_CTRL1_REG(canptr) |= CAN_CTRL1_LPB_MASK;//使用回环模式
        LDR      R0,[R9, #+4]
        ORRS     R0,R0,#0x1000
        STR      R0,[R9, #+4]
//  155     }
//  156 
//  157     //默认使用 独立 掩码
//  158     CAN_MCR_REG(canptr) |= CAN_MCR_IRMQ_MASK;
??can_init_10:
        LDR      R0,[R9, #+0]
        ORRS     R0,R0,#0x10000
        STR      R0,[R9, #+0]
//  159 
//  160     //初始化掩码寄存器
//  161     i = NUMBER_OF_MB;
        MOVS     R0,#+16
        MOV      R8,R0
//  162     while(i)
??can_init_11:
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+0
        BEQ.N    ??can_init_12
//  163     {
//  164         i--;
        SUBS     R8,R8,#+1
//  165         CAN_RXIMR_REG(canptr, i) = 0x0;
        MOVS     R0,#+0
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        ADDS     R1,R9,R8, LSL #+2
        STR      R0,[R1, #+2176]
        B.N      ??can_init_11
//  166     }
//  167 
//  168     CAN_RXMGMASK_REG(canptr) = 0x0;
??can_init_12:
        MOVS     R0,#+0
        STR      R0,[R9, #+16]
//  169     CAN_RX14MASK_REG(canptr) = 0x0;
        MOVS     R0,#+0
        STR      R0,[R9, #+20]
//  170     CAN_RX15MASK_REG(canptr) = 0x0;
        MOVS     R0,#+0
        STR      R0,[R9, #+24]
//  171 
//  172     //只有在冻结模式下才能配置 配置完退出冻结模式
//  173     CAN_MCR_REG(canptr) &= ~(CAN_MCR_HALT_MASK);
        LDR      R0,[R9, #+0]
        BICS     R0,R0,#0x10000000
        STR      R0,[R9, #+0]
//  174 
//  175     //等待模块推出冻结模式
//  176     while( CAN_MCR_REG(canptr) & CAN_MCR_FRZACK_MASK);
??can_init_13:
        LDR      R0,[R9, #+0]
        LSLS     R0,R0,#+7
        BMI.N    ??can_init_13
//  177 
//  178     //等待同步
//  179     //等到不在冻结模式，休眠模式或者停止模式
//  180     while(CAN_MCR_REG(canptr) & CAN_MCR_NOTRDY_MASK);
??can_init_14:
        LDR      R0,[R9, #+0]
        LSLS     R0,R0,#+4
        BMI.N    ??can_init_14
//  181 }
        POP      {R0,R4-R9,PC}    ;; return
          CFI EndBlock cfiBlock2
//  182 
//  183 
//  184 /*!
//  185  *  @brief      CAN 发送数据
//  186  *  @param      CANn_e          CAN 模块号
//  187  *  @param      mb_num_e        缓冲区编号
//  188  *  @param      CAN_USR_ID_t    ID编号
//  189  *  @param      len             数据长度
//  190  *  @param      buff            缓冲区地址
//  191  *  @since      v5.0
//  192  *  Sample usage:       can_tx(CAN1,CAN_TX_MB,can_tx_id,DATA_LEN, txbuff);  //CAN发送数据。缓冲区CAN_TX_MB，报文ID:tx_ID，数据缓冲区txbuff，长度 DATA_LEN
//  193  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function can_tx
        THUMB
//  194 void can_tx(CANn_e cann, mb_num_e nMB, CAN_USR_ID_t id, uint8 len, void *buff)
//  195 {
can_tx:
        PUSH     {R4-R10,LR}
          CFI R14 Frame(CFA, -4)
          CFI R10 Frame(CFA, -8)
          CFI R9 Frame(CFA, -12)
          CFI R8 Frame(CFA, -16)
          CFI R7 Frame(CFA, -20)
          CFI R6 Frame(CFA, -24)
          CFI R5 Frame(CFA, -28)
          CFI R4 Frame(CFA, -32)
          CFI CFA R13+32
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
        LDR      R8,[SP, #+32]
//  196     uint32 word;
//  197     CAN_MemMapPtr canptr = CANN[cann];
        LDR.W    R0,??DataTable11_2
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R10,[R0, R4, LSL #+2]
//  198 
//  199 
//  200     ASSERT(len <= 8 );       //断言，一次发送最大长度为 8字节
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+9
        BLT.N    ??can_tx_0
        MOVS     R1,#+200
        LDR.W    R0,??DataTable11_5
          CFI FunCall assert_failed
        BL       assert_failed
//  201 
//  202 
//  203     //以下四步骤为发送过程
//  204     CAN_CS_REG(canptr, nMB)   = ( 0
//  205                                   | CAN_CS_CODE(CAN_CS_CODE_TX_INACTIVE)    //缓冲区写非激活代码
//  206                                   | (id.IDE << CAN_CS_IDE_SHIFT)            //缓冲区写IDE位
//  207                                   | (id.RTR << CAN_CS_RTR_SHIFT)            //缓冲区写RTR位
//  208                                   | CAN_CS_DLC(len)                         //缓冲区写数据长度
//  209                                 );
??can_tx_0:
        UBFX     R0,R6,#+29,#+1
        UBFX     R1,R6,#+30,#+1
        LSLS     R1,R1,#+20
        ORRS     R0,R1,R0, LSL #+21
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        LSLS     R1,R7,#+16
        ANDS     R1,R1,#0xF0000
        ORRS     R0,R1,R0
        ORRS     R0,R0,#0x8000000
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        ADDS     R1,R10,R5, LSL #+4
        STR      R0,[R1, #+128]
//  210 
//  211     //缓冲区写ID
//  212     if(id.IDE)
        UBFX     R0,R6,#+29,#+1
        CMP      R0,#+0
        BEQ.N    ??can_tx_1
//  213     {
//  214         //拓展帧
//  215         CAN_ID_REG(canptr, nMB)   = ( 0
//  216                                       | CAN_ID_PRIO(1)
//  217                                       | CAN_ID_EXT(id.ID)
//  218                                     );
        LSLS     R0,R6,#+14       ;; ZeroExtS R0,R6,#+14,#+14
        LSRS     R0,R0,#+14
        ORRS     R0,R0,#0x20000000
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        ADDS     R1,R10,R5, LSL #+4
        STR      R0,[R1, #+132]
        B.N      ??can_tx_2
//  219     }
//  220     else
//  221     {
//  222         //标准帧
//  223         CAN_ID_REG(canptr, nMB)   = ( 0
//  224                                       | CAN_ID_PRIO(1)
//  225                                       | CAN_ID_STD(id.ID)
//  226                                     );
??can_tx_1:
        LDR.W    R0,??DataTable11_7  ;; 0x1ffc0000
        ANDS     R0,R0,R6, LSL #+18
        ORRS     R0,R0,#0x20000000
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        ADDS     R1,R10,R5, LSL #+4
        STR      R0,[R1, #+132]
//  227     }
//  228 
//  229     //缓冲区写内容
//  230     word = *(uint32 *)buff;
??can_tx_2:
        LDR      R0,[R8, #+0]
        MOV      R9,R0
//  231     CAN_WORD0_REG(canptr, nMB) = SWAP32(word);
        REV      R0,R9
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        ADDS     R1,R10,R5, LSL #+4
        STR      R0,[R1, #+136]
//  232 
//  233     word = *((uint32 *)buff + 1);
        LDR      R0,[R8, #+4]
        MOV      R9,R0
//  234     CAN_WORD1_REG(canptr, nMB) = SWAP32(word);
        REV      R0,R9
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        ADDS     R1,R10,R5, LSL #+4
        STR      R0,[R1, #+140]
//  235 
//  236     //开始发送
//  237     CAN_CS_REG(canptr, nMB)   =   ( 0
//  238                                     | CAN_CS_CODE(CAN_CS_CODE_TX_DATA)              //写激活代码，MB 为一个发送数据帧（MB 的 RTR 位为 0）
//  239                                     //| CAN_CS_RTR_MASK
//  240                                     | CAN_CS_DLC(len)                               //缓冲区写数据长度
//  241                                   );
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        LSLS     R0,R7,#+16
        ANDS     R0,R0,#0xF0000
        ORRS     R0,R0,#0xC000000
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        ADDS     R1,R10,R5, LSL #+4
        STR      R0,[R1, #+128]
//  242 
//  243     //限时等待发送完成（如果使用中断则限时等待语句可删除）
//  244     while(!(CAN_IFLAG1_REG(canptr) & (1 << nMB)));
??can_tx_3:
        LDR      R0,[R10, #+48]
        LSRS     R0,R0,R5
        LSLS     R0,R0,#+31
        BPL.N    ??can_tx_3
//  245 
//  246 
//  247     //清报文缓冲区中断标志
//  248     CAN_IFLAG1_REG(canptr)  = (1 << nMB);
        MOVS     R0,#+1
        LSLS     R0,R0,R5
        STR      R0,[R10, #+48]
//  249 
//  250 }
        POP      {R4-R10,PC}      ;; return
          CFI EndBlock cfiBlock3
//  251 
//  252 /*!
//  253  *  @brief      使能 CAN 接收缓冲区
//  254  *  @param      CANn_e          CAN 模块号
//  255  *  @param      mb_num_e        缓冲区编号
//  256  *  @param      CAN_USR_ID_t    ID编号
//  257  *  @since      v5.0
//  258  *  Sample usage:      can_rxbuff_enble(CAN1,CAN_RX_MB,can_my_id);
//  259  *                                   //使能接收缓冲区
//  260  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function can_rxbuff_enble
          CFI NoCalls
        THUMB
//  261 void can_rxbuff_enble(CANn_e cann, mb_num_e nMB, CAN_USR_ID_t id)
//  262 {
can_rxbuff_enble:
        PUSH     {R4,R5}
          CFI R5 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  263     CAN_MemMapPtr canptr = CANN[cann];
        LDR.N    R3,??DataTable11_2
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        LDR      R3,[R3, R0, LSL #+2]
//  264 
//  265     //将MB配置为非激活状态
//  266     CAN_CS_REG(canptr, nMB) = CAN_CS_CODE(CAN_CS_CODE_RX_INACTIVE);
        MOVS     R4,#+0
        SXTB     R1,R1            ;; SignExt  R1,R1,#+24,#+24
        ADDS     R5,R3,R1, LSL #+4
        STR      R4,[R5, #+128]
//  267 
//  268 
//  269     if(id.IDE )         //扩展帧
        UBFX     R4,R2,#+29,#+1
        CMP      R4,#+0
        BEQ.N    ??can_rxbuff_enble_0
//  270     {
//  271         CAN_ID_REG(canptr, nMB) =   ( 0
//  272                                       | CAN_ID_EXT( id.ID)
//  273                                     );
        LSLS     R4,R2,#+14       ;; ZeroExtS R4,R2,#+14,#+14
        LSRS     R4,R4,#+14
        SXTB     R1,R1            ;; SignExt  R1,R1,#+24,#+24
        ADDS     R5,R3,R1, LSL #+4
        STR      R4,[R5, #+132]
//  274         CAN_CS_REG(canptr, nMB) = CAN_CS_IDE_MASK;
        MOVS     R4,#+2097152
        SXTB     R1,R1            ;; SignExt  R1,R1,#+24,#+24
        ADDS     R5,R3,R1, LSL #+4
        STR      R4,[R5, #+128]
//  275 
//  276         CAN_CS_REG(canptr, nMB) = (0
//  277                                    | CAN_CS_IDE_MASK
//  278                                    | (id.RTR << CAN_CS_IDE_SHIFT)
//  279                                    | CAN_CS_CODE(CAN_CS_CODE_RX_EMPTY)//激活接收缓冲区
//  280                                   );
        MOVS     R4,#+69206016
        SXTB     R1,R1            ;; SignExt  R1,R1,#+24,#+24
        ADDS     R5,R3,R1, LSL #+4
        STR      R4,[R5, #+128]
        B.N      ??can_rxbuff_enble_1
//  281     }
//  282     else
//  283     {
//  284         //标准帧
//  285         CAN_ID_REG(canptr, nMB) =   ( 0
//  286                                       | CAN_ID_STD( id.ID)
//  287                                     );
??can_rxbuff_enble_0:
        LDR.N    R4,??DataTable11_7  ;; 0x1ffc0000
        ANDS     R4,R4,R2, LSL #+18
        SXTB     R1,R1            ;; SignExt  R1,R1,#+24,#+24
        ADDS     R5,R3,R1, LSL #+4
        STR      R4,[R5, #+132]
//  288 
//  289         CAN_CS_REG(canptr, nMB) = (0
//  290                                    | (id.RTR << CAN_CS_IDE_SHIFT)
//  291                                    | CAN_CS_CODE(CAN_CS_CODE_RX_EMPTY)//激活接收缓冲区
//  292                                   );
        UBFX     R4,R2,#+30,#+1
        LSLS     R4,R4,#+21
        ORRS     R4,R4,#0x4000000
        SXTB     R1,R1            ;; SignExt  R1,R1,#+24,#+24
        ADDS     R5,R3,R1, LSL #+4
        STR      R4,[R5, #+128]
//  293 
//  294     }
//  295 }
??can_rxbuff_enble_1:
        POP      {R4,R5}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock4
//  296 
//  297 /*!
//  298  *  @brief      CAN 接收掩码配置
//  299  *  @param      CANn_e          CAN 模块号
//  300  *  @param      mb_num_e        缓冲区编号
//  301  *  @param      mask            掩码
//  302  *  @param      isIRMQ          是否选择独立掩码（0为全局掩码，其他为独立掩码）
//  303  *  @since      v5.0
//  304  *  Sample usage:      can_rxbuff_mask(CAN1,CAN_RX_MB,0x00FF,1);
//  305  *                              //CAN1 的CAN_RX_MB 缓冲区 配置掩码为 0x00FF
//  306  */
//  307 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function can_rxbuff_mask
          CFI NoCalls
        THUMB
//  308 void can_rxbuff_mask(CANn_e cann, mb_num_e nMB, uint32 mask,uint8 isIRMQ)
//  309 {
can_rxbuff_mask:
        PUSH     {R4-R6}
          CFI R6 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
//  310     uint8           bFreezeMode;
//  311     CAN_MemMapPtr   canptr = CANN[cann];
        LDR.N    R5,??DataTable11_2
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        LDR      R5,[R5, R0, LSL #+2]
//  312 
//  313     //进入冻结模式
//  314     if(!(CAN_MCR_REG(canptr) & CAN_MCR_HALT_MASK))
        LDR      R6,[R5, #+0]
        LSLS     R6,R6,#+3
        BMI.N    ??can_rxbuff_mask_0
//  315     {
//  316         CAN_MCR_REG(canptr)  |= (CAN_MCR_HALT_MASK);
        LDR      R6,[R5, #+0]
        ORRS     R6,R6,#0x10000000
        STR      R6,[R5, #+0]
//  317 
//  318         // 等待进入 进入冻结模式
//  319         while(!(CAN_MCR_REG(canptr) & CAN_MCR_FRZACK_MASK));
??can_rxbuff_mask_1:
        LDR      R6,[R5, #+0]
        LSLS     R6,R6,#+7
        BPL.N    ??can_rxbuff_mask_1
//  320 
//  321         bFreezeMode = 0;
        MOVS     R6,#+0
        MOVS     R4,R6
        B.N      ??can_rxbuff_mask_2
//  322     }
//  323     else
//  324     {
//  325         bFreezeMode = 1;
??can_rxbuff_mask_0:
        MOVS     R6,#+1
        MOVS     R4,R6
//  326     }
//  327 
//  328     if(isIRMQ != 0)       //使用独立掩码
??can_rxbuff_mask_2:
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R3,#+0
        BEQ.N    ??can_rxbuff_mask_3
//  329     {
//  330         CAN_MCR_REG(canptr) |=  CAN_MCR_IRMQ_MASK;
        LDR      R6,[R5, #+0]
        ORRS     R6,R6,#0x10000
        STR      R6,[R5, #+0]
//  331 
//  332         // 独立掩码
//  333         CAN_RXIMR_REG(canptr, nMB) = mask;
        SXTB     R1,R1            ;; SignExt  R1,R1,#+24,#+24
        ADDS     R6,R5,R1, LSL #+2
        STR      R2,[R6, #+2176]
        B.N      ??can_rxbuff_mask_4
//  334     }
//  335     else
//  336     {
//  337         CAN_MCR_REG(canptr) &=  ~CAN_MCR_IRMQ_MASK;
??can_rxbuff_mask_3:
        LDR      R6,[R5, #+0]
        BICS     R6,R6,#0x10000
        STR      R6,[R5, #+0]
//  338 
//  339         // 14/15 是使用独立的
//  340         if(nMB == MB_NUM_14)
        SXTB     R1,R1            ;; SignExt  R1,R1,#+24,#+24
        CMP      R1,#+14
        BNE.N    ??can_rxbuff_mask_5
//  341         {
//  342             CAN_RX14MASK_REG(canptr)  = mask;
        STR      R2,[R5, #+20]
        B.N      ??can_rxbuff_mask_4
//  343         }
//  344         else if (nMB == MB_NUM_15)
??can_rxbuff_mask_5:
        SXTB     R1,R1            ;; SignExt  R1,R1,#+24,#+24
        CMP      R1,#+15
        BNE.N    ??can_rxbuff_mask_6
//  345         {
//  346             CAN_RX15MASK_REG(canptr)  = mask;
        STR      R2,[R5, #+24]
        B.N      ??can_rxbuff_mask_4
//  347         }
//  348         else
//  349         {
//  350             // 剩余的支持全局掩码
//  351             CAN_RXMGMASK_REG(canptr)  = mask;
??can_rxbuff_mask_6:
        STR      R2,[R5, #+16]
//  352         }
//  353     }
//  354     // 恢复CAN 操作模式
//  355     if(!bFreezeMode)
??can_rxbuff_mask_4:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??can_rxbuff_mask_7
//  356     {
//  357         // De-assert Freeze Mode
//  358         CAN_MCR_REG(canptr)  &= ~ (CAN_MCR_HALT_MASK);
        LDR      R6,[R5, #+0]
        BICS     R6,R6,#0x10000000
        STR      R6,[R5, #+0]
//  359 
//  360         // Wait till exit of freeze mode
//  361         while( CAN_MCR_REG(canptr)  & CAN_MCR_FRZACK_MASK);
??can_rxbuff_mask_8:
        LDR      R6,[R5, #+0]
        LSLS     R6,R6,#+7
        BMI.N    ??can_rxbuff_mask_8
//  362 
//  363         // Wait till ready
//  364         while( CAN_MCR_REG(canptr) & CAN_MCR_NOTRDY_MASK);
??can_rxbuff_mask_9:
        LDR      R6,[R5, #+0]
        LSLS     R6,R6,#+4
        BMI.N    ??can_rxbuff_mask_9
//  365     }
//  366 }
??can_rxbuff_mask_7:
        POP      {R4-R6}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI R6 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock5
//  367 
//  368 /*!
//  369  *  @brief      CAN 接收数据
//  370  *  @param      CANn_e          CAN 模块号
//  371  *  @param      mb_num_e        缓冲区编号
//  372  *  @param      CAN_USR_ID_t    ID编号
//  373  *  @param      len             数据长度
//  374  *  @param      buff            缓冲区地址
//  375  *  @since      v5.0
//  376  *  Sample usage:       can_rx(CAN1,CAN_RX_MB,&can_rx_id,&can_rx_len,can_rx_data);  //CAN 从 CAN_RX_MB 接收数据 ，接收到的 ID 保存在 can_rx_id 里，长度保存在 can_rx_len，数据保存在 can_rx_data
//  377  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function can_rx
          CFI NoCalls
        THUMB
//  378 void can_rx(CANn_e cann, mb_num_e nMB, CAN_USR_ID_t *id, uint8 *len, void   *buff)
//  379 {
can_rx:
        PUSH     {R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+20
        LDR      R4,[SP, #+20]
//  380     uint8  length;
//  381     uint32 word;
//  382 
//  383     CAN_MemMapPtr canptr = CANN[cann];
        LDR.N    R7,??DataTable11_2
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        LDR      R7,[R7, R0, LSL #+2]
//  384 
//  385     *(uint32 *)id = 0;
        MOVS     R12,#+0
        STR      R12,[R2, #+0]
//  386 
//  387     if((CAN_CS_REG(canptr, nMB)  & CAN_CS_CODE_MASK) != CAN_CS_CODE(CAN_CS_CODE_RX_FULL) ) //缓冲区没有接收到数据，返回错误
        SXTB     R1,R1            ;; SignExt  R1,R1,#+24,#+24
        ADDS     R12,R7,R1, LSL #+4
        LDR      R12,[R12, #+128]
        ANDS     R12,R12,#0xF000000
        CMP      R12,#+33554432
        BEQ.N    ??can_rx_0
//  388     {
//  389         *len = 0;
        MOVS     R12,#+0
        STRB     R12,[R3, #+0]
//  390         return;
        B.N      ??can_rx_1
//  391     }
//  392 
//  393     length = ( CAN_CS_REG(canptr, nMB) & CAN_CS_DLC_MASK ) >> CAN_CS_DLC_SHIFT;
??can_rx_0:
        SXTB     R1,R1            ;; SignExt  R1,R1,#+24,#+24
        ADDS     R12,R7,R1, LSL #+4
        LDR      R12,[R12, #+128]
        LSRS     R12,R12,#+16
        ANDS     R12,R12,#0xF
        MOV      R5,R12
//  394 
//  395     if(length < 1) //接收到的数据长度小于1，返回错误
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??can_rx_2
//  396     {
//  397         *len = 0;
        MOVS     R12,#+0
        STRB     R12,[R3, #+0]
//  398         return;
        B.N      ??can_rx_1
//  399     }
//  400 
//  401     //判断是标准帧还是扩展帧
//  402     if(! ( CAN_CS_REG(canptr, nMB) & CAN_CS_IDE_MASK ) )
??can_rx_2:
        SXTB     R1,R1            ;; SignExt  R1,R1,#+24,#+24
        ADDS     R12,R7,R1, LSL #+4
        LDR      R12,[R12, #+128]
        LSLS     R12,R12,#+10
        BMI.N    ??can_rx_3
//  403     {
//  404         id->ID = ( CAN_ID_REG(canptr, nMB) & CAN_ID_STD_MASK ) >> CAN_ID_STD_SHIFT; // 获得标准ID
        SXTB     R1,R1            ;; SignExt  R1,R1,#+24,#+24
        ADDS     R12,R7,R1, LSL #+4
        LDR      R12,[R12, #+132]
        UBFX     R12,R12,#+18,#+11
        LDR      LR,[R2, #+0]
        BFI      LR,R12,#+0,#+29
        STR      LR,[R2, #+0]
        B.N      ??can_rx_4
//  405     }
//  406     else
//  407     {
//  408         id->ID = ( CAN_ID_REG(canptr, nMB) & CAN_ID_EXT_MASK ) >> CAN_ID_EXT_SHIFT; // 获取 扩展ID
??can_rx_3:
        SXTB     R1,R1            ;; SignExt  R1,R1,#+24,#+24
        ADDS     R12,R7,R1, LSL #+4
        LDR      R12,[R12, #+132]
        LSLS     R12,R12,#+14     ;; ZeroExtS R12,R12,#+14,#+14
        LSRS     R12,R12,#+14
        LDR      LR,[R2, #+0]
        BFI      LR,R12,#+0,#+29
        STR      LR,[R2, #+0]
//  409         id->IDE = 1 ; //标记扩展的ID
        LDR      R12,[R2, #+0]
        ORRS     R12,R12,#0x20000000
        STR      R12,[R2, #+0]
//  410     }
//  411 
//  412     if(CAN_CS_REG(canptr, nMB) & CAN_CS_RTR_MASK)
??can_rx_4:
        SXTB     R1,R1            ;; SignExt  R1,R1,#+24,#+24
        ADDS     R12,R7,R1, LSL #+4
        LDR      R12,[R12, #+128]
        LSLS     R12,R12,#+11
        BPL.N    ??can_rx_5
//  413     {
//  414         id->RTR = 1; //标记为远程帧类型
        LDR      R12,[R2, #+0]
        ORRS     R12,R12,#0x40000000
        STR      R12,[R2, #+0]
//  415     }
//  416 
//  417     word = CAN_WORD0_REG(canptr, nMB);
??can_rx_5:
        SXTB     R1,R1            ;; SignExt  R1,R1,#+24,#+24
        ADDS     R12,R7,R1, LSL #+4
        LDR      R12,[R12, #+136]
        MOV      R6,R12
//  418     *((uint32 *)buff) = SWAP32(word);
        REV      R12,R6
        STR      R12,[R4, #+0]
//  419 
//  420     word = CAN_WORD1_REG(canptr, nMB);
        SXTB     R1,R1            ;; SignExt  R1,R1,#+24,#+24
        ADDS     R12,R7,R1, LSL #+4
        LDR      R12,[R12, #+140]
        MOV      R6,R12
//  421     *((uint32 *)buff + 1) = SWAP32(word);
        REV      R12,R6
        STR      R12,[R4, #+4]
//  422 
//  423     *len = length;
        STRB     R5,[R3, #+0]
//  424 
//  425     CAN_TIMER_REG(canptr);      //解锁 MB
        LDR      R12,[R7, #+8]
//  426 }
??can_rx_1:
        POP      {R4-R7,PC}       ;; return
          CFI EndBlock cfiBlock6
//  427 
//  428 /*!
//  429  *  @brief      使能 CAN 缓冲区接收和发送中断
//  430  *  @param      CANn_e          CAN 模块号
//  431  *  @param      mb_num_e        缓冲区编号
//  432  *  @since      v5.0
//  433  *  Sample usage:       can_irq_en(CAN1,MB_NUM_5);
//  434  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function can_irq_en
        THUMB
//  435 void can_irq_en(CANn_e cann, mb_num_e nMB)
//  436 {
can_irq_en:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
//  437     CAN_MemMapPtr canptr = CANN[cann];
        LDR.N    R0,??DataTable11_2
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R6,[R0, R4, LSL #+2]
//  438 
//  439 
//  440     CAN_IMASK1_REG(canptr) = (1 << nMB);
        MOVS     R0,#+1
        LSLS     R0,R0,R5
        STR      R0,[R6, #+40]
//  441 
//  442     if(cann == CAN0)
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??can_irq_en_0
//  443     {
//  444         enable_irq(CAN0_ORed_MB_IRQn);
        MOVS     R0,#+29
          CFI FunCall NVIC_EnableIRQ
        BL       NVIC_EnableIRQ
        B.N      ??can_irq_en_1
//  445     }
//  446     else if(cann == CAN1)
??can_irq_en_0:
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+1
        BNE.N    ??can_irq_en_1
//  447     {
//  448         enable_irq(CAN1_ORed_MB_IRQn);
        MOVS     R0,#+37
          CFI FunCall NVIC_EnableIRQ
        BL       NVIC_EnableIRQ
//  449     }
//  450 }
??can_irq_en_1:
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock7
//  451 
//  452 /*!
//  453  *  @brief      禁止 CAN 缓冲区接收和发送中断
//  454  *  @param      CANn_e          CAN 模块号
//  455  *  @param      mb_num_e        缓冲区编号
//  456  *  @since      v5.0
//  457  *  Sample usage:       can_irq_dis(CAN1,MB_NUM_5);
//  458  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function can_irq_dis
        THUMB
//  459 void can_irq_dis(CANn_e cann, mb_num_e nMB)
//  460 {
can_irq_dis:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
//  461     CAN_MemMapPtr canptr = CANN[cann];
        LDR.N    R0,??DataTable11_2
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R6,[R0, R4, LSL #+2]
//  462 
//  463     CAN_IMASK1_REG(canptr) &= ~ (1 << nMB);
        LDR      R0,[R6, #+40]
        MOVS     R1,#+1
        LSLS     R1,R1,R5
        BICS     R0,R0,R1
        STR      R0,[R6, #+40]
//  464 
//  465     if(cann == CAN0)
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??can_irq_dis_0
//  466     {
//  467         disable_irq(CAN0_ORed_MB_IRQn);
        MOVS     R0,#+29
          CFI FunCall NVIC_DisableIRQ
        BL       NVIC_DisableIRQ
        B.N      ??can_irq_dis_1
//  468     }
//  469     else if(cann == CAN1)
??can_irq_dis_0:
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+1
        BNE.N    ??can_irq_dis_1
//  470     {
//  471         disable_irq(CAN1_ORed_MB_IRQn);
        MOVS     R0,#+37
          CFI FunCall NVIC_DisableIRQ
        BL       NVIC_DisableIRQ
//  472     }
//  473 }
??can_irq_dis_1:
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock8
//  474 
//  475 /*!
//  476  *  @brief      清 CAN 缓冲区中断标志
//  477  *  @param      CANn_e          CAN 模块号
//  478  *  @param      mb_num_e        缓冲区编号
//  479  *  @since      v5.0
//  480  *  Sample usage:       can_clear_flag(CAN1,MB_NUM_5);
//  481  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function can_clear_flag
          CFI NoCalls
        THUMB
//  482 void can_clear_flag(CANn_e cann, mb_num_e nMB)
//  483 {
//  484     CAN_MemMapPtr canptr = CANN[cann];
can_clear_flag:
        LDR.N    R2,??DataTable11_2
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        LDR      R2,[R2, R0, LSL #+2]
//  485 
//  486     CAN_IFLAG1_REG(canptr) = (1 << nMB);
        MOVS     R3,#+1
        LSLS     R3,R3,R1
        STR      R3,[R2, #+48]
//  487 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock9
//  488 
//  489 
//  490 /*!
//  491  *  @brief      获得 CAN 缓冲区中断标志
//  492  *  @param      CANn_e          CAN 模块号
//  493  *  @param      mb_num_e        缓冲区编号
//  494  *  @since      v5.0
//  495  *  Sample usage:       can_get_flag(CAN1,MB_NUM_5);
//  496  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function can_get_flag
          CFI NoCalls
        THUMB
//  497 uint32 can_get_flag(CANn_e cann, mb_num_e nMB)
//  498 {
can_get_flag:
        MOVS     R2,R0
//  499     CAN_MemMapPtr canptr = CANN[cann];
        LDR.N    R0,??DataTable11_2
        SXTB     R2,R2            ;; SignExt  R2,R2,#+24,#+24
        LDR      R0,[R0, R2, LSL #+2]
//  500 
//  501     return (CAN_IFLAG1_REG(canptr) & (1 << nMB));
        LDR      R0,[R0, #+48]
        MOVS     R3,#+1
        LSLS     R1,R3,R1
        ANDS     R0,R1,R0
        BX       LR               ;; return
          CFI EndBlock cfiBlock10
//  502 }
//  503 
//  504 
//  505 /*!
//  506  *  @brief      设置 CAN 的波特率
//  507  *  @param      CANn_e          CAN 模块号
//  508  *  @param      CAN_BAUD_e      波特率编号
//  509  *  @since      v5.0
//  510  *  Sample usage:       can_setband(CAN1, CAN_BAUD_20K)
//  511  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function can_setband
        THUMB
//  512 void can_setband(CANn_e cann, CAN_BAUD_e band)
//  513 {
can_setband:
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
//  514     CAN_MemMapPtr canptr = CANN[cann];
        LDR.N    R0,??DataTable11_2
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R6,[R0, R4, LSL #+2]
//  515     CAN_band_cfg_t *pcan_ban_cfg;
//  516     uint32  can_clk_khz;
//  517     uint8   bFreezeMode;
//  518 
//  519     if(CAN_CTRL1_REG(canptr) & CAN_CTRL1_CLKSRC_MASK)     //bus时钟
        LDR      R0,[R6, #+4]
        LSLS     R0,R0,#+18
        BPL.N    ??can_setband_0
//  520     {
//  521         can_clk_khz =  bus_clk_khz;
        LDR.N    R0,??DataTable11_8
        LDR      R0,[R0, #+0]
        MOV      R8,R0
        B.N      ??can_setband_1
//  522     }
//  523     else                                                //外部晶振时钟
//  524     {
//  525         can_clk_khz = EXTAL_IN_MHz *1000;
??can_setband_0:
        MOVW     R0,#+50000
        MOV      R8,R0
//  526     }
//  527 
//  528     if(can_clk_khz == 50000)
??can_setband_1:
        MOVW     R0,#+50000
        CMP      R8,R0
        BNE.N    ??can_setband_2
//  529     {
//  530          pcan_ban_cfg = &can_band_cfg_50000K[band];
        LDR.N    R0,??DataTable11_9
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        MOVS     R1,#+12
        SMLABB   R0,R5,R1,R0
        MOVS     R7,R0
        B.N      ??can_setband_3
//  531     }
//  532     else if(bus_clk_khz == 60000)
??can_setband_2:
        LDR.N    R0,??DataTable11_8
        LDR      R0,[R0, #+0]
        MOVW     R1,#+60000
        CMP      R0,R1
        BNE.N    ??can_setband_4
//  533     {
//  534          pcan_ban_cfg = &can_band_cfg_60000K[band];
        LDR.N    R0,??DataTable11_10
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        MOVS     R1,#+12
        SMLABB   R0,R5,R1,R0
        MOVS     R7,R0
        B.N      ??can_setband_3
//  535     }
//  536     else
//  537     {
//  538         ASSERT(0);          //仅支持 bus 时钟为 50M 或 60M
??can_setband_4:
        MOVW     R1,#+538
        LDR.N    R0,??DataTable11_5
          CFI FunCall assert_failed
        BL       assert_failed
//  539     }
//  540 
//  541     //进入冻结模式
//  542     if(!(CAN_MCR_REG(canptr) & CAN_MCR_HALT_MASK))
??can_setband_3:
        LDR      R0,[R6, #+0]
        LSLS     R0,R0,#+3
        BMI.N    ??can_setband_5
//  543     {
//  544         CAN_MCR_REG(canptr)  |= (CAN_MCR_HALT_MASK);
        LDR      R0,[R6, #+0]
        ORRS     R0,R0,#0x10000000
        STR      R0,[R6, #+0]
//  545 
//  546         // 等待进入 进入冻结模式
//  547         while(!(CAN_MCR_REG(canptr) & CAN_MCR_FRZACK_MASK));
??can_setband_6:
        LDR      R0,[R6, #+0]
        LSLS     R0,R0,#+7
        BPL.N    ??can_setband_6
//  548 
//  549         bFreezeMode = 0;
        MOVS     R0,#+0
        MOV      R9,R0
        B.N      ??can_setband_7
//  550     }
//  551     else
//  552     {
//  553         bFreezeMode = 1;
??can_setband_5:
        MOVS     R0,#+1
        MOV      R9,R0
//  554     }
//  555 
//  556     //清空需要配置的位
//  557     CAN_CTRL1_REG(canptr) &= ~(0
//  558                                | CAN_CTRL1_PROPSEG_MASK
//  559                                | CAN_CTRL1_RJW_MASK
//  560                                | CAN_CTRL1_PSEG1_MASK
//  561                                | CAN_CTRL1_PSEG2_MASK
//  562                                | CAN_CTRL1_PRESDIV_MASK
//  563                                );
??can_setband_7:
        LDR      R0,[R6, #+4]
        MOVW     R1,#+65528
        ANDS     R0,R1,R0
        STR      R0,[R6, #+4]
//  564     //设置波特率
//  565     CAN_CTRL1_REG(canptr) |= (0
//  566                              | CAN_CTRL1_PROPSEG(pcan_ban_cfg->prop_seg)
//  567                              | CAN_CTRL1_RJW(pcan_ban_cfg->rjw)
//  568                              | CAN_CTRL1_PSEG1(pcan_ban_cfg->pseg1)
//  569                              | CAN_CTRL1_PSEG2(pcan_ban_cfg->pseg2)
//  570                              | CAN_CTRL1_PRESDIV(pcan_ban_cfg->presdiv)
//  571                             );
        LDR      R0,[R6, #+4]
        LDRB     R1,[R7, #+6]
        ANDS     R1,R1,#0x7
        LDRB     R2,[R7, #+9]
        LSLS     R2,R2,#+22
        ANDS     R2,R2,#0xC00000
        ORRS     R1,R2,R1
        LDRB     R2,[R7, #+7]
        LSLS     R2,R2,#+19
        ANDS     R2,R2,#0x380000
        ORRS     R1,R2,R1
        LDRB     R2,[R7, #+8]
        LSLS     R2,R2,#+16
        ANDS     R2,R2,#0x70000
        ORRS     R1,R2,R1
        LDRH     R2,[R7, #+4]
        ORRS     R1,R1,R2, LSL #+24
        ORRS     R0,R1,R0
        STR      R0,[R6, #+4]
//  572 
//  573     // 恢复CAN 操作模式
//  574     if(!bFreezeMode)
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        CMP      R9,#+0
        BNE.N    ??can_setband_8
//  575     {
//  576         // De-assert Freeze Mode
//  577         CAN_MCR_REG(canptr)  &= ~ (CAN_MCR_HALT_MASK);
        LDR      R0,[R6, #+0]
        BICS     R0,R0,#0x10000000
        STR      R0,[R6, #+0]
//  578 
//  579         // Wait till exit of freeze mode
//  580         while( CAN_MCR_REG(canptr)  & CAN_MCR_FRZACK_MASK);
??can_setband_9:
        LDR      R0,[R6, #+0]
        LSLS     R0,R0,#+7
        BMI.N    ??can_setband_9
//  581 
//  582         // Wait till ready
//  583         while( CAN_MCR_REG(canptr) & CAN_MCR_NOTRDY_MASK);
??can_setband_10:
        LDR      R0,[R6, #+0]
        LSLS     R0,R0,#+4
        BMI.N    ??can_setband_10
//  584     }
//  585 }
??can_setband_8:
        POP      {R0,R4-R9,PC}    ;; return
          CFI EndBlock cfiBlock11

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11:
        DC32     0xe000e100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_1:
        DC32     0xe000e180

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_2:
        DC32     CANN

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_3:
        DC32     0x4004803c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_4:
        DC32     0x40048030

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_5:
        DC32     ?_0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_6:
        DC32     0x40065000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_7:
        DC32     0x1ffc0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_8:
        DC32     bus_clk_khz

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_9:
        DC32     can_band_cfg_50000K

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_10:
        DC32     can_band_cfg_60000K

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
        DC8 63H, 5CH, 4DH, 4BH, 36H, 30H, 5FH, 63H
        DC8 61H, 6EH, 2EH, 63H, 0
        DC8 0, 0, 0

        END
//  586 
//  587 
//  588 
//  589 
//  590 
//  591 
//  592 
//  593 
//  594 
// 
//   200 bytes in section .data
//    56 bytes in section .rodata
// 1 586 bytes in section .text
// 
// 1 586 bytes of CODE  memory
//    56 bytes of CONST memory
//   200 bytes of DATA  memory
//
//Errors: none
//Warnings: none
