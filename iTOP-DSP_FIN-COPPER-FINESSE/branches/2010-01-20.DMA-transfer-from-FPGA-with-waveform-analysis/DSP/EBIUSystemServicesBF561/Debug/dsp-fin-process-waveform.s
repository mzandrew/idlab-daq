	.file "..\..\src\dsp-fin-process-waveform.c";
//  Compilation time: Wed Jan 20 22:50:32 2010

//  Compiler options: -c -file-attr ProjectName=CoreA -O -Ov100 -g -save-temps -path-output ..\Debug -structs-do-not-overlap -no-multiline -double-size-32 -decls-strong -warn-protos -proc ADSP-BF561 -o ..\Debug\dsp-fin-process-waveform.doj -MM
//  Architecture: ADSP-BF561
//  Silicon revision: 0.5
//  Anomalies summary:
//   Disabled: w05_00_0046,w05_00_0048,w05_00_0054,w05_00_0071,w05_00_0103,w05_00_0104,w05_00_0157,w05_00_0164,w05_00_0165,w05_00_0195,w05_00_0198,w05_00_0202,w05_00_0209,w05_00_0227,w05_00_0244,w05_00_0245,w05_00_0246,w05_00_0248,w05_00_0257,w05_00_0262,w05_00_0264,w05_00_0283,wF3_F_021,wF3_F_008_F3_F_013,w05_00_0311
//   Enabled: w05_00_0120,w05_00_0127,w05_00_0189,w05_00_0312
//   Always on: w05_00_0074,w05_00_0122

	.section/DOUBLE32 program;

.epctext:
	.align 4;
_fixed_point_fit_data_to_straight_line:
.LN_fixed_point_fit_data_to_straight_line:
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,ASTAT0-ASTAT1,CC,LC0,LT0,LB0}
//   Call preserved registers used:{R4.L,R4.H,R5.L,R5.H,R6.L,R6.H,R7.L,R7.H,P4-P5,FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,ASTAT0-ASTAT1,CC,AQ,LC0,LT0,LB0,RETS}
//-------------------------------------------------------------------
// line "..\..\src\dsp-fin-process-waveform.c":620
	LINK 0;
	.align 2
	[--SP] = (R7:4, P5:4);
.LN0:
// line 640
	R7 = R0;
	CC = R7 == 0;
.LN1:
// line 620
	SP += -12;
	P5.L = _y_fixed;
	P5.H = _y_fixed;
	P4.L = _x_fixed;
	P4.H = _x_fixed;
	R6 = 0;
	R5 = 0;
.LN2:
// line 640
	if CC jump .P45L3 ;

.P45L10:
	P1 = R7;
.LN3:
// line 641
	R1 = R1 - R1 (NS) || P2 = [P4];
.LN4:
// line 642
	R0 = R0 - R0 (NS) || P0 = [P5];
	// -- 2 stalls --
	P1 += -1;
	CC = P1 == 0;
.LN5:
// line 641
	R2 = [P2++];
	R6 = R1 + R2 (NS) || R1 = [P0++];
	if CC jump .P45L24 ;

.P45L26:
	LOOP .P45L25L LC0 = P1;

.P45L25:
//-------------------------------------------------------------------
//   Loop at "..\..\src\dsp-fin-process-waveform.c" line 640 col 2
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
	LOOP_BEGIN .P45L25L;
.LN6:
// line 642
	R0 = R0 + R1 (NS) || R1 = [P2++];
.LN7:
// line 641
	R6 = R6 + R1 (NS) || R1 = [P0++];
.LN8:
// line 642
	LOOP_END .P45L25L;

.P45L27:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------

.P45L24:
	R5 = R0 + R1;

.P45L3:
.LN9:
// line 645
	R1 = R7;
	R0 = R6;
	CALL.X (___udiv32);                     // division is implemented as a library call. 
	R2 = R0;
.LN10:
// line 646
	CC = R7 == 0;
	R1 = 0;
	R0 = 0;
	if CC jump .P45L6 ;

.P45L12:
.LN11:
// line 647
	P2 = [P4];
.LN12:
// line 646
	P1 = R7;
.LN13:
// line 649
	R3 = R3 - R3 (NS) || P0 = [P5];
	// -- stall --
.LN14:
// line 647
	R0 = [P2++];
	R1 = R0 - R2;
.LN15:
// line 649
	R0 = [P0++];
	P1 += -1;
	R0 *= R1;
.LN16:
// line 648
	R1 *= R1;
	CC = P1 == 0;
	if CC jump .P45L18 ;

.P45L20:
	LOOP .P45L19L LC0 = P1;

.P45L19:
//-------------------------------------------------------------------
//   Loop at "..\..\src\dsp-fin-process-waveform.c" line 646 col 2
//-------------------------------------------------------------------
//   This loop executes 1 iteration of the original loop in estimated 10 cycles.
//-------------------------------------------------------------------
//   Unknown Trip Count
//   Successfully found modulo schedule with:
//     Initiation Interval (II)                                  = 6
//     Stage Count (SC)                                          = 2
//     MVE Unroll Factor                                         = 1
//     Minimum initiation interval due to recurrences (rec MII)  = 0
//     Minimum initiation interval due to resources (res MII)    = 6.00
//-------------------------------------------------------------------
//   This loop's resource usage is:
//     Group 1             used   6 out of   10 ( 60.0%)
//     16-bit Instruction  used  10 out of   20 ( 50.0%)
//     32-bit Instruction  used   5 out of   10 ( 50.0%)
//-------------------------------------------------------------------
	LOOP_BEGIN .P45L19L;
.LN17:
// line 649
	R3 = R3 + R0 (NS) || R0 = [P2++];
.LN18:
// line 647
	R4 = R0 - R2;
.LN19:
// line 649
	R0 = [P0++];
	R0 *= R4;
.LN20:
// line 648
	R4 *= R4;
	R1 = R1 + R4;
	LOOP_END .P45L19L;

.P45L21:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------

.P45L18:
.LN21:
// line 649
	R0 = R3 + R0;

.P45L6:
.LN22:
// line 651
	CALL.X (___udiv32);                     // division is implemented as a library call. 
	R4 = R0;
.LN23:
// line 652
	R1 = R7;
	R6 *= R4;
	R0 = R5 - R6;
	CALL.X (___udiv32);                     // division is implemented as a library call. 
	P1.L = _a_fixed;
	P1.H = _a_fixed;
.LN24:
// line 653
	[P1] = R0;
	P1.L = _b_fixed;
	P1.H = _b_fixed;
.LN25:
// line 654
	[P1] = R4;
.LN26:
// line 658
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
_output_augmented_original_waveform:
.LN_output_augmented_original_waveform:
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P1,ASTAT0-ASTAT1,CC,LC0,LT0,LB0}
//   Call preserved registers used:{R4.L,R4.H,R5.L,R5.H,R6.L,R6.H,R7.L,R7.H,P3-P5,FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,A0.W,A0.X,A1.W,A1.X,ASTAT0-ASTAT1,CC,AQ,RETS}
//-------------------------------------------------------------------
// line "..\..\src\dsp-fin-process-waveform.c":591
	LINK 0;
	.align 2
	[--SP] = (R7:4, P5:3);
	SP += -12;
	P5 = R0;
.LN27:
// line 593
	R0 = ROT R2 BY 0 || [SP + 56] = R1;
	CALL.X (___unsigned_int32_to_float32);  // instruction is implemented as a library call. 
	R1 = 13107 /* 1068708659 */;
	R1.H = 16307 /* 1068708659 */;
	R7 = R7 - R7 (NS) || [SP + 48] = R0;
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. There is one more instruction related to this call. 
	CALL.X (___float32_to_unsigned_int32);  // float to int conversion is implemented as a library call. 
	R0 = R0.L (Z);
	[SP + 52] = R0;
.LN28:
	R1 = [SP + 48];
	R0 = -26214 /* 1058642330 */;
	R0.H = 16153 /* 1058642330 */;
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. There is one more instruction related to this call. 
	CALL.X (___float32_to_unsigned_int32);  // float to int conversion is implemented as a library call. 
	R0 = R0.L (Z);
	R0 = R0 - R0 (NS) || [SP + 48] = R0;
	R5 = -3;
.LN29:
// line 595
	P3 = 1796 /* -4192508 */;
	P3.H = -64 /* -4192508 */;
.LN30:
// line 597
	P1 = 64;
.LN31:
// line 595
	W[P3] = R5.L;
	R6 = 1;
.LN32:
// line 614
	P4 = 1800 /* -4192504 */;
	P4.H = -64 /* -4192504 */;
.LN33:
// line 597
	LOOP .P47L2L LC0 = P1;

.P47L2:
//-------------------------------------------------------------------
//   Loop at "..\..\src\dsp-fin-process-waveform.c" line 597 col 2
//-------------------------------------------------------------------
//   This loop executes 1 iteration of the original loop in estimated 52 cycles.
//-------------------------------------------------------------------
//   This loop's resource usage is:
//     Group 1             used  52 out of   52 (100.0%)
//     16-bit Instruction  used  94 out of  104 ( 90.4%)
//     32-bit Instruction  used  46 out of   52 ( 88.5%)
//     Store               used   2 out of   52 (  3.8%)
//-------------------------------------------------------------------
// This loop was not modulo scheduled because it contains calls or volatile operations.
//-------------------------------------------------------------------
	LOOP_BEGIN .P47L2L;
.LN34:
// line 602
	BITCLR(R0, 2);
	R2 = ROT R0 BY 0 || R4 = W[P5++] (Z);
	BITSET(R0, 4);
	R3 = ROT R0 BY 0 || R0 = [SP + 48];
	CC = R0 < R4;
	R1.L = R1.L - R1.L (NS) || R0 = [SP + 52];
	IF CC R1 = R6;
	CC = R4 < R0;
	R0 = R1.L (Z);
	R1.L = R1.L - R1.L (NS) || 
	W[P3] = R5.L;                           // Use of volatile in loops precludes optimizations. 
	IF CC R1 = R6;
	R1 = R1.L (Z);
.LN35:
// line 605
	R0 = R0 & R1;
	BITSET(R2, 5);
	CC = R0 == 0;
	BITCLR(R3, 5);
	BITCLR(R2, 4);
.LN36:
// line 591
	R0 = [FP + 28];
	IF CC R3 = R2;
.LN37:
// line 608
	CC = R0 == R7;
	R0 = R3;
	BITSET(R3, 2);
	BITSET(R0, 12);
	IF !CC R3 = R0;
.LN38:
// line 591
	R0 = [SP + 60];
.LN39:
// line 609
	CC = R0 == R7;
	R0 = R3;
	BITSET(R3, 3);
	BITCLR(R0, 3);
	IF !CC R3 = R0;
.LN40:
// line 591
	R0 = [FP + 24];
.LN41:
// line 610
	CC = R0 == R7;
	R0 = R3;
	BITSET(R3, 2);
	BITSET(R0, 12);
	IF !CC R3 = R0;
.LN42:
// line 611
	R0 = [SP + 56];
	CC = R0 == R7;
	R0 = R3;
	BITSET(R3, 6);
	BITCLR(R0, 6);
	IF !CC R3 = R0;
.LN43:
// line 591
	R0 = [FP + 32];
.LN44:
// line 612
	CC = R0 == R7;
	R0 = R3;
	BITSET(R3, 2);
	BITSET(R0, 12);
	IF !CC R3 = R0;
	R0 = R3;
.LN45:
// line 614
	BITCLR(R3, 1);
	W[P4] = R3.L;                           // Use of volatile in loops precludes optimizations. 
.LN46:
// line 597
	R7 += 1;
.LN47:
	LOOP_END .P47L2L;

.P47L31:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------
.LN48:
// line 616
	W[P3] = R5.L;
.LN49:
// line 617
	SP += 12;
	P0 = [FP + 4];
	(R7:4, P5:3) = [SP++];
	UNLINK;
	// -- stall --
	JUMP (P0);
.LN._output_augmented_original_waveform.end:
._output_augmented_original_waveform.end:
	.global _output_augmented_original_waveform;
	.type _output_augmented_original_waveform,STT_FUNC;

	.align 4;
_ad_fft_init:
.LN_ad_fft_init:
	.reference _twiddle;
	.reference _in;
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,P0,ASTAT0-ASTAT1,CC}
//   Call preserved registers used:{R4.L,R4.H,R5.L,R5.H,R6.L,R6.H,R7.L,R7.H,P4-P5,FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,I0-I3,B0-B3,M0-M3,A0.W,A0.X,A1.W,A1.X,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
// line "..\..\src\dsp-fin-process-waveform.c":62
	LINK 0;
	.align 2
	[--SP] = (R7:4, P5:4);
	SP += -16;
	P4.L = .epcrodata;
	P4.H = .epcrodata;
.LN50:
// line 64
	R1 = 64;
	R0.L = _twiddle;
	R0.H = _twiddle;
	CALL.X (__twidfftrad2_fr16);
.LN51:
// line 66
	R7 = R7 - R7 (NS) || R5 = [P4 + 4];
	R4 = [P4 + 12];
	P5.L = _in;
	P5.H = _in;
	R6 = 0 /* 1191182336 */;
	R6.H = 18176 /* 1191182336 */;

.P51L2:
//-------------------------------------------------------------------
//   Loop at "..\..\src\dsp-fin-process-waveform.c" line 65 col 2
//-------------------------------------------------------------------
//   This loop executes 1 iteration of the original loop in estimated 22 cycles.
//   (cycle count 22 excludes the cost of the inner function calls and it includes 4 stalls)
//-------------------------------------------------------------------
//   This loop's resource usage is:
//     Group 1             used  18 out of   22 ( 81.8%)
//     16-bit Instruction  used  31 out of   44 ( 70.5%)
//     32-bit Instruction  used  13 out of   22 ( 59.1%)
//     Store               used   3 out of   22 ( 13.6%)
//-------------------------------------------------------------------
// This loop was not modulo scheduled because it contains calls or volatile operations.
//-------------------------------------------------------------------
	// -- 4 stalls --
	R0 = R7;
	CALL.X (___unsigned_int32_to_float64);  // instruction is implemented as a library call. 
	[SP + 12] = R5;
	R2 = [P4];
	CALL.X (___float64_mul);                // float multiply is implemented as a library call. 
	[SP + 12] = R4;
	R2 = [P4 + 8];
	CALL.X (___float64_div);                // float division is implemented as a library call. 
	CALL.X (___float64_to_float32);         // instruction is implemented as a library call. 
.LN52:
	CALL.X (__sinf);
.LN53:
	R1 = R6;
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	CALL.X (___float32_to_int32_round_to_zero);// float to int conversion is implemented as a library call. 
	R7 += 1;
.LN54:
// line 64
	R1 = 64;
.LN55:
// line 65
	CC = R7 < R1 (IU);
.LN56:
// line 66
	W[P5++] = R0;
.LN57:
// line 65
	if CC jump .P51L2 (bp);

.P51L7:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------
.LN58:
// line 68
	SP += 16;
	P0 = [FP + 4];
	(R7:4, P5:4) = [SP++];
	UNLINK;
	// -- stall --
	JUMP (P0);
.LN._ad_fft_init.end:
._ad_fft_init.end:
	.global _ad_fft_init;
	.type _ad_fft_init,STT_FUNC;

	.align 4;
_ad_fft:
.LN_ad_fft:
	.reference _filter;
	.reference _out;
	.reference _twiddle;
	.reference _in;
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,P0-P1,ASTAT0-ASTAT1,CC,LC0,LT0,LB0}
//   Call preserved registers used:{R4.L,R4.H,R5.L,R5.H,R6.L,R6.H,R7.L,R7.H,P3-P5,FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,I0-I3,B0-B3,M0-M3,A0.W,A0.X,A1.W,A1.X,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
// line "..\..\src\dsp-fin-process-waveform.c":127
	LINK 0;
	.align 2
	[--SP] = (R7:4, P5:3);
	P1 = 126;
	P3.L = _filter;
	P3.H = _filter;
	R7.L = _out;
	R7.H = _out;
	P4 = P3 + P1;
	P1 = R7;
	P0 = 252;
	SP += -28;
	R4 = 4;
.LN59:
// line 133
	R5 = FP;
	P1 = P1 + P0;
	[FP + 12] = P1;
.LN60:
// line 132
	P1 = 1800 /* -4192504 */;
	P1.H = -64 /* -4192504 */;
	R1 = ROT R7 BY 0 || W[P1] = R4.L;
.LN61:
// line 133
	P1 = 0;
	[SP + 24] = P1;
	P1 = 1;
	[SP + 12] = P1;
	R5 += 8;
	R6.L = _twiddle;
	R6.H = _twiddle;
	P1 = 64;
	R2 = ROT R6 BY 0 || [SP + 20] = R5;
	[SP + 16] = P1;
	R0.L = _in;
	R0.H = _in;
	CALL.X (__rfftN_scaling_fr16);
.LN62:
// line 134
	P1 = 1796 /* -4192508 */;
	P1.H = -64 /* -4192508 */;
	W[P1] = R4.L;
	R0 = 8;
.LN63:
// line 132
	P1 = 1800 /* -4192504 */;
	P1.H = -64 /* -4192504 */;
.LN64:
// line 136
	W[P1] = R0.L;
.LN65:
// line 137
	P1 = 32;
	P5 = R7;
	P0 = [FP + 12];
	LOOP .P59L2L LC0 = P1;

.P59L2:
//-------------------------------------------------------------------
//   Loop at "..\..\src\dsp-fin-process-waveform.c" line 137 col 2
//-------------------------------------------------------------------
	LOOP_BEGIN .P59L2L;
.LN66:
// line 146
	R1 = W[P4--] (X);
.LN67:
// line 147
	CC = R1 == 0;
	if CC jump .P59L6 ;

.P59L4:
.LN68:
// line 151
	R0.L = W[P0];
	R1.H = R0.L >>> 2 || R0 = W[P5 + 2] (X);
.LN69:
// line 148
	R2.L = R0.L >>> 2;
.LN70:
// line 152
	R0 = R1.L * R1.H (FU);
.LN71:
// line 153
	R1.H = R0.L >>> 2;
.LN72:
// line 149
	R0 = R1.L * R2.L (FU);
.LN73:
// line 150
	R0.L = R0.L >>> 2 || W[P0] = R1.H;
	W[P5 + 2] = R0;

.P59L6:
.LN74:
// line 155
	R1 = W[P3++] (X);
.LN75:
// line 156
	CC = R1 == 0;
	if CC jump .P59L9 ;

.P59L7:
.LN76:
// line 160
	R0.L = W[P5];
	R1.H = R0.L >>> 2 || R0 = W[P0 + 2] (X);
.LN77:
// line 157
	R2.L = R0.L >>> 2;
.LN78:
// line 161
	R0 = R1.L * R1.H (FU);
.LN79:
// line 162
	R1.H = R0.L >>> 2;
.LN80:
// line 158
	R0 = R1.L * R2.L (FU);
.LN81:
// line 159
	R0.L = R0.L >>> 2 || W[P5] = R1.H;
	W[P0 + 2] = R0;

.P59L9:
	P5 += 4;
	P0 += -4;
.LN82:
// line 137
	LOOP_END .P59L2L;

.P59L13:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------
	R0 = 8;
.LN83:
// line 134
	P1 = 1796 /* -4192508 */;
	P1.H = -64 /* -4192508 */;
.LN84:
// line 165
	R2 = ROT R6 BY 0 || W[P1] = R0.L;
.LN85:
// line 132
	P1 = 1800 /* -4192504 */;
	P1.H = -64 /* -4192504 */;
.LN86:
// line 166
	R1 = ROT R7 BY 0 || W[P1] = R4.L;
.LN87:
// line 133
	P1 = 1;
.LN88:
// line 167
	[SP + 12] = P1;
.LN89:
// line 133
	P1 = 64;
.LN90:
// line 167
	[SP + 16] = P1;
.LN91:
// line 133
	P1 = 0;
.LN92:
// line 167
	R0 = ROT R7 BY 0 || [SP + 20] = R5;
	[SP + 24] = P1;
	CALL.X (__ifftN_scaling_fr16);
.LN93:
// line 134
	P1 = 1796 /* -4192508 */;
	P1.H = -64 /* -4192508 */;
.LN94:
// line 168
	W[P1] = R4.L;
.LN95:
// line 174
	SP += 28;
	P0 = [FP + 4];
	(R7:4, P5:3) = [SP++];
	UNLINK;
	// -- stall --
	JUMP (P0);
.LN._ad_fft.end:
._ad_fft.end:
	.global _ad_fft;
	.type _ad_fft,STT_FUNC;

	.align 4;
_process_waveform:
.LN_process_waveform:
	.reference _ASIC_0113_delta_t;
	.reference _ASIC_0113_pedestal;
	.reference _output_augmented_original_waveform;
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 32 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,I0-I1,A0.W,A0.X,A1.W,A1.X,ASTAT0-ASTAT1,CC,LC0-LC1,LT0-LT1,LB0-LB1}
//   Call preserved registers used:{R4.L,R4.H,R5.L,R5.H,R6.L,R6.H,R7.L,R7.H,P3-P5,FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,I0-I3,B0-B3,M0-M3,A0.W,A0.X,A1.W,A1.X,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
// Original Loop at "..\..\src\dsp-fin-process-waveform.c" line 470 col 3 --  loop structure removed due to dead code elimination.
//-------------------------------------------------------------------
// Original Loop at "..\..\src\dsp-fin-process-waveform.c" line 488 col 4 --  loop structure removed due to dead code elimination.
//-------------------------------------------------------------------
// line "..\..\src\dsp-fin-process-waveform.c":176
	LINK 32;
	.align 2
	[--SP] = (R7:4, P5:3);
	SP += -28;
	R7.L = _buffer0;
	R7.H = _buffer0;
.LN96:
// line 222
	R0 = ROT R7 BY 0 || [FP + 8] = R0;
	CALL.X (_show_a_waveform);
	R0 = 256;
	R0 = R7 + R0;
.LN97:
// line 223
	CALL.X (_show_a_waveform);
	R0 = 512;
	R0 = R7 + R0 (NS) || P4 = [FP + 8];
.LN98:
// line 224
	CALL.X (_show_a_waveform);
	R0 = 768;
	R0 = R7 + R0;
.LN99:
// line 225
	CALL.X (_show_a_waveform);
	P1.L = _ASIC_0113_delta_t;
	P1.H = _ASIC_0113_delta_t;
.LN100:
// line 251
	R0 = R0 - R0 (NS) || R1 = W[P1] (X);
	CC = R1 < 0;
	R2 = R2 - R2 (NS) || [FP + 12] = R0;
	if !CC jump .P62L3 ;

.P62L1:
	I0 = P1;
	R0 = PACK(R1.L, R1.L);
.LN101:
// line 257
	R3 = - R1 (NS) || R1 = [I0++];
.LN102:
// line 259
	P0 = 30;
	R7 = R1 -|- R0 || R1 = [I0++];
	LOOP .P62L152L LC0 = P0;

.P62L152:
//-------------------------------------------------------------------
//   Loop at "..\..\src\dsp-fin-process-waveform.c" line 258 col 5
//-------------------------------------------------------------------
//   This loop executes 2 iterations of the original loop in estimated 1 cycle.
//-------------------------------------------------------------------
//   Trip Count  = 30
//-------------------------------------------------------------------
//   Successfully found modulo schedule with:
//     Initiation Interval (II)                                  = 1
//     Stage Count (SC)                                          = 3
//     MVE Unroll Factor                                         = 1
//     Minimum initiation interval due to recurrences (rec MII)  = 0
//     Minimum initiation interval due to resources (res MII)    = 1.00
//-------------------------------------------------------------------
//   This loop's resource usage is:
//     16-bit Instruction  used   2 out of    2 (100.0%)
//     32-bit Instruction  used   1 out of    1 (100.0%)
//     Group 1             used   1 out of    1 (100.0%)
//     Store               used   1 out of    1 (100.0%)
//-------------------------------------------------------------------
//   Loop was vectorized by a factor of 2.
//-------------------------------------------------------------------
	LOOP_BEGIN .P62L152L;
	R7 = R1 -|- R0 || [P1++] = R7 || R1 = [I0++];
	LOOP_END .P62L152L;

.P62L153:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------
	R0 = R1 -|- R0 || [P1++] = R7;
	[P1++] = R0;
	[FP + 12] = R3;

.P62L3:
	P1 = FP;
	P1 += -16;
	R0 = 2;
.LN103:
// line 265
	P5 = 1800 /* -4192504 */;
	P5.H = -64 /* -4192504 */;
.LN104:
// line 284
	P3 = 4;
.LN105:
// line 265
	R1.L = R1.L - R1.L (NS) || W[P5] = R0.L;
	I0 = P4;
	I1 = P1;
	P0.L = _ASIC_0113_pedestal;
	P0.H = _ASIC_0113_pedestal;
	R5 = 1;
	R7 = 0;
	R3 = 0;
.LN106:
// line 298
	P2 = 15;
.LN107:
// line 284
	LOOP .P62L8L LC1 = P3;

.P62L8:
//-------------------------------------------------------------------
//   Loop at "..\..\src\dsp-fin-process-waveform.c" line 284 col 2
//-------------------------------------------------------------------
	LOOP_BEGIN .P62L8L;
.LN108:
// line 288
	R1.H = W[I0];
.LN109:
// line 293
	R0 = R1.L (Z);
	R6 = W[P0++] (X);
.LN110:
// line 288
	R6.L = R1.H - R6.L (NS);
	R6 = R6.L (Z);
	CC = R0 < R6;
	IF CC R7 = R3;
	IF CC R1 = R6;
	W[I0++] = R6.L;
.LN111:
// line 298
	LOOP .P62L148L LC0 = P2;

.P62L148:
//-------------------------------------------------------------------
//   Loop at "..\..\src\dsp-fin-process-waveform.c" line 286 col 3
//-------------------------------------------------------------------
//   This loop executes 1 iteration of the original loop in estimated 8 cycles.
//-------------------------------------------------------------------
//   Trip Count  = 15
//-------------------------------------------------------------------
//   Successfully found modulo schedule with:
//     Initiation Interval (II)                                  = 9
//     Stage Count (SC)                                          = 2
//     MVE Unroll Factor                                         = 1
//     Minimum initiation interval due to recurrences (rec MII)  = 4
//     Minimum initiation interval due to resources (res MII)    = 8.00
//-------------------------------------------------------------------
//   This loop's resource usage is:
//     32-bit Instruction  used   8 out of    8 (100.0%)
//     16-bit Instruction  used  13 out of   16 ( 81.3%)
//     Group 1             used   6 out of    8 ( 75.0%)
//     Store               used   1 out of    8 ( 12.5%)
//-------------------------------------------------------------------
	LOOP_BEGIN .P62L148L;
	R3 = R3 + R5 (NS) || R0 = W[P0++] (X) || R1.H = W[I0];
.LN112:
// line 288
	R0.L = R1.H - R0.L (NS);
	R0 = R0.L (Z);
.LN113:
// line 293
	R1 = R1.L (Z);
	CC = R1 < R0;
	IF CC R7 = R3;
	IF CC R1 = R0;
.LN114:
// line 288
	R6 = R6 + R0 (NS) || W[I0++] = R0.L;
.LN115:
// line 298
	LOOP_END .P62L148L;

.P62L149:
//-------------------------------------------------------------------
//   Part of Loop 8, depth 1
//-------------------------------------------------------------------
	R3 = R3 + R5 (NS) || [I1++] = R6;
.LN116:
// line 284
	LOOP_END .P62L8L;

.P62L106:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------
.LN117:
// line 352
	CC = R7 < 3 (IU);
	R0 = 2;
	if CC jump .P62L20 ;

.P62L19:
	R3 = 64;
	CC = R3 <= R7 (IU);
	if CC jump .P62L20 ;

.P62L17:
	R6 = R7 << 1 || R0 = [FP + 8];
.LN118:
// line 353
	R1.H = W[P4];
	R0 += -4;
.LN119:
// line 356
	R1.H = R1.L - R1.H (NS) || [FP + -24] = R6;
	R0 = R0 + R6;
	R6 = R7;
.LN120:
// line 357
	R1.H = R1.H >>> 1;
.LN121:
// line 363
	R6 += -2;
.LN122:
// line 357
	R1.H = R1.L - R1.H (NS);
.LN123:
// line 363
	CC = R6 == 0;
	P2 = R0;
.LN124:
// line 357
	R1 = R1 >> 16;
.LN125:
// line 363
	if CC jump .P62L140 ;

.P62L139:
	P0 = R6;
	// -- 4 stalls --
	LOOP .P62L22L LC0 = P0;

.P62L22:
//-------------------------------------------------------------------
//   Loop at "..\..\src\dsp-fin-process-waveform.c" line 363 col 3
//-------------------------------------------------------------------
//   This loop executes 1 iteration of the original loop in estimated 5 cycles.
//-------------------------------------------------------------------
//   This loop's resource usage is:
//     32-bit Instruction  used   5 out of    5 (100.0%)
//     Group 1             used   5 out of    5 (100.0%)
//     16-bit Instruction  used   9 out of   10 ( 90.0%)
//-------------------------------------------------------------------
// This loop was not modulo scheduled because it contains jump instructions.
// Jumps out of this loop prevent efficient hardware loop generation.
//-------------------------------------------------------------------
	LOOP_BEGIN .P62L22L;
.LN126:
// line 365
	R0 = ROT R6 BY 0 || R5 = W[P2--] (Z);
	CC = R5 < R1;
	R0 += -1;
	if CC jump .P62L28 ;

.P62L136:
	R6 = R0;
	LOOP_END .P62L22L;

.P62L129:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------
	R6 = R0;

.P62L140:

.P62L28:
.LN127:
// line 377
	R6 += 1;
.LN128:
// line 378
	CC = R6 < 2 (IU);
	R0 = 3;
	if CC jump .P62L20 ;

.P62L33:
	CC = R3 <= R6 (IU);
	if CC jump .P62L20 ;

.P62L31:
.LN129:
// line 379
	R1.H = R7.L - R6.L (NS);
	R0 = R1 >>> 16;
.LN130:
// line 380
	CC = R0 < 1;
	R0 = 8;
	if CC jump .P62L20 ;

.P62L36:
.LN131:
// line 381
	R0.L = R1.H << 1;
	R0 += 1;
	R1 = R0.L (X);
.LN132:
// line 382
	R5 = R7 - R1;
.LN133:
// line 383
	CC = R5 < 1 (IU);
	R0 = 4;
	if CC jump .P62L20 ;

.P62L42:
	CC = R3 <= R5 (IU);
	if CC jump .P62L20 ;

.P62L40:
.LN134:
// line 384
	R0 = R1 << 1;
	R4 = R7 + R0;
.LN135:
// line 385
	CC = R4 < 5 (IU);
	R0 = 5;
	if CC jump .P62L20 ;

.P62L47:
	CC = R3 <= R4 (IU);
	if CC jump .P62L20 ;

.P62L45:
.LN136:
// line 386
	CC = R6 <= R5 (IU);
	R0 = 6;
	if CC jump .P62L20 ;

.P62L56:
	CC = R7 <= R5 (IU);
	if CC jump .P62L20 ;

.P62L55:
	CC = R4 <= R5 (IU);
	if CC jump .P62L20 ;

.P62L54:
	CC = R7 <= R6 (IU);
	if CC jump .P62L20 ;

.P62L53:
	CC = R4 <= R6 (IU);
	if CC jump .P62L20 ;

.P62L52:
	CC = R4 <= R7 (IU);
	if CC jump .P62L20 ;

.P62L50:
.LN137:
// line 393
	R3 = R5 >> 4;
	R1 = R3;
	R1 += -1;
.LN138:
// line 394
	CC = R1 == 0;
	if CC jump .P62L60 ;

.P62L99:
	P0 = R1;
.LN139:
// line 395
	R0 = [P1++];
	// -- 3 stalls --
	P0 += -1;
	CC = P0 == 0;
	if CC jump .P62L142 ;

.P62L144:
	LOOP .P62L143L LC0 = P0;

.P62L143:
//-------------------------------------------------------------------
//   Loop at "..\..\src\dsp-fin-process-waveform.c" line 394 col 3
//-------------------------------------------------------------------
//   This loop executes 1 iteration of the original loop in estimated 1 cycle.
//-------------------------------------------------------------------
//   Unknown Trip Count
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
	LOOP_BEGIN .P62L143L;
	R2 = R2 + R0 (NS) || R0 = [P1++];
	LOOP_END .P62L143L;

.P62L145:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------

.P62L142:
	R2 = R2 + R0;

.P62L60:
.LN140:
// line 397
	R0 = R1 << 4;
	CC = R0 < R5 (IU);
	if !CC jump .P62L63 ;

.P62L101:
	R3 = R3 << 5 || R1 = [FP + 8];
	R1 += -32;
	R1 = R1 + R3;
	P1 = R1;
	P0 = -1;

.P62L137:
//-------------------------------------------------------------------
//   Loop at "..\..\src\dsp-fin-process-waveform.c" line 397 col 3 (infinite hardware loop wrapper) 
//-------------------------------------------------------------------
	LOOP .P62L62L LC0 = P0;

.P62L62:
//-------------------------------------------------------------------
//   Loop at "..\..\src\dsp-fin-process-waveform.c" line 397 col 3
//-------------------------------------------------------------------
//   This loop executes 1 iteration of the original loop in estimated 5 cycles.
//-------------------------------------------------------------------
//   This loop's resource usage is:
//     Group 1             used   5 out of    5 (100.0%)
//     16-bit Instruction  used   9 out of   10 ( 90.0%)
//     32-bit Instruction  used   4 out of    5 ( 80.0%)
//-------------------------------------------------------------------
// This loop was not modulo scheduled because it contains jump instructions.
//-------------------------------------------------------------------
	LOOP_BEGIN .P62L62L;
.LN141:
	R0 += 1;
.LN142:
	CC = R0 < R5 (IU);
.LN143:
// line 398
	R1 = W[P1++] (Z);
	R2 = R2 + R1;
.LN144:
// line 397
	if !CC jump .P62L63 ;

.P62L135:
	LOOP_END .P62L62L;

.P62L138:
//-------------------------------------------------------------------
//   Part of Loop 137, depth 1
//-------------------------------------------------------------------
	jump .P62L137;

	.align 8
.P62L63:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------
.LN145:
// line 419
	R1 = R7 << 1 || R0 = [FP + 8];
	.align 2
	R0 = R0 + R1 (NS) || R3 = [FP + 8];
.LN146:
// line 420
	R1 = R6 << 1;
.LN147:
// line 419
	P4 = R0;
.LN148:
// line 420
	R1 = R3 + R1;
	P3 = R1;
.LN149:
// line 407
	R0 = R2 << 8;
.LN150:
// line 408
	R1 = R5;
	CALL.X (___udiv32);                     // division is implemented as a library call. 
	[FP + 16] = R0;
.LN151:
// line 419
	R0.L = W[P4];
	R1.H = R0.L << 8 || R0.L = W[P3];
.LN152:
// line 420
	R0.H = R0.L << 8;
.LN153:
// line 419
	R2 = R1 >>> 16;
.LN154:
// line 420
	R3 = R0 >>> 16;
.LN155:
// line 422
	CC = R3 == R2;
	R3 = [FP + 16];
.LN156:
// line 408
	R3 = R3.L (X);
.LN157:
// line 422
	if !CC jump .P62L66 ;

.P62L64:
	R0 = 256;
.LN158:
	R0.H = R1.H + R0.L (NS);

.P62L66:
.LN159:
// line 423
	R0 = R0 >>> 16;
	R0 = R0 - R2;
	R0 = R7 - R6 (NS) || [SP + 56] = R0;
	R1 = 250;
	R1 = R0.H * R1.L, R0 = R0.L * R1.L (FU);
	R1 = R1 << 16 || [FP + -20] = R1;
	R2 = R3 - R2 (NS) || [FP + -24] = R0;
	R3 = R1 + R0;
	R0 = 250;
	R1 = R7.H * R0.L, R0 = R7.L * R0.L (FU);
	R0 = ROT R2 BY 0 || [FP + -24] = R0;
	[FP + -20] = R1;
	R0 *= R3;
	R1 = [SP + 56];
	CALL.X (___udiv32);                     // division is implemented as a library call. 
	R1 = [FP + -20];
	R1 = R1 << 16 || R2 = [FP + -24];
	R1 = R1 + R2;
	R0 = R1 - R0 (NS) || R1 = [FP + 12];
.LN160:
// line 460
	R1 = R0 - R1;
.LN161:
// line 576
	R2 = 19923 /* 274877907 */;
	R2.H = 4194 /* 274877907 */;
	R0 = (A0 = R1.L * R2.L), 
	A1 = R1.L * R2.H (FU);
	R0 = 4;
.LN162:
// line 480
	A1 += R1.H * R2.L (FU) || 
	W[P5] = R0.L;
.LN163:
// line 509
	P4 = 1796 /* -4192508 */;
	P4.H = -64 /* -4192508 */;
.LN164:
// line 576
	A0 = A0 >> 16 || W[P4] = R0.L;
	A0 += A1 || R0 = [FP + 16];
	A0 = A0 >> 16;
.LN165:
// line 577
	R0 >>>= 8;
.LN166:
// line 576
	A0 += R1.H * R2.H (FU);
.LN167:
// line 577
	R2 = R0.L (Z);
	R1 = 2;
.LN168:
// line 576
	R0 = A0.W;
.LN169:
// line 568
	R0 = R0 >> 4 || W[P4] = R1.L;
.LN170:
// line 577
	R1 = ROT R7 BY 0 || [SP + 12] = R0;
	[SP + 24] = R4;
	[SP + 20] = R5;
	[SP + 16] = R6;
	R0 = [FP + 8];
	CALL.X (_output_augmented_original_waveform);
.LN171:
// line 581
	SP += 28;
	P0 = [FP + 4];
	(R7:4, P5:3) = [SP++];
	UNLINK;
	// -- stall --
	JUMP (P0);

	.align 4
.P62L20:
.LN172:
// line 352
	CALL.X (_show_reason_for_aborting_analysis);
	.align 2
	R0 = 2;
.LN173:
// line 585
	P1 = 1796 /* -4192508 */;
	P1.H = -64 /* -4192508 */;
	W[P1] = R0.L;
.LN174:
// line 586
	SP += 28;
	P0 = [FP + 4];
	(R7:4, P5:3) = [SP++];
	UNLINK;
	// -- stall --
	JUMP (P0);
.LN._process_waveform.end:
._process_waveform.end:
	.global _process_waveform;
	.type _process_waveform,STT_FUNC;

	.file_attr ProjectName="CoreA";
	.file_attr FuncName="_fixed_point_fit_data_to_straight_line";
	.file_attr FuncName="_output_augmented_original_waveform";
	.file_attr FuncName="_ad_fft_init";
	.file_attr FuncName="_ad_fft";
	.file_attr FuncName="_process_waveform";
	.file_attr Content="CodeData";
.epctext.end:

	.extern ___udiv32;
	.type ___udiv32,STT_FUNC;
	.extern ___unsigned_int32_to_float32;
	.type ___unsigned_int32_to_float32,STT_FUNC;
	.extern ___float32_mul;
	.type ___float32_mul,STT_FUNC;
	.extern ___float32_to_unsigned_int32;
	.type ___float32_to_unsigned_int32,STT_FUNC;
	.extern __twidfftrad2_fr16;
	.type __twidfftrad2_fr16,STT_FUNC;
	.extern ___unsigned_int32_to_float64;
	.type ___unsigned_int32_to_float64,STT_FUNC;
	.extern ___float64_mul;
	.type ___float64_mul,STT_FUNC;
	.extern ___float64_div;
	.type ___float64_div,STT_FUNC;
	.extern ___float64_to_float32;
	.type ___float64_to_float32,STT_FUNC;
	.extern __sinf;
	.type __sinf,STT_FUNC;
	.extern ___float32_to_int32_round_to_zero;
	.type ___float32_to_int32_round_to_zero,STT_FUNC;
	.extern __rfftN_scaling_fr16;
	.type __rfftN_scaling_fr16,STT_FUNC;
	.extern __ifftN_scaling_fr16;
	.type __ifftN_scaling_fr16,STT_FUNC;
	.extern _show_a_waveform;
	.type _show_a_waveform,STT_FUNC;
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

	.section/DOUBLE32 constdata;

	.align 4;
.epcrodata:
	.type .epcrodata,STT_OBJECT;
	.byte =
		0x18,0x2D,0x44,0x54,0xFB,0x21,0x19,0x40,0x00,0x00,0x00,0x00,
		0x00,0x00,0x04,0x40;
.epcrodata.end:

	.section .debug_abbrev SHT_DEBUGINFO;

	.align 1;
.epcabbrev:
	.type .epcabbrev,STT_OBJECT;
	.inc/binary "..\Debug\dsp-fin-process-waveform.sbn", 0, 227;
.epcabbrev.end:

	.section .debug_info SHT_DEBUGINFO;

	.align 1;
.epcdebug:
	.type .epcdebug,STT_OBJECT;
	.byte =
		0xD5,0x12,0x00,0x00,0x02,0x00;
	.byte4 = .epcabbrev;
	.byte =
		0x04,0x01,0x2E,0x2E,0x5C,0x2E,0x2E,0x5C,0x73,0x72,0x63,0x5C,
		0x64,0x73,0x70,0x2D,0x66,0x69,0x6E,0x2D,0x70,0x72,0x6F,0x63,
		0x65,0x73,0x73,0x2D,0x77,0x61,0x76,0x65,0x66,0x6F,0x72,0x6D,
		0x2E,0x63,0x00,0x01;
	.byte4 = .epcline;
	.inc/binary "..\Debug\dsp-fin-process-waveform.sbn", 227, 3521;
	.byte4 = .LN_fixed_point_fit_data_to_straight_line;
	.byte4 = .LN._fixed_point_fit_data_to_straight_line.end;
	.byte =
		0x01,0x01,0x00,0x0E,0x00,0x00,0x00,0x00;
	.byte4 = .LN0;
	.byte4 = .LN._fixed_point_fit_data_to_straight_line.end;
	.byte =
		0x00,0x00,0x0D,0xB2,0x0E,0x00,0x00,0x6F,0x75,0x74,0x70,0x75,
		0x74,0x5F,0x61,0x75,0x67,0x6D,0x65,0x6E,0x74,0x65,0x64,0x5F,
		0x6F,0x72,0x69,0x67,0x69,0x6E,0x61,0x6C,0x5F,0x77,0x61,0x76,
		0x65,0x66,0x6F,0x72,0x6D,0x00,0x01;
	.byte4 = .LN_output_augmented_original_waveform;
	.byte4 = .LN._output_augmented_original_waveform.end;
	.byte =
		0x01,0x01,0x00,0x0F,0x69,0x5F,0x63,0x72,0x6F,0x73,0x73,0x69,
		0x6E,0x67,0x00,0x12,0x05,0x00,0x00,0x02,0x7F,0x14,0x00,0x0F,
		0x69,0x5F,0x74,0x68,0x72,0x65,0x73,0x68,0x6F,0x6C,0x64,0x00,
		0x12,0x05,0x00,0x00,0x02,0x7F,0x18,0x00,0x0F,0x69,0x5F,0x66,
		0x69,0x72,0x73,0x74,0x5F,0x69,0x6E,0x5F,0x77,0x69,0x6E,0x64,
		0x6F,0x77,0x00,0x12,0x05,0x00,0x00,0x02,0x7F,0x1C,0x00,0x0F,
		0x69,0x5F,0x6C,0x61,0x73,0x74,0x5F,0x69,0x6E,0x5F,0x77,0x69,
		0x6E,0x64,0x6F,0x77,0x00,0x12,0x05,0x00,0x00,0x02,0x7F,0x20,
		0x00,0x0E,0x00,0x00,0x00,0x00;
	.byte4 = .LN27;
	.byte4 = .LN._output_augmented_original_waveform.end;
	.byte =
		0x00,0x00,0x0D,0xDE,0x0E,0x00,0x00,0x61,0x64,0x5F,0x66,0x66,
		0x74,0x5F,0x69,0x6E,0x69,0x74,0x00,0x01;
	.byte4 = .LN_ad_fft_init;
	.byte4 = .LN._ad_fft_init.end;
	.byte =
		0x01,0x01,0x00,0x0E,0x00,0x00,0x00,0x00;
	.byte4 = .LN50;
	.byte4 = .LN._ad_fft_init.end;
	.byte =
		0x00,0x00,0x0D,0x30,0x0F,0x00,0x00,0x61,0x64,0x5F,0x66,0x66,
		0x74,0x00,0x01;
	.byte4 = .LN_ad_fft;
	.byte4 = .LN._ad_fft.end;
	.byte =
		0x01,0x01,0x00,0x0E,0x00,0x00,0x00,0x00;
	.byte4 = .LN59;
	.byte4 = .LN._ad_fft.end;
	.byte =
		0x10,0x62,0x6C,0x6F,0x63,0x6B,0x5F,0x65,0x78,0x70,0x6F,0x6E,
		0x65,0x6E,0x74,0x00,0x01,0xC7,0x01,0x00,0x00,0x02,0x7F,0x08,
		0x00,0x00,0x00,0x00,0x00,0x0E,0x00,0x00,0x00,0x00;
	.byte4 = .LN66;
	.byte4 = .LN83;
	.byte =
		0x00,0x00,0x00,0x0D,0xBD,0x0F,0x00,0x00,0x70,0x72,0x6F,0x63,
		0x65,0x73,0x73,0x5F,0x77,0x61,0x76,0x65,0x66,0x6F,0x72,0x6D,
		0x00,0x01;
	.byte4 = .LN_process_waveform;
	.byte4 = .LN._process_waveform.end;
	.byte =
		0x01,0x01,0x00,0x0E,0x00,0x00,0x00,0x00;
	.byte4 = .LN96;
	.byte4 = .LN._process_waveform.end;
	.byte =
		0x10,0x70,0x61,0x72,0x74,0x69,0x61,0x6C,0x5F,0x73,0x75,0x6D,
		0x00,0x01,0xBD,0x0F,0x00,0x00,0x02,0x7F,0x70,0x00,0x00,0x00,
		0x00,0x00,0x11,0x64,0x6F,0x6E,0x65,0x00;
	.byte4 = .LN173;
	.byte =
		0x0E,0x91,0x0F,0x00,0x00;
	.byte4 = .LN145;
	.byte4 = .LN161;
	.byte =
		0x00,0x0E,0x9F,0x0F,0x00,0x00;
	.byte4 = .LN161;
	.byte4 = .LN171;
	.byte =
		0x00,0x0E,0xAD,0x0F,0x00,0x00;
	.byte4 = .LN162;
	.byte4 = .LN164;
	.byte =
		0x00,0x0E,0x00,0x00,0x00,0x00;
	.byte4 = .LN_process_waveform;
	.byte4 = .LN._process_waveform.end;
	.byte =
		0x00,0x00,0x00,0x0B,0xCB,0x0F,0x00,0x00,0x73,0x05,0x00,0x00,
		0x0C,0x04,0x00,0x03,0x00,0x10,0x62,0x75,0x66,0x66,0x65,0x72,
		0x30,0x00,0x01,0xCA,0x12,0x00,0x00,0x05,0x0C;
	.byte4 = _buffer0;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x10,0x78,0x5F,0x66,0x69,0x78,0x65,
		0x64,0x00,0x01,0xB5,0x12,0x00,0x00,0x05,0x0C;
	.byte4 = _x_fixed;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x10,0x79,0x5F,0x66,0x69,0x78,0x65,
		0x64,0x00,0x01,0xB5,0x12,0x00,0x00,0x05,0x0C;
	.byte4 = _y_fixed;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x10,0x61,0x5F,0x66,0x69,0x78,0x65,
		0x64,0x00,0x01,0xBF,0x05,0x00,0x00,0x05,0x0C;
	.byte4 = _a_fixed;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x10,0x62,0x5F,0x66,0x69,0x78,0x65,
		0x64,0x00,0x01,0xBF,0x05,0x00,0x00,0x05,0x0C;
	.byte4 = _b_fixed;
	.inc/binary "..\Debug\dsp-fin-process-waveform.sbn", 3748, 372;
	.byte4 = _delay;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x10,0x41,0x53,0x49,0x43,0x5F,0x30,
		0x31,0x31,0x33,0x5F,0x70,0x65,0x64,0x65,0x73,0x74,0x61,0x6C,
		0x00,0x01,0xA7,0x12,0x00,0x00,0x05,0x0C;
	.byte4 = _ASIC_0113_pedestal;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x10,0x41,0x53,0x49,0x43,0x5F,0x30,
		0x31,0x31,0x33,0x5F,0x64,0x65,0x6C,0x74,0x61,0x5F,0x74,0x00,
		0x01,0x99,0x12,0x00,0x00,0x05,0x0C;
	.byte4 = _ASIC_0113_delta_t;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x10,0x74,0x77,0x69,0x64,0x64,0x6C,
		0x65,0x00,0x01,0x8B,0x12,0x00,0x00,0x05,0x0C;
	.byte4 = _twiddle;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x10,0x69,0x6E,0x00,0x01,0x7D,0x12,
		0x00,0x00,0x05,0x0C;
	.byte4 = _in;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x10,0x6F,0x75,0x74,0x00,0x01,0x6F,
		0x12,0x00,0x00,0x05,0x0C;
	.byte4 = _out;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x10,0x66,0x69,0x6C,0x74,0x65,0x72,
		0x00,0x01,0x61,0x12,0x00,0x00,0x05,0x0C;
	.byte4 = _filter;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x0B,0x6F,0x12,0x00,0x00,0xA5,0x01,
		0x00,0x00,0x0C,0x40,0x00,0x3F,0x00,0x0B,0x7D,0x12,0x00,0x00,
		0x39,0x0A,0x00,0x00,0x0C,0x40,0x00,0x3F,0x00,0x0B,0x8B,0x12,
		0x00,0x00,0x80,0x04,0x00,0x00,0x0C,0x40,0x00,0x3F,0x00,0x0B,
		0x99,0x12,0x00,0x00,0x39,0x0A,0x00,0x00,0x0C,0x40,0x00,0x3F,
		0x00,0x0B,0xA7,0x12,0x00,0x00,0xA5,0x01,0x00,0x00,0x0C,0x40,
		0x00,0x3F,0x00,0x0B,0xB5,0x12,0x00,0x00,0xB5,0x01,0x00,0x00,
		0x0C,0x40,0x00,0x3F,0x00,0x04,0x00,0xA8,0x05,0x00,0x00,0x0B,
		0xCA,0x12,0x00,0x00,0xB5,0x01,0x00,0x00,0x0C,0x80,0x01,0x00,
		0x7F,0x00,0x0B,0x00,0x00,0x00,0x00,0xBB,0x12,0x00,0x00,0x0C,
		0x04,0x00,0x03,0x00,0x00;
.epcdebug.end:

	.section .debug_line SHT_DEBUGINFO;

	.align 1;
.epcline:
	.type .epcline,STT_OBJECT;
	.inc/binary "..\Debug\dsp-fin-process-waveform.sbn", 4120, 3281;
	.byte4 = .LN_fixed_point_fit_data_to_straight_line;
	.byte =
		0x04,0x01,0x05,0x44,0x03,0xEB,0x04,0x01,0x00,0x05,0x02;
	.byte4 = .LN0;
	.byte =
		0x05,0x02,0x1D,0x00,0x05,0x02;
	.byte4 = .LN1;
	.byte =
		0x05,0x44,0x03,0x6C,0x01,0x00,0x05,0x02;
	.byte4 = .LN2;
	.byte =
		0x05,0x02,0x1D,0x00,0x05,0x02;
	.byte4 = .LN3;
	.byte =
		0x05,0x03,0x0A,0x00,0x05,0x02;
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
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN8;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN9;
	.byte =
		0x05,0x02,0x0C,0x00,0x05,0x02;
	.byte4 = .LN10;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN11;
	.byte =
		0x05,0x03,0x0A,0x00,0x05,0x02;
	.byte4 = .LN12;
	.byte =
		0x05,0x02,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN13;
	.byte =
		0x05,0x03,0x0C,0x00,0x05,0x02;
	.byte4 = .LN14;
	.byte =
		0x03,0x7E,0x01,0x00,0x05,0x02;
	.byte4 = .LN15;
	.byte =
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN16;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN17;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN18;
	.byte =
		0x03,0x7E,0x01,0x00,0x05,0x02;
	.byte4 = .LN19;
	.byte =
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN20;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN21;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN22;
	.byte =
		0x05,0x02,0x0B,0x00,0x05,0x02;
	.byte4 = .LN23;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN24;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN25;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN26;
	.byte =
		0x05,0x01,0x0D,0x00,0x05,0x02;
	.byte4 = .LN._fixed_point_fit_data_to_straight_line.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_output_augmented_original_waveform;
	.byte =
		0x04,0x01,0x05,0xCE,0x01,0x03,0xCE,0x04,0x01,0x00,0x05,0x02;
	.byte4 = .LN27;
	.byte =
		0x05,0x1F,0x0B,0x00,0x05,0x02;
	.byte4 = .LN28;
	.byte =
		0x05,0x7B,0x01,0x00,0x05,0x02;
	.byte4 = .LN29;
	.byte =
		0x05,0x02,0x0B,0x00,0x05,0x02;
	.byte4 = .LN30;
	.byte =
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN31;
	.byte =
		0x03,0x7E,0x01,0x00,0x05,0x02;
	.byte4 = .LN32;
	.byte =
		0x05,0x03,0x1C,0x00,0x05,0x02;
	.byte4 = .LN33;
	.byte =
		0x05,0x02,0x03,0x6F,0x01,0x00,0x05,0x02;
	.byte4 = .LN34;
	.byte =
		0x05,0x03,0x0E,0x00,0x05,0x02;
	.byte4 = .LN35;
	.byte =
		0x0C,0x00,0x05,0x02;
	.byte4 = .LN36;
	.byte =
		0x05,0xCE,0x01,0x03,0x72,0x01,0x00,0x05,0x02;
	.byte4 = .LN37;
	.byte =
		0x05,0x03,0x1A,0x00,0x05,0x02;
	.byte4 = .LN38;
	.byte =
		0x05,0xCE,0x01,0x03,0x6F,0x01,0x00,0x05,0x02;
	.byte4 = .LN39;
	.byte =
		0x05,0x03,0x1B,0x00,0x05,0x02;
	.byte4 = .LN40;
	.byte =
		0x05,0xCE,0x01,0x03,0x6E,0x01,0x00,0x05,0x02;
	.byte4 = .LN41;
	.byte =
		0x05,0x03,0x1C,0x00,0x05,0x02;
	.byte4 = .LN42;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN43;
	.byte =
		0x05,0xCE,0x01,0x03,0x6C,0x01,0x00,0x05,0x02;
	.byte4 = .LN44;
	.byte =
		0x05,0x03,0x1E,0x00,0x05,0x02;
	.byte4 = .LN45;
	.byte =
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN46;
	.byte =
		0x05,0x15,0x03,0x6F,0x01,0x00,0x05,0x02;
	.byte4 = .LN47;
	.byte =
		0x05,0x02,0x01,0x00,0x05,0x02;
	.byte4 = .LN48;
	.byte =
		0x1C,0x00,0x05,0x02;
	.byte4 = .LN49;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.byte4 = .LN._output_augmented_original_waveform.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_ad_fft_init;
	.byte =
		0x04,0x01,0x05,0x18,0x46,0x00,0x05,0x02;
	.byte4 = .LN50;
	.byte =
		0x05,0x12,0x0B,0x00,0x05,0x02;
	.byte4 = .LN51;
	.byte =
		0x05,0x03,0x0B,0x00,0x05,0x02;
	.byte4 = .LN52;
	.byte =
		0x05,0x19,0x01,0x00,0x05,0x02;
	.byte4 = .LN53;
	.byte =
		0x05,0x03,0x01,0x00,0x05,0x02;
	.byte4 = .LN54;
	.byte =
		0x05,0x12,0x03,0x7E,0x01,0x00,0x05,0x02;
	.byte4 = .LN55;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN56;
	.byte =
		0x05,0x03,0x0A,0x00,0x05,0x02;
	.byte4 = .LN57;
	.byte =
		0x05,0x02,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN58;
	.byte =
		0x05,0x01,0x0C,0x00,0x05,0x02;
	.byte4 = .LN._ad_fft_init.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_ad_fft;
	.byte =
		0x04,0x01,0x05,0x13,0x87,0x00,0x05,0x02;
	.byte4 = .LN59;
	.byte =
		0x05,0x0B,0x0F,0x00,0x05,0x02;
	.byte4 = .LN60;
	.byte =
		0x05,0x02,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN61;
	.byte =
		0x05,0x0B,0x0A,0x00,0x05,0x02;
	.byte4 = .LN62;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN63;
	.byte =
		0x03,0x7E,0x01,0x00,0x05,0x02;
	.byte4 = .LN64;
	.byte =
		0x0D,0x00,0x05,0x02;
	.byte4 = .LN65;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN66;
	.byte =
		0x05,0x14,0x12,0x00,0x05,0x02;
	.byte4 = .LN67;
	.byte =
		0x05,0x03,0x0A,0x00,0x05,0x02;
	.byte4 = .LN68;
	.byte =
		0x05,0x04,0x0D,0x00,0x05,0x02;
	.byte4 = .LN69;
	.byte =
		0x03,0x7D,0x01,0x00,0x05,0x02;
	.byte4 = .LN70;
	.byte =
		0x0D,0x00,0x05,0x02;
	.byte4 = .LN71;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN72;
	.byte =
		0x03,0x7C,0x01,0x00,0x05,0x02;
	.byte4 = .LN73;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN74;
	.byte =
		0x05,0x03,0x0E,0x00,0x05,0x02;
	.byte4 = .LN75;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN76;
	.byte =
		0x05,0x04,0x0D,0x00,0x05,0x02;
	.byte4 = .LN77;
	.byte =
		0x03,0x7D,0x01,0x00,0x05,0x02;
	.byte4 = .LN78;
	.byte =
		0x0D,0x00,0x05,0x02;
	.byte4 = .LN79;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN80;
	.byte =
		0x03,0x7C,0x01,0x00,0x05,0x02;
	.byte4 = .LN81;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN82;
	.byte =
		0x05,0x02,0x03,0x6A,0x01,0x00,0x05,0x02;
	.byte4 = .LN83;
	.byte =
		0x03,0x7D,0x01,0x00,0x05,0x02;
	.byte4 = .LN84;
	.byte =
		0x28,0x00,0x05,0x02;
	.byte4 = .LN85;
	.byte =
		0x03,0x5F,0x01,0x00,0x05,0x02;
	.byte4 = .LN86;
	.byte =
		0x2B,0x00,0x05,0x02;
	.byte4 = .LN87;
	.byte =
		0x05,0x0B,0x03,0x5F,0x01,0x00,0x05,0x02;
	.byte4 = .LN88;
	.byte =
		0x2B,0x00,0x05,0x02;
	.byte4 = .LN89;
	.byte =
		0x03,0x5E,0x01,0x00,0x05,0x02;
	.byte4 = .LN90;
	.byte =
		0x2B,0x00,0x05,0x02;
	.byte4 = .LN91;
	.byte =
		0x03,0x5E,0x01,0x00,0x05,0x02;
	.byte4 = .LN92;
	.byte =
		0x2B,0x00,0x05,0x02;
	.byte4 = .LN93;
	.byte =
		0x05,0x02,0x03,0x5F,0x01,0x00,0x05,0x02;
	.byte4 = .LN94;
	.byte =
		0x2B,0x00,0x05,0x02;
	.byte4 = .LN95;
	.byte =
		0x05,0x01,0x0F,0x00,0x05,0x02;
	.byte4 = .LN._ad_fft.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_process_waveform;
	.byte =
		0x04,0x01,0x05,0x35,0xB8,0x00,0x05,0x02;
	.byte4 = .LN96;
	.byte =
		0x05,0x12,0x37,0x00,0x05,0x02;
	.byte4 = .LN97;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN98;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN99;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN100;
	.byte =
		0x05,0x04,0x23,0x00,0x05,0x02;
	.byte4 = .LN101;
	.byte =
		0x05,0x05,0x0F,0x00,0x05,0x02;
	.byte4 = .LN102;
	.byte =
		0x05,0x06,0x0B,0x00,0x05,0x02;
	.byte4 = .LN103;
	.byte =
		0x05,0x02,0x0F,0x00,0x05,0x02;
	.byte4 = .LN104;
	.byte =
		0x1C,0x00,0x05,0x02;
	.byte4 = .LN105;
	.byte =
		0x03,0x6D,0x01,0x00,0x05,0x02;
	.byte4 = .LN106;
	.byte =
		0x05,0x04,0x2A,0x00,0x05,0x02;
	.byte4 = .LN107;
	.byte =
		0x05,0x02,0x03,0x72,0x01,0x00,0x05,0x02;
	.byte4 = .LN108;
	.byte =
		0x05,0x05,0x0D,0x00,0x05,0x02;
	.byte4 = .LN109;
	.byte =
		0x05,0x06,0x0E,0x00,0x05,0x02;
	.byte4 = .LN110;
	.byte =
		0x05,0x05,0x03,0x7B,0x01,0x00,0x05,0x02;
	.byte4 = .LN111;
	.byte =
		0x05,0x04,0x13,0x00,0x05,0x02;
	.byte4 = .LN112;
	.byte =
		0x05,0x05,0x03,0x76,0x01,0x00,0x05,0x02;
	.byte4 = .LN113;
	.byte =
		0x05,0x06,0x0E,0x00,0x05,0x02;
	.byte4 = .LN114;
	.byte =
		0x05,0x05,0x03,0x7B,0x01,0x00,0x05,0x02;
	.byte4 = .LN115;
	.byte =
		0x05,0x04,0x13,0x00,0x05,0x02;
	.byte4 = .LN116;
	.byte =
		0x05,0x02,0x03,0x72,0x01,0x00,0x05,0x02;
	.byte4 = .LN117;
	.byte =
		0x05,0x03,0x4D,0x00,0x05,0x02;
	.byte4 = .LN118;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN119;
	.byte =
		0x05,0x04,0x0C,0x00,0x05,0x02;
	.byte4 = .LN120;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN121;
	.byte =
		0x05,0x03,0x0F,0x00,0x05,0x02;
	.byte4 = .LN122;
	.byte =
		0x05,0x04,0x03,0x7A,0x01,0x00,0x05,0x02;
	.byte4 = .LN123;
	.byte =
		0x05,0x03,0x0F,0x00,0x05,0x02;
	.byte4 = .LN124;
	.byte =
		0x05,0x04,0x03,0x7A,0x01,0x00,0x05,0x02;
	.byte4 = .LN125;
	.byte =
		0x05,0x03,0x0F,0x00,0x05,0x02;
	.byte4 = .LN126;
	.byte =
		0x05,0x05,0x0B,0x00,0x05,0x02;
	.byte4 = .LN127;
	.byte =
		0x05,0x03,0x15,0x00,0x05,0x02;
	.byte4 = .LN128;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN129;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN130;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN131;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN132;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN133;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN134;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN135;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN136;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN137;
	.byte =
		0x10,0x00,0x05,0x02;
	.byte4 = .LN138;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN139;
	.byte =
		0x05,0x04,0x0A,0x00,0x05,0x02;
	.byte4 = .LN140;
	.byte =
		0x05,0x03,0x0B,0x00,0x05,0x02;
	.byte4 = .LN141;
	.byte =
		0x05,0x48,0x01,0x00,0x05,0x02;
	.byte4 = .LN142;
	.byte =
		0x05,0x03,0x01,0x00,0x05,0x02;
	.byte4 = .LN143;
	.byte =
		0x05,0x04,0x0A,0x00,0x05,0x02;
	.byte4 = .LN144;
	.byte =
		0x05,0x03,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN145;
	.byte =
		0x1F,0x00,0x05,0x02;
	.byte4 = .LN146;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN147;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN148;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN149;
	.byte =
		0x05,0x02,0x03,0x73,0x01,0x00,0x05,0x02;
	.byte4 = .LN150;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN151;
	.byte =
		0x05,0x03,0x14,0x00,0x05,0x02;
	.byte4 = .LN152;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN153;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN154;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN155;
	.byte =
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN156;
	.byte =
		0x05,0x02,0x03,0x72,0x01,0x00,0x05,0x02;
	.byte4 = .LN157;
	.byte =
		0x05,0x03,0x17,0x00,0x05,0x02;
	.byte4 = .LN158;
	.byte =
		0x05,0x11,0x01,0x00,0x05,0x02;
	.byte4 = .LN159;
	.byte =
		0x05,0x03,0x0A,0x00,0x05,0x02;
	.byte4 = .LN160;
	.byte =
		0x2E,0x00,0x05,0x02;
	.byte4 = .LN161;
	.byte =
		0x05,0x0A,0x7D,0x00,0x05,0x02;
	.byte4 = .LN162;
	.byte =
		0x05,0x03,0x03,0xA0,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN163;
	.byte =
		0x26,0x00,0x05,0x02;
	.byte4 = .LN164;
	.byte =
		0x05,0x0A,0x4C,0x00,0x05,0x02;
	.byte4 = .LN165;
	.byte =
		0x05,0x04,0x0A,0x00,0x05,0x02;
	.byte4 = .LN166;
	.byte =
		0x05,0x0A,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN167;
	.byte =
		0x05,0x04,0x0A,0x00,0x05,0x02;
	.byte4 = .LN168;
	.byte =
		0x05,0x0A,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN169;
	.byte =
		0x05,0x02,0x03,0x78,0x01,0x00,0x05,0x02;
	.byte4 = .LN170;
	.byte =
		0x05,0x26,0x12,0x00,0x05,0x02;
	.byte4 = .LN171;
	.byte =
		0x05,0x02,0x0D,0x00,0x05,0x02;
	.byte4 = .LN172;
	.byte =
		0x05,0x48,0x03,0x9B,0x7E,0x01,0x00,0x05,0x02;
	.byte4 = .LN173;
	.byte =
		0x05,0x02,0xF2,0x00,0x05,0x02;
	.byte4 = .LN174;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN._process_waveform.end;
	.byte =
		0x00,0x01,0x01;
.epcline.end:

	.section .annotations SHT_DEBUGINFO;

	.align 1;
.epcannot:
	.type .epcannot,STT_OBJECT;
	.inc/binary "..\Debug\dsp-fin-process-waveform.sbn", 7401, 8180;
.epcannot.end:

	.section .debug_pubnames SHT_DEBUGINFO;

	.align 1;
.epcpubnames:
	.type .epcpubnames,STT_OBJECT;
	.byte =
		0xEC,0x00,0x00,0x00,0x02,0x00;
	.byte4 = .epcdebug;
	.inc/binary "..\Debug\dsp-fin-process-waveform.sbn", 15581, 230;
.epcpubnames.end:

	.section .debug_aranges SHT_DEBUGINFO;

	.align 1;
.epcaranges:
	.type .epcaranges,STT_OBJECT;
	.byte =
		0x3C,0x00,0x00,0x00,0x02,0x00;
	.byte4 = .epcdebug;
	.byte =
		0x04,0x00,0x00,0x00,0x00,0x00;
	.byte4 = .LN_fixed_point_fit_data_to_straight_line;
	.byte4 = .LN._fixed_point_fit_data_to_straight_line.end-.LN_fixed_point_fit_data_to_straight_line;
	.byte4 = .LN_output_augmented_original_waveform;
	.byte4 = .LN._output_augmented_original_waveform.end-.LN_output_augmented_original_waveform;
	.byte4 = .LN_ad_fft_init;
	.byte4 = .LN._ad_fft_init.end-.LN_ad_fft_init;
	.byte4 = .LN_ad_fft;
	.byte4 = .LN._ad_fft.end-.LN_ad_fft;
	.byte4 = .LN_process_waveform;
	.byte4 = .LN._process_waveform.end-.LN_process_waveform;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00;
.epcaranges.end:

	.section/DOUBLE32 data1;

	.align 4;
_ASIC_0113_pedestal:
	.global _ASIC_0113_pedestal;
	.type _ASIC_0113_pedestal,STT_OBJECT;
	.inc/binary "..\Debug\dsp-fin-process-waveform.sbn", 15811, 128;
._ASIC_0113_pedestal.end:
	.align 4;
_ASIC_0113_delta_t:
	.global _ASIC_0113_delta_t;
	.type _ASIC_0113_delta_t,STT_OBJECT;
	.inc/binary "..\Debug\dsp-fin-process-waveform.sbn", 15939, 128;
._ASIC_0113_delta_t.end:

	.section/ZERO_INIT/DOUBLE32 bsz;

	.align 4;
	.global _twiddle;
	.type _twiddle,STT_OBJECT;
	.byte _twiddle[256];
._twiddle.end:
	.align 4;
	.global _in;
	.type _in,STT_OBJECT;
	.byte _in[128];
._in.end:
	.align 4;
	.global _out;
	.type _out,STT_OBJECT;
	.byte _out[256];
._out.end:

	.section/DOUBLE32 data1;

	.align 4;
_filter:
	.global _filter;
	.type _filter,STT_OBJECT;
	.inc/binary "..\Debug\dsp-fin-process-waveform.sbn", 16067, 128;
._filter.end:

	.extern _buffer0;
	.type _buffer0,STT_OBJECT;
	.extern _x_fixed;
	.type _x_fixed,STT_OBJECT;
	.extern _y_fixed;
	.type _y_fixed,STT_OBJECT;
	.extern _a_fixed;
	.type _a_fixed,STT_OBJECT;
	.extern _b_fixed;
	.type _b_fixed,STT_OBJECT;
