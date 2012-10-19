	.file "..\..\src\generic.c";
//  Compilation time: Wed Jan 20 22:50:34 2010

//  Compiler options: -c -file-attr ProjectName=CoreA -O -Ov100 -g -save-temps -path-output ..\Debug -structs-do-not-overlap -no-multiline -double-size-32 -decls-strong -warn-protos -proc ADSP-BF561 -o ..\Debug\generic.doj -MM
//  Architecture: ADSP-BF561
//  Silicon revision: 0.5
//  Anomalies summary:
//   Disabled: w05_00_0046,w05_00_0048,w05_00_0054,w05_00_0071,w05_00_0103,w05_00_0104,w05_00_0157,w05_00_0164,w05_00_0165,w05_00_0195,w05_00_0198,w05_00_0202,w05_00_0209,w05_00_0227,w05_00_0244,w05_00_0245,w05_00_0246,w05_00_0248,w05_00_0257,w05_00_0262,w05_00_0264,w05_00_0283,wF3_F_021,wF3_F_008_F3_F_013,w05_00_0311
//   Enabled: w05_00_0120,w05_00_0127,w05_00_0189,w05_00_0312
//   Always on: w05_00_0074,w05_00_0122

	.section/DOUBLE32 program;

.epctext:
	.align 4;
_delay_ms:
.LN_delay_ms:
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{P0}
//   Call preserved registers used:{FP,SP,RETS}
//-------------------------------------------------------------------
// Original Loop at "..\..\src\generic.c" line 32 col 2 --  loop structure removed due to dead code elimination.
//-------------------------------------------------------------------
// line "..\..\src\generic.c":30
	LINK 0;
	.align 2
.LN0:
// line 37
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);
.LN._delay_ms.end:
._delay_ms.end:
	.global _delay_ms;
	.type _delay_ms,STT_FUNC;

	.align 4;
_enable_core_b:
.LN_enable_core_b:
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,R0.H,P0-P1,ASTAT0-ASTAT1}
//   Call preserved registers used:{FP,SP,RETS}
//-------------------------------------------------------------------
// line "..\..\src\generic.c":15
	LINK 0;
	.align 2
.LN1:
// line 16
	P1 = 260 /* -4194044 */;
	P1.H = -64 /* -4194044 */;
	R0.L = W[P1];
	BITCLR(R0, 5);
	W[P1] = R0.L;
.LN2:
// line 17
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);
.LN._enable_core_b.end:
._enable_core_b.end:
	.global _enable_core_b;
	.type _enable_core_b,STT_FUNC;

	.align 4;
_software_reset:
.LN_software_reset:
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{P0}
//   Call preserved registers used:{FP,SP,RETS}
//-------------------------------------------------------------------
// line "..\..\src\generic.c":9
	LINK 0;
	.align 2

.LN3:
// line 12
	// ASM STATEMENT
	P2.L = 0x0000; P2.H = 0xffa0; JUMP(P2);
	// END ASM STATEMENT

.LN4:
// line 13
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);
.LN._software_reset.end:
._software_reset.end:
	.global _software_reset;
	.type _software_reset,STT_FUNC;

	.file_attr ProjectName="CoreA";
	.file_attr FuncName="_delay_ms";
	.file_attr FuncName="_enable_core_b";
	.file_attr FuncName="_software_reset";
	.file_attr Content="Code";
.epctext.end:

	.section .debug_abbrev SHT_DEBUGINFO;

	.align 1;
.epcabbrev:
	.type .epcabbrev,STT_OBJECT;
	.byte =
		0x01,0x11,0x01,0x03,0x08,0x13,0x0B,0x10,0x06,0x43,0x06,0x1B,
		0x08,0x25,0x08,0x42,0x0B,0x00,0x00,0x02,0x24,0x00,0x03,0x08,
		0x3E,0x0B,0x0B,0x0F,0x00,0x00,0x03,0x2E,0x01,0x01,0x13,0x03,
		0x08,0x32,0x0B,0x11,0x01,0x12,0x01,0x27,0x0C,0x3F,0x0C,0x20,
		0x0B,0x00,0x00,0x04,0x0B,0x01,0x01,0x13,0x11,0x01,0x12,0x01,
		0x00,0x00,0x00;
.epcabbrev.end:

	.section .debug_info SHT_DEBUGINFO;

	.align 1;
.epcdebug:
	.type .epcdebug,STT_OBJECT;
	.byte =
		0xE9,0x02,0x00,0x00,0x02,0x00;
	.byte4 = .epcabbrev;
	.byte =
		0x04,0x01,0x2E,0x2E,0x5C,0x2E,0x2E,0x5C,0x73,0x72,0x63,0x5C,
		0x67,0x65,0x6E,0x65,0x72,0x69,0x63,0x2E,0x63,0x00,0x01;
	.byte4 = .epcline;
	.inc/binary "..\Debug\generic.sbn", 0, 592;
	.byte4 = .LN_delay_ms;
	.byte4 = .LN._delay_ms.end;
	.byte =
		0x01,0x01,0x00,0x04,0x00,0x00,0x00,0x00;
	.byte4 = .LN0;
	.byte4 = .LN._delay_ms.end;
	.byte =
		0x00,0x00,0x03,0xBD,0x02,0x00,0x00,0x65,0x6E,0x61,0x62,0x6C,
		0x65,0x5F,0x63,0x6F,0x72,0x65,0x5F,0x62,0x00,0x01;
	.byte4 = .LN_enable_core_b;
	.byte4 = .LN._enable_core_b.end;
	.byte =
		0x01,0x01,0x00,0x04,0x00,0x00,0x00,0x00;
	.byte4 = .LN1;
	.byte4 = .LN._enable_core_b.end;
	.byte =
		0x00,0x00,0x03,0x00,0x00,0x00,0x00,0x73,0x6F,0x66,0x74,0x77,
		0x61,0x72,0x65,0x5F,0x72,0x65,0x73,0x65,0x74,0x00,0x01;
	.byte4 = .LN_software_reset;
	.byte4 = .LN._software_reset.end;
	.byte =
		0x01,0x01,0x00,0x04,0x00,0x00,0x00,0x00;
	.byte4 = .LN3;
	.byte4 = .LN._software_reset.end;
	.byte =
		0x00,0x00,0x00;
.epcdebug.end:

	.section .debug_line SHT_DEBUGINFO;

	.align 1;
.epcline:
	.type .epcline,STT_OBJECT;
	.inc/binary "..\Debug\generic.sbn", 592, 504;
	.byte4 = .LN_delay_ms;
	.byte =
		0x04,0x01,0x05,0x1C,0x26,0x00,0x05,0x02;
	.byte4 = .LN0;
	.byte =
		0x05,0x01,0x10,0x00,0x05,0x02;
	.byte4 = .LN._delay_ms.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_enable_core_b;
	.byte =
		0x04,0x01,0x05,0x1A,0x17,0x00,0x05,0x02;
	.byte4 = .LN1;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN2;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.byte4 = .LN._enable_core_b.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_software_reset;
	.byte =
		0x04,0x01,0x05,0x1B,0x11,0x00,0x05,0x02;
	.byte4 = .LN3;
	.byte =
		0x05,0x02,0x0C,0x00,0x05,0x02;
	.byte4 = .LN4;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.byte4 = .LN._software_reset.end;
	.byte =
		0x00,0x01,0x01;
.epcline.end:

	.section .annotations SHT_DEBUGINFO;

	.align 1;
.epcannot:
	.type .epcannot,STT_OBJECT;
	.inc/binary "..\Debug\generic.sbn", 1096, 1160;
.epcannot.end:

	.section .debug_pubnames SHT_DEBUGINFO;

	.align 1;
.epcpubnames:
	.type .epcpubnames,STT_OBJECT;
	.byte =
		0x40,0x00,0x00,0x00,0x02,0x00;
	.byte4 = .epcdebug;
	.byte =
		0xED,0x02,0x00,0x00,0x66,0x02,0x00,0x00,0x64,0x65,0x6C,0x61,
		0x79,0x5F,0x6D,0x73,0x00,0x8F,0x02,0x00,0x00,0x65,0x6E,0x61,
		0x62,0x6C,0x65,0x5F,0x63,0x6F,0x72,0x65,0x5F,0x62,0x00,0xBD,
		0x02,0x00,0x00,0x73,0x6F,0x66,0x74,0x77,0x61,0x72,0x65,0x5F,
		0x72,0x65,0x73,0x65,0x74,0x00,0x00,0x00,0x00,0x00;
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
	.byte4 = .LN_delay_ms;
	.byte4 = .LN._delay_ms.end-.LN_delay_ms;
	.byte4 = .LN_enable_core_b;
	.byte4 = .LN._enable_core_b.end-.LN_enable_core_b;
	.byte4 = .LN_software_reset;
	.byte4 = .LN._software_reset.end-.LN_software_reset;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00;
.epcaranges.end:
