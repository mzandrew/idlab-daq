`timescale 1ns/1ps

module transceiver_io(
		      input mod0,
		      input mod2,
		      input rx_loss,
		      input tx_fault,
		      output mod1,
		      output tx_dis,
		      
		      output mod0_o,
		      output mod2_o,
		      output tx_fault_o,
		      output rx_loss_o
		     );

IBUF mod0_buf(.I(mod0),.O(mod0_o));
IBUF mod2_buf(.I(mod2),.O(mod2_o));
IBUF rx_loss_buf(.I(rx_loss),.O(rx_loss_o));
IBUF tx_fault_buf(.I(tx_fault),.O(tx_fault_o));

OBUF mod1_buf (.I(1'b0),.O(mod1));
OBUF tx_dis_buf (.I(1'b0),.O(tx_dis));


endmodule

