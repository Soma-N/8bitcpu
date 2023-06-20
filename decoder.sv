module decoder(
		input wire [1:0] select,
		input wire p_m,
		input wire we,
		input wire im_st,
		input wire a, b, c,
		input wire carry,

		output wire [1:0] qselect,
		output wire qp_m,
		output wire qim_st,
		output wire qwe,
		output wire qa, qb, qc
	);

	assign qselect = select;
	assign qp_m = p_m;
	assign qim_st = im_st;
	assign qwe = we;

	assign qa = (a && b && c ) ? (carry ? 0 : 0) : a;
	assign qb = (a && b && c ) ? (carry ? 0 : 0) : b;
	assign qc = (a && b && c ) ? (carry ? 0 : 1) : c;

endmodule
