	.file "..\..\src\buttons_and_leds.c";
//  Compilation time: Wed Jan 20 22:50:31 2010

//  Compiler options: -c -file-attr ProjectName=CoreA -O -Ov100 -g -save-temps -path-output ..\Debug -structs-do-not-overlap -no-multiline -double-size-32 -decls-strong -warn-protos -proc ADSP-BF561 -o ..\Debug\buttons_and_leds.doj -MM
//  Architecture: ADSP-BF561
//  Silicon revision: 0.5
//  Anomalies summary:
//   Disabled: w05_00_0046,w05_00_0048,w05_00_0054,w05_00_0071,w05_00_0103,w05_00_0104,w05_00_0157,w05_00_0164,w05_00_0165,w05_00_0195,w05_00_0198,w05_00_0202,w05_00_0209,w05_00_0227,w05_00_0244,w05_00_0245,w05_00_0246,w05_00_0248,w05_00_0257,w05_00_0262,w05_00_0264,w05_00_0283,wF3_F_021,wF3_F_008_F3_F_013,w05_00_0311
//   Enabled: w05_00_0120,w05_00_0127,w05_00_0189,w05_00_0312
//   Always on: w05_00_0074,w05_00_0122

	.section/DOUBLE32 program;

.epctext:
	.align 4;
_pulse_led_on_pf0_indefinitely:
.LN_pulse_led_on_pf0_indefinitely:
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 12 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P1,ASTAT0-ASTAT1,CC,LC0,LT0,LB0}
//   Call preserved registers used:{FP,SP}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P1,ASTAT0-ASTAT1,CC,AQ,LC0,LT0,LB0,RETS}
//-------------------------------------------------------------------
// line "..\..\src\buttons_and_leds.c":25
	LINK 12;
	.align 2
.LN0:
// line 27
	P1 = 1840 /* -4192464 */;
	P1.H = -64 /* -4192464 */;
	R1 = ROT R0 BY 0 || R0.L = W[P1];
	BITSET(R0, 0);
	W[P1] = R0.L;
.LN1:
// line 28
	R0 = -11785 /* 7983607 */;
	R0.H = 121 /* 7983607 */;
	CALL.X (___div32);                      // division is implemented as a library call. There is one more instruction related to this call. 
.LN2:
// line 29
	R2 = R0 << 1;
	R1 = R2;
.LN3:
// line 33
	P0 = 1792 /* -4192512 */;
	P0.H = -64 /* -4192512 */;
	P1 = -1;

.P34L11:
//-------------------------------------------------------------------
//   Loop at "..\..\src\buttons_and_leds.c" line 30 col 2 (infinite hardware loop wrapper) 
//-------------------------------------------------------------------
	LOOP .P34L3L LC0 = P1;

.P34L3:
//-------------------------------------------------------------------
//   Loop at "..\..\src\buttons_and_leds.c" line 30 col 2
//-------------------------------------------------------------------
// Jumps out of this loop prevent efficient hardware loop generation.
//-------------------------------------------------------------------
	LOOP_BEGIN .P34L3L;
.LN4:
// line 31
	CC = R1 == 0;
	if CC jump .P34L5 ;

.P34L4:
.LN5:
// line 32
	CC = R0 < R1 (IU);
	if !CC jump .P34L8 ;

.P34L7:
.LN6:
// line 33
	R3.L = W[P0];                           // Use of volatile in loops precludes optimizations. 
	BITSET(R3, 0);
	W[P0] = R3.L;                           // Use of volatile in loops precludes optimizations. 
	jump .P34L9;

.P34L8:
.LN7:
// line 35
	R3.L = W[P0];                           // Use of volatile in loops precludes optimizations. 
	BITCLR(R3, 0);
	W[P0] = R3.L;                           // Use of volatile in loops precludes optimizations. 

.P34L9:
.LN8:
// line 37
	R1 += -1;

.P34L10:
	NOP;
	LOOP_END .P34L3L;

.P34L12:
//-------------------------------------------------------------------
//   Part of Loop 11, depth 1
//-------------------------------------------------------------------
	jump .P34L11;

.P34L5:
//-------------------------------------------------------------------
//   Part of Loop 3, depth 2
//-------------------------------------------------------------------
	R1 = R2;
	jump .P34L10;
.LN._pulse_led_on_pf0_indefinitely.end:
._pulse_led_on_pf0_indefinitely.end:
	.global _pulse_led_on_pf0_indefinitely;
	.type _pulse_led_on_pf0_indefinitely,STT_FUNC;

	.align 4;
_state_of_button_pf3:
.LN_state_of_button_pf3:
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,P0-P1,ASTAT0-ASTAT1}
//   Call preserved registers used:{FP,SP,RETS}
//-------------------------------------------------------------------
// line "..\..\src\buttons_and_leds.c":21
	LINK 0;
	.align 2
.LN9:
// line 22
	P1 = 1792 /* -4192512 */;
	P1.H = -64 /* -4192512 */;
	R0.L = W[P1];
	P0 = [FP + 4];
	R1 = 8;
	R0 = R0 & R1;
	UNLINK;
	R0 = R0.L (Z);
	JUMP (P0);
.LN._state_of_button_pf3.end:
._state_of_button_pf3.end:
	.global _state_of_button_pf3;
	.type _state_of_button_pf3,STT_FUNC;

	.align 4;
_state_of_button_pf2:
.LN_state_of_button_pf2:
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,P0-P1,ASTAT0-ASTAT1}
//   Call preserved registers used:{FP,SP,RETS}
//-------------------------------------------------------------------
// line "..\..\src\buttons_and_leds.c":17
	LINK 0;
	.align 2
.LN10:
// line 18
	P1 = 1792 /* -4192512 */;
	P1.H = -64 /* -4192512 */;
	R0.L = W[P1];
	P0 = [FP + 4];
	R1 = 4;
	R0 = R0 & R1;
	UNLINK;
	R0 = R0.L (Z);
	JUMP (P0);
.LN._state_of_button_pf2.end:
._state_of_button_pf2.end:
	.global _state_of_button_pf2;
	.type _state_of_button_pf2,STT_FUNC;

	.align 4;
_setup_leds_and_buttons:
.LN_setup_leds_and_buttons:
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,P0-P1,ASTAT0-ASTAT1}
//   Call preserved registers used:{FP,SP,RETS}
//Inlined in _setup_leds_and_buttons:
//  ..\..\src\buttons_and_leds.c:7:18'_turn_off_led_pf1
//  ..\..\src\buttons_and_leds.c:6:18'_turn_off_led_pf0
//-------------------------------------------------------------------
// line "..\..\src\buttons_and_leds.c":5
	LINK 0;
	.align 2
	R0 = 1;
.LN11:
// line "..\..\src\buttons_and_leds.h":14
	P1 = 1796 /* -4192508 */;
	P1.H = -64 /* -4192508 */;
	W[P1] = R0.L;
	R1 = 2;
.LN12:
// line 16
	W[P1] = R1.L;
.LN13:
// line "..\..\src\buttons_and_leds.c":8
	P1 = 1840 /* -4192464 */;
	P1.H = -64 /* -4192464 */;
	R0.L = W[P1];
	R1 = 3;
	R0 = R0 | R1;
	W[P1] = R0.L;
.LN14:
// line 10
	R0.L = W[P1];
	R1 = -13;
	R0 = R0 & R1;
	W[P1] = R0.L;
.LN15:
// line 11
	P1 = 1844 /* -4192460 */;
	P1.H = -64 /* -4192460 */;
	R0.L = W[P1];
	R0 = R0 & R1;
	W[P1] = R0.L;
.LN16:
// line 12
	P1 = 1848 /* -4192456 */;
	P1.H = -64 /* -4192456 */;
	R0.L = W[P1];
	R0 = R0 & R1;
	W[P1] = R0.L;
.LN17:
// line 13
	P1 = 1852 /* -4192452 */;
	P1.H = -64 /* -4192452 */;
	R0.L = W[P1];
	R0 = R0 & R1;
	W[P1] = R0.L;
.LN18:
// line 14
	P1 = 1856 /* -4192448 */;
	P1.H = -64 /* -4192448 */;
	R0.L = W[P1];
	R1 = 12;
	R0 = R0 | R1;
	W[P1] = R0.L;
.LN19:
// line 15
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);
.LN._setup_leds_and_buttons.end:
._setup_leds_and_buttons.end:
	.global _setup_leds_and_buttons;
	.type _setup_leds_and_buttons,STT_FUNC;

	.file_attr ProjectName="CoreA";
	.file_attr FuncName="_pulse_led_on_pf0_indefinitely";
	.file_attr FuncName="_state_of_button_pf3";
	.file_attr FuncName="_state_of_button_pf2";
	.file_attr FuncName="_turn_off_led_pf1";
	.file_attr FuncName="_turn_off_led_pf0";
	.file_attr FuncName="_setup_leds_and_buttons";
	.file_attr Content="Code";
.epctext.end:

	.extern ___div32;
	.type ___div32,STT_FUNC;

	.section .debug_abbrev SHT_DEBUGINFO;

	.align 1;
.epcabbrev:
	.type .epcabbrev,STT_OBJECT;
	.inc/binary "..\Debug\buttons_and_leds.sbn", 0, 163;
.epcabbrev.end:

	.section .debug_info SHT_DEBUGINFO;

	.align 1;
.epcdebug:
	.type .epcdebug,STT_OBJECT;
	.byte =
		0xEC,0x05,0x00,0x00,0x02,0x00;
	.byte4 = .epcabbrev;
	.byte =
		0x04,0x01,0x2E,0x2E,0x5C,0x2E,0x2E,0x5C,0x73,0x72,0x63,0x5C,
		0x62,0x75,0x74,0x74,0x6F,0x6E,0x73,0x5F,0x61,0x6E,0x64,0x5F,
		0x6C,0x65,0x64,0x73,0x2E,0x63,0x00,0x01;
	.byte4 = .epcline;
	.inc/binary "..\Debug\buttons_and_leds.sbn", 163, 1280;
	.byte4 = .LN_pulse_led_on_pf0_indefinitely;
	.byte4 = .LN._pulse_led_on_pf0_indefinitely.end;
	.byte =
		0x01,0x01,0x00,0x0B,0x00,0x00,0x00,0x00;
	.byte4 = .LN0;
	.byte4 = .LN._pulse_led_on_pf0_indefinitely.end;
	.byte =
		0x00,0x00,0x0C,0x80,0x05,0x00,0x00,0x73,0x74,0x61,0x74,0x65,
		0x5F,0x6F,0x66,0x5F,0x62,0x75,0x74,0x74,0x6F,0x6E,0x5F,0x70,
		0x66,0x33,0x00,0x01;
	.byte4 = .LN_state_of_button_pf3;
	.byte4 = .LN._state_of_button_pf3.end;
	.byte =
		0x01,0xAD,0x01,0x00,0x00,0x01,0x00,0x0B,0x00,0x00,0x00,0x00;
	.byte4 = .LN9;
	.byte4 = .LN._state_of_button_pf3.end;
	.byte =
		0x00,0x00,0x0C,0xB8,0x05,0x00,0x00,0x73,0x74,0x61,0x74,0x65,
		0x5F,0x6F,0x66,0x5F,0x62,0x75,0x74,0x74,0x6F,0x6E,0x5F,0x70,
		0x66,0x32,0x00,0x01;
	.byte4 = .LN_state_of_button_pf2;
	.byte4 = .LN._state_of_button_pf2.end;
	.byte =
		0x01,0xAD,0x01,0x00,0x00,0x01,0x00,0x0B,0x00,0x00,0x00,0x00;
	.byte4 = .LN10;
	.byte4 = .LN._state_of_button_pf2.end;
	.byte =
		0x00,0x00,0x0A,0x00,0x00,0x00,0x00,0x73,0x65,0x74,0x75,0x70,
		0x5F,0x6C,0x65,0x64,0x73,0x5F,0x61,0x6E,0x64,0x5F,0x62,0x75,
		0x74,0x74,0x6F,0x6E,0x73,0x00,0x01;
	.byte4 = .LN_setup_leds_and_buttons;
	.byte4 = .LN._setup_leds_and_buttons.end;
	.byte =
		0x01,0x01,0x00,0x0B,0x00,0x00,0x00,0x00;
	.byte4 = .LN11;
	.byte4 = .LN._setup_leds_and_buttons.end;
	.byte =
		0x00,0x00,0x00;
.epcdebug.end:

	.section .debug_line SHT_DEBUGINFO;

	.align 1;
.epcline:
	.type .epcline,STT_OBJECT;
	.inc/binary "..\Debug\buttons_and_leds.sbn", 1443, 1458;
	.byte4 = .LN_pulse_led_on_pf0_indefinitely;
	.byte =
		0x04,0x01,0x05,0x42,0x21,0x00,0x05,0x02;
	.byte4 = .LN0;
	.byte =
		0x05,0x02,0x0B,0x00,0x05,0x02;
	.byte4 = .LN1;
	.byte =
		0x05,0x14,0x0A,0x00,0x05,0x02;
	.byte4 = .LN2;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN3;
	.byte =
		0x05,0x05,0x0D,0x00,0x05,0x02;
	.byte4 = .LN4;
	.byte =
		0x05,0x03,0x03,0x7E,0x01,0x00,0x05,0x02;
	.byte4 = .LN5;
	.byte =
		0x05,0x04,0x0A,0x00,0x05,0x02;
	.byte4 = .LN6;
	.byte =
		0x05,0x05,0x0A,0x00,0x05,0x02;
	.byte4 = .LN7;
	.byte =
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN8;
	.byte =
		0x05,0x04,0x0B,0x00,0x05,0x02;
	.byte4 = .LN._pulse_led_on_pf0_indefinitely.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_state_of_button_pf3;
	.byte =
		0x04,0x01,0x05,0x2E,0x1D,0x00,0x05,0x02;
	.byte4 = .LN9;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN._state_of_button_pf3.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_state_of_button_pf2;
	.byte =
		0x04,0x01,0x05,0x2E,0x19,0x00,0x05,0x02;
	.byte4 = .LN10;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN._state_of_button_pf2.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_setup_leds_and_buttons;
	.byte =
		0x04,0x01,0x05,0x23,0x0D,0x00,0x05,0x02;
	.byte4 = .LN11;
	.byte =
		0x04,0x11,0x05,0x26,0x12,0x00,0x05,0x02;
	.byte4 = .LN12;
	.byte =
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN13;
	.byte =
		0x04,0x01,0x05,0x02,0x03,0x78,0x01,0x00,0x05,0x02;
	.byte4 = .LN14;
	.byte =
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN15;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN16;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN17;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN18;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN19;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.byte4 = .LN._setup_leds_and_buttons.end;
	.byte =
		0x00,0x01,0x01;
.epcline.end:

	.section .annotations SHT_DEBUGINFO;

	.align 1;
.epcannot:
	.type .epcannot,STT_OBJECT;
	.inc/binary "..\Debug\buttons_and_leds.sbn", 2901, 2080;
.epcannot.end:

	.section .debug_pubnames SHT_DEBUGINFO;

	.align 1;
.epcpubnames:
	.type .epcpubnames,STT_OBJECT;
	.byte =
		0x7B,0x00,0x00,0x00,0x02,0x00;
	.byte4 = .epcdebug;
	.byte =
		0xF0,0x05,0x00,0x00,0x0A,0x05,0x00,0x00,0x70,0x75,0x6C,0x73,
		0x65,0x5F,0x6C,0x65,0x64,0x5F,0x6F,0x6E,0x5F,0x70,0x66,0x30,
		0x5F,0x69,0x6E,0x64,0x65,0x66,0x69,0x6E,0x69,0x74,0x65,0x6C,
		0x79,0x00,0x48,0x05,0x00,0x00,0x73,0x74,0x61,0x74,0x65,0x5F,
		0x6F,0x66,0x5F,0x62,0x75,0x74,0x74,0x6F,0x6E,0x5F,0x70,0x66,
		0x33,0x00,0x80,0x05,0x00,0x00,0x73,0x74,0x61,0x74,0x65,0x5F,
		0x6F,0x66,0x5F,0x62,0x75,0x74,0x74,0x6F,0x6E,0x5F,0x70,0x66,
		0x32,0x00,0xB8,0x05,0x00,0x00,0x73,0x65,0x74,0x75,0x70,0x5F,
		0x6C,0x65,0x64,0x73,0x5F,0x61,0x6E,0x64,0x5F,0x62,0x75,0x74,
		0x74,0x6F,0x6E,0x73,0x00,0x00,0x00,0x00,0x00;
.epcpubnames.end:

	.section .debug_aranges SHT_DEBUGINFO;

	.align 1;
.epcaranges:
	.type .epcaranges,STT_OBJECT;
	.byte =
		0x34,0x00,0x00,0x00,0x02,0x00;
	.byte4 = .epcdebug;
	.byte =
		0x04,0x00,0x00,0x00,0x00,0x00;
	.byte4 = .LN_pulse_led_on_pf0_indefinitely;
	.byte4 = .LN._pulse_led_on_pf0_indefinitely.end-.LN_pulse_led_on_pf0_indefinitely;
	.byte4 = .LN_state_of_button_pf3;
	.byte4 = .LN._state_of_button_pf3.end-.LN_state_of_button_pf3;
	.byte4 = .LN_state_of_button_pf2;
	.byte4 = .LN._state_of_button_pf2.end-.LN_state_of_button_pf2;
	.byte4 = .LN_setup_leds_and_buttons;
	.byte4 = .LN._setup_leds_and_buttons.end-.LN_setup_leds_and_buttons;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00;
.epcaranges.end:
