///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       21/Mar/2017  16:05:33
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        E:\znc\project\K60FN\network_car\Board\src\VCAN_LCD_ILI9341.c
//    Command line =  
//        E:\znc\project\K60FN\network_car\Board\src\VCAN_LCD_ILI9341.c -D
//        DEBUG -D ARM_MATH_CM4 -D MK60F15 -D MK60FN15 -lA
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
//        E:\znc\project\K60FN\network_car\Prj\IAR\FN15_Debug\List\VCAN_LCD_ILI9341.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "1"
        RTMODEL "__dlib_full_locale_support", "1"
        AAPCS BASE,INTERWORK,VFP
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1


        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
// E:\znc\project\K60FN\network_car\Board\src\VCAN_LCD_ILI9341.c
//    1 /*!
//    2  *     COPYRIGHT NOTICE
//    3  *     Copyright (c) 2013,山外科技
//    4  *     All rights reserved.
//    5  *     技术讨论：山外论坛 http://www.vcan123.com
//    6  *
//    7  *     除注明出处外，以下所有内容版权均属山外科技所有，未经允许，不得用于商业用途，
//    8  *     修改内容时必须保留山外科技的版权声明。
//    9  *
//   10  * @file       VCAN_LCD_ILI9341.c
//   11  * @brief      LCD ILI9341函数库
//   12  * @author     山外科技
//   13  * @version    v5.1
//   14  * @date       2014-02-03
//   15  */
//   16 
//   17 #include "common.h"
//   18 #include "MK60_gpio.h"
//   19 #include "VCAN_LCD_ILI9341.h"
//   20 
//   21 
//   22 
//   23 #if (USE_LCD == LCD_ILI9341)
//   24 
//   25 //定义所用到的 IO管脚
//   26 #define LCD_RST    PTC13                //复位
//   27 #define LCD_BL     PTB8                 //背光
//   28 
//   29 
//   30 #define ILI9341_DELAY()          DELAY_MS(100)
//   31 #define ILI9341_DELAYMS(ms)      DELAY_MS(ms)
//   32 
//   33 
//   34 #define ILI9341_H       240
//   35 #define ILI9341_W       320
//   36 
//   37 #if ((ILI9341_DIR_DEFAULT&1 )== 0)      //横屏
//   38 uint16  ili9341_h   = ILI9341_H;
//   39 uint16  ili9341_w   = ILI9341_W;
//   40 #else
//   41 uint16  ili9341_h   = ILI9341_W;
//   42 uint16  ili9341_w   = ILI9341_H;
//   43 #endif
//   44 uint8   ili9341_dir = ILI9341_DIR_DEFAULT;
//   45 /*!
//   46  *  @brief      LCD_ILI9341初始化
//   47  *  @since      v5.0
//   48  */
//   49 void    LCD_ILI9341_init()
//   50 {
//   51     gpio_init (LCD_BL, GPO, 1); //LCD背光管脚输出1，表示关闭LCD背光
//   52 
//   53     //复位LCD
//   54     gpio_init (LCD_RST, GPO, 0);
//   55 
//   56     ILI9341_DELAYMS(1);
//   57     GPIO_SET   (LCD_RST, 1);
//   58 
//   59     //初始化总线
//   60     flexbus_8080_init();
//   61 
//   62     ILI9341_DELAY();
//   63     LCD_ILI9341_WR_CMD(0xCF);
//   64     LCD_ILI9341_WR_DATA(0x00);
//   65     LCD_ILI9341_WR_DATA(0x81);
//   66     LCD_ILI9341_WR_DATA(0x30);
//   67 
//   68     ILI9341_DELAY();
//   69     LCD_ILI9341_WR_CMD(0xED);
//   70     LCD_ILI9341_WR_DATA(0x64);
//   71     LCD_ILI9341_WR_DATA(0x03);
//   72     LCD_ILI9341_WR_DATA(0x12);
//   73     LCD_ILI9341_WR_DATA(0x81);
//   74 
//   75     ILI9341_DELAY();
//   76     LCD_ILI9341_WR_CMD(0xE8);
//   77     LCD_ILI9341_WR_DATA(0x85);
//   78     LCD_ILI9341_WR_DATA(0x10);
//   79     LCD_ILI9341_WR_DATA(0x78);
//   80 
//   81     ILI9341_DELAY();
//   82     LCD_ILI9341_WR_CMD(0xCB);
//   83     LCD_ILI9341_WR_DATA(0x39);
//   84     LCD_ILI9341_WR_DATA(0x2C);
//   85     LCD_ILI9341_WR_DATA(0x00);
//   86     LCD_ILI9341_WR_DATA(0x34);
//   87     LCD_ILI9341_WR_DATA(0x02);
//   88 
//   89     ILI9341_DELAY();
//   90     LCD_ILI9341_WR_CMD(0xF7);
//   91     LCD_ILI9341_WR_DATA(0x20);
//   92 
//   93     ILI9341_DELAY();
//   94     LCD_ILI9341_WR_CMD(0xEA);
//   95     LCD_ILI9341_WR_DATA(0x00);
//   96     LCD_ILI9341_WR_DATA(0x00);
//   97 
//   98     ILI9341_DELAY();
//   99     LCD_ILI9341_WR_CMD(0xB1);
//  100     LCD_ILI9341_WR_DATA(0x00);
//  101     LCD_ILI9341_WR_DATA(0x1B);
//  102 
//  103     ILI9341_DELAY();
//  104     LCD_ILI9341_WR_CMD(0xB6);
//  105     LCD_ILI9341_WR_DATA(0x0A);
//  106     LCD_ILI9341_WR_DATA(0xA2);
//  107 
//  108     ILI9341_DELAY();
//  109     LCD_ILI9341_WR_CMD(0xC0);
//  110     LCD_ILI9341_WR_DATA(0x35);
//  111 
//  112     ILI9341_DELAY();
//  113     LCD_ILI9341_WR_CMD(0xC1);
//  114     LCD_ILI9341_WR_DATA(0x11);
//  115 
//  116     LCD_ILI9341_WR_CMD(0xC5);
//  117     LCD_ILI9341_WR_DATA(0x45);
//  118     LCD_ILI9341_WR_DATA(0x45);
//  119 
//  120     LCD_ILI9341_WR_CMD(0xC7);
//  121     LCD_ILI9341_WR_DATA(0xA2);
//  122 
//  123     LCD_ILI9341_WR_CMD(0xF2);
//  124     LCD_ILI9341_WR_DATA(0x00);
//  125 
//  126     LCD_ILI9341_WR_CMD(0x26);
//  127     LCD_ILI9341_WR_DATA(0x01);
//  128     ILI9341_DELAY();
//  129     LCD_ILI9341_WR_CMD(0xE0); //Set Gamma
//  130     LCD_ILI9341_WR_DATA(0x0F);
//  131     LCD_ILI9341_WR_DATA(0x26);
//  132     LCD_ILI9341_WR_DATA(0x24);
//  133     LCD_ILI9341_WR_DATA(0x0B);
//  134     LCD_ILI9341_WR_DATA(0x0E);
//  135     LCD_ILI9341_WR_DATA(0x09);
//  136     LCD_ILI9341_WR_DATA(0x54);
//  137     LCD_ILI9341_WR_DATA(0xA8);
//  138     LCD_ILI9341_WR_DATA(0x46);
//  139     LCD_ILI9341_WR_DATA(0x0C);
//  140     LCD_ILI9341_WR_DATA(0x17);
//  141     LCD_ILI9341_WR_DATA(0x09);
//  142     LCD_ILI9341_WR_DATA(0x0F);
//  143     LCD_ILI9341_WR_DATA(0x07);
//  144     LCD_ILI9341_WR_DATA(0x00);
//  145     LCD_ILI9341_WR_CMD(0XE1); //Set Gamma
//  146     LCD_ILI9341_WR_DATA(0x00);
//  147     LCD_ILI9341_WR_DATA(0x19);
//  148     LCD_ILI9341_WR_DATA(0x1B);
//  149     LCD_ILI9341_WR_DATA(0x04);
//  150     LCD_ILI9341_WR_DATA(0x10);
//  151     LCD_ILI9341_WR_DATA(0x07);
//  152     LCD_ILI9341_WR_DATA(0x2A);
//  153     LCD_ILI9341_WR_DATA(0x47);
//  154     LCD_ILI9341_WR_DATA(0x39);
//  155     LCD_ILI9341_WR_DATA(0x03);
//  156     LCD_ILI9341_WR_DATA(0x06);
//  157     LCD_ILI9341_WR_DATA(0x06);
//  158     LCD_ILI9341_WR_DATA(0x30);
//  159     LCD_ILI9341_WR_DATA(0x38);
//  160     LCD_ILI9341_WR_DATA(0x0F);
//  161     ILI9341_DELAY();
//  162 
//  163 
//  164     ILI9341_DELAY();
//  165     LCD_ILI9341_WR_CMD(0x3a); // Memory Access Control
//  166     LCD_ILI9341_WR_DATA(0x55);
//  167     LCD_ILI9341_WR_CMD(0x11); //Exit Sleep
//  168     ILI9341_DELAY();
//  169     LCD_ILI9341_WR_CMD(0x29); //display on
//  170 
//  171 
//  172     LCD_SET_DIR(ili9341_dir);   //液晶方向显示函数
//  173 
//  174     LCD_ILI9341_WR_CMD(0x2c);
//  175 
//  176     PTXn_T(LCD_BL,OUT) = 0;     //开LCD背光
//  177 }
//  178 
//  179 /*!
//  180  *  @brief      设置ILI9341GRAM指针扫描方向
//  181  *  @param      option    方向选择（0~3）
//  182  *  @since      v5.0
//  183  */
//  184 void LCD_ILI9341_dir(uint8 option)
//  185 {
//  186 
//  187     option = option % 4;
//  188 
//  189 
//  190     ili9341_dir = option;
//  191 
//  192 
//  193     switch(option)
//  194     {
//  195         case 0:
//  196         {
//  197             /*横屏*/
//  198             LCD_ILI9341_WR_CMD(0x36);
//  199             LCD_ILI9341_WR_DATA(0xA8);    //横屏
//  200 
//  201             LCD_ILI9341_WR_CMD(0X2A);
//  202             LCD_ILI9341_WR_DATA(0x00);  //start
//  203             LCD_ILI9341_WR_DATA(0x00);
//  204             LCD_ILI9341_WR_DATA(0x01);  //end
//  205             LCD_ILI9341_WR_DATA(0x3F);
//  206 
//  207             LCD_ILI9341_WR_CMD(0X2B);
//  208             LCD_ILI9341_WR_DATA(0x00);   //start
//  209             LCD_ILI9341_WR_DATA(0x00);
//  210             LCD_ILI9341_WR_DATA(0x00);   //end
//  211             LCD_ILI9341_WR_DATA(0xEF);
//  212 
//  213             ili9341_h   = ILI9341_H;
//  214             ili9341_w   = ILI9341_W;
//  215         }
//  216         break;
//  217         case 1:
//  218         {
//  219             /*竖屏*/
//  220             LCD_ILI9341_WR_CMD(0x36);
//  221             LCD_ILI9341_WR_DATA(0xD8);  //竖屏
//  222 
//  223             LCD_ILI9341_WR_CMD(0X2A);
//  224             LCD_ILI9341_WR_DATA(0x00);
//  225             LCD_ILI9341_WR_DATA(0x00);
//  226             LCD_ILI9341_WR_DATA(0x00);
//  227             LCD_ILI9341_WR_DATA(0xEF);
//  228 
//  229             LCD_ILI9341_WR_CMD(0X2B);
//  230             LCD_ILI9341_WR_DATA(0x00);
//  231             LCD_ILI9341_WR_DATA(0x00);
//  232             LCD_ILI9341_WR_DATA(0x01);
//  233             LCD_ILI9341_WR_DATA(0x3F);
//  234 
//  235             ili9341_h   = ILI9341_W;
//  236             ili9341_w   = ILI9341_H;
//  237         }
//  238         break;
//  239         case 2:
//  240         {
//  241             /*横屏*/
//  242             LCD_ILI9341_WR_CMD(0x36);
//  243             LCD_ILI9341_WR_DATA(0x68);    //横屏
//  244 
//  245             LCD_ILI9341_WR_CMD(0X2A);
//  246             LCD_ILI9341_WR_DATA(0x00);  //start
//  247             LCD_ILI9341_WR_DATA(0x00);
//  248             LCD_ILI9341_WR_DATA(0x01);  //end
//  249             LCD_ILI9341_WR_DATA(0x3F);
//  250 
//  251             LCD_ILI9341_WR_CMD(0X2B);
//  252             LCD_ILI9341_WR_DATA(0x00);   //start
//  253             LCD_ILI9341_WR_DATA(0x00);
//  254             LCD_ILI9341_WR_DATA(0x00);   //end
//  255             LCD_ILI9341_WR_DATA(0xEF);
//  256             ili9341_h   = ILI9341_H;
//  257             ili9341_w   = ILI9341_W;
//  258         }
//  259         break;
//  260         case 3:
//  261         {
//  262             /*竖屏*/
//  263             LCD_ILI9341_WR_CMD(0x36);
//  264             LCD_ILI9341_WR_DATA(0x18);  //竖屏
//  265 
//  266             LCD_ILI9341_WR_CMD(0X2A);
//  267             LCD_ILI9341_WR_DATA(0x00);
//  268             LCD_ILI9341_WR_DATA(0x00);
//  269             LCD_ILI9341_WR_DATA(0x00);
//  270             LCD_ILI9341_WR_DATA(0xEF);
//  271 
//  272             LCD_ILI9341_WR_CMD(0X2B);
//  273             LCD_ILI9341_WR_DATA(0x00);
//  274             LCD_ILI9341_WR_DATA(0x00);
//  275             LCD_ILI9341_WR_DATA(0x01);
//  276             LCD_ILI9341_WR_DATA(0x3F);
//  277 
//  278             ili9341_h   = ILI9341_W;
//  279             ili9341_w   = ILI9341_H;
//  280         }
//  281         break;
//  282         default:
//  283             //由于开头有校验，因而不会执行到这里
//  284             //LCD_ILI9341_dir(ILI9341_DIR_DEFAULT);
//  285             break;
//  286 
//  287     }
//  288 
//  289 }
//  290 
//  291 /*!
//  292  *  @brief      设置ILI9341开窗
//  293  *  @param      site        左上角坐标位置
//  294  *  @param      size        开窗大小
//  295  *  @since      v5.0
//  296  */
//  297 void LCD_ILI9341_ptlon(Site_t site, Size_t size)
//  298 {
//  299 
//  300     LCD_ILI9341_WR_CMD(0X2A);
//  301     LCD_ILI9341_WR_DATA(site.x >> 8); //start
//  302     LCD_ILI9341_WR_DATA(site.x & 0xFF);
//  303     LCD_ILI9341_WR_DATA((site.x + size.W - 1) >> 8); //end
//  304     LCD_ILI9341_WR_DATA((site.x  + size.W - 1) & 0xFF);
//  305 
//  306     LCD_ILI9341_WR_CMD(0X2B);
//  307     LCD_ILI9341_WR_DATA(site.y >> 8); //start
//  308     LCD_ILI9341_WR_DATA(site.y & 0xFF);
//  309     LCD_ILI9341_WR_DATA((site.y + size.H - 1) >> 8); //end
//  310     LCD_ILI9341_WR_DATA((site.y + size.H - 1) & 0xFF);
//  311 }
//  312 
//  313 /*!
//  314  *  @brief      获取 ILI9341 高度
//  315  *  @return     ILI9341 高度
//  316  *  @since      v5.0
//  317  */
//  318 uint16 ILI9341_get_h()
//  319 {
//  320     return ili9341_h;
//  321 }
//  322 
//  323 /*!
//  324  *  @brief      获取 ILI9341 宽度
//  325  *  @return     ILI9341 宽度
//  326  *  @since      v5.0
//  327  */
//  328 uint16 ILI9341_get_w()
//  329 {
//  330     return ili9341_w;
//  331 }
//  332 
//  333 /*!
//  334  *  @brief      获取 ILI9341 显示方向
//  335  *  @return     ILI9341 方向
//  336  *  @since      v5.0
//  337  */
//  338 uint8 ILI9341_get_dir()
//  339 {
//  340     return ili9341_dir;
//  341 }
//  342 
//  343 
//  344 #endif //(USE_LCD == LCD_ILI9341)
//  345 
// 
//
// 
//
//
//Errors: none
//Warnings: none
