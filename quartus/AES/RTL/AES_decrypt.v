module AES_decrypt
(
	input clk,
	input rst_n,
	input [127 : 0] iKey,//密钥
	input [127 : 0] iCiphertext,//密文
	output [127 : 0] oPlaintext//明文
);

wire [127 : 0] wkeyExp_OutValue1,wkeyExp_OutValue2,wkeyExp_OutValue3,wkeyExp_OutValue4,
				wkeyExp_OutValue5,wkeyExp_OutValue6,wkeyExp_OutValue7,wkeyExp_OutValue8,
				wkeyExp_OutValue9,wkeyExp_OutValue10;
wire [127 : 0] wkeyExp_KeyValue1,wkeyExp_KeyValue2,wkeyExp_KeyValue3,wkeyExp_KeyValue4,
				wkeyExp_KeyValue5,wkeyExp_KeyValue6,wkeyExp_KeyValue7,wkeyExp_KeyValue8,
				wkeyExp_KeyValue9,wkeyExp_KeyValue10;

//密钥拓展流水线
keyExp keyExp_inst1
(
	.clk(clk),
	.rst_n(rst_n),
	.Rcon(32'h0100_0000),//当前级的Rcon
	.iBlockIn(iKey),
	.oKeyValue(wkeyExp_KeyValue1),//轮密钥
	.oBlockout(wkeyExp_OutValue1)
);

keyExp keyExp_inst2
(
	.clk(clk),
	.rst_n(rst_n),
	.Rcon(32'h0200_0000),//当前级的Rcon
	.iBlockIn(wkeyExp_OutValue1),
	.oKeyValue(wkeyExp_KeyValue2),//轮密钥
	.oBlockout(wkeyExp_OutValue2)
);

keyExp keyExp_inst3
(
	.clk(clk),
	.rst_n(rst_n),
	.Rcon(32'h0400_0000),//当前级的Rcon
	.iBlockIn(wkeyExp_OutValue2),
	.oKeyValue(wkeyExp_KeyValue3),//轮密钥
	.oBlockout(wkeyExp_OutValue3)
);

keyExp keyExp_inst4
(
	.clk(clk),
	.rst_n(rst_n),
	.Rcon(32'h0800_0000),//当前级的Rcon
	.iBlockIn(wkeyExp_OutValue3),
	.oKeyValue(wkeyExp_KeyValue4),//轮密钥
	.oBlockout(wkeyExp_OutValue4)
);

keyExp keyExp_inst5
(
	.clk(clk),
	.rst_n(rst_n),
	.Rcon(32'h1000_0000),//当前级的Rcon
	.iBlockIn(wkeyExp_OutValue4),
	.oKeyValue(wkeyExp_KeyValue5),//轮密钥
	.oBlockout(wkeyExp_OutValue5)
);

keyExp keyExp_inst6
(
	.clk(clk),
	.rst_n(rst_n),
	.Rcon(32'h2000_0000),//当前级的Rcon
	.iBlockIn(wkeyExp_OutValue5),
	.oKeyValue(wkeyExp_KeyValue6),//轮密钥
	.oBlockout(wkeyExp_OutValue6)
);

keyExp keyExp_inst7
(
	.clk(clk),
	.rst_n(rst_n),
	.Rcon(32'h4000_0000),//当前级的Rcon
	.iBlockIn(wkeyExp_OutValue6),
	.oKeyValue(wkeyExp_KeyValue7),//轮密钥
	.oBlockout(wkeyExp_OutValue7)
);

keyExp keyExp_inst8
(
	.clk(clk),
	.rst_n(rst_n),
	.Rcon(32'h8000_0000),//当前级的Rcon
	.iBlockIn(wkeyExp_OutValue7),
	.oKeyValue(wkeyExp_KeyValue8),//轮密钥
	.oBlockout(wkeyExp_OutValue8)
);

keyExp keyExp_inst9
(
	.clk(clk),
	.rst_n(rst_n),
	.Rcon(32'h1b00_0000),//当前级的Rcon
	.iBlockIn(wkeyExp_OutValue8),
	.oKeyValue(wkeyExp_KeyValue9),//轮密钥
	.oBlockout(wkeyExp_OutValue9)
);

keyExp keyExp_inst10
(
	.clk(clk),
	.rst_n(rst_n),
	.Rcon(32'h3600_0000),//当前级的Rcon
	.iBlockIn(wkeyExp_OutValue9),
	.oKeyValue(wkeyExp_KeyValue10),//轮密钥
	.oBlockout(wkeyExp_OutValue10)
);

//轮函数流水线

	//初始轮密钥加
wire [127 : 0] preKeyAddOut = iCiphertext ^ wkeyExp_KeyValue10;
	//-------------------------------------------------------------------------------	

wire [127 : 0] wDeRoundFunc_Out1,wDeRoundFunc_Out2,wDeRoundFunc_Out3,wDeRoundFunc_Out4,
				wDeRoundFunc_Out5,wDeRoundFunc_Out6,wDeRoundFunc_Out7,wDeRoundFunc_Out8,
				wDeRoundFunc_Out9;
			
de_roundFunc de_roundFunc_inst1
(
	.clk(clk),
	.rst_n(rst_n),
	.iBlockIn(preKeyAddOut),
	.iKeyValue(wkeyExp_KeyValue9),//轮密钥
	.oBlockout(wDeRoundFunc_Out1)
);

de_roundFunc de_roundFunc_inst2
(
	.clk(clk),
	.rst_n(rst_n),
	.iBlockIn(wDeRoundFunc_Out1),
	.iKeyValue(wkeyExp_KeyValue8),//轮密钥
	.oBlockout(wDeRoundFunc_Out2)
);

de_roundFunc de_roundFunc_inst3
(
	.clk(clk),
	.rst_n(rst_n),
	.iBlockIn(wDeRoundFunc_Out2),
	.iKeyValue(wkeyExp_KeyValue7),//轮密钥
	.oBlockout(wDeRoundFunc_Out3)
);

de_roundFunc de_roundFunc_inst4
(
	.clk(clk),
	.rst_n(rst_n),
	.iBlockIn(wDeRoundFunc_Out3),
	.iKeyValue(wkeyExp_KeyValue6),//轮密钥
	.oBlockout(wDeRoundFunc_Out4)
);

de_roundFunc de_roundFunc_inst5
(
	.clk(clk),
	.rst_n(rst_n),
	.iBlockIn(wDeRoundFunc_Out4),
	.iKeyValue(wkeyExp_KeyValue5),//轮密钥
	.oBlockout(wDeRoundFunc_Out5)
);

de_roundFunc de_roundFunc_inst6
(
	.clk(clk),
	.rst_n(rst_n),
	.iBlockIn(wDeRoundFunc_Out5),
	.iKeyValue(wkeyExp_KeyValue4),//轮密钥
	.oBlockout(wDeRoundFunc_Out6)
);

de_roundFunc de_roundFunc_inst7
(
	.clk(clk),
	.rst_n(rst_n),
	.iBlockIn(wDeRoundFunc_Out6),
	.iKeyValue(wkeyExp_KeyValue3),//轮密钥
	.oBlockout(wDeRoundFunc_Out7)
);

de_roundFunc de_roundFunc_inst8
(
	.clk(clk),
	.rst_n(rst_n),
	.iBlockIn(wDeRoundFunc_Out7),
	.iKeyValue(wkeyExp_KeyValue2),//轮密钥
	.oBlockout(wDeRoundFunc_Out8)
);

de_roundFunc de_roundFunc_inst9
(
	.clk(clk),
	.rst_n(rst_n),
	.iBlockIn(wDeRoundFunc_Out8),
	.iKeyValue(wkeyExp_KeyValue1),//轮密钥
	.oBlockout(wDeRoundFunc_Out9)
);

de_roundFunc_10 de_roundFunc_inst10
(
	.clk(clk),
	.rst_n(rst_n),
	.iBlockIn(wDeRoundFunc_Out9),
	.iKeyValue(iKey),//轮密钥
	.oBlockout(oPlaintext)//明文输出
);

endmodule