module cpu;
	
	reg clk;

	wire [7:0] a_sel;
	wire [7:0] sp_out;
	wire [7:0] pc_out;
	wire [7:0] selected;
	wire [7:0] calculated;
	wire [7:0] im;
	wire [7:0] st;

	wire [7:0] text;
	wire [1:0] ope_sel;
	wire ope_p_m;
	wire ope_we;
	wire ope_im_st;
	wire ope_lda;
	wire ope_ldsp;
	wire ope_ldpc;

	assign  ope_sel = text[7:6];
	assign ope_p_m = text[5];
	assign ope_we = text[4];
	assign ope_im_st = text[3];
	assign ope_lda = text[2];
	assign ope_ldsp = text[1];
	assign ope_ldpc = text[0];

	wire [1:0] select;
	wire p_m, im_st;
	wire we;
	wire lda, ldsp, ldpc;

	wire dec_carry;
	wire carry;

	register reg_a(
		.clk(clk),
		.ld(lda),
		.in(calculated),
		.out(a_sel)
	);

	register reg_sp(
		.clk(clk),
		.ld(ldsp),
		.in(calculated),
		.out(sp_out)
	);

	reg_pc reg_pc(
		.clk(clk),
		.ld(ldpc),
		.in(calculated),
		.out(pc_out)
	);

	ram ram(
		.clk(clk),
		.we(we),
		.addr1(pc_out),
		.addr2(sp_out),
		.in(calculated),
		.out1(text),
		.out2(im),
		.out3(st)
	);

	selector selector(
		.a(a_sel),
		.b(sp_out),
		.select(select),
		.out(selected)
	);

	decoder decoder(
		.select(ope_sel),
		.p_m(ope_p_m),
		.we(ope_we),
		.im_st(ope_im_st),
		.a(ope_lda),
		.b(ope_ldsp),
		.c(ope_ldpc),
		.carry(dec_carry),
		.qselect(select),
		.qp_m(p_m),
		.qim_st(im_st),
		.qwe(we),
		.qa(lda),
		.qb(ldsp),
		.qc(ldpc)
	);

	alu alu(
		.p(selected),
		.im(im),
		.st(st),
		.p_m(p_m),
		.im_st(im_st),
		.out(calculated),
		.carry(carry)
	);

	carry_flag carry_flag(
		.in(carry),
		.clk(clk),
		.carry(dec_carry)
	);

endmodule
