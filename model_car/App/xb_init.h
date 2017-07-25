#ifndef _XB_INIT_H
#define _XB_INIT_H

#define S3010_FTM   FTM0
#define S3010_CH    FTM_CH7
#define S3010_HZ    (100)



#define MOTOR_HZ    10*1000

#define MOTOR1_IO   PTE5
#define MOTOR2_IO   PTE6
#define MOTOR3_IO   PTE7
#define MOTOR4_IO   PTE8

#define MOTOR_FTM   FTM3
#define MOTOR1_PWM  FTM_CH0
#define MOTOR2_PWM  FTM_CH1
#define MOTOR3_PWM  FTM_CH2
#define MOTOR4_PWM  FTM_CH3

#define MOTOR1_PWM_IO  FTM3_CH0
#define MOTOR2_PWM_IO  FTM3_CH1
#define MOTOR3_PWM_IO  FTM3_CH2
#define MOTOR4_PWM_IO  FTM3_CH3


extern uint32 timevarR;
extern uint32 timevarL;
extern uint8 recevie_date;


void paremeter_set();
void INIT();

void interrupt_init();
void xb_ftm_init();
void PORTC_IRQHandler();
void recevie();
void csb_get();
#endif