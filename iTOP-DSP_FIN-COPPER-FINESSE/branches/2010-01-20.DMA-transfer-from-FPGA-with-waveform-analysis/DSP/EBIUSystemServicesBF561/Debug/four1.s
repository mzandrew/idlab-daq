	.file "..\..\src\numerical-recipes-in-c\four1.c";
//  Compilation time: Wed Jan 20 22:50:33 2010

//  Compiler options: -c -file-attr ProjectName=CoreA -O -Ov100 -g -save-temps -path-output ..\Debug -structs-do-not-overlap -no-multiline -double-size-32 -decls-strong -warn-protos -proc ADSP-BF561 -o ..\Debug\four1.doj -MM
//  Architecture: ADSP-BF561
//  Silicon revision: 0.5
//  Anomalies summary:
//   Disabled: w05_00_0046,w05_00_0048,w05_00_0054,w05_00_0071,w05_00_0103,w05_00_0104,w05_00_0157,w05_00_0164,w05_00_0165,w05_00_0195,w05_00_0198,w05_00_0202,w05_00_0209,w05_00_0227,w05_00_0244,w05_00_0245,w05_00_0246,w05_00_0248,w05_00_0257,w05_00_0262,w05_00_0264,w05_00_0283,wF3_F_021,wF3_F_008_F3_F_013,w05_00_0311
//   Enabled: w05_00_0120,w05_00_0127,w05_00_0189,w05_00_0312
//   Always on: w05_00_0074,w05_00_0122

	.section/DOUBLE32 program;

.epctext:
	.align 4;
_four1:
.LN_four1:
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 28 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,I0-I1,M0,ASTAT0-ASTAT1,CC,LC0-LC1,LT0-LT1,LB0-LB1}
//   Call preserved registers used:{R4.L,R4.H,R5.L,R5.H,R6.L,R6.H,R7.L,R7.H,P3-P5,FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,I0-I3,B0-B3,M0-M3,A0.W,A0.X,A1.W,A1.X,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
// line "..\..\src\numerical-recipes-in-c\four1.c":6
	LINK 28;
	.align 2
	[--SP] = (R7:4, P5:3);
.LN0:
// line 11
	R3 = R1 << 1;
.LN1:
// line 6
	SP += -12;
.LN2:
// line 13
	CC = R3 <= 1 (IU);
.LN3:
// line 11
	[FP + 12] = R0;
	[FP + 8] = R3;
.LN4:
// line 13
	if CC jump .P34L3 ;

.P34L25:
	R3 += -2;
	R3 = R3 >> 1 || P5 = [FP + 12];
	R0 += 4;
	R3 += 1;
	P1 = R0;
	P0 = R3;
	R7 = 1;
	P2 = -1;
	M0 = 8;
	I0 = P1;
	R0 = 1;
	LOOP .P34L2L LC1 = P0;

.P34L2:
//-------------------------------------------------------------------
//   Loop at "..\..\src\numerical-recipes-in-c\four1.c" line 13 col 2
//-------------------------------------------------------------------
	LOOP_BEGIN .P34L2L;
.LN5:
// line 14
	CC = R7 < R0 (IU);
	if !CC jump .P34L6 ;

.P34L4:
.LN6:
// line 15
	P1 = R0;
	R3 = ROT R0 BY 0 || R6 = [I0];
.LN7:
// line 16
	R3 += 1;
	P0 = R3;
	I1 = I0;
.LN8:
// line 15
	P1 = P5 + (P1<<2);
	R3 = [P1];
.LN9:
	[P1] = R6;
.LN10:
	[I1++] = R3;
.LN11:
// line 16
	P1 = P5 + (P0<<2);
.LN12:
	R6 = [P1] || R3 = [I1];
	[P1] = R3;
.LN13:
	[I1--] = R6;

.P34L6:
	R3 = R1;

.P34L47:
//-------------------------------------------------------------------
//   Loop at "..\..\src\numerical-recipes-in-c\four1.c" line 19 col 3 (infinite hardware loop wrapper) 
//-------------------------------------------------------------------
	LOOP .P34L7L LC0 = P2;

.P34L7:
//-------------------------------------------------------------------
//   Loop at "..\..\src\numerical-recipes-in-c\four1.c" line 19 col 3
//-------------------------------------------------------------------
//   This loop executes 1 iteration of the original loop in estimated 6 cycles.
//-------------------------------------------------------------------
//   This loop's resource usage is:
//     16-bit Instruction  used  12 out of   12 (100.0%)
//     32-bit Instruction  used   6 out of    6 (100.0%)
//     Group 1             used   6 out of    6 (100.0%)
//-------------------------------------------------------------------
// This loop was not modulo scheduled because it contains jump instructions.
// Jumps out of this loop prevent efficient hardware loop generation.
//-------------------------------------------------------------------
	LOOP_BEGIN .P34L7L;
.LN14:
// line 19
	CC = R3 < 2 (IU);
	if CC jump .P34L8 ;

.P34L10:
	CC = R3 < R0 (IU);
	if !CC jump .P34L8 ;

.P34L9:
.LN15:
// line 20
	R0 = R0 - R3;
.LN16:
// line 21
	R3 >>= 1;
	LOOP_END .P34L7L;

.P34L48:
//-------------------------------------------------------------------
//   Part of Loop 47, depth 2
//-------------------------------------------------------------------
	jump .P34L47;

	.align 8
.P34L8:
//-------------------------------------------------------------------
//   Part of Loop 2, depth 1
//-------------------------------------------------------------------
.LN17:
// line 23
	R0 = R3 + R0 (NS) || I0 += M0;
	.align 2
.LN18:
// line 13
	R7 += 2;
.LN19:
	LOOP_END .P34L2L;

.P34L34:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------

.P34L3:
.LN20:
// line 26
	R0 = R1 << 1;
	CC = R0 <= 2 (IU);
	if CC jump .P34L12 ;

.P34L28:
.LN21:
// line 28
	R0 = R2;
	CALL.X (___int32_to_float32);           // instruction is implemented as a library call. 
	P1 = 2;
	[FP + 16] = R0;
	[FP + -4] = P1;

.P34L13:
//-------------------------------------------------------------------
//   Loop at "..\..\src\numerical-recipes-in-c\four1.c" line 26 col 2
//-------------------------------------------------------------------
	P1 = [FP + -4];
	// -- 3 stalls --
	R0 = P1;
	CALL.X (___unsigned_int32_to_float32);  // instruction is implemented as a library call. There is one more instruction related to this call. 
.LN22:
// line 27
	R1 = ROT R0 BY 0 || P1 = [FP + -4];
.LN23:
// line 28
	R0 = 4059 /* 1086918619 */;
	R0.H = 16585 /* 1086918619 */;
	// -- 2 stalls --
.LN24:
// line 27
	P1 = P1 << 1;
	[SP + 60] = P1;
.LN25:
// line 28
	CALL.X (___float32_div);                // float division is implemented as a library call. There is one more instruction related to this call. 
	R1 = [FP + 16];
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
.LN26:
// line 29
	R1 = 0 /* 1056964608 */;
	R1.H = 16128 /* 1056964608 */;
	R6 = R0;
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. There is one more instruction related to this call. 
.LN27:
	CALL.X (__sinf);
.LN28:
// line 30
	R1 = -1;
	R1 <<= 30;
	R7 = R0;
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	R1 = R7;
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	R0 = ROT R6 BY 0 || [SP + 56] = R0;
.LN29:
// line 31
	CALL.X (__sinf);
.LN30:
// line 34
	P1 = [FP + -4];
	[SP + 48] = R0;
	// -- 2 stalls --
	CC = P1 <= 1 (IU);
.LN31:
// line 27
	P1 = [SP + 60];
	// -- 3 stalls --
	[SP + 52] = P1;
.LN32:
// line 34
	if CC jump .P34L16 ;

.P34L30:
	P5 = [FP + 12];
	P1 = [FP + -4];
	P3 = [FP + -4];
	R0 = 0 /* 1065353216 */;
	R0.H = 16256 /* 1065353216 */;
	P5 += 4;
	P4 = P5 + (P1<<2);
	P1 += -2;
	P1 = P1 >> 1;
	R1 = 0;
	R2 = 1;
	P1 += 1;
	[SP + 44] = R0;
	P3 = (P3 + P3) << 2;
	[SP + 40] = R1;
	[FP + -4] = R2;
	LOOP .P34L15L LC1 = P1;

.P34L15:
//-------------------------------------------------------------------
//   Loop at "..\..\src\numerical-recipes-in-c\four1.c" line 34 col 3
//-------------------------------------------------------------------
	LOOP_BEGIN .P34L15L;
.LN33:
// line 35
	R0 = [FP + 8];
	R1 = [FP + -4];
	CC = R1 <= R0 (IU);
	if !CC jump .P34L19 ;

.P34L32:
	I0 = P5;
	P0 = P4;
	R7 = [FP + -4];

.P34L45:
//-------------------------------------------------------------------
//   Loop at "..\..\src\numerical-recipes-in-c\four1.c" line 35 col 4 (infinite hardware loop wrapper) 
//-------------------------------------------------------------------
	P1 = P3;
	P1 += -4;
	M0 = P1;
	P1 = -1;
	LOOP .P34L18L LC0 = P1;

.P34L18:
//-------------------------------------------------------------------
//   Loop at "..\..\src\numerical-recipes-in-c\four1.c" line 35 col 4
//-------------------------------------------------------------------
//   This loop executes 1 iteration of the original loop in estimated 34 cycles.
//   (cycle count 34 excludes the cost of the inner function calls)
//-------------------------------------------------------------------
//   This loop's resource usage is:
//     32-bit Instruction  used  30 out of   34 ( 88.2%)
//     16-bit Instruction  used  58 out of   68 ( 85.3%)
//     Group 1             used  28 out of   34 ( 82.4%)
//     Store               used   4 out of   34 ( 11.8%)
//-------------------------------------------------------------------
	LOOP_BEGIN .P34L18L;
	R6 = [P0++];
.LN34:
// line 37
	R0 = ROT R6 BY 0 || R1 = [SP + 44];
	I1 = P0;
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	R4 = ROT R0 BY 0 || R0 = [SP + 40] || R5 = [I1--];
	R1 = R5;
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	R1 = R0;
	R0 = R4;
	CALL.X (___float32_sub);                // float  is implemented as a library call. 
	R4 = ROT R0 BY 0 || R0 = [SP + 44];
.LN35:
// line 38
	R1 = R5;
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	R5 = ROT R0 BY 0 || R0 = [SP + 40];
	R1 = R6;
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	R1 = R5;
	CALL.X (___float32_add);                // float addition is implemented as a library call. 
	R6 = ROT R0 BY 0 || R0 = [I0++];
.LN36:
// line 39
	R1 = R4;
	CALL.X (___float32_sub);                // float  is implemented as a library call. 
	R1 = ROT R6 BY 0 || R2 = [SP + 52] || [I1++] = R0;
.LN37:
// line 40
	R7 = R2 + R7 (NS) || R0 = [I0--];
	CALL.X (___float32_sub);                // float  is implemented as a library call. 
	R1 = ROT R4 BY 0 || [I1 ++ M0] = R0;
.LN38:
// line 41
	R0 = [I0];
	CALL.X (___float32_add);                // float addition is implemented as a library call. 
	R0 = ROT R6 BY 0 || [I0++] = R0;
.LN39:
// line 42
	R1 = [I0];
	CALL.X (___float32_add);                // float addition is implemented as a library call. 
.LN40:
// line 35
	R1 = [FP + 8] || [I0 ++ M0] = R0;
	CC = R7 <= R1 (IU);
	if !CC jump .P34L19 ;

.P34L44:
	P0 = I1;
	LOOP_END .P34L18L;

.P34L46:
//-------------------------------------------------------------------
//   Part of Loop 45, depth 3
//-------------------------------------------------------------------
	P1 = I0;
	P0 = I1;
	I0 = P1;
	jump .P34L45;

.P34L19:
//-------------------------------------------------------------------
//   Part of Loop 15, depth 2
//-------------------------------------------------------------------
.LN41:
// line 44
	R1 = [SP + 44];
	R0 = [SP + 56];
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	R7 = ROT R0 BY 0 || R1 = [SP + 40];
	R0 = [SP + 48];
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	R6 = ROT R0 BY 0 || R0 = [SP + 44];
	R1 = ROT R7 BY 0 || R5 = [FP + -4];
	CALL.X (___float32_add);                // float addition is implemented as a library call. 
	R1 = R6;
	CALL.X (___float32_sub);                // float  is implemented as a library call. 
	R6 = ROT R0 BY 0 || R1 = [SP + 40];
.LN42:
// line 45
	R0 = [SP + 56];
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	R7 = ROT R0 BY 0 || R0 = [SP + 44];
	R1 = [SP + 48];
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	R4 = ROT R0 BY 0 || R1 = [SP + 40];
	R0 = ROT R7 BY 0 || [SP + 44] = R6;
	CALL.X (___float32_add);                // float addition is implemented as a library call. 
	R1 = R4;
	CALL.X (___float32_add);                // float addition is implemented as a library call. 
.LN43:
// line 34
	R5 += 2;
	[SP + 40] = R0;
	[FP + -4] = R5;
	P4 += 8;
	P5 += 8;
.LN44:
	LOOP_END .P34L15L;

.P34L36:
//-------------------------------------------------------------------
//   Part of Loop 13, depth 1
//-------------------------------------------------------------------

.P34L16:
.LN45:
// line 26
	P0 = [SP + 60];
	P1 = [FP + 8];
	// -- 2 stalls --
	[FP + -4] = P0;
	CC = P0 < P1 (IU);
	if CC jump .P34L13 (bp);

.P34L37:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------

.P34L12:
.LN46:
// line 49
	SP += 12;
	P0 = [FP + 4];
	(R7:4, P5:3) = [SP++];
	UNLINK;
	// -- stall --
	JUMP (P0);
.LN._four1.end:
._four1.end:
	.global _four1;
	.type _four1,STT_FUNC;

	.file_attr ProjectName="CoreA";
	.file_attr FuncName="_four1";
	.file_attr Content="Code";
.epctext.end:

	.extern ___int32_to_float32;
	.type ___int32_to_float32,STT_FUNC;
	.extern ___unsigned_int32_to_float32;
	.type ___unsigned_int32_to_float32,STT_FUNC;
	.extern ___float32_div;
	.type ___float32_div,STT_FUNC;
	.extern ___float32_mul;
	.type ___float32_mul,STT_FUNC;
	.extern __sinf;
	.type __sinf,STT_FUNC;
	.extern ___float32_sub;
	.type ___float32_sub,STT_FUNC;
	.extern ___float32_add;
	.type ___float32_add,STT_FUNC;

	.section .debug_abbrev SHT_DEBUGINFO;

	.align 1;
.epcabbrev:
	.type .epcabbrev,STT_OBJECT;
	.inc/binary "..\Debug\four1.sbn", 0, 173;
.epcabbrev.end:

	.section .debug_info SHT_DEBUGINFO;

	.align 1;
.epcdebug:
	.type .epcdebug,STT_OBJECT;
	.byte =
		0xA4,0x05,0x00,0x00,0x02,0x00;
	.byte4 = .epcabbrev;
	.byte =
		0x04,0x01,0x2E,0x2E,0x5C,0x2E,0x2E,0x5C,0x73,0x72,0x63,0x5C,
		0x6E,0x75,0x6D,0x65,0x72,0x69,0x63,0x61,0x6C,0x2D,0x72,0x65,
		0x63,0x69,0x70,0x65,0x73,0x2D,0x69,0x6E,0x2D,0x63,0x5C,0x66,
		0x6F,0x75,0x72,0x31,0x2E,0x63,0x00,0x01;
	.byte4 = .epcline;
	.inc/binary "..\Debug\four1.sbn", 173, 1363;
	.byte4 = .LN_four1;
	.byte4 = .LN._four1.end;
	.byte =
		0x01,0x01,0x00,0x0E,0x00,0x00,0x00,0x00;
	.byte4 = .LN0;
	.byte4 = .LN._four1.end;
	.byte =
		0x00,0x00,0x00;
.epcdebug.end:

	.section .debug_line SHT_DEBUGINFO;

	.align 1;
.epcline:
	.type .epcline,STT_OBJECT;
	.inc/binary "..\Debug\four1.sbn", 1536, 2033;
	.byte4 = .LN_four1;
	.byte =
		0x04,0x01,0x05,0x01,0x0E,0x00,0x05,0x02;
	.byte4 = .LN0;
	.byte =
		0x05,0x02,0x0E,0x00,0x05,0x02;
	.byte4 = .LN1;
	.byte =
		0x05,0x01,0x03,0x7B,0x01,0x00,0x05,0x02;
	.byte4 = .LN2;
	.byte =
		0x05,0x02,0x10,0x00,0x05,0x02;
	.byte4 = .LN3;
	.byte =
		0x03,0x7E,0x01,0x00,0x05,0x02;
	.byte4 = .LN4;
	.byte =
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN5;
	.byte =
		0x05,0x03,0x0A,0x00,0x05,0x02;
	.byte4 = .LN6;
	.byte =
		0x05,0x04,0x0A,0x00,0x05,0x02;
	.byte4 = .LN7;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN8;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN9;
	.byte =
		0x01,0x00,0x05,0x02;
	.byte4 = .LN10;
	.byte =
		0x01,0x00,0x05,0x02;
	.byte4 = .LN11;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN12;
	.byte =
		0x01,0x00,0x05,0x02;
	.byte4 = .LN13;
	.byte =
		0x01,0x00,0x05,0x02;
	.byte4 = .LN14;
	.byte =
		0x05,0x03,0x0C,0x00,0x05,0x02;
	.byte4 = .LN15;
	.byte =
		0x05,0x04,0x0A,0x00,0x05,0x02;
	.byte4 = .LN16;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN17;
	.byte =
		0x05,0x03,0x0B,0x00,0x05,0x02;
	.byte4 = .LN18;
	.byte =
		0x05,0x0F,0x03,0x76,0x01,0x00,0x05,0x02;
	.byte4 = .LN19;
	.byte =
		0x05,0x02,0x01,0x00,0x05,0x02;
	.byte4 = .LN20;
	.byte =
		0x16,0x00,0x05,0x02;
	.byte4 = .LN21;
	.byte =
		0x05,0x03,0x0B,0x00,0x05,0x02;
	.byte4 = .LN22;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN23;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN24;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN25;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN26;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN27;
	.byte =
		0x05,0x0C,0x01,0x00,0x05,0x02;
	.byte4 = .LN28;
	.byte =
		0x05,0x03,0x0A,0x00,0x05,0x02;
	.byte4 = .LN29;
	.byte =
		0x05,0x0A,0x0A,0x00,0x05,0x02;
	.byte4 = .LN30;
	.byte =
		0x05,0x03,0x0C,0x00,0x05,0x02;
	.byte4 = .LN31;
	.byte =
		0x03,0x79,0x01,0x00,0x05,0x02;
	.byte4 = .LN32;
	.byte =
		0x10,0x00,0x05,0x02;
	.byte4 = .LN33;
	.byte =
		0x05,0x04,0x0A,0x00,0x05,0x02;
	.byte4 = .LN34;
	.byte =
		0x05,0x05,0x0B,0x00,0x05,0x02;
	.byte4 = .LN35;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN36;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN37;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN38;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN39;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN40;
	.byte =
		0x05,0x04,0x03,0x79,0x01,0x00,0x05,0x02;
	.byte4 = .LN41;
	.byte =
		0x12,0x00,0x05,0x02;
	.byte4 = .LN42;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN43;
	.byte =
		0x05,0x13,0x03,0x75,0x01,0x00,0x05,0x02;
	.byte4 = .LN44;
	.byte =
		0x05,0x03,0x01,0x00,0x05,0x02;
	.byte4 = .LN45;
	.byte =
		0x05,0x02,0x03,0x78,0x01,0x00,0x05,0x02;
	.byte4 = .LN46;
	.byte =
		0x05,0x01,0x20,0x00,0x05,0x02;
	.byte4 = .LN._four1.end;
	.byte =
		0x00,0x01,0x01;
.epcline.end:

	.section .annotations SHT_DEBUGINFO;

	.align 1;
.epcannot:
	.type .epcannot,STT_OBJECT;
	.inc/binary "..\Debug\four1.sbn", 3569, 4864;
.epcannot.end:

	.section .debug_pubnames SHT_DEBUGINFO;

	.align 1;
.epcpubnames:
	.type .epcpubnames,STT_OBJECT;
	.byte =
		0x18,0x00,0x00,0x00,0x02,0x00;
	.byte4 = .epcdebug;
	.byte =
		0xA8,0x05,0x00,0x00,0x81,0x05,0x00,0x00,0x66,0x6F,0x75,0x72,
		0x31,0x00,0x00,0x00,0x00,0x00;
.epcpubnames.end:

	.section .debug_aranges SHT_DEBUGINFO;

	.align 1;
.epcaranges:
	.type .epcaranges,STT_OBJECT;
	.byte =
		0x1C,0x00,0x00,0x00,0x02,0x00;
	.byte4 = .epcdebug;
	.byte =
		0x04,0x00,0x00,0x00,0x00,0x00;
	.byte4 = .LN_four1;
	.byte4 = .LN._four1.end-.LN_four1;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00;
.epcaranges.end:
