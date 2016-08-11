module int_to_fp
	(
		input wire [7:0] int_in,
		output reg [12:0] fp_out
	);
	
	// Signal declaration
	localparam N_BIT = 8;
	reg [6:0] int_mag;
	reg [3:0] fp_exp;
	reg [7:0] fp_frac;
	reg [3:0] lead0;
	
	// Body
	always @*
	begin
		int_mag[6:0] = int_in[6:0];
	
		// Get floating point exponent
		if (int_mag[6])
			fp_exp = 4'o7;
		else if (int_mag[5])
			fp_exp = 4'o6;
		else if (int_mag[4])
			fp_exp = 4'o5;
		else if (int_mag[3])
			fp_exp = 4'o4;
		else if (int_mag[2])
			fp_exp = 4'o3;
		else if (int_mag[1])
			fp_exp = 4'o2;
		else if (int_mag[0])
			fp_exp = 4'o1;
		else
			fp_exp = 4'o0;
		
		// Get floating point fraction by shifting 
		// int magnitude according to leading 0
		lead0 = N_BIT - fp_exp;
		fp_frac = int_mag << lead0;
		
		// Form output
		fp_out[12] = int_in[7];		// Sign
		fp_out[11:8] = fp_exp[3:0];
		fp_out[7:0] = fp_frac[7:0];
	end
	
endmodule
