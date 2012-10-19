	.file "..\..\src\numerical-recipes-in-c\fit.c";
//  Compilation time: Wed Jan 20 22:50:33 2010

//  Compiler options: -c -file-attr ProjectName=CoreA -O -Ov100 -g -save-temps -path-output ..\Debug -structs-do-not-overlap -no-multiline -double-size-32 -decls-strong -warn-protos -proc ADSP-BF561 -o ..\Debug\fit.doj -MM
//  Architecture: ADSP-BF561
//  Silicon revision: 0.5
//  Anomalies summary:
//   Disabled: w05_00_0046,w05_00_0048,w05_00_0054,w05_00_0071,w05_00_0103,w05_00_0104,w05_00_0157,w05_00_0164,w05_00_0165,w05_00_0195,w05_00_0198,w05_00_0202,w05_00_0209,w05_00_0227,w05_00_0244,w05_00_0245,w05_00_0246,w05_00_0248,w05_00_0257,w05_00_0262,w05_00_0264,w05_00_0283,wF3_F_021,wF3_F_008_F3_F_013,w05_00_0311
//   Enabled: w05_00_0120,w05_00_0127,w05_00_0189,w05_00_0312
//   Always on: w05_00_0074,w05_00_0122

	.section/DOUBLE32 program;

.epctext:
	.align 4;
_fit_without_statistics:
.LN_fit_without_statistics:
	.reference _sqrarg;
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 4 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,P0-P1,I0-I3,ASTAT0-ASTAT1,CC,LC0-LC1,LT0-LT1,LB0-LB1}
//   Call preserved registers used:{R4.L,R4.H,R5.L,R5.H,R6.L,R6.H,R7.L,R7.H,P3-P5,FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,A0.W,A0.X,A1.W,A1.X,ASTAT0-ASTAT1,CC,AQ,LC0,LT0,LB0,RETS}
//-------------------------------------------------------------------
// line "..\..\src\numerical-recipes-in-c\fit.c":155
	LINK 4;
	.align 2
	[--SP] = (R7:4, P5:3);
	SP += -12;
	P3 = [FP + 32];
	I3 = R0;
	R0 = [FP + 24];
.LN0:
// line 160
	R7 = 0;
.LN1:
// line 161
	CC = R0 == 0;
.LN2:
// line 160
	[P3] = R7;
.LN3:
// line 155
	[SP + 52] = R2;
	I0 = R1;
	P5 = [FP + 20];
.LN4:
// line 161
	if CC jump .P34L2 ;

.P34L1:
	R0 = 0;
.LN5:
// line 163
	CC = R2 <= 0;
	[SP + 60] = R0;
	[SP + 56] = R0;
	R6 = 0;
	if CC jump .P34L3 ;

.P34L27:
	P0 = [SP + 52];
	P1.L = .epcbss;
	P1.H = .epcbss;
.LN6:
// line 164
	R0 = 0 /* 1065353216 */;
	R0.H = 16256 /* 1065353216 */;
	[SP + 60] = P1;
	[SP + 40] = R0;
	I2 = P5;
	I1 = I3;
	P4 = I0;
	R5 = 0;
.LN7:
// line 163
	LOOP .P34L5L LC1 = P0;

.P34L5:
//-------------------------------------------------------------------
//   Loop at "..\..\src\numerical-recipes-in-c\fit.c" line 163 col 3
//-------------------------------------------------------------------
	LOOP_BEGIN .P34L5L;
.LN8:
// line 164
	P1 = [SP + 60] || R0 = [I2++];
	R1 = R0;
	BITCLR(R1, 31);
	CC = R1 == 0;
	[P1] = R0;
	R1 = 0;
	if CC jump .P34L9 ;

.P34L8:
	R1 = R0;
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	R1 = R0;

.P34L9:
	R0 = [SP + 40];
	CALL.X (___float32_div);                // float division is implemented as a library call. 
.LN9:
// line 165
	R1 = R5;
	R4 = R0;
	R5 = R0;
	CALL.X (___float32_add);                // float addition is implemented as a library call. 
.LN10:
// line 166
	R1 = R5;
.LN11:
// line 165
	R5 = ROT R0 BY 0 || R0 = [I1++];
.LN12:
// line 166
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	R1 = R6;
	CALL.X (___float32_add);                // float addition is implemented as a library call. 
	R6 = ROT R0 BY 0 || R1 = [P4++];
.LN13:
// line 167
	R0 = R4;
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	R1 = [SP + 56];
	CALL.X (___float32_add);                // float addition is implemented as a library call. 
	[SP + 56] = R0;
.LN14:
// line 163
	LOOP_END .P34L5L;

.P34L34:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------
	[SP + 56] = R0;
	[SP + 60] = R5;

.P34L3:
.LN15:
// line 176
	R0 = ROT R6 BY 0 || R1 = [SP + 60];
	CALL.X (___float32_div);                // float division is implemented as a library call. 
.LN16:
// line 155
	R1 = [FP + 24];
.LN17:
// line 177
	CC = R1 == 0;
.LN18:
// line 176
	[SP + 40] = R0;
.LN19:
// line 177
	if CC jump .P34L14 ;

.P34L13:
.LN20:
// line 178
	R0 = [SP + 52];
	CC = R0 <= 0;
	R1 = 0;
	if CC jump .P34L15 ;

.P34L31:
	P1 = [SP + 52];
.LN21:
// line 181
	R0 = [P3];
	[SP + 52] = R0;
	// -- stall --
.LN22:
// line 178
	LOOP .P34L17L LC1 = P1;

.P34L17:
//-------------------------------------------------------------------
//   Loop at "..\..\src\numerical-recipes-in-c\fit.c" line 178 col 3
//-------------------------------------------------------------------
//   This loop executes 1 iteration of the original loop in estimated 19 cycles.
//   (cycle count 19 excludes the cost of the inner function calls)
//-------------------------------------------------------------------
//   This loop's resource usage is:
//     Group 1             used  18 out of   19 ( 94.7%)
//     16-bit Instruction  used  33 out of   38 ( 86.8%)
//     32-bit Instruction  used  14 out of   19 ( 73.7%)
//     Store               used   2 out of   19 ( 10.5%)
//-------------------------------------------------------------------
// This loop was not modulo scheduled because it contains calls or volatile operations.
//-------------------------------------------------------------------
	LOOP_BEGIN .P34L17L;
.LN23:
// line 179
	R1 = [SP + 40] || R0 = [I3++];
	CALL.X (___float32_sub);                // float  is implemented as a library call. 
	R5 = [P5++];
	R1 = R5;
	CALL.X (___float32_div);                // float division is implemented as a library call. 
.LN24:
// line 180
	R1 = R0;
	R4 = R0;
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	R1 = R7;
	CALL.X (___float32_add);                // float addition is implemented as a library call. 
	R7 = ROT R0 BY 0 || R0 = [I0++];
.LN25:
// line 181
	R1 = R4;
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	R1 = R5;
	CALL.X (___float32_div);                // float division is implemented as a library call. 
	R1 = [SP + 52];
	CALL.X (___float32_add);                // float addition is implemented as a library call. 
	[P3] = R0;
	[SP + 52] = R0;
.LN26:
// line 178
	LOOP_END .P34L17L;

.P34L35:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------
	R1 = R7;

.P34L15:
.LN27:
// line 190
	R0 = [P3];
	CALL.X (___float32_div);                // float division is implemented as a library call. 
.LN28:
// line 191
	R1 = ROT R6 BY 0 || [P3] = R0;
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	R1 = ROT R0 BY 0 || R0 = [SP + 56];
	CALL.X (___float32_sub);                // float  is implemented as a library call. 
	R1 = [SP + 60];
	CALL.X (___float32_div);                // float division is implemented as a library call. 
.LN29:
// line 155
	P1 = [FP + 28];
	// -- 3 stalls --
.LN30:
// line 191
	[P1] = R0;
.LN31:
// line 192
	SP += 12;
	P0 = [FP + 4];
	(R7:4, P5:3) = [SP++];
	UNLINK;
	// -- stall --
	JUMP (P0);

.P34L14:
.LN32:
// line 184
	R0 = [SP + 52];
	CC = R0 <= 0;
	R1 = 0;
	if CC jump .P34L15 ;

.P34L33:
	P1 = [SP + 52];
.LN33:
// line 187
	R5 = [P3];
	// -- 2 stalls --
.LN34:
// line 184
	LOOP .P34L20L LC0 = P1;

.P34L20:
//-------------------------------------------------------------------
//   Loop at "..\..\src\numerical-recipes-in-c\fit.c" line 184 col 3
//-------------------------------------------------------------------
//   This loop executes 1 iteration of the original loop in estimated 14 cycles.
//   (cycle count 14 excludes the cost of the inner function calls)
//-------------------------------------------------------------------
//   This loop's resource usage is:
//     16-bit Instruction  used  26 out of   28 ( 92.9%)
//     Group 1             used  13 out of   14 ( 92.9%)
//     32-bit Instruction  used  12 out of   14 ( 85.7%)
//     Store               used   1 out of   14 (  7.1%)
//-------------------------------------------------------------------
// This loop was not modulo scheduled because it contains calls or volatile operations.
//-------------------------------------------------------------------
	LOOP_BEGIN .P34L20L;
.LN35:
// line 185
	R1 = [SP + 40] || R0 = [I3++];
	CALL.X (___float32_sub);                // float  is implemented as a library call. 
.LN36:
// line 186
	R1 = R0;
	R4 = R0;
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	R1 = R7;
	CALL.X (___float32_add);                // float addition is implemented as a library call. 
	R7 = ROT R0 BY 0 || R1 = [I0++];
.LN37:
// line 187
	R0 = R4;
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	R1 = R5;
	CALL.X (___float32_add);                // float addition is implemented as a library call. 
	R5 = R0;
	[P3] = R5;
.LN38:
// line 184
	LOOP_END .P34L20L;

.P34L37:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------
	R1 = R7;
	jump .P34L15;

.P34L2:
.LN39:
// line 170
	CC = R2 <= 0;
	R6 = 0;
	R5 = 0;
	if CC jump .P34L12 ;

.P34L29:
	P1 = [SP + 52];
	I1 = I0;
	I2 = I3;
	// -- stall --
	LOOP .P34L11L LC0 = P1;

.P34L11:
//-------------------------------------------------------------------
//   Loop at "..\..\src\numerical-recipes-in-c\fit.c" line 170 col 3
//-------------------------------------------------------------------
//   This loop executes 1 iteration of the original loop in estimated 6 cycles.
//   (cycle count 6 excludes the cost of the inner function calls)
//-------------------------------------------------------------------
//   This loop's resource usage is:
//     32-bit Instruction  used   6 out of    6 (100.0%)
//     16-bit Instruction  used  10 out of   12 ( 83.3%)
//     Group 1             used   4 out of    6 ( 66.7%)
//-------------------------------------------------------------------
// This loop was not modulo scheduled because it contains calls or volatile operations.
//-------------------------------------------------------------------
	LOOP_BEGIN .P34L11L;
.LN40:
// line 171
	R0 = ROT R6 BY 0 || R1 = [I2++];
	CALL.X (___float32_add);                // float addition is implemented as a library call. 
	R6 = ROT R0 BY 0 || R0 = [I1++];
.LN41:
// line 172
	R1 = R5;
	CALL.X (___float32_add);                // float addition is implemented as a library call. 
	R5 = R0;
.LN42:
// line 170
	LOOP_END .P34L11L;

.P34L40:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------

.P34L12:
.LN43:
// line 174
	R0 = [SP + 52];
	CALL.X (___int32_to_float32);           // instruction is implemented as a library call. 
	[SP + 56] = R5;
	[SP + 60] = R0;
	jump .P34L3;
.LN._fit_without_statistics.end:
._fit_without_statistics.end:
	.global _fit_without_statistics;
	.type _fit_without_statistics,STT_FUNC;

	.align 4;
_original_fit:
.LN_original_fit:
	.reference _sqrarg;
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 12 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,P0-P1,I0-I2,ASTAT0-ASTAT1,CC,LC0-LC1,LT0-LT1,LB0-LB1}
//   Call preserved registers used:{R4.L,R4.H,R5.L,R5.H,R6.L,R6.H,R7.L,R7.H,P3-P5,FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,I0-I3,B0-B3,M0-M3,A0.W,A0.X,A1.W,A1.X,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
// line "..\..\src\numerical-recipes-in-c\fit.c":99
	LINK 12;
	.align 2
	[--SP] = (R7:4, P5:3);
	SP += -12;
	P1.L = .epcbss;
	P1.H = .epcbss;
	[SP + 60] = P1;
	P1 = [FP + 32];
	P3 = R0;
	R0 = [FP + 24];
.LN44:
// line 105
	CC = R0 == 0;
.LN45:
// line 104
	R0 = 0;
	[P1] = R0;
.LN46:
// line 99
	[FP + 12] = R2;
	P5 = R1;
	P4 = [FP + 20];
.LN47:
// line 105
	if CC jump .P40L2 ;

.P40L1:
.LN48:
// line 107
	CC = R2 <= 0;
	[FP + 16] = R0;
	[SP + 48] = R0;
	R7 = 0;
	if CC jump .P40L3 ;

.P40L47:
	P1 = [FP + 12];
.LN49:
// line 108
	R0 = 0 /* 1065353216 */;
	R0.H = 16256 /* 1065353216 */;
	[FP + 16] = R0;
	I0 = P5;
	I1 = P3;
	I2 = P4;
	R6 = 0;
	R5 = 0;
.LN50:
// line 107
	LOOP .P40L5L LC1 = P1;

.P40L5:
//-------------------------------------------------------------------
//   Loop at "..\..\src\numerical-recipes-in-c\fit.c" line 107 col 3
//-------------------------------------------------------------------
	LOOP_BEGIN .P40L5L;
.LN51:
// line 108
	P1 = [SP + 60] || R0 = [I2++];
	R1 = R0;
	BITCLR(R1, 31);
	CC = R1 == 0;
	[P1] = R0;
	R1 = 0;
	if CC jump .P40L9 ;

.P40L8:
	R1 = R0;
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	R1 = R0;

.P40L9:
	R0 = [FP + 16];
	CALL.X (___float32_div);                // float division is implemented as a library call. 
.LN52:
// line 109
	R1 = R5;
	R4 = R0;
	R5 = R0;
	CALL.X (___float32_add);                // float addition is implemented as a library call. 
.LN53:
// line 110
	R1 = R5;
.LN54:
// line 109
	R5 = ROT R0 BY 0 || R0 = [I1++];
.LN55:
// line 110
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	R1 = R7;
	CALL.X (___float32_add);                // float addition is implemented as a library call. 
	R7 = ROT R0 BY 0 || R1 = [I0++];
.LN56:
// line 111
	R0 = R4;
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	R1 = R6;
	CALL.X (___float32_add);                // float addition is implemented as a library call. 
	R6 = R0;
.LN57:
// line 107
	LOOP_END .P40L5L;

.P40L58:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------
	[FP + 16] = R6;
	[SP + 48] = R5;

.P40L3:
.LN58:
// line 120
	R0 = ROT R7 BY 0 || R1 = [SP + 48];
	CALL.X (___float32_div);                // float division is implemented as a library call. 
.LN59:
// line 99
	R1 = [FP + 24];
.LN60:
// line 121
	CC = R1 == 0;
.LN61:
// line 120
	[SP + 44] = R0;
.LN62:
// line 121
	if CC jump .P40L14 ;

.P40L13:
.LN63:
// line 122
	R0 = [FP + 12];
	CC = R0 <= 0;
	R6 = 0;
	if CC jump .P40L15 ;

.P40L51:
.LN64:
// line 99
	P0 = [FP + 32];
.LN65:
// line 122
	P1 = [FP + 12];
	I0 = P5;
	I1 = P3;
.LN66:
// line 125
	R0 = [P0];
	[SP + 40] = R0;
	I2 = P4;
.LN67:
// line 122
	LOOP .P40L17L LC1 = P1;

.P40L17:
//-------------------------------------------------------------------
//   Loop at "..\..\src\numerical-recipes-in-c\fit.c" line 122 col 3
//-------------------------------------------------------------------
//   This loop executes 1 iteration of the original loop in estimated 22 cycles.
//   (cycle count 22 excludes the cost of the inner function calls and it includes 2 stalls)
//-------------------------------------------------------------------
//   This loop's resource usage is:
//     Group 1             used  18 out of   22 ( 81.8%)
//     16-bit Instruction  used  34 out of   44 ( 77.3%)
//     32-bit Instruction  used  14 out of   22 ( 63.6%)
//     Store               used   2 out of   22 (  9.1%)
//-------------------------------------------------------------------
// This loop was not modulo scheduled because it contains calls or volatile operations.
//-------------------------------------------------------------------
	LOOP_BEGIN .P40L17L;
.LN68:
// line 123
	R1 = [SP + 44] || R0 = [I1++];
	CALL.X (___float32_sub);                // float  is implemented as a library call. 
	R5 = [I2++];
	R1 = R5;
	CALL.X (___float32_div);                // float division is implemented as a library call. 
.LN69:
// line 124
	R1 = R0;
	R4 = R0;
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	R1 = R6;
	CALL.X (___float32_add);                // float addition is implemented as a library call. 
	R6 = ROT R0 BY 0 || R0 = [I0++];
.LN70:
// line 125
	R1 = R4;
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	R1 = R5;
	CALL.X (___float32_div);                // float division is implemented as a library call. 
	R1 = [SP + 40];
	CALL.X (___float32_add);                // float addition is implemented as a library call. 
.LN71:
// line 99
	P1 = [FP + 32];
	[SP + 40] = R0;
	// -- 2 stalls --
.LN72:
// line 125
	[P1] = R0;
.LN73:
// line 122
	LOOP_END .P40L17L;

.P40L59:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------

.P40L15:
.LN74:
// line 99
	R1 = ROT R6 BY 0 || P1 = [FP + 32];
.LN75:
// line 136
	R5 = 0 /* 1065353216 */;
	R5.H = 16256 /* 1065353216 */;
	// -- 2 stalls --
.LN76:
// line 134
	R0 = [P1];
	CALL.X (___float32_div);                // float division is implemented as a library call. 
.LN77:
// line 99
	R1 = ROT R7 BY 0 || P1 = [FP + 32];
	// -- 3 stalls --
.LN78:
// line 134
	[P1] = R0;
.LN79:
// line 135
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	R1 = ROT R0 BY 0 || R0 = [FP + 16];
	CALL.X (___float32_sub);                // float  is implemented as a library call. 
	R1 = [SP + 48];
	CALL.X (___float32_div);                // float division is implemented as a library call. 
.LN80:
// line 99
	R1 = ROT R7 BY 0 || P1 = [FP + 28];
	// -- 3 stalls --
.LN81:
// line 135
	R0 = ROT R7 BY 0 || [P1] = R0;
.LN82:
// line 136
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	R7 = ROT R0 BY 0 || R1 = [SP + 48];
	R0 = R6;
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	R1 = R0;
	R0 = R7;
	CALL.X (___float32_div);                // float division is implemented as a library call. 
	R1 = R5;
	CALL.X (___float32_add);                // float addition is implemented as a library call. There is one more instruction related to this call. 
	R1 = [SP + 48];
	CALL.X (___float32_div);                // float division is implemented as a library call. 
.LN83:
	CALL.X (__sqrtf);
.LN84:
// line 99
	R1 = ROT R6 BY 0 || P1 = [FP + 36];
	// -- 3 stalls --
.LN85:
// line 136
	R0 = ROT R5 BY 0 || [P1] = R0;
.LN86:
// line 137
	CALL.X (___float32_div);                // float division is implemented as a library call. 
.LN87:
	CALL.X (__sqrtf);
.LN88:
// line 99
	P1 = [FP + 40];
	// -- 3 stalls --
.LN89:
// line 137
	[P1] = R0;
.LN90:
// line 99
	P1 = [FP + 44];
.LN91:
// line 104
	R0 = 0;
	// -- 2 stalls --
.LN92:
// line 138
	[P1] = R0;
.LN93:
// line 99
	P1 = [FP + 48];
	R0 = [FP + 24];
.LN94:
// line 140
	CC = R0 == 0;
	// -- stall --
.LN95:
// line 139
	[P1] = R5;
.LN96:
// line 140
	if CC jump .P40L22 ;

.P40L23:
.LN97:
// line 147
	R0 = [FP + 12];
	CC = R0 <= 0;
	if CC jump .P40L33 ;

.P40L57:
	P1 = [FP + 12];
	// -- 3 stalls --
	LOOP .P40L32L LC1 = P1;

.P40L32:
//-------------------------------------------------------------------
//   Loop at "..\..\src\numerical-recipes-in-c\fit.c" line 147 col 3
//-------------------------------------------------------------------
	LOOP_BEGIN .P40L32L;
.LN98:
// line 99
	P1 = [FP + 28];
.LN99:
// line 148
	R0 = [P5++];
	// -- 2 stalls --
	R1 = [P1];
	CALL.X (___float32_sub);                // float  is implemented as a library call. 
.LN100:
// line 99
	R7 = ROT R0 BY 0 || P1 = [FP + 32];
.LN101:
// line 148
	R0 = [P3++];
	// -- 2 stalls --
	R1 = [P1];
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	R1 = R0;
	R0 = R7;
	CALL.X (___float32_sub);                // float  is implemented as a library call. 
	R1 = [P4++];
	CALL.X (___float32_div);                // float division is implemented as a library call. 
	R1 = ROT R0 BY 0 || P1 = [SP + 60];
	BITCLR(R1, 31);
	CC = R1 == 0;
	R1 = 0;
	[P1] = R0;
	if CC jump .P40L36 ;

.P40L35:
	R1 = R0;
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	R1 = R0;

.P40L36:
.LN102:
// line 99
	P1 = [FP + 44];
	// -- 3 stalls --
.LN103:
// line 148
	R0 = [P1];
	CALL.X (___float32_add);                // float addition is implemented as a library call. 
.LN104:
// line 99
	P1 = [FP + 44];
	// -- 3 stalls --
.LN105:
// line 148
	[P1] = R0;
.LN106:
// line 147
	LOOP_END .P40L32L;

.P40L62:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------

.P40L33:
.LN107:
// line 149
	R0 = [FP + 12];
	CC = R0 <= 2;
	if !CC jump .P40L37 ;

.P40L24:
.LN108:
// line 151
	SP += 12;
	P0 = [FP + 4];
	(R7:4, P5:3) = [SP++];
	UNLINK;
	// -- stall --
	JUMP (P0);

.P40L37:
.LN109:
// line 149
	R0 += -2;
	CALL.X (___int32_to_float32);           // instruction is implemented as a library call. 
	R7 = 0 /* 1056964608 */;
	R7.H = 16128 /* 1056964608 */;
	R1 = R7;
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. There is one more instruction related to this call. 
.LN110:
// line 99
	R6 = ROT R0 BY 0 || P1 = [FP + 44];
.LN111:
// line 149
	R0 = R7;
	// -- 2 stalls --
	R1 = [P1];
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	R1 = R0;
.LN112:
	R0 = R6;
	CALL.X (_gammq);
.LN113:
// line 99
	P1 = [FP + 48];
	// -- 3 stalls --
.LN114:
// line 149
	[P1] = R0;
	jump .P40L24;

.P40L22:
.LN115:
// line 141
	R0 = [FP + 12];
	CC = R0 <= 0;
	if CC jump .P40L27 ;

.P40L55:
	P1 = [FP + 12];
	// -- 3 stalls --
	LOOP .P40L26L LC0 = P1;

.P40L26:
//-------------------------------------------------------------------
//   Loop at "..\..\src\numerical-recipes-in-c\fit.c" line 141 col 3
//-------------------------------------------------------------------
	LOOP_BEGIN .P40L26L;
.LN116:
// line 99
	P1 = [FP + 28];
.LN117:
// line 142
	R0 = [P5++];
	// -- 2 stalls --
	R1 = [P1];
	CALL.X (___float32_sub);                // float  is implemented as a library call. 
.LN118:
// line 99
	R7 = ROT R0 BY 0 || P1 = [FP + 32];
.LN119:
// line 142
	R1 = [P3++];
	// -- 2 stalls --
	R0 = [P1];
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	R1 = R0;
	R0 = R7;
	CALL.X (___float32_sub);                // float  is implemented as a library call. 
	R1 = ROT R0 BY 0 || P1 = [SP + 60];
	// -- 3 stalls --
	[P1] = R0;
	BITCLR(R0, 31);
	CC = R0 == 0;
	R0 = 0;
	if CC jump .P40L30 ;

.P40L29:
	R0 = R1;
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 

.P40L30:
.LN120:
// line 99
	P1 = [FP + 44];
	// -- 3 stalls --
.LN121:
// line 142
	R1 = [P1];
	CALL.X (___float32_add);                // float addition is implemented as a library call. 
.LN122:
// line 99
	P1 = [FP + 44];
	// -- 3 stalls --
.LN123:
// line 142
	[P1] = R0;
.LN124:
// line 141
	LOOP_END .P40L26L;

.P40L60:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------

.P40L27:
.LN125:
// line 99
	P1 = [FP + 44];
	R0 = [FP + 12];
.LN126:
// line 143
	R0 += -2;
	// -- stall --
	R7 = [P1];
	CALL.X (___int32_to_float32);           // instruction is implemented as a library call. 
	R1 = R0;
	R0 = R7;
	CALL.X (___float32_div);                // float division is implemented as a library call. 
.LN127:
	CALL.X (__sqrtf);
.LN128:
// line 99
	R7 = ROT R0 BY 0 || P1 = [FP + 36];
	// -- 3 stalls --
.LN129:
// line 144
	R1 = [P1];
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
.LN130:
// line 99
	R1 = ROT R7 BY 0 || P1 = [FP + 36];
	// -- 3 stalls --
.LN131:
// line 144
	[P1] = R0;
.LN132:
// line 99
	P1 = [FP + 40];
	// -- 3 stalls --
.LN133:
// line 145
	R0 = [P1];
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
.LN134:
// line 99
	P1 = [FP + 40];
	// -- 3 stalls --
.LN135:
// line 145
	[P1] = R0;
	jump .P40L24;

.P40L14:
.LN136:
// line 128
	R0 = [FP + 12];
	CC = R0 <= 0;
	R6 = 0;
	if CC jump .P40L15 ;

.P40L53:
.LN137:
// line 99
	P0 = [FP + 32];
.LN138:
// line 128
	P1 = [FP + 12];
	I0 = P3;
	I1 = P5;
.LN139:
// line 131
	R5 = [P0];
.LN140:
// line 128
	LOOP .P40L20L LC0 = P1;

.P40L20:
//-------------------------------------------------------------------
//   Loop at "..\..\src\numerical-recipes-in-c\fit.c" line 128 col 3
//-------------------------------------------------------------------
//   This loop executes 1 iteration of the original loop in estimated 17 cycles.
//   (cycle count 17 excludes the cost of the inner function calls and it includes 3 stalls)
//-------------------------------------------------------------------
//   This loop's resource usage is:
//     Group 1             used  13 out of   17 ( 76.5%)
//     16-bit Instruction  used  25 out of   34 ( 73.5%)
//     32-bit Instruction  used  12 out of   17 ( 70.6%)
//     Store               used   1 out of   17 (  5.9%)
//-------------------------------------------------------------------
// This loop was not modulo scheduled because it contains calls or volatile operations.
//-------------------------------------------------------------------
	LOOP_BEGIN .P40L20L;
.LN141:
// line 129
	R1 = [SP + 44] || R0 = [I0++];
	CALL.X (___float32_sub);                // float  is implemented as a library call. 
.LN142:
// line 130
	R1 = R0;
	R4 = R0;
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	R1 = R6;
	CALL.X (___float32_add);                // float addition is implemented as a library call. 
	R6 = ROT R0 BY 0 || R1 = [I1++];
.LN143:
// line 131
	R0 = R4;
	CALL.X (___float32_mul);                // float multiply is implemented as a library call. 
	R1 = R5;
	CALL.X (___float32_add);                // float addition is implemented as a library call. 
.LN144:
// line 99
	R5 = ROT R0 BY 0 || P1 = [FP + 32];
	// -- 3 stalls --
.LN145:
// line 131
	[P1] = R5;
.LN146:
// line 128
	LOOP_END .P40L20L;

.P40L66:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------
	jump .P40L15;

.P40L2:
.LN147:
// line 114
	CC = R2 <= 0;
	R7 = 0;
	R6 = 0;
	if CC jump .P40L12 ;

.P40L49:
	P1 = [FP + 12];
	I0 = P5;
	I1 = P3;
	// -- stall --
	LOOP .P40L11L LC0 = P1;

.P40L11:
//-------------------------------------------------------------------
//   Loop at "..\..\src\numerical-recipes-in-c\fit.c" line 114 col 3
//-------------------------------------------------------------------
//   This loop executes 1 iteration of the original loop in estimated 6 cycles.
//   (cycle count 6 excludes the cost of the inner function calls)
//-------------------------------------------------------------------
//   This loop's resource usage is:
//     32-bit Instruction  used   6 out of    6 (100.0%)
//     16-bit Instruction  used  10 out of   12 ( 83.3%)
//     Group 1             used   4 out of    6 ( 66.7%)
//-------------------------------------------------------------------
// This loop was not modulo scheduled because it contains calls or volatile operations.
//-------------------------------------------------------------------
	LOOP_BEGIN .P40L11L;
.LN148:
// line 115
	R1 = ROT R7 BY 0 || R0 = [I1++];
	CALL.X (___float32_add);                // float addition is implemented as a library call. 
	R7 = ROT R0 BY 0 || R0 = [I0++];
.LN149:
// line 116
	R1 = R6;
	CALL.X (___float32_add);                // float addition is implemented as a library call. 
	R6 = R0;
.LN150:
// line 114
	LOOP_END .P40L11L;

.P40L69:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------

.P40L12:
.LN151:
// line 118
	R0 = [FP + 12];
	CALL.X (___int32_to_float32);           // instruction is implemented as a library call. 
	[FP + 16] = R6;
	[SP + 48] = R0;
	jump .P40L3;
.LN._original_fit.end:
._original_fit.end:
	.global _original_fit;
	.type _original_fit,STT_FUNC;

	.file_attr ProjectName="CoreA";
	.file_attr FuncName="_fit_without_statistics";
	.file_attr FuncName="_original_fit";
	.file_attr Content="CodeData";
.epctext.end:

	.extern ___float32_mul;
	.type ___float32_mul,STT_FUNC;
	.extern ___float32_div;
	.type ___float32_div,STT_FUNC;
	.extern ___float32_add;
	.type ___float32_add,STT_FUNC;
	.extern ___float32_sub;
	.type ___float32_sub,STT_FUNC;
	.extern ___int32_to_float32;
	.type ___int32_to_float32,STT_FUNC;
	.extern __sqrtf;
	.type __sqrtf,STT_FUNC;
	.extern _gammq;
	.type _gammq,STT_FUNC;

	.section/ZERO_INIT/DOUBLE32 bsz;

	.align 4;
.epcbss:
	.type .epcbss,STT_OBJECT;
	.byte _sqrarg[4];
	.type _sqrarg,STT_OBJECT;
	.byte _x_floating[4];
	.global _x_floating;
	.type _x_floating,STT_OBJECT;
	.byte _y_floating[4];
	.global _y_floating;
	.type _y_floating,STT_OBJECT;
.epcbss.end:

	.section .debug_abbrev SHT_DEBUGINFO;

	.align 1;
.epcabbrev:
	.type .epcabbrev,STT_OBJECT;
	.inc/binary "..\Debug\fit.sbn", 0, 218;
.epcabbrev.end:

	.section .debug_info SHT_DEBUGINFO;

	.align 1;
.epcdebug:
	.type .epcdebug,STT_OBJECT;
	.byte =
		0xDC,0x08,0x00,0x00,0x02,0x00;
	.byte4 = .epcabbrev;
	.byte =
		0x04,0x01,0x2E,0x2E,0x5C,0x2E,0x2E,0x5C,0x73,0x72,0x63,0x5C,
		0x6E,0x75,0x6D,0x65,0x72,0x69,0x63,0x61,0x6C,0x2D,0x72,0x65,
		0x63,0x69,0x70,0x65,0x73,0x2D,0x69,0x6E,0x2D,0x63,0x5C,0x66,
		0x69,0x74,0x2E,0x63,0x00,0x01;
	.byte4 = .epcline;
	.inc/binary "..\Debug\fit.sbn", 218, 1574;
	.byte4 = .LN_fit_without_statistics;
	.byte4 = .LN._fit_without_statistics.end;
	.byte =
		0x01,0x01,0x00,0x0E,0x73,0x69,0x67,0x00,0xA8,0x06,0x00,0x00,
		0x02,0x7F,0x14,0x00,0x0E,0x6D,0x77,0x74,0x00,0xC9,0x01,0x00,
		0x00,0x02,0x7F,0x18,0x00,0x0E,0x61,0x00,0xA8,0x06,0x00,0x00,
		0x02,0x7F,0x1C,0x00,0x0E,0x62,0x00,0xA8,0x06,0x00,0x00,0x02,
		0x7F,0x20,0x00,0x0F,0x00,0x00,0x00,0x00;
	.byte4 = .LN0;
	.byte4 = .LN._fit_without_statistics.end;
	.byte =
		0x00,0x00,0x04,0x00,0x4D,0x02,0x00,0x00,0x0D,0x40,0x07,0x00,
		0x00,0x6F,0x72,0x69,0x67,0x69,0x6E,0x61,0x6C,0x5F,0x66,0x69,
		0x74,0x00,0x01;
	.byte4 = .LN_original_fit;
	.byte4 = .LN._original_fit.end;
	.byte =
		0x01,0x01,0x00,0x0E,0x73,0x69,0x67,0x00,0xA8,0x06,0x00,0x00,
		0x02,0x7F,0x14,0x00,0x0E,0x6D,0x77,0x74,0x00,0xC9,0x01,0x00,
		0x00,0x02,0x7F,0x18,0x00,0x0E,0x61,0x00,0xA8,0x06,0x00,0x00,
		0x02,0x7F,0x1C,0x00,0x0E,0x62,0x00,0xA8,0x06,0x00,0x00,0x02,
		0x7F,0x20,0x00,0x0E,0x73,0x69,0x67,0x61,0x00,0xA8,0x06,0x00,
		0x00,0x02,0x7F,0x24,0x00,0x0E,0x73,0x69,0x67,0x62,0x00,0xA8,
		0x06,0x00,0x00,0x02,0x7F,0x28,0x00,0x0E,0x63,0x68,0x69,0x32,
		0x00,0xA8,0x06,0x00,0x00,0x02,0x7F,0x2C,0x00,0x0E,0x71,0x00,
		0xA8,0x06,0x00,0x00,0x02,0x7F,0x30,0x00,0x0F,0x00,0x00,0x00,
		0x00;
	.byte4 = .LN44;
	.byte4 = .LN._original_fit.end;
	.byte =
		0x00,0x00,0x10,0x73,0x71,0x72,0x61,0x72,0x67,0x00,0x01,0x4D,
		0x02,0x00,0x00,0x05,0x0C;
	.byte4 = _sqrarg;
	.inc/binary "..\Debug\fit.sbn", 1792, 359;
	.byte4 = _x_floating;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x10,0x79,0x5F,0x66,0x6C,0x6F,0x61,
		0x74,0x69,0x6E,0x67,0x00,0x01,0xA8,0x06,0x00,0x00,0x05,0x0C;
	.byte4 = _y_floating;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x00;
.epcdebug.end:

	.section .debug_line SHT_DEBUGINFO;

	.align 1;
.epcline:
	.type .epcline,STT_OBJECT;
	.inc/binary "..\Debug\fit.sbn", 2151, 2137;
	.byte4 = .LN_fit_without_statistics;
	.byte =
		0x04,0x01,0x05,0x01,0xA3,0x00,0x05,0x02;
	.byte4 = .LN0;
	.byte =
		0x05,0x02,0x0E,0x00,0x05,0x02;
	.byte4 = .LN1;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN2;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN3;
	.byte =
		0x05,0x01,0x03,0x7B,0x01,0x00,0x05,0x02;
	.byte4 = .LN4;
	.byte =
		0x05,0x02,0x0F,0x00,0x05,0x02;
	.byte4 = .LN5;
	.byte =
		0x05,0x03,0x0B,0x00,0x05,0x02;
	.byte4 = .LN6;
	.byte =
		0x05,0x04,0x0A,0x00,0x05,0x02;
	.byte4 = .LN7;
	.byte =
		0x05,0x03,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN8;
	.byte =
		0x05,0x04,0x0A,0x00,0x05,0x02;
	.byte4 = .LN9;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN10;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN11;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN12;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN13;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN14;
	.byte =
		0x05,0x03,0x03,0x7C,0x01,0x00,0x05,0x02;
	.byte4 = .LN15;
	.byte =
		0x05,0x02,0x16,0x00,0x05,0x02;
	.byte4 = .LN16;
	.byte =
		0x05,0x01,0x03,0x6B,0x01,0x00,0x05,0x02;
	.byte4 = .LN17;
	.byte =
		0x05,0x02,0x1F,0x00,0x05,0x02;
	.byte4 = .LN18;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN19;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN20;
	.byte =
		0x05,0x03,0x0A,0x00,0x05,0x02;
	.byte4 = .LN21;
	.byte =
		0x05,0x04,0x0C,0x00,0x05,0x02;
	.byte4 = .LN22;
	.byte =
		0x05,0x03,0x03,0x7D,0x01,0x00,0x05,0x02;
	.byte4 = .LN23;
	.byte =
		0x05,0x04,0x0A,0x00,0x05,0x02;
	.byte4 = .LN24;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN25;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN26;
	.byte =
		0x05,0x03,0x03,0x7D,0x01,0x00,0x05,0x02;
	.byte4 = .LN27;
	.byte =
		0x05,0x02,0x15,0x00,0x05,0x02;
	.byte4 = .LN28;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN29;
	.byte =
		0x05,0x01,0x03,0x5C,0x01,0x00,0x05,0x02;
	.byte4 = .LN30;
	.byte =
		0x05,0x02,0x2D,0x00,0x05,0x02;
	.byte4 = .LN31;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN32;
	.byte =
		0x05,0x03,0x03,0x78,0x01,0x00,0x05,0x02;
	.byte4 = .LN33;
	.byte =
		0x05,0x04,0x0C,0x00,0x05,0x02;
	.byte4 = .LN34;
	.byte =
		0x05,0x03,0x03,0x7D,0x01,0x00,0x05,0x02;
	.byte4 = .LN35;
	.byte =
		0x05,0x04,0x0A,0x00,0x05,0x02;
	.byte4 = .LN36;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN37;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN38;
	.byte =
		0x05,0x03,0x03,0x7D,0x01,0x00,0x05,0x02;
	.byte4 = .LN39;
	.byte =
		0x03,0x72,0x01,0x00,0x05,0x02;
	.byte4 = .LN40;
	.byte =
		0x05,0x04,0x0A,0x00,0x05,0x02;
	.byte4 = .LN41;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN42;
	.byte =
		0x05,0x03,0x03,0x7E,0x01,0x00,0x05,0x02;
	.byte4 = .LN43;
	.byte =
		0x0D,0x00,0x05,0x02;
	.byte4 = .LN._fit_without_statistics.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_original_fit;
	.byte =
		0x04,0x01,0x05,0x01,0x6B,0x00,0x05,0x02;
	.byte4 = .LN44;
	.byte =
		0x05,0x02,0x0F,0x00,0x05,0x02;
	.byte4 = .LN45;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN46;
	.byte =
		0x05,0x01,0x03,0x7B,0x01,0x00,0x05,0x02;
	.byte4 = .LN47;
	.byte =
		0x05,0x02,0x0F,0x00,0x05,0x02;
	.byte4 = .LN48;
	.byte =
		0x05,0x03,0x0B,0x00,0x05,0x02;
	.byte4 = .LN49;
	.byte =
		0x05,0x04,0x0A,0x00,0x05,0x02;
	.byte4 = .LN50;
	.byte =
		0x05,0x03,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN51;
	.byte =
		0x05,0x04,0x0A,0x00,0x05,0x02;
	.byte4 = .LN52;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN53;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN54;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN55;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN56;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN57;
	.byte =
		0x05,0x03,0x03,0x7C,0x01,0x00,0x05,0x02;
	.byte4 = .LN58;
	.byte =
		0x05,0x02,0x16,0x00,0x05,0x02;
	.byte4 = .LN59;
	.byte =
		0x05,0x01,0x03,0x6B,0x01,0x00,0x05,0x02;
	.byte4 = .LN60;
	.byte =
		0x05,0x02,0x1F,0x00,0x05,0x02;
	.byte4 = .LN61;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN62;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN63;
	.byte =
		0x05,0x03,0x0A,0x00,0x05,0x02;
	.byte4 = .LN64;
	.byte =
		0x05,0x01,0x03,0x69,0x01,0x00,0x05,0x02;
	.byte4 = .LN65;
	.byte =
		0x05,0x03,0x20,0x00,0x05,0x02;
	.byte4 = .LN66;
	.byte =
		0x05,0x04,0x0C,0x00,0x05,0x02;
	.byte4 = .LN67;
	.byte =
		0x05,0x03,0x03,0x7D,0x01,0x00,0x05,0x02;
	.byte4 = .LN68;
	.byte =
		0x05,0x04,0x0A,0x00,0x05,0x02;
	.byte4 = .LN69;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN70;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN71;
	.byte =
		0x05,0x01,0x03,0x66,0x01,0x00,0x05,0x02;
	.byte4 = .LN72;
	.byte =
		0x05,0x04,0x23,0x00,0x05,0x02;
	.byte4 = .LN73;
	.byte =
		0x05,0x03,0x03,0x7D,0x01,0x00,0x05,0x02;
	.byte4 = .LN74;
	.byte =
		0x05,0x01,0x03,0x69,0x01,0x00,0x05,0x02;
	.byte4 = .LN75;
	.byte =
		0x05,0x02,0x2E,0x00,0x05,0x02;
	.byte4 = .LN76;
	.byte =
		0x03,0x7E,0x01,0x00,0x05,0x02;
	.byte4 = .LN77;
	.byte =
		0x05,0x01,0x03,0x5D,0x01,0x00,0x05,0x02;
	.byte4 = .LN78;
	.byte =
		0x05,0x02,0x2C,0x00,0x05,0x02;
	.byte4 = .LN79;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN80;
	.byte =
		0x05,0x01,0x03,0x5C,0x01,0x00,0x05,0x02;
	.byte4 = .LN81;
	.byte =
		0x05,0x02,0x2D,0x00,0x05,0x02;
	.byte4 = .LN82;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN83;
	.byte =
		0x05,0x0C,0x01,0x00,0x05,0x02;
	.byte4 = .LN84;
	.byte =
		0x05,0x01,0x03,0x5B,0x01,0x00,0x05,0x02;
	.byte4 = .LN85;
	.byte =
		0x05,0x02,0x2E,0x00,0x05,0x02;
	.byte4 = .LN86;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN87;
	.byte =
		0x05,0x0C,0x01,0x00,0x05,0x02;
	.byte4 = .LN88;
	.byte =
		0x05,0x01,0x03,0x5A,0x01,0x00,0x05,0x02;
	.byte4 = .LN89;
	.byte =
		0x05,0x02,0x2F,0x00,0x05,0x02;
	.byte4 = .LN90;
	.byte =
		0x05,0x01,0x03,0x5A,0x01,0x00,0x05,0x02;
	.byte4 = .LN91;
	.byte =
		0x05,0x02,0x0E,0x00,0x05,0x02;
	.byte4 = .LN92;
	.byte =
		0x2B,0x00,0x05,0x02;
	.byte4 = .LN93;
	.byte =
		0x05,0x01,0x03,0x59,0x01,0x00,0x05,0x02;
	.byte4 = .LN94;
	.byte =
		0x05,0x02,0x32,0x00,0x05,0x02;
	.byte4 = .LN95;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN96;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN97;
	.byte =
		0x05,0x03,0x10,0x00,0x05,0x02;
	.byte4 = .LN98;
	.byte =
		0x05,0x01,0x03,0x50,0x01,0x00,0x05,0x02;
	.byte4 = .LN99;
	.byte =
		0x05,0x04,0x3A,0x00,0x05,0x02;
	.byte4 = .LN100;
	.byte =
		0x05,0x01,0x03,0x4F,0x01,0x00,0x05,0x02;
	.byte4 = .LN101;
	.byte =
		0x05,0x04,0x3A,0x00,0x05,0x02;
	.byte4 = .LN102;
	.byte =
		0x05,0x01,0x03,0x4F,0x01,0x00,0x05,0x02;
	.byte4 = .LN103;
	.byte =
		0x05,0x04,0x3A,0x00,0x05,0x02;
	.byte4 = .LN104;
	.byte =
		0x05,0x01,0x03,0x4F,0x01,0x00,0x05,0x02;
	.byte4 = .LN105;
	.byte =
		0x05,0x04,0x3A,0x00,0x05,0x02;
	.byte4 = .LN106;
	.byte =
		0x05,0x03,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN107;
	.byte =
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN108;
	.byte =
		0x05,0x01,0x0B,0x00,0x05,0x02;
	.byte4 = .LN109;
	.byte =
		0x05,0x10,0x03,0x7E,0x01,0x00,0x05,0x02;
	.byte4 = .LN110;
	.byte =
		0x05,0x01,0x03,0x4E,0x01,0x00,0x05,0x02;
	.byte4 = .LN111;
	.byte =
		0x05,0x10,0x3B,0x00,0x05,0x02;
	.byte4 = .LN112;
	.byte =
		0x05,0x18,0x01,0x00,0x05,0x02;
	.byte4 = .LN113;
	.byte =
		0x05,0x01,0x03,0x4E,0x01,0x00,0x05,0x02;
	.byte4 = .LN114;
	.byte =
		0x05,0x10,0x3B,0x00,0x05,0x02;
	.byte4 = .LN115;
	.byte =
		0x05,0x03,0x03,0x78,0x01,0x00,0x05,0x02;
	.byte4 = .LN116;
	.byte =
		0x05,0x01,0x03,0x56,0x01,0x00,0x05,0x02;
	.byte4 = .LN117;
	.byte =
		0x05,0x04,0x34,0x00,0x05,0x02;
	.byte4 = .LN118;
	.byte =
		0x05,0x01,0x03,0x55,0x01,0x00,0x05,0x02;
	.byte4 = .LN119;
	.byte =
		0x05,0x04,0x34,0x00,0x05,0x02;
	.byte4 = .LN120;
	.byte =
		0x05,0x01,0x03,0x55,0x01,0x00,0x05,0x02;
	.byte4 = .LN121;
	.byte =
		0x05,0x04,0x34,0x00,0x05,0x02;
	.byte4 = .LN122;
	.byte =
		0x05,0x01,0x03,0x55,0x01,0x00,0x05,0x02;
	.byte4 = .LN123;
	.byte =
		0x05,0x04,0x34,0x00,0x05,0x02;
	.byte4 = .LN124;
	.byte =
		0x05,0x03,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN125;
	.byte =
		0x05,0x01,0x03,0x56,0x01,0x00,0x05,0x02;
	.byte4 = .LN126;
	.byte =
		0x05,0x03,0x35,0x00,0x05,0x02;
	.byte4 = .LN127;
	.byte =
		0x05,0x0E,0x01,0x00,0x05,0x02;
	.byte4 = .LN128;
	.byte =
		0x05,0x01,0x03,0x54,0x01,0x00,0x05,0x02;
	.byte4 = .LN129;
	.byte =
		0x05,0x03,0x36,0x00,0x05,0x02;
	.byte4 = .LN130;
	.byte =
		0x05,0x01,0x03,0x53,0x01,0x00,0x05,0x02;
	.byte4 = .LN131;
	.byte =
		0x05,0x03,0x36,0x00,0x05,0x02;
	.byte4 = .LN132;
	.byte =
		0x05,0x01,0x03,0x53,0x01,0x00,0x05,0x02;
	.byte4 = .LN133;
	.byte =
		0x05,0x03,0x37,0x00,0x05,0x02;
	.byte4 = .LN134;
	.byte =
		0x05,0x01,0x03,0x52,0x01,0x00,0x05,0x02;
	.byte4 = .LN135;
	.byte =
		0x05,0x03,0x37,0x00,0x05,0x02;
	.byte4 = .LN136;
	.byte =
		0x03,0x6F,0x01,0x00,0x05,0x02;
	.byte4 = .LN137;
	.byte =
		0x05,0x01,0x03,0x63,0x01,0x00,0x05,0x02;
	.byte4 = .LN138;
	.byte =
		0x05,0x03,0x26,0x00,0x05,0x02;
	.byte4 = .LN139;
	.byte =
		0x05,0x04,0x0C,0x00,0x05,0x02;
	.byte4 = .LN140;
	.byte =
		0x05,0x03,0x03,0x7D,0x01,0x00,0x05,0x02;
	.byte4 = .LN141;
	.byte =
		0x05,0x04,0x0A,0x00,0x05,0x02;
	.byte4 = .LN142;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN143;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN144;
	.byte =
		0x05,0x01,0x03,0x60,0x01,0x00,0x05,0x02;
	.byte4 = .LN145;
	.byte =
		0x05,0x04,0x29,0x00,0x05,0x02;
	.byte4 = .LN146;
	.byte =
		0x05,0x03,0x03,0x7D,0x01,0x00,0x05,0x02;
	.byte4 = .LN147;
	.byte =
		0x03,0x72,0x01,0x00,0x05,0x02;
	.byte4 = .LN148;
	.byte =
		0x05,0x04,0x0A,0x00,0x05,0x02;
	.byte4 = .LN149;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN150;
	.byte =
		0x05,0x03,0x03,0x7E,0x01,0x00,0x05,0x02;
	.byte4 = .LN151;
	.byte =
		0x0D,0x00,0x05,0x02;
	.byte4 = .LN._original_fit.end;
	.byte =
		0x00,0x01,0x01;
.epcline.end:

	.section .annotations SHT_DEBUGINFO;

	.align 1;
.epcannot:
	.type .epcannot,STT_OBJECT;
	.inc/binary "..\Debug\fit.sbn", 4288, 11000;
.epcannot.end:

	.section .debug_pubnames SHT_DEBUGINFO;

	.align 1;
.epcpubnames:
	.type .epcpubnames,STT_OBJECT;
	.byte =
		0x58,0x00,0x00,0x00,0x02,0x00;
	.byte4 = .epcdebug;
	.byte =
		0xE0,0x08,0x00,0x00,0x41,0x06,0x00,0x00,0x66,0x69,0x74,0x5F,
		0x77,0x69,0x74,0x68,0x6F,0x75,0x74,0x5F,0x73,0x74,0x61,0x74,
		0x69,0x73,0x74,0x69,0x63,0x73,0x00,0xAE,0x06,0x00,0x00,0x6F,
		0x72,0x69,0x67,0x69,0x6E,0x61,0x6C,0x5F,0x66,0x69,0x74,0x00,
		0xA7,0x08,0x00,0x00,0x78,0x5F,0x66,0x6C,0x6F,0x61,0x74,0x69,
		0x6E,0x67,0x00,0xC3,0x08,0x00,0x00,0x79,0x5F,0x66,0x6C,0x6F,
		0x61,0x74,0x69,0x6E,0x67,0x00,0x00,0x00,0x00,0x00;
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
	.byte4 = .LN_fit_without_statistics;
	.byte4 = .LN._fit_without_statistics.end-.LN_fit_without_statistics;
	.byte4 = .LN_original_fit;
	.byte4 = .LN._original_fit.end-.LN_original_fit;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00;
.epcaranges.end:
