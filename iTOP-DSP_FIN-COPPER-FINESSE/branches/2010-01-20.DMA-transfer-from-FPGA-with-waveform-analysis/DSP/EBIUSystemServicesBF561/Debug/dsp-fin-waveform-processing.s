	.file "..\..\src\dsp-fin-waveform-processing.c";
//  Compilation time: Wed Jan 20 22:50:32 2010

//  Compiler options: -c -file-attr ProjectName=CoreA -O -Ov100 -g -save-temps -path-output ..\Debug -structs-do-not-overlap -no-multiline -double-size-32 -decls-strong -warn-protos -proc ADSP-BF561 -o ..\Debug\dsp-fin-waveform-processing.doj -MM
//  Architecture: ADSP-BF561
//  Silicon revision: 0.5
//  Anomalies summary:
//   Disabled: w05_00_0046,w05_00_0048,w05_00_0054,w05_00_0071,w05_00_0103,w05_00_0104,w05_00_0157,w05_00_0164,w05_00_0165,w05_00_0195,w05_00_0198,w05_00_0202,w05_00_0209,w05_00_0227,w05_00_0244,w05_00_0245,w05_00_0246,w05_00_0248,w05_00_0257,w05_00_0262,w05_00_0264,w05_00_0283,wF3_F_021,wF3_F_008_F3_F_013,w05_00_0311
//   Enabled: w05_00_0120,w05_00_0127,w05_00_0189,w05_00_0312
//   Always on: w05_00_0074,w05_00_0122

	.section/DOUBLE32 program;

.epctext:
	.align 2;
_show_a_waveform:
.LN_show_a_waveform:
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,ASTAT0-ASTAT1,CC,LC0,LT0,LB0}
//   Call preserved registers used:{P4-P5,FP,SP,RETS}
//-------------------------------------------------------------------
	P1 = R0;
// line "..\..\src\dsp-fin-waveform-processing.c":246
	LINK 0;
	[--SP] = (P5:4);
	R3 = -2;
.LN0:
// line 248
	P2 = 1796 /* -4192508 */;
	P2.H = -64 /* -4192508 */;
.LN1:
// line 249
	P4 = 64;
.LN2:
// line 248
	W[P2] = R3.L;
	P0 = P1;
	R2 = -32768;
	R1 = 1;
.LN3:
// line 251
	P5 = 1800 /* -4192504 */;
	P5.H = -64 /* -4192504 */;
.LN4:
// line 249
	LOOP .P36L2L LC0 = P4;

.P36L2:
//-------------------------------------------------------------------
//   Loop at "..\..\src\dsp-fin-waveform-processing.c" line 249 col 2
//-------------------------------------------------------------------
//   This loop executes 1 iteration of the original loop in estimated 6 cycles.
//-------------------------------------------------------------------
//   This loop's resource usage is:
//     Group 1             used   6 out of    6 (100.0%)
//     16-bit Instruction  used   8 out of   12 ( 66.7%)
//     Store               used   3 out of    6 ( 50.0%)
//     32-bit Instruction  used   2 out of    6 ( 33.3%)
//-------------------------------------------------------------------
// This loop was not modulo scheduled because it contains calls or volatile operations.
//-------------------------------------------------------------------
	LOOP_BEGIN .P36L2L;
.LN5:
// line 251
	R0 = W[P0++] (Z);
	CC = R0 == 0;
	IF !CC R0 = R1;
	W[P5] = R0.L;                           // Use of volatile in loops precludes optimizations. 
.LN6:
// line 252
	W[P5] = R2.L;                           // Use of volatile in loops precludes optimizations. 
.LN7:
// line 253
	W[P2] = R3.L;                           // Use of volatile in loops precludes optimizations. 
.LN8:
// line 249
	LOOP_END .P36L2L;

.P36L21:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------
.LN9:
// line 255
	W[P2] = R3.L;
	R2 = 16384;
	P0 = 128;
	P1 = P1 + P0;
.LN10:
// line 256
	LOOP .P36L9L LC0 = P4;

.P36L9:
//-------------------------------------------------------------------
//   Loop at "..\..\src\dsp-fin-waveform-processing.c" line 256 col 2
//-------------------------------------------------------------------
//   This loop executes 1 iteration of the original loop in estimated 6 cycles.
//-------------------------------------------------------------------
//   This loop's resource usage is:
//     Group 1             used   6 out of    6 (100.0%)
//     16-bit Instruction  used   8 out of   12 ( 66.7%)
//     Store               used   3 out of    6 ( 50.0%)
//     32-bit Instruction  used   2 out of    6 ( 33.3%)
//-------------------------------------------------------------------
// This loop was not modulo scheduled because it contains calls or volatile operations.
//-------------------------------------------------------------------
	LOOP_BEGIN .P36L9L;
.LN11:
// line 258
	R0 = W[P1++] (Z);
	CC = R0 == 0;
	IF !CC R0 = R1;
	W[P5] = R0.L;                           // Use of volatile in loops precludes optimizations. 
.LN12:
// line 259
	W[P5] = R2.L;                           // Use of volatile in loops precludes optimizations. 
.LN13:
// line 260
	W[P2] = R3.L;                           // Use of volatile in loops precludes optimizations. 
.LN14:
// line 256
	LOOP_END .P36L9L;

.P36L22:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------
.LN15:
// line 262
	P0 = [FP + 4];
	(P5:4) = [SP++];
	UNLINK;
	// -- stall --
	JUMP (P0);
.LN._show_a_waveform.end:
._show_a_waveform.end:
	.global _show_a_waveform;
	.type _show_a_waveform,STT_FUNC;

	.align 4;
_setup_dma_unidirectional_burst_lengths:
.LN_setup_dma_unidirectional_burst_lengths:
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,R0.H,P0-P1}
//   Call preserved registers used:{FP,SP,RETS}
//-------------------------------------------------------------------
// line "..\..\src\dsp-fin-waveform-processing.c":231
	LINK 0;
	.align 2
	R0 = -1;
.LN16:
// line 236
	P1 = 6924 /* -4187380 */;
	P1.H = -64 /* -4187380 */;
	W[P1] = R0.L;
.LN17:
// line 242
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);
.LN._setup_dma_unidirectional_burst_lengths.end:
._setup_dma_unidirectional_burst_lengths.end:
	.global _setup_dma_unidirectional_burst_lengths;
	.type _setup_dma_unidirectional_burst_lengths,STT_FUNC;

	.align 4;
_predicate_changes_to_state_machine_for_waveform_transfer_from_fpga:
.LN_predicate_changes_to_state_machine_for_waveform_transfer_from_fpga:
	.reference _waveform_transfers_from_fpga_are_desired;
	.reference _waveform_transfers_from_fpga_are_allowed;
	.reference _number_of_unprocessed_waveforms;
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,R0.H,P0-P1,ASTAT0-ASTAT1,CC}
//   Call preserved registers used:{FP,SP,RETS}
//-------------------------------------------------------------------
// line "..\..\src\dsp-fin-waveform-processing.c":115
	LINK 0;
	.align 2
	P1.L = .epcbss;
	P1.H = .epcbss;
.LN18:
// line 117
	R0 = [P1 + 0];
	CC = R0 <= 3 (IU);
	if CC jump .P38L2 ;

.P38L1:
	R0 = 1;
.LN19:
// line 118
	P1 = 1796 /* -4192508 */;
	P1.H = -64 /* -4192508 */;
	W[P1] = R0.L;

.P38L3:
.LN20:
// line 126
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);

.P38L2:
.LN21:
// line 120
	R0 = W[P1 + 10] (Z);
	CC = R0 == 0;
	if CC jump .P38L5 ;

.P38L7:
	R0 = W[P1 + 8] (Z);
	CC = R0 == 0;
	if CC jump .P38L5 ;

.P38L4:
	R0 = 1;
.LN22:
// line 121
	P1 = 1800 /* -4192504 */;
	P1.H = -64 /* -4192504 */;
	W[P1] = R0.L;
	jump .P38L3;

.P38L5:
	R0 = 1;
.LN23:
// line 123
	P1 = 1796 /* -4192508 */;
	P1.H = -64 /* -4192508 */;
	W[P1] = R0.L;
	jump .P38L3;
.LN._predicate_changes_to_state_machine_for_waveform_transfer_from_fpga.end:
._predicate_changes_to_state_machine_for_waveform_transfer_from_fpga.end:
	.global _predicate_changes_to_state_machine_for_waveform_transfer_from_fpga;
	.type _predicate_changes_to_state_machine_for_waveform_transfer_from_fpga,STT_FUNC;

	.align 4;
_pulse_multiple:
.LN_pulse_multiple:
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,P0-P1}
//   Call preserved registers used:{FP,SP,RETS}
//-------------------------------------------------------------------
// line "..\..\src\dsp-fin-waveform-processing.c":103
	LINK 0;
	.align 2
.LN24:
// line 104
	P1 = 1800 /* -4192504 */;
	P1.H = -64 /* -4192504 */;
	W[P1] = R0.L;
.LN25:
// line 105
	P1 = 1796 /* -4192508 */;
	P1.H = -64 /* -4192508 */;
	W[P1] = R0.L;
.LN26:
// line 106
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);
.LN._pulse_multiple.end:
._pulse_multiple.end:
	.global _pulse_multiple;
	.type _pulse_multiple,STT_FUNC;

	.align 2;
_pulse:
.LN_pulse:
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,R1.L,R1.H,P0-P1,ASTAT0-ASTAT1}
//   Call preserved registers used:{FP,SP,RETS}
//-------------------------------------------------------------------
.LN27:
// line "..\..\src\dsp-fin-waveform-processing.c":99
	R1 = 1;
	R0.L = ASHIFT R1.L BY R0.L;
.LN28:
// line 98
	LINK 0;
.LN29:
// line 99
	P1 = 1800 /* -4192504 */;
	P1.H = -64 /* -4192504 */;
	W[P1] = R0.L;
.LN30:
// line 100
	P1 = 1796 /* -4192508 */;
	P1.H = -64 /* -4192508 */;
	W[P1] = R0.L;
.LN31:
// line 101
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);
.LN._pulse.end:
._pulse.end:
	.global _pulse;
	.type _pulse,STT_FUNC;

	.align 4;
_output_pulse_duty_cycle_proportional_to:
.LN_output_pulse_duty_cycle_proportional_to:
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,R0.H,R2.L,R2.H,R3.L,R3.H,P0-P1,ASTAT0-ASTAT1,CC,LC0,LT0,LB0}
//   Call preserved registers used:{FP,SP,RETS}
//-------------------------------------------------------------------
	R2 = ABS R2;
	.align 2
	CC = R1 < R2 (IU);                      // MIN operation could not be generated because of unsigned operands. 
.LN32:
// line "..\..\src\dsp-fin-waveform-processing.c":59
	R3 = 1;
	IF CC R2 = R1;
	R3.L = ASHIFT R3.L BY R0.L;
.LN33:
// line 51
	LINK 0;
.LN34:
// line 59
	P1 = 1800 /* -4192504 */;
	P1.H = -64 /* -4192504 */;
.LN35:
// line 60
	CC = R2 == 0;
.LN36:
// line 59
	R0 = R0 - R0 (NS) || W[P1] = R3.L;
.LN37:
// line 60
	if CC jump .P41L9 ;

.P41L20:
	P1 = R2;
	// -- 4 stalls --
	LOOP .P41L10L LC0 = P1;

.P41L10:
//-------------------------------------------------------------------
//   Loop at "..\..\src\dsp-fin-waveform-processing.c" line 60 col 2
//-------------------------------------------------------------------
	LOOP_BEGIN .P41L10L;
.LN38:
// line 61
	// ASM STATEMENT
	nop;
	// END ASM STATEMENT


	NOP;
.LN39:
// line 60
	LOOP_END .P41L10L;

.P41L23:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------
	R0 = R2;

.P41L9:
.LN40:
// line 64
	CC = R0 < R1 (IU);
.LN41:
// line 63
	P1 = 1796 /* -4192508 */;
	P1.H = -64 /* -4192508 */;
	W[P1] = R3.L;
.LN42:
// line 64
	if !CC jump .P41L14 ;

.P41L22:
	R0 = R1 - R0;
	P1 = R0;
	// -- 4 stalls --
	LOOP .P41L15L LC0 = P1;

.P41L15:
//-------------------------------------------------------------------
//   Loop at "..\..\src\dsp-fin-waveform-processing.c" line 64 col 2
//-------------------------------------------------------------------
	LOOP_BEGIN .P41L15L;
.LN43:
// line 65
	// ASM STATEMENT
	nop;
	// END ASM STATEMENT


	NOP;
.LN44:
// line 64
	LOOP_END .P41L15L;

.P41L24:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------

.P41L14:
.LN45:
// line 67
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);
.LN._output_pulse_duty_cycle_proportional_to.end:
._output_pulse_duty_cycle_proportional_to.end:
	.global _output_pulse_duty_cycle_proportional_to;
	.type _output_pulse_duty_cycle_proportional_to,STT_FUNC;

	.align 2;
_output_pulse_width_proportional_to:
.LN_output_pulse_width_proportional_to:
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,R1.L,R1.H,R2.L,R2.H,P0-P1,ASTAT0-ASTAT1,CC,LC0,LT0,LB0}
//   Call preserved registers used:{FP,SP,RETS}
//-------------------------------------------------------------------
.LN46:
// line "..\..\src\dsp-fin-waveform-processing.c":37
	CC = R1 <= 0;
.LN47:
// line 35
	LINK 0;
.LN48:
// line 37
	if !CC jump .P42L3 ;

.P42L2:
.LN49:
// line 39
	CC = R1 < 0;
	R2 = - R1;
	R1 = 0;
	IF CC R1 = R2;

.P42L3:
.LN50:
// line 42
	CC = R1 == 0;
	if CC jump .P42L9 ;

.P42L7:
.LN51:
// line 43
	R2 = 1;
	R0.L = ASHIFT R2.L BY R0.L;
	P1 = 1800 /* -4192504 */;
	P1.H = -64 /* -4192504 */;
	W[P1] = R0.L;

.LN52:
// line 44
	P1 = R1;
	// -- 4 stalls --
	LOOP .P42L13L LC0 = P1;

.P42L13:
//-------------------------------------------------------------------
//   Loop at "..\..\src\dsp-fin-waveform-processing.c" line 44 col 3
//-------------------------------------------------------------------
	LOOP_BEGIN .P42L13L;
.LN53:
// line 45
	// ASM STATEMENT
	nop;
	// END ASM STATEMENT


	NOP;
.LN54:
// line 44
	LOOP_END .P42L13L;

.P42L18:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------
.LN55:
// line 47
	P1 = 1796 /* -4192508 */;
	P1.H = -64 /* -4192508 */;
	W[P1] = R0.L;

.P42L9:
.LN56:
// line 49
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);
.LN._output_pulse_width_proportional_to.end:
._output_pulse_width_proportional_to.end:
	.global _output_pulse_width_proportional_to;
	.type _output_pulse_width_proportional_to,STT_FUNC;

	.align 4;
_finished_another_waveform_transfer_from_fpga:
.LN_finished_another_waveform_transfer_from_fpga:
	.reference _number_of_unprocessed_waveforms;
	.reference _predicate_changes_to_state_machine_for_waveform_transfer_from_fpga;
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 12 
//   Scratch registers used:{R0.L,R0.H,P0-P1,ASTAT0-ASTAT1}
//   Call preserved registers used:{FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,I0-I3,B0-B3,M0-M3,A0.W,A0.X,A1.W,A1.X,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
// line "..\..\src\dsp-fin-waveform-processing.c":69
	LINK 12;
	.align 2
	P1.L = .epcbss;
	P1.H = .epcbss;
.LN57:
// line 72
	R0 = [P1];
	R0 += 1;
	[P1] = R0;
.LN58:
// line 74
	CALL.X (_predicate_changes_to_state_machine_for_waveform_transfer_from_fpga);
.LN59:
// line 75
	CALL.X (_acknowledge_interrupt_for_completion_of_waveform_transfer_from_fpga);
.LN60:
// line 77
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);
.LN._finished_another_waveform_transfer_from_fpga.end:
._finished_another_waveform_transfer_from_fpga.end:
	.global _finished_another_waveform_transfer_from_fpga;
	.type _finished_another_waveform_transfer_from_fpga,STT_FUNC;

	.align 4;
_finished_getting_waveform_from_fpga_interrupt_service_routine:
.LN_finished_getting_waveform_from_fpga_interrupt_service_routine:
	.reference _finished_another_waveform_transfer_from_fpga;
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,I0-I3,B0-B3,M0-M3,A0.W,A0.X,A1.W,A1.X,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1}
//   Call preserved registers used:{FP,SP,L0-L3,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,I0-I3,B0-B3,M0-M3,A0.W,A0.X,A1.W,A1.X,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
// line "..\..\src\dsp-fin-waveform-processing.c":31
	LINK 0;
	.align 2
	[--SP] = ASTAT;
	[--SP] = R0;
	[--SP] = R1;
	[--SP] = R2;
	[--SP] = R3;
	[--SP] = P0;
	[--SP] = P1;
	[--SP] = P2;
	[--SP] = A0.W;
	[--SP] = A0.X;
	[--SP] = A1.W;
	[--SP] = A1.X;
	[--SP] = L0;
	[--SP] = L1;
	[--SP] = L2;
	[--SP] = L3;
	[--SP] = I0;
	[--SP] = I1;
	[--SP] = I2;
	[--SP] = I3;
	[--SP] = B0;
	[--SP] = B1;
	[--SP] = B2;
	[--SP] = B3;
	[--SP] = M0;
	[--SP] = M1;
	[--SP] = M2;
	[--SP] = M3;
	[--SP] = LC0;
	[--SP] = LC1;
	[--SP] = LT0;
	[--SP] = LT1;
	[--SP] = LB0;
	[--SP] = LB1;
	L0 = 0;
	L1 = 0;
	L2 = 0;
	L3 = 0;
	SP += -12;
.LN61:
// line 32
	CALL.X (_finished_another_waveform_transfer_from_fpga);
.LN62:
// line 33
	SP += 12;
	LB1 = [SP++];
	LB0 = [SP++];
	LT1 = [SP++];
	LT0 = [SP++];
	LC1 = [SP++];
	LC0 = [SP++];
	M3 = [SP++];
	M2 = [SP++];
	M1 = [SP++];
	M0 = [SP++];
	B3 = [SP++];
	B2 = [SP++];
	B1 = [SP++];
	B0 = [SP++];
	I3 = [SP++];
	I2 = [SP++];
	I1 = [SP++];
	I0 = [SP++];
	L3 = [SP++];
	L2 = [SP++];
	L1 = [SP++];
	L0 = [SP++];
	A1.X = [SP++];
	A1.W = [SP++];
	A0.X = [SP++];
	A0.W = [SP++];
	P2 = [SP++];
	P1 = [SP++];
	P0 = [SP++];
	R3 = [SP++];
	R2 = [SP++];
	R1 = [SP++];
	R0 = [SP++];
	ASTAT = [SP++];
	UNLINK;
	RTI;
.LN._finished_getting_waveform_from_fpga_interrupt_service_routine.end:
._finished_getting_waveform_from_fpga_interrupt_service_routine.end:
	.global _finished_getting_waveform_from_fpga_interrupt_service_routine;
	.type _finished_getting_waveform_from_fpga_interrupt_service_routine,STT_FUNC;

	.align 2;
_show_reason_for_aborting_analysis:
.LN_show_reason_for_aborting_analysis:
	.reference _pulse;
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 12 
//   Scratch registers used:{R0.L,R0.H,R2.L,R2.H,R3.L,R3.H,P0-P1,ASTAT0-ASTAT1,CC,LC0,LT0,LB0}
//   Call preserved registers used:{FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R1.L,R1.H,P0-P1,ASTAT0-ASTAT1,RETS}
//-------------------------------------------------------------------
// line "..\..\src\dsp-fin-waveform-processing.c":79
	R2 = R0;
	LINK 12;
.LN63:
// line 80
	R0 = 2;
	CALL.X (_pulse);
.LN64:
// line 81
	R0 = 3;
	CALL.X (_pulse);
.LN65:
// line 82
	R0 = 4;
	CALL.X (_pulse);
.LN66:
// line 83
	R0 = 5;
	CALL.X (_pulse);
.LN67:
// line 84
	R0 = 6;
	R3 = 6;
	CALL.X (_pulse);
.LN68:
// line 86
	CC = R3 < R2;
	P1 = 1;
	if !CC jump .P46L3 ;

.P46L1:
.LN69:
	R2 += -5;
	P1 = 2;

.P46L3:
.LN70:
// line 87
	R0 = R2.L (Z);
	CC = R3 < R0;
	if !CC jump .P46L6 ;

.P46L4:
.LN71:
	R2 += -5;
.LN72:
	P1 += 1;

.P46L6:
.LN73:
// line 88
	CC = P1 == 0;
	if CC jump .P46L9 ;

.P46L12:
.LN74:
// line 89
	R2 = R2.L (Z);
.LN75:
// line 88
	LOOP .P46L8L LC0 = P1;

.P46L8:
//-------------------------------------------------------------------
//   Loop at "..\..\src\dsp-fin-waveform-processing.c" line 88 col 2
//-------------------------------------------------------------------
//   This loop executes 1 iteration of the original loop in estimated 3 cycles.
//   (cycle count 3 excludes the cost of the inner function calls)
//-------------------------------------------------------------------
//   This loop's resource usage is:
//     16-bit Instruction  used   6 out of    6 (100.0%)
//     32-bit Instruction  used   3 out of    3 (100.0%)
//     Group 1             used   3 out of    3 (100.0%)
//-------------------------------------------------------------------
// This loop was not modulo scheduled because it contains calls or volatile operations.
//-------------------------------------------------------------------
	LOOP_BEGIN .P46L8L;
.LN76:
// line 89
	R0 = R2;
	CALL.X (_pulse);
	NOP;
.LN77:
// line 88
	LOOP_END .P46L8L;

.P46L13:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------

.P46L9:
.LN78:
// line 91
	R0 = 6;
	CALL.X (_pulse);
.LN79:
// line 92
	R0 = 5;
	CALL.X (_pulse);
.LN80:
// line 93
	R0 = 4;
	CALL.X (_pulse);
.LN81:
// line 94
	R0 = 3;
	CALL.X (_pulse);
.LN82:
// line 95
	R0 = 2;
	CALL.X (_pulse);
.LN83:
// line 96
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);
.LN._show_reason_for_aborting_analysis.end:
._show_reason_for_aborting_analysis.end:
	.global _show_reason_for_aborting_analysis;
	.type _show_reason_for_aborting_analysis,STT_FUNC;

	.align 4;
_show_number_of_unprocessed_waveforms:
.LN_show_number_of_unprocessed_waveforms:
	.reference _number_of_unprocessed_waveforms;
	.reference _pulse;
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 12 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,P0-P2,ASTAT0-ASTAT1,CC,LC0,LT0,LB0}
//   Call preserved registers used:{FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R1.L,R1.H,P0-P1,ASTAT0-ASTAT1,RETS}
//-------------------------------------------------------------------
// line "..\..\src\dsp-fin-waveform-processing.c":108
	LINK 12;
	.align 2
	P2.L = .epcbss;
	P2.H = .epcbss;
.LN84:
// line 110
	R0 = [P2];
	CC = R0 == 0;
	if CC jump .P47L3 ;

.P47L6:
	R2 = 1;

.P47L10:
//-------------------------------------------------------------------
//   Loop at "..\..\src\dsp-fin-waveform-processing.c" line 110 col 2 (infinite hardware loop wrapper) 
//-------------------------------------------------------------------
	P1 = -1;
	LOOP .P47L2L LC0 = P1;

.P47L2:
//-------------------------------------------------------------------
//   Loop at "..\..\src\dsp-fin-waveform-processing.c" line 110 col 2
//-------------------------------------------------------------------
//   This loop executes 1 iteration of the original loop in estimated 7 cycles.
//   (cycle count 7 excludes the cost of the inner function calls)
//-------------------------------------------------------------------
//   This loop's resource usage is:
//     Group 1             used   7 out of    7 (100.0%)
//     16-bit Instruction  used  13 out of   14 ( 92.9%)
//     32-bit Instruction  used   6 out of    7 ( 85.7%)
//-------------------------------------------------------------------
	LOOP_BEGIN .P47L2L;
.LN85:
// line 111
	R0 = 6;
	CALL.X (_pulse);
.LN86:
// line 110
	R0 = [P2];
	R1 = R2.L (Z);
	CC = R1 < R0 (IU);
	R2 += 1;
	if !CC jump .P47L3 ;

.P47L9:
	LOOP_END .P47L2L;

.P47L11:
//-------------------------------------------------------------------
//   Part of Loop 10, depth 1
//-------------------------------------------------------------------
	jump .P47L10;

.P47L3:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------
.LN87:
// line 113
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);
.LN._show_number_of_unprocessed_waveforms.end:
._show_number_of_unprocessed_waveforms.end:
	.global _show_number_of_unprocessed_waveforms;
	.type _show_number_of_unprocessed_waveforms,STT_FUNC;

	.align 4;
_finished_processing_another_waveform:
.LN_finished_processing_another_waveform:
	.reference _number_of_unprocessed_waveforms;
	.reference _predicate_changes_to_state_machine_for_waveform_transfer_from_fpga;
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 12 
//   Scratch registers used:{R0.L,R0.H,P0-P1,ASTAT0-ASTAT1}
//   Call preserved registers used:{FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,P0-P1,ASTAT0-ASTAT1,CC,RETS}
//-------------------------------------------------------------------
// line "..\..\src\dsp-fin-waveform-processing.c":128
	LINK 12;
	.align 2
	P1.L = .epcbss;
	P1.H = .epcbss;
.LN88:
// line 129
	R0 = [P1];
	R0 += -1;
	[P1] = R0;
.LN89:
// line 131
	CALL.X (_predicate_changes_to_state_machine_for_waveform_transfer_from_fpga);
.LN90:
// line 132
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);
.LN._finished_processing_another_waveform.end:
._finished_processing_another_waveform.end:
	.global _finished_processing_another_waveform;
	.type _finished_processing_another_waveform,STT_FUNC;

	.align 4;
_enable_waveform_transfers_from_fpga:
.LN_enable_waveform_transfers_from_fpga:
	.reference _waveform_transfers_from_fpga_are_desired;
	.reference _predicate_changes_to_state_machine_for_waveform_transfer_from_fpga;
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 12 
//   Scratch registers used:{R0.L,R0.H,P0-P1}
//   Call preserved registers used:{FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,P0-P1,ASTAT0-ASTAT1,CC,RETS}
//-------------------------------------------------------------------
// line "..\..\src\dsp-fin-waveform-processing.c":134
	LINK 12;
	.align 2
	P1.L = .epcbss+10;
	P1.H = .epcbss+10;
.LN91:
// line 137
	R0 = 1;
	W[P1] = R0.L;
.LN92:
// line 138
	CALL.X (_predicate_changes_to_state_machine_for_waveform_transfer_from_fpga);
.LN93:
// line 139
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);
.LN._enable_waveform_transfers_from_fpga.end:
._enable_waveform_transfers_from_fpga.end:
	.global _enable_waveform_transfers_from_fpga;
	.type _enable_waveform_transfers_from_fpga,STT_FUNC;

	.align 4;
_disable_waveform_transfers_from_fpga:
.LN_disable_waveform_transfers_from_fpga:
	.reference _waveform_transfers_from_fpga_are_desired;
	.reference _predicate_changes_to_state_machine_for_waveform_transfer_from_fpga;
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 12 
//   Scratch registers used:{R0.L,P0-P1}
//   Call preserved registers used:{FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,P0-P1,ASTAT0-ASTAT1,CC,RETS}
//-------------------------------------------------------------------
// line "..\..\src\dsp-fin-waveform-processing.c":141
	LINK 12;
	.align 2
.LN94:
// line 142
	R0.L = 0;
	P1.L = .epcbss+10;
	P1.H = .epcbss+10;
	W[P1] = R0.L;
.LN95:
// line 143
	CALL.X (_predicate_changes_to_state_machine_for_waveform_transfer_from_fpga);
.LN96:
// line 145
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);
.LN._disable_waveform_transfers_from_fpga.end:
._disable_waveform_transfers_from_fpga.end:
	.global _disable_waveform_transfers_from_fpga;
	.type _disable_waveform_transfers_from_fpga,STT_FUNC;

	.align 4;
_start_transfering_the_next_unprocessed_waveform_from_sdram_to_l1:
.LN_start_transfering_the_next_unprocessed_waveform_from_sdram_to_l1:
	.reference _index_of_next_waveform_to_process;
	.reference _number_of_l1_waveforms_that_are_currently_being_transferred;
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 16 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,P0-P1,ASTAT0-ASTAT1,CC}
//   Call preserved registers used:{P5,FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,I0-I3,B0-B3,M0-M3,A0.W,A0.X,A1.W,A1.X,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
// line "..\..\src\dsp-fin-waveform-processing.c":147
	LINK 16;
	.align 2
	[SP + 12] = P5;
	P5.L = .epcbss+4;
	P5.H = .epcbss+4;
.LN97:
// line 148
	R2 = [P5];
	R1 = R2;
	R2 += 1;
	[P5] = R2;
.LN98:
	CALL.X (_setup_single_waveform_dma_transfer_from_l3_buffer_to_l1_buffer);
.LN99:
// line 149
	R0 = [P5];
	CC = R0 < 4 (IU);
	if CC jump .P51L3 ;

.P51L1:
.LN100:
// line 150
	R0 = 0;
	[P5] = R0;

.P51L3:
.LN101:
// line 152
	CALL.X (_initiate_dma_transfer_from_l3_buffer_to_l1_buffer);
	P1.L = .epcdata;
	P1.H = .epcdata;
.LN102:
// line 153
	R0.L = W[P1];
	R0 += 1;
	W[P1] = R0.L;
.LN103:
// line 154
	P0 = [FP + 4];
	P5 = [SP + 12];
	UNLINK;
	// -- stall --
	JUMP (P0);
.LN._start_transfering_the_next_unprocessed_waveform_from_sdram_to_l1.end:
._start_transfering_the_next_unprocessed_waveform_from_sdram_to_l1.end:
	.global _start_transfering_the_next_unprocessed_waveform_from_sdram_to_l1;
	.type _start_transfering_the_next_unprocessed_waveform_from_sdram_to_l1,STT_FUNC;

	.align 4;
_wait_for_the_end_of_the_current_transfer_of_a_waveform_from_sdram_to_l1:
.LN_wait_for_the_end_of_the_current_transfer_of_a_waveform_from_sdram_to_l1:
	.reference _number_of_l1_waveforms_that_are_currently_being_transferred;
	.reference _number_of_l1_waveforms_that_have_new_data;
	.reference _finished_processing_another_waveform;
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 12 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,P0-P1,ASTAT0-ASTAT1}
//   Call preserved registers used:{FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,I0-I3,B0-B3,M0-M3,A0.W,A0.X,A1.W,A1.X,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
// line "..\..\src\dsp-fin-waveform-processing.c":156
	LINK 12;
	.align 2
.LN104:
// line 157
	CALL.X (_wait_until_mdma1_stream0_is_paused_or_stopped);
	P1.L = .epcdata;
	P1.H = .epcdata;
.LN105:
// line 158
	R0.L = W[P1];
	R1 = -1;
	R0 = R0 + R1;
	W[P1++] = R0;
.LN106:
// line 159
	R0.L = W[P1];
	R1 = 1;
	R0 = R0 + R1;
	W[P1] = R0.L;
.LN107:
// line 160
	CALL.X (_finished_processing_another_waveform);
.LN108:
// line 161
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);
.LN._wait_for_the_end_of_the_current_transfer_of_a_waveform_from_sdram_to_l1.end:
._wait_for_the_end_of_the_current_transfer_of_a_waveform_from_sdram_to_l1.end:
	.global _wait_for_the_end_of_the_current_transfer_of_a_waveform_from_sdram_to_l1;
	.type _wait_for_the_end_of_the_current_transfer_of_a_waveform_from_sdram_to_l1,STT_FUNC;

	.align 4;
_process_another_waveform:
.LN_process_another_waveform:
	.reference _which_waveform.0;
	.reference _number_of_l1_waveforms_that_have_new_data;
	.reference _number_of_l1_waveforms_that_are_currently_being_transferred;
	.reference _number_of_unprocessed_waveforms;
	.reference _start_transfering_the_next_unprocessed_waveform_from_sdram_to_l1;
	.reference _wait_for_the_end_of_the_current_transfer_of_a_waveform_from_sdram_to_l1;
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,P0-P1,ASTAT0-ASTAT1,CC}
//   Call preserved registers used:{R7.L,R7.H,P4-P5,FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,I0-I3,B0-B3,M0-M3,A0.W,A0.X,A1.W,A1.X,ASTAT0-ASTAT1,CC,AQ,LC0-LC1,LT0-LT1,LB0-LB1,RETS,SEQSTAT,SYSCFG,USP}
//-------------------------------------------------------------------
// line "..\..\src\dsp-fin-waveform-processing.c":163
	LINK 0;
	.align 2
	[--SP] = (R7:7, P5:4);
	SP += -12;
	P5.L = .epcdata;
	P5.H = .epcdata;
.LN109:
// line 176
	R0 = W[P5 + 0] (Z);
	P4.L = .process_another_waveform.statics;
	P4.H = .process_another_waveform.statics;
	CC = R0 == 0;
.LN110:
// line 166
	R7 = B[P4] (Z);
.LN111:
// line 176
	if !CC jump .P57L1 ;

.P57L3:
	P1.L = .epcbss;
	P1.H = .epcbss;
.LN112:
// line 196
	R0 = [P1];
	CC = R0 == 0;
	if !CC jump .P57L7 ;

.P57L9:
.LN113:
// line 200
	R0 = W[P5 + 2] (Z);
	CC = R0 == 0;
	if CC jump .P57L12 ;

.P57L10:
	P5 += 2;
.LN114:
// line 203
	R0 = B[P4] (Z);
	R1 = 97;
	CC = R0 == R1;
	R1.L = _waveform_a;
	R1.H = _waveform_a;
	R0.L = _waveform_b;
	R0.H = _waveform_b;
	IF CC R0 = R1;
.LN115:
// line 204
	CALL.X (_process_waveform);
.LN116:
// line 210
	B[P4] = R7;
.LN117:
// line 209
	R0.L = W[P5];
	R0 += -1;
	W[P5] = R0.L;

.P57L12:
.LN118:
// line 212
	SP += 12;
	P0 = [FP + 4];
	(R7:7, P5:4) = [SP++];
	UNLINK;
	// -- stall --
	JUMP (P0);

.P57L7:
.LN119:
// line 198
	R0 = R7.b (Z);
	CALL.X (_start_transfering_the_next_unprocessed_waveform_from_sdram_to_l1);
	jump .P57L9;

	.align 4
.P57L1:
.LN120:
// line 182
	CALL.X (_wait_until_mdma1_stream0_is_paused_or_stopped);
	.align 2
	R7 = 98;
.LN121:
// line 183
	R0 = B[P4] (Z);
.LN122:
	R1 = 14;
	R2 = 1536;
	CALL.X (_setup_single_pedestal_dma_transfer_from_l3_buffer_to_l1_buffer);
.LN123:
// line 184
	CALL.X (_initiate_dma_transfer_from_l3_buffer_to_l1_buffer);
.LN124:
// line 185
	CALL.X (_wait_until_mdma1_stream0_is_paused_or_stopped);
.LN125:
// line 186
	R0 = B[P4] (Z);
.LN126:
	R1 = 14;
	CALL.X (_setup_single_delta_t_dma_transfer_from_l3_buffer_to_l1_buffer);
.LN127:
// line 187
	CALL.X (_initiate_dma_transfer_from_l3_buffer_to_l1_buffer);
.LN128:
// line 188
	CALL.X (_wait_for_the_end_of_the_current_transfer_of_a_waveform_from_sdram_to_l1);
.LN129:
// line 190
	R0 = B[P4] (Z);
	R1 = 97;
	CC = R0 == R1;
	if CC jump .P57L3 ;

.P57L5:
	R7 = 97;
	jump .P57L3;
.LN._process_another_waveform.end:
._process_another_waveform.end:
	.global _process_another_waveform;
	.type _process_another_waveform,STT_FUNC;

	.align 2;
_output_pulses_proportional_to:
.LN_output_pulses_proportional_to:
	.reference _pulse;
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 12 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P1,ASTAT0-ASTAT1,CC,LC0,LT0,LB0}
//   Call preserved registers used:{FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R1.L,R1.H,P0-P1,ASTAT0-ASTAT1,RETS}
//-------------------------------------------------------------------
.LN130:
// line "..\..\src\dsp-fin-waveform-processing.c":216
	CC = R1 == 0;
.LN131:
// line 214
	LINK 12;
	R2 = R0;
.LN132:
// line 216
	if CC jump .P61L1 ;

.P61L2:
.LN133:
// line 220
	R3 = 65535 (Z);
	CC = R3 < R1 (IU);
	if CC jump .P61L4 ;

.P61L5:
.LN134:
// line 225
	CC = R1 == 0;
	if CC jump .P61L3 ;

.P61L12:
	P1 = R1;
	// -- 4 stalls --
	LOOP .P61L8L LC0 = P1;

.P61L8:
//-------------------------------------------------------------------
//   Loop at "..\..\src\dsp-fin-waveform-processing.c" line 225 col 3
//-------------------------------------------------------------------
//   This loop executes 1 iteration of the original loop in estimated 3 cycles.
//   (cycle count 3 excludes the cost of the inner function calls)
//-------------------------------------------------------------------
//   This loop's resource usage is:
//     16-bit Instruction  used   6 out of    6 (100.0%)
//     32-bit Instruction  used   3 out of    3 (100.0%)
//     Group 1             used   3 out of    3 (100.0%)
//-------------------------------------------------------------------
// This loop was not modulo scheduled because it contains calls or volatile operations.
//-------------------------------------------------------------------
	LOOP_BEGIN .P61L8L;
.LN135:
// line 226
	R0 = R2;
	CALL.X (_pulse);
	NOP;
.LN136:
// line 225
	LOOP_END .P61L8L;

.P61L13:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------

.P61L3:
.LN137:
// line 229
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);

.P61L4:
.LN138:
// line 221
	R1 = 1;
	R2.L = ASHIFT R1.L BY R0.L;
	P1 = 1800 /* -4192504 */;
	P1.H = -64 /* -4192504 */;
	W[P1] = R2.L;
.LN139:
// line 222
	R0 = 3;
	CALL.X (_pulse);
.LN140:
// line 223
	P1 = 1796 /* -4192508 */;
	P1.H = -64 /* -4192508 */;
	W[P1] = R2.L;
	jump .P61L3;

.P61L1:
.LN141:
// line 217
	R1 = 1;
	R2.L = ASHIFT R1.L BY R0.L;
	P1 = 1800 /* -4192504 */;
	P1.H = -64 /* -4192504 */;
	W[P1] = R2.L;
.LN142:
// line 218
	R0 = 2;
	CALL.X (_pulse);
.LN143:
// line 219
	P1 = 1796 /* -4192508 */;
	P1.H = -64 /* -4192508 */;
	W[P1] = R2.L;
	jump .P61L3;
.LN._output_pulses_proportional_to.end:
._output_pulses_proportional_to.end:
	.global _output_pulses_proportional_to;
	.type _output_pulses_proportional_to,STT_FUNC;

	.file_attr ProjectName="CoreA";
	.file_attr FuncName="_show_a_waveform";
	.file_attr FuncName="_setup_dma_unidirectional_burst_lengths";
	.file_attr FuncName="_predicate_changes_to_state_machine_for_waveform_transfer_from_fpga";
	.file_attr FuncName="_pulse_multiple";
	.file_attr FuncName="_pulse";
	.file_attr FuncName="_output_pulse_duty_cycle_proportional_to";
	.file_attr FuncName="_output_pulse_width_proportional_to";
	.file_attr FuncName="_finished_another_waveform_transfer_from_fpga";
	.file_attr FuncName="_finished_getting_waveform_from_fpga_interrupt_service_routine";
	.file_attr FuncName="_show_reason_for_aborting_analysis";
	.file_attr FuncName="_show_number_of_unprocessed_waveforms";
	.file_attr FuncName="_finished_processing_another_waveform";
	.file_attr FuncName="_enable_waveform_transfers_from_fpga";
	.file_attr FuncName="_disable_waveform_transfers_from_fpga";
	.file_attr FuncName="_start_transfering_the_next_unprocessed_waveform_from_sdram_to_l1";
	.file_attr FuncName="_wait_for_the_end_of_the_current_transfer_of_a_waveform_from_sdram_to_l1";
	.file_attr FuncName="_process_another_waveform";
	.file_attr FuncName="_output_pulses_proportional_to";
	.file_attr Content="CodeData";
.epctext.end:

	.extern _acknowledge_interrupt_for_completion_of_waveform_transfer_from_fpga;
	.type _acknowledge_interrupt_for_completion_of_waveform_transfer_from_fpga,STT_FUNC;
	.extern _setup_single_waveform_dma_transfer_from_l3_buffer_to_l1_buffer;
	.type _setup_single_waveform_dma_transfer_from_l3_buffer_to_l1_buffer,STT_FUNC;
	.extern _initiate_dma_transfer_from_l3_buffer_to_l1_buffer;
	.type _initiate_dma_transfer_from_l3_buffer_to_l1_buffer,STT_FUNC;
	.extern _wait_until_mdma1_stream0_is_paused_or_stopped;
	.type _wait_until_mdma1_stream0_is_paused_or_stopped,STT_FUNC;
	.extern _process_waveform;
	.type _process_waveform,STT_FUNC;
	.extern _setup_single_pedestal_dma_transfer_from_l3_buffer_to_l1_buffer;
	.type _setup_single_pedestal_dma_transfer_from_l3_buffer_to_l1_buffer,STT_FUNC;
	.extern _setup_single_delta_t_dma_transfer_from_l3_buffer_to_l1_buffer;
	.type _setup_single_delta_t_dma_transfer_from_l3_buffer_to_l1_buffer,STT_FUNC;

	.section/DOUBLE32 data1;

	.align 2;
.epcdata:
	.type .epcdata,STT_OBJECT;
	.byte _number_of_l1_waveforms_that_are_currently_being_transferred[2];
	.global _number_of_l1_waveforms_that_are_currently_being_transferred;
	.type _number_of_l1_waveforms_that_are_currently_being_transferred,STT_OBJECT;
	.byte _number_of_l1_waveforms_that_have_new_data[2];
	.global _number_of_l1_waveforms_that_have_new_data;
	.type _number_of_l1_waveforms_that_have_new_data,STT_OBJECT;
.epcdata.end:

	.section/ZERO_INIT/DOUBLE32 bsz;

	.align 4;
.epcbss:
	.type .epcbss,STT_OBJECT;
	.byte _number_of_unprocessed_waveforms[4];
	.global _number_of_unprocessed_waveforms;
	.type _number_of_unprocessed_waveforms,STT_OBJECT;
	.byte _index_of_next_waveform_to_process[4];
	.global _index_of_next_waveform_to_process;
	.type _index_of_next_waveform_to_process,STT_OBJECT;
	.byte _waveform_transfers_from_fpga_are_allowed[2];
	.global _waveform_transfers_from_fpga_are_allowed;
	.type _waveform_transfers_from_fpga_are_allowed,STT_OBJECT;
	.byte _waveform_transfers_from_fpga_are_desired[2];
	.global _waveform_transfers_from_fpga_are_desired;
	.type _waveform_transfers_from_fpga_are_desired,STT_OBJECT;
	.byte _x_fixed[4];
	.global _x_fixed;
	.type _x_fixed,STT_OBJECT;
	.byte _y_fixed[4];
	.global _y_fixed;
	.type _y_fixed,STT_OBJECT;
	.byte _a_fixed[4];
	.global _a_fixed;
	.type _a_fixed,STT_OBJECT;
	.byte _b_fixed[4];
	.global _b_fixed;
	.type _b_fixed,STT_OBJECT;
.epcbss.end:

	.section .debug_abbrev SHT_DEBUGINFO;

	.align 1;
.epcabbrev:
	.type .epcabbrev,STT_OBJECT;
	.inc/binary "..\Debug\dsp-fin-waveform-processing.sbn", 0, 192;
.epcabbrev.end:

	.section .debug_info SHT_DEBUGINFO;

	.align 1;
.epcdebug:
	.type .epcdebug,STT_OBJECT;
	.byte =
		0xDA,0x12,0x00,0x00,0x02,0x00;
	.byte4 = .epcabbrev;
	.byte =
		0x04,0x01,0x2E,0x2E,0x5C,0x2E,0x2E,0x5C,0x73,0x72,0x63,0x5C,
		0x64,0x73,0x70,0x2D,0x66,0x69,0x6E,0x2D,0x77,0x61,0x76,0x65,
		0x66,0x6F,0x72,0x6D,0x2D,0x70,0x72,0x6F,0x63,0x65,0x73,0x73,
		0x69,0x6E,0x67,0x2E,0x63,0x00,0x01;
	.byte4 = .epcline;
	.inc/binary "..\Debug\dsp-fin-waveform-processing.sbn", 192, 2591;
	.byte4 = .LN_show_a_waveform;
	.byte4 = .LN._show_a_waveform.end;
	.byte =
		0x01,0x01,0x00,0x0D,0x00,0x00,0x00,0x00;
	.byte4 = .LN0;
	.byte4 = .LN._show_a_waveform.end;
	.byte =
		0x00,0x00,0x0C,0xB9,0x0A,0x00,0x00,0x73,0x65,0x74,0x75,0x70,
		0x5F,0x64,0x6D,0x61,0x5F,0x75,0x6E,0x69,0x64,0x69,0x72,0x65,
		0x63,0x74,0x69,0x6F,0x6E,0x61,0x6C,0x5F,0x62,0x75,0x72,0x73,
		0x74,0x5F,0x6C,0x65,0x6E,0x67,0x74,0x68,0x73,0x00,0x01;
	.byte4 = .LN_setup_dma_unidirectional_burst_lengths;
	.byte4 = .LN._setup_dma_unidirectional_burst_lengths.end;
	.byte =
		0x01,0x01,0x00,0x0D,0x00,0x00,0x00,0x00;
	.byte4 = .LN16;
	.byte4 = .LN._setup_dma_unidirectional_burst_lengths.end;
	.byte =
		0x00,0x00,0x0C,0x1C,0x0B,0x00,0x00,0x70,0x72,0x65,0x64,0x69,
		0x63,0x61,0x74,0x65,0x5F,0x63,0x68,0x61,0x6E,0x67,0x65,0x73,
		0x5F,0x74,0x6F,0x5F,0x73,0x74,0x61,0x74,0x65,0x5F,0x6D,0x61,
		0x63,0x68,0x69,0x6E,0x65,0x5F,0x66,0x6F,0x72,0x5F,0x77,0x61,
		0x76,0x65,0x66,0x6F,0x72,0x6D,0x5F,0x74,0x72,0x61,0x6E,0x73,
		0x66,0x65,0x72,0x5F,0x66,0x72,0x6F,0x6D,0x5F,0x66,0x70,0x67,
		0x61,0x00,0x01;
	.byte4 = .LN_predicate_changes_to_state_machine_for_waveform_transfer_from_fpga;
	.byte4 = .LN._predicate_changes_to_state_machine_for_waveform_transfer_from_fpga.end;
	.byte =
		0x01,0x01,0x00,0x0D,0x00,0x00,0x00,0x00;
	.byte4 = .LN18;
	.byte4 = .LN._predicate_changes_to_state_machine_for_waveform_transfer_from_fpga.end;
	.byte =
		0x00,0x00,0x0C,0x4B,0x0B,0x00,0x00,0x70,0x75,0x6C,0x73,0x65,
		0x5F,0x6D,0x75,0x6C,0x74,0x69,0x70,0x6C,0x65,0x00,0x01;
	.byte4 = .LN_pulse_multiple;
	.byte4 = .LN._pulse_multiple.end;
	.byte =
		0x01,0x01,0x00,0x0D,0x00,0x00,0x00,0x00;
	.byte4 = .LN24;
	.byte4 = .LN._pulse_multiple.end;
	.byte =
		0x00,0x00,0x0C,0x71,0x0B,0x00,0x00,0x70,0x75,0x6C,0x73,0x65,
		0x00,0x01;
	.byte4 = .LN_pulse;
	.byte4 = .LN._pulse.end;
	.byte =
		0x01,0x01,0x00,0x0D,0x00,0x00,0x00,0x00;
	.byte4 = .LN27;
	.byte4 = .LN._pulse.end;
	.byte =
		0x00,0x00,0x0C,0xB9,0x0B,0x00,0x00,0x6F,0x75,0x74,0x70,0x75,
		0x74,0x5F,0x70,0x75,0x6C,0x73,0x65,0x5F,0x64,0x75,0x74,0x79,
		0x5F,0x63,0x79,0x63,0x6C,0x65,0x5F,0x70,0x72,0x6F,0x70,0x6F,
		0x72,0x74,0x69,0x6F,0x6E,0x61,0x6C,0x5F,0x74,0x6F,0x00,0x01;
	.byte4 = .LN_output_pulse_duty_cycle_proportional_to;
	.byte4 = .LN._output_pulse_duty_cycle_proportional_to.end;
	.byte =
		0x01,0x01,0x00,0x0D,0x00,0x00,0x00,0x00;
	.byte4 = .LN32;
	.byte4 = .LN._output_pulse_duty_cycle_proportional_to.end;
	.byte =
		0x00,0x00,0x0C,0xFC,0x0B,0x00,0x00,0x6F,0x75,0x74,0x70,0x75,
		0x74,0x5F,0x70,0x75,0x6C,0x73,0x65,0x5F,0x77,0x69,0x64,0x74,
		0x68,0x5F,0x70,0x72,0x6F,0x70,0x6F,0x72,0x74,0x69,0x6F,0x6E,
		0x61,0x6C,0x5F,0x74,0x6F,0x00,0x01;
	.byte4 = .LN_output_pulse_width_proportional_to;
	.byte4 = .LN._output_pulse_width_proportional_to.end;
	.byte =
		0x01,0x01,0x00,0x0D,0x00,0x00,0x00,0x00;
	.byte4 = .LN46;
	.byte4 = .LN._output_pulse_width_proportional_to.end;
	.byte =
		0x00,0x00,0x0C,0x49,0x0C,0x00,0x00,0x66,0x69,0x6E,0x69,0x73,
		0x68,0x65,0x64,0x5F,0x61,0x6E,0x6F,0x74,0x68,0x65,0x72,0x5F,
		0x77,0x61,0x76,0x65,0x66,0x6F,0x72,0x6D,0x5F,0x74,0x72,0x61,
		0x6E,0x73,0x66,0x65,0x72,0x5F,0x66,0x72,0x6F,0x6D,0x5F,0x66,
		0x70,0x67,0x61,0x00,0x01;
	.byte4 = .LN_finished_another_waveform_transfer_from_fpga;
	.byte4 = .LN._finished_another_waveform_transfer_from_fpga.end;
	.byte =
		0x01,0x01,0x00,0x0D,0x00,0x00,0x00,0x00;
	.byte4 = .LN57;
	.byte4 = .LN._finished_another_waveform_transfer_from_fpga.end;
	.byte =
		0x00,0x00,0x0C,0xA7,0x0C,0x00,0x00,0x66,0x69,0x6E,0x69,0x73,
		0x68,0x65,0x64,0x5F,0x67,0x65,0x74,0x74,0x69,0x6E,0x67,0x5F,
		0x77,0x61,0x76,0x65,0x66,0x6F,0x72,0x6D,0x5F,0x66,0x72,0x6F,
		0x6D,0x5F,0x66,0x70,0x67,0x61,0x5F,0x69,0x6E,0x74,0x65,0x72,
		0x72,0x75,0x70,0x74,0x5F,0x73,0x65,0x72,0x76,0x69,0x63,0x65,
		0x5F,0x72,0x6F,0x75,0x74,0x69,0x6E,0x65,0x00,0x01;
	.byte4 = .LN_finished_getting_waveform_from_fpga_interrupt_service_routine;
	.byte4 = .LN._finished_getting_waveform_from_fpga_interrupt_service_routine.end;
	.byte =
		0x01,0x01,0x00,0x0D,0x00,0x00,0x00,0x00;
	.byte4 = .LN61;
	.byte4 = .LN._finished_getting_waveform_from_fpga_interrupt_service_routine.end;
	.byte =
		0x00,0x00,0x0C,0xE9,0x0C,0x00,0x00,0x73,0x68,0x6F,0x77,0x5F,
		0x72,0x65,0x61,0x73,0x6F,0x6E,0x5F,0x66,0x6F,0x72,0x5F,0x61,
		0x62,0x6F,0x72,0x74,0x69,0x6E,0x67,0x5F,0x61,0x6E,0x61,0x6C,
		0x79,0x73,0x69,0x73,0x00,0x01;
	.byte4 = .LN_show_reason_for_aborting_analysis;
	.byte4 = .LN._show_reason_for_aborting_analysis.end;
	.byte =
		0x01,0x01,0x00,0x0D,0x00,0x00,0x00,0x00;
	.byte4 = .LN63;
	.byte4 = .LN._show_reason_for_aborting_analysis.end;
	.byte =
		0x00,0x00,0x0C,0x2E,0x0D,0x00,0x00,0x73,0x68,0x6F,0x77,0x5F,
		0x6E,0x75,0x6D,0x62,0x65,0x72,0x5F,0x6F,0x66,0x5F,0x75,0x6E,
		0x70,0x72,0x6F,0x63,0x65,0x73,0x73,0x65,0x64,0x5F,0x77,0x61,
		0x76,0x65,0x66,0x6F,0x72,0x6D,0x73,0x00,0x01;
	.byte4 = .LN_show_number_of_unprocessed_waveforms;
	.byte4 = .LN._show_number_of_unprocessed_waveforms.end;
	.byte =
		0x01,0x01,0x00,0x0D,0x00,0x00,0x00,0x00;
	.byte4 = .LN84;
	.byte4 = .LN._show_number_of_unprocessed_waveforms.end;
	.byte =
		0x00,0x00,0x0C,0x73,0x0D,0x00,0x00,0x66,0x69,0x6E,0x69,0x73,
		0x68,0x65,0x64,0x5F,0x70,0x72,0x6F,0x63,0x65,0x73,0x73,0x69,
		0x6E,0x67,0x5F,0x61,0x6E,0x6F,0x74,0x68,0x65,0x72,0x5F,0x77,
		0x61,0x76,0x65,0x66,0x6F,0x72,0x6D,0x00,0x01;
	.byte4 = .LN_finished_processing_another_waveform;
	.byte4 = .LN._finished_processing_another_waveform.end;
	.byte =
		0x01,0x01,0x00,0x0D,0x00,0x00,0x00,0x00;
	.byte4 = .LN88;
	.byte4 = .LN._finished_processing_another_waveform.end;
	.byte =
		0x00,0x00,0x0C,0xB7,0x0D,0x00,0x00,0x65,0x6E,0x61,0x62,0x6C,
		0x65,0x5F,0x77,0x61,0x76,0x65,0x66,0x6F,0x72,0x6D,0x5F,0x74,
		0x72,0x61,0x6E,0x73,0x66,0x65,0x72,0x73,0x5F,0x66,0x72,0x6F,
		0x6D,0x5F,0x66,0x70,0x67,0x61,0x00,0x01;
	.byte4 = .LN_enable_waveform_transfers_from_fpga;
	.byte4 = .LN._enable_waveform_transfers_from_fpga.end;
	.byte =
		0x01,0x01,0x00,0x0D,0x00,0x00,0x00,0x00;
	.byte4 = .LN91;
	.byte4 = .LN._enable_waveform_transfers_from_fpga.end;
	.byte =
		0x00,0x00,0x0C,0xFC,0x0D,0x00,0x00,0x64,0x69,0x73,0x61,0x62,
		0x6C,0x65,0x5F,0x77,0x61,0x76,0x65,0x66,0x6F,0x72,0x6D,0x5F,
		0x74,0x72,0x61,0x6E,0x73,0x66,0x65,0x72,0x73,0x5F,0x66,0x72,
		0x6F,0x6D,0x5F,0x66,0x70,0x67,0x61,0x00,0x01;
	.byte4 = .LN_disable_waveform_transfers_from_fpga;
	.byte4 = .LN._disable_waveform_transfers_from_fpga.end;
	.byte =
		0x01,0x01,0x00,0x0D,0x00,0x00,0x00,0x00;
	.byte4 = .LN94;
	.byte4 = .LN._disable_waveform_transfers_from_fpga.end;
	.byte =
		0x00,0x00,0x0C,0x5D,0x0E,0x00,0x00,0x73,0x74,0x61,0x72,0x74,
		0x5F,0x74,0x72,0x61,0x6E,0x73,0x66,0x65,0x72,0x69,0x6E,0x67,
		0x5F,0x74,0x68,0x65,0x5F,0x6E,0x65,0x78,0x74,0x5F,0x75,0x6E,
		0x70,0x72,0x6F,0x63,0x65,0x73,0x73,0x65,0x64,0x5F,0x77,0x61,
		0x76,0x65,0x66,0x6F,0x72,0x6D,0x5F,0x66,0x72,0x6F,0x6D,0x5F,
		0x73,0x64,0x72,0x61,0x6D,0x5F,0x74,0x6F,0x5F,0x6C,0x31,0x00,
		0x01;
	.byte4 = .LN_start_transfering_the_next_unprocessed_waveform_from_sdram_to_l1;
	.byte4 = .LN._start_transfering_the_next_unprocessed_waveform_from_sdram_to_l1.end;
	.byte =
		0x01,0x01,0x00,0x0D,0x00,0x00,0x00,0x00;
	.byte4 = .LN97;
	.byte4 = .LN._start_transfering_the_next_unprocessed_waveform_from_sdram_to_l1.end;
	.byte =
		0x00,0x00,0x0C,0xC5,0x0E,0x00,0x00,0x77,0x61,0x69,0x74,0x5F,
		0x66,0x6F,0x72,0x5F,0x74,0x68,0x65,0x5F,0x65,0x6E,0x64,0x5F,
		0x6F,0x66,0x5F,0x74,0x68,0x65,0x5F,0x63,0x75,0x72,0x72,0x65,
		0x6E,0x74,0x5F,0x74,0x72,0x61,0x6E,0x73,0x66,0x65,0x72,0x5F,
		0x6F,0x66,0x5F,0x61,0x5F,0x77,0x61,0x76,0x65,0x66,0x6F,0x72,
		0x6D,0x5F,0x66,0x72,0x6F,0x6D,0x5F,0x73,0x64,0x72,0x61,0x6D,
		0x5F,0x74,0x6F,0x5F,0x6C,0x31,0x00,0x01;
	.byte4 = .LN_wait_for_the_end_of_the_current_transfer_of_a_waveform_from_sdram_to_l1;
	.byte4 = .LN._wait_for_the_end_of_the_current_transfer_of_a_waveform_from_sdram_to_l1.end;
	.byte =
		0x01,0x01,0x00,0x0D,0x00,0x00,0x00,0x00;
	.byte4 = .LN104;
	.byte4 = .LN._wait_for_the_end_of_the_current_transfer_of_a_waveform_from_sdram_to_l1.end;
	.byte =
		0x00,0x00,0x0C,0x1E,0x0F,0x00,0x00,0x70,0x72,0x6F,0x63,0x65,
		0x73,0x73,0x5F,0x61,0x6E,0x6F,0x74,0x68,0x65,0x72,0x5F,0x77,
		0x61,0x76,0x65,0x66,0x6F,0x72,0x6D,0x00,0x01;
	.byte4 = .LN_process_another_waveform;
	.byte4 = .LN._process_another_waveform.end;
	.byte =
		0x01,0x01,0x00,0x0D,0x00,0x00,0x00,0x00;
	.byte4 = .LN109;
	.byte4 = .LN._process_another_waveform.end;
	.byte =
		0x0E,0x77,0x68,0x69,0x63,0x68,0x5F,0x77,0x61,0x76,0x65,0x66,
		0x6F,0x72,0x6D,0x00,0x01,0x8E,0x01,0x00,0x00,0x05,0x0C;
	.byte4 = _which_waveform.0;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x0C,0x5C,0x0F,0x00,0x00,
		0x6F,0x75,0x74,0x70,0x75,0x74,0x5F,0x70,0x75,0x6C,0x73,0x65,
		0x73,0x5F,0x70,0x72,0x6F,0x70,0x6F,0x72,0x74,0x69,0x6F,0x6E,
		0x61,0x6C,0x5F,0x74,0x6F,0x00,0x01;
	.byte4 = .LN_output_pulses_proportional_to;
	.byte4 = .LN._output_pulses_proportional_to.end;
	.byte =
		0x01,0x01,0x00,0x0D,0x00,0x00,0x00,0x00;
	.byte4 = .LN130;
	.byte4 = .LN._output_pulses_proportional_to.end;
	.byte =
		0x00,0x00,0x0E,0x77,0x61,0x76,0x65,0x66,0x6F,0x72,0x6D,0x5F,
		0x61,0x00,0x01,0xCE,0x12,0x00,0x00,0x05,0x0C;
	.byte4 = _waveform_a;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x0E,0x77,0x61,0x76,0x65,0x66,0x6F,
		0x72,0x6D,0x5F,0x62,0x00,0x01,0xBF,0x12,0x00,0x00,0x05,0x0C;
	.byte4 = _waveform_b;
	.inc/binary "..\Debug\dsp-fin-waveform-processing.sbn", 2783, 398;
	.byte4 = _number_of_unprocessed_waveforms;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x0E,0x69,0x6E,0x64,0x65,0x78,0x5F,
		0x6F,0x66,0x5F,0x6E,0x65,0x78,0x74,0x5F,0x77,0x61,0x76,0x65,
		0x66,0x6F,0x72,0x6D,0x5F,0x74,0x6F,0x5F,0x70,0x72,0x6F,0x63,
		0x65,0x73,0x73,0x00,0x01,0x06,0x02,0x00,0x00,0x05,0x0C;
	.byte4 = _index_of_next_waveform_to_process;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x0E,0x77,0x61,0x76,0x65,0x66,0x6F,
		0x72,0x6D,0x5F,0x74,0x72,0x61,0x6E,0x73,0x66,0x65,0x72,0x73,
		0x5F,0x66,0x72,0x6F,0x6D,0x5F,0x66,0x70,0x67,0x61,0x5F,0x61,
		0x72,0x65,0x5F,0x61,0x6C,0x6C,0x6F,0x77,0x65,0x64,0x00,0x01,
		0xB8,0x01,0x00,0x00,0x05,0x0C;
	.byte4 = _waveform_transfers_from_fpga_are_allowed;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x0E,0x77,0x61,0x76,0x65,0x66,0x6F,
		0x72,0x6D,0x5F,0x74,0x72,0x61,0x6E,0x73,0x66,0x65,0x72,0x73,
		0x5F,0x66,0x72,0x6F,0x6D,0x5F,0x66,0x70,0x67,0x61,0x5F,0x61,
		0x72,0x65,0x5F,0x64,0x65,0x73,0x69,0x72,0x65,0x64,0x00,0x01,
		0xB8,0x01,0x00,0x00,0x05,0x0C;
	.byte4 = _waveform_transfers_from_fpga_are_desired;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x0E,0x6E,0x75,0x6D,0x62,0x65,0x72,
		0x5F,0x6F,0x66,0x5F,0x6C,0x31,0x5F,0x77,0x61,0x76,0x65,0x66,
		0x6F,0x72,0x6D,0x73,0x5F,0x74,0x68,0x61,0x74,0x5F,0x61,0x72,
		0x65,0x5F,0x63,0x75,0x72,0x72,0x65,0x6E,0x74,0x6C,0x79,0x5F,
		0x62,0x65,0x69,0x6E,0x67,0x5F,0x74,0x72,0x61,0x6E,0x73,0x66,
		0x65,0x72,0x72,0x65,0x64,0x00,0x01,0xB8,0x01,0x00,0x00,0x05,
		0x0C;
	.byte4 = _number_of_l1_waveforms_that_are_currently_being_transferred;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x0E,0x6E,0x75,0x6D,0x62,0x65,0x72,
		0x5F,0x6F,0x66,0x5F,0x6C,0x31,0x5F,0x77,0x61,0x76,0x65,0x66,
		0x6F,0x72,0x6D,0x73,0x5F,0x74,0x68,0x61,0x74,0x5F,0x68,0x61,
		0x76,0x65,0x5F,0x6E,0x65,0x77,0x5F,0x64,0x61,0x74,0x61,0x00,
		0x01,0xB8,0x01,0x00,0x00,0x05,0x0C;
	.byte4 = _number_of_l1_waveforms_that_have_new_data;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x0E,0x78,0x5F,0x66,0x69,0x78,0x65,
		0x64,0x00,0x01,0xB9,0x12,0x00,0x00,0x05,0x0C;
	.byte4 = _x_fixed;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x0E,0x79,0x5F,0x66,0x69,0x78,0x65,
		0x64,0x00,0x01,0xB9,0x12,0x00,0x00,0x05,0x0C;
	.byte4 = _y_fixed;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x0E,0x61,0x5F,0x66,0x69,0x78,0x65,
		0x64,0x00,0x01,0xC2,0x05,0x00,0x00,0x05,0x0C;
	.byte4 = _a_fixed;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x0E,0x62,0x5F,0x66,0x69,0x78,0x65,
		0x64,0x00,0x01,0xC2,0x05,0x00,0x00,0x05,0x0C;
	.byte4 = _b_fixed;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x04,0x00,0xAB,0x05,0x00,0x00,0x0A,
		0xCE,0x12,0x00,0x00,0xB8,0x01,0x00,0x00,0x0B,0x80,0x01,0x00,
		0x7F,0x00,0x0A,0x00,0x00,0x00,0x00,0xB8,0x01,0x00,0x00,0x0B,
		0x80,0x01,0x00,0x7F,0x00,0x00;
.epcdebug.end:

	.section .debug_line SHT_DEBUGINFO;

	.align 1;
.epcline:
	.type .epcline,STT_OBJECT;
	.inc/binary "..\Debug\dsp-fin-waveform-processing.sbn", 3181, 2169;
	.byte4 = .LN_show_a_waveform;
	.byte =
		0x04,0x01,0x05,0x32,0xFE,0x00,0x05,0x02;
	.byte4 = .LN0;
	.byte =
		0x05,0x02,0x0B,0x00,0x05,0x02;
	.byte4 = .LN1;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN2;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN3;
	.byte =
		0x05,0x03,0x0C,0x00,0x05,0x02;
	.byte4 = .LN4;
	.byte =
		0x05,0x02,0x03,0x7E,0x01,0x00,0x05,0x02;
	.byte4 = .LN5;
	.byte =
		0x05,0x03,0x0B,0x00,0x05,0x02;
	.byte4 = .LN6;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN7;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN8;
	.byte =
		0x05,0x02,0x03,0x7C,0x01,0x00,0x05,0x02;
	.byte4 = .LN9;
	.byte =
		0x0F,0x00,0x05,0x02;
	.byte4 = .LN10;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN11;
	.byte =
		0x05,0x03,0x0B,0x00,0x05,0x02;
	.byte4 = .LN12;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN13;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN14;
	.byte =
		0x05,0x02,0x03,0x7C,0x01,0x00,0x05,0x02;
	.byte4 = .LN15;
	.byte =
		0x05,0x01,0x0F,0x00,0x05,0x02;
	.byte4 = .LN._show_a_waveform.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_setup_dma_unidirectional_burst_lengths;
	.byte =
		0x04,0x01,0x05,0x33,0xEF,0x00,0x05,0x02;
	.byte4 = .LN16;
	.byte =
		0x05,0x02,0x0E,0x00,0x05,0x02;
	.byte4 = .LN17;
	.byte =
		0x05,0x01,0x0F,0x00,0x05,0x02;
	.byte4 = .LN._setup_dma_unidirectional_burst_lengths.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_predicate_changes_to_state_machine_for_waveform_transfer_from_fpga;
	.byte =
		0x04,0x01,0x05,0x4F,0x7B,0x00,0x05,0x02;
	.byte4 = .LN18;
	.byte =
		0x05,0x02,0x0B,0x00,0x05,0x02;
	.byte4 = .LN19;
	.byte =
		0x05,0x03,0x0A,0x00,0x05,0x02;
	.byte4 = .LN20;
	.byte =
		0x05,0x01,0x11,0x00,0x05,0x02;
	.byte4 = .LN21;
	.byte =
		0x05,0x03,0x03,0x7A,0x01,0x00,0x05,0x02;
	.byte4 = .LN22;
	.byte =
		0x05,0x04,0x0A,0x00,0x05,0x02;
	.byte4 = .LN23;
	.byte =
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN._predicate_changes_to_state_machine_for_waveform_transfer_from_fpga.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_pulse_multiple;
	.byte =
		0x04,0x01,0x05,0x2E,0x6F,0x00,0x05,0x02;
	.byte4 = .LN24;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN25;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN26;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.byte4 = .LN._pulse_multiple.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_pulse;
	.byte =
		0x04,0x01,0x05,0x2D,0x6A,0x00,0x05,0x02;
	.byte4 = .LN27;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN28;
	.byte =
		0x05,0x2D,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN29;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN30;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN31;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.byte4 = .LN._pulse.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_output_pulse_duty_cycle_proportional_to;
	.byte =
		0x04,0x01,0x05,0x78,0x3B,0x00,0x05,0x02;
	.byte4 = .LN32;
	.byte =
		0x05,0x02,0x11,0x00,0x05,0x02;
	.byte4 = .LN33;
	.byte =
		0x05,0x78,0x03,0x78,0x01,0x00,0x05,0x02;
	.byte4 = .LN34;
	.byte =
		0x05,0x02,0x11,0x00,0x05,0x02;
	.byte4 = .LN35;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN36;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN37;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN38;
	.byte =
		0x05,0x03,0x0A,0x00,0x05,0x02;
	.byte4 = .LN39;
	.byte =
		0x05,0x02,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN40;
	.byte =
		0x0D,0x00,0x05,0x02;
	.byte4 = .LN41;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN42;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN43;
	.byte =
		0x05,0x03,0x0A,0x00,0x05,0x02;
	.byte4 = .LN44;
	.byte =
		0x05,0x02,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN45;
	.byte =
		0x05,0x01,0x0C,0x00,0x05,0x02;
	.byte4 = .LN._output_pulse_duty_cycle_proportional_to.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_output_pulse_width_proportional_to;
	.byte =
		0x04,0x01,0x05,0x54,0x2B,0x00,0x05,0x02;
	.byte4 = .LN46;
	.byte =
		0x05,0x02,0x0B,0x00,0x05,0x02;
	.byte4 = .LN47;
	.byte =
		0x05,0x54,0x03,0x7E,0x01,0x00,0x05,0x02;
	.byte4 = .LN48;
	.byte =
		0x05,0x02,0x0B,0x00,0x05,0x02;
	.byte4 = .LN49;
	.byte =
		0x05,0x09,0x0B,0x00,0x05,0x02;
	.byte4 = .LN50;
	.byte =
		0x05,0x02,0x0C,0x00,0x05,0x02;
	.byte4 = .LN51;
	.byte =
		0x05,0x03,0x0A,0x00,0x05,0x02;
	.byte4 = .LN52;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN53;
	.byte =
		0x05,0x04,0x0A,0x00,0x05,0x02;
	.byte4 = .LN54;
	.byte =
		0x05,0x03,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN55;
	.byte =
		0x0C,0x00,0x05,0x02;
	.byte4 = .LN56;
	.byte =
		0x05,0x01,0x0B,0x00,0x05,0x02;
	.byte4 = .LN._output_pulse_width_proportional_to.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_finished_another_waveform_transfer_from_fpga;
	.byte =
		0x04,0x01,0x05,0x39,0x4D,0x00,0x05,0x02;
	.byte4 = .LN57;
	.byte =
		0x05,0x02,0x0C,0x00,0x05,0x02;
	.byte4 = .LN58;
	.byte =
		0x05,0x44,0x0B,0x00,0x05,0x02;
	.byte4 = .LN59;
	.byte =
		0x05,0x45,0x0A,0x00,0x05,0x02;
	.byte4 = .LN60;
	.byte =
		0x05,0x01,0x0B,0x00,0x05,0x02;
	.byte4 = .LN._finished_another_waveform_transfer_from_fpga.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_finished_getting_waveform_from_fpga_interrupt_service_routine;
	.byte =
		0x04,0x01,0x05,0x5F,0x27,0x00,0x05,0x02;
	.byte4 = .LN61;
	.byte =
		0x05,0x2E,0x0A,0x00,0x05,0x02;
	.byte4 = .LN62;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.byte4 = .LN._finished_getting_waveform_from_fpga_interrupt_service_routine.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_show_reason_for_aborting_analysis;
	.byte =
		0x04,0x01,0x05,0x3E,0x57,0x00,0x05,0x02;
	.byte4 = .LN63;
	.byte =
		0x05,0x07,0x0A,0x00,0x05,0x02;
	.byte4 = .LN64;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN65;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN66;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN67;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN68;
	.byte =
		0x05,0x02,0x0B,0x00,0x05,0x02;
	.byte4 = .LN69;
	.byte =
		0x05,0x0D,0x01,0x00,0x05,0x02;
	.byte4 = .LN70;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN71;
	.byte =
		0x05,0x0D,0x01,0x00,0x05,0x02;
	.byte4 = .LN72;
	.byte =
		0x05,0x15,0x01,0x00,0x05,0x02;
	.byte4 = .LN73;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN74;
	.byte =
		0x05,0x08,0x0A,0x00,0x05,0x02;
	.byte4 = .LN75;
	.byte =
		0x05,0x02,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN76;
	.byte =
		0x05,0x08,0x0A,0x00,0x05,0x02;
	.byte4 = .LN77;
	.byte =
		0x05,0x02,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN78;
	.byte =
		0x05,0x07,0x0C,0x00,0x05,0x02;
	.byte4 = .LN79;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN80;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN81;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN82;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN83;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.byte4 = .LN._show_reason_for_aborting_analysis.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_show_number_of_unprocessed_waveforms;
	.byte =
		0x04,0x01,0x05,0x31,0x74,0x00,0x05,0x02;
	.byte4 = .LN84;
	.byte =
		0x05,0x02,0x0B,0x00,0x05,0x02;
	.byte4 = .LN85;
	.byte =
		0x05,0x08,0x0A,0x00,0x05,0x02;
	.byte4 = .LN86;
	.byte =
		0x05,0x02,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN87;
	.byte =
		0x05,0x01,0x0C,0x00,0x05,0x02;
	.byte4 = .LN._show_number_of_unprocessed_waveforms.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_finished_processing_another_waveform;
	.byte =
		0x04,0x01,0x05,0x31,0x88,0x00,0x05,0x02;
	.byte4 = .LN88;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN89;
	.byte =
		0x05,0x44,0x0B,0x00,0x05,0x02;
	.byte4 = .LN90;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.byte4 = .LN._finished_processing_another_waveform.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_enable_waveform_transfers_from_fpga;
	.byte =
		0x04,0x01,0x05,0x30,0x8E,0x00,0x05,0x02;
	.byte4 = .LN91;
	.byte =
		0x05,0x02,0x0C,0x00,0x05,0x02;
	.byte4 = .LN92;
	.byte =
		0x05,0x44,0x0A,0x00,0x05,0x02;
	.byte4 = .LN93;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.byte4 = .LN._enable_waveform_transfers_from_fpga.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_disable_waveform_transfers_from_fpga;
	.byte =
		0x04,0x01,0x05,0x31,0x95,0x00,0x05,0x02;
	.byte4 = .LN94;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN95;
	.byte =
		0x05,0x44,0x0A,0x00,0x05,0x02;
	.byte4 = .LN96;
	.byte =
		0x05,0x01,0x0B,0x00,0x05,0x02;
	.byte4 = .LN._disable_waveform_transfers_from_fpga.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_start_transfering_the_next_unprocessed_waveform_from_sdram_to_l1;
	.byte =
		0x04,0x01,0x05,0x65,0x9B,0x00,0x05,0x02;
	.byte4 = .LN97;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN98;
	.byte =
		0x05,0x40,0x01,0x00,0x05,0x02;
	.byte4 = .LN99;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN100;
	.byte =
		0x05,0x03,0x0A,0x00,0x05,0x02;
	.byte4 = .LN101;
	.byte =
		0x05,0x33,0x0B,0x00,0x05,0x02;
	.byte4 = .LN102;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN103;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.byte4 = .LN._start_transfering_the_next_unprocessed_waveform_from_sdram_to_l1.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_wait_for_the_end_of_the_current_transfer_of_a_waveform_from_sdram_to_l1;
	.byte =
		0x04,0x01,0x05,0x54,0xA4,0x00,0x05,0x02;
	.byte4 = .LN104;
	.byte =
		0x05,0x2F,0x0A,0x00,0x05,0x02;
	.byte4 = .LN105;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN106;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN107;
	.byte =
		0x05,0x26,0x0A,0x00,0x05,0x02;
	.byte4 = .LN108;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.byte4 = .LN._wait_for_the_end_of_the_current_transfer_of_a_waveform_from_sdram_to_l1.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_process_another_waveform;
	.byte =
		0x04,0x01,0x05,0x25,0xAB,0x00,0x05,0x02;
	.byte4 = .LN109;
	.byte =
		0x05,0x02,0x16,0x00,0x05,0x02;
	.byte4 = .LN110;
	.byte =
		0x05,0x10,0x03,0x76,0x01,0x00,0x05,0x02;
	.byte4 = .LN111;
	.byte =
		0x05,0x02,0x13,0x00,0x05,0x02;
	.byte4 = .LN112;
	.byte =
		0x1D,0x00,0x05,0x02;
	.byte4 = .LN113;
	.byte =
		0x0D,0x00,0x05,0x02;
	.byte4 = .LN114;
	.byte =
		0x05,0x03,0x0C,0x00,0x05,0x02;
	.byte4 = .LN115;
	.byte =
		0x05,0x14,0x0A,0x00,0x05,0x02;
	.byte4 = .LN116;
	.byte =
		0x05,0x03,0x0F,0x00,0x05,0x02;
	.byte4 = .LN117;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN118;
	.byte =
		0x05,0x01,0x0C,0x00,0x05,0x02;
	.byte4 = .LN119;
	.byte =
		0x05,0x43,0x03,0x72,0x01,0x00,0x05,0x02;
	.byte4 = .LN120;
	.byte =
		0x05,0x31,0x03,0x70,0x01,0x00,0x05,0x02;
	.byte4 = .LN121;
	.byte =
		0x05,0x04,0x0A,0x00,0x05,0x02;
	.byte4 = .LN122;
	.byte =
		0x05,0x42,0x01,0x00,0x05,0x02;
	.byte4 = .LN123;
	.byte =
		0x05,0x35,0x0A,0x00,0x05,0x02;
	.byte4 = .LN124;
	.byte =
		0x05,0x31,0x0A,0x00,0x05,0x02;
	.byte4 = .LN125;
	.byte =
		0x05,0x04,0x0A,0x00,0x05,0x02;
	.byte4 = .LN126;
	.byte =
		0x05,0x41,0x01,0x00,0x05,0x02;
	.byte4 = .LN127;
	.byte =
		0x05,0x35,0x0A,0x00,0x05,0x02;
	.byte4 = .LN128;
	.byte =
		0x05,0x4A,0x0A,0x00,0x05,0x02;
	.byte4 = .LN129;
	.byte =
		0x05,0x03,0x0B,0x00,0x05,0x02;
	.byte4 = .LN._process_another_waveform.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_output_pulses_proportional_to;
	.byte =
		0x04,0x01,0x05,0x5A,0xDE,0x00,0x05,0x02;
	.byte4 = .LN130;
	.byte =
		0x05,0x02,0x0B,0x00,0x05,0x02;
	.byte4 = .LN131;
	.byte =
		0x05,0x5A,0x03,0x7E,0x01,0x00,0x05,0x02;
	.byte4 = .LN132;
	.byte =
		0x05,0x02,0x0B,0x00,0x05,0x02;
	.byte4 = .LN133;
	.byte =
		0x05,0x09,0x0D,0x00,0x05,0x02;
	.byte4 = .LN134;
	.byte =
		0x05,0x03,0x0E,0x00,0x05,0x02;
	.byte4 = .LN135;
	.byte =
		0x05,0x09,0x0A,0x00,0x05,0x02;
	.byte4 = .LN136;
	.byte =
		0x05,0x03,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN137;
	.byte =
		0x05,0x01,0x0D,0x00,0x05,0x02;
	.byte4 = .LN138;
	.byte =
		0x05,0x03,0x03,0x78,0x01,0x00,0x05,0x02;
	.byte4 = .LN139;
	.byte =
		0x05,0x08,0x0A,0x00,0x05,0x02;
	.byte4 = .LN140;
	.byte =
		0x05,0x03,0x0A,0x00,0x05,0x02;
	.byte4 = .LN141;
	.byte =
		0x03,0x7A,0x01,0x00,0x05,0x02;
	.byte4 = .LN142;
	.byte =
		0x05,0x08,0x0A,0x00,0x05,0x02;
	.byte4 = .LN143;
	.byte =
		0x05,0x03,0x0A,0x00,0x05,0x02;
	.byte4 = .LN._output_pulses_proportional_to.end;
	.byte =
		0x00,0x01,0x01;
.epcline.end:

	.section .annotations SHT_DEBUGINFO;

	.align 1;
.epcannot:
	.type .epcannot,STT_OBJECT;
	.inc/binary "..\Debug\dsp-fin-waveform-processing.sbn", 5350, 7736;
.epcannot.end:

	.section .debug_pubnames SHT_DEBUGINFO;

	.align 1;
.epcpubnames:
	.type .epcpubnames,STT_OBJECT;
	.byte =
		0x52,0x04,0x00,0x00,0x02,0x00;
	.byte4 = .epcdebug;
	.inc/binary "..\Debug\dsp-fin-waveform-processing.sbn", 13086, 1100;
.epcpubnames.end:

	.section .debug_aranges SHT_DEBUGINFO;

	.align 1;
.epcaranges:
	.type .epcaranges,STT_OBJECT;
	.byte =
		0xA4,0x00,0x00,0x00,0x02,0x00;
	.byte4 = .epcdebug;
	.byte =
		0x04,0x00,0x00,0x00,0x00,0x00;
	.byte4 = .LN_show_a_waveform;
	.byte4 = .LN._show_a_waveform.end-.LN_show_a_waveform;
	.byte4 = .LN_setup_dma_unidirectional_burst_lengths;
	.byte4 = .LN._setup_dma_unidirectional_burst_lengths.end-.LN_setup_dma_unidirectional_burst_lengths;
	.byte4 = .LN_predicate_changes_to_state_machine_for_waveform_transfer_from_fpga;
	.byte4 = .LN._predicate_changes_to_state_machine_for_waveform_transfer_from_fpga.end-.LN_predicate_changes_to_state_machine_for_waveform_transfer_from_fpga;
	.byte4 = .LN_pulse_multiple;
	.byte4 = .LN._pulse_multiple.end-.LN_pulse_multiple;
	.byte4 = .LN_pulse;
	.byte4 = .LN._pulse.end-.LN_pulse;
	.byte4 = .LN_output_pulse_duty_cycle_proportional_to;
	.byte4 = .LN._output_pulse_duty_cycle_proportional_to.end-.LN_output_pulse_duty_cycle_proportional_to;
	.byte4 = .LN_output_pulse_width_proportional_to;
	.byte4 = .LN._output_pulse_width_proportional_to.end-.LN_output_pulse_width_proportional_to;
	.byte4 = .LN_finished_another_waveform_transfer_from_fpga;
	.byte4 = .LN._finished_another_waveform_transfer_from_fpga.end-.LN_finished_another_waveform_transfer_from_fpga;
	.byte4 = .LN_finished_getting_waveform_from_fpga_interrupt_service_routine;
	.byte4 = .LN._finished_getting_waveform_from_fpga_interrupt_service_routine.end-.LN_finished_getting_waveform_from_fpga_interrupt_service_routine;
	.byte4 = .LN_show_reason_for_aborting_analysis;
	.byte4 = .LN._show_reason_for_aborting_analysis.end-.LN_show_reason_for_aborting_analysis;
	.byte4 = .LN_show_number_of_unprocessed_waveforms;
	.byte4 = .LN._show_number_of_unprocessed_waveforms.end-.LN_show_number_of_unprocessed_waveforms;
	.byte4 = .LN_finished_processing_another_waveform;
	.byte4 = .LN._finished_processing_another_waveform.end-.LN_finished_processing_another_waveform;
	.byte4 = .LN_enable_waveform_transfers_from_fpga;
	.byte4 = .LN._enable_waveform_transfers_from_fpga.end-.LN_enable_waveform_transfers_from_fpga;
	.byte4 = .LN_disable_waveform_transfers_from_fpga;
	.byte4 = .LN._disable_waveform_transfers_from_fpga.end-.LN_disable_waveform_transfers_from_fpga;
	.byte4 = .LN_start_transfering_the_next_unprocessed_waveform_from_sdram_to_l1;
	.byte4 = .LN._start_transfering_the_next_unprocessed_waveform_from_sdram_to_l1.end-.LN_start_transfering_the_next_unprocessed_waveform_from_sdram_to_l1;
	.byte4 = .LN_wait_for_the_end_of_the_current_transfer_of_a_waveform_from_sdram_to_l1;
	.byte4 = .LN._wait_for_the_end_of_the_current_transfer_of_a_waveform_from_sdram_to_l1.end-.LN_wait_for_the_end_of_the_current_transfer_of_a_waveform_from_sdram_to_l1;
	.byte4 = .LN_process_another_waveform;
	.byte4 = .LN._process_another_waveform.end-.LN_process_another_waveform;
	.byte4 = .LN_output_pulses_proportional_to;
	.byte4 = .LN._output_pulses_proportional_to.end-.LN_output_pulses_proportional_to;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00;
.epcaranges.end:

	.section/DOUBLE32 data1;

	.align 1;
.process_another_waveform.statics:
	.type .process_another_waveform.statics,STT_OBJECT;
_which_waveform.0:
	.type _which_waveform.0,STT_OBJECT;
	.byte =
		0x61;
.process_another_waveform.statics.end:

	.extern _waveform_a;
	.type _waveform_a,STT_OBJECT;
	.extern _waveform_b;
	.type _waveform_b,STT_OBJECT;
