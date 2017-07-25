///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       21/Mar/2017  16:05:31
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\znc\project\K60FN\network_car\Board\src\VCAN_LCD_CH.c
//    Command line =  
//        E:\znc\project\K60FN\network_car\Board\src\VCAN_LCD_CH.c -D DEBUG -D
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
//        E:\znc\project\K60FN\network_car\Prj\IAR\FN15_Debug\List\VCAN_LCD_CH.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "1"
        RTMODEL "__dlib_full_locale_support", "1"
        AAPCS BASE,INTERWORK,VFP
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN LCD_ST7735R_ptlon
        EXTERN LCD_char
        EXTERN ST7735R_get_h
        EXTERN ST7735R_get_w
        EXTERN f_close
        EXTERN f_lseek
        EXTERN f_mount
        EXTERN f_open
        EXTERN f_read

        PUBLIC GetGBKCode_from_sd
        PUBLIC LCD_Char_CH
        PUBLIC LCD_FChar_CH
        PUBLIC LCD_FStr_CH
        PUBLIC LCD_Str_CH
        PUBLIC LCD_Str_ENCH
        PUBLIC mybr
        PUBLIC myfs
        PUBLIC myfsrc
        PUBLIC myres
        
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
        
// E:\znc\project\K60FN\network_car\Board\src\VCAN_LCD_CH.c
//    1 #include "common.h"
//    2 
//    3 
//    4 #include "VCAN_lcd.h"
//    5 #include "ff.h"
//    6 
//    7 
//    8 
//    9 
//   10 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   11 FATFS myfs;                    // Work area (file system object) for logical drive
myfs:
        DS8 560

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   12 FIL myfsrc;            // file objects
myfsrc:
        DS8 548

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   13 FRESULT myres;                 // FatFs function common result code
myres:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   14 uint32 mybr;               // File R/W count
mybr:
        DS8 4
//   15 
//   16 /*******************************************************************************
//   17 * Function Name  : GetGBKCode_from_sd
//   18 * Description    : 从SD卡字库中读取自摸数据到指定的缓冲区
//   19 * Input          : pBuffer---数据保存地址
//   20 *				   					c--汉字字符低字节码
//   21 * Output         : None
//   22 * Return         : 0(success)  -1(fail)
//   23 * Attention		 	 : None
//   24 *******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function GetGBKCode_from_sd
        THUMB
//   25 int GetGBKCode_from_sd(unsigned char* pBuffer,const unsigned char * c)
//   26 {
GetGBKCode_from_sd:
        PUSH     {R4-R8,LR}
          CFI R14 Frame(CFA, -4)
          CFI R8 Frame(CFA, -8)
          CFI R7 Frame(CFA, -12)
          CFI R6 Frame(CFA, -16)
          CFI R5 Frame(CFA, -20)
          CFI R4 Frame(CFA, -24)
          CFI CFA R13+24
        MOVS     R4,R0
        MOVS     R5,R1
//   27     unsigned char High8bit,Low8bit;
//   28     unsigned int pos;
//   29     High8bit=*c;     /* 取高8位数据 */
        LDRB     R0,[R5, #+0]
        MOVS     R6,R0
//   30     Low8bit=*(c+1);  /* 取低8位数据 */
        LDRB     R0,[R5, #+1]
        MOVS     R7,R0
//   31 
//   32     pos = ((High8bit-0xb0)*94+Low8bit-0xa1)*LCD_CH_SIZE ;	
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        MOVS     R0,#+94
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        MLA      R0,R0,R6,R7
        LDR.W    R1,??DataTable2  ;; 0xffffbebf
        ADDS     R0,R1,R0
        LSLS     R0,R0,#+5
        MOV      R8,R0
//   33     f_mount(0, &myfs);
        LDR.W    R1,??DataTable2_1
        MOVS     R0,#+0
          CFI FunCall f_mount
        BL       f_mount
//   34     myres = f_open(&myfsrc , "0:/HZLIB.bin", FA_OPEN_EXISTING | FA_READ);
        MOVS     R2,#+1
        LDR.W    R1,??DataTable2_2
        LDR.W    R0,??DataTable2_3
          CFI FunCall f_open
        BL       f_open
        LDR.W    R1,??DataTable2_4
        STRB     R0,[R1, #+0]
//   35 
//   36     if ( myres == FR_OK )
        LDR.W    R0,??DataTable2_4
        LDRSB    R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??GetGBKCode_from_sd_0
//   37     {
//   38         f_lseek (&myfsrc, pos);														 //指针偏移
        MOV      R1,R8
        LDR.W    R0,??DataTable2_3
          CFI FunCall f_lseek
        BL       f_lseek
//   39         myres = f_read( &myfsrc, pBuffer, LCD_CH_SIZE, &mybr );		 //16*16大小的汉字 其字模 占用16*2个字节
        LDR.W    R3,??DataTable2_5
        MOVS     R2,#+32
        MOVS     R1,R4
        LDR.W    R0,??DataTable2_3
          CFI FunCall f_read
        BL       f_read
        LDR.W    R1,??DataTable2_4
        STRB     R0,[R1, #+0]
//   40 
//   41         f_close(&myfsrc);
        LDR.W    R0,??DataTable2_3
          CFI FunCall f_close
        BL       f_close
//   42 
//   43         return 0;
        MOVS     R0,#+0
        B.N      ??GetGBKCode_from_sd_1
//   44     }
//   45     else
//   46     {
//   47         return -1;
??GetGBKCode_from_sd_0:
        MOVS     R0,#-1
??GetGBKCode_from_sd_1:
        POP      {R4-R8,PC}       ;; return
          CFI EndBlock cfiBlock0
//   48     }
//   49 }
//   50 
//   51 /********************************************************************
//   52  * 函数名：LCD_Char_CH
//   53  * 描述  ：显示单个汉字字符
//   54  * 输入  : 	x: 0~(319-16)
//   55  *         	y: 0~(239-16)
//   56  *			str: 中文字符串首址
//   57  *			Color: 字符颜色
//   58  *			bkColor: 背景颜色
//   59  * 输出  ：无
//   60  * 举例  ：	LCD_Char_CH(200,100,"好",0,0);
//   61  * 注意	 ：如果输入大于1的汉字字符串，显示将会截断，只显示最前面一个汉字
//   62 ************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function LCD_Char_CH
        THUMB
//   63 void LCD_Char_CH(Site_t site,const uint8 *str,uint16 Color,uint16 bkColor)
//   64 {
LCD_Char_CH:
        PUSH     {R0,R4-R11,LR}
          CFI R14 Frame(CFA, -4)
          CFI R11 Frame(CFA, -8)
          CFI R10 Frame(CFA, -12)
          CFI R9 Frame(CFA, -16)
          CFI R8 Frame(CFA, -20)
          CFI R7 Frame(CFA, -24)
          CFI R6 Frame(CFA, -28)
          CFI R5 Frame(CFA, -32)
          CFI R4 Frame(CFA, -36)
          CFI CFA R13+40
        SUB      SP,SP,#+32
          CFI CFA R13+72
        MOVS     R4,R1
        MOVS     R5,R2
        MOVS     R6,R3
//   65     uint8 i,j;
//   66     uint8 buffer[32];
//   67     uint8 *pbuf = buffer;
        ADD      R9,SP,#+0
//   68     uint8 tmp_char=0;
        MOVS     R10,#+0
//   69 
//   70     const Size_t size   = {LCD_CH_W,LCD_CH_H};
        LDR.W    R0,??DataTable2_6
        LDR      R11,[R0, #+0]
//   71 
//   72     GetGBKCode_from_sd(buffer,str);  /* 取字模数据 */
        MOVS     R1,R4
        ADD      R0,SP,#+0
          CFI FunCall GetGBKCode_from_sd
        BL       GetGBKCode_from_sd
//   73 
//   74     LCD_PTLON(site, size);              //开窗
        MOV      R1,R11
        LDR      R0,[SP, #+32]
          CFI FunCall LCD_ST7735R_ptlon
        BL       LCD_ST7735R_ptlon
//   75     LCD_RAMWR();                        //写内存
        MOVS     R0,#+1
        LDR.W    R1,??DataTable2_7  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable2_8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable2_9  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+44
        LDR.W    R1,??DataTable2_10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable2_11  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable2_11  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable2_9  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//   76 
//   77     for (i=0;i < LCD_CH_SIZE;i++)
        MOVS     R0,#+0
        MOVS     R7,R0
??LCD_Char_CH_0:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+32
        BGE.N    ??LCD_Char_CH_1
//   78     {
//   79         tmp_char = *pbuf++;
        LDRB     R0,[R9, #+0]
        MOV      R10,R0
        ADDS     R9,R9,#+1
//   80 
//   81         for(j=0;j<8;j++)
        MOVS     R0,#+0
        MOV      R8,R0
??LCD_Char_CH_2:
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+8
        BGE.N    ??LCD_Char_CH_3
//   82         {
//   83             if(tmp_char & (0x80))
        LSLS     R0,R10,#+24
        BPL.N    ??LCD_Char_CH_4
//   84             {
//   85                 LCD_WR_DATA( Color );
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_7  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_9  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LSRS     R0,R5,#+8
        LDR.N    R1,??DataTable2_10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_11  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_11  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_9  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_7  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_9  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable2_10  ;; 0x400ff080
        STRB     R5,[R0, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_11  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_11  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_9  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        B.N      ??LCD_Char_CH_5
//   86             }
//   87             else
//   88             {
//   89                 LCD_WR_DATA( bkColor );
??LCD_Char_CH_4:
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_7  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_9  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        LSRS     R0,R6,#+8
        LDR.N    R1,??DataTable2_10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_11  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_11  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_9  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_7  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_9  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable2_10  ;; 0x400ff080
        STRB     R6,[R0, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_11  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_11  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_9  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//   90             }
//   91             tmp_char <<= 1;
??LCD_Char_CH_5:
        LSLS     R10,R10,#+1
//   92         }
        ADDS     R8,R8,#+1
        B.N      ??LCD_Char_CH_2
//   93     }
??LCD_Char_CH_3:
        ADDS     R7,R7,#+1
        B.N      ??LCD_Char_CH_0
//   94 }
??LCD_Char_CH_1:
        ADD      SP,SP,#+36
          CFI CFA R13+36
        POP      {R4-R11,PC}      ;; return
          CFI EndBlock cfiBlock1
//   95 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function LCD_Str_CH
        THUMB
//   96 void LCD_Str_CH(Site_t site,const uint8 *str  , uint16 Color ,uint16 bkColor) 		//显示16*16汉字字符串
//   97 {
LCD_Str_CH:
        PUSH     {R0,R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+20
        SUB      SP,SP,#+4
          CFI CFA R13+24
        MOVS     R4,R1
        MOVS     R5,R2
        MOVS     R6,R3
//   98     while(*str != '\0')
??LCD_Str_CH_0:
        LDRB     R0,[R4, #+0]
        CMP      R0,#+0
        BEQ.N    ??LCD_Str_CH_1
//   99     {
//  100         if(site.x>(LCD_W-16))
          CFI FunCall ST7735R_get_w
        BL       ST7735R_get_w
        SUBS     R0,R0,#+16
        LDRH     R1,[SP, #+4]
        CMP      R0,R1
        BGE.N    ??LCD_Str_CH_2
//  101             {	
//  102              /*换行*/
//  103             site.x =0;
        MOVS     R0,#+0
        STRH     R0,[SP, #+4]
//  104             site.y +=LCD_CH_H;
        LDRH     R0,[SP, #+6]
        ADDS     R0,R0,#+16
        STRH     R0,[SP, #+6]
//  105         }
//  106         if(site.y >(LCD_H-LCD_CH_W))
??LCD_Str_CH_2:
          CFI FunCall ST7735R_get_h
        BL       ST7735R_get_h
        SUBS     R0,R0,#+16
        LDRH     R1,[SP, #+6]
        CMP      R0,R1
        BGE.N    ??LCD_Str_CH_3
//  107         {
//  108              /*重新归零*/
//  109              site.y =0;
        MOVS     R0,#+0
        STRH     R0,[SP, #+6]
//  110              site.x =0;
        MOVS     R0,#+0
        STRH     R0,[SP, #+4]
//  111         }
//  112         LCD_Char_CH(site,str,Color,bkColor);
??LCD_Str_CH_3:
        MOVS     R3,R6
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        MOVS     R2,R5
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R1,R4
        LDR      R0,[SP, #+4]
          CFI FunCall LCD_Char_CH
        BL       LCD_Char_CH
//  113         str += 2 ;
        ADDS     R4,R4,#+2
//  114         site.x += LCD_CH_W ;	
        LDRH     R0,[SP, #+4]
        ADDS     R0,R0,#+16
        STRH     R0,[SP, #+4]
        B.N      ??LCD_Str_CH_0
//  115     }
//  116 }
??LCD_Str_CH_1:
        POP      {R0,R1,R4-R6,PC}  ;; return
          CFI EndBlock cfiBlock2
//  117 
//  118 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function LCD_Str_ENCH
        THUMB
//  119 void LCD_Str_ENCH(Site_t site,const uint8 *str  , uint16 Color ,uint16 bkColor) 		//显示16*16汉字字符串
//  120 {
LCD_Str_ENCH:
        PUSH     {R0,R4-R6,LR}
          CFI R14 Frame(CFA, -4)
          CFI R6 Frame(CFA, -8)
          CFI R5 Frame(CFA, -12)
          CFI R4 Frame(CFA, -16)
          CFI CFA R13+20
        SUB      SP,SP,#+4
          CFI CFA R13+24
        MOVS     R6,R1
        MOVS     R4,R2
        MOVS     R5,R3
//  121     while(*str != '\0')
??LCD_Str_ENCH_0:
        LDRB     R0,[R6, #+0]
        CMP      R0,#+0
        BEQ.N    ??LCD_Str_ENCH_1
//  122     {
//  123         if( *str < 0x80)       //英文
        LDRB     R0,[R6, #+0]
        CMP      R0,#+128
        BGE.N    ??LCD_Str_ENCH_2
//  124         {
//  125             if(site.x>(LCD_W-LCD_EN_W))
          CFI FunCall ST7735R_get_w
        BL       ST7735R_get_w
        SUBS     R0,R0,#+8
        LDRH     R1,[SP, #+4]
        CMP      R0,R1
        BGE.N    ??LCD_Str_ENCH_3
//  126             {	
//  127                  /*换行*/
//  128                 site.x =0;
        MOVS     R0,#+0
        STRH     R0,[SP, #+4]
//  129                 site.y +=LCD_EN_H;
        LDRH     R0,[SP, #+6]
        ADDS     R0,R0,#+16
        STRH     R0,[SP, #+6]
//  130             }
//  131             if(site.y >(LCD_H-LCD_EN_H))
??LCD_Str_ENCH_3:
          CFI FunCall ST7735R_get_h
        BL       ST7735R_get_h
        SUBS     R0,R0,#+16
        LDRH     R1,[SP, #+6]
        CMP      R0,R1
        BGE.N    ??LCD_Str_ENCH_4
//  132             {
//  133                  /*重新归零*/
//  134                  site.y =0;
        MOVS     R0,#+0
        STRH     R0,[SP, #+6]
//  135                  site.x =0;
        MOVS     R0,#+0
        STRH     R0,[SP, #+4]
//  136             }
//  137             LCD_char(site,*str,Color,bkColor);
??LCD_Str_ENCH_4:
        MOVS     R3,R5
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        MOVS     R2,R4
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        LDRB     R1,[R6, #+0]
        LDR      R0,[SP, #+4]
          CFI FunCall LCD_char
        BL       LCD_char
//  138             str += 1 ;
        ADDS     R6,R6,#+1
//  139             site.x += LCD_EN_W ;	
        LDRH     R0,[SP, #+4]
        ADDS     R0,R0,#+8
        STRH     R0,[SP, #+4]
        B.N      ??LCD_Str_ENCH_0
//  140         }
//  141         else
//  142         {
//  143             if(site.x>(LCD_W-LCD_CH_W))
??LCD_Str_ENCH_2:
          CFI FunCall ST7735R_get_w
        BL       ST7735R_get_w
        SUBS     R0,R0,#+16
        LDRH     R1,[SP, #+4]
        CMP      R0,R1
        BGE.N    ??LCD_Str_ENCH_5
//  144             {	
//  145                  /*换行*/
//  146                 site.x =0;
        MOVS     R0,#+0
        STRH     R0,[SP, #+4]
//  147                 site.y +=LCD_CH_H;
        LDRH     R0,[SP, #+6]
        ADDS     R0,R0,#+16
        STRH     R0,[SP, #+6]
//  148             }
//  149             if(site.y >(LCD_H-LCD_CH_H))
??LCD_Str_ENCH_5:
          CFI FunCall ST7735R_get_h
        BL       ST7735R_get_h
        SUBS     R0,R0,#+16
        LDRH     R1,[SP, #+6]
        CMP      R0,R1
        BGE.N    ??LCD_Str_ENCH_6
//  150             {
//  151                  /*重新归零*/
//  152                  site.y =0;
        MOVS     R0,#+0
        STRH     R0,[SP, #+6]
//  153                  site.x =0;
        MOVS     R0,#+0
        STRH     R0,[SP, #+4]
//  154             }
//  155             LCD_Char_CH(site,str,Color,bkColor);
??LCD_Str_ENCH_6:
        MOVS     R3,R5
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        MOVS     R2,R4
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R1,R6
        LDR      R0,[SP, #+4]
          CFI FunCall LCD_Char_CH
        BL       LCD_Char_CH
//  156             str += 2 ;
        ADDS     R6,R6,#+2
//  157             site.x += LCD_CH_W ;	
        LDRH     R0,[SP, #+4]
        ADDS     R0,R0,#+16
        STRH     R0,[SP, #+4]
        B.N      ??LCD_Str_ENCH_0
//  158         }
//  159     }
//  160 }
??LCD_Str_ENCH_1:
        POP      {R0,R1,R4-R6,PC}  ;; return
          CFI EndBlock cfiBlock3
//  161 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function LCD_FChar_CH
        THUMB
//  162 void LCD_FChar_CH (Site_t site,const uint8 *str,uint16 Color,uint16 bkColor)
//  163 {
LCD_FChar_CH:
        PUSH     {R3-R11,LR}
          CFI R14 Frame(CFA, -4)
          CFI R11 Frame(CFA, -8)
          CFI R10 Frame(CFA, -12)
          CFI R9 Frame(CFA, -16)
          CFI R8 Frame(CFA, -20)
          CFI R7 Frame(CFA, -24)
          CFI R6 Frame(CFA, -28)
          CFI R5 Frame(CFA, -32)
          CFI R4 Frame(CFA, -36)
          CFI CFA R13+40
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
//  164     uint8 i,j;
//  165     //uint8 *pbuf = str;
//  166     uint8 tmp_char=0;
        MOVS     R10,#+0
//  167 
//  168     const Size_t size   = {LCD_CH_W,LCD_CH_H};
        LDR.N    R0,??DataTable2_12
        LDR      R11,[R0, #+0]
//  169 
//  170     LCD_PTLON(site, size);              //开窗
        MOV      R1,R11
        MOVS     R0,R4
          CFI FunCall LCD_ST7735R_ptlon
        BL       LCD_ST7735R_ptlon
//  171     LCD_RAMWR();                        //写内存
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_7  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_9  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+44
        LDR.N    R1,??DataTable2_10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_11  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_11  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_9  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  172 
//  173     for (i=0;i < LCD_CH_SIZE;i++)
        MOVS     R0,#+0
        MOV      R8,R0
??LCD_FChar_CH_0:
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+32
        BGE.N    ??LCD_FChar_CH_1
//  174     {
//  175         tmp_char = *str++;
        LDRB     R0,[R5, #+0]
        MOV      R10,R0
        ADDS     R5,R5,#+1
//  176 
//  177         for(j=0;j<8;j++)
        MOVS     R0,#+0
        MOV      R9,R0
??LCD_FChar_CH_2:
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        CMP      R9,#+8
        BGE.N    ??LCD_FChar_CH_3
//  178         {
//  179             if(tmp_char & (0x80))
        LSLS     R0,R10,#+24
        BPL.N    ??LCD_FChar_CH_4
//  180             {
//  181                 LCD_WR_DATA( Color );
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_7  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_9  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        LSRS     R0,R6,#+8
        LDR.N    R1,??DataTable2_10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_11  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_11  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_9  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_7  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_9  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable2_10  ;; 0x400ff080
        STRB     R6,[R0, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_11  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_11  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_9  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        B.N      ??LCD_FChar_CH_5
//  182             }
//  183             else
//  184             {
//  185                 LCD_WR_DATA( bkColor );
??LCD_FChar_CH_4:
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_7  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_9  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        LSRS     R0,R7,#+8
        LDR.N    R1,??DataTable2_10  ;; 0x400ff080
        STRB     R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_11  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_11  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_9  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_7  ;; 0x43fe1028
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_8  ;; 0x43fe1030
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_9  ;; 0x43fe102c
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable2_10  ;; 0x400ff080
        STRB     R7,[R0, #+0]
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_11  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_11  ;; 0x43fe1024
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_9  ;; 0x43fe102c
        STR      R0,[R1, #+0]
//  186             }
//  187             tmp_char <<= 1;
??LCD_FChar_CH_5:
        LSLS     R10,R10,#+1
//  188         }
        ADDS     R9,R9,#+1
        B.N      ??LCD_FChar_CH_2
//  189     }
??LCD_FChar_CH_3:
        ADDS     R8,R8,#+1
        B.N      ??LCD_FChar_CH_0
//  190 }
??LCD_FChar_CH_1:
        POP      {R0,R4-R11,PC}   ;; return
          CFI EndBlock cfiBlock4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     0xffffbebf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     myfs

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     ?_0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     myfsrc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     myres

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_5:
        DC32     mybr

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_6:
        DC32     ?_1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_7:
        DC32     0x43fe1028

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_8:
        DC32     0x43fe1030

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_9:
        DC32     0x43fe102c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_10:
        DC32     0x400ff080

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_11:
        DC32     0x43fe1024

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_12:
        DC32     ?_2
//  191 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function LCD_FStr_CH
        THUMB
//  192 void LCD_FStr_CH (Site_t site,const uint8 *str,uint16 num,uint16 Color,uint16 bkColor)
//  193 {
LCD_FStr_CH:
        PUSH     {R0,R4-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R5,R1
        MOVS     R7,R2
        MOVS     R6,R3
        LDR      R4,[SP, #+24]
//  194     while(num--)
??LCD_FStr_CH_0:
        MOVS     R0,R7
        SUBS     R7,R0,#+1
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+0
        BEQ.N    ??LCD_FStr_CH_1
//  195     {
//  196         if(site.x>(LCD_W-16))
          CFI FunCall ST7735R_get_w
        BL       ST7735R_get_w
        SUBS     R0,R0,#+16
        LDRH     R1,[SP, #+0]
        CMP      R0,R1
        BGE.N    ??LCD_FStr_CH_2
//  197         {
//  198              /*换行*/
//  199             site.x =0;
        MOVS     R0,#+0
        STRH     R0,[SP, #+0]
//  200             site.y +=LCD_CH_H;
        LDRH     R0,[SP, #+2]
        ADDS     R0,R0,#+16
        STRH     R0,[SP, #+2]
//  201         }
//  202         if(site.y >(LCD_H-LCD_CH_W))
??LCD_FStr_CH_2:
          CFI FunCall ST7735R_get_h
        BL       ST7735R_get_h
        SUBS     R0,R0,#+16
        LDRH     R1,[SP, #+2]
        CMP      R0,R1
        BGE.N    ??LCD_FStr_CH_3
//  203         {
//  204              /*重新归零*/
//  205              site.y =0;
        MOVS     R0,#+0
        STRH     R0,[SP, #+2]
//  206              site.x =0;
        MOVS     R0,#+0
        STRH     R0,[SP, #+0]
//  207         }
//  208         LCD_FChar_CH(site,str,Color,bkColor);
??LCD_FStr_CH_3:
        MOVS     R3,R4
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        MOVS     R2,R6
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R1,R5
        LDR      R0,[SP, #+0]
          CFI FunCall LCD_FChar_CH
        BL       LCD_FChar_CH
//  209         str += LCD_CH_SIZE ;
        ADDS     R5,R5,#+32
//  210         site.x += LCD_CH_W ;
        LDRH     R0,[SP, #+0]
        ADDS     R0,R0,#+16
        STRH     R0,[SP, #+0]
        B.N      ??LCD_FStr_CH_0
//  211     }
//  212 }
??LCD_FStr_CH_1:
        POP      {R0,R4-R7,PC}    ;; return
          CFI EndBlock cfiBlock5

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
        DC8 "0:/HZLIB.bin"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_1:
        DATA
        DC16 16, 16

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_2:
        DATA
        DC16 16, 16

        END
//  213 
// 
// 1 113 bytes in section .bss
//    24 bytes in section .rodata
// 1 222 bytes in section .text
// 
// 1 222 bytes of CODE  memory
//    24 bytes of CONST memory
// 1 113 bytes of DATA  memory
//
//Errors: none
//Warnings: none
