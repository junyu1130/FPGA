module mux16_1
(
	input [3:0] sel,
	input [15:0] D,
	output Y
);

assign Y = D[sel];

endmodule
