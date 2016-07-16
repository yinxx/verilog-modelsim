module top
	(
		input wire [11:0] r,
		output wire [3:0] p1,
		output wire [3:0] p2
	);
	
	// Signal declaration
	wire [3:0] first_prio_out;
	wire [11:0] first_prio_out_decode;
	reg [11:0] second_encoder_input;
	
	// Body
	priority_encoder_12_4 first_priority_encoder_unit 
		(.r(r), .y(first_prio_out));

	priority_encoder_12_4 second_priority_encoder_unit 
		(.r(second_encoder_input), .y(p2));
	
	decoder_4_12 uut (.a(first_prio_out), .y(first_prio_out_decode));
	
	always @*
		begin
			second_encoder_input = ~first_prio_out_decode & r;
		end
	
	assign p1 = first_prio_out;
	
endmodule
