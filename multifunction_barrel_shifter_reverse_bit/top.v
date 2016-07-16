module top
	(
		input wire [7:0] a,		// Input
		input wire [2:0] amt,	// Number of rotation
		input wire lr,			// Rotate left(lr=0) or right(lr=1) 
		output wire [7:0] y		// Output
	);
	
	// Signal declaration
	wire [7:0] pre_reversed, post_reverse;
	
	// Body
	barrel_shifter barrel_shifter_unit
		(.a(pre_reversed), .amt(amt), .y(post_reverse));
		
	reverse_bit pre_reverse_bit_unit 
		(.a(a), .en(lr), .y(pre_reversed));
		
	reverse_bit post_reverse_bit_unit 
		(.a(post_reverse), .en(lr), .y(y));
	
endmodule