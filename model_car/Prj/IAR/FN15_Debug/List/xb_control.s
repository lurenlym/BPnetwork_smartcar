///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       07/Apr/2017  10:47:05
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\znc\project\K60FN\network_car_scale\App\xb_control.c
//    Command line =  
//        E:\znc\project\K60FN\network_car_scale\App\xb_control.c -D DEBUG -D
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
//        E:\znc\project\K60FN\network_car_scale\Prj\IAR\FN15_Debug\List\xb_control.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "1"
        RTMODEL "__dlib_full_locale_support", "1"
        AAPCS BASE,INTERWORK,VFP
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_d2f
        EXTERN __aeabi_d2uiz
        EXTERN __aeabi_dadd
        EXTERN __aeabi_dmul
        EXTERN __aeabi_i2d
        EXTERN __aeabi_ui2d
        EXTERN ftm_pwm_duty
        EXTERN ftm_quad_clean
        EXTERN ftm_quad_get
        EXTERN param

        PUBLIC DIAN_PID
        PUBLIC DIAN_PID_PWM_L1
        PUBLIC DIAN_PID_PWM_L2
        PUBLIC DIAN_PID_PWM_R1
        PUBLIC DIAN_PID_PWM_R2
        PUBLIC DUO_PID_PWM
        PUBLIC DUO_flag
        PUBLIC D_control
        PUBLIC PWM_control
        PUBLIC chakan
        PUBLIC control
        PUBLIC d_temp_PID_L
        PUBLIC d_temp_PID_R
        PUBLIC daoche_flag
        PUBLIC duo_params_L
        PUBLIC duo_params_R
        PUBLIC duojiinit_flag
        PUBLIC impluse_zeros_count
        PUBLIC impulseL0
        PUBLIC impulseR0
        PUBLIC impulse_L
        PUBLIC impulse_R
        PUBLIC lptmr_hander
        PUBLIC value1L
        PUBLIC value1R
        PUBLIC value2L
        PUBLIC value2R
        PUBLIC value3L
        PUBLIC value3R
        PUBLIC xb_get_impulse
        
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
        
// E:\znc\project\K60FN\network_car_scale\App\xb_control.c
//    1 #include "include.h"

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function NVIC_DisableIRQ
          CFI NoCalls
        THUMB
// static __interwork __softfp void NVIC_DisableIRQ(IRQn_Type)
NVIC_DisableIRQ:
        MOVS     R1,#+1
        ANDS     R2,R0,#0x1F
        LSLS     R1,R1,R2
        LDR.W    R2,??DataTable6_2  ;; 0xe000e180
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        LSRS     R3,R0,#+5
        STR      R1,[R2, R3, LSL #+2]
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
//    2 #include "common.h"
//    3 #include "math.h"
//    4 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    5 uint32 chakan=0;
chakan:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//    6 uint8 duojiinit_flag=0;
duojiinit_flag:
        DS8 1
//    7 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//    8 uint8 daoche_flag=0; //倒车标志位
daoche_flag:
        DS8 1

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//    9 uint32 DUO_PID_PWM=DUO_PWM_mid;//舵机PWM占空比，初始1640
DUO_PID_PWM:
        DATA
        DC32 1415

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   10 uint8 DUO_flag=1;
DUO_flag:
        DATA
        DC8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   11 int32 impulseL0=0; //期望值
impulseL0:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   12 int32 impulseR0=0;
impulseR0:
        DS8 4
//   13 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   14 int32 impulse_L=0;
impulse_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   15 int32 impulse_R=0;
impulse_R:
        DS8 4
//   16 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   17 uint32 impluse_zeros_count=0;
impluse_zeros_count:
        DS8 4
//   18 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   19 int32 value1L=0,value2L=0,value3L=0;
value1L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
value2L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
value3L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   20 float d_temp_PID_L=0;
d_temp_PID_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   21 int32 value1R=0,value2R=0,value3R=0;
value1R:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
value2R:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
value3R:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   22 float d_temp_PID_R=0;
d_temp_PID_R:
        DS8 4
//   23 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   24 int32 duo_params_L = 0;
duo_params_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   25 int32 duo_params_R = 0;
duo_params_R:
        DS8 4
//   26 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   27 uint32 DIAN_PID_PWM_L1=0;
DIAN_PID_PWM_L1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   28 uint32 DIAN_PID_PWM_L2=0;
DIAN_PID_PWM_L2:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   29 uint32 DIAN_PID_PWM_R1=0;
DIAN_PID_PWM_R1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   30 uint32 DIAN_PID_PWM_R2=0;
DIAN_PID_PWM_R2:
        DS8 4
//   31 
//   32 void PWM_control();
//   33 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function D_control
        THUMB
//   34 void D_control(uint8 motor_params)
//   35 {
D_control:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//   36   //ftm_pwm_duty(MOTOR_FTM, MOTOR1_PWM,0);
//   37   //ftm_pwm_duty(MOTOR_FTM, MOTOR2_PWM,1300);
//   38   //ftm_pwm_duty(MOTOR_FTM, MOTOR3_PWM,1300);
//   39   //ftm_pwm_duty(MOTOR_FTM, MOTOR4_PWM,0);
//   40   impulseL0 = 40;
        MOVS     R0,#+40
        LDR.N    R1,??DataTable6_3
        STR      R0,[R1, #+0]
//   41   impulseR0 = 40;
        MOVS     R0,#+40
        LDR.N    R1,??DataTable6_4
        STR      R0,[R1, #+0]
//   42   
//   43   DIAN_PID(impulseL0,impulseR0);
        LDR.N    R0,??DataTable6_4
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable6_3
        LDR      R0,[R0, #+0]
          CFI FunCall DIAN_PID
        BL       DIAN_PID
//   44   PWM_control();
          CFI FunCall PWM_control
        BL       PWM_control
//   45   //DUO_PID(motor_params);
//   46   DUO_PID_PWM = DUO_PWM_left_sz+motor_params*3.1; 
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R0,R4
          CFI FunCall __aeabi_ui2d
        BL       __aeabi_ui2d
        LDR.N    R2,??DataTable6_5  ;; 0xcccccccd
        LDR.N    R3,??DataTable6_6  ;; 0x4008cccc
          CFI FunCall __aeabi_dmul
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR.N    R3,??DataTable6_7  ;; 0x40938800
          CFI FunCall __aeabi_dadd
        BL       __aeabi_dadd
          CFI FunCall __aeabi_d2uiz
        BL       __aeabi_d2uiz
        LDR.N    R1,??DataTable6_8
        STR      R0,[R1, #+0]
//   47   ftm_pwm_duty(S3010_FTM, S3010_CH,DUO_PID_PWM);
        LDR.N    R0,??DataTable6_8
        LDR      R2,[R0, #+0]
        MOVS     R1,#+7
        MOVS     R0,#+0
          CFI FunCall ftm_pwm_duty
        BL       ftm_pwm_duty
//   48  
//   49 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock1
//   50 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function PWM_control
        THUMB
//   51 void PWM_control()
//   52 {
PWM_control:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//   53   
//   54   ftm_pwm_duty(MOTOR_FTM, MOTOR1_PWM,DIAN_PID_PWM_L2);
        LDR.N    R0,??DataTable6_9
        LDR      R2,[R0, #+0]
        MOVS     R1,#+0
        MOVS     R0,#+3
          CFI FunCall ftm_pwm_duty
        BL       ftm_pwm_duty
//   55   ftm_pwm_duty(MOTOR_FTM, MOTOR2_PWM,DIAN_PID_PWM_L1);
        LDR.N    R0,??DataTable6_10
        LDR      R2,[R0, #+0]
        MOVS     R1,#+1
        MOVS     R0,#+3
          CFI FunCall ftm_pwm_duty
        BL       ftm_pwm_duty
//   56   ftm_pwm_duty(MOTOR_FTM, MOTOR3_PWM,DIAN_PID_PWM_R2);
        LDR.N    R0,??DataTable6_11
        LDR      R2,[R0, #+0]
        MOVS     R1,#+2
        MOVS     R0,#+3
          CFI FunCall ftm_pwm_duty
        BL       ftm_pwm_duty
//   57   ftm_pwm_duty(MOTOR_FTM, MOTOR4_PWM,DIAN_PID_PWM_R1);
        LDR.N    R0,??DataTable6_12
        LDR      R2,[R0, #+0]
        MOVS     R1,#+3
        MOVS     R0,#+3
          CFI FunCall ftm_pwm_duty
        BL       ftm_pwm_duty
//   58 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock2
//   59 

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function DIAN_PID
        THUMB
//   60 void DIAN_PID(int32 impulseL0,int32 impulseR0)
//   61 {
DIAN_PID:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        VPUSH    {D8-D10}
          CFI D10 Frame(CFA, -24)
          CFI D9 Frame(CFA, -32)
          CFI D8 Frame(CFA, -40)
          CFI CFA R13+40
        MOVS     R4,R0
        MOVS     R5,R1
//   62   //左轮
//   63   //impulse_L=-impulse_L;//左右脉冲方向不一致
//   64   xb_get_impulse();
          CFI FunCall xb_get_impulse
        BL       xb_get_impulse
//   65   float d_temp_P_L=0,d_temp_I_L=0,d_temp_D_L=0;
        VLDR.W   S16,??DataTable5  ;; 0x0
        VLDR.W   S17,??DataTable5  ;; 0x0
        VLDR.W   S18,??DataTable5  ;; 0x0
//   66   value1L=impulseL0-impulse_L;
        LDR.N    R0,??DataTable6_13
        LDR      R0,[R0, #+0]
        SUBS     R0,R4,R0
        LDR.N    R1,??DataTable6_14
        STR      R0,[R1, #+0]
//   67   d_temp_P_L=d_P_coefficient*(value1L-value2L);
        LDR.N    R0,??DataTable6_14
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable6_15
        LDR      R1,[R1, #+0]
        SUBS     R0,R0,R1
        MOVS     R1,#+0
        MULS     R0,R1,R0
        VMOV     S0,R0
        VCVT.F32.S32 S0,S0
        VMOV.F32 S16,S0
//   68   d_temp_I_L=d_I_coefficient*value1L;
        LDR.N    R0,??DataTable6_14
        LDR      R0,[R0, #+0]
          CFI FunCall __aeabi_i2d
        BL       __aeabi_i2d
        MOVS     R2,#+0
        LDR.N    R3,??DataTable6_16  ;; 0x3fe00000
          CFI FunCall __aeabi_dmul
        BL       __aeabi_dmul
          CFI FunCall __aeabi_d2f
        BL       __aeabi_d2f
        VMOV     S17,R0
//   69   d_temp_D_L=d_D_coefficient*(value1L-2*value2L+value3L);
        LDR.N    R0,??DataTable6_14
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable6_15
        LDR      R1,[R1, #+0]
        SUBS     R0,R0,R1, LSL #+1
        LDR.N    R1,??DataTable6_17
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        MOVS     R1,#+0
        MULS     R0,R1,R0
        VMOV     S0,R0
        VCVT.F32.S32 S0,S0
        VMOV.F32 S18,S0
//   70   d_temp_PID_L=d_temp_PID_L+d_temp_P_L+d_temp_I_L+d_temp_D_L;
        LDR.N    R0,??DataTable6_18
        VLDR     S0,[R0, #0]
        VADD.F32 S0,S0,S16
        VADD.F32 S0,S0,S17
        VADD.F32 S0,S0,S18
        LDR.N    R0,??DataTable6_18
        VSTR     S0,[R0, #0]
//   71   
//   72   value2L=impulseL0-impulse_L;
        LDR.N    R0,??DataTable6_13
        LDR      R0,[R0, #+0]
        SUBS     R0,R4,R0
        LDR.N    R1,??DataTable6_15
        STR      R0,[R1, #+0]
//   73   value3L=value2L;
        LDR.N    R0,??DataTable6_15
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable6_17
        STR      R0,[R1, #+0]
//   74   if(d_temp_PID_L>DIAN_PWM_max)//限幅
        LDR.N    R0,??DataTable6_18
        VLDR     S0,[R0, #0]
        VLDR.W   S1,??DataTable6  ;; 0x44fa0001
        VCMP.F32 S0,S1
        FMSTAT   
        BLT.N    ??DIAN_PID_0
//   75   {
//   76     d_temp_PID_L=DIAN_PWM_max;
        LDR.N    R0,??DataTable6_18
        LDR.N    R1,??DataTable6_19  ;; 0x44fa0000
        STR      R1,[R0, #+0]
//   77   }
//   78   if(d_temp_PID_L<-DIAN_PWM_max)
??DIAN_PID_0:
        LDR.N    R0,??DataTable6_18
        VLDR     S0,[R0, #0]
        VLDR.W   S1,??DataTable6_1  ;; 0xc4fa0000
        VCMP.F32 S0,S1
        FMSTAT   
        BPL.N    ??DIAN_PID_1
//   79   {
//   80     d_temp_PID_L=-DIAN_PWM_max;
        LDR.N    R0,??DataTable6_18
        LDR.N    R1,??DataTable6_1  ;; 0xc4fa0000
        STR      R1,[R0, #+0]
//   81   }
//   82   if(d_temp_PID_L>=0)
??DIAN_PID_1:
        LDR.N    R0,??DataTable6_18
        VLDR     S0,[R0, #0]
        VCMP.F32 S0,#0.0
        FMSTAT   
        BLT.N    ??DIAN_PID_2
//   83   {
//   84     DIAN_PID_PWM_L1=(uint32)d_temp_PID_L;
        LDR.N    R0,??DataTable6_18
        VLDR     S0,[R0, #0]
        VCVT.U32.F32 S0,S0
        LDR.N    R0,??DataTable6_10
        VSTR     S0,[R0, #0]
//   85     DIAN_PID_PWM_L2=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_9
        STR      R0,[R1, #+0]
        B.N      ??DIAN_PID_3
//   86   }
//   87   else
//   88   {
//   89     DIAN_PID_PWM_L2=(uint32)(-d_temp_PID_L);
??DIAN_PID_2:
        LDR.N    R0,??DataTable6_18
        VLDR     S0,[R0, #0]
        VNEG.F32 S0,S0
        VCVT.U32.F32 S0,S0
        LDR.N    R0,??DataTable6_9
        VSTR     S0,[R0, #0]
//   90     DIAN_PID_PWM_L1=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_10
        STR      R0,[R1, #+0]
//   91   }
//   92  // impulse_L=-impulse_L;
//   93   //右轮
//   94   float d_temp_P_R=0,d_temp_I_R=0,d_temp_D_R=0;
??DIAN_PID_3:
        VLDR.W   S19,??DataTable5  ;; 0x0
        VLDR.W   S20,??DataTable5  ;; 0x0
        VLDR.W   S21,??DataTable5  ;; 0x0
//   95   value1R=impulseR0-impulse_R;
        LDR.N    R0,??DataTable6_20
        LDR      R0,[R0, #+0]
        SUBS     R0,R5,R0
        LDR.N    R1,??DataTable6_21
        STR      R0,[R1, #+0]
//   96   d_temp_P_R=d_P_coefficient*(value1R-value2R);
        LDR.N    R0,??DataTable6_21
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable6_22
        LDR      R1,[R1, #+0]
        SUBS     R0,R0,R1
        MOVS     R1,#+0
        MULS     R0,R1,R0
        VMOV     S0,R0
        VCVT.F32.S32 S0,S0
        VMOV.F32 S19,S0
//   97   d_temp_I_R=d_I_coefficient*value1R;
        LDR.N    R0,??DataTable6_21
        LDR      R0,[R0, #+0]
          CFI FunCall __aeabi_i2d
        BL       __aeabi_i2d
        MOVS     R2,#+0
        LDR.N    R3,??DataTable6_16  ;; 0x3fe00000
          CFI FunCall __aeabi_dmul
        BL       __aeabi_dmul
          CFI FunCall __aeabi_d2f
        BL       __aeabi_d2f
        VMOV     S20,R0
//   98   d_temp_D_R=d_D_coefficient*(value1R-2*value2R+value3R);
        LDR.N    R0,??DataTable6_21
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable6_22
        LDR      R1,[R1, #+0]
        SUBS     R0,R0,R1, LSL #+1
        LDR.N    R1,??DataTable6_23
        LDR      R1,[R1, #+0]
        ADDS     R0,R1,R0
        MOVS     R1,#+0
        MULS     R0,R1,R0
        VMOV     S0,R0
        VCVT.F32.S32 S0,S0
        VMOV.F32 S21,S0
//   99   d_temp_PID_R=d_temp_PID_R+d_temp_P_R+d_temp_I_R+d_temp_D_R; 
        LDR.N    R0,??DataTable6_24
        VLDR     S0,[R0, #0]
        VADD.F32 S0,S0,S19
        VADD.F32 S0,S0,S20
        VADD.F32 S0,S0,S21
        LDR.N    R0,??DataTable6_24
        VSTR     S0,[R0, #0]
//  100     
//  101   value2R=impulseR0-impulse_R;
        LDR.N    R0,??DataTable6_20
        LDR      R0,[R0, #+0]
        SUBS     R0,R5,R0
        LDR.N    R1,??DataTable6_22
        STR      R0,[R1, #+0]
//  102   value3R=value2R;
        LDR.N    R0,??DataTable6_22
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable6_23
        STR      R0,[R1, #+0]
//  103    if(d_temp_PID_R>DIAN_PWM_max)
        LDR.N    R0,??DataTable6_24
        VLDR     S0,[R0, #0]
        VLDR.W   S1,??DataTable6  ;; 0x44fa0001
        VCMP.F32 S0,S1
        FMSTAT   
        BLT.N    ??DIAN_PID_4
//  104   {
//  105     d_temp_PID_R=DIAN_PWM_max;
        LDR.N    R0,??DataTable6_24
        LDR.N    R1,??DataTable6_19  ;; 0x44fa0000
        STR      R1,[R0, #+0]
//  106   }
//  107   if(d_temp_PID_R<-DIAN_PWM_max)
??DIAN_PID_4:
        LDR.N    R0,??DataTable6_24
        VLDR     S0,[R0, #0]
        VLDR.W   S1,??DataTable6_1  ;; 0xc4fa0000
        VCMP.F32 S0,S1
        FMSTAT   
        BPL.N    ??DIAN_PID_5
//  108   {
//  109     d_temp_PID_R=-DIAN_PWM_max;
        LDR.N    R0,??DataTable6_24
        LDR.N    R1,??DataTable6_1  ;; 0xc4fa0000
        STR      R1,[R0, #+0]
//  110   }
//  111 if(d_temp_PID_R>=0)
??DIAN_PID_5:
        LDR.N    R0,??DataTable6_24
        VLDR     S0,[R0, #0]
        VCMP.F32 S0,#0.0
        FMSTAT   
        BLT.N    ??DIAN_PID_6
//  112   {
//  113     DIAN_PID_PWM_R2=(uint32)d_temp_PID_R;
        LDR.N    R0,??DataTable6_24
        VLDR     S0,[R0, #0]
        VCVT.U32.F32 S0,S0
        LDR.N    R0,??DataTable6_11
        VSTR     S0,[R0, #0]
//  114     DIAN_PID_PWM_R1=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_12
        STR      R0,[R1, #+0]
        B.N      ??DIAN_PID_7
//  115   }
//  116   else
//  117   {
//  118     DIAN_PID_PWM_R1=(uint32)(-d_temp_PID_R);
??DIAN_PID_6:
        LDR.N    R0,??DataTable6_24
        VLDR     S0,[R0, #0]
        VNEG.F32 S0,S0
        VCVT.U32.F32 S0,S0
        LDR.N    R0,??DataTable6_12
        VSTR     S0,[R0, #0]
//  119     DIAN_PID_PWM_R2=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_11
        STR      R0,[R1, #+0]
//  120   }  
//  121 }
??DIAN_PID_7:
        VPOP     {D8-D10}
          CFI D8 SameValue
          CFI D9 SameValue
          CFI D10 SameValue
          CFI CFA R13+16
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock3
//  122 //void DUO_PID(uint8 duo_params)//舵机PID计算
//  123 //{
//  124 //  float temp_P=0,temp_D=0,temp_PID=0;
//  125 //  
//  126 //  uint32 PID_date=0;
//  127 //  float deviation=0;
//  128 //  static double temp_deviation=0;
//  129 //  if(duo_params == 'N')
//  130 //  {
//  131 //  }
//  132 //  else if(duo_params == 'F')
//  133 //  {
//  134 //    duo_params_R = 0;
//  135 //    duo_params_L = 0;
//  136 //    temp_deviation = 0;
//  137 //  }
//  138 //  else  if(duo_params == 'L')
//  139 //    {
//  140 //      duo_params_L++;
//  141 //      duo_params_R = 0;
//  142 //      if(temp_deviation > -90)
//  143 //      temp_deviation = temp_deviation-duo_params_L*5; 
//  144 //    }
//  145 //    else if(duo_params == 'R')
//  146 //      {
//  147 //       duo_params_R++;
//  148 //       duo_params_L = 0;
//  149 //       if(temp_deviation < 90)
//  150 //       temp_deviation = duo_params_L+duo_params_R*5;       
//  151 //      }
//  152 //  
//  153 //  deviation=(float)temp_deviation;
//  154 //  temp_P=P_coefficient*deviation;
//  155 //  temp_I=temp_I+deviation;
//  156 //  temp_I=(temp_I*I_coefficient);
//  157 //  temp_D=(deviation-last_deviation)*D_coefficient;
//  158 //  last_deviation=deviation;
//  159 //  temp_PID=temp_P+temp_I+temp_D;
//  160 //  PID_date=(uint32)(temp_PID+DUO_PWM_mid);
//  161 //
//  162 //  if(PID_date>=DUO_PWM_right_sz)
//  163 //  {
//  164 //    DUO_PID_PWM=DUO_PWM_right_sz;
//  165 //    temp_deviation=90;
//  166 //  }
//  167 //  else
//  168 //  {    
//  169 //    if(PID_date<=DUO_PWM_left_sz)
//  170 //    {
//  171 //      DUO_PID_PWM=DUO_PWM_left_sz;
//  172 //      temp_deviation=-90;
//  173 //    }
//  174 //    else
//  175 //    {
//  176 //      DUO_PID_PWM=PID_date;    
//  177 //    }
//  178 //  }
//  179 //        
//  180 //}
//  181 
//  182 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function xb_get_impulse
        THUMB
//  183 void xb_get_impulse()
//  184 { 
xb_get_impulse:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  185   
//  186   impulse_R = ftm_quad_get(FTM1);          //获取FTM 正交解码 的脉冲数(负数表示反方向)
        MOVS     R0,#+1
          CFI FunCall ftm_quad_get
        BL       ftm_quad_get
        LDR.N    R1,??DataTable6_20
        STR      R0,[R1, #+0]
//  187   impulse_L = -ftm_quad_get(FTM2);           //获取FTM 正交解码 的脉冲数(负数表示反方向)
        MOVS     R0,#+2
          CFI FunCall ftm_quad_get
        BL       ftm_quad_get
        RSBS     R0,R0,#+0
        LDR.N    R1,??DataTable6_13
        STR      R0,[R1, #+0]
//  188   
//  189   ftm_quad_clean(FTM1);
        MOVS     R0,#+1
          CFI FunCall ftm_quad_clean
        BL       ftm_quad_clean
//  190   ftm_quad_clean(FTM2);
        MOVS     R0,#+2
          CFI FunCall ftm_quad_clean
        BL       ftm_quad_clean
//  191   //DELAY_MS(30);
//  192   PIT_Flag_Clear(PIT1);
        LDR.N    R0,??DataTable6_25  ;; 0x4003711c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable6_25  ;; 0x4003711c
        STR      R0,[R1, #+0]
//  193 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock4
//  194 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function lptmr_hander
        THUMB
//  195 void lptmr_hander()//倒车延时
//  196 {
lptmr_hander:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  197   disable_irq(LPTMR_IRQn);
        MOVS     R0,#+85
          CFI FunCall NVIC_DisableIRQ
        BL       NVIC_DisableIRQ
//  198   daoche_flag=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_26
        STRB     R0,[R1, #+0]
//  199   DUO_flag=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable6_27
        STRB     R0,[R1, #+0]
//  200   impluse_zeros_count=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_28
        STR      R0,[R1, #+0]
//  201   LPTMR_Flag_Clear();
        LDR.N    R0,??DataTable6_29  ;; 0x40040000
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80
        LDR.N    R1,??DataTable6_29  ;; 0x40040000
        STR      R0,[R1, #+0]
//  202 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock5

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     0x0
//  203 
//  204 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function control
        THUMB
//  205 void control()
//  206 {
control:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  207   D_control(param);
        LDR.N    R0,??DataTable6_30
        LDRB     R0,[R0, #+0]
          CFI FunCall D_control
        BL       D_control
//  208   PIT_Flag_Clear(PIT0); 
        LDR.N    R0,??DataTable6_31  ;; 0x4003710c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable6_31  ;; 0x4003710c
        STR      R0,[R1, #+0]
//  209 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock6

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     0x44fa0001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     0xc4fa0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
        DC32     0xe000e180

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_3:
        DC32     impulseL0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_4:
        DC32     impulseR0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_5:
        DC32     0xcccccccd

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_6:
        DC32     0x4008cccc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_7:
        DC32     0x40938800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_8:
        DC32     DUO_PID_PWM

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_9:
        DC32     DIAN_PID_PWM_L2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_10:
        DC32     DIAN_PID_PWM_L1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_11:
        DC32     DIAN_PID_PWM_R2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_12:
        DC32     DIAN_PID_PWM_R1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_13:
        DC32     impulse_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_14:
        DC32     value1L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_15:
        DC32     value2L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_16:
        DC32     0x3fe00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_17:
        DC32     value3L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_18:
        DC32     d_temp_PID_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_19:
        DC32     0x44fa0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_20:
        DC32     impulse_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_21:
        DC32     value1R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_22:
        DC32     value2R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_23:
        DC32     value3R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_24:
        DC32     d_temp_PID_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_25:
        DC32     0x4003711c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_26:
        DC32     daoche_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_27:
        DC32     DUO_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_28:
        DC32     impluse_zeros_count

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_29:
        DC32     0x40040000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_30:
        DC32     param

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_31:
        DC32     0x4003710c

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
//  82 bytes in section .bss
//   5 bytes in section .data
// 950 bytes in section .text
// 
// 950 bytes of CODE memory
//  87 bytes of DATA memory
//
//Errors: none
//Warnings: 1
