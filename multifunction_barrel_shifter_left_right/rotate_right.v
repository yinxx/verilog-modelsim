module rotate_right
	(
		input wire [7:0] a,
		input wire [2:0] amt,
		output reg [7:0] y
	);

	// Body
	always @*
		case (amt)
			3'o0: y = a;
			3'o1: y = {a[6:0], a[7]};
			3'o2: y = {a[5:0], a[7:6]};
			3'o3: y = {a[4:0], a[7:5]};
			3'o4: y = {a[3:0], a[7:4]};
			3'o5: y = {a[2:0], a[7:3]};
			3'o6: y = {a[1:0], a[7:2]};
			default: y = {a[0], a[7:1]};
		endcase
	
endmodule
