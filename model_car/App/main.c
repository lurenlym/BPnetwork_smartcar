#include "common.h"
#include "include.h"
#include "ov7620.h"


//º¯ÊıÉùÃ÷

uint8 receive_change(uint8 recevie_temp);


uint8 recevie_date = 50;
uint8 temp = 0;
uint8 param = 0;


void  main()
{
    DisableInterrupts;
    INIT();
    EnableInterrupts;   
    
    while(1)
    {
      param = receive_change(recevie_date);
    }
      
}



uint8 receive_change(uint8 recevie_temp)
{
  
      temp = recevie_temp;
      return temp;
    
}
