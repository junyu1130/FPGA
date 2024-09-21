module de_roundFunc
(
	input clk,
	input rst_n,
	input [127 : 0] iBlockIn,
	input [127 : 0] iKeyValue,//轮密钥
	output [127 : 0] oBlockout
);

wire [127 : 0] wSubByte;

de_rowShift_subByte de_rowShift_subByte_inst1
(
	.clk(clk),
	.rst_n(rst_n),
	.iBlockIn(iBlockIn),
	.oBlockout(wSubByte)
);

de_keyAdd_colMix de_keyAdd_colMix_inst1
(
	.clk(clk),
	.rst_n(rst_n),
	.iBlockIn(wSubByte),
	.iKeyValue(iKeyValue),//轮密钥
	.oBlockout(oBlockout)
);

endmodule