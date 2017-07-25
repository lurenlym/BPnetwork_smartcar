///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       21/Mar/2017  16:06:02
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\znc\project\K60FN\network_car\Board\src\VCAN_UI_VAR.c
//    Command line =  
//        E:\znc\project\K60FN\network_car\Board\src\VCAN_UI_VAR.c -D DEBUG -D
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
//        E:\znc\project\K60FN\network_car\Prj\IAR\FN15_Debug\List\VCAN_UI_VAR.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "1"
        RTMODEL "__dlib_full_locale_support", "1"
        AAPCS BASE,INTERWORK,VFP
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN LCD_num_BC
        EXTERN assert_failed
        EXTERN nrf_msg_tx
        EXTERN nrf_tx_state
        EXTERN var1
        EXTERN var2
        EXTERN var3
        EXTERN var4
        EXTERN var5
        EXTERN var6

        PUBLIC car_ctrl_get
        PUBLIC car_ctrl_syn
        PUBLIC get_var
        PUBLIC last_tab
        PUBLIC new_tab
        PUBLIC num_info
        PUBLIC save_var
        PUBLIC save_var2buff
        PUBLIC updata_var
        PUBLIC val_cancel
        PUBLIC var_addr
        PUBLIC var_display
        PUBLIC var_init
        PUBLIC var_ok
        PUBLIC var_select
        PUBLIC var_syn
        PUBLIC var_value
        
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
        
// E:\znc\project\K60FN\network_car\Board\src\VCAN_UI_VAR.c
//    1 #include "common.h"
//    2 #include "VCAN_LCD.h"
//    3 #include "VCAN_UI_VAR.h"
//    4 #include "VCAN_NRF24L0_MSG.h"
//    5 
//    6 
//    7 
//    8 #define VAR_VALUE(var_tab)      num_info[var_tab].val       //指定标号的变量的值
//    9 #define VAR_OLDVALUE(var_tab)   num_info[var_tab].oldval    //指定标号的变量的最后确认值
//   10 #define VAR_MAXVALUE(var_tab)   num_info[var_tab].maxval
//   11 #define VAR_MINVALUE(var_tab)   num_info[var_tab].minval
//   12 #define VAR_SITE(var_tab)       num_info[var_tab].site
//   13 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   14 static uint8  car_ctrl = CAR_NULL;
car_ctrl:
        DS8 1
//   15 
//   16 extern uint8  var1, var2;
//   17 extern uint16 var3, var4;
//   18 extern uint32 var5, var6;
//   19 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   20 uint32 *var_addr[VAR_MAX] = {(uint32 *)&car_ctrl,(uint32 *)&var1, (uint32 *)&var2, (uint32 *)&var3, (uint32 *)&var4, (uint32 *)&var5, (uint32 *)&var6};
var_addr:
        DATA
        DC32 car_ctrl, var1, var2, var3, var4, var5, var6
//   21 
//   22 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   23 ui_var_info_t  num_info[VAR_MAX] =
num_info:
        DATA
        DC32 0, 0, 0, 11
        DC16 90, 102
        DC32 0, 0, 0, 100
        DC16 90, 0
        DC32 0, 0, 0, 100
        DC16 90, 17
        DC32 0, 0, 0, 300
        DC16 90, 34
        DC32 0, 0, 0, 300
        DC16 90, 51
        DC32 0, 0, 0, 65540
        DC16 90, 68
        DC32 0, 0, 0, 65540
        DC16 90, 85
//   24 {
//   25     //  {val,oldval,minval,maxval,{x,y}}
//   26     //val,oldval,会在调用key_event_init的时候从其对应变量里赋值过来，所以这里的值可以随意写
//   27     //需要设置minval,maxval,{x,y}
//   28     //务必注意最小值不要大于最大值
//   29     {0, 0, 0, CAR_CTRL_MAX, {90,102}},      //变量 car_ctrl，
//   30     {0, 0, 0, 100, {90, 0}},                //变量 var1，
//   31     {0, 0, 0, 100, {90, 17}},               //变量 var2，
//   32     {0, 0, 0, 300, {90, 34}},               //变量 var3，
//   33     {0, 0, 0, 300, {90, 51}},               //变量 var4，
//   34     {0, 0, 0, 65540, {90, 68}},             //变量 var5，
//   35     {0, 0, 0, 65540, {90, 85}}              //变量 var6，
//   36 };
//   37 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   38 uint8   new_tab = 0;        //当前选择的变量编号
new_tab:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   39 uint32  last_tab;           //最后接收到的变量编号
last_tab:
        DS8 4
//   40 
//   41 
//   42 
//   43 //同步指定的值。tab 为 VAR_NUM 时表示全部同步，小于则同步对应的
//   44 //必须先同步再显示全部，因为有可能同步失败。
//   45 //static uint8 var_syn(uint8 tab);         //同步数据，1表示成功，0表示失败
//   46 
//   47 void save_var2buff(var_tab_e var_num, uint8 *sendbuf);              //把需要发送的变量的数据写入到缓冲区
//   48 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function var_init
        THUMB
//   49 void var_init()
//   50 {
var_init:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
//   51     uint8   var_num;
//   52     uint32  vartemp;
//   53 
//   54     for(var_num = 0; var_num < VAR_MAX; var_num++)
        MOVS     R0,#+0
        MOVS     R4,R0
??var_init_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+7
        BGE.N    ??var_init_1
//   55     {
//   56         get_var((var_tab_e)var_num, &vartemp);
        ADD      R1,SP,#+0
        MOVS     R0,R4
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
          CFI FunCall get_var
        BL       get_var
//   57         num_info[var_num].val       = vartemp;
        LDR      R0,[SP, #+0]
        LDR.W    R1,??DataTable11
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R2,#+20
        MLA      R1,R2,R4,R1
        STR      R0,[R1, #+0]
//   58         num_info[var_num].oldval    = vartemp;
        LDR      R0,[SP, #+0]
        LDR.W    R1,??DataTable11
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R2,#+20
        MLA      R1,R2,R4,R1
        STR      R0,[R1, #+4]
//   59 
//   60         //检测最小值与最大值
//   61         ASSERT(num_info[var_num].maxval  >=  num_info[var_num].minval );
        LDR.W    R0,??DataTable11
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+20
        MLA      R0,R1,R4,R0
        LDR      R0,[R0, #+12]
        LDR.W    R1,??DataTable11
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R2,#+20
        MLA      R1,R2,R4,R1
        LDR      R1,[R1, #+8]
        CMP      R0,R1
        BCS.N    ??var_init_2
        MOVS     R1,#+61
        LDR.W    R0,??DataTable11_1
          CFI FunCall assert_failed
        BL       assert_failed
//   62     }
??var_init_2:
        ADDS     R4,R4,#+1
        B.N      ??var_init_0
//   63 }
??var_init_1:
        POP      {R0,R1,R4,PC}    ;; return
          CFI EndBlock cfiBlock0
//   64 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function save_var
          CFI NoCalls
        THUMB
//   65 void save_var(var_tab_e var_tal, uint32 var_data)
//   66 {
//   67     if(var_tal <= VAR_8BIT)
save_var:
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        CMP      R0,#+3
        BGE.N    ??save_var_0
//   68     {
//   69         *((uint8 *)(var_addr[var_tal])) = var_data;
        LDR.W    R2,??DataTable11_2
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        LDR      R2,[R2, R0, LSL #+2]
        STRB     R1,[R2, #+0]
        B.N      ??save_var_1
//   70     }
//   71     else if(var_tal <= VAR_16BIT)
??save_var_0:
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        CMP      R0,#+5
        BGE.N    ??save_var_2
//   72     {
//   73         *((uint16 *)(var_addr[var_tal])) = var_data;
        LDR.W    R2,??DataTable11_2
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        LDR      R2,[R2, R0, LSL #+2]
        STRH     R1,[R2, #+0]
        B.N      ??save_var_1
//   74     }
//   75     else if(var_tal <= VAR_32BIT)
??save_var_2:
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        CMP      R0,#+7
        BGE.N    ??save_var_1
//   76     {
//   77         *((uint32 *)(var_addr[var_tal])) = var_data;
        LDR.W    R2,??DataTable11_2
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        LDR      R2,[R2, R0, LSL #+2]
        STR      R1,[R2, #+0]
//   78     }
//   79 
//   80     VAR_VALUE(var_tal) = var_data;
??save_var_1:
        LDR.W    R2,??DataTable11
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        MOVS     R3,#+20
        SMLABB   R2,R0,R3,R2
        STR      R1,[R2, #+0]
//   81     VAR_OLDVALUE(var_tal) = var_data;
        LDR.W    R2,??DataTable11
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        MOVS     R3,#+20
        SMLABB   R2,R0,R3,R2
        STR      R1,[R2, #+4]
//   82 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock1
//   83 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function get_var
          CFI NoCalls
        THUMB
//   84 void get_var(var_tab_e var_tal, uint32 *var_data)
//   85 {
//   86     if(var_tal <= VAR_8BIT)
get_var:
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        CMP      R0,#+3
        BGE.N    ??get_var_0
//   87     {
//   88         *var_data = (uint32) * ((uint8 *)(var_addr[var_tal]));
        LDR.W    R2,??DataTable11_2
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        LDR      R2,[R2, R0, LSL #+2]
        LDRB     R2,[R2, #+0]
        STR      R2,[R1, #+0]
        B.N      ??get_var_1
//   89     }
//   90     else if(var_tal <= VAR_16BIT)
??get_var_0:
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        CMP      R0,#+5
        BGE.N    ??get_var_2
//   91     {
//   92         *var_data = (uint32) * ((uint16 *)(var_addr[var_tal])) ;
        LDR.W    R2,??DataTable11_2
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        LDR      R2,[R2, R0, LSL #+2]
        LDRH     R2,[R2, #+0]
        STR      R2,[R1, #+0]
        B.N      ??get_var_1
//   93     }
//   94     else if(var_tal <= VAR_32BIT)
??get_var_2:
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        CMP      R0,#+7
        BGE.N    ??get_var_1
//   95     {
//   96         *var_data = (uint32) * ((uint32 *)(var_addr[var_tal]));
        LDR.W    R2,??DataTable11_2
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        LDR      R2,[R2, R0, LSL #+2]
        LDR      R2,[R2, #+0]
        STR      R2,[R1, #+0]
//   97     }
//   98 }
??get_var_1:
        BX       LR               ;; return
          CFI EndBlock cfiBlock2
//   99 
//  100 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function updata_var
        THUMB
//  101 void updata_var(var_tab_e var_tal)
//  102 {
updata_var:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
        MOVS     R4,R0
//  103     uint32 vartemp;
//  104 
//  105     get_var(var_tal, &vartemp);
        ADD      R1,SP,#+0
        MOVS     R0,R4
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
          CFI FunCall get_var
        BL       get_var
//  106 
//  107     VAR_VALUE(var_tal) = vartemp;
        LDR      R0,[SP, #+0]
        LDR.W    R1,??DataTable11
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        MOVS     R2,#+20
        SMLABB   R1,R4,R2,R1
        STR      R0,[R1, #+0]
//  108 }
        POP      {R0,R1,R4,PC}    ;; return
          CFI EndBlock cfiBlock3
//  109 
//  110 //对变量的加减进行处理

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function var_value
        THUMB
//  111 void var_value(ui_var_event_e ctrl)
//  112 {
var_value:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//  113     ASSERT(new_tab < VAR_MAX);
        LDR.W    R0,??DataTable11_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+7
        BLT.N    ??var_value_0
        MOVS     R1,#+113
        LDR.W    R0,??DataTable11_1
          CFI FunCall assert_failed
        BL       assert_failed
//  114 
//  115 
//  116     //修改当前变量的值
//  117     switch(ctrl)
??var_value_0:
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+4
        BEQ.N    ??var_value_1
        BCC.W    ??var_value_2
        CMP      R4,#+6
        BEQ.N    ??var_value_3
        BCC.N    ??var_value_4
        CMP      R4,#+7
        BEQ.W    ??var_value_5
        B.N      ??var_value_2
//  118     {
//  119     case VAR_ADD:
//  120         if(VAR_VALUE(new_tab) < VAR_MAXVALUE(new_tab))
??var_value_1:
        LDR.W    R0,??DataTable11
        LDR.W    R1,??DataTable11_3
        LDRB     R1,[R1, #+0]
        MOVS     R2,#+20
        MLA      R0,R2,R1,R0
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable11
        LDR.W    R2,??DataTable11_3
        LDRB     R2,[R2, #+0]
        MOVS     R3,#+20
        MLA      R1,R3,R2,R1
        LDR      R1,[R1, #+12]
        CMP      R0,R1
        BCS.N    ??var_value_6
//  121         {
//  122             VAR_VALUE(new_tab)++;
        LDR.W    R0,??DataTable11
        LDR.W    R1,??DataTable11_3
        LDRB     R1,[R1, #+0]
        MOVS     R2,#+20
        MLA      R0,R2,R1,R0
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.W    R1,??DataTable11
        LDR.W    R2,??DataTable11_3
        LDRB     R2,[R2, #+0]
        MOVS     R3,#+20
        MLA      R1,R3,R2,R1
        STR      R0,[R1, #+0]
        B.N      ??var_value_7
//  123         }
//  124         else
//  125         {
//  126             VAR_VALUE(new_tab) = VAR_MINVALUE(new_tab);
??var_value_6:
        LDR.W    R0,??DataTable11
        LDR.W    R1,??DataTable11_3
        LDRB     R1,[R1, #+0]
        MOVS     R2,#+20
        MLA      R0,R2,R1,R0
        LDR      R0,[R0, #+8]
        LDR.W    R1,??DataTable11
        LDR.W    R2,??DataTable11_3
        LDRB     R2,[R2, #+0]
        MOVS     R3,#+20
        MLA      R1,R3,R2,R1
        STR      R0,[R1, #+0]
//  127         }
//  128         break;
??var_value_7:
        B.N      ??var_value_8
//  129 
//  130     case VAR_SUB:
//  131         if(VAR_VALUE(new_tab) > VAR_MINVALUE(new_tab))
??var_value_4:
        LDR.W    R0,??DataTable11
        LDR.W    R1,??DataTable11_3
        LDRB     R1,[R1, #+0]
        MOVS     R2,#+20
        MLA      R0,R2,R1,R0
        LDR      R0,[R0, #+8]
        LDR.W    R1,??DataTable11
        LDR.W    R2,??DataTable11_3
        LDRB     R2,[R2, #+0]
        MOVS     R3,#+20
        MLA      R1,R3,R2,R1
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BCS.N    ??var_value_9
//  132         {
//  133             VAR_VALUE(new_tab)--;
        LDR.W    R0,??DataTable11
        LDR.W    R1,??DataTable11_3
        LDRB     R1,[R1, #+0]
        MOVS     R2,#+20
        MLA      R0,R2,R1,R0
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.W    R1,??DataTable11
        LDR.W    R2,??DataTable11_3
        LDRB     R2,[R2, #+0]
        MOVS     R3,#+20
        MLA      R1,R3,R2,R1
        STR      R0,[R1, #+0]
        B.N      ??var_value_10
//  134         }
//  135         else
//  136         {
//  137             VAR_VALUE(new_tab) = VAR_MAXVALUE(new_tab) ;//最小值减一为最大值
??var_value_9:
        LDR.W    R0,??DataTable11
        LDR.W    R1,??DataTable11_3
        LDRB     R1,[R1, #+0]
        MOVS     R2,#+20
        MLA      R0,R2,R1,R0
        LDR      R0,[R0, #+12]
        LDR.W    R1,??DataTable11
        LDR.W    R2,??DataTable11_3
        LDRB     R2,[R2, #+0]
        MOVS     R3,#+20
        MLA      R1,R3,R2,R1
        STR      R0,[R1, #+0]
//  138         }
//  139         break;
??var_value_10:
        B.N      ??var_value_8
//  140 
//  141     case VAR_ADD_HOLD:
//  142         if(   (VAR_MAXVALUE(new_tab) - VAR_VALUE(new_tab))  >  VAR_VALUE_HOLE_OFFSET )
??var_value_3:
        LDR.W    R0,??DataTable11
        LDR.W    R1,??DataTable11_3
        LDRB     R1,[R1, #+0]
        MOVS     R2,#+20
        MLA      R0,R2,R1,R0
        LDR      R0,[R0, #+12]
        LDR.W    R1,??DataTable11
        LDR.W    R2,??DataTable11_3
        LDRB     R2,[R2, #+0]
        MOVS     R3,#+20
        MLA      R1,R3,R2,R1
        LDR      R1,[R1, #+0]
        SUBS     R0,R0,R1
        CMP      R0,#+11
        BCC.N    ??var_value_11
//  143         {
//  144             VAR_VALUE(new_tab) += VAR_VALUE_HOLE_OFFSET;
        LDR.W    R0,??DataTable11
        LDR.W    R1,??DataTable11_3
        LDRB     R1,[R1, #+0]
        MOVS     R2,#+20
        MLA      R0,R2,R1,R0
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+10
        LDR.W    R1,??DataTable11
        LDR.W    R2,??DataTable11_3
        LDRB     R2,[R2, #+0]
        MOVS     R3,#+20
        MLA      R1,R3,R2,R1
        STR      R0,[R1, #+0]
        B.N      ??var_value_12
//  145         }
//  146         else
//  147         {
//  148             VAR_VALUE(new_tab) = VAR_MINVALUE(new_tab);
??var_value_11:
        LDR.W    R0,??DataTable11
        LDR.W    R1,??DataTable11_3
        LDRB     R1,[R1, #+0]
        MOVS     R2,#+20
        MLA      R0,R2,R1,R0
        LDR      R0,[R0, #+8]
        LDR.W    R1,??DataTable11
        LDR.W    R2,??DataTable11_3
        LDRB     R2,[R2, #+0]
        MOVS     R3,#+20
        MLA      R1,R3,R2,R1
        STR      R0,[R1, #+0]
//  149         }
//  150         break;
??var_value_12:
        B.N      ??var_value_8
//  151 
//  152     case VAR_SUB_HOLD:
//  153         if( ( VAR_VALUE(new_tab) - VAR_MINVALUE(new_tab)) > VAR_VALUE_HOLE_OFFSET  )
??var_value_5:
        LDR.W    R0,??DataTable11
        LDR.W    R1,??DataTable11_3
        LDRB     R1,[R1, #+0]
        MOVS     R2,#+20
        MLA      R0,R2,R1,R0
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable11
        LDR.W    R2,??DataTable11_3
        LDRB     R2,[R2, #+0]
        MOVS     R3,#+20
        MLA      R1,R3,R2,R1
        LDR      R1,[R1, #+8]
        SUBS     R0,R0,R1
        CMP      R0,#+11
        BCC.N    ??var_value_13
//  154         {
//  155             VAR_VALUE(new_tab) -= VAR_VALUE_HOLE_OFFSET;
        LDR.W    R0,??DataTable11
        LDR.W    R1,??DataTable11_3
        LDRB     R1,[R1, #+0]
        MOVS     R2,#+20
        MLA      R0,R2,R1,R0
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+10
        LDR.N    R1,??DataTable11
        LDR.N    R2,??DataTable11_3
        LDRB     R2,[R2, #+0]
        MOVS     R3,#+20
        MLA      R1,R3,R2,R1
        STR      R0,[R1, #+0]
        B.N      ??var_value_14
//  156         }
//  157         else
//  158         {
//  159             VAR_VALUE(new_tab) = VAR_MAXVALUE(new_tab) ;//最小值减一为最大值
??var_value_13:
        LDR.N    R0,??DataTable11
        LDR.N    R1,??DataTable11_3
        LDRB     R1,[R1, #+0]
        MOVS     R2,#+20
        MLA      R0,R2,R1,R0
        LDR      R0,[R0, #+12]
        LDR.N    R1,??DataTable11
        LDR.N    R2,??DataTable11_3
        LDRB     R2,[R2, #+0]
        MOVS     R3,#+20
        MLA      R1,R3,R2,R1
        STR      R0,[R1, #+0]
//  160         }
//  161         break;
??var_value_14:
        B.N      ??var_value_8
//  162 
//  163     default:                        //无效选择，不需要切换
//  164         break;
//  165     }
//  166 
//  167     var_display(new_tab);
??var_value_2:
??var_value_8:
        LDR.N    R0,??DataTable11_3
        LDRB     R0,[R0, #+0]
          CFI FunCall var_display
        BL       var_display
//  168 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock4
//  169 
//  170 //对变量进行选择

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function var_select
        THUMB
//  171 void var_select(ui_var_event_e  ctrl)
//  172 {
var_select:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
//  173     ASSERT(new_tab < VAR_MAX);
        LDR.N    R0,??DataTable11_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+7
        BLT.N    ??var_select_0
        MOVS     R1,#+173
        LDR.N    R0,??DataTable11_1
          CFI FunCall assert_failed
        BL       assert_failed
//  174 
//  175     uint8 old_tab = new_tab;       //先备份当前变量标号
??var_select_0:
        LDR.N    R0,??DataTable11_3
        LDRB     R5,[R0, #+0]
//  176 
//  177     //切换到下一个变量
//  178     switch(ctrl)
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??var_select_1
        CMP      R4,#+2
        BEQ.N    ??var_select_2
        BCC.N    ??var_select_3
        CMP      R4,#+3
        BEQ.N    ??var_select_4
        B.N      ??var_select_5
//  179     {
//  180     case VAR_NEXT:                      //下一个
//  181         new_tab++;
??var_select_1:
        LDR.N    R0,??DataTable11_3
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable11_3
        STRB     R0,[R1, #+0]
//  182         if(new_tab >= (VAR_MAX) )
        LDR.N    R0,??DataTable11_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+7
        BLT.N    ??var_select_6
//  183         {
//  184             new_tab = 0;               //从头开始
        MOVS     R0,#+0
        LDR.N    R1,??DataTable11_3
        STRB     R0,[R1, #+0]
//  185         }
//  186         break;
??var_select_6:
        B.N      ??var_select_7
//  187 
//  188     case VAR_PREV:                      //上一个
//  189         new_tab--;
??var_select_3:
        LDR.N    R0,??DataTable11_3
        LDRB     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable11_3
        STRB     R0,[R1, #+0]
//  190         if(new_tab >= (VAR_MAX) )
        LDR.N    R0,??DataTable11_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+7
        BLT.N    ??var_select_8
//  191         {
//  192             new_tab = VAR_MAX - 1;     //从尾开始
        MOVS     R0,#+6
        LDR.N    R1,??DataTable11_3
        STRB     R0,[R1, #+0]
//  193         }
//  194         break;
??var_select_8:
        B.N      ??var_select_7
//  195 
//  196     case VAR_NEXT_HOLD:                 //快下
//  197         new_tab += VAR_SELECT_HOLD_OFFSET;
??var_select_2:
        LDR.N    R0,??DataTable11_3
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+2
        LDR.N    R1,??DataTable11_3
        STRB     R0,[R1, #+0]
//  198         if(new_tab >= (VAR_MAX) )
        LDR.N    R0,??DataTable11_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+7
        BLT.N    ??var_select_9
//  199         {
//  200             new_tab = 0;               //从头开始
        MOVS     R0,#+0
        LDR.N    R1,??DataTable11_3
        STRB     R0,[R1, #+0]
//  201         }
//  202         break;
??var_select_9:
        B.N      ??var_select_7
//  203 
//  204     case VAR_PREV_HOLD:                 //快上
//  205         new_tab -= VAR_SELECT_HOLD_OFFSET;
??var_select_4:
        LDR.N    R0,??DataTable11_3
        LDRB     R0,[R0, #+0]
        SUBS     R0,R0,#+2
        LDR.N    R1,??DataTable11_3
        STRB     R0,[R1, #+0]
//  206         if(new_tab >= (VAR_MAX) )
        LDR.N    R0,??DataTable11_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+7
        BLT.N    ??var_select_10
//  207         {
//  208             new_tab = VAR_MAX - 1;     //从尾开始
        MOVS     R0,#+6
        LDR.N    R1,??DataTable11_3
        STRB     R0,[R1, #+0]
//  209         }
//  210         break;
??var_select_10:
        B.N      ??var_select_7
//  211 
//  212     default:                        //无效选择，不需要切换
//  213         return;
??var_select_5:
        B.N      ??var_select_11
//  214     }
//  215 
//  216     var_display(old_tab);               //处理上一个变量
??var_select_7:
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
          CFI FunCall var_display
        BL       var_display
//  217 
//  218     var_display(new_tab);              //处理当前变量：
        LDR.N    R0,??DataTable11_3
        LDRB     R0,[R0, #+0]
          CFI FunCall var_display
        BL       var_display
//  219 
//  220 }
??var_select_11:
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock5
//  221 
//  222 
//  223 //确认当前选择的

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function var_ok
        THUMB
//  224 void var_ok()
//  225 {
var_ok:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  226     ASSERT(new_tab < VAR_MAX);
        LDR.N    R0,??DataTable11_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+7
        BLT.N    ??var_ok_0
        MOVS     R1,#+226
        LDR.N    R0,??DataTable11_1
          CFI FunCall assert_failed
        BL       assert_failed
//  227 
//  228     //比较是否有改变值
//  229     if(VAR_VALUE(new_tab) != VAR_OLDVALUE(new_tab))   //值改变了，则需要处理
??var_ok_0:
        LDR.N    R0,??DataTable11
        LDR.N    R1,??DataTable11_3
        LDRB     R1,[R1, #+0]
        MOVS     R2,#+20
        MLA      R0,R2,R1,R0
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable11
        LDR.N    R2,??DataTable11_3
        LDRB     R2,[R2, #+0]
        MOVS     R3,#+20
        MLA      R1,R3,R2,R1
        LDR      R1,[R1, #+4]
        CMP      R0,R1
        BEQ.N    ??var_ok_1
//  230     {
//  231         var_syn(new_tab);          //同步新的值
        LDR.N    R0,??DataTable11_3
        LDRB     R0,[R0, #+0]
          CFI FunCall var_syn
        BL       var_syn
//  232     }
//  233 
//  234     var_display(new_tab);
??var_ok_1:
        LDR.N    R0,??DataTable11_3
        LDRB     R0,[R0, #+0]
          CFI FunCall var_display
        BL       var_display
//  235 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock6
//  236 
//  237 //取消当前选择的值  OK

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function val_cancel
        THUMB
//  238 void val_cancel()
//  239 {
val_cancel:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  240     ASSERT(new_tab < VAR_MAX);
        LDR.N    R0,??DataTable11_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+7
        BLT.N    ??val_cancel_0
        MOVS     R1,#+240
        LDR.N    R0,??DataTable11_1
          CFI FunCall assert_failed
        BL       assert_failed
//  241 
//  242     //直接还原当前值
//  243     VAR_VALUE(new_tab) = VAR_OLDVALUE(new_tab);
??val_cancel_0:
        LDR.N    R0,??DataTable11
        LDR.N    R1,??DataTable11_3
        LDRB     R1,[R1, #+0]
        MOVS     R2,#+20
        MLA      R0,R2,R1,R0
        LDR      R0,[R0, #+4]
        LDR.N    R1,??DataTable11
        LDR.N    R2,??DataTable11_3
        LDRB     R2,[R2, #+0]
        MOVS     R3,#+20
        MLA      R1,R3,R2,R1
        STR      R0,[R1, #+0]
//  244 
//  245     var_display(new_tab);
        LDR.N    R0,??DataTable11_3
        LDRB     R0,[R0, #+0]
          CFI FunCall var_display
        BL       var_display
//  246 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock7
//  247 
//  248 
//  249 
//  250 //显示指定的值。tab 为 VAR_MAX 时表示全部显示，小于则显示对应的
//  251 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function var_display
        THUMB
//  252 void var_display(uint8 tab)
//  253 {
var_display:
        PUSH     {R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+20
        SUB      SP,SP,#+12
          CFI CFA R13+32
        MOVS     R4,R0
//  254 #if UI_VAR_USE_LCD
//  255 
//  256     //定义背景延时
//  257 #define SELECT_NO_CHANGE_BG         WHITE   //当前选中，而且没有改变
//  258 #define SELECT_CHANGE_BG            WHITE   //当前选中，而且改变了
//  259 #define NO_SELECT_NO_CHANGE_BG      RED     //没有选中，而且没有改变（普通的就是这样）
//  260 #define NO_SELECT_CHANGE_BG         RED     //没有选中，而且改变了
//  261 
//  262     //定义文字颜色
//  263 #define SELECT_NO_CHANGE            BLUE    //当前选中，而且没有改变
//  264 #define SELECT_CHANGE               GREEN   //当前选中，而且改变了
//  265 #define NO_SELECT_NO_CHANGE         BLUE    //没有选中，而且没有改变（普通的就是这样）
//  266 #define NO_SELECT_CHANGE            GREEN   //没有选中，而且改变了
//  267 
//  268     uint8  i = 0;
        MOVS     R5,#+0
//  269     uint16 bkColor;
//  270     uint16 Color;
//  271 
//  272     ASSERT((new_tab < VAR_MAX) && (tab <= VAR_MAX));
        LDR.N    R0,??DataTable11_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+7
        BGE.N    ??var_display_0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+8
        BLT.N    ??var_display_1
??var_display_0:
        MOV      R1,#+272
        LDR.N    R0,??DataTable11_1
          CFI FunCall assert_failed
        BL       assert_failed
//  273 
//  274     if(tab == VAR_MAX)      //显示全部
??var_display_1:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+7
        BNE.N    ??var_display_2
//  275     {
//  276         i = VAR_MAX - 1;    //循环的次数
        MOVS     R0,#+6
        MOVS     R5,R0
//  277         tab = 0;
        MOVS     R0,#+0
        MOVS     R4,R0
//  278     }
//  279 
//  280     do
//  281     {
//  282         if(tab == new_tab)
??var_display_2:
        LDR.N    R0,??DataTable11_3
        LDRB     R0,[R0, #+0]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,R0
        BNE.N    ??var_display_3
//  283         {
//  284             //显示当前的值：判断值是否改变
//  285             if(VAR_VALUE(tab) == VAR_OLDVALUE(tab)) //值没改变，不需要处理
        LDR.N    R0,??DataTable11
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+20
        MLA      R0,R1,R4,R0
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable11
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R2,#+20
        MLA      R1,R2,R4,R1
        LDR      R1,[R1, #+4]
        CMP      R0,R1
        BNE.N    ??var_display_4
//  286             {
//  287                 Color   =  SELECT_NO_CHANGE;
        MOVS     R0,#+31
        MOVS     R7,R0
//  288                 bkColor =  SELECT_NO_CHANGE_BG;
        MOVW     R0,#+65535
        MOVS     R6,R0
        B.N      ??var_display_5
//  289             }
//  290             else
//  291             {
//  292                 Color   =  SELECT_CHANGE;
??var_display_4:
        MOV      R0,#+2016
        MOVS     R7,R0
//  293                 bkColor =  SELECT_CHANGE_BG;
        MOVW     R0,#+65535
        MOVS     R6,R0
        B.N      ??var_display_5
//  294             }
//  295         }
//  296         else
//  297         {
//  298             //显示非当前的值
//  299             if(VAR_VALUE(tab) == VAR_OLDVALUE(tab)) //值没改变，不需要处理
??var_display_3:
        LDR.N    R0,??DataTable11
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+20
        MLA      R0,R1,R4,R0
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable11
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R2,#+20
        MLA      R1,R2,R4,R1
        LDR      R1,[R1, #+4]
        CMP      R0,R1
        BNE.N    ??var_display_6
//  300             {
//  301                 Color   =  NO_SELECT_NO_CHANGE;
        MOVS     R0,#+31
        MOVS     R7,R0
//  302                 bkColor =  NO_SELECT_NO_CHANGE_BG;
        MOV      R0,#+63488
        MOVS     R6,R0
        B.N      ??var_display_5
//  303 
//  304             }
//  305             else
//  306             {
//  307                 Color   =  NO_SELECT_CHANGE;
??var_display_6:
        MOV      R0,#+2016
        MOVS     R7,R0
//  308                 bkColor =  NO_SELECT_CHANGE_BG;
        MOV      R0,#+63488
        MOVS     R6,R0
??var_display_5:
        LDR.N    R0,??DataTable11
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+20
        MLA      R0,R1,R4,R0
        LDR      R0,[R0, #+16]
        STR      R0,[SP, #+4]
//  309             }
//  310         }
//  311 
//  312         //显示文字
//  313         LCD_num_C(VAR_SITE(tab), VAR_VALUE(tab), Color, bkColor);
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        STR      R6,[SP, #+0]
        MOVS     R3,R7
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        MOVS     R2,#+5
        LDR.N    R0,??DataTable11
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+20
        MLA      R0,R1,R4,R0
        LDR      R1,[R0, #+0]
        LDR      R0,[SP, #+4]
          CFI FunCall LCD_num_BC
        BL       LCD_num_BC
//  314 
//  315         tab++;
        ADDS     R4,R4,#+1
//  316     }
//  317     while(i--);         //tab != VAR_MAX 的时候，执行一次就跳出
        MOVS     R0,R5
        SUBS     R5,R0,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??var_display_2
//  318 #else
//  319     tab = tab;          //消除编译警告
//  320 #endif
//  321 }
        POP      {R0-R2,R4-R7,PC}  ;; return
          CFI EndBlock cfiBlock8
//  322 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function save_var2buff
        THUMB
//  323 void save_var2buff(var_tab_e var_num, uint8 *sendbuf)
//  324 {
save_var2buff:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
//  325     uint32 temp;
//  326     get_var(var_num, &temp);
        ADD      R1,SP,#+0
        MOVS     R0,R4
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
          CFI FunCall get_var
        BL       get_var
//  327     *((uint32 *)&sendbuf[COM_LEN]) = (uint32)var_num;
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        STR      R4,[R5, #+2]
//  328     *((uint32 *)&sendbuf[COM_LEN + sizeof(uint32)]) = temp;
        LDR      R0,[SP, #+0]
        STR      R0,[R5, #+6]
//  329 }
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock9
//  330 
//  331 //同步指定的值。tab 为 VAR_MAX 时表示全部同步，小于则同步对应的

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function var_syn
        THUMB
//  332 uint8 var_syn(uint8 tab)
//  333 {
var_syn:
        PUSH     {R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
        SUB      SP,SP,#+32
          CFI CFA R13+48
        MOVS     R4,R0
//  334     ASSERT((new_tab < VAR_MAX) && (tab <= VAR_MAX));
        LDR.N    R0,??DataTable11_3
        LDRB     R0,[R0, #+0]
        CMP      R0,#+7
        BGE.N    ??var_syn_0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+8
        BLT.N    ??var_syn_1
??var_syn_0:
        MOV      R1,#+334
        LDR.N    R0,??DataTable11_1
          CFI FunCall assert_failed
        BL       assert_failed
//  335 
//  336     uint8  i = 0;
??var_syn_1:
        MOVS     R5,#+0
//  337     uint8 tempbuff[DATA_PACKET];
//  338     uint32 oldvalue;
//  339 
//  340     if(tab == VAR_MAX)
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+7
        BNE.N    ??var_syn_2
//  341     {
//  342         i = VAR_MAX - 1;
        MOVS     R0,#+6
        MOVS     R5,R0
//  343         tab = 0;
        MOVS     R0,#+0
        MOVS     R4,R0
//  344     }
//  345 
//  346     do
//  347     {
//  348         oldvalue = VAR_OLDVALUE(tab);                   //备份旧的值
??var_syn_2:
        LDR.N    R0,??DataTable11
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+20
        MLA      R0,R1,R4,R0
        LDR      R0,[R0, #+4]
        MOVS     R6,R0
//  349 
//  350         //把值复制到对应的变量
//  351         save_var((var_tab_e)tab, VAR_VALUE(tab));
        LDR.N    R0,??DataTable11
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+20
        MLA      R0,R1,R4,R0
        LDR      R1,[R0, #+0]
        MOVS     R0,R4
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
          CFI FunCall save_var
        BL       save_var
//  352 
//  353         //发送新的值
//  354         save_var2buff((var_tab_e)tab, tempbuff);        //把变量写进 tempbuff 里
        ADD      R1,SP,#+0
        MOVS     R0,R4
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
          CFI FunCall save_var2buff
        BL       save_var2buff
//  355         nrf_msg_tx(COM_VAR, tempbuff);                //发送数据
        ADD      R1,SP,#+0
        MOVS     R0,#+2
          CFI FunCall nrf_msg_tx
        BL       nrf_msg_tx
//  356 
//  357         while(nrf_tx_state() == NRF_TXING);             //等待发送完成
??var_syn_3:
          CFI FunCall nrf_tx_state
        BL       nrf_tx_state
        CMP      R0,#+0
        BEQ.N    ??var_syn_3
//  358 
//  359         if(NRF_TX_ERROR == nrf_tx_state())             //发送失败
          CFI FunCall nrf_tx_state
        BL       nrf_tx_state
        CMP      R0,#+1
        BNE.N    ??var_syn_4
//  360         {
//  361             VAR_OLDVALUE(tab) = oldvalue;               //还原旧的值
        LDR.N    R0,??DataTable11
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+20
        MLA      R0,R1,R4,R0
        STR      R6,[R0, #+4]
//  362 
//  363             //放弃同步
//  364             return 0;
        MOVS     R0,#+0
        B.N      ??var_syn_5
//  365         }
//  366         tab++;
??var_syn_4:
        ADDS     R4,R4,#+1
//  367     }
//  368     while(i--);
        MOVS     R0,R5
        SUBS     R5,R0,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??var_syn_2
//  369 
//  370     return 1;
        MOVS     R0,#+1
??var_syn_5:
        ADD      SP,SP,#+32
          CFI CFA R13+16
        POP      {R4-R6,PC}       ;; return
          CFI EndBlock cfiBlock10
//  371 }
//  372 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function car_ctrl_get
          CFI NoCalls
        THUMB
//  373 uint8    car_ctrl_get()
//  374 {
//  375     return  car_ctrl;
car_ctrl_get:
        LDR.N    R0,??DataTable11_4
        LDRB     R0,[R0, #+0]
        BX       LR               ;; return
          CFI EndBlock cfiBlock11
//  376 }
//  377 
//  378 
//  379 //车状态控制

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function car_ctrl_syn
        THUMB
//  380 uint8 car_ctrl_syn(CAR_CTRL_MODE_e mode)
//  381 {
car_ctrl_syn:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
//  382     uint8 ret;
//  383     ASSERT(mode < CAR_CTRL_MAX);
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+11
        BLT.N    ??car_ctrl_syn_0
        MOVW     R1,#+383
        LDR.N    R0,??DataTable11_1
          CFI FunCall assert_failed
        BL       assert_failed
//  384 
//  385     VAR_VALUE(CAR_CTRL) =  mode;
??car_ctrl_syn_0:
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDR.N    R0,??DataTable11
        STR      R4,[R0, #+0]
//  386 
//  387     ret =  var_syn(CAR_CTRL);
        MOVS     R0,#+0
          CFI FunCall var_syn
        BL       var_syn
        MOVS     R5,R0
//  388 
//  389     var_display(CAR_CTRL);
        MOVS     R0,#+0
          CFI FunCall var_display
        BL       var_display
//  390 
//  391     return ret;
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock12
//  392 };

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11:
        DC32     num_info

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_1:
        DC32     ?_0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_2:
        DC32     var_addr

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_3:
        DC32     new_tab

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_4:
        DC32     car_ctrl

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
        DC8 5CH, 42H, 6FH, 61H, 72H, 64H, 5CH, 73H
        DC8 72H, 63H, 5CH, 56H, 43H, 41H, 4EH, 5FH
        DC8 55H, 49H, 5FH, 56H, 41H, 52H, 2EH, 63H
        DC8 0
        DC8 0, 0, 0

        END
//  393 
//  394 
//  395 
// 
//     6 bytes in section .bss
//   168 bytes in section .data
//    60 bytes in section .rodata
// 1 572 bytes in section .text
// 
// 1 572 bytes of CODE  memory
//    60 bytes of CONST memory
//   174 bytes of DATA  memory
//
//Errors: none
//Warnings: none
