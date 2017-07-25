///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       21/Mar/2017  16:04:43
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\znc\project\K60FN\network_car\Chip\src\MK60_dac.c
//    Command line =  
//        E:\znc\project\K60FN\network_car\Chip\src\MK60_dac.c -D DEBUG -D
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
//        E:\znc\project\K60FN\network_car\Prj\IAR\FN15_Debug\List\MK60_dac.s
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

        PUBLIC DACN
        PUBLIC dac_init
        PUBLIC dac_out
        
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
        
// E:\znc\project\K60FN\network_car\Chip\src\MK60_dac.c
//    1 /*!
//    2  *     COPYRIGHT NOTICE
//    3  *     Copyright (c) 2013,山外科技
//    4  *     All rights reserved.
//    5  *     技术讨论：山外论坛 http://www.vcan123.com
//    6  *
//    7  *     除注明出处外，以下所有内容版权均属山外科技所有，未经允许，不得用于商业用途，
//    8  *     修改内容时必须保留山外科技的版权声明。
//    9  *
//   10  * @file       MK60_dac.c
//   11  * @brief      DAC函数
//   12  * @author     山外科技
//   13  * @version    v5.0
//   14  * @date       2013-08-28
//   15  */
//   16 
//   17 #include "common.h"
//   18 #include "MK60_dac.h"
//   19 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   20 DAC_MemMapPtr DACN[2] = {DAC0_BASE_PTR, DAC1_BASE_PTR}; //定义两个指针数组保存 DACN 的地址
DACN:
        DATA
        DC32 400CC000H, 400CD000H
//   21 
//   22 
//   23 /*!
//   24  *  @brief      DAC初始化
//   25  *  @param      DACn_e      DAC模块号
//   26  *  @since      v5.0
//   27  *  Sample usage:       dac_init (DAC1 );    //初始化 DAC1
//   28  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function dac_init
          CFI NoCalls
        THUMB
//   29 void dac_init(DACn_e dacn)
//   30 {
//   31     /* 使能时钟 */
//   32     SIM_SCGC2 |= (SIM_SCGC2_DAC0_MASK << dacn) ;    //使能DAC模块
dac_init:
        LDR.N    R1,??DataTable1  ;; 0x4004802c
        LDR      R1,[R1, #+0]
        MOV      R2,#+4096
        LSLS     R2,R2,R0
        ORRS     R1,R2,R1
        LDR.N    R2,??DataTable1  ;; 0x4004802c
        STR      R1,[R2, #+0]
//   33 
//   34     /*  配置DAC寄存器  */
//   35 
//   36     //配置DAC_C0寄存器
//   37     DAC_C0_REG(DACN[dacn])  = ( 0
//   38                                 |  DAC_C0_DACTRGSEL_MASK                //选择软件触发
//   39                                 |  DAC_C0_DACRFS_MASK                   //选择参考VDD电压(3.3V)
//   40                                 |  DAC_C0_DACEN_MASK                    //使能DAC模块
//   41                               );
        MOVS     R1,#+224
        LDR.N    R2,??DataTable1_1
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        LDR      R2,[R2, R0, LSL #+2]
        STRB     R1,[R2, #+33]
//   42 
//   43     //配置DAC_C1寄存器
//   44     DAC_C1_REG(DACN[dacn]) = ( 0
//   45                              ) ;
        MOVS     R1,#+0
        LDR.N    R2,??DataTable1_1
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        LDR      R2,[R2, R0, LSL #+2]
        STRB     R1,[R2, #+34]
//   46     //配置DAC_C2寄存器
//   47     DAC_C2_REG(DACN[dacn]) = ( 0
//   48                                | DAC_C2_DACBFRP(0)             //设置缓冲区读指针指向0
//   49                              );
        MOVS     R1,#+0
        LDR.N    R2,??DataTable1_1
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        LDR      R2,[R2, R0, LSL #+2]
        STRB     R1,[R2, #+35]
//   50 
//   51     DAC_DATH_REG(DACN[dacn], 0) = 0;   //默认输出最低电压
        MOVS     R1,#+0
        LDR.N    R2,??DataTable1_1
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        LDR      R2,[R2, R0, LSL #+2]
        STRB     R1,[R2, #+1]
//   52     DAC_DATL_REG(DACN[dacn], 0) = 0;
        MOVS     R1,#+0
        LDR.N    R2,??DataTable1_1
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        LDR      R2,[R2, R0, LSL #+2]
        STRB     R1,[R2, #+0]
//   53 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
//   54 
//   55 /*!
//   56  *  @brief      DAC输出
//   57  *  @param      DACn_e      DAC模块号
//   58  *  @param      val         输出模拟量所对应的数字量（12bit）
//   59  *  @since      v5.0
//   60  *  Sample usage:       dac_out (DAC1 ,0x100);    //初始化 DAC1 输出 0x100 数字量对应的模拟量
//   61  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function dac_out
        THUMB
//   62 void dac_out(DACn_e dacn, uint16 val)
//   63 {
dac_out:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
//   64     ASSERT(val < 0x1000);               //val 为 12bit
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+4096
        BLT.N    ??dac_out_0
        MOVS     R1,#+64
        LDR.N    R0,??DataTable1_2
          CFI FunCall assert_failed
        BL       assert_failed
//   65 
//   66     DAC_DATH_REG(DACN[dacn], 0) = (val >> 8);   //输出电压
??dac_out_0:
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LSRS     R0,R5,#+8
        LDR.N    R1,??DataTable1_1
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R1,[R1, R4, LSL #+2]
        STRB     R0,[R1, #+1]
//   67     DAC_DATL_REG(DACN[dacn], 0) = (val & 0xFF);
        LDR.N    R0,??DataTable1_1
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR      R0,[R0, R4, LSL #+2]
        STRB     R5,[R0, #+0]
//   68 }
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     0x4004802c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     DACN

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
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
        DC8 63H, 5CH, 4DH, 4BH, 36H, 30H, 5FH, 64H
        DC8 61H, 63H, 2EH, 63H, 0
        DC8 0, 0, 0

        END
// 
//   8 bytes in section .data
//  56 bytes in section .rodata
// 144 bytes in section .text
// 
// 144 bytes of CODE  memory
//  56 bytes of CONST memory
//   8 bytes of DATA  memory
//
//Errors: none
//Warnings: none
