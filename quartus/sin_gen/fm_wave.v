//FM调制度最大频偏5kHz ---> pp：1 	最大频偏10kHz ---> pp：2
module fm_wave
(
	input clk,
	input rst_n,
	input clk_256k,
	input [31:0]pp,
	input [31:0]ftw,
	
	output [7:0]fm_out
);

wire [7:0] sin_out;//1kHz调制波
wire [7:0] addr;
reg [19:0] ftw_fm;
wire [27:0] N1;
wire [19:0] N;
wire [31:0] ftw1;

assign ftw1 = N + ftw;

wire [7:0] cnt;
	CNT256 u_CNT(
	.clk_256	(clk_256k),
	.reset_n	(rst_n),
	.q			(cnt)
	);

//得到1kHz调制波
ROM_sin fm_sin
(
	.address	(cnt),
	.clock	(clk_256k),
	.q			(sin_out)
);

//得到FM调制波
DDS fm_DDS
(
	.clk  	(clk),
	.rst_n	(rst_n),
	.fword	(ftw1),
	.addr		(addr)
);

ROM_sin fm_sin1
(
	.address	(addr),
	.clock	(clk),
	.q			(fm_out)
);


//-------------计算频偏控制字--------------//
always @(*)
	case(pp)
		32'd1 : ftw_fm = 20'd149131;//最大频偏5k
		32'd2 : ftw_fm = 20'd298262;//最大频偏10k
		default : ftw_fm = 20'd0;
	endcase
//计算得到对应频偏的频率控制字
assign N1 = sin_out * ftw_fm;
assign N = N1[27:8];

endmodule 

