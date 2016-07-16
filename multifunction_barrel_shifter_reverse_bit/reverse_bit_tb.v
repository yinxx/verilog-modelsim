`timescale 1 ns/10 ps

module reverse_bit_tb;
	// Signal declaration
	reg [7:0] a_test;
	reg en_test;
	wire [7:0] y_test;
	
	// Instantiate the circuit under test
	reverse_bit uut (.a(a_test), .en(en_test), .y(y_test));
	
	// Test vector generator
	initial
	begin
		en_test = 1'b0;
		
		a_test = 8'b10010011;
		# 200;

		a_test = 8'b11100101;
		# 200;
		
		a_test = 8'b00111110;
		# 200;
		
		en_test = 1'b1;
		
		a_test = 8'b10010011;
		# 200;

		a_test = 8'b11100101;
		# 200;
		
		a_test = 8'b00111110;
		# 200;
		
		// Stop simulation
		$stop;
	end
	
endmodule