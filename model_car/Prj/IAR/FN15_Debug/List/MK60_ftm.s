///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       21/Mar/2017  16:04:51
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\znc\project\K60FN\network_car\Chip\src\MK60_ftm.c
//    Command line =  
//        E:\znc\project\K60FN\network_car\Chip\src\MK60_ftm.c -D DEBUG -D
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
//        E:\znc\project\K60FN\network_car\Prj\IAR\FN15_Debug\List\MK60_ftm.s
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

        PUBLIC FTM1_Input_test_handler
        PUBLIC FTMN
        PUBLIC ftm_input_clean
        PUBLIC ftm_input_get
        PUBLIC ftm_input_init
        PUBLIC ftm_pwm_duty
        PUBLIC ftm_pwm_freq
        PUBLIC ftm_pwm_init
        PUBLIC ftm_quad_clean
        PUBLIC ftm_quad_get
        PUBLIC ftm_quad_init
        
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
        
// E:\znc\project\K60FN\network_car\Chip\src\MK60_ftm.c
//    1 /*!
//    2  *     COPYRIGHT NOTICE
//    3  *     Copyright (c) 2013,山外科技
//    4  *     All rights reserved.
//    5  *     技术讨论：山外论坛 http://www.vcan123.com
//    6  *
//    7  *     除注明出处外，以下所有内容版权均属山外科技所有，未经允许，不得用于商业用途，
//    8  *     修改内容时必须保留山外科技的版权声明。
//    9  *
//   10  * @file       MK60_ftm.c
//   11  * @brief      FTM定时器函数库
//   12  * @author     山外科技
//   13  * @version    v5.2
//   14  * @date       2014-10-31
//   15  */
//   16 
//   17 
//   18 /*
//   19  * 包含头文件
//   20  */
//   21 #include "common.h"
//   22 #include  "MK60_FTM.h"
//   23 
//   24 /*
//   25  * 定义数组
//   26  */

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   27 FTM_MemMapPtr FTMN[FTM_MAX] = {FTM0_BASE_PTR, FTM1_BASE_PTR, FTM2_BASE_PTR
FTMN:
        DATA
        DC32 40038000H, 40039000H, 400B8000H, 400B9000H
//   28 #ifdef MK60F15
//   29 , FTM3_BASE_PTR         //FX 才有FTM3
//   30 #endif
//   31 }; //定义三个指针数组保存 FTMn_e 的地址
//   32 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   33 static uint32 ftm_mod[FTM_MAX];
ftm_mod:
        DS8 16
//   34 
//   35 /*!
//   36  *  @brief      初始化FTM 的端口
//   37  *  @param      FTMn_e    模块号（FTM0、  FTM1、  FTM2）
//   38  *  @param      FTM_CHn_e     通道号（CH0~CH7）
//   39  *  @since      v5.0
//   40  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function FTM_port_mux
        THUMB
//   41 static void FTM_port_mux(FTMn_e ftmn, FTM_CHn_e ch)
//   42 {
FTM_port_mux:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
//   43     /******************* 开启时钟 和 复用IO口*******************/
//   44     switch(ftmn)
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??FTM_port_mux_0
        CMP      R4,#+2
        BEQ.N    ??FTM_port_mux_1
        BCC.N    ??FTM_port_mux_2
        CMP      R4,#+3
        BEQ.W    ??FTM_port_mux_3
        B.N      ??FTM_port_mux_4
//   45     {
//   46     case FTM0:
//   47         SIM_SCGC6 |= SIM_SCGC6_FTM0_MASK;       //使能FTM0时钟
??FTM_port_mux_0:
        LDR.W    R0,??DataTable10  ;; 0x4004803c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000000
        LDR.W    R1,??DataTable10  ;; 0x4004803c
        STR      R0,[R1, #+0]
//   48         switch(ch)
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??FTM_port_mux_5
        CMP      R5,#+2
        BEQ.N    ??FTM_port_mux_6
        BCC.N    ??FTM_port_mux_7
        CMP      R5,#+4
        BEQ.N    ??FTM_port_mux_8
        BCC.N    ??FTM_port_mux_9
        CMP      R5,#+6
        BEQ.N    ??FTM_port_mux_10
        BCC.N    ??FTM_port_mux_11
        CMP      R5,#+7
        BEQ.N    ??FTM_port_mux_12
        B.N      ??FTM_port_mux_13
//   49         {
//   50         case FTM_CH0:
//   51             if(FTM0_CH0_PIN == PTC1)
//   52             {
//   53                 port_init(FTM0_CH0_PIN, ALT4);
??FTM_port_mux_5:
        MOV      R1,#+1024
        MOVS     R0,#+65
          CFI FunCall port_init
        BL       port_init
//   54             }
//   55             else if(FTM0_CH0_PIN == PTA3)
//   56             {
//   57                 port_init(FTM0_CH0_PIN, ALT3);
//   58             }
//   59             else
//   60             {
//   61                 ASSERT(0);                      //设置管脚有误？
//   62             }
//   63             break;
        B.N      ??FTM_port_mux_14
//   64 
//   65         case FTM_CH1:
//   66             if(FTM0_CH1_PIN == PTC2)
//   67             {
//   68                 port_init(FTM0_CH1_PIN, ALT4);
//   69             }
//   70             else if(FTM0_CH1_PIN == PTA4)
//   71             {
//   72                 port_init(FTM0_CH1_PIN, ALT3);
??FTM_port_mux_7:
        MOV      R1,#+768
        MOVS     R0,#+4
          CFI FunCall port_init
        BL       port_init
//   73             }
//   74             else
//   75             {
//   76                 ASSERT(0);                      //设置管脚有误？
//   77             }
//   78             break;
        B.N      ??FTM_port_mux_14
//   79 
//   80         case FTM_CH2:
//   81             if(FTM0_CH2_PIN == PTC3)
//   82             {
//   83                 port_init(FTM0_CH2_PIN, ALT4);
//   84             }
//   85             else if(FTM0_CH2_PIN == PTA5)
//   86             {
//   87                 port_init(FTM0_CH2_PIN, ALT3);
??FTM_port_mux_6:
        MOV      R1,#+768
        MOVS     R0,#+5
          CFI FunCall port_init
        BL       port_init
//   88             }
//   89             else
//   90             {
//   91                 ASSERT(0);                      //设置管脚有误？
//   92             }
//   93             break;
        B.N      ??FTM_port_mux_14
//   94 
//   95         case FTM_CH3:
//   96             if(FTM0_CH3_PIN == PTC4)
//   97             {
//   98                 port_init(FTM0_CH3_PIN, ALT4);
//   99             }
//  100             else if(FTM0_CH3_PIN == PTA6)
//  101             {
//  102                 port_init(FTM0_CH3_PIN, ALT3);
??FTM_port_mux_9:
        MOV      R1,#+768
        MOVS     R0,#+6
          CFI FunCall port_init
        BL       port_init
//  103             }
//  104             else
//  105             {
//  106                 ASSERT(0);                      //设置管脚有误？
//  107             }
//  108             break;
        B.N      ??FTM_port_mux_14
//  109 
//  110         case FTM_CH4:
//  111             if(FTM0_CH4_PIN == PTD4)
//  112             {
//  113                 port_init(FTM0_CH4_PIN, ALT4);
//  114             }
//  115             else if(FTM0_CH4_PIN == PTA7)
//  116             {
//  117                 port_init(FTM0_CH4_PIN, ALT3);
??FTM_port_mux_8:
        MOV      R1,#+768
        MOVS     R0,#+7
          CFI FunCall port_init
        BL       port_init
//  118             }
//  119             else
//  120             {
//  121                 ASSERT(0);                      //设置管脚有误？
//  122             }
//  123             break;
        B.N      ??FTM_port_mux_14
//  124 
//  125         case FTM_CH5:
//  126             if(FTM0_CH5_PIN == PTD5)
//  127             {
//  128                 port_init(FTM0_CH5_PIN, ALT4);
??FTM_port_mux_11:
        MOV      R1,#+1024
        MOVS     R0,#+101
          CFI FunCall port_init
        BL       port_init
//  129             }
//  130             else if(FTM0_CH5_PIN == PTA0)
//  131             {
//  132                 port_init(FTM0_CH5_PIN, ALT3);
//  133             }
//  134             else
//  135             {
//  136                 ASSERT(0);                      //设置管脚有误？
//  137             }
//  138             break;
        B.N      ??FTM_port_mux_14
//  139 
//  140         case FTM_CH6:
//  141             if(FTM0_CH6_PIN == PTD6)
//  142             {
//  143                 port_init(FTM0_CH6_PIN, ALT4);
??FTM_port_mux_10:
        MOV      R1,#+1024
        MOVS     R0,#+102
          CFI FunCall port_init
        BL       port_init
//  144             }
//  145             else if(FTM0_CH6_PIN == PTA1)
//  146             {
//  147                 port_init(FTM0_CH6_PIN, ALT3);
//  148             }
//  149             else
//  150             {
//  151                 ASSERT(0);                      //设置管脚有误？
//  152             }
//  153             break;
        B.N      ??FTM_port_mux_14
//  154 
//  155         case FTM_CH7:
//  156             if(FTM0_CH7_PIN == PTD7)
//  157             {
//  158                 port_init(FTM0_CH7_PIN, ALT4);
??FTM_port_mux_12:
        MOV      R1,#+1024
        MOVS     R0,#+103
          CFI FunCall port_init
        BL       port_init
//  159             }
//  160             else if(FTM0_CH7_PIN == PTA2)
//  161             {
//  162                 port_init(FTM0_CH7_PIN, ALT3);
//  163             }
//  164             else
//  165             {
//  166                 ASSERT(0);                      //设置管脚有误？
//  167             }
//  168             break;
        B.N      ??FTM_port_mux_14
//  169         default:
//  170             return;
??FTM_port_mux_13:
        B.N      ??FTM_port_mux_15
//  171         }
//  172         break;
??FTM_port_mux_14:
        B.N      ??FTM_port_mux_16
//  173 
//  174     case FTM1:
//  175         SIM_SCGC6 |= SIM_SCGC6_FTM1_MASK;       //使能FTM1时钟
??FTM_port_mux_2:
        LDR.W    R0,??DataTable10  ;; 0x4004803c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2000000
        LDR.W    R1,??DataTable10  ;; 0x4004803c
        STR      R0,[R1, #+0]
//  176         switch(ch)
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??FTM_port_mux_17
        CMP      R5,#+1
        BEQ.N    ??FTM_port_mux_18
        B.N      ??FTM_port_mux_19
//  177         {
//  178         case FTM_CH0:
//  179             if((FTM1_CH0_PIN == PTA8) || (FTM1_CH0_PIN == PTA12) || (FTM1_CH0_PIN == PTB0) )
//  180             {
//  181                 port_init(FTM1_CH0_PIN, ALT3);
??FTM_port_mux_17:
        MOV      R1,#+768
        MOVS     R0,#+12
          CFI FunCall port_init
        BL       port_init
//  182             }
//  183             else
//  184             {
//  185                 ASSERT(0);                      //设置管脚有误？
//  186             }
//  187             break;
        B.N      ??FTM_port_mux_20
//  188 
//  189 
//  190         case FTM_CH1:
//  191             if((FTM1_CH1_PIN == PTA9) || (FTM1_CH1_PIN == PTA13) || (FTM1_CH1_PIN == PTB1) )
//  192             {
//  193                 port_init(FTM1_CH1_PIN, ALT3);
??FTM_port_mux_18:
        MOV      R1,#+768
        MOVS     R0,#+13
          CFI FunCall port_init
        BL       port_init
//  194             }
//  195             else
//  196             {
//  197                 ASSERT(0);                      //设置管脚有误？
//  198             }
//  199             break;
        B.N      ??FTM_port_mux_20
//  200 
//  201         default:
//  202             return;
??FTM_port_mux_19:
        B.N      ??FTM_port_mux_15
//  203         }
//  204         break;
??FTM_port_mux_20:
        B.N      ??FTM_port_mux_16
//  205 
//  206     case FTM2:
//  207         SIM_SCGC3 |= SIM_SCGC3_FTM2_MASK;                           //使能FTM2时钟
??FTM_port_mux_1:
        LDR.W    R0,??DataTable10_1  ;; 0x40048030
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000000
        LDR.W    R1,??DataTable10_1  ;; 0x40048030
        STR      R0,[R1, #+0]
//  208         switch(ch)
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??FTM_port_mux_21
        CMP      R5,#+1
        BEQ.N    ??FTM_port_mux_22
        B.N      ??FTM_port_mux_23
//  209         {
//  210         case FTM_CH0:
//  211             if((FTM2_CH0_PIN == PTA10) || (FTM2_CH0_PIN == PTB18) )
//  212             {
//  213                 port_init(FTM2_CH0_PIN, ALT3);
??FTM_port_mux_21:
        MOV      R1,#+768
        MOVS     R0,#+50
          CFI FunCall port_init
        BL       port_init
//  214             }
//  215             else
//  216             {
//  217                 ASSERT(0);                      //设置管脚有误？
//  218             }
//  219             break;
        B.N      ??FTM_port_mux_24
//  220 
//  221         case FTM_CH1:
//  222             if((FTM2_CH1_PIN == PTA11) || (FTM2_CH1_PIN == PTB19))
//  223             {
//  224                 port_init(FTM2_CH1_PIN, ALT3);
??FTM_port_mux_22:
        MOV      R1,#+768
        MOVS     R0,#+51
          CFI FunCall port_init
        BL       port_init
//  225             }
//  226             else
//  227             {
//  228                 ASSERT(0);                      //设置管脚有误？
//  229             }
//  230             break;
        B.N      ??FTM_port_mux_24
//  231 
//  232         default:
//  233             return;
??FTM_port_mux_23:
        B.N      ??FTM_port_mux_15
//  234         }
//  235         break;
??FTM_port_mux_24:
        B.N      ??FTM_port_mux_16
//  236 #ifdef MK60F15
//  237     case FTM3:
//  238         SIM_SCGC3 |= SIM_SCGC3_FTM3_MASK;       //使能FTM3时钟
??FTM_port_mux_3:
        LDR.W    R0,??DataTable10_1  ;; 0x40048030
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2000000
        LDR.W    R1,??DataTable10_1  ;; 0x40048030
        STR      R0,[R1, #+0]
//  239         switch(ch)
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??FTM_port_mux_25
        CMP      R5,#+2
        BEQ.N    ??FTM_port_mux_26
        BCC.N    ??FTM_port_mux_27
        CMP      R5,#+4
        BEQ.N    ??FTM_port_mux_28
        BCC.N    ??FTM_port_mux_29
        CMP      R5,#+6
        BEQ.N    ??FTM_port_mux_30
        BCC.N    ??FTM_port_mux_31
        CMP      R5,#+7
        BEQ.N    ??FTM_port_mux_32
        B.N      ??FTM_port_mux_33
//  240         {
//  241         case FTM_CH0:
//  242             if(FTM3_CH0_PIN == PTD0)
//  243             {
//  244                 port_init(FTM3_CH0_PIN, ALT4);
//  245             }
//  246             else if(FTM3_CH0_PIN == PTE5)
//  247             {
//  248                 port_init(FTM3_CH0_PIN, ALT6);
??FTM_port_mux_25:
        MOV      R1,#+1536
        MOVS     R0,#+133
          CFI FunCall port_init
        BL       port_init
//  249             }
//  250             else
//  251             {
//  252                 ASSERT(0);                      //设置管脚有误？
//  253             }
//  254             break;
        B.N      ??FTM_port_mux_33
//  255 
//  256         case FTM_CH1:
//  257             if(FTM3_CH1_PIN == PTD1)
//  258             {
//  259                 port_init(FTM3_CH1_PIN, ALT4);
//  260             }
//  261             else if(FTM3_CH1_PIN == PTE6)
//  262             {
//  263                 port_init(FTM3_CH1_PIN, ALT6);
??FTM_port_mux_27:
        MOV      R1,#+1536
        MOVS     R0,#+134
          CFI FunCall port_init
        BL       port_init
//  264             }
//  265             else
//  266             {
//  267                 ASSERT(0);                      //设置管脚有误？
//  268             }
//  269             break;
        B.N      ??FTM_port_mux_33
//  270 
//  271         case FTM_CH2:
//  272             if(FTM3_CH2_PIN == PTD2)
//  273             {
//  274                 port_init(FTM3_CH2_PIN, ALT4);
//  275             }
//  276             else if(FTM3_CH2_PIN == PTE7)
//  277             {
//  278                 port_init(FTM3_CH2_PIN, ALT6);
??FTM_port_mux_26:
        MOV      R1,#+1536
        MOVS     R0,#+135
          CFI FunCall port_init
        BL       port_init
//  279             }
//  280             else
//  281             {
//  282                 ASSERT(0);                      //设置管脚有误？
//  283             }
//  284             break;
        B.N      ??FTM_port_mux_33
//  285 
//  286         case FTM_CH3:
//  287             if(FTM3_CH3_PIN == PTD3)
//  288             {
//  289                 port_init(FTM3_CH3_PIN, ALT4);
//  290             }
//  291             else if(FTM3_CH3_PIN == PTE8)
//  292             {
//  293                 port_init(FTM3_CH3_PIN, ALT6);
??FTM_port_mux_29:
        MOV      R1,#+1536
        MOVS     R0,#+136
          CFI FunCall port_init
        BL       port_init
//  294             }
//  295             else
//  296             {
//  297                 ASSERT(0);                      //设置管脚有误？
//  298             }
//  299             break;
        B.N      ??FTM_port_mux_33
//  300 
//  301         case FTM_CH4:
//  302             if(FTM3_CH4_PIN == PTC8)
//  303             {
//  304                 port_init(FTM3_CH4_PIN, ALT3);
//  305             }
//  306             else if(FTM3_CH4_PIN == PTE9)
//  307             {
//  308                 port_init(FTM3_CH4_PIN, ALT6);
??FTM_port_mux_28:
        MOV      R1,#+1536
        MOVS     R0,#+137
          CFI FunCall port_init
        BL       port_init
//  309             }
//  310             else
//  311             {
//  312                 ASSERT(0);                      //设置管脚有误？
//  313             }
//  314             break;
        B.N      ??FTM_port_mux_33
//  315 
//  316         case FTM_CH5:
//  317             if(FTM3_CH5_PIN == PTC9)
//  318             {
//  319                 port_init(FTM3_CH5_PIN, ALT3);
//  320             }
//  321             else if(FTM3_CH5_PIN == PTE10)
//  322             {
//  323                 port_init(FTM3_CH5_PIN, ALT6);
??FTM_port_mux_31:
        MOV      R1,#+1536
        MOVS     R0,#+138
          CFI FunCall port_init
        BL       port_init
//  324             }
//  325             else
//  326             {
//  327                 ASSERT(0);                      //设置管脚有误？
//  328             }
//  329             break;
        B.N      ??FTM_port_mux_33
//  330 
//  331         case FTM_CH6:
//  332             if(FTM3_CH6_PIN == PTC10)
//  333             {
//  334                 port_init(FTM3_CH6_PIN, ALT3);
//  335             }
//  336             else if(FTM3_CH6_PIN == PTE11)
//  337             {
//  338                 port_init(FTM3_CH6_PIN, ALT6);
??FTM_port_mux_30:
        MOV      R1,#+1536
        MOVS     R0,#+139
          CFI FunCall port_init
        BL       port_init
//  339             }
//  340             else
//  341             {
//  342                 ASSERT(0);                      //设置管脚有误？
//  343             }
//  344             break;
        B.N      ??FTM_port_mux_33
//  345 
//  346         case FTM_CH7:
//  347             if(FTM3_CH7_PIN == PTC11)
//  348             {
//  349                 port_init(FTM3_CH7_PIN, ALT3);
//  350             }
//  351             else if(FTM3_CH7_PIN == PTE12)
//  352             {
//  353                 port_init(FTM3_CH7_PIN, ALT6);
??FTM_port_mux_32:
        MOV      R1,#+1536
        MOVS     R0,#+140
          CFI FunCall port_init
        BL       port_init
//  354             }
//  355             else
//  356             {
//  357                 ASSERT(0);                      //设置管脚有误？
//  358             }
//  359         }
//  360         break;
??FTM_port_mux_33:
        B.N      ??FTM_port_mux_16
//  361 
//  362 #endif
//  363     default:
//  364         break;
//  365     }
//  366 }
??FTM_port_mux_4:
??FTM_port_mux_16:
??FTM_port_mux_15:
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock0
//  367 
//  368 /*!
//  369  *  @brief      初始化FTM 的PWM 功能
//  370  *  @param      FTMn_e    模块号（FTM0、  FTM1、  FTM2）
//  371  *  @param      FTM_CHn_e     通道号（CH0~CH7）
//  372  *  @param      freq    频率（单位为Hz）
//  373  *  @param      duty    占空比分子，占空比 = duty / FTMn_PRECISON
//  374  *  @since      v5.0
//  375  *  @note       同一个FTM，PWM频率是必须一样的，但占空比可不一样。共3个FTM，即可以输出3个不同频率PWM
//  376  *  Sample usage:       ftm_pwm_init(FTM0, FTM_CH6,200, 10);    //初始化 FTM0_CH6 为 频率 200Hz 的PWM，占空比为 10/FTM0_PRECISON
//  377  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function ftm_pwm_init
        THUMB
//  378 void ftm_pwm_init(FTMn_e ftmn, FTM_CHn_e ch, uint32 freq, uint32 duty)
//  379 {
ftm_pwm_init:
        PUSH     {R3-R11,LR}
          CFI R14 Frame(CFA, -4)
          CFI R11 Frame(CFA, -8)
          CFI R10 Frame(CFA, -12)
          CFI R9 Frame(CFA, -16)
          CFI R8 Frame(CFA, -20)
          CFI R7 Frame(CFA, -24)
          CFI R6 Frame(CFA, -28)
          CFI R5 Frame(CFA, -32)
          CFI R4 Frame(CFA, -36)
          CFI CFA R13+40
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
//  380     uint32 clk_hz ;
//  381     uint16 mod;
//  382     uint8  ps;
//  383     uint16 cv;
//  384 
//  385     ASSERT( (ftmn == FTM0) || ( (ftmn == FTM1 || ftmn == FTM2 ) && (ch <= FTM_CH1))
//  386 #ifdef MK60F15
//  387             || (ftmn == FTM3)       //FX  有FTM3
//  388 #endif
//  389            );  //检查传递进来的通道是否正确
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??ftm_pwm_init_0
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+1
        BEQ.N    ??ftm_pwm_init_1
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+2
        BNE.N    ??ftm_pwm_init_2
??ftm_pwm_init_1:
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+2
        BLT.N    ??ftm_pwm_init_0
??ftm_pwm_init_2:
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+3
        BEQ.N    ??ftm_pwm_init_0
        MOVW     R1,#+389
        LDR.W    R0,??DataTable10_2
          CFI FunCall assert_failed
        BL       assert_failed
//  390 
//  391     /******************* 开启时钟 和 复用IO口*******************/
//  392     FTM_port_mux(ftmn,ch);
??ftm_pwm_init_0:
        MOVS     R1,R5
        SXTB     R1,R1            ;; SignExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
          CFI FunCall FTM_port_mux
        BL       FTM_port_mux
//  393 
//  394     /*       计算频率设置        */
//  395     //  若 CPWMS = 1 ，即双边捕捉脉冲，则 PMW频率 =  bus频率 /2 /(2^预分频因子)/模数
//  396     //  若 CPWMS = 0 ，即单边捕捉脉冲，则 PMW频率 =  bus频率    /(2^预分频因子)/模数
//  397     //  EPWM的周期 ：MOD - CNTIN + 0x0001   (CNTIN 设为0)
//  398     //  脉冲宽度：CnV - CNTIN
//  399 
//  400     //  模数 MOD < 0x10000
//  401     //  预分频因子 PS  < 0x07
//  402     //  预分频因子 PS 越小时，模数 mod 就越大，计数就越精准，PWM输出更为准确
//  403     //  MOD  = clk_hz/(freq*(1 << PS)) < 0x10000  ==>  clk_hz/(freq*0x10000) < (1<< PS)  ==>  (clk_hz/(freq*0x10000) >> PS) < 1
//  404     //  即 (((clk_hz/0x10000 )/ freq ) >> PS ) < 1
//  405 
//  406     // 以 CPWMS = 0 ，即单边捕捉脉冲为例
//  407     clk_hz = (bus_clk_khz * 1000) ;     // bus频率
        LDR.W    R0,??DataTable10_3
        LDR      R0,[R0, #+0]
        MOV      R1,#+1000
        MULS     R0,R1,R0
        MOV      R8,R0
//  408 
//  409     mod = (clk_hz >> 16 ) / freq ;      // 临时用 mod 缓存一下
        LSRS     R0,R8,#+16
        UDIV     R0,R0,R6
        MOV      R9,R0
//  410     ps = 0;
        MOVS     R0,#+0
        MOV      R10,R0
//  411     while((mod >> ps) >= 1)             // 等 (mod >> ps) < 1 才退出 while 循环 ，即求 PS 的最小值
??ftm_pwm_init_3:
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        ASRS     R0,R9,R10
        CMP      R0,#+1
        BLT.N    ??ftm_pwm_init_4
//  412     {
//  413         ps++;
        ADDS     R10,R10,#+1
        B.N      ??ftm_pwm_init_3
//  414     }
//  415 
//  416     ASSERT(ps <= 0x07);                 // 断言， PS 最大为 0x07 ，超过此值，则 PWM频率设置过低，或 Bus 频率过高
??ftm_pwm_init_4:
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        CMP      R10,#+8
        BLT.N    ??ftm_pwm_init_5
        MOV      R1,#+416
        LDR.W    R0,??DataTable10_2
          CFI FunCall assert_failed
        BL       assert_failed
//  417 
//  418     mod = (clk_hz >> ps) / freq;        // 求 MOD 的值
??ftm_pwm_init_5:
        LSRS     R0,R8,R10
        UDIV     R0,R0,R6
        MOV      R9,R0
//  419 
//  420     ftm_mod[ftmn]=mod;
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        LDR.W    R0,??DataTable10_4
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        STR      R9,[R0, R4, LSL #+2]
//  421 
//  422     switch(ftmn)                        // 初值 CNTIN 设为0 ，脉冲宽度：CnV - CNTIN ，即 CnV 就是 脉冲宽度了。
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??ftm_pwm_init_6
        CMP      R4,#+2
        BEQ.N    ??ftm_pwm_init_7
        BCC.N    ??ftm_pwm_init_8
        CMP      R4,#+3
        BEQ.N    ??ftm_pwm_init_9
        B.N      ??ftm_pwm_init_10
//  423     {
//  424         // EPWM的周期 ： MOD - CNTIN + 0x0001 == MOD - 0 + 1
//  425         // 则 CnV = (MOD - 0 + 1) * 占空比 = (MOD - 0 + 1) * duty/ FTM_PRECISON
//  426     case FTM0:
//  427         cv = (duty * (mod - 0 + 1)) / FTM0_PRECISON;
??ftm_pwm_init_6:
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        ADDS     R0,R9,#+1
        MUL      R0,R0,R7
        MOVW     R1,#+10000
        UDIV     R0,R0,R1
        MOV      R11,R0
//  428         break;
        B.N      ??ftm_pwm_init_11
//  429 
//  430     case FTM1:
//  431         cv = (duty * (mod - 0 + 1)) / FTM1_PRECISON;
??ftm_pwm_init_8:
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        ADDS     R0,R9,#+1
        MUL      R0,R0,R7
        MOVW     R1,#+10000
        UDIV     R0,R0,R1
        MOV      R11,R0
//  432         break;
        B.N      ??ftm_pwm_init_11
//  433 
//  434     case FTM2:
//  435         cv = (duty * (mod - 0 + 1)) / FTM2_PRECISON;
??ftm_pwm_init_7:
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        ADDS     R0,R9,#+1
        MUL      R0,R0,R7
        MOVW     R1,#+10000
        UDIV     R0,R0,R1
        MOV      R11,R0
//  436         break;
        B.N      ??ftm_pwm_init_11
//  437 #ifdef MK60F15
//  438     case FTM3:
//  439         cv = (duty * (mod - 0 + 1)) / FTM3_PRECISON;
??ftm_pwm_init_9:
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        ADDS     R0,R9,#+1
        MUL      R0,R0,R7
        MOVW     R1,#+10000
        UDIV     R0,R0,R1
        MOV      R11,R0
//  440         break;
        B.N      ??ftm_pwm_init_11
//  441 #endif
//  442 
//  443     default:
//  444         break;
//  445     }
//  446 
//  447     /******************** 选择输出模式为 边沿对齐PWM *******************/
//  448     //通道状态控制，根据模式来选择 边沿或电平
//  449     FTM_CnSC_REG(FTMN[ftmn], ch) &= ~FTM_CnSC_ELSA_MASK;
??ftm_pwm_init_10:
??ftm_pwm_init_11:
        LDR.W    R0,??DataTable10_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        ADDS     R0,R0,R5, LSL #+3
        LDR.W    R1,??DataTable10_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        ADDS     R1,R1,R5, LSL #+3
        LDR      R1,[R1, #+12]
        BICS     R1,R1,#0x4
        STR      R1,[R0, #+12]
//  450     FTM_CnSC_REG(FTMN[ftmn], ch)  = FTM_CnSC_MSB_MASK | FTM_CnSC_ELSB_MASK;
        LDR.W    R0,??DataTable10_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        ADDS     R0,R0,R5, LSL #+3
        MOVS     R1,#+40
        STR      R1,[R0, #+12]
//  451     // MSnB:MSnA = 1x       边沿对齐PWM
//  452     // ELSnB:ELSnA = 10     先高后低
//  453     // ELSnB:ELSnA = 11     先低后高
//  454 
//  455     /******************** 配置时钟和分频 ********************/
//  456     FTM_SC_REG(FTMN[ftmn])    = ( 0
//  457                                   //| FTM_SC_CPWMS_MASK         //0：上升沿计数模式 ，1： 跳变沿计数模式选择 （注释了表示 0）
//  458                                   | FTM_SC_PS(ps)             //分频因子，分频系数 = 2^PS
//  459                                   | FTM_SC_CLKS(1)            //时钟选择， 0：没选择时钟，禁用； 1：bus 时钟； 2：MCGFFCLK； 3：EXTCLK（ 由SIM_SOPT4 选择输入管脚 FTM_CLKINx）
//  460                                   //| FTM_SC_TOIE_MASK        //溢出中断使能（注释了表示 禁止溢出中断）
//  461                                 );
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        ANDS     R0,R10,#0x7
        ORRS     R0,R0,#0x8
        LDR.W    R1,??DataTable10_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        STR      R0,[R1, #+0]
//  462     FTM_MOD_REG(FTMN[ftmn])   = mod;                        //模数, EPWM的周期为 ：MOD - CNTIN + 0x0001
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        LDR.W    R0,??DataTable10_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        STR      R9,[R0, #+8]
//  463     FTM_CNTIN_REG(FTMN[ftmn]) = 0;                          //计数器初始化值。设置脉冲宽度：(CnV - CNTIN).
        MOVS     R0,#+0
        LDR.W    R1,??DataTable10_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        STR      R0,[R1, #+76]
//  464     FTM_CnV_REG(FTMN[ftmn], ch) = cv;
        LDR.W    R0,??DataTable10_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        ADDS     R0,R0,R5, LSL #+3
        UXTH     R11,R11          ;; ZeroExt  R11,R11,#+16,#+16
        STR      R11,[R0, #+16]
//  465     FTM_CNT_REG(FTMN[ftmn])   = 0;                          //计数器。只有低16位可用（写任何值到此寄存器，都会加载 CNTIN 的值）
        MOVS     R0,#+0
        LDR.W    R1,??DataTable10_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        STR      R0,[R1, #+4]
//  466 }
        POP      {R0,R4-R11,PC}   ;; return
          CFI EndBlock cfiBlock1
//  467 
//  468 /*!
//  469  *  @brief      设置FTM 的PWM 通道占空比
//  470  *  @param      FTMn_e    模块号（FTM0、  FTM1、  FTM2）
//  471  *  @param      FTM_CHn_e     通道号（CH0~CH7）
//  472  *  @param      duty    占空比分子，占空比 = duty / FTMn_PRECISON
//  473  *  @since      v5.0
//  474  *  @note       同一个FTM，PWM频率是必须一样的，但占空比可不一样。共3个FTM，即可以输出3个不同频率PWM
//  475  *  Sample usage:       ftm_pwm_duty(FTM0, FTM_CH6, 10);    //设置 FTM0_CH6占空比为 10/FTM0_PRECISON
//  476  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function ftm_pwm_duty
        THUMB
//  477 void ftm_pwm_duty(FTMn_e ftmn, FTM_CHn_e ch, uint32 duty)
//  478 {
ftm_pwm_duty:
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
//  479     uint32 cv;
//  480     uint32 mod = 0;
        MOVS     R8,#+0
//  481 
//  482     ASSERT( (ftmn == FTM0) || ( (ftmn == FTM1 || ftmn == FTM2 ) && (ch <= FTM_CH1))
//  483 #ifdef MK60F15
//  484             || (ftmn == FTM3)       //FX  有FTM3
//  485 #endif
//  486            );  //检查传递进来的通道是否正确
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??ftm_pwm_duty_0
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+1
        BEQ.N    ??ftm_pwm_duty_1
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+2
        BNE.N    ??ftm_pwm_duty_2
??ftm_pwm_duty_1:
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+2
        BLT.N    ??ftm_pwm_duty_0
??ftm_pwm_duty_2:
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+3
        BEQ.N    ??ftm_pwm_duty_0
        MOV      R1,#+486
        LDR.W    R0,??DataTable10_2
          CFI FunCall assert_failed
        BL       assert_failed
//  487 
//  488     switch(ftmn)
??ftm_pwm_duty_0:
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??ftm_pwm_duty_3
        CMP      R4,#+2
        BEQ.N    ??ftm_pwm_duty_4
        BCC.N    ??ftm_pwm_duty_5
        CMP      R4,#+3
        BEQ.N    ??ftm_pwm_duty_6
        B.N      ??ftm_pwm_duty_7
//  489     {
//  490         //如果此处断言失败，说明占空比超过 100% ，务必自行检查是否出现这情况。
//  491     case FTM0:
//  492         ASSERT(duty <= FTM0_PRECISON);     //用断言检测 占空比是否合理
??ftm_pwm_duty_3:
        MOVW     R0,#+10001
        CMP      R6,R0
        BCC.N    ??ftm_pwm_duty_8
        MOV      R1,#+492
        LDR.W    R0,??DataTable10_2
          CFI FunCall assert_failed
        BL       assert_failed
//  493         break;
??ftm_pwm_duty_8:
        B.N      ??ftm_pwm_duty_9
//  494 
//  495     case FTM1:
//  496         ASSERT(duty <= FTM1_PRECISON);     //用断言检测 占空比是否合理
??ftm_pwm_duty_5:
        MOVW     R0,#+10001
        CMP      R6,R0
        BCC.N    ??ftm_pwm_duty_10
        MOV      R1,#+496
        LDR.W    R0,??DataTable10_2
          CFI FunCall assert_failed
        BL       assert_failed
//  497         break;
??ftm_pwm_duty_10:
        B.N      ??ftm_pwm_duty_9
//  498 
//  499     case FTM2:
//  500         ASSERT(duty <= FTM2_PRECISON);     //用断言检测 占空比是否合理
??ftm_pwm_duty_4:
        MOVW     R0,#+10001
        CMP      R6,R0
        BCC.N    ??ftm_pwm_duty_11
        MOV      R1,#+500
        LDR.W    R0,??DataTable10_2
          CFI FunCall assert_failed
        BL       assert_failed
//  501         break;
??ftm_pwm_duty_11:
        B.N      ??ftm_pwm_duty_9
//  502 
//  503 #ifdef MK60F15
//  504     case FTM3:
//  505         ASSERT(duty <= FTM3_PRECISON);     //用断言检测 占空比是否合理
??ftm_pwm_duty_6:
        MOVW     R0,#+10001
        CMP      R6,R0
        BCC.N    ??ftm_pwm_duty_12
        MOVW     R1,#+505
        LDR.W    R0,??DataTable10_2
          CFI FunCall assert_failed
        BL       assert_failed
//  506         break;
??ftm_pwm_duty_12:
        B.N      ??ftm_pwm_duty_9
//  507 #endif
//  508 
//  509     default:
//  510         break;
//  511     }
//  512 
//  513 
//  514     //占空比 = (CnV-CNTIN)/(MOD-CNTIN+1
//  515     mod=ftm_mod[ftmn];
??ftm_pwm_duty_7:
??ftm_pwm_duty_9:
        LDR.W    R0,??DataTable10_4
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        MOV      R8,R0
//  516 
//  517 
//  518     switch(ftmn)
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??ftm_pwm_duty_13
        CMP      R4,#+2
        BEQ.N    ??ftm_pwm_duty_14
        BCC.N    ??ftm_pwm_duty_15
        CMP      R4,#+3
        BEQ.N    ??ftm_pwm_duty_16
        B.N      ??ftm_pwm_duty_17
//  519     {
//  520     case FTM0:
//  521         cv = (duty * (mod - 0 + 1)) / FTM0_PRECISON;
??ftm_pwm_duty_13:
        ADDS     R0,R8,#+1
        MUL      R0,R0,R6
        MOVW     R1,#+10000
        UDIV     R0,R0,R1
        MOVS     R7,R0
//  522         break;
        B.N      ??ftm_pwm_duty_18
//  523 
//  524     case FTM1:
//  525         cv = (duty * (mod - 0 + 1)) / FTM1_PRECISON;
??ftm_pwm_duty_15:
        ADDS     R0,R8,#+1
        MUL      R0,R0,R6
        MOVW     R1,#+10000
        UDIV     R0,R0,R1
        MOVS     R7,R0
//  526         break;
        B.N      ??ftm_pwm_duty_18
//  527 
//  528     case FTM2:
//  529         cv = (duty * (mod - 0 + 1)) / FTM2_PRECISON;
??ftm_pwm_duty_14:
        ADDS     R0,R8,#+1
        MUL      R0,R0,R6
        MOVW     R1,#+10000
        UDIV     R0,R0,R1
        MOVS     R7,R0
//  530         break;
        B.N      ??ftm_pwm_duty_18
//  531 
//  532 #ifdef MK60F15
//  533     case FTM3:
//  534         cv = (duty * (mod - 0 + 1)) / FTM3_PRECISON;
??ftm_pwm_duty_16:
        ADDS     R0,R8,#+1
        MUL      R0,R0,R6
        MOVW     R1,#+10000
        UDIV     R0,R0,R1
        MOVS     R7,R0
//  535         break;
        B.N      ??ftm_pwm_duty_18
//  536 #endif
//  537 
//  538     default:
//  539         break;
//  540     }
//  541 
//  542     // 配置FTM通道值
//  543     FTM_CnV_REG(FTMN[ftmn], ch) = cv;
??ftm_pwm_duty_17:
??ftm_pwm_duty_18:
        LDR.W    R0,??DataTable10_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        ADDS     R0,R0,R5, LSL #+3
        STR      R7,[R0, #+16]
//  544 
//  545 }
        POP      {R4-R8,PC}       ;; return
          CFI EndBlock cfiBlock2
//  546 
//  547 /*!
//  548  *  @brief      设置FTM的频率
//  549  *  @param      freq    频率（单位为Hz）
//  550  *  @since      v5.0
//  551  *  @note       修改PWM频率后，必须调用 ftm_pwm_duty 重新配置占空比。同一个模块，PWM频率必须相同。
//  552  *  Sample usage:       ftm_pwm_freq(FTM0,200);    //设置 FTM0 的 频率 为 200Hz
//  553  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function ftm_pwm_freq
        THUMB
//  554 void ftm_pwm_freq(FTMn_e ftmn, uint32 freq)             //设置FTM的频率
//  555 {
ftm_pwm_freq:
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
//  556     uint32 clk_hz = (bus_clk_khz * 1000) >> 1;        //bus频率/2
        LDR.W    R0,??DataTable10_3
        LDR      R0,[R0, #+0]
        MOV      R1,#+1000
        MULS     R0,R1,R0
        ASRS     R6,R0,#+1
//  557     uint32 mod;
//  558     uint8 ps;
//  559 
//  560     /*       计算频率设置        */
//  561     // 以 CPWMS = 0 ，即单边捕捉脉冲为例
//  562     clk_hz = (bus_clk_khz * 1000) ;     // bus频率
        LDR.W    R0,??DataTable10_3
        LDR      R0,[R0, #+0]
        MOV      R1,#+1000
        MULS     R0,R1,R0
        MOVS     R6,R0
//  563 
//  564     mod = (clk_hz >> 16 ) / freq ;      // 临时用 mod 缓存一下
        LSRS     R0,R6,#+16
        UDIV     R0,R0,R5
        MOVS     R7,R0
//  565     ps = 0;
        MOVS     R0,#+0
        MOV      R8,R0
//  566     while((mod >> ps) >= 1)             // 等 (mod >> ps) < 1 才退出 while 循环 ，即求 PS 的最小值
??ftm_pwm_freq_0:
        LSRS     R0,R7,R8
        CMP      R0,#+0
        BEQ.N    ??ftm_pwm_freq_1
//  567     {
//  568         ps++;
        ADDS     R8,R8,#+1
        B.N      ??ftm_pwm_freq_0
//  569     }
//  570 
//  571     ASSERT(ps <= 0x07);                 // 断言， PS 最大为 0x07 ，超过此值，则 PWM频率设置过低，或 Bus 频率过高
??ftm_pwm_freq_1:
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+8
        BLT.N    ??ftm_pwm_freq_2
        MOVW     R1,#+571
        LDR.W    R0,??DataTable10_2
          CFI FunCall assert_failed
        BL       assert_failed
//  572 
//  573     mod = (clk_hz >> ps) / freq;        // 求 MOD 的值
??ftm_pwm_freq_2:
        LSRS     R0,R6,R8
        UDIV     R0,R0,R5
        MOVS     R7,R0
//  574 
//  575     ftm_mod[ftmn]=mod;
        LDR.W    R0,??DataTable10_4
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        STR      R7,[R0, R4, LSL #+2]
//  576 
//  577     /******************** 配置时钟和分频 ********************/
//  578     FTM_SC_REG(FTMN[ftmn])    = ( 0
//  579                                   //| FTM_SC_CPWMS_MASK         //0：上升沿计数模式 ，1： 跳变沿计数模式选择 （注释了表示 0）
//  580                                   | FTM_SC_PS(ps)             //分频因子，分频系数 = 2^PS
//  581                                   | FTM_SC_CLKS(1)            //时钟选择， 0：没选择时钟，禁用； 1：bus 时钟； 2：MCGFFCLK； 3：EXTCLK（ 由SIM_SOPT4 选择输入管脚 FTM_CLKINx）
//  582                                   //| FTM_SC_TOIE_MASK        //溢出中断使能（注释了表示 禁止溢出中断）
//  583                                 );
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        ANDS     R0,R8,#0x7
        ORRS     R0,R0,#0x8
        LDR.W    R1,??DataTable10_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        STR      R0,[R1, #+0]
//  584     FTM_CNTIN_REG(FTMN[ftmn]) = 0;      //计数器初始化值。设置脉冲宽度：(CnV - CNTIN).
        MOVS     R0,#+0
        LDR.W    R1,??DataTable10_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        STR      R0,[R1, #+76]
//  585     FTM_MOD_REG(FTMN[ftmn])   = mod;    //模数, EPWM的周期为 ：MOD - CNTIN + 0x0001
        LDR.W    R0,??DataTable10_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        STR      R7,[R0, #+8]
//  586     FTM_CNT_REG(FTMN[ftmn])   = 0;      //计数器。只有低16位可用（写任何值到此寄存器，都会加载 CNTIN 的值）
        MOVS     R0,#+0
        LDR.W    R1,??DataTable10_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        STR      R0,[R1, #+4]
//  587 }
        POP      {R4-R8,PC}       ;; return
          CFI EndBlock cfiBlock3
//  588 
//  589 //////////////////////////////// 以上为输出PWM  //////////////////////////////////////////
//  590 
//  591 //////////////////////////////// 以下为输入捕捉 //////////////////////////////////////////
//  592 
//  593 /*!
//  594  *  @brief      输入捕捉初始化函数
//  595  *  @param      FTMn_e          模块号（FTM0、  FTM1、  FTM2）
//  596  *  @param      FTM_CHn_e       通道号（CH0~CH7）
//  597  *  @param      FTM_Input_cfg   输入捕捉触发条件配置
//  598  *  @param      FTM_PS_e        分频因子
//  599  *  @since      v5.0
//  600  *  @note       同一个FTM，只能干一个活，用于输入捕捉后就不要再用于其他功能，例如PWM。
//  601  *  Sample usage:       ftm_input_init(FTM0, FTM_CH0, FTM_Rising,FTM_PS_2);    //设置 FTM0_CH0上升沿触发输入捕捉，二分频
//  602  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function ftm_input_init
        THUMB
//  603 void ftm_input_init(FTMn_e ftmn, FTM_CHn_e ch, FTM_Input_cfg cfg,FTM_PS_e ps)
//  604 {
ftm_input_init:
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
        MOVS     R7,R3
//  605     ASSERT( (ftmn == FTM0) || ( (ftmn == FTM1 || ftmn == FTM2 ) && (ch <= FTM_CH1))
//  606 #ifdef MK60F15
//  607             || (ftmn == FTM3)       //FX  有FTM3
//  608 #endif
//  609            );  //检查传递进来的通道是否正确
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??ftm_input_init_0
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+1
        BEQ.N    ??ftm_input_init_1
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+2
        BNE.N    ??ftm_input_init_2
??ftm_input_init_1:
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+2
        BLT.N    ??ftm_input_init_0
??ftm_input_init_2:
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+3
        BEQ.N    ??ftm_input_init_0
        MOVW     R1,#+609
        LDR.N    R0,??DataTable10_2
          CFI FunCall assert_failed
        BL       assert_failed
//  610 
//  611     /******************* 开启时钟 和 复用IO口*******************/
//  612     FTM_port_mux(ftmn,ch);
??ftm_input_init_0:
        MOVS     R1,R5
        SXTB     R1,R1            ;; SignExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
          CFI FunCall FTM_port_mux
        BL       FTM_port_mux
//  613 
//  614     /******************* 设置为输入捕捉功能 *******************/
//  615     switch(cfg)
        SXTB     R6,R6            ;; SignExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BEQ.N    ??ftm_input_init_3
        CMP      R6,#+2
        BEQ.N    ??ftm_input_init_4
        BCC.N    ??ftm_input_init_5
        B.N      ??ftm_input_init_6
//  616     {
//  617         //输入捕捉模式下：DECAPEN = 0 ， DECAPEN = 0 ，CPWMS = 0， MSnB:MSnA = 0
//  618 
//  619         // ELSnB:ELSnA         1          10          11
//  620         // 配置             上升沿      下降沿      跳变沿
//  621 
//  622     case FTM_Rising:    //上升沿触发
//  623         FTM_CnSC_REG(FTMN[ftmn], ch) |=  ( FTM_CnSC_ELSA_MASK  | FTM_CnSC_CHIE_MASK );                   //置1
??ftm_input_init_3:
        LDR.N    R0,??DataTable10_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        ADDS     R0,R0,R5, LSL #+3
        LDR.N    R1,??DataTable10_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        ADDS     R1,R1,R5, LSL #+3
        LDR      R1,[R1, #+12]
        ORRS     R1,R1,#0x44
        STR      R1,[R0, #+12]
//  624         FTM_CnSC_REG(FTMN[ftmn], ch) &= ~( FTM_CnSC_ELSB_MASK  | FTM_CnSC_MSB_MASK | FTM_CnSC_MSA_MASK); //清0
        LDR.N    R0,??DataTable10_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        ADDS     R0,R0,R5, LSL #+3
        LDR.N    R1,??DataTable10_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        ADDS     R1,R1,R5, LSL #+3
        LDR      R1,[R1, #+12]
        BICS     R1,R1,#0x38
        STR      R1,[R0, #+12]
//  625         break;
        B.N      ??ftm_input_init_6
//  626 
//  627     case FTM_Falling:   //下降沿触发
//  628         FTM_CnSC_REG(FTMN[ftmn], ch) |= (FTM_CnSC_ELSB_MASK  | FTM_CnSC_CHIE_MASK );                    //置1
??ftm_input_init_5:
        LDR.N    R0,??DataTable10_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        ADDS     R0,R0,R5, LSL #+3
        LDR.N    R1,??DataTable10_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        ADDS     R1,R1,R5, LSL #+3
        LDR      R1,[R1, #+12]
        ORRS     R1,R1,#0x48
        STR      R1,[R0, #+12]
//  629         FTM_CnSC_REG(FTMN[ftmn], ch) &= ~( FTM_CnSC_ELSA_MASK | FTM_CnSC_MSB_MASK | FTM_CnSC_MSA_MASK); //清0
        LDR.N    R0,??DataTable10_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        ADDS     R0,R0,R5, LSL #+3
        LDR.N    R1,??DataTable10_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        ADDS     R1,R1,R5, LSL #+3
        LDR      R1,[R1, #+12]
        BICS     R1,R1,#0x34
        STR      R1,[R0, #+12]
//  630         break;
        B.N      ??ftm_input_init_6
//  631 
//  632     case FTM_Rising_or_Falling: //上升沿、下降沿都触发
//  633         FTM_CnSC_REG(FTMN[ftmn], ch) |=  ( FTM_CnSC_ELSB_MASK | FTM_CnSC_ELSA_MASK  | FTM_CnSC_CHIE_MASK ); //置1
??ftm_input_init_4:
        LDR.N    R0,??DataTable10_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        ADDS     R0,R0,R5, LSL #+3
        LDR.N    R1,??DataTable10_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        ADDS     R1,R1,R5, LSL #+3
        LDR      R1,[R1, #+12]
        ORRS     R1,R1,#0x4C
        STR      R1,[R0, #+12]
//  634         FTM_CnSC_REG(FTMN[ftmn], ch) &= ~( FTM_CnSC_MSB_MASK  | FTM_CnSC_MSA_MASK); //清0
        LDR.N    R0,??DataTable10_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        ADDS     R0,R0,R5, LSL #+3
        LDR.N    R1,??DataTable10_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        ADDS     R1,R1,R5, LSL #+3
        LDR      R1,[R1, #+12]
        BICS     R1,R1,#0x30
        STR      R1,[R0, #+12]
//  635         break;
//  636     }
//  637 
//  638     FTM_SC_REG(FTMN[ftmn]) = ( 0
//  639                               | FTM_SC_CLKS(0x1)       //选择 bus 时钟
//  640                               | FTM_SC_PS(ps)          //选择 分频系数
//  641                              );
??ftm_input_init_6:
        SXTB     R7,R7            ;; SignExt  R7,R7,#+24,#+24
        ANDS     R0,R7,#0x7
        ORRS     R0,R0,#0x8
        LDR.N    R1,??DataTable10_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        STR      R0,[R1, #+0]
//  642     FTM_MODE_REG(FTMN[ftmn])    |= FTM_MODE_WPDIS_MASK; //禁止写保护
        LDR.N    R0,??DataTable10_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        LDR      R0,[R0, #+84]
        ORRS     R0,R0,#0x4
        LDR.N    R1,??DataTable10_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        STR      R0,[R1, #+84]
//  643     FTM_COMBINE_REG(FTMN[ftmn]) = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable10_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        STR      R0,[R1, #+100]
//  644     FTM_MODE_REG(FTMN[ftmn])    &= ~FTM_MODE_FTMEN_MASK;    //使能FTM
        LDR.N    R0,??DataTable10_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        LDR      R0,[R0, #+84]
        LSRS     R0,R0,#+1
        LSLS     R0,R0,#+1
        LDR.N    R1,??DataTable10_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        STR      R0,[R1, #+84]
//  645     FTM_CNTIN_REG(FTMN[ftmn])   = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable10_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        STR      R0,[R1, #+76]
//  646 
//  647     FTM_STATUS_REG(FTMN[ftmn])  = 0x00;               //清中断标志位
        MOVS     R0,#+0
        LDR.N    R1,??DataTable10_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        STR      R0,[R1, #+80]
//  648 
//  649     //开启输入捕捉中断
//  650     //enable_irq(FTM0_IRQn + ftmn);
//  651 }
        POP      {R0,R4-R7,PC}    ;; return
          CFI EndBlock cfiBlock4
//  652 
//  653 /*!
//  654  *  @brief      输入捕捉初始化函数
//  655  *  @param      FTMn_e          模块号（FTM0、  FTM1、  FTM2）
//  656  *  @param      FTM_CHn_e       通道号（CH0~CH7）
//  657  *  @param      FTM_Input_cfg   输入捕捉触发条件配置
//  658  *  @return     获取捕捉事件发生时的计数器值 (根据两次捕捉之间的差值可判断周期频率)
//  659  *  @since      v5.0
//  660  *  Sample usage:       uint16 data = ftm_input_get (FTM0, FTM_CH0) ;   // 获取FTM0_CH0输入捕捉事件触发时的计数值
//  661  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function ftm_input_get
        THUMB
//  662 uint16   ftm_input_get (FTMn_e ftmn, FTM_CHn_e ch)
//  663 {
ftm_input_get:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
//  664         ASSERT( (ftmn == FTM0) || ( (ftmn == FTM1 || ftmn == FTM2 ) && (ch <= FTM_CH1))
//  665 #ifdef MK60F15
//  666                 || (ftmn == FTM3)       //FX  有FTM3
//  667 #endif
//  668                );  //检查传递进来的通道是否正确
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??ftm_input_get_0
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+1
        BEQ.N    ??ftm_input_get_1
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+2
        BNE.N    ??ftm_input_get_2
??ftm_input_get_1:
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+2
        BLT.N    ??ftm_input_get_0
??ftm_input_get_2:
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+3
        BEQ.N    ??ftm_input_get_0
        MOV      R1,#+668
        LDR.N    R0,??DataTable10_2
          CFI FunCall assert_failed
        BL       assert_failed
//  669 
//  670     return (uint16)FTM_CnV_REG(FTMN[ftmn],ch);    //保存
??ftm_input_get_0:
        LDR.N    R0,??DataTable10_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        ADDS     R0,R0,R5, LSL #+3
        LDR      R0,[R0, #+16]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        POP      {R1,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock5
//  671 }
//  672 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function ftm_input_clean
        THUMB
//  673 void     ftm_input_clean (FTMn_e ftmn)
//  674 {
ftm_input_clean:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  675     ASSERT( ftmn < FTM_MAX);     //检查传递进来的通道是否正确
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+4
        BLT.N    ??ftm_input_clean_0
        MOVW     R1,#+675
        LDR.N    R0,??DataTable10_2
          CFI FunCall assert_failed
        BL       assert_failed
//  676 
//  677     FTM_CNT_REG(FTMN[ftmn]) = 0;               //清 计数器计数值
??ftm_input_clean_0:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable10_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        STR      R0,[R1, #+4]
//  678 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock6
//  679 
//  680 
//  681 /*!
//  682  *  @brief      FTM测试中断服务函数
//  683  *  @since      v5.0
//  684  *  @warning    此函数需要用户根据自己需求完成，这里仅仅是提供一个模版
//  685  *  Sample usage:       set_vector_handler(FTM0_IRQn , FTM1_Input_test_handler);    //把 FTM1_Input_test_handler 函数添加到中断向量表，不需要我们手动调用
//  686  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function FTM1_Input_test_handler
          CFI NoCalls
        THUMB
//  687 void FTM1_Input_test_handler(void)
//  688 {
//  689     uint8 s = FTM1_STATUS;             //读取捕捉和比较状态  All CHnF bits can be checked using only one read of STATUS.
FTM1_Input_test_handler:
        LDR.N    R0,??DataTable10_6  ;; 0x40039050
        LDR      R0,[R0, #+0]
//  690     uint8 CHn;
//  691 
//  692     FTM1_STATUS = 0x00;             //清中断标志位
        MOVS     R2,#+0
        LDR.N    R3,??DataTable10_6  ;; 0x40039050
        STR      R2,[R3, #+0]
//  693 
//  694     CHn = 0;
        MOVS     R2,#+0
        MOVS     R1,R2
//  695     if( s & (1 << CHn) )
//  696     {
//  697         //FTM_IRQ_DIS(FTM1, CHn);     //禁止输入捕捉中断
//  698         /*     用户任务       */
//  699 
//  700         /*********************/
//  701         //FTM_IRQ_EN(FTM1, CHn); //开启输入捕捉中断
//  702 
//  703     }
//  704 
//  705     /* 这里添加 n=1 的模版，根据模版来添加 */
//  706     CHn = 1;
        MOVS     R2,#+1
        MOVS     R1,R2
//  707     if( s & (1 << CHn) )
//  708     {
//  709         //FTM_IRQ_EN(FTM1, CHn); //开启输入捕捉中断
//  710         /*     用户任务       */
//  711 
//  712 
//  713         /*********************/
//  714         //不建议在这里开启输入捕捉中断
//  715         //FTM_IRQ_EN(FTM1, CHn); //开启输入捕捉中断
//  716     }
//  717 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock7
//  718 
//  719 //////////////////////////////// 以上为输入捕捉  //////////////////////////////////////////
//  720 
//  721 //////////////////////////////// 以下为正交解码 //////////////////////////////////////////
//  722 
//  723 /*!
//  724  *  @brief      初始化FTM 的正交解码 功能
//  725  *  @param      FTMn_e    模块号（ FTM1、  FTM2）
//  726  *  @since      v5.0
//  727  *  Sample usage:       ftm_quad_init(FTM1);    //初始化 FTM1 为正交解码模式
//  728  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function ftm_quad_init
        THUMB
//  729 void ftm_quad_init(FTMn_e ftmn)
//  730 {
ftm_quad_init:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  731     ASSERT( (ftmn == FTM1) || (ftmn == FTM2 ) ); //检查传递进来的通道是否正确
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+1
        BEQ.N    ??ftm_quad_init_0
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+2
        BEQ.N    ??ftm_quad_init_0
        MOVW     R1,#+731
        LDR.N    R0,??DataTable10_2
          CFI FunCall assert_failed
        BL       assert_failed
//  732 
//  733     /******************* 开启时钟 和 复用IO口*******************/
//  734     switch(ftmn)
??ftm_quad_init_0:
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        MOVS     R0,R4
        CMP      R0,#+1
        BEQ.N    ??ftm_quad_init_1
        CMP      R0,#+2
        BEQ.N    ??ftm_quad_init_2
        B.N      ??ftm_quad_init_3
//  735     {
//  736 
//  737     case FTM1:
//  738         SIM_SCGC6 |= SIM_SCGC6_FTM1_MASK;       //使能FTM1时钟
??ftm_quad_init_1:
        LDR.N    R0,??DataTable10  ;; 0x4004803c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2000000
        LDR.N    R1,??DataTable10  ;; 0x4004803c
        STR      R0,[R1, #+0]
//  739         if((FTM1_QDPHA_PIN == PTA8) || (FTM1_QDPHA_PIN == PTB0) )                 //管脚复用
//  740         {
//  741             port_init(FTM1_QDPHA_PIN, ALT6);
//  742         }
//  743         else if(FTM1_QDPHA_PIN == PTA12)
//  744         {
//  745             port_init(FTM1_QDPHA_PIN, ALT7);
        MOV      R1,#+1792
        MOVS     R0,#+12
          CFI FunCall port_init
        BL       port_init
//  746         }
//  747         else
//  748         {
//  749             ASSERT(0);                          //断言，配置的管脚不符合要求
//  750         }
//  751 
//  752         if((FTM1_QDPHB_PIN == PTA9) ||(FTM1_QDPHB_PIN == PTB1))
//  753         {
//  754             port_init(FTM1_QDPHB_PIN, ALT6);
//  755         }
//  756         else if(FTM1_QDPHB_PIN == PTA13)
//  757         {
//  758             port_init(FTM1_QDPHB_PIN, ALT7);
        MOV      R1,#+1792
        MOVS     R0,#+13
          CFI FunCall port_init
        BL       port_init
//  759         }
//  760         else
//  761         {
//  762             ASSERT(0);                          //断言，配置的管脚不符合要求
//  763         }
//  764         break;
        B.N      ??ftm_quad_init_4
//  765 
//  766     case FTM2:
//  767         SIM_SCGC3 |= SIM_SCGC3_FTM2_MASK;                           //使能FTM2时钟
??ftm_quad_init_2:
        LDR.N    R0,??DataTable10_1  ;; 0x40048030
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000000
        LDR.N    R1,??DataTable10_1  ;; 0x40048030
        STR      R0,[R1, #+0]
//  768         if((FTM2_QDPHA_PIN == PTA10) || (FTM2_QDPHA_PIN == PTB18))                  //管脚复用
//  769         {
//  770             port_init(FTM2_QDPHA_PIN, ALT6);
        MOV      R1,#+1536
        MOVS     R0,#+50
          CFI FunCall port_init
        BL       port_init
//  771         }
//  772         else
//  773         {
//  774             ASSERT(0);                          //断言，配置的管脚不符合要求
//  775         }
//  776 
//  777         if((FTM2_QDPHB_PIN == PTA11) || (FTM2_QDPHB_PIN == PTB19) )                 //管脚复用
//  778         {
//  779             port_init(FTM2_QDPHB_PIN, ALT6);
        MOV      R1,#+1536
        MOVS     R0,#+51
          CFI FunCall port_init
        BL       port_init
//  780         }
//  781         else
//  782         {
//  783             ASSERT(0);                          //断言，配置的管脚不符合要求
//  784         }
//  785         break;
        B.N      ??ftm_quad_init_4
//  786     default:
//  787         ASSERT(0);                              //断言，配置的模块有误
??ftm_quad_init_3:
        MOVW     R1,#+787
        LDR.N    R0,??DataTable10_2
          CFI FunCall assert_failed
        BL       assert_failed
//  788         break;
//  789     }
//  790 
//  791     FTM_MODE_REG(FTMN[ftmn])  |=    (0
//  792                                      | FTM_MODE_WPDIS_MASK  //写保护禁止
//  793                                      //| FTM_MODE_FTMEN_MASK   //使能 FTM
//  794                                     );
??ftm_quad_init_4:
        LDR.N    R0,??DataTable10_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        LDR      R0,[R0, #+84]
        ORRS     R0,R0,#0x4
        LDR.N    R1,??DataTable10_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        STR      R0,[R1, #+84]
//  795     FTM_QDCTRL_REG(FTMN[ftmn]) |=   (0
//  796                                     | FTM_QDCTRL_QUADMODE_MASK
//  797                                      );
        LDR.N    R0,??DataTable10_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        LDR      R0,[R0, #+128]
        ORRS     R0,R0,#0x8
        LDR.N    R1,??DataTable10_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        STR      R0,[R1, #+128]
//  798     FTM_CNTIN_REG(FTMN[ftmn])   = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable10_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        STR      R0,[R1, #+76]
//  799     FTM_MOD_REG(FTMN[ftmn])     = FTM_MOD_MOD_MASK;
        MOVW     R0,#+65535
        LDR.N    R1,??DataTable10_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        STR      R0,[R1, #+8]
//  800     FTM_QDCTRL_REG(FTMN[ftmn]) |=   (0
//  801                                     | FTM_QDCTRL_QUADEN_MASK
//  802                                      );
        LDR.N    R0,??DataTable10_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        LDR      R0,[R0, #+128]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable10_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        STR      R0,[R1, #+128]
//  803     FTM_MODE_REG(FTMN[ftmn])  |= FTM_QDCTRL_QUADEN_MASK;
        LDR.N    R0,??DataTable10_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        LDR      R0,[R0, #+84]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable10_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        STR      R0,[R1, #+84]
//  804     FTM_CNT_REG(FTMN[ftmn])     = 0;                    //计数器。只有低16位可用（写任何值到此寄存器，都会加载 CNTIN 的值）
        MOVS     R0,#+0
        LDR.N    R1,??DataTable10_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        STR      R0,[R1, #+4]
//  805 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock8
//  806 
//  807 /*!
//  808  *  @brief      获取FTM 正交解码 的脉冲数
//  809  *  @param      FTMn_e    模块号（ FTM1、  FTM2）
//  810  *  @since      v5.0
//  811  *  Sample usage:       int16 count = ftm_quad_get(FTM1);    //获取  FTM1 交解码 的脉冲数
//  812  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function ftm_quad_get
        THUMB
//  813 int16 ftm_quad_get(FTMn_e ftmn)
//  814 {
ftm_quad_get:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
//  815     int16 val;
//  816     ASSERT( (ftmn == FTM1) || (ftmn == FTM2 ) );        //检查传递进来的通道是否正确
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+1
        BEQ.N    ??ftm_quad_get_0
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+2
        BEQ.N    ??ftm_quad_get_0
        MOV      R1,#+816
        LDR.N    R0,??DataTable10_2
          CFI FunCall assert_failed
        BL       assert_failed
//  817     val = FTM_CNT_REG(FTMN[ftmn]);
??ftm_quad_get_0:
        LDR.N    R0,??DataTable10_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        LDR      R0,[R0, #+4]
        MOVS     R5,R0
//  818 
//  819     return val;
        MOVS     R0,R5
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        POP      {R1,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock9
//  820 }
//  821 
//  822 /*!
//  823  *  @brief      清 FTM 正交解码 的脉冲数
//  824  *  @param      FTMn_e    模块号（ FTM1、  FTM2）
//  825  *  @since      v5.0
//  826  *  Sample usage:       ftm_quad_clean(FTM1);    //复位 FTM1 正交解码 的脉冲数
//  827  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function ftm_quad_clean
        THUMB
//  828 void ftm_quad_clean(FTMn_e ftmn)
//  829 {
ftm_quad_clean:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  830     ASSERT( (ftmn == FTM1) || (ftmn == FTM2 ) ); //检查传递进来的通道是否正确
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+1
        BEQ.N    ??ftm_quad_clean_0
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+2
        BEQ.N    ??ftm_quad_clean_0
        MOVW     R1,#+830
        LDR.N    R0,??DataTable10_2
          CFI FunCall assert_failed
        BL       assert_failed
//  831 
//  832     FTM_CNT_REG(FTMN[ftmn])     = 0;             //计数器。只有低16位可用（写任何值到此寄存器，都会加载 CNTIN 的值）
??ftm_quad_clean_0:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable10_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        STR      R0,[R1, #+4]
//  833 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock10

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10:
        DC32     0x4004803c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_1:
        DC32     0x40048030

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_2:
        DC32     ?_0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_3:
        DC32     bus_clk_khz

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_4:
        DC32     ftm_mod

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_5:
        DC32     FTMN

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_6:
        DC32     0x40039050

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
        DC8 63H, 5CH, 4DH, 4BH, 36H, 30H, 5FH, 66H
        DC8 74H, 6DH, 2EH, 63H, 0
        DC8 0, 0, 0

        END
//  834 
//  835 
//  836 
// 
//    16 bytes in section .bss
//    16 bytes in section .data
//    56 bytes in section .rodata
// 2 220 bytes in section .text
// 
// 2 220 bytes of CODE  memory
//    56 bytes of CONST memory
//    32 bytes of DATA  memory
//
//Errors: none
//Warnings: none
