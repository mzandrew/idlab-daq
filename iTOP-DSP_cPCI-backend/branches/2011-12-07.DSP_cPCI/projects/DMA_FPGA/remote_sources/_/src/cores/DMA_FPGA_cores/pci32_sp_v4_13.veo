/*******************************************************************************
*     (c) Copyright 1995 - 2010 Xilinx, Inc. All rights reserved.              *
*                                                                              *
*     This file contains confidential and proprietary information              *
*     of Xilinx, Inc. and is protected under U.S. and                          *
*     international copyright and other intellectual property                  *
*     laws.                                                                    *
*                                                                              *
*     DISCLAIMER                                                               *
*     This disclaimer is not a license and does not grant any                  *
*     rights to the materials distributed herewith. Except as                  *
*     otherwise provided in a valid license issued to you by                   *
*     Xilinx, and to the maximum extent permitted by applicable                *
*     law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND                  *
*     WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES              *
*     AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING                *
*     BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-                   *
*     INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and                 *
*     (2) Xilinx shall not be liable (whether in contract or tort,             *
*     including negligence, or under any other theory of                       *
*     liability) for any loss or damage of any kind or nature                  *
*     related to, arising under or in connection with these                    *
*     materials, including for any direct, or any indirect,                    *
*     special, incidental, or consequential loss or damage                     *
*     (including loss of data, profits, goodwill, or any type of               *
*     loss or damage suffered as a result of any action brought                *
*     by a third party) even if such damage or loss was                        *
*     reasonably foreseeable or Xilinx had been advised of the                 *
*     possibility of the same.                                                 *
*                                                                              *
*     CRITICAL APPLICATIONS                                                    *
*     Xilinx products are not designed or intended to be fail-                 *
*     safe, or for use in any application requiring fail-safe                  *
*     performance, such as life-support or safety devices or                   *
*     systems, Class III medical devices, nuclear facilities,                  *
*     applications related to the deployment of airbags, or any                *
*     other applications that could lead to death, personal                    *
*     injury, or severe property or environmental damage                       *
*     (individually and collectively, "Critical                                *
*     Applications"). Customer assumes the sole risk and                       *
*     liability of any use of Xilinx products in Critical                      *
*     Applications, subject only to applicable laws and                        *
*     regulations governing limitations on product liability.                  *
*                                                                              *
*     THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS                 *
*     PART OF THIS FILE AT ALL TIMES.                                          *
*******************************************************************************/
// The following must be inserted into your Verilog file for this
// core to be instantiated. Change the instance name and port connections
// (in parentheses) to your own signal names.

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
pci32_sp_v4_13 YourInstanceName (
	.ado(ado), // ouput [31 : 0] ado
	.adi(adi), // input [31 : 0] adi
	.add(add), // input [31 : 0] add
	.adt(adt), // ouput [31 : 0] adt
	.cbo(cbo), // ouput [3 : 0] cbo
	.cbi(cbi), // input [3 : 0] cbi
	.cbd(cbd), // input [3 : 0] cbd
	.cbt(cbt), // ouput [3 : 0] cbt
	.paro(paro), // ouput paro
	.pari(pari), // input pari
	.pard(pard), // input pard
	.part(part), // ouput part
	.frameo(frameo), // ouput frameo
	.framei(framei), // input framei
	.framed(framed), // input framed
	.framet(framet), // ouput framet
	.trdyo(trdyo), // ouput trdyo
	.trdyi(trdyi), // input trdyi
	.trdyd(trdyd), // input trdyd
	.trdyt(trdyt), // ouput trdyt
	.irdyo(irdyo), // ouput irdyo
	.irdyi(irdyi), // input irdyi
	.irdyd(irdyd), // input irdyd
	.irdyt(irdyt), // ouput irdyt
	.stopo(stopo), // ouput stopo
	.stopi(stopi), // input stopi
	.stopd(stopd), // input stopd
	.stopt(stopt), // ouput stopt
	.devselo(devselo), // ouput devselo
	.devseli(devseli), // input devseli
	.devseld(devseld), // input devseld
	.devselt(devselt), // ouput devselt
	.perro(perro), // ouput perro
	.perri(perri), // input perri
	.perrd(perrd), // input perrd
	.perrt(perrt), // ouput perrt
	.serro(serro), // ouput serro
	.serri(serri), // input serri
	.serrd(serrd), // input serrd
	.serrt(serrt), // ouput serrt
	.into(into), // ouput into
	.intt(intt), // ouput intt
	.pmeo(pmeo), // ouput pmeo
	.pmet(pmet), // ouput pmet
	.reqo(reqo), // ouput reqo
	.reqt(reqt), // ouput reqt
	.gnti(gnti), // input gnti
	.gntd(gntd), // input gntd
	.idseli(idseli), // input idseli
	.idseld(idseld), // input idseld
	.frameq_n(frameq_n), // ouput frameq_n
	.trdyq_n(trdyq_n), // ouput trdyq_n
	.irdyq_n(irdyq_n), // ouput irdyq_n
	.stopq_n(stopq_n), // ouput stopq_n
	.devselq_n(devselq_n), // ouput devselq_n
	.addr(addr), // ouput [31 : 0] addr
	.adio_in(adio_in), // input [31 : 0] adio_in
	.adio_out(adio_out), // ouput [31 : 0] adio_out
	.cfg_vld(cfg_vld), // ouput cfg_vld
	.cfg_hit(cfg_hit), // ouput cfg_hit
	.c_term(c_term), // input c_term
	.c_ready(c_ready), // input c_ready
	.addr_vld(addr_vld), // ouput addr_vld
	.base_hit(base_hit), // ouput [7 : 0] base_hit
	.s_term(s_term), // input s_term
	.s_ready(s_ready), // input s_ready
	.s_abort(s_abort), // input s_abort
	.s_wrdn(s_wrdn), // ouput s_wrdn
	.s_src_en(s_src_en), // ouput s_src_en
	.s_data_vld(s_data_vld), // ouput s_data_vld
	.s_cbe(s_cbe), // ouput [3 : 0] s_cbe
	.pci_cmd(pci_cmd), // ouput [15 : 0] pci_cmd
	.request(request), // input request
	.requesthold(requesthold), // input requesthold
	.complete(complete), // input complete
	.m_wrdn(m_wrdn), // input m_wrdn
	.m_ready(m_ready), // input m_ready
	.m_src_en(m_src_en), // ouput m_src_en
	.m_data_vld(m_data_vld), // ouput m_data_vld
	.m_cbe(m_cbe), // input [3 : 0] m_cbe
	.time_out(time_out), // ouput time_out
	.cfg_self(cfg_self), // input cfg_self
	.m_data(m_data), // ouput m_data
	.dr_bus(dr_bus), // ouput dr_bus
	.i_idle(i_idle), // ouput i_idle
	.m_addr_n(m_addr_n), // ouput m_addr_n
	.idle(idle), // ouput idle
	.b_busy(b_busy), // ouput b_busy
	.s_data(s_data), // ouput s_data
	.backoff(backoff), // ouput backoff
	.int_n(int_n), // input int_n
	.pme_n(pme_n), // input pme_n
	.perrq_n(perrq_n), // ouput perrq_n
	.serrq_n(serrq_n), // ouput serrq_n
	.keepout(keepout), // input keepout
	.csr(csr), // ouput [39 : 0] csr
	.pciw_en(pciw_en), // ouput pciw_en
	.bw_detect_dis(bw_detect_dis), // input bw_detect_dis
	.bw_manual_32b(bw_manual_32b), // input bw_manual_32b
	.pcix_en(pcix_en), // ouput pcix_en
	.bm_detect_dis(bm_detect_dis), // input bm_detect_dis
	.bm_manual_pci(bm_manual_pci), // input bm_manual_pci
	.rtr(rtr), // ouput rtr
	.rst(rst), // input rst
	.cfg(cfg), // ouput [511 : 0] cfg
	.clk(clk)); // input clk

// INST_TAG_END ------ End INSTANTIATION Template ---------
