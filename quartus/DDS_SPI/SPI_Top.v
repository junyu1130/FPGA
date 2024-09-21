//SCK空闲状态为高电平，在CS拉低使能情况下,上升沿采样数据,下降沿发送数据
//			FPGA			    						stm32
//spi_sck        		PIN_A3       	SPI_SCK  		-----> PB.3   		时钟信号
//spi_cs_cmd    		PIN_A4	    	SPI_CMD_CS   	-----> PB.4   		命令片选信号
//spi_cs_data    		PIN_A5	    	SPI_DATA_CS   	-----> PB.5   		数据片选信号		
//spi_mosi	       	PIN_A6	    	SPI_MOSI		 	-----> PB.6		 	单片机输出，fpga输入		
module SPI_Top
(
	input	rst_n,	//系统复位	
	input	CLK_50M,	//系统时钟
	
	input	spi_mosi,		//微处理器发送数据,FPGA接收
	input	spi_cs_data,	//数据片选端
	input	spi_cs_cmd,		//命令片选端
	input	spi_sck,			//spi时钟线
	
	output [7:0] SMG_Data,
	output [5:0] Scan_Sig,
	
	output [13:0] wave_out,
	output dac_clk,
	output reg [7:0] cmd_r
);

wire [7:0] cmd;//接收到的命令
wire [31:0] data;//接收到的数据
wire data_done;//结束标志
wire cmd_done;
wire [13:0] sin_out;
reg [31:0] rxd_data_r;

reg [23:0] Number_Data;//存BCD码

//-----载波信号相关输出----//
wire [7:0] addr;
wire [31:0] ftw;
wire [31:0] freq;
wire clk_100M;

assign freq = rxd_data_r;
assign ftw = freq * 9'd43;    // 2^32/100M=43
assign wave_out = sin_out;
assign dac_clk = clk_100M;

PLL u_pll(
	.inclk0	(CLK_50M),
	.c0		(clk_100M)
); 

DDS u_DDS(
	.clk  	(clk_100M),
	.rst_n	(rst_n),
	.fword	(ftw),
	.addr		(addr)
);

ROM_sin rom_sin(
	.address	(addr),
	.clock	(clk_100M),
	.q			(sin_out[13:0])
);

spi spi_stm32(
	.rst(rst_n),
	.clk(CLK_50M),
	
	.spi_sdi(spi_mosi),
	.spi_cs_data(spi_cs_data),
	.spi_cs_cmd(spi_cs_cmd),
	.spi_sck(spi_sck),
	
	.rxd_data(data),
	.dcmd(cmd),
	
	.data_done(data_done),
	.cmd_done(cmd_done)
);

smg_interface smg_stm32_data
(
	.CLK( CLK_50M ),
	.RSTn( rst_n ),
	.Number_Sig( Number_Data ),
	.SMG_Data( SMG_Data ),//输出段选信号（ LEDA .. LEDH）
	.Scan_Sig( Scan_Sig )//输出列扫描信号（ SEL0_T~SEL5_T）
);

always @(*)
	if(!rst_n) cmd_r = 0;
	else
		if(cmd_done) cmd_r = cmd;
		else cmd_r = cmd_r;

always @(posedge clk_100M or negedge rst_n)
begin
	if(!rst_n)
	begin
		Number_Data = 0;
		rxd_data_r = 0;
	end
	else
	begin
		if(data_done)
		begin
			rxd_data_r = data;
		end
		else
		begin
			rxd_data_r = rxd_data_r;
			Number_Data[3:0] = ftw%10;//个位
			Number_Data[7:4] = ftw/10%10;//十位
			Number_Data[11:8] = ftw/100%10;//百位
			Number_Data[15:12] = ftw/1000%10;//千位
			Number_Data[19:16] = ftw/10000%10;//万位
		end
	end
end

endmodule 

