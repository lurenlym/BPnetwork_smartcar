#ifndef _XB_CONTROL_H
#define _XB_CONTROL_H
  
#define DUO_PWM_right 1585
#define DUO_PWM_right_sz 1580
#define DUO_PWM_mid 1415
#define DUO_PWM_left 1250
#define DUO_PWM_left_sz 1250
#define DIAN_PWM_INIT 0
#define DIAN_PWM_max 2000 
#define DIAN_PWM_min 0

#define P_coefficient 1.5
#define I_coefficient 0
#define D_coefficient 0
  
#define d_P_coefficient 0
#define d_I_coefficient 0.5
#define d_D_coefficient 0


extern uint32 DIAN_PID_PWM_L1;
extern uint32 DIAN_PID_PWM_L2;
extern uint32 DIAN_PID_PWM_R1;
extern uint32 DIAN_PID_PWM_R2;

static float temp_I;
static float last_deviation;

extern uint32 DUO_PID_PWM;
extern int32 impulseL0;
extern int32 impulseR0;
extern int32 impulse_L;
extern int32 impulse_R;

extern uint32 impluse_zeros_count;

extern float d_temp_PID_L;
extern float d_temp_PID_R;

extern uint8 param;
void lptmr_hander();
void control();
void D_control(uint8 motor_params);
void DIAN_PID(int32 impulseL0,int32 impulseR0);
void DUO_PID(uint8 duo_params);
void xb_get_impulse();

#endif
