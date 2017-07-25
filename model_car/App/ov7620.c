#include "include.h"
#include "common.h"
#include "ov7620.h"
#include "math.h"

int H_flag=0;
int16 L_average=0;
int16 H_average=0;

long int H_flag_count=0;//long int H_flag_count=0;
uint8 effective_flag=0;
uint32 no_effective_count=0;//无有效图像标志
uint8 VH_flag=0;
uint8 HL_er[H][L]={0};

void ov7620_init()
{
    gpio_init(PTB8,GPI,0);
    port_init (PTB8, IRQ_RISING | PF | ALT1 | PULLDOWN  ); //hang
    
    disable_irq(PORTB_IRQn);
    gpio_init(PTA27,GPI,0);
    port_init (PTA27, DMA_RISING| PF | ALT1 | PULLDOWN  );    
    gpio_init(PTA29,GPI,0);
    port_init (PTA29, IRQ_FALLING | ALT1 | PULLDOWN  );//chang   
    enable_irq(PORTA_IRQn);
    uart_init(UART4,115200);
}

void PORTA_IRQHandler()
{
    if(PORTA_ISFR & (1<<29))
    {
      PORTA_ISFR |= (1<<29);                                
      image_send= 0; 
      dma_portx2buff_init(DMA_CH0, (void *)&PTB_B0_IN, image_date, PTA27, DMA_BYTE1,L,DADDR_KEEPON); 
      enable_irq(PORTB_IRQn);
      disable_irq(PORTA_IRQn);
      image_send= 0; 
    }
}


void PORTB_IRQHandler()
{
    if(PORTB_ISFR & (1<<8))                               
    {
      PORTB_ISFR |= (1<<8);                                
      if(++H_count)
      {
      DMA_EN(DMA_CH0);
      }
    }
}
void DMA0_IRQHandler()
{
    DMA_DIS(DMA_CH0);
    DMA_IRQ_CLEAN(DMA_CH0);                                   
    if(H_count>=H) 
    { 
      disable_irq(PORTB_IRQn);
      disable_irq(PORTA_IRQn);//关闭图像
      /*
      PIT_Flag_Clear(PIT1);
      PIT_Flag_Clear(PIT2); 
      enable_irq(PIT1_IRQn);
      enable_irq(PIT2_IRQn);
      ftm_quad_clean(FTM1);
      ftm_quad_clean(FTM2);
      */
      image_send=1;
      H_count=0;            
    }
}

void sccb()
{
  SCCB_GPIO_init();
  SCCB_WriteByte(0x12,0x80);
}

void ov7620_LCD(Site_t site, Size_t size, uint8 *img)
{  

    int i,j=0;
    LCD_PTLON(site, size);                      //开窗
    LCD_RAMWR();
    
    for(i=H-H_eff;i<H;i++)
       {
         for(j=100;j<220;j++)         
          {
          if(image_date[i][j]==0)            
            LCD_WR_DATA( BINARY_COLOR ); 
          else
            LCD_WR_DATA( BINARY_BGCOLOR);
            //imgtemp = GRAY_2_RGB565(image_date[i][j]);
            //LCD_WR_DATA( imgtemp ); 
           }

       }
}
void ov7620_deal()
{
  int i=0,j=0;
  
  uint32 i_temp=0;
  uint32 j_temp=0;
  uint32 i_count=0;
  uint32 j_count=0;
  uint32 ij_temp=0;
  uint8 first_flag=0;
  
  H_flag=0;//计数初值
  H_flag_count=0;
  H_average=1;
  L_average=0; 
  if(!dealsize_all_flag)
  {
    for(i=H-H_eff;i<H;i++)
    {
      for(j=(160-(L_eff/2));j<(160+(L_eff/2));j++)
      {
       if(HL_er[i][j]==1)
       {
        if(image_date[i][j]>0xe6)//0xe6
        {
          image_date[i][j]=255;
          if(first_flag==0)
          {
            H_flag=H_flag+i;
            H_flag_count++;
            first_flag=1;          
          }
          j_temp=j_temp+j;
          j_count++;
        }
        else
        {
          image_date[i][j]=0;
        }
      }
       else
       {
        image_date[i][j]=0;
       }
      }
      if(j_count)
      {
        ij_temp=j_temp/j_count;//每一有效行的列平均
        i_temp=i_temp+ij_temp;//当前所有有效行的列平均
        i_count++;//有效行数
        j_temp=0;
        j_count=0;
      }   
   }
  }
  else
  {
    for(i=H-H_eff;i<H;i++)
    {
      for(j=(160-(L_eff/2));j<(160+(L_eff/2));j++)
      {
        if(image_date[i][j]>0xe6)//0xe6
        {
          image_date[i][j]=255;
          if(first_flag==0)
          {
            H_flag=H_flag+i;
            H_flag_count++;
            first_flag=1;          
          }
          j_temp=j_temp+j;
          j_count++;
        }
        else
        {
          image_date[i][j]=0;
        }
      }
      if(j_count)
      {
        ij_temp=j_temp/j_count;//每一有效行的列平均
        i_temp=i_temp+ij_temp;//当前所有有效行的列平均
        i_count++;//有效行数
        j_temp=0;
        j_count=0;
      }   
   }
  }
  if(i_count)
  {
    L_average=i_temp/i_count-MID; 
    H_average=H-(H_flag/H_flag_count);//行均值
    effective_flag=1;
    no_effective_count=0;
  } 
  else
  {
    no_effective_count++;
  }
  
}

void date_LCD()
{
  
  
  //显示行列
  LCD_rectangle(site,size,RED);
  Site_t date_site={10,5};
  LCD_str(date_site,"L", BLUE,RED);
  if(L_average<=0)
    { 
      date_site.x=10;
      date_site.y=20;
      LCD_char(date_site,'-',BLUE,RED);
      date_site.x=13;
      LCD_num(date_site,-L_average,BLUE,RED);
    }
  else
    {
      date_site.x=13;
      date_site.y=20;
      LCD_num(date_site,L_average,BLUE,RED);
    }
  date_site.x=10;
  date_site.y=35;
  LCD_str(date_site,"H", BLUE,RED);
  date_site.x=13;
  date_site.y=50;
  LCD_num(date_site,H_average, BLUE, RED);
  //显示距离
  date_site.x=10;
  date_site.y=65;
   LCD_num(date_site,timevarL, BLUE, RED);
  date_site.x=13;
  date_site.y=80;
  LCD_num(date_site,timevarR, BLUE, RED);
  
  date_site.x=10;
  date_site.y=95;
  LCD_str(date_site,"DUO", BLUE,RED);
  date_site.x=13;
  date_site.y=110;
  LCD_num(date_site,DUO_PID_PWM, BLUE, RED);
 //显示编码器脉冲 
  date_site.x=50;
  date_site.y=5;
  LCD_str(date_site,"i_L", BLUE,RED);
  if(impulse_L<0)
    { 
      date_site.x=80;
      date_site.y=5;
      LCD_char(date_site,'-',BLUE,RED);
      date_site.x=85;
      LCD_num(date_site,-impulse_L,BLUE,RED);
    }
  else
    {
      date_site.x=80;
      date_site.y=5;
      LCD_num(date_site,impulse_L,BLUE,RED);
    }
  
  date_site.x=50;
  date_site.y=20;
  LCD_str(date_site,"i_R", BLUE,RED);
  if(impulse_R<0)
    { 
      date_site.x=80;
      date_site.y=20;
      LCD_char(date_site,'-',BLUE,RED);
      date_site.x=85;
      LCD_num(date_site,-impulse_R,BLUE,RED);
    }
  else
    {
      date_site.x=80;
      date_site.y=20;
      LCD_num(date_site,impulse_R,BLUE,RED);
    }
  //显示电机PID
  date_site.x=50;
  date_site.y=65;
  LCD_str(date_site,"dian_pid",BLUE,RED);
  
  date_site.x=50;
  date_site.y=80;
  LCD_num(date_site,DIAN_PID_PWM_L1,BLUE,RED);
  date_site.x=90;
  date_site.y=80;
  LCD_num(date_site,DIAN_PID_PWM_R2,BLUE,RED);
  //显示期望值
  date_site.x=50;
  date_site.y=95;
  LCD_str(date_site,"dian0",BLUE,RED);
  date_site.x=55;
  date_site.y=110;
  LCD_num(date_site,impulseL0,BLUE,RED);
  date_site.x=90;
  date_site.y=110;
  LCD_num(date_site,impulseR0,BLUE,RED);
 
  
}

void HL_init()//广角镜头滤去边缘部分
{
  int i=0,j=0;
  for(i=H-H_eff;i<H;i++)
    for(j=(160-(50/2+(i-(H-H_eff))));j<(160+(50/2+(i-(H-H_eff))));j++)
      HL_er[i][j]=1;
}