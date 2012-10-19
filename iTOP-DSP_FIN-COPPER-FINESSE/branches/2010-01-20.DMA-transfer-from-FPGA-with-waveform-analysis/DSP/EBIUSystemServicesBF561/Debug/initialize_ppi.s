	.file "..\..\src\initialize_ppi.c";
//  Compilation time: Wed Jan 20 22:50:35 2010

//  Compiler options: -c -file-attr ProjectName=CoreA -O -Ov100 -g -save-temps -path-output ..\Debug -structs-do-not-overlap -no-multiline -double-size-32 -decls-strong -warn-protos -proc ADSP-BF561 -o ..\Debug\initialize_ppi.doj -MM
//  Architecture: ADSP-BF561
//  Silicon revision: 0.5
//  Anomalies summary:
//   Disabled: w05_00_0046,w05_00_0048,w05_00_0054,w05_00_0071,w05_00_0103,w05_00_0104,w05_00_0157,w05_00_0164,w05_00_0165,w05_00_0195,w05_00_0198,w05_00_0202,w05_00_0209,w05_00_0227,w05_00_0244,w05_00_0245,w05_00_0246,w05_00_0248,w05_00_0257,w05_00_0262,w05_00_0264,w05_00_0283,wF3_F_021,wF3_F_008_F3_F_013,w05_00_0311
//   Enabled: w05_00_0120,w05_00_0127,w05_00_0189,w05_00_0312
//   Always on: w05_00_0074,w05_00_0122

	.section/DOUBLE32 program;

.epctext:
	.align 4;
_state_of_ppi1_flag_pf15:
.LN_state_of_ppi1_flag_pf15:
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,P0-P1,ASTAT0-ASTAT1}
//   Call preserved registers used:{FP,SP,RETS}
//-------------------------------------------------------------------
// line "..\..\src\initialize_ppi.c":18
	LINK 0;
	.align 2
.LN0:
// line 19
	P1 = 1792 /* -4192512 */;
	P1.H = -64 /* -4192512 */;
	R0.L = W[P1];
	P0 = [FP + 4];
	R1 = -32768;
	R0 = R0 & R1;
	UNLINK;
	R0 = R0.L (Z);
	JUMP (P0);
.LN._state_of_ppi1_flag_pf15.end:
._state_of_ppi1_flag_pf15.end:
	.global _state_of_ppi1_flag_pf15;
	.type _state_of_ppi1_flag_pf15,STT_FUNC;

	.align 4;
_setup_programmable_flags_for_ppi1:
.LN_setup_programmable_flags_for_ppi1:
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,R0.H,P0-P1,ASTAT0-ASTAT1}
//   Call preserved registers used:{FP,SP,RETS}
//-------------------------------------------------------------------
// line "..\..\src\initialize_ppi.c":7
	LINK 0;
	.align 2
.LN1:
// line 9
	P1 = 1840 /* -4192464 */;
	P1.H = -64 /* -4192464 */;
	R0.L = W[P1];
	BITSET(R0, 14);
	W[P1] = R0.L;
.LN2:
// line 11
	R0.L = W[P1];
	BITCLR(R0, 15);
	W[P1] = R0.L;
.LN3:
// line 12
	P1 = 1844 /* -4192460 */;
	P1.H = -64 /* -4192460 */;
	R0.L = W[P1];
	BITCLR(R0, 15);
	W[P1] = R0.L;
.LN4:
// line 13
	P1 = 1848 /* -4192456 */;
	P1.H = -64 /* -4192456 */;
	R0.L = W[P1];
	BITCLR(R0, 15);
	W[P1] = R0.L;
.LN5:
// line 14
	P1 = 1852 /* -4192452 */;
	P1.H = -64 /* -4192452 */;
	R0.L = W[P1];
	BITCLR(R0, 15);
	W[P1] = R0.L;
.LN6:
// line 15
	P1 = 1856 /* -4192448 */;
	P1.H = -64 /* -4192448 */;
	R0.L = W[P1];
	BITSET(R0, 15);
	W[P1] = R0.L;
.LN7:
// line 16
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);
.LN._setup_programmable_flags_for_ppi1.end:
._setup_programmable_flags_for_ppi1.end:
	.global _setup_programmable_flags_for_ppi1;
	.type _setup_programmable_flags_for_ppi1,STT_FUNC;

	.file_attr ProjectName="CoreA";
	.file_attr FuncName="_state_of_ppi1_flag_pf15";
	.file_attr FuncName="_setup_programmable_flags_for_ppi1";
	.file_attr Content="Code";
.epctext.end:

	.section .debug_abbrev SHT_DEBUGINFO;

	.align 1;
.epcabbrev:
	.type .epcabbrev,STT_OBJECT;
	.inc/binary "..\Debug\initialize_ppi.sbn", 0, 163;
.epcabbrev.end:

	.section .debug_info SHT_DEBUGINFO;

	.align 1;
.epcdebug:
	.type .epcdebug,STT_OBJECT;
	.byte =
		0x83,0x05,0x00,0x00,0x02,0x00;
	.byte4 = .epcabbrev;
	.byte =
		0x04,0x01,0x2E,0x2E,0x5C,0x2E,0x2E,0x5C,0x73,0x72,0x63,0x5C,
		0x69,0x6E,0x69,0x74,0x69,0x61,0x6C,0x69,0x7A,0x65,0x5F,0x70,
		0x70,0x69,0x2E,0x63,0x00,0x01;
	.byte4 = .epcline;
	.inc/binary "..\Debug\initialize_ppi.sbn", 163, 1274;
	.byte4 = .LN_state_of_ppi1_flag_pf15;
	.byte4 = .LN._state_of_ppi1_flag_pf15.end;
	.byte =
		0x01,0xAB,0x01,0x00,0x00,0x01,0x00,0x0B,0x00,0x00,0x00,0x00;
	.byte4 = .LN0;
	.byte4 = .LN._state_of_ppi1_flag_pf15.end;
	.byte =
		0x00,0x00,0x0C,0x00,0x00,0x00,0x00,0x73,0x65,0x74,0x75,0x70,
		0x5F,0x70,0x72,0x6F,0x67,0x72,0x61,0x6D,0x6D,0x61,0x62,0x6C,
		0x65,0x5F,0x66,0x6C,0x61,0x67,0x73,0x5F,0x66,0x6F,0x72,0x5F,
		0x70,0x70,0x69,0x31,0x00,0x01;
	.byte4 = .LN_setup_programmable_flags_for_ppi1;
	.byte4 = .LN._setup_programmable_flags_for_ppi1.end;
	.byte =
		0x01,0x01,0x00,0x0B,0x00,0x00,0x00,0x00;
	.byte4 = .LN1;
	.byte4 = .LN._setup_programmable_flags_for_ppi1.end;
	.byte =
		0x00,0x00,0x00;
.epcdebug.end:

	.section .debug_line SHT_DEBUGINFO;

	.align 1;
.epcline:
	.type .epcline,STT_OBJECT;
	.inc/binary "..\Debug\initialize_ppi.sbn", 1437, 1454;
	.byte4 = .LN_state_of_ppi1_flag_pf15;
	.byte =
		0x04,0x01,0x05,0x32,0x1A,0x00,0x05,0x02;
	.byte4 = .LN0;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN._state_of_ppi1_flag_pf15.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_setup_programmable_flags_for_ppi1;
	.byte =
		0x04,0x01,0x05,0x2E,0x0F,0x00,0x05,0x02;
	.byte4 = .LN1;
	.byte =
		0x05,0x02,0x0B,0x00,0x05,0x02;
	.byte4 = .LN2;
	.byte =
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN3;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN4;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN5;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN6;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN7;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.byte4 = .LN._setup_programmable_flags_for_ppi1.end;
	.byte =
		0x00,0x01,0x01;
.epcline.end:

	.section .annotations SHT_DEBUGINFO;

	.align 1;
.epcannot:
	.type .epcannot,STT_OBJECT;
	.inc/binary "..\Debug\initialize_ppi.sbn", 2891, 1076;
.epcannot.end:

	.section .debug_pubnames SHT_DEBUGINFO;

	.align 1;
.epcpubnames:
	.type .epcpubnames,STT_OBJECT;
	.byte =
		0x50,0x00,0x00,0x00,0x02,0x00;
	.byte4 = .epcdebug;
	.byte =
		0x87,0x05,0x00,0x00,0x08,0x05,0x00,0x00,0x73,0x74,0x61,0x74,
		0x65,0x5F,0x6F,0x66,0x5F,0x70,0x70,0x69,0x31,0x5F,0x66,0x6C,
		0x61,0x67,0x5F,0x70,0x66,0x31,0x35,0x00,0x44,0x05,0x00,0x00,
		0x73,0x65,0x74,0x75,0x70,0x5F,0x70,0x72,0x6F,0x67,0x72,0x61,
		0x6D,0x6D,0x61,0x62,0x6C,0x65,0x5F,0x66,0x6C,0x61,0x67,0x73,
		0x5F,0x66,0x6F,0x72,0x5F,0x70,0x70,0x69,0x31,0x00,0x00,0x00,
		0x00,0x00;
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
	.byte4 = .LN_state_of_ppi1_flag_pf15;
	.byte4 = .LN._state_of_ppi1_flag_pf15.end-.LN_state_of_ppi1_flag_pf15;
	.byte4 = .LN_setup_programmable_flags_for_ppi1;
	.byte4 = .LN._setup_programmable_flags_for_ppi1.end-.LN_setup_programmable_flags_for_ppi1;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00;
.epcaranges.end:
