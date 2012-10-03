`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:22:59 08/05/2008 
// Design Name: 
// Module Name:    PCI_GUEST
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: Wrapper for OpenCores PCI bridge. The OpenCores PCI bridge
//              has a lot more inputs/outputs than are needed for a top-level
//					 block (for instance, several I/O ports are specced as I/O/OE)
//					 so this wraps them into something that a top-level schematic can
//              use. Also, Xilinx software gets pissy if you don't have ports in
//              a symbol even if you don't use them, so this trims the unused ports
//              for a given implementation, too.
//
//              Also allows separate symbols for different implementations.
//              This is a GUEST implementation.
//              It might be smart to merge this with the
//              "pci_user_constants.v" file.
//              Note that this breaks all of their nice "coding guidelines" stuff,
//              but I don't really care.
// Dependencies: The OpenCores PCI Bridge implementation (pci_bridge32.v)
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module PCI_GUEST(
// PCI ports
		input PCI_CLK,				// PCI clock
		input PCI_RST,				// PCI RST#
		output PCI_INTA,			// PCI INTA#
		output PCI_REQ,			// PCI REQ#
		input PCI_GNT,				// PCI GNT#
		inout PCI_FRAME,		 	// PCI FRAME#
		inout PCI_IRDY,		 	// PCI IRDY#
		inout PCI_DEVSEL,		 	// PCI DEVSEL#
		inout PCI_TRDY,	 	 	// PCI TRDY#
		inout PCI_STOP,		 	// PCI STOP#
		inout [31:0] PCI_AD,  	// PCI address/data bus
		inout [3:0] PCI_CBE,  	// PCI command/byte enable bus
		input PCI_IDSEL,		 	// PCI IDSEL
		inout PCI_PAR,			 	// PCI PAR
		inout PCI_PERR,		 	// PCI PERR#
		output PCI_SERR,		 	// PCI SERR#
// WISHBONE Slave ports
		input WB_CLK,			 	// WISHBONE clock
		output WB_RST,			 	// WISHBONE reset output (from PCI RST#)
		input WB_INT,			 	// WISHBONE interrupt input (causes PCI_INTA# assertion)
		input [31:0] WBS_ADR_I,	// WISHBONE slave address input
		input [31:0] WBS_DAT_I, // WISHBONE slave data input
		output [31:0] WBS_DAT_O,// WISHBONE slave data output
		input [3:0] WBS_SEL_I,	// WISHBONE slave byte select
		input WBS_CYC_I,			// WISHBONE slave CYC_I input (bus cycle active signal)
		input WBS_STB_I,			// WISHBONE slave STB_I input (data strobe signal)
		input WBS_WE_I,			// WISHBONE slave WE_I input	(write enable signal)
		input WBS_CAB_I,			// WISHBONE slave CAB_I input (block cycle signal)
		input [2:0] WBS_CTI_I,	// WISHBONE slave CTI_I input (reg. feedback identifier)
		input [1:0] WBS_BTE_I,	// WISHBONE slave BTE_I input (reg. feedback burst type)
		output WBS_ACK_O,			// WISHBONE slave ACK_O output (acknowledge)
		output WBS_RTY_O,			// WISHBONE slave RTY_O output (retry)
		output WBS_ERR_O,			// WISHBONE slave ERR_O output (error)
// WISHBONE Master ports
		output [31:0] WBM_ADR_O,// WISHBONE master address output
		input [31:0] WBM_DAT_I,	// WISHBONE master data input
		output [31:0] WBM_DAT_O,// WISHBONE master data output
		output [3:0] WBM_SEL_O, // WISHBONE master byte select output
		output WBM_CYC_O,			// WISHBONE master CYC_O output
		output WBM_STB_O,			// WISHBONE master STB_O output
		output WBM_WE_O,			// WISHBONE master WE_O output
		output WBM_CAB_O,			// WISHBONE master CAB_O output
		output [2:0] WBM_CTI_O,	// WISHBONE master CTI_O output
		output [1:0] WBM_BTE_O,	// WISHBONE master BTE_O output
		input WBM_ACK_I,			// WISHBONE master ACK_I input
		input WBM_RTY_I,			// WISHBONE master RTY_I input
		input WBM_ERR_I			// WISHBONE master ERR_I input
    );

	// All the tristates get merged here. OpenCores doesn't like inouts,
	// so we generate them here.

	wire pci_inta_o;
	wire pci_inta_oe;
	assign PCI_INTA = (!pci_inta_oe) ? pci_inta_o : 1'bZ;
	
	wire pci_req_o;
	wire pci_req_oe;
	assign PCI_REQ = (!pci_req_oe) ? pci_req_o : 1'bZ;
	
	wire pci_frame_o;
	wire pci_frame_oe;
	assign PCI_FRAME = (!pci_frame_oe) ? pci_frame_o : 1'bZ;
	
	wire pci_irdy_o;
	wire pci_irdy_oe;
	assign PCI_IRDY = (!pci_irdy_oe) ? pci_irdy_o : 1'bZ;
	
	wire pci_devsel_o;
	wire pci_devsel_oe;
	assign PCI_DEVSEL = (!pci_devsel_oe) ? pci_devsel_o : 1'bZ;
	
	wire pci_trdy_o;
	wire pci_trdy_oe;
	assign PCI_TRDY = (!pci_trdy_oe) ? pci_trdy_o : 1'bZ;
	
	wire pci_stop_o;
	wire pci_stop_oe;
	assign PCI_STOP = (!pci_stop_oe) ? pci_stop_o : 1'bZ;
	
	wire [31:0] pci_ad_o;
	wire [31:0] pci_ad_oe;
	generate
	genvar pci_adIt;
	for (pci_adIt=0;pci_adIt<32;pci_adIt=pci_adIt+1) begin : PCI_AD_LOOP
		assign PCI_AD[pci_adIt] = (!pci_ad_oe[pci_adIt]) ? pci_ad_o[pci_adIt] : 1'bZ;
	end
	endgenerate
	
	wire [3:0] pci_cbe_o;
	wire [3:0] pci_cbe_oe;
	generate
	genvar pci_cbeIt;
	for (pci_cbeIt=0;pci_cbeIt<4;pci_cbeIt=pci_cbeIt+1) begin : PCI_CBE_LOOP
		assign PCI_CBE[pci_cbeIt] = (!pci_cbe_oe[pci_cbeIt]) ? pci_cbe_o[pci_cbeIt] : 1'bZ;
	end
	endgenerate
	
	wire pci_par_o;
	wire pci_par_oe;
	assign PCI_PAR = (!pci_par_oe) ? pci_par_o : 1'bZ;
	
	wire pci_perr_o;
	wire pci_perr_oe;
	assign PCI_PERR = (!pci_perr_oe) ? pci_perr_o : 1'bZ;
	
	wire pci_serr_o;
	wire pci_serr_oe;
	assign PCI_SERR = (!pci_serr_oe) ? pci_serr_o : 1'bZ;
	
	pci_bridge32 bridge(
// PCI
		.pci_clk_i(PCI_CLK),
		.pci_rst_i(PCI_RST),
		.pci_inta_o(pci_inta_o),
		.pci_inta_oe_o(pci_inta_oe),

		.pci_req_o(pci_req_o),
		.pci_req_oe_o(pci_req_oe),

		.pci_gnt_i(PCI_GNT),

		.pci_frame_i(PCI_FRAME),
		.pci_frame_o(pci_frame_o),
		.pci_frame_oe_o(pci_frame_oe),
		
		.pci_irdy_i(PCI_IRDY),
		.pci_irdy_o(pci_irdy_o),
		.pci_irdy_oe_o(pci_irdy_oe),
		
		.pci_devsel_i(PCI_DEVSEL),
		.pci_devsel_o(pci_devsel_o),
		.pci_devsel_oe_o(pci_devsel_oe),
		
		.pci_trdy_i(PCI_TRDY),
		.pci_trdy_o(pci_trdy_o),
		.pci_trdy_oe_o(pci_trdy_oe),
		
		.pci_stop_i(PCI_STOP),
		.pci_stop_o(pci_stop_o),
		.pci_stop_oe_o(pci_stop_oe),
		
		.pci_ad_i(PCI_AD),
		.pci_ad_o(pci_ad_o),
		.pci_ad_oe_o(pci_ad_oe),
		
		.pci_cbe_i(PCI_CBE),
		.pci_cbe_o(pci_cbe_o),
		.pci_cbe_oe_o(pci_cbe_oe),
		
		.pci_idsel_i(PCI_IDSEL),
		
		.pci_par_i(PCI_PAR),
		.pci_par_o(pci_par_o),
		.pci_par_oe_o(pci_par_oe),
		
		.pci_perr_i(PCI_PERR),
		.pci_perr_o(pci_perr_o),
		.pci_perr_oe_o(pci_perr_oe),
		
		.pci_serr_o(pci_serr_o),
		.pci_serr_oe_o(pci_serr_oe),
// WISHBONE Common
		.wb_clk_i(WB_CLK),
		.wb_rst_o(WB_RST),
		.wb_int_i(WB_INT),
		.wb_rst_i(1'b0),
		.wb_int_o(),
		.pci_rst_o(),
		.pci_inta_i(1'b1),
		.pci_rst_oe_o(),
// WISHBONE slave
		.wbs_adr_i(WBS_ADR_I),
		.wbs_dat_i(WBS_DAT_I),
		.wbs_dat_o(WBS_DAT_O),
		.wbs_sel_i(WBS_SEL_I),
		.wbs_cyc_i(WBS_CYC_I),
		.wbs_stb_i(WBS_STB_I),
		.wbs_we_i(WBS_WE_I),
		.wbs_cti_i(WBS_CTI_I),
		.wbs_bte_i(WBS_BTE_I),
		.wbs_ack_o(WBS_ACK_O),
		.wbs_rty_o(WBS_RTY_O),
		.wbs_err_o(WBS_ERR_O),
// WISHBONE master
		.wbm_adr_o(WBM_ADR_O),
		.wbm_dat_i(WBM_DAT_I),
		.wbm_dat_o(WBM_DAT_O),
		.wbm_sel_o(WBM_SEL_O),
		.wbm_cyc_o(WBM_CYC_O),
		.wbm_stb_o(WBM_STB_O),
		.wbm_we_o(WBM_WE_O),
		.wbm_cti_o(WBM_CTI_O),
		.wbm_bte_o(WBM_BTE_O),
		.wbm_ack_i(WBM_ACK_I),
		.wbm_rty_i(WBM_RTY_I),
		.wbm_err_i(WBM_ERR_I)
		);
		
endmodule
