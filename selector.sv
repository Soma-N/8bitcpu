module selector(
		input wire [7:0] a,
		input wire [7:0] b,
		input wire [1:0] select,
		output wire [7:0] out
	);

	assign out = (select[1] == 1'b1) ? 9'b00000000 :
			  ((select[0] == 1'b1) ? b : a);

endmodule
