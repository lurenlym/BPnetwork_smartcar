///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       21/Mar/2017  16:05:49
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        E:\znc\project\K60FN\network_car\Board\src\VCAN_RTC_count.C
//    Command line =  
//        E:\znc\project\K60FN\network_car\Board\src\VCAN_RTC_count.C -D DEBUG
//        -D ARM_MATH_CM4 -D MK60F15 -D MK60FN15 -lA
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
//        E:\znc\project\K60FN\network_car\Prj\IAR\FN15_Debug\List\VCAN_RTC_count.s
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

        PUBLIC Is_LeapYear
        PUBLIC momoff2_t
        PUBLIC momoff_t
        PUBLIC mon2_t
        PUBLIC mon_t
        PUBLIC sec2time
        PUBLIC time2sec
        PUBLIC year2day
        
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
        DC8 45H, 3AH, 5CH, 7AH, 6EH, 63H, 5CH, 70H
        DC8 72H, 6FH, 6AH, 65H, 63H, 74H, 5CH, 4BH
        DC8 36H, 30H, 46H, 4EH, 5CH, 6EH, 65H, 74H
        DC8 77H, 6FH, 72H, 6BH, 5FH, 63H, 61H, 72H
        DC8 5CH, 42H, 6FH, 61H, 72H, 64H, 5CH, 73H
        DC8 72H, 63H, 5CH, 56H, 43H, 41H, 4EH, 5FH
        DC8 52H, 54H, 43H, 5FH, 63H, 6FH, 75H, 6EH
        DC8 74H, 2EH, 43H, 0
// E:\znc\project\K60FN\network_car\Board\src\VCAN_RTC_count.C
//    1  /*!
//    2   *     COPYRIGHT NOTICE
//    3   *     Copyright (c) 2013,山外科技
//    4   *     All rights reserved.
//    5   *     技术讨论：山外论坛 http://www.vcan123.com
//    6   *
//    7   *     除注明出处外，以下所有内容版权均属山外科技所有，未经允许，不得用于商业用途，
//    8   *     修改内容时必须保留山外科技的版权声明。
//    9   *
//   10   * @file       VCAN_RTC_count.c
//   11   * @brief      rtc数据计算函数实现(以1970-01-01 为基准，到2099-12-31)
//   12   * @author     山外科技
//   13   * @version    v5.1
//   14   * @date       2014-01-12
//   15   */
//   16 
//   17 
//   18 /*
//   19  * 包含头文件
//   20  */
//   21 #include "common.h"
//   22 #include "VCAN_RTC_count.h"
//   23 
//   24 
//   25 

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//   26 const uint8     mon_t[12]   ={ 31,28,31,30,31,30,31,31,30,31,30,31};                //平年的月份
mon_t:
        DATA
        DC8 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//   27 const uint8     mon2_t[12]  ={ 31,29,31,30,31,30,31,31,30,31,30,31};
mon2_t:
        DATA
        DC8 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
//   28 

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//   29 const uint16    momoff_t[]  ={ 0,31,59,90,120,151,181,212,243,273,304,334,365 };    //平年的每月1日的累加天数
momoff_t:
        DATA
        DC16 0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334, 365
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//   30 const uint16    momoff2_t[] ={ 0,31,60,91,121,152,182,213,244,274,305,335,366 };    //闰年的每月1日的累加天数
momoff2_t:
        DATA
        DC16 0, 31, 60, 91, 121, 152, 182, 213, 244, 274, 305, 335, 366
        DC8 0, 0
//   31 
//   32 
//   33 /*!
//   34  *  @brief      检测是否为闰年
//   35  *  @param      year    年份
//   36  *  @return     是否为闰年(0表示平年，1表示闰年)
//   37  *  @since      v5.0
//   38  *  Sample usage:       if( Is_LeapYear(2013) )         //检测 2013 是否为闰年
//   39                         {
//   40                             printf("\n闰年!");          //
//   41                         }else
//   42                         {
//   43                             printf("\n不是闰年！");
//   44                         }
//   45  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function Is_LeapYear
          CFI NoCalls
        THUMB
//   46 uint8 Is_LeapYear(uint32 year)
//   47 {
Is_LeapYear:
        MOVS     R1,R0
//   48     if(year%4 == 0)
        MOVS     R0,#+4
        UDIV     R2,R1,R0
        MLS      R2,R2,R0,R1
        CMP      R2,#+0
        BNE.N    ??Is_LeapYear_0
//   49     {
//   50         if((year%100 != 0) || (year%400 == 0))
        MOVS     R0,#+100
        UDIV     R2,R1,R0
        MLS      R0,R0,R2,R1
        CMP      R0,#+0
        BNE.N    ??Is_LeapYear_1
        MOV      R0,#+400
        UDIV     R2,R1,R0
        MLS      R0,R0,R2,R1
        CMP      R0,#+0
        BNE.N    ??Is_LeapYear_0
//   51         {
//   52             //闰年
//   53             return 1;
??Is_LeapYear_1:
        MOVS     R0,#+1
        B.N      ??Is_LeapYear_2
//   54         }
//   55     }
//   56 
//   57     //不是闰年
//   58     return 0;
??Is_LeapYear_0:
        MOVS     R0,#+0
??Is_LeapYear_2:
        BX       LR               ;; return
          CFI EndBlock cfiBlock0
//   59 }
//   60 
//   61 /*!
//   62  *  @brief      求年份的天数
//   63  *  @param      year    年份
//   64  *  @return     指定年份的天数
//   65  *  @since      v5.0
//   66  *  Sample usage:       uint32 days = year2day(2013);
//   67                         printf("2013年共%d天!",days);
//   68  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function year2day
        THUMB
//   69 uint32 year2day(uint32 year)
//   70 {
year2day:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        MOVS     R4,R0
//   71     return (365 + Is_LeapYear(year));
        MOVS     R0,R4
          CFI FunCall Is_LeapYear
        BL       Is_LeapYear
        ADDW     R0,R0,#+365
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock1
//   72 }
//   73 
//   74 /*!
//   75  *  @brief      从1970-01-01 0:0:0 至 指定时间的年月日时分秒格式转为总秒数
//   76  *  @param      time    时间结构体
//   77  *  @return     从1970-01-01 0:0:0 至 指定时间的总秒数
//   78  *  @since      v5.0
//   79  *  Sample usage:       time_s time = {2013,9,1,0,0,0};  //时间为 2013-09-01 0:0:0
//   80                         printf("共%d秒!",time2sec(time));
//   81  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function time2sec
        THUMB
//   82 uint32 time2sec(time_s time)
//   83 {
time2sec:
        PUSH     {R0,R1,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+12
        SUB      SP,SP,#+4
          CFI CFA R13+16
//   84     //参考 linux内核代码 include/linux/time.h 里的函数 mktime()
//   85     //根据高斯算法将以year/mon/day/hour/min/sec（如1980－12－31 23：59：59）
//   86     //格式表示的时间转换为相对于1970－01－01 00：00：00
//   87     //这个UNIX时间基准以来的相对秒数
//   88 
//   89     //注意一点，闰年的二月份是29天，非闰年则为28天
//   90     //四年一闰，百年不闰，四百年再闰
//   91 
//   92     //检测时间是否有效
//   93     ASSERT(time.year >= 1970);     //断言，以 1970 为基准，年份最小为 1970
        LDRH     R0,[SP, #+4]
        MOVW     R1,#+1970
        CMP      R0,R1
        BGE.N    ??time2sec_0
        MOVS     R1,#+93
        LDR.N    R0,??DataTable1
          CFI FunCall assert_failed
        BL       assert_failed
//   94     ASSERT(time.year < 2100);      //断言，32位的秒计数器可保存136年的时间，我们此处限定最大年份为2099，实际上是可计时到 2105年12月31日
??time2sec_0:
        LDRH     R0,[SP, #+4]
        MOVW     R1,#+2100
        CMP      R0,R1
        BLT.N    ??time2sec_1
        MOVS     R1,#+94
        LDR.N    R0,??DataTable1
          CFI FunCall assert_failed
        BL       assert_failed
//   95     ASSERT(time.mon  <= 12);       //断言，月份最多为12月
??time2sec_1:
        LDRB     R0,[SP, #+6]
        CMP      R0,#+13
        BLT.N    ??time2sec_2
        MOVS     R1,#+95
        LDR.N    R0,??DataTable1
          CFI FunCall assert_failed
        BL       assert_failed
//   96     ASSERT(     ((Is_LeapYear(time.year) == 0) &&                    (time.day <= mon_t[time.mon-1])) //平年
//   97            ||   ((Is_LeapYear(time.year) == 1) && (time.mon != 2) && (time.day <= mon_t[time.mon-1]))               //闰年的非2月
//   98            ||   ((Is_LeapYear(time.year) == 1) && (time.mon == 2) && (time.day <= 29))
//   99            );
??time2sec_2:
        LDRH     R0,[SP, #+4]
          CFI FunCall Is_LeapYear
        BL       Is_LeapYear
        CMP      R0,#+0
        BNE.N    ??time2sec_3
        LDR.N    R0,??DataTable1_1
        LDRB     R1,[SP, #+6]
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #-1]
        LDRB     R1,[SP, #+7]
        CMP      R0,R1
        BCS.N    ??time2sec_4
??time2sec_3:
        LDRH     R0,[SP, #+4]
          CFI FunCall Is_LeapYear
        BL       Is_LeapYear
        CMP      R0,#+1
        BNE.N    ??time2sec_5
        LDRB     R0,[SP, #+6]
        CMP      R0,#+2
        BEQ.N    ??time2sec_5
        LDR.N    R0,??DataTable1_1
        LDRB     R1,[SP, #+6]
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #-1]
        LDRB     R1,[SP, #+7]
        CMP      R0,R1
        BCS.N    ??time2sec_4
??time2sec_5:
        LDRH     R0,[SP, #+4]
          CFI FunCall Is_LeapYear
        BL       Is_LeapYear
        CMP      R0,#+1
        BNE.N    ??time2sec_6
        LDRB     R0,[SP, #+6]
        CMP      R0,#+2
        BNE.N    ??time2sec_6
        LDRB     R0,[SP, #+7]
        CMP      R0,#+30
        BLT.N    ??time2sec_4
??time2sec_6:
        MOVS     R1,#+99
        LDR.N    R0,??DataTable1
          CFI FunCall assert_failed
        BL       assert_failed
//  100 
//  101 
//  102                //ASSERT((time.mon != 2) || ((time.mon == 2) && (time.day  <= 29)));   //二月份天数不超过 29天。
//  103     //ASSERT((time.mon == 2) && (time.year%4 ！= 0)); //年份非4的倍数，则是普通年份
//  104 
//  105 
//  106     if (0 >= (int8) (time.mon -= 2)) /* 1..12 -> 11,12,1..10 */
??time2sec_4:
        LDRB     R0,[SP, #+6]
        SUBS     R0,R0,#+2
        STRB     R0,[SP, #+6]
        LDRSB    R0,[SP, #+6]
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BGE.N    ??time2sec_7
//  107     {
//  108         time.mon += 12; /* Puts Feb last since it has leap day */
        LDRB     R0,[SP, #+6]
        ADDS     R0,R0,#+12
        STRB     R0,[SP, #+6]
//  109         time.year -= 1;
        LDRH     R0,[SP, #+4]
        SUBS     R0,R0,#+1
        STRH     R0,[SP, #+4]
//  110     }
//  111 
//  112     return (((
//  113             (uint32) (time.year/4 - time.year/100 + time.year/400 + 367*(time.mon)/12 + time.day) + time.year*365 - 719499 /* 现有的总日数 */
//  114             )*24 + time.hour /* 现有的总小时数 */
//  115             )*60 + time.min  /* 现有的总分钟数 */
//  116             )*60 + time.sec; /* 最终的总秒数   */
??time2sec_7:
        LDRH     R0,[SP, #+4]
        MOVS     R1,#+4
        SDIV     R0,R0,R1
        LDRH     R1,[SP, #+4]
        MOVS     R2,#+100
        SDIV     R1,R1,R2
        SUBS     R0,R0,R1
        LDRH     R1,[SP, #+4]
        MOV      R2,#+400
        SDIV     R1,R1,R2
        ADDS     R0,R1,R0
        LDRB     R1,[SP, #+6]
        MOVW     R2,#+367
        MULS     R1,R2,R1
        MOVS     R2,#+12
        SDIV     R1,R1,R2
        ADDS     R0,R1,R0
        LDRB     R1,[SP, #+7]
        UXTAB    R0,R0,R1
        LDRH     R1,[SP, #+4]
        MOVW     R2,#+365
        MLA      R0,R2,R1,R0
        LDR.N    R1,??DataTable1_2  ;; 0xfff50575
        ADDS     R0,R1,R0
        MOVS     R1,#+24
        LDRB     R2,[SP, #+8]
        MLA      R0,R1,R0,R2
        MOVS     R1,#+60
        LDRB     R2,[SP, #+9]
        MLA      R0,R1,R0,R2
        MOVS     R1,#+60
        LDRB     R2,[SP, #+10]
        MLA      R0,R1,R0,R2
        POP      {R1-R3,PC}       ;; return
          CFI EndBlock cfiBlock2
//  117 }
//  118 
//  119 /*!
//  120  *  @brief      以1970-01-01 为基准的总秒数 转为年月日时分秒格式
//  121  *  @param      sec     总秒数
//  122  *  @param      time    时间结构体
//  123  *  @since      v5.0
//  124  *  Sample usage:       time_s time;
//  125                         sec2time(1000,&time);   //求1000秒对应的时间
//  126                         printf("\n时间是：%d-%02d-%02d %02d:%02d:%02d",
//  127                                                 time.year,time.mon,time.day,
//  128                                                 time.hour,time.min,time.sec);
//  129  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function sec2time
        THUMB
//  130 void sec2time(uint32 sec, time_s * time)
//  131 {
sec2time:
        PUSH     {R4-R10,LR}
          CFI R14 Frame(CFA, -4)
          CFI R10 Frame(CFA, -8)
          CFI R9 Frame(CFA, -12)
          CFI R8 Frame(CFA, -16)
          CFI R7 Frame(CFA, -20)
          CFI R6 Frame(CFA, -24)
          CFI R5 Frame(CFA, -28)
          CFI R4 Frame(CFA, -32)
          CFI CFA R13+32
        MOV      R10,R0
        MOVS     R4,R1
//  132 #define DAYSEC  (60*60*24)      //定义每天的总秒数
//  133     //uint32 i;
//  134     uint32  hms                //一天剩下的秒数
//  135             ,day                //秒数共有的天数
//  136             ,tmp;
//  137 
//  138     uint16 const* dayoff ;
//  139     uint8  const* monoff;
//  140 
//  141     if(sec > 0xf48656ff)    //时间超过 2099-12-31 23:59:59后，会从 1970-1-1 0:0:0 开始计时
        LDR.N    R0,??DataTable1_3  ;; 0xf4865700
        CMP      R10,R0
        BCC.N    ??sec2time_0
//  142     {
//  143         sec -= 0xf48656ff;
        LDR.N    R0,??DataTable1_4  ;; 0xb79a901
        ADDS     R10,R0,R10
//  144     }
//  145 
//  146     day = sec / DAYSEC;
??sec2time_0:
        LDR.N    R0,??DataTable1_5  ;; 0x15180
        UDIV     R0,R10,R0
        MOVS     R6,R0
//  147     hms = sec % DAYSEC;
        LDR.N    R0,??DataTable1_5  ;; 0x15180
        UDIV     R1,R10,R0
        MLS      R0,R0,R1,R10
        MOVS     R5,R0
//  148 
//  149     //先求时分秒
//  150     time->hour = (uint8) (hms / (60*60));         //时
        MOV      R0,#+3600
        UDIV     R0,R5,R0
        STRB     R0,[R4, #+4]
//  151     hms = hms % (60*60);
        MOV      R0,#+3600
        UDIV     R1,R5,R0
        MLS      R5,R0,R1,R5
//  152     time->min = (uint8) (hms / 60);  //分
        MOVS     R0,#+60
        UDIV     R0,R5,R0
        STRB     R0,[R4, #+5]
//  153     time->sec = (uint8) (hms % 60);   //秒
        MOVS     R0,#+60
        UDIV     R1,R5,R0
        MLS      R0,R0,R1,R5
        STRB     R0,[R4, #+6]
//  154 
//  155     /*算出当前年份，起始的计数年份为1970年*/
//  156     time->year  =  (uint16)(day/366 );          //粗略求出 年份(还没加 1970)
        MOV      R0,#+366
        UDIV     R0,R6,R0
        STRH     R0,[R4, #+0]
//  157 
//  158     day = day
//  159             -  365*(time->year)    //天数
//  160             - ((time->year +1)/4)  //4年一闰年
//  161             //+ (time->year/(2101-1970) )      //2100不是闰年，由于最大年份是 2099，不考虑2100，因而此处注释
//  162             ;
        LDRH     R0,[R4, #+0]
        MOVW     R1,#+365
        MLS      R0,R1,R0,R6
        LDRH     R1,[R4, #+0]
        ADDS     R1,R1,#+1
        MOVS     R2,#+4
        SDIV     R1,R1,R2
        SUBS     R6,R0,R1
//  163 
//  164     time->year += 1970;
        LDRH     R0,[R4, #+0]
        ADDW     R0,R0,#+1970
        STRH     R0,[R4, #+0]
//  165     tmp = 365 + Is_LeapYear(time->year);        //指定年份的 天数
        LDRH     R0,[R4, #+0]
          CFI FunCall Is_LeapYear
        BL       Is_LeapYear
        ADDW     R0,R0,#+365
        MOVS     R7,R0
//  166     if(day >= tmp)
        CMP      R6,R7
        BCC.N    ??sec2time_1
//  167     {
//  168         time->year++;
        LDRH     R0,[R4, #+0]
        ADDS     R0,R0,#+1
        STRH     R0,[R4, #+0]
//  169         day -=  tmp;
        SUBS     R6,R6,R7
//  170     }
//  171 
//  172     time->mon = (uint8)(day/31 +1);                 //粗略算月份，可能需要加1
??sec2time_1:
        MOVS     R0,#+31
        UDIV     R0,R6,R0
        ADDS     R0,R0,#+1
        STRB     R0,[R4, #+2]
//  173 
//  174     tmp = Is_LeapYear(time->year);
        LDRH     R0,[R4, #+0]
          CFI FunCall Is_LeapYear
        BL       Is_LeapYear
        MOVS     R7,R0
//  175     dayoff  = tmp ? momoff2_t : momoff_t;
        CMP      R7,#+0
        BEQ.N    ??sec2time_2
        LDR.W    R8,??DataTable1_6
        B.N      ??sec2time_3
??sec2time_2:
        LDR.W    R8,??DataTable1_7
//  176     monoff  = tmp ? mon2_t : mon_t;
??sec2time_3:
        CMP      R7,#+0
        BEQ.N    ??sec2time_4
        LDR.W    R9,??DataTable1_8
        B.N      ??sec2time_5
??sec2time_4:
        LDR.W    R9,??DataTable1_1
//  177 
//  178     time->day = (uint8)(day +1 - dayoff[time->mon -1]);
??sec2time_5:
        ADDS     R0,R6,#+1
        LDRB     R1,[R4, #+2]
        ADDS     R1,R8,R1, LSL #+1
        LDRH     R1,[R1, #-2]
        SUBS     R0,R0,R1
        STRB     R0,[R4, #+3]
//  179 
//  180     if(time->day > monoff[time->mon-1 ] )
        LDRB     R0,[R4, #+2]
        ADDS     R0,R0,R9
        LDRB     R0,[R0, #-1]
        LDRB     R1,[R4, #+3]
        CMP      R0,R1
        BCS.N    ??sec2time_6
//  181     {
//  182         time->mon++;
        LDRB     R0,[R4, #+2]
        ADDS     R0,R0,#+1
        STRB     R0,[R4, #+2]
//  183         time->day = (uint8)(day +1 - dayoff[time->mon -1]);
        ADDS     R0,R6,#+1
        LDRB     R1,[R4, #+2]
        ADDS     R1,R8,R1, LSL #+1
        LDRH     R1,[R1, #-2]
        SUBS     R0,R0,R1
        STRB     R0,[R4, #+3]
//  184     }
//  185 }
??sec2time_6:
        POP      {R4-R10,PC}      ;; return
          CFI EndBlock cfiBlock3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     ?_0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     mon_t

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     0xfff50575

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     0xf4865700

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     0xb79a901

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_5:
        DC32     0x15180

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_6:
        DC32     momoff2_t

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_7:
        DC32     momoff_t

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_8:
        DC32     mon2_t

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
// 140 bytes in section .rodata
// 674 bytes in section .text
// 
// 674 bytes of CODE  memory
// 140 bytes of CONST memory
//
//Errors: none
//Warnings: none
