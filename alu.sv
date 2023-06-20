module alu(
		input wire [7:0] p,
		input wire [7:0] im,
		input wire [7:0] st,
		input wire p_m,
		input wire im_st,
		output wire [7:0] out,
		output wire carry
	);

	wire [7:0] r;
	wire [8:0] outpos; 

	assign r = im_st ? im : st;
	assign outpos = p_m ? p + r : p - r;

	assign out = outpos[7:0];
	assign carry = outpos[8];
endmodule

