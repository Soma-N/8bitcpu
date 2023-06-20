module reg_pc(
		input wire clk,
		input wire ld,
		input wire [7:0] in,
		output reg [7:0]  out
	);

	always @(posedge clk) begin
		if(ld == 1'b1) begin
			out = in;
		end
		else begin
			out = out + 2'b10;
		end
	end
endmodule
