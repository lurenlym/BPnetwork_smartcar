#include "include.h"
#include  "common.h"

void myflash_read()
{
  DUOP=flash_read(255,0,uint16);
  DUOI=flash_read(255,8,uint16);
  DUOD=flash_read(255,16,uint16);
  DIANP=flash_read(255,24,uint16);
  DIANI=flash_read(255,32,uint16);
  DIAND=flash_read(255,40,uint16);
  Q_H=flash_read(255,48,uint16);
  Q_B=flash_read(255,56,uint16);
  
}

void myflash_write()
{
  flash_erase_sector(255);
  
  flash_write(255,0,DUOP);
  flash_write(255,8,DUOI);
  flash_write(255,16,DUOD);
  flash_write(255,24,DIANP);
  flash_write(255,32,DIANI);
  flash_write(255,40,DIAND);
  flash_write(255,48,Q_H);
  flash_write(255,56,Q_B);
  
}