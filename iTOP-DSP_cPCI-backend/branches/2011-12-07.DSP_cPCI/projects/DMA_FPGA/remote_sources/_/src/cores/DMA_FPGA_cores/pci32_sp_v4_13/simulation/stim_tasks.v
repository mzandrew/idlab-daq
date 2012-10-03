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
// File       : stim_tasks.v
/***********************************************************************

  File:   stim_tasks.v
  Rev:    4.13

  This is a functional simulation model for a stimulus generator.
  This is not synthesizable.  This file is only for simulation.

***********************************************************************/

  // Task for resetting the bus in various
  // busmodes.  This must be called to
  // properly initialize the core.
  //----------------------------------------
  task RESET_BUS_AS;
    input [1:0] clk_rate;
    input       bus_width;
    input       bus_mode;
  begin
    tb_state        <= "SYSTEM RESET";
    if (clk_rate==CLK_133_MHZ && bus_mode==BUSMODE_PCI) begin
      $display("  Warning:  Cannot specify 133MHz and PCI bus mode...  Defaulting to 66MHz");
      clk_rate = CLK_66_MHZ;
    end
    if (clk_rate==CLK_33_MHZ && bus_mode==BUSMODE_PCIX) begin
      $display("  Warning:  Cannot specify 33MHz and PCIX bus mode...  Defaulting to 66MHz");
      clk_rate = CLK_66_MHZ;
    end
    $swrite(tb_state_detail, "%2d %4s %3d ",
            (bus_width) ? 64 : 32,
            (bus_mode) ? "PCIX" : "PCI ",
            (clk_rate+1)*33+((clk_rate==CLK_133_MHZ)? 34 : 0));
    clk_sp <= clk_rate;
    clk_en <= 1'b1;

    // Reset the bus drivers
    reg_ad <= 64'h0;
    adh_oe <= 0;
    adl_oe <= 0;
    reg_cbe <= 8'h0;
    cbeh_oe <= 0;
    cbel_oe <= 0;
    reg_frame_n <= 1;
    frame_oe <= 0;
    reg_req64_n <= 1;
    req64_oe <= 0;
    reg_trdy_n <= 1;
    trdy_oe <= 0;
    reg_irdy_n <= 1;
    irdy_oe <= 0;
    reg_stop_n <= 1;
    stop_oe <= 0;
    reg_devsel_n <= 1;
    devsel_oe <= 0;
    reg_ack64_n <= 1;
    ack64_oe <= 0;
    reg_idsel <= 0;
    reg_rst_n <= 0;
    reg_gnt_oe <= 0;

    @(posedge pciclk);
    @(posedge pciclk);
    @(posedge pciclk);
    @(posedge pciclk);
    @(posedge pciclk);
    @(posedge pciclk);
    @(posedge pciclk);
    @(posedge pciclk);
    @(posedge pciclk);
    @(posedge pciclk);

    $display(" ");
    $display(" ");
    $display("========================================");
    $display("- STARTING NEW TEST, RESETTING THE BUS -");
    $display("========================================");

    // Assert the appropriate signals to specify 32/64-bit and bus speed
    if (bus_width) begin
      reg_req64_n <= 1'b0;
      req64_oe <= 1'b1;
      $display("     Bus is 64-bit");
    end else begin
      $display("     Bus is 32-bit");
    end

    if (bus_mode) begin
      reg_trdy_n <= 1'b0;
      trdy_oe <= 1'b1;
      $display("     Bus is PCIX");

      if (clk_rate > 1) begin
        reg_stop_n <= 0;
        stop_oe <= 1;
        $display("     PCIX CLK is 133 MHz");
      end else begin
        $display("     PCIX CLK is 66 MHz");
      end
    end else begin
      $display("     Bus is PCI");

      if (clk_rate > 0) begin
        reg_stop_n <= 1;
        stop_oe <= 0;
        $display("     PCI CLK is 66 MHz");
      end else begin
        $display("     PCI CLK is 33 MHz");
      end
    end


    #2;
    @(negedge pciclk);

    $display("");
    $display("---------------------------");
    $display("Timing checks are not valid");
    $display("---------------------------");
    $display("While the system is coming out of reset, some settling");
    $display("of internal state may occur across clock edges, causing");
    $display("the simulator to report false timing violations. These");
    $display("may be safely ignored.");
    $display("");

    // Deassert reset signal
    reg_rst_n <= 1;

    @(posedge pciclk);
    @(posedge pciclk);
    @(posedge pciclk);
    @(posedge pciclk);
    @(posedge pciclk);
    @(posedge pciclk);
    @(posedge pciclk);
    @(posedge pciclk);
    @(posedge pciclk);
    @(posedge pciclk);

    // Reassign initial values
    reg_frame_n <= 1;
    frame_oe <= 0;
    reg_req64_n <= 1;
    req64_oe <= 0;
    reg_trdy_n <= 1;
    trdy_oe <= 0;
    reg_irdy_n <= 1;
    irdy_oe <= 0;
    reg_stop_n <= 1;
    stop_oe <= 0;
    reg_devsel_n <= 1;
    devsel_oe <= 0;
    reg_ack64_n <= 1;
    ack64_oe <= 0;
    reg_idsel <= 0;
    $display("System Reset Complete...");
    $display("");

    while(FPGA_RST) @(posedge pciclk);
    @(posedge pciclk);
    @(posedge pciclk);
    @(posedge pciclk);
    @(posedge pciclk);
    @(posedge pciclk);
    $display("-----------------------");
    $display("Timing checks are valid");
    $display("-----------------------");
    $display("The system has now settled out of reset; timing checks");
    $display("are valid from this point on.");
  end
  endtask


  // Task for writing a DWORD in PCI mode
  //----------------------------------------
  task WRITE_DWORD_PCI;
    input [63:0] address;
    input [31:0] data;
    input  [3:0] cmd;
    input  [3:0] cbe;
    input        verbose;
    integer dsel_cnt;
    integer trdy_cnt;
  begin
    if (verbose) begin
      $display("Writing DWORD in PCI mode...");
      tb_state_detail <= "WR_DWORD    ";
    end
    dsel_cnt <= 0;
    trdy_cnt <= 0;
    @(posedge pciclk);
    reg_frame_n <= 0;
    frame_oe <= 1;
    if (address[63:32] == 32'h00000000)
    begin
      reg_ad <= {32'bz,address[31:0]};
      reg_cbe <= {4'bz,cmd[3:0]};
      reg_idsel <= (cmd[3:1] == 3'b101);
      adl_oe <= 1;
      cbel_oe <= 1;
    end
    else
    begin
      reg_ad <= {32'bz,address[31:0]};
      reg_cbe <= {4'bz,4'b1101};
      reg_idsel <= (cmd[3:1] == 3'b101);
      adl_oe <= 1;
      cbel_oe <= 1;
      @(posedge pciclk);
      reg_ad <= {32'bz,address[63:32]};
      reg_cbe <= {4'bz,cmd[3:0]};
      reg_idsel <= (cmd[3:1] == 3'b101);
      adl_oe <= 1;
      cbel_oe <= 1;
      reg_irdy_n <= 1;
      irdy_oe <= 1;
    end
    @(posedge pciclk);
    reg_frame_n <= 1;
    frame_oe <= 1;
    reg_irdy_n <= 0;
    irdy_oe <= 1;
    reg_ad <= {32'bz,data};
    reg_cbe <= {4'bz,cbe};
    reg_idsel <= 0;
    adl_oe <= 1;
    cbel_oe <= 1;

    while(DEVSEL_N && (dsel_cnt < 10))
    begin
      @(posedge pciclk);
      dsel_cnt = dsel_cnt + 1;
    end

    while(TRDY_N && STOP_N && ((trdy_cnt < 16) && (dsel_cnt < 10)))
    begin
      trdy_cnt = trdy_cnt + 1;
      @(posedge pciclk);
    end

    if (dsel_cnt < 10)
    begin
      if (trdy_cnt <= 16)
      begin
        if (TRDY_N == 0 && STOP_N == 1) begin
          if (verbose) $display("  STM-->DUT: Normal, Data Transferred");
        end else if (TRDY_N == 0 && STOP_N == 0) begin
          if (verbose) $display("  STM-->DUT: Disconnect, Data Transferred");
        end else if (TRDY_N==1 && STOP_N == 0 && DEVSEL_N == 0) begin
          if (verbose) $display("  STM-->DUT: Retry, No Data Transferred");
        end else if (TRDY_N==1 && STOP_N == 0 && DEVSEL_N == 1) begin
          if (verbose) $display("  STM-->DUT: Target Abort, No Data Transferred");
        end else begin
          $display("  ERROR: Check Design");
        end
      end
      else $display("  ERROR: Latency Violation");
    end
    else $display("  ERROR: Master Abort");

    reg_frame_n <= 1;
    frame_oe <= 0;
    reg_irdy_n <= 1;
    irdy_oe <= 1;
    adl_oe <= 0;
    cbel_oe <= 0;
    @(posedge pciclk);
    reg_irdy_n <= 1;
    irdy_oe <= 0;
    @(posedge pciclk);
    @(posedge pciclk);
    @(posedge pciclk);
  end
  endtask


  // Task for reading a DWORD in PCI mode
  //----------------------------------------
  task READ_DWORD_PCI;
    input [63:0] address;
    input  [3:0] cmd;
    input  [3:0] cbe;
    input        verbose;
    integer dsel_cnt;
    integer trdy_cnt;
  begin
    if (verbose) begin
      $display("Reading DWORD in PCI mode...");
      tb_state_detail <= "RD_DWORD    ";
    end
    dsel_cnt <= 0;
    trdy_cnt <= 0;
    @(posedge pciclk);
    reg_frame_n <= 0;
    frame_oe <= 1;
    if (address[63:32] == 32'h00000000)
    begin
      reg_ad <= {32'bz,address[31:0]};
      reg_cbe <= {4'bz,cmd[3:0]};
      reg_idsel <= (cmd[3:1] == 3'b101);
      adl_oe <= 1;
      cbel_oe <= 1;
    end
    else
    begin
      reg_ad <= {32'bz,address[31:0]};
      reg_cbe <= {4'bz,4'b1101};
      reg_idsel <= (cmd[3:1] == 3'b101);
      adl_oe <= 1;
      cbel_oe <= 1;
      @(posedge pciclk);
      reg_ad <= {32'bz,address[63:32]};
      reg_cbe <= {4'bz,cmd[3:0]};
      reg_idsel <= (cmd[3:1] == 3'b101);
      adl_oe <= 1;
      cbel_oe <= 1;
      reg_irdy_n <= 1;
      irdy_oe <= 1;
    end
    @(posedge pciclk);
    reg_frame_n <= 1;
    frame_oe <= 1;
    reg_irdy_n <= 0;
    irdy_oe <= 1;
    reg_ad <= {32'bz,32'bz};
    reg_cbe <= {4'bz,cbe};
    reg_idsel <= 0;
    adl_oe <= 0;
    cbel_oe <= 1;

    while(DEVSEL_N && (dsel_cnt < 10))
    begin
      @(posedge pciclk);
      dsel_cnt = dsel_cnt + 1;
    end

    while(TRDY_N && STOP_N && ((trdy_cnt < 16) && (dsel_cnt < 10)))
    begin
      trdy_cnt = trdy_cnt + 1;
      @(posedge pciclk);
    end

    if (dsel_cnt < 10)
    begin
      if (trdy_cnt <= 16)
      begin
        if (TRDY_N == 0 && STOP_N == 1) begin
          if (verbose) $display("  STM<--DUT: Normal, Data Transferred");
          data_in = AD;
        end else if (TRDY_N == 0 && STOP_N == 0) begin
          if (verbose) $display("  STM<--DUT: Disconnect, Data Transferred");
          data_in = AD;
        end else if (TRDY_N==1 && STOP_N == 0 && DEVSEL_N == 0) begin
          if (verbose) $display("  STM<--DUT: Retry, No Data Transferred");
          data_in = 64'bx;
        end else if (TRDY_N==1 && STOP_N == 0 && DEVSEL_N == 1) begin
          if (verbose) $display("  STM<--DUT: Target Abort, No Data Transferred");
          data_in = 64'bx;
        end else begin
          $display("  ERROR: Check Design");
          data_in = 64'bx;
        end
      end else begin
        $display("  ERROR: Latency Violation");
        data_in = 64'bx;
      end
    end else begin
      $display("  ERROR: Master Abort");
      data_in = 64'bx;
    end

    reg_frame_n <= 1;
    frame_oe <= 0;
    reg_irdy_n <= 1;
    irdy_oe <= 1;
    adl_oe <= 0;
    cbel_oe <= 0;
    @(posedge pciclk);
    reg_irdy_n <= 1;
    irdy_oe <= 0;
    @(posedge pciclk);
    @(posedge pciclk);
    @(posedge pciclk);
  end
  endtask


  // Task for writing a DWORD in PCIX mode
  //----------------------------------------
  task WRITE_DWORD_PCIX;
    input [63:0] address;
    input [31:0] data;
    input  [3:0] cmd;
    input [31:0] attrl;
    input  [3:0] attrh;
    input        verbose;
    integer dsel_cnt;
    integer trdy_cnt;
  begin
    if (verbose) begin
      $display("Writing DWORD in PCIX mode...");
      tb_state_detail <= "WR_DWORD_X  ";
    end
    dsel_cnt <= 0;
    trdy_cnt <= 0;
    @(posedge pciclk);
    reg_frame_n <= 0;
    frame_oe <= 1;
    if (address[63:32] == 32'h00000000)
    begin
      reg_ad <= {32'bz,address[31:0]};
      reg_cbe <= {4'bz,cmd[3:0]};
      reg_idsel <= (cmd[3:1] == 3'b101);
      adl_oe <= 1;
      cbel_oe <= 1;
    end
    else
    begin
      reg_ad <= {32'bz,address[31:0]};
      reg_cbe <= {4'bz,4'b1101};
      reg_idsel <= (cmd[3:1] == 3'b101);
      adl_oe <= 1;
      cbel_oe <= 1;
      @(posedge pciclk);
      reg_ad <= {32'bz,address[63:32]};
      reg_cbe <= {4'bz,cmd[3:0]};
      reg_idsel <= (cmd[3:1] == 3'b101);
      adl_oe <= 1;
      cbel_oe <= 1;
      reg_irdy_n <= 1;
      irdy_oe <= 1;
    end
    @(posedge pciclk);
    reg_ad <= {32'bz,attrl[31:0]};
    reg_cbe <= {4'bz,attrh[3:0]};
    reg_idsel <= 0 ;
    adl_oe <= 1;
    cbel_oe <= 1;
    reg_irdy_n <= 1;
    irdy_oe <= 1;
    @(posedge pciclk);
    reg_ad <= {32'bz,data};
    reg_cbe <= {4'bz,((cmd == 4'b0111) ? attrh : 4'b1111)};
    adl_oe <= 1;
    cbel_oe <= 1;
    @(posedge pciclk);
    reg_irdy_n <= 0;
    reg_frame_n <= 1;
    irdy_oe <= 1;

    while(DEVSEL_N && (dsel_cnt < 10))
    begin
      @(posedge pciclk);
      dsel_cnt = dsel_cnt + 1;
    end

    while(!DEVSEL_N && STOP_N && TRDY_N && ((trdy_cnt < 16) && (dsel_cnt < 10)))
    begin
      trdy_cnt = trdy_cnt + 1;
      @(posedge pciclk);
    end
    if (dsel_cnt < 10)
    begin
      if (trdy_cnt <= 16)
      begin
        if (DEVSEL_N == 1 && STOP_N == 1 && TRDY_N == 0) begin
          if (verbose) $display("  STM-->DUT: Split, No Data Transferred");
        end else if (DEVSEL_N == 1 && STOP_N == 0 && TRDY_N == 1) begin
          if (verbose) $display("  STM-->DUT: Target Abort, No Data Transferred");
        end else if (DEVSEL_N == 1 && STOP_N == 0 && TRDY_N == 0) begin
          if (verbose) $display("  STM-->DUT: Immediate Disconnect, Data Transferred");
        end else if (DEVSEL_N == 0 && STOP_N == 1 && TRDY_N == 0) begin
          if (verbose) $display("  STM-->DUT: Normal, Data Transferred");
        end else if (DEVSEL_N == 0 && STOP_N == 0 && TRDY_N == 1) begin
          if (verbose) $display("  STM-->DUT: Retry, No Data Transferred");
        end else if (DEVSEL_N == 0 && STOP_N == 0 && TRDY_N == 0) begin
          if (verbose) $display("  STM-->DUT: Next ADB Disconnect, Data Transferred");
        end else begin
          $display("  ERROR: Check Design");
        end
      end
      else $display("  ERROR: Latency Violation");
    end
    else $display("  ERROR: Master Abort");

    reg_frame_n <= 1;
    frame_oe <= 1;
    reg_irdy_n <= 1;
    irdy_oe <= 1;
    @(posedge pciclk);
    frame_oe <= 0;
    adl_oe <= 0;
    cbel_oe <= 0;
    @(posedge pciclk);
    irdy_oe <= 0;
    @(posedge pciclk);
    @(posedge pciclk);
    @(posedge pciclk);
  end
  endtask


  // Task for reading a DWORD in PCIX mode
  //----------------------------------------
  task READ_DWORD_PCIX;
    input [63:0] address;
    input  [3:0] cmd;
    input [31:0] attrl;
    input  [3:0] attrh;
    input        verbose;
    integer dsel_cnt;
    integer trdy_cnt;
  begin
    if (verbose) begin
      $display("Reading DWORD in PCIX mode...");
      tb_state_detail <= "RD_DWORD_X  ";
    end
    dsel_cnt <= 0;
    trdy_cnt <= 0;
    @(posedge pciclk);
    reg_frame_n <= 0;
    frame_oe <= 1;
    if (address[63:32] == 32'h00000000)
    begin
      reg_ad <= {32'bz,address[31:0]};
      reg_cbe <= {4'bz,cmd[3:0]};
      reg_idsel <= (cmd[3:1] == 3'b101);
      adl_oe <= 1;
      cbel_oe <= 1;
    end
    else
    begin
      reg_ad <= {32'bz,address[31:0]};
      reg_cbe <= {4'bz,4'b1101};
      reg_idsel <= (cmd[3:1] == 3'b101);
      adl_oe <= 1;
      cbel_oe <= 1;
      @(posedge pciclk);
      reg_ad <= {32'bz,address[63:32]};
      reg_cbe <= {4'bz,cmd[3:0]};
      reg_idsel <= (cmd[3:1] == 3'b101);
      adl_oe <= 1;
      cbel_oe <= 1;
      reg_irdy_n <= 1;
      irdy_oe <= 1;
    end
    @(posedge pciclk);
    reg_ad <= {32'bz,attrl[31:0]};
    reg_cbe <= {4'bz,attrh[3:0]};
    reg_idsel <= 0 ;
    adl_oe <= 1;
    cbel_oe <= 1;
    reg_irdy_n <= 1;
    irdy_oe <= 1;
    @(posedge pciclk);
    reg_cbe <= {4'bz,4'b1111};
    adl_oe <= 0;
    cbel_oe <= 1;
    @(posedge pciclk);
    reg_irdy_n <= 0;
    irdy_oe <= 1;

    while(DEVSEL_N && (dsel_cnt < 10))
    begin
      @(posedge pciclk);
      dsel_cnt = dsel_cnt + 1;
    end

    while(!DEVSEL_N && STOP_N && TRDY_N && ((trdy_cnt < 16) && (dsel_cnt < 10)))
    begin
      trdy_cnt = trdy_cnt + 1;
      @(posedge pciclk);
    end

    if (dsel_cnt < 10)
    begin
      if (trdy_cnt <= 16)
      begin
        if (DEVSEL_N == 1 && STOP_N == 1 && TRDY_N == 0) begin
          if (verbose) $display("  STM<--DUT: Split, No Data Transferred");
          data_in = 64'bx;
        end else if (DEVSEL_N == 1 && STOP_N == 0 && TRDY_N == 1) begin
          if (verbose) $display("  STM<--DUT: Target Abort, No Data Transferred");
          data_in = 64'bx;
        end else if (DEVSEL_N == 1 && STOP_N == 0 && TRDY_N == 0) begin
          if (verbose) $display("  STM<--DUT: Immediate Disconnect, Data Transferred");
          data_in = AD;
        end else if (DEVSEL_N == 0 && STOP_N == 1 && TRDY_N == 0) begin
          if (verbose) $display("  STM<--DUT: Normal, Data Transferred");
          data_in = AD;
        end else if (DEVSEL_N == 0 && STOP_N == 0 && TRDY_N == 1) begin
          if (verbose) $display("  STM<--DUT: Retry, No Data Transferred");
          data_in = 64'bx;
        end else if (DEVSEL_N == 0 && STOP_N == 0 && TRDY_N == 0) begin
          if (verbose) $display("  STM<--DUT: Next ADB Disconnect, Data Transferred");
          data_in = AD;
        end else begin
          $display("  ERROR: Check Design");
          data_in = 64'bx;
        end
      end else begin
        $display("  ERROR: Latency Violation");
        data_in = 64'bx;
      end
    end else begin
      $display("  ERROR: Master Abort");
      data_in = 64'bx;
    end

    reg_frame_n <= 1;
    frame_oe <= 1;
    reg_irdy_n <= 1;
    irdy_oe <= 1;
    @(posedge pciclk);
    frame_oe <= 0;
    cbel_oe <= 0;
    @(posedge pciclk);
    irdy_oe <= 0;
    @(posedge pciclk);
    @(posedge pciclk);
    @(posedge pciclk);

  end
  endtask


  // Emulate a BIOS by assigning PCI BARs
  //----------------------------------------
  task PROGRAM_BARS_PCI;
    integer i;
  begin

    // Reset the bar counters
    mem_bar_addr_cnt = 0;
    io_bar_addr_cnt = 0;

    // Clear the bar arrays
    for (i=0; i<6; i=i+1) begin
      bar_addr[i] = 0;
      bar_type[i] = 0;  // Disabled
    end

    // Assign 32-bit memory and IO BARs
    $display(" ");
    $display("- BIOS Emulation --------------------");
    $display("-------------------------------------");
    tb_state <= "BIOS EMU    ";
    $display("  Assigning 32-bit BARs\n");
    tb_state_detail <= "START_BIOS  ";
    @(posedge pciclk);

    ASSIGN_BARS_PCI;

    // Assign command register to enable device
    tb_state_detail = "CMD REGISTER";
    READ_DWORD_PCI(4, 10, 0, 0);
    WRITE_DWORD_PCI(4, 32'hffff0147, 11, 0, 0);
    READ_DWORD_PCI(4, 10, 0, 0);

    tb_state_detail <= "END_BIOS    ";
    @(posedge pciclk);

  end
  endtask


  // Detect and assign PCI BARs
  //----------------------------------------
  task ASSIGN_BARS_PCI;
    reg [31:0] bar_val;
    reg [31:0] temp32_a;  // Used as the FFC00000 form of the BAR value
    reg [31:0] temp32_b;  // Used as the 00400000 form of the BAR value
    integer    bar;
  begin

    // Setup bars 0-2
    for (bar = 0; bar<3; bar=bar+1) begin
      $swrite(tb_state_detail, "%11s%1d", "WRITE_F_BAR", bar);
      WRITE_DWORD_PCI(16 + 4*bar, 32'hffffffff, 11, 0, 0);
      $swrite(tb_state_detail, "%8s%1d   ", "READ_BAR", bar);
      READ_DWORD_PCI(16 + 4*bar, 10, 0, 0);
      bar_val = data_in[31:0];

      if (bar_val != 0) begin
        if (bar_val[0]) begin
          // 32-bit IO bar
          //-------------------
          temp32_a = bar_val & 32'hfffffffc;
          temp32_b = (temp32_a ^ (temp32_a << 1));

          if (!temp32_a[31]) begin
            $display("Error:  Highest bit of BAR%0d (32-bit bar) cannot be 0!", bar);
          end

          // Align BAR address counter to BAR size
          if ((~temp32_a & io_bar_addr_cnt[31:0])) begin
            io_bar_addr_cnt[31:0] = io_bar_addr_cnt[31:0] & temp32_a;
            io_bar_addr_cnt = io_bar_addr_cnt + temp32_b;
          end

          // Assign the BAR
          $swrite(tb_state_detail, "%10s%1d ", "ASSIGN_BAR", bar);
          WRITE_DWORD_PCI(16 + 4*bar, io_bar_addr_cnt[31:0], 11, 0, 0);
          $display("    BAR%0D:  32-bit IO bar", bar);
          $display("      starting at address %h", io_bar_addr_cnt);
          bar_addr[bar] = io_bar_addr_cnt;
          bar_type[bar] = 1;  // 32-bit IO

          // Verify the BAR
          $swrite(tb_state_detail, "%10s%1d ", "VERIFY_BAR", bar);
          READ_DWORD_PCI(16 + 4*bar, 10, 0, 0);
          if ((data_in[31:0] & 32'hfffffffc) != io_bar_addr_cnt[31:0]) begin
            $display("Error:  Failed assigning BAR%0d!", bar);
          end

          // Increment the BAR address counter
          io_bar_addr_cnt[31:0] = io_bar_addr_cnt[31:0] & temp32_a;
          io_bar_addr_cnt = io_bar_addr_cnt + temp32_b;
          $display("        ending at address %h", io_bar_addr_cnt-1);
          $display(" ");

        end else begin
          // 32-bit memory bar
          //-------------------
          temp32_a = bar_val & 32'hfffffff0;
          temp32_b = (temp32_a ^ (temp32_a << 1));

          if (!temp32_a[31]) begin
            $display("Error:  Highest bit of BAR%0d (32-bit bar) cannot be 0!", bar);
          end

          // Align BAR address counter to BAR size
          if ((~temp32_a & mem_bar_addr_cnt[31:0])) begin
            mem_bar_addr_cnt[31:0] = mem_bar_addr_cnt[31:0] & temp32_a;
            mem_bar_addr_cnt = mem_bar_addr_cnt + temp32_b;
          end

          // Assign the BAR
          $swrite(tb_state_detail, "%10s%1d ", "ASSIGN_BAR", bar);
          WRITE_DWORD_PCI(16 + 4*bar, mem_bar_addr_cnt[31:0], 11, 0, 0);
          $display("    BAR%0D:  32-bit memory bar", bar);
          $display("      starting at address %h", mem_bar_addr_cnt);
          bar_addr[bar] = mem_bar_addr_cnt;
          bar_type[bar] = 2;  // 32-bit memory

          // Verify the BAR
          $swrite(tb_state_detail, "%10s%1d ", "VERIFY_BAR", bar);
          READ_DWORD_PCI(16 + 4*bar, 10, 0, 0);
          if ((data_in[31:0] & 32'hfffffff0) != mem_bar_addr_cnt[31:0]) begin
            $display("Error:  Failed assigning BAR%0d!", bar);
          end

          // Increment the BAR address counter
          mem_bar_addr_cnt[31:0] = mem_bar_addr_cnt[31:0] & temp32_a;
          mem_bar_addr_cnt = mem_bar_addr_cnt + temp32_b;
          $display("        ending at address %h", mem_bar_addr_cnt-1);
          $display(" ");

        end

      end else begin
        // Display disabled BARs only on the first pass
        $display("    BAR%0d:  Disabled", bar);
        $display(" ");
      end
    end

  end
  endtask


  // Perform read/write accesses to each PCI BAR
  //----------------------------------------------
  task ACCESS_EACH_BAR_PCI;
    integer     i;
    integer     cmd;
    reg  [31:0] data_out;
    reg  [7:0]  temp;
  begin

    $display("- Accessing the PCI device ----------");
    $display("-------------------------------------");
    tb_state <= "ACCESS PCI  ";

    // Check for enabled BARs
    for (i=0; i<3; i=i+1) begin
      if (bar_type[i]) begin

        // IO or memory BAR
        if (bar_type[i]==1)
          cmd = 2;
        else
          cmd = 6;

        $display(" ");
        $display("Accessing address %h (BAR%0d, %0d-bit %0s)",
                 bar_addr[i],
                 i,
                 (bar_type[i]==3)?64:32,
                 (bar_type[i]==1)?"IO BAR":"memory BAR");

        // Generate some data to write
        temp = i;
        data_out = {8'hff-temp, temp, 8'hff-temp, temp};

        $swrite(tb_state_detail, "%11s%1d", "WACCESS_BAR", i);
        @(posedge pciclk);
        WRITE_DWORD_PCI(bar_addr[i], data_out, cmd+1, 0, 1);
        $swrite(tb_state_detail, "%11s%1d", "RACCESS_BAR", i);
        @(posedge pciclk);
        READ_DWORD_PCI(bar_addr[i], cmd, 0, 1);

        if (data_out != data_in[31:0]) begin
          $display("Error:  Incorrect data read from BAR%0d, address %h", i, bar_addr[i]);
          $display("Error:  Wrote %h,  Read %h", data_out, data_in[31:0]);
        end
      end
    end

  end
  endtask


  // Emulate a BIOS by assigning PCIX BARs
  //----------------------------------------
  task PROGRAM_BARS_PCIX;
    integer i;
  begin

    // Reset the bar counters
    mem_bar_addr_cnt = 0;
    io_bar_addr_cnt = 0;

    // Clear the bar arrays
    for (i=0; i<6; i=i+1) begin
      bar_addr[i] = 0;
      bar_type[i] = 0;  // Disabled
    end

    // Assign 32-bit memory and IO BARs
    $display(" ");
    $display("- BIOS Emulation --------------------");
    $display("-------------------------------------");
    tb_state <= "BIOS EMU    ";
    $display("  Assigning 32-bit BARs\n");
    tb_state_detail <= "START_BIOSX ";
    @(posedge pciclk);

    ASSIGN_BARS_PCIX(0);

    // Assign 64-bit memory BARs
    $display("  Assigning 64-bit BARs\n");
    ASSIGN_BARS_PCIX(1);

    // Assign command register to enable device
    tb_state_detail = "CMD REGISTER";
    READ_DWORD_PCIX(4, 10, 0, 0, 0);
    WRITE_DWORD_PCIX(4, 32'hffff0147, 11, 0, 0, 0);
    READ_DWORD_PCIX(4, 10, 0, 0, 0);

    tb_state_detail <= "END_BIOSX   ";
    @(posedge pciclk);

  end
  endtask


  // Detect and assign PCIX BARs
  //----------------------------------------
  task ASSIGN_BARS_PCIX;
    input      find_64_bit_only;
    reg [31:0] bar_val;
    reg [31:0] temp32_a;  // Used as the FFC00000 form of the BAR value
    reg [31:0] temp32_b;  // Used as the 00400000 form of the BAR value
    reg [63:0] temp64_a;
    reg [63:0] temp64_b;
    integer    bar;
  begin

    // Setup bars 0-5
    for (bar = 0; bar<6; bar=bar+1) begin

      // Check only those bars which have not been previously assigned
      if (bar_type[bar]==0) begin

        $swrite(tb_state_detail, "%11s%1d", "WRITE_F_BAR", bar);
        WRITE_DWORD_PCIX(16 + 4*bar, 32'hffffffff, 11, 0, 0, 0);
        $swrite(tb_state_detail, "%8s%1d   ", "READ_BAR", bar);
        READ_DWORD_PCIX(16 + 4*bar, 10, 0, 0, 0);
        bar_val = data_in[31:0];

        if (bar_val != 0) begin
          if (bar_val[0] && !find_64_bit_only) begin
            // 32-bit IO bar
            //-------------------
            temp32_a = bar_val & 32'hfffffffc;
            temp32_b = (temp32_a ^ (temp32_a << 1));

            if (!temp32_a[31]) begin
              $display("Error:  Highest bit of BAR%0d (32-bit bar) cannot be 0!", bar);
            end

            // Align BAR address counter to BAR size
            if ((~temp32_a & io_bar_addr_cnt[31:0])) begin
              io_bar_addr_cnt[31:0] = io_bar_addr_cnt[31:0] & temp32_a;
              io_bar_addr_cnt = io_bar_addr_cnt + temp32_b;
            end

            // Assign the BAR
            $swrite(tb_state_detail, "%10s%1d ", "ASSIGN_BAR", bar);
            WRITE_DWORD_PCIX(16 + 4*bar, io_bar_addr_cnt[31:0], 11, 0, 0, 0);
            $display("    BAR%0D:  32-bit IO bar", bar);
            $display("      starting at address %h", io_bar_addr_cnt);
            bar_addr[bar] = io_bar_addr_cnt;
            bar_type[bar] = 1;  // 32-bit IO

            // Verify the BAR
            $swrite(tb_state_detail, "%10s%1d ", "VERIFY_BAR", bar);
            READ_DWORD_PCIX(16 + 4*bar, 10, 0, 0, 0);
            if ((data_in[31:0] & 32'hfffffffc) != io_bar_addr_cnt[31:0]) begin
              $display("Error:  Failed assigning BAR%0d!", bar);
            end

            // Increment the BAR address counter
            io_bar_addr_cnt[31:0] = io_bar_addr_cnt[31:0] & temp32_a;
            io_bar_addr_cnt = io_bar_addr_cnt + temp32_b;
            $display("        ending at address %h", io_bar_addr_cnt-1);
            $display(" ");

          end else if (bar_val[2:1] == 2'b10 && find_64_bit_only) begin
            // 64-bit memory bar
            //-------------------
            temp64_a[31:0] = bar_val & 32'hfffffff0;

            // Read the upper half of the BAR
            bar = bar+1;
            $swrite(tb_state_detail, "%10s%1d ", "WR64_F_BAR", bar);
            WRITE_DWORD_PCIX(16 + 4*bar, 32'hffffffff, 11, 0, 0, 0);
            $swrite(tb_state_detail, "%8s%1d   ", "RD64_BAR", bar);
            READ_DWORD_PCIX(16 + 4*bar, 10, 0, 0, 0);
            temp64_a[63:32] = data_in[31:0];
            temp64_b = (temp64_a ^ (temp64_a << 1));

            if (!temp64_a[63]) begin
              $display("Error:  Highest bit of BAR%0d (upper 32-bits of 64-bit bar) cannot be 0!", bar);
            end

            // Align BAR address counter to BAR size
            if ((~temp64_a & mem_bar_addr_cnt)) begin
              mem_bar_addr_cnt = mem_bar_addr_cnt & temp64_a;
              mem_bar_addr_cnt = mem_bar_addr_cnt + temp64_b;
            end

            // Assign the BAR
            $swrite(tb_state_detail, "%10s%1d ", "ASGN64_BAR", bar-1);
            WRITE_DWORD_PCIX(16 + 4*(bar-1), mem_bar_addr_cnt[31:0], 11, 0, 0, 0);
            $swrite(tb_state_detail, "%10s%1d ", "ASGN64_BAR", bar);
            WRITE_DWORD_PCIX(16 + 4*bar, mem_bar_addr_cnt[63:32], 11, 0, 0, 0);
            $display("    BAR%0D:  64-bit memory bar", bar-1);
            $display("      starting at address %h", mem_bar_addr_cnt);
            bar_addr[bar-1] = mem_bar_addr_cnt;
            bar_type[bar-1] = 3;  // 64-bit memory

            // Verify the BAR
            $swrite(tb_state_detail, "%10s%1d ", "VERIFY_BAR", bar);
            READ_DWORD_PCIX(16 + 4*(bar-1), 10, 0, 0, 0);
            if ((data_in[31:0] & 32'hfffffff0) != mem_bar_addr_cnt[31:0]) begin
              $display("Error:  Failed assigning BAR%0d!", bar-1);
            end
            READ_DWORD_PCIX(16 + 4*bar, 10, 0, 0, 0);
            if (data_in[31:0] != mem_bar_addr_cnt[63:32]) begin
              $display("Error:  Failed assigning BAR%0d (upper 32-bits of BAR%0d)!", bar, bar-1);
            end

            // Increment the BAR address counter
            mem_bar_addr_cnt = mem_bar_addr_cnt & temp64_a;
            mem_bar_addr_cnt = mem_bar_addr_cnt + temp64_b;
            $display("        ending at address %h", mem_bar_addr_cnt-1);
            $display(" ");

          end else if (bar_val[2:1] == 2'b10 && !find_64_bit_only) begin
            // Skip 64-bit memory bars
            //------------------------
            bar = bar+1;
          end else if (!find_64_bit_only) begin
            // 32-bit memory bar
            //-------------------
            temp32_a = bar_val & 32'hfffffff0;
            temp32_b = (temp32_a ^ (temp32_a << 1));

            if (!temp32_a[31]) begin
              $display("Error:  Highest bit of BAR%0d (32-bit bar) cannot be 0!", bar);
            end

            // Align BAR address counter to BAR size
            if ((~temp32_a & mem_bar_addr_cnt[31:0])) begin
              mem_bar_addr_cnt[31:0] = mem_bar_addr_cnt[31:0] & temp32_a;
              mem_bar_addr_cnt = mem_bar_addr_cnt + temp32_b;
            end

            // Assign the BAR
            $swrite(tb_state_detail, "%10s%1d ", "ASSIGN_BAR", bar);
            WRITE_DWORD_PCIX(16 + 4*bar, mem_bar_addr_cnt[31:0], 11, 0, 0, 0);
            $display("    BAR%0D:  32-bit memory bar", bar);
            $display("      starting at address %h", mem_bar_addr_cnt);
            bar_addr[bar] = mem_bar_addr_cnt;
            bar_type[bar] = 2;  // 32-bit memory

            // Verify the BAR
            $swrite(tb_state_detail, "%10s%1d ", "VERIFY_BAR", bar);
            READ_DWORD_PCIX(16 + 4*bar, 10, 0, 0, 0);
            if ((data_in[31:0] & 32'hfffffff0) != mem_bar_addr_cnt[31:0]) begin
              $display("Error:  Failed assigning BAR%0d!", bar);
            end

            // Increment the BAR address counter
            mem_bar_addr_cnt[31:0] = mem_bar_addr_cnt[31:0] & temp32_a;
            mem_bar_addr_cnt = mem_bar_addr_cnt + temp32_b;
            $display("        ending at address %h", mem_bar_addr_cnt-1);
            $display(" ");

          end

        end else if (!find_64_bit_only) begin
          // Display disabled BARs only on the first pass
          $display("    BAR%0d:  Disabled", bar);
          $display(" ");
        end
      end
    end  // end for loop

  end
  endtask


  // Perform read/write accesses to each PCIX BAR
  //----------------------------------------------
  task ACCESS_EACH_BAR_PCIX;
    integer     i;
    integer     cmd;
    reg  [31:0] data_out;
    reg  [7:0]  temp;
  begin

    $display("- Accessing the PCIX device ---------");
    $display("-------------------------------------");
    tb_state <= "ACCESS PCIX ";

    // Check for enabled BARs
    for (i=0; i<6; i=i+1) begin
      if (bar_type[i]) begin

        // IO or memory BAR
        if (bar_type[i]==1)
          cmd = 2;
        else
          cmd = 6;

        $display(" ");
        $display("Accessing address %h (BAR%0d, %0d-bit %0s)",
                 bar_addr[i],
                 i,
                 (bar_type[i]==3)?64:32,
                 (bar_type[i]==1)?"IO BAR":"memory BAR");

        // Generate some data to write
        temp = i;
        data_out = {8'hff-temp, temp, 8'hff-temp, temp};

        $swrite(tb_state_detail, "%11s%1d", "WACCESS_BAR", i);
        @(posedge pciclk);
        WRITE_DWORD_PCIX(bar_addr[i], data_out, cmd+1, 0, 0, 1);
        $swrite(tb_state_detail, "%11s%1d", "RACCESS_BAR", i);
        @(posedge pciclk);
        READ_DWORD_PCIX(bar_addr[i], cmd, 0, 0, 1);

        if (data_out != data_in[31:0]) begin
          $display("Error:  Incorrect data read from BAR%0d, address %h", i, bar_addr[i]);
          $display("Error:  Wrote %h,  Read %h", data_out, data_in[31:0]);
        end
      end
    end

  end
  endtask


  // Simple task for waiting
  //----------------------------
  task INTERCYCLE_GAP;
    input integer num_cycles;
    integer i;
  begin
    tb_state_detail <= "WAIT        ";
    for (i=0; i<num_cycles; i=i+1)
      @(posedge pciclk);
  end
  endtask

  // Perform Initiator Transactions to Target
  //----------------------------------------------
  
  task START_INITIATOR;
    input reg start32_initiator;
    input reg start64_initiator;
    input [31:0] master_addr;
    
    integer bar;
    integer cmd;
    reg  [31:0] data_in;
  
    begin
    
      cmd = 6;
      bar = 0;

    if (bar_type[0]) begin 
      $swrite(tb_state, "%11s", "Initiator");   
      @(posedge pciclk);   
      RUN_INITIATOR_TRANSFER(bar, cmd, master_addr, 31'h01919191, 31'h00000001, 1'b1, start32_initiator, start64_initiator);
      INTERCYCLE_GAP(100);
      RUN_INITIATOR_TRANSFER(bar,cmd, master_addr, 31'h01919191, 31'h00000001, 1'b0, start32_initiator, start64_initiator);
      INTERCYCLE_GAP(100);
      
      RUN_INITIATOR_TRANSFER(bar,cmd, master_addr, 31'h0AFAFAFA, 31'h00000002, 1'b1, start32_initiator, start64_initiator);
      INTERCYCLE_GAP(100);
      RUN_INITIATOR_TRANSFER(bar,cmd, master_addr, 31'h0AFAFAFA, 31'h00000002, 1'b0, start32_initiator, start64_initiator);
      INTERCYCLE_GAP(100);
      
      RUN_INITIATOR_TRANSFER(bar,cmd, master_addr, 31'h06464646, 31'h00000003, 1'b1, start32_initiator, start64_initiator);
      INTERCYCLE_GAP(100);  
      RUN_INITIATOR_TRANSFER(bar,cmd, master_addr, 31'h06464646, 31'h00000003, 1'b0, start32_initiator, start64_initiator);
      INTERCYCLE_GAP(100);  
      
      RUN_INITIATOR_TRANSFER(bar,cmd, master_addr, 31'h0CBCBCBC, 31'h00000004, 1'b1, start32_initiator, start64_initiator);
      INTERCYCLE_GAP(100);
      RUN_INITIATOR_TRANSFER(bar,cmd, master_addr, 31'h0CBCBCBC, 31'h00000004, 1'b0, start32_initiator, start64_initiator);
      INTERCYCLE_GAP(100);  
 
      $display("\nCheck for errors during initiator transactions");         
      READ_DWORD_PCI(bar_addr[0]+32, 6, 0, 1);      
      if ((data_in[31:0] & 32'h00000010)  == 32'h00000010) begin
        $display("ERROR:  Master found error when comparing data read from target");
        $display("ERROR:  Master Status/Control Register: %h", data_in);  
    end else 
      begin 
        $display("\nINFO: All Initiator Transactions successful!"); 
      end   
    end else 
      begin
        $display("\nINFO: BAR0 not enabled so disabling Master transactions!");
      end
    end
  endtask
  
  task RUN_INITIATOR_TRANSFER;
  input integer bar;
  input integer cmd;
  input reg  [31:0] m_addr;
  input reg  [31:0] m_pattern;
  input reg  [31:0] m_length;
  input reg wr_en;  
  input reg start32_initiator;
  input reg start64_initiator;
  
  begin
    $display("\n================================");
    $display("Initiator Transfer Details");
    $display("================================");
    $display("  Address: 32'h%h", m_addr);
    $display("  Length: 32'h%h", m_length);
    $display("  Pattern: 32'h%h", m_pattern);
    $display("  Write Enable = %d", wr_en);

    $display("\nWriting Master Address Register: 32'h%h",m_addr);
    WRITE_DWORD_PCI(bar_addr[bar]+36, m_addr, cmd+1, 0, 1);
    
    INTERCYCLE_GAP(5);
    
    $display("\nWriting Master Length Register: 32'h%h",m_length);
    WRITE_DWORD_PCI(bar_addr[bar]+40, m_length, cmd+1, 0, 1);
    
    INTERCYCLE_GAP(5);

    $display("\nWriting Master Pattern Register: 32'h%h",m_pattern);
    WRITE_DWORD_PCI(bar_addr[bar]+44, m_pattern, cmd+1, 0, 1);
    
    INTERCYCLE_GAP(5);
    
    $display("\nWriting Master Status/Control Register: 32'h%h",{25'h0,wr_en, start64_initiator, start32_initiator, 4'b0});
    WRITE_DWORD_PCI(bar_addr[bar]+32, {25'h0,wr_en, start64_initiator, start32_initiator, 4'b0}, cmd+1, 0, 1);
    end
  endtask
