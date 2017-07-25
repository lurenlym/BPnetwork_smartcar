///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       21/Mar/2017  16:05:20
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\znc\project\K60FN\network_car\Board\src\VCAN_BMP.c
//    Command line =  
//        E:\znc\project\K60FN\network_car\Board\src\VCAN_BMP.c -D DEBUG -D
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
//        E:\znc\project\K60FN\network_car\Prj\IAR\FN15_Debug\List\VCAN_BMP.s
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

        EXTERN LCD_ST7735R_ptlon
        EXTERN __aeabi_memclr4
        EXTERN f_close
        EXTERN f_lseek
        EXTERN f_mount
        EXTERN f_open
        EXTERN f_read
        EXTERN printf

        PUBLIC BMP_Buffer
        PUBLIC SD2LCD_BMP
        
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
        
// E:\znc\project\K60FN\network_car\Board\src\VCAN_BMP.c
//    1 //支持24bit BMP图片显示
//    2 #include "common.h"
//    3 #include "VCAN_BMP.h"
//    4 #include "ff.h"
//    5 #include "vcan_lcd.h"
//    6 
//    7 
//    8 #define BMP_SIZE(W,H)           ((((W)*4+3)/4)*(H))         //((w * 4)+3)/4  是 为了 进 1 ，因为 bmp 宽度 是 4 个 倍数
//    9 #define BMP_BYTECNT(W,H,BIT)    (BMP_SIZE(W,H)*BIT/8)
//   10 
//   11 #define MAX_BMP_SIZE            BMP_SIZE(MAX_BMP_W,MAX_BMP_H)
//   12 #define MAX_BMP_BYTECNT         BMP_BYTECNT(MAX_BMP_W,MAX_BMP_H,MAX_BMP_BIT)
//   13 
//   14 #define BMP_LINE_BYTE(W,BIT)    ((((W)*(BIT)+31)/32)*4)
//   15 #define MAX_BMP_LINE_BYTE       BMP_LINE_BYTE(MAX_BMP_W,MAX_BMP_BIT)
//   16 
//   17 
//   18 
//   19 //BMP一行图像

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   20 uint8 BMP_Buffer[MAX_BMP_LINE_BYTE];
BMP_Buffer:
        DS8 960
//   21 
//   22 

        SECTION `.text`:CODE:NOROOT(2)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function SD2LCD_BMP
        THUMB
//   23 int8 SD2LCD_BMP(char *file,Site_t site0)
//   24 {
SD2LCD_BMP:
        PUSH     {R0,R1,R4-R11,LR}
          CFI R14 Frame(CFA, -4)
          CFI R11 Frame(CFA, -8)
          CFI R10 Frame(CFA, -12)
          CFI R9 Frame(CFA, -16)
          CFI R8 Frame(CFA, -20)
          CFI R7 Frame(CFA, -24)
          CFI R6 Frame(CFA, -28)
          CFI R5 Frame(CFA, -32)
          CFI R4 Frame(CFA, -36)
          CFI CFA R13+44
        SUBW     SP,SP,#+1196
          CFI CFA R13+1240
//   25     //文件系统相关的 变量
//   26     FATFS fs={0};
        ADD      R0,SP,#+636
        MOV      R1,#+560
          CFI FunCall __aeabi_memclr4
        BL       __aeabi_memclr4
//   27     FIL fsrc={0};   
        ADD      R0,SP,#+88
        MOV      R1,#+548
          CFI FunCall __aeabi_memclr4
        BL       __aeabi_memclr4
//   28     FRESULT res;
//   29     uint32 br;    
//   30 
//   31     
//   32     BMP_FILEHEADER BmpHead;
//   33 
//   34     int Width,Height ;
//   35     uint32 OffBits,Bitcnt ;
//   36 
//   37 
//   38 
//   39     uint8 r,g,b ;
//   40     uint16 rgb;
//   41 
//   42     Size_t size;
//   43     Site_t site;
//   44 
//   45     int x=0,y=0,BytesPerLine,Step ;
        MOVS     R8,#+0
        MOVS     R9,#+0
//   46 
//   47     uint8 *pColor;
//   48 
//   49 
//   50     f_mount(0,&fs);
        ADD      R1,SP,#+636
        MOVS     R0,#+0
          CFI FunCall f_mount
        BL       f_mount
//   51 
//   52     //打开文件
//   53     res=f_open(&fsrc,file,FA_OPEN_EXISTING | FA_READ);
        MOVS     R2,#+1
        LDR      R1,[SP, #+1196]
        ADD      R0,SP,#+88
          CFI FunCall f_open
        BL       f_open
        MOVS     R4,R0
//   54     if(res)
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.W    ??SD2LCD_BMP_0
//   55     {
//   56         goto bmp_exit_false;
//   57     }
//   58 
//   59     //读取BMP 头部文件
//   60     res=f_read(&fsrc,&BmpHead,sizeof(BmpHead),&br);
??SD2LCD_BMP_1:
        ADD      R3,SP,#+16
        MOVS     R2,#+54
        ADD      R1,SP,#+32
        ADD      R0,SP,#+88
          CFI FunCall f_read
        BL       f_read
        MOVS     R4,R0
//   61     if(res)
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.W    ??SD2LCD_BMP_0
//   62     {
//   63         goto bmp_exit_false;
//   64     }
//   65 
//   66     Width       = BmpHead.biWidth;
??SD2LCD_BMP_2:
        LDR      R0,[SP, #+50]
        MOVS     R5,R0
//   67     Height      = BmpHead.biHeight;
        LDR      R0,[SP, #+54]
        MOV      R10,R0
//   68     OffBits     = BmpHead.bfOffBits;        //bmp颜色数据起始位置
        LDR      R0,[SP, #+42]
        STR      R0,[SP, #+24]
//   69     Bitcnt      = BmpHead.biBitCount;
        LDRH     R0,[SP, #+60]
        STR      R0,[SP, #+28]
//   70 
//   71     if((BmpHead.bfType != 0x4d42)||(BmpHead.biCompression))           //'BM' 和  没压缩
        LDRH     R0,[SP, #+32]
        MOVW     R1,#+19778
        CMP      R0,R1
        BNE.N    ??SD2LCD_BMP_3
        LDR      R0,[SP, #+62]
        CMP      R0,#+0
        BEQ.N    ??SD2LCD_BMP_4
//   72     {
//   73         DEBUG_PRINTF("\r\n不支持该图片显示！");
??SD2LCD_BMP_3:
        LDR.W    R0,??SD2LCD_BMP_5
          CFI FunCall printf
        BL       printf
//   74         goto bmp_exit_false;
        B.N      ??SD2LCD_BMP_0
//   75     }
//   76 
//   77     if(Width > MAX_BMP_W)                   //图片宽度不能超过MAX_BMP_W
??SD2LCD_BMP_4:
        CMP      R5,#+320
        BLE.N    ??SD2LCD_BMP_6
//   78     {
//   79         DEBUG_PRINTF("\r\n图片太大，无法显示！");
        LDR.W    R0,??SD2LCD_BMP_5+0x4
          CFI FunCall printf
        BL       printf
//   80         goto bmp_exit_false;
        B.N      ??SD2LCD_BMP_0
//   81     }
//   82 
//   83     if(Height>0)                            //如果高度是 正数，图像从左下角往上读数据
??SD2LCD_BMP_6:
        CMP      R10,#+1
        BLT.N    ??SD2LCD_BMP_7
//   84     {
//   85         y = Height -1;
        SUBS     R0,R10,#+1
        MOV      R9,R0
//   86         Step = -1;
        MOVS     R0,#-1
        MOVS     R7,R0
        B.N      ??SD2LCD_BMP_8
//   87     }
//   88     else if(Height < 0)                     //如果高度是 负数，图像从左上角往下读数据
??SD2LCD_BMP_7:
        CMP      R10,#+0
        BPL.N    ??SD2LCD_BMP_9
//   89     {
//   90         Height = -Height;
        RSBS     R10,R10,#+0
//   91         y = 0;
        MOVS     R0,#+0
        MOV      R9,R0
//   92         Step = 1;
        MOVS     R0,#+1
        MOVS     R7,R0
        B.N      ??SD2LCD_BMP_8
//   93     }
//   94     else
//   95     {
//   96         goto bmp_exit_false;
??SD2LCD_BMP_9:
        B.N      ??SD2LCD_BMP_0
//   97     }
//   98 
//   99     //一行一行读取
//  100     size.H = 1;
??SD2LCD_BMP_8:
        MOVS     R0,#+1
        STRH     R0,[SP, #+14]
//  101     size.W = Width;
        MOVS     R0,R5
        STRH     R0,[SP, #+12]
//  102     site.x = site0.x;
        LDRH     R0,[SP, #+1200]
        STRH     R0,[SP, #+8]
//  103     BytesPerLine = BMP_LINE_BYTE(Width,Bitcnt);       //一行的数目
        LDR      R0,[SP, #+28]
        MUL      R0,R0,R5
        ADDS     R0,R0,#+31
        LSRS     R0,R0,#+5
        LSLS     R0,R0,#+2
        STR      R0,[SP, #+20]
//  104 
//  105     switch(Bitcnt)
        LDR      R0,[SP, #+28]
        CMP      R0,#+1
        BEQ.W    ??SD2LCD_BMP_10
        CMP      R0,#+16
        BEQ.W    ??SD2LCD_BMP_11
        CMP      R0,#+24
        BNE.W    ??SD2LCD_BMP_12
//  106     {
//  107         case 24:        //24位真彩色 :BGR24
//  108         {
//  109             //开始画图
//  110             res=f_lseek(&fsrc,OffBits); //找到bmp颜色数据起始位置
??SD2LCD_BMP_13:
        LDR      R1,[SP, #+24]
        ADD      R0,SP,#+88
          CFI FunCall f_lseek
        BL       f_lseek
        MOVS     R4,R0
//  111 
//  112             for(;(y<Height)&&(y>=0);y+=Step)
??SD2LCD_BMP_14:
        CMP      R9,R10
        BGE.W    ??SD2LCD_BMP_15
        CMP      R9,#+0
        BMI.W    ??SD2LCD_BMP_15
//  113             {
//  114                 res=f_read(&fsrc,BMP_Buffer,BytesPerLine,&br);
        ADD      R3,SP,#+16
        LDR      R2,[SP, #+20]
        LDR.W    R1,??SD2LCD_BMP_5+0x8
        ADD      R0,SP,#+88
          CFI FunCall f_read
        BL       f_read
        MOVS     R4,R0
//  115                 if(res) goto bmp_exit_false;
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.W    ??SD2LCD_BMP_0
//  116                 pColor = BMP_Buffer;
??SD2LCD_BMP_16:
        LDR.W    R0,??SD2LCD_BMP_5+0x8
        MOV      R11,R0
//  117 
//  118                 //由于调用液晶顶层接口效率不高，这里直接调用底层
//  119                 site.y = site0.y +y;
        LDRH     R0,[SP, #+1202]
        ADDS     R0,R9,R0
        STRH     R0,[SP, #+10]
//  120                 LCD_PTLON(site, size);              //开窗
        LDR      R1,[SP, #+12]
        LDR      R0,[SP, #+8]
          CFI FunCall LCD_ST7735R_ptlon
        BL       LCD_ST7735R_ptlon
//  121                 LCD_RAMWR();                        //写内存
        MOVS     R0,#+1
        LDR.W    R1,??SD2LCD_BMP_5+0xC  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??SD2LCD_BMP_5+0x10  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??SD2LCD_BMP_5+0x14  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+44
        LDR.W    R1,??SD2LCD_BMP_5+0x18  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??SD2LCD_BMP_5+0x1C  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??SD2LCD_BMP_5+0x1C  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??SD2LCD_BMP_5+0x14  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  122 
//  123                 for(x=0;x<Width;x++)
        MOVS     R0,#+0
        MOV      R8,R0
??SD2LCD_BMP_17:
        CMP      R8,R5
        BGE.N    ??SD2LCD_BMP_18
//  124                 {
//  125                     //BGR24
//  126                     b=*pColor++;
        LDRB     R0,[R11, #+0]
        STRB     R0,[SP, #+4]
        ADDS     R11,R11,#+1
//  127                     g=*pColor++;
        LDRB     R0,[R11, #+0]
        STRB     R0,[SP, #+5]
        ADDS     R11,R11,#+1
//  128                     r=*pColor++;
        LDRB     R0,[R11, #+0]
        STRB     R0,[SP, #+6]
        ADDS     R11,R11,#+1
//  129 
//  130                     rgb = RGB24_RGB565(r,g,b);
        LDRB     R0,[SP, #+6]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSRS     R0,R0,#+3
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDRB     R1,[SP, #+5]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSRS     R1,R1,#+2
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSLS     R1,R1,#+5
        ORRS     R0,R1,R0, LSL #+11
        LDRB     R1,[SP, #+4]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSRS     R1,R1,#+3
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ORRS     R0,R1,R0
        MOVS     R6,R0
//  131                     LCD_WR_DATA( rgb);
        MOVS     R0,#+1
        LDR.W    R1,??SD2LCD_BMP_5+0xC  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??SD2LCD_BMP_5+0x10  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??SD2LCD_BMP_5+0x14  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        LSRS     R0,R6,#+8
        LDR.W    R1,??SD2LCD_BMP_5+0x18  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??SD2LCD_BMP_5+0x1C  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??SD2LCD_BMP_5+0x1C  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??SD2LCD_BMP_5+0x14  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??SD2LCD_BMP_5+0xC  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??SD2LCD_BMP_5+0x10  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??SD2LCD_BMP_5+0x14  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        LDR.W    R0,??SD2LCD_BMP_5+0x18  ;; 0x400ff080
        STRB     R6,[R0, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??SD2LCD_BMP_5+0x1C  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??SD2LCD_BMP_5+0x1C  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??SD2LCD_BMP_5+0x14  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  132                 }
        ADDS     R8,R8,#+1
        B.N      ??SD2LCD_BMP_17
//  133             }
??SD2LCD_BMP_18:
        ADDS     R9,R7,R9
        B.N      ??SD2LCD_BMP_14
//  134             break;
??SD2LCD_BMP_15:
        B.N      ??SD2LCD_BMP_19
//  135 
//  136         }
//  137 
//  138         //16位中，最低的5位表示蓝色分量，中间的5位表示绿色分量，高的5位表示红色分量，一共占用了15位，最高的一位保留，设为0。这种格式也被称作555 16位位图。
//  139         //如果是 RBG565 ,那么 biCompression = BI_BITFIELDS ，
//  140         case 16:        //16位高彩色
//  141         {
//  142             //开始画图
//  143             res=f_lseek(&fsrc,OffBits); //找到bmp颜色数据起始位置
??SD2LCD_BMP_11:
        LDR      R1,[SP, #+24]
        ADD      R0,SP,#+88
          CFI FunCall f_lseek
        BL       f_lseek
        MOVS     R4,R0
//  144 
//  145             for(;(y<Height)&&(y>=0);y+=Step)
??SD2LCD_BMP_20:
        CMP      R9,R10
        BGE.W    ??SD2LCD_BMP_21
        CMP      R9,#+0
        BMI.W    ??SD2LCD_BMP_21
//  146             {
//  147                 res=f_read(&fsrc,BMP_Buffer,BytesPerLine,&br);
        ADD      R3,SP,#+16
        LDR      R2,[SP, #+20]
        LDR.W    R1,??SD2LCD_BMP_5+0x8
        ADD      R0,SP,#+88
          CFI FunCall f_read
        BL       f_read
        MOVS     R4,R0
//  148                 if(res)goto bmp_exit_false;
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.W    ??SD2LCD_BMP_0
//  149                 pColor = BMP_Buffer;
??SD2LCD_BMP_22:
        LDR.W    R0,??SD2LCD_BMP_5+0x8
        MOV      R11,R0
//  150 
//  151                 //由于调用液晶顶层接口效率不高，这里直接调用底层
//  152                 site.y = site0.y +y;
        LDRH     R0,[SP, #+1202]
        ADDS     R0,R9,R0
        STRH     R0,[SP, #+10]
//  153                 LCD_PTLON(site, size);              //开窗
        LDR      R1,[SP, #+12]
        LDR      R0,[SP, #+8]
          CFI FunCall LCD_ST7735R_ptlon
        BL       LCD_ST7735R_ptlon
//  154                 LCD_RAMWR();                        //写内存
        MOVS     R0,#+1
        LDR.W    R1,??SD2LCD_BMP_5+0xC  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??SD2LCD_BMP_5+0x10  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??SD2LCD_BMP_5+0x14  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+44
        LDR.W    R1,??SD2LCD_BMP_5+0x18  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??SD2LCD_BMP_5+0x1C  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??SD2LCD_BMP_5+0x1C  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??SD2LCD_BMP_5+0x14  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  155 
//  156                 for(x=0;x<Width;x++)
        MOVS     R0,#+0
        MOV      R8,R0
??SD2LCD_BMP_23:
        CMP      R8,R5
        BGE.N    ??SD2LCD_BMP_24
//  157                 {
//  158                     rgb = *(uint16 *)pColor;    //bgr555
        LDRH     R0,[R11, #+0]
        MOVS     R6,R0
//  159                     rgb = RGB555_RGB565(rgb);
        UBFX     R0,R6,#+5,#+10
        ANDS     R1,R6,#0x1F
        ORRS     R6,R1,R0, LSL #+6
//  160 
//  161                     LCD_WR_DATA( rgb);
        MOVS     R0,#+1
        LDR.W    R1,??SD2LCD_BMP_5+0xC  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??SD2LCD_BMP_5+0x10  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??SD2LCD_BMP_5+0x14  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        LSRS     R0,R6,#+8
        LDR.W    R1,??SD2LCD_BMP_5+0x18  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??SD2LCD_BMP_5+0x1C  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??SD2LCD_BMP_5+0x1C  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??SD2LCD_BMP_5+0x14  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??SD2LCD_BMP_5+0xC  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??SD2LCD_BMP_5+0x10  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??SD2LCD_BMP_5+0x14  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        LDR.W    R0,??SD2LCD_BMP_5+0x18  ;; 0x400ff080
        STRB     R6,[R0, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??SD2LCD_BMP_5+0x1C  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??SD2LCD_BMP_5+0x1C  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??SD2LCD_BMP_5+0x14  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  162 
//  163                     pColor+=2;
        ADDS     R11,R11,#+2
//  164                 }
        ADDS     R8,R8,#+1
        B.N      ??SD2LCD_BMP_23
//  165             }
??SD2LCD_BMP_24:
        ADDS     R9,R7,R9
        B.N      ??SD2LCD_BMP_20
//  166             break;
??SD2LCD_BMP_21:
        B.N      ??SD2LCD_BMP_19
//  167         }
//  168 
//  169         //单色BMP，文件后头，还有2个RGBQUAD的调色板颜色，表示 0 和 1 分别对应的颜色。
//  170         //一般是 0为黑 ， 1 为 白
//  171         case 1:         //单色
//  172         {
//  173             //读完文件头后，马上读 调试板
//  174             res=f_read(&fsrc,BMP_Buffer,2*sizeof(RGBQUAD),&br);
??SD2LCD_BMP_10:
        ADD      R3,SP,#+16
        MOVS     R2,#+8
        LDR.W    R1,??SD2LCD_BMP_5+0x8
        ADD      R0,SP,#+88
          CFI FunCall f_read
        BL       f_read
        MOVS     R4,R0
//  175             uint16 color[2];
//  176             color[0] = RGB24_RGB565(BMP_Buffer[2],BMP_Buffer[1],BMP_Buffer[0]);
        LDR.W    R0,??SD2LCD_BMP_5+0x8
        LDRB     R0,[R0, #+2]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSRS     R0,R0,#+3
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R1,??SD2LCD_BMP_5+0x8
        LDRB     R1,[R1, #+1]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSRS     R1,R1,#+2
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSLS     R1,R1,#+5
        ORRS     R0,R1,R0, LSL #+11
        LDR.W    R1,??SD2LCD_BMP_5+0x8
        LDRB     R1,[R1, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSRS     R1,R1,#+3
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ORRS     R0,R1,R0
        STRH     R0,[SP, #+0]
//  177             color[1] = RGB24_RGB565(BMP_Buffer[6],BMP_Buffer[5],BMP_Buffer[4]);
        LDR.W    R0,??SD2LCD_BMP_5+0x8
        LDRB     R0,[R0, #+6]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LSRS     R0,R0,#+3
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R1,??SD2LCD_BMP_5+0x8
        LDRB     R1,[R1, #+5]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSRS     R1,R1,#+2
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSLS     R1,R1,#+5
        ORRS     R0,R1,R0, LSL #+11
        LDR.W    R1,??SD2LCD_BMP_5+0x8
        LDRB     R1,[R1, #+4]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSRS     R1,R1,#+3
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ORRS     R0,R1,R0
        STRH     R0,[SP, #+2]
//  178 
//  179             //开始画图
//  180             res=f_lseek(&fsrc,OffBits);         //找到bmp颜色数据起始位置
        LDR      R1,[SP, #+24]
        ADD      R0,SP,#+88
          CFI FunCall f_lseek
        BL       f_lseek
        MOVS     R4,R0
//  181 
//  182             Width = (Width+7)/8;                //8个像素一个点(+7是进1)
        ADDS     R0,R5,#+7
        MOVS     R1,#+8
        SDIV     R5,R0,R1
//  183 
//  184             for(;(y<Height)&&(y>=0);y+=Step)
??SD2LCD_BMP_25:
        CMP      R9,R10
        BGE.W    ??SD2LCD_BMP_26
        CMP      R9,#+0
        BMI.W    ??SD2LCD_BMP_26
//  185             {
//  186                 res=f_read(&fsrc,BMP_Buffer,BytesPerLine,&br);
        ADD      R3,SP,#+16
        LDR      R2,[SP, #+20]
        LDR.W    R1,??SD2LCD_BMP_5+0x8
        ADD      R0,SP,#+88
          CFI FunCall f_read
        BL       f_read
        MOVS     R4,R0
//  187                 if(res)goto bmp_exit_false;
        SXTB     R4,R4            ;; SignExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BNE.W    ??SD2LCD_BMP_0
//  188                 pColor = BMP_Buffer;
??SD2LCD_BMP_27:
        LDR.W    R0,??SD2LCD_BMP_5+0x8
        MOV      R11,R0
//  189 
//  190                 //由于调用液晶顶层接口效率不高，这里直接调用底层
//  191                 site.y = site0.y +y;
        LDRH     R0,[SP, #+1202]
        ADDS     R0,R9,R0
        STRH     R0,[SP, #+10]
//  192                 LCD_PTLON(site, size);              //开窗
        LDR      R1,[SP, #+12]
        LDR      R0,[SP, #+8]
          CFI FunCall LCD_ST7735R_ptlon
        BL       LCD_ST7735R_ptlon
//  193                 LCD_RAMWR();                        //写内存
        MOVS     R0,#+1
        LDR.W    R1,??SD2LCD_BMP_5+0xC  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??SD2LCD_BMP_5+0x10  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??SD2LCD_BMP_5+0x14  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+44
        LDR.W    R1,??SD2LCD_BMP_5+0x18  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??SD2LCD_BMP_5+0x1C  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??SD2LCD_BMP_5+0x1C  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??SD2LCD_BMP_5+0x14  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  194 
//  195                 for(x=0;x<Width;x++)
        MOVS     R0,#+0
        MOV      R8,R0
??SD2LCD_BMP_28:
        CMP      R8,R5
        BGE.W    ??SD2LCD_BMP_29
//  196                 {
//  197                     rgb = color[(*pColor >> 7)&0x01];
        ADD      R0,SP,#+0
        LDRB     R1,[R11, #+0]
        ASRS     R1,R1,#+7
        LDRH     R0,[R0, R1, LSL #+1]
        MOVS     R6,R0
//  198                     LCD_WR_DATA( rgb);
        MOVS     R0,#+1
        LDR.W    R1,??SD2LCD_BMP_5+0xC  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??SD2LCD_BMP_5+0x10  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??SD2LCD_BMP_5+0x14  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        LSRS     R0,R6,#+8
        LDR.W    R1,??SD2LCD_BMP_5+0x18  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??SD2LCD_BMP_5+0x1C  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??SD2LCD_BMP_5+0x1C  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??SD2LCD_BMP_5+0x14  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??SD2LCD_BMP_5+0xC  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??SD2LCD_BMP_5+0x10  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??SD2LCD_BMP_5+0x14  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        LDR.W    R0,??SD2LCD_BMP_5+0x18  ;; 0x400ff080
        STRB     R6,[R0, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??SD2LCD_BMP_5+0x1C  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??SD2LCD_BMP_5+0x1C  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??SD2LCD_BMP_5+0x14  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  199                     rgb = color[(*pColor >> 6)&0x01];
        ADD      R0,SP,#+0
        LDRB     R1,[R11, #+0]
        UBFX     R1,R1,#+6,#+1
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDRH     R0,[R0, R1, LSL #+1]
        MOVS     R6,R0
//  200                     LCD_WR_DATA( rgb);
        MOVS     R0,#+1
        LDR.N    R1,??SD2LCD_BMP_5+0xC  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??SD2LCD_BMP_5+0x10  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??SD2LCD_BMP_5+0x14  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        LSRS     R0,R6,#+8
        LDR.N    R1,??SD2LCD_BMP_5+0x18  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??SD2LCD_BMP_5+0x1C  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??SD2LCD_BMP_5+0x1C  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??SD2LCD_BMP_5+0x14  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??SD2LCD_BMP_5+0xC  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??SD2LCD_BMP_5+0x10  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??SD2LCD_BMP_5+0x14  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        LDR.N    R0,??SD2LCD_BMP_5+0x18  ;; 0x400ff080
        STRB     R6,[R0, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??SD2LCD_BMP_5+0x1C  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??SD2LCD_BMP_5+0x1C  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??SD2LCD_BMP_5+0x14  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  201                     rgb = color[(*pColor >> 5)&0x01];
        ADD      R0,SP,#+0
        LDRB     R1,[R11, #+0]
        UBFX     R1,R1,#+5,#+1
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDRH     R0,[R0, R1, LSL #+1]
        MOVS     R6,R0
//  202                     LCD_WR_DATA( rgb);
        MOVS     R0,#+1
        LDR.N    R1,??SD2LCD_BMP_5+0xC  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??SD2LCD_BMP_5+0x10  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??SD2LCD_BMP_5+0x14  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        LSRS     R0,R6,#+8
        LDR.N    R1,??SD2LCD_BMP_5+0x18  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??SD2LCD_BMP_5+0x1C  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??SD2LCD_BMP_5+0x1C  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??SD2LCD_BMP_5+0x14  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??SD2LCD_BMP_5+0xC  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??SD2LCD_BMP_5+0x10  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??SD2LCD_BMP_5+0x14  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        LDR.N    R0,??SD2LCD_BMP_5+0x18  ;; 0x400ff080
        STRB     R6,[R0, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??SD2LCD_BMP_5+0x1C  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??SD2LCD_BMP_5+0x1C  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??SD2LCD_BMP_5+0x14  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  203                     rgb = color[(*pColor >> 4)&0x01];
        ADD      R0,SP,#+0
        LDRB     R1,[R11, #+0]
        UBFX     R1,R1,#+4,#+1
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDRH     R0,[R0, R1, LSL #+1]
        MOVS     R6,R0
//  204                     LCD_WR_DATA( rgb);
        MOVS     R0,#+1
        LDR.N    R1,??SD2LCD_BMP_5+0xC  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??SD2LCD_BMP_5+0x10  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??SD2LCD_BMP_5+0x14  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        LSRS     R0,R6,#+8
        LDR.N    R1,??SD2LCD_BMP_5+0x18  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??SD2LCD_BMP_5+0x1C  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??SD2LCD_BMP_5+0x1C  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??SD2LCD_BMP_5+0x14  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??SD2LCD_BMP_5+0xC  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??SD2LCD_BMP_5+0x10  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??SD2LCD_BMP_5+0x14  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        LDR.N    R0,??SD2LCD_BMP_5+0x18  ;; 0x400ff080
        STRB     R6,[R0, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??SD2LCD_BMP_5+0x1C  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??SD2LCD_BMP_5+0x1C  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??SD2LCD_BMP_5+0x14  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  205                     rgb = color[(*pColor >> 3)&0x01];
        ADD      R0,SP,#+0
        LDRB     R1,[R11, #+0]
        UBFX     R1,R1,#+3,#+1
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDRH     R0,[R0, R1, LSL #+1]
        MOVS     R6,R0
//  206                     LCD_WR_DATA( rgb);
        MOVS     R0,#+1
        LDR.N    R1,??SD2LCD_BMP_5+0xC  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??SD2LCD_BMP_5+0x10  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??SD2LCD_BMP_5+0x14  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        LSRS     R0,R6,#+8
        LDR.N    R1,??SD2LCD_BMP_5+0x18  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??SD2LCD_BMP_5+0x1C  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??SD2LCD_BMP_5+0x1C  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??SD2LCD_BMP_5+0x14  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??SD2LCD_BMP_5+0xC  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??SD2LCD_BMP_5+0x10  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??SD2LCD_BMP_5+0x14  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        LDR.N    R0,??SD2LCD_BMP_5+0x18  ;; 0x400ff080
        STRB     R6,[R0, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??SD2LCD_BMP_5+0x1C  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??SD2LCD_BMP_5+0x1C  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??SD2LCD_BMP_5+0x14  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  207                     rgb = color[(*pColor >> 2)&0x01];
        ADD      R0,SP,#+0
        LDRB     R1,[R11, #+0]
        UBFX     R1,R1,#+2,#+1
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDRH     R0,[R0, R1, LSL #+1]
        MOVS     R6,R0
//  208                     LCD_WR_DATA( rgb);
        MOVS     R0,#+1
        LDR.N    R1,??SD2LCD_BMP_5+0xC  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??SD2LCD_BMP_5+0x10  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??SD2LCD_BMP_5+0x14  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        LSRS     R0,R6,#+8
        LDR.N    R1,??SD2LCD_BMP_5+0x18  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??SD2LCD_BMP_5+0x1C  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??SD2LCD_BMP_5+0x1C  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??SD2LCD_BMP_5+0x14  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??SD2LCD_BMP_5+0xC  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??SD2LCD_BMP_5+0x10  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??SD2LCD_BMP_5+0x14  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        LDR.N    R0,??SD2LCD_BMP_5+0x18  ;; 0x400ff080
        STRB     R6,[R0, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??SD2LCD_BMP_5+0x1C  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??SD2LCD_BMP_5+0x1C  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??SD2LCD_BMP_5+0x14  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  209                     rgb = color[(*pColor >> 1)&0x01];
        ADD      R0,SP,#+0
        LDRB     R1,[R11, #+0]
        UBFX     R1,R1,#+1,#+1
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDRH     R0,[R0, R1, LSL #+1]
        MOVS     R6,R0
//  210                     LCD_WR_DATA( rgb);
        MOVS     R0,#+1
        LDR.N    R1,??SD2LCD_BMP_5+0xC  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??SD2LCD_BMP_5+0x10  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??SD2LCD_BMP_5+0x14  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        LSRS     R0,R6,#+8
        LDR.N    R1,??SD2LCD_BMP_5+0x18  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??SD2LCD_BMP_5+0x1C  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??SD2LCD_BMP_5+0x1C  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??SD2LCD_BMP_5+0x14  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??SD2LCD_BMP_5+0xC  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??SD2LCD_BMP_5+0x10  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??SD2LCD_BMP_5+0x14  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        LDR.N    R0,??SD2LCD_BMP_5+0x18  ;; 0x400ff080
        STRB     R6,[R0, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??SD2LCD_BMP_5+0x1C  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??SD2LCD_BMP_5+0x1C  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??SD2LCD_BMP_5+0x14  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  211                     rgb = color[(*pColor >> 0)&0x01];
        ADD      R0,SP,#+0
        LDRB     R1,[R11, #+0]
        ANDS     R1,R1,#0x1
        LDRH     R0,[R0, R1, LSL #+1]
        MOVS     R6,R0
//  212                     LCD_WR_DATA( rgb);
        MOVS     R0,#+1
        LDR.N    R1,??SD2LCD_BMP_5+0xC  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??SD2LCD_BMP_5+0x10  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??SD2LCD_BMP_5+0x14  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        LSRS     R0,R6,#+8
        LDR.N    R1,??SD2LCD_BMP_5+0x18  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??SD2LCD_BMP_5+0x1C  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??SD2LCD_BMP_5+0x1C  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??SD2LCD_BMP_5+0x14  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??SD2LCD_BMP_5+0xC  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??SD2LCD_BMP_5+0x10  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??SD2LCD_BMP_5+0x14  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        LDR.N    R0,??SD2LCD_BMP_5+0x18  ;; 0x400ff080
        STRB     R6,[R0, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??SD2LCD_BMP_5+0x1C  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??SD2LCD_BMP_5+0x1C  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??SD2LCD_BMP_5+0x14  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  213 
//  214                     pColor+=1;
        ADDS     R11,R11,#+1
//  215                 }
        ADDS     R8,R8,#+1
        B.N      ??SD2LCD_BMP_28
//  216             }
??SD2LCD_BMP_29:
        ADDS     R9,R7,R9
        B.N      ??SD2LCD_BMP_25
//  217     
//  218             break;
??SD2LCD_BMP_26:
        B.N      ??SD2LCD_BMP_19
//  219 
//  220         }
//  221         
//  222         default:
//  223         DEBUG_PRINTF("\r\n不支持该图片显示！");
??SD2LCD_BMP_12:
        LDR.N    R0,??SD2LCD_BMP_5
          CFI FunCall printf
        BL       printf
//  224         goto bmp_exit_false;
        B.N      ??SD2LCD_BMP_0
//  225 
//  226     }
//  227 
//  228     f_close(&fsrc);
??SD2LCD_BMP_19:
        ADD      R0,SP,#+88
          CFI FunCall f_close
        BL       f_close
//  229     f_mount(0,NULL);
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall f_mount
        BL       f_mount
//  230 
//  231     return TRUE;
        MOVS     R0,#+1
        B.N      ??SD2LCD_BMP_30
//  232 
//  233 bmp_exit_false:
//  234     f_close(&fsrc);
??SD2LCD_BMP_0:
        ADD      R0,SP,#+88
          CFI FunCall f_close
        BL       f_close
//  235     f_mount(0,NULL);
        MOVS     R1,#+0
        MOVS     R0,#+0
          CFI FunCall f_mount
        BL       f_mount
//  236 
//  237     return FALSE;
        MOVS     R0,#+0
??SD2LCD_BMP_30:
        ADDW     SP,SP,#+1204
          CFI CFA R13+36
        POP      {R4-R11,PC}      ;; return
        Nop      
        DATA
??SD2LCD_BMP_5:
        DC32     ?_2
        DC32     ?_3
        DC32     BMP_Buffer
        DC32     0x43fe1028
        DC32     0x43fe1030
        DC32     0x43fe102c
        DC32     0x400ff080
        DC32     0x43fe1024
          CFI EndBlock cfiBlock0
//  238 }

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC32 0H
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_2:
        DATA
        DC8 "\015\012\262\273\326\247\263\326\270\303\315\274\306\254\317\324\312\276\243\241"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_3:
        DATA
        DC8 "\015\012\315\274\306\254\314\253\264\363\243\254\316\336\267\250\317\324\312\276\243\241"
        DC8 0

        END
//  239 /*************************** End of file ****************************/
// 
//   960 bytes in section .bss
// 1 156 bytes in section .rodata
// 2 080 bytes in section .text
// 
// 2 080 bytes of CODE  memory
// 1 156 bytes of CONST memory
//   960 bytes of DATA  memory
//
//Errors: none
//Warnings: none
