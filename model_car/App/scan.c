#include "include.h"
#include "common.h"

uint8 left_value=0;
uint8 right_value=0;
uint8 down_value=0;
uint8 up_value=0;
uint8 select_value=0;

uint8 long_left_value=0;
uint8 long_right_value=0;
uint8 long_down_value=0;
uint8 long_up_value=0;
uint8 long_select_value=0;

uint8 break_flag=0;



void mykey_init()//按键初始化
{
  gpio_init(mykey_left,GPI,0);
  port_init_NoALT(mykey_left, PULLUP);
  gpio_init(mykey_right,GPI,0);
  port_init_NoALT(mykey_right, PULLUP);
  gpio_init(mykey_select,GPI,0);
  port_init_NoALT(mykey_select, PULLUP);
  gpio_init(mykey_down,GPI,0);
  port_init_NoALT(mykey_down, PULLUP); 
  gpio_init(mykey_up,GPI,0);
  port_init_NoALT(mykey_up, PULLUP); 
   
}

void mykey_scan()//按键扫描初始化
{
  mykey_clear();
  break_flag=0;
  if(!break_flag&&gpio_get(mykey_left)==0)
  {
    DELAY_MS(100);
    if(!break_flag&&gpio_get(mykey_left)==0)
    {
       DELAY_MS(500);
       if(!break_flag&&gpio_get(mykey_left)==0)
       {
         long_left_value=1;
         break_flag=1;
       }
       else
       {
         left_value=1;
         break_flag=1;
       }
    }
  }
  if(!break_flag&&gpio_get(mykey_right)==0)
  {
    DELAY_MS(100);
    if(!break_flag&&gpio_get(mykey_right)==0)
    { 
      DELAY_MS(500);
       if(!break_flag&&gpio_get(mykey_right)==0)
       {
         long_right_value=1;
         break_flag=1;
       }
       else
       {
         right_value=1;
         break_flag=1;
       }
    }
  }
  if(!break_flag&&gpio_get(mykey_select)==0)
  {
    DELAY_MS(100);
    if(!break_flag&&gpio_get(mykey_select)==0)
    { 
       DELAY_MS(500);
       if(!break_flag&&gpio_get(mykey_select)==0)
       {
         long_select_value=1;
         break_flag=1;
       }
       else
       {
         select_value=1;
         break_flag=1;
       }
    }
  }
  if(!break_flag&&gpio_get(mykey_down)==0)
  {
    DELAY_MS(100);
    if(!break_flag&&gpio_get(mykey_down)==0)
    {  
       DELAY_MS(500);
       if(!break_flag&&gpio_get(mykey_down)==0)
       {
         long_down_value=1;
         break_flag=1;
       }
       else
       {
         down_value=1;
         break_flag=1;
       }
    }
  }
  if(!break_flag&&gpio_get(mykey_up)==0)
  {
    DELAY_MS(100);
    if(!break_flag&&gpio_get(mykey_up)==0)
    { 
      DELAY_MS(500);
       if(!break_flag&&gpio_get(mykey_up)==0)
       {
         long_up_value=1;
         break_flag=1;
       }
       else
       {
         up_value=1;
         break_flag=1;
       }
    }
  }
  
    
}
void mykey_clear()
{
  left_value=0;
  right_value=0;
  down_value=0;
  up_value=0;
  select_value=0;
  long_left_value=0;
  long_right_value=0;
  long_down_value=0;
  long_up_value=0;
  long_select_value=0;

}