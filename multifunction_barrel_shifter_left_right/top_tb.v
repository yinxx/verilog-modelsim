`timescale 1 ns/10 ps

module top_tb;
	// Signal declaration
	reg [7:0] a_test;
	reg [2:0] amt_test;
	reg lr_test;
	wire [7:0] y_test;
	
	// Instantiate the circuit under test
	top uut (.a(a_test), .amt(amt_test), .lr(lr_test), .y(y_test));
	
	// Test vector generator
	initial
	begin
		a_test = 8'b10010011;	// Input data
		
		lr_test = 1'b0;		// Rotate left
		
		amt_test = 3'o1;
		# 200;
		
		amt_test = 3'o3;
		# 200;
		
		amt_test = 3'o5;
		# 200;
		
		lr_test = 1'b1;		// Rotate right
		
		amt_test = 3'o2;
		# 200;
		
		amt_test = 3'o4;
		# 200;
		
		amt_test = 3'o6;
		# 200;
		
		// Stop simulation
		$stop;
	end
endmodule
