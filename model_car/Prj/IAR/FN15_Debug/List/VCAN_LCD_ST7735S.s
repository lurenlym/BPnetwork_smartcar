///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       21/Mar/2017  16:05:38
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        E:\znc\project\K60FN\network_car\Board\src\VCAN_LCD_ST7735S.c
//    Command line =  
//        E:\znc\project\K60FN\network_car\Board\src\VCAN_LCD_ST7735S.c -D
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
//        E:\znc\project\K60FN\network_car\Prj\IAR\FN15_Debug\List\VCAN_LCD_ST7735S.s
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
        EXTERN gpio_init
        EXTERN port_init
        EXTERN systick_delay_ms

        PUBLIC LCD_ST7735S_dir
        PUBLIC LCD_ST7735S_init
        PUBLIC LCD_ST7735S_ptlon
        PUBLIC LCD_ST7735S_wr_cmd
        PUBLIC LCD_ST7735S_wr_data
        PUBLIC ST7735S_get_dir
        PUBLIC ST7735S_get_h
        PUBLIC ST7735S_get_w
        PUBLIC st7735s_dir
        PUBLIC st7735s_h
        PUBLIC st7735s_w
        
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
        
// E:\znc\project\K60FN\network_car\Board\src\VCAN_LCD_ST7735S.c
//    1 /*!
//    2  *     COPYRIGHT NOTICE
//    3  *     Copyright (c) 2013,山外科技
//    4  *     All rights reserved.
//    5  *     技术讨论：山外论坛 http://www.vcan123.com
//    6  *
//    7  *     除注明出处外，以下所有内容版权均属山外科技所有，未经允许，不得用于商业用途，
//    8  *     修改内容时必须保留山外科技的版权声明。
//    9  *
//   10  * @file       VCAN_LCD_ST7735S.c
//   11  * @brief      LCD 函数库
//   12  * @author     山外科技
//   13  * @version    v5.1
//   14  * @date       2014-04-26
//   15  */
//   16 
//   17 
//   18 #include "common.h"
//   19 #include "MK60_gpio.h"
//   20 #include "VCAN_LCD_ST7735S.h"
//   21 
//   22 
//   23 
//   24 
//   25 
//   26 //定义所用到的 IO管脚
//   27 #define LCD_RST    PTC13                //复位
//   28 
//   29 #define ST7735S_H       128
//   30 #define ST7735S_W       128
//   31 

        SECTION `.data`:DATA:REORDER:NOROOT(1)
//   32 uint16  st7735s_h   = ST7735S_H;
st7735s_h:
        DATA
        DC16 128

        SECTION `.data`:DATA:REORDER:NOROOT(1)
//   33 uint16  st7735s_w   = ST7735S_W;
st7735s_w:
        DATA
        DC16 128

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   34 uint8   st7735s_dir = ST7735S_DIR_DEFAULT;
st7735s_dir:
        DS8 1
//   35 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function LCD_ST7735S_wr_data
          CFI NoCalls
        THUMB
//   36 void LCD_ST7735S_wr_data(uint8 data)
//   37 {
//   38     LCD_ST7735S_RD_OUT = 1;
LCD_ST7735S_wr_data:
        MOVS     R1,#+1
        LDR.N    R2,??DataTable1  ;; 0x43fe1028
        STR      R1,[R2, #+0]
//   39     LCD_ST7735S_RS_OUT = 1;
        MOVS     R1,#+1
        LDR.N    R2,??DataTable1_1  ;; 0x43fe1030
        STR      R1,[R2, #+0]
//   40     LCD_ST7735S_CS_OUT = 0;
        MOVS     R1,#+0
        LDR.N    R2,??DataTable1_2  ;; 0x43fe102c
        STR      R1,[R2, #+0]
//   41 
//   42     LCD_ST7735S_P0 = data;
        LDR.N    R1,??DataTable1_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
//   43 
//   44     ST7735S_DELAY();
//   45 
//   46     LCD_ST7735S_WR_OUT = 0;
        MOVS     R1,#+0
        LDR.N    R2,??DataTable1_4  ;; 0x43fe1024
        STR      R1,[R2, #+0]
//   47     LCD_ST7735S_WR_OUT = 1;
        MOVS     R1,#+1
        LDR.N    R2,??DataTable1_4  ;; 0x43fe1024
        STR      R1,[R2, #+0]
//   48     LCD_ST7735S_CS_OUT = 1;
        MOVS     R1,#+1
        LDR.N    R2,??DataTable1_2  ;; 0x43fe102c
        STR      R1,[R2, #+0]
//   49 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
//   50 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function LCD_ST7735S_wr_cmd
          CFI NoCalls
        THUMB
//   51 void LCD_ST7735S_wr_cmd(uint8 cmd)
//   52 {
//   53     LCD_ST7735S_RD_OUT = 1;
LCD_ST7735S_wr_cmd:
        MOVS     R1,#+1
        LDR.N    R2,??DataTable1  ;; 0x43fe1028
        STR      R1,[R2, #+0]
//   54     LCD_ST7735S_RS_OUT = 0;
        MOVS     R1,#+0
        LDR.N    R2,??DataTable1_1  ;; 0x43fe1030
        STR      R1,[R2, #+0]
//   55     LCD_ST7735S_CS_OUT = 0;
        MOVS     R1,#+0
        LDR.N    R2,??DataTable1_2  ;; 0x43fe102c
        STR      R1,[R2, #+0]
//   56 
//   57     LCD_ST7735S_P0 = cmd;
        LDR.N    R1,??DataTable1_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
//   58 
//   59     ST7735S_DELAY();
//   60     LCD_ST7735S_WR_OUT = 0;
        MOVS     R1,#+0
        LDR.N    R2,??DataTable1_4  ;; 0x43fe1024
        STR      R1,[R2, #+0]
//   61     LCD_ST7735S_WR_OUT = 1;
        MOVS     R1,#+1
        LDR.N    R2,??DataTable1_4  ;; 0x43fe1024
        STR      R1,[R2, #+0]
//   62     LCD_ST7735S_CS_OUT = 1;
        MOVS     R1,#+1
        LDR.N    R2,??DataTable1_2  ;; 0x43fe102c
        STR      R1,[R2, #+0]
//   63 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     0x43fe1028

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     0x43fe1030

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     0x43fe102c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     0x400ff080

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     0x43fe1024
//   64 
//   65 /*!
//   66  *  @brief      LCD_ST7735S初始化
//   67  *  @since      v5.0
//   68  */

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function LCD_ST7735S_init
        THUMB
//   69 void    LCD_ST7735S_init()
//   70 {
LCD_ST7735S_init:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//   71     uint8 n ;
//   72 
//   73     for(n = 0; n < 8; n++)
        MOVS     R0,#+0
        MOVS     R4,R0
??LCD_ST7735S_init_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+8
        BGE.N    ??LCD_ST7735S_init_1
//   74     {
//   75         gpio_init  ((PTXn_e)(PTC0 + n), GPO, 0);
        MOVS     R2,#+0
        MOVS     R1,#+1
        ADDS     R0,R4,#+64
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall gpio_init
        BL       gpio_init
//   76     }
        ADDS     R4,R4,#+1
        B.N      ??LCD_ST7735S_init_0
//   77 
//   78 
//   79     gpio_init  (LCD_ST7735S_WR, GPO, 0);
??LCD_ST7735S_init_1:
        MOVS     R2,#+0
        MOVS     R1,#+1
        MOVS     R0,#+73
          CFI FunCall gpio_init
        BL       gpio_init
//   80     gpio_init  (LCD_ST7735S_RD, GPO, 1);
        MOVS     R2,#+1
        MOVS     R1,#+1
        MOVS     R0,#+74
          CFI FunCall gpio_init
        BL       gpio_init
//   81     gpio_init  (LCD_ST7735S_CS, GPO, 1);
        MOVS     R2,#+1
        MOVS     R1,#+1
        MOVS     R0,#+75
          CFI FunCall gpio_init
        BL       gpio_init
//   82     gpio_init  (LCD_ST7735S_RS, GPO, 0);
        MOVS     R2,#+0
        MOVS     R1,#+1
        MOVS     R0,#+76
          CFI FunCall gpio_init
        BL       gpio_init
//   83     gpio_init  (LCD_ST7735S_RST, GPO, 0);
        MOVS     R2,#+0
        MOVS     R1,#+1
        MOVS     R0,#+77
          CFI FunCall gpio_init
        BL       gpio_init
//   84 
//   85     port_init  (LCD_ST7735S_WR , ALT1 | HDS);
        MOV      R1,#+320
        MOVS     R0,#+73
          CFI FunCall port_init
        BL       port_init
//   86     port_init  (LCD_ST7735S_RD , ALT1 | HDS);
        MOV      R1,#+320
        MOVS     R0,#+74
          CFI FunCall port_init
        BL       port_init
//   87     port_init  (LCD_ST7735S_CS , ALT1 | HDS);
        MOV      R1,#+320
        MOVS     R0,#+75
          CFI FunCall port_init
        BL       port_init
//   88     port_init  (LCD_ST7735S_RS , ALT1 | HDS);
        MOV      R1,#+320
        MOVS     R0,#+76
          CFI FunCall port_init
        BL       port_init
//   89 
//   90     //初始化总线
//   91     LCD_ST7735S_RST_OUT = 0;
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2  ;; 0x43fe1034
        STR      R0,[R1, #+0]
//   92     ST7735S_DELAY();
//   93     LCD_ST7735S_RST_OUT = 1;
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2  ;; 0x43fe1034
        STR      R0,[R1, #+0]
//   94     ST7735S_DELAY_MS(500);      //上电给足够时间
        MOV      R0,#+500
          CFI FunCall systick_delay_ms
        BL       systick_delay_ms
//   95 
//   96     LCD_ST7735S_WR_8CMD(0x11);           //Sleep out   退出睡眠模式
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+17
        LDR.W    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//   97     ST7735S_DELAY_MS(120);      //Delay 120ms
        MOVS     R0,#+120
          CFI FunCall systick_delay_ms
        BL       systick_delay_ms
//   98     //------------------------------------ST7735S Frame Rate-----------------------------------------//
//   99     /* Set the frame frequency of the full colors normal mode. */
//  100     LCD_ST7735S_WR_8CMD(0xB1);     //In Normal Mode (Full Colors)    全屏模式
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+177
        LDR.W    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  101     LCD_ST7735S_WR_8DATA(0x05);    //设置 RTNA Set 1-line  Period  一行周期
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+5
        LDR.W    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  102     LCD_ST7735S_WR_8DATA(0x3A);    //设置 FPA: Front Porch
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+58
        LDR.W    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  103     LCD_ST7735S_WR_8DATA(0x3A);    //设置 BPA: Back Porch
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+58
        LDR.W    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  104     //Frame rate=fosc/((RTNA x 2 + 40) x (LINE + FPA + BPA +2))
//  105     //其中 fosc = 850kHz
//  106 
//  107     /* Set the frame frequency of the Idle mode.  */
//  108     LCD_ST7735S_WR_8CMD(0xB2);     //In Idle Mode (8-colors)
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+178
        LDR.W    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  109     LCD_ST7735S_WR_8DATA(0x05);
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+5
        LDR.W    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  110     LCD_ST7735S_WR_8DATA(0x3A);
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+58
        LDR.W    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  111     LCD_ST7735S_WR_8DATA(0x3A);
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+58
        LDR.W    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  112 
//  113     /* Set the frame frequency of the Partial mode/ full colors. */
//  114     LCD_ST7735S_WR_8CMD(0xB3);
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+179
        LDR.W    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  115     LCD_ST7735S_WR_8DATA(0x05);
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+5
        LDR.W    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  116     LCD_ST7735S_WR_8DATA(0x3A);
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+58
        LDR.W    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  117     LCD_ST7735S_WR_8DATA(0x3A);
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+58
        LDR.W    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  118     LCD_ST7735S_WR_8DATA(0x05);
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+5
        LDR.W    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  119     LCD_ST7735S_WR_8DATA(0x3A);
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+58
        LDR.W    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  120     LCD_ST7735S_WR_8DATA(0x3A);
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+58
        LDR.W    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  121 
//  122     //------------------------------------End ST7735S Frame Rate-----------------------------------------//
//  123     LCD_ST7735S_WR_8CMD(0xB4);   //Display Inversion Control  显示反转控制
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+180
        LDR.W    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  124 
//  125     LCD_ST7735S_WR_8DATA(0x07);  //LCD_ST7735S_WR_8DATA(0x03); 原来为3，改为7
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+7
        LDR.W    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  126     // 低三位从高到低，分别为  full colors normal mode 、Idle mode 、
//  127     // full Colors partial mode  的 点反转 或 列反转 ，1为列反转
//  128 
//  129     LCD_ST7735S_WR_8CMD(0xC0);   //Power Control Setting  电源控制设置
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+192
        LDR.W    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  130     LCD_ST7735S_WR_8DATA(0x28);
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+40
        LDR.W    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  131     LCD_ST7735S_WR_8DATA(0x08);
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+8
        LDR.W    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  132     LCD_ST7735S_WR_8DATA(0x84);
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+132
        LDR.W    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  133     LCD_ST7735S_WR_8CMD(0xC1);
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+193
        LDR.W    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  134     LCD_ST7735S_WR_8DATA(0XC0);
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+192
        LDR.W    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  135     LCD_ST7735S_WR_8CMD(0xC2);
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+194
        LDR.W    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  136     LCD_ST7735S_WR_8DATA(0x0C);
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+12
        LDR.W    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  137     LCD_ST7735S_WR_8DATA(0x00);
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  138     LCD_ST7735S_WR_8CMD(0xC3);
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+195
        LDR.W    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  139     LCD_ST7735S_WR_8DATA(0x8C);
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+140
        LDR.W    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  140     LCD_ST7735S_WR_8DATA(0x2A);
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+42
        LDR.W    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  141     LCD_ST7735S_WR_8CMD(0xC4);
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+196
        LDR.W    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  142     LCD_ST7735S_WR_8DATA(0x8A);
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+138
        LDR.W    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  143     LCD_ST7735S_WR_8DATA(0xEE);
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+238
        LDR.W    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  144     //---------------------------------End ST7735S Power Sequence-------------------------------------//
//  145     LCD_ST7735S_WR_8CMD(0xC5);   //  VCOM 电压配置
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+197
        LDR.W    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  146     LCD_ST7735S_WR_8DATA(0x0C); //  -0.725
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+12
        LDR.W    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  147     //------------------------------------ST7735S Gamma Sequence-----------------------------------------//
//  148     LCD_ST7735S_WR_8CMD(0xE0);
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+224
        LDR.W    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  149     LCD_ST7735S_WR_8DATA(0x05);
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+5
        LDR.W    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  150     LCD_ST7735S_WR_8DATA(0x1A);
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+26
        LDR.W    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  151     LCD_ST7735S_WR_8DATA(0x0C);
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+12
        LDR.W    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  152     LCD_ST7735S_WR_8DATA(0x0E);
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+14
        LDR.W    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  153     LCD_ST7735S_WR_8DATA(0x3A);
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+58
        LDR.W    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  154     LCD_ST7735S_WR_8DATA(0x34);
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+52
        LDR.W    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  155     LCD_ST7735S_WR_8DATA(0x2D);
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+45
        LDR.W    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  156     LCD_ST7735S_WR_8DATA(0x2F);
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+47
        LDR.W    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  157     LCD_ST7735S_WR_8DATA(0x2D);
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+45
        LDR.W    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  158     LCD_ST7735S_WR_8DATA(0x2A);
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+42
        LDR.W    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  159     LCD_ST7735S_WR_8DATA(0x2F);
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+47
        LDR.N    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  160     LCD_ST7735S_WR_8DATA(0x3C);
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+60
        LDR.N    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  161     LCD_ST7735S_WR_8DATA(0x00);
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  162     LCD_ST7735S_WR_8DATA(0x01);
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  163     LCD_ST7735S_WR_8DATA(0x02);
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+2
        LDR.N    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  164     LCD_ST7735S_WR_8DATA(0x10);
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+16
        LDR.N    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  165     LCD_ST7735S_WR_8CMD(0xE1);
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+225
        LDR.N    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  166     LCD_ST7735S_WR_8DATA(0x04);
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+4
        LDR.N    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  167     LCD_ST7735S_WR_8DATA(0x1B);
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+27
        LDR.N    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  168     LCD_ST7735S_WR_8DATA(0x0D);
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+13
        LDR.N    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  169     LCD_ST7735S_WR_8DATA(0x0E);
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+14
        LDR.N    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  170     LCD_ST7735S_WR_8DATA(0x2D);
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+45
        LDR.N    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  171     LCD_ST7735S_WR_8DATA(0x29);
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+41
        LDR.N    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  172     LCD_ST7735S_WR_8DATA(0x24);
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+36
        LDR.N    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  173     LCD_ST7735S_WR_8DATA(0x29);
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+41
        LDR.N    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  174     LCD_ST7735S_WR_8DATA(0x28);
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+40
        LDR.N    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  175     LCD_ST7735S_WR_8DATA(0x26);
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+38
        LDR.N    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  176     LCD_ST7735S_WR_8DATA(0x31);
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0x4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0x8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+49
        LDR.N    R1,??LCD_ST7735S_init_2+0x10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0x14  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??LCD_ST7735S_init_2+0xC  ;; 0x43fe102c
        B.N      ??LCD_ST7735S_init_3
        DATA
??LCD_ST7735S_init_2:
        DC32     0x43fe1034
        DC32     0x43fe1028
        DC32     0x43fe1030
        DC32     0x43fe102c
        DC32     0x400ff080
        DC32     0x43fe1024
        THUMB
??LCD_ST7735S_init_3:
        STR      R0,[R1, #+0]
//  177     LCD_ST7735S_WR_8DATA(0x3B);
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+59
        LDR.W    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  178     LCD_ST7735S_WR_8DATA(0x00);
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  179     LCD_ST7735S_WR_8DATA(0x00);
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  180     LCD_ST7735S_WR_8DATA(0x03);
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+3
        LDR.W    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  181     LCD_ST7735S_WR_8DATA(0x12);
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+18
        LDR.W    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  182     //------------------------------------End ST7735S Gamma Sequence-----------------------------------------//
//  183 
//  184     LCD_ST7735S_WR_8CMD(0x3A); //65k mode
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+58
        LDR.W    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  185     LCD_ST7735S_WR_8DATA(0x05);
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+5
        LDR.W    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  186     LCD_ST7735S_WR_8CMD(0x29); //开显示 Display on
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+41
        LDR.W    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  187     LCD_ST7735S_WR_8CMD(0x2c); //
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+44
        LDR.W    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  188 
//  189     LCD_ST7735S_dir(st7735s_dir);
        LDR.W    R0,??DataTable7
        LDRB     R0,[R0, #+0]
          CFI FunCall LCD_ST7735S_dir
        BL       LCD_ST7735S_dir
//  190 
//  191 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock2
//  192 
//  193 /*!
//  194  *  @brief      设置ST7735S GRAM指针扫描方向
//  195  *  @param      option    方向选择（正看（焊接排线在下面） 为 0 ，90度为1，180度为2，270度为2）
//  196  *  @since      v5.0
//  197  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function LCD_ST7735S_dir
        THUMB
//  198 void LCD_ST7735S_dir(uint8 option)
//  199 {
LCD_ST7735S_dir:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  200     ASSERT(option < 4);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+4
        BLT.N    ??LCD_ST7735S_dir_0
        MOVS     R1,#+200
        LDR.W    R0,??DataTable7_1
          CFI FunCall assert_failed
        BL       assert_failed
//  201 
//  202     st7735s_dir = option;
??LCD_ST7735S_dir_0:
        LDR.W    R0,??DataTable7
        STRB     R4,[R0, #+0]
//  203     switch(option)
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??LCD_ST7735S_dir_1
        CMP      R4,#+2
        BEQ.W    ??LCD_ST7735S_dir_2
        BCC.W    ??LCD_ST7735S_dir_3
        CMP      R4,#+3
        BEQ.W    ??LCD_ST7735S_dir_4
        B.W      ??LCD_ST7735S_dir_5
//  204     {
//  205     case 0:
//  206         LCD_ST7735S_WR_8CMD(0x36); // 内存数据访问控制  MX 列地址顺序, MY 行地址顺序 ，MV 行列交换 ，ML 垂直刷新顺序 ,RGB  RGB-BGA顺序
??LCD_ST7735S_dir_1:
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+54
        LDR.W    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  207         LCD_ST7735S_WR_8DATA(0xc8);//0xc8  0xA8 0x08 0x68
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+200
        LDR.W    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  208 
//  209         LCD_ST7735S_WR_8CMD(0x2a);
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+42
        LDR.W    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  210         LCD_ST7735S_WR_8DATA(0x00);
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  211         LCD_ST7735S_WR_8DATA(0x02);
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+2
        LDR.W    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  212         LCD_ST7735S_WR_8DATA(0x00);
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  213         LCD_ST7735S_WR_8DATA(0x81);
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+129
        LDR.W    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  214 
//  215         LCD_ST7735S_WR_8CMD(0x2B);
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+43
        LDR.W    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  216         LCD_ST7735S_WR_8DATA(0x00);
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  217         LCD_ST7735S_WR_8DATA(0x03);
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+3
        LDR.W    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  218         LCD_ST7735S_WR_8DATA(0x00);
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  219         LCD_ST7735S_WR_8DATA(0x82);
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+130
        LDR.W    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  220 
//  221         st7735s_h   = ST7735S_H;
        MOVS     R0,#+128
        LDR.W    R1,??DataTable7_2
        STRH     R0,[R1, #+0]
//  222         st7735s_w   = ST7735S_W;
        MOVS     R0,#+128
        LDR.W    R1,??DataTable7_3
        STRH     R0,[R1, #+0]
//  223         break;
        B.N      ??LCD_ST7735S_dir_6
//  224     case 1:
//  225         LCD_ST7735S_WR_8CMD(0x36); // 内存数据访问控制  MX 列地址顺序, MY 行地址顺序 ，MV 行列交换 ，ML 垂直刷新顺序 ,RGB  RGB-BGA顺序
??LCD_ST7735S_dir_3:
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+54
        LDR.W    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  226         LCD_ST7735S_WR_8DATA(0xA8);//0xc8  0xA8 0x08 0x68
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+168
        LDR.W    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  227 
//  228         LCD_ST7735S_WR_8CMD(0x2a);
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+42
        LDR.W    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  229         LCD_ST7735S_WR_8DATA(0x00);
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  230         LCD_ST7735S_WR_8DATA(0x03);
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+3
        LDR.W    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  231         LCD_ST7735S_WR_8DATA(0x00);
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  232         LCD_ST7735S_WR_8DATA(0x82);
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+130
        LDR.W    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  233 
//  234         LCD_ST7735S_WR_8CMD(0x2B);
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+43
        LDR.W    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  235         LCD_ST7735S_WR_8DATA(0x00);
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  236         LCD_ST7735S_WR_8DATA(0x02);
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+2
        LDR.W    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  237         LCD_ST7735S_WR_8DATA(0x00);
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  238         LCD_ST7735S_WR_8DATA(0x81);
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+129
        LDR.W    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  239 
//  240         st7735s_h   = ST7735S_W;
        MOVS     R0,#+128
        LDR.W    R1,??DataTable7_2
        STRH     R0,[R1, #+0]
//  241         st7735s_w   = ST7735S_H;
        MOVS     R0,#+128
        LDR.W    R1,??DataTable7_3
        STRH     R0,[R1, #+0]
//  242         break;
        B.N      ??LCD_ST7735S_dir_6
//  243     case 2:
//  244         LCD_ST7735S_WR_8CMD(0x36); // 内存数据访问控制  MX 列地址顺序, MY 行地址顺序 ，MV 行列交换 ，ML 垂直刷新顺序 ,RGB  RGB-BGA顺序
??LCD_ST7735S_dir_2:
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+54
        LDR.W    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  245         LCD_ST7735S_WR_8DATA(0x08);//0xc8  0xA8 0x08 0x68
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+8
        LDR.W    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  246 
//  247         LCD_ST7735S_WR_8CMD(0x2a);
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+42
        LDR.W    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  248         LCD_ST7735S_WR_8DATA(0x00);
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  249         LCD_ST7735S_WR_8DATA(0x02);
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+2
        LDR.W    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  250         LCD_ST7735S_WR_8DATA(0x00);
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  251         LCD_ST7735S_WR_8DATA(0x81);
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+129
        LDR.W    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  252 
//  253         LCD_ST7735S_WR_8CMD(0x2B);
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+43
        LDR.N    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  254         LCD_ST7735S_WR_8DATA(0x00);
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  255         LCD_ST7735S_WR_8DATA(0x03);
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+3
        LDR.N    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  256         LCD_ST7735S_WR_8DATA(0x00);
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  257         LCD_ST7735S_WR_8DATA(0x82);
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+130
        LDR.N    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  258 
//  259         st7735s_h   = ST7735S_H;
        MOVS     R0,#+128
        LDR.W    R1,??DataTable7_2
        STRH     R0,[R1, #+0]
//  260         st7735s_w   = ST7735S_W;
        MOVS     R0,#+128
        LDR.W    R1,??DataTable7_3
        STRH     R0,[R1, #+0]
//  261         break;
        B.N      ??LCD_ST7735S_dir_6
//  262     case 3:
//  263         LCD_ST7735S_WR_8CMD(0x36); // 内存数据访问控制  MX 列地址顺序, MY 行地址顺序 ，MV 行列交换 ，ML 垂直刷新顺序 ,RGB  RGB-BGA顺序
??LCD_ST7735S_dir_4:
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+54
        LDR.N    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  264         LCD_ST7735S_WR_8DATA(0x68);//0xc8  0xA8 0x08 0x68
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+104
        LDR.N    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  265 
//  266         LCD_ST7735S_WR_8CMD(0x2a);
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+42
        LDR.N    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  267         LCD_ST7735S_WR_8DATA(0x00);
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  268         LCD_ST7735S_WR_8DATA(0x03);
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+3
        LDR.N    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  269         LCD_ST7735S_WR_8DATA(0x00);
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  270         LCD_ST7735S_WR_8DATA(0x82);
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+130
        LDR.N    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  271 
//  272         LCD_ST7735S_WR_8CMD(0x2B);
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+43
        LDR.N    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  273         LCD_ST7735S_WR_8DATA(0x00);
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  274         LCD_ST7735S_WR_8DATA(0x02);
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+2
        LDR.N    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  275         LCD_ST7735S_WR_8DATA(0x00);
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  276         LCD_ST7735S_WR_8DATA(0x81);
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_1  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+129
        LDR.N    R1,??DataTable3_3  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_4  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_2  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  277 
//  278         st7735s_h   = ST7735S_W;
        MOVS     R0,#+128
        LDR.N    R1,??DataTable7_2
        STRH     R0,[R1, #+0]
//  279         st7735s_w   = ST7735S_H;
        MOVS     R0,#+128
        LDR.N    R1,??DataTable7_3
        STRH     R0,[R1, #+0]
//  280         break;
        B.N      ??LCD_ST7735S_dir_6
//  281     default:
//  282         break;
//  283     }
//  284 
//  285 }
??LCD_ST7735S_dir_5:
??LCD_ST7735S_dir_6:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     0x43fe1028

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     0x43fe1030

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     0x43fe102c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     0x400ff080

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_4:
        DC32     0x43fe1024
//  286 
//  287 /*!
//  288  *  @brief      设置 ST7735S 开窗
//  289  *  @param      site        左上角坐标位置
//  290  *  @param      size        开窗大小
//  291  *  @since      v5.0
//  292  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function LCD_ST7735S_ptlon
          CFI NoCalls
        THUMB
//  293 void LCD_ST7735S_ptlon(Site_t site, Size_t size)
//  294 {
LCD_ST7735S_ptlon:
        PUSH     {R0,R1}
          CFI CFA R13+8
//  295     if(st7735s_dir&0x01)
        LDR.N    R0,??DataTable7
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+31
        BPL.N    ??LCD_ST7735S_ptlon_0
//  296     {
//  297         site.x += 3;     //液晶需要偏移一下，避免四周看不到的行
        LDRH     R0,[SP, #+0]
        ADDS     R0,R0,#+3
        STRH     R0,[SP, #+0]
//  298         site.y += 2;
        LDRH     R0,[SP, #+2]
        ADDS     R0,R0,#+2
        STRH     R0,[SP, #+2]
        B.N      ??LCD_ST7735S_ptlon_1
//  299     }
//  300     else
//  301     {
//  302         site.x += 2;     //液晶需要偏移一下，避免四周看不到的行
??LCD_ST7735S_ptlon_0:
        LDRH     R0,[SP, #+0]
        ADDS     R0,R0,#+2
        STRH     R0,[SP, #+0]
//  303         site.y += 3;
        LDRH     R0,[SP, #+2]
        ADDS     R0,R0,#+3
        STRH     R0,[SP, #+2]
//  304     }
//  305     LCD_ST7735S_WR_8CMD(0x2a);   //Partial Mode On  局部模式
??LCD_ST7735S_ptlon_1:
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_5  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_6  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+42
        LDR.N    R1,??DataTable7_7  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_8  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_8  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_6  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  306     LCD_ST7735S_WR_8DATA((uint8)(site.x >> 8)); //高8位 Sx
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_5  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_6  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        LDRH     R0,[SP, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        LDR.N    R1,??DataTable7_7  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_8  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_8  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_6  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  307     LCD_ST7735S_WR_8DATA((uint8)site.x);   //低8位 Sx
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_5  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_6  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        LDRH     R0,[SP, #+0]
        LDR.N    R1,??DataTable7_7  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_8  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_8  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_6  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  308     LCD_ST7735S_WR_8DATA((uint8)((site.x + size.W - 1) >> 8));
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_5  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_6  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        LDRH     R0,[SP, #+0]
        LDRH     R1,[SP, #+4]
        UXTAH    R0,R1,R0
        SUBS     R0,R0,#+1
        ASRS     R0,R0,#+8
        LDR.N    R1,??DataTable7_7  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_8  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_8  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_6  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  309     LCD_ST7735S_WR_8DATA((uint8)(site.x + size.W - 1));
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_5  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_6  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        LDRH     R0,[SP, #+0]
        LDRH     R1,[SP, #+4]
        ADDS     R0,R1,R0
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable7_7  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_8  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_8  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_6  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  310 
//  311     LCD_ST7735S_WR_8CMD(0x2B);//Row Address Set  行地址设置
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_5  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_6  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+43
        LDR.N    R1,??DataTable7_7  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_8  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_8  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_6  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  312     LCD_ST7735S_WR_8DATA((uint8)(site.y >> 8));
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_5  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_6  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        LDRH     R0,[SP, #+2]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        LDR.N    R1,??DataTable7_7  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_8  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_8  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_6  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  313     LCD_ST7735S_WR_8DATA((uint8)site.y);
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_5  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_6  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        LDRH     R0,[SP, #+2]
        LDR.N    R1,??DataTable7_7  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_8  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_8  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_6  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  314     LCD_ST7735S_WR_8DATA((uint8)((site.y + size.H - 1) >> 8));
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_5  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_6  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        LDRH     R0,[SP, #+2]
        LDRH     R1,[SP, #+6]
        UXTAH    R0,R1,R0
        SUBS     R0,R0,#+1
        ASRS     R0,R0,#+8
        LDR.N    R1,??DataTable7_7  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_8  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_8  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_6  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  315     LCD_ST7735S_WR_8DATA((uint8)(site.y + size.H - 1));
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_4  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_5  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_6  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        LDRH     R0,[SP, #+2]
        LDRH     R1,[SP, #+6]
        ADDS     R0,R1,R0
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable7_7  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_8  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_8  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable7_6  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  316 
//  317 }
        ADD      SP,SP,#+8
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock4
//  318 
//  319 /*!
//  320  *  @brief      获取 ST7735S 高度
//  321  *  @return     ILI9341 高度
//  322  *  @since      v5.0
//  323  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function ST7735S_get_h
          CFI NoCalls
        THUMB
//  324 uint16 ST7735S_get_h()
//  325 {
//  326     return st7735s_h;
ST7735S_get_h:
        LDR.N    R0,??DataTable7_2
        LDRH     R0,[R0, #+0]
        BX       LR               ;; return
          CFI EndBlock cfiBlock5
//  327 }
//  328 
//  329 /*!
//  330  *  @brief      获取 ST7735S 宽度
//  331  *  @return     ILI9341 宽度
//  332  *  @since      v5.0
//  333  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function ST7735S_get_w
          CFI NoCalls
        THUMB
//  334 uint16 ST7735S_get_w()
//  335 {
//  336     return st7735s_w;
ST7735S_get_w:
        LDR.N    R0,??DataTable7_3
        LDRH     R0,[R0, #+0]
        BX       LR               ;; return
          CFI EndBlock cfiBlock6
//  337 }
//  338 
//  339 /*!
//  340  *  @brief      获取 ST7735S 显示方向
//  341  *  @return     ST7735S 方向
//  342  *  @since      v5.0
//  343  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function ST7735S_get_dir
          CFI NoCalls
        THUMB
//  344 uint8 ST7735S_get_dir()
//  345 {
//  346     return st7735s_dir;
ST7735S_get_dir:
        LDR.N    R0,??DataTable7
        LDRB     R0,[R0, #+0]
        BX       LR               ;; return
          CFI EndBlock cfiBlock7
//  347 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC32     st7735s_dir

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_1:
        DC32     ?_0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_2:
        DC32     st7735s_h

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_3:
        DC32     st7735s_w

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_4:
        DC32     0x43fe1028

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_5:
        DC32     0x43fe1030

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_6:
        DC32     0x43fe102c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_7:
        DC32     0x400ff080

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_8:
        DC32     0x43fe1024

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
        DC8 4CH, 43H, 44H, 5FH, 53H, 54H, 37H, 37H
        DC8 33H, 35H, 53H, 2EH, 63H, 0
        DC8 0, 0

        END
//  348 
//  349 
//  350 
//  351 
// 
//     1 byte  in section .bss
//     4 bytes in section .data
//    64 bytes in section .rodata
// 7 320 bytes in section .text
// 
// 7 320 bytes of CODE  memory
//    64 bytes of CONST memory
//     5 bytes of DATA  memory
//
//Errors: none
//Warnings: none
