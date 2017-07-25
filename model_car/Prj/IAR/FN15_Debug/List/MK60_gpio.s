///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       21/Mar/2017  16:04:52
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\znc\project\K60FN\network_car\Chip\src\MK60_gpio.c
//    Command line =  
//        E:\znc\project\K60FN\network_car\Chip\src\MK60_gpio.c -D DEBUG -D
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
//        E:\znc\project\K60FN\network_car\Prj\IAR\FN15_Debug\List\MK60_gpio.s
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
        EXTERN port_init

        PUBLIC GPIOX
        PUBLIC gpio_ddr
        PUBLIC gpio_get
        PUBLIC gpio_init
        PUBLIC gpio_set
        PUBLIC gpio_turn
        
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
        
// E:\znc\project\K60FN\network_car\Chip\src\MK60_gpio.c
//    1 /*!
//    2  *     COPYRIGHT NOTICE
//    3  *     Copyright (c) 2013,ɽ��Ƽ�
//    4  *     All rights reserved.
//    5  *     �������ۣ�ɽ����̳ http://www.vcan123.com
//    6  *
//    7  *     ��ע�������⣬�����������ݰ�Ȩ����ɽ��Ƽ����У�δ������������������ҵ��;��
//    8  *     �޸�����ʱ���뱣��ɽ��Ƽ��İ�Ȩ������
//    9  *
//   10  * @file       MK60_gpio.c
//   11  * @brief      gpio��������
//   12  * @author     ɽ��Ƽ�
//   13  * @version    v5.0
//   14  * @date       2013-06-26
//   15  */
//   16 
//   17 /*
//   18  * ����ͷ�ļ�
//   19  */
//   20 #include "common.h"
//   21 #include "MK60_port.h"
//   22 #include "MK60_gpio.h"
//   23 
//   24 /*
//   25  * ��������
//   26  */

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   27 GPIO_MemMapPtr GPIOX[PTX_MAX] = {PTA_BASE_PTR, PTB_BASE_PTR, PTC_BASE_PTR, PTD_BASE_PTR, PTE_BASE_PTR}; //�������ָ�����鱣�� GPIOX �ĵ�ַ
GPIOX:
        DATA
        DC32 400FF000H, 400FF040H, 400FF080H, 400FF0C0H, 400FF100H
//   28 
//   29 
//   30 
//   31 /*!
//   32  *  @brief      ��ʼ��gpio
//   33  *  @param      PTxn    �˿�
//   34  *  @param      cfg     ���ŷ���,0=����,1=���
//   35  *  @param      data    �����ʼ״̬,0=�͵�ƽ,1=�ߵ�ƽ ����������Ч��
//   36  *  @since      v5.0
//   37  *  Sample usage:       gpio_init (PTA8, GPI,0);    //��ʼ�� PTA8 �ܽ�Ϊ����
//   38  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function gpio_init
        THUMB
//   39 void gpio_init (PTXn_e ptxn, GPIO_CFG cfg, uint8 data)
//   40 {
gpio_init:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//   41     //���ùܽ�ΪGPIO����
//   42     port_init( ptxn, ALT1);
        MOV      R1,#+256
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall port_init
        BL       port_init
//   43 
//   44     //�˿ڷ���������뻹�����
//   45     if(  cfg == GPI )
        SXTB     R5,R5            ;; SignExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??gpio_init_0
//   46     {
//   47         //���ö˿ڷ���Ϊ����
//   48         GPIO_PDDR_REG(GPIOX_BASE(ptxn)) &= ~(1 << PTn(ptxn));       // GPIO PDDR �ܽź� ��0������Ӧ�ܽ�����Ϊ�˿ڷ�������
        LDR.N    R0,??DataTable4
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ASRS     R1,R4,#+5
        LDR      R0,[R0, R1, LSL #+2]
        LDR.N    R1,??DataTable4
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ASRS     R2,R4,#+5
        LDR      R1,[R1, R2, LSL #+2]
        LDR      R1,[R1, #+20]
        MOVS     R2,#+1
        ANDS     R3,R4,#0x1F
        LSLS     R2,R2,R3
        BICS     R1,R1,R2
        STR      R1,[R0, #+20]
        B.N      ??gpio_init_1
//   49     }
//   50     else
//   51     {
//   52         //���ö˿ڷ���Ϊ���
//   53         GPIO_PDDR_REG(GPIOX_BASE(ptxn)) |= (1 << PTn(ptxn));        // GPIO PDDR �ܽź� ��1������Ӧ�ܽ�����Ϊ�˿ڷ������
??gpio_init_0:
        LDR.N    R0,??DataTable4
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ASRS     R1,R4,#+5
        LDR      R0,[R0, R1, LSL #+2]
        LDR.N    R1,??DataTable4
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ASRS     R2,R4,#+5
        LDR      R1,[R1, R2, LSL #+2]
        LDR      R1,[R1, #+20]
        MOVS     R2,#+1
        ANDS     R3,R4,#0x1F
        LSLS     R2,R2,R3
        ORRS     R1,R2,R1
        STR      R1,[R0, #+20]
//   54 
//   55         //�˿��������
//   56         if(data == 0)
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??gpio_init_2
//   57         {
//   58             GPIO_PDOR_REG(GPIOX_BASE(ptxn)) &= ~(1 << PTn(ptxn));   // GPIO PDOR �ܽź� ��0������Ӧ�ܽ�����Ϊ�˿�����͵�ƽ
        LDR.N    R0,??DataTable4
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ASRS     R1,R4,#+5
        LDR      R0,[R0, R1, LSL #+2]
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1
        ANDS     R2,R4,#0x1F
        LSLS     R1,R1,R2
        BICS     R0,R0,R1
        LDR.N    R1,??DataTable4
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ASRS     R2,R4,#+5
        LDR      R1,[R1, R2, LSL #+2]
        STR      R0,[R1, #+0]
        B.N      ??gpio_init_1
//   59         }
//   60         else
//   61         {
//   62             GPIO_PDOR_REG(GPIOX_BASE(ptxn))  |= (1 << PTn(ptxn));   // GPIO PDOR �ܽź� ��1������Ӧ�ܽ�����Ϊ�˿�����ߵ�ƽ
??gpio_init_2:
        LDR.N    R0,??DataTable4
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ASRS     R1,R4,#+5
        LDR      R0,[R0, R1, LSL #+2]
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1
        ANDS     R2,R4,#0x1F
        LSLS     R1,R1,R2
        ORRS     R0,R1,R0
        LDR.N    R1,??DataTable4
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ASRS     R2,R4,#+5
        LDR      R1,[R1, R2, LSL #+2]
        STR      R0,[R1, #+0]
//   63         }
//   64     }
//   65 }
??gpio_init_1:
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock0
//   66 
//   67 /*!
//   68  *  @brief      �����������ݷ���
//   69  *  @param      PTxn    �˿�
//   70  *  @param      cfg     ���ŷ���,0=����,1=���
//   71  *  @since      v5.0
//   72  *  Sample usage:       gpio_ddr (PTA8, GPI);    //���� PTA8 �ܽ�Ϊ����
//   73  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function gpio_ddr
          CFI NoCalls
        THUMB
//   74 void    gpio_ddr   (PTXn_e ptxn, GPIO_CFG cfg)
//   75 {
gpio_ddr:
        PUSH     {R4,R5}
          CFI R5 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//   76     //�˿ڷ���������뻹�����
//   77     if(  cfg == GPI )
        SXTB     R1,R1            ;; SignExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BNE.N    ??gpio_ddr_0
//   78     {
//   79         //���ö˿ڷ���Ϊ����
//   80         GPIO_PDDR_REG(GPIOX_BASE(ptxn)) &= ~(1 << PTn(ptxn));           // GPIO PDDR �ܽź� ��0������Ӧ�ܽ�����Ϊ�˿ڷ�������
        LDR.N    R2,??DataTable4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ASRS     R3,R0,#+5
        LDR      R2,[R2, R3, LSL #+2]
        LDR.N    R3,??DataTable4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ASRS     R4,R0,#+5
        LDR      R3,[R3, R4, LSL #+2]
        LDR      R3,[R3, #+20]
        MOVS     R4,#+1
        ANDS     R5,R0,#0x1F
        LSLS     R4,R4,R5
        BICS     R3,R3,R4
        STR      R3,[R2, #+20]
        B.N      ??gpio_ddr_1
//   81     }
//   82     else
//   83     {
//   84         //���ö˿ڷ���Ϊ���
//   85         GPIO_PDDR_REG(GPIOX_BASE(ptxn)) |= (1 << PTn(ptxn));            // GPIO PDDR �ܽź� ��1������Ӧ�ܽ�����Ϊ�˿ڷ������
??gpio_ddr_0:
        LDR.N    R2,??DataTable4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ASRS     R3,R0,#+5
        LDR      R2,[R2, R3, LSL #+2]
        LDR.N    R3,??DataTable4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ASRS     R4,R0,#+5
        LDR      R3,[R3, R4, LSL #+2]
        LDR      R3,[R3, #+20]
        MOVS     R4,#+1
        ANDS     R5,R0,#0x1F
        LSLS     R4,R4,R5
        ORRS     R3,R4,R3
        STR      R3,[R2, #+20]
//   86     }
//   87 }
??gpio_ddr_1:
        POP      {R4,R5}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock1
//   88 
//   89 /*!
//   90  *  @brief      ��������״̬
//   91  *  @param      PTxn    �˿�
//   92  *  @param      data    �����ʼ״̬,0=�͵�ƽ,1=�ߵ�ƽ ����������Ч��
//   93  *  @since      v5.0
//   94  *  @warning    ��ر�֤���ݷ���Ϊ�����DEBUGģʽ�£��ж��Խ��м�⣩
//   95  *  Sample usage:       gpio_set (PTA8, 1);    // PTA8 �ܽ� ��� 1
//   96  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function gpio_set
        THUMB
//   97 void gpio_set (PTXn_e ptxn, uint8 data)
//   98 {
gpio_set:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
//   99     ASSERT( BIT_GET( GPIO_PDDR_REG(GPIOX_BASE(ptxn)) , PTn(ptxn)) == GPO ); // ���ԣ���� ��������Ƿ�Ϊ���
        LDR.N    R0,??DataTable4
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ASRS     R1,R4,#+5
        LDR      R0,[R0, R1, LSL #+2]
        LDR      R0,[R0, #+20]
        ANDS     R1,R4,#0x1F
        LSRS     R0,R0,R1
        LSLS     R0,R0,#+31
        BMI.N    ??gpio_set_0
        MOVS     R1,#+99
        LDR.N    R0,??DataTable4_1
          CFI FunCall assert_failed
        BL       assert_failed
//  100                                                                             // ��ȡ GPIO PDDR �ܽź� ���Ƚ��Ƿ�Ϊ���
//  101 
//  102     //�˿��������
//  103     if(data == 0)
??gpio_set_0:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??gpio_set_1
//  104     {
//  105         GPIO_PDOR_REG(GPIOX_BASE(ptxn)) &= ~(1 << PTn(ptxn));   // GPIO PDOR �ܽź� ��0������Ӧ�ܽ�����Ϊ�˿�����͵�ƽ
        LDR.N    R0,??DataTable4
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ASRS     R1,R4,#+5
        LDR      R0,[R0, R1, LSL #+2]
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1
        ANDS     R2,R4,#0x1F
        LSLS     R1,R1,R2
        BICS     R0,R0,R1
        LDR.N    R1,??DataTable4
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ASRS     R2,R4,#+5
        LDR      R1,[R1, R2, LSL #+2]
        STR      R0,[R1, #+0]
        B.N      ??gpio_set_2
//  106     }
//  107     else
//  108     {
//  109         GPIO_PDOR_REG(GPIOX_BASE(ptxn))  |= (1 << PTn(ptxn));   // GPIO PDOR �ܽź� ��1������Ӧ�ܽ�����Ϊ�˿�����ߵ�ƽ
??gpio_set_1:
        LDR.N    R0,??DataTable4
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ASRS     R1,R4,#+5
        LDR      R0,[R0, R1, LSL #+2]
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1
        ANDS     R2,R4,#0x1F
        LSLS     R1,R1,R2
        ORRS     R0,R1,R0
        LDR.N    R1,??DataTable4
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ASRS     R2,R4,#+5
        LDR      R1,[R1, R2, LSL #+2]
        STR      R0,[R1, #+0]
//  110     }
//  111 }
??gpio_set_2:
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock2
//  112 
//  113 
//  114 /*!
//  115  *  @brief      ��ת����״̬
//  116  *  @param      PTxn    �˿�
//  117  *  @since      v5.0
//  118  *  @warning    ��ر�֤���ݷ���Ϊ�����DEBUGģʽ�£��ж��Խ��м�⣩
//  119  *  Sample usage:       gpio_turn (PTA8);    // PTA8 �ܽ� ��� ��ת
//  120  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function gpio_turn
        THUMB
//  121 void gpio_turn (PTXn_e ptxn)
//  122 {
gpio_turn:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  123     ASSERT( BIT_GET( GPIO_PDDR_REG(GPIOX_BASE(ptxn)) , PTn(ptxn)) == GPO ); // ���ԣ���� ��������Ƿ�Ϊ���
        LDR.N    R0,??DataTable4
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ASRS     R1,R4,#+5
        LDR      R0,[R0, R1, LSL #+2]
        LDR      R0,[R0, #+20]
        ANDS     R1,R4,#0x1F
        LSRS     R0,R0,R1
        LSLS     R0,R0,#+31
        BMI.N    ??gpio_turn_0
        MOVS     R1,#+123
        LDR.N    R0,??DataTable4_1
          CFI FunCall assert_failed
        BL       assert_failed
//  124                                                                             // ��ȡ GPIO PDDR �ܽź� ���Ƚ��Ƿ�Ϊ���
//  125 
//  126     GPIO_PTOR_REG( GPIOX_BASE(ptxn))  =  1 << (PTn(ptxn ));                 // GPIO PTOR ptxn ��1��������0 ������Ӧ�ܽ�����Ϊ�˿������ת������λ����
??gpio_turn_0:
        LDR.N    R0,??DataTable4
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ASRS     R1,R4,#+5
        LDR      R0,[R0, R1, LSL #+2]
        MOVS     R1,#+1
        ANDS     R2,R4,#0x1F
        LSLS     R1,R1,R2
        STR      R1,[R0, #+12]
//  127                                                                             // �˴������� BIT_SET ���������1 ����Ϊ���뱣֤����λ ���䣬����λֱ����0����
//  128 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock3
//  129 
//  130 /*!
//  131  *  @brief      ��ȡ��������״̬
//  132  *  @param      PTxn    �˿�
//  133  *  @return     �ܽŵ�״̬��1Ϊ�ߵ�ƽ��0Ϊ�͵�ƽ
//  134  *  @since      v5.0
//  135  *  @warning    ��ر�֤���ݷ���Ϊ���루DEBUGģʽ�£��ж��Խ��м�⣩
//  136  *  Sample usage:       uint8 pta8_data = gpio_get (PTA8);    // ��ȡ PTA8 �ܽ� �����ƽ
//  137  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function gpio_get
        THUMB
//  138 uint8 gpio_get(PTXn_e ptxn)
//  139 {
gpio_get:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  140     ASSERT( BIT_GET( GPIO_PDDR_REG(GPIOX_BASE(ptxn)) , PTn(ptxn)) == GPI ); // ���ԣ���� ��������Ƿ�Ϊ����
        LDR.N    R0,??DataTable4
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ASRS     R1,R4,#+5
        LDR      R0,[R0, R1, LSL #+2]
        LDR      R0,[R0, #+20]
        ANDS     R1,R4,#0x1F
        LSRS     R0,R0,R1
        LSLS     R0,R0,#+31
        BPL.N    ??gpio_get_0
        MOVS     R1,#+140
        LDR.N    R0,??DataTable4_1
          CFI FunCall assert_failed
        BL       assert_failed
//  141                                                                             // ��ȡ GPIO PDDR �ܽź� ���Ƚ��Ƿ�Ϊ����
//  142 
//  143     return ((GPIO_PDIR_REG(GPIOX_BASE(ptxn)) >> PTn(ptxn )) & 0x01);        // ��ȡ GPIO PDIR ptxn ״̬������ȡ�ܽ������ƽ
??gpio_get_0:
        LDR.N    R0,??DataTable4
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ASRS     R1,R4,#+5
        LDR      R0,[R0, R1, LSL #+2]
        LDR      R0,[R0, #+16]
        ANDS     R1,R4,#0x1F
        LSRS     R0,R0,R1
        ANDS     R0,R0,#0x1
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock4
//  144 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     GPIOX

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
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
        DC8 63H, 5CH, 4DH, 4BH, 36H, 30H, 5FH, 67H
        DC8 70H, 69H, 6FH, 2EH, 63H, 0
        DC8 0, 0

        END
// 
//  20 bytes in section .data
//  56 bytes in section .rodata
// 492 bytes in section .text
// 
// 492 bytes of CODE  memory
//  56 bytes of CONST memory
//  20 bytes of DATA  memory
//
//Errors: none
//Warnings: none