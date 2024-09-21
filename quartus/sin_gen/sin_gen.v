module sin_gen(
	input clk,
	input rst_n,
	
	//spi输入
	input spi_mosi,
	input spi_cs_data,
	input spi_cs_cmd,
	input spi_sck,
	
	output reg [7:0] wave_out,
	output clk_out
);

wire clk_144M;
wire clk_256k;
//-----载波信号相关输出----//
wire [7:0] addr;
wire [31:0] ftw;
reg [63:0] freq;
reg	[31:0]depth,pp,al;

//-------定义spi相关变量--------//
wire [31:0]data;//FPGA接收到微处理器的数据
reg [31:0] data_reg;
wire [7:0]cmd;//FPGA接收到微处理器的命令
reg [7:0] cmd_reg;
wire cmd_done,data_done;//结束标志

//-------定义有关信号变量--------//
wire [7:0]sin_out,am_out,fm_out,ASK_out,PSK_out;   //


assign ftw = (freq<<32)/32'd144000000;    // 2^32/160M=26  25.6
assign clk_out = clk_144M;   //D/A时钟输出

PLL u_pll(
	.inclk0	(clk),
	.c0		(clk_144M),
	.c1		(clk_256k)
);      //获得基准时钟144M

//--与stm32进行SPI通信--//
spi spi_stm32(
	.rst(rst_n),
	.clk(clk),
	
	.spi_sdi(spi_mosi),   
	.spi_cs_data(spi_cs_data),  
	.spi_cs_cmd(spi_cs_cmd),
	.spi_sck(spi_sck),   
	
	.rxd_data(data),   
	.dcmd(cmd),
	
	.data_done(data_done),
	.cmd_done(cmd_done)
);

sin_wave u_sin_wave(
	.clk		(clk_144M),
	.rst_n		(rst_n),
	.ftw		(ftw),
	.al		(al),
	.sin_out	(sin_out)
);

//-------am调幅信号-------//
am_wave u_am_wave(
	.clk		(clk_256k),
//	.clk	(clk_144M),
	.rst_n	(rst_n),
	.carrier (sin_out),
	.depth	(depth),
	.am_out	(am_out)
//	.am_out	(wave_out)
);

//-------fm调频信号-------//
fm_wave u_fm_wave(
	.clk		(clk_144M),
	.clk_256k(clk_256k),
	.rst_n	(rst_n),
	.pp		(pp),
	.ftw     (ftw),
	.fm_out	(fm_out)
);

//-------ASK信号-------//
ask_wave u_ask_wave(
	.clk		(clk_144M),
	.rst_n	(rst_n),
	.sin_out (sin_out),
	.ASK_out	(ASK_out)
);

//-------PSK信号-------//
psk_wave u_psk_wave(
	.clk		(clk_144M),
	.rst_n	(rst_n),
	.sin_out (sin_out),
	.PSK_out	(PSK_out)
);

//-----检测相关判断-------//

//检测到cmd_done标志，得到控制命令
always@(*)
	if(!rst_n) cmd_reg = 0;
	else
		if(cmd_done) cmd_reg = cmd;
		else cmd_reg = cmd_reg;

//检测到data_done标志，得到数据
always@(*)
	if(!rst_n) data_reg = 0;
	else
		if(data_done) data_reg = data;
		else data_reg = data_reg;

//判断命令，进入不同的工作模式
always@(*)
	case (cmd_reg)  
		8'd1:	begin freq = data_reg; 	wave_out = sin_out; end
		8'd2:	begin	depth = data_reg; wave_out = am_out; end
		8'd3:	begin pp = data_reg; 	wave_out = fm_out; end
		8'd4:	begin 						wave_out = PSK_out; end
		8'd5:	begin 						wave_out = ASK_out; end
		8'd6:	begin al = data_reg; 	wave_out = sin_out; end
		default:	begin 					wave_out = 8'd0; end			
	endcase 

endmodule
