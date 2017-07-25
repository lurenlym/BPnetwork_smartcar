///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       21/Mar/2017  16:05:17
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\znc\project\K60FN\network_car\Lib\USB\USB.c
//    Command line =  
//        E:\znc\project\K60FN\network_car\Lib\USB\USB.c -D DEBUG -D
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
//        E:\znc\project\K60FN\network_car\Prj\IAR\FN15_Debug\List\USB.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "1"
        RTMODEL "__dlib_full_locale_support", "1"
        RTMODEL "__iar_require _Printf", ""
        AAPCS BASE,INTERWORK,VFP
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN CDC_InterfaceReq_Handler
        EXTERN printf

        PUBLIC BufferPointer
        PUBLIC Configuration_Descriptor
        PUBLIC Device_Descriptor
        PUBLIC EP_IN_Transfer
        PUBLIC EP_OUT_Transfer
        PUBLIC Setup_Pkt
        PUBLIC String_Descriptor0
        PUBLIC String_Descriptor1
        PUBLIC String_Descriptor2
        PUBLIC String_Descriptor3
        PUBLIC String_Table
        PUBLIC USB_EP0_IN_Handler
        PUBLIC USB_EP0_OUT_Handler
        PUBLIC USB_EP0_Stall
        PUBLIC USB_EP_OUT_SizeCheck
        PUBLIC USB_Endpoint_Setup_Handler
        PUBLIC USB_Handler
        PUBLIC USB_ISR
        PUBLIC USB_Reset_Handler
        PUBLIC USB_Set_Interface
        PUBLIC USB_Setup_Handler
        PUBLIC USB_Stall_Handler
        PUBLIC USB_StdReq_Handler
        PUBLIC cEP_Size
        PUBLIC gu8Dummy
        PUBLIC gu8EP0_IN_EVEN_Buffer
        PUBLIC gu8EP0_IN_ODD_Buffer
        PUBLIC gu8EP0_OUT_EVEN_Buffer
        PUBLIC gu8EP0_OUT_ODD_Buffer
        PUBLIC gu8EP1_IN_EVEN_Buffer
        PUBLIC gu8EP1_IN_ODD_Buffer
        PUBLIC gu8EP1_OUT_EVEN_Buffer
        PUBLIC gu8EP1_OUT_ODD_Buffer
        PUBLIC gu8EP2_IN_EVEN_Buffer
        PUBLIC gu8EP2_IN_ODD_Buffer
        PUBLIC gu8EP2_OUT_EVEN_Buffer
        PUBLIC gu8EP2_OUT_ODD_Buffer
        PUBLIC gu8EP3_IN_EVEN_Buffer
        PUBLIC gu8EP3_IN_ODD_Buffer
        PUBLIC gu8EP3_OUT_EVEN_Buffer
        PUBLIC gu8EP3_OUT_ODD_Buffer
        PUBLIC gu8HALT_EP
        PUBLIC gu8IN_Counter
        PUBLIC gu8Interface
        PUBLIC gu8Status
        PUBLIC gu8USBClearFlags
        PUBLIC gu8USB_Flags
        PUBLIC gu8USB_State
        PUBLIC gu8USB_Toogle_flags
        PUBLIC pu8IN_DataPointer
        PUBLIC tBDTtable
        
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
        

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_0:
        DATA
        DC8 "\012USB Error\012"
// E:\znc\project\K60FN\network_car\Lib\USB\USB.c
//    1 #include "USB.h"
//    2 #include "USB_Desc.h"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
// __absolute USB_DEVICE_DESCRIPTOR const Device_Descriptor
Device_Descriptor:
        DATA
        DC8 18, 1
        DC16 512
        DC8 2, 2, 0, 64
        DC16 5538, 42255, 0
        DC8 1, 2, 3, 1, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
// __absolute unsigned char const String_Descriptor0[4]
String_Descriptor0:
        DATA
        DC8 4, 3, 9, 4

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
// __absolute unsigned char const String_Descriptor1[18]
String_Descriptor1:
        DATA
        DC8 18, 3, 119, 0, 105, 0, 108, 0, 100, 0, 102, 0, 105, 0, 114, 0, 101
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
// __absolute unsigned char const String_Descriptor2[18]
String_Descriptor2:
        DATA
        DC8 18, 3, 85, 0, 83, 0, 66, 0, 45, 0, 85, 0, 65, 0, 82, 0, 84, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
// __absolute unsigned char const String_Descriptor3[18]
String_Descriptor3:
        DATA
        DC8 18, 3, 84, 0, 69, 0, 83, 0, 84, 0, 95, 0, 49, 0, 46, 0, 49, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
// __absolute unsigned char const Configuration_Descriptor[67]
Configuration_Descriptor:
        DATA
        DC8 9, 2, 67, 0, 2, 1, 0, 192, 50, 9, 4, 0, 0, 1, 2, 2, 1, 1, 5, 36, 0
        DC8 16, 1, 5, 36, 1, 0, 1, 4, 36, 2, 0, 5, 36, 6, 0, 1, 7, 5, 129, 3
        DC8 64, 0, 2, 9, 4, 1, 0, 2, 10, 0, 0, 1, 7, 5, 130, 2, 64, 0, 0, 7, 5
        DC8 3, 2, 64, 0, 0, 0
//    3 
//    4 
//    5 /* 数组 和 全局缓冲区 */
//    6 #pragma data_alignment=512      //必须 512 字节对齐
//    7 

        SECTION `.bss`:DATA:REORDER:NOROOT(9)
//    8 tBDT tBDTtable[16];
tBDTtable:
        DS8 128
//    9 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   10 uint8 gu8EP0_OUT_ODD_Buffer[EP0_SIZE];
gu8EP0_OUT_ODD_Buffer:
        DS8 64

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   11 uint8 gu8EP0_OUT_EVEN_Buffer[EP0_SIZE];
gu8EP0_OUT_EVEN_Buffer:
        DS8 64

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   12 uint8 gu8EP0_IN_ODD_Buffer[EP0_SIZE];
gu8EP0_IN_ODD_Buffer:
        DS8 64

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   13 uint8 gu8EP0_IN_EVEN_Buffer[EP0_SIZE];
gu8EP0_IN_EVEN_Buffer:
        DS8 64
//   14 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   15 uint8 gu8EP1_OUT_ODD_Buffer[EP1_SIZE];
gu8EP1_OUT_ODD_Buffer:
        DS8 64

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   16 uint8 gu8EP1_OUT_EVEN_Buffer[EP1_SIZE];
gu8EP1_OUT_EVEN_Buffer:
        DS8 64

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   17 uint8 gu8EP1_IN_ODD_Buffer[EP1_SIZE];
gu8EP1_IN_ODD_Buffer:
        DS8 64

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   18 uint8 gu8EP1_IN_EVEN_Buffer[EP1_SIZE];
gu8EP1_IN_EVEN_Buffer:
        DS8 64
//   19 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   20 uint8 gu8EP2_OUT_ODD_Buffer[EP2_SIZE];
gu8EP2_OUT_ODD_Buffer:
        DS8 64

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   21 uint8 gu8EP2_OUT_EVEN_Buffer[EP2_SIZE];
gu8EP2_OUT_EVEN_Buffer:
        DS8 64

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   22 uint8 gu8EP2_IN_ODD_Buffer[EP2_SIZE];
gu8EP2_IN_ODD_Buffer:
        DS8 64

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   23 uint8 gu8EP2_IN_EVEN_Buffer[EP2_SIZE];
gu8EP2_IN_EVEN_Buffer:
        DS8 64
//   24 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   25 uint8 gu8EP3_OUT_ODD_Buffer[EP3_SIZE];
gu8EP3_OUT_ODD_Buffer:
        DS8 64

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   26 uint8 gu8EP3_OUT_EVEN_Buffer[EP3_SIZE];
gu8EP3_OUT_EVEN_Buffer:
        DS8 64

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   27 uint8 gu8EP3_IN_ODD_Buffer[EP3_SIZE];
gu8EP3_IN_ODD_Buffer:
        DS8 64

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   28 uint8 gu8EP3_IN_EVEN_Buffer[EP3_SIZE];
gu8EP3_IN_EVEN_Buffer:
        DS8 64
//   29 
//   30 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   31 uint8 *BufferPointer[] =
BufferPointer:
        DATA
        DC32 gu8EP0_OUT_ODD_Buffer, gu8EP0_OUT_EVEN_Buffer
        DC32 gu8EP0_IN_ODD_Buffer, gu8EP0_IN_EVEN_Buffer, gu8EP1_OUT_ODD_Buffer
        DC32 gu8EP1_OUT_EVEN_Buffer, gu8EP1_IN_ODD_Buffer
        DC32 gu8EP1_IN_EVEN_Buffer, gu8EP2_OUT_ODD_Buffer
        DC32 gu8EP2_OUT_EVEN_Buffer, gu8EP2_IN_ODD_Buffer
        DC32 gu8EP2_IN_EVEN_Buffer, gu8EP3_OUT_ODD_Buffer
        DC32 gu8EP3_OUT_EVEN_Buffer, gu8EP3_IN_ODD_Buffer
        DC32 gu8EP3_IN_EVEN_Buffer
//   32 {
//   33     gu8EP0_OUT_ODD_Buffer,
//   34     gu8EP0_OUT_EVEN_Buffer,
//   35     gu8EP0_IN_ODD_Buffer,
//   36     gu8EP0_IN_EVEN_Buffer,
//   37     gu8EP1_OUT_ODD_Buffer,
//   38     gu8EP1_OUT_EVEN_Buffer,
//   39     gu8EP1_IN_ODD_Buffer,
//   40     gu8EP1_IN_EVEN_Buffer,
//   41     gu8EP2_OUT_ODD_Buffer,
//   42     gu8EP2_OUT_EVEN_Buffer,
//   43     gu8EP2_IN_ODD_Buffer,
//   44     gu8EP2_IN_EVEN_Buffer,
//   45     gu8EP3_OUT_ODD_Buffer,
//   46     gu8EP3_OUT_EVEN_Buffer,
//   47     gu8EP3_IN_ODD_Buffer,
//   48     gu8EP3_IN_EVEN_Buffer
//   49 };
//   50 
//   51 

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//   52 const uint8 cEP_Size[] =
cEP_Size:
        DATA
        DC8 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64
//   53 {
//   54     EP0_SIZE,
//   55     EP0_SIZE,
//   56     EP0_SIZE,
//   57     EP0_SIZE,
//   58     EP1_SIZE,
//   59     EP1_SIZE,
//   60     EP1_SIZE,
//   61     EP1_SIZE,
//   62     EP2_SIZE,
//   63     EP2_SIZE,
//   64     EP2_SIZE,
//   65     EP2_SIZE,
//   66     EP3_SIZE,
//   67     EP3_SIZE,
//   68     EP3_SIZE,
//   69     EP3_SIZE
//   70 };
//   71 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   72 const uint8 *String_Table[4] =
String_Table:
        DATA
        DC32 String_Descriptor0, String_Descriptor1, String_Descriptor2
        DC32 String_Descriptor3
//   73 {
//   74     String_Descriptor0,
//   75     String_Descriptor1,
//   76     String_Descriptor2,
//   77     String_Descriptor3
//   78 };
//   79 
//   80 
//   81 /* USB 中断服务函数的全局变量 */

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   82 uint8   gu8USB_Flags;           //USB 的 各端点 接收到数据 的 标志位
gu8USB_Flags:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   83 uint8   gu8USBClearFlags;
gu8USBClearFlags:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   84 uint8   *pu8IN_DataPointer;     //指向 USB输入数据缓冲区的 指针
pu8IN_DataPointer:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   85 uint8   gu8IN_Counter;
gu8IN_Counter:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   86 uint8   gu8USB_Toogle_flags;
gu8USB_Toogle_flags:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   87 uint8   gu8Dummy;
gu8Dummy:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(1)
//   88 uint16  gu8Status;
gu8Status:
        DS8 2

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   89 uint8   gu8Interface;
gu8Interface:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   90 uint8   gu8HALT_EP;
gu8HALT_EP:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   91 uint8   gu8USB_State;
gu8USB_State:
        DS8 1
//   92 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   93 tUSB_Setup *Setup_Pkt;          //USB setup 数据包指针
Setup_Pkt:
        DS8 4
//   94 
//   95 
//   96 /*!
//   97  *  @brief      端点IN传送(IN是相对主机而言)
//   98  *  @since      v5.0
//   99  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function EP_IN_Transfer
          CFI NoCalls
        THUMB
//  100 void EP_IN_Transfer(uint8 u8EP, uint8 *pu8DataPointer, uint8 u8DataSize)
//  101 {
EP_IN_Transfer:
        PUSH     {R4-R7}
          CFI R7 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+16
//  102     uint8 *pu8EPBuffer;
//  103     uint8 u8EPSize;
//  104     uint16 u16Lenght = 0;
        MOVS     R5,#+0
//  105     uint8 u8EndPointFlag;
//  106 
//  107     /* Adjust the buffer location */
//  108     u8EndPointFlag = u8EP;
        MOVS     R6,R0
//  109     if(u8EP)
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??EP_IN_Transfer_0
//  110     {
//  111         u8EP = (uint8)(u8EP << 2);
        LSLS     R0,R0,#+2
//  112     }
//  113     u8EP += 2;
??EP_IN_Transfer_0:
        ADDS     R0,R0,#+2
//  114 
//  115     /* Assign the proper EP buffer */
//  116     pu8EPBuffer = BufferPointer[u8EP];
        LDR.W    R7,??DataTable13
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR      R7,[R7, R0, LSL #+2]
        MOVS     R3,R7
//  117 
//  118     /* Check if is a pending transfer */
//  119     if(FLAG_CHK(fIN, gu8USBClearFlags))
        LDR.W    R7,??DataTable13_1
        LDRB     R7,[R7, #+0]
        LSLS     R7,R7,#+31
        BPL.N    ??EP_IN_Transfer_1
//  120     {
//  121         pu8IN_DataPointer = pu8DataPointer;
        LDR.W    R7,??DataTable13_2
        STR      R1,[R7, #+0]
//  122         gu8IN_Counter = u8DataSize;
        LDR.W    R7,??DataTable13_3
        STRB     R2,[R7, #+0]
//  123 
//  124         u16Lenght = (Setup_Pkt->wLength_h << 8) + Setup_Pkt->wLength_l ;
        LDR.W    R7,??DataTable13_4
        LDR      R7,[R7, #+0]
        LDRB     R7,[R7, #+7]
        LSLS     R7,R7,#+8
        LDR.W    R12,??DataTable13_4
        LDR      R12,[R12, #+0]
        LDRB     R12,[R12, #+6]
        ADDS     R7,R7,R12
        MOVS     R5,R7
//  125         if((u16Lenght < u8DataSize) && (u8EP == 2))
        MOVS     R7,R2
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R5,R7
        BCS.N    ??EP_IN_Transfer_1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+2
        BNE.N    ??EP_IN_Transfer_1
//  126         {
//  127             gu8IN_Counter = Setup_Pkt->wLength_l;
        LDR.W    R7,??DataTable13_4
        LDR      R7,[R7, #+0]
        LDRB     R7,[R7, #+6]
        LDR.W    R12,??DataTable13_3
        STRB     R7,[R12, #+0]
//  128         }
//  129     }
//  130 
//  131     /* Check transfer Size */
//  132     if(gu8IN_Counter > cEP_Size[u8EP])
??EP_IN_Transfer_1:
        LDR.W    R7,??DataTable13_5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDRB     R7,[R0, R7]
        LDR.W    R12,??DataTable13_3
        LDRB     R12,[R12, #+0]
        CMP      R7,R12
        BCS.N    ??EP_IN_Transfer_2
//  133     {
//  134         u8EPSize = cEP_Size[u8EP];
        LDR.W    R7,??DataTable13_5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDRB     R7,[R0, R7]
        MOVS     R4,R7
//  135         gu8IN_Counter -= cEP_Size[u8EP];
        LDR.W    R7,??DataTable13_3
        LDRB     R7,[R7, #+0]
        LDR.W    R12,??DataTable13_5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDRB     R12,[R0, R12]
        SUBS     R7,R7,R12
        LDR.W    R12,??DataTable13_3
        STRB     R7,[R12, #+0]
//  136         FLAG_CLR(fIN, gu8USBClearFlags);
        LDR.W    R7,??DataTable13_1
        LDRB     R7,[R7, #+0]
        ANDS     R7,R7,#0xFE
        LDR.W    R12,??DataTable13_1
        STRB     R7,[R12, #+0]
        B.N      ??EP_IN_Transfer_3
//  137     }
//  138     else
//  139     {
//  140         u8EPSize = gu8IN_Counter;
??EP_IN_Transfer_2:
        LDR.W    R7,??DataTable13_3
        LDRB     R7,[R7, #+0]
        MOVS     R4,R7
//  141         gu8IN_Counter = 0;
        MOVS     R7,#+0
        LDR.W    R12,??DataTable13_3
        STRB     R7,[R12, #+0]
//  142         FLAG_SET(fIN, gu8USBClearFlags);
        LDR.W    R7,??DataTable13_1
        LDRB     R7,[R7, #+0]
        ORRS     R7,R7,#0x1
        LDR.W    R12,??DataTable13_1
        STRB     R7,[R12, #+0]
//  143     }
//  144 
//  145     /* Copy User buffer to EP buffer */
//  146     tBDTtable[u8EP].Cnt = (u8EPSize);
??EP_IN_Transfer_3:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDR.W    R7,??DataTable13_6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R7,R7,R0, LSL #+3
        STRH     R4,[R7, #+2]
//  147 
//  148     while(u8EPSize--)
??EP_IN_Transfer_4:
        MOVS     R7,R4
        SUBS     R4,R7,#+1
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+0
        BEQ.N    ??EP_IN_Transfer_5
//  149         *pu8EPBuffer++ = *pu8IN_DataPointer++;
        LDR.W    R7,??DataTable13_2
        LDR      R7,[R7, #+0]
        LDRB     R7,[R7, #+0]
        STRB     R7,[R3, #+0]
        LDR.W    R7,??DataTable13_2
        LDR      R7,[R7, #+0]
        ADDS     R7,R7,#+1
        LDR.W    R12,??DataTable13_2
        STR      R7,[R12, #+0]
        ADDS     R3,R3,#+1
        B.N      ??EP_IN_Transfer_4
//  150 
//  151 
//  152     /* USB Flags Handling */
//  153     if(FLAG_CHK(u8EndPointFlag, gu8USB_Toogle_flags))
??EP_IN_Transfer_5:
        LDR.W    R7,??DataTable13_7
        LDRB     R7,[R7, #+0]
        MOVS     R12,#+1
        LSLS     R12,R12,R6
        TST      R7,R12
        BEQ.N    ??EP_IN_Transfer_6
//  154     {
//  155         tBDTtable[u8EP].Stat._byte = kUDATA0;
        MOVS     R7,#+136
        LDR.W    R12,??DataTable13_6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        STRB     R7,[R12, R0, LSL #+3]
//  156         FLAG_CLR(u8EndPointFlag, gu8USB_Toogle_flags);
        LDR.W    R7,??DataTable13_7
        LDRB     R7,[R7, #+0]
        MOVS     R12,#+1
        LSLS     R12,R12,R6
        BICS     R7,R7,R12
        LDR.W    R12,??DataTable13_7
        STRB     R7,[R12, #+0]
        B.N      ??EP_IN_Transfer_7
//  157     }
//  158     else
//  159     {
//  160         tBDTtable[u8EP].Stat._byte = kUDATA1;
??EP_IN_Transfer_6:
        MOVS     R7,#+200
        LDR.W    R12,??DataTable13_6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        STRB     R7,[R12, R0, LSL #+3]
//  161         FLAG_SET(u8EndPointFlag, gu8USB_Toogle_flags);
        LDR.W    R7,??DataTable13_7
        LDRB     R7,[R7, #+0]
        MOVS     R12,#+1
        LSLS     R12,R12,R6
        ORRS     R7,R12,R7
        LDR.W    R12,??DataTable13_7
        STRB     R7,[R12, #+0]
//  162     }
//  163 
//  164 }
??EP_IN_Transfer_7:
        POP      {R4-R7}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI R6 SameValue
          CFI R7 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
//  165 
//  166 /*!
//  167  *  @brief      端点OUT传送(OUT是相对主机而言)
//  168  *  @since      v5.0
//  169  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function EP_OUT_Transfer
          CFI NoCalls
        THUMB
//  170 uint8 EP_OUT_Transfer(uint8 u8EP, uint8 *pu8DataPointer)
//  171 {
EP_OUT_Transfer:
        PUSH     {R4}
          CFI R4 Frame(CFA, -4)
          CFI CFA R13+4
//  172     uint8 *pu8EPBuffer;
//  173     uint8 u8EPSize;
//  174 
//  175 
//  176     /* Adjust the buffer location */
//  177     //u8EP++;
//  178 
//  179     /* Assign the proper EP buffer */
//  180     pu8EPBuffer = BufferPointer[u8EP];
        LDR.W    R4,??DataTable13
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR      R4,[R4, R0, LSL #+2]
        MOVS     R2,R4
//  181 
//  182     /* Copy User buffer to EP buffer */
//  183     u8EPSize = tBDTtable[u8EP].Cnt;
        LDR.W    R4,??DataTable13_6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADDS     R4,R4,R0, LSL #+3
        LDRH     R4,[R4, #+2]
        MOVS     R3,R4
//  184     u8EP = u8EPSize;
        MOVS     R0,R3
//  185 
//  186     while(u8EPSize--)
??EP_OUT_Transfer_0:
        MOVS     R4,R3
        SUBS     R3,R4,#+1
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??EP_OUT_Transfer_1
//  187         *pu8DataPointer++ = *pu8EPBuffer++;
        LDRB     R4,[R2, #+0]
        STRB     R4,[R1, #+0]
        ADDS     R2,R2,#+1
        ADDS     R1,R1,#+1
        B.N      ??EP_OUT_Transfer_0
//  188     return(u8EP);
??EP_OUT_Transfer_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4}
          CFI R4 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock1
//  189 }
//  190 
//  191 /*!
//  192  *  @brief      端点OUT长度检测(OUT是相对主机而言)
//  193  *  @since      v5.0
//  194  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function USB_EP_OUT_SizeCheck
          CFI NoCalls
        THUMB
//  195 uint16 USB_EP_OUT_SizeCheck(uint8 u8EP)
//  196 {
USB_EP_OUT_SizeCheck:
        MOVS     R1,R0
//  197     uint8 u8EPSize;
//  198     /* Read Buffer Size */
//  199     u8EPSize = tBDTtable[u8EP<<2].Cnt;
        LDR.W    R2,??DataTable13_6
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSLS     R3,R1,#+2
        ADDS     R2,R2,R3, LSL #+3
        LDRH     R2,[R2, #+2]
        MOVS     R0,R2
//  200     return(u8EPSize & 0x03FF);
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BX       LR               ;; return
          CFI EndBlock cfiBlock2
//  201 }
//  202 
//  203 /*!
//  204  *  @brief      设置 USB 端点
//  205  *  @since      v5.0
//  206  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function USB_Set_Interface
          CFI NoCalls
        THUMB
//  207 void USB_Set_Interface(void)
//  208 {
//  209     /* EndPoint Register settings */
//  210     USB0_ENDPT1 = EP1_VALUE | USB_ENDPT_EPHSHK_MASK;
USB_Set_Interface:
        MOVS     R0,#+5
        LDR.W    R1,??DataTable13_8  ;; 0x400720c4
        STRB     R0,[R1, #+0]
//  211     USB0_ENDPT2 = EP2_VALUE | USB_ENDPT_EPHSHK_MASK;
        MOVS     R0,#+5
        LDR.W    R1,??DataTable13_9  ;; 0x400720c8
        STRB     R0,[R1, #+0]
//  212     USB0_ENDPT3 = EP3_VALUE | USB_ENDPT_EPHSHK_MASK;
        MOVS     R0,#+9
        LDR.W    R1,??DataTable13_10  ;; 0x400720cc
        STRB     R0,[R1, #+0]
//  213     //USB0_ENDPT4 = EP4_VALUE | USB_ENDPT_EPHSHK_MASK;
//  214     //USB0_ENDPT5 = EP5_VALUE | USB_ENDPT_EPHSHK_MASK;
//  215     //USB0_ENDPT6 = EP6_VALUE | USB_ENDPT_EPHSHK_MASK;
//  216 
//  217 
//  218     /* EndPoint 1 BDT Settings*/
//  219     tBDTtable[bEP1IN_ODD].Stat._byte = kMCU;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable13_6
        STRB     R0,[R1, #+48]
//  220     tBDTtable[bEP1IN_ODD].Cnt = 0x00;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable13_6
        STRH     R0,[R1, #+50]
//  221     tBDTtable[bEP1IN_ODD].Addr = (uint32)gu8EP1_IN_ODD_Buffer;
        LDR.W    R0,??DataTable13_11
        LDR.W    R1,??DataTable13_6
        STR      R0,[R1, #+52]
//  222 
//  223     /* EndPoint 2 BDT Settings*/
//  224     tBDTtable[bEP2IN_ODD].Stat._byte = kMCU;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable13_6
        STRB     R0,[R1, #+80]
//  225     tBDTtable[bEP2IN_ODD].Cnt = 0x00;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable13_6
        STRH     R0,[R1, #+82]
//  226     tBDTtable[bEP2IN_ODD].Addr = (uint32)gu8EP2_IN_ODD_Buffer;
        LDR.W    R0,??DataTable13_12
        LDR.W    R1,??DataTable13_6
        STR      R0,[R1, #+84]
//  227 
//  228     /* EndPoint 3 BDT Settings*/
//  229     tBDTtable[bEP3OUT_ODD].Stat._byte = kSIE;
        MOVS     R0,#+128
        LDR.W    R1,??DataTable13_6
        STRB     R0,[R1, #+96]
//  230     tBDTtable[bEP3OUT_ODD].Cnt = 0xFF;
        MOVS     R0,#+255
        LDR.W    R1,??DataTable13_6
        STRH     R0,[R1, #+98]
//  231     tBDTtable[bEP3OUT_ODD].Addr = (uint32)gu8EP3_OUT_ODD_Buffer;
        LDR.W    R0,??DataTable13_13
        LDR.W    R1,??DataTable13_6
        STR      R0,[R1, #+100]
//  232 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock3
//  233 
//  234 
//  235 /*!
//  236  *  @brief      标准请求中断服务函数（USB接收的Setup的请求）
//  237  *  @since      v5.0
//  238  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function USB_StdReq_Handler
        THUMB
//  239 void USB_StdReq_Handler(void)
//  240 {
USB_StdReq_Handler:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  241 
//  242     switch(Setup_Pkt->bRequest)
        LDR.W    R0,??DataTable13_4
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+1]
        CMP      R0,#+0
        BEQ.N    ??USB_StdReq_Handler_0
        CMP      R0,#+5
        BEQ.N    ??USB_StdReq_Handler_1
        CMP      R0,#+6
        BEQ.N    ??USB_StdReq_Handler_2
        CMP      R0,#+8
        BEQ.N    ??USB_StdReq_Handler_3
        CMP      R0,#+9
        BEQ.N    ??USB_StdReq_Handler_4
        B.N      ??USB_StdReq_Handler_5
//  243     {
//  244     case mSET_ADDRESS:
//  245         EP_IN_Transfer(EP0, 0, 0);
??USB_StdReq_Handler_1:
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall EP_IN_Transfer
        BL       EP_IN_Transfer
//  246         gu8USB_State = uADDRESS;
        MOVS     R0,#+3
        LDR.W    R1,??DataTable13_14
        STRB     R0,[R1, #+0]
//  247         break;
        B.N      ??USB_StdReq_Handler_6
//  248 
//  249     case mGET_DESC:
//  250         switch(Setup_Pkt->wValue_h)
??USB_StdReq_Handler_2:
        LDR.W    R0,??DataTable13_4
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+3]
        CMP      R0,#+1
        BEQ.N    ??USB_StdReq_Handler_7
        BCC.N    ??USB_StdReq_Handler_8
        CMP      R0,#+3
        BEQ.N    ??USB_StdReq_Handler_9
        BCC.N    ??USB_StdReq_Handler_10
        B.N      ??USB_StdReq_Handler_8
//  251         {
//  252         case mDEVICE:
//  253             EP_IN_Transfer(EP0, (uint8 *)&Device_Descriptor, sizeof(Device_Descriptor));
??USB_StdReq_Handler_7:
        MOVS     R2,#+18
        LDR.W    R1,??DataTable13_15
        MOVS     R0,#+0
          CFI FunCall EP_IN_Transfer
        BL       EP_IN_Transfer
//  254             break;
        B.N      ??USB_StdReq_Handler_11
//  255 
//  256         case mCONFIGURATION:
//  257             EP_IN_Transfer(EP0, (uint8 *)Configuration_Descriptor, sizeof(Configuration_Descriptor));
??USB_StdReq_Handler_10:
        MOVS     R2,#+67
        LDR.W    R1,??DataTable13_16
        MOVS     R0,#+0
          CFI FunCall EP_IN_Transfer
        BL       EP_IN_Transfer
//  258             break;
        B.N      ??USB_StdReq_Handler_11
//  259 
//  260         case mSTRING:
//  261             EP_IN_Transfer(EP0, (uint8 *)String_Table[Setup_Pkt->wValue_l], String_Table[Setup_Pkt->wValue_l][0]);
??USB_StdReq_Handler_9:
        LDR.W    R0,??DataTable13_17
        LDR.W    R1,??DataTable13_4
        LDR      R1,[R1, #+0]
        LDRB     R1,[R1, #+2]
        LDR      R0,[R0, R1, LSL #+2]
        LDRB     R2,[R0, #+0]
        LDR.W    R0,??DataTable13_17
        LDR.W    R1,??DataTable13_4
        LDR      R1,[R1, #+0]
        LDRB     R1,[R1, #+2]
        LDR      R1,[R0, R1, LSL #+2]
        MOVS     R0,#+0
          CFI FunCall EP_IN_Transfer
        BL       EP_IN_Transfer
//  262             break;
        B.N      ??USB_StdReq_Handler_11
//  263 
//  264         default:
//  265             USB_EP0_Stall();
??USB_StdReq_Handler_8:
          CFI FunCall USB_EP0_Stall
        BL       USB_EP0_Stall
//  266             break;
//  267         }
//  268         break;
??USB_StdReq_Handler_11:
        B.N      ??USB_StdReq_Handler_6
//  269 
//  270     case mSET_CONFIG:
//  271         gu8Dummy = Setup_Pkt->wValue_h + Setup_Pkt->wValue_l;
??USB_StdReq_Handler_4:
        LDR.W    R0,??DataTable13_4
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+3]
        LDR.W    R1,??DataTable13_4
        LDR      R1,[R1, #+0]
        LDRB     R1,[R1, #+2]
        ADDS     R0,R1,R0
        LDR.W    R1,??DataTable13_18
        STRB     R0,[R1, #+0]
//  272         if(Setup_Pkt->wValue_h + Setup_Pkt->wValue_l)
        LDR.W    R0,??DataTable13_4
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+3]
        LDR.W    R1,??DataTable13_4
        LDR      R1,[R1, #+0]
        LDRB     R1,[R1, #+2]
        ADDS     R0,R1,R0
        CMP      R0,#+0
        BEQ.N    ??USB_StdReq_Handler_12
//  273         {
//  274             USB_Set_Interface();
          CFI FunCall USB_Set_Interface
        BL       USB_Set_Interface
//  275             EP_IN_Transfer(EP0, 0, 0);
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall EP_IN_Transfer
        BL       EP_IN_Transfer
//  276             gu8USB_State = uENUMERATED;
        MOVS     R0,#+1
        LDR.W    R1,??DataTable13_14
        STRB     R0,[R1, #+0]
//  277         }
//  278         break;
??USB_StdReq_Handler_12:
        B.N      ??USB_StdReq_Handler_6
//  279 
//  280     case mGET_CONFIG:
//  281         EP_IN_Transfer(EP0, (uint8 *)&gu8Dummy, 1);
??USB_StdReq_Handler_3:
        MOVS     R2,#+1
        LDR.W    R1,??DataTable13_18
        MOVS     R0,#+0
          CFI FunCall EP_IN_Transfer
        BL       EP_IN_Transfer
//  282         break;
        B.N      ??USB_StdReq_Handler_6
//  283 
//  284     case mGET_STATUS:
//  285         gu8Status = 0;
??USB_StdReq_Handler_0:
        MOVS     R0,#+0
        LDR.W    R1,??DataTable13_19
        STRH     R0,[R1, #+0]
//  286         EP_IN_Transfer(EP0, (uint8 *)&gu8Status, 2);
        MOVS     R2,#+2
        LDR.W    R1,??DataTable13_19
        MOVS     R0,#+0
          CFI FunCall EP_IN_Transfer
        BL       EP_IN_Transfer
//  287         break;
        B.N      ??USB_StdReq_Handler_6
//  288 
//  289 
//  290     default:
//  291         USB_EP0_Stall();
??USB_StdReq_Handler_5:
          CFI FunCall USB_EP0_Stall
        BL       USB_EP0_Stall
//  292         break;
//  293     }
//  294 }
??USB_StdReq_Handler_6:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock4
//  295 
//  296 /*!
//  297  *  @brief      USB SETUP中断 服务函数
//  298  *  @since      v5.0
//  299  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function USB_Setup_Handler
        THUMB
//  300 void USB_Setup_Handler(void)
//  301 {
USB_Setup_Handler:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
//  302     uint8 u8State;
//  303 
//  304     FLAG_CLR(0, gu8USB_Toogle_flags);
        LDR.W    R0,??DataTable13_7
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0xFE
        LDR.W    R1,??DataTable13_7
        STRB     R0,[R1, #+0]
//  305     switch(Setup_Pkt->bmRequestType & 0x1F)
        LDR.W    R0,??DataTable13_4
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0x1F
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??USB_Setup_Handler_0
        CMP      R0,#+2
        BEQ.N    ??USB_Setup_Handler_1
        BCC.N    ??USB_Setup_Handler_2
        B.N      ??USB_Setup_Handler_3
//  306     {
//  307     case DEVICE_REQ:
//  308         if((Setup_Pkt->bmRequestType & 0x1F) == STANDARD_REQ)
??USB_Setup_Handler_0:
        LDR.W    R0,??DataTable13_4
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+31
        TST      R0,R1
        BNE.N    ??USB_Setup_Handler_4
//  309         {
//  310             //tBDTtable[bEP0IN_ODD].Stat._byte= kUDATA1;
//  311 
//  312             USB_StdReq_Handler();
          CFI FunCall USB_StdReq_Handler
        BL       USB_StdReq_Handler
//  313         }
//  314         tBDTtable[bEP0OUT_ODD].Stat._byte = kUDATA0;
??USB_Setup_Handler_4:
        MOVS     R0,#+136
        LDR.W    R1,??DataTable13_6
        STRB     R0,[R1, #+0]
//  315         break;
        B.N      ??USB_Setup_Handler_5
//  316 
//  317     case INTERFACE_REQ:
//  318         u8State = CDC_InterfaceReq_Handler();
??USB_Setup_Handler_2:
          CFI FunCall CDC_InterfaceReq_Handler
        BL       CDC_InterfaceReq_Handler
        MOVS     R4,R0
//  319 
//  320         if(u8State == uSETUP)
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.N    ??USB_Setup_Handler_6
//  321             tBDTtable[bEP0OUT_ODD].Stat._byte = kUDATA0;
        MOVS     R0,#+136
        LDR.W    R1,??DataTable13_6
        STRB     R0,[R1, #+0]
        B.N      ??USB_Setup_Handler_7
//  322         else
//  323             tBDTtable[bEP0OUT_ODD].Stat._byte = kUDATA1;
??USB_Setup_Handler_6:
        MOVS     R0,#+200
        LDR.N    R1,??DataTable13_6
        STRB     R0,[R1, #+0]
//  324         break;
??USB_Setup_Handler_7:
        B.N      ??USB_Setup_Handler_5
//  325 
//  326     case ENDPOINT_REQ:
//  327         USB_Endpoint_Setup_Handler();
??USB_Setup_Handler_1:
          CFI FunCall USB_Endpoint_Setup_Handler
        BL       USB_Endpoint_Setup_Handler
//  328         tBDTtable[bEP0OUT_ODD].Stat._byte = kUDATA0;
        MOVS     R0,#+136
        LDR.N    R1,??DataTable13_6
        STRB     R0,[R1, #+0]
//  329         break;
        B.N      ??USB_Setup_Handler_5
//  330 
//  331     default:
//  332         USB_EP0_Stall();
??USB_Setup_Handler_3:
          CFI FunCall USB_EP0_Stall
        BL       USB_EP0_Stall
//  333         break;
//  334     }
//  335     FLAG_CLR(USB_CTL_TXSUSPENDTOKENBUSY_SHIFT, USB0_CTL);
??USB_Setup_Handler_5:
        LDR.W    R0,??DataTable13_20  ;; 0x40072094
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0xDF
        LDR.W    R1,??DataTable13_20  ;; 0x40072094
        STRB     R0,[R1, #+0]
//  336 }
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock5
//  337 
//  338 /*!
//  339  *  @brief      USB 端点 SETUP中断 服务函数
//  340  *  @since      v5.0
//  341  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function USB_Endpoint_Setup_Handler
        THUMB
//  342 void USB_Endpoint_Setup_Handler(void)
//  343 {
USB_Endpoint_Setup_Handler:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  344     uint16 u16Status;
//  345 
//  346     switch(Setup_Pkt->bRequest)
        LDR.N    R0,??DataTable13_4
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+1]
        CMP      R0,#+0
        BEQ.N    ??USB_Endpoint_Setup_Handler_0
        CMP      R0,#+1
        BEQ.N    ??USB_Endpoint_Setup_Handler_1
        CMP      R0,#+3
        BEQ.N    ??USB_Endpoint_Setup_Handler_2
        B.N      ??USB_Endpoint_Setup_Handler_3
//  347     {
//  348     case GET_STATUS:
//  349         if(FLAG_CHK(Setup_Pkt->wIndex_h, gu8HALT_EP))
??USB_Endpoint_Setup_Handler_0:
        LDR.N    R0,??DataTable13_21
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+1
        LDR.N    R2,??DataTable13_4
        LDR      R2,[R2, #+0]
        LDRSB    R2,[R2, #+5]
        LSLS     R1,R1,R2
        TST      R0,R1
        BEQ.N    ??USB_Endpoint_Setup_Handler_4
//  350             u16Status = 0x0100;
        MOV      R0,#+256
        STRH     R0,[SP, #+0]
        B.N      ??USB_Endpoint_Setup_Handler_5
//  351         else
//  352             u16Status = 0x0000;
??USB_Endpoint_Setup_Handler_4:
        MOVS     R0,#+0
        STRH     R0,[SP, #+0]
//  353 
//  354         EP_IN_Transfer(EP0, (uint8 *)&u16Status, 2);
??USB_Endpoint_Setup_Handler_5:
        MOVS     R2,#+2
        ADD      R1,SP,#+0
        MOVS     R0,#+0
          CFI FunCall EP_IN_Transfer
        BL       EP_IN_Transfer
//  355         break;
        B.N      ??USB_Endpoint_Setup_Handler_6
//  356 
//  357     case CLEAR_FEATURE:
//  358         FLAG_CLR(Setup_Pkt->wIndex_h, gu8HALT_EP);
??USB_Endpoint_Setup_Handler_1:
        LDR.N    R0,??DataTable13_21
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+1
        LDR.N    R2,??DataTable13_4
        LDR      R2,[R2, #+0]
        LDRSB    R2,[R2, #+5]
        LSLS     R1,R1,R2
        BICS     R0,R0,R1
        LDR.N    R1,??DataTable13_21
        STRB     R0,[R1, #+0]
//  359         EP_IN_Transfer(EP0, 0, 0);
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall EP_IN_Transfer
        BL       EP_IN_Transfer
//  360         break;
        B.N      ??USB_Endpoint_Setup_Handler_6
//  361 
//  362     case SET_FEATURE:
//  363         FLAG_SET(Setup_Pkt->wIndex_h, gu8HALT_EP);
??USB_Endpoint_Setup_Handler_2:
        LDR.N    R0,??DataTable13_21
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+1
        LDR.N    R2,??DataTable13_4
        LDR      R2,[R2, #+0]
        LDRSB    R2,[R2, #+5]
        LSLS     R1,R1,R2
        ORRS     R0,R1,R0
        LDR.N    R1,??DataTable13_21
        STRB     R0,[R1, #+0]
//  364         EP_IN_Transfer(EP0, 0, 0);
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall EP_IN_Transfer
        BL       EP_IN_Transfer
//  365         break;
        B.N      ??USB_Endpoint_Setup_Handler_6
//  366 
//  367     default:
//  368         break;
//  369     }
//  370 }
??USB_Endpoint_Setup_Handler_3:
??USB_Endpoint_Setup_Handler_6:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock6
//  371 
//  372 /*!
//  373  *  @brief      USB 令牌中断 服务函数
//  374  *  @since      v5.0
//  375  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function USB_Handler
        THUMB
//  376 void USB_Handler(void)
//  377 {
USB_Handler:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
//  378     uint8 u8EndPoint;
//  379     uint8 u8IN;
//  380 
//  381     u8IN = USB0_STAT & 0x08;
        LDR.N    R0,??DataTable13_22  ;; 0x40072090
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0x8
        MOVS     R5,R0
//  382     u8EndPoint = USB0_STAT >> 4;
        LDR.N    R0,??DataTable13_22  ;; 0x40072090
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSRS     R0,R0,#+4
        MOVS     R4,R0
//  383 
//  384 
//  385     /* Data EndPoints */
//  386     if(u8EndPoint)
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??USB_Handler_0
//  387     {
//  388         if(!u8IN)
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BNE.N    ??USB_Handler_1
//  389         {
//  390             usbMCU_CONTROL(u8EndPoint);
        MOVS     R0,#+0
        LDR.N    R1,??DataTable13_6
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LSLS     R2,R4,#+2
        STRB     R0,[R1, R2, LSL #+3]
//  391             FLAG_SET(u8EndPoint, gu8USB_Flags);
        LDR.N    R0,??DataTable13_23
        LDRB     R0,[R0, #+0]
        MOVS     R1,#+1
        LSLS     R1,R1,R4
        ORRS     R0,R1,R0
        LDR.N    R1,??DataTable13_23
        STRB     R0,[R1, #+0]
        B.N      ??USB_Handler_1
//  392         }
//  393     }
//  394 
//  395     /* Control EndPoint */
//  396     else
//  397     {
//  398         if(u8IN)
??USB_Handler_0:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??USB_Handler_2
//  399             USB_EP0_IN_Handler();
          CFI FunCall USB_EP0_IN_Handler
        BL       USB_EP0_IN_Handler
        B.N      ??USB_Handler_1
//  400         else
//  401         {
//  402             if(tBDTtable[bEP0OUT_ODD].Stat.RecPid.PID == mSETUP_TOKEN)
??USB_Handler_2:
        LDR.N    R0,??DataTable13_6
        LDRB     R0,[R0, #+0]
        UBFX     R0,R0,#+2,#+4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+13
        BNE.N    ??USB_Handler_3
//  403                 USB_Setup_Handler();
          CFI FunCall USB_Setup_Handler
        BL       USB_Setup_Handler
        B.N      ??USB_Handler_1
//  404             else
//  405                 USB_EP0_OUT_Handler();
??USB_Handler_3:
          CFI FunCall USB_EP0_OUT_Handler
        BL       USB_EP0_OUT_Handler
//  406         }
//  407 
//  408     }
//  409 }
??USB_Handler_1:
        POP      {R0,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock7
//  410 
//  411 /*!
//  412  *  @brief      USB 端点 0 IN 服务函数(IN是相对主机而言)
//  413  *  @since      v5.0
//  414  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function USB_EP0_IN_Handler
        THUMB
//  415 void USB_EP0_IN_Handler(void)
//  416 {
USB_EP0_IN_Handler:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  417     if(gu8USB_State == uADDRESS)
        LDR.N    R0,??DataTable13_14
        LDRB     R0,[R0, #+0]
        CMP      R0,#+3
        BNE.N    ??USB_EP0_IN_Handler_0
//  418     {
//  419         USB0_ADDR = Setup_Pkt->wValue_l;
        LDR.N    R0,??DataTable13_4
        LDR      R0,[R0, #+0]
        LDRB     R0,[R0, #+2]
        LDR.N    R1,??DataTable13_24  ;; 0x40072098
        STRB     R0,[R1, #+0]
//  420         gu8USB_State = uREADY;
        MOVS     R0,#+4
        LDR.N    R1,??DataTable13_14
        STRB     R0,[R1, #+0]
//  421         FLAG_SET(fIN, gu8USBClearFlags);
        LDR.N    R0,??DataTable13_1
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable13_1
        STRB     R0,[R1, #+0]
//  422     }
//  423     EP_IN_Transfer(EP0, 0, 0);
??USB_EP0_IN_Handler_0:
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall EP_IN_Transfer
        BL       EP_IN_Transfer
//  424 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock8
//  425 
//  426 /*!
//  427  *  @brief      USB 端点 0 stall(传输失败)
//  428  *  @since      v5.0
//  429  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function USB_EP0_Stall
          CFI NoCalls
        THUMB
//  430 void USB_EP0_Stall(void)
//  431 {
//  432 
//  433     FLAG_SET(USB_ENDPT_EPSTALL_SHIFT, USB0_ENDPT0);
USB_EP0_Stall:
        LDR.N    R0,??DataTable13_25  ;; 0x400720c0
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.N    R1,??DataTable13_25  ;; 0x400720c0
        STRB     R0,[R1, #+0]
//  434     //ENDPT0_EP_STALL = 1;
//  435     tBDTtable[bEP0OUT_ODD].Stat._byte = kUDATA0;
        MOVS     R0,#+136
        LDR.N    R1,??DataTable13_6
        STRB     R0,[R1, #+0]
//  436     tBDTtable[bEP0OUT_ODD].Cnt = EP0_SIZE;
        MOVS     R0,#+64
        LDR.N    R1,??DataTable13_6
        STRH     R0,[R1, #+2]
//  437 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock9
//  438 
//  439 /*!
//  440  *  @brief      USB 端点 0 OUT 服务函数(OUT 是相对主机而言)
//  441  *  @since      v5.0
//  442  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function USB_EP0_OUT_Handler
          CFI NoCalls
        THUMB
//  443 void USB_EP0_OUT_Handler(void)
//  444 {
//  445     FLAG_SET(0, gu8USB_Flags);
USB_EP0_OUT_Handler:
        LDR.N    R0,??DataTable13_23
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable13_23
        STRB     R0,[R1, #+0]
//  446     //tBDTtable[bEP0OUT_ODD].Cnt = EP0_SIZE;
//  447     tBDTtable[bEP0OUT_ODD].Stat._byte = kUDATA0;
        MOVS     R0,#+136
        LDR.N    R1,??DataTable13_6
        STRB     R0,[R1, #+0]
//  448     //tBDTtable[bEP0IN].Stat._byte = kUDATA1;
//  449 
//  450 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock10
//  451 
//  452 /*!
//  453  *  @brief      USB stall 中断（传输失败）
//  454  *  @since      v5.0
//  455  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function USB_Stall_Handler
          CFI NoCalls
        THUMB
//  456 void USB_Stall_Handler(void)
//  457 {
//  458     if(FLAG_CHK(USB_ENDPT_EPSTALL_SHIFT, USB0_ENDPT0))
USB_Stall_Handler:
        LDR.N    R0,??DataTable13_25  ;; 0x400720c0
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+30
        BPL.N    ??USB_Stall_Handler_0
//  459         FLAG_CLR(USB_ENDPT_EPSTALL_SHIFT, USB0_ENDPT0);
        LDR.N    R0,??DataTable13_25  ;; 0x400720c0
        LDRB     R0,[R0, #+0]
        ANDS     R0,R0,#0xFD
        LDR.N    R1,??DataTable13_25  ;; 0x400720c0
        STRB     R0,[R1, #+0]
//  460     FLAG_SET(USB_ISTAT_STALL_SHIFT, USB0_ISTAT);
??USB_Stall_Handler_0:
        LDR.N    R0,??DataTable13_26  ;; 0x40072080
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x80
        LDR.N    R1,??DataTable13_26  ;; 0x40072080
        STRB     R0,[R1, #+0]
//  461 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock11
//  462 
//  463 /*!
//  464  *  @brief      USB 复位 中断服务函数
//  465  *  @since      v5.0
//  466  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function USB_Reset_Handler
          CFI NoCalls
        THUMB
//  467 void USB_Reset_Handler(void)
//  468 {
//  469     /* Software Flags */
//  470     gu8USBClearFlags = 0xFF;
USB_Reset_Handler:
        MOVS     R0,#+255
        LDR.N    R1,??DataTable13_1
        STRB     R0,[R1, #+0]
//  471     gu8USB_Toogle_flags = 0xFE;
        MOVS     R0,#+254
        LDR.N    R1,??DataTable13_7
        STRB     R0,[R1, #+0]
//  472 
//  473     /* Disable all data EP registers */
//  474     USB0_ENDPT1 = 0x00;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable13_8  ;; 0x400720c4
        STRB     R0,[R1, #+0]
//  475     USB0_ENDPT2 = 0x00;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable13_9  ;; 0x400720c8
        STRB     R0,[R1, #+0]
//  476     USB0_ENDPT3 = 0x00;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable13_10  ;; 0x400720cc
        STRB     R0,[R1, #+0]
//  477     USB0_ENDPT4 = 0x00;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable13_27  ;; 0x400720d0
        STRB     R0,[R1, #+0]
//  478     USB0_ENDPT5 = 0x00;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable13_28  ;; 0x400720d4
        STRB     R0,[R1, #+0]
//  479     USB0_ENDPT6 = 0x00;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable13_29  ;; 0x400720d8
        STRB     R0,[R1, #+0]
//  480 
//  481     /* EP0 BDT Setup */
//  482     // EP0 OUT BDT Settings
//  483     tBDTtable[bEP0OUT_ODD].Cnt = EP0_SIZE;
        MOVS     R0,#+64
        LDR.N    R1,??DataTable13_6
        STRH     R0,[R1, #+2]
//  484     tBDTtable[bEP0OUT_ODD].Addr = (uint32)gu8EP0_OUT_ODD_Buffer;
        LDR.N    R0,??DataTable13_30
        LDR.N    R1,??DataTable13_6
        STR      R0,[R1, #+4]
//  485     tBDTtable[bEP0OUT_ODD].Stat._byte = kUDATA1;
        MOVS     R0,#+200
        LDR.N    R1,??DataTable13_6
        STRB     R0,[R1, #+0]
//  486 
//  487     // EP0 OUT BDT Settings
//  488     tBDTtable[bEP0OUT_EVEN].Cnt = EP0_SIZE;
        MOVS     R0,#+64
        LDR.N    R1,??DataTable13_6
        STRH     R0,[R1, #+10]
//  489     tBDTtable[bEP0OUT_EVEN].Addr = (uint32)gu8EP0_OUT_EVEN_Buffer;
        LDR.N    R0,??DataTable13_31
        LDR.N    R1,??DataTable13_6
        STR      R0,[R1, #+12]
//  490     tBDTtable[bEP0OUT_EVEN].Stat._byte = kUDATA1;
        MOVS     R0,#+200
        LDR.N    R1,??DataTable13_6
        STRB     R0,[R1, #+8]
//  491 
//  492     // EP0 IN BDT Settings
//  493     tBDTtable[bEP0IN_ODD].Cnt = EP0_SIZE;
        MOVS     R0,#+64
        LDR.N    R1,??DataTable13_6
        STRH     R0,[R1, #+18]
//  494     tBDTtable[bEP0IN_ODD].Addr = (uint32)gu8EP0_IN_ODD_Buffer;
        LDR.N    R0,??DataTable13_32
        LDR.N    R1,??DataTable13_6
        STR      R0,[R1, #+20]
//  495     tBDTtable[bEP0IN_ODD].Stat._byte = kUDATA0;
        MOVS     R0,#+136
        LDR.N    R1,??DataTable13_6
        STRB     R0,[R1, #+16]
//  496 
//  497     // EP0 IN BDT Settings
//  498     tBDTtable[bEP0IN_EVEN].Cnt = (EP0_SIZE);
        MOVS     R0,#+64
        LDR.N    R1,??DataTable13_6
        STRH     R0,[R1, #+26]
//  499     tBDTtable[bEP0IN_EVEN].Addr = (uint32)gu8EP0_IN_EVEN_Buffer;
        LDR.N    R0,??DataTable13_33
        LDR.N    R1,??DataTable13_6
        STR      R0,[R1, #+28]
//  500     tBDTtable[bEP0IN_EVEN].Stat._byte = kUDATA0;
        MOVS     R0,#+136
        LDR.N    R1,??DataTable13_6
        STRB     R0,[R1, #+24]
//  501 
//  502     // Enable EP0
//  503     USB0_ENDPT0 = 0x0D;
        MOVS     R0,#+13
        LDR.N    R1,??DataTable13_25  ;; 0x400720c0
        STRB     R0,[R1, #+0]
//  504 
//  505     // Clear all Error flags
//  506     USB0_ERRSTAT = 0xFF;
        MOVS     R0,#+255
        LDR.N    R1,??DataTable13_34  ;; 0x40072088
        STRB     R0,[R1, #+0]
//  507 
//  508     // CLear all USB ISR flags
//  509     USB0_ISTAT = 0xFF;
        MOVS     R0,#+255
        LDR.N    R1,??DataTable13_26  ;; 0x40072080
        STRB     R0,[R1, #+0]
//  510 
//  511     // Set default Address
//  512     USB0_ADDR = 0x00;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable13_24  ;; 0x40072098
        STRB     R0,[R1, #+0]
//  513 
//  514     // Enable all error sources
//  515     USB0_ERREN = 0xFF;
        MOVS     R0,#+255
        LDR.N    R1,??DataTable13_35  ;; 0x4007208c
        STRB     R0,[R1, #+0]
//  516 
//  517     // USB Interrupt Enablers
//  518     FLAG_SET(USB_INTEN_TOKDNEEN_SHIFT, USB0_INTEN);
        LDR.N    R0,??DataTable13_36  ;; 0x40072084
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.N    R1,??DataTable13_36  ;; 0x40072084
        STRB     R0,[R1, #+0]
//  519     FLAG_SET(USB_INTEN_SOFTOKEN_SHIFT, USB0_INTEN);
        LDR.N    R0,??DataTable13_36  ;; 0x40072084
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.N    R1,??DataTable13_36  ;; 0x40072084
        STRB     R0,[R1, #+0]
//  520     FLAG_SET(USB_INTEN_ERROREN_SHIFT, USB0_INTEN);
        LDR.N    R0,??DataTable13_36  ;; 0x40072084
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.N    R1,??DataTable13_36  ;; 0x40072084
        STRB     R0,[R1, #+0]
//  521     FLAG_SET(USB_INTEN_USBRSTEN_SHIFT, USB0_INTEN);
        LDR.N    R0,??DataTable13_36  ;; 0x40072084
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable13_36  ;; 0x40072084
        STRB     R0,[R1, #+0]
//  522 }
        BX       LR               ;; return
          CFI EndBlock cfiBlock12
//  523 
//  524 
//  525 /*!
//  526  *  @brief      USB 总的 中断服务函数
//  527  *  @since      v5.0
//  528  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock13 Using cfiCommon0
          CFI Function USB_ISR
        THUMB
//  529 void USB_ISR(void)
//  530 {
USB_ISR:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  531 
//  532     if(FLAG_CHK(USB_ISTAT_USBRST_SHIFT, USB0_ISTAT))
        LDR.N    R0,??DataTable13_26  ;; 0x40072080
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+31
        BPL.N    ??USB_ISR_0
//  533     {
//  534 
//  535         USB_Reset_Handler();
          CFI FunCall USB_Reset_Handler
        BL       USB_Reset_Handler
//  536 
//  537         return;
        B.N      ??USB_ISR_1
//  538     }
//  539 
//  540 
//  541     if(FLAG_CHK(USB_ISTAT_SOFTOK_SHIFT, USB0_ISTAT))
??USB_ISR_0:
        LDR.N    R0,??DataTable13_26  ;; 0x40072080
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+29
        BPL.N    ??USB_ISR_2
//  542     {
//  543         USB0_ISTAT = USB_ISTAT_SOFTOK_MASK;
        MOVS     R0,#+4
        LDR.N    R1,??DataTable13_26  ;; 0x40072080
        STRB     R0,[R1, #+0]
//  544     }
//  545 
//  546 
//  547 
//  548     if(FLAG_CHK(USB_ISTAT_STALL_SHIFT, USB0_ISTAT))
??USB_ISR_2:
        LDR.N    R0,??DataTable13_26  ;; 0x40072080
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+24
        BPL.N    ??USB_ISR_3
//  549     {
//  550         USB_Stall_Handler();
          CFI FunCall USB_Stall_Handler
        BL       USB_Stall_Handler
//  551     }
//  552 
//  553 
//  554     if(FLAG_CHK(USB_ISTAT_TOKDNE_SHIFT, USB0_ISTAT))
??USB_ISR_3:
        LDR.N    R0,??DataTable13_26  ;; 0x40072080
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+28
        BPL.N    ??USB_ISR_4
//  555     {
//  556 
//  557         FLAG_SET(USB_CTL_ODDRST_SHIFT, USB0_CTL);
        LDR.N    R0,??DataTable13_20  ;; 0x40072094
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.N    R1,??DataTable13_20  ;; 0x40072094
        STRB     R0,[R1, #+0]
//  558         USB_Handler();
          CFI FunCall USB_Handler
        BL       USB_Handler
//  559         FLAG_SET(USB_ISTAT_TOKDNE_SHIFT, USB0_ISTAT);
        LDR.N    R0,??DataTable13_26  ;; 0x40072080
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x8
        LDR.N    R1,??DataTable13_26  ;; 0x40072080
        STRB     R0,[R1, #+0]
//  560     }
//  561 
//  562 
//  563     if(FLAG_CHK(USB_ISTAT_SLEEP_SHIFT, USB0_ISTAT))
??USB_ISR_4:
        LDR.N    R0,??DataTable13_26  ;; 0x40072080
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+27
        BPL.N    ??USB_ISR_5
//  564     {
//  565         FLAG_SET(USB_ISTAT_SLEEP_SHIFT, USB0_ISTAT);
        LDR.N    R0,??DataTable13_26  ;; 0x40072080
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x10
        LDR.N    R1,??DataTable13_26  ;; 0x40072080
        STRB     R0,[R1, #+0]
//  566 
//  567     }
//  568 
//  569     if(FLAG_CHK(USB_ISTAT_ERROR_SHIFT, USB0_ISTAT))
??USB_ISR_5:
        LDR.N    R0,??DataTable13_26  ;; 0x40072080
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+30
        BPL.N    ??USB_ISR_6
//  570     {
//  571         FLAG_CHK(USB_ISTAT_ERROR_SHIFT, USB0_ISTAT);
        LDR.N    R0,??DataTable13_26  ;; 0x40072080
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ANDS     R0,R0,#0x2
//  572         DEBUG_PRINTF("\nUSB Error\n");
        LDR.N    R0,??DataTable13_37
          CFI FunCall printf
        BL       printf
//  573     }
//  574 }
??USB_ISR_6:
??USB_ISR_1:
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock13

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13:
        DC32     BufferPointer

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_1:
        DC32     gu8USBClearFlags

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_2:
        DC32     pu8IN_DataPointer

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_3:
        DC32     gu8IN_Counter

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_4:
        DC32     Setup_Pkt

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_5:
        DC32     cEP_Size

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_6:
        DC32     tBDTtable

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_7:
        DC32     gu8USB_Toogle_flags

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_8:
        DC32     0x400720c4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_9:
        DC32     0x400720c8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_10:
        DC32     0x400720cc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_11:
        DC32     gu8EP1_IN_ODD_Buffer

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_12:
        DC32     gu8EP2_IN_ODD_Buffer

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_13:
        DC32     gu8EP3_OUT_ODD_Buffer

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_14:
        DC32     gu8USB_State

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_15:
        DC32     Device_Descriptor

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_16:
        DC32     Configuration_Descriptor

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_17:
        DC32     String_Table

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_18:
        DC32     gu8Dummy

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_19:
        DC32     gu8Status

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_20:
        DC32     0x40072094

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_21:
        DC32     gu8HALT_EP

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_22:
        DC32     0x40072090

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_23:
        DC32     gu8USB_Flags

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_24:
        DC32     0x40072098

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_25:
        DC32     0x400720c0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_26:
        DC32     0x40072080

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_27:
        DC32     0x400720d0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_28:
        DC32     0x400720d4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_29:
        DC32     0x400720d8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_30:
        DC32     gu8EP0_OUT_ODD_Buffer

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_31:
        DC32     gu8EP0_OUT_EVEN_Buffer

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_32:
        DC32     gu8EP0_IN_ODD_Buffer

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_33:
        DC32     gu8EP0_IN_EVEN_Buffer

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_34:
        DC32     0x40072088

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_35:
        DC32     0x4007208c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_36:
        DC32     0x40072084

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_37:
        DC32     ?_0

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  575 
// 
// 1 170 bytes in section .bss
//    80 bytes in section .data
//   180 bytes in section .rodata
// 1 820 bytes in section .text
// 
// 1 820 bytes of CODE  memory
//   180 bytes of CONST memory
// 1 250 bytes of DATA  memory
//
//Errors: none
//Warnings: 1
