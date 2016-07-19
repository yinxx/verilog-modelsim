module top
	(
		input wire [11:0] in,
		input wire en,
		output wire [11:0] out,
		output wire ovf	
	);
	
	// Signal declaration
	wire c1, c2;

	// Body
	bcd_incrementer bcd_incrementer_digit_1_unit
		(.in(in[3:0]), .en(en), .out(out[3:0]), .carry(c1));
	
	bcd_incrementer bcd_incrementer_digit_2_unit
		(.in(in[7:4]), .en(c1), .out(out[7:4]), .carry(c2)); 

	bcd_incrementer bcd_incrementer_digit_3_unit
		(.in(in[11:8]), .en(c2), .out(out[11:8]), .carry(ovf));  
	
endmodule
