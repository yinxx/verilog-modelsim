`timescale 1 ns/10 ps

module mux2_tb;
	// Signal declaration
	reg [7:0] d0_test, d1_test;
	reg s_test;
	wire [7:0] y_test;
	
	// Instantiate the circuit under test
	mux2 #(.D_BIT(8)) uut 
		(.d0(d0_test), .d1(d1_test), .s(s_test), .y(y_test));
	
	// Test vector generator
	initial
	begin
		d0_test = 8'b00000000;
		d1_test = 8'b11111111;
		
		s_test = 1'b0;
		# 200;
		
		s_test = 1'b1;
		# 200;
		
		// Stop simulation
		$stop;
	end
	
endmodule
