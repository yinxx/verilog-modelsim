`timescale 1 ns/ 10 ps

module top_tb;
	// Signal declaration 
	reg [11:0] r_test;
	wire [3:0] p1_test;
	wire [3:0] p2_test;
	
	// Instantiate the circuit under test
	top uut (.r(r_test), .p1(p1_test), .p2(p2_test));
	
	// Test vector generator
	initial
	begin
		r_test = 12'b100000000000;
		# 200;
		r_test = 12'b000010000000;
		# 200;
		r_test = 12'b000011000000;
		# 200;
		r_test = 12'b000010100000;
		# 200;
		r_test = 12'b000010001000;
		# 200;
		r_test = 12'b000010101000;
		# 200;
		r_test = 12'b100000000001;
		# 200;
		r_test = 12'b000000000000;
		# 200;
		// Stop simulation
		$stop;
	end
	
endmodule
