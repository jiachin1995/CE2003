`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:32:02 01/23/2020
// Design Name:   fsm
// Module Name:   E:/lab1/lab1_FSM_tb.v
// Project Name:  lab1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fsm
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module lab1_FSM_tb;

	// Inputs
	reg clk;
	reg rst;
	reg fifty;
	reg dollar;
	reg cancel;

	// Outputs
	wire insert_coin;
	wire money_return;
	wire dispense;
	wire [1:0] st;

	// Instantiate the Unit Under Test (UUT)
	fsm uut (
		.clk(clk), 
		.rst(rst), 
		.fifty(fifty), 
		.dollar(dollar), 
		.cancel(cancel), 
		.insert_coin(insert_coin), 
		.money_return(money_return), 
		.dispense(dispense), 
		.st(st)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		fifty = 0;
		dollar = 0;
		cancel = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		clk = 0; rst = 0; fifty = 0; dollar = 0; cancel = 0;
		#10 rst = 1;    // to INIT (0) state
		#10 fifty = 1;    // to S50c (1) state
		#10 fifty = 0;
		#10 fifty = 1;    // to VEND (2) state
		#10 fifty = 0;
		#20 rst = 0;    // RESET, to INIT (0) state
		#10 rst = 1;
		#10 dollar = 1;    // to  VEND (2) state
		#10 dollar = 0;
		#20 rst = 0;    // RESET, to INIT (0) state
		#10 rst = 1;
		#10 fifty = 1;    // to S50c (1) state
		#10 fifty = 0;
		#10 dollar = 1;    // to RETURN (3) state
		#10 dollar = 0;    // to INIT (0) state
		#20 fifty = 1;    // to S50c (1) state
		#10 fifty = 0;
		#10 cancel = 1;    // to RETURN (3) state
		#10 cancel = 0;    // to INIT (0) state
		#20 $finish();
	end
      
	always #5 clk = ~clk;
		
endmodule

