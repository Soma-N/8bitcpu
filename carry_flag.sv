module carry_flag(
		input wire in,
		input wire clk,
		output reg carry
	);

	always @(posedge clk) begin
		if(in) begin
			carry <= in;
		end
		else begin
			carry <= 1'b0;
		end
	end
endmodule

