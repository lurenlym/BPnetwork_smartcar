#ifndef _ov7620_H
#define _ov7620_H

#include "include.h"
#include "common.h"

#define H 130   
#define L 320
#define MID L/2 
#define H_eff 70
#define L_eff 280
//中心为L/2，取偏移点为L/4;
#define SIZE H*L

extern uint8 image_date[H][L];
extern uint32 H_count;
extern uint8 image_send;
extern uint8 buff_to_date;
extern uint8 effective_flag;
extern uint32 no_effective_count;
extern int H_flag;
extern int16 L_average;
extern int16 H_average;

extern Site_t site;
extern Size_t size;
extern uint32 TIME_chakan;

void PORTB_IRQHandler();
void DMA0_IRQHandler();
void PORTA_IRQHandler();
void sccb();
void ov7620_LCD(Site_t site, Size_t size, uint8 *img);
void ov7620_init();
void ov7620_deal();
void date_LCD();
void HL_init();
#endif