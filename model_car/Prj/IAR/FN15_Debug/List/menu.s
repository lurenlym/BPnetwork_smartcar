///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       07/Apr/2017  10:46:58
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\znc\project\K60FN\network_car_scale\App\menu.c
//    Command line =  
//        E:\znc\project\K60FN\network_car_scale\App\menu.c -D DEBUG -D
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
//        E:\znc\project\K60FN\network_car_scale\Prj\IAR\FN15_Debug\List\menu.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "1"
        RTMODEL "__dlib_full_locale_support", "1"
        AAPCS BASE,INTERWORK,VFP
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN LCD_clear
        EXTERN LCD_num
        EXTERN LCD_str
        EXTERN down_value
        EXTERN left_value
        EXTERN long_left_value
        EXTERN long_right_value
        EXTERN mykey_clear
        EXTERN mykey_scan
        EXTERN right_value

        PUBLIC DIAND
        PUBLIC DIANI
        PUBLIC DIANP
        PUBLIC DUOD
        PUBLIC DUOI
        PUBLIC DUOP
        PUBLIC Q_B
        PUBLIC Q_H
        PUBLIC date_display_flag
        PUBLIC dealsize_all_flag
        PUBLIC dealsizedisplay_first_flag
        PUBLIC dealsizedisplay_flag
        PUBLIC dealsizedisplay_menu
        PUBLIC dian_d_flag
        PUBLIC dian_i_flag
        PUBLIC dian_p_flag
        PUBLIC dianpiddisplay_first_flag
        PUBLIC dianpiddisplay_flag
        PUBLIC dianpiddisplay_menu
        PUBLIC display_flag
        PUBLIC duo_d_flag
        PUBLIC duo_i_flag
        PUBLIC duo_p_flag
        PUBLIC duopiddisplay_first_flag
        PUBLIC duopiddisplay_flag
        PUBLIC duopiddisplay_menu
        PUBLIC expectdisplay_first_flag
        PUBLIC expectdisplay_flag
        PUBLIC expectdisplay_menu
        PUBLIC imagedisplay_first_flag
        PUBLIC imagedisplay_menu
        PUBLIC menu1_site
        PUBLIC ov7620_display_flag
        PUBLIC qi_b_flag
        PUBLIC qi_h_flag
        
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
        
// E:\znc\project\K60FN\network_car_scale\App\menu.c
//    1 #include "include.h"
//    2 #include "menu.h"
//    3 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//    4 uint8 ov7620_display_flag=0;
ov7620_display_flag:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//    5 uint8 date_display_flag=0;
date_display_flag:
        DS8 1

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//    6 uint8 dealsize_all_flag=1;
dealsize_all_flag:
        DATA
        DC8 1
//    7 

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//    8 uint8 display_flag=1;
display_flag:
        DATA
        DC8 1

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//    9 uint8 duopiddisplay_flag=1;
duopiddisplay_flag:
        DATA
        DC8 1

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   10 uint8 dianpiddisplay_flag=1;
dianpiddisplay_flag:
        DATA
        DC8 1

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   11 uint8 expectdisplay_flag=1;
expectdisplay_flag:
        DATA
        DC8 1

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   12 uint8 dealsizedisplay_flag=1;
dealsizedisplay_flag:
        DATA
        DC8 1
//   13 

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   14 uint8 imagedisplay_first_flag=1;
imagedisplay_first_flag:
        DATA
        DC8 1

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   15 uint8 duopiddisplay_first_flag=1;
duopiddisplay_first_flag:
        DATA
        DC8 1

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   16 uint8 dianpiddisplay_first_flag=1;
dianpiddisplay_first_flag:
        DATA
        DC8 1

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   17 uint8 expectdisplay_first_flag=1;
expectdisplay_first_flag:
        DATA
        DC8 1

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   18 uint8 dealsizedisplay_first_flag=1;
dealsizedisplay_first_flag:
        DATA
        DC8 1
//   19 

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   20 uint8 duo_p_flag=1;
duo_p_flag:
        DATA
        DC8 1

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   21 uint8 duo_i_flag=1;
duo_i_flag:
        DATA
        DC8 1

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   22 uint8 duo_d_flag=1;
duo_d_flag:
        DATA
        DC8 1

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   23 uint8 dian_p_flag=1;
dian_p_flag:
        DATA
        DC8 1

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   24 uint8 dian_i_flag=1;
dian_i_flag:
        DATA
        DC8 1

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   25 uint8 dian_d_flag=1;
dian_d_flag:
        DATA
        DC8 1

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   26 uint8 qi_h_flag=1;
qi_h_flag:
        DATA
        DC8 1

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   27 uint8 qi_b_flag=1;
qi_b_flag:
        DATA
        DC8 1
//   28 

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   29 uint16 DUOP=0;
DUOP:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   30 uint16 DUOI=0;
DUOI:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   31 uint16 DUOD=0;
DUOD:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   32 uint16 DIANP=0;
DIANP:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   33 uint16 DIANI=0;
DIANI:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   34 uint16 DIAND=0;
DIAND:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   35 uint16 Q_H=0;
Q_H:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   36 uint16 Q_B=0;
Q_B:
        DS8 2
//   37 
//   38 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   39 Site_t menu1_site={10,5};
menu1_site:
        DATA
        DC16 10, 5
//   40 
//   41 void duopiddisplay_menu();
//   42 void dianpiddisplay_menu();
//   43 void expectdisplay_menu();
//   44 void dealsizedisplay_menu();
//   45 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function imagedisplay_menu
        THUMB
//   46 void imagedisplay_menu()//图像选择开启菜单
//   47 {
imagedisplay_menu:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   48    
//   49   mykey_scan();
          CFI FunCall mykey_scan
        BL       mykey_scan
//   50   
//   51   if(imagedisplay_first_flag)
        LDR.W    R0,??DataTable1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??imagedisplay_menu_0
//   52   {
//   53     menu1_site.y=5;
        MOVS     R0,#+5
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+2]
//   54     LCD_str(menu1_site,"OV7620", BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.W    R1,??DataTable1_1
        LDR.W    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_str
        BL       LCD_str
//   55     menu1_site.y=20;
        MOVS     R0,#+20
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+2]
//   56     LCD_str(menu1_site,"date", BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.W    R1,??DataTable2_1
        LDR.W    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_str
        BL       LCD_str
//   57     menu1_site.y=35;
        MOVS     R0,#+35
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+2]
//   58     LCD_str(menu1_site,"nodisplay", BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.W    R1,??DataTable2_2
        LDR.W    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_str
        BL       LCD_str
//   59     imagedisplay_first_flag=0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable1
        STRB     R0,[R1, #+0]
//   60   }
//   61   if(left_value)
??imagedisplay_menu_0:
        LDR.W    R0,??DataTable2_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??imagedisplay_menu_1
//   62   {
//   63     ov7620_display_flag=1;
        MOVS     R0,#+1
        LDR.W    R1,??DataTable2_4
        STRB     R0,[R1, #+0]
//   64     date_display_flag=0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable2_5
        STRB     R0,[R1, #+0]
//   65     LCD_clear(RED);
        MOV      R0,#+63488
          CFI FunCall LCD_clear
        BL       LCD_clear
//   66     menu1_site.y=5;
        MOVS     R0,#+5
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+2]
//   67     LCD_str(menu1_site,"OV7620", WHITE,RED);
        MOV      R3,#+63488
        MOVW     R2,#+65535
        LDR.W    R1,??DataTable1_1
        LDR.W    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_str
        BL       LCD_str
//   68     menu1_site.y=20;
        MOVS     R0,#+20
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+2]
//   69     LCD_str(menu1_site,"date", BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.W    R1,??DataTable2_1
        LDR.W    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_str
        BL       LCD_str
//   70     menu1_site.y=35;
        MOVS     R0,#+35
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+2]
//   71     LCD_str(menu1_site,"nodisplay", BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.W    R1,??DataTable2_2
        LDR.W    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_str
        BL       LCD_str
//   72   }
//   73   if(right_value)
??imagedisplay_menu_1:
        LDR.W    R0,??DataTable2_6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??imagedisplay_menu_2
//   74   {
//   75     date_display_flag=1;
        MOVS     R0,#+1
        LDR.W    R1,??DataTable2_5
        STRB     R0,[R1, #+0]
//   76     ov7620_display_flag=0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable2_4
        STRB     R0,[R1, #+0]
//   77     LCD_clear(RED);
        MOV      R0,#+63488
          CFI FunCall LCD_clear
        BL       LCD_clear
//   78     menu1_site.y=5;
        MOVS     R0,#+5
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+2]
//   79     LCD_str(menu1_site,"OV7620", BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.W    R1,??DataTable1_1
        LDR.W    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_str
        BL       LCD_str
//   80     menu1_site.y=20;
        MOVS     R0,#+20
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+2]
//   81     LCD_str(menu1_site,"date", WHITE,RED);
        MOV      R3,#+63488
        MOVW     R2,#+65535
        LDR.W    R1,??DataTable2_1
        LDR.W    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_str
        BL       LCD_str
//   82     menu1_site.y=35;
        MOVS     R0,#+35
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+2]
//   83     LCD_str(menu1_site,"nodisplay", BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.W    R1,??DataTable2_2
        LDR.W    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_str
        BL       LCD_str
//   84   }
//   85   if(long_left_value)
??imagedisplay_menu_2:
        LDR.W    R0,??DataTable2_7
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??imagedisplay_menu_3
//   86   {
//   87     ov7620_display_flag=0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable2_4
        STRB     R0,[R1, #+0]
//   88     date_display_flag=0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable2_5
        STRB     R0,[R1, #+0]
//   89     LCD_clear(RED);
        MOV      R0,#+63488
          CFI FunCall LCD_clear
        BL       LCD_clear
//   90     menu1_site.y=5;
        MOVS     R0,#+5
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+2]
//   91     LCD_str(menu1_site,"OV7620", BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.W    R1,??DataTable1_1
        LDR.W    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_str
        BL       LCD_str
//   92     menu1_site.y=20;
        MOVS     R0,#+20
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+2]
//   93     LCD_str(menu1_site,"date", BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.W    R1,??DataTable2_1
        LDR.W    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_str
        BL       LCD_str
//   94     menu1_site.y=35;
        MOVS     R0,#+35
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+2]
//   95     LCD_str(menu1_site,"nodisplay", WHITE,RED);
        MOV      R3,#+63488
        MOVW     R2,#+65535
        LDR.W    R1,??DataTable2_2
        LDR.W    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_str
        BL       LCD_str
//   96   }
//   97   if(down_value)
??imagedisplay_menu_3:
        LDR.W    R0,??DataTable2_8
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??imagedisplay_menu_4
//   98   {
//   99     display_flag=0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable2_9
        STRB     R0,[R1, #+0]
//  100     LCD_clear(RED);
        MOV      R0,#+63488
          CFI FunCall LCD_clear
        BL       LCD_clear
//  101     while(duopiddisplay_flag)
??imagedisplay_menu_5:
        LDR.W    R0,??DataTable2_10
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??imagedisplay_menu_4
//  102     {
//  103       duopiddisplay_menu();
          CFI FunCall duopiddisplay_menu
        BL       duopiddisplay_menu
        B.N      ??imagedisplay_menu_5
//  104     }
//  105   }  
//  106 }
??imagedisplay_menu_4:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock0
//  107 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function duopiddisplay_menu
        THUMB
//  108 void duopiddisplay_menu()  //舵机PID选择调整
//  109 {
duopiddisplay_menu:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  110   mykey_scan();
          CFI FunCall mykey_scan
        BL       mykey_scan
//  111   if(duopiddisplay_first_flag)
        LDR.W    R0,??DataTable2_11
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.W    ??duopiddisplay_menu_0
//  112   {
//  113     menu1_site.x=10;
        MOVS     R0,#+10
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+0]
//  114     menu1_site.y=5;
        MOVS     R0,#+5
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+2]
//  115     LCD_str(menu1_site,"duo_p", BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.W    R1,??DataTable2_12
        LDR.W    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_str
        BL       LCD_str
//  116     menu1_site.x=65;
        MOVS     R0,#+65
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+0]
//  117     menu1_site.y=5;
        MOVS     R0,#+5
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+2]
//  118     LCD_num(menu1_site,DUOP, BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.W    R0,??DataTable2_13
        LDRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_num
        BL       LCD_num
//  119     menu1_site.x=10;
        MOVS     R0,#+10
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+0]
//  120     menu1_site.y=20;
        MOVS     R0,#+20
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+2]
//  121     LCD_str(menu1_site,"duo_i", BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.W    R1,??DataTable2_14
        LDR.W    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_str
        BL       LCD_str
//  122     menu1_site.x=65;
        MOVS     R0,#+65
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+0]
//  123     menu1_site.y=20;
        MOVS     R0,#+20
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+2]
//  124     LCD_num(menu1_site,DUOI, BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.W    R0,??DataTable2_15
        LDRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_num
        BL       LCD_num
//  125     menu1_site.x=10;
        MOVS     R0,#+10
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+0]
//  126     menu1_site.y=35;
        MOVS     R0,#+35
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+2]
//  127     LCD_str(menu1_site,"duo_d", BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.W    R1,??DataTable2_16
        LDR.W    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_str
        BL       LCD_str
//  128     menu1_site.x=65;
        MOVS     R0,#+65
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+0]
//  129     menu1_site.y=35;
        MOVS     R0,#+35
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+2]
//  130     LCD_num(menu1_site,DUOD, BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.W    R0,??DataTable2_17
        LDRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_num
        BL       LCD_num
//  131     
//  132     duopiddisplay_first_flag=0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable2_11
        STRB     R0,[R1, #+0]
//  133     duo_p_flag=1;
        MOVS     R0,#+1
        LDR.W    R1,??DataTable2_18
        STRB     R0,[R1, #+0]
//  134     duo_i_flag=1;
        MOVS     R0,#+1
        LDR.W    R1,??DataTable2_19
        STRB     R0,[R1, #+0]
//  135     duo_d_flag=1;
        MOVS     R0,#+1
        LDR.W    R1,??DataTable2_20
        STRB     R0,[R1, #+0]
//  136   }
//  137   if(left_value)
??duopiddisplay_menu_0:
        LDR.W    R0,??DataTable2_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.W    ??duopiddisplay_menu_1
//  138   {
//  139     while(duo_p_flag)
??duopiddisplay_menu_2:
        LDR.W    R0,??DataTable2_18
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.W    ??duopiddisplay_menu_1
//  140     {
//  141       mykey_scan();
          CFI FunCall mykey_scan
        BL       mykey_scan
//  142       menu1_site.x=10;
        MOVS     R0,#+10
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+0]
//  143       menu1_site.y=5;
        MOVS     R0,#+5
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+2]
//  144       LCD_str(menu1_site,"duo_p", WHITE,RED);
        MOV      R3,#+63488
        MOVW     R2,#+65535
        LDR.W    R1,??DataTable2_12
        LDR.W    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_str
        BL       LCD_str
//  145       menu1_site.x=65;
        MOVS     R0,#+65
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+0]
//  146       menu1_site.y=5;
        MOVS     R0,#+5
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+2]
//  147       LCD_num(menu1_site,DUOP, WHITE,RED);
        MOV      R3,#+63488
        MOVW     R2,#+65535
        LDR.W    R0,??DataTable2_13
        LDRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_num
        BL       LCD_num
//  148       menu1_site.x=10;
        MOVS     R0,#+10
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+0]
//  149       menu1_site.y=20;
        MOVS     R0,#+20
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+2]
//  150       LCD_str(menu1_site,"duo_i", BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.W    R1,??DataTable2_14
        LDR.W    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_str
        BL       LCD_str
//  151       menu1_site.x=65;
        MOVS     R0,#+65
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+0]
//  152       menu1_site.y=20;
        MOVS     R0,#+20
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+2]
//  153       LCD_num(menu1_site,DUOI, BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.W    R0,??DataTable2_15
        LDRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_num
        BL       LCD_num
//  154       menu1_site.x=10;
        MOVS     R0,#+10
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+0]
//  155       menu1_site.y=35;
        MOVS     R0,#+35
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+2]
//  156       LCD_str(menu1_site,"duo_d", BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.W    R1,??DataTable2_16
        LDR.W    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_str
        BL       LCD_str
//  157       menu1_site.x=65;
        MOVS     R0,#+65
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+0]
//  158       menu1_site.y=35;
        MOVS     R0,#+35
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+2]
//  159       LCD_num(menu1_site,DUOD, BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.W    R0,??DataTable2_17
        LDRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_num
        BL       LCD_num
//  160       if(left_value)
        LDR.W    R0,??DataTable2_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??duopiddisplay_menu_3
//  161       {
//  162         DUOP=DUOP-1;
        LDR.W    R0,??DataTable2_13
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable2_13
        STRH     R0,[R1, #+0]
//  163         LCD_clear(RED);
        MOV      R0,#+63488
          CFI FunCall LCD_clear
        BL       LCD_clear
//  164       }
//  165       if(right_value)
??duopiddisplay_menu_3:
        LDR.W    R0,??DataTable2_6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??duopiddisplay_menu_4
//  166       {
//  167         DUOP=DUOP+1;
        LDR.W    R0,??DataTable2_13
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable2_13
        STRH     R0,[R1, #+0]
//  168         LCD_clear(RED);
        MOV      R0,#+63488
          CFI FunCall LCD_clear
        BL       LCD_clear
//  169       }
//  170       if(long_left_value)
??duopiddisplay_menu_4:
        LDR.W    R0,??DataTable2_7
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??duopiddisplay_menu_5
//  171       {
//  172         DUOP=DUOP-10;
        LDR.W    R0,??DataTable2_13
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+10
        LDR.W    R1,??DataTable2_13
        STRH     R0,[R1, #+0]
//  173         LCD_clear(RED);
        MOV      R0,#+63488
          CFI FunCall LCD_clear
        BL       LCD_clear
//  174       }
//  175       if(long_right_value)
??duopiddisplay_menu_5:
        LDR.W    R0,??DataTable3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??duopiddisplay_menu_6
//  176       {
//  177         DUOP=DUOP+10;
        LDR.W    R0,??DataTable2_13
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+10
        LDR.W    R1,??DataTable2_13
        STRH     R0,[R1, #+0]
//  178         LCD_clear(RED);
        MOV      R0,#+63488
          CFI FunCall LCD_clear
        BL       LCD_clear
//  179       }
//  180       if(down_value)
??duopiddisplay_menu_6:
        LDR.W    R0,??DataTable2_8
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.W    ??duopiddisplay_menu_2
//  181       {
//  182         duopiddisplay_first_flag=1;
        MOVS     R0,#+1
        LDR.W    R1,??DataTable2_11
        STRB     R0,[R1, #+0]
//  183         duo_p_flag=0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable2_18
        STRB     R0,[R1, #+0]
//  184         mykey_clear();
          CFI FunCall mykey_clear
        BL       mykey_clear
        B.N      ??duopiddisplay_menu_2
//  185       }
//  186     }
//  187    
//  188   }
//  189   if(right_value)
??duopiddisplay_menu_1:
        LDR.W    R0,??DataTable2_6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.W    ??duopiddisplay_menu_7
//  190   {
//  191     while(duo_i_flag)
??duopiddisplay_menu_8:
        LDR.W    R0,??DataTable2_19
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.W    ??duopiddisplay_menu_7
//  192     {
//  193       mykey_scan();
          CFI FunCall mykey_scan
        BL       mykey_scan
//  194       menu1_site.x=10;
        MOVS     R0,#+10
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+0]
//  195       menu1_site.y=5;
        MOVS     R0,#+5
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+2]
//  196       LCD_str(menu1_site,"duo_p", BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.W    R1,??DataTable2_12
        LDR.W    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_str
        BL       LCD_str
//  197       menu1_site.x=65;
        MOVS     R0,#+65
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+0]
//  198       menu1_site.y=5;
        MOVS     R0,#+5
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+2]
//  199       LCD_num(menu1_site,DUOP, BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.W    R0,??DataTable2_13
        LDRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_num
        BL       LCD_num
//  200       menu1_site.x=10;
        MOVS     R0,#+10
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+0]
//  201       menu1_site.y=20;
        MOVS     R0,#+20
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+2]
//  202       LCD_str(menu1_site,"duo_i", WHITE,RED);
        MOV      R3,#+63488
        MOVW     R2,#+65535
        LDR.W    R1,??DataTable2_14
        LDR.W    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_str
        BL       LCD_str
//  203       menu1_site.x=65;
        MOVS     R0,#+65
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+0]
//  204       menu1_site.y=20;
        MOVS     R0,#+20
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+2]
//  205       LCD_num(menu1_site,DUOI, WHITE,RED);
        MOV      R3,#+63488
        MOVW     R2,#+65535
        LDR.W    R0,??DataTable2_15
        LDRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_num
        BL       LCD_num
//  206       menu1_site.x=10;
        MOVS     R0,#+10
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+0]
//  207       menu1_site.y=35;
        MOVS     R0,#+35
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+2]
//  208       LCD_str(menu1_site,"duo_d", BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.W    R1,??DataTable2_16
        LDR.W    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_str
        BL       LCD_str
//  209       menu1_site.x=65;
        MOVS     R0,#+65
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+0]
//  210       menu1_site.y=35;
        MOVS     R0,#+35
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+2]
//  211       LCD_num(menu1_site,DUOD, BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.W    R0,??DataTable2_17
        LDRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_num
        BL       LCD_num
//  212       if(left_value)
        LDR.W    R0,??DataTable2_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??duopiddisplay_menu_9
//  213       {
//  214         DUOI=DUOI-1;
        LDR.W    R0,??DataTable2_15
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable2_15
        STRH     R0,[R1, #+0]
//  215         LCD_clear(RED);
        MOV      R0,#+63488
          CFI FunCall LCD_clear
        BL       LCD_clear
//  216       }
//  217       if(right_value)
??duopiddisplay_menu_9:
        LDR.W    R0,??DataTable2_6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??duopiddisplay_menu_10
//  218       {
//  219         DUOI=DUOI+1;
        LDR.W    R0,??DataTable2_15
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable2_15
        STRH     R0,[R1, #+0]
//  220         LCD_clear(RED);
        MOV      R0,#+63488
          CFI FunCall LCD_clear
        BL       LCD_clear
//  221       }
//  222       if(long_left_value)
??duopiddisplay_menu_10:
        LDR.W    R0,??DataTable2_7
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??duopiddisplay_menu_11
//  223       {
//  224         DUOI=DUOI-10;
        LDR.W    R0,??DataTable2_15
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+10
        LDR.W    R1,??DataTable2_15
        STRH     R0,[R1, #+0]
//  225         LCD_clear(RED);
        MOV      R0,#+63488
          CFI FunCall LCD_clear
        BL       LCD_clear
//  226       }
//  227       if(long_right_value)
??duopiddisplay_menu_11:
        LDR.W    R0,??DataTable3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??duopiddisplay_menu_12
//  228       {
//  229         DUOI=DUOI+10;
        LDR.W    R0,??DataTable2_15
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+10
        LDR.W    R1,??DataTable2_15
        STRH     R0,[R1, #+0]
//  230         LCD_clear(RED);
        MOV      R0,#+63488
          CFI FunCall LCD_clear
        BL       LCD_clear
//  231       }
//  232       if(down_value)
??duopiddisplay_menu_12:
        LDR.W    R0,??DataTable2_8
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.W    ??duopiddisplay_menu_8
//  233       {
//  234         duopiddisplay_first_flag=1;
        MOVS     R0,#+1
        LDR.W    R1,??DataTable2_11
        STRB     R0,[R1, #+0]
//  235         duo_i_flag=0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable2_19
        STRB     R0,[R1, #+0]
//  236         mykey_clear();
          CFI FunCall mykey_clear
        BL       mykey_clear
        B.N      ??duopiddisplay_menu_8
//  237       }
//  238     }
//  239    
//  240     
//  241   }
//  242   if(long_left_value)
??duopiddisplay_menu_7:
        LDR.W    R0,??DataTable2_7
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.W    ??duopiddisplay_menu_13
//  243   {
//  244     while(duo_d_flag)
??duopiddisplay_menu_14:
        LDR.W    R0,??DataTable2_20
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.W    ??duopiddisplay_menu_13
//  245     {
//  246       mykey_scan();
          CFI FunCall mykey_scan
        BL       mykey_scan
//  247       menu1_site.x=10;
        MOVS     R0,#+10
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+0]
//  248       menu1_site.y=5;
        MOVS     R0,#+5
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+2]
//  249       LCD_str(menu1_site,"duo_p", BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.W    R1,??DataTable2_12
        LDR.W    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_str
        BL       LCD_str
//  250       menu1_site.x=65;
        MOVS     R0,#+65
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+0]
//  251       menu1_site.y=5;
        MOVS     R0,#+5
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+2]
//  252       LCD_num(menu1_site,DUOP, BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.W    R0,??DataTable2_13
        LDRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_num
        BL       LCD_num
//  253       menu1_site.x=10;
        MOVS     R0,#+10
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+0]
//  254       menu1_site.y=20;
        MOVS     R0,#+20
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+2]
//  255       LCD_str(menu1_site,"duo_i", BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.W    R1,??DataTable2_14
        LDR.W    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_str
        BL       LCD_str
//  256       menu1_site.x=65;
        MOVS     R0,#+65
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+0]
//  257       menu1_site.y=20;
        MOVS     R0,#+20
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+2]
//  258       LCD_num(menu1_site,DUOI, BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.W    R0,??DataTable2_15
        LDRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_num
        BL       LCD_num
//  259       menu1_site.x=10;
        MOVS     R0,#+10
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+0]
//  260       menu1_site.y=35;
        MOVS     R0,#+35
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+2]
//  261       LCD_str(menu1_site,"duo_d", WHITE,RED);
        MOV      R3,#+63488
        MOVW     R2,#+65535
        LDR.W    R1,??DataTable2_16
        LDR.W    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_str
        BL       LCD_str
//  262       menu1_site.x=65;
        MOVS     R0,#+65
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+0]
//  263       menu1_site.y=35;
        MOVS     R0,#+35
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+2]
//  264       LCD_num(menu1_site,DUOD, WHITE,RED);
        MOV      R3,#+63488
        MOVW     R2,#+65535
        LDR.W    R0,??DataTable2_17
        LDRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_num
        BL       LCD_num
//  265       if(left_value)
        LDR.W    R0,??DataTable2_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??duopiddisplay_menu_15
//  266       {
//  267         DUOD=DUOD-1;
        LDR.W    R0,??DataTable2_17
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable2_17
        STRH     R0,[R1, #+0]
//  268         LCD_clear(RED);
        MOV      R0,#+63488
          CFI FunCall LCD_clear
        BL       LCD_clear
//  269       }
//  270       if(right_value)
??duopiddisplay_menu_15:
        LDR.W    R0,??DataTable2_6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??duopiddisplay_menu_16
//  271       {
//  272         DUOD=DUOD+1;
        LDR.W    R0,??DataTable2_17
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable2_17
        STRH     R0,[R1, #+0]
//  273         LCD_clear(RED);
        MOV      R0,#+63488
          CFI FunCall LCD_clear
        BL       LCD_clear
//  274       }
//  275       if(long_left_value)
??duopiddisplay_menu_16:
        LDR.W    R0,??DataTable2_7
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??duopiddisplay_menu_17
//  276       {
//  277         DUOD=DUOD-10;
        LDR.W    R0,??DataTable2_17
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+10
        LDR.W    R1,??DataTable2_17
        STRH     R0,[R1, #+0]
//  278         LCD_clear(RED);
        MOV      R0,#+63488
          CFI FunCall LCD_clear
        BL       LCD_clear
//  279       }
//  280       if(long_right_value)
??duopiddisplay_menu_17:
        LDR.W    R0,??DataTable3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??duopiddisplay_menu_18
//  281       {
//  282         DUOD=DUOD+10;
        LDR.W    R0,??DataTable2_17
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+10
        LDR.W    R1,??DataTable2_17
        STRH     R0,[R1, #+0]
//  283         LCD_clear(RED);
        MOV      R0,#+63488
          CFI FunCall LCD_clear
        BL       LCD_clear
//  284       }
//  285       if(down_value)
??duopiddisplay_menu_18:
        LDR.W    R0,??DataTable2_8
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.W    ??duopiddisplay_menu_14
//  286       {
//  287         duopiddisplay_first_flag=1;
        MOVS     R0,#+1
        LDR.W    R1,??DataTable2_11
        STRB     R0,[R1, #+0]
//  288         duo_d_flag=0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable2_20
        STRB     R0,[R1, #+0]
//  289         mykey_clear();
          CFI FunCall mykey_clear
        BL       mykey_clear
        B.N      ??duopiddisplay_menu_14
//  290       }
//  291     }   
//  292   }
//  293   if(down_value)
??duopiddisplay_menu_13:
        LDR.W    R0,??DataTable2_8
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??duopiddisplay_menu_19
//  294   {
//  295     duopiddisplay_flag=0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable2_10
        STRB     R0,[R1, #+0]
//  296     LCD_clear(RED);
        MOV      R0,#+63488
          CFI FunCall LCD_clear
        BL       LCD_clear
//  297     while(dianpiddisplay_flag)
??duopiddisplay_menu_20:
        LDR.W    R0,??DataTable4_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??duopiddisplay_menu_19
//  298     {
//  299       dianpiddisplay_menu();
          CFI FunCall dianpiddisplay_menu
        BL       dianpiddisplay_menu
        B.N      ??duopiddisplay_menu_20
//  300     }
//  301     
//  302   }  
//  303   
//  304 }
??duopiddisplay_menu_19:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     imagedisplay_first_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     ?_0
//  305 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function dianpiddisplay_menu
        THUMB
//  306 void dianpiddisplay_menu()  //电机PID选择调整
//  307 {
dianpiddisplay_menu:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  308   mykey_scan();
          CFI FunCall mykey_scan
        BL       mykey_scan
//  309   if(dianpiddisplay_first_flag)
        LDR.W    R0,??DataTable4_2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.W    ??dianpiddisplay_menu_0
//  310   {
//  311     menu1_site.x=10;
        MOVS     R0,#+10
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+0]
//  312     menu1_site.y=5;
        MOVS     R0,#+5
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+2]
//  313     LCD_str(menu1_site,"dian_p", BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.W    R1,??DataTable4_3
        LDR.W    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_str
        BL       LCD_str
//  314     menu1_site.x=65;
        MOVS     R0,#+65
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+0]
//  315     menu1_site.y=5;
        MOVS     R0,#+5
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+2]
//  316     LCD_num(menu1_site,DIANP, BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.W    R0,??DataTable4_4
        LDRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_num
        BL       LCD_num
//  317     menu1_site.x=10;
        MOVS     R0,#+10
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+0]
//  318     menu1_site.y=20;
        MOVS     R0,#+20
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+2]
//  319     LCD_str(menu1_site,"dian_i", BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.W    R1,??DataTable4_5
        LDR.W    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_str
        BL       LCD_str
//  320     menu1_site.x=65;
        MOVS     R0,#+65
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+0]
//  321     menu1_site.y=20;
        MOVS     R0,#+20
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+2]
//  322     LCD_num(menu1_site,DIANI, BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.W    R0,??DataTable4_6
        LDRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_num
        BL       LCD_num
//  323     menu1_site.x=10;
        MOVS     R0,#+10
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+0]
//  324     menu1_site.y=35;
        MOVS     R0,#+35
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+2]
//  325     LCD_str(menu1_site,"dian_d", BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.W    R1,??DataTable4_7
        LDR.W    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_str
        BL       LCD_str
//  326     menu1_site.x=65;
        MOVS     R0,#+65
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+0]
//  327     menu1_site.y=35;
        MOVS     R0,#+35
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+2]
//  328     LCD_num(menu1_site,DIAND, BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.W    R0,??DataTable4_8
        LDRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_num
        BL       LCD_num
//  329     
//  330     dian_p_flag=1;
        MOVS     R0,#+1
        LDR.W    R1,??DataTable4_9
        STRB     R0,[R1, #+0]
//  331     dian_i_flag=1;
        MOVS     R0,#+1
        LDR.W    R1,??DataTable4_10
        STRB     R0,[R1, #+0]
//  332     dian_d_flag=1;
        MOVS     R0,#+1
        LDR.W    R1,??DataTable4_11
        STRB     R0,[R1, #+0]
//  333     dianpiddisplay_first_flag=0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable4_2
        STRB     R0,[R1, #+0]
//  334 
//  335   }
//  336   if(left_value)
??dianpiddisplay_menu_0:
        LDR.W    R0,??DataTable2_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.W    ??dianpiddisplay_menu_1
//  337   {
//  338     while(dian_p_flag)
??dianpiddisplay_menu_2:
        LDR.W    R0,??DataTable4_9
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.W    ??dianpiddisplay_menu_1
//  339     {
//  340      
//  341       mykey_scan();
          CFI FunCall mykey_scan
        BL       mykey_scan
//  342       menu1_site.x=10;
        MOVS     R0,#+10
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+0]
//  343       menu1_site.y=5;
        MOVS     R0,#+5
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+2]
//  344       LCD_str(menu1_site,"dian_p", WHITE,RED);
        MOV      R3,#+63488
        MOVW     R2,#+65535
        LDR.W    R1,??DataTable4_3
        LDR.W    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_str
        BL       LCD_str
//  345       menu1_site.x=65;
        MOVS     R0,#+65
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+0]
//  346       menu1_site.y=5;
        MOVS     R0,#+5
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+2]
//  347       LCD_num(menu1_site,DIANP, WHITE,RED);
        MOV      R3,#+63488
        MOVW     R2,#+65535
        LDR.W    R0,??DataTable4_4
        LDRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_num
        BL       LCD_num
//  348       menu1_site.x=10;
        MOVS     R0,#+10
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+0]
//  349       menu1_site.y=20;
        MOVS     R0,#+20
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+2]
//  350       LCD_str(menu1_site,"dian_i", BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.W    R1,??DataTable4_5
        LDR.W    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_str
        BL       LCD_str
//  351       menu1_site.x=65;
        MOVS     R0,#+65
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+0]
//  352       menu1_site.y=20;
        MOVS     R0,#+20
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+2]
//  353       LCD_num(menu1_site,DIANI, BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.W    R0,??DataTable4_6
        LDRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_num
        BL       LCD_num
//  354       menu1_site.x=10;
        MOVS     R0,#+10
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+0]
//  355       menu1_site.y=35;
        MOVS     R0,#+35
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+2]
//  356       LCD_str(menu1_site,"dian_d", BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.W    R1,??DataTable4_7
        LDR.W    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_str
        BL       LCD_str
//  357       menu1_site.x=65;
        MOVS     R0,#+65
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+0]
//  358       menu1_site.y=35;
        MOVS     R0,#+35
        LDR.W    R1,??DataTable2
        STRH     R0,[R1, #+2]
//  359       LCD_num(menu1_site,DIAND, BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.W    R0,??DataTable4_8
        LDRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_num
        BL       LCD_num
//  360       if(left_value)
        LDR.W    R0,??DataTable2_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??dianpiddisplay_menu_3
//  361       {
//  362         DIANP=DIANP-1;
        LDR.W    R0,??DataTable4_4
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable4_4
        STRH     R0,[R1, #+0]
//  363          LCD_clear(RED);
        MOV      R0,#+63488
          CFI FunCall LCD_clear
        BL       LCD_clear
//  364       }
//  365       if(right_value)
??dianpiddisplay_menu_3:
        LDR.W    R0,??DataTable2_6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??dianpiddisplay_menu_4
//  366       {
//  367         DIANP=DIANP+1;
        LDR.W    R0,??DataTable4_4
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable4_4
        STRH     R0,[R1, #+0]
//  368          LCD_clear(RED);
        MOV      R0,#+63488
          CFI FunCall LCD_clear
        BL       LCD_clear
//  369       }
//  370       if(long_left_value)
??dianpiddisplay_menu_4:
        LDR.W    R0,??DataTable2_7
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??dianpiddisplay_menu_5
//  371       {
//  372         DIANP=DIANP-10;
        LDR.W    R0,??DataTable4_4
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+10
        LDR.W    R1,??DataTable4_4
        STRH     R0,[R1, #+0]
//  373          LCD_clear(RED);
        MOV      R0,#+63488
          CFI FunCall LCD_clear
        BL       LCD_clear
//  374       }
//  375       if(long_right_value)
??dianpiddisplay_menu_5:
        LDR.W    R0,??DataTable3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??dianpiddisplay_menu_6
//  376       {
//  377         DIANP=DIANP+10;
        LDR.W    R0,??DataTable4_4
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+10
        LDR.W    R1,??DataTable4_4
        STRH     R0,[R1, #+0]
//  378          LCD_clear(RED);
        MOV      R0,#+63488
          CFI FunCall LCD_clear
        BL       LCD_clear
//  379       }
//  380       if(down_value)
??dianpiddisplay_menu_6:
        LDR.N    R0,??DataTable2_8
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.W    ??dianpiddisplay_menu_2
//  381       {
//  382         dianpiddisplay_first_flag=1;
        MOVS     R0,#+1
        LDR.W    R1,??DataTable4_2
        STRB     R0,[R1, #+0]
//  383         dian_p_flag=0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable4_9
        STRB     R0,[R1, #+0]
//  384         mykey_clear();
          CFI FunCall mykey_clear
        BL       mykey_clear
        B.N      ??dianpiddisplay_menu_2
//  385       }
//  386     }
//  387    
//  388   }
//  389   if(right_value)
??dianpiddisplay_menu_1:
        LDR.N    R0,??DataTable2_6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.W    ??dianpiddisplay_menu_7
//  390   {
//  391     while(dian_i_flag)
??dianpiddisplay_menu_8:
        LDR.W    R0,??DataTable4_10
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.W    ??dianpiddisplay_menu_7
//  392     {
//  393       mykey_scan();
          CFI FunCall mykey_scan
        BL       mykey_scan
//  394       menu1_site.x=10;
        MOVS     R0,#+10
        LDR.N    R1,??DataTable2
        STRH     R0,[R1, #+0]
//  395       menu1_site.y=5;
        MOVS     R0,#+5
        LDR.N    R1,??DataTable2
        STRH     R0,[R1, #+2]
//  396       LCD_str(menu1_site,"dian_p", BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.W    R1,??DataTable4_3
        LDR.N    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_str
        BL       LCD_str
//  397       menu1_site.x=65;
        MOVS     R0,#+65
        LDR.N    R1,??DataTable2
        STRH     R0,[R1, #+0]
//  398       menu1_site.y=5;
        MOVS     R0,#+5
        LDR.N    R1,??DataTable2
        STRH     R0,[R1, #+2]
//  399       LCD_num(menu1_site,DIANP, BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.W    R0,??DataTable4_4
        LDRH     R1,[R0, #+0]
        LDR.N    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_num
        BL       LCD_num
//  400       menu1_site.x=10;
        MOVS     R0,#+10
        LDR.N    R1,??DataTable2
        STRH     R0,[R1, #+0]
//  401       menu1_site.y=20;
        MOVS     R0,#+20
        LDR.N    R1,??DataTable2
        STRH     R0,[R1, #+2]
//  402       LCD_str(menu1_site,"dian_i", WHITE,RED);
        MOV      R3,#+63488
        MOVW     R2,#+65535
        LDR.W    R1,??DataTable4_5
        LDR.N    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_str
        BL       LCD_str
//  403       menu1_site.x=65;
        MOVS     R0,#+65
        LDR.N    R1,??DataTable2
        STRH     R0,[R1, #+0]
//  404       menu1_site.y=20;
        MOVS     R0,#+20
        LDR.N    R1,??DataTable2
        STRH     R0,[R1, #+2]
//  405       LCD_num(menu1_site,DIANI, WHITE,RED);
        MOV      R3,#+63488
        MOVW     R2,#+65535
        LDR.W    R0,??DataTable4_6
        LDRH     R1,[R0, #+0]
        LDR.N    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_num
        BL       LCD_num
//  406       menu1_site.x=10;
        MOVS     R0,#+10
        LDR.N    R1,??DataTable2
        STRH     R0,[R1, #+0]
//  407       menu1_site.y=35;
        MOVS     R0,#+35
        LDR.N    R1,??DataTable2
        STRH     R0,[R1, #+2]
//  408       LCD_str(menu1_site,"dian_d", BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.W    R1,??DataTable4_7
        LDR.N    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_str
        BL       LCD_str
//  409       menu1_site.x=65;
        MOVS     R0,#+65
        LDR.N    R1,??DataTable2
        STRH     R0,[R1, #+0]
//  410       menu1_site.y=35;
        MOVS     R0,#+35
        LDR.N    R1,??DataTable2
        STRH     R0,[R1, #+2]
//  411       LCD_num(menu1_site,DIAND, BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.W    R0,??DataTable4_8
        LDRH     R1,[R0, #+0]
        LDR.N    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_num
        BL       LCD_num
//  412       if(left_value)
        LDR.N    R0,??DataTable2_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??dianpiddisplay_menu_9
//  413       {
//  414         DIANI=DIANI-1;
        LDR.W    R0,??DataTable4_6
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable4_6
        STRH     R0,[R1, #+0]
//  415       LCD_clear(RED);
        MOV      R0,#+63488
          CFI FunCall LCD_clear
        BL       LCD_clear
//  416       }
//  417       if(right_value)
??dianpiddisplay_menu_9:
        LDR.N    R0,??DataTable2_6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??dianpiddisplay_menu_10
//  418       {
//  419         DIANI=DIANI+1;
        LDR.W    R0,??DataTable4_6
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable4_6
        STRH     R0,[R1, #+0]
//  420         LCD_clear(RED);
        MOV      R0,#+63488
          CFI FunCall LCD_clear
        BL       LCD_clear
//  421       }
//  422       if(long_left_value)
??dianpiddisplay_menu_10:
        LDR.N    R0,??DataTable2_7
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??dianpiddisplay_menu_11
//  423       {
//  424         DIANI=DIANI-10;
        LDR.W    R0,??DataTable4_6
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+10
        LDR.W    R1,??DataTable4_6
        STRH     R0,[R1, #+0]
//  425         LCD_clear(RED);
        MOV      R0,#+63488
          CFI FunCall LCD_clear
        BL       LCD_clear
//  426       }
//  427       if(long_right_value)
??dianpiddisplay_menu_11:
        LDR.W    R0,??DataTable3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??dianpiddisplay_menu_12
//  428       {
//  429         DIANI=DIANI+10;
        LDR.W    R0,??DataTable4_6
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+10
        LDR.W    R1,??DataTable4_6
        STRH     R0,[R1, #+0]
//  430         LCD_clear(RED);
        MOV      R0,#+63488
          CFI FunCall LCD_clear
        BL       LCD_clear
//  431       }
//  432       if(down_value)
??dianpiddisplay_menu_12:
        LDR.N    R0,??DataTable2_8
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.W    ??dianpiddisplay_menu_8
//  433       {
//  434         dianpiddisplay_first_flag=1;
        MOVS     R0,#+1
        LDR.W    R1,??DataTable4_2
        STRB     R0,[R1, #+0]
//  435         dian_i_flag=0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable4_10
        STRB     R0,[R1, #+0]
//  436         mykey_clear();
          CFI FunCall mykey_clear
        BL       mykey_clear
        B.N      ??dianpiddisplay_menu_8
//  437       }
//  438     }
//  439   }
//  440   if(long_left_value)
??dianpiddisplay_menu_7:
        LDR.N    R0,??DataTable2_7
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.W    ??dianpiddisplay_menu_13
//  441   {
//  442     while(dian_d_flag)
??dianpiddisplay_menu_14:
        LDR.W    R0,??DataTable4_11
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.W    ??dianpiddisplay_menu_13
//  443     {
//  444       mykey_scan();
          CFI FunCall mykey_scan
        BL       mykey_scan
//  445       menu1_site.x=10;
        MOVS     R0,#+10
        LDR.N    R1,??DataTable2
        STRH     R0,[R1, #+0]
//  446       menu1_site.y=5;
        MOVS     R0,#+5
        LDR.N    R1,??DataTable2
        STRH     R0,[R1, #+2]
//  447       LCD_str(menu1_site,"dian_p", BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.W    R1,??DataTable4_3
        LDR.N    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_str
        BL       LCD_str
//  448       menu1_site.x=65;
        MOVS     R0,#+65
        LDR.N    R1,??DataTable2
        STRH     R0,[R1, #+0]
//  449       menu1_site.y=5;
        MOVS     R0,#+5
        LDR.N    R1,??DataTable2
        STRH     R0,[R1, #+2]
//  450       LCD_num(menu1_site,DIANP, BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.W    R0,??DataTable4_4
        LDRH     R1,[R0, #+0]
        LDR.N    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_num
        BL       LCD_num
//  451       menu1_site.x=10;
        MOVS     R0,#+10
        LDR.N    R1,??DataTable2
        STRH     R0,[R1, #+0]
//  452       menu1_site.y=20;
        MOVS     R0,#+20
        LDR.N    R1,??DataTable2
        STRH     R0,[R1, #+2]
//  453       LCD_str(menu1_site,"dian_i", BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.W    R1,??DataTable4_5
        LDR.N    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_str
        BL       LCD_str
//  454       menu1_site.x=65;
        MOVS     R0,#+65
        LDR.N    R1,??DataTable2
        STRH     R0,[R1, #+0]
//  455       menu1_site.y=20;
        MOVS     R0,#+20
        LDR.N    R1,??DataTable2
        STRH     R0,[R1, #+2]
//  456       LCD_num(menu1_site,DIANI, BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.W    R0,??DataTable4_6
        LDRH     R1,[R0, #+0]
        LDR.N    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_num
        BL       LCD_num
//  457       menu1_site.x=10;
        MOVS     R0,#+10
        LDR.N    R1,??DataTable2
        STRH     R0,[R1, #+0]
//  458       menu1_site.y=35;
        MOVS     R0,#+35
        LDR.N    R1,??DataTable2
        STRH     R0,[R1, #+2]
//  459       LCD_str(menu1_site,"dian_d", WHITE,RED);
        MOV      R3,#+63488
        MOVW     R2,#+65535
        LDR.W    R1,??DataTable4_7
        LDR.N    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_str
        BL       LCD_str
//  460       menu1_site.x=65;
        MOVS     R0,#+65
        LDR.N    R1,??DataTable2
        STRH     R0,[R1, #+0]
//  461       menu1_site.y=35;
        MOVS     R0,#+35
        LDR.N    R1,??DataTable2
        STRH     R0,[R1, #+2]
//  462       LCD_num(menu1_site,DIAND, WHITE,RED);
        MOV      R3,#+63488
        MOVW     R2,#+65535
        LDR.W    R0,??DataTable4_8
        LDRH     R1,[R0, #+0]
        LDR.N    R0,??DataTable2
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_num
        BL       LCD_num
//  463       if(left_value)
        LDR.N    R0,??DataTable2_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??dianpiddisplay_menu_15
//  464       {
//  465         DIAND=DIAND-1;
        LDR.W    R0,??DataTable4_8
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable4_8
        STRH     R0,[R1, #+0]
//  466       LCD_clear(RED);
        MOV      R0,#+63488
          CFI FunCall LCD_clear
        BL       LCD_clear
//  467       }
//  468       if(right_value)
??dianpiddisplay_menu_15:
        LDR.N    R0,??DataTable2_6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??dianpiddisplay_menu_16
//  469       {
//  470         DIAND=DIAND+1;
        LDR.W    R0,??DataTable4_8
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable4_8
        STRH     R0,[R1, #+0]
//  471       LCD_clear(RED);
        MOV      R0,#+63488
          CFI FunCall LCD_clear
        BL       LCD_clear
//  472       }
//  473       if(long_left_value)
??dianpiddisplay_menu_16:
        LDR.N    R0,??DataTable2_7
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??dianpiddisplay_menu_17
//  474       {
//  475         DIAND=DIAND-10;
        LDR.W    R0,??DataTable4_8
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+10
        LDR.W    R1,??DataTable4_8
        STRH     R0,[R1, #+0]
//  476       LCD_clear(RED);
        MOV      R0,#+63488
          CFI FunCall LCD_clear
        BL       LCD_clear
//  477       }
//  478       if(long_right_value)
??dianpiddisplay_menu_17:
        LDR.W    R0,??DataTable3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??dianpiddisplay_menu_18
//  479       {
//  480         DIAND=DIAND+10;
        LDR.W    R0,??DataTable4_8
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+10
        LDR.W    R1,??DataTable4_8
        STRH     R0,[R1, #+0]
//  481       LCD_clear(RED);
        MOV      R0,#+63488
          CFI FunCall LCD_clear
        BL       LCD_clear
//  482       }
//  483       if(down_value)
??dianpiddisplay_menu_18:
        LDR.N    R0,??DataTable2_8
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.W    ??dianpiddisplay_menu_14
//  484       {
//  485         dianpiddisplay_first_flag=1;
        MOVS     R0,#+1
        LDR.W    R1,??DataTable4_2
        STRB     R0,[R1, #+0]
//  486         dian_d_flag=0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable4_11
        STRB     R0,[R1, #+0]
//  487         mykey_clear();
          CFI FunCall mykey_clear
        BL       mykey_clear
        B.N      ??dianpiddisplay_menu_14
//  488       }
//  489     }   
//  490   }
//  491   if(down_value)
??dianpiddisplay_menu_13:
        LDR.N    R0,??DataTable2_8
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??dianpiddisplay_menu_19
//  492   {
//  493     dianpiddisplay_flag=0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable4_1
        STRB     R0,[R1, #+0]
//  494     LCD_clear(RED);
        MOV      R0,#+63488
          CFI FunCall LCD_clear
        BL       LCD_clear
//  495     while(expectdisplay_flag)
??dianpiddisplay_menu_20:
        LDR.W    R0,??DataTable4_12
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??dianpiddisplay_menu_19
//  496     {
//  497       expectdisplay_menu();
          CFI FunCall expectdisplay_menu
        BL       expectdisplay_menu
        B.N      ??dianpiddisplay_menu_20
//  498     }
//  499   }  
//  500   
//  501 }
??dianpiddisplay_menu_19:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     menu1_site

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     ?_1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     ?_2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     left_value

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     ov7620_display_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_5:
        DC32     date_display_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_6:
        DC32     right_value

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_7:
        DC32     long_left_value

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_8:
        DC32     down_value

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_9:
        DC32     display_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_10:
        DC32     duopiddisplay_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_11:
        DC32     duopiddisplay_first_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_12:
        DC32     ?_3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_13:
        DC32     DUOP

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_14:
        DC32     ?_4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_15:
        DC32     DUOI

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_16:
        DC32     ?_5

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_17:
        DC32     DUOD

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_18:
        DC32     duo_p_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_19:
        DC32     duo_i_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_20:
        DC32     duo_d_flag
//  502 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function expectdisplay_menu
        THUMB
//  503 void expectdisplay_menu()  //期望值设定
//  504 {
expectdisplay_menu:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  505   mykey_scan();
          CFI FunCall mykey_scan
        BL       mykey_scan
//  506   if(expectdisplay_first_flag)
        LDR.W    R0,??DataTable4_13
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??expectdisplay_menu_0
//  507   {
//  508     menu1_site.x=10;
        MOVS     R0,#+10
        LDR.W    R1,??DataTable4_14
        STRH     R0,[R1, #+0]
//  509     menu1_site.y=5;
        MOVS     R0,#+5
        LDR.W    R1,??DataTable4_14
        STRH     R0,[R1, #+2]
//  510     LCD_str(menu1_site,"h_value", BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.W    R1,??DataTable4_15
        LDR.W    R0,??DataTable4_14
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_str
        BL       LCD_str
//  511     menu1_site.x=80;
        MOVS     R0,#+80
        LDR.W    R1,??DataTable4_14
        STRH     R0,[R1, #+0]
//  512     menu1_site.y=5;
        MOVS     R0,#+5
        LDR.W    R1,??DataTable4_14
        STRH     R0,[R1, #+2]
//  513     LCD_num(menu1_site,Q_H, BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.W    R0,??DataTable4_16
        LDRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable4_14
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_num
        BL       LCD_num
//  514     menu1_site.x=10;
        MOVS     R0,#+10
        LDR.W    R1,??DataTable4_14
        STRH     R0,[R1, #+0]
//  515     menu1_site.y=20;
        MOVS     R0,#+20
        LDR.W    R1,??DataTable4_14
        STRH     R0,[R1, #+2]
//  516     LCD_str(menu1_site,"b_value", BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.W    R1,??DataTable4_17
        LDR.W    R0,??DataTable4_14
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_str
        BL       LCD_str
//  517     menu1_site.x=80;
        MOVS     R0,#+80
        LDR.W    R1,??DataTable4_14
        STRH     R0,[R1, #+0]
//  518     menu1_site.y=20;
        MOVS     R0,#+20
        LDR.W    R1,??DataTable4_14
        STRH     R0,[R1, #+2]
//  519     LCD_num(menu1_site,Q_B, BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.W    R0,??DataTable4_18
        LDRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable4_14
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_num
        BL       LCD_num
//  520     
//  521     qi_h_flag=1;
        MOVS     R0,#+1
        LDR.W    R1,??DataTable4_19
        STRB     R0,[R1, #+0]
//  522     qi_b_flag=1;
        MOVS     R0,#+1
        LDR.W    R1,??DataTable4_20
        STRB     R0,[R1, #+0]
//  523     expectdisplay_first_flag=0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable4_13
        STRB     R0,[R1, #+0]
//  524   }
//  525   if(left_value)
??expectdisplay_menu_0:
        LDR.W    R0,??DataTable4_21
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.W    ??expectdisplay_menu_1
//  526   {
//  527     while(qi_h_flag)
??expectdisplay_menu_2:
        LDR.W    R0,??DataTable4_19
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.W    ??expectdisplay_menu_1
//  528     {
//  529       mykey_scan();
          CFI FunCall mykey_scan
        BL       mykey_scan
//  530       menu1_site.x=10;
        MOVS     R0,#+10
        LDR.W    R1,??DataTable4_14
        STRH     R0,[R1, #+0]
//  531       menu1_site.y=5;
        MOVS     R0,#+5
        LDR.W    R1,??DataTable4_14
        STRH     R0,[R1, #+2]
//  532       LCD_str(menu1_site,"h_value", WHITE,RED);
        MOV      R3,#+63488
        MOVW     R2,#+65535
        LDR.W    R1,??DataTable4_15
        LDR.W    R0,??DataTable4_14
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_str
        BL       LCD_str
//  533       menu1_site.x=80;
        MOVS     R0,#+80
        LDR.W    R1,??DataTable4_14
        STRH     R0,[R1, #+0]
//  534       menu1_site.y=5;
        MOVS     R0,#+5
        LDR.W    R1,??DataTable4_14
        STRH     R0,[R1, #+2]
//  535       LCD_num(menu1_site,Q_H, WHITE,RED);
        MOV      R3,#+63488
        MOVW     R2,#+65535
        LDR.W    R0,??DataTable4_16
        LDRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable4_14
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_num
        BL       LCD_num
//  536       menu1_site.x=10;
        MOVS     R0,#+10
        LDR.W    R1,??DataTable4_14
        STRH     R0,[R1, #+0]
//  537       menu1_site.y=20;
        MOVS     R0,#+20
        LDR.W    R1,??DataTable4_14
        STRH     R0,[R1, #+2]
//  538       LCD_str(menu1_site,"b_value", BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.W    R1,??DataTable4_17
        LDR.W    R0,??DataTable4_14
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_str
        BL       LCD_str
//  539       menu1_site.x=80;
        MOVS     R0,#+80
        LDR.W    R1,??DataTable4_14
        STRH     R0,[R1, #+0]
//  540       menu1_site.y=20;
        MOVS     R0,#+20
        LDR.W    R1,??DataTable4_14
        STRH     R0,[R1, #+2]
//  541       LCD_num(menu1_site,Q_B, BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.W    R0,??DataTable4_18
        LDRH     R1,[R0, #+0]
        LDR.W    R0,??DataTable4_14
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_num
        BL       LCD_num
//  542       if(left_value)
        LDR.W    R0,??DataTable4_21
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??expectdisplay_menu_3
//  543       {
//  544         Q_H=Q_H-10;
        LDR.W    R0,??DataTable4_16
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+10
        LDR.W    R1,??DataTable4_16
        STRH     R0,[R1, #+0]
//  545          LCD_clear(RED);
        MOV      R0,#+63488
          CFI FunCall LCD_clear
        BL       LCD_clear
//  546       }
//  547       if(right_value)
??expectdisplay_menu_3:
        LDR.W    R0,??DataTable4_22
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??expectdisplay_menu_4
//  548       {
//  549         Q_H=Q_H+10;
        LDR.W    R0,??DataTable4_16
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+10
        LDR.W    R1,??DataTable4_16
        STRH     R0,[R1, #+0]
//  550          LCD_clear(RED);
        MOV      R0,#+63488
          CFI FunCall LCD_clear
        BL       LCD_clear
//  551       }
//  552       if(long_left_value)
??expectdisplay_menu_4:
        LDR.W    R0,??DataTable4_23
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??expectdisplay_menu_5
//  553       {
//  554         Q_H=Q_H-100;
        LDR.W    R0,??DataTable4_16
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+100
        LDR.W    R1,??DataTable4_16
        STRH     R0,[R1, #+0]
//  555          LCD_clear(RED);
        MOV      R0,#+63488
          CFI FunCall LCD_clear
        BL       LCD_clear
//  556       }
//  557       if(long_right_value)
??expectdisplay_menu_5:
        LDR.N    R0,??DataTable3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??expectdisplay_menu_6
//  558       {
//  559         Q_H=Q_H+100;
        LDR.N    R0,??DataTable4_16
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+100
        LDR.N    R1,??DataTable4_16
        STRH     R0,[R1, #+0]
//  560         LCD_clear(RED);
        MOV      R0,#+63488
          CFI FunCall LCD_clear
        BL       LCD_clear
//  561       }
//  562       if(down_value)
??expectdisplay_menu_6:
        LDR.N    R0,??DataTable4_24
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.W    ??expectdisplay_menu_2
//  563       {
//  564         expectdisplay_first_flag=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable4_13
        STRB     R0,[R1, #+0]
//  565         qi_h_flag=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable4_19
        STRB     R0,[R1, #+0]
//  566         mykey_clear();
          CFI FunCall mykey_clear
        BL       mykey_clear
        B.N      ??expectdisplay_menu_2
//  567       }
//  568     }
//  569   }
//  570   if(right_value)
??expectdisplay_menu_1:
        LDR.N    R0,??DataTable4_22
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.W    ??expectdisplay_menu_7
//  571   {
//  572     while(qi_b_flag)
??expectdisplay_menu_8:
        LDR.N    R0,??DataTable4_20
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.W    ??expectdisplay_menu_7
//  573     {
//  574       mykey_scan();
          CFI FunCall mykey_scan
        BL       mykey_scan
//  575       menu1_site.x=10;
        MOVS     R0,#+10
        LDR.N    R1,??DataTable4_14
        STRH     R0,[R1, #+0]
//  576       menu1_site.y=5;
        MOVS     R0,#+5
        LDR.N    R1,??DataTable4_14
        STRH     R0,[R1, #+2]
//  577       LCD_str(menu1_site,"h_value",BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.N    R1,??DataTable4_15
        LDR.N    R0,??DataTable4_14
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_str
        BL       LCD_str
//  578       menu1_site.x=80;
        MOVS     R0,#+80
        LDR.N    R1,??DataTable4_14
        STRH     R0,[R1, #+0]
//  579       menu1_site.y=5;
        MOVS     R0,#+5
        LDR.N    R1,??DataTable4_14
        STRH     R0,[R1, #+2]
//  580       LCD_num(menu1_site,Q_H, BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.N    R0,??DataTable4_16
        LDRH     R1,[R0, #+0]
        LDR.N    R0,??DataTable4_14
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_num
        BL       LCD_num
//  581       menu1_site.x=10;
        MOVS     R0,#+10
        LDR.N    R1,??DataTable4_14
        STRH     R0,[R1, #+0]
//  582       menu1_site.y=20;
        MOVS     R0,#+20
        LDR.N    R1,??DataTable4_14
        STRH     R0,[R1, #+2]
//  583       LCD_str(menu1_site,"b_value", WHITE,RED);
        MOV      R3,#+63488
        MOVW     R2,#+65535
        LDR.N    R1,??DataTable4_17
        LDR.N    R0,??DataTable4_14
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_str
        BL       LCD_str
//  584       menu1_site.x=80;
        MOVS     R0,#+80
        LDR.N    R1,??DataTable4_14
        STRH     R0,[R1, #+0]
//  585       menu1_site.y=20;
        MOVS     R0,#+20
        LDR.N    R1,??DataTable4_14
        STRH     R0,[R1, #+2]
//  586       LCD_num(menu1_site,Q_B, WHITE,RED);
        MOV      R3,#+63488
        MOVW     R2,#+65535
        LDR.N    R0,??DataTable4_18
        LDRH     R1,[R0, #+0]
        LDR.N    R0,??DataTable4_14
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_num
        BL       LCD_num
//  587       if(left_value)
        LDR.N    R0,??DataTable4_21
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??expectdisplay_menu_9
//  588       {
//  589         Q_B=Q_B-10;
        LDR.N    R0,??DataTable4_18
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+10
        LDR.N    R1,??DataTable4_18
        STRH     R0,[R1, #+0]
//  590          LCD_clear(RED);
        MOV      R0,#+63488
          CFI FunCall LCD_clear
        BL       LCD_clear
//  591       }
//  592       if(right_value)
??expectdisplay_menu_9:
        LDR.N    R0,??DataTable4_22
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??expectdisplay_menu_10
//  593       {
//  594         Q_B=Q_B+10;
        LDR.N    R0,??DataTable4_18
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+10
        LDR.N    R1,??DataTable4_18
        STRH     R0,[R1, #+0]
//  595          LCD_clear(RED);
        MOV      R0,#+63488
          CFI FunCall LCD_clear
        BL       LCD_clear
//  596       }
//  597       if(long_left_value)
??expectdisplay_menu_10:
        LDR.N    R0,??DataTable4_23
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??expectdisplay_menu_11
//  598       {
//  599         Q_B=Q_B-100;
        LDR.N    R0,??DataTable4_18
        LDRH     R0,[R0, #+0]
        SUBS     R0,R0,#+100
        LDR.N    R1,??DataTable4_18
        STRH     R0,[R1, #+0]
//  600          LCD_clear(RED);
        MOV      R0,#+63488
          CFI FunCall LCD_clear
        BL       LCD_clear
//  601       }
//  602       if(long_right_value)
??expectdisplay_menu_11:
        LDR.N    R0,??DataTable3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??expectdisplay_menu_12
//  603       {
//  604         Q_B=Q_B+100;
        LDR.N    R0,??DataTable4_18
        LDRH     R0,[R0, #+0]
        ADDS     R0,R0,#+100
        LDR.N    R1,??DataTable4_18
        STRH     R0,[R1, #+0]
//  605         LCD_clear(RED);
        MOV      R0,#+63488
          CFI FunCall LCD_clear
        BL       LCD_clear
//  606       }
//  607       if(down_value)
??expectdisplay_menu_12:
        LDR.N    R0,??DataTable4_24
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??expectdisplay_menu_8
//  608       {
//  609         expectdisplay_first_flag=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable4_13
        STRB     R0,[R1, #+0]
//  610         qi_b_flag=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable4_20
        STRB     R0,[R1, #+0]
//  611         mykey_clear();
          CFI FunCall mykey_clear
        BL       mykey_clear
        B.N      ??expectdisplay_menu_8
//  612       }
//  613    
//  614     }
//  615   }
//  616   if(up_value)
//  617   {  
//  618   }
//  619   if(down_value)
??expectdisplay_menu_7:
        LDR.N    R0,??DataTable4_24
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??expectdisplay_menu_13
//  620   {
//  621     expectdisplay_flag=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable4_12
        STRB     R0,[R1, #+0]
//  622     LCD_clear(RED);
        MOV      R0,#+63488
          CFI FunCall LCD_clear
        BL       LCD_clear
//  623     while(dealsizedisplay_flag)
??expectdisplay_menu_14:
        LDR.N    R0,??DataTable4_25
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??expectdisplay_menu_13
//  624     {
//  625       dealsizedisplay_menu();
          CFI FunCall dealsizedisplay_menu
        BL       dealsizedisplay_menu
        B.N      ??expectdisplay_menu_14
//  626     }
//  627   }   
//  628 }
??expectdisplay_menu_13:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     long_right_value
//  629 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function dealsizedisplay_menu
        THUMB
//  630 void dealsizedisplay_menu()  //期望值设定
//  631 {
dealsizedisplay_menu:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  632   mykey_scan();
          CFI FunCall mykey_scan
        BL       mykey_scan
//  633   if(dealsizedisplay_first_flag)
        LDR.N    R0,??DataTable4_26
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??dealsizedisplay_menu_0
//  634   {
//  635     menu1_site.x=10;
        MOVS     R0,#+10
        LDR.N    R1,??DataTable4_14
        STRH     R0,[R1, #+0]
//  636     menu1_site.y=5;
        MOVS     R0,#+5
        LDR.N    R1,??DataTable4_14
        STRH     R0,[R1, #+2]
//  637     LCD_str(menu1_site,"imgdealsize", BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.N    R1,??DataTable4_27
        LDR.N    R0,??DataTable4_14
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_str
        BL       LCD_str
//  638     menu1_site.x=10;
        MOVS     R0,#+10
        LDR.N    R1,??DataTable4_14
        STRH     R0,[R1, #+0]
//  639     menu1_site.y=20;
        MOVS     R0,#+20
        LDR.N    R1,??DataTable4_14
        STRH     R0,[R1, #+2]
//  640     LCD_str(menu1_site,"all", BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        ADR.N    R1,??DataTable4  ;; "all"
        LDR.N    R0,??DataTable4_14
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_str
        BL       LCD_str
//  641     
//  642     menu1_site.x=10;
        MOVS     R0,#+10
        LDR.N    R1,??DataTable4_14
        STRH     R0,[R1, #+0]
//  643     menu1_site.y=35;
        MOVS     R0,#+35
        LDR.N    R1,??DataTable4_14
        STRH     R0,[R1, #+2]
//  644     LCD_str(menu1_site,"part", BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.N    R1,??DataTable4_28
        LDR.N    R0,??DataTable4_14
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_str
        BL       LCD_str
//  645     
//  646     dealsizedisplay_first_flag=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable4_26
        STRB     R0,[R1, #+0]
//  647   }
//  648   if(left_value)
??dealsizedisplay_menu_0:
        LDR.N    R0,??DataTable4_21
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??dealsizedisplay_menu_1
//  649   {
//  650     menu1_site.x=10;
        MOVS     R0,#+10
        LDR.N    R1,??DataTable4_14
        STRH     R0,[R1, #+0]
//  651     menu1_site.y=5;
        MOVS     R0,#+5
        LDR.N    R1,??DataTable4_14
        STRH     R0,[R1, #+2]
//  652     LCD_str(menu1_site,"imgdealsize", BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.N    R1,??DataTable4_27
        LDR.N    R0,??DataTable4_14
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_str
        BL       LCD_str
//  653     menu1_site.x=10;
        MOVS     R0,#+10
        LDR.N    R1,??DataTable4_14
        STRH     R0,[R1, #+0]
//  654     menu1_site.y=20;
        MOVS     R0,#+20
        LDR.N    R1,??DataTable4_14
        STRH     R0,[R1, #+2]
//  655     LCD_str(menu1_site,"all", WHITE,RED);
        MOV      R3,#+63488
        MOVW     R2,#+65535
        ADR.N    R1,??DataTable4  ;; "all"
        LDR.N    R0,??DataTable4_14
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_str
        BL       LCD_str
//  656     
//  657     menu1_site.x=10;
        MOVS     R0,#+10
        LDR.N    R1,??DataTable4_14
        STRH     R0,[R1, #+0]
//  658     menu1_site.y=35;
        MOVS     R0,#+35
        LDR.N    R1,??DataTable4_14
        STRH     R0,[R1, #+2]
//  659     LCD_str(menu1_site,"part", BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.N    R1,??DataTable4_28
        LDR.N    R0,??DataTable4_14
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_str
        BL       LCD_str
//  660     dealsize_all_flag=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable4_29
        STRB     R0,[R1, #+0]
//  661   }
//  662   if(right_value)
??dealsizedisplay_menu_1:
        LDR.N    R0,??DataTable4_22
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??dealsizedisplay_menu_2
//  663   {
//  664     menu1_site.x=10;
        MOVS     R0,#+10
        LDR.N    R1,??DataTable4_14
        STRH     R0,[R1, #+0]
//  665     menu1_site.y=5;
        MOVS     R0,#+5
        LDR.N    R1,??DataTable4_14
        STRH     R0,[R1, #+2]
//  666     LCD_str(menu1_site,"imgdealsize", BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        LDR.N    R1,??DataTable4_27
        LDR.N    R0,??DataTable4_14
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_str
        BL       LCD_str
//  667     menu1_site.x=10;
        MOVS     R0,#+10
        LDR.N    R1,??DataTable4_14
        STRH     R0,[R1, #+0]
//  668     menu1_site.y=20;
        MOVS     R0,#+20
        LDR.N    R1,??DataTable4_14
        STRH     R0,[R1, #+2]
//  669     LCD_str(menu1_site,"all", BLUE,RED);
        MOV      R3,#+63488
        MOVS     R2,#+31
        ADR.N    R1,??DataTable4  ;; "all"
        LDR.N    R0,??DataTable4_14
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_str
        BL       LCD_str
//  670     
//  671     menu1_site.x=10;
        MOVS     R0,#+10
        LDR.N    R1,??DataTable4_14
        STRH     R0,[R1, #+0]
//  672     menu1_site.y=35;
        MOVS     R0,#+35
        LDR.N    R1,??DataTable4_14
        STRH     R0,[R1, #+2]
//  673     LCD_str(menu1_site,"part", WHITE,RED);
        MOV      R3,#+63488
        MOVW     R2,#+65535
        LDR.N    R1,??DataTable4_28
        LDR.N    R0,??DataTable4_14
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_str
        BL       LCD_str
//  674     dealsize_all_flag=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable4_29
        STRB     R0,[R1, #+0]
//  675   }
//  676   if(down_value)
??dealsizedisplay_menu_2:
        LDR.N    R0,??DataTable4_24
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??dealsizedisplay_menu_3
//  677   {
//  678     dealsizedisplay_flag=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable4_25
        STRB     R0,[R1, #+0]
//  679     LCD_clear(RED);
        MOV      R0,#+63488
          CFI FunCall LCD_clear
        BL       LCD_clear
//  680     menu1_site.x=10;
        MOVS     R0,#+10
        LDR.N    R1,??DataTable4_14
        STRH     R0,[R1, #+0]
//  681     menu1_site.y=10;
        MOVS     R0,#+10
        LDR.N    R1,??DataTable4_14
        STRH     R0,[R1, #+2]
//  682     LCD_str(menu1_site,"go go go", WHITE,RED);
        MOV      R3,#+63488
        MOVW     R2,#+65535
        LDR.N    R1,??DataTable4_30
        LDR.N    R0,??DataTable4_14
        LDR      R0,[R0, #+0]
          CFI FunCall LCD_str
        BL       LCD_str
//  683   }
//  684   
//  685 }
??dealsizedisplay_menu_3:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC8      "all"

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     dianpiddisplay_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     dianpiddisplay_first_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     ?_6

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     DIANP

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_5:
        DC32     ?_7

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_6:
        DC32     DIANI

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_7:
        DC32     ?_8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_8:
        DC32     DIAND

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_9:
        DC32     dian_p_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_10:
        DC32     dian_i_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_11:
        DC32     dian_d_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_12:
        DC32     expectdisplay_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_13:
        DC32     expectdisplay_first_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_14:
        DC32     menu1_site

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_15:
        DC32     ?_9

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_16:
        DC32     Q_H

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_17:
        DC32     ?_10

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_18:
        DC32     Q_B

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_19:
        DC32     qi_h_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_20:
        DC32     qi_b_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_21:
        DC32     left_value

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_22:
        DC32     right_value

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_23:
        DC32     long_left_value

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_24:
        DC32     down_value

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_25:
        DC32     dealsizedisplay_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_26:
        DC32     dealsizedisplay_first_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_27:
        DC32     ?_11

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_28:
        DC32     ?_13

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_29:
        DC32     dealsize_all_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_30:
        DC32     ?_14

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
        DC8 "OV7620"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_1:
        DATA
        DC8 "date"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_2:
        DATA
        DC8 "nodisplay"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_3:
        DATA
        DC8 "duo_p"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_4:
        DATA
        DC8 "duo_i"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_5:
        DATA
        DC8 "duo_d"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_6:
        DATA
        DC8 "dian_p"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_7:
        DATA
        DC8 "dian_i"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_8:
        DATA
        DC8 "dian_d"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_9:
        DATA
        DC8 "h_value"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_10:
        DATA
        DC8 "b_value"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_11:
        DATA
        DC8 "imgdealsize"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "all"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_13:
        DATA
        DC8 "part"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_14:
        DATA
        DC8 "go go go"
        DC8 0, 0, 0

        END
// 
//    18 bytes in section .bss
//    23 bytes in section .data
//   128 bytes in section .rodata
// 4 952 bytes in section .text
// 
// 4 952 bytes of CODE  memory
//   128 bytes of CONST memory
//    41 bytes of DATA  memory
//
//Errors: none
//Warnings: none
