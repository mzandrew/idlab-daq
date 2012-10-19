	.file "..\..\src\dma.c";
//  Compilation time: Wed Jan 20 22:50:31 2010

//  Compiler options: -c -file-attr ProjectName=CoreA -O -Ov100 -g -save-temps -path-output ..\Debug -structs-do-not-overlap -no-multiline -double-size-32 -decls-strong -warn-protos -proc ADSP-BF561 -o ..\Debug\dma.doj -MM
//  Architecture: ADSP-BF561
//  Silicon revision: 0.5
//  Anomalies summary:
//   Disabled: w05_00_0046,w05_00_0048,w05_00_0054,w05_00_0071,w05_00_0103,w05_00_0104,w05_00_0157,w05_00_0164,w05_00_0165,w05_00_0195,w05_00_0198,w05_00_0202,w05_00_0209,w05_00_0227,w05_00_0244,w05_00_0245,w05_00_0246,w05_00_0248,w05_00_0257,w05_00_0262,w05_00_0264,w05_00_0283,wF3_F_021,wF3_F_008_F3_F_013,w05_00_0311
//   Enabled: w05_00_0120,w05_00_0127,w05_00_0189,w05_00_0312
//   Always on: w05_00_0074,w05_00_0122

	.section/DOUBLE32 program;

.epctext:
	.align 4;
_acknowledge_interrupt_for_completion_of_waveform_transfer_from_fpga:
.LN_acknowledge_interrupt_for_completion_of_waveform_transfer_from_fpga:
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,R0.H,P0-P1,ASTAT0-ASTAT1}
//   Call preserved registers used:{FP,SP,RETS}
//-------------------------------------------------------------------
// line "..\..\src\dma.c":179
	LINK 0;
	.align 2
.LN0:
// line 180
	P1 = 7208 /* -4187096 */;
	P1.H = -64 /* -4187096 */;
	R0.L = W[P1];
	BITSET(R0, 0);
	W[P1] = R0.L;
.LN1:
// line 181
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);
.LN._acknowledge_interrupt_for_completion_of_waveform_transfer_from_fpga.end:
._acknowledge_interrupt_for_completion_of_waveform_transfer_from_fpga.end:
	.global _acknowledge_interrupt_for_completion_of_waveform_transfer_from_fpga;
	.type _acknowledge_interrupt_for_completion_of_waveform_transfer_from_fpga,STT_FUNC;

	.align 4;
_dma_configuration_register:
.LN_dma_configuration_register:
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0,ASTAT0-ASTAT1}
//   Call preserved registers used:{R7.L,R7.H,FP,SP,RETS}
//-------------------------------------------------------------------
// line "..\..\src\dma.c":132
	LINK 0;
	.align 2
.LN2:
// line 135
	R0.L = R0.L << 12 || P0 = [FP + 4];
	R1.L = R1.L << 8;
.LN3:
// line 132
	[--SP] = R7;
.LN4:
// line 135
	R1 = R0 | R1;
	R0 = R2 << 7 || R3 = [SP + 24];
	R1 = R1 | R0;
	R0 = R3 << 6 || R7 = [SP + 28];
	R1 = R1 | R0;
	R0 = R7 << 5 || R2 = [SP + 32];
	R1 = R1 | R0;
	R0 = R2 << 4 || R3 = [SP + 36];
	R0 = R1 | R0;
	R3.L = R3.L << 2 || R7 = [SP + 40];
	R0 = R0 | R3;
	R7.L = R7.L << 1 || R2 = [SP + 44];
	R0 = R0 | R7;
	R0 = R2 | R0;
	R7 = [SP++];
	UNLINK;
	R0 = R0.L (Z);
	JUMP (P0);
.LN._dma_configuration_register.end:
._dma_configuration_register.end:
	.global _dma_configuration_register;
	.type _dma_configuration_register,STT_FUNC;

	.align 4;
_init_dma:
.LN_init_dma:
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,ASTAT0-ASTAT1}
//   Call preserved registers used:{R4.L,R4.H,R5.L,R5.H,R6.L,R6.H,R7.L,R7.H,FP,SP,RETS}
//-------------------------------------------------------------------
// Original Loop at "..\..\src\dma.c" line 118 col 2 --  unrolled
//-------------------------------------------------------------------
	P1.L = _dma_descriptor;
	P1.H = _dma_descriptor;
	.align 2
	R0 = P1;
.LN5:
// line "..\..\src\dma.c":120
	R1 = -1;
	R1 <<= 16;
	R0 += 8;
	R2 = R0 & R1;
.LN6:
// line 116
	LINK 0;
.LN7:
// line 120
	R3.L = R2.H << 0;
	R2 = P1;
.LN8:
// line 116
	[--SP] = (R7:4);
.LN9:
// line 126
	R6 = R1 & R2;
	R7.L = _buffer0;
	R7.H = _buffer0;
	R2 = 252;
	P0 = P1;
	R2 = R7 + R2 (NS) || W[P0++] = R0;
.LN10:
// line 122
	R5 = R2 & R1;
.LN11:
// line 120
	R3.L = R5.H << 0 || W[P0++] = R3;
	R5 = 8;
	R4 = R0 + R5 (NS) || W[P0++] = R2;
	R0 = R4 & R1;
.LN12:
// line 122
	R0.L = R0.H << 0 || W[P0++] = R3;
.LN13:
// line 119
	R5 = R4 + R5 (NS) || W[P0++] = R4;
	R3 = 256;
.LN14:
// line 120
	R2 = R2 + R3 (NS) || W[P0++] = R0;
	R0 = R5 & R1;
	R6 = PACK(R6.H, R0.H) || W[P0++] = R2;
.LN15:
// line 122
	R0 = R2 & R1;
	R0.L = R0.H << 0;
	R3 = R2 + R3 (NS) || W[P0++] = R0;
	R0 = 1020;
.LN16:
// line 119
	R2 = R7 + R0 (NS) || W[P0++] = R5;
.LN17:
// line 122
	R0 = R3 & R1;
.LN18:
// line 120
	R0.L = R0.H << 0 || W[P0++] = R6;
.LN19:
// line 121
	W[P0++] = R3;
.LN20:
// line 128
	R1 = R1 & R2;
.LN21:
// line 122
	R0.L = R1.H << 0 || W[P0++] = R0;
.LN22:
// line 128
	W[P1 + 30] = R0;
	R0 = P1;
.LN23:
// line 125
	R3 = 65535 (Z);
	R0 = R3 & R0;
.LN24:
// line 127
	R1 = R3 & R2;
	R6 = PACK(R6.H, R0.L) || W[P1 + 28] = R1;
.LN25:
// line 125
	[P1 + 24] = R6;
.LN26:
// line 129
	P2 = [FP + 4];
	(R7:4) = [SP++];
	UNLINK;
	// -- stall --
	JUMP (P2);
.LN._init_dma.end:
._init_dma.end:
	.global _init_dma;
	.type _init_dma,STT_FUNC;

	.align 4;
_wait_until_mdma1_stream0_is_paused_or_stopped:
.LN_wait_until_mdma1_stream0_is_paused_or_stopped:
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,P0-P2,ASTAT0-ASTAT1,CC,LC0,LT0,LB0}
//   Call preserved registers used:{FP,SP,RETS}
//-------------------------------------------------------------------
// line "..\..\src\dma.c":23
	LINK 0;
	.align 2
	R0 = 1;
	P1 = -1;
.LN27:
// line 27
	P0 = 7976 /* -4186328 */;
	P0.H = -64 /* -4186328 */;
	R2 = 8;
.LN28:
// line 28
	P2 = 8040 /* -4186264 */;
	P2.H = -64 /* -4186264 */;
	R1 = 1;

.P47L8:
//-------------------------------------------------------------------
//   Loop at "..\..\src\dma.c" line 26 col 2 (infinite hardware loop wrapper) 
//-------------------------------------------------------------------
	LOOP .P47L1L LC0 = P1;

.P47L1:
//-------------------------------------------------------------------
//   Loop at "..\..\src\dma.c" line 26 col 2
//-------------------------------------------------------------------
	LOOP_BEGIN .P47L1L;
.LN29:
// line 26
	R1 = R1.L (Z);
	CC = R1 == 0;
	if CC jump .P47L4 ;

.P47L3:
.LN30:
// line 27
	R0.L = W[P0];                           // Use of volatile in loops precludes optimizations. 
.LN31:
// line 28
	R1.L = W[P2];                           // Use of volatile in loops precludes optimizations. 
.LN32:
// line 27
	R0 = R0 & R2;
.LN33:
// line 28
	R1 = R1 & R2;
	LOOP_END .P47L1L;

.P47L9:
//-------------------------------------------------------------------
//   Part of Loop 8, depth 1
//-------------------------------------------------------------------
	jump .P47L8;

.P47L4:
//-------------------------------------------------------------------
//   Part of Loop 1, depth 2
//-------------------------------------------------------------------
.LN34:
// line 26
	R0 = R0.L (Z);
	CC = R0 == 0;
	if !CC jump .P47L3 (bp);

.P47L2:
//-------------------------------------------------------------------
//   Part of top level (no loop)
//-------------------------------------------------------------------
.LN35:
// line 32
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);
.LN._wait_until_mdma1_stream0_is_paused_or_stopped.end:
._wait_until_mdma1_stream0_is_paused_or_stopped.end:
	.global _wait_until_mdma1_stream0_is_paused_or_stopped;
	.type _wait_until_mdma1_stream0_is_paused_or_stopped,STT_FUNC;

	.align 4;
_initiate_dma_transfer_from_l3_buffer_to_l1_buffer:
.LN_initiate_dma_transfer_from_l3_buffer_to_l1_buffer:
	.reference _mdma1_D0_config_base_value;
	.reference _wait_until_mdma1_stream0_is_paused_or_stopped;
	.reference _mdma1_S0_config_base_value;
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 12 
//   Scratch registers used:{R0.L,R0.H,P0-P2,ASTAT0-ASTAT1}
//   Call preserved registers used:{FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,P0-P2,ASTAT0-ASTAT1,CC,LC0,LT0,LB0,RETS}
//Inlined in _initiate_dma_transfer_from_l3_buffer_to_l1_buffer:
//  ..\..\src\dma.c:20:7'_ssync
//-------------------------------------------------------------------
// line "..\..\src\dma.c":14
	LINK 12;
	.align 2
.LN36:
// line 15
	CALL.X (_wait_until_mdma1_stream0_is_paused_or_stopped);
	P1.L = .epcbss+2;
	P1.H = .epcbss+2;
.LN37:
// line 18
	R0 = W[P1--] (X);
	BITSET(R0, 0);
	P0 = 8008 /* -4186296 */;
	P0.H = -64 /* -4186296 */;
	W[P0] = R0.L;
.LN38:
// line 19
	R0.L = W[P1];
	BITSET(R0, 0);
	P1 = 7944 /* -4186360 */;
	P1.H = -64 /* -4186360 */;
	W[P1] = R0.L;
.LN39:
// line "C:\Program Files\Analog Devices\VisualDSP 5.0\Blackfin\include\builtins.h":3389
	.MESSAGE/SUPPRESS 5515;
		CLI R0;
	.MESSAGE/SUPPRESS 5515 FOR 1 LINES;
		SSYNC;
	.MESSAGE/RESTORE 5515;
		STI R0;
.LN40:
// line "..\..\src\dma.c":21
	P2 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P2);
.LN._initiate_dma_transfer_from_l3_buffer_to_l1_buffer.end:
._initiate_dma_transfer_from_l3_buffer_to_l1_buffer.end:
	.global _initiate_dma_transfer_from_l3_buffer_to_l1_buffer;
	.type _initiate_dma_transfer_from_l3_buffer_to_l1_buffer,STT_FUNC;

	.align 4;
_setup_single_waveform_dma_transfer_from_l3_buffer_to_l1_buffer:
.LN_setup_single_waveform_dma_transfer_from_l3_buffer_to_l1_buffer:
	.reference _mdma1_D0_config_base_value;
	.reference _wait_until_mdma1_stream0_is_paused_or_stopped;
	.reference _mdma1_S0_config_base_value;
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 16 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P1,ASTAT0-ASTAT1,CC}
//   Call preserved registers used:{R7.L,R7.H,FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,P0-P2,ASTAT0-ASTAT1,CC,LC0,LT0,LB0,RETS}
//Inlined in _setup_single_waveform_dma_transfer_from_l3_buffer_to_l1_buffer:
//  ..\..\src\dma.c:50:7'_ssync
//-------------------------------------------------------------------
// line "..\..\src\dma.c":34
	LINK 16;
	.align 2
	R3 = ROT R0 BY 0 || [SP + 12] = R7;
.LN41:
// line 35
	R7 = R1;
	CALL.X (_wait_until_mdma1_stream0_is_paused_or_stopped);
	R0 = 64;
.LN42:
// line 36
	P1 = 8016 /* -4186288 */;
	P1.H = -64 /* -4186288 */;
	R2 = R7 << 8 || W[P1] = R0.L;
.LN43:
// line 37
	P1 = 7952 /* -4186352 */;
	P1.H = -64 /* -4186352 */;
	W[P1] = R0.L;
	R1 = 4;
.LN44:
// line 38
	P1 = 8020 /* -4186284 */;
	P1.H = -64 /* -4186284 */;
	W[P1] = R1.L;
.LN45:
// line 39
	P1 = 7956 /* -4186348 */;
	P1.H = -64 /* -4186348 */;
	R0.L = _buffer0;
	R0.H = _buffer0;
	R0 = R0 + R2 (NS) || W[P1] = R1.L;
.LN46:
// line 41
	R1 = 97;
.LN47:
// line 40
	P1 = 8004 /* -4186300 */;
	P1.H = -64 /* -4186300 */;
.LN48:
// line 41
	CC = R3 == R1;
.LN49:
// line 40
	[P1] = R0;
.LN50:
// line 42
	P1 = 7940 /* -4186364 */;
	P1.H = -64 /* -4186364 */;
.LN51:
// line 41
	if !CC jump .P49L2 ;

.P49L1:
	R0.L = _waveform_a;
	R0.H = _waveform_a;
.LN52:
// line 42
	[P1] = R0;
	jump .P49L4;

	.align 4
.P49L2:
	R0.L = _waveform_b;
	R0.H = _waveform_b;
	.align 2
.LN53:
// line 44
	[P1] = R0;

.P49L4:
.LN54:
// line 48
	R0 = 8;
	P1.L = .epcbss+2;
	P1.H = .epcbss+2;
	W[P1--] = R0;
.LN55:
// line 49
	R0 = 10;
	W[P1] = R0.L;
.LN56:
// line "C:\Program Files\Analog Devices\VisualDSP 5.0\Blackfin\include\builtins.h":3389
	.MESSAGE/SUPPRESS 5515;
		CLI R0;
	.MESSAGE/SUPPRESS 5515 FOR 1 LINES;
		SSYNC;
	.MESSAGE/RESTORE 5515;
		STI R0;
.LN57:
// line "..\..\src\dma.c":51
	P0 = [FP + 4];
	R7 = [SP + 12];
	UNLINK;
	// -- stall --
	JUMP (P0);
.LN._setup_single_waveform_dma_transfer_from_l3_buffer_to_l1_buffer.end:
._setup_single_waveform_dma_transfer_from_l3_buffer_to_l1_buffer.end:
	.global _setup_single_waveform_dma_transfer_from_l3_buffer_to_l1_buffer;
	.type _setup_single_waveform_dma_transfer_from_l3_buffer_to_l1_buffer,STT_FUNC;

	.align 4;
_setup_single_pedestal_dma_transfer_from_l3_buffer_to_l1_buffer:
.LN_setup_single_pedestal_dma_transfer_from_l3_buffer_to_l1_buffer:
	.reference _mdma1_D0_config_base_value;
	.reference _wait_until_mdma1_stream0_is_paused_or_stopped;
	.reference _mdma1_S0_config_base_value;
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P1,ASTAT0-ASTAT1,CC}
//   Call preserved registers used:{R5.L,R5.H,R6.L,R6.H,R7.L,R7.H,FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,P0-P2,ASTAT0-ASTAT1,CC,LC0,LT0,LB0,RETS}
//Inlined in _setup_single_pedestal_dma_transfer_from_l3_buffer_to_l1_buffer:
//  ..\..\src\dma.c:71:7'_ssync
//-------------------------------------------------------------------
// line "..\..\src\dma.c":53
	LINK 0;
	.align 2
	[--SP] = (R7:5);
	SP += -12;
.LN58:
// line 54
	R3 = R0;
	R7 = R2;
	R6 = R1;
	CALL.X (_wait_until_mdma1_stream0_is_paused_or_stopped);
	R0 = 32;
.LN59:
// line 55
	P1 = 8016 /* -4186288 */;
	P1.H = -64 /* -4186288 */;
	R1 = R6 << 10 || W[P1] = R0.L;
.LN60:
// line 56
	P1 = 7952 /* -4186352 */;
	P1.H = -64 /* -4186352 */;
	R2.L = _ASIC_pedestal;
	R2.H = _ASIC_pedestal;
	R1 = R2 + R1 (NS) || W[P1] = R0.L;
	R5 = 4;
.LN61:
// line 57
	P1 = 8020 /* -4186284 */;
	P1.H = -64 /* -4186284 */;
.LN62:
// line 61
	R0 = R7 << 2 || W[P1] = R5.L;
.LN63:
// line 58
	P1 = 7956 /* -4186348 */;
	P1.H = -64 /* -4186348 */;
.LN64:
// line 61
	R0 = R1 + R0 (NS) || W[P1] = R5.L;
.LN65:
// line 62
	R1 = 97;
.LN66:
// line 61
	P1 = 8004 /* -4186300 */;
	P1.H = -64 /* -4186300 */;
.LN67:
// line 62
	CC = R3 == R1;
.LN68:
// line 61
	[P1] = R0;
.LN69:
// line 63
	P1 = 7940 /* -4186364 */;
	P1.H = -64 /* -4186364 */;
.LN70:
// line 62
	if !CC jump .P50L2 ;

.P50L1:
	R0.L = _pedestal_a;
	R0.H = _pedestal_a;
.LN71:
// line 63
	[P1] = R0;
	jump .P50L4;

	.align 4
.P50L2:
	R0.L = _pedestal_b;
	R0.H = _pedestal_b;
	.align 2
.LN72:
// line 65
	[P1] = R0;

.P50L4:
.LN73:
// line 69
	R0 = 8;
	P1.L = .epcbss+2;
	P1.H = .epcbss+2;
	W[P1--] = R0;
.LN74:
// line 70
	R0 = 10;
	W[P1] = R0.L;
.LN75:
// line "C:\Program Files\Analog Devices\VisualDSP 5.0\Blackfin\include\builtins.h":3389
	.MESSAGE/SUPPRESS 5515;
		CLI R0;
	.MESSAGE/SUPPRESS 5515 FOR 1 LINES;
		SSYNC;
	.MESSAGE/RESTORE 5515;
		STI R0;
.LN76:
// line "..\..\src\dma.c":72
	SP += 12;
	P0 = [FP + 4];
	(R7:5) = [SP++];
	UNLINK;
	// -- stall --
	JUMP (P0);
.LN._setup_single_pedestal_dma_transfer_from_l3_buffer_to_l1_buffer.end:
._setup_single_pedestal_dma_transfer_from_l3_buffer_to_l1_buffer.end:
	.global _setup_single_pedestal_dma_transfer_from_l3_buffer_to_l1_buffer;
	.type _setup_single_pedestal_dma_transfer_from_l3_buffer_to_l1_buffer,STT_FUNC;

	.align 4;
_setup_single_delta_t_dma_transfer_from_l3_buffer_to_l1_buffer:
.LN_setup_single_delta_t_dma_transfer_from_l3_buffer_to_l1_buffer:
	.reference _mdma1_D0_config_base_value;
	.reference _wait_until_mdma1_stream0_is_paused_or_stopped;
	.reference _mdma1_S0_config_base_value;
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 16 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P1,ASTAT0-ASTAT1,CC}
//   Call preserved registers used:{R7.L,R7.H,FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,P0-P2,ASTAT0-ASTAT1,CC,LC0,LT0,LB0,RETS}
//Inlined in _setup_single_delta_t_dma_transfer_from_l3_buffer_to_l1_buffer:
//  ..\..\src\dma.c:90:7'_ssync
//-------------------------------------------------------------------
// line "..\..\src\dma.c":74
	LINK 16;
	.align 2
	R3 = ROT R0 BY 0 || [SP + 12] = R7;
.LN77:
// line 75
	R7 = R1;
	CALL.X (_wait_until_mdma1_stream0_is_paused_or_stopped);
	R0 = 32;
.LN78:
// line 76
	P1 = 8016 /* -4186288 */;
	P1.H = -64 /* -4186288 */;
	R2 = R7 << 7 || W[P1] = R0.L;
.LN79:
// line 77
	P1 = 7952 /* -4186352 */;
	P1.H = -64 /* -4186352 */;
	W[P1] = R0.L;
	R1 = 4;
.LN80:
// line 78
	P1 = 8020 /* -4186284 */;
	P1.H = -64 /* -4186284 */;
	W[P1] = R1.L;
.LN81:
// line 79
	P1 = 7956 /* -4186348 */;
	P1.H = -64 /* -4186348 */;
	R0.L = _ASIC_delta_t;
	R0.H = _ASIC_delta_t;
	R0 = R0 + R2 (NS) || W[P1] = R1.L;
.LN82:
// line 81
	R1 = 97;
.LN83:
// line 80
	P1 = 8004 /* -4186300 */;
	P1.H = -64 /* -4186300 */;
.LN84:
// line 81
	CC = R3 == R1;
.LN85:
// line 80
	[P1] = R0;
.LN86:
// line 82
	P1 = 7940 /* -4186364 */;
	P1.H = -64 /* -4186364 */;
.LN87:
// line 81
	if !CC jump .P51L2 ;

.P51L1:
	R0.L = _delta_t_a;
	R0.H = _delta_t_a;
.LN88:
// line 82
	[P1] = R0;
	jump .P51L4;

	.align 4
.P51L2:
	R0.L = _delta_t_b;
	R0.H = _delta_t_b;
	.align 2
.LN89:
// line 84
	[P1] = R0;

.P51L4:
.LN90:
// line 88
	R0 = 8;
	P1.L = .epcbss+2;
	P1.H = .epcbss+2;
	W[P1--] = R0;
.LN91:
// line 89
	R0 = 10;
	W[P1] = R0.L;
.LN92:
// line "C:\Program Files\Analog Devices\VisualDSP 5.0\Blackfin\include\builtins.h":3389
	.MESSAGE/SUPPRESS 5515;
		CLI R0;
	.MESSAGE/SUPPRESS 5515 FOR 1 LINES;
		SSYNC;
	.MESSAGE/RESTORE 5515;
		STI R0;
.LN93:
// line "..\..\src\dma.c":91
	P0 = [FP + 4];
	R7 = [SP + 12];
	UNLINK;
	// -- stall --
	JUMP (P0);
.LN._setup_single_delta_t_dma_transfer_from_l3_buffer_to_l1_buffer.end:
._setup_single_delta_t_dma_transfer_from_l3_buffer_to_l1_buffer.end:
	.global _setup_single_delta_t_dma_transfer_from_l3_buffer_to_l1_buffer;
	.type _setup_single_delta_t_dma_transfer_from_l3_buffer_to_l1_buffer,STT_FUNC;

	.align 4;
_setup_ppi_transfers_from_fpga_via_ppi0:
.LN_setup_ppi_transfers_from_fpga_via_ppi0:
	.reference _ppi0_control_base_value;
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,R2.L,P0-P1,ASTAT0-ASTAT1}
//   Call preserved registers used:{FP,SP,RETS}
//Inlined in _setup_ppi_transfers_from_fpga_via_ppi0:
//  ..\..\src\dma.c:108:7'_ssync
//-------------------------------------------------------------------
// line "..\..\src\dma.c":100
	LINK 0;
	.align 2
	R0 = -18036;
	P1.L = .epcbss+6;
	P1.H = .epcbss+6;
.LN94:
// line 103
	R2.L = R2.L - R2.L (NS) || W[P1] = R0.L;
.LN95:
// line 104
	P1 = 4096 /* -4190208 */;
	P1.H = -64 /* -4190208 */;
	W[P1] = R0.L;
.LN96:
// line 105
	P1 = 4108 /* -4190196 */;
	P1.H = -64 /* -4190196 */;
	W[P1] = R2.L;
	R1 = 127;
.LN97:
// line 107
	P1 = 4104 /* -4190200 */;
	P1.H = -64 /* -4190200 */;
	W[P1] = R1.L;
.LN98:
// line "C:\Program Files\Analog Devices\VisualDSP 5.0\Blackfin\include\builtins.h":3389
	.MESSAGE/SUPPRESS 5515;
		CLI R0;
	.MESSAGE/SUPPRESS 5515 FOR 1 LINES;
		SSYNC;
	.MESSAGE/RESTORE 5515;
		STI R0;
.LN99:
// line "..\..\src\dma.c":109
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);
.LN._setup_ppi_transfers_from_fpga_via_ppi0.end:
._setup_ppi_transfers_from_fpga_via_ppi0.end:
	.global _setup_ppi_transfers_from_fpga_via_ppi0;
	.type _setup_ppi_transfers_from_fpga_via_ppi0,STT_FUNC;

	.align 4;
_enable_ppi_transfers_from_fpga_via_ppi0:
.LN_enable_ppi_transfers_from_fpga_via_ppi0:
	.reference _ppi0_control_base_value;
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,R0.H,P0-P1,ASTAT0-ASTAT1}
//   Call preserved registers used:{FP,SP,RETS}
//Inlined in _enable_ppi_transfers_from_fpga_via_ppi0:
//  ..\..\src\dma.c:113:7'_ssync
//-------------------------------------------------------------------
// line "..\..\src\dma.c":111
	LINK 0;
	.align 2
	P1.L = .epcbss+6;
	P1.H = .epcbss+6;
.LN100:
// line 112
	R0.L = W[P1];
	BITSET(R0, 0);
	P1 = 4096 /* -4190208 */;
	P1.H = -64 /* -4190208 */;
	W[P1] = R0.L;
.LN101:
// line "C:\Program Files\Analog Devices\VisualDSP 5.0\Blackfin\include\builtins.h":3389
	.MESSAGE/SUPPRESS 5515;
		CLI R0;
	.MESSAGE/SUPPRESS 5515 FOR 1 LINES;
		SSYNC;
	.MESSAGE/RESTORE 5515;
		STI R0;
.LN102:
// line "..\..\src\dma.c":114
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);
.LN._enable_ppi_transfers_from_fpga_via_ppi0.end:
._enable_ppi_transfers_from_fpga_via_ppi0.end:
	.global _enable_ppi_transfers_from_fpga_via_ppi0;
	.type _enable_ppi_transfers_from_fpga_via_ppi0,STT_FUNC;

	.align 4;
_setup_dma_transfers_from_fpga_via_ppi0:
.LN_setup_dma_transfers_from_fpga_via_ppi0:
	.reference _init_dma;
	.reference _dma_configuration_register;
	.reference _dma1_0_config_base_value;
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 36 
//   Scratch registers used:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,P0-P1,ASTAT0-ASTAT1}
//   Call preserved registers used:{FP,SP,RETS}
//   Registers that could be clobbered by function calls:{R0.L,R0.H,R1.L,R1.H,R2.L,R2.H,R3.L,R3.H,P0-P2,ASTAT0-ASTAT1,RETS}
//Inlined in _setup_dma_transfers_from_fpga_via_ppi0:
//  ..\..\src\dma.c:151:7'_ssync
//-------------------------------------------------------------------
// line "..\..\src\dma.c":138
	LINK 36;
	.align 2
.LN103:
// line 139
	CALL.X (_init_dma);
	R2.L = _dma_descriptor;
	R2.H = _dma_descriptor;
.LN104:
// line 141
	P1 = 7168 /* -4187136 */;
	P1.H = -64 /* -4187136 */;
	R2 = R2 - R2 (NS) || [P1] = R2;
	R0 = 64;
.LN105:
// line 142
	P1 = 7184 /* -4187120 */;
	P1.H = -64 /* -4187120 */;
	W[P1] = R0.L;
	R1 = -4;
.LN106:
// line 143
	P1 = 7188 /* -4187116 */;
	P1.H = -64 /* -4187116 */;
	W[P1] = R1.L;
.LN107:
// line 146
	P1 = 0;
	[SP + 32] = P1;
	[SP + 20] = P1;
	[SP + 12] = P1;
	P1 = 1;
	[SP + 28] = P1;
	[SP + 16] = P1;
	P1 = 2;
	[SP + 24] = P1;
	R0 = 7;
	R1 = 4;
	CALL.X (_dma_configuration_register);
	P1.L = .epcbss+4;
	P1.H = .epcbss+4;
.LN108:
	W[P1] = R0.L;
.LN109:
// line 150
	P1 = 7176 /* -4187128 */;
	P1.H = -64 /* -4187128 */;
	W[P1] = R0.L;
.LN110:
// line "C:\Program Files\Analog Devices\VisualDSP 5.0\Blackfin\include\builtins.h":3389
	.MESSAGE/SUPPRESS 5515;
		CLI R0;
	.MESSAGE/SUPPRESS 5515 FOR 1 LINES;
		SSYNC;
	.MESSAGE/RESTORE 5515;
		STI R0;
.LN111:
// line "..\..\src\dma.c":152
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);
.LN._setup_dma_transfers_from_fpga_via_ppi0.end:
._setup_dma_transfers_from_fpga_via_ppi0.end:
	.global _setup_dma_transfers_from_fpga_via_ppi0;
	.type _setup_dma_transfers_from_fpga_via_ppi0,STT_FUNC;

	.align 4;
_setup_interrupts_for_dma_transfers_from_fpga_via_ppi0:
.LN_setup_interrupts_for_dma_transfers_from_fpga_via_ppi0:
	.reference _dma1_0_config_base_value;
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,R0.H,P0-P1,ASTAT0-ASTAT1}
//   Call preserved registers used:{FP,SP,RETS}
//Inlined in _setup_interrupts_for_dma_transfers_from_fpga_via_ppi0:
//  ..\..\src\dma.c:163:7'_ssync
//-------------------------------------------------------------------
// line "..\..\src\dma.c":154
	LINK 0;
	.align 2
.LN112:
// line 156
	P1 = 8224 /* -2088928 */;
	P1.H = -32 /* -2088928 */;
	R0.L = _finished_getting_waveform_from_fpga_interrupt_service_routine;
	R0.H = _finished_getting_waveform_from_fpga_interrupt_service_routine;
	[P1] = R0;
.LN113:
// line 158
	P1 = 268 /* -4194036 */;
	P1.H = -64 /* -4194036 */;
	R0 = [P1];
	BITSET(R0, 11);
	[P1] = R0;
.LN114:
// line 160
	P1 = 8452 /* -2088700 */;
	P1.H = -32 /* -2088700 */;
	R0 = [P1];
	BITSET(R0, 8);
	[P1] = R0;
	P1.L = .epcbss+4;
	P1.H = .epcbss+4;
.LN115:
// line 161
	R0.L = W[P1];
	BITSET(R0, 7);
	W[P1] = R0.L;
.LN116:
// line 162
	P1 = 7176 /* -4187128 */;
	P1.H = -64 /* -4187128 */;
	W[P1] = R0.L;
.LN117:
// line "C:\Program Files\Analog Devices\VisualDSP 5.0\Blackfin\include\builtins.h":3389
	.MESSAGE/SUPPRESS 5515;
		CLI R0;
	.MESSAGE/SUPPRESS 5515 FOR 1 LINES;
		SSYNC;
	.MESSAGE/RESTORE 5515;
		STI R0;
.LN118:
// line "..\..\src\dma.c":164
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);
.LN._setup_interrupts_for_dma_transfers_from_fpga_via_ppi0.end:
._setup_interrupts_for_dma_transfers_from_fpga_via_ppi0.end:
	.global _setup_interrupts_for_dma_transfers_from_fpga_via_ppi0;
	.type _setup_interrupts_for_dma_transfers_from_fpga_via_ppi0,STT_FUNC;

	.align 4;
_disable_interrupts_for_dma_transfers_from_fpga_via_ppi0:
.LN_disable_interrupts_for_dma_transfers_from_fpga_via_ppi0:
	.reference _dma1_0_config_base_value;
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,R0.H,P0-P1,ASTAT0-ASTAT1}
//   Call preserved registers used:{FP,SP,RETS}
//Inlined in _disable_interrupts_for_dma_transfers_from_fpga_via_ppi0:
//  ..\..\src\dma.c:171:7'_ssync
//-------------------------------------------------------------------
// line "..\..\src\dma.c":166
	LINK 0;
	.align 2
.LN119:
// line 167
	P1 = 268 /* -4194036 */;
	P1.H = -64 /* -4194036 */;
	R0 = [P1];
	BITCLR(R0, 11);
	[P1] = R0;
.LN120:
// line 169
	P1 = 8452 /* -2088700 */;
	P1.H = -32 /* -2088700 */;
	R0 = [P1];
	BITCLR(R0, 8);
	[P1] = R0;
	P1.L = .epcbss+4;
	P1.H = .epcbss+4;
.LN121:
// line 170
	R0.L = W[P1];
	BITCLR(R0, 7);
	W[P1] = R0.L;
.LN122:
// line "C:\Program Files\Analog Devices\VisualDSP 5.0\Blackfin\include\builtins.h":3389
	.MESSAGE/SUPPRESS 5515;
		CLI R0;
	.MESSAGE/SUPPRESS 5515 FOR 1 LINES;
		SSYNC;
	.MESSAGE/RESTORE 5515;
		STI R0;
.LN123:
// line "..\..\src\dma.c":172
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);
.LN._disable_interrupts_for_dma_transfers_from_fpga_via_ppi0.end:
._disable_interrupts_for_dma_transfers_from_fpga_via_ppi0.end:
	.global _disable_interrupts_for_dma_transfers_from_fpga_via_ppi0;
	.type _disable_interrupts_for_dma_transfers_from_fpga_via_ppi0,STT_FUNC;

	.align 4;
_enable_dma_transfers_from_fpga_via_ppi0:
.LN_enable_dma_transfers_from_fpga_via_ppi0:
	.reference _dma1_0_config_base_value;
//-------------------------------------------------------------------
//   Procedure statistics:
//   Frame size            = 0 
//   Scratch registers used:{R0.L,R0.H,P0-P1,ASTAT0-ASTAT1}
//   Call preserved registers used:{FP,SP,RETS}
//Inlined in _enable_dma_transfers_from_fpga_via_ppi0:
//  ..\..\src\dma.c:176:7'_ssync
//-------------------------------------------------------------------
// line "..\..\src\dma.c":174
	LINK 0;
	.align 2
	P1.L = .epcbss+4;
	P1.H = .epcbss+4;
.LN124:
// line 175
	R0.L = W[P1];
	BITSET(R0, 0);
	P1 = 7176 /* -4187128 */;
	P1.H = -64 /* -4187128 */;
	W[P1] = R0.L;
.LN125:
// line "C:\Program Files\Analog Devices\VisualDSP 5.0\Blackfin\include\builtins.h":3389
	.MESSAGE/SUPPRESS 5515;
		CLI R0;
	.MESSAGE/SUPPRESS 5515 FOR 1 LINES;
		SSYNC;
	.MESSAGE/RESTORE 5515;
		STI R0;
.LN126:
// line "..\..\src\dma.c":177
	P0 = [FP + 4];
	UNLINK;
	// -- 2 stalls --
	JUMP (P0);
.LN._enable_dma_transfers_from_fpga_via_ppi0.end:
._enable_dma_transfers_from_fpga_via_ppi0.end:
	.global _enable_dma_transfers_from_fpga_via_ppi0;
	.type _enable_dma_transfers_from_fpga_via_ppi0,STT_FUNC;

	.file_attr ProjectName="CoreA";
	.file_attr FuncName="_acknowledge_interrupt_for_completion_of_waveform_transfer_from_fpga";
	.file_attr FuncName="_dma_configuration_register";
	.file_attr FuncName="_init_dma";
	.file_attr FuncName="_wait_until_mdma1_stream0_is_paused_or_stopped";
	.file_attr FuncName="_ssync";
	.file_attr FuncName="_initiate_dma_transfer_from_l3_buffer_to_l1_buffer";
	.file_attr FuncName="_setup_single_waveform_dma_transfer_from_l3_buffer_to_l1_buffer";
	.file_attr FuncName="_setup_single_pedestal_dma_transfer_from_l3_buffer_to_l1_buffer";
	.file_attr FuncName="_setup_single_delta_t_dma_transfer_from_l3_buffer_to_l1_buffer";
	.file_attr FuncName="_setup_ppi_transfers_from_fpga_via_ppi0";
	.file_attr FuncName="_enable_ppi_transfers_from_fpga_via_ppi0";
	.file_attr FuncName="_setup_dma_transfers_from_fpga_via_ppi0";
	.file_attr FuncName="_setup_interrupts_for_dma_transfers_from_fpga_via_ppi0";
	.file_attr FuncName="_disable_interrupts_for_dma_transfers_from_fpga_via_ppi0";
	.file_attr FuncName="_enable_dma_transfers_from_fpga_via_ppi0";
	.file_attr Content="CodeData";
.epctext.end:

	.extern _finished_getting_waveform_from_fpga_interrupt_service_routine;
	.type _finished_getting_waveform_from_fpga_interrupt_service_routine,STT_FUNC;

	.section/ZERO_INIT/DOUBLE32 bsz;

	.align 2;
.epcbss:
	.type .epcbss,STT_OBJECT;
	.byte _mdma1_D0_config_base_value[2];
	.global _mdma1_D0_config_base_value;
	.type _mdma1_D0_config_base_value,STT_OBJECT;
	.byte _mdma1_S0_config_base_value[2];
	.global _mdma1_S0_config_base_value;
	.type _mdma1_S0_config_base_value,STT_OBJECT;
	.byte _dma1_0_config_base_value[2];
	.global _dma1_0_config_base_value;
	.type _dma1_0_config_base_value,STT_OBJECT;
	.byte _ppi0_control_base_value[2];
	.global _ppi0_control_base_value;
	.type _ppi0_control_base_value,STT_OBJECT;
.epcbss.end:

	.section .debug_abbrev SHT_DEBUGINFO;

	.align 1;
.epcabbrev:
	.type .epcabbrev,STT_OBJECT;
	.inc/binary "..\Debug\dma.sbn", 0, 228;
.epcabbrev.end:

	.section .debug_info SHT_DEBUGINFO;

	.align 1;
.epcdebug:
	.type .epcdebug,STT_OBJECT;
	.byte =
		0xBA,0x12,0x00,0x00,0x02,0x00;
	.byte4 = .epcabbrev;
	.byte =
		0x04,0x01,0x2E,0x2E,0x5C,0x2E,0x2E,0x5C,0x73,0x72,0x63,0x5C,
		0x64,0x6D,0x61,0x2E,0x63,0x00,0x01;
	.byte4 = .epcline;
	.inc/binary "..\Debug\dma.sbn", 228, 2643;
	.byte4 = .LN_acknowledge_interrupt_for_completion_of_waveform_transfer_from_fpga;
	.byte4 = .LN._acknowledge_interrupt_for_completion_of_waveform_transfer_from_fpga.end;
	.byte =
		0x01,0x01,0x00,0x0D,0x00,0x00,0x00,0x00;
	.byte4 = .LN0;
	.byte4 = .LN._acknowledge_interrupt_for_completion_of_waveform_transfer_from_fpga.end;
	.byte =
		0x00,0x00,0x0E,0x29,0x0B,0x00,0x00,0x64,0x6D,0x61,0x5F,0x63,
		0x6F,0x6E,0x66,0x69,0x67,0x75,0x72,0x61,0x74,0x69,0x6F,0x6E,
		0x5F,0x72,0x65,0x67,0x69,0x73,0x74,0x65,0x72,0x00,0x01;
	.byte4 = .LN_dma_configuration_register;
	.byte4 = .LN._dma_configuration_register.end;
	.byte =
		0x01,0xA0,0x01,0x00,0x00,0x01,0x00,0x0F,0x64,0x69,0x5F,0x73,
		0x65,0x6C,0x00,0x7F,0x05,0x00,0x00,0x02,0x7F,0x14,0x00,0x0F,
		0x72,0x65,0x73,0x74,0x61,0x72,0x74,0x00,0x7F,0x05,0x00,0x00,
		0x02,0x7F,0x18,0x00,0x0F,0x64,0x6D,0x61,0x32,0x64,0x00,0x7F,
		0x05,0x00,0x00,0x02,0x7F,0x1C,0x00,0x0F,0x77,0x64,0x73,0x69,
		0x7A,0x65,0x00,0x7F,0x05,0x00,0x00,0x02,0x7F,0x20,0x00,0x0F,
		0x77,0x6E,0x72,0x00,0x7F,0x05,0x00,0x00,0x02,0x7F,0x24,0x00,
		0x0F,0x64,0x6D,0x61,0x65,0x6E,0x00,0x7F,0x05,0x00,0x00,0x02,
		0x7F,0x28,0x00,0x0D,0x00,0x00,0x00,0x00;
	.byte4 = .LN2;
	.byte4 = .LN._dma_configuration_register.end;
	.byte =
		0x00,0x00,0x0C,0x52,0x0B,0x00,0x00,0x69,0x6E,0x69,0x74,0x5F,
		0x64,0x6D,0x61,0x00,0x01;
	.byte4 = .LN_init_dma;
	.byte4 = .LN._init_dma.end;
	.byte =
		0x01,0x01,0x00,0x0D,0x00,0x00,0x00,0x00;
	.byte4 = .LN5;
	.byte4 = .LN._init_dma.end;
	.byte =
		0x00,0x00,0x0C,0xA0,0x0B,0x00,0x00,0x77,0x61,0x69,0x74,0x5F,
		0x75,0x6E,0x74,0x69,0x6C,0x5F,0x6D,0x64,0x6D,0x61,0x31,0x5F,
		0x73,0x74,0x72,0x65,0x61,0x6D,0x30,0x5F,0x69,0x73,0x5F,0x70,
		0x61,0x75,0x73,0x65,0x64,0x5F,0x6F,0x72,0x5F,0x73,0x74,0x6F,
		0x70,0x70,0x65,0x64,0x00,0x01;
	.byte4 = .LN_wait_until_mdma1_stream0_is_paused_or_stopped;
	.byte4 = .LN._wait_until_mdma1_stream0_is_paused_or_stopped.end;
	.byte =
		0x01,0x01,0x00,0x0D,0x00,0x00,0x00,0x00;
	.byte4 = .LN27;
	.byte4 = .LN._wait_until_mdma1_stream0_is_paused_or_stopped.end;
	.byte =
		0x00,0x00,0x0C,0xF2,0x0B,0x00,0x00,0x69,0x6E,0x69,0x74,0x69,
		0x61,0x74,0x65,0x5F,0x64,0x6D,0x61,0x5F,0x74,0x72,0x61,0x6E,
		0x73,0x66,0x65,0x72,0x5F,0x66,0x72,0x6F,0x6D,0x5F,0x6C,0x33,
		0x5F,0x62,0x75,0x66,0x66,0x65,0x72,0x5F,0x74,0x6F,0x5F,0x6C,
		0x31,0x5F,0x62,0x75,0x66,0x66,0x65,0x72,0x00,0x01;
	.byte4 = .LN_initiate_dma_transfer_from_l3_buffer_to_l1_buffer;
	.byte4 = .LN._initiate_dma_transfer_from_l3_buffer_to_l1_buffer.end;
	.byte =
		0x01,0x01,0x00,0x0D,0x00,0x00,0x00,0x00;
	.byte4 = .LN36;
	.byte4 = .LN._initiate_dma_transfer_from_l3_buffer_to_l1_buffer.end;
	.byte =
		0x00,0x00,0x0C,0x51,0x0C,0x00,0x00,0x73,0x65,0x74,0x75,0x70,
		0x5F,0x73,0x69,0x6E,0x67,0x6C,0x65,0x5F,0x77,0x61,0x76,0x65,
		0x66,0x6F,0x72,0x6D,0x5F,0x64,0x6D,0x61,0x5F,0x74,0x72,0x61,
		0x6E,0x73,0x66,0x65,0x72,0x5F,0x66,0x72,0x6F,0x6D,0x5F,0x6C,
		0x33,0x5F,0x62,0x75,0x66,0x66,0x65,0x72,0x5F,0x74,0x6F,0x5F,
		0x6C,0x31,0x5F,0x62,0x75,0x66,0x66,0x65,0x72,0x00,0x01;
	.byte4 = .LN_setup_single_waveform_dma_transfer_from_l3_buffer_to_l1_buffer;
	.byte4 = .LN._setup_single_waveform_dma_transfer_from_l3_buffer_to_l1_buffer.end;
	.byte =
		0x01,0x01,0x00,0x0D,0x00,0x00,0x00,0x00;
	.byte4 = .LN41;
	.byte4 = .LN._setup_single_waveform_dma_transfer_from_l3_buffer_to_l1_buffer.end;
	.byte =
		0x00,0x00,0x0C,0xB0,0x0C,0x00,0x00,0x73,0x65,0x74,0x75,0x70,
		0x5F,0x73,0x69,0x6E,0x67,0x6C,0x65,0x5F,0x70,0x65,0x64,0x65,
		0x73,0x74,0x61,0x6C,0x5F,0x64,0x6D,0x61,0x5F,0x74,0x72,0x61,
		0x6E,0x73,0x66,0x65,0x72,0x5F,0x66,0x72,0x6F,0x6D,0x5F,0x6C,
		0x33,0x5F,0x62,0x75,0x66,0x66,0x65,0x72,0x5F,0x74,0x6F,0x5F,
		0x6C,0x31,0x5F,0x62,0x75,0x66,0x66,0x65,0x72,0x00,0x01;
	.byte4 = .LN_setup_single_pedestal_dma_transfer_from_l3_buffer_to_l1_buffer;
	.byte4 = .LN._setup_single_pedestal_dma_transfer_from_l3_buffer_to_l1_buffer.end;
	.byte =
		0x01,0x01,0x00,0x0D,0x00,0x00,0x00,0x00;
	.byte4 = .LN58;
	.byte4 = .LN._setup_single_pedestal_dma_transfer_from_l3_buffer_to_l1_buffer.end;
	.byte =
		0x00,0x00,0x0C,0x0E,0x0D,0x00,0x00,0x73,0x65,0x74,0x75,0x70,
		0x5F,0x73,0x69,0x6E,0x67,0x6C,0x65,0x5F,0x64,0x65,0x6C,0x74,
		0x61,0x5F,0x74,0x5F,0x64,0x6D,0x61,0x5F,0x74,0x72,0x61,0x6E,
		0x73,0x66,0x65,0x72,0x5F,0x66,0x72,0x6F,0x6D,0x5F,0x6C,0x33,
		0x5F,0x62,0x75,0x66,0x66,0x65,0x72,0x5F,0x74,0x6F,0x5F,0x6C,
		0x31,0x5F,0x62,0x75,0x66,0x66,0x65,0x72,0x00,0x01;
	.byte4 = .LN_setup_single_delta_t_dma_transfer_from_l3_buffer_to_l1_buffer;
	.byte4 = .LN._setup_single_delta_t_dma_transfer_from_l3_buffer_to_l1_buffer.end;
	.byte =
		0x01,0x01,0x00,0x0D,0x00,0x00,0x00,0x00;
	.byte4 = .LN77;
	.byte4 = .LN._setup_single_delta_t_dma_transfer_from_l3_buffer_to_l1_buffer.end;
	.byte =
		0x00,0x00,0x0C,0x55,0x0D,0x00,0x00,0x73,0x65,0x74,0x75,0x70,
		0x5F,0x70,0x70,0x69,0x5F,0x74,0x72,0x61,0x6E,0x73,0x66,0x65,
		0x72,0x73,0x5F,0x66,0x72,0x6F,0x6D,0x5F,0x66,0x70,0x67,0x61,
		0x5F,0x76,0x69,0x61,0x5F,0x70,0x70,0x69,0x30,0x00,0x01;
	.byte4 = .LN_setup_ppi_transfers_from_fpga_via_ppi0;
	.byte4 = .LN._setup_ppi_transfers_from_fpga_via_ppi0.end;
	.byte =
		0x01,0x01,0x00,0x0D,0x00,0x00,0x00,0x00;
	.byte4 = .LN94;
	.byte4 = .LN._setup_ppi_transfers_from_fpga_via_ppi0.end;
	.byte =
		0x00,0x00,0x0C,0x9D,0x0D,0x00,0x00,0x65,0x6E,0x61,0x62,0x6C,
		0x65,0x5F,0x70,0x70,0x69,0x5F,0x74,0x72,0x61,0x6E,0x73,0x66,
		0x65,0x72,0x73,0x5F,0x66,0x72,0x6F,0x6D,0x5F,0x66,0x70,0x67,
		0x61,0x5F,0x76,0x69,0x61,0x5F,0x70,0x70,0x69,0x30,0x00,0x01;
	.byte4 = .LN_enable_ppi_transfers_from_fpga_via_ppi0;
	.byte4 = .LN._enable_ppi_transfers_from_fpga_via_ppi0.end;
	.byte =
		0x01,0x01,0x00,0x0D,0x00,0x00,0x00,0x00;
	.byte4 = .LN100;
	.byte4 = .LN._enable_ppi_transfers_from_fpga_via_ppi0.end;
	.byte =
		0x00,0x00,0x0C,0xE4,0x0D,0x00,0x00,0x73,0x65,0x74,0x75,0x70,
		0x5F,0x64,0x6D,0x61,0x5F,0x74,0x72,0x61,0x6E,0x73,0x66,0x65,
		0x72,0x73,0x5F,0x66,0x72,0x6F,0x6D,0x5F,0x66,0x70,0x67,0x61,
		0x5F,0x76,0x69,0x61,0x5F,0x70,0x70,0x69,0x30,0x00,0x01;
	.byte4 = .LN_setup_dma_transfers_from_fpga_via_ppi0;
	.byte4 = .LN._setup_dma_transfers_from_fpga_via_ppi0.end;
	.byte =
		0x01,0x01,0x00,0x0D,0x00,0x00,0x00,0x00;
	.byte4 = .LN103;
	.byte4 = .LN._setup_dma_transfers_from_fpga_via_ppi0.end;
	.byte =
		0x00,0x00,0x0C,0x3A,0x0E,0x00,0x00,0x73,0x65,0x74,0x75,0x70,
		0x5F,0x69,0x6E,0x74,0x65,0x72,0x72,0x75,0x70,0x74,0x73,0x5F,
		0x66,0x6F,0x72,0x5F,0x64,0x6D,0x61,0x5F,0x74,0x72,0x61,0x6E,
		0x73,0x66,0x65,0x72,0x73,0x5F,0x66,0x72,0x6F,0x6D,0x5F,0x66,
		0x70,0x67,0x61,0x5F,0x76,0x69,0x61,0x5F,0x70,0x70,0x69,0x30,
		0x00,0x01;
	.byte4 = .LN_setup_interrupts_for_dma_transfers_from_fpga_via_ppi0;
	.byte4 = .LN._setup_interrupts_for_dma_transfers_from_fpga_via_ppi0.end;
	.byte =
		0x01,0x01,0x00,0x0D,0x00,0x00,0x00,0x00;
	.byte4 = .LN112;
	.byte4 = .LN._setup_interrupts_for_dma_transfers_from_fpga_via_ppi0.end;
	.byte =
		0x00,0x00,0x0C,0x92,0x0E,0x00,0x00,0x64,0x69,0x73,0x61,0x62,
		0x6C,0x65,0x5F,0x69,0x6E,0x74,0x65,0x72,0x72,0x75,0x70,0x74,
		0x73,0x5F,0x66,0x6F,0x72,0x5F,0x64,0x6D,0x61,0x5F,0x74,0x72,
		0x61,0x6E,0x73,0x66,0x65,0x72,0x73,0x5F,0x66,0x72,0x6F,0x6D,
		0x5F,0x66,0x70,0x67,0x61,0x5F,0x76,0x69,0x61,0x5F,0x70,0x70,
		0x69,0x30,0x00,0x01;
	.byte4 = .LN_disable_interrupts_for_dma_transfers_from_fpga_via_ppi0;
	.byte4 = .LN._disable_interrupts_for_dma_transfers_from_fpga_via_ppi0.end;
	.byte =
		0x01,0x01,0x00,0x0D,0x00,0x00,0x00,0x00;
	.byte4 = .LN119;
	.byte4 = .LN._disable_interrupts_for_dma_transfers_from_fpga_via_ppi0.end;
	.byte =
		0x00,0x00,0x0C,0xDA,0x0E,0x00,0x00,0x65,0x6E,0x61,0x62,0x6C,
		0x65,0x5F,0x64,0x6D,0x61,0x5F,0x74,0x72,0x61,0x6E,0x73,0x66,
		0x65,0x72,0x73,0x5F,0x66,0x72,0x6F,0x6D,0x5F,0x66,0x70,0x67,
		0x61,0x5F,0x76,0x69,0x61,0x5F,0x70,0x70,0x69,0x30,0x00,0x01;
	.byte4 = .LN_enable_dma_transfers_from_fpga_via_ppi0;
	.byte4 = .LN._enable_dma_transfers_from_fpga_via_ppi0.end;
	.byte =
		0x01,0x01,0x00,0x0D,0x00,0x00,0x00,0x00;
	.byte4 = .LN124;
	.byte4 = .LN._enable_dma_transfers_from_fpga_via_ppi0.end;
	.byte =
		0x00,0x00,0x10,0x41,0x53,0x49,0x43,0x5F,0x70,0x65,0x64,0x65,
		0x73,0x74,0x61,0x6C,0x00,0x01,0xAF,0x12,0x00,0x00,0x05,0x0C;
	.byte4 = _ASIC_pedestal;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x10,0x41,0x53,0x49,0x43,0x5F,0x64,
		0x65,0x6C,0x74,0x61,0x5F,0x74,0x00,0x01,0x91,0x12,0x00,0x00,
		0x05,0x0C;
	.byte4 = _ASIC_delta_t;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x10,0x70,0x65,0x64,0x65,0x73,0x74,
		0x61,0x6C,0x5F,0x61,0x00,0x01,0x75,0x12,0x00,0x00,0x05,0x0C;
	.byte4 = _pedestal_a;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x10,0x70,0x65,0x64,0x65,0x73,0x74,
		0x61,0x6C,0x5F,0x62,0x00,0x01,0x67,0x12,0x00,0x00,0x05,0x0C;
	.byte4 = _pedestal_b;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x10,0x64,0x65,0x6C,0x74,0x61,0x5F,
		0x74,0x5F,0x61,0x00,0x01,0x59,0x12,0x00,0x00,0x05,0x0C;
	.byte4 = _delta_t_a;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x10,0x64,0x65,0x6C,0x74,0x61,0x5F,
		0x74,0x5F,0x62,0x00,0x01,0x4B,0x12,0x00,0x00,0x05,0x0C;
	.byte4 = _delta_t_b;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x10,0x77,0x61,0x76,0x65,0x66,0x6F,
		0x72,0x6D,0x5F,0x61,0x00,0x01,0x3C,0x12,0x00,0x00,0x05,0x0C;
	.byte4 = _waveform_a;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x10,0x77,0x61,0x76,0x65,0x66,0x6F,
		0x72,0x6D,0x5F,0x62,0x00,0x01,0x2D,0x12,0x00,0x00,0x05,0x0C;
	.byte4 = _waveform_b;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x10,0x64,0x6D,0x61,0x5F,0x64,0x65,
		0x73,0x63,0x72,0x69,0x70,0x74,0x6F,0x72,0x00,0x01,0x1F,0x12,
		0x00,0x00,0x05,0x0C;
	.byte4 = _dma_descriptor;
	.byte =
		0x00,0x00,0x00,0x00,0x01,0x10,0x62,0x75,0x66,0x66,0x65,0x72,
		0x30,0x00,0x01,0x11,0x12,0x00,0x00,0x05,0x0C;
	.byte4 = _buffer0;
	.inc/binary "..\Debug\dma.sbn", 2871, 393;
	.byte4 = _mdma1_D0_config_base_value;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x10,0x6D,0x64,0x6D,0x61,0x31,0x5F,
		0x53,0x30,0x5F,0x63,0x6F,0x6E,0x66,0x69,0x67,0x5F,0x62,0x61,
		0x73,0x65,0x5F,0x76,0x61,0x6C,0x75,0x65,0x00,0x01,0xA0,0x01,
		0x00,0x00,0x05,0x0C;
	.byte4 = _mdma1_S0_config_base_value;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x10,0x64,0x6D,0x61,0x31,0x5F,0x30,
		0x5F,0x63,0x6F,0x6E,0x66,0x69,0x67,0x5F,0x62,0x61,0x73,0x65,
		0x5F,0x76,0x61,0x6C,0x75,0x65,0x00,0x01,0xA0,0x01,0x00,0x00,
		0x05,0x0C;
	.byte4 = _dma1_0_config_base_value;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x10,0x70,0x70,0x69,0x30,0x5F,0x63,
		0x6F,0x6E,0x74,0x72,0x6F,0x6C,0x5F,0x62,0x61,0x73,0x65,0x5F,
		0x76,0x61,0x6C,0x75,0x65,0x00,0x01,0xA0,0x01,0x00,0x00,0x05,
		0x0C;
	.byte4 = _ppi0_control_base_value;
	.inc/binary "..\Debug\dma.sbn", 3264, 193;
.epcdebug.end:

	.section .debug_line SHT_DEBUGINFO;

	.align 1;
.epcline:
	.type .epcline,STT_OBJECT;
	.inc/binary "..\Debug\dma.sbn", 3457, 1918;
	.byte4 = .LN_acknowledge_interrupt_for_completion_of_waveform_transfer_from_fpga;
	.byte =
		0x04,0x01,0x05,0x50,0xBB,0x00,0x05,0x02;
	.byte4 = .LN0;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN1;
	.byte =
		0x05,0x01,0x0A,0x00,0x05,0x02;
	.byte4 = .LN._acknowledge_interrupt_for_completion_of_waveform_transfer_from_fpga.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_dma_configuration_register;
	.byte =
		0x04,0x01,0x05,0x46,0x8C,0x00,0x05,0x02;
	.byte4 = .LN2;
	.byte =
		0x05,0x02,0x0C,0x00,0x05,0x02;
	.byte4 = .LN3;
	.byte =
		0x05,0x46,0x03,0x7D,0x01,0x00,0x05,0x02;
	.byte4 = .LN4;
	.byte =
		0x05,0x02,0x0C,0x00,0x05,0x02;
	.byte4 = .LN._dma_configuration_register.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_init_dma;
	.byte =
		0x04,0x01,0x05,0x15,0x7C,0x00,0x05,0x02;
	.byte4 = .LN5;
	.byte =
		0x05,0x03,0x0D,0x00,0x05,0x02;
	.byte4 = .LN6;
	.byte =
		0x05,0x15,0x03,0x7C,0x01,0x00,0x05,0x02;
	.byte4 = .LN7;
	.byte =
		0x05,0x03,0x0D,0x00,0x05,0x02;
	.byte4 = .LN8;
	.byte =
		0x05,0x15,0x03,0x7C,0x01,0x00,0x05,0x02;
	.byte4 = .LN9;
	.byte =
		0x05,0x02,0x13,0x00,0x05,0x02;
	.byte4 = .LN10;
	.byte =
		0x05,0x03,0x03,0x7C,0x01,0x00,0x05,0x02;
	.byte4 = .LN11;
	.byte =
		0x03,0x7E,0x01,0x00,0x05,0x02;
	.byte4 = .LN12;
	.byte =
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN13;
	.byte =
		0x03,0x7D,0x01,0x00,0x05,0x02;
	.byte4 = .LN14;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN15;
	.byte =
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN16;
	.byte =
		0x03,0x7D,0x01,0x00,0x05,0x02;
	.byte4 = .LN17;
	.byte =
		0x0C,0x00,0x05,0x02;
	.byte4 = .LN18;
	.byte =
		0x03,0x7E,0x01,0x00,0x05,0x02;
	.byte4 = .LN19;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN20;
	.byte =
		0x05,0x02,0x10,0x00,0x05,0x02;
	.byte4 = .LN21;
	.byte =
		0x05,0x03,0x03,0x7A,0x01,0x00,0x05,0x02;
	.byte4 = .LN22;
	.byte =
		0x05,0x02,0x0F,0x00,0x05,0x02;
	.byte4 = .LN23;
	.byte =
		0x03,0x7D,0x01,0x00,0x05,0x02;
	.byte4 = .LN24;
	.byte =
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN25;
	.byte =
		0x03,0x7E,0x01,0x00,0x05,0x02;
	.byte4 = .LN26;
	.byte =
		0x05,0x01,0x0D,0x00,0x05,0x02;
	.byte4 = .LN._init_dma.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_wait_until_mdma1_stream0_is_paused_or_stopped;
	.byte =
		0x04,0x01,0x05,0x3A,0x1F,0x00,0x05,0x02;
	.byte4 = .LN27;
	.byte =
		0x05,0x03,0x0D,0x00,0x05,0x02;
	.byte4 = .LN28;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN29;
	.byte =
		0x05,0x02,0x03,0x7E,0x01,0x00,0x05,0x02;
	.byte4 = .LN30;
	.byte =
		0x05,0x03,0x0A,0x00,0x05,0x02;
	.byte4 = .LN31;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN32;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN33;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN34;
	.byte =
		0x05,0x02,0x03,0x7E,0x01,0x00,0x05,0x02;
	.byte4 = .LN35;
	.byte =
		0x05,0x01,0x0F,0x00,0x05,0x02;
	.byte4 = .LN._wait_until_mdma1_stream0_is_paused_or_stopped.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_initiate_dma_transfer_from_l3_buffer_to_l1_buffer;
	.byte =
		0x04,0x01,0x05,0x3E,0x16,0x00,0x05,0x02;
	.byte4 = .LN36;
	.byte =
		0x05,0x2F,0x0A,0x00,0x05,0x02;
	.byte4 = .LN37;
	.byte =
		0x05,0x02,0x0C,0x00,0x05,0x02;
	.byte4 = .LN38;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN39;
	.byte =
		0x04,0x0A,0x05,0x03,0x03,0xAA,0x1A,0x01,0x00,0x05,0x02;
	.byte4 = .LN40;
	.byte =
		0x04,0x01,0x05,0x01,0x03,0xD8,0x65,0x01,0x00,0x05,0x02;
	.byte4 = .LN._initiate_dma_transfer_from_l3_buffer_to_l1_buffer.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_setup_single_waveform_dma_transfer_from_l3_buffer_to_l1_buffer;
	.byte =
		0x04,0x01,0x05,0x78,0x2A,0x00,0x05,0x02;
	.byte4 = .LN41;
	.byte =
		0x05,0x2F,0x0A,0x00,0x05,0x02;
	.byte4 = .LN42;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN43;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN44;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN45;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN46;
	.byte =
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN47;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN48;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN49;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN50;
	.byte =
		0x05,0x03,0x0B,0x00,0x05,0x02;
	.byte4 = .LN51;
	.byte =
		0x05,0x02,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN52;
	.byte =
		0x05,0x03,0x0A,0x00,0x05,0x02;
	.byte4 = .LN53;
	.byte =
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN54;
	.byte =
		0x05,0x02,0x0D,0x00,0x05,0x02;
	.byte4 = .LN55;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN56;
	.byte =
		0x04,0x0A,0x05,0x03,0x03,0x8C,0x1A,0x01,0x00,0x05,0x02;
	.byte4 = .LN57;
	.byte =
		0x04,0x01,0x05,0x01,0x03,0xF6,0x65,0x01,0x00,0x05,0x02;
	.byte4 = .LN._setup_single_waveform_dma_transfer_from_l3_buffer_to_l1_buffer.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_setup_single_pedestal_dma_transfer_from_l3_buffer_to_l1_buffer;
	.byte =
		0x04,0x01,0x05,0xA0,0x01,0x3D,0x00,0x05,0x02;
	.byte4 = .LN58;
	.byte =
		0x05,0x2F,0x0A,0x00,0x05,0x02;
	.byte4 = .LN59;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN60;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN61;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN62;
	.byte =
		0x0D,0x00,0x05,0x02;
	.byte4 = .LN63;
	.byte =
		0x03,0x7D,0x01,0x00,0x05,0x02;
	.byte4 = .LN64;
	.byte =
		0x0C,0x00,0x05,0x02;
	.byte4 = .LN65;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN66;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN67;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN68;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN69;
	.byte =
		0x05,0x03,0x0B,0x00,0x05,0x02;
	.byte4 = .LN70;
	.byte =
		0x05,0x02,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN71;
	.byte =
		0x05,0x03,0x0A,0x00,0x05,0x02;
	.byte4 = .LN72;
	.byte =
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN73;
	.byte =
		0x05,0x02,0x0D,0x00,0x05,0x02;
	.byte4 = .LN74;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN75;
	.byte =
		0x04,0x0A,0x05,0x03,0x03,0xF7,0x19,0x01,0x00,0x05,0x02;
	.byte4 = .LN76;
	.byte =
		0x04,0x01,0x05,0x01,0x03,0x8B,0x66,0x01,0x00,0x05,0x02;
	.byte4 = .LN._setup_single_pedestal_dma_transfer_from_l3_buffer_to_l1_buffer.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_setup_single_delta_t_dma_transfer_from_l3_buffer_to_l1_buffer;
	.byte =
		0x04,0x01,0x05,0x84,0x01,0x52,0x00,0x05,0x02;
	.byte4 = .LN77;
	.byte =
		0x05,0x2F,0x0A,0x00,0x05,0x02;
	.byte4 = .LN78;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
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
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN83;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN84;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN85;
	.byte =
		0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN86;
	.byte =
		0x05,0x03,0x0B,0x00,0x05,0x02;
	.byte4 = .LN87;
	.byte =
		0x05,0x02,0x03,0x7F,0x01,0x00,0x05,0x02;
	.byte4 = .LN88;
	.byte =
		0x05,0x03,0x0A,0x00,0x05,0x02;
	.byte4 = .LN89;
	.byte =
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN90;
	.byte =
		0x05,0x02,0x0D,0x00,0x05,0x02;
	.byte4 = .LN91;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN92;
	.byte =
		0x04,0x0A,0x05,0x03,0x03,0xE4,0x19,0x01,0x00,0x05,0x02;
	.byte4 = .LN93;
	.byte =
		0x04,0x01,0x05,0x01,0x03,0x9E,0x66,0x01,0x00,0x05,0x02;
	.byte4 = .LN._setup_single_delta_t_dma_transfer_from_l3_buffer_to_l1_buffer.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_setup_ppi_transfers_from_fpga_via_ppi0;
	.byte =
		0x04,0x01,0x05,0x33,0x6C,0x00,0x05,0x02;
	.byte4 = .LN94;
	.byte =
		0x05,0x02,0x0C,0x00,0x05,0x02;
	.byte4 = .LN95;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN96;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN97;
	.byte =
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN98;
	.byte =
		0x04,0x0A,0x05,0x03,0x03,0xD2,0x19,0x01,0x00,0x05,0x02;
	.byte4 = .LN99;
	.byte =
		0x04,0x01,0x05,0x01,0x03,0xB0,0x66,0x01,0x00,0x05,0x02;
	.byte4 = .LN._setup_ppi_transfers_from_fpga_via_ppi0.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_enable_ppi_transfers_from_fpga_via_ppi0;
	.byte =
		0x04,0x01,0x05,0x34,0x77,0x00,0x05,0x02;
	.byte4 = .LN100;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN101;
	.byte =
		0x04,0x0A,0x05,0x03,0x03,0xCD,0x19,0x01,0x00,0x05,0x02;
	.byte4 = .LN102;
	.byte =
		0x04,0x01,0x05,0x01,0x03,0xB5,0x66,0x01,0x00,0x05,0x02;
	.byte4 = .LN._enable_ppi_transfers_from_fpga_via_ppi0.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_setup_dma_transfers_from_fpga_via_ppi0;
	.byte =
		0x04,0x01,0x05,0x33,0x92,0x00,0x05,0x02;
	.byte4 = .LN103;
	.byte =
		0x05,0x0A,0x0A,0x00,0x05,0x02;
	.byte4 = .LN104;
	.byte =
		0x05,0x02,0x0B,0x00,0x05,0x02;
	.byte4 = .LN105;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN106;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN107;
	.byte =
		0x05,0x37,0x0C,0x00,0x05,0x02;
	.byte4 = .LN108;
	.byte =
		0x05,0x02,0x01,0x00,0x05,0x02;
	.byte4 = .LN109;
	.byte =
		0x0D,0x00,0x05,0x02;
	.byte4 = .LN110;
	.byte =
		0x04,0x0A,0x05,0x03,0x03,0xA7,0x19,0x01,0x00,0x05,0x02;
	.byte4 = .LN111;
	.byte =
		0x04,0x01,0x05,0x01,0x03,0xDB,0x66,0x01,0x00,0x05,0x02;
	.byte4 = .LN._setup_dma_transfers_from_fpga_via_ppi0.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_setup_interrupts_for_dma_transfers_from_fpga_via_ppi0;
	.byte =
		0x04,0x01,0x05,0x42,0xA2,0x00,0x05,0x02;
	.byte4 = .LN112;
	.byte =
		0x05,0x02,0x0B,0x00,0x05,0x02;
	.byte4 = .LN113;
	.byte =
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN114;
	.byte =
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN115;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN116;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN117;
	.byte =
		0x04,0x0A,0x05,0x03,0x03,0x9B,0x19,0x01,0x00,0x05,0x02;
	.byte4 = .LN118;
	.byte =
		0x04,0x01,0x05,0x01,0x03,0xE7,0x66,0x01,0x00,0x05,0x02;
	.byte4 = .LN._setup_interrupts_for_dma_transfers_from_fpga_via_ppi0.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_disable_interrupts_for_dma_transfers_from_fpga_via_ppi0;
	.byte =
		0x04,0x01,0x05,0x44,0xAE,0x00,0x05,0x02;
	.byte4 = .LN119;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN120;
	.byte =
		0x0B,0x00,0x05,0x02;
	.byte4 = .LN121;
	.byte =
		0x0A,0x00,0x05,0x02;
	.byte4 = .LN122;
	.byte =
		0x04,0x0A,0x05,0x03,0x03,0x93,0x19,0x01,0x00,0x05,0x02;
	.byte4 = .LN123;
	.byte =
		0x04,0x01,0x05,0x01,0x03,0xEF,0x66,0x01,0x00,0x05,0x02;
	.byte4 = .LN._disable_interrupts_for_dma_transfers_from_fpga_via_ppi0.end;
	.byte =
		0x00,0x01,0x01,0x00,0x05,0x02;
	.byte4 = .LN_enable_dma_transfers_from_fpga_via_ppi0;
	.byte =
		0x04,0x01,0x05,0x34,0xB6,0x00,0x05,0x02;
	.byte4 = .LN124;
	.byte =
		0x05,0x02,0x0A,0x00,0x05,0x02;
	.byte4 = .LN125;
	.byte =
		0x04,0x0A,0x05,0x03,0x03,0x8E,0x19,0x01,0x00,0x05,0x02;
	.byte4 = .LN126;
	.byte =
		0x04,0x01,0x05,0x01,0x03,0xF4,0x66,0x01,0x00,0x05,0x02;
	.byte4 = .LN._enable_dma_transfers_from_fpga_via_ppi0.end;
	.byte =
		0x00,0x01,0x01;
.epcline.end:

	.section .annotations SHT_DEBUGINFO;

	.align 1;
.epcannot:
	.type .epcannot,STT_OBJECT;
	.inc/binary "..\Debug\dma.sbn", 5375, 3552;
.epcannot.end:

	.section .debug_pubnames SHT_DEBUGINFO;

	.align 1;
.epcpubnames:
	.type .epcpubnames,STT_OBJECT;
	.byte =
		0x4D,0x03,0x00,0x00,0x02,0x00;
	.byte4 = .epcdebug;
	.inc/binary "..\Debug\dma.sbn", 8927, 839;
.epcpubnames.end:

	.section .debug_aranges SHT_DEBUGINFO;

	.align 1;
.epcaranges:
	.type .epcaranges,STT_OBJECT;
	.byte =
		0x84,0x00,0x00,0x00,0x02,0x00;
	.byte4 = .epcdebug;
	.byte =
		0x04,0x00,0x00,0x00,0x00,0x00;
	.byte4 = .LN_acknowledge_interrupt_for_completion_of_waveform_transfer_from_fpga;
	.byte4 = .LN._acknowledge_interrupt_for_completion_of_waveform_transfer_from_fpga.end-.LN_acknowledge_interrupt_for_completion_of_waveform_transfer_from_fpga;
	.byte4 = .LN_dma_configuration_register;
	.byte4 = .LN._dma_configuration_register.end-.LN_dma_configuration_register;
	.byte4 = .LN_init_dma;
	.byte4 = .LN._init_dma.end-.LN_init_dma;
	.byte4 = .LN_wait_until_mdma1_stream0_is_paused_or_stopped;
	.byte4 = .LN._wait_until_mdma1_stream0_is_paused_or_stopped.end-.LN_wait_until_mdma1_stream0_is_paused_or_stopped;
	.byte4 = .LN_initiate_dma_transfer_from_l3_buffer_to_l1_buffer;
	.byte4 = .LN._initiate_dma_transfer_from_l3_buffer_to_l1_buffer.end-.LN_initiate_dma_transfer_from_l3_buffer_to_l1_buffer;
	.byte4 = .LN_setup_single_waveform_dma_transfer_from_l3_buffer_to_l1_buffer;
	.byte4 = .LN._setup_single_waveform_dma_transfer_from_l3_buffer_to_l1_buffer.end-.LN_setup_single_waveform_dma_transfer_from_l3_buffer_to_l1_buffer;
	.byte4 = .LN_setup_single_pedestal_dma_transfer_from_l3_buffer_to_l1_buffer;
	.byte4 = .LN._setup_single_pedestal_dma_transfer_from_l3_buffer_to_l1_buffer.end-.LN_setup_single_pedestal_dma_transfer_from_l3_buffer_to_l1_buffer;
	.byte4 = .LN_setup_single_delta_t_dma_transfer_from_l3_buffer_to_l1_buffer;
	.byte4 = .LN._setup_single_delta_t_dma_transfer_from_l3_buffer_to_l1_buffer.end-.LN_setup_single_delta_t_dma_transfer_from_l3_buffer_to_l1_buffer;
	.byte4 = .LN_setup_ppi_transfers_from_fpga_via_ppi0;
	.byte4 = .LN._setup_ppi_transfers_from_fpga_via_ppi0.end-.LN_setup_ppi_transfers_from_fpga_via_ppi0;
	.byte4 = .LN_enable_ppi_transfers_from_fpga_via_ppi0;
	.byte4 = .LN._enable_ppi_transfers_from_fpga_via_ppi0.end-.LN_enable_ppi_transfers_from_fpga_via_ppi0;
	.byte4 = .LN_setup_dma_transfers_from_fpga_via_ppi0;
	.byte4 = .LN._setup_dma_transfers_from_fpga_via_ppi0.end-.LN_setup_dma_transfers_from_fpga_via_ppi0;
	.byte4 = .LN_setup_interrupts_for_dma_transfers_from_fpga_via_ppi0;
	.byte4 = .LN._setup_interrupts_for_dma_transfers_from_fpga_via_ppi0.end-.LN_setup_interrupts_for_dma_transfers_from_fpga_via_ppi0;
	.byte4 = .LN_disable_interrupts_for_dma_transfers_from_fpga_via_ppi0;
	.byte4 = .LN._disable_interrupts_for_dma_transfers_from_fpga_via_ppi0.end-.LN_disable_interrupts_for_dma_transfers_from_fpga_via_ppi0;
	.byte4 = .LN_enable_dma_transfers_from_fpga_via_ppi0;
	.byte4 = .LN._enable_dma_transfers_from_fpga_via_ppi0.end-.LN_enable_dma_transfers_from_fpga_via_ppi0;
	.byte =
		0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00;
.epcaranges.end:

	.section/DOUBLE32 data1;


	.extern _ASIC_pedestal;
	.type _ASIC_pedestal,STT_OBJECT;
	.extern _ASIC_delta_t;
	.type _ASIC_delta_t,STT_OBJECT;
	.extern _pedestal_a;
	.type _pedestal_a,STT_OBJECT;
	.extern _pedestal_b;
	.type _pedestal_b,STT_OBJECT;
	.extern _delta_t_a;
	.type _delta_t_a,STT_OBJECT;
	.extern _delta_t_b;
	.type _delta_t_b,STT_OBJECT;
	.extern _waveform_a;
	.type _waveform_a,STT_OBJECT;
	.extern _waveform_b;
	.type _waveform_b,STT_OBJECT;
	.extern _dma_descriptor;
	.type _dma_descriptor,STT_OBJECT;
	.extern _buffer0;
	.type _buffer0,STT_OBJECT;
