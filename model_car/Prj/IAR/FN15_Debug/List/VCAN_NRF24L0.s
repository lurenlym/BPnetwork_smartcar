///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       21/Mar/2017  16:05:43
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\znc\project\K60FN\network_car\Board\src\VCAN_NRF24L0.c
//    Command line =  
//        E:\znc\project\K60FN\network_car\Board\src\VCAN_NRF24L0.c -D DEBUG -D
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
//        E:\znc\project\K60FN\network_car\Prj\IAR\FN15_Debug\List\VCAN_NRF24L0.s
//
///////////////////////////////////////////////////////////////////////////////

        RTMODEL "__SystemLibrary", "DLib"
        RTMODEL "__dlib_file_descriptor", "1"
        RTMODEL "__dlib_full_locale_support", "1"
        AAPCS BASE,INTERWORK,VFP
        PRESERVE8
        REQUIRE8

        #define SHT_PROGBITS 0x1

        EXTERN gpio_init
        EXTERN port_init_NoALT
        EXTERN spi_init
        EXTERN spi_mosi
        EXTERN spi_mosi_cmd
        EXTERN vcan_cpy

        PUBLIC NRF_ISR_RX_FIFO
        PUBLIC RX_ADDRESS
        PUBLIC TX_ADDRESS
        PUBLIC nrf_handler
        PUBLIC nrf_init
        PUBLIC nrf_irq_tx_addr
        PUBLIC nrf_irq_tx_flag
        PUBLIC nrf_irq_tx_pnum
        PUBLIC nrf_link_check
        PUBLIC nrf_mode
        PUBLIC nrf_rx
        PUBLIC nrf_rx_fifo_check
        PUBLIC nrf_rx_flag
        PUBLIC nrf_rx_front
        PUBLIC nrf_rx_rear
        PUBLIC nrf_tx
        PUBLIC nrf_tx_state
        
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
        
// E:\znc\project\K60FN\network_car\Board\src\VCAN_NRF24L0.c
//    1 /*!
//    2  *     COPYRIGHT NOTICE
//    3  *     Copyright (c) 2013,山外科技
//    4  *     All rights reserved.
//    5  *     技术讨论：山外论坛 http://www.vcan123.com
//    6  *
//    7  *     除注明出处外，以下所有内容版权均属山外科技所有，未经允许，不得用于商业用途，
//    8  *     修改内容时必须保留山外科技的版权声明。
//    9  *
//   10  * @file       VCAN_NRF24L0.c
//   11  * @brief      NRF24L0驱动函数实现
//   12  * @author     山外科技
//   13  * @version    v5.0
//   14  * @date       2013-07-9
//   15  */
//   16 
//   17 
//   18 #include "common.h"
//   19 #include "MK60_port.h"
//   20 #include "MK60_gpio.h"
//   21 #include "MK60_spi.h"
//   22 
//   23 #include "VCAN_NRF24L0.h"
//   24 
//   25 //NRF24L01+状态
//   26 typedef enum
//   27 {
//   28     NOT_INIT = 0,
//   29     TX_MODE,
//   30     RX_MODE,
//   31 } nrf_mode_e;
//   32 
//   33 typedef enum
//   34 {
//   35     QUEUE_EMPTY = 0,        //队列空模式，只可入队列
//   36     QUEUE_NORMAL,           //正常模式，可正常出入队列，即队列不空不满
//   37     QUEUE_FULL,             //队列满模式，满了则不再添加，丢弃掉数据
//   38 } nrf_rx_queueflag_e; //中断接收时，队列状态标记位
//   39 
//   40 
//   41 //gpio控制CE和IRQ
//   42 #define NRF_CE_HIGH()       GPIO_SET(NRF_CE_PTXn,1)
//   43 #define NRF_CE_LOW()        GPIO_SET(NRF_CE_PTXn,0)           //CE置低
//   44 #define NRF_Read_IRQ()      GPIO_SET(NRF_IRQ_PTXn)
//   45 
//   46 
//   47 // 用户配置 发送和 接收地址，频道
//   48 

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   49 uint8 TX_ADDRESS[5] = {0x34, 0x43, 0x10, 0x10, 0x01};   // 定义一个静态发送地址
TX_ADDRESS:
        DATA
        DC8 52, 67, 16, 16, 1, 0, 0, 0

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   50 uint8 RX_ADDRESS[5] = {0x34, 0x43, 0x10, 0x10, 0x01};
RX_ADDRESS:
        DATA
        DC8 52, 67, 16, 16, 1, 0, 0, 0
//   51 
//   52 #define CHANAL          40                              //频道选择
//   53 
//   54 
//   55 // 内部配置参量
//   56 #define TX_ADR_WIDTH    ADR_WIDTH                       //发射地址宽度
//   57 #define TX_PLOAD_WIDTH  DATA_PACKET                     //发射数据通道有效数据宽度0~32Byte
//   58 
//   59 #define RX_ADR_WIDTH    ADR_WIDTH                       //接收地址宽度
//   60 #define RX_PLOAD_WIDTH  DATA_PACKET                     //接收数据通道有效数据宽度0~32Byte
//   61 
//   62 /******************************** NRF24L01+ 寄存器命令 宏定义***************************************/
//   63 
//   64 // SPI(nRF24L01) commands , NRF的SPI命令宏定义，详见NRF功能使用文档
//   65 #define NRF_READ_REG    0x00    // Define read command to register
//   66 #define NRF_WRITE_REG   0x20    // Define write command to register
//   67 #define RD_RX_PLOAD     0x61    // Define RX payload register address
//   68 #define WR_TX_PLOAD     0xA0    // Define TX payload register address
//   69 #define FLUSH_TX        0xE1    // Define flush TX register command
//   70 #define FLUSH_RX        0xE2    // Define flush RX register command
//   71 #define REUSE_TX_PL     0xE3    // Define reuse TX payload register command
//   72 #define NOP             0xFF    // Define No Operation, might be used to read status register
//   73 
//   74 // SPI(nRF24L01) registers(addresses) ，NRF24L01 相关寄存器地址的宏定义
//   75 #define CONFIG      0x00        // 'Config' register address
//   76 #define EN_AA       0x01        // 'Enable Auto Acknowledgment' register address
//   77 #define EN_RXADDR   0x02        // 'Enabled RX addresses' register address
//   78 #define SETUP_AW    0x03        // 'Setup address width' register address
//   79 #define SETUP_RETR  0x04        // 'Setup Auto. Retrans' register address
//   80 #define RF_CH       0x05        // 'RF channel' register address
//   81 #define RF_SETUP    0x06        // 'RF setup' register address
//   82 #define STATUS      0x07        // 'Status' register address
//   83 #define OBSERVE_TX  0x08        // 'Observe TX' register address
//   84 #define CD          0x09        // 'Carrier Detect' register address
//   85 #define RX_ADDR_P0  0x0A        // 'RX address pipe0' register address
//   86 #define RX_ADDR_P1  0x0B        // 'RX address pipe1' register address
//   87 #define RX_ADDR_P2  0x0C        // 'RX address pipe2' register address
//   88 #define RX_ADDR_P3  0x0D        // 'RX address pipe3' register address
//   89 #define RX_ADDR_P4  0x0E        // 'RX address pipe4' register address
//   90 #define RX_ADDR_P5  0x0F        // 'RX address pipe5' register address
//   91 #define TX_ADDR     0x10        // 'TX address' register address
//   92 #define RX_PW_P0    0x11        // 'RX payload width, pipe0' register address
//   93 #define RX_PW_P1    0x12        // 'RX payload width, pipe1' register address
//   94 #define RX_PW_P2    0x13        // 'RX payload width, pipe2' register address
//   95 #define RX_PW_P3    0x14        // 'RX payload width, pipe3' register address
//   96 #define RX_PW_P4    0x15        // 'RX payload width, pipe4' register address
//   97 #define RX_PW_P5    0x16        // 'RX payload width, pipe5' register address
//   98 #define FIFO_STATUS 0x17        // 'FIFO Status Register' register address
//   99 
//  100 
//  101 //几个重要的状态标记
//  102 #define TX_FULL     0x01        //TX FIFO 寄存器满标志。 1 为 满，0为 不满
//  103 #define MAX_RT      0x10        //达到最大重发次数中断标志位
//  104 #define TX_DS       0x20        //发送完成中断标志位
//  105 #define RX_DR       0x40        //接收到数据中断标志位
//  106 
//  107 
//  108 
//  109 //内部寄存器操作函数声明
//  110 static  uint8   nrf_writereg(uint8 reg, uint8 dat);
//  111 static  uint8   nrf_readreg (uint8 reg, uint8 *dat);
//  112 
//  113 static  uint8   nrf_writebuf(uint8 reg , uint8 *pBuf, uint32 len);
//  114 static  uint8   nrf_readbuf (uint8 reg, uint8 *pBuf, uint32  len);
//  115 
//  116 
//  117 static  void    nrf_rx_mode(void);           //进入接收模式
//  118 static  void    nrf_tx_mode(void);           //进入发送模式
//  119 
//  120 /*!
//  121  *  @brief      NRF24L01+ 模式标记
//  122  */

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//  123 volatile uint8  nrf_mode = NOT_INIT;
nrf_mode:
        DS8 1
//  124 
//  125 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//  126 volatile uint8  nrf_rx_front = 0, nrf_rx_rear = 0;              //接收FIFO的指针
nrf_rx_front:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
nrf_rx_rear:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//  127 volatile uint8  nrf_rx_flag = QUEUE_EMPTY;
nrf_rx_flag:
        DS8 1
//  128 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  129 uint8 NRF_ISR_RX_FIFO[RX_FIFO_PACKET_NUM][DATA_PACKET];         //中断接收的FIFO
NRF_ISR_RX_FIFO:
        DS8 2560
//  130 
//  131 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  132 volatile uint8    *nrf_irq_tx_addr      = NULL;
nrf_irq_tx_addr:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//  133 volatile uint32    nrf_irq_tx_pnum      = 0;                    //pnum = (len+MAX_ONCE_TX_NUM -1)  / MAX_ONCE_TX_NUM
nrf_irq_tx_pnum:
        DS8 4
//  134 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//  135 volatile uint8      nrf_irq_tx_flag  = 0;                     //0 表示成功 ，1 表示 发送失败
nrf_irq_tx_flag:
        DS8 1
//  136 
//  137 /*!
//  138  *  @brief      NRF24L01+初始化，默认进入接收模式
//  139  *  @return     初始化成功标记，0为初始化失败，1为初始化成功
//  140  *  @since      v5.0
//  141  *  Sample usage:
//  142                         while(!nrf_init())                                     //初始化NRF24L01+ ,等待初始化成功为止
//  143                         {
//  144                             printf("\n  NRF与MCU连接失败，请重新检查接线。\n");
//  145                         }
//  146 
//  147                         printf("\n      NRF与MCU连接成功！\n");
//  148  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock0 Using cfiCommon0
          CFI Function nrf_init
        THUMB
//  149 uint8 nrf_init(void)
//  150 {
nrf_init:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  151     //配置NRF管脚复用
//  152     spi_init(NRF_SPI, NRF_CS, MASTER,12500*1000);                     //初始化SPI,主机模式
        LDR.W    R3,??DataTable8  ;; 0xbebc20
        MOVS     R2,#+0
        MOVS     R1,#+1
        MOVS     R0,#+0
          CFI FunCall spi_init
        BL       spi_init
//  153 
//  154     gpio_init(NRF_CE_PTXn, GPO, LOW);                               //初始化CE，默认进入待机模式
        MOVS     R2,#+0
        MOVS     R1,#+1
        MOVS     R0,#+156
          CFI FunCall gpio_init
        BL       gpio_init
//  155 
//  156     gpio_init(NRF_IRQ_PTXn, GPI, LOW);                              //初始化IRQ管脚为输入
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+155
          CFI FunCall gpio_init
        BL       gpio_init
//  157     port_init_NoALT(NRF_IRQ_PTXn, IRQ_FALLING | PULLUP);            //初始化IRQ管脚为下降沿 触发中断
        LDR.W    R1,??DataTable8_1  ;; 0xa0003
        MOVS     R0,#+155
          CFI FunCall port_init_NoALT
        BL       port_init_NoALT
//  158 
//  159     //配置NRF寄存器
//  160     NRF_CE_LOW();
        MOVS     R0,#+0
        LDR.W    R1,??DataTable8_2  ;; 0x43fe2070
        STR      R0,[R1, #+0]
//  161 
//  162     nrf_writereg(NRF_WRITE_REG + SETUP_AW, ADR_WIDTH - 2);          //设置地址长度为 TX_ADR_WIDTH
        MOVS     R1,#+3
        MOVS     R0,#+35
          CFI FunCall nrf_writereg
        BL       nrf_writereg
//  163 
//  164     nrf_writereg(NRF_WRITE_REG + RF_CH, CHANAL);                    //设置RF通道为CHANAL
        MOVS     R1,#+40
        MOVS     R0,#+37
          CFI FunCall nrf_writereg
        BL       nrf_writereg
//  165     nrf_writereg(NRF_WRITE_REG + RF_SETUP, 0x0f);                   //设置TX发射参数,0db增益,2Mbps,低噪声增益开启
        MOVS     R1,#+15
        MOVS     R0,#+38
          CFI FunCall nrf_writereg
        BL       nrf_writereg
//  166 
//  167     nrf_writereg(NRF_WRITE_REG + EN_AA, 0x01);                      //使能通道0的自动应答
        MOVS     R1,#+1
        MOVS     R0,#+33
          CFI FunCall nrf_writereg
        BL       nrf_writereg
//  168 
//  169     nrf_writereg(NRF_WRITE_REG + EN_RXADDR, 0x01);                  //使能通道0的接收地址
        MOVS     R1,#+1
        MOVS     R0,#+34
          CFI FunCall nrf_writereg
        BL       nrf_writereg
//  170 
//  171     //RX模式配置
//  172     nrf_writebuf(NRF_WRITE_REG + RX_ADDR_P0, RX_ADDRESS, RX_ADR_WIDTH); //写RX节点地址
        MOVS     R2,#+5
        LDR.W    R1,??DataTable8_3
        MOVS     R0,#+42
          CFI FunCall nrf_writebuf
        BL       nrf_writebuf
//  173 
//  174     nrf_writereg(NRF_WRITE_REG + RX_PW_P0, RX_PLOAD_WIDTH);         //选择通道0的有效数据宽度
        MOVS     R1,#+32
        MOVS     R0,#+49
          CFI FunCall nrf_writereg
        BL       nrf_writereg
//  175 
//  176     nrf_writereg(FLUSH_RX, NOP);                                    //清除RX FIFO寄存器
        MOVS     R1,#+255
        MOVS     R0,#+226
          CFI FunCall nrf_writereg
        BL       nrf_writereg
//  177 
//  178     //TX模式配置
//  179     nrf_writebuf(NRF_WRITE_REG + TX_ADDR, TX_ADDRESS, TX_ADR_WIDTH); //写TX节点地址
        MOVS     R2,#+5
        LDR.W    R1,??DataTable8_4
        MOVS     R0,#+48
          CFI FunCall nrf_writebuf
        BL       nrf_writebuf
//  180 
//  181     nrf_writereg(NRF_WRITE_REG + SETUP_RETR, 0x0F);                 //设置自动重发间隔时间:250us + 86us;最大自动重发次数:15次
        MOVS     R1,#+15
        MOVS     R0,#+36
          CFI FunCall nrf_writereg
        BL       nrf_writereg
//  182 
//  183     nrf_writereg(FLUSH_TX, NOP);                                    //清除TX FIFO寄存器
        MOVS     R1,#+255
        MOVS     R0,#+225
          CFI FunCall nrf_writereg
        BL       nrf_writereg
//  184 
//  185     nrf_rx_mode();                                                  //默认进入接收模式
          CFI FunCall nrf_rx_mode
        BL       nrf_rx_mode
//  186 
//  187     NRF_CE_HIGH();
        MOVS     R0,#+1
        LDR.W    R1,??DataTable8_2  ;; 0x43fe2070
        STR      R0,[R1, #+0]
//  188 
//  189     return nrf_link_check();
          CFI FunCall nrf_link_check
        BL       nrf_link_check
        POP      {R1,PC}          ;; return
          CFI EndBlock cfiBlock0
//  190 
//  191 }
//  192 
//  193 /*!
//  194  *  @brief      NRF24L01+写寄存器
//  195  *  @param      reg         寄存器
//  196  *  @param      dat         需要写入的数据
//  197  *  @return     NRF24L01+ 状态
//  198  *  @since      v5.0
//  199  *  Sample usage:    nrf_writereg(NRF_WRITE_REG + RF_CH, CHANAL);   //设置RF通道为CHANAL
//  200  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock1 Using cfiCommon0
          CFI Function nrf_writereg
        THUMB
//  201 uint8 nrf_writereg(uint8 reg, uint8 dat)
//  202 {
nrf_writereg:
        PUSH     {R4,R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
        SUB      SP,SP,#+12
          CFI CFA R13+24
        MOVS     R4,R0
        MOVS     R5,R1
//  203     uint8 buff[2];
//  204 
//  205     buff[0] = reg;          //先发送寄存器
        STRB     R4,[SP, #+4]
//  206     buff[1] = dat;          //再发送数据
        STRB     R5,[SP, #+5]
//  207 
//  208     spi_mosi(NRF_SPI, NRF_CS, buff, buff, 2); //发送buff里数据，并采集到 buff里
        MOVS     R0,#+2
        STR      R0,[SP, #+0]
        ADD      R3,SP,#+4
        ADD      R2,SP,#+4
        MOVS     R1,#+1
        MOVS     R0,#+0
          CFI FunCall spi_mosi
        BL       spi_mosi
//  209 
//  210     /*返回状态寄存器的值*/
//  211     return buff[0];
        LDRB     R0,[SP, #+4]
        POP      {R1-R5,PC}       ;; return
          CFI EndBlock cfiBlock1
//  212 }
//  213 
//  214 /*!
//  215  *  @brief      NRF24L01+读寄存器
//  216  *  @param      reg         寄存器
//  217  *  @param      dat         需要读取的数据的存放地址
//  218  *  @return     NRF24L01+ 状态
//  219  *  @since      v5.0
//  220  *  Sample usage:
//  221                     uint8 data;
//  222                     nrf_readreg(STATUS,&data);
//  223  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock2 Using cfiCommon0
          CFI Function nrf_readreg
        THUMB
//  224 uint8 nrf_readreg(uint8 reg, uint8 *dat)
//  225 {
nrf_readreg:
        PUSH     {R4,R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
        SUB      SP,SP,#+12
          CFI CFA R13+24
        MOVS     R4,R0
        MOVS     R5,R1
//  226 
//  227     uint8 buff[2];
//  228 
//  229     buff[0] = reg;          //先发送寄存器
        STRB     R4,[SP, #+4]
//  230 
//  231     spi_mosi(NRF_SPI, NRF_CS, buff, buff, 2); //发送buff数据，并保存到buff里
        MOVS     R0,#+2
        STR      R0,[SP, #+0]
        ADD      R3,SP,#+4
        ADD      R2,SP,#+4
        MOVS     R1,#+1
        MOVS     R0,#+0
          CFI FunCall spi_mosi
        BL       spi_mosi
//  232 
//  233     *dat = buff[1];                         //提取第二个数据
        LDRB     R0,[SP, #+5]
        STRB     R0,[R5, #+0]
//  234 
//  235     /*返回状态寄存器的值*/
//  236     return buff[0];
        LDRB     R0,[SP, #+4]
        POP      {R1-R5,PC}       ;; return
          CFI EndBlock cfiBlock2
//  237 }
//  238 
//  239 /*!
//  240  *  @brief      NRF24L01+写寄存器一串数据
//  241  *  @param      reg         寄存器
//  242  *  @param      pBuf        需要写入的数据缓冲区
//  243  *  @param      len         需要写入数据长度
//  244  *  @return     NRF24L01+ 状态
//  245  *  @since      v5.0
//  246  *  Sample usage:    nrf_writebuf(NRF_WRITE_REG+TX_ADDR,TX_ADDRESS,TX_ADR_WIDTH);    //写TX节点地址
//  247  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock3 Using cfiCommon0
          CFI Function nrf_writebuf
        THUMB
//  248 uint8 nrf_writebuf(uint8 reg , uint8 *pBuf, uint32 len)
//  249 {
nrf_writebuf:
        PUSH     {R0,R4,R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        SUB      SP,SP,#+16
          CFI CFA R13+32
        MOVS     R4,R1
        MOVS     R5,R2
//  250     spi_mosi_cmd(NRF_SPI, NRF_CS, &reg , &reg, pBuf, NULL, 1 , len); //发送 reg ，pBuf 内容，不接收
        STR      R5,[SP, #+12]
        MOVS     R0,#+1
        STR      R0,[SP, #+8]
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        STR      R4,[SP, #+0]
        ADD      R3,SP,#+16
        ADD      R2,SP,#+16
        MOVS     R1,#+1
        MOVS     R0,#+0
          CFI FunCall spi_mosi_cmd
        BL       spi_mosi_cmd
//  251     return reg;    //返回NRF24L01的状态
        LDRB     R0,[SP, #+16]
        ADD      SP,SP,#+20
          CFI CFA R13+12
        POP      {R4,R5,PC}       ;; return
          CFI EndBlock cfiBlock3
//  252 }
//  253 
//  254 
//  255 /*!
//  256  *  @brief      NRF24L01+读寄存器一串数据
//  257  *  @param      reg         寄存器
//  258  *  @param      dat         需要读取的数据的存放地址
//  259  *  @param      len         需要读取的数据长度
//  260  *  @return     NRF24L01+ 状态
//  261  *  @since      v5.0
//  262  *  Sample usage:
//  263                     uint8 data;
//  264                     nrf_readreg(STATUS,&data);
//  265  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock4 Using cfiCommon0
          CFI Function nrf_readbuf
        THUMB
//  266 uint8 nrf_readbuf(uint8 reg, uint8 *pBuf, uint32 len)
//  267 {
nrf_readbuf:
        PUSH     {R0,R4,R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        SUB      SP,SP,#+16
          CFI CFA R13+32
        MOVS     R4,R1
        MOVS     R5,R2
//  268     spi_mosi_cmd(NRF_SPI, NRF_CS, &reg , &reg, NULL, pBuf, 1 , len); //发送reg，接收到buff
        STR      R5,[SP, #+12]
        MOVS     R0,#+1
        STR      R0,[SP, #+8]
        STR      R4,[SP, #+4]
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        ADD      R3,SP,#+16
        ADD      R2,SP,#+16
        MOVS     R1,#+1
        MOVS     R0,#+0
          CFI FunCall spi_mosi_cmd
        BL       spi_mosi_cmd
//  269 
//  270     return reg;    //返回NRF24L01的状态
        LDRB     R0,[SP, #+16]
        ADD      SP,SP,#+20
          CFI CFA R13+12
        POP      {R4,R5,PC}       ;; return
          CFI EndBlock cfiBlock4
//  271 }
//  272 
//  273 /*!
//  274  *  @brief      检测NRF24L01+与MCU是否正常连接
//  275  *  @return     NRF24L01+ 的通信状态，0表示通信不正常，1表示正常
//  276  *  @since      v5.0
//  277  *  Sample usage:
//  278                     while(nrf_link_check() == 0)
//  279                     {
//  280                         printf("\n通信失败");
//  281                     }
//  282  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock5 Using cfiCommon0
          CFI Function nrf_link_check
        THUMB
//  283 uint8 nrf_link_check(void)
//  284 {
nrf_link_check:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+32
          CFI CFA R13+40
//  285 #define NRF_CHECH_DATA  0xC2        //此值为校验数据时使用，可修改为其他值
//  286 
//  287     uint8 reg;
//  288 
//  289     uint8 buff[5] = {NRF_CHECH_DATA, NRF_CHECH_DATA, NRF_CHECH_DATA, NRF_CHECH_DATA, NRF_CHECH_DATA};
        ADD      R0,SP,#+20
        LDR.W    R1,??DataTable8_5
        LDM      R1!,{R2,R3}
        STM      R0!,{R2,R3}
        SUBS     R1,R1,#+8
        SUBS     R0,R0,#+8
//  290     uint8 i;
//  291 
//  292 
//  293     reg = NRF_WRITE_REG + TX_ADDR;
        MOVS     R0,#+48
        STRB     R0,[SP, #+16]
//  294     spi_mosi_cmd(NRF_SPI, NRF_CS, &reg, NULL , buff, NULL, 1 , 5); //写入校验数据
        MOVS     R0,#+5
        STR      R0,[SP, #+12]
        MOVS     R0,#+1
        STR      R0,[SP, #+8]
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        ADD      R0,SP,#+20
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        ADD      R2,SP,#+16
        MOVS     R1,#+1
        MOVS     R0,#+0
          CFI FunCall spi_mosi_cmd
        BL       spi_mosi_cmd
//  295 
//  296     reg = TX_ADDR;
        MOVS     R0,#+16
        STRB     R0,[SP, #+16]
//  297     spi_mosi_cmd(NRF_SPI, NRF_CS, &reg, NULL , NULL, buff, 1 , 5); //读取校验数据
        MOVS     R0,#+5
        STR      R0,[SP, #+12]
        MOVS     R0,#+1
        STR      R0,[SP, #+8]
        ADD      R0,SP,#+20
        STR      R0,[SP, #+4]
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        ADD      R2,SP,#+16
        MOVS     R1,#+1
        MOVS     R0,#+0
          CFI FunCall spi_mosi_cmd
        BL       spi_mosi_cmd
//  298 
//  299 
//  300     /*比较*/
//  301     for(i = 0; i < 5; i++)
        MOVS     R0,#+0
        MOVS     R4,R0
??nrf_link_check_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+5
        BGE.N    ??nrf_link_check_1
//  302     {
//  303         if(buff[i] != NRF_CHECH_DATA)
        ADD      R0,SP,#+20
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDRB     R0,[R4, R0]
        CMP      R0,#+194
        BEQ.N    ??nrf_link_check_2
//  304         {
//  305             return 0 ;        //MCU与NRF不正常连接
        MOVS     R0,#+0
        B.N      ??nrf_link_check_3
//  306         }
//  307     }
??nrf_link_check_2:
        ADDS     R4,R4,#+1
        B.N      ??nrf_link_check_0
//  308     return 1 ;             //MCU与NRF成功连接
??nrf_link_check_1:
        MOVS     R0,#+1
??nrf_link_check_3:
        ADD      SP,SP,#+32
          CFI CFA R13+8
        POP      {R4,PC}          ;; return
          CFI EndBlock cfiBlock5
//  309 }
//  310 
//  311 /*!
//  312 *  @brief      NRF24L01+进入接收模式
//  313 *  @since      v5.0
//  314 */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock6 Using cfiCommon0
          CFI Function nrf_rx_mode
        THUMB
//  315 void nrf_rx_mode(void)
//  316 {
nrf_rx_mode:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  317     NRF_CE_LOW();
        MOVS     R0,#+0
        LDR.W    R1,??DataTable8_2  ;; 0x43fe2070
        STR      R0,[R1, #+0]
//  318 
//  319     nrf_writereg(NRF_WRITE_REG + EN_AA, 0x01);          //使能通道0的自动应答
        MOVS     R1,#+1
        MOVS     R0,#+33
          CFI FunCall nrf_writereg
        BL       nrf_writereg
//  320 
//  321     nrf_writereg(NRF_WRITE_REG + EN_RXADDR, 0x01);      //使能通道0的接收地址
        MOVS     R1,#+1
        MOVS     R0,#+34
          CFI FunCall nrf_writereg
        BL       nrf_writereg
//  322 
//  323     nrf_writebuf(NRF_WRITE_REG + RX_ADDR_P0, RX_ADDRESS, RX_ADR_WIDTH); //写RX节点地址
        MOVS     R2,#+5
        LDR.W    R1,??DataTable8_3
        MOVS     R0,#+42
          CFI FunCall nrf_writebuf
        BL       nrf_writebuf
//  324 
//  325 
//  326     nrf_writereg(NRF_WRITE_REG + CONFIG, 0x0B | (IS_CRC16 << 2));       //配置基本工作模式的参数;PWR_UP,EN_CRC,16BIT_CRC,接收模式
        MOVS     R1,#+15
        MOVS     R0,#+32
          CFI FunCall nrf_writereg
        BL       nrf_writereg
//  327 
//  328     /* 清除中断标志*/
//  329     nrf_writereg(NRF_WRITE_REG + STATUS, 0xff);
        MOVS     R1,#+255
        MOVS     R0,#+39
          CFI FunCall nrf_writereg
        BL       nrf_writereg
//  330 
//  331     nrf_writereg(FLUSH_RX, NOP);                    //清除RX FIFO寄存器
        MOVS     R1,#+255
        MOVS     R0,#+226
          CFI FunCall nrf_writereg
        BL       nrf_writereg
//  332 
//  333     /*CE拉高，进入接收模式*/
//  334     NRF_CE_HIGH();
        MOVS     R0,#+1
        LDR.W    R1,??DataTable8_2  ;; 0x43fe2070
        STR      R0,[R1, #+0]
//  335 
//  336     nrf_mode = RX_MODE;
        MOVS     R0,#+2
        LDR.W    R1,??DataTable8_6
        STRB     R0,[R1, #+0]
//  337 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock6
//  338 
//  339 /*!
//  340 *  @brief      NRF24L01+进入发送模式
//  341 *  @since      v5.0
//  342 */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock7 Using cfiCommon0
          CFI Function nrf_tx_mode
        THUMB
//  343 void nrf_tx_mode(void)
//  344 {
nrf_tx_mode:
        PUSH     {R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI CFA R13+8
//  345     volatile uint32 i;
//  346 
//  347     NRF_CE_LOW();
        MOVS     R0,#+0
        LDR.W    R1,??DataTable8_2  ;; 0x43fe2070
        STR      R0,[R1, #+0]
//  348     //DELAY_MS(1);
//  349 
//  350     nrf_writebuf(NRF_WRITE_REG + TX_ADDR, TX_ADDRESS, TX_ADR_WIDTH); //写TX节点地址
        MOVS     R2,#+5
        LDR.W    R1,??DataTable8_4
        MOVS     R0,#+48
          CFI FunCall nrf_writebuf
        BL       nrf_writebuf
//  351 
//  352     nrf_writebuf(NRF_WRITE_REG + RX_ADDR_P0, RX_ADDRESS, RX_ADR_WIDTH); //设置RX节点地址 ,主要为了使能ACK
        MOVS     R2,#+5
        LDR.W    R1,??DataTable8_3
        MOVS     R0,#+42
          CFI FunCall nrf_writebuf
        BL       nrf_writebuf
//  353 
//  354     nrf_writereg(NRF_WRITE_REG + CONFIG, 0x0A | (IS_CRC16 << 2)); //配置基本工作模式的参数;PWR_UP,EN_CRC,16BIT_CRC,发射模式,开启所有中断
        MOVS     R1,#+14
        MOVS     R0,#+32
          CFI FunCall nrf_writereg
        BL       nrf_writereg
//  355 
//  356 
//  357     /*CE拉高，进入发送模式*/
//  358     NRF_CE_HIGH();
        MOVS     R0,#+1
        LDR.N    R1,??DataTable8_2  ;; 0x43fe2070
        STR      R0,[R1, #+0]
//  359 
//  360     nrf_mode = TX_MODE;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable8_6
        STRB     R0,[R1, #+0]
//  361 
//  362     i = 0x0fff;
        MOVW     R0,#+4095
        STR      R0,[SP, #+0]
//  363     while(i--);         //CE要拉高一段时间才进入发送模式
??nrf_tx_mode_0:
        LDR      R0,[SP, #+0]
        SUBS     R1,R0,#+1
        STR      R1,[SP, #+0]
        CMP      R0,#+0
        BNE.N    ??nrf_tx_mode_0
//  364 
//  365     //DELAY_MS(1);
//  366 
//  367 
//  368 }
        POP      {R0,PC}          ;; return
          CFI EndBlock cfiBlock7
//  369 
//  370 /*!
//  371  *  @brief      NRF24L01+数据接收
//  372  *  @param      rxbuf       接收缓冲区地址
//  373  *  @param      len         最大接收长度
//  374  *  @return     实际接收的数据长度
//  375  *  Sample usage:
//  376             relen = nrf_rx(buff,DATA_PACKET);               //等待接收一个数据包，数据存储在buff里
//  377             if(relen != 0)
//  378             {
//  379                 printf("\n接收到数据:%s",buff);             //打印接收到的数据 （这里接收到的是字符串才可以用printf哦！）
//  380             }
//  381 
//  382  *  @since      v5.0
//  383  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock8 Using cfiCommon0
          CFI Function nrf_rx
        THUMB
//  384 uint32  nrf_rx(uint8 *rxbuf, uint32 len)
//  385 {
nrf_rx:
        PUSH     {R3-R7,LR}
          CFI R14 Frame(CFA, -4)
          CFI R7 Frame(CFA, -8)
          CFI R6 Frame(CFA, -12)
          CFI R5 Frame(CFA, -16)
          CFI R4 Frame(CFA, -20)
          CFI CFA R13+24
        MOVS     R4,R0
        MOVS     R5,R1
//  386     uint32 tmplen = 0;
        MOVS     R6,#+0
//  387     uint8 tmp;
//  388 
//  389     while( (nrf_rx_flag != QUEUE_EMPTY) && (len != 0) )
??nrf_rx_0:
        LDR.N    R0,??DataTable8_7
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??nrf_rx_1
        CMP      R5,#+0
        BEQ.N    ??nrf_rx_1
//  390     {
//  391         if(len < DATA_PACKET)
        CMP      R5,#+32
        BCS.N    ??nrf_rx_2
//  392         {
//  393             vcan_cpy(rxbuf, (uint8 *)&(NRF_ISR_RX_FIFO[nrf_rx_front]), len);
        MOVS     R2,R5
        LDR.N    R0,??DataTable8_8
        LDR.N    R1,??DataTable8_9
        LDRB     R1,[R1, #+0]
        ADDS     R1,R0,R1, LSL #+5
        MOVS     R0,R4
          CFI FunCall vcan_cpy
        BL       vcan_cpy
//  394 
//  395             NRF_CE_LOW();           //进入待机状态
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_2  ;; 0x43fe2070
        STR      R0,[R1, #+0]
//  396 
//  397             nrf_rx_front++;                //由于非空，所以可以直接出队列
        LDR.N    R0,??DataTable8_9
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable8_9
        STRB     R0,[R1, #+0]
//  398 
//  399             if(nrf_rx_front >= RX_FIFO_PACKET_NUM)
        LDR.N    R0,??DataTable8_9
        LDRB     R0,[R0, #+0]
        CMP      R0,#+80
        BLT.N    ??nrf_rx_3
//  400             {
//  401                 nrf_rx_front = 0;          //重头开始
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_9
        STRB     R0,[R1, #+0]
//  402             }
//  403             tmp =  nrf_rx_rear;
??nrf_rx_3:
        LDR.N    R0,??DataTable8_10
        LDRB     R0,[R0, #+0]
        MOVS     R7,R0
//  404             if(nrf_rx_front == tmp)       //追到屁股了，接收队列空
        LDR.N    R0,??DataTable8_9
        LDRB     R0,[R0, #+0]
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R0,R7
        BNE.N    ??nrf_rx_4
//  405             {
//  406                 nrf_rx_flag = QUEUE_EMPTY;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_7
        STRB     R0,[R1, #+0]
//  407             }
//  408             NRF_CE_HIGH();          //进入接收模式
??nrf_rx_4:
        MOVS     R0,#+1
        LDR.N    R1,??DataTable8_2  ;; 0x43fe2070
        STR      R0,[R1, #+0]
//  409 
//  410             tmplen += len;
        ADDS     R6,R5,R6
//  411             return tmplen;
        MOVS     R0,R6
        B.N      ??nrf_rx_5
//  412         }
//  413 
//  414         vcan_cpy(rxbuf, (uint8 *)&(NRF_ISR_RX_FIFO[nrf_rx_front]), DATA_PACKET);
??nrf_rx_2:
        MOVS     R2,#+32
        LDR.N    R0,??DataTable8_8
        LDR.N    R1,??DataTable8_9
        LDRB     R1,[R1, #+0]
        ADDS     R1,R0,R1, LSL #+5
        MOVS     R0,R4
          CFI FunCall vcan_cpy
        BL       vcan_cpy
//  415         rxbuf   += DATA_PACKET;
        ADDS     R4,R4,#+32
//  416         len     -= DATA_PACKET;
        SUBS     R5,R5,#+32
//  417         tmplen  += DATA_PACKET;
        ADDS     R6,R6,#+32
//  418 
//  419         NRF_CE_LOW();           //进入待机状态
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_2  ;; 0x43fe2070
        STR      R0,[R1, #+0]
//  420 
//  421         nrf_rx_front++;                //由于非空，所以可以直接出队列
        LDR.N    R0,??DataTable8_9
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable8_9
        STRB     R0,[R1, #+0]
//  422 
//  423         if(nrf_rx_front >= RX_FIFO_PACKET_NUM)
        LDR.N    R0,??DataTable8_9
        LDRB     R0,[R0, #+0]
        CMP      R0,#+80
        BLT.N    ??nrf_rx_6
//  424         {
//  425             nrf_rx_front = 0;          //重头开始
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_9
        STRB     R0,[R1, #+0]
//  426         }
//  427         tmp  = nrf_rx_rear;
??nrf_rx_6:
        LDR.N    R0,??DataTable8_10
        LDRB     R0,[R0, #+0]
        MOVS     R7,R0
//  428         if(nrf_rx_front == tmp)       //追到屁股了，接收队列空
        LDR.N    R0,??DataTable8_9
        LDRB     R0,[R0, #+0]
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R0,R7
        BNE.N    ??nrf_rx_7
//  429         {
//  430             nrf_rx_flag = QUEUE_EMPTY;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_7
        STRB     R0,[R1, #+0]
        B.N      ??nrf_rx_8
//  431         }
//  432         else
//  433         {
//  434             nrf_rx_flag = QUEUE_NORMAL;
??nrf_rx_7:
        MOVS     R0,#+1
        LDR.N    R1,??DataTable8_7
        STRB     R0,[R1, #+0]
//  435         }
//  436         NRF_CE_HIGH();          //进入接收模式
??nrf_rx_8:
        MOVS     R0,#+1
        LDR.N    R1,??DataTable8_2  ;; 0x43fe2070
        STR      R0,[R1, #+0]
        B.N      ??nrf_rx_0
//  437     }
//  438 
//  439     return tmplen;
??nrf_rx_1:
        MOVS     R0,R6
??nrf_rx_5:
        POP      {R1,R4-R7,PC}    ;; return
          CFI EndBlock cfiBlock8
//  440 }
//  441 
//  442 /*!
//  443  *  @brief      NRF24L01+数据发送
//  444  *  @param      rxbuf       发送缓冲区地址
//  445  *  @param      len         发送长度
//  446  *  @return     发送结果，0表示发送失败，1为发送中。最终发送结果需要调用nrf_tx_state()判断。
//  447  *  Sample usage:
//  448                     if(nrf_tx(buff,DATA_PACKET) == 1 );         //发送一个数据包：buff（包为32字节）
//  449                     {
//  450                         //等待发送过程中，此处可以加入处理任务
//  451 
//  452                         while(nrf_tx_state() == NRF_TXING);         //等待发送完成
//  453 
//  454                         if( NRF_TX_OK == nrf_tx_state () )
//  455                         {
//  456                             printf("\n发送成功:%d",i);
//  457                             i++;                                    //发送成功则加1，可验证是否漏包
//  458                         }
//  459                         else
//  460                         {
//  461                             printf("\n发送失败:%d",i);
//  462                         }
//  463                     }
//  464                     else
//  465                     {
//  466                         printf("\n发送失败:%d",i);
//  467                     }
//  468 
//  469  *  @since      v5.0
//  470  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock9 Using cfiCommon0
          CFI Function nrf_tx
        THUMB
//  471 uint8    nrf_tx(uint8 *txbuf, uint32 len)
//  472 {
nrf_tx:
        PUSH     {R3-R5,LR}
          CFI R14 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+16
        MOVS     R4,R0
        MOVS     R5,R1
//  473     nrf_irq_tx_flag = 0;        //复位标志位
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_11
        STRB     R0,[R1, #+0]
//  474 
//  475     if((txbuf == 0 ) || (len == 0))
        CMP      R4,#+0
        BEQ.N    ??nrf_tx_0
        CMP      R5,#+0
        BNE.N    ??nrf_tx_1
//  476     {
//  477         return 0;
??nrf_tx_0:
        MOVS     R0,#+0
        B.N      ??nrf_tx_2
//  478     }
//  479 
//  480     if(nrf_irq_tx_addr == 0 )
??nrf_tx_1:
        LDR.N    R0,??DataTable8_12
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??nrf_tx_3
//  481     {
//  482         //
//  483         nrf_irq_tx_pnum = (len - 1) / DATA_PACKET;        // 进 1 求得 包 的数目
        SUBS     R0,R5,#+1
        LSRS     R0,R0,#+5
        LDR.N    R1,??DataTable8_13
        STR      R0,[R1, #+0]
//  484         nrf_irq_tx_addr = txbuf;
        LDR.N    R0,??DataTable8_12
        STR      R4,[R0, #+0]
//  485 
//  486         if( nrf_mode != TX_MODE)
        LDR.N    R0,??DataTable8_6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ.N    ??nrf_tx_4
//  487         {
//  488             nrf_tx_mode();
          CFI FunCall nrf_tx_mode
        BL       nrf_tx_mode
//  489         }
//  490 
//  491         //需要 先发送一次数据包后才能 中断发送
//  492 
//  493         /*ce为低，进入待机模式1*/
//  494         NRF_CE_LOW();
??nrf_tx_4:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_2  ;; 0x43fe2070
        STR      R0,[R1, #+0]
//  495 
//  496         /*写数据到TX BUF 最大 32个字节*/
//  497         nrf_writebuf(WR_TX_PLOAD, txbuf, DATA_PACKET);
        MOVS     R2,#+32
        MOVS     R1,R4
        MOVS     R0,#+160
          CFI FunCall nrf_writebuf
        BL       nrf_writebuf
//  498 
//  499         /*CE为高，txbuf非空，发送数据包 */
//  500         NRF_CE_HIGH();
        MOVS     R0,#+1
        LDR.N    R1,??DataTable8_2  ;; 0x43fe2070
        STR      R0,[R1, #+0]
//  501 
//  502         return 1;
        MOVS     R0,#+1
        B.N      ??nrf_tx_2
//  503     }
//  504     else
//  505     {
//  506         return 0;
??nrf_tx_3:
        MOVS     R0,#+0
??nrf_tx_2:
        POP      {R1,R4,R5,PC}    ;; return
          CFI EndBlock cfiBlock9
//  507     }
//  508 }
//  509 
//  510 
//  511 /*!
//  512  *  @brief      检查NRF24L01+发送状态
//  513  *  @return     发送结果，参考 nrf_tx_state_e 枚举的定义。
//  514  *  Sample usage:
//  515                     if(nrf_tx(buff,DATA_PACKET) == 1 );         //发送一个数据包：buff（包为32字节）
//  516                     {
//  517                         //等待发送过程中，此处可以加入处理任务
//  518 
//  519                         while(nrf_tx_state() == NRF_TXING);         //等待发送完成
//  520 
//  521                         if( NRF_TX_OK == nrf_tx_state () )
//  522                         {
//  523                             printf("\n发送成功:%d",i);
//  524                             i++;                                    //发送成功则加1，可验证是否漏包
//  525                         }
//  526                         else
//  527                         {
//  528                             printf("\n发送失败:%d",i);
//  529                         }
//  530                     }
//  531                     else
//  532                     {
//  533                         printf("\n发送失败:%d",i);
//  534                     }
//  535 
//  536  *  @since      v5.0
//  537  */

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock10 Using cfiCommon0
          CFI Function nrf_tx_state
          CFI NoCalls
        THUMB
//  538 nrf_tx_state_e nrf_tx_state ()
//  539 {
//  540     /*
//  541     if(nrf_mode != TX_MODE)
//  542     {
//  543         return NRF_NOT_TX;
//  544     }
//  545     */
//  546 
//  547     if((nrf_irq_tx_addr == 0) && (nrf_irq_tx_pnum == 0))
nrf_tx_state:
        LDR.N    R0,??DataTable8_12
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??nrf_tx_state_0
        LDR.N    R0,??DataTable8_13
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??nrf_tx_state_0
//  548     {
//  549         //发送完成
//  550         if(nrf_irq_tx_flag)
        LDR.N    R0,??DataTable8_11
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??nrf_tx_state_1
//  551         {
//  552             return NRF_TX_ERROR;
        MOVS     R0,#+1
        B.N      ??nrf_tx_state_2
//  553         }
//  554         else
//  555         {
//  556             return NRF_TX_OK;
??nrf_tx_state_1:
        MOVS     R0,#+2
        B.N      ??nrf_tx_state_2
//  557         }
//  558     }
//  559     else
//  560     {
//  561         return NRF_TXING;
??nrf_tx_state_0:
        MOVS     R0,#+0
??nrf_tx_state_2:
        BX       LR               ;; return
          CFI EndBlock cfiBlock10
//  562     }
//  563 }
//  564 

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock11 Using cfiCommon0
          CFI Function nrf_handler
        THUMB
//  565 void nrf_handler(void)
//  566 {
nrf_handler:
        PUSH     {R4,LR}
          CFI R14 Frame(CFA, -4)
          CFI R4 Frame(CFA, -8)
          CFI CFA R13+8
        SUB      SP,SP,#+8
          CFI CFA R13+16
//  567     uint8 state;
//  568     uint8 tmp;
//  569     /*读取status寄存器的值  */
//  570     nrf_readreg(STATUS, &state);
        ADD      R1,SP,#+0
        MOVS     R0,#+7
          CFI FunCall nrf_readreg
        BL       nrf_readreg
//  571 
//  572     /* 清除中断标志*/
//  573     nrf_writereg(NRF_WRITE_REG + STATUS, state);
        LDRB     R1,[SP, #+0]
        MOVS     R0,#+39
          CFI FunCall nrf_writereg
        BL       nrf_writereg
//  574 
//  575     if(state & RX_DR) //接收到数据
        LDRB     R0,[SP, #+0]
        LSLS     R0,R0,#+25
        BPL.N    ??nrf_handler_0
//  576     {
//  577         NRF_CE_LOW();
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_2  ;; 0x43fe2070
        STR      R0,[R1, #+0]
//  578 
//  579         if(nrf_rx_flag != QUEUE_FULL)
        LDR.N    R0,??DataTable8_7
        LDRB     R0,[R0, #+0]
        CMP      R0,#+2
        BEQ.N    ??nrf_handler_1
//  580         {
//  581             //还没满，则继续接收
//  582             //printf("+");
//  583             nrf_readbuf(RD_RX_PLOAD, (uint8 *)&(NRF_ISR_RX_FIFO[nrf_rx_rear]), RX_PLOAD_WIDTH); //读取数据
        MOVS     R2,#+32
        LDR.N    R0,??DataTable8_8
        LDR.N    R1,??DataTable8_10
        LDRB     R1,[R1, #+0]
        ADDS     R1,R0,R1, LSL #+5
        MOVS     R0,#+97
          CFI FunCall nrf_readbuf
        BL       nrf_readbuf
//  584 
//  585             nrf_rx_rear++;
        LDR.N    R0,??DataTable8_10
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable8_10
        STRB     R0,[R1, #+0]
//  586 
//  587             if(nrf_rx_rear >= RX_FIFO_PACKET_NUM)
        LDR.N    R0,??DataTable8_10
        LDRB     R0,[R0, #+0]
        CMP      R0,#+80
        BLT.N    ??nrf_handler_2
//  588             {
//  589                 nrf_rx_rear = 0;                            //重头开始
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_10
        STRB     R0,[R1, #+0]
//  590             }
//  591             tmp = nrf_rx_front;
??nrf_handler_2:
        LDR.N    R0,??DataTable8_9
        LDRB     R0,[R0, #+0]
        MOVS     R4,R0
//  592             if(nrf_rx_rear == tmp)                 //追到屁股了，满了
        LDR.N    R0,??DataTable8_10
        LDRB     R0,[R0, #+0]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R0,R4
        BNE.N    ??nrf_handler_3
//  593             {
//  594                 nrf_rx_flag = QUEUE_FULL;
        MOVS     R0,#+2
        LDR.N    R1,??DataTable8_7
        STRB     R0,[R1, #+0]
        B.N      ??nrf_handler_4
//  595             }
//  596             else
//  597             {
//  598                 nrf_rx_flag = QUEUE_NORMAL;
??nrf_handler_3:
        MOVS     R0,#+1
        LDR.N    R1,??DataTable8_7
        STRB     R0,[R1, #+0]
        B.N      ??nrf_handler_4
//  599             }
//  600         }
//  601         else
//  602         {
//  603             nrf_writereg(FLUSH_RX, NOP);                    //清除RX FIFO寄存器
??nrf_handler_1:
        MOVS     R1,#+255
        MOVS     R0,#+226
          CFI FunCall nrf_writereg
        BL       nrf_writereg
//  604         }
//  605         NRF_CE_HIGH();                                      //进入接收模式
??nrf_handler_4:
        MOVS     R0,#+1
        LDR.N    R1,??DataTable8_2  ;; 0x43fe2070
        STR      R0,[R1, #+0]
//  606     }
//  607 
//  608     if(state & TX_DS) //发送完数据
??nrf_handler_0:
        LDRB     R0,[SP, #+0]
        LSLS     R0,R0,#+26
        BPL.N    ??nrf_handler_5
//  609     {
//  610         if(nrf_irq_tx_pnum == 0)
        LDR.N    R0,??DataTable8_13
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??nrf_handler_6
//  611         {
//  612             nrf_irq_tx_addr = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_12
        STR      R0,[R1, #+0]
//  613 
//  614             // 注意: nrf_irq_tx_pnum == 0 表示 数据 已经全部发送到FIFO 。 nrf_irq_tx_addr == 0 才是 全部发送完了
//  615 
//  616             //发送完成后 默认 进入 接收模式
//  617 #if 1
//  618             if( nrf_mode != RX_MODE)
        LDR.N    R0,??DataTable8_6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+2
        BEQ.N    ??nrf_handler_5
//  619             {
//  620                 nrf_rx_mode();
          CFI FunCall nrf_rx_mode
        BL       nrf_rx_mode
        B.N      ??nrf_handler_5
//  621             }
//  622 #endif
//  623 
//  624             //发送长度 为 0个包，即发送完成
//  625             //nrf_writereg(FLUSH_TX, NOP);                        //清除TX FIFO寄存器
//  626         }
//  627         else
//  628         {
//  629             if( nrf_mode != TX_MODE)
??nrf_handler_6:
        LDR.N    R0,??DataTable8_6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BEQ.N    ??nrf_handler_7
//  630             {
//  631                 nrf_tx_mode();
          CFI FunCall nrf_tx_mode
        BL       nrf_tx_mode
//  632             }
//  633 
//  634             //还没发送完成，就继续发送
//  635             nrf_irq_tx_addr += DATA_PACKET;    //指向下一个地址
??nrf_handler_7:
        LDR.N    R0,??DataTable8_12
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+32
        LDR.N    R1,??DataTable8_12
        STR      R0,[R1, #+0]
//  636             nrf_irq_tx_pnum --;                 //包数目减少
        LDR.N    R0,??DataTable8_13
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable8_13
        STR      R0,[R1, #+0]
//  637 
//  638             /*ce为低，进入待机模式1*/
//  639             NRF_CE_LOW();
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_2  ;; 0x43fe2070
        STR      R0,[R1, #+0]
//  640 
//  641             /*写数据到TX BUF 最大 32个字节*/
//  642             nrf_writebuf(WR_TX_PLOAD, (uint8 *)nrf_irq_tx_addr, DATA_PACKET);
        MOVS     R2,#+32
        LDR.N    R0,??DataTable8_12
        LDR      R1,[R0, #+0]
        MOVS     R0,#+160
          CFI FunCall nrf_writebuf
        BL       nrf_writebuf
//  643 
//  644             /*CE为高，txbuf非空，发送数据包 */
//  645             NRF_CE_HIGH();
        MOVS     R0,#+1
        LDR.N    R1,??DataTable8_2  ;; 0x43fe2070
        STR      R0,[R1, #+0]
//  646         }
//  647     }
//  648 
//  649     if(state & MAX_RT)      //发送超时
??nrf_handler_5:
        LDRB     R0,[SP, #+0]
        LSLS     R0,R0,#+27
        BPL.N    ??nrf_handler_8
//  650     {
//  651         nrf_irq_tx_flag = 1;                            //标记发送失败
        MOVS     R0,#+1
        LDR.N    R1,??DataTable8_11
        STRB     R0,[R1, #+0]
//  652         nrf_writereg(FLUSH_TX, NOP);                    //清除TX FIFO寄存器
        MOVS     R1,#+255
        MOVS     R0,#+225
          CFI FunCall nrf_writereg
        BL       nrf_writereg
//  653 
//  654 
//  655         //有可能是 对方也处于 发送状态
//  656 
//  657         //放弃本次发送
//  658         nrf_irq_tx_addr = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_12
        STR      R0,[R1, #+0]
//  659         nrf_irq_tx_pnum = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable8_13
        STR      R0,[R1, #+0]
//  660 
//  661         nrf_rx_mode();                                  //进入 接收状态
          CFI FunCall nrf_rx_mode
        BL       nrf_rx_mode
//  662 
//  663 
//  664         //printf("\nMAX_RT");
//  665     }
//  666 
//  667     if(state & TX_FULL) //TX FIFO 满
//  668     {
//  669         //printf("\nTX_FULL");
//  670 
//  671     }
//  672 }
??nrf_handler_8:
        POP      {R0,R1,R4,PC}    ;; return
          CFI EndBlock cfiBlock11
//  673 
//  674 
//  675 //检测 接收FIFO 的数据  (0 没接收够 、1 为接收正确)

        SECTION `.text`:CODE:NOROOT(1)
          CFI Block cfiBlock12 Using cfiCommon0
          CFI Function nrf_rx_fifo_check
          CFI NoCalls
        THUMB
//  676 uint8  nrf_rx_fifo_check(uint32 offset,uint16 * val)
//  677 {
nrf_rx_fifo_check:
        PUSH     {R4-R6}
          CFI R6 Frame(CFA, -4)
          CFI R5 Frame(CFA, -8)
          CFI R4 Frame(CFA, -12)
          CFI CFA R13+12
        MOVS     R2,R0
//  678     uint8 rx_num = (offset + 1 + DATA_PACKET - 1 ) / DATA_PACKET;   //加1 是因为返回2个字节，最后一个自己所在的包数。
        ADDS     R0,R2,#+32
        LSRS     R4,R0,#+5
//  679                                                                     //+ DATA_PACKET - 1 是四舍五入
//  680     uint8 tmp;
//  681     if(nrf_rx_flag == QUEUE_EMPTY)
        LDR.N    R0,??DataTable8_7
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??nrf_rx_fifo_check_0
//  682     {
//  683         return 0;
        MOVS     R0,#+0
        B.N      ??nrf_rx_fifo_check_1
//  684     }
//  685 
//  686     if(rx_num > RX_FIFO_PACKET_NUM)                                 //偏移太大，超过 FIFO 限制
??nrf_rx_fifo_check_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+81
        BLT.N    ??nrf_rx_fifo_check_2
//  687     {
//  688         return 0;
        MOVS     R0,#+0
        B.N      ??nrf_rx_fifo_check_1
//  689     }
//  690 
//  691     rx_num = nrf_rx_front + rx_num - 1;                             //目标查询的 包的位置
??nrf_rx_fifo_check_2:
        LDR.N    R0,??DataTable8_9
        LDRB     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        ADDS     R4,R0,R4
//  692     tmp =  nrf_rx_rear;
        LDR.N    R0,??DataTable8_10
        LDRB     R0,[R0, #+0]
        MOVS     R3,R0
//  693     if(nrf_rx_front <  tmp)                                 //接收数据在 一圈之内
        LDR.N    R0,??DataTable8_9
        LDRB     R0,[R0, #+0]
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R0,R3
        BCS.N    ??nrf_rx_fifo_check_3
//  694     {
//  695         if(rx_num >= nrf_rx_rear )                                  //没接收足够的数据
        LDR.N    R0,??DataTable8_10
        LDRB     R0,[R0, #+0]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,R0
        BCC.N    ??nrf_rx_fifo_check_4
//  696         {
//  697             return 0;
        MOVS     R0,#+0
        B.N      ??nrf_rx_fifo_check_1
//  698         }
//  699 
//  700         //获取数据
//  701 
//  702     }
//  703     else                                                            //越过一圈
//  704     {
//  705         if(rx_num >= RX_FIFO_PACKET_NUM)                            //超过一圈
??nrf_rx_fifo_check_3:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+80
        BLT.N    ??nrf_rx_fifo_check_4
//  706         {
//  707             rx_num -= RX_FIFO_PACKET_NUM;
        SUBS     R4,R4,#+80
//  708 
//  709             if( rx_num >= nrf_rx_rear )                             //还没接收够
        LDR.N    R0,??DataTable8_10
        LDRB     R0,[R0, #+0]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,R0
        BCC.N    ??nrf_rx_fifo_check_4
//  710             {
//  711                 return 0;
        MOVS     R0,#+0
        B.N      ??nrf_rx_fifo_check_1
//  712             }
//  713         }
//  714         //获取数据
//  715     }
//  716 
//  717     //获取数据
//  718     *val = *(uint16 *)((char *)&NRF_ISR_RX_FIFO + ( rx_num*DATA_PACKET + (offset % DATA_PACKET - 2) )) ;
??nrf_rx_fifo_check_4:
        LDR.N    R0,??DataTable8_8
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R5,#+32
        UDIV     R6,R2,R5
        MLS      R6,R6,R5,R2
        ADDS     R5,R6,R4, LSL #+5
        ADDS     R0,R5,R0
        LDRH     R0,[R0, #-2]
        STRH     R0,[R1, #+0]
//  719     return 1;
        MOVS     R0,#+1
??nrf_rx_fifo_check_1:
        POP      {R4-R6}
          CFI R4 SameValue
          CFI R5 SameValue
          CFI R6 SameValue
          CFI CFA R13+0
        BX       LR               ;; return
          CFI EndBlock cfiBlock12
//  720 
//  721 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8:
        DC32     0xbebc20

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_1:
        DC32     0xa0003

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_2:
        DC32     0x43fe2070

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_3:
        DC32     RX_ADDRESS

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_4:
        DC32     TX_ADDRESS

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_5:
        DC32     ?_0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_6:
        DC32     nrf_mode

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_7:
        DC32     nrf_rx_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_8:
        DC32     NRF_ISR_RX_FIFO

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_9:
        DC32     nrf_rx_front

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_10:
        DC32     nrf_rx_rear

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_11:
        DC32     nrf_irq_tx_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_12:
        DC32     nrf_irq_tx_addr

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable8_13:
        DC32     nrf_irq_tx_pnum

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
        DC8 194, 194, 194, 194, 194, 0, 0, 0

        END
//  722 
//  723 
// 
// 2 573 bytes in section .bss
//    16 bytes in section .data
//     8 bytes in section .rodata
// 1 366 bytes in section .text
// 
// 1 366 bytes of CODE  memory
//     8 bytes of CONST memory
// 2 589 bytes of DATA  memory
//
//Errors: none
//Warnings: none
