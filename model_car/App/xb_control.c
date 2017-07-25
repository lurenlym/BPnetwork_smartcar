#include "include.h"
#include "common.h"
#include "math.h"

uint32 chakan=0;
uint8 duojiinit_flag=0;

uint8 daoche_flag=0; //倒车标志位
uint32 DUO_PID_PWM=DUO_PWM_mid;//舵机PWM占空比，初始1640
uint8 DUO_flag=1;
int32 impulseL0=0; //期望值
int32 impulseR0=0;

int32 impulse_L=0;
int32 impulse_R=0;

uint32 impluse_zeros_count=0;

int32 value1L=0,value2L=0,value3L=0;
float d_temp_PID_L=0;
int32 value1R=0,value2R=0,value3R=0;
float d_temp_PID_R=0;

int32 duo_params_L = 0;
int32 duo_params_R = 0;

uint32 DIAN_PID_PWM_L1=0;
uint32 DIAN_PID_PWM_L2=0;
uint32 DIAN_PID_PWM_R1=0;
uint32 DIAN_PID_PWM_R2=0;

void PWM_control();

void D_control(uint8 motor_params)
{
  //ftm_pwm_duty(MOTOR_FTM, MOTOR1_PWM,0);
  //ftm_pwm_duty(MOTOR_FTM, MOTOR2_PWM,1300);
  //ftm_pwm_duty(MOTOR_FTM, MOTOR3_PWM,1300);
  //ftm_pwm_duty(MOTOR_FTM, MOTOR4_PWM,0);
  impulseL0 = 40;
  impulseR0 = 40;
  
  DIAN_PID(impulseL0,impulseR0);
  PWM_control();
  //DUO_PID(motor_params);
  DUO_PID_PWM = DUO_PWM_left_sz+motor_params*3.1; 
  ftm_pwm_duty(S3010_FTM, S3010_CH,DUO_PID_PWM);
 
}

void PWM_control()
{
  
  ftm_pwm_duty(MOTOR_FTM, MOTOR1_PWM,DIAN_PID_PWM_L2);
  ftm_pwm_duty(MOTOR_FTM, MOTOR2_PWM,DIAN_PID_PWM_L1);
  ftm_pwm_duty(MOTOR_FTM, MOTOR3_PWM,DIAN_PID_PWM_R2);
  ftm_pwm_duty(MOTOR_FTM, MOTOR4_PWM,DIAN_PID_PWM_R1);
}

void DIAN_PID(int32 impulseL0,int32 impulseR0)
{
  //左轮
  //impulse_L=-impulse_L;//左右脉冲方向不一致
  xb_get_impulse();
  float d_temp_P_L=0,d_temp_I_L=0,d_temp_D_L=0;
  value1L=impulseL0-impulse_L;
  d_temp_P_L=d_P_coefficient*(value1L-value2L);
  d_temp_I_L=d_I_coefficient*value1L;
  d_temp_D_L=d_D_coefficient*(value1L-2*value2L+value3L);
  d_temp_PID_L=d_temp_PID_L+d_temp_P_L+d_temp_I_L+d_temp_D_L;
  
  value2L=impulseL0-impulse_L;
  value3L=value2L;
  if(d_temp_PID_L>DIAN_PWM_max)//限幅
  {
    d_temp_PID_L=DIAN_PWM_max;
  }
  if(d_temp_PID_L<-DIAN_PWM_max)
  {
    d_temp_PID_L=-DIAN_PWM_max;
  }
  if(d_temp_PID_L>=0)
  {
    DIAN_PID_PWM_L1=(uint32)d_temp_PID_L;
    DIAN_PID_PWM_L2=0;
  }
  else
  {
    DIAN_PID_PWM_L2=(uint32)(-d_temp_PID_L);
    DIAN_PID_PWM_L1=0;
  }
 // impulse_L=-impulse_L;
  //右轮
  float d_temp_P_R=0,d_temp_I_R=0,d_temp_D_R=0;
  value1R=impulseR0-impulse_R;
  d_temp_P_R=d_P_coefficient*(value1R-value2R);
  d_temp_I_R=d_I_coefficient*value1R;
  d_temp_D_R=d_D_coefficient*(value1R-2*value2R+value3R);
  d_temp_PID_R=d_temp_PID_R+d_temp_P_R+d_temp_I_R+d_temp_D_R; 
    
  value2R=impulseR0-impulse_R;
  value3R=value2R;
   if(d_temp_PID_R>DIAN_PWM_max)
  {
    d_temp_PID_R=DIAN_PWM_max;
  }
  if(d_temp_PID_R<-DIAN_PWM_max)
  {
    d_temp_PID_R=-DIAN_PWM_max;
  }
if(d_temp_PID_R>=0)
  {
    DIAN_PID_PWM_R2=(uint32)d_temp_PID_R;
    DIAN_PID_PWM_R1=0;
  }
  else
  {
    DIAN_PID_PWM_R1=(uint32)(-d_temp_PID_R);
    DIAN_PID_PWM_R2=0;
  }  
}
//void DUO_PID(uint8 duo_params)//舵机PID计算
//{
//  float temp_P=0,temp_D=0,temp_PID=0;
//  
//  uint32 PID_date=0;
//  float deviation=0;
//  static double temp_deviation=0;
//  if(duo_params == 'N')
//  {
//  }
//  else if(duo_params == 'F')
//  {
//    duo_params_R = 0;
//    duo_params_L = 0;
//    temp_deviation = 0;
//  }
//  else  if(duo_params == 'L')
//    {
//      duo_params_L++;
//      duo_params_R = 0;
//      if(temp_deviation > -90)
//      temp_deviation = temp_deviation-duo_params_L*5; 
//    }
//    else if(duo_params == 'R')
//      {
//       duo_params_R++;
//       duo_params_L = 0;
//       if(temp_deviation < 90)
//       temp_deviation = duo_params_L+duo_params_R*5;       
//      }
//  
//  deviation=(float)temp_deviation;
//  temp_P=P_coefficient*deviation;
//  temp_I=temp_I+deviation;
//  temp_I=(temp_I*I_coefficient);
//  temp_D=(deviation-last_deviation)*D_coefficient;
//  last_deviation=deviation;
//  temp_PID=temp_P+temp_I+temp_D;
//  PID_date=(uint32)(temp_PID+DUO_PWM_mid);
//
//  if(PID_date>=DUO_PWM_right_sz)
//  {
//    DUO_PID_PWM=DUO_PWM_right_sz;
//    temp_deviation=90;
//  }
//  else
//  {    
//    if(PID_date<=DUO_PWM_left_sz)
//    {
//      DUO_PID_PWM=DUO_PWM_left_sz;
//      temp_deviation=-90;
//    }
//    else
//    {
//      DUO_PID_PWM=PID_date;    
//    }
//  }
//        
//}


void xb_get_impulse()
{ 
  
  impulse_R = ftm_quad_get(FTM1);          //获取FTM 正交解码 的脉冲数(负数表示反方向)
  impulse_L = -ftm_quad_get(FTM2);           //获取FTM 正交解码 的脉冲数(负数表示反方向)
  
  ftm_quad_clean(FTM1);
  ftm_quad_clean(FTM2);
  //DELAY_MS(30);
  PIT_Flag_Clear(PIT1);
}

void lptmr_hander()//倒车延时
{
  disable_irq(LPTMR_IRQn);
  daoche_flag=0;
  DUO_flag=1;
  impluse_zeros_count=0;
  LPTMR_Flag_Clear();
}


void control()
{
  D_control(param);
  PIT_Flag_Clear(PIT0); 
}