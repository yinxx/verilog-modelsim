`timescale 1 ns/ 10 ps

module decoder_4_12_tb;
	// Signal declaration
	reg [3:0] a_test;
	wire [11:0] y_test;
	
	// Instantiate the circuit under test
	decoder_4_12 uut (.a(a_test), .y(y_test));

	// Test vector generator
	initial
	begin
		a_test = 4'b0000;
		# 200;
		a_test = 4'b0010;
		# 200;
		a_test = 4'b0011;
		# 200;
		a_test = 4'b0100;
		# 200;
		a_test = 4'b1000;
		# 200;
		a_test = 4'b1001;
		# 200;
		a_test = 4'b1010;
		# 200;
		a_test = 4'b1111;
		# 200;
		// Stop simulation
		$stop;
	end
	
endmodule
