	.file ".\main_core_a.c";
//  Compilation time: Wed Jan 20 22:50:35 2010

//  Compiler options: -c -file-attr ProjectName=CoreA -O -Ov100 -g -save-temps -path-output ..\Debug -structs-do-not-overlap -no-multiline -double-size-32 -decls-strong -warn-protos -proc ADSP-BF561 -o ..\Debug\main_core_a.doj -MM
//  Architecture: ADSP-BF561
//  Silicon revision: 0.5
//  Anomalies summary:
//   Disabled: w05_00_0046,w05_00_0048,w05_00_0054,w05_00_0071,w05_00_0103,w05_00_0104,w05_00_0157,w05_00_0164,w05_00_0165,w05_00_0195,w05_00_0198,w05_00_0202,w05_00_0209,w05_00_0227,w05_00_0244,w05_00_0245,w05_00_0246,w05_00_0248,w05_00_0257,w05_00_0262,w05_00_0264,w05_00_0283,wF3_F_021,wF3_F_008_F3_F_013,w05_00_0311
//   Enabled: w05_00_0120,w05_00_0127,w05_00_0189,w05_00_0312
//   Always on: w05_00_0074,w05_00_0122

	.section/DOUBLE32 program;

.epctext:
	.align 4;
_check_buffers:
.LN_check_buffers:
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{P0}
//   Call preserved registers used:{FP,SP,RETS}
//-------------------------------------------------------------------
// Original Loop at ".\main_core_a.c" line 254 col 4 --  loop structure removed due to dead code elimination.
//-------------------------------------------------------------------
// Original Loop at ".\main_core_a.c" line 253 col 3 --  loop structure removed due to dead code elimination.
//-------------------------------------------------------------------
// Original Loop at ".\main_core_a.c" line 252 col 2 --  loop structure removed due to dead code elimination.
//-------------------------------------------------------------------
// line ".\main_core_a.c":247
	LINK 0;
	.align 2
.LN0:
// line 263
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);
.LN._check_buffers.end:
._check_buffers.end:
	.global _check_buffers;
	.type _check_buffers,STT_FUNC;

	.align 2;
_check_buffer:
.LN_check_buffer:
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,P0-P1,ASTAT0-ASTAT1,CC}
//   Call preserved registers used:{FP,SP,RETS}
//-------------------------------------------------------------------
.LN1:
// line ".\main_core_a.c":233
	CC = R0 == 0;
.LN2:
// line 231
	LINK 0;
	R0.H = 888;
.LN3:
// line 233
	if !CC jump .P51L3 ;

.P51L1:
.LN4:
	R0 = R1 << 8;
	R1 = R2 << 1;
	R2.L = _buffer0;
	R2.H = _buffer0;
	R0 = R2 + R0;
	R0 = R0 + R1;
	P1 = R0;
	// -- 4 stalls --
	R0.H = W[P1];

.P51L3:
.LN5:
// line 238
	R1 = R0 >> 16;
	R0 = 1589;
	CC = R1 == R0;
	R0 = 4;
	if CC jump .P51L6 ;

.P51L5:
.LN6:
// line 239
	R0 = 1365;
	CC = R1 == R0;
	R0 = 8;
	if CC jump .P51L6 ;

.P51L8:
.LN7:
// line 240
	R0 = 128;
	CC = R1 < R0;
	R0 = 16;
	if CC jump .P51L6 ;

.P51L11:
.LN8:
// line 241
	R0 = 256;
	CC = R1 < R0;
	R0 = 32;
	if CC jump .P51L6 ;

.P51L21:
.LN9:
// line 242
	R0 = 512;
	CC = R1 < R0;
	R0 = CC;
	R0 <<= 6;

.P51L6:
.LN10:
// line 244
	P0 = [FP + 4];
	UNLINK;
	R0 = R0.L (Z);
	// -- stall --
	JUMP (P0);
.LN._check_buffer.end:
._check_buffer.end:
	.global _check_buffer;
	.type _check_buffer,STT_FUNC;

	.align 4;
_clear_buffers:
.LN_clear_buffers:
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,P0-P2,I0,LC0-LC1,LT0-LT1,LB0-LB1}
//   Call preserved registers used:{P3-P5,FP,SP,RETS}
//-------------------------------------------------------------------
// line ".\main_core_a.c":217
	LINK 0;
	.align 2
	[--SP] = (P5:3);
.LN11:
// line 219
	P3 = 64;
	R0 = 2;
	P1.L = _buffer0;
	P1.H = _buffer0;
	P2 = 256;
	P0 = 32;
	R1 = 1589 /* 104138293 */;
	R1.H = 1589 /* 104138293 */;
.LN12:
// line 220
	P4 = 1800 /* -4192504 */;
	P4.H = -64 /* -4192504 */;
.LN13:
// line 227
	P5 = 1796 /* -4192508 */;
	P5.H = -64 /* -4192508 */;
.LN14:
// line 219
	LOOP .P52L2L LC1 = P3;

.P52L2:
//-------------------------------------------------------------------
//   Loop at ".\main_core_a.c" line 219 col 2
//-------------------------------------------------------------------
	LOOP_BEGIN .P52L2L;
.LN15:
// line 220
	W[P4] = R0.L;                           // Use of volatile in loops precludes optimizations. 
	I0 = P1;
.LN16:
// line 221
	LOOP .P52L5L LC0 = P0;

.P52L5:
//-------------------------------------------------------------------
//   Loop at ".\main_core_a.c" line 221 col 3
//-------------------------------------------------------------------
//   This loop executes 2 iterations of the original loop in estimated 1 cycle.
//-------------------------------------------------------------------
//   This loop's resource usage is:
//     Store               used   1 out of    1 (100.0%)
//     16-bit Instruction  used   1 out of    2 ( 50.0%)
//-------------------------------------------------------------------
//   Loop was vectorized by a factor of 2.
//-------------------------------------------------------------------
	LOOP_BEGIN .P52L5L;
.LN17:
// line 222
	[I0++] = R1;
.LN18:
// line 221
	LOOP_END .P52L5L;

.P52L13:
//-------------------------------------------------------------------
//   Part of Loop 2, depth 1
//-------------------------------------------------------------------
.LN19:
// line 227
	W[P5] = R0.L;                           // Use of volatile in loops precludes optimizations. 
	P1 = P1 + P2;
.LN20:
// line 219
	LOOP_END .P52L2L;

.P52L14:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------
.LN21:
// line 229
	P0 = [FP + 4];
	(P5:3) = [SP++];
	UNLINK;
	// -- stall --
	JUMP (P0);
.LN._clear_buffers.end:
._clear_buffers.end:
	.global _clear_buffers;
	.type _clear_buffers,STT_FUNC;

	.align 2;
_check_waveform_old:
.LN_check_waveform_old:
	.reference _waveform_b;
	.reference _waveform_a;
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,ASTAT0-ASTAT1,CC}
//   Call preserved registers used:{FP,SP,RETS}
//-------------------------------------------------------------------
.LN22:
// line ".\main_core_a.c":204
	P1 = R1;
	P2.L = _waveform_b;
	P2.H = _waveform_b;
	P0.L = _waveform_a;
	P0.H = _waveform_a;
	R1 = 97;
	CC = R0 == R1;
	P2 = P2 + (P1<<1);
	P1 = P0 + (P1<<1);
	IF !CC P1 = P2;
.LN23:
// line 202
	LINK 0;
.LN24:
// line 205
	R1 = W[P1] (Z);
.LN25:
// line 209
	R3 = 1589;
	CC = R1 == R3;
	R2 = 4;
	if CC jump .P53L6 ;

.P53L5:
.LN26:
// line 210
	R0 = 1365;
	CC = R1 == R0;
	R2 = 8;
	if CC jump .P53L6 ;

.P53L8:
.LN27:
// line 211
	R0 = 128;
	CC = R1 < R0;
	R2 = 16;
	if CC jump .P53L6 ;

.P53L11:
.LN28:
// line 212
	R0 = 256;
	CC = R1 < R0;
	R2 = 32;
	if CC jump .P53L6 ;

.P53L21:
.LN29:
// line 213
	R0 = 512;
	CC = R1 < R0;
	R0 = CC;
	R2 = R0 << 6;

.P53L6:
.LN30:
// line 214
	P0 = [FP + 4];
	UNLINK;
	R0 = R2.L (Z);
	// -- stall --
	JUMP (P0);
.LN._check_waveform_old.end:
._check_waveform_old.end:
	.global _check_waveform_old;
	.type _check_waveform_old,STT_FUNC;

	.align 2;
_check_waveform:
.LN_check_waveform:
	.reference _waveform_b;
	.reference _waveform_a;
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,ASTAT0-ASTAT1,CC}
//   Call preserved registers used:{R7.L,R7.H,FP,SP,RETS}
//-------------------------------------------------------------------
.LN31:
// line ".\main_core_a.c":185
	P1 = R1;
	P2.L = _waveform_b;
	P2.H = _waveform_b;
	P0.L = _waveform_a;
	P0.H = _waveform_a;
	R1 = 97;
	CC = R0 == R1;
	P2 = P2 + (P1<<1);
	P1 = P0 + (P1<<1);
.LN32:
// line 183
	LINK 0;
	IF !CC P1 = P2;
	[--SP] = R7;
.LN33:
// line 186
	R3 = W[P1] (Z);
	R7 = 1365;
	CC = R3 == R7;
.LN34:
// line 196
	R2 = 1550;
	R0 = CC;
	CC = R2 <= R3;
	R1 = R0 << 2;
	if !CC jump .P54L13 ;

.P54L14:
	R0 = 1700;
	CC = R3 < R0;
	R0 = R1;
	BITSET(R1, 4);
	IF CC R0 = R1;
	R1 = R0;

.P54L13:
.LN35:
// line 197
	R7 = 1400;
	CC = R7 <= R3;
	if !CC jump .P54L17 ;

.P54L18:
	CC = R3 < R2;
	R0 = R1;
	BITSET(R1, 5);
	IF CC R0 = R1;
	R1 = R0;

.P54L17:
.LN36:
// line 198
	R0 = 1300;
	CC = R0 <= R3;
	if !CC jump .P54L21 ;

.P54L22:
	CC = R3 < R7;
	R0 = R1;
	BITSET(R1, 6);
	IF CC R0 = R1;
	R1 = R0;

.P54L21:
.LN37:
// line 199
	P0 = [FP + 4];
	R7 = [SP++];
	UNLINK;
	R0 = R1.L (Z);
	JUMP (P0);
.LN._check_waveform.end:
._check_waveform.end:
	.global _check_waveform;
	.type _check_waveform,STT_FUNC;

	.align 4;
_main:
.LN_main:
	.reference _clear_buffers;
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,P0-P1,ASTAT0-ASTAT1,LC0,LT0,LB0}
//   Call preserved registers used:{R4.L,R4.H,R5.L,R5.H,R6.L,R6.H,R7.L,R7.H,P3-P5,FP,SP}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,I0-I3,B0-B3,M0-M3,A0.W,A0.X,A1.W,A1.X,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//Inlined in _main:
//  .\main_core_a.c:93:7'_ssync
//  .\main_core_a.c:89:7'_ssync
//  .\main_core_a.c:85:7'_ssync
//-------------------------------------------------------------------
// line ".\main_core_a.c":22
	LINK 0;
	.align 2
	[--SP] = (R7:4, P5:3);
	SP += -12;
.LN38:
// line 27
	CALL.X (_disable_interrupts_for_dma_transfers_from_fpga_via_ppi0);
.LN39:
// line 29
	R0.L = 0;
	P1 = 1792 /* -4192512 */;
	P1.H = -64 /* -4192512 */;
	R2 = R2 - R2 (NS) || W[P1] = R0.L;
	R1 = -1;
.LN40:
// line 30
	P1 = 1840 /* -4192464 */;
	P1.H = -64 /* -4192464 */;
	R1 = R1 - R1 (NS) || W[P1] = R1.L;
	P1.L = _number_of_unprocessed_waveforms;
	P1.H = _number_of_unprocessed_waveforms;
.LN41:
// line 32
	R6 = R6 - R6 (NS) || [P1] = R2;
.LN42:
// line 33
	R7 = 1;
	P1.L = _waveform_transfers_from_fpga_are_allowed;
	P1.H = _waveform_transfers_from_fpga_are_allowed;
	W[P1] = R7.L;
	P1.L = _waveform_transfers_from_fpga_are_desired;
	P1.H = _waveform_transfers_from_fpga_are_desired;
.LN43:
// line 34
	W[P1] = R0.L;
	P1.L = _index_of_next_waveform_to_process;
	P1.H = _index_of_next_waveform_to_process;
.LN44:
// line 35
	[P1] = R2;
	P1.L = _initialized;
	P1.H = _initialized;
.LN45:
// line 37
	W[P1] = R7.L;
.LN46:
// line 62
	R0 = 32;
	R2 = 5;
	CALL.X (_setup_PLL);
.LN47:
// line 73
	R0 = 0 /* 1097859072 */;
	R0.H = 16752 /* 1097859072 */;
	CALL.X (_delay_ms);
.LN48:
// line 77
	R0 = 512;
	CALL.X (_init_fit);
.LN49:
// line 78
	CALL.X (_setup_real_fft);
.LN50:
// line 79
	CALL.X (_ad_fft_init);
	P0.L = _y_fixed;
	P0.H = _y_fixed;
.LN51:
// line 82
	R0 = 0 /* 1088421888 */;
	R0.H = 16608 /* 1088421888 */;
.LN52:
// line 81
	P1 = 512;
	[SP + 52] = P0;
.LN53:
// line 82
	[SP + 48] = R0;
	R5 = 7;
	P5 = 0;
	R4 = 0 /* 1077936128 */;
	R4.H = 16448 /* 1077936128 */;
	P4.L = _y_floating;
	P4.H = _y_floating;
.LN54:
// line 81
	LOOP .P55L5L LC0 = P1;

.P55L5:
//-------------------------------------------------------------------
//   Loop at ".\main_core_a.c" line 81 col 2
//-------------------------------------------------------------------
//   This loop executes 1 iteration of the original loop in estimated 18 cycles.
//   (cycle count 18 excludes the cost of the inner function calls and it includes 4 stalls)
//-------------------------------------------------------------------
//   This loop's resource usage is:
//     Group 1             used  14 out of   18 ( 77.8%)
//     16-bit Instruction  used  22 out of   36 ( 61.1%)
//     32-bit Instruction  used  10 out of   18 ( 55.6%)
//     Store               used   2 out of   18 ( 11.1%)
//-------------------------------------------------------------------
// This loop was not modulo scheduled because it contains calls or volatile operations.
//-------------------------------------------------------------------
	LOOP_BEGIN .P55L5L;
.LN55:
// line 82
	R0 = ROT R6 BY 0 || P3 = [P4];
	CALL.X (___unsigned_int32_to_float32);  // instruction is implemented as a library call. 
	R1 = R4;
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	R6 = R6 + R7 (NS) || R1 = [SP + 48];
	CALL.X (___float32_add);                // float addition is implemented as a library call. 
.LN56:
// line 83
	P1 = [SP + 52];
.LN57:
// line 82
	P3 = P3 + P5;
	[P3] = R0;
	// -- stall --
.LN58:
// line 83
	P1 = [P1];
	// -- 3 stalls --
	P1 = P1 + P5;
	[P1] = R5;
	P5 += 4;
	R5 += 3;
.LN59:
// line 81
	LOOP_END .P55L5L;

.P55L20:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------
.LN60:
// line "C:\Program Files\Analog Devices\VisualDSP 5.0\Blackfin\include\builtins.h":3389
	.MESSAGE/SUPPRESS 5515;
		CLI R0;
	.MESSAGE/SUPPRESS 5515 FOR 1 LINES;
		SSYNC;
	.MESSAGE/RESTORE 5515;
		STI R0;
	R5 = 2;
.LN61:
// line ".\main_core_a.c":86
	P5 = 1800 /* -4192504 */;
	P5.H = -64 /* -4192504 */;
	R1 = R1 - R1 (NS) || W[P5] = R5.L;
.LN62:
// line 87
	R0 = 512;
	CALL.X (_fit_me);
.LN63:
// line 88
	P4 = 1796 /* -4192508 */;
	P4.H = -64 /* -4192508 */;
	W[P4] = R5.L;
.LN64:
// line "C:\Program Files\Analog Devices\VisualDSP 5.0\Blackfin\include\builtins.h":3389
	.MESSAGE/SUPPRESS 5515;
		CLI R0;
	.MESSAGE/SUPPRESS 5515 FOR 1 LINES;
		SSYNC;
	.MESSAGE/RESTORE 5515;
		STI R0;
	R6 = 4;
.LN65:
// line ".\main_core_a.c":90
	W[P5] = R6.L;
.LN66:
// line 91
	R1 = 1;
	R0 = 512;
	CALL.X (_fit_me);
.LN67:
// line 92
	W[P4] = R6.L;
.LN68:
// line "C:\Program Files\Analog Devices\VisualDSP 5.0\Blackfin\include\builtins.h":3389
	.MESSAGE/SUPPRESS 5515;
		CLI R0;
	.MESSAGE/SUPPRESS 5515 FOR 1 LINES;
		SSYNC;
	.MESSAGE/RESTORE 5515;
		STI R0;
	R7 = 8;
.LN69:
// line ".\main_core_a.c":94
	W[P5] = R7.L;
.LN70:
// line 95
	R1 = 2;
	R0 = 512;
	CALL.X (_fit_me);
.LN71:
// line 96
	W[P4] = R7.L;
.LN72:
// line 73
	R0 = 0 /* 1097859072 */;
	R0.H = 16752 /* 1097859072 */;
.LN73:
// line 128
	CALL.X (_delay_ms);
.LN74:
// line 130
	R7 = -13107 /* 1036831949 */;
	R7.H = 15820 /* 1036831949 */;
	R0 = R7;
	CALL.X (_delay_ms);
.LN75:
// line 131
	CALL.X (_clear_buffers);
.LN76:
// line 132
	R0 = R7;
	CALL.X (_delay_ms);
.LN77:
// line 135
	R0 = R7;
	CALL.X (_delay_ms);
.LN78:
// line 140
	CALL.X (_setup_dma_transfers_from_fpga_via_ppi0);
.LN79:
// line 141
	CALL.X (_setup_ppi_transfers_from_fpga_via_ppi0);
.LN80:
// line 142
	CALL.X (_setup_interrupts_for_dma_transfers_from_fpga_via_ppi0);
.LN81:
// line 143
	CALL.X (_setup_dma_unidirectional_burst_lengths);
.LN82:
// line 144
	CALL.X (_enable_dma_transfers_from_fpga_via_ppi0);
.LN83:
// line 145
	CALL.X (_enable_ppi_transfers_from_fpga_via_ppi0);
.LN84:
// line 146
	CALL.X (_enable_waveform_transfers_from_fpga);
.LN85:
// line 149
	R0 = 18350 /* 1038174126 */;
	R0.H = 15841 /* 1038174126 */;
	CALL.X (_delay_ms);

.P55L9:
//-------------------------------------------------------------------
//   Loop at ".\main_core_a.c" line 161 col 2
//-------------------------------------------------------------------
//   This loop executes 1 iteration of the original loop in estimated 6 cycles.
//   (cycle count 6 excludes the cost of the inner function calls and it includes 4 stalls)
//-------------------------------------------------------------------
//   This loop's resource usage is:
//     16-bit Instruction  used   4 out of   12 ( 33.3%)
//     32-bit Instruction  used   2 out of    6 ( 33.3%)
//     Group 1             used   2 out of    6 ( 33.3%)
//-------------------------------------------------------------------
// Jumps out of this loop prevent efficient hardware loop generation.
//-------------------------------------------------------------------
	// -- 4 stalls --
.LN86:
// line 163
	CALL.X (_process_another_waveform);
	jump .P55L9;
.LN._main.end:
._main.end:
	.global _main;
	.type _main,STT_FUNC;

	.align 4;
_check_for_user_software_reset_button_press:
.LN_check_for_user_software_reset_button_press:
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 12 
//   Scratch registers used:{P0,ASTAT0-ASTAT1,CC}
//   Call preserved registers used:{FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,I0-I3,B0-B3,M0-M3,A0.W,A0.X,A1.W,A1.X,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
// line ".\main_core_a.c":177
	LINK 12;
	.align 2
.LN87:
// line 178
	CALL.X (_state_of_button_pf2);
.LN88:
	CC = R0 == 0;
	if !CC jump .P74L1 ;

.P74L3:
.LN89:
// line 181
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);

	.align 4
.P74L1:
.LN90:
// line 179
	CALL.X (_software_reset);
	.align 2
	jump .P74L3;
.LN._check_for_user_software_reset_button_press.end:
._check_for_user_software_reset_button_press.end:
	.global _check_for_user_software_reset_button_press;
	.type _check_for_user_software_reset_button_press,STT_FUNC;

	.file_attr ProjectName="CoreA";
	.file_attr FuncName="_check_buffers";
	.file_attr FuncName="_check_buffer";
	.file_attr FuncName="_clear_buffers";
	.file_attr FuncName="_check_waveform_old";
	.file_attr FuncName="_check_waveform";
	.file_attr FuncName="_ssync";
	.file_attr FuncName="_main";
	.file_attr FuncName="_check_for_user_software_reset_button_press";
	.file_attr Content="CodeData";
.epctext.end:

	.extern _disable_interrupts_for_dma_transfers_from_fpga_via_ppi0;
	.type _disable_interrupts_for_dma_transfers_from_fpga_via_ppi0,STT_FUNC;
	.extern _setup_PLL;
	.type _setup_PLL,STT_FUNC;
	.extern _delay_ms;
	.type _delay_ms,STT_FUNC;
	.extern _init_fit;
	.type _init_fit,STT_FUNC;
	.extern _setup_real_fft;
	.type _setup_real_fft,STT_FUNC;
	.extern _ad_fft_init;
	.type _ad_fft_init,STT_FUNC;
	.extern ___unsigned_int32_to_float32;
	.type ___unsigned_int32_to_float32,STT_FUNC;
	.extern ___float32_mul;
	.type ___float32_mul,STT_FUNC;
	.extern ___float32_add;
	.type ___float32_add,STT_FUNC;
	.extern _fit_me;
	.type _fit_me,STT_FUNC;
	.extern _setup_dma_transfers_from_fpga_via_ppi0;
	.type _setup_dma_transfers_from_fpga_via_ppi0,STT_FUNC;
	.extern _setup_ppi_transfers_from_fpga_via_ppi0;
	.type _setup_ppi_transfers_from_fpga_via_ppi0,STT_FUNC;
	.extern _setup_interrupts_for_dma_transfers_from_fpga_via_ppi0;
	.type _setup_interrupts_for_dma_transfers_from_fpga_via_ppi0,STT_FUNC;
	.extern _setup_dma_unidirectional_burst_lengths;
	.type _setup_dma_unidirectional_burst_lengths,STT_FUNC;
	.extern _enable_dma_transfers_from_fpga_via_ppi0;
	.type _enable_dma_transfers_from_fpga_via_ppi0,STT_FUNC;
	.extern _enable_ppi_transfers_from_fpga_via_ppi0;
	.type _enable_ppi_transfers_from_fpga_via_ppi0,STT_FUNC;
	.extern _enable_waveform_transfers_from_fpga;
	.type _enable_waveform_transfers_from_fpga,STT_FUNC;
	.extern _process_another_waveform;
	.type _process_another_waveform,STT_FUNC;
	.extern _state_of_button_pf2;
	.type _state_of_button_pf2,STT_FUNC;
	.extern _software_reset;
	.type _software_reset,STT_FUNC;

	.section .debug_abbrev SHT_DEBUGINFO;

	.align 1;
.epcabbrev:
	.type .epcabbrev,STT_OBJECT;
	.inc/binary "..\Debug\main_core_a.sbn", 0, 250;
.epcabbrev.end:

	.section .debug_info SHT_DEBUGINFO;

	.align 1;
.epcdebug:
	.type .epcdebug,STT_OBJECT;
	.byte =
		0x15,0x11,0x00,0x00,0x02,0x00;
	.byte4 = .epcabbrev;
	.byte =
		0x04,0x01,0x2E,0x5C,0x6D,0x61,0x69,0x6E,0x5F,0x63,0x6F,0x72,
		0x65,0x5F,0x61,0x2E,0x63,0x00,0x01;
	.byte4 = .epcline;
	.inc/binary "..\Debug\main_core_a.sbn", 250, 3031;
	.byte4 = .LN_check_buffers;
	.byte4 = .LN._check_buffers.end;
	.byte =
		0x01,0x01,0x00,0x10,0x00,0x00,0x00,0x00;
	.byte4 = .LN0;
	.byte4 = .LN._check_buffers.end;
	.byte =
		0x00,0x00,0x11,0x43,0x0C,0x00,0x00,0x63,0x68,0x65,0x63,0x6B,
		0x5F,0x62,0x75,0x66,0x66,0x65,0x72,0x00,0x01;
	.byte4 = .LN_check_buffer;
	.byte4 = .LN._check_buffer.end;
	.byte =
		0x01,0xA0,0x01,0x00,0x00,0x01,0x00,0x10,0x00,0x00,0x00,0x00;
	.byte4 = .LN1;
	.byte4 = .LN._check_buffer.end;
	.byte =
		0x00,0x00,0x0F,0x71,0x0C,0x00,0x00,0x63,0x6C,0x65,0x61,0x72,
		0x5F,0x62,0x75,0x66,0x66,0x65,0x72,0x73,0x00,0x01;
	.byte4 = .LN_clear_buffers;
	.byte4 = .LN._clear_buffers.end;
	.byte =
		0x01,0x01,0x00,0x10,0x00,0x00,0x00,0x00;
	.byte4 = .LN11;
	.byte4 = .LN._clear_buffers.end;
	.byte =
		0x00,0x00,0x11,0xA8,0x0C,0x00,0x00,0x63,0x68,0x65,0x63,0x6B,
		0x5F,0x77,0x61,0x76,0x65,0x66,0x6F,0x72,0x6D,0x5F,0x6F,0x6C,
		0x64,0x00,0x01;
	.byte4 = .LN_check_waveform_old;
	.byte4 = .LN._check_waveform_old.end;
	.byte =
		0x01,0xA0,0x01,0x00,0x00,0x01,0x00,0x10,0x00,0x00,0x00,0x00;
	.byte4 = .LN22;
	.byte4 = .LN._check_waveform_old.end;
	.byte =
		0x00,0x00,0x11,0xDB,0x0C,0x00,0x00,0x63,0x68,0x65,0x63,0x6B,
		0x5F,0x77,0x61,0x76,0x65,0x66,0x6F,0x72,0x6D,0x00,0x01;
	.byte4 = .LN_check_waveform;
	.byte4 = .LN._check_waveform.end;
	.byte =
		0x01,0xA0,0x01,0x00,0x00,0x01,0x00,0x10,0x00,0x00,0x00,0x00;
	.byte4 = .LN31;
	.byte4 = .LN._check_waveform.end;
	.byte =
		0x00,0x00,0x11,0x04,0x0D,0x00,0x00,0x6D,0x61,0x69,0x6E,0x00,
		0x01;
	.byte4 = .LN_main;
	.byte4 = .LN._main.end;
	.byte =
		0x01,0xB2,0x01,0x00,0x00,0x01,0x00,0x10,0x00,0x00,0x00,0x00;
	.byte4 = .LN38;
	.byte4 = .LN._main.end;
	.byte =
		0x00,0x00,0x0F,0x4F,0x0D,0x00,0x00,0x63,0x68,0x65,0x63,0x6B,
		0x5F,0x66,0x6F,0x72,0x5F,0x75,0x73,0x65,0x72,0x5F,0x73,0x6F,
		0x66,0x74,0x77,0x61,0x72,0x65,0x5F,0x72,0x65,0x73,0x65,0x74,
		0x5F,0x62,0x75,0x74,0x74,0x6F,0x6E,0x5F,0x70,0x72,0x65,0x73,
		0x73,0x00,0x01;
	.byte4 = .LN_check_for_user_software_reset_button_press;
	.byte4 = .LN._check_for_user_software_reset_button_press.end;
	.byte =
		0x01,0x01,0x00,0x10,0x00,0x00,0x00,0x00;
	.byte4 = .LN87;
	.byte4 = .LN._check_for_user_software_reset_button_press.end;
	.byte =
		0x00,0x00,0x12,0x6E,0x75,0x6D,0x62,0x65,0x72,0x5F,0x6F,0x66,
		0x5F,0x75,0x6E,0x70,0x72,0x6F,0x63,0x65,0x73,0x73,0x65,0x64,
		0x5F,0x77,0x61,0x76,0x65,0x66,0x6F,0x72,0x6D,0x73,0x00,0x01,
		0xEE,0x01,0x00,0x00,0x05,0x0C;
	.byte4 = _number_of_unprocessed_waveforms;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x12,0x77,0x61,0x76,0x65,0x66,0x6F,
		0x72,0x6D,0x5F,0x74,0x72,0x61,0x6E,0x73,0x66,0x65,0x72,0x73,
		0x5F,0x66,0x72,0x6F,0x6D,0x5F,0x66,0x70,0x67,0x61,0x5F,0x61,
		0x72,0x65,0x5F,0x61,0x6C,0x6C,0x6F,0x77,0x65,0x64,0x00,0x01,
		0xA0,0x01,0x00,0x00,0x05,0x0C;
	.byte4 = _waveform_transfers_from_fpga_are_allowed;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x12,0x77,0x61,0x76,0x65,0x66,0x6F,
		0x72,0x6D,0x5F,0x74,0x72,0x61,0x6E,0x73,0x66,0x65,0x72,0x73,
		0x5F,0x66,0x72,0x6F,0x6D,0x5F,0x66,0x70,0x67,0x61,0x5F,0x61,
		0x72,0x65,0x5F,0x64,0x65,0x73,0x69,0x72,0x65,0x64,0x00,0x01,
		0xA0,0x01,0x00,0x00,0x05,0x0C;
	.byte4 = _waveform_transfers_from_fpga_are_desired;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x12,0x69,0x6E,0x64,0x65,0x78,0x5F,
		0x6F,0x66,0x5F,0x6E,0x65,0x78,0x74,0x5F,0x77,0x61,0x76,0x65,
		0x66,0x6F,0x72,0x6D,0x5F,0x74,0x6F,0x5F,0x70,0x72,0x6F,0x63,
		0x65,0x73,0x73,0x00,0x01,0xEE,0x01,0x00,0x00,0x05,0x0C;
	.byte4 = _index_of_next_waveform_to_process;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x12,0x62,0x75,0x66,0x66,0x65,0x72,
		0x30,0x00,0x01,0x0A,0x11,0x00,0x00,0x05,0x0C;
	.byte4 = _buffer0;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x12,0x79,0x5F,0x66,0x69,0x78,0x65,
		0x64,0x00,0x01,0xF5,0x10,0x00,0x00,0x05,0x0C;
	.byte4 = _y_fixed;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x12,0x79,0x5F,0x66,0x6C,0x6F,0x61,
		0x74,0x69,0x6E,0x67,0x00,0x01,0xEF,0x10,0x00,0x00,0x05,0x0C;
	.byte4 = _y_floating;
	.inc/binary "..\Debug\main_core_a.sbn", 3281, 378;
	.byte4 = _initialized;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x12,0x77,0x61,0x76,0x65,0x66,0x6F,
		0x72,0x6D,0x5F,0x61,0x00,0x01,0xE0,0x10,0x00,0x00,0x05,0x0C;
	.byte4 = _waveform_a;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x12,0x70,0x65,0x64,0x65,0x73,0x74,
		0x61,0x6C,0x5F,0x61,0x00,0x01,0xD2,0x10,0x00,0x00,0x05,0x0C;
	.byte4 = _pedestal_a;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x12,0x64,0x65,0x6C,0x74,0x61,0x5F,
		0x74,0x5F,0x61,0x00,0x01,0xC4,0x10,0x00,0x00,0x05,0x0C;
	.byte4 = _delta_t_a;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x12,0x77,0x61,0x76,0x65,0x66,0x6F,
		0x72,0x6D,0x5F,0x62,0x00,0x01,0xB5,0x10,0x00,0x00,0x05,0x0C;
	.byte4 = _waveform_b;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x12,0x70,0x65,0x64,0x65,0x73,0x74,
		0x61,0x6C,0x5F,0x62,0x00,0x01,0xA7,0x10,0x00,0x00,0x05,0x0C;
	.byte4 = _pedestal_b;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x12,0x64,0x65,0x6C,0x74,0x61,0x5F,
		0x74,0x5F,0x62,0x00,0x01,0x99,0x10,0x00,0x00,0x05,0x0C;
	.byte4 = _delta_t_b;
	.inc/binary "..\Debug\main_core_a.sbn", 3659, 133;
.epcdebug.end:

	.section .debug_line SHT_DEBUGINFO;

	.align 1;
.epcline:
	.type .epcline,STT_OBJECT;
	.inc/binary "..\Debug\main_core_a.sbn", 3792, 2387;
	.byte4 = .LN_check_buffers;
	.byte =
		0x04,0x01,0x05,0x1A,0x03,0xF6,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN0;
	.byte =
		0x05,0x01,0x19,0x00,0x05,0x02;
	.byte4 = .LN._check_buffers.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_check_buffer;
	.byte =
		0x04,0x01,0x05,0x63,0xEF,0x00,0x05,0x02;
	.byte4 = .LN1;
	.byte =
		0x05,0x07,0x0B,0x00,0x05,0x02;
	.byte4 = .LN2;
	.byte =
		0x05,0x63,0x03,0x7E,0x01,0x00,0x05,0x02;
	.byte4 = .LN3;
	.byte =
		0x05,0x07,0x0B,0x00,0x05,0x02;
	.byte4 = .LN4;
	.byte =
		0x05,0x13,0x01,0x00,0x05,0x02;
	.byte4 = .LN5;
	.byte =
		0x05,0x07,0x0E,0x00,0x05,0x02;
	.byte4 = .LN6;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN7;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN8;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN9;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN10;
	.byte =
		0x05,0x02,0x0B,0x00,0x05,0x02;
	.byte4 = .LN._check_buffer.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_clear_buffers;
	.byte =
		0x04,0x01,0x05,0x1A,0xE1,0x00,0x05,0x02;
	.byte4 = .LN11;
	.byte =
		0x05,0x02,0x0B,0x00,0x05,0x02;
	.byte4 = .LN12;
	.byte =
		0x05,0x03,0x0A,0x00,0x05,0x02;
	.byte4 = .LN13;
	.byte =
		0x10,0x00,0x05,0x02;
	.byte4 = .LN14;
	.byte =
		0x05,0x02,0x03,0x78,0x01,0x00,0x05,0x02;
	.byte4 = .LN15;
	.byte =
		0x05,0x03,0x0A,0x00,0x05,0x02;
	.byte4 = .LN16;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN17;
	.byte =
		0x05,0x04,0x0A,0x00,0x05,0x02;
	.byte4 = .LN18;
	.byte =
		0x05,0x03,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN19;
	.byte =
		0x0F,0x00,0x05,0x02;
	.byte4 = .LN20;
	.byte =
		0x05,0x02,0x03,0x78,0x01,0x00,0x05,0x02;
	.byte4 = .LN21;
	.byte =
		0x05,0x01,0x13,0x00,0x05,0x02;
	.byte4 = .LN._clear_buffers.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_check_waveform_old;
	.byte =
		0x04,0x01,0x05,0x5B,0xD2,0x00,0x05,0x02;
	.byte4 = .LN22;
	.byte =
		0x05,0x02,0x0B,0x00,0x05,0x02;
	.byte4 = .LN23;
	.byte =
		0x05,0x5B,0x03,0x7E,0x01,0x00,0x05,0x02;
	.byte4 = .LN24;
	.byte =
		0x05,0x03,0x0C,0x00,0x05,0x02;
	.byte4 = .LN25;
	.byte =
		0x05,0x07,0x0D,0x00,0x05,0x02;
	.byte4 = .LN26;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN27;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN28;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN29;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN30;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN._check_waveform_old.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_check_waveform;
	.byte =
		0x04,0x01,0x05,0x57,0xBF,0x00,0x05,0x02;
	.byte4 = .LN31;
	.byte =
		0x05,0x02,0x0B,0x00,0x05,0x02;
	.byte4 = .LN32;
	.byte =
		0x05,0x57,0x03,0x7E,0x01,0x00,0x05,0x02;
	.byte4 = .LN33;
	.byte =
		0x05,0x03,0x0C,0x00,0x05,0x02;
	.byte4 = .LN34;
	.byte =
		0x05,0x02,0x13,0x00,0x05,0x02;
	.byte4 = .LN35;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN36;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN37;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN._check_waveform.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_main;
	.byte =
		0x04,0x01,0x05,0x10,0x1E,0x00,0x05,0x02;
	.byte4 = .LN38;
	.byte =
		0x05,0x39,0x0E,0x00,0x05,0x02;
	.byte4 = .LN39;
	.byte =
		0x05,0x02,0x0B,0x00,0x05,0x02;
	.byte4 = .LN40;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN41;
	.byte =
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN42;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN43;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN44;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN45;
	.byte =
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN46;
	.byte =
		0x05,0x0B,0x22,0x00,0x05,0x02;
	.byte4 = .LN47;
	.byte =
		0x05,0x0A,0x14,0x00,0x05,0x02;
	.byte4 = .LN48;
	.byte =
		0x0D,0x00,0x05,0x02;
	.byte4 = .LN49;
	.byte =
		0x05,0x10,0x0A,0x00,0x05,0x02;
	.byte4 = .LN50;
	.byte =
		0x05,0x0D,0x0A,0x00,0x05,0x02;
	.byte4 = .LN51;
	.byte =
		0x05,0x03,0x0C,0x00,0x05,0x02;
	.byte4 = .LN52;
	.byte =
		0x05,0x02,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN53;
	.byte =
		0x05,0x03,0x0A,0x00,0x05,0x02;
	.byte4 = .LN54;
	.byte =
		0x05,0x02,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN55;
	.byte =
		0x05,0x03,0x0A,0x00,0x05,0x02;
	.byte4 = .LN56;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN57;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN58;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN59;
	.byte =
		0x05,0x02,0x03,0x7E,0x01,0x00,0x05,0x02;
	.byte4 = .LN60;
	.byte =
		0x04,0x0D,0x05,0x03,0x03,0xEC,0x19,0x01,0x00,0x05,0x02;
	.byte4 = .LN61;
	.byte =
		0x04,0x01,0x03,0x99,0x66,0x01,0x00,0x05,0x02;
	.byte4 = .LN62;
	.byte =
		0x05,0x08,0x0A,0x00,0x05,0x02;
	.byte4 = .LN63;
	.byte =
		0x05,0x03,0x0A,0x00,0x05,0x02;
	.byte4 = .LN64;
	.byte =
		0x04,0x0D,0x03,0xE5,0x19,0x01,0x00,0x05,0x02;
	.byte4 = .LN65;
	.byte =
		0x04,0x01,0x03,0x9D,0x66,0x01,0x00,0x05,0x02;
	.byte4 = .LN66;
	.byte =
		0x05,0x08,0x0A,0x00,0x05,0x02;
	.byte4 = .LN67;
	.byte =
		0x05,0x03,0x0A,0x00,0x05,0x02;
	.byte4 = .LN68;
	.byte =
		0x04,0x0D,0x03,0xE1,0x19,0x01,0x00,0x05,0x02;
	.byte4 = .LN69;
	.byte =
		0x04,0x01,0x03,0xA1,0x66,0x01,0x00,0x05,0x02;
	.byte4 = .LN70;
	.byte =
		0x05,0x08,0x0A,0x00,0x05,0x02;
	.byte4 = .LN71;
	.byte =
		0x05,0x03,0x0A,0x00,0x05,0x02;
	.byte4 = .LN72;
	.byte =
		0x05,0x0A,0x03,0x69,0x01,0x00,0x05,0x02;
	.byte4 = .LN73;
	.byte =
		0x40,0x00,0x05,0x02;
	.byte4 = .LN74;
	.byte =
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN75;
	.byte =
		0x05,0x0F,0x0A,0x00,0x05,0x02;
	.byte4 = .LN76;
	.byte =
		0x05,0x0A,0x0A,0x00,0x05,0x02;
	.byte4 = .LN77;
	.byte =
		0x0C,0x00,0x05,0x02;
	.byte4 = .LN78;
	.byte =
		0x05,0x28,0x0E,0x00,0x05,0x02;
	.byte4 = .LN79;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN80;
	.byte =
		0x05,0x37,0x0A,0x00,0x05,0x02;
	.byte4 = .LN81;
	.byte =
		0x05,0x28,0x0A,0x00,0x05,0x02;
	.byte4 = .LN82;
	.byte =
		0x05,0x29,0x0A,0x00,0x05,0x02;
	.byte4 = .LN83;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN84;
	.byte =
		0x05,0x25,0x0A,0x00,0x05,0x02;
	.byte4 = .LN85;
	.byte =
		0x05,0x0A,0x0C,0x00,0x05,0x02;
	.byte4 = .LN86;
	.byte =
		0x05,0x1C,0x17,0x00,0x05,0x02;
	.byte4 = .LN._main.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_check_for_user_software_reset_button_press;
	.byte =
		0x04,0x01,0x05,0x37,0xB9,0x00,0x05,0x02;
	.byte4 = .LN87;
	.byte =
		0x05,0x19,0x0A,0x00,0x05,0x02;
	.byte4 = .LN88;
	.byte =
		0x05,0x02,0x01,0x00,0x05,0x02;
	.byte4 = .LN89;
	.byte =
		0x05,0x01,0x0C,0x00,0x05,0x02;
	.byte4 = .LN90;
	.byte =
		0x05,0x11,0x03,0x7E,0x01,0x00,0x05,0x02;
	.byte4 = .LN._check_for_user_software_reset_button_press.end;
	.byte =
		0x00,0x01,0x01;
.epcline.end:

	.section .annotations SHT_DEBUGINFO;

	.align 1;
.epcannot:
	.type .epcannot,STT_OBJECT;
	.inc/binary "..\Debug\main_core_a.sbn", 6179, 3540;
.epcannot.end:

	.section .debug_pubnames SHT_DEBUGINFO;

	.align 1;
.epcpubnames:
	.type .epcpubnames,STT_OBJECT;
	.byte =
		0xFD,0x00,0x00,0x00,0x02,0x00;
	.byte4 = .epcdebug;
	.inc/binary "..\Debug\main_core_a.sbn", 9719, 247;
.epcpubnames.end:

	.section .debug_aranges SHT_DEBUGINFO;

	.align 1;
.epcaranges:
	.type .epcaranges,STT_OBJECT;
	.byte =
		0x4C,0x00,0x00,0x00,0x02,0x00;
	.byte4 = .epcdebug;
	.byte =
		0x04,0x00,0x00,0x00,0x00,0x00;
	.byte4 = .LN_check_buffers;
	.byte4 = .LN._check_buffers.end-.LN_check_buffers;
	.byte4 = .LN_check_buffer;
	.byte4 = .LN._check_buffer.end-.LN_check_buffer;
	.byte4 = .LN_clear_buffers;
	.byte4 = .LN._clear_buffers.end-.LN_clear_buffers;
	.byte4 = .LN_check_waveform_old;
	.byte4 = .LN._check_waveform_old.end-.LN_check_waveform_old;
	.byte4 = .LN_check_waveform;
	.byte4 = .LN._check_waveform.end-.LN_check_waveform;
	.byte4 = .LN_main;
	.byte4 = .LN._main.end-.LN_main;
	.byte4 = .LN_check_for_user_software_reset_button_press;
	.byte4 = .LN._check_for_user_software_reset_button_press.end-.LN_check_for_user_software_reset_button_press;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00;
.epcaranges.end:

	.section/DOUBLE32 L1_data_a;

	.align 4;
	.global _waveform_a;
	.type _waveform_a,STT_OBJECT;
	.byte _waveform_a[256];
._waveform_a.end:

	.section/ZERO_INIT/DOUBLE32 bsz;

	.align 4;
	.global _pedestal_a;
	.type _pedestal_a,STT_OBJECT;
	.byte _pedestal_a[128];
._pedestal_a.end:
	.align 4;
	.global _delta_t_a;
	.type _delta_t_a,STT_OBJECT;
	.byte _delta_t_a[128];
._delta_t_a.end:

	.section/DOUBLE32 L1_data_b;

	.align 4;
	.global _waveform_b;
	.type _waveform_b,STT_OBJECT;
	.byte _waveform_b[256];
._waveform_b.end:

	.section/ZERO_INIT/DOUBLE32 bsz;

	.align 4;
	.global _pedestal_b;
	.type _pedestal_b,STT_OBJECT;
	.byte _pedestal_b[128];
._pedestal_b.end:
	.align 4;
	.global _delta_t_b;
	.type _delta_t_b,STT_OBJECT;
	.byte _delta_t_b[128];
._delta_t_b.end:

	.section/DOUBLE32 data1;


	.extern _number_of_unprocessed_waveforms;
	.type _number_of_unprocessed_waveforms,STT_OBJECT;
	.extern _waveform_transfers_from_fpga_are_allowed;
	.type _waveform_transfers_from_fpga_are_allowed,STT_OBJECT;
	.extern _waveform_transfers_from_fpga_are_desired;
	.type _waveform_transfers_from_fpga_are_desired,STT_OBJECT;
	.extern _index_of_next_waveform_to_process;
	.type _index_of_next_waveform_to_process,STT_OBJECT;
	.extern _buffer0;
	.type _buffer0,STT_OBJECT;
	.extern _y_fixed;
	.type _y_fixed,STT_OBJECT;
	.extern _y_floating;
	.type _y_floating,STT_OBJECT;
	.extern _initialized;
	.type _initialized,STT_OBJECT;
