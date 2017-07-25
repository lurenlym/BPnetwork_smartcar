///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       21/Mar/2017  16:05:46
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        E:\znc\project\K60FN\network_car\Board\src\VCAN_OV7725_Eagle.c
//    Command line =  
//        E:\znc\project\K60FN\network_car\Board\src\VCAN_OV7725_Eagle.c -D
//        DEBUG -D ARM_MATH_CM4 -D MK60F15 -D MK60FN15 -lA
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
//        E:\znc\project\K60FN\network_car\Prj\IAR\FN15_Debug\List\VCAN_OV7725_Eagle.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "1"
        RTMODEL "__dlib_full_locale_support", "1"
        RTMODEL "__iar_require _Printf", ""
        AAPCS BASE,INTERWORK,VFP
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN SCCB_GPIO_init
        EXTERN SCCB_ReadByte
        EXTERN SCCB_WriteByte
        EXTERN dma_portx2buff_init
        EXTERN port_init
        EXTERN printf
        EXTERN systick_delay_ms

        PUBLIC ov7725_eagle_cfgnum
        PUBLIC ov7725_eagle_dma
        PUBLIC ov7725_eagle_get_img
        PUBLIC ov7725_eagle_img_buff
        PUBLIC ov7725_eagle_img_flag
        PUBLIC ov7725_eagle_init
        PUBLIC ov7725_eagle_reg
        PUBLIC ov7725_eagle_vsync
        
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
        
// E:\znc\project\K60FN\network_car\Board\src\VCAN_OV7725_Eagle.c
//    1 /*!
//    2  *     COPYRIGHT NOTICE
//    3  *     Copyright (c) 2013,山外科技
//    4  *     All rights reserved.
//    5  *     技术讨论：山外论坛 http://www.vcan123.com
//    6  *
//    7  *     除注明出处外，以下所有内容版权均属山外科技所有，未经允许，不得用于商业用途，
//    8  *     修改内容时必须保留山外科技的版权声明。
//    9  *
//   10  * @file       VCAN_OV7725_Eagle.c
//   11  * @brief      鹰眼ov7725驱动代码
//   12  * @author     山外科技
//   13  * @version    v5.0
//   14  * @date       2013-09-07
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
        LDR.N    R2,??DataTable7  ;; 0xe000e100
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
        LDR.N    R2,??DataTable7_1  ;; 0xe000e180
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        LSRS     R3,R0,#+5
        STR      R1,[R2, R3, LSL #+2]
        BX       LR               ;; return
          CFI EndBlock cfiBlock1
//   18 #include "MK60_gpio.h"
//   19 #include "MK60_port.h"
//   20 #include "MK60_dma.h"
//   21 #include "VCAN_camera.h"
//   22 
//   23 
//   24 
//   25 #define OV7725_EAGLE_Delay_ms(time)  DELAY_MS(time)
//   26 
//   27 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   28 uint8   *ov7725_eagle_img_buff;
ov7725_eagle_img_buff:
        DS8 4
//   29 

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   30 volatile IMG_STATUS_e      ov7725_eagle_img_flag = IMG_FINISH;   //图像状态
ov7725_eagle_img_flag:
        DATA
        DC8 1
//   31 
//   32 //内部函数声明
//   33 static uint8 ov7725_eagle_reg_init(void);
//   34 static void ov7725_eagle_port_init();
//   35 
//   36 
//   37 /*!
//   38  *  @brief      鹰眼ov7725初始化
//   39  *  @since      v5.0
//   40  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function ov7725_eagle_init
        THUMB
//   41 uint8 ov7725_eagle_init(uint8 *imgaddr)
//   42 {
ov7725_eagle_init:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//   43     ov7725_eagle_img_buff = imgaddr;
        LDR.N    R0,??DataTable7_2
        STR      R4,[R0, #+0]
//   44     while(ov7725_eagle_reg_init() == 0);
??ov7725_eagle_init_0:
          CFI FunCall ov7725_eagle_reg_init
        BL       ov7725_eagle_reg_init
        CMP      R0,#+0
        BEQ.N    ??ov7725_eagle_init_0
//   45     ov7725_eagle_port_init();
          CFI FunCall ov7725_eagle_port_init
        BL       ov7725_eagle_port_init
//   46     return 0;
        MOVS     R0,#+0
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock2
//   47 }
//   48 
//   49 /*!
//   50  *  @brief      鹰眼ov7725管脚初始化（内部调用）
//   51  *  @since      v5.0
//   52  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function ov7725_eagle_port_init
        THUMB
//   53 void ov7725_eagle_port_init()
//   54 {
ov7725_eagle_port_init:
        PUSH     {R5-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+16
//   55     //DMA通道0初始化，PTA27触发源(默认上升沿)，源地址为PTB_B0_IN，目的地址为：IMG_BUFF，每次传输1Byte
//   56     dma_portx2buff_init(CAMERA_DMA_CH, (void *)&PTB_B0_IN, (void *)ov7725_eagle_img_buff, PTA27, DMA_BYTE1, CAMERA_DMA_NUM, DADDR_KEEPON);
        MOVS     R0,#+1
        STR      R0,[SP, #+8]
        MOV      R0,#+600
        STR      R0,[SP, #+4]
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R3,#+27
        LDR.N    R0,??DataTable7_2
        LDR      R2,[R0, #+0]
        LDR.N    R1,??DataTable7_3  ;; 0x400ff050
        MOVS     R0,#+0
          CFI FunCall dma_portx2buff_init
        BL       dma_portx2buff_init
//   57 
//   58     DMA_DIS(CAMERA_DMA_CH);
        LDR.N    R0,??DataTable7_4  ;; 0x4000800c
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.N    R1,??DataTable7_4  ;; 0x4000800c
        STR      R0,[R1, #+0]
//   59     disable_irq(PORTA_IRQn);                        //关闭PTA的中断
        MOVS     R0,#+87
          CFI FunCall NVIC_DisableIRQ
        BL       NVIC_DisableIRQ
//   60     DMA_IRQ_CLEAN(CAMERA_DMA_CH);                   //清除通道传输中断标志位
        LDR.N    R0,??DataTable7_5  ;; 0x40008024
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable7_5  ;; 0x40008024
        STR      R0,[R1, #+0]
//   61     DMA_IRQ_EN(CAMERA_DMA_CH);
        MOVS     R0,#+0
          CFI FunCall NVIC_EnableIRQ
        BL       NVIC_EnableIRQ
//   62 
//   63     port_init(PTA27, ALT1 | DMA_FALLING | PULLDOWN );         //PCLK
        LDR.N    R1,??DataTable7_6  ;; 0x20102
        MOVS     R0,#+27
          CFI FunCall port_init
        BL       port_init
//   64 
//   65     port_init(PTA29, ALT1 | IRQ_RISING  | PULLDOWN | PF);     //场中断，上拉，上降沿触发中断，带滤波
        LDR.N    R1,??DataTable7_7  ;; 0x90112
        MOVS     R0,#+29
          CFI FunCall port_init
        BL       port_init
//   66 
//   67 }
        POP      {R0-R2,PC}       ;; return
          CFI EndBlock cfiBlock3
//   68 
//   69 /*!
//   70  *  @brief      鹰眼ov7725场中断服务函数
//   71  *  @since      v5.0
//   72  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function ov7725_eagle_vsync
        THUMB
//   73 void ov7725_eagle_vsync(void)
//   74 {
ov7725_eagle_vsync:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   75 
//   76     //场中断需要判断是场结束还是场开始
//   77     if(ov7725_eagle_img_flag == IMG_START)                   //需要开始采集图像
        LDR.N    R0,??DataTable7_8
        LDRSB    R0,[R0, #+0]
        CMP      R0,#+4
        BNE.N    ??ov7725_eagle_vsync_0
//   78     {
//   79         ov7725_eagle_img_flag = IMG_GATHER;                  //标记图像采集中
        MOVS     R0,#+3
        LDR.N    R1,??DataTable7_8
        STRB     R0,[R1, #+0]
//   80         disable_irq(PORTA_IRQn);
        MOVS     R0,#+87
          CFI FunCall NVIC_DisableIRQ
        BL       NVIC_DisableIRQ
//   81 
//   82 #if 1
//   83 
//   84         PORTA_ISFR = 1 <<  PT27;            //清空PCLK标志位
        MOVS     R0,#+134217728
        LDR.N    R1,??DataTable7_9  ;; 0x400490a0
        STR      R0,[R1, #+0]
//   85 
//   86         DMA_EN(CAMERA_DMA_CH);                  //使能通道CHn 硬件请求
        LDR.N    R0,??DataTable7_4  ;; 0x4000800c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable7_4  ;; 0x4000800c
        STR      R0,[R1, #+0]
//   87         PORTA_ISFR = 1 <<  PT27;            //清空PCLK标志位
        MOVS     R0,#+134217728
        LDR.N    R1,??DataTable7_9  ;; 0x400490a0
        STR      R0,[R1, #+0]
//   88         DMA_DADDR(CAMERA_DMA_CH) = (uint32)ov7725_eagle_img_buff;    //恢复地址
        LDR.N    R0,??DataTable7_2
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable7_10  ;; 0x40009010
        STR      R0,[R1, #+0]
        B.N      ??ov7725_eagle_vsync_1
//   89 
//   90 #else
//   91         PORTA_ISFR = 1 <<  PT27;            //清空PCLK标志位
//   92         dma_repeat(CAMERA_DMA_CH, (void *)&PTB_B0_IN, (void *)ov7725_eagle_img_buff,CAMERA_DMA_NUM);
//   93 #endif
//   94     }
//   95     else                                        //图像采集错误
//   96     {
//   97         disable_irq(PORTA_IRQn);                        //关闭PTA的中断
??ov7725_eagle_vsync_0:
        MOVS     R0,#+87
          CFI FunCall NVIC_DisableIRQ
        BL       NVIC_DisableIRQ
//   98         ov7725_eagle_img_flag = IMG_FAIL;                    //标记图像采集失败
        MOVS     R0,#+2
        LDR.N    R1,??DataTable7_8
        STRB     R0,[R1, #+0]
//   99     }
//  100 }
??ov7725_eagle_vsync_1:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock4
//  101 
//  102 /*!
//  103  *  @brief      鹰眼ov7725 DMA中断服务函数
//  104  *  @since      v5.0
//  105  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function ov7725_eagle_dma
          CFI NoCalls
        THUMB
//  106 void ov7725_eagle_dma()
//  107 {
//  108     ov7725_eagle_img_flag = IMG_FINISH ;
ov7725_eagle_dma:
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_8
        STRB     R0,[R1, #+0]
//  109     DMA_IRQ_CLEAN(CAMERA_DMA_CH);           //清除通道传输中断标志位
        LDR.N    R0,??DataTable7_5  ;; 0x40008024
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable7_5  ;; 0x40008024
        STR      R0,[R1, #+0]
//  110 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock5
//  111 
//  112 /*!
//  113  *  @brief      鹰眼ov7725采集图像（采集到的数据存储在 初始化时配置的地址上）
//  114  *  @since      v5.0
//  115  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function ov7725_eagle_get_img
        THUMB
//  116 void ov7725_eagle_get_img()
//  117 {
ov7725_eagle_get_img:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  118     ov7725_eagle_img_flag = IMG_START;                   //开始采集图像
        MOVS     R0,#+4
        LDR.N    R1,??DataTable7_8
        STRB     R0,[R1, #+0]
//  119     PORTA_ISFR = ~0;                        //写1清中断标志位(必须的，不然回导致一开中断就马上触发中断)
        MOVS     R0,#-1
        LDR.N    R1,??DataTable7_9  ;; 0x400490a0
        STR      R0,[R1, #+0]
//  120     enable_irq(PORTA_IRQn);                         //允许PTA的中断
        MOVS     R0,#+87
          CFI FunCall NVIC_EnableIRQ
        BL       NVIC_EnableIRQ
//  121     while(ov7725_eagle_img_flag != IMG_FINISH)           //等待图像采集完毕
??ov7725_eagle_get_img_0:
        LDR.N    R0,??DataTable7_8
        LDRSB    R0,[R0, #+0]
        CMP      R0,#+1
        BEQ.N    ??ov7725_eagle_get_img_1
//  122     {
//  123         if(ov7725_eagle_img_flag == IMG_FAIL)            //假如图像采集错误，则重新开始采集
        LDR.N    R0,??DataTable7_8
        LDRSB    R0,[R0, #+0]
        CMP      R0,#+2
        BNE.N    ??ov7725_eagle_get_img_0
//  124         {
//  125             ov7725_eagle_img_flag = IMG_START;           //开始采集图像
        MOVS     R0,#+4
        LDR.N    R1,??DataTable7_8
        STRB     R0,[R1, #+0]
//  126             PORTA_ISFR = ~0;                //写1清中断标志位(必须的，不然回导致一开中断就马上触发中断)
        MOVS     R0,#-1
        LDR.N    R1,??DataTable7_9  ;; 0x400490a0
        STR      R0,[R1, #+0]
//  127             enable_irq(PORTA_IRQn);                 //允许PTA的中断
        MOVS     R0,#+87
          CFI FunCall NVIC_EnableIRQ
        BL       NVIC_EnableIRQ
        B.N      ??ov7725_eagle_get_img_0
//  128         }
//  129     }
//  130 }
??ov7725_eagle_get_img_1:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock6
//  131 
//  132 
//  133 /*OV7725初始化配置表*/

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//  134 reg_s ov7725_eagle_reg[] =
ov7725_eagle_reg:
        DATA
        DC8 13, 193, 17, 0, 9, 3, 12, 208, 18, 64, 23, 63, 24, 80, 25, 3, 26
        DC8 120, 50, 0, 160, 10, 99, 224, 172, 255, 101, 12, 102, 0, 103, 0, 41
        DC8 20, 44, 30, 42, 0, 126, 12, 127, 22, 128, 42, 129, 78, 130, 97, 131
        DC8 111, 132, 123, 133, 134, 134, 142, 135, 151, 136, 164, 137, 175
        DC8 138, 197, 139, 215, 140, 232, 141, 32, 74, 0, 73, 19, 71, 8, 75, 20
        DC8 76, 23, 70, 5, 34, 153, 35, 3, 166, 4, 155, 0, 156, 255, 171, 6
        DC8 158, 17, 159, 2, 0, 0
//  135 {
//  136     //寄存器，寄存器值次
//  137     {OV7725_COM4         , 0xC1},
//  138     {OV7725_CLKRC        , 0x00},
//  139     {OV7725_COM2         , 0x03},
//  140     {OV7725_COM3         , 0xD0},
//  141     {OV7725_COM7         , 0x40},
//  142     {OV7725_HSTART       , 0x3F},
//  143     {OV7725_HSIZE        , 0x50},
//  144     {OV7725_VSTRT        , 0x03},
//  145     {OV7725_VSIZE        , 0x78},
//  146     {OV7725_HREF         , 0x00},
//  147     {OV7725_SCAL0        , 0x0A},
//  148     {OV7725_AWB_Ctrl0    , 0xE0},
//  149     {OV7725_DSPAuto      , 0xff},
//  150     {OV7725_DSP_Ctrl2    , 0x0C},
//  151     {OV7725_DSP_Ctrl3    , 0x00},
//  152     {OV7725_DSP_Ctrl4    , 0x00},
//  153 
//  154 #if (CAMERA_W == 80)
//  155     {OV7725_HOutSize     , 0x14},
//  156 #elif (CAMERA_W == 160)
//  157     {OV7725_HOutSize     , 0x28},
//  158 #elif (CAMERA_W == 240)
//  159     {OV7725_HOutSize     , 0x3c},
//  160 #elif (CAMERA_W == 320)
//  161     {OV7725_HOutSize     , 0x50},
//  162 #else
//  163 
//  164 #endif
//  165 
//  166 #if (CAMERA_H == 60 )
//  167     {OV7725_VOutSize     , 0x1E},
//  168 #elif (CAMERA_H == 120 )
//  169     {OV7725_VOutSize     , 0x3c},
//  170 #elif (CAMERA_H == 180 )
//  171     {OV7725_VOutSize     , 0x5a},
//  172 #elif (CAMERA_H == 240 )
//  173     {OV7725_VOutSize     , 0x78},
//  174 #else
//  175 
//  176 #endif
//  177 
//  178     {OV7725_EXHCH        , 0x00},
//  179     {OV7725_GAM1         , 0x0c},
//  180     {OV7725_GAM2         , 0x16},
//  181     {OV7725_GAM3         , 0x2a},
//  182     {OV7725_GAM4         , 0x4e},
//  183     {OV7725_GAM5         , 0x61},
//  184     {OV7725_GAM6         , 0x6f},
//  185     {OV7725_GAM7         , 0x7b},
//  186     {OV7725_GAM8         , 0x86},
//  187     {OV7725_GAM9         , 0x8e},
//  188     {OV7725_GAM10        , 0x97},
//  189     {OV7725_GAM11        , 0xa4},
//  190     {OV7725_GAM12        , 0xaf},
//  191     {OV7725_GAM13        , 0xc5},
//  192     {OV7725_GAM14        , 0xd7},
//  193     {OV7725_GAM15        , 0xe8},
//  194     {OV7725_SLOP         , 0x20},
//  195     {OV7725_LC_RADI      , 0x00},
//  196     {OV7725_LC_COEF      , 0x13},
//  197     {OV7725_LC_XC        , 0x08},
//  198     {OV7725_LC_COEFB     , 0x14},
//  199     {OV7725_LC_COEFR     , 0x17},
//  200     {OV7725_LC_CTR       , 0x05},
//  201     {OV7725_BDBase       , 0x99},
//  202     {OV7725_BDMStep      , 0x03},
//  203     {OV7725_SDE          , 0x04},
//  204     {OV7725_BRIGHT       , 0x00},
//  205     {OV7725_CNST         , 0xFF},
//  206     {OV7725_SIGN         , 0x06},
//  207     {OV7725_UVADJ0       , 0x11},
//  208     {OV7725_UVADJ1       , 0x02},
//  209 
//  210 };
//  211 

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//  212 uint8 ov7725_eagle_cfgnum = ARR_SIZE( ov7725_eagle_reg ) ; /*结构体数组成员数目*/
ov7725_eagle_cfgnum:
        DATA
        DC8 49
//  213 
//  214 
//  215 /*!
//  216  *  @brief      鹰眼ov7725寄存器 初始化
//  217  *  @return     初始化结果（0表示失败，1表示成功）
//  218  *  @since      v5.0
//  219  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function ov7725_eagle_reg_init
        THUMB
//  220 uint8 ov7725_eagle_reg_init(void)
//  221 {
ov7725_eagle_reg_init:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
//  222     uint16 i = 0;
        MOVS     R4,#+0
//  223     uint8 Sensor_IDCode = 0;
        MOVS     R0,#+0
        STRB     R0,[SP, #+0]
//  224     SCCB_GPIO_init();
          CFI FunCall SCCB_GPIO_init
        BL       SCCB_GPIO_init
//  225 
//  226     //OV7725_Delay_ms(50);
//  227     if( 0 == SCCB_WriteByte ( OV7725_COM7, 0x80 ) ) /*复位sensor */
        MOVS     R1,#+128
        MOVS     R0,#+18
          CFI FunCall SCCB_WriteByte
        BL       SCCB_WriteByte
        CMP      R0,#+0
        BNE.N    ??ov7725_eagle_reg_init_0
//  228     {
//  229         DEBUG_PRINTF("\n警告:SCCB写数据错误");
        LDR.N    R0,??DataTable7_11
          CFI FunCall printf
        BL       printf
//  230         return 0 ;
        MOVS     R0,#+0
        B.N      ??ov7725_eagle_reg_init_1
//  231     }
//  232 
//  233     OV7725_EAGLE_Delay_ms(50);
??ov7725_eagle_reg_init_0:
        MOVS     R0,#+50
          CFI FunCall systick_delay_ms
        BL       systick_delay_ms
//  234 
//  235     if( 0 == SCCB_ReadByte( &Sensor_IDCode, 1, OV7725_VER ) )    /* 读取sensor ID号*/
        MOVS     R2,#+11
        MOVS     R1,#+1
        ADD      R0,SP,#+0
          CFI FunCall SCCB_ReadByte
        BL       SCCB_ReadByte
        CMP      R0,#+0
        BNE.N    ??ov7725_eagle_reg_init_2
//  236     {
//  237         DEBUG_PRINTF("\n警告:读取ID失败");
        LDR.N    R0,??DataTable7_12
          CFI FunCall printf
        BL       printf
//  238         return 0;
        MOVS     R0,#+0
        B.N      ??ov7725_eagle_reg_init_1
//  239     }
//  240     DEBUG_PRINTF("\nGet ID success，SENSOR ID is 0x%x", Sensor_IDCode);
??ov7725_eagle_reg_init_2:
        LDRB     R1,[SP, #+0]
        LDR.N    R0,??DataTable7_13
          CFI FunCall printf
        BL       printf
//  241     DEBUG_PRINTF("\nConfig Register Number is %d ", ov7725_eagle_cfgnum);
        LDR.N    R0,??DataTable7_14
        LDRB     R1,[R0, #+0]
        LDR.N    R0,??DataTable7_15
          CFI FunCall printf
        BL       printf
//  242     if(Sensor_IDCode == OV7725_ID)
        LDRB     R0,[SP, #+0]
        CMP      R0,#+33
        BNE.N    ??ov7725_eagle_reg_init_3
//  243     {
//  244         for( i = 0 ; i < ov7725_eagle_cfgnum ; i++ )
        MOVS     R0,#+0
        MOVS     R4,R0
??ov7725_eagle_reg_init_4:
        LDR.N    R0,??DataTable7_14
        LDRB     R0,[R0, #+0]
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R4,R0
        BCS.N    ??ov7725_eagle_reg_init_5
//  245         {
//  246             if( 0 == SCCB_WriteByte(ov7725_eagle_reg[i].addr, ov7725_eagle_reg[i].val) )
        LDR.N    R0,??DataTable7_16
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        ADDS     R0,R0,R4, LSL #+1
        LDRB     R1,[R0, #+1]
        LDR.N    R0,??DataTable7_16
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        LDRB     R0,[R0, R4, LSL #+1]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
          CFI FunCall SCCB_WriteByte
        BL       SCCB_WriteByte
        CMP      R0,#+0
        BNE.N    ??ov7725_eagle_reg_init_6
//  247             {
//  248                 DEBUG_PRINTF("\n警告:写寄存器0x%x失败", ov7725_eagle_reg[i].addr);
        LDR.N    R0,??DataTable7_16
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        LDRB     R1,[R0, R4, LSL #+1]
        LDR.N    R0,??DataTable7_17
          CFI FunCall printf
        BL       printf
//  249                 return 0;
        MOVS     R0,#+0
        B.N      ??ov7725_eagle_reg_init_1
//  250             }
//  251         }
??ov7725_eagle_reg_init_6:
        ADDS     R4,R4,#+1
        B.N      ??ov7725_eagle_reg_init_4
//  252     }
//  253     else
//  254     {
//  255         return 0;
//  256     }
//  257     DEBUG_PRINTF("\nOV7725 Register Config Success!");
??ov7725_eagle_reg_init_5:
        LDR.N    R0,??DataTable7_18
          CFI FunCall printf
        BL       printf
//  258     return 1;
        MOVS     R0,#+1
        B.N      ??ov7725_eagle_reg_init_1
??ov7725_eagle_reg_init_3:
        MOVS     R0,#+0
??ov7725_eagle_reg_init_1:
        POP      {R1,R2,R4,PC}    ;; return
          CFI EndBlock cfiBlock7
//  259 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC32     0xe000e100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_1:
        DC32     0xe000e180

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_2:
        DC32     ov7725_eagle_img_buff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_3:
        DC32     0x400ff050

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_4:
        DC32     0x4000800c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_5:
        DC32     0x40008024

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_6:
        DC32     0x20102

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_7:
        DC32     0x90112

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_8:
        DC32     ov7725_eagle_img_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_9:
        DC32     0x400490a0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_10:
        DC32     0x40009010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_11:
        DC32     ?_0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_12:
        DC32     ?_1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_13:
        DC32     ?_2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_14:
        DC32     ov7725_eagle_cfgnum

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_15:
        DC32     ?_3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_16:
        DC32     ov7725_eagle_reg

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_17:
        DC32     ?_4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_18:
        DC32     ?_5

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
        DC8 "\012\276\257\270\346:SCCB\320\264\312\375\276\335\264\355\316\363"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_1:
        DATA
        DC8 "\012\276\257\270\346:\266\301\310\241ID\312\247\260\334"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_2:
        DATA
        DC8 "\012Get ID success\243\254SENSOR ID is 0x%x"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_3:
        DATA
        DC8 "\012Config Register Number is %d "
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_4:
        DATA
        DC8 "\012\276\257\270\346:\320\264\274\304\264\346\306\3670x%x\312\247\260\334"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_5:
        DATA
        DC8 "\012OV7725 Register Config Success!"
        DC8 0, 0, 0

        END
//  260 
//  261 
// 
//   4 bytes in section .bss
// 102 bytes in section .data
// 172 bytes in section .rodata
// 562 bytes in section .text
// 
// 562 bytes of CODE  memory
// 172 bytes of CONST memory
// 106 bytes of DATA  memory
//
//Errors: none
//Warnings: none
