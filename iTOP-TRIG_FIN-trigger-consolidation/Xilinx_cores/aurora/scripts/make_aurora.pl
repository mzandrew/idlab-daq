#!xilperl
##############################################################################
##
## Project:  Aurora Module Generator version 3.1
##
##    Date:  $Date: 2009/09/08 16:23:49 $
##     Tag:  $Name: i+O-61x+189894 $
##    File:  $RCSfile: make_aurora_v4_pl.ejava,v $
##     Rev:  $Revision: 1.3 $
##
## Company:  Xilinx
##
## (c) Copyright 2004 ? 2009 Xilinx, Inc. All rights reserved.
##
## This file contains confidential and proprietary information
## of Xilinx, Inc. and is protected under U.S. and
## international copyright and other intellectual property
## laws.
##
## DISCLAIMER
## This disclaimer is not a license and does not grant any
## rights to the materials distributed herewith. Except as
## otherwise provided in a valid license issued to you by
## Xilinx, and to the maximum extent permitted by applicable
## law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
## WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
## AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
## BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
## INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
## (2) Xilinx shall not be liable (whether in contract or tort,
## including negligence, or under any other theory of
## liability) for any loss or damage of any kind or nature
## related to, arising under or in connection with these
## materials, including for any direct, or any indirect,
## special, incidental, or consequential loss or damage
## (including loss of data, profits, goodwill, or any type of
## loss or damage suffered as a result of any action brought
## by a third party) even if such damage or loss was
## reasonably foreseeable or Xilinx had been advised of the
## possibility of the same.
##
## CRITICAL APPLICATIONS
## Xilinx products are not designed or intended to be fail-
## safe, or for use in any application requiring fail-safe
## performance, such as life-support or safety devices or
## systems, Class III medical devices, nuclear facilities,
## applications related to the deployment of airbags, or any
## other applications that could lead to death, personal
## injury, or severe property or environmental damage
## (individually and collectively, "Critical Applications"). 
## Customer assumes the sole risk and
## liability of any use of Xilinx products in Critical
## Applications, subject only to applicable laws and
## regulations governing limitations on product liability.
##
## THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
## PART OF THIS FILE AT ALL TIMES.

##
##############################################################################
##
## MAKE_AURORA
##
##
## Description: A Perl script to synthesize and build the aurora reference design
##
##              * Supports designs with 1 4-byte lanes
##
##
##
## Notes:
##      (1) Uses xilperl, a version of the PERL interpreter that ships with Xilinx tools
##      (2) Before running this program, set your simulation environment using config.csh (UNIX) or
##             config.bash (PC with Xilinx Bash shell)
##



    ##Check for required environment variables
    unless($xilinx_path = $ENV{XILINX})
    {
            print" XILINX environment variable has not been set.  This variable\n";
            print" points to your Xilinx ISE tools, and is required to run Aurora\n";
            print" scripts.  Consult the user guide to find out how to edit and run\n";
            print" the appropriate Aurora config script for your system.\n";
            exit;
    }





    ##_____________________Set default values__________________________

    my $use_xst = 1;
    my $use_synplify = 0;
    my $files_only = 0;
    my $npl_only = 0;
    my $black_box = 0;
    my $include_cc = 0;
    my $run_map = 1;
    my $run_par = 1;
    my $run_trace = 0;
    my $run_bit = 1;
    my $use_ngc = 0;
    my $use_edf = 0;
    my $use_example = 1;
    my $use_win = 0;


    ##_____________________Read command line arguments_________________

    while( $option = shift @ARGV )
    {

        # -synplify                 : Use synplify instead of XST. XST is used by default
        if($option =~ /^-synplify/)
        {
            $use_xst = 0;
            $use_synplify = 1;
        }


        # -blackbox                :   Create black box instantiation file
        if($option =~ /^-blackbox/)
        {
            $black_box = 1;
        }


        # -cc                      :   Include clock compensation in black box
        if($option =~ /^-cc/)
        {
            $include_cc = 1;
        }


        # -files                   :   Generate project file only
        if($option =~ /^-files/)
        {
            $files_only = 1;
        }


        # -m                       :   Run map to get a resource cost measurement for the module
        #
        if($option =~ /^-m/)
        {
            $run_map  =   1;
        }


        # -npl                     :   Generate iSE npl project file only
        #
        if($option =~ /^-npl/)
        {
            $npl_only =   1;
        }


        # -p                       :   Run par to get a minimum clock period estimate for the module
        #                              using the constraints defined in the current ucf file.
        if($option =~ /^-p/)
        {
            $run_par  =   1;
        }
        
        # -t
        #
        if($option =~ /^-t/)
        {
           $run_trace =   1;
        }    

        # -h                        : this option produces a brief help message
        if($option =~ /^-h/)
        {
            show_help();
            exit;
        }

        # -b                        : Create a bitstream for the design
        if($option =~ /^-b/)
        {
            $run_bit = 1;
        }

        # -example                   : use the example design instead of the raw aurora design. The raw design shouldn't
        #                             be instantiated directly on a device - it's user I/O is set up for internal
        #                             connections rather than external connections
        if($option =~ /^-example/)
        {
            $use_example = 1;
        }


        # -win                      : switch for OS
        if($option =~ /^-win/)
        {
            $use_win = 1;
        }



    }#next command line argument





    ##__________________________Check for Synplicity and XST_____________________________

        if($use_synplify == 1 && $npl_only == 1)
        {
            print" Cannot specify -synplify and -npl together.  -npl may, optionally, be\n";
            print" used with -example.\n\n";
            exit;
        }


    ##__________________________________Run Synthesis____________________________________


        #Generate synthesis project file
        if ($npl_only == 1)
        {
            print "### Generating iSE npl project file ...\n\n";
        } else {
            print "### Generating synthesis project file ...\n\n";
        }


        #Make a list of files that must be synthesized to create a working module
        my @AURORA_MODULES = (

                            #Aurora Lane Modules
                            "../src/aurora_chbond_count_dec_4byte",
                            "../src/aurora_error_detect_4byte",
                            "../src/aurora_lane_init_sm_4byte",
                            "../src/aurora_sym_dec_4byte",
                            "../src/aurora_sym_gen_4byte",
                            "../src/aurora_aurora_lane_4byte",



                            #Global Logic Modules
                            "../src/aurora_channel_error_detect",
                            "../src/aurora_channel_init_sm",
                            "../src/aurora_idle_and_ver_gen",
                            "../src/aurora_global_logic",



                            #TX_Stream Module
                            "../src/aurora_tx_stream",


                            #RX_Stream Module
                            "../src/aurora_rx_stream",



                            #MGT Wrapper
                            "../src/aurora_mgt_wrapper",
                            "../src/aurora_unused_mgt",
                            "../src/aurora_cal_block_v1_4_1",                            


                            #Top Level Files
                            "../src/aurora"
                        ); #end AURORA_MODULE list






    if($use_example)
    {
        @AURORA_MODULES = (@AURORA_MODULES,
                            "../examples/aurora_frame_gen",
                            "../examples/aurora_frame_check",
                            "../cc_manager/aurora_standard_cc_module",
                            "../examples/aurora_aurora_example");
    }




   ##______________ Generate Project file for Xilinx Project Navigator_______________


    if($npl_only == 1)
    {
        #Create an iSE npl project file
        open NPL_FILE, ">make_aurora.npl";
        print NPL_FILE "JDF G\n";
        print NPL_FILE "// Created by Make_Aurora ver 2.2\n";
        print NPL_FILE "PROJECT work\n";
        print NPL_FILE "DESIGN work\n";
        print NPL_FILE "DEVFAM virtex4\n";
        print NPL_FILE "DEVFAMTIME 0\n";

        print NPL_FILE "DEVICE xc4vfx40\n";
        print NPL_FILE "DEVICETIME 0\n";
        print NPL_FILE "DEVPKG ff672\n";
        print NPL_FILE "DEVPKGTIME 0\n";

        print NPL_FILE "DEVSPEED -10\n";
        print NPL_FILE "DEVSPEEDTIME 0\n";
        print NPL_FILE "DEVTOPLEVELMODULETYPE HDL\n";
        print NPL_FILE "TOPLEVELMODULETYPETIME 0\n";
        print NPL_FILE "DEVSYNTHESISTOOL XST (VHDL/Verilog)\n";
        print NPL_FILE "SYNTHESISTOOLTIME 0\n";
        print NPL_FILE "DEVSIMULATOR Other\n";
        print NPL_FILE "SIMULATORTIME 0\n";
        print NPL_FILE "DEVGENERATEDSIMULATIONMODEL Verilog\n";
        print NPL_FILE "GENERATEDSIMULATIONMODELTIME 0\n";
        print NPL_FILE "SOURCE ".$xilinx_path ."/verilog/src/iSE/unisim_comp.v\n";

        foreach $module (@AURORA_MODULES)
        {
            print NPL_FILE "SOURCE " . $module . ".v\n";
        }

        if($use_example == 1)
        {
            print NPL_FILE "DEPASSOC aurora_example ../ucf/aurora_aurora_example.ucf\n";
        } else {
            print NPL_FILE "DEPASSOC aurora ../ucf/aurora.ucf\n";
        }

        print NPL_FILE "[Normal]\n";
        print NPL_FILE "p_xstBusDelimiter=xstvlg, virtex4, Verilog.t_synthesize, 0, []\n";
        print NPL_FILE "p_xstHierarchySeparator=xstvlg, virtex4, Verilog.t_synthesize, 0, /\n";

        if($use_example == 1)
        {
            print NPL_FILE "p_xstPackIORegister=xstvlg, virtex4, Verilog.t_synthesize, 0, Yes\n";
        }

        print NPL_FILE "_SynthExtractRAM=xstvlg, virtex4, Verilog.t_synthesize, 0, False\n";
        print NPL_FILE "_SynthExtractROM=xstvlg, virtex4, Verilog.t_synthesize, 0, False\n";
        print NPL_FILE "[STRATEGY-LIST]\n";
        print NPL_FILE "Normal=True\n";
        close NPL_FILE;
        exit;
    }



    ##__________________________________ Create XST Project File _________________________________

    if($use_xst == 1)
    {
        #Create an XST project file
        open PRJ_FILE, ">make_aurora.prj";
        print PRJ_FILE "`timescale 1ns/1ns\n";
        print PRJ_FILE "\n\n";


        foreach $module (@AURORA_MODULES)
        {
            print PRJ_FILE "`include \"" . $module . ".v\"\n";
        }

        print PRJ_FILE "`include \"".$xilinx_path ."/verilog/src/iSE/unisim_comp.v\"\n";
        close PRJ_FILE;


    ##__________________________________ Create XST Script File __________________________________

        #Create an XST script file
        open SCR_FILE, ">make_aurora.scr";
        print SCR_FILE "\n";
        print SCR_FILE "run\n";
        print SCR_FILE "-ifn make_aurora.prj\n";
        print SCR_FILE "-ifmt VERILOG\n";
        if($use_example){print SCR_FILE "-ofn aurora_example.ngc\n";}
        else{print SCR_FILE "-ofn aurora.ngc\n";}
        print SCR_FILE "-ofmt NGC\n";

        print SCR_FILE "-p xc4vfx40-10ff672\n";
    if($use_example){
        print SCR_FILE "-top aurora_aurora_example\n";
        }else{
            print SCR_FILE "-top aurora\n";
        }
        print SCR_FILE "-opt_mode Speed\n";
        print SCR_FILE "-opt_level 1\n";
        print SCR_FILE "-iuc NO\n";
        print SCR_FILE "-keep_hierarchy NO\n";
        print SCR_FILE "-glob_opt AllClockNets\n";
        print SCR_FILE "-rtlview Yes\n";
        print SCR_FILE "-read_cores YES\n";
        print SCR_FILE "-write_timing_constraints NO\n";
        print SCR_FILE "-cross_clock_analysis NO\n";
        print SCR_FILE "-hierarchy_separator /\n";
        print SCR_FILE "-bus_delimiter []\n";
        print SCR_FILE "-case maintain\n";
        print SCR_FILE "-slice_utilization_ratio 100\n";
        print SCR_FILE "-verilog2001 YES\n";
        print SCR_FILE "-vlgincdir {}\n";
        print SCR_FILE "-fsm_extract YES\n";
        print SCR_FILE "-fsm_encoding Auto\n";
        print SCR_FILE "-ram_extract No\n";
        print SCR_FILE "-ram_style Auto\n";
        print SCR_FILE "-rom_extract No\n";
        print SCR_FILE "-rom_style Auto\n";
        print SCR_FILE "-mux_extract YES\n";
        print SCR_FILE "-mux_style Auto\n";
        print SCR_FILE "-decoder_extract YES\n";
        print SCR_FILE "-priority_extract YES\n";
        print SCR_FILE "-shreg_extract YES\n";
        print SCR_FILE "-shift_extract YES\n";
        print SCR_FILE "-xor_collapse YES\n";
        print SCR_FILE "-resource_sharing YES\n";
        print SCR_FILE "-mult_style auto\n";
        print SCR_FILE "-iobuf YES\n";
        print SCR_FILE "-max_fanout 500\n";
        print SCR_FILE "-bufg 16\n";
        print SCR_FILE "-register_duplication YES\n";
        print SCR_FILE "-equivalent_register_removal YES\n";
        print SCR_FILE "-register_balancing No\n";
        print SCR_FILE "-slice_packing YES\n";
        print SCR_FILE "-signal_encoding user\n";
        if($use_example){print SCR_FILE "-iob true\n";}
        else{print SCR_FILE "-iob false\n";}
        print SCR_FILE "-slice_utilization_ratio_maxmargin 5\n";
        close SCR_FILE;


        #Run xst
        if($files_only == 0)
        {
            system ("xst -ifn make_aurora.scr");
        }
    }
    ##end if use_xst


    if($use_synplify == 1)
    {
        #Create a Synplify project file
        open  PRJ_FILE, ">make_aurora.prj";
        print PRJ_FILE "#Synplify project file for aurora\n";
        print PRJ_FILE "\n\n";

        foreach $module (@AURORA_MODULES)
        {
            print PRJ_FILE "add_file -verilog \"" . $module . ".v\"\n";

        }

        print PRJ_FILE "\n\n";
        if($use_example){print PRJ_FILE "project -result_file \"aurora_example.edf\"\n";}
        else{print PRJ_FILE "project -result_file \"aurora.edf\"\n";}
        if($use_example){print PRJ_FILE "set_option -top_module aurora_aurora_example\n";}
        else{print PRJ_FILE "set_option -top_module aurora\n";}
        print PRJ_FILE "set_option -technology virtex4\n";

        print PRJ_FILE "set_option -part xc4vfx40\n";
        print PRJ_FILE "set_option -package ff672\n";

        print PRJ_FILE "set_option -speed_grade -10\n";

        print PRJ_FILE "\n\n";
        print PRJ_FILE "#compilation/mapping options\n";
        print PRJ_FILE "set_option -default_enum_encoding default\n";
        print PRJ_FILE "set_option -symbolic_fsm_compiler 1\n";
        print PRJ_FILE "set_option -resource_sharing 1\n";

        print PRJ_FILE "\n";
        print PRJ_FILE "#map options\n";
        print PRJ_FILE "set_option -frequency 160.000\n";
        print PRJ_FILE "set_option -fanout_limit 100\n";
        print PRJ_FILE "set_option -disable_io_insertion 0\n";
        print PRJ_FILE "set_option -pipe 0\n";
        print PRJ_FILE "set_option -retiming 0\n";

        print PRJ_FILE "\n";
        print PRJ_FILE "#simulation options\n";
        print PRJ_FILE "set_option -write_verilog 0\n";
        print PRJ_FILE "set_option -write_vhdl 0\n";
        print PRJ_FILE "set_option -vlog_std v2001\n";

        print PRJ_FILE "\n";
        print PRJ_FILE "#Do not generate ncf constraints file\n";
        print PRJ_FILE "set_option -write_apr_constraint 0\n";

        close PRJ_FILE;


        #Run synplify_pro using the script
        if($files_only == 0)
        {
            $synplify_command = "$ENV{SYNPLIFY_COMMAND}/synplify_pro";
            print "### Running Synplify Pro ### ";
            print "Command is: ".$synplify_command." -batch make_aurora.prj\n";
            print "\n";
            print "To customize <SYNPLIFY_COMMAND>, set the SYNPLIFY_COMMAND environment variable\n";
            print "\n\n";
            
            

            if($use_example){print "see \"aurora_example.srr\" for results...\n\n";}
            else{print "see \"aurora.srr\" for results...\n\n";}

            system ($synplify_command." -batch make_aurora.prj");
        }
    }
    ##end if use_synplify

    if($files_only == 1)
    {
        exit;
    }

    #_____________________________ Run ngdbuild __________________________________
    if($run_map == 1 || $run_par == 1)
    {
        if($use_example)
        {
            $use_ngc  =   (-e "aurora_example.ngc");
            $use_edf  =   (-e "aurora_example.edf");
        }
        else
        {
            $use_ngc  =   (-e "aurora.ngc");
            $use_edf  =   (-e "aurora.edf");
        }

        if( $use_ngc && $use_edf )
        {
            #if there are 2 netlists available, decide which one to use based on the command
            #line arguments
            if($use_xst == 1){$use_edf = 0;}
            else
            {
                if($use_synplify == 1){$use_ngc = 0;}
                else
                {
                    print "Its not clear which netlist you wish to use. Please delete either aurora.ngc\n";
                    print " or aurora.edf\n";
                    exit;
                }
            }
        }

        if( !$use_ngc && !$use_edf)
        {
            print "No netlist found\n";
            exit;
        }

        if($use_ngc == 1)
        {
            if($use_example)
            {
                system ("ngdbuild -uc ../ucf/aurora_aurora_example.ucf -p xc4vfx40-ff672-10 aurora_example.ngc aurora_example.ngd");
            }
            else
            {
                system ("ngdbuild -uc ../ucf/aurora.ucf -p xc4vfx40-ff672-10 aurora.ngc aurora.ngd");
            }
        }
        else
        {
            #use_edf
            if($use_example)
            {
                system ("ngdbuild -uc ../ucf/aurora_aurora_example.ucf -p xc4vfx40-ff672-10 aurora_example.edf aurora_example.ngd");
            }
            else
            {
                system ("ngdbuild -uc ../ucf/aurora.ucf -p xc4vfx40-ff672-10 aurora.edf aurora.ngd");
            }
        }

    }
    #end run ngdbuild section



    #_____________________________   Run map   ___________________________________
    if($run_map == 1)
    {
        if($use_example)
        {
            system("map -p xc4vfx40-ff672-10 -timing -o top_unroute.ncd aurora_example.ngd top_unroute.pcf");
         if($use_win)
         {
            system("find  \"Number of Slice LUTs\" aurora_example_map.mrp");
            system("find  \"Number of Slice Registers\" aurora_example_map.mrp");
         }
         else
         {
            system("grep \"Number of Slice LUTs\" aurora_example_map.mrp");
            system("grep \"Number of Slice Registers\" aurora_example_map.mrp");
         }

        }
        else
        {
            system("map -p xc4vfx40-ff672-10 -timing -o top_unroute.ncd aurora.ngd top_unroute.pcf");

           if($use_win)
            {
            system("find  \"Number of Slice LUTs\" aurora_map.mrp");
            system("find  \"Number of Slice Registers\" aurora_map.mrp");
            }
            else
            {
            system("grep \"Number of Slice LUTs\" aurora_map.mrp");
            system("grep \"Number of Slice Registers\" aurora_map.mrp");
            }
        }


    }


    #_____________________________ Run par _______________________________________
    if($run_par == 1)
    {
        if($use_example)
        {
            system("par -w -t 1 top_unroute.ncd aurora_example.ncd top_unroute.pcf");
        }
        else
        {
            system("par -w -t 1 top_unroute.ncd aurora.ncd top_unroute.pcf");
        }

    }


    #______________________________ Report par results ___________________________
    if($run_bit == 1)
    {
        if($use_example)
        {
            system("bitgen -g GWE_cycle:Done -g GTS_cycle:Done -g DriveDone:Yes -g DCMShutdown:Enable -g StartupClk:JTAGClk -w aurora_example.ncd");
        }
        else
        {
            system("bitgen -g GWE_cycle:Done -g GTS_cycle:Done -g DriveDone:Yes -g DCMShutdown:Enable -g StartupClk:JTAGClk -w aurora.ncd");
        }

    }

    #-------------------------------Trace Report---------------------------------------
  if($run_trace == 1)
  {
     if($use_example)
     { 
          system("trce -e -l 1000 -s -10 aurora_example.ncd -o smartpreview.twr top_unroute.pcf");
     }
     else
     {
         system("trce -e -l 1000 -s -10 aurora.ncd -o smartpreview.twr top_unroute.pcf");
     }
} 
   
   #-------------------------------Run netgen------------------------------------------
if($use_example)
 {
      
     
         
         system("netgen -ofmt verilog -sim -sdf_anno false -dir . -tm aurora_aurora_example -w aurora_example.ncd aurora_example.v")

     }
else
{
     
     
         
         system("netgen -ofmt verilog -sim -sdf_anno false -dir . -tm aurora_aurora_example -w aurora.ncd aurora.v")

     }



#************************************ Subroutines **********************************************


    sub show_help
    {
        print"\nMAKE AURORA HELP\n\n";
        print"  make_aurora [synthesis options]\n\n";
        print"synthesis options:\n\n";
#       print"................................................................................\n\n";
        print" -b        Generate a bitstream for the design.\n\n";
#       print" -blackbox Produces a black box file for instantiation in your design.\n\n";
#       print" -cc       Used in conjunction with -blackbox, above, instantiates clock\n";
#       print"           compensation module in the black box file.  See User Guide for more\n";
#       print"           details.\n\n";
        print" -files    Creates an XST project file only.  If used in conjunction with\n";
        print"           -synplify, below, creates a synplicity project file only.\n\n";
        print" -h        Displays this message.  For more info, please see the Aurora user\n";
        print"           guide.\n\n";
        print" -m        Runs ngdbuild followed by map to get a resource cost measurement for\n";
        print"           the module.\n\n";
        print" -npl      Creates an ISE .npl project file only.  Can be used by itself or\n";
        print"           with -example, below.\n\n";
        print" -p        Runs par to get a minimum clock period estimate for the module using\n";
        print"           the timing constraints defined in the UFC file.  Will run ngdbuild\n";
        print"           and map if neccessary.\n\n";
        print" -example   Use aurora_example as the top level.  Use this option when\n";
        print"           instantiating the design in hardware.\n\n";
        print" -synplify Use Synplify to synthesize the aurora design.  XST is used by\n";
        print"           default.\n\n";
    }
