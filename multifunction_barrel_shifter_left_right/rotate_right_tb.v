`timescale 1 ns/10 ps

module rotate_right_tb;
	// Signal declaration
	reg [7:0] a_test;
	reg [2:0] amt_test;
	wire [7:0] y_test;
	
	// Instantiate the circuit under test
	rotate_right uut (.a(a_test), .amt(amt_test), .y(y_test));
	
	// Test vector generator
	initial
	begin
		a_test = 8'b10010011;
		
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
