///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       21/Mar/2017  16:05:41
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\znc\project\K60FN\network_car\Board\src\VCAN_MMA7455.c
//    Command line =  
//        E:\znc\project\K60FN\network_car\Board\src\VCAN_MMA7455.c -D DEBUG -D
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
//        E:\znc\project\K60FN\network_car\Prj\IAR\FN15_Debug\List\VCAN_MMA7455.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "1"
        RTMODEL "__dlib_full_locale_support", "1"
        AAPCS BASE,INTERWORK,VFP
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN i2c_init
        EXTERN i2c_read_reg
        EXTERN i2c_write_reg

        PUBLIC mma7455_init
        PUBLIC mma7455_read_reg
        PUBLIC mma7455_write_reg
        
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
        
// E:\znc\project\K60FN\network_car\Board\src\VCAN_MMA7455.c
//    1 /*!
//    2  *     COPYRIGHT NOTICE
//    3  *     Copyright (c) 2013,山外科技
//    4  *     All rights reserved.
//    5  *     技术讨论：山外论坛 http://www.vcan123.com
//    6  *
//    7  *     除注明出处外，以下所有内容版权均属山外科技所有，未经允许，不得用于商业用途，
//    8  *     修改内容时必须保留山外科技的版权声明。
//    9  *
//   10  * @file       VCAN_MMA7455.c
//   11  * @brief      MMA7455驱动函数实现
//   12  * @author     山外科技
//   13  * @version    v5.0
//   14  * @date       2013-07-9
//   15  */
//   16 
//   17 #include "common.h"
//   18 #include "MK60_port.h"
//   19 #include "MK60_i2c.h"
//   20 #include "VCAN_MMA7455.h"
//   21 
//   22 //宏定义调用底层的I2C接口
//   23 #define MMA7455_OPEN(baud)      i2c_init(MMA7455_DEVICE,baud)
//   24 #define MMA7455_WR(reg,value)   i2c_write_reg(MMA7455_DEVICE,MMA7455_ADRESS,reg,value)  //mma7455 写寄存器
//   25 #define MMA7455_RD(reg)         i2c_read_reg(MMA7455_DEVICE,MMA7455_ADRESS,reg)         //mma7455 读寄存器
//   26 
//   27 /*!
//   28  *  @brief      MMA7455初始化，进入 2g 量程测试模式
//   29  *  @since      v5.0
//   30  *  Sample usage:            mma7455_init();    //初始化 MMA7455
//   31  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function mma7455_init
        THUMB
//   32 void mma7455_init(void)
//   33 {
mma7455_init:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   34     MMA7455_OPEN(400 * 1000);           //初始化mma7455接口，设置波特率 400k
        LDR.N    R1,??DataTable0  ;; 0x61a80
        MOVS     R0,#+0
          CFI FunCall i2c_init
        BL       i2c_init
//   35 
//   36     /*MMA进入 2g 量程测试模式*/
//   37     MMA7455_WR(MMA7455_MCTL, 0x05);
        MOVS     R3,#+5
        MOVS     R2,#+22
        MOVS     R1,#+29
        MOVS     R0,#+0
          CFI FunCall i2c_write_reg
        BL       i2c_write_reg
//   38 
//   39     /*DRDY标置位,等待测试完毕*/
//   40     while(!(MMA7455_RD(MMA7455_STATUS) & 0x01));
??mma7455_init_0:
        MOVS     R2,#+9
        MOVS     R1,#+29
        MOVS     R0,#+0
          CFI FunCall i2c_read_reg
        BL       i2c_read_reg
        LSLS     R0,R0,#+31
        BPL.N    ??mma7455_init_0
//   41 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC32     0x61a80
//   42 
//   43 /*!
//   44  *  @brief      MMA7455写寄存器
//   45  *  @param      reg         寄存器
//   46  *  @param      dat         需要写入的数据的寄存器地址
//   47  *  @since      v5.0
//   48  *  Sample usage:       mma7455_write_reg(MMA7455_XOFFL,0);   // 写寄存器 MMA7455_XOFFL 为 0
//   49  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function mma7455_write_reg
        THUMB
//   50 void mma7455_write_reg(uint8 reg, uint8 Data)
//   51 {
mma7455_write_reg:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
//   52     MMA7455_WR(reg, Data);
        MOVS     R3,R5
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        MOVS     R2,R4
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,#+29
        MOVS     R0,#+0
          CFI FunCall i2c_write_reg
        BL       i2c_write_reg
//   53 }
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock1
//   54 
//   55 /*!
//   56  *  @brief      MMA7455读寄存器
//   57  *  @param      reg         寄存器
//   58  *  @param      dat         需要读取数据的寄存器地址
//   59  *  @since      v5.0
//   60  *  Sample usage:       uint8 data = mma7455_read_reg(MMA7455_XOFFL);    // 读寄存器 MMA7455_XOFFL
//   61  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function mma7455_read_reg
        THUMB
//   62 uint8 mma7455_read_reg(uint8 reg)
//   63 {
mma7455_read_reg:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//   64     return MMA7455_RD(reg);
        MOVS     R2,R4
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,#+29
        MOVS     R0,#+0
          CFI FunCall i2c_read_reg
        BL       i2c_read_reg
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock2
//   65 }

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//   66 
//   67 
// 
// 84 bytes in section .text
// 
// 84 bytes of CODE memory
//
//Errors: none
//Warnings: none
