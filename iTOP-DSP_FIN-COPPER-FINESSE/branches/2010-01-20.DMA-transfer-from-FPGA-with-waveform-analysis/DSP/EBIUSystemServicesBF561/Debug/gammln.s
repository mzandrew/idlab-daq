	.file "..\..\src\numerical-recipes-in-c\gammln.c";
//  Compilation time: Wed Jan 20 22:50:33 2010

//  Compiler options: -c -file-attr ProjectName=CoreA -O -Ov100 -g -save-temps -path-output ..\Debug -structs-do-not-overlap -no-multiline -double-size-32 -decls-strong -warn-protos -proc ADSP-BF561 -o ..\Debug\gammln.doj -MM
//  Architecture: ADSP-BF561
//  Silicon revision: 0.5
//  Anomalies summary:
//   Disabled: w05_00_0046,w05_00_0048,w05_00_0054,w05_00_0071,w05_00_0103,w05_00_0104,w05_00_0157,w05_00_0164,w05_00_0165,w05_00_0195,w05_00_0198,w05_00_0202,w05_00_0209,w05_00_0227,w05_00_0244,w05_00_0245,w05_00_0246,w05_00_0248,w05_00_0257,w05_00_0262,w05_00_0264,w05_00_0283,wF3_F_021,wF3_F_008_F3_F_013,w05_00_0311
//   Enabled: w05_00_0120,w05_00_0127,w05_00_0189,w05_00_0312
//   Always on: w05_00_0074,w05_00_0122

	.section/DOUBLE32 program;

.epctext:
	.align 4;
_gammln:
.LN_gammln:
	.reference _cof.0;
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,P0-P1,ASTAT0-ASTAT1,LC1,LT1,LB1}
//   Call preserved registers used:{R4.L,R4.H,R5.L,R5.H,R6.L,R6.H,R7.L,R7.H,P5,FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,I0-I3,B0-B3,M0-M3,A0.W,A0.X,A1.W,A1.X,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
// line "..\..\src\numerical-recipes-in-c\gammln.c":5
	LINK 0;
	.align 2
	[--SP] = (R7:4, P5:5);
	SP += -12;
.LN0:
// line 13
	R1 = 0 /* 1085276160 */;
	R1.H = 16560 /* 1085276160 */;
	R6 = ROT R0 BY 0 || [SP + 40] = R0;
	CALL.X (___float32_add);                // float addition is implemented as a library call. There is one more instruction related to this call. 
	R5 = R0;
.LN1:
// line 14
	CALL.X (__logf);
	R7 = R0;
.LN2:
	R0 = R6;
	R1 = 0 /* 1056964608 */;
	R1.H = 16128 /* 1056964608 */;
	CALL.X (___float32_add);                // float addition is implemented as a library call. There is one more instruction related to this call. 
	R1 = R7;
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	R1 = R0;
	R0 = R5;
	CALL.X (___float32_sub);                // float  is implemented as a library call. 
	R4 = 0 /* 1065353216 */;
	R4.H = 16256 /* 1065353216 */;
.LN3:
// line 16
	P1 = 6;
.LN4:
// line 14
	R7 = ROT R4 BY 0 || [SP + 44] = R0;
	P5.L = .gammln.statics;
	P5.H = .gammln.statics;
.LN5:
// line 16
	LOOP .P35L2L LC1 = P1;

.P35L2:
//-------------------------------------------------------------------
//   Loop at "..\..\src\numerical-recipes-in-c\gammln.c" line 16 col 2
//-------------------------------------------------------------------
//   This loop executes 1 iteration of the original loop in estimated 10 cycles.
//   (cycle count 10 excludes the cost of the inner function calls)
//-------------------------------------------------------------------
//   This loop's resource usage is:
//     32-bit Instruction  used  10 out of   10 (100.0%)
//     Group 1             used  10 out of   10 (100.0%)
//     16-bit Instruction  used  19 out of   20 ( 95.0%)
//-------------------------------------------------------------------
// This loop was not modulo scheduled because it contains calls or volatile operations.
//-------------------------------------------------------------------
	LOOP_BEGIN .P35L2L;
.LN6:
	R1 = ROT R6 BY 0 || R5 = [P5++];
	R0 = R4;
	CALL.X (___float32_add);                // float addition is implemented as a library call. 
	R6 = R0;
	R0 = R5;
	R1 = R6;
	CALL.X (___float32_div);                // float division is implemented as a library call. 
	R1 = R7;
	CALL.X (___float32_add);                // float addition is implemented as a library call. 
	R7 = R0;
.LN7:
	LOOP_END .P35L2L;

.P35L7:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------
.LN8:
// line 17
	R1 = 27801 /* 1075866777 */;
	R1.H = 16416 /* 1075866777 */;
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. There is one more instruction related to this call. 
	R1 = [SP + 40];
	CALL.X (___float32_div);                // float division is implemented as a library call. 
.LN9:
	CALL.X (__logf);
	R1 = [SP + 44];
.LN10:
	BITTGL(R1, 31);
	CALL.X (___float32_add);                // float addition is implemented as a library call. 
	SP += 12;
	P0 = [FP + 4];
	(R7:4, P5:5) = [SP++];
	UNLINK;
	// -- stall --
	JUMP (P0);
.LN._gammln.end:
._gammln.end:
	.global _gammln;
	.type _gammln,STT_FUNC;

	.file_attr ProjectName="CoreA";
	.file_attr FuncName="_gammln";
	.file_attr Content="CodeData";
.epctext.end:

	.extern ___float32_add;
	.type ___float32_add,STT_FUNC;
	.extern __logf;
	.type __logf,STT_FUNC;
	.extern ___float32_mul;
	.type ___float32_mul,STT_FUNC;
	.extern ___float32_sub;
	.type ___float32_sub,STT_FUNC;
	.extern ___float32_div;
	.type ___float32_div,STT_FUNC;

	.section .debug_abbrev SHT_DEBUGINFO;

	.align 1;
.epcabbrev:
	.type .epcabbrev,STT_OBJECT;
	.inc/binary "..\Debug\gammln.sbn", 0, 192;
.epcabbrev.end:

	.section .debug_info SHT_DEBUGINFO;

	.align 1;
.epcdebug:
	.type .epcdebug,STT_OBJECT;
	.byte =
		0xCD,0x05,0x00,0x00,0x02,0x00;
	.byte4 = .epcabbrev;
	.byte =
		0x04,0x01,0x2E,0x2E,0x5C,0x2E,0x2E,0x5C,0x73,0x72,0x63,0x5C,
		0x6E,0x75,0x6D,0x65,0x72,0x69,0x63,0x61,0x6C,0x2D,0x72,0x65,
		0x63,0x69,0x70,0x65,0x73,0x2D,0x69,0x6E,0x2D,0x63,0x5C,0x67,
		0x61,0x6D,0x6D,0x6C,0x6E,0x2E,0x63,0x00,0x01;
	.byte4 = .epcline;
	.inc/binary "..\Debug\gammln.sbn", 192, 1364;
	.byte4 = .LN_gammln;
	.byte4 = .LN._gammln.end;
	.byte =
		0x01,0x50,0x02,0x00,0x00,0x01,0x00,0x0E,0x00,0x00,0x00,0x00;
	.byte4 = .LN0;
	.byte4 = .LN._gammln.end;
	.byte =
		0x0F,0x63,0x6F,0x66,0x00,0x01,0xC2,0x05,0x00,0x00,0x05,0x0C;
	.byte4 = _cof.0;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x0B,0x00,0x00,0x00,0x00,
		0x59,0x02,0x00,0x00,0x0C,0x06,0x00,0x05,0x00,0x00;
.epcdebug.end:

	.section .debug_line SHT_DEBUGINFO;

	.align 1;
.epcline:
	.type .epcline,STT_OBJECT;
	.inc/binary "..\Debug\gammln.sbn", 1556, 2034;
	.byte4 = .LN_gammln;
	.byte =
		0x04,0x01,0x05,0x01,0x0D,0x00,0x05,0x02;
	.byte4 = .LN0;
	.byte =
		0x05,0x02,0x11,0x00,0x05,0x02;
	.byte4 = .LN1;
	.byte =
		0x05,0x14,0x0A,0x00,0x05,0x02;
	.byte4 = .LN2;
	.byte =
		0x05,0x02,0x01,0x00,0x05,0x02;
	.byte4 = .LN3;
	.byte =
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN4;
	.byte =
		0x03,0x7E,0x01,0x00,0x05,0x02;
	.byte4 = .LN5;
	.byte =
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN6;
	.byte =
		0x05,0x15,0x01,0x00,0x05,0x02;
	.byte4 = .LN7;
	.byte =
		0x05,0x02,0x01,0x00,0x05,0x02;
	.byte4 = .LN8;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN9;
	.byte =
		0x05,0x11,0x01,0x00,0x05,0x02;
	.byte4 = .LN10;
	.byte =
		0x05,0x02,0x01,0x00,0x05,0x02;
	.byte4 = .LN._gammln.end;
	.byte =
		0x00,0x01,0x01;
.epcline.end:

	.section .annotations SHT_DEBUGINFO;

	.align 1;
.epcannot:
	.type .epcannot,STT_OBJECT;
	.inc/binary "..\Debug\gammln.sbn", 3590, 2460;
.epcannot.end:

	.section .debug_pubnames SHT_DEBUGINFO;

	.align 1;
.epcpubnames:
	.type .epcpubnames,STT_OBJECT;
	.byte =
		0x19,0x00,0x00,0x00,0x02,0x00;
	.byte4 = .epcdebug;
	.byte =
		0xD1,0x05,0x00,0x00,0x82,0x05,0x00,0x00,0x67,0x61,0x6D,0x6D,
		0x6C,0x6E,0x00,0x00,0x00,0x00,0x00;
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
	.byte4 = .LN_gammln;
	.byte4 = .LN._gammln.end-.LN_gammln;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00;
.epcaranges.end:

	.section/DOUBLE32 data1;

	.align 4;
.gammln.statics:
	.type .gammln.statics,STT_OBJECT;
_cof.0:
	.type _cof.0,STT_OBJECT;
	.byte =
		0x35,0x5C,0x98,0x42,0xB9,0x02,0xAD,0xC2,0xE0,0x1C,0xC0,0x41,
		0xA4,0xA9,0x9D,0xBF,0x99,0x6B,0x9E,0x3A,0xC1,0x08,0xB5,0xB6;
.gammln.statics.end:
