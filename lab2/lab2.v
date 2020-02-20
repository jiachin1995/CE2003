`timescale 1ns / 1ps

module fsm ( input clk, rst, write_en, save_data, show_reg,
			 input [7:0] d_in,
			 output [7:0] d_out);

	reg [7:0] data_reg;
	reg [7:0] ramdata [0:63];

	wire [5:0] addr;
	assign addr = d_in [5:0];
		
	always @(posedge clk)
		begin
			if (!rst) 
				data_reg <= 0;
			else if (save_data)
				data_reg <= d_in;
				
			if (write_en) ramdata[addr] <= data_reg;
				

		end
				
	assign d_out = (show_reg)? ramdata[addr]:data_reg;

endmodule
