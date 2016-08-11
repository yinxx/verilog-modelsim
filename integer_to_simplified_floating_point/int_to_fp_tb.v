`timescale 1 ns/10 ps

module int_to_fp_tb;
	// Signal declaration
	reg [7:0] int_in_test;
	wire [12:0] fp_out_test;

	// Instantiate the circuit under test
	int_to_fp uut (.int_in(int_in_test), .fp_out(fp_out_test));
	
	// Test vector generator
	initial
	begin
		int_in_test = 8'b00000000;	// +0
		# 200;
		int_in_test = 8'b10000000;	// -0
		# 200;
		int_in_test = 8'b00000001;	// +1
		# 200;
		int_in_test = 8'b10000001;	// -1
		# 200;
		int_in_test = 8'b00000010;	// +2
		# 200;
		int_in_test = 8'b10000010;	// -2
		# 200;
		int_in_test = 8'b00100100;	// +36
		# 200;
		int_in_test = 8'b10100100;	// -36
		# 200;
		int_in_test = 8'b01111111;	// +127
		# 200;
		int_in_test = 8'b11111111;	// -127
		# 200;
		
		// Stop simulation
		$stop;
	end

endmodule
