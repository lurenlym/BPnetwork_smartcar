///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       21/Mar/2017  16:05:22
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\znc\project\K60FN\network_car\Board\src\VCAN_camera.c
//    Command line =  
//        E:\znc\project\K60FN\network_car\Board\src\VCAN_camera.c -D DEBUG -D
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
//        E:\znc\project\K60FN\network_car\Prj\IAR\FN15_Debug\List\VCAN_camera.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "1"
        RTMODEL "__dlib_full_locale_support", "1"
        AAPCS BASE,INTERWORK,VFP
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        PUBLIC img_extract
        
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
        
// E:\znc\project\K60FN\network_car\Board\src\VCAN_camera.c
//    1 #include "common.h"
//    2 
//    3 
//    4 //压缩二值化图像解压（空间 换 时间 解压）
//    5 //srclen 是二值化图像的占用空间大小
//    6 //【鹰眼解压】鹰眼图像解压，转为 二维数组 - 智能车资料区 - 山外论坛 http://vcan123.com/forum.php?mod=viewthread&tid=17&ctid=6
//    7 //解压的时候，里面有个数组，配置黑、白对应的值是多少。

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function img_extract
          CFI NoCalls
        THUMB
//    8 void img_extract(void *dst, void *src, uint32_t srclen)
//    9 {
img_extract:
        PUSH     {R3-R7}
          CFI R7 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+20
//   10     uint8_t colour[2] = {255, 0}; //0 和 1 分别对应的颜色
        LDR.N    R3,??img_extract_0
        LDRH     R3,[R3, #+0]
        STRH     R3,[SP, #+0]
//   11     uint8_t * mdst = dst;
        MOVS     R5,R0
//   12     uint8_t * msrc = src;
        MOVS     R4,R1
//   13     //注：山外的摄像头 0 表示 白色，1表示 黑色
//   14     uint8_t tmpsrc;
//   15     while(srclen --)
??img_extract_1:
        MOVS     R6,R2
        SUBS     R2,R6,#+1
        CMP      R6,#+0
        BEQ.N    ??img_extract_2
//   16     {
//   17         tmpsrc = *msrc++;
        LDRB     R6,[R4, #+0]
        MOVS     R3,R6
        ADDS     R4,R4,#+1
//   18         *mdst++ = colour[ (tmpsrc >> 7 ) & 0x01 ];
        ADD      R6,SP,#+0
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        ASRS     R7,R3,#+7
        LDRB     R6,[R7, R6]
        STRB     R6,[R5, #+0]
        ADDS     R5,R5,#+1
//   19         *mdst++ = colour[ (tmpsrc >> 6 ) & 0x01 ];
        ADD      R6,SP,#+0
        UBFX     R7,R3,#+6,#+1
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        LDRB     R6,[R7, R6]
        STRB     R6,[R5, #+0]
        ADDS     R5,R5,#+1
//   20         *mdst++ = colour[ (tmpsrc >> 5 ) & 0x01 ];
        ADD      R6,SP,#+0
        UBFX     R7,R3,#+5,#+1
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        LDRB     R6,[R7, R6]
        STRB     R6,[R5, #+0]
        ADDS     R5,R5,#+1
//   21         *mdst++ = colour[ (tmpsrc >> 4 ) & 0x01 ];
        ADD      R6,SP,#+0
        UBFX     R7,R3,#+4,#+1
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        LDRB     R6,[R7, R6]
        STRB     R6,[R5, #+0]
        ADDS     R5,R5,#+1
//   22         *mdst++ = colour[ (tmpsrc >> 3 ) & 0x01 ];
        ADD      R6,SP,#+0
        UBFX     R7,R3,#+3,#+1
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        LDRB     R6,[R7, R6]
        STRB     R6,[R5, #+0]
        ADDS     R5,R5,#+1
//   23         *mdst++ = colour[ (tmpsrc >> 2 ) & 0x01 ];
        ADD      R6,SP,#+0
        UBFX     R7,R3,#+2,#+1
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        LDRB     R6,[R7, R6]
        STRB     R6,[R5, #+0]
        ADDS     R5,R5,#+1
//   24         *mdst++ = colour[ (tmpsrc >> 1 ) & 0x01 ];
        ADD      R6,SP,#+0
        UBFX     R7,R3,#+1,#+1
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        LDRB     R6,[R7, R6]
        STRB     R6,[R5, #+0]
        ADDS     R5,R5,#+1
//   25         *mdst++ = colour[ (tmpsrc >> 0 ) & 0x01 ];
        ADD      R6,SP,#+0
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        ANDS     R7,R3,#0x1
        LDRB     R6,[R7, R6]
        STRB     R6,[R5, #+0]
        ADDS     R5,R5,#+1
        B.N      ??img_extract_1
//   26     }
//   27 }
??img_extract_2:
        POP      {R0,R4-R7}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI R6 SameValue
          CFI R7 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
        DATA
??img_extract_0:
        DC32     ?_0
          CFI EndBlock cfiBlock0

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
?_0:
        DATA
        DC8 255, 0

        END
// 
//   2 bytes in section .rodata
// 148 bytes in section .text
// 
// 148 bytes of CODE  memory
//   2 bytes of CONST memory
//
//Errors: none
//Warnings: none
