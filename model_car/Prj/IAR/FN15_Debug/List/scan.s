///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       07/Apr/2017  10:47:01
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\znc\project\K60FN\network_car_scale\App\scan.c
//    Command line =  
//        E:\znc\project\K60FN\network_car_scale\App\scan.c -D DEBUG -D
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
//        E:\znc\project\K60FN\network_car_scale\Prj\IAR\FN15_Debug\List\scan.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "1"
        RTMODEL "__dlib_full_locale_support", "1"
        AAPCS BASE,INTERWORK,VFP
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN gpio_get
        EXTERN gpio_init
        EXTERN port_init_NoALT
        EXTERN systick_delay_ms

        PUBLIC break_flag
        PUBLIC down_value
        PUBLIC left_value
        PUBLIC long_down_value
        PUBLIC long_left_value
        PUBLIC long_right_value
        PUBLIC long_select_value
        PUBLIC long_up_value
        PUBLIC mykey_clear
        PUBLIC mykey_init
        PUBLIC mykey_scan
        PUBLIC right_value
        PUBLIC select_value
        PUBLIC up_value
        
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
        
// E:\znc\project\K60FN\network_car_scale\App\scan.c
//    1 #include "include.h"
//    2 #include "common.h"
//    3 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//    4 uint8 left_value=0;
left_value:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//    5 uint8 right_value=0;
right_value:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//    6 uint8 down_value=0;
down_value:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//    7 uint8 up_value=0;
up_value:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//    8 uint8 select_value=0;
select_value:
        DS8 1
//    9 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   10 uint8 long_left_value=0;
long_left_value:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   11 uint8 long_right_value=0;
long_right_value:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   12 uint8 long_down_value=0;
long_down_value:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   13 uint8 long_up_value=0;
long_up_value:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   14 uint8 long_select_value=0;
long_select_value:
        DS8 1
//   15 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   16 uint8 break_flag=0;
break_flag:
        DS8 1
//   17 
//   18 
//   19 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function mykey_init
        THUMB
//   20 void mykey_init()//按键初始化
//   21 {
mykey_init:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   22   gpio_init(mykey_left,GPI,0);
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+82
          CFI FunCall gpio_init
        BL       gpio_init
//   23   port_init_NoALT(mykey_left, PULLUP);
        MOVS     R1,#+3
        MOVS     R0,#+82
          CFI FunCall port_init_NoALT
        BL       port_init_NoALT
//   24   gpio_init(mykey_right,GPI,0);
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+97
          CFI FunCall gpio_init
        BL       gpio_init
//   25   port_init_NoALT(mykey_right, PULLUP);
        MOVS     R1,#+3
        MOVS     R0,#+97
          CFI FunCall port_init_NoALT
        BL       port_init_NoALT
//   26   gpio_init(mykey_select,GPI,0);
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+81
          CFI FunCall gpio_init
        BL       gpio_init
//   27   port_init_NoALT(mykey_select, PULLUP);
        MOVS     R1,#+3
        MOVS     R0,#+81
          CFI FunCall port_init_NoALT
        BL       port_init_NoALT
//   28   gpio_init(mykey_down,GPI,0);
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+80
          CFI FunCall gpio_init
        BL       gpio_init
//   29   port_init_NoALT(mykey_down, PULLUP); 
        MOVS     R1,#+3
        MOVS     R0,#+80
          CFI FunCall port_init_NoALT
        BL       port_init_NoALT
//   30   gpio_init(mykey_up,GPI,0);
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+83
          CFI FunCall gpio_init
        BL       gpio_init
//   31   port_init_NoALT(mykey_up, PULLUP); 
        MOVS     R1,#+3
        MOVS     R0,#+83
          CFI FunCall port_init_NoALT
        BL       port_init_NoALT
//   32    
//   33 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock0
//   34 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function mykey_scan
        THUMB
//   35 void mykey_scan()//按键扫描初始化
//   36 {
mykey_scan:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   37   mykey_clear();
          CFI FunCall mykey_clear
        BL       mykey_clear
//   38   break_flag=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable1
        STRB     R0,[R1, #+0]
//   39   if(!break_flag&&gpio_get(mykey_left)==0)
        LDR.N    R0,??DataTable1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??mykey_scan_0
        MOVS     R0,#+82
          CFI FunCall gpio_get
        BL       gpio_get
        CMP      R0,#+0
        BNE.N    ??mykey_scan_0
//   40   {
//   41     DELAY_MS(100);
        MOVS     R0,#+100
          CFI FunCall systick_delay_ms
        BL       systick_delay_ms
//   42     if(!break_flag&&gpio_get(mykey_left)==0)
        LDR.N    R0,??DataTable1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??mykey_scan_0
        MOVS     R0,#+82
          CFI FunCall gpio_get
        BL       gpio_get
        CMP      R0,#+0
        BNE.N    ??mykey_scan_0
//   43     {
//   44        DELAY_MS(500);
        MOV      R0,#+500
          CFI FunCall systick_delay_ms
        BL       systick_delay_ms
//   45        if(!break_flag&&gpio_get(mykey_left)==0)
        LDR.N    R0,??DataTable1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??mykey_scan_1
        MOVS     R0,#+82
          CFI FunCall gpio_get
        BL       gpio_get
        CMP      R0,#+0
        BNE.N    ??mykey_scan_1
//   46        {
//   47          long_left_value=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable1_1
        STRB     R0,[R1, #+0]
//   48          break_flag=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable1
        STRB     R0,[R1, #+0]
        B.N      ??mykey_scan_0
//   49        }
//   50        else
//   51        {
//   52          left_value=1;
??mykey_scan_1:
        MOVS     R0,#+1
        LDR.N    R1,??DataTable1_2
        STRB     R0,[R1, #+0]
//   53          break_flag=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable1
        STRB     R0,[R1, #+0]
//   54        }
//   55     }
//   56   }
//   57   if(!break_flag&&gpio_get(mykey_right)==0)
??mykey_scan_0:
        LDR.N    R0,??DataTable1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??mykey_scan_2
        MOVS     R0,#+97
          CFI FunCall gpio_get
        BL       gpio_get
        CMP      R0,#+0
        BNE.N    ??mykey_scan_2
//   58   {
//   59     DELAY_MS(100);
        MOVS     R0,#+100
          CFI FunCall systick_delay_ms
        BL       systick_delay_ms
//   60     if(!break_flag&&gpio_get(mykey_right)==0)
        LDR.N    R0,??DataTable1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??mykey_scan_2
        MOVS     R0,#+97
          CFI FunCall gpio_get
        BL       gpio_get
        CMP      R0,#+0
        BNE.N    ??mykey_scan_2
//   61     { 
//   62       DELAY_MS(500);
        MOV      R0,#+500
          CFI FunCall systick_delay_ms
        BL       systick_delay_ms
//   63        if(!break_flag&&gpio_get(mykey_right)==0)
        LDR.N    R0,??DataTable1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??mykey_scan_3
        MOVS     R0,#+97
          CFI FunCall gpio_get
        BL       gpio_get
        CMP      R0,#+0
        BNE.N    ??mykey_scan_3
//   64        {
//   65          long_right_value=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable1_3
        STRB     R0,[R1, #+0]
//   66          break_flag=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable1
        STRB     R0,[R1, #+0]
        B.N      ??mykey_scan_2
//   67        }
//   68        else
//   69        {
//   70          right_value=1;
??mykey_scan_3:
        MOVS     R0,#+1
        LDR.N    R1,??DataTable1_4
        STRB     R0,[R1, #+0]
//   71          break_flag=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable1
        STRB     R0,[R1, #+0]
//   72        }
//   73     }
//   74   }
//   75   if(!break_flag&&gpio_get(mykey_select)==0)
??mykey_scan_2:
        LDR.N    R0,??DataTable1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??mykey_scan_4
        MOVS     R0,#+81
          CFI FunCall gpio_get
        BL       gpio_get
        CMP      R0,#+0
        BNE.N    ??mykey_scan_4
//   76   {
//   77     DELAY_MS(100);
        MOVS     R0,#+100
          CFI FunCall systick_delay_ms
        BL       systick_delay_ms
//   78     if(!break_flag&&gpio_get(mykey_select)==0)
        LDR.N    R0,??DataTable1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??mykey_scan_4
        MOVS     R0,#+81
          CFI FunCall gpio_get
        BL       gpio_get
        CMP      R0,#+0
        BNE.N    ??mykey_scan_4
//   79     { 
//   80        DELAY_MS(500);
        MOV      R0,#+500
          CFI FunCall systick_delay_ms
        BL       systick_delay_ms
//   81        if(!break_flag&&gpio_get(mykey_select)==0)
        LDR.N    R0,??DataTable1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??mykey_scan_5
        MOVS     R0,#+81
          CFI FunCall gpio_get
        BL       gpio_get
        CMP      R0,#+0
        BNE.N    ??mykey_scan_5
//   82        {
//   83          long_select_value=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable1_5
        STRB     R0,[R1, #+0]
//   84          break_flag=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable1
        STRB     R0,[R1, #+0]
        B.N      ??mykey_scan_4
//   85        }
//   86        else
//   87        {
//   88          select_value=1;
??mykey_scan_5:
        MOVS     R0,#+1
        LDR.N    R1,??DataTable1_6
        STRB     R0,[R1, #+0]
//   89          break_flag=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable1
        STRB     R0,[R1, #+0]
//   90        }
//   91     }
//   92   }
//   93   if(!break_flag&&gpio_get(mykey_down)==0)
??mykey_scan_4:
        LDR.N    R0,??DataTable1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??mykey_scan_6
        MOVS     R0,#+80
          CFI FunCall gpio_get
        BL       gpio_get
        CMP      R0,#+0
        BNE.N    ??mykey_scan_6
//   94   {
//   95     DELAY_MS(100);
        MOVS     R0,#+100
          CFI FunCall systick_delay_ms
        BL       systick_delay_ms
//   96     if(!break_flag&&gpio_get(mykey_down)==0)
        LDR.N    R0,??DataTable1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??mykey_scan_6
        MOVS     R0,#+80
          CFI FunCall gpio_get
        BL       gpio_get
        CMP      R0,#+0
        BNE.N    ??mykey_scan_6
//   97     {  
//   98        DELAY_MS(500);
        MOV      R0,#+500
          CFI FunCall systick_delay_ms
        BL       systick_delay_ms
//   99        if(!break_flag&&gpio_get(mykey_down)==0)
        LDR.N    R0,??DataTable1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??mykey_scan_7
        MOVS     R0,#+80
          CFI FunCall gpio_get
        BL       gpio_get
        CMP      R0,#+0
        BNE.N    ??mykey_scan_7
//  100        {
//  101          long_down_value=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable1_7
        STRB     R0,[R1, #+0]
//  102          break_flag=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable1
        STRB     R0,[R1, #+0]
        B.N      ??mykey_scan_6
//  103        }
//  104        else
//  105        {
//  106          down_value=1;
??mykey_scan_7:
        MOVS     R0,#+1
        LDR.N    R1,??DataTable1_8
        STRB     R0,[R1, #+0]
//  107          break_flag=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable1
        STRB     R0,[R1, #+0]
//  108        }
//  109     }
//  110   }
//  111   if(!break_flag&&gpio_get(mykey_up)==0)
??mykey_scan_6:
        LDR.N    R0,??DataTable1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??mykey_scan_8
        MOVS     R0,#+83
          CFI FunCall gpio_get
        BL       gpio_get
        CMP      R0,#+0
        BNE.N    ??mykey_scan_8
//  112   {
//  113     DELAY_MS(100);
        MOVS     R0,#+100
          CFI FunCall systick_delay_ms
        BL       systick_delay_ms
//  114     if(!break_flag&&gpio_get(mykey_up)==0)
        LDR.N    R0,??DataTable1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??mykey_scan_8
        MOVS     R0,#+83
          CFI FunCall gpio_get
        BL       gpio_get
        CMP      R0,#+0
        BNE.N    ??mykey_scan_8
//  115     { 
//  116       DELAY_MS(500);
        MOV      R0,#+500
          CFI FunCall systick_delay_ms
        BL       systick_delay_ms
//  117        if(!break_flag&&gpio_get(mykey_up)==0)
        LDR.N    R0,??DataTable1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??mykey_scan_9
        MOVS     R0,#+83
          CFI FunCall gpio_get
        BL       gpio_get
        CMP      R0,#+0
        BNE.N    ??mykey_scan_9
//  118        {
//  119          long_up_value=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable1_9
        STRB     R0,[R1, #+0]
//  120          break_flag=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable1
        STRB     R0,[R1, #+0]
        B.N      ??mykey_scan_8
//  121        }
//  122        else
//  123        {
//  124          up_value=1;
??mykey_scan_9:
        MOVS     R0,#+1
        LDR.N    R1,??DataTable1_10
        STRB     R0,[R1, #+0]
//  125          break_flag=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable1
        STRB     R0,[R1, #+0]
//  126        }
//  127     }
//  128   }
//  129   
//  130     
//  131 }
??mykey_scan_8:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock1

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function mykey_clear
          CFI NoCalls
        THUMB
//  132 void mykey_clear()
//  133 {
//  134   left_value=0;
mykey_clear:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable1_2
        STRB     R0,[R1, #+0]
//  135   right_value=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable1_4
        STRB     R0,[R1, #+0]
//  136   down_value=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable1_8
        STRB     R0,[R1, #+0]
//  137   up_value=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable1_10
        STRB     R0,[R1, #+0]
//  138   select_value=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable1_6
        STRB     R0,[R1, #+0]
//  139   long_left_value=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable1_1
        STRB     R0,[R1, #+0]
//  140   long_right_value=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable1_3
        STRB     R0,[R1, #+0]
//  141   long_down_value=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable1_7
        STRB     R0,[R1, #+0]
//  142   long_up_value=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable1_9
        STRB     R0,[R1, #+0]
//  143   long_select_value=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable1_5
        STRB     R0,[R1, #+0]
//  144 
//  145 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     break_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     long_left_value

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     left_value

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     long_right_value

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     right_value

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_5:
        DC32     long_select_value

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_6:
        DC32     select_value

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_7:
        DC32     long_down_value

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_8:
        DC32     down_value

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_9:
        DC32     long_up_value

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_10:
        DC32     up_value

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
//  11 bytes in section .bss
// 684 bytes in section .text
// 
// 684 bytes of CODE memory
//  11 bytes of DATA memory
//
//Errors: none
//Warnings: none
