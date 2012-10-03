////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: O.40d
//  \   \         Application: netgen
//  /   /         Filename: pci32_sp_v4_13.v
// /___/   /\     Timestamp: Tue Jun 21 21:39:32 2011
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -w -sim -ofmt verilog ./tmp/_cg/pci32_sp_v4_13.ngc ./tmp/_cg/pci32_sp_v4_13.v 
// Device	: 6slx45fgg484-3
// Input file	: ./tmp/_cg/pci32_sp_v4_13.ngc
// Output file	: ./tmp/_cg/pci32_sp_v4_13.v
// # of Modules	: 2
// Design Name	: pci32_sp_v4_13
// Xilinx        : /opt/Xilinx/13.1/ISE_DS/ISE/
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module PCILOGICSE (
  I2, PCI_CE, I3, TRDY, IRDY, I1
)/* synthesis syn_black_box syn_noprune=1 */;
  input I2;
  output PCI_CE;
  input I3;
  input TRDY;
  input IRDY;
  input I1;
  
  // synthesis translate_off
  
  wire PCILOGIC_sig0;
  wire PCILOGIC_sig1;
  wire PCILOGIC_sig2;
  wire PCILOGIC_sig3;
  wire PCILOGIC_sig4;
  wire PCILOGIC_sig5;
  wire PCILOGIC_sig6;
  wire PCILOGIC_sig7;
  wire PCILOGIC_sig8;
  assign
    PCILOGIC_sig4 = I2,
    PCI_CE = PCILOGIC_sig3,
    PCILOGIC_sig7 = I3,
    PCILOGIC_sig8 = TRDY,
    PCILOGIC_sig6 = IRDY,
    PCILOGIC_sig5 = I1;
  OR3   PCILOGIC_OR3 (
    .O(PCILOGIC_sig3),
    .I0(PCILOGIC_sig4),
    .I1(PCILOGIC_sig1),
    .I2(PCILOGIC_sig2)
  );
  NOR2   PCILOGIC_NOR2_1 (
    .O(PCILOGIC_sig1),
    .I0(PCILOGIC_sig5),
    .I1(PCILOGIC_sig6)
  );
  NOR2   PCILOGIC_NOR2_2 (
    .O(PCILOGIC_sig2),
    .I0(PCILOGIC_sig7),
    .I1(PCILOGIC_sig8)
  );

// synthesis translate_on

endmodule

module pci32_sp_v4_13 (
  s_wrdn, trdyi, keepout, trdyo, dr_bus, pcix_en, trdyt, backoff, s_data_vld, bm_detect_dis, irdyd, irdyi, irdyq_n, cfg_self, s_ready, irdyo, idseld, 
m_data_vld, int_n, bw_detect_dis, irdyt, idseli, complete, pciw_en, into, s_src_en, pard, intt, pari, paro, part, s_abort, perrd, s_data, idle, perri
, perro, cfg_vld, m_wrdn, perrt, time_out, devselq_n, c_term, trdyq_n, stopd, stopi, clk, stopo, serrq_n, b_busy, request, stopt, m_addr_n, 
bw_manual_32b, bm_manual_pci, pme_n, gntd, requesthold, m_ready, rst, gnti, serrd, rtr, frameq_n, serri, addr_vld, serro, serrt, devseld, devseli, 
s_term, perrq_n, devselo, framed, c_ready, devselt, reqo, cfg_hit, framei, m_data, reqt, m_src_en, pmeo, frameo, i_idle, trdyd, pmet, framet, stopq_n
, base_hit, m_cbe, cbd, cbi, cbo, cbt, cfg, adio_out, adio_in, s_cbe, add, adi, ado, adt, pci_cmd, csr, addr
)/* synthesis syn_black_box syn_noprune=1 */;
  output s_wrdn;
  input trdyi;
  input keepout;
  output trdyo;
  output dr_bus;
  output pcix_en;
  output trdyt;
  output backoff;
  output s_data_vld;
  input bm_detect_dis;
  input irdyd;
  input irdyi;
  output irdyq_n;
  input cfg_self;
  input s_ready;
  output irdyo;
  input idseld;
  output m_data_vld;
  input int_n;
  input bw_detect_dis;
  output irdyt;
  input idseli;
  input complete;
  output pciw_en;
  output into;
  output s_src_en;
  input pard;
  output intt;
  input pari;
  output paro;
  output part;
  input s_abort;
  input perrd;
  output s_data;
  output idle;
  input perri;
  output perro;
  output cfg_vld;
  input m_wrdn;
  output perrt;
  output time_out;
  output devselq_n;
  input c_term;
  output trdyq_n;
  input stopd;
  input stopi;
  input clk;
  output stopo;
  output serrq_n;
  output b_busy;
  input request;
  output stopt;
  output m_addr_n;
  input bw_manual_32b;
  input bm_manual_pci;
  input pme_n;
  input gntd;
  input requesthold;
  input m_ready;
  input rst;
  input gnti;
  input serrd;
  output rtr;
  output frameq_n;
  input serri;
  output addr_vld;
  output serro;
  output serrt;
  input devseld;
  input devseli;
  input s_term;
  output perrq_n;
  output devselo;
  input framed;
  input c_ready;
  output devselt;
  output reqo;
  output cfg_hit;
  input framei;
  output m_data;
  output reqt;
  output m_src_en;
  output pmeo;
  output frameo;
  output i_idle;
  input trdyd;
  output pmet;
  output framet;
  output stopq_n;
  output [7 : 0] base_hit;
  input [3 : 0] m_cbe;
  input [3 : 0] cbd;
  input [3 : 0] cbi;
  output [3 : 0] cbo;
  output [3 : 0] cbt;
  output [511 : 0] cfg;
  output [31 : 0] adio_out;
  input [31 : 0] adio_in;
  output [3 : 0] s_cbe;
  input [31 : 0] add;
  input [31 : 0] adi;
  output [31 : 0] ado;
  output [31 : 0] adt;
  output [15 : 0] pci_cmd;
  output [39 : 0] csr;
  output [31 : 0] addr;
  
  // synthesis translate_off
  
  wire \NlwRenamedSignal_adt[24] ;
  wire \NlwRenamedSignal_adt[16] ;
  wire \NlwRenamedSignal_adt[10] ;
  wire NlwRenamedSig_OI_frameq_n;
  wire NlwRenamedSig_OI_trdyq_n;
  wire NlwRenamedSig_OI_irdyq_n;
  wire NlwRenamedSig_OI_stopq_n;
  wire NlwRenamedSig_OI_devselq_n;
  wire NlwRenamedSig_OI_cfg_hit;
  wire NlwRenamedSig_OI_addr_vld;
  wire NlwRenamedSig_OI_s_wrdn;
  wire \NlwRenamedSig_OI_pci_cmd[11] ;
  wire \NlwRenamedSig_OI_pci_cmd[10] ;
  wire \NlwRenamedSig_OI_pci_cmd[1] ;
  wire NlwRenamedSig_OI_time_out;
  wire NlwRenamedSig_OI_m_data;
  wire NlwRenamedSig_OI_dr_bus;
  wire NlwRenamedSig_OI_i_idle;
  wire NlwRenamedSig_OI_idle;
  wire NlwRenamedSig_OI_b_busy;
  wire NlwRenamedSig_OI_s_data;
  wire NlwRenamedSig_OI_backoff;
  wire NlwRenamedSignal_pme_n;
  wire NlwRenamedSig_OI_perrq_n;
  wire \NlwRenamedSig_OI_csr[39] ;
  wire \NlwRenamedSig_OI_csr[31] ;
  wire \NlwRenamedSig_OI_csr[30] ;
  wire \NlwRenamedSig_OI_csr[29] ;
  wire \NlwRenamedSig_OI_csr[28] ;
  wire \NlwRenamedSig_OI_csr[27] ;
  wire \NlwRenamedSig_OI_csr[25] ;
  wire \NlwRenamedSig_OI_csr[24] ;
  wire \NlwRenamedSig_OI_csr[20] ;
  wire \NlwRenamedSig_OI_csr[19] ;
  wire \NlwRenamedSig_OI_csr[10] ;
  wire \NlwRenamedSig_OI_csr[8] ;
  wire \NlwRenamedSig_OI_csr[6] ;
  wire \NlwRenamedSig_OI_csr[2] ;
  wire \NlwRenamedSig_OI_csr[1] ;
  wire \NlwRenamedSig_OI_csr[0] ;
  wire NlwRenamedSig_OI_pciw_en;
  wire \NlwRenamedSig_OI_cfg[116] ;
  wire \NlwRenamedSig_OI_cfg[0] ;
  wire \BU2/U0/ff_drive_zero_1_2576 ;
  wire \BU2/m_fail64 ;
  wire \BU2/s_cycle64 ;
  wire \BU2/ack64q_n ;
  wire \BU2/req64q_n ;
  wire \BU2/ack64t ;
  wire \BU2/ack64o ;
  wire \BU2/req64t ;
  wire \BU2/req64o ;
  wire \BU2/par64t ;
  wire \BU2/par64o ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/BUG_FIX_RSTPOT1_2162 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFERFAIL/MMUX_NS_FAIL6411_2161 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFERFAIL/MMUX_NS_FAIL641 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SRC_EN/S_SRC_EN ;
  wire \BU2/U0/pci32_inst/N385 ;
  wire \BU2/U0/pci32_inst/N384 ;
  wire \BU2/U0/pci32_inst/N383 ;
  wire \BU2/U0/pci32_inst/N382 ;
  wire \BU2/U0/pci32_inst/N381 ;
  wire \BU2/U0/pci32_inst/N380 ;
  wire \BU2/U0/pci32_inst/N379 ;
  wire \BU2/U0/pci32_inst/N378 ;
  wire \BU2/U0/pci32_inst/N376 ;
  wire \BU2/U0/pci32_inst/N374 ;
  wire \BU2/U0/pci32_inst/N372 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/N01032_2147 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/N010369_2146 ;
  wire \BU2/U0/pci32_inst/N370 ;
  wire \BU2/U0/pci32_inst/N369 ;
  wire \BU2/U0/pci32_inst/N368 ;
  wire \BU2/U0/pci32_inst/N339 ;
  wire \BU2/U0/pci32_inst/N338 ;
  wire \BU2/U0/pci32_inst/N336 ;
  wire \BU2/U0/pci32_inst/N335 ;
  wire \BU2/U0/pci32_inst/N334 ;
  wire \BU2/U0/pci32_inst/N332 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT26138_2136 ;
  wire \BU2/U0/pci32_inst/N330 ;
  wire \BU2/U0/pci32_inst/N328 ;
  wire \BU2/U0/pci32_inst/N326 ;
  wire \BU2/U0/pci32_inst/N324 ;
  wire \BU2/U0/pci32_inst/N318 ;
  wire \BU2/U0/pci32_inst/N316 ;
  wire \BU2/U0/pci32_inst/N315 ;
  wire \BU2/U0/pci32_inst/N313 ;
  wire \BU2/U0/pci32_inst/N312 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT186_2126 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1813_2125 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1230_2124 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1213_2123 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2330_2122 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2313_2121 ;
  wire \BU2/U0/pci32_inst/N310 ;
  wire \BU2/U0/pci32_inst/N308 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2675_2118 ;
  wire \BU2/U0/pci32_inst/N303 ;
  wire \BU2/U0/pci32_inst/N301 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT31146_2115 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_DSEL/MMUX_NS_DEVSEL_123_2114 ;
  wire \BU2/U0/pci32_inst/N297 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/N00042 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT31100_2111 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2630_2110 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2613_2109 ;
  wire \BU2/U0/pci32_inst/N294 ;
  wire \BU2/U0/pci32_inst/N295 ;
  wire \BU2/U0/pci32_inst/N292 ;
  wire \BU2/U0/pci32_inst/N290 ;
  wire \BU2/U0/pci32_inst/N288 ;
  wire \BU2/U0/pci32_inst/N286 ;
  wire \BU2/U0/pci32_inst/N284 ;
  wire \BU2/U0/pci32_inst/N282 ;
  wire \BU2/U0/pci32_inst/N280 ;
  wire \BU2/U0/pci32_inst/N278 ;
  wire \BU2/U0/pci32_inst/N276 ;
  wire \BU2/U0/pci32_inst/N274 ;
  wire \BU2/U0/pci32_inst/N272 ;
  wire \BU2/U0/pci32_inst/N270 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT27108_2094 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT28108_2093 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT30108_2092 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT10124_2091 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT15124_2090 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT16124_2089 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT19124_2088 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT3124_2087 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT32124_2086 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT4124_2085 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT5124_2084 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT6124_2083 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT7124_2082 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT8124_2081 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT9124_2080 ;
  wire \BU2/U0/pci32_inst/N261 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT272_2078 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2728_2077 ;
  wire \BU2/U0/pci32_inst/N262 ;
  wire \BU2/U0/pci32_inst/N258 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT282_2074 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2828_2073 ;
  wire \BU2/U0/pci32_inst/N259 ;
  wire \BU2/U0/pci32_inst/N255 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT302_2070 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT3028_2069 ;
  wire \BU2/U0/pci32_inst/N256 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1275_2067 ;
  wire \BU2/U0/pci32_inst/N249 ;
  wire \BU2/U0/pci32_inst/N250 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2375_2064 ;
  wire \BU2/U0/pci32_inst/N246 ;
  wire \BU2/U0/pci32_inst/N247 ;
  wire \BU2/U0/pci32_inst/N243 ;
  wire \BU2/U0/pci32_inst/N244 ;
  wire \BU2/U0/pci32_inst/N240 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2944_2058 ;
  wire \BU2/U0/pci32_inst/N241 ;
  wire \BU2/U0/pci32_inst/N237 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT11158_2055 ;
  wire \BU2/U0/pci32_inst/N238 ;
  wire \BU2/U0/pci32_inst/N234 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT13158_2052 ;
  wire \BU2/U0/pci32_inst/N235 ;
  wire \BU2/U0/pci32_inst/N231 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT14158_2049 ;
  wire \BU2/U0/pci32_inst/N232 ;
  wire \BU2/U0/pci32_inst/N228 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT17158_2046 ;
  wire \BU2/U0/pci32_inst/N229 ;
  wire \BU2/U0/pci32_inst/N225 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2158_2043 ;
  wire \BU2/U0/pci32_inst/N226 ;
  wire \BU2/U0/pci32_inst/N222 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT20158_2040 ;
  wire \BU2/U0/pci32_inst/N223 ;
  wire \BU2/U0/pci32_inst/N219 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT21158_2037 ;
  wire \BU2/U0/pci32_inst/N220 ;
  wire \BU2/U0/pci32_inst/N216 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT22158_2034 ;
  wire \BU2/U0/pci32_inst/N217 ;
  wire \BU2/U0/pci32_inst/N213 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT24158_2031 ;
  wire \BU2/U0/pci32_inst/N214 ;
  wire \BU2/U0/pci32_inst/N210 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT25158_2028 ;
  wire \BU2/U0/pci32_inst/N211 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1844_2026 ;
  wire \BU2/U0/pci32_inst/N207 ;
  wire \BU2/U0/pci32_inst/N208 ;
  wire \BU2/U0/pci32_inst/N205 ;
  wire \BU2/U0/pci32_inst/N204 ;
  wire \BU2/U0/pci32_inst/N202 ;
  wire \BU2/U0/pci32_inst/N201 ;
  wire \BU2/U0/pci32_inst/N199 ;
  wire \BU2/U0/pci32_inst/N198 ;
  wire \BU2/U0/pci32_inst/N196 ;
  wire \BU2/U0/pci32_inst/N195 ;
  wire \BU2/U0/pci32_inst/N193 ;
  wire \BU2/U0/pci32_inst/N192 ;
  wire \BU2/U0/pci32_inst/N190 ;
  wire \BU2/U0/pci32_inst/N189 ;
  wire \BU2/U0/pci32_inst/N187 ;
  wire \BU2/U0/pci32_inst/N186 ;
  wire \BU2/U0/pci32_inst/N184 ;
  wire \BU2/U0/pci32_inst/N183 ;
  wire \BU2/U0/pci32_inst/N181 ;
  wire \BU2/U0/pci32_inst/N180 ;
  wire \BU2/U0/pci32_inst/N178 ;
  wire \BU2/U0/pci32_inst/N177 ;
  wire \BU2/U0/pci32_inst/N175 ;
  wire \BU2/U0/pci32_inst/N174 ;
  wire \BU2/U0/pci32_inst/N172 ;
  wire \BU2/U0/pci32_inst/N171 ;
  wire \BU2/U0/pci32_inst/N169 ;
  wire \BU2/U0/pci32_inst/N168 ;
  wire \BU2/U0/pci32_inst/N166 ;
  wire \BU2/U0/pci32_inst/N90 ;
  wire \BU2/U0/pci32_inst/N88 ;
  wire \BU2/U0/pci32_inst/N86 ;
  wire \BU2/U0/pci32_inst/N84 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT18147_1992 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT26145 ;
  wire \BU2/U0/pci32_inst/N160 ;
  wire \BU2/U0/pci32_inst/N158 ;
  wire \BU2/U0/pci32_inst/N156 ;
  wire \BU2/U0/pci32_inst/N154 ;
  wire \BU2/U0/pci32_inst/N150 ;
  wire \BU2/U0/pci32_inst/N148 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_AK64/MMUX_NS_ACK64_133_1984 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT312_1983 ;
  wire \BU2/U0/pci32_inst/N146 ;
  wire \BU2/U0/pci32_inst/N144 ;
  wire \BU2/U0/pci32_inst/N142 ;
  wire \BU2/U0/pci32_inst/N140 ;
  wire \BU2/U0/pci32_inst/N138 ;
  wire \BU2/U0/pci32_inst/N136 ;
  wire \BU2/U0/pci32_inst/N134 ;
  wire \BU2/U0/pci32_inst/N132 ;
  wire \BU2/U0/pci32_inst/N130 ;
  wire \BU2/U0/pci32_inst/N128 ;
  wire \BU2/U0/pci32_inst/N126 ;
  wire \BU2/U0/pci32_inst/N124 ;
  wire \BU2/U0/pci32_inst/N122 ;
  wire \BU2/U0/pci32_inst/N120 ;
  wire \BU2/U0/pci32_inst/N118 ;
  wire \BU2/U0/pci32_inst/N116 ;
  wire \BU2/U0/pci32_inst/N114 ;
  wire \BU2/U0/pci32_inst/N112 ;
  wire \BU2/U0/pci32_inst/N110 ;
  wire \BU2/U0/pci32_inst/N108 ;
  wire \BU2/U0/pci32_inst/N106 ;
  wire \BU2/U0/pci32_inst/N104 ;
  wire \BU2/U0/pci32_inst/N102 ;
  wire \BU2/U0/pci32_inst/N100 ;
  wire \BU2/U0/pci32_inst/N98 ;
  wire \BU2/U0/pci32_inst/N96 ;
  wire \BU2/U0/pci32_inst/N94 ;
  wire \BU2/U0/pci32_inst/N92 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/BUG_FIX_RSTPOT ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR0/NL_MEMO_RSTPOT_1953 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR1/NL_MEMO_RSTPOT_1952 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR2/NL_MEMO_RSTPOT_1951 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/S_CYCLE64_INT_RSTPOT_1950 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/MASTER_TEMP_1949 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/MASTER_TEMP_RSTPOT_1948 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT12164_1947 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT12118_1946 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT12100_1945 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT12147_1944 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT23164_1943 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT23118_1942 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT23100_1941 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT23147_1940 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1134_1939 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1882_1938 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1701_1937 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1117_1936 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1441_1935 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT127_1934 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT29134_1933 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2988_1932 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2970_1931 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT29117_1930 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2927_1929 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1103 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT3127_1927 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT3112_1926 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT11148_1925 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT11110_1924 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1155_1923 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1147_1922 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1126_1921 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT13148_1920 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT13110_1919 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1355_1918 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1347_1917 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1326_1916 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT14148_1915 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT14110_1914 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1455_1913 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1447_1912 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1426_1911 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT17148_1910 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT17110_1909 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1755_1908 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1747_1907 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1726_1906 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT21481_1905 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT21101_1904 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT255_1903 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT247_1902 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT226_1901 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT20148_1900 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT20110_1899 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2055_1898 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2047_1897 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2026_1896 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT21148_1895 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT21110_1894 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2155_1893 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2147_1892 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2126_1891 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT22148_1890 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT22110_1889 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2255_1888 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2247_1887 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2226_1886 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT24148_1885 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT24110_1884 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2455_1883 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2447_1882 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2426_1881 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT25148_1880 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/N25 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT25110_1878 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2555_1877 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2547_1876 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2526_1875 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1881_1874 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1866_1873 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1066_1872 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1051_1871 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1026_1870 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1566_1869 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1551_1868 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1526_1867 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1666_1866 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1651_1865 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1626_1864 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1966_1863 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1951_1862 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1926_1861 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT366_1860 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT351_1859 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT326_1858 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT3266_1857 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT3251_1856 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT3226_1855 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT466_1854 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT451_1853 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT426_1852 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT566_1851 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT551_1850 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT526_1849 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT666_1848 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT651_1847 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT626_1846 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT766_1845 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT751_1844 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT726_1843 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT866_1842 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT851_1841 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT826_1840 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT966_1839 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT951_1838 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT926_1837 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_DSEL/MMUX_NS_DEVSEL_111_1836 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_DSEL/MMUX_NS_DEVSEL_15_1835 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/N7 ;
  wire \BU2/U0/pci32_inst/N82 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_AK64/MMUX_NS_ACK64_112_1832 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_AK64/MMUX_NS_ACK64_15_1831 ;
  wire \BU2/U0/pci32_inst/CFG_REMAP/OUT143_1830 ;
  wire \BU2/U0/pci32_inst/CFG_REMAP/OUT138_1829 ;
  wire \BU2/U0/pci32_inst/CFG_REMAP/OUT122_1828 ;
  wire \BU2/U0/pci32_inst/CFG_REMAP/OUT117_1827 ;
  wire \BU2/U0/pci32_inst/CFG_REMAP/OUT15_1826 ;
  wire \BU2/U0/pci32_inst/CFG_REMAP/OUT10_1825 ;
  wire \BU2/U0/pci32_inst/CFG_REMAP/OUT243_1824 ;
  wire \BU2/U0/pci32_inst/CFG_REMAP/OUT238_1823 ;
  wire \BU2/U0/pci32_inst/CFG_REMAP/OUT222_1822 ;
  wire \BU2/U0/pci32_inst/CFG_REMAP/OUT217_1821 ;
  wire \BU2/U0/pci32_inst/CFG_REMAP/OUT25_1820 ;
  wire \BU2/U0/pci32_inst/CFG_REMAP/OUT20_1819 ;
  wire \BU2/U0/pci32_inst/N78 ;
  wire \BU2/U0/pci32_inst/N77 ;
  wire \BU2/U0/pci32_inst/N75 ;
  wire \BU2/U0/pci32_inst/N73 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/N36 ;
  wire \BU2/U0/pci32_inst/N71 ;
  wire \BU2/U0/pci32_inst/N69 ;
  wire \BU2/U0/pci32_inst/N68 ;
  wire \BU2/U0/pci32_inst/N66 ;
  wire \BU2/U0/pci32_inst/N65 ;
  wire \BU2/U0/pci32_inst/CFG_REMAP/OUT343_1808 ;
  wire \BU2/U0/pci32_inst/CFG_REMAP/OUT338_1807 ;
  wire \BU2/U0/pci32_inst/CFG_REMAP/OUT322_1806 ;
  wire \BU2/U0/pci32_inst/CFG_REMAP/OUT317_1805 ;
  wire \BU2/U0/pci32_inst/CFG_REMAP/OUT35_1804 ;
  wire \BU2/U0/pci32_inst/CFG_REMAP/OUT30_1803 ;
  wire \BU2/U0/pci32_inst/N63 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/NS_BH64_2 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/ACKHIT ;
  wire \BU2/U0/pci32_inst/N61 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/N010346_1798 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/N010327_1797 ;
  wire \BU2/U0/pci32_inst/N59 ;
  wire \BU2/U0/pci32_inst/N57 ;
  wire \BU2/U0/pci32_inst/N55 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/N0004 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/MMUX_NS_STOP_124_1792 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/MMUX_NS_STOP_181_1791 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/MMUX_NS_STOP_114_1790 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR0/NL_MEMO_1789 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR2/NL_MEMO_1788 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR1/NL_MEMO_1787 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/MMUX_NS_STOP_15_1786 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/SWAN076_1785 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/SWAN046_1784 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/SWAN038_1783 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/SWAN015_1782 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/SWAN07_1781 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/N000442_1780 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/N000410_1779 ;
  wire \BU2/U0/pci32_inst/N53 ;
  wire \BU2/U0/pci32_inst/N52 ;
  wire \BU2/U0/pci32_inst/N51 ;
  wire \BU2/U0/pci32_inst/N50 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MMUX_NS_PERR_149_1774 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MMUX_NS_PERR_17_1773 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MXOR_PER64_XO<0>62_1772 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MXOR_PER64_XO<0>57_1771 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MXOR_PER64_XO<0>30_1770 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MXOR_PER64_XO<0>25_1769 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MXOR_PER64_XO<0>9_1768 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MXOR_PER64_XO<0>4_1767 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MXOR_PER_XO<0>62_1766 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MXOR_PER_XO<0>57_1765 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MXOR_PER_XO<0>30_1764 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MXOR_PER_XO<0>25_1763 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MXOR_PER_XO<0>9_1762 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MXOR_PER_XO<0>4_1761 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/REQ64/MMUX_NS_REQ64_140_1760 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/FRAME/MMUX_NS_FRAME_138_1759 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/FRAME/MMUX_NS_FRAME_112_1758 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/PER ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/ADDR_VLD64 ;
  wire \BU2/U0/pci32_inst/N48 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/PER64 ;
  wire \BU2/U0/pci32_inst/N44 ;
  wire \BU2/U0/pci32_inst/N37 ;
  wire \BU2/U0/pci32_inst/N35 ;
  wire \BU2/U0/pci32_inst/N33 ;
  wire \BU2/U0/pci32_inst/N31 ;
  wire \BU2/U0/pci32_inst/N29 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/NS_OE_ADO_B_114_1747 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/NS_OE_ADO_B_110_1746 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR136_1745 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR118_1744 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR115_1743 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR64_1742 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR53_1741 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR21_1740 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR10_1739 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR64136_1738 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR64118_1737 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR64115_1736 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR6464_1735 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR6453_1734 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR6421_1733 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR6410_1732 ;
  wire \BU2/U0/pci32_inst/N27 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/I_IDLE/NS_I_IDLE5_1730 ;
  wire \BU2/U0/pci32_inst/N25 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_TSM/PCI_BKOF/NS_BKOF34_1728 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_TSM/PCI_BKOF/NS_BKOF4_1727 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_TSM/PCI_DATA/NS_DATA22_1726 ;
  wire \BU2/U0/pci32_inst/N22 ;
  wire \BU2/U0/pci32_inst/N23 ;
  wire \BU2/U0/pci32_inst/N20 ;
  wire \BU2/U0/pci32_inst/N18 ;
  wire \BU2/U0/pci32_inst/N16 ;
  wire \BU2/U0/pci32_inst/N14 ;
  wire \BU2/U0/pci32_inst/N12 ;
  wire \BU2/U0/pci32_inst/N10 ;
  wire \BU2/U0/pci32_inst/N8 ;
  wire \BU2/U0/pci32_inst/N6 ;
  wire \BU2/U0/pci32_inst/N4 ;
  wire \BU2/U0/pci32_inst/N2 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/N34 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/N37 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/N38 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR0[31] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR0[30] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR0[29] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR0[28] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR0[27] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR0[26] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR0[24] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR0[23] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR0[22] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR0[21] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR0[20] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR0[19] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR0[18] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR0[17] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR0[16] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR0[15] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR0[14] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR0[13] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR0[12] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR0[11] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR0[10] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR0[9] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR0[6] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR1[31] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR1[30] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR1[29] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR1[28] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR1[27] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR1[26] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR1[24] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR1[23] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR1[22] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR1[21] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR1[20] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR1[19] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR1[18] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR1[17] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR1[16] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR1[15] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR1[14] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR1[13] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR1[12] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR1[11] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR1[10] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR1[9] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR1[6] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR2[26] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR2[23] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR2[22] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR2[18] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR2[17] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR2[16] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR2[15] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR2[14] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR2[13] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR2[12] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR2[11] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR2[9] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR2[8] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/CE1_3 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/N0105 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/SWAN0 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/N01 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/N11 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/S_ABORT_INT ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_AK64/MMUX_NS_ACK64_115 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/N2 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/N8 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/N2 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/START_AD64 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/START_AD ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/LOCKOUT ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/N5 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/N121 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/DEV_TO ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/M_ENABLE_INT ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BH64_2 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/N23 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/N1447 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/N1445 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/N9 ;
  wire \BU2/U0/pci32_inst/OLD[74] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/N01 ;
  wire \BU2/U0/pci32_inst/OLD[0] ;
  wire \BU2/U0/pci32_inst/OLD[37] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/BUG_FIX_1625 ;
  wire \BU2/U0/pci32_inst/XPCI_WATCHDOG/PCIX0 ;
  wire \BU2/U0/pci32_inst/XPCI_WATCHDOG/PCIX1 ;
  wire \BU2/U0/pci32_inst/XPCI_WATCHDOG/PCIXOK ;
  wire \BU2/U0/pci32_inst/XPCI_WATCHDOG/PCIW ;
  wire \BU2/U0/pci32_inst/XPCI_WATCHDOG/PCI64B ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/C_CEO_1615 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/A_CEO ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/B_CEO_1613 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/D_CEO_1612 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/C_OUT_1603 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/B_OUT_1586 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/A_OUT_1577 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/D_OUT_1568 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<0>2 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<1>2 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY<1>_RT_1564 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<2>2 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY<2>_RT_1561 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<3>2 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY<3>_RT_1558 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<4>2 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY<4>_RT_1555 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<5>2 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY<5>_RT_1552 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<6>2 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY<6>_RT_1549 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<7>2 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_XOR<7>_RT_1546 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY<1>_RT_1541 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY<2>_RT_1538 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY<3>_RT_1535 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY<4>_RT_1532 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY<5>_RT_1529 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY<6>_RT_1526 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_XOR<7>_RT_1523 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<0>1 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<1>1 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY<1>_RT_1518 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<2>1 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY<2>_RT_1515 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<3>1 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY<3>_RT_1512 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<4>1 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY<4>_RT_1509 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<5>1 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY<5>_RT_1506 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<6>1 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY<6>_RT_1503 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<7>1 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_XOR<7>_RT_1500 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<0>3 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<1>3 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY<1>_RT_1495 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<2>3 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY<2>_RT_1492 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<3>3 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY<3>_RT_1489 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<4>3 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY<4>_RT_1486 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<5>3 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY<5>_RT_1483 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<6>3 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY<6>_RT_1480 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<7>3 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_XOR<7>_RT_1477 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<0>4 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<1>4 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY<1>_RT_1472 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<2>4 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY<2>_RT_1469 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<3>4 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY<3>_RT_1466 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<4>4 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY<4>_RT_1463 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<5>4 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY<5>_RT_1460 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<6>4 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY<6>_RT_1457 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<7>4 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_XOR<7>_RT_1454 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/CE15_0 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/CE4_0 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/CE4_1 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT_29_1422 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/CE4_2 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT_30_1419 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT_28_1418 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT_31_1413 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/CE4_3 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/NS_BASE_HIT0 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BH64_O_1410 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/NS_BH64_0 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR0/ADDRESS_MATCH ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/CE5_0 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/CE5_1 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT_29_1367 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/CE5_2 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT_30_1364 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT_28_1363 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT_31_1358 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/CE5_3 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/NS_BASE_HIT1 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BH64_O_1355 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/NS_BH64_1 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR1/ADDRESS_MATCH ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/CE6_0 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/CE6_1 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT_29_1312 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/CE6_2 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT_30_1309 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT_28_1308 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT_31_1303 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/CE6_3 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR2/BASE_HITO_1301 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/NS_BASE_HIT2_INT ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR2/BH64_O_1299 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/NS_BH64_2_INT ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/BAR2/ADDRESS_MATCH ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CSR/MEMACCESSALLOWED_INT_1277 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CSR/IOACCESSALLOWED_INT_1276 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/CE1_0 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CSR/PCI_CSR_OR[27] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CSR/PCI_CSR_OR[28] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CSR/PCI_CSR_OR[29] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CSR/PCI_CSR_OR[30] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CSR/PCI_CSR_OR[31] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/CE1_1 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CSR/PCI_CSR_OR[24] ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CSR/N0092 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/NS_PAR_CE ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/NEWDATA_1265 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/NS_NEWDATA_OUT_CE ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/S_OK_N ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/M_OK_N ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/FFA ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD1 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD0 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD2 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD3 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD6 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD4 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD5 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD7 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD8 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD11 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD9 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD10 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD12 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD13 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD14 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD15 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/NS_CFG_HIT ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CFG_CYC_1243 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/NS_CFG_CYC ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/LADX1_1241 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/ADX1 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/LADX3_1239 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/ADX3 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/LADX4_1237 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/ADX4 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/LADX5_1235 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/ADX5 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/LADX6_1233 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/ADX6 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/LADX15_1231 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/ADX15 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE5__1229 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/N0040 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE3__1227 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/N0022 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE4__1225 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/N0031 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE6__1223 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/N0049 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE15__1221 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/N0098 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE_ROM__1219 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/N0103 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE1__1217 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/N0012 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/I_DATA_FLAG_1215 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/N0038 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/TSTOP__1213 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/TSTOP_I__1212 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_AK64/TACK64_I__1211 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_DSEL/TDEVSEL__1210 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_DSEL/TDEVSEL_I__1209 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/S_FIRST_1208 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/S_FIRSTIN ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/TRDYDEL_1206 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/TTRDY_I__1205 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/OE_ADO_LT__1204 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/NS_OE_ADO_LT_ ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/OE_ADO_LB__1202 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/NS_OE_ADO_LB_ ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/OE_ADO_T__1200 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/NS_OE_ADO_T_ ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/OE_ADO_B__1198 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/NS_OE_ADO_B_ ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/OE_ADO_LT64__1196 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/NS_OE_ADO_LT64_ ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/OE_ADO_LB64__1194 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/NS_OE_ADO_LB64_ ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/OE_ADO_T64__1192 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/NS_OE_ADO_T64_ ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/TRSTOPQ_1190 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/N0029 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/OE_ADO_B64__1188 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/NS_OE_ADO_B64_ ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/HOLD_OE_PERR_1186 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/SET_OE_PERR ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/OE_TRDY_IN__1184 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/OE_ACK64_IN__1183 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/TPWIN64_1182 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/NS_PWIN64 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/TPWIN_1180 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/NS_PWIN ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/HOLD_APERR_1178 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/N0238 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_TSM/PCI_BUSY/NS_BUSY ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_TSM/PCI_IDLE/NS_IDLE_1175 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_TSM/PCI_DATA/NS_DATA ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_TSM/PCI_BKOF/NS_BKOF ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/DEV_TO/PASS_TO_1172 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/DEV_TO/N0010 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/DEV_TO/DEV_TO_ADDR ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/DEV_TO/WAS_SUBTRACTIVE_1169 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/DEV_TO/N0006 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/DEV_TO/FAST_1167 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/DEV_TO/WAS_FAST_1166 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/DEV_TO/WAS_SLOW_1165 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/DEV_TO/WAS_MEDIUM_1164 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/M_FIRSTIN ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/IIRDY__1162 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/IIRDY_I__1161 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/REQ64/IREQ64__1160 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/REQ64/IREQ64_I__1159 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/FRAME/IFRAME__1158 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/HOLD_OE_PERR_1157 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/SET_OE_PERR ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/REQUESTQ_1155 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/SLOT_1154 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/OE_FRAME_NS ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/SLOT64_INT_1152 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/OE_FRAME_NS64 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/OE_REQ64_INT_1150 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/OE_FRAME_INT_1149 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/OE_FRAME_NS_OER ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/CE_OER ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/OE_FRAME_NS_OEF ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/CE_OEF ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/NS_OE_PERR_1144 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/ADDR_BE_Q_1143 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/ATTEMPT64_1142 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/N0046 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/REQUEST_1140 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/N0030_1139 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/N0038 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/REQUEST64Q_1137 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/REQUEST64_1136 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/IREAD64_1135 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/NS_IREAD64 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/GNT_ ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/NS_REQ_ ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/N0038_1131 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFERFAIL/NS_FAIL64 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/STAR/NS_S_TAR ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/ADDR/ADDR_BE_1128 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/ADDR/NS_ABE ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/ADDR/NS_MAN ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/M_DATA/NS_MDATA_1125 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/FRAME/IFRAME_I__1111 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL1 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL2 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL3 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL4 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL5 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL6 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL7 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/REQ/X_1092 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/REQ/N0008 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/REQ/S_TARQ_1090 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/STAR/S_TAR_1089 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/DR_BUS/NS_DR_BUS ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/I_IDLE/NS_I_IDLE ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/APERR_N_1086 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/PRE_APERR_N ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADDR_VLDQ_956 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/LC_PERR__955 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/M_DATA2Q_954 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/M_DATAQ_953 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_OE_SERR ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/INTACKQ_951 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/INTACK ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/CE3_1 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/M_FIRST_904 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CBE_0_903 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CBE_1_902 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CBE_2_901 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CBE_3_900 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CBE_4_899 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CBE_7_898 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CBE_5_897 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CBE_6_896 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_61_895 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_63_894 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_62_893 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_60_892 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_59_891 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_58_890 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_57_889 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_54_888 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_56_887 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_55_886 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_51_885 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_53_884 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_52_883 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_48_882 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_50_881 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_49_880 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_47_879 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_46_878 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_45_877 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_44_876 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_41_875 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_43_874 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_42_873 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_38_872 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_40_871 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_39_870 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_35_869 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_37_868 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_36_867 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_34_866 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_33_865 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_32_864 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_31_863 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_28_862 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_30_861 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_29_860 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_25_859 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_27_858 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_26_857 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_22_856 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_24_855 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_23_854 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_21_853 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_20_852 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_19_851 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_18_850 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_15_849 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_17_848 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_16_847 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_14_846 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_13_845 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_12_844 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_11_843 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_8_842 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_10_841 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_9_840 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_7_839 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_6_838 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_5_837 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_4_836 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_1_835 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_3_834 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_2_833 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_0_832 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/IDSEL ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/NS_IRDY_ ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/NS_FRAME_ ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/NS_REQ64_ ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/FRAME_CE ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/NS_TRDY_ ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/NS_STOP_ ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/NS_DEVSEL_ ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/NS_ACK64_ ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/NS_PERR_ ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/NS_PAR64 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/NS_PAR ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/PAR_CE_818 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/ADDR_VLD/FRAMEQ__817 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/ADDR_VLD/REQ64Q__816 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/SEL_IN_814 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/DATA_VLD/N0008 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/DATA_VLD/N0014 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/EOT/EOT_DL_734 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/EOT/EOT_733 ;
  wire \BU2/U0/pci32_inst/PCI_LC_I/EOT/OEOT_D ;
  wire \BU2/U0/pci32_inst/ADT[32] ;
  wire \BU2/U0/pci32_inst/ADT[40] ;
  wire \BU2/U0/pci32_inst/ADT[48] ;
  wire \BU2/U0/pci32_inst/ADT[56] ;
  wire NLW_VCC_P_UNCONNECTED;
  wire NLW_GND_G_UNCONNECTED;
  wire [31 : 0] ado_2;
  wire [31 : 0] adi_3;
  wire [31 : 0] add_4;
  wire [0 : 0] NlwRenamedSig_OI_adt;
  wire [3 : 0] cbo_5;
  wire [3 : 0] cbi_6;
  wire [3 : 0] cbd_7;
  wire [0 : 0] NlwRenamedSignal_cbt;
  wire [7 : 2] NlwRenamedSig_OI_addr;
  wire [31 : 0] adio_in_8;
  wire [31 : 0] NlwRenamedSig_OI_adio_out;
  wire [3 : 0] NlwRenamedSig_OI_base_hit;
  wire [3 : 0] NlwRenamedSig_OI_s_cbe;
  wire [3 : 0] m_cbe_9;
  wire [38 : 32] csr_10;
  wire [7 : 0] \BU2/U0/pci32_inst/PCI_LC_I/CBEOUT ;
  wire [7 : 0] \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/D ;
  wire [7 : 0] \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/A ;
  wire [7 : 0] \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/C ;
  wire [7 : 0] \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/B ;
  wire [7 : 0] \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/E ;
  wire [0 : 0] \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_LUT ;
  wire [6 : 0] \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY ;
  wire [7 : 0] \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT ;
  wire [0 : 0] \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_LUT ;
  wire [6 : 0] \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY ;
  wire [0 : 0] \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_LUT ;
  wire [6 : 0] \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY ;
  wire [0 : 0] \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_LUT ;
  wire [6 : 0] \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY ;
  wire [0 : 0] \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_LUT ;
  wire [6 : 0] \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY ;
  wire [7 : 0] \BU2/U0/pci32_inst/PCI_LC_I/PCI_IREG/INTERRUPTLINE ;
  wire [27 : 4] \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT ;
  wire [9 : 0] \BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_LUT ;
  wire [8 : 0] \BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_CY ;
  wire [27 : 4] \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT ;
  wire [9 : 0] \BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_LUT ;
  wire [8 : 0] \BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_CY ;
  wire [27 : 4] \BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT ;
  wire [9 : 0] \BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_LUT ;
  wire [8 : 0] \BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_CY ;
  wire [7 : 0] \BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_LUT ;
  wire [6 : 0] \BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_CY ;
  wire [7 : 0] \BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/CNT_VAL ;
  wire [63 : 0] \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ ;
  wire [63 : 0] \BU2/U0/pci32_inst/PCI_LC_I/ADOUT ;
  wire [15 : 8] \BU2/U0/pci32_inst/PCI_LC_I/REG_0CH ;
  wire [7 : 4] \BU2/U0/pci32_inst/PCI_LC_I/FAIL_CBH ;
  wire [63 : 32] \BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH ;
  wire [4 : 1] \BU2/U0/pci32_inst/PCI_LC_I/IRDY_I_LUT_DELAY_STAGE ;
  wire [4 : 1] \BU2/U0/pci32_inst/PCI_LC_I/PAR64_I_LUT_DELAY_STAGE ;
  wire [4 : 1] \BU2/U0/pci32_inst/PCI_LC_I/ACK64_I_LUT_DELAY_STAGE ;
  wire [4 : 1] \BU2/U0/pci32_inst/PCI_LC_I/PAR_I_LUT_DELAY_STAGE ;
  wire [4 : 1] \BU2/U0/pci32_inst/PCI_LC_I/STOP_I_LUT_DELAY_STAGE ;
  wire [4 : 1] \BU2/U0/pci32_inst/PCI_LC_I/FRAME_I_LUT_DELAY_STAGE ;
  wire [4 : 1] \BU2/U0/pci32_inst/PCI_LC_I/REQ64_I_LUT_DELAY_STAGE ;
  wire [4 : 1] \BU2/U0/pci32_inst/PCI_LC_I/GNT_IN_LUT_DELAY_STAGE ;
  wire [4 : 1] \BU2/U0/pci32_inst/PCI_LC_I/TRDY_I_LUT_DELAY_STAGE ;
  wire [4 : 1] \BU2/U0/pci32_inst/PCI_LC_I/DEVSEL_I_LUT_DELAY_STAGE ;
  wire [4 : 1] \BU2/U0/pci32_inst/PCI_LC_I/CBE_I0_LUT_DELAY_STAGE ;
  wire [4 : 1] \BU2/U0/pci32_inst/PCI_LC_I/CBE_I1_LUT_DELAY_STAGE ;
  wire [4 : 1] \BU2/U0/pci32_inst/PCI_LC_I/CBE_I2_LUT_DELAY_STAGE ;
  wire [4 : 1] \BU2/U0/pci32_inst/PCI_LC_I/CBE_I3_LUT_DELAY_STAGE ;
  wire [4 : 1] \BU2/U0/pci32_inst/PCI_LC_I/CBE_I4_LUT_DELAY_STAGE ;
  wire [4 : 1] \BU2/U0/pci32_inst/PCI_LC_I/CBE_I5_LUT_DELAY_STAGE ;
  wire [4 : 1] \BU2/U0/pci32_inst/PCI_LC_I/CBE_I6_LUT_DELAY_STAGE ;
  wire [4 : 1] \BU2/U0/pci32_inst/PCI_LC_I/CBE_I7_LUT_DELAY_STAGE ;
  wire [7 : 4] \BU2/U0/pci32_inst/S_CBE ;
  wire [63 : 32] \BU2/U0/pci32_inst/ADIO_OUT ;
  wire [4 : 4] \BU2/U0/pci32_inst/CBT ;
  wire [7 : 4] \BU2/U0/pci32_inst/CBO ;
  wire [63 : 32] \BU2/U0/pci32_inst/ADO ;
  assign
    s_wrdn = NlwRenamedSig_OI_s_wrdn,
    base_hit[7] = NlwRenamedSig_OI_base_hit[3],
    base_hit[6] = NlwRenamedSig_OI_base_hit[3],
    base_hit[5] = NlwRenamedSig_OI_base_hit[3],
    base_hit[4] = NlwRenamedSig_OI_base_hit[3],
    base_hit[3] = NlwRenamedSig_OI_base_hit[3],
    base_hit[2] = NlwRenamedSig_OI_base_hit[2],
    base_hit[1] = NlwRenamedSig_OI_base_hit[1],
    base_hit[0] = NlwRenamedSig_OI_base_hit[0],
    m_cbe_9[3] = m_cbe[3],
    m_cbe_9[2] = m_cbe[2],
    m_cbe_9[1] = m_cbe[1],
    m_cbe_9[0] = m_cbe[0],
    dr_bus = NlwRenamedSig_OI_dr_bus,
    backoff = NlwRenamedSig_OI_backoff,
    irdyq_n = NlwRenamedSig_OI_irdyq_n,
    cbd_7[3] = cbd[3],
    cbd_7[2] = cbd[2],
    cbd_7[1] = cbd[1],
    cbd_7[0] = cbd[0],
    cbi_6[3] = cbi[3],
    cbi_6[2] = cbi[2],
    cbi_6[1] = cbi[1],
    cbi_6[0] = cbi[0],
    cbo[3] = cbo_5[3],
    cbo[2] = cbo_5[2],
    cbo[1] = cbo_5[1],
    cbo[0] = cbo_5[0],
    pciw_en = NlwRenamedSig_OI_pciw_en,
    cbt[3] = NlwRenamedSignal_cbt[0],
    cbt[2] = NlwRenamedSignal_cbt[0],
    cbt[1] = NlwRenamedSignal_cbt[0],
    cbt[0] = NlwRenamedSignal_cbt[0],
    into = NlwRenamedSig_OI_base_hit[3],
    cfg[511] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[510] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[509] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[508] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[507] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[506] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[505] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[504] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[503] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[502] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[501] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[500] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[499] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[498] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[497] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[496] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[495] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[494] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[493] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[492] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[491] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[490] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[489] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[488] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[487] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[486] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[485] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[484] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[483] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[482] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[481] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[480] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[479] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[478] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[477] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[476] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[475] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[474] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[473] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[472] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[471] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[470] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[469] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[468] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[467] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[466] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[465] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[464] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[463] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[462] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[461] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[460] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[459] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[458] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[457] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[456] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[455] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[454] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[453] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[452] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[451] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[450] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[449] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[448] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[447] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[446] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[445] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[444] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[443] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[442] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[441] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[440] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[439] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[438] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[437] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[436] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[435] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[434] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[433] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[432] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[431] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[430] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[429] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[428] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[427] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[426] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[425] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[424] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[423] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[422] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[421] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[420] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[419] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[418] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[417] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[416] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[415] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[414] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[413] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[412] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[411] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[410] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[409] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[408] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[407] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[406] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[405] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[404] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[403] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[402] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[401] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[400] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[399] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[398] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[397] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[396] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[395] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[394] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[393] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[392] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[391] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[390] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[389] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[388] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[387] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[386] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[385] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[384] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[383] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[382] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[381] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[380] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[379] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[378] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[377] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[376] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[375] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[374] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[373] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[372] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[371] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[370] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[369] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[368] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[367] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[366] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[365] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[364] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[363] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[362] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[361] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[360] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[359] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[358] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[357] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[356] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[355] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[354] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[353] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[352] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[351] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[350] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[349] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[348] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[347] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[346] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[345] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[344] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[343] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[342] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[341] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[340] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[339] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[338] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[337] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[336] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[335] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[334] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[333] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[332] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[331] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[330] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[329] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[328] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[327] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[326] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[325] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[324] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[323] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[322] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[321] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[320] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[319] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[318] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[317] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[316] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[315] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[314] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[313] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[312] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[311] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[310] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[309] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[308] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[307] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[306] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[305] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[304] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[303] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[302] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[301] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[300] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[299] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[298] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[297] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[296] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[295] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[294] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[293] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[292] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[291] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[290] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[289] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[288] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[287] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[286] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[285] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[284] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[283] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[282] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[281] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[280] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[279] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[278] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[277] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[276] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[275] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[274] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[273] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[272] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[271] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[270] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[269] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[268] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[267] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[266] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[265] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[264] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[263] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[262] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[261] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[260] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[259] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[258] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[257] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[256] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[255] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[254] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[253] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[252] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[251] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[250] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[249] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[248] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[247] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[246] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[245] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[244] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[243] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[242] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[241] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[240] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[239] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[238] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[237] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[236] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[235] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[234] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[233] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[232] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[231] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[230] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[229] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[228] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[227] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[226] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[225] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[224] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[223] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[222] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[221] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[220] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[219] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[218] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[217] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[216] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[215] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[214] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[213] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[212] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[211] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[210] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[209] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[208] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[207] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[206] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[205] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[204] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[203] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[202] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[201] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[200] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[199] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[198] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[197] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[196] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[195] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[194] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[193] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[192] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[191] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[190] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[189] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[188] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[187] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[186] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[185] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[184] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[183] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[182] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[181] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[180] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[179] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[178] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[177] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[176] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[175] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[174] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[173] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[172] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[171] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[170] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[169] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[168] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[167] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[166] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[165] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[164] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[163] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[162] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[161] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[160] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[159] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[158] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[157] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[156] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[155] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[154] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[153] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[152] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[151] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[150] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[149] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[148] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[147] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[146] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[145] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[144] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[143] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[142] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[141] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[140] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[139] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[138] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[137] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[136] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[135] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[134] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[133] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[132] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[131] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[130] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[129] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[128] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[127] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[126] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[125] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[124] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[123] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[122] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[121] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[120] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[119] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[118] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[117] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[116] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[115] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[114] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[113] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[112] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[111] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[110] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[109] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[108] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[107] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[106] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[105] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[104] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[103] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[102] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[101] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[100] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[99] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[98] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[97] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[96] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[95] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[94] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[93] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[92] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[91] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[90] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[89] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[88] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[87] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[86] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[85] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[84] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[83] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[82] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[81] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[80] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[79] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[78] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[77] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[76] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[75] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[74] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[73] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[72] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[71] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[70] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[69] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[68] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[67] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[66] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[65] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[64] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[63] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[62] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[61] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[60] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[59] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[58] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[57] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[56] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[55] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[54] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[53] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[52] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[51] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[50] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[49] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[48] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[47] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[46] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[45] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[44] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[43] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[42] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[41] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[40] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[39] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[38] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[37] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[36] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[35] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[34] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[33] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[32] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[31] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[30] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[29] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[28] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[27] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[26] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[25] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[24] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[23] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[22] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[21] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[20] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[19] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[18] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[17] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[16] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[15] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[14] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[13] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[12] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[11] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[10] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[9] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[8] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[7] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[6] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[5] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[4] = \NlwRenamedSig_OI_cfg[0] ,
    cfg[3] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[2] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[1] = \NlwRenamedSig_OI_cfg[116] ,
    cfg[0] = \NlwRenamedSig_OI_cfg[0] ,
    s_data = NlwRenamedSig_OI_s_data,
    idle = NlwRenamedSig_OI_idle,
    adio_out[31] = NlwRenamedSig_OI_adio_out[31],
    adio_out[30] = NlwRenamedSig_OI_adio_out[30],
    adio_out[29] = NlwRenamedSig_OI_adio_out[29],
    adio_out[28] = NlwRenamedSig_OI_adio_out[28],
    adio_out[27] = NlwRenamedSig_OI_adio_out[27],
    adio_out[26] = NlwRenamedSig_OI_adio_out[26],
    adio_out[25] = NlwRenamedSig_OI_adio_out[25],
    adio_out[24] = NlwRenamedSig_OI_adio_out[24],
    adio_out[23] = NlwRenamedSig_OI_adio_out[23],
    adio_out[22] = NlwRenamedSig_OI_adio_out[22],
    adio_out[21] = NlwRenamedSig_OI_adio_out[21],
    adio_out[20] = NlwRenamedSig_OI_adio_out[20],
    adio_out[19] = NlwRenamedSig_OI_adio_out[19],
    adio_out[18] = NlwRenamedSig_OI_adio_out[18],
    adio_out[17] = NlwRenamedSig_OI_adio_out[17],
    adio_out[16] = NlwRenamedSig_OI_adio_out[16],
    adio_out[15] = NlwRenamedSig_OI_adio_out[15],
    adio_out[14] = NlwRenamedSig_OI_adio_out[14],
    adio_out[13] = NlwRenamedSig_OI_adio_out[13],
    adio_out[12] = NlwRenamedSig_OI_adio_out[12],
    adio_out[11] = NlwRenamedSig_OI_adio_out[11],
    adio_out[10] = NlwRenamedSig_OI_adio_out[10],
    adio_out[9] = NlwRenamedSig_OI_adio_out[9],
    adio_out[8] = NlwRenamedSig_OI_adio_out[8],
    adio_out[7] = NlwRenamedSig_OI_adio_out[7],
    adio_out[6] = NlwRenamedSig_OI_adio_out[6],
    adio_out[5] = NlwRenamedSig_OI_adio_out[5],
    adio_out[4] = NlwRenamedSig_OI_adio_out[4],
    adio_out[3] = NlwRenamedSig_OI_adio_out[3],
    adio_out[2] = NlwRenamedSig_OI_adio_out[2],
    adio_out[1] = NlwRenamedSig_OI_adio_out[1],
    adio_out[0] = NlwRenamedSig_OI_adio_out[0],
    time_out = NlwRenamedSig_OI_time_out,
    devselq_n = NlwRenamedSig_OI_devselq_n,
    trdyq_n = NlwRenamedSig_OI_trdyq_n,
    adio_in_8[31] = adio_in[31],
    adio_in_8[30] = adio_in[30],
    adio_in_8[29] = adio_in[29],
    adio_in_8[28] = adio_in[28],
    adio_in_8[27] = adio_in[27],
    adio_in_8[26] = adio_in[26],
    adio_in_8[25] = adio_in[25],
    adio_in_8[24] = adio_in[24],
    adio_in_8[23] = adio_in[23],
    adio_in_8[22] = adio_in[22],
    adio_in_8[21] = adio_in[21],
    adio_in_8[20] = adio_in[20],
    adio_in_8[19] = adio_in[19],
    adio_in_8[18] = adio_in[18],
    adio_in_8[17] = adio_in[17],
    adio_in_8[16] = adio_in[16],
    adio_in_8[15] = adio_in[15],
    adio_in_8[14] = adio_in[14],
    adio_in_8[13] = adio_in[13],
    adio_in_8[12] = adio_in[12],
    adio_in_8[11] = adio_in[11],
    adio_in_8[10] = adio_in[10],
    adio_in_8[9] = adio_in[9],
    adio_in_8[8] = adio_in[8],
    adio_in_8[7] = adio_in[7],
    adio_in_8[6] = adio_in[6],
    adio_in_8[5] = adio_in[5],
    adio_in_8[4] = adio_in[4],
    adio_in_8[3] = adio_in[3],
    adio_in_8[2] = adio_in[2],
    adio_in_8[1] = adio_in[1],
    adio_in_8[0] = adio_in[0],
    b_busy = NlwRenamedSig_OI_b_busy,
    s_cbe[3] = NlwRenamedSig_OI_s_cbe[3],
    s_cbe[2] = NlwRenamedSig_OI_s_cbe[2],
    s_cbe[1] = NlwRenamedSig_OI_s_cbe[1],
    s_cbe[0] = NlwRenamedSig_OI_s_cbe[0],
    NlwRenamedSignal_pme_n = pme_n,
    frameq_n = NlwRenamedSig_OI_frameq_n,
    add_4[31] = add[31],
    add_4[30] = add[30],
    add_4[29] = add[29],
    add_4[28] = add[28],
    add_4[27] = add[27],
    add_4[26] = add[26],
    add_4[25] = add[25],
    add_4[24] = add[24],
    add_4[23] = add[23],
    add_4[22] = add[22],
    add_4[21] = add[21],
    add_4[20] = add[20],
    add_4[19] = add[19],
    add_4[18] = add[18],
    add_4[17] = add[17],
    add_4[16] = add[16],
    add_4[15] = add[15],
    add_4[14] = add[14],
    add_4[13] = add[13],
    add_4[12] = add[12],
    add_4[11] = add[11],
    add_4[10] = add[10],
    add_4[9] = add[9],
    add_4[8] = add[8],
    add_4[7] = add[7],
    add_4[6] = add[6],
    add_4[5] = add[5],
    add_4[4] = add[4],
    add_4[3] = add[3],
    add_4[2] = add[2],
    add_4[1] = add[1],
    add_4[0] = add[0],
    addr_vld = NlwRenamedSig_OI_addr_vld,
    adi_3[31] = adi[31],
    adi_3[30] = adi[30],
    adi_3[29] = adi[29],
    adi_3[28] = adi[28],
    adi_3[27] = adi[27],
    adi_3[26] = adi[26],
    adi_3[25] = adi[25],
    adi_3[24] = adi[24],
    adi_3[23] = adi[23],
    adi_3[22] = adi[22],
    adi_3[21] = adi[21],
    adi_3[20] = adi[20],
    adi_3[19] = adi[19],
    adi_3[18] = adi[18],
    adi_3[17] = adi[17],
    adi_3[16] = adi[16],
    adi_3[15] = adi[15],
    adi_3[14] = adi[14],
    adi_3[13] = adi[13],
    adi_3[12] = adi[12],
    adi_3[11] = adi[11],
    adi_3[10] = adi[10],
    adi_3[9] = adi[9],
    adi_3[8] = adi[8],
    adi_3[7] = adi[7],
    adi_3[6] = adi[6],
    adi_3[5] = adi[5],
    adi_3[4] = adi[4],
    adi_3[3] = adi[3],
    adi_3[2] = adi[2],
    adi_3[1] = adi[1],
    adi_3[0] = adi[0],
    serro = NlwRenamedSig_OI_base_hit[3],
    ado[31] = ado_2[31],
    ado[30] = ado_2[30],
    ado[29] = ado_2[29],
    ado[28] = ado_2[28],
    ado[27] = ado_2[27],
    ado[26] = ado_2[26],
    ado[25] = ado_2[25],
    ado[24] = ado_2[24],
    ado[23] = ado_2[23],
    ado[22] = ado_2[22],
    ado[21] = ado_2[21],
    ado[20] = ado_2[20],
    ado[19] = ado_2[19],
    ado[18] = ado_2[18],
    ado[17] = ado_2[17],
    ado[16] = ado_2[16],
    ado[15] = ado_2[15],
    ado[14] = ado_2[14],
    ado[13] = ado_2[13],
    ado[12] = ado_2[12],
    ado[11] = ado_2[11],
    ado[10] = ado_2[10],
    ado[9] = ado_2[9],
    ado[8] = ado_2[8],
    ado[7] = ado_2[7],
    ado[6] = ado_2[6],
    ado[5] = ado_2[5],
    ado[4] = ado_2[4],
    ado[3] = ado_2[3],
    ado[2] = ado_2[2],
    ado[1] = ado_2[1],
    ado[0] = ado_2[0],
    adt[31] = \NlwRenamedSignal_adt[24] ,
    adt[30] = \NlwRenamedSignal_adt[24] ,
    adt[29] = \NlwRenamedSignal_adt[24] ,
    adt[28] = \NlwRenamedSignal_adt[24] ,
    adt[27] = \NlwRenamedSignal_adt[24] ,
    adt[26] = \NlwRenamedSignal_adt[24] ,
    adt[25] = \NlwRenamedSignal_adt[24] ,
    adt[24] = \NlwRenamedSignal_adt[24] ,
    adt[23] = \NlwRenamedSignal_adt[16] ,
    adt[22] = \NlwRenamedSignal_adt[16] ,
    adt[21] = \NlwRenamedSignal_adt[16] ,
    adt[20] = \NlwRenamedSignal_adt[16] ,
    adt[19] = \NlwRenamedSignal_adt[16] ,
    adt[18] = \NlwRenamedSignal_adt[16] ,
    adt[17] = \NlwRenamedSignal_adt[16] ,
    adt[16] = \NlwRenamedSignal_adt[16] ,
    adt[15] = \NlwRenamedSignal_adt[10] ,
    adt[14] = \NlwRenamedSignal_adt[10] ,
    adt[13] = \NlwRenamedSignal_adt[10] ,
    adt[12] = \NlwRenamedSignal_adt[10] ,
    adt[11] = \NlwRenamedSignal_adt[10] ,
    adt[10] = \NlwRenamedSignal_adt[10] ,
    adt[9] = \NlwRenamedSignal_adt[10] ,
    adt[8] = \NlwRenamedSignal_adt[10] ,
    adt[7] = NlwRenamedSig_OI_adt[0],
    adt[6] = NlwRenamedSig_OI_adt[0],
    adt[5] = NlwRenamedSig_OI_adt[0],
    adt[4] = NlwRenamedSig_OI_adt[0],
    adt[3] = NlwRenamedSig_OI_adt[0],
    adt[2] = NlwRenamedSig_OI_adt[0],
    adt[1] = NlwRenamedSig_OI_adt[0],
    adt[0] = NlwRenamedSig_OI_adt[0],
    perrq_n = NlwRenamedSig_OI_perrq_n,
    pci_cmd[11] = \NlwRenamedSig_OI_pci_cmd[11] ,
    pci_cmd[10] = \NlwRenamedSig_OI_pci_cmd[10] ,
    pci_cmd[1] = \NlwRenamedSig_OI_pci_cmd[1] ,
    csr[39] = \NlwRenamedSig_OI_csr[39] ,
    csr[38] = csr_10[38],
    csr[37] = csr_10[37],
    csr[36] = csr_10[36],
    csr[35] = csr_10[35],
    csr[34] = csr_10[34],
    csr[33] = csr_10[33],
    csr[32] = csr_10[32],
    csr[31] = \NlwRenamedSig_OI_csr[31] ,
    csr[30] = \NlwRenamedSig_OI_csr[30] ,
    csr[29] = \NlwRenamedSig_OI_csr[29] ,
    csr[28] = \NlwRenamedSig_OI_csr[28] ,
    csr[27] = \NlwRenamedSig_OI_csr[27] ,
    csr[26] = NlwRenamedSig_OI_base_hit[3],
    csr[25] = \NlwRenamedSig_OI_csr[25] ,
    csr[24] = \NlwRenamedSig_OI_csr[24] ,
    csr[23] = NlwRenamedSig_OI_base_hit[3],
    csr[22] = NlwRenamedSig_OI_base_hit[3],
    csr[21] = \NlwRenamedSig_OI_cfg[0] ,
    csr[20] = \NlwRenamedSig_OI_csr[20] ,
    csr[19] = \NlwRenamedSig_OI_csr[19] ,
    csr[18] = NlwRenamedSig_OI_base_hit[3],
    csr[17] = NlwRenamedSig_OI_base_hit[3],
    csr[16] = NlwRenamedSig_OI_base_hit[3],
    csr[15] = NlwRenamedSig_OI_base_hit[3],
    csr[14] = NlwRenamedSig_OI_base_hit[3],
    csr[13] = NlwRenamedSig_OI_base_hit[3],
    csr[12] = NlwRenamedSig_OI_base_hit[3],
    csr[11] = NlwRenamedSig_OI_base_hit[3],
    csr[10] = \NlwRenamedSig_OI_csr[10] ,
    csr[9] = NlwRenamedSig_OI_base_hit[3],
    csr[8] = \NlwRenamedSig_OI_csr[8] ,
    csr[7] = NlwRenamedSig_OI_base_hit[3],
    csr[6] = \NlwRenamedSig_OI_csr[6] ,
    csr[5] = NlwRenamedSig_OI_base_hit[3],
    csr[4] = NlwRenamedSig_OI_base_hit[3],
    csr[3] = NlwRenamedSig_OI_base_hit[3],
    csr[2] = \NlwRenamedSig_OI_csr[2] ,
    csr[1] = \NlwRenamedSig_OI_csr[1] ,
    csr[0] = \NlwRenamedSig_OI_csr[0] ,
    cfg_hit = NlwRenamedSig_OI_cfg_hit,
    m_data = NlwRenamedSig_OI_m_data,
    pmeo = NlwRenamedSig_OI_base_hit[3],
    i_idle = NlwRenamedSig_OI_i_idle,
    pmet = NlwRenamedSignal_pme_n,
    stopq_n = NlwRenamedSig_OI_stopq_n,
    addr[7] = NlwRenamedSig_OI_addr[7],
    addr[6] = NlwRenamedSig_OI_addr[6],
    addr[5] = NlwRenamedSig_OI_addr[5],
    addr[4] = NlwRenamedSig_OI_addr[4],
    addr[3] = NlwRenamedSig_OI_addr[3],
    addr[2] = NlwRenamedSig_OI_addr[2];
  VCC   VCC_0 (
    .P(NLW_VCC_P_UNCONNECTED)
  );
  GND   GND_1 (
    .G(NLW_GND_G_UNCONNECTED)
  );
  FD   \BU2/U0/ff_drive_zero_1  (
    .C(clk),
    .D(rst),
    .Q(\BU2/U0/ff_drive_zero_1_2576 )
  );
  VCC   \BU2/XST_VCC  (
    .P(\NlwRenamedSig_OI_cfg[116] )
  );
  GND   \BU2/XST_GND  (
    .G(\NlwRenamedSig_OI_cfg[0] )
  );
  MUXF7   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/BUG_FIX_RSTPOT_F7  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/BUG_FIX_1625 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/BUG_FIX_RSTPOT1_2162 ),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/E [7]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/BUG_FIX_RSTPOT )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF80000000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/BUG_FIX_RSTPOT1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/E [6]),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/E [5]),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/E [4]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/D_OUT_1568 ),
    .I4(\BU2/U0/pci32_inst/N16 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/BUG_FIX_1625 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/BUG_FIX_RSTPOT1_2162 )
  );
  MUXF7   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFERFAIL/MMUX_NS_FAIL641_F7  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFERFAIL/MMUX_NS_FAIL6411_2161 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFERFAIL/MMUX_NS_FAIL641 ),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/TRDY_I_LUT_DELAY_STAGE [2]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFERFAIL/NS_FAIL64 )
  );
  LUT6 #(
    .INIT ( 64'hF0F0F0F000200000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFERFAIL/MMUX_NS_FAIL6412  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/ACK64_I_LUT_DELAY_STAGE [3]),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/DEVSEL_I_LUT_DELAY_STAGE [3]),
    .I2(NlwRenamedSig_OI_m_data),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/IIRDY_I__1161 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/ATTEMPT64_1142 ),
    .I5(\BU2/m_fail64 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFERFAIL/MMUX_NS_FAIL6411_2161 )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFERFAIL/MMUX_NS_FAIL6411  (
    .I0(NlwRenamedSig_OI_m_data),
    .I1(\BU2/m_fail64 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFERFAIL/MMUX_NS_FAIL641 )
  );
  MUXF7   \BU2/U0/pci32_inst/PCI_LC_I/SRC_EN/S_SRC_EN_F7  (
    .I0(NlwRenamedSig_OI_base_hit[3]),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/SRC_EN/S_SRC_EN ),
    .S(s_ready),
    .O(s_src_en)
  );
  LUT6 #(
    .INIT ( 64'h5555004000400040 ))
  \BU2/U0/pci32_inst/PCI_LC_I/SRC_EN/S_SRC_EN1  (
    .I0(NlwRenamedSig_OI_s_wrdn),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/TSTOP_I__1212 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/NEWDATA_1265 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_DSEL/TDEVSEL_I__1209 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/S_FIRST_1208 ),
    .I5(NlwRenamedSig_OI_s_data),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/SRC_EN/S_SRC_EN )
  );
  INV   \BU2/U0/pci32_inst/XPCI_WATCHDOG/PCI64B1_INV_0  (
    .I(\BU2/U0/ff_drive_zero_1_2576 ),
    .O(\BU2/U0/pci32_inst/XPCI_WATCHDOG/PCI64B )
  );
  INV   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CSR/N00921_INV_0  (
    .I(int_n),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CSR/N0092 )
  );
  INV   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_LUT<0>_INV_0  (
    .I(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/B [0]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_LUT [0])
  );
  INV   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_LUT<0>_INV_0  (
    .I(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/D [0]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_LUT [0])
  );
  INV   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_LUT<0>_INV_0  (
    .I(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/A [0]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_LUT [0])
  );
  INV   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_LUT<0>_INV_0  (
    .I(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/C [0]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_LUT [0])
  );
  INV   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_LUT<0>_INV_0  (
    .I(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/E [0]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_LUT [0])
  );
  LUT4 #(
    .INIT ( 16'hFFAE ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/I_IDLE/NS_I_IDLE29_G  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/N121 ),
    .I1(NlwRenamedSig_OI_dr_bus),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/ADDR/ADDR_BE_1128 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/I_IDLE/NS_I_IDLE5_1730 ),
    .O(\BU2/U0/pci32_inst/N385 )
  );
  LUT6 #(
    .INIT ( 64'hFFFF0088FFFF0080 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/I_IDLE/NS_I_IDLE29_F  (
    .I0(NlwRenamedSig_OI_dr_bus),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/REQUEST_1140 ),
    .I2(\NlwRenamedSig_OI_csr[2] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/ADDR/ADDR_BE_1128 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/I_IDLE/NS_I_IDLE5_1730 ),
    .I5(cfg_self),
    .O(\BU2/U0/pci32_inst/N384 )
  );
  MUXF7   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/I_IDLE/NS_I_IDLE29  (
    .I0(\BU2/U0/pci32_inst/N384 ),
    .I1(\BU2/U0/pci32_inst/N385 ),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/GNT_ ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/I_IDLE/NS_I_IDLE )
  );
  LUT5 #(
    .INIT ( 32'h00800000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2728_G  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [4]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/N25 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE5__1229 ),
    .I4(\BU2/U0/pci32_inst/OLD[37] ),
    .O(\BU2/U0/pci32_inst/N383 )
  );
  LUT5 #(
    .INIT ( 32'hC0004000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2728_F  (
    .I0(\BU2/U0/pci32_inst/OLD[37] ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/N25 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [4]),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE5__1229 ),
    .O(\BU2/U0/pci32_inst/N382 )
  );
  MUXF7   \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2728  (
    .I0(\BU2/U0/pci32_inst/N382 ),
    .I1(\BU2/U0/pci32_inst/N383 ),
    .S(\BU2/U0/pci32_inst/N318 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2728_2077 )
  );
  LUT5 #(
    .INIT ( 32'h00800000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2828_G  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [5]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/N25 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE5__1229 ),
    .I4(\BU2/U0/pci32_inst/OLD[37] ),
    .O(\BU2/U0/pci32_inst/N381 )
  );
  LUT5 #(
    .INIT ( 32'hC0004000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2828_F  (
    .I0(\BU2/U0/pci32_inst/OLD[37] ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/N25 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [5]),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE5__1229 ),
    .O(\BU2/U0/pci32_inst/N380 )
  );
  MUXF7   \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2828  (
    .I0(\BU2/U0/pci32_inst/N380 ),
    .I1(\BU2/U0/pci32_inst/N381 ),
    .S(\BU2/U0/pci32_inst/N318 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2828_2073 )
  );
  LUT5 #(
    .INIT ( 32'h00800000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT3028_G  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [7]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/N25 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE5__1229 ),
    .I4(\BU2/U0/pci32_inst/OLD[37] ),
    .O(\BU2/U0/pci32_inst/N379 )
  );
  LUT5 #(
    .INIT ( 32'hC0004000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT3028_F  (
    .I0(\BU2/U0/pci32_inst/OLD[37] ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/N25 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [7]),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE5__1229 ),
    .O(\BU2/U0/pci32_inst/N378 )
  );
  MUXF7   \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT3028  (
    .I0(\BU2/U0/pci32_inst/N378 ),
    .I1(\BU2/U0/pci32_inst/N379 ),
    .S(\BU2/U0/pci32_inst/N318 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT3028_2069 )
  );
  LUT6 #(
    .INIT ( 64'hAF8C8C8C8C8C8C8C ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/FRAME/MMUX_NS_FRAME_159  (
    .I0(gnti),
    .I1(\BU2/U0/pci32_inst/N376 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/ADDR/ADDR_BE_1128 ),
    .I3(NlwRenamedSig_OI_devselq_n),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/DEV_TO/PASS_TO_1172 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/DEV_TO/WAS_SUBTRACTIVE_1169 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/NS_FRAME_ )
  );
  LUT4 #(
    .INIT ( 16'hFFEF ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/FRAME/MMUX_NS_FRAME_159_SW0  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/FRAME/MMUX_NS_FRAME_138_1759 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/FRAME/IFRAME_I__1111 ),
    .I2(NlwRenamedSig_OI_m_data),
    .I3(\BU2/m_fail64 ),
    .O(\BU2/U0/pci32_inst/N376 )
  );
  LUT6 #(
    .INIT ( 64'hA8FCAAFFFCFCFFFF ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/REQ64/MMUX_NS_REQ64_161  (
    .I0(gnti),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/REQ64/MMUX_NS_REQ64_140_1760 ),
    .I2(\BU2/U0/pci32_inst/N374 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/ADDR/ADDR_BE_1128 ),
    .I4(NlwRenamedSig_OI_m_data),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/REQUEST64_1136 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/NS_REQ64_ )
  );
  LUT5 #(
    .INIT ( 32'hFEEEEEEE ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/REQ64/MMUX_NS_REQ64_161_SW0  (
    .I0(\BU2/m_fail64 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/REQ64/IREQ64_I__1159 ),
    .I2(NlwRenamedSig_OI_devselq_n),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/DEV_TO/PASS_TO_1172 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/DEV_TO/WAS_SUBTRACTIVE_1169 ),
    .O(\BU2/U0/pci32_inst/N374 )
  );
  LUT6 #(
    .INIT ( 64'h8DFF8D8D8DFF8DFF ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/MMUX_OE_CBE6411  (
    .I0(bw_detect_dis),
    .I1(bw_manual_32b),
    .I2(\BU2/U0/pci32_inst/XPCI_WATCHDOG/PCIW ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/START_AD64 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/EOT/EOT_733 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/SLOT64_INT_1152 ),
    .O(\BU2/U0/pci32_inst/CBT [4])
  );
  LUT6 #(
    .INIT ( 64'h0000000000080000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_CE/CE1_31  (
    .I0(NlwRenamedSig_OI_s_wrdn),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/LADX1_1241 ),
    .I2(NlwRenamedSig_OI_s_cbe[3]),
    .I3(NlwRenamedSig_OI_irdyq_n),
    .I4(\NlwRenamedSig_OI_pci_cmd[11] ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/TRDYDEL_1206 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CE1_3 )
  );
  LUT6 #(
    .INIT ( 64'hDDD8DD8888D88888 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT12186_SW0  (
    .I0(\BU2/m_fail64 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [33]),
    .I2(\NlwRenamedSig_OI_csr[1] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/N1447 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_1_835 ),
    .O(\BU2/U0/pci32_inst/N249 )
  );
  LUT6 #(
    .INIT ( 64'hDDD8DD8888D88888 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT23186_SW0  (
    .I0(\BU2/m_fail64 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [34]),
    .I2(\NlwRenamedSig_OI_csr[2] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/N1447 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_2_833 ),
    .O(\BU2/U0/pci32_inst/N246 )
  );
  LUT6 #(
    .INIT ( 64'hDDD8DD8888D88888 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1156_SW0  (
    .I0(\BU2/m_fail64 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [32]),
    .I2(\NlwRenamedSig_OI_csr[0] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/N1447 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_0_832 ),
    .O(\BU2/U0/pci32_inst/N243 )
  );
  LUT6 #(
    .INIT ( 64'hDDD8DD8888D88888 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT29156_SW0  (
    .I0(\BU2/m_fail64 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [38]),
    .I2(\NlwRenamedSig_OI_csr[6] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/N1447 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_6_838 ),
    .O(\BU2/U0/pci32_inst/N240 )
  );
  LUT6 #(
    .INIT ( 64'hDDD8DD8888D88888 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT11187_SW0  (
    .I0(\BU2/m_fail64 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [51]),
    .I2(\NlwRenamedSig_OI_csr[19] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/N1447 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_19_851 ),
    .O(\BU2/U0/pci32_inst/N237 )
  );
  LUT6 #(
    .INIT ( 64'hDDD8DD8888D88888 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT13187_SW0  (
    .I0(\BU2/m_fail64 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [52]),
    .I2(\NlwRenamedSig_OI_csr[20] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/N1447 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_20_852 ),
    .O(\BU2/U0/pci32_inst/N234 )
  );
  LUT6 #(
    .INIT ( 64'hDDD8DD8888D88888 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT14187_SW0  (
    .I0(\BU2/m_fail64 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [53]),
    .I2(\NlwRenamedSig_OI_cfg[0] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/N1447 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_21_853 ),
    .O(\BU2/U0/pci32_inst/N231 )
  );
  LUT6 #(
    .INIT ( 64'hDDD8DD8888D88888 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT17187_SW0  (
    .I0(\BU2/m_fail64 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [56]),
    .I2(\NlwRenamedSig_OI_csr[24] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/N1447 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_24_855 ),
    .O(\BU2/U0/pci32_inst/N228 )
  );
  LUT6 #(
    .INIT ( 64'hDDD8DD8888D88888 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2187_SW0  (
    .I0(\BU2/m_fail64 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [42]),
    .I2(\NlwRenamedSig_OI_csr[10] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/N1447 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_10_841 ),
    .O(\BU2/U0/pci32_inst/N225 )
  );
  LUT6 #(
    .INIT ( 64'hDDD8DD8888D88888 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT20187_SW0  (
    .I0(\BU2/m_fail64 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [59]),
    .I2(\NlwRenamedSig_OI_csr[27] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/N1447 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_27_858 ),
    .O(\BU2/U0/pci32_inst/N222 )
  );
  LUT6 #(
    .INIT ( 64'hDDD8DD8888D88888 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT21187_SW0  (
    .I0(\BU2/m_fail64 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [60]),
    .I2(\NlwRenamedSig_OI_csr[28] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/N1447 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_28_862 ),
    .O(\BU2/U0/pci32_inst/N219 )
  );
  LUT6 #(
    .INIT ( 64'hDDD8DD8888D88888 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT22187_SW0  (
    .I0(\BU2/m_fail64 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [61]),
    .I2(\NlwRenamedSig_OI_csr[29] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/N1447 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_29_860 ),
    .O(\BU2/U0/pci32_inst/N216 )
  );
  LUT6 #(
    .INIT ( 64'hDDD8DD8888D88888 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT24187_SW0  (
    .I0(\BU2/m_fail64 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [62]),
    .I2(\NlwRenamedSig_OI_csr[30] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/N1447 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_30_861 ),
    .O(\BU2/U0/pci32_inst/N213 )
  );
  LUT6 #(
    .INIT ( 64'hDDD8DD8888D88888 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT25187_SW0  (
    .I0(\BU2/m_fail64 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [63]),
    .I2(\NlwRenamedSig_OI_csr[31] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/N1447 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_31_863 ),
    .O(\BU2/U0/pci32_inst/N210 )
  );
  LUT6 #(
    .INIT ( 64'hCFFFFFFF45555555 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/OE_CBE1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/SLOT_1154 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/GNT_ ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/REQUESTQ_1155 ),
    .I3(NlwRenamedSig_OI_irdyq_n),
    .I4(NlwRenamedSig_OI_frameq_n),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/EOT/EOT_733 ),
    .O(NlwRenamedSignal_cbt[0])
  );
  LUT6 #(
    .INIT ( 64'h5555FFFF0444FFFF ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/MMUX_OE_ADO_LB6411  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/START_AD64 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/OE_ADO_LB64__1194 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/SLOT64_INT_1152 ),
    .I3(m_wrdn),
    .I4(NlwRenamedSig_OI_pciw_en),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/EOT/EOT_733 ),
    .O(\BU2/U0/pci32_inst/ADT[40] )
  );
  LUT6 #(
    .INIT ( 64'h5555FFFF0444FFFF ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/MMUX_OE_ADO_T6411  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/START_AD64 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/OE_ADO_T64__1192 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/SLOT64_INT_1152 ),
    .I3(m_wrdn),
    .I4(NlwRenamedSig_OI_pciw_en),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/EOT/EOT_733 ),
    .O(\BU2/U0/pci32_inst/ADT[56] )
  );
  LUT6 #(
    .INIT ( 64'h5555FFFF0444FFFF ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/MMUX_OE_ADO_LT6411  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/START_AD64 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/OE_ADO_LT64__1196 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/SLOT64_INT_1152 ),
    .I3(m_wrdn),
    .I4(NlwRenamedSig_OI_pciw_en),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/EOT/EOT_733 ),
    .O(\BU2/U0/pci32_inst/ADT[48] )
  );
  LUT5 #(
    .INIT ( 32'h0A000200 ))
  \BU2/U0/pci32_inst/PCI_LC_I/ADDR_VLD/CFG_VLD1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/ADDR_VLD/FRAMEQ__817 ),
    .I1(NlwRenamedSig_OI_m_data),
    .I2(NlwRenamedSig_OI_frameq_n),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/IDSEL ),
    .I4(cfg_self),
    .O(cfg_vld)
  );
  LUT6 #(
    .INIT ( 64'h2000A800FFFFFFFF ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/CE_OER1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/REQUEST64_1136 ),
    .I1(bw_detect_dis),
    .I2(\BU2/U0/pci32_inst/XPCI_WATCHDOG/PCIW ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/ADDR/ADDR_BE_1128 ),
    .I4(bw_manual_32b),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/OE_REQ64_INT_1150 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/CE_OER )
  );
  LUT6 #(
    .INIT ( 64'h5555FFFF0444FFFF ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/MMUX_OE_ADO_B6411  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/START_AD64 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/OE_ADO_B64__1188 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/SLOT64_INT_1152 ),
    .I3(m_wrdn),
    .I4(NlwRenamedSig_OI_pciw_en),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/EOT/EOT_733 ),
    .O(\BU2/U0/pci32_inst/ADT[32] )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF00000080 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/N000446  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/N000410_1779 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/N00042 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/APERR_N_1086 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/HOLD_APERR_1178 ),
    .I4(s_abort),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/N000442_1780 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/N0004 )
  );
  LUT5 #(
    .INIT ( 32'hC8C8FFC8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/N0103111  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/N010369_2146 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE_ROM__1219 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/N01032_2147 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_DSEL/TDEVSEL_I__1209 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_DSEL/TDEVSEL__1210 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/N0103 )
  );
  LUT4 #(
    .INIT ( 16'hFF2A ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CSR/N0048<5>1  (
    .I0(\NlwRenamedSig_OI_csr[29] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/LADX1_1241 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/N8 ),
    .I3(\NlwRenamedSig_OI_csr[39] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CSR/PCI_CSR_OR[29] )
  );
  LUT6 #(
    .INIT ( 64'h8000000088888888 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/STAR/NS_S_TAR1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/FRAME/IFRAME_I__1111 ),
    .I1(NlwRenamedSig_OI_m_data),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/DEV_TO/WAS_SUBTRACTIVE_1169 ),
    .I3(NlwRenamedSig_OI_devselq_n),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/DEV_TO/PASS_TO_1172 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/STOP_I_LUT_DELAY_STAGE [2]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/STAR/NS_S_TAR )
  );
  LUT6 #(
    .INIT ( 64'h0000000000080000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_CE/CE6_01  (
    .I0(NlwRenamedSig_OI_s_wrdn),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/LADX6_1233 ),
    .I2(NlwRenamedSig_OI_s_cbe[0]),
    .I3(NlwRenamedSig_OI_irdyq_n),
    .I4(\NlwRenamedSig_OI_pci_cmd[11] ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/TRDYDEL_1206 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CE6_0 )
  );
  LUT6 #(
    .INIT ( 64'h0000000000080000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_CE/CE5_01  (
    .I0(NlwRenamedSig_OI_s_wrdn),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/LADX5_1235 ),
    .I2(NlwRenamedSig_OI_s_cbe[0]),
    .I3(NlwRenamedSig_OI_irdyq_n),
    .I4(\NlwRenamedSig_OI_pci_cmd[11] ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/TRDYDEL_1206 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CE5_0 )
  );
  LUT6 #(
    .INIT ( 64'h0000000000080000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_CE/CE4_01  (
    .I0(NlwRenamedSig_OI_s_wrdn),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/LADX4_1237 ),
    .I2(NlwRenamedSig_OI_s_cbe[0]),
    .I3(NlwRenamedSig_OI_irdyq_n),
    .I4(\NlwRenamedSig_OI_pci_cmd[11] ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/TRDYDEL_1206 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CE4_0 )
  );
  LUT6 #(
    .INIT ( 64'h0000000000080000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_CE/CE1_01  (
    .I0(NlwRenamedSig_OI_s_wrdn),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/LADX1_1241 ),
    .I2(NlwRenamedSig_OI_s_cbe[0]),
    .I3(NlwRenamedSig_OI_irdyq_n),
    .I4(\NlwRenamedSig_OI_pci_cmd[11] ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/TRDYDEL_1206 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CE1_0 )
  );
  LUT6 #(
    .INIT ( 64'h0000000000080000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_CE/CE15_01  (
    .I0(NlwRenamedSig_OI_s_wrdn),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/LADX15_1231 ),
    .I2(NlwRenamedSig_OI_s_cbe[0]),
    .I3(NlwRenamedSig_OI_irdyq_n),
    .I4(\NlwRenamedSig_OI_pci_cmd[11] ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/TRDYDEL_1206 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CE15_0 )
  );
  LUT6 #(
    .INIT ( 64'h0000000000080000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_CE/CE6_11  (
    .I0(NlwRenamedSig_OI_s_wrdn),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/LADX6_1233 ),
    .I2(NlwRenamedSig_OI_s_cbe[1]),
    .I3(NlwRenamedSig_OI_irdyq_n),
    .I4(\NlwRenamedSig_OI_pci_cmd[11] ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/TRDYDEL_1206 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CE6_1 )
  );
  LUT6 #(
    .INIT ( 64'h0000000000080000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_CE/CE5_11  (
    .I0(NlwRenamedSig_OI_s_wrdn),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/LADX5_1235 ),
    .I2(NlwRenamedSig_OI_s_cbe[1]),
    .I3(NlwRenamedSig_OI_irdyq_n),
    .I4(\NlwRenamedSig_OI_pci_cmd[11] ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/TRDYDEL_1206 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CE5_1 )
  );
  LUT6 #(
    .INIT ( 64'h0000000000080000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_CE/CE4_11  (
    .I0(NlwRenamedSig_OI_s_wrdn),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/LADX4_1237 ),
    .I2(NlwRenamedSig_OI_s_cbe[1]),
    .I3(NlwRenamedSig_OI_irdyq_n),
    .I4(\NlwRenamedSig_OI_pci_cmd[11] ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/TRDYDEL_1206 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CE4_1 )
  );
  LUT6 #(
    .INIT ( 64'h0000000000080000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_CE/CE3_11  (
    .I0(NlwRenamedSig_OI_s_wrdn),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/LADX3_1239 ),
    .I2(NlwRenamedSig_OI_s_cbe[1]),
    .I3(NlwRenamedSig_OI_irdyq_n),
    .I4(\NlwRenamedSig_OI_pci_cmd[11] ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/TRDYDEL_1206 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CE3_1 )
  );
  LUT6 #(
    .INIT ( 64'h0000000000080000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_CE/CE1_11  (
    .I0(NlwRenamedSig_OI_s_wrdn),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/LADX1_1241 ),
    .I2(NlwRenamedSig_OI_s_cbe[1]),
    .I3(NlwRenamedSig_OI_irdyq_n),
    .I4(\NlwRenamedSig_OI_pci_cmd[11] ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/TRDYDEL_1206 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CE1_1 )
  );
  LUT6 #(
    .INIT ( 64'h0000000000080000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_CE/CE6_21  (
    .I0(NlwRenamedSig_OI_s_wrdn),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/LADX6_1233 ),
    .I2(NlwRenamedSig_OI_s_cbe[2]),
    .I3(NlwRenamedSig_OI_irdyq_n),
    .I4(\NlwRenamedSig_OI_pci_cmd[11] ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/TRDYDEL_1206 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CE6_2 )
  );
  LUT6 #(
    .INIT ( 64'h0000000000080000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_CE/CE5_21  (
    .I0(NlwRenamedSig_OI_s_wrdn),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/LADX5_1235 ),
    .I2(NlwRenamedSig_OI_s_cbe[2]),
    .I3(NlwRenamedSig_OI_irdyq_n),
    .I4(\NlwRenamedSig_OI_pci_cmd[11] ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/TRDYDEL_1206 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CE5_2 )
  );
  LUT6 #(
    .INIT ( 64'h0000000000080000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_CE/CE4_21  (
    .I0(NlwRenamedSig_OI_s_wrdn),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/LADX4_1237 ),
    .I2(NlwRenamedSig_OI_s_cbe[2]),
    .I3(NlwRenamedSig_OI_irdyq_n),
    .I4(\NlwRenamedSig_OI_pci_cmd[11] ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/TRDYDEL_1206 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CE4_2 )
  );
  LUT6 #(
    .INIT ( 64'h0000000000080000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_CE/CE6_31  (
    .I0(NlwRenamedSig_OI_s_wrdn),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/LADX6_1233 ),
    .I2(NlwRenamedSig_OI_s_cbe[3]),
    .I3(NlwRenamedSig_OI_irdyq_n),
    .I4(\NlwRenamedSig_OI_pci_cmd[11] ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/TRDYDEL_1206 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CE6_3 )
  );
  LUT6 #(
    .INIT ( 64'h0000000000080000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_CE/CE5_31  (
    .I0(NlwRenamedSig_OI_s_wrdn),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/LADX5_1235 ),
    .I2(NlwRenamedSig_OI_s_cbe[3]),
    .I3(NlwRenamedSig_OI_irdyq_n),
    .I4(\NlwRenamedSig_OI_pci_cmd[11] ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/TRDYDEL_1206 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CE5_3 )
  );
  LUT6 #(
    .INIT ( 64'h0000000000080000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_CE/CE4_31  (
    .I0(NlwRenamedSig_OI_s_wrdn),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/LADX4_1237 ),
    .I2(NlwRenamedSig_OI_s_cbe[3]),
    .I3(NlwRenamedSig_OI_irdyq_n),
    .I4(\NlwRenamedSig_OI_pci_cmd[11] ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/TRDYDEL_1206 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CE4_3 )
  );
  LUT6 #(
    .INIT ( 64'h0000002000100030 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/MMUX_NS_STOP_124  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CFG_CYC_1243 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/HOLD_APERR_1178 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/APERR_N_1086 ),
    .I3(s_abort),
    .I4(c_term),
    .I5(s_term),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/MMUX_NS_STOP_124_1792 )
  );
  LUT6 #(
    .INIT ( 64'h2A2AFF2AAAAAFFAA ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/N00121  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE1__1217 ),
    .I1(\NlwRenamedSig_OI_pci_cmd[10] ),
    .I2(NlwRenamedSig_OI_cfg_hit),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_DSEL/TDEVSEL_I__1209 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_DSEL/TDEVSEL__1210 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/LADX1_1241 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/N0012 )
  );
  LUT6 #(
    .INIT ( 64'h2A2AFF2AAAAAFFAA ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/N00221  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE3__1227 ),
    .I1(\NlwRenamedSig_OI_pci_cmd[10] ),
    .I2(NlwRenamedSig_OI_cfg_hit),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_DSEL/TDEVSEL_I__1209 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_DSEL/TDEVSEL__1210 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/LADX3_1239 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/N0022 )
  );
  LUT6 #(
    .INIT ( 64'h2A2AFF2AAAAAFFAA ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/N00311  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE4__1225 ),
    .I1(\NlwRenamedSig_OI_pci_cmd[10] ),
    .I2(NlwRenamedSig_OI_cfg_hit),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_DSEL/TDEVSEL_I__1209 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_DSEL/TDEVSEL__1210 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/LADX4_1237 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/N0031 )
  );
  LUT6 #(
    .INIT ( 64'h2A2AFF2AAAAAFFAA ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/N00401  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE5__1229 ),
    .I1(\NlwRenamedSig_OI_pci_cmd[10] ),
    .I2(NlwRenamedSig_OI_cfg_hit),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_DSEL/TDEVSEL_I__1209 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_DSEL/TDEVSEL__1210 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/LADX5_1235 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/N0040 )
  );
  LUT6 #(
    .INIT ( 64'h2A2AFF2AAAAAFFAA ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/N00491  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE6__1223 ),
    .I1(\NlwRenamedSig_OI_pci_cmd[10] ),
    .I2(NlwRenamedSig_OI_cfg_hit),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_DSEL/TDEVSEL_I__1209 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_DSEL/TDEVSEL__1210 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/LADX6_1233 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/N0049 )
  );
  LUT6 #(
    .INIT ( 64'h2A2AFF2AAAAAFFAA ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/N00981  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE15__1221 ),
    .I1(\NlwRenamedSig_OI_pci_cmd[10] ),
    .I2(NlwRenamedSig_OI_cfg_hit),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_DSEL/TDEVSEL_I__1209 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_DSEL/TDEVSEL__1210 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/LADX15_1231 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/N0098 )
  );
  LUT6 #(
    .INIT ( 64'hAAFAFAFA88F8F8F8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CSR/N0048<3>  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/S_ABORT_INT ),
    .I1(NlwRenamedSig_OI_s_data),
    .I2(\NlwRenamedSig_OI_csr[27] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/N8 ),
    .I4(\BU2/U0/pci32_inst/N372 ),
    .I5(NlwRenamedSig_OI_backoff),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CSR/PCI_CSR_OR[27] )
  );
  LUT6 #(
    .INIT ( 64'hAAAAAAAAAAAAAAA8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CSR/N0048<3>_SW1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/LADX1_1241 ),
    .I1(NlwRenamedSig_OI_adio_out[27]),
    .I2(NlwRenamedSig_OI_adio_out[28]),
    .I3(NlwRenamedSig_OI_adio_out[29]),
    .I4(NlwRenamedSig_OI_adio_out[30]),
    .I5(NlwRenamedSig_OI_adio_out[31]),
    .O(\BU2/U0/pci32_inst/N372 )
  );
  LUT5 #(
    .INIT ( 32'h00000080 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/NS_PWIN642  (
    .I0(\BU2/s_cycle64 ),
    .I1(NlwRenamedSig_OI_s_wrdn),
    .I2(NlwRenamedSig_OI_s_data),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/TTRDY_I__1205 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/IRDY_I_LUT_DELAY_STAGE [2]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/NS_PWIN64 )
  );
  LUT5 #(
    .INIT ( 32'hF7F7F777 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/N01032  (
    .I0(NlwRenamedSig_OI_cfg_hit),
    .I1(\NlwRenamedSig_OI_pci_cmd[10] ),
    .I2(\NlwRenamedSig_OI_cfg[116] ),
    .I3(NlwRenamedSig_OI_addr[6]),
    .I4(NlwRenamedSig_OI_addr[7]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/N01032_2147 )
  );
  LUT6 #(
    .INIT ( 64'h5555FFFF4440FFFF ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/DR_BUS/MMUX_NS_DR_BUS1_SW0  (
    .I0(gnti),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/REQUEST_1140 ),
    .I2(cfg_self),
    .I3(\NlwRenamedSig_OI_csr[2] ),
    .I4(NlwRenamedSig_OI_dr_bus),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/ADDR/ADDR_BE_1128 ),
    .O(\BU2/U0/pci32_inst/N22 )
  );
  LUT4 #(
    .INIT ( 16'h4CCC ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/OE_ACK64_IN__SW0  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_AK64/TACK64_I__1211 ),
    .I1(\BU2/s_cycle64 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/TSTOP_I__1212 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/TTRDY_I__1205 ),
    .O(\BU2/U0/pci32_inst/N61 )
  );
  LUT4 #(
    .INIT ( 16'h2000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/SET13_M_ABORT1  (
    .I0(NlwRenamedSig_OI_devselq_n),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/MASTER_TEMP_1949 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/DEV_TO/PASS_TO_1172 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/DEV_TO/WAS_SUBTRACTIVE_1169 ),
    .O(\NlwRenamedSig_OI_csr[39] )
  );
  LUT4 #(
    .INIT ( 16'hEF45 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT26172_SW0_SW1  (
    .I0(\BU2/m_fail64 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_3_834 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [35]),
    .O(\BU2/U0/pci32_inst/N335 )
  );
  LUT4 #(
    .INIT ( 16'hEF45 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT27143_SW1  (
    .I0(\BU2/m_fail64 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_4_836 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [36]),
    .O(\BU2/U0/pci32_inst/N262 )
  );
  LUT4 #(
    .INIT ( 16'hEF45 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT28143_SW1  (
    .I0(\BU2/m_fail64 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_5_837 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [37]),
    .O(\BU2/U0/pci32_inst/N259 )
  );
  LUT4 #(
    .INIT ( 16'hEF45 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT30143_SW1  (
    .I0(\BU2/m_fail64 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_7_839 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [39]),
    .O(\BU2/U0/pci32_inst/N256 )
  );
  LUT4 #(
    .INIT ( 16'hEF45 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT12186_SW1  (
    .I0(\BU2/m_fail64 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_1_835 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [33]),
    .O(\BU2/U0/pci32_inst/N250 )
  );
  LUT4 #(
    .INIT ( 16'hEF45 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT23186_SW1  (
    .I0(\BU2/m_fail64 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_2_833 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [34]),
    .O(\BU2/U0/pci32_inst/N247 )
  );
  LUT4 #(
    .INIT ( 16'hEF45 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1156_SW1  (
    .I0(\BU2/m_fail64 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_0_832 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [32]),
    .O(\BU2/U0/pci32_inst/N244 )
  );
  LUT4 #(
    .INIT ( 16'hEF45 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT29156_SW1  (
    .I0(\BU2/m_fail64 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_6_838 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [38]),
    .O(\BU2/U0/pci32_inst/N241 )
  );
  LUT4 #(
    .INIT ( 16'hEF45 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT11187_SW1  (
    .I0(\BU2/m_fail64 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_19_851 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [51]),
    .O(\BU2/U0/pci32_inst/N238 )
  );
  LUT4 #(
    .INIT ( 16'hEF45 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT13187_SW1  (
    .I0(\BU2/m_fail64 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_20_852 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [52]),
    .O(\BU2/U0/pci32_inst/N235 )
  );
  LUT4 #(
    .INIT ( 16'hEF45 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT14187_SW1  (
    .I0(\BU2/m_fail64 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_21_853 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [53]),
    .O(\BU2/U0/pci32_inst/N232 )
  );
  LUT4 #(
    .INIT ( 16'hEF45 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT17187_SW1  (
    .I0(\BU2/m_fail64 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_24_855 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [56]),
    .O(\BU2/U0/pci32_inst/N229 )
  );
  LUT4 #(
    .INIT ( 16'hEF45 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2187_SW1  (
    .I0(\BU2/m_fail64 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_10_841 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [42]),
    .O(\BU2/U0/pci32_inst/N226 )
  );
  LUT4 #(
    .INIT ( 16'hEF45 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT20187_SW1  (
    .I0(\BU2/m_fail64 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_27_858 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [59]),
    .O(\BU2/U0/pci32_inst/N223 )
  );
  LUT4 #(
    .INIT ( 16'hEF45 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT21187_SW1  (
    .I0(\BU2/m_fail64 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_28_862 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [60]),
    .O(\BU2/U0/pci32_inst/N220 )
  );
  LUT4 #(
    .INIT ( 16'hEF45 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT22187_SW1  (
    .I0(\BU2/m_fail64 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_29_860 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [61]),
    .O(\BU2/U0/pci32_inst/N217 )
  );
  LUT4 #(
    .INIT ( 16'hEF45 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT24187_SW1  (
    .I0(\BU2/m_fail64 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_30_861 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [62]),
    .O(\BU2/U0/pci32_inst/N214 )
  );
  LUT4 #(
    .INIT ( 16'hEF45 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT25187_SW1  (
    .I0(\BU2/m_fail64 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_31_863 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [63]),
    .O(\BU2/U0/pci32_inst/N211 )
  );
  LUT4 #(
    .INIT ( 16'hEF45 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT18189_SW1  (
    .I0(\BU2/m_fail64 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_25_859 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [57]),
    .O(\BU2/U0/pci32_inst/N208 )
  );
  LUT4 #(
    .INIT ( 16'h2AFF ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CSR/N0048<7>1  (
    .I0(\NlwRenamedSig_OI_csr[31] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/N8 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/LADX1_1241 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/LC_PERR__955 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CSR/PCI_CSR_OR[31] )
  );
  LUT4 #(
    .INIT ( 16'h2AFF ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CSR/N0048<6>1  (
    .I0(\NlwRenamedSig_OI_csr[30] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/N8 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/LADX1_1241 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_OE_SERR ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CSR/PCI_CSR_OR[30] )
  );
  LUT4 #(
    .INIT ( 16'hFFF1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/LOCKOUT1  (
    .I0(cfg_self),
    .I1(\NlwRenamedSig_OI_csr[2] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/BUG_FIX_1625 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/REQUEST_1140 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/LOCKOUT )
  );
  LUT6 #(
    .INIT ( 64'hFDFFFFFFFFFFFFFF ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/ADDR/NS_MAN1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/REQUEST_1140 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/ADDR/ADDR_BE_1128 ),
    .I2(gnti),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/FRAME_I_LUT_DELAY_STAGE [2]),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/M_ENABLE_INT ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/IRDY_I_LUT_DELAY_STAGE [2]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/ADDR/NS_MAN )
  );
  LUT6 #(
    .INIT ( 64'h22F22222AAFAAAAA ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CSR/N0048<4>1  (
    .I0(\NlwRenamedSig_OI_csr[28] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/LADX1_1241 ),
    .I2(NlwRenamedSig_OI_m_data),
    .I3(NlwRenamedSig_OI_stopq_n),
    .I4(NlwRenamedSig_OI_devselq_n),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/N8 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CSR/PCI_CSR_OR[28] )
  );
  LUT6 #(
    .INIT ( 64'h0404040400000400 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/NS_IREAD641  (
    .I0(m_wrdn),
    .I1(NlwRenamedSig_OI_pciw_en),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/IIRDY_I__1161 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/SLOT64_INT_1152 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/EOT/EOT_733 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/START_AD64 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/NS_IREAD64 )
  );
  LUT6 #(
    .INIT ( 64'hDDD8DD8888D88888 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT18189_SW0_G  (
    .I0(\BU2/m_fail64 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [57]),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [25]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I4(\NlwRenamedSig_OI_cfg[0] ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_25_859 ),
    .O(\BU2/U0/pci32_inst/N339 )
  );
  LUT6 #(
    .INIT ( 64'h5555557500000020 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/MASTER_TEMP_RSTPOT  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/ADDR/ADDR_BE_1128 ),
    .I1(m_cbe_9[3]),
    .I2(m_cbe_9[0]),
    .I3(m_cbe_9[2]),
    .I4(m_cbe_9[1]),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/MASTER_TEMP_1949 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/MASTER_TEMP_RSTPOT_1948 )
  );
  LUT5 #(
    .INIT ( 32'h96696996 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR156  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR136_1745 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I2_LUT_DELAY_STAGE [2]),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I3_LUT_DELAY_STAGE [2]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I1_LUT_DELAY_STAGE [2]),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I0_LUT_DELAY_STAGE [2]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/NS_PAR )
  );
  LUT5 #(
    .INIT ( 32'h96696996 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR64156  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR64136_1738 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I6_LUT_DELAY_STAGE [2]),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I7_LUT_DELAY_STAGE [2]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I5_LUT_DELAY_STAGE [2]),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I4_LUT_DELAY_STAGE [2]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/NS_PAR64 )
  );
  LUT5 #(
    .INIT ( 32'h11110100 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/N010369  (
    .I0(NlwRenamedSig_OI_addr[6]),
    .I1(NlwRenamedSig_OI_addr[7]),
    .I2(NlwRenamedSig_OI_addr[5]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/N010327_1797 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/N010346_1798 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/N010369_2146 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFAAAAFFFF0080 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_TSM/PCI_BKOF/NS_BKOF37  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/N2 ),
    .I1(NlwRenamedSig_OI_cfg_hit),
    .I2(c_term),
    .I3(c_ready),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_TSM/PCI_BKOF/NS_BKOF34_1728 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_TSM/PCI_BKOF/NS_BKOF4_1727 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_TSM/PCI_BKOF/NS_BKOF )
  );
  LUT6 #(
    .INIT ( 64'hFF4C4C4C4F4C4E4C ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_TSM/PCI_DATA/NS_DATA51  (
    .I0(NlwRenamedSig_OI_irdyq_n),
    .I1(\BU2/U0/pci32_inst/N370 ),
    .I2(NlwRenamedSig_OI_frameq_n),
    .I3(NlwRenamedSig_OI_s_data),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/TSTOP__1213 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/TRDYDEL_1206 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_TSM/PCI_DATA/NS_DATA )
  );
  LUT5 #(
    .INIT ( 32'hAAA0AA20 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_TSM/PCI_DATA/NS_DATA51_SW0  (
    .I0(NlwRenamedSig_OI_b_busy),
    .I1(c_term),
    .I2(NlwRenamedSig_OI_cfg_hit),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_TSM/PCI_DATA/NS_DATA22_1726 ),
    .I4(c_ready),
    .O(\BU2/U0/pci32_inst/N370 )
  );
  LUT4 #(
    .INIT ( 16'hEF45 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT26172_SW0_SW2_G  (
    .I0(\BU2/m_fail64 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_3_834 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [35]),
    .O(\BU2/U0/pci32_inst/N369 )
  );
  LUT6 #(
    .INIT ( 64'hDDD8DD8888D88888 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT26172_SW0_SW2_F  (
    .I0(\BU2/m_fail64 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [35]),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/N23 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE3__1227 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_3_834 ),
    .O(\BU2/U0/pci32_inst/N368 )
  );
  MUXF7   \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT26172_SW0_SW2  (
    .I0(\BU2/U0/pci32_inst/N368 ),
    .I1(\BU2/U0/pci32_inst/N369 ),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2675_2118 ),
    .O(\BU2/U0/pci32_inst/N336 )
  );
  LUT4 #(
    .INIT ( 16'hEC20 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT18189_SW0_F  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I1(\BU2/m_fail64 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_25_859 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [57]),
    .O(\BU2/U0/pci32_inst/N338 )
  );
  MUXF7   \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT18189_SW0  (
    .I0(\BU2/U0/pci32_inst/N338 ),
    .I1(\BU2/U0/pci32_inst/N339 ),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/N1445 ),
    .O(\BU2/U0/pci32_inst/N207 )
  );
  LUT6 #(
    .INIT ( 64'hDDD88D88FFF00F00 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT26223  (
    .I0(adio_in_8[3]),
    .I1(\BU2/U0/pci32_inst/N335 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT26138_2136 ),
    .I3(\BU2/U0/pci32_inst/N334 ),
    .I4(\BU2/U0/pci32_inst/N336 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/N7 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [3])
  );
  LUT5 #(
    .INIT ( 32'hFDEC3120 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT26172_SW0_SW0  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I1(\BU2/m_fail64 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_3_834 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2675_2118 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [35]),
    .O(\BU2/U0/pci32_inst/N334 )
  );
  LUT5 #(
    .INIT ( 32'h00800000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/ADIO_MUXOUT<10>1_SW0  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE15__1221 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE3__1227 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE1__1217 ),
    .I3(\BU2/U0/pci32_inst/N332 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE_ROM__1219 ),
    .O(\BU2/U0/pci32_inst/N82 )
  );
  LUT6 #(
    .INIT ( 64'h99AA795ACCFF3C0F ))
  \BU2/U0/pci32_inst/PCI_LC_I/ADIO_MUXOUT<10>1_SW0_SW2  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE4__1225 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE5__1229 ),
    .I2(\BU2/U0/pci32_inst/OLD[74] ),
    .I3(\BU2/U0/pci32_inst/OLD[37] ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE6__1223 ),
    .I5(\BU2/U0/pci32_inst/OLD[0] ),
    .O(\BU2/U0/pci32_inst/N332 )
  );
  LUT6 #(
    .INIT ( 64'h3C3C2C0C30302000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT26138  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/N36 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE_ROM__1219 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE15__1221 ),
    .I3(\NlwRenamedSig_OI_cfg[0] ),
    .I4(\BU2/U0/pci32_inst/N330 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_IREG/INTERRUPTLINE [3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT26138_2136 )
  );
  LUT6 #(
    .INIT ( 64'hCCCCCCCCCC808080 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT26138_SW0  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/N38 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/N34 ),
    .I2(\NlwRenamedSig_OI_cfg[116] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/N37 ),
    .I4(\NlwRenamedSig_OI_cfg[0] ),
    .I5(\BU2/U0/pci32_inst/N90 ),
    .O(\BU2/U0/pci32_inst/N330 )
  );
  LUT6 #(
    .INIT ( 64'h0CF00CF00CA00C00 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT27108  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_IREG/INTERRUPTLINE [4]),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE15__1221 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE_ROM__1219 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/N36 ),
    .I5(\BU2/U0/pci32_inst/N328 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT27108_2094 )
  );
  LUT6 #(
    .INIT ( 64'hFFFF0000ECA00000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT27108_SW0  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/N37 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/N38 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/N34 ),
    .I5(\BU2/U0/pci32_inst/N88 ),
    .O(\BU2/U0/pci32_inst/N328 )
  );
  LUT6 #(
    .INIT ( 64'h0CF00CF00CA00C00 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT28108  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_IREG/INTERRUPTLINE [5]),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE15__1221 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE_ROM__1219 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/N36 ),
    .I5(\BU2/U0/pci32_inst/N326 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT28108_2093 )
  );
  LUT6 #(
    .INIT ( 64'hFFFF0000ECA00000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT28108_SW0  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\NlwRenamedSig_OI_cfg[116] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/N37 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/N38 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/N34 ),
    .I5(\BU2/U0/pci32_inst/N86 ),
    .O(\BU2/U0/pci32_inst/N326 )
  );
  LUT6 #(
    .INIT ( 64'h0CF00CF00CA00C00 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT30108  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_IREG/INTERRUPTLINE [7]),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE15__1221 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE_ROM__1219 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/N36 ),
    .I5(\BU2/U0/pci32_inst/N324 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT30108_2092 )
  );
  LUT6 #(
    .INIT ( 64'hFFFF0000ECA00000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT30108_SW0  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\NlwRenamedSig_OI_cfg[116] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/N37 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/N38 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/N34 ),
    .I5(\BU2/U0/pci32_inst/N84 ),
    .O(\BU2/U0/pci32_inst/N324 )
  );
  LUT6 #(
    .INIT ( 64'hFF8CFF8CFF8CFFFF ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_DSEL/MMUX_NS_DEVSEL_123  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/TTRDY_I__1205 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/S_ABORT_INT ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/IRDY_I_LUT_DELAY_STAGE [2]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_DSEL/MMUX_NS_DEVSEL_111_1836 ),
    .I4(NlwRenamedSig_OI_s_data),
    .I5(NlwRenamedSig_OI_backoff),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_DSEL/MMUX_NS_DEVSEL_123_2114 )
  );
  LUT6 #(
    .INIT ( 64'hFFDFDFDFFFFFFFFF ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/OE_TRDY_IN__SW1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/TSTOP_I__1212 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/NS_CFG_HIT ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/TTRDY_I__1205 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/N00042 ),
    .I4(NlwRenamedSig_OI_b_busy),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_DSEL/TDEVSEL_I__1209 ),
    .O(\BU2/U0/pci32_inst/N148 )
  );
  LUT2 #(
    .INIT ( 4'hD ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT3027_SW0  (
    .I0(\BU2/U0/pci32_inst/OLD[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE4__1225 ),
    .O(\BU2/U0/pci32_inst/N318 )
  );
  LUT6 #(
    .INIT ( 64'hFDFDFDFDA8F8F8F8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/M_FIRSTIN3  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/DEV_TO ),
    .I1(\BU2/U0/pci32_inst/N316 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/FRAME/IFRAME__1158 ),
    .I3(NlwRenamedSig_OI_trdyq_n),
    .I4(NlwRenamedSig_OI_stopq_n),
    .I5(\BU2/U0/pci32_inst/N315 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/N2 )
  );
  LUT3 #(
    .INIT ( 8'hF7 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/M_FIRSTIN3_SW3  (
    .I0(NlwRenamedSig_OI_m_data),
    .I1(m_ready),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/FRAME/IFRAME_I__1111 ),
    .O(\BU2/U0/pci32_inst/N316 )
  );
  LUT6 #(
    .INIT ( 64'h5D5D5DDDFFFFFFFF ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/M_FIRSTIN3_SW2  (
    .I0(NlwRenamedSig_OI_m_data),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/FRAME/IFRAME_I__1111 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/STOP_I_LUT_DELAY_STAGE [2]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/TRDY_I_LUT_DELAY_STAGE [2]),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/IIRDY_I__1161 ),
    .I5(m_ready),
    .O(\BU2/U0/pci32_inst/N315 )
  );
  LUT4 #(
    .INIT ( 16'hFFAE ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_AK64/ACKHIT1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BH64_O_1410 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BH64_O_1299 ),
    .I2(\NlwRenamedSig_OI_cfg[0] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BH64_O_1355 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/ACKHIT )
  );
  LUT5 #(
    .INIT ( 32'h004000FF ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/MMUX_OE_FRAME_NS11  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/DEV_TO ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/STOP_I_LUT_DELAY_STAGE [2]),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/TRDY_I_LUT_DELAY_STAGE [2]),
    .I3(\BU2/U0/pci32_inst/N37 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/FRAME/IFRAME_I__1111 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/OE_FRAME_NS )
  );
  LUT5 #(
    .INIT ( 32'h004000FF ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/MMUX_OE_FRAME_NS6411  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/DEV_TO ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/STOP_I_LUT_DELAY_STAGE [2]),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/TRDY_I_LUT_DELAY_STAGE [2]),
    .I3(\BU2/U0/pci32_inst/N35 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/REQ64/IREQ64_I__1159 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/OE_FRAME_NS64 )
  );
  LUT6 #(
    .INIT ( 64'h2A080A0A08080A0A ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT31146  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/N25 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE5__1229 ),
    .I2(\BU2/U0/pci32_inst/N312 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [8]),
    .I4(\BU2/U0/pci32_inst/OLD[37] ),
    .I5(\BU2/U0/pci32_inst/N313 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT31146_2115 )
  );
  LUT3 #(
    .INIT ( 8'hA2 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT31146_SW1  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\BU2/U0/pci32_inst/OLD[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE4__1225 ),
    .O(\BU2/U0/pci32_inst/N313 )
  );
  LUT4 #(
    .INIT ( 16'hBFFF ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT31146_SW0  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE4__1225 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [8]),
    .I2(\BU2/U0/pci32_inst/OLD[0] ),
    .I3(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/N312 )
  );
  LUT6 #(
    .INIT ( 64'hF333FFFFA222AAAA ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_AK64/MMUX_NS_ACK64_133  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_AK64/MMUX_NS_ACK64_112_1832 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/ACKHIT ),
    .I2(NlwRenamedSig_OI_irdyq_n),
    .I3(\BU2/req64q_n ),
    .I4(NlwRenamedSig_OI_b_busy),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_AK64/MMUX_NS_ACK64_115 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_AK64/MMUX_NS_ACK64_133_1984 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFA888AA88 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1844  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/N25 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1813_2125 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE5__1229 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT186_2126 ),
    .I4(\BU2/U0/pci32_inst/OLD[37] ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/N1447 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1844_2026 )
  );
  LUT6 #(
    .INIT ( 64'hFF40FF40FF404040 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1275  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/N1445 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/N25 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1213_2123 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1230_2124 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1275_2067 )
  );
  LUT6 #(
    .INIT ( 64'hFF40FF40FF404040 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2375  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/N1445 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/N25 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2313_2121 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2330_2122 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2375_2064 )
  );
  LUT6 #(
    .INIT ( 64'h6240624062404040 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT11110  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE15__1221 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE_ROM__1219 ),
    .I2(\NlwRenamedSig_OI_cfg[116] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/N34 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1155_1923 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1147_1922 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT11110_1924 )
  );
  LUT6 #(
    .INIT ( 64'h6240624062404040 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT13110  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE15__1221 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE_ROM__1219 ),
    .I2(\NlwRenamedSig_OI_cfg[116] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/N34 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1355_1918 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1347_1917 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT13110_1919 )
  );
  LUT6 #(
    .INIT ( 64'h6240624062404040 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT14110  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE15__1221 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE_ROM__1219 ),
    .I2(\NlwRenamedSig_OI_cfg[116] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/N34 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1455_1913 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1447_1912 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT14110_1914 )
  );
  LUT6 #(
    .INIT ( 64'h6240624062404040 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT17110  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE15__1221 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE_ROM__1219 ),
    .I2(\NlwRenamedSig_OI_cfg[116] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/N34 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1755_1908 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1747_1907 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT17110_1909 )
  );
  LUT6 #(
    .INIT ( 64'h6240624062404040 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT21101  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE3__1227 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE_ROM__1219 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/REG_0CH [10]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/N34 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT255_1903 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT247_1902 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT21101_1904 )
  );
  LUT6 #(
    .INIT ( 64'h6240624062404040 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT20110  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE15__1221 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE_ROM__1219 ),
    .I2(\NlwRenamedSig_OI_cfg[116] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/N34 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2055_1898 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2047_1897 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT20110_1899 )
  );
  LUT6 #(
    .INIT ( 64'h6240624062404040 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT21110  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE15__1221 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE_ROM__1219 ),
    .I2(\NlwRenamedSig_OI_cfg[116] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/N34 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2155_1893 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2147_1892 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT21110_1894 )
  );
  LUT6 #(
    .INIT ( 64'h6240624062404040 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT22110  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE15__1221 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE_ROM__1219 ),
    .I2(\NlwRenamedSig_OI_cfg[116] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/N34 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2255_1888 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2247_1887 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT22110_1889 )
  );
  LUT6 #(
    .INIT ( 64'h6240624062404040 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT24110  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE15__1221 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE_ROM__1219 ),
    .I2(\NlwRenamedSig_OI_cfg[116] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/N34 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2455_1883 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2447_1882 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT24110_1884 )
  );
  LUT6 #(
    .INIT ( 64'h6240624062404040 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT25110  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE15__1221 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE_ROM__1219 ),
    .I2(\NlwRenamedSig_OI_cfg[116] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/N34 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2555_1877 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2547_1876 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT25110_1878 )
  );
  LUT5 #(
    .INIT ( 32'hFF808080 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2944  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [6]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/N1445 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/N25 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2927_1929 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2944_2058 )
  );
  LUT5 #(
    .INIT ( 32'hFFD5D5D5 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/NS_OE_ADO_B_128  (
    .I0(NlwRenamedSig_OI_b_busy),
    .I1(NlwRenamedSig_OI_irdyq_n),
    .I2(NlwRenamedSig_OI_frameq_n),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/NS_OE_ADO_B_110_1746 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/NS_OE_ADO_B_114_1747 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/N01 )
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT272  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [4]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/N1445 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT272_2078 )
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT282  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [5]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/N1445 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT282_2074 )
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT302  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [7]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/N1445 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT302_2070 )
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT11158  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [19]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/N1445 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT11158_2055 )
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT13158  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [20]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/N1445 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT13158_2052 )
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT14158  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [21]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/N1445 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT14158_2049 )
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT17158  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [24]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/N1445 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT17158_2046 )
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2158  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [10]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/N1445 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2158_2043 )
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT20158  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [27]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/N1445 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT20158_2040 )
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT21158  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT_28_1308 ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/N1445 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT21158_2037 )
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT22158  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT_29_1312 ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/N1445 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT22158_2034 )
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT24158  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT_30_1309 ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/N1445 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT24158_2031 )
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT25158  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT_31_1303 ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/N1445 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT25158_2028 )
  );
  LUT3 #(
    .INIT ( 8'hD7 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_LUT<9>  (
    .I0(\NlwRenamedSig_OI_cfg[116] ),
    .I1(NlwRenamedSig_OI_adio_out[31]),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT_31_1413 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_LUT [9])
  );
  LUT3 #(
    .INIT ( 8'hD7 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_LUT<9>  (
    .I0(\NlwRenamedSig_OI_cfg[116] ),
    .I1(NlwRenamedSig_OI_adio_out[31]),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT_31_1358 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_LUT [9])
  );
  LUT4 #(
    .INIT ( 16'h2000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT186  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [25]),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE4__1225 ),
    .I2(\NlwRenamedSig_OI_cfg[116] ),
    .I3(\BU2/U0/pci32_inst/OLD[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT186_2126 )
  );
  LUT6 #(
    .INIT ( 64'h0000C00000004000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1813  (
    .I0(\BU2/U0/pci32_inst/OLD[0] ),
    .I1(\NlwRenamedSig_OI_cfg[116] ),
    .I2(\BU2/U0/pci32_inst/OLD[37] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [25]),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE5__1229 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE4__1225 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1813_2125 )
  );
  LUT6 #(
    .INIT ( 64'h000000C000000040 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1230  (
    .I0(\BU2/U0/pci32_inst/OLD[0] ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/OLD[37] ),
    .I3(\NlwRenamedSig_OI_cfg[0] ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE5__1229 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE4__1225 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1230_2124 )
  );
  LUT6 #(
    .INIT ( 64'h000000C000000040 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1213  (
    .I0(\BU2/U0/pci32_inst/OLD[37] ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/OLD[0] ),
    .I3(\NlwRenamedSig_OI_cfg[0] ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE4__1225 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE5__1229 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1213_2123 )
  );
  LUT6 #(
    .INIT ( 64'h000000C000000040 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2330  (
    .I0(\BU2/U0/pci32_inst/OLD[0] ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/OLD[37] ),
    .I3(\NlwRenamedSig_OI_cfg[0] ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE5__1229 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE4__1225 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2330_2122 )
  );
  LUT6 #(
    .INIT ( 64'h000000C000000040 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2313  (
    .I0(\BU2/U0/pci32_inst/OLD[37] ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/OLD[0] ),
    .I3(\NlwRenamedSig_OI_cfg[0] ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE4__1225 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE5__1229 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2313_2121 )
  );
  LUT4 #(
    .INIT ( 16'h00D7 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_LUT<8>  (
    .I0(\NlwRenamedSig_OI_cfg[116] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT_30_1419 ),
    .I2(NlwRenamedSig_OI_adio_out[30]),
    .I3(\BU2/U0/pci32_inst/N310 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_LUT [8])
  );
  LUT6 #(
    .INIT ( 64'h0ACEA0ECCE0AECA0 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_LUT<8>_SW0  (
    .I0(\NlwRenamedSig_OI_cfg[116] ),
    .I1(\NlwRenamedSig_OI_cfg[116] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT_29_1422 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT_28_1418 ),
    .I4(NlwRenamedSig_OI_adio_out[29]),
    .I5(NlwRenamedSig_OI_adio_out[28]),
    .O(\BU2/U0/pci32_inst/N310 )
  );
  LUT4 #(
    .INIT ( 16'h00D7 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_LUT<8>  (
    .I0(\NlwRenamedSig_OI_cfg[116] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT_30_1364 ),
    .I2(NlwRenamedSig_OI_adio_out[30]),
    .I3(\BU2/U0/pci32_inst/N308 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_LUT [8])
  );
  LUT6 #(
    .INIT ( 64'h0ACEA0ECCE0AECA0 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_LUT<8>_SW0  (
    .I0(\NlwRenamedSig_OI_cfg[116] ),
    .I1(\NlwRenamedSig_OI_cfg[116] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT_29_1367 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT_28_1363 ),
    .I4(NlwRenamedSig_OI_adio_out[29]),
    .I5(NlwRenamedSig_OI_adio_out[28]),
    .O(\BU2/U0/pci32_inst/N308 )
  );
  LUT6 #(
    .INIT ( 64'hFAAAAAAAF8888888 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2675  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/N25 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2630_2110 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/N9 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/N01 ),
    .I4(\BU2/U0/pci32_inst/N303 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2613_2109 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2675_2118 )
  );
  LUT5 #(
    .INIT ( 32'h00000080 ))
  \BU2/U0/pci32_inst/PCI_LC_I/N1445<6>1_SW3  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE1__1217 ),
    .I2(\BU2/U0/pci32_inst/OLD[74] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE6__1223 ),
    .I4(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/N303 )
  );
  LUT6 #(
    .INIT ( 64'hCCDFCC80DFDF8080 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT31254  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/N23 ),
    .I1(\BU2/U0/pci32_inst/N205 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT31100_2111 ),
    .I3(adio_in_8[8]),
    .I4(\BU2/U0/pci32_inst/N301 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/N7 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [8])
  );
  LUT6 #(
    .INIT ( 64'hAAAAABBBAAAAA888 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT31190_SW1  (
    .I0(\BU2/U0/pci32_inst/N205 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT31146_2115 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/N1447 ),
    .I3(\NlwRenamedSig_OI_csr[8] ),
    .I4(\BU2/U0/pci32_inst/N150 ),
    .I5(\BU2/U0/pci32_inst/N204 ),
    .O(\BU2/U0/pci32_inst/N301 )
  );
  LUT6 #(
    .INIT ( 64'h000000C000000040 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MMUX_NS_BASE_HIT211_SW1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/N00042 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_DSEL/MMUX_NS_DEVSEL_123_2114 ),
    .I2(\NlwRenamedSig_OI_cfg[0] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/NS_CFG_HIT ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/INTACK ),
    .I5(\BU2/U0/pci32_inst/N297 ),
    .O(\BU2/U0/pci32_inst/N295 )
  );
  LUT6 #(
    .INIT ( 64'h1010505000100050 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MMUX_NS_BASE_HIT211_SW0  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/NS_CFG_HIT ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/INTACK ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_DSEL/MMUX_NS_DEVSEL_123_2114 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/N00042 ),
    .I4(\NlwRenamedSig_OI_cfg[0] ),
    .I5(\BU2/U0/pci32_inst/N297 ),
    .O(\BU2/U0/pci32_inst/N294 )
  );
  LUT3 #(
    .INIT ( 8'hD5 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_DSEL/MMUX_NS_DEVSEL_137_SW0  (
    .I0(NlwRenamedSig_OI_b_busy),
    .I1(NlwRenamedSig_OI_irdyq_n),
    .I2(NlwRenamedSig_OI_frameq_n),
    .O(\BU2/U0/pci32_inst/N297 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFDFFFFFFF8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_DSEL/HIT1  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/INTACKQ_951 ),
    .I2(NlwRenamedSig_OI_base_hit[1]),
    .I3(NlwRenamedSig_OI_cfg_hit),
    .I4(NlwRenamedSig_OI_base_hit[0]),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BASE_HITO_1301 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/N00042 )
  );
  LUT6 #(
    .INIT ( 64'hDDDC8888CCCC8888 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR0/NL_MEMO_RSTPOT  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/NL_MEMO_1789 ),
    .I2(NlwRenamedSig_OI_adio_out[1]),
    .I3(NlwRenamedSig_OI_adio_out[0]),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/TSTOP_I__1212 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/NS_BASE_HIT0 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/NL_MEMO_RSTPOT_1953 )
  );
  LUT6 #(
    .INIT ( 64'hDDDC8888CCCC8888 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR1/NL_MEMO_RSTPOT  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/NL_MEMO_1787 ),
    .I2(NlwRenamedSig_OI_adio_out[1]),
    .I3(NlwRenamedSig_OI_adio_out[0]),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/TSTOP_I__1212 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/NS_BASE_HIT1 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/NL_MEMO_RSTPOT_1952 )
  );
  LUT6 #(
    .INIT ( 64'hDDDC8888CCCC8888 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR2/NL_MEMO_RSTPOT  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/NL_MEMO_1788 ),
    .I2(NlwRenamedSig_OI_adio_out[1]),
    .I3(NlwRenamedSig_OI_adio_out[0]),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/TSTOP_I__1212 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/NS_BASE_HIT2_INT ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/NL_MEMO_RSTPOT_1951 )
  );
  LUT6 #(
    .INIT ( 64'h6A62484048404840 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT31100  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE15__1221 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE_ROM__1219 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE3__1227 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/REG_0CH [8]),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT312_1983 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT3127_1927 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT31100_2111 )
  );
  LUT6 #(
    .INIT ( 64'h000000C000000040 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2630  (
    .I0(\BU2/U0/pci32_inst/OLD[0] ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/OLD[37] ),
    .I3(\NlwRenamedSig_OI_cfg[0] ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE5__1229 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE4__1225 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2630_2110 )
  );
  LUT6 #(
    .INIT ( 64'h000000C000000040 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2613  (
    .I0(\BU2/U0/pci32_inst/OLD[37] ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/OLD[0] ),
    .I3(\NlwRenamedSig_OI_cfg[0] ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE4__1225 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE5__1229 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2613_2109 )
  );
  LUT6 #(
    .INIT ( 64'hAAAAAAAAAAAAEEFA ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_DSEL/MMUX_NS_DEVSEL_1111  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_DSEL/MMUX_NS_DEVSEL_15_1835 ),
    .I1(\BU2/U0/pci32_inst/N295 ),
    .I2(\BU2/U0/pci32_inst/N294 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/NS_BASE_HIT2_INT ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/NS_BASE_HIT0 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/NS_BASE_HIT1 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/NS_DEVSEL_ )
  );
  LUT6 #(
    .INIT ( 64'hCCDFCC80DFDF8080 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT10228  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/N23 ),
    .I1(\BU2/U0/pci32_inst/N202 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT10124_2091 ),
    .I3(adio_in_8[18]),
    .I4(\BU2/U0/pci32_inst/N292 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/N7 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [18])
  );
  LUT6 #(
    .INIT ( 64'hCCDFCC80DFDF8080 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT10163_SW0  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/N25 ),
    .I1(\BU2/U0/pci32_inst/N202 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1026_1870 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/BAR2[18] ),
    .I4(\BU2/U0/pci32_inst/N201 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/N1445 ),
    .O(\BU2/U0/pci32_inst/N292 )
  );
  LUT6 #(
    .INIT ( 64'hCCDFCC80DFDF8080 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT15228  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/N23 ),
    .I1(\BU2/U0/pci32_inst/N199 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT15124_2090 ),
    .I3(adio_in_8[22]),
    .I4(\BU2/U0/pci32_inst/N290 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/N7 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [22])
  );
  LUT6 #(
    .INIT ( 64'hCCDFCC80DFDF8080 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT15163_SW0  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/N25 ),
    .I1(\BU2/U0/pci32_inst/N199 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1526_1867 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/BAR2[22] ),
    .I4(\BU2/U0/pci32_inst/N198 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/N1445 ),
    .O(\BU2/U0/pci32_inst/N290 )
  );
  LUT6 #(
    .INIT ( 64'hCCDFCC80DFDF8080 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT16228  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/N23 ),
    .I1(\BU2/U0/pci32_inst/N196 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT16124_2089 ),
    .I3(adio_in_8[23]),
    .I4(\BU2/U0/pci32_inst/N288 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/N7 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [23])
  );
  LUT6 #(
    .INIT ( 64'hCCDFCC80DFDF8080 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT16163_SW0  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/N25 ),
    .I1(\BU2/U0/pci32_inst/N196 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1626_1864 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/BAR2[23] ),
    .I4(\BU2/U0/pci32_inst/N195 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/N1445 ),
    .O(\BU2/U0/pci32_inst/N288 )
  );
  LUT6 #(
    .INIT ( 64'hCCDFCC80DFDF8080 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT19228  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/N23 ),
    .I1(\BU2/U0/pci32_inst/N193 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT19124_2088 ),
    .I3(adio_in_8[26]),
    .I4(\BU2/U0/pci32_inst/N286 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/N7 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [26])
  );
  LUT6 #(
    .INIT ( 64'hCCDFCC80DFDF8080 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT19163_SW0  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/N25 ),
    .I1(\BU2/U0/pci32_inst/N193 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1926_1861 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/BAR2[26] ),
    .I4(\BU2/U0/pci32_inst/N192 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/N1445 ),
    .O(\BU2/U0/pci32_inst/N286 )
  );
  LUT6 #(
    .INIT ( 64'hCCDFCC80DFDF8080 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT3228  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/N23 ),
    .I1(\BU2/U0/pci32_inst/N190 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT3124_2087 ),
    .I3(adio_in_8[11]),
    .I4(\BU2/U0/pci32_inst/N284 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/N7 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [11])
  );
  LUT6 #(
    .INIT ( 64'hCCDFCC80DFDF8080 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT3163_SW0  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/N25 ),
    .I1(\BU2/U0/pci32_inst/N190 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT326_1858 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/BAR2[11] ),
    .I4(\BU2/U0/pci32_inst/N189 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/N1445 ),
    .O(\BU2/U0/pci32_inst/N284 )
  );
  LUT6 #(
    .INIT ( 64'hCCDFCC80DFDF8080 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT32228  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/N23 ),
    .I1(\BU2/U0/pci32_inst/N187 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT32124_2086 ),
    .I3(adio_in_8[9]),
    .I4(\BU2/U0/pci32_inst/N282 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/N7 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [9])
  );
  LUT6 #(
    .INIT ( 64'hCCDFCC80DFDF8080 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT32163_SW0  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/N25 ),
    .I1(\BU2/U0/pci32_inst/N187 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT3226_1855 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/BAR2[9] ),
    .I4(\BU2/U0/pci32_inst/N186 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/N1445 ),
    .O(\BU2/U0/pci32_inst/N282 )
  );
  LUT6 #(
    .INIT ( 64'hCCDFCC80DFDF8080 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT4228  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/N23 ),
    .I1(\BU2/U0/pci32_inst/N184 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT4124_2085 ),
    .I3(adio_in_8[12]),
    .I4(\BU2/U0/pci32_inst/N280 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/N7 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [12])
  );
  LUT6 #(
    .INIT ( 64'hCCDFCC80DFDF8080 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT4163_SW0  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/N25 ),
    .I1(\BU2/U0/pci32_inst/N184 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT426_1852 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/BAR2[12] ),
    .I4(\BU2/U0/pci32_inst/N183 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/N1445 ),
    .O(\BU2/U0/pci32_inst/N280 )
  );
  LUT6 #(
    .INIT ( 64'hCCDFCC80DFDF8080 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT5228  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/N23 ),
    .I1(\BU2/U0/pci32_inst/N181 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT5124_2084 ),
    .I3(adio_in_8[13]),
    .I4(\BU2/U0/pci32_inst/N278 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/N7 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [13])
  );
  LUT6 #(
    .INIT ( 64'hCCDFCC80DFDF8080 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT5163_SW0  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/N25 ),
    .I1(\BU2/U0/pci32_inst/N181 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT526_1849 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/BAR2[13] ),
    .I4(\BU2/U0/pci32_inst/N180 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/N1445 ),
    .O(\BU2/U0/pci32_inst/N278 )
  );
  LUT6 #(
    .INIT ( 64'hCCDFCC80DFDF8080 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT6228  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/N23 ),
    .I1(\BU2/U0/pci32_inst/N178 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT6124_2083 ),
    .I3(adio_in_8[14]),
    .I4(\BU2/U0/pci32_inst/N276 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/N7 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [14])
  );
  LUT6 #(
    .INIT ( 64'hCCDFCC80DFDF8080 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT6163_SW0  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/N25 ),
    .I1(\BU2/U0/pci32_inst/N178 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT626_1846 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/BAR2[14] ),
    .I4(\BU2/U0/pci32_inst/N177 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/N1445 ),
    .O(\BU2/U0/pci32_inst/N276 )
  );
  LUT6 #(
    .INIT ( 64'hCCDFCC80DFDF8080 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT7228  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/N23 ),
    .I1(\BU2/U0/pci32_inst/N175 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT7124_2082 ),
    .I3(adio_in_8[15]),
    .I4(\BU2/U0/pci32_inst/N274 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/N7 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [15])
  );
  LUT6 #(
    .INIT ( 64'hCCDFCC80DFDF8080 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT7163_SW0  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/N25 ),
    .I1(\BU2/U0/pci32_inst/N175 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT726_1843 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/BAR2[15] ),
    .I4(\BU2/U0/pci32_inst/N174 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/N1445 ),
    .O(\BU2/U0/pci32_inst/N274 )
  );
  LUT6 #(
    .INIT ( 64'hCCDFCC80DFDF8080 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT8228  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/N23 ),
    .I1(\BU2/U0/pci32_inst/N172 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT8124_2081 ),
    .I3(adio_in_8[16]),
    .I4(\BU2/U0/pci32_inst/N272 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/N7 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [16])
  );
  LUT6 #(
    .INIT ( 64'hCCDFCC80DFDF8080 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT8163_SW0  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/N25 ),
    .I1(\BU2/U0/pci32_inst/N172 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT826_1840 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/BAR2[16] ),
    .I4(\BU2/U0/pci32_inst/N171 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/N1445 ),
    .O(\BU2/U0/pci32_inst/N272 )
  );
  LUT6 #(
    .INIT ( 64'hCCDFCC80DFDF8080 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT9228  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/N23 ),
    .I1(\BU2/U0/pci32_inst/N169 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT9124_2080 ),
    .I3(adio_in_8[17]),
    .I4(\BU2/U0/pci32_inst/N270 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/N7 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [17])
  );
  LUT6 #(
    .INIT ( 64'hCCDFCC80DFDF8080 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT9163_SW0  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/N25 ),
    .I1(\BU2/U0/pci32_inst/N169 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT926_1837 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/BAR2[17] ),
    .I4(\BU2/U0/pci32_inst/N168 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/N1445 ),
    .O(\BU2/U0/pci32_inst/N270 )
  );
  LUT6 #(
    .INIT ( 64'hCACFCAC0CAC0CAC0 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT27143_SW0  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_4_836 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [36]),
    .I2(\BU2/m_fail64 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT26145 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT27108_2094 ),
    .O(\BU2/U0/pci32_inst/N261 )
  );
  LUT6 #(
    .INIT ( 64'hCACFCAC0CAC0CAC0 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT28143_SW0  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_5_837 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [37]),
    .I2(\BU2/m_fail64 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT26145 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT28108_2093 ),
    .O(\BU2/U0/pci32_inst/N258 )
  );
  LUT6 #(
    .INIT ( 64'hCACFCAC0CAC0CAC0 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT30143_SW0  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_7_839 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [39]),
    .I2(\BU2/m_fail64 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT26145 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT30108_2092 ),
    .O(\BU2/U0/pci32_inst/N255 )
  );
  LUT6 #(
    .INIT ( 64'h2808080820000000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT10124  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE3__1227 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE_ROM__1219 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE15__1221 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/N34 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1066_1872 ),
    .I5(\NlwRenamedSig_OI_cfg[116] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT10124_2091 )
  );
  LUT6 #(
    .INIT ( 64'h2808080820000000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT15124  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE3__1227 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE_ROM__1219 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE15__1221 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/N34 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1566_1869 ),
    .I5(\NlwRenamedSig_OI_cfg[116] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT15124_2090 )
  );
  LUT6 #(
    .INIT ( 64'h2808080820000000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT16124  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE3__1227 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE_ROM__1219 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE15__1221 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/N34 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1666_1866 ),
    .I5(\NlwRenamedSig_OI_cfg[116] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT16124_2089 )
  );
  LUT6 #(
    .INIT ( 64'h2808080820000000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT19124  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE3__1227 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE_ROM__1219 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE15__1221 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/N34 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1966_1863 ),
    .I5(\NlwRenamedSig_OI_cfg[116] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT19124_2088 )
  );
  LUT6 #(
    .INIT ( 64'h2808080820000000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT3124  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE15__1221 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE_ROM__1219 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE3__1227 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/N34 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT366_1860 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/REG_0CH [11]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT3124_2087 )
  );
  LUT6 #(
    .INIT ( 64'h2808080820000000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT32124  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE15__1221 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE_ROM__1219 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE3__1227 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/N34 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT3266_1857 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/REG_0CH [9]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT32124_2086 )
  );
  LUT6 #(
    .INIT ( 64'h2808080820000000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT4124  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE15__1221 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE_ROM__1219 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE3__1227 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/N34 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT466_1854 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/REG_0CH [12]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT4124_2085 )
  );
  LUT6 #(
    .INIT ( 64'h2808080820000000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT5124  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE15__1221 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE_ROM__1219 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE3__1227 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/N34 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT566_1851 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/REG_0CH [13]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT5124_2084 )
  );
  LUT6 #(
    .INIT ( 64'h2808080820000000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT6124  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE15__1221 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE_ROM__1219 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE3__1227 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/N34 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT666_1848 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/REG_0CH [14]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT6124_2083 )
  );
  LUT6 #(
    .INIT ( 64'h2808080820000000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT7124  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE15__1221 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE_ROM__1219 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE3__1227 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/N34 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT766_1845 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/REG_0CH [15]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT7124_2082 )
  );
  LUT6 #(
    .INIT ( 64'h2808080820000000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT8124  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE3__1227 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE_ROM__1219 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE15__1221 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/N34 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT866_1842 ),
    .I5(\NlwRenamedSig_OI_cfg[116] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT8124_2081 )
  );
  LUT6 #(
    .INIT ( 64'h2808080820000000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT9124  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE3__1227 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE_ROM__1219 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE15__1221 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/N34 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT966_1839 ),
    .I5(\NlwRenamedSig_OI_cfg[116] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT9124_2080 )
  );
  LUT6 #(
    .INIT ( 64'hCCCDCCCFCCC8CCC0 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT27193  (
    .I0(adio_in_8[4]),
    .I1(\BU2/U0/pci32_inst/N262 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2728_2077 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT272_2078 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/N7 ),
    .I5(\BU2/U0/pci32_inst/N261 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [4])
  );
  LUT6 #(
    .INIT ( 64'hCCCDCCCFCCC8CCC0 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT28193  (
    .I0(adio_in_8[5]),
    .I1(\BU2/U0/pci32_inst/N259 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2828_2073 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT282_2074 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/N7 ),
    .I5(\BU2/U0/pci32_inst/N258 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [5])
  );
  LUT6 #(
    .INIT ( 64'hCCCDCCCFCCC8CCC0 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT30193  (
    .I0(adio_in_8[7]),
    .I1(\BU2/U0/pci32_inst/N256 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT3028_2069 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT302_2070 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/N7 ),
    .I5(\BU2/U0/pci32_inst/N255 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [7])
  );
  LUT6 #(
    .INIT ( 64'hCCCCCCD8CCCCCCF0 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT12237  (
    .I0(adio_in_8[1]),
    .I1(\BU2/U0/pci32_inst/N250 ),
    .I2(\BU2/U0/pci32_inst/N249 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT12164_1947 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1275_2067 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/N7 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [1])
  );
  LUT6 #(
    .INIT ( 64'hCCCCCCD8CCCCCCF0 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT23237  (
    .I0(adio_in_8[2]),
    .I1(\BU2/U0/pci32_inst/N247 ),
    .I2(\BU2/U0/pci32_inst/N246 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT23164_1943 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2375_2064 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/N7 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [2])
  );
  LUT6 #(
    .INIT ( 64'hCCCCCDC8CCCCCFC0 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1207  (
    .I0(adio_in_8[0]),
    .I1(\BU2/U0/pci32_inst/N244 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1441_1935 ),
    .I3(\BU2/U0/pci32_inst/N243 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1134_1939 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/N7 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [0])
  );
  LUT6 #(
    .INIT ( 64'hCCCCCDC8CCCCCFC0 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT29207  (
    .I0(adio_in_8[6]),
    .I1(\BU2/U0/pci32_inst/N241 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2944_2058 ),
    .I3(\BU2/U0/pci32_inst/N240 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT29134_1933 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/N7 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [6])
  );
  LUT6 #(
    .INIT ( 64'hCCCCCDC8CCCCCFC0 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT11238  (
    .I0(adio_in_8[19]),
    .I1(\BU2/U0/pci32_inst/N238 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT11158_2055 ),
    .I3(\BU2/U0/pci32_inst/N237 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT11148_1925 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/N7 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [19])
  );
  LUT6 #(
    .INIT ( 64'hCCCCCDC8CCCCCFC0 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT13238  (
    .I0(adio_in_8[20]),
    .I1(\BU2/U0/pci32_inst/N235 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT13158_2052 ),
    .I3(\BU2/U0/pci32_inst/N234 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT13148_1920 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/N7 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [20])
  );
  LUT6 #(
    .INIT ( 64'hCCCCCDC8CCCCCFC0 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT14238  (
    .I0(adio_in_8[21]),
    .I1(\BU2/U0/pci32_inst/N232 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT14158_2049 ),
    .I3(\BU2/U0/pci32_inst/N231 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT14148_1915 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/N7 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [21])
  );
  LUT6 #(
    .INIT ( 64'hCCCCCDC8CCCCCFC0 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT17238  (
    .I0(adio_in_8[24]),
    .I1(\BU2/U0/pci32_inst/N229 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT17158_2046 ),
    .I3(\BU2/U0/pci32_inst/N228 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT17148_1910 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/N7 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [24])
  );
  LUT6 #(
    .INIT ( 64'hCCCCCDC8CCCCCFC0 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2238  (
    .I0(adio_in_8[10]),
    .I1(\BU2/U0/pci32_inst/N226 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2158_2043 ),
    .I3(\BU2/U0/pci32_inst/N225 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT21481_1905 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/N7 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [10])
  );
  LUT6 #(
    .INIT ( 64'hCCCCCDC8CCCCCFC0 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT20238  (
    .I0(adio_in_8[27]),
    .I1(\BU2/U0/pci32_inst/N223 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT20158_2040 ),
    .I3(\BU2/U0/pci32_inst/N222 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT20148_1900 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/N7 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [27])
  );
  LUT6 #(
    .INIT ( 64'hCCCCCDC8CCCCCFC0 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT21238  (
    .I0(adio_in_8[28]),
    .I1(\BU2/U0/pci32_inst/N220 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT21158_2037 ),
    .I3(\BU2/U0/pci32_inst/N219 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT21148_1895 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/N7 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [28])
  );
  LUT6 #(
    .INIT ( 64'hCCCCCDC8CCCCCFC0 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT22238  (
    .I0(adio_in_8[29]),
    .I1(\BU2/U0/pci32_inst/N217 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT22158_2034 ),
    .I3(\BU2/U0/pci32_inst/N216 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT22148_1890 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/N7 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [29])
  );
  LUT6 #(
    .INIT ( 64'hCCCCCDC8CCCCCFC0 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT24238  (
    .I0(adio_in_8[30]),
    .I1(\BU2/U0/pci32_inst/N214 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT24158_2031 ),
    .I3(\BU2/U0/pci32_inst/N213 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT24148_1885 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/N7 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [30])
  );
  LUT6 #(
    .INIT ( 64'hCCCCCDC8CCCCCFC0 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT25238  (
    .I0(adio_in_8[31]),
    .I1(\BU2/U0/pci32_inst/N211 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT25158_2028 ),
    .I3(\BU2/U0/pci32_inst/N210 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT25148_1880 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/N7 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [31])
  );
  LUT6 #(
    .INIT ( 64'hCCCCCCD8CCCCCCF0 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT18240  (
    .I0(adio_in_8[25]),
    .I1(\BU2/U0/pci32_inst/N208 ),
    .I2(\BU2/U0/pci32_inst/N207 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1844_2026 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT18147_1992 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/N7 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [25])
  );
  LUT4 #(
    .INIT ( 16'hEF45 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT31197_SW1  (
    .I0(\BU2/m_fail64 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_8_842 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [40]),
    .O(\BU2/U0/pci32_inst/N205 )
  );
  LUT4 #(
    .INIT ( 16'hEC20 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT31197_SW0  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I1(\BU2/m_fail64 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_8_842 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [40]),
    .O(\BU2/U0/pci32_inst/N204 )
  );
  LUT4 #(
    .INIT ( 16'hEF45 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT10171_SW1  (
    .I0(\BU2/m_fail64 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_18_850 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [50]),
    .O(\BU2/U0/pci32_inst/N202 )
  );
  LUT4 #(
    .INIT ( 16'hEC20 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT10171_SW0  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I1(\BU2/m_fail64 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_18_850 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [50]),
    .O(\BU2/U0/pci32_inst/N201 )
  );
  LUT4 #(
    .INIT ( 16'hEF45 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT15171_SW1  (
    .I0(\BU2/m_fail64 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_22_856 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [54]),
    .O(\BU2/U0/pci32_inst/N199 )
  );
  LUT4 #(
    .INIT ( 16'hEC20 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT15171_SW0  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I1(\BU2/m_fail64 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_22_856 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [54]),
    .O(\BU2/U0/pci32_inst/N198 )
  );
  LUT4 #(
    .INIT ( 16'hEF45 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT16171_SW1  (
    .I0(\BU2/m_fail64 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_23_854 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [55]),
    .O(\BU2/U0/pci32_inst/N196 )
  );
  LUT4 #(
    .INIT ( 16'hEC20 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT16171_SW0  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I1(\BU2/m_fail64 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_23_854 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [55]),
    .O(\BU2/U0/pci32_inst/N195 )
  );
  LUT4 #(
    .INIT ( 16'hEF45 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT19171_SW1  (
    .I0(\BU2/m_fail64 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_26_857 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [58]),
    .O(\BU2/U0/pci32_inst/N193 )
  );
  LUT4 #(
    .INIT ( 16'hEC20 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT19171_SW0  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I1(\BU2/m_fail64 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_26_857 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [58]),
    .O(\BU2/U0/pci32_inst/N192 )
  );
  LUT4 #(
    .INIT ( 16'hEF45 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT3171_SW1  (
    .I0(\BU2/m_fail64 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_11_843 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [43]),
    .O(\BU2/U0/pci32_inst/N190 )
  );
  LUT4 #(
    .INIT ( 16'hEC20 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT3171_SW0  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I1(\BU2/m_fail64 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_11_843 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [43]),
    .O(\BU2/U0/pci32_inst/N189 )
  );
  LUT4 #(
    .INIT ( 16'hEF45 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT32171_SW1  (
    .I0(\BU2/m_fail64 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_9_840 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [41]),
    .O(\BU2/U0/pci32_inst/N187 )
  );
  LUT4 #(
    .INIT ( 16'hEC20 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT32171_SW0  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I1(\BU2/m_fail64 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_9_840 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [41]),
    .O(\BU2/U0/pci32_inst/N186 )
  );
  LUT4 #(
    .INIT ( 16'hEF45 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT4171_SW1  (
    .I0(\BU2/m_fail64 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_12_844 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [44]),
    .O(\BU2/U0/pci32_inst/N184 )
  );
  LUT4 #(
    .INIT ( 16'hEC20 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT4171_SW0  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I1(\BU2/m_fail64 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_12_844 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [44]),
    .O(\BU2/U0/pci32_inst/N183 )
  );
  LUT4 #(
    .INIT ( 16'hEF45 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT5171_SW1  (
    .I0(\BU2/m_fail64 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_13_845 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [45]),
    .O(\BU2/U0/pci32_inst/N181 )
  );
  LUT4 #(
    .INIT ( 16'hEC20 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT5171_SW0  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I1(\BU2/m_fail64 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_13_845 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [45]),
    .O(\BU2/U0/pci32_inst/N180 )
  );
  LUT4 #(
    .INIT ( 16'hEF45 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT6171_SW1  (
    .I0(\BU2/m_fail64 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_14_846 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [46]),
    .O(\BU2/U0/pci32_inst/N178 )
  );
  LUT4 #(
    .INIT ( 16'hEC20 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT6171_SW0  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I1(\BU2/m_fail64 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_14_846 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [46]),
    .O(\BU2/U0/pci32_inst/N177 )
  );
  LUT4 #(
    .INIT ( 16'hEF45 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT7171_SW1  (
    .I0(\BU2/m_fail64 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_15_849 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [47]),
    .O(\BU2/U0/pci32_inst/N175 )
  );
  LUT4 #(
    .INIT ( 16'hEC20 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT7171_SW0  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I1(\BU2/m_fail64 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_15_849 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [47]),
    .O(\BU2/U0/pci32_inst/N174 )
  );
  LUT4 #(
    .INIT ( 16'hEF45 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT8171_SW1  (
    .I0(\BU2/m_fail64 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_16_847 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [48]),
    .O(\BU2/U0/pci32_inst/N172 )
  );
  LUT4 #(
    .INIT ( 16'hEC20 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT8171_SW0  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I1(\BU2/m_fail64 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_16_847 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [48]),
    .O(\BU2/U0/pci32_inst/N171 )
  );
  LUT4 #(
    .INIT ( 16'hEF45 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT9171_SW1  (
    .I0(\BU2/m_fail64 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_17_848 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [49]),
    .O(\BU2/U0/pci32_inst/N169 )
  );
  LUT4 #(
    .INIT ( 16'hEC20 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT9171_SW0  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I1(\BU2/m_fail64 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_17_848 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [49]),
    .O(\BU2/U0/pci32_inst/N168 )
  );
  LUT6 #(
    .INIT ( 64'h0222000000200000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/ADDR_VLD/ADDR_VLD641  (
    .I0(NlwRenamedSig_OI_addr_vld),
    .I1(\BU2/req64q_n ),
    .I2(bw_detect_dis),
    .I3(bw_manual_32b),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/ADDR_VLD/REQ64Q__816 ),
    .I5(\BU2/U0/pci32_inst/XPCI_WATCHDOG/PCIW ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADDR_VLD64 )
  );
  LUT6 #(
    .INIT ( 64'h0040000000000000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MMUX_NS_BH64_211  (
    .I0(\BU2/U0/pci32_inst/N166 ),
    .I1(NlwRenamedSig_OI_s_cbe[2]),
    .I2(\NlwRenamedSig_OI_csr[1] ),
    .I3(\BU2/U0/pci32_inst/N57 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/ADDR_VLD64 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/ADDRESS_MATCH ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/NS_BH64_2 )
  );
  LUT2 #(
    .INIT ( 4'hD ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR2/NS_BH64_O_SW1  (
    .I0(\BU2/U0/pci32_inst/OLD[74] ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/N166 )
  );
  LUT5 #(
    .INIT ( 32'h84800400 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2695_SW0  (
    .I0(NlwRenamedSig_OI_addr[5]),
    .I1(NlwRenamedSig_OI_addr[3]),
    .I2(NlwRenamedSig_OI_addr[2]),
    .I3(\NlwRenamedSig_OI_cfg[0] ),
    .I4(\NlwRenamedSig_OI_cfg[116] ),
    .O(\BU2/U0/pci32_inst/N90 )
  );
  LUT5 #(
    .INIT ( 32'h84800400 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2765_SW0  (
    .I0(NlwRenamedSig_OI_addr[5]),
    .I1(NlwRenamedSig_OI_addr[3]),
    .I2(NlwRenamedSig_OI_addr[2]),
    .I3(\NlwRenamedSig_OI_cfg[0] ),
    .I4(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/N88 )
  );
  LUT5 #(
    .INIT ( 32'h84800400 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2865_SW0  (
    .I0(NlwRenamedSig_OI_addr[5]),
    .I1(NlwRenamedSig_OI_addr[3]),
    .I2(NlwRenamedSig_OI_addr[2]),
    .I3(\NlwRenamedSig_OI_cfg[0] ),
    .I4(\NlwRenamedSig_OI_cfg[116] ),
    .O(\BU2/U0/pci32_inst/N86 )
  );
  LUT5 #(
    .INIT ( 32'h84800400 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT3065_SW0  (
    .I0(NlwRenamedSig_OI_addr[5]),
    .I1(NlwRenamedSig_OI_addr[3]),
    .I2(NlwRenamedSig_OI_addr[2]),
    .I3(\NlwRenamedSig_OI_cfg[0] ),
    .I4(\NlwRenamedSig_OI_cfg[116] ),
    .O(\BU2/U0/pci32_inst/N84 )
  );
  LUT6 #(
    .INIT ( 64'h2FAF2FFF7FAF7FFF ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT12118_SW0  (
    .I0(NlwRenamedSig_OI_addr[2]),
    .I1(\NlwRenamedSig_OI_cfg[116] ),
    .I2(NlwRenamedSig_OI_addr[3]),
    .I3(NlwRenamedSig_OI_addr[5]),
    .I4(\NlwRenamedSig_OI_cfg[0] ),
    .I5(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/N98 )
  );
  LUT6 #(
    .INIT ( 64'h2FAF2FFF7FAF7FFF ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT23118_SW0  (
    .I0(NlwRenamedSig_OI_addr[2]),
    .I1(\NlwRenamedSig_OI_cfg[116] ),
    .I2(NlwRenamedSig_OI_addr[3]),
    .I3(NlwRenamedSig_OI_addr[5]),
    .I4(\NlwRenamedSig_OI_cfg[0] ),
    .I5(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/N96 )
  );
  LUT6 #(
    .INIT ( 64'h2FAF2FFF7FAF7FFF ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1882_SW0  (
    .I0(NlwRenamedSig_OI_addr[2]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(NlwRenamedSig_OI_addr[3]),
    .I3(NlwRenamedSig_OI_addr[5]),
    .I4(\NlwRenamedSig_OI_cfg[0] ),
    .I5(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/N94 )
  );
  LUT6 #(
    .INIT ( 64'h2FAF2FFF7FAF7FFF ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2988_SW0  (
    .I0(NlwRenamedSig_OI_addr[2]),
    .I1(\NlwRenamedSig_OI_cfg[116] ),
    .I2(NlwRenamedSig_OI_addr[3]),
    .I3(NlwRenamedSig_OI_addr[5]),
    .I4(\NlwRenamedSig_OI_cfg[0] ),
    .I5(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/N92 )
  );
  LUT6 #(
    .INIT ( 64'h2808080820000000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT18147  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT26145 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE_ROM__1219 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE15__1221 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/N34 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1881_1874 ),
    .I5(\NlwRenamedSig_OI_cfg[116] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT18147_1992 )
  );
  LUT5 #(
    .INIT ( 32'hC0004000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT18139_SW0  (
    .I0(\BU2/U0/pci32_inst/OLD[74] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE3__1227 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/N01 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE1__1217 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE6__1223 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT26145 )
  );
  LUT6 #(
    .INIT ( 64'hEEEEEEEEEEEEEEE2 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/S_CYCLE64_INT_RSTPOT  (
    .I0(\BU2/s_cycle64 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_AK64/MMUX_NS_ACK64_115 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/ACKHIT ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/NS_BH64_2 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/NS_BH64_0 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/NS_BH64_1 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/S_CYCLE64_INT_RSTPOT_1950 )
  );
  LUT3 #(
    .INIT ( 8'hD7 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_LUT<9>  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(NlwRenamedSig_OI_adio_out[31]),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT_31_1303 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_LUT [9])
  );
  LUT4 #(
    .INIT ( 16'h00D7 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_LUT<8>  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT_30_1309 ),
    .I2(NlwRenamedSig_OI_adio_out[30]),
    .I3(\BU2/U0/pci32_inst/N160 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_LUT [8])
  );
  LUT6 #(
    .INIT ( 64'h0ACEA0ECCE0AECA0 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_LUT<8>_SW0  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT_29_1312 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT_28_1308 ),
    .I4(NlwRenamedSig_OI_adio_out[29]),
    .I5(NlwRenamedSig_OI_adio_out[28]),
    .O(\BU2/U0/pci32_inst/N160 )
  );
  LUT6 #(
    .INIT ( 64'h0000008000000000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT12100  (
    .I0(NlwRenamedSig_OI_addr[5]),
    .I1(NlwRenamedSig_OI_addr[2]),
    .I2(NlwRenamedSig_OI_addr[4]),
    .I3(\BU2/U0/pci32_inst/N71 ),
    .I4(NlwRenamedSig_OI_addr[3]),
    .I5(\BU2/U0/pci32_inst/N158 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT12100_1945 )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/MD<0>4_SW4  (
    .I0(\NlwRenamedSig_OI_csr[20] ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/N158 )
  );
  LUT6 #(
    .INIT ( 64'h0000008000000000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT23100  (
    .I0(NlwRenamedSig_OI_addr[5]),
    .I1(NlwRenamedSig_OI_addr[2]),
    .I2(NlwRenamedSig_OI_addr[4]),
    .I3(\BU2/U0/pci32_inst/N71 ),
    .I4(NlwRenamedSig_OI_addr[3]),
    .I5(\BU2/U0/pci32_inst/N156 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT23100_1941 )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/MD<0>4_SW3  (
    .I0(\NlwRenamedSig_OI_csr[20] ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/N156 )
  );
  LUT6 #(
    .INIT ( 64'h0000008000000000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1701  (
    .I0(NlwRenamedSig_OI_addr[5]),
    .I1(NlwRenamedSig_OI_addr[2]),
    .I2(NlwRenamedSig_OI_addr[4]),
    .I3(\BU2/U0/pci32_inst/N71 ),
    .I4(NlwRenamedSig_OI_addr[3]),
    .I5(\BU2/U0/pci32_inst/N154 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1701_1937 )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/MD<0>4_SW2  (
    .I0(\NlwRenamedSig_OI_csr[20] ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/N154 )
  );
  LUT6 #(
    .INIT ( 64'h0000008000000000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2970  (
    .I0(NlwRenamedSig_OI_addr[5]),
    .I1(NlwRenamedSig_OI_addr[2]),
    .I2(NlwRenamedSig_OI_addr[4]),
    .I3(\BU2/U0/pci32_inst/N71 ),
    .I4(NlwRenamedSig_OI_addr[3]),
    .I5(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2970_1931 )
  );
  LUT6 #(
    .INIT ( 64'h8000000080008000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/N1443<6>41  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE3__1227 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE15__1221 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE_ROM__1219 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE1__1217 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE6__1223 ),
    .I5(\BU2/U0/pci32_inst/OLD[74] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/N25 )
  );
  LUT6 #(
    .INIT ( 64'h0000000080000000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT31190_SW0  (
    .I0(\BU2/U0/pci32_inst/OLD[74] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/N01 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/BAR2[8] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/N9 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE1__1217 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE6__1223 ),
    .O(\BU2/U0/pci32_inst/N150 )
  );
  LUT6 #(
    .INIT ( 64'h0000000000000207 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/OE_TRDY_IN_  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/INTACK ),
    .I2(\BU2/U0/pci32_inst/N148 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/NS_BASE_HIT2_INT ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/NS_BASE_HIT0 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/NS_BASE_HIT1 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/OE_TRDY_IN__1184 )
  );
  LUT6 #(
    .INIT ( 64'hCCCCCCCCCCCCECFC ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_AK64/MMUX_NS_ACK64_1107  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_AK64/MMUX_NS_ACK64_15_1831 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_AK64/MMUX_NS_ACK64_133_1984 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/NS_BH64_2_INT ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/NS_BH64_0 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/NS_BH64_1 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/NS_ACK64_ )
  );
  LUT4 #(
    .INIT ( 16'h0004 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT312  (
    .I0(NlwRenamedSig_OI_addr[6]),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE3__1227 ),
    .I2(NlwRenamedSig_OI_addr[7]),
    .I3(NlwRenamedSig_OI_addr[4]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT312_1983 )
  );
  LUT4 #(
    .INIT ( 16'h00D7 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_LUT<7>  (
    .I0(\NlwRenamedSig_OI_cfg[116] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [27]),
    .I2(NlwRenamedSig_OI_adio_out[27]),
    .I3(\BU2/U0/pci32_inst/N146 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_LUT [7])
  );
  LUT6 #(
    .INIT ( 64'h0ACEA0ECCE0AECA0 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_LUT<7>_SW0  (
    .I0(\NlwRenamedSig_OI_cfg[116] ),
    .I1(\NlwRenamedSig_OI_cfg[116] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [26]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [25]),
    .I4(NlwRenamedSig_OI_adio_out[26]),
    .I5(NlwRenamedSig_OI_adio_out[25]),
    .O(\BU2/U0/pci32_inst/N146 )
  );
  LUT4 #(
    .INIT ( 16'h00D7 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_LUT<7>  (
    .I0(\NlwRenamedSig_OI_cfg[116] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [27]),
    .I2(NlwRenamedSig_OI_adio_out[27]),
    .I3(\BU2/U0/pci32_inst/N144 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_LUT [7])
  );
  LUT6 #(
    .INIT ( 64'h0ACEA0ECCE0AECA0 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_LUT<7>_SW0  (
    .I0(\NlwRenamedSig_OI_cfg[116] ),
    .I1(\NlwRenamedSig_OI_cfg[116] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [26]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [25]),
    .I4(NlwRenamedSig_OI_adio_out[26]),
    .I5(NlwRenamedSig_OI_adio_out[25]),
    .O(\BU2/U0/pci32_inst/N144 )
  );
  LUT4 #(
    .INIT ( 16'h00D7 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_LUT<7>  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [27]),
    .I2(NlwRenamedSig_OI_adio_out[27]),
    .I3(\BU2/U0/pci32_inst/N142 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_LUT [7])
  );
  LUT6 #(
    .INIT ( 64'h0ACEA0ECCE0AECA0 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_LUT<7>_SW0  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [26]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [25]),
    .I4(NlwRenamedSig_OI_adio_out[26]),
    .I5(NlwRenamedSig_OI_adio_out[25]),
    .O(\BU2/U0/pci32_inst/N142 )
  );
  LUT4 #(
    .INIT ( 16'h00D7 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_LUT<6>  (
    .I0(\NlwRenamedSig_OI_cfg[116] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [24]),
    .I2(NlwRenamedSig_OI_adio_out[24]),
    .I3(\BU2/U0/pci32_inst/N140 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_LUT [6])
  );
  LUT6 #(
    .INIT ( 64'h0ACEA0ECCE0AECA0 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_LUT<6>_SW0  (
    .I0(\NlwRenamedSig_OI_cfg[116] ),
    .I1(\NlwRenamedSig_OI_cfg[116] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [23]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [22]),
    .I4(NlwRenamedSig_OI_adio_out[23]),
    .I5(NlwRenamedSig_OI_adio_out[22]),
    .O(\BU2/U0/pci32_inst/N140 )
  );
  LUT4 #(
    .INIT ( 16'h00D7 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_LUT<6>  (
    .I0(\NlwRenamedSig_OI_cfg[116] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [24]),
    .I2(NlwRenamedSig_OI_adio_out[24]),
    .I3(\BU2/U0/pci32_inst/N138 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_LUT [6])
  );
  LUT6 #(
    .INIT ( 64'h0ACEA0ECCE0AECA0 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_LUT<6>_SW0  (
    .I0(\NlwRenamedSig_OI_cfg[116] ),
    .I1(\NlwRenamedSig_OI_cfg[116] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [23]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [22]),
    .I4(NlwRenamedSig_OI_adio_out[23]),
    .I5(NlwRenamedSig_OI_adio_out[22]),
    .O(\BU2/U0/pci32_inst/N138 )
  );
  LUT4 #(
    .INIT ( 16'h00D7 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_LUT<6>  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [24]),
    .I2(NlwRenamedSig_OI_adio_out[24]),
    .I3(\BU2/U0/pci32_inst/N136 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_LUT [6])
  );
  LUT6 #(
    .INIT ( 64'h0ACEA0ECCE0AECA0 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_LUT<6>_SW0  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [23]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [22]),
    .I4(NlwRenamedSig_OI_adio_out[23]),
    .I5(NlwRenamedSig_OI_adio_out[22]),
    .O(\BU2/U0/pci32_inst/N136 )
  );
  LUT4 #(
    .INIT ( 16'h00D7 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_LUT<5>  (
    .I0(\NlwRenamedSig_OI_cfg[116] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [21]),
    .I2(NlwRenamedSig_OI_adio_out[21]),
    .I3(\BU2/U0/pci32_inst/N134 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_LUT [5])
  );
  LUT6 #(
    .INIT ( 64'h0ACEA0ECCE0AECA0 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_LUT<5>_SW0  (
    .I0(\NlwRenamedSig_OI_cfg[116] ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [20]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [19]),
    .I4(NlwRenamedSig_OI_adio_out[20]),
    .I5(NlwRenamedSig_OI_adio_out[19]),
    .O(\BU2/U0/pci32_inst/N134 )
  );
  LUT4 #(
    .INIT ( 16'h00D7 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_LUT<5>  (
    .I0(\NlwRenamedSig_OI_cfg[116] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [21]),
    .I2(NlwRenamedSig_OI_adio_out[21]),
    .I3(\BU2/U0/pci32_inst/N132 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_LUT [5])
  );
  LUT6 #(
    .INIT ( 64'h0ACEA0ECCE0AECA0 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_LUT<5>_SW0  (
    .I0(\NlwRenamedSig_OI_cfg[116] ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [20]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [19]),
    .I4(NlwRenamedSig_OI_adio_out[20]),
    .I5(NlwRenamedSig_OI_adio_out[19]),
    .O(\BU2/U0/pci32_inst/N132 )
  );
  LUT4 #(
    .INIT ( 16'h00D7 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_LUT<5>  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [21]),
    .I2(NlwRenamedSig_OI_adio_out[21]),
    .I3(\BU2/U0/pci32_inst/N130 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_LUT [5])
  );
  LUT6 #(
    .INIT ( 64'h0ACEA0ECCE0AECA0 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_LUT<5>_SW0  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [20]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [19]),
    .I4(NlwRenamedSig_OI_adio_out[20]),
    .I5(NlwRenamedSig_OI_adio_out[19]),
    .O(\BU2/U0/pci32_inst/N130 )
  );
  LUT4 #(
    .INIT ( 16'h00D7 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_LUT<4>  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [18]),
    .I2(NlwRenamedSig_OI_adio_out[18]),
    .I3(\BU2/U0/pci32_inst/N128 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_LUT [4])
  );
  LUT6 #(
    .INIT ( 64'h0ACEA0ECCE0AECA0 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_LUT<4>_SW0  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [17]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [16]),
    .I4(NlwRenamedSig_OI_adio_out[17]),
    .I5(NlwRenamedSig_OI_adio_out[16]),
    .O(\BU2/U0/pci32_inst/N128 )
  );
  LUT4 #(
    .INIT ( 16'h00D7 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_LUT<4>  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [18]),
    .I2(NlwRenamedSig_OI_adio_out[18]),
    .I3(\BU2/U0/pci32_inst/N126 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_LUT [4])
  );
  LUT6 #(
    .INIT ( 64'h0ACEA0ECCE0AECA0 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_LUT<4>_SW0  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [17]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [16]),
    .I4(NlwRenamedSig_OI_adio_out[17]),
    .I5(NlwRenamedSig_OI_adio_out[16]),
    .O(\BU2/U0/pci32_inst/N126 )
  );
  LUT4 #(
    .INIT ( 16'h00D7 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_LUT<4>  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [18]),
    .I2(NlwRenamedSig_OI_adio_out[18]),
    .I3(\BU2/U0/pci32_inst/N124 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_LUT [4])
  );
  LUT6 #(
    .INIT ( 64'h0ACEA0ECCE0AECA0 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_LUT<4>_SW0  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [17]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [16]),
    .I4(NlwRenamedSig_OI_adio_out[17]),
    .I5(NlwRenamedSig_OI_adio_out[16]),
    .O(\BU2/U0/pci32_inst/N124 )
  );
  LUT4 #(
    .INIT ( 16'h00D7 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_LUT<3>  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [15]),
    .I2(NlwRenamedSig_OI_adio_out[15]),
    .I3(\BU2/U0/pci32_inst/N122 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_LUT [3])
  );
  LUT6 #(
    .INIT ( 64'h0ACEA0ECCE0AECA0 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_LUT<3>_SW0  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [14]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [13]),
    .I4(NlwRenamedSig_OI_adio_out[14]),
    .I5(NlwRenamedSig_OI_adio_out[13]),
    .O(\BU2/U0/pci32_inst/N122 )
  );
  LUT4 #(
    .INIT ( 16'h00D7 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_LUT<3>  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [15]),
    .I2(NlwRenamedSig_OI_adio_out[15]),
    .I3(\BU2/U0/pci32_inst/N120 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_LUT [3])
  );
  LUT6 #(
    .INIT ( 64'h0ACEA0ECCE0AECA0 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_LUT<3>_SW0  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [14]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [13]),
    .I4(NlwRenamedSig_OI_adio_out[14]),
    .I5(NlwRenamedSig_OI_adio_out[13]),
    .O(\BU2/U0/pci32_inst/N120 )
  );
  LUT4 #(
    .INIT ( 16'h00D7 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_LUT<3>  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [15]),
    .I2(NlwRenamedSig_OI_adio_out[15]),
    .I3(\BU2/U0/pci32_inst/N118 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_LUT [3])
  );
  LUT6 #(
    .INIT ( 64'h0ACEA0ECCE0AECA0 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_LUT<3>_SW0  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [14]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [13]),
    .I4(NlwRenamedSig_OI_adio_out[14]),
    .I5(NlwRenamedSig_OI_adio_out[13]),
    .O(\BU2/U0/pci32_inst/N118 )
  );
  LUT4 #(
    .INIT ( 16'h00D7 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_LUT<2>  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [12]),
    .I2(NlwRenamedSig_OI_adio_out[12]),
    .I3(\BU2/U0/pci32_inst/N116 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_LUT [2])
  );
  LUT6 #(
    .INIT ( 64'h0ACEA0ECCE0AECA0 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_LUT<2>_SW0  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [11]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [10]),
    .I4(NlwRenamedSig_OI_adio_out[11]),
    .I5(NlwRenamedSig_OI_adio_out[10]),
    .O(\BU2/U0/pci32_inst/N116 )
  );
  LUT4 #(
    .INIT ( 16'h00D7 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_LUT<2>  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [12]),
    .I2(NlwRenamedSig_OI_adio_out[12]),
    .I3(\BU2/U0/pci32_inst/N114 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_LUT [2])
  );
  LUT6 #(
    .INIT ( 64'h0ACEA0ECCE0AECA0 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_LUT<2>_SW0  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [11]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [10]),
    .I4(NlwRenamedSig_OI_adio_out[11]),
    .I5(NlwRenamedSig_OI_adio_out[10]),
    .O(\BU2/U0/pci32_inst/N114 )
  );
  LUT4 #(
    .INIT ( 16'h00D7 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_LUT<2>  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [12]),
    .I2(NlwRenamedSig_OI_adio_out[12]),
    .I3(\BU2/U0/pci32_inst/N112 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_LUT [2])
  );
  LUT6 #(
    .INIT ( 64'h0ACEA0ECCE0AECA0 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_LUT<2>_SW0  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [11]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [10]),
    .I4(NlwRenamedSig_OI_adio_out[11]),
    .I5(NlwRenamedSig_OI_adio_out[10]),
    .O(\BU2/U0/pci32_inst/N112 )
  );
  LUT4 #(
    .INIT ( 16'h00D7 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_LUT<1>  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [9]),
    .I2(NlwRenamedSig_OI_adio_out[9]),
    .I3(\BU2/U0/pci32_inst/N110 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_LUT [1])
  );
  LUT6 #(
    .INIT ( 64'h0ACEA0ECCE0AECA0 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_LUT<1>_SW0  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [8]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [7]),
    .I4(NlwRenamedSig_OI_adio_out[8]),
    .I5(NlwRenamedSig_OI_adio_out[7]),
    .O(\BU2/U0/pci32_inst/N110 )
  );
  LUT4 #(
    .INIT ( 16'h00D7 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_LUT<1>  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [9]),
    .I2(NlwRenamedSig_OI_adio_out[9]),
    .I3(\BU2/U0/pci32_inst/N108 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_LUT [1])
  );
  LUT6 #(
    .INIT ( 64'h0ACEA0ECCE0AECA0 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_LUT<1>_SW0  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [8]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [7]),
    .I4(NlwRenamedSig_OI_adio_out[8]),
    .I5(NlwRenamedSig_OI_adio_out[7]),
    .O(\BU2/U0/pci32_inst/N108 )
  );
  LUT4 #(
    .INIT ( 16'h00D7 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_LUT<1>  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [9]),
    .I2(NlwRenamedSig_OI_adio_out[9]),
    .I3(\BU2/U0/pci32_inst/N106 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_LUT [1])
  );
  LUT6 #(
    .INIT ( 64'h0ACEA0ECCE0AECA0 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_LUT<1>_SW0  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [8]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [7]),
    .I4(NlwRenamedSig_OI_adio_out[8]),
    .I5(NlwRenamedSig_OI_adio_out[7]),
    .O(\BU2/U0/pci32_inst/N106 )
  );
  LUT4 #(
    .INIT ( 16'h00D7 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_LUT<0>  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [6]),
    .I2(NlwRenamedSig_OI_adio_out[6]),
    .I3(\BU2/U0/pci32_inst/N104 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_LUT [0])
  );
  LUT6 #(
    .INIT ( 64'h0ACEA0ECCE0AECA0 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_LUT<0>_SW0  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [5]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [4]),
    .I4(NlwRenamedSig_OI_adio_out[5]),
    .I5(NlwRenamedSig_OI_adio_out[4]),
    .O(\BU2/U0/pci32_inst/N104 )
  );
  LUT4 #(
    .INIT ( 16'h00D7 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_LUT<0>  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [6]),
    .I2(NlwRenamedSig_OI_adio_out[6]),
    .I3(\BU2/U0/pci32_inst/N102 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_LUT [0])
  );
  LUT6 #(
    .INIT ( 64'h0ACEA0ECCE0AECA0 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_LUT<0>_SW0  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [5]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [4]),
    .I4(NlwRenamedSig_OI_adio_out[5]),
    .I5(NlwRenamedSig_OI_adio_out[4]),
    .O(\BU2/U0/pci32_inst/N102 )
  );
  LUT4 #(
    .INIT ( 16'h00D7 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_LUT<0>  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [6]),
    .I2(NlwRenamedSig_OI_adio_out[6]),
    .I3(\BU2/U0/pci32_inst/N100 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_LUT [0])
  );
  LUT6 #(
    .INIT ( 64'h0ACEA0ECCE0AECA0 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_LUT<0>_SW0  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [5]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [4]),
    .I4(NlwRenamedSig_OI_adio_out[5]),
    .I5(NlwRenamedSig_OI_adio_out[4]),
    .O(\BU2/U0/pci32_inst/N100 )
  );
  LUT6 #(
    .INIT ( 64'h0002000000030003 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT12118  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/N38 ),
    .I1(NlwRenamedSig_OI_addr[7]),
    .I2(NlwRenamedSig_OI_addr[6]),
    .I3(NlwRenamedSig_OI_addr[4]),
    .I4(\NlwRenamedSig_OI_cfg[116] ),
    .I5(\BU2/U0/pci32_inst/N98 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT12118_1946 )
  );
  LUT6 #(
    .INIT ( 64'h0002000000030003 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT23118  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/N38 ),
    .I1(NlwRenamedSig_OI_addr[7]),
    .I2(NlwRenamedSig_OI_addr[6]),
    .I3(NlwRenamedSig_OI_addr[4]),
    .I4(\NlwRenamedSig_OI_cfg[116] ),
    .I5(\BU2/U0/pci32_inst/N96 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT23118_1942 )
  );
  LUT6 #(
    .INIT ( 64'h0002000000030003 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1882  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/N38 ),
    .I1(NlwRenamedSig_OI_addr[7]),
    .I2(NlwRenamedSig_OI_addr[6]),
    .I3(NlwRenamedSig_OI_addr[4]),
    .I4(\NlwRenamedSig_OI_cfg[0] ),
    .I5(\BU2/U0/pci32_inst/N94 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1882_1938 )
  );
  LUT6 #(
    .INIT ( 64'h0002000000030003 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2988  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/N38 ),
    .I1(NlwRenamedSig_OI_addr[7]),
    .I2(NlwRenamedSig_OI_addr[6]),
    .I3(NlwRenamedSig_OI_addr[4]),
    .I4(\NlwRenamedSig_OI_cfg[116] ),
    .I5(\BU2/U0/pci32_inst/N92 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2988_1932 )
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/BUG_FIX  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/BUG_FIX_RSTPOT ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/BUG_FIX_1625 )
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/BAR0/NL_MEMO  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/NL_MEMO_RSTPOT_1953 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/NL_MEMO_1789 )
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/BAR1/NL_MEMO  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/NL_MEMO_RSTPOT_1952 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/NL_MEMO_1787 )
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/BAR2/NL_MEMO  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/NL_MEMO_RSTPOT_1951 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/NL_MEMO_1788 )
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/S_CYCLE64_INT  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/S_CYCLE64_INT_RSTPOT_1950 ),
    .Q(\BU2/s_cycle64 )
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/MASTER_TEMP  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/MASTER_TEMP_RSTPOT_1948 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/MASTER_TEMP_1949 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_XOR<7>_RT  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/B [7]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_XOR<7>_RT_1546 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_XOR<7>_RT  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/D [7]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_XOR<7>_RT_1523 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_XOR<7>_RT  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/A [7]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_XOR<7>_RT_1500 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_XOR<7>_RT  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/C [7]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_XOR<7>_RT_1477 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_XOR<7>_RT  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/E [7]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_XOR<7>_RT_1454 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY<1>_RT  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/B [1]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY<1>_RT_1564 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY<2>_RT  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/B [2]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY<2>_RT_1561 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY<3>_RT  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/B [3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY<3>_RT_1558 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY<4>_RT  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/B [4]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY<4>_RT_1555 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY<5>_RT  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/B [5]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY<5>_RT_1552 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY<6>_RT  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/B [6]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY<6>_RT_1549 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY<1>_RT  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/D [1]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY<1>_RT_1541 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY<2>_RT  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/D [2]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY<2>_RT_1538 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY<3>_RT  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/D [3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY<3>_RT_1535 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY<4>_RT  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/D [4]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY<4>_RT_1532 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY<5>_RT  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/D [5]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY<5>_RT_1529 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY<6>_RT  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/D [6]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY<6>_RT_1526 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY<1>_RT  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/A [1]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY<1>_RT_1518 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY<2>_RT  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/A [2]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY<2>_RT_1515 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY<3>_RT  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/A [3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY<3>_RT_1512 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY<4>_RT  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/A [4]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY<4>_RT_1509 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY<5>_RT  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/A [5]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY<5>_RT_1506 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY<6>_RT  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/A [6]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY<6>_RT_1503 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY<1>_RT  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/C [1]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY<1>_RT_1495 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY<2>_RT  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/C [2]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY<2>_RT_1492 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY<3>_RT  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/C [3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY<3>_RT_1489 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY<4>_RT  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/C [4]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY<4>_RT_1486 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY<5>_RT  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/C [5]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY<5>_RT_1483 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY<6>_RT  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/C [6]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY<6>_RT_1480 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY<1>_RT  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/E [1]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY<1>_RT_1472 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY<2>_RT  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/E [2]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY<2>_RT_1469 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY<3>_RT  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/E [3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY<3>_RT_1466 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY<4>_RT  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/E [4]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY<4>_RT_1463 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY<5>_RT  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/E [5]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY<5>_RT_1460 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY<6>_RT  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/E [6]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY<6>_RT_1457 )
  );
  LUT6 #(
    .INIT ( 64'hF000A000F0008000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT12164  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1103 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT12100_1945 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/N23 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE3__1227 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT12147_1944 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT12118_1946 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT12164_1947 )
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT12147  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_IREG/INTERRUPTLINE [1]),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE_ROM__1219 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE15__1221 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT12147_1944 )
  );
  LUT6 #(
    .INIT ( 64'hF000A000F0008000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT23164  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1103 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT23100_1941 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/N23 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE3__1227 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT23147_1940 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT23118_1942 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT23164_1943 )
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT23147  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_IREG/INTERRUPTLINE [2]),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE_ROM__1219 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE15__1221 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT23147_1940 )
  );
  LUT6 #(
    .INIT ( 64'hF000A000F0008000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1134  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1103 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1701_1937 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/N23 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE3__1227 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1117_1936 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1882_1938 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1134_1939 )
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1117  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_IREG/INTERRUPTLINE [0]),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE_ROM__1219 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE15__1221 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1117_1936 )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1441  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/N1445 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/N25 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT127_1934 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1441_1935 )
  );
  LUT6 #(
    .INIT ( 64'h00C0AA4A00C00040 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT127  (
    .I0(\BU2/U0/pci32_inst/OLD[0] ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/OLD[37] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE5__1229 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE4__1225 ),
    .I5(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT127_1934 )
  );
  LUT6 #(
    .INIT ( 64'hF000A000F0008000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT29134  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1103 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2970_1931 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/N23 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE3__1227 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT29117_1930 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2988_1932 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT29134_1933 )
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT29117  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_IREG/INTERRUPTLINE [6]),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE_ROM__1219 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE15__1221 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT29117_1930 )
  );
  LUT6 #(
    .INIT ( 64'h00C0AA4A00C00040 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2927  (
    .I0(\BU2/U0/pci32_inst/OLD[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR1[6] ),
    .I2(\BU2/U0/pci32_inst/OLD[37] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE5__1229 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE4__1225 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/BAR0[6] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2927_1929 )
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT3089  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE_ROM__1219 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE15__1221 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1103 )
  );
  LUT6 #(
    .INIT ( 64'hE055E00040554000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT3127  (
    .I0(NlwRenamedSig_OI_addr[2]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(NlwRenamedSig_OI_addr[3]),
    .I3(NlwRenamedSig_OI_addr[5]),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT3112_1926 ),
    .I5(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT3127_1927 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT3112  (
    .I0(NlwRenamedSig_OI_addr[3]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT3112_1926 )
  );
  LUT5 #(
    .INIT ( 32'hFF808080 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT11148  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/N23 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE3__1227 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT11110_1924 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1126_1921 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/N25 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT11148_1925 )
  );
  LUT5 #(
    .INIT ( 32'h000E0004 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1155  (
    .I0(NlwRenamedSig_OI_addr[3]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(NlwRenamedSig_OI_addr[5]),
    .I3(NlwRenamedSig_OI_addr[2]),
    .I4(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1155_1923 )
  );
  LUT5 #(
    .INIT ( 32'hE0004000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1147  (
    .I0(NlwRenamedSig_OI_addr[2]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(NlwRenamedSig_OI_addr[5]),
    .I3(NlwRenamedSig_OI_addr[3]),
    .I4(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1147_1922 )
  );
  LUT6 #(
    .INIT ( 64'h00C0AA4A00C00040 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1126  (
    .I0(\BU2/U0/pci32_inst/OLD[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR1[19] ),
    .I2(\BU2/U0/pci32_inst/OLD[37] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE5__1229 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE4__1225 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/BAR0[19] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1126_1921 )
  );
  LUT5 #(
    .INIT ( 32'hFF808080 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT13148  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/N23 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE3__1227 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT13110_1919 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1326_1916 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/N25 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT13148_1920 )
  );
  LUT5 #(
    .INIT ( 32'h000E0004 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1355  (
    .I0(NlwRenamedSig_OI_addr[3]),
    .I1(\NlwRenamedSig_OI_cfg[116] ),
    .I2(NlwRenamedSig_OI_addr[5]),
    .I3(NlwRenamedSig_OI_addr[2]),
    .I4(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1355_1918 )
  );
  LUT5 #(
    .INIT ( 32'hE0004000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1347  (
    .I0(NlwRenamedSig_OI_addr[2]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(NlwRenamedSig_OI_addr[5]),
    .I3(NlwRenamedSig_OI_addr[3]),
    .I4(\NlwRenamedSig_OI_cfg[116] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1347_1917 )
  );
  LUT6 #(
    .INIT ( 64'h00C0AA4A00C00040 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1326  (
    .I0(\BU2/U0/pci32_inst/OLD[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR1[20] ),
    .I2(\BU2/U0/pci32_inst/OLD[37] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE5__1229 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE4__1225 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/BAR0[20] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1326_1916 )
  );
  LUT5 #(
    .INIT ( 32'hFF808080 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT14148  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/N23 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE3__1227 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT14110_1914 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1426_1911 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/N25 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT14148_1915 )
  );
  LUT5 #(
    .INIT ( 32'h000E0004 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1455  (
    .I0(NlwRenamedSig_OI_addr[3]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(NlwRenamedSig_OI_addr[5]),
    .I3(NlwRenamedSig_OI_addr[2]),
    .I4(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1455_1913 )
  );
  LUT5 #(
    .INIT ( 32'hE0004000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1447  (
    .I0(NlwRenamedSig_OI_addr[2]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(NlwRenamedSig_OI_addr[5]),
    .I3(NlwRenamedSig_OI_addr[3]),
    .I4(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1447_1912 )
  );
  LUT6 #(
    .INIT ( 64'h00C0AA4A00C00040 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1426  (
    .I0(\BU2/U0/pci32_inst/OLD[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR1[21] ),
    .I2(\BU2/U0/pci32_inst/OLD[37] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE5__1229 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE4__1225 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/BAR0[21] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1426_1911 )
  );
  LUT5 #(
    .INIT ( 32'hFF808080 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT17148  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/N23 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE3__1227 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT17110_1909 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1726_1906 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/N25 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT17148_1910 )
  );
  LUT5 #(
    .INIT ( 32'h000E0004 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1755  (
    .I0(NlwRenamedSig_OI_addr[3]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(NlwRenamedSig_OI_addr[5]),
    .I3(NlwRenamedSig_OI_addr[2]),
    .I4(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1755_1908 )
  );
  LUT5 #(
    .INIT ( 32'hE0004000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1747  (
    .I0(NlwRenamedSig_OI_addr[2]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(NlwRenamedSig_OI_addr[5]),
    .I3(NlwRenamedSig_OI_addr[3]),
    .I4(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1747_1907 )
  );
  LUT6 #(
    .INIT ( 64'h00C0AA4A00C00040 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1726  (
    .I0(\BU2/U0/pci32_inst/OLD[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR1[24] ),
    .I2(\BU2/U0/pci32_inst/OLD[37] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE5__1229 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE4__1225 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/BAR0[24] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1726_1906 )
  );
  LUT5 #(
    .INIT ( 32'hFF808080 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT21481  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/N23 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE15__1221 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT21101_1904 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT226_1901 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/N25 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT21481_1905 )
  );
  LUT5 #(
    .INIT ( 32'h000E0004 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT255  (
    .I0(NlwRenamedSig_OI_addr[3]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(NlwRenamedSig_OI_addr[5]),
    .I3(NlwRenamedSig_OI_addr[2]),
    .I4(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT255_1903 )
  );
  LUT5 #(
    .INIT ( 32'hE0004000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT247  (
    .I0(NlwRenamedSig_OI_addr[2]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(NlwRenamedSig_OI_addr[5]),
    .I3(NlwRenamedSig_OI_addr[3]),
    .I4(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT247_1902 )
  );
  LUT6 #(
    .INIT ( 64'h00C0AA4A00C00040 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT226  (
    .I0(\BU2/U0/pci32_inst/OLD[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR1[10] ),
    .I2(\BU2/U0/pci32_inst/OLD[37] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE5__1229 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE4__1225 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/BAR0[10] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT226_1901 )
  );
  LUT5 #(
    .INIT ( 32'hFF808080 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT20148  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/N23 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE3__1227 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT20110_1899 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2026_1896 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/N25 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT20148_1900 )
  );
  LUT5 #(
    .INIT ( 32'h000E0004 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2055  (
    .I0(NlwRenamedSig_OI_addr[3]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(NlwRenamedSig_OI_addr[5]),
    .I3(NlwRenamedSig_OI_addr[2]),
    .I4(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2055_1898 )
  );
  LUT5 #(
    .INIT ( 32'hE0004000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2047  (
    .I0(NlwRenamedSig_OI_addr[2]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(NlwRenamedSig_OI_addr[5]),
    .I3(NlwRenamedSig_OI_addr[3]),
    .I4(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2047_1897 )
  );
  LUT6 #(
    .INIT ( 64'h00C0AA4A00C00040 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2026  (
    .I0(\BU2/U0/pci32_inst/OLD[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR1[27] ),
    .I2(\BU2/U0/pci32_inst/OLD[37] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE5__1229 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE4__1225 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/BAR0[27] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2026_1896 )
  );
  LUT5 #(
    .INIT ( 32'hFF808080 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT21148  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/N23 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE3__1227 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT21110_1894 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2126_1891 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/N25 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT21148_1895 )
  );
  LUT5 #(
    .INIT ( 32'h000E0004 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2155  (
    .I0(NlwRenamedSig_OI_addr[3]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(NlwRenamedSig_OI_addr[5]),
    .I3(NlwRenamedSig_OI_addr[2]),
    .I4(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2155_1893 )
  );
  LUT5 #(
    .INIT ( 32'hE0004000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2147  (
    .I0(NlwRenamedSig_OI_addr[2]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(NlwRenamedSig_OI_addr[5]),
    .I3(NlwRenamedSig_OI_addr[3]),
    .I4(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2147_1892 )
  );
  LUT6 #(
    .INIT ( 64'h00C0AA4A00C00040 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2126  (
    .I0(\BU2/U0/pci32_inst/OLD[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR1[28] ),
    .I2(\BU2/U0/pci32_inst/OLD[37] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE5__1229 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE4__1225 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/BAR0[28] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2126_1891 )
  );
  LUT5 #(
    .INIT ( 32'hFF808080 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT22148  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/N23 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE3__1227 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT22110_1889 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2226_1886 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/N25 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT22148_1890 )
  );
  LUT5 #(
    .INIT ( 32'h000E0004 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2255  (
    .I0(NlwRenamedSig_OI_addr[3]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(NlwRenamedSig_OI_addr[5]),
    .I3(NlwRenamedSig_OI_addr[2]),
    .I4(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2255_1888 )
  );
  LUT5 #(
    .INIT ( 32'hE0004000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2247  (
    .I0(NlwRenamedSig_OI_addr[2]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(NlwRenamedSig_OI_addr[5]),
    .I3(NlwRenamedSig_OI_addr[3]),
    .I4(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2247_1887 )
  );
  LUT6 #(
    .INIT ( 64'h00C0AA4A00C00040 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2226  (
    .I0(\BU2/U0/pci32_inst/OLD[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR1[29] ),
    .I2(\BU2/U0/pci32_inst/OLD[37] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE5__1229 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE4__1225 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/BAR0[29] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2226_1886 )
  );
  LUT5 #(
    .INIT ( 32'hFF808080 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT24148  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/N23 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE3__1227 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT24110_1884 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2426_1881 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/N25 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT24148_1885 )
  );
  LUT5 #(
    .INIT ( 32'h000E0004 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2455  (
    .I0(NlwRenamedSig_OI_addr[3]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(NlwRenamedSig_OI_addr[5]),
    .I3(NlwRenamedSig_OI_addr[2]),
    .I4(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2455_1883 )
  );
  LUT5 #(
    .INIT ( 32'hE0004000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2447  (
    .I0(NlwRenamedSig_OI_addr[2]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(NlwRenamedSig_OI_addr[5]),
    .I3(NlwRenamedSig_OI_addr[3]),
    .I4(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2447_1882 )
  );
  LUT6 #(
    .INIT ( 64'h00C0AA4A00C00040 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2426  (
    .I0(\BU2/U0/pci32_inst/OLD[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR1[30] ),
    .I2(\BU2/U0/pci32_inst/OLD[37] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE5__1229 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE4__1225 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/BAR0[30] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2426_1881 )
  );
  LUT5 #(
    .INIT ( 32'hFF808080 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT25148  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/N23 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE3__1227 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT25110_1878 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2526_1875 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/N25 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT25148_1880 )
  );
  LUT5 #(
    .INIT ( 32'h000E0004 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2555  (
    .I0(NlwRenamedSig_OI_addr[3]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(NlwRenamedSig_OI_addr[5]),
    .I3(NlwRenamedSig_OI_addr[2]),
    .I4(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2555_1877 )
  );
  LUT5 #(
    .INIT ( 32'hE0004000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2547  (
    .I0(NlwRenamedSig_OI_addr[2]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(NlwRenamedSig_OI_addr[5]),
    .I3(NlwRenamedSig_OI_addr[3]),
    .I4(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2547_1876 )
  );
  LUT6 #(
    .INIT ( 64'h00C0AA4A00C00040 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2526  (
    .I0(\BU2/U0/pci32_inst/OLD[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR1[31] ),
    .I2(\BU2/U0/pci32_inst/OLD[37] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE5__1229 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE4__1225 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/BAR0[31] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT2526_1875 )
  );
  LUT6 #(
    .INIT ( 64'hE055E00040554000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1881  (
    .I0(NlwRenamedSig_OI_addr[2]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(NlwRenamedSig_OI_addr[3]),
    .I3(NlwRenamedSig_OI_addr[5]),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1866_1873 ),
    .I5(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1881_1874 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1866  (
    .I0(NlwRenamedSig_OI_addr[3]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1866_1873 )
  );
  LUT6 #(
    .INIT ( 64'hE055E00040554000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1066  (
    .I0(NlwRenamedSig_OI_addr[2]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(NlwRenamedSig_OI_addr[3]),
    .I3(NlwRenamedSig_OI_addr[5]),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1051_1871 ),
    .I5(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1066_1872 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1051  (
    .I0(NlwRenamedSig_OI_addr[3]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1051_1871 )
  );
  LUT6 #(
    .INIT ( 64'h00C0AA4A00C00040 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1026  (
    .I0(\BU2/U0/pci32_inst/OLD[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR1[18] ),
    .I2(\BU2/U0/pci32_inst/OLD[37] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE5__1229 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE4__1225 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/BAR0[18] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1026_1870 )
  );
  LUT6 #(
    .INIT ( 64'hE055E00040554000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1566  (
    .I0(NlwRenamedSig_OI_addr[2]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(NlwRenamedSig_OI_addr[3]),
    .I3(NlwRenamedSig_OI_addr[5]),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1551_1868 ),
    .I5(\NlwRenamedSig_OI_cfg[116] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1566_1869 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1551  (
    .I0(NlwRenamedSig_OI_addr[3]),
    .I1(\NlwRenamedSig_OI_cfg[116] ),
    .I2(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1551_1868 )
  );
  LUT6 #(
    .INIT ( 64'h00C0AA4A00C00040 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1526  (
    .I0(\BU2/U0/pci32_inst/OLD[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR1[22] ),
    .I2(\BU2/U0/pci32_inst/OLD[37] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE5__1229 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE4__1225 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/BAR0[22] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1526_1867 )
  );
  LUT6 #(
    .INIT ( 64'hE055E00040554000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1666  (
    .I0(NlwRenamedSig_OI_addr[2]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(NlwRenamedSig_OI_addr[3]),
    .I3(NlwRenamedSig_OI_addr[5]),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1651_1865 ),
    .I5(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1666_1866 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1651  (
    .I0(NlwRenamedSig_OI_addr[3]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1651_1865 )
  );
  LUT6 #(
    .INIT ( 64'h00C0AA4A00C00040 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1626  (
    .I0(\BU2/U0/pci32_inst/OLD[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR1[23] ),
    .I2(\BU2/U0/pci32_inst/OLD[37] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE5__1229 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE4__1225 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/BAR0[23] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1626_1864 )
  );
  LUT6 #(
    .INIT ( 64'hE055E00040554000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1966  (
    .I0(NlwRenamedSig_OI_addr[2]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(NlwRenamedSig_OI_addr[3]),
    .I3(NlwRenamedSig_OI_addr[5]),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1951_1862 ),
    .I5(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1966_1863 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1951  (
    .I0(NlwRenamedSig_OI_addr[3]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1951_1862 )
  );
  LUT6 #(
    .INIT ( 64'h00C0AA4A00C00040 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1926  (
    .I0(\BU2/U0/pci32_inst/OLD[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR1[26] ),
    .I2(\BU2/U0/pci32_inst/OLD[37] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE5__1229 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE4__1225 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/BAR0[26] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT1926_1861 )
  );
  LUT6 #(
    .INIT ( 64'hE055E00040554000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT366  (
    .I0(NlwRenamedSig_OI_addr[2]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(NlwRenamedSig_OI_addr[3]),
    .I3(NlwRenamedSig_OI_addr[5]),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT351_1859 ),
    .I5(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT366_1860 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT351  (
    .I0(NlwRenamedSig_OI_addr[3]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT351_1859 )
  );
  LUT6 #(
    .INIT ( 64'h00C0AA4A00C00040 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT326  (
    .I0(\BU2/U0/pci32_inst/OLD[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR1[11] ),
    .I2(\BU2/U0/pci32_inst/OLD[37] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE5__1229 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE4__1225 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/BAR0[11] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT326_1858 )
  );
  LUT6 #(
    .INIT ( 64'hE055E00040554000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT3266  (
    .I0(NlwRenamedSig_OI_addr[2]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(NlwRenamedSig_OI_addr[3]),
    .I3(NlwRenamedSig_OI_addr[5]),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT3251_1856 ),
    .I5(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT3266_1857 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT3251  (
    .I0(NlwRenamedSig_OI_addr[3]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT3251_1856 )
  );
  LUT6 #(
    .INIT ( 64'h00C0AA4A00C00040 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT3226  (
    .I0(\BU2/U0/pci32_inst/OLD[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR1[9] ),
    .I2(\BU2/U0/pci32_inst/OLD[37] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE5__1229 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE4__1225 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/BAR0[9] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT3226_1855 )
  );
  LUT6 #(
    .INIT ( 64'hE055E00040554000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT466  (
    .I0(NlwRenamedSig_OI_addr[2]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(NlwRenamedSig_OI_addr[3]),
    .I3(NlwRenamedSig_OI_addr[5]),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT451_1853 ),
    .I5(\NlwRenamedSig_OI_cfg[116] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT466_1854 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT451  (
    .I0(NlwRenamedSig_OI_addr[3]),
    .I1(\NlwRenamedSig_OI_cfg[116] ),
    .I2(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT451_1853 )
  );
  LUT6 #(
    .INIT ( 64'h00C0AA4A00C00040 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT426  (
    .I0(\BU2/U0/pci32_inst/OLD[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR1[12] ),
    .I2(\BU2/U0/pci32_inst/OLD[37] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE5__1229 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE4__1225 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/BAR0[12] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT426_1852 )
  );
  LUT6 #(
    .INIT ( 64'hE055E00040554000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT566  (
    .I0(NlwRenamedSig_OI_addr[2]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(NlwRenamedSig_OI_addr[3]),
    .I3(NlwRenamedSig_OI_addr[5]),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT551_1850 ),
    .I5(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT566_1851 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT551  (
    .I0(NlwRenamedSig_OI_addr[3]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT551_1850 )
  );
  LUT6 #(
    .INIT ( 64'h00C0AA4A00C00040 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT526  (
    .I0(\BU2/U0/pci32_inst/OLD[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR1[13] ),
    .I2(\BU2/U0/pci32_inst/OLD[37] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE5__1229 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE4__1225 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/BAR0[13] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT526_1849 )
  );
  LUT6 #(
    .INIT ( 64'hE055E00040554000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT666  (
    .I0(NlwRenamedSig_OI_addr[2]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(NlwRenamedSig_OI_addr[3]),
    .I3(NlwRenamedSig_OI_addr[5]),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT651_1847 ),
    .I5(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT666_1848 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT651  (
    .I0(NlwRenamedSig_OI_addr[3]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT651_1847 )
  );
  LUT6 #(
    .INIT ( 64'h00C0AA4A00C00040 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT626  (
    .I0(\BU2/U0/pci32_inst/OLD[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR1[14] ),
    .I2(\BU2/U0/pci32_inst/OLD[37] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE5__1229 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE4__1225 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/BAR0[14] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT626_1846 )
  );
  LUT6 #(
    .INIT ( 64'hE055E00040554000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT766  (
    .I0(NlwRenamedSig_OI_addr[2]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(NlwRenamedSig_OI_addr[3]),
    .I3(NlwRenamedSig_OI_addr[5]),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT751_1844 ),
    .I5(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT766_1845 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT751  (
    .I0(NlwRenamedSig_OI_addr[3]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT751_1844 )
  );
  LUT6 #(
    .INIT ( 64'h00C0AA4A00C00040 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT726  (
    .I0(\BU2/U0/pci32_inst/OLD[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR1[15] ),
    .I2(\BU2/U0/pci32_inst/OLD[37] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE5__1229 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE4__1225 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/BAR0[15] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT726_1843 )
  );
  LUT6 #(
    .INIT ( 64'hE055E00040554000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT866  (
    .I0(NlwRenamedSig_OI_addr[2]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(NlwRenamedSig_OI_addr[3]),
    .I3(NlwRenamedSig_OI_addr[5]),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT851_1841 ),
    .I5(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT866_1842 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT851  (
    .I0(NlwRenamedSig_OI_addr[3]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT851_1841 )
  );
  LUT6 #(
    .INIT ( 64'h00C0AA4A00C00040 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT826  (
    .I0(\BU2/U0/pci32_inst/OLD[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR1[16] ),
    .I2(\BU2/U0/pci32_inst/OLD[37] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE5__1229 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE4__1225 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/BAR0[16] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT826_1840 )
  );
  LUT6 #(
    .INIT ( 64'hE055E00040554000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT966  (
    .I0(NlwRenamedSig_OI_addr[2]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(NlwRenamedSig_OI_addr[3]),
    .I3(NlwRenamedSig_OI_addr[5]),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT951_1838 ),
    .I5(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT966_1839 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT951  (
    .I0(NlwRenamedSig_OI_addr[3]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT951_1838 )
  );
  LUT6 #(
    .INIT ( 64'h00C0AA4A00C00040 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT926  (
    .I0(\BU2/U0/pci32_inst/OLD[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR1[17] ),
    .I2(\BU2/U0/pci32_inst/OLD[37] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE5__1229 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE4__1225 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/BAR0[17] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/MMUX_ADOUT926_1837 )
  );
  LUT4 #(
    .INIT ( 16'h4CCC ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_DSEL/MMUX_NS_DEVSEL_111  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/TSTOP__1213 ),
    .I1(NlwRenamedSig_OI_frameq_n),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/TRDYDEL_1206 ),
    .I3(NlwRenamedSig_OI_s_data),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_DSEL/MMUX_NS_DEVSEL_111_1836 )
  );
  LUT4 #(
    .INIT ( 16'h4CCC ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_DSEL/MMUX_NS_DEVSEL_15  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/TSTOP_I__1212 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/FRAME_I_LUT_DELAY_STAGE [2]),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/TTRDY_I__1205 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/TSTOP__1213 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_DSEL/MMUX_NS_DEVSEL_15_1835 )
  );
  LUT6 #(
    .INIT ( 64'h00000000009700FF ))
  \BU2/U0/pci32_inst/PCI_LC_I/ADIO_MUXOUT<10>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE_ROM__1219 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE15__1221 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE3__1227 ),
    .I3(\BU2/U0/pci32_inst/N82 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/N23 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/N1447 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/N7 )
  );
  LUT5 #(
    .INIT ( 32'hFFFF2AAA ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_AK64/MMUX_NS_ACK64_112  (
    .I0(\BU2/req64q_n ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/TSTOP__1213 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/TRDYDEL_1206 ),
    .I3(NlwRenamedSig_OI_s_data),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/S_ABORT_INT ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_AK64/MMUX_NS_ACK64_112_1832 )
  );
  LUT4 #(
    .INIT ( 16'h4CCC ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_AK64/MMUX_NS_ACK64_15  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/TSTOP_I__1212 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/REQ64_I_LUT_DELAY_STAGE [3]),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/TTRDY_I__1205 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/TSTOP__1213 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_AK64/MMUX_NS_ACK64_15_1831 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFFFE ))
  \BU2/U0/pci32_inst/CFG_REMAP/OUT170  (
    .I0(\BU2/U0/pci32_inst/CFG_REMAP/OUT10_1825 ),
    .I1(\BU2/U0/pci32_inst/CFG_REMAP/OUT15_1826 ),
    .I2(\BU2/U0/pci32_inst/CFG_REMAP/OUT117_1827 ),
    .I3(\BU2/U0/pci32_inst/CFG_REMAP/OUT122_1828 ),
    .I4(\BU2/U0/pci32_inst/CFG_REMAP/OUT138_1829 ),
    .I5(\BU2/U0/pci32_inst/CFG_REMAP/OUT143_1830 ),
    .O(\BU2/U0/pci32_inst/OLD[0] )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFFFE ))
  \BU2/U0/pci32_inst/CFG_REMAP/OUT143  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\NlwRenamedSig_OI_cfg[0] ),
    .I3(\NlwRenamedSig_OI_cfg[0] ),
    .I4(\NlwRenamedSig_OI_cfg[0] ),
    .I5(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/CFG_REMAP/OUT143_1830 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFFFE ))
  \BU2/U0/pci32_inst/CFG_REMAP/OUT138  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\NlwRenamedSig_OI_cfg[0] ),
    .I3(\NlwRenamedSig_OI_cfg[0] ),
    .I4(\NlwRenamedSig_OI_cfg[116] ),
    .I5(\NlwRenamedSig_OI_cfg[116] ),
    .O(\BU2/U0/pci32_inst/CFG_REMAP/OUT138_1829 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFFFE ))
  \BU2/U0/pci32_inst/CFG_REMAP/OUT122  (
    .I0(\NlwRenamedSig_OI_cfg[116] ),
    .I1(\NlwRenamedSig_OI_cfg[116] ),
    .I2(\NlwRenamedSig_OI_cfg[116] ),
    .I3(\NlwRenamedSig_OI_cfg[116] ),
    .I4(\NlwRenamedSig_OI_cfg[0] ),
    .I5(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/CFG_REMAP/OUT122_1828 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFFFE ))
  \BU2/U0/pci32_inst/CFG_REMAP/OUT117  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\NlwRenamedSig_OI_cfg[0] ),
    .I3(\NlwRenamedSig_OI_cfg[0] ),
    .I4(\NlwRenamedSig_OI_cfg[0] ),
    .I5(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/CFG_REMAP/OUT117_1827 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFFFE ))
  \BU2/U0/pci32_inst/CFG_REMAP/OUT15  (
    .I0(\NlwRenamedSig_OI_cfg[116] ),
    .I1(\NlwRenamedSig_OI_cfg[116] ),
    .I2(\NlwRenamedSig_OI_cfg[0] ),
    .I3(\NlwRenamedSig_OI_cfg[0] ),
    .I4(\NlwRenamedSig_OI_cfg[116] ),
    .I5(\NlwRenamedSig_OI_cfg[116] ),
    .O(\BU2/U0/pci32_inst/CFG_REMAP/OUT15_1826 )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \BU2/U0/pci32_inst/CFG_REMAP/OUT10  (
    .I0(\NlwRenamedSig_OI_cfg[116] ),
    .I1(\NlwRenamedSig_OI_cfg[116] ),
    .O(\BU2/U0/pci32_inst/CFG_REMAP/OUT10_1825 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFFFE ))
  \BU2/U0/pci32_inst/CFG_REMAP/OUT270  (
    .I0(\BU2/U0/pci32_inst/CFG_REMAP/OUT20_1819 ),
    .I1(\BU2/U0/pci32_inst/CFG_REMAP/OUT25_1820 ),
    .I2(\BU2/U0/pci32_inst/CFG_REMAP/OUT217_1821 ),
    .I3(\BU2/U0/pci32_inst/CFG_REMAP/OUT222_1822 ),
    .I4(\BU2/U0/pci32_inst/CFG_REMAP/OUT238_1823 ),
    .I5(\BU2/U0/pci32_inst/CFG_REMAP/OUT243_1824 ),
    .O(\BU2/U0/pci32_inst/OLD[37] )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFFFE ))
  \BU2/U0/pci32_inst/CFG_REMAP/OUT243  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\NlwRenamedSig_OI_cfg[0] ),
    .I3(\NlwRenamedSig_OI_cfg[0] ),
    .I4(\NlwRenamedSig_OI_cfg[0] ),
    .I5(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/CFG_REMAP/OUT243_1824 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFFFE ))
  \BU2/U0/pci32_inst/CFG_REMAP/OUT238  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\NlwRenamedSig_OI_cfg[0] ),
    .I3(\NlwRenamedSig_OI_cfg[0] ),
    .I4(\NlwRenamedSig_OI_cfg[116] ),
    .I5(\NlwRenamedSig_OI_cfg[116] ),
    .O(\BU2/U0/pci32_inst/CFG_REMAP/OUT238_1823 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFFFE ))
  \BU2/U0/pci32_inst/CFG_REMAP/OUT222  (
    .I0(\NlwRenamedSig_OI_cfg[116] ),
    .I1(\NlwRenamedSig_OI_cfg[116] ),
    .I2(\NlwRenamedSig_OI_cfg[116] ),
    .I3(\NlwRenamedSig_OI_cfg[116] ),
    .I4(\NlwRenamedSig_OI_cfg[0] ),
    .I5(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/CFG_REMAP/OUT222_1822 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFFFE ))
  \BU2/U0/pci32_inst/CFG_REMAP/OUT217  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\NlwRenamedSig_OI_cfg[0] ),
    .I3(\NlwRenamedSig_OI_cfg[0] ),
    .I4(\NlwRenamedSig_OI_cfg[0] ),
    .I5(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/CFG_REMAP/OUT217_1821 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFFFE ))
  \BU2/U0/pci32_inst/CFG_REMAP/OUT25  (
    .I0(\NlwRenamedSig_OI_cfg[116] ),
    .I1(\NlwRenamedSig_OI_cfg[116] ),
    .I2(\NlwRenamedSig_OI_cfg[0] ),
    .I3(\NlwRenamedSig_OI_cfg[0] ),
    .I4(\NlwRenamedSig_OI_cfg[116] ),
    .I5(\NlwRenamedSig_OI_cfg[116] ),
    .O(\BU2/U0/pci32_inst/CFG_REMAP/OUT25_1820 )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \BU2/U0/pci32_inst/CFG_REMAP/OUT20  (
    .I0(\NlwRenamedSig_OI_cfg[116] ),
    .I1(\NlwRenamedSig_OI_cfg[116] ),
    .O(\BU2/U0/pci32_inst/CFG_REMAP/OUT20_1819 )
  );
  LUT6 #(
    .INIT ( 64'h008020A000000000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR1/NS_NL_MEM31  (
    .I0(\BU2/U0/pci32_inst/OLD[37] ),
    .I1(NlwRenamedSig_OI_s_cbe[3]),
    .I2(NlwRenamedSig_OI_addr_vld),
    .I3(\BU2/U0/pci32_inst/N78 ),
    .I4(\BU2/U0/pci32_inst/N77 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/ADDRESS_MATCH ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/NS_BASE_HIT1 )
  );
  LUT6 #(
    .INIT ( 64'hEFFFEFEFFFFFFFFF ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR1/NS_NL_MEM31_SW1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/BUG_FIX_1625 ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(NlwRenamedSig_OI_s_cbe[2]),
    .I3(NlwRenamedSig_OI_s_cbe[1]),
    .I4(NlwRenamedSig_OI_s_cbe[0]),
    .I5(\NlwRenamedSig_OI_csr[1] ),
    .O(\BU2/U0/pci32_inst/N78 )
  );
  LUT6 #(
    .INIT ( 64'hEBEFFBFFFFFFFFFF ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR1/NS_NL_MEM31_SW0  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/BUG_FIX_1625 ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(NlwRenamedSig_OI_s_cbe[2]),
    .I3(\NlwRenamedSig_OI_csr[0] ),
    .I4(\NlwRenamedSig_OI_csr[1] ),
    .I5(NlwRenamedSig_OI_s_cbe[1]),
    .O(\BU2/U0/pci32_inst/N77 )
  );
  LUT5 #(
    .INIT ( 32'h8888A888 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CSR/IOACCESSALLOWED  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CSR/IOACCESSALLOWED_INT_1276 ),
    .I1(\BU2/U0/pci32_inst/N75 ),
    .I2(\NlwRenamedSig_OI_cfg[0] ),
    .I3(\BU2/U0/pci32_inst/OLD[74] ),
    .I4(\NlwRenamedSig_OI_cfg[0] ),
    .O(\NlwRenamedSig_OI_csr[0] )
  );
  LUT4 #(
    .INIT ( 16'hF888 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CSR/IOACCESSALLOWED_SW0  (
    .I0(\BU2/U0/pci32_inst/OLD[37] ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/OLD[0] ),
    .I3(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/N75 )
  );
  LUT5 #(
    .INIT ( 32'h0008CCCC ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CSR/MEMACCESSALLOWED  (
    .I0(\BU2/U0/pci32_inst/OLD[74] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CSR/MEMACCESSALLOWED_INT_1277 ),
    .I2(\NlwRenamedSig_OI_cfg[0] ),
    .I3(\NlwRenamedSig_OI_cfg[0] ),
    .I4(\BU2/U0/pci32_inst/N73 ),
    .O(\NlwRenamedSig_OI_csr[1] )
  );
  LUT4 #(
    .INIT ( 16'hAF23 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CSR/MEMACCESSALLOWED_SW0  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\BU2/U0/pci32_inst/OLD[0] ),
    .I2(\BU2/U0/pci32_inst/OLD[37] ),
    .I3(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/N73 )
  );
  LUT6 #(
    .INIT ( 64'h0000008000000000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/MD<0>4  (
    .I0(NlwRenamedSig_OI_addr[5]),
    .I1(NlwRenamedSig_OI_addr[4]),
    .I2(NlwRenamedSig_OI_addr[2]),
    .I3(NlwRenamedSig_OI_addr[3]),
    .I4(\BU2/U0/pci32_inst/N71 ),
    .I5(\NlwRenamedSig_OI_csr[20] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/N36 )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/MD<0>4_SW0  (
    .I0(NlwRenamedSig_OI_addr[6]),
    .I1(NlwRenamedSig_OI_addr[7]),
    .O(\BU2/U0/pci32_inst/N71 )
  );
  LUT6 #(
    .INIT ( 64'h008022A200000000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR2/NS_NL_MEM31  (
    .I0(\BU2/U0/pci32_inst/OLD[74] ),
    .I1(NlwRenamedSig_OI_s_cbe[2]),
    .I2(\NlwRenamedSig_OI_csr[1] ),
    .I3(\BU2/U0/pci32_inst/N69 ),
    .I4(\BU2/U0/pci32_inst/N68 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/ADDRESS_MATCH ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/NS_BASE_HIT2_INT )
  );
  LUT6 #(
    .INIT ( 64'hEFEFFFFFEFEFEFFF ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR2/NS_NL_MEM31_SW1  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/BUG_FIX_1625 ),
    .I2(NlwRenamedSig_OI_addr_vld),
    .I3(NlwRenamedSig_OI_s_cbe[3]),
    .I4(NlwRenamedSig_OI_s_cbe[1]),
    .I5(NlwRenamedSig_OI_s_cbe[0]),
    .O(\BU2/U0/pci32_inst/N69 )
  );
  LUT6 #(
    .INIT ( 64'hFDFFFFFFFFFFFFFF ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR2/NS_NL_MEM31_SW0  (
    .I0(\NlwRenamedSig_OI_csr[0] ),
    .I1(NlwRenamedSig_OI_s_cbe[3]),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/BUG_FIX_1625 ),
    .I3(NlwRenamedSig_OI_addr_vld),
    .I4(NlwRenamedSig_OI_s_cbe[1]),
    .I5(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/N68 )
  );
  LUT6 #(
    .INIT ( 64'h008022A200000000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR0/NS_NL_MEM31  (
    .I0(\BU2/U0/pci32_inst/OLD[0] ),
    .I1(NlwRenamedSig_OI_s_cbe[2]),
    .I2(\NlwRenamedSig_OI_csr[1] ),
    .I3(\BU2/U0/pci32_inst/N66 ),
    .I4(\BU2/U0/pci32_inst/N65 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/ADDRESS_MATCH ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/NS_BASE_HIT0 )
  );
  LUT6 #(
    .INIT ( 64'hEFEFFFFFEFEFEFFF ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR0/NS_NL_MEM31_SW1  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/BUG_FIX_1625 ),
    .I2(NlwRenamedSig_OI_addr_vld),
    .I3(NlwRenamedSig_OI_s_cbe[3]),
    .I4(NlwRenamedSig_OI_s_cbe[1]),
    .I5(NlwRenamedSig_OI_s_cbe[0]),
    .O(\BU2/U0/pci32_inst/N66 )
  );
  LUT6 #(
    .INIT ( 64'hFDFFFFFFFFFFFFFF ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR0/NS_NL_MEM31_SW0  (
    .I0(\NlwRenamedSig_OI_csr[0] ),
    .I1(NlwRenamedSig_OI_s_cbe[3]),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/BUG_FIX_1625 ),
    .I3(NlwRenamedSig_OI_addr_vld),
    .I4(NlwRenamedSig_OI_s_cbe[1]),
    .I5(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/N65 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFFFE ))
  \BU2/U0/pci32_inst/CFG_REMAP/OUT370  (
    .I0(\BU2/U0/pci32_inst/CFG_REMAP/OUT30_1803 ),
    .I1(\BU2/U0/pci32_inst/CFG_REMAP/OUT35_1804 ),
    .I2(\BU2/U0/pci32_inst/CFG_REMAP/OUT317_1805 ),
    .I3(\BU2/U0/pci32_inst/CFG_REMAP/OUT322_1806 ),
    .I4(\BU2/U0/pci32_inst/CFG_REMAP/OUT338_1807 ),
    .I5(\BU2/U0/pci32_inst/CFG_REMAP/OUT343_1808 ),
    .O(\BU2/U0/pci32_inst/OLD[74] )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFFFE ))
  \BU2/U0/pci32_inst/CFG_REMAP/OUT343  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\NlwRenamedSig_OI_cfg[0] ),
    .I3(\NlwRenamedSig_OI_cfg[0] ),
    .I4(\NlwRenamedSig_OI_cfg[0] ),
    .I5(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/CFG_REMAP/OUT343_1808 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFFFE ))
  \BU2/U0/pci32_inst/CFG_REMAP/OUT338  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\NlwRenamedSig_OI_cfg[0] ),
    .I3(\NlwRenamedSig_OI_cfg[0] ),
    .I4(\NlwRenamedSig_OI_cfg[0] ),
    .I5(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/CFG_REMAP/OUT338_1807 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFFFE ))
  \BU2/U0/pci32_inst/CFG_REMAP/OUT322  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\NlwRenamedSig_OI_cfg[0] ),
    .I3(\NlwRenamedSig_OI_cfg[0] ),
    .I4(\NlwRenamedSig_OI_cfg[0] ),
    .I5(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/CFG_REMAP/OUT322_1806 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFFFE ))
  \BU2/U0/pci32_inst/CFG_REMAP/OUT317  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\NlwRenamedSig_OI_cfg[0] ),
    .I3(\NlwRenamedSig_OI_cfg[0] ),
    .I4(\NlwRenamedSig_OI_cfg[0] ),
    .I5(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/CFG_REMAP/OUT317_1805 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFFFE ))
  \BU2/U0/pci32_inst/CFG_REMAP/OUT35  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\NlwRenamedSig_OI_cfg[0] ),
    .I3(\NlwRenamedSig_OI_cfg[0] ),
    .I4(\NlwRenamedSig_OI_cfg[0] ),
    .I5(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/CFG_REMAP/OUT35_1804 )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \BU2/U0/pci32_inst/CFG_REMAP/OUT30  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/CFG_REMAP/OUT30_1803 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFFFE ))
  \BU2/U0/pci32_inst/CFG_REMAP/OUT  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\NlwRenamedSig_OI_cfg[0] ),
    .I3(\NlwRenamedSig_OI_cfg[0] ),
    .I4(\NlwRenamedSig_OI_cfg[0] ),
    .I5(\BU2/U0/pci32_inst/N63 ),
    .O(\NlwRenamedSig_OI_csr[20] )
  );
  LUT3 #(
    .INIT ( 8'hFE ))
  \BU2/U0/pci32_inst/CFG_REMAP/OUT_SW0  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/N63 )
  );
  LUT6 #(
    .INIT ( 64'h0000000000000013 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/OE_ACK64_IN_  (
    .I0(NlwRenamedSig_OI_b_busy),
    .I1(\BU2/U0/pci32_inst/N61 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/ACKHIT ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/NS_BH64_2 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/NS_BH64_0 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/NS_BH64_1 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/OE_ACK64_IN__1183 )
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/N010346  (
    .I0(NlwRenamedSig_OI_addr[4]),
    .I1(NlwRenamedSig_OI_addr[5]),
    .I2(NlwRenamedSig_OI_addr[2]),
    .I3(NlwRenamedSig_OI_addr[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/N010346_1798 )
  );
  LUT6 #(
    .INIT ( 64'h6E2E6A2A66266222 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/N010327  (
    .I0(NlwRenamedSig_OI_addr[2]),
    .I1(NlwRenamedSig_OI_addr[4]),
    .I2(NlwRenamedSig_OI_addr[3]),
    .I3(\BU2/U0/pci32_inst/OLD[74] ),
    .I4(\BU2/U0/pci32_inst/OLD[0] ),
    .I5(\BU2/U0/pci32_inst/OLD[37] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/N010327_1797 )
  );
  LUT6 #(
    .INIT ( 64'h0080000000000000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR1/NS_BH64_O  (
    .I0(\BU2/U0/pci32_inst/OLD[37] ),
    .I1(NlwRenamedSig_OI_s_cbe[2]),
    .I2(\NlwRenamedSig_OI_csr[1] ),
    .I3(\BU2/U0/pci32_inst/N59 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/ADDR_VLD64 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/ADDRESS_MATCH ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/NS_BH64_1 )
  );
  LUT6 #(
    .INIT ( 64'hEFEFFFFFEFEFEFFF ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR1/NS_BH64_O_SW0  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/BUG_FIX_1625 ),
    .I2(\NlwRenamedSig_OI_cfg[0] ),
    .I3(NlwRenamedSig_OI_s_cbe[3]),
    .I4(NlwRenamedSig_OI_s_cbe[1]),
    .I5(NlwRenamedSig_OI_s_cbe[0]),
    .O(\BU2/U0/pci32_inst/N59 )
  );
  LUT6 #(
    .INIT ( 64'h0080000000000000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR2/NS_BH64_O  (
    .I0(\BU2/U0/pci32_inst/OLD[74] ),
    .I1(NlwRenamedSig_OI_s_cbe[2]),
    .I2(\NlwRenamedSig_OI_csr[1] ),
    .I3(\BU2/U0/pci32_inst/N57 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/ADDR_VLD64 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/ADDRESS_MATCH ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/NS_BH64_2_INT )
  );
  LUT6 #(
    .INIT ( 64'hEFEFFFFFEFEFEFFF ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR2/NS_BH64_O_SW0  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/BUG_FIX_1625 ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\NlwRenamedSig_OI_cfg[0] ),
    .I3(NlwRenamedSig_OI_s_cbe[3]),
    .I4(NlwRenamedSig_OI_s_cbe[1]),
    .I5(NlwRenamedSig_OI_s_cbe[0]),
    .O(\BU2/U0/pci32_inst/N57 )
  );
  LUT6 #(
    .INIT ( 64'h0080000000000000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR0/NS_BH64_O  (
    .I0(\BU2/U0/pci32_inst/OLD[0] ),
    .I1(NlwRenamedSig_OI_s_cbe[2]),
    .I2(\NlwRenamedSig_OI_csr[1] ),
    .I3(\BU2/U0/pci32_inst/N55 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/ADDR_VLD64 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/ADDRESS_MATCH ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/NS_BH64_0 )
  );
  LUT6 #(
    .INIT ( 64'hEFEFFFFFEFEFEFFF ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR0/NS_BH64_O_SW0  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/BUG_FIX_1625 ),
    .I2(\NlwRenamedSig_OI_cfg[0] ),
    .I3(NlwRenamedSig_OI_s_cbe[3]),
    .I4(NlwRenamedSig_OI_s_cbe[1]),
    .I5(NlwRenamedSig_OI_s_cbe[0]),
    .O(\BU2/U0/pci32_inst/N55 )
  );
  LUT6 #(
    .INIT ( 64'hFFFF80AAFFFF80A0 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/MMUX_NS_STOP_189  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/TSTOP_I__1212 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/MMUX_NS_STOP_114_1790 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/MMUX_NS_STOP_124_1792 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/N0004 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/MMUX_NS_STOP_181_1791 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/MMUX_NS_STOP_15_1786 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/NS_STOP_ )
  );
  LUT4 #(
    .INIT ( 16'h222A ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/MMUX_NS_STOP_181  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/FRAME_I_LUT_DELAY_STAGE [2]),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/TSTOP_I__1212 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/TTRDY_I__1205 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/IRDY_I_LUT_DELAY_STAGE [2]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/MMUX_NS_STOP_181_1791 )
  );
  LUT4 #(
    .INIT ( 16'h5557 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/MMUX_NS_STOP_114  (
    .I0(s_ready),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/NL_MEMO_1787 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/NL_MEMO_1788 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/NL_MEMO_1789 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/MMUX_NS_STOP_114_1790 )
  );
  LUT5 #(
    .INIT ( 32'hFFFFBBFB ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/MMUX_NS_STOP_15  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_DSEL/TDEVSEL_I__1209 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/TSTOP__1213 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/IRDY_I_LUT_DELAY_STAGE [2]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/TTRDY_I__1205 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_DSEL/TDEVSEL__1210 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/MMUX_NS_STOP_15_1786 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFEAEAFAEA ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/SWAN0101  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/SWAN07_1781 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/SWAN038_1783 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/SWAN076_1785 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/SWAN046_1784 ),
    .I4(NlwRenamedSig_OI_base_hit[2]),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/SWAN015_1782 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/SWAN0 )
  );
  LUT5 #(
    .INIT ( 32'h3FFF3F1F ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/SWAN076  (
    .I0(NlwRenamedSig_OI_irdyq_n),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/TSTOP__1213 ),
    .I2(NlwRenamedSig_OI_s_data),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/TRDYDEL_1206 ),
    .I4(NlwRenamedSig_OI_frameq_n),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/SWAN076_1785 )
  );
  LUT5 #(
    .INIT ( 32'h01010301 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/SWAN046  (
    .I0(NlwRenamedSig_OI_cfg_hit),
    .I1(NlwRenamedSig_OI_base_hit[1]),
    .I2(NlwRenamedSig_OI_base_hit[0]),
    .I3(c_term),
    .I4(c_ready),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/SWAN046_1784 )
  );
  LUT5 #(
    .INIT ( 32'h777777F7 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/SWAN038  (
    .I0(NlwRenamedSig_OI_s_wrdn),
    .I1(NlwRenamedSig_OI_b_busy),
    .I2(s_term),
    .I3(s_ready),
    .I4(NlwRenamedSig_OI_cfg_hit),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/SWAN038_1783 )
  );
  LUT5 #(
    .INIT ( 32'hFF1B1B1B ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/SWAN015  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CFG_CYC_1243 ),
    .I1(s_ready),
    .I2(c_ready),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/TSTOP_I__1212 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_DSEL/TDEVSEL_I__1209 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/SWAN015_1782 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF40C0C0C0 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/SWAN07  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/TSTOP__1213 ),
    .I1(NlwRenamedSig_OI_frameq_n),
    .I2(NlwRenamedSig_OI_irdyq_n),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/TRDYDEL_1206 ),
    .I4(NlwRenamedSig_OI_s_data),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/S_ABORT_INT ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/SWAN07_1781 )
  );
  LUT5 #(
    .INIT ( 32'h00000008 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/N000442  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/TSTOP__1213 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/TTRDY_I__1205 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_DSEL/TDEVSEL_I__1209 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_DSEL/TDEVSEL__1210 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/I_DATA_FLAG_1215 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/N000442_1780 )
  );
  LUT5 #(
    .INIT ( 32'hAAAA028A ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/N000410  (
    .I0(NlwRenamedSig_OI_b_busy),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CFG_CYC_1243 ),
    .I2(s_ready),
    .I3(c_ready),
    .I4(NlwRenamedSig_OI_s_wrdn),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/N000410_1779 )
  );
  LUT6 #(
    .INIT ( 64'hFDB9ECA875316420 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/MMUX_S_FIRSTIN1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/SWAN0 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/IRDY_I_LUT_DELAY_STAGE [2]),
    .I2(\BU2/U0/pci32_inst/N52 ),
    .I3(\BU2/U0/pci32_inst/N51 ),
    .I4(\BU2/U0/pci32_inst/N50 ),
    .I5(\BU2/U0/pci32_inst/N53 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/S_FIRSTIN )
  );
  LUT5 #(
    .INIT ( 32'hEEEEEAEE ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/MMUX_S_FIRSTIN1_SW3  (
    .I0(NlwRenamedSig_OI_idle),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/S_FIRST_1208 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/TTRDY_I__1205 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/TSTOP_I__1212 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/FRAME_I_LUT_DELAY_STAGE [2]),
    .O(\BU2/U0/pci32_inst/N53 )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/MMUX_S_FIRSTIN1_SW2  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/S_FIRST_1208 ),
    .I1(NlwRenamedSig_OI_idle),
    .O(\BU2/U0/pci32_inst/N52 )
  );
  LUT4 #(
    .INIT ( 16'hFF20 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/MMUX_S_FIRSTIN1_SW1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/FRAME_I_LUT_DELAY_STAGE [2]),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/TTRDY_I__1205 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/S_FIRST_1208 ),
    .I3(NlwRenamedSig_OI_idle),
    .O(\BU2/U0/pci32_inst/N51 )
  );
  LUT5 #(
    .INIT ( 32'hFFFF2060 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/MMUX_S_FIRSTIN1_SW0  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/FRAME_I_LUT_DELAY_STAGE [2]),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/TTRDY_I__1205 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/S_FIRST_1208 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/TSTOP_I__1212 ),
    .I4(NlwRenamedSig_OI_idle),
    .O(\BU2/U0/pci32_inst/N50 )
  );
  LUT6 #(
    .INIT ( 64'hFFC3AA82AA82FFC3 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MMUX_NS_PERR_176  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MMUX_NS_PERR_17_1773 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/PER64 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PAR64_I_LUT_DELAY_STAGE [3]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MMUX_NS_PERR_149_1774 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/PER ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PAR_I_LUT_DELAY_STAGE [3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/NS_PERR_ )
  );
  LUT6 #(
    .INIT ( 64'h0303030302030303 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MMUX_NS_PERR_149  (
    .I0(NlwRenamedSig_OI_trdyq_n),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/TPWIN64_1182 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/ADDR_VLD64 ),
    .I3(NlwRenamedSig_OI_m_data),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IREAD64_1135 ),
    .I5(\BU2/m_fail64 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MMUX_NS_PERR_149_1774 )
  );
  LUT6 #(
    .INIT ( 64'h0303030303020303 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MMUX_NS_PERR_17  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/IIRDY__1162 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/TPWIN_1180 ),
    .I2(NlwRenamedSig_OI_addr_vld),
    .I3(NlwRenamedSig_OI_trdyq_n),
    .I4(NlwRenamedSig_OI_m_data),
    .I5(m_wrdn),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MMUX_NS_PERR_17_1773 )
  );
  LUT6 #(
    .INIT ( 64'h6996966996696996 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MXOR_PER64_XO<0>78  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MXOR_PER64_XO<0>4_1767 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MXOR_PER64_XO<0>9_1768 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MXOR_PER64_XO<0>25_1769 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MXOR_PER64_XO<0>30_1770 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MXOR_PER64_XO<0>57_1771 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MXOR_PER64_XO<0>62_1772 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/PER64 )
  );
  LUT6 #(
    .INIT ( 64'h6996966996696996 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MXOR_PER64_XO<0>62  (
    .I0(\BU2/U0/pci32_inst/S_CBE [4]),
    .I1(\BU2/U0/pci32_inst/S_CBE [5]),
    .I2(\BU2/U0/pci32_inst/ADIO_OUT [62]),
    .I3(\BU2/U0/pci32_inst/ADIO_OUT [63]),
    .I4(\BU2/U0/pci32_inst/S_CBE [6]),
    .I5(\BU2/U0/pci32_inst/S_CBE [7]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MXOR_PER64_XO<0>62_1772 )
  );
  LUT6 #(
    .INIT ( 64'h6996966996696996 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MXOR_PER64_XO<0>57  (
    .I0(\BU2/U0/pci32_inst/ADIO_OUT [58]),
    .I1(\BU2/U0/pci32_inst/ADIO_OUT [59]),
    .I2(\BU2/U0/pci32_inst/ADIO_OUT [56]),
    .I3(\BU2/U0/pci32_inst/ADIO_OUT [57]),
    .I4(\BU2/U0/pci32_inst/ADIO_OUT [60]),
    .I5(\BU2/U0/pci32_inst/ADIO_OUT [61]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MXOR_PER64_XO<0>57_1771 )
  );
  LUT6 #(
    .INIT ( 64'h6996966996696996 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MXOR_PER64_XO<0>30  (
    .I0(\BU2/U0/pci32_inst/ADIO_OUT [40]),
    .I1(\BU2/U0/pci32_inst/ADIO_OUT [41]),
    .I2(\BU2/U0/pci32_inst/ADIO_OUT [38]),
    .I3(\BU2/U0/pci32_inst/ADIO_OUT [39]),
    .I4(\BU2/U0/pci32_inst/ADIO_OUT [42]),
    .I5(\BU2/U0/pci32_inst/ADIO_OUT [43]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MXOR_PER64_XO<0>30_1770 )
  );
  LUT6 #(
    .INIT ( 64'h6996966996696996 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MXOR_PER64_XO<0>25  (
    .I0(\BU2/U0/pci32_inst/ADIO_OUT [34]),
    .I1(\BU2/U0/pci32_inst/ADIO_OUT [35]),
    .I2(\BU2/U0/pci32_inst/ADIO_OUT [32]),
    .I3(\BU2/U0/pci32_inst/ADIO_OUT [33]),
    .I4(\BU2/U0/pci32_inst/ADIO_OUT [36]),
    .I5(\BU2/U0/pci32_inst/ADIO_OUT [37]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MXOR_PER64_XO<0>25_1769 )
  );
  LUT6 #(
    .INIT ( 64'h6996966996696996 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MXOR_PER64_XO<0>9  (
    .I0(\BU2/U0/pci32_inst/ADIO_OUT [52]),
    .I1(\BU2/U0/pci32_inst/ADIO_OUT [53]),
    .I2(\BU2/U0/pci32_inst/ADIO_OUT [50]),
    .I3(\BU2/U0/pci32_inst/ADIO_OUT [51]),
    .I4(\BU2/U0/pci32_inst/ADIO_OUT [54]),
    .I5(\BU2/U0/pci32_inst/ADIO_OUT [55]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MXOR_PER64_XO<0>9_1768 )
  );
  LUT6 #(
    .INIT ( 64'h6996966996696996 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MXOR_PER64_XO<0>4  (
    .I0(\BU2/U0/pci32_inst/ADIO_OUT [46]),
    .I1(\BU2/U0/pci32_inst/ADIO_OUT [47]),
    .I2(\BU2/U0/pci32_inst/ADIO_OUT [44]),
    .I3(\BU2/U0/pci32_inst/ADIO_OUT [45]),
    .I4(\BU2/U0/pci32_inst/ADIO_OUT [48]),
    .I5(\BU2/U0/pci32_inst/ADIO_OUT [49]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MXOR_PER64_XO<0>4_1767 )
  );
  LUT6 #(
    .INIT ( 64'h6996966996696996 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MXOR_PER_XO<0>78  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MXOR_PER_XO<0>4_1761 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MXOR_PER_XO<0>9_1762 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MXOR_PER_XO<0>25_1763 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MXOR_PER_XO<0>30_1764 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MXOR_PER_XO<0>57_1765 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MXOR_PER_XO<0>62_1766 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/PER )
  );
  LUT6 #(
    .INIT ( 64'h6996966996696996 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MXOR_PER_XO<0>62  (
    .I0(NlwRenamedSig_OI_s_cbe[0]),
    .I1(NlwRenamedSig_OI_s_cbe[1]),
    .I2(NlwRenamedSig_OI_adio_out[8]),
    .I3(NlwRenamedSig_OI_adio_out[9]),
    .I4(NlwRenamedSig_OI_s_cbe[2]),
    .I5(NlwRenamedSig_OI_s_cbe[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MXOR_PER_XO<0>62_1766 )
  );
  LUT6 #(
    .INIT ( 64'h6996966996696996 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MXOR_PER_XO<0>57  (
    .I0(NlwRenamedSig_OI_adio_out[4]),
    .I1(NlwRenamedSig_OI_adio_out[5]),
    .I2(NlwRenamedSig_OI_adio_out[31]),
    .I3(NlwRenamedSig_OI_adio_out[3]),
    .I4(NlwRenamedSig_OI_adio_out[6]),
    .I5(NlwRenamedSig_OI_adio_out[7]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MXOR_PER_XO<0>57_1765 )
  );
  LUT6 #(
    .INIT ( 64'h6996966996696996 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MXOR_PER_XO<0>30  (
    .I0(NlwRenamedSig_OI_adio_out[17]),
    .I1(NlwRenamedSig_OI_adio_out[18]),
    .I2(NlwRenamedSig_OI_adio_out[15]),
    .I3(NlwRenamedSig_OI_adio_out[16]),
    .I4(NlwRenamedSig_OI_adio_out[19]),
    .I5(NlwRenamedSig_OI_adio_out[1]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MXOR_PER_XO<0>30_1764 )
  );
  LUT6 #(
    .INIT ( 64'h6996966996696996 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MXOR_PER_XO<0>25  (
    .I0(NlwRenamedSig_OI_adio_out[11]),
    .I1(NlwRenamedSig_OI_adio_out[12]),
    .I2(NlwRenamedSig_OI_adio_out[0]),
    .I3(NlwRenamedSig_OI_adio_out[10]),
    .I4(NlwRenamedSig_OI_adio_out[13]),
    .I5(NlwRenamedSig_OI_adio_out[14]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MXOR_PER_XO<0>25_1763 )
  );
  LUT6 #(
    .INIT ( 64'h6996966996696996 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MXOR_PER_XO<0>9  (
    .I0(NlwRenamedSig_OI_adio_out[28]),
    .I1(NlwRenamedSig_OI_adio_out[29]),
    .I2(NlwRenamedSig_OI_adio_out[26]),
    .I3(NlwRenamedSig_OI_adio_out[27]),
    .I4(NlwRenamedSig_OI_adio_out[2]),
    .I5(NlwRenamedSig_OI_adio_out[30]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MXOR_PER_XO<0>9_1762 )
  );
  LUT6 #(
    .INIT ( 64'h6996966996696996 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MXOR_PER_XO<0>4  (
    .I0(NlwRenamedSig_OI_adio_out[22]),
    .I1(NlwRenamedSig_OI_adio_out[23]),
    .I2(NlwRenamedSig_OI_adio_out[20]),
    .I3(NlwRenamedSig_OI_adio_out[21]),
    .I4(NlwRenamedSig_OI_adio_out[24]),
    .I5(NlwRenamedSig_OI_adio_out[25]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MXOR_PER_XO<0>4_1761 )
  );
  LUT6 #(
    .INIT ( 64'hA0A0AAAA80A0AAAA ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/REQ64/MMUX_NS_REQ64_140  (
    .I0(m_ready),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/IIRDY_I__1161 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/FRAME/MMUX_NS_FRAME_112_1758 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/TRDY_I_LUT_DELAY_STAGE [2]),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/STOP_I_LUT_DELAY_STAGE [2]),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/REQ64/IREQ64__1160 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/REQ64/MMUX_NS_REQ64_140_1760 )
  );
  LUT6 #(
    .INIT ( 64'hA0A0AAAA80A0AAAA ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/FRAME/MMUX_NS_FRAME_138  (
    .I0(m_ready),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/FRAME/IFRAME__1158 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/FRAME/MMUX_NS_FRAME_112_1758 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/TRDY_I_LUT_DELAY_STAGE [2]),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/STOP_I_LUT_DELAY_STAGE [2]),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/IIRDY_I__1161 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/FRAME/MMUX_NS_FRAME_138_1759 )
  );
  LUT4 #(
    .INIT ( 16'hFFD5 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/FRAME/MMUX_NS_FRAME_112  (
    .I0(NlwRenamedSig_OI_stopq_n),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/GNT_ ),
    .I2(NlwRenamedSig_OI_time_out),
    .I3(complete),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/FRAME/MMUX_NS_FRAME_112_1758 )
  );
  LUT6 #(
    .INIT ( 64'hF33F5115FFFFFFFF ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MMUX_PRE_APERR_N1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/ADDR_VLD64 ),
    .I1(NlwRenamedSig_OI_addr_vld),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PAR_I_LUT_DELAY_STAGE [3]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/PER ),
    .I4(\BU2/U0/pci32_inst/N48 ),
    .I5(\NlwRenamedSig_OI_csr[6] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/PRE_APERR_N )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/MMUX_PRE_APERR_N1_SW0  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PAR64_I_LUT_DELAY_STAGE [3]),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/PER64 ),
    .O(\BU2/U0/pci32_inst/N48 )
  );
  LUT6 #(
    .INIT ( 64'h0000000000080000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/NS_CFG_HIT  (
    .I0(NlwRenamedSig_OI_addr_vld),
    .I1(NlwRenamedSig_OI_s_cbe[3]),
    .I2(NlwRenamedSig_OI_s_cbe[2]),
    .I3(NlwRenamedSig_OI_adio_out[0]),
    .I4(NlwRenamedSig_OI_s_cbe[1]),
    .I5(\BU2/U0/pci32_inst/N44 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/NS_CFG_HIT )
  );
  LUT2 #(
    .INIT ( 4'hD ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/NS_CFG_HIT_SW0  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/IDSEL ),
    .I1(NlwRenamedSig_OI_adio_out[1]),
    .O(\BU2/U0/pci32_inst/N44 )
  );
  LUT5 #(
    .INIT ( 32'hFFFF8AAA ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/MMUX_OE_FRAME_NS_OEF1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/FRAME/IFRAME_I__1111 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/DEV_TO ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/TRDY_I_LUT_DELAY_STAGE [2]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/STOP_I_LUT_DELAY_STAGE [2]),
    .I4(\BU2/U0/pci32_inst/N37 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/OE_FRAME_NS_OEF )
  );
  LUT5 #(
    .INIT ( 32'hA8AF888F ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/MMUX_OE_FRAME_NS_OEF1_SW0  (
    .I0(gnti),
    .I1(NlwRenamedSig_OI_dr_bus),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/START_AD ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/SLOT_1154 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/OE_FRAME_INT_1149 ),
    .O(\BU2/U0/pci32_inst/N37 )
  );
  LUT5 #(
    .INIT ( 32'hFFFF8AAA ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/MMUX_OE_FRAME_NS_OER1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/REQ64/IREQ64_I__1159 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/DEV_TO ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/TRDY_I_LUT_DELAY_STAGE [2]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/STOP_I_LUT_DELAY_STAGE [2]),
    .I4(\BU2/U0/pci32_inst/N35 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/OE_FRAME_NS_OER )
  );
  LUT5 #(
    .INIT ( 32'hA8AF888F ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/MMUX_OE_FRAME_NS_OER1_SW0  (
    .I0(gnti),
    .I1(NlwRenamedSig_OI_dr_bus),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/START_AD64 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/SLOT64_INT_1152 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/OE_REQ64_INT_1150 ),
    .O(\BU2/U0/pci32_inst/N35 )
  );
  LUT5 #(
    .INIT ( 32'hFFFF40C0 ))
  \BU2/U0/pci32_inst/PCI_LC_I/EOT/MMUX_OEOT_D1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/TRDY_I_LUT_DELAY_STAGE [2]),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/FRAME/IFRAME_I__1111 ),
    .I2(NlwRenamedSig_OI_m_data),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/STOP_I_LUT_DELAY_STAGE [2]),
    .I4(\BU2/U0/pci32_inst/N33 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/EOT/OEOT_D )
  );
  LUT6 #(
    .INIT ( 64'h40C040C0FFFF40C0 ))
  \BU2/U0/pci32_inst/PCI_LC_I/EOT/MMUX_OEOT_D1_SW0  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/TTRDY_I__1205 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/FRAME_I_LUT_DELAY_STAGE [2]),
    .I2(NlwRenamedSig_OI_s_data),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/TSTOP_I__1212 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/EOT/EOT_733 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/EOT/EOT_DL_734 ),
    .O(\BU2/U0/pci32_inst/N33 )
  );
  LUT6 #(
    .INIT ( 64'h0C0C00040F0F0F0F ))
  \BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/MMUX_NS_NEWDATA_OUT_CE1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/TTRDY_I__1205 ),
    .I1(NlwRenamedSig_OI_s_data),
    .I2(\BU2/m_fail64 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/IRDY_I_LUT_DELAY_STAGE [2]),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/S_FIRST_1208 ),
    .I5(\BU2/U0/pci32_inst/N31 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/NS_NEWDATA_OUT_CE )
  );
  LUT5 #(
    .INIT ( 32'h03023333 ))
  \BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/MMUX_NS_NEWDATA_OUT_CE1_SW0  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/IIRDY_I__1161 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/ADDR/ADDR_BE_1128 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/M_FIRST_904 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/TRDY_I_LUT_DELAY_STAGE [2]),
    .I4(NlwRenamedSig_OI_m_data),
    .O(\BU2/U0/pci32_inst/N31 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFF8F8F8FA ))
  \BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/MMUX_NS_PAR_CE1  (
    .I0(NlwRenamedSig_OI_s_data),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/S_FIRST_1208 ),
    .I2(\BU2/U0/pci32_inst/N29 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/IRDY_I_LUT_DELAY_STAGE [2]),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/TTRDY_I__1205 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/ADDR/ADDR_BE_1128 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/NS_PAR_CE )
  );
  LUT5 #(
    .INIT ( 32'hFFFF888A ))
  \BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/MMUX_NS_PAR_CE1_SW0  (
    .I0(NlwRenamedSig_OI_m_data),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/M_FIRST_904 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/TRDY_I_LUT_DELAY_STAGE [2]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/IIRDY_I__1161 ),
    .I4(\BU2/m_fail64 ),
    .O(\BU2/U0/pci32_inst/N29 )
  );
  LUT3 #(
    .INIT ( 8'h5D ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/NS_OE_ADO_B_114  (
    .I0(NlwRenamedSig_OI_cfg_hit),
    .I1(c_term),
    .I2(c_ready),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/NS_OE_ADO_B_114_1747 )
  );
  LUT5 #(
    .INIT ( 32'h0101FF01 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/NS_OE_ADO_B_110  (
    .I0(NlwRenamedSig_OI_base_hit[2]),
    .I1(NlwRenamedSig_OI_base_hit[0]),
    .I2(NlwRenamedSig_OI_base_hit[1]),
    .I3(s_term),
    .I4(s_ready),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/NS_OE_ADO_B_110_1746 )
  );
  LUT6 #(
    .INIT ( 64'h6996966996696996 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR136  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR10_1739 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR21_1740 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR53_1741 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR64_1742 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR115_1743 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR118_1744 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR136_1745 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR118  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [10]),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [20]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR118_1744 )
  );
  LUT6 #(
    .INIT ( 64'h6996966996696996 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR115  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [31]),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [1]),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [21]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [11]),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [0]),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [30]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR115_1743 )
  );
  LUT6 #(
    .INIT ( 64'h6996966996696996 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR64  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [27]),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [7]),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [17]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [6]),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [26]),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [16]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR64_1742 )
  );
  LUT6 #(
    .INIT ( 64'h6996966996696996 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR53  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [29]),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [9]),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [19]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [8]),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [28]),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [18]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR53_1741 )
  );
  LUT6 #(
    .INIT ( 64'h6996966996696996 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR21  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [23]),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [3]),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [13]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [2]),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [22]),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [12]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR21_1740 )
  );
  LUT6 #(
    .INIT ( 64'h6996966996696996 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR10  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [25]),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [5]),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [15]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [4]),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [24]),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [14]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR10_1739 )
  );
  LUT6 #(
    .INIT ( 64'h6996966996696996 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR64136  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR6410_1732 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR6421_1733 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR6453_1734 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR6464_1735 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR64115_1736 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR64118_1737 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR64136_1738 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR64118  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [40]),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [50]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR64118_1737 )
  );
  LUT6 #(
    .INIT ( 64'h6996966996696996 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR64115  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [32]),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [42]),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [61]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [51]),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [41]),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [60]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR64115_1736 )
  );
  LUT6 #(
    .INIT ( 64'h6996966996696996 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR6464  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [47]),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [57]),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [37]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [56]),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [46]),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [36]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR6464_1735 )
  );
  LUT6 #(
    .INIT ( 64'h6996966996696996 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR6453  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [49]),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [59]),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [39]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [58]),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [48]),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [38]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR6453_1734 )
  );
  LUT6 #(
    .INIT ( 64'h6996966996696996 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR6421  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [53]),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [63]),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [43]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [33]),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [62]),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [52]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR6421_1733 )
  );
  LUT6 #(
    .INIT ( 64'h6996966996696996 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR6410  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [45]),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [55]),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [35]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [54]),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [44]),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [34]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_PAR6410_1732 )
  );
  LUT6 #(
    .INIT ( 64'h00080008FFFF0008 ))
  \BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/SEL_IN  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/IRDY_I_LUT_DELAY_STAGE [2]),
    .I1(NlwRenamedSig_OI_s_data),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/S_FIRST_1208 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_DSEL/TDEVSEL_I__1209 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/TRDY_I_LUT_DELAY_STAGE [2]),
    .I5(\BU2/U0/pci32_inst/N27 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/SEL_IN_814 )
  );
  LUT4 #(
    .INIT ( 16'hFFEF ))
  \BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/SEL_IN_SW0  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/FRAME/IFRAME_I__1111 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/ADDR/ADDR_BE_1128 ),
    .I2(NlwRenamedSig_OI_m_data),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/M_FIRST_904 ),
    .O(\BU2/U0/pci32_inst/N27 )
  );
  LUT5 #(
    .INIT ( 32'hAAAA8AAA ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/I_IDLE/NS_I_IDLE5  (
    .I0(NlwRenamedSig_OI_i_idle),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/GNT_ ),
    .I2(NlwRenamedSig_OI_irdyq_n),
    .I3(NlwRenamedSig_OI_frameq_n),
    .I4(gnti),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/I_IDLE/NS_I_IDLE5_1730 )
  );
  LUT6 #(
    .INIT ( 64'h0203020202030203 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/N0030  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/REQUEST_1140 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/ADDR/ADDR_BE_1128 ),
    .I2(keepout),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/LOCKOUT ),
    .I4(\BU2/U0/ff_drive_zero_1_2576 ),
    .I5(\BU2/U0/pci32_inst/N25 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/N0030_1139 )
  );
  LUT3 #(
    .INIT ( 8'h31 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/N0030_SW0  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/ADDR_BE_Q_1143 ),
    .I1(request),
    .I2(NlwRenamedSig_OI_m_data),
    .O(\BU2/U0/pci32_inst/N25 )
  );
  LUT6 #(
    .INIT ( 64'h00FF00FF0008000C ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_TSM/PCI_BKOF/NS_BKOF34  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/TRDYDEL_1206 ),
    .I1(NlwRenamedSig_OI_s_data),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/TSTOP__1213 ),
    .I3(NlwRenamedSig_OI_frameq_n),
    .I4(NlwRenamedSig_OI_irdyq_n),
    .I5(NlwRenamedSig_OI_backoff),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_TSM/PCI_BKOF/NS_BKOF34_1728 )
  );
  LUT5 #(
    .INIT ( 32'h0C0C0C08 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_TSM/PCI_BKOF/NS_BKOF4  (
    .I0(NlwRenamedSig_OI_base_hit[0]),
    .I1(s_term),
    .I2(s_ready),
    .I3(NlwRenamedSig_OI_base_hit[1]),
    .I4(NlwRenamedSig_OI_base_hit[2]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_TSM/PCI_BKOF/NS_BKOF4_1727 )
  );
  LUT5 #(
    .INIT ( 32'hFF33FA32 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_TSM/PCI_DATA/NS_DATA22  (
    .I0(NlwRenamedSig_OI_base_hit[0]),
    .I1(s_term),
    .I2(NlwRenamedSig_OI_base_hit[1]),
    .I3(s_ready),
    .I4(NlwRenamedSig_OI_base_hit[2]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_TSM/PCI_DATA/NS_DATA22_1726 )
  );
  LUT6 #(
    .INIT ( 64'h5555010555554505 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/DR_BUS/MMUX_NS_DR_BUS1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/GNT_ ),
    .I1(NlwRenamedSig_OI_irdyq_n),
    .I2(\BU2/U0/pci32_inst/N22 ),
    .I3(NlwRenamedSig_OI_frameq_n),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/N121 ),
    .I5(\BU2/U0/pci32_inst/N23 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/DR_BUS/NS_DR_BUS )
  );
  LUT6 #(
    .INIT ( 64'h22223222EE22FFFF ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/DR_BUS/MMUX_NS_DR_BUS1_SW1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/ADDR/ADDR_BE_1128 ),
    .I1(gnti),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/M_ENABLE_INT ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/REQUEST_1140 ),
    .I4(NlwRenamedSig_OI_i_idle),
    .I5(NlwRenamedSig_OI_dr_bus),
    .O(\BU2/U0/pci32_inst/N23 )
  );
  LUT6 #(
    .INIT ( 64'hAAAAAAAA00000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/N0038  (
    .I0(NlwRenamedSig_OI_m_data),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/CNT_VAL [7]),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/CNT_VAL [6]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/CNT_VAL [5]),
    .I4(\BU2/U0/pci32_inst/N20 ),
    .I5(NlwRenamedSig_OI_time_out),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/N0038_1131 )
  );
  LUT4 #(
    .INIT ( 16'hFFFE ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/N0038_SW0  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/CNT_VAL [4]),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/CNT_VAL [3]),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/CNT_VAL [2]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/CNT_VAL [1]),
    .O(\BU2/U0/pci32_inst/N20 )
  );
  LUT6 #(
    .INIT ( 64'hFFFF555755575557 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/NS_OE_ADO_B64_1  (
    .I0(\BU2/U0/pci32_inst/N18 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BH64_2 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BH64_O_1410 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BH64_O_1355 ),
    .I4(NlwRenamedSig_OI_irdyq_n),
    .I5(NlwRenamedSig_OI_frameq_n),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/N11 )
  );
  LUT3 #(
    .INIT ( 8'hA2 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/NS_OE_ADO_B64_1_SW0  (
    .I0(NlwRenamedSig_OI_b_busy),
    .I1(s_term),
    .I2(s_ready),
    .O(\BU2/U0/pci32_inst/N18 )
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/E_CEO_SW0  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/E [3]),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/E [2]),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/E [0]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/E [1]),
    .O(\BU2/U0/pci32_inst/N16 )
  );
  LUT6 #(
    .INIT ( 64'hBAAAAAAAFAFAFAFA ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/M_DATA/NS_MDATA  (
    .I0(\BU2/U0/pci32_inst/N14 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/DEV_TO ),
    .I2(NlwRenamedSig_OI_m_data),
    .I3(NlwRenamedSig_OI_stopq_n),
    .I4(NlwRenamedSig_OI_trdyq_n),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/FRAME/IFRAME__1158 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/M_DATA/NS_MDATA_1125 )
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/M_DATA/NS_MDATA_SW0  (
    .I0(gnti),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/ADDR/ADDR_BE_1128 ),
    .O(\BU2/U0/pci32_inst/N14 )
  );
  LUT6 #(
    .INIT ( 64'h8000000000000000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/B_CEO  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/B [7]),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/B [6]),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/B [5]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/B [4]),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/A_OUT_1577 ),
    .I5(\BU2/U0/pci32_inst/N12 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/B_CEO_1613 )
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/B_CEO_SW0  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/B [3]),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/B [2]),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/B [0]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/B [1]),
    .O(\BU2/U0/pci32_inst/N12 )
  );
  LUT6 #(
    .INIT ( 64'h8000000000000000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/C_CEO  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/C [7]),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/C [6]),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/C [5]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/C [4]),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/B_OUT_1586 ),
    .I5(\BU2/U0/pci32_inst/N10 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/C_CEO_1615 )
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/C_CEO_SW0  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/C [3]),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/C [2]),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/C [0]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/C [1]),
    .O(\BU2/U0/pci32_inst/N10 )
  );
  LUT6 #(
    .INIT ( 64'h8000000000000000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/D_CEO  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/D [7]),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/D [6]),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/D [5]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/D [4]),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/C_OUT_1603 ),
    .I5(\BU2/U0/pci32_inst/N8 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/D_CEO_1612 )
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/D_CEO_SW0  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/D [3]),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/D [2]),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/D [0]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/D [1]),
    .O(\BU2/U0/pci32_inst/N8 )
  );
  LUT6 #(
    .INIT ( 64'h8080808080008080 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/NS_OE_PERR  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/HOLD_OE_PERR_1186 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/HOLD_OE_PERR_1157 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/SET_OE_PERR ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/IIRDY__1162 ),
    .I4(NlwRenamedSig_OI_m_data),
    .I5(\BU2/U0/pci32_inst/N6 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/NS_OE_PERR_1144 )
  );
  LUT3 #(
    .INIT ( 8'hFB ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/NS_OE_PERR_SW0  (
    .I0(NlwRenamedSig_OI_trdyq_n),
    .I1(\NlwRenamedSig_OI_csr[6] ),
    .I2(m_wrdn),
    .O(\BU2/U0/pci32_inst/N6 )
  );
  LUT6 #(
    .INIT ( 64'hAAAAAAAA88A8A8A8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_TSM/PCI_IDLE/NS_IDLE  (
    .I0(NlwRenamedSig_OI_frameq_n),
    .I1(\BU2/U0/pci32_inst/N4 ),
    .I2(NlwRenamedSig_OI_s_data),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/TRDYDEL_1206 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/TSTOP__1213 ),
    .I5(NlwRenamedSig_OI_backoff),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_TSM/PCI_IDLE/NS_IDLE_1175 )
  );
  LUT3 #(
    .INIT ( 8'hEA ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_TSM/PCI_IDLE/NS_IDLE_SW0  (
    .I0(NlwRenamedSig_OI_idle),
    .I1(NlwRenamedSig_OI_irdyq_n),
    .I2(NlwRenamedSig_OI_b_busy),
    .O(\BU2/U0/pci32_inst/N4 )
  );
  LUT6 #(
    .INIT ( 64'h8000000000000000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/A_CEO<7>  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/A [7]),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/A [6]),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/A [5]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/A [4]),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/A [3]),
    .I5(\BU2/U0/pci32_inst/N2 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/A_CEO )
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/A_CEO<7>_SW0  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/A [2]),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/A [0]),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/A [1]),
    .O(\BU2/U0/pci32_inst/N2 )
  );
  LUT5 #(
    .INIT ( 32'h20002202 ))
  \BU2/U0/pci32_inst/XPCI_WATCHDOG/RECONFIG1  (
    .I0(bm_detect_dis),
    .I1(rst),
    .I2(bm_manual_pci),
    .I3(\BU2/U0/pci32_inst/XPCI_WATCHDOG/PCIX0 ),
    .I4(\BU2/U0/pci32_inst/XPCI_WATCHDOG/PCIX1 ),
    .O(rtr)
  );
  LUT3 #(
    .INIT ( 8'h4E ))
  \BU2/U0/pci32_inst/XPCI_WATCHDOG/MMUX_PCI_WEN11  (
    .I0(bw_detect_dis),
    .I1(\BU2/U0/pci32_inst/XPCI_WATCHDOG/PCIW ),
    .I2(bw_manual_32b),
    .O(NlwRenamedSig_OI_pciw_en)
  );
  LUT3 #(
    .INIT ( 8'h4E ))
  \BU2/U0/pci32_inst/XPCI_WATCHDOG/MMUX_PCI_XEN11  (
    .I0(bm_detect_dis),
    .I1(\BU2/U0/pci32_inst/XPCI_WATCHDOG/PCIX0 ),
    .I2(bm_manual_pci),
    .O(pcix_en)
  );
  LUT5 #(
    .INIT ( 32'h00808080 ))
  \BU2/U0/pci32_inst/XPCI_WATCHDOG/PCIXOK1  (
    .I0(devseli),
    .I1(framei),
    .I2(irdyi),
    .I3(stopi),
    .I4(trdyi),
    .O(\BU2/U0/pci32_inst/XPCI_WATCHDOG/PCIXOK )
  );
  LUT3 #(
    .INIT ( 8'h01 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/MD<0>31  (
    .I0(NlwRenamedSig_OI_addr[6]),
    .I1(NlwRenamedSig_OI_addr[7]),
    .I2(NlwRenamedSig_OI_addr[4]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/N34 )
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/MD<0>231  (
    .I0(NlwRenamedSig_OI_addr[3]),
    .I1(NlwRenamedSig_OI_addr[5]),
    .I2(NlwRenamedSig_OI_addr[2]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/N37 )
  );
  LUT3 #(
    .INIT ( 8'h01 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/MD<0>241  (
    .I0(NlwRenamedSig_OI_addr[2]),
    .I1(NlwRenamedSig_OI_addr[5]),
    .I2(NlwRenamedSig_OI_addr[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_ROM/N38 )
  );
  LUT5 #(
    .INIT ( 32'hFDEC3120 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CBE/MMUX_CBEOUT41  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I1(\BU2/m_fail64 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CBE_3_900 ),
    .I3(m_cbe_9[3]),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_CBH [7]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CBEOUT [3])
  );
  LUT5 #(
    .INIT ( 32'hFDEC3120 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CBE/MMUX_CBEOUT31  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I1(\BU2/m_fail64 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CBE_2_901 ),
    .I3(m_cbe_9[2]),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_CBH [6]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CBEOUT [2])
  );
  LUT5 #(
    .INIT ( 32'hFDEC3120 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CBE/MMUX_CBEOUT21  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I1(\BU2/m_fail64 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CBE_1_902 ),
    .I3(m_cbe_9[1]),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_CBH [5]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CBEOUT [1])
  );
  LUT5 #(
    .INIT ( 32'hFDEC3120 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CBE/MMUX_CBEOUT11  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I1(\BU2/m_fail64 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CBE_0_903 ),
    .I3(m_cbe_9[0]),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_CBH [4]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CBEOUT [0])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/MMUX_ADOUT321  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_63_894 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [63])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/MMUX_ADOUT311  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_62_893 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [62])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/MMUX_ADOUT301  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_61_895 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [61])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/MMUX_ADOUT291  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_60_892 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [60])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/MMUX_ADOUT281  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_59_891 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [59])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/MMUX_ADOUT271  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_58_890 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [58])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/MMUX_ADOUT261  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_57_889 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [57])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/MMUX_ADOUT251  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_56_887 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [56])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/MMUX_ADOUT241  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_55_886 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [55])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/MMUX_ADOUT231  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_54_888 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [54])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/MMUX_ADOUT221  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_53_884 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [53])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/MMUX_ADOUT211  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_52_883 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [52])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/MMUX_ADOUT201  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_51_885 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [51])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/MMUX_ADOUT191  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_50_881 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [50])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/MMUX_ADOUT181  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_49_880 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [49])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/MMUX_ADOUT171  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_48_882 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [48])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/MMUX_ADOUT161  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_47_879 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [47])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/MMUX_ADOUT151  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_46_878 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [46])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/MMUX_ADOUT141  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_45_877 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [45])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/MMUX_ADOUT131  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_44_876 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [44])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/MMUX_ADOUT121  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_43_874 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [43])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/MMUX_ADOUT111  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_42_873 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [42])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/MMUX_ADOUT101  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_41_875 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [41])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/MMUX_ADOUT91  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_40_871 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [40])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/MMUX_ADOUT81  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_39_870 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [39])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/MMUX_ADOUT71  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_38_872 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [38])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/MMUX_ADOUT61  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_37_868 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [37])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/MMUX_ADOUT51  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_36_867 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [36])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/MMUX_ADOUT41  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_35_869 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [35])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/MMUX_ADOUT33  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_34_866 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [34])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/MMUX_ADOUT210  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_33_865 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [33])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/MMUX_ADOUT110  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_32_864 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [32])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR<31:4><27>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT_31_1413 ),
    .I1(\NlwRenamedSig_OI_cfg[116] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR0[31] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR<31:4><26>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT_30_1419 ),
    .I1(\NlwRenamedSig_OI_cfg[116] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR0[30] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR<31:4><25>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT_29_1422 ),
    .I1(\NlwRenamedSig_OI_cfg[116] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR0[29] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR<31:4><24>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT_28_1418 ),
    .I1(\NlwRenamedSig_OI_cfg[116] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR0[28] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR<31:4><23>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [27]),
    .I1(\NlwRenamedSig_OI_cfg[116] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR0[27] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR<31:4><22>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [26]),
    .I1(\NlwRenamedSig_OI_cfg[116] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR0[26] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR<31:4><20>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [24]),
    .I1(\NlwRenamedSig_OI_cfg[116] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR0[24] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR<31:4><19>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [23]),
    .I1(\NlwRenamedSig_OI_cfg[116] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR0[23] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR<31:4><18>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [22]),
    .I1(\NlwRenamedSig_OI_cfg[116] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR0[22] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR<31:4><17>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [21]),
    .I1(\NlwRenamedSig_OI_cfg[116] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR0[21] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR<31:4><16>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [20]),
    .I1(\NlwRenamedSig_OI_cfg[116] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR0[20] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR<31:4><15>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [19]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR0[19] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR<31:4><14>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [18]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR0[18] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR<31:4><13>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [17]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR0[17] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR<31:4><12>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [16]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR0[16] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR<31:4><11>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [15]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR0[15] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR<31:4><10>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [14]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR0[14] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR<31:4><9>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [13]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR0[13] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR<31:4><8>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [12]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR0[12] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR<31:4><7>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [11]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR0[11] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR<31:4><6>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [10]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR0[10] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR<31:4><5>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [9]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR0[9] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR<31:4><2>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [6]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR0[6] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR<31:4><27>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT_31_1358 ),
    .I1(\NlwRenamedSig_OI_cfg[116] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR1[31] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR<31:4><26>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT_30_1364 ),
    .I1(\NlwRenamedSig_OI_cfg[116] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR1[30] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR<31:4><25>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT_29_1367 ),
    .I1(\NlwRenamedSig_OI_cfg[116] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR1[29] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR<31:4><24>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT_28_1363 ),
    .I1(\NlwRenamedSig_OI_cfg[116] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR1[28] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR<31:4><23>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [27]),
    .I1(\NlwRenamedSig_OI_cfg[116] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR1[27] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR<31:4><22>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [26]),
    .I1(\NlwRenamedSig_OI_cfg[116] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR1[26] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR<31:4><20>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [24]),
    .I1(\NlwRenamedSig_OI_cfg[116] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR1[24] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR<31:4><19>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [23]),
    .I1(\NlwRenamedSig_OI_cfg[116] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR1[23] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR<31:4><18>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [22]),
    .I1(\NlwRenamedSig_OI_cfg[116] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR1[22] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR<31:4><17>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [21]),
    .I1(\NlwRenamedSig_OI_cfg[116] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR1[21] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR<31:4><16>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [20]),
    .I1(\NlwRenamedSig_OI_cfg[116] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR1[20] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR<31:4><15>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [19]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR1[19] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR<31:4><14>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [18]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR1[18] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR<31:4><13>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [17]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR1[17] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR<31:4><12>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [16]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR1[16] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR<31:4><11>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [15]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR1[15] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR<31:4><10>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [14]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR1[14] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR<31:4><9>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [13]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR1[13] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR<31:4><8>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [12]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR1[12] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR<31:4><7>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [11]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR1[11] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR<31:4><6>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [10]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR1[10] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR<31:4><5>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [9]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR1[9] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR<31:4><2>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [6]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR1[6] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR<31:4><22>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [26]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR2[26] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR<31:4><19>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [23]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR2[23] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR<31:4><18>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [22]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR2[22] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR<31:4><14>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [18]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR2[18] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR<31:4><13>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [17]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR2[17] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR<31:4><12>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [16]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR2[16] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR<31:4><11>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [15]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR2[15] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR<31:4><10>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [14]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR2[14] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR<31:4><9>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [13]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR2[13] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR<31:4><8>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [12]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR2[12] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR<31:4><7>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [11]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR2[11] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR<31:4><5>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [9]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR2[9] )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR<31:4><4>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [8]),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR2[8] )
  );
  LUT6 #(
    .INIT ( 64'h22F22222AAFAAAAA ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CSR/N0048<0>1  (
    .I0(\NlwRenamedSig_OI_csr[24] ),
    .I1(NlwRenamedSig_OI_adio_out[24]),
    .I2(\NlwRenamedSig_OI_csr[6] ),
    .I3(NlwRenamedSig_OI_perrq_n),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/M_DATA2Q_954 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/CE1_3 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CSR/PCI_CSR_OR[24] )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFEAEAEA ))
  \BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/FFA1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/ADDR/ADDR_BE_1128 ),
    .I1(NlwRenamedSig_OI_s_data),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/S_FIRST_1208 ),
    .I3(NlwRenamedSig_OI_m_data),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/M_FIRST_904 ),
    .I5(\BU2/m_fail64 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/FFA )
  );
  LUT2 #(
    .INIT ( 4'hD ))
  \BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/S_OK_N1  (
    .I0(NlwRenamedSig_OI_s_data),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/TTRDY_I__1205 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/S_OK_N )
  );
  LUT2 #(
    .INIT ( 4'hD ))
  \BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/M_OK_N1  (
    .I0(NlwRenamedSig_OI_m_data),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/IIRDY_I__1161 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/M_OK_N )
  );
  LUT3 #(
    .INIT ( 8'hAE ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/NS_CFG_CYC1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/NS_CFG_HIT ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CFG_CYC_1243 ),
    .I2(NlwRenamedSig_OI_idle),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/NS_CFG_CYC )
  );
  LUT4 #(
    .INIT ( 16'h0004 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD8<3>1  (
    .I0(NlwRenamedSig_OI_s_cbe[0]),
    .I1(NlwRenamedSig_OI_s_cbe[3]),
    .I2(NlwRenamedSig_OI_s_cbe[2]),
    .I3(NlwRenamedSig_OI_s_cbe[1]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD8 )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD0<3>1  (
    .I0(NlwRenamedSig_OI_s_cbe[3]),
    .I1(NlwRenamedSig_OI_s_cbe[0]),
    .I2(NlwRenamedSig_OI_s_cbe[2]),
    .I3(NlwRenamedSig_OI_s_cbe[1]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD0 )
  );
  LUT4 #(
    .INIT ( 16'h0008 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD12<3>1  (
    .I0(NlwRenamedSig_OI_s_cbe[2]),
    .I1(NlwRenamedSig_OI_s_cbe[3]),
    .I2(NlwRenamedSig_OI_s_cbe[0]),
    .I3(NlwRenamedSig_OI_s_cbe[1]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD12 )
  );
  LUT4 #(
    .INIT ( 16'h0004 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD4<3>1  (
    .I0(NlwRenamedSig_OI_s_cbe[3]),
    .I1(NlwRenamedSig_OI_s_cbe[2]),
    .I2(NlwRenamedSig_OI_s_cbe[0]),
    .I3(NlwRenamedSig_OI_s_cbe[1]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD4 )
  );
  LUT4 #(
    .INIT ( 16'h2000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD13<3>1  (
    .I0(NlwRenamedSig_OI_s_cbe[0]),
    .I1(NlwRenamedSig_OI_s_cbe[1]),
    .I2(NlwRenamedSig_OI_s_cbe[2]),
    .I3(NlwRenamedSig_OI_s_cbe[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD13 )
  );
  LUT4 #(
    .INIT ( 16'h0008 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD5<3>1  (
    .I0(NlwRenamedSig_OI_s_cbe[2]),
    .I1(NlwRenamedSig_OI_s_cbe[0]),
    .I2(NlwRenamedSig_OI_s_cbe[3]),
    .I3(NlwRenamedSig_OI_s_cbe[1]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD5 )
  );
  LUT4 #(
    .INIT ( 16'h2000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD14<3>1  (
    .I0(NlwRenamedSig_OI_s_cbe[3]),
    .I1(NlwRenamedSig_OI_s_cbe[0]),
    .I2(NlwRenamedSig_OI_s_cbe[2]),
    .I3(NlwRenamedSig_OI_s_cbe[1]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD14 )
  );
  LUT4 #(
    .INIT ( 16'h0008 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD6<3>1  (
    .I0(NlwRenamedSig_OI_s_cbe[2]),
    .I1(NlwRenamedSig_OI_s_cbe[1]),
    .I2(NlwRenamedSig_OI_s_cbe[3]),
    .I3(NlwRenamedSig_OI_s_cbe[0]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD6 )
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD15<3>1  (
    .I0(NlwRenamedSig_OI_s_cbe[3]),
    .I1(NlwRenamedSig_OI_s_cbe[0]),
    .I2(NlwRenamedSig_OI_s_cbe[2]),
    .I3(NlwRenamedSig_OI_s_cbe[1]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD15 )
  );
  LUT4 #(
    .INIT ( 16'h2000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD7<3>1  (
    .I0(NlwRenamedSig_OI_s_cbe[0]),
    .I1(NlwRenamedSig_OI_s_cbe[3]),
    .I2(NlwRenamedSig_OI_s_cbe[2]),
    .I3(NlwRenamedSig_OI_s_cbe[1]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD7 )
  );
  LUT4 #(
    .INIT ( 16'h0008 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD9<3>1  (
    .I0(NlwRenamedSig_OI_s_cbe[3]),
    .I1(NlwRenamedSig_OI_s_cbe[0]),
    .I2(NlwRenamedSig_OI_s_cbe[2]),
    .I3(NlwRenamedSig_OI_s_cbe[1]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD9 )
  );
  LUT4 #(
    .INIT ( 16'h0004 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD1<3>1  (
    .I0(NlwRenamedSig_OI_s_cbe[3]),
    .I1(NlwRenamedSig_OI_s_cbe[0]),
    .I2(NlwRenamedSig_OI_s_cbe[2]),
    .I3(NlwRenamedSig_OI_s_cbe[1]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD1 )
  );
  LUT4 #(
    .INIT ( 16'h0004 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD2<3>1  (
    .I0(NlwRenamedSig_OI_s_cbe[0]),
    .I1(NlwRenamedSig_OI_s_cbe[1]),
    .I2(NlwRenamedSig_OI_s_cbe[2]),
    .I3(NlwRenamedSig_OI_s_cbe[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD2 )
  );
  LUT4 #(
    .INIT ( 16'h0008 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD3<3>1  (
    .I0(NlwRenamedSig_OI_s_cbe[1]),
    .I1(NlwRenamedSig_OI_s_cbe[0]),
    .I2(NlwRenamedSig_OI_s_cbe[2]),
    .I3(NlwRenamedSig_OI_s_cbe[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD3 )
  );
  LUT4 #(
    .INIT ( 16'h0008 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD10<3>1  (
    .I0(NlwRenamedSig_OI_s_cbe[1]),
    .I1(NlwRenamedSig_OI_s_cbe[3]),
    .I2(NlwRenamedSig_OI_s_cbe[0]),
    .I3(NlwRenamedSig_OI_s_cbe[2]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD10 )
  );
  LUT4 #(
    .INIT ( 16'h2000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD11<3>1  (
    .I0(NlwRenamedSig_OI_s_cbe[0]),
    .I1(NlwRenamedSig_OI_s_cbe[2]),
    .I2(NlwRenamedSig_OI_s_cbe[1]),
    .I3(NlwRenamedSig_OI_s_cbe[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD11 )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/N01051  (
    .I0(NlwRenamedSig_OI_adio_out[7]),
    .I1(NlwRenamedSig_OI_adio_out[6]),
    .I2(NlwRenamedSig_OI_adio_out[1]),
    .I3(NlwRenamedSig_OI_adio_out[0]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/N0105 )
  );
  LUT5 #(
    .INIT ( 32'h00000080 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/ADX31  (
    .I0(NlwRenamedSig_OI_adio_out[2]),
    .I1(NlwRenamedSig_OI_adio_out[3]),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/N0105 ),
    .I3(NlwRenamedSig_OI_adio_out[5]),
    .I4(NlwRenamedSig_OI_adio_out[4]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/ADX3 )
  );
  LUT5 #(
    .INIT ( 32'h00000008 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/ADX11  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/N0105 ),
    .I1(NlwRenamedSig_OI_adio_out[2]),
    .I2(NlwRenamedSig_OI_adio_out[3]),
    .I3(NlwRenamedSig_OI_adio_out[5]),
    .I4(NlwRenamedSig_OI_adio_out[4]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/ADX1 )
  );
  LUT5 #(
    .INIT ( 32'h80000000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/ADX151  (
    .I0(NlwRenamedSig_OI_adio_out[2]),
    .I1(NlwRenamedSig_OI_adio_out[3]),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/N0105 ),
    .I3(NlwRenamedSig_OI_adio_out[5]),
    .I4(NlwRenamedSig_OI_adio_out[4]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/ADX15 )
  );
  LUT5 #(
    .INIT ( 32'h00000008 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/ADX41  (
    .I0(NlwRenamedSig_OI_adio_out[4]),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/N0105 ),
    .I2(NlwRenamedSig_OI_adio_out[2]),
    .I3(NlwRenamedSig_OI_adio_out[3]),
    .I4(NlwRenamedSig_OI_adio_out[5]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/ADX4 )
  );
  LUT5 #(
    .INIT ( 32'h00000080 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/ADX61  (
    .I0(NlwRenamedSig_OI_adio_out[3]),
    .I1(NlwRenamedSig_OI_adio_out[4]),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/N0105 ),
    .I3(NlwRenamedSig_OI_adio_out[2]),
    .I4(NlwRenamedSig_OI_adio_out[5]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/ADX6 )
  );
  LUT5 #(
    .INIT ( 32'h00000080 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/ADX51  (
    .I0(NlwRenamedSig_OI_adio_out[2]),
    .I1(NlwRenamedSig_OI_adio_out[4]),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/N0105 ),
    .I3(NlwRenamedSig_OI_adio_out[3]),
    .I4(NlwRenamedSig_OI_adio_out[5]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/ADX5 )
  );
  LUT4 #(
    .INIT ( 16'h1101 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/N00381  (
    .I0(NlwRenamedSig_OI_b_busy),
    .I1(NlwRenamedSig_OI_idle),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/TTRDY_I__1205 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/I_DATA_FLAG_1215 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/N0038 )
  );
  LUT5 #(
    .INIT ( 32'hCCFFCC4D ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/MMUX_NS_TRDY_11  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/TSTOP_I__1212 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/SWAN0 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/IRDY_I_LUT_DELAY_STAGE [2]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/TTRDY_I__1205 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/FRAME_I_LUT_DELAY_STAGE [2]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/NS_TRDY_ )
  );
  LUT2 #(
    .INIT ( 4'h7 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/N00291  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/TSTOP_I__1212 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/TTRDY_I__1205 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/N0029 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFEFFFFFFF ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/SET_OE_PERR1  (
    .I0(\NlwRenamedSig_OI_pci_cmd[1] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/TRDYDEL_1206 ),
    .I2(NlwRenamedSig_OI_s_data),
    .I3(NlwRenamedSig_OI_s_wrdn),
    .I4(\NlwRenamedSig_OI_csr[6] ),
    .I5(NlwRenamedSig_OI_irdyq_n),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/SET_OE_PERR )
  );
  LUT5 #(
    .INIT ( 32'hFFFFF888 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/NS_OE_ADO_B64_2  (
    .I0(NlwRenamedSig_OI_frameq_n),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/TRSTOPQ_1190 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/N11 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/OE_ADO_B64__1188 ),
    .I4(NlwRenamedSig_OI_s_wrdn),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/NS_OE_ADO_B64_ )
  );
  LUT5 #(
    .INIT ( 32'hFFFFF888 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/NS_OE_ADO_LT_1  (
    .I0(NlwRenamedSig_OI_frameq_n),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/TRSTOPQ_1190 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/N01 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/OE_ADO_LT__1204 ),
    .I4(NlwRenamedSig_OI_s_wrdn),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/NS_OE_ADO_LT_ )
  );
  LUT5 #(
    .INIT ( 32'hFFFFF888 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/NS_OE_ADO_LB_1  (
    .I0(NlwRenamedSig_OI_frameq_n),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/TRSTOPQ_1190 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/N01 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/OE_ADO_LB__1202 ),
    .I4(NlwRenamedSig_OI_s_wrdn),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/NS_OE_ADO_LB_ )
  );
  LUT5 #(
    .INIT ( 32'hFFFFF888 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/NS_OE_ADO_T_1  (
    .I0(NlwRenamedSig_OI_frameq_n),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/TRSTOPQ_1190 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/N01 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/OE_ADO_T__1200 ),
    .I4(NlwRenamedSig_OI_s_wrdn),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/NS_OE_ADO_T_ )
  );
  LUT5 #(
    .INIT ( 32'hFFFFF888 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/NS_OE_ADO_B_2  (
    .I0(NlwRenamedSig_OI_frameq_n),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/TRSTOPQ_1190 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/N01 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/OE_ADO_B__1198 ),
    .I4(NlwRenamedSig_OI_s_wrdn),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/NS_OE_ADO_B_ )
  );
  LUT5 #(
    .INIT ( 32'hFFFFF888 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/NS_OE_ADO_LT64_1  (
    .I0(NlwRenamedSig_OI_frameq_n),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/TRSTOPQ_1190 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/N11 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/OE_ADO_LT64__1196 ),
    .I4(NlwRenamedSig_OI_s_wrdn),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/NS_OE_ADO_LT64_ )
  );
  LUT5 #(
    .INIT ( 32'hFFFFF888 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/NS_OE_ADO_LB64_1  (
    .I0(NlwRenamedSig_OI_frameq_n),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/TRSTOPQ_1190 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/N11 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/OE_ADO_LB64__1194 ),
    .I4(NlwRenamedSig_OI_s_wrdn),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/NS_OE_ADO_LB64_ )
  );
  LUT5 #(
    .INIT ( 32'hFFFFF888 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/NS_OE_ADO_T64_1  (
    .I0(NlwRenamedSig_OI_frameq_n),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/TRSTOPQ_1190 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/N11 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/OE_ADO_T64__1192 ),
    .I4(NlwRenamedSig_OI_s_wrdn),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/NS_OE_ADO_T64_ )
  );
  LUT3 #(
    .INIT ( 8'hFB ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/S_ABORT_INT1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/HOLD_APERR_1178 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/APERR_N_1086 ),
    .I2(s_abort),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/S_ABORT_INT )
  );
  LUT2 #(
    .INIT ( 4'h1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/HOLDCYC_INV1  (
    .I0(NlwRenamedSig_OI_s_data),
    .I1(NlwRenamedSig_OI_backoff),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_AK64/MMUX_NS_ACK64_115 )
  );
  LUT4 #(
    .INIT ( 16'h2F2A ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_TSM/PCI_BKOF/NS_BKOF21  (
    .I0(NlwRenamedSig_OI_b_busy),
    .I1(NlwRenamedSig_OI_irdyq_n),
    .I2(NlwRenamedSig_OI_frameq_n),
    .I3(NlwRenamedSig_OI_idle),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/N2 )
  );
  LUT5 #(
    .INIT ( 32'h00010000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_TSM/PCI_BUSY/NS_BUSY1  (
    .I0(NlwRenamedSig_OI_base_hit[0]),
    .I1(NlwRenamedSig_OI_base_hit[1]),
    .I2(NlwRenamedSig_OI_base_hit[2]),
    .I3(NlwRenamedSig_OI_cfg_hit),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/N2 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_TSM/PCI_BUSY/NS_BUSY )
  );
  LUT3 #(
    .INIT ( 8'h31 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/N02381  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/APERR_N_1086 ),
    .I1(NlwRenamedSig_OI_idle),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/HOLD_APERR_1178 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/N0238 )
  );
  LUT4 #(
    .INIT ( 16'h0008 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/NS_PWIN6411  (
    .I0(NlwRenamedSig_OI_s_wrdn),
    .I1(NlwRenamedSig_OI_s_data),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/TTRDY_I__1205 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/IRDY_I_LUT_DELAY_STAGE [2]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/NS_PWIN )
  );
  LUT5 #(
    .INIT ( 32'h00000008 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_CE/CE0_311  (
    .I0(\NlwRenamedSig_OI_pci_cmd[11] ),
    .I1(NlwRenamedSig_OI_s_wrdn),
    .I2(NlwRenamedSig_OI_s_cbe[3]),
    .I3(NlwRenamedSig_OI_irdyq_n),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/TRDYDEL_1206 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/N8 )
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/DEV_TO/DEV_TO1  (
    .I0(NlwRenamedSig_OI_devselq_n),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/DEV_TO/PASS_TO_1172 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/DEV_TO/WAS_SUBTRACTIVE_1169 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/DEV_TO )
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/DEV_TO/DEV_TO_ADDR1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/FRAME/IFRAME_I__1111 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/FRAME/IFRAME__1158 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/DEV_TO/DEV_TO_ADDR )
  );
  LUT3 #(
    .INIT ( 8'hA8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/DEV_TO/N00061  (
    .I0(NlwRenamedSig_OI_m_data),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/DEV_TO/WAS_SLOW_1165 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/DEV_TO/WAS_SUBTRACTIVE_1169 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/DEV_TO/N0006 )
  );
  LUT4 #(
    .INIT ( 16'h88A8 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/DEV_TO/N00101  (
    .I0(NlwRenamedSig_OI_devselq_n),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/DEV_TO/PASS_TO_1172 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/FRAME/IFRAME__1158 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/FRAME/IFRAME_I__1111 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/DEV_TO/N0010 )
  );
  LUT4 #(
    .INIT ( 16'h8F88 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/M_FIRSTIN1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/M_FIRST_904 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/N2 ),
    .I2(NlwRenamedSig_OI_m_data),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/M_DATAQ_953 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/M_FIRSTIN )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF00000080 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/MMUX_NS_IRDY_11  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/ACK64_I_LUT_DELAY_STAGE [3]),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/ATTEMPT64_1142 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/STOP_I_LUT_DELAY_STAGE [2]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/IIRDY_I__1161 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/TRDY_I_LUT_DELAY_STAGE [2]),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/N2 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/NS_IRDY_ )
  );
  LUT5 #(
    .INIT ( 32'hFFF7FFFF ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/FRAME/FRAME_CE1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/STOP_I_LUT_DELAY_STAGE [2]),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/ACK64_I_LUT_DELAY_STAGE [3]),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/TRDY_I_LUT_DELAY_STAGE [2]),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/IIRDY_I__1161 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/ATTEMPT64_1142 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/FRAME_CE )
  );
  LUT3 #(
    .INIT ( 8'hD5 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/CE_OEF1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/OE_FRAME_INT_1149 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/REQUEST_1140 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/ADDR/ADDR_BE_1128 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/CE_OEF )
  );
  LUT4 #(
    .INIT ( 16'h2000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/START_AD1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/REQUESTQ_1155 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/GNT_ ),
    .I2(NlwRenamedSig_OI_irdyq_n),
    .I3(NlwRenamedSig_OI_frameq_n),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/START_AD )
  );
  LUT4 #(
    .INIT ( 16'h2000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/START_AD641  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/REQUEST64Q_1137 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/GNT_ ),
    .I2(NlwRenamedSig_OI_irdyq_n),
    .I3(NlwRenamedSig_OI_frameq_n),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/START_AD64 )
  );
  LUT5 #(
    .INIT ( 32'hFEFFFFFF ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/SET_OE_PERR1  (
    .I0(m_wrdn),
    .I1(NlwRenamedSig_OI_trdyq_n),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/IIRDY__1162 ),
    .I3(NlwRenamedSig_OI_m_data),
    .I4(\NlwRenamedSig_OI_csr[6] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/SET_OE_PERR )
  );
  LUT5 #(
    .INIT ( 32'h55550444 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/OE_ADO_T1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/START_AD ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/OE_ADO_T__1200 ),
    .I2(m_wrdn),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/SLOT_1154 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/EOT/EOT_733 ),
    .O(\NlwRenamedSignal_adt[24] )
  );
  LUT5 #(
    .INIT ( 32'h55550444 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/OE_ADO_LT1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/START_AD ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/OE_ADO_LT__1204 ),
    .I2(m_wrdn),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/SLOT_1154 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/EOT/EOT_733 ),
    .O(\NlwRenamedSignal_adt[16] )
  );
  LUT5 #(
    .INIT ( 32'h55550444 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/OE_ADO_LB1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/START_AD ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/OE_ADO_LB__1202 ),
    .I2(m_wrdn),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/SLOT_1154 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/EOT/EOT_733 ),
    .O(\NlwRenamedSignal_adt[10] )
  );
  LUT5 #(
    .INIT ( 32'h55550444 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/OE_ADO_B1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/START_AD ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/OE_ADO_B__1198 ),
    .I2(m_wrdn),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/SLOT_1154 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/EOT/EOT_733 ),
    .O(NlwRenamedSig_OI_adt[0])
  );
  LUT5 #(
    .INIT ( 32'h11110100 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/N00381  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/ADDR/ADDR_BE_1128 ),
    .I1(keepout),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/LOCKOUT ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/N5 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/REQUEST64_1136 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/N0038 )
  );
  LUT6 #(
    .INIT ( 64'h4444555504000500 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/N00461  (
    .I0(keepout),
    .I1(NlwRenamedSig_OI_m_data),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/LOCKOUT ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/N5 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/M_DATAQ_953 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/ATTEMPT64_1142 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/N0046 )
  );
  LUT4 #(
    .INIT ( 16'hFF20 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/XFER_REQ_S111  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/ADDR_BE_Q_1143 ),
    .I1(NlwRenamedSig_OI_m_data),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/REQUEST64Q_1137 ),
    .I3(\BU2/U0/ff_drive_zero_1_2576 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/N5 )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/M_ENABLE_INT1  (
    .I0(cfg_self),
    .I1(\NlwRenamedSig_OI_csr[2] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/M_ENABLE_INT )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFABABABBB ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/REQ/NS_REQ_1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/REQ/S_TARQ_1090 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/REQ/X_1092 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/M_ENABLE_INT ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/REQUEST_1140 ),
    .I4(requesthold),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/STAR/S_TAR_1089 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/NS_REQ_ )
  );
  LUT5 #(
    .INIT ( 32'h80888888 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/DR_BUS/MMUX_NS_DR_BUS1131  (
    .I0(NlwRenamedSig_OI_m_data),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/FRAME/IFRAME__1158 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/DEV_TO ),
    .I3(NlwRenamedSig_OI_trdyq_n),
    .I4(NlwRenamedSig_OI_stopq_n),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/N121 )
  );
  LUT6 #(
    .INIT ( 64'h0000008000000000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/ADDR/NS_ABE1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/REQUEST_1140 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/FRAME_I_LUT_DELAY_STAGE [2]),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/M_ENABLE_INT ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/ADDR/ADDR_BE_1128 ),
    .I4(gnti),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/IRDY_I_LUT_DELAY_STAGE [2]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/ADDR/NS_ABE )
  );
  LUT6 #(
    .INIT ( 64'h5544444405040404 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/REQ/N00081  (
    .I0(keepout),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/REQ/X_1092 ),
    .I2(NlwRenamedSig_OI_m_data),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/REQUEST_1140 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/M_ENABLE_INT ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/M_DATAQ_953 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/REQ/N0008 )
  );
  LUT5 #(
    .INIT ( 32'hBBBFFFFF ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_OE_SERR1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/LC_PERR__955 ),
    .I1(\NlwRenamedSig_OI_csr[6] ),
    .I2(\NlwRenamedSig_OI_pci_cmd[1] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADDR_VLDQ_956 ),
    .I4(\NlwRenamedSig_OI_csr[8] ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_OE_SERR )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \BU2/U0/pci32_inst/PCI_LC_I/OE_INTA_1  (
    .I0(\NlwRenamedSig_OI_csr[10] ),
    .I1(int_n),
    .O(intt)
  );
  LUT6 #(
    .INIT ( 64'h0000008000000000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/SRC_EN/M_SRC_EN1  (
    .I0(NlwRenamedSig_OI_m_data),
    .I1(m_ready),
    .I2(m_wrdn),
    .I3(\BU2/m_fail64 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/FRAME/IFRAME_I__1111 ),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/NEWDATA_1265 ),
    .O(m_src_en)
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  \BU2/U0/pci32_inst/PCI_LC_I/DATA_VLD/N00081  (
    .I0(NlwRenamedSig_OI_m_data),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/IIRDY_I__1161 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/TRDY_I_LUT_DELAY_STAGE [2]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/DATA_VLD/N0008 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CBEH/MMUX_CBEOUT41  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CBE_7_898 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CBEOUT [7])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CBEH/MMUX_CBEOUT31  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CBE_6_896 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CBEOUT [6])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CBEH/MMUX_CBEOUT21  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CBE_5_897 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CBEOUT [5])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CBEH/MMUX_CBEOUT11  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I1(\NlwRenamedSig_OI_cfg[0] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CBE_4_899 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CBEOUT [4])
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MMUX_BH64_211  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BH64_O_1299 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BH64_2 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MMUX_BASE_HIT211  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BASE_HITO_1301 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/INTACKQ_951 ),
    .O(NlwRenamedSig_OI_base_hit[2])
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MMUX_CSR<35>11  (
    .I0(NlwRenamedSig_OI_stopq_n),
    .I1(NlwRenamedSig_OI_frameq_n),
    .O(csr_10[35])
  );
  LUT2 #(
    .INIT ( 4'h1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MMUX_CSR<32>11  (
    .I0(NlwRenamedSig_OI_irdyq_n),
    .I1(NlwRenamedSig_OI_trdyq_n),
    .O(csr_10[32])
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MMUX_CSR<34>11  (
    .I0(NlwRenamedSig_OI_stopq_n),
    .I1(NlwRenamedSig_OI_frameq_n),
    .I2(NlwRenamedSig_OI_trdyq_n),
    .O(csr_10[34])
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MMUX_CSR<38>11  (
    .I0(NlwRenamedSig_OI_stopq_n),
    .I1(NlwRenamedSig_OI_devselq_n),
    .O(csr_10[38])
  );
  LUT3 #(
    .INIT ( 8'h2A ))
  \BU2/U0/pci32_inst/PCI_LC_I/MMUX_CSR<33>11  (
    .I0(NlwRenamedSig_OI_frameq_n),
    .I1(NlwRenamedSig_OI_stopq_n),
    .I2(NlwRenamedSig_OI_trdyq_n),
    .O(csr_10[33])
  );
  LUT4 #(
    .INIT ( 16'h5504 ))
  \BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/SHADOW_CE641  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 ),
    .I1(NlwRenamedSig_OI_s_data),
    .I2(NlwRenamedSig_OI_s_wrdn),
    .I3(NlwRenamedSig_OI_m_data),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE )
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MMUX_CSR<36>11  (
    .I0(NlwRenamedSig_OI_trdyq_n),
    .I1(NlwRenamedSig_OI_stopq_n),
    .I2(NlwRenamedSig_OI_devselq_n),
    .O(csr_10[36])
  );
  LUT3 #(
    .INIT ( 8'h01 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MMUX_CSR<37>11  (
    .I0(NlwRenamedSig_OI_trdyq_n),
    .I1(NlwRenamedSig_OI_stopq_n),
    .I2(NlwRenamedSig_OI_devselq_n),
    .O(csr_10[37])
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  \BU2/U0/pci32_inst/PCI_LC_I/DATA_VLD/N00141  (
    .I0(NlwRenamedSig_OI_s_data),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/TTRDY_I__1205 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/IRDY_I_LUT_DELAY_STAGE [2]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/DATA_VLD/N0014 )
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  \BU2/U0/pci32_inst/PCI_LC_I/N1443<6>31  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE3__1227 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE15__1221 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE_ROM__1219 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/N9 )
  );
  LUT4 #(
    .INIT ( 16'h8808 ))
  \BU2/U0/pci32_inst/PCI_LC_I/N1442<6>21  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/N01 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE1__1217 ),
    .I2(\BU2/U0/pci32_inst/OLD[74] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE6__1223 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/N23 )
  );
  LUT5 #(
    .INIT ( 32'h0A000200 ))
  \BU2/U0/pci32_inst/PCI_LC_I/N1447<6>1  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/N01 ),
    .I1(\BU2/U0/pci32_inst/OLD[74] ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE1__1217 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/N9 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE6__1223 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/N1447 )
  );
  LUT5 #(
    .INIT ( 32'h00800000 ))
  \BU2/U0/pci32_inst/PCI_LC_I/N1445<6>1  (
    .I0(\BU2/U0/pci32_inst/OLD[74] ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/N01 ),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE1__1217 ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE6__1223 ),
    .I4(\BU2/U0/pci32_inst/PCI_LC_I/N9 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/N1445 )
  );
  LUT4 #(
    .INIT ( 16'hAF23 ))
  \BU2/U0/pci32_inst/PCI_LC_I/N1442<6>11  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE4__1225 ),
    .I1(\BU2/U0/pci32_inst/OLD[37] ),
    .I2(\BU2/U0/pci32_inst/OLD[0] ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE5__1229 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/N01 )
  );
  LUT4 #(
    .INIT ( 16'h4404 ))
  \BU2/U0/pci32_inst/PCI_LC_I/ADDR_VLD/ADDR_VLD6421  (
    .I0(NlwRenamedSig_OI_frameq_n),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/ADDR_VLD/FRAMEQ__817 ),
    .I2(NlwRenamedSig_OI_m_data),
    .I3(cfg_self),
    .O(NlwRenamedSig_OI_addr_vld)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MMUX_NS_BASE_HIT2111  (
    .I0(NlwRenamedSig_OI_addr_vld),
    .I1(NlwRenamedSig_OI_s_cbe[1]),
    .I2(NlwRenamedSig_OI_s_cbe[0]),
    .I3(NlwRenamedSig_OI_s_cbe[2]),
    .I4(NlwRenamedSig_OI_s_cbe[3]),
    .I5(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/BUG_FIX_1625 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/INTACK )
  );
  LDC #(
    .INIT ( 1'b0 ))
  \BU2/U0/pci32_inst/XPCI_WATCHDOG/XPCI_PCIX0  (
    .CLR(NlwRenamedSig_OI_base_hit[3]),
    .D(\BU2/U0/pci32_inst/XPCI_WATCHDOG/PCIXOK ),
    .G(rst),
    .Q(\BU2/U0/pci32_inst/XPCI_WATCHDOG/PCIX0 )
  );
  LDP #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_WATCHDOG/XPCI_PCIX1  (
    .D(\BU2/U0/pci32_inst/XPCI_WATCHDOG/PCIXOK ),
    .G(rst),
    .PRE(NlwRenamedSig_OI_base_hit[3]),
    .Q(\BU2/U0/pci32_inst/XPCI_WATCHDOG/PCIX1 )
  );
  LDC #(
    .INIT ( 1'b0 ))
  \BU2/U0/pci32_inst/XPCI_WATCHDOG/XPCI_PCIW  (
    .CLR(NlwRenamedSig_OI_base_hit[3]),
    .D(\BU2/U0/pci32_inst/XPCI_WATCHDOG/PCI64B ),
    .G(rst),
    .Q(\BU2/U0/pci32_inst/XPCI_WATCHDOG/PCIW )
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CBE/XPCI_CBO3  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/CBEOUT [3]),
    .PRE(rst),
    .Q(cbo_5[3])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CBE/XPCI_CBO2  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/CBEOUT [2]),
    .PRE(rst),
    .Q(cbo_5[2])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CBE/XPCI_CBO1  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/CBEOUT [1]),
    .PRE(rst),
    .Q(cbo_5[1])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CBE/XPCI_CBO0  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/CBEOUT [0]),
    .PRE(rst),
    .Q(cbo_5[0])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/XPCI_ADO63  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [63]),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADO [63])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/XPCI_ADO62  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [62]),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADO [62])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/XPCI_ADO61  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [61]),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADO [61])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/XPCI_ADO60  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [60]),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADO [60])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/XPCI_ADO59  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [59]),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADO [59])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/XPCI_ADO58  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [58]),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADO [58])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/XPCI_ADO57  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [57]),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADO [57])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/XPCI_ADO56  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [56]),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADO [56])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/XPCI_ADO55  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [55]),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADO [55])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/XPCI_ADO54  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [54]),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADO [54])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/XPCI_ADO53  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [53]),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADO [53])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/XPCI_ADO52  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [52]),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADO [52])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/XPCI_ADO51  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [51]),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADO [51])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/XPCI_ADO50  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [50]),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADO [50])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/XPCI_ADO49  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [49]),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADO [49])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/XPCI_ADO48  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [48]),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADO [48])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/XPCI_ADO47  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [47]),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADO [47])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/XPCI_ADO46  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [46]),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADO [46])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/XPCI_ADO45  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [45]),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADO [45])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/XPCI_ADO44  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [44]),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADO [44])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/XPCI_ADO43  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [43]),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADO [43])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/XPCI_ADO42  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [42]),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADO [42])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/XPCI_ADO41  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [41]),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADO [41])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/XPCI_ADO40  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [40]),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADO [40])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/XPCI_ADO39  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [39]),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADO [39])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/XPCI_ADO38  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [38]),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADO [38])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/XPCI_ADO37  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [37]),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADO [37])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/XPCI_ADO36  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [36]),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADO [36])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/XPCI_ADO35  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [35]),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADO [35])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/XPCI_ADO34  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [34]),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADO [34])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/XPCI_ADO33  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [33]),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADO [33])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_ADH/XPCI_ADO32  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [32]),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADO [32])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/XPCI_ADO31  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [31]),
    .PRE(rst),
    .Q(ado_2[31])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/XPCI_ADO30  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [30]),
    .PRE(rst),
    .Q(ado_2[30])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/XPCI_ADO29  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [29]),
    .PRE(rst),
    .Q(ado_2[29])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/XPCI_ADO28  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [28]),
    .PRE(rst),
    .Q(ado_2[28])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/XPCI_ADO27  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [27]),
    .PRE(rst),
    .Q(ado_2[27])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/XPCI_ADO26  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [26]),
    .PRE(rst),
    .Q(ado_2[26])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/XPCI_ADO25  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [25]),
    .PRE(rst),
    .Q(ado_2[25])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/XPCI_ADO24  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [24]),
    .PRE(rst),
    .Q(ado_2[24])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/XPCI_ADO23  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [23]),
    .PRE(rst),
    .Q(ado_2[23])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/XPCI_ADO22  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [22]),
    .PRE(rst),
    .Q(ado_2[22])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/XPCI_ADO21  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [21]),
    .PRE(rst),
    .Q(ado_2[21])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/XPCI_ADO20  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [20]),
    .PRE(rst),
    .Q(ado_2[20])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/XPCI_ADO19  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [19]),
    .PRE(rst),
    .Q(ado_2[19])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/XPCI_ADO18  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [18]),
    .PRE(rst),
    .Q(ado_2[18])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/XPCI_ADO17  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [17]),
    .PRE(rst),
    .Q(ado_2[17])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/XPCI_ADO16  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [16]),
    .PRE(rst),
    .Q(ado_2[16])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/XPCI_ADO15  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [15]),
    .PRE(rst),
    .Q(ado_2[15])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/XPCI_ADO14  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [14]),
    .PRE(rst),
    .Q(ado_2[14])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/XPCI_ADO13  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [13]),
    .PRE(rst),
    .Q(ado_2[13])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/XPCI_ADO12  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [12]),
    .PRE(rst),
    .Q(ado_2[12])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/XPCI_ADO11  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [11]),
    .PRE(rst),
    .Q(ado_2[11])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/XPCI_ADO10  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [10]),
    .PRE(rst),
    .Q(ado_2[10])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/XPCI_ADO9  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [9]),
    .PRE(rst),
    .Q(ado_2[9])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/XPCI_ADO8  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [8]),
    .PRE(rst),
    .Q(ado_2[8])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/XPCI_ADO7  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [7]),
    .PRE(rst),
    .Q(ado_2[7])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/XPCI_ADO6  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [6]),
    .PRE(rst),
    .Q(ado_2[6])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/XPCI_ADO5  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [5]),
    .PRE(rst),
    .Q(ado_2[5])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/XPCI_ADO4  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [4]),
    .PRE(rst),
    .Q(ado_2[4])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/XPCI_ADO3  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [3]),
    .PRE(rst),
    .Q(ado_2[3])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/XPCI_ADO2  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [2]),
    .PRE(rst),
    .Q(ado_2[2])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/XPCI_ADO1  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [1]),
    .PRE(rst),
    .Q(ado_2[1])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_AD/XPCI_ADO0  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [0]),
    .PRE(rst),
    .Q(ado_2[0])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/C_OUT  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/C_CEO_1615 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/C_OUT_1603 )
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/A_OUT  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/A_CEO ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/A_OUT_1577 )
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/B_OUT  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/B_CEO_1613 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/B_OUT_1586 )
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/D_OUT  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/D_CEO_1612 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/D_OUT_1568 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/D_0  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/C_OUT_1603 ),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT [0]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/D [0])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/D_1  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/C_OUT_1603 ),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT [1]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/D [1])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/D_2  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/C_OUT_1603 ),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT [2]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/D [2])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/D_3  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/C_OUT_1603 ),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT [3]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/D [3])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/D_4  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/C_OUT_1603 ),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT [4]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/D [4])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/D_5  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/C_OUT_1603 ),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT [5]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/D [5])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/D_6  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/C_OUT_1603 ),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT [6]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/D [6])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/D_7  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/C_OUT_1603 ),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT [7]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/D [7])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/A_0  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<0>1 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/A [0])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/A_1  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<1>1 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/A [1])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/A_2  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<2>1 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/A [2])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/A_3  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<3>1 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/A [3])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/A_4  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<4>1 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/A [4])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/A_5  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<5>1 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/A [5])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/A_6  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<6>1 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/A [6])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/A_7  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<7>1 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/A [7])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/C_0  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/B_OUT_1586 ),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<0>3 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/C [0])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/C_1  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/B_OUT_1586 ),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<1>3 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/C [1])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/C_2  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/B_OUT_1586 ),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<2>3 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/C [2])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/C_3  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/B_OUT_1586 ),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<3>3 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/C [3])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/C_4  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/B_OUT_1586 ),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<4>3 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/C [4])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/C_5  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/B_OUT_1586 ),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<5>3 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/C [5])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/C_6  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/B_OUT_1586 ),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<6>3 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/C [6])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/C_7  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/B_OUT_1586 ),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<7>3 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/C [7])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/B_0  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/A_OUT_1577 ),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<0>2 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/B [0])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/B_1  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/A_OUT_1577 ),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<1>2 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/B [1])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/B_2  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/A_OUT_1577 ),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<2>2 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/B [2])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/B_3  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/A_OUT_1577 ),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<3>2 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/B [3])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/B_4  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/A_OUT_1577 ),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<4>2 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/B [4])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/B_5  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/A_OUT_1577 ),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<5>2 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/B [5])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/B_6  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/A_OUT_1577 ),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<6>2 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/B [6])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/B_7  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/A_OUT_1577 ),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<7>2 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/B [7])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/E_0  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/D_OUT_1568 ),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<0>4 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/E [0])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/E_1  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/D_OUT_1568 ),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<1>4 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/E [1])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/E_2  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/D_OUT_1568 ),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<2>4 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/E [2])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/E_3  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/D_OUT_1568 ),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<3>4 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/E [3])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/E_4  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/D_OUT_1568 ),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<4>4 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/E [4])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/E_5  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/D_OUT_1568 ),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<5>4 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/E [5])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/E_6  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/D_OUT_1568 ),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<6>4 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/E [6])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/E_7  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/D_OUT_1568 ),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<7>4 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/E [7])
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY<0>  (
    .CI(NlwRenamedSig_OI_base_hit[3]),
    .DI(\NlwRenamedSig_OI_csr[25] ),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_LUT [0]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY [0])
  );
  XORCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_XOR<0>  (
    .CI(NlwRenamedSig_OI_base_hit[3]),
    .LI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_LUT [0]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<0>2 )
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY<1>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY [0]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY<1>_RT_1564 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY [1])
  );
  XORCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_XOR<1>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY [0]),
    .LI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY<1>_RT_1564 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<1>2 )
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY<2>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY [1]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY<2>_RT_1561 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY [2])
  );
  XORCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_XOR<2>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY [1]),
    .LI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY<2>_RT_1561 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<2>2 )
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY<3>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY [2]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY<3>_RT_1558 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY [3])
  );
  XORCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_XOR<3>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY [2]),
    .LI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY<3>_RT_1558 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<3>2 )
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY<4>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY [3]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY<4>_RT_1555 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY [4])
  );
  XORCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_XOR<4>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY [3]),
    .LI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY<4>_RT_1555 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<4>2 )
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY<5>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY [4]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY<5>_RT_1552 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY [5])
  );
  XORCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_XOR<5>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY [4]),
    .LI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY<5>_RT_1552 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<5>2 )
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY<6>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY [5]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY<6>_RT_1549 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY [6])
  );
  XORCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_XOR<6>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY [5]),
    .LI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY<6>_RT_1549 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<6>2 )
  );
  XORCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_XOR<7>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_CY [6]),
    .LI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_B_XOR<7>_RT_1546 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<7>2 )
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY<0>  (
    .CI(NlwRenamedSig_OI_base_hit[3]),
    .DI(\NlwRenamedSig_OI_csr[25] ),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_LUT [0]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY [0])
  );
  XORCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_XOR<0>  (
    .CI(NlwRenamedSig_OI_base_hit[3]),
    .LI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_LUT [0]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT [0])
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY<1>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY [0]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY<1>_RT_1541 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY [1])
  );
  XORCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_XOR<1>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY [0]),
    .LI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY<1>_RT_1541 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT [1])
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY<2>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY [1]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY<2>_RT_1538 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY [2])
  );
  XORCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_XOR<2>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY [1]),
    .LI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY<2>_RT_1538 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT [2])
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY<3>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY [2]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY<3>_RT_1535 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY [3])
  );
  XORCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_XOR<3>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY [2]),
    .LI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY<3>_RT_1535 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT [3])
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY<4>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY [3]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY<4>_RT_1532 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY [4])
  );
  XORCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_XOR<4>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY [3]),
    .LI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY<4>_RT_1532 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT [4])
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY<5>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY [4]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY<5>_RT_1529 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY [5])
  );
  XORCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_XOR<5>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY [4]),
    .LI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY<5>_RT_1529 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT [5])
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY<6>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY [5]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY<6>_RT_1526 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY [6])
  );
  XORCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_XOR<6>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY [5]),
    .LI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY<6>_RT_1526 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT [6])
  );
  XORCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_XOR<7>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_CY [6]),
    .LI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_D_XOR<7>_RT_1523 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT [7])
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY<0>  (
    .CI(NlwRenamedSig_OI_base_hit[3]),
    .DI(\NlwRenamedSig_OI_csr[25] ),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_LUT [0]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY [0])
  );
  XORCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_XOR<0>  (
    .CI(NlwRenamedSig_OI_base_hit[3]),
    .LI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_LUT [0]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<0>1 )
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY<1>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY [0]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY<1>_RT_1518 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY [1])
  );
  XORCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_XOR<1>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY [0]),
    .LI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY<1>_RT_1518 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<1>1 )
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY<2>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY [1]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY<2>_RT_1515 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY [2])
  );
  XORCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_XOR<2>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY [1]),
    .LI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY<2>_RT_1515 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<2>1 )
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY<3>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY [2]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY<3>_RT_1512 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY [3])
  );
  XORCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_XOR<3>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY [2]),
    .LI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY<3>_RT_1512 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<3>1 )
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY<4>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY [3]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY<4>_RT_1509 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY [4])
  );
  XORCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_XOR<4>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY [3]),
    .LI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY<4>_RT_1509 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<4>1 )
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY<5>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY [4]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY<5>_RT_1506 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY [5])
  );
  XORCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_XOR<5>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY [4]),
    .LI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY<5>_RT_1506 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<5>1 )
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY<6>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY [5]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY<6>_RT_1503 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY [6])
  );
  XORCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_XOR<6>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY [5]),
    .LI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY<6>_RT_1503 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<6>1 )
  );
  XORCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_XOR<7>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_CY [6]),
    .LI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_A_XOR<7>_RT_1500 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<7>1 )
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY<0>  (
    .CI(NlwRenamedSig_OI_base_hit[3]),
    .DI(\NlwRenamedSig_OI_csr[25] ),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_LUT [0]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY [0])
  );
  XORCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_XOR<0>  (
    .CI(NlwRenamedSig_OI_base_hit[3]),
    .LI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_LUT [0]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<0>3 )
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY<1>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY [0]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY<1>_RT_1495 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY [1])
  );
  XORCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_XOR<1>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY [0]),
    .LI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY<1>_RT_1495 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<1>3 )
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY<2>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY [1]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY<2>_RT_1492 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY [2])
  );
  XORCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_XOR<2>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY [1]),
    .LI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY<2>_RT_1492 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<2>3 )
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY<3>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY [2]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY<3>_RT_1489 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY [3])
  );
  XORCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_XOR<3>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY [2]),
    .LI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY<3>_RT_1489 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<3>3 )
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY<4>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY [3]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY<4>_RT_1486 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY [4])
  );
  XORCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_XOR<4>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY [3]),
    .LI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY<4>_RT_1486 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<4>3 )
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY<5>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY [4]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY<5>_RT_1483 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY [5])
  );
  XORCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_XOR<5>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY [4]),
    .LI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY<5>_RT_1483 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<5>3 )
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY<6>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY [5]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY<6>_RT_1480 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY [6])
  );
  XORCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_XOR<6>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY [5]),
    .LI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY<6>_RT_1480 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<6>3 )
  );
  XORCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_XOR<7>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_CY [6]),
    .LI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_C_XOR<7>_RT_1477 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<7>3 )
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY<0>  (
    .CI(NlwRenamedSig_OI_base_hit[3]),
    .DI(\NlwRenamedSig_OI_csr[25] ),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_LUT [0]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY [0])
  );
  XORCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_XOR<0>  (
    .CI(NlwRenamedSig_OI_base_hit[3]),
    .LI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_LUT [0]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<0>4 )
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY<1>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY [0]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY<1>_RT_1472 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY [1])
  );
  XORCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_XOR<1>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY [0]),
    .LI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY<1>_RT_1472 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<1>4 )
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY<2>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY [1]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY<2>_RT_1469 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY [2])
  );
  XORCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_XOR<2>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY [1]),
    .LI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY<2>_RT_1469 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<2>4 )
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY<3>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY [2]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY<3>_RT_1466 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY [3])
  );
  XORCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_XOR<3>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY [2]),
    .LI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY<3>_RT_1466 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<3>4 )
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY<4>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY [3]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY<4>_RT_1463 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY [4])
  );
  XORCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_XOR<4>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY [3]),
    .LI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY<4>_RT_1463 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<4>4 )
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY<5>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY [4]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY<5>_RT_1460 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY [5])
  );
  XORCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_XOR<5>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY [4]),
    .LI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY<5>_RT_1460 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<5>4 )
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY<6>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY [5]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY<6>_RT_1457 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY [6])
  );
  XORCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_XOR<6>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY [5]),
    .LI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY<6>_RT_1457 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<6>4 )
  );
  XORCY   \BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_XOR<7>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_CY [6]),
    .LI(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/MCOUNT_E_XOR<7>_RT_1454 ),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/XPCI_VERSION/RESULT<7>4 )
  );
  FDPE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_IREG/INTERRUPTLINE_0  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE15_0 ),
    .D(NlwRenamedSig_OI_adio_out[0]),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_IREG/INTERRUPTLINE [0])
  );
  FDPE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_IREG/INTERRUPTLINE_1  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE15_0 ),
    .D(NlwRenamedSig_OI_adio_out[1]),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_IREG/INTERRUPTLINE [1])
  );
  FDPE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_IREG/INTERRUPTLINE_2  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE15_0 ),
    .D(NlwRenamedSig_OI_adio_out[2]),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_IREG/INTERRUPTLINE [2])
  );
  FDPE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_IREG/INTERRUPTLINE_3  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE15_0 ),
    .D(NlwRenamedSig_OI_adio_out[3]),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_IREG/INTERRUPTLINE [3])
  );
  FDPE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_IREG/INTERRUPTLINE_4  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE15_0 ),
    .D(NlwRenamedSig_OI_adio_out[4]),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_IREG/INTERRUPTLINE [4])
  );
  FDPE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_IREG/INTERRUPTLINE_5  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE15_0 ),
    .D(NlwRenamedSig_OI_adio_out[5]),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_IREG/INTERRUPTLINE [5])
  );
  FDPE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_IREG/INTERRUPTLINE_6  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE15_0 ),
    .D(NlwRenamedSig_OI_adio_out[6]),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_IREG/INTERRUPTLINE [6])
  );
  FDPE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_IREG/INTERRUPTLINE_7  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE15_0 ),
    .D(NlwRenamedSig_OI_adio_out[7]),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_IREG/INTERRUPTLINE [7])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT_5  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE4_0 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[5]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [5])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT_7  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE4_0 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[7]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [7])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT_6  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE4_0 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[6]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [6])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT_4  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE4_0 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[4]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [4])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT_15  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE4_1 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[15]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [15])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT_12  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE4_1 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[12]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [12])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT_14  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE4_1 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[14]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [14])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT_13  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE4_1 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[13]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [13])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT_11  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE4_1 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[11]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [11])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT_10  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE4_1 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[10]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [10])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT_23  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE4_2 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[23]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [23])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT_9  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE4_1 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[9]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [9])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT_8  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE4_1 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[8]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [8])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT_22  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE4_2 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[22]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [22])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT_21  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE4_2 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[21]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [21])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT_20  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE4_2 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[20]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [20])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT_19  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE4_2 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[19]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [19])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT_18  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE4_2 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[18]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [18])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT_17  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE4_2 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[17]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [17])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT_29  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE4_3 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[29]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT_29_1422 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT_16  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE4_2 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[16]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [16])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT_30  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE4_3 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[30]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT_30_1419 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT_28  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE4_3 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[28]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT_28_1418 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT_27  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE4_3 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[27]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [27])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT_26  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE4_3 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[26]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [26])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT_25  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE4_3 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[25]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [25])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT_24  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE4_3 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[24]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT [24])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT_31  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE4_3 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[31]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BAR_INT_31_1413 )
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BASE_HITO  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/NS_BASE_HIT0 ),
    .Q(NlwRenamedSig_OI_base_hit[0])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/BAR0/BH64_O  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/NS_BH64_0 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/BH64_O_1410 )
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_CY<0>  (
    .CI(\NlwRenamedSig_OI_csr[25] ),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_LUT [0]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_CY [0])
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_CY<1>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_CY [0]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_LUT [1]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_CY [1])
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_CY<2>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_CY [1]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_LUT [2]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_CY [2])
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_CY<3>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_CY [2]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_LUT [3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_CY [3])
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_CY<4>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_CY [3]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_LUT [4]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_CY [4])
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_CY<5>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_CY [4]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_LUT [5]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_CY [5])
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_CY<6>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_CY [5]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_LUT [6]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_CY [6])
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_CY<7>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_CY [6]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_LUT [7]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_CY [7])
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_CY<8>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_CY [7]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_LUT [8]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_CY [8])
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_CY<9>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_CY [8]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/MCOMPAR_ADDRESS_MATCH_LUT [9]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR0/ADDRESS_MATCH )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT_5  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE5_0 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[5]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [5])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT_7  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE5_0 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[7]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [7])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT_6  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE5_0 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[6]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [6])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT_4  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE5_0 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[4]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [4])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT_15  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE5_1 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[15]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [15])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT_12  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE5_1 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[12]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [12])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT_14  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE5_1 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[14]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [14])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT_13  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE5_1 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[13]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [13])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT_11  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE5_1 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[11]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [11])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT_10  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE5_1 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[10]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [10])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT_23  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE5_2 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[23]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [23])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT_9  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE5_1 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[9]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [9])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT_8  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE5_1 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[8]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [8])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT_22  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE5_2 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[22]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [22])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT_21  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE5_2 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[21]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [21])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT_20  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE5_2 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[20]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [20])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT_19  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE5_2 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[19]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [19])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT_18  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE5_2 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[18]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [18])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT_17  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE5_2 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[17]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [17])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT_29  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE5_3 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[29]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT_29_1367 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT_16  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE5_2 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[16]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [16])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT_30  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE5_3 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[30]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT_30_1364 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT_28  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE5_3 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[28]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT_28_1363 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT_27  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE5_3 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[27]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [27])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT_26  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE5_3 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[26]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [26])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT_25  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE5_3 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[25]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [25])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT_24  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE5_3 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[24]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT [24])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT_31  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE5_3 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[31]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BAR_INT_31_1358 )
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BASE_HITO  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/NS_BASE_HIT1 ),
    .Q(NlwRenamedSig_OI_base_hit[1])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/BAR1/BH64_O  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/NS_BH64_1 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/BH64_O_1355 )
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_CY<0>  (
    .CI(\NlwRenamedSig_OI_csr[25] ),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_LUT [0]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_CY [0])
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_CY<1>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_CY [0]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_LUT [1]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_CY [1])
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_CY<2>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_CY [1]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_LUT [2]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_CY [2])
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_CY<3>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_CY [2]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_LUT [3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_CY [3])
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_CY<4>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_CY [3]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_LUT [4]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_CY [4])
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_CY<5>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_CY [4]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_LUT [5]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_CY [5])
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_CY<6>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_CY [5]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_LUT [6]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_CY [6])
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_CY<7>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_CY [6]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_LUT [7]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_CY [7])
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_CY<8>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_CY [7]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_LUT [8]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_CY [8])
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_CY<9>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_CY [8]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/MCOMPAR_ADDRESS_MATCH_LUT [9]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR1/ADDRESS_MATCH )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT_5  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE6_0 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[5]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [5])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT_7  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE6_0 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[7]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [7])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT_6  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE6_0 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[6]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [6])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT_4  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE6_0 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[4]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [4])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT_15  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE6_1 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[15]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [15])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT_12  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE6_1 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[12]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [12])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT_14  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE6_1 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[14]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [14])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT_13  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE6_1 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[13]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [13])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT_11  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE6_1 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[11]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [11])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT_10  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE6_1 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[10]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [10])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT_23  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE6_2 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[23]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [23])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT_9  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE6_1 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[9]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [9])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT_8  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE6_1 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[8]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [8])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT_22  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE6_2 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[22]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [22])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT_21  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE6_2 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[21]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [21])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT_20  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE6_2 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[20]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [20])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT_19  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE6_2 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[19]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [19])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT_18  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE6_2 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[18]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [18])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT_17  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE6_2 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[17]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [17])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT_29  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE6_3 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[29]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT_29_1312 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT_16  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE6_2 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[16]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [16])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT_30  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE6_3 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[30]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT_30_1309 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT_28  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE6_3 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[28]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT_28_1308 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT_27  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE6_3 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[27]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [27])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT_26  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE6_3 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[26]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [26])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT_25  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE6_3 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[25]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [25])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT_24  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE6_3 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[24]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT [24])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT_31  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE6_3 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[31]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BAR_INT_31_1303 )
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/BAR2/BASE_HITO  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/NS_BASE_HIT2_INT ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BASE_HITO_1301 )
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/BAR2/BH64_O  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/NS_BH64_2_INT ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/BH64_O_1299 )
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_CY<0>  (
    .CI(\NlwRenamedSig_OI_csr[25] ),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_LUT [0]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_CY [0])
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_CY<1>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_CY [0]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_LUT [1]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_CY [1])
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_CY<2>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_CY [1]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_LUT [2]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_CY [2])
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_CY<3>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_CY [2]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_LUT [3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_CY [3])
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_CY<4>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_CY [3]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_LUT [4]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_CY [4])
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_CY<5>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_CY [4]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_LUT [5]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_CY [5])
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_CY<6>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_CY [5]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_LUT [6]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_CY [6])
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_CY<7>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_CY [6]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_LUT [7]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_CY [7])
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_CY<8>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_CY [7]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_LUT [8]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_CY [8])
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_CY<9>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_CY [8]),
    .DI(NlwRenamedSig_OI_base_hit[3]),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/MCOMPAR_ADDRESS_MATCH_LUT [9]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/BAR2/ADDRESS_MATCH )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CSR/MEMACCESSALLOWED_INT  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE1_0 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[1]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CSR/MEMACCESSALLOWED_INT_1277 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CSR/PARITYERRORREPORTEN  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE1_0 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[6]),
    .Q(\NlwRenamedSig_OI_csr[6] )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CSR/BUSMASTEREN  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE1_0 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[2]),
    .Q(\NlwRenamedSig_OI_csr[2] )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CSR/IOACCESSALLOWED_INT  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE1_0 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[0]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CSR/IOACCESSALLOWED_INT_1276 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CSR/INTERRUPTDISABLE  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE1_1 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[10]),
    .Q(\NlwRenamedSig_OI_csr[10] )
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CSR/CSR_INT_27  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CSR/PCI_CSR_OR[27] ),
    .Q(\NlwRenamedSig_OI_csr[27] )
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CSR/CSR_INT_28  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CSR/PCI_CSR_OR[28] ),
    .Q(\NlwRenamedSig_OI_csr[28] )
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CSR/CSR_INT_29  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CSR/PCI_CSR_OR[29] ),
    .Q(\NlwRenamedSig_OI_csr[29] )
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CSR/CSR_INT_30  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CSR/PCI_CSR_OR[30] ),
    .Q(\NlwRenamedSig_OI_csr[30] )
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CSR/CSR_INT_31  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CSR/PCI_CSR_OR[31] ),
    .Q(\NlwRenamedSig_OI_csr[31] )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CSR/SYSTEMERRORREPORTEN  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE1_1 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[8]),
    .Q(\NlwRenamedSig_OI_csr[8] )
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CSR/DATAPARITYERRORDET  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CSR/PCI_CSR_OR[24] ),
    .Q(\NlwRenamedSig_OI_csr[24] )
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CSR/INTERRUPTSTATUS  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CSR/N0092 ),
    .Q(\NlwRenamedSig_OI_csr[19] )
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/PAR_CE  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/NS_PAR_CE ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/PAR_CE_818 )
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/NEWDATA  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/NS_NEWDATA_OUT_CE ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/NEWDATA_1265 )
  );
  PCILOGICSE   \BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/PCILOGIC  (
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/FFA ),
    .PCI_CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .I3(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/M_OK_N ),
    .TRDY(trdyi),
    .IRDY(irdyi),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/S_OK_N )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/LCMD1  (
    .C(clk),
    .CE(NlwRenamedSig_OI_addr_vld),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD1 ),
    .Q(\NlwRenamedSig_OI_pci_cmd[1] )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/WRN  (
    .C(clk),
    .CE(NlwRenamedSig_OI_addr_vld),
    .CLR(rst),
    .D(NlwRenamedSig_OI_s_cbe[0]),
    .Q(NlwRenamedSig_OI_s_wrdn)
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/LCMD0  (
    .C(clk),
    .CE(NlwRenamedSig_OI_addr_vld),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD0 ),
    .Q(pci_cmd[0])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/LCMD2  (
    .C(clk),
    .CE(NlwRenamedSig_OI_addr_vld),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD2 ),
    .Q(pci_cmd[2])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/LCMD3  (
    .C(clk),
    .CE(NlwRenamedSig_OI_addr_vld),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD3 ),
    .Q(pci_cmd[3])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/LCMD6  (
    .C(clk),
    .CE(NlwRenamedSig_OI_addr_vld),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD6 ),
    .Q(pci_cmd[6])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/LCMD4  (
    .C(clk),
    .CE(NlwRenamedSig_OI_addr_vld),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD4 ),
    .Q(pci_cmd[4])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/LCMD5  (
    .C(clk),
    .CE(NlwRenamedSig_OI_addr_vld),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD5 ),
    .Q(pci_cmd[5])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/LCMD7  (
    .C(clk),
    .CE(NlwRenamedSig_OI_addr_vld),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD7 ),
    .Q(pci_cmd[7])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/LCMD8  (
    .C(clk),
    .CE(NlwRenamedSig_OI_addr_vld),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD8 ),
    .Q(pci_cmd[8])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/LCMD11  (
    .C(clk),
    .CE(NlwRenamedSig_OI_addr_vld),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD11 ),
    .Q(\NlwRenamedSig_OI_pci_cmd[11] )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/LCMD9  (
    .C(clk),
    .CE(NlwRenamedSig_OI_addr_vld),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD9 ),
    .Q(pci_cmd[9])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/LCMD10  (
    .C(clk),
    .CE(NlwRenamedSig_OI_addr_vld),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD10 ),
    .Q(\NlwRenamedSig_OI_pci_cmd[10] )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/LCMD12  (
    .C(clk),
    .CE(NlwRenamedSig_OI_addr_vld),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD12 ),
    .Q(pci_cmd[12])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/LCMD13  (
    .C(clk),
    .CE(NlwRenamedSig_OI_addr_vld),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD13 ),
    .Q(pci_cmd[13])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/LCMD14  (
    .C(clk),
    .CE(NlwRenamedSig_OI_addr_vld),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD14 ),
    .Q(pci_cmd[14])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/LCMD15  (
    .C(clk),
    .CE(NlwRenamedSig_OI_addr_vld),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CMD15 ),
    .Q(pci_cmd[15])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CFG_HIT  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/NS_CFG_HIT ),
    .Q(NlwRenamedSig_OI_cfg_hit)
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CFG_CYC  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/NS_CFG_CYC ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LC/CFG_CYC_1243 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/LADX1  (
    .C(clk),
    .CE(NlwRenamedSig_OI_addr_vld),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/ADX1 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/LADX1_1241 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/ADDR_0  (
    .C(clk),
    .CE(NlwRenamedSig_OI_addr_vld),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[0]),
    .Q(addr[0])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/ADDR_1  (
    .C(clk),
    .CE(NlwRenamedSig_OI_addr_vld),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[1]),
    .Q(addr[1])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/ADDR_2  (
    .C(clk),
    .CE(NlwRenamedSig_OI_addr_vld),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[2]),
    .Q(NlwRenamedSig_OI_addr[2])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/ADDR_3  (
    .C(clk),
    .CE(NlwRenamedSig_OI_addr_vld),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[3]),
    .Q(NlwRenamedSig_OI_addr[3])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/ADDR_4  (
    .C(clk),
    .CE(NlwRenamedSig_OI_addr_vld),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[4]),
    .Q(NlwRenamedSig_OI_addr[4])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/ADDR_5  (
    .C(clk),
    .CE(NlwRenamedSig_OI_addr_vld),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[5]),
    .Q(NlwRenamedSig_OI_addr[5])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/ADDR_6  (
    .C(clk),
    .CE(NlwRenamedSig_OI_addr_vld),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[6]),
    .Q(NlwRenamedSig_OI_addr[6])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/ADDR_7  (
    .C(clk),
    .CE(NlwRenamedSig_OI_addr_vld),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[7]),
    .Q(NlwRenamedSig_OI_addr[7])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/ADDR_8  (
    .C(clk),
    .CE(NlwRenamedSig_OI_addr_vld),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[8]),
    .Q(addr[8])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/ADDR_9  (
    .C(clk),
    .CE(NlwRenamedSig_OI_addr_vld),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[9]),
    .Q(addr[9])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/ADDR_10  (
    .C(clk),
    .CE(NlwRenamedSig_OI_addr_vld),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[10]),
    .Q(addr[10])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/ADDR_11  (
    .C(clk),
    .CE(NlwRenamedSig_OI_addr_vld),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[11]),
    .Q(addr[11])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/ADDR_12  (
    .C(clk),
    .CE(NlwRenamedSig_OI_addr_vld),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[12]),
    .Q(addr[12])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/ADDR_13  (
    .C(clk),
    .CE(NlwRenamedSig_OI_addr_vld),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[13]),
    .Q(addr[13])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/ADDR_14  (
    .C(clk),
    .CE(NlwRenamedSig_OI_addr_vld),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[14]),
    .Q(addr[14])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/ADDR_15  (
    .C(clk),
    .CE(NlwRenamedSig_OI_addr_vld),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[15]),
    .Q(addr[15])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/ADDR_16  (
    .C(clk),
    .CE(NlwRenamedSig_OI_addr_vld),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[16]),
    .Q(addr[16])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/ADDR_17  (
    .C(clk),
    .CE(NlwRenamedSig_OI_addr_vld),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[17]),
    .Q(addr[17])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/ADDR_18  (
    .C(clk),
    .CE(NlwRenamedSig_OI_addr_vld),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[18]),
    .Q(addr[18])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/ADDR_19  (
    .C(clk),
    .CE(NlwRenamedSig_OI_addr_vld),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[19]),
    .Q(addr[19])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/ADDR_20  (
    .C(clk),
    .CE(NlwRenamedSig_OI_addr_vld),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[20]),
    .Q(addr[20])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/ADDR_21  (
    .C(clk),
    .CE(NlwRenamedSig_OI_addr_vld),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[21]),
    .Q(addr[21])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/ADDR_22  (
    .C(clk),
    .CE(NlwRenamedSig_OI_addr_vld),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[22]),
    .Q(addr[22])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/ADDR_23  (
    .C(clk),
    .CE(NlwRenamedSig_OI_addr_vld),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[23]),
    .Q(addr[23])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/ADDR_24  (
    .C(clk),
    .CE(NlwRenamedSig_OI_addr_vld),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[24]),
    .Q(addr[24])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/ADDR_25  (
    .C(clk),
    .CE(NlwRenamedSig_OI_addr_vld),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[25]),
    .Q(addr[25])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/ADDR_26  (
    .C(clk),
    .CE(NlwRenamedSig_OI_addr_vld),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[26]),
    .Q(addr[26])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/ADDR_27  (
    .C(clk),
    .CE(NlwRenamedSig_OI_addr_vld),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[27]),
    .Q(addr[27])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/ADDR_28  (
    .C(clk),
    .CE(NlwRenamedSig_OI_addr_vld),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[28]),
    .Q(addr[28])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/ADDR_29  (
    .C(clk),
    .CE(NlwRenamedSig_OI_addr_vld),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[29]),
    .Q(addr[29])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/ADDR_30  (
    .C(clk),
    .CE(NlwRenamedSig_OI_addr_vld),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[30]),
    .Q(addr[30])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/ADDR_31  (
    .C(clk),
    .CE(NlwRenamedSig_OI_addr_vld),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[31]),
    .Q(addr[31])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/LADX3  (
    .C(clk),
    .CE(NlwRenamedSig_OI_addr_vld),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/ADX3 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/LADX3_1239 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/LADX4  (
    .C(clk),
    .CE(NlwRenamedSig_OI_addr_vld),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/ADX4 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/LADX4_1237 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/LADX5  (
    .C(clk),
    .CE(NlwRenamedSig_OI_addr_vld),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/ADX5 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/LADX5_1235 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/LADX6  (
    .C(clk),
    .CE(NlwRenamedSig_OI_addr_vld),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/ADX6 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/LADX6_1233 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/LADX15  (
    .C(clk),
    .CE(NlwRenamedSig_OI_addr_vld),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/ADX15 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_LA/LADX15_1231 )
  );
  FDP   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE5_  (
    .C(clk),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/N0040 ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE5__1229 )
  );
  FDP   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE3_  (
    .C(clk),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/N0022 ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE3__1227 )
  );
  FDP   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE4_  (
    .C(clk),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/N0031 ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE4__1225 )
  );
  FDP   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE6_  (
    .C(clk),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/N0049 ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE6__1223 )
  );
  FDP   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE15_  (
    .C(clk),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/N0098 ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE15__1221 )
  );
  FDP   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE_ROM_  (
    .C(clk),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/N0103 ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE_ROM__1219 )
  );
  FDP   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE1_  (
    .C(clk),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/N0012 ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OE/OE1__1217 )
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/I_DATA_FLAG  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/N0038 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/I_DATA_FLAG_1215 )
  );
  FDP   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/TSTOP_I_  (
    .C(clk),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/NS_STOP_ ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/TSTOP_I__1212 )
  );
  FDP   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/TSTOP_  (
    .C(clk),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/TSTOP_I__1212 ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_STOP/TSTOP__1213 )
  );
  FDP   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_AK64/TACK64_I_  (
    .C(clk),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/NS_ACK64_ ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_AK64/TACK64_I__1211 )
  );
  FDP   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_DSEL/TDEVSEL_I_  (
    .C(clk),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/NS_DEVSEL_ ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_DSEL/TDEVSEL_I__1209 )
  );
  FDP   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_DSEL/TDEVSEL_  (
    .C(clk),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_DSEL/TDEVSEL_I__1209 ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_DSEL/TDEVSEL__1210 )
  );
  FDP   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/TTRDY_I_  (
    .C(clk),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/NS_TRDY_ ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/TTRDY_I__1205 )
  );
  FDP   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/S_FIRST  (
    .C(clk),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/S_FIRSTIN ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/S_FIRST_1208 )
  );
  FDP   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/TRDYDEL  (
    .C(clk),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_TRDY/TTRDY_I__1205 ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/TRDYDEL_1206 )
  );
  FDP   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/OE_ADO_LT_  (
    .C(clk),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/NS_OE_ADO_LT_ ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/OE_ADO_LT__1204 )
  );
  FDP   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/OE_ADO_LB_  (
    .C(clk),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/NS_OE_ADO_LB_ ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/OE_ADO_LB__1202 )
  );
  FDP   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/OE_ADO_T_  (
    .C(clk),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/NS_OE_ADO_T_ ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/OE_ADO_T__1200 )
  );
  FDP   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/OE_ADO_B_  (
    .C(clk),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/NS_OE_ADO_B_ ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/OE_ADO_B__1198 )
  );
  FDP   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/OE_ADO_LT64_  (
    .C(clk),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/NS_OE_ADO_LT64_ ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/OE_ADO_LT64__1196 )
  );
  FDP   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/OE_ADO_LB64_  (
    .C(clk),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/NS_OE_ADO_LB64_ ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/OE_ADO_LB64__1194 )
  );
  FDP   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/OE_ADO_T64_  (
    .C(clk),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/NS_OE_ADO_T64_ ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/OE_ADO_T64__1192 )
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/TRSTOPQ  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/N0029 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/TRSTOPQ_1190 )
  );
  FDP   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/OE_ADO_B64_  (
    .C(clk),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/NS_OE_ADO_B64_ ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/OE_ADO_B64__1188 )
  );
  FDP   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/HOLD_OE_PERR  (
    .C(clk),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/SET_OE_PERR ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/HOLD_OE_PERR_1186 )
  );
  FDP #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/XPCI_TRDYT  (
    .C(clk),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/OE_TRDY_IN__1184 ),
    .PRE(rst),
    .Q(trdyt)
  );
  FDP #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/XPCI_STOPT  (
    .C(clk),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/OE_TRDY_IN__1184 ),
    .PRE(rst),
    .Q(stopt)
  );
  FDP #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/XPCI_DEVSELT  (
    .C(clk),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/OE_TRDY_IN__1184 ),
    .PRE(rst),
    .Q(devselt)
  );
  FDP #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/XPCI_ACK64T  (
    .C(clk),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_OFCN/PCI_XOE/OE_ACK64_IN__1183 ),
    .PRE(rst),
    .Q(\BU2/ack64t )
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/TPWIN64  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/NS_PWIN64 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/TPWIN64_1182 )
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/TPWIN  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/NS_PWIN ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/TPWIN_1180 )
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/HOLD_APERR  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/N0238 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/HOLD_APERR_1178 )
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_TSM/PCI_BUSY/B_BUSY  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_TSM/PCI_BUSY/NS_BUSY ),
    .Q(NlwRenamedSig_OI_b_busy)
  );
  FDP   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_TSM/PCI_IDLE/IDLE_BE  (
    .C(clk),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_TSM/PCI_IDLE/NS_IDLE_1175 ),
    .PRE(rst),
    .Q(NlwRenamedSig_OI_idle)
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_TSM/PCI_DATA/S_DATA_BE  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_TSM/PCI_DATA/NS_DATA ),
    .Q(NlwRenamedSig_OI_s_data)
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_TSM/PCI_BKOF/BACKOFF  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_CNTL/PCI_TSM/PCI_BKOF/NS_BKOF ),
    .Q(NlwRenamedSig_OI_backoff)
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/DEV_TO/PASS_TO  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/DEV_TO/N0010 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/DEV_TO/PASS_TO_1172 )
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/DEV_TO/FAST  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/DEV_TO/DEV_TO_ADDR ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/DEV_TO/FAST_1167 )
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/DEV_TO/WAS_SUBTRACTIVE  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/DEV_TO/N0006 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/DEV_TO/WAS_SUBTRACTIVE_1169 )
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/DEV_TO/WAS_FAST  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/DEV_TO/FAST_1167 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/DEV_TO/WAS_FAST_1166 )
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/DEV_TO/WAS_MEDIUM  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/DEV_TO/WAS_FAST_1166 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/DEV_TO/WAS_MEDIUM_1164 )
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/DEV_TO/WAS_SLOW  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/DEV_TO/WAS_MEDIUM_1164 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/DEV_TO/WAS_SLOW_1165 )
  );
  FDP   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/M_FIRST  (
    .C(clk),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/M_FIRSTIN ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/M_FIRST_904 )
  );
  FDP   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/IIRDY_I_  (
    .C(clk),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/NS_IRDY_ ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/IIRDY_I__1161 )
  );
  FDP   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/IIRDY_  (
    .C(clk),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/IIRDY_I__1161 ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/IIRDY__1162 )
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/REQ64/IREQ64_I_  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/FRAME_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/NS_REQ64_ ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/REQ64/IREQ64_I__1159 )
  );
  FDP   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/REQ64/IREQ64_  (
    .C(clk),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/REQ64/IREQ64_I__1159 ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/REQ64/IREQ64__1160 )
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/FRAME/IFRAME_I_  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/FRAME_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/NS_FRAME_ ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/FRAME/IFRAME_I__1111 )
  );
  FDP   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/FRAME/IFRAME_  (
    .C(clk),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/FRAME/IFRAME_I__1111 ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/FRAME/IFRAME__1158 )
  );
  FDP   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/HOLD_OE_PERR  (
    .C(clk),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/SET_OE_PERR ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/HOLD_OE_PERR_1157 )
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/REQUESTQ  (
    .C(clk),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_csr[25] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/REQUESTQ_1155 )
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/SLOT  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/OE_FRAME_NS ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/SLOT_1154 )
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/SLOT64_INT  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/OE_FRAME_NS64 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/SLOT64_INT_1152 )
  );
  FDPE   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/OE_FRAME_INT  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/CE_OEF ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/OE_FRAME_NS_OEF ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/OE_FRAME_INT_1149 )
  );
  FDPE   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/OE_REQ64_INT  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/CE_OER ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/OE_FRAME_NS_OER ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/OE_REQ64_INT_1150 )
  );
  FDP #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/XPCI_IRDYT  (
    .C(clk),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/OE_FRAME_INT_1149 ),
    .PRE(rst),
    .Q(irdyt)
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/XPCI_REQ64T  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/CE_OER ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/OE_FRAME_NS_OER ),
    .PRE(rst),
    .Q(\BU2/req64t )
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/XPCI_FRAMET  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/CE_OEF ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/OE_FRAME_NS_OEF ),
    .PRE(rst),
    .Q(framet)
  );
  FDP #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/XPCI_PAR64T  (
    .C(clk),
    .D(\BU2/U0/pci32_inst/ADT[32] ),
    .PRE(rst),
    .Q(\BU2/par64t )
  );
  FDP #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/XPCI_PART  (
    .C(clk),
    .D(NlwRenamedSig_OI_adt[0]),
    .PRE(rst),
    .Q(part)
  );
  FDP #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/XPCI_PERRT  (
    .C(clk),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/OE_FRAME/NS_OE_PERR_1144 ),
    .PRE(rst),
    .Q(perrt)
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/ADDR_BE_Q  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/ADDR/ADDR_BE_1128 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/ADDR_BE_Q_1143 )
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/ATTEMPT64  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/N0046 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/ATTEMPT64_1142 )
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/REQUEST  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/N0030_1139 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/REQUEST_1140 )
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/REQUEST64  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/N0038 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/REQUEST64_1136 )
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/REQUEST64Q  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/REQUEST64_1136 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFER_REQ/REQUEST64Q_1137 )
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/IREAD64  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/NS_IREAD64 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IREAD64_1135 )
  );
  FDP #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/XPCI_GNTI  (
    .C(clk),
    .D(gntd),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/GNT_ )
  );
  FDP #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/XPCI_REQO  (
    .C(clk),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/NS_REQ_ ),
    .PRE(rst),
    .Q(reqo)
  );
  FDP #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/XPCI_REQT  (
    .C(clk),
    .D(NlwRenamedSig_OI_base_hit[3]),
    .PRE(rst),
    .Q(reqt)
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/TIME_OUT  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/N0038_1131 ),
    .Q(NlwRenamedSig_OI_time_out)
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFERFAIL/FAIL64  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/XFERFAIL/NS_FAIL64 ),
    .Q(\BU2/m_fail64 )
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/STAR/S_TAR  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/STAR/NS_S_TAR ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/STAR/S_TAR_1089 )
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/ADDR/ADDR_BE  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/ADDR/NS_ABE ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/ADDR/ADDR_BE_1128 )
  );
  FDP   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/ADDR/M_ADDR_  (
    .C(clk),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/ADDR/NS_MAN ),
    .PRE(rst),
    .Q(m_addr_n)
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/M_DATA/M_DATA  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/M_DATA/NS_MDATA_1125 ),
    .Q(NlwRenamedSig_OI_m_data)
  );
  LUT3 #(
    .INIT ( 8'h1B ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_LUT<0>  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/FRAME/IFRAME_I__1111 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/CNT_VAL [0]),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/REG_0CH [8]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_LUT [0])
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_CY<0>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/FRAME/IFRAME_I__1111 ),
    .DI(\NlwRenamedSig_OI_csr[25] ),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_LUT [0]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_CY [0])
  );
  XORCY   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_XOR<0>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/FRAME/IFRAME_I__1111 ),
    .LI(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_LUT [0]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL )
  );
  LUT3 #(
    .INIT ( 8'h1B ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_LUT<1>  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/FRAME/IFRAME_I__1111 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/CNT_VAL [1]),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/REG_0CH [9]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_LUT [1])
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_CY<1>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_CY [0]),
    .DI(\NlwRenamedSig_OI_csr[25] ),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_LUT [1]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_CY [1])
  );
  XORCY   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_XOR<1>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_CY [0]),
    .LI(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_LUT [1]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL1 )
  );
  LUT3 #(
    .INIT ( 8'h1B ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_LUT<2>  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/FRAME/IFRAME_I__1111 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/CNT_VAL [2]),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/REG_0CH [10]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_LUT [2])
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_CY<2>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_CY [1]),
    .DI(\NlwRenamedSig_OI_csr[25] ),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_LUT [2]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_CY [2])
  );
  XORCY   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_XOR<2>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_CY [1]),
    .LI(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_LUT [2]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL2 )
  );
  LUT3 #(
    .INIT ( 8'h1B ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_LUT<3>  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/FRAME/IFRAME_I__1111 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/CNT_VAL [3]),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/REG_0CH [11]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_LUT [3])
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_CY<3>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_CY [2]),
    .DI(\NlwRenamedSig_OI_csr[25] ),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_LUT [3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_CY [3])
  );
  XORCY   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_XOR<3>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_CY [2]),
    .LI(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_LUT [3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL3 )
  );
  LUT3 #(
    .INIT ( 8'h1B ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_LUT<4>  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/FRAME/IFRAME_I__1111 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/CNT_VAL [4]),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/REG_0CH [12]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_LUT [4])
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_CY<4>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_CY [3]),
    .DI(\NlwRenamedSig_OI_csr[25] ),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_LUT [4]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_CY [4])
  );
  XORCY   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_XOR<4>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_CY [3]),
    .LI(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_LUT [4]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL4 )
  );
  LUT3 #(
    .INIT ( 8'h1B ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_LUT<5>  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/FRAME/IFRAME_I__1111 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/CNT_VAL [5]),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/REG_0CH [13]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_LUT [5])
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_CY<5>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_CY [4]),
    .DI(\NlwRenamedSig_OI_csr[25] ),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_LUT [5]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_CY [5])
  );
  XORCY   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_XOR<5>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_CY [4]),
    .LI(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_LUT [5]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL5 )
  );
  LUT3 #(
    .INIT ( 8'h1B ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_LUT<6>  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/FRAME/IFRAME_I__1111 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/CNT_VAL [6]),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/REG_0CH [14]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_LUT [6])
  );
  MUXCY   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_CY<6>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_CY [5]),
    .DI(\NlwRenamedSig_OI_csr[25] ),
    .S(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_LUT [6]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_CY [6])
  );
  XORCY   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_XOR<6>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_CY [5]),
    .LI(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_LUT [6]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL6 )
  );
  LUT3 #(
    .INIT ( 8'h1B ))
  \BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_LUT<7>  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/FRAME/IFRAME_I__1111 ),
    .I1(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/CNT_VAL [7]),
    .I2(\BU2/U0/pci32_inst/PCI_LC_I/REG_0CH [15]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_LUT [7])
  );
  XORCY   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_XOR<7>  (
    .CI(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_CY [6]),
    .LI(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL_LUT [7]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL7 )
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/CNT_VAL_0  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/CNT_VAL [0])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/CNT_VAL_1  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL1 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/CNT_VAL [1])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/CNT_VAL_2  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL2 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/CNT_VAL [2])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/CNT_VAL_3  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL3 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/CNT_VAL [3])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/CNT_VAL_4  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL4 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/CNT_VAL [4])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/CNT_VAL_5  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL5 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/CNT_VAL [5])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/CNT_VAL_6  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL6 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/CNT_VAL [6])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/CNT_VAL_7  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/MCOUNT_CNT_VAL7 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/LAT_TIMR/CNT_VAL [7])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/REQ/X  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/REQ/N0008 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/REQ/X_1092 )
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/REQ/S_TARQ  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/STAR/S_TAR_1089 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/REQ/S_TARQ_1090 )
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/DR_BUS/DR_BUS  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/DR_BUS/NS_DR_BUS ),
    .Q(NlwRenamedSig_OI_dr_bus)
  );
  FDP   \BU2/U0/pci32_inst/PCI_LC_I/MASTER/I_IDLE/I_IDLE  (
    .C(clk),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/I_IDLE/NS_I_IDLE ),
    .PRE(rst),
    .Q(NlwRenamedSig_OI_i_idle)
  );
  FDP   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/APERR_N  (
    .C(clk),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/PRE_APERR_N ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/APERR_N_1086 )
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_0  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [0]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [0])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_1  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [1]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [1])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_2  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [2]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [2])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_3  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [3]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [3])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_4  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [4]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [4])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_5  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [5]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [5])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_6  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [6]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [6])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_7  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [7]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [7])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_8  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [8]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [8])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_9  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [9]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [9])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_10  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [10]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [10])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_11  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [11]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [11])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_12  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [12]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [12])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_13  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [13]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [13])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_14  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [14]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [14])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_15  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [15]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [15])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_16  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [16]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [16])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_17  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [17]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [17])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_18  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [18]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [18])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_19  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [19]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [19])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_20  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [20]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [20])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_21  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [21]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [21])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_22  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [22]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [22])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_23  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [23]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [23])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_24  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [24]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [24])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_25  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [25]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [25])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_26  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [26]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [26])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_27  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [27]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [27])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_28  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [28]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [28])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_29  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [29]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [29])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_30  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [30]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [30])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_31  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [31]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [31])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_32  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [32]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [32])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_33  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [33]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [33])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_34  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [34]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [34])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_35  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [35]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [35])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_36  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [36]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [36])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_37  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [37]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [37])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_38  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [38]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [38])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_39  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [39]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [39])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_40  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [40]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [40])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_41  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [41]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [41])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_42  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [42]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [42])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_43  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [43]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [43])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_44  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [44]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [44])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_45  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [45]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [45])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_46  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [46]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [46])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_47  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [47]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [47])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_48  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [48]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [48])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_49  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [49]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [49])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_50  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [50]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [50])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_51  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [51]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [51])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_52  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [52]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [52])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_53  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [53]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [53])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_54  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [54]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [54])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_55  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [55]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [55])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_56  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [56]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [56])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_57  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [57]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [57])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_58  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [58]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [58])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_59  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [59]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [59])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_60  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [60]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [60])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_61  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [61]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [61])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_62  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [62]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [62])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ_63  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/ADOUT [63]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADOUTQ [63])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADDR_VLDQ  (
    .C(clk),
    .CLR(rst),
    .D(NlwRenamedSig_OI_addr_vld),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/ADDR_VLDQ_956 )
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/M_DATAQ  (
    .C(clk),
    .CLR(rst),
    .D(NlwRenamedSig_OI_m_data),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/M_DATAQ_953 )
  );
  FDP #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/LC_PERR_  (
    .C(clk),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/NS_PERR_ ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/LC_PERR__955 )
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/M_DATA2Q  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/M_DATAQ_953 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/M_DATA2Q_954 )
  );
  FDP #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/XPCI_SERRT  (
    .C(clk),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/PCI_PAR/NS_OE_SERR ),
    .PRE(rst),
    .Q(serrt)
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/INTACKQ  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/INTACK ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/INTACKQ_951 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/REG_0CH_14  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE3_1 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[14]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/REG_0CH [14])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/REG_0CH_11  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE3_1 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[11]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/REG_0CH [11])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/REG_0CH_13  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE3_1 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[13]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/REG_0CH [13])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/REG_0CH_12  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE3_1 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[12]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/REG_0CH [12])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/REG_0CH_8  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE3_1 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[8]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/REG_0CH [8])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/REG_0CH_10  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE3_1 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[10]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/REG_0CH [10])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/REG_0CH_9  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE3_1 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[9]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/REG_0CH [9])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/REG_0CH_15  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/CE3_1 ),
    .CLR(rst),
    .D(NlwRenamedSig_OI_adio_out[15]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/REG_0CH [15])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/FAIL_CBH_4  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/M_FIRST_904 ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_CBH [4])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/FAIL_CBH_5  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/M_FIRST_904 ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_CBH [5])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/FAIL_CBH_6  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/M_FIRST_904 ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_CBH [6])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/FAIL_CBH_7  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/M_FIRST_904 ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_CBH [7])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH_32  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/M_FIRST_904 ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [32])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH_33  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/M_FIRST_904 ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [33])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH_34  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/M_FIRST_904 ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [34])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH_35  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/M_FIRST_904 ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [35])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH_36  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/M_FIRST_904 ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [36])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH_37  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/M_FIRST_904 ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [37])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH_38  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/M_FIRST_904 ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [38])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH_39  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/M_FIRST_904 ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [39])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH_40  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/M_FIRST_904 ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [40])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH_41  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/M_FIRST_904 ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [41])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH_42  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/M_FIRST_904 ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [42])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH_43  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/M_FIRST_904 ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [43])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH_44  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/M_FIRST_904 ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [44])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH_45  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/M_FIRST_904 ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [45])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH_46  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/M_FIRST_904 ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [46])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH_47  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/M_FIRST_904 ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [47])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH_48  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/M_FIRST_904 ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [48])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH_49  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/M_FIRST_904 ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [49])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH_50  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/M_FIRST_904 ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [50])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH_51  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/M_FIRST_904 ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [51])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH_52  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/M_FIRST_904 ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [52])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH_53  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/M_FIRST_904 ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [53])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH_54  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/M_FIRST_904 ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [54])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH_55  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/M_FIRST_904 ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [55])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH_56  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/M_FIRST_904 ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [56])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH_57  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/M_FIRST_904 ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [57])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH_58  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/M_FIRST_904 ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [58])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH_59  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/M_FIRST_904 ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [59])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH_60  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/M_FIRST_904 ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [60])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH_61  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/M_FIRST_904 ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [61])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH_62  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/M_FIRST_904 ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [62])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH_63  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/MASTER/IRDY/M_FIRST_904 ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/FAIL_ADH [63])
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CBE_0  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(m_cbe_9[0]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CBE_0_903 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CBE_1  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(m_cbe_9[1]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CBE_1_902 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CBE_2  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(m_cbe_9[2]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CBE_2_901 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CBE_3  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(m_cbe_9[3]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CBE_3_900 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CBE_4  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CBE_4_899 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CBE_7  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CBE_7_898 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CBE_5  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CBE_5_897 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CBE_6  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CBE_6_896 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_61  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_61_895 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_63  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_63_894 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_62  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_62_893 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_60  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_60_892 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_59  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_59_891 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_58  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_58_890 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_57  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_57_889 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_54  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_54_888 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_56  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_56_887 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_55  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_55_886 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_51  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_51_885 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_53  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_53_884 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_52  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_52_883 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_48  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_48_882 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_50  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_50_881 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_49  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_49_880 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_47  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_47_879 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_46  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_46_878 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_45  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_45_877 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_44  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_44_876 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_41  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_41_875 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_43  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_43_874 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_42  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_42_873 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_38  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_38_872 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_40  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_40_871 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_39  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_39_870 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_35  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_35_869 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_37  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_37_868 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_36  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_36_867 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_34  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_34_866 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_33  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_33_865 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_32  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_32_864 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_31  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(adio_in_8[31]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_31_863 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_28  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(adio_in_8[28]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_28_862 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_30  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(adio_in_8[30]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_30_861 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_29  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(adio_in_8[29]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_29_860 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_25  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(adio_in_8[25]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_25_859 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_27  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(adio_in_8[27]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_27_858 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_26  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(adio_in_8[26]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_26_857 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_22  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(adio_in_8[22]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_22_856 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_24  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(adio_in_8[24]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_24_855 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_23  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(adio_in_8[23]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_23_854 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_21  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(adio_in_8[21]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_21_853 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_20  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(adio_in_8[20]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_20_852 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_19  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(adio_in_8[19]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_19_851 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_18  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(adio_in_8[18]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_18_850 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_15  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(adio_in_8[15]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_15_849 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_17  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(adio_in_8[17]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_17_848 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_16  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(adio_in_8[16]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_16_847 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_14  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(adio_in_8[14]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_14_846 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_13  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(adio_in_8[13]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_13_845 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_12  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(adio_in_8[12]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_12_844 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_11  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(adio_in_8[11]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_11_843 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_8  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(adio_in_8[8]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_8_842 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_10  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(adio_in_8[10]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_10_841 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_9  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(adio_in_8[9]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_9_840 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_7  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(adio_in_8[7]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_7_839 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_6  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(adio_in_8[6]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_6_838 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_5  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(adio_in_8[5]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_5_837 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_4  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(adio_in_8[4]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_4_836 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_1  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(adio_in_8[1]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_1_835 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_3  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(adio_in_8[3]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_3_834 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_2  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(adio_in_8[2]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_2_833 )
  );
  FDCE   \BU2/U0/pci32_inst/PCI_LC_I/SHADOW_0  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_CE ),
    .CLR(rst),
    .D(adio_in_8[0]),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/SHADOW_0_832 )
  );
  FDP #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_IRDYI  (
    .C(clk),
    .D(irdyd),
    .PRE(rst),
    .Q(NlwRenamedSig_OI_irdyq_n)
  );
  FDP #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_ACK64I  (
    .C(clk),
    .D(\BU2/U0/ff_drive_zero_1_2576 ),
    .PRE(rst),
    .Q(\BU2/ack64q_n )
  );
  FDP #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_STOPI  (
    .C(clk),
    .D(stopd),
    .PRE(rst),
    .Q(NlwRenamedSig_OI_stopq_n)
  );
  FDP #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_PERRI  (
    .C(clk),
    .D(perrd),
    .PRE(rst),
    .Q(NlwRenamedSig_OI_perrq_n)
  );
  FDP #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_IDSELI  (
    .C(clk),
    .D(idseld),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/IDSEL )
  );
  FDP #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_FRAMEI  (
    .C(clk),
    .D(framed),
    .PRE(rst),
    .Q(NlwRenamedSig_OI_frameq_n)
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_IRDYO  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/NS_IRDY_ ),
    .PRE(rst),
    .Q(irdyo)
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_FRAMEO  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/FRAME_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/NS_FRAME_ ),
    .PRE(rst),
    .Q(frameo)
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_REQ64O  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/FRAME_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/NS_REQ64_ ),
    .PRE(rst),
    .Q(\BU2/req64o )
  );
  FDP #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_REQ64I  (
    .C(clk),
    .D(\BU2/U0/ff_drive_zero_1_2576 ),
    .PRE(rst),
    .Q(\BU2/req64q_n )
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_TRDYO  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/NS_TRDY_ ),
    .PRE(rst),
    .Q(trdyo)
  );
  FDP #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_TRDYI  (
    .C(clk),
    .D(trdyd),
    .PRE(rst),
    .Q(NlwRenamedSig_OI_trdyq_n)
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_STOPO  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/NS_STOP_ ),
    .PRE(rst),
    .Q(stopo)
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_DEVSELO  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/NS_DEVSEL_ ),
    .PRE(rst),
    .Q(devselo)
  );
  FDP #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_DEVSELI  (
    .C(clk),
    .D(devseld),
    .PRE(rst),
    .Q(NlwRenamedSig_OI_devselq_n)
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_ACK64O  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/NS_ACK64_ ),
    .PRE(rst),
    .Q(\BU2/ack64o )
  );
  FDP #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_SERRI  (
    .C(clk),
    .D(serrd),
    .PRE(rst),
    .Q(serrq_n)
  );
  FDP #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_PERRO  (
    .C(clk),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/NS_PERR_ ),
    .PRE(rst),
    .Q(perro)
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_PAR64O  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/PAR_CE_818 ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/NS_PAR64 ),
    .PRE(rst),
    .Q(\BU2/par64o )
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/XPCI_PARO  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/PAR_CE_818 ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/NS_PAR ),
    .PRE(rst),
    .Q(paro)
  );
  FDP   \BU2/U0/pci32_inst/PCI_LC_I/ADDR_VLD/FRAMEQ_  (
    .C(clk),
    .D(NlwRenamedSig_OI_frameq_n),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/ADDR_VLD/FRAMEQ__817 )
  );
  FDP   \BU2/U0/pci32_inst/PCI_LC_I/ADDR_VLD/REQ64Q_  (
    .C(clk),
    .D(\BU2/req64q_n ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/ADDR_VLD/REQ64Q__816 )
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/SEL_IN_814 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/OUT_SEL/OUT_SEL_815 )
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/DATA_VLD/M_DATA_VLD  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/DATA_VLD/N0008 ),
    .Q(m_data_vld)
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/DATA_VLD/S_DATA_VLD  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/DATA_VLD/N0014 ),
    .Q(s_data_vld)
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CBEH/XPCI_CBO4  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/CBEOUT [4]),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/CBO [4])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CBEH/XPCI_CBO5  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/CBEOUT [5]),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/CBO [5])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CBEH/XPCI_CBO6  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/CBEOUT [6]),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/CBO [6])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PCI_CBEH/XPCI_CBO7  (
    .C(clk),
    .CE(\BU2/U0/pci32_inst/PCI_LC_I/OUT_CE/HARD_CE ),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/CBEOUT [7]),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/CBO [7])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/IRDY_I_LUT_DELAY_STAGES.IRDY_CREATE_STAGES[1].IRDY_I_DELAY_STAGE  (
    .I0(irdyi),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/IRDY_I_LUT_DELAY_STAGE [1])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PAR64_I_LUT_DELAY_STAGES.PAR64I_CREATE_STAGES[1].PAR64_I_DELAY_STAGE  (
    .I0(\BU2/U0/ff_drive_zero_1_2576 ),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PAR64_I_LUT_DELAY_STAGE [1])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/ACK64_I_LUT_DELAY_STAGES.ACK64I_CREATE_STAGES[1].ACK64_I_DELAY_STAGE  (
    .I0(\BU2/U0/ff_drive_zero_1_2576 ),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ACK64_I_LUT_DELAY_STAGE [1])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PAR_I_LUT_DELAY_STAGES.PARI_CREATE_STAGES[1].PAR_I_DELAY_STAGE  (
    .I0(pari),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PAR_I_LUT_DELAY_STAGE [1])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/STOP_I_LUT_DELAY_STAGES.STOPI_CREATE_STAGES[1].STOP_I_DELAY_STAGE  (
    .I0(stopi),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/STOP_I_LUT_DELAY_STAGE [1])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/FRAME_I_LUT_DELAY_STAGES.FRAMEI_CREATE_STAGES[1].FRAME_I_DELAY_STAGE  (
    .I0(framei),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/FRAME_I_LUT_DELAY_STAGE [1])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/REQ64_I_LUT_DELAY_STAGES.REQ64I_CREATE_STAGES[1].REQ64_I_DELAY_STAGE  (
    .I0(\BU2/U0/ff_drive_zero_1_2576 ),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/REQ64_I_LUT_DELAY_STAGE [1])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/GNT_IN_LUT_DELAY_STAGES.GNT_CREATE_STAGES[1].GNT_IN_DELAY_STAGE  (
    .I0(gnti),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/GNT_IN_LUT_DELAY_STAGE [1])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/TRDY_I_LUT_DELAY_STAGES.TRDY_CREATE_STAGES[1].TRDY_I_DELAY_STAGE  (
    .I0(trdyi),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/TRDY_I_LUT_DELAY_STAGE [1])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/DEVSEL_I_LUT_DELAY_STAGES.DEVSELI_CREATE_STAGES[1].DEVSEL_I_DELAY_STAGE  (
    .I0(devseli),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/DEVSEL_I_LUT_DELAY_STAGE [1])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/CBE_I0_LUT_DELAY_STAGES.CBE_I0_CREATE_STAGES[1].CBE_I0_DELAY_STAGE  (
    .I0(cbi_6[0]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I0_LUT_DELAY_STAGE [1])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/CBE_I1_LUT_DELAY_STAGES.CBE_I1_CREATE_STAGES[1].CBE_I1_DELAY_STAGE  (
    .I0(cbi_6[1]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I1_LUT_DELAY_STAGE [1])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/CBE_I2_LUT_DELAY_STAGES.CBE_I2_CREATE_STAGES[1].CBE_I2_DELAY_STAGE  (
    .I0(cbi_6[2]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I2_LUT_DELAY_STAGE [1])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/CBE_I3_LUT_DELAY_STAGES.CBE_I3_CREATE_STAGES[1].CBE_I3_DELAY_STAGE  (
    .I0(cbi_6[3]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I3_LUT_DELAY_STAGE [1])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/CBE_I4_LUT_DELAY_STAGES.CBE_I4_CREATE_STAGES[1].CBE_I4_DELAY_STAGE  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I4_LUT_DELAY_STAGE [1])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/CBE_I5_LUT_DELAY_STAGES.CBE_I5_CREATE_STAGES[1].CBE_I5_DELAY_STAGE  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I5_LUT_DELAY_STAGE [1])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/CBE_I6_LUT_DELAY_STAGES.CBE_I6_CREATE_STAGES[1].CBE_I6_DELAY_STAGE  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I6_LUT_DELAY_STAGE [1])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/CBE_I7_LUT_DELAY_STAGES.CBE_I7_CREATE_STAGES[1].CBE_I7_DELAY_STAGE  (
    .I0(\NlwRenamedSig_OI_cfg[0] ),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I7_LUT_DELAY_STAGE [1])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/IRDY_I_LUT_DELAY_STAGES.IRDY_CREATE_STAGES[2].IRDY_I_DELAY_STAGE  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/IRDY_I_LUT_DELAY_STAGE [1]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/IRDY_I_LUT_DELAY_STAGE [2])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PAR64_I_LUT_DELAY_STAGES.PAR64I_CREATE_STAGES[2].PAR64_I_DELAY_STAGE  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PAR64_I_LUT_DELAY_STAGE [1]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PAR64_I_LUT_DELAY_STAGE [2])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/ACK64_I_LUT_DELAY_STAGES.ACK64I_CREATE_STAGES[2].ACK64_I_DELAY_STAGE  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/ACK64_I_LUT_DELAY_STAGE [1]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ACK64_I_LUT_DELAY_STAGE [2])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PAR_I_LUT_DELAY_STAGES.PARI_CREATE_STAGES[2].PAR_I_DELAY_STAGE  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PAR_I_LUT_DELAY_STAGE [1]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PAR_I_LUT_DELAY_STAGE [2])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/STOP_I_LUT_DELAY_STAGES.STOPI_CREATE_STAGES[2].STOP_I_DELAY_STAGE  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/STOP_I_LUT_DELAY_STAGE [1]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/STOP_I_LUT_DELAY_STAGE [2])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/FRAME_I_LUT_DELAY_STAGES.FRAMEI_CREATE_STAGES[2].FRAME_I_DELAY_STAGE  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/FRAME_I_LUT_DELAY_STAGE [1]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/FRAME_I_LUT_DELAY_STAGE [2])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/REQ64_I_LUT_DELAY_STAGES.REQ64I_CREATE_STAGES[2].REQ64_I_DELAY_STAGE  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/REQ64_I_LUT_DELAY_STAGE [1]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/REQ64_I_LUT_DELAY_STAGE [2])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/GNT_IN_LUT_DELAY_STAGES.GNT_CREATE_STAGES[2].GNT_IN_DELAY_STAGE  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/GNT_IN_LUT_DELAY_STAGE [1]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/GNT_IN_LUT_DELAY_STAGE [2])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/TRDY_I_LUT_DELAY_STAGES.TRDY_CREATE_STAGES[2].TRDY_I_DELAY_STAGE  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/TRDY_I_LUT_DELAY_STAGE [1]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/TRDY_I_LUT_DELAY_STAGE [2])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/DEVSEL_I_LUT_DELAY_STAGES.DEVSELI_CREATE_STAGES[2].DEVSEL_I_DELAY_STAGE  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/DEVSEL_I_LUT_DELAY_STAGE [1]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/DEVSEL_I_LUT_DELAY_STAGE [2])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/CBE_I0_LUT_DELAY_STAGES.CBE_I0_CREATE_STAGES[2].CBE_I0_DELAY_STAGE  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I0_LUT_DELAY_STAGE [1]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I0_LUT_DELAY_STAGE [2])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/CBE_I1_LUT_DELAY_STAGES.CBE_I1_CREATE_STAGES[2].CBE_I1_DELAY_STAGE  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I1_LUT_DELAY_STAGE [1]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I1_LUT_DELAY_STAGE [2])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/CBE_I2_LUT_DELAY_STAGES.CBE_I2_CREATE_STAGES[2].CBE_I2_DELAY_STAGE  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I2_LUT_DELAY_STAGE [1]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I2_LUT_DELAY_STAGE [2])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/CBE_I3_LUT_DELAY_STAGES.CBE_I3_CREATE_STAGES[2].CBE_I3_DELAY_STAGE  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I3_LUT_DELAY_STAGE [1]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I3_LUT_DELAY_STAGE [2])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/CBE_I4_LUT_DELAY_STAGES.CBE_I4_CREATE_STAGES[2].CBE_I4_DELAY_STAGE  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I4_LUT_DELAY_STAGE [1]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I4_LUT_DELAY_STAGE [2])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/CBE_I5_LUT_DELAY_STAGES.CBE_I5_CREATE_STAGES[2].CBE_I5_DELAY_STAGE  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I5_LUT_DELAY_STAGE [1]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I5_LUT_DELAY_STAGE [2])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/CBE_I6_LUT_DELAY_STAGES.CBE_I6_CREATE_STAGES[2].CBE_I6_DELAY_STAGE  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I6_LUT_DELAY_STAGE [1]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I6_LUT_DELAY_STAGE [2])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/CBE_I7_LUT_DELAY_STAGES.CBE_I7_CREATE_STAGES[2].CBE_I7_DELAY_STAGE  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I7_LUT_DELAY_STAGE [1]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I7_LUT_DELAY_STAGE [2])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/IRDY_I_LUT_DELAY_STAGES.IRDY_CREATE_STAGES[3].IRDY_I_DELAY_STAGE  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/IRDY_I_LUT_DELAY_STAGE [2]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/IRDY_I_LUT_DELAY_STAGE [3])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PAR64_I_LUT_DELAY_STAGES.PAR64I_CREATE_STAGES[3].PAR64_I_DELAY_STAGE  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PAR64_I_LUT_DELAY_STAGE [2]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PAR64_I_LUT_DELAY_STAGE [3])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/ACK64_I_LUT_DELAY_STAGES.ACK64I_CREATE_STAGES[3].ACK64_I_DELAY_STAGE  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/ACK64_I_LUT_DELAY_STAGE [2]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ACK64_I_LUT_DELAY_STAGE [3])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PAR_I_LUT_DELAY_STAGES.PARI_CREATE_STAGES[3].PAR_I_DELAY_STAGE  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PAR_I_LUT_DELAY_STAGE [2]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PAR_I_LUT_DELAY_STAGE [3])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/STOP_I_LUT_DELAY_STAGES.STOPI_CREATE_STAGES[3].STOP_I_DELAY_STAGE  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/STOP_I_LUT_DELAY_STAGE [2]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/STOP_I_LUT_DELAY_STAGE [3])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/FRAME_I_LUT_DELAY_STAGES.FRAMEI_CREATE_STAGES[3].FRAME_I_DELAY_STAGE  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/FRAME_I_LUT_DELAY_STAGE [2]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/FRAME_I_LUT_DELAY_STAGE [3])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/REQ64_I_LUT_DELAY_STAGES.REQ64I_CREATE_STAGES[3].REQ64_I_DELAY_STAGE  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/REQ64_I_LUT_DELAY_STAGE [2]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/REQ64_I_LUT_DELAY_STAGE [3])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/GNT_IN_LUT_DELAY_STAGES.GNT_CREATE_STAGES[3].GNT_IN_DELAY_STAGE  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/GNT_IN_LUT_DELAY_STAGE [2]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/GNT_IN_LUT_DELAY_STAGE [3])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/TRDY_I_LUT_DELAY_STAGES.TRDY_CREATE_STAGES[3].TRDY_I_DELAY_STAGE  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/TRDY_I_LUT_DELAY_STAGE [2]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/TRDY_I_LUT_DELAY_STAGE [3])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/DEVSEL_I_LUT_DELAY_STAGES.DEVSELI_CREATE_STAGES[3].DEVSEL_I_DELAY_STAGE  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/DEVSEL_I_LUT_DELAY_STAGE [2]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/DEVSEL_I_LUT_DELAY_STAGE [3])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/CBE_I0_LUT_DELAY_STAGES.CBE_I0_CREATE_STAGES[3].CBE_I0_DELAY_STAGE  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I0_LUT_DELAY_STAGE [2]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I0_LUT_DELAY_STAGE [3])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/CBE_I1_LUT_DELAY_STAGES.CBE_I1_CREATE_STAGES[3].CBE_I1_DELAY_STAGE  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I1_LUT_DELAY_STAGE [2]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I1_LUT_DELAY_STAGE [3])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/CBE_I2_LUT_DELAY_STAGES.CBE_I2_CREATE_STAGES[3].CBE_I2_DELAY_STAGE  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I2_LUT_DELAY_STAGE [2]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I2_LUT_DELAY_STAGE [3])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/CBE_I3_LUT_DELAY_STAGES.CBE_I3_CREATE_STAGES[3].CBE_I3_DELAY_STAGE  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I3_LUT_DELAY_STAGE [2]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I3_LUT_DELAY_STAGE [3])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/CBE_I4_LUT_DELAY_STAGES.CBE_I4_CREATE_STAGES[3].CBE_I4_DELAY_STAGE  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I4_LUT_DELAY_STAGE [2]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I4_LUT_DELAY_STAGE [3])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/CBE_I5_LUT_DELAY_STAGES.CBE_I5_CREATE_STAGES[3].CBE_I5_DELAY_STAGE  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I5_LUT_DELAY_STAGE [2]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I5_LUT_DELAY_STAGE [3])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/CBE_I6_LUT_DELAY_STAGES.CBE_I6_CREATE_STAGES[3].CBE_I6_DELAY_STAGE  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I6_LUT_DELAY_STAGE [2]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I6_LUT_DELAY_STAGE [3])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/CBE_I7_LUT_DELAY_STAGES.CBE_I7_CREATE_STAGES[3].CBE_I7_DELAY_STAGE  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I7_LUT_DELAY_STAGE [2]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I7_LUT_DELAY_STAGE [3])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/IRDY_I_LUT_DELAY_STAGES.IRDY_CREATE_STAGES[4].IRDY_I_DELAY_STAGE  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/IRDY_I_LUT_DELAY_STAGE [3]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/IRDY_I_LUT_DELAY_STAGE [4])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PAR64_I_LUT_DELAY_STAGES.PAR64I_CREATE_STAGES[4].PAR64_I_DELAY_STAGE  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PAR64_I_LUT_DELAY_STAGE [3]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PAR64_I_LUT_DELAY_STAGE [4])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/ACK64_I_LUT_DELAY_STAGES.ACK64I_CREATE_STAGES[4].ACK64_I_DELAY_STAGE  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/ACK64_I_LUT_DELAY_STAGE [3]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/ACK64_I_LUT_DELAY_STAGE [4])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/PAR_I_LUT_DELAY_STAGES.PARI_CREATE_STAGES[4].PAR_I_DELAY_STAGE  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/PAR_I_LUT_DELAY_STAGE [3]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/PAR_I_LUT_DELAY_STAGE [4])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/STOP_I_LUT_DELAY_STAGES.STOPI_CREATE_STAGES[4].STOP_I_DELAY_STAGE  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/STOP_I_LUT_DELAY_STAGE [3]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/STOP_I_LUT_DELAY_STAGE [4])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/FRAME_I_LUT_DELAY_STAGES.FRAMEI_CREATE_STAGES[4].FRAME_I_DELAY_STAGE  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/FRAME_I_LUT_DELAY_STAGE [3]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/FRAME_I_LUT_DELAY_STAGE [4])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/REQ64_I_LUT_DELAY_STAGES.REQ64I_CREATE_STAGES[4].REQ64_I_DELAY_STAGE  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/REQ64_I_LUT_DELAY_STAGE [3]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/REQ64_I_LUT_DELAY_STAGE [4])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/GNT_IN_LUT_DELAY_STAGES.GNT_CREATE_STAGES[4].GNT_IN_DELAY_STAGE  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/GNT_IN_LUT_DELAY_STAGE [3]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/GNT_IN_LUT_DELAY_STAGE [4])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/TRDY_I_LUT_DELAY_STAGES.TRDY_CREATE_STAGES[4].TRDY_I_DELAY_STAGE  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/TRDY_I_LUT_DELAY_STAGE [3]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/TRDY_I_LUT_DELAY_STAGE [4])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/DEVSEL_I_LUT_DELAY_STAGES.DEVSELI_CREATE_STAGES[4].DEVSEL_I_DELAY_STAGE  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/DEVSEL_I_LUT_DELAY_STAGE [3]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/DEVSEL_I_LUT_DELAY_STAGE [4])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/CBE_I0_LUT_DELAY_STAGES.CBE_I0_CREATE_STAGES[4].CBE_I0_DELAY_STAGE  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I0_LUT_DELAY_STAGE [3]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I0_LUT_DELAY_STAGE [4])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/CBE_I1_LUT_DELAY_STAGES.CBE_I1_CREATE_STAGES[4].CBE_I1_DELAY_STAGE  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I1_LUT_DELAY_STAGE [3]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I1_LUT_DELAY_STAGE [4])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/CBE_I2_LUT_DELAY_STAGES.CBE_I2_CREATE_STAGES[4].CBE_I2_DELAY_STAGE  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I2_LUT_DELAY_STAGE [3]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I2_LUT_DELAY_STAGE [4])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/CBE_I3_LUT_DELAY_STAGES.CBE_I3_CREATE_STAGES[4].CBE_I3_DELAY_STAGE  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I3_LUT_DELAY_STAGE [3]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I3_LUT_DELAY_STAGE [4])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/CBE_I4_LUT_DELAY_STAGES.CBE_I4_CREATE_STAGES[4].CBE_I4_DELAY_STAGE  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I4_LUT_DELAY_STAGE [3]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I4_LUT_DELAY_STAGE [4])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/CBE_I5_LUT_DELAY_STAGES.CBE_I5_CREATE_STAGES[4].CBE_I5_DELAY_STAGE  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I5_LUT_DELAY_STAGE [3]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I5_LUT_DELAY_STAGE [4])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/CBE_I6_LUT_DELAY_STAGES.CBE_I6_CREATE_STAGES[4].CBE_I6_DELAY_STAGE  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I6_LUT_DELAY_STAGE [3]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I6_LUT_DELAY_STAGE [4])
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  \BU2/U0/pci32_inst/PCI_LC_I/CBE_I7_LUT_DELAY_STAGES.CBE_I7_CREATE_STAGES[4].CBE_I7_DELAY_STAGE  (
    .I0(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I7_LUT_DELAY_STAGE [3]),
    .I1(NlwRenamedSig_OI_base_hit[3]),
    .I2(NlwRenamedSig_OI_base_hit[3]),
    .I3(NlwRenamedSig_OI_base_hit[3]),
    .I4(NlwRenamedSig_OI_base_hit[3]),
    .I5(NlwRenamedSig_OI_base_hit[3]),
    .O(\BU2/U0/pci32_inst/PCI_LC_I/CBE_I7_LUT_DELAY_STAGE [4])
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/EOT/EOT_DL  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/EOT/EOT_733 ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/EOT/EOT_DL_734 )
  );
  FDC   \BU2/U0/pci32_inst/PCI_LC_I/EOT/EOT  (
    .C(clk),
    .CLR(rst),
    .D(\BU2/U0/pci32_inst/PCI_LC_I/EOT/OEOT_D ),
    .Q(\BU2/U0/pci32_inst/PCI_LC_I/EOT/EOT_733 )
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_CBI0  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(cbd_7[0]),
    .PRE(rst),
    .Q(NlwRenamedSig_OI_s_cbe[0])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_CBI1  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(cbd_7[1]),
    .PRE(rst),
    .Q(NlwRenamedSig_OI_s_cbe[1])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_CBI2  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(cbd_7[2]),
    .PRE(rst),
    .Q(NlwRenamedSig_OI_s_cbe[2])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_CBI3  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(cbd_7[3]),
    .PRE(rst),
    .Q(NlwRenamedSig_OI_s_cbe[3])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_CBI4  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/S_CBE [4])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_CBI5  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/S_CBE [5])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_CBI6  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/S_CBE [6])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_CBI7  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/S_CBE [7])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI0  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(add_4[0]),
    .PRE(rst),
    .Q(NlwRenamedSig_OI_adio_out[0])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI1  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(add_4[1]),
    .PRE(rst),
    .Q(NlwRenamedSig_OI_adio_out[1])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI2  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(add_4[2]),
    .PRE(rst),
    .Q(NlwRenamedSig_OI_adio_out[2])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI3  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(add_4[3]),
    .PRE(rst),
    .Q(NlwRenamedSig_OI_adio_out[3])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI4  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(add_4[4]),
    .PRE(rst),
    .Q(NlwRenamedSig_OI_adio_out[4])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI5  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(add_4[5]),
    .PRE(rst),
    .Q(NlwRenamedSig_OI_adio_out[5])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI6  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(add_4[6]),
    .PRE(rst),
    .Q(NlwRenamedSig_OI_adio_out[6])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI7  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(add_4[7]),
    .PRE(rst),
    .Q(NlwRenamedSig_OI_adio_out[7])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI8  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(add_4[8]),
    .PRE(rst),
    .Q(NlwRenamedSig_OI_adio_out[8])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI9  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(add_4[9]),
    .PRE(rst),
    .Q(NlwRenamedSig_OI_adio_out[9])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI10  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(add_4[10]),
    .PRE(rst),
    .Q(NlwRenamedSig_OI_adio_out[10])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI11  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(add_4[11]),
    .PRE(rst),
    .Q(NlwRenamedSig_OI_adio_out[11])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI12  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(add_4[12]),
    .PRE(rst),
    .Q(NlwRenamedSig_OI_adio_out[12])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI13  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(add_4[13]),
    .PRE(rst),
    .Q(NlwRenamedSig_OI_adio_out[13])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI14  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(add_4[14]),
    .PRE(rst),
    .Q(NlwRenamedSig_OI_adio_out[14])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI15  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(add_4[15]),
    .PRE(rst),
    .Q(NlwRenamedSig_OI_adio_out[15])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI16  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(add_4[16]),
    .PRE(rst),
    .Q(NlwRenamedSig_OI_adio_out[16])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI17  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(add_4[17]),
    .PRE(rst),
    .Q(NlwRenamedSig_OI_adio_out[17])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI18  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(add_4[18]),
    .PRE(rst),
    .Q(NlwRenamedSig_OI_adio_out[18])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI19  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(add_4[19]),
    .PRE(rst),
    .Q(NlwRenamedSig_OI_adio_out[19])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI20  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(add_4[20]),
    .PRE(rst),
    .Q(NlwRenamedSig_OI_adio_out[20])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI21  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(add_4[21]),
    .PRE(rst),
    .Q(NlwRenamedSig_OI_adio_out[21])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI22  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(add_4[22]),
    .PRE(rst),
    .Q(NlwRenamedSig_OI_adio_out[22])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI23  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(add_4[23]),
    .PRE(rst),
    .Q(NlwRenamedSig_OI_adio_out[23])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI24  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(add_4[24]),
    .PRE(rst),
    .Q(NlwRenamedSig_OI_adio_out[24])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI25  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(add_4[25]),
    .PRE(rst),
    .Q(NlwRenamedSig_OI_adio_out[25])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI26  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(add_4[26]),
    .PRE(rst),
    .Q(NlwRenamedSig_OI_adio_out[26])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI27  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(add_4[27]),
    .PRE(rst),
    .Q(NlwRenamedSig_OI_adio_out[27])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI28  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(add_4[28]),
    .PRE(rst),
    .Q(NlwRenamedSig_OI_adio_out[28])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI29  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(add_4[29]),
    .PRE(rst),
    .Q(NlwRenamedSig_OI_adio_out[29])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI30  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(add_4[30]),
    .PRE(rst),
    .Q(NlwRenamedSig_OI_adio_out[30])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI31  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(add_4[31]),
    .PRE(rst),
    .Q(NlwRenamedSig_OI_adio_out[31])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI32  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADIO_OUT [32])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI33  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADIO_OUT [33])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI34  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADIO_OUT [34])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI35  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADIO_OUT [35])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI36  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADIO_OUT [36])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI37  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADIO_OUT [37])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI38  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADIO_OUT [38])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI39  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADIO_OUT [39])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI40  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADIO_OUT [40])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI41  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADIO_OUT [41])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI42  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADIO_OUT [42])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI43  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADIO_OUT [43])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI44  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADIO_OUT [44])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI45  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADIO_OUT [45])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI46  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADIO_OUT [46])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI47  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADIO_OUT [47])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI48  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADIO_OUT [48])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI49  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADIO_OUT [49])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI50  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADIO_OUT [50])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI51  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADIO_OUT [51])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI52  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADIO_OUT [52])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI53  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADIO_OUT [53])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI54  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADIO_OUT [54])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI55  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADIO_OUT [55])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI56  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADIO_OUT [56])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI57  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADIO_OUT [57])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI58  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADIO_OUT [58])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI59  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADIO_OUT [59])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI60  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADIO_OUT [60])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI61  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADIO_OUT [61])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI62  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADIO_OUT [62])
  );
  FDPE #(
    .INIT ( 1'b1 ))
  \BU2/U0/pci32_inst/XPCI_ADI63  (
    .C(clk),
    .CE(\NlwRenamedSig_OI_csr[25] ),
    .D(\NlwRenamedSig_OI_cfg[0] ),
    .PRE(rst),
    .Q(\BU2/U0/pci32_inst/ADIO_OUT [63])
  );
  GND   \BU2/U0/pci32_inst/XST_GND  (
    .G(NlwRenamedSig_OI_base_hit[3])
  );
  VCC   \BU2/U0/pci32_inst/XST_VCC  (
    .P(\NlwRenamedSig_OI_csr[25] )
  );

// synthesis translate_on

endmodule

// synthesis translate_off

`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

// synthesis translate_on
