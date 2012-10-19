	.file "..\..\src\initialize_sdram.c";
//  Compilation time: Wed Jan 20 22:50:35 2010

//  Compiler options: -c -file-attr ProjectName=CoreA -O -Ov100 -g -save-temps -path-output ..\Debug -structs-do-not-overlap -no-multiline -double-size-32 -decls-strong -warn-protos -proc ADSP-BF561 -o ..\Debug\initialize_sdram.doj -MM
//  Architecture: ADSP-BF561
//  Silicon revision: 0.5
//  Anomalies summary:
//   Disabled: w05_00_0046,w05_00_0048,w05_00_0054,w05_00_0071,w05_00_0103,w05_00_0104,w05_00_0157,w05_00_0164,w05_00_0165,w05_00_0195,w05_00_0198,w05_00_0202,w05_00_0209,w05_00_0227,w05_00_0244,w05_00_0245,w05_00_0246,w05_00_0248,w05_00_0257,w05_00_0262,w05_00_0264,w05_00_0283,wF3_F_021,wF3_F_008_F3_F_013,w05_00_0311
//   Enabled: w05_00_0120,w05_00_0127,w05_00_0189,w05_00_0312
//   Always on: w05_00_0074,w05_00_0122

	.section/DOUBLE32 program;

.epctext:
	.align 4;
_sdram_global_control_register:
.LN_sdram_global_control_register:
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0,ASTAT0-ASTAT1}
//   Call preserved registers used:{R6.L,R6.H,R7.L,R7.H,FP,SP,RETS}
//-------------------------------------------------------------------
// line "..\..\src\initialize_sdram.c":26
	LINK 0;
	.align 2
.LN0:
// line 27
	R0 <<= 31;
	R1 <<= 30;
.LN1:
// line 26
	[--SP] = (R7:6);
.LN2:
// line 27
	R0 = R0 | R1;
	R1 = R2 << 29 || R3 = [SP + 28];
	R0 = R0 | R1;
	R1 = R3 << 28 || R7 = [SP + 32];
	R0 = R0 | R1;
	R1 = R7 << 26 || R2 = [SP + 36];
	R0 = R0 | R1;
	R1 = R2 << 25 || R3 = [SP + 40];
	R0 = R0 | R1;
	R1 = R3 << 24 || R7 = [SP + 44];
	R0 = R0 | R1;
	R1 = R7 << 23 || R2 = [SP + 48];
	R0 = R0 | R1;
	R1 = R2 << 22 || R3 = [SP + 52];
.LN3:
// line 26
	R2 = [SP + 60];
.LN4:
// line 27
	R0 = R0 | R1;
	R6 = R2 << 15 || R2 = [FP + 56];
	R1 = R3 << 21 || R7 = [SP + 56];
	R0 = R0 | R1;
	R1 = R2 << 11 || R3 = [FP + 60];
	R2 = R7 << 19 || P0 = [FP + 4];
	R0 = R0 | R2;
	R0 = R0 | R6;
	R0 = R0 | R1;
	R1 = R3 << 6;
	R0 = R0 | R1;
.LN5:
// line 26
	R1 = [SP + 72];
.LN6:
// line 27
	R1 <<= 4;
	R0 = R0 | R1;
.LN7:
// line 26
	R1 = [SP + 76];
.LN8:
// line 27
	R1 <<= 2;
	R0 = R0 | R1;
.LN9:
// line 26
	R1 = [SP + 80];
.LN10:
// line 27
	R1 <<= 1;
	R0 = R0 | R1;
.LN11:
// line 26
	R1 = [SP + 84];
.LN12:
// line 27
	(R7:6) = [SP++];
	R0 = R1 | R0;
	UNLINK;
	JUMP (P0);
.LN._sdram_global_control_register.end:
._sdram_global_control_register.end:
	.global _sdram_global_control_register;
	.type _sdram_global_control_register,STT_FUNC;

	.align 4;
_setup_SDRAM:
.LN_setup_SDRAM:
	.reference _sdram_global_control_register;
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,P0-P1,ASTAT0-ASTAT1}
//   Call preserved registers used:{R5.L,R5.H,R6.L,R6.H,R7.L,R7.H,P3-P5,FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,I0-I3,B0-B3,M0-M3,A0.W,A0.X,A1.W,A1.X,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//Inlined in _setup_SDRAM:
//  ..\..\src\initialize_sdram.c:81:8'_ssync
//  ..\..\src\initialize_sdram.c:76:7'_ssync
//  ..\..\src\initialize_sdram.c:71:7'_ssync
//  ..\..\src\initialize_sdram.c:65:7'_ssync
//  ..\..\src\initialize_sdram.c:56:7'_ssync
//  ..\..\src\initialize_sdram.c:41:7'_ssync
//-------------------------------------------------------------------
// line "..\..\src\initialize_sdram.c":33
	LINK 0;
	.align 2
	[--SP] = (R7:5, P5:3);
	SP += -36;
.LN13:
// line 38
	R7 = 0 /* 1065353216 */;
	R7.H = 16256 /* 1065353216 */;
.LN14:
// line 33
	SP += -36;
.LN15:
// line 38
	R0 = R7;
	CALL.X (_delay_ms);
.LN16:
// line 39
	P3 = 2576 /* -4191728 */;
	P3.H = -64 /* -4191728 */;
	R0 = ROT R7 BY 0 || R1 = [P3];
	BITCLR(R1, 0);
	[P3] = R1;
.LN17:
// line 40
	CALL.X (_delay_ms);
.LN18:
// line "C:\Program Files\Analog Devices\VisualDSP 5.0\Blackfin\include\builtins.h":3389
	.MESSAGE/SUPPRESS 5515;
		CLI R0;
	.MESSAGE/SUPPRESS 5515 FOR 1 LINES;
		SSYNC;
	.MESSAGE/RESTORE 5515;
		STI R0;
.LN19:
// line "..\..\src\initialize_sdram.c":42
	R0 = R7;
	CALL.X (_delay_ms);
.LN20:
// line 52
	P1 = 6;
	R0 = R0 - R0 (NS) || [SP + 52] = P1;
	P1 = 2;
	R2 = R2 - R2 (NS) || [SP + 40] = P1;
	P4 = 0;
	P5 = 3;
	P1 = 1;
	R1 = R1 - R1 (NS) || [SP + 16] = P1;
	[SP + 24] = P4;
	[SP + 20] = P4;
	[SP + 12] = P4;
	[SP + 68] = P4;
	[SP + 64] = P4;
	[SP + 56] = P4;
	[SP + 36] = P4;
	[SP + 32] = P4;
	[SP + 28] = P4;
	[SP + 60] = P5;
	[SP + 48] = P5;
	[SP + 44] = P5;
	CALL.X (_sdram_global_control_register);
	R0 = R0.L (Z);
.LN21:
// line 54
	R0 = ROT R7 BY 0 || [P3] = R0;
.LN22:
// line 55
	CALL.X (_delay_ms);
.LN23:
// line "C:\Program Files\Analog Devices\VisualDSP 5.0\Blackfin\include\builtins.h":3389
	.MESSAGE/SUPPRESS 5515;
		CLI R0;
	.MESSAGE/SUPPRESS 5515 FOR 1 LINES;
		SSYNC;
	.MESSAGE/RESTORE 5515;
		STI R0;
.LN24:
// line "..\..\src\initialize_sdram.c":57
	R0 = R7;
	CALL.X (_delay_ms);
	R6 = 928;
.LN25:
// line 61
	P1 = 2584 /* -4191720 */;
	P1.H = -64 /* -4191720 */;
	R0 = ROT R7 BY 0 || W[P1] = R6.L;
.LN26:
// line 64
	CALL.X (_delay_ms);
.LN27:
// line "C:\Program Files\Analog Devices\VisualDSP 5.0\Blackfin\include\builtins.h":3389
	.MESSAGE/SUPPRESS 5515;
		CLI R0;
	.MESSAGE/SUPPRESS 5515 FOR 1 LINES;
		SSYNC;
	.MESSAGE/RESTORE 5515;
		STI R0;
.LN28:
// line "..\..\src\initialize_sdram.c":66
	R0 = R7;
	CALL.X (_delay_ms);
.LN29:
// line 68
	R5 = 13621 /* 892679477 */;
	R5.H = 13621 /* 892679477 */;
	P1 = 2580 /* -4191724 */;
	P1.H = -64 /* -4191724 */;
	R0 = ROT R7 BY 0 || [P1] = R5;
.LN30:
// line 70
	CALL.X (_delay_ms);
.LN31:
// line "C:\Program Files\Analog Devices\VisualDSP 5.0\Blackfin\include\builtins.h":3389
	.MESSAGE/SUPPRESS 5515;
		CLI R0;
	.MESSAGE/SUPPRESS 5515 FOR 1 LINES;
		SSYNC;
	.MESSAGE/RESTORE 5515;
		STI R0;
.LN32:
// line "..\..\src\initialize_sdram.c":72
	R0 = R7;
	CALL.X (_delay_ms);
.LN33:
// line 74
	R0 = ROT R7 BY 0 || R1 = [P3];
	BITSET(R1, 0);
	[P3] = R1;
.LN34:
// line 75
	CALL.X (_delay_ms);
.LN35:
// line "C:\Program Files\Analog Devices\VisualDSP 5.0\Blackfin\include\builtins.h":3389
	.MESSAGE/SUPPRESS 5515;
		CLI R0;
	.MESSAGE/SUPPRESS 5515 FOR 1 LINES;
		SSYNC;
	.MESSAGE/RESTORE 5515;
		STI R0;
.LN36:
// line "..\..\src\initialize_sdram.c":77
	R0 = R7;
	CALL.X (_delay_ms);
.LN37:
// line 79
	R0 = ROT R7 BY 0 || R1 = [P3];
	BITSET(R1, 23);
	[P3] = R1;
.LN38:
// line 80
	CALL.X (_delay_ms);
.LN39:
// line "C:\Program Files\Analog Devices\VisualDSP 5.0\Blackfin\include\builtins.h":3389
	.MESSAGE/SUPPRESS 5515;
		CLI R1;
	.MESSAGE/SUPPRESS 5515 FOR 1 LINES;
		SSYNC;
	.MESSAGE/RESTORE 5515;
		STI R1;
.LN40:
// line "..\..\src\initialize_sdram.c":82
	R0 = R7;
	CALL.X (_delay_ms);
.LN41:
// line 83
	R6.H = 4660;
	P1.L = _sdram_dummy;
	P1.H = _sdram_dummy;
	W[P1] = R6.H;
.LN42:
// line 85
	SP += 36;
	SP += 36;
	P0 = [FP + 4];
	(R7:5, P5:3) = [SP++];
	UNLINK;
	// -- stall --
	JUMP (P0);
.LN._setup_SDRAM.end:
._setup_SDRAM.end:
	.global _setup_SDRAM;
	.type _setup_SDRAM,STT_FUNC;

	.align 4;
_old_setup_SDRAM:
.LN_old_setup_SDRAM:
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,R0.H,P0-P1,ASTAT0-ASTAT1}
//   Call preserved registers used:{FP,SP,RETS}
//Inlined in _old_setup_SDRAM:
//  ..\..\src\initialize_sdram.c:95:7'_ssync
//  ..\..\src\initialize_sdram.c:93:7'_ssync
//  ..\..\src\initialize_sdram.c:91:7'_ssync
//  ..\..\src\initialize_sdram.c:89:7'_ssync
//-------------------------------------------------------------------
// line "..\..\src\initialize_sdram.c":87
	LINK 0;
	.align 2
.LN43:
// line 88
	P1 = 2576 /* -4191728 */;
	P1.H = -64 /* -4191728 */;
	R0 = [P1];
	BITCLR(R0, 0);
	[P1] = R0;
.LN44:
// line "C:\Program Files\Analog Devices\VisualDSP 5.0\Blackfin\include\builtins.h":3389
	.MESSAGE/SUPPRESS 5515;
		CLI R0;
	.MESSAGE/SUPPRESS 5515 FOR 1 LINES;
		SSYNC;
	.MESSAGE/RESTORE 5515;
		STI R0;
.LN45:
// line "..\..\src\initialize_sdram.c":90
	R0 = -26228 /* 68262284 */;
	R0.H = 1041 /* 68262284 */;
	[P1] = R0;
.LN46:
// line "C:\Program Files\Analog Devices\VisualDSP 5.0\Blackfin\include\builtins.h":3389
	.MESSAGE/SUPPRESS 5515;
		CLI R0;
	.MESSAGE/SUPPRESS 5515 FOR 1 LINES;
		SSYNC;
	.MESSAGE/RESTORE 5515;
		STI R0;
.LN47:
// line "..\..\src\initialize_sdram.c":92
	R0 = [P1];
	BITSET(R0, 0);
	[P1] = R0;
.LN48:
// line "C:\Program Files\Analog Devices\VisualDSP 5.0\Blackfin\include\builtins.h":3389
	.MESSAGE/SUPPRESS 5515;
		CLI R0;
	.MESSAGE/SUPPRESS 5515 FOR 1 LINES;
		SSYNC;
	.MESSAGE/RESTORE 5515;
		STI R0;
.LN49:
// line "..\..\src\initialize_sdram.c":94
	R0 = [P1];
	BITSET(R0, 23);
	[P1] = R0;
.LN50:
// line "C:\Program Files\Analog Devices\VisualDSP 5.0\Blackfin\include\builtins.h":3389
	.MESSAGE/SUPPRESS 5515;
		CLI R0;
	.MESSAGE/SUPPRESS 5515 FOR 1 LINES;
		SSYNC;
	.MESSAGE/RESTORE 5515;
		STI R0;
.LN51:
// line "..\..\src\initialize_sdram.c":99
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);
.LN._old_setup_SDRAM.end:
._old_setup_SDRAM.end:
	.global _old_setup_SDRAM;
	.type _old_setup_SDRAM,STT_FUNC;

	.file_attr ProjectName="CoreA";
	.file_attr FuncName="_sdram_global_control_register";
	.file_attr FuncName="_ssync";
	.file_attr FuncName="_setup_SDRAM";
	.file_attr FuncName="_old_setup_SDRAM";
	.file_attr Content="Code";
.epctext.end:

	.extern _delay_ms;
	.type _delay_ms,STT_FUNC;

	.section .debug_abbrev SHT_DEBUGINFO;

	.align 1;
.epcabbrev:
	.type .epcabbrev,STT_OBJECT;
	.inc/binary "..\Debug\initialize_sdram.sbn", 0, 228;
.epcabbrev.end:

	.section .debug_info SHT_DEBUGINFO;

	.align 1;
.epcdebug:
	.type .epcdebug,STT_OBJECT;
	.byte =
		0x27,0x0D,0x00,0x00,0x02,0x00;
	.byte4 = .epcabbrev;
	.byte =
		0x04,0x01,0x2E,0x2E,0x5C,0x2E,0x2E,0x5C,0x73,0x72,0x63,0x5C,
		0x69,0x6E,0x69,0x74,0x69,0x61,0x6C,0x69,0x7A,0x65,0x5F,0x73,
		0x64,0x72,0x61,0x6D,0x2E,0x63,0x00,0x01;
	.byte4 = .epcline;
	.inc/binary "..\Debug\initialize_sdram.sbn", 228, 2605;
	.byte4 = .LN_sdram_global_control_register;
	.byte4 = .LN._sdram_global_control_register.end;
	.inc/binary "..\Debug\initialize_sdram.sbn", 2833, 227;
	.byte4 = .LN0;
	.byte4 = .LN._sdram_global_control_register.end;
	.byte =
		0x00,0x00,0x0F,0x7C,0x0B,0x00,0x00,0x73,0x65,0x74,0x75,0x70,
		0x5F,0x53,0x44,0x52,0x41,0x4D,0x00,0x01;
	.byte4 = .LN_setup_SDRAM;
	.byte4 = .LN._setup_SDRAM.end;
	.byte =
		0x01,0x01,0x00,0x0E,0x00,0x00,0x00,0x00;
	.byte4 = .LN13;
	.byte4 = .LN._setup_SDRAM.end;
	.byte =
		0x00,0x00,0x0F,0xAC,0x0B,0x00,0x00,0x6F,0x6C,0x64,0x5F,0x73,
		0x65,0x74,0x75,0x70,0x5F,0x53,0x44,0x52,0x41,0x4D,0x00,0x01;
	.byte4 = .LN_old_setup_SDRAM;
	.byte4 = .LN._old_setup_SDRAM.end;
	.byte =
		0x01,0x01,0x00,0x0E,0x00,0x00,0x00,0x00;
	.byte4 = .LN43;
	.byte4 = .LN._old_setup_SDRAM.end;
	.inc/binary "..\Debug\initialize_sdram.sbn", 3060, 375;
	.byte4 = _sdram_dummy;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x00;
.epcdebug.end:

	.section .debug_line SHT_DEBUGINFO;

	.align 1;
.epcline:
	.type .epcline,STT_OBJECT;
	.inc/binary "..\Debug\initialize_sdram.sbn", 3435, 2253;
	.byte4 = .LN_sdram_global_control_register;
	.byte =
		0x04,0x01,0x05,0x50,0x22,0x00,0x05,0x02;
	.byte4 = .LN0;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN1;
	.byte =
		0x05,0x50,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN2;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN3;
	.byte =
		0x05,0x50,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN4;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN5;
	.byte =
		0x05,0x50,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN6;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN7;
	.byte =
		0x05,0x50,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN8;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN9;
	.byte =
		0x05,0x50,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN10;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN11;
	.byte =
		0x05,0x50,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN12;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN._sdram_global_control_register.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_setup_SDRAM;
	.byte =
		0x04,0x01,0x05,0x18,0x29,0x00,0x05,0x02;
	.byte4 = .LN13;
	.byte =
		0x05,0x0A,0x0E,0x00,0x05,0x02;
	.byte4 = .LN14;
	.byte =
		0x05,0x18,0x03,0x7B,0x01,0x00,0x05,0x02;
	.byte4 = .LN15;
	.byte =
		0x05,0x0A,0x0E,0x00,0x05,0x02;
	.byte4 = .LN16;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN17;
	.byte =
		0x05,0x0A,0x0A,0x00,0x05,0x02;
	.byte4 = .LN18;
	.byte =
		0x04,0x06,0x05,0x03,0x03,0x95,0x1A,0x01,0x00,0x05,0x02;
	.byte4 = .LN19;
	.byte =
		0x04,0x01,0x05,0x0A,0x03,0xED,0x65,0x01,0x00,0x05,0x02;
	.byte4 = .LN20;
	.byte =
		0x05,0x4A,0x13,0x00,0x05,0x02;
	.byte4 = .LN21;
	.byte =
		0x05,0x02,0x0B,0x00,0x05,0x02;
	.byte4 = .LN22;
	.byte =
		0x05,0x0A,0x0A,0x00,0x05,0x02;
	.byte4 = .LN23;
	.byte =
		0x04,0x06,0x05,0x03,0x03,0x86,0x1A,0x01,0x00,0x05,0x02;
	.byte4 = .LN24;
	.byte =
		0x04,0x01,0x05,0x0A,0x03,0xFC,0x65,0x01,0x00,0x05,0x02;
	.byte4 = .LN25;
	.byte =
		0x05,0x02,0x0D,0x00,0x05,0x02;
	.byte4 = .LN26;
	.byte =
		0x05,0x0A,0x0C,0x00,0x05,0x02;
	.byte4 = .LN27;
	.byte =
		0x04,0x06,0x05,0x03,0x03,0xFD,0x19,0x01,0x00,0x05,0x02;
	.byte4 = .LN28;
	.byte =
		0x04,0x01,0x05,0x0A,0x03,0x85,0x66,0x01,0x00,0x05,0x02;
	.byte4 = .LN29;
	.byte =
		0x05,0x02,0x0B,0x00,0x05,0x02;
	.byte4 = .LN30;
	.byte =
		0x05,0x0A,0x0B,0x00,0x05,0x02;
	.byte4 = .LN31;
	.byte =
		0x04,0x06,0x05,0x03,0x03,0xF7,0x19,0x01,0x00,0x05,0x02;
	.byte4 = .LN32;
	.byte =
		0x04,0x01,0x05,0x0A,0x03,0x8B,0x66,0x01,0x00,0x05,0x02;
	.byte4 = .LN33;
	.byte =
		0x05,0x02,0x0B,0x00,0x05,0x02;
	.byte4 = .LN34;
	.byte =
		0x05,0x0A,0x0A,0x00,0x05,0x02;
	.byte4 = .LN35;
	.byte =
		0x04,0x06,0x05,0x03,0x03,0xF2,0x19,0x01,0x00,0x05,0x02;
	.byte4 = .LN36;
	.byte =
		0x04,0x01,0x05,0x0A,0x03,0x90,0x66,0x01,0x00,0x05,0x02;
	.byte4 = .LN37;
	.byte =
		0x05,0x03,0x0B,0x00,0x05,0x02;
	.byte4 = .LN38;
	.byte =
		0x05,0x0B,0x0A,0x00,0x05,0x02;
	.byte4 = .LN39;
	.byte =
		0x04,0x06,0x05,0x03,0x03,0xED,0x19,0x01,0x00,0x05,0x02;
	.byte4 = .LN40;
	.byte =
		0x04,0x01,0x05,0x0B,0x03,0x95,0x66,0x01,0x00,0x05,0x02;
	.byte4 = .LN41;
	.byte =
		0x05,0x03,0x0A,0x00,0x05,0x02;
	.byte4 = .LN42;
	.byte =
		0x05,0x01,0x0B,0x00,0x05,0x02;
	.byte4 = .LN._setup_SDRAM.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_old_setup_SDRAM;
	.byte =
		0x04,0x01,0x05,0x1C,0x5F,0x00,0x05,0x02;
	.byte4 = .LN43;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN44;
	.byte =
		0x04,0x06,0x05,0x03,0x03,0xE5,0x19,0x01,0x00,0x05,0x02;
	.byte4 = .LN45;
	.byte =
		0x04,0x01,0x05,0x02,0x03,0x9D,0x66,0x01,0x00,0x05,0x02;
	.byte4 = .LN46;
	.byte =
		0x04,0x06,0x05,0x03,0x03,0xE3,0x19,0x01,0x00,0x05,0x02;
	.byte4 = .LN47;
	.byte =
		0x04,0x01,0x05,0x02,0x03,0x9F,0x66,0x01,0x00,0x05,0x02;
	.byte4 = .LN48;
	.byte =
		0x04,0x06,0x05,0x03,0x03,0xE1,0x19,0x01,0x00,0x05,0x02;
	.byte4 = .LN49;
	.byte =
		0x04,0x01,0x05,0x02,0x03,0xA1,0x66,0x01,0x00,0x05,0x02;
	.byte4 = .LN50;
	.byte =
		0x04,0x06,0x05,0x03,0x03,0xDF,0x19,0x01,0x00,0x05,0x02;
	.byte4 = .LN51;
	.byte =
		0x04,0x01,0x05,0x01,0x03,0xA6,0x66,0x01,0x00,0x05,0x02;
	.byte4 = .LN._old_setup_SDRAM.end;
	.byte =
		0x00,0x01,0x01;
.epcline.end:

	.section .annotations SHT_DEBUGINFO;

	.align 1;
.epcannot:
	.type .epcannot,STT_OBJECT;
	.inc/binary "..\Debug\initialize_sdram.sbn", 5688, 1476;
.epcannot.end:

	.section .debug_pubnames SHT_DEBUGINFO;

	.align 1;
.epcpubnames:
	.type .epcpubnames,STT_OBJECT;
	.byte =
		0x54,0x00,0x00,0x00,0x02,0x00;
	.byte4 = .epcdebug;
	.byte =
		0x2B,0x0D,0x00,0x00,0x37,0x0A,0x00,0x00,0x73,0x64,0x72,0x61,
		0x6D,0x5F,0x67,0x6C,0x6F,0x62,0x61,0x6C,0x5F,0x63,0x6F,0x6E,
		0x74,0x72,0x6F,0x6C,0x5F,0x72,0x65,0x67,0x69,0x73,0x74,0x65,
		0x72,0x00,0x50,0x0B,0x00,0x00,0x73,0x65,0x74,0x75,0x70,0x5F,
		0x53,0x44,0x52,0x41,0x4D,0x00,0x7C,0x0B,0x00,0x00,0x6F,0x6C,
		0x64,0x5F,0x73,0x65,0x74,0x75,0x70,0x5F,0x53,0x44,0x52,0x41,
		0x4D,0x00,0x00,0x00,0x00,0x00;
.epcpubnames.end:

	.section .debug_aranges SHT_DEBUGINFO;

	.align 1;
.epcaranges:
	.type .epcaranges,STT_OBJECT;
	.byte =
		0x2C,0x00,0x00,0x00,0x02,0x00;
	.byte4 = .epcdebug;
	.byte =
		0x04,0x00,0x00,0x00,0x00,0x00;
	.byte4 = .LN_sdram_global_control_register;
	.byte4 = .LN._sdram_global_control_register.end-.LN_sdram_global_control_register;
	.byte4 = .LN_setup_SDRAM;
	.byte4 = .LN._setup_SDRAM.end-.LN_setup_SDRAM;
	.byte4 = .LN_old_setup_SDRAM;
	.byte4 = .LN._old_setup_SDRAM.end-.LN_old_setup_SDRAM;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00;
.epcaranges.end:

	.section/DOUBLE32 data1;


	.extern _sdram_dummy;
	.type _sdram_dummy,STT_OBJECT;
