	.file ".\waveform0.c";
//  Compilation time: Wed Jan 20 22:50:36 2010

//  Compiler options: -c -file-attr ProjectName=CoreA -O -Ov100 -g -save-temps -path-output ..\Debug -structs-do-not-overlap -no-multiline -double-size-32 -decls-strong -warn-protos -proc ADSP-BF561 -o ..\Debug\waveform0.doj -MM
//  Architecture: ADSP-BF561
//  Silicon revision: 0.5
//  Anomalies summary:
//   Disabled: w05_00_0046,w05_00_0048,w05_00_0054,w05_00_0071,w05_00_0103,w05_00_0104,w05_00_0157,w05_00_0164,w05_00_0165,w05_00_0195,w05_00_0198,w05_00_0202,w05_00_0209,w05_00_0227,w05_00_0244,w05_00_0245,w05_00_0246,w05_00_0248,w05_00_0257,w05_00_0262,w05_00_0264,w05_00_0283,wF3_F_021,wF3_F_008_F3_F_013,w05_00_0311
//   Enabled: w05_00_0120,w05_00_0127,w05_00_0189,w05_00_0312
//   Always on: w05_00_0074,w05_00_0122

	.section/DOUBLE32 program;

.epctext:
	.file_attr ProjectName="CoreA";
	.file_attr Content="VarData";

	.section/DOUBLE32 data1;

	.align 2;
.epcdata:
	.type .epcdata,STT_OBJECT;
	.byte _noise[2];
	.global _noise;
	.type _noise,STT_OBJECT;
.epcdata.end:

	.section .debug_abbrev SHT_DEBUGINFO;

	.align 1;
.epcabbrev:
	.type .epcabbrev,STT_OBJECT;
	.byte =
		0x01,0x11,0x01,0x03,0x08,0x13,0x0B,0x10,0x06,0x43,0x06,0x1B,
		0x08,0x25,0x08,0x42,0x0B,0x00,0x00,0x02,0x24,0x00,0x03,0x08,
		0x3E,0x0B,0x0B,0x0F,0x00,0x00,0x03,0x34,0x00,0x03,0x08,0x32,
		0x0B,0x49,0x13,0x02,0x09,0x2C,0x06,0x3F,0x0C,0x00,0x00,0x04,
		0x01,0x01,0x01,0x13,0x49,0x13,0x00,0x00,0x05,0x21,0x00,0x37,
		0x0F,0x22,0x0F,0x2F,0x0F,0x00,0x00,0x00;
.epcabbrev.end:

	.section .debug_info SHT_DEBUGINFO;

	.align 1;
.epcdebug:
	.type .epcdebug,STT_OBJECT;
	.byte =
		0x9D,0x02,0x00,0x00,0x02,0x00;
	.byte4 = .epcabbrev;
	.byte =
		0x04,0x01,0x2E,0x5C,0x77,0x61,0x76,0x65,0x66,0x6F,0x72,0x6D,
		0x30,0x2E,0x63,0x00,0x01;
	.byte4 = .epcline;
	.inc/binary "..\Debug\waveform0.sbn", 0, 595;
	.byte4 = _waveform0;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x03,0x6E,0x6F,0x69,0x73,0x65,0x00,
		0x01,0x9E,0x01,0x00,0x00,0x05,0x0C;
	.byte4 = _noise;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x04,0x00,0x00,0x00,0x00,0x9E,0x01,
		0x00,0x00,0x05,0x40,0x00,0x3F,0x00,0x00;
.epcdebug.end:

	.section .debug_line SHT_DEBUGINFO;

	.align 1;
.epcline:
	.type .epcline,STT_OBJECT;
	.byte =
		0x6E,0x00,0x00,0x00,0x02,0x00,0x68,0x00,0x00,0x00,0x01,0x01,
		0x01,0xF6,0x0A,0x00,0x01,0x01,0x01,0x01,0x00,0x00,0x00,0x01,
		0x2E,0x5C,0x00,0x43,0x3A,0x5C,0x50,0x72,0x6F,0x67,0x72,0x61,
		0x6D,0x20,0x46,0x69,0x6C,0x65,0x73,0x5C,0x41,0x6E,0x61,0x6C,
		0x6F,0x67,0x20,0x44,0x65,0x76,0x69,0x63,0x65,0x73,0x5C,0x56,
		0x69,0x73,0x75,0x61,0x6C,0x44,0x53,0x50,0x20,0x35,0x2E,0x30,
		0x5C,0x42,0x6C,0x61,0x63,0x6B,0x66,0x69,0x6E,0x5C,0x69,0x6E,
		0x63,0x6C,0x75,0x64,0x65,0x00,0x00,0x2E,0x5C,0x77,0x61,0x76,
		0x65,0x66,0x6F,0x72,0x6D,0x30,0x2E,0x63,0x00,0x00,0xBA,0xAE,
		0xE9,0xD7,0x04,0xCE,0x03,0x00;
.epcline.end:

	.section .annotations SHT_DEBUGINFO;

	.align 1;
.epcannot:
	.type .epcannot,STT_OBJECT;
	.inc/binary "..\Debug\waveform0.sbn", 595, 780;
.epcannot.end:

	.section .debug_pubnames SHT_DEBUGINFO;

	.align 1;
.epcpubnames:
	.type .epcpubnames,STT_OBJECT;
	.byte =
		0x26,0x00,0x00,0x00,0x02,0x00;
	.byte4 = .epcdebug;
	.byte =
		0xA1,0x02,0x00,0x00,0x60,0x02,0x00,0x00,0x77,0x61,0x76,0x65,
		0x66,0x6F,0x72,0x6D,0x30,0x00,0x7B,0x02,0x00,0x00,0x6E,0x6F,
		0x69,0x73,0x65,0x00,0x00,0x00,0x00,0x00;
.epcpubnames.end:

	.section .debug_aranges SHT_DEBUGINFO;

	.align 1;
.epcaranges:
	.type .epcaranges,STT_OBJECT;
	.byte =
		0x14,0x00,0x00,0x00,0x02,0x00;
	.byte4 = .epcdebug;
	.byte =
		0x04,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
		0x00,0x00;
.epcaranges.end:

	.section/DOUBLE32 data1;

	.align 4;
_waveform0:
	.global _waveform0;
	.type _waveform0,STT_OBJECT;
	.inc/binary "..\Debug\waveform0.sbn", 1375, 128;
._waveform0.end:
