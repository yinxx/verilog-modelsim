module fp_to_int
	(
		input wire [12:0] fp_in,
		output reg [7:0] int_out,
		output reg uf, of
	);
	
	// Signal declaration
	localparam N_BIT = 8;
	reg [3:0] fp_exp;
	reg [7:0] fp_frac;
	reg [7:0] int_mag;
	reg [3:0] lead0;
	
	// Body
	always @*
	begin
		fp_exp = fp_in[11:8];
		fp_frac = fp_in[7:0];
		
		// Default value
		uf = 1'b0;
		of = 1'b0;
		
		if (fp_frac == 8'b00000000)		// Zero (frac = 0)
			int_mag = 8'b00000000;
		else if (fp_exp < 4'b0001)		// Underflow (exp < 1)
			begin
				int_mag = 8'b00000000;
				uf = 1'b1;
			end
		else if (fp_exp > 4'b0111)		// Overflow (exp > 7)
			begin
				int_mag = 8'b11111111;
				of = 1'b1;
			end
		else
			begin
				// Get int magnitude by adding
				// leading 0 to floating point fraction  
				lead0 = N_BIT - fp_exp;
				int_mag = fp_frac >> lead0;
			end
			
		// Form output
		int_out[7] = fp_in[12];		// Sign
		int_out[6:0] = int_mag[6:0];	
	end

endmodule
