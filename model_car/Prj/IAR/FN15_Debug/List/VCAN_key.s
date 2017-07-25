///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       21/Mar/2017  16:05:26
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\znc\project\K60FN\network_car\Board\src\VCAN_key.c
//    Command line =  
//        E:\znc\project\K60FN\network_car\Board\src\VCAN_key.c -D DEBUG -D
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
//        E:\znc\project\K60FN\network_car\Prj\IAR\FN15_Debug\List\VCAN_key.s
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

        PUBLIC KEY_PTxn
        PUBLIC get_key_msg
        PUBLIC key_IRQHandler
        PUBLIC key_check
        PUBLIC key_get
        PUBLIC key_init
        PUBLIC key_msg
        PUBLIC key_msg_flag
        PUBLIC key_msg_front
        PUBLIC key_msg_rear
        PUBLIC send_key_msg
        
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
        
// E:\znc\project\K60FN\network_car\Board\src\VCAN_key.c
//    1 /*!
//    2  *     COPYRIGHT NOTICE
//    3  *     Copyright (c) 2013,山外科技
//    4  *     All rights reserved.
//    5  *     技术讨论：山外论坛 http://www.vcan123.com
//    6  *
//    7  *     除注明出处外，以下所有内容版权均属山外科技所有，未经允许，不得用于商业用途，
//    8  *     修改内容时必须保留山外科技的版权声明。
//    9  *
//   10  * @file       VCAN_KEY.c
//   11  * @brief      KEY驱动函数实现
//   12  * @author     山外科技
//   13  * @version    v5.0
//   14  * @date       2013-07-10
//   15  */
//   16 
//   17 
//   18 /*
//   19  * 包含头文件
//   20  */
//   21 #include "common.h"
//   22 #include "MK60_port.h"
//   23 #include "MK60_gpio.h"
//   24 #include "VCAN_key.h"
//   25 
//   26 
//   27 /*
//   28  * 定义 KEY 编号对应的管脚
//   29  */

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   30 PTXn_e KEY_PTxn[KEY_MAX] = {PTD10, PTD14, PTD11, PTD12, PTD15, PTD13, PTC14, PTC15};
KEY_PTxn:
        DATA
        DC8 106, 110, 107, 108, 111, 109, 78, 79
//   31 
//   32 
//   33 /*!
//   34  *  @brief      初始化key端口(key 小于 KEY_MAX 时初始化 对应端口，否则初始化全部端口)
//   35  *  @param      KEY_e    KEY编号
//   36  *  @since      v5.0
//   37  *  Sample usage:       key_init (KEY_U);    //初始化 KEY_U
//   38  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function key_init
        THUMB
//   39 void    key_init(KEY_e key)
//   40 {
key_init:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//   41     if(key < KEY_MAX)
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+8
        BGE.N    ??key_init_0
//   42     {
//   43         gpio_init(KEY_PTxn[key], GPI, 0);
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDR.N    R0,??DataTable4
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDRB     R0,[R4, R0]
          CFI FunCall gpio_init
        BL       gpio_init
//   44         port_init_NoALT(KEY_PTxn[key], PULLUP);         //保持复用不变，仅仅改变配置选项
        MOVS     R1,#+3
        LDR.N    R0,??DataTable4
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDRB     R0,[R4, R0]
          CFI FunCall port_init_NoALT
        BL       port_init_NoALT
        B.N      ??key_init_1
//   45     }
//   46     else
//   47     {
//   48         key = KEY_MAX;
??key_init_0:
        MOVS     R0,#+8
        MOVS     R4,R0
//   49 
//   50         //初始化全部 按键
//   51         while(key--)
??key_init_2:
        MOVS     R0,R4
        SUBS     R4,R0,#+1
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??key_init_1
//   52         {
//   53             gpio_init(KEY_PTxn[key], GPI, 0);
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDR.N    R0,??DataTable4
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDRB     R0,[R4, R0]
          CFI FunCall gpio_init
        BL       gpio_init
//   54             port_init_NoALT(KEY_PTxn[key], PULLUP);         //保持复用不变，仅仅改变配置选项
        MOVS     R1,#+3
        LDR.N    R0,??DataTable4
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDRB     R0,[R4, R0]
          CFI FunCall port_init_NoALT
        BL       port_init_NoALT
        B.N      ??key_init_2
//   55         }
//   56 
//   57     }
//   58 }
??key_init_1:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock0
//   59 
//   60 /*!
//   61  *  @brief      获取key状态（不带延时消抖）
//   62  *  @param      KEY_e           KEY编号
//   63  *  @return     KEY_STATUS_e    KEY状态（KEY_DOWN、KEY_DOWN）
//   64  *  @since      v5.0
//   65  *  Sample usage:
//   66                     if(key_get(KEY_U) ==  KEY_DOWN)
//   67                     {
//   68                         printf("\n按键按下")
//   69                     }
//   70  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function key_get
        THUMB
//   71 KEY_STATUS_e key_get(KEY_e key)
//   72 {
key_get:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//   73     if(gpio_get(KEY_PTxn[key]) == KEY_DOWN)
        LDR.N    R0,??DataTable4
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDRB     R0,[R4, R0]
          CFI FunCall gpio_get
        BL       gpio_get
        CMP      R0,#+0
        BNE.N    ??key_get_0
//   74     {
//   75         return KEY_DOWN;
        MOVS     R0,#+0
        B.N      ??key_get_1
//   76     }
//   77     return KEY_UP;
??key_get_0:
        MOVS     R0,#+1
??key_get_1:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock1
//   78 }
//   79 
//   80 
//   81 /*!
//   82  *  @brief      检测key状态（带延时消抖）
//   83  *  @param      KEY_e           KEY编号
//   84  *  @return     KEY_STATUS_e    KEY状态（KEY_DOWN、KEY_DOWN）
//   85  *  @since      v5.0
//   86  *  Sample usage:
//   87                     if(key_check(KEY_U) ==  KEY_DOWN)
//   88                     {
//   89                         printf("\n按键按下")
//   90                     }
//   91  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function key_check
        THUMB
//   92 KEY_STATUS_e key_check(KEY_e key)
//   93 {
key_check:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//   94     if(key_get(key) == KEY_DOWN)
        MOVS     R0,R4
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
          CFI FunCall key_get
        BL       key_get
        CMP      R0,#+0
        BNE.N    ??key_check_0
//   95     {
//   96         DELAY_MS(10);
        MOVS     R0,#+10
          CFI FunCall systick_delay_ms
        BL       systick_delay_ms
//   97         if( key_get(key) == KEY_DOWN)
        MOVS     R0,R4
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
          CFI FunCall key_get
        BL       key_get
        CMP      R0,#+0
        BNE.N    ??key_check_0
//   98         {
//   99             return KEY_DOWN;
        MOVS     R0,#+0
        B.N      ??key_check_1
//  100         }
//  101     }
//  102     return KEY_UP;
??key_check_0:
        MOVS     R0,#+1
??key_check_1:
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock2
//  103 }
//  104 
//  105 
//  106 /*********************  如下代码是实现按键定时扫描，发送消息到FIFO  ********************/
//  107 /*
//  108  * 定义按键消息FIFO状态
//  109  */
//  110 typedef enum
//  111 {
//  112     KEY_MSG_EMPTY,      //没有按键消息
//  113     KEY_MSG_NORMAL,     //正常，有按键消息，但不满
//  114     KEY_MSG_FULL,       //按键消息满
//  115 } key_msg_e;
//  116 
//  117 /*
//  118  * 定义按键消息FIFO相关的变量
//  119  */

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  120 KEY_MSG_t           key_msg[KEY_MSG_FIFO_SIZE];             //按键消息FIFO
key_msg:
        DS8 40

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//  121 volatile uint8      key_msg_front = 0, key_msg_rear = 0;    //接收FIFO的指针
key_msg_front:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
key_msg_rear:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//  122 volatile uint8      key_msg_flag = KEY_MSG_EMPTY;           //按键消息FIFO状态
key_msg_flag:
        DS8 1
//  123 
//  124 
//  125 /*!
//  126  *  @brief      发送按键消息到FIFO
//  127  *  @param      KEY_MSG_t       按键消息
//  128  *  @since      v5.0
//  129  *  Sample usage:
//  130                     KEY_MSG_t *keymsg;
//  131                     keymsg.key      = KEY_U;
//  132                     keymsg.status   = KEY_HOLD;
//  133                     send_key_msg(keymsg);                   //发送
//  134  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function send_key_msg
          CFI NoCalls
        THUMB
//  135 void send_key_msg(KEY_MSG_t keymsg)
//  136 {
send_key_msg:
        PUSH     {R0}
          CFI CFA R13+4
//  137     uint8 tmp;
//  138     //保存在FIFO里
//  139     if(key_msg_flag == KEY_MSG_FULL)
        LDR.N    R1,??DataTable4_1
        LDRB     R1,[R1, #+0]
        CMP      R1,#+2
        BEQ.N    ??send_key_msg_0
//  140     {
//  141         //满了直接不处理
//  142         return ;
//  143     }
//  144     key_msg[key_msg_rear].key = keymsg.key;
??send_key_msg_1:
        LDRB     R1,[SP, #+0]
        LDR.N    R2,??DataTable4_2
        LDR.N    R3,??DataTable4_3
        LDRB     R3,[R3, #+0]
        STRB     R1,[R2, R3, LSL #+1]
//  145     key_msg[key_msg_rear].status = keymsg.status;
        LDRB     R1,[SP, #+1]
        LDR.N    R2,??DataTable4_2
        LDR.N    R3,??DataTable4_3
        LDRB     R3,[R3, #+0]
        ADDS     R2,R2,R3, LSL #+1
        STRB     R1,[R2, #+1]
//  146 
//  147     key_msg_rear++;
        LDR.N    R1,??DataTable4_3
        LDRB     R1,[R1, #+0]
        ADDS     R1,R1,#+1
        LDR.N    R2,??DataTable4_3
        STRB     R1,[R2, #+0]
//  148 
//  149     if(key_msg_rear >= KEY_MSG_FIFO_SIZE)
        LDR.N    R1,??DataTable4_3
        LDRB     R1,[R1, #+0]
        CMP      R1,#+20
        BLT.N    ??send_key_msg_2
//  150     {
//  151         key_msg_rear = 0;                       //重头开始
        MOVS     R1,#+0
        LDR.N    R2,??DataTable4_3
        STRB     R1,[R2, #+0]
//  152     }
//  153 
//  154     tmp = key_msg_rear;
??send_key_msg_2:
        LDR.N    R1,??DataTable4_3
        LDRB     R1,[R1, #+0]
        MOVS     R0,R1
//  155     if(tmp == key_msg_front)                   //追到屁股了，满了
        LDR.N    R1,??DataTable4_4
        LDRB     R1,[R1, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,R1
        BNE.N    ??send_key_msg_3
//  156     {
//  157         key_msg_flag = KEY_MSG_FULL;
        MOVS     R1,#+2
        LDR.N    R2,??DataTable4_1
        STRB     R1,[R2, #+0]
        B.N      ??send_key_msg_4
//  158     }
//  159     else
//  160     {
//  161         key_msg_flag = KEY_MSG_NORMAL;
??send_key_msg_3:
        MOVS     R1,#+1
        LDR.N    R2,??DataTable4_1
        STRB     R1,[R2, #+0]
//  162     }
//  163 }
??send_key_msg_4:
??send_key_msg_0:
        ADD      SP,SP,#+4
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock3
//  164 
//  165 
//  166 /*!
//  167  *  @brief      从FIFO里获取按键消息
//  168  *  @param      KEY_MSG_t       按键消息
//  169  *  @return     是否获取按键消息（1为获取成功，0为没获取到按键消息）
//  170  *  @since      v5.0
//  171  *  Sample usage:
//  172                     KEY_MSG_t keymsg;
//  173                     if(get_key_msg(&keymsg) == 1)
//  174                     {
//  175                         printf("\n按下按键KEY%d,类型为%d（0为按下，1为弹起，2为长按）",keymsg.key,keymsg.status);
//  176                     }
//  177  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function get_key_msg
          CFI NoCalls
        THUMB
//  178 uint8 get_key_msg(KEY_MSG_t *keymsg)
//  179 {
get_key_msg:
        MOVS     R1,R0
//  180     uint8 tmp;
//  181 
//  182     if(key_msg_flag == KEY_MSG_EMPTY)               //按键消息FIFO为空，直接返回0
        LDR.N    R0,??DataTable4_1
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??get_key_msg_0
//  183     {
//  184         return 0;
        MOVS     R0,#+0
        B.N      ??get_key_msg_1
//  185     }
//  186 
//  187     keymsg->key = key_msg[key_msg_front].key;       //从FIFO队首中获取按键值
??get_key_msg_0:
        LDR.N    R0,??DataTable4_2
        LDR.N    R3,??DataTable4_4
        LDRB     R3,[R3, #+0]
        LDRB     R0,[R0, R3, LSL #+1]
        STRB     R0,[R1, #+0]
//  188     keymsg->status = key_msg[key_msg_front].status; //从FIFO队首中获取按键类型
        LDR.N    R0,??DataTable4_2
        LDR.N    R3,??DataTable4_4
        LDRB     R3,[R3, #+0]
        ADDS     R0,R0,R3, LSL #+1
        LDRB     R0,[R0, #+1]
        STRB     R0,[R1, #+1]
//  189 
//  190     key_msg_front++;                                //FIFO队首指针加1，指向下一个消息
        LDR.N    R0,??DataTable4_4
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R3,??DataTable4_4
        STRB     R0,[R3, #+0]
//  191 
//  192     if(key_msg_front >= KEY_MSG_FIFO_SIZE)          //FIFO指针队首溢出则从0开始计数
        LDR.N    R0,??DataTable4_4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+20
        BLT.N    ??get_key_msg_2
//  193     {
//  194         key_msg_front = 0;                          //重头开始计数（循环利用数组）
        MOVS     R0,#+0
        LDR.N    R3,??DataTable4_4
        STRB     R0,[R3, #+0]
//  195     }
//  196 
//  197     tmp = key_msg_rear;
??get_key_msg_2:
        LDR.N    R0,??DataTable4_3
        LDRB     R0,[R0, #+0]
        MOVS     R2,R0
//  198     if(key_msg_front == tmp)                        //比较队首和队尾是否一样，一样则表示FIFO已空了
        LDR.N    R0,??DataTable4_4
        LDRB     R0,[R0, #+0]
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R0,R2
        BNE.N    ??get_key_msg_3
//  199     {
//  200         key_msg_flag = KEY_MSG_EMPTY;
        MOVS     R0,#+0
        LDR.N    R3,??DataTable4_1
        STRB     R0,[R3, #+0]
        B.N      ??get_key_msg_4
//  201     }
//  202     else
//  203     {
//  204         key_msg_flag = KEY_MSG_NORMAL;
??get_key_msg_3:
        MOVS     R0,#+1
        LDR.N    R3,??DataTable4_1
        STRB     R0,[R3, #+0]
//  205     }
//  206 
//  207     return 1;
??get_key_msg_4:
        MOVS     R0,#+1
??get_key_msg_1:
        BX       LR               ;; return
          CFI EndBlock cfiBlock4
//  208 }
//  209 
//  210 /*!
//  211  *  @brief      定时检测key状态
//  212  *  @since      v5.0
//  213  *  @note       此函数需要放入 定时中断服务函数里，定时10ms执行一次
//  214  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function key_IRQHandler
        THUMB
//  215 void key_IRQHandler(void)
//  216 {
key_IRQHandler:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
//  217 
//  218     KEY_e   keynum;
//  219     static uint8 keytime[KEY_MAX];                          //静态数组，保存各数组按下时间
//  220 
//  221     KEY_MSG_t keymsg;                                       //按键消息
//  222 
//  223     for(keynum = (KEY_e)0 ; keynum < KEY_MAX; keynum ++)    //每个按键轮询
        MOVS     R0,#+0
        MOVS     R4,R0
??key_IRQHandler_0:
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+8
        BGE.N    ??key_IRQHandler_1
//  224     {
//  225         if(key_get(keynum) == KEY_DOWN)                     //判断按键是否按下
        MOVS     R0,R4
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
          CFI FunCall key_get
        BL       key_get
        CMP      R0,#+0
        BNE.N    ??key_IRQHandler_2
//  226         {
//  227             keytime[keynum]++;                              //按下时间累加
        LDR.N    R0,??DataTable4_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDRB     R0,[R4, R0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable4_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        STRB     R0,[R4, R1]
//  228 
//  229             if(keytime[keynum] <= KEY_DOWN_TIME)            //判断时间是否没超过消抖确认按下时间
        LDR.N    R0,??DataTable4_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDRB     R0,[R4, R0]
        CMP      R0,#+2
        BLT.N    ??key_IRQHandler_3
//  230             {
//  231                 continue;                                   //没达到，则继续等待
//  232             }
//  233             else if(keytime[keynum] == KEY_DOWN_TIME + 1 )  //判断时间是否为消抖确认按下时间
??key_IRQHandler_4:
        LDR.N    R0,??DataTable4_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDRB     R0,[R4, R0]
        CMP      R0,#+2
        BNE.N    ??key_IRQHandler_5
//  234             {
//  235                 //确认按键按下
//  236                 keymsg.key = keynum;
        STRB     R4,[SP, #+0]
//  237                 keymsg.status = KEY_DOWN;
        MOVS     R0,#+0
        STRB     R0,[SP, #+1]
//  238                 send_key_msg(keymsg);                       //把按键值和按键类型发送消息到FIFO
        LDR      R0,[SP, #+0]
          CFI FunCall send_key_msg
        BL       send_key_msg
        B.N      ??key_IRQHandler_3
//  239             }
//  240             else if(keytime[keynum] <= KEY_HOLD_TIME)       //是否没超过长按HOLD按键确认时间
??key_IRQHandler_5:
        LDR.N    R0,??DataTable4_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDRB     R0,[R4, R0]
        CMP      R0,#+51
        BLT.N    ??key_IRQHandler_3
//  241             {
//  242                 continue;                                   //没超过，则继续等待
//  243             }
//  244             else if(keytime[keynum]  == KEY_HOLD_TIME + 1)  //是否为长按hold确认时间
??key_IRQHandler_6:
        LDR.N    R0,??DataTable4_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDRB     R0,[R4, R0]
        CMP      R0,#+51
        BNE.N    ??key_IRQHandler_7
//  245             {
//  246                 //确认长按HOLD
//  247                 keymsg.key = keynum;
        STRB     R4,[SP, #+0]
//  248                 keymsg.status = KEY_HOLD;
        MOVS     R0,#+2
        STRB     R0,[SP, #+1]
//  249                 send_key_msg(keymsg);                       //发送
        LDR      R0,[SP, #+0]
          CFI FunCall send_key_msg
        BL       send_key_msg
//  250                 keytime[keynum] = KEY_DOWN_TIME + 1;
        MOVS     R0,#+2
        LDR.N    R1,??DataTable4_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        STRB     R0,[R4, R1]
        B.N      ??key_IRQHandler_3
//  251             }
//  252             else
//  253             {
//  254                 keytime[keynum] = KEY_DOWN_TIME + 1;        //继续重复检测 hold 状态
??key_IRQHandler_7:
        MOVS     R0,#+2
        LDR.N    R1,??DataTable4_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        STRB     R0,[R4, R1]
        B.N      ??key_IRQHandler_3
//  255             }
//  256         }
//  257         else
//  258         {
//  259             if(keytime[keynum] > KEY_DOWN_TIME)             //如果确认过按下按键
??key_IRQHandler_2:
        LDR.N    R0,??DataTable4_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        LDRB     R0,[R4, R0]
        CMP      R0,#+2
        BLT.N    ??key_IRQHandler_8
//  260             {
//  261                 keymsg.key = keynum;
        STRB     R4,[SP, #+0]
//  262                 keymsg.status = KEY_UP;
        MOVS     R0,#+1
        STRB     R0,[SP, #+1]
//  263                 send_key_msg(keymsg);                       //发送按键弹起消息
        LDR      R0,[SP, #+0]
          CFI FunCall send_key_msg
        BL       send_key_msg
//  264             }
//  265 
//  266             keytime[keynum] = 0;                            //时间累计清0
??key_IRQHandler_8:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable4_5
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        STRB     R0,[R4, R1]
//  267         }
//  268     }
??key_IRQHandler_3:
        ADDS     R4,R4,#+1
        B.N      ??key_IRQHandler_0
//  269 }
??key_IRQHandler_1:
        POP      {R0,R1,R4,PC}    ;; return
          CFI EndBlock cfiBlock5

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     KEY_PTxn

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     key_msg_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     key_msg

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     key_msg_rear

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     key_msg_front

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_5:
        DC32     ??keytime

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??keytime:
        DS8 8

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  270 
//  271 
//  272 
// 
//  51 bytes in section .bss
//   8 bytes in section .data
// 544 bytes in section .text
// 
// 544 bytes of CODE memory
//  59 bytes of DATA memory
//
//Errors: none
//Warnings: none
