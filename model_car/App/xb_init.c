#include "include.h"
#include "common.h"
uint32 timevarR=0;
uint32 timevarL=0;


void xb_ftm_init()
{
  ftm_pwm_init(S3010_FTM, S3010_CH,S3010_HZ,DUO_PWM_mid);      //初始化 舵机 PWM
  ftm_pwm_init(MOTOR_FTM, MOTOR1_PWM,MOTOR_HZ,0);
  ftm_pwm_init(MOTOR_FTM, MOTOR2_PWM,MOTOR_HZ,DIAN_PWM_INIT);
  ftm_pwm_init(MOTOR_FTM, MOTOR3_PWM,MOTOR_HZ,DIAN_PWM_INIT);
  ftm_pwm_init(MOTOR_FTM, MOTOR4_PWM,MOTOR_HZ,0);
  
  ftm_quad_init(FTM1);
  ftm_quad_init(FTM2);
}


void interrupt_init()
{
      pit_init_ms(PIT0,20);
      set_vector_handler(PIT0_VECTORn , control);
//    NVIC_SetPriority(PIT1_IRQn,9);
    enable_irq(PIT0_IRQn);
    uart_init(UART4,115200);
    set_vector_handler(UART4_RX_TX_VECTORn ,recevie); //前方避障
    uart_rx_irq_en (UART4); 
    
}

//*******各模块及管脚初始化***********//
void INIT()
{
    xb_ftm_init();
    interrupt_init();
}

void recevie()
{
  if(uart_query(UART4) == 1)
  {
   uart_getchar(UART4, &recevie_date);
  }
}