	.file "..\..\src\numerical-recipes-in-c\gammq.c";
//  Compilation time: Wed Jan 20 22:50:33 2010

//  Compiler options: -c -file-attr ProjectName=CoreA -O -Ov100 -g -save-temps -path-output ..\Debug -structs-do-not-overlap -no-multiline -double-size-32 -decls-strong -warn-protos -proc ADSP-BF561 -o ..\Debug\gammq.doj -MM
//  Architecture: ADSP-BF561
//  Silicon revision: 0.5
//  Anomalies summary:
//   Disabled: w05_00_0046,w05_00_0048,w05_00_0054,w05_00_0071,w05_00_0103,w05_00_0104,w05_00_0157,w05_00_0164,w05_00_0165,w05_00_0195,w05_00_0198,w05_00_0202,w05_00_0209,w05_00_0227,w05_00_0244,w05_00_0245,w05_00_0246,w05_00_0248,w05_00_0257,w05_00_0262,w05_00_0264,w05_00_0283,wF3_F_021,wF3_F_008_F3_F_013,w05_00_0311
//   Enabled: w05_00_0120,w05_00_0127,w05_00_0189,w05_00_0312
//   Always on: w05_00_0074,w05_00_0122

	.section/DOUBLE32 program;

.epctext:
	.align 4;
_gammq:
.LN_gammq:
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 8 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0,ASTAT0-ASTAT1,CC}
//   Call preserved registers used:{R4.L,R4.H,R5.L,R5.H,R6.L,R6.H,R7.L,R7.H,FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,I0-I3,B0-B3,M0-M3,A0.W,A0.X,A1.W,A1.X,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
// line "..\..\src\numerical-recipes-in-c\gammq.c":3
	LINK 8;
	.align 2
	R2 = -1;
	[--SP] = (R7:4);
	R6 = R1;
	R2 <<= 23;
	CC = R6 <= R2;
	R3 = R6 >> 31;
	R5 = 0;
	BITTGL(R1, 31);
	IF !CC R3 = R5;
	CC = R1 == 0;
	IF CC R3 = R5;
.LN0:
// line 9
	CC = R3;
	R7 = R0;
.LN1:
// line 3
	SP += -16;
.LN2:
// line 9
	if CC jump .P35L1 ;

.P35L4:
	CC = R7 <= R2;
	R0 = R7 >> 31;
	IF !CC R0 = R5;
	CC = R7 == 0;
	R1 = 1;
	IF CC R0 = R1;
	CC = R0;
	if CC jump .P35L1 ;

.P35L3:
.LN3:
// line 10
	R1 = R7;
	R0 = 0 /* 1065353216 */;
	R0.H = 16256 /* 1065353216 */;
	CALL.X (___float32_add);                // float addition is implemented as a library call. 
	R1 = 255;
	R3 = R1 << 23;
	R2 = R6;
	R1 = R0;
	R4 = R1 & R2;
	R4 >>= 31;
	BITCLR(R0, 31);
	[SP + 36] = R4;
	CC = R3 < R0;
	BITCLR(R6, 31);
	R4 = CC;
	CC = R3 < R6;
	R3 = 1;
	IF !CC R3 = R4;
	CC = R2 < R1;
	R0 = R0 | R6;
	R6 = CC;
	CC = R1 == R2;
	R1 = [SP + 36];
	R1 = R1 ^ R6;
	IF !CC R6 = R1;
	CC = R0 == 0;
	IF CC R6 = R0;
	CC = R3;
	IF CC R6 = R5;
	CC = R6;
.LN4:
// line 11
	R0 = FP;
.LN5:
// line 10
	if !CC jump .P35L6 ;

.P35L5:
.LN6:
// line 11
	R0 += 8;
	R1 = ROT R7 BY 0 || [SP + 12] = R0;
	R0 += 8;
	CALL.X (_gser);
.LN7:
// line 12
	R1 = [SP + 56];
.LN8:
// line 10
	R0 = 0 /* 1065353216 */;
	R0.H = 16256 /* 1065353216 */;
.LN9:
// line 12
	CALL.X (___float32_sub);                // float  is implemented as a library call. 
	SP += 16;
	P0 = [FP + 4];
	(R7:4) = [SP++];
	UNLINK;
	// -- stall --
	JUMP (P0);

.P35L6:
.LN10:
// line 14
	R0 += 8;
	R1 = ROT R7 BY 0 || [SP + 12] = R0;
	R0 += 4;
	CALL.X (_gcf);
.LN11:
// line 15
	R0 = [SP + 52];
.LN12:
// line 12
	SP += 16;
	P0 = [FP + 4];
	(R7:4) = [SP++];
	UNLINK;
	// -- stall --
	JUMP (P0);

	.align 4
.P35L1:
	R0.L = .sInvali.0;
	R0.H = .sInvali.0;
	.align 2
.LN13:
// line 9
	CALL.X (_nrerror);
	jump .P35L3;
.LN._gammq.end:
._gammq.end:
	.global _gammq;
	.type _gammq,STT_FUNC;

	.file_attr ProjectName="CoreA";
	.file_attr FuncName="_gammq";
	.file_attr Content="CodeData";
.epctext.end:

	.extern ___float32_add;
	.type ___float32_add,STT_FUNC;
	.extern _gser;
	.type _gser,STT_FUNC;
	.extern ___float32_sub;
	.type ___float32_sub,STT_FUNC;
	.extern _gcf;
	.type _gcf,STT_FUNC;
	.extern _nrerror;
	.type _nrerror,STT_FUNC;

	.section .debug_abbrev SHT_DEBUGINFO;

	.align 1;
.epcabbrev:
	.type .epcabbrev,STT_OBJECT;
	.byte =
		0x01,0x11,0x01,0x03,0x08,0x13,0x0B,0x10,0x06,0x43,0x06,0x1B,
		0x08,0x25,0x08,0x42,0x0B,0x00,0x00,0x02,0x24,0x00,0x03,0x08,
		0x3E,0x0B,0x0B,0x0F,0x00,0x00,0x03,0x2E,0x01,0x01,0x13,0x03,
		0x08,0x32,0x0B,0x11,0x01,0x12,0x01,0x27,0x0C,0x49,0x13,0x3F,
		0x0C,0x20,0x0B,0x00,0x00,0x04,0x0B,0x01,0x01,0x13,0x11,0x01,
		0x12,0x01,0x00,0x00,0x05,0x34,0x00,0x03,0x08,0x32,0x0B,0x49,
		0x13,0x02,0x09,0x2C,0x06,0x3F,0x0C,0x00,0x00,0x00;
.epcabbrev.end:

	.section .debug_info SHT_DEBUGINFO;

	.align 1;
.epcdebug:
	.type .epcdebug,STT_OBJECT;
	.byte =
		0xDE,0x02,0x00,0x00,0x02,0x00;
	.byte4 = .epcabbrev;
	.byte =
		0x04,0x01,0x2E,0x2E,0x5C,0x2E,0x2E,0x5C,0x73,0x72,0x63,0x5C,
		0x6E,0x75,0x6D,0x65,0x72,0x69,0x63,0x61,0x6C,0x2D,0x72,0x65,
		0x63,0x69,0x70,0x65,0x73,0x2D,0x69,0x6E,0x2D,0x63,0x5C,0x67,
		0x61,0x6D,0x6D,0x71,0x2E,0x63,0x00,0x01;
	.byte4 = .epcline;
	.inc/binary "..\Debug\gammq.sbn", 0, 589;
	.byte4 = .LN_gammq;
	.byte4 = .LN._gammq.end;
	.byte =
		0x01,0x4F,0x02,0x00,0x00,0x01,0x00,0x04,0x00,0x00,0x00,0x00;
	.byte4 = .LN0;
	.byte4 = .LN._gammq.end;
	.byte =
		0x05,0x67,0x61,0x6D,0x73,0x65,0x72,0x00,0x01,0x4F,0x02,0x00,
		0x00,0x02,0x7F,0x10;
	.byte4 = .LN1-.LN_gammq;
	.byte =
		0x00,0x05,0x67,0x61,0x6D,0x6D,0x63,0x66,0x00,0x01,0x4F,0x02,
		0x00,0x00,0x02,0x7F,0x0C;
	.byte4 = .LN1-.LN_gammq;
	.byte =
		0x00,0x05,0x67,0x6C,0x6E,0x00,0x01,0x4F,0x02,0x00,0x00,0x02,
		0x7F,0x08;
	.byte4 = .LN1-.LN_gammq;
	.byte =
		0x00,0x00,0x00,0x00;
.epcdebug.end:

	.section .debug_line SHT_DEBUGINFO;

	.align 1;
.epcline:
	.type .epcline,STT_OBJECT;
	.inc/binary "..\Debug\gammq.sbn", 589, 175;
	.byte4 = .LN_gammq;
	.byte =
		0x04,0x01,0x05,0x01,0x0B,0x00,0x05,0x02;
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
		0x05,0x07,0x0A,0x00,0x05,0x02;
	.byte4 = .LN5;
	.byte =
		0x05,0x02,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN6;
	.byte =
		0x05,0x07,0x0A,0x00,0x05,0x02;
	.byte4 = .LN7;
	.byte =
		0x05,0x03,0x0A,0x00,0x05,0x02;
	.byte4 = .LN8;
	.byte =
		0x05,0x02,0x03,0x7E,0x01,0x00,0x05,0x02;
	.byte4 = .LN9;
	.byte =
		0x05,0x03,0x0B,0x00,0x05,0x02;
	.byte4 = .LN10;
	.byte =
		0x05,0x06,0x0B,0x00,0x05,0x02;
	.byte4 = .LN11;
	.byte =
		0x05,0x03,0x0A,0x00,0x05,0x02;
	.byte4 = .LN12;
	.byte =
		0x03,0x7D,0x01,0x00,0x05,0x02;
	.byte4 = .LN13;
	.byte =
		0x05,0x22,0x03,0x7D,0x01,0x00,0x05,0x02;
	.byte4 = .LN._gammq.end;
	.byte =
		0x00,0x01,0x01;
.epcline.end:

	.section .annotations SHT_DEBUGINFO;

	.align 1;
.epcannot:
	.type .epcannot,STT_OBJECT;
	.inc/binary "..\Debug\gammq.sbn", 764, 1356;
.epcannot.end:

	.section .debug_pubnames SHT_DEBUGINFO;

	.align 1;
.epcpubnames:
	.type .epcpubnames,STT_OBJECT;
	.byte =
		0x18,0x00,0x00,0x00,0x02,0x00;
	.byte4 = .epcdebug;
	.byte =
		0xE2,0x02,0x00,0x00,0x7B,0x02,0x00,0x00,0x67,0x61,0x6D,0x6D,
		0x71,0x00,0x00,0x00,0x00,0x00;
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
	.byte4 = .LN_gammq;
	.byte4 = .LN._gammq.end-.LN_gammq;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00;
.epcaranges.end:

	.section/DOUBLE32 constdata;

	.align 4;
.sInvali.0:
	.type .sInvali.0,STT_OBJECT;
	.byte =
		0x49,0x6E,0x76,0x61,0x6C,0x69,0x64,0x20,0x61,0x72,0x67,0x75,
		0x6D,0x65,0x6E,0x74,0x73,0x20,0x69,0x6E,0x20,0x72,0x6F,0x75,
		0x74,0x69,0x6E,0x65,0x20,0x67,0x61,0x6D,0x6D,0x71,0x00;
.sInvali.0.end:
