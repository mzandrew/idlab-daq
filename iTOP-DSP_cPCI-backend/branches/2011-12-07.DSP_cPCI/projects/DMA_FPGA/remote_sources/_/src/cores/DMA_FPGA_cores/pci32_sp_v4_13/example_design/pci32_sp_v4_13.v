//-----------------------------------------------------------------------------
//
// This file contains confidential and proprietary information 
// of Xilinx, Inc. and is protected under U.S. and             
// international copyright and other intellectual property     
// laws.                                                       
//                                                             
// DISCLAIMER                                                  
// This disclaimer is not a license and does not grant any     
// rights to the materials distributed herewith. Except as     
// otherwise provided in a valid license issued to you by      
// Xilinx, and to the maximum extent permitted by applicable   
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND     
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES 
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING   
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-      
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and    
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of          
// liability) for any loss or damage of any kind or nature     
// related to, arising under or in connection with these       
// materials, including for any direct, or any indirect,       
// special, incidental, or consequential loss or damage        
// (including loss of data, profits, goodwill, or any type of  
// loss or damage suffered as a result of any action brought   
// by a third party) even if such damage or loss was           
// reasonably foreseeable or Xilinx had been advised of the    
// possibility of the same.                                    
//                                                             
// CRITICAL APPLICATIONS                                       
// Xilinx products are not designed or intended to be fail-    
// safe, or for use in any application requiring fail-safe     
// performance, such as life-support or safety devices or      
// systems, Class III medical devices, nuclear facilities,     
// applications related to the deployment of airbags, or any   
// other applications that could lead to death, personal       
// injury, or severe property or environmental damage          
// (individually and collectively, "Critical                   
// Applications"). Customer assumes the sole risk and          
// liability of any use of Xilinx products in Critical         
// Applications, subject only to applicable laws and           
// regulations governing limitations on product liability.     
//                                                                                
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS    
// PART OF THIS FILE AT ALL TIMES.                             
//-----------------------------------------------------------------------------
// Project    : LogiCORE IP Initiator/Target for PCI
// File       : pci32_sp_v4_13.v

`timescale 1 ns/1 ps

module pci32_sp_v4_13 (
  s_wrdn, trdyi, trdyd, keepout, trdyo, dr_bus, pcix_en, trdyt, backoff, irdyi, irdyd, irdyq_n, cfg_self, irdyo, s_ready, int_n, bm_detect_dis, s_data_vld,
irdyt, idseli, idseld, complete, pciw_en, s_src_en, into, intt, pari, pard, paro, part, s_abort, s_data, idle, perri, perrd, perro, cfg_vld, perrt,
m_wrdn, time_out, c_term, trdyq_n, requesthold, stopi, stopd, clk, serrq_n, stopo, b_busy, bw_manual_32b, request, stopt, m_addr_n, pme_n, rst,
m_ready, gnti, gntd, rtr, frameq_n, serri, serrd, addr_vld, serro, bw_detect_dis, serrt, devseli, devseld, s_term, perrq_n, devselo,
bm_manual_pci, devselt, c_ready, cfg_hit, reqo, m_data, framei, framed, devselq_n, m_data_vld, m_src_en, reqt, pmeo, frameo,
i_idle, pmet, stopq_n, framet, base_hit, m_cbe, cbi, cbd, cbo, cbt, cfg, adio_out, adio_in, s_cbe, adi, add, ado, adt, pci_cmd, csr, addr
);
  output s_wrdn;
  input trdyi;
  input trdyd;
  input keepout;
  output trdyo;
  output dr_bus;
  output pcix_en;
  output trdyt;
  output backoff;
  input irdyi;
  input irdyd;
  output irdyq_n;
  input cfg_self;
  output irdyo;
  input s_ready;
  input int_n;
  input bm_detect_dis;
  output s_data_vld;
  output irdyt;
  input idseli;
  input idseld;
  input complete;
  output pciw_en;
  output s_src_en;
  output into;
  output intt;
  input pari;
  input pard;
  output paro;
  output part;
  input s_abort;
  output s_data;
  output idle;
  input perri;
  input perrd;
  output perro;
  output cfg_vld;
  output perrt;
  input m_wrdn;
  output time_out;
  input c_term;
  output trdyq_n;
  input requesthold;
  input stopi;
  input stopd;
  input clk;
  output serrq_n;
  output stopo;
  output b_busy;
  input bw_manual_32b;
  input request;
  output stopt;
  output m_addr_n;
  input pme_n;
  input rst;
  input m_ready;
  input gnti;
  input gntd;
  output rtr;
  output frameq_n;
  input serri;
  input serrd;
  output addr_vld;
  output serro;
  input bw_detect_dis;
  output serrt;
  input devseli;
  input devseld;
  input s_term;
  output perrq_n;
  output devselo;
  input bm_manual_pci;
  output devselt;
  input c_ready;
  output cfg_hit;
  output reqo;
  output m_data;
  input framei;
  input framed;
  output devselq_n;
  output m_data_vld;
  output m_src_en;
  output reqt;
  output pmeo;
  output frameo;
  output i_idle;
  output pmet;
  output stopq_n;
  output framet;
  output [7 : 0] base_hit;
  output [511 : 0] cfg;
  output [15 : 0] pci_cmd;
  output [39 : 0] csr;
  output [31 : 0] addr;
  input [3 : 0] m_cbe;
  output [3 : 0] s_cbe;
  input [3 : 0] cbi;
  input [3 : 0] cbd;
  output [3 : 0] cbo;
  output [3 : 0] cbt;
  output [31 : 0] adio_out;
  input [31 : 0] adio_in;
  input [31 : 0] adi;
  input [31 : 0] add;
  output [31 : 0] ado;
  output [31 : 0] adt;

endmodule
