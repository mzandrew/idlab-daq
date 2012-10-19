	.file "..\..\src\numerical-recipes-in-c\gcf.c";
//  Compilation time: Wed Jan 20 22:50:34 2010

//  Compiler options: -c -file-attr ProjectName=CoreA -O -Ov100 -g -save-temps -path-output ..\Debug -structs-do-not-overlap -no-multiline -double-size-32 -decls-strong -warn-protos -proc ADSP-BF561 -o ..\Debug\gcf.doj -MM
//  Architecture: ADSP-BF561
//  Silicon revision: 0.5
//  Anomalies summary:
//   Disabled: w05_00_0046,w05_00_0048,w05_00_0054,w05_00_0071,w05_00_0103,w05_00_0104,w05_00_0157,w05_00_0164,w05_00_0165,w05_00_0195,w05_00_0198,w05_00_0202,w05_00_0209,w05_00_0227,w05_00_0244,w05_00_0245,w05_00_0246,w05_00_0248,w05_00_0257,w05_00_0262,w05_00_0264,w05_00_0283,wF3_F_021,wF3_F_008_F3_F_013,w05_00_0311
//   Enabled: w05_00_0120,w05_00_0127,w05_00_0189,w05_00_0312
//   Always on: w05_00_0074,w05_00_0122

	.section/DOUBLE32 program;

.epctext:
	.align 4;
_gcf:
.LN_gcf:
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 32 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0,ASTAT0-ASTAT1,CC,LC1,LT1,LB1}
//   Call preserved registers used:{R4.L,R4.H,R5.L,R5.H,R6.L,R6.H,R7.L,R7.H,P3-P5,FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,I0-I3,B0-B3,M0-M3,A0.W,A0.X,A1.W,A1.X,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//Inlined in _gcf:
//  ..\..\src\numerical-recipes-in-c\gcf.c:29:11'_fabs
//  ..\..\src\numerical-recipes-in-c\gcf.c:25:11'_fabs
//  ..\..\src\numerical-recipes-in-c\gcf.c:23:11'_fabs
//-------------------------------------------------------------------
// line "..\..\src\numerical-recipes-in-c\gcf.c":8
	LINK 32;
	.align 2
	[--SP] = (R7:4, P5:3);
	SP += -12;
.LN0:
// line 21
	R3 = 0;
	R7 = ROT R1 BY 0 || [FP + 12] = R1;
	BITSET(R3, 30);
	[FP + 8] = R3;
.LN1:
// line 15
	R3 = 0 /* 1065353216 */;
	R3.H = 16256 /* 1065353216 */;
.LN2:
// line 8
	P3 = [FP + 20];
	[SP + 60] = R2;
.LN3:
// line 15
	[FP + 16] = R3;
	R3 = 16992 /* 228737632 */;
	R3.H = 3490 /* 228737632 */;
	[FP + -4] = R3;
	R3 = 0 /* 1098907648 */;
	R3.H = 16768 /* 1098907648 */;
.LN4:
// line 8
	P5 = R0;
.LN5:
// line 14
	R0 = [FP + 12];
	[FP + -8] = R3;
	CALL.X (_gammln);
.LN6:
	[P3] = R0;
.LN7:
// line 15
	R1 = [FP + 16];
	R0 = [SP + 60];
	CALL.X (___float32_add);                // float addition is implemented as a library call. There is one more instruction related to this call. 
	R1 = R7;
	CALL.X (___float32_sub);                // float  is implemented as a library call. 
	R7 = ROT R0 BY 0 || R0 = [FP + 16];
.LN8:
// line 17
	R1 = R7;
	CALL.X (___float32_div);                // float division is implemented as a library call. 
	R1 = R0;
	R5 = 1;
	P4 = 100;
	[SP + 52] = R1;
	[SP + 56] = R1;
	[SP + 48] = R5;
	R6 = -3382 /* 1900671690 */;
	R6.H = 29001 /* 1900671690 */;
	R0 = -1;
	LOOP .P35L1L LC1 = P4;

.P35L1:
//-------------------------------------------------------------------
//   Loop at "..\..\src\numerical-recipes-in-c\gcf.c" line 19 col 2
//-------------------------------------------------------------------
//   This loop executes 1 iteration of the original loop in estimated 78 cycles.
//   (cycle count 78 excludes the cost of the inner function calls)
//-------------------------------------------------------------------
//   This loop's resource usage is:
//     Group 1             used  78 out of   78 (100.0%)
//     16-bit Instruction  used 132 out of  156 ( 84.6%)
//     32-bit Instruction  used  64 out of   78 ( 82.1%)
//     Store               used   7 out of   78 (  9.0%)
//-------------------------------------------------------------------
// Jumps out of this loop prevent efficient hardware loop generation.
//-------------------------------------------------------------------
	LOOP_BEGIN .P35L1L;
	R4 = R0;
.LN9:
// line 20
	CALL.X (___int32_to_float32);           // instruction is implemented as a library call. 
	R5 = ROT R0 BY 0 || R0 = [SP + 48];
	CALL.X (___int32_to_float32);           // instruction is implemented as a library call. 
	R1 = [FP + 12];
	CALL.X (___float32_sub);                // float  is implemented as a library call. 
	R1 = R5;
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	R5 = ROT R0 BY 0 || [SP + 40] = R0;
.LN10:
// line 21
	R1 = ROT R7 BY 0 || R0 = [FP + 8];
	CALL.X (___float32_add);                // float addition is implemented as a library call. 
	R7 = ROT R0 BY 0 || R1 = [SP + 56];
.LN11:
// line 22
	R0 = R5;
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	R1 = R7;
	CALL.X (___float32_add);                // float addition is implemented as a library call. 
	R1 = ROT R0 BY 0 || R0 = [SP + 40];
	R2 = 255;
	R5 = ROT R1 BY 0 || R3 = [FP + -4];
	R2 <<= 23;
.LN12:
// line "C:\Program Files\Analog Devices\VisualDSP 5.0\Blackfin\include\math.h":569
	BITCLR(R1, 31);
	CC = R2 < R1;
	[SP + 40] = R2;
	R2 = CC;
	CC = R1 < R3;
	R1 = CC;
	CC = R2;
	R2 = 0;
	IF CC R1 = R2;
	CC = R1;
	R1 = ROT R6 BY 0 || R6 = [FP + -4];
	IF CC R5 = R3;
.LN13:
// line "..\..\src\numerical-recipes-in-c\gcf.c":24
	CALL.X (___float32_div);                // float division is implemented as a library call. 
	R1 = R7;
	CALL.X (___float32_add);                // float addition is implemented as a library call. 
	R2 = ROT R0 BY 0 || R3 = [SP + 40];
.LN14:
// line "C:\Program Files\Analog Devices\VisualDSP 5.0\Blackfin\include\math.h":569
	BITCLR(R2, 31);
	CC = R3 < R2;
	R3 = CC;
	CC = R2 < R6;
	R2 = CC;
	CC = R3;
	R3 = 0;
	IF CC R2 = R3;
	R6 = ROT R0 BY 0 || R0 = [FP + -4];
	CC = R2;
	IF CC R6 = R0;
.LN15:
// line "..\..\src\numerical-recipes-in-c\gcf.c":26
	R1 = ROT R5 BY 0 || R0 = [FP + 16];
	CALL.X (___float32_div);                // float division is implemented as a library call. 
.LN16:
// line 27
	R1 = R6;
.LN17:
// line 26
	R5 = R0;
.LN18:
// line 27
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	[SP + 56] = R0;
.LN19:
// line 28
	R1 = [SP + 52];
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	[SP + 52] = R0;
.LN20:
// line 29
	R1 = [FP + 16];
	R0 = [SP + 56];
	CALL.X (___float32_sub);                // float  is implemented as a library call. 
.LN21:
// line "C:\Program Files\Analog Devices\VisualDSP 5.0\Blackfin\include\math.h":569
	BITCLR(R0, 31);
	R1 = [SP + 40];
	CC = R1 < R0;
	R2 = [FP + -8];
	R1 = CC;
	CC = R0 < R2;
	R0 = CC;
	CC = R1;
	R1 = 0;
	R4 += -1;
	IF CC R0 = R1;
	[SP + 44] = R4;
	R4 = [SP + 48];
.LN22:
// line "..\..\src\numerical-recipes-in-c\gcf.c":29
	CC = R0;
	R4 += 1;
	if CC jump .P35L25 ;

.P35L30:
	[SP + 56] = R5;
	[SP + 48] = R4;
	R0 = [SP + 44];
	LOOP_END .P35L1L;

.P35L29:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------

.P35L13:
.LN23:
// line 31
	R0 = 100;
	CC = R0 < R4;
	if CC jump .P35L15 ;

.P35L17:
.LN24:
// line 32
	R0 = [SP + 60];
	CALL.X (__logf);
.LN25:
	R1 = [FP + 12];
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	R1 = [SP + 60];
	BITTGL(R1, 31);
	CALL.X (___float32_add);                // float addition is implemented as a library call. 
	R1 = [P3];
	CALL.X (___float32_sub);                // float  is implemented as a library call. 
.LN26:
	CALL.X (__expf);
.LN27:
	R1 = [SP + 52];
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	[P5] = R0;
.LN28:
// line 33
	SP += 12;
	P0 = [FP + 4];
	(R7:4, P5:3) = [SP++];
	UNLINK;
	// -- stall --
	JUMP (P0);

	.align 4
.P35L15:
	R0.L = .satoola.0;
	R0.H = .satoola.0;
	.align 2
.LN29:
// line 31
	CALL.X (_nrerror);
	jump .P35L17;

.P35L25:
	R4 = [SP + 48];
	jump .P35L13;
.LN._gcf.end:
._gcf.end:
	.global _gcf;
	.type _gcf,STT_FUNC;

	.file_attr ProjectName="CoreA";
	.file_attr FuncName="_fabs";
	.file_attr FuncName="_gcf";
	.file_attr Content="CodeData";
.epctext.end:

	.extern _gammln;
	.type _gammln,STT_FUNC;
	.extern ___float32_add;
	.type ___float32_add,STT_FUNC;
	.extern ___float32_sub;
	.type ___float32_sub,STT_FUNC;
	.extern ___float32_div;
	.type ___float32_div,STT_FUNC;
	.extern ___int32_to_float32;
	.type ___int32_to_float32,STT_FUNC;
	.extern ___float32_mul;
	.type ___float32_mul,STT_FUNC;
	.extern __logf;
	.type __logf,STT_FUNC;
	.extern __expf;
	.type __expf,STT_FUNC;
	.extern _nrerror;
	.type _nrerror,STT_FUNC;

	.section .debug_abbrev SHT_DEBUGINFO;

	.align 1;
.epcabbrev:
	.type .epcabbrev,STT_OBJECT;
	.inc/binary "..\Debug\gcf.sbn", 0, 186;
.epcabbrev.end:

	.section .debug_info SHT_DEBUGINFO;

	.align 1;
.epcdebug:
	.type .epcdebug,STT_OBJECT;
	.byte =
		0xB3,0x05,0x00,0x00,0x02,0x00;
	.byte4 = .epcabbrev;
	.byte =
		0x04,0x01,0x2E,0x2E,0x5C,0x2E,0x2E,0x5C,0x73,0x72,0x63,0x5C,
		0x6E,0x75,0x6D,0x65,0x72,0x69,0x63,0x61,0x6C,0x2D,0x72,0x65,
		0x63,0x69,0x70,0x65,0x73,0x2D,0x69,0x6E,0x2D,0x63,0x5C,0x67,
		0x63,0x66,0x2E,0x63,0x00,0x01;
	.byte4 = .epcline;
	.inc/binary "..\Debug\gcf.sbn", 186, 1361;
	.byte4 = .LN_gcf;
	.byte4 = .LN._gcf.end;
	.byte =
		0x01,0x01,0x00,0x0E,0x67,0x6C,0x6E,0x00,0xB0,0x05,0x00,0x00,
		0x02,0x7F,0x14,0x00,0x0F,0x00,0x00,0x00,0x00;
	.byte4 = .LN0;
	.byte4 = .LN._gcf.end;
	.byte =
		0x00,0x00,0x04,0x00,0x4D,0x02,0x00,0x00,0x00;
.epcdebug.end:

	.section .debug_line SHT_DEBUGINFO;

	.align 1;
.epcline:
	.type .epcline,STT_OBJECT;
	.inc/binary "..\Debug\gcf.sbn", 1547, 2031;
	.byte4 = .LN_gcf;
	.byte =
		0x04,0x01,0x05,0x01,0x10,0x00,0x05,0x02;
	.byte4 = .LN0;
	.byte =
		0x05,0x03,0x16,0x00,0x05,0x02;
	.byte4 = .LN1;
	.byte =
		0x05,0x02,0x03,0x7A,0x01,0x00,0x05,0x02;
	.byte4 = .LN2;
	.byte =
		0x05,0x01,0x03,0x79,0x01,0x00,0x05,0x02;
	.byte4 = .LN3;
	.byte =
		0x05,0x02,0x10,0x00,0x05,0x02;
	.byte4 = .LN4;
	.byte =
		0x05,0x01,0x03,0x79,0x01,0x00,0x05,0x02;
	.byte4 = .LN5;
	.byte =
		0x05,0x0D,0x0F,0x00,0x05,0x02;
	.byte4 = .LN6;
	.byte =
		0x05,0x02,0x01,0x00,0x05,0x02;
	.byte4 = .LN7;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN8;
	.byte =
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN9;
	.byte =
		0x05,0x03,0x0C,0x00,0x05,0x02;
	.byte4 = .LN10;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN11;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN12;
	.byte =
		0x04,0x02,0x05,0x0D,0x03,0xA3,0x04,0x01,0x00,0x05,0x02;
	.byte4 = .LN13;
	.byte =
		0x04,0x01,0x05,0x03,0x03,0xDF,0x7B,0x01,0x00,0x05,0x02;
	.byte4 = .LN14;
	.byte =
		0x04,0x02,0x05,0x0D,0x03,0xA1,0x04,0x01,0x00,0x05,0x02;
	.byte4 = .LN15;
	.byte =
		0x04,0x01,0x05,0x03,0x03,0xE1,0x7B,0x01,0x00,0x05,0x02;
	.byte4 = .LN16;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN17;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN18;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN19;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN20;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN21;
	.byte =
		0x04,0x02,0x05,0x0D,0x03,0x9C,0x04,0x01,0x00,0x05,0x02;
	.byte4 = .LN22;
	.byte =
		0x04,0x01,0x05,0x03,0x03,0xE4,0x7B,0x01,0x00,0x05,0x02;
	.byte4 = .LN23;
	.byte =
		0x05,0x02,0x0B,0x00,0x05,0x02;
	.byte4 = .LN24;
	.byte =
		0x05,0x16,0x0A,0x00,0x05,0x02;
	.byte4 = .LN25;
	.byte =
		0x05,0x02,0x01,0x00,0x05,0x02;
	.byte4 = .LN26;
	.byte =
		0x05,0x0D,0x01,0x00,0x05,0x02;
	.byte4 = .LN27;
	.byte =
		0x05,0x02,0x01,0x00,0x05,0x02;
	.byte4 = .LN28;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.byte4 = .LN29;
	.byte =
		0x05,0x18,0x03,0x7E,0x01,0x00,0x05,0x02;
	.byte4 = .LN._gcf.end;
	.byte =
		0x00,0x01,0x01;
.epcline.end:

	.section .annotations SHT_DEBUGINFO;

	.align 1;
.epcannot:
	.type .epcannot,STT_OBJECT;
	.inc/binary "..\Debug\gcf.sbn", 3578, 3300;
.epcannot.end:

	.section .debug_pubnames SHT_DEBUGINFO;

	.align 1;
.epcpubnames:
	.type .epcpubnames,STT_OBJECT;
	.byte =
		0x16,0x00,0x00,0x00,0x02,0x00;
	.byte4 = .epcdebug;
	.byte =
		0xB7,0x05,0x00,0x00,0x7F,0x05,0x00,0x00,0x67,0x63,0x66,0x00,
		0x00,0x00,0x00,0x00;
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
	.byte4 = .LN_gcf;
	.byte4 = .LN._gcf.end-.LN_gcf;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00;
.epcaranges.end:

	.section/DOUBLE32 constdata;

	.align 4;
.satoola.0:
	.type .satoola.0,STT_OBJECT;
	.byte =
		0x61,0x20,0x74,0x6F,0x6F,0x20,0x6C,0x61,0x72,0x67,0x65,0x2C,
		0x20,0x49,0x54,0x4D,0x41,0x58,0x20,0x74,0x6F,0x6F,0x20,0x73,
		0x6D,0x61,0x6C,0x6C,0x20,0x69,0x6E,0x20,0x67,0x63,0x66,0x00;
.satoola.0.end:
