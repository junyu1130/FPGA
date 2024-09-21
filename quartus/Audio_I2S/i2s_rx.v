//I2S rx
module i2s_rx(
	input clk,
    input audio_bclk,
    input audio_lrclk,
    input audio_sdata,
        
    output reg [23:0] audio_ldata,
    output reg [23:0] audio_rdata,
	output reg oStrobe
);

reg [23:0]	left;
reg [23:0]	right;
reg [23:0]	ldata;
reg [23:0]	rdata;
reg 		data_flag;	
reg			lrclk_delay;
wire		lrclk_fall;

assign lrclk_fall = !audio_lrclk & lrclk_delay;

//MSB在LRCLK延迟一个时钟后开始读取
always @(posedge audio_bclk) begin
	lrclk_delay <= audio_lrclk;

	if (!lrclk_delay)
		left <= {left[22:0], audio_sdata};
	else
		right <= {right[22:0], audio_sdata};
end

//LRCLK下降沿输出结果
always @(posedge audio_bclk) begin
	if (lrclk_fall) begin
		ldata <= left << 8;
		rdata <= ({right[22:0], audio_sdata}) << 8;
		data_flag <= 1;
	end
	else 
		data_flag <= 0;
end

reg [2:0] data_flag_delay;
//时钟区域转换,双跳技术同步
always @(posedge clk) begin
	data_flag_delay <= {data_flag_delay[1:0], data_flag};
	
	if (data_flag_delay[1] & !data_flag_delay[2]) begin
		audio_ldata <= ldata;
		audio_rdata <= rdata;
		oStrobe <= 1;
	end
	else 
		oStrobe <= 0;
end

endmodule
