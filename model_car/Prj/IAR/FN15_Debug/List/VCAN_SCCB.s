///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       21/Mar/2017  16:05:50
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\znc\project\K60FN\network_car\Board\src\VCAN_SCCB.c
//    Command line =  
//        E:\znc\project\K60FN\network_car\Board\src\VCAN_SCCB.c -D DEBUG -D
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
//        E:\znc\project\K60FN\network_car\Prj\IAR\FN15_Debug\List\VCAN_SCCB.s
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
        EXTERN port_init_NoALT

        PUBLIC SCCB_GPIO_init
        PUBLIC SCCB_ReadByte
        PUBLIC SCCB_WriteByte
        
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
        
// E:\znc\project\K60FN\network_car\Board\src\VCAN_SCCB.c
//    1 /*!
//    2  *     COPYRIGHT NOTICE
//    3  *     Copyright (c) 2013,山外科技
//    4  *     All rights reserved.
//    5  *     技术讨论：山外论坛 http://www.vcan123.com
//    6  *
//    7  *     除注明出处外，以下所有内容版权均属山外科技所有，未经允许，不得用于商业用途，
//    8  *     修改内容时必须保留山外科技的版权声明。
//    9  *
//   10  * @file       VCAN_SCCB.c
//   11  * @brief      OV摄像头配置总线SCCB函数库
//   12  * @author     山外科技
//   13  * @version    v5.0
//   14  * @date       2013-09-01
//   15  */
//   16 
//   17 
//   18 #include "common.h"
//   19 #include "MK60_gpio.h"
//   20 #include "VCAN_SCCB.h"
//   21 
//   22 static void SCCB_delay(uint16 i);
//   23 
//   24 /*!
//   25  *  @brief      SCCB延迟函数
//   26  *  @param      time    延时时间
//   27  *  @since      v5.0
//   28  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function SCCB_delay
          CFI NoCalls
        THUMB
//   29 static void SCCB_delay(volatile uint16 time)
//   30 {
SCCB_delay:
        PUSH     {R0}
          CFI CFA R13+4
//   31     while(time)
??SCCB_delay_0:
        LDRH     R0,[SP, #+0]
        CMP      R0,#+0
        BEQ.N    ??SCCB_delay_1
//   32     {
//   33         time--;
        LDRH     R0,[SP, #+0]
        SUBS     R0,R0,#+1
        STRH     R0,[SP, #+0]
        B.N      ??SCCB_delay_0
//   34     }
//   35 }
??SCCB_delay_1:
        ADD      SP,SP,#+4
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
//   36 
//   37 /*!
//   38  *  @brief      SCCB管脚配置
//   39  *  @since      v5.0
//   40  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function SCCB_GPIO_init
        THUMB
//   41 void SCCB_GPIO_init(void)
//   42 {
SCCB_GPIO_init:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   43     gpio_init  (SCCB_SCL, GPO, 1); //初始化SCL
        MOVS     R2,#+1
        MOVS     R1,#+1
        MOVS     R0,#+26
          CFI FunCall gpio_init
        BL       gpio_init
//   44     gpio_init  (SCCB_SDA, GPO, 1); //初始化SDA
        MOVS     R2,#+1
        MOVS     R1,#+1
        MOVS     R0,#+25
          CFI FunCall gpio_init
        BL       gpio_init
//   45 
//   46     port_init_NoALT(SCCB_SCL,ODO | PULLUP);
        MOVS     R1,#+35
        MOVS     R0,#+26
          CFI FunCall port_init_NoALT
        BL       port_init_NoALT
//   47     port_init_NoALT(SCCB_SDA,ODO | PULLUP);
        MOVS     R1,#+35
        MOVS     R0,#+25
          CFI FunCall port_init_NoALT
        BL       port_init_NoALT
//   48 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock1
//   49 
//   50 /*!
//   51  *  @brief      SCCB起始信号
//   52  *  @since      v5.0
//   53  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function SCCB_Start
        THUMB
//   54 static uint8 SCCB_Start(void)
//   55 {
SCCB_Start:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   56     SDA_H();
        MOVS     R0,#+1
        LDR.N    R1,??DataTable6  ;; 0x43fe0064
        STR      R0,[R1, #+0]
//   57     SCL_H();
        MOVS     R0,#+1
        LDR.N    R1,??DataTable6_1  ;; 0x43fe0068
        STR      R0,[R1, #+0]
//   58     SCCB_DELAY();
        MOV      R0,#+400
          CFI FunCall SCCB_delay
        BL       SCCB_delay
//   59 
//   60     SDA_DDR_IN();
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_2  ;; 0x43fe02e4
        STR      R0,[R1, #+0]
//   61     if(!SDA_IN())
        LDR.N    R0,??DataTable6_3  ;; 0x43fe0264
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??SCCB_Start_0
//   62     {
//   63         SDA_DDR_OUT();
        MOVS     R0,#+1
        LDR.N    R1,??DataTable6_2  ;; 0x43fe02e4
        STR      R0,[R1, #+0]
//   64         return 0;   /* SDA线为低电平则总线忙,退出 */
        MOVS     R0,#+0
        B.N      ??SCCB_Start_1
//   65     }
//   66     SDA_DDR_OUT();
??SCCB_Start_0:
        MOVS     R0,#+1
        LDR.N    R1,??DataTable6_2  ;; 0x43fe02e4
        STR      R0,[R1, #+0]
//   67     SDA_L();
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6  ;; 0x43fe0064
        STR      R0,[R1, #+0]
//   68 
//   69     SCCB_DELAY();
        MOV      R0,#+400
          CFI FunCall SCCB_delay
        BL       SCCB_delay
//   70     SCL_L();
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_1  ;; 0x43fe0068
        STR      R0,[R1, #+0]
//   71 
//   72     if(SDA_IN())
        LDR.N    R0,??DataTable6_3  ;; 0x43fe0264
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??SCCB_Start_2
//   73     {
//   74         SDA_DDR_OUT();
        MOVS     R0,#+1
        LDR.N    R1,??DataTable6_2  ;; 0x43fe02e4
        STR      R0,[R1, #+0]
//   75         return 0;   /* SDA线为高电平则总线出错,退出 */
        MOVS     R0,#+0
        B.N      ??SCCB_Start_1
//   76     }
//   77     //SDA_DDR_OUT();
//   78     //SDA_L();
//   79     //SCCB_delay();
//   80     return 1;
??SCCB_Start_2:
        MOVS     R0,#+1
??SCCB_Start_1:
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock2
//   81 }
//   82 
//   83 /*!
//   84  *  @brief      SCCB停止信号
//   85  *  @since      v5.0
//   86  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function SCCB_Stop
        THUMB
//   87 static void SCCB_Stop(void)
//   88 {
SCCB_Stop:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   89     SCL_L();
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_1  ;; 0x43fe0068
        STR      R0,[R1, #+0]
//   90     //SCCB_DELAY();
//   91     SDA_L();
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6  ;; 0x43fe0064
        STR      R0,[R1, #+0]
//   92     SCCB_DELAY();
        MOV      R0,#+400
          CFI FunCall SCCB_delay
        BL       SCCB_delay
//   93     SCL_H();
        MOVS     R0,#+1
        LDR.N    R1,??DataTable6_1  ;; 0x43fe0068
        STR      R0,[R1, #+0]
//   94     SCCB_DELAY();
        MOV      R0,#+400
          CFI FunCall SCCB_delay
        BL       SCCB_delay
//   95     SDA_H();
        MOVS     R0,#+1
        LDR.N    R1,??DataTable6  ;; 0x43fe0064
        STR      R0,[R1, #+0]
//   96     SCCB_DELAY();
        MOV      R0,#+400
          CFI FunCall SCCB_delay
        BL       SCCB_delay
//   97 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock3
//   98 
//   99 /*!
//  100  *  @brief      SCCB应答信号
//  101  *  @since      v5.0
//  102  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function SCCB_Ack
        THUMB
//  103 static void SCCB_Ack(void)
//  104 {
SCCB_Ack:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  105     SCL_L();
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_1  ;; 0x43fe0068
        STR      R0,[R1, #+0]
//  106     SCCB_DELAY();
        MOV      R0,#+400
          CFI FunCall SCCB_delay
        BL       SCCB_delay
//  107     SDA_L();
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6  ;; 0x43fe0064
        STR      R0,[R1, #+0]
//  108     SCCB_DELAY();
        MOV      R0,#+400
          CFI FunCall SCCB_delay
        BL       SCCB_delay
//  109     SCL_H();
        MOVS     R0,#+1
        LDR.N    R1,??DataTable6_1  ;; 0x43fe0068
        STR      R0,[R1, #+0]
//  110     SCCB_DELAY();
        MOV      R0,#+400
          CFI FunCall SCCB_delay
        BL       SCCB_delay
//  111     SCL_L();
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_1  ;; 0x43fe0068
        STR      R0,[R1, #+0]
//  112     SCCB_DELAY();
        MOV      R0,#+400
          CFI FunCall SCCB_delay
        BL       SCCB_delay
//  113 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock4
//  114 
//  115 /*!
//  116  *  @brief      SCCB无应答信号
//  117  *  @since      v5.0
//  118  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function SCCB_NoAck
        THUMB
//  119 static void SCCB_NoAck(void)
//  120 {
SCCB_NoAck:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  121     SCL_L();
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_1  ;; 0x43fe0068
        STR      R0,[R1, #+0]
//  122     SCCB_DELAY();
        MOV      R0,#+400
          CFI FunCall SCCB_delay
        BL       SCCB_delay
//  123     SDA_H();
        MOVS     R0,#+1
        LDR.N    R1,??DataTable6  ;; 0x43fe0064
        STR      R0,[R1, #+0]
//  124     SCCB_DELAY();
        MOV      R0,#+400
          CFI FunCall SCCB_delay
        BL       SCCB_delay
//  125     SCL_H();
        MOVS     R0,#+1
        LDR.N    R1,??DataTable6_1  ;; 0x43fe0068
        STR      R0,[R1, #+0]
//  126     SCCB_DELAY();
        MOV      R0,#+400
          CFI FunCall SCCB_delay
        BL       SCCB_delay
//  127     SCL_L();
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_1  ;; 0x43fe0068
        STR      R0,[R1, #+0]
//  128     SCCB_DELAY();
        MOV      R0,#+400
          CFI FunCall SCCB_delay
        BL       SCCB_delay
//  129 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock5
//  130 
//  131 /*!
//  132  *  @brief      SCCB 等待应答
//  133  *  @return     应答结果（0表示无应答，1表示有应答）
//  134  *  @since      v5.0
//  135  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function SCCB_WaitAck
        THUMB
//  136 static int SCCB_WaitAck(void)
//  137 {
SCCB_WaitAck:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  138     SCL_L();
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_1  ;; 0x43fe0068
        STR      R0,[R1, #+0]
//  139     //SDA_H();
//  140     SDA_DDR_IN();
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_2  ;; 0x43fe02e4
        STR      R0,[R1, #+0]
//  141 
//  142     SCCB_DELAY();
        MOV      R0,#+400
          CFI FunCall SCCB_delay
        BL       SCCB_delay
//  143     SCL_H();
        MOVS     R0,#+1
        LDR.N    R1,??DataTable6_1  ;; 0x43fe0068
        STR      R0,[R1, #+0]
//  144 
//  145     SCCB_DELAY();
        MOV      R0,#+400
          CFI FunCall SCCB_delay
        BL       SCCB_delay
//  146 
//  147     if(SDA_IN())           //应答为高电平，异常，通信失败
        LDR.N    R0,??DataTable6_3  ;; 0x43fe0264
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??SCCB_WaitAck_0
//  148     {
//  149         SDA_DDR_OUT();
        MOVS     R0,#+1
        LDR.N    R1,??DataTable6_2  ;; 0x43fe02e4
        STR      R0,[R1, #+0]
//  150         SCL_L();
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_1  ;; 0x43fe0068
        STR      R0,[R1, #+0]
//  151         return 0;
        MOVS     R0,#+0
        B.N      ??SCCB_WaitAck_1
//  152     }
//  153     SDA_DDR_OUT();
??SCCB_WaitAck_0:
        MOVS     R0,#+1
        LDR.N    R1,??DataTable6_2  ;; 0x43fe02e4
        STR      R0,[R1, #+0]
//  154     SCL_L();
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_1  ;; 0x43fe0068
        STR      R0,[R1, #+0]
//  155     return 1;
        MOVS     R0,#+1
??SCCB_WaitAck_1:
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock6
//  156 }
//  157 
//  158 /*!
//  159  *  @brief      SCCB 发送的数据
//  160  *  @param      SendByte    需要发送的数据
//  161  *  @since      v5.0
//  162  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function SCCB_SendByte
        THUMB
//  163 static void SCCB_SendByte(uint8 SendByte)
//  164 {
SCCB_SendByte:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R5,R0
//  165     uint8 i = 8;
        MOVS     R4,#+8
//  166     while(i--)
??SCCB_SendByte_0:
        MOVS     R0,R4
        SUBS     R4,R0,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??SCCB_SendByte_1
//  167     {
//  168 
//  169         if(SendByte & 0x80)     //SDA 输出数据
        LSLS     R0,R5,#+24
        BPL.N    ??SCCB_SendByte_2
//  170         {
//  171             SDA_H();
        MOVS     R0,#+1
        LDR.N    R1,??DataTable6  ;; 0x43fe0064
        STR      R0,[R1, #+0]
        B.N      ??SCCB_SendByte_3
//  172         }
//  173         else
//  174         {
//  175             SDA_L();
??SCCB_SendByte_2:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6  ;; 0x43fe0064
        STR      R0,[R1, #+0]
//  176         }
//  177         SendByte <<= 1;
??SCCB_SendByte_3:
        LSLS     R5,R5,#+1
//  178         SCCB_DELAY();
        MOV      R0,#+400
          CFI FunCall SCCB_delay
        BL       SCCB_delay
//  179         SCL_H();                //SCL 拉高，采集信号
        MOVS     R0,#+1
        LDR.N    R1,??DataTable6_1  ;; 0x43fe0068
        STR      R0,[R1, #+0]
//  180         SCCB_DELAY();
        MOV      R0,#+400
          CFI FunCall SCCB_delay
        BL       SCCB_delay
//  181         SCL_L();                //SCL 时钟线拉低
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_1  ;; 0x43fe0068
        STR      R0,[R1, #+0]
        B.N      ??SCCB_SendByte_0
//  182         //SCCB_DELAY();
//  183     }
//  184     //SCL_L();
//  185 }
??SCCB_SendByte_1:
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock7
//  186 
//  187 /*!
//  188  *  @brief      接收SCCB总线的数据
//  189  *  @return     接收到的数据
//  190  *  @since      v5.0
//  191  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function SCCB_ReceiveByte
        THUMB
//  192 static int SCCB_ReceiveByte(void)
//  193 {
SCCB_ReceiveByte:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
//  194     uint8 i = 8;
        MOVS     R4,#+8
//  195     uint8 ReceiveByte = 0;
        MOVS     R5,#+0
//  196 
//  197     //SDA_H();
//  198     //SCCB_DELAY();
//  199     SDA_DDR_IN();
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_2  ;; 0x43fe02e4
        STR      R0,[R1, #+0]
//  200 
//  201     while(i--)
??SCCB_ReceiveByte_0:
        MOVS     R0,R4
        SUBS     R4,R0,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??SCCB_ReceiveByte_1
//  202     {
//  203         ReceiveByte <<= 1;
        LSLS     R5,R5,#+1
//  204         SCL_L();
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_1  ;; 0x43fe0068
        STR      R0,[R1, #+0]
//  205         SCCB_DELAY();
        MOV      R0,#+400
          CFI FunCall SCCB_delay
        BL       SCCB_delay
//  206         SCL_H();
        MOVS     R0,#+1
        LDR.N    R1,??DataTable6_1  ;; 0x43fe0068
        STR      R0,[R1, #+0]
//  207         SCCB_DELAY();
        MOV      R0,#+400
          CFI FunCall SCCB_delay
        BL       SCCB_delay
//  208 
//  209         if(SDA_IN())
        LDR.N    R0,??DataTable6_3  ;; 0x43fe0264
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??SCCB_ReceiveByte_0
//  210         {
//  211             ReceiveByte |= 0x01;
        ORRS     R5,R5,#0x1
        B.N      ??SCCB_ReceiveByte_0
//  212         }
//  213 
//  214 
//  215     }
//  216     SDA_DDR_OUT();
??SCCB_ReceiveByte_1:
        MOVS     R0,#+1
        LDR.N    R1,??DataTable6_2  ;; 0x43fe02e4
        STR      R0,[R1, #+0]
//  217     SCL_L();
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_1  ;; 0x43fe0068
        STR      R0,[R1, #+0]
//  218     return ReceiveByte;
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,R5
        POP      {R1,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock8
//  219 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     0x43fe0064

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     0x43fe0068

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
        DC32     0x43fe02e4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_3:
        DC32     0x43fe0264
//  220 
//  221 /*****************************************************************************************
//  222 * 函数名：SCCB_WriteByte
//  223 * 描述  ：写一字节数据
//  224 * 输入  ：- WriteAddress: 待写入地址    - SendByte: 待写入数据  - DeviceAddress: 器件类型
//  225 * 输出  ：返回为:=1成功写入,=0失败
//  226 * 注意  ：无
//  227 *****************************************************************************************/
//  228 static int SCCB_WriteByte_one( uint16 WriteAddress , uint8 SendByte );
//  229 
//  230 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function SCCB_WriteByte
        THUMB
//  231 int SCCB_WriteByte( uint16 WriteAddress , uint8 SendByte )            //考虑到用sccb的管脚模拟，比较容易失败，因此多试几次
//  232 {
SCCB_WriteByte:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
//  233     uint8 i = 0;
        MOVS     R6,#+0
//  234     while( 0 == SCCB_WriteByte_one ( WriteAddress, SendByte ) )
??SCCB_WriteByte_0:
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall SCCB_WriteByte_one
        BL       SCCB_WriteByte_one
        CMP      R0,#+0
        BNE.N    ??SCCB_WriteByte_1
//  235     {
//  236         i++;
        ADDS     R6,R6,#+1
//  237         if(i == 20)
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+20
        BNE.N    ??SCCB_WriteByte_0
//  238         {
//  239             return 0 ;
        MOVS     R0,#+0
        B.N      ??SCCB_WriteByte_2
//  240         }
//  241     }
//  242     return 1;
??SCCB_WriteByte_1:
        MOVS     R0,#+1
??SCCB_WriteByte_2:
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock9
//  243 }
//  244 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function SCCB_WriteByte_one
        THUMB
//  245 int SCCB_WriteByte_one( uint16 WriteAddress , uint8 SendByte )
//  246 {
SCCB_WriteByte_one:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
//  247     if(!SCCB_Start())
          CFI FunCall SCCB_Start
        BL       SCCB_Start
        CMP      R0,#+0
        BNE.N    ??SCCB_WriteByte_one_0
//  248     {
//  249         return 0;
        MOVS     R0,#+0
        B.N      ??SCCB_WriteByte_one_1
//  250     }
//  251     SCCB_SendByte( DEV_ADR );                    /* 器件地址 */
??SCCB_WriteByte_one_0:
        MOVS     R0,#+66
          CFI FunCall SCCB_SendByte
        BL       SCCB_SendByte
//  252     if( !SCCB_WaitAck() )
          CFI FunCall SCCB_WaitAck
        BL       SCCB_WaitAck
        CMP      R0,#+0
        BNE.N    ??SCCB_WriteByte_one_2
//  253     {
//  254         SCCB_Stop();
          CFI FunCall SCCB_Stop
        BL       SCCB_Stop
//  255         return 0;
        MOVS     R0,#+0
        B.N      ??SCCB_WriteByte_one_1
//  256     }
//  257     SCCB_SendByte((uint8)(WriteAddress & 0x00FF));   /* 设置低起始地址 */
??SCCB_WriteByte_one_2:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall SCCB_SendByte
        BL       SCCB_SendByte
//  258     SCCB_WaitAck();
          CFI FunCall SCCB_WaitAck
        BL       SCCB_WaitAck
//  259     SCCB_SendByte(SendByte);
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall SCCB_SendByte
        BL       SCCB_SendByte
//  260     SCCB_WaitAck();
          CFI FunCall SCCB_WaitAck
        BL       SCCB_WaitAck
//  261     SCCB_Stop();
          CFI FunCall SCCB_Stop
        BL       SCCB_Stop
//  262     return 1;
        MOVS     R0,#+1
??SCCB_WriteByte_one_1:
        POP      {R1,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock10
//  263 }
//  264 
//  265 
//  266 
//  267 
//  268 /******************************************************************************************************************
//  269  * 函数名：SCCB_ReadByte
//  270  * 描述  ：读取一串数据
//  271  * 输入  ：- pBuffer: 存放读出数据  - length: 待读出长度    - ReadAddress: 待读出地址        - DeviceAddress: 器件类型
//  272  * 输出  ：返回为:=1成功读入,=0失败
//  273  * 注意  ：无
//  274  **********************************************************************************************************************/
//  275 static int SCCB_ReadByte_one(uint8 *pBuffer,   uint16 length,   uint8 ReadAddress);
//  276 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function SCCB_ReadByte
        THUMB
//  277 int SCCB_ReadByte(uint8 *pBuffer,   uint16 length,   uint8 ReadAddress)
//  278 {
SCCB_ReadByte:
        PUSH     {R3-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  279     uint8 i = 0;
        MOVS     R7,#+0
//  280     while( 0 == SCCB_ReadByte_one(pBuffer, length, ReadAddress) )
??SCCB_ReadByte_0:
        MOVS     R2,R6
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,R5
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
          CFI FunCall SCCB_ReadByte_one
        BL       SCCB_ReadByte_one
        CMP      R0,#+0
        BNE.N    ??SCCB_ReadByte_1
//  281     {
//  282         i++;
        ADDS     R7,R7,#+1
//  283         if(i == 30)
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+30
        BNE.N    ??SCCB_ReadByte_0
//  284         {
//  285             return 0 ;
        MOVS     R0,#+0
        B.N      ??SCCB_ReadByte_2
//  286         }
//  287     }
//  288     return 1;
??SCCB_ReadByte_1:
        MOVS     R0,#+1
??SCCB_ReadByte_2:
        POP      {R1,R4-R7,PC}    ;; return
          CFI EndBlock cfiBlock11
//  289 }
//  290 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function SCCB_ReadByte_one
        THUMB
//  291 int SCCB_ReadByte_one(uint8 *pBuffer,   uint16 length,   uint8 ReadAddress)
//  292 {
SCCB_ReadByte_one:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  293     if(!SCCB_Start())
          CFI FunCall SCCB_Start
        BL       SCCB_Start
        CMP      R0,#+0
        BNE.N    ??SCCB_ReadByte_one_0
//  294     {
//  295         return 0;
        MOVS     R0,#+0
        B.N      ??SCCB_ReadByte_one_1
//  296     }
//  297     SCCB_SendByte( DEV_ADR );         /* 器件地址 */
??SCCB_ReadByte_one_0:
        MOVS     R0,#+66
          CFI FunCall SCCB_SendByte
        BL       SCCB_SendByte
//  298     if( !SCCB_WaitAck() )
          CFI FunCall SCCB_WaitAck
        BL       SCCB_WaitAck
        CMP      R0,#+0
        BNE.N    ??SCCB_ReadByte_one_2
//  299     {
//  300         SCCB_Stop();
          CFI FunCall SCCB_Stop
        BL       SCCB_Stop
//  301         return 0;
        MOVS     R0,#+0
        B.N      ??SCCB_ReadByte_one_1
//  302     }
//  303     SCCB_SendByte( ReadAddress );           /* 设置低起始地址 */
??SCCB_ReadByte_one_2:
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall SCCB_SendByte
        BL       SCCB_SendByte
//  304     SCCB_WaitAck();
          CFI FunCall SCCB_WaitAck
        BL       SCCB_WaitAck
//  305     SCCB_Stop();
          CFI FunCall SCCB_Stop
        BL       SCCB_Stop
//  306 
//  307     if(!SCCB_Start())
          CFI FunCall SCCB_Start
        BL       SCCB_Start
        CMP      R0,#+0
        BNE.N    ??SCCB_ReadByte_one_3
//  308     {
//  309         return 0;
        MOVS     R0,#+0
        B.N      ??SCCB_ReadByte_one_1
//  310     }
//  311     SCCB_SendByte( DEV_ADR + 1 );               /* 器件地址 */
??SCCB_ReadByte_one_3:
        MOVS     R0,#+67
          CFI FunCall SCCB_SendByte
        BL       SCCB_SendByte
//  312 
//  313     if(!SCCB_WaitAck())
          CFI FunCall SCCB_WaitAck
        BL       SCCB_WaitAck
        CMP      R0,#+0
        BNE.N    ??SCCB_ReadByte_one_4
//  314     {
//  315         SCCB_Stop();
          CFI FunCall SCCB_Stop
        BL       SCCB_Stop
//  316         return 0;
        MOVS     R0,#+0
        B.N      ??SCCB_ReadByte_one_1
//  317     }
//  318     while(length)
??SCCB_ReadByte_one_4:
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+0
        BEQ.N    ??SCCB_ReadByte_one_5
//  319     {
//  320         *pBuffer = SCCB_ReceiveByte();
          CFI FunCall SCCB_ReceiveByte
        BL       SCCB_ReceiveByte
        STRB     R0,[R4, #+0]
//  321         if(length == 1)
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+1
        BNE.N    ??SCCB_ReadByte_one_6
//  322         {
//  323             SCCB_NoAck();
          CFI FunCall SCCB_NoAck
        BL       SCCB_NoAck
        B.N      ??SCCB_ReadByte_one_7
//  324         }
//  325         else
//  326         {
//  327             SCCB_Ack();
??SCCB_ReadByte_one_6:
          CFI FunCall SCCB_Ack
        BL       SCCB_Ack
//  328         }
//  329         pBuffer++;
??SCCB_ReadByte_one_7:
        ADDS     R4,R4,#+1
//  330         length--;
        SUBS     R5,R5,#+1
        B.N      ??SCCB_ReadByte_one_4
//  331     }
//  332     SCCB_Stop();
??SCCB_ReadByte_one_5:
          CFI FunCall SCCB_Stop
        BL       SCCB_Stop
//  333     return 1;
        MOVS     R0,#+1
??SCCB_ReadByte_one_1:
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock12
//  334 }

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  335 
//  336 
//  337 
//  338 
// 
// 866 bytes in section .text
// 
// 866 bytes of CODE memory
//
//Errors: none
//Warnings: none
