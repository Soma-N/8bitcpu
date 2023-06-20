module ram
	(
		input wire clk,
		input wire we,
		input wire [7:0] addr1,
		input wire [7:0] addr2,
		input wire [7:0] in,
		output wire [7:0] out1,
		output wire [7:0] out2,
		output wire [7:0] out3
	);

	reg [7:0] mem [255:0];

	always @(posedge clk) begin
		if (we) begin
			mem[addr2] = in;
		end
	end

	assign out1 = mem[addr1];
	assign out2 = mem[addr1 + 1];
	assign out3 = mem[addr2];

endmodule
