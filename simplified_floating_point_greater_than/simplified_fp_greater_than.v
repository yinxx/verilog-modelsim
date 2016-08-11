module simplified_fp_greater_than
	(
		input wire [12:0] a, b,
		output reg gt
	);
	
	// Body
	always @*
	begin
		case ({a[12], b[12]})
			2'b01: gt = 1'b1;	// a plus, b minus (a > b)
			2'b10: gt = 1'b0;	// a minus, b plus (a < b)
			2'b00:			// a plus, b plus		
				begin
					if (a[11:0] > b[11:0])
						gt = 1'b1;
					else
						gt = 1'b0;
				end
			2'b11:			// a minus, b minus
				begin
					if (a[11:0] < b[11:0])
						gt = 1'b1;
					else
						gt = 1'b0;
				end
		endcase
	end
	
endmodule
