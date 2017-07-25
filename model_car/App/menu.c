#include "include.h"
#include "menu.h"

uint8 ov7620_display_flag=0;
uint8 date_display_flag=0;
uint8 dealsize_all_flag=1;

uint8 display_flag=1;
uint8 duopiddisplay_flag=1;
uint8 dianpiddisplay_flag=1;
uint8 expectdisplay_flag=1;
uint8 dealsizedisplay_flag=1;

uint8 imagedisplay_first_flag=1;
uint8 duopiddisplay_first_flag=1;
uint8 dianpiddisplay_first_flag=1;
uint8 expectdisplay_first_flag=1;
uint8 dealsizedisplay_first_flag=1;

uint8 duo_p_flag=1;
uint8 duo_i_flag=1;
uint8 duo_d_flag=1;
uint8 dian_p_flag=1;
uint8 dian_i_flag=1;
uint8 dian_d_flag=1;
uint8 qi_h_flag=1;
uint8 qi_b_flag=1;

uint16 DUOP=0;
uint16 DUOI=0;
uint16 DUOD=0;
uint16 DIANP=0;
uint16 DIANI=0;
uint16 DIAND=0;
uint16 Q_H=0;
uint16 Q_B=0;


Site_t menu1_site={10,5};

void duopiddisplay_menu();
void dianpiddisplay_menu();
void expectdisplay_menu();
void dealsizedisplay_menu();

void imagedisplay_menu()//图像选择开启菜单
{
   
  mykey_scan();
  
  if(imagedisplay_first_flag)
  {
    menu1_site.y=5;
    LCD_str(menu1_site,"OV7620", BLUE,RED);
    menu1_site.y=20;
    LCD_str(menu1_site,"date", BLUE,RED);
    menu1_site.y=35;
    LCD_str(menu1_site,"nodisplay", BLUE,RED);
    imagedisplay_first_flag=0;
  }
  if(left_value)
  {
    ov7620_display_flag=1;
    date_display_flag=0;
    LCD_clear(RED);
    menu1_site.y=5;
    LCD_str(menu1_site,"OV7620", WHITE,RED);
    menu1_site.y=20;
    LCD_str(menu1_site,"date", BLUE,RED);
    menu1_site.y=35;
    LCD_str(menu1_site,"nodisplay", BLUE,RED);
  }
  if(right_value)
  {
    date_display_flag=1;
    ov7620_display_flag=0;
    LCD_clear(RED);
    menu1_site.y=5;
    LCD_str(menu1_site,"OV7620", BLUE,RED);
    menu1_site.y=20;
    LCD_str(menu1_site,"date", WHITE,RED);
    menu1_site.y=35;
    LCD_str(menu1_site,"nodisplay", BLUE,RED);
  }
  if(long_left_value)
  {
    ov7620_display_flag=0;
    date_display_flag=0;
    LCD_clear(RED);
    menu1_site.y=5;
    LCD_str(menu1_site,"OV7620", BLUE,RED);
    menu1_site.y=20;
    LCD_str(menu1_site,"date", BLUE,RED);
    menu1_site.y=35;
    LCD_str(menu1_site,"nodisplay", WHITE,RED);
  }
  if(down_value)
  {
    display_flag=0;
    LCD_clear(RED);
    while(duopiddisplay_flag)
    {
      duopiddisplay_menu();
    }
  }  
}

void duopiddisplay_menu()  //舵机PID选择调整
{
  mykey_scan();
  if(duopiddisplay_first_flag)
  {
    menu1_site.x=10;
    menu1_site.y=5;
    LCD_str(menu1_site,"duo_p", BLUE,RED);
    menu1_site.x=65;
    menu1_site.y=5;
    LCD_num(menu1_site,DUOP, BLUE,RED);
    menu1_site.x=10;
    menu1_site.y=20;
    LCD_str(menu1_site,"duo_i", BLUE,RED);
    menu1_site.x=65;
    menu1_site.y=20;
    LCD_num(menu1_site,DUOI, BLUE,RED);
    menu1_site.x=10;
    menu1_site.y=35;
    LCD_str(menu1_site,"duo_d", BLUE,RED);
    menu1_site.x=65;
    menu1_site.y=35;
    LCD_num(menu1_site,DUOD, BLUE,RED);
    
    duopiddisplay_first_flag=0;
    duo_p_flag=1;
    duo_i_flag=1;
    duo_d_flag=1;
  }
  if(left_value)
  {
    while(duo_p_flag)
    {
      mykey_scan();
      menu1_site.x=10;
      menu1_site.y=5;
      LCD_str(menu1_site,"duo_p", WHITE,RED);
      menu1_site.x=65;
      menu1_site.y=5;
      LCD_num(menu1_site,DUOP, WHITE,RED);
      menu1_site.x=10;
      menu1_site.y=20;
      LCD_str(menu1_site,"duo_i", BLUE,RED);
      menu1_site.x=65;
      menu1_site.y=20;
      LCD_num(menu1_site,DUOI, BLUE,RED);
      menu1_site.x=10;
      menu1_site.y=35;
      LCD_str(menu1_site,"duo_d", BLUE,RED);
      menu1_site.x=65;
      menu1_site.y=35;
      LCD_num(menu1_site,DUOD, BLUE,RED);
      if(left_value)
      {
        DUOP=DUOP-1;
        LCD_clear(RED);
      }
      if(right_value)
      {
        DUOP=DUOP+1;
        LCD_clear(RED);
      }
      if(long_left_value)
      {
        DUOP=DUOP-10;
        LCD_clear(RED);
      }
      if(long_right_value)
      {
        DUOP=DUOP+10;
        LCD_clear(RED);
      }
      if(down_value)
      {
        duopiddisplay_first_flag=1;
        duo_p_flag=0;
        mykey_clear();
      }
    }
   
  }
  if(right_value)
  {
    while(duo_i_flag)
    {
      mykey_scan();
      menu1_site.x=10;
      menu1_site.y=5;
      LCD_str(menu1_site,"duo_p", BLUE,RED);
      menu1_site.x=65;
      menu1_site.y=5;
      LCD_num(menu1_site,DUOP, BLUE,RED);
      menu1_site.x=10;
      menu1_site.y=20;
      LCD_str(menu1_site,"duo_i", WHITE,RED);
      menu1_site.x=65;
      menu1_site.y=20;
      LCD_num(menu1_site,DUOI, WHITE,RED);
      menu1_site.x=10;
      menu1_site.y=35;
      LCD_str(menu1_site,"duo_d", BLUE,RED);
      menu1_site.x=65;
      menu1_site.y=35;
      LCD_num(menu1_site,DUOD, BLUE,RED);
      if(left_value)
      {
        DUOI=DUOI-1;
        LCD_clear(RED);
      }
      if(right_value)
      {
        DUOI=DUOI+1;
        LCD_clear(RED);
      }
      if(long_left_value)
      {
        DUOI=DUOI-10;
        LCD_clear(RED);
      }
      if(long_right_value)
      {
        DUOI=DUOI+10;
        LCD_clear(RED);
      }
      if(down_value)
      {
        duopiddisplay_first_flag=1;
        duo_i_flag=0;
        mykey_clear();
      }
    }
   
    
  }
  if(long_left_value)
  {
    while(duo_d_flag)
    {
      mykey_scan();
      menu1_site.x=10;
      menu1_site.y=5;
      LCD_str(menu1_site,"duo_p", BLUE,RED);
      menu1_site.x=65;
      menu1_site.y=5;
      LCD_num(menu1_site,DUOP, BLUE,RED);
      menu1_site.x=10;
      menu1_site.y=20;
      LCD_str(menu1_site,"duo_i", BLUE,RED);
      menu1_site.x=65;
      menu1_site.y=20;
      LCD_num(menu1_site,DUOI, BLUE,RED);
      menu1_site.x=10;
      menu1_site.y=35;
      LCD_str(menu1_site,"duo_d", WHITE,RED);
      menu1_site.x=65;
      menu1_site.y=35;
      LCD_num(menu1_site,DUOD, WHITE,RED);
      if(left_value)
      {
        DUOD=DUOD-1;
        LCD_clear(RED);
      }
      if(right_value)
      {
        DUOD=DUOD+1;
        LCD_clear(RED);
      }
      if(long_left_value)
      {
        DUOD=DUOD-10;
        LCD_clear(RED);
      }
      if(long_right_value)
      {
        DUOD=DUOD+10;
        LCD_clear(RED);
      }
      if(down_value)
      {
        duopiddisplay_first_flag=1;
        duo_d_flag=0;
        mykey_clear();
      }
    }   
  }
  if(down_value)
  {
    duopiddisplay_flag=0;
    LCD_clear(RED);
    while(dianpiddisplay_flag)
    {
      dianpiddisplay_menu();
    }
    
  }  
  
}

void dianpiddisplay_menu()  //电机PID选择调整
{
  mykey_scan();
  if(dianpiddisplay_first_flag)
  {
    menu1_site.x=10;
    menu1_site.y=5;
    LCD_str(menu1_site,"dian_p", BLUE,RED);
    menu1_site.x=65;
    menu1_site.y=5;
    LCD_num(menu1_site,DIANP, BLUE,RED);
    menu1_site.x=10;
    menu1_site.y=20;
    LCD_str(menu1_site,"dian_i", BLUE,RED);
    menu1_site.x=65;
    menu1_site.y=20;
    LCD_num(menu1_site,DIANI, BLUE,RED);
    menu1_site.x=10;
    menu1_site.y=35;
    LCD_str(menu1_site,"dian_d", BLUE,RED);
    menu1_site.x=65;
    menu1_site.y=35;
    LCD_num(menu1_site,DIAND, BLUE,RED);
    
    dian_p_flag=1;
    dian_i_flag=1;
    dian_d_flag=1;
    dianpiddisplay_first_flag=0;

  }
  if(left_value)
  {
    while(dian_p_flag)
    {
     
      mykey_scan();
      menu1_site.x=10;
      menu1_site.y=5;
      LCD_str(menu1_site,"dian_p", WHITE,RED);
      menu1_site.x=65;
      menu1_site.y=5;
      LCD_num(menu1_site,DIANP, WHITE,RED);
      menu1_site.x=10;
      menu1_site.y=20;
      LCD_str(menu1_site,"dian_i", BLUE,RED);
      menu1_site.x=65;
      menu1_site.y=20;
      LCD_num(menu1_site,DIANI, BLUE,RED);
      menu1_site.x=10;
      menu1_site.y=35;
      LCD_str(menu1_site,"dian_d", BLUE,RED);
      menu1_site.x=65;
      menu1_site.y=35;
      LCD_num(menu1_site,DIAND, BLUE,RED);
      if(left_value)
      {
        DIANP=DIANP-1;
         LCD_clear(RED);
      }
      if(right_value)
      {
        DIANP=DIANP+1;
         LCD_clear(RED);
      }
      if(long_left_value)
      {
        DIANP=DIANP-10;
         LCD_clear(RED);
      }
      if(long_right_value)
      {
        DIANP=DIANP+10;
         LCD_clear(RED);
      }
      if(down_value)
      {
        dianpiddisplay_first_flag=1;
        dian_p_flag=0;
        mykey_clear();
      }
    }
   
  }
  if(right_value)
  {
    while(dian_i_flag)
    {
      mykey_scan();
      menu1_site.x=10;
      menu1_site.y=5;
      LCD_str(menu1_site,"dian_p", BLUE,RED);
      menu1_site.x=65;
      menu1_site.y=5;
      LCD_num(menu1_site,DIANP, BLUE,RED);
      menu1_site.x=10;
      menu1_site.y=20;
      LCD_str(menu1_site,"dian_i", WHITE,RED);
      menu1_site.x=65;
      menu1_site.y=20;
      LCD_num(menu1_site,DIANI, WHITE,RED);
      menu1_site.x=10;
      menu1_site.y=35;
      LCD_str(menu1_site,"dian_d", BLUE,RED);
      menu1_site.x=65;
      menu1_site.y=35;
      LCD_num(menu1_site,DIAND, BLUE,RED);
      if(left_value)
      {
        DIANI=DIANI-1;
      LCD_clear(RED);
      }
      if(right_value)
      {
        DIANI=DIANI+1;
        LCD_clear(RED);
      }
      if(long_left_value)
      {
        DIANI=DIANI-10;
        LCD_clear(RED);
      }
      if(long_right_value)
      {
        DIANI=DIANI+10;
        LCD_clear(RED);
      }
      if(down_value)
      {
        dianpiddisplay_first_flag=1;
        dian_i_flag=0;
        mykey_clear();
      }
    }
  }
  if(long_left_value)
  {
    while(dian_d_flag)
    {
      mykey_scan();
      menu1_site.x=10;
      menu1_site.y=5;
      LCD_str(menu1_site,"dian_p", BLUE,RED);
      menu1_site.x=65;
      menu1_site.y=5;
      LCD_num(menu1_site,DIANP, BLUE,RED);
      menu1_site.x=10;
      menu1_site.y=20;
      LCD_str(menu1_site,"dian_i", BLUE,RED);
      menu1_site.x=65;
      menu1_site.y=20;
      LCD_num(menu1_site,DIANI, BLUE,RED);
      menu1_site.x=10;
      menu1_site.y=35;
      LCD_str(menu1_site,"dian_d", WHITE,RED);
      menu1_site.x=65;
      menu1_site.y=35;
      LCD_num(menu1_site,DIAND, WHITE,RED);
      if(left_value)
      {
        DIAND=DIAND-1;
      LCD_clear(RED);
      }
      if(right_value)
      {
        DIAND=DIAND+1;
      LCD_clear(RED);
      }
      if(long_left_value)
      {
        DIAND=DIAND-10;
      LCD_clear(RED);
      }
      if(long_right_value)
      {
        DIAND=DIAND+10;
      LCD_clear(RED);
      }
      if(down_value)
      {
        dianpiddisplay_first_flag=1;
        dian_d_flag=0;
        mykey_clear();
      }
    }   
  }
  if(down_value)
  {
    dianpiddisplay_flag=0;
    LCD_clear(RED);
    while(expectdisplay_flag)
    {
      expectdisplay_menu();
    }
  }  
  
}

void expectdisplay_menu()  //期望值设定
{
  mykey_scan();
  if(expectdisplay_first_flag)
  {
    menu1_site.x=10;
    menu1_site.y=5;
    LCD_str(menu1_site,"h_value", BLUE,RED);
    menu1_site.x=80;
    menu1_site.y=5;
    LCD_num(menu1_site,Q_H, BLUE,RED);
    menu1_site.x=10;
    menu1_site.y=20;
    LCD_str(menu1_site,"b_value", BLUE,RED);
    menu1_site.x=80;
    menu1_site.y=20;
    LCD_num(menu1_site,Q_B, BLUE,RED);
    
    qi_h_flag=1;
    qi_b_flag=1;
    expectdisplay_first_flag=0;
  }
  if(left_value)
  {
    while(qi_h_flag)
    {
      mykey_scan();
      menu1_site.x=10;
      menu1_site.y=5;
      LCD_str(menu1_site,"h_value", WHITE,RED);
      menu1_site.x=80;
      menu1_site.y=5;
      LCD_num(menu1_site,Q_H, WHITE,RED);
      menu1_site.x=10;
      menu1_site.y=20;
      LCD_str(menu1_site,"b_value", BLUE,RED);
      menu1_site.x=80;
      menu1_site.y=20;
      LCD_num(menu1_site,Q_B, BLUE,RED);
      if(left_value)
      {
        Q_H=Q_H-10;
         LCD_clear(RED);
      }
      if(right_value)
      {
        Q_H=Q_H+10;
         LCD_clear(RED);
      }
      if(long_left_value)
      {
        Q_H=Q_H-100;
         LCD_clear(RED);
      }
      if(long_right_value)
      {
        Q_H=Q_H+100;
        LCD_clear(RED);
      }
      if(down_value)
      {
        expectdisplay_first_flag=1;
        qi_h_flag=0;
        mykey_clear();
      }
    }
  }
  if(right_value)
  {
    while(qi_b_flag)
    {
      mykey_scan();
      menu1_site.x=10;
      menu1_site.y=5;
      LCD_str(menu1_site,"h_value",BLUE,RED);
      menu1_site.x=80;
      menu1_site.y=5;
      LCD_num(menu1_site,Q_H, BLUE,RED);
      menu1_site.x=10;
      menu1_site.y=20;
      LCD_str(menu1_site,"b_value", WHITE,RED);
      menu1_site.x=80;
      menu1_site.y=20;
      LCD_num(menu1_site,Q_B, WHITE,RED);
      if(left_value)
      {
        Q_B=Q_B-10;
         LCD_clear(RED);
      }
      if(right_value)
      {
        Q_B=Q_B+10;
         LCD_clear(RED);
      }
      if(long_left_value)
      {
        Q_B=Q_B-100;
         LCD_clear(RED);
      }
      if(long_right_value)
      {
        Q_B=Q_B+100;
        LCD_clear(RED);
      }
      if(down_value)
      {
        expectdisplay_first_flag=1;
        qi_b_flag=0;
        mykey_clear();
      }
   
    }
  }
  if(up_value)
  {  
  }
  if(down_value)
  {
    expectdisplay_flag=0;
    LCD_clear(RED);
    while(dealsizedisplay_flag)
    {
      dealsizedisplay_menu();
    }
  }   
}

void dealsizedisplay_menu()  //期望值设定
{
  mykey_scan();
  if(dealsizedisplay_first_flag)
  {
    menu1_site.x=10;
    menu1_site.y=5;
    LCD_str(menu1_site,"imgdealsize", BLUE,RED);
    menu1_site.x=10;
    menu1_site.y=20;
    LCD_str(menu1_site,"all", BLUE,RED);
    
    menu1_site.x=10;
    menu1_site.y=35;
    LCD_str(menu1_site,"part", BLUE,RED);
    
    dealsizedisplay_first_flag=0;
  }
  if(left_value)
  {
    menu1_site.x=10;
    menu1_site.y=5;
    LCD_str(menu1_site,"imgdealsize", BLUE,RED);
    menu1_site.x=10;
    menu1_site.y=20;
    LCD_str(menu1_site,"all", WHITE,RED);
    
    menu1_site.x=10;
    menu1_site.y=35;
    LCD_str(menu1_site,"part", BLUE,RED);
    dealsize_all_flag=1;
  }
  if(right_value)
  {
    menu1_site.x=10;
    menu1_site.y=5;
    LCD_str(menu1_site,"imgdealsize", BLUE,RED);
    menu1_site.x=10;
    menu1_site.y=20;
    LCD_str(menu1_site,"all", BLUE,RED);
    
    menu1_site.x=10;
    menu1_site.y=35;
    LCD_str(menu1_site,"part", WHITE,RED);
    dealsize_all_flag=0;
  }
  if(down_value)
  {
    dealsizedisplay_flag=0;
    LCD_clear(RED);
    menu1_site.x=10;
    menu1_site.y=10;
    LCD_str(menu1_site,"go go go", WHITE,RED);
  }
  
}