	.file "..\..\src\numerical-recipes-in-c\realft.c";
//  Compilation time: Wed Jan 20 22:50:36 2010

//  Compiler options: -c -file-attr ProjectName=CoreA -O -Ov100 -g -save-temps -path-output ..\Debug -structs-do-not-overlap -no-multiline -double-size-32 -decls-strong -warn-protos -proc ADSP-BF561 -o ..\Debug\realft.doj -MM
//  Architecture: ADSP-BF561
//  Silicon revision: 0.5
//  Anomalies summary:
//   Disabled: w05_00_0046,w05_00_0048,w05_00_0054,w05_00_0071,w05_00_0103,w05_00_0104,w05_00_0157,w05_00_0164,w05_00_0165,w05_00_0195,w05_00_0198,w05_00_0202,w05_00_0209,w05_00_0227,w05_00_0244,w05_00_0245,w05_00_0246,w05_00_0248,w05_00_0257,w05_00_0262,w05_00_0264,w05_00_0283,wF3_F_021,wF3_F_008_F3_F_013,w05_00_0311
//   Enabled: w05_00_0120,w05_00_0127,w05_00_0189,w05_00_0312
//   Always on: w05_00_0074,w05_00_0122

	.section/DOUBLE32 program;

.epctext:
	.align 4;
_realft:
.LN_realft:
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 44 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P1,I0,M0,ASTAT0-ASTAT1,CC,LC0,LT0,LB0}
//   Call preserved registers used:{R4.L,R4.H,R5.L,R5.H,R6.L,R6.H,R7.L,R7.H,P3-P5,FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,I0-I3,B0-B3,M0-M3,A0.W,A0.X,A1.W,A1.X,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
// line "..\..\src\numerical-recipes-in-c\realft.c":5
	LINK 44;
	.align 2
	[--SP] = (R7:4, P5:3);
.LN0:
// line 11
	R5 = R1;
.LN1:
// line 5
	SP += -12;
.LN2:
// line 11
	R1 = R5 >> 1 || [FP + 16] = R0;
	R7 = ROT R0 BY 0 || [FP + 12] = R1;
	[FP + 8] = R2;
	P3 = R7;
	// -- stall --
	R0 = [FP + 12];
	CALL.X (___unsigned_int32_to_float32);  // instruction is implemented as a library call. 
	R1 = R0;
	R0 = 4059 /* 1078530011 */;
	R0.H = 16457 /* 1078530011 */;
	CALL.X (___float32_div);                // float division is implemented as a library call. There is one more instruction related to this call. 
	R6 = ROT R0 BY 0 || R0 = [FP + 8];
.LN3:
// line 12
	CC = R0 == 1;
	if CC jump .P34L1 ;

.P34L2:
	R0 = 0 /* 1056964608 */;
	R0.H = 16128 /* 1056964608 */;
	[FP + -4] = R0;
.LN4:
// line 17
	BITTGL(R6, 31);

.P34L3:
.LN5:
// line 19
	R0 = 0 /* 1056964608 */;
	R0.H = 16128 /* 1056964608 */;
	R1 = ROT R6 BY 0 || [FP + -8] = R0;
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. There is one more instruction related to this call. 
.LN6:
	CALL.X (__sinf);
.LN7:
// line 20
	R1 = -1;
	R1 <<= 30;
	R4 = R0;
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	R1 = R4;
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	[FP + -12] = R0;
	R0 = ROT R6 BY 0 || [FP + -16] = R0;
.LN8:
// line 21
	CALL.X (__sinf);
	R6 = ROT R0 BY 0 || [FP + -20] = R0;
.LN9:
// line 22
	R1 = 0 /* 1065353216 */;
	R1.H = 16256 /* 1065353216 */;
	R0 = [FP + -12];
	CALL.X (___float32_add);                // float addition is implemented as a library call. There is one more instruction related to this call. 
.LN10:
// line 25
	R2 = R5 >> 2;
	CC = R2 < 2 (IU);
	if CC jump .P34L6 ;

.P34L12:
	R1 = R7;
	R3 = R5 << 2;
	R1 += -4;
	R1 = R1 + R3;
	P1 = R1;
	R2 += -1;
	P0 = R2;
	R7 += 12;
	P4 = R7;
	R7 = ROT R0 BY 0 || R0 = [FP + -4];
	P5 = P1;
.LN11:
// line 29
	BITTGL(R0, 31);
	[SP + 60] = R0;
	I0 = P1;
	P5 += 4;
	M0 = -8;
.LN12:
// line 25
	LOOP .P34L5L LC0 = P0;

.P34L5:
//-------------------------------------------------------------------
//   Loop at "..\..\src\numerical-recipes-in-c\realft.c" line 25 col 2
//-------------------------------------------------------------------
//   This loop executes 1 iteration of the original loop in estimated 89 cycles.
//   (cycle count 89 excludes the cost of the inner function calls)
//-------------------------------------------------------------------
//   This loop's resource usage is:
//     Group 1             used  89 out of   89 (100.0%)
//     16-bit Instruction  used 142 out of  178 ( 79.8%)
//     32-bit Instruction  used  66 out of   89 ( 74.2%)
//     Store               used  13 out of   89 ( 14.6%)
//-------------------------------------------------------------------
	LOOP_BEGIN .P34L5L;
	R5 = [P5--] || R0 = [I0 ++ M0];
	[FP + -12] = R0;
.LN13:
// line 27
	R0 = [P4++];
	[SP + 56] = R0;
.LN14:
// line 28
	R4 = [P4--];
.LN15:
// line 27
	R1 = [FP + -12];
	CALL.X (___float32_add);                // float addition is implemented as a library call. 
	R1 = [FP + -8];
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	R1 = ROT R5 BY 0 || [SP + 52] = R0;
.LN16:
// line 28
	R0 = R4;
	CALL.X (___float32_sub);                // float  is implemented as a library call. 
	R1 = [FP + -8];
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	R2 = ROT R0 BY 0 || [SP + 44] = R0;
.LN17:
// line 34
	BITTGL(R2, 31);
.LN18:
// line 29
	R1 = ROT R5 BY 0 || [SP + 48] = R2;
	R0 = R4;
	CALL.X (___float32_add);                // float addition is implemented as a library call. 
	R1 = [SP + 60];
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	[SP + 40] = R0;
.LN19:
// line 30
	R1 = [FP + -12];
	R0 = [SP + 56];
	CALL.X (___float32_sub);                // float  is implemented as a library call. 
	R1 = [FP + -4];
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	R5 = ROT R0 BY 0 || R0 = [SP + 40];
.LN20:
// line 31
	R1 = R7;
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	R1 = [SP + 52];
	[FP + -12] = R0;
	CALL.X (___float32_add);                // float addition is implemented as a library call. 
	R4 = R0;
	R1 = R5;
	R0 = R6;
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	R0 = ROT R4 BY 0 || [SP + 56] = R0;
	R1 = [SP + 56];
	CALL.X (___float32_sub);                // float  is implemented as a library call. 
	R1 = ROT R5 BY 0 || [P4++] = R0;
.LN21:
// line 32
	R0 = R7;
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	R5 = ROT R0 BY 0 || R0 = [SP + 44];
	R1 = R5;
	CALL.X (___float32_add);                // float addition is implemented as a library call. 
	R0 = ROT R6 BY 0 || [SP + 44] = R0;
	R1 = [SP + 40];
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	R4 = R0;
	R1 = ROT R4 BY 0 || R0 = [SP + 44];
	CALL.X (___float32_add);                // float addition is implemented as a library call. 
	[P4++] = R0;
.LN22:
// line 33
	R1 = [FP + -12];
	R0 = [SP + 52];
	CALL.X (___float32_sub);                // float  is implemented as a library call. 
	R1 = [SP + 56];
	CALL.X (___float32_add);                // float addition is implemented as a library call. 
	R0 = ROT R5 BY 0 || [P5--] = R0;
.LN23:
// line 34
	R1 = [SP + 48];
	CALL.X (___float32_add);                // float addition is implemented as a library call. 
	R1 = R4;
	CALL.X (___float32_add);                // float addition is implemented as a library call. 
	R0 = ROT R7 BY 0 || [P5 + 8] = R0;
.LN24:
// line 35
	R1 = [FP + -16];
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	R5 = ROT R0 BY 0 || R1 = [FP + -20];
	R0 = R6;
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	R4 = R0;
	R1 = R5;
	R0 = R7;
	CALL.X (___float32_add);                // float addition is implemented as a library call. 
	R1 = R4;
	CALL.X (___float32_sub);                // float  is implemented as a library call. 
	R4 = ROT R0 BY 0 || R1 = [FP + -16];
.LN25:
// line 36
	R0 = R6;
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	R5 = ROT R0 BY 0 || R0 = [FP + -20];
	R1 = R7;
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	R7 = R4;
	R4 = R0;
	R0 = R6;
	R1 = R5;
	CALL.X (___float32_add);                // float addition is implemented as a library call. 
	R1 = R4;
	CALL.X (___float32_add);                // float addition is implemented as a library call. 
	R6 = R0;
.LN26:
// line 25
	LOOP_END .P34L5L;

.P34L13:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------

.P34L6:
.LN27:
// line 39
	R7 = [P3 + 4];
	R0 = ROT R7 BY 0 || R6 = [P3 + 8];
	R1 = R6;
	CALL.X (___float32_add);                // float addition is implemented as a library call. 
.LN28:
// line 40
	R1 = R6;
	R6 = R0;
	R0 = R7;
	CALL.X (___float32_sub);                // float  is implemented as a library call. 
.LN29:
// line 38
	R7 = ROT R0 BY 0 || R1 = [FP + 8];
	CC = R1 == 1;
	if !CC jump .P34L8 ;

.P34L7:
.LN30:
// line 39
	[P3 + 4] = R6;
.LN31:
// line 40
	[P3 + 8] = R0;

.P34L9:
.LN32:
// line 46
	SP += 12;
	P0 = [FP + 4];
	(R7:4, P5:3) = [SP++];
	UNLINK;
	// -- stall --
	JUMP (P0);

	.align 8
.P34L8:
.LN33:
// line 42
	R1 = ROT R6 BY 0 || R0 = [FP + -8];
	.align 2
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	R0 = ROT R7 BY 0 || [P3 + 4] = R0;
.LN34:
// line 43
	R1 = [FP + -8];
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	[P3 + 8] = R0;
.LN35:
// line 44
	R1 = [FP + 12];
	R2 = -1;
	R0 = [FP + 16];
	CALL.X (_four1);
	jump .P34L9;

	.align 8
.P34L1:
.LN36:
// line 14
	R0 = ROT R7 BY 0 || R1 = [FP + 12];
	.align 2
	R2 = 1;
	CALL.X (_four1);
	R0 = 0 /* -1090519040 */;
	R0.H = -16640 /* -1090519040 */;
	[FP + -4] = R0;
	jump .P34L3;
.LN._realft.end:
._realft.end:
	.global _realft;
	.type _realft,STT_FUNC;

	.file_attr ProjectName="CoreA";
	.file_attr FuncName="_realft";
	.file_attr Content="Code";
.epctext.end:

	.extern ___unsigned_int32_to_float32;
	.type ___unsigned_int32_to_float32,STT_FUNC;
	.extern ___float32_div;
	.type ___float32_div,STT_FUNC;
	.extern ___float32_mul;
	.type ___float32_mul,STT_FUNC;
	.extern __sinf;
	.type __sinf,STT_FUNC;
	.extern ___float32_add;
	.type ___float32_add,STT_FUNC;
	.extern ___float32_sub;
	.type ___float32_sub,STT_FUNC;
	.extern _four1;
	.type _four1,STT_FUNC;

	.section .debug_abbrev SHT_DEBUGINFO;

	.align 1;
.epcabbrev:
	.type .epcabbrev,STT_OBJECT;
	.inc/binary "..\Debug\realft.sbn", 0, 173;
.epcabbrev.end:

	.section .debug_info SHT_DEBUGINFO;

	.align 1;
.epcdebug:
	.type .epcdebug,STT_OBJECT;
	.byte =
		0xA6,0x05,0x00,0x00,0x02,0x00;
	.byte4 = .epcabbrev;
	.byte =
		0x04,0x01,0x2E,0x2E,0x5C,0x2E,0x2E,0x5C,0x73,0x72,0x63,0x5C,
		0x6E,0x75,0x6D,0x65,0x72,0x69,0x63,0x61,0x6C,0x2D,0x72,0x65,
		0x63,0x69,0x70,0x65,0x73,0x2D,0x69,0x6E,0x2D,0x63,0x5C,0x72,
		0x65,0x61,0x6C,0x66,0x74,0x2E,0x63,0x00,0x01;
	.byte4 = .epcline;
	.inc/binary "..\Debug\realft.sbn", 173, 1364;
	.byte4 = .LN_realft;
	.byte4 = .LN._realft.end;
	.byte =
		0x01,0x01,0x00,0x0E,0x00,0x00,0x00,0x00;
	.byte4 = .LN0;
	.byte4 = .LN._realft.end;
	.byte =
		0x00,0x00,0x00;
.epcdebug.end:

	.section .debug_line SHT_DEBUGINFO;

	.align 1;
.epcline:
	.type .epcline,STT_OBJECT;
	.inc/binary "..\Debug\realft.sbn", 1537, 2034;
	.byte4 = .LN_realft;
	.byte =
		0x04,0x01,0x05,0x01,0x0D,0x00,0x05,0x02;
	.byte4 = .LN0;
	.byte =
		0x05,0x02,0x0F,0x00,0x05,0x02;
	.byte4 = .LN1;
	.byte =
		0x05,0x01,0x03,0x7A,0x01,0x00,0x05,0x02;
	.byte4 = .LN2;
	.byte =
		0x05,0x02,0x0F,0x00,0x05,0x02;
	.byte4 = .LN3;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN4;
	.byte =
		0x05,0x03,0x0E,0x00,0x05,0x02;
	.byte4 = .LN5;
	.byte =
		0x05,0x02,0x0B,0x00,0x05,0x02;
	.byte4 = .LN6;
	.byte =
		0x05,0x0B,0x01,0x00,0x05,0x02;
	.byte4 = .LN7;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN8;
	.byte =
		0x05,0x09,0x0A,0x00,0x05,0x02;
	.byte4 = .LN9;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN10;
	.byte =
		0x0C,0x00,0x05,0x02;
	.byte4 = .LN11;
	.byte =
		0x05,0x03,0x0D,0x00,0x05,0x02;
	.byte4 = .LN12;
	.byte =
		0x05,0x02,0x03,0x7C,0x01,0x00,0x05,0x02;
	.byte4 = .LN13;
	.byte =
		0x05,0x03,0x0B,0x00,0x05,0x02;
	.byte4 = .LN14;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN15;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN16;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN17;
	.byte =
		0x0F,0x00,0x05,0x02;
	.byte4 = .LN18;
	.byte =
		0x03,0x7B,0x01,0x00,0x05,0x02;
	.byte4 = .LN19;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN20;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN21;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN22;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN23;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN24;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN25;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN26;
	.byte =
		0x05,0x02,0x03,0x75,0x01,0x00,0x05,0x02;
	.byte4 = .LN27;
	.byte =
		0x05,0x03,0x17,0x00,0x05,0x02;
	.byte4 = .LN28;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN29;
	.byte =
		0x05,0x02,0x03,0x7E,0x01,0x00,0x05,0x02;
	.byte4 = .LN30;
	.byte =
		0x05,0x03,0x0A,0x00,0x05,0x02;
	.byte4 = .LN31;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN32;
	.byte =
		0x05,0x01,0x0F,0x00,0x05,0x02;
	.byte4 = .LN33;
	.byte =
		0x05,0x03,0x03,0x7C,0x01,0x00,0x05,0x02;
	.byte4 = .LN34;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN35;
	.byte =
		0x05,0x08,0x0A,0x00,0x05,0x02;
	.byte4 = .LN36;
	.byte =
		0x03,0x62,0x01,0x00,0x05,0x02;
	.byte4 = .LN._realft.end;
	.byte =
		0x00,0x01,0x01;
.epcline.end:

	.section .annotations SHT_DEBUGINFO;

	.align 1;
.epcannot:
	.type .epcannot,STT_OBJECT;
	.inc/binary "..\Debug\realft.sbn", 3571, 4984;
.epcannot.end:

	.section .debug_pubnames SHT_DEBUGINFO;

	.align 1;
.epcpubnames:
	.type .epcpubnames,STT_OBJECT;
	.byte =
		0x19,0x00,0x00,0x00,0x02,0x00;
	.byte4 = .epcdebug;
	.byte =
		0xAA,0x05,0x00,0x00,0x82,0x05,0x00,0x00,0x72,0x65,0x61,0x6C,
		0x66,0x74,0x00,0x00,0x00,0x00,0x00;
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
	.byte4 = .LN_realft;
	.byte4 = .LN._realft.end-.LN_realft;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00;
.epcaranges.end:
