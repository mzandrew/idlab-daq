	.file "..\..\src\numerical-recipes-in-c\xfit.c";
//  Compilation time: Wed Jan 20 22:50:36 2010

//  Compiler options: -c -file-attr ProjectName=CoreA -O -Ov100 -g -save-temps -path-output ..\Debug -structs-do-not-overlap -no-multiline -double-size-32 -decls-strong -warn-protos -proc ADSP-BF561 -o ..\Debug\xfit.doj -MM
//  Architecture: ADSP-BF561
//  Silicon revision: 0.5
//  Anomalies summary:
//   Disabled: w05_00_0046,w05_00_0048,w05_00_0054,w05_00_0071,w05_00_0103,w05_00_0104,w05_00_0157,w05_00_0164,w05_00_0165,w05_00_0195,w05_00_0198,w05_00_0202,w05_00_0209,w05_00_0227,w05_00_0244,w05_00_0245,w05_00_0246,w05_00_0248,w05_00_0257,w05_00_0262,w05_00_0264,w05_00_0283,wF3_F_021,wF3_F_008_F3_F_013,w05_00_0311
//   Enabled: w05_00_0120,w05_00_0127,w05_00_0189,w05_00_0312
//   Always on: w05_00_0074,w05_00_0122

	.section/DOUBLE32 program;

.epctext:
	.align 4;
_init_fit:
.LN_init_fit:
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,P0-P1,ASTAT0-ASTAT1,CC,LC0,LT0,LB0}
//   Call preserved registers used:{R4.L,R4.H,R5.L,R5.H,R6.L,R6.H,R7.L,R7.H,P3-P5,FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,I0-I3,B0-B3,M0-M3,A0.W,A0.X,A1.W,A1.X,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
// line "..\..\src\numerical-recipes-in-c\xfit.c":22
	LINK 0;
	.align 2
	[--SP] = (R7:4, P5:3);
	R6 = R0;
.LN0:
// line 24
	R6 += -1;
	R7 = R0;
.LN1:
// line 22
	SP += -12;
.LN2:
// line 24
	R1 = R6;
	R0 = 0;
	CALL.X (_lvector);
	P1.L = _y_fixed;
	P1.H = _y_fixed;
.LN3:
	R1 = ROT R6 BY 0 || [P1] = R0;
.LN4:
// line 25
	R0 = 0;
	CALL.X (_lvector);
	P5.L = _x_fixed;
	P5.H = _x_fixed;
.LN5:
	R1 = ROT R6 BY 0 || [P5] = R0;
.LN6:
// line 26
	R0 = 0;
	CALL.X (_vector);
	P1.L = _y_floating;
	P1.H = _y_floating;
.LN7:
	R1 = ROT R6 BY 0 || [P1] = R0;
.LN8:
// line 27
	R0 = 0;
	CALL.X (_vector);
	P1.L = _x_floating;
	P1.H = _x_floating;
.LN9:
// line 28
	CC = R7 <= 0;
.LN10:
// line 27
	R4 = R4 - R4 (NS) || [P1] = R0;
	[SP + 52] = P1;
.LN11:
// line 28
	if CC jump .P38L3 ;

.P38L6:
	R5 = 250;
	R6 = 0;
	P1 = R7;
	P4 = 0;
.LN12:
// line 30
	R7 = 0 /* 1132068864 */;
	R7.H = 17274 /* 1132068864 */;
.LN13:
// line 28
	LOOP .P38L2L LC0 = P1;

.P38L2:
//-------------------------------------------------------------------
//   Loop at "..\..\src\numerical-recipes-in-c\xfit.c" line 28 col 2
//-------------------------------------------------------------------
//   This loop executes 1 iteration of the original loop in estimated 17 cycles.
//   (cycle count 17 excludes the cost of the inner function calls and it includes 5 stalls)
//-------------------------------------------------------------------
//   This loop's resource usage is:
//     Group 1             used  12 out of   17 ( 70.6%)
//     16-bit Instruction  used  19 out of   34 ( 55.9%)
//     32-bit Instruction  used   9 out of   17 ( 52.9%)
//     Store               used   2 out of   17 ( 11.8%)
//-------------------------------------------------------------------
// This loop was not modulo scheduled because it contains calls or volatile operations.
//-------------------------------------------------------------------
	LOOP_BEGIN .P38L2L;
.LN14:
// line 29
	R0 = ROT R4 BY 0 || P3 = [P5];
.LN15:
// line 30
	CALL.X (___unsigned_int32_to_float32);  // instruction is implemented as a library call. 
	R1 = R7;
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
.LN16:
// line 29
	P1 = P3 + P4;
	R6 = R6 + R5 (NS) || [P1] = R6;
.LN17:
// line 30
	P1 = [SP + 52];
	R4 += 1;
	// -- 2 stalls --
	P1 = [P1];
	// -- 3 stalls --
	P1 = P1 + P4;
	[P1] = R0;
	P4 += 4;
.LN18:
// line 28
	LOOP_END .P38L2L;

.P38L7:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------

.P38L3:
.LN19:
// line 33
	SP += 12;
	P0 = [FP + 4];
	(R7:4, P5:3) = [SP++];
	UNLINK;
	// -- stall --
	JUMP (P0);
.LN._init_fit.end:
._init_fit.end:
	.global _init_fit;
	.type _init_fit,STT_FUNC;

	.align 4;
_fit_me:
.LN_fit_me:
	.reference _chi2;
	.reference _sigb;
	.reference _siga;
	.reference _b_floating;
	.reference _a_floating;
	.reference _qq;
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,P0-P2,ASTAT0-ASTAT1,CC,LC0,LT0,LB0}
//   Call preserved registers used:{R4.L,R4.H,R5.L,R5.H,R6.L,R6.H,R7.L,R7.H,P4-P5,FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,I0-I3,B0-B3,M0-M3,A0.W,A0.X,A1.W,A1.X,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
// line "..\..\src\numerical-recipes-in-c\xfit.c":36
	LINK 0;
	.align 2
	[--SP] = (R7:4, P5:4);
	R6 = R0;
.LN20:
// line 41
	R6 += -1;
	R7 = R0;
	R4 = R1;
.LN21:
// line 36
	SP += -44;
.LN22:
// line 41
	R1 = R6;
	R0 = 0;
	CALL.X (_vector);
.LN23:
// line 42
	CC = R7 <= 0;
	P0 = R0;
	R5 = R0;
	if CC jump .P43L3 ;

.P43L12:
	P1 = R7;
.LN24:
// line 47
	R1 = 0 /* 1056964608 */;
	R1.H = 16128 /* 1056964608 */;
	// -- 3 stalls --
.LN25:
// line 42
	LOOP .P43L2L LC0 = P1;

.P43L2:
//-------------------------------------------------------------------
//   Loop at "..\..\src\numerical-recipes-in-c\xfit.c" line 42 col 2
//-------------------------------------------------------------------
//   This loop executes 1 iteration of the original loop in estimated 1 cycle.
//-------------------------------------------------------------------
//   This loop's resource usage is:
//     Group 1             used   1 out of    1 (100.0%)
//     Store               used   1 out of    1 (100.0%)
//     16-bit Instruction  used   1 out of    2 ( 50.0%)
//-------------------------------------------------------------------
	LOOP_BEGIN .P43L2L;
.LN26:
// line 47
	[P0++] = R1;
.LN27:
// line 42
	LOOP_END .P43L2L;

.P43L13:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------

.P43L3:
.LN28:
// line 54
	CC = R4 == 0;
	P0.L = .epcbss+20;
	P0.H = .epcbss+20;
	P1 = P0;
	P1 += -16;
	P2 = P0;
	P2 += -20;
	P5.L = _y_floating;
	P5.H = _y_floating;
	P4.L = _x_floating;
	P4.H = _x_floating;
	if CC jump .P43L4 ;

.P43L5:
.LN29:
// line 56
	CC = R4 == 1;
	if CC jump .P43L7 ;

.P43L8:
.LN30:
// line 59
	R0 = R7;
	CALL.X (_fixed_point_fit_data_to_straight_line);

.P43L6:
.LN31:
// line 75
	R2 = R6;
	R0 = R5;
	R1 = 0;
	CALL.X (_free_vector);
.LN32:
// line 78
	SP += 44;
	P0 = [FP + 4];
	(R7:4, P5:4) = [SP++];
	UNLINK;
	// -- stall --
	JUMP (P0);

.P43L7:
.LN33:
// line 57
	[SP + 24] = P1;
	[SP + 20] = P2;
	R2 = ROT R7 BY 0 || [SP + 12] = R0;
.LN34:
	R0 = [P4];
	R1 = [P5];
.LN35:
	P1 = 0;
	[SP + 16] = P1;
	CALL.X (_fit_without_statistics);
	jump .P43L6;

.P43L4:
.LN36:
// line 55
	[SP + 24] = P1;
	[SP + 20] = P2;
	R2 = ROT R7 BY 0 || [SP + 12] = R0;
	[SP + 40] = P0;
.LN37:
	R0 = [P4];
	R1 = [P5];
	P1 = P0;
	P1 += -4;
.LN38:
	[SP + 36] = P1;
	P1 = P0;
	P1 += -8;
	[SP + 32] = P1;
	P0 += -12;
	[SP + 28] = P0;
	P1 = 0;
	[SP + 16] = P1;
	CALL.X (_original_fit);
	jump .P43L6;
.LN._fit_me.end:
._fit_me.end:
	.global _fit_me;
	.type _fit_me,STT_FUNC;

	.file_attr ProjectName="CoreA";
	.file_attr FuncName="_init_fit";
	.file_attr FuncName="_fit_me";
	.file_attr Content="CodeData";
.epctext.end:

	.extern _lvector;
	.type _lvector,STT_FUNC;
	.extern _vector;
	.type _vector,STT_FUNC;
	.extern ___unsigned_int32_to_float32;
	.type ___unsigned_int32_to_float32,STT_FUNC;
	.extern ___float32_mul;
	.type ___float32_mul,STT_FUNC;
	.extern _fixed_point_fit_data_to_straight_line;
	.type _fixed_point_fit_data_to_straight_line,STT_FUNC;
	.extern _free_vector;
	.type _free_vector,STT_FUNC;
	.extern _fit_without_statistics;
	.type _fit_without_statistics,STT_FUNC;
	.extern _original_fit;
	.type _original_fit,STT_FUNC;

	.section/ZERO_INIT/DOUBLE32 bsz;

	.align 4;
.epcbss:
	.type .epcbss,STT_OBJECT;
	.byte _a_floating[4];
	.global _a_floating;
	.type _a_floating,STT_OBJECT;
	.byte _b_floating[4];
	.global _b_floating;
	.type _b_floating,STT_OBJECT;
	.byte _siga[4];
	.global _siga;
	.type _siga,STT_OBJECT;
	.byte _sigb[4];
	.global _sigb;
	.type _sigb,STT_OBJECT;
	.byte _chi2[4];
	.global _chi2;
	.type _chi2,STT_OBJECT;
	.byte _qq[4];
	.global _qq;
	.type _qq,STT_OBJECT;
.epcbss.end:

	.section .debug_abbrev SHT_DEBUGINFO;

	.align 1;
.epcabbrev:
	.type .epcabbrev,STT_OBJECT;
	.inc/binary "..\Debug\xfit.sbn", 0, 161;
.epcabbrev.end:

	.section .debug_info SHT_DEBUGINFO;

	.align 1;
.epcdebug:
	.type .epcdebug,STT_OBJECT;
	.byte =
		0x8B,0x0B,0x00,0x00,0x02,0x00;
	.byte4 = .epcabbrev;
	.byte =
		0x04,0x01,0x2E,0x2E,0x5C,0x2E,0x2E,0x5C,0x73,0x72,0x63,0x5C,
		0x6E,0x75,0x6D,0x65,0x72,0x69,0x63,0x61,0x6C,0x2D,0x72,0x65,
		0x63,0x69,0x70,0x65,0x73,0x2D,0x69,0x6E,0x2D,0x63,0x5C,0x78,
		0x66,0x69,0x74,0x2E,0x63,0x00,0x01;
	.byte4 = .epcline;
	.inc/binary "..\Debug\xfit.sbn", 161, 2223;
	.byte4 = .LN_init_fit;
	.byte4 = .LN._init_fit.end;
	.byte =
		0x01,0x01,0x00,0x0A,0x00,0x00,0x00,0x00;
	.byte4 = .LN0;
	.byte4 = .LN._init_fit.end;
	.byte =
		0x00,0x00,0x09,0x29,0x09,0x00,0x00,0x66,0x69,0x74,0x5F,0x6D,
		0x65,0x00,0x01;
	.byte4 = .LN_fit_me;
	.byte4 = .LN._fit_me.end;
	.byte =
		0x01,0x01,0x00,0x0A,0x00,0x00,0x00,0x00;
	.byte4 = .LN20;
	.byte4 = .LN._fit_me.end;
	.inc/binary "..\Debug\xfit.sbn", 2384, 371;
	.byte4 = _x_fixed;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x0C,0x79,0x5F,0x66,0x69,0x78,0x65,
		0x64,0x00,0x01,0x88,0x0B,0x00,0x00,0x05,0x0C;
	.byte4 = _y_fixed;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x0C,0x78,0x5F,0x66,0x6C,0x6F,0x61,
		0x74,0x69,0x6E,0x67,0x00,0x01,0x82,0x0B,0x00,0x00,0x05,0x0C;
	.byte4 = _x_floating;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x0C,0x79,0x5F,0x66,0x6C,0x6F,0x61,
		0x74,0x69,0x6E,0x67,0x00,0x01,0x82,0x0B,0x00,0x00,0x05,0x0C;
	.byte4 = _y_floating;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x0C,0x61,0x5F,0x66,0x6C,0x6F,0x61,
		0x74,0x69,0x6E,0x67,0x00,0x01,0x4E,0x02,0x00,0x00,0x05,0x0C;
	.byte4 = _a_floating;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x0C,0x62,0x5F,0x66,0x6C,0x6F,0x61,
		0x74,0x69,0x6E,0x67,0x00,0x01,0x4E,0x02,0x00,0x00,0x05,0x0C;
	.byte4 = _b_floating;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x0C,0x73,0x69,0x67,0x61,0x00,0x01,
		0x4E,0x02,0x00,0x00,0x05,0x0C;
	.byte4 = _siga;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x0C,0x73,0x69,0x67,0x62,0x00,0x01,
		0x4E,0x02,0x00,0x00,0x05,0x0C;
	.byte4 = _sigb;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x0C,0x63,0x68,0x69,0x32,0x00,0x01,
		0x4E,0x02,0x00,0x00,0x05,0x0C;
	.byte4 = _chi2;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x0C,0x71,0x71,0x00,0x01,0x4E,0x02,
		0x00,0x00,0x05,0x0C;
	.byte4 = _qq;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x06,0x00,0x4E,0x02,0x00,0x00,0x06,
		0x00,0x6B,0x06,0x00,0x00,0x00;
.epcdebug.end:

	.section .debug_line SHT_DEBUGINFO;

	.align 1;
.epcline:
	.type .epcline,STT_OBJECT;
	.inc/binary "..\Debug\xfit.sbn", 2755, 1055;
	.byte4 = .LN_init_fit;
	.byte =
		0x04,0x01,0x05,0x34,0x1E,0x00,0x05,0x02;
	.byte4 = .LN0;
	.byte =
		0x05,0x02,0x0B,0x00,0x05,0x02;
	.byte4 = .LN1;
	.byte =
		0x05,0x34,0x03,0x7E,0x01,0x00,0x05,0x02;
	.byte4 = .LN2;
	.byte =
		0x05,0x13,0x0B,0x00,0x05,0x02;
	.byte4 = .LN3;
	.byte =
		0x05,0x02,0x01,0x00,0x05,0x02;
	.byte4 = .LN4;
	.byte =
		0x05,0x13,0x0A,0x00,0x05,0x02;
	.byte4 = .LN5;
	.byte =
		0x05,0x02,0x01,0x00,0x05,0x02;
	.byte4 = .LN6;
	.byte =
		0x05,0x15,0x0A,0x00,0x05,0x02;
	.byte4 = .LN7;
	.byte =
		0x05,0x02,0x01,0x00,0x05,0x02;
	.byte4 = .LN8;
	.byte =
		0x05,0x15,0x0A,0x00,0x05,0x02;
	.byte4 = .LN9;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN10;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN11;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN12;
	.byte =
		0x05,0x03,0x0B,0x00,0x05,0x02;
	.byte4 = .LN13;
	.byte =
		0x05,0x02,0x03,0x7E,0x01,0x00,0x05,0x02;
	.byte4 = .LN14;
	.byte =
		0x05,0x03,0x0A,0x00,0x05,0x02;
	.byte4 = .LN15;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN16;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN17;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN18;
	.byte =
		0x05,0x02,0x03,0x7E,0x01,0x00,0x05,0x02;
	.byte4 = .LN19;
	.byte =
		0x05,0x01,0x0E,0x00,0x05,0x02;
	.byte4 = .LN._init_fit.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_fit_me;
	.byte =
		0x04,0x01,0x05,0x01,0x2C,0x00,0x05,0x02;
	.byte4 = .LN20;
	.byte =
		0x05,0x02,0x0E,0x00,0x05,0x02;
	.byte4 = .LN21;
	.byte =
		0x05,0x01,0x03,0x7B,0x01,0x00,0x05,0x02;
	.byte4 = .LN22;
	.byte =
		0x05,0x0C,0x0E,0x00,0x05,0x02;
	.byte4 = .LN23;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN24;
	.byte =
		0x05,0x03,0x0E,0x00,0x05,0x02;
	.byte4 = .LN25;
	.byte =
		0x05,0x02,0x03,0x7B,0x01,0x00,0x05,0x02;
	.byte4 = .LN26;
	.byte =
		0x05,0x03,0x0E,0x00,0x05,0x02;
	.byte4 = .LN27;
	.byte =
		0x05,0x02,0x03,0x7B,0x01,0x00,0x05,0x02;
	.byte4 = .LN28;
	.byte =
		0x15,0x00,0x05,0x02;
	.byte4 = .LN29;
	.byte =
		0x05,0x09,0x0B,0x00,0x05,0x02;
	.byte4 = .LN30;
	.byte =
		0x05,0x28,0x0C,0x00,0x05,0x02;
	.byte4 = .LN31;
	.byte =
		0x05,0x0D,0x19,0x00,0x05,0x02;
	.byte4 = .LN32;
	.byte =
		0x05,0x01,0x0C,0x00,0x05,0x02;
	.byte4 = .LN33;
	.byte =
		0x05,0x19,0x03,0x6B,0x01,0x00,0x05,0x02;
	.byte4 = .LN34;
	.byte =
		0x05,0x03,0x01,0x00,0x05,0x02;
	.byte4 = .LN35;
	.byte =
		0x05,0x19,0x01,0x00,0x05,0x02;
	.byte4 = .LN36;
	.byte =
		0x05,0x0F,0x03,0x7E,0x01,0x00,0x05,0x02;
	.byte4 = .LN37;
	.byte =
		0x05,0x03,0x01,0x00,0x05,0x02;
	.byte4 = .LN38;
	.byte =
		0x05,0x0F,0x01,0x00,0x05,0x02;
	.byte4 = .LN._fit_me.end;
	.byte =
		0x00,0x01,0x01;
.epcline.end:

	.section .annotations SHT_DEBUGINFO;

	.align 1;
.epcannot:
	.type .epcannot,STT_OBJECT;
	.inc/binary "..\Debug\xfit.sbn", 3810, 2484;
.epcannot.end:

	.section .debug_pubnames SHT_DEBUGINFO;

	.align 1;
.epcpubnames:
	.type .epcpubnames,STT_OBJECT;
	.byte =
		0x66,0x00,0x00,0x00,0x02,0x00;
	.byte4 = .epcdebug;
	.byte =
		0x8F,0x0B,0x00,0x00,0xD9,0x08,0x00,0x00,0x69,0x6E,0x69,0x74,
		0x5F,0x66,0x69,0x74,0x00,0x02,0x09,0x00,0x00,0x66,0x69,0x74,
		0x5F,0x6D,0x65,0x00,0xF4,0x0A,0x00,0x00,0x61,0x5F,0x66,0x6C,
		0x6F,0x61,0x74,0x69,0x6E,0x67,0x00,0x10,0x0B,0x00,0x00,0x62,
		0x5F,0x66,0x6C,0x6F,0x61,0x74,0x69,0x6E,0x67,0x00,0x2C,0x0B,
		0x00,0x00,0x73,0x69,0x67,0x61,0x00,0x42,0x0B,0x00,0x00,0x73,
		0x69,0x67,0x62,0x00,0x58,0x0B,0x00,0x00,0x63,0x68,0x69,0x32,
		0x00,0x6E,0x0B,0x00,0x00,0x71,0x71,0x00,0x00,0x00,0x00,0x00;
.epcpubnames.end:

	.section .debug_aranges SHT_DEBUGINFO;

	.align 1;
.epcaranges:
	.type .epcaranges,STT_OBJECT;
	.byte =
		0x24,0x00,0x00,0x00,0x02,0x00;
	.byte4 = .epcdebug;
	.byte =
		0x04,0x00,0x00,0x00,0x00,0x00;
	.byte4 = .LN_init_fit;
	.byte4 = .LN._init_fit.end-.LN_init_fit;
	.byte4 = .LN_fit_me;
	.byte4 = .LN._fit_me.end-.LN_fit_me;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00;
.epcaranges.end:

	.section/DOUBLE32 data1;


	.extern _x_fixed;
	.type _x_fixed,STT_OBJECT;
	.extern _y_fixed;
	.type _y_fixed,STT_OBJECT;
	.extern _x_floating;
	.type _x_floating,STT_OBJECT;
	.extern _y_floating;
	.type _y_floating,STT_OBJECT;
