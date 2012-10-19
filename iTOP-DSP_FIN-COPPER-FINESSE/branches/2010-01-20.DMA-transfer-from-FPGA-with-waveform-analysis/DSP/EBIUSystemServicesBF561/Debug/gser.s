	.file "..\..\src\numerical-recipes-in-c\gser.c";
//  Compilation time: Wed Jan 20 22:50:34 2010

//  Compiler options: -c -file-attr ProjectName=CoreA -O -Ov100 -g -save-temps -path-output ..\Debug -structs-do-not-overlap -no-multiline -double-size-32 -decls-strong -warn-protos -proc ADSP-BF561 -o ..\Debug\gser.doj -MM
//  Architecture: ADSP-BF561
//  Silicon revision: 0.5
//  Anomalies summary:
//   Disabled: w05_00_0046,w05_00_0048,w05_00_0054,w05_00_0071,w05_00_0103,w05_00_0104,w05_00_0157,w05_00_0164,w05_00_0165,w05_00_0195,w05_00_0198,w05_00_0202,w05_00_0209,w05_00_0227,w05_00_0244,w05_00_0245,w05_00_0246,w05_00_0248,w05_00_0257,w05_00_0262,w05_00_0264,w05_00_0283,wF3_F_021,wF3_F_008_F3_F_013,w05_00_0311
//   Enabled: w05_00_0120,w05_00_0127,w05_00_0189,w05_00_0312
//   Always on: w05_00_0074,w05_00_0122

	.section/DOUBLE32 program;

.epctext:
	.align 4;
_gser:
.LN_gser:
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 16 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P1,ASTAT0-ASTAT1,CC,LC1,LT1,LB1}
//   Call preserved registers used:{R4.L,R4.H,R5.L,R5.H,R6.L,R6.H,R7.L,R7.H,P4-P5,FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,I0-I3,B0-B3,M0-M3,A0.W,A0.X,A1.W,A1.X,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//Inlined in _gser:
//  ..\..\src\numerical-recipes-in-c\gser.c:24:24'_fabs
//  ..\..\src\numerical-recipes-in-c\gser.c:24:12'_fabs
//-------------------------------------------------------------------
// line "..\..\src\numerical-recipes-in-c\gser.c":6
	LINK 16;
	.align 2
	[--SP] = (R7:4, P5:4);
	SP += -12;
	R7 = ROT R1 BY 0 || [FP + 12] = R1;
	[SP + 60] = R2;
	P5 = [FP + 20];
	[FP + 16] = R0;
.LN0:
// line 12
	R0 = [FP + 12];
	CALL.X (_gammln);
	R5 = -1;
	R5 <<= 23;
	R1 = [SP + 60];
	CC = R1 <= R5;
.LN1:
	R1 = R1 >> 31 || [P5] = R0;
	R0 = 0;
	IF !CC R1 = R0;
	R0 = [SP + 60];
	CC = R0 == 0;
	R0 = R1;
	R6 = 1;
	IF CC R0 = R6;
.LN2:
// line 13
	CC = R0;
	if CC jump .P36L1 ;

.P36L2:
.LN3:
// line 19
	R0 = 0 /* 1065353216 */;
	R0.H = 16256 /* 1065353216 */;
	R1 = ROT R7 BY 0 || [SP + 48] = R0;
	CALL.X (___float32_div);                // float division is implemented as a library call. There is one more instruction related to this call. 
	R7 = ROT R0 BY 0 || R1 = [FP + 12];
.LN4:
// line 24
	R0 = 0 /* 1098907648 */;
	R0.H = 16768 /* 1098907648 */;
	P1 = 100;
	R6 = ROT R7 BY 0 || [SP + 44] = R0;
	LOOP .P36L8L LC1 = P1;

.P36L8:
//-------------------------------------------------------------------
//   Loop at "..\..\src\numerical-recipes-in-c\gser.c" line 20 col 3
//-------------------------------------------------------------------
//   This loop executes 1 iteration of the original loop in estimated 41 cycles.
//   (cycle count 41 excludes the cost of the inner function calls)
//-------------------------------------------------------------------
//   This loop's resource usage is:
//     Group 1             used  41 out of   41 (100.0%)
//     32-bit Instruction  used  38 out of   41 ( 92.7%)
//     16-bit Instruction  used  75 out of   82 ( 91.5%)
//     Store               used   2 out of   41 (  4.9%)
//-------------------------------------------------------------------
// Jumps out of this loop prevent efficient hardware loop generation.
//-------------------------------------------------------------------
	LOOP_BEGIN .P36L8L;
.LN5:
// line 21
	R0 = [SP + 48];
	CALL.X (___float32_add);                // float addition is implemented as a library call. 
	R5 = ROT R0 BY 0 || R0 = [SP + 60];
.LN6:
// line 22
	R1 = R5;
	CALL.X (___float32_div);                // float division is implemented as a library call. 
	R1 = R6;
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
.LN7:
// line 23
	R1 = R7;
.LN8:
// line 22
	R6 = R0;
.LN9:
// line 23
	CALL.X (___float32_add);                // float addition is implemented as a library call. 
	R7 = ROT R6 BY 0 || [SP + 40] = R0;
.LN10:
// line "C:\Program Files\Analog Devices\VisualDSP 5.0\Blackfin\include\math.h":569
	BITCLR(R0, 31);
.LN11:
// line "..\..\src\numerical-recipes-in-c\gser.c":24
	R1 = [SP + 44];
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
.LN12:
// line "C:\Program Files\Analog Devices\VisualDSP 5.0\Blackfin\include\math.h":569
	BITCLR(R7, 31);
	R2 = R0 & R7;
	R2 >>= 31;
	R1 = ROT R0 BY 0 || [SP + 36] = R2;
	R2 = 255;
	BITCLR(R1, 31);
	R2 <<= 23;
	CC = R2 < R1;
	R3 = R1 | R7;
	R1 = CC;
	CC = R2 < R7;
	R4 = 1;
	IF !CC R4 = R1;
	CC = R7 < R0;
	R1 = CC;
	CC = R0 == R7;
	R0 = [SP + 36];
	R0 = R0 ^ R1;
	IF !CC R1 = R0;
	CC = R3 == 0;
	IF CC R1 = R3;
	CC = R4;
	R0 = 0;
	IF CC R1 = R0;
.LN13:
// line "..\..\src\numerical-recipes-in-c\gser.c":24
	CC = R1;
	if CC jump .P36L11 ;

.P36L22:
	R1 = ROT R5 BY 0 || R7 = [SP + 40];
	LOOP_END .P36L8L;

.P36L10:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------
	R0.L = .satoola.1;
	R0.H = .satoola.1;
.LN14:
// line 29
	CALL.X (_nrerror);
.LN15:
// line 30
	SP += 12;
	P0 = [FP + 4];
	(R7:4, P5:4) = [SP++];
	UNLINK;
	// -- stall --
	JUMP (P0);

.P36L11:
.LN16:
// line 25
	R0 = [SP + 60];
	CALL.X (__logf);
.LN17:
	R1 = [FP + 12];
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	R1 = [SP + 60];
	BITTGL(R1, 31);
	CALL.X (___float32_add);                // float addition is implemented as a library call. 
	R1 = [P5];
	P4 = [FP + 16];
	CALL.X (___float32_sub);                // float  is implemented as a library call. 
.LN18:
	CALL.X (__expf);
.LN19:
	R1 = [SP + 40];
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	[P4] = R0;
.LN20:
// line 26
	SP += 12;
	P0 = [FP + 4];
	(R7:4, P5:4) = [SP++];
	UNLINK;
	// -- stall --
	JUMP (P0);

.P36L1:
	R0 = [SP + 60];
	BITTGL(R0, 31);
	CC = R0 == 0;
	R0 = 0;
	IF CC R1 = R0;
.LN21:
// line 14
	CC = R1;
	if CC jump .P36L4 ;

.P36L6:
.LN22:
// line 15
	P1 = [FP + 16];
	R0 = 0;
	// -- 2 stalls --
	[P1] = R0;
.LN23:
// line 16
	SP += 12;
	P0 = [FP + 4];
	(R7:4, P5:4) = [SP++];
	UNLINK;
	// -- stall --
	JUMP (P0);

	.align 4
.P36L4:
	R0.L = .sxlesst.0;
	R0.H = .sxlesst.0;
	.align 2
.LN24:
// line 14
	CALL.X (_nrerror);
	jump .P36L6;
.LN._gser.end:
._gser.end:
	.global _gser;
	.type _gser,STT_FUNC;

	.file_attr ProjectName="CoreA";
	.file_attr FuncName="_fabs";
	.file_attr FuncName="_gser";
	.file_attr Content="CodeData";
.epctext.end:

	.extern _gammln;
	.type _gammln,STT_FUNC;
	.extern ___float32_div;
	.type ___float32_div,STT_FUNC;
	.extern ___float32_add;
	.type ___float32_add,STT_FUNC;
	.extern ___float32_mul;
	.type ___float32_mul,STT_FUNC;
	.extern _nrerror;
	.type _nrerror,STT_FUNC;
	.extern __logf;
	.type __logf,STT_FUNC;
	.extern ___float32_sub;
	.type ___float32_sub,STT_FUNC;
	.extern __expf;
	.type __expf,STT_FUNC;

	.section .debug_abbrev SHT_DEBUGINFO;

	.align 1;
.epcabbrev:
	.type .epcabbrev,STT_OBJECT;
	.inc/binary "..\Debug\gser.sbn", 0, 186;
.epcabbrev.end:

	.section .debug_info SHT_DEBUGINFO;

	.align 1;
.epcdebug:
	.type .epcdebug,STT_OBJECT;
	.byte =
		0xB5,0x05,0x00,0x00,0x02,0x00;
	.byte4 = .epcabbrev;
	.byte =
		0x04,0x01,0x2E,0x2E,0x5C,0x2E,0x2E,0x5C,0x73,0x72,0x63,0x5C,
		0x6E,0x75,0x6D,0x65,0x72,0x69,0x63,0x61,0x6C,0x2D,0x72,0x65,
		0x63,0x69,0x70,0x65,0x73,0x2D,0x69,0x6E,0x2D,0x63,0x5C,0x67,
		0x73,0x65,0x72,0x2E,0x63,0x00,0x01;
	.byte4 = .epcline;
	.inc/binary "..\Debug\gser.sbn", 186, 1362;
	.byte4 = .LN_gser;
	.byte4 = .LN._gser.end;
	.byte =
		0x01,0x01,0x00,0x0E,0x67,0x6C,0x6E,0x00,0xB2,0x05,0x00,0x00,
		0x02,0x7F,0x14,0x00,0x0F,0x00,0x00,0x00,0x00;
	.byte4 = .LN0;
	.byte4 = .LN._gser.end;
	.byte =
		0x00,0x00,0x04,0x00,0x4E,0x02,0x00,0x00,0x00;
.epcdebug.end:

	.section .debug_line SHT_DEBUGINFO;

	.align 1;
.epcline:
	.type .epcline,STT_OBJECT;
	.inc/binary "..\Debug\gser.sbn", 1548, 2032;
	.byte4 = .LN_gser;
	.byte =
		0x04,0x01,0x05,0x01,0x0E,0x00,0x05,0x02;
	.byte4 = .LN0;
	.byte =
		0x05,0x0D,0x0F,0x00,0x05,0x02;
	.byte4 = .LN1;
	.byte =
		0x05,0x02,0x01,0x00,0x05,0x02;
	.byte4 = .LN2;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN3;
	.byte =
		0x05,0x03,0x0F,0x00,0x05,0x02;
	.byte4 = .LN4;
	.byte =
		0x05,0x04,0x0E,0x00,0x05,0x02;
	.byte4 = .LN5;
	.byte =
		0x03,0x7D,0x01,0x00,0x05,0x02;
	.byte4 = .LN6;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN7;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN8;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN9;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN10;
	.byte =
		0x04,0x02,0x05,0x0D,0x03,0xA2,0x04,0x01,0x00,0x05,0x02;
	.byte4 = .LN11;
	.byte =
		0x04,0x01,0x05,0x04,0x03,0xDF,0x7B,0x01,0x00,0x05,0x02;
	.byte4 = .LN12;
	.byte =
		0x04,0x02,0x05,0x0D,0x03,0xA1,0x04,0x01,0x00,0x05,0x02;
	.byte4 = .LN13;
	.byte =
		0x04,0x01,0x05,0x04,0x03,0xDF,0x7B,0x01,0x00,0x05,0x02;
	.byte4 = .LN14;
	.byte =
		0x05,0x0A,0x0E,0x00,0x05,0x02;
	.byte4 = .LN15;
	.byte =
		0x05,0x03,0x0A,0x00,0x05,0x02;
	.byte4 = .LN16;
	.byte =
		0x05,0x1D,0x03,0x7B,0x01,0x00,0x05,0x02;
	.byte4 = .LN17;
	.byte =
		0x05,0x05,0x01,0x00,0x05,0x02;
	.byte4 = .LN18;
	.byte =
		0x05,0x14,0x01,0x00,0x05,0x02;
	.byte4 = .LN19;
	.byte =
		0x05,0x05,0x01,0x00,0x05,0x02;
	.byte4 = .LN20;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN21;
	.byte =
		0x05,0x03,0x03,0x74,0x01,0x00,0x05,0x02;
	.byte4 = .LN22;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN23;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN24;
	.byte =
		0x05,0x17,0x03,0x7E,0x01,0x00,0x05,0x02;
	.byte4 = .LN._gser.end;
	.byte =
		0x00,0x01,0x01;
.epcline.end:

	.section .annotations SHT_DEBUGINFO;

	.align 1;
.epcannot:
	.type .epcannot,STT_OBJECT;
	.inc/binary "..\Debug\gser.sbn", 3580, 2488;
.epcannot.end:

	.section .debug_pubnames SHT_DEBUGINFO;

	.align 1;
.epcpubnames:
	.type .epcpubnames,STT_OBJECT;
	.byte =
		0x17,0x00,0x00,0x00,0x02,0x00;
	.byte4 = .epcdebug;
	.byte =
		0xB9,0x05,0x00,0x00,0x80,0x05,0x00,0x00,0x67,0x73,0x65,0x72,
		0x00,0x00,0x00,0x00,0x00;
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
	.byte4 = .LN_gser;
	.byte4 = .LN._gser.end-.LN_gser;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00;
.epcaranges.end:

	.section/DOUBLE32 constdata;

	.align 4;
.sxlesst.0:
	.type .sxlesst.0,STT_OBJECT;
	.byte =
		0x78,0x20,0x6C,0x65,0x73,0x73,0x20,0x74,0x68,0x61,0x6E,0x20,
		0x30,0x20,0x69,0x6E,0x20,0x72,0x6F,0x75,0x74,0x69,0x6E,0x65,
		0x20,0x67,0x73,0x65,0x72,0x00;
.sxlesst.0.end:
	.align 4;
.satoola.1:
	.type .satoola.1,STT_OBJECT;
	.byte =
		0x61,0x20,0x74,0x6F,0x6F,0x20,0x6C,0x61,0x72,0x67,0x65,0x2C,
		0x20,0x49,0x54,0x4D,0x41,0x58,0x20,0x74,0x6F,0x6F,0x20,0x73,
		0x6D,0x61,0x6C,0x6C,0x20,0x69,0x6E,0x20,0x72,0x6F,0x75,0x74,
		0x69,0x6E,0x65,0x20,0x67,0x73,0x65,0x72,0x00;
.satoola.1.end:
