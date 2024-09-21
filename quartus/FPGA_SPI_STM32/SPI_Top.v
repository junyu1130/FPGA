//SCK空闲状态为高电平，在CS拉低使能情况下,上升沿采样数据,下降沿发送数据
//			FPGA			    						stm32
//spi_cs_data    		PIN_A3	    	SPI4_CS   -----> PA.0   		片选信号
//spi_sck        		PIN_A4       	SPI4_CLK  -----> PA.3   		时钟信号
//spi_mosi	       	PIN_A5	    	SPI4_MOSI -----> PA.2		 	单片机输出，fpga输入							
//spi_miso	      	PIN_A6	    	SPI4_MISO -----> PA.1           单片机输入，fpga输出


module SPI_Top(
	input	RSTn,	//系统复位	
	input	CLK_50M,	//系统时钟
	
	input	spi_mosi,	//微处理器发送数据,FPGA接收
	
	input	spi_cs_data,	//数据片选端
	input	spi_sck,	//spi时钟线

	input [3:0]key_in,
	
	output [7:0]SMG_Data,
	output [5:0]Scan_Sig,
	output spi_miso

);

wire [15:0]rxd_data;//2进制数据
reg [23:0]Number_Data;//存BCD码
wire data_done;
wire [3:0]flag_key;//flag=1代表被按下了 0-rst 1-key1(+1数据) 2-key2（-1数据） 3-key3
reg [15:0]rxd_data_r;

PLL100M	PLL100M_inst (
	.inclk0 ( CLK_50M ),
	.c0 ( CLK_100M )
	);
	
	


spi spi_stm32(
	.rst(RSTn),
	.clk(CLK_100M),
	
	.spi_sdi(spi_mosi),
	.spi_sdo(spi_miso),
	
	.spi_cs_data(spi_cs_data),
	.spi_cs_cmd(),
	.spi_sck(spi_sck),
	
	.txd_data(rxd_data_r),
	.rxd_data(rxd_data),
	.dcmd(),
	
	.data_done(data_done),
	.cmd_done()
);

always @(posedge CLK_100M or negedge RSTn)
begin
	if(!RSTn)
		begin
			Number_Data = 16'b0;
		end
	else if(flag_key[1])//+1
		begin
			rxd_data_r = rxd_data_r + 1'b1;
			Number_Data[3:0] = rxd_data_r%10;//个位
			Number_Data[7:4] = rxd_data_r/10%10;//十位
			Number_Data[11:8] = rxd_data_r/100%10;//百位
			Number_Data[15:12] = rxd_data_r/1000%10;//千位
			Number_Data[19:16] = rxd_data_r/10000%10;//万位
		end
	else if(flag_key[2])//-1
		begin
			rxd_data_r = rxd_data_r - 1'b1;
			Number_Data[3:0] = rxd_data_r%10;//个位
			Number_Data[7:4] = rxd_data_r/10%10;//十位
			Number_Data[11:8] = rxd_data_r/100%10;//百位
			Number_Data[15:12] = rxd_data_r/1000%10;//千位
			Number_Data[19:16] = rxd_data_r/10000%10;//万位
		end
	else//无按键按下
		begin
			if(data_done&&rxd_data!=16'hFFFF)
				begin
					rxd_data_r = rxd_data;
					Number_Data[3:0] = rxd_data_r%10;//个位
					Number_Data[7:4] = rxd_data_r/10%10;//十位
					Number_Data[11:8] = rxd_data_r/100%10;//百位
					Number_Data[15:12] = rxd_data_r/1000%10;//千位
					Number_Data[19:16] = rxd_data_r/10000%10;//万位
				end
			else
				begin
					Number_Data = Number_Data;
				end
		end
end


smg_interface smg_stm32_data
(
	.CLK( CLK_100M ),
	.RSTn( RSTn ),
	.Number_Sig( Number_Data ),
	.SMG_Data( SMG_Data ),//输出段选信号（ LEDA .. LEDH）
	.Scan_Sig( Scan_Sig )//输出列扫描信号（ SEL0_T~SEL5_T）
);


key key_stm32
(
	.clk(CLK_100M), 
	.key_in(key_in),
	.flag_key(flag_key)//flag=1代表被按下了
);


endmodule 












