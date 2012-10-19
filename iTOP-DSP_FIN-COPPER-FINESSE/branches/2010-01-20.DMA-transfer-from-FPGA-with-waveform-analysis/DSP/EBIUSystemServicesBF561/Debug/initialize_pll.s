	.file "..\..\src\initialize_pll.c";
//  Compilation time: Wed Jan 20 22:50:34 2010

//  Compiler options: -c -file-attr ProjectName=CoreA -O -Ov100 -g -save-temps -path-output ..\Debug -structs-do-not-overlap -no-multiline -double-size-32 -decls-strong -warn-protos -proc ADSP-BF561 -o ..\Debug\initialize_pll.doj -MM
//  Architecture: ADSP-BF561
//  Silicon revision: 0.5
//  Anomalies summary:
//   Disabled: w05_00_0046,w05_00_0048,w05_00_0054,w05_00_0071,w05_00_0103,w05_00_0104,w05_00_0157,w05_00_0164,w05_00_0165,w05_00_0195,w05_00_0198,w05_00_0202,w05_00_0209,w05_00_0227,w05_00_0244,w05_00_0245,w05_00_0246,w05_00_0248,w05_00_0257,w05_00_0262,w05_00_0264,w05_00_0283,wF3_F_021,wF3_F_008_F3_F_013,w05_00_0311
//   Enabled: w05_00_0120,w05_00_0127,w05_00_0189,w05_00_0312
//   Always on: w05_00_0074,w05_00_0122

	.section/DOUBLE32 program;

.epctext:
	.align 4;
_run_PLL_programming_sequence:
.LN_run_PLL_programming_sequence:
	.reference _pll_control_register_value;
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,P0-P1}
//   Call preserved registers used:{FP,SP,RETS}
//-------------------------------------------------------------------
// line "..\..\src\initialize_pll.c":118
	LINK 0;
	.align 2
	P1.L = .epcbss;
	P1.H = .epcbss;
.LN0:
// line 120
	R0.L = W[P1];
	P1 = 0 /* -4194304 */;
	P1.H = -64 /* -4194304 */;
	W[P1] = R0.L;

.LN1:
// line 121
	// ASM STATEMENT
	ssync; [--sp] = r0; cli r0; idle; sti r0; r0 = [sp++]; ssync;
	// END ASM STATEMENT

.LN2:
// line 122
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);
.LN._run_PLL_programming_sequence.end:
._run_PLL_programming_sequence.end:
	.global _run_PLL_programming_sequence;
	.type _run_PLL_programming_sequence,STT_FUNC;

	.align 4;
_core_voltage_to_vlev:
.LN_core_voltage_to_vlev:
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0,ASTAT0-ASTAT1,CC}
//   Call preserved registers used:{R7.L,R7.H,FP,SP,RETS}
//-------------------------------------------------------------------
	R1 = 255;
	.align 2
	R2 = R1 << 23;
	R1 = R0;
	BITCLR(R0, 31);
	CC = R2 < R0;
	R0 = 14156 /* 1068054348 */;
	R0.H = 16297 /* 1068054348 */;
	R3 = CC;
// line "..\..\src\initialize_pll.c":38
	LINK 0;
	CC = R1 <= R0;
	[--SP] = R7;
	R0 = CC;
	CC = R3;
	R7 = R7 - R7 (NS) || P0 = [FP + 4];
	IF CC R0 = R7;
	CC = R0;
	R2 = 14;
	R0 = 15;
	IF CC R0 = R2;
	R2 = 28312 /* 1067609752 */;
	R2.H = 16290 /* 1067609752 */;
	CC = R1 <= R2;
	R2 = CC;
	CC = R3;
	IF CC R2 = R7;
	CC = R2;
	R2 = 13;
	IF CC R0 = R2;
	R2 = -23069 /* 1067165155 */;
	R2.H = 16283 /* 1067165155 */;
	CC = R1 <= R2;
	R2 = CC;
	CC = R3;
	IF CC R2 = R7;
	CC = R2;
	R2 = 12;
	IF CC R0 = R2;
	R2 = -524 /* 1066728948 */;
	R2.H = 16276 /* 1066728948 */;
	CC = R1 <= R2;
	R2 = CC;
	CC = R3;
	IF CC R2 = R7;
	CC = R2;
	R2 = 11;
	IF CC R0 = R2;
	R2 = 26214 /* 1065772646 */;
	R2.H = 16262 /* 1065772646 */;
	CC = R1 <= R2;
	R2 = CC;
	CC = R3;
	IF CC R2 = R7;
	CC = R2;
	R2 = 10;
	IF CC R0 = R2;
	R2 = 0 /* 1065353216 */;
	R2.H = 16256 /* 1065353216 */;
	CC = R1 <= R2;
	R2 = CC;
	CC = R3;
	IF CC R2 = R7;
	CC = R2;
	R2 = 9;
	IF CC R0 = R2;
	R2 = 13107 /* 1064514355 */;
	R2.H = 16243 /* 1064514355 */;
	CC = R1 <= R2;
	R2 = CC;
	CC = R3;
	IF CC R2 = R7;
	CC = R2;
	R2 = 8;
	IF CC R0 = R2;
	R2 = 26214 /* 1063675494 */;
	R2.H = 16230 /* 1063675494 */;
	CC = R1 <= R2;
	R2 = CC;
	CC = R3;
	IF CC R2 = R7;
	CC = R2;
	R2 = 7;
	IF CC R0 = R2;
	R2 = -26214 /* 1062836634 */;
	R2.H = 16217 /* 1062836634 */;
	CC = R1 <= R2;
	R1 = CC;
	CC = R3;
	IF CC R1 = R7;
	CC = R1;
.LN3:
// line 53
	R7 = [SP++];
	R1 = 6;
	IF CC R0 = R1;
	UNLINK;
	JUMP (P0);
.LN._core_voltage_to_vlev.end:
._core_voltage_to_vlev.end:
	.global _core_voltage_to_vlev;
	.type _core_voltage_to_vlev,STT_FUNC;

	.align 4;
_setup_core_voltage_from_vlev:
.LN_setup_core_voltage_from_vlev:
	.reference _run_PLL_programming_sequence;
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 12 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,P0-P1,ASTAT0-ASTAT1}
//   Call preserved registers used:{FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,P0-P1,RETS}
//-------------------------------------------------------------------
// line "..\..\src\initialize_pll.c":56
	LINK 12;
	.align 2
.LN4:
// line 57
	P1 = 8 /* -4194296 */;
	P1.H = -64 /* -4194296 */;
	R1 = R0 << 4 || R0.L = W[P1];
.LN5:
// line 58
	R2 = -241;
	R0 = R0 & R2;
.LN6:
// line 59
	R0 = R0 | R1;
.LN7:
// line 60
	W[P1] = R0.L;
.LN8:
// line 61
	CALL.X (_run_PLL_programming_sequence);
.LN9:
// line 62
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);
.LN._setup_core_voltage_from_vlev.end:
._setup_core_voltage_from_vlev.end:
	.global _setup_core_voltage_from_vlev;
	.type _setup_core_voltage_from_vlev,STT_FUNC;

	.align 4;
_check_core_voltage:
.LN_check_core_voltage:
	.reference _clock_divide_before_pll;
	.reference _core_voltage_to_vlev;
	.reference _setup_core_voltage_from_vlev;
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P1,ASTAT0-ASTAT1,CC}
//   Call preserved registers used:{R6.L,R6.H,R7.L,R7.H,FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P1,ASTAT0-ASTAT1,CC,AQ,RETS}
//-------------------------------------------------------------------
// line "..\..\src\initialize_pll.c":73
	LINK 0;
	.align 2
	R2 = 255;
	[--SP] = (R7:6);
	R7 = R2 << 23;
	CC = R0 == 0;
	R2 = 64;
	SP += -12;
	P1.L = .epcrodata;
	P1.H = .epcrodata;
	IF CC R0 = R2;
.LN10:
// line 78
	R6 = R6 - R6 (NS) || R2 = W[P1] (X);
	R2 = R1 + R2;
	R1 = -15488 /* 30000000 */;
	R1.H = 457 /* 30000000 */;
	R0 *= R1;
	R0 >>= R2;
.LN11:
// line 82
	CALL.X (___unsigned_int32_to_float32);  // instruction is implemented as a library call. 
	R1 = R0;
	BITCLR(R0, 31);
	CC = R7 < R0;
	R0 = 27432 /* 1307470632 */;
	R0.H = 19950 /* 1307470632 */;
	R2 = CC;
	CC = R1 <= R0;
	R0 = CC;
	CC = R2;
	IF CC R0 = R6;
	CC = R0;
	R3 = 0 /* 1066926080 */;
	R3.H = 16280 /* 1066926080 */;
	R0 = 10486 /* 1067722998 */;
	R0.H = 16292 /* 1067722998 */;
	IF CC R0 = R3;
	R3 = -18632 /* 1305720632 */;
	R3.H = 19923 /* 1305720632 */;
	CC = R1 <= R3;
	R3 = CC;
	CC = R2;
	IF CC R3 = R6;
	CC = R3;
	R3 = -15729 /* 1065730703 */;
	R3.H = 16261 /* 1065730703 */;
	IF CC R0 = R3;
	R3 = -7012 /* 1302783132 */;
	R3.H = 19878 /* 1302783132 */;
	CC = R1 <= R3;
	R3 = CC;
	CC = R2;
	IF CC R3 = R6;
	CC = R3;
	R3 = 13107 /* 1064514355 */;
	R3.H = 16243 /* 1064514355 */;
	IF CC R0 = R3;
	R3 = 3352 /* 1301220632 */;
	R3.H = 19855 /* 1301220632 */;
	CC = R1 <= R3;
	R3 = CC;
	CC = R2;
	IF CC R3 = R6;
	CC = R3;
	R3 = -7864 /* 1062920520 */;
	R3.H = 16218 /* 1062920520 */;
	IF CC R0 = R3;
	R3 = 27432 /* 1299082024 */;
	R3.H = 19822 /* 1299082024 */;
	CC = R1 <= R3;
	R1 = CC;
	CC = R2;
	IF CC R1 = R6;
	CC = R1;
	R1 = -13107 /* 1061997773 */;
	R1.H = 16204 /* 1061997773 */;
	IF CC R0 = R1;
.LN12:
// line 87
	CALL.X (_core_voltage_to_vlev);
.LN13:
	CALL.X (_setup_core_voltage_from_vlev);
.LN14:
// line 89
	SP += 12;
	P0 = [FP + 4];
	(R7:6) = [SP++];
	UNLINK;
	// -- stall --
	JUMP (P0);
.LN._check_core_voltage.end:
._check_core_voltage.end:
	.global _check_core_voltage;
	.type _check_core_voltage,STT_FUNC;

	.align 4;
_bypass_PLL:
.LN_bypass_PLL:
	.reference _pll_control_register_value;
	.reference _run_PLL_programming_sequence;
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 12 
//   Scratch registers used:{R0.L,R0.H,P0-P1,ASTAT0-ASTAT1}
//   Call preserved registers used:{FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,P0-P1,RETS}
//-------------------------------------------------------------------
// line "..\..\src\initialize_pll.c":92
	LINK 12;
	.align 2
	P1.L = .epcbss;
	P1.H = .epcbss;
.LN15:
// line 94
	R0.L = W[P1];
	BITSET(R0, 8);
	W[P1] = R0.L;
.LN16:
// line 97
	CALL.X (_run_PLL_programming_sequence);
.LN17:
// line 98
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);
.LN._bypass_PLL.end:
._bypass_PLL.end:
	.global _bypass_PLL;
	.type _bypass_PLL,STT_FUNC;

	.align 4;
_use_PLL:
.LN_use_PLL:
	.reference _pll_control_register_value;
	.reference _run_PLL_programming_sequence;
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 12 
//   Scratch registers used:{R0.L,R0.H,P0-P1,ASTAT0-ASTAT1}
//   Call preserved registers used:{FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,P0-P1,RETS}
//-------------------------------------------------------------------
// line "..\..\src\initialize_pll.c":100
	LINK 12;
	.align 2
	P1.L = .epcbss;
	P1.H = .epcbss;
.LN18:
// line 102
	R0.L = W[P1];
	BITCLR(R0, 8);
	W[P1] = R0.L;
.LN19:
// line 105
	CALL.X (_run_PLL_programming_sequence);
.LN20:
// line 106
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);
.LN._use_PLL.end:
._use_PLL.end:
	.global _use_PLL;
	.type _use_PLL,STT_FUNC;

	.align 4;
_setup_PLL:
.LN_setup_PLL:
	.reference _check_core_voltage;
	.reference _clock_divide_before_pll;
	.reference _pll_control_register_value;
	.reference _bypass_PLL;
	.reference _use_PLL;
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,P0-P1,ASTAT0-ASTAT1,CC}
//   Call preserved registers used:{R4.L,R4.H,R5.L,R5.H,R6.L,R6.H,R7.L,R7.H,FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P1,ASTAT0-ASTAT1,CC,AQ,RETS}
//-------------------------------------------------------------------
// line "..\..\src\initialize_pll.c":108
	LINK 0;
	.align 2
	[--SP] = (R7:4);
	SP += -12;
	R6 = R0;
	R7 = R2;
	R5 = R1;
.LN21:
// line 109
	CALL.X (_check_core_voltage);
	P1.L = .epcrodata;
	P1.H = .epcrodata;
.LN22:
// line 111
	R0 = R6 << 9 || R1.L = W[P1];
	R0 = R0 | R1;
	P1.L = .epcbss;
	P1.H = .epcbss;
	CC = R7 == 0;
	R1 = 1;
	R0.L = R5.L << 4 || W[P1] = R0.L;
	IF CC R7 = R1;
.LN23:
// line 113
	R1 = R7 | R0;
.LN24:
// line 112
	CALL.X (_bypass_PLL);
.LN25:
// line 113
	P1 = 4 /* -4194300 */;
	P1.H = -64 /* -4194300 */;
	W[P1] = R1.L;
	R4 = 2400;
.LN26:
// line 114
	P1 = 16 /* -4194288 */;
	P1.H = -64 /* -4194288 */;
	W[P1] = R4.L;
.LN27:
// line 115
	CALL.X (_use_PLL);
.LN28:
// line 116
	SP += 12;
	P0 = [FP + 4];
	(R7:4) = [SP++];
	UNLINK;
	// -- stall --
	JUMP (P0);
.LN._setup_PLL.end:
._setup_PLL.end:
	.global _setup_PLL;
	.type _setup_PLL,STT_FUNC;

	.file_attr ProjectName="CoreA";
	.file_attr FuncName="_run_PLL_programming_sequence";
	.file_attr FuncName="_core_voltage_to_vlev";
	.file_attr FuncName="_setup_core_voltage_from_vlev";
	.file_attr FuncName="_check_core_voltage";
	.file_attr FuncName="_bypass_PLL";
	.file_attr FuncName="_use_PLL";
	.file_attr FuncName="_setup_PLL";
	.file_attr Content="CodeData";
.epctext.end:

	.extern ___unsigned_int32_to_float32;
	.type ___unsigned_int32_to_float32,STT_FUNC;

	.section/DOUBLE32 constdata;

	.align 4;
.epcrodata:
	.type .epcrodata,STT_OBJECT;
_clock_divide_before_pll:
	.global _clock_divide_before_pll;
	.type _clock_divide_before_pll,STT_OBJECT;
	.byte =
		0x01,0x00;
.epcrodata.end:

	.section/ZERO_INIT/DOUBLE32 bsz;

	.align 2;
.epcbss:
	.type .epcbss,STT_OBJECT;
	.byte _pll_control_register_value[2];
	.global _pll_control_register_value;
	.type _pll_control_register_value,STT_OBJECT;
.epcbss.end:

	.section .debug_abbrev SHT_DEBUGINFO;

	.align 1;
.epcabbrev:
	.type .epcabbrev,STT_OBJECT;
	.inc/binary "..\Debug\initialize_pll.sbn", 0, 187;
.epcabbrev.end:

	.section .debug_info SHT_DEBUGINFO;

	.align 1;
.epcdebug:
	.type .epcdebug,STT_OBJECT;
	.byte =
		0xC2,0x06,0x00,0x00,0x02,0x00;
	.byte4 = .epcabbrev;
	.byte =
		0x04,0x01,0x2E,0x2E,0x5C,0x2E,0x2E,0x5C,0x73,0x72,0x63,0x5C,
		0x69,0x6E,0x69,0x74,0x69,0x61,0x6C,0x69,0x7A,0x65,0x5F,0x70,
		0x6C,0x6C,0x2E,0x63,0x00,0x01;
	.byte4 = .epcline;
	.inc/binary "..\Debug\initialize_pll.sbn", 187, 1279;
	.byte4 = .LN_run_PLL_programming_sequence;
	.byte4 = .LN._run_PLL_programming_sequence.end;
	.byte =
		0x01,0x01,0x00,0x0B,0x00,0x00,0x00,0x00;
	.byte4 = .LN0;
	.byte4 = .LN._run_PLL_programming_sequence.end;
	.byte =
		0x00,0x00,0x0C,0x7E,0x05,0x00,0x00,0x63,0x6F,0x72,0x65,0x5F,
		0x76,0x6F,0x6C,0x74,0x61,0x67,0x65,0x5F,0x74,0x6F,0x5F,0x76,
		0x6C,0x65,0x76,0x00,0x01;
	.byte4 = .LN_core_voltage_to_vlev;
	.byte4 = .LN._core_voltage_to_vlev.end;
	.byte =
		0x01,0xF9,0x01,0x00,0x00,0x01,0x00,0x0B,0x00,0x00,0x00,0x00;
	.byte4 = .LN3;
	.byte4 = .LN._core_voltage_to_vlev.end;
	.byte =
		0x00,0x00,0x0A,0xBB,0x05,0x00,0x00,0x73,0x65,0x74,0x75,0x70,
		0x5F,0x63,0x6F,0x72,0x65,0x5F,0x76,0x6F,0x6C,0x74,0x61,0x67,
		0x65,0x5F,0x66,0x72,0x6F,0x6D,0x5F,0x76,0x6C,0x65,0x76,0x00,
		0x01;
	.byte4 = .LN_setup_core_voltage_from_vlev;
	.byte4 = .LN._setup_core_voltage_from_vlev.end;
	.byte =
		0x01,0x01,0x00,0x0B,0x00,0x00,0x00,0x00;
	.byte4 = .LN4;
	.byte4 = .LN._setup_core_voltage_from_vlev.end;
	.byte =
		0x00,0x00,0x0A,0xEE,0x05,0x00,0x00,0x63,0x68,0x65,0x63,0x6B,
		0x5F,0x63,0x6F,0x72,0x65,0x5F,0x76,0x6F,0x6C,0x74,0x61,0x67,
		0x65,0x00,0x01;
	.byte4 = .LN_check_core_voltage;
	.byte4 = .LN._check_core_voltage.end;
	.byte =
		0x01,0x01,0x00,0x0B,0x00,0x00,0x00,0x00;
	.byte4 = .LN10;
	.byte4 = .LN._check_core_voltage.end;
	.byte =
		0x00,0x00,0x0A,0x19,0x06,0x00,0x00,0x62,0x79,0x70,0x61,0x73,
		0x73,0x5F,0x50,0x4C,0x4C,0x00,0x01;
	.byte4 = .LN_bypass_PLL;
	.byte4 = .LN._bypass_PLL.end;
	.byte =
		0x01,0x01,0x00,0x0B,0x00,0x00,0x00,0x00;
	.byte4 = .LN15;
	.byte4 = .LN._bypass_PLL.end;
	.byte =
		0x00,0x00,0x0A,0x41,0x06,0x00,0x00,0x75,0x73,0x65,0x5F,0x50,
		0x4C,0x4C,0x00,0x01;
	.byte4 = .LN_use_PLL;
	.byte4 = .LN._use_PLL.end;
	.byte =
		0x01,0x01,0x00,0x0B,0x00,0x00,0x00,0x00;
	.byte4 = .LN18;
	.byte4 = .LN._use_PLL.end;
	.byte =
		0x00,0x00,0x0A,0x6B,0x06,0x00,0x00,0x73,0x65,0x74,0x75,0x70,
		0x5F,0x50,0x4C,0x4C,0x00,0x01;
	.byte4 = .LN_setup_PLL;
	.byte4 = .LN._setup_PLL.end;
	.byte =
		0x01,0x01,0x00,0x0B,0x00,0x00,0x00,0x00;
	.byte4 = .LN21;
	.byte4 = .LN._setup_PLL.end;
	.byte =
		0x00,0x00,0x0D,0x63,0x6C,0x6F,0x63,0x6B,0x5F,0x64,0x69,0x76,
		0x69,0x64,0x65,0x5F,0x62,0x65,0x66,0x6F,0x72,0x65,0x5F,0x70,
		0x6C,0x6C,0x00,0x01,0xC0,0x06,0x00,0x00,0x05,0x0C;
	.byte4 = _clock_divide_before_pll;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x0D,0x70,0x6C,0x6C,0x5F,0x63,0x6F,
		0x6E,0x74,0x72,0x6F,0x6C,0x5F,0x72,0x65,0x67,0x69,0x73,0x74,
		0x65,0x72,0x5F,0x76,0x61,0x6C,0x75,0x65,0x00,0x01,0xAB,0x01,
		0x00,0x00,0x05,0x0C;
	.byte4 = _pll_control_register_value;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x0E,0x92,0x01,0x00,0x00,0x00;
.epcdebug.end:

	.section .debug_line SHT_DEBUGINFO;

	.align 1;
.epcline:
	.type .epcline,STT_OBJECT;
	.inc/binary "..\Debug\initialize_pll.sbn", 1466, 1454;
	.byte4 = .LN_run_PLL_programming_sequence;
	.byte =
		0x04,0x01,0x05,0x29,0x7E,0x00,0x05,0x02;
	.byte4 = .LN0;
	.byte =
		0x05,0x02,0x0B,0x00,0x05,0x02;
	.byte4 = .LN1;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN2;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.byte4 = .LN._run_PLL_programming_sequence.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_core_voltage_to_vlev;
	.byte =
		0x04,0x01,0x05,0x37,0x2E,0x00,0x05,0x02;
	.byte4 = .LN3;
	.byte =
		0x05,0x02,0x18,0x00,0x05,0x02;
	.byte4 = .LN._core_voltage_to_vlev.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_setup_core_voltage_from_vlev;
	.byte =
		0x04,0x01,0x05,0x3B,0x40,0x00,0x05,0x02;
	.byte4 = .LN4;
	.byte =
		0x05,0x14,0x0A,0x00,0x05,0x02;
	.byte4 = .LN5;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN6;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN7;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN8;
	.byte =
		0x05,0x1E,0x0A,0x00,0x05,0x02;
	.byte4 = .LN9;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.byte4 = .LN._setup_core_voltage_from_vlev.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_check_core_voltage;
	.byte =
		0x04,0x01,0x05,0x69,0x51,0x00,0x05,0x02;
	.byte4 = .LN10;
	.byte =
		0x05,0x14,0x0E,0x00,0x05,0x02;
	.byte4 = .LN11;
	.byte =
		0x05,0x02,0x0D,0x00,0x05,0x02;
	.byte4 = .LN12;
	.byte =
		0x05,0x33,0x0E,0x00,0x05,0x02;
	.byte4 = .LN13;
	.byte =
		0x05,0x1E,0x01,0x00,0x05,0x02;
	.byte4 = .LN14;
	.byte =
		0x05,0x01,0x0B,0x00,0x05,0x02;
	.byte4 = .LN._check_core_voltage.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_bypass_PLL;
	.byte =
		0x04,0x01,0x05,0x17,0x64,0x00,0x05,0x02;
	.byte4 = .LN15;
	.byte =
		0x05,0x02,0x0B,0x00,0x05,0x02;
	.byte4 = .LN16;
	.byte =
		0x05,0x1E,0x0C,0x00,0x05,0x02;
	.byte4 = .LN17;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.byte4 = .LN._bypass_PLL.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_use_PLL;
	.byte =
		0x04,0x01,0x05,0x14,0x6C,0x00,0x05,0x02;
	.byte4 = .LN18;
	.byte =
		0x05,0x02,0x0B,0x00,0x05,0x02;
	.byte4 = .LN19;
	.byte =
		0x05,0x1E,0x0C,0x00,0x05,0x02;
	.byte4 = .LN20;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.byte4 = .LN._use_PLL.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_setup_PLL;
	.byte =
		0x04,0x01,0x05,0x88,0x01,0x74,0x00,0x05,0x02;
	.byte4 = .LN21;
	.byte =
		0x05,0x14,0x0A,0x00,0x05,0x02;
	.byte4 = .LN22;
	.byte =
		0x05,0x02,0x0B,0x00,0x05,0x02;
	.byte4 = .LN23;
	.byte =
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN24;
	.byte =
		0x05,0x0C,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN25;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN26;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN27;
	.byte =
		0x05,0x09,0x0A,0x00,0x05,0x02;
	.byte4 = .LN28;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.byte4 = .LN._setup_PLL.end;
	.byte =
		0x00,0x01,0x01;
.epcline.end:

	.section .annotations SHT_DEBUGINFO;

	.align 1;
.epcannot:
	.type .epcannot,STT_OBJECT;
	.inc/binary "..\Debug\initialize_pll.sbn", 2920, 2208;
.epcannot.end:

	.section .debug_pubnames SHT_DEBUGINFO;

	.align 1;
.epcpubnames:
	.type .epcpubnames,STT_OBJECT;
	.byte =
		0xE4,0x00,0x00,0x00,0x02,0x00;
	.byte4 = .epcdebug;
	.inc/binary "..\Debug\initialize_pll.sbn", 5128, 222;
.epcpubnames.end:

	.section .debug_aranges SHT_DEBUGINFO;

	.align 1;
.epcaranges:
	.type .epcaranges,STT_OBJECT;
	.byte =
		0x4C,0x00,0x00,0x00,0x02,0x00;
	.byte4 = .epcdebug;
	.byte =
		0x04,0x00,0x00,0x00,0x00,0x00;
	.byte4 = .LN_run_PLL_programming_sequence;
	.byte4 = .LN._run_PLL_programming_sequence.end-.LN_run_PLL_programming_sequence;
	.byte4 = .LN_core_voltage_to_vlev;
	.byte4 = .LN._core_voltage_to_vlev.end-.LN_core_voltage_to_vlev;
	.byte4 = .LN_setup_core_voltage_from_vlev;
	.byte4 = .LN._setup_core_voltage_from_vlev.end-.LN_setup_core_voltage_from_vlev;
	.byte4 = .LN_check_core_voltage;
	.byte4 = .LN._check_core_voltage.end-.LN_check_core_voltage;
	.byte4 = .LN_bypass_PLL;
	.byte4 = .LN._bypass_PLL.end-.LN_bypass_PLL;
	.byte4 = .LN_use_PLL;
	.byte4 = .LN._use_PLL.end-.LN_use_PLL;
	.byte4 = .LN_setup_PLL;
	.byte4 = .LN._setup_PLL.end-.LN_setup_PLL;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00;
.epcaranges.end:
