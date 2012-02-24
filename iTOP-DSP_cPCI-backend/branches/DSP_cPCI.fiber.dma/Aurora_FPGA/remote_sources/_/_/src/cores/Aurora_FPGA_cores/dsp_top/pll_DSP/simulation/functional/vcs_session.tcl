gui_open_window Wave
gui_sg_create pll_DSP_group
gui_list_add_group -id Wave.1 {pll_DSP_group}
gui_sg_addsignal -group pll_DSP_group {pll_DSP_tb.test_phase}
gui_set_radix -radix {ascii} -signals {pll_DSP_tb.test_phase}
gui_sg_addsignal -group pll_DSP_group {{Input_clocks}} -divider
gui_sg_addsignal -group pll_DSP_group {pll_DSP_tb.CLK_IN1}
gui_sg_addsignal -group pll_DSP_group {{Output_clocks}} -divider
gui_sg_addsignal -group pll_DSP_group {pll_DSP_tb.dut.clk}
gui_list_expand -id Wave.1 pll_DSP_tb.dut.clk
gui_sg_addsignal -group pll_DSP_group {{Status_control}} -divider
gui_sg_addsignal -group pll_DSP_group {pll_DSP_tb.LOCKED}
gui_sg_addsignal -group pll_DSP_group {{Counters}} -divider
gui_sg_addsignal -group pll_DSP_group {pll_DSP_tb.COUNT}
gui_sg_addsignal -group pll_DSP_group {pll_DSP_tb.dut.counter}
gui_list_expand -id Wave.1 pll_DSP_tb.dut.counter
gui_zoom -window Wave.1 -full
