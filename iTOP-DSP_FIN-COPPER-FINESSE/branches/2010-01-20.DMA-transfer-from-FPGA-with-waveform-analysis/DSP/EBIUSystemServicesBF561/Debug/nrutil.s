	.file "..\..\src\numerical-recipes-in-c\nrutil.c";
//  Compilation time: Wed Jan 20 22:50:35 2010

//  Compiler options: -c -file-attr ProjectName=CoreA -O -Ov100 -g -save-temps -path-output ..\Debug -structs-do-not-overlap -no-multiline -double-size-32 -decls-strong -warn-protos -proc ADSP-BF561 -o ..\Debug\nrutil.doj -MM
//  Architecture: ADSP-BF561
//  Silicon revision: 0.5
//  Anomalies summary:
//   Disabled: w05_00_0046,w05_00_0048,w05_00_0054,w05_00_0071,w05_00_0103,w05_00_0104,w05_00_0157,w05_00_0164,w05_00_0165,w05_00_0195,w05_00_0198,w05_00_0202,w05_00_0209,w05_00_0227,w05_00_0244,w05_00_0245,w05_00_0246,w05_00_0248,w05_00_0257,w05_00_0262,w05_00_0264,w05_00_0283,wF3_F_021,wF3_F_008_F3_F_013,w05_00_0311
//   Enabled: w05_00_0120,w05_00_0127,w05_00_0189,w05_00_0312
//   Always on: w05_00_0074,w05_00_0122

	.section/DOUBLE32 program;

.epctext:
	.align 4;
_nrerror:
.LN_nrerror:
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,P0}
//   Call preserved registers used:{R6.L,R6.H,R7.L,R7.H,FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,I0-I3,B0-B3,M0-M3,A0.W,A0.X,A1.W,A1.X,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
// line "..\..\src\numerical-recipes-in-c\nrutil.c":11
	LINK 0;
	.align 2
	[--SP] = (R7:6);
	R6.L = __Stderr;
	R6.H = __Stderr;
.LN0:
// line 12
	R7 = R0;
.LN1:
// line 11
	SP += -12;
.LN2:
// line 12
	R0 = R6;
	R1.L = .sNumeri.0;
	R1.H = .sNumeri.0;
	CALL.X (_fprintf);
.LN3:
// line 13
	R2 = R7;
	R0 = R6;
	R1.L = .epcrodata;
	R1.H = .epcrodata;
	CALL.X (_fprintf);
.LN4:
// line 14
	R0 = R6;
	R1.L = .snowexi.2;
	R1.H = .snowexi.2;
	CALL.X (_fprintf);
.LN5:
// line 15
	R0 = 1;
	CALL.X (_exit);
	SP += 12;
	P0 = [FP + 4];
	(R7:6) = [SP++];
	UNLINK;
	// -- stall --
	JUMP (P0);
.LN._nrerror.end:
._nrerror.end:
	.global _nrerror;
	.type _nrerror,STT_FUNC;

	.align 4;
_vector:
.LN_vector:
	.reference _nrerror;
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,R0.H,P0,ASTAT0-ASTAT1,CC}
//   Call preserved registers used:{R6.L,R6.H,R7.L,R7.H,FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,I0-I3,B0-B3,M0-M3,A0.W,A0.X,A1.W,A1.X,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
// line "..\..\src\numerical-recipes-in-c\nrutil.c":20
	LINK 0;
	.align 2
	[--SP] = (R7:6);
.LN6:
// line 23
	R7 = R0;
	R0 = R1 - R7;
	R0 += 2;
.LN7:
// line 20
	SP += -12;
.LN8:
// line 23
	R0 <<= 2;
.LN9:
	CALL.X (_malloc);
	R6 = R0;
.LN10:
// line 24
	CC = R6 == 0;
	if CC jump .P41L1 ;

.P41L3:
.LN11:
// line 25
	SP += 12;
	R0 = R7 << 2 || P0 = [FP + 4];
	R0 = R6 - R0;
	(R7:6) = [SP++];
	UNLINK;
	R0 += 4;
	JUMP (P0);

	.align 4
.P41L1:
	R0.L = .salloca.3;
	R0.H = .salloca.3;
	.align 2
.LN12:
// line 24
	CALL.X (_nrerror);
	jump .P41L3;
.LN._vector.end:
._vector.end:
	.global _vector;
	.type _vector,STT_FUNC;

	.align 4;
_ivector:
.LN_ivector:
	.reference _nrerror;
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,R0.H,P0,ASTAT0-ASTAT1,CC}
//   Call preserved registers used:{R6.L,R6.H,R7.L,R7.H,FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,I0-I3,B0-B3,M0-M3,A0.W,A0.X,A1.W,A1.X,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
// line "..\..\src\numerical-recipes-in-c\nrutil.c":30
	LINK 0;
	.align 2
	[--SP] = (R7:6);
.LN13:
// line 33
	R7 = R0;
	R0 = R1 - R7;
	R0 += 2;
.LN14:
// line 30
	SP += -12;
.LN15:
// line 33
	R0 <<= 2;
.LN16:
	CALL.X (_malloc);
	R6 = R0;
.LN17:
// line 34
	CC = R6 == 0;
	if CC jump .P44L1 ;

.P44L3:
.LN18:
// line 35
	SP += 12;
	R0 = R7 << 2 || P0 = [FP + 4];
	R0 = R6 - R0;
	(R7:6) = [SP++];
	UNLINK;
	R0 += 4;
	JUMP (P0);

	.align 4
.P44L1:
	R0.L = .salloca.4;
	R0.H = .salloca.4;
	.align 2
.LN19:
// line 34
	CALL.X (_nrerror);
	jump .P44L3;
.LN._ivector.end:
._ivector.end:
	.global _ivector;
	.type _ivector,STT_FUNC;

	.align 4;
_cvector:
.LN_cvector:
	.reference _nrerror;
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,R0.H,P0,ASTAT0-ASTAT1,CC}
//   Call preserved registers used:{R6.L,R6.H,R7.L,R7.H,FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,I0-I3,B0-B3,M0-M3,A0.W,A0.X,A1.W,A1.X,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
// line "..\..\src\numerical-recipes-in-c\nrutil.c":40
	LINK 0;
	.align 2
	[--SP] = (R7:6);
.LN20:
// line 43
	R7 = R0;
	R0 = R1 - R7;
.LN21:
// line 40
	SP += -12;
.LN22:
// line 43
	R0 += 2;
.LN23:
	CALL.X (_malloc);
	R6 = R0;
.LN24:
// line 44
	CC = R6 == 0;
	if CC jump .P46L1 ;

.P46L3:
.LN25:
// line 45
	SP += 12;
	R0 = R6 - R7 (NS) || P0 = [FP + 4];
	(R7:6) = [SP++];
	UNLINK;
	R0 += 1;
	JUMP (P0);

	.align 4
.P46L1:
	R0.L = .salloca.5;
	R0.H = .salloca.5;
	.align 2
.LN26:
// line 44
	CALL.X (_nrerror);
	jump .P46L3;
.LN._cvector.end:
._cvector.end:
	.global _cvector;
	.type _cvector,STT_FUNC;

	.align 4;
_lvector:
.LN_lvector:
	.reference _nrerror;
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,R0.H,P0,ASTAT0-ASTAT1,CC}
//   Call preserved registers used:{R6.L,R6.H,R7.L,R7.H,FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,I0-I3,B0-B3,M0-M3,A0.W,A0.X,A1.W,A1.X,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
// line "..\..\src\numerical-recipes-in-c\nrutil.c":50
	LINK 0;
	.align 2
	[--SP] = (R7:6);
.LN27:
// line 53
	R7 = R0;
	R0 = R1 - R7;
	R0 += 2;
.LN28:
// line 50
	SP += -12;
.LN29:
// line 53
	R0 <<= 2;
.LN30:
	CALL.X (_malloc);
	R6 = R0;
.LN31:
// line 54
	CC = R6 == 0;
	if CC jump .P48L1 ;

.P48L3:
.LN32:
// line 55
	SP += 12;
	R0 = R7 << 2 || P0 = [FP + 4];
	R0 = R6 - R0;
	(R7:6) = [SP++];
	UNLINK;
	R0 += 4;
	JUMP (P0);

	.align 4
.P48L1:
	R0.L = .salloca.6;
	R0.H = .salloca.6;
	.align 2
.LN33:
// line 54
	CALL.X (_nrerror);
	jump .P48L3;
.LN._lvector.end:
._lvector.end:
	.global _lvector;
	.type _lvector,STT_FUNC;

	.align 4;
_dvector:
.LN_dvector:
	.reference _nrerror;
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,R0.H,P0,ASTAT0-ASTAT1,CC}
//   Call preserved registers used:{R6.L,R6.H,R7.L,R7.H,FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,I0-I3,B0-B3,M0-M3,A0.W,A0.X,A1.W,A1.X,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
// line "..\..\src\numerical-recipes-in-c\nrutil.c":60
	LINK 0;
	.align 2
	[--SP] = (R7:6);
.LN34:
// line 63
	R7 = R0;
	R0 = R1 - R7;
	R0 += 2;
.LN35:
// line 60
	SP += -12;
.LN36:
// line 63
	R0 <<= 2;
.LN37:
	CALL.X (_malloc);
	R6 = R0;
.LN38:
// line 64
	CC = R6 == 0;
	if CC jump .P50L1 ;

.P50L3:
.LN39:
// line 65
	SP += 12;
	R0 = R7 << 2 || P0 = [FP + 4];
	R0 = R6 - R0;
	(R7:6) = [SP++];
	UNLINK;
	R0 += 4;
	JUMP (P0);

	.align 4
.P50L1:
	R0.L = .salloca.7;
	R0.H = .salloca.7;
	.align 2
.LN40:
// line 64
	CALL.X (_nrerror);
	jump .P50L3;
.LN._dvector.end:
._dvector.end:
	.global _dvector;
	.type _dvector,STT_FUNC;

	.align 4;
_matrix:
.LN_matrix:
	.reference _nrerror;
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 4 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,P0-P1,I0,ASTAT0-ASTAT1,CC,LC0,LT0,LB0}
//   Call preserved registers used:{R4.L,R4.H,R5.L,R5.H,R6.L,R6.H,R7.L,R7.H,P5,FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,I0-I3,B0-B3,M0-M3,A0.W,A0.X,A1.W,A1.X,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
// line "..\..\src\numerical-recipes-in-c\nrutil.c":70
	LINK 4;
	.align 2
	[--SP] = (R7:4, P5:5);
	SP += -12;
	R5 = ROT R0 BY 0 || R0 = [SP + 56];
.LN41:
// line 71
	R7 = R0 - R2 (NS) || [SP + 48] = R2;
.LN42:
	R0 = R1 - R5 (NS) || [SP + 44] = R1;
	[SP + 52] = R0;
.LN43:
// line 75
	R0 += 2;
	R0 <<= 2;
.LN44:
	CALL.X (_malloc);
	R6 = ROT R0 BY 0 || R4 = [SP + 52];
.LN45:
// line 76
	CC = R6 == 0;
.LN46:
// line 71
	R7 += 1;
.LN47:
	R4 += 1;
.LN48:
// line 76
	if CC jump .P53L1 ;

.P53L3:
	R0 = R6;
.LN49:
// line 78
	R1 = R5 << 2;
.LN50:
// line 77
	R0 += 4;
.LN51:
// line 78
	R0 = R0 - R1;
	[SP + 32] = R0;
	P1 = R1;
.LN52:
// line 81
	R4 *= R7;
	R4 += 1;
.LN53:
// line 78
	R0 = R4 << 2 || P0 = [SP + 32];
	// -- 3 stalls --
.LN54:
// line 81
	P5 = P0 + P1;
.LN55:
	CALL.X (_malloc);
.LN56:
// line 82
	CC = R0 == 0;
.LN57:
// line 81
	[P5] = R0;
.LN58:
// line 82
	if CC jump .P53L4 ;

.P53L6:
.LN59:
// line 86
	R5 += 1;
	R0 = [SP + 44];
	CC = R5 <= R0;
.LN60:
// line 83
	R0 = [P5];
.LN61:
// line 84
	R1 = [SP + 48];
.LN62:
// line 83
	R0 += 4;
.LN63:
// line 84
	R1 <<= 2;
	R0 = R0 - R1;
	[P5] = R0;
.LN64:
// line 86
	if !CC jump .P53L9 ;

.P53L12:
	R6 += 8;
	I0 = R6;
	R0 = R7 << 2 || P1 = [SP + 52];
	// -- 3 stalls --
	I0 -= 4;
	LOOP .P53L8L LC0 = P1;

.P53L8:
//-------------------------------------------------------------------
//   Loop at "..\..\src\numerical-recipes-in-c\nrutil.c" line 86 col 2
//-------------------------------------------------------------------
//   This loop executes 1 iteration of the original loop in estimated 3 cycles.
//-------------------------------------------------------------------
//   This loop's resource usage is:
//     16-bit Instruction  used   4 out of    6 ( 66.7%)
//     32-bit Instruction  used   1 out of    3 ( 33.3%)
//     Group 1             used   1 out of    3 ( 33.3%)
//     Store               used   1 out of    3 ( 33.3%)
//-------------------------------------------------------------------
	LOOP_BEGIN .P53L8L;
.LN65:
	R1 = [I0++];
	R1 = R1 + R0;
	[I0] = R1;
.LN66:
	LOOP_END .P53L8L;

.P53L15:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------

.P53L9:
.LN67:
// line 89
	R0 = [SP + 32];
	SP += 12;
	P0 = [FP + 4];
	(R7:4, P5:5) = [SP++];
	UNLINK;
	// -- stall --
	JUMP (P0);

	.align 4
.P53L4:
	R0.L = .salloca.9;
	R0.H = .salloca.9;
	.align 2
.LN68:
// line 82
	CALL.X (_nrerror);
	jump .P53L6;

	.align 4
.P53L1:
	R0.L = .salloca.8;
	R0.H = .salloca.8;
	.align 2
.LN69:
// line 76
	CALL.X (_nrerror);
	jump .P53L3;
.LN._matrix.end:
._matrix.end:
	.global _matrix;
	.type _matrix,STT_FUNC;

	.align 4;
_dmatrix:
.LN_dmatrix:
	.reference _nrerror;
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 4 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,P0-P1,I0,ASTAT0-ASTAT1,CC,LC0,LT0,LB0}
//   Call preserved registers used:{R4.L,R4.H,R5.L,R5.H,R6.L,R6.H,R7.L,R7.H,P5,FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,I0-I3,B0-B3,M0-M3,A0.W,A0.X,A1.W,A1.X,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
// line "..\..\src\numerical-recipes-in-c\nrutil.c":94
	LINK 4;
	.align 2
	[--SP] = (R7:4, P5:5);
	SP += -12;
	R5 = ROT R0 BY 0 || R0 = [SP + 56];
.LN70:
// line 95
	R7 = R0 - R2 (NS) || [SP + 48] = R2;
.LN71:
	R0 = R1 - R5 (NS) || [SP + 44] = R1;
	[SP + 52] = R0;
.LN72:
// line 99
	R0 += 2;
	R0 <<= 2;
.LN73:
	CALL.X (_malloc);
	R6 = ROT R0 BY 0 || R4 = [SP + 52];
.LN74:
// line 100
	CC = R6 == 0;
.LN75:
// line 95
	R7 += 1;
.LN76:
	R4 += 1;
.LN77:
// line 100
	if CC jump .P54L1 ;

.P54L3:
	R0 = R6;
.LN78:
// line 102
	R1 = R5 << 2;
.LN79:
// line 101
	R0 += 4;
.LN80:
// line 102
	R0 = R0 - R1;
	[SP + 32] = R0;
	P1 = R1;
.LN81:
// line 105
	R4 *= R7;
	R4 += 1;
.LN82:
// line 102
	R0 = R4 << 2 || P0 = [SP + 32];
	// -- 3 stalls --
.LN83:
// line 105
	P5 = P0 + P1;
.LN84:
	CALL.X (_malloc);
.LN85:
// line 106
	CC = R0 == 0;
.LN86:
// line 105
	[P5] = R0;
.LN87:
// line 106
	if CC jump .P54L4 ;

.P54L6:
.LN88:
// line 110
	R5 += 1;
	R0 = [SP + 44];
	CC = R5 <= R0;
.LN89:
// line 107
	R0 = [P5];
.LN90:
// line 108
	R1 = [SP + 48];
.LN91:
// line 107
	R0 += 4;
.LN92:
// line 108
	R1 <<= 2;
	R0 = R0 - R1;
	[P5] = R0;
.LN93:
// line 110
	if !CC jump .P54L9 ;

.P54L12:
	R6 += 8;
	I0 = R6;
	R0 = R7 << 2 || P1 = [SP + 52];
	// -- 3 stalls --
	I0 -= 4;
	LOOP .P54L8L LC0 = P1;

.P54L8:
//-------------------------------------------------------------------
//   Loop at "..\..\src\numerical-recipes-in-c\nrutil.c" line 110 col 2
//-------------------------------------------------------------------
//   This loop executes 1 iteration of the original loop in estimated 3 cycles.
//-------------------------------------------------------------------
//   This loop's resource usage is:
//     16-bit Instruction  used   4 out of    6 ( 66.7%)
//     32-bit Instruction  used   1 out of    3 ( 33.3%)
//     Group 1             used   1 out of    3 ( 33.3%)
//     Store               used   1 out of    3 ( 33.3%)
//-------------------------------------------------------------------
	LOOP_BEGIN .P54L8L;
.LN94:
	R1 = [I0++];
	R1 = R1 + R0;
	[I0] = R1;
.LN95:
	LOOP_END .P54L8L;

.P54L15:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------

.P54L9:
.LN96:
// line 113
	R0 = [SP + 32];
	SP += 12;
	P0 = [FP + 4];
	(R7:4, P5:5) = [SP++];
	UNLINK;
	// -- stall --
	JUMP (P0);

	.align 4
.P54L4:
	R0.L = .salloca.9;
	R0.H = .salloca.9;
	.align 2
.LN97:
// line 106
	CALL.X (_nrerror);
	jump .P54L6;

	.align 4
.P54L1:
	R0.L = .salloca.8;
	R0.H = .salloca.8;
	.align 2
.LN98:
// line 100
	CALL.X (_nrerror);
	jump .P54L3;
.LN._dmatrix.end:
._dmatrix.end:
	.global _dmatrix;
	.type _dmatrix,STT_FUNC;

	.align 4;
_imatrix:
.LN_imatrix:
	.reference _nrerror;
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 4 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,P0-P1,I0,ASTAT0-ASTAT1,CC,LC0,LT0,LB0}
//   Call preserved registers used:{R4.L,R4.H,R5.L,R5.H,R6.L,R6.H,R7.L,R7.H,P5,FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,I0-I3,B0-B3,M0-M3,A0.W,A0.X,A1.W,A1.X,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
// line "..\..\src\numerical-recipes-in-c\nrutil.c":118
	LINK 4;
	.align 2
	[--SP] = (R7:4, P5:5);
	SP += -12;
	R5 = ROT R0 BY 0 || R0 = [SP + 56];
.LN99:
// line 119
	R7 = R0 - R2 (NS) || [SP + 48] = R2;
.LN100:
	R0 = R1 - R5 (NS) || [SP + 44] = R1;
	[SP + 52] = R0;
.LN101:
// line 123
	R0 += 2;
	R0 <<= 2;
.LN102:
	CALL.X (_malloc);
	R6 = ROT R0 BY 0 || R4 = [SP + 52];
.LN103:
// line 124
	CC = R6 == 0;
.LN104:
// line 119
	R7 += 1;
.LN105:
	R4 += 1;
.LN106:
// line 124
	if CC jump .P55L1 ;

.P55L3:
	R0 = R6;
.LN107:
// line 126
	R1 = R5 << 2;
.LN108:
// line 125
	R0 += 4;
.LN109:
// line 126
	R0 = R0 - R1;
	[SP + 32] = R0;
	P1 = R1;
.LN110:
// line 130
	R4 *= R7;
	R4 += 1;
.LN111:
// line 126
	R0 = R4 << 2 || P0 = [SP + 32];
	// -- 3 stalls --
.LN112:
// line 130
	P5 = P0 + P1;
.LN113:
	CALL.X (_malloc);
.LN114:
// line 131
	CC = R0 == 0;
.LN115:
// line 130
	[P5] = R0;
.LN116:
// line 131
	if CC jump .P55L4 ;

.P55L6:
.LN117:
// line 135
	R5 += 1;
	R0 = [SP + 44];
	CC = R5 <= R0;
.LN118:
// line 132
	R0 = [P5];
.LN119:
// line 133
	R1 = [SP + 48];
.LN120:
// line 132
	R0 += 4;
.LN121:
// line 133
	R1 <<= 2;
	R0 = R0 - R1;
	[P5] = R0;
.LN122:
// line 135
	if !CC jump .P55L9 ;

.P55L12:
	R6 += 8;
	I0 = R6;
	R0 = R7 << 2 || P1 = [SP + 52];
	// -- 3 stalls --
	I0 -= 4;
	LOOP .P55L8L LC0 = P1;

.P55L8:
//-------------------------------------------------------------------
//   Loop at "..\..\src\numerical-recipes-in-c\nrutil.c" line 135 col 2
//-------------------------------------------------------------------
//   This loop executes 1 iteration of the original loop in estimated 3 cycles.
//-------------------------------------------------------------------
//   This loop's resource usage is:
//     16-bit Instruction  used   4 out of    6 ( 66.7%)
//     32-bit Instruction  used   1 out of    3 ( 33.3%)
//     Group 1             used   1 out of    3 ( 33.3%)
//     Store               used   1 out of    3 ( 33.3%)
//-------------------------------------------------------------------
	LOOP_BEGIN .P55L8L;
.LN123:
	R1 = [I0++];
	R1 = R1 + R0;
	[I0] = R1;
.LN124:
	LOOP_END .P55L8L;

.P55L15:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------

.P55L9:
.LN125:
// line 138
	R0 = [SP + 32];
	SP += 12;
	P0 = [FP + 4];
	(R7:4, P5:5) = [SP++];
	UNLINK;
	// -- stall --
	JUMP (P0);

	.align 4
.P55L4:
	R0.L = .salloca.9;
	R0.H = .salloca.9;
	.align 2
.LN126:
// line 131
	CALL.X (_nrerror);
	jump .P55L6;

	.align 4
.P55L1:
	R0.L = .salloca.8;
	R0.H = .salloca.8;
	.align 2
.LN127:
// line 124
	CALL.X (_nrerror);
	jump .P55L3;
.LN._imatrix.end:
._imatrix.end:
	.global _imatrix;
	.type _imatrix,STT_FUNC;

	.align 4;
_submatrix:
.LN_submatrix:
	.reference _nrerror;
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,P0-P2,ASTAT0-ASTAT1,CC,LC0,LT0,LB0}
//   Call preserved registers used:{R4.L,R4.H,R5.L,R5.H,R6.L,R6.H,R7.L,R7.H,FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,I0-I3,B0-B3,M0-M3,A0.W,A0.X,A1.W,A1.X,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
// line "..\..\src\numerical-recipes-in-c\nrutil.c":144
	LINK 0;
	.align 2
	[--SP] = (R7:4);
	SP += -12;
	R5 = ROT R1 BY 0 || R1 = [SP + 60];
	R4 = ROT R0 BY 0 || R0 = [SP + 48];
.LN128:
// line 145
	R0 = R0 - R1;
.LN129:
// line 144
	R6 = ROT R2 BY 0 || [SP + 36] = R0;
.LN130:
// line 145
	R0 = R6 - R5;
.LN131:
// line 149
	R0 += 2;
	R0 <<= 2;
.LN132:
	CALL.X (_malloc);
	R7 = R0;
.LN133:
// line 150
	CC = R7 == 0;
	if CC jump .P57L1 ;

.P57L3:
.LN134:
// line 144
	R0 = [SP + 56];
.LN135:
// line 151
	R7 += 4;
.LN136:
// line 152
	R0 <<= 2;
.LN137:
// line 155
	CC = R5 <= R6;
.LN138:
// line 152
	R0 = R7 - R0;
.LN139:
// line 155
	if !CC jump .P57L6 ;

.P57L9:
	R6 += 1;
	R2 = R5 << 2;
	R1 = R6 - R5;
	R2 = R4 + R2;
	P1 = R1;
	P0 = R2;
	P2 = R7;
.LN140:
	R1 = [SP + 36];
	R1 <<= 2;
.LN141:
	LOOP .P57L5L LC0 = P1;

.P57L5:
//-------------------------------------------------------------------
//   Loop at "..\..\src\numerical-recipes-in-c\nrutil.c" line 155 col 2
//-------------------------------------------------------------------
//   This loop executes 1 iteration of the original loop in estimated 3 cycles.
//-------------------------------------------------------------------
//   This loop's resource usage is:
//     Group 1             used   3 out of    3 (100.0%)
//     16-bit Instruction  used   4 out of    6 ( 66.7%)
//     32-bit Instruction  used   1 out of    3 ( 33.3%)
//     Store               used   1 out of    3 ( 33.3%)
//-------------------------------------------------------------------
	LOOP_BEGIN .P57L5L;
.LN142:
	R2 = [P0++];
	R2 = R2 + R1;
	[P2++] = R2;
.LN143:
	LOOP_END .P57L5L;

.P57L11:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------

.P57L6:
.LN144:
// line 158
	SP += 12;
	P0 = [FP + 4];
	(R7:4) = [SP++];
	UNLINK;
	// -- stall --
	JUMP (P0);

	.align 4
.P57L1:
	R0.L = .salloca.10;
	R0.H = .salloca.10;
	.align 2
.LN145:
// line 150
	CALL.X (_nrerror);
	jump .P57L3;
.LN._submatrix.end:
._submatrix.end:
	.global _submatrix;
	.type _submatrix,STT_FUNC;

	.align 4;
_convert_matrix:
.LN_convert_matrix:
	.reference _nrerror;
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,P0-P1,I0,ASTAT0-ASTAT1,CC,LC0,LT0,LB0}
//   Call preserved registers used:{R4.L,R4.H,R5.L,R5.H,R6.L,R6.H,R7.L,R7.H,FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,I0-I3,B0-B3,M0-M3,A0.W,A0.X,A1.W,A1.X,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
// line "..\..\src\numerical-recipes-in-c\nrutil.c":166
	LINK 0;
	.align 2
	[--SP] = (R7:4);
	SP += -12;
.LN146:
// line 167
	R4 = R2 - R1 (NS) || [SP + 40] = R1;
.LN147:
// line 166
	R6 = ROT R4 BY 0 || [SP + 36] = R0;
	R1 = [SP + 48];
	R0 = [SP + 52];
.LN148:
// line 167
	R7 = R0 - R1;
	R0 = R4;
.LN149:
// line 171
	R0 += 2;
	R0 <<= 2;
.LN150:
	CALL.X (_malloc);
	R5 = R0;
.LN151:
// line 172
	CC = R5 == 0;
.LN152:
// line 167
	R6 += 1;
.LN153:
	R7 += 1;
.LN154:
// line 172
	if CC jump .P59L1 ;

.P59L3:
.LN155:
// line 174
	R0 = [SP + 40];
	R1 = R0 << 2 || R2 = [SP + 36];
	R0 = R5;
.LN156:
// line 173
	R0 += 4;
.LN157:
// line 174
	R0 = R0 - R1;
	P1 = R1;
	P0 = R0;
.LN158:
// line 166
	R1 = [SP + 48];
.LN159:
// line 177
	R1 <<= 2;
	R1 = R2 - R1;
.LN160:
// line 178
	CC = R6 <= 1;
.LN161:
// line 177
	P1 = P0 + P1;
	[P1] = R1;
.LN162:
// line 178
	if CC jump .P59L6 ;

.P59L9:
	R5 += 8;
	I0 = R5;
	P1 = R4;
.LN163:
	R1 = R7 << 2;
	// -- 2 stalls --
	I0 -= 4;
.LN164:
	LOOP .P59L5L LC0 = P1;

.P59L5:
//-------------------------------------------------------------------
//   Loop at "..\..\src\numerical-recipes-in-c\nrutil.c" line 178 col 2
//-------------------------------------------------------------------
//   This loop executes 1 iteration of the original loop in estimated 3 cycles.
//-------------------------------------------------------------------
//   This loop's resource usage is:
//     16-bit Instruction  used   4 out of    6 ( 66.7%)
//     32-bit Instruction  used   1 out of    3 ( 33.3%)
//     Group 1             used   1 out of    3 ( 33.3%)
//     Store               used   1 out of    3 ( 33.3%)
//-------------------------------------------------------------------
	LOOP_BEGIN .P59L5L;
.LN165:
	R2 = [I0++];
	R2 = R2 + R1;
	[I0] = R2;
.LN166:
	LOOP_END .P59L5L;

.P59L11:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------

.P59L6:
.LN167:
// line 180
	SP += 12;
	P0 = [FP + 4];
	(R7:4) = [SP++];
	UNLINK;
	// -- stall --
	JUMP (P0);

	.align 4
.P59L1:
	R0.L = .salloca.11;
	R0.H = .salloca.11;
	.align 2
.LN168:
// line 172
	CALL.X (_nrerror);
	jump .P59L3;
.LN._convert_matrix.end:
._convert_matrix.end:
	.global _convert_matrix;
	.type _convert_matrix,STT_FUNC;

	.align 4;
_f3tensor:
.LN_f3tensor:
	.reference _nrerror;
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 8 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,ASTAT0-ASTAT1,CC,LC0-LC1,LT0-LT1,LB0-LB1}
//   Call preserved registers used:{R4.L,R4.H,R5.L,R5.H,R6.L,R6.H,R7.L,R7.H,P3-P5,FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,I0-I3,B0-B3,M0-M3,A0.W,A0.X,A1.W,A1.X,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
// line "..\..\src\numerical-recipes-in-c\nrutil.c":185
	LINK 8;
	.align 2
	[--SP] = (R7:4, P5:3);
	SP += -12;
	R5 = ROT R2 BY 0 || [SP + 56] = R0;
	R0 = [FP + 20];
.LN169:
// line 186
	R0 = R0 - R5 (NS) || [FP + 16] = R1;
	[SP + 60] = R0;
.LN170:
	R0 = [SP + 56];
	R0 = R1 - R0 (NS) || R1 = [FP + 24];
	[SP + 44] = R0;
.LN171:
// line 185
	R0 = [FP + 28];
.LN172:
// line 186
	R6 = R0 - R1 (NS) || R7 = [SP + 60];
.LN173:
// line 185
	P3 = R5;
	R0 = [SP + 44];
.LN174:
// line 190
	R0 += 2;
	R0 = R0 << 2 || R4 = [SP + 44];
.LN175:
	CALL.X (_malloc);
.LN176:
// line 191
	CC = R0 == 0;
.LN177:
// line 190
	[SP + 40] = R0;
.LN178:
// line 186
	R7 += 1;
.LN179:
	R6 += 1;
.LN180:
	R4 += 1;
.LN181:
// line 191
	if CC jump .P63L1 ;

.P63L3:
	R0 = [SP + 40];
.LN182:
// line 192
	R0 += 4;
	[SP + 40] = R0;
.LN183:
// line 196
	R4 *= R7;
	R0 = R4;
	R0 += 1;
	R0 = R0 << 2 || P5 = [SP + 40];
.LN184:
	CALL.X (_malloc);
.LN185:
// line 197
	CC = R0 == 0;
.LN186:
// line 193
	R1 = [SP + 40];
.LN187:
// line 196
	[P5] = R0;
.LN188:
// line 193
	R0 = [SP + 56];
	R0 <<= 2;
	R0 = R1 - R0;
	[SP + 40] = R0;
.LN189:
// line 197
	if CC jump .P63L4 ;

.P63L6:
.LN190:
// line 198
	P1 = [P5];
.LN191:
// line 202
	R4 *= R6;
	R4 += 1;
.LN192:
// line 198
	P1 += 4;
.LN193:
// line 202
	R0 = R4 << 2;
.LN194:
// line 199
	P4 = P3 << 2;
	P1 -= P4;
	[P5] = P1;
.LN195:
// line 202
	CALL.X (_malloc);
.LN196:
	P1 = [P5];
	// -- 3 stalls --
	P1 = P1 + P4;
	[P1] = R0;
.LN197:
// line 203
	P1 = [P5];
	// -- 3 stalls --
	P1 = P1 + P4;
	R0 = [P1];
	CC = R0 == 0;
	if CC jump .P63L7 ;

.P63L9:
.LN198:
// line 204
	P1 = [P5];
.LN199:
// line 185
	R0 = [FP + 24];
.LN200:
// line 205
	R1 = R0 << 2 || R0 = [FP + 20];
.LN201:
// line 207
	R5 += 1;
.LN202:
// line 204
	P1 = P1 + P4;
.LN203:
// line 207
	CC = R5 <= R0;
.LN204:
// line 204
	R0 = [P1];
	R0 += 4;
	[P1] = R0;
.LN205:
// line 205
	P1 = [P5];
	// -- 3 stalls --
	P1 = P1 + P4;
	R0 = [P1];
	R0 = R0 - R1;
	[P1] = R0;
.LN206:
// line 207
	if !CC jump .P63L12 ;

.P63L23:
	R0 = R6 << 2 || P0 = [SP + 60];
	P1 = P4;
	// -- 2 stalls --
	LOOP .P63L11L LC0 = P0;

.P63L11:
//-------------------------------------------------------------------
//   Loop at "..\..\src\numerical-recipes-in-c\nrutil.c" line 207 col 2
//-------------------------------------------------------------------
//   This loop executes 1 iteration of the original loop in estimated 10 cycles.
//   (cycle count 10 includes 3 stalls)
//-------------------------------------------------------------------
//   This loop's resource usage is:
//     Group 1             used   7 out of   10 ( 70.0%)
//     16-bit Instruction  used  11 out of   20 ( 55.0%)
//     32-bit Instruction  used   4 out of   10 ( 40.0%)
//     Store               used   1 out of   10 ( 10.0%)
//-------------------------------------------------------------------
	LOOP_BEGIN .P63L11L;
.LN207:
	P0 = [P5];
	// -- 3 stalls --
	P2 = P0 + P1;
	R1 = [P2];
	P1 += 4;
	P0 = P0 + P1;
	R1 = R1 + R0;
	[P0] = R1;
.LN208:
	LOOP_END .P63L11L;

.P63L31:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------

.P63L12:
	R0 = [SP + 56];
.LN209:
// line 208
	R0 += 1;
	R1 = [FP + 16];
	CC = R0 <= R1;
	if !CC jump .P63L15 ;

.P63L37:
.LN210:
// line 185
	R1 = R7 << 2 || P1 = [FP + 20];
	R3 = R6 << 2 || P0 = [SP + 44];
	R0 = [FP + 20];
.LN211:
// line 210
	R7 *= R6;
	P1 -= P3;
	CC = R5 <= R0;
	[SP + 56] = P1;
	R2 = R7 << 2;
	if !CC jump .P63L25 ;

.P63L39:
.LN212:
// line 208
	LOOP .P63L40L LC1 = P0;

.P63L40:
//-------------------------------------------------------------------
//   Loop at "..\..\src\numerical-recipes-in-c\nrutil.c" line 208 col 2, unswitched to enable the code at "..\..\src\numerical-recipes-in-c\nrutil.c" line 211 col 3
//-------------------------------------------------------------------
	LOOP_BEGIN .P63L40L;
	P1 = P5;
.LN213:
// line 209
	R0 = [P1++];
	R0 = R0 + R1 (NS) || P3 = [P5];
	P0 = R0;
	[P1] = R0;
	P2 = P4;
.LN214:
// line 210
	P3 = P3 + P4;
	R0 = [P3];
	R0 = R0 + R2;
	P0 = P0 + P4;
	[P0] = R0;
.LN215:
// line 211
	P0 = [SP + 56];
	// -- 3 stalls --
	LOOP .P63L17L LC0 = P0;

.P63L17:
//-------------------------------------------------------------------
//   Loop at "..\..\src\numerical-recipes-in-c\nrutil.c" line 211 col 3
//-------------------------------------------------------------------
//   This loop executes 1 iteration of the original loop in estimated 10 cycles.
//   (cycle count 10 includes 3 stalls)
//-------------------------------------------------------------------
//   This loop's resource usage is:
//     Group 1             used   7 out of   10 ( 70.0%)
//     16-bit Instruction  used  11 out of   20 ( 55.0%)
//     32-bit Instruction  used   4 out of   10 ( 40.0%)
//     Store               used   1 out of   10 ( 10.0%)
//-------------------------------------------------------------------
	LOOP_BEGIN .P63L17L;
.LN216:
	P0 = [P5 + 4];
	// -- 3 stalls --
	P3 = P0 + P2;
	R0 = [P3];
	P2 += 4;
	P0 = P0 + P2;
	R0 = R0 + R3;
	[P0] = R0;
.LN217:
	LOOP_END .P63L17L;

.P63L32:
//-------------------------------------------------------------------
//   Part of Loop 40, depth 1
//-------------------------------------------------------------------
	P5 = P1;
.LN218:
// line 208
	LOOP_END .P63L40L;

.P63L43:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------

.P63L15:
.LN219:
// line 215
	R0 = [SP + 40];
	SP += 12;
	P0 = [FP + 4];
	(R7:4, P5:3) = [SP++];
	UNLINK;
	// -- stall --
	JUMP (P0);

.P63L25:
	P1 = P5;
.LN220:
// line 208
	LOOP .P63L14L LC0 = P0;

.P63L14:
//-------------------------------------------------------------------
//   Loop at "..\..\src\numerical-recipes-in-c\nrutil.c" line 208 col 2, unswitched to enable the code at "<unknown>" line 0 col -1
//-------------------------------------------------------------------
//   This loop executes 1 iteration of the original loop in estimated 10 cycles.
//   (cycle count 10 includes 1 stall)
//-------------------------------------------------------------------
//   This loop's resource usage is:
//     Group 1             used   9 out of   10 ( 90.0%)
//     16-bit Instruction  used  13 out of   20 ( 65.0%)
//     32-bit Instruction  used   5 out of   10 ( 50.0%)
//     Store               used   2 out of   10 ( 20.0%)
//-------------------------------------------------------------------
	LOOP_BEGIN .P63L14L;
.LN221:
// line 209
	R0 = [P1++];
	R0 = R0 + R1 (NS) || P2 = [P5++];
	P0 = R0;
	[P1] = R0;
	// -- stall --
.LN222:
// line 210
	P2 = P2 + P4;
	R0 = [P2];
	P0 = P0 + P4;
	R0 = R0 + R2;
	[P0] = R0;
.LN223:
// line 208
	LOOP_END .P63L14L;

.P63L42:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------
	jump .P63L15;

	.align 4
.P63L7:
	R0.L = .salloca.14;
	R0.H = .salloca.14;
	.align 2
.LN224:
// line 203
	CALL.X (_nrerror);
	jump .P63L9;

	.align 4
.P63L4:
	R0.L = .salloca.13;
	R0.H = .salloca.13;
	.align 2
.LN225:
// line 197
	CALL.X (_nrerror);
	jump .P63L6;

	.align 4
.P63L1:
	R0.L = .salloca.12;
	R0.H = .salloca.12;
	.align 2
.LN226:
// line 191
	CALL.X (_nrerror);
	jump .P63L3;
.LN._f3tensor.end:
._f3tensor.end:
	.global _f3tensor;
	.type _f3tensor,STT_FUNC;

	.align 2;
_free_vector:
.LN_free_vector:
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 12 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,P0,ASTAT0-ASTAT1}
//   Call preserved registers used:{FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,I0-I3,B0-B3,M0-M3,A0.W,A0.X,A1.W,A1.X,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
.LN227:
// line "..\..\src\numerical-recipes-in-c\nrutil.c":221
	R1 <<= 2;
	R0 = R0 + R1;
.LN228:
// line 220
	LINK 12;
.LN229:
// line 221
	R0 += -4;
.LN230:
	CALL.X (_free);
.LN231:
// line 222
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);
.LN._free_vector.end:
._free_vector.end:
	.global _free_vector;
	.type _free_vector,STT_FUNC;

	.align 2;
_free_ivector:
.LN_free_ivector:
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 12 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,P0,ASTAT0-ASTAT1}
//   Call preserved registers used:{FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,I0-I3,B0-B3,M0-M3,A0.W,A0.X,A1.W,A1.X,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
.LN232:
// line "..\..\src\numerical-recipes-in-c\nrutil.c":227
	R1 <<= 2;
	R0 = R0 + R1;
.LN233:
// line 226
	LINK 12;
.LN234:
// line 227
	R0 += -4;
.LN235:
	CALL.X (_free);
.LN236:
// line 228
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);
.LN._free_ivector.end:
._free_ivector.end:
	.global _free_ivector;
	.type _free_ivector,STT_FUNC;

	.align 2;
_free_cvector:
.LN_free_cvector:
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 12 
//   Scratch registers used:{R0.L,R0.H,P0,ASTAT0-ASTAT1}
//   Call preserved registers used:{FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,I0-I3,B0-B3,M0-M3,A0.W,A0.X,A1.W,A1.X,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
.LN237:
// line "..\..\src\numerical-recipes-in-c\nrutil.c":233
	R0 = R0 + R1;
.LN238:
// line 232
	LINK 12;
.LN239:
// line 233
	R0 += -1;
.LN240:
	CALL.X (_free);
.LN241:
// line 234
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);
.LN._free_cvector.end:
._free_cvector.end:
	.global _free_cvector;
	.type _free_cvector,STT_FUNC;

	.align 2;
_free_lvector:
.LN_free_lvector:
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 12 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,P0,ASTAT0-ASTAT1}
//   Call preserved registers used:{FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,I0-I3,B0-B3,M0-M3,A0.W,A0.X,A1.W,A1.X,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
.LN242:
// line "..\..\src\numerical-recipes-in-c\nrutil.c":239
	R1 <<= 2;
	R0 = R0 + R1;
.LN243:
// line 238
	LINK 12;
.LN244:
// line 239
	R0 += -4;
.LN245:
	CALL.X (_free);
.LN246:
// line 240
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);
.LN._free_lvector.end:
._free_lvector.end:
	.global _free_lvector;
	.type _free_lvector,STT_FUNC;

	.align 2;
_free_dvector:
.LN_free_dvector:
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 12 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,P0,ASTAT0-ASTAT1}
//   Call preserved registers used:{FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,I0-I3,B0-B3,M0-M3,A0.W,A0.X,A1.W,A1.X,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
.LN247:
// line "..\..\src\numerical-recipes-in-c\nrutil.c":245
	R1 <<= 2;
	R0 = R0 + R1;
.LN248:
// line 244
	LINK 12;
.LN249:
// line 245
	R0 += -4;
.LN250:
	CALL.X (_free);
.LN251:
// line 246
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);
.LN._free_dvector.end:
._free_dvector.end:
	.global _free_dvector;
	.type _free_dvector,STT_FUNC;

	.align 4;
_free_matrix:
.LN_free_matrix:
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,P0-P1,ASTAT0-ASTAT1}
//   Call preserved registers used:{R6.L,R6.H,R7.L,R7.H,FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,I0-I3,B0-B3,M0-M3,A0.W,A0.X,A1.W,A1.X,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
// line "..\..\src\numerical-recipes-in-c\nrutil.c":250
	LINK 0;
	.align 2
.LN252:
// line 251
	R1 <<= 2;
.LN253:
// line 250
	[--SP] = (R7:6);
.LN254:
// line 251
	R7 = R0 + R1;
	P1 = R7;
.LN255:
// line 250
	SP += -12;
	R2 = [SP + 40];
.LN256:
// line 251
	R0 = R2 << 2;
	R6 = -4;
	R1 = [P1];
	R0 = R1 + R0;
	R0 = R0 + R6;
.LN257:
	CALL.X (_free);
.LN258:
// line 252
	R0 = R7 + R6;
.LN259:
	CALL.X (_free);
.LN260:
// line 253
	SP += 12;
	P0 = [FP + 4];
	(R7:6) = [SP++];
	UNLINK;
	// -- stall --
	JUMP (P0);
.LN._free_matrix.end:
._free_matrix.end:
	.global _free_matrix;
	.type _free_matrix,STT_FUNC;

	.align 4;
_free_dmatrix:
.LN_free_dmatrix:
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,P0-P1,ASTAT0-ASTAT1}
//   Call preserved registers used:{R6.L,R6.H,R7.L,R7.H,FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,I0-I3,B0-B3,M0-M3,A0.W,A0.X,A1.W,A1.X,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
// line "..\..\src\numerical-recipes-in-c\nrutil.c":257
	LINK 0;
	.align 2
.LN261:
// line 258
	R1 <<= 2;
.LN262:
// line 257
	[--SP] = (R7:6);
.LN263:
// line 258
	R7 = R0 + R1;
	P1 = R7;
.LN264:
// line 257
	SP += -12;
	R2 = [SP + 40];
.LN265:
// line 258
	R0 = R2 << 2;
	R6 = -4;
	R1 = [P1];
	R0 = R1 + R0;
	R0 = R0 + R6;
.LN266:
	CALL.X (_free);
.LN267:
// line 259
	R0 = R7 + R6;
.LN268:
	CALL.X (_free);
.LN269:
// line 260
	SP += 12;
	P0 = [FP + 4];
	(R7:6) = [SP++];
	UNLINK;
	// -- stall --
	JUMP (P0);
.LN._free_dmatrix.end:
._free_dmatrix.end:
	.global _free_dmatrix;
	.type _free_dmatrix,STT_FUNC;

	.align 4;
_free_imatrix:
.LN_free_imatrix:
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,P0-P1,ASTAT0-ASTAT1}
//   Call preserved registers used:{R6.L,R6.H,R7.L,R7.H,FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,I0-I3,B0-B3,M0-M3,A0.W,A0.X,A1.W,A1.X,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
// line "..\..\src\numerical-recipes-in-c\nrutil.c":264
	LINK 0;
	.align 2
.LN270:
// line 265
	R1 <<= 2;
.LN271:
// line 264
	[--SP] = (R7:6);
.LN272:
// line 265
	R7 = R0 + R1;
	P1 = R7;
.LN273:
// line 264
	SP += -12;
	R2 = [SP + 40];
.LN274:
// line 265
	R0 = R2 << 2;
	R6 = -4;
	R1 = [P1];
	R0 = R1 + R0;
	R0 = R0 + R6;
.LN275:
	CALL.X (_free);
.LN276:
// line 266
	R0 = R7 + R6;
.LN277:
	CALL.X (_free);
.LN278:
// line 267
	SP += 12;
	P0 = [FP + 4];
	(R7:6) = [SP++];
	UNLINK;
	// -- stall --
	JUMP (P0);
.LN._free_imatrix.end:
._free_imatrix.end:
	.global _free_imatrix;
	.type _free_imatrix,STT_FUNC;

	.align 2;
_free_submatrix:
.LN_free_submatrix:
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 12 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,P0,ASTAT0-ASTAT1}
//   Call preserved registers used:{FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,I0-I3,B0-B3,M0-M3,A0.W,A0.X,A1.W,A1.X,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
.LN279:
// line "..\..\src\numerical-recipes-in-c\nrutil.c":272
	R1 <<= 2;
	R0 = R0 + R1;
.LN280:
// line 271
	LINK 12;
.LN281:
// line 272
	R0 += -4;
.LN282:
	CALL.X (_free);
.LN283:
// line 273
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);
.LN._free_submatrix.end:
._free_submatrix.end:
	.global _free_submatrix;
	.type _free_submatrix,STT_FUNC;

	.align 2;
_free_convert_matrix:
.LN_free_convert_matrix:
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 12 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,P0,ASTAT0-ASTAT1}
//   Call preserved registers used:{FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,I0-I3,B0-B3,M0-M3,A0.W,A0.X,A1.W,A1.X,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
.LN284:
// line "..\..\src\numerical-recipes-in-c\nrutil.c":278
	R1 <<= 2;
	R0 = R0 + R1;
.LN285:
// line 277
	LINK 12;
.LN286:
// line 278
	R0 += -4;
.LN287:
	CALL.X (_free);
.LN288:
// line 279
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);
.LN._free_convert_matrix.end:
._free_convert_matrix.end:
	.global _free_convert_matrix;
	.type _free_convert_matrix,STT_FUNC;

	.align 4;
_free_f3tensor:
.LN_free_f3tensor:
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,P0-P1,ASTAT0-ASTAT1}
//   Call preserved registers used:{R6.L,R6.H,R7.L,R7.H,P4-P5,FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,I0-I3,B0-B3,M0-M3,A0.W,A0.X,A1.W,A1.X,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
// line "..\..\src\numerical-recipes-in-c\nrutil.c":284
	LINK 0;
	.align 2
.LN289:
// line 285
	R1 <<= 2;
.LN290:
// line 284
	[--SP] = (R7:6, P5:4);
.LN291:
// line 285
	R7 = R0 + R1;
	P5 = R7;
.LN292:
// line 284
	SP += -12;
	P4 = [SP + 48];
	R0 = [SP + 56];
.LN293:
// line 285
	R0 <<= 2;
	P1 = [P5];
	R6 = -4;
	// -- 2 stalls --
	P1 = P1 + (P4<<2);
	R1 = [P1];
	R0 = R1 + R0;
	R0 = R0 + R6;
.LN294:
	CALL.X (_free);
.LN295:
// line 286
	P1 = [P5];
	// -- 3 stalls --
	P1 = P1 + (P4<<2);
	R0 = P1;
	R0 = R0 + R6;
.LN296:
	CALL.X (_free);
.LN297:
// line 287
	R0 = R7 + R6;
.LN298:
	CALL.X (_free);
.LN299:
// line 288
	SP += 12;
	P0 = [FP + 4];
	(R7:6, P5:4) = [SP++];
	UNLINK;
	// -- stall --
	JUMP (P0);
.LN._free_f3tensor.end:
._free_f3tensor.end:
	.global _free_f3tensor;
	.type _free_f3tensor,STT_FUNC;

	.file_attr ProjectName="CoreA";
	.file_attr FuncName="_nrerror";
	.file_attr FuncName="_vector";
	.file_attr FuncName="_ivector";
	.file_attr FuncName="_cvector";
	.file_attr FuncName="_lvector";
	.file_attr FuncName="_dvector";
	.file_attr FuncName="_matrix";
	.file_attr FuncName="_dmatrix";
	.file_attr FuncName="_imatrix";
	.file_attr FuncName="_submatrix";
	.file_attr FuncName="_convert_matrix";
	.file_attr FuncName="_f3tensor";
	.file_attr FuncName="_free_vector";
	.file_attr FuncName="_free_ivector";
	.file_attr FuncName="_free_cvector";
	.file_attr FuncName="_free_lvector";
	.file_attr FuncName="_free_dvector";
	.file_attr FuncName="_free_matrix";
	.file_attr FuncName="_free_dmatrix";
	.file_attr FuncName="_free_imatrix";
	.file_attr FuncName="_free_submatrix";
	.file_attr FuncName="_free_convert_matrix";
	.file_attr FuncName="_free_f3tensor";
	.file_attr Content="CodeData";
.epctext.end:

	.extern _fprintf;
	.type _fprintf,STT_FUNC;
	.extern _exit;
	.type _exit,STT_FUNC;
	.extern _malloc;
	.type _malloc,STT_FUNC;
	.extern _free;
	.type _free,STT_FUNC;

	.section/DOUBLE32 constdata;

	.align 4;
.epcrodata:
	.type .epcrodata,STT_OBJECT;
	.byte =
		0x25,0x73,0x0A,0x00;
.epcrodata.end:

	.section .debug_abbrev SHT_DEBUGINFO;

	.align 1;
.epcabbrev:
	.type .epcabbrev,STT_OBJECT;
	.inc/binary "..\Debug\nrutil.sbn", 0, 206;
.epcabbrev.end:

	.section .debug_info SHT_DEBUGINFO;

	.align 1;
.epcdebug:
	.type .epcdebug,STT_OBJECT;
	.byte =
		0xCA,0x0A,0x00,0x00,0x02,0x00;
	.byte4 = .epcabbrev;
	.byte =
		0x04,0x01,0x2E,0x2E,0x5C,0x2E,0x2E,0x5C,0x73,0x72,0x63,0x5C,
		0x6E,0x75,0x6D,0x65,0x72,0x69,0x63,0x61,0x6C,0x2D,0x72,0x65,
		0x63,0x69,0x70,0x65,0x73,0x2D,0x69,0x6E,0x2D,0x63,0x5C,0x6E,
		0x72,0x75,0x74,0x69,0x6C,0x2E,0x63,0x00,0x01;
	.byte4 = .epcline;
	.inc/binary "..\Debug\nrutil.sbn", 206, 1398;
	.byte4 = .LN_nrerror;
	.byte4 = .LN._nrerror.end;
	.byte =
		0x01,0x01,0x00,0x0C,0x00,0x00,0x00,0x00;
	.byte4 = .LN0;
	.byte4 = .LN._nrerror.end;
	.byte =
		0x00,0x00,0x04,0x00,0x50,0x02,0x00,0x00,0x0D,0xFC,0x05,0x00,
		0x00,0x76,0x65,0x63,0x74,0x6F,0x72,0x00,0x01;
	.byte4 = .LN_vector;
	.byte4 = .LN._vector.end;
	.byte =
		0x01,0xCB,0x05,0x00,0x00,0x01,0x00,0x0C,0x00,0x00,0x00,0x00;
	.byte4 = .LN6;
	.byte4 = .LN._vector.end;
	.byte =
		0x00,0x00,0x04,0x00,0xCC,0x01,0x00,0x00,0x0D,0x2E,0x06,0x00,
		0x00,0x69,0x76,0x65,0x63,0x74,0x6F,0x72,0x00,0x01;
	.byte4 = .LN_ivector;
	.byte4 = .LN._ivector.end;
	.byte =
		0x01,0xFC,0x05,0x00,0x00,0x01,0x00,0x0C,0x00,0x00,0x00,0x00;
	.byte4 = .LN13;
	.byte4 = .LN._ivector.end;
	.byte =
		0x00,0x00,0x0D,0x5A,0x06,0x00,0x00,0x63,0x76,0x65,0x63,0x74,
		0x6F,0x72,0x00,0x01;
	.byte4 = .LN_cvector;
	.byte4 = .LN._cvector.end;
	.byte =
		0x01,0x9D,0x05,0x00,0x00,0x01,0x00,0x0C,0x00,0x00,0x00,0x00;
	.byte4 = .LN20;
	.byte4 = .LN._cvector.end;
	.byte =
		0x00,0x00,0x04,0x00,0x08,0x02,0x00,0x00,0x0D,0x8C,0x06,0x00,
		0x00,0x6C,0x76,0x65,0x63,0x74,0x6F,0x72,0x00,0x01;
	.byte4 = .LN_lvector;
	.byte4 = .LN._lvector.end;
	.byte =
		0x01,0x5A,0x06,0x00,0x00,0x01,0x00,0x0C,0x00,0x00,0x00,0x00;
	.byte4 = .LN27;
	.byte4 = .LN._lvector.end;
	.byte =
		0x00,0x00,0x04,0x00,0x59,0x02,0x00,0x00,0x0D,0xBE,0x06,0x00,
		0x00,0x64,0x76,0x65,0x63,0x74,0x6F,0x72,0x00,0x01;
	.byte4 = .LN_dvector;
	.byte4 = .LN._dvector.end;
	.byte =
		0x01,0x8C,0x06,0x00,0x00,0x01,0x00,0x0C,0x00,0x00,0x00,0x00;
	.byte4 = .LN34;
	.byte4 = .LN._dvector.end;
	.byte =
		0x00,0x00,0x04,0x00,0xCB,0x05,0x00,0x00,0x0D,0xFC,0x06,0x00,
		0x00,0x6D,0x61,0x74,0x72,0x69,0x78,0x00,0x01;
	.byte4 = .LN_matrix;
	.byte4 = .LN._matrix.end;
	.byte =
		0x01,0xBE,0x06,0x00,0x00,0x01,0x00,0x0E,0x6E,0x63,0x68,0x00,
		0xF1,0x01,0x00,0x00,0x02,0x7F,0x14,0x00,0x0C,0x00,0x00,0x00,
		0x00;
	.byte4 = .LN41;
	.byte4 = .LN._matrix.end;
	.byte =
		0x00,0x00,0x04,0x00,0x8C,0x06,0x00,0x00,0x0D,0x3B,0x07,0x00,
		0x00,0x64,0x6D,0x61,0x74,0x72,0x69,0x78,0x00,0x01;
	.byte4 = .LN_dmatrix;
	.byte4 = .LN._dmatrix.end;
	.byte =
		0x01,0xFC,0x06,0x00,0x00,0x01,0x00,0x0E,0x6E,0x63,0x68,0x00,
		0xF1,0x01,0x00,0x00,0x02,0x7F,0x14,0x00,0x0C,0x00,0x00,0x00,
		0x00;
	.byte4 = .LN70;
	.byte4 = .LN._dmatrix.end;
	.byte =
		0x00,0x00,0x04,0x00,0xFC,0x05,0x00,0x00,0x0D,0x7A,0x07,0x00,
		0x00,0x69,0x6D,0x61,0x74,0x72,0x69,0x78,0x00,0x01;
	.byte4 = .LN_imatrix;
	.byte4 = .LN._imatrix.end;
	.byte =
		0x01,0x3B,0x07,0x00,0x00,0x01,0x00,0x0E,0x6E,0x63,0x68,0x00,
		0xF1,0x01,0x00,0x00,0x02,0x7F,0x14,0x00,0x0C,0x00,0x00,0x00,
		0x00;
	.byte4 = .LN99;
	.byte4 = .LN._imatrix.end;
	.byte =
		0x00,0x00,0x0D,0xD5,0x07,0x00,0x00,0x73,0x75,0x62,0x6D,0x61,
		0x74,0x72,0x69,0x78,0x00,0x01;
	.byte4 = .LN_submatrix;
	.byte4 = .LN._submatrix.end;
	.byte =
		0x01,0xBE,0x06,0x00,0x00,0x01,0x00,0x0E,0x6F,0x6C,0x64,0x63,
		0x6C,0x00,0xF1,0x01,0x00,0x00,0x02,0x7F,0x14,0x00,0x0E,0x6E,
		0x65,0x77,0x72,0x6C,0x00,0xF1,0x01,0x00,0x00,0x02,0x7F,0x1C,
		0x00,0x0E,0x6E,0x65,0x77,0x63,0x6C,0x00,0xF1,0x01,0x00,0x00,
		0x02,0x7F,0x20,0x00,0x0C,0x00,0x00,0x00,0x00;
	.byte4 = .LN128;
	.byte4 = .LN._submatrix.end;
	.byte =
		0x00,0x00,0x0D,0x22,0x08,0x00,0x00,0x63,0x6F,0x6E,0x76,0x65,
		0x72,0x74,0x5F,0x6D,0x61,0x74,0x72,0x69,0x78,0x00,0x01;
	.byte4 = .LN_convert_matrix;
	.byte4 = .LN._convert_matrix.end;
	.byte =
		0x01,0xBE,0x06,0x00,0x00,0x01,0x00,0x0E,0x6E,0x63,0x6C,0x00,
		0xF1,0x01,0x00,0x00,0x02,0x7F,0x14,0x00,0x0E,0x6E,0x63,0x68,
		0x00,0xF1,0x01,0x00,0x00,0x02,0x7F,0x18,0x00,0x0C,0x00,0x00,
		0x00,0x00;
	.byte4 = .LN146;
	.byte4 = .LN._convert_matrix.end;
	.byte =
		0x00,0x00,0x04,0x00,0xBE,0x06,0x00,0x00,0x0D,0x7C,0x08,0x00,
		0x00,0x66,0x33,0x74,0x65,0x6E,0x73,0x6F,0x72,0x00,0x01;
	.byte4 = .LN_f3tensor;
	.byte4 = .LN._f3tensor.end;
	.byte =
		0x01,0x22,0x08,0x00,0x00,0x01,0x00,0x0E,0x6E,0x63,0x68,0x00,
		0xF1,0x01,0x00,0x00,0x02,0x7F,0x14,0x00,0x0E,0x6E,0x64,0x6C,
		0x00,0xF1,0x01,0x00,0x00,0x02,0x7F,0x18,0x00,0x0E,0x6E,0x64,
		0x68,0x00,0xF1,0x01,0x00,0x00,0x02,0x7F,0x1C,0x00,0x0C,0x00,
		0x00,0x00,0x00;
	.byte4 = .LN169;
	.byte4 = .LN._f3tensor.end;
	.byte =
		0x00,0x00,0x0B,0xA8,0x08,0x00,0x00,0x66,0x72,0x65,0x65,0x5F,
		0x76,0x65,0x63,0x74,0x6F,0x72,0x00,0x01;
	.byte4 = .LN_free_vector;
	.byte4 = .LN._free_vector.end;
	.byte =
		0x01,0x01,0x00,0x0C,0x00,0x00,0x00,0x00;
	.byte4 = .LN227;
	.byte4 = .LN._free_vector.end;
	.byte =
		0x00,0x00,0x0B,0xD5,0x08,0x00,0x00,0x66,0x72,0x65,0x65,0x5F,
		0x69,0x76,0x65,0x63,0x74,0x6F,0x72,0x00,0x01;
	.byte4 = .LN_free_ivector;
	.byte4 = .LN._free_ivector.end;
	.byte =
		0x01,0x01,0x00,0x0C,0x00,0x00,0x00,0x00;
	.byte4 = .LN232;
	.byte4 = .LN._free_ivector.end;
	.byte =
		0x00,0x00,0x0B,0x02,0x09,0x00,0x00,0x66,0x72,0x65,0x65,0x5F,
		0x63,0x76,0x65,0x63,0x74,0x6F,0x72,0x00,0x01;
	.byte4 = .LN_free_cvector;
	.byte4 = .LN._free_cvector.end;
	.byte =
		0x01,0x01,0x00,0x0C,0x00,0x00,0x00,0x00;
	.byte4 = .LN237;
	.byte4 = .LN._free_cvector.end;
	.byte =
		0x00,0x00,0x0B,0x2F,0x09,0x00,0x00,0x66,0x72,0x65,0x65,0x5F,
		0x6C,0x76,0x65,0x63,0x74,0x6F,0x72,0x00,0x01;
	.byte4 = .LN_free_lvector;
	.byte4 = .LN._free_lvector.end;
	.byte =
		0x01,0x01,0x00,0x0C,0x00,0x00,0x00,0x00;
	.byte4 = .LN242;
	.byte4 = .LN._free_lvector.end;
	.byte =
		0x00,0x00,0x0B,0x5C,0x09,0x00,0x00,0x66,0x72,0x65,0x65,0x5F,
		0x64,0x76,0x65,0x63,0x74,0x6F,0x72,0x00,0x01;
	.byte4 = .LN_free_dvector;
	.byte4 = .LN._free_dvector.end;
	.byte =
		0x01,0x01,0x00,0x0C,0x00,0x00,0x00,0x00;
	.byte4 = .LN247;
	.byte4 = .LN._free_dvector.end;
	.byte =
		0x00,0x00,0x0B,0x95,0x09,0x00,0x00,0x66,0x72,0x65,0x65,0x5F,
		0x6D,0x61,0x74,0x72,0x69,0x78,0x00,0x01;
	.byte4 = .LN_free_matrix;
	.byte4 = .LN._free_matrix.end;
	.byte =
		0x01,0x01,0x00,0x0E,0x6E,0x63,0x6C,0x00,0xF1,0x01,0x00,0x00,
		0x02,0x7F,0x14,0x00,0x0C,0x00,0x00,0x00,0x00;
	.byte4 = .LN252;
	.byte4 = .LN._free_matrix.end;
	.byte =
		0x00,0x00,0x0B,0xCF,0x09,0x00,0x00,0x66,0x72,0x65,0x65,0x5F,
		0x64,0x6D,0x61,0x74,0x72,0x69,0x78,0x00,0x01;
	.byte4 = .LN_free_dmatrix;
	.byte4 = .LN._free_dmatrix.end;
	.byte =
		0x01,0x01,0x00,0x0E,0x6E,0x63,0x6C,0x00,0xF1,0x01,0x00,0x00,
		0x02,0x7F,0x14,0x00,0x0C,0x00,0x00,0x00,0x00;
	.byte4 = .LN261;
	.byte4 = .LN._free_dmatrix.end;
	.byte =
		0x00,0x00,0x0B,0x09,0x0A,0x00,0x00,0x66,0x72,0x65,0x65,0x5F,
		0x69,0x6D,0x61,0x74,0x72,0x69,0x78,0x00,0x01;
	.byte4 = .LN_free_imatrix;
	.byte4 = .LN._free_imatrix.end;
	.byte =
		0x01,0x01,0x00,0x0E,0x6E,0x63,0x6C,0x00,0xF1,0x01,0x00,0x00,
		0x02,0x7F,0x14,0x00,0x0C,0x00,0x00,0x00,0x00;
	.byte4 = .LN270;
	.byte4 = .LN._free_imatrix.end;
	.byte =
		0x00,0x00,0x0B,0x38,0x0A,0x00,0x00,0x66,0x72,0x65,0x65,0x5F,
		0x73,0x75,0x62,0x6D,0x61,0x74,0x72,0x69,0x78,0x00,0x01;
	.byte4 = .LN_free_submatrix;
	.byte4 = .LN._free_submatrix.end;
	.byte =
		0x01,0x01,0x00,0x0C,0x00,0x00,0x00,0x00;
	.byte4 = .LN279;
	.byte4 = .LN._free_submatrix.end;
	.byte =
		0x00,0x00,0x0B,0x6C,0x0A,0x00,0x00,0x66,0x72,0x65,0x65,0x5F,
		0x63,0x6F,0x6E,0x76,0x65,0x72,0x74,0x5F,0x6D,0x61,0x74,0x72,
		0x69,0x78,0x00,0x01;
	.byte4 = .LN_free_convert_matrix;
	.byte4 = .LN._free_convert_matrix.end;
	.byte =
		0x01,0x01,0x00,0x0C,0x00,0x00,0x00,0x00;
	.byte4 = .LN284;
	.byte4 = .LN._free_convert_matrix.end;
	.byte =
		0x00,0x00,0x0B,0xB4,0x0A,0x00,0x00,0x66,0x72,0x65,0x65,0x5F,
		0x66,0x33,0x74,0x65,0x6E,0x73,0x6F,0x72,0x00,0x01;
	.byte4 = .LN_free_f3tensor;
	.byte4 = .LN._free_f3tensor.end;
	.byte =
		0x01,0x01,0x00,0x0E,0x6E,0x63,0x6C,0x00,0xF1,0x01,0x00,0x00,
		0x02,0x7F,0x14,0x00,0x0E,0x6E,0x64,0x6C,0x00,0xF1,0x01,0x00,
		0x00,0x02,0x7F,0x1C,0x00,0x0C,0x00,0x00,0x00,0x00;
	.byte4 = .LN289;
	.byte4 = .LN._free_f3tensor.end;
	.byte =
		0x00,0x00,0x0F,0x5F,0x53,0x74,0x64,0x65,0x72,0x72,0x00,0x01,
		0x8F,0x04,0x00,0x00,0x05,0x0C;
	.byte4 = __Stderr;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x00;
.epcdebug.end:

	.section .debug_line SHT_DEBUGINFO;

	.align 1;
.epcline:
	.type .epcline,STT_OBJECT;
	.inc/binary "..\Debug\nrutil.sbn", 1604, 729;
	.byte4 = .LN_nrerror;
	.byte =
		0x04,0x01,0x05,0x01,0x13,0x00,0x05,0x02;
	.byte4 = .LN0;
	.byte =
		0x05,0x09,0x0A,0x00,0x05,0x02;
	.byte4 = .LN1;
	.byte =
		0x05,0x01,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN2;
	.byte =
		0x05,0x09,0x0A,0x00,0x05,0x02;
	.byte4 = .LN3;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN4;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN5;
	.byte =
		0x05,0x06,0x0A,0x00,0x05,0x02;
	.byte4 = .LN._nrerror.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_vector;
	.byte =
		0x04,0x01,0x05,0x01,0x1C,0x00,0x05,0x02;
	.byte4 = .LN6;
	.byte =
		0x05,0x02,0x0C,0x00,0x05,0x02;
	.byte4 = .LN7;
	.byte =
		0x05,0x01,0x03,0x7D,0x01,0x00,0x05,0x02;
	.byte4 = .LN8;
	.byte =
		0x05,0x02,0x0C,0x00,0x05,0x02;
	.byte4 = .LN9;
	.byte =
		0x05,0x13,0x01,0x00,0x05,0x02;
	.byte4 = .LN10;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN11;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN12;
	.byte =
		0x05,0x11,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN._vector.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_ivector;
	.byte =
		0x04,0x01,0x05,0x01,0x26,0x00,0x05,0x02;
	.byte4 = .LN13;
	.byte =
		0x05,0x02,0x0C,0x00,0x05,0x02;
	.byte4 = .LN14;
	.byte =
		0x05,0x01,0x03,0x7D,0x01,0x00,0x05,0x02;
	.byte4 = .LN15;
	.byte =
		0x05,0x02,0x0C,0x00,0x05,0x02;
	.byte4 = .LN16;
	.byte =
		0x05,0x11,0x01,0x00,0x05,0x02;
	.byte4 = .LN17;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN18;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN19;
	.byte =
		0x05,0x11,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN._ivector.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_cvector;
	.byte =
		0x04,0x01,0x05,0x01,0x30,0x00,0x05,0x02;
	.byte4 = .LN20;
	.byte =
		0x05,0x02,0x0C,0x00,0x05,0x02;
	.byte4 = .LN21;
	.byte =
		0x05,0x01,0x03,0x7D,0x01,0x00,0x05,0x02;
	.byte4 = .LN22;
	.byte =
		0x05,0x02,0x0C,0x00,0x05,0x02;
	.byte4 = .LN23;
	.byte =
		0x05,0x1B,0x01,0x00,0x05,0x02;
	.byte4 = .LN24;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN25;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN26;
	.byte =
		0x05,0x11,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN._cvector.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_lvector;
	.byte =
		0x04,0x01,0x05,0x01,0x3A,0x00,0x05,0x02;
	.byte4 = .LN27;
	.byte =
		0x05,0x02,0x0C,0x00,0x05,0x02;
	.byte4 = .LN28;
	.byte =
		0x05,0x01,0x03,0x7D,0x01,0x00,0x05,0x02;
	.byte4 = .LN29;
	.byte =
		0x05,0x02,0x0C,0x00,0x05,0x02;
	.byte4 = .LN30;
	.byte =
		0x05,0x1B,0x01,0x00,0x05,0x02;
	.byte4 = .LN31;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN32;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN33;
	.byte =
		0x05,0x11,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN._lvector.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_dvector;
	.byte =
		0x04,0x01,0x05,0x01,0x44,0x00,0x05,0x02;
	.byte4 = .LN34;
	.byte =
		0x05,0x02,0x0C,0x00,0x05,0x02;
	.byte4 = .LN35;
	.byte =
		0x05,0x01,0x03,0x7D,0x01,0x00,0x05,0x02;
	.byte4 = .LN36;
	.byte =
		0x05,0x02,0x0C,0x00,0x05,0x02;
	.byte4 = .LN37;
	.byte =
		0x05,0x14,0x01,0x00,0x05,0x02;
	.byte4 = .LN38;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN39;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN40;
	.byte =
		0x05,0x11,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN._dvector.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_matrix;
	.byte =
		0x04,0x01,0x05,0x01,0x4E,0x00,0x05,0x02;
	.byte4 = .LN41;
	.byte =
		0x05,0x19,0x0A,0x00,0x05,0x02;
	.byte4 = .LN42;
	.byte =
		0x05,0x0A,0x01,0x00,0x05,0x02;
	.byte4 = .LN43;
	.byte =
		0x05,0x02,0x0D,0x00,0x05,0x02;
	.byte4 = .LN44;
	.byte =
		0x05,0x15,0x01,0x00,0x05,0x02;
	.byte4 = .LN45;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN46;
	.byte =
		0x05,0x19,0x03,0x7B,0x01,0x00,0x05,0x02;
	.byte4 = .LN47;
	.byte =
		0x05,0x0A,0x01,0x00,0x05,0x02;
	.byte4 = .LN48;
	.byte =
		0x05,0x02,0x0E,0x00,0x05,0x02;
	.byte4 = .LN49;
	.byte =
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN50;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN51;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN52;
	.byte =
		0x0C,0x00,0x05,0x02;
	.byte4 = .LN53;
	.byte =
		0x03,0x7D,0x01,0x00,0x05,0x02;
	.byte4 = .LN54;
	.byte =
		0x0C,0x00,0x05,0x02;
	.byte4 = .LN55;
	.byte =
		0x05,0x19,0x01,0x00,0x05,0x02;
	.byte4 = .LN56;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN57;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN58;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN59;
	.byte =
		0x0D,0x00,0x05,0x02;
	.byte4 = .LN60;
	.byte =
		0x03,0x7D,0x01,0x00,0x05,0x02;
	.byte4 = .LN61;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN62;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN63;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN64;
	.byte =
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN65;
	.byte =
		0x05,0x1A,0x01,0x00,0x05,0x02;
	.byte4 = .LN66;
	.byte =
		0x05,0x02,0x01,0x00,0x05,0x02;
	.byte4 = .LN67;
	.byte =
		0x0C,0x00,0x05,0x02;
	.byte4 = .LN68;
	.byte =
		0x05,0x16,0x03,0x79,0x01,0x00,0x05,0x02;
	.byte4 = .LN69;
	.byte =
		0x05,0x11,0x03,0x7A,0x01,0x00,0x05,0x02;
	.byte4 = .LN._matrix.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_dmatrix;
	.byte =
		0x04,0x01,0x05,0x01,0x66,0x00,0x05,0x02;
	.byte4 = .LN70;
	.byte =
		0x05,0x19,0x0A,0x00,0x05,0x02;
	.byte4 = .LN71;
	.byte =
		0x05,0x0A,0x01,0x00,0x05,0x02;
	.byte4 = .LN72;
	.byte =
		0x05,0x02,0x0D,0x00,0x05,0x02;
	.byte4 = .LN73;
	.byte =
		0x05,0x16,0x01,0x00,0x05,0x02;
	.byte4 = .LN74;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN75;
	.byte =
		0x05,0x19,0x03,0x7B,0x01,0x00,0x05,0x02;
	.byte4 = .LN76;
	.byte =
		0x05,0x0A,0x01,0x00,0x05,0x02;
	.byte4 = .LN77;
	.byte =
		0x05,0x02,0x0E,0x00,0x05,0x02;
	.byte4 = .LN78;
	.byte =
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN79;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN80;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN81;
	.byte =
		0x0C,0x00,0x05,0x02;
	.byte4 = .LN82;
	.byte =
		0x03,0x7D,0x01,0x00,0x05,0x02;
	.byte4 = .LN83;
	.byte =
		0x0C,0x00,0x05,0x02;
	.byte4 = .LN84;
	.byte =
		0x05,0x1A,0x01,0x00,0x05,0x02;
	.byte4 = .LN85;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN86;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN87;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN88;
	.byte =
		0x0D,0x00,0x05,0x02;
	.byte4 = .LN89;
	.byte =
		0x03,0x7D,0x01,0x00,0x05,0x02;
	.byte4 = .LN90;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN91;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN92;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN93;
	.byte =
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN94;
	.byte =
		0x05,0x1A,0x01,0x00,0x05,0x02;
	.byte4 = .LN95;
	.byte =
		0x05,0x02,0x01,0x00,0x05,0x02;
	.byte4 = .LN96;
	.byte =
		0x0C,0x00,0x05,0x02;
	.byte4 = .LN97;
	.byte =
		0x05,0x16,0x03,0x79,0x01,0x00,0x05,0x02;
	.byte4 = .LN98;
	.byte =
		0x05,0x11,0x03,0x7A,0x01,0x00,0x05,0x02;
	.byte4 = .LN._dmatrix.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_imatrix;
	.byte =
		0x04,0x01,0x05,0x01,0x7E,0x00,0x05,0x02;
	.byte4 = .LN99;
	.byte =
		0x05,0x19,0x0A,0x00,0x05,0x02;
	.byte4 = .LN100;
	.byte =
		0x05,0x0A,0x01,0x00,0x05,0x02;
	.byte4 = .LN101;
	.byte =
		0x05,0x02,0x0D,0x00,0x05,0x02;
	.byte4 = .LN102;
	.byte =
		0x05,0x13,0x01,0x00,0x05,0x02;
	.byte4 = .LN103;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN104;
	.byte =
		0x05,0x19,0x03,0x7B,0x01,0x00,0x05,0x02;
	.byte4 = .LN105;
	.byte =
		0x05,0x0A,0x01,0x00,0x05,0x02;
	.byte4 = .LN106;
	.byte =
		0x05,0x02,0x0E,0x00,0x05,0x02;
	.byte4 = .LN107;
	.byte =
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN108;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN109;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN110;
	.byte =
		0x0D,0x00,0x05,0x02;
	.byte4 = .LN111;
	.byte =
		0x03,0x7C,0x01,0x00,0x05,0x02;
	.byte4 = .LN112;
	.byte =
		0x0D,0x00,0x05,0x02;
	.byte4 = .LN113;
	.byte =
		0x05,0x17,0x01,0x00,0x05,0x02;
	.byte4 = .LN114;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN115;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN116;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN117;
	.byte =
		0x0D,0x00,0x05,0x02;
	.byte4 = .LN118;
	.byte =
		0x03,0x7D,0x01,0x00,0x05,0x02;
	.byte4 = .LN119;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN120;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN121;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN122;
	.byte =
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN123;
	.byte =
		0x05,0x1A,0x01,0x00,0x05,0x02;
	.byte4 = .LN124;
	.byte =
		0x05,0x02,0x01,0x00,0x05,0x02;
	.byte4 = .LN125;
	.byte =
		0x0C,0x00,0x05,0x02;
	.byte4 = .LN126;
	.byte =
		0x05,0x16,0x03,0x79,0x01,0x00,0x05,0x02;
	.byte4 = .LN127;
	.byte =
		0x05,0x11,0x03,0x79,0x01,0x00,0x05,0x02;
	.byte4 = .LN._imatrix.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_submatrix;
	.byte =
		0x04,0x01,0x05,0x01,0x98,0x00,0x05,0x02;
	.byte4 = .LN128;
	.byte =
		0x05,0x1E,0x0A,0x00,0x05,0x02;
	.byte4 = .LN129;
	.byte =
		0x05,0x01,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN130;
	.byte =
		0x05,0x0B,0x0A,0x00,0x05,0x02;
	.byte4 = .LN131;
	.byte =
		0x05,0x02,0x0D,0x00,0x05,0x02;
	.byte4 = .LN132;
	.byte =
		0x05,0x15,0x01,0x00,0x05,0x02;
	.byte4 = .LN133;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN134;
	.byte =
		0x05,0x01,0x03,0x7A,0x01,0x00,0x05,0x02;
	.byte4 = .LN135;
	.byte =
		0x05,0x02,0x10,0x00,0x05,0x02;
	.byte4 = .LN136;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN137;
	.byte =
		0x0C,0x00,0x05,0x02;
	.byte4 = .LN138;
	.byte =
		0x03,0x7D,0x01,0x00,0x05,0x02;
	.byte4 = .LN139;
	.byte =
		0x0C,0x00,0x05,0x02;
	.byte4 = .LN140;
	.byte =
		0x05,0x28,0x01,0x00,0x05,0x02;
	.byte4 = .LN141;
	.byte =
		0x05,0x02,0x01,0x00,0x05,0x02;
	.byte4 = .LN142;
	.byte =
		0x05,0x28,0x01,0x00,0x05,0x02;
	.byte4 = .LN143;
	.byte =
		0x05,0x02,0x01,0x00,0x05,0x02;
	.byte4 = .LN144;
	.byte =
		0x0C,0x00,0x05,0x02;
	.byte4 = .LN145;
	.byte =
		0x05,0x11,0x03,0x78,0x01,0x00,0x05,0x02;
	.byte4 = .LN._submatrix.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_convert_matrix;
	.byte =
		0x04,0x01,0x05,0x01,0xAE,0x00,0x05,0x02;
	.byte4 = .LN146;
	.byte =
		0x05,0x0B,0x0A,0x00,0x05,0x02;
	.byte4 = .LN147;
	.byte =
		0x05,0x01,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN148;
	.byte =
		0x05,0x1A,0x0A,0x00,0x05,0x02;
	.byte4 = .LN149;
	.byte =
		0x05,0x02,0x0D,0x00,0x05,0x02;
	.byte4 = .LN150;
	.byte =
		0x05,0x15,0x01,0x00,0x05,0x02;
	.byte4 = .LN151;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN152;
	.byte =
		0x05,0x0B,0x03,0x7B,0x01,0x00,0x05,0x02;
	.byte4 = .LN153;
	.byte =
		0x05,0x1A,0x01,0x00,0x05,0x02;
	.byte4 = .LN154;
	.byte =
		0x05,0x02,0x0E,0x00,0x05,0x02;
	.byte4 = .LN155;
	.byte =
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN156;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN157;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN158;
	.byte =
		0x05,0x01,0x03,0x78,0x01,0x00,0x05,0x02;
	.byte4 = .LN159;
	.byte =
		0x05,0x02,0x14,0x00,0x05,0x02;
	.byte4 = .LN160;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN161;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN162;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN163;
	.byte =
		0x05,0x22,0x01,0x00,0x05,0x02;
	.byte4 = .LN164;
	.byte =
		0x05,0x02,0x01,0x00,0x05,0x02;
	.byte4 = .LN165;
	.byte =
		0x05,0x22,0x01,0x00,0x05,0x02;
	.byte4 = .LN166;
	.byte =
		0x05,0x02,0x01,0x00,0x05,0x02;
	.byte4 = .LN167;
	.byte =
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN168;
	.byte =
		0x05,0x11,0x03,0x78,0x01,0x00,0x05,0x02;
	.byte4 = .LN._convert_matrix.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_f3tensor;
	.byte =
		0x04,0x01,0x05,0x01,0xC1,0x00,0x05,0x02;
	.byte4 = .LN169;
	.byte =
		0x05,0x1A,0x0A,0x00,0x05,0x02;
	.byte4 = .LN170;
	.byte =
		0x05,0x0B,0x01,0x00,0x05,0x02;
	.byte4 = .LN171;
	.byte =
		0x05,0x01,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN172;
	.byte =
		0x05,0x29,0x0A,0x00,0x05,0x02;
	.byte4 = .LN173;
	.byte =
		0x05,0x01,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN174;
	.byte =
		0x05,0x02,0x0E,0x00,0x05,0x02;
	.byte4 = .LN175;
	.byte =
		0x05,0x16,0x01,0x00,0x05,0x02;
	.byte4 = .LN176;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN177;
	.byte =
		0x05,0x16,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN178;
	.byte =
		0x05,0x1A,0x03,0x7C,0x01,0x00,0x05,0x02;
	.byte4 = .LN179;
	.byte =
		0x05,0x29,0x01,0x00,0x05,0x02;
	.byte4 = .LN180;
	.byte =
		0x05,0x0B,0x01,0x00,0x05,0x02;
	.byte4 = .LN181;
	.byte =
		0x05,0x02,0x0E,0x00,0x05,0x02;
	.byte4 = .LN182;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN183;
	.byte =
		0x0D,0x00,0x05,0x02;
	.byte4 = .LN184;
	.byte =
		0x05,0x1A,0x01,0x00,0x05,0x02;
	.byte4 = .LN185;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN186;
	.byte =
		0x03,0x7C,0x01,0x00,0x05,0x02;
	.byte4 = .LN187;
	.byte =
		0x0C,0x00,0x05,0x02;
	.byte4 = .LN188;
	.byte =
		0x03,0x7D,0x01,0x00,0x05,0x02;
	.byte4 = .LN189;
	.byte =
		0x0D,0x00,0x05,0x02;
	.byte4 = .LN190;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN191;
	.byte =
		0x0D,0x00,0x05,0x02;
	.byte4 = .LN192;
	.byte =
		0x03,0x7C,0x01,0x00,0x05,0x02;
	.byte4 = .LN193;
	.byte =
		0x0D,0x00,0x05,0x02;
	.byte4 = .LN194;
	.byte =
		0x03,0x7D,0x01,0x00,0x05,0x02;
	.byte4 = .LN195;
	.byte =
		0x05,0x1E,0x0C,0x00,0x05,0x02;
	.byte4 = .LN196;
	.byte =
		0x05,0x02,0x01,0x00,0x05,0x02;
	.byte4 = .LN197;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN198;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN199;
	.byte =
		0x05,0x01,0x03,0x6D,0x01,0x00,0x05,0x02;
	.byte4 = .LN200;
	.byte =
		0x05,0x02,0x1D,0x00,0x05,0x02;
	.byte4 = .LN201;
	.byte =
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN202;
	.byte =
		0x03,0x7D,0x01,0x00,0x05,0x02;
	.byte4 = .LN203;
	.byte =
		0x0C,0x00,0x05,0x02;
	.byte4 = .LN204;
	.byte =
		0x03,0x7D,0x01,0x00,0x05,0x02;
	.byte4 = .LN205;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN206;
	.byte =
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN207;
	.byte =
		0x05,0x1A,0x01,0x00,0x05,0x02;
	.byte4 = .LN208;
	.byte =
		0x05,0x02,0x01,0x00,0x05,0x02;
	.byte4 = .LN209;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN210;
	.byte =
		0x05,0x01,0x03,0x69,0x01,0x00,0x05,0x02;
	.byte4 = .LN211;
	.byte =
		0x05,0x03,0x22,0x00,0x05,0x02;
	.byte4 = .LN212;
	.byte =
		0x05,0x02,0x03,0x7E,0x01,0x00,0x05,0x02;
	.byte4 = .LN213;
	.byte =
		0x05,0x03,0x0A,0x00,0x05,0x02;
	.byte4 = .LN214;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN215;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN216;
	.byte =
		0x05,0x1B,0x01,0x00,0x05,0x02;
	.byte4 = .LN217;
	.byte =
		0x05,0x03,0x01,0x00,0x05,0x02;
	.byte4 = .LN218;
	.byte =
		0x05,0x02,0x03,0x7D,0x01,0x00,0x05,0x02;
	.byte4 = .LN219;
	.byte =
		0x10,0x00,0x05,0x02;
	.byte4 = .LN220;
	.byte =
		0x03,0x79,0x01,0x00,0x05,0x02;
	.byte4 = .LN221;
	.byte =
		0x05,0x03,0x0A,0x00,0x05,0x02;
	.byte4 = .LN222;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN223;
	.byte =
		0x05,0x02,0x03,0x7E,0x01,0x00,0x05,0x02;
	.byte4 = .LN224;
	.byte =
		0x05,0x1B,0x03,0x7B,0x01,0x00,0x05,0x02;
	.byte4 = .LN225;
	.byte =
		0x05,0x16,0x03,0x7A,0x01,0x00,0x05,0x02;
	.byte4 = .LN226;
	.byte =
		0x05,0x11,0x03,0x7A,0x01,0x00,0x05,0x02;
	.byte4 = .LN._f3tensor.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_free_vector;
	.byte =
		0x04,0x01,0x05,0x01,0xE4,0x00,0x05,0x02;
	.byte4 = .LN227;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN228;
	.byte =
		0x05,0x01,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN229;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN230;
	.byte =
		0x05,0x06,0x01,0x00,0x05,0x02;
	.byte4 = .LN231;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.byte4 = .LN._free_vector.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_free_ivector;
	.byte =
		0x04,0x01,0x05,0x01,0xEA,0x00,0x05,0x02;
	.byte4 = .LN232;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN233;
	.byte =
		0x05,0x01,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN234;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN235;
	.byte =
		0x05,0x06,0x01,0x00,0x05,0x02;
	.byte4 = .LN236;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.byte4 = .LN._free_ivector.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_free_cvector;
	.byte =
		0x04,0x01,0x05,0x01,0xF0,0x00,0x05,0x02;
	.byte4 = .LN237;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN238;
	.byte =
		0x05,0x01,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN239;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN240;
	.byte =
		0x05,0x06,0x01,0x00,0x05,0x02;
	.byte4 = .LN241;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.byte4 = .LN._free_cvector.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_free_lvector;
	.byte =
		0x04,0x01,0x05,0x01,0xF6,0x00,0x05,0x02;
	.byte4 = .LN242;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN243;
	.byte =
		0x05,0x01,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN244;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN245;
	.byte =
		0x05,0x06,0x01,0x00,0x05,0x02;
	.byte4 = .LN246;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.byte4 = .LN._free_lvector.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_free_dvector;
	.byte =
		0x04,0x01,0x05,0x01,0xFC,0x00,0x05,0x02;
	.byte4 = .LN247;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN248;
	.byte =
		0x05,0x01,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN249;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN250;
	.byte =
		0x05,0x06,0x01,0x00,0x05,0x02;
	.byte4 = .LN251;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.byte4 = .LN._free_dvector.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_free_matrix;
	.byte =
		0x04,0x01,0x05,0x01,0x03,0xF9,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN252;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN253;
	.byte =
		0x05,0x01,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN254;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN255;
	.byte =
		0x05,0x01,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN256;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN257;
	.byte =
		0x05,0x06,0x01,0x00,0x05,0x02;
	.byte4 = .LN258;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN259;
	.byte =
		0x05,0x06,0x01,0x00,0x05,0x02;
	.byte4 = .LN260;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.byte4 = .LN._free_matrix.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_free_dmatrix;
	.byte =
		0x04,0x01,0x05,0x01,0x03,0x80,0x02,0x01,0x00,0x05,0x02;
	.byte4 = .LN261;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN262;
	.byte =
		0x05,0x01,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN263;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN264;
	.byte =
		0x05,0x01,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN265;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN266;
	.byte =
		0x05,0x06,0x01,0x00,0x05,0x02;
	.byte4 = .LN267;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN268;
	.byte =
		0x05,0x06,0x01,0x00,0x05,0x02;
	.byte4 = .LN269;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.byte4 = .LN._free_dmatrix.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_free_imatrix;
	.byte =
		0x04,0x01,0x05,0x01,0x03,0x87,0x02,0x01,0x00,0x05,0x02;
	.byte4 = .LN270;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN271;
	.byte =
		0x05,0x01,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN272;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN273;
	.byte =
		0x05,0x01,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN274;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN275;
	.byte =
		0x05,0x06,0x01,0x00,0x05,0x02;
	.byte4 = .LN276;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN277;
	.byte =
		0x05,0x06,0x01,0x00,0x05,0x02;
	.byte4 = .LN278;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.byte4 = .LN._free_imatrix.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_free_submatrix;
	.byte =
		0x04,0x01,0x05,0x01,0x03,0x8E,0x02,0x01,0x00,0x05,0x02;
	.byte4 = .LN279;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN280;
	.byte =
		0x05,0x01,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN281;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN282;
	.byte =
		0x05,0x06,0x01,0x00,0x05,0x02;
	.byte4 = .LN283;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.byte4 = .LN._free_submatrix.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_free_convert_matrix;
	.byte =
		0x04,0x01,0x05,0x01,0x03,0x94,0x02,0x01,0x00,0x05,0x02;
	.byte4 = .LN284;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN285;
	.byte =
		0x05,0x01,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN286;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN287;
	.byte =
		0x05,0x06,0x01,0x00,0x05,0x02;
	.byte4 = .LN288;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.byte4 = .LN._free_convert_matrix.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_free_f3tensor;
	.byte =
		0x04,0x01,0x05,0x01,0x03,0x9B,0x02,0x01,0x00,0x05,0x02;
	.byte4 = .LN289;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN290;
	.byte =
		0x05,0x01,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN291;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN292;
	.byte =
		0x05,0x01,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN293;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN294;
	.byte =
		0x05,0x06,0x01,0x00,0x05,0x02;
	.byte4 = .LN295;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN296;
	.byte =
		0x05,0x06,0x01,0x00,0x05,0x02;
	.byte4 = .LN297;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN298;
	.byte =
		0x05,0x06,0x01,0x00,0x05,0x02;
	.byte4 = .LN299;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.byte4 = .LN._free_f3tensor.end;
	.byte =
		0x00,0x01,0x01;
.epcline.end:

	.section .annotations SHT_DEBUGINFO;

	.align 1;
.epcannot:
	.type .epcannot,STT_OBJECT;
	.inc/binary "..\Debug\nrutil.sbn", 2333, 12080;
.epcannot.end:

	.section .debug_pubnames SHT_DEBUGINFO;

	.align 1;
.epcpubnames:
	.type .epcpubnames,STT_OBJECT;
	.byte =
		0x69,0x01,0x00,0x00,0x02,0x00;
	.byte4 = .epcdebug;
	.inc/binary "..\Debug\nrutil.sbn", 14413, 355;
.epcpubnames.end:

	.section .debug_aranges SHT_DEBUGINFO;

	.align 1;
.epcaranges:
	.type .epcaranges,STT_OBJECT;
	.byte =
		0xCC,0x00,0x00,0x00,0x02,0x00;
	.byte4 = .epcdebug;
	.byte =
		0x04,0x00,0x00,0x00,0x00,0x00;
	.byte4 = .LN_nrerror;
	.byte4 = .LN._nrerror.end-.LN_nrerror;
	.byte4 = .LN_vector;
	.byte4 = .LN._vector.end-.LN_vector;
	.byte4 = .LN_ivector;
	.byte4 = .LN._ivector.end-.LN_ivector;
	.byte4 = .LN_cvector;
	.byte4 = .LN._cvector.end-.LN_cvector;
	.byte4 = .LN_lvector;
	.byte4 = .LN._lvector.end-.LN_lvector;
	.byte4 = .LN_dvector;
	.byte4 = .LN._dvector.end-.LN_dvector;
	.byte4 = .LN_matrix;
	.byte4 = .LN._matrix.end-.LN_matrix;
	.byte4 = .LN_dmatrix;
	.byte4 = .LN._dmatrix.end-.LN_dmatrix;
	.byte4 = .LN_imatrix;
	.byte4 = .LN._imatrix.end-.LN_imatrix;
	.byte4 = .LN_submatrix;
	.byte4 = .LN._submatrix.end-.LN_submatrix;
	.byte4 = .LN_convert_matrix;
	.byte4 = .LN._convert_matrix.end-.LN_convert_matrix;
	.byte4 = .LN_f3tensor;
	.byte4 = .LN._f3tensor.end-.LN_f3tensor;
	.byte4 = .LN_free_vector;
	.byte4 = .LN._free_vector.end-.LN_free_vector;
	.byte4 = .LN_free_ivector;
	.byte4 = .LN._free_ivector.end-.LN_free_ivector;
	.byte4 = .LN_free_cvector;
	.byte4 = .LN._free_cvector.end-.LN_free_cvector;
	.byte4 = .LN_free_lvector;
	.byte4 = .LN._free_lvector.end-.LN_free_lvector;
	.byte4 = .LN_free_dvector;
	.byte4 = .LN._free_dvector.end-.LN_free_dvector;
	.byte4 = .LN_free_matrix;
	.byte4 = .LN._free_matrix.end-.LN_free_matrix;
	.byte4 = .LN_free_dmatrix;
	.byte4 = .LN._free_dmatrix.end-.LN_free_dmatrix;
	.byte4 = .LN_free_imatrix;
	.byte4 = .LN._free_imatrix.end-.LN_free_imatrix;
	.byte4 = .LN_free_submatrix;
	.byte4 = .LN._free_submatrix.end-.LN_free_submatrix;
	.byte4 = .LN_free_convert_matrix;
	.byte4 = .LN._free_convert_matrix.end-.LN_free_convert_matrix;
	.byte4 = .LN_free_f3tensor;
	.byte4 = .LN._free_f3tensor.end-.LN_free_f3tensor;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00;
.epcaranges.end:

	.section/DOUBLE32 constdata;

	.align 4;
.sNumeri.0:
	.type .sNumeri.0,STT_OBJECT;
	.byte =
		0x4E,0x75,0x6D,0x65,0x72,0x69,0x63,0x61,0x6C,0x20,0x52,0x65,
		0x63,0x69,0x70,0x65,0x73,0x20,0x72,0x75,0x6E,0x2D,0x74,0x69,
		0x6D,0x65,0x20,0x65,0x72,0x72,0x6F,0x72,0x2E,0x2E,0x2E,0x0A,
		0x00;
.sNumeri.0.end:
	.align 4;
.snowexi.2:
	.type .snowexi.2,STT_OBJECT;
	.byte =
		0x2E,0x2E,0x2E,0x6E,0x6F,0x77,0x20,0x65,0x78,0x69,0x74,0x69,
		0x6E,0x67,0x20,0x74,0x6F,0x20,0x73,0x79,0x73,0x74,0x65,0x6D,
		0x2E,0x2E,0x2E,0x0A,0x00;
.snowexi.2.end:
	.align 4;
.salloca.3:
	.type .salloca.3,STT_OBJECT;
	.byte =
		0x61,0x6C,0x6C,0x6F,0x63,0x61,0x74,0x69,0x6F,0x6E,0x20,0x66,
		0x61,0x69,0x6C,0x75,0x72,0x65,0x20,0x69,0x6E,0x20,0x76,0x65,
		0x63,0x74,0x6F,0x72,0x28,0x29,0x00;
.salloca.3.end:
	.align 4;
.salloca.4:
	.type .salloca.4,STT_OBJECT;
	.byte =
		0x61,0x6C,0x6C,0x6F,0x63,0x61,0x74,0x69,0x6F,0x6E,0x20,0x66,
		0x61,0x69,0x6C,0x75,0x72,0x65,0x20,0x69,0x6E,0x20,0x69,0x76,
		0x65,0x63,0x74,0x6F,0x72,0x28,0x29,0x00;
.salloca.4.end:
	.align 4;
.salloca.5:
	.type .salloca.5,STT_OBJECT;
	.byte =
		0x61,0x6C,0x6C,0x6F,0x63,0x61,0x74,0x69,0x6F,0x6E,0x20,0x66,
		0x61,0x69,0x6C,0x75,0x72,0x65,0x20,0x69,0x6E,0x20,0x63,0x76,
		0x65,0x63,0x74,0x6F,0x72,0x28,0x29,0x00;
.salloca.5.end:
	.align 4;
.salloca.6:
	.type .salloca.6,STT_OBJECT;
	.byte =
		0x61,0x6C,0x6C,0x6F,0x63,0x61,0x74,0x69,0x6F,0x6E,0x20,0x66,
		0x61,0x69,0x6C,0x75,0x72,0x65,0x20,0x69,0x6E,0x20,0x6C,0x76,
		0x65,0x63,0x74,0x6F,0x72,0x28,0x29,0x00;
.salloca.6.end:
	.align 4;
.salloca.7:
	.type .salloca.7,STT_OBJECT;
	.byte =
		0x61,0x6C,0x6C,0x6F,0x63,0x61,0x74,0x69,0x6F,0x6E,0x20,0x66,
		0x61,0x69,0x6C,0x75,0x72,0x65,0x20,0x69,0x6E,0x20,0x64,0x76,
		0x65,0x63,0x74,0x6F,0x72,0x28,0x29,0x00;
.salloca.7.end:
	.align 4;
.salloca.8:
	.type .salloca.8,STT_OBJECT;
	.byte =
		0x61,0x6C,0x6C,0x6F,0x63,0x61,0x74,0x69,0x6F,0x6E,0x20,0x66,
		0x61,0x69,0x6C,0x75,0x72,0x65,0x20,0x31,0x20,0x69,0x6E,0x20,
		0x6D,0x61,0x74,0x72,0x69,0x78,0x28,0x29,0x00;
.salloca.8.end:
	.align 4;
.salloca.9:
	.type .salloca.9,STT_OBJECT;
	.byte =
		0x61,0x6C,0x6C,0x6F,0x63,0x61,0x74,0x69,0x6F,0x6E,0x20,0x66,
		0x61,0x69,0x6C,0x75,0x72,0x65,0x20,0x32,0x20,0x69,0x6E,0x20,
		0x6D,0x61,0x74,0x72,0x69,0x78,0x28,0x29,0x00;
.salloca.9.end:
	.align 4;
.salloca.10:
	.type .salloca.10,STT_OBJECT;
	.byte =
		0x61,0x6C,0x6C,0x6F,0x63,0x61,0x74,0x69,0x6F,0x6E,0x20,0x66,
		0x61,0x69,0x6C,0x75,0x72,0x65,0x20,0x69,0x6E,0x20,0x73,0x75,
		0x62,0x6D,0x61,0x74,0x72,0x69,0x78,0x28,0x29,0x00;
.salloca.10.end:
	.align 4;
.salloca.11:
	.type .salloca.11,STT_OBJECT;
	.byte =
		0x61,0x6C,0x6C,0x6F,0x63,0x61,0x74,0x69,0x6F,0x6E,0x20,0x66,
		0x61,0x69,0x6C,0x75,0x72,0x65,0x20,0x69,0x6E,0x20,0x63,0x6F,
		0x6E,0x76,0x65,0x72,0x74,0x5F,0x6D,0x61,0x74,0x72,0x69,0x78,
		0x28,0x29,0x00;
.salloca.11.end:
	.align 4;
.salloca.12:
	.type .salloca.12,STT_OBJECT;
	.byte =
		0x61,0x6C,0x6C,0x6F,0x63,0x61,0x74,0x69,0x6F,0x6E,0x20,0x66,
		0x61,0x69,0x6C,0x75,0x72,0x65,0x20,0x31,0x20,0x69,0x6E,0x20,
		0x66,0x33,0x74,0x65,0x6E,0x73,0x6F,0x72,0x28,0x29,0x00;
.salloca.12.end:
	.align 4;
.salloca.13:
	.type .salloca.13,STT_OBJECT;
	.byte =
		0x61,0x6C,0x6C,0x6F,0x63,0x61,0x74,0x69,0x6F,0x6E,0x20,0x66,
		0x61,0x69,0x6C,0x75,0x72,0x65,0x20,0x32,0x20,0x69,0x6E,0x20,
		0x66,0x33,0x74,0x65,0x6E,0x73,0x6F,0x72,0x28,0x29,0x00;
.salloca.13.end:
	.align 4;
.salloca.14:
	.type .salloca.14,STT_OBJECT;
	.byte =
		0x61,0x6C,0x6C,0x6F,0x63,0x61,0x74,0x69,0x6F,0x6E,0x20,0x66,
		0x61,0x69,0x6C,0x75,0x72,0x65,0x20,0x33,0x20,0x69,0x6E,0x20,
		0x66,0x33,0x74,0x65,0x6E,0x73,0x6F,0x72,0x28,0x29,0x00;
.salloca.14.end:

	.section/DOUBLE32 data1;


	.extern __Stderr;
	.type __Stderr,STT_OBJECT;
