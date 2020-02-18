`timescale 1ns / 1ps



clk, rst, write_en, save_data
and show_reg inputs, along with an 8‐bit d_in input and an 8‐bit d_out output.




module fsm ( input clk, rst, write_en, save_data, show_reg,
			 input reg [7:0] d_in,
			 output reg [7:0] d_out);

	reg [7:0] data_reg;
	reg [7:0] ramdata [0:63];

	wire [5:0] addr;
	assign addr = d_in [5:0];
		
	always @(posedge clk)
		begin
			if (!rst) 
				data_reg <= 0;
			else if (save_data)
				data_reg  <= d_in;
				
			if (write_en) ramdata[addr] <= data_reg;
		end
				
	always @ *
		begin
			if (show_reg) d_out <= ramdata[addr];
			else d_out <= data_reg;	
		end
endmodule
