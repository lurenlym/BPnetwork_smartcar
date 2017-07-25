///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       21/Mar/2017  16:06:03
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\znc\project\K60FN\network_car\Chip\src\vectors.c
//    Command line =  
//        E:\znc\project\K60FN\network_car\Chip\src\vectors.c -D DEBUG -D
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
//        E:\znc\project\K60FN\network_car\Prj\IAR\FN15_Debug\List\vectors.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "1"
        RTMODEL "__dlib_full_locale_support", "1"
        AAPCS BASE,INTERWORK,VFP
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN Reset_Handler
        EXTERN __BOOT_STACK_ADDRESS
        EXTERN default_isr

        PUBLIC __vector_table
// E:\znc\project\K60FN\network_car\Chip\src\vectors.c
//    1 /*!
//    2  *     COPYRIGHT NOTICE
//    3  *     Copyright (c) 2013,山外科技
//    4  *     All rights reserved.
//    5  *     技术讨论：山外论坛 http://www.vcan123.com
//    6  *
//    7  *     除注明出处外，以下所有内容版权均属山外科技所有，未经允许，不得用于商业用途，
//    8  *     修改内容时必须保留山外科技的版权声明。
//    9  *
//   10  * @file       vectors.c
//   11  * @brief      中断向量表
//   12  * @author     山外科技
//   13  * @version    v5.0
//   14  * @date       2013-07-02
//   15  */
//   16 
//   17 
//   18 #include "vectors.h"
//   19 #include "MK60_it.h"
//   20 #include "common.h"
//   21 
//   22 
//   23 
//   24 
//   25 #pragma location = ".intvec"                    //指定 如下数组放入 intvec 段

        SECTION `.intvec`:CONST:REORDER:NOROOT(2)
//   26 const vector_entry  __vector_table[] =          //@ ".intvec" =
__vector_table:
        DATA
        DC32 __BOOT_STACK_ADDRESS, Reset_Handler, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, default_isr, default_isr, default_isr
        DC32 default_isr, default_isr, 0FFFFFFFFH, 0FFFFFFFFH, 0FFFFFFFFH
        DC32 0FFFFFFFEH

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//   27 {
//   28     VECTOR_000,           /* 此值复位启动时复制到 SP ，即指定栈地址          */
//   29     VECTOR_001,           /* 此值复位启动时复制到 PC ，即启动马上执行的函数  */
//   30     VECTOR_002,
//   31     VECTOR_003,
//   32     VECTOR_004,
//   33     VECTOR_005,
//   34     VECTOR_006,
//   35     VECTOR_007,
//   36     VECTOR_008,
//   37     VECTOR_009,
//   38     VECTOR_010,
//   39     VECTOR_011,
//   40     VECTOR_012,
//   41     VECTOR_013,
//   42     VECTOR_014,
//   43     VECTOR_015,
//   44     VECTOR_016,
//   45     VECTOR_017,
//   46     VECTOR_018,
//   47     VECTOR_019,
//   48     VECTOR_020,
//   49     VECTOR_021,
//   50     VECTOR_022,
//   51     VECTOR_023,
//   52     VECTOR_024,
//   53     VECTOR_025,
//   54     VECTOR_026,
//   55     VECTOR_027,
//   56     VECTOR_028,
//   57     VECTOR_029,
//   58     VECTOR_030,
//   59     VECTOR_031,
//   60     VECTOR_032,
//   61     VECTOR_033,
//   62     VECTOR_034,
//   63     VECTOR_035,
//   64     VECTOR_036,
//   65     VECTOR_037,
//   66     VECTOR_038,
//   67     VECTOR_039,
//   68     VECTOR_040,
//   69     VECTOR_041,
//   70     VECTOR_042,
//   71     VECTOR_043,
//   72     VECTOR_044,
//   73     VECTOR_045,
//   74     VECTOR_046,
//   75     VECTOR_047,
//   76     VECTOR_048,
//   77     VECTOR_049,
//   78     VECTOR_050,
//   79     VECTOR_051,
//   80     VECTOR_052,
//   81     VECTOR_053,
//   82     VECTOR_054,
//   83     VECTOR_055,
//   84     VECTOR_056,
//   85     VECTOR_057,
//   86     VECTOR_058,
//   87     VECTOR_059,
//   88     VECTOR_060,
//   89     VECTOR_061,
//   90     VECTOR_062,
//   91     VECTOR_063,
//   92     VECTOR_064,
//   93     VECTOR_065,
//   94     VECTOR_066,
//   95     VECTOR_067,
//   96     VECTOR_068,
//   97     VECTOR_069,
//   98     VECTOR_070,
//   99     VECTOR_071,
//  100     VECTOR_072,
//  101     VECTOR_073,
//  102     VECTOR_074,
//  103     VECTOR_075,
//  104     VECTOR_076,
//  105     VECTOR_077,
//  106     VECTOR_078,
//  107     VECTOR_079,
//  108     VECTOR_080,
//  109     VECTOR_081,
//  110     VECTOR_082,
//  111     VECTOR_083,
//  112     VECTOR_084,
//  113     VECTOR_085,
//  114     VECTOR_086,
//  115     VECTOR_087,
//  116     VECTOR_088,
//  117     VECTOR_089,
//  118     VECTOR_090,
//  119     VECTOR_091,
//  120     VECTOR_092,
//  121     VECTOR_093,
//  122     VECTOR_094,
//  123     VECTOR_095,
//  124     VECTOR_096,
//  125     VECTOR_097,
//  126     VECTOR_098,
//  127     VECTOR_099,
//  128     VECTOR_100,
//  129     VECTOR_101,
//  130     VECTOR_102,
//  131     VECTOR_103,
//  132     VECTOR_104,
//  133     VECTOR_105,
//  134     VECTOR_106,
//  135     VECTOR_107,
//  136     VECTOR_108,
//  137     VECTOR_109,
//  138     VECTOR_110,
//  139     VECTOR_111,
//  140     VECTOR_112,
//  141     VECTOR_113,
//  142     VECTOR_114,
//  143     VECTOR_115,
//  144     VECTOR_116,
//  145     VECTOR_117,
//  146     VECTOR_118,
//  147     VECTOR_119,
//  148     VECTOR_120,
//  149     VECTOR_121,
//  150     VECTOR_122,
//  151     VECTOR_123,
//  152     VECTOR_124,
//  153     VECTOR_125,
//  154     VECTOR_126,
//  155     VECTOR_127,
//  156     VECTOR_128,
//  157     VECTOR_129,
//  158     VECTOR_130,
//  159     VECTOR_131,
//  160     VECTOR_132,
//  161     VECTOR_133,
//  162     VECTOR_134,
//  163     VECTOR_135,
//  164     VECTOR_136,
//  165     VECTOR_137,
//  166     VECTOR_138,
//  167     VECTOR_139,
//  168     VECTOR_140,
//  169     VECTOR_141,
//  170     VECTOR_142,
//  171     VECTOR_143,
//  172     VECTOR_144,
//  173     VECTOR_145,
//  174     VECTOR_146,
//  175     VECTOR_147,
//  176     VECTOR_148,
//  177     VECTOR_149,
//  178     VECTOR_150,
//  179     VECTOR_151,
//  180     VECTOR_152,
//  181     VECTOR_153,
//  182     VECTOR_154,
//  183     VECTOR_155,
//  184     VECTOR_156,
//  185     VECTOR_157,
//  186     VECTOR_158,
//  187     VECTOR_159,
//  188     VECTOR_160,
//  189     VECTOR_161,
//  190     VECTOR_162,
//  191     VECTOR_163,
//  192     VECTOR_164,
//  193     VECTOR_165,
//  194     VECTOR_166,
//  195     VECTOR_167,
//  196     VECTOR_168,
//  197     VECTOR_169,
//  198     VECTOR_170,
//  199     VECTOR_171,
//  200     VECTOR_172,
//  201     VECTOR_173,
//  202     VECTOR_174,
//  203     VECTOR_175,
//  204     VECTOR_176,
//  205     VECTOR_177,
//  206     VECTOR_178,
//  207     VECTOR_179,
//  208     VECTOR_180,
//  209     VECTOR_181,
//  210     VECTOR_182,
//  211     VECTOR_183,
//  212     VECTOR_184,
//  213     VECTOR_185,
//  214     VECTOR_186,
//  215     VECTOR_187,
//  216     VECTOR_188,
//  217     VECTOR_189,
//  218     VECTOR_190,
//  219     VECTOR_191,
//  220     VECTOR_192,
//  221     VECTOR_193,
//  222     VECTOR_194,
//  223     VECTOR_195,
//  224     VECTOR_196,
//  225     VECTOR_197,
//  226     VECTOR_198,
//  227     VECTOR_199,
//  228     VECTOR_200,
//  229     VECTOR_201,
//  230     VECTOR_202,
//  231     VECTOR_203,
//  232     VECTOR_204,
//  233     VECTOR_205,
//  234     VECTOR_206,
//  235     VECTOR_207,
//  236     VECTOR_208,
//  237     VECTOR_209,
//  238     VECTOR_210,
//  239     VECTOR_211,
//  240     VECTOR_212,
//  241     VECTOR_213,
//  242     VECTOR_214,
//  243     VECTOR_215,
//  244     VECTOR_216,
//  245     VECTOR_217,
//  246     VECTOR_218,
//  247     VECTOR_219,
//  248     VECTOR_220,
//  249     VECTOR_221,
//  250     VECTOR_222,
//  251     VECTOR_223,
//  252     VECTOR_224,
//  253     VECTOR_225,
//  254     VECTOR_226,
//  255     VECTOR_227,
//  256     VECTOR_228,
//  257     VECTOR_229,
//  258     VECTOR_230,
//  259     VECTOR_231,
//  260     VECTOR_232,
//  261     VECTOR_233,
//  262     VECTOR_234,
//  263     VECTOR_235,
//  264     VECTOR_236,
//  265     VECTOR_237,
//  266     VECTOR_238,
//  267     VECTOR_239,
//  268     VECTOR_240,
//  269     VECTOR_241,
//  270     VECTOR_242,
//  271     VECTOR_243,
//  272     VECTOR_244,
//  273     VECTOR_245,
//  274     VECTOR_246,
//  275     VECTOR_247,
//  276     VECTOR_248,
//  277     VECTOR_249,
//  278     VECTOR_250,
//  279     VECTOR_251,
//  280     VECTOR_252,
//  281     VECTOR_253,
//  282     VECTOR_254,
//  283     VECTOR_255,
//  284     CONFIG_1,        /* Flash configuration field values */
//  285     CONFIG_2,        /* Flash configuration field values */
//  286     CONFIG_3,        /* Flash configuration field values */
//  287     CONFIG_4,        /* Flash configuration field values */
//  288 
//  289 };
//  290 
//  291 
//  292 
//  293 /******************************************************************************/
//  294 /* End of "vectors.c" */
// 
// 1 040 bytes in section .intvec
// 
// 1 040 bytes of CONST memory
//
//Errors: none
//Warnings: none
