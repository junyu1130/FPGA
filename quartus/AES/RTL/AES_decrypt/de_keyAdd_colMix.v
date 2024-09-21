module de_keyAdd_colMix
(
	input clk,
	input rst_n,
	input [127 : 0] iBlockIn,
	input [127 : 0] iKeyValue,//轮密钥
	output [127 : 0] oBlockout
);

wire [127 : 0] wKeyAddOut;

//先轮密钥加
assign wKeyAddOut = iBlockIn ^ iKeyValue;//由于字节替换的初始位置有寄存器，
											//所以这里不再加入寄存器

//列混淆
de_subColMix de_subColMix_inst0//列1
(
	.iBlockIn(wKeyAddOut[127 : 96]),
	.oBlockout(oBlockout[127 : 96])
 );
 
de_subColMix de_subColMix_inst1//列2
(
	.iBlockIn(wKeyAddOut[95 : 64]),
	.oBlockout(oBlockout[95 : 64])
 );

de_subColMix de_subColMix_inst2//列3
(
	.iBlockIn(wKeyAddOut[63 : 32]),
	.oBlockout(oBlockout[63 : 32])
 );
 
de_subColMix de_subColMix_inst3//列4
(
	.iBlockIn(wKeyAddOut[31 : 0]),
	.oBlockout(oBlockout[31 : 0])
 );

endmodule