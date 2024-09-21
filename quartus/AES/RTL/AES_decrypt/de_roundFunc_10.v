module de_roundFunc_10
(
	input clk,
	input rst_n,
	input [127 : 0] iBlockIn,
	input [127 : 0] iKeyValue,//轮密钥
	output reg [127 : 0] oBlockout
);

wire [127 : 0] wSubByte;

de_rowShift_subByte de_rowShift_subByte_inst1
(
	.clk(clk),
	.rst_n(rst_n),
	.iBlockIn(iBlockIn),
	.oBlockout(wSubByte)
);


always @(posedge clk or negedge rst_n)begin
	if(!rst_n)
		oBlockout <= 0;
	else
		oBlockout <= wSubByte ^ iKeyValue;
end

endmodule