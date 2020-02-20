`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:15:26 02/20/2020 
// Design Name: 
// Module Name:    lab2_top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module lab2_top( input clk, rst, write_en, save_data, show_reg,
			 input [7:0] d_in,
			 output[7:0] d_out,
			 
			 output seg_Tg_out,
			 output [6:0] seg
			 
			 );
			 
	 wire clk_drive;
	 wire write_en_deb;
	 wire save_data_deb;
	 
	 
	 fsm U1 (.clk(clk), .rst(rst), .write_en(write_en_deb), .save_data(save_data_deb), .show_reg(show_reg),
			 .d_in(d_in),
			 .d_out(d_out));
	 
	 
	 clkGen_7seg U2 (.i_clk(clk), .o_clk(clk_drive), .seg_Tg_out(seg_Tg_out), .seg(seg));
	 
	 debounce U3 (.i_clk(clk_drive),.i_swtch(write_en),.o_pulse(write_en_deb));
	 debounce U4 (.i_clk(clk_drive),.i_swtch(save_data),.o_pulse(save_data_deb));
	 

endmodule
