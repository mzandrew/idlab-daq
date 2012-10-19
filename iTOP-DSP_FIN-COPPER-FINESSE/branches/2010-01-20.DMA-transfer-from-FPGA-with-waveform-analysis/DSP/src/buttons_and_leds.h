void setup_leds_and_buttons(void);
extern unsigned short int state_of_button_pf2(void);
extern unsigned short int state_of_button_pf3(void);

void pulse_led_on_pf0_indefinitely(unsigned short int frequency);

//inline void turn_off_led_pf0(void);
//inline void turn_on_led_pf0(void);
//inline void turn_off_led_pf1(void);
//inline void turn_on_led_pf1(void);
//inline void toggle_led_pf0(void);
//inline void toggle_led_pf1(void);

inline void turn_off_led_pf0(void) { *pFIO0_FLAG_C = 0x0001; }
inline void turn_on_led_pf0(void)  { *pFIO0_FLAG_S = 0x0001; }
inline void turn_off_led_pf1(void) { *pFIO0_FLAG_C = 0x0002; }
inline void turn_on_led_pf1(void)  { *pFIO0_FLAG_S = 0x0002; }

inline void toggle_led_pf0(void) {
	if ((*pFIO0_FLAG_D) & 0x0001) {
		turn_off_led_pf0();
	} else {
		turn_on_led_pf0();
	}
}

inline void toggle_led_pf1(void) {
	if ((*pFIO0_FLAG_D) & 0x0002) {
		turn_off_led_pf1();
	} else {
		turn_on_led_pf1();
	}
}
