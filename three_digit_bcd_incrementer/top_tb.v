`timescale 1 ns/ 10 ps

module top_tb;
	// Signal declaration 
	reg [11:0] in_test;
	reg en_test;
	wire [11:0] out_test;
	wire ovf_test;
	
	// Instantiate the circuit under test
	top uut (.in(in_test), .en(en_test), .out(out_test), .ovf(ovf_test));
	
	// Test vector generator
	initial
	begin
		en_test = 1'b0;

		in_test = 12'b000000000000;	// 000
		# 200;
		in_test = 12'b000000000011;	// 003
		# 200;
		in_test = 12'b000000100011;	// 023
		# 200;
		in_test = 12'b000100100011;	// 123
		# 200;
		in_test = 12'b000100101001;	// 129
		# 200;
		in_test = 12'b000110010011;	// 193
		# 200;
		in_test = 12'b100100100011;	// 923
		# 200;
		in_test = 12'b000010011001;	// 099
		# 200;
		in_test = 12'b100100001001;	// 909
		# 200;
		in_test = 12'b100110010000;	// 990
		# 200;
		in_test = 12'b100110011001;	// 999
		# 200;
	
		en_test = 1'b1;

		in_test = 12'b000000000000;	// 000
		# 200;
		in_test = 12'b000000000011;	// 003
		# 200;
		in_test = 12'b000000100011;	// 023
		# 200;
		in_test = 12'b000100100011;	// 123
		# 200;
		in_test = 12'b000100101001;	// 129
		# 200;
		in_test = 12'b000110010011;	// 193
		# 200;
		in_test = 12'b100100100011;	// 923
		# 200;
		in_test = 12'b000010011001;	// 099
		# 200;
		in_test = 12'b100100001001;	// 909
		# 200;
		in_test = 12'b100110010000;	// 990
		# 200;
		in_test = 12'b100110011001;	// 999
		# 200;

		// Stop simulation
		$stop;
	end
	
endmodule
