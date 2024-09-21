module CNT256(
	input clk_256,reset_n,
	output reg [7:0] q
);
always @(posedge clk_256 , negedge reset_n)
		if (!reset_n)
			q<=0;
		else 
			q <= q +1'b1;

endmodule
