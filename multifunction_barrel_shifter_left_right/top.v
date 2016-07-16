module top
	(
		input wire [7:0] a,		// Input
		input wire [2:0] amt,	// Number of rotation
		input wire lr,			// Rotate left(lr=0) or right(lr=1) 
		output wire [7:0] y		// Output
	);

	// Signal declaration
	wire [7:0] rotated_left, rotated_right;
	
	// Body
	rotate_left rotate_left_unit
		(.a(a), .amt(amt), .y(rotated_left));
	
	rotate_right rotate_right_unit
		(.a(a), .amt(amt), .y(rotated_right));
		
	mux2 mux2_unit
		(.d0(rotated_left), .d1(rotated_right), .s(lr), .y(y));
	
endmodule
