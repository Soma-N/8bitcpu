module register
	(
		input wire clk,
		input wire ld,
		input wire [7:0] in,
		output reg [7:0] out
	);

	always @(posedge clk) begin
		if(ld == 1'b1) begin
			out = in;
		end
	end

endmodule

