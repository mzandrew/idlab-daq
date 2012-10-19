	.file "..\..\src\numerical-recipes-in-c\xrealft.c";
//  Compilation time: Wed Jan 20 22:50:36 2010

//  Compiler options: -c -file-attr ProjectName=CoreA -O -Ov100 -g -save-temps -path-output ..\Debug -structs-do-not-overlap -no-multiline -double-size-32 -decls-strong -warn-protos -proc ADSP-BF561 -o ..\Debug\xrealft.doj -MM
//  Architecture: ADSP-BF561
//  Silicon revision: 0.5
//  Anomalies summary:
//   Disabled: w05_00_0046,w05_00_0048,w05_00_0054,w05_00_0071,w05_00_0103,w05_00_0104,w05_00_0157,w05_00_0164,w05_00_0165,w05_00_0195,w05_00_0198,w05_00_0202,w05_00_0209,w05_00_0227,w05_00_0244,w05_00_0245,w05_00_0246,w05_00_0248,w05_00_0257,w05_00_0262,w05_00_0264,w05_00_0283,wF3_F_021,wF3_F_008_F3_F_013,w05_00_0311
//   Enabled: w05_00_0120,w05_00_0127,w05_00_0189,w05_00_0312
//   Always on: w05_00_0074,w05_00_0122

	.section/DOUBLE32 program;

.epctext:
	.align 4;
_setup_real_fft:
.LN_setup_real_fft:
	.reference _data;
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,P0-P1,ASTAT0-ASTAT1,CC}
//   Call preserved registers used:{R4.L,R4.H,R5.L,R5.H,R6.L,R6.H,R7.L,R7.H,P4-P5,FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,I0-I3,B0-B3,M0-M3,A0.W,A0.X,A1.W,A1.X,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
// line "..\..\src\numerical-recipes-in-c\xrealft.c":17
	LINK 0;
	.align 2
	[--SP] = (R7:4, P5:4);
	SP += -12;
.LN0:
// line 20
	R1 = 64;
	R0 = 1;
	CALL.X (_vector);
	P4.L = .epcbss;
	P4.H = .epcbss;
.LN1:
	R7 = R7 - R7 (NS) || [P4] = R0;
.LN2:
	R4 = 64;
	P5 = 4;
.LN3:
// line 23
	R5 = 4058 /* 1086918618 */;
	R5.H = 16585 /* 1086918618 */;
	R6 = 0 /* 1075838976 */;
	R6.H = 16416 /* 1075838976 */;

.P34L2:
//-------------------------------------------------------------------
//   Loop at "..\..\src\numerical-recipes-in-c\xrealft.c" line 22 col 2
//-------------------------------------------------------------------
//   This loop executes 1 iteration of the original loop in estimated 19 cycles.
//   (cycle count 19 excludes the cost of the inner function calls and it includes 4 stalls)
//-------------------------------------------------------------------
//   This loop's resource usage is:
//     Group 1             used  15 out of   19 ( 78.9%)
//     16-bit Instruction  used  28 out of   38 ( 73.7%)
//     32-bit Instruction  used  13 out of   19 ( 68.4%)
//     Store               used   1 out of   19 (  5.3%)
//-------------------------------------------------------------------
// This loop was not modulo scheduled because it contains calls or volatile operations.
//-------------------------------------------------------------------
	// -- 4 stalls --
	R0 = R7;
	CALL.X (___int32_to_float32);           // instruction is implemented as a library call. 
	R1 = R5;
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	R1 = R6;
	CALL.X (___float32_div);                // float division is implemented as a library call. 
.LN4:
	CALL.X (__cosf);
.LN5:
	P1 = [P4];
	R4 += -1;
	CC = R4 == 0;
	R7 += 1;
	P1 = P1 + P5;
	[P1] = R0;
	P5 += 4;
	if !CC jump .P34L2 (bp);

.P34L7:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------
.LN6:
// line 25
	SP += 12;
	P0 = [FP + 4];
	(R7:4, P5:4) = [SP++];
	UNLINK;
	// -- stall --
	JUMP (P0);
.LN._setup_real_fft.end:
._setup_real_fft.end:
	.global _setup_real_fft;
	.type _setup_real_fft,STT_FUNC;

	.align 4;
_original_realfft_test_function:
.LN_original_realfft_test_function:
	.reference _data;
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 12 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,P0-P1}
//   Call preserved registers used:{FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,I0-I3,B0-B3,M0-M3,A0.W,A0.X,A1.W,A1.X,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
// line "..\..\src\numerical-recipes-in-c\xrealft.c":27
	LINK 12;
	.align 2
	P1.L = .epcbss;
	P1.H = .epcbss;
.LN7:
// line 37
	R0 = [P1];
.LN8:
	R2 = 1;
	R1 = 32;
	CALL.X (_four1);
.LN9:
// line 75
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);
.LN._original_realfft_test_function.end:
._original_realfft_test_function.end:
	.global _original_realfft_test_function;
	.type _original_realfft_test_function,STT_FUNC;

	.file_attr ProjectName="CoreA";
	.file_attr FuncName="_setup_real_fft";
	.file_attr FuncName="_original_realfft_test_function";
	.file_attr Content="CodeData";
.epctext.end:

	.extern _vector;
	.type _vector,STT_FUNC;
	.extern ___int32_to_float32;
	.type ___int32_to_float32,STT_FUNC;
	.extern ___float32_mul;
	.type ___float32_mul,STT_FUNC;
	.extern ___float32_div;
	.type ___float32_div,STT_FUNC;
	.extern __cosf;
	.type __cosf,STT_FUNC;
	.extern _four1;
	.type _four1,STT_FUNC;

	.section/ZERO_INIT/DOUBLE32 bsz;

	.align 4;
.epcbss:
	.type .epcbss,STT_OBJECT;
	.byte _data[4];
	.global _data;
	.type _data,STT_OBJECT;
.epcbss.end:

	.section .debug_abbrev SHT_DEBUGINFO;

	.align 1;
.epcabbrev:
	.type .epcabbrev,STT_OBJECT;
	.inc/binary "..\Debug\xrealft.sbn", 0, 205;
.epcabbrev.end:

	.section .debug_info SHT_DEBUGINFO;

	.align 1;
.epcdebug:
	.type .epcdebug,STT_OBJECT;
	.byte =
		0x98,0x0C,0x00,0x00,0x02,0x00;
	.byte4 = .epcabbrev;
	.byte =
		0x04,0x01,0x2E,0x2E,0x5C,0x2E,0x2E,0x5C,0x73,0x72,0x63,0x5C,
		0x6E,0x75,0x6D,0x65,0x72,0x69,0x63,0x61,0x6C,0x2D,0x72,0x65,
		0x63,0x69,0x70,0x65,0x73,0x2D,0x69,0x6E,0x2D,0x63,0x5C,0x78,
		0x72,0x65,0x61,0x6C,0x66,0x74,0x2E,0x63,0x00,0x01;
	.byte4 = .epcline;
	.inc/binary "..\Debug\xrealft.sbn", 205, 2697;
	.byte4 = .LN_setup_real_fft;
	.byte4 = .LN._setup_real_fft.end;
	.byte =
		0x01,0x01,0x00,0x0E,0x00,0x00,0x00,0x00;
	.byte4 = .LN0;
	.byte4 = .LN._setup_real_fft.end;
	.byte =
		0x00,0x00,0x0D,0x1E,0x0B,0x00,0x00,0x6F,0x72,0x69,0x67,0x69,
		0x6E,0x61,0x6C,0x5F,0x72,0x65,0x61,0x6C,0x66,0x66,0x74,0x5F,
		0x74,0x65,0x73,0x74,0x5F,0x66,0x75,0x6E,0x63,0x74,0x69,0x6F,
		0x6E,0x00,0x01;
	.byte4 = .LN_original_realfft_test_function;
	.byte4 = .LN._original_realfft_test_function.end;
	.byte =
		0x01,0x01,0x00,0x0E,0x00,0x00,0x00,0x00;
	.byte4 = .LN7;
	.byte4 = .LN._original_realfft_test_function.end;
	.inc/binary "..\Debug\xrealft.sbn", 2902, 368;
	.byte4 = _data;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x04,0x00,0x51,0x02,0x00,0x00,0x00;
.epcdebug.end:

	.section .debug_line SHT_DEBUGINFO;

	.align 1;
.epcline:
	.type .epcline,STT_OBJECT;
	.inc/binary "..\Debug\xrealft.sbn", 3270, 2451;
	.byte4 = .LN_setup_real_fft;
	.byte =
		0x04,0x01,0x05,0x1B,0x19,0x00,0x05,0x02;
	.byte4 = .LN0;
	.byte =
		0x05,0x0D,0x0C,0x00,0x05,0x02;
	.byte4 = .LN1;
	.byte =
		0x05,0x02,0x01,0x00,0x05,0x02;
	.byte4 = .LN2;
	.byte =
		0x05,0x0D,0x01,0x00,0x05,0x02;
	.byte4 = .LN3;
	.byte =
		0x05,0x03,0x0C,0x00,0x05,0x02;
	.byte4 = .LN4;
	.byte =
		0x05,0x0E,0x01,0x00,0x05,0x02;
	.byte4 = .LN5;
	.byte =
		0x05,0x03,0x01,0x00,0x05,0x02;
	.byte4 = .LN6;
	.byte =
		0x05,0x01,0x0B,0x00,0x05,0x02;
	.byte4 = .LN._setup_real_fft.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_original_realfft_test_function;
	.byte =
		0x04,0x01,0x05,0x2B,0x23,0x00,0x05,0x02;
	.byte4 = .LN7;
	.byte =
		0x05,0x03,0x13,0x00,0x05,0x02;
	.byte4 = .LN8;
	.byte =
		0x05,0x08,0x01,0x00,0x05,0x02;
	.byte4 = .LN9;
	.byte =
		0x05,0x01,0x2F,0x00,0x05,0x02;
	.byte4 = .LN._original_realfft_test_function.end;
	.byte =
		0x00,0x01,0x01;
.epcline.end:

	.section .annotations SHT_DEBUGINFO;

	.align 1;
.epcannot:
	.type .epcannot,STT_OBJECT;
	.inc/binary "..\Debug\xrealft.sbn", 5721, 2188;
.epcannot.end:

	.section .debug_pubnames SHT_DEBUGINFO;

	.align 1;
.epcpubnames:
	.type .epcpubnames,STT_OBJECT;
	.byte =
		0x4D,0x00,0x00,0x00,0x02,0x00;
	.byte4 = .epcdebug;
	.byte =
		0x9C,0x0C,0x00,0x00,0xB0,0x0A,0x00,0x00,0x73,0x65,0x74,0x75,
		0x70,0x5F,0x72,0x65,0x61,0x6C,0x5F,0x66,0x66,0x74,0x00,0xDF,
		0x0A,0x00,0x00,0x6F,0x72,0x69,0x67,0x69,0x6E,0x61,0x6C,0x5F,
		0x72,0x65,0x61,0x6C,0x66,0x66,0x74,0x5F,0x74,0x65,0x73,0x74,
		0x5F,0x66,0x75,0x6E,0x63,0x74,0x69,0x6F,0x6E,0x00,0x7F,0x0C,
		0x00,0x00,0x64,0x61,0x74,0x61,0x00,0x00,0x00,0x00,0x00;
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
	.byte4 = .LN_setup_real_fft;
	.byte4 = .LN._setup_real_fft.end-.LN_setup_real_fft;
	.byte4 = .LN_original_realfft_test_function;
	.byte4 = .LN._original_realfft_test_function.end-.LN_original_realfft_test_function;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00;
.epcaranges.end:
