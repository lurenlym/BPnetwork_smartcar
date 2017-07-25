#ifndef _SCAN_H
#define _SCAN_H

#define mykey_left PTC18
#define mykey_right PTD1
#define mykey_select PTC17
#define mykey_down PTC16
#define mykey_up PTC19
extern uint8 left_value;
extern uint8 right_value;
extern uint8 down_value;
extern uint8 up_value;
extern uint8 select_value;

extern uint8 long_left_value;
extern uint8 long_right_value;
extern uint8 long_down_value;
extern uint8 long_up_value;
extern uint8 long_select_value;

void mykey_init();
void mykey_clear();
void mykey_scan();
#endif