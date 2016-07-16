module mux2
	#(
		parameter D_BIT = 8		// Number of data bits
	)
	(
		input wire [D_BIT-1:0] d0, d1,
		input wire s,
		output reg [D_BIT-1:0] y
	);

	// Body
	always @*
		if (~s)
			y = d0;
		else
			y = d1;

endmodule
