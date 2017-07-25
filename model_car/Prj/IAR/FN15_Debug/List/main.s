///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       07/Apr/2017  10:46:55
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\znc\project\K60FN\network_car_scale\App\main.c
//    Command line =  
//        E:\znc\project\K60FN\network_car_scale\App\main.c -D DEBUG -D
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
//        E:\znc\project\K60FN\network_car_scale\Prj\IAR\FN15_Debug\List\main.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "1"
        RTMODEL "__dlib_full_locale_support", "1"
        AAPCS BASE,INTERWORK,VFP
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN INIT

        PUBLIC main
        PUBLIC param
        PUBLIC receive_change
        PUBLIC recevie_date
        PUBLIC temp
        
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
        
// E:\znc\project\K60FN\network_car_scale\App\main.c
//    1 #include "common.h"
//    2 #include "include.h"
//    3 #include "ov7620.h"
//    4 
//    5 
//    6 //º¯ÊýÉùÃ÷
//    7 
//    8 uint8 receive_change(uint8 recevie_temp);
//    9 
//   10 

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   11 uint8 recevie_date = 50;
recevie_date:
        DATA
        DC8 50

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   12 uint8 temp = 0;
temp:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   13 uint8 param = 0;
param:
        DS8 1
//   14 
//   15 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function main
        THUMB
//   16 void  main()
//   17 {
main:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   18     DisableInterrupts;
        CPSID    I
//   19     INIT();
          CFI FunCall INIT
        BL       INIT
//   20     EnableInterrupts;   
        CPSIE    I
//   21     
//   22     while(1)
//   23     {
//   24       param = receive_change(recevie_date);
??main_0:
        LDR.N    R0,??DataTable1
        LDRB     R0,[R0, #+0]
          CFI FunCall receive_change
        BL       receive_change
        LDR.N    R1,??DataTable1_1
        STRB     R0,[R1, #+0]
        B.N      ??main_0
          CFI EndBlock cfiBlock0
//   25     }
//   26       
//   27 }
//   28 
//   29 
//   30 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function receive_change
          CFI NoCalls
        THUMB
//   31 uint8 receive_change(uint8 recevie_temp)
//   32 {
receive_change:
        MOVS     R1,R0
//   33   
//   34       temp = recevie_temp;
        LDR.N    R0,??DataTable1_2
        STRB     R1,[R0, #+0]
//   35       return temp;
        LDR.N    R0,??DataTable1_2
        LDRB     R0,[R0, #+0]
        BX       LR               ;; return
          CFI EndBlock cfiBlock1
//   36     
//   37 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     recevie_date

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     param

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     temp

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
//  2 bytes in section .bss
//  1 byte  in section .data
// 48 bytes in section .text
// 
// 48 bytes of CODE memory
//  3 bytes of DATA memory
//
//Errors: none
//Warnings: none
