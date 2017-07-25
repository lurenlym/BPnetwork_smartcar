///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       07/Apr/2017  10:47:08
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\znc\project\K60FN\network_car_scale\App\xb_init.c
//    Command line =  
//        E:\znc\project\K60FN\network_car_scale\App\xb_init.c -D DEBUG -D
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
//        E:\znc\project\K60FN\network_car_scale\Prj\IAR\FN15_Debug\List\xb_init.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "1"
        RTMODEL "__dlib_full_locale_support", "1"
        AAPCS BASE,INTERWORK,VFP
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN bus_clk_khz
        EXTERN control
        EXTERN ftm_pwm_init
        EXTERN ftm_quad_init
        EXTERN pit_init
        EXTERN recevie_date
        EXTERN set_vector_handler
        EXTERN uart_getchar
        EXTERN uart_init
        EXTERN uart_query
        EXTERN uart_rx_irq_en

        PUBLIC INIT
        PUBLIC interrupt_init
        PUBLIC recevie
        PUBLIC timevarL
        PUBLIC timevarR
        PUBLIC xb_ftm_init
        
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
        
// E:\znc\project\K60FN\network_car_scale\App\xb_init.c
//    1 #include "include.h"

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function NVIC_EnableIRQ
          CFI NoCalls
        THUMB
// static __interwork __softfp void NVIC_EnableIRQ(IRQn_Type)
NVIC_EnableIRQ:
        MOVS     R1,#+1
        ANDS     R2,R0,#0x1F
        LSLS     R1,R1,R2
        LDR.N    R2,??DataTable2  ;; 0xe000e100
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        LSRS     R3,R0,#+5
        STR      R1,[R2, R3, LSL #+2]
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
//    2 #include "common.h"

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    3 uint32 timevarR=0;
timevarR:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    4 uint32 timevarL=0;
timevarL:
        DS8 4
//    5 
//    6 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function xb_ftm_init
        THUMB
//    7 void xb_ftm_init()
//    8 {
xb_ftm_init:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//    9   ftm_pwm_init(S3010_FTM, S3010_CH,S3010_HZ,DUO_PWM_mid);      //初始化 舵机 PWM
        MOVW     R3,#+1415
        MOVS     R2,#+100
        MOVS     R1,#+7
        MOVS     R0,#+0
          CFI FunCall ftm_pwm_init
        BL       ftm_pwm_init
//   10   ftm_pwm_init(MOTOR_FTM, MOTOR1_PWM,MOTOR_HZ,0);
        MOVS     R3,#+0
        MOVW     R2,#+10000
        MOVS     R1,#+0
        MOVS     R0,#+3
          CFI FunCall ftm_pwm_init
        BL       ftm_pwm_init
//   11   ftm_pwm_init(MOTOR_FTM, MOTOR2_PWM,MOTOR_HZ,DIAN_PWM_INIT);
        MOVS     R3,#+0
        MOVW     R2,#+10000
        MOVS     R1,#+1
        MOVS     R0,#+3
          CFI FunCall ftm_pwm_init
        BL       ftm_pwm_init
//   12   ftm_pwm_init(MOTOR_FTM, MOTOR3_PWM,MOTOR_HZ,DIAN_PWM_INIT);
        MOVS     R3,#+0
        MOVW     R2,#+10000
        MOVS     R1,#+2
        MOVS     R0,#+3
          CFI FunCall ftm_pwm_init
        BL       ftm_pwm_init
//   13   ftm_pwm_init(MOTOR_FTM, MOTOR4_PWM,MOTOR_HZ,0);
        MOVS     R3,#+0
        MOVW     R2,#+10000
        MOVS     R1,#+3
        MOVS     R0,#+3
          CFI FunCall ftm_pwm_init
        BL       ftm_pwm_init
//   14   
//   15   ftm_quad_init(FTM1);
        MOVS     R0,#+1
          CFI FunCall ftm_quad_init
        BL       ftm_quad_init
//   16   ftm_quad_init(FTM2);
        MOVS     R0,#+2
          CFI FunCall ftm_quad_init
        BL       ftm_quad_init
//   17 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock1
//   18 
//   19 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function interrupt_init
        THUMB
//   20 void interrupt_init()
//   21 {
interrupt_init:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   22       pit_init_ms(PIT0,20);
        LDR.N    R0,??DataTable2_1
        LDR      R0,[R0, #+0]
        MOVS     R1,#+20
        MUL      R1,R1,R0
        MOVS     R0,#+0
          CFI FunCall pit_init
        BL       pit_init
//   23       set_vector_handler(PIT0_VECTORn , control);
        LDR.N    R1,??DataTable2_2
        MOVS     R0,#+84
          CFI FunCall set_vector_handler
        BL       set_vector_handler
//   24 //    NVIC_SetPriority(PIT1_IRQn,9);
//   25     enable_irq(PIT0_IRQn);
        MOVS     R0,#+68
          CFI FunCall NVIC_EnableIRQ
        BL       NVIC_EnableIRQ
//   26     uart_init(UART4,115200);
        MOVS     R1,#+115200
        MOVS     R0,#+4
          CFI FunCall uart_init
        BL       uart_init
//   27     set_vector_handler(UART4_RX_TX_VECTORn ,recevie); //前方避障
        ADR.W    R1,recevie
        MOVS     R0,#+69
          CFI FunCall set_vector_handler
        BL       set_vector_handler
//   28     uart_rx_irq_en (UART4); 
        MOVS     R0,#+4
          CFI FunCall uart_rx_irq_en
        BL       uart_rx_irq_en
//   29     
//   30 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock2
//   31 
//   32 //*******各模块及管脚初始化***********//

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function INIT
        THUMB
//   33 void INIT()
//   34 {
INIT:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   35     xb_ftm_init();
          CFI FunCall xb_ftm_init
        BL       xb_ftm_init
//   36     interrupt_init();
          CFI FunCall interrupt_init
        BL       interrupt_init
//   37 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock3
//   38 

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function recevie
        THUMB
//   39 void recevie()
//   40 {
recevie:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   41   if(uart_query(UART4) == 1)
        MOVS     R0,#+4
          CFI FunCall uart_query
        BL       uart_query
        CMP      R0,#+1
        BNE.N    ??recevie_0
//   42   {
//   43    uart_getchar(UART4, &recevie_date);
        LDR.N    R1,??DataTable2_3
        MOVS     R0,#+4
          CFI FunCall uart_getchar
        BL       uart_getchar
//   44   }
//   45 }
??recevie_0:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     0xe000e100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     bus_clk_khz

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     control

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     recevie_date

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
//   8 bytes in section .bss
// 216 bytes in section .text
// 
// 216 bytes of CODE memory
//   8 bytes of DATA memory
//
//Errors: none
//Warnings: 1
