///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       07/Apr/2017  10:46:52
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\znc\project\K60FN\network_car_scale\App\flash.c
//    Command line =  
//        E:\znc\project\K60FN\network_car_scale\App\flash.c -D DEBUG -D
//        ARM_MATH_CM4 -D MK60F15 -D MK60FN15 -lA
//        E:\znc\project\K60FN\network_car_scale\Prj\IAR\FN15_Debug\List\ -o
//        E:\znc\project\K60FN\network_car_scale\Prj\IAR\FN15_Debug\Obj\
//        --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
//        --no_clustering --no_scheduling --debug --endian=little
//        --cpu=Cortex-M4F -e --char_is_signed --fpu=VFPv4_sp --dlib_config
//        E:\iar\arm\INC\c\DLib_Config_Full.h -I
//        E:\znc\project\K60FN\network_car_scale\Prj\IAR\..\..\App\ -I
//        E:\znc\project\K60FN\network_car_scale\Prj\IAR\..\..\App\Inc\ -I
//        E:\znc\project\K60FN\network_car_scale\Prj\IAR\..\..\Board\Inc\ -I
//        E:\znc\project\K60FN\network_car_scale\Prj\IAR\..\..\Chip\inc\ -I
//        E:\znc\project\K60FN\network_car_scale\Prj\IAR\..\..\Chip\inc\IAR\ -I
//        E:\znc\project\K60FN\network_car_scale\Prj\IAR\..\..\Chip\inc\kinetis\
//        -I
//        E:\znc\project\K60FN\network_car_scale\Prj\IAR\..\..\Lib\CMSIS\Inc\
//        -I E:\znc\project\K60FN\network_car_scale\Prj\IAR\..\..\Lib\FatFs\ -I
//        E:\znc\project\K60FN\network_car_scale\Prj\IAR\..\..\Lib\USB\ -On
//    List file    =  
//        E:\znc\project\K60FN\network_car_scale\Prj\IAR\FN15_Debug\List\flash.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "1"
        RTMODEL "__dlib_full_locale_support", "1"
        AAPCS BASE,INTERWORK,VFP
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN DIAND
        EXTERN DIANI
        EXTERN DIANP
        EXTERN DUOD
        EXTERN DUOI
        EXTERN DUOP
        EXTERN Q_B
        EXTERN Q_H
        EXTERN flash_erase_sector
        EXTERN flash_write

        PUBLIC myflash_read
        PUBLIC myflash_write
        
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
        
// E:\znc\project\K60FN\network_car_scale\App\flash.c
//    1 #include "include.h"
//    2 #include  "common.h"
//    3 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function myflash_read
          CFI NoCalls
        THUMB
//    4 void myflash_read()
//    5 {
//    6   DUOP=flash_read(255,0,uint16);
myflash_read:
        MOVS     R0,#+1044480
        LDRH     R0,[R0, #+0]
        LDR.N    R1,??DataTable1
        STRH     R0,[R1, #+0]
//    7   DUOI=flash_read(255,8,uint16);
        LDR.N    R0,??DataTable1_1  ;; 0xff008
        LDRH     R0,[R0, #+0]
        LDR.N    R1,??DataTable1_2
        STRH     R0,[R1, #+0]
//    8   DUOD=flash_read(255,16,uint16);
        LDR.N    R0,??DataTable1_3  ;; 0xff010
        LDRH     R0,[R0, #+0]
        LDR.N    R1,??DataTable1_4
        STRH     R0,[R1, #+0]
//    9   DIANP=flash_read(255,24,uint16);
        LDR.N    R0,??DataTable1_5  ;; 0xff018
        LDRH     R0,[R0, #+0]
        LDR.N    R1,??DataTable1_6
        STRH     R0,[R1, #+0]
//   10   DIANI=flash_read(255,32,uint16);
        LDR.N    R0,??DataTable1_7  ;; 0xff020
        LDRH     R0,[R0, #+0]
        LDR.N    R1,??DataTable1_8
        STRH     R0,[R1, #+0]
//   11   DIAND=flash_read(255,40,uint16);
        LDR.N    R0,??DataTable1_9  ;; 0xff028
        LDRH     R0,[R0, #+0]
        LDR.N    R1,??DataTable1_10
        STRH     R0,[R1, #+0]
//   12   Q_H=flash_read(255,48,uint16);
        LDR.N    R0,??DataTable1_11  ;; 0xff030
        LDRH     R0,[R0, #+0]
        LDR.N    R1,??DataTable1_12
        STRH     R0,[R1, #+0]
//   13   Q_B=flash_read(255,56,uint16);
        LDR.N    R0,??DataTable1_13  ;; 0xff038
        LDRH     R0,[R0, #+0]
        LDR.N    R1,??DataTable1_14
        STRH     R0,[R1, #+0]
//   14   
//   15 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
//   16 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function myflash_write
        THUMB
//   17 void myflash_write()
//   18 {
myflash_write:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   19   flash_erase_sector(255);
        MOVS     R0,#+255
          CFI FunCall flash_erase_sector
        BL       flash_erase_sector
//   20   
//   21   flash_write(255,0,DUOP);
        LDR.N    R0,??DataTable1
        LDRH     R2,[R0, #+0]
        MOVS     R3,#+0
        MOVS     R1,#+0
        MOVS     R0,#+255
          CFI FunCall flash_write
        BL       flash_write
//   22   flash_write(255,8,DUOI);
        LDR.N    R0,??DataTable1_2
        LDRH     R2,[R0, #+0]
        MOVS     R3,#+0
        MOVS     R1,#+8
        MOVS     R0,#+255
          CFI FunCall flash_write
        BL       flash_write
//   23   flash_write(255,16,DUOD);
        LDR.N    R0,??DataTable1_4
        LDRH     R2,[R0, #+0]
        MOVS     R3,#+0
        MOVS     R1,#+16
        MOVS     R0,#+255
          CFI FunCall flash_write
        BL       flash_write
//   24   flash_write(255,24,DIANP);
        LDR.N    R0,??DataTable1_6
        LDRH     R2,[R0, #+0]
        MOVS     R3,#+0
        MOVS     R1,#+24
        MOVS     R0,#+255
          CFI FunCall flash_write
        BL       flash_write
//   25   flash_write(255,32,DIANI);
        LDR.N    R0,??DataTable1_8
        LDRH     R2,[R0, #+0]
        MOVS     R3,#+0
        MOVS     R1,#+32
        MOVS     R0,#+255
          CFI FunCall flash_write
        BL       flash_write
//   26   flash_write(255,40,DIAND);
        LDR.N    R0,??DataTable1_10
        LDRH     R2,[R0, #+0]
        MOVS     R3,#+0
        MOVS     R1,#+40
        MOVS     R0,#+255
          CFI FunCall flash_write
        BL       flash_write
//   27   flash_write(255,48,Q_H);
        LDR.N    R0,??DataTable1_12
        LDRH     R2,[R0, #+0]
        MOVS     R3,#+0
        MOVS     R1,#+48
        MOVS     R0,#+255
          CFI FunCall flash_write
        BL       flash_write
//   28   flash_write(255,56,Q_B);
        LDR.N    R0,??DataTable1_14
        LDRH     R2,[R0, #+0]
        MOVS     R3,#+0
        MOVS     R1,#+56
        MOVS     R0,#+255
          CFI FunCall flash_write
        BL       flash_write
//   29   
//   30 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     DUOP

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     0xff008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     DUOI

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     0xff010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     DUOD

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_5:
        DC32     0xff018

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_6:
        DC32     DIANP

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_7:
        DC32     0xff020

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_8:
        DC32     DIANI

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_9:
        DC32     0xff028

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_10:
        DC32     DIAND

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_11:
        DC32     0xff030

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_12:
        DC32     Q_H

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_13:
        DC32     0xff038

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_14:
        DC32     Q_B

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
// 
// 250 bytes in section .text
// 
// 250 bytes of CODE memory
//
//Errors: none
//Warnings: none
