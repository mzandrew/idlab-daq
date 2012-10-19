	.file "..\..\src\dsp-fin-process-waveform.c";
//  Compilation time: Thu Nov 05 19:09:29 2009

//  Compiler options: -c -file-attr ProjectName=CoreA -O -Ov100 -g -save-temps -path-output .\Debug -structs-do-not-overlap -no-multiline -double-size-32 -decls-strong -warn-protos -si-revision 0.5 -proc ADSP-BF561 -o .\Debug\dsp-fin-process-waveform.doj -MM
//  Architecture: ADSP-BF561
//  Silicon revision: 0.5
//  Anomalies summary:
//   Disabled: w05_00_0046,w05_00_0048,w05_00_0054,w05_00_0071,w05_00_0103,w05_00_0104,w05_00_0157,w05_00_0164,w05_00_0165,w05_00_0195,w05_00_0198,w05_00_0202,w05_00_0209,w05_00_0227,w05_00_0244,w05_00_0246,w05_00_0248,w05_00_0257,w05_00_0262,w05_00_0264,wF3_F_021,wF3_F_008_F3_F_013,w05_00_0311
//   Enabled: w05_00_0120,w05_00_0127,w05_00_0189,w05_00_0245,w05_00_0283,w05_00_0312,w05_00_0371,w05_00_0428,w05_00_0426,w05_00_0443,w05_00_0412
//   Always on: w05_00_0074,w05_00_0122

	.section/DOUBLE32 program;

.epctext:
	.align 4;
_fixed_point_fit_data_to_straight_line:
.LN_fixed_point_fit_data_to_straight_line:
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 32 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,ASTAT0-ASTAT1,CC,LC0,LT0,LB0}
//   Call preserved registers used:{R4.L,R4.H,R5.L,R5.H,R6.L,R6.H,R7.L,R7.H,P4-P5,FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,ASTAT0-ASTAT1,CC,AQ,LC0,LT0,LB0,RETS}
//-------------------------------------------------------------------
// line "..\..\src\dsp-fin-process-waveform.c":273
	LINK 0;
	.align 2
	[--SP] = (R7:4, P5:4);
	R6 = R0;
	SP += -12;
	R0 = 0;
.LN0:
// line 284
	CC = R6 == 0;
	R7 = R7 - R7 (NS) || [SP + 44] = R0;
	P5.L = _y_fixed;
	P5.H = _y_fixed;
	P4.L = _x_fixed;
	P4.H = _x_fixed;
	if CC jump .P39L3 ;

.P39L10:
	P1 = R6;
	NOP;                                    // Inserted 2 instrs to fix anomaly w05_00_0245_with_boundaries. 
	NOP;
.LN1:
// line 285
	R1 = R1 - R1 (NS) || P2 = [P4];
.LN2:
// line 286
	P0 = [P5];
	// -- 2 stalls --
	P1 += -1;
	CC = P1 == 0;
.LN3:
// line 285
	R2 = [P2++];
	R7 = R1 + R2 (NS) || R1 = [P0++];
	if CC jump .P39L24 ;
	NOP;                                    // Inserted 2 instrs to fix anomaly w05_00_0428. 
	NOP;

.P39L26:
	LOOP .P39L25L LC0 = P1;

.P39L25:
//-------------------------------------------------------------------
//   Loop at "..\..\src\dsp-fin-process-waveform.c" line 284 col 2
//-------------------------------------------------------------------
//   This loop executes 1 iteration of the original loop in estimated 2 cycles.
//-------------------------------------------------------------------
//   Unknown Trip Count
//   Successfully found modulo schedule with:
//     Initiation Interval (II)                                  = 2
//     Stage Count (SC)                                          = 2
//     MVE Unroll Factor                                         = 1
//     Minimum initiation interval due to recurrences (rec MII)  = 0
//     Minimum initiation interval due to resources (res MII)    = 2.00
//-------------------------------------------------------------------
//   This loop's resource usage is:
//     32-bit Instruction  used   2 out of    2 (100.0%)
//     Group 1             used   2 out of    2 (100.0%)
//     16-bit Instruction  used   2 out of    4 ( 50.0%)
//-------------------------------------------------------------------
	LOOP_BEGIN .P39L25L;
.LN4:
// line 286
	R0 = R0 + R1 (NS) || R1 = [P2++];
.LN5:
// line 285
	R7 = R7 + R1 (NS) || R1 = [P0++];
.LN6:
// line 286
	LOOP_END .P39L25L;

.P39L27:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------

.P39L24:
	R0 = R0 + R1;
	[SP + 44] = R0;

.P39L3:
	R1 = R6;
.LN7:
// line 289
	R0 = R7;
	CALL.X (___udiv32);                     // division is implemented as a library call. 
	R2 = R0;
.LN8:
// line 290
	CC = R6 == 0;
	R1 = 0;
	R0 = 0;
	if CC jump .P39L6 ;

.P39L12:
	NOP;                                    // Inserted 3 instrs to fix anomaly w05_00_0245_with_boundaries. 
	NOP;
	NOP;
.LN9:
// line 291
	P2 = [P4];
.LN10:
// line 290
	P1 = R6;
.LN11:
// line 293
	R5 = R5 - R5 (NS) || P0 = [P5];
	// -- stall --
.LN12:
// line 291
	R0 = [P2++];
	R0 = R0 - R2;
	P1 += -1;
	CC = P1 == 0;
.LN13:
// line 293
	R3 = [P0++];
	R3 *= R0;
.LN14:
// line 292
	R0 *= R0;
	if CC jump .P39L18 ;
	NOP;                                    // Inserted 2 instrs to fix anomaly w05_00_0428. 
	NOP;

.P39L20:
	LOOP .P39L19L LC0 = P1;

.P39L19:
//-------------------------------------------------------------------
//   Loop at "..\..\src\dsp-fin-process-waveform.c" line 290 col 2
//-------------------------------------------------------------------
//   This loop executes 1 iteration of the original loop in estimated 10 cycles.
//-------------------------------------------------------------------
//   Unknown Trip Count
//   Found modulo schedule with:
//     Initiation Interval (II)                                  = 5
//     Stage Count (SC)                                          = 2
//     MVE Unroll Factor                                         = 1
//     Minimum initiation interval due to recurrences (rec MII)  = 0
//     Minimum initiation interval due to resources (res MII)    = 6.00
//-------------------------------------------------------------------
//   This loop's modulo schedule was invalidated.
//-------------------------------------------------------------------
//   This loop's resource usage is:
//     32-bit Instruction  used   6 out of   10 ( 60.0%)
//     Group 1             used   6 out of   10 ( 60.0%)
//     16-bit Instruction  used  10 out of   20 ( 50.0%)
//-------------------------------------------------------------------
	LOOP_BEGIN .P39L19L;
	R1 = R1 + R0 (NS) || R0 = [P2++];
.LN15:
// line 291
	R4 = R0 - R2;
	R0 = R4;
.LN16:
// line 293
	R5 = R5 + R3 (NS) || R3 = [P0++];
	R3 *= R4;
.LN17:
// line 292
	R0 *= R4;
.LN18:
// line 293
	LOOP_END .P39L19L;

.P39L21:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------

.P39L18:
.LN19:
// line 292
	R1 = R1 + R0;
.LN20:
// line 293
	R0 = R5 + R3;

.P39L6:
.LN21:
// line 295
	CALL.X (___udiv32);                     // division is implemented as a library call. 
	R5 = ROT R0 BY 0 || R0 = [SP + 44];
	R1 = R6;
.LN22:
// line 296
	R7 *= R5;
	R0 = R0 - R7;
	CALL.X (___udiv32);                     // division is implemented as a library call. 
	P1.L = _a_fixed;
	P1.H = _a_fixed;
.LN23:
// line 297
	[P1] = R0;
	P1.L = _b_fixed;
	P1.H = _b_fixed;
.LN24:
// line 298
	[P1] = R5;
.LN25:
// line 301
	SP += 12;
	P0 = [FP + 4];
	(R7:4, P5:4) = [SP++];
	UNLINK;
	// -- stall --
	JUMP (P0);
.LN._fixed_point_fit_data_to_straight_line.end:
._fixed_point_fit_data_to_straight_line.end:
	.global _fixed_point_fit_data_to_straight_line;
	.type _fixed_point_fit_data_to_straight_line,STT_FUNC;

	.align 4;
_process_waveform:
.LN_process_waveform:
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 168 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,ASTAT0-ASTAT1,CC,LC0-LC1,LT0-LT1,LB0-LB1}
//   Call preserved registers used:{R4.L,R4.H,R5.L,R5.H,R6.L,R6.H,R7.L,R7.H,P3-P5,FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,I0-I3,B0-B3,M0-M3,A0.W,A0.X,A1.W,A1.X,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
// Original Loop at "..\..\src\dsp-fin-process-waveform.c" line 102 col 3 --  loop structure removed due to dead code elimination.
//-------------------------------------------------------------------
// Original Loop at "..\..\src\dsp-fin-process-waveform.c" line 112 col 3 --  loop structure removed due to dead code elimination.
//-------------------------------------------------------------------
// Original Loop at "..\..\src\dsp-fin-process-waveform.c" line 117 col 3 --  loop structure removed due to dead code elimination.
//-------------------------------------------------------------------
// Original Loop at "..\..\src\dsp-fin-process-waveform.c" line 167 col 3 --  loop structure removed due to dead code elimination.
//-------------------------------------------------------------------
// Original Loop at "..\..\src\dsp-fin-process-waveform.c" line 176 col 3 --  loop structure removed due to dead code elimination.
//-------------------------------------------------------------------
// Original Loop at "..\..\src\dsp-fin-process-waveform.c" line 187 col 3 --  loop structure removed due to dead code elimination.
//-------------------------------------------------------------------
// Original Loop at "..\..\src\dsp-fin-process-waveform.c" line 190 col 3 --  loop structure removed due to dead code elimination.
//-------------------------------------------------------------------
// Original Loop at "..\..\src\dsp-fin-process-waveform.c" line 193 col 3 --  loop structure removed due to dead code elimination.
//-------------------------------------------------------------------
// Original Loop at "..\..\src\dsp-fin-process-waveform.c" line 209 col 4 --  loop structure removed due to dead code elimination.
//-------------------------------------------------------------------
// Original Loop at "..\..\src\dsp-fin-process-waveform.c" line 213 col 4 --  loop structure removed due to dead code elimination.
//-------------------------------------------------------------------
// line "..\..\src\dsp-fin-process-waveform.c":13
	LINK 132;
	.align 2
	[--SP] = (R7:4, P5:3);
	SP += -12;
	[FP + 8] = R0;
.LN26:
// line 15
	P4 = 1800 /* -4192504 */;
	P4.H = -64 /* -4192504 */;
	[FP + 16] = P4;
	R7 = 4;
	P1 = [FP + 8];
	P2 = [FP + 8];
.LN27:
// line 16
	P0 = 512;
.LN28:
// line 15
	W[P4] = R7.L;
	P5.L = _waveform0;
	P5.H = _waveform0;
.LN29:
// line 16
	LOOP .P41L2L LC0 = P0;

.P41L2:
//-------------------------------------------------------------------
//   Loop at "..\..\src\dsp-fin-process-waveform.c" line 16 col 2
//-------------------------------------------------------------------
//   This loop executes 1 iteration of the original loop in estimated 2 cycles.
//-------------------------------------------------------------------
//   This loop's resource usage is:
//     Group 1             used   2 out of    2 (100.0%)
//     16-bit Instruction  used   2 out of    4 ( 50.0%)
//     Store               used   1 out of    2 ( 50.0%)
//-------------------------------------------------------------------
	LOOP_BEGIN .P41L2L;
	R0 = W[P5++] (X);
.LN30:
// line 17
	W[P1++] = R0;
.LN31:
// line 16
	LOOP_END .P41L2L;

.P41L171:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------
.LN32:
// line 19
	P5 = 1796 /* -4192508 */;
	P5.H = -64 /* -4192508 */;
	R3 = R3 - R3 (NS) || W[P5] = R7.L;
.LN33:
// line 20
	R6 = R6 - R6 (NS) || P1 = [FP + 16];
	R0 = 2;
.LN34:
// line 37
	P4 = 32;
	R2 = 0;
.LN35:
// line 20
	W[P1] = R0.L;
	P1 = 44;
	P0 = SP + P1;
.LN36:
// line 36
	P1 = [FP + 16];
	R1 = -1;
.LN37:
// line 41
	P3 = 15;
	R0 = -1;
.LN38:
// line 36
	W[P1] = R7.L;
	P1 = P2;
.LN39:
// line 37
	LOOP .P41L5L LC1 = P4;

.P41L5:
//-------------------------------------------------------------------
//   Loop at "..\..\src\dsp-fin-process-waveform.c" line 37 col 2
//-------------------------------------------------------------------
	LOOP_BEGIN .P41L5L;
	R4 = R4 - R4 (NS) || R5 = W[P1++] (Z);
.LN40:
// line 41
	LOOP .P41L228L LC0 = P3;

.P41L228:
//-------------------------------------------------------------------
//   Loop at "..\..\src\dsp-fin-process-waveform.c" line 39 col 3
//-------------------------------------------------------------------
//   This loop executes 1 iteration of the original loop in estimated 1 cycle.
//-------------------------------------------------------------------
//   Trip Count  = 15
//-------------------------------------------------------------------
//   Successfully found modulo schedule with:
//     Initiation Interval (II)                                  = 1
//     Stage Count (SC)                                          = 2
//     MVE Unroll Factor                                         = 1
//     Minimum initiation interval due to recurrences (rec MII)  = 0
//     Minimum initiation interval due to resources (res MII)    = 1.00
//-------------------------------------------------------------------
//   This loop's resource usage is:
//     32-bit Instruction  used   1 out of    1 (100.0%)
//     Group 1             used   1 out of    1 (100.0%)
//     16-bit Instruction  used   1 out of    2 ( 50.0%)
//-------------------------------------------------------------------
	LOOP_BEGIN .P41L228L;
	R4 = R4 + R5 (NS) || R5 = W[P1++] (Z);
	LOOP_END .P41L228L;

.P41L229:
//-------------------------------------------------------------------
//   Part of Loop 5, depth 1
//-------------------------------------------------------------------
	R5 = R4 + R5;
	CC = R5 < R0 (IU);                      // MIN operation could not be generated because of unsigned operands. 
	IF CC R6 = R2;
	IF CC R0 = R5;
.LN41:
// line 45
	[P0++] = R5;
.LN42:
// line 37
	R2 += 1;
.LN43:
	LOOP_END .P41L5L;

.P41L173:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------
.LN44:
// line 49
	R0 = ROT R6 BY 0 || W[P5] = R7.L;
.LN45:
// line 60
	R5 = ROT R6 BY 0 || P1 = [FP + 16];
.LN46:
// line 51
	CC = R6 == 0;
	R0 += -1;
	IF !CC R6 = R0;
	R0 = 16;
.LN47:
// line 60
	R2 = R6 << 4 || W[P1] = R0.L;
.LN48:
// line 53
	R0 = 31;
.LN49:
	CC = R5 < R0 (IU);
	R0 = ROT R5 BY 0 || [SP + 40] = R5;
	R0 += 1;
	IF CC R5 = R0;
	R0 = ROT R5 BY 0 || [FP + 12] = R0;
	R0 += 1;
	IF CC R5 = R0;
.LN50:
// line 56
	R0 = R5 << 4;
.LN51:
// line 61
	CC = R2 < R0 (IU);
	if !CC jump .P41L24 ;

.P41L157:
	NOP;                                    // Inserted 3 instrs to fix anomaly w05_00_0428. 
	NOP;
	NOP;
	R4 = R6 << 5 || R0 = [FP + 8];
	R0 = R0 + R4;
	P1 = R0;
	R0 = R5 - R6;
	R0 <<= 4;
	P0 = R0;
.LN52:
	R0 = 1;
.LN53:
// line 62
	R6 = W[P1++] (Z);
	CC = R6 < R1 (IU);                      // MIN operation could not be generated because of unsigned operands. 
	IF CC R1 = R6;
	P0 += -1;
	IF CC R3 = R2;
	CC = P0 == 0;
	if CC jump .P41L222 ;
	NOP;                                    // Inserted 2 instrs to fix anomaly w05_00_0428. 
	NOP;

.P41L224:
	LOOP .P41L223L LC0 = P0;

.P41L223:
//-------------------------------------------------------------------
//   Loop at "..\..\src\dsp-fin-process-waveform.c" line 61 col 2
//-------------------------------------------------------------------
//   This loop executes 1 iteration of the original loop in estimated 4 cycles.
//-------------------------------------------------------------------
//   Unknown Trip Count
//       Trip modulo = 16, Trip minimum = 0, Trip maximum = 0
//
//   Successfully found modulo schedule with:
//     Initiation Interval (II)                                  = 5
//     Stage Count (SC)                                          = 2
//     MVE Unroll Factor                                         = 1
//     Minimum initiation interval due to recurrences (rec MII)  = 3
//     Minimum initiation interval due to resources (res MII)    = 4.00
//-------------------------------------------------------------------
//   This loop's resource usage is:
//     32-bit Instruction  used   4 out of    4 (100.0%)
//     Group 1             used   4 out of    4 (100.0%)
//     16-bit Instruction  used   7 out of    8 ( 87.5%)
//-------------------------------------------------------------------
	LOOP_BEGIN .P41L223L;
.LN54:
// line 61
	R2 = R2 + R0 (NS) || R6 = W[P1++] (Z);
	CC = R6 < R1 (IU);                      // MIN operation could not be generated because of unsigned operands. 
	IF CC R3 = R2;
	IF CC R1 = R6;
	LOOP_END .P41L223L;

.P41L225:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------

.P41L222:

.P41L24:
	R0 = 16;
.LN55:
// line 79
	CC = R3 < 3 (IU);
.LN56:
// line 65
	W[P5] = R0.L;
.LN57:
// line 79
	if CC jump .P41L28 ;

.P41L31:
.LN58:
	R0 = 512;
.LN59:
	CC = R0 <= R3 (IU);
	if CC jump .P41L28 ;

.P41L29:
	NOP;                                    // Inserted 3 instrs to fix anomaly w05_00_0245_with_boundaries. 
	NOP;
	NOP;
.LN60:
// line 80
	R5 = R3 << 1 || R6 = W[P2] (Z);
.LN61:
// line 81
	R6 = R6 - R1 (NS) || P1 = [FP + 16];
.LN62:
// line 82
	R6 = R6 >> 1 || R0 = [FP + 8];
	R6 = R1 + R6;
	R1 = R3;
	R0 += -4;
.LN63:
// line 84
	R1 += -2;
	R0 = R0 + R5;
	R2 = 8;
	CC = R1 == 0;
.LN64:
// line 83
	W[P1] = R2.L;
	P0 = R0;
.LN65:
// line 84
	if CC jump .P41L214 ;
	NOP;                                    // Inserted to fix anomaly w05_00_0245_with_boundaries. 

.P41L213:
	P1 = R1;
	// -- 4 stalls --
	LOOP .P41L34L LC0 = P1;

.P41L34:
//-------------------------------------------------------------------
//   Loop at "..\..\src\dsp-fin-process-waveform.c" line 84 col 2
//-------------------------------------------------------------------
//   This loop executes 1 iteration of the original loop in estimated 7 cycles.
//-------------------------------------------------------------------
//   This loop's resource usage is:
//     32-bit Instruction  used   7 out of    7 (100.0%)
//     Group 1             used   7 out of    7 (100.0%)
//     16-bit Instruction  used  13 out of   14 ( 92.9%)
//-------------------------------------------------------------------
// This loop was not modulo scheduled because it contains jump instructions.
// Jumps out of this loop prevent efficient hardware loop generation.
//-------------------------------------------------------------------
	LOOP_BEGIN .P41L34L;
	NOP;                                    // Inserted 2 instrs to fix anomaly w05_00_0245_with_boundaries. 
	NOP;
.LN66:
// line 85
	R0 = ROT R1 BY 0 || R5 = W[P0--] (Z);
	CC = R6 < R5 (IU);
	R0 += -1;
	if CC jump .P41L40 ;

.P41L212:
	R1 = R0;
	LOOP_END .P41L34L;

.P41L202:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------
	R1 = R0;

.P41L214:

.P41L40:
.LN67:
// line 89
	R1 += 1;
.LN68:
// line 90
	CC = R1 < 2 (IU);
.LN69:
// line 87
	W[P5] = R2.L;
.LN70:
// line 90
	if CC jump .P41L42 ;

.P41L45:
.LN71:
	R0 = 512;
.LN72:
	CC = R0 <= R1 (IU);
	if CC jump .P41L42 ;

.P41L43:
.LN73:
// line 91
	R0 = R3 - R1;
.LN74:
// line 92
	R0 <<= 1;
	R0 += 1;
.LN75:
// line 93
	R6 = R3 + R0, R5 = R3 - R0;
.LN76:
// line 94
	CC = R5 < 1 (IU);
.LN77:
// line 93
	[SP + 40] = R6;
.LN78:
// line 94
	if CC jump .P41L47 ;

.P41L50:
.LN79:
	R6 = 512;
.LN80:
	CC = R6 <= R5 (IU);
	if CC jump .P41L47 ;

.P41L48:
	NOP;                                    // Inserted 3 instrs to fix anomaly w05_00_0428. 
	NOP;
	NOP;
.LN81:
// line 96
	R6 = [SP + 40];
	CC = R6 < 5 (IU);
	if CC jump .P41L52 ;

.P41L55:
.LN82:
	R6 = 512;
	NOP;                                    // Inserted 2 instrs to fix anomaly w05_00_0428. 
	NOP;
.LN83:
	R4 = [SP + 40];
	CC = R6 <= R4 (IU);
	if CC jump .P41L52 ;

.P41L53:
.LN84:
// line 97
	CC = R1 <= R5 (IU);
	if CC jump .P41L57 ;

.P41L64:
	CC = R3 <= R5 (IU);
	if CC jump .P41L57 ;

.P41L63:
	CC = R4 <= R5 (IU);
	if CC jump .P41L57 ;

.P41L62:
	CC = R3 <= R1 (IU);
	if CC jump .P41L57 ;

.P41L61:
	CC = R4 <= R1 (IU);
	if CC jump .P41L57 ;

.P41L60:
	CC = R4 <= R3 (IU);
	if CC jump .P41L57 ;

.P41L67:
	NOP;                                    // Inserted 3 instrs to fix anomaly w05_00_0428. 
	NOP;
	NOP;
.LN85:
// line 111
	P1 = [FP + 16];
	R1 = 16;
.LN86:
// line 137
	R0 += 1;
.LN87:
// line 138
	CC = R0 < 4 (IU);
.LN88:
// line 111
	W[P1] = R1.L;
.LN89:
// line 115
	W[P5] = R1.L;
.LN90:
// line 116
	W[P1] = R1.L;
.LN91:
// line 120
	W[P5] = R1.L;
.LN92:
// line 138
	if CC jump .P41L84 ;

.P41L85:
.LN93:
// line 141
	CC = R0 == 0;
.LN94:
// line 140
	W[P1] = R2.L;
.LN95:
// line 141
	if CC jump .P41L90 ;

.P41L164:
	P2.L = _y_fixed;
	P2.H = _y_fixed;
	NOP;                                    // Inserted 2 instrs to fix anomaly w05_00_0245_with_boundaries. 
	NOP;
.LN96:
// line 143
	R3 = R5 << 1 || P4 = [P2];
	R1 = [FP + 8];
	R1 = R1 + R3;
.LN97:
// line 141
	P1 = R0;
.LN98:
// line 143
	[FP + 12] = P4;
	P0 = R1;
	P4 = 0;
	// -- stall --
	P3 = [FP + 12];
	P1 += -1;
	R1 = W[P0++] (Z);
	CC = P1 == 0;
	[P3 + 0] = R1;
	if CC jump .P41L216 ;
	NOP;                                    // Inserted 2 instrs to fix anomaly w05_00_0428. 
	NOP;

.P41L218:
	LOOP .P41L217L LC0 = P1;

.P41L217:
//-------------------------------------------------------------------
//   Loop at "..\..\src\dsp-fin-process-waveform.c" line 141 col 3
//-------------------------------------------------------------------
//   This loop executes 1 iteration of the original loop in estimated 6 cycles.
//   (cycle count 6 includes 1 stall)
//-------------------------------------------------------------------
//   Unknown Trip Count
//       Trip modulo = 2, Trip minimum = 0, Trip maximum = 0
//
//   Successfully found modulo schedule with:
//     Initiation Interval (II)                                  = 6
//     Stage Count (SC)                                          = 2
//     MVE Unroll Factor                                         = 1
//     Minimum initiation interval due to recurrences (rec MII)  = 6
//     Minimum initiation interval due to resources (res MII)    = 5.00
//-------------------------------------------------------------------
//   This loop's resource usage is:
//     Group 1             used   5 out of    6 ( 83.3%)
//     16-bit Instruction  used   7 out of   12 ( 58.3%)
//     32-bit Instruction  used   2 out of    6 ( 33.3%)
//     Store               used   1 out of    6 ( 16.7%)
//-------------------------------------------------------------------
	LOOP_BEGIN .P41L217L;
	P1 = [P2];
	P4 += 4;
	R1 = W[P0++] (Z);
	// -- stall --
	P1 = P1 + P4;
	[P1] = R1;
	LOOP_END .P41L217L;

.P41L219:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------

.P41L216:

.P41L90:
.LN99:
// line 148
	W[P5] = R2.L;
.LN100:
// line 152
	P1 = [FP + 16];
	R6 = 64;
.LN101:
// line 153
	R0 = R0.L (Z);
	R1 = 2;
.LN102:
// line 152
	W[P1] = R6.L;
.LN103:
// line 153
	CALL.X (_fit_me);
.LN104:
// line 154
	W[P5] = R6.L;
.LN105:
// line 164
	P1 = [FP + 16];
	// -- 3 stalls --
	W[P1] = R7.L;
.LN106:
// line 203
	W[P5] = R7.L;

.P41L32:
	R0 = 2;
.LN107:
// line 268
	W[P5] = R0.L;
.LN108:
// line 269
	SP += 12;
	P0 = [FP + 4];
	(R7:4, P5:3) = [SP++];
	UNLINK;
	// -- stall --
	JUMP (P0);

.P41L84:
.LN109:
// line 138
	R0 = 7;
	CALL.X (_show_reason_for_aborting_analysis);
	jump .P41L32;

.P41L57:
.LN110:
// line 97
	R0 = 6;
	CALL.X (_show_reason_for_aborting_analysis);
	jump .P41L32;

.P41L52:
.LN111:
// line 96
	R0 = 5;
	CALL.X (_show_reason_for_aborting_analysis);
	jump .P41L32;

.P41L47:
.LN112:
// line 94
	R0 = 4;
	CALL.X (_show_reason_for_aborting_analysis);
	jump .P41L32;

.P41L42:
.LN113:
// line 90
	R0 = 3;
	CALL.X (_show_reason_for_aborting_analysis);
	jump .P41L32;

.P41L28:
.LN114:
// line 79
	R0 = 2;
	CALL.X (_show_reason_for_aborting_analysis);
	jump .P41L32;
.LN._process_waveform.end:
._process_waveform.end:
	.global _process_waveform;
	.type _process_waveform,STT_FUNC;

	.file_attr ProjectName="CoreA";
	.file_attr FuncName="_fixed_point_fit_data_to_straight_line";
	.file_attr FuncName="_process_waveform";
	.file_attr Content="CodeData";
.epctext.end:

	.extern ___udiv32;
	.type ___udiv32,STT_FUNC;
	.extern _fit_me;
	.type _fit_me,STT_FUNC;
	.extern _show_reason_for_aborting_analysis;
	.type _show_reason_for_aborting_analysis,STT_FUNC;

	.section/DOUBLE32 data1;

	.align 2;
.epcdata:
	.type .epcdata,STT_OBJECT;
_delay:
	.global _delay;
	.type _delay,STT_OBJECT;
	.byte =
		0x03,0x00;
.epcdata.end:

	.section .debug_abbrev SHT_DEBUGINFO;

	.align 1;
.epcabbrev:
	.type .epcabbrev,STT_OBJECT;
	.inc/binary ".\Debug\dsp-fin-process-waveform.sbn", 0, 201;
.epcabbrev.end:

	.section .debug_info SHT_DEBUGINFO;

	.align 1;
.epcdebug:
	.type .epcdebug,STT_OBJECT;
	.byte =
		0x99,0x0C,0x00,0x00,0x02,0x00;
	.byte4 = .epcabbrev;
	.byte =
		0x04,0x01,0x2E,0x2E,0x5C,0x2E,0x2E,0x5C,0x73,0x72,0x63,0x5C,
		0x64,0x73,0x70,0x2D,0x66,0x69,0x6E,0x2D,0x70,0x72,0x6F,0x63,
		0x65,0x73,0x73,0x2D,0x77,0x61,0x76,0x65,0x66,0x6F,0x72,0x6D,
		0x2E,0x63,0x00,0x01;
	.byte4 = .epcline;
	.inc/binary ".\Debug\dsp-fin-process-waveform.sbn", 201, 2453;
	.byte4 = .LN_fixed_point_fit_data_to_straight_line;
	.byte4 = .LN._fixed_point_fit_data_to_straight_line.end;
	.byte =
		0x01,0x01,0x00,0x0D,0x00,0x00,0x00,0x00;
	.byte4 = .LN0;
	.byte4 = .LN._fixed_point_fit_data_to_straight_line.end;
	.byte =
		0x00,0x00,0x0C,0x81,0x0A,0x00,0x00,0x70,0x72,0x6F,0x63,0x65,
		0x73,0x73,0x5F,0x77,0x61,0x76,0x65,0x66,0x6F,0x72,0x6D,0x00,
		0x01;
	.byte4 = .LN_process_waveform;
	.byte4 = .LN._process_waveform.end;
	.byte =
		0x01,0x01,0x00,0x0D,0x00,0x00,0x00,0x00;
	.byte4 = .LN26;
	.byte4 = .LN._process_waveform.end;
	.byte =
		0x0E,0x70,0x61,0x72,0x74,0x69,0x61,0x6C,0x5F,0x73,0x75,0x6D,
		0x00,0x01,0x81,0x0A,0x00,0x00,0x03,0x7F,0x80,0x7F;
	.byte4 = .LN35-.LN_process_waveform;
	.byte =
		0x00,0x0F,0x64,0x6F,0x6E,0x65,0x00;
	.byte4 = .LN107;
	.byte =
		0x0D,0x47,0x0A,0x00,0x00;
	.byte4 = .LN_process_waveform;
	.byte4 = .LN._process_waveform.end;
	.byte =
		0x00,0x0D,0x55,0x0A,0x00,0x00;
	.byte4 = .LN86;
	.byte4 = .LN110;
	.byte =
		0x00,0x0D,0x63,0x0A,0x00,0x00;
	.byte4 = .LN_process_waveform;
	.byte4 = .LN._process_waveform.end;
	.byte =
		0x00,0x0D,0x71,0x0A,0x00,0x00;
	.byte4 = .LN_process_waveform;
	.byte4 = .LN._process_waveform.end;
	.byte =
		0x00,0x0D,0x00,0x00,0x00,0x00;
	.byte4 = .LN_process_waveform;
	.byte4 = .LN._process_waveform.end;
	.inc/binary ".\Debug\dsp-fin-process-waveform.sbn", 2654, 386;
	.byte4 = _x_fixed;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x0E,0x79,0x5F,0x66,0x69,0x78,0x65,
		0x64,0x00,0x01,0x96,0x0C,0x00,0x00,0x05,0x0C;
	.byte4 = _y_fixed;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x0E,0x61,0x5F,0x66,0x69,0x78,0x65,
		0x64,0x00,0x01,0x56,0x05,0x00,0x00,0x05,0x0C;
	.byte4 = _a_fixed;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x0E,0x62,0x5F,0x66,0x69,0x78,0x65,
		0x64,0x00,0x01,0x56,0x05,0x00,0x00,0x05,0x0C;
	.byte4 = _b_fixed;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x0E,0x77,0x61,0x76,0x65,0x66,0x6F,
		0x72,0x6D,0x30,0x00,0x01,0x86,0x0C,0x00,0x00,0x05,0x0C;
	.byte4 = _waveform0;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x0E,0x64,0x65,0x6C,0x61,0x79,0x00,
		0x01,0xD9,0x01,0x00,0x00,0x05,0x0C;
	.byte4 = _delay;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x0A,0x96,0x0C,0x00,0x00,0xD9,0x01,
		0x00,0x00,0x0B,0x80,0x04,0x00,0xFF,0x03,0x00,0x04,0x00,0x56,
		0x05,0x00,0x00,0x00;
.epcdebug.end:

	.section .debug_line SHT_DEBUGINFO;

	.align 1;
.epcline:
	.type .epcline,STT_OBJECT;
	.inc/binary ".\Debug\dsp-fin-process-waveform.sbn", 3040, 2105;
	.byte4 = .LN_fixed_point_fit_data_to_straight_line;
	.byte =
		0x04,0x01,0x05,0x44,0x03,0x90,0x02,0x01,0x00,0x05,0x02;
	.byte4 = .LN0;
	.byte =
		0x05,0x02,0x14,0x00,0x05,0x02;
	.byte4 = .LN1;
	.byte =
		0x05,0x03,0x0A,0x00,0x05,0x02;
	.byte4 = .LN2;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN3;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN4;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN5;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN6;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN7;
	.byte =
		0x05,0x02,0x0C,0x00,0x05,0x02;
	.byte4 = .LN8;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN9;
	.byte =
		0x05,0x03,0x0A,0x00,0x05,0x02;
	.byte4 = .LN10;
	.byte =
		0x05,0x02,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN11;
	.byte =
		0x05,0x03,0x0C,0x00,0x05,0x02;
	.byte4 = .LN12;
	.byte =
		0x03,0x7E,0x01,0x00,0x05,0x02;
	.byte4 = .LN13;
	.byte =
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN14;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN15;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN16;
	.byte =
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN17;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN18;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN19;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN20;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN21;
	.byte =
		0x05,0x02,0x0B,0x00,0x05,0x02;
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
		0x05,0x01,0x0C,0x00,0x05,0x02;
	.byte4 = .LN._fixed_point_fit_data_to_straight_line.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_process_waveform;
	.byte =
		0x04,0x01,0x05,0x35,0x15,0x00,0x05,0x02;
	.byte4 = .LN26;
	.byte =
		0x05,0x03,0x0B,0x00,0x05,0x02;
	.byte4 = .LN27;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN28;
	.byte =
		0x05,0x03,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN29;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN30;
	.byte =
		0x05,0x03,0x0A,0x00,0x05,0x02;
	.byte4 = .LN31;
	.byte =
		0x05,0x02,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN32;
	.byte =
		0x05,0x03,0x0C,0x00,0x05,0x02;
	.byte4 = .LN33;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN34;
	.byte =
		0x05,0x02,0x1A,0x00,0x05,0x02;
	.byte4 = .LN35;
	.byte =
		0x05,0x03,0x03,0x6F,0x01,0x00,0x05,0x02;
	.byte4 = .LN36;
	.byte =
		0x19,0x00,0x05,0x02;
	.byte4 = .LN37;
	.byte =
		0x05,0x04,0x0E,0x00,0x05,0x02;
	.byte4 = .LN38;
	.byte =
		0x05,0x03,0x03,0x7B,0x01,0x00,0x05,0x02;
	.byte4 = .LN39;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN40;
	.byte =
		0x05,0x04,0x0D,0x00,0x05,0x02;
	.byte4 = .LN41;
	.byte =
		0x05,0x03,0x0D,0x00,0x05,0x02;
	.byte4 = .LN42;
	.byte =
		0x05,0x26,0x03,0x78,0x01,0x00,0x05,0x02;
	.byte4 = .LN43;
	.byte =
		0x05,0x02,0x01,0x00,0x05,0x02;
	.byte4 = .LN44;
	.byte =
		0x05,0x03,0x15,0x00,0x05,0x02;
	.byte4 = .LN45;
	.byte =
		0x14,0x00,0x05,0x02;
	.byte4 = .LN46;
	.byte =
		0x05,0x02,0x03,0x77,0x01,0x00,0x05,0x02;
	.byte4 = .LN47;
	.byte =
		0x05,0x03,0x12,0x00,0x05,0x02;
	.byte4 = .LN48;
	.byte =
		0x05,0x02,0x03,0x79,0x01,0x00,0x05,0x02;
	.byte4 = .LN49;
	.byte =
		0x01,0x00,0x05,0x02;
	.byte4 = .LN50;
	.byte =
		0x0C,0x00,0x05,0x02;
	.byte4 = .LN51;
	.byte =
		0x0E,0x00,0x05,0x02;
	.byte4 = .LN52;
	.byte =
		0x05,0x11,0x01,0x00,0x05,0x02;
	.byte4 = .LN53;
	.byte =
		0x05,0x03,0x0A,0x00,0x05,0x02;
	.byte4 = .LN54;
	.byte =
		0x05,0x11,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN55;
	.byte =
		0x05,0x02,0x1B,0x00,0x05,0x02;
	.byte4 = .LN56;
	.byte =
		0x05,0x03,0x03,0x72,0x01,0x00,0x05,0x02;
	.byte4 = .LN57;
	.byte =
		0x05,0x02,0x17,0x00,0x05,0x02;
	.byte4 = .LN58;
	.byte =
		0x01,0x00,0x05,0x02;
	.byte4 = .LN59;
	.byte =
		0x01,0x00,0x05,0x02;
	.byte4 = .LN60;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN61;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN62;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN63;
	.byte =
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN64;
	.byte =
		0x05,0x03,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN65;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN66;
	.byte =
		0x05,0x03,0x0A,0x00,0x05,0x02;
	.byte4 = .LN67;
	.byte =
		0x05,0x02,0x0D,0x00,0x05,0x02;
	.byte4 = .LN68;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN69;
	.byte =
		0x05,0x03,0x03,0x7D,0x01,0x00,0x05,0x02;
	.byte4 = .LN70;
	.byte =
		0x05,0x02,0x0C,0x00,0x05,0x02;
	.byte4 = .LN71;
	.byte =
		0x01,0x00,0x05,0x02;
	.byte4 = .LN72;
	.byte =
		0x01,0x00,0x05,0x02;
	.byte4 = .LN73;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN74;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN75;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN76;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN77;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN78;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN79;
	.byte =
		0x01,0x00,0x05,0x02;
	.byte4 = .LN80;
	.byte =
		0x01,0x00,0x05,0x02;
	.byte4 = .LN81;
	.byte =
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN82;
	.byte =
		0x01,0x00,0x05,0x02;
	.byte4 = .LN83;
	.byte =
		0x01,0x00,0x05,0x02;
	.byte4 = .LN84;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN85;
	.byte =
		0x05,0x03,0x17,0x00,0x05,0x02;
	.byte4 = .LN86;
	.byte =
		0x23,0x00,0x05,0x02;
	.byte4 = .LN87;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN88;
	.byte =
		0x03,0x65,0x01,0x00,0x05,0x02;
	.byte4 = .LN89;
	.byte =
		0x0D,0x00,0x05,0x02;
	.byte4 = .LN90;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN91;
	.byte =
		0x0D,0x00,0x05,0x02;
	.byte4 = .LN92;
	.byte =
		0x1B,0x00,0x05,0x02;
	.byte4 = .LN93;
	.byte =
		0x0C,0x00,0x05,0x02;
	.byte4 = .LN94;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN95;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN96;
	.byte =
		0x05,0x04,0x0B,0x00,0x05,0x02;
	.byte4 = .LN97;
	.byte =
		0x05,0x03,0x03,0x7E,0x01,0x00,0x05,0x02;
	.byte4 = .LN98;
	.byte =
		0x05,0x04,0x0B,0x00,0x05,0x02;
	.byte4 = .LN99;
	.byte =
		0x05,0x03,0x0E,0x00,0x05,0x02;
	.byte4 = .LN100;
	.byte =
		0x0D,0x00,0x05,0x02;
	.byte4 = .LN101;
	.byte =
		0x05,0x09,0x0A,0x00,0x05,0x02;
	.byte4 = .LN102;
	.byte =
		0x05,0x03,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN103;
	.byte =
		0x05,0x09,0x0A,0x00,0x05,0x02;
	.byte4 = .LN104;
	.byte =
		0x05,0x03,0x0A,0x00,0x05,0x02;
	.byte4 = .LN105;
	.byte =
		0x13,0x00,0x05,0x02;
	.byte4 = .LN106;
	.byte =
		0x30,0x00,0x05,0x02;
	.byte4 = .LN107;
	.byte =
		0x4A,0x00,0x05,0x02;
	.byte4 = .LN108;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN109;
	.byte =
		0x05,0x3E,0x03,0xFD,0x7E,0x01,0x00,0x05,0x02;
	.byte4 = .LN110;
	.byte =
		0x05,0x57,0x03,0x57,0x01,0x00,0x05,0x02;
	.byte4 = .LN111;
	.byte =
		0x05,0x47,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN112;
	.byte =
		0x03,0x7E,0x01,0x00,0x05,0x02;
	.byte4 = .LN113;
	.byte =
		0x03,0x7C,0x01,0x00,0x05,0x02;
	.byte4 = .LN114;
	.byte =
		0x03,0x75,0x01,0x00,0x05,0x02;
	.byte4 = .LN._process_waveform.end;
	.byte =
		0x00,0x01,0x01;
.epcline.end:

	.section .annotations SHT_DEBUGINFO;

	.align 1;
.epcannot:
	.type .epcannot,STT_OBJECT;
	.inc/binary ".\Debug\dsp-fin-process-waveform.sbn", 5145, 5356;
.epcannot.end:

	.section .debug_pubnames SHT_DEBUGINFO;

	.align 1;
.epcpubnames:
	.type .epcpubnames,STT_OBJECT;
	.byte =
		0x57,0x00,0x00,0x00,0x02,0x00;
	.byte4 = .epcdebug;
	.byte =
		0x9D,0x0C,0x00,0x00,0x9F,0x09,0x00,0x00,0x66,0x69,0x78,0x65,
		0x64,0x5F,0x70,0x6F,0x69,0x6E,0x74,0x5F,0x66,0x69,0x74,0x5F,
		0x64,0x61,0x74,0x61,0x5F,0x74,0x6F,0x5F,0x73,0x74,0x72,0x61,
		0x69,0x67,0x68,0x74,0x5F,0x6C,0x69,0x6E,0x65,0x00,0xE5,0x09,
		0x00,0x00,0x70,0x72,0x6F,0x63,0x65,0x73,0x73,0x5F,0x77,0x61,
		0x76,0x65,0x66,0x6F,0x72,0x6D,0x00,0x6F,0x0C,0x00,0x00,0x64,
		0x65,0x6C,0x61,0x79,0x00,0x00,0x00,0x00,0x00;
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
	.byte4 = .LN_fixed_point_fit_data_to_straight_line;
	.byte4 = .LN._fixed_point_fit_data_to_straight_line.end-.LN_fixed_point_fit_data_to_straight_line;
	.byte4 = .LN_process_waveform;
	.byte4 = .LN._process_waveform.end-.LN_process_waveform;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00;
.epcaranges.end:

	.section/DOUBLE32 data1;


	.extern _x_fixed;
	.type _x_fixed,STT_OBJECT;
	.extern _y_fixed;
	.type _y_fixed,STT_OBJECT;
	.extern _a_fixed;
	.type _a_fixed,STT_OBJECT;
	.extern _b_fixed;
	.type _b_fixed,STT_OBJECT;
	.extern _waveform0;
	.type _waveform0,STT_OBJECT;
